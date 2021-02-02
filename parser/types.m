/*****************************************************************************/
/*                            Parser (AST)                                   */
/*****************************************************************************/

ParserState = (src : *Source, token_node : *Node)


AstNodeList = List

AstModule = (nodes : AstNodeList, src : *Source)

ParserError = {#ParserError}

ParserResult = AstModule or ParserError


AstId = (str : Str, ti : *TokenInfo)
AstName = (id, namespace : *AstId, ti : *TokenInfo)

AstIdList = List

AstDecl = (
  ids : AstIdList
  type : *AstType
  ti : *TokenInfo
  extern, arghack : Bool
)

AstNodeComment   = Tagged (text : Str, ti : *TokenInfo)
AstNodeImport    = Tagged (line : Str, ti : *TokenInfo)
AstNodeBindType  = Tagged (id : *AstId, type : *AstType, ti : *TokenInfo)
AstNodeBindValue = Tagged (id : *AstId, value : *AstValue, ti : *TokenInfo)
AstNodeDeclType  = Tagged (id : *AstId)
AstNodeDeclValue = Tagged (decl : *AstDecl)
AstNodeDeclVar   = Tagged (decl : *AstDecl)


AstNode = AstNodeComment or
          AstNodeImport or
          AstNodeBindType or
          AstNodeBindValue or
          AstNodeDeclType or
          AstNodeDeclValue or
          AstNodeDeclVar


//
//  Parser Type
//

AstDeclList = List
AstTypeList = List

AstTypeNamed   = AstName
AstTypeEnum    = Tagged (items : List, ti : *TokenInfo)
AstTypeRecord  = Tagged (decls : AstDeclList, ti : *TokenInfo)
AstTypeArray   = Tagged (of : *AstType, size : *AstValue, ti : *TokenInfo)
AstTypeArrayU  = Tagged (of : *AstType, ti : *TokenInfo)
AstTypePointer = Tagged (to : *AstType, ti : *TokenInfo)
AstTypeFunc    = Tagged (from, to : *AstType, arghack : Bool, ti : *TokenInfo)
AstTypeVar     = Tagged (of : *AstType, ti : *TokenInfo)
AstTypeSpecial = Tagged (type : *AstType, ti : *TokenInfo)
AstTypeUnion   = Tagged (types : AstTypeList, ti : *TokenInfo)

TypeParserError = {#TypeParserError}

AstType = AstTypeNamed or
          AstTypeEnum or
          AstTypeRecord or
          AstTypeArray or
          AstTypeArrayU or
          AstTypePointer or
          AstTypeFunc or
          AstTypeVar or
          AstTypeSpecial or
          AstTypeUnion

AstTypeParser = () -> *AstType


//
//  Parser Value
//

AstValueFunc   = (type : *AstType, block_stmt : *AstStmt or Unit, ti : *TokenInfo)
AstValueCall   = (func : *AstValue, args : List, ti : *TokenInfo)
AstValueIndex  = (array, index : *AstValue, ti : *TokenInfo)
AstValueAccess = (rec : *AstValue, field_id : *AstId, ti : *TokenInfo)

AstValueValType = (value : *AstValue, type : *AstType, ti : *TokenInfo)
AstValueCast   = Tagged AstValueValType
AstValueIs     = Tagged AstValueValType
AstValueIsnt   = Tagged AstValueValType
AstValueAs     = Tagged AstValueValType

AstValueWhenVariant = (is_t : *AstType, x, y : *AstValue, ti : *TokenInfo)
AstValueWhen = (x : *AstValue, variants : List, other : *AstValue, ti : *TokenInfo)

AstValueRecord = (values : Map, ti : *TokenInfo)
AstValueArray  = (items : List, ti : *TokenInfo)

AstValueBinary = (left, right : *AstValue, ti : *TokenInfo)
AstValueAdd = Tagged AstValueBinary
AstValueSub = Tagged AstValueBinary
AstValueMul = Tagged AstValueBinary
AstValueDiv = Tagged AstValueBinary
AstValueMod = Tagged AstValueBinary
AstValueAnd = Tagged AstValueBinary
AstValueOr  = Tagged AstValueBinary
AstValueXor = Tagged AstValueBinary
AstValueEq  = Tagged AstValueBinary
AstValueNe  = Tagged AstValueBinary
AstValueLt  = Tagged AstValueBinary
AstValueGt  = Tagged AstValueBinary
AstValueLe  = Tagged AstValueBinary
AstValueGe  = Tagged AstValueBinary
AstValueShl = Tagged AstValueBinary
AstValueShr = Tagged AstValueBinary

AstValueUnary = (value : *AstValue, ti : *TokenInfo)
AstValueRef   = Tagged AstValueUnary
AstValueDeref = Tagged AstValueUnary
AstValueMinus = Tagged AstValueUnary
AstValuePlus  = Tagged AstValueUnary
AstValueNot   = Tagged AstValueUnary

AstValueSizeof  = Tagged (type : *AstType, ti : *TokenInfo)
AstValueAlignof = Tagged (type : *AstType, ti : *TokenInfo)

AstValueString = Tagged (string : Str, ti : *TokenInfo)
AstValueNumber = Tagged (string : Str, ti : *TokenInfo)

AstValueName = AstName


AstValue =  AstValueName or
            AstValueRecord or
            AstValueArray or
            AstValueString or
            AstValueNumber or
            AstValueFunc or

            AstValueRef or
            AstValueDeref or
            AstValueMinus or
            AstValuePlus or
            AstValueNot or

            AstValueAdd or
            AstValueSub or
            AstValueMul or
            AstValueDiv or
            AstValueMod or
            AstValueAnd or
            AstValueOr or
            AstValueXor or
            AstValueEq or
            AstValueNe or
            AstValueLt or
            AstValueGt or
            AstValueLe or
            AstValueGe or
            AstValueShl or
            AstValueShr or

            AstValueCall or
            AstValueIndex or
            AstValueAccess or
            AstValueCast or
            AstValueIs or
            AstValueIsnt or
            AstValueAs or
            AstValueWhen or
            AstValueSizeof or
            AstValueAlignof


ValueParserError = {#ValueParserError}

// TODO
ValueParserResult = AstValue or ValueParserError

AstValueParser = () -> *AstValue


//
//  Parser Statement
//

AstStmtValueBind = Tagged (id : *AstId, expr : *AstValue, ti : *TokenInfo)
AstStmtTypeBind  = Tagged (id : *AstId, type : *AstType, ti : *TokenInfo)
AstStmtExpr      = Tagged (expr : *AstValue, ti : *TokenInfo)
AstStmtAssign    = Tagged (l, r : *AstValue, ti : *TokenInfo)
AstStmtBlock     = Tagged (stmts : List, ti : *TokenInfo)
AstStmtIf = Tagged (
  cond : *AstValue
  then : *AstStmt
  else : *AstStmt or Unit
  ti   : *TokenInfo
)

AstStmtWhile    = Tagged (cond : *AstValue, block : *AstStmt, ti : *TokenInfo)
AstStmtReturn   = Tagged (value : *AstValue or Unit, ti : *TokenInfo)
AstStmtGoto     = Tagged (label : *AstId, ti : *TokenInfo)
AstStmtLabel    = Tagged (label : *AstId, ti : *TokenInfo)
AstStmtBreak    = Tagged (ti : *TokenInfo)
AstStmtAgain = Tagged (ti : *TokenInfo)


AstStmt = AstStmtAssign or
          AstStmtValueBind or
          AstStmtTypeBind or
          AstStmtExpr or
          AstStmtBlock or
          AstStmtIf or
          AstStmtWhile or
          AstStmtReturn or
          AstStmtGoto or
          AstStmtLabel or
          AstStmtBreak or
          AstStmtAgain


AstStmtParser = (ti : *TokenInfo) -> *AstStmt or Unit


