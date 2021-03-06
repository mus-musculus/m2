
//import "index"

context_init = (ctx, parent : *Context) -> () {
  index_init(&ctx.index)
  ctx.parent := parent
}

context_type_append = (ctx : *Context, id : Str, t : *Type) -> () {
  index_type_append (&ctx.index, id, t)
}

context_value_append = (ctx : *Context, id : Str, v : *Value) -> () {
  index_value_append (&ctx.index, id, v)
}


// ищем в текущем контексте и всех родительских
context_type_get = (ctx : *Context, id : Str) -> *Type {
  if ctx == nil {return nil}
  t = index_type_get (&ctx.index, id)
  return when t {
    nil => self (ctx.parent, id)
    else => t
  }
}

// ищем в текущем контексте и всех родительских
context_value_get = (ctx : *Context, id : Str) -> *Value {
  if ctx == nil {return nil}
  v = index_value_get (&ctx.index, id)
  return when v {
    nil => self (ctx.parent, id)
    else => v
  }
}


valget = (id : Str) -> *Value or Unit {
  v = context_value_get (cctx, id)
  if v != nil {return v}
  if fctx != nil {if strcmp(id, "self") == 0 {return fctx.cfunc}}
  return unit
}

typeget = (id : Str) -> *Type or Unit {
  t = context_type_get (cctx, id)
  if t != nil {return t}
  if strcmp(id, "Self") == 0 {return ctype}
  return unit
}


typebind = (id : Str, t : *Type) -> () {
  assert (cctx != nil, "typebind")

  ae = typeget (id)
  if ae isnt Unit {
    ae = ae as *Type
    // define already declared type (TypeUndefined)
    if ae.kind != #TypeUndefined {
      error("type bind error: attempt to id redefinition", t.ti)
      return
    }
    printf("bind AE_type: %s\n", id)
    memcpy(ae, t, sizeof Type)
    return
  }

  context_type_append (cctx, id, t)
}


valbind = (id : Str, v : *Value) -> () {
  assert (cctx != nil, "valbind")

  // проверяем если это имя уже связано (по всей цепочке глобально)
  ae = valget(id)
  if ae isnt Unit {
    ae = ae as *Value
    // если значение уже есть но не определено
    if ae.data isnt ValueUndefined {
      error("value bind error: id already bound", v.ti)
      warning("first defined here", ae.ti)
      return
    }

    // это позволяет юзать глобальные значения до того как они будут объявлены
    memcpy(ae, v, sizeof Value)
    return
  }

  context_value_append (cctx, id, v)
}


// когда связываем локальные имена мы смотрим только на то
// чтобы такой символ не был связан в текущем контексте.
// На родительские контексты не смотрим, тк локаньные
// контексты могут перекрывать имена
valbind_local = (id : Str, v : *Value) -> () {
  ae = index_value_get (&cctx.index, id)
  if ae != nil {
    error ("name error", v.ti)
  }
  context_value_append (cctx, id, v)
}

typebind_local = (id : Str, t : *Type) -> () {
  ae = index_type_get (&cctx.index, id)
  if ae != nil {
    error ("name error", t.ti)
  }
  context_type_append (cctx, id, t)
}


