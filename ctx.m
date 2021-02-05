
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


context_type_get = (ctx : *Context, id : Str) -> *Type {
  if ctx == nil {return nil}
  t = index_type_get (&ctx.index, id)
  if t != nil {return t}
  return self (ctx.parent, id)
}

context_value_get = (ctx : *Context, id : Str) -> *Value {
  if ctx == nil {return nil}
  v = index_value_get (&ctx.index, id)
  if v != nil {return v}
  return self (ctx.parent, id)
}


valget = (id : Str) -> *Value {
  v = context_value_get (cctx, id)
  if v != nil {return v}
  // maybe it is `self`?
  if fctx != nil {if strcmp(id, "self") == 0 {return fctx.cfunc}}
  return nil
}

typeget = (id : Str) -> *Type or Unit {
  t = context_type_get (cctx, id)
  if t != nil {return t}
  // Self type (todo.)
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

  // проверяем если
  ae = valget(id)
  if ae != nil {
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


// когда связываем локальные имена мы смотрим только на то чтобы такой символ не был
// связан в текущем контексте. На родительские контексты не смотрим, тк локаньные
// контексты могут перекрывать имена
valbind_local = (id : Str, v : *Value) -> () {
  ae = index_value_get (&cctx.index, id)
  if ae != nil {
    warning ("name error", v.ti)
  }
  context_value_append (cctx, id, v)
}



