; assembly: <name>

; clang out2.ll && ./a.out
; llc out2.ll ; for create .s file from .ll
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.15.0"


%Bool = type i1
%Unit = type {}
%Str = type i8*
%Numeric = type i64
%Int64 = type i64
%Nat64 = type i64
%Int32 = type i32
%Nat32 = type i32
%Int8 = type i8
%Nat8 = type i8
%Int16 = type i16
%Nat16 = type i16
%Int128 = type i128
%Int256 = type i256
%Int512 = type i512
%Int1024 = type i1024
%Nat128 = type i128
%Nat256 = type i256
%Nat512 = type i512
%Nat1024 = type i1024


;types:

%Int = type %Int32
%Off_T = type %Int64
%Nat = type %Nat32
%Size_T = type %Nat32
%FILE = type {}
%DIR = type {}
%Node = type {%Node*, %Node*, %Unit*, %Unit*}
%NodeForeachHandler = type void (%Node*, %Unit*, %Nat32)*
%NodeSearchHandler = type i1 (%Node*, %Unit*, %Nat32)*
%List = type {%Node*, %Node*, %Nat64}
%ListForeachHandler = type void (%Unit*, %Unit*, %Nat32)*
%ListForeachHandler2 = type void (%Unit*, %Unit*, %Unit*, %Nat32)*
%ListWhileHandler2 = type i1 (%Unit*, %Unit*, %Unit*, %Nat32)*
%ListCompareHandler = type i1 (%Unit*, %Unit*, %Unit*, %Nat32)*
%ListSearchHandler = type i1 (%Unit*, %Unit*, %Nat32)*
%ListMapHandler = type %Unit* (%Unit*, %Unit*, %Nat32)*
%Map = type {%Node*, %Node*, %Nat64}
%MapForeachHandler = type void (%Unit*, %Unit*, %Unit*)*
%TokenKind = type i16
%TokenInfo = type {%Str, %Nat64, %Nat16, %Nat32, %Nat16}
%Token = type {%TokenKind, %TokenInfo, [0 x %Nat8]}
%LexerState = type {%Int32, %TokenKind, [255 x %Nat8], %Nat8, %Nat16, %TokenInfo}
%Source = type {%List}
%ParserState = type {%Source*, %Node*}
%AstNodeList = type {%Node*, %Node*, %Nat64}
%AstModule = type {%List, %Source*}
%AstNodeKind = type i16
%AstNode = type {%AstNodeKind, %Unit*}
%AstId = type {%Str, %TokenInfo*}
%AstName = type {%AstId*, %AstId*, %TokenInfo*}
%AstTypeKind = type i16
%AstTypeEnum = type {%List}
%AstTypeRecord = type {%List}
%AstTypeArray = type {%AstType*, %AstValue*}
%AstTypeArrayU = type {%AstType*}
%AstTypePointer = type {%AstType*}
%AstTypeFunc = type {%AstType*, %AstType*, i1}
%AstTypeVar = type {%AstType*}
%AstType = type {%AstTypeKind, %AstName, %AstTypeEnum, %AstTypeArray, %AstTypeArrayU, %AstTypePointer, %AstTypeRecord, %AstTypeFunc, %AstTypeVar, %TokenInfo*}
%AstDecl = type {%List, %AstType*, %TokenInfo*, i1, i1, [10 x %Nat8]}
%AstNodeComment = type {%Str, %TokenInfo*}
%AstNodeImport = type {%Str, %TokenInfo*}
%AstNodeBindType = type {%AstId*, %AstType*, %TokenInfo*}
%AstNodeBindValue = type {%AstId*, %AstValue*, %TokenInfo*}
%AstNodeDeclVar = type {%AstDecl*}
%AstNodeDeclType = type {%AstId*}
%AstNodeDeclValue = type {%AstDecl*}
%AstValueKind = type i16
%AstValueFunc = type {%AstType*, %AstStmt*}
%AstValueCall = type {%AstValue*, %List}
%AstValueIndex = type {%AstValue*, %AstValue*}
%AstValueAccess = type {%AstValue*, %AstId*}
%AstValueCast = type {%AstValue*, %AstType*}
%AstValueSelectVariant = type {%AstValue*, %AstValue*}
%AstValueSelect = type {%AstValue*, %List, %AstValue*}
%AstValue = type {%AstValueKind, %Str, %AstName, [2 x %AstValue*], %AstType*, %AstValueFunc, %AstValueCall, %AstValueIndex, %AstValueAccess, %AstValueCast, %AstValueSelect, i1, %TokenInfo*}
%AstStmtKind = type i16
%AstStmtValueDef = type {%AstId*, %AstValue*}
%AstStmtTypeDef = type {%AstId*, %AstType*}
%AstStmtExpr = type {%AstValue*}
%AstStmtAssign = type {%AstValue*, %AstValue*}
%AstStmtBlock = type {%List}
%AstStmtIf = type {%AstValue*, %AstStmt*, %AstStmt*}
%AstStmtWhile = type {%AstValue*, %AstStmt*}
%AstStmtReturn = type {%AstValue*}
%AstStmtGoto = type {%AstId*}
%AstStmtLabel = type {%AstId*}
%AstStmt = type {%AstStmtKind, %AstStmtAssign, %AstDecl, %AstStmtValueDef, %AstStmtTypeDef, %AstStmtExpr, %AstStmtBlock, %AstStmtIf, %AstStmtWhile, %AstStmtReturn, %AstStmtGoto, %AstStmtLabel, %TokenInfo*}
%TypeNumeric = type {%Nat32, i1}
%TypeArray = type {%Type*, %Nat32}
%TypeArrayU = type {%Type*}
%TypeFunc = type {%Type*, %Type*, i1}
%TypePointer = type {%Type*}
%TypeRecord = type {%List*, %Nat32}
%TypeVar = type {%Type*}
%TypeEnum = type {%List*, %Nat32}
%EnumConstructor = type {%AstId*, %Nat32, %TokenInfo*}
%Decl = type {%AstId*, %Type*, %Nat32, %Nat16, %Nat32, %Value*, %TokenInfo*}
%TypeKind = type i16
%Type = type {%TypeKind, %Str, %Nat32, %Nat32, %TypeNumeric, %TypeFunc, %TypePointer, %TypeArray, %TypeArrayU, %TypeRecord, %TypeEnum, %TypeVar, %TokenInfo*}
%ValueKind = type i16
%ValueAccess = type {%Value*, %Str}
%ValueBin = type {%Value*, %Value*}
%ValueCall = type {%Value*, %List*}
%ValueCast = type {%Value*, %Type*}
%ValueIndex = type {%Value*, %Value*}
%ValueUn = type {%Value*}
%ValueSelectVariant = type {%Value*, %Value*}
%ValueSelect = type {%Value*, %List, %Value*}
%Value = type {%ValueKind, %Type*, %Int64, %List, %Definition*, %Decl*, %Decl*, %Expr*, %ValueUn, %ValueBin, %ValueIndex, %ValueAccess, %ValueCast, %ValueCall, %Type*, %ValueSelect, %Value*, i1, %Str, %TokenInfo*}
%StmtKind = type i16
%Index = type {%List, %List}
%Block = type {%Block*, %Index, %List, %List, %TokenInfo*}
%Expr = type {%Value*, %Nat32}
%If = type {%Value*, %Stmt*, %Stmt*}
%While = type {%Value*, %Stmt*}
%Stmt = type {%StmtKind, [2 x %Value*], %Block, %Expr, %Decl*, %While, %If, %Str, %TokenInfo*}
%Module = type {%Index, %Index, %Index}
%FuncContext = type {%Str, %Value*, %Block*, %Nat32, %Nat32, %Nat32, %Nat32, %Nat32}
%DefinitionKind = type i16
%DefType = type {%Type*}
%DefConst = type {%Value*}
%DefStr = type {%Str, %Nat32}
%DefArray = type {%Type*, %Nat32, %List*}
%DefFunc = type {%Type*, %Block*}
%DefVar = type {%Type*, %Value*}
%DefAlias = type {%Str, %Type*, %Str}
%Definition = type {%DefinitionKind, %Str, %DefStr, %DefType, %DefConst, %DefArray, %DefFunc, %DefVar, %DefAlias}
%Assembly = type {%Str, %Str, %Str, %List, %List, %List, %List, %List, %List}
%Arch = type i16
%LLVM_ValueKind = type i16
%LLVM_Value = type {%LLVM_ValueKind, %Type*, %Int64, %Str, %Nat32}
%DoValue = type %Value* (%AstValue*)*
%DoValuex = type %Value* (%AstValue*, i1)*
%DoType = type %Type* (%AstType*)*
%DoStmt = type %Stmt* (%AstStmt*)*
%Eval = type %LLVM_Value (%Value*)*
%Rule = type i1 (%Nat8)*
%AstTypeParser = type %AstType* ()*
%AstValueParser = type %AstValue* ()*
%AstStmtParser = type %AstStmt* (%TokenInfo*)*
%func287.type1 = type {[64 x %LLVM_Value], %Nat16}
%EvalCast = type %LLVM_Value (%LLVM_Value, %Type*)*
%func320.type2 = type {%LLVM_Value, %Nat32, %Nat32, [256 x %Nat32], %Type*}
%func379.type3 = type {%List*, i1}
%func379_func380.type4 = type {%List*, %Type*}
%func403.type5 = type {%Value*, %Value*}
%func409.type6 = type {%Value*, %List*, %List*, %TokenInfo*}
%DoValueCast = type %Value* (%Value*, %Type*, %TokenInfo*)*

;strings:

@func29_str1 = private unnamed_addr constant [19 x i8] c"assert failed: %s\0A\00", align 1
@func30_str1 = private unnamed_addr constant [2 x i8] c"a\00", align 1
@func30_str2 = private unnamed_addr constant [2 x i8] c"z\00", align 1
@func31_str1 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@func31_str2 = private unnamed_addr constant [2 x i8] c"Z\00", align 1
@func32_str1 = private unnamed_addr constant [2 x i8] c"0\00", align 1
@func32_str2 = private unnamed_addr constant [2 x i8] c"9\00", align 1
@func77_str1 = private unnamed_addr constant [6 x i8] c"(nil)\00", align 1
@func77_str2 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@func77_str3 = private unnamed_addr constant [5 x i8] c"Self\00", align 1
@func77_str4 = private unnamed_addr constant [14 x i8] c"<TypeNumeric>\00", align 1
@func77_str5 = private unnamed_addr constant [5 x i8] c"Bool\00", align 1
@func77_str6 = private unnamed_addr constant [13 x i8] c"<TypePoison>\00", align 1
@func77_str7 = private unnamed_addr constant [16 x i8] c"<TypeForbidden>\00", align 1
@func77_str8 = private unnamed_addr constant [14 x i8] c"<TypeUnknown>\00", align 1
@func78_str1 = private unnamed_addr constant [5 x i8] c"Var \00", align 1
@func79_str1 = private unnamed_addr constant [2 x i8] c"*\00", align 1
@func80_str1 = private unnamed_addr constant [2 x i8] c"(\00", align 1
@func80_func81_str1 = private unnamed_addr constant [3 x i8] c", \00", align 1
@func80_func81_str2 = private unnamed_addr constant [6 x i8] c"%s : \00", align 1
@func80_str2 = private unnamed_addr constant [2 x i8] c")\00", align 1
@func82_str1 = private unnamed_addr constant [2 x i8] c"{\00", align 1
@func82_func83_str1 = private unnamed_addr constant [7 x i8] c"<%%s> \00", align 1
@func82_str2 = private unnamed_addr constant [2 x i8] c"}\00", align 1
@func84_str1 = private unnamed_addr constant [5 x i8] c"[%d]\00", align 1
@func85_str1 = private unnamed_addr constant [3 x i8] c"[]\00", align 1
@func86_str1 = private unnamed_addr constant [5 x i8] c" -> \00", align 1
@func87_str1 = private unnamed_addr constant [16 x i8] c"#ValueForbidden\00", align 1
@func87_str2 = private unnamed_addr constant [13 x i8] c"#ValuePoison\00", align 1
@func87_str3 = private unnamed_addr constant [16 x i8] c"#ValueUndefined\00", align 1
@func87_str4 = private unnamed_addr constant [16 x i8] c"#ValueImmediate\00", align 1
@func87_str5 = private unnamed_addr constant [18 x i8] c"#ValueGlobalConst\00", align 1
@func87_str6 = private unnamed_addr constant [16 x i8] c"#ValueGlobalVar\00", align 1
@func87_str7 = private unnamed_addr constant [12 x i8] c"#ValueParam\00", align 1
@func87_str8 = private unnamed_addr constant [17 x i8] c"#ValueLocalConst\00", align 1
@func87_str9 = private unnamed_addr constant [15 x i8] c"#ValueLocalVar\00", align 1
@func87_str10 = private unnamed_addr constant [10 x i8] c"#ValueRef\00", align 1
@func87_str11 = private unnamed_addr constant [12 x i8] c"#ValueDeref\00", align 1
@func87_str12 = private unnamed_addr constant [10 x i8] c"#ValueNot\00", align 1
@func87_str13 = private unnamed_addr constant [12 x i8] c"#ValueMinus\00", align 1
@func87_str14 = private unnamed_addr constant [11 x i8] c"#ValuePlus\00", align 1
@func87_str15 = private unnamed_addr constant [10 x i8] c"#ValueAdd\00", align 1
@func87_str16 = private unnamed_addr constant [10 x i8] c"#ValueSub\00", align 1
@func87_str17 = private unnamed_addr constant [10 x i8] c"#ValueMul\00", align 1
@func87_str18 = private unnamed_addr constant [10 x i8] c"#ValueDiv\00", align 1
@func87_str19 = private unnamed_addr constant [10 x i8] c"#ValueMod\00", align 1
@func87_str20 = private unnamed_addr constant [9 x i8] c"#ValueOr\00", align 1
@func87_str21 = private unnamed_addr constant [10 x i8] c"#ValueXor\00", align 1
@func87_str22 = private unnamed_addr constant [10 x i8] c"#ValueAnd\00", align 1
@func87_str23 = private unnamed_addr constant [9 x i8] c"#ValueEq\00", align 1
@func87_str24 = private unnamed_addr constant [9 x i8] c"#ValueNe\00", align 1
@func87_str25 = private unnamed_addr constant [9 x i8] c"#ValueLt\00", align 1
@func87_str26 = private unnamed_addr constant [9 x i8] c"#ValueGt\00", align 1
@func87_str27 = private unnamed_addr constant [9 x i8] c"#ValueLe\00", align 1
@func87_str28 = private unnamed_addr constant [9 x i8] c"#ValueGe\00", align 1
@func87_str29 = private unnamed_addr constant [11 x i8] c"#ValueLoad\00", align 1
@func87_str30 = private unnamed_addr constant [10 x i8] c"#ValueShl\00", align 1
@func87_str31 = private unnamed_addr constant [10 x i8] c"#ValueShr\00", align 1
@func87_str32 = private unnamed_addr constant [11 x i8] c"#ValueCall\00", align 1
@func87_str33 = private unnamed_addr constant [12 x i8] c"#ValueIndex\00", align 1
@func87_str34 = private unnamed_addr constant [13 x i8] c"#ValueAccess\00", align 1
@func87_str35 = private unnamed_addr constant [11 x i8] c"#ValueCast\00", align 1
@func87_str36 = private unnamed_addr constant [13 x i8] c"#ValueSelect\00", align 1
@func87_str37 = private unnamed_addr constant [21 x i8] c"<unknown-value-kind>\00", align 1
@func87_str38 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@func88_str1 = private unnamed_addr constant [7 x i8] c"value:\00", align 1
@func88_str2 = private unnamed_addr constant [7 x i8] c"type: \00", align 1
@func88_func89_str1 = private unnamed_addr constant [16 x i8] c"#ValueForbidden\00", align 1
@func88_func90_str1 = private unnamed_addr constant [13 x i8] c"#ValuePoison\00", align 1
@func88_str3 = private unnamed_addr constant [4 x i8] c"add\00", align 1
@func88_str4 = private unnamed_addr constant [4 x i8] c"sub\00", align 1
@func88_str5 = private unnamed_addr constant [4 x i8] c"mul\00", align 1
@func88_str6 = private unnamed_addr constant [4 x i8] c"div\00", align 1
@func88_str7 = private unnamed_addr constant [4 x i8] c"mod\00", align 1
@func88_str8 = private unnamed_addr constant [3 x i8] c"or\00", align 1
@func88_str9 = private unnamed_addr constant [4 x i8] c"xor\00", align 1
@func88_str10 = private unnamed_addr constant [4 x i8] c"and\00", align 1
@func88_str11 = private unnamed_addr constant [3 x i8] c"eq\00", align 1
@func88_str12 = private unnamed_addr constant [3 x i8] c"ne\00", align 1
@func88_str13 = private unnamed_addr constant [3 x i8] c"lt\00", align 1
@func88_str14 = private unnamed_addr constant [3 x i8] c"gt\00", align 1
@func88_str15 = private unnamed_addr constant [3 x i8] c"le\00", align 1
@func88_str16 = private unnamed_addr constant [3 x i8] c"ge\00", align 1
@func104_str1 = private unnamed_addr constant [10 x i8] c"value %s\0A\00", align 1
@func104_str2 = private unnamed_addr constant [11 x i8] c"left_type:\00", align 1
@func104_str3 = private unnamed_addr constant [12 x i8] c"right_type:\00", align 1
@cfgLibraryVar = private unnamed_addr constant [10 x i8] c"MINOR_LIB\00", align 1
@func113_str1 = private unnamed_addr constant [21 x i8] c"\0A%c[0;%dm%s:%c[0m %s\00", align 1
@func114_str1 = private unnamed_addr constant [30 x i8] c"\0A%c[0;%dm%s%c[0m (%s:%d) : %s\00", align 1
@func115_str1 = private unnamed_addr constant [5 x i8] c"info\00", align 1
@func115_str2 = private unnamed_addr constant [5 x i8] c"info\00", align 1
@func115_str3 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func116_str1 = private unnamed_addr constant [8 x i8] c"warning\00", align 1
@func116_str2 = private unnamed_addr constant [8 x i8] c"warning\00", align 1
@func116_str3 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func116_str4 = private unnamed_addr constant [14 x i8] c"*** STOP ***\0A\00", align 1
@func117_str1 = private unnamed_addr constant [6 x i8] c"error\00", align 1
@func117_str2 = private unnamed_addr constant [6 x i8] c"error\00", align 1
@func117_str3 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func117_str4 = private unnamed_addr constant [14 x i8] c"*** STOP ***\0A\00", align 1
@func118_str1 = private unnamed_addr constant [17 x i8] c"\0A%c[0;%dm%s%c[0m\00", align 1
@func118_str2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func119_str1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func119_str2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func120_str1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func120_str2 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@func120_str3 = private unnamed_addr constant [2 x i8] c" \00", align 1
@func120_str4 = private unnamed_addr constant [15 x i8] c"%c[0;%dm^%c[0m\00", align 1
@func121_str1 = private unnamed_addr constant [6 x i8] c"fatal\00", align 1
@func122_str1 = private unnamed_addr constant [11 x i8] c"type error\00", align 1
@func122_str2 = private unnamed_addr constant [16 x i8] c"type expected: \00", align 1
@func122_str3 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func122_str4 = private unnamed_addr constant [16 x i8] c"type received: \00", align 1
@func122_str5 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func132_str1 = private unnamed_addr constant [5 x i8] c"self\00", align 1
@func134_str1 = private unnamed_addr constant [35 x i8] c"value bind error: id already bound\00", align 1
@func134_str2 = private unnamed_addr constant [19 x i8] c"first defined here\00", align 1
@func140_str1 = private unnamed_addr constant [5 x i8] c"Self\00", align 1
@func142_str1 = private unnamed_addr constant [3 x i8] c"%u\00", align 1
@func143_str1 = private unnamed_addr constant [6 x i8] c".type\00", align 1
@func144_str1 = private unnamed_addr constant [2 x i8] c"_\00", align 1
@func144_str2 = private unnamed_addr constant [1 x i8] c"\00", align 1
@func146_str1 = private unnamed_addr constant [5 x i8] c"func\00", align 1
@func147_str1 = private unnamed_addr constant [4 x i8] c"str\00", align 1
@func147_str2 = private unnamed_addr constant [4 x i8] c"str\00", align 1
@func148_str1 = private unnamed_addr constant [4 x i8] c"arr\00", align 1
@func149_str1 = private unnamed_addr constant [4 x i8] c"var\00", align 1
@func150_str1 = private unnamed_addr constant [5 x i8] c"Type\00", align 1
@func151_str1 = private unnamed_addr constant [2 x i8] c"/\00", align 1
@func154_str1 = private unnamed_addr constant [11 x i8] c"module=%s\0A\00", align 1
@func154_str2 = private unnamed_addr constant [17 x i8] c"module not exist\00", align 1
@func156_str1 = private unnamed_addr constant [23 x i8] c"unexpected end-of-file\00", align 1
@func156_str2 = private unnamed_addr constant [16 x i8] c"too long token\0A\00", align 1
@func157_str1 = private unnamed_addr constant [2 x i8] c" \00", align 1
@func157_str2 = private unnamed_addr constant [2 x i8] c"\09\00", align 1
@func158_str1 = private unnamed_addr constant [2 x i8] c">\00", align 1
@func159_str1 = private unnamed_addr constant [2 x i8] c"/\00", align 1
@func159_str2 = private unnamed_addr constant [2 x i8] c"*\00", align 1
@func160_str1 = private unnamed_addr constant [2 x i8] c">\00", align 1
@func160_str2 = private unnamed_addr constant [2 x i8] c"=\00", align 1
@func161_str1 = private unnamed_addr constant [2 x i8] c"<\00", align 1
@func161_str2 = private unnamed_addr constant [2 x i8] c"=\00", align 1
@func162_str1 = private unnamed_addr constant [2 x i8] c"=\00", align 1
@func162_str2 = private unnamed_addr constant [2 x i8] c">\00", align 1
@func163_str1 = private unnamed_addr constant [2 x i8] c"=\00", align 1
@func164_str1 = private unnamed_addr constant [2 x i8] c"=\00", align 1
@func165_str1 = private unnamed_addr constant [2 x i8] c"_\00", align 1
@func165_str2 = private unnamed_addr constant [2 x i8] c"-\00", align 1
@func167_str1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func170_str1 = private unnamed_addr constant [2 x i8] c"_\00", align 1
@func170_str2 = private unnamed_addr constant [2 x i8] c"#\00", align 1
@func170_str3 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func170_str4 = private unnamed_addr constant [2 x i8] c":\00", align 1
@func170_str5 = private unnamed_addr constant [2 x i8] c"=\00", align 1
@func170_str6 = private unnamed_addr constant [2 x i8] c"-\00", align 1
@func170_str7 = private unnamed_addr constant [2 x i8] c"/\00", align 1
@func170_str8 = private unnamed_addr constant [2 x i8] c">\00", align 1
@func170_str9 = private unnamed_addr constant [2 x i8] c"<\00", align 1
@func170_str10 = private unnamed_addr constant [2 x i8] c"!\00", align 1
@func170_str11 = private unnamed_addr constant [2 x i8] c"\22\00", align 1
@func172_str1 = private unnamed_addr constant [2 x i8] c"/\00", align 1
@func172_str2 = private unnamed_addr constant [2 x i8] c"*\00", align 1
@func172_str3 = private unnamed_addr constant [23 x i8] c"unexpected end-of-file\00", align 1
@func172_str4 = private unnamed_addr constant [2 x i8] c"*\00", align 1
@func172_str5 = private unnamed_addr constant [2 x i8] c"/\00", align 1
@func172_str6 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func173_str1 = private unnamed_addr constant [2 x i8] c"\22\00", align 1
@func173_str2 = private unnamed_addr constant [23 x i8] c"unexpected end-of-file\00", align 1
@func173_str3 = private unnamed_addr constant [2 x i8] c"\5C\00", align 1
@func173_str4 = private unnamed_addr constant [2 x i8] c"n\00", align 1
@func173_str5 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func173_str6 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@func173_str7 = private unnamed_addr constant [2 x i8] c"\0D\00", align 1
@func173_str8 = private unnamed_addr constant [2 x i8] c"t\00", align 1
@func173_str9 = private unnamed_addr constant [2 x i8] c"\09\00", align 1
@func173_str10 = private unnamed_addr constant [2 x i8] c"\5C\00", align 1
@func173_str11 = private unnamed_addr constant [2 x i8] c"\5C\00", align 1
@func173_str12 = private unnamed_addr constant [2 x i8] c"\22\00", align 1
@func173_str13 = private unnamed_addr constant [2 x i8] c"\22\00", align 1
@func173_str14 = private unnamed_addr constant [2 x i8] c"0\00", align 1
@func173_str15 = private unnamed_addr constant [1 x i8] c"\00", align 1
@func173_str16 = private unnamed_addr constant [2 x i8] c"a\00", align 1
@func173_str17 = private unnamed_addr constant [2 x i8] c"\07\00", align 1
@func173_str18 = private unnamed_addr constant [2 x i8] c"b\00", align 1
@func173_str19 = private unnamed_addr constant [2 x i8] c"\08\00", align 1
@func173_str20 = private unnamed_addr constant [2 x i8] c"v\00", align 1
@func173_str21 = private unnamed_addr constant [2 x i8] c"\0B\00", align 1
@func173_str22 = private unnamed_addr constant [17 x i8] c"too long string\0A\00", align 1
@func180_str1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func184_str1 = private unnamed_addr constant [19 x i8] c"expected separator\00", align 1
@func185_str1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func185_str2 = private unnamed_addr constant [2 x i8] c";\00", align 1
@func185_str3 = private unnamed_addr constant [2 x i8] c"}\00", align 1
@func185_str4 = private unnamed_addr constant [2 x i8] c")\00", align 1
@func186_str1 = private unnamed_addr constant [29 x i8] c"lex::skipto not implemented\0A\00", align 1
@func186_str2 = private unnamed_addr constant [12 x i8] c"tok = '%s'\0A\00", align 1
@func186_str3 = private unnamed_addr constant [18 x i8] c"skip_target = %s\0A\00", align 1
@func188_str1 = private unnamed_addr constant [18 x i8] c"unexpected symbol\00", align 1
@func188_str2 = private unnamed_addr constant [13 x i8] c"expected %s\0A\00", align 1
@func189_str1 = private unnamed_addr constant [11 x i8] c"ast_id_new\00", align 1
@func190_str1 = private unnamed_addr constant [12 x i8] c"expected id\00", align 1
@func191_str1 = private unnamed_addr constant [2 x i8] c".\00", align 1
@func192_str1 = private unnamed_addr constant [13 x i8] c"ast_node_new\00", align 1
@func193_str1 = private unnamed_addr constant [7 x i8] c"import\00", align 1
@func193_str2 = private unnamed_addr constant [8 x i8] c"arghack\00", align 1
@func193_str3 = private unnamed_addr constant [6 x i8] c"exist\00", align 1
@func193_str4 = private unnamed_addr constant [7 x i8] c"extern\00", align 1
@func195_str1 = private unnamed_addr constant [2 x i8] c"=\00", align 1
@func196_str1 = private unnamed_addr constant [2 x i8] c"=\00", align 1
@func197_str1 = private unnamed_addr constant [18 x i8] c"parse_type malloc\00", align 1
@func198_str1 = private unnamed_addr constant [4 x i8] c"Var\00", align 1
@func198_str2 = private unnamed_addr constant [2 x i8] c"*\00", align 1
@func198_str3 = private unnamed_addr constant [2 x i8] c"{\00", align 1
@func198_str4 = private unnamed_addr constant [2 x i8] c"[\00", align 1
@func198_str5 = private unnamed_addr constant [2 x i8] c"(\00", align 1
@func198_str6 = private unnamed_addr constant [3 x i8] c"->\00", align 1
@func199_str1 = private unnamed_addr constant [2 x i8] c"*\00", align 1
@func200_str1 = private unnamed_addr constant [2 x i8] c"{\00", align 1
@func200_str2 = private unnamed_addr constant [2 x i8] c"}\00", align 1
@func200_str3 = private unnamed_addr constant [2 x i8] c",\00", align 1
@func200_str4 = private unnamed_addr constant [2 x i8] c"}\00", align 1
@func201_str1 = private unnamed_addr constant [2 x i8] c"[\00", align 1
@func201_str2 = private unnamed_addr constant [2 x i8] c"]\00", align 1
@func201_str3 = private unnamed_addr constant [2 x i8] c"]\00", align 1
@func202_str1 = private unnamed_addr constant [2 x i8] c"(\00", align 1
@func202_str2 = private unnamed_addr constant [2 x i8] c")\00", align 1
@func202_str3 = private unnamed_addr constant [14 x i8] c"dofield error\00", align 1
@func202_str4 = private unnamed_addr constant [2 x i8] c",\00", align 1
@func203_str1 = private unnamed_addr constant [2 x i8] c",\00", align 1
@func203_str2 = private unnamed_addr constant [2 x i8] c":\00", align 1
@func204_str1 = private unnamed_addr constant [21 x i8] c"ast_value_new malloc\00", align 1
@func207_str1 = private unnamed_addr constant [3 x i8] c"or\00", align 1
@func208_str1 = private unnamed_addr constant [4 x i8] c"xor\00", align 1
@func209_str1 = private unnamed_addr constant [4 x i8] c"and\00", align 1
@func210_str1 = private unnamed_addr constant [3 x i8] c"==\00", align 1
@func210_str2 = private unnamed_addr constant [3 x i8] c"!=\00", align 1
@func211_str1 = private unnamed_addr constant [2 x i8] c"<\00", align 1
@func211_str2 = private unnamed_addr constant [2 x i8] c">\00", align 1
@func211_str3 = private unnamed_addr constant [3 x i8] c"<=\00", align 1
@func211_str4 = private unnamed_addr constant [3 x i8] c">=\00", align 1
@func212_str1 = private unnamed_addr constant [3 x i8] c"<<\00", align 1
@func212_str2 = private unnamed_addr constant [3 x i8] c">>\00", align 1
@func213_str1 = private unnamed_addr constant [2 x i8] c"+\00", align 1
@func213_str2 = private unnamed_addr constant [2 x i8] c"-\00", align 1
@func214_str1 = private unnamed_addr constant [2 x i8] c"*\00", align 1
@func214_str2 = private unnamed_addr constant [2 x i8] c"/\00", align 1
@func214_str3 = private unnamed_addr constant [2 x i8] c"%\00", align 1
@func215_str1 = private unnamed_addr constant [3 x i8] c"to\00", align 1
@func216_str1 = private unnamed_addr constant [2 x i8] c"*\00", align 1
@func216_str2 = private unnamed_addr constant [2 x i8] c"&\00", align 1
@func216_str3 = private unnamed_addr constant [4 x i8] c"not\00", align 1
@func216_str4 = private unnamed_addr constant [2 x i8] c"-\00", align 1
@func216_str5 = private unnamed_addr constant [2 x i8] c"+\00", align 1
@func216_str6 = private unnamed_addr constant [7 x i8] c"sizeof\00", align 1
@func216_str7 = private unnamed_addr constant [23 x i8] c"sizeof expected <type>\00", align 1
@func216_str8 = private unnamed_addr constant [8 x i8] c"alignof\00", align 1
@func216_str9 = private unnamed_addr constant [24 x i8] c"alignof expected <type>\00", align 1
@func217_str1 = private unnamed_addr constant [2 x i8] c"(\00", align 1
@func217_str2 = private unnamed_addr constant [2 x i8] c")\00", align 1
@func217_str3 = private unnamed_addr constant [3 x i8] c",)\00", align 1
@func217_str4 = private unnamed_addr constant [2 x i8] c",\00", align 1
@func217_str5 = private unnamed_addr constant [2 x i8] c")\00", align 1
@func217_str6 = private unnamed_addr constant [2 x i8] c")\00", align 1
@func217_str7 = private unnamed_addr constant [2 x i8] c",\00", align 1
@func217_str8 = private unnamed_addr constant [2 x i8] c"[\00", align 1
@func217_str9 = private unnamed_addr constant [2 x i8] c"]\00", align 1
@func217_str10 = private unnamed_addr constant [2 x i8] c".\00", align 1
@func218_str1 = private unnamed_addr constant [2 x i8] c"(\00", align 1
@func218_str2 = private unnamed_addr constant [2 x i8] c")\00", align 1
@func219_func220_str1 = private unnamed_addr constant [19 x i8] c"unexpected symbol\0A\00", align 1
@func219_func220_str2 = private unnamed_addr constant [14 x i8] c"received: %s\0A\00", align 1
@func219_func220_str3 = private unnamed_addr constant [9 x i8] c"bad term\00", align 1
@func221_str1 = private unnamed_addr constant [5 x i8] c"func\00", align 1
@func221_str2 = private unnamed_addr constant [7 x i8] c"extern\00", align 1
@func221_str3 = private unnamed_addr constant [6 x i8] c"array\00", align 1
@func221_str4 = private unnamed_addr constant [7 x i8] c"select\00", align 1
@func222_str1 = private unnamed_addr constant [2 x i8] c"{\00", align 1
@func222_str2 = private unnamed_addr constant [2 x i8] c"}\00", align 1
@func222_str3 = private unnamed_addr constant [5 x i8] c"else\00", align 1
@func222_str4 = private unnamed_addr constant [3 x i8] c"=>\00", align 1
@func222_str5 = private unnamed_addr constant [3 x i8] c"=>\00", align 1
@func225_str1 = private unnamed_addr constant [2 x i8] c"{\00", align 1
@func228_str1 = private unnamed_addr constant [21 x i8] c"ast_value_new malloc\00", align 1
@func229_str1 = private unnamed_addr constant [2 x i8] c"=\00", align 1
@func229_str2 = private unnamed_addr constant [2 x i8] c"_\00", align 1
@func229_func230_str1 = private unnamed_addr constant [2 x i8] c":\00", align 1
@func229_str3 = private unnamed_addr constant [4 x i8] c"let\00", align 1
@func229_str4 = private unnamed_addr constant [2 x i8] c"{\00", align 1
@func229_str5 = private unnamed_addr constant [3 x i8] c"if\00", align 1
@func229_str6 = private unnamed_addr constant [6 x i8] c"while\00", align 1
@func229_str7 = private unnamed_addr constant [7 x i8] c"return\00", align 1
@func229_str8 = private unnamed_addr constant [6 x i8] c"break\00", align 1
@func229_str9 = private unnamed_addr constant [9 x i8] c"continue\00", align 1
@func229_str10 = private unnamed_addr constant [5 x i8] c"type\00", align 1
@func229_str11 = private unnamed_addr constant [5 x i8] c"goto\00", align 1
@func231_str1 = private unnamed_addr constant [3 x i8] c":=\00", align 1
@func232_str1 = private unnamed_addr constant [2 x i8] c"=\00", align 1
@func233_str1 = private unnamed_addr constant [2 x i8] c"=\00", align 1
@func234_str1 = private unnamed_addr constant [2 x i8] c"}\00", align 1
@func234_str2 = private unnamed_addr constant [23 x i8] c"unexpected end-of-file\00", align 1
@func234_str3 = private unnamed_addr constant [2 x i8] c"}\00", align 1
@func235_str1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func235_str2 = private unnamed_addr constant [2 x i8] c"{\00", align 1
@func235_str3 = private unnamed_addr constant [5 x i8] c"else\00", align 1
@func235_str4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func235_str5 = private unnamed_addr constant [3 x i8] c"if\00", align 1
@func235_str6 = private unnamed_addr constant [2 x i8] c"{\00", align 1
@func236_str1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func236_str2 = private unnamed_addr constant [2 x i8] c"{\00", align 1
@func237_str1 = private unnamed_addr constant [27 x i8] c"expected return expression\00", align 1
@func241_str1 = private unnamed_addr constant [2 x i8] c")\00", align 1
@func241_str2 = private unnamed_addr constant [2 x i8] c",\00", align 1
@func241_str3 = private unnamed_addr constant [2 x i8] c":\00", align 1
@func242_str1 = private unnamed_addr constant [2 x i8] c"(\00", align 1
@func242_str2 = private unnamed_addr constant [2 x i8] c"[\00", align 1
@func242_str3 = private unnamed_addr constant [2 x i8] c"{\00", align 1
@func242_str4 = private unnamed_addr constant [2 x i8] c"*\00", align 1
@func244_func245_str1 = private unnamed_addr constant [38 x i8] c"e-m:o-i64:64-f80:128-n8:16:32:64-S128\00", align 1
@func244_func245_str2 = private unnamed_addr constant [27 x i8] c"x86_64-apple-macosx10.15.0\00", align 1
@func244_func246_str1 = private unnamed_addr constant [48 x i8] c"e-m:e-p:32:32-i64:64-v128:64:128-a:0:32-n32-S64\00", align 1
@func244_func246_str2 = private unnamed_addr constant [28 x i8] c"thumbv7em-unknown-none-eabi\00", align 1
@func248_str1 = private unnamed_addr constant [36 x i8] c"assembly::definition_new : x != nil\00", align 1
@func255_str1 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@func256_str1 = private unnamed_addr constant [4 x i8] c"\0A%s\00", align 1
@func257_str1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func258_str1 = private unnamed_addr constant [2 x i8] c" \00", align 1
@func259_str1 = private unnamed_addr constant [3 x i8] c", \00", align 1
@func262_str1 = private unnamed_addr constant [20 x i8] c"print_assembly: %s\0A\00", align 1
@func262_str2 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@func262_str3 = private unnamed_addr constant [26 x i8] c"cannot create output file\00", align 1
@func262_str4 = private unnamed_addr constant [16 x i8] c"; assembly: %s\0A\00", align 1
@func262_str5 = private unnamed_addr constant [27 x i8] c"; clang out2.ll && ./a.out\00", align 1
@func262_str6 = private unnamed_addr constant [44 x i8] c"; llc out2.ll ; for create .s file from .ll\00", align 1
@func262_str7 = private unnamed_addr constant [26 x i8] c"target datalayout = \22%s\22\0A\00", align 1
@func262_str8 = private unnamed_addr constant [22 x i8] c"target triple = \22%s\22\0A\00", align 1
@func262_str9 = private unnamed_addr constant [16 x i8] c"%Bool = type i1\00", align 1
@func262_str10 = private unnamed_addr constant [16 x i8] c"%Unit = type {}\00", align 1
@func262_str11 = private unnamed_addr constant [16 x i8] c"%Str = type i8*\00", align 1
@func262_str12 = private unnamed_addr constant [20 x i8] c"%Numeric = type i64\00", align 1
@func262_func263_str1 = private unnamed_addr constant [17 x i8] c"\0A%%%s = type i%d\00", align 1
@func262_str13 = private unnamed_addr constant [11 x i8] c"\0A\0A;types:\0A\00", align 1
@func262_str14 = private unnamed_addr constant [13 x i8] c"\0A\0A;strings:\0A\00", align 1
@func262_str15 = private unnamed_addr constant [12 x i8] c"\0A\0A;arrays:\0A\00", align 1
@func262_str16 = private unnamed_addr constant [10 x i8] c"\0A\0A;vars:\0A\00", align 1
@func262_str17 = private unnamed_addr constant [11 x i8] c"\0A\0A;funcs:\0A\00", align 1
@func262_str18 = private unnamed_addr constant [13 x i8] c"\0A\0A;aliases:\0A\00", align 1
@func262_str19 = private unnamed_addr constant [14 x i8] c"\0A\0A;metadata:\0A\00", align 1
@func270_str1 = private unnamed_addr constant [14 x i8] c"\0A%%%s = type \00", align 1
@func271_str1 = private unnamed_addr constant [38 x i8] c"\0A@%s = private unnamed_addr constant \00", align 1
@func271_str2 = private unnamed_addr constant [3 x i8] c" [\00", align 1
@func271_str3 = private unnamed_addr constant [12 x i8] c"], align 16\00", align 1
@func273_str1 = private unnamed_addr constant [50 x i8] c"\0A@%s = private unnamed_addr constant [%d x i8] c\22\00", align 1
@func273_str2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func273_str3 = private unnamed_addr constant [2 x i8] c"\0D\00", align 1
@func273_str4 = private unnamed_addr constant [2 x i8] c"\09\00", align 1
@func273_str5 = private unnamed_addr constant [2 x i8] c"\0B\00", align 1
@func273_str6 = private unnamed_addr constant [2 x i8] c"\07\00", align 1
@func273_str7 = private unnamed_addr constant [2 x i8] c"\08\00", align 1
@func273_str8 = private unnamed_addr constant [2 x i8] c"\5C\00", align 1
@func273_str9 = private unnamed_addr constant [2 x i8] c"\22\00", align 1
@func273_str10 = private unnamed_addr constant [6 x i8] c"\5C%02X\00", align 1
@func273_str11 = private unnamed_addr constant [3 x i8] c"%c\00", align 1
@func273_str12 = private unnamed_addr constant [16 x i8] c"\5C%02d\22, align 1\00", align 1
@func274_str1 = private unnamed_addr constant [15 x i8] c"\0A@%s = global \00", align 1
@func274_str2 = private unnamed_addr constant [16 x i8] c"zeroinitializer\00", align 1
@func274_str3 = private unnamed_addr constant [29 x i8] c"expected constant init value\00", align 1
@func274_str4 = private unnamed_addr constant [16 x i8] c"zeroinitializer\00", align 1
@func275_str1 = private unnamed_addr constant [20 x i8] c"prn/funcdef t = nil\00", align 1
@func275_str2 = private unnamed_addr constant [9 x i8] c"\0Adeclare\00", align 1
@func275_str3 = private unnamed_addr constant [9 x i8] c"\0A\0Adefine\00", align 1
@func275_str4 = private unnamed_addr constant [5 x i8] c"void\00", align 1
@func275_str5 = private unnamed_addr constant [7 x i8] c" @%s (\00", align 1
@func275_str6 = private unnamed_addr constant [6 x i8] c", ...\00", align 1
@func275_str7 = private unnamed_addr constant [2 x i8] c")\00", align 1
@func275_str8 = private unnamed_addr constant [3 x i8] c" {\00", align 1
@func275_str9 = private unnamed_addr constant [12 x i8] c"\0A  ret void\00", align 1
@func275_str10 = private unnamed_addr constant [3 x i8] c"\0A}\00", align 1
@func277_str1 = private unnamed_addr constant [14 x i8] c"\0A@%s = alias \00", align 1
@func277_str2 = private unnamed_addr constant [6 x i8] c"* @%s\00", align 1
@func282_str1 = private unnamed_addr constant [14 x i8] c"\0A  %%%d = %s \00", align 1
@func283_str1 = private unnamed_addr constant [23 x i8] c"getelementptr inbounds\00", align 1
@func283_str2 = private unnamed_addr constant [3 x i8] c"* \00", align 1
@func284_str1 = private unnamed_addr constant [13 x i8] c"extractvalue\00", align 1
@func284_str2 = private unnamed_addr constant [5 x i8] c", %u\00", align 1
@func285_func286_str1 = private unnamed_addr constant [28 x i8] c"error eval #ValueUndefined\0A\00", align 1
@func287_str1 = private unnamed_addr constant [4 x i8] c"\0A  \00", align 1
@func287_str2 = private unnamed_addr constant [8 x i8] c"%%%d = \00", align 1
@func287_str3 = private unnamed_addr constant [6 x i8] c"call \00", align 1
@func287_str4 = private unnamed_addr constant [3 x i8] c" (\00", align 1
@func287_str5 = private unnamed_addr constant [2 x i8] c")\00", align 1
@func289_str1 = private unnamed_addr constant [21 x i8] c"\0A; eval index uarray\00", align 1
@func290_func291_str1 = private unnamed_addr constant [15 x i8] c"\0A; index array\00", align 1
@func290_func291_str2 = private unnamed_addr constant [7 x i8] c"i1 0, \00", align 1
@func292_str1 = private unnamed_addr constant [29 x i8] c"print/expr:: x.field == nil\0A\00", align 1
@func292_str2 = private unnamed_addr constant [13 x i8] c"i1 0, i32 %u\00", align 1
@func293_str1 = private unnamed_addr constant [5 x i8] c"i1 0\00", align 1
@func295_str1 = private unnamed_addr constant [4 x i8] c"xor\00", align 1
@func295_str2 = private unnamed_addr constant [4 x i8] c", 1\00", align 1
@func295_str3 = private unnamed_addr constant [5 x i8] c", -1\00", align 1
@func296_str1 = private unnamed_addr constant [8 x i8] c"sub nsw\00", align 1
@func298_str1 = private unnamed_addr constant [5 x i8] c" to \00", align 1
@func299_str1 = private unnamed_addr constant [9 x i8] c"inttoptr\00", align 1
@func299_str2 = private unnamed_addr constant [8 x i8] c"bitcast\00", align 1
@func300_str1 = private unnamed_addr constant [6 x i8] c"trunc\00", align 1
@func301_str1 = private unnamed_addr constant [6 x i8] c"trunc\00", align 1
@func301_func302_str1 = private unnamed_addr constant [5 x i8] c"sext\00", align 1
@func301_func302_str2 = private unnamed_addr constant [5 x i8] c"zext\00", align 1
@func301_str2 = private unnamed_addr constant [8 x i8] c"bitcast\00", align 1
@func303_str1 = private unnamed_addr constant [6 x i8] c"trunc\00", align 1
@func303_str2 = private unnamed_addr constant [5 x i8] c"zext\00", align 1
@func303_str3 = private unnamed_addr constant [8 x i8] c"bitcast\00", align 1
@func304_str1 = private unnamed_addr constant [9 x i8] c"ptrtoint\00", align 1
@func304_str2 = private unnamed_addr constant [5 x i8] c"zext\00", align 1
@func304_func305_str1 = private unnamed_addr constant [24 x i8] c"\0A<invalid k %d in cast>\00", align 1
@func304_func305_str2 = private unnamed_addr constant [18 x i8] c"e.type.kind = %d\0A\00", align 1
@func304_func305_str3 = private unnamed_addr constant [19 x i8] c"eval_cast_to_basic\00", align 1
@func306_func307_str1 = private unnamed_addr constant [18 x i8] c"eval_cast error:\0A\00", align 1
@func306_func307_str2 = private unnamed_addr constant [6 x i8] c" --> \00", align 1
@func306_func307_str3 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func306_func307_str4 = private unnamed_addr constant [16 x i8] c"eval_cast error\00", align 1
@func309_str1 = private unnamed_addr constant [4 x i8] c"add\00", align 1
@func309_str2 = private unnamed_addr constant [4 x i8] c"sub\00", align 1
@func309_str3 = private unnamed_addr constant [4 x i8] c"mul\00", align 1
@func309_func310_str1 = private unnamed_addr constant [5 x i8] c"sdiv\00", align 1
@func309_func310_str2 = private unnamed_addr constant [5 x i8] c"udiv\00", align 1
@func309_func311_str1 = private unnamed_addr constant [5 x i8] c"srem\00", align 1
@func309_func311_str2 = private unnamed_addr constant [5 x i8] c"urem\00", align 1
@func309_str4 = private unnamed_addr constant [3 x i8] c"or\00", align 1
@func309_str5 = private unnamed_addr constant [4 x i8] c"xor\00", align 1
@func309_str6 = private unnamed_addr constant [4 x i8] c"and\00", align 1
@func309_str7 = private unnamed_addr constant [8 x i8] c"icmp eq\00", align 1
@func309_str8 = private unnamed_addr constant [8 x i8] c"icmp ne\00", align 1
@func309_func312_str1 = private unnamed_addr constant [9 x i8] c"icmp slt\00", align 1
@func309_func312_str2 = private unnamed_addr constant [9 x i8] c"icmp ult\00", align 1
@func309_func313_str1 = private unnamed_addr constant [9 x i8] c"icmp sgt\00", align 1
@func309_func313_str2 = private unnamed_addr constant [9 x i8] c"icmp ugt\00", align 1
@func309_func314_str1 = private unnamed_addr constant [9 x i8] c"icmp sle\00", align 1
@func309_func314_str2 = private unnamed_addr constant [9 x i8] c"icmp ule\00", align 1
@func309_func315_str1 = private unnamed_addr constant [9 x i8] c"icmp sge\00", align 1
@func309_func315_str2 = private unnamed_addr constant [9 x i8] c"icmp uge\00", align 1
@func309_str9 = private unnamed_addr constant [4 x i8] c"shl\00", align 1
@func309_func316_str1 = private unnamed_addr constant [5 x i8] c"ashr\00", align 1
@func309_func316_str2 = private unnamed_addr constant [5 x i8] c"lshr\00", align 1
@func309_str10 = private unnamed_addr constant [27 x i8] c"<unknown-binary-operation>\00", align 1
@func317_str1 = private unnamed_addr constant [8 x i8] c"bitcast\00", align 1
@func318_str1 = private unnamed_addr constant [9 x i8] c"inttoptr\00", align 1
@func319_str1 = private unnamed_addr constant [8 x i8] c"bitcast\00", align 1
@func320_str1 = private unnamed_addr constant [26 x i8] c"\0A  br label %%select_%d_0\00", align 1
@func320_func321_str1 = private unnamed_addr constant [15 x i8] c"\0Aselect_%d_%d:\00", align 1
@func320_func321_str2 = private unnamed_addr constant [8 x i8] c"icmp eq\00", align 1
@func320_func321_str3 = private unnamed_addr constant [14 x i8] c"\0A  br i1 %%%d\00", align 1
@func320_func321_str4 = private unnamed_addr constant [48 x i8] c", label %%select_%d_%d_ok, label %%select_%d_%d\00", align 1
@func320_func321_str5 = private unnamed_addr constant [18 x i8] c"\0Aselect_%d_%d_ok:\00", align 1
@func320_func321_str6 = private unnamed_addr constant [28 x i8] c"\0A  br label %%select_%d_end\00", align 1
@func320_str2 = private unnamed_addr constant [15 x i8] c"\0Aselect_%d_%d:\00", align 1
@func320_str3 = private unnamed_addr constant [28 x i8] c"\0A  br label %%select_%d_end\00", align 1
@func320_str4 = private unnamed_addr constant [16 x i8] c"\0Aselect_%d_end:\00", align 1
@func320_str5 = private unnamed_addr constant [4 x i8] c"phi\00", align 1
@func320_str6 = private unnamed_addr constant [30 x i8] c"[ %%%d, %%select_%d_%d_ok ], \00", align 1
@func320_str7 = private unnamed_addr constant [25 x i8] c"[ %%%d, %%select_%d_%d ]\00", align 1
@func323_str1 = private unnamed_addr constant [10 x i8] c"\0A  store \00", align 1
@func323_str2 = private unnamed_addr constant [3 x i8] c"* \00", align 1
@func323_str3 = private unnamed_addr constant [11 x i8] c", align %d\00", align 1
@func324_str1 = private unnamed_addr constant [5 x i8] c"load\00", align 1
@func324_str2 = private unnamed_addr constant [3 x i8] c"* \00", align 1
@func325_str1 = private unnamed_addr constant [16 x i8] c"zeroinitializer\00", align 1
@func325_str2 = private unnamed_addr constant [16 x i8] c"zeroinitializer\00", align 1
@func325_str3 = private unnamed_addr constant [5 x i8] c"%llu\00", align 1
@func326_str1 = private unnamed_addr constant [5 x i8] c"%%%d\00", align 1
@func326_str2 = private unnamed_addr constant [5 x i8] c"%%%d\00", align 1
@func326_str3 = private unnamed_addr constant [4 x i8] c"@%s\00", align 1
@func326_str4 = private unnamed_addr constant [4 x i8] c"@%s\00", align 1
@func326_str5 = private unnamed_addr constant [5 x i8] c"%%%d\00", align 1
@func326_str6 = private unnamed_addr constant [32 x i8] c"<LLVM_ValueInvalid x.kind = %d>\00", align 1
@func328_str1 = private unnamed_addr constant [12 x i8] c"insertvalue\00", align 1
@func328_str2 = private unnamed_addr constant [9 x i8] c" undef, \00", align 1
@func329_str1 = private unnamed_addr constant [10 x i8] c"\0A;stmt%d:\00", align 1
@func329_str2 = private unnamed_addr constant [22 x i8] c"<print::stmt_unknown>\00", align 1
@func330_str1 = private unnamed_addr constant [7 x i8] c"alloca\00", align 1
@func332_str1 = private unnamed_addr constant [10 x i8] c"\0A  br i1 \00", align 1
@func332_str2 = private unnamed_addr constant [35 x i8] c", label %%then_%d, label %%else_%d\00", align 1
@func332_str3 = private unnamed_addr constant [10 x i8] c"\0Athen_%d:\00", align 1
@func332_str4 = private unnamed_addr constant [23 x i8] c"\0A  br label %%endif_%d\00", align 1
@func332_str5 = private unnamed_addr constant [10 x i8] c"\0Aelse_%d:\00", align 1
@func332_str6 = private unnamed_addr constant [23 x i8] c"\0A  br label %%endif_%d\00", align 1
@func332_str7 = private unnamed_addr constant [11 x i8] c"\0Aendif_%d:\00", align 1
@func333_str1 = private unnamed_addr constant [26 x i8] c"\0A  br label %%continue_%d\00", align 1
@func333_str2 = private unnamed_addr constant [14 x i8] c"\0Acontinue_%d:\00", align 1
@func333_str3 = private unnamed_addr constant [10 x i8] c"\0A  br i1 \00", align 1
@func333_str4 = private unnamed_addr constant [36 x i8] c", label %%body_%d, label %%break_%d\00", align 1
@func333_str5 = private unnamed_addr constant [10 x i8] c"\0Abody_%d:\00", align 1
@func333_str6 = private unnamed_addr constant [26 x i8] c"\0A  br label %%continue_%d\00", align 1
@func333_str7 = private unnamed_addr constant [11 x i8] c"\0Abreak_%d:\00", align 1
@func334_str1 = private unnamed_addr constant [10 x i8] c"\0Aret void\00", align 1
@func334_str2 = private unnamed_addr constant [8 x i8] c"\0A  ret \00", align 1
@func335_str1 = private unnamed_addr constant [23 x i8] c"\0A  br label %%break_%d\00", align 1
@func336_str1 = private unnamed_addr constant [26 x i8] c"\0A  br label %%continue_%d\00", align 1
@func337_str1 = private unnamed_addr constant [17 x i8] c"\0A  br label %%%s\00", align 1
@func338_str1 = private unnamed_addr constant [17 x i8] c"\0A  br label %%%s\00", align 1
@func338_str2 = private unnamed_addr constant [5 x i8] c"\0A%s:\00", align 1
@func341_str1 = private unnamed_addr constant [26 x i8] c"prn/printType :: t = nil\0A\00", align 1
@func341_str2 = private unnamed_addr constant [5 x i8] c"%%%s\00", align 1
@func341_str3 = private unnamed_addr constant [5 x i8] c"%%%s\00", align 1
@func341_str4 = private unnamed_addr constant [4 x i8] c"i%d\00", align 1
@func341_str5 = private unnamed_addr constant [3 x i8] c"i1\00", align 1
@func341_func343_str1 = private unnamed_addr constant [20 x i8] c"<type-unknown-kind>\00", align 1
@func341_func343_str2 = private unnamed_addr constant [18 x i8] c"unk type kind %d\0A\00", align 1
@func345_str1 = private unnamed_addr constant [2 x i8] c"{\00", align 1
@func345_str2 = private unnamed_addr constant [2 x i8] c"}\00", align 1
@func347_str1 = private unnamed_addr constant [7 x i8] c"[%d x \00", align 1
@func347_str2 = private unnamed_addr constant [2 x i8] c"]\00", align 1
@func348_str1 = private unnamed_addr constant [2 x i8] c"*\00", align 1
@func349_str1 = private unnamed_addr constant [2 x i8] c"*\00", align 1
@func350_str1 = private unnamed_addr constant [5 x i8] c"void\00", align 1
@func350_str2 = private unnamed_addr constant [3 x i8] c" (\00", align 1
@func350_str3 = private unnamed_addr constant [6 x i8] c", ...\00", align 1
@func350_str4 = private unnamed_addr constant [2 x i8] c")\00", align 1
@func350_str5 = private unnamed_addr constant [2 x i8] c"*\00", align 1
@func352_str1 = private unnamed_addr constant [9 x i8] c"type_new\00", align 1
@func378_str1 = private unnamed_addr constant [20 x i8] c"alignment : align=0\00", align 1
@func379_func380_str1 = private unnamed_addr constant [14 x i8] c"unknown type3\00", align 1
@func379_func380_func381_func382_str1 = private unnamed_addr constant [10 x i8] c"field_new\00", align 1
@func379_func383_str1 = private unnamed_addr constant [15 x i8] c"undefined type\00", align 1
@func379_func383_str2 = private unnamed_addr constant [11 x i8] c"align 0 in\00", align 1
@func393_str1 = private unnamed_addr constant [5 x i8] c"Void\00", align 1
@func393_str2 = private unnamed_addr constant [5 x i8] c"Void\00", align 1
@func393_str3 = private unnamed_addr constant [5 x i8] c"Unit\00", align 1
@func393_str4 = private unnamed_addr constant [5 x i8] c"Unit\00", align 1
@func393_str5 = private unnamed_addr constant [5 x i8] c"Bool\00", align 1
@func393_str6 = private unnamed_addr constant [5 x i8] c"Int8\00", align 1
@func393_str7 = private unnamed_addr constant [6 x i8] c"Int16\00", align 1
@func393_str8 = private unnamed_addr constant [6 x i8] c"Int32\00", align 1
@func393_str9 = private unnamed_addr constant [6 x i8] c"Int64\00", align 1
@func393_str10 = private unnamed_addr constant [7 x i8] c"Int128\00", align 1
@func393_str11 = private unnamed_addr constant [7 x i8] c"Int256\00", align 1
@func393_str12 = private unnamed_addr constant [7 x i8] c"Int512\00", align 1
@func393_str13 = private unnamed_addr constant [8 x i8] c"Int1024\00", align 1
@func393_str14 = private unnamed_addr constant [5 x i8] c"Nat8\00", align 1
@func393_str15 = private unnamed_addr constant [6 x i8] c"Nat16\00", align 1
@func393_str16 = private unnamed_addr constant [6 x i8] c"Nat32\00", align 1
@func393_str17 = private unnamed_addr constant [6 x i8] c"Nat64\00", align 1
@func393_str18 = private unnamed_addr constant [7 x i8] c"Nat128\00", align 1
@func393_str19 = private unnamed_addr constant [7 x i8] c"Nat256\00", align 1
@func393_str20 = private unnamed_addr constant [7 x i8] c"Nat512\00", align 1
@func393_str21 = private unnamed_addr constant [8 x i8] c"Nat1024\00", align 1
@func393_str22 = private unnamed_addr constant [6 x i8] c"Int64\00", align 1
@func393_str23 = private unnamed_addr constant [6 x i8] c"Nat64\00", align 1
@func393_str24 = private unnamed_addr constant [6 x i8] c"Int32\00", align 1
@func393_str25 = private unnamed_addr constant [6 x i8] c"Nat32\00", align 1
@func393_str26 = private unnamed_addr constant [5 x i8] c"Int8\00", align 1
@func393_str27 = private unnamed_addr constant [5 x i8] c"Nat8\00", align 1
@func393_str28 = private unnamed_addr constant [6 x i8] c"Int16\00", align 1
@func393_str29 = private unnamed_addr constant [6 x i8] c"Nat16\00", align 1
@func393_str30 = private unnamed_addr constant [4 x i8] c"Str\00", align 1
@func393_str31 = private unnamed_addr constant [4 x i8] c"Str\00", align 1
@func393_str32 = private unnamed_addr constant [7 x i8] c"Int128\00", align 1
@func393_str33 = private unnamed_addr constant [7 x i8] c"Int256\00", align 1
@func393_str34 = private unnamed_addr constant [7 x i8] c"Int512\00", align 1
@func393_str35 = private unnamed_addr constant [8 x i8] c"Int1024\00", align 1
@func393_str36 = private unnamed_addr constant [7 x i8] c"Nat128\00", align 1
@func393_str37 = private unnamed_addr constant [7 x i8] c"Nat256\00", align 1
@func393_str38 = private unnamed_addr constant [7 x i8] c"Nat512\00", align 1
@func393_str39 = private unnamed_addr constant [8 x i8] c"Nat1024\00", align 1
@func393_str40 = private unnamed_addr constant [8 x i8] c"Numeric\00", align 1
@func393_func395_str1 = private unnamed_addr constant [27 x i8] c"unsupported cfgIntegerSize\00", align 1
@func396_str1 = private unnamed_addr constant [21 x i8] c"value_new : v != nil\00", align 1
@func401_func402_str1 = private unnamed_addr constant [30 x i8] c"do_value : #AstValueForbidden\00", align 1
@func401_str1 = private unnamed_addr constant [20 x i8] c"do_value : v == nil\00", align 1
@func403_str1 = private unnamed_addr constant [25 x i8] c"expected 'other' variant\00", align 1
@func406_str1 = private unnamed_addr constant [17 x i8] c"expected pointer\00", align 1
@func407_str1 = private unnamed_addr constant [18 x i8] c"binary type error\00", align 1
@func409_func410_str1 = private unnamed_addr constant [21 x i8] c"not enough arguments\00", align 1
@func409_func410_str2 = private unnamed_addr constant [16 x i8] c"excess argument\00", align 1
@func413_str1 = private unnamed_addr constant [16 x i8] c"undefined field\00", align 1
@func416_str1 = private unnamed_addr constant [16 x i8] c"type cast error\00", align 1
@func417_str1 = private unnamed_addr constant [16 x i8] c"type cast error\00", align 1
@func418_str1 = private unnamed_addr constant [16 x i8] c"cast num to ref\00", align 1
@func419_str1 = private unnamed_addr constant [16 x i8] c"type cast error\00", align 1
@func420_str1 = private unnamed_addr constant [16 x i8] c"type cast error\00", align 1
@func421_str1 = private unnamed_addr constant [16 x i8] c"type cast error\00", align 1
@func423_str1 = private unnamed_addr constant [16 x i8] c"type cast error\00", align 1
@func424_str1 = private unnamed_addr constant [16 x i8] c"type cast error\00", align 1
@func425_str1 = private unnamed_addr constant [18 x i8] c"cast to same type\00", align 1
@func425_func426_str1 = private unnamed_addr constant [18 x i8] c"do_value_cast unk\00", align 1
@func427_str1 = private unnamed_addr constant [20 x i8] c"sizeof unknown type\00", align 1
@func428_str1 = private unnamed_addr constant [21 x i8] c"alignof unknown type\00", align 1
@func429_str1 = private unnamed_addr constant [15 x i8] c"unknown value\0A\00", align 1
@func430_str1 = private unnamed_addr constant [2 x i8] c"0\00", align 1
@func430_str2 = private unnamed_addr constant [2 x i8] c"x\00", align 1
@func430_str3 = private unnamed_addr constant [5 x i8] c"%llx\00", align 1
@func430_str4 = private unnamed_addr constant [5 x i8] c"%lld\00", align 1
@func432_str1 = private unnamed_addr constant [5 x i8] c"func\00", align 1
@func432_str2 = private unnamed_addr constant [2 x i8] c"_\00", align 1
@func444_str1 = private unnamed_addr constant [29 x i8] c"implicit_cast::v.type == nil\00", align 1
@func444_str2 = private unnamed_addr constant [24 x i8] c"implicit_cast::t == nil\00", align 1
@func444_str3 = private unnamed_addr constant [14 x i8] c"type overflow\00", align 1
@func452_str1 = private unnamed_addr constant [6 x i8] c"false\00", align 1
@func452_str2 = private unnamed_addr constant [5 x i8] c"true\00", align 1
@func452_str3 = private unnamed_addr constant [4 x i8] c"nil\00", align 1
@func452_str4 = private unnamed_addr constant [5 x i8] c"unit\00", align 1
@func453_str1 = private unnamed_addr constant [9 x i8] c"stmt_new\00", align 1
@func456_str1 = private unnamed_addr constant [16 x i8] c"expected lvalue\00", align 1
@func456_str2 = private unnamed_addr constant [13 x i8] c"invalid lval\00", align 1
@func468_str1 = private unnamed_addr constant [34 x i8] c"`break` outside any loop operator\00", align 1
@func469_str1 = private unnamed_addr constant [34 x i8] c"`break` outside any loop operator\00", align 1
@func473_str1 = private unnamed_addr constant [4 x i8] c"##\0A\00", align 1
@func473_str2 = private unnamed_addr constant [7 x i8] c"<name>\00", align 1
@func477_str1 = private unnamed_addr constant [3 x i8] c".m\00", align 1
@func477_str2 = private unnamed_addr constant [2 x i8] c"/\00", align 1
@func477_str3 = private unnamed_addr constant [3 x i8] c".m\00", align 1
@func477_str4 = private unnamed_addr constant [15 x i8] c"unknown import\00", align 1
@func478_str1 = private unnamed_addr constant [18 x i8] c"type redefination\00", align 1
@func480_str1 = private unnamed_addr constant [19 x i8] c"value redefination\00", align 1
@func480_str2 = private unnamed_addr constant [7 x i8] c"printf\00", align 1
@func480_str3 = private unnamed_addr constant [6 x i8] c"scanf\00", align 1
@func480_str4 = private unnamed_addr constant [7 x i8] c"sscanf\00", align 1
@func480_str5 = private unnamed_addr constant [8 x i8] c"sprintf\00", align 1
@func480_str6 = private unnamed_addr constant [8 x i8] c"fprintf\00", align 1
@func481_func482_str1 = private unnamed_addr constant [15 x i8] c"undefined type\00", align 1
@func488_str1 = private unnamed_addr constant [11 x i8] c"m2 v%d.%d\0A\00", align 1
@func488_str2 = private unnamed_addr constant [7 x i8] c"main.m\00", align 1
@func488_str3 = private unnamed_addr constant [11 x i8] c"lines: %d\0A\00", align 1
@func488_str4 = private unnamed_addr constant [7 x i8] c"out.ll\00", align 1

;arrays:


;vars:

@lines = global %Nat32 0
@typeVoid = global %Type* zeroinitializer
@typeUnit = global %Type* zeroinitializer
@typeBool = global %Type* zeroinitializer
@typeChar = global %Type* zeroinitializer
@typeStr = global %Type* zeroinitializer
@typeBaseInt = global %Type* zeroinitializer
@typeFreePtr = global %Type* zeroinitializer
@typeNumeric = global %Type* zeroinitializer
@ctype = global %Type* zeroinitializer
@fctx = global %FuncContext* zeroinitializer
@asm0 = global %Assembly zeroinitializer
@warncnt = global %Nat32 0
@errcnt = global %Int32 0
@builtinIndex = global %Index zeroinitializer
@module = global %Module* zeroinitializer
@local_type_id_cnt = global %Nat32 0
@func_uid = global %Nat32 0
@str_uid = global %Nat32 0
@arr_uid = global %Nat32 0
@var_uid = global %Nat32 0
@type_uid = global %Nat32 0
@lstate = global %LexerState zeroinitializer
@pstat = global %ParserState zeroinitializer
@external = global i1 0
@comments = global i1 0
@xarghack = global i1 0
@fout = global %FILE* zeroinitializer
@clab = global %Nat32 0
@global_if_id = global %Nat32 0
@global_while_id = global %Nat32 0
@while_id = global %Nat32 0
@blockno = global %Nat32 0
@stmtno = global %Nat32 0
@select_no = global %Nat32 0
@fuid = global %Nat32 0
@imp_list = global %List zeroinitializer

;funcs:

declare %Unit* @malloc (%Nat32)
declare %Unit* @memset (%Unit*, %Nat8, %Nat32)
declare %Unit* @memcpy (%Unit*, %Unit*, %Nat32)
declare %Int32 @memcmp (%Unit*, %Unit*, %Nat32)
declare void @free (%Unit*)
declare %Int32 @putchar (%Int8)
declare %Int32 @strcmp (%Str, %Str)
declare %Int32 @strncmp (%Str, %Str, %Nat32)
declare %Nat8* @strcpy (%Str, %Str)
declare %Nat32 @strlen (%Str)
declare %Int32 @printf (%Str, ...)
declare %Int32 @scanf (%Str, ...)
declare %Int32 @sscanf (%Unit*, %Str, ...)
declare %Int32 @sprintf (%Unit*, %Str, ...)
declare %Int32 @chdir (%Str)
declare %FILE* @fopen (%Str, %Str)
declare %Int32 @fprintf (%FILE*, %Str, ...)
declare %Int32 @fseek (%FILE*, %Int64, %Int32)
declare %Int32 @fclose (%FILE*)
declare %Int32 @open (%Str, %Int32)
declare %Int32 @read (%Int32, %Nat8*, %Nat32)
declare %Int64 @lseek (%Int32, %Int64, %Int32)
declare %Int32 @close (%Int32)
declare void @exit (%Int32)
declare %DIR* @opendir (%Str)
declare %Int32 @closedir (%DIR*)
declare %Str @getcwd (%Str, %Nat32)
declare %Str @getenv (%Str)

define void @assert (i1, %Str) {
;stmt0:
  %3 = xor i1 %0, 1
  br i1 %3, label %then_0, label %else_0
then_0:
;stmt1:
  %4 = bitcast [19 x %Nat8]* @func29_str1 to %Str
  %5 = call %Int32 (%Str, ...) @printf (%Str %4, %Str %1)
;stmt2:
  call void (%Int32) @exit (%Int32 1)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  ret void
}

define i1 @isLowerCase (%Nat8) {
;stmt0:
; index array
  %2 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func30_str1, i1 0, %Int64 0
  %3 = load %Nat8, %Nat8* %2
  %4 = icmp uge %Nat8 %0, %3
; index array
  %5 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func30_str2, i1 0, %Int64 0
  %6 = load %Nat8, %Nat8* %5
  %7 = icmp ule %Nat8 %0, %6
  %8 = and i1 %4, %7
  ret i1 %8
}

define i1 @isUpperCase (%Nat8) {
;stmt0:
; index array
  %2 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func31_str1, i1 0, %Int64 0
  %3 = load %Nat8, %Nat8* %2
  %4 = icmp uge %Nat8 %0, %3
; index array
  %5 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func31_str2, i1 0, %Int64 0
  %6 = load %Nat8, %Nat8* %5
  %7 = icmp ule %Nat8 %0, %6
  %8 = and i1 %4, %7
  ret i1 %8
}

define i1 @isDigit (%Nat8) {
;stmt0:
; index array
  %2 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func32_str1, i1 0, %Int64 0
  %3 = load %Nat8, %Nat8* %2
  %4 = icmp uge %Nat8 %0, %3
; index array
  %5 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func32_str2, i1 0, %Int64 0
  %6 = load %Nat8, %Nat8* %5
  %7 = icmp ule %Nat8 %0, %6
  %8 = and i1 %4, %7
  ret i1 %8
}

define i1 @isAlpha (%Nat8) {
;stmt0:
  %2 = call i1 (%Nat8) @isLowerCase (%Nat8 %0)
  %3 = call i1 (%Nat8) @isUpperCase (%Nat8 %0)
  %4 = or i1 %2, %3
  ret i1 %4
}

define i1 @isAlNum (%Nat8) {
;stmt0:
  %2 = call i1 (%Nat8) @isAlpha (%Nat8 %0)
  %3 = call i1 (%Nat8) @isDigit (%Nat8 %0)
  %4 = or i1 %2, %3
  ret i1 %4
}

define %Nat32 @slen (%Str) {
;stmt0:
  %2 = alloca %Nat32
  store %Nat32 0, %Nat32* %2, align 4
;stmt1:
  br label %continue_0
continue_0:
  %3 = load %Nat32, %Nat32* %2
; eval index uarray
  %4 = getelementptr inbounds %Nat8, %Nat8* %0, %Nat32 %3
  %5 = load %Nat8, %Nat8* %4
  %6 = icmp ne %Nat8 %5, 0
  br i1 %6, label %body_0, label %break_0
body_0:
;stmt2:
  %7 = load %Nat32, %Nat32* %2
  %8 = add %Nat32 %7, 1
  store %Nat32 %8, %Nat32* %2, align 4
  br label %continue_0
break_0:
;stmt3:
  %9 = load %Nat32, %Nat32* %2
  ret %Nat32 %9
}

define void @strcp (%Str, %Str) {
;stmt0:
  %3 = alloca %Nat32
  store %Nat32 0, %Nat32* %3, align 4
;stmt1:
  br label %continue_0
continue_0:
  br i1 1, label %body_0, label %break_0
body_0:
;stmt2:
  %4 = load %Nat32, %Nat32* %3
; eval index uarray
  %5 = getelementptr inbounds %Nat8, %Nat8* %0, %Nat32 %4
  %6 = load %Nat32, %Nat32* %3
; eval index uarray
  %7 = getelementptr inbounds %Nat8, %Nat8* %1, %Nat32 %6
  %8 = load %Nat8, %Nat8* %7
  store %Nat8 %8, %Nat8* %5, align 1
;stmt3:
  %9 = load %Nat32, %Nat32* %3
  %10 = add %Nat32 %9, 1
  store %Nat32 %10, %Nat32* %3, align 4
;stmt4:
  %11 = load %Nat32, %Nat32* %3
; eval index uarray
  %12 = getelementptr inbounds %Nat8, %Nat8* %1, %Nat32 %11
  %13 = load %Nat8, %Nat8* %12
  %14 = icmp eq %Nat8 %13, 0
  br i1 %14, label %then_0, label %else_0
then_0:
;stmt5:
  br label %break_0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  br label %continue_0
break_0:
  ret void
}

define %Str @str_new (%Nat32) {
;stmt0:
  %2 = add %Nat32 %0, 1
  %3 = call %Unit* (%Nat32) @malloc (%Nat32 %2)
  %4 = bitcast %Unit* %3 to %Str
  ret %Str %4
}

define %Str @dup (%Str) {
;stmt0:
  %2 = call %Nat32 (%Str) @slen (%Str %0)
;stmt1:
  %3 = call %Str (%Nat32) @str_new (%Nat32 %2)
;stmt2:
  call void (%Str, %Str) @strcp (%Str %3, %Str %0)
;stmt3:
  ret %Str %3
}

define %Str @cat (%Str, %Str) {
;stmt0:
  %3 = call %Nat32 (%Str) @slen (%Str %0)
;stmt1:
  %4 = call %Nat32 (%Str) @slen (%Str %1)
;stmt2:
  %5 = add %Nat32 %3, %4
;stmt3:
  %6 = call %Str (%Nat32) @str_new (%Nat32 %5)
;stmt4:
; eval index uarray
  %7 = getelementptr inbounds %Nat8, %Nat8* %6, %Int64 0
  %8 = bitcast %Nat8* %7 to %Str
  call void (%Str, %Str) @strcp (%Str %8, %Str %0)
;stmt5:
; eval index uarray
  %9 = getelementptr inbounds %Nat8, %Nat8* %6, %Nat32 %3
  %10 = bitcast %Nat8* %9 to %Str
  call void (%Str, %Str) @strcp (%Str %10, %Str %1)
;stmt6:
; eval index uarray
  %11 = getelementptr inbounds %Nat8, %Nat8* %6, %Nat32 %5
  store %Nat8 0, %Nat8* %11, align 1
;stmt7:
  ret %Str %6
}

define %Str @cat3 (%Str, %Str, %Str) {
;stmt0:
  %4 = call %Nat32 (%Str) @slen (%Str %0)
;stmt1:
  %5 = call %Nat32 (%Str) @slen (%Str %1)
;stmt2:
  %6 = call %Nat32 (%Str) @slen (%Str %2)
;stmt3:
  %7 = add %Nat32 %4, %5
;stmt4:
  %8 = add %Nat32 %7, %6
;stmt5:
  %9 = call %Str (%Nat32) @str_new (%Nat32 %8)
;stmt6:
; eval index uarray
  %10 = getelementptr inbounds %Nat8, %Nat8* %9, %Int64 0
  %11 = bitcast %Nat8* %10 to %Str
  call void (%Str, %Str) @strcp (%Str %11, %Str %0)
;stmt7:
; eval index uarray
  %12 = getelementptr inbounds %Nat8, %Nat8* %9, %Nat32 %4
  %13 = bitcast %Nat8* %12 to %Str
  call void (%Str, %Str) @strcp (%Str %13, %Str %1)
;stmt8:
; eval index uarray
  %14 = getelementptr inbounds %Nat8, %Nat8* %9, %Nat32 %7
  %15 = bitcast %Nat8* %14 to %Str
  call void (%Str, %Str) @strcp (%Str %15, %Str %2)
;stmt9:
; eval index uarray
  %16 = getelementptr inbounds %Nat8, %Nat8* %9, %Nat32 %8
  store %Nat8 0, %Nat8* %16, align 1
;stmt10:
  ret %Str %9
}

define %Str @cat4 (%Str, %Str, %Str, %Str) {
;stmt0:
  %5 = call %Nat32 (%Str) @slen (%Str %0)
;stmt1:
  %6 = call %Nat32 (%Str) @slen (%Str %1)
;stmt2:
  %7 = call %Nat32 (%Str) @slen (%Str %2)
;stmt3:
  %8 = call %Nat32 (%Str) @slen (%Str %3)
;stmt4:
  %9 = add %Nat32 %5, %6
;stmt5:
  %10 = add %Nat32 %9, %7
;stmt6:
  %11 = add %Nat32 %10, %8
;stmt7:
  %12 = call %Str (%Nat32) @str_new (%Nat32 %11)
;stmt8:
; eval index uarray
  %13 = getelementptr inbounds %Nat8, %Nat8* %12, %Int64 0
  %14 = bitcast %Nat8* %13 to %Str
  call void (%Str, %Str) @strcp (%Str %14, %Str %0)
;stmt9:
; eval index uarray
  %15 = getelementptr inbounds %Nat8, %Nat8* %12, %Nat32 %5
  %16 = bitcast %Nat8* %15 to %Str
  call void (%Str, %Str) @strcp (%Str %16, %Str %1)
;stmt10:
; eval index uarray
  %17 = getelementptr inbounds %Nat8, %Nat8* %12, %Nat32 %9
  %18 = bitcast %Nat8* %17 to %Str
  call void (%Str, %Str) @strcp (%Str %18, %Str %2)
;stmt11:
; eval index uarray
  %19 = getelementptr inbounds %Nat8, %Nat8* %12, %Nat32 %10
  %20 = bitcast %Nat8* %19 to %Str
  call void (%Str, %Str) @strcp (%Str %20, %Str %3)
;stmt12:
; eval index uarray
  %21 = getelementptr inbounds %Nat8, %Nat8* %12, %Nat32 %11
  store %Nat8 0, %Nat8* %21, align 1
;stmt13:
  ret %Str %12
}

define %Str @cat5 (%Str, %Str, %Str, %Str, %Str) {
;stmt0:
  %6 = call %Nat32 (%Str) @slen (%Str %0)
;stmt1:
  %7 = call %Nat32 (%Str) @slen (%Str %1)
;stmt2:
  %8 = call %Nat32 (%Str) @slen (%Str %2)
;stmt3:
  %9 = call %Nat32 (%Str) @slen (%Str %3)
;stmt4:
  %10 = call %Nat32 (%Str) @slen (%Str %4)
;stmt5:
  %11 = add %Nat32 %6, %7
;stmt6:
  %12 = add %Nat32 %11, %8
;stmt7:
  %13 = add %Nat32 %12, %9
;stmt8:
  %14 = add %Nat32 %13, %10
;stmt9:
  %15 = call %Str (%Nat32) @str_new (%Nat32 %14)
;stmt10:
; eval index uarray
  %16 = getelementptr inbounds %Nat8, %Nat8* %15, %Int64 0
  %17 = bitcast %Nat8* %16 to %Str
  call void (%Str, %Str) @strcp (%Str %17, %Str %0)
;stmt11:
; eval index uarray
  %18 = getelementptr inbounds %Nat8, %Nat8* %15, %Nat32 %6
  %19 = bitcast %Nat8* %18 to %Str
  call void (%Str, %Str) @strcp (%Str %19, %Str %1)
;stmt12:
; eval index uarray
  %20 = getelementptr inbounds %Nat8, %Nat8* %15, %Nat32 %11
  %21 = bitcast %Nat8* %20 to %Str
  call void (%Str, %Str) @strcp (%Str %21, %Str %2)
;stmt13:
; eval index uarray
  %22 = getelementptr inbounds %Nat8, %Nat8* %15, %Nat32 %12
  %23 = bitcast %Nat8* %22 to %Str
  call void (%Str, %Str) @strcp (%Str %23, %Str %3)
;stmt14:
; eval index uarray
  %24 = getelementptr inbounds %Nat8, %Nat8* %15, %Nat32 %13
  %25 = bitcast %Nat8* %24 to %Str
  call void (%Str, %Str) @strcp (%Str %25, %Str %4)
;stmt15:
; eval index uarray
  %26 = getelementptr inbounds %Nat8, %Nat8* %15, %Nat32 %14
  store %Nat8 0, %Nat8* %26, align 1
;stmt16:
  ret %Str %15
}

define void @node_init (%Node*) {
;stmt0:
  %2 = bitcast %Node* %0 to %Unit*
  %3 = call %Unit* (%Unit*, %Nat8, %Nat32) @memset (%Unit* %2, %Nat8 0, %Nat32 32)
  ret void
}

define %Node* @node_new (%Nat32) {
;stmt0:
  %2 = add %Nat32 32, %0
  %3 = call %Unit* (%Nat32) @malloc (%Nat32 %2)
  %4 = bitcast %Unit* %3 to %Node*
;stmt1:
  call void (%Node*) @node_init (%Node* %4)
;stmt2:
  ret %Node* %4
}

define void @node_append (%Node*, %Node*) {
;stmt0:
  %3 = getelementptr inbounds %Node, %Node* %0, i1 0, i32 1
  %4 = load %Node*, %Node** %3
;stmt1:
  %5 = icmp ne %Node* %4, zeroinitializer
  br i1 %5, label %then_0, label %else_0
then_0:
;stmt2:
  %6 = getelementptr inbounds %Node, %Node* %1, i1 0, i32 1
  store %Node* %4, %Node** %6, align 8
;stmt3:
  %7 = getelementptr inbounds %Node, %Node* %4, i1 0, i32 0
  store %Node* %1, %Node** %7, align 8
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt4:
  %8 = getelementptr inbounds %Node, %Node* %0, i1 0, i32 1
  store %Node* %1, %Node** %8, align 8
;stmt5:
  %9 = getelementptr inbounds %Node, %Node* %1, i1 0, i32 0
  store %Node* %0, %Node** %9, align 8
  ret void
}

define void @node_exclude (%Node*) {
;stmt0:
  %2 = getelementptr inbounds %Node, %Node* %0, i1 0, i32 0
  %3 = load %Node*, %Node** %2
;stmt1:
  %4 = getelementptr inbounds %Node, %Node* %0, i1 0, i32 1
  %5 = load %Node*, %Node** %4
;stmt2:
  %6 = icmp ne %Node* %3, zeroinitializer
  br i1 %6, label %then_0, label %else_0
then_0:
;stmt3:
  %7 = getelementptr inbounds %Node, %Node* %3, i1 0, i32 1
  store %Node* %5, %Node** %7, align 8
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt4:
  %8 = icmp ne %Node* %5, zeroinitializer
  br i1 %8, label %then_1, label %else_1
then_1:
;stmt5:
  %9 = getelementptr inbounds %Node, %Node* %5, i1 0, i32 0
  store %Node* %3, %Node** %9, align 8
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  ret void
}

define void @node_foreach (%Node*, %NodeForeachHandler, %Unit*) {
;stmt0:
  %4 = icmp eq %Node* %0, zeroinitializer
  br i1 %4, label %then_0, label %else_0
then_0:
;stmt1:
ret void
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt2:
  %6 = alloca %Node*
  store %Node* %0, %Node** %6, align 8
;stmt3:
  %7 = alloca %Nat32
  store %Nat32 0, %Nat32* %7, align 4
;stmt4:
  br label %continue_0
continue_0:
  %8 = load %Node*, %Node** %6
  %9 = icmp ne %Node* %8, zeroinitializer
  br i1 %9, label %body_0, label %break_0
body_0:
;stmt5:
  %10 = load %Node*, %Node** %6
  %11 = load %Nat32, %Nat32* %7
  call void (%Node*, %Unit*, %Nat32) %1 (%Node* %10, %Unit* %2, %Nat32 %11)
;stmt6:
  %12 = load %Node*, %Node** %6
  %13 = getelementptr inbounds %Node, %Node* %12, i1 0, i32 1
  %14 = load %Node*, %Node** %13
  store %Node* %14, %Node** %6, align 8
;stmt7:
  %15 = load %Nat32, %Nat32* %7
  %16 = add %Nat32 %15, 1
  store %Nat32 %16, %Nat32* %7, align 4
  br label %continue_0
break_0:
  ret void
}

define %Node* @node_search (%Node*, %NodeSearchHandler, %Unit*) {
;stmt0:
  %4 = icmp eq %Node* %0, zeroinitializer
  br i1 %4, label %then_0, label %else_0
then_0:
;stmt1:
  ret %Node* zeroinitializer
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt2:
  %6 = alloca %Node*
  store %Node* %0, %Node** %6, align 8
;stmt3:
  %7 = alloca %Nat32
  store %Nat32 0, %Nat32* %7, align 4
;stmt4:
  br label %continue_0
continue_0:
  %8 = load %Node*, %Node** %6
  %9 = icmp ne %Node* %8, zeroinitializer
  br i1 %9, label %body_0, label %break_0
body_0:
;stmt5:
  %10 = load %Node*, %Node** %6
  %11 = load %Nat32, %Nat32* %7
  %12 = call i1 (%Node*, %Unit*, %Nat32) %1 (%Node* %10, %Unit* %2, %Nat32 %11)
  br i1 %12, label %then_1, label %else_1
then_1:
;stmt6:
  %13 = load %Node*, %Node** %6
  ret %Node* %13
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt7:
  %15 = load %Node*, %Node** %6
  %16 = getelementptr inbounds %Node, %Node* %15, i1 0, i32 1
  %17 = load %Node*, %Node** %16
  store %Node* %17, %Node** %6, align 8
;stmt8:
  %18 = load %Nat32, %Nat32* %7
  %19 = add %Nat32 %18, 1
  store %Nat32 %19, %Nat32* %7, align 4
  br label %continue_0
break_0:
;stmt9:
  ret %Node* zeroinitializer
}

define i1 @func50 (%Node*, %Unit*, %Nat32) {
;stmt0:
  %4 = getelementptr inbounds %Node, %Node* %0, i1 0, i32 3
  %5 = load %Unit*, %Unit** %4
  %6 = icmp eq %Unit* %5, %1
  ret i1 %6
}

define %Node* @node_search_by_data (%Node*, %Unit*) {
;stmt0:
  %3 = call %Node* (%Node*, %NodeSearchHandler, %Unit*) @node_search (%Node* %0, %NodeSearchHandler @func50, %Unit* %1)
  ret %Node* %3
}

define void @map_init (%List*) {
;stmt0:
  %2 = bitcast %List* %0 to %Unit*
  %3 = call %Unit* (%Unit*, %Nat8, %Nat32) @memset (%Unit* %2, %Nat8 0, %Nat32 24)
  ret void
}

define %List* @map_new () {
;stmt0:
  %1 = call %Unit* (%Nat32) @malloc (%Nat32 24)
  %2 = bitcast %Unit* %1 to %List*
;stmt1:
  call void (%List*) @map_init (%List* %2)
;stmt2:
  ret %List* %2
}

define i1 @list_append (%List*, %Unit*) {
;stmt0:
  %3 = icmp eq %List* %0, zeroinitializer
  %4 = icmp eq %Unit* %1, zeroinitializer
  %5 = or i1 %3, %4
  br i1 %5, label %then_0, label %else_0
then_0:
;stmt1:
  ret i1 0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt2:
  %7 = call %Node* (%Nat32) @node_new (%Nat32 0)
;stmt3:
  %8 = getelementptr inbounds %Node, %Node* %7, i1 0, i32 3
  store %Unit* %1, %Unit** %8, align 8
;stmt4:
  %9 = getelementptr inbounds %List, %List* %0, i1 0, i32 0
  %10 = load %Node*, %Node** %9
  %11 = icmp eq %Node* %10, zeroinitializer
  br i1 %11, label %then_1, label %else_1
then_1:
;stmt5:
  %12 = getelementptr inbounds %List, %List* %0, i1 0, i32 0
  store %Node* %7, %Node** %12, align 8
  br label %endif_1
else_1:
;stmt6:
  %13 = getelementptr inbounds %List, %List* %0, i1 0, i32 1
  %14 = load %Node*, %Node** %13
  call void (%Node*, %Node*) @node_append (%Node* %14, %Node* %7)
  br label %endif_1
endif_1:
;stmt7:
  %15 = getelementptr inbounds %List, %List* %0, i1 0, i32 1
  store %Node* %7, %Node** %15, align 8
;stmt8:
  %16 = getelementptr inbounds %List, %List* %0, i1 0, i32 2
  %17 = getelementptr inbounds %List, %List* %0, i1 0, i32 2
  %18 = load %Nat64, %Nat64* %17
  %19 = add %Nat64 %18, 1
  store %Nat64 %19, %Nat64* %16, align 8
;stmt9:
  ret i1 1
}

define void @func55 (%Unit*, %Unit*, %Nat32) {
;stmt0:
  %4 = bitcast %Unit* %1 to %List*
;stmt1:
  %5 = call i1 (%List*, %Unit*) @list_append (%List* %4, %Unit* %0)
  ret void
}

define i1 @list_extend (%List*, %List*) {
;stmt0:
  %3 = icmp eq %List* %0, zeroinitializer
  %4 = icmp eq %List* %1, zeroinitializer
  %5 = or i1 %3, %4
  br i1 %5, label %then_0, label %else_0
then_0:
;stmt1:
  ret i1 0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt2:
  %7 = bitcast %List* %0 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @func59 (%List* %1, %ListForeachHandler @func55, %Unit* %7)
;stmt3:
  ret i1 1
}

define i1 @list_subst (%List*, %Unit*, %Unit*) {
;stmt0:
  %4 = getelementptr inbounds %List, %List* %0, i1 0, i32 0
  %5 = load %Node*, %Node** %4
  %6 = call %Node* (%Node*, %Unit*) @node_search_by_data (%Node* %5, %Unit* %1)
;stmt1:
  %7 = icmp eq %Node* %6, zeroinitializer
  br i1 %7, label %then_0, label %else_0
then_0:
;stmt2:
  ret i1 0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt3:
  %9 = getelementptr inbounds %Node, %Node* %6, i1 0, i32 3
  store %Unit* %2, %Unit** %9, align 8
;stmt4:
  ret i1 1
}

define void @list_node_remove (%List*, %Node*) {
;stmt0:
  %3 = getelementptr inbounds %Node, %Node* %1, i1 0, i32 0
  %4 = load %Node*, %Node** %3
;stmt1:
  %5 = getelementptr inbounds %Node, %Node* %1, i1 0, i32 1
  %6 = load %Node*, %Node** %5
;stmt2:
  call void (%Node*) @node_exclude (%Node* %1)
;stmt3:
  %7 = getelementptr inbounds %List, %List* %0, i1 0, i32 0
  %8 = load %Node*, %Node** %7
  %9 = icmp eq %Node* %8, %1
  br i1 %9, label %then_0, label %else_0
then_0:
;stmt4:
  %10 = getelementptr inbounds %List, %List* %0, i1 0, i32 0
  store %Node* %6, %Node** %10, align 8
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt5:
  %11 = getelementptr inbounds %List, %List* %0, i1 0, i32 1
  %12 = load %Node*, %Node** %11
  %13 = icmp eq %Node* %12, %1
  br i1 %13, label %then_1, label %else_1
then_1:
;stmt6:
  %14 = getelementptr inbounds %List, %List* %0, i1 0, i32 1
  store %Node* %4, %Node** %14, align 8
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt7:
  %15 = bitcast %Node* %1 to %Unit*
  call void (%Unit*) @free (%Unit* %15)
;stmt8:
  %16 = getelementptr inbounds %List, %List* %0, i1 0, i32 2
  %17 = getelementptr inbounds %List, %List* %0, i1 0, i32 2
  %18 = load %Nat64, %Nat64* %17
  %19 = sub %Nat64 %18, 1
  store %Nat64 %19, %Nat64* %16, align 8
  ret void
}

define i1 @list_remove (%List*, %Unit*) {
;stmt0:
  %3 = getelementptr inbounds %List, %List* %0, i1 0, i32 0
  %4 = load %Node*, %Node** %3
  %5 = call %Node* (%Node*, %Unit*) @node_search_by_data (%Node* %4, %Unit* %1)
;stmt1:
  %6 = icmp ne %Node* %5, zeroinitializer
;stmt2:
  br i1 %6, label %then_0, label %else_0
then_0:
;stmt3:
  call void (%List*, %Node*) @list_node_remove (%List* %0, %Node* %5)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt4:
  ret i1 %6
}

define void @func59 (%List*, %ListForeachHandler, %Unit*) {
;stmt0:
  %4 = alloca %Nat32
  store %Nat32 0, %Nat32* %4, align 4
;stmt1:
  %5 = alloca %Node*
  %6 = getelementptr inbounds %List, %List* %0, i1 0, i32 0
  %7 = load %Node*, %Node** %6
  store %Node* %7, %Node** %5, align 8
;stmt2:
  br label %continue_0
continue_0:
  %8 = load %Node*, %Node** %5
  %9 = icmp ne %Node* %8, zeroinitializer
  br i1 %9, label %body_0, label %break_0
body_0:
;stmt3:
  %10 = load %Node*, %Node** %5
  %11 = getelementptr inbounds %Node, %Node* %10, i1 0, i32 3
  %12 = load %Unit*, %Unit** %11
  %13 = load %Nat32, %Nat32* %4
  call void (%Unit*, %Unit*, %Nat32) %1 (%Unit* %12, %Unit* %2, %Nat32 %13)
;stmt4:
  %14 = load %Node*, %Node** %5
  %15 = getelementptr inbounds %Node, %Node* %14, i1 0, i32 1
  %16 = load %Node*, %Node** %15
  store %Node* %16, %Node** %5, align 8
;stmt5:
  %17 = load %Nat32, %Nat32* %4
  %18 = add %Nat32 %17, 1
  store %Nat32 %18, %Nat32* %4, align 4
  br label %continue_0
break_0:
  ret void
}

define void @list_foreach2 (%List*, %List*, %ListForeachHandler2, %Unit*) {
;stmt0:
  %5 = alloca %Node*
  %6 = getelementptr inbounds %List, %List* %0, i1 0, i32 0
  %7 = load %Node*, %Node** %6
  store %Node* %7, %Node** %5, align 8
;stmt1:
  %8 = alloca %Node*
  %9 = getelementptr inbounds %List, %List* %1, i1 0, i32 0
  %10 = load %Node*, %Node** %9
  store %Node* %10, %Node** %8, align 8
;stmt2:
  %11 = alloca %Nat32
  store %Nat32 0, %Nat32* %11, align 4
;stmt3:
  br label %continue_0
continue_0:
  %12 = load %Node*, %Node** %5
  %13 = icmp ne %Node* %12, zeroinitializer
  %14 = load %Node*, %Node** %8
  %15 = icmp ne %Node* %14, zeroinitializer
  %16 = and i1 %13, %15
  br i1 %16, label %body_0, label %break_0
body_0:
;stmt4:
  %17 = load %Node*, %Node** %5
  %18 = getelementptr inbounds %Node, %Node* %17, i1 0, i32 3
  %19 = load %Unit*, %Unit** %18
  %20 = load %Node*, %Node** %8
  %21 = getelementptr inbounds %Node, %Node* %20, i1 0, i32 3
  %22 = load %Unit*, %Unit** %21
  %23 = load %Nat32, %Nat32* %11
  call void (%Unit*, %Unit*, %Unit*, %Nat32) %2 (%Unit* %19, %Unit* %22, %Unit* %3, %Nat32 %23)
;stmt5:
  %24 = load %Node*, %Node** %5
  %25 = getelementptr inbounds %Node, %Node* %24, i1 0, i32 1
  %26 = load %Node*, %Node** %25
  store %Node* %26, %Node** %5, align 8
;stmt6:
  %27 = load %Node*, %Node** %8
  %28 = getelementptr inbounds %Node, %Node* %27, i1 0, i32 1
  %29 = load %Node*, %Node** %28
  store %Node* %29, %Node** %8, align 8
;stmt7:
  %30 = load %Nat32, %Nat32* %11
  %31 = add %Nat32 %30, 1
  store %Nat32 %31, %Nat32* %11, align 4
  br label %continue_0
break_0:
  ret void
}

define void @list_while2_or (%List*, %List*, %ListWhileHandler2, %Unit*) {
;stmt0:
  %5 = alloca %Node*
  %6 = getelementptr inbounds %List, %List* %0, i1 0, i32 0
  %7 = load %Node*, %Node** %6
  store %Node* %7, %Node** %5, align 8
;stmt1:
  %8 = alloca %Node*
  %9 = getelementptr inbounds %List, %List* %1, i1 0, i32 0
  %10 = load %Node*, %Node** %9
  store %Node* %10, %Node** %8, align 8
;stmt2:
  %11 = alloca %Nat32
  store %Nat32 0, %Nat32* %11, align 4
;stmt3:
  br label %continue_0
continue_0:
  %12 = load %Node*, %Node** %5
  %13 = icmp ne %Node* %12, zeroinitializer
  %14 = load %Node*, %Node** %8
  %15 = icmp ne %Node* %14, zeroinitializer
  %16 = or i1 %13, %15
  br i1 %16, label %body_0, label %break_0
body_0:
;stmt4:
  %17 = load %Node*, %Node** %5
  br label %select_1_0
select_1_0:
  %18 = icmp eq %Node* %17, zeroinitializer
  br i1 %18, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %19 = bitcast %Unit* zeroinitializer to %Unit*
  br label %select_1_end
select_1_1:
  %20 = load %Node*, %Node** %5
  %21 = getelementptr inbounds %Node, %Node* %20, i1 0, i32 3
  %22 = load %Unit*, %Unit** %21
  br label %select_1_end
select_1_end:
  %23 = phi %Unit* [ %19, %select_1_0_ok ], [ %22, %select_1_1 ]
;stmt5:
  %24 = load %Node*, %Node** %8
  br label %select_2_0
select_2_0:
  %25 = icmp eq %Node* %24, zeroinitializer
  br i1 %25, label %select_2_0_ok, label %select_2_1
select_2_0_ok:
  %26 = bitcast %Unit* zeroinitializer to %Unit*
  br label %select_2_end
select_2_1:
  %27 = load %Node*, %Node** %8
  %28 = getelementptr inbounds %Node, %Node* %27, i1 0, i32 3
  %29 = load %Unit*, %Unit** %28
  br label %select_2_end
select_2_end:
  %30 = phi %Unit* [ %26, %select_2_0_ok ], [ %29, %select_2_1 ]
;stmt6:
  %31 = load %Nat32, %Nat32* %11
  %32 = call i1 (%Unit*, %Unit*, %Unit*, %Nat32) %2 (%Unit* %23, %Unit* %30, %Unit* %3, %Nat32 %31)
  %33 = xor i1 %32, 1
  br i1 %33, label %then_0, label %else_0
then_0:
;stmt7:
  br label %break_0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt8:
  %35 = load %Node*, %Node** %5
  %36 = icmp ne %Node* %35, zeroinitializer
  br i1 %36, label %then_1, label %else_1
then_1:
;stmt9:
  %37 = load %Node*, %Node** %5
  %38 = getelementptr inbounds %Node, %Node* %37, i1 0, i32 1
  %39 = load %Node*, %Node** %38
  store %Node* %39, %Node** %5, align 8
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt10:
  %40 = load %Node*, %Node** %8
  %41 = icmp ne %Node* %40, zeroinitializer
  br i1 %41, label %then_2, label %else_2
then_2:
;stmt11:
  %42 = load %Node*, %Node** %8
  %43 = getelementptr inbounds %Node, %Node* %42, i1 0, i32 1
  %44 = load %Node*, %Node** %43
  store %Node* %44, %Node** %8, align 8
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
;stmt12:
  %45 = load %Nat32, %Nat32* %11
  %46 = add %Nat32 %45, 1
  store %Nat32 %46, %Nat32* %11, align 4
  br label %continue_0
break_0:
  ret void
}

define i1 @list_compare (%List*, %List*, %ListCompareHandler, %Unit*) {
;stmt0:
  %5 = getelementptr inbounds %List, %List* %0, i1 0, i32 2
  %6 = load %Nat64, %Nat64* %5
  %7 = getelementptr inbounds %List, %List* %1, i1 0, i32 2
  %8 = load %Nat64, %Nat64* %7
  %9 = icmp ne %Nat64 %6, %8
  br i1 %9, label %then_0, label %else_0
then_0:
;stmt1:
  ret i1 0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt2:
  %11 = alloca %Node*
  %12 = getelementptr inbounds %List, %List* %0, i1 0, i32 0
  %13 = load %Node*, %Node** %12
  store %Node* %13, %Node** %11, align 8
;stmt3:
  %14 = alloca %Node*
  %15 = getelementptr inbounds %List, %List* %1, i1 0, i32 0
  %16 = load %Node*, %Node** %15
  store %Node* %16, %Node** %14, align 8
;stmt4:
  %17 = alloca %Nat32
  store %Nat32 0, %Nat32* %17, align 4
;stmt5:
  br label %continue_0
continue_0:
  %18 = load %Node*, %Node** %11
  %19 = icmp ne %Node* %18, zeroinitializer
  %20 = load %Node*, %Node** %14
  %21 = icmp ne %Node* %20, zeroinitializer
  %22 = and i1 %19, %21
  br i1 %22, label %body_0, label %break_0
body_0:
;stmt6:
  %23 = load %Node*, %Node** %11
  %24 = getelementptr inbounds %Node, %Node* %23, i1 0, i32 3
  %25 = load %Unit*, %Unit** %24
  %26 = load %Node*, %Node** %14
  %27 = getelementptr inbounds %Node, %Node* %26, i1 0, i32 3
  %28 = load %Unit*, %Unit** %27
  %29 = load %Nat32, %Nat32* %17
  %30 = call i1 (%Unit*, %Unit*, %Unit*, %Nat32) %2 (%Unit* %25, %Unit* %28, %Unit* %3, %Nat32 %29)
  %31 = xor i1 %30, 1
  br i1 %31, label %then_1, label %else_1
then_1:
;stmt7:
  ret i1 0
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt8:
  %33 = load %Node*, %Node** %11
  %34 = getelementptr inbounds %Node, %Node* %33, i1 0, i32 1
  %35 = load %Node*, %Node** %34
  store %Node* %35, %Node** %11, align 8
;stmt9:
  %36 = load %Node*, %Node** %14
  %37 = getelementptr inbounds %Node, %Node* %36, i1 0, i32 1
  %38 = load %Node*, %Node** %37
  store %Node* %38, %Node** %14, align 8
;stmt10:
  %39 = load %Nat32, %Nat32* %17
  %40 = add %Nat32 %39, 1
  store %Nat32 %40, %Nat32* %17, align 4
  br label %continue_0
break_0:
;stmt11:
  ret i1 1
}

define %Unit* @list_search (%List*, %ListSearchHandler, %Unit*) {
;stmt0:
  %4 = icmp eq %List* %0, zeroinitializer
  br i1 %4, label %then_0, label %else_0
then_0:
;stmt1:
  ret %Unit* zeroinitializer
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt2:
  %6 = alloca %Node*
  %7 = getelementptr inbounds %List, %List* %0, i1 0, i32 0
  %8 = load %Node*, %Node** %7
  store %Node* %8, %Node** %6, align 8
;stmt3:
  %9 = alloca %Nat32
  store %Nat32 0, %Nat32* %9, align 4
;stmt4:
  br label %continue_0
continue_0:
  %10 = load %Node*, %Node** %6
  %11 = icmp ne %Node* %10, zeroinitializer
  br i1 %11, label %body_0, label %break_0
body_0:
;stmt5:
  %12 = load %Node*, %Node** %6
  %13 = getelementptr inbounds %Node, %Node* %12, i1 0, i32 3
  %14 = load %Unit*, %Unit** %13
  %15 = load %Nat32, %Nat32* %9
  %16 = call i1 (%Unit*, %Unit*, %Nat32) %1 (%Unit* %14, %Unit* %2, %Nat32 %15)
  br i1 %16, label %then_1, label %else_1
then_1:
;stmt6:
  %17 = load %Node*, %Node** %6
  %18 = getelementptr inbounds %Node, %Node* %17, i1 0, i32 3
  %19 = load %Unit*, %Unit** %18
  ret %Unit* %19
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt7:
  %21 = load %Node*, %Node** %6
  %22 = getelementptr inbounds %Node, %Node* %21, i1 0, i32 1
  %23 = load %Node*, %Node** %22
  store %Node* %23, %Node** %6, align 8
;stmt8:
  %24 = load %Nat32, %Nat32* %9
  %25 = add %Nat32 %24, 1
  store %Nat32 %25, %Nat32* %9, align 4
  br label %continue_0
break_0:
;stmt9:
  ret %Unit* zeroinitializer
}

define %List* @list_map (%List*, %ListMapHandler, %Unit*) {
;stmt0:
  %4 = icmp eq %List* %0, zeroinitializer
  br i1 %4, label %then_0, label %else_0
then_0:
;stmt1:
  ret %List* zeroinitializer
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt2:
  %6 = alloca %Nat32
  store %Nat32 0, %Nat32* %6, align 4
;stmt3:
  %7 = alloca %Node*
  %8 = getelementptr inbounds %List, %List* %0, i1 0, i32 0
  %9 = load %Node*, %Node** %8
  store %Node* %9, %Node** %7, align 8
;stmt4:
  %10 = call %List* () @map_new ()
;stmt5:
  br label %continue_0
continue_0:
  %11 = load %Node*, %Node** %7
  %12 = icmp ne %Node* %11, zeroinitializer
  br i1 %12, label %body_0, label %break_0
body_0:
;stmt6:
  %13 = load %Node*, %Node** %7
  %14 = getelementptr inbounds %Node, %Node* %13, i1 0, i32 3
  %15 = load %Unit*, %Unit** %14
  %16 = load %Nat32, %Nat32* %6
  %17 = call %Unit* (%Unit*, %Unit*, %Nat32) %1 (%Unit* %15, %Unit* %2, %Nat32 %16)
;stmt7:
  %18 = icmp ne %Unit* %17, zeroinitializer
  br i1 %18, label %then_1, label %else_1
then_1:
;stmt8:
  %19 = call i1 (%List*, %Unit*) @list_append (%List* %10, %Unit* %17)
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt9:
  %20 = load %Nat32, %Nat32* %6
  %21 = add %Nat32 %20, 1
  store %Nat32 %21, %Nat32* %6, align 4
;stmt10:
  %22 = load %Node*, %Node** %7
  %23 = getelementptr inbounds %Node, %Node* %22, i1 0, i32 1
  %24 = load %Node*, %Node** %23
  store %Node* %24, %Node** %7, align 8
  br label %continue_0
break_0:
;stmt11:
  ret %List* %10
}

define i1 @map_append (%List*, %Str, %Unit*) {
;stmt0:
  %4 = icmp eq %List* %0, zeroinitializer
  %5 = icmp eq %Str %1, zeroinitializer
  %6 = icmp eq %Unit* %2, zeroinitializer
  %7 = or i1 %5, %6
  %8 = or i1 %4, %7
  br i1 %8, label %then_0, label %else_0
then_0:
;stmt1:
  ret i1 0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt2:
  %10 = call %Node* (%Nat32) @node_new (%Nat32 0)
;stmt3:
  %11 = getelementptr inbounds %Node, %Node* %10, i1 0, i32 2
  %12 = bitcast %Str %1 to %Unit*
  store %Unit* %12, %Unit** %11, align 8
;stmt4:
  %13 = getelementptr inbounds %Node, %Node* %10, i1 0, i32 3
  store %Unit* %2, %Unit** %13, align 8
;stmt5:
  %14 = getelementptr inbounds %List, %List* %0, i1 0, i32 0
  %15 = load %Node*, %Node** %14
  %16 = icmp eq %Node* %15, zeroinitializer
  br i1 %16, label %then_1, label %else_1
then_1:
;stmt6:
  %17 = getelementptr inbounds %List, %List* %0, i1 0, i32 0
  store %Node* %10, %Node** %17, align 8
  br label %endif_1
else_1:
;stmt7:
  %18 = getelementptr inbounds %List, %List* %0, i1 0, i32 1
  %19 = load %Node*, %Node** %18
  call void (%Node*, %Node*) @node_append (%Node* %19, %Node* %10)
  br label %endif_1
endif_1:
;stmt8:
  %20 = getelementptr inbounds %List, %List* %0, i1 0, i32 1
  store %Node* %10, %Node** %20, align 8
;stmt9:
  %21 = getelementptr inbounds %List, %List* %0, i1 0, i32 2
  %22 = getelementptr inbounds %List, %List* %0, i1 0, i32 2
  %23 = load %Nat64, %Nat64* %22
  %24 = add %Nat64 %23, 1
  store %Nat64 %24, %Nat64* %21, align 8
;stmt10:
  ret i1 1
}

define i1 @func67 (%Node*, %Unit*, %Nat32) {
;stmt0:
  %4 = getelementptr inbounds %Node, %Node* %0, i1 0, i32 2
  %5 = load %Unit*, %Unit** %4
  %6 = bitcast %Unit* %5 to %Str
  %7 = bitcast %Unit* %1 to %Str
  %8 = call %Int32 (%Str, %Str) @strcmp (%Str %6, %Str %7)
  %9 = icmp eq %Int32 %8, 0
  ret i1 %9
}

define %Node* @map_list_node_get (%List*, %Str) {
;stmt0:
  %3 = getelementptr inbounds %List, %List* %0, i1 0, i32 0
  %4 = load %Node*, %Node** %3
  %5 = bitcast %Str %1 to %Unit*
  %6 = call %Node* (%Node*, %NodeSearchHandler, %Unit*) @node_search (%Node* %4, %NodeSearchHandler @func67, %Unit* %5)
  ret %Node* %6
}

define void @map_reset (%List*, %Str, %Unit*) {
;stmt0:
  %4 = call %Node* (%List*, %Str) @map_list_node_get (%List* %0, %Str %1)
;stmt1:
  %5 = getelementptr inbounds %Node, %Node* %4, i1 0, i32 3
  store %Unit* %2, %Unit** %5, align 8
  ret void
}

define %Unit* @map_remove (%List*, %Str) {
;stmt0:
  %3 = call %Node* (%List*, %Str) @map_list_node_get (%List* %0, %Str %1)
;stmt1:
  %4 = icmp eq %Node* %3, zeroinitializer
  br i1 %4, label %then_0, label %else_0
then_0:
;stmt2:
  ret %Unit* zeroinitializer
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt3:
  %6 = getelementptr inbounds %Node, %Node* %3, i1 0, i32 3
  %7 = load %Unit*, %Unit** %6
;stmt4:
  call void (%List*, %Node*) @list_node_remove (%List* %0, %Node* %3)
;stmt5:
  ret %Unit* %7
}

define %Unit* @map_get (%List*, %Str) {
;stmt0:
  %3 = call %Node* (%List*, %Str) @map_list_node_get (%List* %0, %Str %1)
;stmt1:
  %4 = icmp ne %Node* %3, zeroinitializer
  br i1 %4, label %then_0, label %else_0
then_0:
;stmt2:
  %5 = getelementptr inbounds %Node, %Node* %3, i1 0, i32 3
  %6 = load %Unit*, %Unit** %5
  ret %Unit* %6
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt3:
  ret %Unit* zeroinitializer
}

define void @map_foreach (%List*, %MapForeachHandler, %Unit*) {
;stmt0:
  %4 = alloca %Node*
  %5 = getelementptr inbounds %List, %List* %0, i1 0, i32 0
  %6 = load %Node*, %Node** %5
  store %Node* %6, %Node** %4, align 8
;stmt1:
  br label %continue_0
continue_0:
  %7 = load %Node*, %Node** %4
  %8 = icmp ne %Node* %7, zeroinitializer
  br i1 %8, label %body_0, label %break_0
body_0:
;stmt2:
  %9 = load %Node*, %Node** %4
  %10 = getelementptr inbounds %Node, %Node* %9, i1 0, i32 2
  %11 = load %Unit*, %Unit** %10
  %12 = load %Node*, %Node** %4
  %13 = getelementptr inbounds %Node, %Node* %12, i1 0, i32 3
  %14 = load %Unit*, %Unit** %13
  call void (%Unit*, %Unit*, %Unit*) %1 (%Unit* %11, %Unit* %14, %Unit* %2)
;stmt3:
  %15 = load %Node*, %Node** %4
  %16 = getelementptr inbounds %Node, %Node* %15, i1 0, i32 1
  %17 = load %Node*, %Node** %16
  store %Node* %17, %Node** %4, align 8
  br label %continue_0
break_0:
  ret void
}

define void @func73 (%Unit*, %Unit*, %Unit*) {
;stmt0:
  %4 = bitcast %Unit* %2 to %List*
;stmt1:
  %5 = bitcast %Unit* %0 to %Str
  %6 = call i1 (%List*, %Str, %Unit*) @map_append (%List* %4, %Str %5, %Unit* %1)
  ret void
}

define i1 @map_extend (%List*, %List*) {
;stmt0:
  %3 = icmp eq %List* %0, zeroinitializer
  %4 = icmp eq %List* %1, zeroinitializer
  %5 = or i1 %3, %4
  br i1 %5, label %then_0, label %else_0
then_0:
;stmt1:
  ret i1 0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt2:
  %7 = bitcast %List* %0 to %Unit*
  call void (%List*, %MapForeachHandler, %Unit*) @map_foreach (%List* %1, %MapForeachHandler @func73, %Unit* %7)
;stmt3:
  ret i1 1
}

define i1 @exists (%Str) {
;stmt0:
  %2 = call %Int32 (%Str, %Int32) @open (%Str %0, %Int32 0)
;stmt1:
  %3 = icmp slt %Int32 %2, 0
  br i1 %3, label %then_0, label %else_0
then_0:
;stmt2:
  ret i1 0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt3:
  %5 = call %Int32 (%Int32) @close (%Int32 %2)
;stmt4:
  ret i1 1
}

define i1 @isdir (%Str) {
;stmt0:
  %2 = call %DIR* (%Str) @opendir (%Str %0)
;stmt1:
  %3 = icmp eq %DIR* %2, zeroinitializer
  br i1 %3, label %then_0, label %else_0
then_0:
;stmt2:
  ret i1 0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt3:
  %5 = call %Int32 (%DIR*) @closedir (%DIR* %2)
;stmt4:
  ret i1 1
}

define void @func76 (%Type*) {
;stmt0:
  call void (%Type*, %Type*) @func77 (%Type* %0, %Type* zeroinitializer)
  ret void
}

define void @func77 (%Type*, %Type*) {
;stmt0:
  %3 = icmp eq %Type* %0, zeroinitializer
  br i1 %3, label %then_0, label %else_0
then_0:
;stmt1:
  %4 = bitcast [6 x %Nat8]* @func77_str1 to %Str
  %5 = call %Int32 (%Str, ...) @printf (%Str %4)
;stmt2:
ret void
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt3:
  %7 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 1
  %8 = load %Str, %Str* %7
  %9 = icmp ne %Str %8, zeroinitializer
  br i1 %9, label %then_1, label %else_1
then_1:
;stmt4:
  %10 = bitcast [3 x %Nat8]* @func77_str2 to %Str
  %11 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 1
  %12 = load %Str, %Str* %11
  %13 = call %Int32 (%Str, ...) @printf (%Str %10, %Str %12)
;stmt5:
ret void
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt6:
  %15 = icmp eq %Type* %0, %1
  br i1 %15, label %then_2, label %else_2
then_2:
;stmt7:
  %16 = bitcast [5 x %Nat8]* @func77_str3 to %Str
  %17 = call %Int32 (%Str, ...) @printf (%Str %16)
;stmt8:
ret void
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
;stmt9:
  %19 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 0
  %20 = load %TypeKind, %TypeKind* %19
  br label %select_1_0
select_1_0:
  %21 = icmp eq %TypeKind %20, 4
  br i1 %21, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %22 = bitcast [14 x %Nat8]* @func77_str4 to %Str
  %23 = call %Int32 (%Str, ...) @printf (%Str %22)
  br label %select_1_end
select_1_1:
  %24 = icmp eq %TypeKind %20, 5
  br i1 %24, label %select_1_1_ok, label %select_1_2
select_1_1_ok:
  %25 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 11
  call void (%TypeVar*) @func78 (%TypeVar* %25)
  br label %select_1_end
select_1_2:
  %26 = icmp eq %TypeKind %20, 10
  br i1 %26, label %select_1_2_ok, label %select_1_3
select_1_2_ok:
  %27 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 6
  call void (%TypePointer*, %Type*) @func79 (%TypePointer* %27, %Type* %1)
  br label %select_1_end
select_1_3:
  %28 = icmp eq %TypeKind %20, 11
  br i1 %28, label %select_1_3_ok, label %select_1_4
select_1_3_ok:
  call void (%Type*, %Type*) @func84 (%Type* %0, %Type* %0)
  br label %select_1_end
select_1_4:
  %29 = icmp eq %TypeKind %20, 12
  br i1 %29, label %select_1_4_ok, label %select_1_5
select_1_4_ok:
  call void (%Type*, %Type*) @func85 (%Type* %0, %Type* %0)
  br label %select_1_end
select_1_5:
  %30 = icmp eq %TypeKind %20, 9
  br i1 %30, label %select_1_5_ok, label %select_1_6
select_1_5_ok:
  call void (%Type*) @func80 (%Type* %0)
  br label %select_1_end
select_1_6:
  %31 = icmp eq %TypeKind %20, 6
  br i1 %31, label %select_1_6_ok, label %select_1_7
select_1_6_ok:
  %32 = bitcast [5 x %Nat8]* @func77_str5 to %Str
  %33 = call %Int32 (%Str, ...) @printf (%Str %32)
  br label %select_1_end
select_1_7:
  %34 = icmp eq %TypeKind %20, 8
  br i1 %34, label %select_1_7_ok, label %select_1_8
select_1_7_ok:
  call void (%Type*) @func82 (%Type* %0)
  br label %select_1_end
select_1_8:
  %35 = icmp eq %TypeKind %20, 7
  br i1 %35, label %select_1_8_ok, label %select_1_9
select_1_8_ok:
  %36 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 5
  call void (%TypeFunc*) @func86 (%TypeFunc* %36)
  br label %select_1_end
select_1_9:
  %37 = icmp eq %TypeKind %20, 2
  br i1 %37, label %select_1_9_ok, label %select_1_10
select_1_9_ok:
  %38 = bitcast [13 x %Nat8]* @func77_str6 to %Str
  %39 = call %Int32 (%Str, ...) @printf (%Str %38)
  br label %select_1_end
select_1_10:
  %40 = icmp eq %TypeKind %20, 0
  br i1 %40, label %select_1_10_ok, label %select_1_11
select_1_10_ok:
  %41 = bitcast [16 x %Nat8]* @func77_str7 to %Str
  %42 = call %Int32 (%Str, ...) @printf (%Str %41)
  br label %select_1_end
select_1_11:
  %43 = bitcast [14 x %Nat8]* @func77_str8 to %Str
  %44 = call %Int32 (%Str, ...) @printf (%Str %43)
  br label %select_1_end
select_1_end:
  ret void
}

define void @func78 (%TypeVar*) {
;stmt0:
  %2 = bitcast [5 x %Nat8]* @func78_str1 to %Str
  %3 = call %Int32 (%Str, ...) @printf (%Str %2)
;stmt1:
  %4 = getelementptr inbounds %TypeVar, %TypeVar* %0, i1 0, i32 0
  %5 = load %Type*, %Type** %4
  call void (%Type*) @func76 (%Type* %5)
  ret void
}

define void @func79 (%TypePointer*, %Type*) {
;stmt0:
  %3 = bitcast [2 x %Nat8]* @func79_str1 to %Str
  %4 = call %Int32 (%Str, ...) @printf (%Str %3)
;stmt1:
  %5 = getelementptr inbounds %TypePointer, %TypePointer* %0, i1 0, i32 0
  %6 = load %Type*, %Type** %5
  call void (%Type*, %Type*) @func77 (%Type* %6, %Type* %1)
  ret void
}

define void @func81 (%Unit*, %Unit*, %Nat32) {
;stmt0:
  %4 = bitcast %Unit* %0 to %Decl*
;stmt1:
  %5 = bitcast %Unit* %1 to %Type*
;stmt2:
  %6 = icmp ugt %Nat32 %2, 0
  br i1 %6, label %then_0, label %else_0
then_0:
;stmt3:
  %7 = bitcast [3 x %Nat8]* @func80_func81_str1 to %Str
  %8 = call %Int32 (%Str, ...) @printf (%Str %7)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt4:
  %9 = bitcast [6 x %Nat8]* @func80_func81_str2 to %Str
  %10 = getelementptr inbounds %Decl, %Decl* %4, i1 0, i32 0
  %11 = load %AstId*, %AstId** %10
  %12 = call %Int32 (%Str, ...) @printf (%Str %9, %AstId* %11)
;stmt5:
  %13 = getelementptr inbounds %Decl, %Decl* %4, i1 0, i32 1
  %14 = load %Type*, %Type** %13
  call void (%Type*, %Type*) @func77 (%Type* %14, %Type* %5)
  ret void
}

define void @func80 (%Type*) {
;stmt0:
  %2 = bitcast [2 x %Nat8]* @func80_str1 to %Str
  %3 = call %Int32 (%Str, ...) @printf (%Str %2)
;stmt1:
  %4 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 9
  %5 = getelementptr inbounds %TypeRecord, %TypeRecord* %4, i1 0, i32 0
  %6 = load %List*, %List** %5
  %7 = bitcast %Type* %0 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @func59 (%List* %6, %ListForeachHandler @func81, %Unit* %7)
;stmt2:
  %8 = bitcast [2 x %Nat8]* @func80_str2 to %Str
  %9 = call %Int32 (%Str, ...) @printf (%Str %8)
  ret void
}

define void @func83 (%Unit*, %Unit*, %Nat32) {
;stmt0:
  %4 = bitcast [7 x %Nat8]* @func82_func83_str1 to %Str
  %5 = call %Int32 (%Str, ...) @printf (%Str %4)
  ret void
}

define void @func82 (%Type*) {
;stmt0:
  %2 = bitcast [2 x %Nat8]* @func82_str1 to %Str
  %3 = call %Int32 (%Str, ...) @printf (%Str %2)
;stmt1:
  %4 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 10
  %5 = getelementptr inbounds %TypeEnum, %TypeEnum* %4, i1 0, i32 0
  %6 = load %List*, %List** %5
  call void (%List*, %ListForeachHandler, %Unit*) @func59 (%List* %6, %ListForeachHandler @func83, %Unit* zeroinitializer)
;stmt2:
  %7 = bitcast [2 x %Nat8]* @func82_str2 to %Str
  %8 = call %Int32 (%Str, ...) @printf (%Str %7)
  ret void
}

define void @func84 (%Type*, %Type*) {
;stmt0:
  %3 = bitcast [5 x %Nat8]* @func84_str1 to %Str
  %4 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 7
  %5 = getelementptr inbounds %TypeArray, %TypeArray* %4, i1 0, i32 1
  %6 = load %Nat32, %Nat32* %5
  %7 = call %Int32 (%Str, ...) @printf (%Str %3, %Nat32 %6)
;stmt1:
  %8 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 7
  %9 = getelementptr inbounds %TypeArray, %TypeArray* %8, i1 0, i32 0
  %10 = load %Type*, %Type** %9
  call void (%Type*, %Type*) @func77 (%Type* %10, %Type* %1)
  ret void
}

define void @func85 (%Type*, %Type*) {
;stmt0:
  %3 = bitcast [3 x %Nat8]* @func85_str1 to %Str
  %4 = call %Int32 (%Str, ...) @printf (%Str %3)
;stmt1:
  %5 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 8
  %6 = getelementptr inbounds %TypeArrayU, %TypeArrayU* %5, i1 0, i32 0
  %7 = load %Type*, %Type** %6
  call void (%Type*, %Type*) @func77 (%Type* %7, %Type* %1)
  ret void
}

define void @func86 (%TypeFunc*) {
;stmt0:
  %2 = getelementptr inbounds %TypeFunc, %TypeFunc* %0, i1 0, i32 0
  %3 = load %Type*, %Type** %2
  call void (%Type*) @func76 (%Type* %3)
;stmt1:
  %4 = bitcast [5 x %Nat8]* @func86_str1 to %Str
  %5 = call %Int32 (%Str, ...) @printf (%Str %4)
;stmt2:
  %6 = getelementptr inbounds %TypeFunc, %TypeFunc* %0, i1 0, i32 1
  %7 = load %Type*, %Type** %6
  call void (%Type*) @func76 (%Type* %7)
  ret void
}

define void @value_print_kind (%ValueKind) {
;stmt0:
  br label %select_1_0
select_1_0:
  %2 = icmp eq %ValueKind %0, 0
  br i1 %2, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %3 = bitcast [16 x %Nat8]* @func87_str1 to %Str
  br label %select_1_end
select_1_1:
  %4 = icmp eq %ValueKind %0, 1
  br i1 %4, label %select_1_1_ok, label %select_1_2
select_1_1_ok:
  %5 = bitcast [13 x %Nat8]* @func87_str2 to %Str
  br label %select_1_end
select_1_2:
  %6 = icmp eq %ValueKind %0, 2
  br i1 %6, label %select_1_2_ok, label %select_1_3
select_1_2_ok:
  %7 = bitcast [16 x %Nat8]* @func87_str3 to %Str
  br label %select_1_end
select_1_3:
  %8 = icmp eq %ValueKind %0, 3
  br i1 %8, label %select_1_3_ok, label %select_1_4
select_1_3_ok:
  %9 = bitcast [16 x %Nat8]* @func87_str4 to %Str
  br label %select_1_end
select_1_4:
  %10 = icmp eq %ValueKind %0, 4
  br i1 %10, label %select_1_4_ok, label %select_1_5
select_1_4_ok:
  %11 = bitcast [18 x %Nat8]* @func87_str5 to %Str
  br label %select_1_end
select_1_5:
  %12 = icmp eq %ValueKind %0, 5
  br i1 %12, label %select_1_5_ok, label %select_1_6
select_1_5_ok:
  %13 = bitcast [16 x %Nat8]* @func87_str6 to %Str
  br label %select_1_end
select_1_6:
  %14 = icmp eq %ValueKind %0, 6
  br i1 %14, label %select_1_6_ok, label %select_1_7
select_1_6_ok:
  %15 = bitcast [12 x %Nat8]* @func87_str7 to %Str
  br label %select_1_end
select_1_7:
  %16 = icmp eq %ValueKind %0, 7
  br i1 %16, label %select_1_7_ok, label %select_1_8
select_1_7_ok:
  %17 = bitcast [17 x %Nat8]* @func87_str8 to %Str
  br label %select_1_end
select_1_8:
  %18 = icmp eq %ValueKind %0, 8
  br i1 %18, label %select_1_8_ok, label %select_1_9
select_1_8_ok:
  %19 = bitcast [15 x %Nat8]* @func87_str9 to %Str
  br label %select_1_end
select_1_9:
  %20 = icmp eq %ValueKind %0, 9
  br i1 %20, label %select_1_9_ok, label %select_1_10
select_1_9_ok:
  %21 = bitcast [10 x %Nat8]* @func87_str10 to %Str
  br label %select_1_end
select_1_10:
  %22 = icmp eq %ValueKind %0, 10
  br i1 %22, label %select_1_10_ok, label %select_1_11
select_1_10_ok:
  %23 = bitcast [12 x %Nat8]* @func87_str11 to %Str
  br label %select_1_end
select_1_11:
  %24 = icmp eq %ValueKind %0, 11
  br i1 %24, label %select_1_11_ok, label %select_1_12
select_1_11_ok:
  %25 = bitcast [10 x %Nat8]* @func87_str12 to %Str
  br label %select_1_end
select_1_12:
  %26 = icmp eq %ValueKind %0, 12
  br i1 %26, label %select_1_12_ok, label %select_1_13
select_1_12_ok:
  %27 = bitcast [12 x %Nat8]* @func87_str13 to %Str
  br label %select_1_end
select_1_13:
  %28 = icmp eq %ValueKind %0, 13
  br i1 %28, label %select_1_13_ok, label %select_1_14
select_1_13_ok:
  %29 = bitcast [11 x %Nat8]* @func87_str14 to %Str
  br label %select_1_end
select_1_14:
  %30 = icmp eq %ValueKind %0, 14
  br i1 %30, label %select_1_14_ok, label %select_1_15
select_1_14_ok:
  %31 = bitcast [10 x %Nat8]* @func87_str15 to %Str
  br label %select_1_end
select_1_15:
  %32 = icmp eq %ValueKind %0, 15
  br i1 %32, label %select_1_15_ok, label %select_1_16
select_1_15_ok:
  %33 = bitcast [10 x %Nat8]* @func87_str16 to %Str
  br label %select_1_end
select_1_16:
  %34 = icmp eq %ValueKind %0, 16
  br i1 %34, label %select_1_16_ok, label %select_1_17
select_1_16_ok:
  %35 = bitcast [10 x %Nat8]* @func87_str17 to %Str
  br label %select_1_end
select_1_17:
  %36 = icmp eq %ValueKind %0, 17
  br i1 %36, label %select_1_17_ok, label %select_1_18
select_1_17_ok:
  %37 = bitcast [10 x %Nat8]* @func87_str18 to %Str
  br label %select_1_end
select_1_18:
  %38 = icmp eq %ValueKind %0, 18
  br i1 %38, label %select_1_18_ok, label %select_1_19
select_1_18_ok:
  %39 = bitcast [10 x %Nat8]* @func87_str19 to %Str
  br label %select_1_end
select_1_19:
  %40 = icmp eq %ValueKind %0, 19
  br i1 %40, label %select_1_19_ok, label %select_1_20
select_1_19_ok:
  %41 = bitcast [9 x %Nat8]* @func87_str20 to %Str
  br label %select_1_end
select_1_20:
  %42 = icmp eq %ValueKind %0, 20
  br i1 %42, label %select_1_20_ok, label %select_1_21
select_1_20_ok:
  %43 = bitcast [10 x %Nat8]* @func87_str21 to %Str
  br label %select_1_end
select_1_21:
  %44 = icmp eq %ValueKind %0, 21
  br i1 %44, label %select_1_21_ok, label %select_1_22
select_1_21_ok:
  %45 = bitcast [10 x %Nat8]* @func87_str22 to %Str
  br label %select_1_end
select_1_22:
  %46 = icmp eq %ValueKind %0, 22
  br i1 %46, label %select_1_22_ok, label %select_1_23
select_1_22_ok:
  %47 = bitcast [9 x %Nat8]* @func87_str23 to %Str
  br label %select_1_end
select_1_23:
  %48 = icmp eq %ValueKind %0, 23
  br i1 %48, label %select_1_23_ok, label %select_1_24
select_1_23_ok:
  %49 = bitcast [9 x %Nat8]* @func87_str24 to %Str
  br label %select_1_end
select_1_24:
  %50 = icmp eq %ValueKind %0, 24
  br i1 %50, label %select_1_24_ok, label %select_1_25
select_1_24_ok:
  %51 = bitcast [9 x %Nat8]* @func87_str25 to %Str
  br label %select_1_end
select_1_25:
  %52 = icmp eq %ValueKind %0, 25
  br i1 %52, label %select_1_25_ok, label %select_1_26
select_1_25_ok:
  %53 = bitcast [9 x %Nat8]* @func87_str26 to %Str
  br label %select_1_end
select_1_26:
  %54 = icmp eq %ValueKind %0, 26
  br i1 %54, label %select_1_26_ok, label %select_1_27
select_1_26_ok:
  %55 = bitcast [9 x %Nat8]* @func87_str27 to %Str
  br label %select_1_end
select_1_27:
  %56 = icmp eq %ValueKind %0, 27
  br i1 %56, label %select_1_27_ok, label %select_1_28
select_1_27_ok:
  %57 = bitcast [9 x %Nat8]* @func87_str28 to %Str
  br label %select_1_end
select_1_28:
  %58 = icmp eq %ValueKind %0, 28
  br i1 %58, label %select_1_28_ok, label %select_1_29
select_1_28_ok:
  %59 = bitcast [11 x %Nat8]* @func87_str29 to %Str
  br label %select_1_end
select_1_29:
  %60 = icmp eq %ValueKind %0, 29
  br i1 %60, label %select_1_29_ok, label %select_1_30
select_1_29_ok:
  %61 = bitcast [10 x %Nat8]* @func87_str30 to %Str
  br label %select_1_end
select_1_30:
  %62 = icmp eq %ValueKind %0, 30
  br i1 %62, label %select_1_30_ok, label %select_1_31
select_1_30_ok:
  %63 = bitcast [10 x %Nat8]* @func87_str31 to %Str
  br label %select_1_end
select_1_31:
  %64 = icmp eq %ValueKind %0, 31
  br i1 %64, label %select_1_31_ok, label %select_1_32
select_1_31_ok:
  %65 = bitcast [11 x %Nat8]* @func87_str32 to %Str
  br label %select_1_end
select_1_32:
  %66 = icmp eq %ValueKind %0, 32
  br i1 %66, label %select_1_32_ok, label %select_1_33
select_1_32_ok:
  %67 = bitcast [12 x %Nat8]* @func87_str33 to %Str
  br label %select_1_end
select_1_33:
  %68 = icmp eq %ValueKind %0, 33
  br i1 %68, label %select_1_33_ok, label %select_1_34
select_1_33_ok:
  %69 = bitcast [13 x %Nat8]* @func87_str34 to %Str
  br label %select_1_end
select_1_34:
  %70 = icmp eq %ValueKind %0, 34
  br i1 %70, label %select_1_34_ok, label %select_1_35
select_1_34_ok:
  %71 = bitcast [11 x %Nat8]* @func87_str35 to %Str
  br label %select_1_end
select_1_35:
  %72 = icmp eq %ValueKind %0, 35
  br i1 %72, label %select_1_35_ok, label %select_1_36
select_1_35_ok:
  %73 = bitcast [13 x %Nat8]* @func87_str36 to %Str
  br label %select_1_end
select_1_36:
  %74 = bitcast [21 x %Nat8]* @func87_str37 to %Str
  br label %select_1_end
select_1_end:
  %75 = phi %Str [ %3, %select_1_0_ok ], [ %5, %select_1_1_ok ], [ %7, %select_1_2_ok ], [ %9, %select_1_3_ok ], [ %11, %select_1_4_ok ], [ %13, %select_1_5_ok ], [ %15, %select_1_6_ok ], [ %17, %select_1_7_ok ], [ %19, %select_1_8_ok ], [ %21, %select_1_9_ok ], [ %23, %select_1_10_ok ], [ %25, %select_1_11_ok ], [ %27, %select_1_12_ok ], [ %29, %select_1_13_ok ], [ %31, %select_1_14_ok ], [ %33, %select_1_15_ok ], [ %35, %select_1_16_ok ], [ %37, %select_1_17_ok ], [ %39, %select_1_18_ok ], [ %41, %select_1_19_ok ], [ %43, %select_1_20_ok ], [ %45, %select_1_21_ok ], [ %47, %select_1_22_ok ], [ %49, %select_1_23_ok ], [ %51, %select_1_24_ok ], [ %53, %select_1_25_ok ], [ %55, %select_1_26_ok ], [ %57, %select_1_27_ok ], [ %59, %select_1_28_ok ], [ %61, %select_1_29_ok ], [ %63, %select_1_30_ok ], [ %65, %select_1_31_ok ], [ %67, %select_1_32_ok ], [ %69, %select_1_33_ok ], [ %71, %select_1_34_ok ], [ %73, %select_1_35_ok ], [ %74, %select_1_36 ]
;stmt1:
  %76 = bitcast [3 x %Nat8]* @func87_str38 to %Str
  %77 = call %Int32 (%Str, ...) @printf (%Str %76, %Str %75)
  ret void
}

define void @func89 () {
;stmt0:
  %1 = bitcast [16 x %Nat8]* @func88_func89_str1 to %Str
  %2 = call %Int32 (%Str, ...) @printf (%Str %1)
  ret void
}

define void @func90 () {
;stmt0:
  %1 = bitcast [13 x %Nat8]* @func88_func90_str1 to %Str
  %2 = call %Int32 (%Str, ...) @printf (%Str %1)
  ret void
}

define void @func91 () {
  ret void
}

define void @value_print (%Value*) {
;stmt0:
  %2 = bitcast [7 x %Nat8]* @func88_str1 to %Str
  %3 = call %Int32 (%Str, ...) @printf (%Str %2)
;stmt1:
  %4 = bitcast [7 x %Nat8]* @func88_str2 to %Str
  %5 = call %Int32 (%Str, ...) @printf (%Str %4)
;stmt2:
  %6 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 1
  %7 = load %Type*, %Type** %6
  call void (%Type*) @func76 (%Type* %7)
;stmt3:
  %8 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 0
  %9 = load %ValueKind, %ValueKind* %8
  br label %select_1_0
select_1_0:
  %10 = icmp eq %ValueKind %9, 0
  br i1 %10, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  call void () @func89 ()
  br label %select_1_end
select_1_1:
  %11 = icmp eq %ValueKind %9, 1
  br i1 %11, label %select_1_1_ok, label %select_1_2
select_1_1_ok:
  call void () @func90 ()
  br label %select_1_end
select_1_2:
  %12 = icmp eq %ValueKind %9, 2
  br i1 %12, label %select_1_2_ok, label %select_1_3
select_1_2_ok:
  call void (%Value*) @func92 (%Value* %0)
  br label %select_1_end
select_1_3:
  %13 = icmp eq %ValueKind %9, 3
  br i1 %13, label %select_1_3_ok, label %select_1_4
select_1_3_ok:
  call void (%Value*) @func93 (%Value* %0)
  br label %select_1_end
select_1_4:
  %14 = icmp eq %ValueKind %9, 4
  br i1 %14, label %select_1_4_ok, label %select_1_5
select_1_4_ok:
  call void (%Value*) @func94 (%Value* %0)
  br label %select_1_end
select_1_5:
  %15 = icmp eq %ValueKind %9, 5
  br i1 %15, label %select_1_5_ok, label %select_1_6
select_1_5_ok:
  call void (%Value*) @func95 (%Value* %0)
  br label %select_1_end
select_1_6:
  %16 = icmp eq %ValueKind %9, 6
  br i1 %16, label %select_1_6_ok, label %select_1_7
select_1_6_ok:
  call void (%Value*) @func96 (%Value* %0)
  br label %select_1_end
select_1_7:
  %17 = icmp eq %ValueKind %9, 7
  br i1 %17, label %select_1_7_ok, label %select_1_8
select_1_7_ok:
  call void (%Value*) @func97 (%Value* %0)
  br label %select_1_end
select_1_8:
  %18 = icmp eq %ValueKind %9, 8
  br i1 %18, label %select_1_8_ok, label %select_1_9
select_1_8_ok:
  call void (%Value*) @func98 (%Value* %0)
  br label %select_1_end
select_1_9:
  %19 = icmp eq %ValueKind %9, 9
  br i1 %19, label %select_1_9_ok, label %select_1_10
select_1_9_ok:
  call void (%Value*) @func99 (%Value* %0)
  br label %select_1_end
select_1_10:
  %20 = icmp eq %ValueKind %9, 10
  br i1 %20, label %select_1_10_ok, label %select_1_11
select_1_10_ok:
  call void (%Value*) @func100 (%Value* %0)
  br label %select_1_end
select_1_11:
  %21 = icmp eq %ValueKind %9, 11
  br i1 %21, label %select_1_11_ok, label %select_1_12
select_1_11_ok:
  call void (%Value*) @func101 (%Value* %0)
  br label %select_1_end
select_1_12:
  %22 = icmp eq %ValueKind %9, 12
  br i1 %22, label %select_1_12_ok, label %select_1_13
select_1_12_ok:
  call void (%Value*) @func102 (%Value* %0)
  br label %select_1_end
select_1_13:
  %23 = icmp eq %ValueKind %9, 13
  br i1 %23, label %select_1_13_ok, label %select_1_14
select_1_13_ok:
  call void (%Value*) @func103 (%Value* %0)
  br label %select_1_end
select_1_14:
  %24 = icmp eq %ValueKind %9, 14
  br i1 %24, label %select_1_14_ok, label %select_1_15
select_1_14_ok:
  %25 = bitcast [4 x %Nat8]* @func88_str3 to %Str
  call void (%Value*, %Str) @func104 (%Value* %0, %Str %25)
  br label %select_1_end
select_1_15:
  %26 = icmp eq %ValueKind %9, 15
  br i1 %26, label %select_1_15_ok, label %select_1_16
select_1_15_ok:
  %27 = bitcast [4 x %Nat8]* @func88_str4 to %Str
  call void (%Value*, %Str) @func104 (%Value* %0, %Str %27)
  br label %select_1_end
select_1_16:
  %28 = icmp eq %ValueKind %9, 16
  br i1 %28, label %select_1_16_ok, label %select_1_17
select_1_16_ok:
  %29 = bitcast [4 x %Nat8]* @func88_str5 to %Str
  call void (%Value*, %Str) @func104 (%Value* %0, %Str %29)
  br label %select_1_end
select_1_17:
  %30 = icmp eq %ValueKind %9, 17
  br i1 %30, label %select_1_17_ok, label %select_1_18
select_1_17_ok:
  %31 = bitcast [4 x %Nat8]* @func88_str6 to %Str
  call void (%Value*, %Str) @func104 (%Value* %0, %Str %31)
  br label %select_1_end
select_1_18:
  %32 = icmp eq %ValueKind %9, 18
  br i1 %32, label %select_1_18_ok, label %select_1_19
select_1_18_ok:
  %33 = bitcast [4 x %Nat8]* @func88_str7 to %Str
  call void (%Value*, %Str) @func104 (%Value* %0, %Str %33)
  br label %select_1_end
select_1_19:
  %34 = icmp eq %ValueKind %9, 19
  br i1 %34, label %select_1_19_ok, label %select_1_20
select_1_19_ok:
  %35 = bitcast [3 x %Nat8]* @func88_str8 to %Str
  call void (%Value*, %Str) @func104 (%Value* %0, %Str %35)
  br label %select_1_end
select_1_20:
  %36 = icmp eq %ValueKind %9, 20
  br i1 %36, label %select_1_20_ok, label %select_1_21
select_1_20_ok:
  %37 = bitcast [4 x %Nat8]* @func88_str9 to %Str
  call void (%Value*, %Str) @func104 (%Value* %0, %Str %37)
  br label %select_1_end
select_1_21:
  %38 = icmp eq %ValueKind %9, 21
  br i1 %38, label %select_1_21_ok, label %select_1_22
select_1_21_ok:
  %39 = bitcast [4 x %Nat8]* @func88_str10 to %Str
  call void (%Value*, %Str) @func104 (%Value* %0, %Str %39)
  br label %select_1_end
select_1_22:
  %40 = icmp eq %ValueKind %9, 22
  br i1 %40, label %select_1_22_ok, label %select_1_23
select_1_22_ok:
  %41 = bitcast [3 x %Nat8]* @func88_str11 to %Str
  call void (%Value*, %Str) @func104 (%Value* %0, %Str %41)
  br label %select_1_end
select_1_23:
  %42 = icmp eq %ValueKind %9, 23
  br i1 %42, label %select_1_23_ok, label %select_1_24
select_1_23_ok:
  %43 = bitcast [3 x %Nat8]* @func88_str12 to %Str
  call void (%Value*, %Str) @func104 (%Value* %0, %Str %43)
  br label %select_1_end
select_1_24:
  %44 = icmp eq %ValueKind %9, 24
  br i1 %44, label %select_1_24_ok, label %select_1_25
select_1_24_ok:
  %45 = bitcast [3 x %Nat8]* @func88_str13 to %Str
  call void (%Value*, %Str) @func104 (%Value* %0, %Str %45)
  br label %select_1_end
select_1_25:
  %46 = icmp eq %ValueKind %9, 25
  br i1 %46, label %select_1_25_ok, label %select_1_26
select_1_25_ok:
  %47 = bitcast [3 x %Nat8]* @func88_str14 to %Str
  call void (%Value*, %Str) @func104 (%Value* %0, %Str %47)
  br label %select_1_end
select_1_26:
  %48 = icmp eq %ValueKind %9, 26
  br i1 %48, label %select_1_26_ok, label %select_1_27
select_1_26_ok:
  %49 = bitcast [3 x %Nat8]* @func88_str15 to %Str
  call void (%Value*, %Str) @func104 (%Value* %0, %Str %49)
  br label %select_1_end
select_1_27:
  %50 = icmp eq %ValueKind %9, 27
  br i1 %50, label %select_1_27_ok, label %select_1_28
select_1_27_ok:
  %51 = bitcast [3 x %Nat8]* @func88_str16 to %Str
  call void (%Value*, %Str) @func104 (%Value* %0, %Str %51)
  br label %select_1_end
select_1_28:
  %52 = icmp eq %ValueKind %9, 28
  br i1 %52, label %select_1_28_ok, label %select_1_29
select_1_28_ok:
  call void (%Value*) @func105 (%Value* %0)
  br label %select_1_end
select_1_29:
  %53 = icmp eq %ValueKind %9, 29
  br i1 %53, label %select_1_29_ok, label %select_1_30
select_1_29_ok:
  call void (%Value*) @func106 (%Value* %0)
  br label %select_1_end
select_1_30:
  %54 = icmp eq %ValueKind %9, 30
  br i1 %54, label %select_1_30_ok, label %select_1_31
select_1_30_ok:
  call void (%Value*) @func107 (%Value* %0)
  br label %select_1_end
select_1_31:
  %55 = icmp eq %ValueKind %9, 31
  br i1 %55, label %select_1_31_ok, label %select_1_32
select_1_31_ok:
  call void (%Value*) @func108 (%Value* %0)
  br label %select_1_end
select_1_32:
  %56 = icmp eq %ValueKind %9, 32
  br i1 %56, label %select_1_32_ok, label %select_1_33
select_1_32_ok:
  call void (%Value*) @func109 (%Value* %0)
  br label %select_1_end
select_1_33:
  %57 = icmp eq %ValueKind %9, 33
  br i1 %57, label %select_1_33_ok, label %select_1_34
select_1_33_ok:
  call void (%Value*) @func110 (%Value* %0)
  br label %select_1_end
select_1_34:
  %58 = icmp eq %ValueKind %9, 34
  br i1 %58, label %select_1_34_ok, label %select_1_35
select_1_34_ok:
  call void (%Value*) @func111 (%Value* %0)
  br label %select_1_end
select_1_35:
  %59 = icmp eq %ValueKind %9, 35
  br i1 %59, label %select_1_35_ok, label %select_1_36
select_1_35_ok:
  call void (%Value*) @func112 (%Value* %0)
  br label %select_1_end
select_1_36:
  call void () @func91 ()
  br label %select_1_end
select_1_end:
  ret void
}

define void @func92 (%Value*) {
  ret void
}

define void @func93 (%Value*) {
  ret void
}

define void @func94 (%Value*) {
  ret void
}

define void @func95 (%Value*) {
  ret void
}

define void @func96 (%Value*) {
  ret void
}

define void @func97 (%Value*) {
  ret void
}

define void @func98 (%Value*) {
  ret void
}

define void @func99 (%Value*) {
  ret void
}

define void @func100 (%Value*) {
  ret void
}

define void @func101 (%Value*) {
  ret void
}

define void @func102 (%Value*) {
  ret void
}

define void @func103 (%Value*) {
  ret void
}

define void @func104 (%Value*, %Str) {
;stmt0:
  %3 = bitcast [10 x %Nat8]* @func104_str1 to %Str
  %4 = call %Int32 (%Str, ...) @printf (%Str %3, %Str %1)
;stmt1:
  %5 = bitcast [11 x %Nat8]* @func104_str2 to %Str
  %6 = call %Int32 (%Str, ...) @printf (%Str %5)
;stmt2:
  %7 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 9
  %8 = getelementptr inbounds %ValueBin, %ValueBin* %7, i1 0, i32 0
  %9 = load %Value*, %Value** %8
  %10 = getelementptr inbounds %Value, %Value* %9, i1 0, i32 1
  %11 = load %Type*, %Type** %10
  call void (%Type*) @func76 (%Type* %11)
;stmt3:
  %12 = bitcast [12 x %Nat8]* @func104_str3 to %Str
  %13 = call %Int32 (%Str, ...) @printf (%Str %12)
;stmt4:
  %14 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 9
  %15 = getelementptr inbounds %ValueBin, %ValueBin* %14, i1 0, i32 0
  %16 = load %Value*, %Value** %15
  %17 = getelementptr inbounds %Value, %Value* %16, i1 0, i32 1
  %18 = load %Type*, %Type** %17
  call void (%Type*) @func76 (%Type* %18)
  ret void
}

define void @func105 (%Value*) {
  ret void
}

define void @func106 (%Value*) {
  ret void
}

define void @func107 (%Value*) {
  ret void
}

define void @func108 (%Value*) {
  ret void
}

define void @func109 (%Value*) {
  ret void
}

define void @func110 (%Value*) {
  ret void
}

define void @func111 (%Value*) {
  ret void
}

define void @func112 (%Value*) {
  ret void
}

define void @txt (%Str, %Nat8, %Str) {
;stmt0:
  %4 = bitcast [21 x %Nat8]* @func113_str1 to %Str
  %5 = call %Int32 (%Str, ...) @printf (%Str %4, %Int64 27, %Nat8 %1, %Str %0, %Int64 27, %Str %2)
  ret void
}

define void @txti (%Str, %Nat8, %TokenInfo*, %Str) {
;stmt0:
  %5 = bitcast [30 x %Nat8]* @func114_str1 to %Str
  %6 = getelementptr inbounds %TokenInfo, %TokenInfo* %2, i1 0, i32 0
  %7 = load %Str, %Str* %6
  %8 = getelementptr inbounds %TokenInfo, %TokenInfo* %2, i1 0, i32 3
  %9 = load %Nat32, %Nat32* %8
  %10 = call %Int32 (%Str, ...) @printf (%Str %5, %Int64 27, %Nat8 %1, %Str %0, %Int64 27, %Str %7, %Nat32 %9, %Str %3)
  ret void
}

define void @info (%Str, %TokenInfo*) {
;stmt0:
  %3 = icmp ne %TokenInfo* %1, zeroinitializer
  br i1 %3, label %then_0, label %else_0
then_0:
;stmt1:
  %4 = bitcast [5 x %Nat8]* @func115_str1 to %Str
  call void (%Str, %Nat8, %TokenInfo*, %Str) @txti (%Str %4, %Nat8 36, %TokenInfo* %1, %Str %0)
;stmt2:
  call void (%TokenInfo*) @func120 (%TokenInfo* %1)
  br label %endif_0
else_0:
;stmt3:
  %5 = bitcast [5 x %Nat8]* @func115_str2 to %Str
  call void (%Str, %Nat8, %Str) @txt (%Str %5, %Nat8 36, %Str %0)
  br label %endif_0
endif_0:
;stmt4:
  %6 = bitcast [2 x %Nat8]* @func115_str3 to %Str
  %7 = call %Int32 (%Str, ...) @printf (%Str %6)
  ret void
}

define void @warning (%Str, %TokenInfo*) {
;stmt0:
  %3 = icmp ne %TokenInfo* %1, zeroinitializer
  br i1 %3, label %then_0, label %else_0
then_0:
;stmt1:
  %4 = bitcast [8 x %Nat8]* @func116_str1 to %Str
  call void (%Str, %Nat8, %TokenInfo*, %Str) @txti (%Str %4, %Nat8 34, %TokenInfo* %1, %Str %0)
;stmt2:
  call void (%TokenInfo*) @func120 (%TokenInfo* %1)
  br label %endif_0
else_0:
;stmt3:
  %5 = bitcast [8 x %Nat8]* @func116_str2 to %Str
  call void (%Str, %Nat8, %Str) @txt (%Str %5, %Nat8 34, %Str %0)
  br label %endif_0
endif_0:
;stmt4:
  %6 = bitcast [2 x %Nat8]* @func116_str3 to %Str
  %7 = call %Int32 (%Str, ...) @printf (%Str %6)
;stmt5:
  %8 = load %Nat32, %Nat32* @warncnt
  %9 = add %Nat32 %8, 1
  store %Nat32 %9, %Nat32* @warncnt, align 4
;stmt6:
  %10 = load %Int32, %Int32* @errcnt
  %11 = icmp sgt %Int32 %10, 20
  br i1 %11, label %then_1, label %else_1
then_1:
;stmt7:
  %12 = bitcast [14 x %Nat8]* @func116_str4 to %Str
  %13 = call %Int32 (%Str, ...) @printf (%Str %12)
;stmt8:
  call void (%Int32) @exit (%Int32 1)
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  ret void
}

define void @error (%Str, %TokenInfo*) {
;stmt0:
  %3 = icmp eq %TokenInfo* %1, zeroinitializer
  br i1 %3, label %then_0, label %else_0
then_0:
;stmt1:
  %4 = bitcast [6 x %Nat8]* @func117_str1 to %Str
  call void (%Str, %Nat8, %Str) @txt (%Str %4, %Nat8 35, %Str %0)
  br label %endif_0
else_0:
;stmt2:
  %5 = bitcast [6 x %Nat8]* @func117_str2 to %Str
  call void (%Str, %Nat8, %TokenInfo*, %Str) @txti (%Str %5, %Nat8 35, %TokenInfo* %1, %Str %0)
;stmt3:
  call void (%TokenInfo*) @func120 (%TokenInfo* %1)
  br label %endif_0
endif_0:
;stmt4:
  %6 = bitcast [2 x %Nat8]* @func117_str3 to %Str
  %7 = call %Int32 (%Str, ...) @printf (%Str %6)
;stmt5:
  %8 = load %Int32, %Int32* @errcnt
  %9 = add %Int32 %8, 1
  store %Int32 %9, %Int32* @errcnt, align 4
;stmt6:
  %10 = load %Int32, %Int32* @errcnt
  %11 = icmp sgt %Int32 %10, 20
  br i1 %11, label %then_1, label %else_1
then_1:
;stmt7:
  %12 = bitcast [14 x %Nat8]* @func117_str4 to %Str
  %13 = call %Int32 (%Str, ...) @printf (%Str %12)
;stmt8:
  call void (%Int32) @exit (%Int32 1)
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  ret void
}

define void @rem (%Str, %TokenInfo*) {
;stmt0:
  %3 = bitcast [17 x %Nat8]* @func118_str1 to %Str
  %4 = call %Int32 (%Str, ...) @printf (%Str %3, %Int64 27, %Int64 33, %Str %0, %Int64 27)
;stmt1:
  %5 = icmp ne %TokenInfo* %1, zeroinitializer
  br i1 %5, label %then_0, label %else_0
then_0:
;stmt2:
  call void (%TokenInfo*) @func120 (%TokenInfo* %1)
;stmt3:
  %6 = bitcast [2 x %Nat8]* @func118_str2 to %Str
  %7 = call %Int32 (%Str, ...) @printf (%Str %6)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  ret void
}

define void @gline (%Str, %TokenInfo*) {
;stmt0:
  %3 = getelementptr inbounds %TokenInfo, %TokenInfo* %1, i1 0, i32 0
  %4 = load %Str, %Str* %3
  %5 = call %Int32 (%Str, %Int32) @open (%Str %4, %Int32 0)
;stmt1:
  %6 = icmp slt %Int32 %5, 0
  br i1 %6, label %then_0, label %else_0
then_0:
;stmt2:
ret void
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt3:
  %8 = getelementptr inbounds %TokenInfo, %TokenInfo* %1, i1 0, i32 3
  %9 = load %Nat32, %Nat32* %8
;stmt4:
  %10 = alloca %Nat32
  store %Nat32 1, %Nat32* %10, align 4
;stmt5:
  %11 = alloca %Nat32
  store %Nat32 0, %Nat32* %11, align 4
;stmt6:
  %12 = alloca %Nat8
  store %Nat8 0, %Nat8* %12, align 1
;stmt7:
  br label %continue_0
continue_0:
  br i1 1, label %body_0, label %break_0
body_0:
;stmt8:
  %13 = load %Nat32, %Nat32* %10
  %14 = icmp eq %Nat32 %13, %9
  br i1 %14, label %then_1, label %else_1
then_1:
;stmt9:
  br label %continue_1
continue_1:
  br i1 1, label %body_1, label %break_1
body_1:
;stmt10:
  %15 = getelementptr inbounds %Nat8, %Nat8* %12, i1 0
  %16 = call %Int32 (%Int32, %Nat8*, %Nat32) @read (%Int32 %5, %Nat8* %15, %Nat32 1)
  %17 = icmp eq %Int32 %16, 0
  br i1 %17, label %then_2, label %else_2
then_2:
;stmt11:
  br label %exit
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
;stmt12:
  %19 = load %Nat32, %Nat32* %11
; eval index uarray
  %20 = getelementptr inbounds %Nat8, %Nat8* %0, %Nat32 %19
  %21 = load %Nat8, %Nat8* %12
  store %Nat8 %21, %Nat8* %20, align 1
;stmt13:
  %22 = load %Nat32, %Nat32* %11
  %23 = add %Nat32 %22, 1
  store %Nat32 %23, %Nat32* %11, align 4
;stmt14:
  %24 = load %Nat8, %Nat8* %12
; index array
  %25 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func119_str1, i1 0, %Int64 0
  %26 = load %Nat8, %Nat8* %25
  %27 = icmp eq %Nat8 %24, %26
  br i1 %27, label %then_3, label %else_3
then_3:
;stmt15:
  br label %exit
  br label %endif_3
else_3:
  br label %endif_3
endif_3:
  br label %continue_1
break_1:
  br label %endif_1
else_1:
;stmt16:
  %29 = getelementptr inbounds %Nat8, %Nat8* %12, i1 0
  %30 = call %Int32 (%Int32, %Nat8*, %Nat32) @read (%Int32 %5, %Nat8* %29, %Nat32 1)
;stmt17:
  %31 = load %Nat8, %Nat8* %12
; index array
  %32 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func119_str2, i1 0, %Int64 0
  %33 = load %Nat8, %Nat8* %32
  %34 = icmp eq %Nat8 %31, %33
  br i1 %34, label %then_4, label %else_4
then_4:
;stmt18:
  %35 = load %Nat32, %Nat32* %10
  %36 = add %Nat32 %35, 1
  store %Nat32 %36, %Nat32* %10, align 4
  br label %endif_4
else_4:
  br label %endif_4
endif_4:
  br label %endif_1
endif_1:
  br label %continue_0
break_0:
;stmt19:
  br label %exit
exit:
;stmt20:
  %37 = call %Int32 (%Int32) @close (%Int32 %5)
;stmt21:
  %38 = load %Nat32, %Nat32* %11
; eval index uarray
  %39 = getelementptr inbounds %Nat8, %Nat8* %0, %Nat32 %38
  store %Nat8 0, %Nat8* %39, align 1
;stmt22:
ret void
  ret void
}

define void @func120 (%TokenInfo*) {
;stmt0:
  %2 = bitcast [2 x %Nat8]* @func120_str1 to %Str
  %3 = call %Int32 (%Str, ...) @printf (%Str %2)
;stmt1:
  %4 = alloca [512 x %Nat8]
  store [512 x %Nat8] zeroinitializer, [512 x %Nat8]* %4, align 1
;stmt2:
; index array
  %5 = getelementptr inbounds [512 x %Nat8], [512 x %Nat8]* %4, i1 0, %Int64 0
  %6 = bitcast %Nat8* %5 to %Unit*
  %7 = call %Unit* (%Unit*, %Nat8, %Nat32) @memset (%Unit* %6, %Nat8 0, %Nat32 512)
;stmt3:
  %8 = getelementptr inbounds [512 x %Nat8], [512 x %Nat8]* %4, i1 0
  %9 = bitcast [512 x %Nat8]* %8 to %Str
  call void (%Str, %TokenInfo*) @gline (%Str %9, %TokenInfo* %0)
;stmt4:
  %10 = bitcast [3 x %Nat8]* @func120_str2 to %Str
; index array
  %11 = getelementptr inbounds [512 x %Nat8], [512 x %Nat8]* %4, i1 0, %Int64 0
  %12 = call %Int32 (%Str, ...) @printf (%Str %10, %Nat8* %11)
;stmt5:
  %13 = alloca %Nat16
  store %Nat16 1, %Nat16* %13, align 2
;stmt6:
  br label %continue_0
continue_0:
  %14 = load %Nat16, %Nat16* %13
  %15 = getelementptr inbounds %TokenInfo, %TokenInfo* %0, i1 0, i32 4
  %16 = load %Nat16, %Nat16* %15
  %17 = icmp ult %Nat16 %14, %16
  br i1 %17, label %body_0, label %break_0
body_0:
;stmt7:
  %18 = bitcast [2 x %Nat8]* @func120_str3 to %Str
  %19 = call %Int32 (%Str, ...) @printf (%Str %18)
;stmt8:
  %20 = load %Nat16, %Nat16* %13
  %21 = add %Nat16 %20, 1
  store %Nat16 %21, %Nat16* %13, align 2
  br label %continue_0
break_0:
;stmt9:
  %22 = bitcast [15 x %Nat8]* @func120_str4 to %Str
  %23 = call %Int32 (%Str, ...) @printf (%Str %22, %Int64 27, %Int64 32, %Int64 27)
  ret void
}

define void @fatal (%Str) {
;stmt0:
  %2 = bitcast [6 x %Nat8]* @func121_str1 to %Str
  call void (%Str, %Nat8, %Str) @txt (%Str %2, %Nat8 31, %Str %0)
;stmt1:
  call void (%Int32) @exit (%Int32 1)
  ret void
}

define void @error_type_error (%TokenInfo*, %Type*, %Type*) {
;stmt0:
  %4 = bitcast [11 x %Nat8]* @func122_str1 to %Str
  call void (%Str, %TokenInfo*) @error (%Str %4, %TokenInfo* %0)
;stmt1:
  %5 = icmp ne %Type* %2, zeroinitializer
  br i1 %5, label %then_0, label %else_0
then_0:
;stmt2:
  %6 = bitcast [16 x %Nat8]* @func122_str2 to %Str
  %7 = call %Int32 (%Str, ...) @printf (%Str %6)
;stmt3:
  call void (%Type*) @func76 (%Type* %2)
;stmt4:
  %8 = bitcast [2 x %Nat8]* @func122_str3 to %Str
  %9 = call %Int32 (%Str, ...) @printf (%Str %8)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt5:
  %10 = icmp ne %Type* %1, zeroinitializer
  br i1 %10, label %then_1, label %else_1
then_1:
;stmt6:
  %11 = bitcast [16 x %Nat8]* @func122_str4 to %Str
  %12 = call %Int32 (%Str, ...) @printf (%Str %11)
;stmt7:
  call void (%Type*) @func76 (%Type* %1)
;stmt8:
  %13 = bitcast [2 x %Nat8]* @func122_str5 to %Str
  %14 = call %Int32 (%Str, ...) @printf (%Str %13)
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  ret void
}

define void @builtin_value_bind (%Str, %Value*) {
;stmt0:
  %3 = getelementptr inbounds %Index, %Index* @builtinIndex, i1 0, i32 1
  %4 = bitcast %Value* %1 to %Unit*
  %5 = call i1 (%List*, %Str, %Unit*) @map_append (%List* %3, %Str %0, %Unit* %4)
  ret void
}

define void @builtin_type_bind (%Str, %Type*) {
;stmt0:
  %3 = getelementptr inbounds %Index, %Index* @builtinIndex, i1 0, i32 0
  %4 = bitcast %Type* %1 to %Unit*
  %5 = call i1 (%List*, %Str, %Unit*) @map_append (%List* %3, %Str %0, %Unit* %4)
  ret void
}

define void @func125 (%Index*) {
;stmt0:
  %2 = getelementptr inbounds %Index, %Index* %0, i1 0, i32 0
  call void (%List*) @map_init (%List* %2)
;stmt1:
  %3 = getelementptr inbounds %Index, %Index* %0, i1 0, i32 1
  call void (%List*) @map_init (%List* %3)
  ret void
}

define void @func126 (%Index*, %Index*) {
;stmt0:
  %3 = getelementptr inbounds %Index, %Index* %0, i1 0, i32 0
  %4 = getelementptr inbounds %Index, %Index* %1, i1 0, i32 0
  %5 = call i1 (%List*, %List*) @map_extend (%List* %3, %List* %4)
;stmt1:
  %6 = getelementptr inbounds %Index, %Index* %0, i1 0, i32 1
  %7 = getelementptr inbounds %Index, %Index* %1, i1 0, i32 1
  %8 = call i1 (%List*, %List*) @map_extend (%List* %6, %List* %7)
  ret void
}

define void @func127 (%Index*, %Str, %Type*) {
;stmt0:
  %4 = getelementptr inbounds %Index, %Index* %0, i1 0, i32 0
  %5 = bitcast %Type* %2 to %Unit*
  %6 = call i1 (%List*, %Str, %Unit*) @map_append (%List* %4, %Str %1, %Unit* %5)
  ret void
}

define void @func128 (%Index*, %Str, %Value*) {
;stmt0:
  %4 = getelementptr inbounds %Index, %Index* %0, i1 0, i32 1
  %5 = bitcast %Value* %2 to %Unit*
  %6 = call i1 (%List*, %Str, %Unit*) @map_append (%List* %4, %Str %1, %Unit* %5)
  ret void
}

define %Type* @func129 (%Index*, %Str) {
;stmt0:
  %3 = getelementptr inbounds %Index, %Index* %0, i1 0, i32 0
  %4 = call %Unit* (%List*, %Str) @map_get (%List* %3, %Str %1)
  %5 = bitcast %Unit* %4 to %Type*
  ret %Type* %5
}

define %Value* @func130 (%Index*, %Str) {
;stmt0:
  %3 = getelementptr inbounds %Index, %Index* %0, i1 0, i32 1
  %4 = call %Unit* (%List*, %Str) @map_get (%List* %3, %Str %1)
  %5 = bitcast %Unit* %4 to %Value*
  ret %Value* %5
}

define %Value* @func131 (%Str) {
;stmt0:
  %2 = load %Module*, %Module** @module
  %3 = getelementptr inbounds %Module, %Module* %2, i1 0, i32 0
  %4 = call %Value* (%Index*, %Str) @func130 (%Index* %3, %Str %0)
;stmt1:
  %5 = icmp ne %Value* %4, zeroinitializer
  br i1 %5, label %then_0, label %else_0
then_0:
;stmt2:
  ret %Value* %4
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt3:
  %7 = load %Module*, %Module** @module
  %8 = getelementptr inbounds %Module, %Module* %7, i1 0, i32 1
  %9 = call %Value* (%Index*, %Str) @func130 (%Index* %8, %Str %0)
  ret %Value* %9
}

define %Value* @func133 (%Str, %Block*) {
;stmt0:
  %3 = icmp eq %Block* %1, zeroinitializer
  br i1 %3, label %then_0, label %else_0
then_0:
;stmt1:
  ret %Value* zeroinitializer
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt2:
  %5 = getelementptr inbounds %Block, %Block* %1, i1 0, i32 1
  %6 = call %Value* (%Index*, %Str) @func130 (%Index* %5, %Str %0)
;stmt3:
  %7 = icmp ne %Value* %6, zeroinitializer
  br i1 %7, label %then_1, label %else_1
then_1:
;stmt4:
  ret %Value* %6
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt5:
  %9 = getelementptr inbounds %Block, %Block* %1, i1 0, i32 0
  %10 = load %Block*, %Block** %9
  %11 = call %Value* (%Str, %Block*) @func133 (%Str %0, %Block* %10)
  ret %Value* %11
}

define %Value* @func132 (%Str) {
;stmt0:
  %2 = load %FuncContext*, %FuncContext** @fctx
  %3 = icmp ne %FuncContext* %2, zeroinitializer
  br i1 %3, label %then_0, label %else_0
then_0:
;stmt1:
  %4 = load %FuncContext*, %FuncContext** @fctx
  %5 = getelementptr inbounds %FuncContext, %FuncContext* %4, i1 0, i32 2
  %6 = load %Block*, %Block** %5
  %7 = call %Value* (%Str, %Block*) @func133 (%Str %0, %Block* %6)
;stmt2:
  %8 = icmp ne %Value* %7, zeroinitializer
  br i1 %8, label %then_1, label %else_1
then_1:
;stmt3:
  ret %Value* %7
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt4:
  %10 = call %Value* (%Str) @func131 (%Str %0)
;stmt5:
  %11 = icmp ne %Value* %10, zeroinitializer
  br i1 %11, label %then_2, label %else_2
then_2:
;stmt6:
  ret %Value* %10
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
;stmt7:
  %13 = getelementptr inbounds %Index, %Index* @builtinIndex, i1 0
  %14 = call %Value* (%Index*, %Str) @func130 (%Index* %13, %Str %0)
;stmt8:
  %15 = icmp ne %Value* %14, zeroinitializer
  br i1 %15, label %then_3, label %else_3
then_3:
;stmt9:
  ret %Value* %14
  br label %endif_3
else_3:
  br label %endif_3
endif_3:
;stmt10:
  %17 = load %FuncContext*, %FuncContext** @fctx
  %18 = icmp ne %FuncContext* %17, zeroinitializer
  br i1 %18, label %then_4, label %else_4
then_4:
;stmt11:
  %19 = bitcast [5 x %Nat8]* @func132_str1 to %Str
  %20 = call %Int32 (%Str, %Str) @strcmp (%Str %0, %Str %19)
  %21 = icmp eq %Int32 %20, 0
  br i1 %21, label %then_5, label %else_5
then_5:
;stmt12:
  %22 = load %FuncContext*, %FuncContext** @fctx
  %23 = getelementptr inbounds %FuncContext, %FuncContext* %22, i1 0, i32 1
  %24 = load %Value*, %Value** %23
  ret %Value* %24
  br label %endif_5
else_5:
  br label %endif_5
endif_5:
  br label %endif_4
else_4:
  br label %endif_4
endif_4:
;stmt13:
  ret %Value* zeroinitializer
}

define void @func134 (%Index*, %Str, %Value*) {
;stmt0:
  %4 = call %Value* (%Index*, %Str) @func130 (%Index* %0, %Str %1)
;stmt1:
  %5 = icmp ne %Value* %4, zeroinitializer
  br i1 %5, label %then_0, label %else_0
then_0:
;stmt2:
  %6 = getelementptr inbounds %Value, %Value* %4, i1 0, i32 0
  %7 = load %ValueKind, %ValueKind* %6
  %8 = icmp ne %ValueKind %7, 2
  br i1 %8, label %then_1, label %else_1
then_1:
;stmt3:
  %9 = bitcast [35 x %Nat8]* @func134_str1 to %Str
  %10 = getelementptr inbounds %Value, %Value* %2, i1 0, i32 19
  %11 = load %TokenInfo*, %TokenInfo** %10
  call void (%Str, %TokenInfo*) @error (%Str %9, %TokenInfo* %11)
;stmt4:
  %12 = bitcast [19 x %Nat8]* @func134_str2 to %Str
  %13 = getelementptr inbounds %Value, %Value* %4, i1 0, i32 19
  %14 = load %TokenInfo*, %TokenInfo** %13
  call void (%Str, %TokenInfo*) @warning (%Str %12, %TokenInfo* %14)
;stmt5:
ret void
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt6:
  %16 = bitcast %Value* %4 to %Unit*
  %17 = bitcast %Value* %2 to %Unit*
  %18 = call %Unit* (%Unit*, %Unit*, %Nat32) @memcpy (%Unit* %16, %Unit* %17, %Nat32 248)
;stmt7:
ret void
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt8:
  call void (%Index*, %Str, %Value*) @func128 (%Index* %0, %Str %1, %Value* %2)
  ret void
}

define void @func135 (%Block*, %Str, %Value*) {
;stmt0:
  %4 = getelementptr inbounds %Block, %Block* %0, i1 0, i32 1
  call void (%Index*, %Str, %Value*) @func134 (%Index* %4, %Str %1, %Value* %2)
  ret void
}

define void @func136 (%Str, %Value*) {
;stmt0:
  %3 = load %FuncContext*, %FuncContext** @fctx
  %4 = getelementptr inbounds %FuncContext, %FuncContext* %3, i1 0, i32 2
  %5 = load %Block*, %Block** %4
  call void (%Block*, %Str, %Value*) @func135 (%Block* %5, %Str %0, %Value* %1)
  ret void
}

define void @func137 (%Str, %Value*) {
;stmt0:
  %3 = load %Module*, %Module** @module
  %4 = getelementptr inbounds %Module, %Module* %3, i1 0, i32 0
  call void (%Index*, %Str, %Value*) @func134 (%Index* %4, %Str %0, %Value* %1)
  ret void
}

define void @func138 (%Index*, %Str, %Type*) {
;stmt0:
  call void (%Index*, %Str, %Type*) @func127 (%Index* %0, %Str %1, %Type* %2)
  ret void
}

define %Type* @func139 (%Str) {
;stmt0:
  %2 = load %Module*, %Module** @module
  %3 = getelementptr inbounds %Module, %Module* %2, i1 0, i32 0
  %4 = call %Type* (%Index*, %Str) @func129 (%Index* %3, %Str %0)
;stmt1:
  %5 = icmp ne %Type* %4, zeroinitializer
  br i1 %5, label %then_0, label %else_0
then_0:
;stmt2:
  ret %Type* %4
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt3:
  %7 = load %Module*, %Module** @module
  %8 = getelementptr inbounds %Module, %Module* %7, i1 0, i32 1
  %9 = call %Type* (%Index*, %Str) @func129 (%Index* %8, %Str %0)
  ret %Type* %9
}

define %Type* @func141 (%Str, %Block*) {
;stmt0:
  %3 = icmp eq %Block* %1, zeroinitializer
  br i1 %3, label %then_0, label %else_0
then_0:
;stmt1:
  ret %Type* zeroinitializer
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt2:
  %5 = getelementptr inbounds %Block, %Block* %1, i1 0, i32 1
  %6 = call %Type* (%Index*, %Str) @func129 (%Index* %5, %Str %0)
;stmt3:
  %7 = icmp ne %Type* %6, zeroinitializer
  br i1 %7, label %then_1, label %else_1
then_1:
;stmt4:
  ret %Type* %6
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt5:
  %9 = getelementptr inbounds %Block, %Block* %1, i1 0, i32 0
  %10 = load %Block*, %Block** %9
  %11 = call %Type* (%Str, %Block*) @func141 (%Str %0, %Block* %10)
  ret %Type* %11
}

define %Type* @func140 (%Str) {
;stmt0:
  %2 = getelementptr inbounds %Index, %Index* @builtinIndex, i1 0
  %3 = call %Type* (%Index*, %Str) @func129 (%Index* %2, %Str %0)
;stmt1:
  %4 = icmp ne %Type* %3, zeroinitializer
  br i1 %4, label %then_0, label %else_0
then_0:
;stmt2:
  ret %Type* %3
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt3:
  %6 = load %FuncContext*, %FuncContext** @fctx
  %7 = icmp ne %FuncContext* %6, zeroinitializer
  br i1 %7, label %then_1, label %else_1
then_1:
;stmt4:
  %8 = load %FuncContext*, %FuncContext** @fctx
  %9 = getelementptr inbounds %FuncContext, %FuncContext* %8, i1 0, i32 2
  %10 = load %Block*, %Block** %9
  %11 = call %Type* (%Str, %Block*) @func141 (%Str %0, %Block* %10)
;stmt5:
  %12 = icmp ne %Type* %11, zeroinitializer
  br i1 %12, label %then_2, label %else_2
then_2:
;stmt6:
  ret %Type* %11
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt7:
  %14 = call %Type* (%Str) @func139 (%Str %0)
;stmt8:
  %15 = icmp ne %Type* %14, zeroinitializer
  br i1 %15, label %then_3, label %else_3
then_3:
;stmt9:
  ret %Type* %14
  br label %endif_3
else_3:
  br label %endif_3
endif_3:
;stmt10:
  %17 = bitcast [5 x %Nat8]* @func140_str1 to %Str
  %18 = call %Int32 (%Str, %Str) @strcmp (%Str %0, %Str %17)
  %19 = icmp eq %Int32 %18, 0
  br i1 %19, label %then_4, label %else_4
then_4:
;stmt11:
  %20 = load %Type*, %Type** @ctype
  ret %Type* %20
  br label %endif_4
else_4:
  br label %endif_4
endif_4:
;stmt12:
  ret %Type* zeroinitializer
}

define %Str @func142 (%Str, %Nat32) {
;stmt0:
  %3 = alloca [32 x %Nat8]
  store [32 x %Nat8] zeroinitializer, [32 x %Nat8]* %3, align 1
;stmt1:
; index array
  %4 = getelementptr inbounds [32 x %Nat8], [32 x %Nat8]* %3, i1 0, %Int64 0
  %5 = bitcast %Nat8* %4 to %Unit*
  %6 = bitcast [3 x %Nat8]* @func142_str1 to %Str
  %7 = call %Int32 (%Unit*, %Str, ...) @sprintf (%Unit* %5, %Str %6, %Nat32 %1)
;stmt2:
; index array
  %8 = getelementptr inbounds [32 x %Nat8], [32 x %Nat8]* %3, i1 0, %Int64 0
  %9 = bitcast %Nat8* %8 to %Str
  %10 = call %Str (%Str, %Str) @cat (%Str %0, %Str %9)
  ret %Str %10
}

define %Str @func143 () {
;stmt0:
  %1 = load %Nat32, %Nat32* @local_type_id_cnt
  %2 = add %Nat32 %1, 1
  store %Nat32 %2, %Nat32* @local_type_id_cnt, align 4
;stmt1:
  %3 = load %FuncContext*, %FuncContext** @fctx
  %4 = getelementptr inbounds %FuncContext, %FuncContext* %3, i1 0, i32 0
  %5 = load %Str, %Str* %4
  %6 = bitcast [6 x %Nat8]* @func143_str1 to %Str
  %7 = call %Str (%Str, %Str) @cat (%Str %5, %Str %6)
;stmt2:
  %8 = load %Nat32, %Nat32* @local_type_id_cnt
  %9 = call %Str (%Str, %Nat32) @func142 (%Str %7, %Nat32 %8)
  ret %Str %9
}

define %Str @func144 () {
;stmt0:
  %1 = load %FuncContext*, %FuncContext** @fctx
  %2 = icmp ne %FuncContext* %1, zeroinitializer
  br i1 %2, label %then_0, label %else_0
then_0:
;stmt1:
  %3 = load %FuncContext*, %FuncContext** @fctx
  %4 = getelementptr inbounds %FuncContext, %FuncContext* %3, i1 0, i32 0
  %5 = load %Str, %Str* %4
  %6 = bitcast [2 x %Nat8]* @func144_str1 to %Str
  %7 = call %Str (%Str, %Str) @cat (%Str %5, %Str %6)
  ret %Str %7
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt2:
  %9 = bitcast [1 x %Nat8]* @func144_str2 to %Str
  ret %Str %9
}

define %Str @func145 (%Str, %Nat32*) {
;stmt0:
  %3 = call %Str () @func144 ()
;stmt1:
  %4 = load %Nat32, %Nat32* %1
  %5 = add %Nat32 %4, 1
  store %Nat32 %5, %Nat32* %1, align 4
;stmt2:
  %6 = load %Nat32, %Nat32* %1
  %7 = call %Str (%Str, %Nat32) @func142 (%Str %0, %Nat32 %6)
;stmt3:
  %8 = call %Str (%Str, %Str) @cat (%Str %3, %Str %7)
  ret %Str %8
}

define %Str @func146 () {
;stmt0:
  %1 = bitcast [5 x %Nat8]* @func146_str1 to %Str
  %2 = getelementptr inbounds %Nat32, %Nat32* @func_uid, i1 0
  %3 = call %Str (%Str, %Nat32*) @func145 (%Str %1, %Nat32* %2)
  ret %Str %3
}

define %Str @func147 () {
;stmt0:
  %1 = load %FuncContext*, %FuncContext** @fctx
  %2 = icmp ne %FuncContext* %1, zeroinitializer
  br i1 %2, label %then_0, label %else_0
then_0:
;stmt1:
  %3 = bitcast [4 x %Nat8]* @func147_str1 to %Str
  %4 = load %FuncContext*, %FuncContext** @fctx
  %5 = getelementptr inbounds %FuncContext, %FuncContext* %4, i1 0, i32 5
  %6 = call %Str (%Str, %Nat32*) @func145 (%Str %3, %Nat32* %5)
  ret %Str %6
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt2:
  %8 = bitcast [4 x %Nat8]* @func147_str2 to %Str
  %9 = getelementptr inbounds %Nat32, %Nat32* @str_uid, i1 0
  %10 = call %Str (%Str, %Nat32*) @func145 (%Str %8, %Nat32* %9)
  ret %Str %10
}

define %Str @func148 () {
;stmt0:
  %1 = bitcast [4 x %Nat8]* @func148_str1 to %Str
  %2 = getelementptr inbounds %Nat32, %Nat32* @arr_uid, i1 0
  %3 = call %Str (%Str, %Nat32*) @func145 (%Str %1, %Nat32* %2)
  ret %Str %3
}

define %Str @func149 () {
;stmt0:
  %1 = bitcast [4 x %Nat8]* @func149_str1 to %Str
  %2 = getelementptr inbounds %Nat32, %Nat32* @var_uid, i1 0
  %3 = call %Str (%Str, %Nat32*) @func145 (%Str %1, %Nat32* %2)
  ret %Str %3
}

define %Str @func150 () {
;stmt0:
  %1 = bitcast [5 x %Nat8]* @func150_str1 to %Str
  %2 = getelementptr inbounds %Nat32, %Nat32* @type_uid, i1 0
  %3 = call %Str (%Str, %Nat32*) @func145 (%Str %1, %Nat32* %2)
  ret %Str %3
}

define %Nat32 @prepart (%Str) {
;stmt0:
  %2 = alloca %Nat32
  store %Nat32 0, %Nat32* %2, align 4
;stmt1:
  %3 = alloca %Nat32
  store %Nat32 0, %Nat32* %3, align 4
;stmt2:
  br label %continue_0
continue_0:
  %4 = load %Nat32, %Nat32* %3
; eval index uarray
  %5 = getelementptr inbounds %Nat8, %Nat8* %0, %Nat32 %4
  %6 = load %Nat8, %Nat8* %5
  %7 = icmp ne %Nat8 %6, 0
  br i1 %7, label %body_0, label %break_0
body_0:
;stmt3:
  %8 = load %Nat32, %Nat32* %3
; eval index uarray
  %9 = getelementptr inbounds %Nat8, %Nat8* %0, %Nat32 %8
  %10 = load %Nat8, %Nat8* %9
; index array
  %11 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func151_str1, i1 0, %Int64 0
  %12 = load %Nat8, %Nat8* %11
  %13 = icmp eq %Nat8 %10, %12
  br i1 %13, label %then_0, label %else_0
then_0:
;stmt4:
  %14 = load %Nat32, %Nat32* %3
  %15 = add %Nat32 %14, 1
  store %Nat32 %15, %Nat32* %2, align 4
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt5:
  %16 = load %Nat32, %Nat32* %3
  %17 = add %Nat32 %16, 1
  store %Nat32 %17, %Nat32* %3, align 4
  br label %continue_0
break_0:
;stmt6:
  %18 = load %Nat32, %Nat32* %2
  ret %Nat32 %18
}

define %Str @getprefix (%Str) {
;stmt0:
  %2 = call %Nat32 (%Str) @prepart (%Str %0)
;stmt1:
  %3 = add %Nat32 %2, 1
  %4 = call %Unit* (%Nat32) @malloc (%Nat32 %3)
  %5 = bitcast %Unit* %4 to %Str
;stmt2:
  %6 = bitcast %Str %5 to %Unit*
  %7 = bitcast %Str %0 to %Unit*
  %8 = call %Unit* (%Unit*, %Unit*, %Nat32) @memcpy (%Unit* %6, %Unit* %7, %Nat32 %2)
;stmt3:
; eval index uarray
  %9 = getelementptr inbounds %Nat8, %Nat8* %5, %Nat32 %2
  store %Nat8 0, %Nat8* %9, align 1
;stmt4:
  ret %Str %5
}

define %Str @get_last (%Str) {
;stmt0:
  %2 = call %Nat32 (%Str) @prepart (%Str %0)
;stmt1:
  %3 = call %Nat32 (%Str) @strlen (%Str %0)
  %4 = sub %Nat32 %3, %2
;stmt2:
  %5 = add %Nat32 %4, 1
  %6 = call %Unit* (%Nat32) @malloc (%Nat32 %5)
  %7 = bitcast %Unit* %6 to %Str
;stmt3:
  %8 = bitcast %Str %7 to %Unit*
; eval index uarray
  %9 = getelementptr inbounds %Nat8, %Nat8* %0, %Nat32 %2
  %10 = bitcast %Nat8* %9 to %Unit*
  %11 = call %Unit* (%Unit*, %Unit*, %Nat32) @memcpy (%Unit* %8, %Unit* %10, %Nat32 %4)
;stmt4:
; eval index uarray
  %12 = getelementptr inbounds %Nat8, %Nat8* %7, %Nat32 %4
  store %Nat8 0, %Nat8* %12, align 1
;stmt5:
  ret %Str %7
}

define void @lex_init (%Str) {
;stmt0:
  %2 = call i1 (%Str) @exists (%Str %0)
  %3 = xor i1 %2, 1
  br i1 %3, label %then_0, label %else_0
then_0:
;stmt1:
  %4 = bitcast [11 x %Nat8]* @func154_str1 to %Str
  %5 = call %Int32 (%Str, ...) @printf (%Str %4, %Str %0)
;stmt2:
  %6 = bitcast [17 x %Nat8]* @func154_str2 to %Str
  call void (%Str) @fatal (%Str %6)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt3:
  %7 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 0
  %8 = call %Int32 (%Str, %Int32) @open (%Str %0, %Int32 0)
  store %Int32 %8, %Int32* %7, align 4
;stmt4:
  %9 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 5
  %10 = getelementptr inbounds %TokenInfo, %TokenInfo* %9, i1 0, i32 0
  store %Str %0, %Str* %10, align 8
;stmt5:
  %11 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 5
  %12 = getelementptr inbounds %TokenInfo, %TokenInfo* %11, i1 0, i32 3
  store %Nat32 1, %Nat32* %12, align 4
;stmt6:
  %13 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 4
  store %Nat16 1, %Nat16* %13, align 2
  ret void
}

define %Nat8 @getcc () {
;stmt0:
  %1 = alloca %Nat8
  store %Nat8 0, %Nat8* %1, align 1
;stmt1:
  %2 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 3
  %3 = load %Nat8, %Nat8* %2
  %4 = icmp ne %Nat8 %3, 0
  br i1 %4, label %then_0, label %else_0
then_0:
;stmt2:
  %5 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 3
  %6 = load %Nat8, %Nat8* %5
  store %Nat8 %6, %Nat8* %1, align 1
;stmt3:
  %7 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 3
  store %Nat8 0, %Nat8* %7, align 1
  br label %endif_0
else_0:
;stmt4:
  %8 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 0
  %9 = load %Int32, %Int32* %8
  %10 = getelementptr inbounds %Nat8, %Nat8* %1, i1 0
  %11 = call %Int32 (%Int32, %Nat8*, %Nat32) @read (%Int32 %9, %Nat8* %10, %Nat32 1)
;stmt5:
  %12 = icmp eq %Int32 %11, 0
  br i1 %12, label %then_1, label %else_1
then_1:
;stmt6:
  ret %Nat8 0
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt7:
  %14 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 4
  %15 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 4
  %16 = load %Nat16, %Nat16* %15
  %17 = add %Nat16 %16, 1
  store %Nat16 %17, %Nat16* %14, align 2
  br label %endif_0
endif_0:
;stmt8:
  %18 = load %Nat8, %Nat8* %1
  ret %Nat8 %18
}

define void @fill (%Rule) {
;stmt0:
  br label %continue_0
continue_0:
  br i1 1, label %body_0, label %break_0
body_0:
;stmt1:
  %2 = call %Nat8 () @getcc ()
;stmt2:
  %3 = icmp eq %Nat8 %2, 0
  br i1 %3, label %then_0, label %else_0
then_0:
;stmt3:
  %4 = bitcast [23 x %Nat8]* @func156_str1 to %Str
  call void (%Str) @fatal (%Str %4)
;stmt4:
  call void (%Int32) @exit (%Int32 1)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt5:
  %5 = call i1 (%Nat8) %0 (%Nat8 %2)
  br i1 %5, label %then_1, label %else_1
then_1:
;stmt6:
  %6 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 2
  %7 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 5
  %8 = getelementptr inbounds %TokenInfo, %TokenInfo* %7, i1 0, i32 2
  %9 = load %Nat16, %Nat16* %8
; index array
  %10 = getelementptr inbounds [255 x %Nat8], [255 x %Nat8]* %6, i1 0, %Nat16 %9
  store %Nat8 %2, %Nat8* %10, align 1
;stmt7:
  %11 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 5
  %12 = getelementptr inbounds %TokenInfo, %TokenInfo* %11, i1 0, i32 2
  %13 = load %Nat16, %Nat16* %12
  %14 = icmp uge %Nat16 %13, 254
  br i1 %14, label %then_2, label %else_2
then_2:
;stmt8:
  %15 = bitcast [16 x %Nat8]* @func156_str2 to %Str
  call void (%Str) @fatal (%Str %15)
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
;stmt9:
  %16 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 5
  %17 = getelementptr inbounds %TokenInfo, %TokenInfo* %16, i1 0, i32 2
  %18 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 5
  %19 = getelementptr inbounds %TokenInfo, %TokenInfo* %18, i1 0, i32 2
  %20 = load %Nat16, %Nat16* %19
  %21 = add %Nat16 %20, 1
  store %Nat16 %21, %Nat16* %17, align 2
  br label %endif_1
else_1:
;stmt10:
  call void (%Nat8) @func176 (%Nat8 %2)
;stmt11:
  %22 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 2
  %23 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 5
  %24 = getelementptr inbounds %TokenInfo, %TokenInfo* %23, i1 0, i32 2
  %25 = load %Nat16, %Nat16* %24
; index array
  %26 = getelementptr inbounds [255 x %Nat8], [255 x %Nat8]* %22, i1 0, %Nat16 %25
  store %Nat8 0, %Nat8* %26, align 1
;stmt12:
  br label %break_0
  br label %endif_1
endif_1:
  br label %continue_0
break_0:
  ret void
}

define i1 @blank (%Nat8) {
;stmt0:
; index array
  %2 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func157_str1, i1 0, %Int64 0
  %3 = load %Nat8, %Nat8* %2
  %4 = icmp eq %Nat8 %0, %3
; index array
  %5 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func157_str2, i1 0, %Int64 0
  %6 = load %Nat8, %Nat8* %5
  %7 = icmp eq %Nat8 %0, %6
  %8 = or i1 %4, %7
  ret i1 %8
}

define i1 @minus (%Nat8) {
;stmt0:
; index array
  %2 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func158_str1, i1 0, %Int64 0
  %3 = load %Nat8, %Nat8* %2
  %4 = icmp eq %Nat8 %0, %3
  ret i1 %4
}

define i1 @slash (%Nat8) {
;stmt0:
; index array
  %2 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func159_str1, i1 0, %Int64 0
  %3 = load %Nat8, %Nat8* %2
  %4 = icmp eq %Nat8 %0, %3
; index array
  %5 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func159_str2, i1 0, %Int64 0
  %6 = load %Nat8, %Nat8* %5
  %7 = icmp eq %Nat8 %0, %6
  %8 = or i1 %4, %7
  ret i1 %8
}

define i1 @rarrow (%Nat8) {
;stmt0:
; index array
  %2 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func160_str1, i1 0, %Int64 0
  %3 = load %Nat8, %Nat8* %2
  %4 = icmp eq %Nat8 %0, %3
; index array
  %5 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func160_str2, i1 0, %Int64 0
  %6 = load %Nat8, %Nat8* %5
  %7 = icmp eq %Nat8 %0, %6
  %8 = or i1 %4, %7
  ret i1 %8
}

define i1 @larrow (%Nat8) {
;stmt0:
; index array
  %2 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func161_str1, i1 0, %Int64 0
  %3 = load %Nat8, %Nat8* %2
  %4 = icmp eq %Nat8 %0, %3
; index array
  %5 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func161_str2, i1 0, %Int64 0
  %6 = load %Nat8, %Nat8* %5
  %7 = icmp eq %Nat8 %0, %6
  %8 = or i1 %4, %7
  ret i1 %8
}

define i1 @eq (%Nat8) {
;stmt0:
; index array
  %2 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func162_str1, i1 0, %Int64 0
  %3 = load %Nat8, %Nat8* %2
  %4 = icmp eq %Nat8 %0, %3
; index array
  %5 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func162_str2, i1 0, %Int64 0
  %6 = load %Nat8, %Nat8* %5
  %7 = icmp eq %Nat8 %0, %6
  %8 = or i1 %4, %7
  ret i1 %8
}

define i1 @ass (%Nat8) {
;stmt0:
; index array
  %2 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func163_str1, i1 0, %Int64 0
  %3 = load %Nat8, %Nat8* %2
  %4 = icmp eq %Nat8 %0, %3
  ret i1 %4
}

define i1 @bang (%Nat8) {
;stmt0:
; index array
  %2 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func164_str1, i1 0, %Int64 0
  %3 = load %Nat8, %Nat8* %2
  %4 = icmp eq %Nat8 %0, %3
  ret i1 %4
}

define i1 @id (%Nat8) {
;stmt0:
  %2 = call i1 (%Nat8) @isAlNum (%Nat8 %0)
; index array
  %3 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func165_str1, i1 0, %Int64 0
  %4 = load %Nat8, %Nat8* %3
  %5 = icmp eq %Nat8 %0, %4
; index array
  %6 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func165_str2, i1 0, %Int64 0
  %7 = load %Nat8, %Nat8* %6
  %8 = icmp eq %Nat8 %0, %7
  %9 = or i1 %5, %8
  %10 = or i1 %2, %9
  ret i1 %10
}

define i1 @digit (%Nat8) {
;stmt0:
  %2 = call i1 (%Nat8) @isAlNum (%Nat8 %0)
  ret i1 %2
}

define i1 @cpp_com (%Nat8) {
;stmt0:
; index array
  %2 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func167_str1, i1 0, %Int64 0
  %3 = load %Nat8, %Nat8* %2
  %4 = icmp ne %Nat8 %0, %3
  ret i1 %4
}

define void @x_nl () {
;stmt0:
  %1 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 1
  store %TokenKind 6, %TokenKind* %1, align 2
  ret void
}

define void @x_eof () {
;stmt0:
  %1 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 1
  store %TokenKind 0, %TokenKind* %1, align 2
;stmt1:
  %2 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 2
; index array
  %3 = getelementptr inbounds [255 x %Nat8], [255 x %Nat8]* %2, i1 0, %Int64 0
  store %Nat8 0, %Nat8* %3, align 1
;stmt2:
  %4 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 5
  %5 = getelementptr inbounds %TokenInfo, %TokenInfo* %4, i1 0, i32 2
  store %Nat16 0, %Nat16* %5, align 2
  ret void
}

define void @func171 () {
  ret void
}

define %TokenKind @getToken () {
;stmt0:
  %1 = alloca %Nat8
  store %Nat8 0, %Nat8* %1, align 1
;stmt1:
  %2 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 1
  %3 = load %TokenKind, %TokenKind* %2
  %4 = icmp eq %TokenKind %3, 6
  br i1 %4, label %then_0, label %else_0
then_0:
;stmt2:
  call void () @func175 ()
;stmt3:
  %5 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 4
  store %Nat16 0, %Nat16* %5, align 2
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt4:
  %6 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 1
  store %TokenKind 0, %TokenKind* %6, align 2
;stmt5:
  %7 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 5
  %8 = getelementptr inbounds %TokenInfo, %TokenInfo* %7, i1 0, i32 2
  store %Nat16 0, %Nat16* %8, align 2
;stmt6:
  br label %continue_0
continue_0:
  br i1 1, label %body_0, label %break_0
body_0:
;stmt7:
  %9 = call %Nat8 () @getcc ()
  store %Nat8 %9, %Nat8* %1, align 1
;stmt8:
  %10 = load %Nat8, %Nat8* %1
  %11 = call i1 (%Nat8) @blank (%Nat8 %10)
  %12 = xor i1 %11, 1
  br i1 %12, label %then_1, label %else_1
then_1:
;stmt9:
  br label %break_0
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  br label %continue_0
break_0:
;stmt10:
  %14 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 5
  %15 = getelementptr inbounds %TokenInfo, %TokenInfo* %14, i1 0, i32 4
  %16 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 4
  %17 = load %Nat16, %Nat16* %16
  store %Nat16 %17, %Nat16* %15, align 2
;stmt11:
  %18 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 5
  %19 = getelementptr inbounds %TokenInfo, %TokenInfo* %18, i1 0, i32 1
  %20 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 0
  %21 = load %Int32, %Int32* %20
  %22 = call %Int64 (%Int32, %Int64, %Int32) @lseek (%Int32 %21, %Int64 0, %Int32 1)
  %23 = bitcast %Int64 %22 to %Nat64
  store %Nat64 %23, %Nat64* %19, align 8
;stmt12:
  %24 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 2
; index array
  %25 = getelementptr inbounds [255 x %Nat8], [255 x %Nat8]* %24, i1 0, %Int64 0
  %26 = load %Nat8, %Nat8* %1
  store %Nat8 %26, %Nat8* %25, align 1
;stmt13:
  %27 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 5
  %28 = getelementptr inbounds %TokenInfo, %TokenInfo* %27, i1 0, i32 2
  store %Nat16 1, %Nat16* %28, align 2
;stmt14:
  %29 = load %Nat8, %Nat8* %1
  %30 = call i1 (%Nat8) @isAlpha (%Nat8 %29)
  %31 = load %Nat8, %Nat8* %1
; index array
  %32 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func170_str1, i1 0, %Int64 0
  %33 = load %Nat8, %Nat8* %32
  %34 = icmp eq %Nat8 %31, %33
  %35 = load %Nat8, %Nat8* %1
; index array
  %36 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func170_str2, i1 0, %Int64 0
  %37 = load %Nat8, %Nat8* %36
  %38 = icmp eq %Nat8 %35, %37
  %39 = or i1 %34, %38
  %40 = or i1 %30, %39
  br i1 %40, label %then_2, label %else_2
then_2:
;stmt15:
  %41 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 1
  store %TokenKind 1, %TokenKind* %41, align 2
;stmt16:
  call void (%Rule) @fill (%Rule @id)
  br label %endif_2
else_2:
;stmt17:
  %42 = load %Nat8, %Nat8* %1
  %43 = call i1 (%Nat8) @isDigit (%Nat8 %42)
  br i1 %43, label %then_3, label %else_3
then_3:
;stmt18:
  %44 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 1
  store %TokenKind 2, %TokenKind* %44, align 2
;stmt19:
  call void (%Rule) @fill (%Rule @digit)
  br label %endif_3
else_3:
;stmt20:
  %45 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 1
  store %TokenKind 3, %TokenKind* %45, align 2
;stmt21:
  %46 = load %Nat8, %Nat8* %1
  br label %select_1_0
select_1_0:
; index array
  %47 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func170_str3, i1 0, %Int64 0
  %48 = load %Nat8, %Nat8* %47
  %49 = icmp eq %Nat8 %46, %48
  br i1 %49, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  call void () @x_nl ()
  br label %select_1_end
select_1_1:
; index array
  %50 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func170_str4, i1 0, %Int64 0
  %51 = load %Nat8, %Nat8* %50
  %52 = icmp eq %Nat8 %46, %51
  br i1 %52, label %select_1_1_ok, label %select_1_2
select_1_1_ok:
  call void (%Rule) @fill (%Rule @ass)
  br label %select_1_end
select_1_2:
; index array
  %53 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func170_str5, i1 0, %Int64 0
  %54 = load %Nat8, %Nat8* %53
  %55 = icmp eq %Nat8 %46, %54
  br i1 %55, label %select_1_2_ok, label %select_1_3
select_1_2_ok:
  call void (%Rule) @fill (%Rule @eq)
  br label %select_1_end
select_1_3:
; index array
  %56 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func170_str6, i1 0, %Int64 0
  %57 = load %Nat8, %Nat8* %56
  %58 = icmp eq %Nat8 %46, %57
  br i1 %58, label %select_1_3_ok, label %select_1_4
select_1_3_ok:
  call void (%Rule) @fill (%Rule @minus)
  br label %select_1_end
select_1_4:
; index array
  %59 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func170_str7, i1 0, %Int64 0
  %60 = load %Nat8, %Nat8* %59
  %61 = icmp eq %Nat8 %46, %60
  br i1 %61, label %select_1_4_ok, label %select_1_5
select_1_4_ok:
  call void () @func172 ()
  br label %select_1_end
select_1_5:
; index array
  %62 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func170_str8, i1 0, %Int64 0
  %63 = load %Nat8, %Nat8* %62
  %64 = icmp eq %Nat8 %46, %63
  br i1 %64, label %select_1_5_ok, label %select_1_6
select_1_5_ok:
  call void (%Rule) @fill (%Rule @rarrow)
  br label %select_1_end
select_1_6:
; index array
  %65 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func170_str9, i1 0, %Int64 0
  %66 = load %Nat8, %Nat8* %65
  %67 = icmp eq %Nat8 %46, %66
  br i1 %67, label %select_1_6_ok, label %select_1_7
select_1_6_ok:
  call void (%Rule) @fill (%Rule @larrow)
  br label %select_1_end
select_1_7:
; index array
  %68 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func170_str10, i1 0, %Int64 0
  %69 = load %Nat8, %Nat8* %68
  %70 = icmp eq %Nat8 %46, %69
  br i1 %70, label %select_1_7_ok, label %select_1_8
select_1_7_ok:
  call void (%Rule) @fill (%Rule @bang)
  br label %select_1_end
select_1_8:
; index array
  %71 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func170_str11, i1 0, %Int64 0
  %72 = load %Nat8, %Nat8* %71
  %73 = icmp eq %Nat8 %46, %72
  br i1 %73, label %select_1_8_ok, label %select_1_9
select_1_8_ok:
  call void () @func173 ()
  br label %select_1_end
select_1_9:
  %74 = icmp eq %Nat8 %46, 0
  br i1 %74, label %select_1_9_ok, label %select_1_10
select_1_9_ok:
  call void () @x_eof ()
  br label %select_1_end
select_1_10:
  call void () @func171 ()
  br label %select_1_end
select_1_end:
  br label %endif_3
endif_3:
  br label %endif_2
endif_2:
;stmt22:
  %75 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 2
  %76 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 5
  %77 = getelementptr inbounds %TokenInfo, %TokenInfo* %76, i1 0, i32 2
  %78 = load %Nat16, %Nat16* %77
; index array
  %79 = getelementptr inbounds [255 x %Nat8], [255 x %Nat8]* %75, i1 0, %Nat16 %78
  store %Nat8 0, %Nat8* %79, align 1
;stmt23:
  %80 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 1
  %81 = load %TokenKind, %TokenKind* %80
  ret %TokenKind %81
}

define void @func172 () {
;stmt0:
  %1 = alloca %Nat8
  store %Nat8 0, %Nat8* %1, align 1
;stmt1:
  %2 = call %Nat8 () @getcc ()
;stmt2:
; index array
  %3 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func172_str1, i1 0, %Int64 0
  %4 = load %Nat8, %Nat8* %3
  %5 = icmp eq %Nat8 %2, %4
  br i1 %5, label %then_0, label %else_0
then_0:
;stmt3:
  call void (%Nat8) @func176 (%Nat8 %2)
;stmt4:
  call void (%Rule) @fill (%Rule @cpp_com)
;stmt5:
  %6 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 1
  store %TokenKind 5, %TokenKind* %6, align 2
  br label %endif_0
else_0:
;stmt6:
; index array
  %7 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func172_str2, i1 0, %Int64 0
  %8 = load %Nat8, %Nat8* %7
  %9 = icmp eq %Nat8 %2, %8
  br i1 %9, label %then_1, label %else_1
then_1:
;stmt7:
  %10 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 1
  store %TokenKind 5, %TokenKind* %10, align 2
;stmt8:
  %11 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 2
; index array
  %12 = getelementptr inbounds [255 x %Nat8], [255 x %Nat8]* %11, i1 0, %Int64 0
  store %Nat8 0, %Nat8* %12, align 1
;stmt9:
  br label %continue_0
continue_0:
  br i1 1, label %body_0, label %break_0
body_0:
;stmt10:
  %13 = call %Nat8 () @getcc ()
  store %Nat8 %13, %Nat8* %1, align 1
;stmt11:
  %14 = load %Nat8, %Nat8* %1
  %15 = icmp eq %Nat8 %14, 0
  br i1 %15, label %then_2, label %else_2
then_2:
;stmt12:
  %16 = bitcast [23 x %Nat8]* @func172_str3 to %Str
  call void (%Str) @fatal (%Str %16)
  br label %endif_2
else_2:
;stmt13:
  %17 = load %Nat8, %Nat8* %1
; index array
  %18 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func172_str4, i1 0, %Int64 0
  %19 = load %Nat8, %Nat8* %18
  %20 = icmp eq %Nat8 %17, %19
  br i1 %20, label %then_3, label %else_3
then_3:
;stmt14:
  %21 = call %Nat8 () @getcc ()
  store %Nat8 %21, %Nat8* %1, align 1
;stmt15:
  %22 = load %Nat8, %Nat8* %1
; index array
  %23 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func172_str5, i1 0, %Int64 0
  %24 = load %Nat8, %Nat8* %23
  %25 = icmp eq %Nat8 %22, %24
  br i1 %25, label %then_4, label %else_4
then_4:
;stmt16:
  %26 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 2
  %27 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 5
  %28 = getelementptr inbounds %TokenInfo, %TokenInfo* %27, i1 0, i32 2
  %29 = load %Nat16, %Nat16* %28
; index array
  %30 = getelementptr inbounds [255 x %Nat8], [255 x %Nat8]* %26, i1 0, %Nat16 %29
  store %Nat8 0, %Nat8* %30, align 1
;stmt17:
ret void
  br label %endif_4
else_4:
;stmt18:
  %32 = load %Nat8, %Nat8* %1
  call void (%Nat8) @func176 (%Nat8 %32)
  br label %endif_4
endif_4:
  br label %endif_3
else_3:
;stmt19:
  %33 = load %Nat8, %Nat8* %1
; index array
  %34 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func172_str6, i1 0, %Int64 0
  %35 = load %Nat8, %Nat8* %34
  %36 = icmp eq %Nat8 %33, %35
  br i1 %36, label %then_5, label %else_5
then_5:
;stmt20:
  call void () @func175 ()
  br label %endif_5
else_5:
  br label %endif_5
endif_5:
  br label %endif_3
endif_3:
  br label %endif_2
endif_2:
  br label %continue_0
break_0:
  br label %endif_1
else_1:
;stmt21:
  call void (%Nat8) @func176 (%Nat8 %2)
;stmt22:
  call void (%Rule) @fill (%Rule @slash)
  br label %endif_1
endif_1:
  br label %endif_0
endif_0:
  ret void
}

define void @func173 () {
;stmt0:
  %1 = alloca %Nat8
  store %Nat8 0, %Nat8* %1, align 1
;stmt1:
  %2 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 1
  store %TokenKind 4, %TokenKind* %2, align 2
;stmt2:
  %3 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 5
  %4 = getelementptr inbounds %TokenInfo, %TokenInfo* %3, i1 0, i32 2
  store %Nat16 0, %Nat16* %4, align 2
;stmt3:
  br label %continue_0
continue_0:
  br i1 1, label %body_0, label %break_0
body_0:
;stmt4:
  %5 = call %Nat8 () @getcc ()
  store %Nat8 %5, %Nat8* %1, align 1
;stmt5:
  %6 = load %Nat8, %Nat8* %1
; index array
  %7 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func173_str1, i1 0, %Int64 0
  %8 = load %Nat8, %Nat8* %7
  %9 = icmp eq %Nat8 %6, %8
  br i1 %9, label %then_0, label %else_0
then_0:
;stmt6:
  br label %break_0
  br label %endif_0
else_0:
;stmt7:
  %11 = load %Nat8, %Nat8* %1
  %12 = icmp eq %Nat8 %11, 0
  br i1 %12, label %then_1, label %else_1
then_1:
;stmt8:
  %13 = bitcast [23 x %Nat8]* @func173_str2 to %Str
  call void (%Str) @fatal (%Str %13)
  br label %endif_1
else_1:
;stmt9:
  %14 = load %Nat8, %Nat8* %1
; index array
  %15 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func173_str3, i1 0, %Int64 0
  %16 = load %Nat8, %Nat8* %15
  %17 = icmp eq %Nat8 %14, %16
  br i1 %17, label %then_2, label %else_2
then_2:
;stmt10:
  %18 = call %Nat8 () @getcc ()
  store %Nat8 %18, %Nat8* %1, align 1
;stmt11:
  %19 = load %Nat8, %Nat8* %1
  br label %select_1_0
select_1_0:
; index array
  %20 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func173_str4, i1 0, %Int64 0
  %21 = load %Nat8, %Nat8* %20
  %22 = icmp eq %Nat8 %19, %21
  br i1 %22, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
; index array
  %23 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func173_str5, i1 0, %Int64 0
  %24 = load %Nat8, %Nat8* %23
  br label %select_1_end
select_1_1:
; index array
  %25 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func173_str6, i1 0, %Int64 0
  %26 = load %Nat8, %Nat8* %25
  %27 = icmp eq %Nat8 %19, %26
  br i1 %27, label %select_1_1_ok, label %select_1_2
select_1_1_ok:
; index array
  %28 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func173_str7, i1 0, %Int64 0
  %29 = load %Nat8, %Nat8* %28
  br label %select_1_end
select_1_2:
; index array
  %30 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func173_str8, i1 0, %Int64 0
  %31 = load %Nat8, %Nat8* %30
  %32 = icmp eq %Nat8 %19, %31
  br i1 %32, label %select_1_2_ok, label %select_1_3
select_1_2_ok:
; index array
  %33 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func173_str9, i1 0, %Int64 0
  %34 = load %Nat8, %Nat8* %33
  br label %select_1_end
select_1_3:
; index array
  %35 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func173_str10, i1 0, %Int64 0
  %36 = load %Nat8, %Nat8* %35
  %37 = icmp eq %Nat8 %19, %36
  br i1 %37, label %select_1_3_ok, label %select_1_4
select_1_3_ok:
; index array
  %38 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func173_str11, i1 0, %Int64 0
  %39 = load %Nat8, %Nat8* %38
  br label %select_1_end
select_1_4:
; index array
  %40 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func173_str12, i1 0, %Int64 0
  %41 = load %Nat8, %Nat8* %40
  %42 = icmp eq %Nat8 %19, %41
  br i1 %42, label %select_1_4_ok, label %select_1_5
select_1_4_ok:
; index array
  %43 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func173_str13, i1 0, %Int64 0
  %44 = load %Nat8, %Nat8* %43
  br label %select_1_end
select_1_5:
; index array
  %45 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func173_str14, i1 0, %Int64 0
  %46 = load %Nat8, %Nat8* %45
  %47 = icmp eq %Nat8 %19, %46
  br i1 %47, label %select_1_5_ok, label %select_1_6
select_1_5_ok:
; index array
  %48 = getelementptr inbounds [1 x %Nat8], [1 x %Nat8]* @func173_str15, i1 0, %Int64 0
  %49 = load %Nat8, %Nat8* %48
  br label %select_1_end
select_1_6:
; index array
  %50 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func173_str16, i1 0, %Int64 0
  %51 = load %Nat8, %Nat8* %50
  %52 = icmp eq %Nat8 %19, %51
  br i1 %52, label %select_1_6_ok, label %select_1_7
select_1_6_ok:
; index array
  %53 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func173_str17, i1 0, %Int64 0
  %54 = load %Nat8, %Nat8* %53
  br label %select_1_end
select_1_7:
; index array
  %55 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func173_str18, i1 0, %Int64 0
  %56 = load %Nat8, %Nat8* %55
  %57 = icmp eq %Nat8 %19, %56
  br i1 %57, label %select_1_7_ok, label %select_1_8
select_1_7_ok:
; index array
  %58 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func173_str19, i1 0, %Int64 0
  %59 = load %Nat8, %Nat8* %58
  br label %select_1_end
select_1_8:
; index array
  %60 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func173_str20, i1 0, %Int64 0
  %61 = load %Nat8, %Nat8* %60
  %62 = icmp eq %Nat8 %19, %61
  br i1 %62, label %select_1_8_ok, label %select_1_9
select_1_8_ok:
; index array
  %63 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func173_str21, i1 0, %Int64 0
  %64 = load %Nat8, %Nat8* %63
  br label %select_1_end
select_1_9:
  %65 = load %Nat8, %Nat8* %1
  br label %select_1_end
select_1_end:
  %66 = phi %Nat8 [ %24, %select_1_0_ok ], [ %29, %select_1_1_ok ], [ %34, %select_1_2_ok ], [ %39, %select_1_3_ok ], [ %44, %select_1_4_ok ], [ %49, %select_1_5_ok ], [ %54, %select_1_6_ok ], [ %59, %select_1_7_ok ], [ %64, %select_1_8_ok ], [ %65, %select_1_9 ]
  store %Nat8 %66, %Nat8* %1, align 1
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
  br label %endif_1
endif_1:
  br label %endif_0
endif_0:
;stmt12:
  %67 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 5
  %68 = getelementptr inbounds %TokenInfo, %TokenInfo* %67, i1 0, i32 2
  %69 = load %Nat16, %Nat16* %68
  %70 = icmp uge %Nat16 %69, 254
  br i1 %70, label %then_3, label %else_3
then_3:
;stmt13:
  %71 = bitcast [17 x %Nat8]* @func173_str22 to %Str
  call void (%Str) @fatal (%Str %71)
  br label %endif_3
else_3:
  br label %endif_3
endif_3:
;stmt14:
  %72 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 2
  %73 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 5
  %74 = getelementptr inbounds %TokenInfo, %TokenInfo* %73, i1 0, i32 2
  %75 = load %Nat16, %Nat16* %74
; index array
  %76 = getelementptr inbounds [255 x %Nat8], [255 x %Nat8]* %72, i1 0, %Nat16 %75
  %77 = load %Nat8, %Nat8* %1
  store %Nat8 %77, %Nat8* %76, align 1
;stmt15:
  %78 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 5
  %79 = getelementptr inbounds %TokenInfo, %TokenInfo* %78, i1 0, i32 2
  %80 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 5
  %81 = getelementptr inbounds %TokenInfo, %TokenInfo* %80, i1 0, i32 2
  %82 = load %Nat16, %Nat16* %81
  %83 = add %Nat16 %82, 1
  store %Nat16 %83, %Nat16* %79, align 2
  br label %continue_0
break_0:
  ret void
}

define %Source* @tokenize (%Str) {
;stmt0:
  %2 = call %Unit* (%Nat32) @malloc (%Nat32 24)
  %3 = bitcast %Unit* %2 to %Source*
;stmt1:
  %4 = getelementptr inbounds %Source, %Source* %3, i1 0, i32 0
  call void (%List*) @map_init (%List* %4)
;stmt2:
  call void (%Str) @lex_init (%Str %0)
;stmt3:
  br label %continue_0
continue_0:
  br i1 1, label %body_0, label %break_0
body_0:
;stmt4:
  %5 = call %TokenKind () @getToken ()
;stmt5:
  %6 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 5
  %7 = getelementptr inbounds %TokenInfo, %TokenInfo* %6, i1 0, i32 2
  %8 = load %Nat16, %Nat16* %7
  %9 = add %Nat16 %8, 1
;stmt6:
  %10 = zext %Nat16 %9 to %Nat32
  %11 = add %Nat32 40, %10
  %12 = call %Unit* (%Nat32) @malloc (%Nat32 %11)
  %13 = bitcast %Unit* %12 to %Token*
;stmt7:
  %14 = getelementptr inbounds %Token, %Token* %13, i1 0, i32 0
  %15 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 1
  %16 = load %TokenKind, %TokenKind* %15
  store %TokenKind %16, %TokenKind* %14, align 2
;stmt8:
  %17 = getelementptr inbounds %Token, %Token* %13, i1 0, i32 1
  %18 = getelementptr inbounds %TokenInfo, %TokenInfo* %17, i1 0, i32 2
  %19 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 5
  %20 = getelementptr inbounds %TokenInfo, %TokenInfo* %19, i1 0, i32 2
  %21 = load %Nat16, %Nat16* %20
  store %Nat16 %21, %Nat16* %18, align 2
;stmt9:
  %22 = getelementptr inbounds %Token, %Token* %13, i1 0, i32 1
  %23 = getelementptr inbounds %TokenInfo, %TokenInfo* %22, i1 0, i32 0
  %24 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 5
  %25 = getelementptr inbounds %TokenInfo, %TokenInfo* %24, i1 0, i32 0
  %26 = load %Str, %Str* %25
  store %Str %26, %Str* %23, align 8
;stmt10:
  %27 = getelementptr inbounds %Token, %Token* %13, i1 0, i32 1
  %28 = getelementptr inbounds %TokenInfo, %TokenInfo* %27, i1 0, i32 3
  %29 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 5
  %30 = getelementptr inbounds %TokenInfo, %TokenInfo* %29, i1 0, i32 3
  %31 = load %Nat32, %Nat32* %30
  store %Nat32 %31, %Nat32* %28, align 4
;stmt11:
  %32 = getelementptr inbounds %Token, %Token* %13, i1 0, i32 1
  %33 = getelementptr inbounds %TokenInfo, %TokenInfo* %32, i1 0, i32 4
  %34 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 5
  %35 = getelementptr inbounds %TokenInfo, %TokenInfo* %34, i1 0, i32 4
  %36 = load %Nat16, %Nat16* %35
  store %Nat16 %36, %Nat16* %33, align 2
;stmt12:
  %37 = getelementptr inbounds %Token, %Token* %13, i1 0, i32 2
  %38 = bitcast [0 x %Nat8]* %37 to %Unit*
  %39 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 2
  %40 = bitcast [255 x %Nat8]* %39 to %Unit*
  %41 = zext %Nat16 %9 to %Nat32
  %42 = call %Unit* (%Unit*, %Unit*, %Nat32) @memcpy (%Unit* %38, %Unit* %40, %Nat32 %41)
;stmt13:
  %43 = getelementptr inbounds %Token, %Token* %13, i1 0, i32 2
  %44 = add %Nat16 %9, 1
; index array
  %45 = getelementptr inbounds [0 x %Nat8], [0 x %Nat8]* %43, i1 0, %Nat16 %44
  store %Nat8 0, %Nat8* %45, align 1
;stmt14:
  %46 = getelementptr inbounds %Source, %Source* %3, i1 0, i32 0
  %47 = bitcast %Token* %13 to %Unit*
  %48 = call i1 (%List*, %Unit*) @list_append (%List* %46, %Unit* %47)
;stmt15:
  %49 = icmp eq %TokenKind %5, 0
  br i1 %49, label %then_0, label %else_0
then_0:
;stmt16:
  br label %break_0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  br label %continue_0
break_0:
;stmt17:
  %51 = load %Nat32, %Nat32* @lines
  %52 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 5
  %53 = getelementptr inbounds %TokenInfo, %TokenInfo* %52, i1 0, i32 3
  %54 = load %Nat32, %Nat32* %53
  %55 = add %Nat32 %51, %54
  store %Nat32 %55, %Nat32* @lines, align 4
;stmt18:
  ret %Source* %3
}

define void @func175 () {
;stmt0:
  %1 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 5
  %2 = getelementptr inbounds %TokenInfo, %TokenInfo* %1, i1 0, i32 3
  %3 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 5
  %4 = getelementptr inbounds %TokenInfo, %TokenInfo* %3, i1 0, i32 3
  %5 = load %Nat32, %Nat32* %4
  %6 = add %Nat32 %5, 1
  store %Nat32 %6, %Nat32* %2, align 4
  ret void
}

define void @func176 (%Nat8) {
;stmt0:
  %2 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 3
  store %Nat8 %0, %Nat8* %2, align 1
  ret void
}

define %Node* @gett () {
;stmt0:
  %1 = getelementptr inbounds %ParserState, %ParserState* @pstat, i1 0, i32 1
  %2 = load %Node*, %Node** %1
  ret %Node* %2
}

define void @sett (%Node*) {
;stmt0:
  %2 = getelementptr inbounds %ParserState, %ParserState* @pstat, i1 0, i32 1
  store %Node* %0, %Node** %2, align 8
  ret void
}

define void @skip () {
;stmt0:
  %1 = getelementptr inbounds %ParserState, %ParserState* @pstat, i1 0, i32 1
  %2 = getelementptr inbounds %ParserState, %ParserState* @pstat, i1 0, i32 1
  %3 = load %Node*, %Node** %2
  %4 = getelementptr inbounds %Node, %Node* %3, i1 0, i32 1
  %5 = load %Node*, %Node** %4
  store %Node* %5, %Node** %1, align 8
  ret void
}

define void @skip_nl () {
;stmt0:
  br label %continue_0
continue_0:
  %1 = bitcast [2 x %Nat8]* @func180_str1 to %Str
  %2 = call i1 (%Str) @func187 (%Str %1)
  br i1 %2, label %body_0, label %break_0
body_0:
  br label %continue_0
break_0:
  ret void
}

define %Token* @func181 () {
;stmt0:
  %1 = call %Node* () @gett ()
  %2 = getelementptr inbounds %Node, %Node* %1, i1 0, i32 3
  %3 = load %Unit*, %Unit** %2
  %4 = bitcast %Unit* %3 to %Token*
;stmt1:
  %5 = load i1, i1* @comments
  %6 = xor i1 %5, 1
  br i1 %6, label %then_0, label %else_0
then_0:
;stmt2:
  %7 = getelementptr inbounds %Token, %Token* %4, i1 0, i32 0
  %8 = load %TokenKind, %TokenKind* %7
  %9 = icmp eq %TokenKind %8, 5
  br i1 %9, label %then_1, label %else_1
then_1:
;stmt3:
  call void () @skip ()
;stmt4:
  %10 = call %Token* () @func181 ()
  ret %Token* %10
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt5:
  ret %Token* %4
}

define i1 @eof () {
;stmt0:
  %1 = call %Token* () @func181 ()
  %2 = getelementptr inbounds %Token, %Token* %1, i1 0, i32 0
  %3 = load %TokenKind, %TokenKind* %2
  %4 = icmp eq %TokenKind %3, 0
  ret i1 %4
}

define %Token* @nextok () {
;stmt0:
  %1 = call %Node* () @gett ()
  %2 = getelementptr inbounds %Node, %Node* %1, i1 0, i32 1
  %3 = load %Node*, %Node** %2
  %4 = icmp ne %Node* %3, zeroinitializer
  br i1 %4, label %then_0, label %else_0
then_0:
;stmt1:
  %5 = call %Node* () @gett ()
  %6 = getelementptr inbounds %Node, %Node* %5, i1 0, i32 1
  %7 = load %Node*, %Node** %6
  %8 = getelementptr inbounds %Node, %Node* %7, i1 0, i32 3
  %9 = load %Unit*, %Unit** %8
  %10 = bitcast %Unit* %9 to %Token*
  ret %Token* %10
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt2:
  ret %Token* zeroinitializer
}

define i1 @sep () {
;stmt0:
  %1 = call %Token* () @func181 ()
;stmt1:
  %2 = call i1 () @func185 ()
;stmt2:
  %3 = icmp eq i1 %2, 0
  br i1 %3, label %then_0, label %else_0
then_0:
;stmt3:
  %4 = bitcast [19 x %Nat8]* @func184_str1 to %Str
  %5 = getelementptr inbounds %Token, %Token* %1, i1 0, i32 1
  call void (%Str, %TokenInfo*) @error (%Str %4, %TokenInfo* %5)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt4:
  ret i1 %2
}

define i1 @func185 () {
;stmt0:
  %1 = call %Token* () @func181 ()
  %2 = getelementptr inbounds %Token, %Token* %1, i1 0, i32 2
; index array
  %3 = getelementptr inbounds [0 x %Nat8], [0 x %Nat8]* %2, i1 0, %Int64 0
  %4 = load %Nat8, %Nat8* %3
;stmt1:
; index array
  %5 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func185_str1, i1 0, %Int64 0
  %6 = load %Nat8, %Nat8* %5
  %7 = icmp eq %Nat8 %4, %6
; index array
  %8 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func185_str2, i1 0, %Int64 0
  %9 = load %Nat8, %Nat8* %8
  %10 = icmp eq %Nat8 %4, %9
  %11 = or i1 %7, %10
  br i1 %11, label %then_0, label %else_0
then_0:
;stmt2:
  call void () @skip ()
;stmt3:
  ret i1 1
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt4:
; index array
  %13 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func185_str3, i1 0, %Int64 0
  %14 = load %Nat8, %Nat8* %13
  %15 = icmp eq %Nat8 %4, %14
; index array
  %16 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func185_str4, i1 0, %Int64 0
  %17 = load %Nat8, %Nat8* %16
  %18 = icmp eq %Nat8 %4, %17
  %19 = or i1 %15, %18
  br i1 %19, label %then_1, label %else_1
then_1:
;stmt5:
  ret i1 1
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt6:
  ret i1 0
}

define void @skipto (%Str) {
;stmt0:
  %2 = bitcast [29 x %Nat8]* @func186_str1 to %Str
  call void (%Str, %TokenInfo*) @error (%Str %2, %TokenInfo* zeroinitializer)
;stmt1:
  %3 = bitcast [12 x %Nat8]* @func186_str2 to %Str
  %4 = call %Token* () @func181 ()
  %5 = getelementptr inbounds %Token, %Token* %4, i1 0, i32 2
  %6 = call %Int32 (%Str, ...) @printf (%Str %3, [0 x %Nat8]* %5)
;stmt2:
  %7 = bitcast [18 x %Nat8]* @func186_str3 to %Str
  %8 = call %Int32 (%Str, ...) @printf (%Str %7, %Str %0)
;stmt3:
  call void (%Int32) @exit (%Int32 1)
  ret void
}

define i1 @func187 (%Str) {
;stmt0:
  %2 = call %Token* () @func181 ()
;stmt1:
  %3 = getelementptr inbounds %Token, %Token* %2, i1 0, i32 0
  %4 = load %TokenKind, %TokenKind* %3
;stmt2:
  %5 = icmp eq %TokenKind %4, 4
  %6 = icmp eq %TokenKind %4, 0
  %7 = or i1 %5, %6
  br i1 %7, label %then_0, label %else_0
then_0:
;stmt3:
  ret i1 0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt4:
  %9 = getelementptr inbounds %Token, %Token* %2, i1 0, i32 2
  %10 = bitcast [0 x %Nat8]* %9 to %Str
  %11 = call %Int32 (%Str, %Str) @strcmp (%Str %0, %Str %10)
  %12 = icmp eq %Int32 %11, 0
;stmt5:
  br i1 %12, label %then_1, label %else_1
then_1:
;stmt6:
  call void () @skip ()
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt7:
  ret i1 %12
}

define i1 @need (%Str) {
;stmt0:
  %2 = call i1 (%Str) @func187 (%Str %0)
;stmt1:
  %3 = icmp eq i1 %2, 0
  br i1 %3, label %then_0, label %else_0
then_0:
;stmt2:
  %4 = call %Token* () @func181 ()
;stmt3:
  %5 = bitcast [18 x %Nat8]* @func188_str1 to %Str
  %6 = getelementptr inbounds %Token, %Token* %4, i1 0, i32 1
  call void (%Str, %TokenInfo*) @error (%Str %5, %TokenInfo* %6)
;stmt4:
  %7 = bitcast [13 x %Nat8]* @func188_str2 to %Str
  %8 = call %Int32 (%Str, ...) @printf (%Str %7, %Str %0)
;stmt5:
  call void () @skip ()
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt6:
  ret i1 %2
}

define %AstId* @ast_id_new (%Str, %TokenInfo*) {
;stmt0:
  %3 = call %Unit* (%Nat32) @malloc (%Nat32 16)
  %4 = bitcast %Unit* %3 to %AstId*
;stmt1:
  %5 = icmp ne %AstId* %4, zeroinitializer
  %6 = bitcast [11 x %Nat8]* @func189_str1 to %Str
  call void (i1, %Str) @assert (i1 %5, %Str %6)
;stmt2:
  %7 = getelementptr inbounds %AstId, %AstId* %4, i1 0, i32 0
  store %Str %0, %Str* %7, align 8
;stmt3:
  %8 = getelementptr inbounds %AstId, %AstId* %4, i1 0, i32 1
  store %TokenInfo* %1, %TokenInfo** %8, align 8
;stmt4:
  ret %AstId* %4
}

define %AstId* @parse_id () {
;stmt0:
  %1 = call %Token* () @func181 ()
;stmt1:
  %2 = getelementptr inbounds %Token, %Token* %1, i1 0, i32 0
  %3 = load %TokenKind, %TokenKind* %2
  %4 = icmp ne %TokenKind %3, 1
  br i1 %4, label %then_0, label %else_0
then_0:
;stmt2:
  %5 = bitcast [12 x %Nat8]* @func190_str1 to %Str
  %6 = getelementptr inbounds %Token, %Token* %1, i1 0, i32 1
  call void (%Str, %TokenInfo*) @error (%Str %5, %TokenInfo* %6)
;stmt3:
  ret %AstId* zeroinitializer
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt4:
  %8 = getelementptr inbounds %Token, %Token* %1, i1 0, i32 2
; index array
  %9 = getelementptr inbounds [0 x %Nat8], [0 x %Nat8]* %8, i1 0, %Int64 0
  %10 = bitcast %Nat8* %9 to %Str
  %11 = getelementptr inbounds %Token, %Token* %1, i1 0, i32 1
  %12 = call %AstId* (%Str, %TokenInfo*) @ast_id_new (%Str %10, %TokenInfo* %11)
;stmt5:
  call void () @skip ()
;stmt6:
  ret %AstId* %12
}

define %AstName @parse_name () {
;stmt0:
  %1 = alloca %AstName
  store %AstName zeroinitializer, %AstName* %1, align 8
;stmt1:
  %2 = getelementptr inbounds %AstName, %AstName* %1, i1 0, i32 2
  %3 = call %Token* () @func181 ()
  %4 = getelementptr inbounds %Token, %Token* %3, i1 0, i32 1
  store %TokenInfo* %4, %TokenInfo** %2, align 8
;stmt2:
  %5 = call %AstId* () @parse_id ()
;stmt3:
  %6 = bitcast [2 x %Nat8]* @func191_str1 to %Str
  %7 = call i1 (%Str) @func187 (%Str %6)
  br i1 %7, label %then_0, label %else_0
then_0:
;stmt4:
  %8 = getelementptr inbounds %AstName, %AstName* %1, i1 0, i32 0
  %9 = call %AstId* () @parse_id ()
  store %AstId* %9, %AstId** %8, align 8
;stmt5:
  %10 = getelementptr inbounds %AstName, %AstName* %1, i1 0, i32 1
  store %AstId* %5, %AstId** %10, align 8
  br label %endif_0
else_0:
;stmt6:
  %11 = getelementptr inbounds %AstName, %AstName* %1, i1 0, i32 0
  store %AstId* %5, %AstId** %11, align 8
;stmt7:
  %12 = getelementptr inbounds %AstName, %AstName* %1, i1 0, i32 1
  store %AstId* zeroinitializer, %AstId** %12, align 8
  br label %endif_0
endif_0:
;stmt8:
  %13 = load %AstName, %AstName* %1
  ret %AstName %13
}

define %AstNode* @ast_node_new (%AstNodeKind, %Unit*) {
;stmt0:
  %3 = call %Unit* (%Nat32) @malloc (%Nat32 16)
  %4 = bitcast %Unit* %3 to %AstNode*
;stmt1:
  %5 = icmp ne %AstNode* %4, zeroinitializer
  %6 = bitcast [13 x %Nat8]* @func192_str1 to %Str
  call void (i1, %Str) @assert (i1 %5, %Str %6)
;stmt2:
  %7 = getelementptr inbounds %AstNode, %AstNode* %4, i1 0, i32 0
  store %AstNodeKind %0, %AstNodeKind* %7, align 2
;stmt3:
  %8 = getelementptr inbounds %AstNode, %AstNode* %4, i1 0, i32 1
  store %Unit* %1, %Unit** %8, align 8
;stmt4:
  ret %AstNode* %4
}

define %AstModule* @parse (%Str) {
;stmt0:
  %2 = call %Unit* (%Nat32) @malloc (%Nat32 32)
  %3 = bitcast %Unit* %2 to %AstModule*
;stmt1:
  %4 = bitcast %AstModule* %3 to %Unit*
  %5 = call %Unit* (%Unit*, %Nat8, %Nat32) @memset (%Unit* %4, %Nat8 0, %Nat32 32)
;stmt2:
  %6 = getelementptr inbounds %AstModule, %AstModule* %3, i1 0, i32 0
  call void (%List*) @map_init (%List* %6)
;stmt3:
  %7 = getelementptr inbounds %ParserState, %ParserState* @pstat, i1 0, i32 0
  %8 = call %Source* (%Str) @tokenize (%Str %0)
  store %Source* %8, %Source** %7, align 8
;stmt4:
  %9 = getelementptr inbounds %ParserState, %ParserState* @pstat, i1 0, i32 1
  %10 = getelementptr inbounds %ParserState, %ParserState* @pstat, i1 0, i32 0
  %11 = load %Source*, %Source** %10
  %12 = getelementptr inbounds %Source, %Source* %11, i1 0, i32 0
  %13 = getelementptr inbounds %List, %List* %12, i1 0, i32 0
  %14 = load %Node*, %Node** %13
  store %Node* %14, %Node** %9, align 8
;stmt5:
  br label %continue_0
continue_0:
  br i1 1, label %body_0, label %break_0
body_0:
;stmt6:
  %15 = call %Token* () @func181 ()
;stmt7:
  %16 = getelementptr inbounds %Token, %Token* %15, i1 0, i32 0
  %17 = load %TokenKind, %TokenKind* %16
  %18 = icmp eq %TokenKind %17, 0
  br i1 %18, label %then_0, label %else_0
then_0:
;stmt8:
  br label %break_0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt9:
  %20 = getelementptr inbounds %Token, %Token* %15, i1 0, i32 0
  %21 = load %TokenKind, %TokenKind* %20
  %22 = icmp eq %TokenKind %21, 6
  br i1 %22, label %then_1, label %else_1
then_1:
;stmt10:
  call void () @skip ()
;stmt11:
  br label %continue_0
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt12:
  %24 = getelementptr inbounds %Token, %Token* %15, i1 0, i32 0
  %25 = load %TokenKind, %TokenKind* %24
  %26 = icmp eq %TokenKind %25, 5
  br i1 %26, label %then_2, label %else_2
then_2:
;stmt13:
  call void () @skip ()
;stmt14:
  br label %continue_0
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
;stmt15:
  %28 = bitcast [7 x %Nat8]* @func193_str1 to %Str
  %29 = call i1 (%Str) @func187 (%Str %28)
  br i1 %29, label %then_3, label %else_3
then_3:
;stmt16:
  %30 = call %AstNode* () @func194 ()
;stmt17:
  %31 = getelementptr inbounds %AstModule, %AstModule* %3, i1 0, i32 0
  %32 = bitcast %AstNode* %30 to %Unit*
  %33 = call i1 (%List*, %Unit*) @list_append (%List* %31, %Unit* %32)
;stmt18:
  br label %continue_0
  br label %endif_3
else_3:
;stmt19:
  br label %break_0
  br label %endif_3
endif_3:
  br label %continue_0
break_0:
;stmt20:
  br label %continue_1
continue_1:
  br i1 1, label %body_1, label %break_1
body_1:
;stmt21:
  %36 = call %Token* () @func181 ()
;stmt22:
  %37 = getelementptr inbounds %Token, %Token* %36, i1 0, i32 0
  %38 = load %TokenKind, %TokenKind* %37
  %39 = icmp eq %TokenKind %38, 0
  br i1 %39, label %then_4, label %else_4
then_4:
;stmt23:
  br label %break_1
  br label %endif_4
else_4:
  br label %endif_4
endif_4:
;stmt24:
  %41 = getelementptr inbounds %Token, %Token* %36, i1 0, i32 0
  %42 = load %TokenKind, %TokenKind* %41
  %43 = icmp eq %TokenKind %42, 6
  br i1 %43, label %then_5, label %else_5
then_5:
;stmt25:
  call void () @skip ()
;stmt26:
  br label %continue_1
  br label %endif_5
else_5:
  br label %endif_5
endif_5:
;stmt27:
  %45 = getelementptr inbounds %Token, %Token* %36, i1 0, i32 0
  %46 = load %TokenKind, %TokenKind* %45
  %47 = icmp eq %TokenKind %46, 5
  br i1 %47, label %then_6, label %else_6
then_6:
;stmt28:
  call void () @skip ()
;stmt29:
  br label %continue_1
  br label %endif_6
else_6:
  br label %endif_6
endif_6:
;stmt30:
  %49 = bitcast [8 x %Nat8]* @func193_str2 to %Str
  %50 = call i1 (%Str) @func187 (%Str %49)
;stmt31:
  %51 = bitcast [6 x %Nat8]* @func193_str3 to %Str
  %52 = call i1 (%Str) @func187 (%Str %51)
  br i1 %52, label %then_7, label %else_7
then_7:
;stmt32:
  %53 = call %Token* () @func181 ()
;stmt33:
  %54 = getelementptr inbounds %Token, %Token* %53, i1 0, i32 2
; index array
  %55 = getelementptr inbounds [0 x %Nat8], [0 x %Nat8]* %54, i1 0, %Int64 0
  %56 = load %Nat8, %Nat8* %55
  %57 = call i1 (%Nat8) @isUpperCase (%Nat8 %56)
  br i1 %57, label %then_8, label %else_8
then_8:
;stmt34:
  %58 = call %AstId* () @parse_id ()
;stmt35:
  %59 = call %Unit* (%Nat32) @malloc (%Nat32 8)
  %60 = bitcast %Unit* %59 to %AstNodeDeclType*
;stmt36:
  %61 = getelementptr inbounds %AstNodeDeclType, %AstNodeDeclType* %60, i1 0, i32 0
  store %AstId* %58, %AstId** %61, align 8
;stmt37:
  %62 = getelementptr inbounds %AstModule, %AstModule* %3, i1 0, i32 0
  %63 = bitcast %AstNodeDeclType* %60 to %Unit*
  %64 = call %AstNode* (%AstNodeKind, %Unit*) @ast_node_new (%AstNodeKind 4, %Unit* %63)
  %65 = bitcast %AstNode* %64 to %Unit*
  %66 = call i1 (%List*, %Unit*) @list_append (%List* %62, %Unit* %65)
  br label %endif_8
else_8:
;stmt38:
  %67 = call %Unit* (%Nat32) @malloc (%Nat32 8)
  %68 = bitcast %Unit* %67 to %AstNodeDeclVar*
;stmt39:
  %69 = getelementptr inbounds %AstNodeDeclVar, %AstNodeDeclVar* %68, i1 0, i32 0
  %70 = call %AstDecl* (i1) @func203 (i1 0)
  store %AstDecl* %70, %AstDecl** %69, align 8
;stmt40:
  %71 = getelementptr inbounds %AstModule, %AstModule* %3, i1 0, i32 0
  %72 = bitcast %AstNodeDeclVar* %68 to %Unit*
  %73 = call %AstNode* (%AstNodeKind, %Unit*) @ast_node_new (%AstNodeKind 5, %Unit* %72)
  %74 = bitcast %AstNode* %73 to %Unit*
  %75 = call i1 (%List*, %Unit*) @list_append (%List* %71, %Unit* %74)
  br label %endif_8
endif_8:
;stmt41:
  br label %continue_1
  br label %endif_7
else_7:
;stmt42:
  %77 = bitcast [7 x %Nat8]* @func193_str4 to %Str
  %78 = call i1 (%Str) @func187 (%Str %77)
  br i1 %78, label %then_9, label %else_9
then_9:
;stmt43:
  %79 = call %AstDecl* (i1) @func203 (i1 0)
;stmt44:
  %80 = getelementptr inbounds %AstDecl, %AstDecl* %79, i1 0, i32 2
  %81 = load %TokenInfo*, %TokenInfo** %80
  %82 = call %AstValue* (%AstValueKind, %TokenInfo*) @func204 (%AstValueKind 5, %TokenInfo* %81)
;stmt45:
  %83 = getelementptr inbounds %AstValue, %AstValue* %82, i1 0, i32 5
  %84 = getelementptr inbounds %AstValueFunc, %AstValueFunc* %83, i1 0, i32 0
  %85 = getelementptr inbounds %AstDecl, %AstDecl* %79, i1 0, i32 1
  %86 = load %AstType*, %AstType** %85
  store %AstType* %86, %AstType** %84, align 8
;stmt46:
  %87 = getelementptr inbounds %AstValue, %AstValue* %82, i1 0, i32 5
  %88 = getelementptr inbounds %AstValueFunc, %AstValueFunc* %87, i1 0, i32 0
  %89 = load %AstType*, %AstType** %88
  %90 = getelementptr inbounds %AstType, %AstType* %89, i1 0, i32 7
  %91 = getelementptr inbounds %AstTypeFunc, %AstTypeFunc* %90, i1 0, i32 2
  store i1 %50, i1* %91, align 1
;stmt47:
  %92 = getelementptr inbounds %AstValue, %AstValue* %82, i1 0, i32 11
  store i1 1, i1* %92, align 1
;stmt48:
  %93 = getelementptr inbounds %AstValue, %AstValue* %82, i1 0, i32 5
  %94 = getelementptr inbounds %AstValueFunc, %AstValueFunc* %93, i1 0, i32 1
  store %AstStmt* zeroinitializer, %AstStmt** %94, align 8
;stmt49:
  %95 = call %Unit* (%Nat32) @malloc (%Nat32 24)
  %96 = bitcast %Unit* %95 to %AstNodeBindValue*
;stmt50:
  %97 = getelementptr inbounds %AstNodeBindValue, %AstNodeBindValue* %96, i1 0, i32 0
  %98 = getelementptr inbounds %AstDecl, %AstDecl* %79, i1 0, i32 0
  %99 = getelementptr inbounds %List, %List* %98, i1 0, i32 0
  %100 = load %Node*, %Node** %99
  %101 = getelementptr inbounds %Node, %Node* %100, i1 0, i32 3
  %102 = load %Unit*, %Unit** %101
  %103 = bitcast %Unit* %102 to %AstId*
  store %AstId* %103, %AstId** %97, align 8
;stmt51:
  %104 = getelementptr inbounds %AstNodeBindValue, %AstNodeBindValue* %96, i1 0, i32 1
  store %AstValue* %82, %AstValue** %104, align 8
;stmt52:
  %105 = getelementptr inbounds %AstNodeBindValue, %AstNodeBindValue* %96, i1 0, i32 2
  %106 = getelementptr inbounds %AstDecl, %AstDecl* %79, i1 0, i32 2
  %107 = load %TokenInfo*, %TokenInfo** %106
  store %TokenInfo* %107, %TokenInfo** %105, align 8
;stmt53:
  %108 = getelementptr inbounds %AstModule, %AstModule* %3, i1 0, i32 0
  %109 = bitcast %AstNodeBindValue* %96 to %Unit*
  %110 = call %AstNode* (%AstNodeKind, %Unit*) @ast_node_new (%AstNodeKind 3, %Unit* %109)
  %111 = bitcast %AstNode* %110 to %Unit*
  %112 = call i1 (%List*, %Unit*) @list_append (%List* %108, %Unit* %111)
;stmt54:
  br label %continue_1
  br label %endif_9
else_9:
  br label %endif_9
endif_9:
  br label %endif_7
endif_7:
;stmt55:
  %114 = getelementptr inbounds %Token, %Token* %36, i1 0, i32 2
; index array
  %115 = getelementptr inbounds [0 x %Nat8], [0 x %Nat8]* %114, i1 0, %Int64 0
  %116 = load %Nat8, %Nat8* %115
  %117 = call i1 (%Nat8) @isAlpha (%Nat8 %116)
  br i1 %117, label %then_10, label %else_10
then_10:
;stmt56:
  %118 = getelementptr inbounds %Token, %Token* %36, i1 0, i32 2
; index array
  %119 = getelementptr inbounds [0 x %Nat8], [0 x %Nat8]* %118, i1 0, %Int64 0
  %120 = load %Nat8, %Nat8* %119
  %121 = call i1 (%Nat8) @isUpperCase (%Nat8 %120)
  br i1 %121, label %then_11, label %else_11
then_11:
;stmt57:
  %122 = call %AstNodeBindType* () @func195 ()
;stmt58:
  %123 = getelementptr inbounds %AstModule, %AstModule* %3, i1 0, i32 0
  %124 = bitcast %AstNodeBindType* %122 to %Unit*
  %125 = call %AstNode* (%AstNodeKind, %Unit*) @ast_node_new (%AstNodeKind 2, %Unit* %124)
  %126 = bitcast %AstNode* %125 to %Unit*
  %127 = call i1 (%List*, %Unit*) @list_append (%List* %123, %Unit* %126)
  br label %endif_11
else_11:
;stmt59:
  %128 = call %AstNodeBindValue* () @func196 ()
;stmt60:
  %129 = getelementptr inbounds %AstModule, %AstModule* %3, i1 0, i32 0
  %130 = bitcast %AstNodeBindValue* %128 to %Unit*
  %131 = call %AstNode* (%AstNodeKind, %Unit*) @ast_node_new (%AstNodeKind 3, %Unit* %130)
  %132 = bitcast %AstNode* %131 to %Unit*
  %133 = call i1 (%List*, %Unit*) @list_append (%List* %129, %Unit* %132)
  br label %endif_11
endif_11:
  br label %endif_10
else_10:
  br label %endif_10
endif_10:
  br label %continue_1
break_1:
;stmt61:
  ret %AstModule* %3
}

define %AstNode* @func194 () {
;stmt0:
  %1 = call %Unit* (%Nat32) @malloc (%Nat32 16)
  %2 = bitcast %Unit* %1 to %AstNodeImport*
;stmt1:
  %3 = call %Token* () @func181 ()
;stmt2:
  %4 = getelementptr inbounds %AstNodeImport, %AstNodeImport* %2, i1 0, i32 0
  %5 = getelementptr inbounds %Token, %Token* %3, i1 0, i32 2
; index array
  %6 = getelementptr inbounds [0 x %Nat8], [0 x %Nat8]* %5, i1 0, %Int64 0
  %7 = bitcast %Nat8* %6 to %Str
  %8 = call %Str (%Str) @dup (%Str %7)
  store %Str %8, %Str* %4, align 8
;stmt3:
  %9 = getelementptr inbounds %AstNodeImport, %AstNodeImport* %2, i1 0, i32 1
  %10 = getelementptr inbounds %Token, %Token* %3, i1 0, i32 1
  store %TokenInfo* %10, %TokenInfo** %9, align 8
;stmt4:
  call void () @skip ()
;stmt5:
  %11 = bitcast %AstNodeImport* %2 to %Unit*
  %12 = call %AstNode* (%AstNodeKind, %Unit*) @ast_node_new (%AstNodeKind 1, %Unit* %11)
  ret %AstNode* %12
}

define %AstNodeBindType* @func195 () {
;stmt0:
  %1 = call %Unit* (%Nat32) @malloc (%Nat32 24)
  %2 = bitcast %Unit* %1 to %AstNodeBindType*
;stmt1:
  %3 = call %AstId* () @parse_id ()
;stmt2:
  %4 = call %Token* () @func181 ()
  %5 = getelementptr inbounds %Token, %Token* %4, i1 0, i32 1
;stmt3:
  %6 = bitcast [2 x %Nat8]* @func195_str1 to %Str
  %7 = call i1 (%Str) @need (%Str %6)
;stmt4:
  %8 = call %AstType* () @func198 ()
;stmt5:
  %9 = getelementptr inbounds %AstNodeBindType, %AstNodeBindType* %2, i1 0, i32 0
  store %AstId* %3, %AstId** %9, align 8
;stmt6:
  %10 = getelementptr inbounds %AstNodeBindType, %AstNodeBindType* %2, i1 0, i32 1
  store %AstType* %8, %AstType** %10, align 8
;stmt7:
  %11 = getelementptr inbounds %AstNodeBindType, %AstNodeBindType* %2, i1 0, i32 2
  store %TokenInfo* %5, %TokenInfo** %11, align 8
;stmt8:
  ret %AstNodeBindType* %2
}

define %AstNodeBindValue* @func196 () {
;stmt0:
  %1 = call %Unit* (%Nat32) @malloc (%Nat32 24)
  %2 = bitcast %Unit* %1 to %AstNodeBindValue*
;stmt1:
  %3 = call %AstId* () @parse_id ()
;stmt2:
  %4 = call %Token* () @func181 ()
  %5 = getelementptr inbounds %Token, %Token* %4, i1 0, i32 1
;stmt3:
  %6 = bitcast [2 x %Nat8]* @func196_str1 to %Str
  %7 = call i1 (%Str) @need (%Str %6)
;stmt4:
  %8 = getelementptr inbounds %AstNodeBindValue, %AstNodeBindValue* %2, i1 0, i32 0
  store %AstId* %3, %AstId** %8, align 8
;stmt5:
  %9 = getelementptr inbounds %AstNodeBindValue, %AstNodeBindValue* %2, i1 0, i32 1
  %10 = call %AstValue* () @func207 ()
  store %AstValue* %10, %AstValue** %9, align 8
;stmt6:
  %11 = getelementptr inbounds %AstNodeBindValue, %AstNodeBindValue* %2, i1 0, i32 2
  store %TokenInfo* %5, %TokenInfo** %11, align 8
;stmt7:
  ret %AstNodeBindValue* %2
}

define %AstType* @ast_type_new (%AstTypeKind, %TokenInfo*) {
;stmt0:
  %3 = call %Unit* (%Nat32) @malloc (%Nat32 152)
  %4 = bitcast %Unit* %3 to %AstType*
;stmt1:
  %5 = icmp ne %AstType* %4, zeroinitializer
  %6 = bitcast [18 x %Nat8]* @func197_str1 to %Str
  call void (i1, %Str) @assert (i1 %5, %Str %6)
;stmt2:
  %7 = getelementptr inbounds %AstType, %AstType* %4, i1 0, i32 0
  store %AstTypeKind %0, %AstTypeKind* %7, align 2
;stmt3:
  %8 = getelementptr inbounds %AstType, %AstType* %4, i1 0, i32 9
  store %TokenInfo* %1, %TokenInfo** %8, align 8
;stmt4:
  ret %AstType* %4
}

define %AstType* @func198 () {
;stmt0:
  %1 = call %Token* () @func181 ()
;stmt1:
  %2 = alloca %AstType*
  %3 = getelementptr inbounds %Token, %Token* %1, i1 0, i32 1
  %4 = call %AstType* (%AstTypeKind, %TokenInfo*) @ast_type_new (%AstTypeKind 0, %TokenInfo* %3)
  store %AstType* %4, %AstType** %2, align 8
;stmt2:
  %5 = getelementptr inbounds %Token, %Token* %1, i1 0, i32 0
  %6 = load %TokenKind, %TokenKind* %5
  %7 = icmp eq %TokenKind %6, 1
  br i1 %7, label %then_0, label %else_0
then_0:
;stmt3:
  %8 = bitcast [4 x %Nat8]* @func198_str1 to %Str
  %9 = call i1 (%Str) @func187 (%Str %8)
  br i1 %9, label %then_1, label %else_1
then_1:
;stmt4:
  %10 = getelementptr inbounds %Token, %Token* %1, i1 0, i32 1
  %11 = call %AstType* (%AstTypeKind, %TokenInfo*) @ast_type_new (%AstTypeKind 8, %TokenInfo* %10)
;stmt5:
  %12 = getelementptr inbounds %AstType, %AstType* %11, i1 0, i32 8
  %13 = getelementptr inbounds %AstTypeVar, %AstTypeVar* %12, i1 0, i32 0
  %14 = call %AstType* () @func198 ()
  store %AstType* %14, %AstType** %13, align 8
;stmt6:
  ret %AstType* %11
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt7:
  %16 = getelementptr inbounds %Token, %Token* %1, i1 0, i32 1
  %17 = call %AstType* (%AstTypeKind, %TokenInfo*) @ast_type_new (%AstTypeKind 1, %TokenInfo* %16)
  store %AstType* %17, %AstType** %2, align 8
;stmt8:
  %18 = load %AstType*, %AstType** %2
  %19 = getelementptr inbounds %AstType, %AstType* %18, i1 0, i32 1
  %20 = call %AstName () @parse_name ()
  store %AstName %20, %AstName* %19, align 8
  br label %endif_0
else_0:
;stmt9:
  %21 = getelementptr inbounds %Token, %Token* %1, i1 0, i32 0
  %22 = load %TokenKind, %TokenKind* %21
  %23 = icmp eq %TokenKind %22, 3
  br i1 %23, label %then_2, label %else_2
then_2:
;stmt10:
  %24 = getelementptr inbounds %Token, %Token* %1, i1 0, i32 2
; index array
  %25 = getelementptr inbounds [0 x %Nat8], [0 x %Nat8]* %24, i1 0, %Int64 0
  %26 = load %Nat8, %Nat8* %25
  br label %select_1_0
select_1_0:
; index array
  %27 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func198_str2, i1 0, %Int64 0
  %28 = load %Nat8, %Nat8* %27
  %29 = icmp eq %Nat8 %26, %28
  br i1 %29, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %30 = call %AstType* () @func199 ()
  br label %select_1_end
select_1_1:
; index array
  %31 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func198_str3, i1 0, %Int64 0
  %32 = load %Nat8, %Nat8* %31
  %33 = icmp eq %Nat8 %26, %32
  br i1 %33, label %select_1_1_ok, label %select_1_2
select_1_1_ok:
  %34 = call %AstType* () @func200 ()
  br label %select_1_end
select_1_2:
; index array
  %35 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func198_str4, i1 0, %Int64 0
  %36 = load %Nat8, %Nat8* %35
  %37 = icmp eq %Nat8 %26, %36
  br i1 %37, label %select_1_2_ok, label %select_1_3
select_1_2_ok:
  %38 = call %AstType* () @func201 ()
  br label %select_1_end
select_1_3:
; index array
  %39 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func198_str5, i1 0, %Int64 0
  %40 = load %Nat8, %Nat8* %39
  %41 = icmp eq %Nat8 %26, %40
  br i1 %41, label %select_1_3_ok, label %select_1_4
select_1_3_ok:
  %42 = call %AstType* () @func202 ()
  br label %select_1_end
select_1_4:
  %43 = bitcast %AstType* zeroinitializer to %AstType*
  br label %select_1_end
select_1_end:
  %44 = phi %AstType* [ %30, %select_1_0_ok ], [ %34, %select_1_1_ok ], [ %38, %select_1_2_ok ], [ %42, %select_1_3_ok ], [ %43, %select_1_4 ]
  store %AstType* %44, %AstType** %2, align 8
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
  br label %endif_0
endif_0:
;stmt11:
  %45 = call %Token* () @func181 ()
;stmt12:
  %46 = bitcast [3 x %Nat8]* @func198_str6 to %Str
  %47 = call i1 (%Str) @func187 (%Str %46)
  br i1 %47, label %then_3, label %else_3
then_3:
;stmt13:
  %48 = call %AstType* () @func198 ()
;stmt14:
  %49 = getelementptr inbounds %Token, %Token* %45, i1 0, i32 1
  %50 = call %AstType* (%AstTypeKind, %TokenInfo*) @ast_type_new (%AstTypeKind 6, %TokenInfo* %49)
;stmt15:
  %51 = getelementptr inbounds %AstType, %AstType* %50, i1 0, i32 7
  %52 = getelementptr inbounds %AstTypeFunc, %AstTypeFunc* %51, i1 0, i32 0
  %53 = load %AstType*, %AstType** %2
  store %AstType* %53, %AstType** %52, align 8
;stmt16:
  %54 = getelementptr inbounds %AstType, %AstType* %50, i1 0, i32 7
  %55 = getelementptr inbounds %AstTypeFunc, %AstTypeFunc* %54, i1 0, i32 1
  store %AstType* %48, %AstType** %55, align 8
;stmt17:
  store %AstType* %50, %AstType** %2, align 8
  br label %endif_3
else_3:
  br label %endif_3
endif_3:
;stmt18:
  %56 = load %AstType*, %AstType** %2
  ret %AstType* %56
}

define %AstType* @func199 () {
;stmt0:
  %1 = call %Token* () @func181 ()
;stmt1:
  %2 = bitcast [2 x %Nat8]* @func199_str1 to %Str
  %3 = call i1 (%Str) @need (%Str %2)
;stmt2:
  %4 = getelementptr inbounds %Token, %Token* %1, i1 0, i32 1
  %5 = call %AstType* (%AstTypeKind, %TokenInfo*) @ast_type_new (%AstTypeKind 7, %TokenInfo* %4)
;stmt3:
  %6 = getelementptr inbounds %AstType, %AstType* %5, i1 0, i32 5
  %7 = getelementptr inbounds %AstTypePointer, %AstTypePointer* %6, i1 0, i32 0
  %8 = call %AstType* () @func198 ()
  store %AstType* %8, %AstType** %7, align 8
;stmt4:
  ret %AstType* %5
}

define %AstType* @func200 () {
;stmt0:
  %1 = call %Token* () @func181 ()
;stmt1:
  %2 = bitcast [2 x %Nat8]* @func200_str1 to %Str
  %3 = call i1 (%Str) @need (%Str %2)
;stmt2:
  %4 = getelementptr inbounds %Token, %Token* %1, i1 0, i32 1
  %5 = call %AstType* (%AstTypeKind, %TokenInfo*) @ast_type_new (%AstTypeKind 2, %TokenInfo* %4)
;stmt3:
  call void () @skip_nl ()
;stmt4:
  br label %continue_0
continue_0:
  %6 = bitcast [2 x %Nat8]* @func200_str2 to %Str
  %7 = call i1 (%Str) @func187 (%Str %6)
  %8 = xor i1 %7, 1
  br i1 %8, label %body_0, label %break_0
body_0:
;stmt5:
  call void () @skip_nl ()
;stmt6:
  %9 = call %Token* () @func181 ()
  %10 = getelementptr inbounds %Token, %Token* %9, i1 0, i32 1
;stmt7:
  %11 = call %AstId* () @parse_id ()
;stmt8:
  %12 = getelementptr inbounds %AstType, %AstType* %5, i1 0, i32 2
  %13 = getelementptr inbounds %AstTypeEnum, %AstTypeEnum* %12, i1 0, i32 0
  %14 = bitcast %AstId* %11 to %Unit*
  %15 = call i1 (%List*, %Unit*) @list_append (%List* %13, %Unit* %14)
;stmt9:
  %16 = bitcast [2 x %Nat8]* @func200_str3 to %Str
  %17 = call i1 (%Str) @func187 (%Str %16)
  %18 = xor i1 %17, 1
  br i1 %18, label %then_0, label %else_0
then_0:
;stmt10:
  call void () @skip_nl ()
;stmt11:
  %19 = bitcast [2 x %Nat8]* @func200_str4 to %Str
  %20 = call i1 (%Str) @need (%Str %19)
;stmt12:
  br label %break_0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  br label %continue_0
break_0:
;stmt13:
  ret %AstType* %5
}

define %AstType* @func201 () {
;stmt0:
  %1 = call %Token* () @func181 ()
;stmt1:
  %2 = bitcast [2 x %Nat8]* @func201_str1 to %Str
  %3 = call i1 (%Str) @need (%Str %2)
;stmt2:
  %4 = bitcast [2 x %Nat8]* @func201_str2 to %Str
  %5 = call i1 (%Str) @func187 (%Str %4)
  br i1 %5, label %then_0, label %else_0
then_0:
;stmt3:
  %6 = getelementptr inbounds %Token, %Token* %1, i1 0, i32 1
  %7 = call %AstType* (%AstTypeKind, %TokenInfo*) @ast_type_new (%AstTypeKind 5, %TokenInfo* %6)
;stmt4:
  %8 = call %AstType* () @func198 ()
;stmt5:
  %9 = getelementptr inbounds %AstType, %AstType* %7, i1 0, i32 4
  %10 = getelementptr inbounds %AstTypeArrayU, %AstTypeArrayU* %9, i1 0, i32 0
  store %AstType* %8, %AstType** %10, align 8
;stmt6:
  ret %AstType* %7
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt7:
  %12 = getelementptr inbounds %Token, %Token* %1, i1 0, i32 1
  %13 = call %AstType* (%AstTypeKind, %TokenInfo*) @ast_type_new (%AstTypeKind 4, %TokenInfo* %12)
;stmt8:
  %14 = call %AstValue* () @func207 ()
;stmt9:
  %15 = bitcast [2 x %Nat8]* @func201_str3 to %Str
  %16 = call i1 (%Str) @need (%Str %15)
;stmt10:
  %17 = call %AstType* () @func198 ()
;stmt11:
  %18 = getelementptr inbounds %AstType, %AstType* %13, i1 0, i32 3
  %19 = getelementptr inbounds %AstTypeArray, %AstTypeArray* %18, i1 0, i32 1
  store %AstValue* %14, %AstValue** %19, align 8
;stmt12:
  %20 = getelementptr inbounds %AstType, %AstType* %13, i1 0, i32 3
  %21 = getelementptr inbounds %AstTypeArray, %AstTypeArray* %20, i1 0, i32 0
  store %AstType* %17, %AstType** %21, align 8
;stmt13:
  ret %AstType* %13
}

define %AstType* @func202 () {
;stmt0:
  %1 = call %Token* () @func181 ()
;stmt1:
  %2 = bitcast [2 x %Nat8]* @func202_str1 to %Str
  %3 = call i1 (%Str) @need (%Str %2)
;stmt2:
  %4 = getelementptr inbounds %Token, %Token* %1, i1 0, i32 1
  %5 = call %AstType* (%AstTypeKind, %TokenInfo*) @ast_type_new (%AstTypeKind 3, %TokenInfo* %4)
;stmt3:
  %6 = alloca %List
  store %List zeroinitializer, %List* %6, align 8
;stmt4:
  %7 = getelementptr inbounds %List, %List* %6, i1 0
  call void (%List*) @map_init (%List* %7)
;stmt5:
  br label %continue_0
continue_0:
  br i1 1, label %body_0, label %break_0
body_0:
;stmt6:
  call void () @skip_nl ()
;stmt7:
  %8 = bitcast [2 x %Nat8]* @func202_str2 to %Str
  %9 = call i1 (%Str) @func187 (%Str %8)
  br i1 %9, label %then_0, label %else_0
then_0:
;stmt8:
  br label %break_0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt9:
  %11 = call %Token* () @func181 ()
  %12 = getelementptr inbounds %Token, %Token* %11, i1 0, i32 1
;stmt10:
  %13 = call %AstDecl* (i1) @func203 (i1 0)
;stmt11:
  %14 = icmp eq %AstDecl* %13, zeroinitializer
  br i1 %14, label %then_1, label %else_1
then_1:
;stmt12:
  %15 = bitcast [14 x %Nat8]* @func202_str3 to %Str
  call void (%Str, %TokenInfo*) @error (%Str %15, %TokenInfo* %12)
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt13:
  %16 = bitcast [2 x %Nat8]* @func202_str4 to %Str
  %17 = call i1 (%Str) @func187 (%Str %16)
;stmt14:
  call void () @skip_nl ()
;stmt15:
  %18 = getelementptr inbounds %List, %List* %6, i1 0
  %19 = bitcast %AstDecl* %13 to %Unit*
  %20 = call i1 (%List*, %Unit*) @list_append (%List* %18, %Unit* %19)
  br label %continue_0
break_0:
;stmt16:
  %21 = getelementptr inbounds %AstType, %AstType* %5, i1 0, i32 6
  %22 = getelementptr inbounds %AstTypeRecord, %AstTypeRecord* %21, i1 0, i32 0
  %23 = load %List, %List* %6
  store %List %23, %List* %22, align 8
;stmt17:
  ret %AstType* %5
}

define %AstDecl* @func203 (i1) {
;stmt0:
  %2 = call %Unit* (%Nat32) @malloc (%Nat32 56)
  %3 = bitcast %Unit* %2 to %AstDecl*
;stmt1:
  %4 = getelementptr inbounds %AstDecl, %AstDecl* %3, i1 0, i32 0
  call void (%List*) @map_init (%List* %4)
;stmt2:
  br label %continue_0
continue_0:
  br i1 1, label %body_0, label %break_0
body_0:
;stmt3:
  %5 = call %AstId* () @parse_id ()
;stmt4:
  %6 = getelementptr inbounds %AstDecl, %AstDecl* %3, i1 0, i32 0
  %7 = bitcast %AstId* %5 to %Unit*
  %8 = call i1 (%List*, %Unit*) @list_append (%List* %6, %Unit* %7)
;stmt5:
  %9 = bitcast [2 x %Nat8]* @func203_str1 to %Str
  %10 = call i1 (%Str) @func187 (%Str %9)
  %11 = xor i1 %10, 1
  br i1 %11, label %then_0, label %else_0
then_0:
;stmt6:
  br label %break_0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt7:
  call void () @skip_nl ()
  br label %continue_0
break_0:
;stmt8:
  %13 = getelementptr inbounds %AstDecl, %AstDecl* %3, i1 0, i32 2
  %14 = call %Token* () @func181 ()
  %15 = getelementptr inbounds %Token, %Token* %14, i1 0, i32 1
  store %TokenInfo* %15, %TokenInfo** %13, align 8
;stmt9:
  %16 = bitcast [2 x %Nat8]* @func203_str2 to %Str
  %17 = call i1 (%Str) @need (%Str %16)
;stmt10:
  %18 = call %AstType* () @func198 ()
;stmt11:
  %19 = getelementptr inbounds %AstDecl, %AstDecl* %3, i1 0, i32 1
  store %AstType* %18, %AstType** %19, align 8
;stmt12:
  %20 = getelementptr inbounds %AstDecl, %AstDecl* %3, i1 0, i32 3
  %21 = load i1, i1* @external
  store i1 %21, i1* %20, align 1
;stmt13:
  %22 = getelementptr inbounds %AstDecl, %AstDecl* %3, i1 0, i32 4
  %23 = load i1, i1* @xarghack
  store i1 %23, i1* %22, align 1
;stmt14:
  ret %AstDecl* %3
}

define %AstValue* @func204 (%AstValueKind, %TokenInfo*) {
;stmt0:
  %3 = call %Unit* (%Nat32) @malloc (%Nat32 216)
  %4 = bitcast %Unit* %3 to %AstValue*
;stmt1:
  %5 = icmp ne %AstValue* %4, zeroinitializer
  %6 = bitcast [21 x %Nat8]* @func204_str1 to %Str
  call void (i1, %Str) @assert (i1 %5, %Str %6)
;stmt2:
  %7 = bitcast %AstValue* %4 to %Unit*
  %8 = call %Unit* (%Unit*, %Nat8, %Nat32) @memset (%Unit* %7, %Nat8 0, %Nat32 216)
;stmt3:
  %9 = getelementptr inbounds %AstValue, %AstValue* %4, i1 0, i32 0
  store %AstValueKind %0, %AstValueKind* %9, align 2
;stmt4:
  %10 = getelementptr inbounds %AstValue, %AstValue* %4, i1 0, i32 12
  store %TokenInfo* %1, %TokenInfo** %10, align 8
;stmt5:
  ret %AstValue* %4
}

define %AstValue* @prefix (%AstValueKind, %AstValue*, %TokenInfo*) {
;stmt0:
  %4 = call %AstValue* (%AstValueKind, %TokenInfo*) @func204 (%AstValueKind %0, %TokenInfo* %2)
;stmt1:
  %5 = getelementptr inbounds %AstValue, %AstValue* %4, i1 0, i32 3
; index array
  %6 = getelementptr inbounds [2 x %AstValue*], [2 x %AstValue*]* %5, i1 0, %Int64 0
  store %AstValue* %1, %AstValue** %6, align 8
;stmt2:
  ret %AstValue* %4
}

define %AstValue* @infix (%AstValueKind, %AstValue*, %AstValue*, %TokenInfo*) {
;stmt0:
  %5 = call %AstValue* (%AstValueKind, %TokenInfo*) @func204 (%AstValueKind %0, %TokenInfo* %3)
;stmt1:
  %6 = getelementptr inbounds %AstValue, %AstValue* %5, i1 0, i32 3
; index array
  %7 = getelementptr inbounds [2 x %AstValue*], [2 x %AstValue*]* %6, i1 0, %Int64 0
  store %AstValue* %1, %AstValue** %7, align 8
;stmt2:
  %8 = getelementptr inbounds %AstValue, %AstValue* %5, i1 0, i32 3
; index array
  %9 = getelementptr inbounds [2 x %AstValue*], [2 x %AstValue*]* %8, i1 0, %Int64 1
  store %AstValue* %2, %AstValue** %9, align 8
;stmt3:
  ret %AstValue* %5
}

define %AstValue* @func207 () {
;stmt0:
  %1 = alloca %AstValue*
  %2 = call %AstValue* () @func208 ()
  store %AstValue* %2, %AstValue** %1, align 8
;stmt1:
  %3 = load %AstValue*, %AstValue** %1
  %4 = icmp eq %AstValue* %3, zeroinitializer
  br i1 %4, label %then_0, label %else_0
then_0:
;stmt2:
  ret %AstValue* zeroinitializer
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt3:
  %6 = call %Token* () @func181 ()
  %7 = getelementptr inbounds %Token, %Token* %6, i1 0, i32 1
;stmt4:
  %8 = bitcast [3 x %Nat8]* @func207_str1 to %Str
  %9 = call i1 (%Str) @func187 (%Str %8)
  br i1 %9, label %then_1, label %else_1
then_1:
;stmt5:
  call void () @skip_nl ()
;stmt6:
  %10 = call %AstValue* () @func207 ()
;stmt7:
  %11 = load %AstValue*, %AstValue** %1
  %12 = call %AstValue* (%AstValueKind, %AstValue*, %AstValue*, %TokenInfo*) @infix (%AstValueKind 18, %AstValue* %11, %AstValue* %10, %TokenInfo* %7)
  store %AstValue* %12, %AstValue** %1, align 8
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt8:
  %13 = load %AstValue*, %AstValue** %1
  ret %AstValue* %13
}

define %AstValue* @func208 () {
;stmt0:
  %1 = alloca %AstValue*
  %2 = call %AstValue* () @func209 ()
  store %AstValue* %2, %AstValue** %1, align 8
;stmt1:
  %3 = load %AstValue*, %AstValue** %1
  %4 = icmp eq %AstValue* %3, zeroinitializer
  br i1 %4, label %then_0, label %else_0
then_0:
;stmt2:
  ret %AstValue* zeroinitializer
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt3:
  %6 = call %Token* () @func181 ()
  %7 = getelementptr inbounds %Token, %Token* %6, i1 0, i32 1
;stmt4:
  %8 = bitcast [4 x %Nat8]* @func208_str1 to %Str
  %9 = call i1 (%Str) @func187 (%Str %8)
  br i1 %9, label %then_1, label %else_1
then_1:
;stmt5:
  call void () @skip_nl ()
;stmt6:
  %10 = call %AstValue* () @func208 ()
;stmt7:
  %11 = load %AstValue*, %AstValue** %1
  %12 = call %AstValue* (%AstValueKind, %AstValue*, %AstValue*, %TokenInfo*) @infix (%AstValueKind 19, %AstValue* %11, %AstValue* %10, %TokenInfo* %7)
  store %AstValue* %12, %AstValue** %1, align 8
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt8:
  %13 = load %AstValue*, %AstValue** %1
  ret %AstValue* %13
}

define %AstValue* @func209 () {
;stmt0:
  %1 = alloca %AstValue*
  %2 = call %AstValue* () @func210 ()
  store %AstValue* %2, %AstValue** %1, align 8
;stmt1:
  %3 = load %AstValue*, %AstValue** %1
  %4 = icmp eq %AstValue* %3, zeroinitializer
  br i1 %4, label %then_0, label %else_0
then_0:
;stmt2:
  ret %AstValue* zeroinitializer
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt3:
  %6 = call %Token* () @func181 ()
  %7 = getelementptr inbounds %Token, %Token* %6, i1 0, i32 1
;stmt4:
  %8 = bitcast [4 x %Nat8]* @func209_str1 to %Str
  %9 = call i1 (%Str) @func187 (%Str %8)
  br i1 %9, label %then_1, label %else_1
then_1:
;stmt5:
  call void () @skip_nl ()
;stmt6:
  %10 = call %AstValue* () @func209 ()
;stmt7:
  %11 = load %AstValue*, %AstValue** %1
  %12 = call %AstValue* (%AstValueKind, %AstValue*, %AstValue*, %TokenInfo*) @infix (%AstValueKind 20, %AstValue* %11, %AstValue* %10, %TokenInfo* %7)
  store %AstValue* %12, %AstValue** %1, align 8
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt8:
  %13 = load %AstValue*, %AstValue** %1
  ret %AstValue* %13
}

define %AstValue* @func210 () {
;stmt0:
  %1 = alloca %AstValue*
  %2 = call %AstValue* () @func211 ()
  store %AstValue* %2, %AstValue** %1, align 8
;stmt1:
  %3 = load %AstValue*, %AstValue** %1
  %4 = icmp eq %AstValue* %3, zeroinitializer
  br i1 %4, label %then_0, label %else_0
then_0:
;stmt2:
  ret %AstValue* zeroinitializer
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt3:
  br label %continue_0
continue_0:
  br i1 1, label %body_0, label %break_0
body_0:
;stmt4:
  %6 = call %Token* () @func181 ()
  %7 = getelementptr inbounds %Token, %Token* %6, i1 0, i32 1
;stmt5:
  %8 = bitcast [3 x %Nat8]* @func210_str1 to %Str
  %9 = call i1 (%Str) @func187 (%Str %8)
  br i1 %9, label %then_1, label %else_1
then_1:
;stmt6:
  call void () @skip_nl ()
;stmt7:
  %10 = call %AstValue* () @func210 ()
;stmt8:
  %11 = load %AstValue*, %AstValue** %1
  %12 = call %AstValue* (%AstValueKind, %AstValue*, %AstValue*, %TokenInfo*) @infix (%AstValueKind 21, %AstValue* %11, %AstValue* %10, %TokenInfo* %7)
  store %AstValue* %12, %AstValue** %1, align 8
  br label %endif_1
else_1:
;stmt9:
  %13 = bitcast [3 x %Nat8]* @func210_str2 to %Str
  %14 = call i1 (%Str) @func187 (%Str %13)
  br i1 %14, label %then_2, label %else_2
then_2:
;stmt10:
  call void () @skip_nl ()
;stmt11:
  %15 = call %AstValue* () @func210 ()
;stmt12:
  %16 = load %AstValue*, %AstValue** %1
  %17 = call %AstValue* (%AstValueKind, %AstValue*, %AstValue*, %TokenInfo*) @infix (%AstValueKind 22, %AstValue* %16, %AstValue* %15, %TokenInfo* %7)
  store %AstValue* %17, %AstValue** %1, align 8
  br label %endif_2
else_2:
;stmt13:
  br label %break_0
  br label %endif_2
endif_2:
  br label %endif_1
endif_1:
  br label %continue_0
break_0:
;stmt14:
  %19 = load %AstValue*, %AstValue** %1
  ret %AstValue* %19
}

define %AstValue* @func211 () {
;stmt0:
  %1 = alloca %AstValue*
  %2 = call %AstValue* () @func212 ()
  store %AstValue* %2, %AstValue** %1, align 8
;stmt1:
  %3 = load %AstValue*, %AstValue** %1
  %4 = icmp eq %AstValue* %3, zeroinitializer
  br i1 %4, label %then_0, label %else_0
then_0:
;stmt2:
  ret %AstValue* zeroinitializer
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt3:
  br label %continue_0
continue_0:
  br i1 1, label %body_0, label %break_0
body_0:
;stmt4:
  %6 = call %Token* () @func181 ()
  %7 = getelementptr inbounds %Token, %Token* %6, i1 0, i32 1
;stmt5:
  %8 = bitcast [2 x %Nat8]* @func211_str1 to %Str
  %9 = call i1 (%Str) @func187 (%Str %8)
  br i1 %9, label %then_1, label %else_1
then_1:
;stmt6:
  call void () @skip_nl ()
;stmt7:
  %10 = call %AstValue* () @func212 ()
;stmt8:
  %11 = load %AstValue*, %AstValue** %1
  %12 = call %AstValue* (%AstValueKind, %AstValue*, %AstValue*, %TokenInfo*) @infix (%AstValueKind 23, %AstValue* %11, %AstValue* %10, %TokenInfo* %7)
  store %AstValue* %12, %AstValue** %1, align 8
  br label %endif_1
else_1:
;stmt9:
  %13 = bitcast [2 x %Nat8]* @func211_str2 to %Str
  %14 = call i1 (%Str) @func187 (%Str %13)
  br i1 %14, label %then_2, label %else_2
then_2:
;stmt10:
  call void () @skip_nl ()
;stmt11:
  %15 = call %AstValue* () @func212 ()
;stmt12:
  %16 = load %AstValue*, %AstValue** %1
  %17 = call %AstValue* (%AstValueKind, %AstValue*, %AstValue*, %TokenInfo*) @infix (%AstValueKind 24, %AstValue* %16, %AstValue* %15, %TokenInfo* %7)
  store %AstValue* %17, %AstValue** %1, align 8
  br label %endif_2
else_2:
;stmt13:
  %18 = bitcast [3 x %Nat8]* @func211_str3 to %Str
  %19 = call i1 (%Str) @func187 (%Str %18)
  br i1 %19, label %then_3, label %else_3
then_3:
;stmt14:
  call void () @skip_nl ()
;stmt15:
  %20 = call %AstValue* () @func212 ()
;stmt16:
  %21 = load %AstValue*, %AstValue** %1
  %22 = call %AstValue* (%AstValueKind, %AstValue*, %AstValue*, %TokenInfo*) @infix (%AstValueKind 25, %AstValue* %21, %AstValue* %20, %TokenInfo* %7)
  store %AstValue* %22, %AstValue** %1, align 8
  br label %endif_3
else_3:
;stmt17:
  %23 = bitcast [3 x %Nat8]* @func211_str4 to %Str
  %24 = call i1 (%Str) @func187 (%Str %23)
  br i1 %24, label %then_4, label %else_4
then_4:
;stmt18:
  call void () @skip_nl ()
;stmt19:
  %25 = call %AstValue* () @func212 ()
;stmt20:
  %26 = load %AstValue*, %AstValue** %1
  %27 = call %AstValue* (%AstValueKind, %AstValue*, %AstValue*, %TokenInfo*) @infix (%AstValueKind 26, %AstValue* %26, %AstValue* %25, %TokenInfo* %7)
  store %AstValue* %27, %AstValue** %1, align 8
  br label %endif_4
else_4:
;stmt21:
  br label %break_0
  br label %endif_4
endif_4:
  br label %endif_3
endif_3:
  br label %endif_2
endif_2:
  br label %endif_1
endif_1:
  br label %continue_0
break_0:
;stmt22:
  %29 = load %AstValue*, %AstValue** %1
  ret %AstValue* %29
}

define %AstValue* @func212 () {
;stmt0:
  %1 = alloca %AstValue*
  %2 = call %AstValue* () @func213 ()
  store %AstValue* %2, %AstValue** %1, align 8
;stmt1:
  %3 = load %AstValue*, %AstValue** %1
  %4 = icmp eq %AstValue* %3, zeroinitializer
  br i1 %4, label %then_0, label %else_0
then_0:
;stmt2:
  ret %AstValue* zeroinitializer
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt3:
  br label %continue_0
continue_0:
  br i1 1, label %body_0, label %break_0
body_0:
;stmt4:
  %6 = call %Token* () @func181 ()
  %7 = getelementptr inbounds %Token, %Token* %6, i1 0, i32 1
;stmt5:
  %8 = bitcast [3 x %Nat8]* @func212_str1 to %Str
  %9 = call i1 (%Str) @func187 (%Str %8)
  br i1 %9, label %then_1, label %else_1
then_1:
;stmt6:
  call void () @skip_nl ()
;stmt7:
  %10 = call %AstValue* () @func213 ()
;stmt8:
  %11 = load %AstValue*, %AstValue** %1
  %12 = call %AstValue* (%AstValueKind, %AstValue*, %AstValue*, %TokenInfo*) @infix (%AstValueKind 27, %AstValue* %11, %AstValue* %10, %TokenInfo* %7)
  store %AstValue* %12, %AstValue** %1, align 8
  br label %endif_1
else_1:
;stmt9:
  %13 = bitcast [3 x %Nat8]* @func212_str2 to %Str
  %14 = call i1 (%Str) @func187 (%Str %13)
  br i1 %14, label %then_2, label %else_2
then_2:
;stmt10:
  call void () @skip_nl ()
;stmt11:
  %15 = call %AstValue* () @func213 ()
;stmt12:
  %16 = load %AstValue*, %AstValue** %1
  %17 = call %AstValue* (%AstValueKind, %AstValue*, %AstValue*, %TokenInfo*) @infix (%AstValueKind 28, %AstValue* %16, %AstValue* %15, %TokenInfo* %7)
  store %AstValue* %17, %AstValue** %1, align 8
  br label %endif_2
else_2:
;stmt13:
  br label %break_0
  br label %endif_2
endif_2:
  br label %endif_1
endif_1:
  br label %continue_0
break_0:
;stmt14:
  %19 = load %AstValue*, %AstValue** %1
  ret %AstValue* %19
}

define %AstValue* @func213 () {
;stmt0:
  %1 = alloca %AstValue*
  %2 = call %AstValue* () @func214 ()
  store %AstValue* %2, %AstValue** %1, align 8
;stmt1:
  %3 = load %AstValue*, %AstValue** %1
  %4 = icmp eq %AstValue* %3, zeroinitializer
  br i1 %4, label %then_0, label %else_0
then_0:
;stmt2:
  ret %AstValue* zeroinitializer
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt3:
  br label %continue_0
continue_0:
  br i1 1, label %body_0, label %break_0
body_0:
;stmt4:
  %6 = call %Token* () @func181 ()
  %7 = getelementptr inbounds %Token, %Token* %6, i1 0, i32 1
;stmt5:
  %8 = bitcast [2 x %Nat8]* @func213_str1 to %Str
  %9 = call i1 (%Str) @func187 (%Str %8)
  br i1 %9, label %then_1, label %else_1
then_1:
;stmt6:
  call void () @skip_nl ()
;stmt7:
  %10 = call %AstValue* () @func214 ()
;stmt8:
  %11 = load %AstValue*, %AstValue** %1
  %12 = call %AstValue* (%AstValueKind, %AstValue*, %AstValue*, %TokenInfo*) @infix (%AstValueKind 13, %AstValue* %11, %AstValue* %10, %TokenInfo* %7)
  store %AstValue* %12, %AstValue** %1, align 8
  br label %endif_1
else_1:
;stmt9:
  %13 = bitcast [2 x %Nat8]* @func213_str2 to %Str
  %14 = call i1 (%Str) @func187 (%Str %13)
  br i1 %14, label %then_2, label %else_2
then_2:
;stmt10:
  call void () @skip_nl ()
;stmt11:
  %15 = call %AstValue* () @func214 ()
;stmt12:
  %16 = load %AstValue*, %AstValue** %1
  %17 = call %AstValue* (%AstValueKind, %AstValue*, %AstValue*, %TokenInfo*) @infix (%AstValueKind 14, %AstValue* %16, %AstValue* %15, %TokenInfo* %7)
  store %AstValue* %17, %AstValue** %1, align 8
  br label %endif_2
else_2:
;stmt13:
  br label %break_0
  br label %endif_2
endif_2:
  br label %endif_1
endif_1:
  br label %continue_0
break_0:
;stmt14:
  %19 = load %AstValue*, %AstValue** %1
  ret %AstValue* %19
}

define %AstValue* @func214 () {
;stmt0:
  %1 = alloca %AstValue*
  %2 = call %AstValue* () @func215 ()
  store %AstValue* %2, %AstValue** %1, align 8
;stmt1:
  %3 = load %AstValue*, %AstValue** %1
  %4 = icmp eq %AstValue* %3, zeroinitializer
  br i1 %4, label %then_0, label %else_0
then_0:
;stmt2:
  ret %AstValue* zeroinitializer
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt3:
  br label %continue_0
continue_0:
  br i1 1, label %body_0, label %break_0
body_0:
;stmt4:
  %6 = call %Token* () @func181 ()
  %7 = getelementptr inbounds %Token, %Token* %6, i1 0, i32 1
;stmt5:
  %8 = bitcast [2 x %Nat8]* @func214_str1 to %Str
  %9 = call i1 (%Str) @func187 (%Str %8)
  br i1 %9, label %then_1, label %else_1
then_1:
;stmt6:
  call void () @skip_nl ()
;stmt7:
  %10 = call %AstValue* () @func215 ()
;stmt8:
  %11 = load %AstValue*, %AstValue** %1
  %12 = call %AstValue* (%AstValueKind, %AstValue*, %AstValue*, %TokenInfo*) @infix (%AstValueKind 15, %AstValue* %11, %AstValue* %10, %TokenInfo* %7)
  store %AstValue* %12, %AstValue** %1, align 8
  br label %endif_1
else_1:
;stmt9:
  %13 = bitcast [2 x %Nat8]* @func214_str2 to %Str
  %14 = call i1 (%Str) @func187 (%Str %13)
  br i1 %14, label %then_2, label %else_2
then_2:
;stmt10:
  call void () @skip_nl ()
;stmt11:
  %15 = call %AstValue* () @func215 ()
;stmt12:
  %16 = load %AstValue*, %AstValue** %1
  %17 = call %AstValue* (%AstValueKind, %AstValue*, %AstValue*, %TokenInfo*) @infix (%AstValueKind 16, %AstValue* %16, %AstValue* %15, %TokenInfo* %7)
  store %AstValue* %17, %AstValue** %1, align 8
  br label %endif_2
else_2:
;stmt13:
  %18 = bitcast [2 x %Nat8]* @func214_str3 to %Str
  %19 = call i1 (%Str) @func187 (%Str %18)
  br i1 %19, label %then_3, label %else_3
then_3:
;stmt14:
  call void () @skip_nl ()
;stmt15:
  %20 = call %AstValue* () @func215 ()
;stmt16:
  %21 = load %AstValue*, %AstValue** %1
  %22 = call %AstValue* (%AstValueKind, %AstValue*, %AstValue*, %TokenInfo*) @infix (%AstValueKind 17, %AstValue* %21, %AstValue* %20, %TokenInfo* %7)
  store %AstValue* %22, %AstValue** %1, align 8
  br label %endif_3
else_3:
;stmt17:
  br label %break_0
  br label %endif_3
endif_3:
  br label %endif_2
endif_2:
  br label %endif_1
endif_1:
  br label %continue_0
break_0:
;stmt18:
  %24 = load %AstValue*, %AstValue** %1
  ret %AstValue* %24
}

define %AstValue* @func215 () {
;stmt0:
  %1 = alloca %AstValue*
  %2 = call %AstValue* () @func216 ()
  store %AstValue* %2, %AstValue** %1, align 8
;stmt1:
  %3 = load %AstValue*, %AstValue** %1
  %4 = icmp eq %AstValue* %3, zeroinitializer
  br i1 %4, label %then_0, label %else_0
then_0:
;stmt2:
  ret %AstValue* zeroinitializer
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt3:
  %6 = call %Token* () @func181 ()
  %7 = getelementptr inbounds %Token, %Token* %6, i1 0, i32 1
;stmt4:
  %8 = bitcast [3 x %Nat8]* @func215_str1 to %Str
  %9 = call i1 (%Str) @func187 (%Str %8)
  br i1 %9, label %then_1, label %else_1
then_1:
;stmt5:
  %10 = call %AstType* () @func198 ()
;stmt6:
  %11 = call %AstValue* (%AstValueKind, %TokenInfo*) @func204 (%AstValueKind 32, %TokenInfo* %7)
;stmt7:
  %12 = getelementptr inbounds %AstValue, %AstValue* %11, i1 0, i32 9
  %13 = getelementptr inbounds %AstValueCast, %AstValueCast* %12, i1 0, i32 0
  %14 = load %AstValue*, %AstValue** %1
  store %AstValue* %14, %AstValue** %13, align 8
;stmt8:
  %15 = getelementptr inbounds %AstValue, %AstValue* %11, i1 0, i32 9
  %16 = getelementptr inbounds %AstValueCast, %AstValueCast* %15, i1 0, i32 1
  store %AstType* %10, %AstType** %16, align 8
;stmt9:
  store %AstValue* %11, %AstValue** %1, align 8
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt10:
  %17 = load %AstValue*, %AstValue** %1
  ret %AstValue* %17
}

define %AstValue* @func216 () {
;stmt0:
  %1 = alloca %AstValue*
  store %AstValue* zeroinitializer, %AstValue** %1, align 8
;stmt1:
  %2 = call %Token* () @func181 ()
  %3 = getelementptr inbounds %Token, %Token* %2, i1 0, i32 1
;stmt2:
  %4 = bitcast [2 x %Nat8]* @func216_str1 to %Str
  %5 = call i1 (%Str) @func187 (%Str %4)
  br i1 %5, label %then_0, label %else_0
then_0:
;stmt3:
  %6 = call %AstValue* () @func216 ()
;stmt4:
  %7 = call %AstValue* (%AstValueKind, %AstValue*, %TokenInfo*) @prefix (%AstValueKind 9, %AstValue* %6, %TokenInfo* %3)
  store %AstValue* %7, %AstValue** %1, align 8
  br label %endif_0
else_0:
;stmt5:
  %8 = bitcast [2 x %Nat8]* @func216_str2 to %Str
  %9 = call i1 (%Str) @func187 (%Str %8)
  br i1 %9, label %then_1, label %else_1
then_1:
;stmt6:
  %10 = call %AstValue* () @func217 ()
;stmt7:
  %11 = call %AstValue* (%AstValueKind, %AstValue*, %TokenInfo*) @prefix (%AstValueKind 8, %AstValue* %10, %TokenInfo* %3)
  store %AstValue* %11, %AstValue** %1, align 8
  br label %endif_1
else_1:
;stmt8:
  %12 = bitcast [4 x %Nat8]* @func216_str3 to %Str
  %13 = call i1 (%Str) @func187 (%Str %12)
  br i1 %13, label %then_2, label %else_2
then_2:
;stmt9:
  %14 = call %AstValue* () @func216 ()
;stmt10:
  %15 = call %AstValue* (%AstValueKind, %AstValue*, %TokenInfo*) @prefix (%AstValueKind 10, %AstValue* %14, %TokenInfo* %3)
  store %AstValue* %15, %AstValue** %1, align 8
  br label %endif_2
else_2:
;stmt11:
  %16 = bitcast [2 x %Nat8]* @func216_str4 to %Str
  %17 = call i1 (%Str) @func187 (%Str %16)
  br i1 %17, label %then_3, label %else_3
then_3:
;stmt12:
  %18 = call %AstValue* () @func216 ()
;stmt13:
  %19 = call %AstValue* (%AstValueKind, %AstValue*, %TokenInfo*) @prefix (%AstValueKind 11, %AstValue* %18, %TokenInfo* %3)
  store %AstValue* %19, %AstValue** %1, align 8
  br label %endif_3
else_3:
;stmt14:
  %20 = bitcast [2 x %Nat8]* @func216_str5 to %Str
  %21 = call i1 (%Str) @func187 (%Str %20)
  br i1 %21, label %then_4, label %else_4
then_4:
;stmt15:
  %22 = call %AstValue* () @func216 ()
;stmt16:
  %23 = call %AstValue* (%AstValueKind, %AstValue*, %TokenInfo*) @prefix (%AstValueKind 12, %AstValue* %22, %TokenInfo* %3)
  store %AstValue* %23, %AstValue** %1, align 8
  br label %endif_4
else_4:
;stmt17:
  %24 = bitcast [7 x %Nat8]* @func216_str6 to %Str
  %25 = call i1 (%Str) @func187 (%Str %24)
  br i1 %25, label %then_5, label %else_5
then_5:
;stmt18:
  %26 = call %Token* () @func181 ()
  %27 = getelementptr inbounds %Token, %Token* %26, i1 0, i32 1
;stmt19:
  %28 = call %AstType* () @func198 ()
;stmt20:
  %29 = icmp eq %AstType* %28, zeroinitializer
  br i1 %29, label %then_6, label %else_6
then_6:
;stmt21:
  %30 = bitcast [23 x %Nat8]* @func216_str7 to %Str
  call void (%Str, %TokenInfo*) @error (%Str %30, %TokenInfo* %27)
;stmt22:
  ret %AstValue* zeroinitializer
  br label %endif_6
else_6:
  br label %endif_6
endif_6:
;stmt23:
  %32 = call %AstValue* (%AstValueKind, %TokenInfo*) @func204 (%AstValueKind 33, %TokenInfo* %3)
;stmt24:
  %33 = getelementptr inbounds %AstValue, %AstValue* %32, i1 0, i32 4
  store %AstType* %28, %AstType** %33, align 8
;stmt25:
  store %AstValue* %32, %AstValue** %1, align 8
  br label %endif_5
else_5:
;stmt26:
  %34 = bitcast [8 x %Nat8]* @func216_str8 to %Str
  %35 = call i1 (%Str) @func187 (%Str %34)
  br i1 %35, label %then_7, label %else_7
then_7:
;stmt27:
  %36 = call %Token* () @func181 ()
  %37 = getelementptr inbounds %Token, %Token* %36, i1 0, i32 1
;stmt28:
  %38 = call %AstType* () @func198 ()
;stmt29:
  %39 = icmp eq %AstType* %38, zeroinitializer
  br i1 %39, label %then_8, label %else_8
then_8:
;stmt30:
  %40 = bitcast [24 x %Nat8]* @func216_str9 to %Str
  call void (%Str, %TokenInfo*) @error (%Str %40, %TokenInfo* %37)
;stmt31:
  ret %AstValue* zeroinitializer
  br label %endif_8
else_8:
  br label %endif_8
endif_8:
;stmt32:
  %42 = call %AstValue* (%AstValueKind, %TokenInfo*) @func204 (%AstValueKind 34, %TokenInfo* %3)
;stmt33:
  %43 = getelementptr inbounds %AstValue, %AstValue* %42, i1 0, i32 4
  store %AstType* %38, %AstType** %43, align 8
;stmt34:
  store %AstValue* %42, %AstValue** %1, align 8
  br label %endif_7
else_7:
;stmt35:
  %44 = call %AstValue* () @func217 ()
  store %AstValue* %44, %AstValue** %1, align 8
  br label %endif_7
endif_7:
  br label %endif_5
endif_5:
  br label %endif_4
endif_4:
  br label %endif_3
endif_3:
  br label %endif_2
endif_2:
  br label %endif_1
endif_1:
  br label %endif_0
endif_0:
;stmt36:
  %45 = load %AstValue*, %AstValue** %1
  ret %AstValue* %45
}

define %AstValue* @func217 () {
;stmt0:
  %1 = alloca %AstValue*
  %2 = call %AstValue* () @func218 ()
  store %AstValue* %2, %AstValue** %1, align 8
;stmt1:
  %3 = load %AstValue*, %AstValue** %1
  %4 = icmp eq %AstValue* %3, zeroinitializer
  br i1 %4, label %then_0, label %else_0
then_0:
;stmt2:
  ret %AstValue* zeroinitializer
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt3:
  br label %continue_0
continue_0:
  br i1 1, label %body_0, label %break_0
body_0:
;stmt4:
  %6 = call %Token* () @func181 ()
  %7 = getelementptr inbounds %Token, %Token* %6, i1 0, i32 1
;stmt5:
  %8 = bitcast [2 x %Nat8]* @func217_str1 to %Str
  %9 = call i1 (%Str) @func187 (%Str %8)
  br i1 %9, label %then_1, label %else_1
then_1:
;stmt6:
  %10 = call %List* () @map_new ()
;stmt7:
  br label %continue_1
continue_1:
  %11 = bitcast [2 x %Nat8]* @func217_str2 to %Str
  %12 = call i1 (%Str) @func187 (%Str %11)
  %13 = xor i1 %12, 1
  br i1 %13, label %body_1, label %break_1
body_1:
;stmt8:
  %14 = call %Token* () @func181 ()
  %15 = getelementptr inbounds %Token, %Token* %14, i1 0, i32 1
;stmt9:
  %16 = call %AstValue* () @func207 ()
;stmt10:
  %17 = icmp eq %AstValue* %16, zeroinitializer
  br i1 %17, label %then_2, label %else_2
then_2:
;stmt11:
  %18 = bitcast [3 x %Nat8]* @func217_str3 to %Str
  call void (%Str) @skipto (%Str %18)
;stmt12:
  %19 = bitcast [2 x %Nat8]* @func217_str4 to %Str
  %20 = call i1 (%Str) @func187 (%Str %19)
  br i1 %20, label %then_3, label %else_3
then_3:
;stmt13:
  br label %continue_1
  br label %endif_3
else_3:
;stmt14:
  %22 = bitcast [2 x %Nat8]* @func217_str5 to %Str
  %23 = call i1 (%Str) @func187 (%Str %22)
  br i1 %23, label %then_4, label %else_4
then_4:
;stmt15:
  br label %break_1
  br label %endif_4
else_4:
;stmt16:
  ret %AstValue* zeroinitializer
  br label %endif_4
endif_4:
  br label %endif_3
endif_3:
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
;stmt17:
  %26 = bitcast %AstValue* %16 to %Unit*
  %27 = call i1 (%List*, %Unit*) @list_append (%List* %10, %Unit* %26)
;stmt18:
  %28 = bitcast [2 x %Nat8]* @func217_str6 to %Str
  %29 = call i1 (%Str) @func187 (%Str %28)
  %30 = xor i1 %29, 1
  br i1 %30, label %then_5, label %else_5
then_5:
;stmt19:
  %31 = bitcast [2 x %Nat8]* @func217_str7 to %Str
  %32 = call i1 (%Str) @need (%Str %31)
  br label %endif_5
else_5:
;stmt20:
  br label %break_1
  br label %endif_5
endif_5:
  br label %continue_1
break_1:
;stmt21:
  %34 = call %AstValue* (%AstValueKind, %TokenInfo*) @func204 (%AstValueKind 29, %TokenInfo* %7)
;stmt22:
  %35 = getelementptr inbounds %AstValue, %AstValue* %34, i1 0, i32 6
  %36 = getelementptr inbounds %AstValueCall, %AstValueCall* %35, i1 0, i32 0
  %37 = load %AstValue*, %AstValue** %1
  store %AstValue* %37, %AstValue** %36, align 8
;stmt23:
  %38 = getelementptr inbounds %AstValue, %AstValue* %34, i1 0, i32 6
  %39 = getelementptr inbounds %AstValueCall, %AstValueCall* %38, i1 0, i32 1
  %40 = load %List, %List* %10
  store %List %40, %List* %39, align 8
;stmt24:
  store %AstValue* %34, %AstValue** %1, align 8
  br label %endif_1
else_1:
;stmt25:
  %41 = bitcast [2 x %Nat8]* @func217_str8 to %Str
  %42 = call i1 (%Str) @func187 (%Str %41)
  br i1 %42, label %then_6, label %else_6
then_6:
;stmt26:
  %43 = call %AstValue* () @func207 ()
;stmt27:
  %44 = bitcast [2 x %Nat8]* @func217_str9 to %Str
  %45 = call i1 (%Str) @func187 (%Str %44)
;stmt28:
  %46 = call %AstValue* (%AstValueKind, %TokenInfo*) @func204 (%AstValueKind 30, %TokenInfo* %7)
;stmt29:
  %47 = getelementptr inbounds %AstValue, %AstValue* %46, i1 0, i32 7
  %48 = getelementptr inbounds %AstValueIndex, %AstValueIndex* %47, i1 0, i32 0
  %49 = load %AstValue*, %AstValue** %1
  store %AstValue* %49, %AstValue** %48, align 8
;stmt30:
  %50 = getelementptr inbounds %AstValue, %AstValue* %46, i1 0, i32 7
  %51 = getelementptr inbounds %AstValueIndex, %AstValueIndex* %50, i1 0, i32 1
  store %AstValue* %43, %AstValue** %51, align 8
;stmt31:
  store %AstValue* %46, %AstValue** %1, align 8
  br label %endif_6
else_6:
;stmt32:
  %52 = bitcast [2 x %Nat8]* @func217_str10 to %Str
  %53 = call i1 (%Str) @func187 (%Str %52)
  br i1 %53, label %then_7, label %else_7
then_7:
;stmt33:
  %54 = call %AstId* () @parse_id ()
;stmt34:
  %55 = call %AstValue* (%AstValueKind, %TokenInfo*) @func204 (%AstValueKind 31, %TokenInfo* %7)
;stmt35:
  %56 = getelementptr inbounds %AstValue, %AstValue* %55, i1 0, i32 8
  %57 = getelementptr inbounds %AstValueAccess, %AstValueAccess* %56, i1 0, i32 0
  %58 = load %AstValue*, %AstValue** %1
  store %AstValue* %58, %AstValue** %57, align 8
;stmt36:
  %59 = getelementptr inbounds %AstValue, %AstValue* %55, i1 0, i32 8
  %60 = getelementptr inbounds %AstValueAccess, %AstValueAccess* %59, i1 0, i32 1
  store %AstId* %54, %AstId** %60, align 8
;stmt37:
  store %AstValue* %55, %AstValue** %1, align 8
  br label %endif_7
else_7:
;stmt38:
  br label %break_0
  br label %endif_7
endif_7:
  br label %endif_6
endif_6:
  br label %endif_1
endif_1:
  br label %continue_0
break_0:
;stmt39:
  %62 = load %AstValue*, %AstValue** %1
  ret %AstValue* %62
}

define %AstValue* @func218 () {
;stmt0:
  %1 = call i1 () @func242 ()
  br i1 %1, label %then_0, label %else_0
then_0:
;stmt1:
  %2 = call %AstValue* () @func225 ()
  ret %AstValue* %2
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt2:
  %4 = alloca %AstValue*
  store %AstValue* zeroinitializer, %AstValue** %4, align 8
;stmt3:
  %5 = call %Token* () @func181 ()
  %6 = getelementptr inbounds %Token, %Token* %5, i1 0, i32 1
;stmt4:
  %7 = bitcast [2 x %Nat8]* @func218_str1 to %Str
  %8 = call i1 (%Str) @func187 (%Str %7)
  br i1 %8, label %then_1, label %else_1
then_1:
;stmt5:
  %9 = call %AstValue* () @func207 ()
  store %AstValue* %9, %AstValue** %4, align 8
;stmt6:
  %10 = bitcast [2 x %Nat8]* @func218_str2 to %Str
  %11 = call i1 (%Str) @need (%Str %10)
  br label %endif_1
else_1:
;stmt7:
  %12 = call %AstValue* () @func219 ()
  store %AstValue* %12, %AstValue** %4, align 8
  br label %endif_1
endif_1:
;stmt8:
  %13 = load %AstValue*, %AstValue** %4
  ret %AstValue* %13
}

define %AstValue* @func220 (%Token*) {
;stmt0:
  %2 = bitcast [19 x %Nat8]* @func219_func220_str1 to %Str
  %3 = getelementptr inbounds %Token, %Token* %0, i1 0, i32 1
  call void (%Str, %TokenInfo*) @error (%Str %2, %TokenInfo* %3)
;stmt1:
  %4 = bitcast [14 x %Nat8]* @func219_func220_str2 to %Str
  %5 = getelementptr inbounds %Token, %Token* %0, i1 0, i32 2
; index array
  %6 = getelementptr inbounds [0 x %Nat8], [0 x %Nat8]* %5, i1 0, %Int64 0
  %7 = call %Int32 (%Str, ...) @printf (%Str %4, %Nat8* %6)
;stmt2:
  %8 = bitcast [9 x %Nat8]* @func219_func220_str3 to %Str
  call void (i1, %Str) @assert (i1 0, %Str %8)
;stmt3:
  ret %AstValue* zeroinitializer
}

define %AstValue* @func219 () {
;stmt0:
  %1 = call %Token* () @func181 ()
;stmt1:
  %2 = getelementptr inbounds %Token, %Token* %1, i1 0, i32 0
  %3 = load %TokenKind, %TokenKind* %2
  br label %select_1_0
select_1_0:
  %4 = icmp eq %TokenKind %3, 1
  br i1 %4, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %5 = call %AstValue* () @func221 ()
  br label %select_1_end
select_1_1:
  %6 = icmp eq %TokenKind %3, 2
  br i1 %6, label %select_1_1_ok, label %select_1_2
select_1_1_ok:
  %7 = call %AstValue* () @func227 ()
  br label %select_1_end
select_1_2:
  %8 = icmp eq %TokenKind %3, 4
  br i1 %8, label %select_1_2_ok, label %select_1_3
select_1_2_ok:
  %9 = call %AstValue* () @func223 ()
  br label %select_1_end
select_1_3:
  %10 = call %AstValue* (%Token*) @func220 (%Token* %1)
  br label %select_1_end
select_1_end:
  %11 = phi %AstValue* [ %5, %select_1_0_ok ], [ %7, %select_1_1_ok ], [ %9, %select_1_2_ok ], [ %10, %select_1_3 ]
  ret %AstValue* %11
}

define %AstValue* @func221 () {
;stmt0:
  %1 = bitcast [5 x %Nat8]* @func221_str1 to %Str
  %2 = call i1 (%Str) @func187 (%Str %1)
  br i1 %2, label %then_0, label %else_0
then_0:
;stmt1:
  %3 = call %AstValue* () @func225 ()
  ret %AstValue* %3
  br label %endif_0
else_0:
;stmt2:
  %5 = bitcast [7 x %Nat8]* @func221_str2 to %Str
  %6 = call i1 (%Str) @func187 (%Str %5)
  br i1 %6, label %then_1, label %else_1
then_1:
;stmt3:
  %7 = call %AstValue* () @func226 ()
  ret %AstValue* %7
  br label %endif_1
else_1:
;stmt4:
  %9 = bitcast [6 x %Nat8]* @func221_str3 to %Str
  %10 = call i1 (%Str) @func187 (%Str %9)
  br i1 %10, label %then_2, label %else_2
then_2:
;stmt5:
  %11 = call %AstValue* () @func224 ()
  ret %AstValue* %11
  br label %endif_2
else_2:
;stmt6:
  %13 = bitcast [7 x %Nat8]* @func221_str4 to %Str
  %14 = call i1 (%Str) @func187 (%Str %13)
  br i1 %14, label %then_3, label %else_3
then_3:
;stmt7:
  %15 = call %AstValue* () @func222 ()
  ret %AstValue* %15
  br label %endif_3
else_3:
  br label %endif_3
endif_3:
  br label %endif_2
endif_2:
  br label %endif_1
endif_1:
  br label %endif_0
endif_0:
;stmt8:
  %17 = call %Token* () @func181 ()
  %18 = getelementptr inbounds %Token, %Token* %17, i1 0, i32 1
;stmt9:
  %19 = call %AstId* () @parse_id ()
;stmt10:
  %20 = icmp eq %AstId* %19, zeroinitializer
  br i1 %20, label %then_4, label %else_4
then_4:
;stmt11:
  ret %AstValue* zeroinitializer
  br label %endif_4
else_4:
  br label %endif_4
endif_4:
;stmt12:
  %22 = call %AstValue* (%AstValueKind, %TokenInfo*) @func204 (%AstValueKind 4, %TokenInfo* %18)
;stmt13:
  %23 = getelementptr inbounds %AstValue, %AstValue* %22, i1 0, i32 2
  %24 = getelementptr inbounds %AstName, %AstName* %23, i1 0, i32 0
  store %AstId* %19, %AstId** %24, align 8
;stmt14:
  %25 = getelementptr inbounds %AstValue, %AstValue* %22, i1 0, i32 2
  %26 = getelementptr inbounds %AstName, %AstName* %25, i1 0, i32 2
  store %TokenInfo* %18, %TokenInfo** %26, align 8
;stmt15:
  ret %AstValue* %22
;stmt16:
  br label %fail
fail:
;stmt17:
  ret %AstValue* zeroinitializer
}

define %AstValue* @func222 () {
;stmt0:
  %1 = call %Token* () @func181 ()
;stmt1:
  %2 = getelementptr inbounds %Token, %Token* %1, i1 0, i32 1
  %3 = call %AstValue* (%AstValueKind, %TokenInfo*) @func204 (%AstValueKind 35, %TokenInfo* %2)
;stmt2:
  %4 = getelementptr inbounds %AstValue, %AstValue* %3, i1 0, i32 10
  %5 = getelementptr inbounds %AstValueSelect, %AstValueSelect* %4, i1 0, i32 1
  call void (%List*) @map_init (%List* %5)
;stmt3:
  %6 = getelementptr inbounds %AstValue, %AstValue* %3, i1 0, i32 10
  %7 = getelementptr inbounds %AstValueSelect, %AstValueSelect* %6, i1 0, i32 0
  %8 = call %AstValue* () @func207 ()
  store %AstValue* %8, %AstValue** %7, align 8
;stmt4:
  call void () @skip_nl ()
;stmt5:
  %9 = bitcast [2 x %Nat8]* @func222_str1 to %Str
  %10 = call i1 (%Str) @need (%Str %9)
;stmt6:
  call void () @skip_nl ()
;stmt7:
  br label %continue_0
continue_0:
  %11 = bitcast [2 x %Nat8]* @func222_str2 to %Str
  %12 = call i1 (%Str) @func187 (%Str %11)
  %13 = xor i1 %12, 1
  br i1 %13, label %body_0, label %break_0
body_0:
;stmt8:
  %14 = bitcast [5 x %Nat8]* @func222_str3 to %Str
  %15 = call i1 (%Str) @func187 (%Str %14)
  br i1 %15, label %then_0, label %else_0
then_0:
;stmt9:
  %16 = bitcast [3 x %Nat8]* @func222_str4 to %Str
  %17 = call i1 (%Str) @need (%Str %16)
;stmt10:
  %18 = getelementptr inbounds %AstValue, %AstValue* %3, i1 0, i32 10
  %19 = getelementptr inbounds %AstValueSelect, %AstValueSelect* %18, i1 0, i32 2
  %20 = call %AstValue* () @func207 ()
  store %AstValue* %20, %AstValue** %19, align 8
;stmt11:
  call void () @skip_nl ()
;stmt12:
  br label %continue_0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt13:
  %22 = call %Unit* (%Nat32) @malloc (%Nat32 16)
  %23 = bitcast %Unit* %22 to %AstValueSelectVariant*
;stmt14:
  %24 = getelementptr inbounds %AstValueSelectVariant, %AstValueSelectVariant* %23, i1 0, i32 0
  %25 = call %AstValue* () @func207 ()
  store %AstValue* %25, %AstValue** %24, align 8
;stmt15:
  %26 = bitcast [3 x %Nat8]* @func222_str5 to %Str
  %27 = call i1 (%Str) @need (%Str %26)
;stmt16:
  %28 = getelementptr inbounds %AstValueSelectVariant, %AstValueSelectVariant* %23, i1 0, i32 1
  %29 = call %AstValue* () @func207 ()
  store %AstValue* %29, %AstValue** %28, align 8
;stmt17:
  call void () @skip_nl ()
;stmt18:
  %30 = getelementptr inbounds %AstValue, %AstValue* %3, i1 0, i32 10
  %31 = getelementptr inbounds %AstValueSelect, %AstValueSelect* %30, i1 0, i32 1
  %32 = bitcast %AstValueSelectVariant* %23 to %Unit*
  %33 = call i1 (%List*, %Unit*) @list_append (%List* %31, %Unit* %32)
  br label %continue_0
break_0:
;stmt19:
  ret %AstValue* %3
}

define %AstValue* @func223 () {
;stmt0:
  %1 = call %Token* () @func181 ()
;stmt1:
  %2 = getelementptr inbounds %Token, %Token* %1, i1 0, i32 2
;stmt2:
  %3 = bitcast [0 x %Nat8]* %2 to %Str
  %4 = call %Nat32 (%Str) @strlen (%Str %3)
  %5 = add %Nat32 %4, 1
;stmt3:
  %6 = bitcast [0 x %Nat8]* %2 to %Str
  %7 = call %Str (%Str) @dup (%Str %6)
;stmt4:
  call void () @skip ()
;stmt5:
  %8 = getelementptr inbounds %Token, %Token* %1, i1 0, i32 1
  %9 = call %AstValue* (%AstValueKind, %TokenInfo*) @func204 (%AstValueKind 3, %TokenInfo* %8)
;stmt6:
  %10 = getelementptr inbounds %AstValue, %AstValue* %9, i1 0, i32 1
  store %Str %7, %Str* %10, align 8
;stmt7:
  ret %AstValue* %9
}

define %AstValue* @func224 () {
;stmt0:
  ret %AstValue* zeroinitializer
}

define %AstValue* @func225 () {
;stmt0:
  %1 = call %Token* () @func181 ()
  %2 = getelementptr inbounds %Token, %Token* %1, i1 0, i32 1
;stmt1:
  %3 = call %AstType* () @func198 ()
;stmt2:
  call void () @skip_nl ()
;stmt3:
  %4 = call %Token* () @func181 ()
  %5 = getelementptr inbounds %Token, %Token* %4, i1 0, i32 1
;stmt4:
  %6 = bitcast [2 x %Nat8]* @func225_str1 to %Str
  %7 = call i1 (%Str) @need (%Str %6)
;stmt5:
  %8 = call %AstStmt* (%TokenInfo*) @func234 (%TokenInfo* %5)
;stmt6:
  %9 = call %AstValue* (%AstValueKind, %TokenInfo*) @func204 (%AstValueKind 5, %TokenInfo* %2)
;stmt7:
  %10 = getelementptr inbounds %AstValue, %AstValue* %9, i1 0, i32 5
  %11 = getelementptr inbounds %AstValueFunc, %AstValueFunc* %10, i1 0, i32 0
  store %AstType* %3, %AstType** %11, align 8
;stmt8:
  %12 = getelementptr inbounds %AstValue, %AstValue* %9, i1 0, i32 5
  %13 = getelementptr inbounds %AstValueFunc, %AstValueFunc* %12, i1 0, i32 1
  store %AstStmt* %8, %AstStmt** %13, align 8
;stmt9:
  ret %AstValue* %9
}

define %AstValue* @func226 () {
;stmt0:
  %1 = call %Token* () @func181 ()
  %2 = getelementptr inbounds %Token, %Token* %1, i1 0, i32 1
;stmt1:
  %3 = call %AstType* () @func198 ()
;stmt2:
  %4 = call %AstValue* (%AstValueKind, %TokenInfo*) @func204 (%AstValueKind 5, %TokenInfo* %2)
;stmt3:
  %5 = getelementptr inbounds %AstValue, %AstValue* %4, i1 0, i32 5
  %6 = getelementptr inbounds %AstValueFunc, %AstValueFunc* %5, i1 0, i32 0
  store %AstType* %3, %AstType** %6, align 8
;stmt4:
  %7 = getelementptr inbounds %AstValue, %AstValue* %4, i1 0, i32 11
  store i1 1, i1* %7, align 1
;stmt5:
  %8 = getelementptr inbounds %AstValue, %AstValue* %4, i1 0, i32 5
  %9 = getelementptr inbounds %AstValueFunc, %AstValueFunc* %8, i1 0, i32 1
  store %AstStmt* zeroinitializer, %AstStmt** %9, align 8
;stmt6:
  ret %AstValue* %4
}

define %AstValue* @func227 () {
;stmt0:
  %1 = call %Token* () @func181 ()
;stmt1:
  %2 = getelementptr inbounds %Token, %Token* %1, i1 0, i32 1
;stmt2:
  %3 = getelementptr inbounds %Token, %Token* %1, i1 0, i32 2
; index array
  %4 = getelementptr inbounds [0 x %Nat8], [0 x %Nat8]* %3, i1 0, %Int64 0
  %5 = bitcast %Nat8* %4 to %Str
  %6 = call %Str (%Str) @dup (%Str %5)
;stmt3:
  call void () @skip ()
;stmt4:
  %7 = call %AstValue* (%AstValueKind, %TokenInfo*) @func204 (%AstValueKind 2, %TokenInfo* %2)
;stmt5:
  %8 = getelementptr inbounds %AstValue, %AstValue* %7, i1 0, i32 1
  store %Str %6, %Str* %8, align 8
;stmt6:
  ret %AstValue* %7
}

define %AstStmt* @ast_stmt_new (%AstStmtKind, %TokenInfo*) {
;stmt0:
  %3 = call %Unit* (%Nat32) @malloc (%Nat32 216)
  %4 = bitcast %Unit* %3 to %AstStmt*
;stmt1:
  %5 = icmp ne %AstStmt* %4, zeroinitializer
  %6 = bitcast [21 x %Nat8]* @func228_str1 to %Str
  call void (i1, %Str) @assert (i1 %5, %Str %6)
;stmt2:
  %7 = bitcast %AstStmt* %4 to %Unit*
  %8 = call %Unit* (%Unit*, %Nat8, %Nat32) @memset (%Unit* %7, %Nat8 0, %Nat32 216)
;stmt3:
  %9 = getelementptr inbounds %AstStmt, %AstStmt* %4, i1 0, i32 0
  store %AstStmtKind %0, %AstStmtKind* %9, align 2
;stmt4:
  %10 = getelementptr inbounds %AstStmt, %AstStmt* %4, i1 0, i32 12
  store %TokenInfo* %1, %TokenInfo** %10, align 8
;stmt5:
  ret %AstStmt* %4
}

define %AstStmt* @func230 () {
;stmt0:
  %1 = call %Token* () @func181 ()
;stmt1:
  %2 = getelementptr inbounds %Token, %Token* %1, i1 0, i32 0
  %3 = load %TokenKind, %TokenKind* %2
  %4 = icmp eq %TokenKind %3, 1
  br i1 %4, label %then_0, label %else_0
then_0:
;stmt2:
  %5 = call %Token* () @nextok ()
;stmt3:
  %6 = getelementptr inbounds %Token, %Token* %5, i1 0, i32 2
; index array
  %7 = getelementptr inbounds [0 x %Nat8], [0 x %Nat8]* %6, i1 0, %Int64 0
  %8 = load %Nat8, %Nat8* %7
; index array
  %9 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func229_func230_str1, i1 0, %Int64 0
  %10 = load %Nat8, %Nat8* %9
  %11 = icmp eq %Nat8 %8, %10
  %12 = getelementptr inbounds %Token, %Token* %5, i1 0, i32 1
  %13 = getelementptr inbounds %TokenInfo, %TokenInfo* %12, i1 0, i32 2
  %14 = load %Nat16, %Nat16* %13
  %15 = icmp eq %Nat16 %14, 1
  %16 = and i1 %11, %15
  br i1 %16, label %then_1, label %else_1
then_1:
;stmt4:
  %17 = call %AstId* () @parse_id ()
;stmt5:
  call void () @skip ()
;stmt6:
  %18 = call %Token* () @func181 ()
  %19 = getelementptr inbounds %Token, %Token* %18, i1 0, i32 1
;stmt7:
  %20 = call %AstStmt* (%AstStmtKind, %TokenInfo*) @ast_stmt_new (%AstStmtKind 13, %TokenInfo* %19)
;stmt8:
  %21 = getelementptr inbounds %AstStmt, %AstStmt* %20, i1 0, i32 11
  %22 = getelementptr inbounds %AstStmtLabel, %AstStmtLabel* %21, i1 0, i32 0
  store %AstId* %17, %AstId** %22, align 8
;stmt9:
  ret %AstStmt* %20
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt10:
  %24 = getelementptr inbounds %Token, %Token* %1, i1 0, i32 1
  %25 = call %AstStmt* (%TokenInfo*) @func231 (%TokenInfo* %24)
  ret %AstStmt* %25
}

define %AstStmt* @parse_stmt () {
;stmt0:
  %1 = call %Token* () @func181 ()
;stmt1:
  %2 = call %Token* () @nextok ()
;stmt2:
  %3 = getelementptr inbounds %Token, %Token* %1, i1 0, i32 1
;stmt3:
  %4 = getelementptr inbounds %Token, %Token* %1, i1 0, i32 0
  %5 = load %TokenKind, %TokenKind* %4
  %6 = icmp eq %TokenKind %5, 1
  %7 = getelementptr inbounds %Token, %Token* %2, i1 0, i32 0
  %8 = load %TokenKind, %TokenKind* %7
  %9 = icmp eq %TokenKind %8, 3
  %10 = getelementptr inbounds %Token, %Token* %2, i1 0, i32 2
; index array
  %11 = getelementptr inbounds [0 x %Nat8], [0 x %Nat8]* %10, i1 0, %Int64 0
  %12 = load %Nat8, %Nat8* %11
; index array
  %13 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func229_str1, i1 0, %Int64 0
  %14 = load %Nat8, %Nat8* %13
  %15 = icmp eq %Nat8 %12, %14
  %16 = and i1 %9, %15
  %17 = and i1 %6, %16
;stmt4:
  %18 = getelementptr inbounds %Token, %Token* %1, i1 0, i32 2
; index array
  %19 = getelementptr inbounds [0 x %Nat8], [0 x %Nat8]* %18, i1 0, %Int64 0
  %20 = load %Nat8, %Nat8* %19
  %21 = call i1 (%Nat8) @isLowerCase (%Nat8 %20)
  %22 = getelementptr inbounds %Token, %Token* %1, i1 0, i32 2
; index array
  %23 = getelementptr inbounds [0 x %Nat8], [0 x %Nat8]* %22, i1 0, %Int64 0
  %24 = load %Nat8, %Nat8* %23
; index array
  %25 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func229_str2, i1 0, %Int64 0
  %26 = load %Nat8, %Nat8* %25
  %27 = icmp eq %Nat8 %24, %26
  %28 = or i1 %21, %27
  %29 = and i1 %17, %28
;stmt5:
  %30 = getelementptr inbounds %Token, %Token* %1, i1 0, i32 2
; index array
  %31 = getelementptr inbounds [0 x %Nat8], [0 x %Nat8]* %30, i1 0, %Int64 0
  %32 = load %Nat8, %Nat8* %31
  %33 = call i1 (%Nat8) @isUpperCase (%Nat8 %32)
  %34 = and i1 %17, %33
;stmt6:
  br label %select_1_0
select_1_0:
  %35 = bitcast [4 x %Nat8]* @func229_str3 to %Str
  %36 = call i1 (%Str) @func187 (%Str %35)
  %37 = or i1 %36, %29
  %38 = icmp eq i1 1, %37
  br i1 %38, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %39 = call %AstStmt* (%TokenInfo*) @func232 (%TokenInfo* %3)
  br label %select_1_end
select_1_1:
  %40 = bitcast [2 x %Nat8]* @func229_str4 to %Str
  %41 = call i1 (%Str) @func187 (%Str %40)
  %42 = icmp eq i1 1, %41
  br i1 %42, label %select_1_1_ok, label %select_1_2
select_1_1_ok:
  %43 = call %AstStmt* (%TokenInfo*) @func234 (%TokenInfo* %3)
  br label %select_1_end
select_1_2:
  %44 = bitcast [3 x %Nat8]* @func229_str5 to %Str
  %45 = call i1 (%Str) @func187 (%Str %44)
  %46 = icmp eq i1 1, %45
  br i1 %46, label %select_1_2_ok, label %select_1_3
select_1_2_ok:
  %47 = call %AstStmt* (%TokenInfo*) @func235 (%TokenInfo* %3)
  br label %select_1_end
select_1_3:
  %48 = bitcast [6 x %Nat8]* @func229_str6 to %Str
  %49 = call i1 (%Str) @func187 (%Str %48)
  %50 = icmp eq i1 1, %49
  br i1 %50, label %select_1_3_ok, label %select_1_4
select_1_3_ok:
  %51 = call %AstStmt* (%TokenInfo*) @func236 (%TokenInfo* %3)
  br label %select_1_end
select_1_4:
  %52 = bitcast [7 x %Nat8]* @func229_str7 to %Str
  %53 = call i1 (%Str) @func187 (%Str %52)
  %54 = icmp eq i1 1, %53
  br i1 %54, label %select_1_4_ok, label %select_1_5
select_1_4_ok:
  %55 = call %AstStmt* (%TokenInfo*) @func237 (%TokenInfo* %3)
  br label %select_1_end
select_1_5:
  %56 = bitcast [6 x %Nat8]* @func229_str8 to %Str
  %57 = call i1 (%Str) @func187 (%Str %56)
  %58 = icmp eq i1 1, %57
  br i1 %58, label %select_1_5_ok, label %select_1_6
select_1_5_ok:
  %59 = call %AstStmt* (%AstStmtKind, %TokenInfo*) @ast_stmt_new (%AstStmtKind 10, %TokenInfo* %3)
  br label %select_1_end
select_1_6:
  %60 = bitcast [9 x %Nat8]* @func229_str9 to %Str
  %61 = call i1 (%Str) @func187 (%Str %60)
  %62 = icmp eq i1 1, %61
  br i1 %62, label %select_1_6_ok, label %select_1_7
select_1_6_ok:
  %63 = call %AstStmt* (%AstStmtKind, %TokenInfo*) @ast_stmt_new (%AstStmtKind 11, %TokenInfo* %3)
  br label %select_1_end
select_1_7:
  %64 = bitcast [5 x %Nat8]* @func229_str10 to %Str
  %65 = call i1 (%Str) @func187 (%Str %64)
  %66 = or i1 %65, %34
  %67 = icmp eq i1 1, %66
  br i1 %67, label %select_1_7_ok, label %select_1_8
select_1_7_ok:
  %68 = call %AstStmt* (%TokenInfo*) @func233 (%TokenInfo* %3)
  br label %select_1_end
select_1_8:
  %69 = bitcast [5 x %Nat8]* @func229_str11 to %Str
  %70 = call i1 (%Str) @func187 (%Str %69)
  %71 = icmp eq i1 1, %70
  br i1 %71, label %select_1_8_ok, label %select_1_9
select_1_8_ok:
  %72 = call %AstStmt* (%TokenInfo*) @func238 (%TokenInfo* %3)
  br label %select_1_end
select_1_9:
  %73 = call %AstStmt* () @func230 ()
  br label %select_1_end
select_1_end:
  %74 = phi %AstStmt* [ %39, %select_1_0_ok ], [ %43, %select_1_1_ok ], [ %47, %select_1_2_ok ], [ %51, %select_1_3_ok ], [ %55, %select_1_4_ok ], [ %59, %select_1_5_ok ], [ %63, %select_1_6_ok ], [ %68, %select_1_7_ok ], [ %72, %select_1_8_ok ], [ %73, %select_1_9 ]
  ret %AstStmt* %74
}

define %AstStmt* @func231 (%TokenInfo*) {
;stmt0:
  %2 = call %AstValue* () @func207 ()
;stmt1:
  %3 = bitcast [3 x %Nat8]* @func231_str1 to %Str
  %4 = call i1 (%Str) @func187 (%Str %3)
  br i1 %4, label %then_0, label %else_0
then_0:
;stmt2:
  %5 = call %AstStmt* (%AstStmtKind, %TokenInfo*) @ast_stmt_new (%AstStmtKind 5, %TokenInfo* %0)
;stmt3:
  %6 = getelementptr inbounds %AstStmt, %AstStmt* %5, i1 0, i32 1
  %7 = getelementptr inbounds %AstStmtAssign, %AstStmtAssign* %6, i1 0, i32 0
  store %AstValue* %2, %AstValue** %7, align 8
;stmt4:
  %8 = getelementptr inbounds %AstStmt, %AstStmt* %5, i1 0, i32 1
  %9 = getelementptr inbounds %AstStmtAssign, %AstStmtAssign* %8, i1 0, i32 1
  %10 = call %AstValue* () @func207 ()
  store %AstValue* %10, %AstValue** %9, align 8
;stmt5:
  ret %AstStmt* %5
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt6:
  %12 = call %AstStmt* (%AstStmtKind, %TokenInfo*) @ast_stmt_new (%AstStmtKind 4, %TokenInfo* %0)
;stmt7:
  %13 = getelementptr inbounds %AstStmt, %AstStmt* %12, i1 0, i32 5
  %14 = getelementptr inbounds %AstStmtExpr, %AstStmtExpr* %13, i1 0, i32 0
  store %AstValue* %2, %AstValue** %14, align 8
;stmt8:
  ret %AstStmt* %12
}

define %AstStmt* @func232 (%TokenInfo*) {
;stmt0:
  %2 = call %Token* () @func181 ()
  %3 = getelementptr inbounds %Token, %Token* %2, i1 0, i32 1
;stmt1:
  %4 = call %AstId* () @parse_id ()
;stmt2:
  %5 = bitcast [2 x %Nat8]* @func232_str1 to %Str
  %6 = call i1 (%Str) @need (%Str %5)
;stmt3:
  %7 = call %AstValue* () @func207 ()
;stmt4:
  %8 = icmp eq %AstId* %4, zeroinitializer
  %9 = icmp eq %AstValue* %7, zeroinitializer
  %10 = or i1 %8, %9
  br i1 %10, label %then_0, label %else_0
then_0:
;stmt5:
  ret %AstStmt* zeroinitializer
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt6:
  %12 = call %AstStmt* (%AstStmtKind, %TokenInfo*) @ast_stmt_new (%AstStmtKind 1, %TokenInfo* %3)
;stmt7:
  %13 = getelementptr inbounds %AstStmt, %AstStmt* %12, i1 0, i32 3
  %14 = getelementptr inbounds %AstStmtValueDef, %AstStmtValueDef* %13, i1 0, i32 0
  store %AstId* %4, %AstId** %14, align 8
;stmt8:
  %15 = getelementptr inbounds %AstStmt, %AstStmt* %12, i1 0, i32 3
  %16 = getelementptr inbounds %AstStmtValueDef, %AstStmtValueDef* %15, i1 0, i32 1
  store %AstValue* %7, %AstValue** %16, align 8
;stmt9:
  ret %AstStmt* %12
}

define %AstStmt* @func233 (%TokenInfo*) {
;stmt0:
  %2 = call %Token* () @func181 ()
  %3 = getelementptr inbounds %Token, %Token* %2, i1 0, i32 1
;stmt1:
  %4 = call %AstId* () @parse_id ()
;stmt2:
  %5 = bitcast [2 x %Nat8]* @func233_str1 to %Str
  %6 = call i1 (%Str) @need (%Str %5)
;stmt3:
  %7 = call %AstType* () @func198 ()
;stmt4:
  %8 = icmp eq %AstId* %4, zeroinitializer
  %9 = icmp eq %AstType* %7, zeroinitializer
  %10 = or i1 %8, %9
  br i1 %10, label %then_0, label %else_0
then_0:
;stmt5:
  ret %AstStmt* zeroinitializer
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt6:
  %12 = call %AstStmt* (%AstStmtKind, %TokenInfo*) @ast_stmt_new (%AstStmtKind 2, %TokenInfo* %3)
;stmt7:
  %13 = getelementptr inbounds %AstStmt, %AstStmt* %12, i1 0, i32 4
  %14 = getelementptr inbounds %AstStmtTypeDef, %AstStmtTypeDef* %13, i1 0, i32 0
  store %AstId* %4, %AstId** %14, align 8
;stmt8:
  %15 = getelementptr inbounds %AstStmt, %AstStmt* %12, i1 0, i32 4
  %16 = getelementptr inbounds %AstStmtTypeDef, %AstStmtTypeDef* %15, i1 0, i32 1
  store %AstType* %7, %AstType** %16, align 8
;stmt9:
  ret %AstStmt* %12
}

define %AstStmt* @func234 (%TokenInfo*) {
;stmt0:
  %2 = call %AstStmt* (%AstStmtKind, %TokenInfo*) @ast_stmt_new (%AstStmtKind 6, %TokenInfo* %0)
;stmt1:
  %3 = getelementptr inbounds %AstStmt, %AstStmt* %2, i1 0, i32 6
  %4 = getelementptr inbounds %AstStmtBlock, %AstStmtBlock* %3, i1 0, i32 0
  call void (%List*) @map_init (%List* %4)
;stmt2:
  br label %continue_0
continue_0:
  %5 = bitcast [2 x %Nat8]* @func234_str1 to %Str
  %6 = call i1 (%Str) @func187 (%Str %5)
  %7 = xor i1 %6, 1
  br i1 %7, label %body_0, label %break_0
body_0:
;stmt3:
  call void () @skip_nl ()
;stmt4:
  %8 = call i1 () @eof ()
  br i1 %8, label %then_0, label %else_0
then_0:
;stmt5:
  %9 = bitcast [23 x %Nat8]* @func234_str2 to %Str
  call void (%Str) @fatal (%Str %9)
;stmt6:
  br label %break_0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt7:
  %11 = bitcast [2 x %Nat8]* @func234_str3 to %Str
  %12 = call i1 (%Str) @func187 (%Str %11)
  br i1 %12, label %then_1, label %else_1
then_1:
;stmt8:
  br label %break_0
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt9:
  %14 = call %AstStmt* () @parse_stmt ()
;stmt10:
  %15 = icmp ne %AstStmt* %14, zeroinitializer
  br i1 %15, label %then_2, label %else_2
then_2:
;stmt11:
  %16 = call i1 () @sep ()
;stmt12:
  %17 = getelementptr inbounds %AstStmt, %AstStmt* %2, i1 0, i32 6
  %18 = getelementptr inbounds %AstStmtBlock, %AstStmtBlock* %17, i1 0, i32 0
  %19 = bitcast %AstStmt* %14 to %Unit*
  %20 = call i1 (%List*, %Unit*) @list_append (%List* %18, %Unit* %19)
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
  br label %continue_0
break_0:
;stmt13:
  ret %AstStmt* %2
}

define %AstStmt* @func235 (%TokenInfo*) {
;stmt0:
  %2 = call %AstStmt* (%AstStmtKind, %TokenInfo*) @ast_stmt_new (%AstStmtKind 7, %TokenInfo* %0)
;stmt1:
  %3 = getelementptr inbounds %AstStmt, %AstStmt* %2, i1 0, i32 7
  %4 = getelementptr inbounds %AstStmtIf, %AstStmtIf* %3, i1 0, i32 0
  %5 = call %AstValue* () @func207 ()
  store %AstValue* %5, %AstValue** %4, align 8
;stmt2:
  %6 = bitcast [2 x %Nat8]* @func235_str1 to %Str
  %7 = call i1 (%Str) @func187 (%Str %6)
;stmt3:
  %8 = call %Token* () @func181 ()
  %9 = getelementptr inbounds %Token, %Token* %8, i1 0, i32 1
;stmt4:
  %10 = bitcast [2 x %Nat8]* @func235_str2 to %Str
  %11 = call i1 (%Str) @need (%Str %10)
;stmt5:
  %12 = getelementptr inbounds %AstStmt, %AstStmt* %2, i1 0, i32 7
  %13 = getelementptr inbounds %AstStmtIf, %AstStmtIf* %12, i1 0, i32 1
  %14 = call %AstStmt* (%TokenInfo*) @func234 (%TokenInfo* %9)
  store %AstStmt* %14, %AstStmt** %13, align 8
;stmt6:
  %15 = bitcast [5 x %Nat8]* @func235_str3 to %Str
  %16 = call i1 (%Str) @func187 (%Str %15)
  br i1 %16, label %then_0, label %else_0
then_0:
;stmt7:
  %17 = bitcast [2 x %Nat8]* @func235_str4 to %Str
  %18 = call i1 (%Str) @func187 (%Str %17)
;stmt8:
  %19 = call %Token* () @func181 ()
  %20 = getelementptr inbounds %Token, %Token* %19, i1 0, i32 1
;stmt9:
  %21 = bitcast [3 x %Nat8]* @func235_str5 to %Str
  %22 = call i1 (%Str) @func187 (%Str %21)
  br i1 %22, label %then_1, label %else_1
then_1:
;stmt10:
  %23 = getelementptr inbounds %AstStmt, %AstStmt* %2, i1 0, i32 7
  %24 = getelementptr inbounds %AstStmtIf, %AstStmtIf* %23, i1 0, i32 2
  %25 = call %AstStmt* (%TokenInfo*) @func235 (%TokenInfo* %20)
  store %AstStmt* %25, %AstStmt** %24, align 8
  br label %endif_1
else_1:
;stmt11:
  %26 = bitcast [2 x %Nat8]* @func235_str6 to %Str
  %27 = call i1 (%Str) @need (%Str %26)
;stmt12:
  %28 = getelementptr inbounds %AstStmt, %AstStmt* %2, i1 0, i32 7
  %29 = getelementptr inbounds %AstStmtIf, %AstStmtIf* %28, i1 0, i32 2
  %30 = call %AstStmt* (%TokenInfo*) @func234 (%TokenInfo* %20)
  store %AstStmt* %30, %AstStmt** %29, align 8
  br label %endif_1
endif_1:
  br label %endif_0
else_0:
;stmt13:
  %31 = getelementptr inbounds %AstStmt, %AstStmt* %2, i1 0, i32 7
  %32 = getelementptr inbounds %AstStmtIf, %AstStmtIf* %31, i1 0, i32 2
  store %AstStmt* zeroinitializer, %AstStmt** %32, align 8
  br label %endif_0
endif_0:
;stmt14:
  %33 = getelementptr inbounds %AstStmt, %AstStmt* %2, i1 0, i32 7
  %34 = getelementptr inbounds %AstStmtIf, %AstStmtIf* %33, i1 0, i32 0
  %35 = load %AstValue*, %AstValue** %34
  %36 = icmp eq %AstValue* %35, zeroinitializer
  %37 = getelementptr inbounds %AstStmt, %AstStmt* %2, i1 0, i32 7
  %38 = getelementptr inbounds %AstStmtIf, %AstStmtIf* %37, i1 0, i32 1
  %39 = load %AstStmt*, %AstStmt** %38
  %40 = icmp eq %AstStmt* %39, zeroinitializer
  %41 = or i1 %36, %40
  br i1 %41, label %then_2, label %else_2
then_2:
;stmt15:
  ret %AstStmt* zeroinitializer
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
;stmt16:
  ret %AstStmt* %2
}

define %AstStmt* @func236 (%TokenInfo*) {
;stmt0:
  %2 = call %AstStmt* (%AstStmtKind, %TokenInfo*) @ast_stmt_new (%AstStmtKind 8, %TokenInfo* %0)
;stmt1:
  %3 = getelementptr inbounds %AstStmt, %AstStmt* %2, i1 0, i32 8
  %4 = getelementptr inbounds %AstStmtWhile, %AstStmtWhile* %3, i1 0, i32 0
  %5 = call %AstValue* () @func207 ()
  store %AstValue* %5, %AstValue** %4, align 8
;stmt2:
  %6 = bitcast [2 x %Nat8]* @func236_str1 to %Str
  %7 = call i1 (%Str) @func187 (%Str %6)
;stmt3:
  %8 = call %Token* () @func181 ()
  %9 = getelementptr inbounds %Token, %Token* %8, i1 0, i32 1
;stmt4:
  %10 = bitcast [2 x %Nat8]* @func236_str2 to %Str
  %11 = call i1 (%Str) @need (%Str %10)
;stmt5:
  %12 = getelementptr inbounds %AstStmt, %AstStmt* %2, i1 0, i32 8
  %13 = getelementptr inbounds %AstStmtWhile, %AstStmtWhile* %12, i1 0, i32 1
  %14 = call %AstStmt* (%TokenInfo*) @func234 (%TokenInfo* %9)
  store %AstStmt* %14, %AstStmt** %13, align 8
;stmt6:
  %15 = getelementptr inbounds %AstStmt, %AstStmt* %2, i1 0, i32 8
  %16 = getelementptr inbounds %AstStmtWhile, %AstStmtWhile* %15, i1 0, i32 0
  %17 = load %AstValue*, %AstValue** %16
  %18 = icmp eq %AstValue* %17, zeroinitializer
  %19 = getelementptr inbounds %AstStmt, %AstStmt* %2, i1 0, i32 8
  %20 = getelementptr inbounds %AstStmtWhile, %AstStmtWhile* %19, i1 0, i32 1
  %21 = load %AstStmt*, %AstStmt** %20
  %22 = icmp eq %AstStmt* %21, zeroinitializer
  %23 = or i1 %18, %22
  br i1 %23, label %then_0, label %else_0
then_0:
;stmt7:
  ret %AstStmt* zeroinitializer
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt8:
  ret %AstStmt* %2
}

define %AstStmt* @func237 (%TokenInfo*) {
;stmt0:
  %2 = call %AstStmt* (%AstStmtKind, %TokenInfo*) @ast_stmt_new (%AstStmtKind 9, %TokenInfo* %0)
;stmt1:
  %3 = call i1 () @func185 ()
  br i1 %3, label %then_0, label %else_0
then_0:
;stmt2:
  ret %AstStmt* %2
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt3:
  %5 = call %Token* () @func181 ()
  %6 = getelementptr inbounds %Token, %Token* %5, i1 0, i32 1
;stmt4:
  %7 = call %AstValue* () @func207 ()
;stmt5:
  %8 = icmp eq %AstValue* %7, zeroinitializer
  br i1 %8, label %then_1, label %else_1
then_1:
;stmt6:
  %9 = bitcast [27 x %Nat8]* @func237_str1 to %Str
  call void (%Str, %TokenInfo*) @error (%Str %9, %TokenInfo* %6)
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt7:
  %10 = getelementptr inbounds %AstStmt, %AstStmt* %2, i1 0, i32 9
  %11 = getelementptr inbounds %AstStmtReturn, %AstStmtReturn* %10, i1 0, i32 0
  store %AstValue* %7, %AstValue** %11, align 8
;stmt8:
  ret %AstStmt* %2
}

define %AstStmt* @func238 (%TokenInfo*) {
;stmt0:
  %2 = call %AstStmt* (%AstStmtKind, %TokenInfo*) @ast_stmt_new (%AstStmtKind 12, %TokenInfo* %0)
;stmt1:
  %3 = getelementptr inbounds %AstStmt, %AstStmt* %2, i1 0, i32 10
  %4 = getelementptr inbounds %AstStmtGoto, %AstStmtGoto* %3, i1 0, i32 0
  %5 = call %AstId* () @parse_id ()
  store %AstId* %5, %AstId** %4, align 8
;stmt2:
  ret %AstStmt* %2
}

define %AstStmt* @func239 (%TokenInfo*) {
;stmt0:
  %2 = call %AstStmt* (%AstStmtKind, %TokenInfo*) @ast_stmt_new (%AstStmtKind 3, %TokenInfo* %0)
;stmt1:
  %3 = call %AstDecl* (i1) @func203 (i1 0)
;stmt2:
  %4 = getelementptr inbounds %AstStmt, %AstStmt* %2, i1 0, i32 2
  %5 = load %AstDecl, %AstDecl* %3
  store %AstDecl %5, %AstDecl* %4, align 8
;stmt3:
  ret %AstStmt* %2
}

define %Token* @tn2tok (%Node*) {
;stmt0:
  %2 = getelementptr inbounds %Node, %Node* %0, i1 0, i32 3
  %3 = load %Unit*, %Unit** %2
  %4 = bitcast %Unit* %3 to %Token*
  ret %Token* %4
}

define i1 @is_it_type_rec () {
;stmt0:
  call void () @skip ()
;stmt1:
  call void () @skip_nl ()
;stmt2:
  %1 = bitcast [2 x %Nat8]* @func241_str1 to %Str
  %2 = call i1 (%Str) @func187 (%Str %1)
  br i1 %2, label %then_0, label %else_0
then_0:
;stmt3:
  ret i1 1
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt4:
  %4 = call %Token* () @func181 ()
;stmt5:
  %5 = getelementptr inbounds %Token, %Token* %4, i1 0, i32 0
  %6 = load %TokenKind, %TokenKind* %5
  %7 = icmp ne %TokenKind %6, 1
  br i1 %7, label %then_1, label %else_1
then_1:
;stmt6:
  ret i1 0
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt7:
  call void () @skip ()
;stmt8:
  %9 = bitcast [2 x %Nat8]* @func241_str2 to %Str
  %10 = call i1 (%Str) @func187 (%Str %9)
  br i1 %10, label %then_2, label %else_2
then_2:
;stmt9:
  ret i1 1
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
;stmt10:
  %12 = bitcast [2 x %Nat8]* @func241_str3 to %Str
  %13 = call i1 (%Str) @func187 (%Str %12)
  br i1 %13, label %then_3, label %else_3
then_3:
;stmt11:
  ret i1 1
  br label %endif_3
else_3:
  br label %endif_3
endif_3:
;stmt12:
  ret i1 0
}

define i1 @func243 () {
;stmt0:
  call void () @skip ()
;stmt1:
  %1 = call i1 () @func242 ()
  ret i1 %1
}

define i1 @func242 () {
;stmt0:
  %1 = call %Node* () @gett ()
;stmt1:
  %2 = getelementptr inbounds %Node, %Node* %1, i1 0, i32 3
  %3 = load %Unit*, %Unit** %2
  %4 = bitcast %Unit* %3 to %Token*
;stmt2:
  %5 = getelementptr inbounds %Token, %Token* %4, i1 0, i32 0
  %6 = load %TokenKind, %TokenKind* %5
  br label %select_1_0
select_1_0:
  %7 = icmp eq %TokenKind %6, 2
  br i1 %7, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %8 = bitcast i1 0 to i1
  br label %select_1_end
select_1_1:
  %9 = icmp eq %TokenKind %6, 4
  br i1 %9, label %select_1_1_ok, label %select_1_2
select_1_1_ok:
  %10 = bitcast i1 0 to i1
  br label %select_1_end
select_1_2:
  %11 = icmp eq %TokenKind %6, 5
  br i1 %11, label %select_1_2_ok, label %select_1_3
select_1_2_ok:
  %12 = bitcast i1 0 to i1
  br label %select_1_end
select_1_3:
  %13 = icmp eq %TokenKind %6, 0
  br i1 %13, label %select_1_3_ok, label %select_1_4
select_1_3_ok:
  %14 = bitcast i1 0 to i1
  br label %select_1_end
select_1_4:
  %15 = bitcast i1 1 to i1
  br label %select_1_end
select_1_end:
  %16 = phi i1 [ %8, %select_1_0_ok ], [ %10, %select_1_1_ok ], [ %12, %select_1_2_ok ], [ %14, %select_1_3_ok ], [ %15, %select_1_4 ]
  %17 = xor i1 %16, 1
  br i1 %17, label %then_0, label %else_0
then_0:
;stmt3:
  ret i1 0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt4:
  call void () @skip_nl ()
;stmt5:
  %19 = call %Token* () @func181 ()
;stmt6:
  %20 = getelementptr inbounds %Token, %Token* %19, i1 0, i32 2
; index array
  %21 = getelementptr inbounds [0 x %Nat8], [0 x %Nat8]* %20, i1 0, %Int64 0
  %22 = load %Nat8, %Nat8* %21
;stmt7:
  %23 = getelementptr inbounds %Token, %Token* %19, i1 0, i32 0
  %24 = load %TokenKind, %TokenKind* %23
  %25 = icmp eq %TokenKind %24, 1
  br i1 %25, label %then_1, label %else_1
then_1:
;stmt8:
  call void (%Node*) @sett (%Node* %1)
;stmt9:
  %26 = call i1 (%Nat8) @isUpperCase (%Nat8 %22)
  ret i1 %26
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt10:
  br label %select_2_0
select_2_0:
; index array
  %28 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func242_str1, i1 0, %Int64 0
  %29 = load %Nat8, %Nat8* %28
  %30 = icmp eq %Nat8 %22, %29
  br i1 %30, label %select_2_0_ok, label %select_2_1
select_2_0_ok:
  %31 = call i1 () @is_it_type_rec ()
  br label %select_2_end
select_2_1:
; index array
  %32 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func242_str2, i1 0, %Int64 0
  %33 = load %Nat8, %Nat8* %32
  %34 = icmp eq %Nat8 %22, %33
  br i1 %34, label %select_2_1_ok, label %select_2_2
select_2_1_ok:
  %35 = bitcast i1 1 to i1
  br label %select_2_end
select_2_2:
; index array
  %36 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func242_str3, i1 0, %Int64 0
  %37 = load %Nat8, %Nat8* %36
  %38 = icmp eq %Nat8 %22, %37
  br i1 %38, label %select_2_2_ok, label %select_2_3
select_2_2_ok:
  %39 = bitcast i1 1 to i1
  br label %select_2_end
select_2_3:
; index array
  %40 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func242_str4, i1 0, %Int64 0
  %41 = load %Nat8, %Nat8* %40
  %42 = icmp eq %Nat8 %22, %41
  br i1 %42, label %select_2_3_ok, label %select_2_4
select_2_3_ok:
  %43 = call i1 () @func243 ()
  br label %select_2_end
select_2_4:
  %44 = bitcast i1 0 to i1
  br label %select_2_end
select_2_end:
  %45 = phi i1 [ %31, %select_2_0_ok ], [ %35, %select_2_1_ok ], [ %39, %select_2_2_ok ], [ %43, %select_2_3_ok ], [ %44, %select_2_4 ]
  br i1 %45, label %then_2, label %else_2
then_2:
;stmt11:
  br label %yes
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
;stmt12:
  br label %no
no:
;stmt13:
  call void (%Node*) @sett (%Node* %1)
;stmt14:
  ret i1 0
;stmt15:
  br label %yes
yes:
;stmt16:
  call void (%Node*) @sett (%Node* %1)
;stmt17:
  ret i1 1
}

define void @func245 (%Assembly*) {
;stmt0:
  %2 = getelementptr inbounds %Assembly, %Assembly* %0, i1 0, i32 1
  %3 = bitcast [38 x %Nat8]* @func244_func245_str1 to %Str
  store %Str %3, %Str* %2, align 8
;stmt1:
  %4 = getelementptr inbounds %Assembly, %Assembly* %0, i1 0, i32 2
  %5 = bitcast [27 x %Nat8]* @func244_func245_str2 to %Str
  store %Str %5, %Str* %4, align 8
  ret void
}

define void @func246 (%Assembly*) {
;stmt0:
  %2 = getelementptr inbounds %Assembly, %Assembly* %0, i1 0, i32 1
  %3 = bitcast [48 x %Nat8]* @func244_func246_str1 to %Str
  store %Str %3, %Str* %2, align 8
;stmt1:
  %4 = getelementptr inbounds %Assembly, %Assembly* %0, i1 0, i32 2
  %5 = bitcast [28 x %Nat8]* @func244_func246_str2 to %Str
  store %Str %5, %Str* %4, align 8
  ret void
}

define void @func247 (%Assembly*) {
;stmt0:
  %2 = getelementptr inbounds %Assembly, %Assembly* %0, i1 0, i32 1
  store %Str zeroinitializer, %Str* %2, align 8
;stmt1:
  %3 = getelementptr inbounds %Assembly, %Assembly* %0, i1 0, i32 2
  store %Str zeroinitializer, %Str* %3, align 8
  ret void
}

define void @func244 (%Assembly*, %Arch, %Str) {
;stmt0:
  %4 = getelementptr inbounds %Assembly, %Assembly* %0, i1 0, i32 0
  store %Str %2, %Str* %4, align 8
;stmt1:
  br label %select_1_0
select_1_0:
  %5 = icmp eq %Arch %1, 1
  br i1 %5, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  call void (%Assembly*) @func245 (%Assembly* %0)
  br label %select_1_end
select_1_1:
  %6 = icmp eq %Arch %1, 2
  br i1 %6, label %select_1_1_ok, label %select_1_2
select_1_1_ok:
  call void (%Assembly*) @func246 (%Assembly* %0)
  br label %select_1_end
select_1_2:
  call void (%Assembly*) @func247 (%Assembly* %0)
  br label %select_1_end
select_1_end:
  ret void
}

define %Definition* @func248 (%DefinitionKind, %Str) {
;stmt0:
  %3 = call %Unit* (%Nat32) @malloc (%Nat32 128)
  %4 = bitcast %Unit* %3 to %Definition*
;stmt1:
  %5 = icmp ne %Definition* %4, zeroinitializer
  %6 = bitcast [36 x %Nat8]* @func248_str1 to %Str
  call void (i1, %Str) @assert (i1 %5, %Str %6)
;stmt2:
  %7 = bitcast %Definition* %4 to %Unit*
  %8 = call %Unit* (%Unit*, %Nat8, %Nat32) @memset (%Unit* %7, %Nat8 0, %Nat32 128)
;stmt3:
  %9 = getelementptr inbounds %Definition, %Definition* %4, i1 0, i32 0
  store %DefinitionKind %0, %DefinitionKind* %9, align 2
;stmt4:
  %10 = getelementptr inbounds %Definition, %Definition* %4, i1 0, i32 1
  store %Str %1, %Str* %10, align 8
;stmt5:
  ret %Definition* %4
}

define %Definition* @func249 (%Assembly*, %Str, %Type*) {
;stmt0:
  %4 = call %Definition* (%DefinitionKind, %Str) @func248 (%DefinitionKind 0, %Str %1)
;stmt1:
  %5 = getelementptr inbounds %Definition, %Definition* %4, i1 0, i32 3
  %6 = getelementptr inbounds %DefType, %DefType* %5, i1 0, i32 0
  store %Type* %2, %Type** %6, align 8
;stmt2:
  %7 = getelementptr inbounds %Assembly, %Assembly* %0, i1 0, i32 3
  %8 = bitcast %Definition* %4 to %Unit*
  %9 = call i1 (%List*, %Unit*) @list_append (%List* %7, %Unit* %8)
;stmt3:
  ret %Definition* %4
}

define %Definition* @func250 (%Assembly*, %Str, %Str, %Nat32) {
;stmt0:
  %5 = call %Definition* (%DefinitionKind, %Str) @func248 (%DefinitionKind 2, %Str %1)
;stmt1:
  %6 = getelementptr inbounds %Definition, %Definition* %5, i1 0, i32 2
  %7 = getelementptr inbounds %DefStr, %DefStr* %6, i1 0, i32 0
  store %Str %2, %Str* %7, align 8
;stmt2:
  %8 = getelementptr inbounds %Definition, %Definition* %5, i1 0, i32 2
  %9 = getelementptr inbounds %DefStr, %DefStr* %8, i1 0, i32 1
  store %Nat32 %3, %Nat32* %9, align 4
;stmt3:
  %10 = getelementptr inbounds %Assembly, %Assembly* %0, i1 0, i32 6
  %11 = bitcast %Definition* %5 to %Unit*
  %12 = call i1 (%List*, %Unit*) @list_append (%List* %10, %Unit* %11)
;stmt4:
  ret %Definition* %5
}

define %Definition* @func251 (%Assembly*, %Str, %Type*, %List*) {
;stmt0:
  %5 = call %Definition* (%DefinitionKind, %Str) @func248 (%DefinitionKind 3, %Str %1)
;stmt1:
  %6 = getelementptr inbounds %Definition, %Definition* %5, i1 0, i32 5
  %7 = getelementptr inbounds %DefArray, %DefArray* %6, i1 0, i32 0
  store %Type* %2, %Type** %7, align 8
;stmt2:
  %8 = getelementptr inbounds %Definition, %Definition* %5, i1 0, i32 5
  %9 = getelementptr inbounds %DefArray, %DefArray* %8, i1 0, i32 2
  store %List* %3, %List** %9, align 8
;stmt3:
  %10 = getelementptr inbounds %Assembly, %Assembly* %0, i1 0, i32 5
  %11 = bitcast %Definition* %5 to %Unit*
  %12 = call i1 (%List*, %Unit*) @list_append (%List* %10, %Unit* %11)
;stmt4:
  ret %Definition* %5
}

define %Definition* @func252 (%Assembly*, %Str, %Type*, %Block*) {
;stmt0:
  %5 = call %Definition* (%DefinitionKind, %Str) @func248 (%DefinitionKind 4, %Str %1)
;stmt1:
  %6 = getelementptr inbounds %Definition, %Definition* %5, i1 0, i32 6
  %7 = getelementptr inbounds %DefFunc, %DefFunc* %6, i1 0, i32 0
  store %Type* %2, %Type** %7, align 8
;stmt2:
  %8 = getelementptr inbounds %Definition, %Definition* %5, i1 0, i32 6
  %9 = getelementptr inbounds %DefFunc, %DefFunc* %8, i1 0, i32 1
  store %Block* %3, %Block** %9, align 8
;stmt3:
  %10 = getelementptr inbounds %Assembly, %Assembly* %0, i1 0, i32 8
  %11 = bitcast %Definition* %5 to %Unit*
  %12 = call i1 (%List*, %Unit*) @list_append (%List* %10, %Unit* %11)
;stmt4:
  ret %Definition* %5
}

define %Definition* @func253 (%Assembly*, %Str, %Type*, %Value*) {
;stmt0:
  %5 = call %Definition* (%DefinitionKind, %Str) @func248 (%DefinitionKind 5, %Str %1)
;stmt1:
  %6 = getelementptr inbounds %Definition, %Definition* %5, i1 0, i32 7
  %7 = getelementptr inbounds %DefVar, %DefVar* %6, i1 0, i32 1
  store %Value* %3, %Value** %7, align 8
;stmt2:
  %8 = getelementptr inbounds %Definition, %Definition* %5, i1 0, i32 7
  %9 = getelementptr inbounds %DefVar, %DefVar* %8, i1 0, i32 0
  store %Type* %2, %Type** %9, align 8
;stmt3:
  %10 = getelementptr inbounds %Assembly, %Assembly* %0, i1 0, i32 7
  %11 = bitcast %Definition* %5 to %Unit*
  %12 = call i1 (%List*, %Unit*) @list_append (%List* %10, %Unit* %11)
;stmt4:
  ret %Definition* %5
}

define %Definition* @func254 (%Assembly*, %Str, %Type*, %Str) {
;stmt0:
  %5 = call %Definition* (%DefinitionKind, %Str) @func248 (%DefinitionKind 6, %Str %1)
;stmt1:
  %6 = getelementptr inbounds %Definition, %Definition* %5, i1 0, i32 8
  %7 = getelementptr inbounds %DefAlias, %DefAlias* %6, i1 0, i32 0
  store %Str %1, %Str* %7, align 8
;stmt2:
  %8 = getelementptr inbounds %Definition, %Definition* %5, i1 0, i32 8
  %9 = getelementptr inbounds %DefAlias, %DefAlias* %8, i1 0, i32 1
  store %Type* %2, %Type** %9, align 8
;stmt3:
  %10 = getelementptr inbounds %Definition, %Definition* %5, i1 0, i32 8
  %11 = getelementptr inbounds %DefAlias, %DefAlias* %10, i1 0, i32 2
  store %Str %3, %Str* %11, align 8
;stmt4:
  %12 = getelementptr inbounds %Assembly, %Assembly* %0, i1 0, i32 4
  %13 = bitcast %Definition* %5 to %Unit*
  %14 = call i1 (%List*, %Unit*) @list_append (%List* %12, %Unit* %13)
;stmt5:
  ret %Definition* %5
}

define void @o (%Str) {
;stmt0:
  %2 = load %FILE*, %FILE** @fout
  %3 = bitcast [3 x %Nat8]* @func255_str1 to %Str
  %4 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %2, %Str %3, %Str %0)
  ret void
}

define void @ol (%Str) {
;stmt0:
  %2 = load %FILE*, %FILE** @fout
  %3 = bitcast [4 x %Nat8]* @func256_str1 to %Str
  %4 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %2, %Str %3, %Str %0)
  ret void
}

define void @nl () {
;stmt0:
  %1 = bitcast [2 x %Nat8]* @func257_str1 to %Str
  call void (%Str) @o (%Str %1)
  ret void
}

define void @space () {
;stmt0:
  %1 = bitcast [2 x %Nat8]* @func258_str1 to %Str
  call void (%Str) @o (%Str %1)
  ret void
}

define void @comma () {
;stmt0:
  %1 = bitcast [3 x %Nat8]* @func259_str1 to %Str
  call void (%Str) @o (%Str %1)
  ret void
}

define void @lab_reset (%Nat32) {
;stmt0:
  store %Nat32 %0, %Nat32* @clab, align 4
  ret void
}

define %Nat32 @lab_get () {
;stmt0:
  %1 = load %Nat32, %Nat32* @clab
;stmt1:
  %2 = load %Nat32, %Nat32* @clab
  %3 = add %Nat32 %2, 1
  store %Nat32 %3, %Nat32* @clab, align 4
;stmt2:
  ret %Nat32 %1
}

define void @func263 (%Unit*, %Unit*, %Unit*) {
;stmt0:
  %4 = bitcast %Unit* %0 to %Str
;stmt1:
  %5 = bitcast %Unit* %1 to %Type*
;stmt2:
  %6 = call i1 (%Type*) @func367 (%Type* %5)
  br i1 %6, label %then_0, label %else_0
then_0:
;stmt3:
  %7 = load %FILE*, %FILE** @fout
  %8 = bitcast [17 x %Nat8]* @func262_func263_str1 to %Str
  %9 = getelementptr inbounds %Type, %Type* %5, i1 0, i32 4
  %10 = getelementptr inbounds %TypeNumeric, %TypeNumeric* %9, i1 0, i32 0
  %11 = load %Nat32, %Nat32* %10
  %12 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %7, %Str %8, %Str %4, %Nat32 %11)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  ret void
}

define void @func264 (%Unit*, %Unit*, %Nat32) {
;stmt0:
  %4 = bitcast %Unit* %0 to %Definition*
;stmt1:
  %5 = getelementptr inbounds %Definition, %Definition* %4, i1 0, i32 3
;stmt2:
  %6 = getelementptr inbounds %Definition, %Definition* %4, i1 0, i32 1
  %7 = load %Str, %Str* %6
  %8 = getelementptr inbounds %DefType, %DefType* %5, i1 0, i32 0
  %9 = load %Type*, %Type** %8
  call void (%Str, %Type*) @func270 (%Str %7, %Type* %9)
  ret void
}

define void @func265 (%Unit*, %Unit*, %Nat32) {
;stmt0:
  %4 = bitcast %Unit* %0 to %Definition*
;stmt1:
  %5 = getelementptr inbounds %Definition, %Definition* %4, i1 0, i32 2
;stmt2:
  %6 = getelementptr inbounds %Definition, %Definition* %4, i1 0, i32 1
  %7 = load %Str, %Str* %6
  %8 = getelementptr inbounds %DefStr, %DefStr* %5, i1 0, i32 1
  %9 = load %Nat32, %Nat32* %8
  %10 = getelementptr inbounds %DefStr, %DefStr* %5, i1 0, i32 0
  %11 = load %Str, %Str* %10
  call void (%Str, %Nat32, %Str) @func273 (%Str %7, %Nat32 %9, %Str %11)
  ret void
}

define void @func266 (%Unit*, %Unit*, %Nat32) {
;stmt0:
  %4 = bitcast %Unit* %0 to %Definition*
;stmt1:
  %5 = getelementptr inbounds %Definition, %Definition* %4, i1 0, i32 5
;stmt2:
  %6 = getelementptr inbounds %Definition, %Definition* %4, i1 0, i32 1
  %7 = load %Str, %Str* %6
  %8 = getelementptr inbounds %DefArray, %DefArray* %5, i1 0, i32 0
  %9 = load %Type*, %Type** %8
  %10 = getelementptr inbounds %DefArray, %DefArray* %5, i1 0, i32 2
  %11 = load %List*, %List** %10
  call void (%Str, %Type*, %List*) @func271 (%Str %7, %Type* %9, %List* %11)
  ret void
}

define void @func267 (%Unit*, %Unit*, %Nat32) {
;stmt0:
  %4 = bitcast %Unit* %0 to %Definition*
;stmt1:
  %5 = getelementptr inbounds %Definition, %Definition* %4, i1 0, i32 7
;stmt2:
  %6 = getelementptr inbounds %Definition, %Definition* %4, i1 0, i32 1
  %7 = load %Str, %Str* %6
  %8 = getelementptr inbounds %DefVar, %DefVar* %5, i1 0, i32 0
  %9 = load %Type*, %Type** %8
  %10 = getelementptr inbounds %DefVar, %DefVar* %5, i1 0, i32 1
  %11 = load %Value*, %Value** %10
  call void (%Str, %Type*, %Value*) @func274 (%Str %7, %Type* %9, %Value* %11)
  ret void
}

define void @func268 (%Unit*, %Unit*, %Nat32) {
;stmt0:
  %4 = bitcast %Unit* %0 to %Definition*
;stmt1:
  %5 = getelementptr inbounds %Definition, %Definition* %4, i1 0, i32 6
;stmt2:
  %6 = getelementptr inbounds %Definition, %Definition* %4, i1 0, i32 1
  %7 = load %Str, %Str* %6
  %8 = getelementptr inbounds %DefFunc, %DefFunc* %5, i1 0, i32 0
  %9 = load %Type*, %Type** %8
  %10 = getelementptr inbounds %DefFunc, %DefFunc* %5, i1 0, i32 1
  %11 = load %Block*, %Block** %10
  call void (%Str, %Type*, %Block*) @func275 (%Str %7, %Type* %9, %Block* %11)
  ret void
}

define void @func269 (%Unit*, %Unit*, %Nat32) {
;stmt0:
  %4 = bitcast %Unit* %0 to %Definition*
;stmt1:
  %5 = getelementptr inbounds %Definition, %Definition* %4, i1 0, i32 8
;stmt2:
  %6 = getelementptr inbounds %Definition, %Definition* %4, i1 0, i32 1
  %7 = load %Str, %Str* %6
  %8 = getelementptr inbounds %DefAlias, %DefAlias* %5, i1 0, i32 1
  %9 = load %Type*, %Type** %8
  %10 = getelementptr inbounds %DefAlias, %DefAlias* %5, i1 0, i32 2
  %11 = load %Str, %Str* %10
  call void (%Str, %Type*, %Str) @func277 (%Str %7, %Type* %9, %Str %11)
  ret void
}

define void @func262 (%Assembly*, %Str) {
;stmt0:
  %3 = bitcast [20 x %Nat8]* @func262_str1 to %Str
  %4 = getelementptr inbounds %Assembly, %Assembly* %0, i1 0, i32 0
  %5 = load %Str, %Str* %4
  %6 = call %Int32 (%Str, ...) @printf (%Str %3, %Str %5)
;stmt1:
  %7 = bitcast [2 x %Nat8]* @func262_str2 to %Str
  %8 = call %FILE* (%Str, %Str) @fopen (%Str %1, %Str %7)
  store %FILE* %8, %FILE** @fout, align 8
;stmt2:
  %9 = load %FILE*, %FILE** @fout
  %10 = icmp eq %FILE* %9, zeroinitializer
  br i1 %10, label %then_0, label %else_0
then_0:
;stmt3:
  %11 = bitcast [26 x %Nat8]* @func262_str3 to %Str
  call void (%Str) @fatal (%Str %11)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt4:
  %12 = load %FILE*, %FILE** @fout
  %13 = bitcast [16 x %Nat8]* @func262_str4 to %Str
  %14 = getelementptr inbounds %Assembly, %Assembly* %0, i1 0, i32 0
  %15 = load %Str, %Str* %14
  %16 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %12, %Str %13, %Str %15)
;stmt5:
  %17 = bitcast [27 x %Nat8]* @func262_str5 to %Str
  call void (%Str) @ol (%Str %17)
;stmt6:
  %18 = bitcast [44 x %Nat8]* @func262_str6 to %Str
  call void (%Str) @ol (%Str %18)
;stmt7:
  call void () @nl ()
;stmt8:
  %19 = getelementptr inbounds %Assembly, %Assembly* %0, i1 0, i32 1
  %20 = load %Str, %Str* %19
  %21 = icmp ne %Str %20, zeroinitializer
  br i1 %21, label %then_1, label %else_1
then_1:
;stmt9:
  %22 = load %FILE*, %FILE** @fout
  %23 = bitcast [26 x %Nat8]* @func262_str7 to %Str
  %24 = getelementptr inbounds %Assembly, %Assembly* %0, i1 0, i32 1
  %25 = load %Str, %Str* %24
  %26 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %22, %Str %23, %Str %25)
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt10:
  %27 = getelementptr inbounds %Assembly, %Assembly* %0, i1 0, i32 2
  %28 = load %Str, %Str* %27
  %29 = icmp ne %Str %28, zeroinitializer
  br i1 %29, label %then_2, label %else_2
then_2:
;stmt11:
  %30 = load %FILE*, %FILE** @fout
  %31 = bitcast [22 x %Nat8]* @func262_str8 to %Str
  %32 = getelementptr inbounds %Assembly, %Assembly* %0, i1 0, i32 2
  %33 = load %Str, %Str* %32
  %34 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %30, %Str %31, %Str %33)
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
;stmt12:
  call void () @nl ()
;stmt13:
  %35 = bitcast [16 x %Nat8]* @func262_str9 to %Str
  call void (%Str) @ol (%Str %35)
;stmt14:
  %36 = bitcast [16 x %Nat8]* @func262_str10 to %Str
  call void (%Str) @ol (%Str %36)
;stmt15:
  %37 = bitcast [16 x %Nat8]* @func262_str11 to %Str
  call void (%Str) @ol (%Str %37)
;stmt16:
  %38 = bitcast [20 x %Nat8]* @func262_str12 to %Str
  call void (%Str) @ol (%Str %38)
;stmt17:
  %39 = getelementptr inbounds %Index, %Index* @builtinIndex, i1 0, i32 0
  call void (%List*, %MapForeachHandler, %Unit*) @map_foreach (%List* %39, %MapForeachHandler @func263, %Unit* zeroinitializer)
;stmt18:
  call void () @nl ()
;stmt19:
  %40 = bitcast [11 x %Nat8]* @func262_str13 to %Str
  call void (%Str) @o (%Str %40)
;stmt20:
  %41 = getelementptr inbounds %Assembly, %Assembly* %0, i1 0, i32 3
  call void (%List*, %ListForeachHandler, %Unit*) @func59 (%List* %41, %ListForeachHandler @func264, %Unit* zeroinitializer)
;stmt21:
  %42 = bitcast [13 x %Nat8]* @func262_str14 to %Str
  call void (%Str) @o (%Str %42)
;stmt22:
  %43 = getelementptr inbounds %Assembly, %Assembly* %0, i1 0, i32 6
  call void (%List*, %ListForeachHandler, %Unit*) @func59 (%List* %43, %ListForeachHandler @func265, %Unit* zeroinitializer)
;stmt23:
  %44 = bitcast [12 x %Nat8]* @func262_str15 to %Str
  call void (%Str) @o (%Str %44)
;stmt24:
  %45 = getelementptr inbounds %Assembly, %Assembly* %0, i1 0, i32 5
  call void (%List*, %ListForeachHandler, %Unit*) @func59 (%List* %45, %ListForeachHandler @func266, %Unit* zeroinitializer)
;stmt25:
  %46 = bitcast [10 x %Nat8]* @func262_str16 to %Str
  call void (%Str) @o (%Str %46)
;stmt26:
  %47 = getelementptr inbounds %Assembly, %Assembly* %0, i1 0, i32 7
  call void (%List*, %ListForeachHandler, %Unit*) @func59 (%List* %47, %ListForeachHandler @func267, %Unit* zeroinitializer)
;stmt27:
  %48 = bitcast [11 x %Nat8]* @func262_str17 to %Str
  call void (%Str) @o (%Str %48)
;stmt28:
  %49 = getelementptr inbounds %Assembly, %Assembly* %0, i1 0, i32 8
  call void (%List*, %ListForeachHandler, %Unit*) @func59 (%List* %49, %ListForeachHandler @func268, %Unit* zeroinitializer)
;stmt29:
  %50 = bitcast [13 x %Nat8]* @func262_str18 to %Str
  call void (%Str) @o (%Str %50)
;stmt30:
  %51 = getelementptr inbounds %Assembly, %Assembly* %0, i1 0, i32 4
  call void (%List*, %ListForeachHandler, %Unit*) @func59 (%List* %51, %ListForeachHandler @func269, %Unit* zeroinitializer)
;stmt31:
  %52 = bitcast [14 x %Nat8]* @func262_str19 to %Str
  call void (%Str) @o (%Str %52)
  ret void
}

define void @func270 (%Str, %Type*) {
;stmt0:
  %3 = load %FILE*, %FILE** @fout
  %4 = bitcast [14 x %Nat8]* @func270_str1 to %Str
  %5 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %3, %Str %4, %Str %0)
;stmt1:
  call void (%Type*, i1, i1) @func341 (%Type* %1, i1 0, i1 1)
  ret void
}

define void @func272 (%Unit*, %Unit*, %Nat32) {
;stmt0:
  %4 = icmp ugt %Nat32 %2, 0
  br i1 %4, label %then_0, label %else_0
then_0:
;stmt1:
  call void () @comma ()
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt2:
  %5 = bitcast %Unit* %0 to %Value*
;stmt3:
  %6 = call %LLVM_Value (%Value*) @func285 (%Value* %5)
;stmt4:
  call void (%LLVM_Value) @func327 (%LLVM_Value %6)
  ret void
}

define void @func271 (%Str, %Type*, %List*) {
;stmt0:
  %4 = load %FILE*, %FILE** @fout
  %5 = bitcast [38 x %Nat8]* @func271_str1 to %Str
  %6 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %4, %Str %5, %Str %0)
;stmt1:
  call void (%Type*) @func344 (%Type* %1)
;stmt2:
  %7 = bitcast [3 x %Nat8]* @func271_str2 to %Str
  call void (%Str) @o (%Str %7)
;stmt3:
  call void (%List*, %ListForeachHandler, %Unit*) @func59 (%List* %2, %ListForeachHandler @func272, %Unit* zeroinitializer)
;stmt4:
  %8 = bitcast [12 x %Nat8]* @func271_str3 to %Str
  call void (%Str) @o (%Str %8)
  ret void
}

define void @func273 (%Str, %Nat32, %Str) {
;stmt0:
  %4 = load %FILE*, %FILE** @fout
  %5 = bitcast [50 x %Nat8]* @func273_str1 to %Str
  %6 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %4, %Str %5, %Str %0, %Nat32 %1)
;stmt1:
  %7 = alloca %Nat32
  store %Nat32 0, %Nat32* %7, align 4
;stmt2:
  br label %continue_0
continue_0:
  br i1 1, label %body_0, label %break_0
body_0:
;stmt3:
  %8 = load %Nat32, %Nat32* %7
; eval index uarray
  %9 = getelementptr inbounds %Nat8, %Nat8* %2, %Nat32 %8
  %10 = load %Nat8, %Nat8* %9
;stmt4:
  %11 = load %Nat32, %Nat32* %7
  %12 = add %Nat32 %11, 1
  store %Nat32 %12, %Nat32* %7, align 4
;stmt5:
  %13 = icmp eq %Nat8 %10, 0
  br i1 %13, label %then_0, label %else_0
then_0:
;stmt6:
  br label %break_0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt7:
; index array
  %15 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func273_str2, i1 0, %Int64 0
  %16 = load %Nat8, %Nat8* %15
  %17 = icmp eq %Nat8 %10, %16
; index array
  %18 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func273_str3, i1 0, %Int64 0
  %19 = load %Nat8, %Nat8* %18
  %20 = icmp eq %Nat8 %10, %19
; index array
  %21 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func273_str4, i1 0, %Int64 0
  %22 = load %Nat8, %Nat8* %21
  %23 = icmp eq %Nat8 %10, %22
; index array
  %24 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func273_str5, i1 0, %Int64 0
  %25 = load %Nat8, %Nat8* %24
  %26 = icmp eq %Nat8 %10, %25
; index array
  %27 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func273_str6, i1 0, %Int64 0
  %28 = load %Nat8, %Nat8* %27
  %29 = icmp eq %Nat8 %10, %28
; index array
  %30 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func273_str7, i1 0, %Int64 0
  %31 = load %Nat8, %Nat8* %30
  %32 = icmp eq %Nat8 %10, %31
; index array
  %33 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func273_str8, i1 0, %Int64 0
  %34 = load %Nat8, %Nat8* %33
  %35 = icmp eq %Nat8 %10, %34
; index array
  %36 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func273_str9, i1 0, %Int64 0
  %37 = load %Nat8, %Nat8* %36
  %38 = icmp eq %Nat8 %10, %37
  %39 = or i1 %35, %38
  %40 = or i1 %32, %39
  %41 = or i1 %29, %40
  %42 = or i1 %26, %41
  %43 = or i1 %23, %42
  %44 = or i1 %20, %43
  %45 = or i1 %17, %44
  br i1 %45, label %then_1, label %else_1
then_1:
;stmt8:
  %46 = load %FILE*, %FILE** @fout
  %47 = bitcast [6 x %Nat8]* @func273_str10 to %Str
  %48 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %46, %Str %47, %Nat8 %10)
  br label %endif_1
else_1:
;stmt9:
  %49 = load %FILE*, %FILE** @fout
  %50 = bitcast [3 x %Nat8]* @func273_str11 to %Str
  %51 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %49, %Str %50, %Nat8 %10)
  br label %endif_1
endif_1:
  br label %continue_0
break_0:
;stmt10:
  %52 = load %FILE*, %FILE** @fout
  %53 = bitcast [16 x %Nat8]* @func273_str12 to %Str
  %54 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %52, %Str %53, %Int64 0)
  ret void
}

define void @func274 (%Str, %Type*, %Value*) {
;stmt0:
  %4 = load %FILE*, %FILE** @fout
  %5 = bitcast [15 x %Nat8]* @func274_str1 to %Str
  %6 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %4, %Str %5, %Str %0)
;stmt1:
  call void (%Type*) @func344 (%Type* %1)
;stmt2:
  call void () @space ()
;stmt3:
  %7 = icmp eq %Value* %2, zeroinitializer
  br i1 %7, label %then_0, label %else_0
then_0:
;stmt4:
  %8 = bitcast [16 x %Nat8]* @func274_str2 to %Str
  call void (%Str) @o (%Str %8)
;stmt5:
ret void
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt6:
  %10 = call %LLVM_Value (%Value*) @func285 (%Value* %2)
;stmt7:
  %11 = extractvalue %LLVM_Value %10, 0
  %12 = icmp ne %LLVM_ValueKind %11, 2
  br i1 %12, label %then_1, label %else_1
then_1:
;stmt8:
  %13 = bitcast [29 x %Nat8]* @func274_str3 to %Str
  %14 = getelementptr inbounds %Value, %Value* %2, i1 0, i32 19
  %15 = load %TokenInfo*, %TokenInfo** %14
  call void (%Str, %TokenInfo*) @error (%Str %13, %TokenInfo* %15)
;stmt9:
  %16 = bitcast [16 x %Nat8]* @func274_str4 to %Str
  call void (%Str) @o (%Str %16)
;stmt10:
ret void
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt11:
  call void (%LLVM_Value) @func326 (%LLVM_Value %10)
  ret void
}

define void @func276 (%Unit*, %Unit*, %Nat32) {
;stmt0:
  %4 = bitcast %Unit* %0 to %Decl*
;stmt1:
  %5 = icmp ugt %Nat32 %2, 0
  br i1 %5, label %then_0, label %else_0
then_0:
;stmt2:
  call void () @comma ()
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt3:
  %6 = getelementptr inbounds %Decl, %Decl* %4, i1 0, i32 1
  %7 = load %Type*, %Type** %6
  call void (%Type*) @func344 (%Type* %7)
  ret void
}

define void @func275 (%Str, %Type*, %Block*) {
;stmt0:
  %4 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 5
  %5 = getelementptr inbounds %TypeFunc, %TypeFunc* %4, i1 0, i32 0
  %6 = load %Type*, %Type** %5
  %7 = getelementptr inbounds %Type, %Type* %6, i1 0, i32 9
  %8 = getelementptr inbounds %TypeRecord, %TypeRecord* %7, i1 0, i32 0
  %9 = load %List*, %List** %8
;stmt1:
  %10 = getelementptr inbounds %List, %List* %9, i1 0, i32 2
  %11 = load %Nat64, %Nat64* %10
  %12 = add %Nat64 %11, 1
;stmt2:
  store %Nat32 0, %Nat32* @select_no, align 4
;stmt3:
  %13 = trunc %Nat64 %12 to %Nat32
  call void (%Nat32) @lab_reset (%Nat32 %13)
;stmt4:
  %14 = icmp ne %Type* %1, zeroinitializer
  %15 = bitcast [20 x %Nat8]* @func275_str1 to %Str
  call void (i1, %Str) @assert (i1 %14, %Str %15)
;stmt5:
  %16 = icmp eq %Block* %2, zeroinitializer
  br i1 %16, label %then_0, label %else_0
then_0:
;stmt6:
  %17 = bitcast [9 x %Nat8]* @func275_str2 to %Str
  call void (%Str) @o (%Str %17)
  br label %endif_0
else_0:
;stmt7:
  %18 = bitcast [9 x %Nat8]* @func275_str3 to %Str
  call void (%Str) @o (%Str %18)
  br label %endif_0
endif_0:
;stmt8:
  call void () @space ()
;stmt9:
  %19 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 5
  %20 = getelementptr inbounds %TypeFunc, %TypeFunc* %19, i1 0, i32 1
  %21 = load %Type*, %Type** %20
  %22 = load %Type*, %Type** @typeUnit
  %23 = call i1 (%Type*, %Type*) @func391 (%Type* %21, %Type* %22)
;stmt10:
  br i1 %23, label %then_1, label %else_1
then_1:
;stmt11:
  %24 = bitcast [5 x %Nat8]* @func275_str4 to %Str
  call void (%Str) @o (%Str %24)
  br label %endif_1
else_1:
;stmt12:
  %25 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 5
  %26 = getelementptr inbounds %TypeFunc, %TypeFunc* %25, i1 0, i32 1
  %27 = load %Type*, %Type** %26
  call void (%Type*) @func344 (%Type* %27)
  br label %endif_1
endif_1:
;stmt13:
  %28 = load %FILE*, %FILE** @fout
  %29 = bitcast [7 x %Nat8]* @func275_str5 to %Str
  %30 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %28, %Str %29, %Str %0)
;stmt14:
  call void (%List*, %ListForeachHandler, %Unit*) @func59 (%List* %9, %ListForeachHandler @func276, %Unit* zeroinitializer)
;stmt15:
  %31 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 5
  %32 = getelementptr inbounds %TypeFunc, %TypeFunc* %31, i1 0, i32 2
  %33 = load i1, i1* %32
  br i1 %33, label %then_2, label %else_2
then_2:
;stmt16:
  %34 = bitcast [6 x %Nat8]* @func275_str6 to %Str
  call void (%Str) @o (%Str %34)
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
;stmt17:
  %35 = bitcast [2 x %Nat8]* @func275_str7 to %Str
  call void (%Str) @o (%Str %35)
;stmt18:
  %36 = icmp ne %Block* %2, zeroinitializer
  br i1 %36, label %then_3, label %else_3
then_3:
  br label %endif_3
else_3:
  br label %endif_3
endif_3:
;stmt19:
  %37 = icmp ne %Block* %2, zeroinitializer
  br i1 %37, label %then_4, label %else_4
then_4:
;stmt20:
  %38 = bitcast [3 x %Nat8]* @func275_str8 to %Str
  call void (%Str) @o (%Str %38)
;stmt21:
  store %Nat32 0, %Nat32* @global_if_id, align 4
;stmt22:
  store %Nat32 0, %Nat32* @global_while_id, align 4
;stmt23:
  store %Nat32 0, %Nat32* @while_id, align 4
;stmt24:
  store %Nat32 0, %Nat32* @stmtno, align 4
;stmt25:
  store %Nat32 0, %Nat32* @blockno, align 4
;stmt26:
  call void (%Block*) @func339 (%Block* %2)
;stmt27:
  br i1 %23, label %then_5, label %else_5
then_5:
;stmt28:
  %39 = bitcast [12 x %Nat8]* @func275_str9 to %Str
  call void (%Str) @o (%Str %39)
  br label %endif_5
else_5:
  br label %endif_5
endif_5:
;stmt29:
  %40 = bitcast [3 x %Nat8]* @func275_str10 to %Str
  call void (%Str) @o (%Str %40)
  br label %endif_4
else_4:
  br label %endif_4
endif_4:
  ret void
}

define void @func277 (%Str, %Type*, %Str) {
;stmt0:
  %4 = load %FILE*, %FILE** @fout
  %5 = bitcast [14 x %Nat8]* @func277_str1 to %Str
  %6 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %4, %Str %5, %Str %0)
;stmt1:
  call void (%Type*, i1, i1) @func341 (%Type* %1, i1 0, i1 0)
;stmt2:
  call void () @comma ()
;stmt3:
  call void (%Type*, i1, i1) @func341 (%Type* %1, i1 0, i1 0)
;stmt4:
  %7 = load %FILE*, %FILE** @fout
  %8 = bitcast [6 x %Nat8]* @func277_str2 to %Str
  %9 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %7, %Str %8, %Str %2)
  ret void
}

define %LLVM_Value @llval_create (%LLVM_ValueKind, %Type*, %Int64) {
;stmt0:
  %4 = alloca %LLVM_Value
  store %LLVM_Value zeroinitializer, %LLVM_Value* %4, align 8
;stmt1:
  %5 = getelementptr inbounds %LLVM_Value, %LLVM_Value* %4, i1 0, i32 1
  store %Type* %1, %Type** %5, align 8
;stmt2:
  %6 = getelementptr inbounds %LLVM_Value, %LLVM_Value* %4, i1 0, i32 0
  store %LLVM_ValueKind %0, %LLVM_ValueKind* %6, align 2
;stmt3:
  %7 = getelementptr inbounds %LLVM_Value, %LLVM_Value* %4, i1 0, i32 4
  %8 = trunc %Int64 %2 to %Nat32
  store %Nat32 %8, %Nat32* %7, align 4
;stmt4:
  %9 = getelementptr inbounds %LLVM_Value, %LLVM_Value* %4, i1 0, i32 3
  store %Str zeroinitializer, %Str* %9, align 8
;stmt5:
  %10 = getelementptr inbounds %LLVM_Value, %LLVM_Value* %4, i1 0, i32 2
  store %Int64 %2, %Int64* %10, align 8
;stmt6:
  %11 = load %LLVM_Value, %LLVM_Value* %4
  ret %LLVM_Value %11
}

define %LLVM_Value @llval_create_id (%LLVM_ValueKind, %Type*, %Str) {
;stmt0:
  %4 = alloca %LLVM_Value
  store %LLVM_Value zeroinitializer, %LLVM_Value* %4, align 8
;stmt1:
  %5 = getelementptr inbounds %LLVM_Value, %LLVM_Value* %4, i1 0, i32 1
  store %Type* %1, %Type** %5, align 8
;stmt2:
  %6 = getelementptr inbounds %LLVM_Value, %LLVM_Value* %4, i1 0, i32 0
  store %LLVM_ValueKind %0, %LLVM_ValueKind* %6, align 2
;stmt3:
  %7 = getelementptr inbounds %LLVM_Value, %LLVM_Value* %4, i1 0, i32 3
  store %Str %2, %Str* %7, align 8
;stmt4:
  %8 = load %LLVM_Value, %LLVM_Value* %4
  ret %LLVM_Value %8
}

define %LLVM_Value @llval_create_reg (%Type*, %Nat32) {
;stmt0:
  %3 = alloca %LLVM_Value
  store %LLVM_Value zeroinitializer, %LLVM_Value* %3, align 8
;stmt1:
  %4 = getelementptr inbounds %LLVM_Value, %LLVM_Value* %3, i1 0, i32 0
  store %LLVM_ValueKind 7, %LLVM_ValueKind* %4, align 2
;stmt2:
  %5 = getelementptr inbounds %LLVM_Value, %LLVM_Value* %3, i1 0, i32 1
  store %Type* %0, %Type** %5, align 8
;stmt3:
  %6 = getelementptr inbounds %LLVM_Value, %LLVM_Value* %3, i1 0, i32 4
  store %Nat32 %1, %Nat32* %6, align 4
;stmt4:
  %7 = load %LLVM_Value, %LLVM_Value* %3
  ret %LLVM_Value %7
}

define %LLVM_Value @llval_create_adr (%Type*, %Nat32) {
;stmt0:
  %3 = alloca %LLVM_Value
  store %LLVM_Value zeroinitializer, %LLVM_Value* %3, align 8
;stmt1:
  %4 = getelementptr inbounds %LLVM_Value, %LLVM_Value* %3, i1 0, i32 0
  store %LLVM_ValueKind 6, %LLVM_ValueKind* %4, align 2
;stmt2:
  %5 = getelementptr inbounds %LLVM_Value, %LLVM_Value* %3, i1 0, i32 1
  store %Type* %0, %Type** %5, align 8
;stmt3:
  %6 = getelementptr inbounds %LLVM_Value, %LLVM_Value* %3, i1 0, i32 4
  store %Nat32 %1, %Nat32* %6, align 4
;stmt4:
  %7 = load %LLVM_Value, %LLVM_Value* %3
  ret %LLVM_Value %7
}

define %Nat32 @func282 (%Str, %Type*) {
;stmt0:
  %3 = call %Nat32 () @lab_get ()
;stmt1:
  %4 = load %FILE*, %FILE** @fout
  %5 = bitcast [14 x %Nat8]* @func282_str1 to %Str
  %6 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %4, %Str %5, %Nat32 %3, %Str %0)
;stmt2:
  call void (%Type*) @func344 (%Type* %1)
;stmt3:
  ret %Nat32 %3
}

define %Nat32 @func283 (%Type*, %LLVM_Value) {
;stmt0:
  %3 = bitcast [23 x %Nat8]* @func283_str1 to %Str
  %4 = call %Nat32 (%Str, %Type*) @func282 (%Str %3, %Type* %0)
;stmt1:
  call void () @comma ()
;stmt2:
  call void (%Type*) @func344 (%Type* %0)
;stmt3:
  %5 = bitcast [3 x %Nat8]* @func283_str2 to %Str
  call void (%Str) @o (%Str %5)
;stmt4:
  call void (%LLVM_Value) @func326 (%LLVM_Value %1)
;stmt5:
  call void () @comma ()
;stmt6:
  ret %Nat32 %4
}

define %Nat32 @func284 (%Type*, %LLVM_Value, %Nat32) {
;stmt0:
  %4 = bitcast [13 x %Nat8]* @func284_str1 to %Str
  %5 = call %Nat32 (%Str, %Type*) @func282 (%Str %4, %Type* %0)
;stmt1:
  call void () @space ()
;stmt2:
  call void (%LLVM_Value) @func326 (%LLVM_Value %1)
;stmt3:
  %6 = load %FILE*, %FILE** @fout
  %7 = bitcast [5 x %Nat8]* @func284_str2 to %Str
  %8 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %6, %Str %7, %Nat32 %2)
;stmt4:
  ret %Nat32 %5
}

define %LLVM_Value @func286 (%Value*) {
;stmt0:
  %2 = bitcast [28 x %Nat8]* @func285_func286_str1 to %Str
  call void (%Str) @fatal (%Str %2)
;stmt1:
  %3 = call %LLVM_Value (%LLVM_ValueKind, %Type*, %Int64) @llval_create (%LLVM_ValueKind 0, %Type* zeroinitializer, %Int64 0)
  ret %LLVM_Value %3
}

define %LLVM_Value @func285 (%Value*) {
;stmt0:
  %2 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 0
  %3 = load %ValueKind, %ValueKind* %2
  br label %select_1_0
select_1_0:
  %4 = icmp eq %ValueKind %3, 3
  br i1 %4, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %5 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 1
  %6 = load %Type*, %Type** %5
  %7 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 2
  %8 = load %Int64, %Int64* %7
  %9 = call %LLVM_Value (%LLVM_ValueKind, %Type*, %Int64) @llval_create (%LLVM_ValueKind 2, %Type* %6, %Int64 %8)
  br label %select_1_end
select_1_1:
  %10 = icmp eq %ValueKind %3, 4
  br i1 %10, label %select_1_1_ok, label %select_1_2
select_1_1_ok:
  %11 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 1
  %12 = load %Type*, %Type** %11
  %13 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 4
  %14 = load %Definition*, %Definition** %13
  %15 = getelementptr inbounds %Definition, %Definition* %14, i1 0, i32 1
  %16 = load %Str, %Str* %15
  %17 = call %LLVM_Value (%LLVM_ValueKind, %Type*, %Str) @llval_create_id (%LLVM_ValueKind 3, %Type* %12, %Str %16)
  br label %select_1_end
select_1_2:
  %18 = icmp eq %ValueKind %3, 5
  br i1 %18, label %select_1_2_ok, label %select_1_3
select_1_2_ok:
  %19 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 1
  %20 = load %Type*, %Type** %19
  %21 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 4
  %22 = load %Definition*, %Definition** %21
  %23 = getelementptr inbounds %Definition, %Definition* %22, i1 0, i32 1
  %24 = load %Str, %Str* %23
  %25 = call %LLVM_Value (%LLVM_ValueKind, %Type*, %Str) @llval_create_id (%LLVM_ValueKind 5, %Type* %20, %Str %24)
  br label %select_1_end
select_1_3:
  %26 = icmp eq %ValueKind %3, 7
  br i1 %26, label %select_1_3_ok, label %select_1_4
select_1_3_ok:
  %27 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 1
  %28 = load %Type*, %Type** %27
  %29 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 7
  %30 = load %Expr*, %Expr** %29
  %31 = getelementptr inbounds %Expr, %Expr* %30, i1 0, i32 1
  %32 = load %Nat32, %Nat32* %31
  %33 = call %LLVM_Value (%Type*, %Nat32) @llval_create_reg (%Type* %28, %Nat32 %32)
  br label %select_1_end
select_1_4:
  %34 = icmp eq %ValueKind %3, 8
  br i1 %34, label %select_1_4_ok, label %select_1_5
select_1_4_ok:
  %35 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 1
  %36 = load %Type*, %Type** %35
  %37 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 5
  %38 = load %Decl*, %Decl** %37
  %39 = getelementptr inbounds %Decl, %Decl* %38, i1 0, i32 4
  %40 = load %Nat32, %Nat32* %39
  %41 = sext %Nat32 %40 to %Int64
  %42 = call %LLVM_Value (%LLVM_ValueKind, %Type*, %Int64) @llval_create (%LLVM_ValueKind 4, %Type* %36, %Int64 %41)
  br label %select_1_end
select_1_5:
  %43 = icmp eq %ValueKind %3, 6
  br i1 %43, label %select_1_5_ok, label %select_1_6
select_1_5_ok:
  %44 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 1
  %45 = load %Type*, %Type** %44
  %46 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 6
  %47 = load %Decl*, %Decl** %46
  %48 = getelementptr inbounds %Decl, %Decl* %47, i1 0, i32 3
  %49 = load %Nat16, %Nat16* %48
  %50 = zext %Nat16 %49 to %Nat32
  %51 = call %LLVM_Value (%Type*, %Nat32) @llval_create_reg (%Type* %45, %Nat32 %50)
  br label %select_1_end
select_1_6:
  %52 = icmp eq %ValueKind %3, 28
  br i1 %52, label %select_1_6_ok, label %select_1_7
select_1_6_ok:
  %53 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 16
  %54 = load %Value*, %Value** %53
  %55 = call %LLVM_Value (%Value*) @func285 (%Value* %54)
  %56 = call %LLVM_Value (%LLVM_Value) @func324 (%LLVM_Value %55)
  br label %select_1_end
select_1_7:
  %57 = icmp eq %ValueKind %3, 31
  br i1 %57, label %select_1_7_ok, label %select_1_8
select_1_7_ok:
  %58 = call %LLVM_Value (%Value*) @func287 (%Value* %0)
  br label %select_1_end
select_1_8:
  %59 = icmp eq %ValueKind %3, 32
  br i1 %59, label %select_1_8_ok, label %select_1_9
select_1_8_ok:
  %60 = call %LLVM_Value (%Value*) @func290 (%Value* %0)
  br label %select_1_end
select_1_9:
  %61 = icmp eq %ValueKind %3, 33
  br i1 %61, label %select_1_9_ok, label %select_1_10
select_1_9_ok:
  %62 = call %LLVM_Value (%Value*) @func292 (%Value* %0)
  br label %select_1_end
select_1_10:
  %63 = icmp eq %ValueKind %3, 9
  br i1 %63, label %select_1_10_ok, label %select_1_11
select_1_10_ok:
  %64 = call %LLVM_Value (%Value*) @func293 (%Value* %0)
  br label %select_1_end
select_1_11:
  %65 = icmp eq %ValueKind %3, 10
  br i1 %65, label %select_1_11_ok, label %select_1_12
select_1_11_ok:
  %66 = call %LLVM_Value (%Value*) @func294 (%Value* %0)
  br label %select_1_end
select_1_12:
  %67 = icmp eq %ValueKind %3, 12
  br i1 %67, label %select_1_12_ok, label %select_1_13
select_1_12_ok:
  %68 = call %LLVM_Value (%Value*) @func296 (%Value* %0)
  br label %select_1_end
select_1_13:
  %69 = icmp eq %ValueKind %3, 13
  br i1 %69, label %select_1_13_ok, label %select_1_14
select_1_13_ok:
  %70 = call %LLVM_Value (%Value*) @func297 (%Value* %0)
  br label %select_1_end
select_1_14:
  %71 = icmp eq %ValueKind %3, 11
  br i1 %71, label %select_1_14_ok, label %select_1_15
select_1_14_ok:
  %72 = call %LLVM_Value (%Value*) @func295 (%Value* %0)
  br label %select_1_end
select_1_15:
  %73 = icmp eq %ValueKind %3, 34
  br i1 %73, label %select_1_15_ok, label %select_1_16
select_1_15_ok:
  %74 = call %LLVM_Value (%Value*) @func306 (%Value* %0)
  br label %select_1_end
select_1_16:
  %75 = icmp eq %ValueKind %3, 35
  br i1 %75, label %select_1_16_ok, label %select_1_17
select_1_16_ok:
  %76 = call %LLVM_Value (%Value*) @func320 (%Value* %0)
  br label %select_1_end
select_1_17:
  %77 = icmp eq %ValueKind %3, 2
  br i1 %77, label %select_1_17_ok, label %select_1_18
select_1_17_ok:
  %78 = call %LLVM_Value (%Value*) @func286 (%Value* %0)
  br label %select_1_end
select_1_18:
  %79 = call %LLVM_Value (%Value*) @func309 (%Value* %0)
  br label %select_1_end
select_1_end:
  %80 = phi %LLVM_Value [ %9, %select_1_0_ok ], [ %17, %select_1_1_ok ], [ %25, %select_1_2_ok ], [ %33, %select_1_3_ok ], [ %42, %select_1_4_ok ], [ %51, %select_1_5_ok ], [ %56, %select_1_6_ok ], [ %58, %select_1_7_ok ], [ %60, %select_1_8_ok ], [ %62, %select_1_9_ok ], [ %64, %select_1_10_ok ], [ %66, %select_1_11_ok ], [ %68, %select_1_12_ok ], [ %70, %select_1_13_ok ], [ %72, %select_1_14_ok ], [ %74, %select_1_15_ok ], [ %76, %select_1_16_ok ], [ %78, %select_1_17_ok ], [ %79, %select_1_18 ]
  ret %LLVM_Value %80
}

define void @func288 (%Unit*, %Unit*, %Nat32) {
;stmt0:
  %4 = bitcast %Unit* %0 to %Value*
;stmt1:
  %5 = bitcast %Unit* %1 to %func287.type1*
;stmt2:
  %6 = getelementptr inbounds %func287.type1, %func287.type1* %5, i1 0, i32 0
  %7 = getelementptr inbounds %func287.type1, %func287.type1* %5, i1 0, i32 1
  %8 = load %Nat16, %Nat16* %7
; index array
  %9 = getelementptr inbounds [64 x %LLVM_Value], [64 x %LLVM_Value]* %6, i1 0, %Nat16 %8
  %10 = call %LLVM_Value (%Value*) @func285 (%Value* %4)
  store %LLVM_Value %10, %LLVM_Value* %9, align 8
;stmt3:
  %11 = getelementptr inbounds %func287.type1, %func287.type1* %5, i1 0, i32 1
  %12 = getelementptr inbounds %func287.type1, %func287.type1* %5, i1 0, i32 1
  %13 = load %Nat16, %Nat16* %12
  %14 = add %Nat16 %13, 1
  store %Nat16 %14, %Nat16* %11, align 2
  ret void
}

define %LLVM_Value @func287 (%Value*) {
;stmt0:
  %2 = alloca %func287.type1
  store %func287.type1 zeroinitializer, %func287.type1* %2, align 8
;stmt1:
  %3 = getelementptr inbounds %func287.type1, %func287.type1* %2, i1 0, i32 1
  store %Nat16 0, %Nat16* %3, align 2
;stmt2:
  %4 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 13
  %5 = getelementptr inbounds %ValueCall, %ValueCall* %4, i1 0, i32 1
  %6 = load %List*, %List** %5
  %7 = getelementptr inbounds %func287.type1, %func287.type1* %2, i1 0
  %8 = bitcast %func287.type1* %7 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @func59 (%List* %6, %ListForeachHandler @func288, %Unit* %8)
;stmt3:
  %9 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 13
  %10 = getelementptr inbounds %ValueCall, %ValueCall* %9, i1 0, i32 0
  %11 = load %Value*, %Value** %10
  %12 = call %LLVM_Value (%Value*) @func285 (%Value* %11)
;stmt4:
  %13 = bitcast [4 x %Nat8]* @func287_str1 to %Str
  call void (%Str) @o (%Str %13)
;stmt5:
  %14 = alloca %Nat32
  store %Nat32 0, %Nat32* %14, align 4
;stmt6:
  %15 = extractvalue %LLVM_Value %12, 1
  %16 = getelementptr inbounds %Type, %Type* %15, i1 0, i32 5
  %17 = getelementptr inbounds %TypeFunc, %TypeFunc* %16, i1 0, i32 1
  %18 = load %Type*, %Type** %17
  %19 = load %Type*, %Type** @typeUnit
  %20 = call i1 (%Type*, %Type*) @func391 (%Type* %18, %Type* %19)
  %21 = xor i1 %20, 1
  br i1 %21, label %then_0, label %else_0
then_0:
;stmt7:
  %22 = call %Nat32 () @lab_get ()
  store %Nat32 %22, %Nat32* %14, align 4
;stmt8:
  %23 = load %FILE*, %FILE** @fout
  %24 = bitcast [8 x %Nat8]* @func287_str2 to %Str
  %25 = load %Nat32, %Nat32* %14
  %26 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %23, %Str %24, %Nat32 %25)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt9:
  %27 = bitcast [6 x %Nat8]* @func287_str3 to %Str
  call void (%Str) @o (%Str %27)
;stmt10:
  %28 = extractvalue %LLVM_Value %12, 1
  call void (%Type*, i1, i1) @func341 (%Type* %28, i1 0, i1 0)
;stmt11:
  call void () @space ()
;stmt12:
  call void (%LLVM_Value) @func326 (%LLVM_Value %12)
;stmt13:
  %29 = bitcast [3 x %Nat8]* @func287_str4 to %Str
  call void (%Str) @o (%Str %29)
;stmt14:
  %30 = alloca %Nat16
  store %Nat16 0, %Nat16* %30, align 2
;stmt15:
  br label %continue_0
continue_0:
  %31 = load %Nat16, %Nat16* %30
  %32 = getelementptr inbounds %func287.type1, %func287.type1* %2, i1 0, i32 1
  %33 = load %Nat16, %Nat16* %32
  %34 = icmp ult %Nat16 %31, %33
  br i1 %34, label %body_0, label %break_0
body_0:
;stmt16:
  %35 = load %Nat16, %Nat16* %30
  %36 = icmp ugt %Nat16 %35, 0
  br i1 %36, label %then_1, label %else_1
then_1:
;stmt17:
  call void () @comma ()
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt18:
  %37 = getelementptr inbounds %func287.type1, %func287.type1* %2, i1 0, i32 0
  %38 = load %Nat16, %Nat16* %30
; index array
  %39 = getelementptr inbounds [64 x %LLVM_Value], [64 x %LLVM_Value]* %37, i1 0, %Nat16 %38
  %40 = load %LLVM_Value, %LLVM_Value* %39
  call void (%LLVM_Value) @func327 (%LLVM_Value %40)
;stmt19:
  %41 = load %Nat16, %Nat16* %30
  %42 = add %Nat16 %41, 1
  store %Nat16 %42, %Nat16* %30, align 2
  br label %continue_0
break_0:
;stmt20:
  %43 = bitcast [2 x %Nat8]* @func287_str5 to %Str
  call void (%Str) @o (%Str %43)
;stmt21:
  %44 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 1
  %45 = load %Type*, %Type** %44
  %46 = load %Nat32, %Nat32* %14
  %47 = call %LLVM_Value (%Type*, %Nat32) @llval_create_reg (%Type* %45, %Nat32 %46)
  ret %LLVM_Value %47
}

define %LLVM_Value @eval_index_uarray (%LLVM_Value, %LLVM_Value) {
;stmt0:
  %3 = bitcast [21 x %Nat8]* @func289_str1 to %Str
  call void (%Str) @o (%Str %3)
;stmt1:
  %4 = extractvalue %LLVM_Value %0, 1
  %5 = getelementptr inbounds %Type, %Type* %4, i1 0, i32 8
  %6 = getelementptr inbounds %TypeArrayU, %TypeArrayU* %5, i1 0, i32 0
  %7 = load %Type*, %Type** %6
;stmt2:
  %8 = call %Nat32 (%Type*, %LLVM_Value) @func283 (%Type* %7, %LLVM_Value %0)
;stmt3:
  call void (%LLVM_Value) @func327 (%LLVM_Value %1)
;stmt4:
  %9 = call %LLVM_Value (%Type*, %Nat32) @llval_create_adr (%Type* %7, %Nat32 %8)
  ret %LLVM_Value %9
}

define %LLVM_Value @func291 (%LLVM_Value, %LLVM_Value) {
;stmt0:
  %3 = bitcast [15 x %Nat8]* @func290_func291_str1 to %Str
  call void (%Str) @o (%Str %3)
;stmt1:
  %4 = extractvalue %LLVM_Value %0, 1
  %5 = getelementptr inbounds %Type, %Type* %4, i1 0, i32 0
  %6 = load %TypeKind, %TypeKind* %5
  br label %select_1_0
select_1_0:
  %7 = icmp eq %TypeKind %6, 11
  br i1 %7, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %8 = extractvalue %LLVM_Value %0, 1
  br label %select_1_end
select_1_1:
  %9 = extractvalue %LLVM_Value %0, 1
  %10 = getelementptr inbounds %Type, %Type* %9, i1 0, i32 6
  %11 = getelementptr inbounds %TypePointer, %TypePointer* %10, i1 0, i32 0
  %12 = load %Type*, %Type** %11
  br label %select_1_end
select_1_end:
  %13 = phi %Type* [ %8, %select_1_0_ok ], [ %12, %select_1_1 ]
;stmt2:
  %14 = call %Nat32 (%Type*, %LLVM_Value) @func283 (%Type* %13, %LLVM_Value %0)
;stmt3:
  %15 = bitcast [7 x %Nat8]* @func290_func291_str2 to %Str
  call void (%Str) @o (%Str %15)
;stmt4:
  call void (%LLVM_Value) @func327 (%LLVM_Value %1)
;stmt5:
  %16 = getelementptr inbounds %Type, %Type* %13, i1 0, i32 7
  %17 = getelementptr inbounds %TypeArray, %TypeArray* %16, i1 0, i32 0
  %18 = load %Type*, %Type** %17
;stmt6:
  %19 = call %LLVM_Value (%Type*, %Nat32) @llval_create_adr (%Type* %18, %Nat32 %14)
  ret %LLVM_Value %19
}

define %LLVM_Value @func290 (%Value*) {
;stmt0:
  %2 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 10
  %3 = getelementptr inbounds %ValueIndex, %ValueIndex* %2, i1 0, i32 0
  %4 = load %Value*, %Value** %3
  %5 = call %LLVM_Value (%Value*) @func285 (%Value* %4)
;stmt1:
  %6 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 10
  %7 = getelementptr inbounds %ValueIndex, %ValueIndex* %6, i1 0, i32 1
  %8 = load %Value*, %Value** %7
  %9 = call %LLVM_Value (%Value*) @func285 (%Value* %8)
;stmt2:
  %10 = extractvalue %LLVM_Value %5, 1
  %11 = call i1 (%Type*) @func365 (%Type* %10)
  br i1 %11, label %then_0, label %else_0
then_0:
;stmt3:
  %12 = call %LLVM_Value (%LLVM_Value, %LLVM_Value) @eval_index_uarray (%LLVM_Value %5, %LLVM_Value %9)
  ret %LLVM_Value %12
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt4:
  %14 = extractvalue %LLVM_Value %5, 0
  %15 = icmp eq %LLVM_ValueKind %14, 7
  %16 = extractvalue %LLVM_Value %5, 1
  %17 = call i1 (%Type*) @func363 (%Type* %16)
  %18 = and i1 %15, %17
;stmt5:
  %19 = and i1 %18, 1
  br i1 %19, label %then_1, label %else_1
then_1:
;stmt6:
  %20 = extractvalue %LLVM_Value %5, 1
  %21 = extractvalue %LLVM_Value %9, 2
  %22 = trunc %Int64 %21 to %Nat32
  %23 = call %Nat32 (%Type*, %LLVM_Value, %Nat32) @func284 (%Type* %20, %LLVM_Value %5, %Nat32 %22)
;stmt7:
  %24 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 1
  %25 = load %Type*, %Type** %24
  %26 = call %LLVM_Value (%Type*, %Nat32) @llval_create_reg (%Type* %25, %Nat32 %23)
  ret %LLVM_Value %26
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt8:
  %28 = call %LLVM_Value (%LLVM_Value, %LLVM_Value) @func291 (%LLVM_Value %5, %LLVM_Value %9)
  ret %LLVM_Value %28
}

define %LLVM_Value @func292 (%Value*) {
;stmt0:
  %2 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 11
  %3 = getelementptr inbounds %ValueAccess, %ValueAccess* %2, i1 0, i32 1
  %4 = load %Str, %Str* %3
  %5 = icmp ne %Str %4, zeroinitializer
  %6 = bitcast [29 x %Nat8]* @func292_str1 to %Str
  call void (i1, %Str) @assert (i1 %5, %Str %6)
;stmt1:
  %7 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 11
  %8 = getelementptr inbounds %ValueAccess, %ValueAccess* %7, i1 0, i32 0
  %9 = load %Value*, %Value** %8
  %10 = getelementptr inbounds %Value, %Value* %9, i1 0, i32 0
  %11 = load %ValueKind, %ValueKind* %10
  %12 = icmp eq %ValueKind %11, 33
  br i1 %12, label %then_0, label %else_0
then_0:
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt2:
  %13 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 11
  %14 = getelementptr inbounds %ValueAccess, %ValueAccess* %13, i1 0, i32 0
  %15 = load %Value*, %Value** %14
  %16 = call %LLVM_Value (%Value*) @func285 (%Value* %15)
;stmt3:
  %17 = extractvalue %LLVM_Value %16, 1
  %18 = getelementptr inbounds %Type, %Type* %17, i1 0, i32 0
  %19 = load %TypeKind, %TypeKind* %18
  %20 = icmp eq %TypeKind %19, 10
;stmt4:
  br label %select_1_0
select_1_0:
  %21 = icmp eq i1 %20, 1
  br i1 %21, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %22 = extractvalue %LLVM_Value %16, 1
  %23 = getelementptr inbounds %Type, %Type* %22, i1 0, i32 6
  %24 = getelementptr inbounds %TypePointer, %TypePointer* %23, i1 0, i32 0
  %25 = load %Type*, %Type** %24
  br label %select_1_end
select_1_1:
  %26 = extractvalue %LLVM_Value %16, 1
  br label %select_1_end
select_1_end:
  %27 = phi %Type* [ %25, %select_1_0_ok ], [ %26, %select_1_1 ]
;stmt5:
  %28 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 11
  %29 = getelementptr inbounds %ValueAccess, %ValueAccess* %28, i1 0, i32 1
  %30 = load %Str, %Str* %29
  %31 = call %Decl* (%Type*, %Str) @func360 (%Type* %27, %Str %30)
;stmt6:
  %32 = getelementptr inbounds %Decl, %Decl* %31, i1 0, i32 3
  %33 = load %Nat16, %Nat16* %32
;stmt7:
  %34 = xor i1 %20, 1
  br i1 %34, label %then_1, label %else_1
then_1:
;stmt8:
  %35 = extractvalue %LLVM_Value %16, 0
  %36 = icmp eq %LLVM_ValueKind %35, 7
  br i1 %36, label %then_2, label %else_2
then_2:
;stmt9:
  %37 = zext %Nat16 %33 to %Nat32
  %38 = call %Nat32 (%Type*, %LLVM_Value, %Nat32) @func284 (%Type* %27, %LLVM_Value %16, %Nat32 %37)
;stmt10:
  %39 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 1
  %40 = load %Type*, %Type** %39
  %41 = call %LLVM_Value (%Type*, %Nat32) @llval_create_reg (%Type* %40, %Nat32 %38)
  ret %LLVM_Value %41
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt11:
  br label %select_2_0
select_2_0:
  %43 = icmp eq i1 %20, 1
  br i1 %43, label %select_2_0_ok, label %select_2_1
select_2_0_ok:
  %44 = call %LLVM_Value (%LLVM_Value) @func324 (%LLVM_Value %16)
  br label %select_2_end
select_2_1:
  br label %select_2_end
select_2_end:
  %45 = phi %LLVM_Value [ %44, %select_2_0_ok ], [ %16, %select_2_1 ]
;stmt12:
  %46 = call %Nat32 (%Type*, %LLVM_Value) @func283 (%Type* %27, %LLVM_Value %45)
;stmt13:
  %47 = load %FILE*, %FILE** @fout
  %48 = bitcast [13 x %Nat8]* @func292_str2 to %Str
  %49 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %47, %Str %48, %Nat16 %33)
;stmt14:
  %50 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 1
  %51 = load %Type*, %Type** %50
  %52 = call %LLVM_Value (%Type*, %Nat32) @llval_create_adr (%Type* %51, %Nat32 %46)
  ret %LLVM_Value %52
}

define %LLVM_Value @func293 (%Value*) {
;stmt0:
  %2 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 8
  %3 = getelementptr inbounds %ValueUn, %ValueUn* %2, i1 0, i32 0
  %4 = load %Value*, %Value** %3
  %5 = call %LLVM_Value (%Value*) @func285 (%Value* %4)
;stmt1:
  %6 = extractvalue %LLVM_Value %5, 0
  %7 = icmp eq %LLVM_ValueKind %6, 6
  br i1 %7, label %then_0, label %else_0
then_0:
;stmt2:
  %8 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 1
  %9 = load %Type*, %Type** %8
  %10 = extractvalue %LLVM_Value %5, 4
  %11 = call %LLVM_Value (%Type*, %Nat32) @llval_create_reg (%Type* %9, %Nat32 %10)
  ret %LLVM_Value %11
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt3:
  %13 = extractvalue %LLVM_Value %5, 1
  %14 = call %Nat32 (%Type*, %LLVM_Value) @func283 (%Type* %13, %LLVM_Value %5)
;stmt4:
  %15 = bitcast [5 x %Nat8]* @func293_str1 to %Str
  call void (%Str) @o (%Str %15)
;stmt5:
  %16 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 1
  %17 = load %Type*, %Type** %16
  %18 = call %LLVM_Value (%Type*, %Nat32) @llval_create_reg (%Type* %17, %Nat32 %14)
  ret %LLVM_Value %18
}

define %LLVM_Value @func294 (%Value*) {
;stmt0:
  %2 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 8
  %3 = getelementptr inbounds %ValueUn, %ValueUn* %2, i1 0, i32 0
  %4 = load %Value*, %Value** %3
  %5 = call %LLVM_Value (%Value*) @func285 (%Value* %4)
;stmt1:
  %6 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 1
  %7 = load %Type*, %Type** %6
  %8 = extractvalue %LLVM_Value %5, 4
  %9 = call %LLVM_Value (%Type*, %Nat32) @llval_create_adr (%Type* %7, %Nat32 %8)
  ret %LLVM_Value %9
}

define %LLVM_Value @func295 (%Value*) {
;stmt0:
  %2 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 8
  %3 = getelementptr inbounds %ValueUn, %ValueUn* %2, i1 0, i32 0
  %4 = load %Value*, %Value** %3
  %5 = call %LLVM_Value (%Value*) @func285 (%Value* %4)
;stmt1:
  %6 = bitcast [4 x %Nat8]* @func295_str1 to %Str
  %7 = extractvalue %LLVM_Value %5, 1
  %8 = call %Nat32 (%Str, %Type*) @func282 (%Str %6, %Type* %7)
;stmt2:
  call void () @space ()
;stmt3:
  call void (%LLVM_Value) @func326 (%LLVM_Value %5)
;stmt4:
  %9 = extractvalue %LLVM_Value %5, 1
  %10 = load %Type*, %Type** @typeBool
  %11 = call i1 (%Type*, %Type*) @func391 (%Type* %9, %Type* %10)
  br i1 %11, label %then_0, label %else_0
then_0:
;stmt5:
  %12 = bitcast [4 x %Nat8]* @func295_str2 to %Str
  call void (%Str) @o (%Str %12)
  br label %endif_0
else_0:
;stmt6:
  %13 = bitcast [5 x %Nat8]* @func295_str3 to %Str
  call void (%Str) @o (%Str %13)
  br label %endif_0
endif_0:
;stmt7:
  %14 = extractvalue %LLVM_Value %5, 1
  %15 = call %LLVM_Value (%Type*, %Nat32) @llval_create_reg (%Type* %14, %Nat32 %8)
  ret %LLVM_Value %15
}

define %LLVM_Value @func296 (%Value*) {
;stmt0:
  %2 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 8
  %3 = getelementptr inbounds %ValueUn, %ValueUn* %2, i1 0, i32 0
  %4 = load %Value*, %Value** %3
  %5 = call %LLVM_Value (%Value*) @func285 (%Value* %4)
;stmt1:
  %6 = load %Type*, %Type** @typeBaseInt
  %7 = call %LLVM_Value (%LLVM_ValueKind, %Type*, %Int64) @llval_create (%LLVM_ValueKind 2, %Type* %6, %Int64 0)
;stmt2:
  %8 = bitcast [8 x %Nat8]* @func296_str1 to %Str
  %9 = extractvalue %LLVM_Value %5, 1
  %10 = call %Nat32 (%Str, %LLVM_Value, %LLVM_Value, %Type*) @func308 (%Str %8, %LLVM_Value %7, %LLVM_Value %5, %Type* %9)
;stmt3:
  %11 = extractvalue %LLVM_Value %5, 1
  %12 = call %LLVM_Value (%Type*, %Nat32) @llval_create_reg (%Type* %11, %Nat32 %10)
  ret %LLVM_Value %12
}

define %LLVM_Value @func297 (%Value*) {
;stmt0:
  %2 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 8
  %3 = getelementptr inbounds %ValueUn, %ValueUn* %2, i1 0, i32 0
  %4 = load %Value*, %Value** %3
  %5 = call %LLVM_Value (%Value*) @func285 (%Value* %4)
  ret %LLVM_Value %5
}

define %LLVM_Value @func298 (%Str, %LLVM_Value, %Type*) {
;stmt0:
  %4 = extractvalue %LLVM_Value %1, 1
  %5 = call %Nat32 (%Str, %Type*) @func282 (%Str %0, %Type* %4)
;stmt1:
  call void () @space ()
;stmt2:
  call void (%LLVM_Value) @func326 (%LLVM_Value %1)
;stmt3:
  %6 = bitcast [5 x %Nat8]* @func298_str1 to %Str
  call void (%Str) @o (%Str %6)
;stmt4:
  call void (%Type*) @func344 (%Type* %2)
;stmt5:
  %7 = call %LLVM_Value (%Type*, %Nat32) @llval_create_reg (%Type* %2, %Nat32 %5)
  ret %LLVM_Value %7
}

define %LLVM_Value @func299 (%LLVM_Value, %Type*) {
;stmt0:
  %3 = extractvalue %LLVM_Value %0, 1
  %4 = getelementptr inbounds %Type, %Type* %3, i1 0, i32 0
  %5 = load %TypeKind, %TypeKind* %4
  br label %select_1_0
select_1_0:
  %6 = icmp eq %TypeKind %5, 4
  br i1 %6, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %7 = bitcast [9 x %Nat8]* @func299_str1 to %Str
  %8 = call %LLVM_Value (%Str, %LLVM_Value, %Type*) @func298 (%Str %7, %LLVM_Value %0, %Type* %1)
  br label %select_1_end
select_1_1:
  %9 = bitcast [8 x %Nat8]* @func299_str2 to %Str
  %10 = call %LLVM_Value (%Str, %LLVM_Value, %Type*) @func298 (%Str %9, %LLVM_Value %0, %Type* %1)
  br label %select_1_end
select_1_end:
  %11 = phi %LLVM_Value [ %8, %select_1_0_ok ], [ %10, %select_1_1 ]
  ret %LLVM_Value %11
}

define %LLVM_Value @func300 (%LLVM_Value, %Type*) {
;stmt0:
  %3 = bitcast [6 x %Nat8]* @func300_str1 to %Str
  %4 = call %LLVM_Value (%Str, %LLVM_Value, %Type*) @func298 (%Str %3, %LLVM_Value %0, %Type* %1)
  ret %LLVM_Value %4
}

define %LLVM_Value @func302 (%LLVM_Value, %Type*) {
;stmt0:
  %3 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 4
  %4 = getelementptr inbounds %TypeNumeric, %TypeNumeric* %3, i1 0, i32 1
  %5 = load i1, i1* %4
  br label %select_1_0
select_1_0:
  %6 = icmp eq i1 %5, 1
  br i1 %6, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %7 = bitcast [5 x %Nat8]* @func301_func302_str1 to %Str
  %8 = call %LLVM_Value (%Str, %LLVM_Value, %Type*) @func298 (%Str %7, %LLVM_Value %0, %Type* %1)
  br label %select_1_end
select_1_1:
  %9 = bitcast [5 x %Nat8]* @func301_func302_str2 to %Str
  %10 = call %LLVM_Value (%Str, %LLVM_Value, %Type*) @func298 (%Str %9, %LLVM_Value %0, %Type* %1)
  br label %select_1_end
select_1_end:
  %11 = phi %LLVM_Value [ %8, %select_1_0_ok ], [ %10, %select_1_1 ]
  ret %LLVM_Value %11
}

define %LLVM_Value @eval_cast_basic_to_basic (%LLVM_Value, %Type*) {
;stmt0:
  br label %select_1_0
select_1_0:
  %3 = extractvalue %LLVM_Value %0, 1
  %4 = getelementptr inbounds %Type, %Type* %3, i1 0, i32 4
  %5 = getelementptr inbounds %TypeNumeric, %TypeNumeric* %4, i1 0, i32 0
  %6 = load %Nat32, %Nat32* %5
  %7 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 4
  %8 = getelementptr inbounds %TypeNumeric, %TypeNumeric* %7, i1 0, i32 0
  %9 = load %Nat32, %Nat32* %8
  %10 = icmp ugt %Nat32 %6, %9
  %11 = icmp eq i1 1, %10
  br i1 %11, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %12 = bitcast [6 x %Nat8]* @func301_str1 to %Str
  %13 = call %LLVM_Value (%Str, %LLVM_Value, %Type*) @func298 (%Str %12, %LLVM_Value %0, %Type* %1)
  br label %select_1_end
select_1_1:
  %14 = extractvalue %LLVM_Value %0, 1
  %15 = getelementptr inbounds %Type, %Type* %14, i1 0, i32 4
  %16 = getelementptr inbounds %TypeNumeric, %TypeNumeric* %15, i1 0, i32 0
  %17 = load %Nat32, %Nat32* %16
  %18 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 4
  %19 = getelementptr inbounds %TypeNumeric, %TypeNumeric* %18, i1 0, i32 0
  %20 = load %Nat32, %Nat32* %19
  %21 = icmp ult %Nat32 %17, %20
  %22 = icmp eq i1 1, %21
  br i1 %22, label %select_1_1_ok, label %select_1_2
select_1_1_ok:
  %23 = call %LLVM_Value (%LLVM_Value, %Type*) @func302 (%LLVM_Value %0, %Type* %1)
  br label %select_1_end
select_1_2:
  %24 = bitcast [8 x %Nat8]* @func301_str2 to %Str
  %25 = call %LLVM_Value (%Str, %LLVM_Value, %Type*) @func298 (%Str %24, %LLVM_Value %0, %Type* %1)
  br label %select_1_end
select_1_end:
  %26 = phi %LLVM_Value [ %13, %select_1_0_ok ], [ %23, %select_1_1_ok ], [ %25, %select_1_2 ]
  ret %LLVM_Value %26
}

define %LLVM_Value @eval_cast_enum_to_basic (%LLVM_Value, %Type*) {
;stmt0:
  br label %select_1_0
select_1_0:
  %3 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 4
  %4 = getelementptr inbounds %TypeNumeric, %TypeNumeric* %3, i1 0, i32 0
  %5 = load %Nat32, %Nat32* %4
  %6 = icmp ugt %Nat32 2, %5
  %7 = icmp eq i1 1, %6
  br i1 %7, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %8 = bitcast [6 x %Nat8]* @func303_str1 to %Str
  %9 = call %LLVM_Value (%Str, %LLVM_Value, %Type*) @func298 (%Str %8, %LLVM_Value %0, %Type* %1)
  br label %select_1_end
select_1_1:
  %10 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 4
  %11 = getelementptr inbounds %TypeNumeric, %TypeNumeric* %10, i1 0, i32 0
  %12 = load %Nat32, %Nat32* %11
  %13 = icmp ult %Nat32 2, %12
  %14 = icmp eq i1 1, %13
  br i1 %14, label %select_1_1_ok, label %select_1_2
select_1_1_ok:
  %15 = bitcast [5 x %Nat8]* @func303_str2 to %Str
  %16 = call %LLVM_Value (%Str, %LLVM_Value, %Type*) @func298 (%Str %15, %LLVM_Value %0, %Type* %1)
  br label %select_1_end
select_1_2:
  %17 = bitcast [8 x %Nat8]* @func303_str3 to %Str
  %18 = call %LLVM_Value (%Str, %LLVM_Value, %Type*) @func298 (%Str %17, %LLVM_Value %0, %Type* %1)
  br label %select_1_end
select_1_end:
  %19 = phi %LLVM_Value [ %9, %select_1_0_ok ], [ %16, %select_1_1_ok ], [ %18, %select_1_2 ]
  ret %LLVM_Value %19
}

define %LLVM_Value @func305 (%LLVM_Value, %Type*) {
;stmt0:
  %3 = extractvalue %LLVM_Value %0, 1
  %4 = getelementptr inbounds %Type, %Type* %3, i1 0, i32 0
  %5 = load %TypeKind, %TypeKind* %4
;stmt1:
  %6 = load %FILE*, %FILE** @fout
  %7 = bitcast [24 x %Nat8]* @func304_func305_str1 to %Str
  %8 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %6, %Str %7, %TypeKind %5)
;stmt2:
  %9 = bitcast [18 x %Nat8]* @func304_func305_str2 to %Str
  %10 = call %Int32 (%Str, ...) @printf (%Str %9, %TypeKind %5)
;stmt3:
  %11 = bitcast [19 x %Nat8]* @func304_func305_str3 to %Str
  call void (i1, %Str) @assert (i1 0, %Str %11)
;stmt4:
  %12 = call %LLVM_Value (%LLVM_ValueKind, %Type*, %Int64) @llval_create (%LLVM_ValueKind 0, %Type* zeroinitializer, %Int64 0)
  ret %LLVM_Value %12
}

define %LLVM_Value @func304 (%LLVM_Value, %Type*) {
;stmt0:
  %3 = extractvalue %LLVM_Value %0, 1
  %4 = getelementptr inbounds %Type, %Type* %3, i1 0, i32 0
  %5 = load %TypeKind, %TypeKind* %4
  br label %select_1_0
select_1_0:
  %6 = icmp eq %TypeKind %5, 4
  br i1 %6, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %7 = call %LLVM_Value (%LLVM_Value, %Type*) @eval_cast_basic_to_basic (%LLVM_Value %0, %Type* %1)
  br label %select_1_end
select_1_1:
  %8 = icmp eq %TypeKind %5, 10
  br i1 %8, label %select_1_1_ok, label %select_1_2
select_1_1_ok:
  %9 = bitcast [9 x %Nat8]* @func304_str1 to %Str
  %10 = call %LLVM_Value (%Str, %LLVM_Value, %Type*) @func298 (%Str %9, %LLVM_Value %0, %Type* %1)
  br label %select_1_end
select_1_2:
  %11 = icmp eq %TypeKind %5, 8
  br i1 %11, label %select_1_2_ok, label %select_1_3
select_1_2_ok:
  %12 = call %LLVM_Value (%LLVM_Value, %Type*) @eval_cast_enum_to_basic (%LLVM_Value %0, %Type* %1)
  br label %select_1_end
select_1_3:
  %13 = icmp eq %TypeKind %5, 6
  br i1 %13, label %select_1_3_ok, label %select_1_4
select_1_3_ok:
  %14 = bitcast [5 x %Nat8]* @func304_str2 to %Str
  %15 = call %LLVM_Value (%Str, %LLVM_Value, %Type*) @func298 (%Str %14, %LLVM_Value %0, %Type* %1)
  br label %select_1_end
select_1_4:
  %16 = call %LLVM_Value (%LLVM_Value, %Type*) @func305 (%LLVM_Value %0, %Type* %1)
  br label %select_1_end
select_1_end:
  %17 = phi %LLVM_Value [ %7, %select_1_0_ok ], [ %10, %select_1_1_ok ], [ %12, %select_1_2_ok ], [ %15, %select_1_3_ok ], [ %16, %select_1_4 ]
  ret %LLVM_Value %17
}

define %LLVM_Value @func307 (%LLVM_Value, %Type*) {
;stmt0:
  %3 = bitcast [18 x %Nat8]* @func306_func307_str1 to %Str
  %4 = call %Int32 (%Str, ...) @printf (%Str %3)
;stmt1:
  %5 = extractvalue %LLVM_Value %0, 1
  call void (%Type*) @func76 (%Type* %5)
;stmt2:
  %6 = bitcast [6 x %Nat8]* @func306_func307_str2 to %Str
  %7 = call %Int32 (%Str, ...) @printf (%Str %6)
;stmt3:
  call void (%Type*) @func76 (%Type* %1)
;stmt4:
  %8 = bitcast [2 x %Nat8]* @func306_func307_str3 to %Str
  %9 = call %Int32 (%Str, ...) @printf (%Str %8)
;stmt5:
  %10 = bitcast [16 x %Nat8]* @func306_func307_str4 to %Str
  call void (%Str) @fatal (%Str %10)
;stmt6:
  %11 = call %LLVM_Value (%LLVM_ValueKind, %Type*, %Int64) @llval_create (%LLVM_ValueKind 0, %Type* %1, %Int64 0)
  ret %LLVM_Value %11
}

define %LLVM_Value @func306 (%Value*) {
;stmt0:
  %2 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 12
  %3 = getelementptr inbounds %ValueCast, %ValueCast* %2, i1 0, i32 0
  %4 = load %Value*, %Value** %3
  %5 = call %LLVM_Value (%Value*) @func285 (%Value* %4)
;stmt1:
  %6 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 12
  %7 = getelementptr inbounds %ValueCast, %ValueCast* %6, i1 0, i32 1
  %8 = load %Type*, %Type** %7
;stmt2:
  br label %select_1_0
select_1_0:
  %9 = call i1 (%Type*) @func362 (%Type* %8)
  %10 = icmp eq i1 1, %9
  br i1 %10, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %11 = call %LLVM_Value (%LLVM_Value, %Type*) @func299 (%LLVM_Value %5, %Type* %8)
  br label %select_1_end
select_1_1:
  %12 = getelementptr inbounds %Type, %Type* %8, i1 0, i32 0
  %13 = load %TypeKind, %TypeKind* %12
  %14 = icmp eq %TypeKind %13, 6
  %15 = icmp eq i1 1, %14
  br i1 %15, label %select_1_1_ok, label %select_1_2
select_1_1_ok:
  %16 = call %LLVM_Value (%LLVM_Value, %Type*) @func300 (%LLVM_Value %5, %Type* %8)
  br label %select_1_end
select_1_2:
  %17 = getelementptr inbounds %Type, %Type* %8, i1 0, i32 0
  %18 = load %TypeKind, %TypeKind* %17
  %19 = icmp eq %TypeKind %18, 4
  %20 = icmp eq i1 1, %19
  br i1 %20, label %select_1_2_ok, label %select_1_3
select_1_2_ok:
  %21 = call %LLVM_Value (%LLVM_Value, %Type*) @func304 (%LLVM_Value %5, %Type* %8)
  br label %select_1_end
select_1_3:
  %22 = load %Type*, %Type** @typeUnit
  %23 = call i1 (%Type*, %Type*) @func391 (%Type* %8, %Type* %22)
  %24 = icmp eq i1 1, %23
  br i1 %24, label %select_1_3_ok, label %select_1_4
select_1_3_ok:
  %25 = call %LLVM_Value (%LLVM_ValueKind, %Type*, %Int64) @llval_create (%LLVM_ValueKind 1, %Type* %8, %Int64 0)
  br label %select_1_end
select_1_4:
  %26 = call %LLVM_Value (%LLVM_Value, %Type*) @func307 (%LLVM_Value %5, %Type* %8)
  br label %select_1_end
select_1_end:
  %27 = phi %LLVM_Value [ %11, %select_1_0_ok ], [ %16, %select_1_1_ok ], [ %21, %select_1_2_ok ], [ %25, %select_1_3_ok ], [ %26, %select_1_4 ]
  ret %LLVM_Value %27
}

define %Nat32 @func308 (%Str, %LLVM_Value, %LLVM_Value, %Type*) {
;stmt0:
  %5 = call %Nat32 (%Str, %Type*) @func282 (%Str %0, %Type* %3)
;stmt1:
  call void () @space ()
;stmt2:
  call void (%LLVM_Value) @func326 (%LLVM_Value %1)
;stmt3:
  call void () @comma ()
;stmt4:
  call void (%LLVM_Value) @func326 (%LLVM_Value %2)
;stmt5:
  ret %Nat32 %5
}

define %Str @func310 (i1) {
;stmt0:
  br i1 %0, label %then_0, label %else_0
then_0:
;stmt1:
  %2 = bitcast [5 x %Nat8]* @func309_func310_str1 to %Str
  ret %Str %2
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt2:
  %4 = bitcast [5 x %Nat8]* @func309_func310_str2 to %Str
  ret %Str %4
}

define %Str @func311 (i1) {
;stmt0:
  br i1 %0, label %then_0, label %else_0
then_0:
;stmt1:
  %2 = bitcast [5 x %Nat8]* @func309_func311_str1 to %Str
  ret %Str %2
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt2:
  %4 = bitcast [5 x %Nat8]* @func309_func311_str2 to %Str
  ret %Str %4
}

define %Str @func312 (i1) {
;stmt0:
  br i1 %0, label %then_0, label %else_0
then_0:
;stmt1:
  %2 = bitcast [9 x %Nat8]* @func309_func312_str1 to %Str
  ret %Str %2
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt2:
  %4 = bitcast [9 x %Nat8]* @func309_func312_str2 to %Str
  ret %Str %4
}

define %Str @func313 (i1) {
;stmt0:
  br i1 %0, label %then_0, label %else_0
then_0:
;stmt1:
  %2 = bitcast [9 x %Nat8]* @func309_func313_str1 to %Str
  ret %Str %2
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt2:
  %4 = bitcast [9 x %Nat8]* @func309_func313_str2 to %Str
  ret %Str %4
}

define %Str @func314 (i1) {
;stmt0:
  br i1 %0, label %then_0, label %else_0
then_0:
;stmt1:
  %2 = bitcast [9 x %Nat8]* @func309_func314_str1 to %Str
  ret %Str %2
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt2:
  %4 = bitcast [9 x %Nat8]* @func309_func314_str2 to %Str
  ret %Str %4
}

define %Str @func315 (i1) {
;stmt0:
  br i1 %0, label %then_0, label %else_0
then_0:
;stmt1:
  %2 = bitcast [9 x %Nat8]* @func309_func315_str1 to %Str
  ret %Str %2
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt2:
  %4 = bitcast [9 x %Nat8]* @func309_func315_str2 to %Str
  ret %Str %4
}

define %Str @func316 (i1) {
;stmt0:
  br i1 %0, label %then_0, label %else_0
then_0:
;stmt1:
  %2 = bitcast [5 x %Nat8]* @func309_func316_str1 to %Str
  ret %Str %2
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt2:
  %4 = bitcast [5 x %Nat8]* @func309_func316_str2 to %Str
  ret %Str %4
}

define %LLVM_Value @func309 (%Value*) {
;stmt0:
  %2 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 9
  %3 = getelementptr inbounds %ValueBin, %ValueBin* %2, i1 0, i32 0
  %4 = load %Value*, %Value** %3
  %5 = call %LLVM_Value (%Value*) @func285 (%Value* %4)
;stmt1:
  %6 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 9
  %7 = getelementptr inbounds %ValueBin, %ValueBin* %6, i1 0, i32 1
  %8 = load %Value*, %Value** %7
  %9 = call %LLVM_Value (%Value*) @func285 (%Value* %8)
;stmt2:
  %10 = extractvalue %LLVM_Value %5, 1
  %11 = getelementptr inbounds %Type, %Type* %10, i1 0, i32 4
  %12 = getelementptr inbounds %TypeNumeric, %TypeNumeric* %11, i1 0, i32 1
  %13 = load i1, i1* %12
;stmt3:
  %14 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 0
  %15 = load %ValueKind, %ValueKind* %14
  br label %select_1_0
select_1_0:
  %16 = icmp eq %ValueKind %15, 14
  br i1 %16, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %17 = bitcast [4 x %Nat8]* @func309_str1 to %Str
  br label %select_1_end
select_1_1:
  %18 = icmp eq %ValueKind %15, 15
  br i1 %18, label %select_1_1_ok, label %select_1_2
select_1_1_ok:
  %19 = bitcast [4 x %Nat8]* @func309_str2 to %Str
  br label %select_1_end
select_1_2:
  %20 = icmp eq %ValueKind %15, 16
  br i1 %20, label %select_1_2_ok, label %select_1_3
select_1_2_ok:
  %21 = bitcast [4 x %Nat8]* @func309_str3 to %Str
  br label %select_1_end
select_1_3:
  %22 = icmp eq %ValueKind %15, 17
  br i1 %22, label %select_1_3_ok, label %select_1_4
select_1_3_ok:
  %23 = call %Str (i1) @func310 (i1 %13)
  br label %select_1_end
select_1_4:
  %24 = icmp eq %ValueKind %15, 18
  br i1 %24, label %select_1_4_ok, label %select_1_5
select_1_4_ok:
  %25 = call %Str (i1) @func311 (i1 %13)
  br label %select_1_end
select_1_5:
  %26 = icmp eq %ValueKind %15, 19
  br i1 %26, label %select_1_5_ok, label %select_1_6
select_1_5_ok:
  %27 = bitcast [3 x %Nat8]* @func309_str4 to %Str
  br label %select_1_end
select_1_6:
  %28 = icmp eq %ValueKind %15, 20
  br i1 %28, label %select_1_6_ok, label %select_1_7
select_1_6_ok:
  %29 = bitcast [4 x %Nat8]* @func309_str5 to %Str
  br label %select_1_end
select_1_7:
  %30 = icmp eq %ValueKind %15, 21
  br i1 %30, label %select_1_7_ok, label %select_1_8
select_1_7_ok:
  %31 = bitcast [4 x %Nat8]* @func309_str6 to %Str
  br label %select_1_end
select_1_8:
  %32 = icmp eq %ValueKind %15, 22
  br i1 %32, label %select_1_8_ok, label %select_1_9
select_1_8_ok:
  %33 = bitcast [8 x %Nat8]* @func309_str7 to %Str
  br label %select_1_end
select_1_9:
  %34 = icmp eq %ValueKind %15, 23
  br i1 %34, label %select_1_9_ok, label %select_1_10
select_1_9_ok:
  %35 = bitcast [8 x %Nat8]* @func309_str8 to %Str
  br label %select_1_end
select_1_10:
  %36 = icmp eq %ValueKind %15, 24
  br i1 %36, label %select_1_10_ok, label %select_1_11
select_1_10_ok:
  %37 = call %Str (i1) @func312 (i1 %13)
  br label %select_1_end
select_1_11:
  %38 = icmp eq %ValueKind %15, 25
  br i1 %38, label %select_1_11_ok, label %select_1_12
select_1_11_ok:
  %39 = call %Str (i1) @func313 (i1 %13)
  br label %select_1_end
select_1_12:
  %40 = icmp eq %ValueKind %15, 26
  br i1 %40, label %select_1_12_ok, label %select_1_13
select_1_12_ok:
  %41 = call %Str (i1) @func314 (i1 %13)
  br label %select_1_end
select_1_13:
  %42 = icmp eq %ValueKind %15, 27
  br i1 %42, label %select_1_13_ok, label %select_1_14
select_1_13_ok:
  %43 = call %Str (i1) @func315 (i1 %13)
  br label %select_1_end
select_1_14:
  %44 = icmp eq %ValueKind %15, 29
  br i1 %44, label %select_1_14_ok, label %select_1_15
select_1_14_ok:
  %45 = bitcast [4 x %Nat8]* @func309_str9 to %Str
  br label %select_1_end
select_1_15:
  %46 = icmp eq %ValueKind %15, 30
  br i1 %46, label %select_1_15_ok, label %select_1_16
select_1_15_ok:
  %47 = call %Str (i1) @func316 (i1 %13)
  br label %select_1_end
select_1_16:
  %48 = bitcast [27 x %Nat8]* @func309_str10 to %Str
  br label %select_1_end
select_1_end:
  %49 = phi %Str [ %17, %select_1_0_ok ], [ %19, %select_1_1_ok ], [ %21, %select_1_2_ok ], [ %23, %select_1_3_ok ], [ %25, %select_1_4_ok ], [ %27, %select_1_5_ok ], [ %29, %select_1_6_ok ], [ %31, %select_1_7_ok ], [ %33, %select_1_8_ok ], [ %35, %select_1_9_ok ], [ %37, %select_1_10_ok ], [ %39, %select_1_11_ok ], [ %41, %select_1_12_ok ], [ %43, %select_1_13_ok ], [ %45, %select_1_14_ok ], [ %47, %select_1_15_ok ], [ %48, %select_1_16 ]
;stmt4:
  %50 = extractvalue %LLVM_Value %5, 1
  %51 = call %Nat32 (%Str, %LLVM_Value, %LLVM_Value, %Type*) @func308 (%Str %49, %LLVM_Value %5, %LLVM_Value %9, %Type* %50)
;stmt5:
  %52 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 1
  %53 = load %Type*, %Type** %52
  %54 = call %LLVM_Value (%Type*, %Nat32) @llval_create_reg (%Type* %53, %Nat32 %51)
  ret %LLVM_Value %54
}

define %LLVM_Value @loadImmAs (%LLVM_Value, %Type*) {
;stmt0:
  %3 = bitcast [8 x %Nat8]* @func317_str1 to %Str
  %4 = extractvalue %LLVM_Value %0, 1
  %5 = call %LLVM_Value (%Str, %LLVM_Value, %Type*) @func298 (%Str %3, %LLVM_Value %0, %Type* %4)
  ret %LLVM_Value %5
}

define %LLVM_Value @loadImmPtr (%LLVM_Value) {
;stmt0:
  %2 = bitcast [9 x %Nat8]* @func318_str1 to %Str
  %3 = extractvalue %LLVM_Value %0, 1
  %4 = call %LLVM_Value (%Str, %LLVM_Value, %Type*) @func298 (%Str %2, %LLVM_Value %0, %Type* %3)
  ret %LLVM_Value %4
}

define %LLVM_Value @loadIfImmAs (%LLVM_Value, %Type*) {
;stmt0:
  %3 = extractvalue %LLVM_Value %0, 0
  br label %select_1_0
select_1_0:
  %4 = icmp eq %LLVM_ValueKind %3, 2
  br i1 %4, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %5 = bitcast [8 x %Nat8]* @func319_str1 to %Str
  %6 = call %LLVM_Value (%Str, %LLVM_Value, %Type*) @func298 (%Str %5, %LLVM_Value %0, %Type* %1)
  br label %select_1_end
select_1_1:
  br label %select_1_end
select_1_end:
  %7 = phi %LLVM_Value [ %6, %select_1_0_ok ], [ %0, %select_1_1 ]
  ret %LLVM_Value %7
}

define void @func321 (%Unit*, %Unit*, %Nat32) {
;stmt0:
  %4 = bitcast %Unit* %0 to %ValueSelectVariant*
;stmt1:
  %5 = bitcast %Unit* %1 to %func320.type2*
;stmt2:
  %6 = load %FILE*, %FILE** @fout
  %7 = bitcast [15 x %Nat8]* @func320_func321_str1 to %Str
  %8 = getelementptr inbounds %func320.type2, %func320.type2* %5, i1 0, i32 1
  %9 = load %Nat32, %Nat32* %8
  %10 = getelementptr inbounds %func320.type2, %func320.type2* %5, i1 0, i32 2
  %11 = load %Nat32, %Nat32* %10
  %12 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %6, %Str %7, %Nat32 %9, %Nat32 %11)
;stmt3:
  %13 = getelementptr inbounds %ValueSelectVariant, %ValueSelectVariant* %4, i1 0, i32 0
  %14 = load %Value*, %Value** %13
  %15 = call %LLVM_Value (%Value*) @func285 (%Value* %14)
;stmt4:
  %16 = bitcast [8 x %Nat8]* @func320_func321_str2 to %Str
  %17 = extractvalue %LLVM_Value %15, 1
  %18 = call %Nat32 (%Str, %Type*) @func282 (%Str %16, %Type* %17)
;stmt5:
  call void () @space ()
;stmt6:
  %19 = getelementptr inbounds %func320.type2, %func320.type2* %5, i1 0, i32 0
  %20 = load %LLVM_Value, %LLVM_Value* %19
  call void (%LLVM_Value) @func326 (%LLVM_Value %20)
;stmt7:
  call void () @comma ()
;stmt8:
  call void (%LLVM_Value) @func326 (%LLVM_Value %15)
;stmt9:
  %21 = load %FILE*, %FILE** @fout
  %22 = bitcast [14 x %Nat8]* @func320_func321_str3 to %Str
  %23 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %21, %Str %22, %Nat32 %18)
;stmt10:
  %24 = load %FILE*, %FILE** @fout
  %25 = bitcast [48 x %Nat8]* @func320_func321_str4 to %Str
  %26 = getelementptr inbounds %func320.type2, %func320.type2* %5, i1 0, i32 1
  %27 = load %Nat32, %Nat32* %26
  %28 = getelementptr inbounds %func320.type2, %func320.type2* %5, i1 0, i32 2
  %29 = load %Nat32, %Nat32* %28
  %30 = getelementptr inbounds %func320.type2, %func320.type2* %5, i1 0, i32 1
  %31 = load %Nat32, %Nat32* %30
  %32 = getelementptr inbounds %func320.type2, %func320.type2* %5, i1 0, i32 2
  %33 = load %Nat32, %Nat32* %32
  %34 = add %Nat32 %33, 1
  %35 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %24, %Str %25, %Nat32 %27, %Nat32 %29, %Nat32 %31, %Nat32 %34)
;stmt11:
  %36 = load %FILE*, %FILE** @fout
  %37 = bitcast [18 x %Nat8]* @func320_func321_str5 to %Str
  %38 = getelementptr inbounds %func320.type2, %func320.type2* %5, i1 0, i32 1
  %39 = load %Nat32, %Nat32* %38
  %40 = getelementptr inbounds %func320.type2, %func320.type2* %5, i1 0, i32 2
  %41 = load %Nat32, %Nat32* %40
  %42 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %36, %Str %37, %Nat32 %39, %Nat32 %41)
;stmt12:
  %43 = getelementptr inbounds %ValueSelectVariant, %ValueSelectVariant* %4, i1 0, i32 1
  %44 = load %Value*, %Value** %43
  %45 = call %LLVM_Value (%Value*) @func285 (%Value* %44)
;stmt13:
  %46 = getelementptr inbounds %func320.type2, %func320.type2* %5, i1 0, i32 4
  %47 = load %Type*, %Type** %46
  %48 = call %LLVM_Value (%LLVM_Value, %Type*) @loadIfImmAs (%LLVM_Value %45, %Type* %47)
;stmt14:
  %49 = load %FILE*, %FILE** @fout
  %50 = bitcast [28 x %Nat8]* @func320_func321_str6 to %Str
  %51 = getelementptr inbounds %func320.type2, %func320.type2* %5, i1 0, i32 1
  %52 = load %Nat32, %Nat32* %51
  %53 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %49, %Str %50, %Nat32 %52)
;stmt15:
  %54 = getelementptr inbounds %func320.type2, %func320.type2* %5, i1 0, i32 3
; index array
  %55 = getelementptr inbounds [256 x %Nat32], [256 x %Nat32]* %54, i1 0, %Nat32 %2
  %56 = extractvalue %LLVM_Value %48, 4
  store %Nat32 %56, %Nat32* %55, align 4
;stmt16:
  %57 = getelementptr inbounds %func320.type2, %func320.type2* %5, i1 0, i32 2
  %58 = getelementptr inbounds %func320.type2, %func320.type2* %5, i1 0, i32 2
  %59 = load %Nat32, %Nat32* %58
  %60 = add %Nat32 %59, 1
  store %Nat32 %60, %Nat32* %57, align 4
  ret void
}

define %LLVM_Value @func320 (%Value*) {
;stmt0:
  %2 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 15
  %3 = getelementptr inbounds %ValueSelect, %ValueSelect* %2, i1 0, i32 0
  %4 = load %Value*, %Value** %3
  %5 = call %LLVM_Value (%Value*) @func285 (%Value* %4)
;stmt1:
  %6 = load %Nat32, %Nat32* @select_no
  %7 = add %Nat32 %6, 1
  store %Nat32 %7, %Nat32* @select_no, align 4
;stmt2:
  %8 = load %Nat32, %Nat32* @select_no
;stmt3:
  %9 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 15
  %10 = getelementptr inbounds %ValueSelect, %ValueSelect* %9, i1 0, i32 1
  %11 = getelementptr inbounds %List, %List* %10, i1 0, i32 2
  %12 = load %Nat64, %Nat64* %11
;stmt4:
  %13 = alloca %func320.type2
  store %func320.type2 zeroinitializer, %func320.type2* %13, align 8
;stmt5:
  %14 = getelementptr inbounds %func320.type2, %func320.type2* %13, i1 0, i32 0
  store %LLVM_Value %5, %LLVM_Value* %14, align 8
;stmt6:
  %15 = getelementptr inbounds %func320.type2, %func320.type2* %13, i1 0, i32 2
  store %Nat32 0, %Nat32* %15, align 4
;stmt7:
  %16 = getelementptr inbounds %func320.type2, %func320.type2* %13, i1 0, i32 1
  store %Nat32 %8, %Nat32* %16, align 4
;stmt8:
  %17 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 1
  %18 = load %Type*, %Type** %17
;stmt9:
  %19 = getelementptr inbounds %func320.type2, %func320.type2* %13, i1 0, i32 4
  store %Type* %18, %Type** %19, align 8
;stmt10:
  %20 = load %FILE*, %FILE** @fout
  %21 = bitcast [26 x %Nat8]* @func320_str1 to %Str
  %22 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %20, %Str %21, %Nat32 %8)
;stmt11:
  %23 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 15
  %24 = getelementptr inbounds %ValueSelect, %ValueSelect* %23, i1 0, i32 1
  %25 = getelementptr inbounds %func320.type2, %func320.type2* %13, i1 0
  %26 = bitcast %func320.type2* %25 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @func59 (%List* %24, %ListForeachHandler @func321, %Unit* %26)
;stmt12:
  %27 = load %FILE*, %FILE** @fout
  %28 = bitcast [15 x %Nat8]* @func320_str2 to %Str
  %29 = getelementptr inbounds %func320.type2, %func320.type2* %13, i1 0, i32 2
  %30 = load %Nat32, %Nat32* %29
  %31 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %27, %Str %28, %Nat32 %8, %Nat32 %30)
;stmt13:
  %32 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 15
  %33 = getelementptr inbounds %ValueSelect, %ValueSelect* %32, i1 0, i32 2
  %34 = load %Value*, %Value** %33
  %35 = call %LLVM_Value (%Value*) @func285 (%Value* %34)
  %36 = getelementptr inbounds %func320.type2, %func320.type2* %13, i1 0, i32 4
  %37 = load %Type*, %Type** %36
  %38 = call %LLVM_Value (%LLVM_Value, %Type*) @loadIfImmAs (%LLVM_Value %35, %Type* %37)
;stmt14:
  %39 = load %FILE*, %FILE** @fout
  %40 = bitcast [28 x %Nat8]* @func320_str3 to %Str
  %41 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %39, %Str %40, %Nat32 %8)
;stmt15:
  %42 = load %FILE*, %FILE** @fout
  %43 = bitcast [16 x %Nat8]* @func320_str4 to %Str
  %44 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %42, %Str %43, %Nat32 %8)
;stmt16:
  %45 = load %Type*, %Type** @typeUnit
  %46 = call i1 (%Type*, %Type*) @func391 (%Type* %18, %Type* %45)
  %47 = xor i1 %46, 1
  br i1 %47, label %then_0, label %else_0
then_0:
;stmt17:
  %48 = bitcast [4 x %Nat8]* @func320_str5 to %Str
  %49 = call %Nat32 (%Str, %Type*) @func282 (%Str %48, %Type* %18)
;stmt18:
  call void () @space ()
;stmt19:
  %50 = alloca %Nat64
  store %Nat64 0, %Nat64* %50, align 8
;stmt20:
  br label %continue_0
continue_0:
  %51 = load %Nat64, %Nat64* %50
  %52 = icmp ult %Nat64 %51, %12
  br i1 %52, label %body_0, label %break_0
body_0:
;stmt21:
  %53 = load %FILE*, %FILE** @fout
  %54 = bitcast [30 x %Nat8]* @func320_str6 to %Str
  %55 = getelementptr inbounds %func320.type2, %func320.type2* %13, i1 0, i32 3
  %56 = load %Nat64, %Nat64* %50
; index array
  %57 = getelementptr inbounds [256 x %Nat32], [256 x %Nat32]* %55, i1 0, %Nat64 %56
  %58 = load %Nat32, %Nat32* %57
  %59 = load %Nat64, %Nat64* %50
  %60 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %53, %Str %54, %Nat32 %58, %Nat32 %8, %Nat64 %59)
;stmt22:
  %61 = load %Nat64, %Nat64* %50
  %62 = add %Nat64 %61, 1
  store %Nat64 %62, %Nat64* %50, align 8
  br label %continue_0
break_0:
;stmt23:
  %63 = load %FILE*, %FILE** @fout
  %64 = bitcast [25 x %Nat8]* @func320_str7 to %Str
  %65 = extractvalue %LLVM_Value %38, 4
  %66 = getelementptr inbounds %func320.type2, %func320.type2* %13, i1 0, i32 2
  %67 = load %Nat32, %Nat32* %66
  %68 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %63, %Str %64, %Nat32 %65, %Nat32 %8, %Nat32 %67)
;stmt24:
  %69 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 1
  %70 = load %Type*, %Type** %69
  %71 = call %LLVM_Value (%Type*, %Nat32) @llval_create_reg (%Type* %70, %Nat32 %49)
  ret %LLVM_Value %71
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt25:
  %73 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 1
  %74 = load %Type*, %Type** %73
  %75 = call %LLVM_Value (%LLVM_ValueKind, %Type*, %Int64) @llval_create (%LLVM_ValueKind 0, %Type* %74, %Int64 0)
  ret %LLVM_Value %75
}

define void @func322 (%Value*, %Value*) {
;stmt0:
  %3 = call %LLVM_Value (%Value*) @func285 (%Value* %0)
;stmt1:
  %4 = call %LLVM_Value (%Value*) @func285 (%Value* %1)
;stmt2:
  call void (%LLVM_Value, %LLVM_Value) @func323 (%LLVM_Value %3, %LLVM_Value %4)
  ret void
}

define void @func323 (%LLVM_Value, %LLVM_Value) {
;stmt0:
  %3 = extractvalue %LLVM_Value %1, 1
;stmt1:
  %4 = load %FILE*, %FILE** @fout
  %5 = bitcast [10 x %Nat8]* @func323_str1 to %Str
  %6 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %4, %Str %5)
;stmt2:
  call void (%Type*) @func344 (%Type* %3)
;stmt3:
  call void () @space ()
;stmt4:
  call void (%LLVM_Value) @func326 (%LLVM_Value %1)
;stmt5:
  call void () @comma ()
;stmt6:
  call void (%Type*) @func344 (%Type* %3)
;stmt7:
  %7 = bitcast [3 x %Nat8]* @func323_str2 to %Str
  call void (%Str) @o (%Str %7)
;stmt8:
  call void (%LLVM_Value) @func326 (%LLVM_Value %0)
;stmt9:
  %8 = load %FILE*, %FILE** @fout
  %9 = bitcast [11 x %Nat8]* @func323_str3 to %Str
  %10 = getelementptr inbounds %Type, %Type* %3, i1 0, i32 3
  %11 = load %Nat32, %Nat32* %10
  %12 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %8, %Str %9, %Nat32 %11)
  ret void
}

define %LLVM_Value @func324 (%LLVM_Value) {
;stmt0:
  %2 = extractvalue %LLVM_Value %0, 0
;stmt1:
  %3 = icmp eq %LLVM_ValueKind %2, 0
  br i1 %3, label %then_0, label %else_0
then_0:
;stmt2:
  ret %LLVM_Value %0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt3:
  %5 = icmp eq %LLVM_ValueKind %2, 2
  br i1 %5, label %then_1, label %else_1
then_1:
;stmt4:
  %6 = extractvalue %LLVM_Value %0, 1
  %7 = call i1 (%Type*) @func362 (%Type* %6)
  br label %select_1_0
select_1_0:
  %8 = icmp eq i1 %7, 1
  br i1 %8, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %9 = call %LLVM_Value (%LLVM_Value) @loadImmPtr (%LLVM_Value %0)
  br label %select_1_end
select_1_1:
  br label %select_1_end
select_1_end:
  %10 = phi %LLVM_Value [ %9, %select_1_0_ok ], [ %0, %select_1_1 ]
  ret %LLVM_Value %10
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt5:
  %12 = icmp ne %LLVM_ValueKind %2, 4
  %13 = icmp ne %LLVM_ValueKind %2, 5
  %14 = icmp ne %LLVM_ValueKind %2, 6
  %15 = and i1 %13, %14
  %16 = and i1 %12, %15
  br i1 %16, label %then_2, label %else_2
then_2:
;stmt6:
  ret %LLVM_Value %0
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
;stmt7:
  %18 = extractvalue %LLVM_Value %0, 1
;stmt8:
  %19 = bitcast [5 x %Nat8]* @func324_str1 to %Str
  %20 = call %Nat32 (%Str, %Type*) @func282 (%Str %19, %Type* %18)
;stmt9:
  call void () @comma ()
;stmt10:
  call void (%Type*) @func344 (%Type* %18)
;stmt11:
  %21 = bitcast [3 x %Nat8]* @func324_str2 to %Str
  call void (%Str) @o (%Str %21)
;stmt12:
  call void (%LLVM_Value) @func326 (%LLVM_Value %0)
;stmt13:
  %22 = call %LLVM_Value (%Type*, %Nat32) @llval_create_reg (%Type* %18, %Nat32 %20)
  ret %LLVM_Value %22
}

define %Int32 @print_val_imm (%LLVM_Value) {
;stmt0:
  %2 = extractvalue %LLVM_Value %0, 1
;stmt1:
  %3 = call i1 (%Type*) @func362 (%Type* %2)
  %4 = getelementptr inbounds %Type, %Type* %2, i1 0, i32 0
  %5 = load %TypeKind, %TypeKind* %4
  %6 = icmp eq %TypeKind %5, 9
  %7 = getelementptr inbounds %Type, %Type* %2, i1 0, i32 0
  %8 = load %TypeKind, %TypeKind* %7
  %9 = icmp eq %TypeKind %8, 11
  %10 = or i1 %6, %9
  %11 = or i1 %3, %10
;stmt2:
  %12 = getelementptr inbounds %Type, %Type* %2, i1 0, i32 0
  %13 = load %TypeKind, %TypeKind* %12
  %14 = icmp eq %TypeKind %13, 5
  br i1 %14, label %then_0, label %else_0
then_0:
;stmt3:
  %15 = getelementptr inbounds %Type, %Type* %2, i1 0, i32 11
  %16 = getelementptr inbounds %TypeVar, %TypeVar* %15, i1 0, i32 0
  %17 = load %Type*, %Type** %16
;stmt4:
  %18 = call i1 (%Type*) @func362 (%Type* %17)
  %19 = getelementptr inbounds %Type, %Type* %17, i1 0, i32 0
  %20 = load %TypeKind, %TypeKind* %19
  %21 = icmp eq %TypeKind %20, 9
  %22 = getelementptr inbounds %Type, %Type* %17, i1 0, i32 0
  %23 = load %TypeKind, %TypeKind* %22
  %24 = icmp eq %TypeKind %23, 11
  %25 = or i1 %21, %24
  %26 = or i1 %18, %25
  br i1 %26, label %then_1, label %else_1
then_1:
;stmt5:
  %27 = bitcast [16 x %Nat8]* @func325_str1 to %Str
  call void (%Str) @o (%Str %27)
;stmt6:
  ret %Int32 0
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt7:
  %29 = extractvalue %LLVM_Value %0, 2
  %30 = icmp eq %Int64 %29, 0
  %31 = and i1 %11, %30
  br i1 %31, label %then_2, label %else_2
then_2:
;stmt8:
  %32 = bitcast [16 x %Nat8]* @func325_str2 to %Str
  call void (%Str) @o (%Str %32)
  br label %endif_2
else_2:
;stmt9:
  %33 = load %FILE*, %FILE** @fout
  %34 = bitcast [5 x %Nat8]* @func325_str3 to %Str
  %35 = extractvalue %LLVM_Value %0, 2
  %36 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %33, %Str %34, %Int64 %35)
  br label %endif_2
endif_2:
;stmt10:
  ret %Int32 0
}

define void @func326 (%LLVM_Value) {
;stmt0:
  %2 = extractvalue %LLVM_Value %0, 0
  br label %select_1_0
select_1_0:
  %3 = icmp eq %LLVM_ValueKind %2, 2
  br i1 %3, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %4 = call %Int32 (%LLVM_Value) @print_val_imm (%LLVM_Value %0)
  br label %select_1_end
select_1_1:
  %5 = icmp eq %LLVM_ValueKind %2, 7
  br i1 %5, label %select_1_1_ok, label %select_1_2
select_1_1_ok:
  %6 = load %FILE*, %FILE** @fout
  %7 = bitcast [5 x %Nat8]* @func326_str1 to %Str
  %8 = extractvalue %LLVM_Value %0, 4
  %9 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %6, %Str %7, %Nat32 %8)
  br label %select_1_end
select_1_2:
  %10 = icmp eq %LLVM_ValueKind %2, 6
  br i1 %10, label %select_1_2_ok, label %select_1_3
select_1_2_ok:
  %11 = load %FILE*, %FILE** @fout
  %12 = bitcast [5 x %Nat8]* @func326_str2 to %Str
  %13 = extractvalue %LLVM_Value %0, 4
  %14 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %11, %Str %12, %Nat32 %13)
  br label %select_1_end
select_1_3:
  %15 = icmp eq %LLVM_ValueKind %2, 5
  br i1 %15, label %select_1_3_ok, label %select_1_4
select_1_3_ok:
  %16 = load %FILE*, %FILE** @fout
  %17 = bitcast [4 x %Nat8]* @func326_str3 to %Str
  %18 = extractvalue %LLVM_Value %0, 3
  %19 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %16, %Str %17, %Str %18)
  br label %select_1_end
select_1_4:
  %20 = icmp eq %LLVM_ValueKind %2, 3
  br i1 %20, label %select_1_4_ok, label %select_1_5
select_1_4_ok:
  %21 = load %FILE*, %FILE** @fout
  %22 = bitcast [4 x %Nat8]* @func326_str4 to %Str
  %23 = extractvalue %LLVM_Value %0, 3
  %24 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %21, %Str %22, %Str %23)
  br label %select_1_end
select_1_5:
  %25 = icmp eq %LLVM_ValueKind %2, 4
  br i1 %25, label %select_1_5_ok, label %select_1_6
select_1_5_ok:
  %26 = load %FILE*, %FILE** @fout
  %27 = bitcast [5 x %Nat8]* @func326_str5 to %Str
  %28 = extractvalue %LLVM_Value %0, 4
  %29 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %26, %Str %27, %Nat32 %28)
  br label %select_1_end
select_1_6:
  %30 = load %FILE*, %FILE** @fout
  %31 = bitcast [32 x %Nat8]* @func326_str6 to %Str
  %32 = extractvalue %LLVM_Value %0, 0
  %33 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %30, %Str %31, %LLVM_ValueKind %32)
  br label %select_1_end
select_1_end:
  %34 = phi %Int32 [ %4, %select_1_0_ok ], [ %9, %select_1_1_ok ], [ %14, %select_1_2_ok ], [ %19, %select_1_3_ok ], [ %24, %select_1_4_ok ], [ %29, %select_1_5_ok ], [ %33, %select_1_6 ]
  ret void
}

define void @func327 (%LLVM_Value) {
;stmt0:
  %2 = extractvalue %LLVM_Value %0, 1
  call void (%Type*) @func344 (%Type* %2)
;stmt1:
  call void () @space ()
;stmt2:
  call void (%LLVM_Value) @func326 (%LLVM_Value %0)
  ret void
}

define %LLVM_Value @func328 (%LLVM_Value) {
;stmt0:
  %2 = bitcast [12 x %Nat8]* @func328_str1 to %Str
  %3 = extractvalue %LLVM_Value %0, 1
  %4 = call %Nat32 (%Str, %Type*) @func282 (%Str %2, %Type* %3)
;stmt1:
  %5 = bitcast [9 x %Nat8]* @func328_str2 to %Str
  call void (%Str) @o (%Str %5)
;stmt2:
  %6 = extractvalue %LLVM_Value %0, 1
  %7 = call %LLVM_Value (%Type*, %Nat32) @llval_create_reg (%Type* %6, %Nat32 %4)
  ret %LLVM_Value %7
}

define void @func329 (%Stmt*) {
;stmt0:
  %2 = getelementptr inbounds %Stmt, %Stmt* %0, i1 0, i32 0
  %3 = load %StmtKind, %StmtKind* %2
;stmt1:
  %4 = icmp ne %StmtKind %3, 2
  br i1 %4, label %then_0, label %else_0
then_0:
;stmt2:
  %5 = load %FILE*, %FILE** @fout
  %6 = bitcast [10 x %Nat8]* @func329_str1 to %Str
  %7 = load %Nat32, %Nat32* @stmtno
  %8 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %5, %Str %6, %Nat32 %7)
;stmt3:
  %9 = load %Nat32, %Nat32* @stmtno
  %10 = add %Nat32 %9, 1
  store %Nat32 %10, %Nat32* @stmtno, align 4
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt4:
  br label %select_1_0
select_1_0:
  %11 = icmp eq %StmtKind %3, 2
  br i1 %11, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %12 = getelementptr inbounds %Stmt, %Stmt* %0, i1 0, i32 2
  call void (%Block*) @func339 (%Block* %12)
  br label %select_1_end
select_1_1:
  %13 = icmp eq %StmtKind %3, 1
  br i1 %13, label %select_1_1_ok, label %select_1_2
select_1_1_ok:
  %14 = getelementptr inbounds %Stmt, %Stmt* %0, i1 0, i32 3
  call void (%Expr*) @func331 (%Expr* %14)
  br label %select_1_end
select_1_2:
  %15 = icmp eq %StmtKind %3, 4
  br i1 %15, label %select_1_2_ok, label %select_1_3
select_1_2_ok:
  %16 = getelementptr inbounds %Stmt, %Stmt* %0, i1 0, i32 1
; index array
  %17 = getelementptr inbounds [2 x %Value*], [2 x %Value*]* %16, i1 0, %Int64 0
  %18 = load %Value*, %Value** %17
  %19 = getelementptr inbounds %Stmt, %Stmt* %0, i1 0, i32 1
; index array
  %20 = getelementptr inbounds [2 x %Value*], [2 x %Value*]* %19, i1 0, %Int64 1
  %21 = load %Value*, %Value** %20
  call void (%Value*, %Value*) @func322 (%Value* %18, %Value* %21)
  br label %select_1_end
select_1_3:
  %22 = icmp eq %StmtKind %3, 3
  br i1 %22, label %select_1_3_ok, label %select_1_4
select_1_3_ok:
  %23 = getelementptr inbounds %Stmt, %Stmt* %0, i1 0, i32 4
  %24 = load %Decl*, %Decl** %23
  call void (%Decl*) @func330 (%Decl* %24)
  br label %select_1_end
select_1_4:
  %25 = icmp eq %StmtKind %3, 5
  br i1 %25, label %select_1_4_ok, label %select_1_5
select_1_4_ok:
  %26 = getelementptr inbounds %Stmt, %Stmt* %0, i1 0, i32 6
  call void (%If*) @func332 (%If* %26)
  br label %select_1_end
select_1_5:
  %27 = icmp eq %StmtKind %3, 6
  br i1 %27, label %select_1_5_ok, label %select_1_6
select_1_5_ok:
  %28 = getelementptr inbounds %Stmt, %Stmt* %0, i1 0, i32 5
  call void (%While*) @func333 (%While* %28)
  br label %select_1_end
select_1_6:
  %29 = icmp eq %StmtKind %3, 7
  br i1 %29, label %select_1_6_ok, label %select_1_7
select_1_6_ok:
  %30 = getelementptr inbounds %Stmt, %Stmt* %0, i1 0, i32 1
; index array
  %31 = getelementptr inbounds [2 x %Value*], [2 x %Value*]* %30, i1 0, %Int64 0
  %32 = load %Value*, %Value** %31
  call void (%Value*) @func334 (%Value* %32)
  br label %select_1_end
select_1_7:
  %33 = icmp eq %StmtKind %3, 8
  br i1 %33, label %select_1_7_ok, label %select_1_8
select_1_7_ok:
  call void () @func335 ()
  br label %select_1_end
select_1_8:
  %34 = icmp eq %StmtKind %3, 9
  br i1 %34, label %select_1_8_ok, label %select_1_9
select_1_8_ok:
  call void () @func336 ()
  br label %select_1_end
select_1_9:
  %35 = icmp eq %StmtKind %3, 10
  br i1 %35, label %select_1_9_ok, label %select_1_10
select_1_9_ok:
  %36 = getelementptr inbounds %Stmt, %Stmt* %0, i1 0, i32 7
  %37 = load %Str, %Str* %36
  call void (%Str) @func337 (%Str %37)
  br label %select_1_end
select_1_10:
  %38 = icmp eq %StmtKind %3, 11
  br i1 %38, label %select_1_10_ok, label %select_1_11
select_1_10_ok:
  %39 = getelementptr inbounds %Stmt, %Stmt* %0, i1 0, i32 7
  %40 = load %Str, %Str* %39
  call void (%Str) @func338 (%Str %40)
  br label %select_1_end
select_1_11:
  %41 = load %FILE*, %FILE** @fout
  %42 = bitcast [22 x %Nat8]* @func329_str2 to %Str
  %43 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %41, %Str %42)
  br label %select_1_end
select_1_end:
  ret void
}

define void @func330 (%Decl*) {
;stmt0:
  %2 = bitcast [7 x %Nat8]* @func330_str1 to %Str
  %3 = getelementptr inbounds %Decl, %Decl* %0, i1 0, i32 1
  %4 = load %Type*, %Type** %3
  %5 = call %Nat32 (%Str, %Type*) @func282 (%Str %2, %Type* %4)
;stmt1:
  %6 = getelementptr inbounds %Decl, %Decl* %0, i1 0, i32 4
  store %Nat32 %5, %Nat32* %6, align 4
;stmt2:
  %7 = getelementptr inbounds %Decl, %Decl* %0, i1 0, i32 5
  %8 = load %Value*, %Value** %7
;stmt3:
  %9 = icmp ne %Value* %8, zeroinitializer
  br i1 %9, label %then_0, label %else_0
then_0:
;stmt4:
  %10 = call %LLVM_Value (%Value*) @func285 (%Value* %8)
;stmt5:
  %11 = getelementptr inbounds %Decl, %Decl* %0, i1 0, i32 1
  %12 = load %Type*, %Type** %11
  %13 = sext %Nat32 %5 to %Int64
  %14 = call %LLVM_Value (%LLVM_ValueKind, %Type*, %Int64) @llval_create (%LLVM_ValueKind 4, %Type* %12, %Int64 %13)
;stmt6:
  call void (%LLVM_Value, %LLVM_Value) @func323 (%LLVM_Value %14, %LLVM_Value %10)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  ret void
}

define void @func331 (%Expr*) {
;stmt0:
  %2 = getelementptr inbounds %Expr, %Expr* %0, i1 0, i32 0
  %3 = load %Value*, %Value** %2
  %4 = call %LLVM_Value (%Value*) @func285 (%Value* %3)
;stmt1:
  %5 = getelementptr inbounds %Expr, %Expr* %0, i1 0, i32 1
  %6 = extractvalue %LLVM_Value %4, 4
  store %Nat32 %6, %Nat32* %5, align 4
  ret void
}

define void @func332 (%If*) {
;stmt0:
  %2 = load %Nat32, %Nat32* @global_if_id
;stmt1:
  %3 = load %Nat32, %Nat32* @global_if_id
  %4 = add %Nat32 %3, 1
  store %Nat32 %4, %Nat32* @global_if_id, align 4
;stmt2:
  %5 = getelementptr inbounds %If, %If* %0, i1 0, i32 0
  %6 = load %Value*, %Value** %5
  %7 = call %LLVM_Value (%Value*) @func285 (%Value* %6)
;stmt3:
  %8 = load %FILE*, %FILE** @fout
  %9 = bitcast [10 x %Nat8]* @func332_str1 to %Str
  %10 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %8, %Str %9)
;stmt4:
  call void (%LLVM_Value) @func326 (%LLVM_Value %7)
;stmt5:
  %11 = load %FILE*, %FILE** @fout
  %12 = bitcast [35 x %Nat8]* @func332_str2 to %Str
  %13 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %11, %Str %12, %Nat32 %2, %Nat32 %2)
;stmt6:
  %14 = load %FILE*, %FILE** @fout
  %15 = bitcast [10 x %Nat8]* @func332_str3 to %Str
  %16 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %14, %Str %15, %Nat32 %2)
;stmt7:
  %17 = getelementptr inbounds %If, %If* %0, i1 0, i32 1
  %18 = load %Stmt*, %Stmt** %17
  call void (%Stmt*) @func329 (%Stmt* %18)
;stmt8:
  %19 = load %FILE*, %FILE** @fout
  %20 = bitcast [23 x %Nat8]* @func332_str4 to %Str
  %21 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %19, %Str %20, %Nat32 %2)
;stmt9:
  %22 = load %FILE*, %FILE** @fout
  %23 = bitcast [10 x %Nat8]* @func332_str5 to %Str
  %24 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %22, %Str %23, %Nat32 %2)
;stmt10:
  %25 = getelementptr inbounds %If, %If* %0, i1 0, i32 2
  %26 = load %Stmt*, %Stmt** %25
  %27 = icmp ne %Stmt* %26, zeroinitializer
  br i1 %27, label %then_0, label %else_0
then_0:
;stmt11:
  %28 = getelementptr inbounds %If, %If* %0, i1 0, i32 2
  %29 = load %Stmt*, %Stmt** %28
  call void (%Stmt*) @func329 (%Stmt* %29)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt12:
  %30 = load %FILE*, %FILE** @fout
  %31 = bitcast [23 x %Nat8]* @func332_str6 to %Str
  %32 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %30, %Str %31, %Nat32 %2)
;stmt13:
  %33 = load %FILE*, %FILE** @fout
  %34 = bitcast [11 x %Nat8]* @func332_str7 to %Str
  %35 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %33, %Str %34, %Nat32 %2)
  ret void
}

define void @func333 (%While*) {
;stmt0:
  %2 = load %Nat32, %Nat32* @while_id
;stmt1:
  %3 = load %Nat32, %Nat32* @global_while_id
  store %Nat32 %3, %Nat32* @while_id, align 4
;stmt2:
  %4 = load %Nat32, %Nat32* @global_while_id
  %5 = add %Nat32 %4, 1
  store %Nat32 %5, %Nat32* @global_while_id, align 4
;stmt3:
  %6 = load %FILE*, %FILE** @fout
  %7 = bitcast [26 x %Nat8]* @func333_str1 to %Str
  %8 = load %Nat32, %Nat32* @while_id
  %9 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %6, %Str %7, %Nat32 %8)
;stmt4:
  %10 = load %FILE*, %FILE** @fout
  %11 = bitcast [14 x %Nat8]* @func333_str2 to %Str
  %12 = load %Nat32, %Nat32* @while_id
  %13 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %10, %Str %11, %Nat32 %12)
;stmt5:
  %14 = getelementptr inbounds %While, %While* %0, i1 0, i32 0
  %15 = load %Value*, %Value** %14
  %16 = call %LLVM_Value (%Value*) @func285 (%Value* %15)
;stmt6:
  %17 = load %FILE*, %FILE** @fout
  %18 = bitcast [10 x %Nat8]* @func333_str3 to %Str
  %19 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %17, %Str %18)
;stmt7:
  call void (%LLVM_Value) @func326 (%LLVM_Value %16)
;stmt8:
  %20 = load %FILE*, %FILE** @fout
  %21 = bitcast [36 x %Nat8]* @func333_str4 to %Str
  %22 = load %Nat32, %Nat32* @while_id
  %23 = load %Nat32, %Nat32* @while_id
  %24 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %20, %Str %21, %Nat32 %22, %Nat32 %23)
;stmt9:
  %25 = load %FILE*, %FILE** @fout
  %26 = bitcast [10 x %Nat8]* @func333_str5 to %Str
  %27 = load %Nat32, %Nat32* @while_id
  %28 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %25, %Str %26, %Nat32 %27)
;stmt10:
  %29 = getelementptr inbounds %While, %While* %0, i1 0, i32 1
  %30 = load %Stmt*, %Stmt** %29
  call void (%Stmt*) @func329 (%Stmt* %30)
;stmt11:
  %31 = load %FILE*, %FILE** @fout
  %32 = bitcast [26 x %Nat8]* @func333_str6 to %Str
  %33 = load %Nat32, %Nat32* @while_id
  %34 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %31, %Str %32, %Nat32 %33)
;stmt12:
  %35 = load %FILE*, %FILE** @fout
  %36 = bitcast [11 x %Nat8]* @func333_str7 to %Str
  %37 = load %Nat32, %Nat32* @while_id
  %38 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %35, %Str %36, %Nat32 %37)
;stmt13:
  store %Nat32 %2, %Nat32* @while_id, align 4
  ret void
}

define void @func334 (%Value*) {
;stmt0:
  %2 = icmp eq %Value* %0, zeroinitializer
  br i1 %2, label %then_0, label %else_0
then_0:
;stmt1:
  %3 = call %Nat32 () @lab_get ()
;stmt2:
  %4 = bitcast [10 x %Nat8]* @func334_str1 to %Str
  call void (%Str) @o (%Str %4)
;stmt3:
ret void
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt4:
  %6 = call %LLVM_Value (%Value*) @func285 (%Value* %0)
;stmt5:
  %7 = load %FILE*, %FILE** @fout
  %8 = bitcast [8 x %Nat8]* @func334_str2 to %Str
  %9 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %7, %Str %8)
;stmt6:
  call void (%LLVM_Value) @func327 (%LLVM_Value %6)
;stmt7:
  %10 = call %Nat32 () @lab_get ()
  ret void
}

define void @func335 () {
;stmt0:
  %1 = call %Nat32 () @lab_get ()
;stmt1:
  %2 = load %FILE*, %FILE** @fout
  %3 = bitcast [23 x %Nat8]* @func335_str1 to %Str
  %4 = load %Nat32, %Nat32* @while_id
  %5 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %2, %Str %3, %Nat32 %4)
  ret void
}

define void @func336 () {
;stmt0:
  %1 = call %Nat32 () @lab_get ()
;stmt1:
  %2 = load %FILE*, %FILE** @fout
  %3 = bitcast [26 x %Nat8]* @func336_str1 to %Str
  %4 = load %Nat32, %Nat32* @while_id
  %5 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %2, %Str %3, %Nat32 %4)
  ret void
}

define void @func337 (%Str) {
;stmt0:
  %2 = call %Nat32 () @lab_get ()
;stmt1:
  %3 = load %FILE*, %FILE** @fout
  %4 = bitcast [17 x %Nat8]* @func337_str1 to %Str
  %5 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %3, %Str %4, %Str %0)
  ret void
}

define void @func338 (%Str) {
;stmt0:
  %2 = load %FILE*, %FILE** @fout
  %3 = bitcast [17 x %Nat8]* @func338_str1 to %Str
  %4 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %2, %Str %3, %Str %0)
;stmt1:
  %5 = load %FILE*, %FILE** @fout
  %6 = bitcast [5 x %Nat8]* @func338_str2 to %Str
  %7 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %5, %Str %6, %Str %0)
  ret void
}

define void @func340 (%Unit*, %Unit*, %Nat32) {
;stmt0:
  %4 = load %Nat32, %Nat32* @blockno
  %5 = add %Nat32 %4, 1
  store %Nat32 %5, %Nat32* @blockno, align 4
;stmt1:
  %6 = bitcast %Unit* %0 to %Stmt*
  call void (%Stmt*) @func329 (%Stmt* %6)
  ret void
}

define void @func339 (%Block*) {
;stmt0:
  %2 = getelementptr inbounds %Block, %Block* %0, i1 0, i32 2
  call void (%List*, %ListForeachHandler, %Unit*) @func59 (%List* %2, %ListForeachHandler @func340, %Unit* zeroinitializer)
  ret void
}

define void @func342 (%Type*) {
;stmt0:
  %2 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 11
  %3 = getelementptr inbounds %TypeVar, %TypeVar* %2, i1 0, i32 0
  %4 = load %Type*, %Type** %3
  call void (%Type*) @func344 (%Type* %4)
  ret void
}

define void @func343 (%Type*) {
;stmt0:
  %2 = bitcast [20 x %Nat8]* @func341_func343_str1 to %Str
  call void (%Str) @o (%Str %2)
;stmt1:
  %3 = bitcast [18 x %Nat8]* @func341_func343_str2 to %Str
  %4 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 0
  %5 = load %TypeKind, %TypeKind* %4
  %6 = call %Int32 (%Str, ...) @printf (%Str %3, %TypeKind %5)
  ret void
}

define void @func341 (%Type*, i1, i1) {
;stmt0:
  %4 = icmp ne %Type* %0, zeroinitializer
  %5 = bitcast [26 x %Nat8]* @func341_str1 to %Str
  call void (i1, %Str) @assert (i1 %4, %Str %5)
;stmt1:
  %6 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 1
  %7 = load %Str, %Str* %6
  %8 = icmp ne %Str %7, zeroinitializer
  %9 = and i1 %1, %8
  br i1 %9, label %then_0, label %else_0
then_0:
;stmt2:
  %10 = load %FILE*, %FILE** @fout
  %11 = bitcast [5 x %Nat8]* @func341_str2 to %Str
  %12 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 1
  %13 = load %Str, %Str* %12
  %14 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %10, %Str %11, %Str %13)
;stmt3:
ret void
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt4:
  %16 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 0
  %17 = load %TypeKind, %TypeKind* %16
  br label %select_1_0
select_1_0:
  %18 = icmp eq %TypeKind %17, 4
  br i1 %18, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %19 = load %FILE*, %FILE** @fout
  %20 = bitcast [5 x %Nat8]* @func341_str3 to %Str
  %21 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 1
  %22 = load %Str, %Str* %21
  %23 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %19, %Str %20, %Str %22)
  br label %select_1_end
select_1_1:
  %24 = icmp eq %TypeKind %17, 5
  br i1 %24, label %select_1_1_ok, label %select_1_2
select_1_1_ok:
  call void (%Type*) @func342 (%Type* %0)
  br label %select_1_end
select_1_2:
  %25 = icmp eq %TypeKind %17, 8
  br i1 %25, label %select_1_2_ok, label %select_1_3
select_1_2_ok:
  %26 = load %FILE*, %FILE** @fout
  %27 = bitcast [4 x %Nat8]* @func341_str4 to %Str
  %28 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %26, %Str %27, %Int64 16)
  br label %select_1_end
select_1_3:
  %29 = icmp eq %TypeKind %17, 9
  br i1 %29, label %select_1_3_ok, label %select_1_4
select_1_3_ok:
  %30 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 9
  call void (%TypeRecord*) @func345 (%TypeRecord* %30)
  br label %select_1_end
select_1_4:
  %31 = icmp eq %TypeKind %17, 11
  br i1 %31, label %select_1_4_ok, label %select_1_5
select_1_4_ok:
  %32 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 7
  call void (%TypeArray*) @func347 (%TypeArray* %32)
  br label %select_1_end
select_1_5:
  %33 = icmp eq %TypeKind %17, 12
  br i1 %33, label %select_1_5_ok, label %select_1_6
select_1_5_ok:
  %34 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 8
  call void (%TypeArrayU*) @func348 (%TypeArrayU* %34)
  br label %select_1_end
select_1_6:
  %35 = icmp eq %TypeKind %17, 10
  br i1 %35, label %select_1_6_ok, label %select_1_7
select_1_6_ok:
  %36 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 6
  call void (%TypePointer*) @func349 (%TypePointer* %36)
  br label %select_1_end
select_1_7:
  %37 = icmp eq %TypeKind %17, 7
  br i1 %37, label %select_1_7_ok, label %select_1_8
select_1_7_ok:
  %38 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 5
  call void (%TypeFunc*, i1) @func350 (%TypeFunc* %38, i1 %2)
  br label %select_1_end
select_1_8:
  %39 = icmp eq %TypeKind %17, 6
  br i1 %39, label %select_1_8_ok, label %select_1_9
select_1_8_ok:
  %40 = bitcast [3 x %Nat8]* @func341_str5 to %Str
  call void (%Str) @o (%Str %40)
  br label %select_1_end
select_1_9:
  call void (%Type*) @func343 (%Type* %0)
  br label %select_1_end
select_1_end:
  ret void
}

define void @func344 (%Type*) {
;stmt0:
  call void (%Type*, i1, i1) @func341 (%Type* %0, i1 1, i1 1)
  ret void
}

define void @func346 (%Unit*, %Unit*, %Nat32) {
;stmt0:
  %4 = icmp ugt %Nat32 %2, 0
  br i1 %4, label %then_0, label %else_0
then_0:
;stmt1:
  call void () @comma ()
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt2:
  %5 = bitcast %Unit* %0 to %Decl*
;stmt3:
  %6 = getelementptr inbounds %Decl, %Decl* %5, i1 0, i32 1
  %7 = load %Type*, %Type** %6
  call void (%Type*) @func344 (%Type* %7)
  ret void
}

define void @func345 (%TypeRecord*) {
;stmt0:
  %2 = bitcast [2 x %Nat8]* @func345_str1 to %Str
  call void (%Str) @o (%Str %2)
;stmt1:
  %3 = getelementptr inbounds %TypeRecord, %TypeRecord* %0, i1 0, i32 0
  %4 = load %List*, %List** %3
  call void (%List*, %ListForeachHandler, %Unit*) @func59 (%List* %4, %ListForeachHandler @func346, %Unit* zeroinitializer)
;stmt2:
  %5 = bitcast [2 x %Nat8]* @func345_str2 to %Str
  call void (%Str) @o (%Str %5)
  ret void
}

define void @func347 (%TypeArray*) {
;stmt0:
  %2 = load %FILE*, %FILE** @fout
  %3 = bitcast [7 x %Nat8]* @func347_str1 to %Str
  %4 = getelementptr inbounds %TypeArray, %TypeArray* %0, i1 0, i32 1
  %5 = load %Nat32, %Nat32* %4
  %6 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %2, %Str %3, %Nat32 %5)
;stmt1:
  %7 = getelementptr inbounds %TypeArray, %TypeArray* %0, i1 0, i32 0
  %8 = load %Type*, %Type** %7
  call void (%Type*) @func344 (%Type* %8)
;stmt2:
  %9 = bitcast [2 x %Nat8]* @func347_str2 to %Str
  call void (%Str) @o (%Str %9)
  ret void
}

define void @func348 (%TypeArrayU*) {
;stmt0:
  %2 = getelementptr inbounds %TypeArrayU, %TypeArrayU* %0, i1 0, i32 0
  %3 = load %Type*, %Type** %2
  call void (%Type*) @func344 (%Type* %3)
;stmt1:
  %4 = bitcast [2 x %Nat8]* @func348_str1 to %Str
  call void (%Str) @o (%Str %4)
  ret void
}

define void @func349 (%TypePointer*) {
;stmt0:
  %2 = getelementptr inbounds %TypePointer, %TypePointer* %0, i1 0, i32 0
  %3 = load %Type*, %Type** %2
  call void (%Type*) @func344 (%Type* %3)
;stmt1:
  %4 = bitcast [2 x %Nat8]* @func349_str1 to %Str
  call void (%Str) @o (%Str %4)
  ret void
}

define void @func351 (%Unit*, %Unit*, %Nat32) {
;stmt0:
  %4 = icmp ugt %Nat32 %2, 0
  br i1 %4, label %then_0, label %else_0
then_0:
;stmt1:
  call void () @comma ()
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt2:
  %5 = bitcast %Unit* %0 to %Decl*
  %6 = getelementptr inbounds %Decl, %Decl* %5, i1 0, i32 1
  %7 = load %Type*, %Type** %6
  call void (%Type*) @func344 (%Type* %7)
  ret void
}

define void @func350 (%TypeFunc*, i1) {
;stmt0:
  %3 = getelementptr inbounds %TypeFunc, %TypeFunc* %0, i1 0, i32 1
  %4 = load %Type*, %Type** %3
  %5 = load %Type*, %Type** @typeUnit
  %6 = call i1 (%Type*, %Type*) @func391 (%Type* %4, %Type* %5)
  br i1 %6, label %then_0, label %else_0
then_0:
;stmt1:
  %7 = bitcast [5 x %Nat8]* @func350_str1 to %Str
  call void (%Str) @o (%Str %7)
  br label %endif_0
else_0:
;stmt2:
  %8 = getelementptr inbounds %TypeFunc, %TypeFunc* %0, i1 0, i32 1
  %9 = load %Type*, %Type** %8
  call void (%Type*) @func344 (%Type* %9)
  br label %endif_0
endif_0:
;stmt3:
  %10 = getelementptr inbounds %TypeFunc, %TypeFunc* %0, i1 0, i32 0
  %11 = load %Type*, %Type** %10
  %12 = getelementptr inbounds %Type, %Type* %11, i1 0, i32 9
  %13 = getelementptr inbounds %TypeRecord, %TypeRecord* %12, i1 0, i32 0
  %14 = load %List*, %List** %13
;stmt4:
  %15 = bitcast [3 x %Nat8]* @func350_str2 to %Str
  call void (%Str) @o (%Str %15)
;stmt5:
  call void (%List*, %ListForeachHandler, %Unit*) @func59 (%List* %14, %ListForeachHandler @func351, %Unit* zeroinitializer)
;stmt6:
  %16 = getelementptr inbounds %TypeFunc, %TypeFunc* %0, i1 0, i32 2
  %17 = load i1, i1* %16
  br i1 %17, label %then_1, label %else_1
then_1:
;stmt7:
  %18 = bitcast [6 x %Nat8]* @func350_str3 to %Str
  call void (%Str) @o (%Str %18)
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt8:
  %19 = bitcast [2 x %Nat8]* @func350_str4 to %Str
  call void (%Str) @o (%Str %19)
;stmt9:
  br i1 %1, label %then_2, label %else_2
then_2:
;stmt10:
  %20 = bitcast [2 x %Nat8]* @func350_str5 to %Str
  call void (%Str) @o (%Str %20)
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
  ret void
}

define %Type* @func352 (%TypeKind, %Nat32, %TokenInfo*) {
;stmt0:
  %4 = call %Unit* (%Nat32) @malloc (%Nat32 136)
  %5 = bitcast %Unit* %4 to %Type*
;stmt1:
  %6 = icmp ne %Type* %5, zeroinitializer
  %7 = bitcast [9 x %Nat8]* @func352_str1 to %Str
  call void (i1, %Str) @assert (i1 %6, %Str %7)
;stmt2:
  %8 = bitcast %Type* %5 to %Unit*
  %9 = call %Unit* (%Unit*, %Nat8, %Nat32) @memset (%Unit* %8, %Nat8 0, %Nat32 136)
;stmt3:
  %10 = getelementptr inbounds %Type, %Type* %5, i1 0, i32 0
  store %TypeKind %0, %TypeKind* %10, align 2
;stmt4:
  %11 = getelementptr inbounds %Type, %Type* %5, i1 0, i32 2
  store %Nat32 %1, %Nat32* %11, align 4
;stmt5:
  %12 = getelementptr inbounds %Type, %Type* %5, i1 0, i32 3
  store %Nat32 %1, %Nat32* %12, align 4
;stmt6:
  %13 = getelementptr inbounds %Type, %Type* %5, i1 0, i32 12
  store %TokenInfo* %2, %TokenInfo** %13, align 8
;stmt7:
  ret %Type* %5
}

define %Type* @type_var_new (%Type*, %TokenInfo*) {
;stmt0:
  %3 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 2
  %4 = load %Nat32, %Nat32* %3
  %5 = call %Type* (%TypeKind, %Nat32, %TokenInfo*) @func352 (%TypeKind 5, %Nat32 %4, %TokenInfo* %1)
;stmt1:
  %6 = getelementptr inbounds %Type, %Type* %5, i1 0, i32 3
  %7 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 3
  %8 = load %Nat32, %Nat32* %7
  store %Nat32 %8, %Nat32* %6, align 4
;stmt2:
  %9 = getelementptr inbounds %Type, %Type* %5, i1 0, i32 11
  %10 = getelementptr inbounds %TypeVar, %TypeVar* %9, i1 0, i32 0
  store %Type* %0, %Type** %10, align 8
;stmt3:
  ret %Type* %5
}

define %Type* @func354 (%Type*, %TokenInfo*) {
;stmt0:
  %3 = call %Type* (%TypeKind, %Nat32, %TokenInfo*) @func352 (%TypeKind 10, %Nat32 8, %TokenInfo* %1)
;stmt1:
  %4 = getelementptr inbounds %Type, %Type* %3, i1 0, i32 6
  %5 = getelementptr inbounds %TypePointer, %TypePointer* %4, i1 0, i32 0
  store %Type* %0, %Type** %5, align 8
;stmt2:
  ret %Type* %3
}

define %Type* @func355 (%Type*, %TokenInfo*) {
;stmt0:
  %3 = call %Type* (%TypeKind, %Nat32, %TokenInfo*) @func352 (%TypeKind 12, %Nat32 8, %TokenInfo* %1)
;stmt1:
  %4 = getelementptr inbounds %Type, %Type* %3, i1 0, i32 8
  %5 = getelementptr inbounds %TypeArrayU, %TypeArrayU* %4, i1 0, i32 0
  store %Type* %0, %Type** %5, align 8
;stmt2:
  ret %Type* %3
}

define %Type* @func356 (%Type*, %Nat32, %TokenInfo*) {
;stmt0:
  %4 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 2
  %5 = load %Nat32, %Nat32* %4
  %6 = mul %Nat32 %1, %5
;stmt1:
  %7 = call %Type* (%TypeKind, %Nat32, %TokenInfo*) @func352 (%TypeKind 11, %Nat32 %6, %TokenInfo* %2)
;stmt2:
  %8 = getelementptr inbounds %Type, %Type* %7, i1 0, i32 3
  %9 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 3
  %10 = load %Nat32, %Nat32* %9
  store %Nat32 %10, %Nat32* %8, align 4
;stmt3:
  %11 = getelementptr inbounds %Type, %Type* %7, i1 0, i32 7
  %12 = getelementptr inbounds %TypeArray, %TypeArray* %11, i1 0, i32 0
  store %Type* %0, %Type** %12, align 8
;stmt4:
  %13 = getelementptr inbounds %Type, %Type* %7, i1 0, i32 7
  %14 = getelementptr inbounds %TypeArray, %TypeArray* %13, i1 0, i32 1
  store %Nat32 %1, %Nat32* %14, align 4
;stmt5:
  ret %Type* %7
}

define void @func358 (%Unit*, %Unit*, %Nat32) {
;stmt0:
  %4 = bitcast %Unit* %0 to %EnumConstructor*
;stmt1:
  %5 = bitcast %Unit* %1 to %Type*
;stmt2:
  %6 = getelementptr inbounds %EnumConstructor, %EnumConstructor* %4, i1 0, i32 1
  %7 = load %Nat32, %Nat32* %6
  %8 = sext %Nat32 %7 to %Int64
  %9 = getelementptr inbounds %EnumConstructor, %EnumConstructor* %4, i1 0, i32 2
  %10 = load %TokenInfo*, %TokenInfo** %9
  %11 = call %Value* (%Type*, %Int64, %TokenInfo*) @func398 (%Type* %5, %Int64 %8, %TokenInfo* %10)
;stmt3:
  %12 = load %Module*, %Module** @module
  %13 = getelementptr inbounds %Module, %Module* %12, i1 0, i32 0
  %14 = getelementptr inbounds %EnumConstructor, %EnumConstructor* %4, i1 0, i32 0
  %15 = load %AstId*, %AstId** %14
  %16 = getelementptr inbounds %AstId, %AstId* %15, i1 0, i32 0
  %17 = load %Str, %Str* %16
  call void (%Index*, %Str, %Value*) @func134 (%Index* %13, %Str %17, %Value* %11)
  ret void
}

define %Type* @func357 (%List*, %TokenInfo*) {
;stmt0:
  %3 = call %Type* (%TypeKind, %Nat32, %TokenInfo*) @func352 (%TypeKind 8, %Nat32 2, %TokenInfo* %1)
;stmt1:
  %4 = bitcast %Type* %3 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @func59 (%List* %0, %ListForeachHandler @func358, %Unit* %4)
;stmt2:
  ret %Type* %3
}

define %Type* @func359 (%Type*, %Type*, i1, %TokenInfo*) {
;stmt0:
  %5 = call %Type* (%TypeKind, %Nat32, %TokenInfo*) @func352 (%TypeKind 7, %Nat32 8, %TokenInfo* %3)
;stmt1:
  %6 = getelementptr inbounds %Type, %Type* %5, i1 0, i32 5
  %7 = getelementptr inbounds %TypeFunc, %TypeFunc* %6, i1 0, i32 0
  store %Type* %0, %Type** %7, align 8
;stmt2:
  %8 = getelementptr inbounds %Type, %Type* %5, i1 0, i32 5
  %9 = getelementptr inbounds %TypeFunc, %TypeFunc* %8, i1 0, i32 1
  store %Type* %1, %Type** %9, align 8
;stmt3:
  %10 = getelementptr inbounds %Type, %Type* %5, i1 0, i32 5
  %11 = getelementptr inbounds %TypeFunc, %TypeFunc* %10, i1 0, i32 2
  store i1 %2, i1* %11, align 1
;stmt4:
  ret %Type* %5
}

define i1 @func361 (%Unit*, %Unit*, %Nat32) {
;stmt0:
  %4 = bitcast %Unit* %0 to %Decl*
;stmt1:
  %5 = bitcast %Unit* %1 to %Str
;stmt2:
  %6 = getelementptr inbounds %Decl, %Decl* %4, i1 0, i32 0
  %7 = load %AstId*, %AstId** %6
  %8 = getelementptr inbounds %AstId, %AstId* %7, i1 0, i32 0
  %9 = load %Str, %Str* %8
  %10 = call %Int32 (%Str, %Str) @strcmp (%Str %9, %Str %5)
  %11 = icmp eq %Int32 %10, 0
  ret i1 %11
}

define %Decl* @func360 (%Type*, %Str) {
;stmt0:
  %3 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 9
  %4 = getelementptr inbounds %TypeRecord, %TypeRecord* %3, i1 0, i32 0
  %5 = load %List*, %List** %4
  %6 = bitcast %Str %1 to %Unit*
  %7 = call %Unit* (%List*, %ListSearchHandler, %Unit*) @list_search (%List* %5, %ListSearchHandler @func361, %Unit* %6)
  %8 = bitcast %Unit* %7 to %Decl*
  ret %Decl* %8
}

define i1 @func362 (%Type*) {
;stmt0:
  %2 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 0
  %3 = load %TypeKind, %TypeKind* %2
;stmt1:
  %4 = icmp eq %TypeKind %3, 3
  %5 = icmp eq %TypeKind %3, 10
  %6 = icmp eq %TypeKind %3, 7
  %7 = call i1 (%Type*) @func365 (%Type* %0)
  %8 = or i1 %6, %7
  %9 = or i1 %5, %8
  %10 = or i1 %4, %9
  ret i1 %10
}

define i1 @func363 (%Type*) {
;stmt0:
  %2 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 0
  %3 = load %TypeKind, %TypeKind* %2
  %4 = icmp eq %TypeKind %3, 11
  ret i1 %4
}

define i1 @func364 (%Type*) {
;stmt0:
  %2 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 0
  %3 = load %TypeKind, %TypeKind* %2
  %4 = icmp ne %TypeKind %3, 10
  br i1 %4, label %then_0, label %else_0
then_0:
;stmt1:
  ret i1 0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt2:
  %6 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 6
  %7 = getelementptr inbounds %TypePointer, %TypePointer* %6, i1 0, i32 0
  %8 = load %Type*, %Type** %7
  %9 = call i1 (%Type*) @func363 (%Type* %8)
  ret i1 %9
}

define i1 @func365 (%Type*) {
;stmt0:
  %2 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 0
  %3 = load %TypeKind, %TypeKind* %2
  %4 = icmp eq %TypeKind %3, 12
  ret i1 %4
}

define i1 @type_is_generic_num (%Type*) {
;stmt0:
  %2 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 0
  %3 = load %TypeKind, %TypeKind* %2
  %4 = icmp ne %TypeKind %3, 4
  br i1 %4, label %then_0, label %else_0
then_0:
;stmt1:
  ret i1 0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt2:
  %6 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 4
  %7 = getelementptr inbounds %TypeNumeric, %TypeNumeric* %6, i1 0, i32 0
  %8 = load %Nat32, %Nat32* %7
  %9 = icmp eq %Nat32 %8, 0
  ret i1 %9
}

define i1 @func367 (%Type*) {
;stmt0:
  %2 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 0
  %3 = load %TypeKind, %TypeKind* %2
  %4 = icmp ne %TypeKind %3, 4
  br i1 %4, label %then_0, label %else_0
then_0:
;stmt1:
  ret i1 0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt2:
  %6 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 4
  %7 = getelementptr inbounds %TypeNumeric, %TypeNumeric* %6, i1 0, i32 0
  %8 = load %Nat32, %Nat32* %7
  %9 = icmp ugt %Nat32 %8, 0
  ret i1 %9
}

define i1 @func368 (%Type*) {
;stmt0:
  %2 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 0
  %3 = load %TypeKind, %TypeKind* %2
  %4 = icmp eq %TypeKind %3, 9
  ret i1 %4
}

define i1 @func369 (%Type*) {
;stmt0:
  %2 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 0
  %3 = load %TypeKind, %TypeKind* %2
  %4 = icmp ne %TypeKind %3, 10
  br i1 %4, label %then_0, label %else_0
then_0:
;stmt1:
  ret i1 0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt2:
  %6 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 6
  %7 = getelementptr inbounds %TypePointer, %TypePointer* %6, i1 0, i32 0
  %8 = load %Type*, %Type** %7
  %9 = call i1 (%Type*) @func368 (%Type* %8)
  ret i1 %9
}

define i1 @typeIsPointerToUnit (%Type*) {
;stmt0:
  %2 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 0
  %3 = load %TypeKind, %TypeKind* %2
  %4 = icmp ne %TypeKind %3, 10
  br i1 %4, label %then_0, label %else_0
then_0:
;stmt1:
  ret i1 0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt2:
  %6 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 6
  %7 = getelementptr inbounds %TypePointer, %TypePointer* %6, i1 0, i32 0
  %8 = load %Type*, %Type** %7
  %9 = load %Type*, %Type** @typeUnit
  %10 = call i1 (%Type*, %Type*) @func391 (%Type* %8, %Type* %9)
  ret i1 %10
}

define %Type* @func371 (%AstType*) {
;stmt0:
  %2 = getelementptr inbounds %AstType, %AstType* %0, i1 0, i32 0
  %3 = load %AstTypeKind, %AstTypeKind* %2
  br label %select_1_0
select_1_0:
  %4 = icmp eq %AstTypeKind %3, 1
  br i1 %4, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %5 = call %Type* (%AstType*) @func373 (%AstType* %0)
  br label %select_1_end
select_1_1:
  %6 = icmp eq %AstTypeKind %3, 6
  br i1 %6, label %select_1_1_ok, label %select_1_2
select_1_1_ok:
  %7 = call %Type* (%AstType*) @func374 (%AstType* %0)
  br label %select_1_end
select_1_2:
  %8 = icmp eq %AstTypeKind %3, 8
  br i1 %8, label %select_1_2_ok, label %select_1_3
select_1_2_ok:
  %9 = call %Type* (%AstType*) @func372 (%AstType* %0)
  br label %select_1_end
select_1_3:
  %10 = icmp eq %AstTypeKind %3, 4
  br i1 %10, label %select_1_3_ok, label %select_1_4
select_1_3_ok:
  %11 = call %Type* (%AstType*) @func376 (%AstType* %0)
  br label %select_1_end
select_1_4:
  %12 = icmp eq %AstTypeKind %3, 5
  br i1 %12, label %select_1_4_ok, label %select_1_5
select_1_4_ok:
  %13 = call %Type* (%AstType*) @func375 (%AstType* %0)
  br label %select_1_end
select_1_5:
  %14 = icmp eq %AstTypeKind %3, 7
  br i1 %14, label %select_1_5_ok, label %select_1_6
select_1_5_ok:
  %15 = call %Type* (%AstType*) @func377 (%AstType* %0)
  br label %select_1_end
select_1_6:
  %16 = icmp eq %AstTypeKind %3, 2
  br i1 %16, label %select_1_6_ok, label %select_1_7
select_1_6_ok:
  %17 = call %Type* (%AstType*) @func384 (%AstType* %0)
  br label %select_1_end
select_1_7:
  %18 = icmp eq %AstTypeKind %3, 3
  br i1 %18, label %select_1_7_ok, label %select_1_8
select_1_7_ok:
  %19 = call %Type* (%AstType*) @func379 (%AstType* %0)
  br label %select_1_end
select_1_8:
  %20 = getelementptr inbounds %AstType, %AstType* %0, i1 0, i32 9
  %21 = load %TokenInfo*, %TokenInfo** %20
  %22 = call %Type* (%TypeKind, %Nat32, %TokenInfo*) @func352 (%TypeKind 2, %Nat32 0, %TokenInfo* %21)
  br label %select_1_end
select_1_end:
  %23 = phi %Type* [ %5, %select_1_0_ok ], [ %7, %select_1_1_ok ], [ %9, %select_1_2_ok ], [ %11, %select_1_3_ok ], [ %13, %select_1_4_ok ], [ %15, %select_1_5_ok ], [ %17, %select_1_6_ok ], [ %19, %select_1_7_ok ], [ %22, %select_1_8 ]
  ret %Type* %23
}

define %Type* @func372 (%AstType*) {
;stmt0:
  %2 = getelementptr inbounds %AstType, %AstType* %0, i1 0, i32 8
  %3 = getelementptr inbounds %AstTypeVar, %AstTypeVar* %2, i1 0, i32 0
  %4 = load %AstType*, %AstType** %3
  %5 = call %Type* (%AstType*) @func371 (%AstType* %4)
;stmt1:
  %6 = getelementptr inbounds %AstType, %AstType* %0, i1 0, i32 9
  %7 = load %TokenInfo*, %TokenInfo** %6
  %8 = call %Type* (%Type*, %TokenInfo*) @type_var_new (%Type* %5, %TokenInfo* %7)
  ret %Type* %8
}

define %Type* @func373 (%AstType*) {
;stmt0:
  %2 = getelementptr inbounds %AstType, %AstType* %0, i1 0, i32 1
  %3 = getelementptr inbounds %AstName, %AstName* %2, i1 0, i32 0
  %4 = load %AstId*, %AstId** %3
  %5 = getelementptr inbounds %AstId, %AstId* %4, i1 0, i32 0
  %6 = load %Str, %Str* %5
;stmt1:
  %7 = call %Type* (%Str) @func140 (%Str %6)
;stmt2:
  %8 = icmp eq %Type* %7, zeroinitializer
  br i1 %8, label %then_0, label %else_0
then_0:
;stmt3:
  %9 = getelementptr inbounds %AstType, %AstType* %0, i1 0, i32 9
  %10 = load %TokenInfo*, %TokenInfo** %9
  %11 = call %Type* (%TypeKind, %Nat32, %TokenInfo*) @func352 (%TypeKind 1, %Nat32 0, %TokenInfo* %10)
;stmt4:
  %12 = getelementptr inbounds %Type, %Type* %11, i1 0, i32 12
  %13 = getelementptr inbounds %AstType, %AstType* %0, i1 0, i32 1
  %14 = getelementptr inbounds %AstName, %AstName* %13, i1 0, i32 2
  %15 = load %TokenInfo*, %TokenInfo** %14
  store %TokenInfo* %15, %TokenInfo** %12, align 8
;stmt5:
  %16 = load %Module*, %Module** @module
  %17 = getelementptr inbounds %Module, %Module* %16, i1 0, i32 1
  call void (%Index*, %Str, %Type*) @func138 (%Index* %17, %Str %6, %Type* %11)
;stmt6:
  ret %Type* %11
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt7:
  ret %Type* %7
}

define %Type* @func374 (%AstType*) {
;stmt0:
  %2 = getelementptr inbounds %AstType, %AstType* %0, i1 0, i32 7
  %3 = getelementptr inbounds %AstTypeFunc, %AstTypeFunc* %2, i1 0, i32 0
  %4 = load %AstType*, %AstType** %3
  %5 = call %Type* (%AstType*) @func371 (%AstType* %4)
;stmt1:
  %6 = getelementptr inbounds %Type, %Type* %5, i1 0, i32 0
  %7 = load %TypeKind, %TypeKind* %6
  %8 = icmp eq %TypeKind %7, 2
  br i1 %8, label %then_0, label %else_0
then_0:
;stmt2:
  ret %Type* %5
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt3:
  %10 = getelementptr inbounds %AstType, %AstType* %0, i1 0, i32 7
  %11 = getelementptr inbounds %AstTypeFunc, %AstTypeFunc* %10, i1 0, i32 1
  %12 = load %AstType*, %AstType** %11
  %13 = call %Type* (%AstType*) @func371 (%AstType* %12)
;stmt4:
  %14 = getelementptr inbounds %Type, %Type* %13, i1 0, i32 0
  %15 = load %TypeKind, %TypeKind* %14
  %16 = icmp eq %TypeKind %15, 2
  br i1 %16, label %then_1, label %else_1
then_1:
;stmt5:
  ret %Type* %13
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt6:
  %18 = getelementptr inbounds %AstType, %AstType* %0, i1 0, i32 9
  %19 = load %TokenInfo*, %TokenInfo** %18
  %20 = call %Type* (%Type*, %Type*, i1, %TokenInfo*) @func359 (%Type* %5, %Type* %13, i1 0, %TokenInfo* %19)
  ret %Type* %20
}

define %Type* @func375 (%AstType*) {
;stmt0:
  %2 = getelementptr inbounds %AstType, %AstType* %0, i1 0, i32 4
  %3 = getelementptr inbounds %AstTypeArrayU, %AstTypeArrayU* %2, i1 0, i32 0
  %4 = load %AstType*, %AstType** %3
  %5 = call %Type* (%AstType*) @func371 (%AstType* %4)
;stmt1:
  %6 = getelementptr inbounds %Type, %Type* %5, i1 0, i32 0
  %7 = load %TypeKind, %TypeKind* %6
  %8 = icmp eq %TypeKind %7, 2
  br i1 %8, label %then_0, label %else_0
then_0:
;stmt2:
  ret %Type* %5
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt3:
  %10 = getelementptr inbounds %AstType, %AstType* %0, i1 0, i32 9
  %11 = load %TokenInfo*, %TokenInfo** %10
  %12 = call %Type* (%Type*, %TokenInfo*) @func355 (%Type* %5, %TokenInfo* %11)
  ret %Type* %12
}

define %Type* @func376 (%AstType*) {
;stmt0:
  %2 = getelementptr inbounds %AstType, %AstType* %0, i1 0, i32 3
  %3 = getelementptr inbounds %AstTypeArray, %AstTypeArray* %2, i1 0, i32 0
  %4 = load %AstType*, %AstType** %3
  %5 = call %Type* (%AstType*) @func371 (%AstType* %4)
;stmt1:
  %6 = getelementptr inbounds %Type, %Type* %5, i1 0, i32 0
  %7 = load %TypeKind, %TypeKind* %6
  %8 = icmp eq %TypeKind %7, 2
  br i1 %8, label %then_0, label %else_0
then_0:
;stmt2:
  ret %Type* %5
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt3:
  %10 = getelementptr inbounds %AstType, %AstType* %0, i1 0, i32 3
  %11 = getelementptr inbounds %AstTypeArray, %AstTypeArray* %10, i1 0, i32 1
  %12 = load %AstValue*, %AstValue** %11
  %13 = call %Value* (%AstValue*, i1) @func401 (%AstValue* %12, i1 0)
;stmt4:
  %14 = getelementptr inbounds %Value, %Value* %13, i1 0, i32 0
  %15 = load %ValueKind, %ValueKind* %14
  %16 = icmp eq %ValueKind %15, 1
  br i1 %16, label %then_1, label %else_1
then_1:
;stmt5:
  %17 = getelementptr inbounds %AstType, %AstType* %0, i1 0, i32 9
  %18 = load %TokenInfo*, %TokenInfo** %17
  %19 = call %Type* (%TypeKind, %Nat32, %TokenInfo*) @func352 (%TypeKind 2, %Nat32 0, %TokenInfo* %18)
  ret %Type* %19
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt6:
  %21 = getelementptr inbounds %Value, %Value* %13, i1 0, i32 2
  %22 = load %Int64, %Int64* %21
  %23 = trunc %Int64 %22 to %Nat32
  %24 = getelementptr inbounds %AstType, %AstType* %0, i1 0, i32 9
  %25 = load %TokenInfo*, %TokenInfo** %24
  %26 = call %Type* (%Type*, %Nat32, %TokenInfo*) @func356 (%Type* %5, %Nat32 %23, %TokenInfo* %25)
  ret %Type* %26
}

define %Type* @func377 (%AstType*) {
;stmt0:
  %2 = getelementptr inbounds %AstType, %AstType* %0, i1 0, i32 5
  %3 = getelementptr inbounds %AstTypePointer, %AstTypePointer* %2, i1 0, i32 0
  %4 = load %AstType*, %AstType** %3
  %5 = call %Type* (%AstType*) @func371 (%AstType* %4)
;stmt1:
  %6 = getelementptr inbounds %Type, %Type* %5, i1 0, i32 0
  %7 = load %TypeKind, %TypeKind* %6
  %8 = icmp eq %TypeKind %7, 2
  br i1 %8, label %then_0, label %else_0
then_0:
;stmt2:
  ret %Type* %5
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt3:
  %10 = getelementptr inbounds %AstType, %AstType* %0, i1 0, i32 9
  %11 = load %TokenInfo*, %TokenInfo** %10
  %12 = call %Type* (%Type*, %TokenInfo*) @func354 (%Type* %5, %TokenInfo* %11)
  ret %Type* %12
}

define %Nat32 @align (%Nat32, %Nat32) {
;stmt0:
  %3 = icmp ne %Nat32 %1, 0
  %4 = bitcast [20 x %Nat8]* @func378_str1 to %Str
  call void (i1, %Str) @assert (i1 %3, %Str %4)
;stmt1:
  %5 = urem %Nat32 %0, %1
;stmt2:
  br label %select_1_0
select_1_0:
  %6 = icmp eq %Nat32 %5, 0
  br i1 %6, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  br label %select_1_end
select_1_1:
  %7 = sub %Nat32 %1, %5
  %8 = add %Nat32 %0, %7
  br label %select_1_end
select_1_end:
  %9 = phi %Nat32 [ %0, %select_1_0_ok ], [ %8, %select_1_1 ]
  ret %Nat32 %9
}

define %Decl* @func382 (%AstId*, %Type*, %TokenInfo*) {
;stmt0:
  %4 = call %Unit* (%Nat32) @malloc (%Nat32 48)
  %5 = bitcast %Unit* %4 to %Decl*
;stmt1:
  %6 = icmp ne %Decl* %5, zeroinitializer
  %7 = bitcast [10 x %Nat8]* @func379_func380_func381_func382_str1 to %Str
  call void (i1, %Str) @assert (i1 %6, %Str %7)
;stmt2:
  %8 = getelementptr inbounds %Decl, %Decl* %5, i1 0, i32 0
  store %AstId* %0, %AstId** %8, align 8
;stmt3:
  %9 = getelementptr inbounds %Decl, %Decl* %5, i1 0, i32 1
  store %Type* %1, %Type** %9, align 8
;stmt4:
  %10 = getelementptr inbounds %Decl, %Decl* %5, i1 0, i32 3
  store %Nat16 0, %Nat16* %10, align 2
;stmt5:
  %11 = getelementptr inbounds %Decl, %Decl* %5, i1 0, i32 2
  %12 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 3
  %13 = load %Nat32, %Nat32* %12
  store %Nat32 %13, %Nat32* %11, align 4
;stmt6:
  %14 = getelementptr inbounds %Decl, %Decl* %5, i1 0, i32 6
  store %TokenInfo* %2, %TokenInfo** %14, align 8
;stmt7:
  ret %Decl* %5
}

define void @func381 (%Unit*, %Unit*, %Nat32) {
;stmt0:
  %4 = bitcast %Unit* %0 to %AstId*
;stmt1:
  %5 = bitcast %Unit* %1 to %func379_func380.type4*
;stmt2:
  %6 = getelementptr inbounds %func379_func380.type4, %func379_func380.type4* %5, i1 0, i32 1
  %7 = load %Type*, %Type** %6
  %8 = getelementptr inbounds %AstId, %AstId* %4, i1 0, i32 1
  %9 = load %TokenInfo*, %TokenInfo** %8
  %10 = call %Decl* (%AstId*, %Type*, %TokenInfo*) @func382 (%AstId* %4, %Type* %7, %TokenInfo* %9)
;stmt3:
  %11 = getelementptr inbounds %func379_func380.type4, %func379_func380.type4* %5, i1 0, i32 0
  %12 = load %List*, %List** %11
  %13 = bitcast %Decl* %10 to %Unit*
  %14 = call i1 (%List*, %Unit*) @list_append (%List* %12, %Unit* %13)
  ret void
}

define void @func380 (%Unit*, %Unit*, %Nat32) {
;stmt0:
  %4 = bitcast %Unit* %0 to %AstDecl*
;stmt1:
  %5 = bitcast %Unit* %1 to %func379.type3*
;stmt2:
  %6 = getelementptr inbounds %AstDecl, %AstDecl* %4, i1 0, i32 1
  %7 = load %AstType*, %AstType** %6
  %8 = call %Type* (%AstType*) @func371 (%AstType* %7)
;stmt3:
  %9 = getelementptr inbounds %Type, %Type* %8, i1 0, i32 0
  %10 = load %TypeKind, %TypeKind* %9
  %11 = icmp eq %TypeKind %10, 2
  br i1 %11, label %then_0, label %else_0
then_0:
;stmt4:
  %12 = bitcast [14 x %Nat8]* @func379_func380_str1 to %Str
  %13 = getelementptr inbounds %Type, %Type* %8, i1 0, i32 12
  %14 = load %TokenInfo*, %TokenInfo** %13
  call void (%Str, %TokenInfo*) @error (%Str %12, %TokenInfo* %14)
;stmt5:
  %15 = getelementptr inbounds %func379.type3, %func379.type3* %5, i1 0, i32 1
  store i1 1, i1* %15, align 1
;stmt6:
ret void
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt7:
  %17 = alloca %func379_func380.type4
  store %func379_func380.type4 zeroinitializer, %func379_func380.type4* %17, align 8
;stmt8:
  %18 = getelementptr inbounds %func379_func380.type4, %func379_func380.type4* %17, i1 0, i32 0
  %19 = getelementptr inbounds %func379.type3, %func379.type3* %5, i1 0, i32 0
  %20 = load %List*, %List** %19
  store %List* %20, %List** %18, align 8
;stmt9:
  %21 = getelementptr inbounds %func379_func380.type4, %func379_func380.type4* %17, i1 0, i32 1
  store %Type* %8, %Type** %21, align 8
;stmt10:
  %22 = getelementptr inbounds %AstDecl, %AstDecl* %4, i1 0, i32 0
  %23 = getelementptr inbounds %func379_func380.type4, %func379_func380.type4* %17, i1 0
  %24 = bitcast %func379_func380.type4* %23 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @func59 (%List* %22, %ListForeachHandler @func381, %Unit* %24)
  ret void
}

define void @func383 (%Unit*, %Unit*, %Nat32) {
;stmt0:
  %4 = bitcast %Unit* %0 to %Decl*
;stmt1:
  %5 = getelementptr inbounds %Decl, %Decl* %4, i1 0, i32 1
  %6 = load %Type*, %Type** %5
  %7 = getelementptr inbounds %Type, %Type* %6, i1 0, i32 0
  %8 = load %TypeKind, %TypeKind* %7
  %9 = icmp eq %TypeKind %8, 1
  br i1 %9, label %then_0, label %else_0
then_0:
;stmt2:
  %10 = bitcast [15 x %Nat8]* @func379_func383_str1 to %Str
  %11 = getelementptr inbounds %Decl, %Decl* %4, i1 0, i32 1
  %12 = load %Type*, %Type** %11
  %13 = getelementptr inbounds %Type, %Type* %12, i1 0, i32 12
  %14 = load %TokenInfo*, %TokenInfo** %13
  call void (%Str, %TokenInfo*) @error (%Str %10, %TokenInfo* %14)
;stmt3:
ret void
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt4:
  %16 = bitcast %Unit* %1 to %Type*
;stmt5:
  %17 = getelementptr inbounds %Decl, %Decl* %4, i1 0, i32 3
  %18 = trunc %Nat32 %2 to %Nat16
  store %Nat16 %18, %Nat16* %17, align 2
;stmt6:
  %19 = getelementptr inbounds %Type, %Type* %16, i1 0, i32 3
  %20 = load %Nat32, %Nat32* %19
  %21 = getelementptr inbounds %Decl, %Decl* %4, i1 0, i32 1
  %22 = load %Type*, %Type** %21
  %23 = getelementptr inbounds %Type, %Type* %22, i1 0, i32 3
  %24 = load %Nat32, %Nat32* %23
  %25 = icmp ult %Nat32 %20, %24
  br i1 %25, label %then_1, label %else_1
then_1:
;stmt7:
  %26 = getelementptr inbounds %Type, %Type* %16, i1 0, i32 3
  %27 = getelementptr inbounds %Decl, %Decl* %4, i1 0, i32 1
  %28 = load %Type*, %Type** %27
  %29 = getelementptr inbounds %Type, %Type* %28, i1 0, i32 3
  %30 = load %Nat32, %Nat32* %29
  store %Nat32 %30, %Nat32* %26, align 4
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt8:
  %31 = getelementptr inbounds %Type, %Type* %16, i1 0, i32 2
  %32 = load %Nat32, %Nat32* %31
  %33 = getelementptr inbounds %Type, %Type* %16, i1 0, i32 9
  %34 = getelementptr inbounds %TypeRecord, %TypeRecord* %33, i1 0, i32 1
  %35 = load %Nat32, %Nat32* %34
  %36 = sub %Nat32 %32, %35
;stmt9:
  %37 = getelementptr inbounds %Decl, %Decl* %4, i1 0, i32 1
  %38 = load %Type*, %Type** %37
  %39 = getelementptr inbounds %Type, %Type* %38, i1 0, i32 3
  %40 = load %Nat32, %Nat32* %39
  %41 = icmp eq %Nat32 %40, 0
  br i1 %41, label %then_2, label %else_2
then_2:
;stmt10:
  %42 = bitcast [11 x %Nat8]* @func379_func383_str2 to %Str
  %43 = getelementptr inbounds %Decl, %Decl* %4, i1 0, i32 1
  %44 = load %Type*, %Type** %43
  %45 = getelementptr inbounds %Type, %Type* %44, i1 0, i32 12
  %46 = load %TokenInfo*, %TokenInfo** %45
  call void (%Str, %TokenInfo*) @error (%Str %42, %TokenInfo* %46)
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
;stmt11:
  %47 = getelementptr inbounds %Type, %Type* %16, i1 0, i32 9
  %48 = getelementptr inbounds %TypeRecord, %TypeRecord* %47, i1 0, i32 1
  %49 = load %Nat32, %Nat32* %48
  %50 = getelementptr inbounds %Decl, %Decl* %4, i1 0, i32 1
  %51 = load %Type*, %Type** %50
  %52 = getelementptr inbounds %Type, %Type* %51, i1 0, i32 3
  %53 = load %Nat32, %Nat32* %52
  %54 = call %Nat32 (%Nat32, %Nat32) @align (%Nat32 %49, %Nat32 %53)
;stmt12:
  %55 = getelementptr inbounds %Decl, %Decl* %4, i1 0, i32 1
  %56 = load %Type*, %Type** %55
  %57 = getelementptr inbounds %Type, %Type* %56, i1 0, i32 2
  %58 = load %Nat32, %Nat32* %57
  %59 = add %Nat32 %54, %58
;stmt13:
  %60 = getelementptr inbounds %Type, %Type* %16, i1 0, i32 9
  %61 = getelementptr inbounds %TypeRecord, %TypeRecord* %60, i1 0, i32 1
  store %Nat32 %59, %Nat32* %61, align 4
;stmt14:
  %62 = getelementptr inbounds %Type, %Type* %16, i1 0, i32 2
  %63 = load %Nat32, %Nat32* %62
  %64 = icmp ugt %Nat32 %59, %63
  br i1 %64, label %then_3, label %else_3
then_3:
;stmt15:
  %65 = getelementptr inbounds %Type, %Type* %16, i1 0, i32 2
  %66 = getelementptr inbounds %Type, %Type* %16, i1 0, i32 3
  %67 = load %Nat32, %Nat32* %66
  %68 = call %Nat32 (%Nat32, %Nat32) @align (%Nat32 %59, %Nat32 %67)
  store %Nat32 %68, %Nat32* %65, align 4
  br label %endif_3
else_3:
  br label %endif_3
endif_3:
  ret void
}

define %Type* @func379 (%AstType*) {
;stmt0:
  %2 = load %Type*, %Type** @ctype
;stmt1:
  %3 = getelementptr inbounds %AstType, %AstType* %0, i1 0, i32 9
  %4 = load %TokenInfo*, %TokenInfo** %3
  %5 = call %Type* (%TypeKind, %Nat32, %TokenInfo*) @func352 (%TypeKind 9, %Nat32 0, %TokenInfo* %4)
;stmt2:
  store %Type* %5, %Type** @ctype, align 8
;stmt3:
  %6 = alloca %func379.type3
  store %func379.type3 zeroinitializer, %func379.type3* %6, align 8
;stmt4:
  %7 = getelementptr inbounds %func379.type3, %func379.type3* %6, i1 0, i32 0
  %8 = call %List* () @map_new ()
  store %List* %8, %List** %7, align 8
;stmt5:
  %9 = getelementptr inbounds %func379.type3, %func379.type3* %6, i1 0, i32 1
  store i1 0, i1* %9, align 1
;stmt6:
  %10 = getelementptr inbounds %AstType, %AstType* %0, i1 0, i32 6
  %11 = getelementptr inbounds %AstTypeRecord, %AstTypeRecord* %10, i1 0, i32 0
  %12 = getelementptr inbounds %func379.type3, %func379.type3* %6, i1 0
  %13 = bitcast %func379.type3* %12 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @func59 (%List* %11, %ListForeachHandler @func380, %Unit* %13)
;stmt7:
  store %Type* %2, %Type** @ctype, align 8
;stmt8:
  %14 = getelementptr inbounds %Type, %Type* %5, i1 0, i32 9
  %15 = getelementptr inbounds %TypeRecord, %TypeRecord* %14, i1 0, i32 0
  %16 = getelementptr inbounds %func379.type3, %func379.type3* %6, i1 0, i32 0
  %17 = load %List*, %List** %16
  store %List* %17, %List** %15, align 8
;stmt9:
  %18 = getelementptr inbounds %Type, %Type* %5, i1 0, i32 9
  %19 = getelementptr inbounds %TypeRecord, %TypeRecord* %18, i1 0, i32 0
  %20 = load %List*, %List** %19
  %21 = bitcast %Type* %5 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @func59 (%List* %20, %ListForeachHandler @func383, %Unit* %21)
;stmt10:
  ret %Type* %5
}

define void @func385 (%Unit*, %Unit*, %Nat32) {
;stmt0:
  %4 = bitcast %Unit* %0 to %AstId*
;stmt1:
  %5 = bitcast %Unit* %1 to %List*
;stmt2:
  %6 = call %Unit* (%Nat32) @malloc (%Nat32 24)
  %7 = bitcast %Unit* %6 to %EnumConstructor*
;stmt3:
  %8 = getelementptr inbounds %EnumConstructor, %EnumConstructor* %7, i1 0, i32 0
  store %AstId* %4, %AstId** %8, align 8
;stmt4:
  %9 = getelementptr inbounds %EnumConstructor, %EnumConstructor* %7, i1 0, i32 1
  store %Nat32 %2, %Nat32* %9, align 4
;stmt5:
  %10 = getelementptr inbounds %EnumConstructor, %EnumConstructor* %7, i1 0, i32 2
  store %TokenInfo* zeroinitializer, %TokenInfo** %10, align 8
;stmt6:
  %11 = bitcast %EnumConstructor* %7 to %Unit*
  %12 = call i1 (%List*, %Unit*) @list_append (%List* %5, %Unit* %11)
  ret void
}

define %Type* @func384 (%AstType*) {
;stmt0:
  %2 = call %List* () @map_new ()
;stmt1:
  %3 = getelementptr inbounds %AstType, %AstType* %0, i1 0, i32 2
  %4 = getelementptr inbounds %AstTypeEnum, %AstTypeEnum* %3, i1 0, i32 0
  %5 = bitcast %List* %2 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @func59 (%List* %4, %ListForeachHandler @func385, %Unit* %5)
;stmt2:
  %6 = getelementptr inbounds %AstType, %AstType* %0, i1 0, i32 9
  %7 = load %TokenInfo*, %TokenInfo** %6
  %8 = call %Type* (%List*, %TokenInfo*) @func357 (%List* %2, %TokenInfo* %7)
  ret %Type* %8
}

define i1 @type_eq_numeric (%TypeNumeric*, %TypeNumeric*) {
;stmt0:
  %3 = getelementptr inbounds %TypeNumeric, %TypeNumeric* %0, i1 0, i32 0
  %4 = load %Nat32, %Nat32* %3
  %5 = getelementptr inbounds %TypeNumeric, %TypeNumeric* %1, i1 0, i32 0
  %6 = load %Nat32, %Nat32* %5
  %7 = icmp eq %Nat32 %4, %6
  %8 = getelementptr inbounds %TypeNumeric, %TypeNumeric* %0, i1 0, i32 1
  %9 = load i1, i1* %8
  %10 = getelementptr inbounds %TypeNumeric, %TypeNumeric* %1, i1 0, i32 1
  %11 = load i1, i1* %10
  %12 = icmp eq i1 %9, %11
  %13 = and i1 %7, %12
  ret i1 %13
}

define i1 @type_eq_array (%TypeArray*, %TypeArray*) {
;stmt0:
  %3 = getelementptr inbounds %TypeArray, %TypeArray* %0, i1 0, i32 1
  %4 = load %Nat32, %Nat32* %3
  %5 = getelementptr inbounds %TypeArray, %TypeArray* %1, i1 0, i32 1
  %6 = load %Nat32, %Nat32* %5
  %7 = icmp eq %Nat32 %4, %6
  %8 = getelementptr inbounds %TypeArray, %TypeArray* %0, i1 0, i32 0
  %9 = load %Type*, %Type** %8
  %10 = getelementptr inbounds %TypeArray, %TypeArray* %1, i1 0, i32 0
  %11 = load %Type*, %Type** %10
  %12 = call i1 (%Type*, %Type*) @func391 (%Type* %9, %Type* %11)
  %13 = and i1 %7, %12
  ret i1 %13
}

define i1 @type_eq_func (%TypeFunc*, %TypeFunc*) {
;stmt0:
  %3 = getelementptr inbounds %TypeFunc, %TypeFunc* %0, i1 0, i32 0
  %4 = load %Type*, %Type** %3
  %5 = getelementptr inbounds %TypeFunc, %TypeFunc* %1, i1 0, i32 0
  %6 = load %Type*, %Type** %5
  %7 = call i1 (%Type*, %Type*) @func391 (%Type* %4, %Type* %6)
  %8 = getelementptr inbounds %TypeFunc, %TypeFunc* %0, i1 0, i32 1
  %9 = load %Type*, %Type** %8
  %10 = getelementptr inbounds %TypeFunc, %TypeFunc* %1, i1 0, i32 1
  %11 = load %Type*, %Type** %10
  %12 = call i1 (%Type*, %Type*) @func391 (%Type* %9, %Type* %11)
  %13 = and i1 %7, %12
  ret i1 %13
}

define i1 @func390 (%Unit*, %Unit*, %Unit*, %Nat32) {
;stmt0:
  %5 = bitcast %Unit* %0 to %Decl*
;stmt1:
  %6 = bitcast %Unit* %1 to %Decl*
;stmt2:
  %7 = getelementptr inbounds %Decl, %Decl* %5, i1 0, i32 0
  %8 = load %AstId*, %AstId** %7
  %9 = getelementptr inbounds %AstId, %AstId* %8, i1 0, i32 0
  %10 = load %Str, %Str* %9
  %11 = getelementptr inbounds %Decl, %Decl* %6, i1 0, i32 0
  %12 = load %AstId*, %AstId** %11
  %13 = getelementptr inbounds %AstId, %AstId* %12, i1 0, i32 0
  %14 = load %Str, %Str* %13
  %15 = call %Int32 (%Str, %Str) @strcmp (%Str %10, %Str %14)
  %16 = icmp ne %Int32 %15, 0
  br i1 %16, label %then_0, label %else_0
then_0:
;stmt3:
  ret i1 0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt4:
  %18 = getelementptr inbounds %Decl, %Decl* %5, i1 0, i32 1
  %19 = load %Type*, %Type** %18
  %20 = getelementptr inbounds %Decl, %Decl* %6, i1 0, i32 1
  %21 = load %Type*, %Type** %20
  %22 = call i1 (%Type*, %Type*) @func391 (%Type* %19, %Type* %21)
  ret i1 %22
}

define i1 @type_eq_record (%TypeRecord*, %TypeRecord*) {
;stmt0:
  %3 = getelementptr inbounds %TypeRecord, %TypeRecord* %0, i1 0, i32 0
  %4 = load %List*, %List** %3
  %5 = getelementptr inbounds %TypeRecord, %TypeRecord* %1, i1 0, i32 0
  %6 = load %List*, %List** %5
  %7 = call i1 (%List*, %List*, %ListCompareHandler, %Unit*) @list_compare (%List* %4, %List* %6, %ListCompareHandler @func390, %Unit* zeroinitializer)
  ret i1 %7
}

define i1 @func391 (%Type*, %Type*) {
;stmt0:
  %3 = icmp eq %Type* %0, %1
  br i1 %3, label %then_0, label %else_0
then_0:
;stmt1:
  ret i1 1
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt2:
  %5 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 0
  %6 = load %TypeKind, %TypeKind* %5
  %7 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 0
  %8 = load %TypeKind, %TypeKind* %7
  %9 = icmp ne %TypeKind %6, %8
  br i1 %9, label %then_1, label %else_1
then_1:
;stmt3:
  ret i1 0
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt4:
  %11 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 0
  %12 = load %TypeKind, %TypeKind* %11
  br label %select_1_0
select_1_0:
  %13 = icmp eq %TypeKind %12, 4
  br i1 %13, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %14 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 4
  %15 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 4
  %16 = call i1 (%TypeNumeric*, %TypeNumeric*) @type_eq_numeric (%TypeNumeric* %14, %TypeNumeric* %15)
  br label %select_1_end
select_1_1:
  %17 = icmp eq %TypeKind %12, 5
  br i1 %17, label %select_1_1_ok, label %select_1_2
select_1_1_ok:
  %18 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 11
  %19 = getelementptr inbounds %TypeVar, %TypeVar* %18, i1 0, i32 0
  %20 = load %Type*, %Type** %19
  %21 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 11
  %22 = getelementptr inbounds %TypeVar, %TypeVar* %21, i1 0, i32 0
  %23 = load %Type*, %Type** %22
  %24 = call i1 (%Type*, %Type*) @func391 (%Type* %20, %Type* %23)
  br label %select_1_end
select_1_2:
  %25 = icmp eq %TypeKind %12, 10
  br i1 %25, label %select_1_2_ok, label %select_1_3
select_1_2_ok:
  %26 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 6
  %27 = getelementptr inbounds %TypePointer, %TypePointer* %26, i1 0, i32 0
  %28 = load %Type*, %Type** %27
  %29 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 6
  %30 = getelementptr inbounds %TypePointer, %TypePointer* %29, i1 0, i32 0
  %31 = load %Type*, %Type** %30
  %32 = call i1 (%Type*, %Type*) @func391 (%Type* %28, %Type* %31)
  br label %select_1_end
select_1_3:
  %33 = icmp eq %TypeKind %12, 11
  br i1 %33, label %select_1_3_ok, label %select_1_4
select_1_3_ok:
  %34 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 7
  %35 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 7
  %36 = call i1 (%TypeArray*, %TypeArray*) @type_eq_array (%TypeArray* %34, %TypeArray* %35)
  br label %select_1_end
select_1_4:
  %37 = icmp eq %TypeKind %12, 12
  br i1 %37, label %select_1_4_ok, label %select_1_5
select_1_4_ok:
  %38 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 8
  %39 = getelementptr inbounds %TypeArrayU, %TypeArrayU* %38, i1 0, i32 0
  %40 = load %Type*, %Type** %39
  %41 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 8
  %42 = getelementptr inbounds %TypeArrayU, %TypeArrayU* %41, i1 0, i32 0
  %43 = load %Type*, %Type** %42
  %44 = call i1 (%Type*, %Type*) @func391 (%Type* %40, %Type* %43)
  br label %select_1_end
select_1_5:
  %45 = icmp eq %TypeKind %12, 7
  br i1 %45, label %select_1_5_ok, label %select_1_6
select_1_5_ok:
  %46 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 5
  %47 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 5
  %48 = call i1 (%TypeFunc*, %TypeFunc*) @type_eq_func (%TypeFunc* %46, %TypeFunc* %47)
  br label %select_1_end
select_1_6:
  %49 = icmp eq %TypeKind %12, 9
  br i1 %49, label %select_1_6_ok, label %select_1_7
select_1_6_ok:
  %50 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 9
  %51 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 9
  %52 = call i1 (%TypeRecord*, %TypeRecord*) @type_eq_record (%TypeRecord* %50, %TypeRecord* %51)
  br label %select_1_end
select_1_7:
  %53 = icmp eq %TypeKind %12, 8
  br i1 %53, label %select_1_7_ok, label %select_1_8
select_1_7_ok:
  %54 = bitcast i1 0 to i1
  br label %select_1_end
select_1_8:
  %55 = icmp eq %TypeKind %12, 6
  br i1 %55, label %select_1_8_ok, label %select_1_9
select_1_8_ok:
  %56 = bitcast i1 1 to i1
  br label %select_1_end
select_1_9:
  %57 = bitcast i1 0 to i1
  br label %select_1_end
select_1_end:
  %58 = phi i1 [ %16, %select_1_0_ok ], [ %24, %select_1_1_ok ], [ %32, %select_1_2_ok ], [ %36, %select_1_3_ok ], [ %44, %select_1_4_ok ], [ %48, %select_1_5_ok ], [ %52, %select_1_6_ok ], [ %54, %select_1_7_ok ], [ %56, %select_1_8_ok ], [ %57, %select_1_9 ]
  ret i1 %58
}

define i1 @type_check (%Type*, %Type*, %TokenInfo*) {
;stmt0:
  %4 = call i1 (%Type*, %Type*) @func391 (%Type* %0, %Type* %1)
;stmt1:
  %5 = xor i1 %4, 1
  br i1 %5, label %then_0, label %else_0
then_0:
;stmt2:
  call void (%TokenInfo*, %Type*, %Type*) @error_type_error (%TokenInfo* %2, %Type* %1, %Type* %0)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt3:
  ret i1 %4
}

define %Type* @func394 (%Str, %Nat32, i1) {
;stmt0:
  %4 = udiv %Nat32 %1, 8
;stmt1:
  %5 = call %Type* (%TypeKind, %Nat32, %TokenInfo*) @func352 (%TypeKind 4, %Nat32 %4, %TokenInfo* zeroinitializer)
;stmt2:
  %6 = getelementptr inbounds %Type, %Type* %5, i1 0, i32 1
  store %Str %0, %Str* %6, align 8
;stmt3:
  %7 = getelementptr inbounds %Type, %Type* %5, i1 0, i32 4
  %8 = getelementptr inbounds %TypeNumeric, %TypeNumeric* %7, i1 0, i32 0
  store %Nat32 %1, %Nat32* %8, align 4
;stmt4:
  %9 = getelementptr inbounds %Type, %Type* %5, i1 0, i32 4
  %10 = getelementptr inbounds %TypeNumeric, %TypeNumeric* %9, i1 0, i32 1
  store i1 %2, i1* %10, align 1
;stmt5:
  ret %Type* %5
}

define %Type* @func395 () {
;stmt0:
  %1 = bitcast [27 x %Nat8]* @func393_func395_str1 to %Str
  call void (%Str) @fatal (%Str %1)
;stmt1:
  ret %Type* zeroinitializer
}

define void @func393 () {
;stmt0:
  %1 = call %List* () @map_new ()
  %2 = call %Type* (%List*, %TokenInfo*) @func357 (%List* %1, %TokenInfo* zeroinitializer)
  store %Type* %2, %Type** @typeVoid, align 8
;stmt1:
  %3 = load %Type*, %Type** @typeVoid
  %4 = getelementptr inbounds %Type, %Type* %3, i1 0, i32 1
  %5 = bitcast [5 x %Nat8]* @func393_str1 to %Str
  store %Str %5, %Str* %4, align 8
;stmt2:
  %6 = bitcast [5 x %Nat8]* @func393_str2 to %Str
  %7 = load %Type*, %Type** @typeVoid
  call void (%Str, %Type*) @builtin_type_bind (%Str %6, %Type* %7)
;stmt3:
  %8 = call %Type* (%TypeKind, %Nat32, %TokenInfo*) @func352 (%TypeKind 9, %Nat32 0, %TokenInfo* zeroinitializer)
  store %Type* %8, %Type** @typeUnit, align 8
;stmt4:
  %9 = load %Type*, %Type** @typeUnit
  %10 = getelementptr inbounds %Type, %Type* %9, i1 0, i32 9
  %11 = getelementptr inbounds %TypeRecord, %TypeRecord* %10, i1 0, i32 0
  %12 = call %List* () @map_new ()
  store %List* %12, %List** %11, align 8
;stmt5:
  %13 = load %Type*, %Type** @typeUnit
  %14 = getelementptr inbounds %Type, %Type* %13, i1 0, i32 1
  %15 = bitcast [5 x %Nat8]* @func393_str3 to %Str
  store %Str %15, %Str* %14, align 8
;stmt6:
  %16 = bitcast [5 x %Nat8]* @func393_str4 to %Str
  %17 = load %Type*, %Type** @typeUnit
  call void (%Str, %Type*) @builtin_type_bind (%Str %16, %Type* %17)
;stmt7:
  %18 = call %Type* (%TypeKind, %Nat32, %TokenInfo*) @func352 (%TypeKind 6, %Nat32 1, %TokenInfo* zeroinitializer)
  store %Type* %18, %Type** @typeBool, align 8
;stmt8:
  %19 = bitcast [5 x %Nat8]* @func393_str5 to %Str
  %20 = load %Type*, %Type** @typeBool
  call void (%Str, %Type*) @builtin_type_bind (%Str %19, %Type* %20)
;stmt9:
  %21 = bitcast [5 x %Nat8]* @func393_str6 to %Str
  %22 = call %Type* (%Str, %Nat32, i1) @func394 (%Str %21, %Nat32 8, i1 1)
;stmt10:
  %23 = bitcast [6 x %Nat8]* @func393_str7 to %Str
  %24 = call %Type* (%Str, %Nat32, i1) @func394 (%Str %23, %Nat32 16, i1 1)
;stmt11:
  %25 = bitcast [6 x %Nat8]* @func393_str8 to %Str
  %26 = call %Type* (%Str, %Nat32, i1) @func394 (%Str %25, %Nat32 32, i1 1)
;stmt12:
  %27 = bitcast [6 x %Nat8]* @func393_str9 to %Str
  %28 = call %Type* (%Str, %Nat32, i1) @func394 (%Str %27, %Nat32 64, i1 1)
;stmt13:
  %29 = bitcast [7 x %Nat8]* @func393_str10 to %Str
  %30 = call %Type* (%Str, %Nat32, i1) @func394 (%Str %29, %Nat32 128, i1 1)
;stmt14:
  %31 = bitcast [7 x %Nat8]* @func393_str11 to %Str
  %32 = call %Type* (%Str, %Nat32, i1) @func394 (%Str %31, %Nat32 256, i1 1)
;stmt15:
  %33 = bitcast [7 x %Nat8]* @func393_str12 to %Str
  %34 = call %Type* (%Str, %Nat32, i1) @func394 (%Str %33, %Nat32 512, i1 1)
;stmt16:
  %35 = bitcast [8 x %Nat8]* @func393_str13 to %Str
  %36 = call %Type* (%Str, %Nat32, i1) @func394 (%Str %35, %Nat32 1024, i1 1)
;stmt17:
  %37 = bitcast [5 x %Nat8]* @func393_str14 to %Str
  %38 = call %Type* (%Str, %Nat32, i1) @func394 (%Str %37, %Nat32 8, i1 0)
;stmt18:
  %39 = bitcast [6 x %Nat8]* @func393_str15 to %Str
  %40 = call %Type* (%Str, %Nat32, i1) @func394 (%Str %39, %Nat32 16, i1 0)
;stmt19:
  %41 = bitcast [6 x %Nat8]* @func393_str16 to %Str
  %42 = call %Type* (%Str, %Nat32, i1) @func394 (%Str %41, %Nat32 32, i1 0)
;stmt20:
  %43 = bitcast [6 x %Nat8]* @func393_str17 to %Str
  %44 = call %Type* (%Str, %Nat32, i1) @func394 (%Str %43, %Nat32 64, i1 0)
;stmt21:
  %45 = bitcast [7 x %Nat8]* @func393_str18 to %Str
  %46 = call %Type* (%Str, %Nat32, i1) @func394 (%Str %45, %Nat32 128, i1 0)
;stmt22:
  %47 = bitcast [7 x %Nat8]* @func393_str19 to %Str
  %48 = call %Type* (%Str, %Nat32, i1) @func394 (%Str %47, %Nat32 256, i1 0)
;stmt23:
  %49 = bitcast [7 x %Nat8]* @func393_str20 to %Str
  %50 = call %Type* (%Str, %Nat32, i1) @func394 (%Str %49, %Nat32 512, i1 0)
;stmt24:
  %51 = bitcast [8 x %Nat8]* @func393_str21 to %Str
  %52 = call %Type* (%Str, %Nat32, i1) @func394 (%Str %51, %Nat32 1024, i1 0)
;stmt25:
  %53 = bitcast [6 x %Nat8]* @func393_str22 to %Str
  call void (%Str, %Type*) @builtin_type_bind (%Str %53, %Type* %28)
;stmt26:
  %54 = bitcast [6 x %Nat8]* @func393_str23 to %Str
  call void (%Str, %Type*) @builtin_type_bind (%Str %54, %Type* %44)
;stmt27:
  %55 = bitcast [6 x %Nat8]* @func393_str24 to %Str
  call void (%Str, %Type*) @builtin_type_bind (%Str %55, %Type* %26)
;stmt28:
  %56 = bitcast [6 x %Nat8]* @func393_str25 to %Str
  call void (%Str, %Type*) @builtin_type_bind (%Str %56, %Type* %42)
;stmt29:
  %57 = bitcast [5 x %Nat8]* @func393_str26 to %Str
  call void (%Str, %Type*) @builtin_type_bind (%Str %57, %Type* %22)
;stmt30:
  %58 = bitcast [5 x %Nat8]* @func393_str27 to %Str
  call void (%Str, %Type*) @builtin_type_bind (%Str %58, %Type* %38)
;stmt31:
  %59 = bitcast [6 x %Nat8]* @func393_str28 to %Str
  call void (%Str, %Type*) @builtin_type_bind (%Str %59, %Type* %24)
;stmt32:
  %60 = bitcast [6 x %Nat8]* @func393_str29 to %Str
  call void (%Str, %Type*) @builtin_type_bind (%Str %60, %Type* %40)
;stmt33:
  store %Type* %38, %Type** @typeChar, align 8
;stmt34:
  %61 = load %Type*, %Type** @typeChar
  %62 = call %Type* (%Type*, %TokenInfo*) @func355 (%Type* %61, %TokenInfo* zeroinitializer)
  store %Type* %62, %Type** @typeStr, align 8
;stmt35:
  %63 = load %Type*, %Type** @typeStr
  %64 = getelementptr inbounds %Type, %Type* %63, i1 0, i32 1
  %65 = bitcast [4 x %Nat8]* @func393_str30 to %Str
  store %Str %65, %Str* %64, align 8
;stmt36:
  %66 = bitcast [4 x %Nat8]* @func393_str31 to %Str
  %67 = load %Type*, %Type** @typeStr
  call void (%Str, %Type*) @builtin_type_bind (%Str %66, %Type* %67)
;stmt37:
  %68 = bitcast [7 x %Nat8]* @func393_str32 to %Str
  call void (%Str, %Type*) @builtin_type_bind (%Str %68, %Type* %30)
;stmt38:
  %69 = bitcast [7 x %Nat8]* @func393_str33 to %Str
  call void (%Str, %Type*) @builtin_type_bind (%Str %69, %Type* %32)
;stmt39:
  %70 = bitcast [7 x %Nat8]* @func393_str34 to %Str
  call void (%Str, %Type*) @builtin_type_bind (%Str %70, %Type* %34)
;stmt40:
  %71 = bitcast [8 x %Nat8]* @func393_str35 to %Str
  call void (%Str, %Type*) @builtin_type_bind (%Str %71, %Type* %36)
;stmt41:
  %72 = bitcast [7 x %Nat8]* @func393_str36 to %Str
  call void (%Str, %Type*) @builtin_type_bind (%Str %72, %Type* %46)
;stmt42:
  %73 = bitcast [7 x %Nat8]* @func393_str37 to %Str
  call void (%Str, %Type*) @builtin_type_bind (%Str %73, %Type* %48)
;stmt43:
  %74 = bitcast [7 x %Nat8]* @func393_str38 to %Str
  call void (%Str, %Type*) @builtin_type_bind (%Str %74, %Type* %50)
;stmt44:
  %75 = bitcast [8 x %Nat8]* @func393_str39 to %Str
  call void (%Str, %Type*) @builtin_type_bind (%Str %75, %Type* %52)
;stmt45:
  %76 = load %Type*, %Type** @typeUnit
  %77 = call %Type* (%Type*, %TokenInfo*) @func354 (%Type* %76, %TokenInfo* zeroinitializer)
  store %Type* %77, %Type** @typeFreePtr, align 8
;stmt46:
  %78 = bitcast [8 x %Nat8]* @func393_str40 to %Str
  %79 = call %Type* (%Str, %Nat32, i1) @func394 (%Str %78, %Nat32 0, i1 1)
  store %Type* %79, %Type** @typeNumeric, align 8
;stmt47:
  br label %select_1_0
select_1_0:
  %80 = icmp eq %Numeric 8, 2
  br i1 %80, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  br label %select_1_end
select_1_1:
  %81 = icmp eq %Numeric 8, 4
  br i1 %81, label %select_1_1_ok, label %select_1_2
select_1_1_ok:
  br label %select_1_end
select_1_2:
  %82 = icmp eq %Numeric 8, 8
  br i1 %82, label %select_1_2_ok, label %select_1_3
select_1_2_ok:
  br label %select_1_end
select_1_3:
  %83 = icmp eq %Numeric 8, 16
  br i1 %83, label %select_1_3_ok, label %select_1_4
select_1_3_ok:
  br label %select_1_end
select_1_4:
  %84 = icmp eq %Numeric 8, 32
  br i1 %84, label %select_1_4_ok, label %select_1_5
select_1_4_ok:
  br label %select_1_end
select_1_5:
  %85 = call %Type* () @func395 ()
  br label %select_1_end
select_1_end:
  %86 = phi %Type* [ %24, %select_1_0_ok ], [ %26, %select_1_1_ok ], [ %28, %select_1_2_ok ], [ %30, %select_1_3_ok ], [ %32, %select_1_4_ok ], [ %85, %select_1_5 ]
  store %Type* %86, %Type** @typeBaseInt, align 8
  ret void
}

define %Value* @func396 (%ValueKind, %Type*, %TokenInfo*) {
;stmt0:
  %4 = call %Unit* (%Nat32) @malloc (%Nat32 248)
  %5 = bitcast %Unit* %4 to %Value*
;stmt1:
  %6 = icmp ne %Value* %5, zeroinitializer
  %7 = bitcast [21 x %Nat8]* @func396_str1 to %Str
  call void (i1, %Str) @assert (i1 %6, %Str %7)
;stmt2:
  %8 = bitcast %Value* %5 to %Unit*
  %9 = call %Unit* (%Unit*, %Nat8, %Nat32) @memset (%Unit* %8, %Nat8 0, %Nat32 248)
;stmt3:
  %10 = getelementptr inbounds %Value, %Value* %5, i1 0, i32 0
  store %ValueKind %0, %ValueKind* %10, align 2
;stmt4:
  %11 = getelementptr inbounds %Value, %Value* %5, i1 0, i32 1
  store %Type* %1, %Type** %11, align 8
;stmt5:
  %12 = getelementptr inbounds %Value, %Value* %5, i1 0, i32 19
  store %TokenInfo* %2, %TokenInfo** %12, align 8
;stmt6:
  ret %Value* %5
}

define %Value* @value_new_poison (%TokenInfo*) {
;stmt0:
  %2 = call %Type* (%TypeKind, %Nat32, %TokenInfo*) @func352 (%TypeKind 2, %Nat32 0, %TokenInfo* %0)
;stmt1:
  %3 = call %Value* (%ValueKind, %Type*, %TokenInfo*) @func396 (%ValueKind 1, %Type* %2, %TokenInfo* %0)
  ret %Value* %3
}

define %Value* @func398 (%Type*, %Int64, %TokenInfo*) {
;stmt0:
  %4 = call %Value* (%ValueKind, %Type*, %TokenInfo*) @func396 (%ValueKind 3, %Type* %0, %TokenInfo* %2)
;stmt1:
  %5 = getelementptr inbounds %Value, %Value* %4, i1 0, i32 2
  store %Int64 %1, %Int64* %5, align 8
;stmt2:
  ret %Value* %4
}

define %Value* @dold (%Value*) {
;stmt0:
  %2 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 1
  %3 = load %Type*, %Type** %2
  %4 = getelementptr inbounds %Type, %Type* %3, i1 0, i32 0
  %5 = load %TypeKind, %TypeKind* %4
  br label %select_1_0
select_1_0:
  %6 = icmp eq %TypeKind %5, 5
  br i1 %6, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %7 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 1
  %8 = load %Type*, %Type** %7
  %9 = getelementptr inbounds %Type, %Type* %8, i1 0, i32 11
  %10 = getelementptr inbounds %TypeVar, %TypeVar* %9, i1 0, i32 0
  %11 = load %Type*, %Type** %10
  br label %select_1_end
select_1_1:
  %12 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 1
  %13 = load %Type*, %Type** %12
  br label %select_1_end
select_1_end:
  %14 = phi %Type* [ %11, %select_1_0_ok ], [ %13, %select_1_1 ]
;stmt1:
  %15 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 0
  %16 = load %ValueKind, %ValueKind* %15
;stmt2:
  %17 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 1
  %18 = load %Type*, %Type** %17
  %19 = getelementptr inbounds %Type, %Type* %18, i1 0, i32 0
  %20 = load %TypeKind, %TypeKind* %19
  %21 = icmp eq %TypeKind %20, 5
  %22 = icmp eq %ValueKind %16, 5
  %23 = icmp eq %ValueKind %16, 8
  %24 = icmp eq %ValueKind %16, 10
  %25 = icmp eq %ValueKind %16, 32
  %26 = icmp eq %ValueKind %16, 33
  %27 = or i1 %25, %26
  %28 = or i1 %24, %27
  %29 = or i1 %23, %28
  %30 = or i1 %22, %29
  %31 = or i1 %21, %30
  br i1 %31, label %then_0, label %else_0
then_0:
;stmt3:
  %32 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 19
  %33 = load %TokenInfo*, %TokenInfo** %32
  %34 = call %Value* (%ValueKind, %Type*, %TokenInfo*) @func396 (%ValueKind 28, %Type* %14, %TokenInfo* %33)
;stmt4:
  %35 = getelementptr inbounds %Value, %Value* %34, i1 0, i32 16
  store %Value* %0, %Value** %35, align 8
;stmt5:
  ret %Value* %34
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt6:
  ret %Value* %0
}

define %Value* @func400 (%AstValue*) {
;stmt0:
  %2 = call %Value* (%AstValue*, i1) @func401 (%AstValue* %0, i1 1)
  ret %Value* %2
}

define %Value* @func402 (%AstValue*) {
;stmt0:
  %2 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 12
  %3 = load %TokenInfo*, %TokenInfo** %2
  call void (%TokenInfo*) @func120 (%TokenInfo* %3)
;stmt1:
  %4 = bitcast [30 x %Nat8]* @func401_func402_str1 to %Str
  call void (i1, %Str) @assert (i1 0, %Str %4)
;stmt2:
  ret %Value* zeroinitializer
}

define %Value* @func401 (%AstValue*, i1) {
;stmt0:
  %3 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 0
  %4 = load %AstValueKind, %AstValueKind* %3
  br label %select_1_0
select_1_0:
  %5 = icmp eq %AstValueKind %4, 0
  br i1 %5, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %6 = call %Value* (%AstValue*) @func402 (%AstValue* %0)
  br label %select_1_end
select_1_1:
  %7 = icmp eq %AstValueKind %4, 4
  br i1 %7, label %select_1_1_ok, label %select_1_2
select_1_1_ok:
  %8 = call %Value* (%AstValue*) @func429 (%AstValue* %0)
  br label %select_1_end
select_1_2:
  %9 = icmp eq %AstValueKind %4, 2
  br i1 %9, label %select_1_2_ok, label %select_1_3
select_1_2_ok:
  %10 = call %Value* (%AstValue*) @func430 (%AstValue* %0)
  br label %select_1_end
select_1_3:
  %11 = icmp eq %AstValueKind %4, 3
  br i1 %11, label %select_1_3_ok, label %select_1_4
select_1_3_ok:
  %12 = call %Value* (%AstValue*) @func431 (%AstValue* %0)
  br label %select_1_end
select_1_4:
  %13 = icmp eq %AstValueKind %4, 5
  br i1 %13, label %select_1_4_ok, label %select_1_5
select_1_4_ok:
  %14 = call %Value* (%AstValue*) @func432 (%AstValue* %0)
  br label %select_1_end
select_1_5:
  %15 = icmp eq %AstValueKind %4, 6
  br i1 %15, label %select_1_5_ok, label %select_1_6
select_1_5_ok:
  %16 = call %Value* (%AstValue*) @func434 (%AstValue* %0)
  br label %select_1_end
select_1_6:
  %17 = icmp eq %AstValueKind %4, 7
  br i1 %17, label %select_1_6_ok, label %select_1_7
select_1_6_ok:
  %18 = call %Value* (%AstValue*) @func435 (%AstValue* %0)
  br label %select_1_end
select_1_7:
  %19 = icmp eq %AstValueKind %4, 8
  br i1 %19, label %select_1_7_ok, label %select_1_8
select_1_7_ok:
  %20 = call %Value* (%AstValue*) @func405 (%AstValue* %0)
  br label %select_1_end
select_1_8:
  %21 = icmp eq %AstValueKind %4, 9
  br i1 %21, label %select_1_8_ok, label %select_1_9
select_1_8_ok:
  %22 = call %Value* (%AstValue*) @func406 (%AstValue* %0)
  br label %select_1_end
select_1_9:
  %23 = icmp eq %AstValueKind %4, 10
  br i1 %23, label %select_1_9_ok, label %select_1_10
select_1_9_ok:
  %24 = call %Value* (%AstValue*) @func438 (%AstValue* %0)
  br label %select_1_end
select_1_10:
  %25 = icmp eq %AstValueKind %4, 11
  br i1 %25, label %select_1_10_ok, label %select_1_11
select_1_10_ok:
  %26 = call %Value* (%AstValue*) @func437 (%AstValue* %0)
  br label %select_1_end
select_1_11:
  %27 = icmp eq %AstValueKind %4, 12
  br i1 %27, label %select_1_11_ok, label %select_1_12
select_1_11_ok:
  %28 = call %Value* (%AstValue*) @func436 (%AstValue* %0)
  br label %select_1_end
select_1_12:
  %29 = icmp eq %AstValueKind %4, 13
  br i1 %29, label %select_1_12_ok, label %select_1_13
select_1_12_ok:
  %30 = call %Value* (%ValueKind, %AstValue*) @func407 (%ValueKind 14, %AstValue* %0)
  br label %select_1_end
select_1_13:
  %31 = icmp eq %AstValueKind %4, 14
  br i1 %31, label %select_1_13_ok, label %select_1_14
select_1_13_ok:
  %32 = call %Value* (%ValueKind, %AstValue*) @func407 (%ValueKind 15, %AstValue* %0)
  br label %select_1_end
select_1_14:
  %33 = icmp eq %AstValueKind %4, 15
  br i1 %33, label %select_1_14_ok, label %select_1_15
select_1_14_ok:
  %34 = call %Value* (%ValueKind, %AstValue*) @func407 (%ValueKind 16, %AstValue* %0)
  br label %select_1_end
select_1_15:
  %35 = icmp eq %AstValueKind %4, 16
  br i1 %35, label %select_1_15_ok, label %select_1_16
select_1_15_ok:
  %36 = call %Value* (%ValueKind, %AstValue*) @func407 (%ValueKind 17, %AstValue* %0)
  br label %select_1_end
select_1_16:
  %37 = icmp eq %AstValueKind %4, 17
  br i1 %37, label %select_1_16_ok, label %select_1_17
select_1_16_ok:
  %38 = call %Value* (%ValueKind, %AstValue*) @func407 (%ValueKind 18, %AstValue* %0)
  br label %select_1_end
select_1_17:
  %39 = icmp eq %AstValueKind %4, 20
  br i1 %39, label %select_1_17_ok, label %select_1_18
select_1_17_ok:
  %40 = call %Value* (%ValueKind, %AstValue*) @func407 (%ValueKind 21, %AstValue* %0)
  br label %select_1_end
select_1_18:
  %41 = icmp eq %AstValueKind %4, 19
  br i1 %41, label %select_1_18_ok, label %select_1_19
select_1_18_ok:
  %42 = call %Value* (%ValueKind, %AstValue*) @func407 (%ValueKind 20, %AstValue* %0)
  br label %select_1_end
select_1_19:
  %43 = icmp eq %AstValueKind %4, 18
  br i1 %43, label %select_1_19_ok, label %select_1_20
select_1_19_ok:
  %44 = call %Value* (%ValueKind, %AstValue*) @func407 (%ValueKind 19, %AstValue* %0)
  br label %select_1_end
select_1_20:
  %45 = icmp eq %AstValueKind %4, 23
  br i1 %45, label %select_1_20_ok, label %select_1_21
select_1_20_ok:
  %46 = call %Value* (%ValueKind, %AstValue*) @func407 (%ValueKind 24, %AstValue* %0)
  br label %select_1_end
select_1_21:
  %47 = icmp eq %AstValueKind %4, 24
  br i1 %47, label %select_1_21_ok, label %select_1_22
select_1_21_ok:
  %48 = call %Value* (%ValueKind, %AstValue*) @func407 (%ValueKind 25, %AstValue* %0)
  br label %select_1_end
select_1_22:
  %49 = icmp eq %AstValueKind %4, 21
  br i1 %49, label %select_1_22_ok, label %select_1_23
select_1_22_ok:
  %50 = call %Value* (%ValueKind, %AstValue*) @func407 (%ValueKind 22, %AstValue* %0)
  br label %select_1_end
select_1_23:
  %51 = icmp eq %AstValueKind %4, 22
  br i1 %51, label %select_1_23_ok, label %select_1_24
select_1_23_ok:
  %52 = call %Value* (%ValueKind, %AstValue*) @func407 (%ValueKind 23, %AstValue* %0)
  br label %select_1_end
select_1_24:
  %53 = icmp eq %AstValueKind %4, 25
  br i1 %53, label %select_1_24_ok, label %select_1_25
select_1_24_ok:
  %54 = call %Value* (%ValueKind, %AstValue*) @func407 (%ValueKind 26, %AstValue* %0)
  br label %select_1_end
select_1_25:
  %55 = icmp eq %AstValueKind %4, 26
  br i1 %55, label %select_1_25_ok, label %select_1_26
select_1_25_ok:
  %56 = call %Value* (%ValueKind, %AstValue*) @func407 (%ValueKind 27, %AstValue* %0)
  br label %select_1_end
select_1_26:
  %57 = icmp eq %AstValueKind %4, 27
  br i1 %57, label %select_1_26_ok, label %select_1_27
select_1_26_ok:
  %58 = call %Value* (%AstValue*) @func439 (%AstValue* %0)
  br label %select_1_end
select_1_27:
  %59 = icmp eq %AstValueKind %4, 28
  br i1 %59, label %select_1_27_ok, label %select_1_28
select_1_27_ok:
  %60 = call %Value* (%AstValue*) @func439 (%AstValue* %0)
  br label %select_1_end
select_1_28:
  %61 = icmp eq %AstValueKind %4, 29
  br i1 %61, label %select_1_28_ok, label %select_1_29
select_1_28_ok:
  %62 = call %Value* (%AstValue*) @func408 (%AstValue* %0)
  br label %select_1_end
select_1_29:
  %63 = icmp eq %AstValueKind %4, 30
  br i1 %63, label %select_1_29_ok, label %select_1_30
select_1_29_ok:
  %64 = call %Value* (%AstValue*) @func411 (%AstValue* %0)
  br label %select_1_end
select_1_30:
  %65 = icmp eq %AstValueKind %4, 31
  br i1 %65, label %select_1_30_ok, label %select_1_31
select_1_30_ok:
  %66 = call %Value* (%AstValue*) @func413 (%AstValue* %0)
  br label %select_1_end
select_1_31:
  %67 = icmp eq %AstValueKind %4, 32
  br i1 %67, label %select_1_31_ok, label %select_1_32
select_1_31_ok:
  %68 = call %Value* (%AstValue*) @func425 (%AstValue* %0)
  br label %select_1_end
select_1_32:
  %69 = icmp eq %AstValueKind %4, 33
  br i1 %69, label %select_1_32_ok, label %select_1_33
select_1_32_ok:
  %70 = call %Value* (%AstValue*) @func427 (%AstValue* %0)
  br label %select_1_end
select_1_33:
  %71 = icmp eq %AstValueKind %4, 34
  br i1 %71, label %select_1_33_ok, label %select_1_34
select_1_33_ok:
  %72 = call %Value* (%AstValue*) @func428 (%AstValue* %0)
  br label %select_1_end
select_1_34:
  %73 = icmp eq %AstValueKind %4, 35
  br i1 %73, label %select_1_34_ok, label %select_1_35
select_1_34_ok:
  %74 = call %Value* (%AstValue*) @func403 (%AstValue* %0)
  br label %select_1_end
select_1_35:
  %75 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 12
  %76 = load %TokenInfo*, %TokenInfo** %75
  %77 = call %Value* (%TokenInfo*) @value_new_poison (%TokenInfo* %76)
  br label %select_1_end
select_1_end:
  %78 = phi %Value* [ %6, %select_1_0_ok ], [ %8, %select_1_1_ok ], [ %10, %select_1_2_ok ], [ %12, %select_1_3_ok ], [ %14, %select_1_4_ok ], [ %16, %select_1_5_ok ], [ %18, %select_1_6_ok ], [ %20, %select_1_7_ok ], [ %22, %select_1_8_ok ], [ %24, %select_1_9_ok ], [ %26, %select_1_10_ok ], [ %28, %select_1_11_ok ], [ %30, %select_1_12_ok ], [ %32, %select_1_13_ok ], [ %34, %select_1_14_ok ], [ %36, %select_1_15_ok ], [ %38, %select_1_16_ok ], [ %40, %select_1_17_ok ], [ %42, %select_1_18_ok ], [ %44, %select_1_19_ok ], [ %46, %select_1_20_ok ], [ %48, %select_1_21_ok ], [ %50, %select_1_22_ok ], [ %52, %select_1_23_ok ], [ %54, %select_1_24_ok ], [ %56, %select_1_25_ok ], [ %58, %select_1_26_ok ], [ %60, %select_1_27_ok ], [ %62, %select_1_28_ok ], [ %64, %select_1_29_ok ], [ %66, %select_1_30_ok ], [ %68, %select_1_31_ok ], [ %70, %select_1_32_ok ], [ %72, %select_1_33_ok ], [ %74, %select_1_34_ok ], [ %77, %select_1_35 ]
;stmt1:
  %79 = icmp ne %Value* %78, zeroinitializer
  %80 = bitcast [20 x %Nat8]* @func401_str1 to %Str
  call void (i1, %Str) @assert (i1 %79, %Str %80)
;stmt2:
  %81 = getelementptr inbounds %Value, %Value* %78, i1 0, i32 0
  %82 = load %ValueKind, %ValueKind* %81
  %83 = icmp eq %ValueKind %82, 1
  br i1 %83, label %then_0, label %else_0
then_0:
;stmt3:
  ret %Value* %78
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt4:
  br label %select_2_0
select_2_0:
  %85 = icmp eq i1 %1, 1
  br i1 %85, label %select_2_0_ok, label %select_2_1
select_2_0_ok:
  %86 = call %Value* (%Value*) @dold (%Value* %78)
  br label %select_2_end
select_2_1:
  br label %select_2_end
select_2_end:
  %87 = phi %Value* [ %86, %select_2_0_ok ], [ %78, %select_2_1 ]
  ret %Value* %87
}

define void @func404 (%Unit*, %Unit*, %Nat32) {
;stmt0:
  %4 = bitcast %Unit* %0 to %AstValueSelectVariant*
;stmt1:
  %5 = bitcast %Unit* %1 to %func403.type5*
;stmt2:
  %6 = getelementptr inbounds %AstValueSelectVariant, %AstValueSelectVariant* %4, i1 0, i32 0
  %7 = load %AstValue*, %AstValue** %6
  %8 = call %Value* (%AstValue*) @func400 (%AstValue* %7)
  %9 = getelementptr inbounds %func403.type5, %func403.type5* %5, i1 0, i32 0
  %10 = load %Value*, %Value** %9
  %11 = getelementptr inbounds %Value, %Value* %10, i1 0, i32 1
  %12 = load %Type*, %Type** %11
  %13 = call %Value* (%Value*, %Type*) @func444 (%Value* %8, %Type* %12)
;stmt3:
  %14 = getelementptr inbounds %AstValueSelectVariant, %AstValueSelectVariant* %4, i1 0, i32 1
  %15 = load %AstValue*, %AstValue** %14
  %16 = call %Value* (%AstValue*) @func400 (%AstValue* %15)
;stmt4:
  %17 = getelementptr inbounds %func403.type5, %func403.type5* %5, i1 0, i32 1
  %18 = load %Value*, %Value** %17
  %19 = getelementptr inbounds %Value, %Value* %18, i1 0, i32 1
  %20 = load %Type*, %Type** %19
  %21 = icmp eq %Type* %20, zeroinitializer
  br i1 %21, label %then_0, label %else_0
then_0:
;stmt5:
  %22 = getelementptr inbounds %func403.type5, %func403.type5* %5, i1 0, i32 1
  %23 = load %Value*, %Value** %22
  %24 = getelementptr inbounds %Value, %Value* %23, i1 0, i32 1
  %25 = getelementptr inbounds %Value, %Value* %16, i1 0, i32 1
  %26 = load %Type*, %Type** %25
  store %Type* %26, %Type** %24, align 8
  br label %endif_0
else_0:
;stmt6:
  %27 = getelementptr inbounds %Value, %Value* %16, i1 0, i32 1
  %28 = load %Type*, %Type** %27
  %29 = getelementptr inbounds %func403.type5, %func403.type5* %5, i1 0, i32 1
  %30 = load %Value*, %Value** %29
  %31 = getelementptr inbounds %Value, %Value* %30, i1 0, i32 1
  %32 = load %Type*, %Type** %31
  %33 = getelementptr inbounds %Value, %Value* %16, i1 0, i32 19
  %34 = load %TokenInfo*, %TokenInfo** %33
  %35 = call i1 (%Type*, %Type*, %TokenInfo*) @type_check (%Type* %28, %Type* %32, %TokenInfo* %34)
  %36 = xor i1 %35, 1
  br i1 %36, label %then_1, label %else_1
then_1:
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  br label %endif_0
endif_0:
;stmt7:
  %37 = getelementptr inbounds %func403.type5, %func403.type5* %5, i1 0, i32 1
  %38 = load %Value*, %Value** %37
  %39 = getelementptr inbounds %Value, %Value* %38, i1 0, i32 1
  %40 = load %Type*, %Type** %39
  br label %select_1_0
select_1_0:
  %41 = icmp eq %Type* %40, zeroinitializer
  br i1 %41, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  br label %select_1_end
select_1_1:
  %42 = getelementptr inbounds %func403.type5, %func403.type5* %5, i1 0, i32 1
  %43 = load %Value*, %Value** %42
  %44 = getelementptr inbounds %Value, %Value* %43, i1 0, i32 1
  %45 = load %Type*, %Type** %44
  %46 = call %Value* (%Value*, %Type*) @func444 (%Value* %16, %Type* %45)
  br label %select_1_end
select_1_end:
  %47 = phi %Value* [ %16, %select_1_0_ok ], [ %46, %select_1_1 ]
;stmt8:
  %48 = call %Unit* (%Nat32) @malloc (%Nat32 16)
  %49 = bitcast %Unit* %48 to %ValueSelectVariant*
;stmt9:
  %50 = getelementptr inbounds %func403.type5, %func403.type5* %5, i1 0, i32 0
  %51 = load %Value*, %Value** %50
  %52 = getelementptr inbounds %Value, %Value* %51, i1 0, i32 1
  %53 = load %Type*, %Type** %52
  %54 = getelementptr inbounds %Value, %Value* %13, i1 0, i32 1
  %55 = load %Type*, %Type** %54
  %56 = getelementptr inbounds %Value, %Value* %13, i1 0, i32 19
  %57 = load %TokenInfo*, %TokenInfo** %56
  %58 = call i1 (%Type*, %Type*, %TokenInfo*) @type_check (%Type* %53, %Type* %55, %TokenInfo* %57)
  %59 = xor i1 %58, 1
  br i1 %59, label %then_2, label %else_2
then_2:
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
;stmt10:
  %60 = getelementptr inbounds %ValueSelectVariant, %ValueSelectVariant* %49, i1 0, i32 0
  store %Value* %13, %Value** %60, align 8
;stmt11:
  %61 = getelementptr inbounds %ValueSelectVariant, %ValueSelectVariant* %49, i1 0, i32 1
  store %Value* %47, %Value** %61, align 8
;stmt12:
  %62 = getelementptr inbounds %func403.type5, %func403.type5* %5, i1 0, i32 1
  %63 = load %Value*, %Value** %62
  %64 = getelementptr inbounds %Value, %Value* %63, i1 0, i32 15
  %65 = getelementptr inbounds %ValueSelect, %ValueSelect* %64, i1 0, i32 1
  %66 = bitcast %ValueSelectVariant* %49 to %Unit*
  %67 = call i1 (%List*, %Unit*) @list_append (%List* %65, %Unit* %66)
  ret void
}

define %Value* @func403 (%AstValue*) {
;stmt0:
  %2 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 12
  %3 = load %TokenInfo*, %TokenInfo** %2
  %4 = call %Value* (%ValueKind, %Type*, %TokenInfo*) @func396 (%ValueKind 35, %Type* zeroinitializer, %TokenInfo* %3)
;stmt1:
  %5 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 10
  %6 = getelementptr inbounds %AstValueSelect, %AstValueSelect* %5, i1 0, i32 0
  %7 = load %AstValue*, %AstValue** %6
  %8 = call %Value* (%AstValue*) @func400 (%AstValue* %7)
;stmt2:
  %9 = getelementptr inbounds %Value, %Value* %4, i1 0, i32 15
  %10 = getelementptr inbounds %ValueSelect, %ValueSelect* %9, i1 0, i32 0
  store %Value* %8, %Value** %10, align 8
;stmt3:
  %11 = alloca %func403.type5
  store %func403.type5 zeroinitializer, %func403.type5* %11, align 8
;stmt4:
  %12 = getelementptr inbounds %func403.type5, %func403.type5* %11, i1 0, i32 0
  store %Value* %8, %Value** %12, align 8
;stmt5:
  %13 = getelementptr inbounds %func403.type5, %func403.type5* %11, i1 0, i32 1
  store %Value* %4, %Value** %13, align 8
;stmt6:
  %14 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 10
  %15 = getelementptr inbounds %AstValueSelect, %AstValueSelect* %14, i1 0, i32 1
  %16 = getelementptr inbounds %func403.type5, %func403.type5* %11, i1 0
  %17 = bitcast %func403.type5* %16 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @func59 (%List* %15, %ListForeachHandler @func404, %Unit* %17)
;stmt7:
  %18 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 10
  %19 = getelementptr inbounds %AstValueSelect, %AstValueSelect* %18, i1 0, i32 2
  %20 = load %AstValue*, %AstValue** %19
  %21 = icmp eq %AstValue* %20, zeroinitializer
  br i1 %21, label %then_0, label %else_0
then_0:
;stmt8:
  %22 = bitcast [25 x %Nat8]* @func403_str1 to %Str
  %23 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 12
  %24 = load %TokenInfo*, %TokenInfo** %23
  call void (%Str, %TokenInfo*) @error (%Str %22, %TokenInfo* %24)
;stmt9:
  %25 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 12
  %26 = load %TokenInfo*, %TokenInfo** %25
  %27 = call %Value* (%TokenInfo*) @value_new_poison (%TokenInfo* %26)
  ret %Value* %27
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt10:
  %29 = getelementptr inbounds %Value, %Value* %4, i1 0, i32 15
  %30 = getelementptr inbounds %ValueSelect, %ValueSelect* %29, i1 0, i32 2
  %31 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 10
  %32 = getelementptr inbounds %AstValueSelect, %AstValueSelect* %31, i1 0, i32 2
  %33 = load %AstValue*, %AstValue** %32
  %34 = call %Value* (%AstValue*) @func400 (%AstValue* %33)
  %35 = getelementptr inbounds %func403.type5, %func403.type5* %11, i1 0, i32 1
  %36 = load %Value*, %Value** %35
  %37 = getelementptr inbounds %Value, %Value* %36, i1 0, i32 1
  %38 = load %Type*, %Type** %37
  %39 = call %Value* (%Value*, %Type*) @func444 (%Value* %34, %Type* %38)
  store %Value* %39, %Value** %30, align 8
;stmt11:
  %40 = getelementptr inbounds %Value, %Value* %4, i1 0, i32 19
  %41 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 12
  %42 = load %TokenInfo*, %TokenInfo** %41
  store %TokenInfo* %42, %TokenInfo** %40, align 8
;stmt12:
  ret %Value* %4
}

define %Value* @func405 (%AstValue*) {
;stmt0:
  %2 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 3
; index array
  %3 = getelementptr inbounds [2 x %AstValue*], [2 x %AstValue*]* %2, i1 0, %Int64 0
  %4 = load %AstValue*, %AstValue** %3
  %5 = call %Value* (%AstValue*, i1) @func401 (%AstValue* %4, i1 0)
;stmt1:
  %6 = getelementptr inbounds %Value, %Value* %5, i1 0, i32 0
  %7 = load %ValueKind, %ValueKind* %6
  %8 = icmp eq %ValueKind %7, 1
  br i1 %8, label %then_0, label %else_0
then_0:
;stmt2:
  ret %Value* %5
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt3:
  %10 = getelementptr inbounds %Value, %Value* %5, i1 0, i32 1
  %11 = load %Type*, %Type** %10
  %12 = getelementptr inbounds %Type, %Type* %11, i1 0, i32 0
  %13 = load %TypeKind, %TypeKind* %12
  %14 = icmp ne %TypeKind %13, 5
  br i1 %14, label %then_1, label %else_1
then_1:
  br label %endif_1
else_1:
;stmt4:
  %15 = getelementptr inbounds %Value, %Value* %5, i1 0, i32 1
  %16 = getelementptr inbounds %Value, %Value* %5, i1 0, i32 1
  %17 = load %Type*, %Type** %16
  %18 = getelementptr inbounds %Type, %Type* %17, i1 0, i32 11
  %19 = getelementptr inbounds %TypeVar, %TypeVar* %18, i1 0, i32 0
  %20 = load %Type*, %Type** %19
  store %Type* %20, %Type** %15, align 8
  br label %endif_1
endif_1:
;stmt5:
;stmt6:
  %21 = getelementptr inbounds %Value, %Value* %5, i1 0, i32 0
  %22 = load %ValueKind, %ValueKind* %21
  %23 = icmp eq %ValueKind %22, 1
  br i1 %23, label %then_2, label %else_2
then_2:
;stmt7:
  ret %Value* %5
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
;stmt8:
  %25 = getelementptr inbounds %Value, %Value* %5, i1 0, i32 1
  %26 = load %Type*, %Type** %25
  %27 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 12
  %28 = load %TokenInfo*, %TokenInfo** %27
  %29 = call %Type* (%Type*, %TokenInfo*) @func354 (%Type* %26, %TokenInfo* %28)
  %30 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 12
  %31 = load %TokenInfo*, %TokenInfo** %30
  %32 = call %Value* (%ValueKind, %Type*, %TokenInfo*) @func396 (%ValueKind 9, %Type* %29, %TokenInfo* %31)
;stmt9:
  %33 = getelementptr inbounds %Value, %Value* %32, i1 0, i32 8
  %34 = getelementptr inbounds %ValueUn, %ValueUn* %33, i1 0, i32 0
  store %Value* %5, %Value** %34, align 8
;stmt10:
  ret %Value* %32
}

define %Value* @func406 (%AstValue*) {
;stmt0:
  %2 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 3
; index array
  %3 = getelementptr inbounds [2 x %AstValue*], [2 x %AstValue*]* %2, i1 0, %Int64 0
  %4 = load %AstValue*, %AstValue** %3
  %5 = call %Value* (%AstValue*) @func400 (%AstValue* %4)
;stmt1:
  %6 = getelementptr inbounds %Value, %Value* %5, i1 0, i32 0
  %7 = load %ValueKind, %ValueKind* %6
  %8 = icmp eq %ValueKind %7, 1
  br i1 %8, label %then_0, label %else_0
then_0:
;stmt2:
  ret %Value* %5
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt3:
  %10 = getelementptr inbounds %Value, %Value* %5, i1 0, i32 1
  %11 = load %Type*, %Type** %10
  %12 = getelementptr inbounds %Type, %Type* %11, i1 0, i32 0
  %13 = load %TypeKind, %TypeKind* %12
  %14 = icmp ne %TypeKind %13, 10
  br i1 %14, label %then_1, label %else_1
then_1:
;stmt4:
  %15 = bitcast [17 x %Nat8]* @func406_str1 to %Str
  %16 = getelementptr inbounds %Value, %Value* %5, i1 0, i32 19
  %17 = load %TokenInfo*, %TokenInfo** %16
  call void (%Str, %TokenInfo*) @error (%Str %15, %TokenInfo* %17)
;stmt5:
  %18 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 12
  %19 = load %TokenInfo*, %TokenInfo** %18
  %20 = call %Value* (%TokenInfo*) @value_new_poison (%TokenInfo* %19)
  ret %Value* %20
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt6:
  %22 = getelementptr inbounds %Value, %Value* %5, i1 0, i32 1
  %23 = load %Type*, %Type** %22
  %24 = getelementptr inbounds %Type, %Type* %23, i1 0, i32 6
  %25 = getelementptr inbounds %TypePointer, %TypePointer* %24, i1 0, i32 0
  %26 = load %Type*, %Type** %25
  %27 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 12
  %28 = load %TokenInfo*, %TokenInfo** %27
  %29 = call %Value* (%ValueKind, %Type*, %TokenInfo*) @func396 (%ValueKind 10, %Type* %26, %TokenInfo* %28)
;stmt7:
  %30 = getelementptr inbounds %Value, %Value* %29, i1 0, i32 8
  %31 = getelementptr inbounds %ValueUn, %ValueUn* %30, i1 0, i32 0
  store %Value* %5, %Value** %31, align 8
;stmt8:
  ret %Value* %29
}

define %Value* @func407 (%ValueKind, %AstValue*) {
;stmt0:
  %3 = getelementptr inbounds %AstValue, %AstValue* %1, i1 0, i32 3
; index array
  %4 = getelementptr inbounds [2 x %AstValue*], [2 x %AstValue*]* %3, i1 0, %Int64 0
  %5 = load %AstValue*, %AstValue** %4
  %6 = call %Value* (%AstValue*) @func400 (%AstValue* %5)
;stmt1:
  %7 = getelementptr inbounds %AstValue, %AstValue* %1, i1 0, i32 3
; index array
  %8 = getelementptr inbounds [2 x %AstValue*], [2 x %AstValue*]* %7, i1 0, %Int64 1
  %9 = load %AstValue*, %AstValue** %8
  %10 = call %Value* (%AstValue*) @func400 (%AstValue* %9)
;stmt2:
  %11 = getelementptr inbounds %Value, %Value* %6, i1 0, i32 0
  %12 = load %ValueKind, %ValueKind* %11
  %13 = icmp eq %ValueKind %12, 1
  br i1 %13, label %then_0, label %else_0
then_0:
;stmt3:
  ret %Value* %6
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt4:
  %15 = getelementptr inbounds %Value, %Value* %10, i1 0, i32 0
  %16 = load %ValueKind, %ValueKind* %15
  %17 = icmp eq %ValueKind %16, 1
  br i1 %17, label %then_1, label %else_1
then_1:
;stmt5:
  ret %Value* %10
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt6:
  %19 = getelementptr inbounds %Value, %Value* %10, i1 0, i32 1
  %20 = load %Type*, %Type** %19
  %21 = call %Value* (%Value*, %Type*) @func444 (%Value* %6, %Type* %20)
;stmt7:
  %22 = getelementptr inbounds %Value, %Value* %21, i1 0, i32 1
  %23 = load %Type*, %Type** %22
  %24 = call %Value* (%Value*, %Type*) @func444 (%Value* %10, %Type* %23)
;stmt8:
  %25 = getelementptr inbounds %Value, %Value* %21, i1 0, i32 1
  %26 = load %Type*, %Type** %25
  %27 = getelementptr inbounds %Value, %Value* %24, i1 0, i32 1
  %28 = load %Type*, %Type** %27
  %29 = getelementptr inbounds %AstValue, %AstValue* %1, i1 0, i32 12
  %30 = load %TokenInfo*, %TokenInfo** %29
  %31 = call i1 (%Type*, %Type*, %TokenInfo*) @type_check (%Type* %26, %Type* %28, %TokenInfo* %30)
  %32 = xor i1 %31, 1
  br i1 %32, label %then_2, label %else_2
then_2:
;stmt9:
  br label %fail
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
;stmt10:
  %34 = getelementptr inbounds %Value, %Value* %21, i1 0, i32 1
  %35 = load %Type*, %Type** %34
  %36 = call i1 (%ValueKind, %Type*) @func440 (%ValueKind %0, %Type* %35)
  %37 = xor i1 %36, 1
  br i1 %37, label %then_3, label %else_3
then_3:
;stmt11:
  %38 = bitcast [18 x %Nat8]* @func407_str1 to %Str
  %39 = getelementptr inbounds %AstValue, %AstValue* %1, i1 0, i32 12
  %40 = load %TokenInfo*, %TokenInfo** %39
  call void (%Str, %TokenInfo*) @error (%Str %38, %TokenInfo* %40)
;stmt12:
  br label %fail
  br label %endif_3
else_3:
  br label %endif_3
endif_3:
;stmt13:
  %42 = call i1 (%ValueKind) @func448 (%ValueKind %0)
  br label %select_1_0
select_1_0:
  %43 = icmp eq i1 %42, 1
  br i1 %43, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %44 = load %Type*, %Type** @typeBool
  br label %select_1_end
select_1_1:
  %45 = getelementptr inbounds %Value, %Value* %21, i1 0, i32 1
  %46 = load %Type*, %Type** %45
  br label %select_1_end
select_1_end:
  %47 = phi %Type* [ %44, %select_1_0_ok ], [ %46, %select_1_1 ]
;stmt14:
  %48 = getelementptr inbounds %Value, %Value* %21, i1 0, i32 0
  %49 = load %ValueKind, %ValueKind* %48
  %50 = icmp eq %ValueKind %49, 3
  %51 = getelementptr inbounds %Value, %Value* %24, i1 0, i32 0
  %52 = load %ValueKind, %ValueKind* %51
  %53 = icmp eq %ValueKind %52, 3
  %54 = and i1 %50, %53
  br i1 %54, label %then_4, label %else_4
then_4:
;stmt15:
  %55 = getelementptr inbounds %Value, %Value* %21, i1 0, i32 2
  %56 = load %Int64, %Int64* %55
;stmt16:
  %57 = getelementptr inbounds %Value, %Value* %24, i1 0, i32 2
  %58 = load %Int64, %Int64* %57
;stmt17:
  br label %select_2_0
select_2_0:
  %59 = icmp eq %ValueKind %0, 14
  br i1 %59, label %select_2_0_ok, label %select_2_1
select_2_0_ok:
  %60 = add %Int64 %56, %58
  br label %select_2_end
select_2_1:
  %61 = icmp eq %ValueKind %0, 15
  br i1 %61, label %select_2_1_ok, label %select_2_2
select_2_1_ok:
  %62 = sub %Int64 %56, %58
  br label %select_2_end
select_2_2:
  %63 = icmp eq %ValueKind %0, 16
  br i1 %63, label %select_2_2_ok, label %select_2_3
select_2_2_ok:
  %64 = mul %Int64 %56, %58
  br label %select_2_end
select_2_3:
  %65 = icmp eq %ValueKind %0, 17
  br i1 %65, label %select_2_3_ok, label %select_2_4
select_2_3_ok:
  %66 = sdiv %Int64 %56, %58
  br label %select_2_end
select_2_4:
  %67 = icmp eq %ValueKind %0, 18
  br i1 %67, label %select_2_4_ok, label %select_2_5
select_2_4_ok:
  %68 = srem %Int64 %56, %58
  br label %select_2_end
select_2_5:
  %69 = icmp eq %ValueKind %0, 19
  br i1 %69, label %select_2_5_ok, label %select_2_6
select_2_5_ok:
  %70 = or %Int64 %56, %58
  br label %select_2_end
select_2_6:
  %71 = icmp eq %ValueKind %0, 20
  br i1 %71, label %select_2_6_ok, label %select_2_7
select_2_6_ok:
  %72 = xor %Int64 %56, %58
  br label %select_2_end
select_2_7:
  %73 = icmp eq %ValueKind %0, 21
  br i1 %73, label %select_2_7_ok, label %select_2_8
select_2_7_ok:
  %74 = and %Int64 %56, %58
  br label %select_2_end
select_2_8:
  %75 = icmp eq %ValueKind %0, 22
  br i1 %75, label %select_2_8_ok, label %select_2_9
select_2_8_ok:
  %76 = icmp eq %Int64 %56, %58
  %77 = zext i1 %76 to %Int64
  br label %select_2_end
select_2_9:
  %78 = icmp eq %ValueKind %0, 23
  br i1 %78, label %select_2_9_ok, label %select_2_10
select_2_9_ok:
  %79 = icmp ne %Int64 %56, %58
  %80 = zext i1 %79 to %Int64
  br label %select_2_end
select_2_10:
  %81 = icmp eq %ValueKind %0, 24
  br i1 %81, label %select_2_10_ok, label %select_2_11
select_2_10_ok:
  %82 = icmp slt %Int64 %56, %58
  %83 = zext i1 %82 to %Int64
  br label %select_2_end
select_2_11:
  %84 = icmp eq %ValueKind %0, 25
  br i1 %84, label %select_2_11_ok, label %select_2_12
select_2_11_ok:
  %85 = icmp sgt %Int64 %56, %58
  %86 = zext i1 %85 to %Int64
  br label %select_2_end
select_2_12:
  %87 = icmp eq %ValueKind %0, 26
  br i1 %87, label %select_2_12_ok, label %select_2_13
select_2_12_ok:
  %88 = icmp sle %Int64 %56, %58
  %89 = zext i1 %88 to %Int64
  br label %select_2_end
select_2_13:
  %90 = icmp eq %ValueKind %0, 27
  br i1 %90, label %select_2_13_ok, label %select_2_14
select_2_13_ok:
  %91 = icmp sge %Int64 %56, %58
  %92 = zext i1 %91 to %Int64
  br label %select_2_end
select_2_14:
  %93 = bitcast %Int64 0 to %Int64
  br label %select_2_end
select_2_end:
  %94 = phi %Int64 [ %60, %select_2_0_ok ], [ %62, %select_2_1_ok ], [ %64, %select_2_2_ok ], [ %66, %select_2_3_ok ], [ %68, %select_2_4_ok ], [ %70, %select_2_5_ok ], [ %72, %select_2_6_ok ], [ %74, %select_2_7_ok ], [ %77, %select_2_8_ok ], [ %80, %select_2_9_ok ], [ %83, %select_2_10_ok ], [ %86, %select_2_11_ok ], [ %89, %select_2_12_ok ], [ %92, %select_2_13_ok ], [ %93, %select_2_14 ]
;stmt18:
  %95 = getelementptr inbounds %AstValue, %AstValue* %1, i1 0, i32 12
  %96 = load %TokenInfo*, %TokenInfo** %95
  %97 = call %Value* (%Type*, %Int64, %TokenInfo*) @func398 (%Type* %47, %Int64 %94, %TokenInfo* %96)
  ret %Value* %97
  br label %endif_4
else_4:
  br label %endif_4
endif_4:
;stmt19:
  %99 = getelementptr inbounds %AstValue, %AstValue* %1, i1 0, i32 12
  %100 = load %TokenInfo*, %TokenInfo** %99
  %101 = call %Value* (%ValueKind, %Type*, %TokenInfo*) @func396 (%ValueKind %0, %Type* %47, %TokenInfo* %100)
;stmt20:
  %102 = getelementptr inbounds %Value, %Value* %101, i1 0, i32 9
  %103 = getelementptr inbounds %ValueBin, %ValueBin* %102, i1 0, i32 0
  store %Value* %21, %Value** %103, align 8
;stmt21:
  %104 = getelementptr inbounds %Value, %Value* %101, i1 0, i32 9
  %105 = getelementptr inbounds %ValueBin, %ValueBin* %104, i1 0, i32 1
  store %Value* %24, %Value** %105, align 8
;stmt22:
  %106 = getelementptr inbounds %Value, %Value* %101, i1 0, i32 17
  %107 = getelementptr inbounds %Value, %Value* %21, i1 0, i32 17
  %108 = load i1, i1* %107
  %109 = getelementptr inbounds %Value, %Value* %24, i1 0, i32 17
  %110 = load i1, i1* %109
  %111 = or i1 %108, %110
  store i1 %111, i1* %106, align 1
;stmt23:
  ret %Value* %101
;stmt24:
  br label %fail
fail:
;stmt25:
  %113 = getelementptr inbounds %AstValue, %AstValue* %1, i1 0, i32 12
  %114 = load %TokenInfo*, %TokenInfo** %113
  %115 = call %Value* (%TokenInfo*) @value_new_poison (%TokenInfo* %114)
  ret %Value* %115
}

define %Value* @func408 (%AstValue*) {
;stmt0:
  %2 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 6
  %3 = getelementptr inbounds %AstValueCall, %AstValueCall* %2, i1 0, i32 0
  %4 = load %AstValue*, %AstValue** %3
  %5 = call %Value* (%AstValue*) @func400 (%AstValue* %4)
;stmt1:
  %6 = getelementptr inbounds %Value, %Value* %5, i1 0, i32 0
  %7 = load %ValueKind, %ValueKind* %6
  %8 = icmp eq %ValueKind %7, 1
  br i1 %8, label %then_0, label %else_0
then_0:
;stmt2:
  ret %Value* %5
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt3:
  %10 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 6
  %11 = getelementptr inbounds %AstValueCall, %AstValueCall* %10, i1 0, i32 1
  %12 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 12
  %13 = load %TokenInfo*, %TokenInfo** %12
  %14 = call %List* (%Value*, %List*, %TokenInfo*) @func409 (%Value* %5, %List* %11, %TokenInfo* %13)
;stmt4:
  %15 = getelementptr inbounds %Value, %Value* %5, i1 0, i32 1
  %16 = load %Type*, %Type** %15
  %17 = getelementptr inbounds %Type, %Type* %16, i1 0, i32 5
  %18 = getelementptr inbounds %TypeFunc, %TypeFunc* %17, i1 0, i32 1
  %19 = load %Type*, %Type** %18
  %20 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 12
  %21 = load %TokenInfo*, %TokenInfo** %20
  %22 = call %Value* (%ValueKind, %Type*, %TokenInfo*) @func396 (%ValueKind 31, %Type* %19, %TokenInfo* %21)
;stmt5:
  %23 = getelementptr inbounds %Value, %Value* %22, i1 0, i32 13
  %24 = getelementptr inbounds %ValueCall, %ValueCall* %23, i1 0, i32 0
  store %Value* %5, %Value** %24, align 8
;stmt6:
  %25 = getelementptr inbounds %Value, %Value* %22, i1 0, i32 13
  %26 = getelementptr inbounds %ValueCall, %ValueCall* %25, i1 0, i32 1
  store %List* %14, %List** %26, align 8
;stmt7:
  ret %Value* %22
;stmt8:
  br label %fail
fail:
;stmt9:
  %28 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 12
  %29 = load %TokenInfo*, %TokenInfo** %28
  %30 = call %Value* (%TokenInfo*) @value_new_poison (%TokenInfo* %29)
  ret %Value* %30
}

define i1 @func410 (%Unit*, %Unit*, %Unit*, %Nat32) {
;stmt0:
  %5 = bitcast %Unit* %0 to %Decl*
;stmt1:
  %6 = bitcast %Unit* %1 to %AstValue*
;stmt2:
  %7 = bitcast %Unit* %2 to %func409.type6*
;stmt3:
  %8 = icmp eq %AstValue* %6, zeroinitializer
  br i1 %8, label %then_0, label %else_0
then_0:
;stmt4:
  %9 = bitcast [21 x %Nat8]* @func409_func410_str1 to %Str
  %10 = getelementptr inbounds %func409.type6, %func409.type6* %7, i1 0, i32 3
  %11 = load %TokenInfo*, %TokenInfo** %10
  call void (%Str, %TokenInfo*) @error (%Str %9, %TokenInfo* %11)
;stmt5:
  ret i1 0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt6:
  %13 = call %Value* (%AstValue*) @func400 (%AstValue* %6)
;stmt7:
  %14 = icmp eq %Decl* %5, zeroinitializer
  br i1 %14, label %then_1, label %else_1
then_1:
;stmt8:
  %15 = getelementptr inbounds %func409.type6, %func409.type6* %7, i1 0, i32 0
  %16 = load %Value*, %Value** %15
  %17 = getelementptr inbounds %Value, %Value* %16, i1 0, i32 1
  %18 = load %Type*, %Type** %17
  %19 = getelementptr inbounds %Type, %Type* %18, i1 0, i32 5
  %20 = getelementptr inbounds %TypeFunc, %TypeFunc* %19, i1 0, i32 2
  %21 = load i1, i1* %20
  %22 = xor i1 %21, 1
  br i1 %22, label %then_2, label %else_2
then_2:
;stmt9:
  %23 = bitcast [16 x %Nat8]* @func409_func410_str2 to %Str
  %24 = getelementptr inbounds %Value, %Value* %13, i1 0, i32 19
  %25 = load %TokenInfo*, %TokenInfo** %24
  call void (%Str, %TokenInfo*) @error (%Str %23, %TokenInfo* %25)
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
;stmt10:
  %26 = call %Value* (%Value*) @func443 (%Value* %13)
;stmt11:
  %27 = getelementptr inbounds %func409.type6, %func409.type6* %7, i1 0, i32 2
  %28 = load %List*, %List** %27
  %29 = bitcast %Value* %26 to %Unit*
  %30 = call i1 (%List*, %Unit*) @list_append (%List* %28, %Unit* %29)
;stmt12:
  ret i1 1
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt13:
  %32 = getelementptr inbounds %Decl, %Decl* %5, i1 0, i32 1
  %33 = load %Type*, %Type** %32
  %34 = call %Value* (%Value*, %Type*) @func444 (%Value* %13, %Type* %33)
;stmt14:
  %35 = getelementptr inbounds %Decl, %Decl* %5, i1 0, i32 1
  %36 = load %Type*, %Type** %35
  %37 = getelementptr inbounds %Value, %Value* %34, i1 0, i32 1
  %38 = load %Type*, %Type** %37
  %39 = getelementptr inbounds %Value, %Value* %34, i1 0, i32 19
  %40 = load %TokenInfo*, %TokenInfo** %39
  %41 = call i1 (%Type*, %Type*, %TokenInfo*) @type_check (%Type* %36, %Type* %38, %TokenInfo* %40)
  %42 = xor i1 %41, 1
  br i1 %42, label %then_3, label %else_3
then_3:
  br label %endif_3
else_3:
  br label %endif_3
endif_3:
;stmt15:
  %43 = getelementptr inbounds %func409.type6, %func409.type6* %7, i1 0, i32 2
  %44 = load %List*, %List** %43
  %45 = bitcast %Value* %34 to %Unit*
  %46 = call i1 (%List*, %Unit*) @list_append (%List* %44, %Unit* %45)
;stmt16:
  ret i1 1
}

define %List* @func409 (%Value*, %List*, %TokenInfo*) {
;stmt0:
  %4 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 1
  %5 = load %Type*, %Type** %4
  %6 = getelementptr inbounds %Type, %Type* %5, i1 0, i32 5
  %7 = getelementptr inbounds %TypeFunc, %TypeFunc* %6, i1 0, i32 0
  %8 = load %Type*, %Type** %7
  %9 = getelementptr inbounds %Type, %Type* %8, i1 0, i32 9
  %10 = getelementptr inbounds %TypeRecord, %TypeRecord* %9, i1 0, i32 0
  %11 = load %List*, %List** %10
;stmt1:
  %12 = alloca %func409.type6
  store %func409.type6 zeroinitializer, %func409.type6* %12, align 8
;stmt2:
  %13 = getelementptr inbounds %func409.type6, %func409.type6* %12, i1 0, i32 0
  store %Value* %0, %Value** %13, align 8
;stmt3:
  %14 = getelementptr inbounds %func409.type6, %func409.type6* %12, i1 0, i32 1
  store %List* %11, %List** %14, align 8
;stmt4:
  %15 = getelementptr inbounds %func409.type6, %func409.type6* %12, i1 0, i32 2
  %16 = call %List* () @map_new ()
  store %List* %16, %List** %15, align 8
;stmt5:
  %17 = getelementptr inbounds %func409.type6, %func409.type6* %12, i1 0, i32 3
  store %TokenInfo* %2, %TokenInfo** %17, align 8
;stmt6:
  %18 = getelementptr inbounds %func409.type6, %func409.type6* %12, i1 0
  %19 = bitcast %func409.type6* %18 to %Unit*
  call void (%List*, %List*, %ListWhileHandler2, %Unit*) @list_while2_or (%List* %11, %List* %1, %ListWhileHandler2 @func410, %Unit* %19)
;stmt7:
  %20 = getelementptr inbounds %func409.type6, %func409.type6* %12, i1 0, i32 2
  %21 = load %List*, %List** %20
  ret %List* %21
}

define %Type* @func412 (%Type*) {
;stmt0:
  %2 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 0
  %3 = load %TypeKind, %TypeKind* %2
  br label %select_1_0
select_1_0:
  %4 = icmp eq %TypeKind %3, 11
  br i1 %4, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %5 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 7
  %6 = getelementptr inbounds %TypeArray, %TypeArray* %5, i1 0, i32 0
  %7 = load %Type*, %Type** %6
  br label %select_1_end
select_1_1:
  %8 = bitcast %Type* zeroinitializer to %Type*
  br label %select_1_end
select_1_end:
  %9 = phi %Type* [ %7, %select_1_0_ok ], [ %8, %select_1_1 ]
  ret %Type* %9
}

define %Value* @func411 (%AstValue*) {
;stmt0:
  %2 = alloca %Value*
  %3 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 7
  %4 = getelementptr inbounds %AstValueIndex, %AstValueIndex* %3, i1 0, i32 0
  %5 = load %AstValue*, %AstValue** %4
  %6 = call %Value* (%AstValue*, i1) @func401 (%AstValue* %5, i1 0)
  %7 = call %Value* (%Value*) @func479 (%Value* %6)
  store %Value* %7, %Value** %2, align 8
;stmt1:
  %8 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 7
  %9 = getelementptr inbounds %AstValueIndex, %AstValueIndex* %8, i1 0, i32 1
  %10 = load %AstValue*, %AstValue** %9
  %11 = call %Value* (%AstValue*) @func400 (%AstValue* %10)
;stmt2:
  %12 = load %Value*, %Value** %2
  %13 = getelementptr inbounds %Value, %Value* %12, i1 0, i32 0
  %14 = load %ValueKind, %ValueKind* %13
  %15 = icmp eq %ValueKind %14, 1
  br i1 %15, label %then_0, label %else_0
then_0:
;stmt3:
  br label %fail
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt4:
  %17 = getelementptr inbounds %Value, %Value* %11, i1 0, i32 0
  %18 = load %ValueKind, %ValueKind* %17
  %19 = icmp eq %ValueKind %18, 1
  br i1 %19, label %then_1, label %else_1
then_1:
;stmt5:
  br label %fail
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt6:
  %21 = load %Value*, %Value** %2
  %22 = getelementptr inbounds %Value, %Value* %21, i1 0, i32 1
  %23 = load %Type*, %Type** %22
  %24 = getelementptr inbounds %Type, %Type* %23, i1 0, i32 0
  %25 = load %TypeKind, %TypeKind* %24
  br label %select_1_0
select_1_0:
  %26 = icmp eq %TypeKind %25, 11
  br i1 %26, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %27 = load %Value*, %Value** %2
  %28 = getelementptr inbounds %Value, %Value* %27, i1 0, i32 1
  %29 = load %Type*, %Type** %28
  %30 = getelementptr inbounds %Type, %Type* %29, i1 0, i32 7
  %31 = getelementptr inbounds %TypeArray, %TypeArray* %30, i1 0, i32 0
  %32 = load %Type*, %Type** %31
  br label %select_1_end
select_1_1:
  %33 = icmp eq %TypeKind %25, 12
  br i1 %33, label %select_1_1_ok, label %select_1_2
select_1_1_ok:
  %34 = load %Value*, %Value** %2
  %35 = getelementptr inbounds %Value, %Value* %34, i1 0, i32 1
  %36 = load %Type*, %Type** %35
  %37 = getelementptr inbounds %Type, %Type* %36, i1 0, i32 8
  %38 = getelementptr inbounds %TypeArrayU, %TypeArrayU* %37, i1 0, i32 0
  %39 = load %Type*, %Type** %38
  br label %select_1_end
select_1_2:
  %40 = icmp eq %TypeKind %25, 10
  br i1 %40, label %select_1_2_ok, label %select_1_3
select_1_2_ok:
  %41 = load %Value*, %Value** %2
  %42 = getelementptr inbounds %Value, %Value* %41, i1 0, i32 1
  %43 = load %Type*, %Type** %42
  %44 = getelementptr inbounds %Type, %Type* %43, i1 0, i32 6
  %45 = getelementptr inbounds %TypePointer, %TypePointer* %44, i1 0, i32 0
  %46 = load %Type*, %Type** %45
  %47 = call %Type* (%Type*) @func412 (%Type* %46)
  br label %select_1_end
select_1_3:
  %48 = bitcast %Type* zeroinitializer to %Type*
  br label %select_1_end
select_1_end:
  %49 = phi %Type* [ %32, %select_1_0_ok ], [ %39, %select_1_1_ok ], [ %47, %select_1_2_ok ], [ %48, %select_1_3 ]
;stmt7:
  %50 = icmp eq %Type* %49, zeroinitializer
  br i1 %50, label %then_2, label %else_2
then_2:
;stmt8:
  %51 = load %Value*, %Value** %2
  %52 = getelementptr inbounds %Value, %Value* %51, i1 0, i32 19
  %53 = load %TokenInfo*, %TokenInfo** %52
  %54 = load %Value*, %Value** %2
  %55 = getelementptr inbounds %Value, %Value* %54, i1 0, i32 1
  %56 = load %Type*, %Type** %55
  call void (%TokenInfo*, %Type*, %Type*) @error_type_error (%TokenInfo* %53, %Type* %56, %Type* zeroinitializer)
;stmt9:
  br label %fail
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
;stmt10:
  %58 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 12
  %59 = load %TokenInfo*, %TokenInfo** %58
  %60 = call %Value* (%ValueKind, %Type*, %TokenInfo*) @func396 (%ValueKind 32, %Type* %49, %TokenInfo* %59)
;stmt11:
  %61 = getelementptr inbounds %Value, %Value* %60, i1 0, i32 10
  %62 = getelementptr inbounds %ValueIndex, %ValueIndex* %61, i1 0, i32 0
  %63 = load %Value*, %Value** %2
  store %Value* %63, %Value** %62, align 8
;stmt12:
  %64 = getelementptr inbounds %Value, %Value* %60, i1 0, i32 10
  %65 = getelementptr inbounds %ValueIndex, %ValueIndex* %64, i1 0, i32 1
  %66 = call %Value* (%Value*) @func443 (%Value* %11)
  store %Value* %66, %Value** %65, align 8
;stmt13:
  ret %Value* %60
;stmt14:
  br label %fail
fail:
;stmt15:
  %68 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 12
  %69 = load %TokenInfo*, %TokenInfo** %68
  %70 = call %Value* (%TokenInfo*) @value_new_poison (%TokenInfo* %69)
  ret %Value* %70
}

define %Type* @func414 (%Type*) {
;stmt0:
  %2 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 0
  %3 = load %TypeKind, %TypeKind* %2
  br label %select_1_0
select_1_0:
  %4 = icmp eq %TypeKind %3, 9
  br i1 %4, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  br label %select_1_end
select_1_1:
  %5 = bitcast %Type* zeroinitializer to %Type*
  br label %select_1_end
select_1_end:
  %6 = phi %Type* [ %0, %select_1_0_ok ], [ %5, %select_1_1 ]
  ret %Type* %6
}

define %Value* @func413 (%AstValue*) {
;stmt0:
  %2 = alloca %Value*
  %3 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 8
  %4 = getelementptr inbounds %AstValueAccess, %AstValueAccess* %3, i1 0, i32 0
  %5 = load %AstValue*, %AstValue** %4
  %6 = call %Value* (%AstValue*, i1) @func401 (%AstValue* %5, i1 0)
  %7 = call %Value* (%Value*) @func479 (%Value* %6)
  store %Value* %7, %Value** %2, align 8
;stmt1:
  %8 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 8
  %9 = getelementptr inbounds %AstValueAccess, %AstValueAccess* %8, i1 0, i32 1
  %10 = load %AstId*, %AstId** %9
  %11 = getelementptr inbounds %AstId, %AstId* %10, i1 0, i32 0
  %12 = load %Str, %Str* %11
;stmt2:
  %13 = load %Value*, %Value** %2
  %14 = getelementptr inbounds %Value, %Value* %13, i1 0, i32 0
  %15 = load %ValueKind, %ValueKind* %14
  %16 = icmp eq %ValueKind %15, 1
  br i1 %16, label %then_0, label %else_0
then_0:
;stmt3:
  br label %fail
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt4:
  %18 = load %Value*, %Value** %2
  %19 = getelementptr inbounds %Value, %Value* %18, i1 0, i32 1
  %20 = load %Type*, %Type** %19
  %21 = getelementptr inbounds %Type, %Type* %20, i1 0, i32 0
  %22 = load %TypeKind, %TypeKind* %21
  br label %select_1_0
select_1_0:
  %23 = icmp eq %TypeKind %22, 9
  br i1 %23, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %24 = load %Value*, %Value** %2
  %25 = getelementptr inbounds %Value, %Value* %24, i1 0, i32 1
  %26 = load %Type*, %Type** %25
  br label %select_1_end
select_1_1:
  %27 = icmp eq %TypeKind %22, 10
  br i1 %27, label %select_1_1_ok, label %select_1_2
select_1_1_ok:
  %28 = load %Value*, %Value** %2
  %29 = getelementptr inbounds %Value, %Value* %28, i1 0, i32 1
  %30 = load %Type*, %Type** %29
  %31 = getelementptr inbounds %Type, %Type* %30, i1 0, i32 6
  %32 = getelementptr inbounds %TypePointer, %TypePointer* %31, i1 0, i32 0
  %33 = load %Type*, %Type** %32
  %34 = call %Type* (%Type*) @func414 (%Type* %33)
  br label %select_1_end
select_1_2:
  %35 = bitcast %Type* zeroinitializer to %Type*
  br label %select_1_end
select_1_end:
  %36 = phi %Type* [ %26, %select_1_0_ok ], [ %34, %select_1_1_ok ], [ %35, %select_1_2 ]
;stmt5:
  %37 = icmp eq %Type* %36, zeroinitializer
  br i1 %37, label %then_1, label %else_1
then_1:
;stmt6:
  %38 = load %Value*, %Value** %2
  %39 = getelementptr inbounds %Value, %Value* %38, i1 0, i32 19
  %40 = load %TokenInfo*, %TokenInfo** %39
  %41 = load %Value*, %Value** %2
  %42 = getelementptr inbounds %Value, %Value* %41, i1 0, i32 1
  %43 = load %Type*, %Type** %42
  call void (%TokenInfo*, %Type*, %Type*) @error_type_error (%TokenInfo* %40, %Type* %43, %Type* zeroinitializer)
;stmt7:
  br label %fail
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt8:
  %45 = call %Decl* (%Type*, %Str) @func360 (%Type* %36, %Str %12)
;stmt9:
  %46 = icmp eq %Decl* %45, zeroinitializer
  br i1 %46, label %then_2, label %else_2
then_2:
;stmt10:
  %47 = bitcast [16 x %Nat8]* @func413_str1 to %Str
  %48 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 8
  %49 = getelementptr inbounds %AstValueAccess, %AstValueAccess* %48, i1 0, i32 1
  %50 = load %AstId*, %AstId** %49
  %51 = getelementptr inbounds %AstId, %AstId* %50, i1 0, i32 1
  %52 = load %TokenInfo*, %TokenInfo** %51
  call void (%Str, %TokenInfo*) @error (%Str %47, %TokenInfo* %52)
;stmt11:
  br label %fail
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
;stmt12:
  %54 = getelementptr inbounds %Decl, %Decl* %45, i1 0, i32 1
  %55 = load %Type*, %Type** %54
  %56 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 12
  %57 = load %TokenInfo*, %TokenInfo** %56
  %58 = call %Value* (%ValueKind, %Type*, %TokenInfo*) @func396 (%ValueKind 33, %Type* %55, %TokenInfo* %57)
;stmt13:
  %59 = getelementptr inbounds %Value, %Value* %58, i1 0, i32 11
  %60 = getelementptr inbounds %ValueAccess, %ValueAccess* %59, i1 0, i32 0
  %61 = load %Value*, %Value** %2
  store %Value* %61, %Value** %60, align 8
;stmt14:
  %62 = getelementptr inbounds %Value, %Value* %58, i1 0, i32 11
  %63 = getelementptr inbounds %ValueAccess, %ValueAccess* %62, i1 0, i32 1
  store %Str %12, %Str* %63, align 8
;stmt15:
  ret %Value* %58
;stmt16:
  br label %fail
fail:
;stmt17:
  %65 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 12
  %66 = load %TokenInfo*, %TokenInfo** %65
  %67 = call %Value* (%TokenInfo*) @value_new_poison (%TokenInfo* %66)
  ret %Value* %67
}

define %Value* @do_value_cast_var (%Value*, %Type*, %TokenInfo*) {
;stmt0:
  %4 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 19
  %5 = load %TokenInfo*, %TokenInfo** %4
  %6 = call %Value* (%Value*, %Type*, %TokenInfo*) @func441 (%Value* %0, %Type* %1, %TokenInfo* %5)
  ret %Value* %6
}

define %Value* @do_value_cast_bool (%Value*, %Type*, %TokenInfo*) {
;stmt0:
  %4 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 0
  %5 = load %TypeKind, %TypeKind* %4
  %6 = icmp ne %TypeKind %5, 4
  br i1 %6, label %then_0, label %else_0
then_0:
;stmt1:
  %7 = bitcast [16 x %Nat8]* @func416_str1 to %Str
  call void (%Str, %TokenInfo*) @error (%Str %7, %TokenInfo* %2)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt2:
  %8 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 19
  %9 = load %TokenInfo*, %TokenInfo** %8
  %10 = call %Value* (%Value*, %Type*, %TokenInfo*) @func441 (%Value* %0, %Type* %1, %TokenInfo* %9)
  ret %Value* %10
}

define %Value* @do_value_cast_ref (%Value*, %Type*, %TokenInfo*) {
;stmt0:
  %4 = call i1 (%Type*) @func362 (%Type* %1)
  %5 = xor i1 %4, 1
  br i1 %5, label %then_0, label %else_0
then_0:
;stmt1:
  %6 = bitcast [16 x %Nat8]* @func417_str1 to %Str
  call void (%Str, %TokenInfo*) @error (%Str %6, %TokenInfo* %2)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt2:
  %7 = call %Value* (%Value*, %Type*, %TokenInfo*) @func441 (%Value* %0, %Type* %1, %TokenInfo* %2)
  ret %Value* %7
}

define %Value* @do_value_cast_num (%Value*, %Type*, %TokenInfo*) {
;stmt0:
  %4 = call i1 (%Type*) @func362 (%Type* %1)
  br i1 %4, label %then_0, label %else_0
then_0:
;stmt1:
  %5 = bitcast [16 x %Nat8]* @func418_str1 to %Str
  call void (%Str, %TokenInfo*) @warning (%Str %5, %TokenInfo* %2)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt2:
  %6 = call %Value* (%Value*, %Type*, %TokenInfo*) @func441 (%Value* %0, %Type* %1, %TokenInfo* %2)
  ret %Value* %6
}

define %Value* @do_value_cast_func (%Value*, %Type*, %TokenInfo*) {
;stmt0:
  %4 = call i1 (%Type*) @typeIsPointerToUnit (%Type* %1)
  %5 = xor i1 %4, 1
  br i1 %5, label %then_0, label %else_0
then_0:
;stmt1:
  %6 = bitcast [16 x %Nat8]* @func419_str1 to %Str
  call void (%Str, %TokenInfo*) @error (%Str %6, %TokenInfo* %2)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt2:
  %7 = call %Value* (%Value*, %Type*, %TokenInfo*) @func441 (%Value* %0, %Type* %1, %TokenInfo* %2)
  ret %Value* %7
}

define %Value* @do_value_cast_set (%Value*, %Type*, %TokenInfo*) {
;stmt0:
  %4 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 0
  %5 = load %TypeKind, %TypeKind* %4
  %6 = icmp ne %TypeKind %5, 4
  br i1 %6, label %then_0, label %else_0
then_0:
;stmt1:
  %7 = bitcast [16 x %Nat8]* @func420_str1 to %Str
  call void (%Str, %TokenInfo*) @error (%Str %7, %TokenInfo* %2)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt2:
  %8 = call %Value* (%Value*, %Type*, %TokenInfo*) @func441 (%Value* %0, %Type* %1, %TokenInfo* %2)
  ret %Value* %8
}

define %Value* @do_value_cast_rec (%Value*, %Type*, %TokenInfo*) {
;stmt0:
  %4 = bitcast [16 x %Nat8]* @func421_str1 to %Str
  call void (%Str, %TokenInfo*) @error (%Str %4, %TokenInfo* %2)
;stmt1:
  %5 = call %Value* (%Value*, %Type*, %TokenInfo*) @func441 (%Value* %0, %Type* %1, %TokenInfo* %2)
  ret %Value* %5
}

define %Value* @do_value_cast_ptr (%Value*, %Type*, %TokenInfo*) {
;stmt0:
  %4 = call %Value* (%Value*, %Type*, %TokenInfo*) @func441 (%Value* %0, %Type* %1, %TokenInfo* %2)
  ret %Value* %4
}

define %Value* @do_value_cast_arr (%Value*, %Type*, %TokenInfo*) {
;stmt0:
  %4 = bitcast [16 x %Nat8]* @func423_str1 to %Str
  call void (%Str, %TokenInfo*) @error (%Str %4, %TokenInfo* %2)
;stmt1:
  %5 = call %Value* (%Value*, %Type*, %TokenInfo*) @func441 (%Value* %0, %Type* %1, %TokenInfo* %2)
  ret %Value* %5
}

define %Value* @do_value_cast_uarr (%Value*, %Type*, %TokenInfo*) {
;stmt0:
  %4 = call i1 (%Type*) @typeIsPointerToUnit (%Type* %1)
  %5 = xor i1 %4, 1
  br i1 %5, label %then_0, label %else_0
then_0:
;stmt1:
  %6 = bitcast [16 x %Nat8]* @func424_str1 to %Str
  call void (%Str, %TokenInfo*) @error (%Str %6, %TokenInfo* %2)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt2:
  %7 = call %Value* (%Value*, %Type*, %TokenInfo*) @func441 (%Value* %0, %Type* %1, %TokenInfo* %2)
  ret %Value* %7
}

define %Value* @func426 (%Value*, %Type*, %TokenInfo*) {
;stmt0:
  %4 = bitcast [18 x %Nat8]* @func425_func426_str1 to %Str
  call void (%Str) @fatal (%Str %4)
;stmt1:
  ret %Value* zeroinitializer
}

define %Value* @func425 (%AstValue*) {
;stmt0:
  %2 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 9
  %3 = getelementptr inbounds %AstValueCast, %AstValueCast* %2, i1 0, i32 0
  %4 = load %AstValue*, %AstValue** %3
  %5 = call %Value* (%AstValue*) @func400 (%AstValue* %4)
;stmt1:
  %6 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 9
  %7 = getelementptr inbounds %AstValueCast, %AstValueCast* %6, i1 0, i32 1
  %8 = load %AstType*, %AstType** %7
  %9 = call %Type* (%AstType*) @func371 (%AstType* %8)
;stmt2:
  %10 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 12
  %11 = load %TokenInfo*, %TokenInfo** %10
;stmt3:
  %12 = getelementptr inbounds %Value, %Value* %5, i1 0, i32 0
  %13 = load %ValueKind, %ValueKind* %12
  %14 = icmp eq %ValueKind %13, 1
  br i1 %14, label %then_0, label %else_0
then_0:
;stmt4:
  br label %fail
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt5:
  %16 = getelementptr inbounds %Type, %Type* %9, i1 0, i32 0
  %17 = load %TypeKind, %TypeKind* %16
  %18 = icmp eq %TypeKind %17, 2
  br i1 %18, label %then_1, label %else_1
then_1:
;stmt6:
  br label %fail
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt7:
  %20 = getelementptr inbounds %Type, %Type* %9, i1 0, i32 0
  %21 = load %TypeKind, %TypeKind* %20
  %22 = icmp ne %TypeKind %21, 5
  br i1 %22, label %then_2, label %else_2
then_2:
;stmt8:
  %23 = getelementptr inbounds %Value, %Value* %5, i1 0, i32 1
  %24 = load %Type*, %Type** %23
  %25 = call i1 (%Type*, %Type*) @func391 (%Type* %24, %Type* %9)
  br i1 %25, label %then_3, label %else_3
then_3:
;stmt9:
  %26 = bitcast [18 x %Nat8]* @func425_str1 to %Str
  call void (%Str, %TokenInfo*) @warning (%Str %26, %TokenInfo* %11)
;stmt10:
  ret %Value* %5
  br label %endif_3
else_3:
  br label %endif_3
endif_3:
;stmt11:
  %28 = getelementptr inbounds %Value, %Value* %5, i1 0, i32 1
  %29 = load %Type*, %Type** %28
  %30 = getelementptr inbounds %Type, %Type* %29, i1 0, i32 0
  %31 = load %TypeKind, %TypeKind* %30
  br label %select_1_0
select_1_0:
  %32 = icmp eq %TypeKind %31, 1
  br i1 %32, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %33 = bitcast %Value* zeroinitializer to %Value*
  br label %select_1_end
select_1_1:
  %34 = icmp eq %TypeKind %31, 5
  br i1 %34, label %select_1_1_ok, label %select_1_2
select_1_1_ok:
  %35 = call %Value* (%Value*, %Type*, %TokenInfo*) @do_value_cast_var (%Value* %5, %Type* %9, %TokenInfo* %11)
  br label %select_1_end
select_1_2:
  %36 = icmp eq %TypeKind %31, 6
  br i1 %36, label %select_1_2_ok, label %select_1_3
select_1_2_ok:
  %37 = call %Value* (%Value*, %Type*, %TokenInfo*) @do_value_cast_bool (%Value* %5, %Type* %9, %TokenInfo* %11)
  br label %select_1_end
select_1_3:
  %38 = icmp eq %TypeKind %31, 3
  br i1 %38, label %select_1_3_ok, label %select_1_4
select_1_3_ok:
  %39 = call %Value* (%Value*, %Type*, %TokenInfo*) @do_value_cast_ref (%Value* %5, %Type* %9, %TokenInfo* %11)
  br label %select_1_end
select_1_4:
  %40 = icmp eq %TypeKind %31, 4
  br i1 %40, label %select_1_4_ok, label %select_1_5
select_1_4_ok:
  %41 = call %Value* (%Value*, %Type*, %TokenInfo*) @do_value_cast_num (%Value* %5, %Type* %9, %TokenInfo* %11)
  br label %select_1_end
select_1_5:
  %42 = icmp eq %TypeKind %31, 7
  br i1 %42, label %select_1_5_ok, label %select_1_6
select_1_5_ok:
  %43 = call %Value* (%Value*, %Type*, %TokenInfo*) @do_value_cast_func (%Value* %5, %Type* %9, %TokenInfo* %11)
  br label %select_1_end
select_1_6:
  %44 = icmp eq %TypeKind %31, 8
  br i1 %44, label %select_1_6_ok, label %select_1_7
select_1_6_ok:
  %45 = call %Value* (%Value*, %Type*, %TokenInfo*) @do_value_cast_set (%Value* %5, %Type* %9, %TokenInfo* %11)
  br label %select_1_end
select_1_7:
  %46 = icmp eq %TypeKind %31, 9
  br i1 %46, label %select_1_7_ok, label %select_1_8
select_1_7_ok:
  %47 = call %Value* (%Value*, %Type*, %TokenInfo*) @do_value_cast_rec (%Value* %5, %Type* %9, %TokenInfo* %11)
  br label %select_1_end
select_1_8:
  %48 = icmp eq %TypeKind %31, 10
  br i1 %48, label %select_1_8_ok, label %select_1_9
select_1_8_ok:
  %49 = call %Value* (%Value*, %Type*, %TokenInfo*) @do_value_cast_ptr (%Value* %5, %Type* %9, %TokenInfo* %11)
  br label %select_1_end
select_1_9:
  %50 = icmp eq %TypeKind %31, 11
  br i1 %50, label %select_1_9_ok, label %select_1_10
select_1_9_ok:
  %51 = call %Value* (%Value*, %Type*, %TokenInfo*) @do_value_cast_arr (%Value* %5, %Type* %9, %TokenInfo* %11)
  br label %select_1_end
select_1_10:
  %52 = icmp eq %TypeKind %31, 12
  br i1 %52, label %select_1_10_ok, label %select_1_11
select_1_10_ok:
  %53 = call %Value* (%Value*, %Type*, %TokenInfo*) @do_value_cast_uarr (%Value* %5, %Type* %9, %TokenInfo* %11)
  br label %select_1_end
select_1_11:
  %54 = call %Value* (%Value*, %Type*, %TokenInfo*) @func426 (%Value* %5, %Type* %9, %TokenInfo* %11)
  br label %select_1_end
select_1_end:
  %55 = phi %Value* [ %33, %select_1_0_ok ], [ %35, %select_1_1_ok ], [ %37, %select_1_2_ok ], [ %39, %select_1_3_ok ], [ %41, %select_1_4_ok ], [ %43, %select_1_5_ok ], [ %45, %select_1_6_ok ], [ %47, %select_1_7_ok ], [ %49, %select_1_8_ok ], [ %51, %select_1_9_ok ], [ %53, %select_1_10_ok ], [ %54, %select_1_11 ]
  ret %Value* %55
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
;stmt12:
  %57 = getelementptr inbounds %Type, %Type* %9, i1 0, i32 11
  %58 = getelementptr inbounds %TypeVar, %TypeVar* %57, i1 0, i32 0
  %59 = load %Type*, %Type** %58
;stmt13:
  %60 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 12
  %61 = load %TokenInfo*, %TokenInfo** %60
  %62 = call %Value* (%Value*, %Type*, %TokenInfo*) @func441 (%Value* %5, %Type* %59, %TokenInfo* %61)
;stmt14:
  %63 = getelementptr inbounds %Value, %Value* %62, i1 0, i32 1
  %64 = getelementptr inbounds %Value, %Value* %62, i1 0, i32 1
  %65 = load %Type*, %Type** %64
  %66 = getelementptr inbounds %Type, %Type* %9, i1 0, i32 12
  %67 = load %TokenInfo*, %TokenInfo** %66
  %68 = call %Type* (%Type*, %TokenInfo*) @type_var_new (%Type* %65, %TokenInfo* %67)
  store %Type* %68, %Type** %63, align 8
;stmt15:
  %69 = call %Str () @func149 ()
;stmt16:
  %70 = load %FuncContext*, %FuncContext** @fctx
  %71 = icmp ne %FuncContext* %70, zeroinitializer
  br i1 %71, label %then_4, label %else_4
then_4:
;stmt17:
  %72 = alloca %AstId
  store %AstId zeroinitializer, %AstId* %72, align 8
;stmt18:
  %73 = getelementptr inbounds %AstId, %AstId* %72, i1 0, i32 0
  store %Str %69, %Str* %73, align 8
;stmt19:
  %74 = getelementptr inbounds %AstId, %AstId* %72, i1 0, i32 1
  %75 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 12
  %76 = load %TokenInfo*, %TokenInfo** %75
  store %TokenInfo* %76, %TokenInfo** %74, align 8
;stmt20:
  %77 = getelementptr inbounds %AstId, %AstId* %72, i1 0
  %78 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 12
  %79 = load %TokenInfo*, %TokenInfo** %78
  %80 = call %Value* (%AstId*, %Type*, %Value*, %TokenInfo*) @func485 (%AstId* %77, %Type* %9, %Value* %62, %TokenInfo* %79)
  ret %Value* %80
  br label %endif_4
else_4:
;stmt21:
  %82 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 12
  %83 = load %TokenInfo*, %TokenInfo** %82
  %84 = call %Value* (%Str, %Type*, %Value*, %TokenInfo*) @func484 (%Str %69, %Type* %9, %Value* %62, %TokenInfo* %83)
  ret %Value* %84
  br label %endif_4
endif_4:
;stmt22:
  br label %fail
fail:
;stmt23:
  %86 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 12
  %87 = load %TokenInfo*, %TokenInfo** %86
  %88 = call %Value* (%TokenInfo*) @value_new_poison (%TokenInfo* %87)
  ret %Value* %88
}

define %Value* @func427 (%AstValue*) {
;stmt0:
  %2 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 4
  %3 = load %AstType*, %AstType** %2
  %4 = call %Type* (%AstType*) @func371 (%AstType* %3)
;stmt1:
  %5 = getelementptr inbounds %Type, %Type* %4, i1 0, i32 0
  %6 = load %TypeKind, %TypeKind* %5
  %7 = icmp eq %TypeKind %6, 2
  br i1 %7, label %then_0, label %else_0
then_0:
;stmt2:
  br label %fail
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt3:
  %9 = getelementptr inbounds %Type, %Type* %4, i1 0, i32 0
  %10 = load %TypeKind, %TypeKind* %9
  %11 = icmp eq %TypeKind %10, 1
  br i1 %11, label %then_1, label %else_1
then_1:
;stmt4:
  %12 = bitcast [20 x %Nat8]* @func427_str1 to %Str
  %13 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 4
  %14 = load %AstType*, %AstType** %13
  %15 = getelementptr inbounds %AstType, %AstType* %14, i1 0, i32 9
  %16 = load %TokenInfo*, %TokenInfo** %15
  call void (%Str, %TokenInfo*) @error (%Str %12, %TokenInfo* %16)
;stmt5:
  %17 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 12
  %18 = load %TokenInfo*, %TokenInfo** %17
  %19 = call %Value* (%TokenInfo*) @value_new_poison (%TokenInfo* %18)
  ret %Value* %19
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt6:
  %21 = load %Type*, %Type** @typeNumeric
  %22 = getelementptr inbounds %Type, %Type* %4, i1 0, i32 2
  %23 = load %Nat32, %Nat32* %22
  %24 = sext %Nat32 %23 to %Int64
  %25 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 12
  %26 = load %TokenInfo*, %TokenInfo** %25
  %27 = call %Value* (%Type*, %Int64, %TokenInfo*) @func398 (%Type* %21, %Int64 %24, %TokenInfo* %26)
  ret %Value* %27
;stmt7:
  br label %fail
fail:
;stmt8:
  %29 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 12
  %30 = load %TokenInfo*, %TokenInfo** %29
  %31 = call %Value* (%TokenInfo*) @value_new_poison (%TokenInfo* %30)
  ret %Value* %31
}

define %Value* @func428 (%AstValue*) {
;stmt0:
  %2 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 4
  %3 = load %AstType*, %AstType** %2
  %4 = call %Type* (%AstType*) @func371 (%AstType* %3)
;stmt1:
  %5 = getelementptr inbounds %Type, %Type* %4, i1 0, i32 0
  %6 = load %TypeKind, %TypeKind* %5
  %7 = icmp eq %TypeKind %6, 2
  br i1 %7, label %then_0, label %else_0
then_0:
;stmt2:
  br label %fail
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt3:
  %9 = getelementptr inbounds %Type, %Type* %4, i1 0, i32 0
  %10 = load %TypeKind, %TypeKind* %9
  %11 = icmp eq %TypeKind %10, 1
  br i1 %11, label %then_1, label %else_1
then_1:
;stmt4:
  %12 = bitcast [21 x %Nat8]* @func428_str1 to %Str
  %13 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 4
  %14 = load %AstType*, %AstType** %13
  %15 = getelementptr inbounds %AstType, %AstType* %14, i1 0, i32 9
  %16 = load %TokenInfo*, %TokenInfo** %15
  call void (%Str, %TokenInfo*) @error (%Str %12, %TokenInfo* %16)
;stmt5:
  %17 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 12
  %18 = load %TokenInfo*, %TokenInfo** %17
  %19 = call %Value* (%TokenInfo*) @value_new_poison (%TokenInfo* %18)
  ret %Value* %19
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt6:
  %21 = load %Type*, %Type** @typeNumeric
  %22 = getelementptr inbounds %Type, %Type* %4, i1 0, i32 2
  %23 = load %Nat32, %Nat32* %22
  %24 = sext %Nat32 %23 to %Int64
  %25 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 12
  %26 = load %TokenInfo*, %TokenInfo** %25
  %27 = call %Value* (%Type*, %Int64, %TokenInfo*) @func398 (%Type* %21, %Int64 %24, %TokenInfo* %26)
  ret %Value* %27
;stmt7:
  br label %fail
fail:
;stmt8:
  %29 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 12
  %30 = load %TokenInfo*, %TokenInfo** %29
  %31 = call %Value* (%TokenInfo*) @value_new_poison (%TokenInfo* %30)
  ret %Value* %31
}

define %Value* @func429 (%AstValue*) {
;stmt0:
  %2 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 2
  %3 = getelementptr inbounds %AstName, %AstName* %2, i1 0, i32 0
  %4 = load %AstId*, %AstId** %3
  %5 = getelementptr inbounds %AstId, %AstId* %4, i1 0, i32 0
  %6 = load %Str, %Str* %5
;stmt1:
  %7 = call %Value* (%Str) @func132 (%Str %6)
;stmt2:
  %8 = icmp eq %Value* %7, zeroinitializer
  br i1 %8, label %then_0, label %else_0
then_0:
;stmt3:
  %9 = bitcast [15 x %Nat8]* @func429_str1 to %Str
  %10 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 12
  %11 = load %TokenInfo*, %TokenInfo** %10
  call void (%Str, %TokenInfo*) @error (%Str %9, %TokenInfo* %11)
;stmt4:
  %12 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 12
  %13 = load %TokenInfo*, %TokenInfo** %12
  %14 = call %Value* (%TokenInfo*) @value_new_poison (%TokenInfo* %13)
;stmt5:
  ret %Value* %14
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt6:
  ret %Value* %7
}

define %Value* @func430 (%AstValue*) {
;stmt0:
  %2 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 1
  %3 = load %Str, %Str* %2
;stmt1:
  %4 = alloca %Int64
  store %Int64 0, %Int64* %4, align 8
;stmt2:
; eval index uarray
  %5 = getelementptr inbounds %Nat8, %Nat8* %3, %Int64 0
  %6 = load %Nat8, %Nat8* %5
; index array
  %7 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func430_str1, i1 0, %Int64 0
  %8 = load %Nat8, %Nat8* %7
  %9 = icmp eq %Nat8 %6, %8
; eval index uarray
  %10 = getelementptr inbounds %Nat8, %Nat8* %3, %Int64 1
  %11 = load %Nat8, %Nat8* %10
; index array
  %12 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func430_str2, i1 0, %Int64 0
  %13 = load %Nat8, %Nat8* %12
  %14 = icmp eq %Nat8 %11, %13
  %15 = and i1 %9, %14
  br i1 %15, label %then_0, label %else_0
then_0:
;stmt3:
; eval index uarray
  %16 = getelementptr inbounds %Nat8, %Nat8* %3, %Int64 2
  %17 = bitcast %Nat8* %16 to %Unit*
  %18 = bitcast [5 x %Nat8]* @func430_str3 to %Str
  %19 = getelementptr inbounds %Int64, %Int64* %4, i1 0
  %20 = call %Int32 (%Unit*, %Str, ...) @sscanf (%Unit* %17, %Str %18, %Int64* %19)
  br label %endif_0
else_0:
;stmt4:
; eval index uarray
  %21 = getelementptr inbounds %Nat8, %Nat8* %3, %Int64 0
  %22 = bitcast %Nat8* %21 to %Unit*
  %23 = bitcast [5 x %Nat8]* @func430_str4 to %Str
  %24 = getelementptr inbounds %Int64, %Int64* %4, i1 0
  %25 = call %Int32 (%Unit*, %Str, ...) @sscanf (%Unit* %22, %Str %23, %Int64* %24)
  br label %endif_0
endif_0:
;stmt5:
  %26 = load %Type*, %Type** @typeNumeric
  %27 = load %Int64, %Int64* %4
  %28 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 12
  %29 = load %TokenInfo*, %TokenInfo** %28
  %30 = call %Value* (%Type*, %Int64, %TokenInfo*) @func398 (%Type* %26, %Int64 %27, %TokenInfo* %29)
  ret %Value* %30
}

define %Value* @func431 (%AstValue*) {
;stmt0:
  %2 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 1
  %3 = load %Str, %Str* %2
;stmt1:
  %4 = call %Nat32 (%Str) @strlen (%Str %3)
  %5 = add %Nat32 %4, 1
;stmt2:
  %6 = load %Type*, %Type** @typeChar
  %7 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 12
  %8 = load %TokenInfo*, %TokenInfo** %7
  %9 = call %Type* (%Type*, %Nat32, %TokenInfo*) @func356 (%Type* %6, %Nat32 %5, %TokenInfo* %8)
  %10 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 12
  %11 = load %TokenInfo*, %TokenInfo** %10
  %12 = call %Type* (%Type*, %TokenInfo*) @func354 (%Type* %9, %TokenInfo* %11)
;stmt3:
  %13 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 12
  %14 = load %TokenInfo*, %TokenInfo** %13
  %15 = call %Value* (%ValueKind, %Type*, %TokenInfo*) @func396 (%ValueKind 4, %Type* %12, %TokenInfo* %14)
;stmt4:
  %16 = call %Str () @func147 ()
;stmt5:
  %17 = getelementptr inbounds %Value, %Value* %15, i1 0, i32 4
  %18 = getelementptr inbounds %Assembly, %Assembly* @asm0, i1 0
  %19 = call %Definition* (%Assembly*, %Str, %Str, %Nat32) @func250 (%Assembly* %18, %Str %16, %Str %3, %Nat32 %5)
  store %Definition* %19, %Definition** %17, align 8
;stmt6:
  ret %Value* %15
}

define void @func433 (%Unit*, %Unit*, %Nat32) {
;stmt0:
  %4 = bitcast %Unit* %0 to %Decl*
;stmt1:
  %5 = bitcast %Unit* %1 to %Block*
;stmt2:
  %6 = getelementptr inbounds %Decl, %Decl* %4, i1 0, i32 1
  %7 = load %Type*, %Type** %6
  %8 = getelementptr inbounds %Decl, %Decl* %4, i1 0, i32 6
  %9 = load %TokenInfo*, %TokenInfo** %8
  %10 = call %Value* (%ValueKind, %Type*, %TokenInfo*) @func396 (%ValueKind 6, %Type* %7, %TokenInfo* %9)
;stmt3:
  %11 = getelementptr inbounds %Value, %Value* %10, i1 0, i32 6
  store %Decl* %4, %Decl** %11, align 8
;stmt4:
  %12 = getelementptr inbounds %Block, %Block* %5, i1 0, i32 1
  %13 = getelementptr inbounds %Index, %Index* %12, i1 0, i32 1
  %14 = getelementptr inbounds %Decl, %Decl* %4, i1 0, i32 0
  %15 = load %AstId*, %AstId** %14
  %16 = getelementptr inbounds %AstId, %AstId* %15, i1 0, i32 0
  %17 = load %Str, %Str* %16
  %18 = bitcast %Value* %10 to %Unit*
  %19 = call i1 (%List*, %Str, %Unit*) @map_append (%List* %13, %Str %17, %Unit* %18)
  ret void
}

define %Value* @func432 (%AstValue*) {
;stmt0:
  %2 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 5
  %3 = getelementptr inbounds %AstValueFunc, %AstValueFunc* %2, i1 0, i32 0
  %4 = load %AstType*, %AstType** %3
  %5 = call %Type* (%AstType*) @func371 (%AstType* %4)
;stmt1:
  %6 = getelementptr inbounds %Type, %Type* %5, i1 0, i32 0
  %7 = load %TypeKind, %TypeKind* %6
  %8 = icmp eq %TypeKind %7, 2
  br i1 %8, label %then_0, label %else_0
then_0:
;stmt2:
  br label %fail
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt3:
  %10 = load %Nat32, %Nat32* @fuid
  %11 = add %Nat32 %10, 1
  store %Nat32 %11, %Nat32* @fuid, align 4
;stmt4:
  %12 = bitcast [5 x %Nat8]* @func432_str1 to %Str
  %13 = load %Nat32, %Nat32* @fuid
  %14 = call %Str (%Str, %Nat32) @func142 (%Str %12, %Nat32 %13)
;stmt5:
  %15 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 11
  %16 = load i1, i1* %15
  br i1 %16, label %then_1, label %else_1
then_1:
;stmt6:
  %17 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 12
  %18 = load %TokenInfo*, %TokenInfo** %17
  %19 = call %Value* (%ValueKind, %Type*, %TokenInfo*) @func396 (%ValueKind 4, %Type* %5, %TokenInfo* %18)
;stmt7:
  %20 = getelementptr inbounds %Value, %Value* %19, i1 0, i32 4
  %21 = getelementptr inbounds %Assembly, %Assembly* @asm0, i1 0
  %22 = call %Definition* (%Assembly*, %Str, %Type*, %Block*) @func252 (%Assembly* %21, %Str %14, %Type* %5, %Block* zeroinitializer)
  store %Definition* %22, %Definition** %20, align 8
;stmt8:
  ret %Value* %19
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt9:
  %24 = call %Unit* (%Nat32) @malloc (%Nat32 112)
  %25 = bitcast %Unit* %24 to %Block*
  %26 = call %Block* (%Block*, %Block*) @func458 (%Block* %25, %Block* zeroinitializer)
;stmt10:
  %27 = getelementptr inbounds %Type, %Type* %5, i1 0, i32 5
  %28 = getelementptr inbounds %TypeFunc, %TypeFunc* %27, i1 0, i32 0
  %29 = load %Type*, %Type** %28
  %30 = getelementptr inbounds %Type, %Type* %29, i1 0, i32 9
  %31 = getelementptr inbounds %TypeRecord, %TypeRecord* %30, i1 0, i32 0
  %32 = load %List*, %List** %31
  %33 = bitcast %Block* %26 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @func59 (%List* %32, %ListForeachHandler @func433, %Unit* %33)
;stmt11:
  %34 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 5
  %35 = getelementptr inbounds %AstValueFunc, %AstValueFunc* %34, i1 0, i32 1
  %36 = load %AstStmt*, %AstStmt** %35
  %37 = getelementptr inbounds %AstStmt, %AstStmt* %36, i1 0, i32 12
  %38 = load %TokenInfo*, %TokenInfo** %37
  %39 = call %Value* (%ValueKind, %Type*, %TokenInfo*) @func396 (%ValueKind 4, %Type* %5, %TokenInfo* %38)
;stmt12:
  %40 = load %FuncContext*, %FuncContext** @fctx
  %41 = icmp ne %FuncContext* %40, zeroinitializer
  br i1 %41, label %then_2, label %else_2
then_2:
;stmt13:
  %42 = load %FuncContext*, %FuncContext** @fctx
  %43 = getelementptr inbounds %FuncContext, %FuncContext* %42, i1 0, i32 2
  %44 = load %Block*, %Block** %43
  %45 = getelementptr inbounds %Block, %Block* %44, i1 0, i32 3
  %46 = bitcast %Value* %39 to %Unit*
  %47 = call i1 (%List*, %Unit*) @list_append (%List* %45, %Unit* %46)
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
;stmt14:
  %48 = load %FuncContext*, %FuncContext** @fctx
;stmt15:
  %49 = call %Unit* (%Nat32) @malloc (%Nat32 48)
  %50 = bitcast %Unit* %49 to %FuncContext*
  store %FuncContext* %50, %FuncContext** @fctx, align 8
;stmt16:
  %51 = load %FuncContext*, %FuncContext** @fctx
  %52 = bitcast %FuncContext* %51 to %Unit*
  %53 = call %Unit* (%Unit*, %Nat8, %Nat32) @memset (%Unit* %52, %Nat8 0, %Nat32 48)
;stmt17:
  %54 = load %FuncContext*, %FuncContext** @fctx
  %55 = getelementptr inbounds %FuncContext, %FuncContext* %54, i1 0, i32 0
  br label %select_1_0
select_1_0:
  %56 = icmp eq %FuncContext* %48, zeroinitializer
  br i1 %56, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  br label %select_1_end
select_1_1:
  %57 = getelementptr inbounds %FuncContext, %FuncContext* %48, i1 0, i32 0
  %58 = load %Str, %Str* %57
  %59 = bitcast [2 x %Nat8]* @func432_str2 to %Str
  %60 = call %Str (%Str, %Str, %Str) @cat3 (%Str %58, %Str %59, %Str %14)
  br label %select_1_end
select_1_end:
  %61 = phi %Str [ %14, %select_1_0_ok ], [ %60, %select_1_1 ]
  store %Str %61, %Str* %55, align 8
;stmt18:
  %62 = load %FuncContext*, %FuncContext** @fctx
  %63 = getelementptr inbounds %FuncContext, %FuncContext* %62, i1 0, i32 2
  store %Block* %26, %Block** %63, align 8
;stmt19:
  %64 = load %FuncContext*, %FuncContext** @fctx
  %65 = getelementptr inbounds %FuncContext, %FuncContext* %64, i1 0, i32 1
  store %Value* %39, %Value** %65, align 8
;stmt20:
  %66 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 5
  %67 = getelementptr inbounds %AstValueFunc, %AstValueFunc* %66, i1 0, i32 1
  %68 = load %AstStmt*, %AstStmt** %67
  %69 = call %Stmt* (%AstStmt*) @func455 (%AstStmt* %68)
;stmt21:
  %70 = icmp eq %Stmt* %69, zeroinitializer
  br i1 %70, label %then_3, label %else_3
then_3:
;stmt22:
  br label %fail
  br label %endif_3
else_3:
  br label %endif_3
endif_3:
;stmt23:
  %72 = getelementptr inbounds %Value, %Value* %39, i1 0, i32 4
  %73 = getelementptr inbounds %Assembly, %Assembly* @asm0, i1 0
  %74 = getelementptr inbounds %Stmt, %Stmt* %69, i1 0, i32 2
  %75 = call %Definition* (%Assembly*, %Str, %Type*, %Block*) @func252 (%Assembly* %73, %Str %14, %Type* %5, %Block* %74)
  store %Definition* %75, %Definition** %72, align 8
;stmt24:
  store %FuncContext* %48, %FuncContext** @fctx, align 8
;stmt25:
  ret %Value* %39
;stmt26:
  br label %fail
fail:
;stmt27:
  store %FuncContext* %48, %FuncContext** @fctx, align 8
;stmt28:
  %77 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 12
  %78 = load %TokenInfo*, %TokenInfo** %77
  %79 = call %Value* (%TokenInfo*) @value_new_poison (%TokenInfo* %78)
  ret %Value* %79
}

define %Value* @func434 (%AstValue*) {
;stmt0:
  %2 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 12
  %3 = load %TokenInfo*, %TokenInfo** %2
  %4 = call %Value* (%TokenInfo*) @value_new_poison (%TokenInfo* %3)
  ret %Value* %4
}

define %Value* @func435 (%AstValue*) {
;stmt0:
  %2 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 12
  %3 = load %TokenInfo*, %TokenInfo** %2
  %4 = call %Value* (%TokenInfo*) @value_new_poison (%TokenInfo* %3)
  ret %Value* %4
}

define %Value* @func436 (%AstValue*) {
;stmt0:
  %2 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 3
; index array
  %3 = getelementptr inbounds [2 x %AstValue*], [2 x %AstValue*]* %2, i1 0, %Int64 0
  %4 = load %AstValue*, %AstValue** %3
  %5 = call %Value* (%AstValue*) @func400 (%AstValue* %4)
;stmt1:
  %6 = getelementptr inbounds %Value, %Value* %5, i1 0, i32 0
  %7 = load %ValueKind, %ValueKind* %6
  %8 = icmp eq %ValueKind %7, 1
  br i1 %8, label %then_0, label %else_0
then_0:
;stmt2:
  br label %fail
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt3:
  %10 = getelementptr inbounds %Value, %Value* %5, i1 0, i32 0
  %11 = load %ValueKind, %ValueKind* %10
  %12 = icmp eq %ValueKind %11, 3
  br i1 %12, label %then_1, label %else_1
then_1:
;stmt4:
  %13 = getelementptr inbounds %Value, %Value* %5, i1 0, i32 1
  %14 = load %Type*, %Type** %13
  %15 = getelementptr inbounds %Value, %Value* %5, i1 0, i32 2
  %16 = load %Int64, %Int64* %15
  %17 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 12
  %18 = load %TokenInfo*, %TokenInfo** %17
  %19 = call %Value* (%Type*, %Int64, %TokenInfo*) @func398 (%Type* %14, %Int64 %16, %TokenInfo* %18)
  ret %Value* %19
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt5:
  %21 = getelementptr inbounds %Value, %Value* %5, i1 0, i32 1
  %22 = load %Type*, %Type** %21
  %23 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 12
  %24 = load %TokenInfo*, %TokenInfo** %23
  %25 = call %Value* (%ValueKind, %Type*, %TokenInfo*) @func396 (%ValueKind 13, %Type* %22, %TokenInfo* %24)
;stmt6:
  %26 = getelementptr inbounds %Value, %Value* %25, i1 0, i32 8
  %27 = getelementptr inbounds %ValueUn, %ValueUn* %26, i1 0, i32 0
  store %Value* %5, %Value** %27, align 8
;stmt7:
  ret %Value* %25
;stmt8:
  br label %fail
fail:
;stmt9:
  %29 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 12
  %30 = load %TokenInfo*, %TokenInfo** %29
  %31 = call %Value* (%TokenInfo*) @value_new_poison (%TokenInfo* %30)
  ret %Value* %31
}

define %Value* @func437 (%AstValue*) {
;stmt0:
  %2 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 3
; index array
  %3 = getelementptr inbounds [2 x %AstValue*], [2 x %AstValue*]* %2, i1 0, %Int64 0
  %4 = load %AstValue*, %AstValue** %3
  %5 = call %Value* (%AstValue*) @func400 (%AstValue* %4)
;stmt1:
  %6 = getelementptr inbounds %Value, %Value* %5, i1 0, i32 0
  %7 = load %ValueKind, %ValueKind* %6
  %8 = icmp eq %ValueKind %7, 1
  br i1 %8, label %then_0, label %else_0
then_0:
;stmt2:
  br label %fail
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt3:
  %10 = getelementptr inbounds %Value, %Value* %5, i1 0, i32 0
  %11 = load %ValueKind, %ValueKind* %10
  %12 = icmp eq %ValueKind %11, 3
  br i1 %12, label %then_1, label %else_1
then_1:
;stmt4:
  %13 = getelementptr inbounds %Value, %Value* %5, i1 0, i32 1
  %14 = load %Type*, %Type** %13
  %15 = getelementptr inbounds %Value, %Value* %5, i1 0, i32 2
  %16 = load %Int64, %Int64* %15
  %17 = sub nsw %Int64 0, %16
  %18 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 12
  %19 = load %TokenInfo*, %TokenInfo** %18
  %20 = call %Value* (%Type*, %Int64, %TokenInfo*) @func398 (%Type* %14, %Int64 %17, %TokenInfo* %19)
  ret %Value* %20
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt5:
  %22 = getelementptr inbounds %Value, %Value* %5, i1 0, i32 1
  %23 = load %Type*, %Type** %22
  %24 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 12
  %25 = load %TokenInfo*, %TokenInfo** %24
  %26 = call %Value* (%ValueKind, %Type*, %TokenInfo*) @func396 (%ValueKind 12, %Type* %23, %TokenInfo* %25)
;stmt6:
  %27 = getelementptr inbounds %Value, %Value* %26, i1 0, i32 8
  %28 = getelementptr inbounds %ValueUn, %ValueUn* %27, i1 0, i32 0
  store %Value* %5, %Value** %28, align 8
;stmt7:
  ret %Value* %26
;stmt8:
  br label %fail
fail:
;stmt9:
  %30 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 12
  %31 = load %TokenInfo*, %TokenInfo** %30
  %32 = call %Value* (%TokenInfo*) @value_new_poison (%TokenInfo* %31)
  ret %Value* %32
}

define %Value* @func438 (%AstValue*) {
;stmt0:
  %2 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 3
; index array
  %3 = getelementptr inbounds [2 x %AstValue*], [2 x %AstValue*]* %2, i1 0, %Int64 0
  %4 = load %AstValue*, %AstValue** %3
  %5 = call %Value* (%AstValue*) @func400 (%AstValue* %4)
;stmt1:
  %6 = getelementptr inbounds %Value, %Value* %5, i1 0, i32 0
  %7 = load %ValueKind, %ValueKind* %6
  %8 = icmp eq %ValueKind %7, 1
  br i1 %8, label %then_0, label %else_0
then_0:
;stmt2:
  br label %fail
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt3:
  %10 = getelementptr inbounds %Value, %Value* %5, i1 0, i32 0
  %11 = load %ValueKind, %ValueKind* %10
  %12 = icmp eq %ValueKind %11, 3
  br i1 %12, label %then_1, label %else_1
then_1:
;stmt4:
  %13 = getelementptr inbounds %Value, %Value* %5, i1 0, i32 1
  %14 = load %Type*, %Type** %13
  %15 = getelementptr inbounds %Value, %Value* %5, i1 0, i32 2
  %16 = load %Int64, %Int64* %15
  %17 = xor %Int64 %16, -1
  %18 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 12
  %19 = load %TokenInfo*, %TokenInfo** %18
  %20 = call %Value* (%Type*, %Int64, %TokenInfo*) @func398 (%Type* %14, %Int64 %17, %TokenInfo* %19)
  ret %Value* %20
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt5:
  %22 = getelementptr inbounds %Value, %Value* %5, i1 0, i32 1
  %23 = load %Type*, %Type** %22
  %24 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 12
  %25 = load %TokenInfo*, %TokenInfo** %24
  %26 = call %Value* (%ValueKind, %Type*, %TokenInfo*) @func396 (%ValueKind 11, %Type* %23, %TokenInfo* %25)
;stmt6:
  %27 = getelementptr inbounds %Value, %Value* %26, i1 0, i32 8
  %28 = getelementptr inbounds %ValueUn, %ValueUn* %27, i1 0, i32 0
  store %Value* %5, %Value** %28, align 8
;stmt7:
  ret %Value* %26
;stmt8:
  br label %fail
fail:
;stmt9:
  %30 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 12
  %31 = load %TokenInfo*, %TokenInfo** %30
  %32 = call %Value* (%TokenInfo*) @value_new_poison (%TokenInfo* %31)
  ret %Value* %32
}

define %Value* @func439 (%AstValue*) {
;stmt0:
  %2 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 3
; index array
  %3 = getelementptr inbounds [2 x %AstValue*], [2 x %AstValue*]* %2, i1 0, %Int64 0
  %4 = load %AstValue*, %AstValue** %3
  %5 = call %Value* (%AstValue*) @func400 (%AstValue* %4)
;stmt1:
  %6 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 3
; index array
  %7 = getelementptr inbounds [2 x %AstValue*], [2 x %AstValue*]* %6, i1 0, %Int64 1
  %8 = load %AstValue*, %AstValue** %7
  %9 = call %Value* (%AstValue*) @func400 (%AstValue* %8)
;stmt2:
  %10 = getelementptr inbounds %Value, %Value* %5, i1 0, i32 0
  %11 = load %ValueKind, %ValueKind* %10
  %12 = icmp eq %ValueKind %11, 1
  br i1 %12, label %then_0, label %else_0
then_0:
;stmt3:
  br label %fail
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt4:
  %14 = getelementptr inbounds %Value, %Value* %9, i1 0, i32 0
  %15 = load %ValueKind, %ValueKind* %14
  %16 = icmp eq %ValueKind %15, 1
  br i1 %16, label %then_1, label %else_1
then_1:
;stmt5:
  br label %fail
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt6:
  %18 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 0
  %19 = load %AstValueKind, %AstValueKind* %18
  br label %select_1_0
select_1_0:
  %20 = icmp eq %AstValueKind %19, 27
  br i1 %20, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %21 = bitcast %ValueKind 29 to %ValueKind
  br label %select_1_end
select_1_1:
  %22 = bitcast %ValueKind 30 to %ValueKind
  br label %select_1_end
select_1_end:
  %23 = phi %ValueKind [ %21, %select_1_0_ok ], [ %22, %select_1_1 ]
;stmt7:
  %24 = getelementptr inbounds %Value, %Value* %5, i1 0, i32 0
  %25 = load %ValueKind, %ValueKind* %24
  %26 = icmp eq %ValueKind %25, 3
  %27 = getelementptr inbounds %Value, %Value* %9, i1 0, i32 0
  %28 = load %ValueKind, %ValueKind* %27
  %29 = icmp eq %ValueKind %28, 3
  %30 = and i1 %26, %29
  br i1 %30, label %then_2, label %else_2
then_2:
;stmt8:
  br label %select_2_0
select_2_0:
  %31 = icmp eq %ValueKind %23, 29
  br i1 %31, label %select_2_0_ok, label %select_2_1
select_2_0_ok:
  %32 = getelementptr inbounds %Value, %Value* %5, i1 0, i32 2
  %33 = load %Int64, %Int64* %32
  %34 = getelementptr inbounds %Value, %Value* %9, i1 0, i32 2
  %35 = load %Int64, %Int64* %34
  %36 = shl %Int64 %33, %35
  br label %select_2_end
select_2_1:
  %37 = getelementptr inbounds %Value, %Value* %5, i1 0, i32 2
  %38 = load %Int64, %Int64* %37
  %39 = getelementptr inbounds %Value, %Value* %9, i1 0, i32 2
  %40 = load %Int64, %Int64* %39
  %41 = ashr %Int64 %38, %40
  br label %select_2_end
select_2_end:
  %42 = phi %Int64 [ %36, %select_2_0_ok ], [ %41, %select_2_1 ]
;stmt9:
  %43 = getelementptr inbounds %Value, %Value* %5, i1 0, i32 1
  %44 = load %Type*, %Type** %43
  %45 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 12
  %46 = load %TokenInfo*, %TokenInfo** %45
  %47 = call %Value* (%Type*, %Int64, %TokenInfo*) @func398 (%Type* %44, %Int64 %42, %TokenInfo* %46)
  ret %Value* %47
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
;stmt10:
  %49 = call %Value* (%Value*) @func443 (%Value* %5)
;stmt11:
  %50 = getelementptr inbounds %Value, %Value* %5, i1 0, i32 1
  %51 = load %Type*, %Type** %50
  %52 = getelementptr inbounds %Value, %Value* %9, i1 0, i32 19
  %53 = load %TokenInfo*, %TokenInfo** %52
  %54 = call %Value* (%Value*, %Type*, %TokenInfo*) @func441 (%Value* %9, %Type* %51, %TokenInfo* %53)
;stmt12:
  %55 = getelementptr inbounds %Value, %Value* %5, i1 0, i32 1
  %56 = load %Type*, %Type** %55
  %57 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 12
  %58 = load %TokenInfo*, %TokenInfo** %57
  %59 = call %Value* (%ValueKind, %Type*, %TokenInfo*) @func396 (%ValueKind %23, %Type* %56, %TokenInfo* %58)
;stmt13:
  %60 = getelementptr inbounds %Value, %Value* %59, i1 0, i32 9
  %61 = getelementptr inbounds %ValueBin, %ValueBin* %60, i1 0, i32 0
  store %Value* %49, %Value** %61, align 8
;stmt14:
  %62 = getelementptr inbounds %Value, %Value* %59, i1 0, i32 9
  %63 = getelementptr inbounds %ValueBin, %ValueBin* %62, i1 0, i32 1
  store %Value* %54, %Value** %63, align 8
;stmt15:
  ret %Value* %59
;stmt16:
  br label %fail
fail:
;stmt17:
  %65 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 12
  %66 = load %TokenInfo*, %TokenInfo** %65
  %67 = call %Value* (%TokenInfo*) @value_new_poison (%TokenInfo* %66)
  ret %Value* %67
}

define i1 @func440 (%ValueKind, %Type*) {
;stmt0:
  %3 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 0
  %4 = load %TypeKind, %TypeKind* %3
  %5 = icmp eq %TypeKind %4, 2
  br i1 %5, label %then_0, label %else_0
then_0:
;stmt1:
  ret i1 1
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt2:
  %7 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 0
  %8 = load %TypeKind, %TypeKind* %7
  %9 = icmp eq %TypeKind %8, 9
  %10 = call i1 (%Type*) @func363 (%Type* %1)
  %11 = or i1 %9, %10
  br i1 %11, label %then_1, label %else_1
then_1:
;stmt3:
  ret i1 0
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt4:
  %13 = icmp eq %ValueKind %0, 22
  %14 = icmp eq %ValueKind %0, 23
  %15 = or i1 %13, %14
  br i1 %15, label %then_2, label %else_2
then_2:
;stmt5:
  ret i1 1
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
;stmt6:
  %17 = call i1 (%Type*) @func362 (%Type* %1)
  br i1 %17, label %then_3, label %else_3
then_3:
;stmt7:
  ret i1 0
  br label %endif_3
else_3:
  br label %endif_3
endif_3:
;stmt8:
  %19 = icmp ne %ValueKind %0, 21
  %20 = icmp ne %ValueKind %0, 19
  %21 = icmp ne %ValueKind %0, 20
  %22 = and i1 %20, %21
  %23 = and i1 %19, %22
  br i1 %23, label %then_4, label %else_4
then_4:
;stmt9:
  %24 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 0
  %25 = load %TypeKind, %TypeKind* %24
  %26 = icmp eq %TypeKind %25, 8
  %27 = load %Type*, %Type** @typeBool
  %28 = call i1 (%Type*, %Type*) @func391 (%Type* %1, %Type* %27)
  %29 = call i1 (%Type*) @func362 (%Type* %1)
  %30 = or i1 %28, %29
  %31 = or i1 %26, %30
  br i1 %31, label %then_5, label %else_5
then_5:
;stmt10:
  ret i1 0
  br label %endif_5
else_5:
  br label %endif_5
endif_5:
  br label %endif_4
else_4:
  br label %endif_4
endif_4:
;stmt11:
  ret i1 1
}

define i1 @func442 (%Value*, %Type*) {
;stmt0:
  %3 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 0
  %4 = load %ValueKind, %ValueKind* %3
  %5 = icmp eq %ValueKind %4, 3
  ret i1 %5
}

define %Value* @func441 (%Value*, %Type*, %TokenInfo*) {
;stmt0:
  %4 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 0
  %5 = load %ValueKind, %ValueKind* %4
  %6 = icmp eq %ValueKind %5, 1
  br i1 %6, label %then_0, label %else_0
then_0:
;stmt1:
  br label %fail
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt2:
  %8 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 0
  %9 = load %TypeKind, %TypeKind* %8
  %10 = icmp eq %TypeKind %9, 2
  br i1 %10, label %then_1, label %else_1
then_1:
;stmt3:
  br label %fail
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt4:
  %12 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 1
  %13 = load %Type*, %Type** %12
  %14 = call i1 (%Type*, %Type*) @func391 (%Type* %13, %Type* %1)
  br i1 %14, label %then_2, label %else_2
then_2:
;stmt5:
  ret %Value* %0
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
;stmt6:
  %16 = call i1 (%Value*, %Type*) @func442 (%Value* %0, %Type* %1)
  br i1 %16, label %then_3, label %else_3
then_3:
;stmt7:
  %17 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 2
  %18 = load %Int64, %Int64* %17
  %19 = call %Value* (%Type*, %Int64, %TokenInfo*) @func398 (%Type* %1, %Int64 %18, %TokenInfo* %2)
  ret %Value* %19
  br label %endif_3
else_3:
  br label %endif_3
endif_3:
;stmt8:
  %21 = call %Value* (%ValueKind, %Type*, %TokenInfo*) @func396 (%ValueKind 34, %Type* %1, %TokenInfo* %2)
;stmt9:
  %22 = getelementptr inbounds %Value, %Value* %21, i1 0, i32 12
  %23 = getelementptr inbounds %ValueCast, %ValueCast* %22, i1 0, i32 0
  store %Value* %0, %Value** %23, align 8
;stmt10:
  %24 = getelementptr inbounds %Value, %Value* %21, i1 0, i32 12
  %25 = getelementptr inbounds %ValueCast, %ValueCast* %24, i1 0, i32 1
  store %Type* %1, %Type** %25, align 8
;stmt11:
  ret %Value* %21
;stmt12:
  br label %fail
fail:
;stmt13:
  %27 = call %Value* (%TokenInfo*) @value_new_poison (%TokenInfo* %2)
  ret %Value* %27
}

define %Value* @func443 (%Value*) {
;stmt0:
  %2 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 1
  %3 = load %Type*, %Type** %2
  %4 = load %Type*, %Type** @typeNumeric
  %5 = call i1 (%Type*, %Type*) @func391 (%Type* %3, %Type* %4)
  br label %select_1_0
select_1_0:
  %6 = icmp eq i1 %5, 1
  br i1 %6, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %7 = load %Type*, %Type** @typeBaseInt
  %8 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 2
  %9 = load %Int64, %Int64* %8
  %10 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 19
  %11 = load %TokenInfo*, %TokenInfo** %10
  %12 = call %Value* (%Type*, %Int64, %TokenInfo*) @func398 (%Type* %7, %Int64 %9, %TokenInfo* %11)
  br label %select_1_end
select_1_1:
  br label %select_1_end
select_1_end:
  %13 = phi %Value* [ %12, %select_1_0_ok ], [ %0, %select_1_1 ]
  ret %Value* %13
}

define %Value* @func444 (%Value*, %Type*) {
;stmt0:
  %3 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 1
  %4 = load %Type*, %Type** %3
  %5 = icmp ne %Type* %4, zeroinitializer
  %6 = bitcast [29 x %Nat8]* @func444_str1 to %Str
  call void (i1, %Str) @assert (i1 %5, %Str %6)
;stmt1:
  %7 = icmp ne %Type* %1, zeroinitializer
  %8 = bitcast [24 x %Nat8]* @func444_str2 to %Str
  call void (i1, %Str) @assert (i1 %7, %Str %8)
;stmt2:
  %9 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 0
  %10 = load %ValueKind, %ValueKind* %9
  %11 = icmp eq %ValueKind %10, 1
  br i1 %11, label %then_0, label %else_0
then_0:
;stmt3:
  ret %Value* %0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt4:
  %13 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 0
  %14 = load %TypeKind, %TypeKind* %13
  %15 = icmp eq %TypeKind %14, 2
  br i1 %15, label %then_1, label %else_1
then_1:
;stmt5:
  br label %fail
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt6:
  %17 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 0
  %18 = load %ValueKind, %ValueKind* %17
  %19 = icmp eq %ValueKind %18, 3
  br i1 %19, label %then_2, label %else_2
then_2:
;stmt7:
  %20 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 1
  %21 = load %Type*, %Type** %20
  %22 = call i1 (%Type*) @type_is_generic_num (%Type* %21)
  %23 = call i1 (%Type*) @func367 (%Type* %1)
  %24 = and i1 %22, %23
  br i1 %24, label %then_3, label %else_3
then_3:
;stmt8:
  %25 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 4
  %26 = getelementptr inbounds %TypeNumeric, %TypeNumeric* %25, i1 0, i32 0
  %27 = load %Nat32, %Nat32* %26
  %28 = zext %Nat32 %27 to %Nat128
  %29 = shl %Nat128 1, %28
  %30 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 2
  %31 = load %Int64, %Int64* %30
  %32 = zext %Int64 %31 to %Nat128
  %33 = icmp ule %Nat128 %29, %32
  br i1 %33, label %then_4, label %else_4
then_4:
;stmt9:
  %34 = bitcast [14 x %Nat8]* @func444_str3 to %Str
  %35 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 19
  %36 = load %TokenInfo*, %TokenInfo** %35
  call void (%Str, %TokenInfo*) @error (%Str %34, %TokenInfo* %36)
  br label %endif_4
else_4:
  br label %endif_4
endif_4:
;stmt10:
  %37 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 2
  %38 = load %Int64, %Int64* %37
  %39 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 19
  %40 = load %TokenInfo*, %TokenInfo** %39
  %41 = call %Value* (%Type*, %Int64, %TokenInfo*) @func398 (%Type* %1, %Int64 %38, %TokenInfo* %40)
  ret %Value* %41
  br label %endif_3
else_3:
  br label %endif_3
endif_3:
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
;stmt11:
  %43 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 1
  %44 = load %Type*, %Type** %43
  %45 = call i1 (%Type*, %Type*) @func445 (%Type* %44, %Type* %1)
  br i1 %45, label %then_5, label %else_5
then_5:
;stmt12:
  %46 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 19
  %47 = load %TokenInfo*, %TokenInfo** %46
  %48 = call %Value* (%Value*, %Type*, %TokenInfo*) @func441 (%Value* %0, %Type* %1, %TokenInfo* %47)
  ret %Value* %48
  br label %endif_5
else_5:
  br label %endif_5
endif_5:
;stmt13:
  ret %Value* %0
;stmt14:
  br label %fail
fail:
;stmt15:
  %51 = call %Value* (%TokenInfo*) @value_new_poison (%TokenInfo* zeroinitializer)
  ret %Value* %51
}

define i1 @func445 (%Type*, %Type*) {
;stmt0:
  %3 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 0
  %4 = load %TypeKind, %TypeKind* %3
;stmt1:
  %5 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 0
  %6 = load %TypeKind, %TypeKind* %5
;stmt2:
  %7 = icmp eq %TypeKind %4, 3
  br i1 %7, label %then_0, label %else_0
then_0:
;stmt3:
  %8 = icmp eq %TypeKind %6, 10
  %9 = icmp eq %TypeKind %6, 12
  %10 = icmp eq %TypeKind %6, 7
  %11 = or i1 %9, %10
  %12 = or i1 %8, %11
  br i1 %12, label %then_1, label %else_1
then_1:
;stmt4:
  ret i1 1
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt5:
  %14 = icmp eq %TypeKind %4, 10
  br i1 %14, label %then_2, label %else_2
then_2:
;stmt6:
  %15 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 6
  %16 = getelementptr inbounds %TypePointer, %TypePointer* %15, i1 0, i32 0
  %17 = load %Type*, %Type** %16
  %18 = call i1 (%Type*) @func363 (%Type* %17)
  br i1 %18, label %then_3, label %else_3
then_3:
;stmt7:
  %19 = call i1 (%Type*) @func365 (%Type* %1)
  br i1 %19, label %then_4, label %else_4
then_4:
;stmt8:
  ret i1 1
  br label %endif_4
else_4:
  br label %endif_4
endif_4:
  br label %endif_3
else_3:
  br label %endif_3
endif_3:
;stmt9:
  %21 = icmp eq %TypeKind %6, 10
  br i1 %21, label %then_5, label %else_5
then_5:
;stmt10:
  %22 = load %Type*, %Type** @typeFreePtr
  %23 = call i1 (%Type*, %Type*) @func391 (%Type* %0, %Type* %22)
  br i1 %23, label %then_6, label %else_6
then_6:
;stmt11:
  ret i1 1
  br label %endif_6
else_6:
  br label %endif_6
endif_6:
;stmt12:
  %25 = load %Type*, %Type** @typeFreePtr
  %26 = call i1 (%Type*, %Type*) @func391 (%Type* %1, %Type* %25)
  br i1 %26, label %then_7, label %else_7
then_7:
;stmt13:
  ret i1 1
  br label %endif_7
else_7:
  br label %endif_7
endif_7:
  br label %endif_5
else_5:
  br label %endif_5
endif_5:
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
;stmt14:
  ret i1 0
}

define i1 @func446 (%ValueKind) {
;stmt0:
  %2 = icmp eq %ValueKind %0, 9
  %3 = icmp eq %ValueKind %0, 10
  %4 = icmp eq %ValueKind %0, 12
  %5 = icmp eq %ValueKind %0, 13
  %6 = icmp eq %ValueKind %0, 11
  %7 = or i1 %5, %6
  %8 = or i1 %4, %7
  %9 = or i1 %3, %8
  %10 = or i1 %2, %9
  ret i1 %10
}

define i1 @func447 (%ValueKind) {
;stmt0:
  %2 = icmp eq %ValueKind %0, 14
  %3 = icmp eq %ValueKind %0, 15
  %4 = icmp eq %ValueKind %0, 16
  %5 = icmp eq %ValueKind %0, 17
  %6 = icmp eq %ValueKind %0, 18
  %7 = icmp eq %ValueKind %0, 21
  %8 = icmp eq %ValueKind %0, 19
  %9 = icmp eq %ValueKind %0, 20
  %10 = call i1 (%ValueKind) @func448 (%ValueKind %0)
  %11 = or i1 %9, %10
  %12 = or i1 %8, %11
  %13 = or i1 %7, %12
  %14 = or i1 %6, %13
  %15 = or i1 %5, %14
  %16 = or i1 %4, %15
  %17 = or i1 %3, %16
  %18 = or i1 %2, %17
  ret i1 %18
}

define i1 @func448 (%ValueKind) {
;stmt0:
  %2 = icmp eq %ValueKind %0, 22
  %3 = icmp eq %ValueKind %0, 23
  %4 = icmp eq %ValueKind %0, 24
  %5 = icmp eq %ValueKind %0, 25
  %6 = icmp eq %ValueKind %0, 26
  %7 = icmp eq %ValueKind %0, 27
  %8 = or i1 %6, %7
  %9 = or i1 %5, %8
  %10 = or i1 %4, %9
  %11 = or i1 %3, %10
  %12 = or i1 %2, %11
  ret i1 %12
}

define i1 @func449 (%ValueKind) {
;stmt0:
  %2 = icmp eq %ValueKind %0, 29
  %3 = icmp eq %ValueKind %0, 30
  %4 = icmp eq %ValueKind %0, 31
  %5 = icmp eq %ValueKind %0, 32
  %6 = icmp eq %ValueKind %0, 33
  %7 = icmp eq %ValueKind %0, 31
  %8 = icmp eq %ValueKind %0, 34
  %9 = or i1 %7, %8
  %10 = or i1 %6, %9
  %11 = or i1 %5, %10
  %12 = or i1 %4, %11
  %13 = or i1 %3, %12
  %14 = or i1 %2, %13
  ret i1 %14
}

define i1 @func450 (%Value*) {
;stmt0:
  %2 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 1
  %3 = load %Type*, %Type** %2
  %4 = getelementptr inbounds %Type, %Type* %3, i1 0, i32 0
  %5 = load %TypeKind, %TypeKind* %4
  %6 = icmp eq %TypeKind %5, 5
  br i1 %6, label %then_0, label %else_0
then_0:
;stmt1:
  ret i1 0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt2:
  %8 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 0
  %9 = load %ValueKind, %ValueKind* %8
;stmt3:
  %10 = icmp eq %ValueKind %9, 32
  br i1 %10, label %then_1, label %else_1
then_1:
;stmt4:
  %11 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 10
  %12 = getelementptr inbounds %ValueIndex, %ValueIndex* %11, i1 0, i32 0
  %13 = load %Value*, %Value** %12
  %14 = getelementptr inbounds %Value, %Value* %13, i1 0, i32 1
  %15 = load %Type*, %Type** %14
  %16 = call i1 (%Type*) @func363 (%Type* %15)
;stmt5:
  %17 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 10
  %18 = getelementptr inbounds %ValueIndex, %ValueIndex* %17, i1 0, i32 0
  %19 = load %Value*, %Value** %18
  %20 = call i1 (%Value*) @func450 (%Value* %19)
  %21 = and i1 %20, %16
  ret i1 %21
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt6:
  %23 = icmp eq %ValueKind %9, 33
  br i1 %23, label %then_2, label %else_2
then_2:
;stmt7:
  %24 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 11
  %25 = getelementptr inbounds %ValueAccess, %ValueAccess* %24, i1 0, i32 0
  %26 = load %Value*, %Value** %25
  %27 = call i1 (%Value*) @func450 (%Value* %26)
  %28 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 11
  %29 = getelementptr inbounds %ValueAccess, %ValueAccess* %28, i1 0, i32 0
  %30 = load %Value*, %Value** %29
  %31 = getelementptr inbounds %Value, %Value* %30, i1 0, i32 1
  %32 = load %Type*, %Type** %31
  %33 = getelementptr inbounds %Type, %Type* %32, i1 0, i32 0
  %34 = load %TypeKind, %TypeKind* %33
  %35 = icmp ne %TypeKind %34, 10
  %36 = and i1 %27, %35
  ret i1 %36
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
;stmt8:
  %38 = icmp eq %ValueKind %9, 4
  %39 = icmp eq %ValueKind %9, 3
  %40 = icmp eq %ValueKind %9, 7
  %41 = icmp eq %ValueKind %9, 6
  %42 = or i1 %40, %41
  %43 = or i1 %39, %42
  %44 = or i1 %38, %43
  ret i1 %44
}

define i1 @func451 (%Value*) {
;stmt0:
  %2 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 0
  %3 = load %ValueKind, %ValueKind* %2
;stmt1:
  %4 = icmp eq %ValueKind %3, 8
  %5 = icmp eq %ValueKind %3, 5
  %6 = or i1 %4, %5
  ret i1 %6
}

define void @func452 () {
;stmt0:
  %1 = load %Type*, %Type** @typeBool
  %2 = call %Value* (%Type*, %Int64, %TokenInfo*) @func398 (%Type* %1, %Int64 0, %TokenInfo* zeroinitializer)
;stmt1:
  %3 = bitcast [6 x %Nat8]* @func452_str1 to %Str
  call void (%Str, %Value*) @builtin_value_bind (%Str %3, %Value* %2)
;stmt2:
  %4 = load %Type*, %Type** @typeBool
  %5 = call %Value* (%Type*, %Int64, %TokenInfo*) @func398 (%Type* %4, %Int64 1, %TokenInfo* zeroinitializer)
;stmt3:
  %6 = bitcast [5 x %Nat8]* @func452_str2 to %Str
  call void (%Str, %Value*) @builtin_value_bind (%Str %6, %Value* %5)
;stmt4:
  %7 = call %Type* (%TypeKind, %Nat32, %TokenInfo*) @func352 (%TypeKind 3, %Nat32 8, %TokenInfo* zeroinitializer)
;stmt5:
  %8 = call %Value* (%Type*, %Int64, %TokenInfo*) @func398 (%Type* %7, %Int64 0, %TokenInfo* zeroinitializer)
;stmt6:
  %9 = bitcast [4 x %Nat8]* @func452_str3 to %Str
  call void (%Str, %Value*) @builtin_value_bind (%Str %9, %Value* %8)
;stmt7:
  %10 = load %Type*, %Type** @typeUnit
  %11 = call %Value* (%Type*, %Int64, %TokenInfo*) @func398 (%Type* %10, %Int64 0, %TokenInfo* zeroinitializer)
;stmt8:
  %12 = bitcast [5 x %Nat8]* @func452_str4 to %Str
  call void (%Str, %Value*) @builtin_value_bind (%Str %12, %Value* %11)
  ret void
}

define %Stmt* @func453 (%StmtKind, %TokenInfo*) {
;stmt0:
  %3 = call %Unit* (%Nat32) @malloc (%Nat32 216)
  %4 = bitcast %Unit* %3 to %Stmt*
;stmt1:
  %5 = icmp ne %Stmt* %4, zeroinitializer
  %6 = bitcast [9 x %Nat8]* @func453_str1 to %Str
  call void (i1, %Str) @assert (i1 %5, %Str %6)
;stmt2:
  %7 = bitcast %Stmt* %4 to %Unit*
  %8 = call %Unit* (%Unit*, %Nat8, %Nat32) @memset (%Unit* %7, %Nat8 0, %Nat32 216)
;stmt3:
  %9 = getelementptr inbounds %Stmt, %Stmt* %4, i1 0, i32 0
  store %StmtKind %0, %StmtKind* %9, align 2
;stmt4:
  %10 = getelementptr inbounds %Stmt, %Stmt* %4, i1 0, i32 8
  store %TokenInfo* %1, %TokenInfo** %10, align 8
;stmt5:
  ret %Stmt* %4
}

define %Stmt* @func454 (%Value*, %Value*, %TokenInfo*) {
;stmt0:
  %4 = call %Stmt* (%StmtKind, %TokenInfo*) @func453 (%StmtKind 4, %TokenInfo* %2)
;stmt1:
  %5 = getelementptr inbounds %Stmt, %Stmt* %4, i1 0, i32 1
; index array
  %6 = getelementptr inbounds [2 x %Value*], [2 x %Value*]* %5, i1 0, %Int64 0
  store %Value* %0, %Value** %6, align 8
;stmt2:
  %7 = getelementptr inbounds %Stmt, %Stmt* %4, i1 0, i32 1
; index array
  %8 = getelementptr inbounds [2 x %Value*], [2 x %Value*]* %7, i1 0, %Int64 1
  store %Value* %1, %Value** %8, align 8
;stmt3:
  ret %Stmt* %4
}

define %Stmt* @func455 (%AstStmt*) {
;stmt0:
  %2 = getelementptr inbounds %AstStmt, %AstStmt* %0, i1 0, i32 0
  %3 = load %AstStmtKind, %AstStmtKind* %2
  br label %select_1_0
select_1_0:
  %4 = icmp eq %AstStmtKind %3, 5
  br i1 %4, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %5 = call %Stmt* (%AstStmt*) @func456 (%AstStmt* %0)
  br label %select_1_end
select_1_1:
  %6 = icmp eq %AstStmtKind %3, 1
  br i1 %6, label %select_1_1_ok, label %select_1_2
select_1_1_ok:
  %7 = call %Stmt* (%AstStmt*) @func457 (%AstStmt* %0)
  br label %select_1_end
select_1_2:
  %8 = icmp eq %AstStmtKind %3, 6
  br i1 %8, label %select_1_2_ok, label %select_1_3
select_1_2_ok:
  %9 = call %Stmt* (%AstStmt*) @func459 (%AstStmt* %0)
  br label %select_1_end
select_1_3:
  %10 = icmp eq %AstStmtKind %3, 4
  br i1 %10, label %select_1_3_ok, label %select_1_4
select_1_3_ok:
  %11 = call %Stmt* (%AstStmt*) @func461 (%AstStmt* %0)
  br label %select_1_end
select_1_4:
  %12 = icmp eq %AstStmtKind %3, 7
  br i1 %12, label %select_1_4_ok, label %select_1_5
select_1_4_ok:
  %13 = call %Stmt* (%AstStmt*) @func462 (%AstStmt* %0)
  br label %select_1_end
select_1_5:
  %14 = icmp eq %AstStmtKind %3, 8
  br i1 %14, label %select_1_5_ok, label %select_1_6
select_1_5_ok:
  %15 = call %Stmt* (%AstStmt*) @func463 (%AstStmt* %0)
  br label %select_1_end
select_1_6:
  %16 = icmp eq %AstStmtKind %3, 9
  br i1 %16, label %select_1_6_ok, label %select_1_7
select_1_6_ok:
  %17 = call %Stmt* (%AstStmt*) @func464 (%AstStmt* %0)
  br label %select_1_end
select_1_7:
  %18 = icmp eq %AstStmtKind %3, 2
  br i1 %18, label %select_1_7_ok, label %select_1_8
select_1_7_ok:
  %19 = call %Stmt* (%AstStmt*) @func467 (%AstStmt* %0)
  br label %select_1_end
select_1_8:
  %20 = icmp eq %AstStmtKind %3, 10
  br i1 %20, label %select_1_8_ok, label %select_1_9
select_1_8_ok:
  %21 = call %Stmt* (%AstStmt*) @func468 (%AstStmt* %0)
  br label %select_1_end
select_1_9:
  %22 = icmp eq %AstStmtKind %3, 11
  br i1 %22, label %select_1_9_ok, label %select_1_10
select_1_9_ok:
  %23 = call %Stmt* (%AstStmt*) @func469 (%AstStmt* %0)
  br label %select_1_end
select_1_10:
  %24 = icmp eq %AstStmtKind %3, 12
  br i1 %24, label %select_1_10_ok, label %select_1_11
select_1_10_ok:
  %25 = call %Stmt* (%AstStmt*) @func470 (%AstStmt* %0)
  br label %select_1_end
select_1_11:
  %26 = icmp eq %AstStmtKind %3, 13
  br i1 %26, label %select_1_11_ok, label %select_1_12
select_1_11_ok:
  %27 = call %Stmt* (%AstStmt*) @func471 (%AstStmt* %0)
  br label %select_1_end
select_1_12:
  %28 = bitcast %Stmt* zeroinitializer to %Stmt*
  br label %select_1_end
select_1_end:
  %29 = phi %Stmt* [ %5, %select_1_0_ok ], [ %7, %select_1_1_ok ], [ %9, %select_1_2_ok ], [ %11, %select_1_3_ok ], [ %13, %select_1_4_ok ], [ %15, %select_1_5_ok ], [ %17, %select_1_6_ok ], [ %19, %select_1_7_ok ], [ %21, %select_1_8_ok ], [ %23, %select_1_9_ok ], [ %25, %select_1_10_ok ], [ %27, %select_1_11_ok ], [ %28, %select_1_12 ]
  ret %Stmt* %29
}

define %Stmt* @func456 (%AstStmt*) {
;stmt0:
  %2 = getelementptr inbounds %AstStmt, %AstStmt* %0, i1 0, i32 1
  %3 = getelementptr inbounds %AstStmtAssign, %AstStmtAssign* %2, i1 0, i32 1
  %4 = load %AstValue*, %AstValue** %3
  %5 = call %Value* (%AstValue*) @func400 (%AstValue* %4)
;stmt1:
  %6 = getelementptr inbounds %Value, %Value* %5, i1 0, i32 0
  %7 = load %ValueKind, %ValueKind* %6
  %8 = icmp eq %ValueKind %7, 1
  br i1 %8, label %then_0, label %else_0
then_0:
;stmt2:
  ret %Stmt* zeroinitializer
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt3:
  %10 = getelementptr inbounds %AstStmt, %AstStmt* %0, i1 0, i32 1
  %11 = getelementptr inbounds %AstStmtAssign, %AstStmtAssign* %10, i1 0, i32 0
  %12 = load %AstValue*, %AstValue** %11
;stmt4:
  %13 = getelementptr inbounds %AstValue, %AstValue* %12, i1 0, i32 0
  %14 = load %AstValueKind, %AstValueKind* %13
  br label %select_1_0
select_1_0:
  %15 = icmp eq %AstValueKind %14, 4
  br i1 %15, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %16 = call %Value* (%AstValue*) @func429 (%AstValue* %12)
  br label %select_1_end
select_1_1:
  %17 = icmp eq %AstValueKind %14, 9
  br i1 %17, label %select_1_1_ok, label %select_1_2
select_1_1_ok:
  %18 = call %Value* (%AstValue*) @func406 (%AstValue* %12)
  br label %select_1_end
select_1_2:
  %19 = icmp eq %AstValueKind %14, 30
  br i1 %19, label %select_1_2_ok, label %select_1_3
select_1_2_ok:
  %20 = call %Value* (%AstValue*) @func411 (%AstValue* %12)
  br label %select_1_end
select_1_3:
  %21 = icmp eq %AstValueKind %14, 31
  br i1 %21, label %select_1_3_ok, label %select_1_4
select_1_3_ok:
  %22 = call %Value* (%AstValue*) @func413 (%AstValue* %12)
  br label %select_1_end
select_1_4:
  %23 = bitcast %Value* zeroinitializer to %Value*
  br label %select_1_end
select_1_end:
  %24 = phi %Value* [ %16, %select_1_0_ok ], [ %18, %select_1_1_ok ], [ %20, %select_1_2_ok ], [ %22, %select_1_3_ok ], [ %23, %select_1_4 ]
;stmt5:
  %25 = icmp eq %Value* %24, zeroinitializer
  br i1 %25, label %then_1, label %else_1
then_1:
;stmt6:
  %26 = bitcast [16 x %Nat8]* @func456_str1 to %Str
  %27 = getelementptr inbounds %AstValue, %AstValue* %12, i1 0, i32 12
  %28 = load %TokenInfo*, %TokenInfo** %27
  call void (%Str, %TokenInfo*) @error (%Str %26, %TokenInfo* %28)
;stmt7:
  ret %Stmt* zeroinitializer
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt8:
  %30 = call i1 (%Value*) @func450 (%Value* %24)
  br i1 %30, label %then_2, label %else_2
then_2:
;stmt9:
  %31 = bitcast [13 x %Nat8]* @func456_str2 to %Str
  %32 = getelementptr inbounds %AstStmt, %AstStmt* %0, i1 0, i32 12
  %33 = load %TokenInfo*, %TokenInfo** %32
  call void (%Str, %TokenInfo*) @error (%Str %31, %TokenInfo* %33)
;stmt10:
  ret %Stmt* zeroinitializer
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
;stmt11:
  %35 = getelementptr inbounds %AstValue, %AstValue* %12, i1 0, i32 0
  %36 = load %AstValueKind, %AstValueKind* %35
  %37 = icmp ne %AstValueKind %36, 31
  %38 = getelementptr inbounds %AstValue, %AstValue* %12, i1 0, i32 0
  %39 = load %AstValueKind, %AstValueKind* %38
  %40 = icmp ne %AstValueKind %39, 30
  %41 = getelementptr inbounds %AstValue, %AstValue* %12, i1 0, i32 0
  %42 = load %AstValueKind, %AstValueKind* %41
  %43 = icmp ne %AstValueKind %42, 9
  %44 = and i1 %40, %43
  %45 = and i1 %37, %44
  br i1 %45, label %then_3, label %else_3
then_3:
;stmt12:
  %46 = getelementptr inbounds %Value, %Value* %24, i1 0, i32 1
  %47 = load %Type*, %Type** %46
  %48 = getelementptr inbounds %Type, %Type* %47, i1 0, i32 0
  %49 = load %TypeKind, %TypeKind* %48
  %50 = icmp ne %TypeKind %49, 5
  br i1 %50, label %then_4, label %else_4
then_4:
  br label %endif_4
else_4:
  br label %endif_4
endif_4:
  br label %endif_3
else_3:
  br label %endif_3
endif_3:
;stmt13:
  %51 = getelementptr inbounds %Value, %Value* %24, i1 0, i32 1
  %52 = load %Type*, %Type** %51
  %53 = getelementptr inbounds %Type, %Type* %52, i1 0, i32 0
  %54 = load %TypeKind, %TypeKind* %53
  br label %select_2_0
select_2_0:
  %55 = icmp eq %TypeKind %54, 5
  br i1 %55, label %select_2_0_ok, label %select_2_1
select_2_0_ok:
  %56 = getelementptr inbounds %Value, %Value* %24, i1 0, i32 1
  %57 = load %Type*, %Type** %56
  %58 = getelementptr inbounds %Type, %Type* %57, i1 0, i32 11
  %59 = getelementptr inbounds %TypeVar, %TypeVar* %58, i1 0, i32 0
  %60 = load %Type*, %Type** %59
  br label %select_2_end
select_2_1:
  %61 = getelementptr inbounds %Value, %Value* %24, i1 0, i32 1
  %62 = load %Type*, %Type** %61
  br label %select_2_end
select_2_end:
  %63 = phi %Type* [ %60, %select_2_0_ok ], [ %62, %select_2_1 ]
;stmt14:
  %64 = call %Value* (%Value*, %Type*) @func444 (%Value* %5, %Type* %63)
;stmt15:
  %65 = getelementptr inbounds %Value, %Value* %64, i1 0, i32 1
  %66 = load %Type*, %Type** %65
  %67 = getelementptr inbounds %AstStmt, %AstStmt* %0, i1 0, i32 12
  %68 = load %TokenInfo*, %TokenInfo** %67
  %69 = call i1 (%Type*, %Type*, %TokenInfo*) @type_check (%Type* %63, %Type* %66, %TokenInfo* %68)
  %70 = xor i1 %69, 1
  br i1 %70, label %then_5, label %else_5
then_5:
;stmt16:
  ret %Stmt* zeroinitializer
  br label %endif_5
else_5:
  br label %endif_5
endif_5:
;stmt17:
  %72 = getelementptr inbounds %AstStmt, %AstStmt* %0, i1 0, i32 12
  %73 = load %TokenInfo*, %TokenInfo** %72
  %74 = call %Stmt* (%Value*, %Value*, %TokenInfo*) @func454 (%Value* %24, %Value* %64, %TokenInfo* %73)
  ret %Stmt* %74
}

define %Stmt* @func457 (%AstStmt*) {
;stmt0:
  %2 = getelementptr inbounds %AstStmt, %AstStmt* %0, i1 0, i32 3
  %3 = getelementptr inbounds %AstStmtValueDef, %AstStmtValueDef* %2, i1 0, i32 0
  %4 = load %AstId*, %AstId** %3
;stmt1:
  %5 = getelementptr inbounds %AstStmt, %AstStmt* %0, i1 0, i32 3
  %6 = getelementptr inbounds %AstStmtValueDef, %AstStmtValueDef* %5, i1 0, i32 1
  %7 = load %AstValue*, %AstValue** %6
  %8 = call %Value* (%AstValue*, i1) @func401 (%AstValue* %7, i1 0)
;stmt2:
  %9 = getelementptr inbounds %Value, %Value* %8, i1 0, i32 1
  %10 = load %Type*, %Type** %9
  %11 = getelementptr inbounds %Type, %Type* %10, i1 0, i32 0
  %12 = load %TypeKind, %TypeKind* %11
  %13 = icmp ne %TypeKind %12, 5
  br i1 %13, label %then_0, label %else_0
then_0:
;stmt3:
  %14 = getelementptr inbounds %Value, %Value* %8, i1 0, i32 0
  %15 = load %ValueKind, %ValueKind* %14
;stmt4:
  %16 = icmp ne %ValueKind %15, 4
  %17 = icmp ne %ValueKind %15, 3
  %18 = and i1 %16, %17
  %19 = icmp eq %ValueKind %15, 2
  %20 = or i1 %18, %19
  br i1 %20, label %then_1, label %else_1
then_1:
;stmt5:
  %21 = getelementptr inbounds %Value, %Value* %8, i1 0, i32 1
  %22 = load %Type*, %Type** %21
  %23 = getelementptr inbounds %AstStmt, %AstStmt* %0, i1 0, i32 12
  %24 = load %TokenInfo*, %TokenInfo** %23
  %25 = call %Value* (%ValueKind, %Type*, %TokenInfo*) @func396 (%ValueKind 7, %Type* %22, %TokenInfo* %24)
;stmt6:
  %26 = getelementptr inbounds %AstId, %AstId* %4, i1 0, i32 0
  %27 = load %Str, %Str* %26
  call void (%Str, %Value*) @func136 (%Str %27, %Value* %25)
;stmt7:
  %28 = getelementptr inbounds %AstStmt, %AstStmt* %0, i1 0, i32 12
  %29 = load %TokenInfo*, %TokenInfo** %28
  %30 = call %Stmt* (%StmtKind, %TokenInfo*) @func453 (%StmtKind 1, %TokenInfo* %29)
;stmt8:
  %31 = getelementptr inbounds %Stmt, %Stmt* %30, i1 0, i32 3
  %32 = getelementptr inbounds %Expr, %Expr* %31, i1 0, i32 0
  %33 = call %Value* (%Value*) @dold (%Value* %8)
  store %Value* %33, %Value** %32, align 8
;stmt9:
  %34 = getelementptr inbounds %Value, %Value* %25, i1 0, i32 7
  %35 = getelementptr inbounds %Stmt, %Stmt* %30, i1 0, i32 3
  store %Expr* %35, %Expr** %34, align 8
;stmt10:
  ret %Stmt* %30
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt11:
  %37 = load %FuncContext*, %FuncContext** @fctx
  %38 = getelementptr inbounds %FuncContext, %FuncContext* %37, i1 0, i32 2
  %39 = load %Block*, %Block** %38
  %40 = getelementptr inbounds %AstId, %AstId* %4, i1 0, i32 0
  %41 = load %Str, %Str* %40
  call void (%Block*, %Str, %Value*) @func135 (%Block* %39, %Str %41, %Value* %8)
;stmt12:
  ret %Stmt* zeroinitializer
}

define %Block* @func458 (%Block*, %Block*) {
;stmt0:
  %3 = bitcast %Block* %0 to %Unit*
  %4 = call %Unit* (%Unit*, %Nat8, %Nat32) @memset (%Unit* %3, %Nat8 0, %Nat32 112)
;stmt1:
  %5 = getelementptr inbounds %Block, %Block* %0, i1 0, i32 0
  store %Block* %1, %Block** %5, align 8
;stmt2:
  %6 = getelementptr inbounds %Block, %Block* %0, i1 0, i32 1
  call void (%Index*) @func125 (%Index* %6)
;stmt3:
  %7 = getelementptr inbounds %Block, %Block* %0, i1 0, i32 2
  call void (%List*) @map_init (%List* %7)
;stmt4:
  %8 = getelementptr inbounds %Block, %Block* %0, i1 0, i32 3
  call void (%List*) @map_init (%List* %8)
;stmt5:
  ret %Block* %0
}

define void @func460 (%Unit*, %Unit*, %Nat32) {
;stmt0:
  %4 = bitcast %Unit* %0 to %AstStmt*
;stmt1:
  %5 = call %Stmt* (%AstStmt*) @func455 (%AstStmt* %4)
;stmt2:
  %6 = icmp eq %Stmt* %5, zeroinitializer
  br i1 %6, label %then_0, label %else_0
then_0:
;stmt3:
ret void
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt4:
  %8 = bitcast %Unit* %1 to %List*
;stmt5:
  %9 = bitcast %Stmt* %5 to %Unit*
  %10 = call i1 (%List*, %Unit*) @list_append (%List* %8, %Unit* %9)
  ret void
}

define %Stmt* @func459 (%AstStmt*) {
;stmt0:
  %2 = getelementptr inbounds %AstStmt, %AstStmt* %0, i1 0, i32 12
  %3 = load %TokenInfo*, %TokenInfo** %2
  %4 = call %Stmt* (%StmtKind, %TokenInfo*) @func453 (%StmtKind 2, %TokenInfo* %3)
;stmt1:
  %5 = getelementptr inbounds %Stmt, %Stmt* %4, i1 0, i32 2
  %6 = load %FuncContext*, %FuncContext** @fctx
  %7 = getelementptr inbounds %FuncContext, %FuncContext* %6, i1 0, i32 2
  %8 = load %Block*, %Block** %7
  %9 = call %Block* (%Block*, %Block*) @func458 (%Block* %5, %Block* %8)
;stmt2:
  %10 = load %FuncContext*, %FuncContext** @fctx
  %11 = getelementptr inbounds %FuncContext, %FuncContext* %10, i1 0, i32 2
  store %Block* %9, %Block** %11, align 8
;stmt3:
  %12 = getelementptr inbounds %AstStmt, %AstStmt* %0, i1 0, i32 6
  %13 = getelementptr inbounds %AstStmtBlock, %AstStmtBlock* %12, i1 0, i32 0
  %14 = getelementptr inbounds %Block, %Block* %9, i1 0, i32 2
  %15 = bitcast %List* %14 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @func59 (%List* %13, %ListForeachHandler @func460, %Unit* %15)
;stmt4:
  %16 = load %FuncContext*, %FuncContext** @fctx
  %17 = getelementptr inbounds %FuncContext, %FuncContext* %16, i1 0, i32 2
  %18 = getelementptr inbounds %Block, %Block* %9, i1 0, i32 0
  %19 = load %Block*, %Block** %18
  store %Block* %19, %Block** %17, align 8
;stmt5:
  ret %Stmt* %4
}

define %Stmt* @func461 (%AstStmt*) {
;stmt0:
  %2 = getelementptr inbounds %AstStmt, %AstStmt* %0, i1 0, i32 5
  %3 = getelementptr inbounds %AstStmtExpr, %AstStmtExpr* %2, i1 0, i32 0
  %4 = load %AstValue*, %AstValue** %3
  %5 = call %Value* (%AstValue*) @func400 (%AstValue* %4)
;stmt1:
  %6 = getelementptr inbounds %Value, %Value* %5, i1 0, i32 0
  %7 = load %ValueKind, %ValueKind* %6
  %8 = icmp eq %ValueKind %7, 1
  br i1 %8, label %then_0, label %else_0
then_0:
;stmt2:
  ret %Stmt* zeroinitializer
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt3:
  %10 = getelementptr inbounds %Value, %Value* %5, i1 0, i32 1
  %11 = load %Type*, %Type** %10
  %12 = load %Type*, %Type** @typeUnit
  %13 = call i1 (%Type*, %Type*) @func391 (%Type* %11, %Type* %12)
  %14 = xor i1 %13, 1
  br i1 %14, label %then_1, label %else_1
then_1:
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt4:
  %15 = getelementptr inbounds %AstStmt, %AstStmt* %0, i1 0, i32 12
  %16 = load %TokenInfo*, %TokenInfo** %15
  %17 = call %Stmt* (%StmtKind, %TokenInfo*) @func453 (%StmtKind 1, %TokenInfo* %16)
;stmt5:
  %18 = getelementptr inbounds %Stmt, %Stmt* %17, i1 0, i32 3
  %19 = getelementptr inbounds %Expr, %Expr* %18, i1 0, i32 0
  store %Value* %5, %Value** %19, align 8
;stmt6:
  ret %Stmt* %17
}

define %Stmt* @func462 (%AstStmt*) {
;stmt0:
  %2 = getelementptr inbounds %AstStmt, %AstStmt* %0, i1 0, i32 7
  %3 = getelementptr inbounds %AstStmtIf, %AstStmtIf* %2, i1 0, i32 0
  %4 = load %AstValue*, %AstValue** %3
  %5 = call %Value* (%AstValue*) @func400 (%AstValue* %4)
;stmt1:
  %6 = getelementptr inbounds %AstStmt, %AstStmt* %0, i1 0, i32 7
  %7 = getelementptr inbounds %AstStmtIf, %AstStmtIf* %6, i1 0, i32 1
  %8 = load %AstStmt*, %AstStmt** %7
  %9 = call %Stmt* (%AstStmt*) @func455 (%AstStmt* %8)
;stmt2:
  %10 = getelementptr inbounds %AstStmt, %AstStmt* %0, i1 0, i32 7
  %11 = getelementptr inbounds %AstStmtIf, %AstStmtIf* %10, i1 0, i32 2
  %12 = load %AstStmt*, %AstStmt** %11
  br label %select_1_0
select_1_0:
  %13 = icmp eq %AstStmt* %12, zeroinitializer
  br i1 %13, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %14 = bitcast %Stmt* zeroinitializer to %Stmt*
  br label %select_1_end
select_1_1:
  %15 = getelementptr inbounds %AstStmt, %AstStmt* %0, i1 0, i32 7
  %16 = getelementptr inbounds %AstStmtIf, %AstStmtIf* %15, i1 0, i32 2
  %17 = load %AstStmt*, %AstStmt** %16
  %18 = call %Stmt* (%AstStmt*) @func455 (%AstStmt* %17)
  br label %select_1_end
select_1_end:
  %19 = phi %Stmt* [ %14, %select_1_0_ok ], [ %18, %select_1_1 ]
;stmt3:
  %20 = getelementptr inbounds %Value, %Value* %5, i1 0, i32 0
  %21 = load %ValueKind, %ValueKind* %20
  %22 = icmp eq %ValueKind %21, 1
  br i1 %22, label %then_0, label %else_0
then_0:
;stmt4:
  ret %Stmt* zeroinitializer
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt5:
  %24 = load %Type*, %Type** @typeBool
  %25 = getelementptr inbounds %Value, %Value* %5, i1 0, i32 1
  %26 = load %Type*, %Type** %25
  %27 = getelementptr inbounds %Value, %Value* %5, i1 0, i32 19
  %28 = load %TokenInfo*, %TokenInfo** %27
  %29 = call i1 (%Type*, %Type*, %TokenInfo*) @type_check (%Type* %24, %Type* %26, %TokenInfo* %28)
  %30 = xor i1 %29, 1
  br i1 %30, label %then_1, label %else_1
then_1:
;stmt6:
  ret %Stmt* zeroinitializer
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt7:
  %32 = icmp eq %Stmt* %9, zeroinitializer
  br i1 %32, label %then_2, label %else_2
then_2:
;stmt8:
  ret %Stmt* zeroinitializer
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
;stmt9:
  %34 = getelementptr inbounds %AstStmt, %AstStmt* %0, i1 0, i32 12
  %35 = load %TokenInfo*, %TokenInfo** %34
  %36 = call %Stmt* (%StmtKind, %TokenInfo*) @func453 (%StmtKind 5, %TokenInfo* %35)
;stmt10:
  %37 = getelementptr inbounds %Stmt, %Stmt* %36, i1 0, i32 6
  %38 = getelementptr inbounds %If, %If* %37, i1 0, i32 0
  store %Value* %5, %Value** %38, align 8
;stmt11:
  %39 = getelementptr inbounds %Stmt, %Stmt* %36, i1 0, i32 6
  %40 = getelementptr inbounds %If, %If* %39, i1 0, i32 1
  store %Stmt* %9, %Stmt** %40, align 8
;stmt12:
  %41 = getelementptr inbounds %Stmt, %Stmt* %36, i1 0, i32 6
  %42 = getelementptr inbounds %If, %If* %41, i1 0, i32 2
  store %Stmt* %19, %Stmt** %42, align 8
;stmt13:
  ret %Stmt* %36
}

define %Stmt* @func463 (%AstStmt*) {
;stmt0:
  %2 = getelementptr inbounds %AstStmt, %AstStmt* %0, i1 0, i32 8
  %3 = getelementptr inbounds %AstStmtWhile, %AstStmtWhile* %2, i1 0, i32 0
  %4 = load %AstValue*, %AstValue** %3
  %5 = call %Value* (%AstValue*) @func400 (%AstValue* %4)
;stmt1:
  %6 = load %FuncContext*, %FuncContext** @fctx
  %7 = getelementptr inbounds %FuncContext, %FuncContext* %6, i1 0, i32 3
  %8 = load %FuncContext*, %FuncContext** @fctx
  %9 = getelementptr inbounds %FuncContext, %FuncContext* %8, i1 0, i32 3
  %10 = load %Nat32, %Nat32* %9
  %11 = add %Nat32 %10, 1
  store %Nat32 %11, %Nat32* %7, align 4
;stmt2:
  %12 = getelementptr inbounds %AstStmt, %AstStmt* %0, i1 0, i32 8
  %13 = getelementptr inbounds %AstStmtWhile, %AstStmtWhile* %12, i1 0, i32 1
  %14 = load %AstStmt*, %AstStmt** %13
  %15 = call %Stmt* (%AstStmt*) @func455 (%AstStmt* %14)
;stmt3:
  %16 = load %FuncContext*, %FuncContext** @fctx
  %17 = getelementptr inbounds %FuncContext, %FuncContext* %16, i1 0, i32 3
  %18 = load %FuncContext*, %FuncContext** @fctx
  %19 = getelementptr inbounds %FuncContext, %FuncContext* %18, i1 0, i32 3
  %20 = load %Nat32, %Nat32* %19
  %21 = sub %Nat32 %20, 1
  store %Nat32 %21, %Nat32* %17, align 4
;stmt4:
  %22 = getelementptr inbounds %Value, %Value* %5, i1 0, i32 0
  %23 = load %ValueKind, %ValueKind* %22
  %24 = icmp eq %ValueKind %23, 1
  br i1 %24, label %then_0, label %else_0
then_0:
;stmt5:
  ret %Stmt* zeroinitializer
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt6:
  %26 = load %Type*, %Type** @typeBool
  %27 = getelementptr inbounds %Value, %Value* %5, i1 0, i32 1
  %28 = load %Type*, %Type** %27
  %29 = getelementptr inbounds %Value, %Value* %5, i1 0, i32 19
  %30 = load %TokenInfo*, %TokenInfo** %29
  %31 = call i1 (%Type*, %Type*, %TokenInfo*) @type_check (%Type* %26, %Type* %28, %TokenInfo* %30)
  %32 = xor i1 %31, 1
  br i1 %32, label %then_1, label %else_1
then_1:
;stmt7:
  ret %Stmt* zeroinitializer
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt8:
  %34 = icmp eq %Stmt* %15, zeroinitializer
  br i1 %34, label %then_2, label %else_2
then_2:
;stmt9:
  ret %Stmt* zeroinitializer
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
;stmt10:
  %36 = getelementptr inbounds %AstStmt, %AstStmt* %0, i1 0, i32 12
  %37 = load %TokenInfo*, %TokenInfo** %36
  %38 = call %Stmt* (%StmtKind, %TokenInfo*) @func453 (%StmtKind 6, %TokenInfo* %37)
;stmt11:
  %39 = getelementptr inbounds %Stmt, %Stmt* %38, i1 0, i32 5
  %40 = getelementptr inbounds %While, %While* %39, i1 0, i32 0
  store %Value* %5, %Value** %40, align 8
;stmt12:
  %41 = getelementptr inbounds %Stmt, %Stmt* %38, i1 0, i32 5
  %42 = getelementptr inbounds %While, %While* %41, i1 0, i32 1
  store %Stmt* %15, %Stmt** %42, align 8
;stmt13:
  ret %Stmt* %38
}

define %Value* @func465 (%AstValue*, %Type*) {
;stmt0:
  %3 = call %Value* (%AstValue*) @func400 (%AstValue* %0)
;stmt1:
  %4 = getelementptr inbounds %Value, %Value* %3, i1 0, i32 0
  %5 = load %ValueKind, %ValueKind* %4
  %6 = icmp eq %ValueKind %5, 1
  br i1 %6, label %then_0, label %else_0
then_0:
;stmt2:
  ret %Value* zeroinitializer
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt3:
  %8 = call %Value* (%Value*, %Type*) @func444 (%Value* %3, %Type* %1)
;stmt4:
  %9 = getelementptr inbounds %Value, %Value* %8, i1 0, i32 1
  %10 = load %Type*, %Type** %9
  %11 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 12
  %12 = load %TokenInfo*, %TokenInfo** %11
  %13 = call i1 (%Type*, %Type*, %TokenInfo*) @type_check (%Type* %1, %Type* %10, %TokenInfo* %12)
  %14 = xor i1 %13, 1
  br i1 %14, label %then_1, label %else_1
then_1:
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt5:
  ret %Value* %8
}

define %Stmt* @func464 (%AstStmt*) {
;stmt0:
  %2 = load %FuncContext*, %FuncContext** @fctx
  %3 = getelementptr inbounds %FuncContext, %FuncContext* %2, i1 0, i32 1
  %4 = load %Value*, %Value** %3
  %5 = getelementptr inbounds %Value, %Value* %4, i1 0, i32 1
  %6 = load %Type*, %Type** %5
  %7 = getelementptr inbounds %Type, %Type* %6, i1 0, i32 5
  %8 = getelementptr inbounds %TypeFunc, %TypeFunc* %7, i1 0, i32 1
  %9 = load %Type*, %Type** %8
;stmt1:
  %10 = getelementptr inbounds %AstStmt, %AstStmt* %0, i1 0, i32 9
  %11 = getelementptr inbounds %AstStmtReturn, %AstStmtReturn* %10, i1 0, i32 0
  %12 = load %AstValue*, %AstValue** %11
;stmt2:
  br label %select_1_0
select_1_0:
  %13 = icmp eq %AstValue* %12, zeroinitializer
  br i1 %13, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %14 = bitcast %Value* zeroinitializer to %Value*
  br label %select_1_end
select_1_1:
  %15 = call %Value* (%AstValue*, %Type*) @func465 (%AstValue* %12, %Type* %9)
  br label %select_1_end
select_1_end:
  %16 = phi %Value* [ %14, %select_1_0_ok ], [ %15, %select_1_1 ]
;stmt3:
  %17 = getelementptr inbounds %AstStmt, %AstStmt* %0, i1 0, i32 12
  %18 = load %TokenInfo*, %TokenInfo** %17
  %19 = call %Stmt* (%StmtKind, %TokenInfo*) @func453 (%StmtKind 7, %TokenInfo* %18)
;stmt4:
  %20 = getelementptr inbounds %Stmt, %Stmt* %19, i1 0, i32 1
; index array
  %21 = getelementptr inbounds [2 x %Value*], [2 x %Value*]* %20, i1 0, %Int64 0
  store %Value* %16, %Value** %21, align 8
;stmt5:
  ret %Stmt* %19
}

define %Stmt* @func466 (%AstStmt*) {
;stmt0:
  ret %Stmt* zeroinitializer
}

define %Stmt* @func467 (%AstStmt*) {
;stmt0:
  %2 = getelementptr inbounds %AstStmt, %AstStmt* %0, i1 0, i32 4
  %3 = getelementptr inbounds %AstStmtTypeDef, %AstStmtTypeDef* %2, i1 0, i32 0
  %4 = load %AstId*, %AstId** %3
  %5 = getelementptr inbounds %AstId, %AstId* %4, i1 0, i32 0
  %6 = load %Str, %Str* %5
;stmt1:
  %7 = getelementptr inbounds %AstStmt, %AstStmt* %0, i1 0, i32 4
  %8 = getelementptr inbounds %AstStmtTypeDef, %AstStmtTypeDef* %7, i1 0, i32 1
  %9 = load %AstType*, %AstType** %8
  %10 = call %Type* (%AstType*) @func371 (%AstType* %9)
;stmt2:
  %11 = call %Str () @func143 ()
;stmt3:
  %12 = getelementptr inbounds %Type, %Type* %10, i1 0, i32 1
  %13 = load %Str, %Str* %12
  %14 = icmp eq %Str %13, zeroinitializer
  br i1 %14, label %then_0, label %else_0
then_0:
;stmt4:
  %15 = getelementptr inbounds %Type, %Type* %10, i1 0, i32 1
  store %Str %11, %Str* %15, align 8
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt5:
  %16 = load %Module*, %Module** @module
  %17 = getelementptr inbounds %Module, %Module* %16, i1 0, i32 1
  call void (%Index*, %Str, %Type*) @func138 (%Index* %17, %Str %6, %Type* %10)
;stmt6:
  %18 = getelementptr inbounds %Assembly, %Assembly* @asm0, i1 0
  %19 = call %Definition* (%Assembly*, %Str, %Type*) @func249 (%Assembly* %18, %Str %11, %Type* %10)
;stmt7:
  ret %Stmt* zeroinitializer
}

define %Stmt* @func468 (%AstStmt*) {
;stmt0:
  %2 = load %FuncContext*, %FuncContext** @fctx
  %3 = getelementptr inbounds %FuncContext, %FuncContext* %2, i1 0, i32 3
  %4 = load %Nat32, %Nat32* %3
  %5 = icmp eq %Nat32 %4, 0
  br i1 %5, label %then_0, label %else_0
then_0:
;stmt1:
  %6 = bitcast [34 x %Nat8]* @func468_str1 to %Str
  call void (%Str, %TokenInfo*) @error (%Str %6, %TokenInfo* zeroinitializer)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt2:
  %7 = getelementptr inbounds %AstStmt, %AstStmt* %0, i1 0, i32 12
  %8 = load %TokenInfo*, %TokenInfo** %7
  %9 = call %Stmt* (%StmtKind, %TokenInfo*) @func453 (%StmtKind 8, %TokenInfo* %8)
  ret %Stmt* %9
}

define %Stmt* @func469 (%AstStmt*) {
;stmt0:
  %2 = load %FuncContext*, %FuncContext** @fctx
  %3 = getelementptr inbounds %FuncContext, %FuncContext* %2, i1 0, i32 3
  %4 = load %Nat32, %Nat32* %3
  %5 = icmp eq %Nat32 %4, 0
  br i1 %5, label %then_0, label %else_0
then_0:
;stmt1:
  %6 = bitcast [34 x %Nat8]* @func469_str1 to %Str
  call void (%Str, %TokenInfo*) @error (%Str %6, %TokenInfo* zeroinitializer)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt2:
  %7 = getelementptr inbounds %AstStmt, %AstStmt* %0, i1 0, i32 12
  %8 = load %TokenInfo*, %TokenInfo** %7
  %9 = call %Stmt* (%StmtKind, %TokenInfo*) @func453 (%StmtKind 9, %TokenInfo* %8)
  ret %Stmt* %9
}

define %Stmt* @func470 (%AstStmt*) {
;stmt0:
  %2 = getelementptr inbounds %AstStmt, %AstStmt* %0, i1 0, i32 12
  %3 = load %TokenInfo*, %TokenInfo** %2
  %4 = call %Stmt* (%StmtKind, %TokenInfo*) @func453 (%StmtKind 10, %TokenInfo* %3)
;stmt1:
  %5 = getelementptr inbounds %Stmt, %Stmt* %4, i1 0, i32 7
  %6 = getelementptr inbounds %AstStmt, %AstStmt* %0, i1 0, i32 10
  %7 = getelementptr inbounds %AstStmtGoto, %AstStmtGoto* %6, i1 0, i32 0
  %8 = load %AstId*, %AstId** %7
  %9 = getelementptr inbounds %AstId, %AstId* %8, i1 0, i32 0
  %10 = load %Str, %Str* %9
  store %Str %10, %Str* %5, align 8
;stmt2:
  ret %Stmt* %4
}

define %Stmt* @func471 (%AstStmt*) {
;stmt0:
  %2 = getelementptr inbounds %AstStmt, %AstStmt* %0, i1 0, i32 12
  %3 = load %TokenInfo*, %TokenInfo** %2
  %4 = call %Stmt* (%StmtKind, %TokenInfo*) @func453 (%StmtKind 11, %TokenInfo* %3)
;stmt1:
  %5 = getelementptr inbounds %Stmt, %Stmt* %4, i1 0, i32 7
  %6 = getelementptr inbounds %AstStmt, %AstStmt* %0, i1 0, i32 11
  %7 = getelementptr inbounds %AstStmtLabel, %AstStmtLabel* %6, i1 0, i32 0
  %8 = load %AstId*, %AstId** %7
  %9 = getelementptr inbounds %AstId, %AstId* %8, i1 0, i32 0
  %10 = load %Str, %Str* %9
  store %Str %10, %Str* %5, align 8
;stmt2:
  ret %Stmt* %4
}

define void @module_init (%Module*) {
;stmt0:
  %2 = getelementptr inbounds %Module, %Module* %0, i1 0, i32 1
  call void (%Index*) @func125 (%Index* %2)
;stmt1:
  %3 = getelementptr inbounds %Module, %Module* %0, i1 0, i32 0
  call void (%Index*) @func125 (%Index* %3)
  ret void
}

define void @compiler_init () {
;stmt0:
  %1 = call %Unit* (%Nat32) @malloc (%Nat32 144)
  %2 = bitcast %Unit* %1 to %Module*
  store %Module* %2, %Module** @module, align 8
;stmt1:
  %3 = load %Module*, %Module** @module
  call void (%Module*) @module_init (%Module* %3)
;stmt2:
  %4 = getelementptr inbounds %Index, %Index* @builtinIndex, i1 0
  call void (%Index*) @func125 (%Index* %4)
;stmt3:
  call void () @func393 ()
;stmt4:
  call void () @func452 ()
;stmt5:
  %5 = bitcast [4 x %Nat8]* @func473_str1 to %Str
  %6 = call %Int32 (%Str, ...) @printf (%Str %5)
;stmt6:
  %7 = getelementptr inbounds %Assembly, %Assembly* @asm0, i1 0
  %8 = bitcast [7 x %Nat8]* @func473_str2 to %Str
  call void (%Assembly*, %Arch, %Str) @func244 (%Assembly* %7, %Arch 1, %Str %8)
  ret void
}

define void @func476 () {
  ret void
}

define void @func475 (%Unit*, %Unit*, %Nat32) {
;stmt0:
  %4 = bitcast %Unit* %0 to %AstNode*
;stmt1:
  %5 = getelementptr inbounds %AstNode, %AstNode* %4, i1 0, i32 1
  %6 = load %Unit*, %Unit** %5
;stmt2:
  %7 = getelementptr inbounds %AstNode, %AstNode* %4, i1 0, i32 0
  %8 = load %AstNodeKind, %AstNodeKind* %7
  br label %select_1_0
select_1_0:
  %9 = icmp eq %AstNodeKind %8, 2
  br i1 %9, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %10 = bitcast %Unit* %6 to %AstNodeBindType*
  call void (%AstNodeBindType*) @func478 (%AstNodeBindType* %10)
  br label %select_1_end
select_1_1:
  %11 = icmp eq %AstNodeKind %8, 3
  br i1 %11, label %select_1_1_ok, label %select_1_2
select_1_1_ok:
  %12 = bitcast %Unit* %6 to %AstNodeBindValue*
  call void (%AstNodeBindValue*) @func480 (%AstNodeBindValue* %12)
  br label %select_1_end
select_1_2:
  %13 = icmp eq %AstNodeKind %8, 5
  br i1 %13, label %select_1_2_ok, label %select_1_3
select_1_2_ok:
  %14 = bitcast %Unit* %6 to %AstNodeDeclValue*
  call void (%AstNodeDeclValue*) @func481 (%AstNodeDeclValue* %14)
  br label %select_1_end
select_1_3:
  %15 = icmp eq %AstNodeKind %8, 1
  br i1 %15, label %select_1_3_ok, label %select_1_4
select_1_3_ok:
  %16 = bitcast %Unit* %6 to %AstNodeImport*
  call void (%AstNodeImport*) @func477 (%AstNodeImport* %16)
  br label %select_1_end
select_1_4:
  call void () @func476 ()
  br label %select_1_end
select_1_end:
  ret void
}

define %Assembly* @func474 (%AstModule*) {
;stmt0:
  %2 = getelementptr inbounds %AstModule, %AstModule* %0, i1 0, i32 0
  call void (%List*, %ListForeachHandler, %Unit*) @func59 (%List* %2, %ListForeachHandler @func475, %Unit* zeroinitializer)
;stmt1:
  %3 = load %Int32, %Int32* @errcnt
  %4 = icmp sgt %Int32 %3, 0
  br i1 %4, label %then_0, label %else_0
then_0:
;stmt2:
  ret %Assembly* zeroinitializer
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt3:
  %6 = getelementptr inbounds %Assembly, %Assembly* @asm0, i1 0
  ret %Assembly* %6
}

define void @func477 (%AstNodeImport*) {
;stmt0:
  %2 = getelementptr inbounds %AstNodeImport, %AstNodeImport* %0, i1 0, i32 0
  %3 = load %Str, %Str* %2
;stmt1:
  %4 = getelementptr inbounds %List, %List* @imp_list, i1 0
  %5 = call %Unit* (%List*, %Str) @map_get (%List* %4, %Str %3)
  %6 = icmp ne %Unit* %5, zeroinitializer
  br i1 %6, label %then_0, label %else_0
then_0:
;stmt2:
ret void
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt3:
  %8 = getelementptr inbounds %List, %List* @imp_list, i1 0
  %9 = getelementptr inbounds %List, %List* @imp_list, i1 0
  %10 = bitcast %List* %9 to %Unit*
  %11 = call i1 (%List*, %Str, %Unit*) @map_append (%List* %8, %Str %3, %Unit* %10)
;stmt4:
  %12 = bitcast [3 x %Nat8]* @func477_str1 to %Str
  %13 = call %Str (%Str, %Str) @cat (%Str %3, %Str %12)
;stmt5:
  %14 = call i1 (%Str) @exists (%Str %13)
  br i1 %14, label %then_1, label %else_1
then_1:
;stmt6:
  %15 = call %AstModule* (%Str) @parse (%Str %13)
;stmt7:
  %16 = call %Assembly* (%AstModule*) @func474 (%AstModule* %15)
;stmt8:
ret void
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt9:
  %18 = bitcast [10 x %Nat8]* @cfgLibraryVar to %Str
  %19 = call %Str (%Str) @getenv (%Str %18)
;stmt10:
  %20 = bitcast [2 x %Nat8]* @func477_str2 to %Str
  %21 = bitcast [3 x %Nat8]* @func477_str3 to %Str
  %22 = call %Str (%Str, %Str, %Str, %Str) @cat4 (%Str %19, %Str %20, %Str %3, %Str %21)
;stmt11:
  %23 = call i1 (%Str) @exists (%Str %22)
  br i1 %23, label %then_2, label %else_2
then_2:
;stmt12:
  %24 = call %AstModule* (%Str) @parse (%Str %22)
;stmt13:
  %25 = call %Assembly* (%AstModule*) @func474 (%AstModule* %24)
;stmt14:
ret void
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
;stmt15:
  %27 = bitcast [15 x %Nat8]* @func477_str4 to %Str
  %28 = getelementptr inbounds %AstNodeImport, %AstNodeImport* %0, i1 0, i32 1
  %29 = load %TokenInfo*, %TokenInfo** %28
  call void (%Str, %TokenInfo*) @error (%Str %27, %TokenInfo* %29)
  ret void
}

define void @func478 (%AstNodeBindType*) {
;stmt0:
  %2 = getelementptr inbounds %AstNodeBindType, %AstNodeBindType* %0, i1 0, i32 0
  %3 = load %AstId*, %AstId** %2
  %4 = getelementptr inbounds %AstId, %AstId* %3, i1 0, i32 0
  %5 = load %Str, %Str* %4
;stmt1:
  %6 = getelementptr inbounds %AstNodeBindType, %AstNodeBindType* %0, i1 0, i32 1
  %7 = load %AstType*, %AstType** %6
  %8 = call %Type* (%AstType*) @func371 (%AstType* %7)
;stmt2:
  %9 = call %Type* (%Str) @func139 (%Str %5)
;stmt3:
  %10 = icmp ne %Type* %9, zeroinitializer
  br i1 %10, label %then_0, label %else_0
then_0:
;stmt4:
  %11 = getelementptr inbounds %Type, %Type* %9, i1 0, i32 0
  %12 = load %TypeKind, %TypeKind* %11
  %13 = icmp ne %TypeKind %12, 1
  br i1 %13, label %then_1, label %else_1
then_1:
;stmt5:
  %14 = bitcast [18 x %Nat8]* @func478_str1 to %Str
  %15 = getelementptr inbounds %AstNodeBindType, %AstNodeBindType* %0, i1 0, i32 2
  %16 = load %TokenInfo*, %TokenInfo** %15
  call void (%Str, %TokenInfo*) @error (%Str %14, %TokenInfo* %16)
;stmt6:
ret void
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt7:
  %18 = getelementptr inbounds %Type, %Type* %8, i1 0, i32 1
  %19 = load %Str, %Str* %18
  %20 = icmp eq %Str %19, zeroinitializer
  br i1 %20, label %then_2, label %else_2
then_2:
;stmt8:
  %21 = getelementptr inbounds %Type, %Type* %8, i1 0, i32 1
  store %Str %5, %Str* %21, align 8
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
;stmt9:
  %22 = bitcast %Type* %9 to %Unit*
  %23 = bitcast %Type* %8 to %Unit*
  %24 = call %Unit* (%Unit*, %Unit*, %Nat32) @memcpy (%Unit* %22, %Unit* %23, %Nat32 136)
;stmt10:
  %25 = getelementptr inbounds %Assembly, %Assembly* @asm0, i1 0
  %26 = call %Definition* (%Assembly*, %Str, %Type*) @func249 (%Assembly* %25, %Str %5, %Type* %9)
;stmt11:
ret void
  br label %endif_0
else_0:
;stmt12:
  %28 = load %Module*, %Module** @module
  %29 = getelementptr inbounds %Module, %Module* %28, i1 0, i32 0
  call void (%Index*, %Str, %Type*) @func138 (%Index* %29, %Str %5, %Type* %8)
  br label %endif_0
endif_0:
;stmt13:
  %30 = getelementptr inbounds %Assembly, %Assembly* @asm0, i1 0
  %31 = call %Definition* (%Assembly*, %Str, %Type*) @func249 (%Assembly* %30, %Str %5, %Type* %8)
;stmt14:
  %32 = getelementptr inbounds %Type, %Type* %8, i1 0, i32 1
  %33 = load %Str, %Str* %32
  %34 = icmp eq %Str %33, zeroinitializer
  br i1 %34, label %then_3, label %else_3
then_3:
;stmt15:
  %35 = getelementptr inbounds %Type, %Type* %8, i1 0, i32 1
  store %Str %5, %Str* %35, align 8
  br label %endif_3
else_3:
  br label %endif_3
endif_3:
  ret void
}

define %Value* @func479 (%Value*) {
;stmt0:
  %2 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 1
  %3 = load %Type*, %Type** %2
  %4 = getelementptr inbounds %Type, %Type* %3, i1 0, i32 0
  %5 = load %TypeKind, %TypeKind* %4
  %6 = icmp eq %TypeKind %5, 5
  br i1 %6, label %then_0, label %else_0
then_0:
;stmt1:
  %7 = call %Unit* (%Nat32) @malloc (%Nat32 248)
  %8 = bitcast %Unit* %7 to %Value*
;stmt2:
  %9 = bitcast %Value* %8 to %Unit*
  %10 = bitcast %Value* %0 to %Unit*
  %11 = call %Unit* (%Unit*, %Unit*, %Nat32) @memcpy (%Unit* %9, %Unit* %10, %Nat32 248)
;stmt3:
  %12 = getelementptr inbounds %Value, %Value* %8, i1 0, i32 1
  %13 = getelementptr inbounds %Value, %Value* %8, i1 0, i32 1
  %14 = load %Type*, %Type** %13
  %15 = getelementptr inbounds %Type, %Type* %14, i1 0, i32 11
  %16 = getelementptr inbounds %TypeVar, %TypeVar* %15, i1 0, i32 0
  %17 = load %Type*, %Type** %16
  store %Type* %17, %Type** %12, align 8
;stmt4:
  ret %Value* %8
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt5:
  ret %Value* %0
}

define void @func480 (%AstNodeBindValue*) {
;stmt0:
  %2 = getelementptr inbounds %AstNodeBindValue, %AstNodeBindValue* %0, i1 0, i32 0
  %3 = load %AstId*, %AstId** %2
  %4 = getelementptr inbounds %AstId, %AstId* %3, i1 0, i32 0
  %5 = load %Str, %Str* %4
;stmt1:
  %6 = getelementptr inbounds %AstNodeBindValue, %AstNodeBindValue* %0, i1 0, i32 1
  %7 = load %AstValue*, %AstValue** %6
  %8 = call %Value* (%AstValue*, i1) @func401 (%AstValue* %7, i1 0)
;stmt2:
  %9 = call %Value* (%Value*) @func479 (%Value* %8)
;stmt3:
  %10 = call %Value* (%Str) @func131 (%Str %5)
;stmt4:
  %11 = icmp ne %Value* %10, zeroinitializer
  br i1 %11, label %then_0, label %else_0
then_0:
;stmt5:
  %12 = getelementptr inbounds %Value, %Value* %10, i1 0, i32 0
  %13 = load %ValueKind, %ValueKind* %12
  %14 = icmp ne %ValueKind %13, 2
  br i1 %14, label %then_1, label %else_1
then_1:
;stmt6:
  %15 = bitcast [19 x %Nat8]* @func480_str1 to %Str
  %16 = getelementptr inbounds %AstNodeBindValue, %AstNodeBindValue* %0, i1 0, i32 2
  %17 = load %TokenInfo*, %TokenInfo** %16
  call void (%Str, %TokenInfo*) @error (%Str %15, %TokenInfo* %17)
;stmt7:
ret void
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt8:
  %19 = bitcast %Value* %10 to %Unit*
  %20 = bitcast %Value* %9 to %Unit*
  %21 = call %Unit* (%Unit*, %Unit*, %Nat32) @memcpy (%Unit* %19, %Unit* %20, %Nat32 248)
;stmt9:
ret void
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt10:
  call void (%Str, %Value*) @func137 (%Str %5, %Value* %9)
;stmt11:
  %23 = getelementptr inbounds %Value, %Value* %9, i1 0, i32 1
  %24 = load %Type*, %Type** %23
  %25 = getelementptr inbounds %Type, %Type* %24, i1 0, i32 5
  %26 = getelementptr inbounds %TypeFunc, %TypeFunc* %25, i1 0, i32 2
  %27 = bitcast [7 x %Nat8]* @func480_str2 to %Str
  %28 = call %Int32 (%Str, %Str) @strcmp (%Str %27, %Str %5)
  %29 = icmp eq %Int32 %28, 0
  %30 = bitcast [6 x %Nat8]* @func480_str3 to %Str
  %31 = call %Int32 (%Str, %Str) @strcmp (%Str %30, %Str %5)
  %32 = icmp eq %Int32 %31, 0
  %33 = bitcast [7 x %Nat8]* @func480_str4 to %Str
  %34 = call %Int32 (%Str, %Str) @strcmp (%Str %33, %Str %5)
  %35 = icmp eq %Int32 %34, 0
  %36 = bitcast [8 x %Nat8]* @func480_str5 to %Str
  %37 = call %Int32 (%Str, %Str) @strcmp (%Str %36, %Str %5)
  %38 = icmp eq %Int32 %37, 0
  %39 = bitcast [8 x %Nat8]* @func480_str6 to %Str
  %40 = call %Int32 (%Str, %Str) @strcmp (%Str %39, %Str %5)
  %41 = icmp eq %Int32 %40, 0
  %42 = or i1 %38, %41
  %43 = or i1 %35, %42
  %44 = or i1 %32, %43
  %45 = or i1 %29, %44
  store i1 %45, i1* %26, align 1
;stmt12:
  %46 = getelementptr inbounds %Value, %Value* %9, i1 0, i32 4
  %47 = load %Definition*, %Definition** %46
  %48 = icmp ne %Definition* %47, zeroinitializer
  br i1 %48, label %then_2, label %else_2
then_2:
;stmt13:
  %49 = getelementptr inbounds %Value, %Value* %9, i1 0, i32 4
  %50 = load %Definition*, %Definition** %49
  %51 = getelementptr inbounds %Definition, %Definition* %50, i1 0, i32 1
  store %Str %5, %Str* %51, align 8
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
  ret void
}

define void @func482 (%Unit*, %Unit*, %Nat32) {
;stmt0:
  %4 = bitcast %Unit* %0 to %AstId*
;stmt1:
  %5 = bitcast %Unit* %1 to %Type*
;stmt2:
  %6 = getelementptr inbounds %Type, %Type* %5, i1 0, i32 0
  %7 = load %TypeKind, %TypeKind* %6
  %8 = icmp eq %TypeKind %7, 1
  br i1 %8, label %then_0, label %else_0
then_0:
;stmt3:
  %9 = bitcast [15 x %Nat8]* @func481_func482_str1 to %Str
  %10 = getelementptr inbounds %Type, %Type* %5, i1 0, i32 12
  %11 = load %TokenInfo*, %TokenInfo** %10
  call void (%Str, %TokenInfo*) @error (%Str %9, %TokenInfo* %11)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt4:
  call void (%AstId*, %Type*) @func483 (%AstId* %4, %Type* %5)
  ret void
}

define void @func481 (%AstNodeDeclValue*) {
;stmt0:
  %2 = getelementptr inbounds %AstNodeDeclValue, %AstNodeDeclValue* %0, i1 0, i32 0
  %3 = load %AstDecl*, %AstDecl** %2
;stmt1:
  %4 = getelementptr inbounds %AstDecl, %AstDecl* %3, i1 0, i32 1
  %5 = load %AstType*, %AstType** %4
  %6 = call %Type* (%AstType*) @func371 (%AstType* %5)
;stmt2:
  %7 = getelementptr inbounds %AstDecl, %AstDecl* %3, i1 0, i32 0
  %8 = bitcast %Type* %6 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @func59 (%List* %7, %ListForeachHandler @func482, %Unit* %8)
  ret void
}

define void @func483 (%AstId*, %Type*) {
;stmt0:
  %3 = getelementptr inbounds %AstId, %AstId* %0, i1 0, i32 1
  %4 = load %TokenInfo*, %TokenInfo** %3
  %5 = call %Value* (%ValueKind, %Type*, %TokenInfo*) @func396 (%ValueKind 2, %Type* %1, %TokenInfo* %4)
;stmt1:
  %6 = getelementptr inbounds %AstId, %AstId* %0, i1 0, i32 0
  %7 = load %Str, %Str* %6
  call void (%Str, %Value*) @func137 (%Str %7, %Value* %5)
  ret void
}

define %Value* @func484 (%Str, %Type*, %Value*, %TokenInfo*) {
;stmt0:
  %5 = call %Value* (%ValueKind, %Type*, %TokenInfo*) @func396 (%ValueKind 5, %Type* %1, %TokenInfo* %3)
;stmt1:
  %6 = getelementptr inbounds %Value, %Value* %5, i1 0, i32 17
  store i1 1, i1* %6, align 1
;stmt2:
  %7 = getelementptr inbounds %Value, %Value* %5, i1 0, i32 4
  %8 = getelementptr inbounds %Assembly, %Assembly* @asm0, i1 0
  %9 = call %Definition* (%Assembly*, %Str, %Type*, %Value*) @func253 (%Assembly* %8, %Str %0, %Type* %1, %Value* %2)
  store %Definition* %9, %Definition** %7, align 8
;stmt3:
  call void (%Str, %Value*) @func137 (%Str %0, %Value* %5)
;stmt4:
  ret %Value* %5
}

define %Stmt* @func486 (%AstId*, %Type*, %Value*, %TokenInfo*) {
;stmt0:
  %5 = call %Unit* (%Nat32) @malloc (%Nat32 48)
  %6 = bitcast %Unit* %5 to %Decl*
;stmt1:
  %7 = getelementptr inbounds %Decl, %Decl* %6, i1 0, i32 0
  store %AstId* %0, %AstId** %7, align 8
;stmt2:
  %8 = getelementptr inbounds %Decl, %Decl* %6, i1 0, i32 5
  %9 = call %Value* (%Value*) @dold (%Value* %2)
  store %Value* %9, %Value** %8, align 8
;stmt3:
  %10 = getelementptr inbounds %Decl, %Decl* %6, i1 0, i32 1
  store %Type* %1, %Type** %10, align 8
;stmt4:
  %11 = call %Stmt* (%StmtKind, %TokenInfo*) @func453 (%StmtKind 3, %TokenInfo* %3)
;stmt5:
  %12 = getelementptr inbounds %Stmt, %Stmt* %11, i1 0, i32 4
  store %Decl* %6, %Decl** %12, align 8
;stmt6:
  ret %Stmt* %11
}

define void @func487 (%Stmt*) {
;stmt0:
  %2 = load %FuncContext*, %FuncContext** @fctx
  %3 = getelementptr inbounds %FuncContext, %FuncContext* %2, i1 0, i32 2
  %4 = load %Block*, %Block** %3
  %5 = getelementptr inbounds %Block, %Block* %4, i1 0, i32 2
  %6 = bitcast %Stmt* %0 to %Unit*
  %7 = call i1 (%List*, %Unit*) @list_append (%List* %5, %Unit* %6)
  ret void
}

define %Value* @func485 (%AstId*, %Type*, %Value*, %TokenInfo*) {
;stmt0:
  %5 = call %Value* (%ValueKind, %Type*, %TokenInfo*) @func396 (%ValueKind 8, %Type* %1, %TokenInfo* %3)
;stmt1:
  %6 = getelementptr inbounds %AstId, %AstId* %0, i1 0, i32 0
  %7 = load %Str, %Str* %6
  call void (%Str, %Value*) @func136 (%Str %7, %Value* %5)
;stmt2:
  %8 = call %Stmt* (%AstId*, %Type*, %Value*, %TokenInfo*) @func486 (%AstId* %0, %Type* %1, %Value* %2, %TokenInfo* zeroinitializer)
;stmt3:
  call void (%Stmt*) @func487 (%Stmt* %8)
;stmt4:
  %9 = getelementptr inbounds %Value, %Value* %5, i1 0, i32 5
  %10 = getelementptr inbounds %Stmt, %Stmt* %8, i1 0, i32 4
  %11 = load %Decl*, %Decl** %10
  store %Decl* %11, %Decl** %9, align 8
;stmt5:
  ret %Value* %5
}

define %Int32 @main (%Nat32, %Str*) {
;stmt0:
  %3 = bitcast [11 x %Nat8]* @func488_str1 to %Str
  %4 = call %Int32 (%Str, ...) @printf (%Str %3, %Int64 0, %Int64 5)
;stmt1:
  %5 = bitcast [7 x %Nat8]* @func488_str2 to %Str
  %6 = call %AstModule* (%Str) @parse (%Str %5)
;stmt2:
  %7 = load %Int32, %Int32* @errcnt
;stmt3:
  %8 = icmp sgt %Int32 %7, 0
  br i1 %8, label %then_0, label %else_0
then_0:
;stmt4:
  ret %Int32 %7
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt5:
  call void () @compiler_init ()
;stmt6:
  %10 = call %Assembly* (%AstModule*) @func474 (%AstModule* %6)
;stmt7:
  %11 = icmp ne %Assembly* %10, zeroinitializer
  br i1 %11, label %then_1, label %else_1
then_1:
;stmt8:
  %12 = bitcast [11 x %Nat8]* @func488_str3 to %Str
  %13 = load %Nat32, %Nat32* @lines
  %14 = call %Int32 (%Str, ...) @printf (%Str %12, %Nat32 %13)
;stmt9:
  %15 = bitcast [7 x %Nat8]* @func488_str4 to %Str
  call void (%Assembly*, %Str) @func262 (%Assembly* %10, %Str %15)
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt10:
  %16 = load %Int32, %Int32* @errcnt
;stmt11:
  ret %Int32 %16
}

;aliases:


;metadata:
