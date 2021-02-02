
import "C"
import "data/node"
import "data/list"
import "data/map"


import "nothing"
import "scanner/types"
import "parser/types"


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

ValuePoison  = Tagged (ti : *TokenInfo)
ValueUndefined = Tagged (type : *Type, ti : *TokenInfo)
ValueImm     = Tagged (type : *Type, value : Int64, ti : *TokenInfo)
ValueGenericRecord = Tagged (type : *Type, values : Map, ti : *TokenInfo)
ValueRecord  = Tagged (type : *Type, values : Map, ti : *TokenInfo)
ValueArray   = Tagged (type : *Type, items : List, ti : *TokenInfo)
ValueMention = Tagged (type : *Type, of : *Value, ti : *TokenInfo)

ValueUn     = (type : *Type, value : *Value, ti : *TokenInfo)

ValueRef = Tagged ValueUn
ValueDeref = Tagged ValueUn
ValueNot = Tagged ValueUn
ValueMinus = Tagged ValueUn
ValuePlus = Tagged ValueUn

ValueBin    = (type : *Type, kind : ValueKind, left, right : *Value, ti : *TokenInfo)

ValueAdd = Tagged ValueBin
ValueSub = Tagged ValueBin
ValueMul = Tagged ValueBin
ValueDiv = Tagged ValueBin
ValueMod = Tagged ValueBin
ValueOr = Tagged ValueBin
ValueXor = Tagged ValueBin
ValueAnd = Tagged ValueBin
ValueEq = Tagged ValueBin
ValueNe = Tagged ValueBin
ValueLt = Tagged ValueBin
ValueGt = Tagged ValueBin
ValueLe = Tagged ValueBin
ValueGe = Tagged ValueBin
ValueShl = Tagged ValueBin
ValueShr = Tagged ValueBin

ValueCall   = Tagged (type : *Type, func : *Value, args : *List, ti : *TokenInfo)
ValueAccess = Tagged (type : *Type, value : *Value, field : Str, ti : *TokenInfo)
ValueIndex  = Tagged (type : *Type, array, index : *Value, ti : *TokenInfo)
ValueCast   = Tagged (type : *Type, value : *Value, type : *Type, ti : *TokenInfo)
ValueAs     = Tagged (type : *Type, value : *Value, type : *Type, ti : *TokenInfo)
ValueIs     = Tagged (type : *Type, value : *Value, logic : Bool, variant : Nat, ti : *TokenInfo)
ValueIsnt = Tagged ValueIs

ValueWhenVariant = Tagged (t : *Type, x, y : *Value, t_no : Nat, ti : *TokenInfo)
ValueWhen   = Tagged (type : *Type, iss : Bool, x : *Value, variants : List, other : *Value, ti : *TokenInfo)


// и ValueGlobalVar и ValueGlobalConst юзают ссылку на определение
// в котором лежит их id. Сделано так потому что id в определении
// может меняться ренеймом, тк изначально они анонимны, а потом как бог даст.
ValueGlobalVar   = Tagged (type : *Type, def : *Definition, ti : *TokenInfo)
ValueGlobalConst = Tagged (type : *Type, def : *Definition, ti : *TokenInfo)
// у параметра в no просто его порядковый номер
ValueParam = Tagged (type : *Type, no : Nat, ti : *TokenInfo)

// no - уникальный порядковый номер для каждой переменной
// (или просто номер для параметра)
ValueLocalVar = Tagged (type : *Type, no : Nat, ti : *TokenInfo)
ValueLocalVal = Tagged (type : *Type, no : Nat, ti : *TokenInfo)

ValueNo = {#ValueNo}

Value2 = ValuePoison or
        ValueUndefined or
        ValueImm or
        ValueRecord or        //? приведенное
        ValueGenericRecord or //? не приведенное (объедини!)
        ValueArray or
        ValueGlobalVar or
        ValueGlobalConst or
        ValueParam or        // <<< ValueLocalVal
        ValueLocalVar or
        ValueLocalVal or

        ValueRef or
        ValueDeref or
        ValueNot or
        ValueMinus or
        ValuePlus or

        ValueAdd or
        ValueSub or
        ValueMul or
        ValueDiv or
        ValueMod or
        ValueOr or
        ValueXor or
        ValueAnd or
        ValueEq or
        ValueNe or
        ValueLt or
        ValueGt or
        ValueLe or
        ValueGe or
        ValueShl or
        ValueShr or

        ValueIndex or
        ValueAccess or
        ValueCast or
        ValueAs or
        ValueIs or
        ValueIsnt or
        ValueCall or
        ValueWhen or
        ValueNo


Value = (
  kind : ValueKind

  type : *Type

  data : Value2

//union (
  imm     : ValueImm
  //mention : ValueMention
  rec     : ValueRecord
  arr     : ValueArray

  // operation info
  gvar   : ValueGlobalVar
  gconst : ValueGlobalConst
  param  : ValueParam
  lvar   : ValueLocalVar
  locval : ValueLocalVal

  un     : ValueUn
  bin    : ValueBin
  index  : ValueIndex
  access : ValueAccess
  cast   : ValueCast
  as     : ValueAs
  is     : ValueIs
  call   : ValueCall
  when   : ValueWhen

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


Stmt = StmtValBind or
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





