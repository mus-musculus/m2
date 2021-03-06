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




LLVM_ValueKind = {
  #LLVM_ValueInvalid    // An error occurred while evaluation

  #LLVM_ValueUndef      // for llvm `undef` value
  #LLVM_ValueZero       // for llvm `zeroinitializer` value

  #LLVM_ValueEmpty      // Unit () 'value'

  #LLVM_ValueImmediate  // Numeric value in imm field

  /*
   * Global Immutable LLVM_Valueect used by name
   * such as funcs, strings, literal arrays & records
   */
  #LLVM_ValueGlobalConst

  // variables
  #LLVM_ValueLocalVar
  #LLVM_ValueGlobalVar

  // register
  #LLVM_ValueAddress    // address of value in register
  #LLVM_ValueRegister   // value in register
}


// Операнд - тип значения и его местоположение
// Является результатом вычисления
// Операнды Global, Local & Address нуждаются в загрузке (load)
// перед использованием справа (rval)
LLVM_Value = (
  kind : LLVM_ValueKind

  type : *Type

  imm  : Int64  // #LLVM_ValueImmediate
  id   : Str    // #LLVM_ValueGlobalConst, #LLVM_ValueGlobalVar
  reg  : Nat32  // #LLVM_ValueRegister, #LLVM_ValueAddress, #LLVM_ValueLocalVar
)


LLVM_ValueUndef = (undef : Bool)
LLVM_ValueZero = (zero : Bool)
LLVM_ValueEmpty = (empty : Bool)

LLVM_ValueById = (type : *Type, id : Str)
LLVM_ValueByReg = (type : *Type, reg : Nat32)

LLVM_ValueImmediate = NewType (type : *Type, imm : Int64)
LLVM_ValueGlobalConst = NewType LLVM_ValueById
LLVM_ValueGlobalVar = NewType LLVM_ValueById
LLVM_ValueLocalVar = NewType LLVM_ValueByReg
LLVM_ValueAddress = NewType LLVM_ValueByReg
LLVM_ValueRegister = NewType LLVM_ValueByReg

LLVM_Value2 = LLVM_ValueUndef or
              LLVM_ValueZero or
              LLVM_ValueEmpty or
              LLVM_ValueImmediate or
              LLVM_ValueGlobalConst or
              LLVM_ValueGlobalVar or
              LLVM_ValueLocalVar or
              LLVM_ValueAddress or
              LLVM_ValueRegister or
              LLVM_Value


exist loadImmAs : (x : LLVM_Value, t : *Type) -> LLVM_Value


/*****************************************************************************/
/*                               Assembly                                    */
/*****************************************************************************/


asm_init = (a : *Assembly, arch : Arch, name : Str) -> () {
  a.name := name

  when arch {
    #Arch-x64 => (a : *Assembly) -> () {
      a.datalayout := "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
      a.triple := "x86_64-apple-macosx10.15.0"
    } (a)

    #Arch-ARM-CM3 => (a : *Assembly) -> () {
      a.datalayout := "e-m:e-p:32:32-i64:64-v128:64:128-a:0:32-n32-S64"
      a.triple := "thumbv7em-unknown-none-eabi"
    } (a)

    else => (a : *Assembly) -> () {
      a.datalayout := ""
      a.triple := ""
    } (a)
  }
}


definition_new = (kind : DefinitionKind, id : Str) -> *Definition {
  x = malloc (sizeof Definition) to *Definition
  assert (x != nil, "assembly::definition_new : x != nil")
  memset (x, 0, sizeof Definition)
  x.kind := kind
  //x.id := id
  return x
}


asmTypedefAdd = (a : *Assembly, id : Str, t : *Type) -> *Definition {
  x = definition_new (#DefType, id)
  x.typedef := (id=id, type=t)
  list_append (&a.types, x)
  return x
}


asmStringAdd = (a : *Assembly, id : Str, s : Str, len : Nat) -> *Definition {
  x = definition_new (#DefStr, id)
  x.stringdef := (id=id, data=s, len=len)
  list_append (&a.strings, x)
  return x
}


asmArrayAdd = (a : *Assembly, id : Str, t : *Type, values : List) -> *Definition {
  x = definition_new (#DefArray, id)
  x.arraydef := (id=id, type=t, values=values)
  list_append (&a.arrays, x)
  return x
}


asmFuncAdd = (a : *Assembly, id : Str, t : *Type, b : MaybeBlock) -> *Definition {
  x = definition_new (#DefFunc, id)
  x.funcdef := (id=id, type=t, block=b)
  list_append (&a.funcs, x)
  return x
}


asmVarAdd = (a : *Assembly, id : Str, t : *Type, init_value : *Value) -> *Definition {
  x = definition_new (#DefVar, id)
  x.vardef := (id=id, type=t, init_value=init_value)
  list_append (&a.vars, x)
  return x
}


asmAliasAdd = (a : *Assembly, id : Str, type : *Type, org : Str) -> *Definition {
  x = definition_new (#DefAlias, id)
  x.aliasdef := (id=id, type=type, org=org)
  list_append (&a.aliases, x)
  return x
}






fout = nil to Var *FILE  // output file


o = (s : Str) -> () {fprintf (fout, "%s", s)}
ol = (s : Str) -> () {fprintf (fout, "\n%s", s)}
nl = () -> () {o ("\n")}
space = () -> () {o (" ")}
comma = () -> () {o (", ")}


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
  printf ("print_assembly: %s\n", a.name)

  fout := fopen (fname, "w")

  if fout == nil {
    fatal ("cannot create output file")
  }

  fprintf (fout, "; assembly: %s\n", a.name)

  ol ("; clang out2.ll && ./a.out")
  ol ("; llc out2.ll ; for create .s file from .ll")

  nl ()

  fprintf (fout, "target datalayout = \"%s\"\n", a.datalayout)
  fprintf (fout, "target triple = \"%s\"\n", a.triple)

  nl ()

  ol ("%Bool = type i1")
  ol ("%Unit = type i1")
  ol ("%Str = type i8*")
  ol ("%Numeric = type i64")

  prt_itype = MapForeachHandler {
    tid = k to Str
    t = v to *Type
    if type_is_basic_integer (t) {
      fprintf (fout, "\n%%%s = type i%d", tid, t.num.power)
    }
  }
  map_foreach (&builtinContext.index.types, prt_itype, nil)


  ol ("\n; aliases:")
  // печатаем алиасы типов (пока только юнионы)
  prt_alias = ListForeachHandler {
    t = data to *Type
    if t.union.impl != nil {
      fprintf (fout, "\n%%%s = type ", t.aka); printType(t.union.impl); o("\n")
    } else {
      fprintf (fout, "\n%%%s = type {i16, [%d x i8]}", t.aka, t.union.data_size); o("\n")
    }
  }
  list_foreach (&unions, prt_alias, nil)

  nl ()

//  list_init(&md_list)

  // print Types
  o ("\n\n;types:\n")
  foreach_typedef = ListForeachHandler {
    td = &(data to *Definition).typedef
    typedef (td.id, td.type)
  }
  list_foreach (&a.types, foreach_typedef, nil)

  // print Strings
  o ("\n\n;strings:\n")
  foreach_stringdef = ListForeachHandler {
    sd = &(data to *Definition).stringdef
    stringdef (sd.id, sd.len, sd.data)
  }
  list_foreach (&a.strings, foreach_stringdef, nil)

  // print Arrays
  o ("\n\n;arrays:\n")
  foreach_arraydef = ListForeachHandler {
    ad = &(data to *Definition).arraydef
    arraydef (ad.id, ad.type, &ad.values)
  }
  list_foreach (&a.arrays, foreach_arraydef, nil)

  // print Variables
  o ("\n\n;vars:\n")
  foreach_vardef = ListForeachHandler {
    vd = &(data to *Definition).vardef
    vardef (vd.id, vd.type, vd.init_value)
  }
  list_foreach (&a.vars, foreach_vardef, nil)

  // print Functions
  o ("\n\n;funcs:\n")
  foreach_funcdef = ListForeachHandler {
    fd = &(data to *Definition).funcdef
    funcdef (fd.id, fd.type, fd.block)
    /*if fd.block == nil {
      funcdef (fd.id, fd.type, #NoBlock)
    } else {
      funcdef (fd.id, fd.type, *fd.block)
    }*/
  }
  list_foreach (&a.funcs, foreach_funcdef, nil)

  // print Aliases
  o ("\n\n;aliases:\n")
  foreach_aliasdef = ListForeachHandler {
    ad = &(data to *Definition).aliasdef
    aliasdef (ad.id, ad.type, ad.org)
  }
  list_foreach (&a.aliases, foreach_aliasdef, nil)

  // print Metadata
  o ("\n\n;metadata:\n")
  //print_metadata_list(&md_list)
}



/*
print_type_index = (index : *Map) -> () {
  fprintf (fout, "\n;type_index:\n")
  tshow = (k : *Unit, v : *Unit, ctx : *Unit) -> () {
    fprintf (fout, ";* %s -> %p\n", k to Str, v)
  }
  map_foreach (index, tshow, nil)
}


// печатаем листинг локального индекса в комментах LLVM
print_value_index = (index : *Map) -> () {
  fprintf (fout, "\n;value_index:\n")
  vshow = (k : *Unit, v : *Unit, ctx : *Unit) -> () {
    vv = v to *Value
    fprintf (fout, "\n;#%s -> %p {", k, vv);
    fprintf (fout, "\n;  v.kind = %s", print_value_kind(vv.kind))
    fprintf (fout, "\n;}\n")
  }
  map_foreach (index, vshow, nil)
}
*/


exist operand : (t : *Type, k : LLVM_ValueKind, reg : Nat32) -> LLVM_Value





exist operation_with_type : (op : Str, t : *Type) -> Nat
exist llvm_binary : (op : Str, l, r : LLVM_Value) -> Nat
exist llvm_getelementptr : (by : LLVM_Value, item_type : *Type) -> Nat
exist llvm_extractvalue : (t : *Type, o : LLVM_Value, index : Nat) -> Nat

exist llvm_cast : (op : Str, op : LLVM_Value, to : *Type) -> LLVM_Value

exist llvm_st : (lo, ro : LLVM_Value) -> ()

exist eval_cast_to_ref : (op : LLVM_Value, to : *Type) -> LLVM_Value
exist eval_cast_to_bool : (op : LLVM_Value, to : *Type) -> LLVM_Value
exist eval_cast_to_basic : (op : LLVM_Value, to : *Type) -> LLVM_Value


exist print_st : (l, r : *Value) -> ()
exist load : (x : LLVM_Value) -> LLVM_Value

exist print_val_with_type : (op : LLVM_Value) -> ()
exist print_val : (op : LLVM_Value) -> ()

exist create_array : (x : LLVM_Value) -> LLVM_Value

exist print_block : (b : StmtBlock) -> ()

exist eval : (x : *Value) -> LLVM_Value
exist reval : (x : *Value) -> LLVM_Value


typedef = (id : Str, t : *Type) -> () {
  fprintf (fout, "\n%%%s = type ", id)
  printTypeSpec (t, false /*print_alias*/, true /*func_as_ptr*/)
}


arraydef = (id : Str, t : *Type, items : *List) -> () {
  //@arr = global [4 x i32] [i32 1, i32 2, i32 3, i32 4], align 16
  fprintf (fout, "\n@%s = private unnamed_addr constant ", id)
  printType (t)

  o (" [")
  print_array_item = ListForeachHandler {
    if index > 0 {comma ()}
    v = data to *Value
    ev = reval (v)
    print_val_with_type (ev)
  }
  list_foreach (items, print_array_item, nil)
  o ("], align 16")
}


/*
@.str = private unnamed_addr constant [4 x i8] c"XXX\00", align 1
@s = constant i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), align 8, !dbg !0
*/
stringdef = (id : Str, len : Nat, s : Str) -> () {
  fprintf (fout, "\n@%s = private unnamed_addr constant [%d x i8] c\"", id, len)

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
      fprintf (fout, "\\%02X", c)
    } else {
      fprintf (fout, "%c", c)
    }
  }
  o ("\\00\", align 1")
}


vardef = (id : Str, t : *Type, v : *Value) -> () {
  fprintf (fout, "\n@%s = global ", id)
  printType (t); space ()

  // print initial value
  if v == nil {o ("zeroinitializer"); return}

  // инициализация записью
  if v.data is ValueRecord {
    vr = v.data as ValueRecord

    if vr.values.volume == 0 {
      printf("UUU!\n")
      o ("zeroinitializer")
      return
    }

    o ("{")
    prt_ini_val = ListForeachHandler {
      if index > 0 {o (", ")}
      v = data to *Value
      val = eval (v)
      print_val_with_type (val)
    }
    list_foreach(&(vr to Var ValueRecord).values, prt_ini_val, nil)
    o ("}")

    return
  }

  ev = eval (v)
  if ev.kind != #LLVM_ValueImmediate {
    error ("expected constant init value", v.ti)
    o ("zeroinitializer")
    return
  }
  print_val (ev)
  o("; 1")
  //fprintf(fout, "; ?%d\n", ev.kind)
}


// каждый StmtVarDef получает порядковый номер no
// связываемое с ним значение получает тот же номер в свое поле no
// когда принтер обрабатвает StmtVarDef он выделяет регистр
// и кладет его в local_vars_map[no] := reg
// потом при обращении к значению переменной исплоьзыется этот номер
// для получения фактического регистра: reg = local_vars_map[no]
local_vars_map = 0 to Var [maxLocals]Nat32
local_x_map = 0 to Var [maxLocals]Nat32

funcdef = (id : Str, t : *Type, b : MaybeBlock) -> () {
  // 0, 1, 2 - params; 3 - entry label, 4 - first free register
  params = t.func.from.record.decls
  firstlab = params.volume + (1 /*entry label*/)


  select_no := 0

  lab_reset (firstlab to Nat32)
  //lab_get ()

  assert (t != nil, "prn/funcdef t = nil")

  if b is NoBlock {
    o ("\ndeclare")
    //if DEBUG {dbg(0)}
  } else {
    o ("\n\ndefine")
  }

  space ()

  isvoid = type_eq (t.func.to, typeUnit)

  if isvoid {
    o ("void")
  } else {
    printType (t.func.to)
  }

  fprintf (fout, " @%s (", id)
  vf_print_param = ListForeachHandler {
    f = data to *Decl
    if index > 0 {comma ()}
    printType (f.type)
  }
  list_foreach (params, vf_print_param, nil)
  if t.func.arghack {o (", ...")}
  o (")")


  if b is StmtBlock {
    o (" {")
    //reset_local_labels
    global_if_id := 0
    global_while_id := 0
    while_id := 0
    stmtno := 0
    blockno := 0

    print_block (b as StmtBlock)
    if isvoid {o ("\n  ret void")}
    o ("\n}")
  }
}


aliasdef = (id : Str, t : *Type, org : Str) -> () {
  //@sss = alias i8*, i8** @_func4_str6
  //@main  = alias void (), void ()* @xxx
  fprintf (fout, "\n@%s = alias ", id)
  printTypeSpec (t, false /*print_alias*/, false /*func_as_ptr*/)
  comma ()
  printTypeSpec (t, false /*print_alias*/, false /*func_as_ptr*/)
  fprintf (fout, "* @%s", org)
}


// m2/prn/expr


operation_with_type = (op : Str, t : *Type) -> Nat {
  reg = lab_get ()
  fprintf (fout, "\n  %%%d = %s ", reg, op); printType (t)
  return reg
}


// печатает начало для getelementptr inbounds
// после чего мы уже печатаем индексы
// первый индекс - это смещение от элемента на элемент (как с массивом)
// второй индекс - смещение внутри элемента
llvm_getelementptr = (ot : *Type, by : LLVM_Value) -> Nat {
  // %5 = getelementptr inbounds <ot>, <ot>* @by,
  reg = operation_with_type ("getelementptr inbounds", ot)
  comma ()
  printType (ot)
  o ("* ")
  print_val (by)
  comma ()
  return reg
}


llvm_extractvalue = (t : *Type, o : LLVM_Value, index : Nat) -> Nat {
  //%7 = extractvalue { i8*, i8* } %4, 0
  // %7 = extractvalue <t> <o>, <index>
  reg = operation_with_type ("extractvalue", t)
  space ()
  print_val (o)
  fprintf (fout, ", %u", index)
  return reg
}

llvm_binary = (op : Str, l, r : LLVM_Value) -> Nat {
  reg = operation_with_type (op, l.type)
  space ()
  print_val (l)
  comma ()
  print_val (r)
  return reg
}

// llvm binary signed unsigned (internal function)
llvm_binary_su = (ops : Str, opu : Str, l, r : LLVM_Value) -> Nat {
  op = when l.type.num.signed {
    true => ops
    else => opu
  }
  return llvm_binary (op, l, r)
}


exist eval_imm : (x : ValueImm) -> LLVM_Value

exist eval_ref : (x : ValueRef) -> LLVM_Value
exist eval_deref : (x : ValueDeref) -> LLVM_Value
exist eval_not : (x : ValueNot) -> LLVM_Value
exist eval_plus : (x : ValuePlus) -> LLVM_Value
exist eval_minus : (x : ValueMinus) -> LLVM_Value
exist eval_rec : (x : ValueRecord) -> LLVM_Value
exist eval_arr : (x : ValueArray) -> LLVM_Value

exist eval_add : (x : ValueAdd) -> LLVM_Value
exist eval_sub : (x : ValueSub) -> LLVM_Value
exist eval_mul : (x : ValueMul) -> LLVM_Value
exist eval_div : (x : ValueDiv) -> LLVM_Value
exist eval_mod : (x : ValueMod) -> LLVM_Value
exist eval_and : (x : ValueAnd) -> LLVM_Value
exist eval_or  : (x : ValueOr) -> LLVM_Value
exist eval_xor : (x : ValueXor) -> LLVM_Value
exist eval_eq  : (x : ValueEq) -> LLVM_Value
exist eval_ne  : (x : ValueNe) -> LLVM_Value
exist eval_lt  : (x : ValueLt) -> LLVM_Value
exist eval_gt  : (x : ValueGt) -> LLVM_Value
exist eval_le  : (x : ValueLe) -> LLVM_Value
exist eval_ge  : (x : ValueGe) -> LLVM_Value
exist eval_shl : (x : ValueShl) -> LLVM_Value
exist eval_shr : (x : ValueShr) -> LLVM_Value

exist eval_call : (x : ValueCall) -> LLVM_Value
exist eval_index : (x : ValueIndex) -> LLVM_Value
exist eval_access : (x : ValueAccess) -> LLVM_Value

exist eval_cast : (x : ValueCast) -> LLVM_Value
exist eval_as : (x : ValueAs) -> LLVM_Value
exist eval_is : (x : ValueIs) -> LLVM_Value

exist eval_when : (x : ValueWhen) -> LLVM_Value


// не так то просто тк ValueGlobalConst бывает разным)
def_getname = (d : *Definition) -> Str {
  return when d.kind {
    #DefType  => d.typedef.id
    #DefConst => d.constdef.id
    #DefStr   => d.stringdef.id
    #DefArray => d.arraydef.id
    #DefFunc  => d.funcdef.id
    #DefVar   => d.vardef.id
    #DefAlias => d.aliasdef.id
    else => () -> Str {return "<undef-def-kind>"} ()
  }
}

exist eval_param : (x : ValueParam) -> LLVM_Value
exist eval_local_var : (x : ValueLocalVar) -> LLVM_Value
exist eval_glb_const : (x : ValueGlobalConst) -> LLVM_Value
exist eval_glb_var : (x : ValueGlobalVar) -> LLVM_Value
exist eval_loc_const : (x : ValueLocalVal) -> LLVM_Value

// value evaluation
// Принимает на вход значение. Возвращает значение принтера
// Значения-операции вычисляются. Результатом может быть константа, имя, регистр или адрес.
// Имена и адреса нуждаются в дополнительной загрузке функцией load
// (только если это не lval)
eval = (x : *Value) -> LLVM_Value {
  xx = x.data
  return when xx {
    ValueImm         => eval_imm       (xx as ValueImm)
    ValueGlobalConst => eval_glb_const (xx as ValueGlobalConst)
    ValueGlobalVar   => eval_glb_var   (xx as ValueGlobalVar)
    ValueLocalVal    => eval_loc_const (xx as ValueLocalVal)
    ValueLocalVar    => eval_local_var (xx as ValueLocalVar)
    ValueParam       => eval_param     (xx as ValueParam)

    ValueAdd         => eval_add (xx as ValueAdd)
    ValueSub         => eval_sub (xx as ValueSub)
    ValueMul         => eval_mul (xx as ValueMul)
    ValueDiv         => eval_div (xx as ValueDiv)
    ValueMod         => eval_mod (xx as ValueMod)
    ValueAnd         => eval_and (xx as ValueAnd)
    ValueOr          => eval_or  (xx as ValueOr)
    ValueXor         => eval_xor (xx as ValueXor)
    ValueEq          => eval_eq  (xx as ValueEq)
    ValueNe          => eval_ne  (xx as ValueNe)
    ValueLt          => eval_lt  (xx as ValueLt)
    ValueGt          => eval_gt  (xx as ValueGt)
    ValueLe          => eval_le  (xx as ValueLe)
    ValueGe          => eval_ge  (xx as ValueGe)
    ValueShl         => eval_shl (xx as ValueShl)
    ValueShr         => eval_shr (xx as ValueShr)

    //ValueLoad   => load        (reval (x.load))
    ValueCall   => eval_call   (xx as ValueCall)
    ValueIndex  => eval_index  (xx as ValueIndex)
    ValueAccess => eval_access (xx as ValueAccess)
    ValueRef    => eval_ref    (xx as ValueRef)
    ValueDeref  => eval_deref  (xx as ValueDeref)
    ValueMinus  => eval_minus  (xx as ValueMinus)
    ValuePlus   => eval_plus   (xx as ValuePlus)
    ValueNot    => eval_not    (xx as ValueNot)
    ValueCast   => eval_cast   (xx as ValueCast)
    ValueAs     => eval_as     (xx as ValueAs)
    ValueIs     => eval_is     (xx as ValueIs)
    ValueWhen   => eval_when   (xx as ValueWhen)
    ValueRecord => eval_rec    (xx as ValueRecord)
    ValueArray  => eval_arr    (xx as ValueArray)

    else => (x : *Value) -> LLVM_Value {
      fatal ("error eval #ValueUndefined\n")
      return (kind=#LLVM_ValueInvalid)
    } (x)
  }
}


// right eval
reval = (x : *Value) -> LLVM_Value {return load(eval(x))}


eval_imm = (x : ValueImm) -> LLVM_Value {
  return (kind=#LLVM_ValueImmediate, type=x.type, imm=x.value) to LLVM_Value
}

eval_param = (x : ValueParam) -> LLVM_Value {
  return (kind=#LLVM_ValueRegister, type=x.type, reg=x.no)
}

eval_local_var = (x : ValueLocalVar) -> LLVM_Value {
  t = x.type.var.of // <<fixit!
  return (kind=#LLVM_ValueLocalVar, type=t, reg=local_vars_map[x.no])
}

eval_glb_const = (x : ValueGlobalConst) -> LLVM_Value {
  return (kind=#LLVM_ValueGlobalConst, type=x.type, id=def_getname(x.def))
}

eval_glb_var = (x : ValueGlobalVar) -> LLVM_Value {
  t = x.type.var.of // <<fixit!
  return (kind=#LLVM_ValueGlobalVar, type=t, id=def_getname(x.def))
}

eval_loc_const = (x : ValueLocalVal) -> LLVM_Value {
  return (kind=#LLVM_ValueRegister, type=x.type, reg=local_x_map[x.no])
}


eval_call = (x : ValueCall) -> LLVM_Value {
  // evaluate arguments values before printing call

  // context for evaluated & loaded arguments
  // Делаю это потому что LLVM_Value передается по значению а не по ссылке
  // и следовательно data/list не подойдет
  Arguments = (args : [maxArg]LLVM_Value, cnt : Nat16)

  args = 0 to Var Arguments
  args.cnt := 0

  eval_args = ListForeachHandler {
    arg = data to *Value
    args = ctx to *Arguments
    args.args[args.cnt] := reval (arg)
    args.cnt := args.cnt + 1
  }
  list_foreach (x.args, eval_args, &args)


  // eval & load function value
  f = reval (x.func)

  // print call

  o ("\n  ")

  retval_reg = 0 to Var Nat32
  if not type_eq (f.type.func.to, typeUnit) {
    retval_reg := lab_get ()
    fprintf (fout, "%%%d = ", retval_reg)
  }

  o ("call ")
  printTypeSpec (f.type, false /*print_alias*/, false /*func_as_ptr*/)
  space ()

  print_val (f)

  o (" (")
  c = 0 to Var Nat16
  while c < args.cnt {
    if c > 0 {comma ()}
    print_val_with_type (args.args[c])
    c := c + 1
  }
  o (")")

  return (kind=#LLVM_ValueRegister, type=x.type, reg=retval_reg)
}


eval_index_uarray = (a, i : LLVM_Value) -> LLVM_Value {
  o ("\n; eval index uarray")
  item_type = a.type.array_u.of

  //%1 = getelementptr inbounds [10 x i32], [10 x i32]* @a, i64 0, i64 1
  reg = llvm_getelementptr (item_type, a)
  print_val_with_type (i)

  return (kind=#LLVM_ValueAddress, type=item_type, reg=reg)
}



eval_index = (x : ValueIndex) -> LLVM_Value {
  a = eval (x.array)
  i = reval (x.index)

  if typeIsUndefinedArray (a.type) {
    return eval_index_uarray (a, i)
  }

  is_def_array_in_register = a.kind == #LLVM_ValueRegister and typeIsDefinedArray (a.type)

  // работа со значением-массивом в регистре
  // (при этом индекс должен быть константой!)
  index_is_imm = true
  if is_def_array_in_register and index_is_imm {
    reg = llvm_extractvalue (a.type, a, i.imm to Nat)
    return (kind=#LLVM_ValueRegister, type=x.type, reg=reg)
  }

  // оперделенный массив или указатель на определенный массив

  eval_index_array = (a, i : LLVM_Value) -> LLVM_Value {
    //%1 = getelementptr inbounds [10 x i32], [10 x i32]* @a, i64 0, i64 1
    o ("\n; index array")
    // получаем тип массива (даже если получили указатель на массив)

    atype = when a.type.kind {
      #TypeArray => a.type       // is just array
      else => a.type.pointer.to  // is pointer to array
    }

    reg = llvm_getelementptr (atype, a)
    o ("i1 0, "); print_val_with_type (i)

    item_type = atype.array.of

    return (kind=#LLVM_ValueAddress, type=item_type, reg=reg)
  }

  return eval_index_array (a, i)
}



/*.*/

eval_access = (x : ValueAccess) -> LLVM_Value {
  assert (x.field != nil, "print/expr:: x.field == nil\n")

  if x.value.data is ValueAccess {}

  s = eval (x.value)

  byptr = s.type.kind == #TypePointer

  record_type = when byptr {
    true => s.type.pointer.to
    else => s.type
  }

  field = type_record_get_field (record_type, x.field)
  fieldno = field.offset

  if not byptr {
    // работа именно со значением в регистре
    if s.kind == #LLVM_ValueRegister {
      reg = llvm_extractvalue (record_type, s, fieldno to Nat)
      return (kind=#LLVM_ValueRegister, type=x.type, reg=reg)
    }
  }

  // локальная переменная это указатель
  // локальная переменная "указатель на структуру"
  // это `указатель на указатель на структуру`
  ss = when byptr {
    true => load (s)
    else => s
  }

  reg = llvm_getelementptr (record_type, ss)
  fprintf (fout, "i1 0, i32 %u", fieldno)

  return (kind=#LLVM_ValueAddress, type=x.type, reg=reg)
}



eval_ref = (x : ValueRef) -> LLVM_Value {

  // get pointer to global var?
  // глобальная переменная сама по себе является своим адресом (в LLVM)
  // это особенно важно для создания глобальных массивов указателей
  // на статические переменные
  // do here, before eval (!)
  if x.value.data is ValueGlobalVar {
    id = def_getname ((x.value.data as ValueGlobalVar).def)
    // return as LLVM_ValueGlobalConst, а не Var
    // (тк Var будет пытаться загружаться, чего нам не надо)
    return (kind=#LLVM_ValueGlobalConst, type=x.type, id=id)
  }


  vx = eval (x.value)
  if vx.kind == #LLVM_ValueAddress {
    // если это адрес - вернем его в регистре, а тип обернем в указатель
    return (kind=#LLVM_ValueRegister, type=x.type, reg=vx.reg)
  }


  //%7 = getelementptr inbounds %Int32, %Int32* @a, i32 0
  reg = llvm_getelementptr (vx.type, vx); o ("i1 0")

  return (kind=#LLVM_ValueRegister, type=x.type, reg=reg)
}


eval_deref = (x : ValueDeref) -> LLVM_Value {
  // eval & load pointer
  vx = reval (x.value)

  // return loaded pointer as #Address
  return (kind=#LLVM_ValueAddress, type=x.type, reg=vx.reg)
}


eval_not = (x : ValueNot) -> LLVM_Value {
  vx = reval (x.value)

  //"%s = xor %s, -1"
  reg = operation_with_type ("xor", vx.type)
  space ()
  print_val (vx)
  if (type_eq (vx.type, typeBool)) {o (", 1")} else {o (", -1")}
  return (kind=#LLVM_ValueRegister, type=vx.type, reg=reg)
}


eval_minus = (x : ValueMinus) -> LLVM_Value {
  vx = reval (x.value)

  z = (kind=#LLVM_ValueImmediate, type=typeBaseInt, imm=0 to Int64)

  reg = llvm_binary ("sub nsw", z, vx)
  return (kind=#LLVM_ValueRegister, type=vx.type, reg=reg)
}


eval_plus = (x : ValuePlus) -> LLVM_Value {return reval (x.value)}



llvm_cast = (k : Str, v : LLVM_Value, t : *Type) -> LLVM_Value {
  reg = operation_with_type (k, v.type)
  space ()
  print_val (v)
  o (" to ")
  printType (t)
  return (kind=#LLVM_ValueRegister, type=t, reg=reg)
}

// тип семейства функций выполняющих приведение
// какого либо вида значений к некоторому типу
EvalCast = (v : LLVM_Value, t : *Type) -> LLVM_Value


eval_cast_to_ref = EvalCast {
  return when v.type.kind {
    #TypeNumeric => llvm_cast ("inttoptr", v, t)  // Int -> Ref
    else => llvm_cast ("bitcast", v, t)  // X -> Ref
  }
}


eval_cast_to_bool = EvalCast {
  // only Int can be casted to Bool
  return llvm_cast ("trunc", v, t)
}



eval_cast_basic_to_basic = EvalCast {
  return when true {
    v.type.num.power > t.num.power => llvm_cast ("trunc", v, t)    // INT -> int
    v.type.num.power < t.num.power => (v : LLVM_Value, t : *Type) -> LLVM_Value {
      return when t.num.signed {
        true => llvm_cast ("sext", v, t)   // Int -> SIGNED_INT
        else => llvm_cast ("zext", v, t)   // Int -> UNSIGNED_INT
      }
    } (v, t)

    else => llvm_cast ("bitcast", v, t)  // Int -> Int
  }
}

eval_cast_enum_to_basic = EvalCast {
  return when true {
    cfgEnumSize > t.num.power => llvm_cast ("trunc", v, t)  // power(v) > power(t)
    cfgEnumSize < t.num.power => llvm_cast ("zext", v, t)   // power(v) < power(t)
    else => llvm_cast ("bitcast", v, t)                     // power(v) == power(t)
  }
}

eval_cast_to_basic = EvalCast {
  return when v.type.kind {
    #TypeNumeric => eval_cast_basic_to_basic (v, t)
    #TypePointer => llvm_cast ("ptrtoint", v, t)
    #TypeEnum => eval_cast_enum_to_basic (v, t)
    #TypeBool => llvm_cast ("zext", v, t)
    #TypeUnion => llvm_cast ("bitcast", v, t)
    #TypeOr    => llvm_cast ("bitcast", v, t)

    #TypeRecord => llvm_cast ("bitcast", v, t)

    else => EvalCast {
      k = v.type.kind
      fprintf (fout, "\n<invalid k = %d in cast>", k)
      printf("cast "); prttype(v.type); printf(" to "); prttype(t); printf("\n")
      assert (false, "eval_cast_to_basic")
      return (kind=#LLVM_ValueInvalid)
    } (v, t)
  }
}


eval_as = (x : ValueAs) -> LLVM_Value {
  v = reval (x.value)
  t = x.type

  return llvm_cast ("bitcast", v, t)
}


eval_is = (x : ValueIs) -> LLVM_Value {
  v = reval (x.value)

  // Maybe Ptr
  if v.type.union.impl != nil {
    variant_reg = (kind=#LLVM_ValueImmediate, type=typeBaseInt, imm=0 to Int64)
    variant = loadImmAs(variant_reg, typeBaseInt)

    // загружаем селектор (пока просто берем значение указателя как инт)
    // селктор определяет значение какого типа упаковано в юнион
    selector = llvm_cast ("ptrtoint", v, typeBaseInt)

    // Для `Maybe Pointer
    regno = when x.variant {
      (not x.logic) to Nat => llvm_binary ("icmp ne", selector, variant)
      (x.logic) to Nat => llvm_binary ("icmp eq", selector, variant)
      else => 0
    }

    // возвращаем результат сравнения селектора с вариантом
    return (kind=#LLVM_ValueRegister, type=typeBool, reg=regno)
  }

  // Regular Union
  // по идее юнион должен быть в регистре
  if v.kind != #LLVM_ValueRegister {
    fatal("eval_is :: union is not in reg")
  }

  reg = lab_get ()
  fprintf (fout, "\n  %%%d = extractvalue %%%s ", reg, v.type.aka)
  print_val (v)
  o(", 0")

  t16 = getIntByPower(2)
  selector = (kind=#LLVM_ValueRegister, type=t16, reg=reg)

  // Maybe
  variant_reg = (kind=#LLVM_ValueImmediate, type=t16, imm=x.variant to Int64)
  variant = loadImmAs(variant_reg, typeBaseInt)

  regno = when x.logic {
    true => llvm_binary ("icmp eq", selector, variant)
    else => llvm_binary ("icmp ne", selector, variant)
  }

  return (kind=#LLVM_ValueRegister, type=typeBool, reg=regno)
}







// U0
eval_cast_to_union = EvalCast {

  // приводим некоторое значение с типом a к union-типу b
  // при этом тип a содержится в b

  /* получаем номер варианта для данного типа */
  variant = type_union_get_variant (t, v.type)

  // cast to Regular Union
  if not type_is_maybe_ptr (t) {
    // суть в том что нельзя никак увы в LLVM
    // преобразовать произвольные данные к массиву
    // поэтому приходится создавать переменную и в нее писать
    // посредством указателей. А вот указатели приводить можно как угодно
    var_reg = operation_with_type ("alloca", t)
    lvar = (kind=#LLVM_ValueLocalVar, type=t, reg=var_reg)

    variant_type = getIntByPower(2)
    variant_ptr_type = type_pointer_new (variant_type, nil)

    fprintf (fout, "\n; write variant %d", variant)
    // %5 = getelementptr inbounds <ot>, <ot>* @by,
    preg = llvm_getelementptr (t, lvar); o("i1 0, i32 0");

    ptr_to_variant = (kind=#LLVM_ValueRegister, type=variant_ptr_type, reg=preg)

    variant_imm = (kind=#LLVM_ValueImmediate, type=variant_type, imm=variant to Int64)

    llvm_st (ptr_to_variant, variant_imm)

    ol ("; write data")

    // получаем указатель на поле data в union
    rr = llvm_getelementptr (t, lvar); o("i1 0, i32 1");
    size = t.union.data_size
    ta = type_array_new (typeChar, size, nil)
    data_field_type = type_pointer_new (ta, nil)
    ptr_to_data_field = (kind=#LLVM_ValueRegister, type=data_field_type, reg=rr)

    // приводим указатель на Union#data к указателю на пакуемый тип
    p = llvm_cast("bitcast", ptr_to_data_field, type_pointer_new (v.type, nil))

    llvm_st (p, v)

    return (kind=#LLVM_ValueLocalVar, type=t, reg=var_reg)
  }

  // cast `maybe ptr`
  return when true {
    type_eq(v.type, typeUnit) => llvm_cast ("inttoptr", v, t)  // Unit => *Unit
    v.type.kind == #TypeNumeric => llvm_cast ("inttoptr", v, t)  // i1 0 => *Unit
    else => llvm_cast ("bitcast", v, t)   // *T => *Unit
  }
}

// приведение юниона к типу - по сути распаковка юниона
eval_cast_union_to = EvalCast {
  // 1. загружаем юнион в память
  var_reg = operation_with_type ("alloca", v.type)
  lvar= (kind=#LLVM_ValueLocalVar, type=v.type, reg=var_reg)
  llvm_st (lvar, v)
  // 2. получаем указатель на его поле data
  size = v.type.union.data_size
  ta = type_array_new (typeChar, size, nil)
  data_field_type = type_pointer_new (ta, nil)
  preg = llvm_getelementptr (v.type, lvar); o ("i1 0, i32 1");
  data_field_ptr_reg = (kind=#LLVM_ValueRegister, type=data_field_type, reg=preg)
  // 3. приводим указатель к требуемому типу
  tx = type_pointer_new (t, nil)
  p = llvm_cast ("bitcast", data_field_ptr_reg, tx)
  // 4. загружаем его в регистр
  reg_res = operation_with_type ("load", t)
  comma ()
  printType (t)
  o ("* ")
  print_val (p)
  return (kind=#LLVM_ValueRegister, type=t, reg=reg_res)
  // 5. profit
}


eval_cast = (x : ValueCast) -> LLVM_Value {
  v = reval (x.value)
  t = x.type

  if v.type.kind == #TypeVar {
    printf("CAST VAR!\n")
  }

  if v.type.kind == #TypeUnion {
    if v.type.union.impl == nil {
      return eval_cast_union_to (v, t)
    }
  }

  if v.type.kind == #TypeOr {
    if v.type.union.impl == nil {
      return eval_cast_union_to (v, t)
    }
  }

  return when true {
    type_is_ref(t)         => eval_cast_to_ref   (v, t)  // cast -> Ref
    t.kind == #TypeBool    => eval_cast_to_bool  (v, t)  // cast -> Bool
    t.kind == #TypeNumeric => eval_cast_to_basic (v, t)  // cast -> Basic
    t.kind == #TypeUnion   => eval_cast_to_union (v, t)  // cast -> Union
    type_eq (t, typeUnit)  => (kind=#LLVM_ValueEmpty, type=t) to LLVM_Value // cast -> ()

    else => EvalCast {
      printf ("eval_cast error:\n")
      prttype (v.type); printf (" --> "); prttype (t); printf ("\n")
      fatal ("eval_cast error")
      return (kind=#LLVM_ValueInvalid, type=t)
    } (v, t)
  }
}



eval_binary = (op : Str, left, right : *Value, type : *Type) -> LLVM_Value {
  regno = llvm_binary (op, reval (left), reval (right))
  return (kind=#LLVM_ValueRegister, type=type, reg=regno)
}

// eval_binary signed (ops) / unsigned (opu)
eval_binary_su = (ops : Str, opu : Str, left, right : *Value, type : *Type) -> LLVM_Value {
  regno = llvm_binary_su (ops, opu, reval (left), reval (right))
  return (kind=#LLVM_ValueRegister, type=type, reg=regno)
}

eval_add = (x : ValueAdd) -> LLVM_Value {
  return eval_binary ("add", x.left, x.right, x.type)
}

eval_sub = (x : ValueSub) -> LLVM_Value {
  return eval_binary ("sub", x.left, x.right, x.type)
}

eval_mul = (x : ValueMul) -> LLVM_Value {
  return eval_binary ("mul", x.left, x.right, x.type)
}

eval_div = (x : ValueDiv) -> LLVM_Value {
  return eval_binary_su ("sdiv", "udiv", x.left, x.right, x.type)
}

eval_mod = (x : ValueMod) -> LLVM_Value {
  return eval_binary_su ("srem", "urem", x.left, x.right, x.type)
}

eval_or = (x : ValueOr) -> LLVM_Value {
  return eval_binary ("or", x.left, x.right, x.type)
}

eval_xor = (x : ValueXor) -> LLVM_Value {
  return eval_binary ("xor", x.left, x.right, x.type)
}

eval_and = (x : ValueAnd) -> LLVM_Value {
  return eval_binary ("and", x.left, x.right, x.type)
}

eval_eq = (x : ValueEq) -> LLVM_Value {
  return eval_binary ("icmp eq", x.left, x.right, x.type)
}

eval_ne = (x : ValueNe) -> LLVM_Value {
  return eval_binary ("icmp ne", x.left, x.right, x.type)
}

eval_lt = (x : ValueLt) -> LLVM_Value {
  return eval_binary_su ("icmp slt", "icmp ult", x.left, x.right, x.type)
}

eval_gt = (x : ValueGt) -> LLVM_Value {
  return eval_binary_su ("icmp sgt", "icmp ugt", x.left, x.right, x.type)
}

eval_le = (x : ValueLe) -> LLVM_Value {
  return eval_binary_su ("icmp sle", "icmp ule", x.left, x.right, x.type)
}

eval_ge = (x : ValueGe) -> LLVM_Value {
  return eval_binary_su ("icmp sge", "icmp uge", x.left, x.right, x.type)
}

eval_shl = (x : ValueShl) -> LLVM_Value {
  return eval_binary ("shl", x.left, x.right, x.type)
}

eval_shr = (x : ValueShr) -> LLVM_Value {
  return eval_binary_su ("ashr", "lshr", x.left, x.right, x.type)
}



loadImmAs = (x : LLVM_Value, t : *Type) -> LLVM_Value {
  return llvm_cast ("bitcast", x, x.type)
}

loadImmPtr = (x : LLVM_Value) -> LLVM_Value {
  o("; loadImmPtr")
  //return llvm_cast ("inttoptr", x, x.type)
  reg = lab_get ()
  fprintf (fout, "\n  %%%d = inttoptr i64 %d to", reg, x.imm)
  printType (x.type)
  return (kind=#LLVM_ValueRegister, type=x.type, reg=reg)
}


loadIfImmAs = (x : LLVM_Value, t : *Type) -> LLVM_Value {
  return when x.kind {
    #LLVM_ValueImmediate => llvm_cast ("bitcast", x, t)
    else => x
  }
}


/*
В общем суть проблемы вложенных when ов состоит в том,
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
eval_when = (x : ValueWhen) -> LLVM_Value {
  sel = reval (x.x)

  when_is_sel = 0 to Var LLVM_Value

  if x.iss {
    // when is..

    // сразу загружаем в регистр вариант селект-значения
    reg = lab_get ()
    fprintf (fout, "\n  %%%d = extractvalue %%%s ", reg, sel.type.aka)
    print_val (sel)
    o(", 0")

    t16 = getIntByPower(2)
    when_is_sel := (kind=#LLVM_ValueRegister, type=t16, reg=reg)
  }



  select_no := select_no + 1
  sno = select_no

  n = x.variants.volume

  Ctx = (
    sel : LLVM_Value // значение варианта при селекте по значению
    when_is_sel : LLVM_Value // значение номера типа (варианта) при селекте по типу
    sno : Nat // номер селекта для данной функции
    case : Nat  // текущий номер входа селектора
    regs : [maxSelectorEntry]Nat32 // список номеров регистров с результатами
    // тип возврата оператора select
    // нужно для правильного приведения imm-констант значений селектора
    type : *Type // результирующий тип селекта
  )

  typ = x.type

  ctx = (sel=sel, when_is_sel=when_is_sel, case=0, sno=sno, type=typ) to Var Ctx

  fprintf (fout, "\n  br label %%select_%d_0", sno)

  print_select_case = ListForeachHandler {
    va = data to *ValueWhenVariant
    c = ctx to *Ctx
    fprintf (fout, "\nselect_%d_%d:", c.sno, c.case)

    if va.x != nil {
      // when по значению
      s0 = reval (va.x)
      regno = llvm_binary ("icmp eq", c.sel, s0)
      fprintf (fout, "\n  br i1 %%%d", regno)
    } else {
      // when по типу
      // загружаем номер сравниваемого типа (imm) в регистр
      t16 = getIntByPower(2)
      variant_reg = (kind=#LLVM_ValueImmediate, type=t16, imm=va.t_no to Int64) to LLVM_Value
      variant = loadImmAs(variant_reg, t16)

      // сравниваем его c полученым в начале when реальным значением селектора
      regno = llvm_binary ("icmp eq", c.when_is_sel, variant)
      fprintf (fout, "\n  br i1 %%%d", regno)
    }

    fprintf (fout, ", label %%select_%d_%d_ok, label %%select_%d_%d", c.sno, c.case, c.sno, c.case + 1)

    fprintf (fout, "\nselect_%d_%d_ok:", c.sno, c.case)

    e = reval (va.y)
    s1 = loadIfImmAs (e, c.type)

    fprintf (fout, "\n  br label %%select_%d_end", c.sno)

    c.regs[index] := s1.reg  // сохраняем регистр для фи
    c.case := c.case + 1
  }
  list_foreach (&(x.variants to Var List), print_select_case, &ctx)

  fprintf (fout, "\nselect_%d_%d:", sno, ctx.case) // else ->
  otherwise = loadIfImmAs (reval (x.other), ctx.type)
  fprintf (fout, "\n  br label %%select_%d_end", sno)
  fprintf (fout, "\nselect_%d_end:", sno)


  // если результат () то phi не печатаем
  if not type_eq (typ, typeUnit) {
    reg = operation_with_type ("phi", typ)
    space ()

    i = 0 to Var Nat64
    while i < n {
      fprintf (fout, "[ %%%d, %%select_%d_%d_ok ], ", ctx.regs[i], sno, i)
      i := i + 1
    }

    // otherwise case
    fprintf (fout, "[ %%%d, %%select_%d_%d ]", otherwise.reg, sno, ctx.case)

    return (kind=#LLVM_ValueRegister, type=x.type, reg=reg)
  }

  return (kind=#LLVM_ValueInvalid, type=x.type)
}




//%agg1 = insertvalue {i32, float} undef, i32 1, 0 ; yields {i32 1, float undef}
//%agg2 = insertvalue {i32, float} %agg1, float %val, 1
eval_rec = (x : ValueRecord) -> LLVM_Value {

  // контекст в котором будет происходить формирование структуры
  Ctx6 = (
    type : *Type
    v : LLVM_Value  // значение итеративно формируемой структуры
  )

  ctx = (type=x.type, v=(kind=#LLVM_ValueZero)) to Var Ctx6

  // итеративно формируем структуру
  pack = MapForeachHandler {
    fid = k to Str
    val = v to *Value
    c = ctx to *Ctx6

    vx = reval (val)

    // get target field offset
    field = type_record_get_field (c.type, fid)
    fieldno = field.offset

    // do value insert into record
    reg = operation_with_type ("insertvalue", c.type); space()
    print_val (c.v); comma ()
    print_val_with_type (vx); comma (); fprintf (fout, "%d", fieldno)
    c.v := (kind=#LLVM_ValueRegister, type=c.type, reg=reg)
  }
  map_foreach(&(x.values to Var Map), pack, &ctx)

  return ctx.v
}

eval_arr = (x : ValueArray) -> LLVM_Value {
  // контекст в котором будет происходить формирование структуры
  Ctx8 = (
    type : *Type
    v : LLVM_Value  // значение итеративно формируемого массива
    cnt : Nat // счетчик
  )

  // изза того что приведение к вар типу неправильно реализовано
  // появлется такой вот маразм!
  ctx = (type=x.type, v=(kind=#LLVM_ValueZero), cnt=0) to Var Ctx8

  // итеративно формируем массив
  pack = ListForeachHandler {
    val = data to *Value
    c = ctx to *Ctx8

    vx = reval (val)

    // do value insert into record
    reg = operation_with_type ("insertvalue", c.type); space()
    print_val (c.v); comma ()
    print_val_with_type (vx); comma (); fprintf (fout, "%d", c.cnt)
    c.v := (kind=#LLVM_ValueRegister, type=c.type, reg=reg)
    c.cnt := c.cnt + 1
  }
  list_foreach(&(x.items to Var List), pack, &ctx)

  return ctx.v
}




print_st = (l, r : *Value) -> () {
  lx = eval (l)
  rx = reval (r)
  llvm_st (lx, rx)
}


llvm_st = (lo, ro : LLVM_Value) -> () {
  rt = ro.type
  fprintf (fout, "\n  store ")
  printType (rt)
  space ()
  print_val (ro)
  comma ()
  printType (rt)
  o ("* ")
  print_val (lo)
  fprintf (fout, ", align %d", rt.align)
}


// загрузка (если она необходима) значения вычисленного выражения
load = (x : LLVM_Value) -> LLVM_Value {
  k = x.kind

  if k == #LLVM_ValueInvalid {return x}


  // LLVM не умеет так ... i32* 12233445 - нужно привести int значение к типу
  // явной операцией inttoptr. Поэтому если нам попался указатель вида #ValueImmediate
  // то его нужно будет загрузить в регистр функцией inttoptr
  if k == #LLVM_ValueImmediate {
    return when type_is_ref (x.type) {
      true => loadImmPtr (x)
      else => x
    }
  }

  // в загрузке нуждаются только значения с изменяемым классом памяти
  if k != #LLVM_ValueLocalVar and
     k != #LLVM_ValueGlobalVar and
     k != #LLVM_ValueAddress {
    return x
  }

  typ = x.type
  reg = operation_with_type ("load", typ)
  comma ()
  printType (typ)
  o ("* ")
  print_val (x)
  return (kind=#LLVM_ValueRegister, type=typ, reg=reg)
}



print_val_imm = (x : LLVM_Value) -> Int {
  ot = x.type
  //is_var_ref = ot.kind == #TypeVar and type_is_ref(ot.var)
  is_ref = type_is_ref (ot) or ot.kind == #TypeRecord or ot.kind == #TypeArray

  // если печатаем 0 или nil в объявлении переменной
  if ot.kind == #TypeVar {
    of = ot.var.of
    if type_is_ref (of) or of.kind == #TypeRecord or of.kind == #TypeArray {
      o ("zeroinitializer")
      return 0
    }
  }

  if is_ref and x.imm == 0 {
    // если инициализируем структуру, то 0 превращается в zeroinitializer
    // тк LLVM не позволяет инициализировать простым нулем
    o ("zeroinitializer")
  } else {
    fprintf (fout, "%llu", x.imm)
  }
  return 0
}


// печать значения вычисленного выражения
print_val = (x : LLVM_Value) -> () {
  when x.kind {
    #LLVM_ValueImmediate   => print_val_imm (x)
    #LLVM_ValueRegister    => fprintf (fout, "%%%d", x.reg)
    #LLVM_ValueAddress     => fprintf (fout, "%%%d", x.reg)
    #LLVM_ValueGlobalVar   => fprintf (fout, "@%s", x.id)
    #LLVM_ValueGlobalConst => fprintf (fout, "@%s", x.id)
    #LLVM_ValueLocalVar    => fprintf (fout, "%%%d", x.reg)
    #LLVM_ValueZero        => fprintf (fout, "zeroinitializer")
    #LLVM_ValueUndef       => fprintf (fout, "undef")
    else => fprintf (fout, "<LLVM_ValueInvalid x.kind = %d>", x.kind)
  }
}


print_val_with_type = (x : LLVM_Value) -> () {
  printType (x.type); space (); print_val (x)
}


//%agg1 = insertvalue {i32, float} undef, i32 1, 0  ; yields {i32 1, float undef}
create_array = (x : LLVM_Value) -> LLVM_Value {
  reg = operation_with_type ("insertvalue", x.type)
  o (" undef, ")
  return (kind=#LLVM_ValueRegister, type=x.type, reg=reg)
}


exist print_stmt         : (s : *Stmt) -> ()
exist print_stmt_assign  : (x : StmtAssign) -> ()
exist print_stmt_var     : (x : StmtVarDef) -> ()
exist print_stmt_valbind : (x : StmtValBind) -> ()
exist print_stmt_expr    : (x : StmtExpr) -> ()
exist print_stmt_if      : (x : StmtIf) -> ()
exist print_stmt_while   : (x : StmtWhile) -> ()

exist print_stmt_return   : (x : StmtReturn) -> ()
exist print_stmt_break    : (x : StmtBreak) -> ()
exist print_stmt_again    : (x : StmtAgain) -> ()
exist print_stmt_goto     : (x : StmtGoto) -> ()
exist print_stmt_label    : (x : StmtLabel) -> ()


print_stmt = (x : *Stmt) -> () {
  ss = *x
  when ss {
    StmtBlock    => print_block         (ss as StmtBlock)
    StmtValBind  => print_stmt_valbind  (ss as StmtValBind)
    StmtExpr     => print_stmt_expr     (ss as StmtExpr)
    StmtAssign   => print_stmt_assign   (ss as StmtAssign)
    StmtVarDef   => print_stmt_var      (ss as StmtVarDef)
    StmtIf       => print_stmt_if       (ss as StmtIf)
    StmtWhile    => print_stmt_while    (ss as StmtWhile)
    StmtReturn   => print_stmt_return   (ss as StmtReturn)
    StmtBreak    => print_stmt_break    (ss as StmtBreak)
    StmtAgain    => print_stmt_again    (ss as StmtAgain)
    StmtGoto     => print_stmt_goto     (ss as StmtGoto)
    StmtLabel    => print_stmt_label    (ss as StmtLabel)
    else => fprintf (fout, "<print::stmt_unknown>") to ()
  }
}

print_stmt_assign = (x : StmtAssign) -> () {print_st (x.l, x.r)}

// Печать значения происходит в два этапа
// 1. eval - распечатывается алгоритм вычисления значения
// 2. print_val - печатается регистр в котором находится значение (уже вычисленное)
// или непосредственная константа (которая никак не вычисляется в LLVM)


print_stmt_var = (x : StmtVarDef) -> () {
  reg = operation_with_type ("alloca", x.type)
  // сохраняем номер полученного регистра по нашему номеру
  local_vars_map[x.no] :=reg
  // initialization
  iv = x.init_value
  if iv != nil {
    init_value = reval (iv)
    lo = (kind=#LLVM_ValueLocalVar, type=x.type, reg=reg)
    llvm_st (lo, init_value)
  }
}


print_stmt_valbind = (x : StmtValBind) -> () {
  o = reval (x.v)
  // сохраняем номер регистра по нашему номеру
  local_x_map[x.no] := o.reg
}


print_stmt_expr = (x : StmtExpr) -> () {reval (x.v)}


print_stmt_if = (x : StmtIf) -> () {
  if_id = global_if_id
  global_if_id := global_if_id + 1
  c = reval (x.cond)
  fprintf (fout, "\n  br i1 ")
  print_val (c)
  fprintf (fout, ", label %%then_%d, label %%else_%d", if_id, if_id)
  fprintf (fout, "\nthen_%d:", if_id)
  print_stmt (x.then)
  fprintf (fout, "\n  br label %%endif_%d", if_id)
  fprintf (fout, "\nelse_%d:", if_id)
  if not (x.else is Unit) {print_stmt (x.else as *Stmt)}
  fprintf (fout, "\n  br label %%endif_%d", if_id)
  fprintf (fout, "\nendif_%d:", if_id)
}


print_stmt_while = (x : StmtWhile) -> () {
  old_while_id = while_id
  while_id := global_while_id
  global_while_id := global_while_id + 1
  fprintf (fout, "\n  br label %%again_%d", while_id)
  fprintf (fout, "\nagain_%d:", while_id)
  c = reval (x.cond)
  fprintf (fout, "\n  br i1 ")
  print_val (c)
  fprintf (fout, ", label %%body_%d, label %%break_%d", while_id, while_id)
  fprintf (fout, "\nbody_%d:", while_id)
  print_stmt (x.stmt)
  fprintf (fout, "\n  br label %%again_%d", while_id)
  fprintf (fout, "\nbreak_%d:", while_id)
  while_id := old_while_id
}


print_stmt_return = (x : StmtReturn) -> () {
  v = x.value
  if v is Unit {
    lab_get ()  // for LLVM
    o ("\nret void")
    return
  }

  vx = reval (v as *Value)
  fprintf (fout, "\n  ret ")
  print_val_with_type (vx)
  lab_get ()  // for LLVM
}


print_stmt_break = (x : StmtBreak) -> () {
  lab_get ()  // for LLVM
  fprintf (fout, "\n  br label %%break_%d", while_id)
}


print_stmt_again = (x : StmtAgain) -> () {
  lab_get ()  // for LLVM
  fprintf (fout, "\n  br label %%again_%d", while_id)
}


print_stmt_goto = (x : StmtGoto) -> () {
  lab_get ()  // for LLVM
  fprintf (fout, "\n  br label %%%s", x.label)
}


print_stmt_label = (x : StmtLabel) -> () {
  fprintf (fout, "\n  br label %%%s", x.label)
  fprintf (fout, "\n%s:", x.label)
}


print_block = (b : StmtBlock) -> () {
  for_stmt = ListForeachHandler {
    blockno := blockno + 1
    print_stmt (data to *Stmt)
  }
  list_foreach (&(b.stmts to Var List), for_stmt, nil)
}



printTypeSpec = (t : *Type, print_alias, func_as_ptr : Bool) -> () {
  assert (t != nil, "prn/printType :: t = nil\n")

  if print_alias and t.aka != nil {
    fprintf (fout, "%%%s", t.aka)
    return
  }

  when t.kind {
    #TypeNumeric => fprintf (fout, "%%%s", t.aka) to ()
    #TypeVar     => (t : *Type) -> () {printType (t.var.of)} (t)
    #TypeEnum    => fprintf (fout, "i%d", cfgEnumSize * 8) to ()
    #TypeRecord  => printTypeRecord  (&t.record)
    #TypeArray   => printTypeArray   (&t.array)
    #TypeArrayU  => printTypeArrayU  (&t.array_u)
    #TypePointer => printTypePointer (&t.pointer)
    #TypeFunc    => printTypeFunc    (&t.func, func_as_ptr)
    #TypeBool    => o ("i1")
    #TypeUnion   => fprintf (fout, "%%%s", t.aka) to ()
    #TypeOr      => fprintf (fout, "%%%s", t.aka) to ()
    else => (t : *Type) -> () {
      o ("<type-unknown-kind>")
      printf ("unk type kind %d\n", t.kind)
    } (t)
  }
}


printType = (t : *Type) -> () {printTypeSpec (t, true, true)}


printTypeRecord = (r : *TypeRecord) -> () {
  o ("{")
  print_struct_field = ListForeachHandler {
    if index > 0 {comma ()}
    f = data to *Decl
    printType (f.type)
  }
  list_foreach (r.decls, print_struct_field, nil)
  o ("}")
}


printTypeArray = (a : *TypeArray) -> () {
  fprintf (fout, "[%d x ", a.volume); printType (a.of); o ("]")
}

printTypeArrayU = (a : *TypeArrayU) -> () {printType (a.of); o ("*")}

printTypePointer = (p : *TypePointer) -> () {printType (p.to); o ("*")}


printTypeFunc = (f : *TypeFunc, func_as_ptr : Bool) -> () {
  if type_eq (f.to, typeUnit) {
    o ("void")
  } else {
    printType (f.to)
  }

  param_list = f.from.record.decls

  o (" (")
  pt_print_param = ListForeachHandler {
    if index > 0 {comma ()}
    printType ((data to *Decl).type)
  }
  list_foreach (param_list, pt_print_param, nil)
  if f.arghack {o (", ...")}
  o (")")
  if func_as_ptr {o ("*")}
}



