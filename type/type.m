/*****************************************************************************/
/*                                 Type                                      */
/*****************************************************************************/

union_id = 0 to Var Nat
name_union_get = () -> Str {
  xuid = str_new(10)
  sprintf(&xuid[0], "%d", union_id)
  aka = cat("union.", xuid)
  union_id := union_id + 1
  return aka
}

align = (req_sz : Nat32, align : Nat) -> Nat32 {
  assert (align != 0, "alignment : align=0")
  a = req_sz % align
  return when a {
    0 => req_sz
    else => req_sz + (align - a)
  }
}

// выравнивание до ближайшей степени двойки
propagation = (x : Nat) -> Nat {
  y = 1 to Var Nat
  while y < x {y := y << 1}
  return y
}


max = (a, b : Nat) -> Nat {
  return when true {
    a > b => a
    a < b => b
    else => a
  }
}


type_new = (k : TypeKind, x : Type2, size : Nat, ti : *TokenInfo) -> *Type {
  t = malloc (sizeof Type) to *Type
  assert (t != nil, "type_new")
  *t := (kind=k, size=size, align=size, ti=ti)
  return t
}

type_var_new = (of : *Type, ti : *TokenInfo) -> *Type {
  tn = type_new (#TypeVar, (of=of) to TypeVar, of.size, ti)
  tn.align := of.align
  tn.var := (of=of)
  return tn
}

type_pointer_new = (to : *Type, ti : *TokenInfo) -> *Type {
  t = type_new (#TypePointer, (to=to) to TypePointer, cfgPointerSize, ti)
  t.pointer := (to=to)
  return t
}

type_array_u_new = (of : *Type, ti : *TokenInfo) -> *Type {
  t = type_new (#TypeArrayU, (of=of) to TypeArrayU, cfgPointerSize, ti)
  t.array_u := (of=of)
  return t
}

type_array_new = (of : *Type, volume : Nat32, ti : *TokenInfo) -> *Type {
  size = volume * of.size
  t = type_new (#TypeArray, (of=of, volume=volume) to TypeArray, size, ti)
  t.align := of.align
  t.array := (of=of, volume=volume)
  return t
}

type_enum_new = (items : *List, ti : *TokenInfo) -> *Type {
  t = type_new (#TypeEnum, #TypeNo, cfgEnumSize, ti)
  create_constructor = ListForeachHandler {
    cons = data to *EnumConstructor
    enum_type = ctx to *Type
    v = value_new_imm (enum_type, cons.d to Int64, cons.ti)
    valbind (cons.id.str, v)
  }
  list_foreach (items, create_constructor, t)
  return t
}


type_func_new = (from, _to : *Type, arghack : Bool, ti : *TokenInfo) -> *Type {
  t = type_new (#TypeFunc, (from=from, to=_to, arghack=arghack) to TypeFunc, cfgPointerSize, ti)
  t.func := (from=from, to=_to, arghack=arghack)
  return t
}


type_record_get_field = (t : *Type, field_id : Str) -> *Decl {
  fsearch = ListSearchHandler {
    field = data to *Decl
    id = ctx to Str
    return strcmp (field.id.str, id) == 0
  }
  return list_search (t.record.decls, fsearch, field_id to *Unit) to *Decl
}


type_is_ref = (t : *Type) -> Bool {
  k = t.kind
  return k == #TypeGenericReference or k == #TypePointer or k == #TypeFunc or typeIsUndefinedArray (t)
}





//typeIsPointer = (t : *Type) -> Bool {return t.kind == #TypePointer}

typeIsDefinedArray = (t : *Type) -> Bool {return t.kind == #TypeArray}


typeIsPointerToDefinedArray = (t : *Type) -> Bool {
  if t.kind != #TypePointer {return false}
  return typeIsDefinedArray (t.pointer.to)
}

typeIsUndefinedArray = (t : *Type) -> Bool {return t.kind == #TypeArrayU}

// литеральные константы получают тип Numeric c Numeric#power == 0
// они поддаются "натуральному преобразованию"
type_is_generic_num = (t : *Type) -> Bool {
  if t.kind != #TypeNumeric {return false}
  return t.num.power == 0
}

type_is_basic_integer = (t : *Type) -> Bool {
  if t.kind != #TypeNumeric {return false}
  return t.num.power > 0
}

typeIsRecord = (t : *Type) -> Bool {return t.kind == #TypeRecord}

typeIsPointerToRecord = (t : *Type) -> Bool {
  if t.kind != #TypePointer {return false}
  return typeIsRecord (t.pointer.to)
}

typeIsPointerToUnit = (t : *Type) -> Bool {
  if t.kind != #TypePointer {return false}
  return type_eq (t.pointer.to, typeUnit)
}


// Is type (*T or Unit) ?
type_is_maybe_ptr = (t : *Type) -> Bool {
  if t.kind != #TypeUnion {return false}
  if t.union.types.volume != 2 {return false}
  t0 = list_get(&t.union.types, 0) to *Type
  t1 = list_get(&t.union.types, 1) to *Type

  return t0.kind == #TypePointer and type_eq(t1, typeUnit) or
         t1.kind == #TypePointer and type_eq(t0, typeUnit)
}


exist do_type_named   : (x : AstTypeNamed) -> *Type
exist do_type_var     : (x : AstTypeVar) -> *Type
exist do_type_special : (x : AstTypeNewType) -> *Type
exist do_type_func    : (x : AstTypeFunc) -> *Type
exist do_type_array_u : (x : AstTypeArrayU) -> *Type
exist do_type_array   : (x : AstTypeArray) -> *Type
exist do_type_pointer : (x : AstTypePointer) -> *Type
exist do_type_record  : (x : AstTypeRecord) -> *Type
exist do_type_enum    : (x : AstTypeEnum) -> *Type
exist do_type_or      : (x : AstTypeOr) -> *Type


do_type = (x : *AstType) -> *Type {
  xx = *x
  return when xx {
    AstTypeNamed   => do_type_named   (xx as AstTypeNamed)
    AstTypeRecord  => do_type_record  (xx as AstTypeRecord)
    AstTypeFunc    => do_type_func    (xx as AstTypeFunc)
    AstTypeOr      => do_type_or      (xx as AstTypeOr)
    AstTypeVar     => do_type_var     (xx as AstTypeVar)
    AstTypeNewType => do_type_special (xx as AstTypeNewType)
    AstTypeArray   => do_type_array   (xx as AstTypeArray)
    AstTypeArrayU  => do_type_array_u (xx as AstTypeArrayU)
    AstTypePointer => do_type_pointer (xx as AstTypePointer)
    AstTypeEnum    => do_type_enum    (xx as AstTypeEnum)
    else => () -> *Type {fatal("unknown type kind"); return nil} ()
  }
}



type_new_or = (ti : *TokenInfo) -> *Type {
  // создаем новый пустой union
  aka = name_union_get ()
  t = type_new (#TypeUnion, #TypeNo, 0, ti)
  list_append (&unions, t)
  list_init (&t.union.types)
  t.aka := aka
  return t
}

// добавляет к union произвольный тип
type_or_add = (u, t : *Type) -> *Type {
  list_append (&u.union.types, t)
  data_size = max (u.union.data_size, t.size)
  u.union.data_size := data_size
  size = propagation (align (data_size + 2, 4))
  u.size := size
  u.align := size
  u.union.impl := nil
  return u
}

// создает новый TypeOr и наполняет его элементами u0 и u1 (TypeOr)
type_union_merge = (u0, u1 : *Type, ti : *TokenInfo) -> *Type {
  u = type_new_or (ti)

  merge0 = ListForeachHandler {
    type = data to *Type
    or_t = ctx to *Type
    type_or_add (or_t, type)
  }
  list_foreach (&u0.union.types, merge0, u)

  merge1 = ListForeachHandler {
    type = data to *Type
    or_t = ctx to *Type
    type_or_add (or_t, type)
  }
  list_foreach (&u1.union.types, merge1, u)

  return u
}

// создает новый TypeOr и наполняет его типами t0 и t1
type_new_or2 = (left, right : *Type, ti : *TokenInfo) -> *Type {
  t = type_new_or (ti)
  // добавляем в него левый и правый член
  type_or_add(t, left)
  type_or_add(t, right)

  if type_is_maybe_ptr (t) {
    // если это мейби указатель то нам подойдет простой указатель
    t.union.impl := typeFreePtr
  }

  return t
}

do_type_or = (x : AstTypeOr) -> *Type {
  l = do_type (x.left)
  r = do_type (x.right)

  // если слева и справа TypeOr
  if l.kind == #TypeUnion and r.kind == #TypeUnion {
    // если оба `плоские` (A or B) or (C or D)
    // - сливаем их воедино
    if l.uid == 0 and r.uid == 0 {
      return type_union_merge (l, r, x.ti)
    } else {
      // разные => создаем новы плоский TypeOr и вливаем их в него
      return type_new_or2 (l, r, x.ti)
    }
  }

  // если слева TypeOr
  if l.kind == #TypeUnion {
    if l.uid == 0 {}
    return type_or_add (l, r)
  }

  // если справа TypeOr - сливаем
  if r.kind == #TypeUnion {
    return type_or_add (r, l)
  }

  return type_new_or2 (l, r, x.ti)
}


is_type_in_type_or = (t_or, t : *Type) -> Bool {
  if t.or.left.kind == #TypeOr {
    if self (t.or.left, t) {return true}
  }

  if t.or.right.kind == #TypeOr {
    if self (t.or.right, t) {return true}
  }

  if type_eq(t.or.left, t) or type_eq(t.or.right, t) {return true}

  return false
}


// Tagged (NewType)
spec_type_uid = 0 to Var Nat32
do_type_special = (x : AstTypeNewType) -> *Type {
  spec_type = do_type(x.type)
  // создем новый (!) tagged тип на основе полученного
  nt = type_new (#TypePoison, (ti=x.ti) to TypePoison, 0, x.ti)
  memcpy(nt, spec_type, sizeof Type)
  nt.uid := spec_type_uid
  spec_type_uid := spec_type_uid + 1
  return nt
}


do_type_var = (x : AstTypeVar) -> *Type {
  of = do_type (x.of)
  return type_var_new (of, x.ti)
}


do_type_named = (x : AstTypeNamed) -> *Type {
  id = x.id.str
  xt = typeget (id)
  if xt is Unit {
    // создаем неопределенный тип если типа с таким именем не было
    nt = type_new (#TypeUndefined, (ti=x.ti) to TypeUndefined, 0, x.ti)
    nt.ti := x.ti
    typebind (id, nt)
    return nt
  }

  return xt as *Type
}

do_type_func = (x : AstTypeFunc) -> *Type {
  from = do_type (x.from)
  if from.kind == #TypePoison {return from}

  _to = do_type (x.to)
  if _to.kind == #TypePoison {return _to}

  arghack = false
  return type_func_new (from, _to, arghack, x.ti)
}


do_type_array_u = (x : AstTypeArrayU) -> *Type {
  of = do_type (x.of)
  if of.kind == #TypePoison {return of}
  return type_array_u_new (of, x.ti)
}

do_type_array = (x : AstTypeArray) -> *Type {
  of = do_type (x.of)
  if of.kind == #TypePoison {return of}

  size = do_valuex (x.size, false)
  if size.data is ValuePoison {return type_new (#TypePoison, (ti=x.ti) to TypePoison, 0, x.ti)}

  vol = (size.data as ValueImm).value

  return type_array_new (of, vol to Nat32, x.ti)
}


do_type_pointer = (x : AstTypePointer) -> *Type {
  _to = do_type (x.to)
  if _to.kind == #TypePoison {return _to}
  return type_pointer_new (_to, x.ti)
}

type_record_field_new = (id : *AstId, t : *Type, ti : *TokenInfo) -> *Decl {
  f = malloc (sizeof Decl) to *Decl
  assert (f != nil, "type_record_field_new")
  *f := (id=id, type=t, align=t.align, ti=ti)
  return f
}

do_type_record = (x : AstTypeRecord) -> *Type {
  old_ctype = ctype
  t = type_new (#TypeRecord, #TypeNo, 0, x.ti)
  ctype := t

  Ctx0 = (fields : *List, undef_field : Bool)
  ctx0 = (fields=list_new (), undef_field=false) to Var Ctx0

  process_decl = ListForeachHandler {
    fieldsdef = data to *AstDecl
    ctx0 = ctx to *Ctx0
    type = /*.*/do_type (fieldsdef.type)
    if type.kind == #TypePoison {
      error ("unknown type3", type.ti)
      ctx0.undef_field := true
      return
    }

    Ctx1 = (fields : *List, type : *Type)
    ctx = (fields=ctx0.fields, type=type) to Var Ctx1

    process_field_in_decl = ListForeachHandler {
      id = data to *AstId
      context = ctx to *Ctx1
      field_decl = type_record_field_new (id, context.type, id.ti)
      list_append (context.fields, field_decl)
    }
    list_foreach (&fieldsdef.ids, process_field_in_decl, &ctx)
  }
  list_foreach(&(x.decls to Var List), process_decl, &ctx0)

  ctype := old_ctype

  t.record.decls := ctx0.fields

  // Check fields, set offsets.
  process_field = ListForeachHandler {
    decl = data to *Decl

    if decl.type.kind == #TypeUndefined {
      error("undefined type3", decl.type.ti)
      return
    }

    record_type = ctx to *Type
    decl.offset := index to Nat16

    // alignment
    // выравнивание для структуры = макс выравниванию среди ее полей
    if record_type.align < decl.type.align {
      record_type.align := decl.type.align
    }

    // сколько свободного места нам доступно в структуре
    rest = record_type.size - record_type.record.end

    // получаем смещение поля в записи
    if decl.type.align == 0 {
      error("align 0 in", decl.type.ti)
    }

    offset = align (record_type.record.end, decl.type.align)

    // получаем конец записи (учитывая это поле)
    end = offset + decl.type.size

    record_type.record.end := end

    // получаем полный размер структуры (с паддингом)
    if end > record_type.size {
      // не вмещаемся в текущий размер структуры
      // => увеличим ее на величину кратную размеру наибольшего поля
      record_type.size := align (end, record_type.align)
    }
  }

  list_foreach (t.record.decls, process_field, t)

  return t
}


do_type_enum = (x : AstTypeEnum) -> *Type {
  items = list_new ()
  hc = ListForeachHandler {
    cons_id = data to *AstId
    cons_list = ctx to *List
    ec = malloc (sizeof EnumConstructor) to *EnumConstructor
    *ec := (id=cons_id, d=index, ti=cons_id.ti)
    list_append (cons_list, ec)
  }
  list_foreach (&(x.items to Var List), hc, items)

  return type_enum_new (items, x.ti)
}


type_eq_numeric = (a, b : TypeNumeric) -> Bool {
  return a.power == b.power and a.signed == b.signed
}

type_eq_array = (a, b : TypeArray) -> Bool {
  return a.volume == b.volume and type_eq (a.of, b.of)
}

type_eq_func = (a, b : TypeFunc) -> Bool {
  return type_eq (a.from, b.from) and type_eq (a.to, b.to)
}

type_eq_record = (a, b : TypeRecord) -> Bool {
  check_fields = ListCompareHandler {
    f1 = data1 to *Decl
    f2 = data2 to *Decl
    if strcmp (f1.id.str, f2.id.str) != 0 {return false}
    return type_eq (f1.type, f2.type)
  }
  return list_compare (a.decls, b.decls, check_fields, nil)
}

type_eq_union = (a, b : TypeUnion) -> Bool {
  if a.types.volume != b.types.volume {return false}
  check_types = ListCompareHandler {
    t1 = data1 to *Type
    t2 = data2 to *Type
    return type_eq (t1, t2)
  }
  return list_compare (&(a.types to Var List), &(b.types to Var List), check_types, nil)
}

type_eq_or = (a, b : TypeOr) -> Bool {
  return type_eq(a.left, b.left) and type_eq(a.right, b.right)
}


type_eq = (a, b : *Type) -> Bool {
  if a == b {return true}

  // uid используется для размеченных типов (Tagged)
  if a.uid != b.uid {return false}
  if a.uid > 0 {return true}

  if a.kind != b.kind {return false}

  return when a.kind {
    #TypeNumeric => type_eq_numeric (a.num, b.num)
    #TypeVar     => type_eq         (a.var.of, b.var.of)
    #TypePointer => type_eq         (a.pointer.to, b.pointer.to)
    #TypeArray   => type_eq_array   (a.array, b.array)
    #TypeArrayU  => type_eq         (a.array_u.of, b.array_u.of)
    #TypeFunc    => type_eq_func    (a.func, b.func)
    #TypeRecord  => type_eq_record  (a.record, b.record)
    #TypeUnion   => type_eq_union   (a.union, b.union)
    #TypeOr      => type_eq_or      (a.or, b.or)
    #TypeEnum    => false
    #TypeBool    => true
    else => false
  }
}



// type eq with error_type_error
type_check = (exp, recv : *Type, ti : *TokenInfo) -> Bool {
  equal = type_eq (exp, recv)
  if not equal {error_type_error (ti, recv, exp)}
  return equal
}


type_init = () -> () {
  // Special builtin types

  // Void is an empty enum
  typeVoid := type_enum_new (list_new(), nil)
  typeVoid.aka := "Void"
  typebind ("Void", typeVoid)

  // Unit is an empty record
  unit_decls = list_new ()
  typeUnit := type_new (#TypeRecord, (decls=unit_decls) to TypeRecord, 0, nil)
  typeUnit.record := (decls=unit_decls)

  typeUnit.aka := "Unit"
  typebind ("Unit", typeUnit)

  // Bool is an enum with false & true items
  typeBool := type_new (#TypeBool, (ti=nil) to TypeBool, 1, nil)
  typebind ("Bool", typeBool)

  type_numeric_new = (id : Str, power : Nat, signed : Bool) -> *Type {
    size = power / 8
    t = type_new (#TypeNumeric, (power=power, signed=signed) to TypeNumeric, size, nil)
    t.aka := id
    t.num := (power=power, signed=signed)
    return t
  }

  // Signed Numeric
  typeInt8  = type_numeric_new ("Int8",  8, true)
  typeInt16 = type_numeric_new ("Int16", 16, true)
  typeInt32 = type_numeric_new ("Int32", 32, true)
  typeInt64 = type_numeric_new ("Int64", 64, true)

  typeInt128  = type_numeric_new ("Int128", 128, true)
  typeInt256  = type_numeric_new ("Int256", 256, true)
  typeInt512  = type_numeric_new ("Int512", 512, true)
  typeInt1024 = type_numeric_new ("Int1024", 1024, true)

  // Unsigned Numeric
  typeNat8  = type_numeric_new ("Nat8",  8, false)
  typeNat16 = type_numeric_new ("Nat16", 16, false)
  typeNat32 = type_numeric_new ("Nat32", 32, false)
  typeNat64 = type_numeric_new ("Nat64", 64, false)

  typeNat128  = type_numeric_new ("Nat128", 128, false)
  typeNat256  = type_numeric_new ("Nat256", 256, false)
  typeNat512  = type_numeric_new ("Nat512", 512, false)
  typeNat1024 = type_numeric_new ("Nat1024", 1024, false)


  // Add most popular types
  typebind ("Int64", typeInt64)
  typebind ("Nat64", typeNat64)

  typebind ("Int32", typeInt32)
  typebind ("Nat32", typeNat32)

  typebind ("Int8", typeInt8)
  typebind ("Nat8", typeNat8)

  typebind ("Int16", typeInt16)
  typebind ("Nat16", typeNat16)


  // Add builtin type Str
  typeChar := typeNat8
  typeStr := type_array_u_new (typeChar, nil)
  typeStr.aka := "Str"
  typebind ("Str", typeStr)


  // Add heavy types
  typebind ("Int128", typeInt128)
  typebind ("Int256", typeInt256)
  typebind ("Int512", typeInt512)
  typebind ("Int1024", typeInt1024)

  typebind ("Nat128", typeNat128)
  typebind ("Nat256", typeNat256)
  typebind ("Nat512", typeNat512)
  typebind ("Nat1024", typeNat1024)

  // main types shortcuts

  // *Unit - указатель на произвольное значение
  typeFreePtr := type_pointer_new (typeUnit, nil)

  // Тип который получают литеральные константы
  typeNumeric := type_numeric_new ("Numeric",  0, true)

  typeBaseInt := getIntByPower(cfgIntegerSize)
}


getIntByPower = (size : Nat) -> *Type {
  return (when size {
    1    => typeget("Int8")
    2    => typeget("Int16")
    4    => typeget("Int32")
    8    => typeget("Int64")
    16   => typeget("Int128")
    32   => typeget("Int256")
    64   => typeget("Int512")
    128  => typeget("Int1024")
    else => () -> *Type {fatal ("unsupported cfgIntegerSize"); return nil} ()
  } as *Type)
}



/*// есть ли тип type в типе union
type_union_variant_present = (union, type : *Type) -> Bool {
  // type present?
  find_variant = ListSearchHandler {
    t = data to *Type
    ct = ctx to *Type
    return type_eq (t, ct)
  }
  x = list_search(&union.union.types, find_variant, type)
  return x != nil
}*/


// получает тип-юнион (union) и тип который в нем должен быть (type)
// возвращает номер варианта для этого типа в этом юнионе
type_union_get_variant = (union, type : *Type) -> Nat {
  VarCtx2 = (
    type    : *Type
    variant : Nat
  )

  var_ctx = (type=type) to Var VarCtx2

  find_variant = ListForeachHandler {
    t = data to *Type
    ct = ctx to *VarCtx2
    if type_eq (t, ct.type) {ct.variant := index}
  }
  list_foreach(&union.union.types, find_variant, &var_ctx)

  return var_ctx.variant
}


