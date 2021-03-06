/*****************************************************************************/
/*                                Value                                      */
/*****************************************************************************/

is_value_imm_num = (v : *Value) -> Bool {
  return v.data is ValueImm
}

/*is_value_imm_rec = (v : *Value) -> Bool {
  if v.data isnt ValueImm {return false}
  return v.type.kind ==
}*/

smalloc = (size : Nat) -> *Unit or Unit {
  p = malloc(size)
  if p == nil {return unit}
  return p
  /*return when p {
    nil => unit
    else => p
  }*/
}


value_new = (x : Value2, t : *Type, ti : *TokenInfo) -> *Value {
  v = malloc (sizeof Value) to *Value
  assert (v != nil, "value_new : v != nil")
  *v := (type=t, ti=ti, data=x)
  return v
}


value_new_poison = (ti : *TokenInfo) -> *Value {
  tp = type_new (#TypePoison, (ti=ti) to TypePoison, 0, ti)
  return value_new ((ti=ti) to ValuePoison, tp, ti)
}


value_new_imm = (t : *Type, dx : Int64, ti : *TokenInfo) -> *Value {
  return value_new ((type=t, value=dx, ti=ti) to ValueImm, t, ti)
}


dold2 = (x : *Value) -> *Value {

  typ = when x.type.kind {
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
    //ldval.load := x
    return ldval
  }*/

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


exist do_value_named   : (x : AstValueName) -> *Value
exist do_value_numeric : (x : AstValueNumber) -> *Value
exist do_value_func    : (x : AstValueFunc) -> *Value
exist do_value_array   : (x : AstValueArray) -> *Value
exist do_value_record  : (x : AstValueRecord) -> *Value
exist do_value_string  : (x : AstValueString) -> *Value

exist do_value_ref   : (x : AstValueRef) -> *Value
exist do_value_deref : (x : AstValueDeref) -> *Value
exist do_value_minus : (x : AstValueMinus) -> *Value
exist do_value_plus  : (x : AstValuePlus) -> *Value
exist do_value_not   : (x : AstValueNot) -> *Value

exist do_value_bin : (k : ValueKind, left, right : *AstValue, ti : *TokenInfo) -> *Value

exist do_value_shift  : (k : ValueKind, left, right : *AstValue, ti : *TokenInfo) -> *Value
exist do_value_call   : (x : AstValueCall) -> *Value
exist do_value_index  : (x : AstValueIndex) -> *Value
exist do_value_access : (x : AstValueAccess) -> *Value
exist do_value_cast   : (x : AstValueCast) -> *Value
exist do_value_is     : (x : AstValueIs) -> *Value
exist do_value_isnt   : (x : AstValueIsnt) -> *Value
exist do_value_as     : (x : AstValueAs) -> *Value

exist do_value_sizeof  : (x : AstValueSizeof) -> *Value
exist do_value_alignof : (x : AstValueAlignof) -> *Value

exist do_value_when : (x : AstValueWhen) -> *Value


exist do_value_add : (x : AstValueAdd) -> *Value


do_value_add = (x : AstValueAdd) -> *Value {return do_value_bin (#ValueAdd, x.left, x.right, x.ti)}
do_value_sub = (x : AstValueSub) -> *Value {return do_value_bin (#ValueSub, x.left, x.right, x.ti)}
do_value_mul = (x : AstValueMul) -> *Value {return do_value_bin (#ValueMul, x.left, x.right, x.ti)}
do_value_div = (x : AstValueDiv) -> *Value {return do_value_bin (#ValueDiv, x.left, x.right, x.ti)}
do_value_mod = (x : AstValueMod) -> *Value {return do_value_bin (#ValueMod, x.left, x.right, x.ti)}
do_value_and = (x : AstValueAnd) -> *Value {return do_value_bin (#ValueAnd, x.left, x.right, x.ti)}
do_value_or = (x : AstValueOr) -> *Value {return do_value_bin (#ValueOr, x.left, x.right, x.ti)}
do_value_xor = (x : AstValueXor) -> *Value {return do_value_bin (#ValueXor, x.left, x.right, x.ti)}
do_value_eq = (x : AstValueEq) -> *Value {return do_value_bin (#ValueEq, x.left, x.right, x.ti)}
do_value_ne = (x : AstValueNe) -> *Value {return do_value_bin (#ValueNe, x.left, x.right, x.ti)}
do_value_lt = (x : AstValueLt) -> *Value {return do_value_bin (#ValueLt, x.left, x.right, x.ti)}
do_value_gt = (x : AstValueGt) -> *Value {return do_value_bin (#ValueGt, x.left, x.right, x.ti)}
do_value_le = (x : AstValueLe) -> *Value {return do_value_bin (#ValueLe, x.left, x.right, x.ti)}
do_value_ge = (x : AstValueGe) -> *Value {return do_value_bin (#ValueGe, x.left, x.right, x.ti)}
do_value_shr = (x : AstValueShr) -> *Value {return do_value_shift (#ValueShr, x.left, x.right, x.ti)}
do_value_shl = (x : AstValueShl) -> *Value {return do_value_shift (#ValueShl, x.left, x.right, x.ti)}



do_value = (x : *AstValue) -> *Value {return do_valuex(x, true)}

do_valuex = (x : *AstValue, load : Bool) -> *Value {
  xx = *x
  v = when xx {
    AstValueName    => do_value_named   (xx as AstValueName)
    AstValueNumber  => do_value_numeric (xx as AstValueNumber)
    AstValueFunc    => do_value_func    (xx as AstValueFunc)
    AstValueArray   => do_value_array   (xx as AstValueArray)
    AstValueRecord  => do_value_record  (xx as AstValueRecord)
    AstValueString  => do_value_string  (xx as AstValueString)

    AstValueRef     => do_value_ref     (xx as AstValueRef)
    AstValueDeref   => do_value_deref   (xx as AstValueDeref)
    AstValueMinus   => do_value_minus   (xx as AstValueMinus)
    AstValuePlus    => do_value_plus    (xx as AstValuePlus)
    AstValueNot     => do_value_not     (xx as AstValueNot)

    AstValueAdd     => do_value_add (xx as AstValueAdd)
    AstValueSub     => do_value_sub (xx as AstValueSub)
    AstValueMul     => do_value_mul (xx as AstValueMul)
    AstValueDiv     => do_value_div (xx as AstValueDiv)
    AstValueMod     => do_value_mod (xx as AstValueMod)
    AstValueAnd     => do_value_and (xx as AstValueAnd)
    AstValueXor     => do_value_xor (xx as AstValueXor)
    AstValueOr      => do_value_or (xx as AstValueOr)
    AstValueLt      => do_value_lt (xx as AstValueLt)
    AstValueGt      => do_value_gt (xx as AstValueGt)
    AstValueEq      => do_value_eq (xx as AstValueEq)
    AstValueNe      => do_value_ne (xx as AstValueNe)
    AstValueLe      => do_value_le (xx as AstValueLe)
    AstValueGe      => do_value_ge (xx as AstValueGe)
    AstValueShl     => do_value_shl (xx as AstValueShl)
    AstValueShr     => do_value_shr (xx as AstValueShr)

    AstValueCall    => do_value_call    (xx as AstValueCall)
    AstValueIndex   => do_value_index   (xx as AstValueIndex)
    AstValueAccess  => do_value_access  (xx as AstValueAccess)
    AstValueCast    => do_value_cast    (xx as AstValueCast)
    AstValueIs      => do_value_is      (xx as AstValueIs)
    AstValueIsnt    => do_value_isnt    (xx as AstValueIsnt)
    AstValueAs      => do_value_as      (xx as AstValueAs)
    AstValueSizeof  => do_value_sizeof  (xx as AstValueSizeof)
    AstValueAlignof => do_value_alignof (xx as AstValueAlignof)
    AstValueWhen    => do_value_when    (xx as AstValueWhen)
    else => (x : *AstValue) -> *Value {
      fatal("do_value : v == nil")
      return value_new_poison (nil)
    } (x)
  }

  if v.data is ValuePoison {return v}

  return when load {
    true => dold (v)
    else => v
  }
}


do_lvalue = (x : *AstValue) -> *Value {
  xx = *x
  return when xx {
    AstValueName   => do_value_named  (xx to AstValueName)
    AstValueDeref  => do_value_deref  (xx to AstValueDeref)
    AstValueIndex  => do_value_index  (xx to AstValueIndex)
    AstValueAccess => do_value_access (xx to AstValueAccess)
    else => (x : *AstValue) -> *Value {
      error ("invalid lvalue12", nil)
      return value_new_poison (nil)
    } (x)
  }
}



do_value_when = (x : AstValueWhen) -> *Value {
  val = do_value (x.x)

  Kit = (val : *Value, x_name : Str, type : *Type, variants : List, other : *Value)
  kit = (val=val) to Var Kit

  do_variants = ListForeachHandler {
    variant = data to *AstValueWhenVariant
    kit = ctx to *Kit

    if variant.x != nil {
      key = implicit_cast (do_value (variant.x), kit.val.type)

      val0 = do_value (variant.y)

      // если тип селекта определен,
      // пытаемся неявно привести к нему все варианты
      val = when kit.type {
        nil => val0
        else => implicit_cast (val0, kit.type)
      }

      if kit.type == nil {
        kit.type := val.type
      } else {
        if not type_check (kit.type, val.type, val.ti) {}
      }

      if not type_check (kit.val.type, key.type, key.ti) {}

      v = malloc(sizeof ValueWhenVariant) to *ValueWhenVariant
      *v := (x=key, y=val, ti=variant.ti)
      list_append (&kit.variants, v)

    } else {

      // это when x is {}
      tx = do_type(variant.is_t)

      if kit.val.type.kind != #TypeUnion {
        error ("expected value with union type", kit.val.ti)
      }

      // чекаем если проверяем на соответствие типу который входит в объединение
      if not type_present_in_list (&kit.val.type.union.types, tx) {
        error ("type error", tx.ti)
      }

      // создаем локальный when контекст для ветки
      when_ctx = (parent=cctx) to Var Context
      old_cctx = cctx

      //x_as = cast (kit.val, tx, kit.val.ti)
      //valbind_local ("xxx", x_as)


      // when x then
      val0 = do_value (variant.y)

      cctx := old_cctx

      if kit.type == nil {
        kit.type := val0.type
      } else {
        if not type_check (val0.type, kit.type, val0.ti) {}
      }

      // если тип селекта определен,
      // пытаемся неявно привести к нему все варианты
      val = when kit.type {
        nil => val0
        else => implicit_cast (val0, kit.type)
      }

      // Создаю локальное выражение is
      //vx = value_new (#ValueIs, typeBool, tx.ti)
      //vx.is := (type=typeBool, value=kit.val, variant=vari, ti=tx.ti)
      vari = type_union_get_variant (kit.val.type, tx)

      v = malloc(sizeof ValueWhenVariant) to *ValueWhenVariant
      *v := (x=nil, t_no=vari, y=val, ti=variant.ti)
      list_append (&kit.variants, v)
    }
  }
  list_foreach (&(x.variants to Var List), do_variants, &kit)

  if x.other == nil {
    error("expected 'other' variant", x.ti)
    return value_new_poison (x.ti)
  }

  other = implicit_cast (do_value(x.other), kit.type)
  iss = val.type.kind == #TypeUnion

  return value_new ((x=val, iss=iss, variants=kit.variants, other=other, type=kit.type, ti=x.ti) to ValueWhen, kit.type, x.ti)
}


// не загружает переменную - просто пока отбрасывает ее Var тип
do_value_ref = (x : AstValueRef) -> *Value {
  v = do_value (x.value)

  if v.data is ValuePoison {return v}

  v.type := when v.type.kind {
    #TypeVar => v.type.var.of
    else => v.type
  }

  if v.data is ValuePoison {return v}

  t = type_pointer_new (v.type, x.ti)

  return value_new ((type=t, value=v, ti=x.ti) to ValueRef, t, x.ti)
}


do_value_deref = (x : AstValueDeref) -> *Value {
  // eval & load pointer
  v = do_value (x.value)

  if v.data is ValuePoison {return v}

  if v.type.kind != #TypePointer {
    error ("expected pointer", v.ti)
    return value_new_poison (x.ti)
  }

  t = v.type.pointer.to

  return value_new ((type=t, value=v, ti=x.ti) to ValueDeref, t, x.ti)
}




do_value_bin = (k : ValueKind, left, right : *AstValue, ti : *TokenInfo) -> *Value {
  lv = do_value (left)
  rv = do_value (right)

  if lv.data is ValuePoison {return lv}
  if rv.data is ValuePoison {return rv}

  l = implicit_cast (lv, rv.type)
  r = implicit_cast (rv, l.type)

  if not type_check (l.type, r.type, ti) {goto fail}

  if not typeValidForBin (k, l.type) {
    error("binary type error", ti)
    goto fail
  }


  isReletionOpKind = (k : ValueKind) -> Bool {
    return k == #ValueEq or
           k == #ValueNe or
           k == #ValueLt or
           k == #ValueGt or
           k == #ValueLe or
           k == #ValueGe
  }

  typ = when isReletionOpKind (k) {
    true => typeBool
    else => l.type
  }

  if is_value_imm_num(l) and is_value_imm_num(r) {
    lv = (l.data as ValueImm).value
    rv = (r.data as ValueImm).value
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

    return value_new_imm (typ, imm, ti)
  }

  v = when k {
    #ValueAdd => value_new ((type=typ, left=l, right=r, ti=ti) to ValueAdd, typ, ti)
    #ValueSub => value_new ((type=typ, left=l, right=r, ti=ti) to ValueSub, typ, ti)
    #ValueMul => value_new ((type=typ, left=l, right=r, ti=ti) to ValueMul, typ, ti)
    #ValueDiv => value_new ((type=typ, left=l, right=r, ti=ti) to ValueDiv, typ, ti)
    #ValueMod => value_new ((type=typ, left=l, right=r, ti=ti) to ValueMod, typ, ti)
    #ValueOr  => value_new ((type=typ, left=l, right=r, ti=ti) to ValueOr, typ, ti)
    #ValueXor => value_new ((type=typ, left=l, right=r, ti=ti) to ValueXor, typ, ti)
    #ValueAnd => value_new ((type=typ, left=l, right=r, ti=ti) to ValueAnd, typ, ti)
    #ValueEq  => value_new ((type=typ, left=l, right=r, ti=ti) to ValueEq, typ, ti)
    #ValueNe  => value_new ((type=typ, left=l, right=r, ti=ti) to ValueNe, typ, ti)
    #ValueLt  => value_new ((type=typ, left=l, right=r, ti=ti) to ValueLt, typ, ti)
    #ValueGt  => value_new ((type=typ, left=l, right=r, ti=ti) to ValueGt, typ, ti)
    #ValueLe  => value_new ((type=typ, left=l, right=r, ti=ti) to ValueLe, typ, ti)
    #ValueGe  => value_new ((type=typ, left=l, right=r, ti=ti) to ValueGe, typ, ti)
    else => value_new_poison(ti)
  }

  //v.bin := (type=typ, left=l, right=r, ti=ti)
  return v

fail:
  return value_new_poison (ti)
}


do_value_call = (x : AstValueCall) -> *Value {
  f = do_value (x.func)

  if f.data is ValuePoison {return f}

  args = do_args (f, &(x.args to Var List), x.ti)

  t = f.type.func.to

  return value_new ((type=t, func=f, args=args, ti=x.ti) to ValueCall, t, x.ti)

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

  ctx = (f=f, paramlist=plist, arglist=list_new (), call_ti=ti) to Var Ctx3

  chk = ListWhileHandler2 {
    p = data1 to *Decl       // param
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
    if not type_check (p.type, na.type, a.ti) {}

    list_append (context.arglist, na)

    return true
  }
  list_while2_or (plist, a, chk, &ctx to *Unit)

  return ctx.arglist
}



do_value_index = (x : AstValueIndex) -> *Value {
  a = do_value (x.array)
  i = do_value (x.index)

  if a.data is ValuePoison {goto fail}
  if i.data is ValuePoison {goto fail}

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

  ind = implicit_cast_int (i)

  return value_new ((type=typ, array=a, index=ind, ti=x.ti) to ValueIndex, typ, x.ti)

fail:
  return value_new_poison (x.ti)
}


do_value_access = (x : AstValueAccess) -> *Value {
  r = do_value (x.rec)
  field_id = x.field_id.str

  if r.data is ValuePoison {goto fail}

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
    error ("undefined field", x.field_id.ti)
    goto fail
  }

  t = field.type

  return value_new ((type=t, value=r, field=field_id, ti=x.ti) to ValueAccess, t, x.ti)

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
  return cast (v, t, ti)
}


do_value_cast_gen_rec = DoValueCast {
  // приводим generic запись к типу записи t
  // для этого приводим все ее поля к типу полей соотв типа-записи
  vrec = v.data as ValueRecord
  Ctx12 = (type : *Type, new_vm : Map)
  ctx = (type=t) to Var Ctx12
  prep = MapForeachHandler {
    id = k to Str
    val = v to *Value
    c = ctx to *Ctx12
    field = type_record_get_field(c.type, id)
    assert(field!=nil, "do_value_cast_gen_rec field=nil")
    vx = implicit_cast (val, field.type)
    map_append (&c.new_vm, id, vx)
  }
  map_foreach(&(vrec.values to Var List), prep, &ctx)

  return value_new ((type=t, values=ctx.new_vm, ti=ti) to ValueRecord, t, ti)
}


// приведение к Var <T> типу приводит значение к типу <T>
// после чего создает переменную и сохраняет в нее полученное значение
// результатом является новая инициализированная переменная
do_value_cast_to_var = DoValueCast {

  init_value = cast (v, t.var.of, ti)

  varname = get_name_var ()  // один как на глобальные так и локальные!!??

  ast_id = (str=varname, ti=ti) to Var AstId


  create_global_var = (id : *AstId, t : *Type, init_value : *Value, ti : *TokenInfo) -> *Value {
    // создадим фейковый value который будет занесен в индекс
    // и будет ссылаться на переменную (просто нести тот же id)
    def = asmVarAdd (&asm0, id.str, t, init_value)
    v = value_new ((type=t, def=def, ti=id.ti) to ValueGlobalVar, t, id.ti)
    valbind (id.str, v)
    return v
  }

  create_local_var = (id : *AstId, t : *Type, init_value : *Value, ti : *TokenInfo) -> *Value {
    // добавляем в код функции стейтмент с определением этой переменной
    vd = stmt_new_vardef(id, t, init_value, nil)
    list_append(&fctx.cblock.stmts, vd)

    no = (*vd as StmtVarDef).no

    // создадим value который будет ссылаться на переменную (просто нести тот же id)
    v = value_new ((type=t, no=no, ti=ti) to ValueLocalVar, t, ti)
    valbind (id.str, v)
    return v
  }

  return when fctx {
    nil  => create_global_var (&ast_id, t, init_value, ti)
    else => create_local_var  (&ast_id, t, init_value, ti)
  }

fail:
  return value_new_poison (ti)
}


do_value_cast = (x : AstValueCast) -> *Value {
  v = do_value (x.value)
  t = do_type (x.type)

  if v.data is ValuePoison {goto fail}
  if t.kind == #TypePoison {goto fail}

  ti = x.ti

  // приведение к собственному типу не имеет смысла
  if type_eq (v.type, t) {
    warning ("cast to same type", ti)
    return v
  }

  // приведение к типу Var порождает новую переменную
  if t.kind == #TypeVar {
    return do_value_cast_to_var(v, t, ti)
  }

  // выполняем явное (принудительное) приведение типа значения
  return when v.type.kind {
    //#TypeUndefined => nil to *Value
    #TypeVar       => do_value_cast_var   (v, t, ti)
    #TypeBool      => do_value_cast_bool  (v, t, ti)
    #TypeGenericReference => do_value_cast_ref (v, t, ti)
    #TypeGenericRecord => do_value_cast_gen_rec (v, t, ti)
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

fail:
  return value_new_poison (x.ti)
}



value_union_type_check = (value : *AstValue, type : *AstType, logic : Bool, ti : *TokenInfo) -> *Value {
  v = do_value (value)
  t = do_type (type)

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

  return value_new ((type=typeBool, value=v, variant=variant, logic=logic, ti=ti) to ValueIs, typeBool, ti)

fail:
  return value_new_poison (ti)
}

do_value_is = (x : AstValueIs) -> *Value {
  return value_union_type_check (x.value, x.type, true, x.ti)
}

do_value_isnt = (x : AstValueIsnt) -> *Value {
  return value_union_type_check (x.value, x.type, false, x.ti)
}





do_value_as = (x : AstValueAs) -> *Value {
  v = do_value (x.value)
  t = do_type (x.type)
  ti = x.ti

  if v.data is ValuePoison {goto fail}
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



do_value_sizeof = (x : AstValueSizeof) -> *Value {
  t = do_type (x.type)

  if t.kind == #TypePoison {goto fail}

  if t.kind == #TypeUndefined {
    error ("sizeof unknown type", x.ti)
    return value_new_poison (x.ti)
  }

  return value_new_imm (typeNumeric, t.size to Int64, x.ti)

fail:
  return value_new_poison (x.ti)
}


do_value_alignof = (x : AstValueAlignof) -> *Value {
  t = do_type (x.type)

  if t.kind == #TypePoison {goto fail}

  if t.kind == #TypeUndefined {
    error ("alignof unknown type", x.ti)
    return value_new_poison (x.ti)
  }

  return value_new_imm (typeNumeric, t.size to Int64, x.ti)

fail:
  return value_new_poison (x.ti)
}


do_value_named = (x : AstValueName) -> *Value {
  id = x.id.str
  v = valget (id)

  if v is Unit {
    error ("unknown value7\n", x.ti)
    nv = value_new_poison (x.ti)
    //bind_value(&module.public, id, nv)
    //bind_value(&module.undef, id, nv)
    //info("create #ValueUndefined in module.undef", ti)
    return nv
  }

  vx = v as *Value

  // ЭТО НЕВЕРНО. по хорошему тут должно создаваться значение-упоминание
  // но поскольку у нас есть ValueUndefined мы не можем создавать упоминания...
  // как то надо решить хз когда и как
  vx.ti := x.ti

  return vx
}


do_value_numeric = (x : AstValueNumber) -> *Value {
  str = x.string
  d = 0 to Var Int64
  if str[0] == "0"[0] and str[1] == "x"[0] {
    sscanf (&str[2], "%llx", &d)
  } else {
    sscanf (&str[0], "%lld", &d)
  }

  return value_new_imm (typeNumeric, d, x.ti)
}


do_value_string = (x : AstValueString) -> *Value {
  s = x.string
  len = strlen (s) + 1
  typ = type_pointer_new (type_array_new (typeChar, len, x.ti), x.ti)
  id = get_name_str ()
  def = asmStringAdd (&asm0, id, s, len)

  return value_new ((type=typ, def=def, ti=x.ti) to ValueGlobalConst, typ, x.ti)
}


fuid = 0 to Var Nat
// портал из мира Value в мир Stmt
do_value_func = (x : AstValueFunc) -> *Value {
  t = do_type (x.type)

  if t.kind == #TypePoison {goto fail}

  old_nocnt = nocnt
  nocnt := 0 // !сбрасываем id локальных имен

  // get func 'name'
  fuid := fuid + 1
  uid = get_suid ("func", fuid)

  if x.block_stmt is Unit {
    def = asmFuncAdd (&asm0, uid, t, #NoBlock)
    return value_new ((type=t, def=def, ti=x.ti) to ValueGlobalConst, t, x.ti)
  }

  block = x.block_stmt

  if block is Unit {goto fail}

  fv = value_new (#ValueNo, t, x.ti)

  // we're in func?
  // add current func to parant func local_funcs list
  if fctx != nil {
    list_append (&fctx.local_funcs, fv)
  }

  // save global func context
  old_fctx = fctx

  // create new func context
  fctx := malloc (sizeof FuncContext) to *FuncContext
  memset (fctx, 0, sizeof FuncContext)

  list_init (&fctx.local_funcs)

  fctx.id := when old_fctx {
    nil => uid
    else => cat3 (old_fctx.id, "_", uid)
  }

  // set current block ^^ (after add to parent)
  fctx.cblock := nil
  fctx.cfunc := fv

  // SET FUNCTION CONTEXT
  // пока родитель контекста любой функции - контекст модуля
  // (это сделано для работы вложенных функций)
  old_cctx = cctx
  context_init (&fctx.ctx, &module.ctx)
  cctx := &fctx.ctx

  // праметры попадают в контекст FuncContext#ctx
  getparam = ListForeachHandler {
    decl = data to *Decl
    param_value = value_new ((type=decl.type, no=decl.offset to Nat32, ti=decl.ti) to ValueParam, decl.type, decl.ti)
    valbind_local (decl.id.str, param_value)
  }
  list_foreach (t.func.from.record.decls, getparam, nil)


  // DO FUNCTION BLOCK
  bx0 = do_stmt (block as *AstStmt)


  if bx0 is Unit {goto fail}
  bx = *(bx0 as *Stmt)

  def = asmFuncAdd (&asm0, uid, t, bx as StmtBlock)

  fv.data := (type=t, def=def, ti=x.ti) to ValueGlobalConst

  cctx := old_cctx
  fctx := old_fctx  // restore func context before exit

  nocnt := old_nocnt

  return fv

fail:
  cctx := old_cctx
  fctx := old_fctx  // restore func context before exit
  return value_new_poison (x.ti)
}


do_value_array = (x : AstValueArray) -> *Value {
  //fatal("do_value_array")
  Ctx11 = (items : List, item_type : *Type or Unit)
  ctx = 0 to Var Ctx11
  ctx.item_type := unit
  list_init(&ctx.items)

  handle_list_item = ListForeachHandler {
    val = data to *AstValue
    c = ctx to *Ctx11
    v = do_value(val)

    if v.data is ValuePoison {return}

    vx = 0 to Var *Value
    if c.item_type is Unit {
      vx := implicit_cast_int (v)
      c.item_type := vx.type
    } else {
      vx := implicit_cast (v, c.item_type as *Type)
      type_check (c.item_type as *Type, vx.type, vx.ti)
    }
    list_append (&c.items, vx)
  }
  list_foreach(&(x to Var AstValueArray).items, handle_list_item, &ctx)

  item_type = ctx.item_type as *Type
  arr_type = type_array_new (item_type, ctx.items.volume to Nat32, x.ti)

  id = get_name_arr ()
  def = asmArrayAdd (&asm0, id, arr_type, ctx.items)

  return value_new ((type=arr_type, def=def, ti=x.ti) to ValueGlobalConst, arr_type, x.ti)

fail:
  return value_new_poison (x.ti)
}


do_value_record = (x : AstValueRecord) -> *Value {
  ti = &ctok().ti
  Ctx9 = (type : *Type, vl : Map)

  t = type_new (#TypeGenericRecord, (ti=ti) to TypeGenericRecord, 0, ti)
  t.record.decls := list_new()  // TODO сделай потом лист просто без ню чтобы

  ctx = (type=t) to Var Ctx9

  // обрабатываем все поля
  field_value_handle = MapForeachHandler {
    field_id = k to Str
    field_ast_val = v to *AstValue
    c = ctx to *Ctx9
    v = do_value (field_ast_val)

    // создаем поле для #TypeGenericRecord типа
    // убери отсюда мап тк нужно не просто строку id давать а AstId
    // а так как сейчас у тебя теряется ti! (но пока так)
    // оч хреново - тут нет ti нигде
    ast_id = malloc(sizeof AstId) to *AstId
    *ast_id := (str=field_id, ti=nil)
    f = type_record_field_new(ast_id, v.type, nil)
    list_append(c.type.record.decls, f)
    // получили поле, на его основе строим поля для Generic типа
    map_append(&c.vl, field_id, v)
  }
  map_foreach(&(x.values to Var Map), field_value_handle, &ctx)

  return value_new ((type=t, values=ctx.vl) to ValueGenericRecord, t, x.ti)

fail:
  return value_new_poison (x.ti)
}


do_value_plus = (x : AstValuePlus) -> *Value {
  v = do_value (x.value)

  if v.data is ValuePoison {goto fail}

  if is_value_imm_num(v) {
    val = (v.data as ValueImm).value
    return value_new_imm (v.type, val, x.ti)
  }

  return value_new ((type=v.type, value=v, ti=x.ti) to ValuePlus, v.type, x.ti)

fail:
  return value_new_poison (x.ti)
}


do_value_minus = (x : AstValueMinus) -> *Value {
  v = do_value (x.value)

  if v.data is ValuePoison {goto fail}

  if is_value_imm_num(v) {
    val = (v.data as ValueImm).value
    return value_new_imm (v.type, -val, x.ti)
  }

  return value_new ((type=v.type, value=v, ti=x.ti) to ValueMinus, v.type, x.ti)

fail:
  return value_new_poison (x.ti)
}


do_value_not = (x : AstValueNot) -> *Value {
  v = do_value (x.value)

  if v.data is ValuePoison {goto fail}

  if is_value_imm_num(v) {
    val = (v.data as ValueImm).value
    return value_new_imm (v.type, not val, x.ti)
  }

  return value_new ((type=v.type, value=v, ti=x.ti) to ValueNot, v.type, x.ti)

fail:
  return value_new_poison (x.ti)
}


// shl, shr слишком отличны чтобы входить в bin
do_value_shift = (k : ValueKind, left, right : *AstValue, ti : *TokenInfo) -> *Value {
  l = do_value (left)
  r = do_value (right)

  if l.data is ValuePoison {goto fail}
  if r.data is ValuePoison {goto fail}


  // свертка констант
  if is_value_imm_num(l) and is_value_imm_num(r) {

    limm = (l.data as ValueImm).value
    rimm = (r.data as ValueImm).value
    d = when k {
      #ValueShl => limm << rimm
      else => limm >> rimm
    }

    return value_new_imm (l.type, d, ti)
  }

  l2 = implicit_cast_int (l)

  // (!) LLVM требует чтобы типы левого и правого в шифтах были одинаковы,
  // что глупо но.. поэтому приводим правое к левому
  r2 = cast (r, l.type, r.ti)

  t = l.type

  return when k {
    #ValueShl => value_new ((type=t, left=l2, right=r2, ti=ti) to ValueShl, t, ti)
    #ValueShr => value_new ((type=t, left=l2, right=r2, ti=ti) to ValueShr, t, ti)
    else => value_new_poison(ti)
  }

fail:
  return value_new_poison (ti)
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





exist generic_rec_cast_possible : (t_gen, t : *Type) -> Bool





cast = (vx : *Value, t : *Type, ti : *TokenInfo) -> *Value {
  if vx.data is ValuePoison {goto fail}
  if t.kind == #TypePoison {goto fail}

  // приведение к собственному типу бессмыслено
  if type_eq (vx.type, t) {return vx}


  // приведение подтипа к Union-надтипу
  if t.kind == #TypeUnion {
    goto sact
    error("приведение юнион", ti)
    return value_new_poison (ti)
  }

  // приведение #TypeGenericRecord к Rec
  if vx.type.kind == #TypeGenericRecord and t.kind == #TypeRecord {
    if not generic_rec_cast_possible (vx.type, t) {
      error("type error", ti)
    }

    return do_value_cast_gen_rec(vx, t, ti)
  }

  // можем ли мы приводить непосредственно значение v к типу t ?
  immCastIsPossible = (v : *Value, t : *Type) -> Bool {
    return is_value_imm_num(v)  // STUB
  }

  // creating new imm value with target type
  if immCastIsPossible (vx, t) {
    val = (vx.data as ValueImm).value
    return value_new_imm (t, val, ti)
  }


  // во всех остальных случаях выполняем runtime приведение
sact:
  return value_new ((type=t, value=vx, ti=ti) to ValueCast, t, ti)

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
    true => value_new_imm (typeBaseInt, (v.data as ValueImm).value, v.ti)
    else => v
  }
}


generic_rec_cast_possible = (t_gen, t : *Type) -> Bool {
  // если приводим не к структуре то пока!
  if t.kind != #TypeRecord {
    return false
  }

  // в Generic не должно быть больше полей чем в реальной структуре
  if t_gen.record.decls.volume > t.record.decls.volume {
    return false
  }


  // проверяем если имена и типы полей в дженерике соотв
  // именам и типам в типе к которому приводим значит можно приводить
  chk = ListSearchHandler {
    f = data to *Decl
    t = ctx to *Type

    // сперва ищем такое поле
    fd = type_record_get_field(t, f.id.str)
    if fd == nil {return true}  // нет такого поля, приехали

    // при сравнении полей нам нужно сделать implicit_cast! а как?

    // равны ли типы?
    if not type_eq(f.type, fd.type) {

      // может тут просто дженерик интеджер?
      if type_is_generic_num(f.type) and type_is_basic_integer(fd.type) {
        return false  // да, все ок, продолжаем
      }

      // или nil а ожидается указатель
      if f.type.kind == #TypeGenericReference and type_is_ref(fd.type) {
        return false  //
      }

      // может это юнион - смотрим можем ли привести к нему
      if fd.type.kind == #TypeUnion {
        return not type_present_in_list (&fd.type.union.types, t)
      }

      // или это Generic Record - если ожидаем Record попробуем привести
      // дженерик к нашему рекорд.
      if f.type.kind == #TypeGenericRecord {
        return not generic_rec_cast_possible(f.type, fd.type)
      }

      return true  // типы не равны, до свиданья
    }

    // и поле с таким id есть и типы совпадают,
    // продолжаем поиск несоответствия полей
    return false
  }
  res = list_search(t_gen.record.decls, chk, t)

  return res == nil
}


// неявное преобразование значения к заданному типу
// или просто возвращает значение без преобразования (когда оно невозможно)
implicit_cast = (v : *Value, t : *Type) -> *Value {
  assert (v.type != nil, "implicit_cast::v.type == nil")
  assert (t != nil, "implicit_cast::t == nil")

  if v.data is ValuePoison {return v}
  if t.kind == #TypePoison {goto fail}


  if v.type.kind == #TypeGenericReference and type_is_ref(t) {
    xx = do_value_cast_ref (v, t, v.ti)
    return xx
  }

  // GenericRecord -> Record
  if v.data is ValueGenericRecord {
    if not generic_rec_cast_possible (v.type, t) {
      return v
    }

    return do_value_cast_gen_rec (v, t, v.ti)
  }

  // TypeNumeric -> Basic:Integer
  if is_value_imm_num(v) {
    if type_is_generic_num (v.type) and type_is_basic_integer (t) {
      // проверяем если константа вписывается в размер типа

      val = (v.data as ValueImm).value

      if 1 to Nat128 << t.num.power <= val to Nat128 {
        error ("type overflow", v.ti)
      }

      return value_new_imm (t, val, v.ti)
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

  if type_is_generic_num(a) and type_is_basic_integer(b) {
    return true
  }

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





// испольуется в assign
value_is_readonly = (v : *Value) -> Bool {
  if v.type.kind == #TypeVar {return false}

  d = v.data

  if d is ValueIndex {
    i = d as ValueIndex
    def_arr = typeIsDefinedArray (i.array.type)
    return value_is_readonly (i.array) and def_arr
  }

  if d is ValueAccess {
    a = d as ValueAccess
    return value_is_readonly (a.value) and a.value.type.kind != #TypePointer
  }

  // это неправильно - тк операции тоже readonly!
  // todo: какая то херня с приоритетом is - пофикси как будет время
  return (d is ValueGlobalConst) or
         (d is ValueImm) or
         (d is ValueLocalVal) or
         (d is ValueParam)
}



// create global values: True, False, nil, etc.
value_init = () -> () {
  // false
  _false = value_new_imm (typeBool, 0, nil)
  valbind ("false", _false)

  // true
  _true = value_new_imm (typeBool, 1, nil)
  valbind ("true", _true)

  // nil
  nil_type = type_new(#TypeGenericReference, (ti=nil) to TypeGenericReference, cfgPointerSize, nil)
  _nil = value_new_imm (nil_type, 0, nil)
  valbind ("nil", _nil)

  // unit
  _unit = value_new_imm (typeUnit, 0, nil)
  valbind ("unit", _unit)

  // unit2
  /*unit_value_items = unit to Var List
  list_init(&unit_value_items)
  _unit2 = value_new ((type=typeUnit, values=unit_value_items, ti=nil) to ValueRecord, typeUnit, nil)
  valbind ("unit2", _unit2)*/
}



value_type_get = (x : Value) -> *Type {
  xx = x.data
  return when xx {
    ValueImm         => (xx as ValueImm).type
    ValueGlobalConst => (xx as ValueGlobalConst).type
    ValueGlobalVar   => (xx as ValueGlobalVar).type
    ValueLocalVal    => (xx as ValueLocalVal).type
    ValueLocalVar    => (xx as ValueLocalVar).type
    ValueParam       => (xx as ValueParam).type

    ValueAdd         => (xx as ValueAdd).type
    ValueSub         => (xx as ValueSub).type
    ValueMul         => (xx as ValueMul).type
    ValueDiv         => (xx as ValueDiv).type
    ValueMod         => (xx as ValueMod).type
    ValueAnd         => (xx as ValueAnd).type
    ValueOr          => (xx as ValueOr).type
    ValueXor         => (xx as ValueXor).type
    ValueEq          => (xx as ValueEq).type
    ValueNe          => (xx as ValueNe).type
    ValueLt          => (xx as ValueLt).type
    ValueGt          => (xx as ValueGt).type
    ValueLe          => (xx as ValueLe).type
    ValueGe          => (xx as ValueGe).type
    ValueShl         => (xx as ValueShl).type
    ValueShr         => (xx as ValueShr).type

    ValueCall   => (xx as ValueCall).type
    ValueIndex  => (xx as ValueIndex).type
    ValueAccess => (xx as ValueAccess).type
    ValueRef    => (xx as ValueRef).type
    ValueDeref  => (xx as ValueDeref).type
    ValueMinus  => (xx as ValueMinus).type
    ValuePlus   => (xx as ValuePlus).type
    ValueNot    => (xx as ValueNot).type
    ValueCast   => (xx as ValueCast).type
    ValueAs     => (xx as ValueAs).type
    ValueIs     => (xx as ValueIs).type
    ValueWhen   => (xx as ValueWhen).type
    ValueRecord => (xx as ValueRecord).type
    ValueArray  => (xx as ValueArray).type

    else => type_new (#TypePoison, (ti=x.ti) to TypePoison, 0, nil)
  }
}
