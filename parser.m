


pstat = 0 to Var ParserState
external = false to Var Bool
comments = false to Var Bool  // ловим комментарии?
xarghack = false to Var Bool


exist match : (s : Str) -> Bool
exist ctok : () -> *Token
exist separator : () -> Bool
exist parse_import : () -> *AstNode
exist parse_decl : (arghack : Bool) -> *AstDecl
exist ast_value_new : (k : AstValueKind, ti : *TokenInfo) -> *AstValue
exist parse_bind_type : () -> *AstNodeBindType
exist parse_bind_value : () -> *AstNodeBindValue

exist parse_type : () -> *AstType
exist parse_value : () -> *AstValue

exist is_it_type : () -> Bool

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
sep = () -> Bool {
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
  id.str := str
  id.ti := ti
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
  n.kind := kind
  n.entity := entity
  return n
}

parse = (filename : Str) -> *AstModule {
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

      v = ast_value_new(#AstValueFunc, decl.ti)
      v.func.type := decl.type
      v.func.type.func.arghack := xarghack
      v.extern := true
      v.func.block_stmt := nil

      bv = malloc(sizeof AstNodeBindValue) to *AstNodeBindValue
      bv.id := decl.ids.first.data to *AstId
      bv.value := v
      bv.ti := decl.ti

      list_append(&m.nodes, ast_node_new(#AstNodeBindValue, bv))
      continue
    }


    if isAlpha(tok.text[0]) {
      if isUpperCase(tok.text[0]) {
        bt = parse_bind_type()
        list_append(&m.nodes, ast_node_new(#AstNodeBindType, bt))
      } else {
        bv = parse_bind_value()
        list_append(&m.nodes, ast_node_new(#AstNodeBindValue, bv))
      }
    }

  }
  return m
}


parse_import = () -> *AstNode {
  i = malloc(sizeof AstNodeImport) to *AstNodeImport
  tk = ctok()
  i.line := dup(&tk.text[0] to Str)
  i.ti := &tk.ti
  skip()
  return ast_node_new(#AstNodeImport, i)
  //old_lstate = lstate
  //parse(filename)
  //lstate = old_lstate
}

parse_bind_type = () -> *AstNodeBindType {
  bt = malloc(sizeof AstNodeBindType) to *AstNodeBindType
  id = parse_id()
  ti = &ctok().ti
  need("=")
  /*ist = is_it_type()
  if not ist {
    printf("%s is type? %d\n", id.str, ist)
  }*/
  t = parse_type()
  //printf("type bind: %s\n", id.str)
  bt.id := id
  bt.type := t
  bt.ti := ti
  return bt
}

parse_bind_value = () -> *AstNodeBindValue {
  bv = malloc(sizeof AstNodeBindValue) to *AstNodeBindValue
  id = parse_id()
  ti = &ctok().ti
  need("=")
  /*ist = is_it_type()
  if ist {
    printf("%s is type? %d\n", id.str, ist)
  }*/

  //printf("value bind: %s\n", id.str)
  bv.id := id
  bv.value := parse_value()
  bv.ti := ti
  return bv
}


/*****************************************************************************/
/*                             Parse Type                                    */
/*****************************************************************************/

ast_type_new = (kind : AstTypeKind, ti : *TokenInfo) -> *AstType {
  t = malloc(sizeof AstType) to *AstType
  assert(t != nil, "parse_type malloc")
  t.kind := kind
  t.ti := ti
  return t
}

AstTypeParser = () -> *AstType

exist parse_type_ptr   : AstTypeParser
exist parse_type_set   : AstTypeParser
exist parse_type_rec   : AstTypeParser
exist parse_type_array : AstTypeParser

exist parse_type  : AstTypeParser
exist parse_type1 : AstTypeParser
exist parse_type2 : AstTypeParser
exist parse_type3 : AstTypeParser
exist parse_type4 : AstTypeParser

parse_type = AstTypeParser {
  t = parse_type1()
  tk = ctok()

  if match("->") {
    from = t
    _to = parse_type()
    ft = ast_type_new(#AstTypeFunc, &tk.ti)
    ft.func.from := from
    ft.func.to := _to
    return ft
  }

  return t
}


parse_type1 = AstTypeParser {
  t = parse_type2()

  tk = ctok()
  if match("or") {
    tx = ast_type_new(#AstTypeUnion, &tk.ti)
    list_init(&tx.union.types)

    list_append(&tx.union.types, t)

    skip_nl()

    t = parse_type2()
    list_append(&tx.union.types, t)

    while match("or") {
      skip_nl()
      t = parse_type2()
      list_append(&tx.union.types, t)
    }

    return tx
  }

  return t
}

parse_type2 = AstTypeParser {

  tk = ctok()
  if match("*") {
    t = ast_type_new(#AstTypePointer, &tk.ti)
    t.pointer.to := parse_type2()
    return t
  } else if match("[") {

    if match("]") {
      t = ast_type_new(#AstTypeArrayU, &tk.ti)
      of = parse_type2()
      t.array_u.of := of
      return t
    }

    t = ast_type_new(#AstTypeArray, &tk.ti)
    size = parse_value()
    need("]")
    of = parse_type2()
    t.array.size := size
    t.array.of := of
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

  if match("Var") {
    t = ast_type_new(#AstTypeVar, &tk.ti)
    t.var.of := parse_type()
    return t
  }

  t = ast_type_new(#AstTypeNamed, &tk.ti)
  t.name := parse_name()
  return t
}

//*/



parse_type_set = AstTypeParser {
  tk = ctok()
  //need("{")
  t = ast_type_new(#AstTypeEnum, &tk.ti)

  skip_nl()
  while not match("}") {
    skip_nl()

    ti = &ctok().ti
    cons = parse_id()

    list_append(&t.enum.constructors, cons to *Unit)

    if not match(",") {
      skip_nl()
      need("}")
      break
    }
  }

  return t
}


parse_type_rec = AstTypeParser {
  tk = ctok()
  t = ast_type_new(#AstTypeRecord, &tk.ti)
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

  t.record.decls := decls

  return t
}


parse_type_ptr = AstTypeParser {
  tk = ctok()
  need("*")
  t = ast_type_new(#AstTypePointer, &tk.ti)
  t.pointer.to := parse_type()
  return t
}


parse_type_array = AstTypeParser {
  tk = ctok()
  need("[")
  if match("]") {
    t = ast_type_new(#AstTypeArrayU, &tk.ti)
    of = parse_type()
    t.array_u.of := of
    return t
  }

  t = ast_type_new(#AstTypeArray, &tk.ti)
  size = parse_value()
  need("]")
  of = parse_type()
  t.array.size := size
  t.array.of := of
  return t
}



// syntax: <id> [,<id>] ':' <type>
// *AstDecl
parse_decl = (arghack : Bool) -> *AstDecl {
  afd = malloc(sizeof AstDecl) to *AstDecl

  // get id's
  list_init(&afd.ids)
  while true {
    id = parse_id()
    list_append(&afd.ids, id)
    if not match(",") {break}
    skip_nl()
  }

  afd.ti := &ctok().ti
  need(":")

  t = parse_type()

  afd.type := t
  afd.extern := external
  afd.arghack := xarghack

  return afd
}



/*****************************************************************************/
/*                             Parse Value                                    */
/*****************************************************************************/

// нужно передавать сюда стартовый токен
AstValueParser = () -> *AstValue


ast_value_new = (k : AstValueKind, ti : *TokenInfo) -> *AstValue {
  v = malloc(sizeof AstValue) to *AstValue
  assert(v != nil, "ast_value_new malloc")
  memset(v, 0, sizeof AstValue)
  v.kind := k
  v.ti := ti
  return v
}


prefix = (k : AstValueKind, v : *AstValue, ti : *TokenInfo) -> *AstValue {
  nv = ast_value_new(k, ti)
  nv.operand[0] := v
  return nv
}

infix = (k : AstValueKind, l, r : *AstValue, ti : *TokenInfo) -> *AstValue {
  v = ast_value_new(k, ti)
  v.operand[0] := l
  v.operand[1] := r
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
  /*if is_it_type() {
    ct = ctok()
    t = parse_type()
    v = parse_value()
    nv = ast_value_new(#AstValueCast, t.ti)
    nv.cast.value := v
    nv.cast.type := t
    return nv
  }*/

  v = parse_value2() to Var *AstValue
  if v == nil {return nil}
  ti = &ctok().ti
  if match("or") {
    skip_nl()
    l = v
    r = parse_value()
    v := infix(#AstValueOr, l, r, ti)
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
    v := infix(#AstValueXor, l, r, ti)
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
    v := infix(#AstValueAnd, l, r, ti)
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
      v := infix(#AstValueEq, l, r, ti)
    } else if match("!=") {
      skip_nl()
      l = v
      r = parse_value4()
      v := infix(#AstValueNe, l, r, ti)
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
      v := infix(#AstValueLt, l, r, ti)
    } else if match(">") {
      skip_nl()
      l = v
      r = parse_value6()
      v := infix(#AstValueGt, l, r, ti)
    } else if match("<=") {
      skip_nl()
      l = v
      r = parse_value6()
      v := infix(#AstValueLe, l, r, ti)
    } else if match(">=") {
      skip_nl()
      l = v
      r = parse_value6()
      v := infix(#AstValueGe, l, r, ti)
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
      v := infix(#AstValueShl, l, r, ti)
    } else if match(">>") {
      skip_nl()
      l = v
      r = parse_value7()
      v := infix(#AstValueShr, l, r, ti)
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
      v := infix(#AstValueAdd, l, r, ti)
    } else if match("-") {
      skip_nl()
      l = v
      r = parse_value8()
      v := infix(#AstValueSub, l, r, ti)
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
      v := infix(#AstValueMul, l, r, ti)
    } else if match("/") {
      skip_nl()
      l = v
      r = parse_value9()
      v := infix(#AstValueDiv, l, r, ti)
    } else if match("%") {
      skip_nl()
      l = v
      r = parse_value9()
      v := infix(#AstValueMod, l, r, ti)
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
    t = parse_type()
    nv = ast_value_new(#AstValueCast, ti)
    nv.cast.value := v
    nv.cast.type := t
    v := nv
  } else if match("is") {
    t = parse_type()
    nv = ast_value_new(#AstValueIs, ti)
    nv.is.value := v
    nv.is.type := t
    v := nv
  } else if match("as") {
    t = parse_type()
    nv = ast_value_new(#AstValueAs, ti)
    nv.as.value := v
    nv.as.type := t
    v := nv
  }
  return v
}


parse_value10 = AstValueParser {
  v = nil to Var *AstValue
  ti = &ctok().ti
  if match("*") {
    r = parse_value10()
    v := prefix(#AstValueDeref, r, ti)
  } else if match("&") {
    r = parse_value11()
    v := prefix(#AstValueRef, r, ti)
  } else if match("not") {
    r = parse_value10()
    v := prefix(#AstValueNot, r, ti)
  } else if match("-") {
    r = parse_value10()
    v := prefix(#AstValueMinus, r, ti)
  } else if match("+") {
    r = parse_value10()
    v := prefix(#AstValuePlus, r, ti)
  } else if match("sizeof") {
    ti_sizeof = &ctok().ti
    t = parse_type()
    if t == nil {
      error("sizeof expected <type>", ti_sizeof)
      return nil
    }
    nv = ast_value_new(#AstValueSizeof, ti)
    nv.of_type := t
    v := nv

  } else if match("alignof") {
    ti_alignof = &ctok().ti
    t = parse_type()
    if t == nil {
      error("alignof expected <type>", ti_alignof)
      return nil
    }
    nv = ast_value_new(#AstValueAlignof, ti)
    nv.of_type := t
    v := nv
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

      nv = ast_value_new(#AstValueCall, ti)
      nv.call.func := v
      nv.call.args := *arglist
      v := nv
    } else if match("[") {
      i = parse_value()
      match("]")
      nv = ast_value_new(#AstValueIndex, ti)
      nv.index.array := v
      nv.index.index := i
      v := nv
    } else if match(".") {
      field_id = parse_id()
      nv = ast_value_new(#AstValueAccess, ti)
      nv.access.rec := v
      nv.access.field_id := field_id
      v := nv
    } else {
      break
    }
  }

  return v
}


exist parse_value_func : AstValueParser

parse_value12 = AstValueParser {

  if is_it_type() {
    return parse_value_func()
  }

  v = nil to Var *AstValue
  ti = &ctok().ti
  if match("(") {
    v := parse_value()
    need(")")
  } else {
    v := parse_value_term()
  }
  return v
}


exist parse_value_id : AstValueParser

exist parse_value_extern : AstValueParser
exist parse_value_arr : AstValueParser
exist parse_value_num : AstValueParser
exist parse_value_str : AstValueParser
exist parse_value_when : AstValueParser

parse_value_term = AstValueParser {
  token = ctok()
  return when token.kind {
    #TokenId  => parse_value_id()
    #TokenNum => parse_value_num()
    #TokenString => parse_value_str()
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
    return parse_value_arr()
  } else if match("when") {
    return parse_value_when()
  }


  id = parse_id()
  if id == nil {return nil}

  v = ast_value_new(#AstValueId, ti)
  v.name.id := id
  v.name.ti := ti
  return v

fail:
  return nil
}

parse_value_when = AstValueParser {
  token = ctok()
  v = ast_value_new(#AstValueSelect, &token.ti)
  list_init(&v.select.variants)
  v.select.x := parse_value()
  skip_nl()
  need("{")
  skip_nl()
  while not match("}") {

    if match("else") {
      need("=>")
      // otherwise
      v.select.other := parse_value()
      skip_nl()
      continue
    }

    // parse each variant
    va = malloc(sizeof AstValueSelectVariant) to *AstValueSelectVariant

    // check if is type when
    is_type = is_it_type ()

    va.x := parse_value()
    need("=>")
    va.y := parse_value()
    skip_nl()
    list_append(&v.select.variants, va)
  }
  return v
}


parse_value_str = AstValueParser {
  token = ctok()
  text = &token.text
  len = strlen(text) + 1  // используй готовую инфу из токенинфо!
  str = dup(text)
  skip()

  v = ast_value_new(#AstValueStr, &token.ti)
  v.str := str
  return v
}


parse_value_arr = AstValueParser {
//  ti = &ctok().ti
//  of = parse_type()
//  need("[")
//
//  data = list_new()  // of *AstValue
//
//  var len : Nat32
//  len = 0
//  while not match("]") {
//    item = parse_value()
//    if item == nil {match(","); continue}
//    item2 = castIfGenericTo(item, typeBaseInt)
//    len = len + 1
//    list_append(data, item2)
//    match(",")
//  }
//
//  t = type_array_new(of, len)
//  v = valueNew(#AstValueGlobalConst, ti)
//  id = get_name_arr()
//  v.def = asmArrayAdd(&asm0, id, t, data)
//  v.type = t
//  return v
    return nil
}


AstStmtParser = (ti : *TokenInfo) -> *AstStmt or Unit


exist parse_stmt_block : AstStmtParser

parse_value_func = AstValueParser {
  func_ti = &ctok().ti
  t = parse_type()
  skip_nl()
  block_ti = &ctok().ti
  need("{")

  b = parse_stmt_block(block_ti)

  v = ast_value_new(#AstValueFunc, func_ti)
  v.func.type := t
  v.func.block_stmt := b as *AstStmt
  return v
}


parse_value_extern = AstValueParser {
  ti = &ctok().ti
  t = parse_type()
  v = ast_value_new(#AstValueFunc, ti)
  v.func.type := t
  v.extern := true
  v.func.block_stmt := nil
  return v
}


parse_value_num = AstValueParser {
  tok = ctok()
  ti = &tok.ti

  str = dup(&tok.text[0] to Str)
  skip()

  v = ast_value_new(#AstValueNum, ti)
  v.str := str
  return v
}



/*****************************************************************************/
/*                             Parse Statement                               */
/*****************************************************************************/

ast_stmt_new = (k : AstStmtKind, ti : *TokenInfo) -> *AstStmt {
  s = malloc(sizeof AstStmt) to *AstStmt
  assert(s != nil, "ast_value_new malloc")
  memset(s, 0, sizeof AstStmt)
  s.kind := k
  s.ti := ti
  return s
}



exist parse_stmt_valdef : AstStmtParser
exist parse_stmt_if : AstStmtParser
exist parse_stmt_while : AstStmtParser
exist parse_stmt_return : AstStmtParser
exist parse_stmt_goto : AstStmtParser
exist parse_stmt_vardef : AstStmtParser
exist parse_stmt_typedef : AstStmtParser
exist parse_stmt_expr : AstStmtParser

parse_stmt_break = AstStmtParser {
  return ast_stmt_new(#AstStmtBreak, ti)
}
parse_stmt_continue = AstStmtParser {
  return ast_stmt_new(#AstStmtContinue, ti)
}

parse_stmt = () -> *AstStmt or Unit {
  tk = ctok()
  nt = nextok()
  ti = &tk.ti

  is_def = tk.kind == #TokenId and nt.kind == #TokenSym and nt.text[0] == "="[0]

  is_valdef = is_def and (isLowerCase(tk.text[0]) or tk.text[0] == "_"[0])
  is_typdef = is_def and isUpperCase(tk.text[0])


  lab_or_expr = () -> *AstStmt or Unit{
    tk = ctok()
    if tk.kind == #TokenId {
      // Maybe Label?
      nt = nextok()
      if nt.text[0] == ":"[0] and nt.ti.length == 1 {
        id = parse_id()
        skip()  // `:`
        ti = &ctok().ti
        s = ast_stmt_new(#AstStmtLabel, ti)
        s.label.label := id
        return s
      }
    }

    return parse_stmt_expr(&tk.ti)
  }

  return when true {
    match("let") or is_valdef => parse_stmt_valdef(ti)
    match("{") => parse_stmt_block(ti)
    match("if") => parse_stmt_if(ti)
    match("while") => parse_stmt_while(ti)
    match("return") => parse_stmt_return(ti)
    match("break") => parse_stmt_break(ti)
    match("continue") => parse_stmt_continue(ti)
    //match("var") => parse_stmt_vardef(ti)
    match("type") or is_typdef => parse_stmt_typedef(ti)
    match("goto") => parse_stmt_goto(ti)
    else => lab_or_expr()
  }
}




parse_stmt_expr = AstStmtParser {
  x = parse_value()

  if match(":=") {
    s = ast_stmt_new(#AstStmtAssign, ti)
    s.assign.l := x
    s.assign.r := parse_value()
    return s
  }

  s = ast_stmt_new(#AstStmtExpr, ti)
  s.expr.expr := x
  return s
}


parse_stmt_valdef = AstStmtParser {
  // <id> '=' <expr>
  ti = &ctok().ti
  id = parse_id()
  need("=")
  v = parse_value()

  if id == nil or v == nil {return unit}

  s = ast_stmt_new(#AstStmtValueDef, ti)
  s.valdef.id := id
  s.valdef.expr := v
  return s
}


parse_stmt_typedef = AstStmtParser {
  // <id> '=' <type>
  ti = &ctok().ti
  id = parse_id()
  need("=")
  t = parse_type()

  if id == nil or t == nil {return unit}

  s = ast_stmt_new(#AstStmtTypeDef, ti)
  s.typedef.id := id
  s.typedef.type := t
  return s
}


parse_stmt_block = AstStmtParser {
  sb = ast_stmt_new(#AstStmtBlock, ti)
  list_init(&sb.block.stmts)
  while not match("}") {
    skip_nl()

    if eof() {
      fatal("unexpected end-of-file")
      break
    }

    if match("}") {break}

    s = parse_stmt()
    if not (s is Unit) {
      sep()
      list_append(&sb.block.stmts, s as *AstStmt)
    }
  }

  return sb
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

  s = ast_stmt_new(#AstStmtIf, ti)
  s.if.cond := cond
  s.if.then := then as *AstStmt
  s.if.else := els
  return s
}


parse_stmt_while = AstStmtParser {
  cond = parse_value()
  match("\n")
  ti_block = &ctok().ti
  need("{")
  block =  parse_stmt_block(ti_block)

  if cond == nil {return unit}
  if block is Unit {return unit}

  s = ast_stmt_new(#AstStmtWhile, ti)
  s.while.cond := cond
  s.while.block := block as *AstStmt
  return s
}


parse_stmt_return = AstStmtParser {

  if separator() {
    return ast_stmt_new(#AstStmtReturn, ti)
  }

  ti = &ctok().ti
  v = parse_value()
  if v == nil {
    error("expected return expression", ti)
  }

  s = ast_stmt_new(#AstStmtReturn, ti)
  s.return.value := v
  return s
}


parse_stmt_goto = AstStmtParser {
  s = ast_stmt_new(#AstStmtGoto, ti)
  s.goto.label := parse_id()
  return s
}


parse_stmt_vardef = AstStmtParser {
  s = ast_stmt_new(#AstStmtVarDef, ti)
  fieldsdef = parse_decl(false)
  s.vardef := *fieldsdef
  return s
}




// IS IT?

tn2tok = (token_node : *Node) -> *Token
    {return token_node.data to *Token}



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



