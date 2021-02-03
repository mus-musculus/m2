/*****************************************************************************/
/*                                Types                                      */
/*****************************************************************************/


TypeNumeric = Tagged (power : Nat, signed : Bool, ti : *TokenInfo)
TypeArray   = Tagged (of : *Type, volume : Nat, ti : *TokenInfo)
TypeArrayU  = Tagged (of : *Type, ti : *TokenInfo)
TypeFunc    = Tagged (from, to : *Type, arghack : Bool, ti : *TokenInfo)
TypePointer = Tagged (to : *Type, ti : *TokenInfo)
TypeRecord  = Tagged (decls : *List, end : Nat, ti : *TokenInfo)
TypeVar     = Tagged (of : *Type, ti : *TokenInfo)
TypeEnum    = Tagged (cons : *List, ti : *TokenInfo)
TypeUnion   = Tagged (types : List, impl : *Type, data_size : Nat, ti : *TokenInfo)

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

  #TypeOr
  #TypeAnd

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


TypePoison = Tagged (ti : *TokenInfo)
TypeUndefined = Tagged (ti : *TokenInfo)
TypeGenericReference = Tagged (ti : *TokenInfo)
TypeGenericRecord = Tagged (ti : *TokenInfo)
TypeBool = Tagged (ti : *TokenInfo)
TypeNo = {#TypeNo}

TypeOr = Tagged TypeUnion

Type2 = TypePoison or
       TypeUndefined or
       TypeGenericReference or
       TypeGenericRecord or
       TypeNumeric or
       TypeOr or
       TypeVar or
       TypeBool or
       TypeFunc or
       TypeEnum or
       TypeRecord or
       TypePointer or
       TypeArray or
       TypeArrayU or
       TypeUnion or
       TypeNo

/*
 * Type Structure
 */
Type = (
  kind  : TypeKind

  uid   : Nat32

  aka   : Str         // type alias (used by printer)


  size, align  : Nat  // размер и выравнивание в байтах

  data : Type2

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


