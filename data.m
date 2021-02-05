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

