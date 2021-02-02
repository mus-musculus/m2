; assembly: <name>

; clang out2.ll && ./a.out
; llc out2.ll ; for create .s file from .ll
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.15.0"


%Bool = type i1
%Unit = type i1
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

; aliases:
%union.0 = type %Unit*

%union.1 = type %Unit*

%union.2 = type %Unit*

%union.3 = type %Unit*

%union.4 = type %Unit*

%union.5 = type %Unit*

%union.6 = type {i16, [144 x i8]}

%union.7 = type %Unit*

%union.8 = type %Unit*

%union.9 = type %Unit*

%union.10 = type %Unit*

%union.11 = type %Unit*

%union.12 = type %Unit*

%union.13 = type %Unit*

%union.14 = type %Unit*

%union.15 = type %Unit*

%union.16 = type %Unit*

%union.17 = type %Unit*

%union.18 = type %Unit*

%union.19 = type %Unit*

%union.20 = type %Unit*

%union.21 = type %Unit*

%union.22 = type %Unit*

%union.23 = type %Unit*

%union.24 = type %Unit*

%union.25 = type %Unit*

%union.26 = type %Unit*

%union.27 = type %Unit*

%union.28 = type %Unit*

%union.29 = type %Unit*

%union.30 = type %Unit*

%union.31 = type %Unit*

%union.32 = type %Unit*

%union.33 = type %Unit*

%union.34 = type %Unit*

%union.35 = type %Unit*

%union.36 = type %Unit*

%union.37 = type %Unit*

%union.38 = type %Unit*



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
%List = type {%Node*, %Node*, %Nat64, %Nat32}
%ListForeachHandler = type void (%Unit*, %Unit*, %Nat32, %Node*)*
%ListForeachHandler2 = type void (%Unit*, %Unit*, %Unit*, %Nat32)*
%ListWhileHandler2 = type i1 (%Unit*, %Unit*, %Unit*, %Nat32)*
%ListCompareHandler = type i1 (%Unit*, %Unit*, %Unit*, %Nat32)*
%ListSearchHandler = type i1 (%Unit*, %Unit*, %Nat32)*
%ListMapHandler = type %Unit* (%Unit*, %Unit*, %Nat32)*
%Map = type {%Node*, %Node*, %Nat64, %Nat32}
%MapForeachHandler = type void (%Unit*, %Unit*, %Unit*)*
%TokenKind = type i16
%TokenInfo = type {%Str, %Nat64, %Nat16, %Nat32, %Nat16}
%Token = type {%TokenKind, %TokenInfo, [0 x %Nat8]}
%LexerState = type {%Int32, %TokenKind, [255 x %Nat8], %Nat8, %Nat16, %TokenInfo}
%Source = type {%List}
%ParserState = type {%Source*, %Node*}
%AstNodeList = type {%Node*, %Node*, %Nat64, %Nat32}
%AstModule = type {%List, %Source*}
%AstNodeKind = type i16
%AstNode = type {%AstNodeKind, %Unit*}
%AstId = type {%Str, %TokenInfo*}
%AstName = type {%AstId*, %AstId*, %TokenInfo*}
%AstTypeKind = type i16
%AstTypeEnum = type {%List, %TokenInfo*}
%AstTypeRecord = type {%List, %TokenInfo*}
%AstTypeArray = type {%AstType*, %AstValue*, %TokenInfo*}
%AstTypeArrayU = type {%AstType*, %TokenInfo*}
%AstTypePointer = type {%AstType*, %TokenInfo*}
%AstTypeFunc = type {%AstType*, %AstType*, i1, %TokenInfo*}
%AstTypeVar = type {%AstType*, %TokenInfo*}
%AstTypeUnion = type {%List, %TokenInfo*}
%AstType = type {%AstTypeKind, %AstName, %AstTypeEnum, %AstTypeArray, %AstTypeArrayU, %AstTypePointer, %AstTypeRecord, %AstTypeFunc, %AstTypeVar, %AstTypeUnion, %TokenInfo*}
%AstDecl = type {%List, %AstType*, %TokenInfo*, i1, i1, [10 x %Nat8]}
%AstNodeComment = type {%Str, %TokenInfo*}
%AstNodeImport = type {%Str, %TokenInfo*}
%AstNodeBindType = type {%AstId*, %AstType*, %TokenInfo*}
%AstNodeBindValue = type {%AstId*, %AstValue*, %TokenInfo*}
%AstNodeDeclVar = type {%AstDecl*}
%AstNodeDeclType = type {%AstId*}
%AstNodeDeclValue = type {%AstDecl*}
%AstValueKind = type i16
%AstValueFunc = type {%AstType*, %union.0, %TokenInfo*}
%AstValueCall = type {%AstValue*, %List, %TokenInfo*}
%AstValueIndex = type {%AstValue*, %AstValue*, %TokenInfo*}
%AstValueAccess = type {%AstValue*, %AstId*, %TokenInfo*}
%AstValueCast = type {%AstValue*, %AstType*, %TokenInfo*}
%AstValueIs = type {%AstValue*, %AstType*, %TokenInfo*}
%AstValueAs = type {%AstValue*, %AstType*, %TokenInfo*}
%AstValueWhenVariant = type {%AstType*, %AstValue*, %AstValue*, %TokenInfo*}
%AstValueWhen = type {%AstValue*, %List, %AstValue*, %TokenInfo*}
%AstValueRecord = type {%AstType*, %List, %TokenInfo*}
%AstValueArray = type {%AstType*, %List, %TokenInfo*}
%AstValue = type {%AstValueKind, %Str, %AstName, [2 x %AstValue*], %AstType*, %AstValueRecord, %AstValueArray, %AstValueFunc, %AstValueCall, %AstValueIndex, %AstValueAccess, %AstValueCast, %AstValueIs, %AstValueAs, %AstValueWhen, i1, %TokenInfo*}
%AstStmtKind = type i16
%AstStmtValueDef = type {%AstId*, %AstValue*, %TokenInfo*}
%AstStmtTypeDef = type {%AstId*, %AstType*, %TokenInfo*}
%AstStmtExpr = type {%AstValue*, %TokenInfo*}
%AstStmtAssign = type {%AstValue*, %AstValue*, %TokenInfo*}
%AstStmtBlock = type {%List, %TokenInfo*}
%AstStmtIf = type {%AstValue*, %AstStmt*, %union.1, %TokenInfo*}
%AstStmtWhile = type {%AstValue*, %AstStmt*, %TokenInfo*}
%AstStmtReturn = type {%union.2, %TokenInfo*}
%AstStmtGoto = type {%AstId*, %TokenInfo*}
%AstStmtLabel = type {%AstId*, %TokenInfo*}
%AstStmtBreak = type {%TokenInfo*}
%AstStmtContinue = type {%TokenInfo*}
%AstStmt = type {%AstStmtKind, %AstStmtAssign, %AstStmtValueDef, %AstStmtTypeDef, %AstStmtExpr, %AstStmtBlock, %AstStmtIf, %AstStmtWhile, %AstStmtReturn, %AstStmtGoto, %AstStmtLabel, %AstStmtBreak, %AstStmtContinue}
%TypeNumeric = type {%Nat32, i1}
%TypeArray = type {%Type*, %Nat32}
%TypeArrayU = type {%Type*}
%TypeFunc = type {%Type*, %Type*, i1}
%TypePointer = type {%Type*}
%TypeRecord = type {%List*, %Nat32}
%TypeVar = type {%Type*}
%TypeEnum = type {%List*}
%TypeUnion = type {%List, %Type*, %Nat32}
%EnumConstructor = type {%AstId*, %Nat32, %TokenInfo*}
%Decl = type {%AstId*, %Type*, %Nat32, %Nat16, %Nat32, %Value*, %TokenInfo*}
%TypeKind = type i16
%Type = type {%TypeKind, %Str, %Nat32, %Nat32, %TypeNumeric, %TypeFunc, %TypePointer, %TypeArray, %TypeArrayU, %TypeRecord, %TypeEnum, %TypeVar, %TypeUnion, %TokenInfo*}
%ValueKind = type i16
%ValueAccess = type {%Value*, %Str}
%ValueBin = type {%Value*, %Value*}
%ValueCall = type {%Value*, %List*}
%ValueCast = type {%Value*, %Type*}
%ValueAs = type {%Value*, %Type*}
%ValueIs = type {%Value*, %Nat32}
%ValueIndex = type {%Value*, %Value*}
%ValueUn = type {%Value*}
%ValueWhenVariant = type {%Type*, %Value*, %Value*}
%ValueWhen = type {%Value*, %List, %Value*}
%ValueRecord = type {%Type*, %List}
%ValueArray = type {%Type*, %List}
%Value = type {%ValueKind, %Type*, %Int64, %List, %Definition*, %Decl*, %Decl*, %Expr*, %ValueUn, %ValueBin, %ValueIndex, %ValueAccess, %ValueCast, %ValueAs, %ValueIs, %ValueCall, %Type*, %ValueWhen, %Value*, %ValueRecord, %ValueArray, i1, %Str, %TokenInfo*}
%StmtKind = type i16
%Index = type {%List, %List}
%Block = type {%Block*, %Index, %List, %List, %TokenInfo*}
%Expr = type {%Value*, %Nat32}
%If = type {%Value*, %Stmt*, %union.3}
%While = type {%Value*, %Stmt*}
%StmtExpr = type {%Value*, %Nat32, %TokenInfo*}
%StmtBlock = type {%Block*, %Index, %List, %List, %TokenInfo*}
%StmtAssign = type {%Value*, %Value*, %TokenInfo*}
%StmtIf = type {%Value*, %Stmt*, %union.4, %TokenInfo*}
%StmtWhile = type {%Value*, %Stmt*, %TokenInfo*}
%StmtReturn = type {%union.5, %TokenInfo*}
%StmtBreak = type {%TokenInfo*}
%StmtContinue = type {%TokenInfo*}
%StmtGoto = type {%Str, %TokenInfo*}
%StmtLabel = type {%Str, %TokenInfo*}
%Stmt2 = type %union.6
%Stmt = type {%StmtKind, %Expr, %StmtAssign, %Block, %Decl*, %If, %While, %StmtReturn, %StmtGoto, %StmtLabel, %StmtBreak, %StmtContinue, %Str, %TokenInfo*}
%Module = type {%Index, %Index, %Index}
%FuncContext = type {%Str, %Value*, %Block*, %Nat32, %Nat32, %Nat32, %Nat32, %Nat32}
%DefinitionKind = type i16
%DefType = type {%Str, %Type*}
%DefConst = type {%Str, %Type*, %Value*}
%DefStr = type {%Str, %Type*, %Str, %Nat32}
%DefArray = type {%Str, %Type*, %Nat32, %List*}
%DefFunc = type {%Str, %Type*, %Block*}
%DefVar = type {%Str, %Type*, %Value*}
%DefAlias = type {%Str, %Type*, %Str}
%Definition = type {%DefinitionKind, %DefStr, %DefType, %DefConst, %DefArray, %DefFunc, %DefVar, %DefAlias}
%Assembly = type {%Str, %Str, %Str, %List, %List, %List, %List, %List, %List}
%Arch = type i16
%LLVM_ValueKind = type i16
%LLVM_Value = type {%LLVM_ValueKind, %Type*, %Int64, %Str, %Nat32}
%DoValue = type %Value* (%AstValue*)*
%DoValuex = type %Value* (%AstValue*, i1)*
%DoType = type %Type* (%AstType*)*
%DoStmt = type %union.7 (%AstStmt*)*
%Eval = type %LLVM_Value (%Value*)*
%Rule = type i1 (%Nat8)*
%AstTypeParser = type %AstType* ()*
%AstValueParser = type %AstValue* ()*
%AstStmtParser = type %union.8 (%TokenInfo*)*
%func306.type1 = type {[64 x %LLVM_Value], %Nat16}
%EvalCast = type %LLVM_Value (%LLVM_Value, %Type*)*
%func343.type2 = type {%LLVM_Value, %Nat32, %Nat32, [256 x %Nat32], %Type*}
%func345.type3 = type {%Type*, %LLVM_Value}
%func347.type4 = type {%Type*, %LLVM_Value, %Nat32}
%func409.type5 = type {%List*, i1}
%func409_func410.type6 = type {%List*, %Type*}
%func416.type7 = type {%List*, %Nat32}
%func431.type8 = type {%Type*, %Nat32}
%func443.type9 = type {%Value*, %Value*}
%func449.type10 = type {%Value*, %List*, %List*, %TokenInfo*}
%DoValueCast = type %Value* (%Value*, %Type*, %TokenInfo*)*
%func477.type11 = type {%Type*, %List}
%func479.type12 = type {%Type*, %List}
%func481.type13 = type {%Type*, %List}
%func488.type14 = type {%Type*, %List}

;strings:

@func29_str1 = private unnamed_addr constant [19 x i8] c"assert failed: %s\0A\00", align 1
@func30_str1 = private unnamed_addr constant [2 x i8] c"a\00", align 1
@func30_str2 = private unnamed_addr constant [2 x i8] c"z\00", align 1
@func31_str1 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@func31_str2 = private unnamed_addr constant [2 x i8] c"Z\00", align 1
@func32_str1 = private unnamed_addr constant [2 x i8] c"0\00", align 1
@func32_str2 = private unnamed_addr constant [2 x i8] c"9\00", align 1
@func82_str1 = private unnamed_addr constant [6 x i8] c"(nil)\00", align 1
@func82_str2 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@func82_str3 = private unnamed_addr constant [5 x i8] c"Self\00", align 1
@func82_str4 = private unnamed_addr constant [14 x i8] c"<TypeNumeric>\00", align 1
@func82_str5 = private unnamed_addr constant [5 x i8] c"Bool\00", align 1
@func82_str6 = private unnamed_addr constant [13 x i8] c"<TypePoison>\00", align 1
@func82_str7 = private unnamed_addr constant [16 x i8] c"<TypeForbidden>\00", align 1
@func82_str8 = private unnamed_addr constant [17 x i8] c"<TypeGenericRec>\00", align 1
@func82_str9 = private unnamed_addr constant [14 x i8] c"<TypeUnknown>\00", align 1
@func83_str1 = private unnamed_addr constant [5 x i8] c"Var \00", align 1
@func84_str1 = private unnamed_addr constant [2 x i8] c"*\00", align 1
@func84_str2 = private unnamed_addr constant [2 x i8] c"(\00", align 1
@func84_str3 = private unnamed_addr constant [2 x i8] c")\00", align 1
@func85_str1 = private unnamed_addr constant [2 x i8] c"(\00", align 1
@func85_func86_str1 = private unnamed_addr constant [3 x i8] c", \00", align 1
@func85_func86_str2 = private unnamed_addr constant [6 x i8] c"%s : \00", align 1
@func85_str2 = private unnamed_addr constant [2 x i8] c")\00", align 1
@func87_str1 = private unnamed_addr constant [2 x i8] c"{\00", align 1
@func87_func88_str1 = private unnamed_addr constant [7 x i8] c"<%%s> \00", align 1
@func87_str2 = private unnamed_addr constant [2 x i8] c"}\00", align 1
@func89_str1 = private unnamed_addr constant [5 x i8] c"[%d]\00", align 1
@func90_str1 = private unnamed_addr constant [3 x i8] c"[]\00", align 1
@func91_str1 = private unnamed_addr constant [5 x i8] c" -> \00", align 1
@func92_func93_str1 = private unnamed_addr constant [5 x i8] c" or \00", align 1
@func94_str1 = private unnamed_addr constant [16 x i8] c"#ValueForbidden\00", align 1
@func94_str2 = private unnamed_addr constant [13 x i8] c"#ValuePoison\00", align 1
@func94_str3 = private unnamed_addr constant [16 x i8] c"#ValueUndefined\00", align 1
@func94_str4 = private unnamed_addr constant [16 x i8] c"#ValueImmediate\00", align 1
@func94_str5 = private unnamed_addr constant [18 x i8] c"#ValueGlobalConst\00", align 1
@func94_str6 = private unnamed_addr constant [16 x i8] c"#ValueGlobalVar\00", align 1
@func94_str7 = private unnamed_addr constant [12 x i8] c"#ValueParam\00", align 1
@func94_str8 = private unnamed_addr constant [17 x i8] c"#ValueLocalConst\00", align 1
@func94_str9 = private unnamed_addr constant [15 x i8] c"#ValueLocalVar\00", align 1
@func94_str10 = private unnamed_addr constant [10 x i8] c"#ValueRef\00", align 1
@func94_str11 = private unnamed_addr constant [12 x i8] c"#ValueDeref\00", align 1
@func94_str12 = private unnamed_addr constant [10 x i8] c"#ValueNot\00", align 1
@func94_str13 = private unnamed_addr constant [12 x i8] c"#ValueMinus\00", align 1
@func94_str14 = private unnamed_addr constant [11 x i8] c"#ValuePlus\00", align 1
@func94_str15 = private unnamed_addr constant [10 x i8] c"#ValueAdd\00", align 1
@func94_str16 = private unnamed_addr constant [10 x i8] c"#ValueSub\00", align 1
@func94_str17 = private unnamed_addr constant [10 x i8] c"#ValueMul\00", align 1
@func94_str18 = private unnamed_addr constant [10 x i8] c"#ValueDiv\00", align 1
@func94_str19 = private unnamed_addr constant [10 x i8] c"#ValueMod\00", align 1
@func94_str20 = private unnamed_addr constant [9 x i8] c"#ValueOr\00", align 1
@func94_str21 = private unnamed_addr constant [10 x i8] c"#ValueXor\00", align 1
@func94_str22 = private unnamed_addr constant [10 x i8] c"#ValueAnd\00", align 1
@func94_str23 = private unnamed_addr constant [9 x i8] c"#ValueEq\00", align 1
@func94_str24 = private unnamed_addr constant [9 x i8] c"#ValueNe\00", align 1
@func94_str25 = private unnamed_addr constant [9 x i8] c"#ValueLt\00", align 1
@func94_str26 = private unnamed_addr constant [9 x i8] c"#ValueGt\00", align 1
@func94_str27 = private unnamed_addr constant [9 x i8] c"#ValueLe\00", align 1
@func94_str28 = private unnamed_addr constant [9 x i8] c"#ValueGe\00", align 1
@func94_str29 = private unnamed_addr constant [11 x i8] c"#ValueLoad\00", align 1
@func94_str30 = private unnamed_addr constant [10 x i8] c"#ValueShl\00", align 1
@func94_str31 = private unnamed_addr constant [10 x i8] c"#ValueShr\00", align 1
@func94_str32 = private unnamed_addr constant [11 x i8] c"#ValueCall\00", align 1
@func94_str33 = private unnamed_addr constant [12 x i8] c"#ValueIndex\00", align 1
@func94_str34 = private unnamed_addr constant [13 x i8] c"#ValueAccess\00", align 1
@func94_str35 = private unnamed_addr constant [11 x i8] c"#ValueCast\00", align 1
@func94_str36 = private unnamed_addr constant [11 x i8] c"#ValueWhen\00", align 1
@func94_str37 = private unnamed_addr constant [21 x i8] c"<unknown-value-kind>\00", align 1
@func94_str38 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@func95_str1 = private unnamed_addr constant [7 x i8] c"value:\00", align 1
@func95_str2 = private unnamed_addr constant [7 x i8] c"type: \00", align 1
@func95_func96_str1 = private unnamed_addr constant [16 x i8] c"#ValueForbidden\00", align 1
@func95_func97_str1 = private unnamed_addr constant [13 x i8] c"#ValuePoison\00", align 1
@func95_str3 = private unnamed_addr constant [4 x i8] c"add\00", align 1
@func95_str4 = private unnamed_addr constant [4 x i8] c"sub\00", align 1
@func95_str5 = private unnamed_addr constant [4 x i8] c"mul\00", align 1
@func95_str6 = private unnamed_addr constant [4 x i8] c"div\00", align 1
@func95_str7 = private unnamed_addr constant [4 x i8] c"mod\00", align 1
@func95_str8 = private unnamed_addr constant [3 x i8] c"or\00", align 1
@func95_str9 = private unnamed_addr constant [4 x i8] c"xor\00", align 1
@func95_str10 = private unnamed_addr constant [4 x i8] c"and\00", align 1
@func95_str11 = private unnamed_addr constant [3 x i8] c"eq\00", align 1
@func95_str12 = private unnamed_addr constant [3 x i8] c"ne\00", align 1
@func95_str13 = private unnamed_addr constant [3 x i8] c"lt\00", align 1
@func95_str14 = private unnamed_addr constant [3 x i8] c"gt\00", align 1
@func95_str15 = private unnamed_addr constant [3 x i8] c"le\00", align 1
@func95_str16 = private unnamed_addr constant [3 x i8] c"ge\00", align 1
@func111_str1 = private unnamed_addr constant [10 x i8] c"value %s\0A\00", align 1
@func111_str2 = private unnamed_addr constant [11 x i8] c"left_type:\00", align 1
@func111_str3 = private unnamed_addr constant [12 x i8] c"right_type:\00", align 1
@cfgLibraryVar = private unnamed_addr constant [10 x i8] c"MINOR_LIB\00", align 1
@func120_str1 = private unnamed_addr constant [21 x i8] c"\0A%c[0;%dm%s:%c[0m %s\00", align 1
@func121_str1 = private unnamed_addr constant [30 x i8] c"\0A%c[0;%dm%s%c[0m (%s:%d) : %s\00", align 1
@func122_str1 = private unnamed_addr constant [5 x i8] c"info\00", align 1
@func122_str2 = private unnamed_addr constant [5 x i8] c"info\00", align 1
@func122_str3 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func123_str1 = private unnamed_addr constant [8 x i8] c"warning\00", align 1
@func123_str2 = private unnamed_addr constant [8 x i8] c"warning\00", align 1
@func123_str3 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func123_str4 = private unnamed_addr constant [14 x i8] c"*** STOP ***\0A\00", align 1
@func124_str1 = private unnamed_addr constant [6 x i8] c"error\00", align 1
@func124_str2 = private unnamed_addr constant [6 x i8] c"error\00", align 1
@func124_str3 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func124_str4 = private unnamed_addr constant [14 x i8] c"*** STOP ***\0A\00", align 1
@func125_str1 = private unnamed_addr constant [17 x i8] c"\0A%c[0;%dm%s%c[0m\00", align 1
@func125_str2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func126_str1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func126_str2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func127_str1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func127_str2 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@func127_str3 = private unnamed_addr constant [2 x i8] c" \00", align 1
@func127_str4 = private unnamed_addr constant [15 x i8] c"%c[0;%dm^%c[0m\00", align 1
@func128_str1 = private unnamed_addr constant [6 x i8] c"fatal\00", align 1
@func129_str1 = private unnamed_addr constant [11 x i8] c"type error\00", align 1
@func129_str2 = private unnamed_addr constant [16 x i8] c"type expected: \00", align 1
@func129_str3 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func129_str4 = private unnamed_addr constant [16 x i8] c"type received: \00", align 1
@func129_str5 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func139_str1 = private unnamed_addr constant [5 x i8] c"self\00", align 1
@func141_str1 = private unnamed_addr constant [35 x i8] c"value bind error: id already bound\00", align 1
@func141_str2 = private unnamed_addr constant [19 x i8] c"first defined here\00", align 1
@func147_str1 = private unnamed_addr constant [5 x i8] c"Self\00", align 1
@func149_str1 = private unnamed_addr constant [3 x i8] c"%u\00", align 1
@func150_str1 = private unnamed_addr constant [6 x i8] c".type\00", align 1
@func151_str1 = private unnamed_addr constant [2 x i8] c"_\00", align 1
@func151_str2 = private unnamed_addr constant [1 x i8] c"\00", align 1
@func153_str1 = private unnamed_addr constant [5 x i8] c"func\00", align 1
@func154_str1 = private unnamed_addr constant [4 x i8] c"str\00", align 1
@func154_str2 = private unnamed_addr constant [4 x i8] c"str\00", align 1
@func155_str1 = private unnamed_addr constant [4 x i8] c"arr\00", align 1
@func156_str1 = private unnamed_addr constant [4 x i8] c"var\00", align 1
@func157_str1 = private unnamed_addr constant [5 x i8] c"Type\00", align 1
@func160_str1 = private unnamed_addr constant [2 x i8] c"/\00", align 1
@func163_str1 = private unnamed_addr constant [11 x i8] c"module=%s\0A\00", align 1
@func163_str2 = private unnamed_addr constant [17 x i8] c"module not exist\00", align 1
@func165_str1 = private unnamed_addr constant [10 x i8] c"file: %s\0A\00", align 1
@func165_str2 = private unnamed_addr constant [23 x i8] c"unexpected end-of-file\00", align 1
@func165_str3 = private unnamed_addr constant [16 x i8] c"too long token\0A\00", align 1
@func166_str1 = private unnamed_addr constant [2 x i8] c" \00", align 1
@func166_str2 = private unnamed_addr constant [2 x i8] c"\09\00", align 1
@func167_str1 = private unnamed_addr constant [2 x i8] c">\00", align 1
@func168_str1 = private unnamed_addr constant [2 x i8] c"/\00", align 1
@func168_str2 = private unnamed_addr constant [2 x i8] c"*\00", align 1
@func169_str1 = private unnamed_addr constant [2 x i8] c">\00", align 1
@func169_str2 = private unnamed_addr constant [2 x i8] c"=\00", align 1
@func170_str1 = private unnamed_addr constant [2 x i8] c"<\00", align 1
@func170_str2 = private unnamed_addr constant [2 x i8] c"=\00", align 1
@func171_str1 = private unnamed_addr constant [2 x i8] c"=\00", align 1
@func171_str2 = private unnamed_addr constant [2 x i8] c">\00", align 1
@func172_str1 = private unnamed_addr constant [2 x i8] c"=\00", align 1
@func173_str1 = private unnamed_addr constant [2 x i8] c"=\00", align 1
@func174_str1 = private unnamed_addr constant [2 x i8] c"_\00", align 1
@func174_str2 = private unnamed_addr constant [2 x i8] c"-\00", align 1
@func176_str1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func179_str1 = private unnamed_addr constant [2 x i8] c"_\00", align 1
@func179_str2 = private unnamed_addr constant [2 x i8] c"#\00", align 1
@func179_str3 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func179_str4 = private unnamed_addr constant [2 x i8] c":\00", align 1
@func179_str5 = private unnamed_addr constant [2 x i8] c"=\00", align 1
@func179_str6 = private unnamed_addr constant [2 x i8] c"-\00", align 1
@func179_str7 = private unnamed_addr constant [2 x i8] c"/\00", align 1
@func179_str8 = private unnamed_addr constant [2 x i8] c">\00", align 1
@func179_str9 = private unnamed_addr constant [2 x i8] c"<\00", align 1
@func179_str10 = private unnamed_addr constant [2 x i8] c"!\00", align 1
@func179_str11 = private unnamed_addr constant [2 x i8] c"\22\00", align 1
@func181_str1 = private unnamed_addr constant [2 x i8] c"/\00", align 1
@func181_str2 = private unnamed_addr constant [2 x i8] c"*\00", align 1
@func181_str3 = private unnamed_addr constant [23 x i8] c"unexpected end-of-file\00", align 1
@func181_str4 = private unnamed_addr constant [2 x i8] c"*\00", align 1
@func181_str5 = private unnamed_addr constant [2 x i8] c"/\00", align 1
@func181_str6 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func182_str1 = private unnamed_addr constant [2 x i8] c"\22\00", align 1
@func182_str2 = private unnamed_addr constant [23 x i8] c"unexpected end-of-file\00", align 1
@func182_str3 = private unnamed_addr constant [2 x i8] c"\5C\00", align 1
@func182_str4 = private unnamed_addr constant [2 x i8] c"n\00", align 1
@func182_str5 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func182_str6 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@func182_str7 = private unnamed_addr constant [2 x i8] c"\0D\00", align 1
@func182_str8 = private unnamed_addr constant [2 x i8] c"t\00", align 1
@func182_str9 = private unnamed_addr constant [2 x i8] c"\09\00", align 1
@func182_str10 = private unnamed_addr constant [2 x i8] c"\5C\00", align 1
@func182_str11 = private unnamed_addr constant [2 x i8] c"\5C\00", align 1
@func182_str12 = private unnamed_addr constant [2 x i8] c"\22\00", align 1
@func182_str13 = private unnamed_addr constant [2 x i8] c"\22\00", align 1
@func182_str14 = private unnamed_addr constant [2 x i8] c"0\00", align 1
@func182_str15 = private unnamed_addr constant [1 x i8] c"\00", align 1
@func182_str16 = private unnamed_addr constant [2 x i8] c"a\00", align 1
@func182_str17 = private unnamed_addr constant [2 x i8] c"\07\00", align 1
@func182_str18 = private unnamed_addr constant [2 x i8] c"b\00", align 1
@func182_str19 = private unnamed_addr constant [2 x i8] c"\08\00", align 1
@func182_str20 = private unnamed_addr constant [2 x i8] c"v\00", align 1
@func182_str21 = private unnamed_addr constant [2 x i8] c"\0B\00", align 1
@func182_str22 = private unnamed_addr constant [17 x i8] c"too long string\0A\00", align 1
@func189_str1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func193_str1 = private unnamed_addr constant [19 x i8] c"expected separator\00", align 1
@func194_str1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func194_str2 = private unnamed_addr constant [2 x i8] c";\00", align 1
@func194_str3 = private unnamed_addr constant [2 x i8] c"}\00", align 1
@func194_str4 = private unnamed_addr constant [2 x i8] c")\00", align 1
@func195_str1 = private unnamed_addr constant [2 x i8] c",\00", align 1
@func195_str2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func195_str3 = private unnamed_addr constant [27 x i8] c"expected comma or new line\00", align 1
@func196_str1 = private unnamed_addr constant [29 x i8] c"lex::skipto not implemented\0A\00", align 1
@func196_str2 = private unnamed_addr constant [12 x i8] c"tok = '%s'\0A\00", align 1
@func196_str3 = private unnamed_addr constant [18 x i8] c"skip_target = %s\0A\00", align 1
@func199_str1 = private unnamed_addr constant [18 x i8] c"unexpected symbol\00", align 1
@func199_str2 = private unnamed_addr constant [13 x i8] c"expected %s\0A\00", align 1
@func200_str1 = private unnamed_addr constant [11 x i8] c"ast_id_new\00", align 1
@func201_str1 = private unnamed_addr constant [13 x i8] c"expected id1\00", align 1
@func202_str1 = private unnamed_addr constant [2 x i8] c".\00", align 1
@func203_str1 = private unnamed_addr constant [13 x i8] c"ast_node_new\00", align 1
@func204_str1 = private unnamed_addr constant [7 x i8] c"import\00", align 1
@func204_str2 = private unnamed_addr constant [8 x i8] c"arghack\00", align 1
@func204_str3 = private unnamed_addr constant [6 x i8] c"exist\00", align 1
@func204_str4 = private unnamed_addr constant [7 x i8] c"extern\00", align 1
@func206_str1 = private unnamed_addr constant [2 x i8] c"=\00", align 1
@func207_str1 = private unnamed_addr constant [2 x i8] c"=\00", align 1
@func208_str1 = private unnamed_addr constant [18 x i8] c"parse_type malloc\00", align 1
@func209_str1 = private unnamed_addr constant [3 x i8] c"->\00", align 1
@func210_str1 = private unnamed_addr constant [3 x i8] c"or\00", align 1
@func210_str2 = private unnamed_addr constant [3 x i8] c"or\00", align 1
@func211_str1 = private unnamed_addr constant [2 x i8] c"*\00", align 1
@func211_str2 = private unnamed_addr constant [2 x i8] c"[\00", align 1
@func211_str3 = private unnamed_addr constant [2 x i8] c"]\00", align 1
@func211_str4 = private unnamed_addr constant [2 x i8] c"]\00", align 1
@func212_str1 = private unnamed_addr constant [2 x i8] c"(\00", align 1
@func212_str2 = private unnamed_addr constant [2 x i8] c")\00", align 1
@func212_str3 = private unnamed_addr constant [2 x i8] c")\00", align 1
@func213_str1 = private unnamed_addr constant [2 x i8] c"{\00", align 1
@func213_str2 = private unnamed_addr constant [4 x i8] c"Var\00", align 1
@func214_str1 = private unnamed_addr constant [2 x i8] c",\00", align 1
@func214_str2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func214_str3 = private unnamed_addr constant [2 x i8] c"}\00", align 1
@func214_str4 = private unnamed_addr constant [37 x i8] c"expected comma or new-line separator\00", align 1
@func215_str1 = private unnamed_addr constant [2 x i8] c")\00", align 1
@func215_str2 = private unnamed_addr constant [14 x i8] c"dofield error\00", align 1
@func215_str3 = private unnamed_addr constant [2 x i8] c",\00", align 1
@func216_str1 = private unnamed_addr constant [2 x i8] c"*\00", align 1
@func217_str1 = private unnamed_addr constant [2 x i8] c"[\00", align 1
@func217_str2 = private unnamed_addr constant [2 x i8] c"]\00", align 1
@func217_str3 = private unnamed_addr constant [2 x i8] c"]\00", align 1
@func218_str1 = private unnamed_addr constant [2 x i8] c",\00", align 1
@func218_str2 = private unnamed_addr constant [2 x i8] c":\00", align 1
@func219_str1 = private unnamed_addr constant [21 x i8] c"ast_value_new malloc\00", align 1
@func222_str1 = private unnamed_addr constant [3 x i8] c"or\00", align 1
@func223_str1 = private unnamed_addr constant [4 x i8] c"xor\00", align 1
@func224_str1 = private unnamed_addr constant [4 x i8] c"and\00", align 1
@func225_str1 = private unnamed_addr constant [3 x i8] c"==\00", align 1
@func225_str2 = private unnamed_addr constant [3 x i8] c"!=\00", align 1
@func226_str1 = private unnamed_addr constant [2 x i8] c"<\00", align 1
@func226_str2 = private unnamed_addr constant [2 x i8] c">\00", align 1
@func226_str3 = private unnamed_addr constant [3 x i8] c"<=\00", align 1
@func226_str4 = private unnamed_addr constant [3 x i8] c">=\00", align 1
@func227_str1 = private unnamed_addr constant [3 x i8] c"<<\00", align 1
@func227_str2 = private unnamed_addr constant [3 x i8] c">>\00", align 1
@func228_str1 = private unnamed_addr constant [2 x i8] c"+\00", align 1
@func228_str2 = private unnamed_addr constant [2 x i8] c"-\00", align 1
@func229_str1 = private unnamed_addr constant [2 x i8] c"*\00", align 1
@func229_str2 = private unnamed_addr constant [2 x i8] c"/\00", align 1
@func229_str3 = private unnamed_addr constant [2 x i8] c"%\00", align 1
@func230_str1 = private unnamed_addr constant [3 x i8] c"to\00", align 1
@func230_str2 = private unnamed_addr constant [3 x i8] c"is\00", align 1
@func230_str3 = private unnamed_addr constant [3 x i8] c"as\00", align 1
@func231_str1 = private unnamed_addr constant [2 x i8] c"*\00", align 1
@func231_str2 = private unnamed_addr constant [2 x i8] c"&\00", align 1
@func231_str3 = private unnamed_addr constant [4 x i8] c"not\00", align 1
@func231_str4 = private unnamed_addr constant [2 x i8] c"-\00", align 1
@func231_str5 = private unnamed_addr constant [2 x i8] c"+\00", align 1
@func231_str6 = private unnamed_addr constant [7 x i8] c"sizeof\00", align 1
@func231_str7 = private unnamed_addr constant [23 x i8] c"sizeof expected <type>\00", align 1
@func231_str8 = private unnamed_addr constant [8 x i8] c"alignof\00", align 1
@func231_str9 = private unnamed_addr constant [24 x i8] c"alignof expected <type>\00", align 1
@func232_str1 = private unnamed_addr constant [2 x i8] c"(\00", align 1
@func232_str2 = private unnamed_addr constant [2 x i8] c")\00", align 1
@func232_str3 = private unnamed_addr constant [3 x i8] c",)\00", align 1
@func232_str4 = private unnamed_addr constant [2 x i8] c",\00", align 1
@func232_str5 = private unnamed_addr constant [2 x i8] c")\00", align 1
@func232_str6 = private unnamed_addr constant [2 x i8] c")\00", align 1
@func232_str7 = private unnamed_addr constant [2 x i8] c",\00", align 1
@func232_str8 = private unnamed_addr constant [2 x i8] c"[\00", align 1
@func232_str9 = private unnamed_addr constant [2 x i8] c"]\00", align 1
@func232_str10 = private unnamed_addr constant [2 x i8] c".\00", align 1
@func233_str1 = private unnamed_addr constant [2 x i8] c"(\00", align 1
@func233_str2 = private unnamed_addr constant [2 x i8] c")\00", align 1
@func234_func235_str1 = private unnamed_addr constant [2 x i8] c"@\00", align 1
@func234_func235_str2 = private unnamed_addr constant [19 x i8] c"unexpected symbol\0A\00", align 1
@func234_func235_str3 = private unnamed_addr constant [9 x i8] c"bad term\00", align 1
@func234_func236_str1 = private unnamed_addr constant [19 x i8] c"unexpected symbol\0A\00", align 1
@func234_func236_str2 = private unnamed_addr constant [14 x i8] c"received: %s\0A\00", align 1
@func234_func236_str3 = private unnamed_addr constant [9 x i8] c"bad term\00", align 1
@func237_str1 = private unnamed_addr constant [5 x i8] c"func\00", align 1
@func237_str2 = private unnamed_addr constant [7 x i8] c"extern\00", align 1
@func237_str3 = private unnamed_addr constant [4 x i8] c"rec\00", align 1
@func237_str4 = private unnamed_addr constant [6 x i8] c"array\00", align 1
@func237_str5 = private unnamed_addr constant [5 x i8] c"when\00", align 1
@func238_str1 = private unnamed_addr constant [2 x i8] c"{\00", align 1
@func238_str2 = private unnamed_addr constant [2 x i8] c"}\00", align 1
@func238_str3 = private unnamed_addr constant [5 x i8] c"else\00", align 1
@func238_str4 = private unnamed_addr constant [3 x i8] c"=>\00", align 1
@func238_str5 = private unnamed_addr constant [3 x i8] c"=>\00", align 1
@func240_str1 = private unnamed_addr constant [2 x i8] c"=\00", align 1
@func240_str2 = private unnamed_addr constant [2 x i8] c")\00", align 1
@func240_str3 = private unnamed_addr constant [2 x i8] c",\00", align 1
@func241_str1 = private unnamed_addr constant [2 x i8] c"(\00", align 1
@func241_str2 = private unnamed_addr constant [2 x i8] c"(\00", align 1
@func241_str3 = private unnamed_addr constant [2 x i8] c"=\00", align 1
@func241_str4 = private unnamed_addr constant [2 x i8] c")\00", align 1
@func241_str5 = private unnamed_addr constant [2 x i8] c",\00", align 1
@func242_str1 = private unnamed_addr constant [2 x i8] c"[\00", align 1
@func242_str2 = private unnamed_addr constant [2 x i8] c"]\00", align 1
@func242_str3 = private unnamed_addr constant [2 x i8] c",\00", align 1
@func243_str1 = private unnamed_addr constant [2 x i8] c"{\00", align 1
@func246_str1 = private unnamed_addr constant [21 x i8] c"ast_value_new malloc\00", align 1
@func249_str1 = private unnamed_addr constant [2 x i8] c"=\00", align 1
@func249_str2 = private unnamed_addr constant [2 x i8] c"_\00", align 1
@func249_func250_str1 = private unnamed_addr constant [2 x i8] c":\00", align 1
@func249_str3 = private unnamed_addr constant [4 x i8] c"let\00", align 1
@func249_str4 = private unnamed_addr constant [2 x i8] c"{\00", align 1
@func249_str5 = private unnamed_addr constant [3 x i8] c"if\00", align 1
@func249_str6 = private unnamed_addr constant [6 x i8] c"while\00", align 1
@func249_str7 = private unnamed_addr constant [7 x i8] c"return\00", align 1
@func249_str8 = private unnamed_addr constant [6 x i8] c"break\00", align 1
@func249_str9 = private unnamed_addr constant [9 x i8] c"continue\00", align 1
@func249_str10 = private unnamed_addr constant [5 x i8] c"type\00", align 1
@func249_str11 = private unnamed_addr constant [5 x i8] c"goto\00", align 1
@func251_str1 = private unnamed_addr constant [3 x i8] c":=\00", align 1
@func252_str1 = private unnamed_addr constant [2 x i8] c"=\00", align 1
@func253_str1 = private unnamed_addr constant [2 x i8] c"=\00", align 1
@func254_str1 = private unnamed_addr constant [2 x i8] c"}\00", align 1
@func254_str2 = private unnamed_addr constant [23 x i8] c"unexpected end-of-file\00", align 1
@func254_str3 = private unnamed_addr constant [2 x i8] c"}\00", align 1
@func255_str1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func255_str2 = private unnamed_addr constant [2 x i8] c"{\00", align 1
@func255_str3 = private unnamed_addr constant [5 x i8] c"else\00", align 1
@func255_str4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func255_str5 = private unnamed_addr constant [3 x i8] c"if\00", align 1
@func255_str6 = private unnamed_addr constant [2 x i8] c"{\00", align 1
@func256_str1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func256_str2 = private unnamed_addr constant [2 x i8] c"{\00", align 1
@func257_str1 = private unnamed_addr constant [27 x i8] c"expected return expression\00", align 1
@func260_str1 = private unnamed_addr constant [2 x i8] c",\00", align 1
@func260_str2 = private unnamed_addr constant [2 x i8] c":\00", align 1
@func261_str1 = private unnamed_addr constant [2 x i8] c")\00", align 1
@func262_str1 = private unnamed_addr constant [2 x i8] c"(\00", align 1
@func262_str2 = private unnamed_addr constant [2 x i8] c"[\00", align 1
@func262_str3 = private unnamed_addr constant [2 x i8] c"{\00", align 1
@func262_str4 = private unnamed_addr constant [2 x i8] c"*\00", align 1
@func264_str1 = private unnamed_addr constant [2 x i8] c")\00", align 1
@func264_str2 = private unnamed_addr constant [2 x i8] c"=\00", align 1
@func265_func266_str1 = private unnamed_addr constant [38 x i8] c"e-m:o-i64:64-f80:128-n8:16:32:64-S128\00", align 1
@func265_func266_str2 = private unnamed_addr constant [27 x i8] c"x86_64-apple-macosx10.15.0\00", align 1
@func265_func267_str1 = private unnamed_addr constant [48 x i8] c"e-m:e-p:32:32-i64:64-v128:64:128-a:0:32-n32-S64\00", align 1
@func265_func267_str2 = private unnamed_addr constant [28 x i8] c"thumbv7em-unknown-none-eabi\00", align 1
@func265_func268_str1 = private unnamed_addr constant [1 x i8] c"\00", align 1
@func265_func268_str2 = private unnamed_addr constant [1 x i8] c"\00", align 1
@func269_str1 = private unnamed_addr constant [36 x i8] c"assembly::definition_new : x != nil\00", align 1
@func276_str1 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@func277_str1 = private unnamed_addr constant [4 x i8] c"\0A%s\00", align 1
@func278_str1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func279_str1 = private unnamed_addr constant [2 x i8] c" \00", align 1
@func280_str1 = private unnamed_addr constant [3 x i8] c", \00", align 1
@func283_str1 = private unnamed_addr constant [20 x i8] c"print_assembly: %s\0A\00", align 1
@func283_str2 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@func283_str3 = private unnamed_addr constant [26 x i8] c"cannot create output file\00", align 1
@func283_str4 = private unnamed_addr constant [16 x i8] c"; assembly: %s\0A\00", align 1
@func283_str5 = private unnamed_addr constant [27 x i8] c"; clang out2.ll && ./a.out\00", align 1
@func283_str6 = private unnamed_addr constant [44 x i8] c"; llc out2.ll ; for create .s file from .ll\00", align 1
@func283_str7 = private unnamed_addr constant [26 x i8] c"target datalayout = \22%s\22\0A\00", align 1
@func283_str8 = private unnamed_addr constant [22 x i8] c"target triple = \22%s\22\0A\00", align 1
@func283_str9 = private unnamed_addr constant [16 x i8] c"%Bool = type i1\00", align 1
@func283_str10 = private unnamed_addr constant [16 x i8] c"%Unit = type i1\00", align 1
@func283_str11 = private unnamed_addr constant [16 x i8] c"%Str = type i8*\00", align 1
@func283_str12 = private unnamed_addr constant [20 x i8] c"%Numeric = type i64\00", align 1
@func283_func284_str1 = private unnamed_addr constant [17 x i8] c"\0A%%%s = type i%d\00", align 1
@func283_str13 = private unnamed_addr constant [12 x i8] c"\0A; aliases:\00", align 1
@func283_func285_str1 = private unnamed_addr constant [14 x i8] c"\0A%%%s = type \00", align 1
@func283_func285_str2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func283_func285_str3 = private unnamed_addr constant [30 x i8] c"\0A%%%s = type {i16, [%d x i8]}\00", align 1
@func283_func285_str4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func283_str14 = private unnamed_addr constant [11 x i8] c"\0A\0A;types:\0A\00", align 1
@func283_str15 = private unnamed_addr constant [13 x i8] c"\0A\0A;strings:\0A\00", align 1
@func283_str16 = private unnamed_addr constant [12 x i8] c"\0A\0A;arrays:\0A\00", align 1
@func283_str17 = private unnamed_addr constant [10 x i8] c"\0A\0A;vars:\0A\00", align 1
@func283_str18 = private unnamed_addr constant [11 x i8] c"\0A\0A;funcs:\0A\00", align 1
@func283_str19 = private unnamed_addr constant [13 x i8] c"\0A\0A;aliases:\0A\00", align 1
@func283_str20 = private unnamed_addr constant [14 x i8] c"\0A\0A;metadata:\0A\00", align 1
@func292_str1 = private unnamed_addr constant [14 x i8] c"\0A%%%s = type \00", align 1
@func293_str1 = private unnamed_addr constant [38 x i8] c"\0A@%s = private unnamed_addr constant \00", align 1
@func293_str2 = private unnamed_addr constant [3 x i8] c" [\00", align 1
@func293_str3 = private unnamed_addr constant [12 x i8] c"], align 16\00", align 1
@func295_str1 = private unnamed_addr constant [50 x i8] c"\0A@%s = private unnamed_addr constant [%d x i8] c\22\00", align 1
@func295_str2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func295_str3 = private unnamed_addr constant [2 x i8] c"\0D\00", align 1
@func295_str4 = private unnamed_addr constant [2 x i8] c"\09\00", align 1
@func295_str5 = private unnamed_addr constant [2 x i8] c"\0B\00", align 1
@func295_str6 = private unnamed_addr constant [2 x i8] c"\07\00", align 1
@func295_str7 = private unnamed_addr constant [2 x i8] c"\08\00", align 1
@func295_str8 = private unnamed_addr constant [2 x i8] c"\5C\00", align 1
@func295_str9 = private unnamed_addr constant [2 x i8] c"\22\00", align 1
@func295_str10 = private unnamed_addr constant [6 x i8] c"\5C%02X\00", align 1
@func295_str11 = private unnamed_addr constant [14 x i8] c" < 0x20 = %d\0A\00", align 1
@func295_str12 = private unnamed_addr constant [3 x i8] c"??\00", align 1
@func295_str13 = private unnamed_addr constant [3 x i8] c"%c\00", align 1
@func295_str14 = private unnamed_addr constant [16 x i8] c"\5C%02d\22, align 1\00", align 1
@func296_str1 = private unnamed_addr constant [15 x i8] c"\0A@%s = global \00", align 1
@func296_str2 = private unnamed_addr constant [16 x i8] c"zeroinitializer\00", align 1
@func296_str3 = private unnamed_addr constant [29 x i8] c"expected constant init value\00", align 1
@func296_str4 = private unnamed_addr constant [16 x i8] c"zeroinitializer\00", align 1
@func297_str1 = private unnamed_addr constant [3 x i8] c"xx\00", align 1
@func297_str2 = private unnamed_addr constant [6 x i8] c"xx : \00", align 1
@func297_str3 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func297_str4 = private unnamed_addr constant [11 x i8] c"Maybe? %d\0A\00", align 1
@func297_str5 = private unnamed_addr constant [20 x i8] c"prn/funcdef t = nil\00", align 1
@func297_str6 = private unnamed_addr constant [9 x i8] c"\0Adeclare\00", align 1
@func297_str7 = private unnamed_addr constant [9 x i8] c"\0A\0Adefine\00", align 1
@func297_str8 = private unnamed_addr constant [5 x i8] c"void\00", align 1
@func297_str9 = private unnamed_addr constant [7 x i8] c" @%s (\00", align 1
@func297_str10 = private unnamed_addr constant [6 x i8] c", ...\00", align 1
@func297_str11 = private unnamed_addr constant [2 x i8] c")\00", align 1
@func297_str12 = private unnamed_addr constant [3 x i8] c" {\00", align 1
@func297_str13 = private unnamed_addr constant [12 x i8] c"\0A  ret void\00", align 1
@func297_str14 = private unnamed_addr constant [3 x i8] c"\0A}\00", align 1
@func299_str1 = private unnamed_addr constant [14 x i8] c"\0A@%s = alias \00", align 1
@func299_str2 = private unnamed_addr constant [6 x i8] c"* @%s\00", align 1
@func300_str1 = private unnamed_addr constant [14 x i8] c"\0A  %%%d = %s \00", align 1
@func301_str1 = private unnamed_addr constant [23 x i8] c"getelementptr inbounds\00", align 1
@func301_str2 = private unnamed_addr constant [3 x i8] c"* \00", align 1
@func302_str1 = private unnamed_addr constant [13 x i8] c"extractvalue\00", align 1
@func302_str2 = private unnamed_addr constant [5 x i8] c", %u\00", align 1
@func303_func304_str1 = private unnamed_addr constant [28 x i8] c"error eval #ValueUndefined\0A\00", align 1
@func306_str1 = private unnamed_addr constant [4 x i8] c"\0A  \00", align 1
@func306_str2 = private unnamed_addr constant [8 x i8] c"%%%d = \00", align 1
@func306_str3 = private unnamed_addr constant [6 x i8] c"call \00", align 1
@func306_str4 = private unnamed_addr constant [3 x i8] c" (\00", align 1
@func306_str5 = private unnamed_addr constant [2 x i8] c")\00", align 1
@func308_str1 = private unnamed_addr constant [21 x i8] c"\0A; eval index uarray\00", align 1
@func309_func310_str1 = private unnamed_addr constant [15 x i8] c"\0A; index array\00", align 1
@func309_func310_str2 = private unnamed_addr constant [7 x i8] c"i1 0, \00", align 1
@func311_str1 = private unnamed_addr constant [29 x i8] c"print/expr:: x.field == nil\0A\00", align 1
@func311_str2 = private unnamed_addr constant [13 x i8] c"i1 0, i32 %u\00", align 1
@func312_str1 = private unnamed_addr constant [5 x i8] c"i1 0\00", align 1
@func314_str1 = private unnamed_addr constant [4 x i8] c"xor\00", align 1
@func314_str2 = private unnamed_addr constant [4 x i8] c", 1\00", align 1
@func314_str3 = private unnamed_addr constant [5 x i8] c", -1\00", align 1
@func315_str1 = private unnamed_addr constant [8 x i8] c"sub nsw\00", align 1
@func317_str1 = private unnamed_addr constant [5 x i8] c" to \00", align 1
@func318_str1 = private unnamed_addr constant [9 x i8] c"inttoptr\00", align 1
@func318_str2 = private unnamed_addr constant [8 x i8] c"bitcast\00", align 1
@func319_str1 = private unnamed_addr constant [6 x i8] c"trunc\00", align 1
@func320_str1 = private unnamed_addr constant [6 x i8] c"trunc\00", align 1
@func320_func321_str1 = private unnamed_addr constant [5 x i8] c"sext\00", align 1
@func320_func321_str2 = private unnamed_addr constant [5 x i8] c"zext\00", align 1
@func320_str2 = private unnamed_addr constant [8 x i8] c"bitcast\00", align 1
@func322_str1 = private unnamed_addr constant [6 x i8] c"trunc\00", align 1
@func322_str2 = private unnamed_addr constant [5 x i8] c"zext\00", align 1
@func322_str3 = private unnamed_addr constant [8 x i8] c"bitcast\00", align 1
@func323_str1 = private unnamed_addr constant [9 x i8] c"ptrtoint\00", align 1
@func323_str2 = private unnamed_addr constant [5 x i8] c"zext\00", align 1
@func323_str3 = private unnamed_addr constant [8 x i8] c"bitcast\00", align 1
@func323_str4 = private unnamed_addr constant [8 x i8] c"bitcast\00", align 1
@func323_func324_str1 = private unnamed_addr constant [26 x i8] c"\0A<invalid k = %d in cast>\00", align 1
@func323_func324_str2 = private unnamed_addr constant [6 x i8] c"cast \00", align 1
@func323_func324_str3 = private unnamed_addr constant [5 x i8] c" to \00", align 1
@func323_func324_str4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func323_func324_str5 = private unnamed_addr constant [19 x i8] c"eval_cast_to_basic\00", align 1
@func325_str1 = private unnamed_addr constant [8 x i8] c"bitcast\00", align 1
@func326_str1 = private unnamed_addr constant [9 x i8] c"ptrtoint\00", align 1
@func326_str2 = private unnamed_addr constant [8 x i8] c"icmp ne\00", align 1
@func326_str3 = private unnamed_addr constant [8 x i8] c"icmp eq\00", align 1
@func326_str4 = private unnamed_addr constant [31 x i8] c"eval_is :: union is not in reg\00", align 1
@func326_str5 = private unnamed_addr constant [29 x i8] c"\0A  %%%d = extractvalue %%%s \00", align 1
@func326_str6 = private unnamed_addr constant [4 x i8] c", 0\00", align 1
@func326_str7 = private unnamed_addr constant [8 x i8] c"icmp eq\00", align 1
@func327_str1 = private unnamed_addr constant [7 x i8] c"alloca\00", align 1
@func327_str2 = private unnamed_addr constant [20 x i8] c"\0A; write variant %d\00", align 1
@func327_str3 = private unnamed_addr constant [12 x i8] c"i1 0, i32 0\00", align 1
@func327_str4 = private unnamed_addr constant [13 x i8] c"; write data\00", align 1
@func327_str5 = private unnamed_addr constant [12 x i8] c"i1 0, i32 1\00", align 1
@func327_str6 = private unnamed_addr constant [8 x i8] c"bitcast\00", align 1
@func327_str7 = private unnamed_addr constant [9 x i8] c"inttoptr\00", align 1
@func327_str8 = private unnamed_addr constant [9 x i8] c"inttoptr\00", align 1
@func327_str9 = private unnamed_addr constant [8 x i8] c"bitcast\00", align 1
@func328_str1 = private unnamed_addr constant [7 x i8] c"alloca\00", align 1
@func328_str2 = private unnamed_addr constant [12 x i8] c"i1 0, i32 1\00", align 1
@func328_str3 = private unnamed_addr constant [8 x i8] c"bitcast\00", align 1
@func328_str4 = private unnamed_addr constant [5 x i8] c"load\00", align 1
@func328_str5 = private unnamed_addr constant [3 x i8] c"* \00", align 1
@func329_str1 = private unnamed_addr constant [11 x i8] c"CAST VAR!\0A\00", align 1
@func329_func330_str1 = private unnamed_addr constant [18 x i8] c"eval_cast error:\0A\00", align 1
@func329_func330_str2 = private unnamed_addr constant [6 x i8] c" --> \00", align 1
@func329_func330_str3 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func329_func330_str4 = private unnamed_addr constant [16 x i8] c"eval_cast error\00", align 1
@func332_str1 = private unnamed_addr constant [4 x i8] c"add\00", align 1
@func332_str2 = private unnamed_addr constant [4 x i8] c"sub\00", align 1
@func332_str3 = private unnamed_addr constant [4 x i8] c"mul\00", align 1
@func332_func333_str1 = private unnamed_addr constant [5 x i8] c"sdiv\00", align 1
@func332_func333_str2 = private unnamed_addr constant [5 x i8] c"udiv\00", align 1
@func332_func334_str1 = private unnamed_addr constant [5 x i8] c"srem\00", align 1
@func332_func334_str2 = private unnamed_addr constant [5 x i8] c"urem\00", align 1
@func332_str4 = private unnamed_addr constant [3 x i8] c"or\00", align 1
@func332_str5 = private unnamed_addr constant [4 x i8] c"xor\00", align 1
@func332_str6 = private unnamed_addr constant [4 x i8] c"and\00", align 1
@func332_str7 = private unnamed_addr constant [8 x i8] c"icmp eq\00", align 1
@func332_str8 = private unnamed_addr constant [8 x i8] c"icmp ne\00", align 1
@func332_func335_str1 = private unnamed_addr constant [9 x i8] c"icmp slt\00", align 1
@func332_func335_str2 = private unnamed_addr constant [9 x i8] c"icmp ult\00", align 1
@func332_func336_str1 = private unnamed_addr constant [9 x i8] c"icmp sgt\00", align 1
@func332_func336_str2 = private unnamed_addr constant [9 x i8] c"icmp ugt\00", align 1
@func332_func337_str1 = private unnamed_addr constant [9 x i8] c"icmp sle\00", align 1
@func332_func337_str2 = private unnamed_addr constant [9 x i8] c"icmp ule\00", align 1
@func332_func338_str1 = private unnamed_addr constant [9 x i8] c"icmp sge\00", align 1
@func332_func338_str2 = private unnamed_addr constant [9 x i8] c"icmp uge\00", align 1
@func332_str9 = private unnamed_addr constant [4 x i8] c"shl\00", align 1
@func332_func339_str1 = private unnamed_addr constant [5 x i8] c"ashr\00", align 1
@func332_func339_str2 = private unnamed_addr constant [5 x i8] c"lshr\00", align 1
@func332_str10 = private unnamed_addr constant [27 x i8] c"<unknown-binary-operation>\00", align 1
@func340_str1 = private unnamed_addr constant [8 x i8] c"bitcast\00", align 1
@func341_str1 = private unnamed_addr constant [13 x i8] c"; loadImmPtr\00", align 1
@func341_str2 = private unnamed_addr constant [29 x i8] c"\0A  %%%d = inttoptr i64 %d to\00", align 1
@func342_str1 = private unnamed_addr constant [8 x i8] c"bitcast\00", align 1
@func343_str1 = private unnamed_addr constant [26 x i8] c"\0A  br label %%select_%d_0\00", align 1
@func343_func344_str1 = private unnamed_addr constant [15 x i8] c"\0Aselect_%d_%d:\00", align 1
@func343_func344_str2 = private unnamed_addr constant [8 x i8] c"icmp eq\00", align 1
@func343_func344_str3 = private unnamed_addr constant [14 x i8] c"\0A  br i1 %%%d\00", align 1
@func343_func344_str4 = private unnamed_addr constant [14 x i8] c"\0A  br i1 %%%d\00", align 1
@func343_func344_str5 = private unnamed_addr constant [48 x i8] c", label %%select_%d_%d_ok, label %%select_%d_%d\00", align 1
@func343_func344_str6 = private unnamed_addr constant [18 x i8] c"\0Aselect_%d_%d_ok:\00", align 1
@func343_func344_str7 = private unnamed_addr constant [28 x i8] c"\0A  br label %%select_%d_end\00", align 1
@func343_str2 = private unnamed_addr constant [15 x i8] c"\0Aselect_%d_%d:\00", align 1
@func343_str3 = private unnamed_addr constant [28 x i8] c"\0A  br label %%select_%d_end\00", align 1
@func343_str4 = private unnamed_addr constant [16 x i8] c"\0Aselect_%d_end:\00", align 1
@func343_str5 = private unnamed_addr constant [4 x i8] c"phi\00", align 1
@func343_str6 = private unnamed_addr constant [30 x i8] c"[ %%%d, %%select_%d_%d_ok ], \00", align 1
@func343_str7 = private unnamed_addr constant [25 x i8] c"[ %%%d, %%select_%d_%d ]\00", align 1
@func345_func346_str1 = private unnamed_addr constant [12 x i8] c"insertvalue\00", align 1
@func345_func346_str2 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@func347_func348_str1 = private unnamed_addr constant [12 x i8] c"insertvalue\00", align 1
@func347_func348_str2 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@func350_str1 = private unnamed_addr constant [10 x i8] c"\0A  store \00", align 1
@func350_str2 = private unnamed_addr constant [3 x i8] c"* \00", align 1
@func350_str3 = private unnamed_addr constant [11 x i8] c", align %d\00", align 1
@func351_str1 = private unnamed_addr constant [5 x i8] c"load\00", align 1
@func351_str2 = private unnamed_addr constant [3 x i8] c"* \00", align 1
@func352_str1 = private unnamed_addr constant [16 x i8] c"zeroinitializer\00", align 1
@func352_str2 = private unnamed_addr constant [16 x i8] c"zeroinitializer\00", align 1
@func352_str3 = private unnamed_addr constant [5 x i8] c"%llu\00", align 1
@func353_str1 = private unnamed_addr constant [5 x i8] c"%%%d\00", align 1
@func353_str2 = private unnamed_addr constant [5 x i8] c"%%%d\00", align 1
@func353_str3 = private unnamed_addr constant [4 x i8] c"@%s\00", align 1
@func353_str4 = private unnamed_addr constant [4 x i8] c"@%s\00", align 1
@func353_str5 = private unnamed_addr constant [5 x i8] c"%%%d\00", align 1
@func353_str6 = private unnamed_addr constant [16 x i8] c"zeroinitializer\00", align 1
@func353_str7 = private unnamed_addr constant [6 x i8] c"undef\00", align 1
@func353_str8 = private unnamed_addr constant [32 x i8] c"<LLVM_ValueInvalid x.kind = %d>\00", align 1
@func355_str1 = private unnamed_addr constant [12 x i8] c"insertvalue\00", align 1
@func355_str2 = private unnamed_addr constant [9 x i8] c" undef, \00", align 1
@func356_str1 = private unnamed_addr constant [10 x i8] c"\0A;stmt%d:\00", align 1
@func356_str2 = private unnamed_addr constant [22 x i8] c"<print::stmt_unknown>\00", align 1
@func358_str1 = private unnamed_addr constant [7 x i8] c"alloca\00", align 1
@func360_str1 = private unnamed_addr constant [10 x i8] c"\0A  br i1 \00", align 1
@func360_str2 = private unnamed_addr constant [35 x i8] c", label %%then_%d, label %%else_%d\00", align 1
@func360_str3 = private unnamed_addr constant [10 x i8] c"\0Athen_%d:\00", align 1
@func360_str4 = private unnamed_addr constant [23 x i8] c"\0A  br label %%endif_%d\00", align 1
@func360_str5 = private unnamed_addr constant [10 x i8] c"\0Aelse_%d:\00", align 1
@func360_str6 = private unnamed_addr constant [23 x i8] c"\0A  br label %%endif_%d\00", align 1
@func360_str7 = private unnamed_addr constant [11 x i8] c"\0Aendif_%d:\00", align 1
@func361_str1 = private unnamed_addr constant [26 x i8] c"\0A  br label %%continue_%d\00", align 1
@func361_str2 = private unnamed_addr constant [14 x i8] c"\0Acontinue_%d:\00", align 1
@func361_str3 = private unnamed_addr constant [10 x i8] c"\0A  br i1 \00", align 1
@func361_str4 = private unnamed_addr constant [36 x i8] c", label %%body_%d, label %%break_%d\00", align 1
@func361_str5 = private unnamed_addr constant [10 x i8] c"\0Abody_%d:\00", align 1
@func361_str6 = private unnamed_addr constant [26 x i8] c"\0A  br label %%continue_%d\00", align 1
@func361_str7 = private unnamed_addr constant [11 x i8] c"\0Abreak_%d:\00", align 1
@func362_str1 = private unnamed_addr constant [10 x i8] c"\0Aret void\00", align 1
@func362_str2 = private unnamed_addr constant [8 x i8] c"\0A  ret \00", align 1
@func363_str1 = private unnamed_addr constant [23 x i8] c"\0A  br label %%break_%d\00", align 1
@func364_str1 = private unnamed_addr constant [26 x i8] c"\0A  br label %%continue_%d\00", align 1
@func365_str1 = private unnamed_addr constant [17 x i8] c"\0A  br label %%%s\00", align 1
@func366_str1 = private unnamed_addr constant [17 x i8] c"\0A  br label %%%s\00", align 1
@func366_str2 = private unnamed_addr constant [5 x i8] c"\0A%s:\00", align 1
@func369_str1 = private unnamed_addr constant [26 x i8] c"prn/printType :: t = nil\0A\00", align 1
@func369_str2 = private unnamed_addr constant [5 x i8] c"%%%s\00", align 1
@func369_str3 = private unnamed_addr constant [5 x i8] c"%%%s\00", align 1
@func369_str4 = private unnamed_addr constant [4 x i8] c"i%d\00", align 1
@func369_str5 = private unnamed_addr constant [3 x i8] c"i1\00", align 1
@func369_str6 = private unnamed_addr constant [5 x i8] c"%%%s\00", align 1
@func369_func371_str1 = private unnamed_addr constant [20 x i8] c"<type-unknown-kind>\00", align 1
@func369_func371_str2 = private unnamed_addr constant [18 x i8] c"unk type kind %d\0A\00", align 1
@func373_str1 = private unnamed_addr constant [2 x i8] c"{\00", align 1
@func373_str2 = private unnamed_addr constant [2 x i8] c"}\00", align 1
@func375_str1 = private unnamed_addr constant [7 x i8] c"[%d x \00", align 1
@func375_str2 = private unnamed_addr constant [2 x i8] c"]\00", align 1
@func376_str1 = private unnamed_addr constant [2 x i8] c"*\00", align 1
@func377_str1 = private unnamed_addr constant [2 x i8] c"*\00", align 1
@func378_str1 = private unnamed_addr constant [5 x i8] c"void\00", align 1
@func378_str2 = private unnamed_addr constant [3 x i8] c" (\00", align 1
@func378_str3 = private unnamed_addr constant [6 x i8] c", ...\00", align 1
@func378_str4 = private unnamed_addr constant [2 x i8] c")\00", align 1
@func378_str5 = private unnamed_addr constant [2 x i8] c"*\00", align 1
@func380_str1 = private unnamed_addr constant [9 x i8] c"type_new\00", align 1
@func407_str1 = private unnamed_addr constant [20 x i8] c"alignment : align=0\00", align 1
@func408_str1 = private unnamed_addr constant [22 x i8] c"type_record_field_new\00", align 1
@func409_func410_str1 = private unnamed_addr constant [14 x i8] c"unknown type3\00", align 1
@func409_func412_str1 = private unnamed_addr constant [15 x i8] c"undefined type\00", align 1
@func409_func412_str2 = private unnamed_addr constant [11 x i8] c"align 0 in\00", align 1
@func416_str1 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@func416_str2 = private unnamed_addr constant [7 x i8] c"union.\00", align 1
@func427_str1 = private unnamed_addr constant [5 x i8] c"Void\00", align 1
@func427_str2 = private unnamed_addr constant [5 x i8] c"Void\00", align 1
@func427_str3 = private unnamed_addr constant [5 x i8] c"Unit\00", align 1
@func427_str4 = private unnamed_addr constant [5 x i8] c"Unit\00", align 1
@func427_str5 = private unnamed_addr constant [5 x i8] c"Bool\00", align 1
@func427_str6 = private unnamed_addr constant [5 x i8] c"Int8\00", align 1
@func427_str7 = private unnamed_addr constant [6 x i8] c"Int16\00", align 1
@func427_str8 = private unnamed_addr constant [6 x i8] c"Int32\00", align 1
@func427_str9 = private unnamed_addr constant [6 x i8] c"Int64\00", align 1
@func427_str10 = private unnamed_addr constant [7 x i8] c"Int128\00", align 1
@func427_str11 = private unnamed_addr constant [7 x i8] c"Int256\00", align 1
@func427_str12 = private unnamed_addr constant [7 x i8] c"Int512\00", align 1
@func427_str13 = private unnamed_addr constant [8 x i8] c"Int1024\00", align 1
@func427_str14 = private unnamed_addr constant [5 x i8] c"Nat8\00", align 1
@func427_str15 = private unnamed_addr constant [6 x i8] c"Nat16\00", align 1
@func427_str16 = private unnamed_addr constant [6 x i8] c"Nat32\00", align 1
@func427_str17 = private unnamed_addr constant [6 x i8] c"Nat64\00", align 1
@func427_str18 = private unnamed_addr constant [7 x i8] c"Nat128\00", align 1
@func427_str19 = private unnamed_addr constant [7 x i8] c"Nat256\00", align 1
@func427_str20 = private unnamed_addr constant [7 x i8] c"Nat512\00", align 1
@func427_str21 = private unnamed_addr constant [8 x i8] c"Nat1024\00", align 1
@func427_str22 = private unnamed_addr constant [6 x i8] c"Int64\00", align 1
@func427_str23 = private unnamed_addr constant [6 x i8] c"Nat64\00", align 1
@func427_str24 = private unnamed_addr constant [6 x i8] c"Int32\00", align 1
@func427_str25 = private unnamed_addr constant [6 x i8] c"Nat32\00", align 1
@func427_str26 = private unnamed_addr constant [5 x i8] c"Int8\00", align 1
@func427_str27 = private unnamed_addr constant [5 x i8] c"Nat8\00", align 1
@func427_str28 = private unnamed_addr constant [6 x i8] c"Int16\00", align 1
@func427_str29 = private unnamed_addr constant [6 x i8] c"Nat16\00", align 1
@func427_str30 = private unnamed_addr constant [4 x i8] c"Str\00", align 1
@func427_str31 = private unnamed_addr constant [4 x i8] c"Str\00", align 1
@func427_str32 = private unnamed_addr constant [7 x i8] c"Int128\00", align 1
@func427_str33 = private unnamed_addr constant [7 x i8] c"Int256\00", align 1
@func427_str34 = private unnamed_addr constant [7 x i8] c"Int512\00", align 1
@func427_str35 = private unnamed_addr constant [8 x i8] c"Int1024\00", align 1
@func427_str36 = private unnamed_addr constant [7 x i8] c"Nat128\00", align 1
@func427_str37 = private unnamed_addr constant [7 x i8] c"Nat256\00", align 1
@func427_str38 = private unnamed_addr constant [7 x i8] c"Nat512\00", align 1
@func427_str39 = private unnamed_addr constant [8 x i8] c"Nat1024\00", align 1
@func427_str40 = private unnamed_addr constant [8 x i8] c"Numeric\00", align 1
@func429_str1 = private unnamed_addr constant [5 x i8] c"Int8\00", align 1
@func429_str2 = private unnamed_addr constant [6 x i8] c"Int16\00", align 1
@func429_str3 = private unnamed_addr constant [6 x i8] c"Int32\00", align 1
@func429_str4 = private unnamed_addr constant [6 x i8] c"Int64\00", align 1
@func429_str5 = private unnamed_addr constant [7 x i8] c"Int128\00", align 1
@func429_str6 = private unnamed_addr constant [7 x i8] c"Int256\00", align 1
@func429_str7 = private unnamed_addr constant [7 x i8] c"Int512\00", align 1
@func429_str8 = private unnamed_addr constant [8 x i8] c"Int1024\00", align 1
@func429_func430_str1 = private unnamed_addr constant [27 x i8] c"unsupported cfgIntegerSize\00", align 1
@func434_str1 = private unnamed_addr constant [21 x i8] c"value_new : v != nil\00", align 1
@func435_str1 = private unnamed_addr constant [21 x i8] c"value_new : v != nil\00", align 1
@func441_str1 = private unnamed_addr constant [20 x i8] c"do_value : v == nil\00", align 1
@func442_str1 = private unnamed_addr constant [19 x i8] c"do_value_forbidden\00", align 1
@func442_str2 = private unnamed_addr constant [6 x i8] c"stop.\00", align 1
@func443_func444_str1 = private unnamed_addr constant [31 x i8] c"expected value with union type\00", align 1
@func443_func444_str2 = private unnamed_addr constant [11 x i8] c"type error\00", align 1
@func443_str1 = private unnamed_addr constant [25 x i8] c"expected 'other' variant\00", align 1
@func446_str1 = private unnamed_addr constant [17 x i8] c"expected pointer\00", align 1
@func447_str1 = private unnamed_addr constant [18 x i8] c"binary type error\00", align 1
@func449_func450_str1 = private unnamed_addr constant [21 x i8] c"not enough arguments\00", align 1
@func449_func450_str2 = private unnamed_addr constant [16 x i8] c"excess argument\00", align 1
@func453_str1 = private unnamed_addr constant [16 x i8] c"undefined field\00", align 1
@func456_str1 = private unnamed_addr constant [16 x i8] c"type cast error\00", align 1
@func457_str1 = private unnamed_addr constant [16 x i8] c"type cast error\00", align 1
@func459_str1 = private unnamed_addr constant [16 x i8] c"type cast error\00", align 1
@func460_str1 = private unnamed_addr constant [16 x i8] c"type cast error\00", align 1
@func461_str1 = private unnamed_addr constant [16 x i8] c"type cast error\00", align 1
@func463_str1 = private unnamed_addr constant [16 x i8] c"type cast error\00", align 1
@func464_str1 = private unnamed_addr constant [16 x i8] c"type cast error\00", align 1
@func466_str1 = private unnamed_addr constant [18 x i8] c"cast to same type\00", align 1
@func466_func467_str1 = private unnamed_addr constant [18 x i8] c"do_value_cast unk\00", align 1
@func468_str1 = private unnamed_addr constant [20 x i8] c"expected union type\00", align 1
@func468_str2 = private unnamed_addr constant [11 x i8] c"type error\00", align 1
@func469_str1 = private unnamed_addr constant [11 x i8] c"type error\00", align 1
@func470_str1 = private unnamed_addr constant [20 x i8] c"sizeof unknown type\00", align 1
@func471_str1 = private unnamed_addr constant [21 x i8] c"alignof unknown type\00", align 1
@func472_str1 = private unnamed_addr constant [15 x i8] c"unknown value\0A\00", align 1
@func473_str1 = private unnamed_addr constant [2 x i8] c"0\00", align 1
@func473_str2 = private unnamed_addr constant [2 x i8] c"x\00", align 1
@func473_str3 = private unnamed_addr constant [5 x i8] c"%llx\00", align 1
@func473_str4 = private unnamed_addr constant [5 x i8] c"%lld\00", align 1
@func475_str1 = private unnamed_addr constant [5 x i8] c"func\00", align 1
@func475_str2 = private unnamed_addr constant [2 x i8] c"_\00", align 1
@func490_str1 = private unnamed_addr constant [32 x i8] c"