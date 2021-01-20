/*****************************************************************************/
/*                                Value                                      */
/*****************************************************************************/

smalloc = (size : Nat) -> *Unit or Unit {
  p = malloc(size)
  if p == nil {return unit}
  return p
  /*return when p {
    nil => unit
    else => p
  }*/
}

// я не умею приводить указатель к мейби типу поэтому пишу пока через функцию
vn = () -> *Value or Unit  {
  x = malloc (sizeof Value) to *Value
  if x == nil {
    assert (false, "value_new : v != nil")
    return unit
  }
  return x
}

value_new = (k : ValueKind, t : *Type, ti : *TokenInfo) -> *Value {
  v = malloc (sizeof Value) to *Value
  assert (v != nil, "value_new : v != nil")
  memset (v, 0, sizeof Value)
  v.kind := k
  v.type := t
  v.ti := ti
  return v
}


value_new_poison = (ti : *TokenInfo) -> *Value {
  tp = type_new (#TypePoison, 0, ti)
  return value_new (#ValuePoison, tp, ti)
}


value_new_imm = (t : *Type, dx : Int64, ti : *TokenInfo) -> *Value {
  v = value_new (#ValueImmediate, t, ti)
  v.imm := dx
  return v
}


dold2 = (x : *Value) -> *Value {

  typ = when x.type.kind {
    #TypeVar => x.type.var.of
    else => x.type
  }

  k = x.kind
  if x.type.kind == #TypeVar or
  k == #ValueGlobalVar or // это плохо
  k == #ValueLocalVar or  // и это плохо
  k == #ValueDeref or
  k == #ValueIndex or
  k == #ValueAccess
  {
    ldval = value_new (#ValueLoad, typ, x.ti)
    ldval.load := x
    return ldval
  }

  return x
}


dold = (x : *Value) -> *Value {

  x.type := when x.type.kind {
    #TypeVar => x.type.var.of
    else => x.type
  }

  /*k = x.kind
  if x.type.kind == #TypeVar or
  k == #ValueGlobalVar or // это плохо
  k == #ValueLocalVar or  // и это плохо
  k == #ValueDeref or
  k == #ValueIndex or
  k == #ValueAccess
  {
    ldval = value_new (#ValueLoad, typ, x.ti)
    ldval.load := x
    return ldval
  }*/

  return x
}



do_value = DoValue {return do_valuex(x, true)}

do_valuex = DoValuex {
  v = when x.kind {
    #AstValueId      => do_value_named   (x)
    #AstValueNum     => do_value_numeric (x)
    #AstValueStr     => do_value_string  (x)
    #AstValueFunc    => do_value_func    (x)
    #AstValueArr     => do_value_array   (x)
    #AstValueRec     => do_value_record  (x)
    #AstValueRef     => do_value_ref     (x)
    #AstValueDeref   => do_value_deref   (x)
    #AstValueNot     => do_value_not     (x)
    #AstValueMinus   => do_value_minus   (x)
    #AstValuePlus    => do_value_plus    (x)
    #AstValueAdd     => do_value_bin (#ValueAdd, x)
    #AstValueSub     => do_value_bin (#ValueSub, x)
    #AstValueMul     => do_value_bin (#ValueMul, x)
    #AstValueDiv     => do_value_bin (#ValueDiv, x)
    #AstValueMod     => do_value_bin (#ValueMod, x)
    #AstValueAnd     => do_value_bin (#ValueAnd, x)
    #AstValueXor     => do_value_bin (#ValueXor, x)
    #AstValueOr      => do_value_bin (#ValueOr, x)
    #AstValueLt      => do_value_bin (#ValueLt, x)
    #AstValueGt      => do_value_bin (#ValueGt, x)
    #AstValueEq      => do_value_bin (#ValueEq, x)
    #AstValueNe      => do_value_bin (#ValueNe, x)
    #AstValueLe      => do_value_bin (#ValueLe, x)
    #AstValueGe      => do_value_bin (#ValueGe, x)
    #AstValueShl     => do_value_shift   (x)
    #AstValueShr     => do_value_shift   (x)
    #AstValueCall    => do_value_call    (x)
    #AstValueIndex   => do_value_index   (x)
    #AstValueAccess  => do_value_access  (x)
    #AstValueCast    => do_value_cast    (x)
    #AstValueIs      => do_value_is      (x)
    #AstValueAs      => do_value_as      (x)
    #AstValueSizeof  => do_value_sizeof  (x)
    #AstValueAlignof => do_value_alignof (x)
    #AstValueWhen    => do_value_when    (x)
    #AstValueForbidden => do_value_forbidden (x)
    else => value_new_poison (x.ti)
  }

  assert(v != nil, "do_value : v == nil")

  if v.kind == #ValuePoison {return v}

  //return v

  return when load {
    true => dold (v)
    else => v
  }
}


do_value_forbidden = DoValue {
  error ("do_value_forbidden", x.ti)
  fatal ("stop.")
  return value_new_poison (x.ti)
}


do_value_when = DoValue {
  v = value_new (#ValueWhen, nil, x.ti)
  selector = do_value (x.select.x)
  v.select.x := selector

  // контекст
  Kit = (selector : *Value, v : *Value)
  kit = 0 to Var Kit
  kit.selector := selector
  kit.v := v

  do_variants = ListForeachHandler {
    variant = data to *AstValueWhenVariant
    kit = ctx to *Kit

    if variant.x != nil {
      key = implicit_cast (do_value (variant.x), kit.selector.type)

      val0 = do_value (variant.y)

      if kit.v.type == nil {
        kit.v.type := val0.type
      } else {
        if not type_check (val0.type, kit.v.type, val0.ti) {}
      }

      // если тип селекта определен,
      // пытаемся неявно привести к нему все варианты
      val = when kit.v.type {
        nil => val0
        else => implicit_cast (val0, kit.v.type)
      }


      if not type_check (kit.selector.type, key.type, key.ti) {}

      v = malloc(sizeof ValueWhenVariant) to *ValueWhenVariant
      v.x := key
      v.y := val

      list_append (&kit.v.select.variants, v)
    } else {
      // это when x is {}
      tx = do_type(variant.is_t)


      val0 = do_value (variant.y)

      if kit.v.type == nil {
        kit.v.type := val0.type
      } else {
        if not type_check (val0.type, kit.v.type, val0.ti) {}
      }

      // если тип селекта определен,
      // пытаемся неявно привести к нему все варианты
      val = when kit.v.type {
        nil => val0
        else => implicit_cast (val0, kit.v.type)
      }

      printf("SECOND!\n")

      // Создаю локальное выражение is
      vx = value_new(#ValueIs, typeBool, tx.ti)
      vx.is.value := kit.selector
      vx.is.variant := type_union_get_variant (kit.v.type, tx)

      v = malloc(sizeof ValueWhenVariant) to *ValueWhenVariant
      v.x := vx
      v.y := val

      list_append (&kit.v.select.variants, v)
    }
  }
  list_foreach (&x.select.variants, do_variants, &kit)


  if x.select.other == nil {
    error("expected 'other' variant", x.ti)
    return value_new_poison (x.ti)
  }

  v.select.other := implicit_cast (do_value(x.select.other), kit.v.type)

  v.ti := x.ti

  return v
}


// не загружает переменную - просто пока отбрасывает ее Var тип
do_value_ref = DoValue {
  v0 = do_valuex (x.operand[0], false)

  if v0.kind == #ValuePoison {return v0}

  if v0.type.kind != #TypeVar {
    //warning("expected Var for ref operation", x.operand[0].ti)
  } else {
    v0.type := v0.type.var.of
  }

  v = v0

  if v.kind == #ValuePoison {return v}

  vx = value_new (#ValueRef, type_pointer_new (v.type, x.ti), x.ti)
  vx.un.x := v
  return vx
}


do_value_deref = DoValue {
  // eval & load pointer
  v = do_value (x.operand[0])

  if v.kind == #ValuePoison {return v}

  if v.type.kind != #TypePointer {
    error ("expected pointer", v.ti)
    return value_new_poison (x.ti)
  }

  vx = value_new (#ValueDeref, v.type.pointer.to, x.ti)
  vx.un.x := v
  return vx
}





do_value_bin = (k : ValueKind, x : *AstValue) -> *Value {
  lv = do_value (x.operand[0])
  rv = do_value (x.operand[1])

  if lv.kind == #ValuePoison {return lv}
  if rv.kind == #ValuePoison {return rv}

  l = implicit_cast (lv, rv.type)
  r = implicit_cast (rv, l.type)

  if not type_check (l.type, r.type, x.ti) {goto fail}

  if not typeValidForBin (k, l.type) {
    error("binary type error", x.ti)
    goto fail
  }

  typ = when isReletionOpKind (k) {
    true => typeBool
    else => l.type
  }

  if l.kind == #ValueImmediate and r.kind == #ValueImmediate {
    lv = l.imm
    rv = r.imm
    imm = when k {
      #ValueAdd => lv + rv
      #ValueSub => lv - rv
      #ValueMul => lv * rv
      #ValueDiv => lv / rv
      #ValueMod => lv % rv
      #ValueOr  => lv or rv
      #ValueXor => lv xor rv
      #ValueAnd => lv and rv
      #ValueEq  => (lv == rv) to Int64
      #ValueNe  => (lv != rv) to Int64
      #ValueLt  => (lv < rv) to Int64
      #ValueGt  => (lv > rv) to Int64
      #ValueLe  => (lv <= rv) to Int64
      #ValueGe  => (lv >= rv) to Int64
      else => 0
    }

    return value_new_imm (typ, imm, x.ti)
  }

  v = value_new (k, typ, x.ti)
  v.bin.l := l
  v.bin.r := r
  v.dirty := l.dirty or r.dirty
  return v

fail:
  return value_new_poison (x.ti)
}


//args_is_dirty = false to Var Bool

do_value_call = DoValue {
  f = do_value (x.call.func)

  if f.kind == #ValuePoison {return f}

  args = do_args (f, &x.call.args, x.ti)

  v = value_new (#ValueCall, f.type.func.to, x.ti)
  v.call.func := f
  v.call.args := args
  return v

fail:
  return value_new_poison (x.ti)
}


do_args = (f : *Value, a : *List, ti : *TokenInfo) -> *List {
  plist = f.type.func.from.record.decls  // parameters

  Ctx3 = (
    f : *Value
    paramlist : *List
    arglist : *List
    call_ti : *TokenInfo
  )

  ctx = 0 to Var Ctx3
  ctx.f := f
  ctx.paramlist := plist
  ctx.arglist := list_new ()
  ctx.call_ti := ti

  chk = ListWhileHandler2 {
    p = data1 to *Decl   // param
    a0 = data2 to *AstValue  // arg
    context = ctx to *Ctx3

    if a0 == nil {
      // если аргументы кончились раньше чем параметры
      // это точно ошибка
      error ("not enough arguments", context.call_ti)
      return false
    }

    a = do_value (a0)

    if p == nil {
      if not context.f.type.func.arghack {
        error ("excess argument", a.ti)
      }
      // кончились параметры, но есть аргументы - это особая ситуация
      // просто избавляемся от Generic'ов
      na = implicit_cast_int (a)
      list_append (context.arglist, na)
      return true
    }

    // есть и параметр и аргумент

    /* пытаемся неявно привести аргумент к параметру */
    na = implicit_cast (a, p.type)

    /* check argument type */
    if not type_check (p.type, na.type, na.ti) {}

    list_append (context.arglist, na)

    return true
  }
  list_while2_or (plist, a, chk, &ctx to *Unit)

  return ctx.arglist
}



do_value_index = DoValue {
  a = unwrap_var (do_valuex (x.index.array, false)) to Var *Value
  i = do_value (x.index.index)

  if a.kind == #ValuePoison {goto fail}
  if i.kind == #ValuePoison {goto fail}

  // индексация допускается и для указателей на определенные массивы!
  // тип операции индексирования - тип элемента ее массива
  // тк *[x]X <=> []X

  // It expects array or undefined array or pointer to array
  typ = when a.type.kind {
    #TypeArray   => a.type.array.of
    #TypeArrayU  => a.type.array_u.of
    #TypePointer => (_to : *Type) -> *Type {
      return when _to.kind {
        #TypeArray => _to.array.of
        else => nil to *Type
      }
    } (a.type.pointer.to)
    else => nil
  }

  if typ == nil {
    error_type_error (a.ti, a.type, nil)
    goto fail
  }

  v = value_new (#ValueIndex, typ, x.ti)
  v.index.array := a
  v.index.index := implicit_cast_int (i)
  return v

fail:
  return value_new_poison (x.ti)
}


do_value_access = DoValue {
  r = unwrap_var (do_valuex (x.access.rec, false)) to Var *Value
  field_id = x.access.field_id.str

  if r.kind == #ValuePoison {goto fail}

  // It expects record or pointer to record
  r_typ = when r.type.kind {
    #TypeRecord  => r.type
    #TypePointer => (_to : *Type) -> *Type {
      return when _to.kind {
        #TypeRecord => _to
        else => nil
      }
    } (r.type.pointer.to)
    else => nil
  }

  if r_typ == nil {
    error_type_error (r.ti, r.type, nil)
    goto fail
  }

  field = type_record_get_field (r_typ, field_id)

  if field == nil {
    error ("undefined field", x.access.field_id.ti)
    goto fail
  }

  v = value_new (#ValueAccess, field.type, x.ti)
  v.access.value := r
  v.access.field := field_id
  return v

fail:
  return value_new_poison (x.ti)
}


DoValueCast = (v : *Value, t : *Type, ti : *TokenInfo) -> *Value

do_value_cast_var = DoValueCast {return cast (v, t, v.ti)}

do_value_cast_bool = DoValueCast {
  // Bool can be casted only to Numeric
  if t.kind != #TypeNumeric {
    error ("type cast error", ti)
  }
  return cast (v, t, v.ti)
}

do_value_cast_ref = DoValueCast {
  // nil может быть привееден к любому ссылочному типу (или Numeric :unsafe)
  if not type_is_ref (t) {
    error ("type cast error", ti)
  }
  return cast (v, t, ti)
}

do_value_cast_num = DoValueCast {
  // Numeric can be casted to any Numeric (and Ref type :unsafe)
  if not unsafe {
    if type_is_ref (t) {
//      warning("cast num to ref", ti)
    }
  }
  return cast (v, t, ti)
}

do_value_cast_func = DoValueCast {
  // функции можно приводить только к *Unit
  if not typeIsPointerToUnit (t) {
    error ("type cast error", ti)
  }
  return cast (v, t, ti)
}

do_value_cast_set = DoValueCast {
  // Множества можно приводить только к Numeric
  if t.kind != #TypeNumeric {
    error ("type cast error", ti)
  }
  return cast (v, t, ti)
}


do_value_cast_rec = DoValueCast {
  error ("type cast error", ti)
  return cast (v, t, ti)
}

do_value_cast_ptr = DoValueCast {
  return cast (v, t, ti)
}

do_value_cast_arr = DoValueCast {
  // массив можно привести к записи или другому массиву
  // в любом случае это будет unsafe операция
  error ("type cast error", ti)
  return cast (v, t, ti)
}

do_value_cast_uarr = DoValueCast {
  // неопределенный массив можно привести к *Unit
  // и неопределенному массиву?
  if not typeIsPointerToUnit (t) {
    error ("type cast error", ti)
  }
  return cast (v, t, ti)
}


do_value_cast_union = DoValueCast {
  printf("do_value_cast_union\n")
  return cast (v, t, ti)
}

do_value_cast = DoValue {
  v = do_value (x.cast.value)
  t = do_type (x.cast.type)
  ti = x.ti

  //printf("CAST: "); prttype(v.type); printf("\n")

  if v.kind == #ValuePoison {goto fail}
  if t.kind == #TypePoison {goto fail}

  // если приводим не к переменной
  if t.kind != #TypeVar {

    // приведение к собственному типу не имеет смысла
    if type_eq (v.type, t) {
      warning ("cast to same type", ti)
      return v
    }

    // выполняем приведение
    xx = when v.type.kind {
      //#TypeUndefined => nil to *Value
      #TypeVar       => do_value_cast_var   (v, t, ti)
      #TypeBool      => do_value_cast_bool  (v, t, ti)
      #TypeGenericReference => do_value_cast_ref (v, t, ti)
      #TypeNumeric   => do_value_cast_num   (v, t, ti)
      #TypeFunc      => do_value_cast_func  (v, t, ti)
      #TypeEnum      => do_value_cast_set   (v, t, ti)
      #TypeRecord    => do_value_cast_rec   (v, t, ti)
      #TypePointer   => do_value_cast_ptr   (v, t, ti)
      #TypeArray     => do_value_cast_arr   (v, t, ti)
      #TypeArrayU    => do_value_cast_uarr  (v, t, ti)
      #TypeUnion     => do_value_cast_union (v, t, ti)
      else => DoValueCast {
        fatal ("do_value_cast unk")
        return nil to *Value
      } (v, t, ti)
    }

    //printf(">> "); value_print_kind(v.kind); /*prttype(xx.cast.type);*/ printf("\n")
    return xx
  }

  // если приводим к переменной - конструируем переменную

  // create Var value
  // приведение к типу Var создает по месту переменную и присваивает ей значение
  // возвращаем мы уже переменную

  // наше v здесь точно имеет Var тип
  // ХАК (поскольку cast не умеет приводить к Var типу мы его развернем
  // а после снова завернем в VAr)
  // приводим значение к типу объвляемой переменной
  // но не к Var типу а к Var#of
  tt = t.var.of
  init_value = cast (v, tt, x.ti)
  // а после оборачиваем тип снова в Var
  init_value.type := type_var_new (init_value.type, t.ti)

  varname = get_name_var ()  // один как на глобальные так и локальные!!??

  if fctx != nil {
    // we're in function
    // create local var

    id = 0 to Var AstId
    id.str := varname
    id.ti := x.ti

    return create_local_var (&id, t, init_value, x.ti)
  } else {
    // create global var
    return create_global_var (varname, t, init_value, x.ti)
  }

fail:
  return value_new_poison (x.ti)
}



do_value_is = DoValue {
  v = do_value (x.is.value)
  t = do_type (x.is.type)

  // чекаем если значение имеет unit тип
  if v.type.kind != #TypeUnion {
    error ("expected union type", v.ti)
  }

  // чекаем если проверяем на соответствие типу который входит в объединение
  if not type_present_in_list (&v.type.union.types, t) {
    error ("type error", v.ti)
    goto fail
  }

  variant = type_union_get_variant (v.type, t)

  vx = value_new(#ValueIs, typeBool, x.ti)
  vx.is.value := v
  vx.is.variant := variant

  return vx

fail:
  return value_new_poison (x.ti)
}


do_value_as = DoValue {
  v = do_value (x.as.value)
  t = do_type (x.as.type)
  ti = x.ti

  if v.kind == #ValuePoison {goto fail}
  if t.kind == #TypePoison {goto fail}


  // чекаем если приводим к типу который входит в объединение
  if not type_present_in_list (&v.type.union.types, t) {
    error ("type error", v.ti)
    goto fail
  }

  // если юнион реализован как указатель
  if v.type.union.impl != nil {
    return cast (v, t, x.ti)
  }

  // это полноценный юнион
  return cast (v, t, ti)

  /*vx = value_new (#ValueAs, t, x.ti)
  vx.as.value := v
  vx.as.type := t
  return vx*/

fail:
  return value_new_poison (x.ti)
}



do_value_sizeof = DoValue {
  t = do_type (x.of_type)

  if t.kind == #TypePoison {goto fail}

  if t.kind == #TypeUndefined {
    error ("sizeof unknown type", x.of_type.ti)
    return value_new_poison (x.ti)
  }

  return value_new_imm (typeNumeric, t.size to Int64, x.ti)

fail:
  return value_new_poison (x.ti)
}


do_value_alignof = DoValue {
  t = do_type (x.of_type)

  if t.kind == #TypePoison {goto fail}

  if t.kind == #TypeUndefined {
    error ("alignof unknown type", x.of_type.ti)
    return value_new_poison (x.ti)
  }

  return value_new_imm (typeNumeric, t.size to Int64, x.ti)

fail:
  return value_new_poison (x.ti)
}


do_value_named = DoValue {
  id = x.name.id.str
  v = get_value (id)

  if v == nil {
    error ("unknown value\n", x.ti)
    nv = value_new_poison (x.ti)
    //bind_value(&module.public, id, nv)
    //bind_value(&module.undef, id, nv)
    //info("create #ValueUndefined in module.undef", ti)
    return nv
  }

  // копируется все норм, но есть ValueUndefined
  // которые будут потом определены, и вот с ними бывает пролет
  //vv = malloc(sizeof Value) to *Value
  //*vv := *v

  return v
}


do_value_numeric = DoValue {
  str = x.str
  d = 0 to Var Int64
  if str[0] == "0"[0] and str[1] == "x"[0] {
    sscanf (&str[2], "%llx", &d)
  } else {
    sscanf (&str[0], "%lld", &d)
  }

  return value_new_imm (typeNumeric, d, x.ti)
}


do_value_string = DoValue {
  s = x.str
  len = strlen (s) + 1
  typ = type_pointer_new (type_array_new (typeChar, len, x.ti), x.ti)
  v = value_new (#ValueGlobalConst, typ, x.ti)
  id = get_name_str ()
  v.def := asmStringAdd (&asm0, id, s, len)
  return v
}


fuid = 0 to Var Nat
// портал из мира Value в мир Stmt
do_value_func = DoValue {
  t = do_type (x.func.type)

  if t.kind == #TypePoison {goto fail}

  // get func 'name'
  fuid := fuid + 1
  uid = get_suid ("func", fuid)

  if x.extern {
    fv = value_new (#ValueGlobalConst, t, x.ti)
    fv.def := asmFuncAdd (&asm0, uid, t, nil)
    return fv
  }

  // создаем фиктивный parent-block c параметрами
  // он просто значится как parent
  // делаю именно так а не ищу каждый раз в индексе в типе функции
  // тк тогда придется каждый раз заново создавать значения для параметров
  // TODO вообще правильней всего просто засунуть их первыми в рут блок а не
  // делать этот фиктивный. Но пока так
  param_block = stmt_block_new (malloc (sizeof Block) to *Block, nil)
  getparam = ListForeachHandler {
    decl = data to *Decl
    param_block = ctx to *Block

    param_value = value_new (#ValueParam, decl.type, decl.ti)
    param_value.field := decl
    map_append (&param_block.index.values, decl.id.str, param_value)
  }
  list_foreach (t.func.from.record.decls, getparam, param_block)

  fv = value_new (#ValueGlobalConst, t, x.func.block_stmt.ti)

  // we're in func?
  // add current func to parant func local_funcs list
  if fctx != nil {
    list_append (&fctx.cblock.local_funcs, fv)
  }

  // save global func context
  old_fctx = fctx

  // create new func context
  fctx := malloc (sizeof FuncContext) to *FuncContext
  memset (fctx, 0, sizeof FuncContext)

  fctx.id := when old_fctx {
    nil => uid
    else => cat3 (old_fctx.id, "_", uid)
  }

  // set current block ^^ (after add to parent)
  fctx.cblock := param_block
  fctx.cfunc := fv

  bx0 = do_stmt (x.func.block_stmt)

  if bx0 is Unit {goto fail}
  bx = bx0 as *Stmt

  fv.def := asmFuncAdd (&asm0, uid, t, &bx.b)

  fctx := old_fctx  // restore func context before exit

  return fv

fail:
  fctx := old_fctx  // restore func context before exit
  return value_new_poison (x.ti)
}


do_value_array = DoValue {return value_new_poison (x.ti)}
do_value_record = DoValue {return value_new_poison (x.ti)}


do_value_plus = DoValue {
  v = do_value (x.operand[0])

  if v.kind == #ValuePoison {goto fail}

  if v.kind == #ValueImmediate {
    return value_new_imm (v.type, v.imm, x.ti)
  }

  vx = value_new (#ValuePlus, v.type, x.ti)
  vx.un.x := v
  return vx

fail:
  return value_new_poison (x.ti)
}


do_value_minus = DoValue {
  v = do_value (x.operand[0])

  if v.kind == #ValuePoison {goto fail}

  if v.kind == #ValueImmediate {
    return value_new_imm (v.type, -v.imm, x.ti)
  }

  vx = value_new (#ValueMinus, v.type, x.ti)
  vx.un.x := v
  return vx

fail:
  return value_new_poison (x.ti)
}


do_value_not = DoValue {
  v = do_value (x.operand[0])

  if v.kind == #ValuePoison {goto fail}

  if v.kind == #ValueImmediate {
    return value_new_imm (v.type, not v.imm, x.ti)
  }

  vx = value_new (#ValueNot, v.type, x.ti)
  vx.un.x := v
  return vx

fail:
  return value_new_poison (x.ti)
}


// shl, shr слишком отличны чтобы входить в bin
do_value_shift = DoValue {
  l = do_value (x.operand[0])
  r = do_value (x.operand[1])

  if l.kind == #ValuePoison {goto fail}
  if r.kind == #ValuePoison {goto fail}

  k = when x.kind {
    #AstValueShl => #ValueShl
    else => #ValueShr
  }

  // свертка констант
  if l.kind == #ValueImmediate and r.kind == #ValueImmediate {

    d = when k {
      #ValueShl => l.imm << r.imm
      else => l.imm >> r.imm
    }

    return value_new_imm (l.type, d, x.ti)
  }

  l2 = implicit_cast_int (l)

  // (!) LLVM требует чтобы типы левого и правого в шифтах были одинаковы,
  // что глупо но.. поэтому приводим правое к левому
  r2 = cast (r, l.type, r.ti)

  v = value_new (k, l.type, x.ti)
  v.bin.l := l2
  v.bin.r := r2
  return v

fail:
  return value_new_poison (x.ti)
}







// тип пригоден для бинарной операции?
typeValidForBin = (k : ValueKind, t : *Type) -> Bool {
  if t.kind == #TypePoison {return true}

  // Record и Array не могут участвовать в бинарных операциях
  if t.kind == #TypeRecord or typeIsDefinedArray (t) {
    return false
  }

  // all types besides ^ are suitable for Eq/Ne operation
  if k == #ValueEq or k == #ValueNe {return true}

  // все остальное можно сравнивать

  // операции с значениями-ссылками запрещены
  if type_is_ref (t) {return false}

  if k != #ValueAnd and k != #ValueOr and k != #ValueXor {
    // арифметические операции невозможны с булевыми и ссылочными значениями
    if t.kind == #TypeEnum or type_eq (t, typeBool) or type_is_ref (t) {return false}
  }

  return true
}




cast = (vx : *Value, t : *Type, ti : *TokenInfo) -> *Value {
  if vx.kind == #ValuePoison {goto fail}
  if t.kind == #TypePoison {goto fail}

  // приведение к собственному типу бессмыслено
  if type_eq (vx.type, t) {return vx}


  // приведение подтипа к Union-надтипу
  if t.kind == #TypeUnion {
    goto sact
    error("приведение юнион", ti)
    return value_new_poison (ti)
  }


  // можем ли мы приводить непосредственно значение v к типу t ?
  immCastIsPossible = (v : *Value, t : *Type) -> Bool {
    return v.kind == #ValueImmediate  // STUB
  }

  // creating new imm value with target type
  if immCastIsPossible (vx, t) {
    return value_new_imm (t, vx.imm, ti)
  }


sact:

  //printf("OOPS: "); prttype(vx.type); printf("\n")

  // во всех остальных случаях выполняем runtime приведение
  v = value_new (#ValueCast, t, ti)
  v.cast.value := vx
  v.cast.type := t
  return v

fail:
  return value_new_poison (ti)
}




// Естественное преобразование
// Вызывается в фазе проверки типов
// 1. *[x] -> []
// 2. *Unit -> *   &&  * -> *Unit
// 3. *Unit -> []  &&  [] -> *Unit


// если у v тип GenericNumeric -> приводим его к typeBaseInt
// used in: [index, call, shift, expr]
implicit_cast_int = (v : *Value) -> *Value {
  return when type_eq (v.type, typeNumeric) {
    true => value_new_imm (typeBaseInt, v.imm, v.ti)
    else => v
  }
}


// неявное преобразование значения к заданному типу
// или просто возвращает значение без преобразования (когда оно невозможно)
implicit_cast = (v : *Value, t : *Type) -> *Value {
  assert (v.type != nil, "implicit_cast::v.type == nil")
  assert (t != nil, "implicit_cast::t == nil")

  if v.kind == #ValuePoison {return v}
  if t.kind == #TypePoison {goto fail}

  // TypeNumeric -> Basic:Integer
  if v.kind == #ValueImmediate {
    if type_is_generic_num (v.type) and type_is_basic_integer (t) {
      // проверяем если константа вписывается в размер типа
      if 1 to Nat128 << t.num.power <= v.imm to Nat128 {
        error ("type overflow", v.ti)
      }
      return value_new_imm (t, v.imm, v.ti)
    }
  }

  if implicit_cast_possible (v.type, t) {
    return cast (v, t, v.ti)
  }

  return v

fail:
  return value_new_poison (nil)
}



// can we do implicit cast a ~> b ?
implicit_cast_possible = (a, b : *Type) -> Bool {
  ak = a.kind
  bk = b.kind

  // nil -> TypeReference
  if ak == #TypeGenericReference {
    if bk == #TypePointer or bk == #TypeArrayU or bk == #TypeFunc {return true}
  }

  if ak == #TypePointer {

    // cast for: *[x] -> []
    if typeIsDefinedArray (a.pointer.to) {
      if typeIsUndefinedArray (b) {
        return true
      }
    }

    // if a is ptr & b is ptr
    // *Unit -> * && * -> *Unit
    if bk == #TypePointer {
      // auto cast for: *Unit -> *
      if type_eq (a, typeFreePtr) {return true}

      // auto cast for: * -> *Unit
      if type_eq (b, typeFreePtr) {return true}
    }
  }

  // если неявно приводим подтип к над-объединению
  if bk == #TypeUnion {
    return type_present_in_list(&b.union.types, a)
  }

  return false
}





isUnaryOpKind = (k : ValueKind) -> Bool
{return k == #ValueRef or k == #ValueDeref or k == #ValueMinus or k == #ValuePlus or k == #ValueNot}


isBinaryOpKind = (k : ValueKind) -> Bool {
  return k == #ValueAdd or
         k == #ValueSub or
         k == #ValueMul or
         k == #ValueDiv or
         k == #ValueMod or
         k == #ValueAnd or
         k == #ValueOr or
         k == #ValueXor or
         isReletionOpKind (k)
}


isReletionOpKind = (k : ValueKind) -> Bool {
  return k == #ValueEq or
         k == #ValueNe or
         k == #ValueLt or
         k == #ValueGt or
         k == #ValueLe or
         k == #ValueGe
}


isSpecialOpKind = (k : ValueKind) -> Bool {
  return k == #ValueShl or
         k == #ValueShr or
         k == #ValueCall or
         k == #ValueIndex or
         k == #ValueAccess or
         k == #ValueCall or
         k == #ValueCast
}



// испольуется в assign
value_is_readonly = (v : *Value) -> Bool {
  if v.type.kind == #TypeVar {return false}

  k = v.kind

  if k == #ValueIndex {
    def_arr = typeIsDefinedArray (v.index.array.type)
    return value_is_readonly (v.index.array) and def_arr
  }

  if k == #ValueAccess {
    return value_is_readonly (v.access.value) and v.access.value.type.kind != #TypePointer
  }

  // это неправильно - тк операции тоже readonly!
  return k == #ValueGlobalConst or
         k == #ValueImmediate or
         k == #ValueLocalConst or
         k == #ValueParam
}


valueIsMutable = (v : *Value) -> Bool {
  k = v.kind
  return k == #ValueLocalVar or k == #ValueGlobalVar
}



// create global values: True, False, nil, etc.
value_init = () -> () {
  // false
  _false = value_new_imm (typeBool, 0, nil)
  builtin_value_bind ("false", _false)

  // true
  _true = value_new_imm (typeBool, 1, nil)
  builtin_value_bind ("true", _true)

  // nil
  nil_type = type_new(#TypeGenericReference, cfgPointerSize, nil)
  _nil = value_new_imm (nil_type, 0, nil)
  builtin_value_bind ("nil", _nil)

  // unit
  _unit = value_new_imm (typeUnit, 0, nil)
  builtin_value_bind ("unit", _unit)
}


