


prttype = (t : *Type) -> () {prttype2(t, nil)}

exist type_print_union : (t : *TypeUnion) -> ()

prttype2 = (t, selfptr : *Type) -> () {
  if t == nil {printf("(nil)"); return}


  if t.aka != nil {
    // печатаем не aka а само выражение юниона
    if t.kind != #TypeUnion {
      printf("%s", t.aka)
      return
    }
  }

  if t == selfptr {printf("Self"); return}

  when t.kind {
    #TypeNumeric => printf("<TypeNumeric>") to ()  // just used Type#aka
    #TypeVar => type_print_var(&t.var)
    #TypePointer => type_print_pointer(&t.pointer, selfptr)
    #TypeArray => type_print_array(t, t)
    #TypeArrayU => type_print_array_u(t, t)
    #TypeRecord => type_print_record(t)
    #TypeBool => printf("Bool") to ()
    #TypeEnum => type_print_enum(t)
    #TypeFunc => type_print_func(&t.func)
    #TypePoison => printf("<TypePoison>") to ()
    #TypeForbidden => printf("<TypeForbidden>") to ()
    #TypeUnion => type_print_union(&t.union)
    #TypeGenericRecord => printf("<TypeGenericRecord>") to ()
    else => printf("<TypeUnknown>") to ()
  }
}

type_print_var = (x : *TypeVar) -> () {printf("Var "); prttype(x.of)}

type_print_pointer = (x : *TypePointer, selfptr : *Type) -> () {
  printf("*")
  need_brackets = x.to.kind == #TypeUnion or x.to.kind == #TypeFunc
  if need_brackets {printf("(")}
  prttype2(x.to, selfptr)
  if need_brackets {printf(")")}
}


type_print_record = (t : *Type) -> () {
  printf("(")
  print_fieldx = ListForeachHandler {
    field = data to *Decl
    selfptr = ctx to *Type
    if index > 0 {printf(", ")}
    printf("%s : ", field.id.str); prttype2(field.type, selfptr)
  }
  list_foreach(t.record.decls, print_fieldx, t)
  printf(")")
}


type_print_enum = (t : *Type) -> () {
  printf("{")
  print_cons = ListForeachHandler {printf("<%%s> ")}
  list_foreach(t.enum.cons, print_cons, nil)
  printf("}")
}


type_print_array = (t : *Type, selfptr : *Type) -> ()
{printf("[%d]", t.array.volume); prttype2(t.array.of, selfptr)}

type_print_array_u = (t : *Type, selfptr : *Type) -> ()
{printf("[]"); prttype2(t.array_u.of, selfptr)}

type_print_func = (t : *TypeFunc) -> ()
{
  prttype(t.from)
  printf(" -> ")
  prttype(t.to)
}


type_print_union = (t : *TypeUnion) -> () {
  print_variant = ListForeachHandler {
    t = data to *Type
    prttype(t)
    if list_node.next != nil {
      printf(" or ")
    }
  }
  list_foreach(&t.types, print_variant, nil)
}




print_value_kind = (k : ValueKind) -> () {
  kstr = when k {
    #ValueForbidden => "#ValueForbidden" to Str

    #ValuePoison => "#ValuePoison" to Str

    #ValueUndefined => "#ValueUndefined" to Str


    #ValueImmediate => "#ValueImmediate" to Str
    #ValueRecord => "#ValueRecord" to Str
    #ValueGenericRecord => "#ValueGenericRecord" to Str

    #ValueGlobalConst => "#ValueGlobalConst" to Str
    #ValueGlobalVar => "#ValueGlobalVar" to Str

    #ValueParam => "#ValueParam" to Str

    #ValueLocalConst => "#ValueLocalConst" to Str
    #ValueLocalVar => "#ValueLocalVar" to Str


    #ValueRef => "#ValueRef" to Str
    #ValueDeref => "#ValueDeref" to Str
    #ValueNot => "#ValueNot" to Str
    #ValueMinus => "#ValueMinus" to Str
    #ValuePlus => "#ValuePlus" to Str

    #ValueAdd => "#ValueAdd" to Str
    #ValueSub => "#ValueSub" to Str
    #ValueMul => "#ValueMul" to Str
    #ValueDiv => "#ValueDiv" to Str
    #ValueMod => "#ValueMod" to Str
    #ValueOr => "#ValueOr" to Str
    #ValueXor => "#ValueXor" to Str
    #ValueAnd => "#ValueAnd" to Str

    #ValueEq => "#ValueEq" to Str
    #ValueNe => "#ValueNe" to Str
    #ValueLt => "#ValueLt" to Str
    #ValueGt => "#ValueGt" to Str
    #ValueLe => "#ValueLe" to Str
    #ValueGe => "#ValueGe" to Str

    #ValueLoad => "#ValueLoad" to Str
    #ValueShl => "#ValueShl" to Str
    #ValueShr => "#ValueShr" to Str
    #ValueCall => "#ValueCall" to Str
    #ValueIndex => "#ValueIndex" to Str
    #ValueAccess => "#ValueAccess" to Str
    #ValueCast => "#ValueCast" to Str
    #ValueWhen => "#ValueWhen" to Str
    else => "<unknown-value-kind>" to Str
  }

  printf("%s", kstr)
}



value_print = (v : *Value) -> () {
  printf("value:")
  printf("type: "); prttype(v.type);
  when v.kind {
    #ValueForbidden => func () -> () {printf("#ValueForbidden")} ()

    #ValuePoison => func () -> () {printf("#ValuePoison")} ()

    #ValueUndefined => value_print_undefined (v)


    #ValueImmediate => value_print_immediate (v)

    #ValueGlobalConst => value_print_global_const (v)
    #ValueGlobalVar => value_print_global_var (v)

    #ValueParam => value_print_param (v)

    #ValueLocalConst => value_print_local_const (v)
    #ValueLocalVar => value_print_local_var (v)

    #ValueRef => value_print_ref (v)
    #ValueDeref => value_print_deref (v)
    #ValueNot => value_print_not (v)
    #ValueMinus => value_print_minus (v)
    #ValuePlus => value_print_plus (v)

    #ValueAdd => value_print_bin (v, "add")
    #ValueSub => value_print_bin (v, "sub")
    #ValueMul => value_print_bin (v, "mul")
    #ValueDiv => value_print_bin (v, "div")
    #ValueMod => value_print_bin (v, "mod")
    #ValueOr => value_print_bin (v, "or")
    #ValueXor => value_print_bin (v, "xor")
    #ValueAnd => value_print_bin (v, "and")

    #ValueEq => value_print_bin (v, "eq")
    #ValueNe => value_print_bin (v, "ne")
    #ValueLt => value_print_bin (v, "lt")
    #ValueGt => value_print_bin (v, "gt")
    #ValueLe => value_print_bin (v, "le")
    #ValueGe => value_print_bin (v, "ge")

    #ValueLoad => value_print_load (v)
    #ValueShl => value_print_shl (v)
    #ValueShr => value_print_shr (v)
    #ValueCall => value_print_call (v)
    #ValueIndex => value_print_index (v)
    #ValueAccess => value_print_access (v)
    #ValueCast => value_print_cast (v)
    #ValueWhen => value_print_select (v)
    else => () -> ()  {} ()
  }
}

value_print_undefined = (v : *Value) -> () {}
value_print_immediate = (v : *Value) -> () {}
value_print_global_const = (v : *Value) -> () {}
value_print_global_var = (v : *Value) -> () {}
value_print_param = (v : *Value) -> () {}
value_print_local_const = (v : *Value) -> () {}
value_print_local_var = (v : *Value) -> () {}

value_print_ref = (v : *Value) -> () {}
value_print_deref = (v : *Value) -> () {}
value_print_not = (v : *Value) -> () {}
value_print_minus = (v : *Value) -> () {}
value_print_plus = (v : *Value) -> () {}

value_print_bin = (v : *Value, op : Str) -> () {
  printf("value %s\n", op)
  printf("left_type:"); prttype(v.bin.left.type)
  printf("right_type:"); prttype(v.bin.right.type)
}

value_print_load = (v : *Value) -> () {}
value_print_shl = (v : *Value) -> () {}
value_print_shr = (v : *Value) -> () {}
value_print_call = (v : *Value) -> () {}
value_print_index = (v : *Value) -> () {}
value_print_access = (v : *Value) -> () {}
value_print_cast = (v : *Value) -> () {}
value_print_select = (v : *Value) -> () {}

