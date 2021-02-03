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

ValuePoison  = NewType (ti : *TokenInfo)
ValueUndefined = NewType (type : *Type, ti : *TokenInfo)
ValueImm     = NewType (type : *Type, value : Int64, ti : *TokenInfo)
ValueGenericRecord = NewType (type : *Type, values : Map, ti : *TokenInfo)
ValueRecord  = NewType (type : *Type, values : Map, ti : *TokenInfo)
ValueArray   = NewType (type : *Type, items : List, ti : *TokenInfo)
ValueMention = NewType (type : *Type, of : *Value, ti : *TokenInfo)

ValueUn     = (type : *Type, value : *Value, ti : *TokenInfo)

ValueRef = NewType ValueUn
ValueDeref = NewType ValueUn
ValueNot = NewType ValueUn
ValueMinus = NewType ValueUn
ValuePlus = NewType ValueUn

ValueBin    = (type : *Type, left, right : *Value, ti : *TokenInfo)

ValueAdd = NewType ValueBin
ValueSub = NewType ValueBin
ValueMul = NewType ValueBin
ValueDiv = NewType ValueBin
ValueMod = NewType ValueBin
ValueOr = NewType ValueBin
ValueXor = NewType ValueBin
ValueAnd = NewType ValueBin
ValueEq = NewType ValueBin
ValueNe = NewType ValueBin
ValueLt = NewType ValueBin
ValueGt = NewType ValueBin
ValueLe = NewType ValueBin
ValueGe = NewType ValueBin
ValueShl = NewType ValueBin
ValueShr = NewType ValueBin

ValueCall   = NewType (type : *Type, func : *Value, args : *List, ti : *TokenInfo)
ValueAccess = NewType (type : *Type, value : *Value, field : Str, ti : *TokenInfo)
ValueIndex  = NewType (type : *Type, array, index : *Value, ti : *TokenInfo)
ValueCast   = NewType (type : *Type, value : *Value, type : *Type, ti : *TokenInfo)
ValueAs     = NewType (type : *Type, value : *Value, type : *Type, ti : *TokenInfo)
ValueIs     = NewType (type : *Type, value : *Value, logic : Bool, variant : Nat, ti : *TokenInfo)
ValueIsnt = NewType ValueIs

ValueWhenVariant = NewType (t : *Type, x, y : *Value, t_no : Nat, ti : *TokenInfo)
ValueWhen   = NewType (type : *Type, iss : Bool, x : *Value, variants : List, other : *Value, ti : *TokenInfo)


// и ValueGlobalVar и ValueGlobalConst юзают ссылку на определение
// в котором лежит их id. Сделано так потому что id в определении
// может меняться ренеймом, тк изначально они анонимны, а потом как бог даст.
ValueGlobalVar   = NewType (type : *Type, def : *Definition, ti : *TokenInfo)
ValueGlobalConst = NewType (type : *Type, def : *Definition, ti : *TokenInfo)
// у параметра в no просто его порядковый номер
ValueParam = NewType (type : *Type, no : Nat, ti : *TokenInfo)

// no - уникальный порядковый номер для каждой переменной
// (или просто номер для параметра)
ValueLocalVar = NewType (type : *Type, no : Nat, ti : *TokenInfo)
ValueLocalVal = NewType (type : *Type, no : Nat, ti : *TokenInfo)

ValueNo = {#ValueNo}

Value2 = ValuePoison or
        ValueUndefined or

        ValueImm or

        ValueRecord or        //? приведенное
        ValueGenericRecord or //? не приведенное (объедини в imm!)

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

  bind_at,
  ti : *TokenInfo  // place in code where value was mentioned
)


