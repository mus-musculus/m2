
import "C"
import "data/node"
import "data/list"
import "data/map"


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

AstNodeKind = {#AstNodeComment, #AstNodeImport, #AstNodeBindType, #AstNodeBindValue, #AstNodeDeclType, #AstNodeDeclValue, #AstNodeDeclVar}

AstNode = (kind : AstNodeKind, entity : *Unit)


AstId = (str : Str, ti : *TokenInfo)
AstName = (id, namespace : *AstId, ti : *TokenInfo)


AstTypeKind = {
  #AstTypeUnknown
  #AstTypeNamed
  #AstTypeEnum
  #AstTypeRecord
  #AstTypeArray
  #AstTypeArrayU
  #AstTypeFunc
  #AstTypePointer
  #AstTypeVar
  #AstTypeUnion
}

AstTypeEnum = (constructors : List)
AstTypeRecord = (decls : List /* of *AstDecl */)
AstTypeArray = (of : *AstType, size : *AstValue)
AstTypeArrayU = (of : *AstType)
AstTypePointer = (to : *AstType)
AstTypeFunc = (from, to : *AstType, arghack : Bool)
AstTypeVar = (of : *AstType)
AstTypeUnion = (types : List /* of *AstType */)

AstType = (
  kind : AstTypeKind

  name    : AstName
  enum    : AstTypeEnum
  array   : AstTypeArray
  array_u : AstTypeArrayU
  pointer : AstTypePointer
  record  : AstTypeRecord
  func    : AstTypeFunc
  var     : AstTypeVar
  union   : AstTypeUnion

  ti : *TokenInfo
)


AstDecl = (
  ids : List /* of *AstId */
  type : *AstType
  ti : *TokenInfo /* of `:` */
  extern, arghack : Bool
  _ : [10]Nat8
)

AstNodeComment = (text : Str, ti : *TokenInfo)
AstNodeImport = (line : Str, ti : *TokenInfo)
AstNodeBindType = (id : *AstId, type : *AstType, ti : *TokenInfo)
AstNodeBindValue = (id : *AstId, value : *AstValue, ti : *TokenInfo)
AstNodeDeclVar = (decl : *AstDecl)
AstNodeDeclType = (id : *AstId)
AstNodeDeclValue = (decl : *AstDecl)




AstValueKind = {
  #AstValueForbidden,

  // Literal Values
  #AstValueNum, #AstValueStr,
  #AstValueId, #AstValueFunc, #AstValueArr, #AstValueRec,

  /* Operations */

  // unary
  #AstValueRef, #AstValueDeref, #AstValueNot, #AstValueMinus, #AstValuePlus,

  // binary
  #AstValueAdd, #AstValueSub,
  #AstValueMul, #AstValueDiv, #AstValueMod,
  #AstValueOr, #AstValueXor, #AstValueAnd,

  #AstValueEq, #AstValueNe,
  #AstValueLt, #AstValueGt,
  #AstValueLe, #AstValueGe,

  // special
  #AstValueShl, #AstValueShr,
  #AstValueCall, #AstValueIndex, #AstValueAccess,
  #AstValueCast, #AstValueIs, #AstValueAs,
  #AstValueSizeof, #AstValueAlignof, #AstValueWhen
}

AstValueFunc = (type : *AstType, block_stmt : *AstStmt or Unit)
AstValueCall = (func : *AstValue, args : List)
AstValueIndex = (array, index : *AstValue)
AstValueAccess = (rec : *AstValue, field_id : *AstId)
AstValueCast = (value : *AstValue, type : *AstType)
AstValueIs = (value : *AstValue, type : *AstType)
AstValueAs = (value : *AstValue, type : *AstType)

AstValueWhenVariant = (is_t : *AstType, x, y : *AstValue)
AstValueWhen = (x : *AstValue, variants : List, other : *AstValue)

AstValueRecord = (type : *AstType, values : Map)
AstValueArray = (type : *AstType, items : List)

AstValue = (
  kind : AstValueKind

  str     : Str           // string representation of #AstValueId, #AstValueNum, #AstValueStr
  name    : AstName       // #AstValueName
  operand : [2]*AstValue  // un, bin, shl & shr operands
  of_type : *AstType      // sizeof, alignof

  rec     : AstValueRecord
  array   : AstValueArray

  func    : AstValueFunc
  call    : AstValueCall
  index   : AstValueIndex
  access  : AstValueAccess
  cast    : AstValueCast
  is      : AstValueIs
  as      : AstValueAs
  select  : AstValueWhen

  extern  : Bool

  ti : *TokenInfo
)


AstStmtKind = {
  #AstStmtUnknown,
  #AstStmtValueDef, #AstStmtTypeDef, #AstStmtVarDef,
  #AstStmtExpr, #AstStmtAssign, #AstStmtBlock,
  #AstStmtIf, #AstStmtWhile, #AstStmtReturn,
  #AstStmtBreak, #AstStmtContinue,
  #AstStmtGoto, #AstStmtLabel
}

AstStmtValueDef = (id : *AstId, expr : *AstValue, ti : *TokenInfo)
AstStmtTypeDef  = (id : *AstId, type : *AstType, ti : *TokenInfo)
AstStmtExpr     = (expr : *AstValue, ti : *TokenInfo)
AstStmtAssign   = (l, r : *AstValue, ti : *TokenInfo)
AstStmtBlock    = (stmts : List, ti : *TokenInfo)
AstStmtIf = (
  cond : *AstValue
  then : *AstStmt
  else : *AstStmt or Unit
  ti   : *TokenInfo
)

AstStmtWhile    = (cond : *AstValue, block : *AstStmt, ti : *TokenInfo)
AstStmtReturn   = (value : *AstValue or Unit, ti : *TokenInfo)
AstStmtGoto     = (label : *AstId, ti : *TokenInfo)
AstStmtLabel    = (label : *AstId, ti : *TokenInfo)
AstStmtBreak    = (ti : *TokenInfo)
AstStmtContinue = (ti : *TokenInfo)


/*AstStmt = AstStmtAssign or
          AstStmtValueDef or
          AstStmtTypeDef or
          AstStmtExpr or
          AstStmtBlock or
          AstStmtIf or
          AstStmtWhile or
          AstStmtReturn or
          AstStmtGoto or
          AstStmtLabel or
          AstStmtBreak or
          AstStmtContinue*/


AstStmt = (
  kind     : AstStmtKind

  assign   : AstStmtAssign
  valdef   : AstStmtValueDef
  typedef  : AstStmtTypeDef
  expr     : AstStmtExpr
  block    : AstStmtBlock
  if       : AstStmtIf
  while    : AstStmtWhile
  return   : AstStmtReturn
  goto     : AstStmtGoto
  label    : AstStmtLabel
  break    : AstStmtBreak
  continue : AstStmtContinue
)





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
  lab    : Nat32      // локальная переменная юзается через lab
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

  #ValueUndefined,    // Value was used but not defined

  /* Terminals */

  #ValueImmediate,    // Value#imm

  #ValueGlobalConst,  // Value#assembly_item (id)
  #ValueGlobalVar,    // Value#assembly_item (id)

  #ValueParam,        // Value#reg
  #ValueRecord,       // Value#reg
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


ValueAccess = (value : *Value, field : Str)
ValueBin    = (l, r : *Value)
ValueCall   = (func : *Value, args : *List)
ValueCast   = (value : *Value, type : *Type)
ValueAs     = (value : *Value, type : *Type)
ValueIs     = (value : *Value, variant : Nat)
ValueIndex  = (array, index : *Value)
ValueUn     = (x : *Value)

ValueWhenVariant = (tx : *Type, x, y : *Value)
ValueWhen = (x : *Value, variants : List, other : *Value)

ValueRecord = (type : *Type, values : Map)
ValueArray = (type : *Type, items : List)

Value = (
  kind : ValueKind

  type : *Type

//union (
  // term info
  imm    : Int64        // ValueImmediate
  immx   : List         // List of immediate values for aggreagte immediate

//def    : *Definition  // we cannot import asm/types because of recursive import :(
  def    : *Definition  // ValueGlobalVar & ValueGlobalConst (Definition#reg)
  vardef : *Decl        // ValueLocalVar (VarDef#lab)
  field  : *Decl        // ValueParam (Decl#offset)
  expr   : *Expr        // ValueLocalConst

  // operation info
  un     : ValueUn
  bin    : ValueBin
  index  : ValueIndex
  access : ValueAccess
  cast   : ValueCast
  as     : ValueAs
  is     : ValueIs
  call   : ValueCall
  szof   : *Type
  select : ValueWhen
  load   : *Value  // #ValueLoad
  rec    : ValueRecord
  array  : ValueArray
//)

  //need_load : Bool

  dirty  : Bool

  defined_as : Str

//  declared_at,     // place in code where value was mentioned first time
//  defined_at,      // place in code where value was defined
  ti : *TokenInfo  // place in code where value was mentioned
)



/*****************************************************************************/
/*                              Statement                                    */
/*****************************************************************************/

StmtKind = {
  #StmtForbidden
  #StmtExpr
  #StmtBlock
  #StmtVarDef
  #StmtAssign
  #StmtIf
  #StmtWhile
  #StmtReturn
  #StmtBreak
  #StmtContinue
  #StmtGoto
  #StmtLabel
}

Index = (types, values : Map)

// Compound Statement
Block = (
  parent  : *Block  // block-parent or nil
  index   : Index   // local index
  stmts   : List    // list of statements

  // список в который попадают все локальные функции
  // для того чтобы их тела потом при check инге прочекать
  local_funcs : List

  ti : *TokenInfo
)

Expr = (v : *Value, reg : Nat32)


If = (cond : *Value, then : *Stmt, else : *Stmt or Unit)

While = (cond : *Value, stmt : *Stmt)




// StmtForbidden = () // его просто нельзя создать!
StmtExpr = (v : *Value, reg : Nat32, ti : *TokenInfo)
StmtBlock = Block
StmtAssign = (l, r : *Value, ti : *TokenInfo)
StmtIf = (cond : *Value, then : *Stmt, else : *Stmt or Unit, ti : *TokenInfo)
StmtWhile = (cond : *Value, stmt : *Stmt, ti : *TokenInfo)
StmtReturn = (value : *Value or Unit, ti : *TokenInfo)
StmtBreak = (ti : *TokenInfo)
StmtContinue = (ti : *TokenInfo)
StmtGoto = (label : Str, ti : *TokenInfo)
StmtLabel = (label : Str, ti : *TokenInfo)


Stmt2 = StmtExpr or
        StmtBlock or
        StmtAssign or
        StmtIf or
        StmtWhile or
        StmtReturn or
        StmtBreak or
        StmtContinue or
        StmtGoto or
        StmtLabel


Stmt = (
  kind : StmtKind

//union (
  expr : Expr       // StmtExpr
  assign : StmtAssign
  block : Block      // block statement

  v : *Decl    // var definition
  if : If         // if statement
  while : While      // while statement
  return : StmtReturn
  goto : StmtGoto
  label : StmtLabel
  break : StmtBreak
  continue : StmtContinue

  l : Str        // goto & label statement

//)

  ti : *TokenInfo
)





Module = (public, private, undef : Index)


// parsing function context
FuncContext = (
  id     : Str     // for local strings prefix

  cfunc  : *Value
  cblock : *Block

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
DefFunc  = (id : Str, type : *Type, block : *Block)
DefVar   = (id : Str, type : *Type, init_value : *Value)
DefAlias = (id : Str, type : *Type, org : Str)

/*Definition = DefType or
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


LLVM_ValueKind = {
  #LLVM_ValueInvalid    // An error occurred while evaluation

  #LLVM_ValueUndef      // for llvm `undef` value
  #LLVM_ValueZero       // for llvm `zeroinitializer` value

  #LLVM_ValueEmpty      // Unit () 'value'

  #LLVM_ValueImmediate  // Numeric value in imm field

  /*
   * Global Immutable LLVM_Valueect used by name
   * such as funcs, strings, literal arrays & records
   */
  #LLVM_ValueGlobalConst

  // variables
  #LLVM_ValueLocalVar
  #LLVM_ValueGlobalVar

  // register
  #LLVM_ValueAddress    // address of value in register
  #LLVM_ValueRegister   // value in register
}


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


// Операнд - тип значения и его местоположение
// Является результатом вычисления
// Операнды Global, Local & Address нуждаются в загрузке (load)
// перед использованием справа (rval)
LLVM_Value = (
  kind : LLVM_ValueKind

  type : *Type

  imm  : Int64  // #LLVM_ValueImmediate
  id   : Str    // #LLVM_ValueGlobalConst, #LLVM_ValueLocalVar, #LLVM_ValueGlobalVar
  reg  : Nat32  // #LLVM_ValueRegister, #LLVM_ValueAddress
)


// обрабатывает lval
DoValue = (x : *AstValue) -> *Value

// обрабатывает как rval так и lval
// load - значит что нужно загружать значение
// если оно Id Deref Index или Access
DoValuex = (x : *AstValue, load : Bool) -> *Value

DoType = (x : *AstType) -> *Type

DoStmt = (x : *AstStmt) -> *Stmt or Unit


Eval = (x : *Value) -> LLVM_Value


