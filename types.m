
import "C"
import "data/node"
import "data/list"
import "data/map"




Context = (parent : *Self, index : Index)

Module = (ctx : Context)

// parsing function context
FuncContext = (
  id     : Str     // for local resources prefix (str, arr, func, rec)

  cfunc  : *Value
  cblock : *StmtBlock

  ctx : Context

  local_funcs : List // вообще не юзается принтером почему то,,,,

  loop   : Nat32   // `we're in cycle` semaphore (used by break/continue)

  // генераторы уникальных имен идентификаторов
  strno,           // for local string
  arrno,           // for local literal array
  recno  : Nat32   // for local literal record
)




