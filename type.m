/*****************************************************************************/
/*                                 Type                                      */
/*****************************************************************************/


type_new = (k : TypeKind, size : Nat, ti : *TokenInfo) -> *Type {
  t = malloc (sizeof Type) to *Type
  assert (t != nil, "type_new")
  *t := (kind=k, size=size, align=size, ti=ti)
  return t
}

type_var_new = (of : *Type, ti : *TokenInfo) -> *Type {
  tn = type_new (#TypeVar, of.size, ti)
  tn.align := of.align
  tn.var := (of=of)
  return tn
}

type_pointer_new = (to : *Type, ti : *TokenInfo) -> *Type {
  t = type_new (#TypePointer, cfgPointerSize, ti)
  t.pointer := (to=to)
  return t
}

type_array_u_new = (of : *Type, ti : *TokenInfo) -> *Type {
  t = type_new (#TypeArrayU, cfgPointerSize, ti)
  t.array_u := (of=of)
  return t
}

type_array_new = (of : *Type, volume : Nat32, ti : *TokenInfo) -> *Type {
  size = volume * of.size
  t = type_new (#TypeArray, size, ti)
  t.align := of.align
  t.array := (of=of, volume=volume)
  return t
}

type_enum_new = (constructors : *List, ti : *TokenInfo) -> *Type {
  t = type_new (#TypeEnum, cfgEnumSize, ti)
  create_constructor = ListForeachHandler {
    cons = data to *EnumConstructor
    enum_type = ctx to *Type
    v = value_new_imm (enum_type, cons.d to Int64, cons.ti)
    bind_value (&module.public, cons.id.str, v)
  }
  list_foreach (constructors, create_constructor, t)
  return t
}


type_func_new = (from, _to : *Type, arghack : Bool, ti : *TokenInfo) -> *Type {
  t = type_new (#TypeFunc, cfgPointerSize, ti)
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


do_type = DoType {
  return when x.kind {
    #AstTypeNamed   => do_type_named   (x)
    #AstTypeFunc    => do_type_func    (x)
    #AstTypeVar     => do_type_var     (x)
    #AstTypeSpecial => do_type_special (x)
    #AstTypeArray   => do_type_array   (x)
    #AstTypeArrayU  => do_type_array_u (x)
    #AstTypePointer => do_type_pointer (x)
    #AstTypeEnum    => do_type_enum    (x)
    #AstTypeRecord  => do_type_record  (x)
    #AstTypeUnion   => do_type_union   (x)
    else => type_new (#TypePoison, 0, x.ti)
  }
}

spec_type_uid = 0 to Var Nat32
do_type_special = DoType {
  spec_type = do_type(x.special.type)
  spec_type.uid := spec_type_uid
  spec_type_uid := spec_type_uid + 1
  return spec_type
}


do_type_var = DoType {
  of = do_type (x.var.of)
  return type_var_new (of, x.ti)
}


do_type_named = DoType {
  id = x.name.id.str
  xt = get_type (id)
  if xt == nil {
    // создаем неопределенный тип если типа с таким именем не было
    nt = type_new (#TypeUndefined, 0, x.ti)
    nt.ti := x.name.ti
    bind_type (&module.private, id, nt)
    return nt
  }

  return xt
}

do_type_func = DoType {
  from = do_type (x.func.from)
  if from.kind == #TypePoison {return from}

  _to = do_type (x.func.to)
  if _to.kind == #TypePoison {return _to}

  arghack = false
  return type_func_new (from, _to, arghack, x.ti)
}

do_type_array_u = DoType {
  of = do_type (x.array_u.of)
  if of.kind == #TypePoison {return of}
  return type_array_u_new (of, x.ti)
}

do_type_array = DoType {
  of = do_type (x.array.of)
  if of.kind == #TypePoison {return of}

  size = do_valuex (x.array.size, false)
  if size.kind == #ValuePoison {return type_new (#TypePoison, 0, x.ti)}

  return type_array_new (of, size.imm.value to Nat32, x.ti)
}


do_type_pointer = DoType {
  _to = do_type (x.pointer.to)
  if _to.kind == #TypePoison {return _to}
  return type_pointer_new (_to, x.ti)
}


align = (req_sz : Nat32, align : Nat) -> Nat32 {
  assert (align != 0, "alignment : align=0")
  a = req_sz % align
  return when a {
    0 => req_sz
    else => req_sz + (align - a)
  }
}

type_record_field_new = (id : *AstId, t : *Type, ti : *TokenInfo) -> *Decl {
  f = malloc (sizeof Decl) to *Decl
  assert (f != nil, "type_record_field_new")
  *f := (id=id, type=t, align=t.align, ti=ti)
  return f
}

do_type_record = DoType {
  old_ctype = ctype
  t = type_new (#TypeRecord, 0, x.ti)
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
  list_foreach(&x.record.decls, process_decl, &ctx0)

  ctype := old_ctype

  t.record.decls := ctx0.fields

  // Check fields, set offsets.
  process_field = ListForeachHandler {
    decl = data to *Decl

    if decl.type.kind == #TypeUndefined {
      error("undefined type", decl.type.ti)
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


do_type_enum = DoType {
  constructors = list_new ()
  hc = ListForeachHandler {
    cons_id = data to *AstId
    cons_list = ctx to *List
    ec = malloc (sizeof EnumConstructor) to *EnumConstructor
    *ec := (id=cons_id, d=index, ti=nil to *TokenInfo)
    list_append (cons_list, ec)
  }
  list_foreach (&x.enum.constructors, hc, constructors)

  return type_enum_new (constructors, x.ti)
}


union_id = 0 to Var Nat


// тупое как топор выравнивание до ближайшей степени двойки
// потом надо придумать алгоритм а сечас как всегда мне некогда!!
propagation = (x : Nat) -> Nat {
  return when true {
    x <= 2 => 2 to Nat
    x <= 4 => 4 to Nat
    x <= 8 => 8 to Nat
    x <= 16 => 16 to Nat
    x <= 32 => 32 to Nat
    x <= 64 => 64 to Nat
    x <= 128 => 128 to Nat
    x <= 256 => 256 to Nat
    x <= 512 => 512 to Nat
    x <= 1024 => 1024 to Nat
    x <= 2048 => 2048 to Nat
    x <= 4096 => 4096 to Nat
    else => x
  }
}

do_type_union = DoType {
  xuid = str_new(10)
  sprintf(&xuid[0], "%d", union_id)
  aka = cat("union.", xuid)
  union_id := union_id + 1

  t = type_new (#TypeUnion, 0, x.ti)
  list_init (&t.union.types)
  t.aka := aka

  CtxUnion = (
    tlist : *List
    max_size : Nat
  )

  ctx = (tlist=&t.union.types) to Var CtxUnion

  do_variant = ListForeachHandler {
    ast_type = data to *AstType
    c = ctx to *CtxUnion

    tlist = ctx to *List
    t = do_type (ast_type)

    // получаем размер самого большого варианта
    c.max_size := when true {
      t.size > c.max_size => t.size
      else => c.max_size
    }

    if type_present_in_list(c.tlist, t) {
      error("this type already present in union", t.ti)
    }

    list_append(c.tlist, t)
  }
  list_foreach(&x.union.types, do_variant, &ctx)

  size = propagation(align(ctx.max_size + 2, 4))


  t.size := size
  t.align := size

  t.union.data_size := ctx.max_size

  list_append (&unions, t)

  if type_is_maybe_ptr (t) {
    // если это мейби указатель то нам подойдет простой указатель
    u = typeFreePtr  // пока юнионы только для ?указателей тест
    t.union.impl := u

  } else {
    t.union.impl := nil  // классический юнион
  }

  return t
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
  builtin_type_bind ("Void", typeVoid)

  // Unit is an empty record
  typeUnit := type_new (#TypeRecord, 0, nil)
  typeUnit.record := (decls=list_new ())

  typeUnit.aka := "Unit"
  builtin_type_bind ("Unit", typeUnit)

  // Bool is an enum with false & true constructors
  typeBool := type_new (#TypeBool, 1, nil)
  builtin_type_bind ("Bool", typeBool)

  type_numeric_new = (id : Str, power : Nat, signed : Bool) -> *Type {
    size = power / 8
    t = type_new (#TypeNumeric, size, nil)
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
  builtin_type_bind ("Int64", typeInt64)
  builtin_type_bind ("Nat64", typeNat64)

  builtin_type_bind ("Int32", typeInt32)
  builtin_type_bind ("Nat32", typeNat32)

  builtin_type_bind ("Int8", typeInt8)
  builtin_type_bind ("Nat8", typeNat8)

  builtin_type_bind ("Int16", typeInt16)
  builtin_type_bind ("Nat16", typeNat16)


  // Add builtin type Str
  typeChar := typeNat8
  typeStr := type_array_u_new (typeChar, nil)
  typeStr.aka := "Str"
  builtin_type_bind ("Str", typeStr)


  // Add heavy types
  builtin_type_bind ("Int128", typeInt128)
  builtin_type_bind ("Int256", typeInt256)
  builtin_type_bind ("Int512", typeInt512)
  builtin_type_bind ("Int1024", typeInt1024)

  builtin_type_bind ("Nat128", typeNat128)
  builtin_type_bind ("Nat256", typeNat256)
  builtin_type_bind ("Nat512", typeNat512)
  builtin_type_bind ("Nat1024", typeNat1024)

  // main types shortcuts

  // *Unit - указатель на произвольное значение
  typeFreePtr := type_pointer_new (typeUnit, nil)

  // Тип который получают литеральные константы
  typeNumeric := type_numeric_new ("Numeric",  0, true)

  typeBaseInt := getIntByPower(cfgIntegerSize)
}


getIntByPower = (size : Nat) -> *Type {
  return when size {
    1    => get_type("Int8")
    2    => get_type("Int16")
    4    => get_type("Int32")
    8    => get_type("Int64")
    16   => get_type("Int128")
    32   => get_type("Int256")
    64   => get_type("Int512")
    128  => get_type("Int1024")
    else => () -> *Type {fatal ("unsupported cfgIntegerSize"); return nil} ()
  }
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


