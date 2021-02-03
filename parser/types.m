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

AstNodeComment   = NewType (text : Str, ti : *TokenInfo)
AstNodeImport    = NewType (line : Str, ti : *TokenInfo)
AstNodeBindType  = NewType (id : *AstId, type : *AstType, ti : *TokenInfo)
AstNodeBindValue = NewType (id : *AstId, value : *AstValue, ti : *TokenInfo)
AstNodeDeclType  = NewType (id : *AstId)
AstNodeDeclValue = NewType (decl : *AstDecl)
AstNodeDeclVar   = NewType (decl : *AstDecl)


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
AstTypeEnum    = NewType (items : List, ti : *TokenInfo)
AstTypeRecord  = NewType (decls : AstDeclList, ti : *TokenInfo)
AstTypeArray   = NewType (of : *AstType, size : *AstValue, ti : *TokenInfo)
AstTypeArrayU  = NewType (of : *AstType, ti : *TokenInfo)
AstTypePointer = NewType (to : *AstType, ti : *TokenInfo)
AstTypeFunc    = NewType (from, to : *AstType, arghack : Bool, ti : *TokenInfo)
AstTypeVar     = NewType (of : *AstType, ti : *TokenInfo)
AstTypeNewType = NewType (type : *AstType, ti : *TokenInfo)
AstTypeUnion   = NewType (types : AstTypeList, ti : *TokenInfo)

AstTypeBinary = (left, right : *AstType, ti : *TokenInfo)
AstTypeOr = NewType AstTypeBinary
AstTypeAnd = NewType AstTypeBinary

TypeParserError = {#TypeParserError}

AstType = AstTypeNamed or
          AstTypeEnum or
          AstTypeOr or
          AstTypeAnd or
          AstTypeRecord or
          AstTypeArray or
          AstTypeArrayU or
          AstTypePointer or
          AstTypeFunc or
          AstTypeVar or
          AstTypeNewType or
          AstTypeUnion


//
//  Parser Value
//

AstValueFunc   = (type : *AstType, block_stmt : *AstStmt or Unit, ti : *TokenInfo)
AstValueCall   = (func : *AstValue, args : List, ti : *TokenInfo)
AstValueIndex  = (array, index : *AstValue, ti : *TokenInfo)
AstValueAccess = (rec : *AstValue, field_id : *AstId, ti : *TokenInfo)

AstValueValType = (value : *AstValue, type : *AstType, ti : *TokenInfo)
AstValueCast   = NewType AstValueValType
AstValueIs     = NewType AstValueValType
AstValueIsnt   = NewType AstValueValType
AstValueAs     = NewType AstValueValType

AstValueWhenVariant = (is_t : *AstType, x, y : *AstValue, ti : *TokenInfo)
AstValueWhen = (x : *AstValue, variants : List, other : *AstValue, ti : *TokenInfo)

AstValueRecord = (values : Map, ti : *TokenInfo)
AstValueArray  = (items : List, ti : *TokenInfo)

AstValueBinary = (left, right : *AstValue, ti : *TokenInfo)
AstValueAdd = NewType AstValueBinary
AstValueSub = NewType AstValueBinary
AstValueMul = NewType AstValueBinary
AstValueDiv = NewType AstValueBinary
AstValueMod = NewType AstValueBinary
AstValueAnd = NewType AstValueBinary
AstValueOr  = NewType AstValueBinary
AstValueXor = NewType AstValueBinary
AstValueEq  = NewType AstValueBinary
AstValueNe  = NewType AstValueBinary
AstValueLt  = NewType AstValueBinary
AstValueGt  = NewType AstValueBinary
AstValueLe  = NewType AstValueBinary
AstValueGe  = NewType AstValueBinary
AstValueShl = NewType AstValueBinary
AstValueShr = NewType AstValueBinary

AstValueUnary = (value : *AstValue, ti : *TokenInfo)
AstValueRef   = NewType AstValueUnary
AstValueDeref = NewType AstValueUnary
AstValueMinus = NewType AstValueUnary
AstValuePlus  = NewType AstValueUnary
AstValueNot   = NewType AstValueUnary

AstValueSizeof  = NewType (type : *AstType, ti : *TokenInfo)
AstValueAlignof = NewType (type : *AstType, ti : *TokenInfo)

AstValueString = NewType (string : Str, ti : *TokenInfo)
AstValueNumber = NewType (string : Str, ti : *TokenInfo)

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


//
//  Parser Statement
//

AstStmtValueBind = NewType (id : *AstId, expr : *AstValue, ti : *TokenInfo)
AstStmtTypeBind  = NewType (id : *AstId, type : *AstType, ti : *TokenInfo)
AstStmtExpr      = NewType (expr : *AstValue, ti : *TokenInfo)
AstStmtAssign    = NewType (l, r : *AstValue, ti : *TokenInfo)
AstStmtBlock     = NewType (stmts : List, ti : *TokenInfo)
AstStmtIf = NewType (
  cond : *AstValue
  then : *AstStmt
  else : *AstStmt or Unit
  ti   : *TokenInfo
)

AstStmtWhile    = NewType (cond : *AstValue, block : *AstStmt, ti : *TokenInfo)
AstStmtReturn   = NewType (value : *AstValue or Unit, ti : *TokenInfo)
AstStmtGoto     = NewType (label : *AstId, ti : *TokenInfo)
AstStmtLabel    = NewType (label : *AstId, ti : *TokenInfo)
AstStmtBreak    = NewType (ti : *TokenInfo)
AstStmtAgain    = NewType (ti : *TokenInfo)


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


