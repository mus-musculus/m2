/*****************************************************************************/
/*                              Statement                                    */
/*****************************************************************************/


NoBlock = {#NoBlock}

// Compound Statement
StmtBlock = Tagged (
  parent  : *StmtBlock  // block-parent or nil
  index   : Index   // local index
  stmts   : List    // list of statements

  // список в который попадают все локальные функции
  // для того чтобы их тела потом при check'инге почекать
  local_funcs : List

  ti : *TokenInfo
)

MaybeBlock = StmtBlock or NoBlock

// ?пока нужно но потом?
StmtVarDef   = Tagged (id : *AstId, no : Nat, type : *Type, init_value : *Value, ti : *TokenInfo)

StmtValBind  = Tagged (v : *Value, no : Nat, ti : *TokenInfo)
StmtExpr     = Tagged (v : *Value, ti : *TokenInfo)
StmtAssign   = Tagged (l, r : *Value, ti : *TokenInfo)
StmtIf       = Tagged (cond : *Value, then : *Stmt, else : *Stmt or Unit, ti : *TokenInfo)
StmtWhile    = Tagged (cond : *Value, stmt : *Stmt, ti : *TokenInfo)
StmtReturn   = Tagged (value : *Value or Unit, ti : *TokenInfo)
StmtBreak    = Tagged (ti : *TokenInfo)
StmtAgain    = Tagged (ti : *TokenInfo)
StmtGoto     = Tagged (label : Str, ti : *TokenInfo)
StmtLabel    = Tagged (label : Str, ti : *TokenInfo)


Stmt =  StmtExpr or
        StmtValBind or
        StmtBlock or
        StmtAssign or
        StmtIf or
        StmtWhile or
        StmtReturn or
        StmtBreak or
        StmtAgain or
        StmtGoto or
        StmtLabel or
        StmtVarDef



