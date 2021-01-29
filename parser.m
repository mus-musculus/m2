


pstat = 0 to Var ParserState
external = false to Var Bool
comments = false to Var Bool  // ловим комментарии?
xarghack = false to Var Bool


exist match : (s : Str) -> Bool
exist ctok : () -> *Token
exist separator : () -> Bool
exist parse_import : () -> *AstNode
exist parse_decl : (arghack : Bool) -> *AstDecl
exist ast_value_new : (x : AstValue) -> *AstValue
exist parse_bind_type : () -> *AstNodeBindType
exist parse_bind_value : () -> *AstNodeBindValue

exist parse_type : () -> *AstType
exist parse_value : () -> *AstValue

exist is_it_type : () -> Bool
exist is_it_value_record : () -> Bool

// возвращает ноду текущего токена
gett = () -> *Node {return pstat.token_node}
// устанавливает ноду текущего токена
sett = (tn : *Node) -> () {pstat.token_node := tn}

// skip current token
skip = () -> () {pstat.token_node := pstat.token_node.next}

// skip while NL
skip_nl = () -> () {while match("\n") {/* skip */}}


ctok = () -> *Token {
  token = gett().data to *Token
  if not comments {
    if token.kind == #TokenComment {
      skip()
      return ctok()
    }
  }
  return token
}


eof = () -> Bool {return ctok().kind == #TokenEOF}

// дает ссылку на следующий токен НЕ сдвигая курсор с текущего
nextok = () -> *Token {
  if gett().next != nil {
    return gett().next.data to *Token
  }
  return nil
}


/*
 * Вызывается тогда, когда ожидаем обнаружить символ-разделитель.
 * Если все ок и разделитель присутствует - возвращает 1
 * Если разделителя нет - выводит ошибку и возвращает 0
 */
need_sep = () -> Bool {
  ct = ctok()
  s = separator()

  if s == false {
    error("expected separator", &ct.ti)
  }

  return s
}


separator = () -> Bool {
  ct = ctok().text[0]
  if ct == "\n"[0] or ct == ";"[0] {skip(); return true}
  // если за нами закрывается скобка - сепаратор не нужен
  if ct == "}"[0] or ct == ")"[0] {return true}
  return false
}

need_comma_or_nl = () -> () {
  ti = &ctok().ti
  if match(",") {return}
  if match("\n") {return}
  error("expected comma or new line", ti)
}


skipto = (s : Str) -> () {
  error("lex::skipto not implemented\n", nil)
  printf("tok = '%s'\n", &ctok().text)
  printf("skip_target = %s\n", s)
  exit(1)
}


look = (s : Str) -> Bool {
  tok = ctok()
  tt = tok.kind
  if tt == #TokenString or tt == #TokenEOF {
    return false
  }

  return strcmp(s, &tok.text to Str) == 0
}


match = (s : Str) -> Bool {
  rc = look(s)
  if rc {skip()}
  return rc
}




need = (s : Str) -> Bool {
  rc = match(s)
  if rc == false {
    /*if t[0] == "\n"[0] {
      t = "NL";
    }*/

    t = ctok()
    error("unexpected symbol", &t.ti)
    printf("expected %s\n", s)
    skip()
  }
  return rc
}


ast_id_new = (str : Str, ti : *TokenInfo) -> *AstId {
  id = malloc(sizeof AstId) to *AstId
  assert(id != nil, "ast_id_new")
  *id := (str=str, ti=ti)
  return id
}

// returns Str or nil
parse_id = () -> *AstId {
  tok = ctok()
  if tok.kind != #TokenId {
    error("expected id1", &tok.ti)
    return nil
  }

  id = ast_id_new(&tok.text[0] to Str, &tok.ti)
  skip()
  return id
}


parse_name = () -> AstName {
  n = 0 to Var AstName
  n.ti := &ctok().ti

  n0 = parse_id()

  if match(".") {
    n.id := parse_id()
    n.namespace := n0
  } else {
    n.id := n0
    n.namespace := nil
  }

  return n
}


/*****************************************************************************/
/*                            Parse Module                                   */
/*****************************************************************************/

ast_node_new = (kind : AstNodeKind, entity : *Unit) -> *AstNode {
  n = malloc (sizeof AstNode) to *AstNode
  assert(n != nil, "ast_node_new")
  *n := (kind=kind, entity=entity)
  return n
}

parse = (filename : Str) -> *AstModule or Unit {
  m = malloc(sizeof AstModule) to *AstModule
  memset(m, 0, sizeof AstModule)
  list_init(&m.nodes)

  pstat.src := tokenize(filename)

  pstat.token_node := pstat.src.tokens.first

  while true {
    tok = ctok()

    if tok.kind == #TokenEOF {break}
    if tok.kind == #TokenNL {skip(); continue}
    if tok.kind == #TokenComment {skip(); continue}

    // firstly, do imports
    if match("import") {
      imp = parse_import()  // #AstNodeImport
      list_append(&m.nodes, imp)
      continue
    } else {
      break
    }
  }

  while true {
    tok = ctok()

    if tok.kind == #TokenEOF {break}
    if tok.kind == #TokenNL {skip(); continue}
    if tok.kind == #TokenComment {skip(); continue}

    xarghack = match("arghack")

    /*if match("var") {
      dv = malloc(sizeof AstNodeDeclVar) to *AstNodeDeclVar
      dv.decl := parse_decl(false)
      list_append(&m.nodes, ast_node_new(#AstNodeDeclVar, dv))
      continue
    } else*/
    if match("exist") {
      tok = ctok()
      if isUpperCase(tok.text[0]) {
        // exist <Id>  // exist type
        id = parse_id()
        dv = malloc(sizeof AstNodeDeclType) to *AstNodeDeclType
        dv.id := id
        list_append(&m.nodes, ast_node_new(#AstNodeDeclType, dv))
      } else {
        // exist <id> : <Type>  // exist value
        dv = malloc(sizeof AstNodeDeclVar) to *AstNodeDeclVar
        dv.decl := parse_decl(false)
        list_append(&m.nodes, ast_node_new(#AstNodeDeclValue, dv))
      }
      continue
    } else if match("extern") {
      decl = parse_decl(false)

      decl.type.func.arghack := xarghack

      v = ast_value_new ((type=decl.type, block_stmt=unit) to AstValueFunc)

      bv = malloc(sizeof AstNodeBindValue) to *AstNodeBindValue
      *bv := (id=decl.ids.first.data to *AstId, value=v, ti=decl.ti)
      list_append(&m.nodes, ast_node_new(#AstNodeBindValue, bv))
      continue
    }


    if isAlpha (tok.text[0]) {
      if isUpperCase (tok.text[0]) {
        bt = parse_bind_type ()
        list_append (&m.nodes, ast_node_new(#AstNodeBindType, bt))
      } else {
        bv = parse_bind_value ()
        list_append (&m.nodes, ast_node_new(#AstNodeBindValue, bv))
      }
    }

  }

  if errcnt > 0 {return unit}
  return m
}


parse_import = () -> *AstNode {
  i = malloc(sizeof AstNodeImport) to *AstNodeImport
  tk = ctok()
  i.line := dup(&tk.text[0] to Str)
  i.ti := &tk.ti
  skip()
  return ast_node_new(#AstNodeImport, i)
}


parse_bind_type = () -> *AstNodeBindType {
  id = parse_id()
  ti = &ctok().ti
  need("=")
  t = parse_type()

  bt = malloc(sizeof AstNodeBindType) to *AstNodeBindType
  *bt := (id=id, type=t, ti=ti)
  return bt
}


parse_bind_value = () -> *AstNodeBindValue {
  id = parse_id()
  ti = &ctok().ti
  need("=")
  v = parse_value()

  bv = malloc(sizeof AstNodeBindValue) to *AstNodeBindValue
  *bv := (id=id, value=v, ti=ti)
  return bv
}


/*****************************************************************************/
/*                             Parse Type                                    */
/*****************************************************************************/

ast_type_new = (kind : AstTypeKind, x : AstType2, ti : *TokenInfo) -> *AstType {
  t = malloc(sizeof AstType) to *AstType
  assert(t != nil, "parse_type malloc")
  *t := (kind=kind, ti=ti, data=x)
  return t
}

AstTypeParser = () -> *AstType

exist parse_type_ptr   : AstTypeParser
exist parse_type_set   : AstTypeParser
exist parse_type_rec   : AstTypeParser
exist parse_type_array : AstTypeParser

exist parse_type   : AstTypeParser
exist parse_type0  : AstTypeParser
exist parse_type1  : AstTypeParser
exist parse_type2  : AstTypeParser
exist parse_type3  : AstTypeParser
exist parse_type4  : AstTypeParser



parse_type0 = AstTypeParser {
  t = parse_type1()

  tk = ctok()
  if match("->") {
    from = t
    _to = parse_type()

    ft = ast_type_new(#AstTypeFunc, (from=from, to=_to, ti=&tk.ti) to AstTypeFunc, &tk.ti)
    ft.func := (from=from, to=_to, ti=&tk.ti)
    return ft
  }

  return t
}

parse_type1 = AstTypeParser {
  t = parse_type2()

  tk = ctok()
  if match("or") {

    types = 0 to Var List
    list_init(&types)

    list_append(&types, t)

    skip_nl()
    t = parse_type2()

    list_append(&types, t)

    while match("or") {
      skip_nl()
      t = parse_type2()
      list_append(&types, t)
    }

    tx = ast_type_new(#AstTypeUnion, (types=types, ti=&tk.ti) to AstTypeUnion, &tk.ti)
    tx.union.types := types
    return tx
  }

  return t
}

parse_type2 = AstTypeParser {
  tk = ctok()
  if match("*") {
    pointer_to = parse_type2()

    t = ast_type_new(#AstTypePointer, (to=pointer_to, ti=&tk.ti) to AstTypePointer, &tk.ti)
    t.pointer := (to=pointer_to, ti=&tk.ti)
    return t
  } else if match("[") {

    if match("]") {
      of = parse_type2()
      t = ast_type_new(#AstTypeArrayU, (of=of, ti=&tk.ti) to AstTypeArrayU, &tk.ti)
      t.array_u := (of=of, ti=&tk.ti)
      return t
    }

    size = parse_value()
    need("]")
    of = parse_type2()

    t = ast_type_new(#AstTypeArray, (of=of, size=size, ti=&tk.ti) to AstTypeArray, &tk.ti)
    t.array := (of=of, size=size, ti=&tk.ti)
    return t
  }

  return parse_type3()
}

exist is_it_field : () -> Bool

parse_type3 = AstTypeParser {
  tk = ctok()
  if match("(") {
    if look(")") or is_it_field() {
      return parse_type_rec()
    }

    t = parse_type()
    need(")")
    return t
  }

  return parse_type4()
}


parse_type4 = AstTypeParser {
  if match("{") {
    return parse_type_set()
  }

  tk = ctok()

  if match("Tagged") {
    spec_type = parse_type()
    t = ast_type_new(#AstTypeSpecial, (type=spec_type, ti=&tk.ti) to AstTypeSpecial, &tk.ti)
    t.special := (type=spec_type, ti=&tk.ti)
    return t
  }

  if match("Var") {
    var_type = parse_type()
    t = ast_type_new(#AstTypeVar, (of=var_type, ti=&tk.ti) to AstTypeVar, &tk.ti)
    t.var := (of=var_type)
    return t
  }

  name = parse_name()
  //t = ast_type_new(#AstTypeNamed, (name=name, ti=&tk.ti) to AstTypeNamed, &tk.ti)
  t = ast_type_new(#AstTypeNamed, name, &tk.ti)
  t.name := name
  return t
}


parse_type = parse_type0


//*/



parse_type_set = AstTypeParser {
  tk = ctok()
  //need("{")

  constructors = 0 to Var List
  list_init(&constructors)

  skip_nl()
  while true {
    skip_nl()

    ti = &ctok().ti
    cons = parse_id()

    list_append(&constructors, cons to *Unit)

    ti_sep = &ctok().ti
    if match(",") {continue}

    nl_sep_present = match("\n")

    skip_nl()
    if match ("}") {break;}

    if not nl_sep_present {
      error("expected comma or new-line separator", ti_sep)
    }
  }

  t = ast_type_new(#AstTypeEnum, (constructors=constructors, ti=&tk.ti) to AstTypeEnum, &tk.ti)
  t.enum.constructors := constructors
  return t
}


parse_type_rec = AstTypeParser {
  tk = ctok()

  decls = 0 to Var List
  list_init(&decls)

  while true {
    skip_nl()
    if match(")") {break}

    ti = &ctok().ti

    fd = parse_decl(false)

    if fd == nil {
      error("dofield error", ti)
    }

    match(",")
    skip_nl()
    list_append(&decls, fd)
  }

  t = ast_type_new(#AstTypeRecord, #AstTypeParserError, &tk.ti)
  t.record := (decls=decls, ti=&tk.ti)
  return t
}


/*parse_type_ptr = AstTypeParser {
  tk = ctok()
  need("*")
  t = parse_type()

  pt = ast_type_new(#AstTypePointer, (to=t, ti=&tk.ti) to AstTypePointer, &tk.ti)
  pt.pointer := (to=t, ti=&tk.ti)
  return pt
}*/


/*
parse_type_array = AstTypeParser {
  tk = ctok()
  need("[")
  if match("]") {
    of = parse_type()
    t = ast_type_new(#AstTypeArrayU, (of=of, ti=&tk.ti) to AstTypeArrayU &tk.ti)
    t.array_u := (of=of, ti=&tk.ti)
    return t
  }

  size = parse_value()
  need("]")
  of = parse_type()

  t = ast_type_new(#AstTypeArray, &tk.ti)
  t.array := (size=size, of=of, ti=&tk.ti)
  return t
}
*/



// syntax: <id> [,<id>] ':' <type>
// *AstDecl
parse_decl = (arghack : Bool) -> *AstDecl {
  // get id's
  ids = 0 to Var List
  list_init(&ids)
  while true {
    id = parse_id()
    list_append(&ids, id)
    if not match(",") {break}
    skip_nl()
  }

  ti = &ctok().ti
  need(":")
  t = parse_type()

  afd = malloc(sizeof AstDecl) to *AstDecl
  *afd := (ids=ids, type=t, extern=external, arghack=xarghack, ti=ti)
  return afd
}



/*****************************************************************************/
/*                             Parse Value                                    */
/*****************************************************************************/

// нужно передавать сюда стартовый токен
AstValueParser = () -> *AstValue


ast_value_new = (x : AstValue) -> *AstValue {
  v = malloc(sizeof AstValue) to *AstValue
  assert(v != nil, "ast_value_new malloc fail")
  *v := x
  return v
}


exist parse_value2 : AstValueParser
exist parse_value3 : AstValueParser
exist parse_value4 : AstValueParser
exist parse_value5 : AstValueParser
exist parse_value6 : AstValueParser
exist parse_value7 : AstValueParser
exist parse_value8 : AstValueParser
exist parse_value9 : AstValueParser
exist parse_value10 : AstValueParser
exist parse_value11 : AstValueParser
exist parse_value12 : AstValueParser
exist parse_value_term : AstValueParser

parse_value = AstValueParser {
  v = parse_value2() to Var *AstValue
  if v == nil {return nil}
  ti = &ctok().ti
  if match("or") {
    skip_nl()
    l = v
    r = parse_value()
    v := ast_value_new ((left=l, right=r, ti=ti) to AstValueOr)
  }
  return v
}



parse_value2 = AstValueParser {
  v = parse_value3() to Var *AstValue
  if v == nil {return nil}
  ti = &ctok().ti
  if match("xor") {
    skip_nl()
    l = v
    r = parse_value2()
    v := ast_value_new ((left=l, right=r, ti=ti) to AstValueXor)
  }
  return v
}


parse_value3 = AstValueParser {
  v = parse_value4() to Var *AstValue
  if v == nil {return nil}
  ti = &ctok().ti
  if match("and") {
    skip_nl()
    l = v
    r = parse_value3()
    v := ast_value_new ((left=l, right=r, ti=ti) to AstValueAnd)
  }
  return v
}


parse_value4 = AstValueParser {
  v = parse_value5() to Var *AstValue
  if v == nil {return nil}
  while true {
    ti = &ctok().ti
    if match("==") {
      skip_nl()
      l = v
      r = parse_value4()
      v := ast_value_new ((left=l, right=r, ti=ti) to AstValueEq)
    } else if match("!=") {
      skip_nl()
      l = v
      r = parse_value4()
      v := ast_value_new ((left=l, right=r, ti=ti) to AstValueNe)
    } else {
      break
    }
  }
  return v
}


parse_value5 = AstValueParser {
  v = parse_value6() to Var *AstValue
  if v == nil {return nil}
  while true {
    ti = &ctok().ti
    if match("<") {
      skip_nl()
      l = v
      r = parse_value6()
      v := ast_value_new ((left=l, right=r, ti=ti) to AstValueLt)
    } else if match(">") {
      skip_nl()
      l = v
      r = parse_value6()
      v := ast_value_new ((left=l, right=r, ti=ti) to AstValueGt)
    } else if match("<=") {
      skip_nl()
      l = v
      r = parse_value6()
      v := ast_value_new ((left=l, right=r, ti=ti) to AstValueLe)
    } else if match(">=") {
      skip_nl()
      l = v
      r = parse_value6()
      v := ast_value_new ((left=l, right=r, ti=ti) to AstValueGe)
    } else {
      break
    }
  }
  return v
}


parse_value6 = AstValueParser {
  v = parse_value7() to Var *AstValue
  if v == nil {return nil}
  while true {
    ti = &ctok().ti
    if match("<<") {
      skip_nl()
      l = v
      r = parse_value7()
      v := ast_value_new ((left=l, right=r, ti=ti) to AstValueShl)
    } else if match(">>") {
      skip_nl()
      l = v
      r = parse_value7()
      v := ast_value_new((left=l, right=r, ti=ti) to AstValueShr)
    } else {
      break
    }
  }
  return v
}


parse_value7 = AstValueParser {
  v = parse_value8() to Var *AstValue
  if v == nil {return nil}
  while true {
    ti = &ctok().ti
    if match("+") {
      skip_nl()
      l = v
      r = parse_value8()
      v := ast_value_new ((left=l, right=r, ti=ti) to AstValueAdd)
    } else if match("-") {
      skip_nl()
      l = v
      r = parse_value8()
      v := ast_value_new ((left=l, right=r, ti=ti) to AstValueSub)
    } else {
      break
    }
  }
  return v
}


parse_value8 = AstValueParser {
  v = parse_value9() to Var *AstValue
  if v == nil {return nil}
  while true {
    ti = &ctok().ti
    if match("*") {
      skip_nl()
      l = v
      r = parse_value9()
      v := ast_value_new ((left=l, right=r, ti=ti) to AstValueMul)
    } else if match("/") {
      skip_nl()
      l = v
      r = parse_value9()
      v := ast_value_new ((left=l, right=r, ti=ti) to AstValueDiv)
    } else if match("%") {
      skip_nl()
      l = v
      r = parse_value9()
      v := ast_value_new ((left=l, right=r, ti=ti) to AstValueMod)
    } else {
      break
    }
  }
  return v
}


parse_value9 = AstValueParser {
  v = parse_value10() to Var *AstValue
  if v == nil {return nil}
  ti = &ctok().ti
  if match("to") {
    t = parse_type ()
    v := ast_value_new ((value=v, type=t, ti=ti) to AstValueCast)
  } else if match("is") {
    t = parse_type ()
    v := ast_value_new ((value=v, type=t, ti=ti) to AstValueIs)
  } else if match("as") {
    t = parse_type ()
    v := ast_value_new ((value=v, type=t, ti=ti) to AstValueAs)
  }
  return v
}


parse_value10 = AstValueParser {
  v = nil to Var *AstValue
  ti = &ctok().ti
  if match("*") {
    r = parse_value10()
    v := ast_value_new ((value=r, ti=ti) to AstValueDeref)
  } else if match("&") {
    r = parse_value11()
    v := ast_value_new ((value=r, ti=ti) to AstValueRef)
  } else if match("not") {
    r = parse_value10()
    v := ast_value_new ((value=r, ti=ti) to AstValueNot)
  } else if match("-") {
    r = parse_value10()
    v := ast_value_new ((value=r, ti=ti) to AstValueMinus)
  } else if match("+") {
    r = parse_value10()
    v := ast_value_new ((value=r, ti=ti) to AstValuePlus)
  } else if match("sizeof") {
    ti_sizeof = &ctok().ti
    t = parse_type()
    if t == nil {
      error("sizeof expected <type>", ti_sizeof)
      return nil
    }
    v := ast_value_new ((type=t, ti=ti) to AstValueSizeof)

  } else if match("alignof") {
    ti_alignof = &ctok().ti
    t = parse_type()
    if t == nil {
      error("alignof expected <type>", ti_alignof)
      return nil
    }
    v := ast_value_new ((type=t, ti=ti) to AstValueAlignof)
  } else {
    v := parse_value11()
  }
  return v
}


parse_value11 = AstValueParser {
  v = parse_value12() to Var *AstValue
  if v == nil {return nil}
  while true {
    ti = &ctok().ti
    if match("(") {
      arglist = list_new()
      while not match(")") {
        ti = &ctok().ti
        a = parse_value()
        if a == nil {
          skipto(",)")
          if match(",") {
            continue
          } else if match(")") {
            break
          } else {
            return nil  // unexpected EOF
          }
        }

        list_append(arglist, a)
        if not match(")") {
          need(",")
        } else {
          break
        }
      }

      v := ast_value_new ((func=v, args=*arglist, ti=ti) to AstValueCall)
    } else if match("[") {
      i = parse_value()
      match("]")
      v := ast_value_new ((array=v, index=i, ti=ti) to AstValueIndex)
    } else if match(".") {
      fid = parse_id()
      v := ast_value_new ((rec=v, field_id=fid, ti=ti) to AstValueAccess)
    } else {
      break
    }
  }

  return v
}


exist parse_value_func : AstValueParser
exist parse_value_rec : AstValueParser

parse_value12 = AstValueParser {
  if is_it_type() {
    return parse_value_func()
  }

  v = nil to Var *AstValue
  ti = &ctok().ti
  if match("(") {

    // если это Generic запись
    if is_it_value_record () {
      return parse_value_rec ()
    }

    v := parse_value()
    need(")")
  } else {
    v := parse_value_term()
  }
  return v
}


exist parse_value_id : AstValueParser

exist parse_value_extern : AstValueParser
exist parse_value_num : AstValueParser
exist parse_value_str : AstValueParser
exist parse_value_when : AstValueParser
exist parse_value_array : AstValueParser

parse_value_term = AstValueParser {
  token = ctok()
  return when token.kind {
    #TokenId  => parse_value_id()
    #TokenNum => parse_value_num()
    #TokenString => parse_value_str()

    #TokenSym => (token : *Token) -> *AstValue {
      error("unexpected symbol\n", &token.ti)
      assert(false, "bad term")
      return nil to *AstValue
    } (token)

    else => (token : *Token) -> *AstValue {
      error("unexpected symbol\n", &token.ti)
      printf("received: %s\n", &token.text[0])
      assert(false, "bad term")
      return nil to *AstValue
    } (token)
  }
}


parse_value_id = AstValueParser {

  ti = &ctok().ti
  if match("func") {
    return parse_value_func()
  } else if match("extern") {
    return parse_value_extern()
  } else if match("array") {
    return parse_value_array()
  } else if match("when") {
    return parse_value_when()
  }

  id = parse_id()
  if id == nil {return nil}

  return ast_value_new ((id=id, ti=ti) to AstValueName)

fail:
  return nil
}

parse_value_when = AstValueParser {
  token = ctok()

  variants = 0 to Var List
  list_init(&variants)
  other = 0 to Var *AstValue

  when_arg = parse_value()

  skip_nl()
  ti = &ctok().ti
  need("{")
  skip_nl()
  while not match("}") {

    if match("else") {
      need("=>")
      other := parse_value()
      skip_nl()
      continue
    }

    // parse each variant
    va = malloc(sizeof AstValueWhenVariant) to *AstValueWhenVariant
    memset (va, 0, sizeof AstValueWhenVariant)

    // check if is type when
    if is_it_type () {
      va.is_t := parse_type()
    } else {
      va.x := parse_value()
    }
    need("=>")
    va.y := parse_value()
    skip_nl()
    list_append(&variants, va)
  }

  return ast_value_new ((x=when_arg, variants=variants, other=other, ti=ti) to AstValueWhen)
}


parse_value_str = AstValueParser {
  token = ctok()
  text = &token.text
  len = strlen(text) + 1  // используй готовую инфу из токенинфо!
  str = dup(text)
  skip()
  return ast_value_new ((string=str, ti=&token.ti) to AstValueString)
}


parse_value_rec = AstValueParser {
  fields = 0 to Var Map  // id -> *Value

  ti = &ctok().ti
  while true {
    id = parse_id()
    need("=")
    v = parse_value()

    map_append(&fields, id.str, v)

    if match(")") {break}
    need(",")
  }

  return ast_value_new ((values=fields, ti=ti) to AstValueRecord)
}


parse_value_array = AstValueParser {
  ti = &ctok().ti

  items = 0 to Var List  // of *Value

  len = 0 to Var Nat32
  while true {
    v = parse_value()

    list_append(&items, v)
    len := len + 1

    if match("]") {break}
    need(",")
  }

  return ast_value_new ((items=items, ti=ti) to AstValueArray)
}


AstStmtParser = (ti : *TokenInfo) -> *AstStmt or Unit
exist parse_stmt       : AstStmtParser
exist parse_stmt_block : AstStmtParser


parse_value_func = AstValueParser {
  func_ti = &ctok().ti
  t = parse_type()
  skip_nl()
  block_ti = &ctok().ti
  need("{")
  b = parse_stmt_block(block_ti)
  return ast_value_new ((type=t, block_stmt=b as *AstStmt, ti=block_ti) to AstValueFunc)
}


parse_value_extern = AstValueParser {
  ti = &ctok().ti
  t = parse_type()
  return ast_value_new ((type=t, block_stmt=unit, ti=ti) to AstValueFunc)
}


parse_value_num = AstValueParser {
  tok = ctok()
  ti = &tok.ti

  str = dup(&tok.text[0] to Str)
  skip()

  return ast_value_new ((string=str, ti=ti) to AstValueNumber)
}



/*****************************************************************************/
/*                             Parse Statement                               */
/*****************************************************************************/

// размещаем значение AstStmt в куче
ast_stmt_boxing = (x : AstStmt) -> *AstStmt {
  s = malloc(sizeof AstStmt) to *AstStmt
  assert(s != nil, "ast_stmt_boxing malloc")
  *s := x
  return s
}



exist parse_stmt_if       : AstStmtParser
exist parse_stmt_while    : AstStmtParser
exist parse_stmt_return   : AstStmtParser
exist parse_stmt_goto     : AstStmtParser
//exist parse_stmt_vardef : AstStmtParser
exist parse_stmt_valbind  : AstStmtParser
exist parse_stmt_typebind : AstStmtParser
exist parse_stmt_expr     : AstStmtParser
exist parse_stmt_break    : AstStmtParser
exist parse_stmt_continue : AstStmtParser


parse_stmt_break = AstStmtParser {
  return ast_stmt_boxing ((ti=ti) to AstStmtBreak)
}

parse_stmt_continue = AstStmtParser {
  return ast_stmt_boxing ((ti=ti) to AstStmtContinue)
}

parse_stmt = () -> *AstStmt or Unit {
  tk = ctok()
  nt = nextok()
  ti = &tk.ti

  is_bind = tk.kind == #TokenId and nt.kind == #TokenSym and nt.text[0] == "="[0]

  if is_bind {
    return when true  {
      isUpperCase(tk.text[0]) => parse_stmt_typebind(ti)
      else => parse_stmt_valbind(ti)
    }
  }

  lab_or_expr = () -> *AstStmt or Unit{
    tk = ctok()
    if tk.kind == #TokenId {
      // Maybe Label?
      nt = nextok()
      if nt.text[0] == ":"[0] and nt.ti.length == 1 {
        id = parse_id()
        skip()  // `:`
        ti = &ctok().ti
        return ast_stmt_boxing ((label=id, ti=ti) to AstStmtLabel)
      }
    }

    return parse_stmt_expr(&tk.ti)
  }

  return when true {
    match("{")        => parse_stmt_block    (ti)
    match("if")       => parse_stmt_if       (ti)
    match("while")    => parse_stmt_while    (ti)
    match("return")   => parse_stmt_return   (ti)
    match("break")    => parse_stmt_break    (ti)
    match("continue") => parse_stmt_continue (ti)
    match("goto")     => parse_stmt_goto     (ti)
    else              => lab_or_expr         ()
  }
}




parse_stmt_expr = AstStmtParser {
  x = parse_value()

  if match(":=") {
    v = parse_value()
    return ast_stmt_boxing ((l=x, r=v, ti=ti) to AstStmtAssign)
  }

  return ast_stmt_boxing ((expr=x, ti=ti) to AstStmtExpr)
}


parse_stmt_valbind = AstStmtParser {
  // <id> '=' <expr>
  ti = &ctok().ti
  id = parse_id()
  need("=")
  v = parse_value()

  if id == nil or v == nil {return unit}

  return ast_stmt_boxing ((id=id, expr=v, ti=ti) to AstStmtValueBind)
}


parse_stmt_typebind = AstStmtParser {
  // <id> '=' <type>
  ti = &ctok().ti
  id = parse_id()
  need("=")
  t = parse_type()

  if id == nil or t == nil {return unit}

  return ast_stmt_boxing ((id=id, type=t, ti=ti) to AstStmtTypeBind)
}


parse_stmt_block = AstStmtParser {
  stmts = 0 to Var List
  list_init(&stmts)
  while not match("}") {
    skip_nl()

    if eof() {
      fatal("unexpected end-of-file")
      break
    }

    if match("}") {break}

    s = parse_stmt()
    if not (s is Unit) {
      need_sep()
      list_append(&stmts, s as *AstStmt)
    }
  }

  return ast_stmt_boxing ((stmts=stmts, ti=ti) to AstStmtBlock)
}


parse_stmt_if = AstStmtParser {
  cond = parse_value()
  match("\n")
  ti_then_block = &ctok().ti
  need("{")
  then = parse_stmt_block(ti_then_block)

  // parse else (if present)
  els = unit to Var (*AstStmt or Unit)
  if match("else") {
    match("\n")
    ti_else_branch = &ctok().ti
    if match("if") {
      els := parse_stmt_if(ti_else_branch)
    } else {
      need("{")
      els := parse_stmt_block(ti_else_branch)
    }
  }

  if cond == nil {return unit}
  if then is Unit {return unit}

  return ast_stmt_boxing ((cond=cond, then=then as *AstStmt, else=els, ti=ti) to AstStmtIf)
}


parse_stmt_while = AstStmtParser {
  cond = parse_value()
  match("\n")
  ti_block = &ctok().ti
  need("{")
  block =  parse_stmt_block(ti_block)

  if cond == nil {return unit}
  if block is Unit {return unit}

  return ast_stmt_boxing ((cond=cond, block=block as *AstStmt, ti=ti) to AstStmtWhile)
}


parse_stmt_return = AstStmtParser {
  if separator() {
    return ast_stmt_boxing ((value=unit, ti=ti) to AstStmtReturn)
  }

  ti = &ctok().ti
  v = parse_value()
  if v == nil {
    error("expected return expression", ti)
  }

  return ast_stmt_boxing ((value=v, ti=ti) to AstStmtReturn)
}


parse_stmt_goto = AstStmtParser {
  id = parse_id()
  return ast_stmt_boxing ((label=id, ti=ti) to AstStmtGoto)
}


/*parse_stmt_vardef = AstStmtParser {
  s = ast_stmt_boxing(#AstStmtVarDef, ti)
  fieldsdef = parse_decl(false)
  s.vardef := *fieldsdef
  return s
}*/




// IS IT?

tn2tok = (token_node : *Node) -> *Token {
  return token_node.data to *Token
}



is_it_field = () -> Bool {
  start = gett()  // сохраняем текущий токен

  skip_nl()

  tok = ctok()

  if tok.kind != #TokenId {goto no}
  skip()
  if match(",") {goto yes}
  if match(":") {goto yes}

no:
  sett(start)
  return false
yes:
  sett(start)
  return true
}


is_it_type_rec = () -> Bool {
  skip()  // (

  skip_nl()

  if match(")") {return true}

  return is_it_field ()
}

// определяет если спереди синтаксическое выражение типа
is_it_type = () -> Bool {
  start = gett()

  t = start.data to *Token

  if not when t.kind {
    #TokenNum => false
    #TokenString => false
    #TokenComment => false
    #TokenEOF => false
    else => true
  } {return false}


  skip_nl()

  tok = ctok()

  c = tok.text[0]
  if tok.kind == #TokenId {
    sett(start)
    return isUpperCase(c)
  }

  if when c {
    "("[0] => is_it_type_rec()
    "["[0] => true
    "{"[0] => true
    "*"[0] => () -> Bool {skip(); return is_it_type()} ()
    else => false
  } {goto yes}

no:
  sett(start)  // restore
  return false
yes:
  sett(start)  // restore
  return true
}


// вызывается после '(' в выражении значения
// для проверки это подвыражение или запись
is_it_value_record = () -> Bool {
  start = gett()

  skip_nl()

  if match(")") {goto yes}

  if ctok().kind != #TokenId {goto no}
  skip()  // skip Id

  if match("=") {
    goto yes
  } else {
    goto no
  }

no:
  sett(start)  // restore
  return false
yes:
  sett(start)  // restore
  return true
}

