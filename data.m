/*****************************************************************************/
/*                                Data                                       */
/*****************************************************************************/

import "C"
import "assert"
import "str"
import "data/node"
import "data/list"
import "data/map"

import "types"
import "proto"

/*exist fctx : Var *FuncContext
exist ctype : Var *Type*/


index_init = (index : *Index) -> () {
  map_init(&index.types)
  map_init(&index.values)
}

index_extend = (dst, src : *Index) -> () {
  map_extend(&dst.types, &src.types)
  map_extend(&dst.values, &src.values)
}

index_type_append = (index : *Index, id : Str, t : *Type) -> ()
{map_append(&index.types, id, t)}

index_value_append = (index : *Index, id : Str, v : *Value) -> ()
{map_append(&index.values, id, v)}

index_type_get = (index : *Index, id : Str) -> *Type
{return map_get(&index.types, id) to *Type}

index_value_get = (index : *Index, id : Str) -> *Value
{return map_get(&index.values, id) to *Value}




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

typeget = (id : Str) -> *Type {
  t = context_type_get (cctx, id)
  if t != nil {return t}
  // Self type (todo.)
  if strcmp(id, "Self") == 0 {return ctype}
  return nil
}


typebind = (id : Str, t : *Type) -> () {
  assert (cctx != nil, "typebind")

  ae = typeget (id)
  if ae != nil {
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





// принимает префикс ресурса (например str)
// и его номер, формируя строку вида str0
// формирует строку вида prefix#### - aka анонимной сущности
get_suid = (res : Str, uid : Nat32) -> Str {
  dig = nil to Var [32]Nat8
  sprintf(&dig[0] to *Unit, "%u", uid)
  return cat(res, &dig[0] to Str)
}


local_type_id_cnt = 0 to Var Nat32

get_suid_type_local = () -> Str {
  local_type_id_cnt := local_type_id_cnt + 1
  prefix = cat(fctx.id, ".type")
  return get_suid(prefix, local_type_id_cnt)
}


// функция возвращает строку-префикс
get_prefix = () -> Str {
  if fctx != nil {return cat(fctx.id, "_")}
  return ""
}


get_name = (res : Str, uid : *Nat32) -> Str {
  pre = get_prefix()

  *uid := *uid + 1
  id = get_suid(res, *uid)

  return cat(pre, id)
}


func_uid = 0 to Var Nat32
get_uid_func = () -> Str {return get_name("func", &func_uid)}


str_uid = 0 to Var Nat32
get_name_str = () -> Str {
  if fctx != nil {
    return get_name("str", &fctx.strno)
  }
  return get_name("str", &str_uid)
}


arr_uid = 0 to Var Nat32
get_name_arr = () -> Str {return get_name("arr", &arr_uid)}

var_uid = 0 to Var Nat32
get_name_var = () -> Str {return get_name("var", &var_uid)}

type_uid = 0 to Var Nat32
get_name_type = () -> Str {return get_name("Type", &type_uid)}




type_present_in_list = (list : *List, t : *Type) -> Bool {
  finder = ListSearchHandler {
    t_in = data to *Type
    t = ctx to *Type
    return type_eq(t_in, t)
  }
  return list_search (list, finder, t) != nil
}

