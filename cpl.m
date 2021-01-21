


module_init = (m : *Module) -> () {
  index_init(&m.private)
  index_init(&m.public)
}


compiler_init = () -> () {
  module := malloc(sizeof Module) to *Module
  module_init(module)

  index_init(&builtinIndex)

  type_init()
  value_init()

  printf("##\n")

  asm_init (&asm0, #Arch-x64, "<name>")
}


def_rename = (d : *Definition, id : Str) -> () {
  when d.kind {
    #DefType  => (d : *Definition, id : Str) -> () {d.typedef.id := id} (d, id)
    #DefConst => (d : *Definition, id : Str) -> () {d.constdef.id := id} (d, id)
    #DefStr   => (d : *Definition, id : Str) -> () {d.stringdef.id := id} (d, id)
    #DefArray => (d : *Definition, id : Str) -> () {d.arraydef.id := id} (d, id)
    #DefFunc  => (d : *Definition, id : Str) -> () {d.funcdef.id := id} (d, id)
    #DefVar   => (d : *Definition, id : Str) -> () {d.vardef.id := id} (d, id)
    #DefAlias => (d : *Definition, id : Str) -> () {d.aliasdef.id := id} (d, id)
    else => () -> () {} ()
  }
}

def_getname = (d : *Definition) -> Str {
  return when d.kind {
    #DefType  => (d : *Definition) -> Str {return d.typedef.id} (d)
    #DefConst => (d : *Definition) -> Str {return d.constdef.id} (d)
    #DefStr   => (d : *Definition) -> Str {return d.stringdef.id} (d)
    #DefArray => (d : *Definition) -> Str {return d.arraydef.id} (d)
    #DefFunc  => (d : *Definition) -> Str {return d.funcdef.id} (d)
    #DefVar   => (d : *Definition) -> Str {return d.vardef.id} (d)
    #DefAlias => (d : *Definition) -> Str {return d.aliasdef.id} (d)
    else => () -> Str {return "<undef-def-kind>"} ()
  }
}


compile = (a : *AstModule) -> *Assembly {
  do_node = ListForeachHandler {
    ast_node = data to *AstNode
    e = ast_node.entity
    when ast_node.kind {
      //#AstNodeDeclVar => do_var_decl ((e to *AstNodeDeclVar).decl)
      #AstNodeBindType => do_type_bind (e to *AstNodeBindType)
      #AstNodeBindValue => do_value_bind (e to *AstNodeBindValue)
      //#AstNodeDeclType => do_type_decl (e to *AstNodeDeclType)
      #AstNodeDeclValue => do_value_decl (e to *AstNodeDeclValue)
      #AstNodeImport => do_import (e to *AstNodeImport)
      else => () -> () {} ()
    }
  }
  list_foreach(&a.nodes, do_node, nil)

  if errcnt > 0 {return nil}
  return &asm0
}



imp_list = 0 to Var Map
do_import = (x : *AstNodeImport) -> () {
  line = x.line

  /* include guard */
  if map_get(&imp_list, line) != nil {return}
  //not_null = 0x1 to Var *Unit
  map_append(&imp_list, line, &imp_list/*not_null*/)

  fname = cat(line, ".m")
  if exists(fname) {
    m = parse(fname)
    compile(m)
    return
  }

  lib_path = getenv(cfgLibraryVar)
  lib_fname = cat4(lib_path, "/", line, ".m")
  if exists(lib_fname) {
    m = parse(lib_fname)
    compile(m)
    return
  }

  error("unknown import", x.ti)
}


/*
do_var_decl = (x : *AstDecl) -> () {
  add_var = ListForeachHandler {
    ast_id = data to *AstId
    t = do_type(ctx to *AstType)
    init_value = nil
    create_global_var (ast_id.str, t, init_value, ast_id.ti)
  }
  list_foreach(&x.ids, add_var, x.type)
}
*/

/*do_type_decl = (x : *AstNodeDeclType) -> () {
  id = x.id
  t = type_new(#TypeUndefined, 0, 0, id.ti)
  bind_type(&module.public, id.str, t)
}*/


do_type_bind = (x : *AstNodeBindType) -> () {
  id = x.id.str
  t = do_type(x.type)

  y = get_type_global(id)
  if y != nil {
    // определение ранее задекларированого типа
    if y.kind != #TypeUndefined {
      error("type redefination", x.ti)
      return
    }

    if t.aka == nil {t.aka := id}

    memcpy(y to *Unit, t to *Unit, sizeof Type)
    asmTypedefAdd(&asm0, id, y)
    return
  } else {
    // определение неизвестного типа
    bind_type(&module.public, id, t)
  }

  asmTypedefAdd(&asm0, id, t)

  if t.aka == nil {t.aka := id}
}


unwrap_var = (x : *Value) -> *Value {
  if x.type.kind == #TypeVar {
    v2 = malloc (sizeof Value) to *Value
    memcpy(v2, x, sizeof Value)
    v2.type := v2.type.var.of
    return v2
  }
  return x
}


// top level value bind
do_value_bind = (x : *AstNodeBindValue) -> () {
  id = x.id.str
  v0 = do_valuex(x.value, false/*do not load*/)

  v = unwrap_var(v0)

  /*
   * Если значение с таким именем уже есть возможно это #ValueUndefined
   * который был декларирован ранее. Поэтому просто подменим ему пустое тело!
   * А возможно это ошибка - попытка переопределить определенное значение
   */
  y = get_value_global(id)
  if y != nil {
    if y.kind != #ValueUndefined {
      error("value redefination", x.ti)
      return
    }

    memcpy(y to *Unit, v to *Unit, sizeof Value)
    return
  }

  bind_value_global(id, v)

  // временно даю аргхак так
  v.type.func.arghack := strcmp("printf", id) == 0 or
      strcmp("scanf", id) == 0 or
      strcmp("sscanf", id) == 0 or
      strcmp("sprintf", id) == 0 or
      strcmp("fprintf", id) == 0

  if v.def != nil {
    def_rename(v.def, id)
  }
}


// декларация значения - создается запись значения #ValueUndefined
// про которое известен лишь его тип, но мы не знаем больше ничего
do_value_decl = (x : *AstNodeDeclValue) -> () {
  decl = x.decl
  t = do_type(decl.type)
  de = ListForeachHandler {
    id = data to *AstId
    t = ctx to *Type
    if t.kind == #TypeUndefined {error("undefined type", t.ti)}
    value_decl_global(id, t)
  }
  list_foreach(&decl.ids, de, t)
}


value_decl_global = (id : *AstId, t : *Type) -> () {
  v = value_new(#ValueUndefined, t, id.ti)
  bind_value_global(id.str, v)
}



create_global_var = (id : Str, t : *Type, init_value : *Value, ti : *TokenInfo) -> *Value {
  // создадим фейковый value который будет занесен в индекс
  // и будет ссылаться на переменную (просто нести тот же id)
  v = value_new(#ValueGlobalVar, t, ti)
  v.dirty := true
  v.def := asmVarAdd(&asm0, id, t, init_value)
  bind_value_global(id, v)
  return v
}

create_local_var = (id : *AstId, t : *Type, init_value : *Value, ti : *TokenInfo) -> *Value {

  stmt_new_vardef = (id : *AstId, t : *Type, init_value : *Value, ti : *TokenInfo) -> *Stmt {
    va = malloc(sizeof Decl) to *Decl
    va.id := id
    va.init_value := dold(init_value)
    va.type := t

    s = stmt_new(#StmtVarDef, ti)
    s.v := va
    return s
  }
  // создадим фейковый value который будет занесен в индекс
  // и будет ссылаться на переменную (просто нести тот же id)
  v = value_new(#ValueLocalVar, t, ti)

  bind_value_local(id.str, v)

  // добавляем в код функции стейтмент с определением этой переменной
  vd = stmt_new_vardef(id, t, init_value, nil)

  stmtAdd = (s : *Stmt) -> () {list_append(&fctx.cblock.stmts, s)}

  stmtAdd(vd)
  v.vardef := vd.v

  return v
}

