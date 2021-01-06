/*****************************************************************************/
/*                                 Type                                      */
/*****************************************************************************/


type_new = (k : TypeKind, size : Nat, ti : *TokenInfo) -> *Type {
  t = malloc(sizeof Type) to *Type
  assert(t != nil, "type_new")
  memset(t, 0, sizeof Type)
  t.kind := k
  t.size := size
  t.align := size
  t.ti := ti
  return t
}

type_var_new = (of : *Type, ti : *TokenInfo) -> *Type {
  tn = type_new(#TypeVar, of.size, ti)
  tn.align := of.align
  tn.var.of := of
  return tn
}

type_pointer_new = (to : *Type, ti : *TokenInfo) -> *Type {
  t = type_new(#TypePointer, cfgPointerSize, ti)
  t.pointer.to := to
  return t
}

type_array_u_new = (of : *Type, ti : *TokenInfo) -> *Type {
  t = type_new(#TypeArrayU, cfgPointerSize, ti)
  t.array_u.of := of
  return t
}

type_array_new = (of : *Type, volume : Nat32, ti : *TokenInfo) -> *Type {
  size = volume * of.size
  t = type_new(#TypeArray, size, ti)
  t.align := of.align
  t.array.of := of
  t.array.volume := volume
  return t
}

type_enum_new = (constructors : *List, ti : *TokenInfo) -> *Type {
  t = type_new(#TypeEnum, cfgEnumSize, ti)
  create_constructor = ListForeachHandler {
    cons = data to *EnumConstructor
    enum_type = ctx to *Type
    v = value_new_imm(enum_type, cons.d to Int64, cons.ti)
    bind_value(&module.public, cons.id.str, v)
  }
  list_foreach(constructors, create_constructor, t)
  return t
}


type_func_new = (from, _to : *Type, arghack : Bool, ti : *TokenInfo) -> *Type {
  t = type_new(#TypeFunc, cfgPointerSize, ti)
  t.func.from := from
  t.func.to := _to
  t.func.arghack := arghack
  return t
}


type_record_get_field = (t : *Type, field_id : Str) -> *Decl {
  fsearch = ListSearchHandler {
    field = data to *Decl
    id = ctx to Str
    return strcmp(field.id.str, id) == 0
  }
  return list_search(t.record.decls, fsearch, field_id to *Unit) to *Decl
}


type_is_ref = (t : *Type) -> Bool {
  k = t.kind
  return k == #TypeGenericReference or k == #TypePointer or k == #TypeFunc or typeIsUndefinedArray(t)
}





//typeIsPointer = (t : *Type) -> Bool {return t.kind == #TypePointer}

typeIsDefinedArray = (t : *Type) -> Bool {return t.kind == #TypeArray}


typeIsPointerToDefinedArray = (t : *Type) -> Bool {
  if t.kind != #TypePointer {return false}
  return typeIsDefinedArray(t.pointer.to)
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
  return typeIsRecord(t.pointer.to)
}

typeIsPointerToUnit = (t : *Type) -> Bool {
  if t.kind != #TypePointer {return false}
  return type_eq(t.pointer.to, typeUnit)
}


do_type = DoType {
  return select x.kind {
    #AstTypeNamed   => do_type_named(x)
    #AstTypeFunc    => do_type_func(x)
    #AstTypeVar     => do_type_var(x)
    #AstTypeArray   => do_type_array(x)
    #AstTypeArrayU  => do_type_array_u(x)
    #AstTypePointer => do_type_pointer(x)
    #AstTypeEnum    => do_type_enum(x)
    #AstTypeRecord  => do_type_record(x)
    else => type_new(#TypePoison, 0, x.ti)
  }
}


do_type_var = DoType {
  of = do_type(x.var.of)
  return type_var_new(of, x.ti)
}


do_type_named = DoType {
  id = x.name.id.str
  xt = get_type(id)
  if xt == nil {
    // создаем неопределенный тип если типа с таким именем не было
    nt = type_new(#TypeUndefined, 0, x.ti)
    nt.ti := x.name.ti
    bind_type(&module.private, id, nt)
    return nt
  }

  return xt
}

do_type_func = DoType {
  from = do_type(x.func.from)
  if from.kind == #TypePoison {return from}
  //if from.kind == #TypeUndefined or from.kind == #TypePoison {return from}

  _to = do_type(x.func.to)
  if _to.kind == #TypePoison {return _to}
  //if _to.kind == #TypeUndefind or _to.kind == #TypePoison {return _to}

  arghack = false
  return type_func_new(from, _to, arghack, x.ti)
}

do_type_array_u = DoType {
  of = do_type(x.array_u.of)
  if of.kind == #TypePoison {return of}
  return type_array_u_new(of, x.ti)
}

do_type_array = DoType {
  of = do_type(x.array.of)
  if of.kind == #TypePoison {return of}

  size = do_valuex(x.array.size, false)
  if size.kind == #ValuePoison {return type_new(#TypePoison, 0, x.ti)}

  return type_array_new(of, size.imm to Nat32, x.ti)
}


do_type_pointer = DoType {
  _to = do_type(x.pointer.to)
  if _to.kind == #TypePoison {return _to}
  return type_pointer_new(_to, x.ti)
}


align = (req_sz : Nat32, align : Nat) -> Nat32 {
  assert(align != 0, "alignment : align=0")
  a = req_sz % align
  return select a {
    0 => req_sz
    else => req_sz + (align - a)
  }
}

do_type_record = DoType {
  old_ctype = ctype
  t = type_new(#TypeRecord, 0, x.ti)
  ctype := t

  Ctx0 = (fields : *List, undef_field : Bool)
  ctx0 = 0 to Var Ctx0
  ctx0.fields := list_new()
  ctx0.undef_field := false

  process_decl = ListForeachHandler {
    fieldsdef = data to *AstDecl
    ctx0 = ctx to *Ctx0
    type = /*.*/(do_type(fieldsdef.type))
    if type.kind == #TypePoison {
      error("unknown type3", type.ti)
      ctx0.undef_field := true
      return
    }

    Ctx1 = (fields : *List, type : *Type)
    ctx = 0 to Var Ctx1
    ctx.fields := ctx0.fields
    ctx.type := type
    process_field_in_decl = ListForeachHandler {
      id = data to *AstId
      context = ctx to *Ctx1
      field_new = (id : *AstId, t : *Type, ti : *TokenInfo) -> *Decl {
        f = malloc(sizeof Decl) to *Decl
        assert(f != nil, "field_new")
        f.id := id
        f.type := t
        f.offset := 0
        f.align := t.align
        f.ti := ti
        return f
      }
      field_decl = field_new(id, context.type, id.ti)
      list_append(context.fields, field_decl)
    }
    list_foreach(&fieldsdef.ids, process_field_in_decl, &ctx)
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

    offset = align(record_type.record.end, decl.type.align)

    // получаем конец записи (учитывая это поле)
    end = offset + decl.type.size

    record_type.record.end := end

    // получаем полный размер структуры (с паддингом)
    if end > record_type.size {
      // не вмещаемся в текущий размер структуры
      // => увеличим ее на величину кратную размеру наибольшего поля
      record_type.size := align(end, record_type.align)
    }
  }

  list_foreach(t.record.decls, process_field, t)

  return t
}


do_type_enum = DoType {
  constructors = list_new()
  hc = ListForeachHandler {
    cons_id = data to *AstId
    cons_list = ctx to *List
    ec = malloc(sizeof EnumConstructor) to *EnumConstructor
    ec.id := cons_id
    ec.d := index
    ec.ti := nil
    list_append(cons_list, ec)
  }
  list_foreach(&x.enum.constructors, hc, constructors)

  return type_enum_new(constructors, x.ti)
}



type_eq_numeric = (a, b : *TypeNumeric) -> Bool
{return a.power == b.power and a.signed == b.signed}

type_eq_array = (a, b : *TypeArray) -> Bool
{return a.volume == b.volume and type_eq(a.of, b.of)}

type_eq_func = (a, b : *TypeFunc) -> Bool
{return type_eq(a.from, b.from) and type_eq(a.to, b.to)}

type_eq_record = (a, b : *TypeRecord) -> Bool {
  check_fields = ListCompareHandler {
    f1 = data1 to *Decl
    f2 = data2 to *Decl
    if strcmp(f1.id.str, f2.id.str) != 0 {return false}
    return type_eq(f1.type, f2.type)
  }
  return list_compare(a.decls, b.decls, check_fields, nil)
}

type_eq = (a, b : *Type) -> Bool {
  if a == b {return true}

  if a.kind != b.kind {return false}

  return select a.kind {
    #TypeNumeric => type_eq_numeric(&a.num, &b.num)
    #TypeVar     => type_eq(a.var.of, b.var.of)
    #TypePointer => type_eq(a.pointer.to, b.pointer.to)
    #TypeArray   => type_eq_array(&a.array, &b.array)
    #TypeArrayU  => type_eq(a.array_u.of, b.array_u.of)
    #TypeFunc    => type_eq_func(&a.func, &b.func)
    #TypeRecord  => type_eq_record(&a.record, &b.record)
    #TypeEnum    => false
    #TypeBool    => true
    else => false
  }
}



// type eq with error_type_error
type_check = (exp, recv : *Type, ti : *TokenInfo) -> Bool {
  eq = type_eq (exp, recv)
  if not eq {error_type_error (ti, recv, exp)}
  return eq
}


type_init = () -> () {
  // Special builtin types

  // Void is an empty enum
  typeVoid := type_enum_new(list_new(), nil)
  typeVoid.aka := "Void"
  builtin_type_bind("Void", typeVoid)

  // Unit is an empty record
  typeUnit := type_new(#TypeRecord, 0, nil)
  typeUnit.record.decls := list_new()

  typeUnit.aka := "Unit"
  builtin_type_bind("Unit", typeUnit)

  // Bool is an enum with false & true constructors
  typeBool := type_new(#TypeBool, 1, nil)
  builtin_type_bind("Bool", typeBool)

  type_numeric_new = (id : Str, power : Nat, signed : Bool) -> *Type {
    size = power / 8
    t = type_new(#TypeNumeric, size, nil)
    t.aka := id
    t.num.power := power
    t.num.signed := signed
    return t
  }

  // Signed Numeric
  typeInt8  = type_numeric_new("Int8",  8, true)
  typeInt16 = type_numeric_new("Int16", 16, true)
  typeInt32 = type_numeric_new("Int32", 32, true)
  typeInt64 = type_numeric_new("Int64", 64, true)

  typeInt128 = type_numeric_new("Int128", 128, true)
  typeInt256 = type_numeric_new("Int256", 256, true)
  typeInt512 = type_numeric_new("Int512", 512, true)
  typeInt1024 = type_numeric_new("Int1024", 1024, true)

  // Unsigned Numeric
  typeNat8  = type_numeric_new("Nat8",  8, false)
  typeNat16 = type_numeric_new("Nat16", 16, false)
  typeNat32 = type_numeric_new("Nat32", 32, false)
  typeNat64 = type_numeric_new("Nat64", 64, false)

  typeNat128 = type_numeric_new("Nat128", 128, false)
  typeNat256 = type_numeric_new("Nat256", 256, false)
  typeNat512 = type_numeric_new("Nat512", 512, false)
  typeNat1024 = type_numeric_new("Nat1024", 1024, false)


  // Add most popular types
  builtin_type_bind("Int64", typeInt64)
  builtin_type_bind("Nat64", typeNat64)

  builtin_type_bind("Int32", typeInt32)
  builtin_type_bind("Nat32", typeNat32)

  builtin_type_bind("Int8", typeInt8)
  builtin_type_bind("Nat8", typeNat8)

  builtin_type_bind("Int16", typeInt16)
  builtin_type_bind("Nat16", typeNat16)


  // Add builtin type Str
  typeChar := typeNat8
  typeStr := type_array_u_new(typeChar, nil)
  typeStr.aka := "Str"
  builtin_type_bind("Str", typeStr)


  // Add heavy types
  builtin_type_bind("Int128", typeInt128)
  builtin_type_bind("Int256", typeInt256)
  builtin_type_bind("Int512", typeInt512)
  builtin_type_bind("Int1024", typeInt1024)

  builtin_type_bind("Nat128", typeNat128)
  builtin_type_bind("Nat256", typeNat256)
  builtin_type_bind("Nat512", typeNat512)
  builtin_type_bind("Nat1024", typeNat1024)


  // main types shortcuts
  typeFreePtr := type_pointer_new(typeUnit, nil)
  typeNumeric := type_numeric_new("Numeric",  0, true)

  typeBaseInt := select cfgIntegerSize {
    2 => typeInt16
    4 => typeInt32
    8 => typeInt64
    16 => typeInt128
    32 => typeInt256
    else => () -> *Type {fatal("unsupported cfgIntegerSize"); return nil} ()
  }
}


