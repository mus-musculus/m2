
import "C"
import "data/node"
import "data/list"
import "data/map"


Index = (types, values : Map)

Module = (public, private, undef : Index)

// parsing function context
FuncContext = (
  id     : Str     // for local resources prefix (str, arr, func, rec)

  cfunc  : *Value
  cblock : *StmtBlock

  loop   : Nat32   // `we're in cycle` semaphore (used by break/continue)

  // генераторы уникальных имен идентификаторов
  locno,           // for local var unical reg
  strno,           // for local string
  arrno,           // for local literal array
  recno  : Nat32   // for local literal record
)




