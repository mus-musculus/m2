
exist unwrap_var : (x : *Value) -> *Value


exist compile : (a : *AstModule) -> *Assembly
exist do_import : (x : *AstNodeImport) -> ()
exist do_var_decl : (x : *AstDecl) -> ()
exist do_type_bind : (x : *AstNodeBindType) -> ()
exist do_value_bind : (x : *AstNodeBindValue) -> ()
exist do_type_decl : (x : *AstNodeDeclType) -> ()
exist do_value_decl : (x : *AstNodeDeclValue) -> ()
exist value_decl_global : (id : *AstId, t : *Type) -> ()
exist type_new : (k : TypeKind, size : Nat, align : Nat, ti : *TokenInfo) -> *Type
exist type_numeric_new : (id : Str, power : Nat, signed : Bool) -> *Type
exist type_pointer_new : (to : *Type, ti : *TokenInfo) -> *Type
exist type_array_u_new : (of : *Type, ti : *TokenInfo) -> *Type
exist type_array_new : (of : *Type, volume : Nat32, ti : *TokenInfo) -> *Type
exist type_enum_new : (constructors : *List, ti : *TokenInfo) -> *Type
exist type_func_new : (from, _to : *Type, arghack : Bool, ti : *TokenInfo) -> *Type
exist type_record_get_field : (t : *Type, field_id : Str) -> *Decl
exist type_is_ref : (t : *Type) -> Bool

exist type_is_maybe_ptr : (t : *Type) -> Bool

exist typeIsDefinedArray : (t : *Type) -> Bool
exist typeIsPointerToDefinedArray : (t : *Type) -> Bool
exist typeIsUndefinedArray : (t : *Type) -> Bool
exist typeIsPointerToRecord : (t : *Type) -> Bool
exist type_is_basic_integer : (t : *Type) -> Bool
exist typeIsRecord : (t : *Type) -> Bool

exist getIntByPower : (power : Nat) -> *Type


exist do_type : DoType
exist do_type_var : DoType
exist do_type_named : DoType
exist do_type_func : DoType
exist do_type_array_u : DoType
exist do_type_array : DoType
exist do_type_pointer : DoType
exist do_type_record : DoType
exist do_type_enum : DoType
exist do_type_union : DoType


exist type_union_get_variant : (union, type : *Type) -> Nat

exist type_eq : (a, b : *Type) -> Bool
exist type_init : () -> ()
exist prttype : (t : *Type) -> ()
exist prttype2 : (t, selfptr : *Type) -> ()

exist type_print_var : (x : *TypeVar) -> ()
exist type_print_pointer : (x : *TypePointer, selfptr : *Type) -> ()
//exist print_field : (f : *Decl, selfptr : *Type) -> ()
exist type_print_record : (t : *Type) -> ()
exist type_print_enum : (t : *Type) -> ()

exist type_print_array : (t : *Type, selfptr : *Type) -> ()
exist type_print_array_u : (t : *Type, selfptr : *Type) -> ()
exist type_print_func : (t : *TypeFunc) -> ()
exist value_new : (k : ValueKind, t : *Type, ti : *TokenInfo) -> *Value

exist value_new_imm : (t : *Type, dx : Int64, ti : *TokenInfo) -> *Value


exist ld_if_var : (x : *Value) -> *Value

exist do_value : (x : *AstValue) -> *Value

exist do_lvalue : (x : *AstValue) -> *Value
exist do_valuex : DoValuex
exist do_value_ref : DoValue
exist do_value_bin : (k : ValueKind, x : *AstValue) -> *Value

exist do_value_call : DoValue

exist do_args : (f : *Value, a : *List, ti : *TokenInfo) -> *List


exist do_value_forbidden : DoValue
exist do_value_deref : DoValue
exist do_value_index : DoValue
exist do_value_access : DoValue
exist do_value_cast : DoValue
exist do_value_is : DoValue
exist do_value_as : DoValue
exist do_value_sizeof : DoValue
exist do_value_alignof : DoValue
exist do_value_named : DoValue

exist do_value_when : DoValue
exist do_value_numeric : DoValue
exist do_value_string : DoValue
exist do_value_func : DoValue
exist do_value_array : DoValue
exist do_value_record : DoValue
exist do_value_minus : DoValue
exist do_value_plus : DoValue
exist do_value_not : DoValue
exist do_value_shift : DoValue
exist typeValidForBin : (k : ValueKind, t : *Type) -> Bool
exist cast : (v : *Value, t : *Type, ti : *TokenInfo) -> *Value

exist implicit_cast_int : (v : *Value) -> *Value
exist implicit_cast : (v : *Value, t : *Type) -> *Value

exist implicit_cast_possible : (a, b : *Type) -> Bool

exist isUnaryOpKind : (k : ValueKind) -> Bool

exist isBinaryOpKind : (k : ValueKind) -> Bool

exist isReletionOpKind : (k : ValueKind) -> Bool

exist isSpecialOpKind : (k : ValueKind) -> Bool

exist valueIsTerm : (v : *Value) -> Bool
exist value_is_readonly : (v : *Value) -> Bool
exist valueIsMutable : (v : *Value) -> Bool
exist value_init : () -> ()

exist stmt_new : (kind : StmtKind, ti : *TokenInfo) -> *Stmt
//exist stmt_assign_new : (l, r : *Value, ti : *TokenInfo) -> *Stmt
exist stmt_block_new : (b, parent : *Block) -> *Block




exist do_stmt : DoStmt


exist create_global_var : (id : Str, t : *Type, init_value : *Value, ti : *TokenInfo) -> *Value

exist create_local_var : (id : *AstId, t : *Type, init_value : *Value, ti : *TokenInfo) -> *Value


exist asm_init : (a : *Assembly, arch : Arch, name : Str) -> ()

exist definition_new : (kind : DefinitionKind, id : Str) -> *Definition

exist asmTypedefAdd : (a : *Assembly, id : Str, t : *Type) -> *Definition
exist asmStringAdd : (a : *Assembly, id : Str, s : Str, len : Nat) -> *Definition
exist asmArrayAdd : (a : *Assembly, id : Str, t : *Type, values : *List) -> *Definition

exist asmFuncAdd : (a : *Assembly, id : Str, t : *Type, b : *Block) -> *Definition
exist asmVarAdd : (a : *Assembly, id : Str, t : *Type, init_value : *Value) -> *Definition

exist asmAliasAdd : (a : *Assembly, id : Str, type : *Type, org : Str) -> *Definition


exist index_init : (index : *Index) -> ()
exist index_extend : (dst, src : *Index) -> ()
exist index_type_append : (index : *Index, id : Str, t : *Type) -> ()
exist index_value_append : (index : *Index, id : Str, v : *Value) -> ()
exist index_get_type : (index : *Index, id : Str) -> *Type
exist index_get_value : (index : *Index, id : Str) -> *Value
exist get_value_global : (id : Str) -> *Value
exist get_value : (id : Str) -> *Value
exist bind_value : (index : *Index, id : Str, v : *Value) -> ()
exist bind_value_in_block : (b : *Block, id : Str, v : *Value) -> ()
exist bind_value_local : (id : Str, v : *Value) -> ()
exist bind_value_global : (id : Str, v : *Value) -> ()
exist bind_type : (index : *Index, id : Str, t : *Type) -> ()
exist get_type : (id : Str) -> *Type
exist get_type_global : (id : Str) -> *Type

exist type_present_in_list : (list : *List, t : *Type) -> Bool


exist get_suid : (prefix : Str, uid : Nat32) -> Str
exist get_suid_type_local : () -> Str
exist get_prefix : () -> Str
exist get_uid_func : () -> Str
exist get_name : (res : Str, uid : *Nat32) -> Str
exist get_name_str : () -> Str
exist get_name_arr : () -> Str
exist get_name_var : () -> Str
exist get_name_type : () -> Str


exist print_assembly : (a: *Assembly, fname : Str) -> ()

exist typedef : (id : Str, t : *Type) -> ()
exist arraydef : (id : Str, t : *Type, items : *List) -> ()
exist stringdef : (id : Str, len : Nat, s : Str) -> ()
exist vardef : (id : Str, t : *Type, v : *Value) -> ()
exist funcdef : (id : Str, t : *Type, b : *Block) -> ()
exist aliasdef : (id : Str, t : *Type, org : Str) -> ()


exist operand : (t : *Type, k : LLVM_ValueKind, reg : Nat32) -> LLVM_Value





exist operation_with_type : (op : Str, t : *Type) -> Nat
exist llvm_binary : (op : Str, l, r : LLVM_Value, t : *Type) -> Nat
exist llvm_getelementptr : (by : LLVM_Value, item_type : *Type) -> Nat
exist llvm_extractvalue : (t : *Type, o : LLVM_Value, index : Nat) -> Nat

exist llvm_cast : (op : Str, op : LLVM_Value, to : *Type) -> LLVM_Value

exist llvm_st : (lo, ro : LLVM_Value) -> ()

exist eval_cast_to_ref : (op : LLVM_Value, to : *Type) -> LLVM_Value
exist eval_cast_to_bool : (op : LLVM_Value, to : *Type) -> LLVM_Value
exist eval_cast_to_basic : (op : LLVM_Value, to : *Type) -> LLVM_Value
exist eval_cast : Eval
exist eval_bin : Eval
exist eval_when : Eval

exist print_st : (l, r : *Value) -> ()
exist load : (x : LLVM_Value) -> LLVM_Value

exist print_val_with_type : (op : LLVM_Value) -> ()
exist print_val : (op : LLVM_Value) -> ()

exist create_array : (x : LLVM_Value) -> LLVM_Value

exist print_block : (b : *Block) -> ()

exist printTypeSpec : (t : *Type, print_alias, func_as_ptr : Bool) -> ()
exist printType : (t : *Type) -> ()
exist printTypeRecord : (r : *TypeRecord) -> ()
exist printTypeArray : (a : *TypeArray) -> ()
exist printTypeArrayU : (a : *TypeArrayU) -> ()
exist printTypePointer : (p : *TypePointer) -> ()
exist printTypeFunc : (f : *TypeFunc, func_as_ptr : Bool) -> ()




// debug
exist value_print_undefined : (v : *Value) -> ()
exist value_print_immediate : (v : *Value) -> ()
exist value_print_global_const : (v : *Value) -> ()
exist value_print_global_var : (v : *Value) -> ()
exist value_print_param : (v : *Value) -> ()
exist value_print_local_const : (v : *Value) -> ()
exist value_print_local_var : (v : *Value) -> ()

exist value_print_ref : (v : *Value) -> ()
exist value_print_deref : (v : *Value) -> ()
exist value_print_not : (v : *Value) -> ()
exist value_print_minus : (v : *Value) -> ()
exist value_print_plus : (v : *Value) -> ()

exist value_print_bin : (v : *Value, op : Str) -> ()

exist value_print_load : (v : *Value) -> ()
exist value_print_shl : (v : *Value) -> ()
exist value_print_shr : (v : *Value) -> ()
exist value_print_call : (v : *Value) -> ()
exist value_print_index : (v : *Value) -> ()
exist value_print_access : (v : *Value) -> ()
exist value_print_cast : (v : *Value) -> ()
exist value_print_select : (v : *Value) -> ()


