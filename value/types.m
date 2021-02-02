/*****************************************************************************/
/*                               Value                                       */
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
  type : *Type

  data : Value2

  rec     : ValueRecord
  index  : ValueIndex
  gconst : ValueGlobalConst

  locval : ValueLocalVal
  gvar   : ValueGlobalVar
  lvar   : ValueLocalVar



  ti : *TokenInfo  // place in code where value was mentioned
)

