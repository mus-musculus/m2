


module_init = (m : *Module, parent_ctx : *Context) -> () {
  context_init(&m.ctx, parent_ctx)
}


compiler_init = () -> () {
  // инициализируем встроенный контекст
  context_init(&builtinContext, nil)
  cctx := &builtinContext

  type_init()
  value_init()


  // инициализируем корнвой модуль
  module := malloc(sizeof Module) to *Module
  module_init(module, cctx)
  cctx := &module.ctx

  asm_init (&asm0, #Arch-x64, "<name>")
  printf("##\n")
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





exist do_import : (x : AstNodeImport) -> ()
exist do_type_bind : (x : AstNodeBindType) -> ()
exist do_value_bind : (x : AstNodeBindValue) -> ()
exist do_value_decl : (x : AstNodeDeclValue) -> ()

compile = (a : AstModule) -> *Assembly {
  do_node = ListForeachHandler {
    ast_node = data to *AstNode
    e = *ast_node
    when e {
      AstNodeBindType => do_type_bind (e as AstNodeBindType)
      AstNodeBindValue => do_value_bind (e as AstNodeBindValue)
      AstNodeDeclValue => do_value_decl (e as AstNodeDeclValue)
      AstNodeImport => do_import (e as AstNodeImport)
      else => () -> () {} ()
    }
  }
  list_foreach(&(a.nodes to Var List), do_node, nil)

  if errcnt > 0 {return nil}
  return &asm0
}



imp_list = 0 to Var Map
do_import = (x : AstNodeImport) -> () {
  line = x.line

  /* include guard */
  if map_get (&imp_list, line) != nil {return}
  //not_null = 0x1 to Var *Unit
  map_append (&imp_list, line, &imp_list/*not_null*/)

  fname = cat (line, ".m")
  if exists (fname) {
    m = parse (fname)
    if m is AstModule {
      compile (m as AstModule)
    }
    return
  }

  lib_path = getenv (cfgLibraryVar)
  lib_fname = cat4 (lib_path, "/", line, ".m")
  if exists (lib_fname) {
    m = parse (lib_fname)
    if m is AstModule {
      compile (m as AstModule)
    }
    return
  }

  error("unknown import", x.ti)
}


do_type_bind = (x : AstNodeBindType) -> () {
  id = x.id.str
  t = do_type(x.type)

  ae = typeget (id)
  if ae isnt Unit {
    ae = ae as *Type
    // определение ранее задекларированого типа
    if ae.kind != #TypeUndefined {
      error("type redefination", x.ti)
      return
    }

    if t.aka == nil {t.aka := id}

    memcpy(ae to *Unit, t to *Unit, sizeof Type)
    asmTypedefAdd(&asm0, id, ae)
    return
  } else {
    // определение неизвестного типа
    typebind (id, t)
  }

  asmTypedefAdd (&asm0, id, t)

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
do_value_bind = (x : AstNodeBindValue) -> () {
  id = x.id.str
  v0 = do_valuex(x.value, false/*do not load*/)

  v = unwrap_var(v0)

  /*
   * Если значение с таким именем уже есть возможно это #ValueUndefined
   * который был декларирован ранее. Поэтому просто подменим ему пустое тело!
   * А возможно это ошибка - попытка переопределить определенное значение
   */
  ae = valget (id)
  if ae isnt Unit {
    ae = ae as *Value

    if ae.data isnt ValueUndefined {
      error("value redefination", x.ti)
      return
    }

    memcpy(ae to *Unit, v to *Unit, sizeof Value)
    return
  }

  valbind(id, v)

  // временно даю аргхак так
  v.type.func.arghack := strcmp("printf", id) == 0 or
      strcmp("scanf", id) == 0 or
      strcmp("sscanf", id) == 0 or
      strcmp("sprintf", id) == 0 or
      strcmp("fprintf", id) == 0


  if v.data is ValueGlobalVar {
    g = v.data as ValueGlobalVar
    def_rename(g.def, id)
  } else if v.data is ValueGlobalConst {
    g = v.data as ValueGlobalConst
    def_rename(g.def, id)
  }
}


// декларация значения - создается запись значения #ValueUndefined
// про которое известен лишь его тип, но мы не знаем больше ничего
do_value_decl = (x : AstNodeDeclValue) -> () {
  decl = x.decl
  t = do_type(decl.type)
  de = ListForeachHandler {
    id = data to *AstId
    t = ctx to *Type
    if t.kind == #TypeUndefined {error("undefined type5", t.ti)}
    value_decl_global(id, t)
  }
  list_foreach(&decl.ids, de, t)
}


value_decl_global = (id : *AstId, t : *Type) -> () {
  v = value_new ((type=t, ti=id.ti) to ValueUndefined, t, id.ti)
  valbind (id.str, v)
}




