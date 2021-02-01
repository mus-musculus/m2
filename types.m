
import "C"
import "data/node"
import "data/list"
import "data/map"


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


/*****************************************************************************/
/*                           Parser Type (AST)                               */
/*****************************************************************************/

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


/*****************************************************************************/
/*                           Parser Value (AST)                              */
/*****************************************************************************/

AstValueFunc   = (type : *AstType, block_stmt : *AstStmt or Unit, ti : *TokenInfo)
AstValueCall   = (func : *AstValue, args : List, ti : *TokenInfo)
AstValueIndex  = (array, index : *AstValue, ti : *TokenInfo)
AstValueAccess = (rec : *AstValue, field_id : *AstId, ti : *TokenInfo)

AstValueValType = (value : *AstValue, type : *AstType, ti : *TokenInfo)
AstValueCast   = Tagged AstValueValType
AstValueIs     = Tagged AstValueValType
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
            AstValueAs or
            AstValueWhen or
            AstValueSizeof or
            AstValueAlignof


ValueParserError = {#ValueParserError}

// TODO
ValueParserResult = AstValue or ValueParserError

AstValueParser = () -> *AstValue


/*****************************************************************************/
/*                        Parser Statement (AST)                             */
/*****************************************************************************/

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


/*****************************************************************************/
/*                            Compiler (ASG)                                   */
/*****************************************************************************/



/*****************************************************************************/
/*                                Types                                      */
/*****************************************************************************/

TypeNumeric = (power : Nat, signed : Bool)
TypeArray   = (of : *Type, volume : Nat)
TypeArrayU  = (of : *Type)
TypeFunc    = (from, to : *Type, arghack : Bool)
TypePointer = (to : *Type)
TypeRecord  = (decls : *List, end : Nat)
TypeVar     = (of : *Type)
TypeEnum    = (cons : *List)
TypeUnion   = (types : List, impl : *Type, data_size : Nat)

EnumConstructor = (id : *AstId, d : Nat32, ti : *TokenInfo)

Decl = (
  id     : *AstId     // тк хранит еще и ti идентификатора этого поля
  type   : *Type
  align  : Nat        // выравнивание поля
  offset : Nat16      // field offset
  no     : Nat   // номер для идентификации регистра
  init_value : *Value
  ti     : *TokenInfo
)


/*
 * Type Kind
 */
TypeKind = {
  // #TypeForbidden - запрещенный вид типа
  // используемый только для отладки компилятора
  #TypeForbidden

  // неопределенный (но задекларированный) тип
  #TypeUndefined

  // #TypePoison - тип который по каким то причинам не был распознан.
  // ошибку по этому поводу уже выдали, дальше он просто едет по конвейеру
  // заражая все к чему прикасается (типы зависящие от него превращаются в #TypePoison,
  // а значения этого типа сразу же становятся #ValuePoison
  #TypePoison

  // Специальный тип для универсального указателя nil
  #TypeGenericReference

  // Тип для записи
  #TypeGenericRecord

  // Nat8, Nat16, Int8, Int16, etc.
  // see TypeNumeric (TypeNumeric#power, TypeNumeric#signed)
  // when TypeNumeric#power == 0 => it is GeneicNumeric
  #TypeNumeric

  #TypeVar

  #TypeBool
  #TypeFunc
  #TypeEnum
  #TypeRecord
  #TypePointer
  #TypeArray
  #TypeArrayU

  #TypeUnion
}


/*Type = TypePoison or
       TypeGenericReference or
       TypeNumeric or
       TypeVar or
       TypeBool or
       TypeFunc or
       TypeEnum or
       TypeRecord or
       TypePointer or
       TypeArray or
       TypeArrayU or
       TypeUnion*/

/*
 * Type Structure
 */
Type = (
  kind  : TypeKind

  uid   : Nat32

  aka   : Str         // type alias (used by printer)


  size, align  : Nat  // размер и выравнивание в байтах

//union (
    num      : TypeNumeric
    func     : TypeFunc
    pointer  : TypePointer
    array    : TypeArray
    array_u  : TypeArrayU
    record   : TypeRecord
    enum     : TypeEnum
    var      : TypeVar
    union    : TypeUnion
//)

  ti : *TokenInfo  // place in code where type was mentioned
)



/*****************************************************************************/
/*                               Values                                      */
/*****************************************************************************/

ValueKind = {
  #ValueForbidden,    // for debug

  #ValuePoison,

  #ValueUndefined,    // Value was marked as `exist` but not defined

  /* Terminals */

  #ValueImmediate,    // Value#imm
  #ValueMention,      // Using value by name

  #ValueGlobalConst,  // Value#assembly_item (id)
  #ValueGlobalVar,    // Value#assembly_item (id)

  #ValueParam,        // Value#reg
  #ValueRecord,       // Value#reg
  #ValueGenericRecord // #type=nil, need cast
  #ValueArray,        // Value#reg

  #ValueLocalConst,   // Value#expr (reg)
  #ValueLocalVar,     // Value#vardef (reg)

  /* Operations */

  /* unary */
  #ValueRef,
  #ValueDeref,
  #ValueNot,
  #ValueMinus,
  #ValuePlus,

  /* binary */
  #ValueAdd, #ValueSub,
  #ValueMul, #ValueDiv, #ValueMod,
  #ValueOr, #ValueXor, #ValueAnd,

  #ValueEq, #ValueNe,
  #ValueLt, #ValueGt,
  #ValueLe, #ValueGe,

  /* special */
  #ValueLoad,
  #ValueShl, #ValueShr,
  #ValueCall,
  #ValueIndex,
  #ValueAccess,
  #ValueCast,
  #ValueIs,
  #ValueAs,
  #ValueWhen
}


ValueImm     = (type : *Type, value : Int64, ti : *TokenInfo)
ValueRecord  = (type : *Type, values : Map, ti : *TokenInfo)
ValueArray   = (type : *Type, items : List, ti : *TokenInfo)
ValueMention = (type : *Type, of : *Value, ti : *TokenInfo)

ValueUn     = (type : *Type, value : *Value, ti : *TokenInfo)
ValueBin    = (type : *Type, kind : ValueKind, left, right : *Value, ti : *TokenInfo)
ValueCall   = (type : *Type, func : *Value, args : *List, ti : *TokenInfo)
ValueAccess = (type : *Type, value : *Value, field : Str, ti : *TokenInfo)
ValueIndex  = (type : *Type, array, index : *Value, ti : *TokenInfo)
ValueCast   = (type : *Type, value : *Value, type : *Type, ti : *TokenInfo)
ValueAs     = (type : *Type, value : *Value, type : *Type, ti : *TokenInfo)
ValueIs     = (type : *Type, value : *Value, variant : Nat, ti : *TokenInfo)

ValueWhenVariant = (t : *Type, x, y : *Value, t_no : Nat, ti : *TokenInfo)
ValueWhen   = (type : *Type, iss : Bool, x : *Value, variants : List, other : *Value, ti : *TokenInfo)



Value = (
  kind : ValueKind

  type : *Type

//union (
  imm     : ValueImm
  mention : ValueMention
  rec     : ValueRecord
  arr     : ValueArray
  no      : Nat // уникальный порядковый номер для каждой переменной


  def    : *Definition  // ValueGlobalVar & ValueGlobalConst (Definition#reg)
  vardef : *Decl        // ValueLocalVar (VarDef#lab)
  param  : *Decl        // ValueParam (Decl#offset)


  // operation info
  un     : ValueUn
  bin    : ValueBin
  index  : ValueIndex
  access : ValueAccess
  cast   : ValueCast
  as     : ValueAs
  is     : ValueIs
  call   : ValueCall
  when   : ValueWhen

  //load   : *Value  // #ValueLoad
//)

  ti : *TokenInfo  // place in code where value was mentioned
)



/*****************************************************************************/
/*                              Statement                                    */
/*****************************************************************************/

Index = (types, values : Map)

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
StmtAssign   = Tagged (l, r : *Value, ti : *TokenInfo)
StmtIf       = Tagged (cond : *Value, then : *Stmt, else : *Stmt or Unit, ti : *TokenInfo)
StmtWhile    = Tagged (cond : *Value, stmt : *Stmt, ti : *TokenInfo)
StmtReturn   = Tagged (value : *Value or Unit, ti : *TokenInfo)
StmtBreak    = Tagged (ti : *TokenInfo)
StmtAgain    = Tagged (ti : *TokenInfo)
StmtGoto     = Tagged (label : Str, ti : *TokenInfo)
StmtLabel    = Tagged (label : Str, ti : *TokenInfo)


Nothing = {#Nothing}

Stmt2 = StmtValBind or
        StmtBlock or
        StmtAssign or
        StmtIf or
        StmtWhile or
        StmtReturn or
        StmtBreak or
        StmtAgain or
        StmtGoto or
        StmtLabel or
        StmtVarDef or
        Nothing


Stmt = (

  data : Stmt2
)





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



/*****************************************************************************/
/*                             Assembly                                      */
/*****************************************************************************/


DefinitionKind = {#DefType, #DefConst, #DefStr, #DefArray, #DefFunc, #DefVar, #DefAlias}


DefType  = (id : Str, type : *Type)
DefConst = (id : Str, type : *Type, value : *Value)
DefStr   = (id : Str, type : *Type, data : Str, len : Nat)
DefArray = (id : Str, type : *Type, len : Nat, values : *List)
DefFunc  = (id : Str, type : *Type, block : MaybeBlock)
DefVar   = (id : Str, type : *Type, init_value : *Value)
DefAlias = (id : Str, type : *Type, org : Str)

/*Definition2 = DefType or
             DefConst or
             DefStr or
             DefArray or
             DefFunc or
             DefVar or
             DefAlias*/


Definition = (
  kind : DefinitionKind

  stringdef : DefStr
  typedef   : DefType
  constdef  : DefConst
  arraydef  : DefArray
  funcdef   : DefFunc
  vardef    : DefVar
  aliasdef  : DefAlias
)



Assembly = (
  name : Str

  datalayout,
  triple : Str  // for LLVM (stub)

  // sections
  types,        // of *DefType
  aliases,      // od *DefAlias
  arrays,       // of *DefArray
  strings,      // of *DefStr
  vars,         // of *DefVar
  funcs : List  // of *DefFunc
)



/*****************************************************************************/
/*                                LLVM                                       */
/*****************************************************************************/


Arch = {#Arch_Unknown, #Arch-x64, #Arch-ARM-CM3}



/*LLVM_ValueSpecialKind = {
  #LLVM_ValueUndef2      // for llvm `undef` value
  #LLVM_ValueZero2       // for llvm `zeroinitializer` value
  #LLVM_ValueEmpty2      // Unit () 'value'
}
LLVM_ValueSpecial = (
  kind : LLVM_ValueSpecialKind
)

LLVM_ValueImmediate = (
  type : *Type
  imm  : Int64
)

LLVM_ValueNamedKind = {
  #LLVM_ValueGlobalConst2,
  #LLVM_ValueLocalVar2,
  #LLVM_ValueGlobalVar2
}
LLVM_ValueNamed = (
  type : *Type
  id   : Str
)

LLVM_ValueRegKind = {
  #LLVM_ValueRegister2,
  #LLVM_ValueAddress2
}
LLVM_ValueReg = (
  kind : LLVM_ValueRegKind
  type : *Type
  reg  : Nat32
)*/

/*LLVM_Value = LLVM_ValueSpecial or
             LLVM_ValueImmediate or
             LLVM_ValueNamed or
             LLVM_ValueReg*/




// обрабатывает lval
DoValue = (x : *AstValue) -> *Value

// обрабатывает как rval так и lval
// load - значит что нужно загружать значение
// если оно Id Deref Index или Access
DoValuex = (x : *AstValue, load : Bool) -> *Value

DoType = (x : *AstType) -> *Type

DoStmt = (x : *AstStmt) -> *Stmt or Unit





