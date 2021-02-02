
/*****************************************************************************/
/*                               Lexer                                       */
/*****************************************************************************/

tokenMaxLen = 255

TokenKind = {#TokenEOF, #TokenId, #TokenNum, #TokenSym, #TokenString, #TokenComment, #TokenNL}


TokenInfo = (
  file   : Str
  offset : Nat64
  length : Nat16

  line   : Nat32
  start  : Nat16
)


Token = (
  kind : TokenKind,
  ti : TokenInfo,
  text : [0] Nat8
)


/*
 * Lexer state record
 */
LexerState = (
  fd     : Int
  kind   : TokenKind
  token  : [tokenMaxLen]Nat8

  ch     : Nat8   // 'putback' storage
  pos    : Nat16  // position of current char in line

  ti     : TokenInfo
)


Source = (tokens : List)


