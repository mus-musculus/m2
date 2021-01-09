/* ! выгоднее использовать список токенов и ссылаться из узлов AST на них,
   чем дергать по одному токену тк тогда придется все хранить в AST и передавать по
   значению что не гут вообще в конечном счете получается ! */

import "C"
import "sys/fs"
import "sys/path"
import "ascii"
import "data/list"

import "types"
import "error"

exist lex_putback : (c : Nat8) -> ()
exist linecnt : () -> ()
exist xslash : () -> ()
exist string : () -> ()


symEOF = 0  // getcc returns EOF when file is over


lstate = 0 to Var LexerState


lex_init = (fname : Str) -> () {
  if not exists (fname) {
    printf ("module=%s\n", fname)
    fatal ("module not exist")
  }

  lstate.fd := open (fname, c_O_RDONLY)
  lstate.ti.file := fname
  lstate.ti.line := 1
  lstate.pos := 1
}


getcc = () -> Nat8 {
  c = symEOF to Var Nat8
  if lstate.ch != 0 {
    c := lstate.ch
    lstate.ch := 0
  } else {
    len = read (lstate.fd, &c, 1)
    if len == 0 {return symEOF}
    lstate.pos := lstate.pos + 1
  }
  return c
}


Rule = (c : Nat8) -> Bool


// fill token while `rule` is true
fill = (rule : Rule) -> () {
  while true {
    c = getcc ()
    if c == symEOF {
      fatal ("unexpected end-of-file")
      exit (1)
    }

    if rule(c) {
      lstate.token[lstate.ti.length] := c
      if (lstate.ti.length >= (tokenMaxLen - 1)) {
        fatal("too long token\n")
      }
      lstate.ti.length := lstate.ti.length + 1
    } else {
      lex_putback (c)
      lstate.token[lstate.ti.length] := 0
      break
    }
  }
}


blank = Rule {return c == " "[0] or c == "\t"[0]}
minus = Rule {return c == ">"[0]}
slash = Rule {return c == "/"[0] or c == "*"[0]}
rarrow = Rule {return c == ">"[0] or c == "="[0]}
larrow = Rule {return c == "<"[0] or c == "="[0]}
eq = Rule {return c == "="[0] or c == ">"[0]}
ass = Rule {return c == "="[0]}
bang = Rule {return c == "="[0]}
id = Rule {return isAlNum (c) or c == "_"[0] or c == "-"[0]}
digit = Rule {return isAlNum (c)}
cpp_com = Rule {return c != "\n"[0]}

/* комментарии это тоже токены */

x_nl = () -> () {lstate.kind := #TokenNL}
x_eof = () -> () {
  lstate.kind := #TokenEOF
  lstate.token[0] := 0
  lstate.ti.length := 0
}

getToken = () -> TokenKind {
  c = 0 to Var Nat8

  /* если ПРЕДЫДУЩИЙ токен был NL - инкрементим номер строки */
  if lstate.kind == #TokenNL {
    linecnt ()
    lstate.pos := 0
  }

  lstate.kind := #TokenEOF
  lstate.ti.length := 0

  /* skip blanks and get first char */
  while true {
    c := getcc ()
    if not blank (c) {break}
  }

  // фиксируем стартовую позицию нового токена
  lstate.ti.start := lstate.pos

  // получаем смещение от начала файла для этого токена
  lstate.ti.offset := lseek (lstate.fd, 0, c_SEEK_CUR) to Nat64

  lstate.token[0] := c
  lstate.ti.length := 1

  if isAlpha (c) or c == "_"[0] or c == "#"[0] {
    /*** IDENTIFIERS ***/
    lstate.kind := #TokenId
    fill (id)
  } else if isDigit (c) {
    /*** NUMBERS ***/
    lstate.kind := #TokenNum
    fill (digit)
  } else {
    /*** SYMBOLS, COMMENTS, STRINGS ***/
    lstate.kind := #TokenSym

    select c {
      "\n"[0] => x_nl   ()
      ":"[0]  => fill   (ass)
      "="[0]  => fill   (eq)
      "-"[0]  => fill   (minus)
      "/"[0]  => xslash ()
      ">"[0]  => fill   (rarrow)
      "<"[0]  => fill   (larrow)
      "!"[0]  => fill   (bang)
      "\""[0] => string ()
      symEOF  => x_eof  ()
      else => () -> () {} ()
    }
  }

  lstate.token[lstate.ti.length] := 0

  return lstate.kind
}


/* xslash вернет False в том случае если он обработал C-style comment
   и ему нечего вернуть. -> нам нужно опять сходить за токеном */
xslash = () -> () {
  c = 0 to Var Nat8
  nextok = getcc ()  // maybe '/' or '*' ?

  if nextok == "/"[0] {
    lex_putback (nextok)
    fill (cpp_com)
    lstate.kind := #TokenComment

  } else if nextok == "*"[0] {
    lstate.kind := #TokenComment
    lstate.token[0] := 0
    while true {
      c := getcc ()

      if c == symEOF {
        fatal("unexpected end-of-file")
      } else if c == "*"[0] {
        c := getcc ()
        if c == "/"[0] {
          // C-style comment ended
          lstate.token[lstate.ti.length] := 0
          return
        } else {
          lex_putback (c)
        }
      } else if c == "\n"[0] {
        linecnt ()
      }
      // эти комментарии бывают ООЧЕНь большими
      // и размещать их в токене просто так не получится.
      // нужно писать в буфер
      //printf("%c", c)
      //lstate.token[lstate.ti.length] = c
      //lstate.ti.length = lstate.ti.length + 1
    }
  } else {
    lex_putback (nextok)  // this is not a comment
    fill (slash)
  }
}


string = () -> () {
  c = 0 to Var Nat8
  lstate.kind := #TokenString
  lstate.ti.length := 0  // skip first "

  while true {
    c := getcc ()
    if c == "\""[0] {
      break
    } else if c == symEOF {
      fatal ("unexpected end-of-file")
    } else {
      if c == "\\"[0] {
        /* ESACPE-symbols */
        c := getcc ()

        c := select c {
          "n"[0] => "\n"[0]
          "r"[0] => "\r"[0]
          "t"[0] => "\t"[0]
          "\\"[0] => "\\"[0]
          "\""[0] => "\""[0]
          "0"[0] => "\0"[0]
          "a"[0] => "\a"[0]
          "b"[0] => "\b"[0]
          "v"[0] => "\v"[0]
          else => c
        }
      }
    }

    if lstate.ti.length >= (tokenMaxLen - 1) {
      fatal("too long string\n")
    }

    lstate.token[lstate.ti.length] := c
    lstate.ti.length := lstate.ti.length + 1
  }
}


// токенизируем файл в список (включая #TokenEOF)
tokenize = (filename : Str) -> *Source {

  src = malloc (sizeof Source) to *Source
  list_init (&src.tokens)

  lex_init (filename)

  while true {
    tt = getToken ()
    len = lstate.ti.length + 1
    t = malloc (sizeof Token + len to Nat32) to *Token
    t.kind := lstate.kind
    t.ti.length := lstate.ti.length
    t.ti.file := lstate.ti.file
    t.ti.line := lstate.ti.line
    t.ti.start := lstate.ti.start
    memcpy (&t.text, &lstate.token, len to Size_T)
    t.text[len + 1] := 0
    list_append (&src.tokens, t)
    if tt == #TokenEOF {break}
  }

  lines := lines + lstate.ti.line

  return src
}


linecnt = () -> () {lstate.ti.line := lstate.ti.line + 1}
lex_putback = (c : Nat8) -> () {lstate.ch := c}



