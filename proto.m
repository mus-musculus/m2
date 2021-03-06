


exist unwrap_var : (x : *Value) -> *Value


exist compile : (a : AstModule) -> *Assembly

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
exist type_record_field_new : (id : *AstId, t : *Type, ti : *TokenInfo) -> *Decl
exist type_is_maybe_ptr : (t : *Type) -> Bool

exist typeIsDefinedArray : (t : *Type) -> Bool
exist typeIsPointerToDefinedArray : (t : *Type) -> Bool
exist typeIsUndefinedArray : (t : *Type) -> Bool
exist typeIsPointerToRecord : (t : *Type) -> Bool
exist type_is_basic_integer : (t : *Type) -> Bool
exist typeIsRecord : (t : *Type) -> Bool

exist getIntByPower : (power : Nat) -> *Type


exist do_type : (x : *AstType) -> *Type



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

exist do_lvalue : (x : *AstValue) -> *Value
exist do_value  : (x : *AstValue) -> *Value

exist do_lvalue : (x : *AstValue) -> *Value
exist do_valuex : (x : *AstValue, load : Bool) -> *Value





exist do_args : (f : *Value, a : *List, ti : *TokenInfo) -> *List


exist do_value_forbidden : (x : *AstValue) -> *Value







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


exist stmt_block_init : (b, parent : *StmtBlock) -> *StmtBlock




exist do_stmt : (x : *AstStmt) -> *Stmt or Unit


exist create_global_var : (id : *AstId, t : *Type, init_value : *Value, ti : *TokenInfo) -> *Value

exist create_local_var : (id : *AstId, t : *Type, init_value : *Value, ti : *TokenInfo) -> *Value


exist asm_init : (a : *Assembly, arch : Arch, name : Str) -> ()

exist definition_new : (kind : DefinitionKind, id : Str) -> *Definition

exist asmTypedefAdd : (a : *Assembly, id : Str, t : *Type) -> *Definition
exist asmStringAdd : (a : *Assembly, id : Str, s : Str, len : Nat) -> *Definition
exist asmArrayAdd : (a : *Assembly, id : Str, t : *Type, values : *List) -> *Definition

exist asmFuncAdd : (a : *Assembly, id : Str, t : *Type, b : MaybeBlock) -> *Definition
exist asmVarAdd : (a : *Assembly, id : Str, t : *Type, init_value : *Value) -> *Definition

exist asmAliasAdd : (a : *Assembly, id : Str, type : *Type, org : Str) -> *Definition



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
//exist funcdef : (id : Str, t : *Type, b : *StmtBlock) -> ()
exist aliasdef : (id : Str, t : *Type, org : Str) -> ()

exist funcdef : (id : Str, t : *Type, b : MaybeBlock) -> ()


exist printTypeSpec : (t : *Type, print_alias, func_as_ptr : Bool) -> ()
exist printType : (t : *Type) -> ()
exist printTypeRecord : (r : *TypeRecord) -> ()
exist printTypeArray : (a : *TypeArray) -> ()
exist printTypeArrayU : (a : *TypeArrayU) -> ()
exist printTypePointer : (p : *TypePointer) -> ()
exist printTypeFunc : (f : *TypeFunc, func_as_ptr : Bool) -> ()




// debug


exist value_print_bin : (v : *Value, op : Str) -> ()


exist value_type_get : (x : Value) -> *Type


exist stmt_new_vardef : (id : *AstId, t : *Type, init_value : *Value, ti : *TokenInfo) -> *Stmt

//exist is_value_imm_num : (v : *Value) -> Bool

