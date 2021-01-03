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


builtinIndex = 0 to Var Index

builtin_value_bind = (id : Str, v : *Value) -> ()
{map_append(&builtinIndex.values, id, v)}

builtin_type_bind = (id : Str, t : *Type) -> ()
{map_append(&builtinIndex.types, id, t)}



module = nil to Var *Module


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

index_get_type = (index : *Index, id : Str) -> *Type
{return map_get(&index.types, id) to *Type}

index_get_value = (index : *Index, id : Str) -> *Value
{return map_get(&index.values, id) to *Value}


get_value_global = (id : Str) -> *Value {
  // in module::public
  x = index_get_value(&module.public, id)
  if x != nil {return x}

  // in module::private
  return index_get_value(&module.private, id)
}


get_value = (id : Str) -> *Value {
  // ищет запись о значении во стеке блоков вплоть до корневого
  search_value_in_block_stack = (id : Str, b : *Block) -> *Value {
    if b == nil {return nil}
    v = index_get_value(&b.index, id)
    if v != nil {return v}
    return self(id, b.parent)
  }

  // in local stack
  if fctx != nil {
    local = search_value_in_block_stack(id, fctx.cblock)
    if local != nil {return local}
  }

  // in current module
  x = get_value_global(id)
  if x != nil {return x}

  // in builtin_module
  builtin = index_get_value(&builtinIndex, id)
  if builtin != nil {return builtin}

  // maybe it is `self`?
  if fctx != nil {if strcmp(id, "self") == 0 {return fctx.cfunc}}

  return nil
}


bind_value = (index : *Index, id : Str, v : *Value) -> () {
  ae = index_get_value(index, id)
  if ae != nil {
    // если значение уже есть но не определено
    if ae.kind != #ValueUndefined {
      error("value bind error: id already bound", v.ti)
      warning("first defined here", ae.ti)
      return
    }

    // это позволяет юзать глобальные значения до того как они будут объявлены
    memcpy(ae, v, sizeof Value)
    return
  }
  index_value_append(index, id, v)
}


// Add bind into a block
bind_value_in_block = (b : *Block, id : Str, v : *Value) -> () {bind_value(&b.index, id, v)}

// Add bind into current block
bind_value_local = (id : Str, v : *Value) -> ()
{bind_value_in_block(fctx.cblock, id, v)}

// Add bind to global module
bind_value_global = (id : Str, v : *Value) -> ()
{bind_value(&module.public, id, v)}


bind_type = (index : *Index, id : Str, t : *Type) -> () {
  /*if map_get(index, id) != nil {
    error("type bind error: attempt to id redefinition", t.ti)
    return
  }*/

  /*printf("bind_type %s\n", id)
  ae = index_get_type(index, id)
  if ae != nil {
    // define already declared type (TypeUndefined)
    if ae.kind != #TypeUndefined {
      error("type bind error: attempt to id redefinition", t.ti)
      return
    }
    printf("bind AE_type: %s\n", id)
    memcpy(ae, t, sizeof Type)
    return
  }*/

  index_type_append(index, id, t)
}



get_type_global = (id : Str) -> *Type {
  // searching in current module
  m = index_get_type(&module.public, id)
  if m != nil {return m}

  // searching amoung imported types
  return index_get_type(&module.private, id)
}


get_type = (id : Str) -> *Type {
  // firstly search in globalTypeIndex тк наибольшая вероятность что тип там
  // тк встроенные типы чаще всего встречаются в коде
  builtin_t = index_get_type(&builtinIndex, id)
  if builtin_t != nil {return builtin_t}

  // searching in local block stack
  if fctx != nil {
    // ищет запись о значении во стеке блоков вплоть до корневого
    search_type_in_block_stack = (id : Str, b : *Block) -> *Type {
      if b == nil {return nil}
      t = index_get_type(&b.index, id)
      if t != nil {return t}
      return self(id, b.parent)
    }
    local = search_type_in_block_stack(id, fctx.cblock)
    if local != nil {return local}
  }

  // searching in current module
  m = get_type_global(id)
  if m != nil {return m}

  // Self type (todo.)
  if strcmp(id, "Self") == 0 {return ctype}

  return nil
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


