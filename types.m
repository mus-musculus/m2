
import "C"
import "data/node"
import "data/list"
import "data/map"


import "nothing"
import "scanner/types"
import "parser/types"
import "type/types"
import "value/types"
import "stmt/types"
import "printer/types"


Module = (public, private, undef : Index)

// parsing function context
FuncContext = (
  id     : Str     // for local strings prefix

  cfunc  : *Value
  cblock : *StmtBlock

  loop   : Nat32   // `we're in cycle` semaphore (used by break/continue)

  // генераторы уникальных имен идентификаторов
  locno,           // for local var unical reg
  strno,           // for local string
  arrno,           // for local literal array
  recno  : Nat32   // for local literal record
)




