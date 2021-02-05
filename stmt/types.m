/*****************************************************************************/
/*                              Statement                                    */
/*****************************************************************************/


NoBlock = {#NoBlock}

// Compound Statement
StmtBlock = NewType (
  ctx     : Context

  stmts   : List

  ti : *TokenInfo
)

MaybeBlock = StmtBlock or NoBlock

// ?пока нужно но потом?
StmtVarDef   = NewType (id : *AstId, no : Nat, type : *Type, init_value : *Value, ti : *TokenInfo)

StmtValBind  = NewType (v : *Value, no : Nat, ti : *TokenInfo)
StmtExpr     = NewType (v : *Value, ti : *TokenInfo)
StmtAssign   = NewType (l, r : *Value, ti : *TokenInfo)
StmtIf       = NewType (cond : *Value, then : *Stmt, else : *Stmt or Unit, ti : *TokenInfo)
StmtWhile    = NewType (cond : *Value, stmt : *Stmt, ti : *TokenInfo)
StmtReturn   = NewType (value : *Value or Unit, ti : *TokenInfo)
StmtBreak    = NewType (ti : *TokenInfo)
StmtAgain    = NewType (ti : *TokenInfo)
StmtGoto     = NewType (label : Str, ti : *TokenInfo)
StmtLabel    = NewType (label : Str, ti : *TokenInfo)


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



