compile = func (a : *AstModule) -> *Assembly
do_import = func (x : *AstNodeImport) -> ()
do_var_decl = func (x : *AstDecl) -> ()
do_type_def = func (x : *AstNodeBindType) -> ()
do_value_def = func (x : *AstNodeBindValue) -> ()
do_value_decl = func (x : *AstNodeDeclValue) -> ()
value_decl_global = func (id : *AstId, t : *Type) -> ()
type_new = func (k : TypeKind, size : Nat, align : Nat, ti : *TokenInfo) -> *Type
type_numeric_new = func (id : Str, power : Nat, signed : Bool) -> *Type
type_pointer_new = func (to : *Type, ti : *TokenInfo) -> *Type
type_array_u_new = func (of : *Type, ti : *TokenInfo) -> *Type
type_array_new = func (of : *Type, volume : Nat32, ti : *TokenInfo) -> *Type
type_enum_new = func (constructors : *List, ti : *TokenInfo) -> *Type
type_func_new = func (from, _to : *Type, arghack : Bool, ti : *TokenInfo) -> *Type
type_record_get_field = func (t : *Type, field_id : Str) -> *Decl
type_is_ref = func (t : *Type) -> Bool
typeIsDefinedArray = func (t : *Type) -> Bool
typeIsPointerToDefinedArray = func (t : *Type) -> Bool
typeIsUndefinedArray = func (t : *Type) -> Bool

typeIsPointerToRecord = func (t : *Type) -> Bool

DoType = (x : *AstType) -> *Type

do_type = func DoType
do_type_named = func DoType
do_type_func = func DoType
do_type_array_u = func DoType
do_type_array = func DoType
do_type_pointer = func DoType
field_new = func (id : *AstId, t : *Type, ti : *TokenInfo) -> *Decl
alignment = func (req_sz : Nat32, align : Nat) -> Nat32
do_type_record = func DoType
do_type_enum = func DoType

type_eq = func (a, b : *Type) -> Bool
type_init = func () -> ()
prttype = func (t : *Type) -> ()
prttype2 = func (t, selfptr : *Type) -> ()

print_field = func (f : *Decl, selfptr : *Type) -> ()
type_print_record = func (t : *Type) -> ()
type_print_enum = func (t : *Type) -> ()

type_print_array = func (t : *Type, selfptr : *Type) -> ()
type_print_array_u = func (t : *Type, selfptr : *Type) -> ()
type_print_func = func (t : *TypeFunc) -> ()
valueNew = func (k : ValueKind, ti : *TokenInfo) -> *Value

valueNewImm = func (t : *Type, dx : Int64, ti : *TokenInfo) -> *Value


DoValue = (x : *AstValue) -> *Value

do_value = func DoValue
do_value_ref = func DoValue
do_value_deref = func DoValue
do_value_bin = func (k : ValueKind, x : *AstValue) -> *Value
bin_fold = func (k : ValueKind, l, r : *Value) -> *Value

do_value_call = func DoValue

checkParams = func (f : *Value, a : *List, ti : *TokenInfo) -> Bool

do_value_index = func DoValue
do_value_access = func DoValue
do_value_cast = func DoValue
do_value_sizeof = func DoValue
do_value_alignof = func DoValue
do_value_named = func DoValue

do_value_numeric = func DoValue
do_value_string = func DoValue
do_value_func = func DoValue
do_value_array = func DoValue
do_value_record = func DoValue
do_value_minus = func DoValue
do_value_not = func DoValue
do_value_shift = func DoValue
typeValidForBin = func (k : ValueKind, t : *Type) -> Bool
cast = func (v : *Value, t : *Type, ti : *TokenInfo) -> *Value
castIfGenericTo = func (v : *Value, t : *Type) -> *Value

nat = func (v : *Value, t : *Type) -> *Value

naturalConversionIsPossible = func (a, b : *Type) -> Bool

isUnaryOpKind = func (k : ValueKind) -> Bool

isBinaryOpKind = func (k : ValueKind) -> Bool

isReletionOpKind = func (k : ValueKind) -> Bool

isSpecialOpKind = func (k : ValueKind) -> Bool

valueIsTerm = func (v : *Value) -> Bool
valueIsReadonly = func (v : *Value) -> Bool
valueIsMutable = func (v : *Value) -> Bool
value_init = func () -> ()





stmt_new = func (kind : StmtKind, ti : *TokenInfo) -> *Stmt
stmt_assign_new = func (l, r : *Value, ti : *TokenInfo) -> *Stmt
stmt_block_new = func (b, parent : *Block) -> *Block

DoStmt = (s : *AstStmt) -> *Stmt


do_stmt = func DoStmt
do_stmt_assign = func DoStmt
do_stmt_valdef = func DoStmt
do_stmt_block = func DoStmt
do_stmt_expr = func DoStmt
do_stmt_if = func DoStmt
do_stmt_while = func DoStmt
do_stmt_return = func DoStmt
do_stmt_vardef = func DoStmt
do_stmt_typedef = func DoStmt
do_stmt_break = func DoStmt
do_stmt_continue = func DoStmt
do_stmt_goto = func DoStmt
do_stmt_label = func DoStmt


create_global_var = func (id : Str, t : *Type, init_value : *Value, ti : *TokenInfo) -> ()

create_local_var = func (id : *AstId, t : *Type, init_value : *Value, ti : *TokenInfo) -> *Value


asmInit = func (a : *Assembly, name : Str) -> ()

definition_new = func (kind : DefinitionKind, id : Str) -> *Definition

asmTypedefAdd = func (a : *Assembly, id : Str, t : *Type) -> *Definition
asmStringAdd = func (a : *Assembly, id : Str, s : Str, len : Nat) -> *Definition
asmArrayAdd = func (a : *Assembly, id : Str, t : *Type, values : *List) -> *Definition

asmFuncAdd = func (a : *Assembly, id : Str, t : *Type, b : *Block) -> *Definition
asmVarAdd = func (a : *Assembly, id : Str, t : *Type, init_value : *Value) -> *Definition

asmAliasAdd = func (a : *Assembly, id : Str, type : *Type, org : Str) -> *Definition


index_init = func (index : *Index) -> ()
index_extend = func (dst, src : *Index) -> ()

index_type_append = func (index : *Index, id : Str, t : *Type) -> ()

index_value_append = func (index : *Index, id : Str, v : *Value) -> ()

index_get_type = func (index : *Index, id : Str) -> *Type

index_get_value = func (index : *Index, id : Str) -> *Value

get_value_global = func (id : Str) -> *Value

get_value = func (id : Str) -> *Value

bind_value = func (index : *Index, id : Str, v : *Value) -> ()

bind_value_in_block = func (b : *Block, id : Str, v : *Value) -> ()

bind_value_local = func (id : Str, v : *Value) -> ()

bind_value_global = func (id : Str, v : *Value) -> ()

bind_type = func (index : *Index, id : Str, t : *Type) -> ()

get_type = func (id : Str) -> *Type



get_suid = func (prefix : Str, uid : Nat32) -> Str
get_suid_type_local = func () -> Str
get_prefix = func () -> Str
get_name = func (res : Str, uid : *Nat32) -> Str
get_name_str = func () -> Str
get_name_arr = func () -> Str
get_name_var = func () -> Str
get_name_type = func () -> Str


print_assembly = func (a: *Assembly, arch : Arch, fname : Str) -> ()

typedef = func (id : Str, t : *Type) -> ()
arraydef = func (id : Str, t : *Type, items : *List) -> ()

stringdef = func (id : Str, len : Nat, s : Str) -> ()

vardef = func (id : Str, t : *Type, v : *Value) -> ()

funcdef = func (id : Str, t : *Type, b : *Block) -> ()

aliasdef = func (id : Str, t : *Type, org : Str) -> ()




operand = func (t : *Type, k : OperandKind, reg : Nat32) -> Operand

Eval = (v : *Value) -> Operand

eval = func Eval
eval_call = func Eval
eval_index_undefined = func (a, i : Operand) -> Operand
eval_index_defined = func (a, i : Operand) -> Operand
eval_index = func Eval
eval_access = func Eval
eval_ref = func Eval
eval_deref = func Eval
eval_not = func Eval
eval_minus = func Eval

CastMode = {#Sext, #Zext, #Trunc, #Bitcast, #IntToPtr, #PtrToInt}

llvm_cast = func (mode : CastMode, op : Operand, to : *Type) -> Operand

eval_cast_to_ref = func (op : Operand, to : *Type) -> Operand
eval_cast_to_bool = func (op : Operand, to : *Type) -> Operand
eval_cast_to_basic = func (op : Operand, to : *Type) -> Operand
eval_cast = func Eval
eval_bin = func Eval
print_st = func (l, r : *Value) -> ()
load = func (x : Operand) -> Operand

print_operand = func (op : Operand) -> ()

create_array = func (x : Operand) -> Operand

print_stmt = func (s : *Stmt) -> ()
print_stmt_var = func (v : *Decl) -> ()
print_stmt_expr = func (e : *Expr) -> ()
print_stmt_if = func (i : *If) -> ()
print_stmt_while = func (w : *While) -> ()

print_stmt_return = func (rv : *Value) -> ()
print_stmt_break = func () -> ()
print_stmt_continue = func () -> ()
print_stmt_goto = func (l : Str) -> ()
print_stmt_label = func (l : Str) -> ()
print_block = func (b : *Block) -> ()

printTypeSpec = func (t : *Type, print_alias, func_as_ptr : Bool) -> ()
printType = func (t : *Type) -> ()
printTypeRecord = func (r : *TypeRecord) -> ()
printTypeArray = func (a : *TypeArray) -> ()
printTypeArrayU = func (a : *TypeArrayU) -> ()
printTypePointer = func (p : *TypePointer) -> ()
printTypeFunc = func (f : *TypeFunc, func_as_ptr : Bool) -> ()