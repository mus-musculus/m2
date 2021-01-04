/*****************************************************************************/
/*                                 LLVM                                      */
/*****************************************************************************/

import "C"
import "assert"
import "str"
import "data/node"
import "data/list"
import "data/map"

import "types"
import "proto"


/*****************************************************************************/
/*                               Assembly                                    */
/*****************************************************************************/


asm_init = (a : *Assembly, arch : Arch, name : Str) -> () {
  a.name := name

  select arch {
    #Arch-x64 => func (a : *Assembly) -> () {
      a.datalayout := "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
      a.triple := "x86_64-apple-macosx10.15.0"
    } (a)

    #Arch-ARM-CM3 => func (a : *Assembly) -> () {
      a.datalayout := "e-m:e-p:32:32-i64:64-v128:64:128-a:0:32-n32-S64"
      a.triple := "thumbv7em-unknown-none-eabi"
    } (a)

    else => func (a : *Assembly) -> () {a.datalayout := nil; a.triple := nil} (a)
  }
}


definition_new = (kind : DefinitionKind, id : Str) -> *Definition {
  x = malloc(sizeof Definition) to *Definition
  assert(x != nil, "assembly::definition_new : x != nil")
  memset(x, 0, sizeof Definition)
  x.kind := kind
  x.id := id
  return x
}


asmTypedefAdd = (a : *Assembly, id : Str, t : *Type) -> *Definition {
  x = definition_new(#DefType, id)
  x.typedef.type := t
  list_append(&a.types, x)
  return x
}


asmStringAdd = (a : *Assembly, id : Str, s : Str, len : Nat) -> *Definition {
  x = definition_new(#DefStr, id)
  x.stringdef.data := s
  x.stringdef.len := len
  list_append(&a.strings, x)
  return x
}


asmArrayAdd = (a : *Assembly, id : Str, t : *Type, values : *List) -> *Definition {
  x = definition_new(#DefArray, id)
  x.arraydef.type := t
  x.arraydef.values := values
  list_append(&a.arrays, x)
  return x
}


asmFuncAdd = (a : *Assembly, id : Str, t : *Type, b : *Block) -> *Definition {
  x = definition_new(#DefFunc, id)
  x.funcdef.type := t
  x.funcdef.block := b
  list_append(&a.funcs, x)
  return x
}


asmVarAdd = (a : *Assembly, id : Str, t : *Type, init_value : *Value) -> *Definition {
  x = definition_new(#DefVar, id)
  x.vardef.init_value := init_value
  x.vardef.type := t
  list_append(&a.vars, x)
  return x
}


asmAliasAdd = (a : *Assembly, id : Str, type : *Type, org : Str) -> *Definition {
  x = definition_new(#DefAlias, id)
  x.aliasdef.id := id
  x.aliasdef.type := type
  x.aliasdef.org := org
  list_append(&a.aliases, x)
  return x
}









fout = nil to Var *FILE  // output file


o = (s : Str) -> () {fprintf(fout, "%s", s)}
ol = (s : Str) -> () {fprintf(fout, "\n%s", s)}
nl = () -> () {o("\n")}
space = () -> () {o(" ")}
comma = () -> () {o(", ")}


clab = 0 to Var Nat32  // current label (lab_get, lab_reset)


lab_reset = (val : Nat32) -> () {clab := val}

lab_get = () -> Nat32 {
  lab = clab
  clab := clab + 1
  return lab
}


// m2/prn/main


global_if_id = 0 to Var Nat32
global_while_id = 0 to Var Nat32
while_id = 0 to Var Nat32

blockno = 0 to Var Nat32
stmtno = 0 to Var Nat32  // just number of statement in func (for comment ;stmt%d)

select_no = 0 to Var Nat


print_assembly = (a: *Assembly, fname : Str) -> () {
  printf("print_assembly: %s\n", a.name)

  fout := fopen(fname, "w")

  if fout == nil {
    fatal("cannot create output file")
  }

  fprintf(fout, "; assembly: %s\n", a.name)

  ol("; clang out2.ll && ./a.out")
  ol("; llc out2.ll ; for create .s file from .ll")

  nl()

  if a.datalayout != nil {fprintf(fout, "target datalayout = \"%s\"", a.datalayout)}
  if a.triple != nil {fprintf(fout, "target triple = \"%s\"", a.triple)}

  nl()

  ol("%Bool = type i1")
  ol("%Unit = type {}")
  ol("%Str = type i8*")
  ol("%Numeric = type i64")

  prt_itype = MapForeachHandler {
    tid = k to Str
    t = v to *Type
    if type_is_basic_integer(t) {
      fprintf(fout, "\n%%%s = type i%d", tid, t.num.power)
    }
  }
  map_foreach(&builtinIndex.types, prt_itype, nil)

  nl()

//  list_init(&md_list)

  // print Types
  o("\n\n;types:\n")
  foreach_typedef = ListForeachHandler {
    ai = data to *Definition
    td = &ai.typedef
    typedef(ai.id, td.type)
  }
  list_foreach(&a.types, foreach_typedef, nil)

  // print Strings
  o("\n\n;strings:\n")
  foreach_stringdef = ListForeachHandler {
    ai = data to *Definition
    sd = &ai.stringdef
    stringdef(ai.id, sd.len, sd.data)
  }
  list_foreach(&a.strings, foreach_stringdef, nil)

  // print Arrays
  o("\n\n;arrays:\n")
  foreach_arraydef = ListForeachHandler {
    ai = data to *Definition
    ad = &ai.arraydef
    arraydef(ai.id, ad.type, ad.values)
  }
  list_foreach(&a.arrays, foreach_arraydef, nil)

  // print Variables
  o("\n\n;vars:\n")
  foreach_vardef = ListForeachHandler {
    ai = data to *Definition
    vd = &ai.vardef
    vardef(ai.id, vd.type, vd.init_value)
  }
  list_foreach(&a.vars, foreach_vardef, nil)

  // print Functions
  o("\n\n;funcs:\n")
  foreach_funcdef = ListForeachHandler {
    ai = data to *Definition
    fd = &ai.funcdef
    funcdef(ai.id, fd.type, fd.block)
  }
  list_foreach(&a.funcs, foreach_funcdef, nil)

  // print Aliases
  o("\n\n;aliases:\n")
  foreach_aliasdef = ListForeachHandler {
    ai = data to *Definition
    ad = &ai.aliasdef
    aliasdef(ai.id, ad.type, ad.org)
  }
  list_foreach(&a.aliases, foreach_aliasdef, nil)

  // print Metadata
  o("\n\n;metadata:\n")
  //print_metadata_list(&md_list)
}



/*
print_type_index = (index : *Map) -> () {
  fprintf(fout, "\n;type_index:\n")
  tshow = (k : *Unit, v : *Unit, ctx : *Unit) -> () {
    fprintf(fout, ";* %s -> %p\n", k to Str, v)
  }
  map_foreach(index, tshow, nil)
}


// печатаем листинг локального индекса в комментах LLVM
print_value_index = (index : *Map) -> () {
  fprintf(fout, "\n;value_index:\n")
  vshow = (k : *Unit, v : *Unit, ctx : *Unit) -> () {
    vv = v to *Value
    fprintf(fout, "\n;#%s -> %p {", k, vv);
    fprintf(fout, "\n;  v.kind = %s", print_value_kind(vv.kind))
    fprintf(fout, "\n;}\n")
  }
  map_foreach(index, vshow, nil)
}
*/


typedef = (id : Str, t : *Type) -> () {
  fprintf(fout, "\n%%%s = type ", id)
  printTypeSpec(t, false /*print_alias*/, true /*func_as_ptr*/)
}


arraydef = (id : Str, t : *Type, items : *List) -> () {
  //@arr = global [4 x i32] [i32 1, i32 2, i32 3, i32 4], align 16
  fprintf(fout, "\n@%s = private unnamed_addr constant ", id)
  printType(t)

  o(" [")
  print_array_item = ListForeachHandler {
    if index > 0 {comma()}
    v = data to *Value
    ev = eval(v)
    print_val_with_type(ev)
  }
  list_foreach(items, print_array_item, nil)
  o("], align 16")
}


/*
@.str = private unnamed_addr constant [4 x i8] c"XXX\00", align 1
@s = constant i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), align 8, !dbg !0
*/
stringdef = (id : Str, len : Nat, s : Str) -> () {
  fprintf(fout, "\n@%s = private unnamed_addr constant [%d x i8] c\"", id, len)

  i = 0 to Var Nat32
  while true {
    c = s[i]
    i := i + 1
    if c == 0 {break}
    if c == "\n"[0] or  // line feed
       c == "\r"[0] or  // carriage return
       c == "\t"[0] or  // horizontal tab
       c == "\v"[0] or  // vertical tab
       c == "\a"[0] or  // bell
       c == "\b"[0] or  // backspace
       c == "\\"[0] or  // backslash
       c == "\""[0] {
      fprintf(fout, "\\%02X", c)
    } else {
      fprintf(fout, "%c", c)
    }
  }
  fprintf(fout, "\\%02d\", align 1", 0)
}


vardef = (id : Str, t : *Type, v : *Value) -> () {
  fprintf(fout, "\n@%s = global ", id)
  printType(t); space()

  // print initial value
  if v == nil {o("zeroinitializer"); return}

  ev = eval(v)
  if ev.kind != #LLVM_ValueImmediate {
    error("expected constant init value", v.ti)
    o("zeroinitializer")
    return
  }
  print_val(ev)
}


funcdef = (id : Str, t : *Type, b : *Block) -> () {
  // 0, 1, 2 - params; 3 - entry label, 4 - first free register
  params = t.func.from.record.decls
  firstlab = params.volume + (1 /*entry label*/)

  select_no := 0

  lab_reset(firstlab to Nat32)
  //lab_get()

  assert(t != nil, "prn/funcdef t = nil")

  if b == nil {
    o("\ndeclare")
    //if DEBUG {dbg(0)}
  } else {
    o("\n\ndefine")
  }

  space()

  isvoid = type_eq(t.func.to, typeUnit)

  if isvoid {
    o("void")
  } else {
    printType(t.func.to)
  }

  fprintf(fout, " @%s (", id)
  vf_print_param = ListForeachHandler {
    f = data to *Decl
    if index > 0 {comma()}
    printType(f.type)
  }
  list_foreach(params, vf_print_param, nil)
  if t.func.arghack {o(", ...")}
  o(")")

  if b != nil {
    //if DEBUG {dbg(0); space()}
  }

  if b != nil {
    o(" {")
    //reset_local_labels
    global_if_id := 0
    global_while_id := 0
    while_id := 0
    stmtno := 0
    blockno := 0

    print_block(b)
    if isvoid {o("\n  ret void")}
    o("\n}")
  }
}


aliasdef = (id : Str, t : *Type, org : Str) -> () {
  //@sss = alias i8*, i8** @_func4_str6
  //@main  = alias void (), void ()* @xxx
  fprintf(fout, "\n@%s = alias ", id)
  printTypeSpec(t, false /*print_alias*/, false /*func_as_ptr*/)
  comma()
  printTypeSpec(t, false /*print_alias*/, false /*func_as_ptr*/)
  fprintf(fout, "* @%s", org)
}


// m2/prn/expr


// create new val
llval_create = (k : LLVM_ValueKind, t : *Type, reg : Int64) -> LLVM_Value {
  o = 0 to Var LLVM_Value
  o.type := t
  o.kind := k
  o.reg := reg to Nat32
  o.id := nil
  o.imm := reg
  return o
}


llval_create_id = (k : LLVM_ValueKind, t : *Type, id : Str) -> LLVM_Value {
  o = 0 to Var LLVM_Value
  o.type := t
  o.kind := k
  o.id := id
  return o
}

llval_create_reg = (t : *Type, reg : Nat32) -> LLVM_Value {
  o = 0 to Var LLVM_Value
  o.kind := #LLVM_ValueRegister
  o.type := t
  o.reg := reg
  return o
}

llval_create_adr = (t : *Type, reg : Nat32) -> LLVM_Value {
  o = 0 to Var LLVM_Value
  o.kind := #LLVM_ValueAddress
  o.type := t
  o.reg := reg
  return o
}

operation_with_type = (op : Str, t : *Type) -> Nat {
  reg = lab_get()
  fprintf(fout, "\n  %%%d = %s ", reg, op); printType(t)
  return reg
}


// печатает начало для getelementptr inbounds
// после чего мы уже печатаем индексы
// первый индекс - это смещение от элемента на элемент (как с массивом)
// второй индекс - смещение внутри элемента
llvm_getelementptr = (ot : *Type, by : LLVM_Value) -> Nat {
  // %5 = getelementptr inbounds <ot>, <ot>* @by,
  reg = operation_with_type("getelementptr inbounds", ot)
  comma()
  printType(ot)
  o("* ")
  print_val(by)
  comma()
  return reg
}


llvm_extractvalue = (t : *Type, o : LLVM_Value, index : Nat) -> Nat {
  //%7 = extractvalue { i8*, i8* } %4, 0
  // %7 = extractvalue <t> <o>, <index>
  reg = operation_with_type("extractvalue", t)
  space()
  print_val(o)
  fprintf(fout, ", %u", index)
  return reg
}

// value evaluation
// Принимает на вход значение. Возвращает объект принтера
// Значения-операции вычисляются. Результатом может быть константа, имя, регистр или адрес.
// Имена и адреса нуждаются в дополнительной загрузке функцией load
// (только если это не lval)
eval = Eval {
  return select x.kind {
    #ValueImmediate => llval_create (#LLVM_ValueImmediate, x.type, x.imm)

    #ValueGlobalConst => llval_create_id (#LLVM_ValueGlobalConst, x.type, x.def.id)
    #ValueGlobalVar => llval_create_id (#LLVM_ValueGlobalVar, x.type, x.def.id)

    #ValueLocalConst => llval_create_reg (x.type, x.expr.reg)
    #ValueLocalVar => llval_create (#LLVM_ValueLocalVar, x.type, x.vardef.lab to Int64)
    #ValueParam => llval_create_reg (x.type, x.field.offset to Nat32)

    #ValueLoad   => load (eval (x.load))
    #ValueCall   => eval_call (x)
    #ValueIndex  => eval_index (x)
    #ValueAccess => eval_access (x)
    #ValueRef    => eval_ref (x)
    #ValueDeref  => eval_deref (x)
    #ValueMinus  => eval_minus (x)
    #ValuePlus   => eval_plus (x)
    #ValueNot    => eval_not (x)
    #ValueCast   => eval_cast (x)
    #ValueSelect => eval_select (x)

    #ValueUndefined => Eval {
      printf("error eval #ValueUndefined\n")
      exit(1)
      return 0 to Var LLVM_Value
    } (x)

    else => eval_bin (x)
  }
}


eval_call = Eval {
  // evaluate arguments values before printing call

  // context for evaluated & loaded arguments
  Arguments = (args : [maxArg]LLVM_Value, cnt : Nat16)

  args = 0 to Var Arguments
  args.cnt := 0

  eval_args = ListForeachHandler {
    arg = data to *Value
    args = ctx to *Arguments
    args.args[args.cnt] := eval(arg)
    args.cnt := args.cnt + 1
  }
  list_foreach(x.call.args, eval_args, &args)


  // eval & load function value
  f = eval(x.call.func)

  // print call

  o("\n  ")

  retval_reg = 0 to Var Nat32
  if not type_eq(f.type.func.to, typeUnit) {
    retval_reg := lab_get()
    fprintf(fout, "%%%d = ", retval_reg)
  }

  o("call ")
  printTypeSpec(f.type, false /*print_alias*/, false /*func_as_ptr*/)
  space()

  print_val(f)

  o(" (")
  c = 0 to Var Nat16
  while c < args.cnt {
    if c > 0 {comma()}
    print_val_with_type(args.args[c])
    c := c + 1
  }
  o(")")

  return llval_create_reg(x.type, retval_reg)
}


eval_index_uarray = (a, i : LLVM_Value) -> LLVM_Value {
  o("\n; eval index uarray")
  item_type = a.type.array_u.of

  //%1 = getelementptr inbounds [10 x i32], [10 x i32]* @a, i64 0, i64 1
  reg = llvm_getelementptr(item_type, a)
  print_val_with_type(i)

  return llval_create_adr (item_type, reg)
}



eval_index = Eval {
  a = eval(x.index.array)
  i = eval(x.index.index)

  if typeIsUndefinedArray(a.type) {
    return eval_index_uarray(a, i)
  }

  is_def_array_in_register = a.kind == #LLVM_ValueRegister and typeIsDefinedArray(a.type)

  // работа со значением-массивом в регистре
  // (при этом индекс должен быть константой!)
  index_is_imm = true
  if is_def_array_in_register and index_is_imm {
    reg = llvm_extractvalue(a.type, a, i.imm to Nat)
    return llval_create_reg(x.type, reg)
  }

  // оперделенный массив или указатель на определенный массив

  eval_index_array = (a, i : LLVM_Value) -> LLVM_Value {
    //%1 = getelementptr inbounds [10 x i32], [10 x i32]* @a, i64 0, i64 1
    o("\n; index array")
    // получаем тип массива (даже если получили указатель на массив)
    atype = nil to Var *Type  // type of ARRAY
    if a.type.kind == #TypeArray {
      atype := a.type
    } else if typeIsPointerToDefinedArray(a.type) {
      atype := a.type.pointer.to
    }

    reg = llvm_getelementptr(atype, a)
    o("i1 0, "); print_val_with_type(i)

    item_type = atype.array.of
    return llval_create_adr (item_type, reg)
  }

  return eval_index_array(a, i)
}


eval_access = Eval {
  s = eval(x.access.value) to Var LLVM_Value

  record_type = s.type to Var *Type
  if s.type.kind == #TypePointer {
    record_type := s.type.pointer.to
    s := load(s)
  }

  assert(x.access.field != nil, "print/expr:: x.field == nil\n")

  field = type_record_get_field(record_type, x.access.field)
  fieldno = field.offset

  is_record_in_register = s.kind == #LLVM_ValueRegister and s.type.kind == #TypeRecord

  // работа именно со значением в регистре
  if is_record_in_register {
    reg = llvm_extractvalue(record_type, s, fieldno to Nat)
    return llval_create_reg(x.type, reg)
  }

  // работа по ссылке на структуру

  reg = llvm_getelementptr(record_type, s)
  fprintf(fout, "i1 0, i32 %u", fieldno)

  return llval_create_adr (x.type, reg)
}


eval_ref = Eval {
  vx = eval(x.un.x)
  if vx.kind == #LLVM_ValueAddress {
    // если это адрес - вернем его в регистре, а тип обернем в указатель
    return llval_create_reg(x.type, vx.reg)
  }

  //%7 = getelementptr inbounds %Int32, %Int32* @a, i32 0
  reg = llvm_getelementptr(vx.type, vx); o("i1 0")

  return llval_create_reg(x.type, reg)
}


eval_deref = Eval {
  // eval & load pointer
  vx = eval(x.un.x)

  // return loaded pointer as #Address
  return llval_create_adr (x.type, vx.reg)
}


eval_not = Eval {
  vx = eval(x.un.x)

  //"%s = xor %s, -1"
  reg = operation_with_type("xor", vx.type)
  space()
  print_val(vx)
  if (type_eq(vx.type, typeBool)) {o(", 1")} else {o(", -1")}
  return llval_create_reg(vx.type, reg)
}


eval_minus = Eval {
  vx = eval(x.un.x)
  z = llval_create(#LLVM_ValueImmediate, typeBaseInt, 0)
  reg = llvm_binary ("sub nsw", z, vx, vx.type)
  return llval_create_reg(vx.type, reg)
}


eval_plus = Eval {return eval(x.un.x)}



llvm_cast = (k : Str, v : LLVM_Value, t : *Type) -> LLVM_Value {
  reg = operation_with_type(k, v.type)
  space()
  print_val(v)
  o(" to ")
  printType(t)
  return llval_create_reg(t, reg)
}

// тип семейства функций выполняющих приведение
// какого либо вида значений к некоторому типу
EvalCast = (v : LLVM_Value, t : *Type) -> LLVM_Value


eval_cast_to_ref = EvalCast {
  return select v.type.kind {
    #TypeNumeric => llvm_cast("inttoptr", v, t)  // Int -> Ref
    else => llvm_cast("bitcast", v, t)  // X -> Ref
  }
}


eval_cast_to_bool = EvalCast {
  // only Int can be casted to Bool
  return llvm_cast("trunc", v, t)
}



eval_cast_basic_to_basic = EvalCast {
  if v.type.num.power > t.num.power {
      return llvm_cast("trunc", v, t)    // INT -> int
    } else if v.type.num.power < t.num.power {
      if t.num.signed {
        return llvm_cast("sext", v, t)   // Int -> SIGNED_INT
      } else {
        return llvm_cast("zext", v, t)   // Int -> UNSIGNED_INT
      }
    } else {
      return llvm_cast("bitcast", v, t)  // Int -> Int
    }

  assert(false, "eval_cast_basic_to_basic")
  return llval_create(#LLVM_ValueInvalid, nil, 0)
}

eval_cast_enum_to_basic = EvalCast {
  // Enum -> Basic
  // вырази это через type base #todo а то дублируется
  if cfgEnumSize > t.num.power {
    return llvm_cast("trunc", v, t)    // power(v) > power(t)
  } else if cfgEnumSize < t.num.power {
    return llvm_cast("zext", v, t)     // power(v) < power(t)
  } else {
    return llvm_cast("bitcast", v, t)  // power(v) == power(t)
  }

  assert(false, "eval_cast_enum_to_basic")
  return llval_create(#LLVM_ValueInvalid, nil, 0)
}

eval_cast_to_basic = EvalCast {
  return select v.type.kind {
    #TypeNumeric => eval_cast_basic_to_basic (v, t)
    #TypePointer => llvm_cast ("ptrtoint", v, t)
    #TypeEnum => eval_cast_enum_to_basic (v, t)
    #TypeBool => llvm_cast ("zext", v, t)

    else => EvalCast {
      k = v.type.kind
      fprintf (fout, "\n<invalid k %d in cast>", k)
      printf ("e.type.kind = %d\n", k)
      assert (false, "eval_cast_to_basic")

      // #todo надо иметь возможность конструировать значения на месте
      return llval_create(#LLVM_ValueInvalid, nil, 0)
    } (v, t)
  }
}


eval_cast = Eval {
  v = eval(x.cast.value)
  t = x.cast.to

  if type_is_ref(t) {
    return eval_cast_to_ref (v, t)    // cast -> Ref
  } else if t.kind == #TypeBool {
    return eval_cast_to_bool (v, t)   // cast -> Bool
  } else if t.kind == #TypeNumeric {
    return eval_cast_to_basic (v, t)  // cast -> Basic
  } else if type_eq (t, typeUnit) {
    return llval_create(#LLVM_ValueEmpty, t, 0)  // cast -> ()
  }

  printf("eval_cast error:\n")
  warning("war", x.ti)
  prttype(v.type); printf(" --> "); prttype(t); printf("\n")
  return llval_create(#LLVM_ValueInvalid, t, 0)
}


llvm_binary = (op : Str, l, r : LLVM_Value, t : *Type) -> Nat {
  reg = operation_with_type(op, t)
  space()
  print_val(l)
  comma()
  print_val(r)
  return reg
}


eval_bin = Eval {
  l = eval(x.bin.l)
  r = eval(x.bin.r)

  // берем тип левого а не тип x тк у x может быть Bool тип (в случае отношений)!
  signed = l.type.num.signed

  op = select x.kind {
    #ValueAdd => "add" to Str
    #ValueSub => "sub" to Str
    #ValueMul => "mul" to Str
    #ValueDiv => (s : Bool) -> Str {if s {return "sdiv"}; return "udiv"} (signed)
    #ValueMod => (s : Bool) -> Str {if s {return "srem"}; return "urem"} (signed)

    #ValueOr => "or" to Str
    #ValueXor => "xor" to Str
    #ValueAnd => "and" to Str

    #ValueEq => "icmp eq" to Str
    #ValueNe => "icmp ne" to Str

    #ValueLt => (s : Bool) -> Str {if s {return "icmp slt"}; return "icmp ult"} (signed)
    #ValueGt => (s : Bool) -> Str {if s {return "icmp sgt"}; return "icmp ugt"} (signed)
    #ValueLe => (s : Bool) -> Str {if s {return "icmp sle"}; return "icmp ule"} (signed)
    #ValueGe => (s : Bool) -> Str {if s {return "icmp sge"}; return "icmp uge"} (signed)

    #ValueShl => "shl" to Str
    #ValueShr => (s : Bool) -> Str {if s {return "ashr"}; return "lshr"} (signed)

    else => "<unknown-binary-operation>" to Str
  }

  reg = llvm_binary(op, l, r, l.type)
  return llval_create_reg(x.type, reg)
}



loadImmAs = (x : LLVM_Value, t : *Type) -> LLVM_Value {
  return llvm_cast("bitcast", x, x.type)
}

loadImmPtr = (x : LLVM_Value) -> LLVM_Value {
  return llvm_cast("inttoptr", x, x.type)
}


loadIfImmAs = (x : LLVM_Value, t : *Type) -> LLVM_Value {
  return select x.kind {
    #LLVM_ValueImmediate => llvm_cast("bitcast", x, t)
    else => x
  }
}


/*
В общем суть проблемы вложенных select ов состоит в том,
что мы говорим что прыгаем в фи внешнего селекта из ок блока но в него вложены блоки
внутреннего селекта и прыгаем мы на самом деле из другого блока (из
блока внутреннего селекта)
*/

/*
check1:
  <eval key1>
  <check-key1 go_phi, go_check2>
check2:
  <eval key2>
  <check-key2 go_phi, go_check3>
check3:
  <eval key3>
  <check-key3 go_phi, go_default>
default:
  go_phi
*/

/*
// инструкция Фи возвращает значение в зависимости от того откуда
// мы пришли на нее - если из cond_false то это %X.1 ...
cond_next:
  %X.2 = phi i32 [ %X.1, %cond_false ], [ %X.0, %cond_true ]
*/
eval_select = Eval {
  sel = eval(x.select.x)

  select_no := select_no + 1
  sno = select_no

  n = x.select.variants.volume

  Ctx = (
    sel : LLVM_Value
    sno : Nat
    case : Nat
    regs : [maxSelectorEntry]Nat32
    type : *Type
  )

  ctx = 0 to Var Ctx
  ctx.sel := sel
  ctx.case := 0
  ctx.sno := sno
  typ = x.type
  // тип возврата оператора select
  // нужно для правильного приведения imm-констант значений селектора
  ctx.type := typ

  fprintf(fout, "\n  br label %%select_%d_0", sno)

  print_select_case = ListForeachHandler {
    va = data to *ValueSelectVariant
    c = ctx to *Ctx
    fprintf(fout, "\nselect_%d_%d:", c.sno, c.case)

    s0 = eval(va.x)

    reg = operation_with_type("icmp eq", s0.type)
    space()
    print_val(c.sel)
    comma()
    print_val(s0)

    fprintf(fout, "\n  br i1 %%%d", reg)

    fprintf(fout, ", label %%select_%d_%d_ok, label %%select_%d_%d", c.sno, c.case, c.sno, c.case + 1)

    fprintf(fout, "\nselect_%d_%d_ok:", c.sno, c.case)

    e = eval(va.y)
    s1 = loadIfImmAs(e, c.type)

    fprintf(fout, "\n  br label %%select_%d_end", c.sno)

    c.regs[index] := s1.reg  // сохраняем регистр для фи
    c.case := c.case + 1
  }
  list_foreach(&x.select.variants, print_select_case, &ctx)

  fprintf(fout, "\nselect_%d_%d:", sno, ctx.case) // else ->
  otherwise = loadIfImmAs(eval(x.select.other), ctx.type)
  fprintf(fout, "\n  br label %%select_%d_end", sno)
  fprintf(fout, "\nselect_%d_end:", sno)


  // если результат () то phi не печатаем
  if not type_eq(typ, typeUnit) {
    reg = operation_with_type("phi", typ)
    space()

    i = 0 to Var Nat64
    while i < n {
      fprintf(fout, "[ %%%d, %%select_%d_%d_ok ], ", ctx.regs[i], sno, i)
      i := i + 1
    }

    // otherwise case
    fprintf(fout, "[ %%%d, %%select_%d_%d ]", otherwise.reg, sno, ctx.case)

    return llval_create_reg(x.type, reg)
  }

  return llval_create(#LLVM_ValueInvalid, x.type, 0)
}



print_st = (l, r : *Value) -> () {
  lx = eval(l)
  rx = eval(r)
  llvm_st(lx, rx)
}


llvm_st = (lo, ro : LLVM_Value) -> () {
  rt = ro.type
  fprintf(fout, "\n  store ")
  printType(rt)
  space()
  print_val(ro)
  comma()
  printType(rt)
  o("* ")
  print_val(lo)
  fprintf(fout, ", align %d", rt.align)
}


// загрузка (если она необходима) значения вычисленного выражения
load = (x : LLVM_Value) -> LLVM_Value {
  k = x.kind

  if k == #LLVM_ValueInvalid {return x}


  // LLVM не умеет так ... i32* 12233445 - нужно привести int значение к типу
  // явной операцией inttoptr. Поэтому если нам попался указатель вида #ValueImmediate
  // то его нужно будет загрузить в регистр функцией inttoptr
  if k == #LLVM_ValueImmediate {
    if type_is_ref(x.type) {return loadImmPtr(x)}
    return x
  }

  // в загрузке нуждаются только значения с изменяемым классом памяти
  if k != #LLVM_ValueLocalVar and
     k != #LLVM_ValueGlobalVar and
     k != #LLVM_ValueAddress {
    return x
  }

  typ = x.type
  reg = operation_with_type("load", typ)
  comma()
  printType(typ)
  o("* ")
  print_val(x)
  return llval_create_reg(typ, reg)
}



print_val_imm = (x : LLVM_Value) -> Int {
  ot = x.type
  //is_var_ref = ot.kind == #TypeVar and type_is_ref(ot.var)
  is_ref = type_is_ref(ot) or ot.kind == #TypeRecord or ot.kind == #TypeArray

  // если печатаем 0 или nil в объявлении переменной
  if ot.kind == #TypeVar {
    of = ot.var.of
    if type_is_ref(of) or of.kind == #TypeRecord or of.kind == #TypeArray {
      fprintf(fout, "zeroinitializer")
      return 0
    }
  }

  if is_ref and x.imm == 0 {
    // если инициализируем структуру, то 0 превращается в zeroinitializer
    // тк LLVM не позволяет инициализировать простым нулем
    fprintf(fout, "zeroinitializer")
  } else {
    fprintf(fout, "%llu", x.imm)
  }
  return 0
}


// печать значения вычисленного выражения
print_val = (x : LLVM_Value) -> () {
  select x.kind {
    #LLVM_ValueImmediate   => print_val_imm (x)
    #LLVM_ValueRegister    => fprintf(fout, "%%%d", x.reg)
    #LLVM_ValueAddress     => fprintf(fout, "%%%d", x.reg)
    #LLVM_ValueGlobalVar   => fprintf(fout, "@%s", x.id)
    #LLVM_ValueGlobalConst => fprintf(fout, "@%s", x.id)
    #LLVM_ValueLocalVar    => fprintf(fout, "%%%d", x.reg)
    else => fprintf(fout, "<LLVM_ValueInvalid x.kind = %d>", x.kind)
  }
}


print_val_with_type = (x : LLVM_Value) -> () {
  printType(x.type)
  space()
  print_val(x)
}



//%agg1 = insertvalue {i32, float} undef, i32 1, 0  ; yields {i32 1, float undef}
create_array = (x : LLVM_Value) -> LLVM_Value {
  reg = operation_with_type("insertvalue", x.type)
  o(" undef, ")
  return llval_create_reg(x.type, reg)
}







print_stmt = (s : *Stmt) -> () {
  k = s.kind

  if k != #StmtBlock {
    fprintf(fout, "\n;stmt%d:", stmtno)
    stmtno := stmtno + 1
  }

  select k {
    #StmtBlock    => print_block(&s.b)
    #StmtExpr     => print_stmt_expr(&s.e)
    #StmtAssign   => print_st(s.a[0], s.a[1])
    #StmtVarDef   => print_stmt_var(s.v)
    #StmtIf       => print_stmt_if(&s.i)
    #StmtWhile    => print_stmt_while(&s.w)
    #StmtReturn   => print_stmt_return(s.a[0])
    #StmtBreak    => print_stmt_break()
    #StmtContinue => print_stmt_continue()
    #StmtGoto     => print_stmt_goto(s.l)
    #StmtLabel    => print_stmt_label(s.l)
    else => fprintf(fout, "<print::stmt_unknown>") to ()
  }
}


// Печать значения происходит в два этапа
// 1. eval - распечатывается алгоритм вычисления значения
// 2. print_val - печатается регистр в котором находится значение (уже вычисленное)
//                    или непосредственная константа (которая никак не вычисляется в LLVM)


print_stmt_var = (v : *Decl) -> () {
  reg = operation_with_type("alloca", v.type)
  v.lab := reg
  // initialization
  iv = v.init_value
  if iv != nil {
    init_value = eval(iv)
    lo = llval_create(#LLVM_ValueLocalVar, v.type, reg to Int64)
    llvm_st(lo, init_value)
  }
}


print_stmt_expr = (x : *Expr) -> () {
  o = eval(x.v)
  // Сохраняем номер регистра в котором результат вычисления выражения в Expr#reg.
  // Это нужно для того чтобы связанное значение вида ValueLocalConst (let)
  // могло быть связано с результатом этого значения через Value#expr.reg
  x.reg := o.reg
}


print_stmt_if = (x : *If) -> () {
  if_id = global_if_id
  global_if_id := global_if_id + 1
  c = eval(x.cond)
  fprintf(fout, "\n  br i1 ")
  print_val(c)
  fprintf(fout, ", label %%then_%d, label %%else_%d", if_id, if_id)
  fprintf(fout, "\nthen_%d:", if_id)
  print_stmt(x.then)
  fprintf(fout, "\n  br label %%endif_%d", if_id)
  fprintf(fout, "\nelse_%d:", if_id)
  if x.else != nil {print_stmt(x.else)}
  fprintf(fout, "\n  br label %%endif_%d", if_id)
  fprintf(fout, "\nendif_%d:", if_id)
}


print_stmt_while = (x : *While) -> () {
  old_while_id = while_id
  while_id := global_while_id
  global_while_id := global_while_id + 1
  fprintf(fout, "\n  br label %%continue_%d", while_id)
  fprintf(fout, "\ncontinue_%d:", while_id)
  c = eval(x.cond)
  fprintf(fout, "\n  br i1 ")
  print_val(c)
  fprintf(fout, ", label %%body_%d, label %%break_%d", while_id, while_id)
  fprintf(fout, "\nbody_%d:", while_id)
  print_stmt(x.stmt)
  fprintf(fout, "\n  br label %%continue_%d", while_id)
  fprintf(fout, "\nbreak_%d:", while_id)
  while_id := old_while_id
}


print_stmt_return = (v : *Value) -> () {
  if v == nil {
    lab_get()  // for LLVM
    o("\nret void")
    return
  }
  vx = eval(v)
  fprintf(fout, "\n  ret ")
  print_val_with_type(vx)
  lab_get()  // for LLVM
}


print_stmt_break = () -> () {
  lab_get()  // for LLVM
  fprintf(fout, "\n  br label %%break_%d", while_id)
}


print_stmt_continue = () -> () {
  lab_get()  // for LLVM
  fprintf(fout, "\n  br label %%continue_%d", while_id)
}


print_stmt_goto = (l : Str) -> () {
  lab_get()  // for LLVM
  fprintf(fout, "\n  br label %%%s", l)
}


print_stmt_label = (l : Str) -> () {
  fprintf(fout, "\n  br label %%%s", l)
  fprintf(fout, "\n%s:", l)
}


print_block = (b : *Block) -> () {
  for_stmt = ListForeachHandler {
    blockno := blockno + 1
    print_stmt(data to *Stmt)
  }
  list_foreach(&b.stmts, for_stmt, nil)
}





printTypeSpec = (t : *Type, print_alias, func_as_ptr : Bool) -> () {
  assert(t != nil, "prn/printType :: t = nil\n")

  if print_alias and t.aka != nil {
    fprintf(fout, "%%%s", t.aka)
    return
  }

  select t.kind {
    #TypeNumeric => fprintf(fout, "%%%s", t.aka) to ()
    #TypeVar => func (t : *Type) -> () {printType(t.var.of)} (t)
    #TypeEnum => printType(typeEnum)
    #TypeRecord => printTypeRecord(&t.record)
    #TypeArray => printTypeArray(&t.array)
    #TypeArrayU => printTypeArrayU(&t.array_u)
    #TypePointer => printTypePointer(&t.pointer)
    #TypeFunc => printTypeFunc(&t.func, func_as_ptr)
    #TypeBool => o("i1")
    else => (t : *Type) -> () {
      o("<type-unknown-kind>");
      printf("unk type kind %d\n", t.kind);
    } (t)
  }
}


printType = (t : *Type) -> () {printTypeSpec(t, true, true)}


printTypeRecord = (r : *TypeRecord) -> () {
  o("{")
  print_struct_field = ListForeachHandler {
    if index > 0 {comma()}
    f = data to *Decl
    printType(f.type)
  }
  list_foreach(r.decls, print_struct_field, nil)
  o("}")
}


printTypeArray = (a : *TypeArray) -> ()
{fprintf(fout, "[%d x ", a.volume); printType(a.of); o("]")}

printTypeArrayU = (a : *TypeArrayU) -> () {printType(a.of); o("*")}

printTypePointer = (p : *TypePointer) -> () {printType(p.to); o("*")}


printTypeFunc = (f : *TypeFunc, func_as_ptr : Bool) -> () {
  if type_eq(f.to, typeUnit) {
    o("void")
  } else {
    printType(f.to)
  }

  param_list = f.from.record.decls

  o(" (")
  pt_print_param = ListForeachHandler {
    if index > 0 {comma()}
    printType((data to *Decl).type)
  }
  list_foreach(param_list, pt_print_param, nil)
  if f.arghack {o(", ...")}
  o(")")
  if func_as_ptr {o("*")}
}



