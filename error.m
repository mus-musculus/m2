
import "C"
import "cfg"
import "ascii"
import "types"
/////////////////////////////////////////////////////////////////////////////////////
// m2/error


// warning & error counters
//var warncnt, errcnt : Nat

warncnt = 0 to Var Nat
errcnt = 0 to Var Int32


/*
 * Console Text Color Codes
 */
cRed  = 31
cGreen = 32
cYellow = 33
cBlue = 34
cMagenta = 35
cCyan = 36


/*
 * Colors
 */
cInfo = cCyan
cWarning = cBlue
cError = cMagenta
cFatal = cRed


bufSize = 512


exist show : (ti : *TokenInfo) -> ()


txt = (as : Str, color : Nat8, text : Str) -> () {
  printf("\n%c[0;%dm%s:%c[0m %s", ascii_ESC, color, as, ascii_ESC, text)
}

txti = (as : Str, color : Nat8, ti : *TokenInfo, text : Str) -> () {
  printf("\n%c[0;%dm%s%c[0m (%s:%d) : %s", ascii_ESC, color, as, ascii_ESC, ti.file, ti.line, text)
}


info = (s : Str, ti : *TokenInfo) -> () {
  if ti != nil {
    txti("info", cInfo, ti, s)
    show(ti)
  } else {
    txt("info", cInfo, s)
  }

  printf("\n")
}


warning = (s : Str, ti : *TokenInfo) -> () {
  if ti != nil {
    txti("warning", cWarning, ti, s)
    show(ti)
  } else {
    txt("warning", cWarning, s)
  }

  printf("\n")
  warncnt := warncnt + 1
  if errcnt > cfgMaxWarn {
    printf("*** STOP ***\n")
    exit(1)
  }
}


error = (s : Str, ti : *TokenInfo) -> () {
  if ti == nil {
    txt("error", cError, s)
  } else {
    txti("error", cError, ti, s)
    show(ti)
  }

  printf("\n")
  errcnt := errcnt + 1
  if errcnt > cfgMaxErr {
    printf("*** STOP ***\n")
    exit(1)
  }
}


rem = (s : Str, ti : *TokenInfo) -> () {
  printf("\n%c[0;%dm%s%c[0m", ascii_ESC, cYellow, s, ascii_ESC)
  if ti != nil {
    show(ti)
    printf("\n")
  }
}


// get line from source file (for error displaying)
gline = (line : Str, ti : *TokenInfo) -> () {
  fd = open(ti.file, c_O_RDONLY)
  if fd < 0 {return}
  lineno = ti.line
  linecnt = 1 to Var Nat32
  pos = 0 to Var Nat32
  c = 0 to Var Nat8
  while true {
    if linecnt == lineno {
      while true {
        if read(fd, &c, 1) == 0 {goto exit}
        line[pos] := c
        pos := pos + 1
        if c == "\n"[0] {
          goto exit
        }
      }
    } else {
      read(fd, &c, 1)
      if c == "\n"[0] {
        linecnt := linecnt + 1
      }
    }
  }

exit:
  close(fd)
  line[pos] := 0
  return
}


show = (ti : *TokenInfo) -> () {
  printf("\n")
  line = 0 to Var [bufSize]Nat8
  memset(&line[0], 0, bufSize)
  gline(&line, ti)
  printf("%s", &line[0])
  vpos = 1 to Var Nat16
  while vpos < ti.start {
    printf(" ")
    vpos := vpos + 1
  }
  printf("%c[0;%dm^%c[0m", ascii_ESC, cGreen, ascii_ESC)
}


fatal = (s : Str) -> () {
  txt("fatal", cFatal, s)
  exit(1)
}

