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

%union.3 = type {i16, [48 x i8]}

%union.4 = type %Unit*

%union.5 = type %Unit*

%union.6 = type %Unit*

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
%AstTypeSpecial = type {%AstType*, %TokenInfo*}
%AstTypeUnion = type {%List, %TokenInfo*}
%AstType = type {%AstTypeKind, %AstName, %AstTypeEnum, %AstTypeArray, %AstTypeArrayU, %AstTypePointer, %AstTypeRecord, %AstTypeFunc, %AstTypeVar, %AstTypeUnion, %AstTypeSpecial, %TokenInfo*}
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
%AstValueRecord = type {%List, %TokenInfo*}
%AstValueArray = type {%List, %TokenInfo*}
%AstValueBinary = type {%AstValueKind, %AstValue*, %AstValue*, %TokenInfo*}
%AstValueUnary = type {%AstValueKind, %AstValue*, %TokenInfo*}
%AstValueSizeof = type {%AstType*, %TokenInfo*}
%AstValueAlignof = type {%AstType*, %TokenInfo*}
%AstValueString = type {%Str, %TokenInfo*}
%AstValueNumber = type {%Str, %TokenInfo*}
%AstValueName = type {%AstId*, %AstId*, %TokenInfo*}
%AstValue = type {%AstValueKind, %AstName, %AstValueRecord, %AstValueArray, %AstValueString, %AstValueNumber, %AstValueFunc, %AstValueUnary, %AstValueBinary, %AstValueCall, %AstValueIndex, %AstValueAccess, %AstValueCast, %AstValueIs, %AstValueAs, %AstValueWhen, %AstValueSizeof, %AstValueAlignof, i1, %TokenInfo*}
%AstStmtValueBind = type {%AstId*, %AstValue*, %TokenInfo*}
%AstStmtTypeBind = type {%AstId*, %AstType*, %TokenInfo*}
%AstStmtExpr = type {%AstValue*, %TokenInfo*}
%AstStmtAssign = type {%AstValue*, %AstValue*, %TokenInfo*}
%AstStmtBlock = type {%List, %TokenInfo*}
%AstStmtIf = type {%AstValue*, %union.3*, %union.1, %TokenInfo*}
%AstStmtWhile = type {%AstValue*, %union.3*, %TokenInfo*}
%AstStmtReturn = type {%union.2, %TokenInfo*}
%AstStmtGoto = type {%AstId*, %TokenInfo*}
%AstStmtLabel = type {%AstId*, %TokenInfo*}
%AstStmtBreak = type {%TokenInfo*}
%AstStmtContinue = type {%TokenInfo*}
%AstStmt = type %union.3
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
%Type = type {%TypeKind, %Nat32, %Str, %Nat32, %Nat32, %TypeNumeric, %TypeFunc, %TypePointer, %TypeArray, %TypeArrayU, %TypeRecord, %TypeEnum, %TypeVar, %TypeUnion, %TokenInfo*}
%ValueKind = type i16
%ValueImm = type {%Type*, %Int64, %TokenInfo*}
%ValueRecord = type {%Type*, %List, %TokenInfo*}
%ValueArray = type {%Type*, %List, %TokenInfo*}
%ValueMention = type {%Type*, %Value*, %TokenInfo*}
%ValueUn = type {%Type*, %Value*, %TokenInfo*}
%ValueBin = type {%Type*, %ValueKind, %Value*, %Value*, %TokenInfo*}
%ValueCall = type {%Type*, %Value*, %List*, %TokenInfo*}
%ValueAccess = type {%Type*, %Value*, %Str, %TokenInfo*}
%ValueIndex = type {%Type*, %Value*, %Value*, %TokenInfo*}
%ValueCast = type {%Type*, %Value*, %Type*, %TokenInfo*}
%ValueAs = type {%Type*, %Value*, %Type*, %TokenInfo*}
%ValueIs = type {%Type*, %Value*, %Nat32, %TokenInfo*}
%ValueWhenVariant = type {%Type*, %Value*, %Value*, %TokenInfo*}
%ValueWhen = type {%Type*, %Value*, %List, %Value*, %TokenInfo*}
%Value = type {%ValueKind, %Type*, %ValueImm, %ValueMention, %ValueRecord, %ValueArray, %Definition*, %Decl*, %Decl*, %StmtExpr*, %ValueUn, %ValueBin, %ValueIndex, %ValueAccess, %ValueCast, %ValueAs, %ValueIs, %ValueCall, %ValueWhen, %TokenInfo*}
%StmtKind = type i16
%Index = type {%List, %List}
%StmtBlock = type {%StmtBlock*, %Index, %List, %List, %TokenInfo*}
%StmtExpr = type {%Value*, %Nat32, %TokenInfo*}
%StmtAssign = type {%Value*, %Value*, %TokenInfo*}
%StmtIf = type {%Value*, %Stmt*, %union.4, %TokenInfo*}
%StmtWhile = type {%Value*, %Stmt*, %TokenInfo*}
%StmtReturn = type {%union.5, %TokenInfo*}
%StmtBreak = type {%TokenInfo*}
%StmtContinue = type {%TokenInfo*}
%StmtGoto = type {%Str, %TokenInfo*}
%StmtLabel = type {%Str, %TokenInfo*}
%Stmt = type {%StmtKind, %StmtExpr, %StmtAssign, %StmtBlock, %Decl*, %StmtIf, %StmtWhile, %StmtReturn, %StmtGoto, %StmtLabel, %StmtBreak, %StmtContinue, %Str, %TokenInfo*}
%Module = type {%Index, %Index, %Index}
%FuncContext = type {%Str, %Value*, %StmtBlock*, %Nat32, %Nat32, %Nat32, %Nat32, %Nat32}
%DefinitionKind = type i16
%DefType = type {%Str, %Type*}
%DefConst = type {%Str, %Type*, %Value*}
%DefStr = type {%Str, %Type*, %Str, %Nat32}
%DefArray = type {%Str, %Type*, %Nat32, %List*}
%DefFunc = type {%Str, %Type*, %StmtBlock*}
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
%DoStmt = type %union.6 (%union.3*)*
%Rule = type i1 (%Nat8)*
%AstTypeParser = type %AstType* ()*
%AstValueParser = type %AstValue* ()*
%AstStmtParser = type %union.8 (%TokenInfo*)*
%Eval = type %LLVM_Value (%Value*)*
%func306.type1 = type {[64 x %LLVM_Value], %Nat16}
%EvalCast = type %LLVM_Value (%LLVM_Value, %Type*)*
%func343.type2 = type {%LLVM_Value, %Nat32, %Nat32, [256 x %Nat32], %Type*}
%func345.type3 = type {%Type*, %LLVM_Value}
%func347.type4 = type {%Type*, %LLVM_Value, %Nat32}
%func410.type5 = type {%List*, i1}
%func410_func411.type6 = type {%List*, %Type*}
%func417.type7 = type {%List*, %Nat32}
%func432.type8 = type {%Type*, %Nat32}
%func447.type9 = type {%Value*, %Type*, %List, %Value*}
%func453.type10 = type {%Value*, %List*, %List*, %TokenInfo*}
%DoValueCast = type %Value* (%Value*, %Type*, %TokenInfo*)*
%func470.type11 = type {%Type*, %List}
%func485.type12 = type {%Type*, %List}

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
@func82_str8 = private unnamed_addr constant [20 x i8] c"<TypeGenericRecord>\00", align 1
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
@func94_str5 = private unnamed_addr constant [13 x i8] c"#ValueRecord\00", align 1
@func94_str6 = private unnamed_addr constant [20 x i8] c"#ValueGenericRecord\00", align 1
@func94_str7 = private unnamed_addr constant [18 x i8] c"#ValueGlobalConst\00", align 1
@func94_str8 = private unnamed_addr constant [16 x i8] c"#ValueGlobalVar\00", align 1
@func94_str9 = private unnamed_addr constant [12 x i8] c"#ValueParam\00", align 1
@func94_str10 = private unnamed_addr constant [17 x i8] c"#ValueLocalConst\00", align 1
@func94_str11 = private unnamed_addr constant [15 x i8] c"#ValueLocalVar\00", align 1
@func94_str12 = private unnamed_addr constant [10 x i8] c"#ValueRef\00", align 1
@func94_str13 = private unnamed_addr constant [12 x i8] c"#ValueDeref\00", align 1
@func94_str14 = private unnamed_addr constant [10 x i8] c"#ValueNot\00", align 1
@func94_str15 = private unnamed_addr constant [12 x i8] c"#ValueMinus\00", align 1
@func94_str16 = private unnamed_addr constant [11 x i8] c"#ValuePlus\00", align 1
@func94_str17 = private unnamed_addr constant [10 x i8] c"#ValueAdd\00", align 1
@func94_str18 = private unnamed_addr constant [10 x i8] c"#ValueSub\00", align 1
@func94_str19 = private unnamed_addr constant [10 x i8] c"#ValueMul\00", align 1
@func94_str20 = private unnamed_addr constant [10 x i8] c"#ValueDiv\00", align 1
@func94_str21 = private unnamed_addr constant [10 x i8] c"#ValueMod\00", align 1
@func94_str22 = private unnamed_addr constant [9 x i8] c"#ValueOr\00", align 1
@func94_str23 = private unnamed_addr constant [10 x i8] c"#ValueXor\00", align 1
@func94_str24 = private unnamed_addr constant [10 x i8] c"#ValueAnd\00", align 1
@func94_str25 = private unnamed_addr constant [9 x i8] c"#ValueEq\00", align 1
@func94_str26 = private unnamed_addr constant [9 x i8] c"#ValueNe\00", align 1
@func94_str27 = private unnamed_addr constant [9 x i8] c"#ValueLt\00", align 1
@func94_str28 = private unnamed_addr constant [9 x i8] c"#ValueGt\00", align 1
@func94_str29 = private unnamed_addr constant [9 x i8] c"#ValueLe\00", align 1
@func94_str30 = private unnamed_addr constant [9 x i8] c"#ValueGe\00", align 1
@func94_str31 = private unnamed_addr constant [11 x i8] c"#ValueLoad\00", align 1
@func94_str32 = private unnamed_addr constant [10 x i8] c"#ValueShl\00", align 1
@func94_str33 = private unnamed_addr constant [10 x i8] c"#ValueShr\00", align 1
@func94_str34 = private unnamed_addr constant [11 x i8] c"#ValueCall\00", align 1
@func94_str35 = private unnamed_addr constant [12 x i8] c"#ValueIndex\00", align 1
@func94_str36 = private unnamed_addr constant [13 x i8] c"#ValueAccess\00", align 1
@func94_str37 = private unnamed_addr constant [11 x i8] c"#ValueCast\00", align 1
@func94_str38 = private unnamed_addr constant [11 x i8] c"#ValueWhen\00", align 1
@func94_str39 = private unnamed_addr constant [21 x i8] c"<unknown-value-kind>\00", align 1
@func94_str40 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
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
@func213_str2 = private unnamed_addr constant [7 x i8] c"Tagged\00", align 1
@func213_str3 = private unnamed_addr constant [4 x i8] c"Var\00", align 1
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
@func234_func235_str1 = private unnamed_addr constant [19 x i8] c"unexpected symbol\0A\00", align 1
@func234_func235_str2 = private unnamed_addr constant [9 x i8] c"bad term\00", align 1
@func234_func236_str1 = private unnamed_addr constant [19 x i8] c"unexpected symbol\0A\00", align 1
@func234_func236_str2 = private unnamed_addr constant [14 x i8] c"received: %s\0A\00", align 1
@func234_func236_str3 = private unnamed_addr constant [9 x i8] c"bad term\00", align 1
@func237_str1 = private unnamed_addr constant [5 x i8] c"func\00", align 1
@func237_str2 = private unnamed_addr constant [7 x i8] c"extern\00", align 1
@func237_str3 = private unnamed_addr constant [6 x i8] c"array\00", align 1
@func237_str4 = private unnamed_addr constant [5 x i8] c"when\00", align 1
@func238_str1 = private unnamed_addr constant [2 x i8] c"{\00", align 1
@func238_str2 = private unnamed_addr constant [2 x i8] c"}\00", align 1
@func238_str3 = private unnamed_addr constant [5 x i8] c"else\00", align 1
@func238_str4 = private unnamed_addr constant [3 x i8] c"=>\00", align 1
@func238_str5 = private unnamed_addr constant [3 x i8] c"=>\00", align 1
@func240_str1 = private unnamed_addr constant [2 x i8] c"=\00", align 1
@func240_str2 = private unnamed_addr constant [2 x i8] c")\00", align 1
@func240_str3 = private unnamed_addr constant [2 x i8] c",\00", align 1
@func241_str1 = private unnamed_addr constant [2 x i8] c"]\00", align 1
@func241_str2 = private unnamed_addr constant [2 x i8] c",\00", align 1
@func242_str1 = private unnamed_addr constant [2 x i8] c"{\00", align 1
@func245_str1 = private unnamed_addr constant [21 x i8] c"ast_value_new malloc\00", align 1
@func248_str1 = private unnamed_addr constant [2 x i8] c"=\00", align 1
@func248_func249_str1 = private unnamed_addr constant [2 x i8] c":\00", align 1
@func248_str2 = private unnamed_addr constant [2 x i8] c"{\00", align 1
@func248_str3 = private unnamed_addr constant [3 x i8] c"if\00", align 1
@func248_str4 = private unnamed_addr constant [6 x i8] c"while\00", align 1
@func248_str5 = private unnamed_addr constant [7 x i8] c"return\00", align 1
@func248_str6 = private unnamed_addr constant [6 x i8] c"break\00", align 1
@func248_str7 = private unnamed_addr constant [9 x i8] c"continue\00", align 1
@func248_str8 = private unnamed_addr constant [5 x i8] c"goto\00", align 1
@func250_str1 = private unnamed_addr constant [3 x i8] c":=\00", align 1
@func251_str1 = private unnamed_addr constant [2 x i8] c"=\00", align 1
@func252_str1 = private unnamed_addr constant [2 x i8] c"=\00", align 1
@func253_str1 = private unnamed_addr constant [2 x i8] c"}\00", align 1
@func253_str2 = private unnamed_addr constant [23 x i8] c"unexpected end-of-file\00", align 1
@func253_str3 = private unnamed_addr constant [2 x i8] c"}\00", align 1
@func254_str1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func254_str2 = private unnamed_addr constant [2 x i8] c"{\00", align 1
@func254_str3 = private unnamed_addr constant [5 x i8] c"else\00", align 1
@func254_str4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func254_str5 = private unnamed_addr constant [3 x i8] c"if\00", align 1
@func254_str6 = private unnamed_addr constant [2 x i8] c"{\00", align 1
@func255_str1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func255_str2 = private unnamed_addr constant [2 x i8] c"{\00", align 1
@func256_str1 = private unnamed_addr constant [27 x i8] c"expected return expression\00", align 1
@func259_str1 = private unnamed_addr constant [2 x i8] c",\00", align 1
@func259_str2 = private unnamed_addr constant [2 x i8] c":\00", align 1
@func260_str1 = private unnamed_addr constant [2 x i8] c")\00", align 1
@func261_str1 = private unnamed_addr constant [2 x i8] c"(\00", align 1
@func261_str2 = private unnamed_addr constant [2 x i8] c"[\00", align 1
@func261_str3 = private unnamed_addr constant [2 x i8] c"{\00", align 1
@func261_str4 = private unnamed_addr constant [2 x i8] c"*\00", align 1
@func263_str1 = private unnamed_addr constant [2 x i8] c")\00", align 1
@func263_str2 = private unnamed_addr constant [2 x i8] c"=\00", align 1
@func264_func265_str1 = private unnamed_addr constant [38 x i8] c"e-m:o-i64:64-f80:128-n8:16:32:64-S128\00", align 1
@func264_func265_str2 = private unnamed_addr constant [27 x i8] c"x86_64-apple-macosx10.15.0\00", align 1
@func264_func266_str1 = private unnamed_addr constant [48 x i8] c"e-m:e-p:32:32-i64:64-v128:64:128-a:0:32-n32-S64\00", align 1
@func264_func266_str2 = private unnamed_addr constant [28 x i8] c"thumbv7em-unknown-none-eabi\00", align 1
@func264_func267_str1 = private unnamed_addr constant [1 x i8] c"\00", align 1
@func264_func267_str2 = private unnamed_addr constant [1 x i8] c"\00", align 1
@func268_str1 = private unnamed_addr constant [36 x i8] c"assembly::definition_new : x != nil\00", align 1
@func275_str1 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@func276_str1 = private unnamed_addr constant [4 x i8] c"\0A%s\00", align 1
@func277_str1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func278_str1 = private unnamed_addr constant [2 x i8] c" \00", align 1
@func279_str1 = private unnamed_addr constant [3 x i8] c", \00", align 1
@func282_str1 = private unnamed_addr constant [20 x i8] c"print_assembly: %s\0A\00", align 1
@func282_str2 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@func282_str3 = private unnamed_addr constant [26 x i8] c"cannot create output file\00", align 1
@func282_str4 = private unnamed_addr constant [16 x i8] c"; assembly: %s\0A\00", align 1
@func282_str5 = private unnamed_addr constant [27 x i8] c"; clang out2.ll && ./a.out\00", align 1
@func282_str6 = private unnamed_addr constant [44 x i8] c"; llc out2.ll ; for create .s file from .ll\00", align 1
@func282_str7 = private unnamed_addr constant [26 x i8] c"target datalayout = \22%s\22\0A\00", align 1
@func282_str8 = private unnamed_addr constant [22 x i8] c"target triple = \22%s\22\0A\00", align 1
@func282_str9 = private unnamed_addr constant [16 x i8] c"%Bool = type i1\00", align 1
@func282_str10 = private unnamed_addr constant [16 x i8] c"%Unit = type i1\00", align 1
@func282_str11 = private unnamed_addr constant [16 x i8] c"%Str = type i8*\00", align 1
@func282_str12 = private unnamed_addr constant [20 x i8] c"%Numeric = type i64\00", align 1
@func282_func283_str1 = private unnamed_addr constant [17 x i8] c"\0A%%%s = type i%d\00", align 1
@func282_str13 = private unnamed_addr constant [12 x i8] c"\0A; aliases:\00", align 1
@func282_func284_str1 = private unnamed_addr constant [14 x i8] c"\0A%%%s = type \00", align 1
@func282_func284_str2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func282_func284_str3 = private unnamed_addr constant [30 x i8] c"\0A%%%s = type {i16, [%d x i8]}\00", align 1
@func282_func284_str4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func282_str14 = private unnamed_addr constant [11 x i8] c"\0A\0A;types:\0A\00", align 1
@func282_str15 = private unnamed_addr constant [13 x i8] c"\0A\0A;strings:\0A\00", align 1
@func282_str16 = private unnamed_addr constant [12 x i8] c"\0A\0A;arrays:\0A\00", align 1
@func282_str17 = private unnamed_addr constant [10 x i8] c"\0A\0A;vars:\0A\00", align 1
@func282_str18 = private unnamed_addr constant [11 x i8] c"\0A\0A;funcs:\0A\00", align 1
@func282_str19 = private unnamed_addr constant [13 x i8] c"\0A\0A;aliases:\0A\00", align 1
@func282_str20 = private unnamed_addr constant [14 x i8] c"\0A\0A;metadata:\0A\00", align 1
@func291_str1 = private unnamed_addr constant [14 x i8] c"\0A%%%s = type \00", align 1
@func292_str1 = private unnamed_addr constant [38 x i8] c"\0A@%s = private unnamed_addr constant \00", align 1
@func292_str2 = private unnamed_addr constant [3 x i8] c" [\00", align 1
@func292_str3 = private unnamed_addr constant [12 x i8] c"], align 16\00", align 1
@func294_str1 = private unnamed_addr constant [50 x i8] c"\0A@%s = private unnamed_addr constant [%d x i8] c\22\00", align 1
@func294_str2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func294_str3 = private unnamed_addr constant [2 x i8] c"\0D\00", align 1
@func294_str4 = private unnamed_addr constant [2 x i8] c"\09\00", align 1
@func294_str5 = private unnamed_addr constant [2 x i8] c"\0B\00", align 1
@func294_str6 = private unnamed_addr constant [2 x i8] c"\07\00", align 1
@func294_str7 = private unnamed_addr constant [2 x i8] c"\08\00", align 1
@func294_str8 = private unnamed_addr constant [2 x i8] c"\5C\00", align 1
@func294_str9 = private unnamed_addr constant [2 x i8] c"\22\00", align 1
@func294_str10 = private unnamed_addr constant [6 x i8] c"\5C%02X\00", align 1
@func294_str11 = private unnamed_addr constant [3 x i8] c"%c\00", align 1
@func294_str12 = private unnamed_addr constant [14 x i8] c"\5C00\22, align 1\00", align 1
@func295_str1 = private unnamed_addr constant [15 x i8] c"\0A@%s = global \00", align 1
@func295_str2 = private unnamed_addr constant [16 x i8] c"zeroinitializer\00", align 1
@func295_str3 = private unnamed_addr constant [29 x i8] c"expected constant init value\00", align 1
@func295_str4 = private unnamed_addr constant [16 x i8] c"zeroinitializer\00", align 1
@func296_str1 = private unnamed_addr constant [3 x i8] c"xx\00", align 1
@func296_str2 = private unnamed_addr constant [6 x i8] c"xx : \00", align 1
@func296_str3 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func296_str4 = private unnamed_addr constant [11 x i8] c"Maybe? %d\0A\00", align 1
@func296_str5 = private unnamed_addr constant [20 x i8] c"prn/funcdef t = nil\00", align 1
@func296_str6 = private unnamed_addr constant [9 x i8] c"\0Adeclare\00", align 1
@func296_str7 = private unnamed_addr constant [9 x i8] c"\0A\0Adefine\00", align 1
@func296_str8 = private unnamed_addr constant [5 x i8] c"void\00", align 1
@func296_str9 = private unnamed_addr constant [7 x i8] c" @%s (\00", align 1
@func296_str10 = private unnamed_addr constant [6 x i8] c", ...\00", align 1
@func296_str11 = private unnamed_addr constant [2 x i8] c")\00", align 1
@func296_str12 = private unnamed_addr constant [3 x i8] c" {\00", align 1
@func296_str13 = private unnamed_addr constant [12 x i8] c"\0A  ret void\00", align 1
@func296_str14 = private unnamed_addr constant [3 x i8] c"\0A}\00", align 1
@func298_str1 = private unnamed_addr constant [14 x i8] c"\0A@%s = alias \00", align 1
@func298_str2 = private unnamed_addr constant [6 x i8] c"* @%s\00", align 1
@func299_str1 = private unnamed_addr constant [14 x i8] c"\0A  %%%d = %s \00", align 1
@func300_str1 = private unnamed_addr constant [23 x i8] c"getelementptr inbounds\00", align 1
@func300_str2 = private unnamed_addr constant [3 x i8] c"* \00", align 1
@func301_str1 = private unnamed_addr constant [13 x i8] c"extractvalue\00", align 1
@func301_str2 = private unnamed_addr constant [5 x i8] c", %u\00", align 1
@func302_func303_str1 = private unnamed_addr constant [28 x i8] c"error eval #ValueUndefined\0A\00", align 1
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
@func408_str1 = private unnamed_addr constant [20 x i8] c"alignment : align=0\00", align 1
@func409_str1 = private unnamed_addr constant [22 x i8] c"type_record_field_new\00", align 1
@func410_func411_str1 = private unnamed_addr constant [14 x i8] c"unknown type3\00", align 1
@func410_func413_str1 = private unnamed_addr constant [15 x i8] c"undefined type\00", align 1
@func410_func413_str2 = private unnamed_addr constant [11 x i8] c"align 0 in\00", align 1
@func417_str1 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@func417_str2 = private unnamed_addr constant [7 x i8] c"union.\00", align 1
@func417_func418_str1 = private unnamed_addr constant [35 x i8] c"this type already present in union\00", align 1
@func428_str1 = private unnamed_addr constant [5 x i8] c"Void\00", align 1
@func428_str2 = private unnamed_addr constant [5 x i8] c"Void\00", align 1
@func428_str3 = private unnamed_addr constant [5 x i8] c"Unit\00", align 1
@func428_str4 = private unnamed_addr constant [5 x i8] c"Unit\00", align 1
@func428_str5 = private unnamed_addr constant [5 x i8] c"Bool\00", align 1
@func428_str6 = private unnamed_addr constant [5 x i8] c"Int8\00", align 1
@func428_str7 = private unnamed_addr constant [6 x i8] c"Int16\00", align 1
@func428_str8 = private unnamed_addr constant [6 x i8] c"Int32\00", align 1
@func428_str9 = private unnamed_addr constant [6 x i8] c"Int64\00", align 1
@func428_str10 = private unnamed_addr constant [7 x i8] c"Int128\00", align 1
@func428_str11 = private unnamed_addr constant [7 x i8] c"Int256\00", align 1
@func428_str12 = private unnamed_addr constant [7 x i8] c"Int512\00", align 1
@func428_str13 = private unnamed_addr constant [8 x i8] c"Int1024\00", align 1
@func428_str14 = private unnamed_addr constant [5 x i8] c"Nat8\00", align 1
@func428_str15 = private unnamed_addr constant [6 x i8] c"Nat16\00", align 1
@func428_str16 = private unnamed_addr constant [6 x i8] c"Nat32\00", align 1
@func428_str17 = private unnamed_addr constant [6 x i8] c"Nat64\00", align 1
@func428_str18 = private unnamed_addr constant [7 x i8] c"Nat128\00", align 1
@func428_str19 = private unnamed_addr constant [7 x i8] c"Nat256\00", align 1
@func428_str20 = private unnamed_addr constant [7 x i8] c"Nat512\00", align 1
@func428_str21 = private unnamed_addr constant [8 x i8] c"Nat1024\00", align 1
@func428_str22 = private unnamed_addr constant [6 x i8] c"Int64\00", align 1
@func428_str23 = private unnamed_addr constant [6 x i8] c"Nat64\00", align 1
@func428_str24 = private unnamed_addr constant [6 x i8] c"Int32\00", align 1
@func428_str25 = private unnamed_addr constant [6 x i8] c"Nat32\00", align 1
@func428_str26 = private unnamed_addr constant [5 x i8] c"Int8\00", align 1
@func428_str27 = private unnamed_addr constant [5 x i8] c"Nat8\00", align 1
@func428_str28 = private unnamed_addr constant [6 x i8] c"Int16\00", align 1
@func428_str29 = private unnamed_addr constant [6 x i8] c"Nat16\00", align 1
@func428_str30 = private unnamed_addr constant [4 x i8] c"Str\00", align 1
@func428_str31 = private unnamed_addr constant [4 x i8] c"Str\00", align 1
@func428_str32 = private unnamed_addr constant [7 x i8] c"Int128\00", align 1
@func428_str33 = private unnamed_addr constant [7 x i8] c"Int256\00", align 1
@func428_str34 = private unnamed_addr constant [7 x i8] c"Int512\00", align 1
@func428_str35 = private unnamed_addr constant [8 x i8] c"Int1024\00", align 1
@func428_str36 = private unnamed_addr constant [7 x i8] c"Nat128\00", align 1
@func428_str37 = private unnamed_addr constant [7 x i8] c"Nat256\00", align 1
@func428_str38 = private unnamed_addr constant [7 x i8] c"Nat512\00", align 1
@func428_str39 = private unnamed_addr constant [8 x i8] c"Nat1024\00", align 1
@func428_str40 = private unnamed_addr constant [8 x i8] c"Numeric\00", align 1
@func430_str1 = private unnamed_addr constant [5 x i8] c"Int8\00", align 1
@func430_str2 = private unnamed_addr constant [6 x i8] c"Int16\00", align 1
@func430_str3 = private unnamed_addr constant [6 x i8] c"Int32\00", align 1
@func430_str4 = private unnamed_addr constant [6 x i8] c"Int64\00", align 1
@func430_str5 = private unnamed_addr constant [7 x i8] c"Int128\00", align 1
@func430_str6 = private unnamed_addr constant [7 x i8] c"Int256\00", align 1
@func430_str7 = private unnamed_addr constant [7 x i8] c"Int512\00", align 1
@func430_str8 = private unnamed_addr constant [8 x i8] c"Int1024\00", align 1
@func430_func431_str1 = private unnamed_addr constant [27 x i8] c"unsupported cfgIntegerSize\00", align 1
@func436_str1 = private unnamed_addr constant [21 x i8] c"value_new : v != nil\00", align 1
@func437_str1 = private unnamed_addr constant [21 x i8] c"value_new : v != nil\00", align 1
@func443_str1 = private unnamed_addr constant [20 x i8] c"do_value : v == nil\00", align 1
@func444_func445_str1 = private unnamed_addr constant [15 x i8] c"invalid lvalue\00", align 1
@func446_str1 = private unnamed_addr constant [19 x i8] c"do_value_forbidden\00", align 1
@func446_str2 = private unnamed_addr constant [6 x i8] c"stop.\00", align 1
@func447_func448_str1 = private unnamed_addr constant [31 x i8] c"expected value with union type\00", align 1
@func447_func448_str2 = private unnamed_addr constant [11 x i8] c"type error\00", align 1
@func447_str1 = private unnamed_addr constant [25 x i8] c"expected 'other' variant\00", align 1
@func450_str1 = private unnamed_addr constant [17 x i8] c"expected pointer\00", align 1
@func451_str1 = private unnamed_addr constant [18 x i8] c"binary type error\00", align 1
@func453_func454_str1 = private unnamed_addr constant [21 x i8] c"not enough arguments\00", align 1
@func453_func454_str2 = private unnamed_addr constant [16 x i8] c"excess argument\00", align 1
@func457_str1 = private unnamed_addr constant [16 x i8] c"undefined field\00", align 1
@func460_str1 = private unnamed_addr constant [16 x i8] c"type cast error\00", align 1
@func461_str1 = private unnamed_addr constant [16 x i8] c"type cast error\00", align 1
@func463_str1 = private unnamed_addr constant [16 x i8] c"type cast error\00", align 1
@func464_str1 = private unnamed_addr constant [16 x i8] c"type cast error\00", align 1
@func465_str1 = private unnamed_addr constant [16 x i8] c"type cast error\00", align 1
@func467_str1 = private unnamed_addr constant [16 x i8] c"type cast error\00", align 1
@func468_str1 = private unnamed_addr constant [16 x i8] c"type cast error\00", align 1
@func470_func471_str1 = private unnamed_addr constant [32 x i8] c"do_value_cast_gen_rec field=nil\00", align 1
@func473_str1 = private unnamed_addr constant [18 x i8] c"cast to same type\00", align 1
@func473_func474_str1 = private unnamed_addr constant [18 x i8] c"do_value_cast unk\00", align 1
@func475_str1 = private unnamed_addr constant [20 x i8] c"expected union type\00", align 1
@func475_str2 = private unnamed_addr constant [11 x i8] c"type error\00", align 1
@func476_str1 = private unnamed_addr constant [11 x i8] c"type error\00", align 1
@func477_str1 = private unnamed_addr constant [20 x i8] c"sizeof unknown type\00", align 1
@func478_str1 = private unnamed_addr constant [21 x i8] c"alignof unknown type\00", align 1
@func479_str1 = private unnamed_addr constant [16 x i8] c"unknown value7\0A\00", align 1
@func480_str1 = private unnamed_addr constant [2 x i8] c"0\00", align 1
@func480_str2 = private unnamed_addr constant [2 x i8] c"x\00", align 1
@func480_str3 = private unnamed_addr constant [5 x i8] c"%llx\00", align 1
@func480_str4 = private unnamed_addr constant [5 x i8] c"%lld\00", align 1
@func482_str1 = private unnamed_addr constant [5 x i8] c"func\00", align 1
@func482_str2 = private unnamed_addr constant [2 x i8] c"_\00", align 1
@func484_str1 = private unnamed_addr constant [15 x i8] c"do_value_array\00", align 1
@func492_str1 = private unnamed_addr constant [32 x i8] c"приведение юнион\00", align 1
@func492_str2 = private unnamed_addr constant [11 x i8] c"type error\00", align 1
@func497_str1 = private unnamed_addr constant [29 x i8] c"implicit_cast::v.type == nil\00", align 1
@func497_str2 = private unnamed_addr constant [24 x i8] c"implicit_cast::t == nil\00", align 1
@func497_str3 = private unnamed_addr constant [14 x i8] c"type overflow\00", align 1
@func505_str1 = private unnamed_addr constant [6 x i8] c"false\00", align 1
@func505_str2 = private unnamed_addr constant [5 x i8] c"true\00", align 1
@func505_str3 = private unnamed_addr constant [4 x i8] c"nil\00", align 1
@func505_str4 = private unnamed_addr constant [5 x i8] c"unit\00", align 1
@func506_str1 = private unnamed_addr constant [9 x i8] c"stmt_new\00", align 1
@func508_str1 = private unnamed_addr constant [13 x i8] c"invalid lval\00", align 1
@func516_str1 = private unnamed_addr constant [21 x i8] c"missing return value\00", align 1
@func518_str1 = private unnamed_addr constant [34 x i8] c"`break` outside any loop operator\00", align 1
@func519_str1 = private unnamed_addr constant [34 x i8] c"`break` outside any loop operator\00", align 1
@func523_str1 = private unnamed_addr constant [4 x i8] c"##\0A\00", align 1
@func523_str2 = private unnamed_addr constant [7 x i8] c"<name>\00", align 1
@func533_func541_str1 = private unnamed_addr constant [17 x i8] c"<undef-def-kind>\00", align 1
@func545_str1 = private unnamed_addr constant [3 x i8] c".m\00", align 1
@func545_str2 = private unnamed_addr constant [2 x i8] c"/\00", align 1
@func545_str3 = private unnamed_addr constant [3 x i8] c".m\00", align 1
@func545_str4 = private unnamed_addr constant [15 x i8] c"unknown import\00", align 1
@func546_str1 = private unnamed_addr constant [18 x i8] c"type redefination\00", align 1
@func548_str1 = private unnamed_addr constant [19 x i8] c"value redefination\00", align 1
@func548_str2 = private unnamed_addr constant [7 x i8] c"printf\00", align 1
@func548_str3 = private unnamed_addr constant [6 x i8] c"scanf\00", align 1
@func548_str4 = private unnamed_addr constant [7 x i8] c"sscanf\00", align 1
@func548_str5 = private unnamed_addr constant [8 x i8] c"sprintf\00", align 1
@func548_str6 = private unnamed_addr constant [8 x i8] c"fprintf\00", align 1
@func549_func550_str1 = private unnamed_addr constant [15 x i8] c"undefined type\00", align 1
@func556_str1 = private unnamed_addr constant [11 x i8] c"m2 v%d.%d\0A\00", align 1
@func556_str2 = private unnamed_addr constant [7 x i8] c"main.m\00", align 1
@func556_str3 = private unnamed_addr constant [11 x i8] c"lines: %d\0A\00", align 1
@func556_str4 = private unnamed_addr constant [7 x i8] c"out.ll\00", align 1

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
@unsafe = global i1 0
@ctype = global %Type* zeroinitializer
@fctx = global %FuncContext* zeroinitializer
@asm0 = global %Assembly zeroinitializer
@unions = global %List zeroinitializer
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
@spec_type_uid = global %Nat32 0
@union_id = global %Nat32 0
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
;stmt1:; loadImmPtr
  %5 = inttoptr i64 0 to%Node*
  %6 = icmp ne %Node* %4, %5
  br i1 %6, label %then_0, label %else_0
then_0:
;stmt2:
  %7 = getelementptr inbounds %Node, %Node* %1, i1 0, i32 1
  store %Node* %4, %Node** %7, align 8
;stmt3:
  %8 = getelementptr inbounds %Node, %Node* %4, i1 0, i32 0
  store %Node* %1, %Node** %8, align 8
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt4:
  %9 = getelementptr inbounds %Node, %Node* %0, i1 0, i32 1
  store %Node* %1, %Node** %9, align 8
;stmt5:
  %10 = getelementptr inbounds %Node, %Node* %1, i1 0, i32 0
  store %Node* %0, %Node** %10, align 8
  ret void
}

define %Node* @node_get (%Node*, %Nat32) {
;stmt0:
  %3 = alloca %Nat32
  store %Nat32 0, %Nat32* %3, align 4
;stmt1:; loadImmPtr
  %4 = inttoptr i64 0 to%Node*
  %5 = icmp eq %Node* %0, %4
  br i1 %5, label %then_0, label %else_0
then_0:
;stmt2:; loadImmPtr
  %6 = inttoptr i64 0 to%Node*
  ret %Node* %6
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt3:
  %8 = alloca %Node*
  store %Node* %0, %Node** %8, align 8
;stmt4:
  br label %continue_0
continue_0:
  %9 = load %Nat32, %Nat32* %3
  %10 = icmp ult %Nat32 %9, %1
  br i1 %10, label %body_0, label %break_0
body_0:
;stmt5:
  %11 = load %Node*, %Node** %8
  %12 = getelementptr inbounds %Node, %Node* %11, i1 0, i32 1
  %13 = load %Node*, %Node** %12; loadImmPtr
  %14 = inttoptr i64 0 to%Node*
  %15 = icmp eq %Node* %13, %14
  br i1 %15, label %then_1, label %else_1
then_1:
;stmt6:; loadImmPtr
  %16 = inttoptr i64 0 to%Node*
  ret %Node* %16
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt7:
  %18 = load %Node*, %Node** %8
  %19 = getelementptr inbounds %Node, %Node* %18, i1 0, i32 1
  %20 = load %Node*, %Node** %19
  store %Node* %20, %Node** %8, align 8
;stmt8:
  %21 = load %Nat32, %Nat32* %3
  %22 = add %Nat32 %21, 1
  store %Nat32 %22, %Nat32* %3, align 4
  br label %continue_0
break_0:
;stmt9:
  %23 = load %Node*, %Node** %8
  ret %Node* %23
}

define void @node_exclude (%Node*) {
;stmt0:
  %2 = getelementptr inbounds %Node, %Node* %0, i1 0, i32 0
  %3 = load %Node*, %Node** %2
;stmt1:
  %4 = getelementptr inbounds %Node, %Node* %0, i1 0, i32 1
  %5 = load %Node*, %Node** %4
;stmt2:; loadImmPtr
  %6 = inttoptr i64 0 to%Node*
  %7 = icmp ne %Node* %3, %6
  br i1 %7, label %then_0, label %else_0
then_0:
;stmt3:
  %8 = getelementptr inbounds %Node, %Node* %3, i1 0, i32 1
  store %Node* %5, %Node** %8, align 8
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt4:; loadImmPtr
  %9 = inttoptr i64 0 to%Node*
  %10 = icmp ne %Node* %5, %9
  br i1 %10, label %then_1, label %else_1
then_1:
;stmt5:
  %11 = getelementptr inbounds %Node, %Node* %5, i1 0, i32 0
  store %Node* %3, %Node** %11, align 8
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  ret void
}

define void @node_foreach (%Node*, %NodeForeachHandler, %Unit*) {
;stmt0:; loadImmPtr
  %4 = inttoptr i64 0 to%Node*
  %5 = icmp eq %Node* %0, %4
  br i1 %5, label %then_0, label %else_0
then_0:
;stmt1:
ret void
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt2:
  %7 = alloca %Node*
  store %Node* %0, %Node** %7, align 8
;stmt3:
  %8 = alloca %Nat32
  store %Nat32 0, %Nat32* %8, align 4
;stmt4:
  br label %continue_0
continue_0:
  %9 = load %Node*, %Node** %7; loadImmPtr
  %10 = inttoptr i64 0 to%Node*
  %11 = icmp ne %Node* %9, %10
  br i1 %11, label %body_0, label %break_0
body_0:
;stmt5:
  %12 = load %Node*, %Node** %7
  %13 = load %Nat32, %Nat32* %8
  call void (%Node*, %Unit*, %Nat32) %1 (%Node* %12, %Unit* %2, %Nat32 %13)
;stmt6:
  %14 = load %Node*, %Node** %7
  %15 = getelementptr inbounds %Node, %Node* %14, i1 0, i32 1
  %16 = load %Node*, %Node** %15
  store %Node* %16, %Node** %7, align 8
;stmt7:
  %17 = load %Nat32, %Nat32* %8
  %18 = add %Nat32 %17, 1
  store %Nat32 %18, %Nat32* %8, align 4
  br label %continue_0
break_0:
  ret void
}

define %Node* @node_search (%Node*, %NodeSearchHandler, %Unit*) {
;stmt0:; loadImmPtr
  %4 = inttoptr i64 0 to%Node*
  %5 = icmp eq %Node* %0, %4
  br i1 %5, label %then_0, label %else_0
then_0:
;stmt1:; loadImmPtr
  %6 = inttoptr i64 0 to%Node*
  ret %Node* %6
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt2:
  %8 = alloca %Node*
  store %Node* %0, %Node** %8, align 8
;stmt3:
  %9 = alloca %Nat32
  store %Nat32 0, %Nat32* %9, align 4
;stmt4:
  br label %continue_0
continue_0:
  %10 = load %Node*, %Node** %8; loadImmPtr
  %11 = inttoptr i64 0 to%Node*
  %12 = icmp ne %Node* %10, %11
  br i1 %12, label %body_0, label %break_0
body_0:
;stmt5:
  %13 = load %Node*, %Node** %8
  %14 = load %Nat32, %Nat32* %9
  %15 = call i1 (%Node*, %Unit*, %Nat32) %1 (%Node* %13, %Unit* %2, %Nat32 %14)
  br i1 %15, label %then_1, label %else_1
then_1:
;stmt6:
  %16 = load %Node*, %Node** %8
  ret %Node* %16
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt7:
  %18 = load %Node*, %Node** %8
  %19 = getelementptr inbounds %Node, %Node* %18, i1 0, i32 1
  %20 = load %Node*, %Node** %19
  store %Node* %20, %Node** %8, align 8
;stmt8:
  %21 = load %Nat32, %Nat32* %9
  %22 = add %Nat32 %21, 1
  store %Nat32 %22, %Nat32* %9, align 4
  br label %continue_0
break_0:
;stmt9:; loadImmPtr
  %23 = inttoptr i64 0 to%Node*
  ret %Node* %23
}

define i1 @func51 (%Node*, %Unit*, %Nat32) {
;stmt0:
  %4 = getelementptr inbounds %Node, %Node* %0, i1 0, i32 3
  %5 = load %Unit*, %Unit** %4
  %6 = icmp eq %Unit* %5, %1
  ret i1 %6
}

define %Node* @node_search_by_data (%Node*, %Unit*) {
;stmt0:
  %3 = call %Node* (%Node*, %NodeSearchHandler, %Unit*) @node_search (%Node* %0, %NodeSearchHandler @func51, %Unit* %1)
  ret %Node* %3
}

define void @map_init (%List*) {
;stmt0:
  %2 = bitcast %List* %0 to %Unit*
  %3 = call %Unit* (%Unit*, %Nat8, %Nat32) @memset (%Unit* %2, %Nat8 0, %Nat32 32)
  ret void
}

define %List* @map_new () {
;stmt0:
  %1 = call %Unit* (%Nat32) @malloc (%Nat32 32)
  %2 = bitcast %Unit* %1 to %List*
;stmt1:
  call void (%List*) @map_init (%List* %2)
;stmt2:
  ret %List* %2
}

define %List* @list_new_extra (%Nat32) {
;stmt0:
  %2 = call %List* () @map_new ()
;stmt1:
  %3 = getelementptr inbounds %List, %List* %2, i1 0, i32 3
  store %Nat32 %0, %Nat32* %3, align 4
;stmt2:
  ret %List* %2
}

define i1 @list_append_node (%List*, %Node*) {
;stmt0:; loadImmPtr
  %3 = inttoptr i64 0 to%List*
  %4 = icmp eq %List* %0, %3; loadImmPtr
  %5 = inttoptr i64 0 to%Node*
  %6 = icmp eq %Node* %1, %5
  %7 = or i1 %4, %6
  br i1 %7, label %then_0, label %else_0
then_0:
;stmt1:
  ret i1 0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt2:
  %9 = getelementptr inbounds %List, %List* %0, i1 0, i32 0
  %10 = load %Node*, %Node** %9; loadImmPtr
  %11 = inttoptr i64 0 to%Node*
  %12 = icmp eq %Node* %10, %11
  br i1 %12, label %then_1, label %else_1
then_1:
;stmt3:
  %13 = getelementptr inbounds %List, %List* %0, i1 0, i32 0
  store %Node* %1, %Node** %13, align 8
  br label %endif_1
else_1:
;stmt4:
  %14 = getelementptr inbounds %List, %List* %0, i1 0, i32 1
  %15 = load %Node*, %Node** %14
  call void (%Node*, %Node*) @node_append (%Node* %15, %Node* %1)
  br label %endif_1
endif_1:
;stmt5:
  %16 = getelementptr inbounds %List, %List* %0, i1 0, i32 1
  store %Node* %1, %Node** %16, align 8
;stmt6:
  %17 = getelementptr inbounds %List, %List* %0, i1 0, i32 2
  %18 = getelementptr inbounds %List, %List* %0, i1 0, i32 2
  %19 = load %Nat64, %Nat64* %18
  %20 = add %Nat64 %19, 1
  store %Nat64 %20, %Nat64* %17, align 8
;stmt7:
  ret i1 1
}

define %Unit* @list_get (%List*, %Nat32) {
;stmt0:
  %3 = getelementptr inbounds %List, %List* %0, i1 0, i32 0
  %4 = load %Node*, %Node** %3
  %5 = call %Node* (%Node*, %Nat32) @node_get (%Node* %4, %Nat32 %1)
;stmt1:; loadImmPtr
  %6 = inttoptr i64 0 to%Node*
  %7 = icmp eq %Node* %5, %6
  br i1 %7, label %then_0, label %else_0
then_0:
;stmt2:; loadImmPtr
  %8 = inttoptr i64 0 to%Unit*
  ret %Unit* %8
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt3:
  %10 = getelementptr inbounds %Node, %Node* %5, i1 0, i32 3
  %11 = load %Unit*, %Unit** %10
  ret %Unit* %11
}

define i1 @list_append (%List*, %Unit*) {
;stmt0:; loadImmPtr
  %3 = inttoptr i64 0 to%List*
  %4 = icmp eq %List* %0, %3; loadImmPtr
  %5 = inttoptr i64 0 to%Unit*
  %6 = icmp eq %Unit* %1, %5
  %7 = or i1 %4, %6
  br i1 %7, label %then_0, label %else_0
then_0:
;stmt1:
  ret i1 0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt2:
  %9 = getelementptr inbounds %List, %List* %0, i1 0, i32 3
  %10 = load %Nat32, %Nat32* %9
  %11 = call %Node* (%Nat32) @node_new (%Nat32 %10)
;stmt3:
  %12 = getelementptr inbounds %Node, %Node* %11, i1 0, i32 3
  store %Unit* %1, %Unit** %12, align 8
;stmt4:
  %13 = call i1 (%List*, %Node*) @list_append_node (%List* %0, %Node* %11)
  ret i1 %13
}

define %Unit* @list_append_extra (%List*, %Nat32) {
;stmt0:; loadImmPtr
  %3 = inttoptr i64 0 to%List*
  %4 = icmp eq %List* %0, %3
  br i1 %4, label %then_0, label %else_0
then_0:
;stmt1:; loadImmPtr
  %5 = inttoptr i64 0 to%Unit*
  ret %Unit* %5
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt2:
  %7 = call %Node* (%Nat32) @node_new (%Nat32 %1)
;stmt3:
  %8 = ptrtoint %Node* %7 to %Nat32
  %9 = add %Nat32 %8, 32
  %10 = inttoptr %Nat32 %9 to %Unit*
;stmt4:
  %11 = getelementptr inbounds %Node, %Node* %7, i1 0, i32 3
  store %Unit* %10, %Unit** %11, align 8
;stmt5:
  %12 = getelementptr inbounds %List, %List* %0, i1 0, i32 0
  %13 = load %Node*, %Node** %12; loadImmPtr
  %14 = inttoptr i64 0 to%Node*
  %15 = icmp eq %Node* %13, %14
  br i1 %15, label %then_1, label %else_1
then_1:
;stmt6:
  %16 = getelementptr inbounds %List, %List* %0, i1 0, i32 0
  store %Node* %7, %Node** %16, align 8
  br label %endif_1
else_1:
;stmt7:
  %17 = getelementptr inbounds %List, %List* %0, i1 0, i32 1
  %18 = load %Node*, %Node** %17
  call void (%Node*, %Node*) @node_append (%Node* %18, %Node* %7)
  br label %endif_1
endif_1:
;stmt8:
  %19 = getelementptr inbounds %List, %List* %0, i1 0, i32 1
  store %Node* %7, %Node** %19, align 8
;stmt9:
  %20 = getelementptr inbounds %List, %List* %0, i1 0, i32 2
  %21 = getelementptr inbounds %List, %List* %0, i1 0, i32 2
  %22 = load %Nat64, %Nat64* %21
  %23 = add %Nat64 %22, 1
  store %Nat64 %23, %Nat64* %20, align 8
;stmt10:
  ret %Unit* %10
}

define void @func60 (%Unit*, %Unit*, %Nat32, %Node*) {
;stmt0:
  %5 = bitcast %Unit* %1 to %List*
;stmt1:
  %6 = call i1 (%List*, %Unit*) @list_append (%List* %5, %Unit* %0)
  ret void
}

define i1 @list_extend (%List*, %List*) {
;stmt0:; loadImmPtr
  %3 = inttoptr i64 0 to%List*
  %4 = icmp eq %List* %0, %3; loadImmPtr
  %5 = inttoptr i64 0 to%List*
  %6 = icmp eq %List* %1, %5
  %7 = or i1 %4, %6
  br i1 %7, label %then_0, label %else_0
then_0:
;stmt1:
  ret i1 0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt2:
  %9 = bitcast %List* %0 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @func64 (%List* %1, %ListForeachHandler @func60, %Unit* %9)
;stmt3:
  ret i1 1
}

define i1 @list_subst (%List*, %Unit*, %Unit*) {
;stmt0:
  %4 = getelementptr inbounds %List, %List* %0, i1 0, i32 0
  %5 = load %Node*, %Node** %4
  %6 = call %Node* (%Node*, %Unit*) @node_search_by_data (%Node* %5, %Unit* %1)
;stmt1:; loadImmPtr
  %7 = inttoptr i64 0 to%Node*
  %8 = icmp eq %Node* %6, %7
  br i1 %8, label %then_0, label %else_0
then_0:
;stmt2:
  ret i1 0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt3:
  %10 = getelementptr inbounds %Node, %Node* %6, i1 0, i32 3
  store %Unit* %2, %Unit** %10, align 8
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
;stmt1:; loadImmPtr
  %6 = inttoptr i64 0 to%Node*
  %7 = icmp ne %Node* %5, %6
;stmt2:
  br i1 %7, label %then_0, label %else_0
then_0:
;stmt3:
  call void (%List*, %Node*) @list_node_remove (%List* %0, %Node* %5)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt4:
  ret i1 %7
}

define void @func64 (%List*, %ListForeachHandler, %Unit*) {
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
  %8 = load %Node*, %Node** %5; loadImmPtr
  %9 = inttoptr i64 0 to%Node*
  %10 = icmp ne %Node* %8, %9
  br i1 %10, label %body_0, label %break_0
body_0:
;stmt3:
  %11 = load %Node*, %Node** %5
  %12 = getelementptr inbounds %Node, %Node* %11, i1 0, i32 3
  %13 = load %Unit*, %Unit** %12
  %14 = load %Nat32, %Nat32* %4
  %15 = load %Node*, %Node** %5
  call void (%Unit*, %Unit*, %Nat32, %Node*) %1 (%Unit* %13, %Unit* %2, %Nat32 %14, %Node* %15)
;stmt4:
  %16 = load %Node*, %Node** %5
  %17 = getelementptr inbounds %Node, %Node* %16, i1 0, i32 1
  %18 = load %Node*, %Node** %17
  store %Node* %18, %Node** %5, align 8
;stmt5:
  %19 = load %Nat32, %Nat32* %4
  %20 = add %Nat32 %19, 1
  store %Nat32 %20, %Nat32* %4, align 4
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
  %12 = load %Node*, %Node** %5; loadImmPtr
  %13 = inttoptr i64 0 to%Node*
  %14 = icmp ne %Node* %12, %13
  %15 = load %Node*, %Node** %8; loadImmPtr
  %16 = inttoptr i64 0 to%Node*
  %17 = icmp ne %Node* %15, %16
  %18 = and i1 %14, %17
  br i1 %18, label %body_0, label %break_0
body_0:
;stmt4:
  %19 = load %Node*, %Node** %5
  %20 = getelementptr inbounds %Node, %Node* %19, i1 0, i32 3
  %21 = load %Unit*, %Unit** %20
  %22 = load %Node*, %Node** %8
  %23 = getelementptr inbounds %Node, %Node* %22, i1 0, i32 3
  %24 = load %Unit*, %Unit** %23
  %25 = load %Nat32, %Nat32* %11
  call void (%Unit*, %Unit*, %Unit*, %Nat32) %2 (%Unit* %21, %Unit* %24, %Unit* %3, %Nat32 %25)
;stmt5:
  %26 = load %Node*, %Node** %5
  %27 = getelementptr inbounds %Node, %Node* %26, i1 0, i32 1
  %28 = load %Node*, %Node** %27
  store %Node* %28, %Node** %5, align 8
;stmt6:
  %29 = load %Node*, %Node** %8
  %30 = getelementptr inbounds %Node, %Node* %29, i1 0, i32 1
  %31 = load %Node*, %Node** %30
  store %Node* %31, %Node** %8, align 8
;stmt7:
  %32 = load %Nat32, %Nat32* %11
  %33 = add %Nat32 %32, 1
  store %Nat32 %33, %Nat32* %11, align 4
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
  %12 = load %Node*, %Node** %5; loadImmPtr
  %13 = inttoptr i64 0 to%Node*
  %14 = icmp ne %Node* %12, %13
  %15 = load %Node*, %Node** %8; loadImmPtr
  %16 = inttoptr i64 0 to%Node*
  %17 = icmp ne %Node* %15, %16
  %18 = or i1 %14, %17
  br i1 %18, label %body_0, label %break_0
body_0:
;stmt4:
  %19 = load %Node*, %Node** %5
  br label %select_1_0
select_1_0:; loadImmPtr
  %20 = inttoptr i64 0 to%Node*
  %21 = icmp eq %Node* %19, %20
  br i1 %21, label %select_1_0_ok, label %select_1_1
select_1_0_ok:; loadImmPtr
  %22 = inttoptr i64 0 to%Unit*
  br label %select_1_end
select_1_1:
  %23 = load %Node*, %Node** %5
  %24 = getelementptr inbounds %Node, %Node* %23, i1 0, i32 3
  %25 = load %Unit*, %Unit** %24
  br label %select_1_end
select_1_end:
  %26 = phi %Unit* [ %22, %select_1_0_ok ], [ %25, %select_1_1 ]
;stmt5:
  %27 = load %Node*, %Node** %8
  br label %select_2_0
select_2_0:; loadImmPtr
  %28 = inttoptr i64 0 to%Node*
  %29 = icmp eq %Node* %27, %28
  br i1 %29, label %select_2_0_ok, label %select_2_1
select_2_0_ok:; loadImmPtr
  %30 = inttoptr i64 0 to%Unit*
  br label %select_2_end
select_2_1:
  %31 = load %Node*, %Node** %8
  %32 = getelementptr inbounds %Node, %Node* %31, i1 0, i32 3
  %33 = load %Unit*, %Unit** %32
  br label %select_2_end
select_2_end:
  %34 = phi %Unit* [ %30, %select_2_0_ok ], [ %33, %select_2_1 ]
;stmt6:
  %35 = load %Nat32, %Nat32* %11
  %36 = call i1 (%Unit*, %Unit*, %Unit*, %Nat32) %2 (%Unit* %26, %Unit* %34, %Unit* %3, %Nat32 %35)
  %37 = xor i1 %36, 1
  br i1 %37, label %then_0, label %else_0
then_0:
;stmt7:
  br label %break_0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt8:
  %39 = load %Node*, %Node** %5; loadImmPtr
  %40 = inttoptr i64 0 to%Node*
  %41 = icmp ne %Node* %39, %40
  br i1 %41, label %then_1, label %else_1
then_1:
;stmt9:
  %42 = load %Node*, %Node** %5
  %43 = getelementptr inbounds %Node, %Node* %42, i1 0, i32 1
  %44 = load %Node*, %Node** %43
  store %Node* %44, %Node** %5, align 8
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt10:
  %45 = load %Node*, %Node** %8; loadImmPtr
  %46 = inttoptr i64 0 to%Node*
  %47 = icmp ne %Node* %45, %46
  br i1 %47, label %then_2, label %else_2
then_2:
;stmt11:
  %48 = load %Node*, %Node** %8
  %49 = getelementptr inbounds %Node, %Node* %48, i1 0, i32 1
  %50 = load %Node*, %Node** %49
  store %Node* %50, %Node** %8, align 8
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
;stmt12:
  %51 = load %Nat32, %Nat32* %11
  %52 = add %Nat32 %51, 1
  store %Nat32 %52, %Nat32* %11, align 4
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
  %18 = load %Node*, %Node** %11; loadImmPtr
  %19 = inttoptr i64 0 to%Node*
  %20 = icmp ne %Node* %18, %19
  %21 = load %Node*, %Node** %14; loadImmPtr
  %22 = inttoptr i64 0 to%Node*
  %23 = icmp ne %Node* %21, %22
  %24 = and i1 %20, %23
  br i1 %24, label %body_0, label %break_0
body_0:
;stmt6:
  %25 = load %Node*, %Node** %11
  %26 = getelementptr inbounds %Node, %Node* %25, i1 0, i32 3
  %27 = load %Unit*, %Unit** %26
  %28 = load %Node*, %Node** %14
  %29 = getelementptr inbounds %Node, %Node* %28, i1 0, i32 3
  %30 = load %Unit*, %Unit** %29
  %31 = load %Nat32, %Nat32* %17
  %32 = call i1 (%Unit*, %Unit*, %Unit*, %Nat32) %2 (%Unit* %27, %Unit* %30, %Unit* %3, %Nat32 %31)
  %33 = xor i1 %32, 1
  br i1 %33, label %then_1, label %else_1
then_1:
;stmt7:
  ret i1 0
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt8:
  %35 = load %Node*, %Node** %11
  %36 = getelementptr inbounds %Node, %Node* %35, i1 0, i32 1
  %37 = load %Node*, %Node** %36
  store %Node* %37, %Node** %11, align 8
;stmt9:
  %38 = load %Node*, %Node** %14
  %39 = getelementptr inbounds %Node, %Node* %38, i1 0, i32 1
  %40 = load %Node*, %Node** %39
  store %Node* %40, %Node** %14, align 8
;stmt10:
  %41 = load %Nat32, %Nat32* %17
  %42 = add %Nat32 %41, 1
  store %Nat32 %42, %Nat32* %17, align 4
  br label %continue_0
break_0:
;stmt11:
  ret i1 1
}

define %Unit* @list_search (%List*, %ListSearchHandler, %Unit*) {
;stmt0:; loadImmPtr
  %4 = inttoptr i64 0 to%List*
  %5 = icmp eq %List* %0, %4
  br i1 %5, label %then_0, label %else_0
then_0:
;stmt1:; loadImmPtr
  %6 = inttoptr i64 0 to%Unit*
  ret %Unit* %6
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt2:
  %8 = alloca %Node*
  %9 = getelementptr inbounds %List, %List* %0, i1 0, i32 0
  %10 = load %Node*, %Node** %9
  store %Node* %10, %Node** %8, align 8
;stmt3:
  %11 = alloca %Nat32
  store %Nat32 0, %Nat32* %11, align 4
;stmt4:
  br label %continue_0
continue_0:
  %12 = load %Node*, %Node** %8; loadImmPtr
  %13 = inttoptr i64 0 to%Node*
  %14 = icmp ne %Node* %12, %13
  br i1 %14, label %body_0, label %break_0
body_0:
;stmt5:
  %15 = load %Node*, %Node** %8
  %16 = getelementptr inbounds %Node, %Node* %15, i1 0, i32 3
  %17 = load %Unit*, %Unit** %16
  %18 = load %Nat32, %Nat32* %11
  %19 = call i1 (%Unit*, %Unit*, %Nat32) %1 (%Unit* %17, %Unit* %2, %Nat32 %18)
  br i1 %19, label %then_1, label %else_1
then_1:
;stmt6:
  %20 = load %Node*, %Node** %8
  %21 = getelementptr inbounds %Node, %Node* %20, i1 0, i32 3
  %22 = load %Unit*, %Unit** %21
  ret %Unit* %22
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt7:
  %24 = load %Node*, %Node** %8
  %25 = getelementptr inbounds %Node, %Node* %24, i1 0, i32 1
  %26 = load %Node*, %Node** %25
  store %Node* %26, %Node** %8, align 8
;stmt8:
  %27 = load %Nat32, %Nat32* %11
  %28 = add %Nat32 %27, 1
  store %Nat32 %28, %Nat32* %11, align 4
  br label %continue_0
break_0:
;stmt9:; loadImmPtr
  %29 = inttoptr i64 0 to%Unit*
  ret %Unit* %29
}

define %List* @list_map (%List*, %ListMapHandler, %Unit*) {
;stmt0:; loadImmPtr
  %4 = inttoptr i64 0 to%List*
  %5 = icmp eq %List* %0, %4
  br i1 %5, label %then_0, label %else_0
then_0:
;stmt1:; loadImmPtr
  %6 = inttoptr i64 0 to%List*
  ret %List* %6
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt2:
  %8 = alloca %Nat32
  store %Nat32 0, %Nat32* %8, align 4
;stmt3:
  %9 = alloca %Node*
  %10 = getelementptr inbounds %List, %List* %0, i1 0, i32 0
  %11 = load %Node*, %Node** %10
  store %Node* %11, %Node** %9, align 8
;stmt4:
  %12 = call %List* () @map_new ()
;stmt5:
  br label %continue_0
continue_0:
  %13 = load %Node*, %Node** %9; loadImmPtr
  %14 = inttoptr i64 0 to%Node*
  %15 = icmp ne %Node* %13, %14
  br i1 %15, label %body_0, label %break_0
body_0:
;stmt6:
  %16 = load %Node*, %Node** %9
  %17 = getelementptr inbounds %Node, %Node* %16, i1 0, i32 3
  %18 = load %Unit*, %Unit** %17
  %19 = load %Nat32, %Nat32* %8
  %20 = call %Unit* (%Unit*, %Unit*, %Nat32) %1 (%Unit* %18, %Unit* %2, %Nat32 %19)
;stmt7:; loadImmPtr
  %21 = inttoptr i64 0 to%Unit*
  %22 = icmp ne %Unit* %20, %21
  br i1 %22, label %then_1, label %else_1
then_1:
;stmt8:
  %23 = call i1 (%List*, %Unit*) @list_append (%List* %12, %Unit* %20)
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt9:
  %24 = load %Nat32, %Nat32* %8
  %25 = add %Nat32 %24, 1
  store %Nat32 %25, %Nat32* %8, align 4
;stmt10:
  %26 = load %Node*, %Node** %9
  %27 = getelementptr inbounds %Node, %Node* %26, i1 0, i32 1
  %28 = load %Node*, %Node** %27
  store %Node* %28, %Node** %9, align 8
  br label %continue_0
break_0:
;stmt11:
  ret %List* %12
}

define i1 @map_append (%List*, %Str, %Unit*) {
;stmt0:; loadImmPtr
  %4 = inttoptr i64 0 to%List*
  %5 = icmp eq %List* %0, %4; loadImmPtr
  %6 = inttoptr i64 0 to%Str
  %7 = icmp eq %Str %1, %6; loadImmPtr
  %8 = inttoptr i64 0 to%Unit*
  %9 = icmp eq %Unit* %2, %8
  %10 = or i1 %7, %9
  %11 = or i1 %5, %10
  br i1 %11, label %then_0, label %else_0
then_0:
;stmt1:
  ret i1 0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt2:
  %13 = call %Node* (%Nat32) @node_new (%Nat32 0)
;stmt3:
  %14 = getelementptr inbounds %Node, %Node* %13, i1 0, i32 2
  %15 = bitcast %Str %1 to %Unit*
  store %Unit* %15, %Unit** %14, align 8
;stmt4:
  %16 = getelementptr inbounds %Node, %Node* %13, i1 0, i32 3
  store %Unit* %2, %Unit** %16, align 8
;stmt5:
  %17 = getelementptr inbounds %List, %List* %0, i1 0, i32 0
  %18 = load %Node*, %Node** %17; loadImmPtr
  %19 = inttoptr i64 0 to%Node*
  %20 = icmp eq %Node* %18, %19
  br i1 %20, label %then_1, label %else_1
then_1:
;stmt6:
  %21 = getelementptr inbounds %List, %List* %0, i1 0, i32 0
  store %Node* %13, %Node** %21, align 8
  br label %endif_1
else_1:
;stmt7:
  %22 = getelementptr inbounds %List, %List* %0, i1 0, i32 1
  %23 = load %Node*, %Node** %22
  call void (%Node*, %Node*) @node_append (%Node* %23, %Node* %13)
  br label %endif_1
endif_1:
;stmt8:
  %24 = getelementptr inbounds %List, %List* %0, i1 0, i32 1
  store %Node* %13, %Node** %24, align 8
;stmt9:
  %25 = getelementptr inbounds %List, %List* %0, i1 0, i32 2
  %26 = getelementptr inbounds %List, %List* %0, i1 0, i32 2
  %27 = load %Nat64, %Nat64* %26
  %28 = add %Nat64 %27, 1
  store %Nat64 %28, %Nat64* %25, align 8
;stmt10:
  ret i1 1
}

define i1 @func72 (%Node*, %Unit*, %Nat32) {
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
  %6 = call %Node* (%Node*, %NodeSearchHandler, %Unit*) @node_search (%Node* %4, %NodeSearchHandler @func72, %Unit* %5)
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
;stmt1:; loadImmPtr
  %4 = inttoptr i64 0 to%Node*
  %5 = icmp eq %Node* %3, %4
  br i1 %5, label %then_0, label %else_0
then_0:
;stmt2:; loadImmPtr
  %6 = inttoptr i64 0 to%Unit*
  ret %Unit* %6
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt3:
  %8 = getelementptr inbounds %Node, %Node* %3, i1 0, i32 3
  %9 = load %Unit*, %Unit** %8
;stmt4:
  call void (%List*, %Node*) @list_node_remove (%List* %0, %Node* %3)
;stmt5:
  ret %Unit* %9
}

define %Unit* @map_get (%List*, %Str) {
;stmt0:
  %3 = call %Node* (%List*, %Str) @map_list_node_get (%List* %0, %Str %1)
;stmt1:; loadImmPtr
  %4 = inttoptr i64 0 to%Node*
  %5 = icmp ne %Node* %3, %4
  br i1 %5, label %then_0, label %else_0
then_0:
;stmt2:
  %6 = getelementptr inbounds %Node, %Node* %3, i1 0, i32 3
  %7 = load %Unit*, %Unit** %6
  ret %Unit* %7
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt3:; loadImmPtr
  %9 = inttoptr i64 0 to%Unit*
  ret %Unit* %9
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
  %7 = load %Node*, %Node** %4; loadImmPtr
  %8 = inttoptr i64 0 to%Node*
  %9 = icmp ne %Node* %7, %8
  br i1 %9, label %body_0, label %break_0
body_0:
;stmt2:
  %10 = load %Node*, %Node** %4
  %11 = getelementptr inbounds %Node, %Node* %10, i1 0, i32 2
  %12 = load %Unit*, %Unit** %11
  %13 = load %Node*, %Node** %4
  %14 = getelementptr inbounds %Node, %Node* %13, i1 0, i32 3
  %15 = load %Unit*, %Unit** %14
  call void (%Unit*, %Unit*, %Unit*) %1 (%Unit* %12, %Unit* %15, %Unit* %2)
;stmt3:
  %16 = load %Node*, %Node** %4
  %17 = getelementptr inbounds %Node, %Node* %16, i1 0, i32 1
  %18 = load %Node*, %Node** %17
  store %Node* %18, %Node** %4, align 8
  br label %continue_0
break_0:
  ret void
}

define void @func78 (%Unit*, %Unit*, %Unit*) {
;stmt0:
  %4 = bitcast %Unit* %2 to %List*
;stmt1:
  %5 = bitcast %Unit* %0 to %Str
  %6 = call i1 (%List*, %Str, %Unit*) @map_append (%List* %4, %Str %5, %Unit* %1)
  ret void
}

define i1 @map_extend (%List*, %List*) {
;stmt0:; loadImmPtr
  %3 = inttoptr i64 0 to%List*
  %4 = icmp eq %List* %0, %3; loadImmPtr
  %5 = inttoptr i64 0 to%List*
  %6 = icmp eq %List* %1, %5
  %7 = or i1 %4, %6
  br i1 %7, label %then_0, label %else_0
then_0:
;stmt1:
  ret i1 0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt2:
  %9 = bitcast %List* %0 to %Unit*
  call void (%List*, %MapForeachHandler, %Unit*) @map_foreach (%List* %1, %MapForeachHandler @func78, %Unit* %9)
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
;stmt1:; loadImmPtr
  %3 = inttoptr i64 0 to%DIR*
  %4 = icmp eq %DIR* %2, %3
  br i1 %4, label %then_0, label %else_0
then_0:
;stmt2:
  ret i1 0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt3:
  %6 = call %Int32 (%DIR*) @closedir (%DIR* %2)
;stmt4:
  ret i1 1
}

define void @func81 (%Type*) {
;stmt0:; loadImmPtr
  %2 = inttoptr i64 0 to%Type*
  call void (%Type*, %Type*) @func82 (%Type* %0, %Type* %2)
  ret void
}

define void @func82 (%Type*, %Type*) {
;stmt0:; loadImmPtr
  %3 = inttoptr i64 0 to%Type*
  %4 = icmp eq %Type* %0, %3
  br i1 %4, label %then_0, label %else_0
then_0:
;stmt1:
  %5 = bitcast [6 x %Nat8]* @func82_str1 to %Str
  %6 = call %Int32 (%Str, ...) @printf (%Str %5)
;stmt2:
ret void
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt3:
  %8 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 2
  %9 = load %Str, %Str* %8; loadImmPtr
  %10 = inttoptr i64 0 to%Str
  %11 = icmp ne %Str %9, %10
  br i1 %11, label %then_1, label %else_1
then_1:
;stmt4:
  %12 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 0
  %13 = load %TypeKind, %TypeKind* %12
  %14 = icmp ne %TypeKind %13, 14
  br i1 %14, label %then_2, label %else_2
then_2:
;stmt5:
  %15 = bitcast [3 x %Nat8]* @func82_str2 to %Str
  %16 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 2
  %17 = load %Str, %Str* %16
  %18 = call %Int32 (%Str, ...) @printf (%Str %15, %Str %17)
;stmt6:
ret void
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt7:
  %20 = icmp eq %Type* %0, %1
  br i1 %20, label %then_3, label %else_3
then_3:
;stmt8:
  %21 = bitcast [5 x %Nat8]* @func82_str3 to %Str
  %22 = call %Int32 (%Str, ...) @printf (%Str %21)
;stmt9:
ret void
  br label %endif_3
else_3:
  br label %endif_3
endif_3:
;stmt10:
  %24 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 0
  %25 = load %TypeKind, %TypeKind* %24
  br label %select_1_0
select_1_0:
  %26 = icmp eq %TypeKind %25, 5
  br i1 %26, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %27 = bitcast [14 x %Nat8]* @func82_str4 to %Str
  %28 = call %Int32 (%Str, ...) @printf (%Str %27)
  br label %select_1_end
select_1_1:
  %29 = icmp eq %TypeKind %25, 6
  br i1 %29, label %select_1_1_ok, label %select_1_2
select_1_1_ok:
  %30 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 12
  call void (%TypeVar*) @func83 (%TypeVar* %30)
  br label %select_1_end
select_1_2:
  %31 = icmp eq %TypeKind %25, 11
  br i1 %31, label %select_1_2_ok, label %select_1_3
select_1_2_ok:
  %32 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 7
  call void (%TypePointer*, %Type*) @func84 (%TypePointer* %32, %Type* %1)
  br label %select_1_end
select_1_3:
  %33 = icmp eq %TypeKind %25, 12
  br i1 %33, label %select_1_3_ok, label %select_1_4
select_1_3_ok:
  call void (%Type*, %Type*) @func89 (%Type* %0, %Type* %0)
  br label %select_1_end
select_1_4:
  %34 = icmp eq %TypeKind %25, 13
  br i1 %34, label %select_1_4_ok, label %select_1_5
select_1_4_ok:
  call void (%Type*, %Type*) @func90 (%Type* %0, %Type* %0)
  br label %select_1_end
select_1_5:
  %35 = icmp eq %TypeKind %25, 10
  br i1 %35, label %select_1_5_ok, label %select_1_6
select_1_5_ok:
  call void (%Type*) @func85 (%Type* %0)
  br label %select_1_end
select_1_6:
  %36 = icmp eq %TypeKind %25, 7
  br i1 %36, label %select_1_6_ok, label %select_1_7
select_1_6_ok:
  %37 = bitcast [5 x %Nat8]* @func82_str5 to %Str
  %38 = call %Int32 (%Str, ...) @printf (%Str %37)
  br label %select_1_end
select_1_7:
  %39 = icmp eq %TypeKind %25, 9
  br i1 %39, label %select_1_7_ok, label %select_1_8
select_1_7_ok:
  call void (%Type*) @func87 (%Type* %0)
  br label %select_1_end
select_1_8:
  %40 = icmp eq %TypeKind %25, 8
  br i1 %40, label %select_1_8_ok, label %select_1_9
select_1_8_ok:
  %41 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 6
  call void (%TypeFunc*) @func91 (%TypeFunc* %41)
  br label %select_1_end
select_1_9:
  %42 = icmp eq %TypeKind %25, 2
  br i1 %42, label %select_1_9_ok, label %select_1_10
select_1_9_ok:
  %43 = bitcast [13 x %Nat8]* @func82_str6 to %Str
  %44 = call %Int32 (%Str, ...) @printf (%Str %43)
  br label %select_1_end
select_1_10:
  %45 = icmp eq %TypeKind %25, 0
  br i1 %45, label %select_1_10_ok, label %select_1_11
select_1_10_ok:
  %46 = bitcast [16 x %Nat8]* @func82_str7 to %Str
  %47 = call %Int32 (%Str, ...) @printf (%Str %46)
  br label %select_1_end
select_1_11:
  %48 = icmp eq %TypeKind %25, 14
  br i1 %48, label %select_1_11_ok, label %select_1_12
select_1_11_ok:
  %49 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 13
  call void (%TypeUnion*) @func92 (%TypeUnion* %49)
  br label %select_1_end
select_1_12:
  %50 = icmp eq %TypeKind %25, 4
  br i1 %50, label %select_1_12_ok, label %select_1_13
select_1_12_ok:
  %51 = bitcast [20 x %Nat8]* @func82_str8 to %Str
  %52 = call %Int32 (%Str, ...) @printf (%Str %51)
  br label %select_1_end
select_1_13:
  %53 = bitcast [14 x %Nat8]* @func82_str9 to %Str
  %54 = call %Int32 (%Str, ...) @printf (%Str %53)
  br label %select_1_end
select_1_end:
  ret void
}

define void @func83 (%TypeVar*) {
;stmt0:
  %2 = bitcast [5 x %Nat8]* @func83_str1 to %Str
  %3 = call %Int32 (%Str, ...) @printf (%Str %2)
;stmt1:
  %4 = getelementptr inbounds %TypeVar, %TypeVar* %0, i1 0, i32 0
  %5 = load %Type*, %Type** %4
  call void (%Type*) @func81 (%Type* %5)
  ret void
}

define void @func84 (%TypePointer*, %Type*) {
;stmt0:
  %3 = bitcast [2 x %Nat8]* @func84_str1 to %Str
  %4 = call %Int32 (%Str, ...) @printf (%Str %3)
;stmt1:
  %5 = getelementptr inbounds %TypePointer, %TypePointer* %0, i1 0, i32 0
  %6 = load %Type*, %Type** %5
  %7 = getelementptr inbounds %Type, %Type* %6, i1 0, i32 0
  %8 = load %TypeKind, %TypeKind* %7
  %9 = icmp eq %TypeKind %8, 14
  %10 = getelementptr inbounds %TypePointer, %TypePointer* %0, i1 0, i32 0
  %11 = load %Type*, %Type** %10
  %12 = getelementptr inbounds %Type, %Type* %11, i1 0, i32 0
  %13 = load %TypeKind, %TypeKind* %12
  %14 = icmp eq %TypeKind %13, 8
  %15 = or i1 %9, %14
;stmt2:
  br i1 %15, label %then_0, label %else_0
then_0:
;stmt3:
  %16 = bitcast [2 x %Nat8]* @func84_str2 to %Str
  %17 = call %Int32 (%Str, ...) @printf (%Str %16)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt4:
  %18 = getelementptr inbounds %TypePointer, %TypePointer* %0, i1 0, i32 0
  %19 = load %Type*, %Type** %18
  call void (%Type*, %Type*) @func82 (%Type* %19, %Type* %1)
;stmt5:
  br i1 %15, label %then_1, label %else_1
then_1:
;stmt6:
  %20 = bitcast [2 x %Nat8]* @func84_str3 to %Str
  %21 = call %Int32 (%Str, ...) @printf (%Str %20)
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  ret void
}

define void @func86 (%Unit*, %Unit*, %Nat32, %Node*) {
;stmt0:
  %5 = bitcast %Unit* %0 to %Decl*
;stmt1:
  %6 = bitcast %Unit* %1 to %Type*
;stmt2:
  %7 = icmp ugt %Nat32 %2, 0
  br i1 %7, label %then_0, label %else_0
then_0:
;stmt3:
  %8 = bitcast [3 x %Nat8]* @func85_func86_str1 to %Str
  %9 = call %Int32 (%Str, ...) @printf (%Str %8)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt4:
  %10 = bitcast [6 x %Nat8]* @func85_func86_str2 to %Str
  %11 = getelementptr inbounds %Decl, %Decl* %5, i1 0, i32 0
  %12 = load %AstId*, %AstId** %11
  %13 = getelementptr inbounds %AstId, %AstId* %12, i1 0, i32 0
  %14 = load %Str, %Str* %13
  %15 = call %Int32 (%Str, ...) @printf (%Str %10, %Str %14)
;stmt5:
  %16 = getelementptr inbounds %Decl, %Decl* %5, i1 0, i32 1
  %17 = load %Type*, %Type** %16
  call void (%Type*, %Type*) @func82 (%Type* %17, %Type* %6)
  ret void
}

define void @func85 (%Type*) {
;stmt0:
  %2 = bitcast [2 x %Nat8]* @func85_str1 to %Str
  %3 = call %Int32 (%Str, ...) @printf (%Str %2)
;stmt1:
  %4 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 10
  %5 = getelementptr inbounds %TypeRecord, %TypeRecord* %4, i1 0, i32 0
  %6 = load %List*, %List** %5
  %7 = bitcast %Type* %0 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @func64 (%List* %6, %ListForeachHandler @func86, %Unit* %7)
;stmt2:
  %8 = bitcast [2 x %Nat8]* @func85_str2 to %Str
  %9 = call %Int32 (%Str, ...) @printf (%Str %8)
  ret void
}

define void @func88 (%Unit*, %Unit*, %Nat32, %Node*) {
;stmt0:
  %5 = bitcast [7 x %Nat8]* @func87_func88_str1 to %Str
  %6 = call %Int32 (%Str, ...) @printf (%Str %5)
  ret void
}

define void @func87 (%Type*) {
;stmt0:
  %2 = bitcast [2 x %Nat8]* @func87_str1 to %Str
  %3 = call %Int32 (%Str, ...) @printf (%Str %2)
;stmt1:
  %4 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 11
  %5 = getelementptr inbounds %TypeEnum, %TypeEnum* %4, i1 0, i32 0
  %6 = load %List*, %List** %5; loadImmPtr
  %7 = inttoptr i64 0 to%Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @func64 (%List* %6, %ListForeachHandler @func88, %Unit* %7)
;stmt2:
  %8 = bitcast [2 x %Nat8]* @func87_str2 to %Str
  %9 = call %Int32 (%Str, ...) @printf (%Str %8)
  ret void
}

define void @func89 (%Type*, %Type*) {
;stmt0:
  %3 = bitcast [5 x %Nat8]* @func89_str1 to %Str
  %4 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 8
  %5 = getelementptr inbounds %TypeArray, %TypeArray* %4, i1 0, i32 1
  %6 = load %Nat32, %Nat32* %5
  %7 = call %Int32 (%Str, ...) @printf (%Str %3, %Nat32 %6)
;stmt1:
  %8 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 8
  %9 = getelementptr inbounds %TypeArray, %TypeArray* %8, i1 0, i32 0
  %10 = load %Type*, %Type** %9
  call void (%Type*, %Type*) @func82 (%Type* %10, %Type* %1)
  ret void
}

define void @func90 (%Type*, %Type*) {
;stmt0:
  %3 = bitcast [3 x %Nat8]* @func90_str1 to %Str
  %4 = call %Int32 (%Str, ...) @printf (%Str %3)
;stmt1:
  %5 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 9
  %6 = getelementptr inbounds %TypeArrayU, %TypeArrayU* %5, i1 0, i32 0
  %7 = load %Type*, %Type** %6
  call void (%Type*, %Type*) @func82 (%Type* %7, %Type* %1)
  ret void
}

define void @func91 (%TypeFunc*) {
;stmt0:
  %2 = getelementptr inbounds %TypeFunc, %TypeFunc* %0, i1 0, i32 0
  %3 = load %Type*, %Type** %2
  call void (%Type*) @func81 (%Type* %3)
;stmt1:
  %4 = bitcast [5 x %Nat8]* @func91_str1 to %Str
  %5 = call %Int32 (%Str, ...) @printf (%Str %4)
;stmt2:
  %6 = getelementptr inbounds %TypeFunc, %TypeFunc* %0, i1 0, i32 1
  %7 = load %Type*, %Type** %6
  call void (%Type*) @func81 (%Type* %7)
  ret void
}

define void @func93 (%Unit*, %Unit*, %Nat32, %Node*) {
;stmt0:
  %5 = bitcast %Unit* %0 to %Type*
;stmt1:
  call void (%Type*) @func81 (%Type* %5)
;stmt2:
  %6 = getelementptr inbounds %Node, %Node* %3, i1 0, i32 1
  %7 = load %Node*, %Node** %6; loadImmPtr
  %8 = inttoptr i64 0 to%Node*
  %9 = icmp ne %Node* %7, %8
  br i1 %9, label %then_0, label %else_0
then_0:
;stmt3:
  %10 = bitcast [5 x %Nat8]* @func92_func93_str1 to %Str
  %11 = call %Int32 (%Str, ...) @printf (%Str %10)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  ret void
}

define void @func92 (%TypeUnion*) {
;stmt0:
  %2 = getelementptr inbounds %TypeUnion, %TypeUnion* %0, i1 0, i32 0; loadImmPtr
  %3 = inttoptr i64 0 to%Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @func64 (%List* %2, %ListForeachHandler @func93, %Unit* %3)
  ret void
}

define void @print_value_kind (%ValueKind) {
;stmt0:
  br label %select_1_0
select_1_0:
  %2 = icmp eq %ValueKind %0, 0
  br i1 %2, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %3 = bitcast [16 x %Nat8]* @func94_str1 to %Str
  br label %select_1_end
select_1_1:
  %4 = icmp eq %ValueKind %0, 1
  br i1 %4, label %select_1_1_ok, label %select_1_2
select_1_1_ok:
  %5 = bitcast [13 x %Nat8]* @func94_str2 to %Str
  br label %select_1_end
select_1_2:
  %6 = icmp eq %ValueKind %0, 2
  br i1 %6, label %select_1_2_ok, label %select_1_3
select_1_2_ok:
  %7 = bitcast [16 x %Nat8]* @func94_str3 to %Str
  br label %select_1_end
select_1_3:
  %8 = icmp eq %ValueKind %0, 3
  br i1 %8, label %select_1_3_ok, label %select_1_4
select_1_3_ok:
  %9 = bitcast [16 x %Nat8]* @func94_str4 to %Str
  br label %select_1_end
select_1_4:
  %10 = icmp eq %ValueKind %0, 8
  br i1 %10, label %select_1_4_ok, label %select_1_5
select_1_4_ok:
  %11 = bitcast [13 x %Nat8]* @func94_str5 to %Str
  br label %select_1_end
select_1_5:
  %12 = icmp eq %ValueKind %0, 9
  br i1 %12, label %select_1_5_ok, label %select_1_6
select_1_5_ok:
  %13 = bitcast [20 x %Nat8]* @func94_str6 to %Str
  br label %select_1_end
select_1_6:
  %14 = icmp eq %ValueKind %0, 5
  br i1 %14, label %select_1_6_ok, label %select_1_7
select_1_6_ok:
  %15 = bitcast [18 x %Nat8]* @func94_str7 to %Str
  br label %select_1_end
select_1_7:
  %16 = icmp eq %ValueKind %0, 6
  br i1 %16, label %select_1_7_ok, label %select_1_8
select_1_7_ok:
  %17 = bitcast [16 x %Nat8]* @func94_str8 to %Str
  br label %select_1_end
select_1_8:
  %18 = icmp eq %ValueKind %0, 7
  br i1 %18, label %select_1_8_ok, label %select_1_9
select_1_8_ok:
  %19 = bitcast [12 x %Nat8]* @func94_str9 to %Str
  br label %select_1_end
select_1_9:
  %20 = icmp eq %ValueKind %0, 11
  br i1 %20, label %select_1_9_ok, label %select_1_10
select_1_9_ok:
  %21 = bitcast [17 x %Nat8]* @func94_str10 to %Str
  br label %select_1_end
select_1_10:
  %22 = icmp eq %ValueKind %0, 12
  br i1 %22, label %select_1_10_ok, label %select_1_11
select_1_10_ok:
  %23 = bitcast [15 x %Nat8]* @func94_str11 to %Str
  br label %select_1_end
select_1_11:
  %24 = icmp eq %ValueKind %0, 13
  br i1 %24, label %select_1_11_ok, label %select_1_12
select_1_11_ok:
  %25 = bitcast [10 x %Nat8]* @func94_str12 to %Str
  br label %select_1_end
select_1_12:
  %26 = icmp eq %ValueKind %0, 14
  br i1 %26, label %select_1_12_ok, label %select_1_13
select_1_12_ok:
  %27 = bitcast [12 x %Nat8]* @func94_str13 to %Str
  br label %select_1_end
select_1_13:
  %28 = icmp eq %ValueKind %0, 15
  br i1 %28, label %select_1_13_ok, label %select_1_14
select_1_13_ok:
  %29 = bitcast [10 x %Nat8]* @func94_str14 to %Str
  br label %select_1_end
select_1_14:
  %30 = icmp eq %ValueKind %0, 16
  br i1 %30, label %select_1_14_ok, label %select_1_15
select_1_14_ok:
  %31 = bitcast [12 x %Nat8]* @func94_str15 to %Str
  br label %select_1_end
select_1_15:
  %32 = icmp eq %ValueKind %0, 17
  br i1 %32, label %select_1_15_ok, label %select_1_16
select_1_15_ok:
  %33 = bitcast [11 x %Nat8]* @func94_str16 to %Str
  br label %select_1_end
select_1_16:
  %34 = icmp eq %ValueKind %0, 18
  br i1 %34, label %select_1_16_ok, label %select_1_17
select_1_16_ok:
  %35 = bitcast [10 x %Nat8]* @func94_str17 to %Str
  br label %select_1_end
select_1_17:
  %36 = icmp eq %ValueKind %0, 19
  br i1 %36, label %select_1_17_ok, label %select_1_18
select_1_17_ok:
  %37 = bitcast [10 x %Nat8]* @func94_str18 to %Str
  br label %select_1_end
select_1_18:
  %38 = icmp eq %ValueKind %0, 20
  br i1 %38, label %select_1_18_ok, label %select_1_19
select_1_18_ok:
  %39 = bitcast [10 x %Nat8]* @func94_str19 to %Str
  br label %select_1_end
select_1_19:
  %40 = icmp eq %ValueKind %0, 21
  br i1 %40, label %select_1_19_ok, label %select_1_20
select_1_19_ok:
  %41 = bitcast [10 x %Nat8]* @func94_str20 to %Str
  br label %select_1_end
select_1_20:
  %42 = icmp eq %ValueKind %0, 22
  br i1 %42, label %select_1_20_ok, label %select_1_21
select_1_20_ok:
  %43 = bitcast [10 x %Nat8]* @func94_str21 to %Str
  br label %select_1_end
select_1_21:
  %44 = icmp eq %ValueKind %0, 23
  br i1 %44, label %select_1_21_ok, label %select_1_22
select_1_21_ok:
  %45 = bitcast [9 x %Nat8]* @func94_str22 to %Str
  br label %select_1_end
select_1_22:
  %46 = icmp eq %ValueKind %0, 24
  br i1 %46, label %select_1_22_ok, label %select_1_23
select_1_22_ok:
  %47 = bitcast [10 x %Nat8]* @func94_str23 to %Str
  br label %select_1_end
select_1_23:
  %48 = icmp eq %ValueKind %0, 25
  br i1 %48, label %select_1_23_ok, label %select_1_24
select_1_23_ok:
  %49 = bitcast [10 x %Nat8]* @func94_str24 to %Str
  br label %select_1_end
select_1_24:
  %50 = icmp eq %ValueKind %0, 26
  br i1 %50, label %select_1_24_ok, label %select_1_25
select_1_24_ok:
  %51 = bitcast [9 x %Nat8]* @func94_str25 to %Str
  br label %select_1_end
select_1_25:
  %52 = icmp eq %ValueKind %0, 27
  br i1 %52, label %select_1_25_ok, label %select_1_26
select_1_25_ok:
  %53 = bitcast [9 x %Nat8]* @func94_str26 to %Str
  br label %select_1_end
select_1_26:
  %54 = icmp eq %ValueKind %0, 28
  br i1 %54, label %select_1_26_ok, label %select_1_27
select_1_26_ok:
  %55 = bitcast [9 x %Nat8]* @func94_str27 to %Str
  br label %select_1_end
select_1_27:
  %56 = icmp eq %ValueKind %0, 29
  br i1 %56, label %select_1_27_ok, label %select_1_28
select_1_27_ok:
  %57 = bitcast [9 x %Nat8]* @func94_str28 to %Str
  br label %select_1_end
select_1_28:
  %58 = icmp eq %ValueKind %0, 30
  br i1 %58, label %select_1_28_ok, label %select_1_29
select_1_28_ok:
  %59 = bitcast [9 x %Nat8]* @func94_str29 to %Str
  br label %select_1_end
select_1_29:
  %60 = icmp eq %ValueKind %0, 31
  br i1 %60, label %select_1_29_ok, label %select_1_30
select_1_29_ok:
  %61 = bitcast [9 x %Nat8]* @func94_str30 to %Str
  br label %select_1_end
select_1_30:
  %62 = icmp eq %ValueKind %0, 32
  br i1 %62, label %select_1_30_ok, label %select_1_31
select_1_30_ok:
  %63 = bitcast [11 x %Nat8]* @func94_str31 to %Str
  br label %select_1_end
select_1_31:
  %64 = icmp eq %ValueKind %0, 33
  br i1 %64, label %select_1_31_ok, label %select_1_32
select_1_31_ok:
  %65 = bitcast [10 x %Nat8]* @func94_str32 to %Str
  br label %select_1_end
select_1_32:
  %66 = icmp eq %ValueKind %0, 34
  br i1 %66, label %select_1_32_ok, label %select_1_33
select_1_32_ok:
  %67 = bitcast [10 x %Nat8]* @func94_str33 to %Str
  br label %select_1_end
select_1_33:
  %68 = icmp eq %ValueKind %0, 35
  br i1 %68, label %select_1_33_ok, label %select_1_34
select_1_33_ok:
  %69 = bitcast [11 x %Nat8]* @func94_str34 to %Str
  br label %select_1_end
select_1_34:
  %70 = icmp eq %ValueKind %0, 36
  br i1 %70, label %select_1_34_ok, label %select_1_35
select_1_34_ok:
  %71 = bitcast [12 x %Nat8]* @func94_str35 to %Str
  br label %select_1_end
select_1_35:
  %72 = icmp eq %ValueKind %0, 37
  br i1 %72, label %select_1_35_ok, label %select_1_36
select_1_35_ok:
  %73 = bitcast [13 x %Nat8]* @func94_str36 to %Str
  br label %select_1_end
select_1_36:
  %74 = icmp eq %ValueKind %0, 38
  br i1 %74, label %select_1_36_ok, label %select_1_37
select_1_36_ok:
  %75 = bitcast [11 x %Nat8]* @func94_str37 to %Str
  br label %select_1_end
select_1_37:
  %76 = icmp eq %ValueKind %0, 41
  br i1 %76, label %select_1_37_ok, label %select_1_38
select_1_37_ok:
  %77 = bitcast [11 x %Nat8]* @func94_str38 to %Str
  br label %select_1_end
select_1_38:
  %78 = bitcast [21 x %Nat8]* @func94_str39 to %Str
  br label %select_1_end
select_1_end:
  %79 = phi %Str [ %3, %select_1_0_ok ], [ %5, %select_1_1_ok ], [ %7, %select_1_2_ok ], [ %9, %select_1_3_ok ], [ %11, %select_1_4_ok ], [ %13, %select_1_5_ok ], [ %15, %select_1_6_ok ], [ %17, %select_1_7_ok ], [ %19, %select_1_8_ok ], [ %21, %select_1_9_ok ], [ %23, %select_1_10_ok ], [ %25, %select_1_11_ok ], [ %27, %select_1_12_ok ], [ %29, %select_1_13_ok ], [ %31, %select_1_14_ok ], [ %33, %select_1_15_ok ], [ %35, %select_1_16_ok ], [ %37, %select_1_17_ok ], [ %39, %select_1_18_ok ], [ %41, %select_1_19_ok ], [ %43, %select_1_20_ok ], [ %45, %select_1_21_ok ], [ %47, %select_1_22_ok ], [ %49, %select_1_23_ok ], [ %51, %select_1_24_ok ], [ %53, %select_1_25_ok ], [ %55, %select_1_26_ok ], [ %57, %select_1_27_ok ], [ %59, %select_1_28_ok ], [ %61, %select_1_29_ok ], [ %63, %select_1_30_ok ], [ %65, %select_1_31_ok ], [ %67, %select_1_32_ok ], [ %69, %select_1_33_ok ], [ %71, %select_1_34_ok ], [ %73, %select_1_35_ok ], [ %75, %select_1_36_ok ], [ %77, %select_1_37_ok ], [ %78, %select_1_38 ]
;stmt1:
  %80 = bitcast [3 x %Nat8]* @func94_str40 to %Str
  %81 = call %Int32 (%Str, ...) @printf (%Str %80, %Str %79)
  ret void
}

define void @func96 () {
;stmt0:
  %1 = bitcast [16 x %Nat8]* @func95_func96_str1 to %Str
  %2 = call %Int32 (%Str, ...) @printf (%Str %1)
  ret void
}

define void @func97 () {
;stmt0:
  %1 = bitcast [13 x %Nat8]* @func95_func97_str1 to %Str
  %2 = call %Int32 (%Str, ...) @printf (%Str %1)
  ret void
}

define void @func98 () {
  ret void
}

define void @value_print (%Value*) {
;stmt0:
  %2 = bitcast [7 x %Nat8]* @func95_str1 to %Str
  %3 = call %Int32 (%Str, ...) @printf (%Str %2)
;stmt1:
  %4 = bitcast [7 x %Nat8]* @func95_str2 to %Str
  %5 = call %Int32 (%Str, ...) @printf (%Str %4)
;stmt2:
  %6 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 1
  %7 = load %Type*, %Type** %6
  call void (%Type*) @func81 (%Type* %7)
;stmt3:
  %8 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 0
  %9 = load %ValueKind, %ValueKind* %8
  br label %select_1_0
select_1_0:
  %10 = icmp eq %ValueKind %9, 0
  br i1 %10, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  call void () @func96 ()
  br label %select_1_end
select_1_1:
  %11 = icmp eq %ValueKind %9, 1
  br i1 %11, label %select_1_1_ok, label %select_1_2
select_1_1_ok:
  call void () @func97 ()
  br label %select_1_end
select_1_2:
  %12 = icmp eq %ValueKind %9, 2
  br i1 %12, label %select_1_2_ok, label %select_1_3
select_1_2_ok:
  call void (%Value*) @func99 (%Value* %0)
  br label %select_1_end
select_1_3:
  %13 = icmp eq %ValueKind %9, 3
  br i1 %13, label %select_1_3_ok, label %select_1_4
select_1_3_ok:
  call void (%Value*) @func100 (%Value* %0)
  br label %select_1_end
select_1_4:
  %14 = icmp eq %ValueKind %9, 5
  br i1 %14, label %select_1_4_ok, label %select_1_5
select_1_4_ok:
  call void (%Value*) @func101 (%Value* %0)
  br label %select_1_end
select_1_5:
  %15 = icmp eq %ValueKind %9, 6
  br i1 %15, label %select_1_5_ok, label %select_1_6
select_1_5_ok:
  call void (%Value*) @func102 (%Value* %0)
  br label %select_1_end
select_1_6:
  %16 = icmp eq %ValueKind %9, 7
  br i1 %16, label %select_1_6_ok, label %select_1_7
select_1_6_ok:
  call void (%Value*) @func103 (%Value* %0)
  br label %select_1_end
select_1_7:
  %17 = icmp eq %ValueKind %9, 11
  br i1 %17, label %select_1_7_ok, label %select_1_8
select_1_7_ok:
  call void (%Value*) @func104 (%Value* %0)
  br label %select_1_end
select_1_8:
  %18 = icmp eq %ValueKind %9, 12
  br i1 %18, label %select_1_8_ok, label %select_1_9
select_1_8_ok:
  call void (%Value*) @func105 (%Value* %0)
  br label %select_1_end
select_1_9:
  %19 = icmp eq %ValueKind %9, 13
  br i1 %19, label %select_1_9_ok, label %select_1_10
select_1_9_ok:
  call void (%Value*) @func106 (%Value* %0)
  br label %select_1_end
select_1_10:
  %20 = icmp eq %ValueKind %9, 14
  br i1 %20, label %select_1_10_ok, label %select_1_11
select_1_10_ok:
  call void (%Value*) @func107 (%Value* %0)
  br label %select_1_end
select_1_11:
  %21 = icmp eq %ValueKind %9, 15
  br i1 %21, label %select_1_11_ok, label %select_1_12
select_1_11_ok:
  call void (%Value*) @func108 (%Value* %0)
  br label %select_1_end
select_1_12:
  %22 = icmp eq %ValueKind %9, 16
  br i1 %22, label %select_1_12_ok, label %select_1_13
select_1_12_ok:
  call void (%Value*) @func109 (%Value* %0)
  br label %select_1_end
select_1_13:
  %23 = icmp eq %ValueKind %9, 17
  br i1 %23, label %select_1_13_ok, label %select_1_14
select_1_13_ok:
  call void (%Value*) @func110 (%Value* %0)
  br label %select_1_end
select_1_14:
  %24 = icmp eq %ValueKind %9, 18
  br i1 %24, label %select_1_14_ok, label %select_1_15
select_1_14_ok:
  %25 = bitcast [4 x %Nat8]* @func95_str3 to %Str
  call void (%Value*, %Str) @func111 (%Value* %0, %Str %25)
  br label %select_1_end
select_1_15:
  %26 = icmp eq %ValueKind %9, 19
  br i1 %26, label %select_1_15_ok, label %select_1_16
select_1_15_ok:
  %27 = bitcast [4 x %Nat8]* @func95_str4 to %Str
  call void (%Value*, %Str) @func111 (%Value* %0, %Str %27)
  br label %select_1_end
select_1_16:
  %28 = icmp eq %ValueKind %9, 20
  br i1 %28, label %select_1_16_ok, label %select_1_17
select_1_16_ok:
  %29 = bitcast [4 x %Nat8]* @func95_str5 to %Str
  call void (%Value*, %Str) @func111 (%Value* %0, %Str %29)
  br label %select_1_end
select_1_17:
  %30 = icmp eq %ValueKind %9, 21
  br i1 %30, label %select_1_17_ok, label %select_1_18
select_1_17_ok:
  %31 = bitcast [4 x %Nat8]* @func95_str6 to %Str
  call void (%Value*, %Str) @func111 (%Value* %0, %Str %31)
  br label %select_1_end
select_1_18:
  %32 = icmp eq %ValueKind %9, 22
  br i1 %32, label %select_1_18_ok, label %select_1_19
select_1_18_ok:
  %33 = bitcast [4 x %Nat8]* @func95_str7 to %Str
  call void (%Value*, %Str) @func111 (%Value* %0, %Str %33)
  br label %select_1_end
select_1_19:
  %34 = icmp eq %ValueKind %9, 23
  br i1 %34, label %select_1_19_ok, label %select_1_20
select_1_19_ok:
  %35 = bitcast [3 x %Nat8]* @func95_str8 to %Str
  call void (%Value*, %Str) @func111 (%Value* %0, %Str %35)
  br label %select_1_end
select_1_20:
  %36 = icmp eq %ValueKind %9, 24
  br i1 %36, label %select_1_20_ok, label %select_1_21
select_1_20_ok:
  %37 = bitcast [4 x %Nat8]* @func95_str9 to %Str
  call void (%Value*, %Str) @func111 (%Value* %0, %Str %37)
  br label %select_1_end
select_1_21:
  %38 = icmp eq %ValueKind %9, 25
  br i1 %38, label %select_1_21_ok, label %select_1_22
select_1_21_ok:
  %39 = bitcast [4 x %Nat8]* @func95_str10 to %Str
  call void (%Value*, %Str) @func111 (%Value* %0, %Str %39)
  br label %select_1_end
select_1_22:
  %40 = icmp eq %ValueKind %9, 26
  br i1 %40, label %select_1_22_ok, label %select_1_23
select_1_22_ok:
  %41 = bitcast [3 x %Nat8]* @func95_str11 to %Str
  call void (%Value*, %Str) @func111 (%Value* %0, %Str %41)
  br label %select_1_end
select_1_23:
  %42 = icmp eq %ValueKind %9, 27
  br i1 %42, label %select_1_23_ok, label %select_1_24
select_1_23_ok:
  %43 = bitcast [3 x %Nat8]* @func95_str12 to %Str
  call void (%Value*, %Str) @func111 (%Value* %0, %Str %43)
  br label %select_1_end
select_1_24:
  %44 = icmp eq %ValueKind %9, 28
  br i1 %44, label %select_1_24_ok, label %select_1_25
select_1_24_ok:
  %45 = bitcast [3 x %Nat8]* @func95_str13 to %Str
  call void (%Value*, %Str) @func111 (%Value* %0, %Str %45)
  br label %select_1_end
select_1_25:
  %46 = icmp eq %ValueKind %9, 29
  br i1 %46, label %select_1_25_ok, label %select_1_26
select_1_25_ok:
  %47 = bitcast [3 x %Nat8]* @func95_str14 to %Str
  call void (%Value*, %Str) @func111 (%Value* %0, %Str %47)
  br label %select_1_end
select_1_26:
  %48 = icmp eq %ValueKind %9, 30
  br i1 %48, label %select_1_26_ok, label %select_1_27
select_1_26_ok:
  %49 = bitcast [3 x %Nat8]* @func95_str15 to %Str
  call void (%Value*, %Str) @func111 (%Value* %0, %Str %49)
  br label %select_1_end
select_1_27:
  %50 = icmp eq %ValueKind %9, 31
  br i1 %50, label %select_1_27_ok, label %select_1_28
select_1_27_ok:
  %51 = bitcast [3 x %Nat8]* @func95_str16 to %Str
  call void (%Value*, %Str) @func111 (%Value* %0, %Str %51)
  br label %select_1_end
select_1_28:
  %52 = icmp eq %ValueKind %9, 32
  br i1 %52, label %select_1_28_ok, label %select_1_29
select_1_28_ok:
  call void (%Value*) @func112 (%Value* %0)
  br label %select_1_end
select_1_29:
  %53 = icmp eq %ValueKind %9, 33
  br i1 %53, label %select_1_29_ok, label %select_1_30
select_1_29_ok:
  call void (%Value*) @func113 (%Value* %0)
  br label %select_1_end
select_1_30:
  %54 = icmp eq %ValueKind %9, 34
  br i1 %54, label %select_1_30_ok, label %select_1_31
select_1_30_ok:
  call void (%Value*) @func114 (%Value* %0)
  br label %select_1_end
select_1_31:
  %55 = icmp eq %ValueKind %9, 35
  br i1 %55, label %select_1_31_ok, label %select_1_32
select_1_31_ok:
  call void (%Value*) @func115 (%Value* %0)
  br label %select_1_end
select_1_32:
  %56 = icmp eq %ValueKind %9, 36
  br i1 %56, label %select_1_32_ok, label %select_1_33
select_1_32_ok:
  call void (%Value*) @func116 (%Value* %0)
  br label %select_1_end
select_1_33:
  %57 = icmp eq %ValueKind %9, 37
  br i1 %57, label %select_1_33_ok, label %select_1_34
select_1_33_ok:
  call void (%Value*) @func117 (%Value* %0)
  br label %select_1_end
select_1_34:
  %58 = icmp eq %ValueKind %9, 38
  br i1 %58, label %select_1_34_ok, label %select_1_35
select_1_34_ok:
  call void (%Value*) @func118 (%Value* %0)
  br label %select_1_end
select_1_35:
  %59 = icmp eq %ValueKind %9, 41
  br i1 %59, label %select_1_35_ok, label %select_1_36
select_1_35_ok:
  call void (%Value*) @func119 (%Value* %0)
  br label %select_1_end
select_1_36:
  call void () @func98 ()
  br label %select_1_end
select_1_end:
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

define void @func104 (%Value*) {
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

define void @func111 (%Value*, %Str) {
;stmt0:
  %3 = bitcast [10 x %Nat8]* @func111_str1 to %Str
  %4 = call %Int32 (%Str, ...) @printf (%Str %3, %Str %1)
;stmt1:
  %5 = bitcast [11 x %Nat8]* @func111_str2 to %Str
  %6 = call %Int32 (%Str, ...) @printf (%Str %5)
;stmt2:
  %7 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 11
  %8 = getelementptr inbounds %ValueBin, %ValueBin* %7, i1 0, i32 2
  %9 = load %Value*, %Value** %8
  %10 = getelementptr inbounds %Value, %Value* %9, i1 0, i32 1
  %11 = load %Type*, %Type** %10
  call void (%Type*) @func81 (%Type* %11)
;stmt3:
  %12 = bitcast [12 x %Nat8]* @func111_str3 to %Str
  %13 = call %Int32 (%Str, ...) @printf (%Str %12)
;stmt4:
  %14 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 11
  %15 = getelementptr inbounds %ValueBin, %ValueBin* %14, i1 0, i32 3
  %16 = load %Value*, %Value** %15
  %17 = getelementptr inbounds %Value, %Value* %16, i1 0, i32 1
  %18 = load %Type*, %Type** %17
  call void (%Type*) @func81 (%Type* %18)
  ret void
}

define void @func112 (%Value*) {
  ret void
}

define void @func113 (%Value*) {
  ret void
}

define void @func114 (%Value*) {
  ret void
}

define void @func115 (%Value*) {
  ret void
}

define void @func116 (%Value*) {
  ret void
}

define void @func117 (%Value*) {
  ret void
}

define void @func118 (%Value*) {
  ret void
}

define void @func119 (%Value*) {
  ret void
}

define void @txt (%Str, %Nat8, %Str) {
;stmt0:
  %4 = bitcast [21 x %Nat8]* @func120_str1 to %Str
  %5 = call %Int32 (%Str, ...) @printf (%Str %4, %Int64 27, %Nat8 %1, %Str %0, %Int64 27, %Str %2)
  ret void
}

define void @txti (%Str, %Nat8, %TokenInfo*, %Str) {
;stmt0:
  %5 = bitcast [30 x %Nat8]* @func121_str1 to %Str
  %6 = getelementptr inbounds %TokenInfo, %TokenInfo* %2, i1 0, i32 0
  %7 = load %Str, %Str* %6
  %8 = getelementptr inbounds %TokenInfo, %TokenInfo* %2, i1 0, i32 3
  %9 = load %Nat32, %Nat32* %8
  %10 = call %Int32 (%Str, ...) @printf (%Str %5, %Int64 27, %Nat8 %1, %Str %0, %Int64 27, %Str %7, %Nat32 %9, %Str %3)
  ret void
}

define void @info (%Str, %TokenInfo*) {
;stmt0:; loadImmPtr
  %3 = inttoptr i64 0 to%TokenInfo*
  %4 = icmp ne %TokenInfo* %1, %3
  br i1 %4, label %then_0, label %else_0
then_0:
;stmt1:
  %5 = bitcast [5 x %Nat8]* @func122_str1 to %Str
  call void (%Str, %Nat8, %TokenInfo*, %Str) @txti (%Str %5, %Nat8 36, %TokenInfo* %1, %Str %0)
;stmt2:
  call void (%TokenInfo*) @func127 (%TokenInfo* %1)
  br label %endif_0
else_0:
;stmt3:
  %6 = bitcast [5 x %Nat8]* @func122_str2 to %Str
  call void (%Str, %Nat8, %Str) @txt (%Str %6, %Nat8 36, %Str %0)
  br label %endif_0
endif_0:
;stmt4:
  %7 = bitcast [2 x %Nat8]* @func122_str3 to %Str
  %8 = call %Int32 (%Str, ...) @printf (%Str %7)
  ret void
}

define void @warning (%Str, %TokenInfo*) {
;stmt0:; loadImmPtr
  %3 = inttoptr i64 0 to%TokenInfo*
  %4 = icmp ne %TokenInfo* %1, %3
  br i1 %4, label %then_0, label %else_0
then_0:
;stmt1:
  %5 = bitcast [8 x %Nat8]* @func123_str1 to %Str
  call void (%Str, %Nat8, %TokenInfo*, %Str) @txti (%Str %5, %Nat8 34, %TokenInfo* %1, %Str %0)
;stmt2:
  call void (%TokenInfo*) @func127 (%TokenInfo* %1)
  br label %endif_0
else_0:
;stmt3:
  %6 = bitcast [8 x %Nat8]* @func123_str2 to %Str
  call void (%Str, %Nat8, %Str) @txt (%Str %6, %Nat8 34, %Str %0)
  br label %endif_0
endif_0:
;stmt4:
  %7 = bitcast [2 x %Nat8]* @func123_str3 to %Str
  %8 = call %Int32 (%Str, ...) @printf (%Str %7)
;stmt5:
  %9 = load %Nat32, %Nat32* @warncnt
  %10 = add %Nat32 %9, 1
  store %Nat32 %10, %Nat32* @warncnt, align 4
;stmt6:
  %11 = load %Int32, %Int32* @errcnt
  %12 = icmp sgt %Int32 %11, 20
  br i1 %12, label %then_1, label %else_1
then_1:
;stmt7:
  %13 = bitcast [14 x %Nat8]* @func123_str4 to %Str
  %14 = call %Int32 (%Str, ...) @printf (%Str %13)
;stmt8:
  call void (%Int32) @exit (%Int32 1)
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  ret void
}

define void @error (%Str, %TokenInfo*) {
;stmt0:; loadImmPtr
  %3 = inttoptr i64 0 to%TokenInfo*
  %4 = icmp eq %TokenInfo* %1, %3
  br i1 %4, label %then_0, label %else_0
then_0:
;stmt1:
  %5 = bitcast [6 x %Nat8]* @func124_str1 to %Str
  call void (%Str, %Nat8, %Str) @txt (%Str %5, %Nat8 35, %Str %0)
  br label %endif_0
else_0:
;stmt2:
  %6 = bitcast [6 x %Nat8]* @func124_str2 to %Str
  call void (%Str, %Nat8, %TokenInfo*, %Str) @txti (%Str %6, %Nat8 35, %TokenInfo* %1, %Str %0)
;stmt3:
  call void (%TokenInfo*) @func127 (%TokenInfo* %1)
  br label %endif_0
endif_0:
;stmt4:
  %7 = bitcast [2 x %Nat8]* @func124_str3 to %Str
  %8 = call %Int32 (%Str, ...) @printf (%Str %7)
;stmt5:
  %9 = load %Int32, %Int32* @errcnt
  %10 = add %Int32 %9, 1
  store %Int32 %10, %Int32* @errcnt, align 4
;stmt6:
  %11 = load %Int32, %Int32* @errcnt
  %12 = icmp sgt %Int32 %11, 20
  br i1 %12, label %then_1, label %else_1
then_1:
;stmt7:
  %13 = bitcast [14 x %Nat8]* @func124_str4 to %Str
  %14 = call %Int32 (%Str, ...) @printf (%Str %13)
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
  %3 = bitcast [17 x %Nat8]* @func125_str1 to %Str
  %4 = call %Int32 (%Str, ...) @printf (%Str %3, %Int64 27, %Int64 33, %Str %0, %Int64 27)
;stmt1:; loadImmPtr
  %5 = inttoptr i64 0 to%TokenInfo*
  %6 = icmp ne %TokenInfo* %1, %5
  br i1 %6, label %then_0, label %else_0
then_0:
;stmt2:
  call void (%TokenInfo*) @func127 (%TokenInfo* %1)
;stmt3:
  %7 = bitcast [2 x %Nat8]* @func125_str2 to %Str
  %8 = call %Int32 (%Str, ...) @printf (%Str %7)
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
  %25 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func126_str1, i1 0, %Int64 0
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
  %32 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func126_str2, i1 0, %Int64 0
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

define void @func127 (%TokenInfo*) {
;stmt0:
  %2 = bitcast [2 x %Nat8]* @func127_str1 to %Str
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
  %10 = bitcast [3 x %Nat8]* @func127_str2 to %Str
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
  %18 = bitcast [2 x %Nat8]* @func127_str3 to %Str
  %19 = call %Int32 (%Str, ...) @printf (%Str %18)
;stmt8:
  %20 = load %Nat16, %Nat16* %13
  %21 = add %Nat16 %20, 1
  store %Nat16 %21, %Nat16* %13, align 2
  br label %continue_0
break_0:
;stmt9:
  %22 = bitcast [15 x %Nat8]* @func127_str4 to %Str
  %23 = call %Int32 (%Str, ...) @printf (%Str %22, %Int64 27, %Int64 32, %Int64 27)
  ret void
}

define void @fatal (%Str) {
;stmt0:
  %2 = bitcast [6 x %Nat8]* @func128_str1 to %Str
  call void (%Str, %Nat8, %Str) @txt (%Str %2, %Nat8 31, %Str %0)
;stmt1:
  call void (%Int32) @exit (%Int32 1)
  ret void
}

define void @error_type_error (%TokenInfo*, %Type*, %Type*) {
;stmt0:
  %4 = bitcast [11 x %Nat8]* @func129_str1 to %Str
  call void (%Str, %TokenInfo*) @error (%Str %4, %TokenInfo* %0)
;stmt1:; loadImmPtr
  %5 = inttoptr i64 0 to%Type*
  %6 = icmp ne %Type* %2, %5
  br i1 %6, label %then_0, label %else_0
then_0:
;stmt2:
  %7 = bitcast [16 x %Nat8]* @func129_str2 to %Str
  %8 = call %Int32 (%Str, ...) @printf (%Str %7)
;stmt3:
  call void (%Type*) @func81 (%Type* %2)
;stmt4:
  %9 = bitcast [2 x %Nat8]* @func129_str3 to %Str
  %10 = call %Int32 (%Str, ...) @printf (%Str %9)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt5:; loadImmPtr
  %11 = inttoptr i64 0 to%Type*
  %12 = icmp ne %Type* %1, %11
  br i1 %12, label %then_1, label %else_1
then_1:
;stmt6:
  %13 = bitcast [16 x %Nat8]* @func129_str4 to %Str
  %14 = call %Int32 (%Str, ...) @printf (%Str %13)
;stmt7:
  call void (%Type*) @func81 (%Type* %1)
;stmt8:
  %15 = bitcast [2 x %Nat8]* @func129_str5 to %Str
  %16 = call %Int32 (%Str, ...) @printf (%Str %15)
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

define void @func132 (%Index*) {
;stmt0:
  %2 = getelementptr inbounds %Index, %Index* %0, i1 0, i32 0
  call void (%List*) @map_init (%List* %2)
;stmt1:
  %3 = getelementptr inbounds %Index, %Index* %0, i1 0, i32 1
  call void (%List*) @map_init (%List* %3)
  ret void
}

define void @func133 (%Index*, %Index*) {
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

define void @func134 (%Index*, %Str, %Type*) {
;stmt0:
  %4 = getelementptr inbounds %Index, %Index* %0, i1 0, i32 0
  %5 = bitcast %Type* %2 to %Unit*
  %6 = call i1 (%List*, %Str, %Unit*) @map_append (%List* %4, %Str %1, %Unit* %5)
  ret void
}

define void @func135 (%Index*, %Str, %Value*) {
;stmt0:
  %4 = getelementptr inbounds %Index, %Index* %0, i1 0, i32 1
  %5 = bitcast %Value* %2 to %Unit*
  %6 = call i1 (%List*, %Str, %Unit*) @map_append (%List* %4, %Str %1, %Unit* %5)
  ret void
}

define %Type* @func136 (%Index*, %Str) {
;stmt0:
  %3 = getelementptr inbounds %Index, %Index* %0, i1 0, i32 0
  %4 = call %Unit* (%List*, %Str) @map_get (%List* %3, %Str %1)
  %5 = bitcast %Unit* %4 to %Type*
  ret %Type* %5
}

define %Value* @func137 (%Index*, %Str) {
;stmt0:
  %3 = getelementptr inbounds %Index, %Index* %0, i1 0, i32 1
  %4 = call %Unit* (%List*, %Str) @map_get (%List* %3, %Str %1)
  %5 = bitcast %Unit* %4 to %Value*
  ret %Value* %5
}

define %Value* @func138 (%Str) {
;stmt0:
  %2 = load %Module*, %Module** @module
  %3 = getelementptr inbounds %Module, %Module* %2, i1 0, i32 0
  %4 = call %Value* (%Index*, %Str) @func137 (%Index* %3, %Str %0)
;stmt1:; loadImmPtr
  %5 = inttoptr i64 0 to%Value*
  %6 = icmp ne %Value* %4, %5
  br i1 %6, label %then_0, label %else_0
then_0:
;stmt2:
  ret %Value* %4
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt3:
  %8 = load %Module*, %Module** @module
  %9 = getelementptr inbounds %Module, %Module* %8, i1 0, i32 1
  %10 = call %Value* (%Index*, %Str) @func137 (%Index* %9, %Str %0)
  ret %Value* %10
}

define %Value* @func140 (%Str, %StmtBlock*) {
;stmt0:; loadImmPtr
  %3 = inttoptr i64 0 to%StmtBlock*
  %4 = icmp eq %StmtBlock* %1, %3
  br i1 %4, label %then_0, label %else_0
then_0:
;stmt1:; loadImmPtr
  %5 = inttoptr i64 0 to%Value*
  ret %Value* %5
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt2:
  %7 = getelementptr inbounds %StmtBlock, %StmtBlock* %1, i1 0, i32 1
  %8 = call %Value* (%Index*, %Str) @func137 (%Index* %7, %Str %0)
;stmt3:; loadImmPtr
  %9 = inttoptr i64 0 to%Value*
  %10 = icmp ne %Value* %8, %9
  br i1 %10, label %then_1, label %else_1
then_1:
;stmt4:
  ret %Value* %8
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt5:
  %12 = getelementptr inbounds %StmtBlock, %StmtBlock* %1, i1 0, i32 0
  %13 = load %StmtBlock*, %StmtBlock** %12
  %14 = call %Value* (%Str, %StmtBlock*) @func140 (%Str %0, %StmtBlock* %13)
  ret %Value* %14
}

define %Value* @func139 (%Str) {
;stmt0:
  %2 = load %FuncContext*, %FuncContext** @fctx; loadImmPtr
  %3 = inttoptr i64 0 to%FuncContext*
  %4 = icmp ne %FuncContext* %2, %3
  br i1 %4, label %then_0, label %else_0
then_0:
;stmt1:
  %5 = load %FuncContext*, %FuncContext** @fctx
  %6 = getelementptr inbounds %FuncContext, %FuncContext* %5, i1 0, i32 2
  %7 = load %StmtBlock*, %StmtBlock** %6
  %8 = call %Value* (%Str, %StmtBlock*) @func140 (%Str %0, %StmtBlock* %7)
;stmt2:; loadImmPtr
  %9 = inttoptr i64 0 to%Value*
  %10 = icmp ne %Value* %8, %9
  br i1 %10, label %then_1, label %else_1
then_1:
;stmt3:
  ret %Value* %8
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt4:
  %12 = call %Value* (%Str) @func138 (%Str %0)
;stmt5:; loadImmPtr
  %13 = inttoptr i64 0 to%Value*
  %14 = icmp ne %Value* %12, %13
  br i1 %14, label %then_2, label %else_2
then_2:
;stmt6:
  ret %Value* %12
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
;stmt7:
  %16 = getelementptr inbounds %Index, %Index* @builtinIndex, i1 0
  %17 = call %Value* (%Index*, %Str) @func137 (%Index* %16, %Str %0)
;stmt8:; loadImmPtr
  %18 = inttoptr i64 0 to%Value*
  %19 = icmp ne %Value* %17, %18
  br i1 %19, label %then_3, label %else_3
then_3:
;stmt9:
  ret %Value* %17
  br label %endif_3
else_3:
  br label %endif_3
endif_3:
;stmt10:
  %21 = load %FuncContext*, %FuncContext** @fctx; loadImmPtr
  %22 = inttoptr i64 0 to%FuncContext*
  %23 = icmp ne %FuncContext* %21, %22
  br i1 %23, label %then_4, label %else_4
then_4:
;stmt11:
  %24 = bitcast [5 x %Nat8]* @func139_str1 to %Str
  %25 = call %Int32 (%Str, %Str) @strcmp (%Str %0, %Str %24)
  %26 = icmp eq %Int32 %25, 0
  br i1 %26, label %then_5, label %else_5
then_5:
;stmt12:
  %27 = load %FuncContext*, %FuncContext** @fctx
  %28 = getelementptr inbounds %FuncContext, %FuncContext* %27, i1 0, i32 1
  %29 = load %Value*, %Value** %28
  ret %Value* %29
  br label %endif_5
else_5:
  br label %endif_5
endif_5:
  br label %endif_4
else_4:
  br label %endif_4
endif_4:
;stmt13:; loadImmPtr
  %31 = inttoptr i64 0 to%Value*
  ret %Value* %31
}

define void @func141 (%Index*, %Str, %Value*) {
;stmt0:
  %4 = call %Value* (%Index*, %Str) @func137 (%Index* %0, %Str %1)
;stmt1:; loadImmPtr
  %5 = inttoptr i64 0 to%Value*
  %6 = icmp ne %Value* %4, %5
  br i1 %6, label %then_0, label %else_0
then_0:
;stmt2:
  %7 = getelementptr inbounds %Value, %Value* %4, i1 0, i32 0
  %8 = load %ValueKind, %ValueKind* %7
  %9 = icmp ne %ValueKind %8, 2
  br i1 %9, label %then_1, label %else_1
then_1:
;stmt3:
  %10 = bitcast [35 x %Nat8]* @func141_str1 to %Str
  %11 = getelementptr inbounds %Value, %Value* %2, i1 0, i32 19
  %12 = load %TokenInfo*, %TokenInfo** %11
  call void (%Str, %TokenInfo*) @error (%Str %10, %TokenInfo* %12)
;stmt4:
  %13 = bitcast [19 x %Nat8]* @func141_str2 to %Str
  %14 = getelementptr inbounds %Value, %Value* %4, i1 0, i32 19
  %15 = load %TokenInfo*, %TokenInfo** %14
  call void (%Str, %TokenInfo*) @warning (%Str %13, %TokenInfo* %15)
;stmt5:
ret void
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt6:
  %17 = bitcast %Value* %4 to %Unit*
  %18 = bitcast %Value* %2 to %Unit*
  %19 = call %Unit* (%Unit*, %Unit*, %Nat32) @memcpy (%Unit* %17, %Unit* %18, %Nat32 520)
;stmt7:
ret void
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt8:
  call void (%Index*, %Str, %Value*) @func135 (%Index* %0, %Str %1, %Value* %2)
  ret void
}

define void @func142 (%StmtBlock*, %Str, %Value*) {
;stmt0:
  %4 = getelementptr inbounds %StmtBlock, %StmtBlock* %0, i1 0, i32 1
  call void (%Index*, %Str, %Value*) @func141 (%Index* %4, %Str %1, %Value* %2)
  ret void
}

define void @func143 (%Str, %Value*) {
;stmt0:
  %3 = load %FuncContext*, %FuncContext** @fctx
  %4 = getelementptr inbounds %FuncContext, %FuncContext* %3, i1 0, i32 2
  %5 = load %StmtBlock*, %StmtBlock** %4
  call void (%StmtBlock*, %Str, %Value*) @func142 (%StmtBlock* %5, %Str %0, %Value* %1)
  ret void
}

define void @func144 (%Str, %Value*) {
;stmt0:
  %3 = load %Module*, %Module** @module
  %4 = getelementptr inbounds %Module, %Module* %3, i1 0, i32 0
  call void (%Index*, %Str, %Value*) @func141 (%Index* %4, %Str %0, %Value* %1)
  ret void
}

define void @func145 (%Index*, %Str, %Type*) {
;stmt0:
  call void (%Index*, %Str, %Type*) @func134 (%Index* %0, %Str %1, %Type* %2)
  ret void
}

define %Type* @func146 (%Str) {
;stmt0:
  %2 = load %Module*, %Module** @module
  %3 = getelementptr inbounds %Module, %Module* %2, i1 0, i32 0
  %4 = call %Type* (%Index*, %Str) @func136 (%Index* %3, %Str %0)
;stmt1:; loadImmPtr
  %5 = inttoptr i64 0 to%Type*
  %6 = icmp ne %Type* %4, %5
  br i1 %6, label %then_0, label %else_0
then_0:
;stmt2:
  ret %Type* %4
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt3:
  %8 = load %Module*, %Module** @module
  %9 = getelementptr inbounds %Module, %Module* %8, i1 0, i32 1
  %10 = call %Type* (%Index*, %Str) @func136 (%Index* %9, %Str %0)
  ret %Type* %10
}

define %Type* @func148 (%Str, %StmtBlock*) {
;stmt0:; loadImmPtr
  %3 = inttoptr i64 0 to%StmtBlock*
  %4 = icmp eq %StmtBlock* %1, %3
  br i1 %4, label %then_0, label %else_0
then_0:
;stmt1:; loadImmPtr
  %5 = inttoptr i64 0 to%Type*
  ret %Type* %5
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt2:
  %7 = getelementptr inbounds %StmtBlock, %StmtBlock* %1, i1 0, i32 1
  %8 = call %Type* (%Index*, %Str) @func136 (%Index* %7, %Str %0)
;stmt3:; loadImmPtr
  %9 = inttoptr i64 0 to%Type*
  %10 = icmp ne %Type* %8, %9
  br i1 %10, label %then_1, label %else_1
then_1:
;stmt4:
  ret %Type* %8
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt5:
  %12 = getelementptr inbounds %StmtBlock, %StmtBlock* %1, i1 0, i32 0
  %13 = load %StmtBlock*, %StmtBlock** %12
  %14 = call %Type* (%Str, %StmtBlock*) @func148 (%Str %0, %StmtBlock* %13)
  ret %Type* %14
}

define %Type* @func147 (%Str) {
;stmt0:
  %2 = getelementptr inbounds %Index, %Index* @builtinIndex, i1 0
  %3 = call %Type* (%Index*, %Str) @func136 (%Index* %2, %Str %0)
;stmt1:; loadImmPtr
  %4 = inttoptr i64 0 to%Type*
  %5 = icmp ne %Type* %3, %4
  br i1 %5, label %then_0, label %else_0
then_0:
;stmt2:
  ret %Type* %3
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt3:
  %7 = load %FuncContext*, %FuncContext** @fctx; loadImmPtr
  %8 = inttoptr i64 0 to%FuncContext*
  %9 = icmp ne %FuncContext* %7, %8
  br i1 %9, label %then_1, label %else_1
then_1:
;stmt4:
  %10 = load %FuncContext*, %FuncContext** @fctx
  %11 = getelementptr inbounds %FuncContext, %FuncContext* %10, i1 0, i32 2
  %12 = load %StmtBlock*, %StmtBlock** %11
  %13 = call %Type* (%Str, %StmtBlock*) @func148 (%Str %0, %StmtBlock* %12)
;stmt5:; loadImmPtr
  %14 = inttoptr i64 0 to%Type*
  %15 = icmp ne %Type* %13, %14
  br i1 %15, label %then_2, label %else_2
then_2:
;stmt6:
  ret %Type* %13
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt7:
  %17 = call %Type* (%Str) @func146 (%Str %0)
;stmt8:; loadImmPtr
  %18 = inttoptr i64 0 to%Type*
  %19 = icmp ne %Type* %17, %18
  br i1 %19, label %then_3, label %else_3
then_3:
;stmt9:
  ret %Type* %17
  br label %endif_3
else_3:
  br label %endif_3
endif_3:
;stmt10:
  %21 = bitcast [5 x %Nat8]* @func147_str1 to %Str
  %22 = call %Int32 (%Str, %Str) @strcmp (%Str %0, %Str %21)
  %23 = icmp eq %Int32 %22, 0
  br i1 %23, label %then_4, label %else_4
then_4:
;stmt11:
  %24 = load %Type*, %Type** @ctype
  ret %Type* %24
  br label %endif_4
else_4:
  br label %endif_4
endif_4:
;stmt12:; loadImmPtr
  %26 = inttoptr i64 0 to%Type*
  ret %Type* %26
}

define %Str @func149 (%Str, %Nat32) {
;stmt0:
  %3 = alloca [32 x %Nat8]
  store [32 x %Nat8] zeroinitializer, [32 x %Nat8]* %3, align 1
;stmt1:
; index array
  %4 = getelementptr inbounds [32 x %Nat8], [32 x %Nat8]* %3, i1 0, %Int64 0
  %5 = bitcast %Nat8* %4 to %Unit*
  %6 = bitcast [3 x %Nat8]* @func149_str1 to %Str
  %7 = call %Int32 (%Unit*, %Str, ...) @sprintf (%Unit* %5, %Str %6, %Nat32 %1)
;stmt2:
; index array
  %8 = getelementptr inbounds [32 x %Nat8], [32 x %Nat8]* %3, i1 0, %Int64 0
  %9 = bitcast %Nat8* %8 to %Str
  %10 = call %Str (%Str, %Str) @cat (%Str %0, %Str %9)
  ret %Str %10
}

define %Str @func150 () {
;stmt0:
  %1 = load %Nat32, %Nat32* @local_type_id_cnt
  %2 = add %Nat32 %1, 1
  store %Nat32 %2, %Nat32* @local_type_id_cnt, align 4
;stmt1:
  %3 = load %FuncContext*, %FuncContext** @fctx
  %4 = getelementptr inbounds %FuncContext, %FuncContext* %3, i1 0, i32 0
  %5 = load %Str, %Str* %4
  %6 = bitcast [6 x %Nat8]* @func150_str1 to %Str
  %7 = call %Str (%Str, %Str) @cat (%Str %5, %Str %6)
;stmt2:
  %8 = load %Nat32, %Nat32* @local_type_id_cnt
  %9 = call %Str (%Str, %Nat32) @func149 (%Str %7, %Nat32 %8)
  ret %Str %9
}

define %Str @func151 () {
;stmt0:
  %1 = load %FuncContext*, %FuncContext** @fctx; loadImmPtr
  %2 = inttoptr i64 0 to%FuncContext*
  %3 = icmp ne %FuncContext* %1, %2
  br i1 %3, label %then_0, label %else_0
then_0:
;stmt1:
  %4 = load %FuncContext*, %FuncContext** @fctx
  %5 = getelementptr inbounds %FuncContext, %FuncContext* %4, i1 0, i32 0
  %6 = load %Str, %Str* %5
  %7 = bitcast [2 x %Nat8]* @func151_str1 to %Str
  %8 = call %Str (%Str, %Str) @cat (%Str %6, %Str %7)
  ret %Str %8
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt2:
  %10 = bitcast [1 x %Nat8]* @func151_str2 to %Str
  ret %Str %10
}

define %Str @func152 (%Str, %Nat32*) {
;stmt0:
  %3 = call %Str () @func151 ()
;stmt1:
  %4 = load %Nat32, %Nat32* %1
  %5 = add %Nat32 %4, 1
  store %Nat32 %5, %Nat32* %1, align 4
;stmt2:
  %6 = load %Nat32, %Nat32* %1
  %7 = call %Str (%Str, %Nat32) @func149 (%Str %0, %Nat32 %6)
;stmt3:
  %8 = call %Str (%Str, %Str) @cat (%Str %3, %Str %7)
  ret %Str %8
}

define %Str @func153 () {
;stmt0:
  %1 = bitcast [5 x %Nat8]* @func153_str1 to %Str
  %2 = getelementptr inbounds %Nat32, %Nat32* @func_uid, i1 0
  %3 = call %Str (%Str, %Nat32*) @func152 (%Str %1, %Nat32* %2)
  ret %Str %3
}

define %Str @func154 () {
;stmt0:
  %1 = load %FuncContext*, %FuncContext** @fctx; loadImmPtr
  %2 = inttoptr i64 0 to%FuncContext*
  %3 = icmp ne %FuncContext* %1, %2
  br i1 %3, label %then_0, label %else_0
then_0:
;stmt1:
  %4 = bitcast [4 x %Nat8]* @func154_str1 to %Str
  %5 = load %FuncContext*, %FuncContext** @fctx
  %6 = getelementptr inbounds %FuncContext, %FuncContext* %5, i1 0, i32 5
  %7 = call %Str (%Str, %Nat32*) @func152 (%Str %4, %Nat32* %6)
  ret %Str %7
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt2:
  %9 = bitcast [4 x %Nat8]* @func154_str2 to %Str
  %10 = getelementptr inbounds %Nat32, %Nat32* @str_uid, i1 0
  %11 = call %Str (%Str, %Nat32*) @func152 (%Str %9, %Nat32* %10)
  ret %Str %11
}

define %Str @func155 () {
;stmt0:
  %1 = bitcast [4 x %Nat8]* @func155_str1 to %Str
  %2 = getelementptr inbounds %Nat32, %Nat32* @arr_uid, i1 0
  %3 = call %Str (%Str, %Nat32*) @func152 (%Str %1, %Nat32* %2)
  ret %Str %3
}

define %Str @func156 () {
;stmt0:
  %1 = bitcast [4 x %Nat8]* @func156_str1 to %Str
  %2 = getelementptr inbounds %Nat32, %Nat32* @var_uid, i1 0
  %3 = call %Str (%Str, %Nat32*) @func152 (%Str %1, %Nat32* %2)
  ret %Str %3
}

define %Str @func157 () {
;stmt0:
  %1 = bitcast [5 x %Nat8]* @func157_str1 to %Str
  %2 = getelementptr inbounds %Nat32, %Nat32* @type_uid, i1 0
  %3 = call %Str (%Str, %Nat32*) @func152 (%Str %1, %Nat32* %2)
  ret %Str %3
}

define i1 @func159 (%Unit*, %Unit*, %Nat32) {
;stmt0:
  %4 = bitcast %Unit* %0 to %Type*
;stmt1:
  %5 = bitcast %Unit* %1 to %Type*
;stmt2:
  %6 = call i1 (%Type*, %Type*) @func426 (%Type* %4, %Type* %5)
  ret i1 %6
}

define i1 @func158 (%List*, %Type*) {
;stmt0:
  %3 = bitcast %Type* %1 to %Unit*
  %4 = call %Unit* (%List*, %ListSearchHandler, %Unit*) @list_search (%List* %0, %ListSearchHandler @func159, %Unit* %3); loadImmPtr
  %5 = inttoptr i64 0 to%Unit*
  %6 = icmp ne %Unit* %4, %5
  ret i1 %6
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
  %11 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func160_str1, i1 0, %Int64 0
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
  %4 = bitcast [11 x %Nat8]* @func163_str1 to %Str
  %5 = call %Int32 (%Str, ...) @printf (%Str %4, %Str %0)
;stmt2:
  %6 = bitcast [17 x %Nat8]* @func163_str2 to %Str
  call void (%Str) @fatal (%Str %6)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt3:
  %7 = call %Int32 (%Str, %Int32) @open (%Str %0, %Int32 0)
;stmt4:
  %8 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 0
  store %Int32 %7, %Int32* %8, align 4
;stmt5:
  %9 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 4
  store %Nat16 1, %Nat16* %9, align 2
;stmt6:
  %10 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 5
  %11 = insertvalue %TokenInfo zeroinitializer, %Str %0, 0
  %12 = insertvalue %TokenInfo %11, %Nat32 1, 3
  store %TokenInfo %12, %TokenInfo* %10, align 8
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
  %4 = bitcast [10 x %Nat8]* @func165_str1 to %Str
  %5 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 5
  %6 = getelementptr inbounds %TokenInfo, %TokenInfo* %5, i1 0, i32 0
  %7 = load %Str, %Str* %6
  %8 = call %Int32 (%Str, ...) @printf (%Str %4, %Str %7)
;stmt4:
  %9 = bitcast [23 x %Nat8]* @func165_str2 to %Str
  call void (%Str) @fatal (%Str %9)
;stmt5:
  call void (%Int32) @exit (%Int32 1)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt6:
  %10 = call i1 (%Nat8) %0 (%Nat8 %2)
  br i1 %10, label %then_1, label %else_1
then_1:
;stmt7:
  %11 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 2
  %12 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 5
  %13 = getelementptr inbounds %TokenInfo, %TokenInfo* %12, i1 0, i32 2
  %14 = load %Nat16, %Nat16* %13
; index array
  %15 = getelementptr inbounds [255 x %Nat8], [255 x %Nat8]* %11, i1 0, %Nat16 %14
  store %Nat8 %2, %Nat8* %15, align 1
;stmt8:
  %16 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 5
  %17 = getelementptr inbounds %TokenInfo, %TokenInfo* %16, i1 0, i32 2
  %18 = load %Nat16, %Nat16* %17
  %19 = icmp uge %Nat16 %18, 254
  br i1 %19, label %then_2, label %else_2
then_2:
;stmt9:
  %20 = bitcast [16 x %Nat8]* @func165_str3 to %Str
  call void (%Str) @fatal (%Str %20)
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
;stmt10:
  %21 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 5
  %22 = getelementptr inbounds %TokenInfo, %TokenInfo* %21, i1 0, i32 2
  %23 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 5
  %24 = getelementptr inbounds %TokenInfo, %TokenInfo* %23, i1 0, i32 2
  %25 = load %Nat16, %Nat16* %24
  %26 = add %Nat16 %25, 1
  store %Nat16 %26, %Nat16* %22, align 2
  br label %endif_1
else_1:
;stmt11:
  call void (%Nat8) @func185 (%Nat8 %2)
;stmt12:
  %27 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 2
  %28 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 5
  %29 = getelementptr inbounds %TokenInfo, %TokenInfo* %28, i1 0, i32 2
  %30 = load %Nat16, %Nat16* %29
; index array
  %31 = getelementptr inbounds [255 x %Nat8], [255 x %Nat8]* %27, i1 0, %Nat16 %30
  store %Nat8 0, %Nat8* %31, align 1
;stmt13:
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
  %2 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func166_str1, i1 0, %Int64 0
  %3 = load %Nat8, %Nat8* %2
  %4 = icmp eq %Nat8 %0, %3
; index array
  %5 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func166_str2, i1 0, %Int64 0
  %6 = load %Nat8, %Nat8* %5
  %7 = icmp eq %Nat8 %0, %6
  %8 = or i1 %4, %7
  ret i1 %8
}

define i1 @minus (%Nat8) {
;stmt0:
; index array
  %2 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func167_str1, i1 0, %Int64 0
  %3 = load %Nat8, %Nat8* %2
  %4 = icmp eq %Nat8 %0, %3
  ret i1 %4
}

define i1 @slash (%Nat8) {
;stmt0:
; index array
  %2 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func168_str1, i1 0, %Int64 0
  %3 = load %Nat8, %Nat8* %2
  %4 = icmp eq %Nat8 %0, %3
; index array
  %5 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func168_str2, i1 0, %Int64 0
  %6 = load %Nat8, %Nat8* %5
  %7 = icmp eq %Nat8 %0, %6
  %8 = or i1 %4, %7
  ret i1 %8
}

define i1 @rarrow (%Nat8) {
;stmt0:
; index array
  %2 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func169_str1, i1 0, %Int64 0
  %3 = load %Nat8, %Nat8* %2
  %4 = icmp eq %Nat8 %0, %3
; index array
  %5 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func169_str2, i1 0, %Int64 0
  %6 = load %Nat8, %Nat8* %5
  %7 = icmp eq %Nat8 %0, %6
  %8 = or i1 %4, %7
  ret i1 %8
}

define i1 @larrow (%Nat8) {
;stmt0:
; index array
  %2 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func170_str1, i1 0, %Int64 0
  %3 = load %Nat8, %Nat8* %2
  %4 = icmp eq %Nat8 %0, %3
; index array
  %5 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func170_str2, i1 0, %Int64 0
  %6 = load %Nat8, %Nat8* %5
  %7 = icmp eq %Nat8 %0, %6
  %8 = or i1 %4, %7
  ret i1 %8
}

define i1 @eq (%Nat8) {
;stmt0:
; index array
  %2 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func171_str1, i1 0, %Int64 0
  %3 = load %Nat8, %Nat8* %2
  %4 = icmp eq %Nat8 %0, %3
; index array
  %5 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func171_str2, i1 0, %Int64 0
  %6 = load %Nat8, %Nat8* %5
  %7 = icmp eq %Nat8 %0, %6
  %8 = or i1 %4, %7
  ret i1 %8
}

define i1 @ass (%Nat8) {
;stmt0:
; index array
  %2 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func172_str1, i1 0, %Int64 0
  %3 = load %Nat8, %Nat8* %2
  %4 = icmp eq %Nat8 %0, %3
  ret i1 %4
}

define i1 @bang (%Nat8) {
;stmt0:
; index array
  %2 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func173_str1, i1 0, %Int64 0
  %3 = load %Nat8, %Nat8* %2
  %4 = icmp eq %Nat8 %0, %3
  ret i1 %4
}

define i1 @id (%Nat8) {
;stmt0:
  %2 = call i1 (%Nat8) @isAlNum (%Nat8 %0)
; index array
  %3 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func174_str1, i1 0, %Int64 0
  %4 = load %Nat8, %Nat8* %3
  %5 = icmp eq %Nat8 %0, %4
; index array
  %6 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func174_str2, i1 0, %Int64 0
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
  %2 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func176_str1, i1 0, %Int64 0
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

define void @func180 () {
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
  call void () @func184 ()
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
  %32 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func179_str1, i1 0, %Int64 0
  %33 = load %Nat8, %Nat8* %32
  %34 = icmp eq %Nat8 %31, %33
  %35 = load %Nat8, %Nat8* %1
; index array
  %36 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func179_str2, i1 0, %Int64 0
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
  %47 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func179_str3, i1 0, %Int64 0
  %48 = load %Nat8, %Nat8* %47
  %49 = icmp eq %Nat8 %46, %48
  br i1 %49, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  call void () @x_nl ()
  br label %select_1_end
select_1_1:
; index array
  %50 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func179_str4, i1 0, %Int64 0
  %51 = load %Nat8, %Nat8* %50
  %52 = icmp eq %Nat8 %46, %51
  br i1 %52, label %select_1_1_ok, label %select_1_2
select_1_1_ok:
  call void (%Rule) @fill (%Rule @ass)
  br label %select_1_end
select_1_2:
; index array
  %53 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func179_str5, i1 0, %Int64 0
  %54 = load %Nat8, %Nat8* %53
  %55 = icmp eq %Nat8 %46, %54
  br i1 %55, label %select_1_2_ok, label %select_1_3
select_1_2_ok:
  call void (%Rule) @fill (%Rule @eq)
  br label %select_1_end
select_1_3:
; index array
  %56 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func179_str6, i1 0, %Int64 0
  %57 = load %Nat8, %Nat8* %56
  %58 = icmp eq %Nat8 %46, %57
  br i1 %58, label %select_1_3_ok, label %select_1_4
select_1_3_ok:
  call void (%Rule) @fill (%Rule @minus)
  br label %select_1_end
select_1_4:
; index array
  %59 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func179_str7, i1 0, %Int64 0
  %60 = load %Nat8, %Nat8* %59
  %61 = icmp eq %Nat8 %46, %60
  br i1 %61, label %select_1_4_ok, label %select_1_5
select_1_4_ok:
  call void () @func181 ()
  br label %select_1_end
select_1_5:
; index array
  %62 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func179_str8, i1 0, %Int64 0
  %63 = load %Nat8, %Nat8* %62
  %64 = icmp eq %Nat8 %46, %63
  br i1 %64, label %select_1_5_ok, label %select_1_6
select_1_5_ok:
  call void (%Rule) @fill (%Rule @rarrow)
  br label %select_1_end
select_1_6:
; index array
  %65 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func179_str9, i1 0, %Int64 0
  %66 = load %Nat8, %Nat8* %65
  %67 = icmp eq %Nat8 %46, %66
  br i1 %67, label %select_1_6_ok, label %select_1_7
select_1_6_ok:
  call void (%Rule) @fill (%Rule @larrow)
  br label %select_1_end
select_1_7:
; index array
  %68 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func179_str10, i1 0, %Int64 0
  %69 = load %Nat8, %Nat8* %68
  %70 = icmp eq %Nat8 %46, %69
  br i1 %70, label %select_1_7_ok, label %select_1_8
select_1_7_ok:
  call void (%Rule) @fill (%Rule @bang)
  br label %select_1_end
select_1_8:
; index array
  %71 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func179_str11, i1 0, %Int64 0
  %72 = load %Nat8, %Nat8* %71
  %73 = icmp eq %Nat8 %46, %72
  br i1 %73, label %select_1_8_ok, label %select_1_9
select_1_8_ok:
  call void () @func182 ()
  br label %select_1_end
select_1_9:
  %74 = icmp eq %Nat8 %46, 0
  br i1 %74, label %select_1_9_ok, label %select_1_10
select_1_9_ok:
  call void () @x_eof ()
  br label %select_1_end
select_1_10:
  call void () @func180 ()
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

define void @func181 () {
;stmt0:
  %1 = alloca %Nat8
  store %Nat8 0, %Nat8* %1, align 1
;stmt1:
  %2 = call %Nat8 () @getcc ()
;stmt2:
; index array
  %3 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func181_str1, i1 0, %Int64 0
  %4 = load %Nat8, %Nat8* %3
  %5 = icmp eq %Nat8 %2, %4
  br i1 %5, label %then_0, label %else_0
then_0:
;stmt3:
  call void (%Nat8) @func185 (%Nat8 %2)
;stmt4:
  call void (%Rule) @fill (%Rule @cpp_com)
;stmt5:
  %6 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 1
  store %TokenKind 5, %TokenKind* %6, align 2
  br label %endif_0
else_0:
;stmt6:
; index array
  %7 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func181_str2, i1 0, %Int64 0
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
  %16 = bitcast [23 x %Nat8]* @func181_str3 to %Str
  call void (%Str) @fatal (%Str %16)
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
;stmt13:
  %17 = load %Nat8, %Nat8* %1
; index array
  %18 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func181_str4, i1 0, %Int64 0
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
  %23 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func181_str5, i1 0, %Int64 0
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
  call void (%Nat8) @func185 (%Nat8 %32)
  br label %endif_4
endif_4:
  br label %endif_3
else_3:
;stmt19:
  %33 = load %Nat8, %Nat8* %1
; index array
  %34 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func181_str6, i1 0, %Int64 0
  %35 = load %Nat8, %Nat8* %34
  %36 = icmp eq %Nat8 %33, %35
  br i1 %36, label %then_5, label %else_5
then_5:
;stmt20:
  call void () @func184 ()
  br label %endif_5
else_5:
  br label %endif_5
endif_5:
  br label %endif_3
endif_3:
  br label %continue_0
break_0:
  br label %endif_1
else_1:
;stmt21:
  call void (%Nat8) @func185 (%Nat8 %2)
;stmt22:
  call void (%Rule) @fill (%Rule @slash)
  br label %endif_1
endif_1:
  br label %endif_0
endif_0:
  ret void
}

define void @func182 () {
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
  %7 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func182_str1, i1 0, %Int64 0
  %8 = load %Nat8, %Nat8* %7
  %9 = icmp eq %Nat8 %6, %8
  br i1 %9, label %then_0, label %else_0
then_0:
;stmt6:
  br label %break_0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt7:
  %11 = load %Nat8, %Nat8* %1
  %12 = icmp eq %Nat8 %11, 0
  br i1 %12, label %then_1, label %else_1
then_1:
;stmt8:
  %13 = bitcast [23 x %Nat8]* @func182_str2 to %Str
  call void (%Str) @fatal (%Str %13)
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt9:
  %14 = load %Nat8, %Nat8* %1
; index array
  %15 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func182_str3, i1 0, %Int64 0
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
  %20 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func182_str4, i1 0, %Int64 0
  %21 = load %Nat8, %Nat8* %20
  %22 = icmp eq %Nat8 %19, %21
  br i1 %22, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
; index array
  %23 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func182_str5, i1 0, %Int64 0
  %24 = load %Nat8, %Nat8* %23
  br label %select_1_end
select_1_1:
; index array
  %25 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func182_str6, i1 0, %Int64 0
  %26 = load %Nat8, %Nat8* %25
  %27 = icmp eq %Nat8 %19, %26
  br i1 %27, label %select_1_1_ok, label %select_1_2
select_1_1_ok:
; index array
  %28 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func182_str7, i1 0, %Int64 0
  %29 = load %Nat8, %Nat8* %28
  br label %select_1_end
select_1_2:
; index array
  %30 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func182_str8, i1 0, %Int64 0
  %31 = load %Nat8, %Nat8* %30
  %32 = icmp eq %Nat8 %19, %31
  br i1 %32, label %select_1_2_ok, label %select_1_3
select_1_2_ok:
; index array
  %33 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func182_str9, i1 0, %Int64 0
  %34 = load %Nat8, %Nat8* %33
  br label %select_1_end
select_1_3:
; index array
  %35 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func182_str10, i1 0, %Int64 0
  %36 = load %Nat8, %Nat8* %35
  %37 = icmp eq %Nat8 %19, %36
  br i1 %37, label %select_1_3_ok, label %select_1_4
select_1_3_ok:
; index array
  %38 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func182_str11, i1 0, %Int64 0
  %39 = load %Nat8, %Nat8* %38
  br label %select_1_end
select_1_4:
; index array
  %40 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func182_str12, i1 0, %Int64 0
  %41 = load %Nat8, %Nat8* %40
  %42 = icmp eq %Nat8 %19, %41
  br i1 %42, label %select_1_4_ok, label %select_1_5
select_1_4_ok:
; index array
  %43 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func182_str13, i1 0, %Int64 0
  %44 = load %Nat8, %Nat8* %43
  br label %select_1_end
select_1_5:
; index array
  %45 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func182_str14, i1 0, %Int64 0
  %46 = load %Nat8, %Nat8* %45
  %47 = icmp eq %Nat8 %19, %46
  br i1 %47, label %select_1_5_ok, label %select_1_6
select_1_5_ok:
; index array
  %48 = getelementptr inbounds [1 x %Nat8], [1 x %Nat8]* @func182_str15, i1 0, %Int64 0
  %49 = load %Nat8, %Nat8* %48
  br label %select_1_end
select_1_6:
; index array
  %50 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func182_str16, i1 0, %Int64 0
  %51 = load %Nat8, %Nat8* %50
  %52 = icmp eq %Nat8 %19, %51
  br i1 %52, label %select_1_6_ok, label %select_1_7
select_1_6_ok:
; index array
  %53 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func182_str17, i1 0, %Int64 0
  %54 = load %Nat8, %Nat8* %53
  br label %select_1_end
select_1_7:
; index array
  %55 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func182_str18, i1 0, %Int64 0
  %56 = load %Nat8, %Nat8* %55
  %57 = icmp eq %Nat8 %19, %56
  br i1 %57, label %select_1_7_ok, label %select_1_8
select_1_7_ok:
; index array
  %58 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func182_str19, i1 0, %Int64 0
  %59 = load %Nat8, %Nat8* %58
  br label %select_1_end
select_1_8:
; index array
  %60 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func182_str20, i1 0, %Int64 0
  %61 = load %Nat8, %Nat8* %60
  %62 = icmp eq %Nat8 %19, %61
  br i1 %62, label %select_1_8_ok, label %select_1_9
select_1_8_ok:
; index array
  %63 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func182_str21, i1 0, %Int64 0
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
;stmt12:
  %67 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 5
  %68 = getelementptr inbounds %TokenInfo, %TokenInfo* %67, i1 0, i32 2
  %69 = load %Nat16, %Nat16* %68
  %70 = icmp uge %Nat16 %69, 254
  br i1 %70, label %then_3, label %else_3
then_3:
;stmt13:
  %71 = bitcast [17 x %Nat8]* @func182_str22 to %Str
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
;stmt16:
  %84 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 2
  %85 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 5
  %86 = getelementptr inbounds %TokenInfo, %TokenInfo* %85, i1 0, i32 2
  %87 = load %Nat16, %Nat16* %86
; index array
  %88 = getelementptr inbounds [255 x %Nat8], [255 x %Nat8]* %84, i1 0, %Nat16 %87
  store %Nat8 0, %Nat8* %88, align 1
;stmt17:
  %89 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 5
  %90 = getelementptr inbounds %TokenInfo, %TokenInfo* %89, i1 0, i32 2
  %91 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 5
  %92 = getelementptr inbounds %TokenInfo, %TokenInfo* %91, i1 0, i32 2
  %93 = load %Nat16, %Nat16* %92
  %94 = add %Nat16 %93, 1
  store %Nat16 %94, %Nat16* %90, align 2
  ret void
}

define %Source* @tokenize (%Str) {
;stmt0:
  %2 = call %Unit* (%Nat32) @malloc (%Nat32 32)
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
  %18 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 5
  %19 = load %TokenInfo, %TokenInfo* %18
  store %TokenInfo %19, %TokenInfo* %17, align 8
;stmt9:
  %20 = getelementptr inbounds %Token, %Token* %13, i1 0, i32 2
; index array
  %21 = getelementptr inbounds [0 x %Nat8], [0 x %Nat8]* %20, i1 0, %Int64 0
  %22 = bitcast %Nat8* %21 to %Unit*
  %23 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 2
; index array
  %24 = getelementptr inbounds [255 x %Nat8], [255 x %Nat8]* %23, i1 0, %Int64 0
  %25 = bitcast %Nat8* %24 to %Unit*
  %26 = zext %Nat16 %9 to %Nat32
  %27 = call %Unit* (%Unit*, %Unit*, %Nat32) @memcpy (%Unit* %22, %Unit* %25, %Nat32 %26)
;stmt10:
  %28 = getelementptr inbounds %Token, %Token* %13, i1 0, i32 2
  %29 = sub %Nat16 %9, 1
; index array
  %30 = getelementptr inbounds [0 x %Nat8], [0 x %Nat8]* %28, i1 0, %Nat16 %29
  store %Nat8 0, %Nat8* %30, align 1
;stmt11:
  %31 = getelementptr inbounds %Source, %Source* %3, i1 0, i32 0
  %32 = bitcast %Token* %13 to %Unit*
  %33 = call i1 (%List*, %Unit*) @list_append (%List* %31, %Unit* %32)
;stmt12:
  %34 = icmp eq %TokenKind %5, 0
  br i1 %34, label %then_0, label %else_0
then_0:
;stmt13:
  br label %break_0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  br label %continue_0
break_0:
;stmt14:
  %36 = load %Nat32, %Nat32* @lines
  %37 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 5
  %38 = getelementptr inbounds %TokenInfo, %TokenInfo* %37, i1 0, i32 3
  %39 = load %Nat32, %Nat32* %38
  %40 = add %Nat32 %36, %39
  store %Nat32 %40, %Nat32* @lines, align 4
;stmt15:
  ret %Source* %3
}

define void @func184 () {
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

define void @func185 (%Nat8) {
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
  %1 = bitcast [2 x %Nat8]* @func189_str1 to %Str
  %2 = call i1 (%Str) @func198 (%Str %1)
  br i1 %2, label %body_0, label %break_0
body_0:
  br label %continue_0
break_0:
  ret void
}

define %Token* @func190 () {
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
  %10 = call %Token* () @func190 ()
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
  %1 = call %Token* () @func190 ()
  %2 = getelementptr inbounds %Token, %Token* %1, i1 0, i32 0
  %3 = load %TokenKind, %TokenKind* %2
  %4 = icmp eq %TokenKind %3, 0
  ret i1 %4
}

define %Token* @nextok () {
;stmt0:
  %1 = call %Node* () @gett ()
  %2 = getelementptr inbounds %Node, %Node* %1, i1 0, i32 1
  %3 = load %Node*, %Node** %2; loadImmPtr
  %4 = inttoptr i64 0 to%Node*
  %5 = icmp ne %Node* %3, %4
  br i1 %5, label %then_0, label %else_0
then_0:
;stmt1:
  %6 = call %Node* () @gett ()
  %7 = getelementptr inbounds %Node, %Node* %6, i1 0, i32 1
  %8 = load %Node*, %Node** %7
  %9 = getelementptr inbounds %Node, %Node* %8, i1 0, i32 3
  %10 = load %Unit*, %Unit** %9
  %11 = bitcast %Unit* %10 to %Token*
  ret %Token* %11
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt2:; loadImmPtr
  %13 = inttoptr i64 0 to%Token*
  ret %Token* %13
}

define i1 @need_sep () {
;stmt0:
  %1 = call %Token* () @func190 ()
;stmt1:
  %2 = call i1 () @func194 ()
;stmt2:
  %3 = icmp eq i1 %2, 0
  br i1 %3, label %then_0, label %else_0
then_0:
;stmt3:
  %4 = bitcast [19 x %Nat8]* @func193_str1 to %Str
  %5 = getelementptr inbounds %Token, %Token* %1, i1 0, i32 1
  call void (%Str, %TokenInfo*) @error (%Str %4, %TokenInfo* %5)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt4:
  ret i1 %2
}

define i1 @func194 () {
;stmt0:
  %1 = call %Token* () @func190 ()
  %2 = getelementptr inbounds %Token, %Token* %1, i1 0, i32 2
; index array
  %3 = getelementptr inbounds [0 x %Nat8], [0 x %Nat8]* %2, i1 0, %Int64 0
  %4 = load %Nat8, %Nat8* %3
;stmt1:
; index array
  %5 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func194_str1, i1 0, %Int64 0
  %6 = load %Nat8, %Nat8* %5
  %7 = icmp eq %Nat8 %4, %6
; index array
  %8 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func194_str2, i1 0, %Int64 0
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
  %13 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func194_str3, i1 0, %Int64 0
  %14 = load %Nat8, %Nat8* %13
  %15 = icmp eq %Nat8 %4, %14
; index array
  %16 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func194_str4, i1 0, %Int64 0
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

define void @need_comma_or_nl () {
;stmt0:
  %1 = call %Token* () @func190 ()
  %2 = getelementptr inbounds %Token, %Token* %1, i1 0, i32 1
;stmt1:
  %3 = bitcast [2 x %Nat8]* @func195_str1 to %Str
  %4 = call i1 (%Str) @func198 (%Str %3)
  br i1 %4, label %then_0, label %else_0
then_0:
;stmt2:
ret void
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt3:
  %6 = bitcast [2 x %Nat8]* @func195_str2 to %Str
  %7 = call i1 (%Str) @func198 (%Str %6)
  br i1 %7, label %then_1, label %else_1
then_1:
;stmt4:
ret void
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt5:
  %9 = bitcast [27 x %Nat8]* @func195_str3 to %Str
  call void (%Str, %TokenInfo*) @error (%Str %9, %TokenInfo* %2)
  ret void
}

define void @skipto (%Str) {
;stmt0:
  %2 = bitcast [29 x %Nat8]* @func196_str1 to %Str; loadImmPtr
  %3 = inttoptr i64 0 to%TokenInfo*
  call void (%Str, %TokenInfo*) @error (%Str %2, %TokenInfo* %3)
;stmt1:
  %4 = bitcast [12 x %Nat8]* @func196_str2 to %Str
  %5 = call %Token* () @func190 ()
  %6 = getelementptr inbounds %Token, %Token* %5, i1 0, i32 2
  %7 = call %Int32 (%Str, ...) @printf (%Str %4, [0 x %Nat8]* %6)
;stmt2:
  %8 = bitcast [18 x %Nat8]* @func196_str3 to %Str
  %9 = call %Int32 (%Str, ...) @printf (%Str %8, %Str %0)
;stmt3:
  call void (%Int32) @exit (%Int32 1)
  ret void
}

define i1 @look (%Str) {
;stmt0:
  %2 = call %Token* () @func190 ()
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
  ret i1 %12
}

define i1 @func198 (%Str) {
;stmt0:
  %2 = call i1 (%Str) @look (%Str %0)
;stmt1:
  br i1 %2, label %then_0, label %else_0
then_0:
;stmt2:
  call void () @skip ()
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt3:
  ret i1 %2
}

define i1 @need (%Str) {
;stmt0:
  %2 = call i1 (%Str) @func198 (%Str %0)
;stmt1:
  %3 = icmp eq i1 %2, 0
  br i1 %3, label %then_0, label %else_0
then_0:
;stmt2:
  %4 = call %Token* () @func190 ()
;stmt3:
  %5 = bitcast [18 x %Nat8]* @func199_str1 to %Str
  %6 = getelementptr inbounds %Token, %Token* %4, i1 0, i32 1
  call void (%Str, %TokenInfo*) @error (%Str %5, %TokenInfo* %6)
;stmt4:
  %7 = bitcast [13 x %Nat8]* @func199_str2 to %Str
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
;stmt1:; loadImmPtr
  %5 = inttoptr i64 0 to%AstId*
  %6 = icmp ne %AstId* %4, %5
  %7 = bitcast [11 x %Nat8]* @func200_str1 to %Str
  call void (i1, %Str) @assert (i1 %6, %Str %7)
;stmt2:
  %8 = insertvalue %AstId zeroinitializer, %Str %0, 0
  %9 = insertvalue %AstId %8, %TokenInfo* %1, 1
  store %AstId %9, %AstId* %4, align 8
;stmt3:
  ret %AstId* %4
}

define %AstId* @parse_id () {
;stmt0:
  %1 = call %Token* () @func190 ()
;stmt1:
  %2 = getelementptr inbounds %Token, %Token* %1, i1 0, i32 0
  %3 = load %TokenKind, %TokenKind* %2
  %4 = icmp ne %TokenKind %3, 1
  br i1 %4, label %then_0, label %else_0
then_0:
;stmt2:
  %5 = bitcast [13 x %Nat8]* @func201_str1 to %Str
  %6 = getelementptr inbounds %Token, %Token* %1, i1 0, i32 1
  call void (%Str, %TokenInfo*) @error (%Str %5, %TokenInfo* %6)
;stmt3:; loadImmPtr
  %7 = inttoptr i64 0 to%AstId*
  ret %AstId* %7
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt4:
  %9 = getelementptr inbounds %Token, %Token* %1, i1 0, i32 2
; index array
  %10 = getelementptr inbounds [0 x %Nat8], [0 x %Nat8]* %9, i1 0, %Int64 0
  %11 = bitcast %Nat8* %10 to %Str
  %12 = getelementptr inbounds %Token, %Token* %1, i1 0, i32 1
  %13 = call %AstId* (%Str, %TokenInfo*) @ast_id_new (%Str %11, %TokenInfo* %12)
;stmt5:
  call void () @skip ()
;stmt6:
  ret %AstId* %13
}

define %AstName @parse_name () {
;stmt0:
  %1 = alloca %AstName
  store %AstName zeroinitializer, %AstName* %1, align 8
;stmt1:
  %2 = getelementptr inbounds %AstName, %AstName* %1, i1 0, i32 2
  %3 = call %Token* () @func190 ()
  %4 = getelementptr inbounds %Token, %Token* %3, i1 0, i32 1
  store %TokenInfo* %4, %TokenInfo** %2, align 8
;stmt2:
  %5 = call %AstId* () @parse_id ()
;stmt3:
  %6 = bitcast [2 x %Nat8]* @func202_str1 to %Str
  %7 = call i1 (%Str) @func198 (%Str %6)
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
  %12 = getelementptr inbounds %AstName, %AstName* %1, i1 0, i32 1; loadImmPtr
  %13 = inttoptr i64 0 to%AstId*
  store %AstId* %13, %AstId** %12, align 8
  br label %endif_0
endif_0:
;stmt8:
  %14 = load %AstName, %AstName* %1
  ret %AstName %14
}

define %AstNode* @ast_node_new (%AstNodeKind, %Unit*) {
;stmt0:
  %3 = call %Unit* (%Nat32) @malloc (%Nat32 16)
  %4 = bitcast %Unit* %3 to %AstNode*
;stmt1:; loadImmPtr
  %5 = inttoptr i64 0 to%AstNode*
  %6 = icmp ne %AstNode* %4, %5
  %7 = bitcast [13 x %Nat8]* @func203_str1 to %Str
  call void (i1, %Str) @assert (i1 %6, %Str %7)
;stmt2:
  %8 = insertvalue %AstNode zeroinitializer, %AstNodeKind %0, 0
  %9 = insertvalue %AstNode %8, %Unit* %1, 1
  store %AstNode %9, %AstNode* %4, align 8
;stmt3:
  ret %AstNode* %4
}

define %union.7 @parse (%Str) {
;stmt0:
  %2 = call %Unit* (%Nat32) @malloc (%Nat32 40)
  %3 = bitcast %Unit* %2 to %AstModule*
;stmt1:
  %4 = bitcast %AstModule* %3 to %Unit*
  %5 = call %Unit* (%Unit*, %Nat8, %Nat32) @memset (%Unit* %4, %Nat8 0, %Nat32 40)
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
  %15 = call %Token* () @func190 ()
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
  %28 = bitcast [7 x %Nat8]* @func204_str1 to %Str
  %29 = call i1 (%Str) @func198 (%Str %28)
  br i1 %29, label %then_3, label %else_3
then_3:
;stmt16:
  %30 = call %AstNode* () @func205 ()
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
  %36 = call %Token* () @func190 ()
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
  %49 = bitcast [8 x %Nat8]* @func204_str2 to %Str
  %50 = call i1 (%Str) @func198 (%Str %49)
;stmt31:
  %51 = bitcast [6 x %Nat8]* @func204_str3 to %Str
  %52 = call i1 (%Str) @func198 (%Str %51)
  br i1 %52, label %then_7, label %else_7
then_7:
;stmt32:
  %53 = call %Token* () @func190 ()
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
  %70 = call %AstDecl* (i1) @func218 (i1 0)
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
  %77 = bitcast [7 x %Nat8]* @func204_str4 to %Str
  %78 = call i1 (%Str) @func198 (%Str %77)
  br i1 %78, label %then_9, label %else_9
then_9:
;stmt43:
  %79 = call %AstDecl* (i1) @func218 (i1 0)
;stmt44:
  %80 = getelementptr inbounds %AstDecl, %AstDecl* %79, i1 0, i32 2
  %81 = load %TokenInfo*, %TokenInfo** %80
  %82 = call %AstValue* (%AstValueKind, %TokenInfo*) @func219 (%AstValueKind 4, %TokenInfo* %81)
;stmt45:
  %83 = getelementptr inbounds %AstValue, %AstValue* %82, i1 0, i32 6
  %84 = getelementptr inbounds %AstValueFunc, %AstValueFunc* %83, i1 0, i32 0
  %85 = getelementptr inbounds %AstDecl, %AstDecl* %79, i1 0, i32 1
  %86 = load %AstType*, %AstType** %85
  store %AstType* %86, %AstType** %84, align 8
;stmt46:
  %87 = getelementptr inbounds %AstValue, %AstValue* %82, i1 0, i32 6
  %88 = getelementptr inbounds %AstValueFunc, %AstValueFunc* %87, i1 0, i32 0
  %89 = load %AstType*, %AstType** %88
  %90 = getelementptr inbounds %AstType, %AstType* %89, i1 0, i32 7
  %91 = getelementptr inbounds %AstTypeFunc, %AstTypeFunc* %90, i1 0, i32 2
  store i1 %50, i1* %91, align 1
;stmt47:
  %92 = getelementptr inbounds %AstValue, %AstValue* %82, i1 0, i32 18
  store i1 1, i1* %92, align 1
;stmt48:
  %93 = getelementptr inbounds %AstValue, %AstValue* %82, i1 0, i32 6
  %94 = getelementptr inbounds %AstValueFunc, %AstValueFunc* %93, i1 0, i32 1
  %95 = inttoptr %Unit zeroinitializer to %union.0
  store %union.0 %95, %union.0* %94, align 16
;stmt49:
  %96 = call %Unit* (%Nat32) @malloc (%Nat32 24)
  %97 = bitcast %Unit* %96 to %AstNodeBindValue*
;stmt50:
  %98 = getelementptr inbounds %AstNodeBindValue, %AstNodeBindValue* %97, i1 0, i32 0
  %99 = getelementptr inbounds %AstDecl, %AstDecl* %79, i1 0, i32 0
  %100 = getelementptr inbounds %List, %List* %99, i1 0, i32 0
  %101 = load %Node*, %Node** %100
  %102 = getelementptr inbounds %Node, %Node* %101, i1 0, i32 3
  %103 = load %Unit*, %Unit** %102
  %104 = bitcast %Unit* %103 to %AstId*
  store %AstId* %104, %AstId** %98, align 8
;stmt51:
  %105 = getelementptr inbounds %AstNodeBindValue, %AstNodeBindValue* %97, i1 0, i32 1
  store %AstValue* %82, %AstValue** %105, align 8
;stmt52:
  %106 = getelementptr inbounds %AstNodeBindValue, %AstNodeBindValue* %97, i1 0, i32 2
  %107 = getelementptr inbounds %AstDecl, %AstDecl* %79, i1 0, i32 2
  %108 = load %TokenInfo*, %TokenInfo** %107
  store %TokenInfo* %108, %TokenInfo** %106, align 8
;stmt53:
  %109 = getelementptr inbounds %AstModule, %AstModule* %3, i1 0, i32 0
  %110 = bitcast %AstNodeBindValue* %97 to %Unit*
  %111 = call %AstNode* (%AstNodeKind, %Unit*) @ast_node_new (%AstNodeKind 3, %Unit* %110)
  %112 = bitcast %AstNode* %111 to %Unit*
  %113 = call i1 (%List*, %Unit*) @list_append (%List* %109, %Unit* %112)
;stmt54:
  br label %continue_1
  br label %endif_9
else_9:
  br label %endif_9
endif_9:
  br label %endif_7
endif_7:
;stmt55:
  %115 = getelementptr inbounds %Token, %Token* %36, i1 0, i32 2
; index array
  %116 = getelementptr inbounds [0 x %Nat8], [0 x %Nat8]* %115, i1 0, %Int64 0
  %117 = load %Nat8, %Nat8* %116
  %118 = call i1 (%Nat8) @isAlpha (%Nat8 %117)
  br i1 %118, label %then_10, label %else_10
then_10:
;stmt56:
  %119 = getelementptr inbounds %Token, %Token* %36, i1 0, i32 2
; index array
  %120 = getelementptr inbounds [0 x %Nat8], [0 x %Nat8]* %119, i1 0, %Int64 0
  %121 = load %Nat8, %Nat8* %120
  %122 = call i1 (%Nat8) @isUpperCase (%Nat8 %121)
  br i1 %122, label %then_11, label %else_11
then_11:
;stmt57:
  %123 = call %AstNodeBindType* () @func206 ()
;stmt58:
  %124 = getelementptr inbounds %AstModule, %AstModule* %3, i1 0, i32 0
  %125 = bitcast %AstNodeBindType* %123 to %Unit*
  %126 = call %AstNode* (%AstNodeKind, %Unit*) @ast_node_new (%AstNodeKind 2, %Unit* %125)
  %127 = bitcast %AstNode* %126 to %Unit*
  %128 = call i1 (%List*, %Unit*) @list_append (%List* %124, %Unit* %127)
  br label %endif_11
else_11:
;stmt59:
  %129 = call %AstNodeBindValue* () @func207 ()
;stmt60:
  %130 = getelementptr inbounds %AstModule, %AstModule* %3, i1 0, i32 0
  %131 = bitcast %AstNodeBindValue* %129 to %Unit*
  %132 = call %AstNode* (%AstNodeKind, %Unit*) @ast_node_new (%AstNodeKind 3, %Unit* %131)
  %133 = bitcast %AstNode* %132 to %Unit*
  %134 = call i1 (%List*, %Unit*) @list_append (%List* %130, %Unit* %133)
  br label %endif_11
endif_11:
  br label %endif_10
else_10:
  br label %endif_10
endif_10:
  br label %continue_1
break_1:
;stmt61:
  %135 = load %Int32, %Int32* @errcnt
  %136 = icmp sgt %Int32 %135, 0
  br i1 %136, label %then_12, label %else_12
then_12:
;stmt62:
  %137 = inttoptr %Unit zeroinitializer to %union.7
  ret %union.7 %137
  br label %endif_12
else_12:
  br label %endif_12
endif_12:
;stmt63:
  %139 = bitcast %AstModule* %3 to %union.7
  ret %union.7 %139
}

define %AstNode* @func205 () {
;stmt0:
  %1 = call %Unit* (%Nat32) @malloc (%Nat32 16)
  %2 = bitcast %Unit* %1 to %AstNodeImport*
;stmt1:
  %3 = call %Token* () @func190 ()
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

define %AstNodeBindType* @func206 () {
;stmt0:
  %1 = call %AstId* () @parse_id ()
;stmt1:
  %2 = call %Token* () @func190 ()
  %3 = getelementptr inbounds %Token, %Token* %2, i1 0, i32 1
;stmt2:
  %4 = bitcast [2 x %Nat8]* @func206_str1 to %Str
  %5 = call i1 (%Str) @need (%Str %4)
;stmt3:
  %6 = call %AstType* () @func209 ()
;stmt4:
  %7 = call %Unit* (%Nat32) @malloc (%Nat32 24)
  %8 = bitcast %Unit* %7 to %AstNodeBindType*
;stmt5:
  %9 = insertvalue %AstNodeBindType zeroinitializer, %AstId* %1, 0
  %10 = insertvalue %AstNodeBindType %9, %AstType* %6, 1
  %11 = insertvalue %AstNodeBindType %10, %TokenInfo* %3, 2
  store %AstNodeBindType %11, %AstNodeBindType* %8, align 8
;stmt6:
  ret %AstNodeBindType* %8
}

define %AstNodeBindValue* @func207 () {
;stmt0:
  %1 = call %AstId* () @parse_id ()
;stmt1:
  %2 = call %Token* () @func190 ()
  %3 = getelementptr inbounds %Token, %Token* %2, i1 0, i32 1
;stmt2:
  %4 = bitcast [2 x %Nat8]* @func207_str1 to %Str
  %5 = call i1 (%Str) @need (%Str %4)
;stmt3:
  %6 = call %AstValue* () @func222 ()
;stmt4:
  %7 = call %Unit* (%Nat32) @malloc (%Nat32 24)
  %8 = bitcast %Unit* %7 to %AstNodeBindValue*
;stmt5:
  %9 = insertvalue %AstNodeBindValue zeroinitializer, %AstId* %1, 0
  %10 = insertvalue %AstNodeBindValue %9, %AstValue* %6, 1
  %11 = insertvalue %AstNodeBindValue %10, %TokenInfo* %3, 2
  store %AstNodeBindValue %11, %AstNodeBindValue* %8, align 8
;stmt6:
  ret %AstNodeBindValue* %8
}

define %AstType* @ast_type_new (%AstTypeKind, %TokenInfo*) {
;stmt0:
  %3 = call %Unit* (%Nat32) @malloc (%Nat32 280)
  %4 = bitcast %Unit* %3 to %AstType*
;stmt1:; loadImmPtr
  %5 = inttoptr i64 0 to%AstType*
  %6 = icmp ne %AstType* %4, %5
  %7 = bitcast [18 x %Nat8]* @func208_str1 to %Str
  call void (i1, %Str) @assert (i1 %6, %Str %7)
;stmt2:
  %8 = insertvalue %AstType zeroinitializer, %AstTypeKind %0, 0
  %9 = insertvalue %AstType %8, %TokenInfo* %1, 11
  store %AstType %9, %AstType* %4, align 8
;stmt3:
  ret %AstType* %4
}

define %AstType* @func209 () {
;stmt0:
  %1 = call %AstType* () @func210 ()
;stmt1:
  %2 = call %Token* () @func190 ()
;stmt2:
  %3 = bitcast [3 x %Nat8]* @func209_str1 to %Str
  %4 = call i1 (%Str) @func198 (%Str %3)
  br i1 %4, label %then_0, label %else_0
then_0:
;stmt3:
;stmt4:
  %5 = call %AstType* () @func209 ()
;stmt5:
  %6 = getelementptr inbounds %Token, %Token* %2, i1 0, i32 1
  %7 = call %AstType* (%AstTypeKind, %TokenInfo*) @ast_type_new (%AstTypeKind 7, %TokenInfo* %6)
;stmt6:
  %8 = getelementptr inbounds %AstType, %AstType* %7, i1 0, i32 7
  %9 = insertvalue %AstTypeFunc zeroinitializer, %AstType* %1, 0
  %10 = insertvalue %AstTypeFunc %9, %AstType* %5, 1
  %11 = getelementptr inbounds %Token, %Token* %2, i1 0, i32 1
  %12 = insertvalue %AstTypeFunc %10, %TokenInfo* %11, 3
  store %AstTypeFunc %12, %AstTypeFunc* %8, align 8
;stmt7:
  ret %AstType* %7
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt8:
  ret %AstType* %1
}

define %AstType* @func210 () {
;stmt0:
  %1 = call %AstType* () @func211 ()
;stmt1:
  %2 = call %Token* () @func190 ()
;stmt2:
  %3 = bitcast [3 x %Nat8]* @func210_str1 to %Str
  %4 = call i1 (%Str) @func198 (%Str %3)
  br i1 %4, label %then_0, label %else_0
then_0:
;stmt3:
  %5 = getelementptr inbounds %Token, %Token* %2, i1 0, i32 1
  %6 = call %AstType* (%AstTypeKind, %TokenInfo*) @ast_type_new (%AstTypeKind 11, %TokenInfo* %5)
;stmt4:
  %7 = getelementptr inbounds %AstType, %AstType* %6, i1 0, i32 9
  %8 = getelementptr inbounds %AstTypeUnion, %AstTypeUnion* %7, i1 0, i32 0
  call void (%List*) @map_init (%List* %8)
;stmt5:
  %9 = getelementptr inbounds %AstType, %AstType* %6, i1 0, i32 9
  %10 = getelementptr inbounds %AstTypeUnion, %AstTypeUnion* %9, i1 0, i32 0
  %11 = bitcast %AstType* %1 to %Unit*
  %12 = call i1 (%List*, %Unit*) @list_append (%List* %10, %Unit* %11)
;stmt6:
  call void () @skip_nl ()
;stmt7:
  %13 = call %AstType* () @func211 ()
;stmt8:
  %14 = getelementptr inbounds %AstType, %AstType* %6, i1 0, i32 9
  %15 = getelementptr inbounds %AstTypeUnion, %AstTypeUnion* %14, i1 0, i32 0
  %16 = bitcast %AstType* %13 to %Unit*
  %17 = call i1 (%List*, %Unit*) @list_append (%List* %15, %Unit* %16)
;stmt9:
  br label %continue_0
continue_0:
  %18 = bitcast [3 x %Nat8]* @func210_str2 to %Str
  %19 = call i1 (%Str) @func198 (%Str %18)
  br i1 %19, label %body_0, label %break_0
body_0:
;stmt10:
  call void () @skip_nl ()
;stmt11:
  %20 = call %AstType* () @func211 ()
;stmt12:
  %21 = getelementptr inbounds %AstType, %AstType* %6, i1 0, i32 9
  %22 = getelementptr inbounds %AstTypeUnion, %AstTypeUnion* %21, i1 0, i32 0
  %23 = bitcast %AstType* %20 to %Unit*
  %24 = call i1 (%List*, %Unit*) @list_append (%List* %22, %Unit* %23)
  br label %continue_0
break_0:
;stmt13:
  ret %AstType* %6
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt14:
  ret %AstType* %1
}

define %AstType* @func211 () {
;stmt0:
  %1 = call %Token* () @func190 ()
;stmt1:
  %2 = bitcast [2 x %Nat8]* @func211_str1 to %Str
  %3 = call i1 (%Str) @func198 (%Str %2)
  br i1 %3, label %then_0, label %else_0
then_0:
;stmt2:
  %4 = call %AstType* () @func211 ()
;stmt3:
  %5 = getelementptr inbounds %Token, %Token* %1, i1 0, i32 1
  %6 = call %AstType* (%AstTypeKind, %TokenInfo*) @ast_type_new (%AstTypeKind 8, %TokenInfo* %5)
;stmt4:
  %7 = getelementptr inbounds %AstType, %AstType* %6, i1 0, i32 5
  %8 = insertvalue %AstTypePointer zeroinitializer, %AstType* %4, 0
  %9 = getelementptr inbounds %Token, %Token* %1, i1 0, i32 1
  %10 = insertvalue %AstTypePointer %8, %TokenInfo* %9, 1
  store %AstTypePointer %10, %AstTypePointer* %7, align 8
;stmt5:
  ret %AstType* %6
  br label %endif_0
else_0:
;stmt6:
  %12 = bitcast [2 x %Nat8]* @func211_str2 to %Str
  %13 = call i1 (%Str) @func198 (%Str %12)
  br i1 %13, label %then_1, label %else_1
then_1:
;stmt7:
  %14 = bitcast [2 x %Nat8]* @func211_str3 to %Str
  %15 = call i1 (%Str) @func198 (%Str %14)
  br i1 %15, label %then_2, label %else_2
then_2:
;stmt8:
  %16 = getelementptr inbounds %Token, %Token* %1, i1 0, i32 1
  %17 = call %AstType* (%AstTypeKind, %TokenInfo*) @ast_type_new (%AstTypeKind 6, %TokenInfo* %16)
;stmt9:
  %18 = call %AstType* () @func211 ()
;stmt10:
  %19 = getelementptr inbounds %AstType, %AstType* %17, i1 0, i32 4
  %20 = insertvalue %AstTypeArrayU zeroinitializer, %AstType* %18, 0
  %21 = getelementptr inbounds %Token, %Token* %1, i1 0, i32 1
  %22 = insertvalue %AstTypeArrayU %20, %TokenInfo* %21, 1
  store %AstTypeArrayU %22, %AstTypeArrayU* %19, align 8
;stmt11:
  ret %AstType* %17
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
;stmt12:
  %24 = getelementptr inbounds %Token, %Token* %1, i1 0, i32 1
  %25 = call %AstType* (%AstTypeKind, %TokenInfo*) @ast_type_new (%AstTypeKind 5, %TokenInfo* %24)
;stmt13:
  %26 = call %AstValue* () @func222 ()
;stmt14:
  %27 = bitcast [2 x %Nat8]* @func211_str4 to %Str
  %28 = call i1 (%Str) @need (%Str %27)
;stmt15:
  %29 = call %AstType* () @func211 ()
;stmt16:
  %30 = getelementptr inbounds %AstType, %AstType* %25, i1 0, i32 3
  %31 = insertvalue %AstTypeArray zeroinitializer, %AstType* %29, 0
  %32 = insertvalue %AstTypeArray %31, %AstValue* %26, 1
  %33 = getelementptr inbounds %Token, %Token* %1, i1 0, i32 1
  %34 = insertvalue %AstTypeArray %32, %TokenInfo* %33, 2
  store %AstTypeArray %34, %AstTypeArray* %30, align 8
;stmt17:
  ret %AstType* %25
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  br label %endif_0
endif_0:
;stmt18:
  %36 = call %AstType* () @func212 ()
  ret %AstType* %36
}

define %AstType* @func212 () {
;stmt0:
  %1 = call %Token* () @func190 ()
;stmt1:
  %2 = bitcast [2 x %Nat8]* @func212_str1 to %Str
  %3 = call i1 (%Str) @func198 (%Str %2)
  br i1 %3, label %then_0, label %else_0
then_0:
;stmt2:
  %4 = bitcast [2 x %Nat8]* @func212_str2 to %Str
  %5 = call i1 (%Str) @look (%Str %4)
  %6 = call i1 () @func259 ()
  %7 = or i1 %5, %6
  br i1 %7, label %then_1, label %else_1
then_1:
;stmt3:
  %8 = call %AstType* () @func215 ()
  ret %AstType* %8
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt4:
  %10 = call %AstType* () @func209 ()
;stmt5:
  %11 = bitcast [2 x %Nat8]* @func212_str3 to %Str
  %12 = call i1 (%Str) @need (%Str %11)
;stmt6:
  ret %AstType* %10
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt7:
  %14 = call %AstType* () @func213 ()
  ret %AstType* %14
}

define %AstType* @func213 () {
;stmt0:
  %1 = bitcast [2 x %Nat8]* @func213_str1 to %Str
  %2 = call i1 (%Str) @func198 (%Str %1)
  br i1 %2, label %then_0, label %else_0
then_0:
;stmt1:
  %3 = call %AstType* () @func214 ()
  ret %AstType* %3
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt2:
  %5 = call %Token* () @func190 ()
;stmt3:
  %6 = bitcast [7 x %Nat8]* @func213_str2 to %Str
  %7 = call i1 (%Str) @func198 (%Str %6)
  br i1 %7, label %then_1, label %else_1
then_1:
;stmt4:
  %8 = call %AstType* () @func209 ()
;stmt5:
  %9 = getelementptr inbounds %Token, %Token* %5, i1 0, i32 1
  %10 = call %AstType* (%AstTypeKind, %TokenInfo*) @ast_type_new (%AstTypeKind 10, %TokenInfo* %9)
;stmt6:
  %11 = getelementptr inbounds %AstType, %AstType* %10, i1 0, i32 10
  %12 = insertvalue %AstTypeSpecial zeroinitializer, %AstType* %8, 0
  %13 = getelementptr inbounds %Token, %Token* %5, i1 0, i32 1
  %14 = insertvalue %AstTypeSpecial %12, %TokenInfo* %13, 1
  store %AstTypeSpecial %14, %AstTypeSpecial* %11, align 8
;stmt7:
  ret %AstType* %10
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt8:
  %16 = bitcast [4 x %Nat8]* @func213_str3 to %Str
  %17 = call i1 (%Str) @func198 (%Str %16)
  br i1 %17, label %then_2, label %else_2
then_2:
;stmt9:
  %18 = call %AstType* () @func209 ()
;stmt10:
  %19 = getelementptr inbounds %Token, %Token* %5, i1 0, i32 1
  %20 = call %AstType* (%AstTypeKind, %TokenInfo*) @ast_type_new (%AstTypeKind 9, %TokenInfo* %19)
;stmt11:
  %21 = getelementptr inbounds %AstType, %AstType* %20, i1 0, i32 8
  %22 = insertvalue %AstTypeVar zeroinitializer, %AstType* %18, 0
  store %AstTypeVar %22, %AstTypeVar* %21, align 8
;stmt12:
  ret %AstType* %20
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
;stmt13:
  %24 = getelementptr inbounds %Token, %Token* %5, i1 0, i32 1
  %25 = call %AstType* (%AstTypeKind, %TokenInfo*) @ast_type_new (%AstTypeKind 1, %TokenInfo* %24)
;stmt14:
  %26 = getelementptr inbounds %AstType, %AstType* %25, i1 0, i32 1
  %27 = call %AstName () @parse_name ()
  store %AstName %27, %AstName* %26, align 8
;stmt15:
  ret %AstType* %25
}

define %AstType* @func214 () {
;stmt0:
  %1 = call %Token* () @func190 ()
;stmt1:
  %2 = getelementptr inbounds %Token, %Token* %1, i1 0, i32 1
  %3 = call %AstType* (%AstTypeKind, %TokenInfo*) @ast_type_new (%AstTypeKind 2, %TokenInfo* %2)
;stmt2:
  call void () @skip_nl ()
;stmt3:
  br label %continue_0
continue_0:
  br i1 1, label %body_0, label %break_0
body_0:
;stmt4:
  call void () @skip_nl ()
;stmt5:
  %4 = call %Token* () @func190 ()
  %5 = getelementptr inbounds %Token, %Token* %4, i1 0, i32 1
;stmt6:
  %6 = call %AstId* () @parse_id ()
;stmt7:
  %7 = getelementptr inbounds %AstType, %AstType* %3, i1 0, i32 2
  %8 = getelementptr inbounds %AstTypeEnum, %AstTypeEnum* %7, i1 0, i32 0
  %9 = bitcast %AstId* %6 to %Unit*
  %10 = call i1 (%List*, %Unit*) @list_append (%List* %8, %Unit* %9)
;stmt8:
  %11 = call %Token* () @func190 ()
  %12 = getelementptr inbounds %Token, %Token* %11, i1 0, i32 1
;stmt9:
  %13 = bitcast [2 x %Nat8]* @func214_str1 to %Str
  %14 = call i1 (%Str) @func198 (%Str %13)
  br i1 %14, label %then_0, label %else_0
then_0:
;stmt10:
  br label %continue_0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt11:
  %16 = bitcast [2 x %Nat8]* @func214_str2 to %Str
  %17 = call i1 (%Str) @func198 (%Str %16)
;stmt12:
  call void () @skip_nl ()
;stmt13:
  %18 = bitcast [2 x %Nat8]* @func214_str3 to %Str
  %19 = call i1 (%Str) @func198 (%Str %18)
  br i1 %19, label %then_1, label %else_1
then_1:
;stmt14:
  br label %break_0
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt15:
  %21 = xor i1 %17, 1
  br i1 %21, label %then_2, label %else_2
then_2:
;stmt16:
  %22 = bitcast [37 x %Nat8]* @func214_str4 to %Str
  call void (%Str, %TokenInfo*) @error (%Str %22, %TokenInfo* %12)
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
  br label %continue_0
break_0:
;stmt17:
  ret %AstType* %3
}

define %AstType* @func215 () {
;stmt0:
  %1 = call %Token* () @func190 ()
;stmt1:
  %2 = alloca %List
  store %List zeroinitializer, %List* %2, align 8
;stmt2:
  %3 = getelementptr inbounds %List, %List* %2, i1 0
  call void (%List*) @map_init (%List* %3)
;stmt3:
  br label %continue_0
continue_0:
  br i1 1, label %body_0, label %break_0
body_0:
;stmt4:
  call void () @skip_nl ()
;stmt5:
  %4 = bitcast [2 x %Nat8]* @func215_str1 to %Str
  %5 = call i1 (%Str) @func198 (%Str %4)
  br i1 %5, label %then_0, label %else_0
then_0:
;stmt6:
  br label %break_0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt7:
  %7 = call %Token* () @func190 ()
  %8 = getelementptr inbounds %Token, %Token* %7, i1 0, i32 1
;stmt8:
  %9 = call %AstDecl* (i1) @func218 (i1 0)
;stmt9:; loadImmPtr
  %10 = inttoptr i64 0 to%AstDecl*
  %11 = icmp eq %AstDecl* %9, %10
  br i1 %11, label %then_1, label %else_1
then_1:
;stmt10:
  %12 = bitcast [14 x %Nat8]* @func215_str2 to %Str
  call void (%Str, %TokenInfo*) @error (%Str %12, %TokenInfo* %8)
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt11:
  %13 = bitcast [2 x %Nat8]* @func215_str3 to %Str
  %14 = call i1 (%Str) @func198 (%Str %13)
;stmt12:
  call void () @skip_nl ()
;stmt13:
  %15 = getelementptr inbounds %List, %List* %2, i1 0
  %16 = bitcast %AstDecl* %9 to %Unit*
  %17 = call i1 (%List*, %Unit*) @list_append (%List* %15, %Unit* %16)
  br label %continue_0
break_0:
;stmt14:
  %18 = getelementptr inbounds %Token, %Token* %1, i1 0, i32 1
  %19 = call %AstType* (%AstTypeKind, %TokenInfo*) @ast_type_new (%AstTypeKind 3, %TokenInfo* %18)
;stmt15:
  %20 = getelementptr inbounds %AstType, %AstType* %19, i1 0, i32 6
  %21 = load %List, %List* %2
  %22 = insertvalue %AstTypeRecord zeroinitializer, %List %21, 0
  %23 = getelementptr inbounds %Token, %Token* %1, i1 0, i32 1
  %24 = insertvalue %AstTypeRecord %22, %TokenInfo* %23, 1
  store %AstTypeRecord %24, %AstTypeRecord* %20, align 8
;stmt16:
  ret %AstType* %19
}

define %AstType* @func216 () {
;stmt0:
  %1 = call %Token* () @func190 ()
;stmt1:
  %2 = bitcast [2 x %Nat8]* @func216_str1 to %Str
  %3 = call i1 (%Str) @need (%Str %2)
;stmt2:
  %4 = call %AstType* () @func209 ()
;stmt3:
  %5 = getelementptr inbounds %Token, %Token* %1, i1 0, i32 1
  %6 = call %AstType* (%AstTypeKind, %TokenInfo*) @ast_type_new (%AstTypeKind 8, %TokenInfo* %5)
;stmt4:
  %7 = getelementptr inbounds %AstType, %AstType* %6, i1 0, i32 5
  %8 = insertvalue %AstTypePointer zeroinitializer, %AstType* %4, 0
  %9 = getelementptr inbounds %Token, %Token* %1, i1 0, i32 1
  %10 = insertvalue %AstTypePointer %8, %TokenInfo* %9, 1
  store %AstTypePointer %10, %AstTypePointer* %7, align 8
;stmt5:
  ret %AstType* %6
}

define %AstType* @func217 () {
;stmt0:
  %1 = call %Token* () @func190 ()
;stmt1:
  %2 = bitcast [2 x %Nat8]* @func217_str1 to %Str
  %3 = call i1 (%Str) @need (%Str %2)
;stmt2:
  %4 = bitcast [2 x %Nat8]* @func217_str2 to %Str
  %5 = call i1 (%Str) @func198 (%Str %4)
  br i1 %5, label %then_0, label %else_0
then_0:
;stmt3:
  %6 = getelementptr inbounds %Token, %Token* %1, i1 0, i32 1
  %7 = call %AstType* (%AstTypeKind, %TokenInfo*) @ast_type_new (%AstTypeKind 6, %TokenInfo* %6)
;stmt4:
  %8 = call %AstType* () @func209 ()
;stmt5:
  %9 = getelementptr inbounds %AstType, %AstType* %7, i1 0, i32 4
  %10 = insertvalue %AstTypeArrayU zeroinitializer, %AstType* %8, 0
  %11 = getelementptr inbounds %Token, %Token* %1, i1 0, i32 1
  %12 = insertvalue %AstTypeArrayU %10, %TokenInfo* %11, 1
  store %AstTypeArrayU %12, %AstTypeArrayU* %9, align 8
;stmt6:
  ret %AstType* %7
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt7:
  %14 = call %AstValue* () @func222 ()
;stmt8:
  %15 = bitcast [2 x %Nat8]* @func217_str3 to %Str
  %16 = call i1 (%Str) @need (%Str %15)
;stmt9:
  %17 = call %AstType* () @func209 ()
;stmt10:
  %18 = getelementptr inbounds %Token, %Token* %1, i1 0, i32 1
  %19 = call %AstType* (%AstTypeKind, %TokenInfo*) @ast_type_new (%AstTypeKind 5, %TokenInfo* %18)
;stmt11:
  %20 = getelementptr inbounds %AstType, %AstType* %19, i1 0, i32 3
  %21 = insertvalue %AstTypeArray zeroinitializer, %AstValue* %14, 1
  %22 = insertvalue %AstTypeArray %21, %AstType* %17, 0
  %23 = getelementptr inbounds %Token, %Token* %1, i1 0, i32 1
  %24 = insertvalue %AstTypeArray %22, %TokenInfo* %23, 2
  store %AstTypeArray %24, %AstTypeArray* %20, align 8
;stmt12:
  ret %AstType* %19
}

define %AstDecl* @func218 (i1) {
;stmt0:
  %2 = alloca %List
  store %List zeroinitializer, %List* %2, align 8
;stmt1:
  %3 = getelementptr inbounds %List, %List* %2, i1 0
  call void (%List*) @map_init (%List* %3)
;stmt2:
  br label %continue_0
continue_0:
  br i1 1, label %body_0, label %break_0
body_0:
;stmt3:
  %4 = call %AstId* () @parse_id ()
;stmt4:
  %5 = getelementptr inbounds %List, %List* %2, i1 0
  %6 = bitcast %AstId* %4 to %Unit*
  %7 = call i1 (%List*, %Unit*) @list_append (%List* %5, %Unit* %6)
;stmt5:
  %8 = bitcast [2 x %Nat8]* @func218_str1 to %Str
  %9 = call i1 (%Str) @func198 (%Str %8)
  %10 = xor i1 %9, 1
  br i1 %10, label %then_0, label %else_0
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
  %12 = call %Token* () @func190 ()
  %13 = getelementptr inbounds %Token, %Token* %12, i1 0, i32 1
;stmt9:
  %14 = bitcast [2 x %Nat8]* @func218_str2 to %Str
  %15 = call i1 (%Str) @need (%Str %14)
;stmt10:
  %16 = call %AstType* () @func209 ()
;stmt11:
  %17 = call %Unit* (%Nat32) @malloc (%Nat32 64)
  %18 = bitcast %Unit* %17 to %AstDecl*
;stmt12:
  %19 = load %List, %List* %2
  %20 = insertvalue %AstDecl zeroinitializer, %List %19, 0
  %21 = insertvalue %AstDecl %20, %AstType* %16, 1
  %22 = load i1, i1* @external
  %23 = insertvalue %AstDecl %21, i1 %22, 3
  %24 = load i1, i1* @xarghack
  %25 = insertvalue %AstDecl %23, i1 %24, 4
  %26 = insertvalue %AstDecl %25, %TokenInfo* %13, 2
  store %AstDecl %26, %AstDecl* %18, align 8
;stmt13:
  ret %AstDecl* %18
}

define %AstValue* @func219 (%AstValueKind, %TokenInfo*) {
;stmt0:
  %3 = call %Unit* (%Nat32) @malloc (%Nat32 528)
  %4 = bitcast %Unit* %3 to %AstValue*
;stmt1:; loadImmPtr
  %5 = inttoptr i64 0 to%AstValue*
  %6 = icmp ne %AstValue* %4, %5
  %7 = bitcast [21 x %Nat8]* @func219_str1 to %Str
  call void (i1, %Str) @assert (i1 %6, %Str %7)
;stmt2:
  %8 = insertvalue %AstValue zeroinitializer, %AstValueKind %0, 0
  %9 = insertvalue %AstValue %8, %TokenInfo* %1, 19
  store %AstValue %9, %AstValue* %4, align 16
;stmt3:
  ret %AstValue* %4
}

define %AstValue* @prefix (%AstValueKind, %AstValue*, %TokenInfo*) {
;stmt0:
  %4 = call %AstValue* (%AstValueKind, %TokenInfo*) @func219 (%AstValueKind %0, %TokenInfo* %2)
;stmt1:
  %5 = getelementptr inbounds %AstValue, %AstValue* %4, i1 0, i32 7
  %6 = insertvalue %AstValueUnary zeroinitializer, %AstValueKind %0, 0
  %7 = insertvalue %AstValueUnary %6, %AstValue* %1, 1
  %8 = insertvalue %AstValueUnary %7, %TokenInfo* %2, 2
  store %AstValueUnary %8, %AstValueUnary* %5, align 8
;stmt2:
  ret %AstValue* %4
}

define %AstValue* @infix (%AstValueKind, %AstValue*, %AstValue*, %TokenInfo*) {
;stmt0:
  %5 = call %AstValue* (%AstValueKind, %TokenInfo*) @func219 (%AstValueKind %0, %TokenInfo* %3)
;stmt1:
  %6 = getelementptr inbounds %AstValue, %AstValue* %5, i1 0, i32 8
  %7 = insertvalue %AstValueBinary zeroinitializer, %AstValueKind %0, 0
  %8 = insertvalue %AstValueBinary %7, %AstValue* %1, 1
  %9 = insertvalue %AstValueBinary %8, %AstValue* %2, 2
  %10 = insertvalue %AstValueBinary %9, %TokenInfo* %3, 3
  store %AstValueBinary %10, %AstValueBinary* %6, align 8
;stmt2:
  ret %AstValue* %5
}

define %AstValue* @func222 () {
;stmt0:
  %1 = alloca %AstValue*
  %2 = call %AstValue* () @func223 ()
  store %AstValue* %2, %AstValue** %1, align 8
;stmt1:
  %3 = load %AstValue*, %AstValue** %1; loadImmPtr
  %4 = inttoptr i64 0 to%AstValue*
  %5 = icmp eq %AstValue* %3, %4
  br i1 %5, label %then_0, label %else_0
then_0:
;stmt2:; loadImmPtr
  %6 = inttoptr i64 0 to%AstValue*
  ret %AstValue* %6
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt3:
  %8 = call %Token* () @func190 ()
  %9 = getelementptr inbounds %Token, %Token* %8, i1 0, i32 1
;stmt4:
  %10 = bitcast [3 x %Nat8]* @func222_str1 to %Str
  %11 = call i1 (%Str) @func198 (%Str %10)
  br i1 %11, label %then_1, label %else_1
then_1:
;stmt5:
  call void () @skip_nl ()
;stmt6:
  %12 = load %AstValue*, %AstValue** %1
;stmt7:
  %13 = call %AstValue* () @func222 ()
;stmt8:
  %14 = call %AstValue* (%AstValueKind, %AstValue*, %AstValue*, %TokenInfo*) @infix (%AstValueKind 17, %AstValue* %12, %AstValue* %13, %TokenInfo* %9)
  store %AstValue* %14, %AstValue** %1, align 8
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt9:
  %15 = load %AstValue*, %AstValue** %1
  ret %AstValue* %15
}

define %AstValue* @func223 () {
;stmt0:
  %1 = alloca %AstValue*
  %2 = call %AstValue* () @func224 ()
  store %AstValue* %2, %AstValue** %1, align 8
;stmt1:
  %3 = load %AstValue*, %AstValue** %1; loadImmPtr
  %4 = inttoptr i64 0 to%AstValue*
  %5 = icmp eq %AstValue* %3, %4
  br i1 %5, label %then_0, label %else_0
then_0:
;stmt2:; loadImmPtr
  %6 = inttoptr i64 0 to%AstValue*
  ret %AstValue* %6
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt3:
  %8 = call %Token* () @func190 ()
  %9 = getelementptr inbounds %Token, %Token* %8, i1 0, i32 1
;stmt4:
  %10 = bitcast [4 x %Nat8]* @func223_str1 to %Str
  %11 = call i1 (%Str) @func198 (%Str %10)
  br i1 %11, label %then_1, label %else_1
then_1:
;stmt5:
  call void () @skip_nl ()
;stmt6:
  %12 = load %AstValue*, %AstValue** %1
;stmt7:
  %13 = call %AstValue* () @func223 ()
;stmt8:
  %14 = call %AstValue* (%AstValueKind, %AstValue*, %AstValue*, %TokenInfo*) @infix (%AstValueKind 18, %AstValue* %12, %AstValue* %13, %TokenInfo* %9)
  store %AstValue* %14, %AstValue** %1, align 8
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt9:
  %15 = load %AstValue*, %AstValue** %1
  ret %AstValue* %15
}

define %AstValue* @func224 () {
;stmt0:
  %1 = alloca %AstValue*
  %2 = call %AstValue* () @func225 ()
  store %AstValue* %2, %AstValue** %1, align 8
;stmt1:
  %3 = load %AstValue*, %AstValue** %1; loadImmPtr
  %4 = inttoptr i64 0 to%AstValue*
  %5 = icmp eq %AstValue* %3, %4
  br i1 %5, label %then_0, label %else_0
then_0:
;stmt2:; loadImmPtr
  %6 = inttoptr i64 0 to%AstValue*
  ret %AstValue* %6
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt3:
  %8 = call %Token* () @func190 ()
  %9 = getelementptr inbounds %Token, %Token* %8, i1 0, i32 1
;stmt4:
  %10 = bitcast [4 x %Nat8]* @func224_str1 to %Str
  %11 = call i1 (%Str) @func198 (%Str %10)
  br i1 %11, label %then_1, label %else_1
then_1:
;stmt5:
  call void () @skip_nl ()
;stmt6:
  %12 = load %AstValue*, %AstValue** %1
;stmt7:
  %13 = call %AstValue* () @func224 ()
;stmt8:
  %14 = call %AstValue* (%AstValueKind, %AstValue*, %AstValue*, %TokenInfo*) @infix (%AstValueKind 19, %AstValue* %12, %AstValue* %13, %TokenInfo* %9)
  store %AstValue* %14, %AstValue** %1, align 8
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt9:
  %15 = load %AstValue*, %AstValue** %1
  ret %AstValue* %15
}

define %AstValue* @func225 () {
;stmt0:
  %1 = alloca %AstValue*
  %2 = call %AstValue* () @func226 ()
  store %AstValue* %2, %AstValue** %1, align 8
;stmt1:
  %3 = load %AstValue*, %AstValue** %1; loadImmPtr
  %4 = inttoptr i64 0 to%AstValue*
  %5 = icmp eq %AstValue* %3, %4
  br i1 %5, label %then_0, label %else_0
then_0:
;stmt2:; loadImmPtr
  %6 = inttoptr i64 0 to%AstValue*
  ret %AstValue* %6
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
  %8 = call %Token* () @func190 ()
  %9 = getelementptr inbounds %Token, %Token* %8, i1 0, i32 1
;stmt5:
  %10 = bitcast [3 x %Nat8]* @func225_str1 to %Str
  %11 = call i1 (%Str) @func198 (%Str %10)
  br i1 %11, label %then_1, label %else_1
then_1:
;stmt6:
  call void () @skip_nl ()
;stmt7:
  %12 = load %AstValue*, %AstValue** %1
;stmt8:
  %13 = call %AstValue* () @func225 ()
;stmt9:
  %14 = call %AstValue* (%AstValueKind, %AstValue*, %AstValue*, %TokenInfo*) @infix (%AstValueKind 20, %AstValue* %12, %AstValue* %13, %TokenInfo* %9)
  store %AstValue* %14, %AstValue** %1, align 8
  br label %endif_1
else_1:
;stmt10:
  %15 = bitcast [3 x %Nat8]* @func225_str2 to %Str
  %16 = call i1 (%Str) @func198 (%Str %15)
  br i1 %16, label %then_2, label %else_2
then_2:
;stmt11:
  call void () @skip_nl ()
;stmt12:
  %17 = load %AstValue*, %AstValue** %1
;stmt13:
  %18 = call %AstValue* () @func225 ()
;stmt14:
  %19 = call %AstValue* (%AstValueKind, %AstValue*, %AstValue*, %TokenInfo*) @infix (%AstValueKind 21, %AstValue* %17, %AstValue* %18, %TokenInfo* %9)
  store %AstValue* %19, %AstValue** %1, align 8
  br label %endif_2
else_2:
;stmt15:
  br label %break_0
  br label %endif_2
endif_2:
  br label %endif_1
endif_1:
  br label %continue_0
break_0:
;stmt16:
  %21 = load %AstValue*, %AstValue** %1
  ret %AstValue* %21
}

define %AstValue* @func226 () {
;stmt0:
  %1 = alloca %AstValue*
  %2 = call %AstValue* () @func227 ()
  store %AstValue* %2, %AstValue** %1, align 8
;stmt1:
  %3 = load %AstValue*, %AstValue** %1; loadImmPtr
  %4 = inttoptr i64 0 to%AstValue*
  %5 = icmp eq %AstValue* %3, %4
  br i1 %5, label %then_0, label %else_0
then_0:
;stmt2:; loadImmPtr
  %6 = inttoptr i64 0 to%AstValue*
  ret %AstValue* %6
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
  %8 = call %Token* () @func190 ()
  %9 = getelementptr inbounds %Token, %Token* %8, i1 0, i32 1
;stmt5:
  %10 = bitcast [2 x %Nat8]* @func226_str1 to %Str
  %11 = call i1 (%Str) @func198 (%Str %10)
  br i1 %11, label %then_1, label %else_1
then_1:
;stmt6:
  call void () @skip_nl ()
;stmt7:
  %12 = load %AstValue*, %AstValue** %1
;stmt8:
  %13 = call %AstValue* () @func227 ()
;stmt9:
  %14 = call %AstValue* (%AstValueKind, %AstValue*, %AstValue*, %TokenInfo*) @infix (%AstValueKind 22, %AstValue* %12, %AstValue* %13, %TokenInfo* %9)
  store %AstValue* %14, %AstValue** %1, align 8
  br label %endif_1
else_1:
;stmt10:
  %15 = bitcast [2 x %Nat8]* @func226_str2 to %Str
  %16 = call i1 (%Str) @func198 (%Str %15)
  br i1 %16, label %then_2, label %else_2
then_2:
;stmt11:
  call void () @skip_nl ()
;stmt12:
  %17 = load %AstValue*, %AstValue** %1
;stmt13:
  %18 = call %AstValue* () @func227 ()
;stmt14:
  %19 = call %AstValue* (%AstValueKind, %AstValue*, %AstValue*, %TokenInfo*) @infix (%AstValueKind 23, %AstValue* %17, %AstValue* %18, %TokenInfo* %9)
  store %AstValue* %19, %AstValue** %1, align 8
  br label %endif_2
else_2:
;stmt15:
  %20 = bitcast [3 x %Nat8]* @func226_str3 to %Str
  %21 = call i1 (%Str) @func198 (%Str %20)
  br i1 %21, label %then_3, label %else_3
then_3:
;stmt16:
  call void () @skip_nl ()
;stmt17:
  %22 = load %AstValue*, %AstValue** %1
;stmt18:
  %23 = call %AstValue* () @func227 ()
;stmt19:
  %24 = call %AstValue* (%AstValueKind, %AstValue*, %AstValue*, %TokenInfo*) @infix (%AstValueKind 24, %AstValue* %22, %AstValue* %23, %TokenInfo* %9)
  store %AstValue* %24, %AstValue** %1, align 8
  br label %endif_3
else_3:
;stmt20:
  %25 = bitcast [3 x %Nat8]* @func226_str4 to %Str
  %26 = call i1 (%Str) @func198 (%Str %25)
  br i1 %26, label %then_4, label %else_4
then_4:
;stmt21:
  call void () @skip_nl ()
;stmt22:
  %27 = load %AstValue*, %AstValue** %1
;stmt23:
  %28 = call %AstValue* () @func227 ()
;stmt24:
  %29 = call %AstValue* (%AstValueKind, %AstValue*, %AstValue*, %TokenInfo*) @infix (%AstValueKind 25, %AstValue* %27, %AstValue* %28, %TokenInfo* %9)
  store %AstValue* %29, %AstValue** %1, align 8
  br label %endif_4
else_4:
;stmt25:
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
;stmt26:
  %31 = load %AstValue*, %AstValue** %1
  ret %AstValue* %31
}

define %AstValue* @func227 () {
;stmt0:
  %1 = alloca %AstValue*
  %2 = call %AstValue* () @func228 ()
  store %AstValue* %2, %AstValue** %1, align 8
;stmt1:
  %3 = load %AstValue*, %AstValue** %1; loadImmPtr
  %4 = inttoptr i64 0 to%AstValue*
  %5 = icmp eq %AstValue* %3, %4
  br i1 %5, label %then_0, label %else_0
then_0:
;stmt2:; loadImmPtr
  %6 = inttoptr i64 0 to%AstValue*
  ret %AstValue* %6
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
  %8 = call %Token* () @func190 ()
  %9 = getelementptr inbounds %Token, %Token* %8, i1 0, i32 1
;stmt5:
  %10 = bitcast [3 x %Nat8]* @func227_str1 to %Str
  %11 = call i1 (%Str) @func198 (%Str %10)
  br i1 %11, label %then_1, label %else_1
then_1:
;stmt6:
  call void () @skip_nl ()
;stmt7:
  %12 = load %AstValue*, %AstValue** %1
;stmt8:
  %13 = call %AstValue* () @func228 ()
;stmt9:
  %14 = call %AstValue* (%AstValueKind, %AstValue*, %AstValue*, %TokenInfo*) @infix (%AstValueKind 26, %AstValue* %12, %AstValue* %13, %TokenInfo* %9)
  store %AstValue* %14, %AstValue** %1, align 8
  br label %endif_1
else_1:
;stmt10:
  %15 = bitcast [3 x %Nat8]* @func227_str2 to %Str
  %16 = call i1 (%Str) @func198 (%Str %15)
  br i1 %16, label %then_2, label %else_2
then_2:
;stmt11:
  call void () @skip_nl ()
;stmt12:
  %17 = load %AstValue*, %AstValue** %1
;stmt13:
  %18 = call %AstValue* () @func228 ()
;stmt14:
  %19 = call %AstValue* (%AstValueKind, %AstValue*, %AstValue*, %TokenInfo*) @infix (%AstValueKind 27, %AstValue* %17, %AstValue* %18, %TokenInfo* %9)
  store %AstValue* %19, %AstValue** %1, align 8
  br label %endif_2
else_2:
;stmt15:
  br label %break_0
  br label %endif_2
endif_2:
  br label %endif_1
endif_1:
  br label %continue_0
break_0:
;stmt16:
  %21 = load %AstValue*, %AstValue** %1
  ret %AstValue* %21
}

define %AstValue* @func228 () {
;stmt0:
  %1 = alloca %AstValue*
  %2 = call %AstValue* () @func229 ()
  store %AstValue* %2, %AstValue** %1, align 8
;stmt1:
  %3 = load %AstValue*, %AstValue** %1; loadImmPtr
  %4 = inttoptr i64 0 to%AstValue*
  %5 = icmp eq %AstValue* %3, %4
  br i1 %5, label %then_0, label %else_0
then_0:
;stmt2:; loadImmPtr
  %6 = inttoptr i64 0 to%AstValue*
  ret %AstValue* %6
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
  %8 = call %Token* () @func190 ()
  %9 = getelementptr inbounds %Token, %Token* %8, i1 0, i32 1
;stmt5:
  %10 = bitcast [2 x %Nat8]* @func228_str1 to %Str
  %11 = call i1 (%Str) @func198 (%Str %10)
  br i1 %11, label %then_1, label %else_1
then_1:
;stmt6:
  call void () @skip_nl ()
;stmt7:
  %12 = load %AstValue*, %AstValue** %1
;stmt8:
  %13 = call %AstValue* () @func229 ()
;stmt9:
  %14 = call %AstValue* (%AstValueKind, %AstValue*, %AstValue*, %TokenInfo*) @infix (%AstValueKind 12, %AstValue* %12, %AstValue* %13, %TokenInfo* %9)
  store %AstValue* %14, %AstValue** %1, align 8
  br label %endif_1
else_1:
;stmt10:
  %15 = bitcast [2 x %Nat8]* @func228_str2 to %Str
  %16 = call i1 (%Str) @func198 (%Str %15)
  br i1 %16, label %then_2, label %else_2
then_2:
;stmt11:
  call void () @skip_nl ()
;stmt12:
  %17 = load %AstValue*, %AstValue** %1
;stmt13:
  %18 = call %AstValue* () @func229 ()
;stmt14:
  %19 = call %AstValue* (%AstValueKind, %AstValue*, %AstValue*, %TokenInfo*) @infix (%AstValueKind 13, %AstValue* %17, %AstValue* %18, %TokenInfo* %9)
  store %AstValue* %19, %AstValue** %1, align 8
  br label %endif_2
else_2:
;stmt15:
  br label %break_0
  br label %endif_2
endif_2:
  br label %endif_1
endif_1:
  br label %continue_0
break_0:
;stmt16:
  %21 = load %AstValue*, %AstValue** %1
  ret %AstValue* %21
}

define %AstValue* @func229 () {
;stmt0:
  %1 = alloca %AstValue*
  %2 = call %AstValue* () @func230 ()
  store %AstValue* %2, %AstValue** %1, align 8
;stmt1:
  %3 = load %AstValue*, %AstValue** %1; loadImmPtr
  %4 = inttoptr i64 0 to%AstValue*
  %5 = icmp eq %AstValue* %3, %4
  br i1 %5, label %then_0, label %else_0
then_0:
;stmt2:; loadImmPtr
  %6 = inttoptr i64 0 to%AstValue*
  ret %AstValue* %6
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
  %8 = call %Token* () @func190 ()
  %9 = getelementptr inbounds %Token, %Token* %8, i1 0, i32 1
;stmt5:
  %10 = bitcast [2 x %Nat8]* @func229_str1 to %Str
  %11 = call i1 (%Str) @func198 (%Str %10)
  br i1 %11, label %then_1, label %else_1
then_1:
;stmt6:
  call void () @skip_nl ()
;stmt7:
  %12 = load %AstValue*, %AstValue** %1
;stmt8:
  %13 = call %AstValue* () @func230 ()
;stmt9:
  %14 = call %AstValue* (%AstValueKind, %AstValue*, %AstValue*, %TokenInfo*) @infix (%AstValueKind 14, %AstValue* %12, %AstValue* %13, %TokenInfo* %9)
  store %AstValue* %14, %AstValue** %1, align 8
  br label %endif_1
else_1:
;stmt10:
  %15 = bitcast [2 x %Nat8]* @func229_str2 to %Str
  %16 = call i1 (%Str) @func198 (%Str %15)
  br i1 %16, label %then_2, label %else_2
then_2:
;stmt11:
  call void () @skip_nl ()
;stmt12:
  %17 = load %AstValue*, %AstValue** %1
;stmt13:
  %18 = call %AstValue* () @func230 ()
;stmt14:
  %19 = call %AstValue* (%AstValueKind, %AstValue*, %AstValue*, %TokenInfo*) @infix (%AstValueKind 15, %AstValue* %17, %AstValue* %18, %TokenInfo* %9)
  store %AstValue* %19, %AstValue** %1, align 8
  br label %endif_2
else_2:
;stmt15:
  %20 = bitcast [2 x %Nat8]* @func229_str3 to %Str
  %21 = call i1 (%Str) @func198 (%Str %20)
  br i1 %21, label %then_3, label %else_3
then_3:
;stmt16:
  call void () @skip_nl ()
;stmt17:
  %22 = load %AstValue*, %AstValue** %1
;stmt18:
  %23 = call %AstValue* () @func230 ()
;stmt19:
  %24 = call %AstValue* (%AstValueKind, %AstValue*, %AstValue*, %TokenInfo*) @infix (%AstValueKind 16, %AstValue* %22, %AstValue* %23, %TokenInfo* %9)
  store %AstValue* %24, %AstValue** %1, align 8
  br label %endif_3
else_3:
;stmt20:
  br label %break_0
  br label %endif_3
endif_3:
  br label %endif_2
endif_2:
  br label %endif_1
endif_1:
  br label %continue_0
break_0:
;stmt21:
  %26 = load %AstValue*, %AstValue** %1
  ret %AstValue* %26
}

define %AstValue* @func230 () {
;stmt0:
  %1 = alloca %AstValue*
  %2 = call %AstValue* () @func231 ()
  store %AstValue* %2, %AstValue** %1, align 8
;stmt1:
  %3 = load %AstValue*, %AstValue** %1; loadImmPtr
  %4 = inttoptr i64 0 to%AstValue*
  %5 = icmp eq %AstValue* %3, %4
  br i1 %5, label %then_0, label %else_0
then_0:
;stmt2:; loadImmPtr
  %6 = inttoptr i64 0 to%AstValue*
  ret %AstValue* %6
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt3:
  %8 = call %Token* () @func190 ()
  %9 = getelementptr inbounds %Token, %Token* %8, i1 0, i32 1
;stmt4:
  %10 = bitcast [3 x %Nat8]* @func230_str1 to %Str
  %11 = call i1 (%Str) @func198 (%Str %10)
  br i1 %11, label %then_1, label %else_1
then_1:
;stmt5:
  %12 = call %AstType* () @func209 ()
;stmt6:
  %13 = call %AstValue* (%AstValueKind, %TokenInfo*) @func219 (%AstValueKind 31, %TokenInfo* %9)
;stmt7:
  %14 = getelementptr inbounds %AstValue, %AstValue* %13, i1 0, i32 12
  %15 = load %AstValue*, %AstValue** %1
  %16 = insertvalue %AstValueCast zeroinitializer, %AstValue* %15, 0
  %17 = insertvalue %AstValueCast %16, %AstType* %12, 1
  %18 = insertvalue %AstValueCast %17, %TokenInfo* %9, 2
  store %AstValueCast %18, %AstValueCast* %14, align 8
;stmt8:
  store %AstValue* %13, %AstValue** %1, align 8
  br label %endif_1
else_1:
;stmt9:
  %19 = bitcast [3 x %Nat8]* @func230_str2 to %Str
  %20 = call i1 (%Str) @func198 (%Str %19)
  br i1 %20, label %then_2, label %else_2
then_2:
;stmt10:
  %21 = call %AstType* () @func209 ()
;stmt11:
  %22 = call %AstValue* (%AstValueKind, %TokenInfo*) @func219 (%AstValueKind 32, %TokenInfo* %9)
;stmt12:
  %23 = getelementptr inbounds %AstValue, %AstValue* %22, i1 0, i32 13
  %24 = load %AstValue*, %AstValue** %1
  %25 = insertvalue %AstValueIs zeroinitializer, %AstValue* %24, 0
  %26 = insertvalue %AstValueIs %25, %AstType* %21, 1
  %27 = insertvalue %AstValueIs %26, %TokenInfo* %9, 2
  store %AstValueIs %27, %AstValueIs* %23, align 8
;stmt13:
  store %AstValue* %22, %AstValue** %1, align 8
  br label %endif_2
else_2:
;stmt14:
  %28 = bitcast [3 x %Nat8]* @func230_str3 to %Str
  %29 = call i1 (%Str) @func198 (%Str %28)
  br i1 %29, label %then_3, label %else_3
then_3:
;stmt15:
  %30 = call %AstType* () @func209 ()
;stmt16:
  %31 = call %AstValue* (%AstValueKind, %TokenInfo*) @func219 (%AstValueKind 33, %TokenInfo* %9)
;stmt17:
  %32 = getelementptr inbounds %AstValue, %AstValue* %31, i1 0, i32 14
  %33 = load %AstValue*, %AstValue** %1
  %34 = insertvalue %AstValueAs zeroinitializer, %AstValue* %33, 0
  %35 = insertvalue %AstValueAs %34, %AstType* %30, 1
  %36 = insertvalue %AstValueAs %35, %TokenInfo* %9, 2
  store %AstValueAs %36, %AstValueAs* %32, align 8
;stmt18:
  store %AstValue* %31, %AstValue** %1, align 8
  br label %endif_3
else_3:
  br label %endif_3
endif_3:
  br label %endif_2
endif_2:
  br label %endif_1
endif_1:
;stmt19:
  %37 = load %AstValue*, %AstValue** %1
  ret %AstValue* %37
}

define %AstValue* @func231 () {
;stmt0:
  %1 = alloca %AstValue*; loadImmPtr
  %2 = inttoptr i64 0 to%AstValue*
  store %AstValue* %2, %AstValue** %1, align 8
;stmt1:
  %3 = call %Token* () @func190 ()
  %4 = getelementptr inbounds %Token, %Token* %3, i1 0, i32 1
;stmt2:
  %5 = bitcast [2 x %Nat8]* @func231_str1 to %Str
  %6 = call i1 (%Str) @func198 (%Str %5)
  br i1 %6, label %then_0, label %else_0
then_0:
;stmt3:
  %7 = call %AstValue* () @func231 ()
;stmt4:
  %8 = call %AstValue* (%AstValueKind, %AstValue*, %TokenInfo*) @prefix (%AstValueKind 8, %AstValue* %7, %TokenInfo* %4)
  store %AstValue* %8, %AstValue** %1, align 8
  br label %endif_0
else_0:
;stmt5:
  %9 = bitcast [2 x %Nat8]* @func231_str2 to %Str
  %10 = call i1 (%Str) @func198 (%Str %9)
  br i1 %10, label %then_1, label %else_1
then_1:
;stmt6:
  %11 = call %AstValue* () @func232 ()
;stmt7:
  %12 = call %AstValue* (%AstValueKind, %AstValue*, %TokenInfo*) @prefix (%AstValueKind 7, %AstValue* %11, %TokenInfo* %4)
  store %AstValue* %12, %AstValue** %1, align 8
  br label %endif_1
else_1:
;stmt8:
  %13 = bitcast [4 x %Nat8]* @func231_str3 to %Str
  %14 = call i1 (%Str) @func198 (%Str %13)
  br i1 %14, label %then_2, label %else_2
then_2:
;stmt9:
  %15 = call %AstValue* () @func231 ()
;stmt10:
  %16 = call %AstValue* (%AstValueKind, %AstValue*, %TokenInfo*) @prefix (%AstValueKind 9, %AstValue* %15, %TokenInfo* %4)
  store %AstValue* %16, %AstValue** %1, align 8
  br label %endif_2
else_2:
;stmt11:
  %17 = bitcast [2 x %Nat8]* @func231_str4 to %Str
  %18 = call i1 (%Str) @func198 (%Str %17)
  br i1 %18, label %then_3, label %else_3
then_3:
;stmt12:
  %19 = call %AstValue* () @func231 ()
;stmt13:
  %20 = call %AstValue* (%AstValueKind, %AstValue*, %TokenInfo*) @prefix (%AstValueKind 10, %AstValue* %19, %TokenInfo* %4)
  store %AstValue* %20, %AstValue** %1, align 8
  br label %endif_3
else_3:
;stmt14:
  %21 = bitcast [2 x %Nat8]* @func231_str5 to %Str
  %22 = call i1 (%Str) @func198 (%Str %21)
  br i1 %22, label %then_4, label %else_4
then_4:
;stmt15:
  %23 = call %AstValue* () @func231 ()
;stmt16:
  %24 = call %AstValue* (%AstValueKind, %AstValue*, %TokenInfo*) @prefix (%AstValueKind 11, %AstValue* %23, %TokenInfo* %4)
  store %AstValue* %24, %AstValue** %1, align 8
  br label %endif_4
else_4:
;stmt17:
  %25 = bitcast [7 x %Nat8]* @func231_str6 to %Str
  %26 = call i1 (%Str) @func198 (%Str %25)
  br i1 %26, label %then_5, label %else_5
then_5:
;stmt18:
  %27 = call %Token* () @func190 ()
  %28 = getelementptr inbounds %Token, %Token* %27, i1 0, i32 1
;stmt19:
  %29 = call %AstType* () @func209 ()
;stmt20:; loadImmPtr
  %30 = inttoptr i64 0 to%AstType*
  %31 = icmp eq %AstType* %29, %30
  br i1 %31, label %then_6, label %else_6
then_6:
;stmt21:
  %32 = bitcast [23 x %Nat8]* @func231_str7 to %Str
  call void (%Str, %TokenInfo*) @error (%Str %32, %TokenInfo* %28)
;stmt22:; loadImmPtr
  %33 = inttoptr i64 0 to%AstValue*
  ret %AstValue* %33
  br label %endif_6
else_6:
  br label %endif_6
endif_6:
;stmt23:
  %35 = call %AstValue* (%AstValueKind, %TokenInfo*) @func219 (%AstValueKind 34, %TokenInfo* %4)
;stmt24:
  %36 = getelementptr inbounds %AstValue, %AstValue* %35, i1 0, i32 16
  %37 = insertvalue %AstValueSizeof zeroinitializer, %AstType* %29, 0
  %38 = insertvalue %AstValueSizeof %37, %TokenInfo* %4, 1
  store %AstValueSizeof %38, %AstValueSizeof* %36, align 8
;stmt25:
  store %AstValue* %35, %AstValue** %1, align 8
  br label %endif_5
else_5:
;stmt26:
  %39 = bitcast [8 x %Nat8]* @func231_str8 to %Str
  %40 = call i1 (%Str) @func198 (%Str %39)
  br i1 %40, label %then_7, label %else_7
then_7:
;stmt27:
  %41 = call %Token* () @func190 ()
  %42 = getelementptr inbounds %Token, %Token* %41, i1 0, i32 1
;stmt28:
  %43 = call %AstType* () @func209 ()
;stmt29:; loadImmPtr
  %44 = inttoptr i64 0 to%AstType*
  %45 = icmp eq %AstType* %43, %44
  br i1 %45, label %then_8, label %else_8
then_8:
;stmt30:
  %46 = bitcast [24 x %Nat8]* @func231_str9 to %Str
  call void (%Str, %TokenInfo*) @error (%Str %46, %TokenInfo* %42)
;stmt31:; loadImmPtr
  %47 = inttoptr i64 0 to%AstValue*
  ret %AstValue* %47
  br label %endif_8
else_8:
  br label %endif_8
endif_8:
;stmt32:
  %49 = call %AstValue* (%AstValueKind, %TokenInfo*) @func219 (%AstValueKind 35, %TokenInfo* %4)
;stmt33:
  %50 = getelementptr inbounds %AstValue, %AstValue* %49, i1 0, i32 17
  %51 = insertvalue %AstValueAlignof zeroinitializer, %AstType* %43, 0
  %52 = insertvalue %AstValueAlignof %51, %TokenInfo* %4, 1
  store %AstValueAlignof %52, %AstValueAlignof* %50, align 8
;stmt34:
  store %AstValue* %49, %AstValue** %1, align 8
  br label %endif_7
else_7:
;stmt35:
  %53 = call %AstValue* () @func232 ()
  store %AstValue* %53, %AstValue** %1, align 8
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
  %54 = load %AstValue*, %AstValue** %1
  ret %AstValue* %54
}

define %AstValue* @func232 () {
;stmt0:
  %1 = alloca %AstValue*
  %2 = call %AstValue* () @func233 ()
  store %AstValue* %2, %AstValue** %1, align 8
;stmt1:
  %3 = load %AstValue*, %AstValue** %1; loadImmPtr
  %4 = inttoptr i64 0 to%AstValue*
  %5 = icmp eq %AstValue* %3, %4
  br i1 %5, label %then_0, label %else_0
then_0:
;stmt2:; loadImmPtr
  %6 = inttoptr i64 0 to%AstValue*
  ret %AstValue* %6
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
  %8 = call %Token* () @func190 ()
  %9 = getelementptr inbounds %Token, %Token* %8, i1 0, i32 1
;stmt5:
  %10 = bitcast [2 x %Nat8]* @func232_str1 to %Str
  %11 = call i1 (%Str) @func198 (%Str %10)
  br i1 %11, label %then_1, label %else_1
then_1:
;stmt6:
  %12 = call %List* () @map_new ()
;stmt7:
  br label %continue_1
continue_1:
  %13 = bitcast [2 x %Nat8]* @func232_str2 to %Str
  %14 = call i1 (%Str) @func198 (%Str %13)
  %15 = xor i1 %14, 1
  br i1 %15, label %body_1, label %break_1
body_1:
;stmt8:
  %16 = call %Token* () @func190 ()
  %17 = getelementptr inbounds %Token, %Token* %16, i1 0, i32 1
;stmt9:
  %18 = call %AstValue* () @func222 ()
;stmt10:; loadImmPtr
  %19 = inttoptr i64 0 to%AstValue*
  %20 = icmp eq %AstValue* %18, %19
  br i1 %20, label %then_2, label %else_2
then_2:
;stmt11:
  %21 = bitcast [3 x %Nat8]* @func232_str3 to %Str
  call void (%Str) @skipto (%Str %21)
;stmt12:
  %22 = bitcast [2 x %Nat8]* @func232_str4 to %Str
  %23 = call i1 (%Str) @func198 (%Str %22)
  br i1 %23, label %then_3, label %else_3
then_3:
;stmt13:
  br label %continue_1
  br label %endif_3
else_3:
;stmt14:
  %25 = bitcast [2 x %Nat8]* @func232_str5 to %Str
  %26 = call i1 (%Str) @func198 (%Str %25)
  br i1 %26, label %then_4, label %else_4
then_4:
;stmt15:
  br label %break_1
  br label %endif_4
else_4:
;stmt16:; loadImmPtr
  %28 = inttoptr i64 0 to%AstValue*
  ret %AstValue* %28
  br label %endif_4
endif_4:
  br label %endif_3
endif_3:
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
;stmt17:
  %30 = bitcast %AstValue* %18 to %Unit*
  %31 = call i1 (%List*, %Unit*) @list_append (%List* %12, %Unit* %30)
;stmt18:
  %32 = bitcast [2 x %Nat8]* @func232_str6 to %Str
  %33 = call i1 (%Str) @func198 (%Str %32)
  %34 = xor i1 %33, 1
  br i1 %34, label %then_5, label %else_5
then_5:
;stmt19:
  %35 = bitcast [2 x %Nat8]* @func232_str7 to %Str
  %36 = call i1 (%Str) @need (%Str %35)
  br label %endif_5
else_5:
;stmt20:
  br label %break_1
  br label %endif_5
endif_5:
  br label %continue_1
break_1:
;stmt21:
  %38 = call %AstValue* (%AstValueKind, %TokenInfo*) @func219 (%AstValueKind 28, %TokenInfo* %9)
;stmt22:
  %39 = getelementptr inbounds %AstValue, %AstValue* %38, i1 0, i32 9
  %40 = load %AstValue*, %AstValue** %1
  %41 = insertvalue %AstValueCall zeroinitializer, %AstValue* %40, 0
  %42 = load %List, %List* %12
  %43 = insertvalue %AstValueCall %41, %List %42, 1
  %44 = insertvalue %AstValueCall %43, %TokenInfo* %9, 2
  store %AstValueCall %44, %AstValueCall* %39, align 8
;stmt23:
  store %AstValue* %38, %AstValue** %1, align 8
  br label %endif_1
else_1:
;stmt24:
  %45 = bitcast [2 x %Nat8]* @func232_str8 to %Str
  %46 = call i1 (%Str) @func198 (%Str %45)
  br i1 %46, label %then_6, label %else_6
then_6:
;stmt25:
  %47 = call %AstValue* () @func222 ()
;stmt26:
  %48 = bitcast [2 x %Nat8]* @func232_str9 to %Str
  %49 = call i1 (%Str) @func198 (%Str %48)
;stmt27:
  %50 = call %AstValue* (%AstValueKind, %TokenInfo*) @func219 (%AstValueKind 29, %TokenInfo* %9)
;stmt28:
  %51 = getelementptr inbounds %AstValue, %AstValue* %50, i1 0, i32 10
  %52 = load %AstValue*, %AstValue** %1
  %53 = insertvalue %AstValueIndex zeroinitializer, %AstValue* %52, 0
  %54 = insertvalue %AstValueIndex %53, %AstValue* %47, 1
  %55 = insertvalue %AstValueIndex %54, %TokenInfo* %9, 2
  store %AstValueIndex %55, %AstValueIndex* %51, align 8
;stmt29:
  store %AstValue* %50, %AstValue** %1, align 8
  br label %endif_6
else_6:
;stmt30:
  %56 = bitcast [2 x %Nat8]* @func232_str10 to %Str
  %57 = call i1 (%Str) @func198 (%Str %56)
  br i1 %57, label %then_7, label %else_7
then_7:
;stmt31:
  %58 = call %AstId* () @parse_id ()
;stmt32:
  %59 = call %AstValue* (%AstValueKind, %TokenInfo*) @func219 (%AstValueKind 30, %TokenInfo* %9)
;stmt33:
  %60 = getelementptr inbounds %AstValue, %AstValue* %59, i1 0, i32 11
  %61 = load %AstValue*, %AstValue** %1
  %62 = insertvalue %AstValueAccess zeroinitializer, %AstValue* %61, 0
  %63 = insertvalue %AstValueAccess %62, %AstId* %58, 1
  %64 = insertvalue %AstValueAccess %63, %TokenInfo* %9, 2
  store %AstValueAccess %64, %AstValueAccess* %60, align 8
;stmt34:
  store %AstValue* %59, %AstValue** %1, align 8
  br label %endif_7
else_7:
;stmt35:
  br label %break_0
  br label %endif_7
endif_7:
  br label %endif_6
endif_6:
  br label %endif_1
endif_1:
  br label %continue_0
break_0:
;stmt36:
  %66 = load %AstValue*, %AstValue** %1
  ret %AstValue* %66
}

define %AstValue* @func233 () {
;stmt0:
  %1 = call i1 () @func261 ()
  br i1 %1, label %then_0, label %else_0
then_0:
;stmt1:
  %2 = call %AstValue* () @func242 ()
  ret %AstValue* %2
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt2:
  %4 = alloca %AstValue*; loadImmPtr
  %5 = inttoptr i64 0 to%AstValue*
  store %AstValue* %5, %AstValue** %4, align 8
;stmt3:
  %6 = call %Token* () @func190 ()
  %7 = getelementptr inbounds %Token, %Token* %6, i1 0, i32 1
;stmt4:
  %8 = bitcast [2 x %Nat8]* @func233_str1 to %Str
  %9 = call i1 (%Str) @func198 (%Str %8)
  br i1 %9, label %then_1, label %else_1
then_1:
;stmt5:
  %10 = call i1 () @func263 ()
  br i1 %10, label %then_2, label %else_2
then_2:
;stmt6:
  %11 = call %AstValue* () @func240 ()
  ret %AstValue* %11
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
;stmt7:
  %13 = call %AstValue* () @func222 ()
  store %AstValue* %13, %AstValue** %4, align 8
;stmt8:
  %14 = bitcast [2 x %Nat8]* @func233_str2 to %Str
  %15 = call i1 (%Str) @need (%Str %14)
  br label %endif_1
else_1:
;stmt9:
  %16 = call %AstValue* () @func234 ()
  store %AstValue* %16, %AstValue** %4, align 8
  br label %endif_1
endif_1:
;stmt10:
  %17 = load %AstValue*, %AstValue** %4
  ret %AstValue* %17
}

define %AstValue* @func235 (%Token*) {
;stmt0:
  %2 = bitcast [19 x %Nat8]* @func234_func235_str1 to %Str
  %3 = getelementptr inbounds %Token, %Token* %0, i1 0, i32 1
  call void (%Str, %TokenInfo*) @error (%Str %2, %TokenInfo* %3)
;stmt1:
  %4 = bitcast [9 x %Nat8]* @func234_func235_str2 to %Str
  call void (i1, %Str) @assert (i1 0, %Str %4)
;stmt2:; loadImmPtr
  %5 = inttoptr i64 0 to%AstValue*
  ret %AstValue* %5
}

define %AstValue* @func236 (%Token*) {
;stmt0:
  %2 = bitcast [19 x %Nat8]* @func234_func236_str1 to %Str
  %3 = getelementptr inbounds %Token, %Token* %0, i1 0, i32 1
  call void (%Str, %TokenInfo*) @error (%Str %2, %TokenInfo* %3)
;stmt1:
  %4 = bitcast [14 x %Nat8]* @func234_func236_str2 to %Str
  %5 = getelementptr inbounds %Token, %Token* %0, i1 0, i32 2
; index array
  %6 = getelementptr inbounds [0 x %Nat8], [0 x %Nat8]* %5, i1 0, %Int64 0
  %7 = call %Int32 (%Str, ...) @printf (%Str %4, %Nat8* %6)
;stmt2:
  %8 = bitcast [9 x %Nat8]* @func234_func236_str3 to %Str
  call void (i1, %Str) @assert (i1 0, %Str %8)
;stmt3:; loadImmPtr
  %9 = inttoptr i64 0 to%AstValue*
  ret %AstValue* %9
}

define %AstValue* @func234 () {
;stmt0:
  %1 = call %Token* () @func190 ()
;stmt1:
  %2 = getelementptr inbounds %Token, %Token* %1, i1 0, i32 0
  %3 = load %TokenKind, %TokenKind* %2
  br label %select_1_0
select_1_0:
  %4 = icmp eq %TokenKind %3, 1
  br i1 %4, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %5 = call %AstValue* () @func237 ()
  br label %select_1_end
select_1_1:
  %6 = icmp eq %TokenKind %3, 2
  br i1 %6, label %select_1_1_ok, label %select_1_2
select_1_1_ok:
  %7 = call %AstValue* () @func244 ()
  br label %select_1_end
select_1_2:
  %8 = icmp eq %TokenKind %3, 4
  br i1 %8, label %select_1_2_ok, label %select_1_3
select_1_2_ok:
  %9 = call %AstValue* () @func239 ()
  br label %select_1_end
select_1_3:
  %10 = icmp eq %TokenKind %3, 3
  br i1 %10, label %select_1_3_ok, label %select_1_4
select_1_3_ok:
  %11 = call %AstValue* (%Token*) @func235 (%Token* %1)
  br label %select_1_end
select_1_4:
  %12 = call %AstValue* (%Token*) @func236 (%Token* %1)
  br label %select_1_end
select_1_end:
  %13 = phi %AstValue* [ %5, %select_1_0_ok ], [ %7, %select_1_1_ok ], [ %9, %select_1_2_ok ], [ %11, %select_1_3_ok ], [ %12, %select_1_4 ]
  ret %AstValue* %13
}

define %AstValue* @func237 () {
;stmt0:
  %1 = call %Token* () @func190 ()
  %2 = getelementptr inbounds %Token, %Token* %1, i1 0, i32 1
;stmt1:
  %3 = bitcast [5 x %Nat8]* @func237_str1 to %Str
  %4 = call i1 (%Str) @func198 (%Str %3)
  br i1 %4, label %then_0, label %else_0
then_0:
;stmt2:
  %5 = call %AstValue* () @func242 ()
  ret %AstValue* %5
  br label %endif_0
else_0:
;stmt3:
  %7 = bitcast [7 x %Nat8]* @func237_str2 to %Str
  %8 = call i1 (%Str) @func198 (%Str %7)
  br i1 %8, label %then_1, label %else_1
then_1:
;stmt4:
  %9 = call %AstValue* () @func243 ()
  ret %AstValue* %9
  br label %endif_1
else_1:
;stmt5:
  %11 = bitcast [6 x %Nat8]* @func237_str3 to %Str
  %12 = call i1 (%Str) @func198 (%Str %11)
  br i1 %12, label %then_2, label %else_2
then_2:
;stmt6:
  %13 = call %AstValue* () @func241 ()
  ret %AstValue* %13
  br label %endif_2
else_2:
;stmt7:
  %15 = bitcast [5 x %Nat8]* @func237_str4 to %Str
  %16 = call i1 (%Str) @func198 (%Str %15)
  br i1 %16, label %then_3, label %else_3
then_3:
;stmt8:
  %17 = call %AstValue* () @func238 ()
  ret %AstValue* %17
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
;stmt9:
  %19 = call %AstId* () @parse_id ()
;stmt10:; loadImmPtr
  %20 = inttoptr i64 0 to%AstId*
  %21 = icmp eq %AstId* %19, %20
  br i1 %21, label %then_4, label %else_4
then_4:
;stmt11:; loadImmPtr
  %22 = inttoptr i64 0 to%AstValue*
  ret %AstValue* %22
  br label %endif_4
else_4:
  br label %endif_4
endif_4:
;stmt12:
  %24 = call %AstValue* (%AstValueKind, %TokenInfo*) @func219 (%AstValueKind 3, %TokenInfo* %2)
;stmt13:
  %25 = getelementptr inbounds %AstValue, %AstValue* %24, i1 0, i32 1
  %26 = insertvalue %AstName zeroinitializer, %AstId* %19, 0
  %27 = insertvalue %AstName %26, %TokenInfo* %2, 2
  %28 = insertvalue %AstName %27, %TokenInfo* %2, 2
  store %AstName %28, %AstName* %25, align 8
;stmt14:
  ret %AstValue* %24
;stmt15:
  br label %fail
fail:
;stmt16:; loadImmPtr
  %30 = inttoptr i64 0 to%AstValue*
  ret %AstValue* %30
}

define %AstValue* @func238 () {
;stmt0:
  %1 = call %Token* () @func190 ()
;stmt1:
  %2 = getelementptr inbounds %Token, %Token* %1, i1 0, i32 1
  %3 = call %AstValue* (%AstValueKind, %TokenInfo*) @func219 (%AstValueKind 36, %TokenInfo* %2)
;stmt2:
  %4 = getelementptr inbounds %AstValue, %AstValue* %3, i1 0, i32 15
  %5 = getelementptr inbounds %AstValueWhen, %AstValueWhen* %4, i1 0, i32 1
  call void (%List*) @map_init (%List* %5)
;stmt3:
  %6 = getelementptr inbounds %AstValue, %AstValue* %3, i1 0, i32 15
  %7 = getelementptr inbounds %AstValueWhen, %AstValueWhen* %6, i1 0, i32 0
  %8 = call %AstValue* () @func222 ()
  store %AstValue* %8, %AstValue** %7, align 8
;stmt4:
  call void () @skip_nl ()
;stmt5:
  %9 = bitcast [2 x %Nat8]* @func238_str1 to %Str
  %10 = call i1 (%Str) @need (%Str %9)
;stmt6:
  call void () @skip_nl ()
;stmt7:
  br label %continue_0
continue_0:
  %11 = bitcast [2 x %Nat8]* @func238_str2 to %Str
  %12 = call i1 (%Str) @func198 (%Str %11)
  %13 = xor i1 %12, 1
  br i1 %13, label %body_0, label %break_0
body_0:
;stmt8:
  %14 = bitcast [5 x %Nat8]* @func238_str3 to %Str
  %15 = call i1 (%Str) @func198 (%Str %14)
  br i1 %15, label %then_0, label %else_0
then_0:
;stmt9:
  %16 = bitcast [3 x %Nat8]* @func238_str4 to %Str
  %17 = call i1 (%Str) @need (%Str %16)
;stmt10:
  %18 = getelementptr inbounds %AstValue, %AstValue* %3, i1 0, i32 15
  %19 = getelementptr inbounds %AstValueWhen, %AstValueWhen* %18, i1 0, i32 2
  %20 = call %AstValue* () @func222 ()
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
  %22 = call %Unit* (%Nat32) @malloc (%Nat32 32)
  %23 = bitcast %Unit* %22 to %AstValueWhenVariant*
;stmt14:
  %24 = bitcast %AstValueWhenVariant* %23 to %Unit*
  %25 = call %Unit* (%Unit*, %Nat8, %Nat32) @memset (%Unit* %24, %Nat8 0, %Nat32 32)
;stmt15:
  %26 = call i1 () @func261 ()
  br i1 %26, label %then_1, label %else_1
then_1:
;stmt16:
  %27 = getelementptr inbounds %AstValueWhenVariant, %AstValueWhenVariant* %23, i1 0, i32 0
  %28 = call %AstType* () @func209 ()
  store %AstType* %28, %AstType** %27, align 8
  br label %endif_1
else_1:
;stmt17:
  %29 = getelementptr inbounds %AstValueWhenVariant, %AstValueWhenVariant* %23, i1 0, i32 1
  %30 = call %AstValue* () @func222 ()
  store %AstValue* %30, %AstValue** %29, align 8
  br label %endif_1
endif_1:
;stmt18:
  %31 = bitcast [3 x %Nat8]* @func238_str5 to %Str
  %32 = call i1 (%Str) @need (%Str %31)
;stmt19:
  %33 = getelementptr inbounds %AstValueWhenVariant, %AstValueWhenVariant* %23, i1 0, i32 2
  %34 = call %AstValue* () @func222 ()
  store %AstValue* %34, %AstValue** %33, align 8
;stmt20:
  call void () @skip_nl ()
;stmt21:
  %35 = getelementptr inbounds %AstValue, %AstValue* %3, i1 0, i32 15
  %36 = getelementptr inbounds %AstValueWhen, %AstValueWhen* %35, i1 0, i32 1
  %37 = bitcast %AstValueWhenVariant* %23 to %Unit*
  %38 = call i1 (%List*, %Unit*) @list_append (%List* %36, %Unit* %37)
  br label %continue_0
break_0:
;stmt22:
  ret %AstValue* %3
}

define %AstValue* @func239 () {
;stmt0:
  %1 = call %Token* () @func190 ()
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
  %9 = call %AstValue* (%AstValueKind, %TokenInfo*) @func219 (%AstValueKind 2, %TokenInfo* %8)
;stmt6:
  %10 = getelementptr inbounds %AstValue, %AstValue* %9, i1 0, i32 4
  %11 = insertvalue %AstValueString zeroinitializer, %Str %7, 0
  %12 = getelementptr inbounds %Token, %Token* %1, i1 0, i32 1
  %13 = insertvalue %AstValueString %11, %TokenInfo* %12, 1
  store %AstValueString %13, %AstValueString* %10, align 8
;stmt7:
  ret %AstValue* %9
}

define %AstValue* @func240 () {
;stmt0:
  %1 = alloca %List
  store %List zeroinitializer, %List* %1, align 8
;stmt1:
  %2 = call %Token* () @func190 ()
  %3 = getelementptr inbounds %Token, %Token* %2, i1 0, i32 1
;stmt2:
  br label %continue_0
continue_0:
  br i1 1, label %body_0, label %break_0
body_0:
;stmt3:
  %4 = call %AstId* () @parse_id ()
;stmt4:
  %5 = bitcast [2 x %Nat8]* @func240_str1 to %Str
  %6 = call i1 (%Str) @need (%Str %5)
;stmt5:
  %7 = call %AstValue* () @func222 ()
;stmt6:
  %8 = getelementptr inbounds %List, %List* %1, i1 0
  %9 = getelementptr inbounds %AstId, %AstId* %4, i1 0, i32 0
  %10 = load %Str, %Str* %9
  %11 = bitcast %AstValue* %7 to %Unit*
  %12 = call i1 (%List*, %Str, %Unit*) @map_append (%List* %8, %Str %10, %Unit* %11)
;stmt7:
  %13 = bitcast [2 x %Nat8]* @func240_str2 to %Str
  %14 = call i1 (%Str) @func198 (%Str %13)
  br i1 %14, label %then_0, label %else_0
then_0:
;stmt8:
  br label %break_0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt9:
  %16 = bitcast [2 x %Nat8]* @func240_str3 to %Str
  %17 = call i1 (%Str) @need (%Str %16)
  br label %continue_0
break_0:
;stmt10:
  %18 = call %AstValue* (%AstValueKind, %TokenInfo*) @func219 (%AstValueKind 6, %TokenInfo* %3)
;stmt11:
  %19 = getelementptr inbounds %AstValue, %AstValue* %18, i1 0, i32 2
  %20 = load %List, %List* %1
  %21 = insertvalue %AstValueRecord zeroinitializer, %List %20, 0
  %22 = insertvalue %AstValueRecord %21, %TokenInfo* %3, 1
  store %AstValueRecord %22, %AstValueRecord* %19, align 8
;stmt12:
  ret %AstValue* %18
}

define %AstValue* @func241 () {
;stmt0:
  %1 = call %Token* () @func190 ()
  %2 = getelementptr inbounds %Token, %Token* %1, i1 0, i32 1
;stmt1:
  %3 = alloca %List
  store %List zeroinitializer, %List* %3, align 8
;stmt2:
  %4 = alloca %Nat32
  store %Nat32 0, %Nat32* %4, align 4
;stmt3:
  br label %continue_0
continue_0:
  br i1 1, label %body_0, label %break_0
body_0:
;stmt4:
  %5 = call %AstValue* () @func222 ()
;stmt5:
  %6 = getelementptr inbounds %List, %List* %3, i1 0
  %7 = bitcast %AstValue* %5 to %Unit*
  %8 = call i1 (%List*, %Unit*) @list_append (%List* %6, %Unit* %7)
;stmt6:
  %9 = load %Nat32, %Nat32* %4
  %10 = add %Nat32 %9, 1
  store %Nat32 %10, %Nat32* %4, align 4
;stmt7:
  %11 = bitcast [2 x %Nat8]* @func241_str1 to %Str
  %12 = call i1 (%Str) @func198 (%Str %11)
  br i1 %12, label %then_0, label %else_0
then_0:
;stmt8:
  br label %break_0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt9:
  %14 = bitcast [2 x %Nat8]* @func241_str2 to %Str
  %15 = call i1 (%Str) @need (%Str %14)
  br label %continue_0
break_0:
;stmt10:
  %16 = call %AstValue* (%AstValueKind, %TokenInfo*) @func219 (%AstValueKind 5, %TokenInfo* %2)
;stmt11:
  %17 = getelementptr inbounds %AstValue, %AstValue* %16, i1 0, i32 3
  %18 = load %List, %List* %3
  %19 = insertvalue %AstValueArray zeroinitializer, %List %18, 0
  %20 = insertvalue %AstValueArray %19, %TokenInfo* %2, 1
  store %AstValueArray %20, %AstValueArray* %17, align 8
;stmt12:
  ret %AstValue* %16
}

define %AstValue* @func242 () {
;stmt0:
  %1 = call %Token* () @func190 ()
  %2 = getelementptr inbounds %Token, %Token* %1, i1 0, i32 1
;stmt1:
  %3 = call %AstType* () @func209 ()
;stmt2:
  call void () @skip_nl ()
;stmt3:
  %4 = call %Token* () @func190 ()
  %5 = getelementptr inbounds %Token, %Token* %4, i1 0, i32 1
;stmt4:
  %6 = bitcast [2 x %Nat8]* @func242_str1 to %Str
  %7 = call i1 (%Str) @need (%Str %6)
;stmt5:
  %8 = call %union.8 (%TokenInfo*) @func253 (%TokenInfo* %5)
;stmt6:
  %9 = call %AstValue* (%AstValueKind, %TokenInfo*) @func219 (%AstValueKind 4, %TokenInfo* %2)
;stmt7:
  %10 = getelementptr inbounds %AstValue, %AstValue* %9, i1 0, i32 6
  %11 = insertvalue %AstValueFunc zeroinitializer, %AstType* %3, 0
  %12 = bitcast %union.8 %8 to %union.3*
  %13 = bitcast %union.3* %12 to %union.0
  %14 = insertvalue %AstValueFunc %11, %union.0 %13, 1
  %15 = insertvalue %AstValueFunc %14, %TokenInfo* %5, 2
  store %AstValueFunc %15, %AstValueFunc* %10, align 16
;stmt8:
  ret %AstValue* %9
}

define %AstValue* @func243 () {
;stmt0:
  %1 = call %Token* () @func190 ()
  %2 = getelementptr inbounds %Token, %Token* %1, i1 0, i32 1
;stmt1:
  %3 = call %AstType* () @func209 ()
;stmt2:
  %4 = call %AstValue* (%AstValueKind, %TokenInfo*) @func219 (%AstValueKind 4, %TokenInfo* %2)
;stmt3:
  %5 = getelementptr inbounds %AstValue, %AstValue* %4, i1 0, i32 6
  %6 = insertvalue %AstValueFunc zeroinitializer, %AstType* %3, 0
  %7 = inttoptr %Unit zeroinitializer to %union.0
  %8 = insertvalue %AstValueFunc %6, %union.0 %7, 1
  %9 = insertvalue %AstValueFunc %8, %TokenInfo* %2, 2
  store %AstValueFunc %9, %AstValueFunc* %5, align 16
;stmt4:
  %10 = getelementptr inbounds %AstValue, %AstValue* %4, i1 0, i32 18
  store i1 1, i1* %10, align 1
;stmt5:
  ret %AstValue* %4
}

define %AstValue* @func244 () {
;stmt0:
  %1 = call %Token* () @func190 ()
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
  %7 = call %AstValue* (%AstValueKind, %TokenInfo*) @func219 (%AstValueKind 1, %TokenInfo* %2)
;stmt5:
  %8 = getelementptr inbounds %AstValue, %AstValue* %7, i1 0, i32 5
  %9 = insertvalue %AstValueNumber zeroinitializer, %Str %6, 0
  %10 = insertvalue %AstValueNumber %9, %TokenInfo* %2, 1
  store %AstValueNumber %10, %AstValueNumber* %8, align 8
;stmt6:
  ret %AstValue* %7
}

define %union.3* @ast_stmt_boxing (%union.3) {
;stmt0:
  %2 = call %Unit* (%Nat32) @malloc (%Nat32 64)
  %3 = bitcast %Unit* %2 to %union.3*
;stmt1:; loadImmPtr
  %4 = inttoptr i64 0 to%union.3*
  %5 = icmp ne %union.3* %3, %4
  %6 = bitcast [21 x %Nat8]* @func245_str1 to %Str
  call void (i1, %Str) @assert (i1 %5, %Str %6)
;stmt2:
  store %union.3 %0, %union.3* %3, align 64
;stmt3:
  ret %union.3* %3
}

define %union.8 @func246 (%TokenInfo*) {
;stmt0:
  %2 = insertvalue %AstStmtBreak zeroinitializer, %TokenInfo* %0, 0
  %3 = alloca %union.3
; write variant 10
  %4 = getelementptr inbounds %union.3, %union.3* %3, i1 0, i32 0
  store %Int16 10, %Int16* %4, align 2
; write data
  %5 = getelementptr inbounds %union.3, %union.3* %3, i1 0, i32 1
  %6 = bitcast [48 x %Nat8]* %5 to %AstStmtBreak*
  store %AstStmtBreak %2, %AstStmtBreak* %6, align 8
  %7 = load %union.3, %union.3* %3
  %8 = call %union.3* (%union.3) @ast_stmt_boxing (%union.3 %7)
  %9 = bitcast %union.3* %8 to %union.8
  ret %union.8 %9
}

define %union.8 @func247 (%TokenInfo*) {
;stmt0:
  %2 = insertvalue %AstStmtContinue zeroinitializer, %TokenInfo* %0, 0
  %3 = alloca %union.3
; write variant 11
  %4 = getelementptr inbounds %union.3, %union.3* %3, i1 0, i32 0
  store %Int16 11, %Int16* %4, align 2
; write data
  %5 = getelementptr inbounds %union.3, %union.3* %3, i1 0, i32 1
  %6 = bitcast [48 x %Nat8]* %5 to %AstStmtContinue*
  store %AstStmtContinue %2, %AstStmtContinue* %6, align 8
  %7 = load %union.3, %union.3* %3
  %8 = call %union.3* (%union.3) @ast_stmt_boxing (%union.3 %7)
  %9 = bitcast %union.3* %8 to %union.8
  ret %union.8 %9
}

define %union.10 @func249 () {
;stmt0:
  %1 = call %Token* () @func190 ()
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
  %9 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func248_func249_str1, i1 0, %Int64 0
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
  %18 = call %Token* () @func190 ()
  %19 = getelementptr inbounds %Token, %Token* %18, i1 0, i32 1
;stmt7:
  %20 = insertvalue %AstStmtLabel zeroinitializer, %AstId* %17, 0
  %21 = insertvalue %AstStmtLabel %20, %TokenInfo* %19, 1
  %22 = alloca %union.3
; write variant 9
  %23 = getelementptr inbounds %union.3, %union.3* %22, i1 0, i32 0
  store %Int16 9, %Int16* %23, align 2
; write data
  %24 = getelementptr inbounds %union.3, %union.3* %22, i1 0, i32 1
  %25 = bitcast [48 x %Nat8]* %24 to %AstStmtLabel*
  store %AstStmtLabel %21, %AstStmtLabel* %25, align 8
  %26 = load %union.3, %union.3* %22
  %27 = call %union.3* (%union.3) @ast_stmt_boxing (%union.3 %26)
  %28 = bitcast %union.3* %27 to %union.10
  ret %union.10 %28
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt8:
  %30 = getelementptr inbounds %Token, %Token* %1, i1 0, i32 1
  %31 = call %union.8 (%TokenInfo*) @func250 (%TokenInfo* %30)
  ret %union.8 %31
}

define %union.9 @func248 () {
;stmt0:
  %1 = call %Token* () @func190 ()
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
  %13 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func248_str1, i1 0, %Int64 0
  %14 = load %Nat8, %Nat8* %13
  %15 = icmp eq %Nat8 %12, %14
  %16 = and i1 %9, %15
  %17 = and i1 %6, %16
;stmt4:
  br i1 %17, label %then_0, label %else_0
then_0:
;stmt5:
  br label %select_1_0
select_1_0:
  %18 = getelementptr inbounds %Token, %Token* %1, i1 0, i32 2
; index array
  %19 = getelementptr inbounds [0 x %Nat8], [0 x %Nat8]* %18, i1 0, %Int64 0
  %20 = load %Nat8, %Nat8* %19
  %21 = call i1 (%Nat8) @isUpperCase (%Nat8 %20)
  %22 = icmp eq i1 1, %21
  br i1 %22, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %23 = call %union.8 (%TokenInfo*) @func252 (%TokenInfo* %3)
  br label %select_1_end
select_1_1:
  %24 = call %union.8 (%TokenInfo*) @func251 (%TokenInfo* %3)
  br label %select_1_end
select_1_end:
  %25 = phi %union.8 [ %23, %select_1_0_ok ], [ %24, %select_1_1 ]
  ret %union.8 %25
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt6:
  br label %select_2_0
select_2_0:
  %27 = bitcast [2 x %Nat8]* @func248_str2 to %Str
  %28 = call i1 (%Str) @func198 (%Str %27)
  %29 = icmp eq i1 1, %28
  br i1 %29, label %select_2_0_ok, label %select_2_1
select_2_0_ok:
  %30 = call %union.8 (%TokenInfo*) @func253 (%TokenInfo* %3)
  br label %select_2_end
select_2_1:
  %31 = bitcast [3 x %Nat8]* @func248_str3 to %Str
  %32 = call i1 (%Str) @func198 (%Str %31)
  %33 = icmp eq i1 1, %32
  br i1 %33, label %select_2_1_ok, label %select_2_2
select_2_1_ok:
  %34 = call %union.8 (%TokenInfo*) @func254 (%TokenInfo* %3)
  br label %select_2_end
select_2_2:
  %35 = bitcast [6 x %Nat8]* @func248_str4 to %Str
  %36 = call i1 (%Str) @func198 (%Str %35)
  %37 = icmp eq i1 1, %36
  br i1 %37, label %select_2_2_ok, label %select_2_3
select_2_2_ok:
  %38 = call %union.8 (%TokenInfo*) @func255 (%TokenInfo* %3)
  br label %select_2_end
select_2_3:
  %39 = bitcast [7 x %Nat8]* @func248_str5 to %Str
  %40 = call i1 (%Str) @func198 (%Str %39)
  %41 = icmp eq i1 1, %40
  br i1 %41, label %select_2_3_ok, label %select_2_4
select_2_3_ok:
  %42 = call %union.8 (%TokenInfo*) @func256 (%TokenInfo* %3)
  br label %select_2_end
select_2_4:
  %43 = bitcast [6 x %Nat8]* @func248_str6 to %Str
  %44 = call i1 (%Str) @func198 (%Str %43)
  %45 = icmp eq i1 1, %44
  br i1 %45, label %select_2_4_ok, label %select_2_5
select_2_4_ok:
  %46 = call %union.8 (%TokenInfo*) @func246 (%TokenInfo* %3)
  br label %select_2_end
select_2_5:
  %47 = bitcast [9 x %Nat8]* @func248_str7 to %Str
  %48 = call i1 (%Str) @func198 (%Str %47)
  %49 = icmp eq i1 1, %48
  br i1 %49, label %select_2_5_ok, label %select_2_6
select_2_5_ok:
  %50 = call %union.8 (%TokenInfo*) @func247 (%TokenInfo* %3)
  br label %select_2_end
select_2_6:
  %51 = bitcast [5 x %Nat8]* @func248_str8 to %Str
  %52 = call i1 (%Str) @func198 (%Str %51)
  %53 = icmp eq i1 1, %52
  br i1 %53, label %select_2_6_ok, label %select_2_7
select_2_6_ok:
  %54 = call %union.8 (%TokenInfo*) @func257 (%TokenInfo* %3)
  br label %select_2_end
select_2_7:
  %55 = call %union.10 () @func249 ()
  br label %select_2_end
select_2_end:
  %56 = phi %union.8 [ %30, %select_2_0_ok ], [ %34, %select_2_1_ok ], [ %38, %select_2_2_ok ], [ %42, %select_2_3_ok ], [ %46, %select_2_4_ok ], [ %50, %select_2_5_ok ], [ %54, %select_2_6_ok ], [ %55, %select_2_7 ]
  ret %union.8 %56
}

define %union.8 @func250 (%TokenInfo*) {
;stmt0:
  %2 = call %AstValue* () @func222 ()
;stmt1:
  %3 = bitcast [3 x %Nat8]* @func250_str1 to %Str
  %4 = call i1 (%Str) @func198 (%Str %3)
  br i1 %4, label %then_0, label %else_0
then_0:
;stmt2:
  %5 = call %AstValue* () @func222 ()
;stmt3:
  %6 = insertvalue %AstStmtAssign zeroinitializer, %AstValue* %2, 0
  %7 = insertvalue %AstStmtAssign %6, %AstValue* %5, 1
  %8 = insertvalue %AstStmtAssign %7, %TokenInfo* %0, 2
  %9 = alloca %union.3
; write variant 0
  %10 = getelementptr inbounds %union.3, %union.3* %9, i1 0, i32 0
  store %Int16 0, %Int16* %10, align 2
; write data
  %11 = getelementptr inbounds %union.3, %union.3* %9, i1 0, i32 1
  %12 = bitcast [48 x %Nat8]* %11 to %AstStmtAssign*
  store %AstStmtAssign %8, %AstStmtAssign* %12, align 8
  %13 = load %union.3, %union.3* %9
  %14 = call %union.3* (%union.3) @ast_stmt_boxing (%union.3 %13)
  %15 = bitcast %union.3* %14 to %union.8
  ret %union.8 %15
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt4:
  %17 = insertvalue %AstStmtExpr zeroinitializer, %AstValue* %2, 0
  %18 = insertvalue %AstStmtExpr %17, %TokenInfo* %0, 1
  %19 = alloca %union.3
; write variant 3
  %20 = getelementptr inbounds %union.3, %union.3* %19, i1 0, i32 0
  store %Int16 3, %Int16* %20, align 2
; write data
  %21 = getelementptr inbounds %union.3, %union.3* %19, i1 0, i32 1
  %22 = bitcast [48 x %Nat8]* %21 to %AstStmtExpr*
  store %AstStmtExpr %18, %AstStmtExpr* %22, align 8
  %23 = load %union.3, %union.3* %19
  %24 = call %union.3* (%union.3) @ast_stmt_boxing (%union.3 %23)
  %25 = bitcast %union.3* %24 to %union.8
  ret %union.8 %25
}

define %union.8 @func251 (%TokenInfo*) {
;stmt0:
  %2 = call %Token* () @func190 ()
  %3 = getelementptr inbounds %Token, %Token* %2, i1 0, i32 1
;stmt1:
  %4 = call %AstId* () @parse_id ()
;stmt2:
  %5 = bitcast [2 x %Nat8]* @func251_str1 to %Str
  %6 = call i1 (%Str) @need (%Str %5)
;stmt3:
  %7 = call %AstValue* () @func222 ()
;stmt4:; loadImmPtr
  %8 = inttoptr i64 0 to%AstId*
  %9 = icmp eq %AstId* %4, %8; loadImmPtr
  %10 = inttoptr i64 0 to%AstValue*
  %11 = icmp eq %AstValue* %7, %10
  %12 = or i1 %9, %11
  br i1 %12, label %then_0, label %else_0
then_0:
;stmt5:
  %13 = inttoptr %Unit zeroinitializer to %union.8
  ret %union.8 %13
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt6:
  %15 = insertvalue %AstStmtValueBind zeroinitializer, %AstId* %4, 0
  %16 = insertvalue %AstStmtValueBind %15, %AstValue* %7, 1
  %17 = insertvalue %AstStmtValueBind %16, %TokenInfo* %3, 2
  %18 = alloca %union.3
; write variant 1
  %19 = getelementptr inbounds %union.3, %union.3* %18, i1 0, i32 0
  store %Int16 1, %Int16* %19, align 2
; write data
  %20 = getelementptr inbounds %union.3, %union.3* %18, i1 0, i32 1
  %21 = bitcast [48 x %Nat8]* %20 to %AstStmtValueBind*
  store %AstStmtValueBind %17, %AstStmtValueBind* %21, align 8
  %22 = load %union.3, %union.3* %18
  %23 = call %union.3* (%union.3) @ast_stmt_boxing (%union.3 %22)
  %24 = bitcast %union.3* %23 to %union.8
  ret %union.8 %24
}

define %union.8 @func252 (%TokenInfo*) {
;stmt0:
  %2 = call %Token* () @func190 ()
  %3 = getelementptr inbounds %Token, %Token* %2, i1 0, i32 1
;stmt1:
  %4 = call %AstId* () @parse_id ()
;stmt2:
  %5 = bitcast [2 x %Nat8]* @func252_str1 to %Str
  %6 = call i1 (%Str) @need (%Str %5)
;stmt3:
  %7 = call %AstType* () @func209 ()
;stmt4:; loadImmPtr
  %8 = inttoptr i64 0 to%AstId*
  %9 = icmp eq %AstId* %4, %8; loadImmPtr
  %10 = inttoptr i64 0 to%AstType*
  %11 = icmp eq %AstType* %7, %10
  %12 = or i1 %9, %11
  br i1 %12, label %then_0, label %else_0
then_0:
;stmt5:
  %13 = inttoptr %Unit zeroinitializer to %union.8
  ret %union.8 %13
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt6:
  %15 = insertvalue %AstStmtTypeBind zeroinitializer, %AstId* %4, 0
  %16 = insertvalue %AstStmtTypeBind %15, %AstType* %7, 1
  %17 = insertvalue %AstStmtTypeBind %16, %TokenInfo* %3, 2
  %18 = alloca %union.3
; write variant 2
  %19 = getelementptr inbounds %union.3, %union.3* %18, i1 0, i32 0
  store %Int16 2, %Int16* %19, align 2
; write data
  %20 = getelementptr inbounds %union.3, %union.3* %18, i1 0, i32 1
  %21 = bitcast [48 x %Nat8]* %20 to %AstStmtTypeBind*
  store %AstStmtTypeBind %17, %AstStmtTypeBind* %21, align 8
  %22 = load %union.3, %union.3* %18
  %23 = call %union.3* (%union.3) @ast_stmt_boxing (%union.3 %22)
  %24 = bitcast %union.3* %23 to %union.8
  ret %union.8 %24
}

define %union.8 @func253 (%TokenInfo*) {
;stmt0:
  %2 = alloca %List
  store %List zeroinitializer, %List* %2, align 8
;stmt1:
  %3 = getelementptr inbounds %List, %List* %2, i1 0
  call void (%List*) @map_init (%List* %3)
;stmt2:
  br label %continue_0
continue_0:
  %4 = bitcast [2 x %Nat8]* @func253_str1 to %Str
  %5 = call i1 (%Str) @func198 (%Str %4)
  %6 = xor i1 %5, 1
  br i1 %6, label %body_0, label %break_0
body_0:
;stmt3:
  call void () @skip_nl ()
;stmt4:
  %7 = call i1 () @eof ()
  br i1 %7, label %then_0, label %else_0
then_0:
;stmt5:
  %8 = bitcast [23 x %Nat8]* @func253_str2 to %Str
  call void (%Str) @fatal (%Str %8)
;stmt6:
  br label %break_0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt7:
  %10 = bitcast [2 x %Nat8]* @func253_str3 to %Str
  %11 = call i1 (%Str) @func198 (%Str %10)
  br i1 %11, label %then_1, label %else_1
then_1:
;stmt8:
  br label %break_0
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt9:
  %13 = call %union.9 () @func248 ()
;stmt10:
  %14 = bitcast %Int64 0 to %Int64
  %15 = ptrtoint %union.9 %13 to %Int64
  %16 = icmp eq %Int64 %15, %14
  %17 = xor i1 %16, 1
  br i1 %17, label %then_2, label %else_2
then_2:
;stmt11:
  %18 = call i1 () @need_sep ()
;stmt12:
  %19 = getelementptr inbounds %List, %List* %2, i1 0
  %20 = bitcast %union.9 %13 to %union.3*
  %21 = bitcast %union.3* %20 to %Unit*
  %22 = call i1 (%List*, %Unit*) @list_append (%List* %19, %Unit* %21)
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
  br label %continue_0
break_0:
;stmt13:
  %23 = load %List, %List* %2
  %24 = insertvalue %AstStmtBlock zeroinitializer, %List %23, 0
  %25 = insertvalue %AstStmtBlock %24, %TokenInfo* %0, 1
  %26 = alloca %union.3
; write variant 4
  %27 = getelementptr inbounds %union.3, %union.3* %26, i1 0, i32 0
  store %Int16 4, %Int16* %27, align 2
; write data
  %28 = getelementptr inbounds %union.3, %union.3* %26, i1 0, i32 1
  %29 = bitcast [48 x %Nat8]* %28 to %AstStmtBlock*
  store %AstStmtBlock %25, %AstStmtBlock* %29, align 8
  %30 = load %union.3, %union.3* %26
  %31 = call %union.3* (%union.3) @ast_stmt_boxing (%union.3 %30)
  %32 = bitcast %union.3* %31 to %union.8
  ret %union.8 %32
}

define %union.8 @func254 (%TokenInfo*) {
;stmt0:
  %2 = call %AstValue* () @func222 ()
;stmt1:
  %3 = bitcast [2 x %Nat8]* @func254_str1 to %Str
  %4 = call i1 (%Str) @func198 (%Str %3)
;stmt2:
  %5 = call %Token* () @func190 ()
  %6 = getelementptr inbounds %Token, %Token* %5, i1 0, i32 1
;stmt3:
  %7 = bitcast [2 x %Nat8]* @func254_str2 to %Str
  %8 = call i1 (%Str) @need (%Str %7)
;stmt4:
  %9 = call %union.8 (%TokenInfo*) @func253 (%TokenInfo* %6)
;stmt5:
  %10 = alloca %union.11
  %11 = inttoptr %Unit zeroinitializer to %union.11
  store %union.11 %11, %union.11* %10, align 16
;stmt6:
  %12 = bitcast [5 x %Nat8]* @func254_str3 to %Str
  %13 = call i1 (%Str) @func198 (%Str %12)
  br i1 %13, label %then_0, label %else_0
then_0:
;stmt7:
  %14 = bitcast [2 x %Nat8]* @func254_str4 to %Str
  %15 = call i1 (%Str) @func198 (%Str %14)
;stmt8:
  %16 = call %Token* () @func190 ()
  %17 = getelementptr inbounds %Token, %Token* %16, i1 0, i32 1
;stmt9:
  %18 = bitcast [3 x %Nat8]* @func254_str5 to %Str
  %19 = call i1 (%Str) @func198 (%Str %18)
  br i1 %19, label %then_1, label %else_1
then_1:
;stmt10:
  %20 = call %union.8 (%TokenInfo*) @func254 (%TokenInfo* %17)
  store %union.8 %20, %union.8* %10, align 16
  br label %endif_1
else_1:
;stmt11:
  %21 = bitcast [2 x %Nat8]* @func254_str6 to %Str
  %22 = call i1 (%Str) @need (%Str %21)
;stmt12:
  %23 = call %union.8 (%TokenInfo*) @func253 (%TokenInfo* %17)
  store %union.8 %23, %union.8* %10, align 16
  br label %endif_1
endif_1:
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt13:; loadImmPtr
  %24 = inttoptr i64 0 to%AstValue*
  %25 = icmp eq %AstValue* %2, %24
  br i1 %25, label %then_2, label %else_2
then_2:
;stmt14:
  %26 = inttoptr %Unit zeroinitializer to %union.8
  ret %union.8 %26
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
;stmt15:
  %28 = bitcast %Int64 0 to %Int64
  %29 = ptrtoint %union.8 %9 to %Int64
  %30 = icmp eq %Int64 %29, %28
  br i1 %30, label %then_3, label %else_3
then_3:
;stmt16:
  %31 = inttoptr %Unit zeroinitializer to %union.8
  ret %union.8 %31
  br label %endif_3
else_3:
  br label %endif_3
endif_3:
;stmt17:
  %33 = insertvalue %AstStmtIf zeroinitializer, %AstValue* %2, 0
  %34 = bitcast %union.8 %9 to %union.3*
  %35 = insertvalue %AstStmtIf %33, %union.3* %34, 1
  %36 = load %union.11, %union.11* %10
  %37 = insertvalue %AstStmtIf %35, %union.11 %36, 2
  %38 = insertvalue %AstStmtIf %37, %TokenInfo* %0, 3
  %39 = alloca %union.3
; write variant 5
  %40 = getelementptr inbounds %union.3, %union.3* %39, i1 0, i32 0
  store %Int16 5, %Int16* %40, align 2
; write data
  %41 = getelementptr inbounds %union.3, %union.3* %39, i1 0, i32 1
  %42 = bitcast [48 x %Nat8]* %41 to %AstStmtIf*
  store %AstStmtIf %38, %AstStmtIf* %42, align 16
  %43 = load %union.3, %union.3* %39
  %44 = call %union.3* (%union.3) @ast_stmt_boxing (%union.3 %43)
  %45 = bitcast %union.3* %44 to %union.8
  ret %union.8 %45
}

define %union.8 @func255 (%TokenInfo*) {
;stmt0:
  %2 = call %AstValue* () @func222 ()
;stmt1:
  %3 = bitcast [2 x %Nat8]* @func255_str1 to %Str
  %4 = call i1 (%Str) @func198 (%Str %3)
;stmt2:
  %5 = call %Token* () @func190 ()
  %6 = getelementptr inbounds %Token, %Token* %5, i1 0, i32 1
;stmt3:
  %7 = bitcast [2 x %Nat8]* @func255_str2 to %Str
  %8 = call i1 (%Str) @need (%Str %7)
;stmt4:
  %9 = call %union.8 (%TokenInfo*) @func253 (%TokenInfo* %6)
;stmt5:; loadImmPtr
  %10 = inttoptr i64 0 to%AstValue*
  %11 = icmp eq %AstValue* %2, %10
  br i1 %11, label %then_0, label %else_0
then_0:
;stmt6:
  %12 = inttoptr %Unit zeroinitializer to %union.8
  ret %union.8 %12
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt7:
  %14 = bitcast %Int64 0 to %Int64
  %15 = ptrtoint %union.8 %9 to %Int64
  %16 = icmp eq %Int64 %15, %14
  br i1 %16, label %then_1, label %else_1
then_1:
;stmt8:
  %17 = inttoptr %Unit zeroinitializer to %union.8
  ret %union.8 %17
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt9:
  %19 = insertvalue %AstStmtWhile zeroinitializer, %AstValue* %2, 0
  %20 = bitcast %union.8 %9 to %union.3*
  %21 = insertvalue %AstStmtWhile %19, %union.3* %20, 1
  %22 = insertvalue %AstStmtWhile %21, %TokenInfo* %0, 2
  %23 = alloca %union.3
; write variant 6
  %24 = getelementptr inbounds %union.3, %union.3* %23, i1 0, i32 0
  store %Int16 6, %Int16* %24, align 2
; write data
  %25 = getelementptr inbounds %union.3, %union.3* %23, i1 0, i32 1
  %26 = bitcast [48 x %Nat8]* %25 to %AstStmtWhile*
  store %AstStmtWhile %22, %AstStmtWhile* %26, align 8
  %27 = load %union.3, %union.3* %23
  %28 = call %union.3* (%union.3) @ast_stmt_boxing (%union.3 %27)
  %29 = bitcast %union.3* %28 to %union.8
  ret %union.8 %29
}

define %union.8 @func256 (%TokenInfo*) {
;stmt0:
  %2 = call i1 () @func194 ()
  br i1 %2, label %then_0, label %else_0
then_0:
;stmt1:
  %3 = inttoptr %Unit zeroinitializer to %union.2
  %4 = insertvalue %AstStmtReturn zeroinitializer, %union.2 %3, 0
  %5 = insertvalue %AstStmtReturn %4, %TokenInfo* %0, 1
  %6 = alloca %union.3
; write variant 7
  %7 = getelementptr inbounds %union.3, %union.3* %6, i1 0, i32 0
  store %Int16 7, %Int16* %7, align 2
; write data
  %8 = getelementptr inbounds %union.3, %union.3* %6, i1 0, i32 1
  %9 = bitcast [48 x %Nat8]* %8 to %AstStmtReturn*
  store %AstStmtReturn %5, %AstStmtReturn* %9, align 16
  %10 = load %union.3, %union.3* %6
  %11 = call %union.3* (%union.3) @ast_stmt_boxing (%union.3 %10)
  %12 = bitcast %union.3* %11 to %union.8
  ret %union.8 %12
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt2:
  %14 = call %Token* () @func190 ()
  %15 = getelementptr inbounds %Token, %Token* %14, i1 0, i32 1
;stmt3:
  %16 = call %AstValue* () @func222 ()
;stmt4:; loadImmPtr
  %17 = inttoptr i64 0 to%AstValue*
  %18 = icmp eq %AstValue* %16, %17
  br i1 %18, label %then_1, label %else_1
then_1:
;stmt5:
  %19 = bitcast [27 x %Nat8]* @func256_str1 to %Str
  call void (%Str, %TokenInfo*) @error (%Str %19, %TokenInfo* %15)
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt6:
  %20 = bitcast %AstValue* %16 to %union.2
  %21 = insertvalue %AstStmtReturn zeroinitializer, %union.2 %20, 0
  %22 = insertvalue %AstStmtReturn %21, %TokenInfo* %15, 1
  %23 = alloca %union.3
; write variant 7
  %24 = getelementptr inbounds %union.3, %union.3* %23, i1 0, i32 0
  store %Int16 7, %Int16* %24, align 2
; write data
  %25 = getelementptr inbounds %union.3, %union.3* %23, i1 0, i32 1
  %26 = bitcast [48 x %Nat8]* %25 to %AstStmtReturn*
  store %AstStmtReturn %22, %AstStmtReturn* %26, align 16
  %27 = load %union.3, %union.3* %23
  %28 = call %union.3* (%union.3) @ast_stmt_boxing (%union.3 %27)
  %29 = bitcast %union.3* %28 to %union.8
  ret %union.8 %29
}

define %union.8 @func257 (%TokenInfo*) {
;stmt0:
  %2 = call %AstId* () @parse_id ()
;stmt1:
  %3 = insertvalue %AstStmtGoto zeroinitializer, %AstId* %2, 0
  %4 = insertvalue %AstStmtGoto %3, %TokenInfo* %0, 1
  %5 = alloca %union.3
; write variant 8
  %6 = getelementptr inbounds %union.3, %union.3* %5, i1 0, i32 0
  store %Int16 8, %Int16* %6, align 2
; write data
  %7 = getelementptr inbounds %union.3, %union.3* %5, i1 0, i32 1
  %8 = bitcast [48 x %Nat8]* %7 to %AstStmtGoto*
  store %AstStmtGoto %4, %AstStmtGoto* %8, align 8
  %9 = load %union.3, %union.3* %5
  %10 = call %union.3* (%union.3) @ast_stmt_boxing (%union.3 %9)
  %11 = bitcast %union.3* %10 to %union.8
  ret %union.8 %11
}

define %Token* @tn2tok (%Node*) {
;stmt0:
  %2 = getelementptr inbounds %Node, %Node* %0, i1 0, i32 3
  %3 = load %Unit*, %Unit** %2
  %4 = bitcast %Unit* %3 to %Token*
  ret %Token* %4
}

define i1 @func259 () {
;stmt0:
  %1 = call %Node* () @gett ()
;stmt1:
  call void () @skip_nl ()
;stmt2:
  %2 = call %Token* () @func190 ()
;stmt3:
  %3 = getelementptr inbounds %Token, %Token* %2, i1 0, i32 0
  %4 = load %TokenKind, %TokenKind* %3
  %5 = icmp ne %TokenKind %4, 1
  br i1 %5, label %then_0, label %else_0
then_0:
;stmt4:
  br label %no
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt5:
  call void () @skip ()
;stmt6:
  %7 = bitcast [2 x %Nat8]* @func259_str1 to %Str
  %8 = call i1 (%Str) @func198 (%Str %7)
  br i1 %8, label %then_1, label %else_1
then_1:
;stmt7:
  br label %yes
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt8:
  %10 = bitcast [2 x %Nat8]* @func259_str2 to %Str
  %11 = call i1 (%Str) @func198 (%Str %10)
  br i1 %11, label %then_2, label %else_2
then_2:
;stmt9:
  br label %yes
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
;stmt10:
  br label %no
no:
;stmt11:
  call void (%Node*) @sett (%Node* %1)
;stmt12:
  ret i1 0
;stmt13:
  br label %yes
yes:
;stmt14:
  call void (%Node*) @sett (%Node* %1)
;stmt15:
  ret i1 1
}

define i1 @is_it_type_rec () {
;stmt0:
  call void () @skip ()
;stmt1:
  call void () @skip_nl ()
;stmt2:
  %1 = bitcast [2 x %Nat8]* @func260_str1 to %Str
  %2 = call i1 (%Str) @func198 (%Str %1)
  br i1 %2, label %then_0, label %else_0
then_0:
;stmt3:
  ret i1 1
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt4:
  %4 = call i1 () @func259 ()
  ret i1 %4
}

define i1 @func262 () {
;stmt0:
  call void () @skip ()
;stmt1:
  %1 = call i1 () @func261 ()
  ret i1 %1
}

define i1 @func261 () {
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
  %19 = call %Token* () @func190 ()
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
  %28 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func261_str1, i1 0, %Int64 0
  %29 = load %Nat8, %Nat8* %28
  %30 = icmp eq %Nat8 %22, %29
  br i1 %30, label %select_2_0_ok, label %select_2_1
select_2_0_ok:
  %31 = call i1 () @is_it_type_rec ()
  br label %select_2_end
select_2_1:
; index array
  %32 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func261_str2, i1 0, %Int64 0
  %33 = load %Nat8, %Nat8* %32
  %34 = icmp eq %Nat8 %22, %33
  br i1 %34, label %select_2_1_ok, label %select_2_2
select_2_1_ok:
  %35 = bitcast i1 1 to i1
  br label %select_2_end
select_2_2:
; index array
  %36 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func261_str3, i1 0, %Int64 0
  %37 = load %Nat8, %Nat8* %36
  %38 = icmp eq %Nat8 %22, %37
  br i1 %38, label %select_2_2_ok, label %select_2_3
select_2_2_ok:
  %39 = bitcast i1 1 to i1
  br label %select_2_end
select_2_3:
; index array
  %40 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func261_str4, i1 0, %Int64 0
  %41 = load %Nat8, %Nat8* %40
  %42 = icmp eq %Nat8 %22, %41
  br i1 %42, label %select_2_3_ok, label %select_2_4
select_2_3_ok:
  %43 = call i1 () @func262 ()
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

define i1 @func263 () {
;stmt0:
  %1 = call %Node* () @gett ()
;stmt1:
  call void () @skip_nl ()
;stmt2:
  %2 = bitcast [2 x %Nat8]* @func263_str1 to %Str
  %3 = call i1 (%Str) @func198 (%Str %2)
  br i1 %3, label %then_0, label %else_0
then_0:
;stmt3:
  br label %yes
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt4:
  %5 = call %Token* () @func190 ()
  %6 = getelementptr inbounds %Token, %Token* %5, i1 0, i32 0
  %7 = load %TokenKind, %TokenKind* %6
  %8 = icmp ne %TokenKind %7, 1
  br i1 %8, label %then_1, label %else_1
then_1:
;stmt5:
  br label %no
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt6:
  call void () @skip ()
;stmt7:
  %10 = bitcast [2 x %Nat8]* @func263_str2 to %Str
  %11 = call i1 (%Str) @func198 (%Str %10)
  br i1 %11, label %then_2, label %else_2
then_2:
;stmt8:
  br label %yes
  br label %endif_2
else_2:
;stmt9:
  br label %no
  br label %endif_2
endif_2:
;stmt10:
  br label %no
no:
;stmt11:
  call void (%Node*) @sett (%Node* %1)
;stmt12:
  ret i1 0
;stmt13:
  br label %yes
yes:
;stmt14:
  call void (%Node*) @sett (%Node* %1)
;stmt15:
  ret i1 1
}

define void @func265 (%Assembly*) {
;stmt0:
  %2 = getelementptr inbounds %Assembly, %Assembly* %0, i1 0, i32 1
  %3 = bitcast [38 x %Nat8]* @func264_func265_str1 to %Str
  store %Str %3, %Str* %2, align 8
;stmt1:
  %4 = getelementptr inbounds %Assembly, %Assembly* %0, i1 0, i32 2
  %5 = bitcast [27 x %Nat8]* @func264_func265_str2 to %Str
  store %Str %5, %Str* %4, align 8
  ret void
}

define void @func266 (%Assembly*) {
;stmt0:
  %2 = getelementptr inbounds %Assembly, %Assembly* %0, i1 0, i32 1
  %3 = bitcast [48 x %Nat8]* @func264_func266_str1 to %Str
  store %Str %3, %Str* %2, align 8
;stmt1:
  %4 = getelementptr inbounds %Assembly, %Assembly* %0, i1 0, i32 2
  %5 = bitcast [28 x %Nat8]* @func264_func266_str2 to %Str
  store %Str %5, %Str* %4, align 8
  ret void
}

define void @func267 (%Assembly*) {
;stmt0:
  %2 = getelementptr inbounds %Assembly, %Assembly* %0, i1 0, i32 1
  %3 = bitcast [1 x %Nat8]* @func264_func267_str1 to %Str
  store %Str %3, %Str* %2, align 8
;stmt1:
  %4 = getelementptr inbounds %Assembly, %Assembly* %0, i1 0, i32 2
  %5 = bitcast [1 x %Nat8]* @func264_func267_str2 to %Str
  store %Str %5, %Str* %4, align 8
  ret void
}

define void @func264 (%Assembly*, %Arch, %Str) {
;stmt0:
  %4 = getelementptr inbounds %Assembly, %Assembly* %0, i1 0, i32 0
  store %Str %2, %Str* %4, align 8
;stmt1:
  br label %select_1_0
select_1_0:
  %5 = icmp eq %Arch %1, 1
  br i1 %5, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  call void (%Assembly*) @func265 (%Assembly* %0)
  br label %select_1_end
select_1_1:
  %6 = icmp eq %Arch %1, 2
  br i1 %6, label %select_1_1_ok, label %select_1_2
select_1_1_ok:
  call void (%Assembly*) @func266 (%Assembly* %0)
  br label %select_1_end
select_1_2:
  call void (%Assembly*) @func267 (%Assembly* %0)
  br label %select_1_end
select_1_end:
  ret void
}

define %Definition* @func268 (%DefinitionKind, %Str) {
;stmt0:
  %3 = call %Unit* (%Nat32) @malloc (%Nat32 184)
  %4 = bitcast %Unit* %3 to %Definition*
;stmt1:; loadImmPtr
  %5 = inttoptr i64 0 to%Definition*
  %6 = icmp ne %Definition* %4, %5
  %7 = bitcast [36 x %Nat8]* @func268_str1 to %Str
  call void (i1, %Str) @assert (i1 %6, %Str %7)
;stmt2:
  %8 = bitcast %Definition* %4 to %Unit*
  %9 = call %Unit* (%Unit*, %Nat8, %Nat32) @memset (%Unit* %8, %Nat8 0, %Nat32 184)
;stmt3:
  %10 = getelementptr inbounds %Definition, %Definition* %4, i1 0, i32 0
  store %DefinitionKind %0, %DefinitionKind* %10, align 2
;stmt4:
  ret %Definition* %4
}

define %Definition* @func269 (%Assembly*, %Str, %Type*) {
;stmt0:
  %4 = call %Definition* (%DefinitionKind, %Str) @func268 (%DefinitionKind 0, %Str %1)
;stmt1:
  %5 = getelementptr inbounds %Definition, %Definition* %4, i1 0, i32 2
  %6 = insertvalue %DefType zeroinitializer, %Str %1, 0
  %7 = insertvalue %DefType %6, %Type* %2, 1
  store %DefType %7, %DefType* %5, align 8
;stmt2:
  %8 = getelementptr inbounds %Assembly, %Assembly* %0, i1 0, i32 3
  %9 = bitcast %Definition* %4 to %Unit*
  %10 = call i1 (%List*, %Unit*) @list_append (%List* %8, %Unit* %9)
;stmt3:
  ret %Definition* %4
}

define %Definition* @func270 (%Assembly*, %Str, %Str, %Nat32) {
;stmt0:
  %5 = call %Definition* (%DefinitionKind, %Str) @func268 (%DefinitionKind 2, %Str %1)
;stmt1:
  %6 = getelementptr inbounds %Definition, %Definition* %5, i1 0, i32 1
  %7 = insertvalue %DefStr zeroinitializer, %Str %1, 0
  %8 = insertvalue %DefStr %7, %Str %2, 2
  %9 = insertvalue %DefStr %8, %Nat32 %3, 3
  store %DefStr %9, %DefStr* %6, align 8
;stmt2:
  %10 = getelementptr inbounds %Assembly, %Assembly* %0, i1 0, i32 6
  %11 = bitcast %Definition* %5 to %Unit*
  %12 = call i1 (%List*, %Unit*) @list_append (%List* %10, %Unit* %11)
;stmt3:
  ret %Definition* %5
}

define %Definition* @func271 (%Assembly*, %Str, %Type*, %List*) {
;stmt0:
  %5 = call %Definition* (%DefinitionKind, %Str) @func268 (%DefinitionKind 3, %Str %1)
;stmt1:
  %6 = getelementptr inbounds %Definition, %Definition* %5, i1 0, i32 4
  %7 = insertvalue %DefArray zeroinitializer, %Str %1, 0
  %8 = insertvalue %DefArray %7, %Type* %2, 1
  %9 = insertvalue %DefArray %8, %List* %3, 3
  store %DefArray %9, %DefArray* %6, align 8
;stmt2:
  %10 = getelementptr inbounds %Assembly, %Assembly* %0, i1 0, i32 5
  %11 = bitcast %Definition* %5 to %Unit*
  %12 = call i1 (%List*, %Unit*) @list_append (%List* %10, %Unit* %11)
;stmt3:
  ret %Definition* %5
}

define %Definition* @func272 (%Assembly*, %Str, %Type*, %StmtBlock*) {
;stmt0:
  %5 = call %Definition* (%DefinitionKind, %Str) @func268 (%DefinitionKind 4, %Str %1)
;stmt1:
  %6 = getelementptr inbounds %Definition, %Definition* %5, i1 0, i32 5
  %7 = insertvalue %DefFunc zeroinitializer, %Str %1, 0
  %8 = insertvalue %DefFunc %7, %Type* %2, 1
  %9 = insertvalue %DefFunc %8, %StmtBlock* %3, 2
  store %DefFunc %9, %DefFunc* %6, align 8
;stmt2:
  %10 = getelementptr inbounds %Assembly, %Assembly* %0, i1 0, i32 8
  %11 = bitcast %Definition* %5 to %Unit*
  %12 = call i1 (%List*, %Unit*) @list_append (%List* %10, %Unit* %11)
;stmt3:
  ret %Definition* %5
}

define %Definition* @func273 (%Assembly*, %Str, %Type*, %Value*) {
;stmt0:
  %5 = call %Definition* (%DefinitionKind, %Str) @func268 (%DefinitionKind 5, %Str %1)
;stmt1:
  %6 = getelementptr inbounds %Definition, %Definition* %5, i1 0, i32 6
  %7 = insertvalue %DefVar zeroinitializer, %Str %1, 0
  %8 = insertvalue %DefVar %7, %Type* %2, 1
  %9 = insertvalue %DefVar %8, %Value* %3, 2
  store %DefVar %9, %DefVar* %6, align 8
;stmt2:
  %10 = getelementptr inbounds %Assembly, %Assembly* %0, i1 0, i32 7
  %11 = bitcast %Definition* %5 to %Unit*
  %12 = call i1 (%List*, %Unit*) @list_append (%List* %10, %Unit* %11)
;stmt3:
  ret %Definition* %5
}

define %Definition* @func274 (%Assembly*, %Str, %Type*, %Str) {
;stmt0:
  %5 = call %Definition* (%DefinitionKind, %Str) @func268 (%DefinitionKind 6, %Str %1)
;stmt1:
  %6 = getelementptr inbounds %Definition, %Definition* %5, i1 0, i32 7
  %7 = insertvalue %DefAlias zeroinitializer, %Str %1, 0
  %8 = insertvalue %DefAlias %7, %Type* %2, 1
  %9 = insertvalue %DefAlias %8, %Str %3, 2
  store %DefAlias %9, %DefAlias* %6, align 8
;stmt2:
  %10 = getelementptr inbounds %Assembly, %Assembly* %0, i1 0, i32 4
  %11 = bitcast %Definition* %5 to %Unit*
  %12 = call i1 (%List*, %Unit*) @list_append (%List* %10, %Unit* %11)
;stmt3:
  ret %Definition* %5
}

define void @o (%Str) {
;stmt0:
  %2 = load %FILE*, %FILE** @fout
  %3 = bitcast [3 x %Nat8]* @func275_str1 to %Str
  %4 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %2, %Str %3, %Str %0)
  ret void
}

define void @ol (%Str) {
;stmt0:
  %2 = load %FILE*, %FILE** @fout
  %3 = bitcast [4 x %Nat8]* @func276_str1 to %Str
  %4 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %2, %Str %3, %Str %0)
  ret void
}

define void @nl () {
;stmt0:
  %1 = bitcast [2 x %Nat8]* @func277_str1 to %Str
  call void (%Str) @o (%Str %1)
  ret void
}

define void @space () {
;stmt0:
  %1 = bitcast [2 x %Nat8]* @func278_str1 to %Str
  call void (%Str) @o (%Str %1)
  ret void
}

define void @comma () {
;stmt0:
  %1 = bitcast [3 x %Nat8]* @func279_str1 to %Str
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

define void @func283 (%Unit*, %Unit*, %Unit*) {
;stmt0:
  %4 = bitcast %Unit* %0 to %Str
;stmt1:
  %5 = bitcast %Unit* %1 to %Type*
;stmt2:
  %6 = call i1 (%Type*) @func395 (%Type* %5)
  br i1 %6, label %then_0, label %else_0
then_0:
;stmt3:
  %7 = load %FILE*, %FILE** @fout
  %8 = bitcast [17 x %Nat8]* @func282_func283_str1 to %Str
  %9 = getelementptr inbounds %Type, %Type* %5, i1 0, i32 5
  %10 = getelementptr inbounds %TypeNumeric, %TypeNumeric* %9, i1 0, i32 0
  %11 = load %Nat32, %Nat32* %10
  %12 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %7, %Str %8, %Str %4, %Nat32 %11)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  ret void
}

define void @func284 (%Unit*, %Unit*, %Nat32, %Node*) {
;stmt0:
  %5 = bitcast %Unit* %0 to %Type*
;stmt1:
  %6 = getelementptr inbounds %Type, %Type* %5, i1 0, i32 13
  %7 = getelementptr inbounds %TypeUnion, %TypeUnion* %6, i1 0, i32 1
  %8 = load %Type*, %Type** %7; loadImmPtr
  %9 = inttoptr i64 0 to%Type*
  %10 = icmp ne %Type* %8, %9
  br i1 %10, label %then_0, label %else_0
then_0:
;stmt2:
  %11 = load %FILE*, %FILE** @fout
  %12 = bitcast [14 x %Nat8]* @func282_func284_str1 to %Str
  %13 = getelementptr inbounds %Type, %Type* %5, i1 0, i32 2
  %14 = load %Str, %Str* %13
  %15 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %11, %Str %12, %Str %14)
;stmt3:
  %16 = getelementptr inbounds %Type, %Type* %5, i1 0, i32 13
  %17 = getelementptr inbounds %TypeUnion, %TypeUnion* %16, i1 0, i32 1
  %18 = load %Type*, %Type** %17
  call void (%Type*) @func372 (%Type* %18)
;stmt4:
  %19 = bitcast [2 x %Nat8]* @func282_func284_str2 to %Str
  call void (%Str) @o (%Str %19)
  br label %endif_0
else_0:
;stmt5:
  %20 = load %FILE*, %FILE** @fout
  %21 = bitcast [30 x %Nat8]* @func282_func284_str3 to %Str
  %22 = getelementptr inbounds %Type, %Type* %5, i1 0, i32 2
  %23 = load %Str, %Str* %22
  %24 = getelementptr inbounds %Type, %Type* %5, i1 0, i32 13
  %25 = getelementptr inbounds %TypeUnion, %TypeUnion* %24, i1 0, i32 2
  %26 = load %Nat32, %Nat32* %25
  %27 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %20, %Str %21, %Str %23, %Nat32 %26)
;stmt6:
  %28 = bitcast [2 x %Nat8]* @func282_func284_str4 to %Str
  call void (%Str) @o (%Str %28)
  br label %endif_0
endif_0:
  ret void
}

define void @func285 (%Unit*, %Unit*, %Nat32, %Node*) {
;stmt0:
  %5 = bitcast %Unit* %0 to %Definition*
  %6 = getelementptr inbounds %Definition, %Definition* %5, i1 0, i32 2
;stmt1:
  %7 = getelementptr inbounds %DefType, %DefType* %6, i1 0, i32 0
  %8 = load %Str, %Str* %7
  %9 = getelementptr inbounds %DefType, %DefType* %6, i1 0, i32 1
  %10 = load %Type*, %Type** %9
  call void (%Str, %Type*) @func291 (%Str %8, %Type* %10)
  ret void
}

define void @func286 (%Unit*, %Unit*, %Nat32, %Node*) {
;stmt0:
  %5 = bitcast %Unit* %0 to %Definition*
  %6 = getelementptr inbounds %Definition, %Definition* %5, i1 0, i32 1
;stmt1:
  %7 = getelementptr inbounds %DefStr, %DefStr* %6, i1 0, i32 0
  %8 = load %Str, %Str* %7
  %9 = getelementptr inbounds %DefStr, %DefStr* %6, i1 0, i32 3
  %10 = load %Nat32, %Nat32* %9
  %11 = getelementptr inbounds %DefStr, %DefStr* %6, i1 0, i32 2
  %12 = load %Str, %Str* %11
  call void (%Str, %Nat32, %Str) @func294 (%Str %8, %Nat32 %10, %Str %12)
  ret void
}

define void @func287 (%Unit*, %Unit*, %Nat32, %Node*) {
;stmt0:
  %5 = bitcast %Unit* %0 to %Definition*
  %6 = getelementptr inbounds %Definition, %Definition* %5, i1 0, i32 4
;stmt1:
  %7 = getelementptr inbounds %DefArray, %DefArray* %6, i1 0, i32 0
  %8 = load %Str, %Str* %7
  %9 = getelementptr inbounds %DefArray, %DefArray* %6, i1 0, i32 1
  %10 = load %Type*, %Type** %9
  %11 = getelementptr inbounds %DefArray, %DefArray* %6, i1 0, i32 3
  %12 = load %List*, %List** %11
  call void (%Str, %Type*, %List*) @func292 (%Str %8, %Type* %10, %List* %12)
  ret void
}

define void @func288 (%Unit*, %Unit*, %Nat32, %Node*) {
;stmt0:
  %5 = bitcast %Unit* %0 to %Definition*
  %6 = getelementptr inbounds %Definition, %Definition* %5, i1 0, i32 6
;stmt1:
  %7 = getelementptr inbounds %DefVar, %DefVar* %6, i1 0, i32 0
  %8 = load %Str, %Str* %7
  %9 = getelementptr inbounds %DefVar, %DefVar* %6, i1 0, i32 1
  %10 = load %Type*, %Type** %9
  %11 = getelementptr inbounds %DefVar, %DefVar* %6, i1 0, i32 2
  %12 = load %Value*, %Value** %11
  call void (%Str, %Type*, %Value*) @func295 (%Str %8, %Type* %10, %Value* %12)
  ret void
}

define void @func289 (%Unit*, %Unit*, %Nat32, %Node*) {
;stmt0:
  %5 = bitcast %Unit* %0 to %Definition*
  %6 = getelementptr inbounds %Definition, %Definition* %5, i1 0, i32 5
;stmt1:
  %7 = getelementptr inbounds %DefFunc, %DefFunc* %6, i1 0, i32 0
  %8 = load %Str, %Str* %7
  %9 = getelementptr inbounds %DefFunc, %DefFunc* %6, i1 0, i32 1
  %10 = load %Type*, %Type** %9
  %11 = getelementptr inbounds %DefFunc, %DefFunc* %6, i1 0, i32 2
  %12 = load %StmtBlock*, %StmtBlock** %11
  call void (%Str, %Type*, %StmtBlock*) @func296 (%Str %8, %Type* %10, %StmtBlock* %12)
  ret void
}

define void @func290 (%Unit*, %Unit*, %Nat32, %Node*) {
;stmt0:
  %5 = bitcast %Unit* %0 to %Definition*
  %6 = getelementptr inbounds %Definition, %Definition* %5, i1 0, i32 7
;stmt1:
  %7 = getelementptr inbounds %DefAlias, %DefAlias* %6, i1 0, i32 0
  %8 = load %Str, %Str* %7
  %9 = getelementptr inbounds %DefAlias, %DefAlias* %6, i1 0, i32 1
  %10 = load %Type*, %Type** %9
  %11 = getelementptr inbounds %DefAlias, %DefAlias* %6, i1 0, i32 2
  %12 = load %Str, %Str* %11
  call void (%Str, %Type*, %Str) @func298 (%Str %8, %Type* %10, %Str %12)
  ret void
}

define void @func282 (%Assembly*, %Str) {
;stmt0:
  %3 = bitcast [20 x %Nat8]* @func282_str1 to %Str
  %4 = getelementptr inbounds %Assembly, %Assembly* %0, i1 0, i32 0
  %5 = load %Str, %Str* %4
  %6 = call %Int32 (%Str, ...) @printf (%Str %3, %Str %5)
;stmt1:
  %7 = bitcast [2 x %Nat8]* @func282_str2 to %Str
  %8 = call %FILE* (%Str, %Str) @fopen (%Str %1, %Str %7)
  store %FILE* %8, %FILE** @fout, align 8
;stmt2:
  %9 = load %FILE*, %FILE** @fout; loadImmPtr
  %10 = inttoptr i64 0 to%FILE*
  %11 = icmp eq %FILE* %9, %10
  br i1 %11, label %then_0, label %else_0
then_0:
;stmt3:
  %12 = bitcast [26 x %Nat8]* @func282_str3 to %Str
  call void (%Str) @fatal (%Str %12)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt4:
  %13 = load %FILE*, %FILE** @fout
  %14 = bitcast [16 x %Nat8]* @func282_str4 to %Str
  %15 = getelementptr inbounds %Assembly, %Assembly* %0, i1 0, i32 0
  %16 = load %Str, %Str* %15
  %17 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %13, %Str %14, %Str %16)
;stmt5:
  %18 = bitcast [27 x %Nat8]* @func282_str5 to %Str
  call void (%Str) @ol (%Str %18)
;stmt6:
  %19 = bitcast [44 x %Nat8]* @func282_str6 to %Str
  call void (%Str) @ol (%Str %19)
;stmt7:
  call void () @nl ()
;stmt8:
  %20 = load %FILE*, %FILE** @fout
  %21 = bitcast [26 x %Nat8]* @func282_str7 to %Str
  %22 = getelementptr inbounds %Assembly, %Assembly* %0, i1 0, i32 1
  %23 = load %Str, %Str* %22
  %24 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %20, %Str %21, %Str %23)
;stmt9:
  %25 = load %FILE*, %FILE** @fout
  %26 = bitcast [22 x %Nat8]* @func282_str8 to %Str
  %27 = getelementptr inbounds %Assembly, %Assembly* %0, i1 0, i32 2
  %28 = load %Str, %Str* %27
  %29 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %25, %Str %26, %Str %28)
;stmt10:
  call void () @nl ()
;stmt11:
  %30 = bitcast [16 x %Nat8]* @func282_str9 to %Str
  call void (%Str) @ol (%Str %30)
;stmt12:
  %31 = bitcast [16 x %Nat8]* @func282_str10 to %Str
  call void (%Str) @ol (%Str %31)
;stmt13:
  %32 = bitcast [16 x %Nat8]* @func282_str11 to %Str
  call void (%Str) @ol (%Str %32)
;stmt14:
  %33 = bitcast [20 x %Nat8]* @func282_str12 to %Str
  call void (%Str) @ol (%Str %33)
;stmt15:
  %34 = getelementptr inbounds %Index, %Index* @builtinIndex, i1 0, i32 0; loadImmPtr
  %35 = inttoptr i64 0 to%Unit*
  call void (%List*, %MapForeachHandler, %Unit*) @map_foreach (%List* %34, %MapForeachHandler @func283, %Unit* %35)
;stmt16:
  %36 = bitcast [12 x %Nat8]* @func282_str13 to %Str
  call void (%Str) @ol (%Str %36)
;stmt17:
  %37 = getelementptr inbounds %List, %List* @unions, i1 0; loadImmPtr
  %38 = inttoptr i64 0 to%Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @func64 (%List* %37, %ListForeachHandler @func284, %Unit* %38)
;stmt18:
  call void () @nl ()
;stmt19:
  %39 = bitcast [11 x %Nat8]* @func282_str14 to %Str
  call void (%Str) @o (%Str %39)
;stmt20:
  %40 = getelementptr inbounds %Assembly, %Assembly* %0, i1 0, i32 3; loadImmPtr
  %41 = inttoptr i64 0 to%Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @func64 (%List* %40, %ListForeachHandler @func285, %Unit* %41)
;stmt21:
  %42 = bitcast [13 x %Nat8]* @func282_str15 to %Str
  call void (%Str) @o (%Str %42)
;stmt22:
  %43 = getelementptr inbounds %Assembly, %Assembly* %0, i1 0, i32 6; loadImmPtr
  %44 = inttoptr i64 0 to%Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @func64 (%List* %43, %ListForeachHandler @func286, %Unit* %44)
;stmt23:
  %45 = bitcast [12 x %Nat8]* @func282_str16 to %Str
  call void (%Str) @o (%Str %45)
;stmt24:
  %46 = getelementptr inbounds %Assembly, %Assembly* %0, i1 0, i32 5; loadImmPtr
  %47 = inttoptr i64 0 to%Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @func64 (%List* %46, %ListForeachHandler @func287, %Unit* %47)
;stmt25:
  %48 = bitcast [10 x %Nat8]* @func282_str17 to %Str
  call void (%Str) @o (%Str %48)
;stmt26:
  %49 = getelementptr inbounds %Assembly, %Assembly* %0, i1 0, i32 7; loadImmPtr
  %50 = inttoptr i64 0 to%Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @func64 (%List* %49, %ListForeachHandler @func288, %Unit* %50)
;stmt27:
  %51 = bitcast [11 x %Nat8]* @func282_str18 to %Str
  call void (%Str) @o (%Str %51)
;stmt28:
  %52 = getelementptr inbounds %Assembly, %Assembly* %0, i1 0, i32 8; loadImmPtr
  %53 = inttoptr i64 0 to%Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @func64 (%List* %52, %ListForeachHandler @func289, %Unit* %53)
;stmt29:
  %54 = bitcast [13 x %Nat8]* @func282_str19 to %Str
  call void (%Str) @o (%Str %54)
;stmt30:
  %55 = getelementptr inbounds %Assembly, %Assembly* %0, i1 0, i32 4; loadImmPtr
  %56 = inttoptr i64 0 to%Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @func64 (%List* %55, %ListForeachHandler @func290, %Unit* %56)
;stmt31:
  %57 = bitcast [14 x %Nat8]* @func282_str20 to %Str
  call void (%Str) @o (%Str %57)
  ret void
}

define void @func291 (%Str, %Type*) {
;stmt0:
  %3 = load %FILE*, %FILE** @fout
  %4 = bitcast [14 x %Nat8]* @func291_str1 to %Str
  %5 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %3, %Str %4, %Str %0)
;stmt1:
  call void (%Type*, i1, i1) @func369 (%Type* %1, i1 0, i1 1)
  ret void
}

define void @func293 (%Unit*, %Unit*, %Nat32, %Node*) {
;stmt0:
  %5 = icmp ugt %Nat32 %2, 0
  br i1 %5, label %then_0, label %else_0
then_0:
;stmt1:
  call void () @comma ()
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt2:
  %6 = bitcast %Unit* %0 to %Value*
;stmt3:
  %7 = call %LLVM_Value (%Value*) @func305 (%Value* %6)
;stmt4:
  call void (%LLVM_Value) @func354 (%LLVM_Value %7)
  ret void
}

define void @func292 (%Str, %Type*, %List*) {
;stmt0:
  %4 = load %FILE*, %FILE** @fout
  %5 = bitcast [38 x %Nat8]* @func292_str1 to %Str
  %6 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %4, %Str %5, %Str %0)
;stmt1:
  call void (%Type*) @func372 (%Type* %1)
;stmt2:
  %7 = bitcast [3 x %Nat8]* @func292_str2 to %Str
  call void (%Str) @o (%Str %7)
;stmt3:; loadImmPtr
  %8 = inttoptr i64 0 to%Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @func64 (%List* %2, %ListForeachHandler @func293, %Unit* %8)
;stmt4:
  %9 = bitcast [12 x %Nat8]* @func292_str3 to %Str
  call void (%Str) @o (%Str %9)
  ret void
}

define void @func294 (%Str, %Nat32, %Str) {
;stmt0:
  %4 = load %FILE*, %FILE** @fout
  %5 = bitcast [50 x %Nat8]* @func294_str1 to %Str
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
  %15 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func294_str2, i1 0, %Int64 0
  %16 = load %Nat8, %Nat8* %15
  %17 = icmp eq %Nat8 %10, %16
; index array
  %18 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func294_str3, i1 0, %Int64 0
  %19 = load %Nat8, %Nat8* %18
  %20 = icmp eq %Nat8 %10, %19
; index array
  %21 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func294_str4, i1 0, %Int64 0
  %22 = load %Nat8, %Nat8* %21
  %23 = icmp eq %Nat8 %10, %22
; index array
  %24 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func294_str5, i1 0, %Int64 0
  %25 = load %Nat8, %Nat8* %24
  %26 = icmp eq %Nat8 %10, %25
; index array
  %27 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func294_str6, i1 0, %Int64 0
  %28 = load %Nat8, %Nat8* %27
  %29 = icmp eq %Nat8 %10, %28
; index array
  %30 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func294_str7, i1 0, %Int64 0
  %31 = load %Nat8, %Nat8* %30
  %32 = icmp eq %Nat8 %10, %31
; index array
  %33 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func294_str8, i1 0, %Int64 0
  %34 = load %Nat8, %Nat8* %33
  %35 = icmp eq %Nat8 %10, %34
; index array
  %36 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func294_str9, i1 0, %Int64 0
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
  %47 = bitcast [6 x %Nat8]* @func294_str10 to %Str
  %48 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %46, %Str %47, %Nat8 %10)
  br label %endif_1
else_1:
;stmt9:
  %49 = load %FILE*, %FILE** @fout
  %50 = bitcast [3 x %Nat8]* @func294_str11 to %Str
  %51 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %49, %Str %50, %Nat8 %10)
  br label %endif_1
endif_1:
  br label %continue_0
break_0:
;stmt10:
  %52 = bitcast [14 x %Nat8]* @func294_str12 to %Str
  call void (%Str) @o (%Str %52)
  ret void
}

define void @func295 (%Str, %Type*, %Value*) {
;stmt0:
  %4 = load %FILE*, %FILE** @fout
  %5 = bitcast [15 x %Nat8]* @func295_str1 to %Str
  %6 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %4, %Str %5, %Str %0)
;stmt1:
  call void (%Type*) @func372 (%Type* %1)
;stmt2:
  call void () @space ()
;stmt3:; loadImmPtr
  %7 = inttoptr i64 0 to%Value*
  %8 = icmp eq %Value* %2, %7
  br i1 %8, label %then_0, label %else_0
then_0:
;stmt4:
  %9 = bitcast [16 x %Nat8]* @func295_str2 to %Str
  call void (%Str) @o (%Str %9)
;stmt5:
ret void
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt6:
  %11 = call %LLVM_Value (%Value*) @func302 (%Value* %2)
;stmt7:
  %12 = extractvalue %LLVM_Value %11, 0
  %13 = icmp ne %LLVM_ValueKind %12, 4
  br i1 %13, label %then_1, label %else_1
then_1:
;stmt8:
  %14 = bitcast [29 x %Nat8]* @func295_str3 to %Str
  %15 = getelementptr inbounds %Value, %Value* %2, i1 0, i32 19
  %16 = load %TokenInfo*, %TokenInfo** %15
  call void (%Str, %TokenInfo*) @error (%Str %14, %TokenInfo* %16)
;stmt9:
  %17 = bitcast [16 x %Nat8]* @func295_str4 to %Str
  call void (%Str) @o (%Str %17)
;stmt10:
ret void
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt11:
  call void (%LLVM_Value) @func353 (%LLVM_Value %11)
  ret void
}

define void @func297 (%Unit*, %Unit*, %Nat32, %Node*) {
;stmt0:
  %5 = bitcast %Unit* %0 to %Decl*
;stmt1:
  %6 = icmp ugt %Nat32 %2, 0
  br i1 %6, label %then_0, label %else_0
then_0:
;stmt2:
  call void () @comma ()
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt3:
  %7 = getelementptr inbounds %Decl, %Decl* %5, i1 0, i32 1
  %8 = load %Type*, %Type** %7
  call void (%Type*) @func372 (%Type* %8)
  ret void
}

define void @func296 (%Str, %Type*, %StmtBlock*) {
;stmt0:
  %4 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 6
  %5 = getelementptr inbounds %TypeFunc, %TypeFunc* %4, i1 0, i32 0
  %6 = load %Type*, %Type** %5
  %7 = getelementptr inbounds %Type, %Type* %6, i1 0, i32 10
  %8 = getelementptr inbounds %TypeRecord, %TypeRecord* %7, i1 0, i32 0
  %9 = load %List*, %List** %8
;stmt1:
  %10 = getelementptr inbounds %List, %List* %9, i1 0, i32 2
  %11 = load %Nat64, %Nat64* %10
  %12 = add %Nat64 %11, 1
;stmt2:
  %13 = bitcast [3 x %Nat8]* @func296_str1 to %Str
  %14 = call %Int32 (%Str, %Str) @strcmp (%Str %0, %Str %13)
  %15 = icmp eq %Int32 %14, 0
  br i1 %15, label %then_0, label %else_0
then_0:
;stmt3:
  %16 = bitcast [6 x %Nat8]* @func296_str2 to %Str
  %17 = call %Int32 (%Str, ...) @printf (%Str %16)
;stmt4:
  call void (%Type*) @func81 (%Type* %1)
;stmt5:
  %18 = bitcast [2 x %Nat8]* @func296_str3 to %Str
  %19 = call %Int32 (%Str, ...) @printf (%Str %18)
;stmt6:
  %20 = bitcast [11 x %Nat8]* @func296_str4 to %Str
  %21 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 6
  %22 = getelementptr inbounds %TypeFunc, %TypeFunc* %21, i1 0, i32 1
  %23 = load %Type*, %Type** %22
  %24 = call i1 (%Type*) @func399 (%Type* %23)
  %25 = call %Int32 (%Str, ...) @printf (%Str %20, i1 %24)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt7:
  store %Nat32 0, %Nat32* @select_no, align 4
;stmt8:
  %26 = trunc %Nat64 %12 to %Nat32
  call void (%Nat32) @lab_reset (%Nat32 %26)
;stmt9:; loadImmPtr
  %27 = inttoptr i64 0 to%Type*
  %28 = icmp ne %Type* %1, %27
  %29 = bitcast [20 x %Nat8]* @func296_str5 to %Str
  call void (i1, %Str) @assert (i1 %28, %Str %29)
;stmt10:; loadImmPtr
  %30 = inttoptr i64 0 to%StmtBlock*
  %31 = icmp eq %StmtBlock* %2, %30
  br i1 %31, label %then_1, label %else_1
then_1:
;stmt11:
  %32 = bitcast [9 x %Nat8]* @func296_str6 to %Str
  call void (%Str) @o (%Str %32)
  br label %endif_1
else_1:
;stmt12:
  %33 = bitcast [9 x %Nat8]* @func296_str7 to %Str
  call void (%Str) @o (%Str %33)
  br label %endif_1
endif_1:
;stmt13:
  call void () @space ()
;stmt14:
  %34 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 6
  %35 = getelementptr inbounds %TypeFunc, %TypeFunc* %34, i1 0, i32 1
  %36 = load %Type*, %Type** %35
  %37 = load %Type*, %Type** @typeUnit
  %38 = call i1 (%Type*, %Type*) @func426 (%Type* %36, %Type* %37)
;stmt15:
  br i1 %38, label %then_2, label %else_2
then_2:
;stmt16:
  %39 = bitcast [5 x %Nat8]* @func296_str8 to %Str
  call void (%Str) @o (%Str %39)
  br label %endif_2
else_2:
;stmt17:
  %40 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 6
  %41 = getelementptr inbounds %TypeFunc, %TypeFunc* %40, i1 0, i32 1
  %42 = load %Type*, %Type** %41
  call void (%Type*) @func372 (%Type* %42)
  br label %endif_2
endif_2:
;stmt18:
  %43 = load %FILE*, %FILE** @fout
  %44 = bitcast [7 x %Nat8]* @func296_str9 to %Str
  %45 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %43, %Str %44, %Str %0)
;stmt19:; loadImmPtr
  %46 = inttoptr i64 0 to%Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @func64 (%List* %9, %ListForeachHandler @func297, %Unit* %46)
;stmt20:
  %47 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 6
  %48 = getelementptr inbounds %TypeFunc, %TypeFunc* %47, i1 0, i32 2
  %49 = load i1, i1* %48
  br i1 %49, label %then_3, label %else_3
then_3:
;stmt21:
  %50 = bitcast [6 x %Nat8]* @func296_str10 to %Str
  call void (%Str) @o (%Str %50)
  br label %endif_3
else_3:
  br label %endif_3
endif_3:
;stmt22:
  %51 = bitcast [2 x %Nat8]* @func296_str11 to %Str
  call void (%Str) @o (%Str %51)
;stmt23:; loadImmPtr
  %52 = inttoptr i64 0 to%StmtBlock*
  %53 = icmp ne %StmtBlock* %2, %52
  br i1 %53, label %then_4, label %else_4
then_4:
  br label %endif_4
else_4:
  br label %endif_4
endif_4:
;stmt24:; loadImmPtr
  %54 = inttoptr i64 0 to%StmtBlock*
  %55 = icmp ne %StmtBlock* %2, %54
  br i1 %55, label %then_5, label %else_5
then_5:
;stmt25:
  %56 = bitcast [3 x %Nat8]* @func296_str12 to %Str
  call void (%Str) @o (%Str %56)
;stmt26:
  store %Nat32 0, %Nat32* @global_if_id, align 4
;stmt27:
  store %Nat32 0, %Nat32* @global_while_id, align 4
;stmt28:
  store %Nat32 0, %Nat32* @while_id, align 4
;stmt29:
  store %Nat32 0, %Nat32* @stmtno, align 4
;stmt30:
  store %Nat32 0, %Nat32* @blockno, align 4
;stmt31:
  call void (%StmtBlock*) @func367 (%StmtBlock* %2)
;stmt32:
  br i1 %38, label %then_6, label %else_6
then_6:
;stmt33:
  %57 = bitcast [12 x %Nat8]* @func296_str13 to %Str
  call void (%Str) @o (%Str %57)
  br label %endif_6
else_6:
  br label %endif_6
endif_6:
;stmt34:
  %58 = bitcast [3 x %Nat8]* @func296_str14 to %Str
  call void (%Str) @o (%Str %58)
  br label %endif_5
else_5:
  br label %endif_5
endif_5:
  ret void
}

define void @func298 (%Str, %Type*, %Str) {
;stmt0:
  %4 = load %FILE*, %FILE** @fout
  %5 = bitcast [14 x %Nat8]* @func298_str1 to %Str
  %6 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %4, %Str %5, %Str %0)
;stmt1:
  call void (%Type*, i1, i1) @func369 (%Type* %1, i1 0, i1 0)
;stmt2:
  call void () @comma ()
;stmt3:
  call void (%Type*, i1, i1) @func369 (%Type* %1, i1 0, i1 0)
;stmt4:
  %7 = load %FILE*, %FILE** @fout
  %8 = bitcast [6 x %Nat8]* @func298_str2 to %Str
  %9 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %7, %Str %8, %Str %2)
  ret void
}

define %Nat32 @func299 (%Str, %Type*) {
;stmt0:
  %3 = call %Nat32 () @lab_get ()
;stmt1:
  %4 = load %FILE*, %FILE** @fout
  %5 = bitcast [14 x %Nat8]* @func299_str1 to %Str
  %6 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %4, %Str %5, %Nat32 %3, %Str %0)
;stmt2:
  call void (%Type*) @func372 (%Type* %1)
;stmt3:
  ret %Nat32 %3
}

define %Nat32 @func300 (%Type*, %LLVM_Value) {
;stmt0:
  %3 = bitcast [23 x %Nat8]* @func300_str1 to %Str
  %4 = call %Nat32 (%Str, %Type*) @func299 (%Str %3, %Type* %0)
;stmt1:
  call void () @comma ()
;stmt2:
  call void (%Type*) @func372 (%Type* %0)
;stmt3:
  %5 = bitcast [3 x %Nat8]* @func300_str2 to %Str
  call void (%Str) @o (%Str %5)
;stmt4:
  call void (%LLVM_Value) @func353 (%LLVM_Value %1)
;stmt5:
  call void () @comma ()
;stmt6:
  ret %Nat32 %4
}

define %Nat32 @func301 (%Type*, %LLVM_Value, %Nat32) {
;stmt0:
  %4 = bitcast [13 x %Nat8]* @func301_str1 to %Str
  %5 = call %Nat32 (%Str, %Type*) @func299 (%Str %4, %Type* %0)
;stmt1:
  call void () @space ()
;stmt2:
  call void (%LLVM_Value) @func353 (%LLVM_Value %1)
;stmt3:
  %6 = load %FILE*, %FILE** @fout
  %7 = bitcast [5 x %Nat8]* @func301_str2 to %Str
  %8 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %6, %Str %7, %Nat32 %2)
;stmt4:
  ret %Nat32 %5
}

define %LLVM_Value @func303 (%Value*) {
;stmt0:
  %2 = bitcast [28 x %Nat8]* @func302_func303_str1 to %Str
  call void (%Str) @fatal (%Str %2)
;stmt1:
  %3 = insertvalue %LLVM_Value zeroinitializer, %LLVM_ValueKind 0, 0
  ret %LLVM_Value %3
}

define %LLVM_Value @func302 (%Value*) {
;stmt0:
  %2 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 0
  %3 = load %ValueKind, %ValueKind* %2
  br label %select_1_0
select_1_0:
  %4 = icmp eq %ValueKind %3, 3
  br i1 %4, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %5 = call %LLVM_Value (%Value*) @func304 (%Value* %0)
  br label %select_1_end
select_1_1:
  %6 = icmp eq %ValueKind %3, 4
  br i1 %6, label %select_1_1_ok, label %select_1_2
select_1_1_ok:
  %7 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 3
  %8 = getelementptr inbounds %ValueMention, %ValueMention* %7, i1 0, i32 1
  %9 = load %Value*, %Value** %8
  %10 = call %LLVM_Value (%Value*) @func302 (%Value* %9)
  br label %select_1_end
select_1_2:
  %11 = icmp eq %ValueKind %3, 5
  br i1 %11, label %select_1_2_ok, label %select_1_3
select_1_2_ok:
  %12 = insertvalue %LLVM_Value zeroinitializer, %LLVM_ValueKind 5, 0
  %13 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 1
  %14 = load %Type*, %Type** %13
  %15 = insertvalue %LLVM_Value %12, %Type* %14, 1
  %16 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 6
  %17 = load %Definition*, %Definition** %16
  %18 = call %Str (%Definition*) @func533 (%Definition* %17)
  %19 = insertvalue %LLVM_Value %15, %Str %18, 3
  br label %select_1_end
select_1_3:
  %20 = icmp eq %ValueKind %3, 6
  br i1 %20, label %select_1_3_ok, label %select_1_4
select_1_3_ok:
  %21 = insertvalue %LLVM_Value zeroinitializer, %LLVM_ValueKind 7, 0
  %22 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 1
  %23 = load %Type*, %Type** %22
  %24 = insertvalue %LLVM_Value %21, %Type* %23, 1
  %25 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 6
  %26 = load %Definition*, %Definition** %25
  %27 = getelementptr inbounds %Definition, %Definition* %26, i1 0, i32 6
  %28 = getelementptr inbounds %DefVar, %DefVar* %27, i1 0, i32 0
  %29 = load %Str, %Str* %28
  %30 = insertvalue %LLVM_Value %24, %Str %29, 3
  br label %select_1_end
select_1_4:
  %31 = icmp eq %ValueKind %3, 11
  br i1 %31, label %select_1_4_ok, label %select_1_5
select_1_4_ok:
  %32 = insertvalue %LLVM_Value zeroinitializer, %LLVM_ValueKind 9, 0
  %33 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 1
  %34 = load %Type*, %Type** %33
  %35 = insertvalue %LLVM_Value %32, %Type* %34, 1
  %36 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 9
  %37 = load %StmtExpr*, %StmtExpr** %36
  %38 = getelementptr inbounds %StmtExpr, %StmtExpr* %37, i1 0, i32 1
  %39 = load %Nat32, %Nat32* %38
  %40 = insertvalue %LLVM_Value %35, %Nat32 %39, 4
  br label %select_1_end
select_1_5:
  %41 = icmp eq %ValueKind %3, 12
  br i1 %41, label %select_1_5_ok, label %select_1_6
select_1_5_ok:
  %42 = insertvalue %LLVM_Value zeroinitializer, %LLVM_ValueKind 6, 0
  %43 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 1
  %44 = load %Type*, %Type** %43
  %45 = insertvalue %LLVM_Value %42, %Type* %44, 1
  %46 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 7
  %47 = load %Decl*, %Decl** %46
  %48 = getelementptr inbounds %Decl, %Decl* %47, i1 0, i32 4
  %49 = load %Nat32, %Nat32* %48
  %50 = insertvalue %LLVM_Value %45, %Nat32 %49, 4
  br label %select_1_end
select_1_6:
  %51 = icmp eq %ValueKind %3, 7
  br i1 %51, label %select_1_6_ok, label %select_1_7
select_1_6_ok:
  %52 = insertvalue %LLVM_Value zeroinitializer, %LLVM_ValueKind 9, 0
  %53 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 1
  %54 = load %Type*, %Type** %53
  %55 = insertvalue %LLVM_Value %52, %Type* %54, 1
  %56 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 8
  %57 = load %Decl*, %Decl** %56
  %58 = getelementptr inbounds %Decl, %Decl* %57, i1 0, i32 3
  %59 = load %Nat16, %Nat16* %58
  %60 = zext %Nat16 %59 to %Nat32
  %61 = insertvalue %LLVM_Value %55, %Nat32 %60, 4
  br label %select_1_end
select_1_7:
  %62 = icmp eq %ValueKind %3, 35
  br i1 %62, label %select_1_7_ok, label %select_1_8
select_1_7_ok:
  %63 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 17
  %64 = call %LLVM_Value (%ValueCall*) @func306 (%ValueCall* %63)
  br label %select_1_end
select_1_8:
  %65 = icmp eq %ValueKind %3, 36
  br i1 %65, label %select_1_8_ok, label %select_1_9
select_1_8_ok:
  %66 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 12
  %67 = call %LLVM_Value (%ValueIndex*) @func309 (%ValueIndex* %66)
  br label %select_1_end
select_1_9:
  %68 = icmp eq %ValueKind %3, 37
  br i1 %68, label %select_1_9_ok, label %select_1_10
select_1_9_ok:
  %69 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 13
  %70 = call %LLVM_Value (%ValueAccess*) @func311 (%ValueAccess* %69)
  br label %select_1_end
select_1_10:
  %71 = icmp eq %ValueKind %3, 13
  br i1 %71, label %select_1_10_ok, label %select_1_11
select_1_10_ok:
  %72 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 10
  %73 = call %LLVM_Value (%ValueUn*) @func312 (%ValueUn* %72)
  br label %select_1_end
select_1_11:
  %74 = icmp eq %ValueKind %3, 14
  br i1 %74, label %select_1_11_ok, label %select_1_12
select_1_11_ok:
  %75 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 10
  %76 = call %LLVM_Value (%ValueUn*) @func313 (%ValueUn* %75)
  br label %select_1_end
select_1_12:
  %77 = icmp eq %ValueKind %3, 16
  br i1 %77, label %select_1_12_ok, label %select_1_13
select_1_12_ok:
  %78 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 10
  %79 = call %LLVM_Value (%ValueUn*) @func315 (%ValueUn* %78)
  br label %select_1_end
select_1_13:
  %80 = icmp eq %ValueKind %3, 17
  br i1 %80, label %select_1_13_ok, label %select_1_14
select_1_13_ok:
  %81 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 10
  %82 = call %LLVM_Value (%ValueUn*) @func316 (%ValueUn* %81)
  br label %select_1_end
select_1_14:
  %83 = icmp eq %ValueKind %3, 15
  br i1 %83, label %select_1_14_ok, label %select_1_15
select_1_14_ok:
  %84 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 10
  %85 = call %LLVM_Value (%ValueUn*) @func314 (%ValueUn* %84)
  br label %select_1_end
select_1_15:
  %86 = icmp eq %ValueKind %3, 38
  br i1 %86, label %select_1_15_ok, label %select_1_16
select_1_15_ok:
  %87 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 14
  %88 = call %LLVM_Value (%ValueCast*) @func329 (%ValueCast* %87)
  br label %select_1_end
select_1_16:
  %89 = icmp eq %ValueKind %3, 40
  br i1 %89, label %select_1_16_ok, label %select_1_17
select_1_16_ok:
  %90 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 15
  %91 = call %LLVM_Value (%ValueAs*) @func325 (%ValueAs* %90)
  br label %select_1_end
select_1_17:
  %92 = icmp eq %ValueKind %3, 39
  br i1 %92, label %select_1_17_ok, label %select_1_18
select_1_17_ok:
  %93 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 16
  %94 = call %LLVM_Value (%ValueIs*) @func326 (%ValueIs* %93)
  br label %select_1_end
select_1_18:
  %95 = icmp eq %ValueKind %3, 41
  br i1 %95, label %select_1_18_ok, label %select_1_19
select_1_18_ok:
  %96 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 18
  %97 = call %LLVM_Value (%ValueWhen*) @func343 (%ValueWhen* %96)
  br label %select_1_end
select_1_19:
  %98 = icmp eq %ValueKind %3, 8
  br i1 %98, label %select_1_19_ok, label %select_1_20
select_1_19_ok:
  %99 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 4
  %100 = call %LLVM_Value (%ValueRecord*) @func345 (%ValueRecord* %99)
  br label %select_1_end
select_1_20:
  %101 = icmp eq %ValueKind %3, 10
  br i1 %101, label %select_1_20_ok, label %select_1_21
select_1_20_ok:
  %102 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 5
  %103 = call %LLVM_Value (%ValueArray*) @func347 (%ValueArray* %102)
  br label %select_1_end
select_1_21:
  %104 = icmp eq %ValueKind %3, 2
  br i1 %104, label %select_1_21_ok, label %select_1_22
select_1_21_ok:
  %105 = call %LLVM_Value (%Value*) @func303 (%Value* %0)
  br label %select_1_end
select_1_22:
  %106 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 11
  %107 = call %LLVM_Value (%ValueBin*) @func332 (%ValueBin* %106)
  br label %select_1_end
select_1_end:
  %108 = phi %LLVM_Value [ %5, %select_1_0_ok ], [ %10, %select_1_1_ok ], [ %19, %select_1_2_ok ], [ %30, %select_1_3_ok ], [ %40, %select_1_4_ok ], [ %50, %select_1_5_ok ], [ %61, %select_1_6_ok ], [ %64, %select_1_7_ok ], [ %67, %select_1_8_ok ], [ %70, %select_1_9_ok ], [ %73, %select_1_10_ok ], [ %76, %select_1_11_ok ], [ %79, %select_1_12_ok ], [ %82, %select_1_13_ok ], [ %85, %select_1_14_ok ], [ %88, %select_1_15_ok ], [ %91, %select_1_16_ok ], [ %94, %select_1_17_ok ], [ %97, %select_1_18_ok ], [ %100, %select_1_19_ok ], [ %103, %select_1_20_ok ], [ %105, %select_1_21_ok ], [ %107, %select_1_22 ]
  ret %LLVM_Value %108
}

define %LLVM_Value @func304 (%Value*) {
;stmt0:
  %2 = insertvalue %LLVM_Value zeroinitializer, %LLVM_ValueKind 4, 0
  %3 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 1
  %4 = load %Type*, %Type** %3
  %5 = insertvalue %LLVM_Value %2, %Type* %4, 1
  %6 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 2
  %7 = getelementptr inbounds %ValueImm, %ValueImm* %6, i1 0, i32 1
  %8 = load %Int64, %Int64* %7
  %9 = insertvalue %LLVM_Value %5, %Int64 %8, 2
  ret %LLVM_Value %9
}

define %LLVM_Value @func305 (%Value*) {
;stmt0:
  %2 = call %LLVM_Value (%Value*) @func302 (%Value* %0)
  %3 = call %LLVM_Value (%LLVM_Value) @func351 (%LLVM_Value %2)
  ret %LLVM_Value %3
}

define void @func307 (%Unit*, %Unit*, %Nat32, %Node*) {
;stmt0:
  %5 = bitcast %Unit* %0 to %Value*
;stmt1:
  %6 = bitcast %Unit* %1 to %func306.type1*
;stmt2:
  %7 = getelementptr inbounds %func306.type1, %func306.type1* %6, i1 0, i32 0
  %8 = getelementptr inbounds %func306.type1, %func306.type1* %6, i1 0, i32 1
  %9 = load %Nat16, %Nat16* %8
; index array
  %10 = getelementptr inbounds [64 x %LLVM_Value], [64 x %LLVM_Value]* %7, i1 0, %Nat16 %9
  %11 = call %LLVM_Value (%Value*) @func305 (%Value* %5)
  store %LLVM_Value %11, %LLVM_Value* %10, align 8
;stmt3:
  %12 = getelementptr inbounds %func306.type1, %func306.type1* %6, i1 0, i32 1
  %13 = getelementptr inbounds %func306.type1, %func306.type1* %6, i1 0, i32 1
  %14 = load %Nat16, %Nat16* %13
  %15 = add %Nat16 %14, 1
  store %Nat16 %15, %Nat16* %12, align 2
  ret void
}

define %LLVM_Value @func306 (%ValueCall*) {
;stmt0:
  %2 = alloca %func306.type1
  store %func306.type1 zeroinitializer, %func306.type1* %2, align 8
;stmt1:
  %3 = getelementptr inbounds %func306.type1, %func306.type1* %2, i1 0, i32 1
  store %Nat16 0, %Nat16* %3, align 2
;stmt2:
  %4 = getelementptr inbounds %ValueCall, %ValueCall* %0, i1 0, i32 2
  %5 = load %List*, %List** %4
  %6 = getelementptr inbounds %func306.type1, %func306.type1* %2, i1 0
  %7 = bitcast %func306.type1* %6 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @func64 (%List* %5, %ListForeachHandler @func307, %Unit* %7)
;stmt3:
  %8 = getelementptr inbounds %ValueCall, %ValueCall* %0, i1 0, i32 1
  %9 = load %Value*, %Value** %8
  %10 = call %LLVM_Value (%Value*) @func305 (%Value* %9)
;stmt4:
  %11 = bitcast [4 x %Nat8]* @func306_str1 to %Str
  call void (%Str) @o (%Str %11)
;stmt5:
  %12 = alloca %Nat32
  store %Nat32 0, %Nat32* %12, align 4
;stmt6:
  %13 = extractvalue %LLVM_Value %10, 1
  %14 = getelementptr inbounds %Type, %Type* %13, i1 0, i32 6
  %15 = getelementptr inbounds %TypeFunc, %TypeFunc* %14, i1 0, i32 1
  %16 = load %Type*, %Type** %15
  %17 = load %Type*, %Type** @typeUnit
  %18 = call i1 (%Type*, %Type*) @func426 (%Type* %16, %Type* %17)
  %19 = xor i1 %18, 1
  br i1 %19, label %then_0, label %else_0
then_0:
;stmt7:
  %20 = call %Nat32 () @lab_get ()
  store %Nat32 %20, %Nat32* %12, align 4
;stmt8:
  %21 = load %FILE*, %FILE** @fout
  %22 = bitcast [8 x %Nat8]* @func306_str2 to %Str
  %23 = load %Nat32, %Nat32* %12
  %24 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %21, %Str %22, %Nat32 %23)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt9:
  %25 = bitcast [6 x %Nat8]* @func306_str3 to %Str
  call void (%Str) @o (%Str %25)
;stmt10:
  %26 = extractvalue %LLVM_Value %10, 1
  call void (%Type*, i1, i1) @func369 (%Type* %26, i1 0, i1 0)
;stmt11:
  call void () @space ()
;stmt12:
  call void (%LLVM_Value) @func353 (%LLVM_Value %10)
;stmt13:
  %27 = bitcast [3 x %Nat8]* @func306_str4 to %Str
  call void (%Str) @o (%Str %27)
;stmt14:
  %28 = alloca %Nat16
  store %Nat16 0, %Nat16* %28, align 2
;stmt15:
  br label %continue_0
continue_0:
  %29 = load %Nat16, %Nat16* %28
  %30 = getelementptr inbounds %func306.type1, %func306.type1* %2, i1 0, i32 1
  %31 = load %Nat16, %Nat16* %30
  %32 = icmp ult %Nat16 %29, %31
  br i1 %32, label %body_0, label %break_0
body_0:
;stmt16:
  %33 = load %Nat16, %Nat16* %28
  %34 = icmp ugt %Nat16 %33, 0
  br i1 %34, label %then_1, label %else_1
then_1:
;stmt17:
  call void () @comma ()
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt18:
  %35 = getelementptr inbounds %func306.type1, %func306.type1* %2, i1 0, i32 0
  %36 = load %Nat16, %Nat16* %28
; index array
  %37 = getelementptr inbounds [64 x %LLVM_Value], [64 x %LLVM_Value]* %35, i1 0, %Nat16 %36
  %38 = load %LLVM_Value, %LLVM_Value* %37
  call void (%LLVM_Value) @func354 (%LLVM_Value %38)
;stmt19:
  %39 = load %Nat16, %Nat16* %28
  %40 = add %Nat16 %39, 1
  store %Nat16 %40, %Nat16* %28, align 2
  br label %continue_0
break_0:
;stmt20:
  %41 = bitcast [2 x %Nat8]* @func306_str5 to %Str
  call void (%Str) @o (%Str %41)
;stmt21:
  %42 = insertvalue %LLVM_Value zeroinitializer, %LLVM_ValueKind 9, 0
  %43 = getelementptr inbounds %ValueCall, %ValueCall* %0, i1 0, i32 0
  %44 = load %Type*, %Type** %43
  %45 = insertvalue %LLVM_Value %42, %Type* %44, 1
  %46 = load %Nat32, %Nat32* %12
  %47 = insertvalue %LLVM_Value %45, %Nat32 %46, 4
  ret %LLVM_Value %47
}

define %LLVM_Value @eval_index_uarray (%LLVM_Value, %LLVM_Value) {
;stmt0:
  %3 = bitcast [21 x %Nat8]* @func308_str1 to %Str
  call void (%Str) @o (%Str %3)
;stmt1:
  %4 = extractvalue %LLVM_Value %0, 1
  %5 = getelementptr inbounds %Type, %Type* %4, i1 0, i32 9
  %6 = getelementptr inbounds %TypeArrayU, %TypeArrayU* %5, i1 0, i32 0
  %7 = load %Type*, %Type** %6
;stmt2:
  %8 = call %Nat32 (%Type*, %LLVM_Value) @func300 (%Type* %7, %LLVM_Value %0)
;stmt3:
  call void (%LLVM_Value) @func354 (%LLVM_Value %1)
;stmt4:
  %9 = insertvalue %LLVM_Value zeroinitializer, %LLVM_ValueKind 8, 0
  %10 = insertvalue %LLVM_Value %9, %Type* %7, 1
  %11 = insertvalue %LLVM_Value %10, %Nat32 %8, 4
  ret %LLVM_Value %11
}

define %LLVM_Value @func310 (%LLVM_Value, %LLVM_Value) {
;stmt0:
  %3 = bitcast [15 x %Nat8]* @func309_func310_str1 to %Str
  call void (%Str) @o (%Str %3)
;stmt1:
  %4 = extractvalue %LLVM_Value %0, 1
  %5 = getelementptr inbounds %Type, %Type* %4, i1 0, i32 0
  %6 = load %TypeKind, %TypeKind* %5
  br label %select_1_0
select_1_0:
  %7 = icmp eq %TypeKind %6, 12
  br i1 %7, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %8 = extractvalue %LLVM_Value %0, 1
  br label %select_1_end
select_1_1:
  %9 = extractvalue %LLVM_Value %0, 1
  %10 = getelementptr inbounds %Type, %Type* %9, i1 0, i32 7
  %11 = getelementptr inbounds %TypePointer, %TypePointer* %10, i1 0, i32 0
  %12 = load %Type*, %Type** %11
  br label %select_1_end
select_1_end:
  %13 = phi %Type* [ %8, %select_1_0_ok ], [ %12, %select_1_1 ]
;stmt2:
  %14 = call %Nat32 (%Type*, %LLVM_Value) @func300 (%Type* %13, %LLVM_Value %0)
;stmt3:
  %15 = bitcast [7 x %Nat8]* @func309_func310_str2 to %Str
  call void (%Str) @o (%Str %15)
;stmt4:
  call void (%LLVM_Value) @func354 (%LLVM_Value %1)
;stmt5:
  %16 = getelementptr inbounds %Type, %Type* %13, i1 0, i32 8
  %17 = getelementptr inbounds %TypeArray, %TypeArray* %16, i1 0, i32 0
  %18 = load %Type*, %Type** %17
;stmt6:
  %19 = insertvalue %LLVM_Value zeroinitializer, %LLVM_ValueKind 8, 0
  %20 = insertvalue %LLVM_Value %19, %Type* %18, 1
  %21 = insertvalue %LLVM_Value %20, %Nat32 %14, 4
  ret %LLVM_Value %21
}

define %LLVM_Value @func309 (%ValueIndex*) {
;stmt0:
  %2 = getelementptr inbounds %ValueIndex, %ValueIndex* %0, i1 0, i32 1
  %3 = load %Value*, %Value** %2
  %4 = call %LLVM_Value (%Value*) @func302 (%Value* %3)
;stmt1:
  %5 = getelementptr inbounds %ValueIndex, %ValueIndex* %0, i1 0, i32 2
  %6 = load %Value*, %Value** %5
  %7 = call %LLVM_Value (%Value*) @func305 (%Value* %6)
;stmt2:
  %8 = extractvalue %LLVM_Value %4, 1
  %9 = call i1 (%Type*) @func393 (%Type* %8)
  br i1 %9, label %then_0, label %else_0
then_0:
;stmt3:
  %10 = call %LLVM_Value (%LLVM_Value, %LLVM_Value) @eval_index_uarray (%LLVM_Value %4, %LLVM_Value %7)
  ret %LLVM_Value %10
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt4:
  %12 = extractvalue %LLVM_Value %4, 0
  %13 = icmp eq %LLVM_ValueKind %12, 9
  %14 = extractvalue %LLVM_Value %4, 1
  %15 = call i1 (%Type*) @func391 (%Type* %14)
  %16 = and i1 %13, %15
;stmt5:
  %17 = and i1 %16, 1
  br i1 %17, label %then_1, label %else_1
then_1:
;stmt6:
  %18 = extractvalue %LLVM_Value %4, 1
  %19 = extractvalue %LLVM_Value %7, 2
  %20 = trunc %Int64 %19 to %Nat32
  %21 = call %Nat32 (%Type*, %LLVM_Value, %Nat32) @func301 (%Type* %18, %LLVM_Value %4, %Nat32 %20)
;stmt7:
  %22 = insertvalue %LLVM_Value zeroinitializer, %LLVM_ValueKind 9, 0
  %23 = getelementptr inbounds %ValueIndex, %ValueIndex* %0, i1 0, i32 0
  %24 = load %Type*, %Type** %23
  %25 = insertvalue %LLVM_Value %22, %Type* %24, 1
  %26 = insertvalue %LLVM_Value %25, %Nat32 %21, 4
  ret %LLVM_Value %26
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt8:
  %28 = call %LLVM_Value (%LLVM_Value, %LLVM_Value) @func310 (%LLVM_Value %4, %LLVM_Value %7)
  ret %LLVM_Value %28
}

define %LLVM_Value @func311 (%ValueAccess*) {
;stmt0:
  %2 = getelementptr inbounds %ValueAccess, %ValueAccess* %0, i1 0, i32 2
  %3 = load %Str, %Str* %2; loadImmPtr
  %4 = inttoptr i64 0 to%Str
  %5 = icmp ne %Str %3, %4
  %6 = bitcast [29 x %Nat8]* @func311_str1 to %Str
  call void (i1, %Str) @assert (i1 %5, %Str %6)
;stmt1:
  %7 = getelementptr inbounds %ValueAccess, %ValueAccess* %0, i1 0, i32 1
  %8 = load %Value*, %Value** %7
  %9 = getelementptr inbounds %Value, %Value* %8, i1 0, i32 0
  %10 = load %ValueKind, %ValueKind* %9
  %11 = icmp eq %ValueKind %10, 37
  br i1 %11, label %then_0, label %else_0
then_0:
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt2:
  %12 = getelementptr inbounds %ValueAccess, %ValueAccess* %0, i1 0, i32 1
  %13 = load %Value*, %Value** %12
  %14 = call %LLVM_Value (%Value*) @func302 (%Value* %13)
;stmt3:
  %15 = extractvalue %LLVM_Value %14, 1
  %16 = getelementptr inbounds %Type, %Type* %15, i1 0, i32 0
  %17 = load %TypeKind, %TypeKind* %16
  %18 = icmp eq %TypeKind %17, 11
;stmt4:
  br label %select_1_0
select_1_0:
  %19 = icmp eq i1 %18, 1
  br i1 %19, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %20 = extractvalue %LLVM_Value %14, 1
  %21 = getelementptr inbounds %Type, %Type* %20, i1 0, i32 7
  %22 = getelementptr inbounds %TypePointer, %TypePointer* %21, i1 0, i32 0
  %23 = load %Type*, %Type** %22
  br label %select_1_end
select_1_1:
  %24 = extractvalue %LLVM_Value %14, 1
  br label %select_1_end
select_1_end:
  %25 = phi %Type* [ %23, %select_1_0_ok ], [ %24, %select_1_1 ]
;stmt5:
  %26 = getelementptr inbounds %ValueAccess, %ValueAccess* %0, i1 0, i32 2
  %27 = load %Str, %Str* %26
  %28 = call %Decl* (%Type*, %Str) @func388 (%Type* %25, %Str %27)
;stmt6:
  %29 = getelementptr inbounds %Decl, %Decl* %28, i1 0, i32 3
  %30 = load %Nat16, %Nat16* %29
;stmt7:
  %31 = xor i1 %18, 1
  br i1 %31, label %then_1, label %else_1
then_1:
;stmt8:
  %32 = extractvalue %LLVM_Value %14, 0
  %33 = icmp eq %LLVM_ValueKind %32, 9
  br i1 %33, label %then_2, label %else_2
then_2:
;stmt9:
  %34 = zext %Nat16 %30 to %Nat32
  %35 = call %Nat32 (%Type*, %LLVM_Value, %Nat32) @func301 (%Type* %25, %LLVM_Value %14, %Nat32 %34)
;stmt10:
  %36 = insertvalue %LLVM_Value zeroinitializer, %LLVM_ValueKind 9, 0
  %37 = getelementptr inbounds %ValueAccess, %ValueAccess* %0, i1 0, i32 0
  %38 = load %Type*, %Type** %37
  %39 = insertvalue %LLVM_Value %36, %Type* %38, 1
  %40 = insertvalue %LLVM_Value %39, %Nat32 %35, 4
  ret %LLVM_Value %40
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
  %42 = icmp eq i1 %18, 1
  br i1 %42, label %select_2_0_ok, label %select_2_1
select_2_0_ok:
  %43 = call %LLVM_Value (%LLVM_Value) @func351 (%LLVM_Value %14)
  br label %select_2_end
select_2_1:
  br label %select_2_end
select_2_end:
  %44 = phi %LLVM_Value [ %43, %select_2_0_ok ], [ %14, %select_2_1 ]
;stmt12:
  %45 = call %Nat32 (%Type*, %LLVM_Value) @func300 (%Type* %25, %LLVM_Value %44)
;stmt13:
  %46 = load %FILE*, %FILE** @fout
  %47 = bitcast [13 x %Nat8]* @func311_str2 to %Str
  %48 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %46, %Str %47, %Nat16 %30)
;stmt14:
  %49 = insertvalue %LLVM_Value zeroinitializer, %LLVM_ValueKind 8, 0
  %50 = getelementptr inbounds %ValueAccess, %ValueAccess* %0, i1 0, i32 0
  %51 = load %Type*, %Type** %50
  %52 = insertvalue %LLVM_Value %49, %Type* %51, 1
  %53 = insertvalue %LLVM_Value %52, %Nat32 %45, 4
  ret %LLVM_Value %53
}

define %LLVM_Value @func312 (%ValueUn*) {
;stmt0:
  %2 = getelementptr inbounds %ValueUn, %ValueUn* %0, i1 0, i32 1
  %3 = load %Value*, %Value** %2
  %4 = call %LLVM_Value (%Value*) @func302 (%Value* %3)
;stmt1:
  %5 = extractvalue %LLVM_Value %4, 0
  %6 = icmp eq %LLVM_ValueKind %5, 8
  br i1 %6, label %then_0, label %else_0
then_0:
;stmt2:
  %7 = insertvalue %LLVM_Value zeroinitializer, %LLVM_ValueKind 9, 0
  %8 = getelementptr inbounds %ValueUn, %ValueUn* %0, i1 0, i32 0
  %9 = load %Type*, %Type** %8
  %10 = insertvalue %LLVM_Value %7, %Type* %9, 1
  %11 = extractvalue %LLVM_Value %4, 4
  %12 = insertvalue %LLVM_Value %10, %Nat32 %11, 4
  ret %LLVM_Value %12
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt3:
  %14 = extractvalue %LLVM_Value %4, 1
  %15 = call %Nat32 (%Type*, %LLVM_Value) @func300 (%Type* %14, %LLVM_Value %4)
;stmt4:
  %16 = bitcast [5 x %Nat8]* @func312_str1 to %Str
  call void (%Str) @o (%Str %16)
;stmt5:
  %17 = insertvalue %LLVM_Value zeroinitializer, %LLVM_ValueKind 9, 0
  %18 = getelementptr inbounds %ValueUn, %ValueUn* %0, i1 0, i32 0
  %19 = load %Type*, %Type** %18
  %20 = insertvalue %LLVM_Value %17, %Type* %19, 1
  %21 = insertvalue %LLVM_Value %20, %Nat32 %15, 4
  ret %LLVM_Value %21
}

define %LLVM_Value @func313 (%ValueUn*) {
;stmt0:
  %2 = getelementptr inbounds %ValueUn, %ValueUn* %0, i1 0, i32 1
  %3 = load %Value*, %Value** %2
  %4 = call %LLVM_Value (%Value*) @func305 (%Value* %3)
;stmt1:
  %5 = insertvalue %LLVM_Value zeroinitializer, %LLVM_ValueKind 8, 0
  %6 = getelementptr inbounds %ValueUn, %ValueUn* %0, i1 0, i32 0
  %7 = load %Type*, %Type** %6
  %8 = insertvalue %LLVM_Value %5, %Type* %7, 1
  %9 = extractvalue %LLVM_Value %4, 4
  %10 = insertvalue %LLVM_Value %8, %Nat32 %9, 4
  ret %LLVM_Value %10
}

define %LLVM_Value @func314 (%ValueUn*) {
;stmt0:
  %2 = getelementptr inbounds %ValueUn, %ValueUn* %0, i1 0, i32 1
  %3 = load %Value*, %Value** %2
  %4 = call %LLVM_Value (%Value*) @func305 (%Value* %3)
;stmt1:
  %5 = bitcast [4 x %Nat8]* @func314_str1 to %Str
  %6 = extractvalue %LLVM_Value %4, 1
  %7 = call %Nat32 (%Str, %Type*) @func299 (%Str %5, %Type* %6)
;stmt2:
  call void () @space ()
;stmt3:
  call void (%LLVM_Value) @func353 (%LLVM_Value %4)
;stmt4:
  %8 = extractvalue %LLVM_Value %4, 1
  %9 = load %Type*, %Type** @typeBool
  %10 = call i1 (%Type*, %Type*) @func426 (%Type* %8, %Type* %9)
  br i1 %10, label %then_0, label %else_0
then_0:
;stmt5:
  %11 = bitcast [4 x %Nat8]* @func314_str2 to %Str
  call void (%Str) @o (%Str %11)
  br label %endif_0
else_0:
;stmt6:
  %12 = bitcast [5 x %Nat8]* @func314_str3 to %Str
  call void (%Str) @o (%Str %12)
  br label %endif_0
endif_0:
;stmt7:
  %13 = insertvalue %LLVM_Value zeroinitializer, %LLVM_ValueKind 9, 0
  %14 = extractvalue %LLVM_Value %4, 1
  %15 = insertvalue %LLVM_Value %13, %Type* %14, 1
  %16 = insertvalue %LLVM_Value %15, %Nat32 %7, 4
  ret %LLVM_Value %16
}

define %LLVM_Value @func315 (%ValueUn*) {
;stmt0:
  %2 = getelementptr inbounds %ValueUn, %ValueUn* %0, i1 0, i32 1
  %3 = load %Value*, %Value** %2
  %4 = call %LLVM_Value (%Value*) @func305 (%Value* %3)
;stmt1:
  %5 = bitcast [8 x %Nat8]* @func315_str1 to %Str
  %6 = insertvalue %LLVM_Value zeroinitializer, %LLVM_ValueKind 4, 0
  %7 = load %Type*, %Type** @typeBaseInt
  %8 = insertvalue %LLVM_Value %6, %Type* %7, 1
  %9 = insertvalue %LLVM_Value %8, %Int64 0, 2
  %10 = extractvalue %LLVM_Value %4, 1
  %11 = call %Nat32 (%Str, %LLVM_Value, %LLVM_Value, %Type*) @func331 (%Str %5, %LLVM_Value %9, %LLVM_Value %4, %Type* %10)
;stmt2:
  %12 = insertvalue %LLVM_Value zeroinitializer, %LLVM_ValueKind 9, 0
  %13 = extractvalue %LLVM_Value %4, 1
  %14 = insertvalue %LLVM_Value %12, %Type* %13, 1
  %15 = insertvalue %LLVM_Value %14, %Nat32 %11, 4
  ret %LLVM_Value %15
}

define %LLVM_Value @func316 (%ValueUn*) {
;stmt0:
  %2 = getelementptr inbounds %ValueUn, %ValueUn* %0, i1 0, i32 1
  %3 = load %Value*, %Value** %2
  %4 = call %LLVM_Value (%Value*) @func305 (%Value* %3)
  ret %LLVM_Value %4
}

define %LLVM_Value @func317 (%Str, %LLVM_Value, %Type*) {
;stmt0:
  %4 = extractvalue %LLVM_Value %1, 1
  %5 = call %Nat32 (%Str, %Type*) @func299 (%Str %0, %Type* %4)
;stmt1:
  call void () @space ()
;stmt2:
  call void (%LLVM_Value) @func353 (%LLVM_Value %1)
;stmt3:
  %6 = bitcast [5 x %Nat8]* @func317_str1 to %Str
  call void (%Str) @o (%Str %6)
;stmt4:
  call void (%Type*) @func372 (%Type* %2)
;stmt5:
  %7 = insertvalue %LLVM_Value zeroinitializer, %LLVM_ValueKind 9, 0
  %8 = insertvalue %LLVM_Value %7, %Type* %2, 1
  %9 = insertvalue %LLVM_Value %8, %Nat32 %5, 4
  ret %LLVM_Value %9
}

define %LLVM_Value @func318 (%LLVM_Value, %Type*) {
;stmt0:
  %3 = extractvalue %LLVM_Value %0, 1
  %4 = getelementptr inbounds %Type, %Type* %3, i1 0, i32 0
  %5 = load %TypeKind, %TypeKind* %4
  br label %select_1_0
select_1_0:
  %6 = icmp eq %TypeKind %5, 5
  br i1 %6, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %7 = bitcast [9 x %Nat8]* @func318_str1 to %Str
  %8 = call %LLVM_Value (%Str, %LLVM_Value, %Type*) @func317 (%Str %7, %LLVM_Value %0, %Type* %1)
  br label %select_1_end
select_1_1:
  %9 = bitcast [8 x %Nat8]* @func318_str2 to %Str
  %10 = call %LLVM_Value (%Str, %LLVM_Value, %Type*) @func317 (%Str %9, %LLVM_Value %0, %Type* %1)
  br label %select_1_end
select_1_end:
  %11 = phi %LLVM_Value [ %8, %select_1_0_ok ], [ %10, %select_1_1 ]
  ret %LLVM_Value %11
}

define %LLVM_Value @func319 (%LLVM_Value, %Type*) {
;stmt0:
  %3 = bitcast [6 x %Nat8]* @func319_str1 to %Str
  %4 = call %LLVM_Value (%Str, %LLVM_Value, %Type*) @func317 (%Str %3, %LLVM_Value %0, %Type* %1)
  ret %LLVM_Value %4
}

define %LLVM_Value @func321 (%LLVM_Value, %Type*) {
;stmt0:
  %3 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 5
  %4 = getelementptr inbounds %TypeNumeric, %TypeNumeric* %3, i1 0, i32 1
  %5 = load i1, i1* %4
  br label %select_1_0
select_1_0:
  %6 = icmp eq i1 %5, 1
  br i1 %6, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %7 = bitcast [5 x %Nat8]* @func320_func321_str1 to %Str
  %8 = call %LLVM_Value (%Str, %LLVM_Value, %Type*) @func317 (%Str %7, %LLVM_Value %0, %Type* %1)
  br label %select_1_end
select_1_1:
  %9 = bitcast [5 x %Nat8]* @func320_func321_str2 to %Str
  %10 = call %LLVM_Value (%Str, %LLVM_Value, %Type*) @func317 (%Str %9, %LLVM_Value %0, %Type* %1)
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
  %4 = getelementptr inbounds %Type, %Type* %3, i1 0, i32 5
  %5 = getelementptr inbounds %TypeNumeric, %TypeNumeric* %4, i1 0, i32 0
  %6 = load %Nat32, %Nat32* %5
  %7 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 5
  %8 = getelementptr inbounds %TypeNumeric, %TypeNumeric* %7, i1 0, i32 0
  %9 = load %Nat32, %Nat32* %8
  %10 = icmp ugt %Nat32 %6, %9
  %11 = icmp eq i1 1, %10
  br i1 %11, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %12 = bitcast [6 x %Nat8]* @func320_str1 to %Str
  %13 = call %LLVM_Value (%Str, %LLVM_Value, %Type*) @func317 (%Str %12, %LLVM_Value %0, %Type* %1)
  br label %select_1_end
select_1_1:
  %14 = extractvalue %LLVM_Value %0, 1
  %15 = getelementptr inbounds %Type, %Type* %14, i1 0, i32 5
  %16 = getelementptr inbounds %TypeNumeric, %TypeNumeric* %15, i1 0, i32 0
  %17 = load %Nat32, %Nat32* %16
  %18 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 5
  %19 = getelementptr inbounds %TypeNumeric, %TypeNumeric* %18, i1 0, i32 0
  %20 = load %Nat32, %Nat32* %19
  %21 = icmp ult %Nat32 %17, %20
  %22 = icmp eq i1 1, %21
  br i1 %22, label %select_1_1_ok, label %select_1_2
select_1_1_ok:
  %23 = call %LLVM_Value (%LLVM_Value, %Type*) @func321 (%LLVM_Value %0, %Type* %1)
  br label %select_1_end
select_1_2:
  %24 = bitcast [8 x %Nat8]* @func320_str2 to %Str
  %25 = call %LLVM_Value (%Str, %LLVM_Value, %Type*) @func317 (%Str %24, %LLVM_Value %0, %Type* %1)
  br label %select_1_end
select_1_end:
  %26 = phi %LLVM_Value [ %13, %select_1_0_ok ], [ %23, %select_1_1_ok ], [ %25, %select_1_2 ]
  ret %LLVM_Value %26
}

define %LLVM_Value @eval_cast_enum_to_basic (%LLVM_Value, %Type*) {
;stmt0:
  br label %select_1_0
select_1_0:
  %3 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 5
  %4 = getelementptr inbounds %TypeNumeric, %TypeNumeric* %3, i1 0, i32 0
  %5 = load %Nat32, %Nat32* %4
  %6 = icmp ugt %Nat32 2, %5
  %7 = icmp eq i1 1, %6
  br i1 %7, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %8 = bitcast [6 x %Nat8]* @func322_str1 to %Str
  %9 = call %LLVM_Value (%Str, %LLVM_Value, %Type*) @func317 (%Str %8, %LLVM_Value %0, %Type* %1)
  br label %select_1_end
select_1_1:
  %10 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 5
  %11 = getelementptr inbounds %TypeNumeric, %TypeNumeric* %10, i1 0, i32 0
  %12 = load %Nat32, %Nat32* %11
  %13 = icmp ult %Nat32 2, %12
  %14 = icmp eq i1 1, %13
  br i1 %14, label %select_1_1_ok, label %select_1_2
select_1_1_ok:
  %15 = bitcast [5 x %Nat8]* @func322_str2 to %Str
  %16 = call %LLVM_Value (%Str, %LLVM_Value, %Type*) @func317 (%Str %15, %LLVM_Value %0, %Type* %1)
  br label %select_1_end
select_1_2:
  %17 = bitcast [8 x %Nat8]* @func322_str3 to %Str
  %18 = call %LLVM_Value (%Str, %LLVM_Value, %Type*) @func317 (%Str %17, %LLVM_Value %0, %Type* %1)
  br label %select_1_end
select_1_end:
  %19 = phi %LLVM_Value [ %9, %select_1_0_ok ], [ %16, %select_1_1_ok ], [ %18, %select_1_2 ]
  ret %LLVM_Value %19
}

define %LLVM_Value @func324 (%LLVM_Value, %Type*) {
;stmt0:
  %3 = extractvalue %LLVM_Value %0, 1
  %4 = getelementptr inbounds %Type, %Type* %3, i1 0, i32 0
  %5 = load %TypeKind, %TypeKind* %4
;stmt1:
  %6 = load %FILE*, %FILE** @fout
  %7 = bitcast [26 x %Nat8]* @func323_func324_str1 to %Str
  %8 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %6, %Str %7, %TypeKind %5)
;stmt2:
  %9 = bitcast [6 x %Nat8]* @func323_func324_str2 to %Str
  %10 = call %Int32 (%Str, ...) @printf (%Str %9)
;stmt3:
  %11 = extractvalue %LLVM_Value %0, 1
  call void (%Type*) @func81 (%Type* %11)
;stmt4:
  %12 = bitcast [5 x %Nat8]* @func323_func324_str3 to %Str
  %13 = call %Int32 (%Str, ...) @printf (%Str %12)
;stmt5:
  call void (%Type*) @func81 (%Type* %1)
;stmt6:
  %14 = bitcast [2 x %Nat8]* @func323_func324_str4 to %Str
  %15 = call %Int32 (%Str, ...) @printf (%Str %14)
;stmt7:
  %16 = bitcast [19 x %Nat8]* @func323_func324_str5 to %Str
  call void (i1, %Str) @assert (i1 0, %Str %16)
;stmt8:
  %17 = insertvalue %LLVM_Value zeroinitializer, %LLVM_ValueKind 0, 0
  ret %LLVM_Value %17
}

define %LLVM_Value @func323 (%LLVM_Value, %Type*) {
;stmt0:
  %3 = extractvalue %LLVM_Value %0, 1
  %4 = getelementptr inbounds %Type, %Type* %3, i1 0, i32 0
  %5 = load %TypeKind, %TypeKind* %4
  br label %select_1_0
select_1_0:
  %6 = icmp eq %TypeKind %5, 5
  br i1 %6, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %7 = call %LLVM_Value (%LLVM_Value, %Type*) @eval_cast_basic_to_basic (%LLVM_Value %0, %Type* %1)
  br label %select_1_end
select_1_1:
  %8 = icmp eq %TypeKind %5, 11
  br i1 %8, label %select_1_1_ok, label %select_1_2
select_1_1_ok:
  %9 = bitcast [9 x %Nat8]* @func323_str1 to %Str
  %10 = call %LLVM_Value (%Str, %LLVM_Value, %Type*) @func317 (%Str %9, %LLVM_Value %0, %Type* %1)
  br label %select_1_end
select_1_2:
  %11 = icmp eq %TypeKind %5, 9
  br i1 %11, label %select_1_2_ok, label %select_1_3
select_1_2_ok:
  %12 = call %LLVM_Value (%LLVM_Value, %Type*) @eval_cast_enum_to_basic (%LLVM_Value %0, %Type* %1)
  br label %select_1_end
select_1_3:
  %13 = icmp eq %TypeKind %5, 7
  br i1 %13, label %select_1_3_ok, label %select_1_4
select_1_3_ok:
  %14 = bitcast [5 x %Nat8]* @func323_str2 to %Str
  %15 = call %LLVM_Value (%Str, %LLVM_Value, %Type*) @func317 (%Str %14, %LLVM_Value %0, %Type* %1)
  br label %select_1_end
select_1_4:
  %16 = icmp eq %TypeKind %5, 14
  br i1 %16, label %select_1_4_ok, label %select_1_5
select_1_4_ok:
  %17 = bitcast [8 x %Nat8]* @func323_str3 to %Str
  %18 = call %LLVM_Value (%Str, %LLVM_Value, %Type*) @func317 (%Str %17, %LLVM_Value %0, %Type* %1)
  br label %select_1_end
select_1_5:
  %19 = icmp eq %TypeKind %5, 10
  br i1 %19, label %select_1_5_ok, label %select_1_6
select_1_5_ok:
  %20 = bitcast [8 x %Nat8]* @func323_str4 to %Str
  %21 = call %LLVM_Value (%Str, %LLVM_Value, %Type*) @func317 (%Str %20, %LLVM_Value %0, %Type* %1)
  br label %select_1_end
select_1_6:
  %22 = call %LLVM_Value (%LLVM_Value, %Type*) @func324 (%LLVM_Value %0, %Type* %1)
  br label %select_1_end
select_1_end:
  %23 = phi %LLVM_Value [ %7, %select_1_0_ok ], [ %10, %select_1_1_ok ], [ %12, %select_1_2_ok ], [ %15, %select_1_3_ok ], [ %18, %select_1_4_ok ], [ %21, %select_1_5_ok ], [ %22, %select_1_6 ]
  ret %LLVM_Value %23
}

define %LLVM_Value @func325 (%ValueAs*) {
;stmt0:
  %2 = getelementptr inbounds %ValueAs, %ValueAs* %0, i1 0, i32 1
  %3 = load %Value*, %Value** %2
  %4 = call %LLVM_Value (%Value*) @func305 (%Value* %3)
;stmt1:
  %5 = getelementptr inbounds %ValueAs, %ValueAs* %0, i1 0, i32 0
  %6 = load %Type*, %Type** %5
;stmt2:
  %7 = bitcast [8 x %Nat8]* @func325_str1 to %Str
  %8 = call %LLVM_Value (%Str, %LLVM_Value, %Type*) @func317 (%Str %7, %LLVM_Value %4, %Type* %6)
  ret %LLVM_Value %8
}

define %LLVM_Value @func326 (%ValueIs*) {
;stmt0:
  %2 = getelementptr inbounds %ValueIs, %ValueIs* %0, i1 0, i32 1
  %3 = load %Value*, %Value** %2
  %4 = call %LLVM_Value (%Value*) @func305 (%Value* %3)
;stmt1:
  %5 = extractvalue %LLVM_Value %4, 1
  %6 = getelementptr inbounds %Type, %Type* %5, i1 0, i32 13
  %7 = getelementptr inbounds %TypeUnion, %TypeUnion* %6, i1 0, i32 1
  %8 = load %Type*, %Type** %7; loadImmPtr
  %9 = inttoptr i64 0 to%Type*
  %10 = icmp ne %Type* %8, %9
  br i1 %10, label %then_0, label %else_0
then_0:
;stmt2:
  %11 = insertvalue %LLVM_Value zeroinitializer, %LLVM_ValueKind 4, 0
  %12 = load %Type*, %Type** @typeBaseInt
  %13 = insertvalue %LLVM_Value %11, %Type* %12, 1
  %14 = insertvalue %LLVM_Value %13, %Int64 0, 2
  %15 = load %Type*, %Type** @typeBaseInt
  %16 = call %LLVM_Value (%LLVM_Value, %Type*) @func340 (%LLVM_Value %14, %Type* %15)
;stmt3:
  %17 = bitcast [9 x %Nat8]* @func326_str1 to %Str
  %18 = load %Type*, %Type** @typeBaseInt
  %19 = call %LLVM_Value (%Str, %LLVM_Value, %Type*) @func317 (%Str %17, %LLVM_Value %4, %Type* %18)
;stmt4:
  %20 = getelementptr inbounds %ValueIs, %ValueIs* %0, i1 0, i32 2
  %21 = load %Nat32, %Nat32* %20
  br label %select_1_0
select_1_0:
  %22 = icmp eq %Nat32 %21, 0
  br i1 %22, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %23 = bitcast [8 x %Nat8]* @func326_str2 to %Str
  %24 = load %Type*, %Type** @typeBaseInt
  %25 = call %Nat32 (%Str, %LLVM_Value, %LLVM_Value, %Type*) @func331 (%Str %23, %LLVM_Value %19, %LLVM_Value %16, %Type* %24)
  br label %select_1_end
select_1_1:
  %26 = icmp eq %Nat32 %21, 1
  br i1 %26, label %select_1_1_ok, label %select_1_2
select_1_1_ok:
  %27 = bitcast [8 x %Nat8]* @func326_str3 to %Str
  %28 = load %Type*, %Type** @typeBaseInt
  %29 = call %Nat32 (%Str, %LLVM_Value, %LLVM_Value, %Type*) @func331 (%Str %27, %LLVM_Value %19, %LLVM_Value %16, %Type* %28)
  br label %select_1_end
select_1_2:
  %30 = bitcast %Nat32 0 to %Nat32
  br label %select_1_end
select_1_end:
  %31 = phi %Nat32 [ %25, %select_1_0_ok ], [ %29, %select_1_1_ok ], [ %30, %select_1_2 ]
;stmt5:
  %32 = insertvalue %LLVM_Value zeroinitializer, %LLVM_ValueKind 9, 0
  %33 = load %Type*, %Type** @typeBool
  %34 = insertvalue %LLVM_Value %32, %Type* %33, 1
  %35 = insertvalue %LLVM_Value %34, %Nat32 %31, 4
  ret %LLVM_Value %35
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt6:
  %37 = extractvalue %LLVM_Value %4, 0
  %38 = icmp ne %LLVM_ValueKind %37, 9
  br i1 %38, label %then_1, label %else_1
then_1:
;stmt7:
  %39 = bitcast [31 x %Nat8]* @func326_str4 to %Str
  call void (%Str) @fatal (%Str %39)
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt8:
  %40 = call %Nat32 () @lab_get ()
;stmt9:
  %41 = load %FILE*, %FILE** @fout
  %42 = bitcast [29 x %Nat8]* @func326_str5 to %Str
  %43 = extractvalue %LLVM_Value %4, 1
  %44 = getelementptr inbounds %Type, %Type* %43, i1 0, i32 2
  %45 = load %Str, %Str* %44
  %46 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %41, %Str %42, %Nat32 %40, %Str %45)
;stmt10:
  call void (%LLVM_Value) @func353 (%LLVM_Value %4)
;stmt11:
  %47 = bitcast [4 x %Nat8]* @func326_str6 to %Str
  call void (%Str) @o (%Str %47)
;stmt12:
  %48 = call %Type* (%Nat32) @func430 (%Nat32 2)
;stmt13:
  %49 = insertvalue %LLVM_Value zeroinitializer, %LLVM_ValueKind 4, 0
  %50 = insertvalue %LLVM_Value %49, %Type* %48, 1
  %51 = getelementptr inbounds %ValueIs, %ValueIs* %0, i1 0, i32 2
  %52 = load %Nat32, %Nat32* %51
  %53 = sext %Nat32 %52 to %Int64
  %54 = insertvalue %LLVM_Value %50, %Int64 %53, 2
  %55 = load %Type*, %Type** @typeBaseInt
  %56 = call %LLVM_Value (%LLVM_Value, %Type*) @func340 (%LLVM_Value %54, %Type* %55)
;stmt14:
  %57 = bitcast [8 x %Nat8]* @func326_str7 to %Str
  %58 = insertvalue %LLVM_Value zeroinitializer, %LLVM_ValueKind 9, 0
  %59 = getelementptr inbounds %ValueIs, %ValueIs* %0, i1 0, i32 0
  %60 = load %Type*, %Type** %59
  %61 = insertvalue %LLVM_Value %58, %Type* %60, 1
  %62 = insertvalue %LLVM_Value %61, %Nat32 %40, 4
  %63 = call %Nat32 (%Str, %LLVM_Value, %LLVM_Value, %Type*) @func331 (%Str %57, %LLVM_Value %62, %LLVM_Value %56, %Type* %48)
;stmt15:
  %64 = insertvalue %LLVM_Value zeroinitializer, %LLVM_ValueKind 9, 0
  %65 = load %Type*, %Type** @typeBool
  %66 = insertvalue %LLVM_Value %64, %Type* %65, 1
  %67 = insertvalue %LLVM_Value %66, %Nat32 %63, 4
  ret %LLVM_Value %67
}

define %LLVM_Value @eval_cast_to_union (%LLVM_Value, %Type*) {
;stmt0:
  %3 = extractvalue %LLVM_Value %0, 1
  %4 = call %Nat32 (%Type*, %Type*) @func432 (%Type* %1, %Type* %3)
;stmt1:
  %5 = call i1 (%Type*) @func399 (%Type* %1)
  %6 = xor i1 %5, 1
  br i1 %6, label %then_0, label %else_0
then_0:
;stmt2:
  %7 = bitcast [7 x %Nat8]* @func327_str1 to %Str
  %8 = call %Nat32 (%Str, %Type*) @func299 (%Str %7, %Type* %1)
;stmt3:
  %9 = call %Type* (%Nat32) @func430 (%Nat32 2)
;stmt4:; loadImmPtr
  %10 = inttoptr i64 0 to%TokenInfo*
  %11 = call %Type* (%Type*, %TokenInfo*) @func382 (%Type* %9, %TokenInfo* %10)
;stmt5:
  %12 = load %FILE*, %FILE** @fout
  %13 = bitcast [20 x %Nat8]* @func327_str2 to %Str
  %14 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %12, %Str %13, %Nat32 %4)
;stmt6:
  %15 = insertvalue %LLVM_Value zeroinitializer, %LLVM_ValueKind 6, 0
  %16 = insertvalue %LLVM_Value %15, %Type* %1, 1
  %17 = insertvalue %LLVM_Value %16, %Nat32 %8, 4
  %18 = call %Nat32 (%Type*, %LLVM_Value) @func300 (%Type* %1, %LLVM_Value %17)
;stmt7:
  %19 = bitcast [12 x %Nat8]* @func327_str3 to %Str
  call void (%Str) @o (%Str %19)
;stmt8:
  %20 = insertvalue %LLVM_Value zeroinitializer, %LLVM_ValueKind 9, 0
  %21 = insertvalue %LLVM_Value %20, %Type* %11, 1
  %22 = insertvalue %LLVM_Value %21, %Nat32 %18, 4
  %23 = insertvalue %LLVM_Value zeroinitializer, %LLVM_ValueKind 4, 0
  %24 = insertvalue %LLVM_Value %23, %Type* %9, 1
  %25 = sext %Nat32 %4 to %Int64
  %26 = insertvalue %LLVM_Value %24, %Int64 %25, 2
  call void (%LLVM_Value, %LLVM_Value) @func350 (%LLVM_Value %22, %LLVM_Value %26)
;stmt9:
  %27 = bitcast [13 x %Nat8]* @func327_str4 to %Str
  call void (%Str) @ol (%Str %27)
;stmt10:
  %28 = insertvalue %LLVM_Value zeroinitializer, %LLVM_ValueKind 6, 0
  %29 = insertvalue %LLVM_Value %28, %Type* %1, 1
  %30 = insertvalue %LLVM_Value %29, %Nat32 %8, 4
  %31 = call %Nat32 (%Type*, %LLVM_Value) @func300 (%Type* %1, %LLVM_Value %30)
;stmt11:
  %32 = bitcast [12 x %Nat8]* @func327_str5 to %Str
  call void (%Str) @o (%Str %32)
;stmt12:
  %33 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 13
  %34 = getelementptr inbounds %TypeUnion, %TypeUnion* %33, i1 0, i32 2
  %35 = load %Nat32, %Nat32* %34
;stmt13:
  %36 = load %Type*, %Type** @typeChar; loadImmPtr
  %37 = inttoptr i64 0 to%TokenInfo*
  %38 = call %Type* (%Type*, %Nat32, %TokenInfo*) @func384 (%Type* %36, %Nat32 %35, %TokenInfo* %37)
;stmt14:; loadImmPtr
  %39 = inttoptr i64 0 to%TokenInfo*
  %40 = call %Type* (%Type*, %TokenInfo*) @func382 (%Type* %38, %TokenInfo* %39)
;stmt15:
  %41 = bitcast [8 x %Nat8]* @func327_str6 to %Str
  %42 = insertvalue %LLVM_Value zeroinitializer, %LLVM_ValueKind 9, 0
  %43 = insertvalue %LLVM_Value %42, %Type* %40, 1
  %44 = insertvalue %LLVM_Value %43, %Nat32 %31, 4
  %45 = extractvalue %LLVM_Value %0, 1; loadImmPtr
  %46 = inttoptr i64 0 to%TokenInfo*
  %47 = call %Type* (%Type*, %TokenInfo*) @func382 (%Type* %45, %TokenInfo* %46)
  %48 = call %LLVM_Value (%Str, %LLVM_Value, %Type*) @func317 (%Str %41, %LLVM_Value %44, %Type* %47)
;stmt16:
  call void (%LLVM_Value, %LLVM_Value) @func350 (%LLVM_Value %48, %LLVM_Value %0)
;stmt17:
  %49 = insertvalue %LLVM_Value zeroinitializer, %LLVM_ValueKind 6, 0
  %50 = insertvalue %LLVM_Value %49, %Type* %1, 1
  %51 = insertvalue %LLVM_Value %50, %Nat32 %8, 4
  ret %LLVM_Value %51
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt18:
  br label %select_1_0
select_1_0:
  %53 = extractvalue %LLVM_Value %0, 1
  %54 = load %Type*, %Type** @typeUnit
  %55 = call i1 (%Type*, %Type*) @func426 (%Type* %53, %Type* %54)
  %56 = icmp eq i1 1, %55
  br i1 %56, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %57 = bitcast [9 x %Nat8]* @func327_str7 to %Str
  %58 = call %LLVM_Value (%Str, %LLVM_Value, %Type*) @func317 (%Str %57, %LLVM_Value %0, %Type* %1)
  br label %select_1_end
select_1_1:
  %59 = extractvalue %LLVM_Value %0, 1
  %60 = getelementptr inbounds %Type, %Type* %59, i1 0, i32 0
  %61 = load %TypeKind, %TypeKind* %60
  %62 = icmp eq %TypeKind %61, 5
  %63 = icmp eq i1 1, %62
  br i1 %63, label %select_1_1_ok, label %select_1_2
select_1_1_ok:
  %64 = bitcast [9 x %Nat8]* @func327_str8 to %Str
  %65 = call %LLVM_Value (%Str, %LLVM_Value, %Type*) @func317 (%Str %64, %LLVM_Value %0, %Type* %1)
  br label %select_1_end
select_1_2:
  %66 = bitcast [8 x %Nat8]* @func327_str9 to %Str
  %67 = call %LLVM_Value (%Str, %LLVM_Value, %Type*) @func317 (%Str %66, %LLVM_Value %0, %Type* %1)
  br label %select_1_end
select_1_end:
  %68 = phi %LLVM_Value [ %58, %select_1_0_ok ], [ %65, %select_1_1_ok ], [ %67, %select_1_2 ]
  ret %LLVM_Value %68
}

define %LLVM_Value @eval_cast_union_to (%LLVM_Value, %Type*) {
;stmt0:
  %3 = bitcast [7 x %Nat8]* @func328_str1 to %Str
  %4 = extractvalue %LLVM_Value %0, 1
  %5 = call %Nat32 (%Str, %Type*) @func299 (%Str %3, %Type* %4)
;stmt1:
  %6 = insertvalue %LLVM_Value zeroinitializer, %LLVM_ValueKind 6, 0
  %7 = extractvalue %LLVM_Value %0, 1
  %8 = insertvalue %LLVM_Value %6, %Type* %7, 1
  %9 = insertvalue %LLVM_Value %8, %Nat32 %5, 4
  call void (%LLVM_Value, %LLVM_Value) @func350 (%LLVM_Value %9, %LLVM_Value %0)
;stmt2:
  %10 = extractvalue %LLVM_Value %0, 1
  %11 = getelementptr inbounds %Type, %Type* %10, i1 0, i32 13
  %12 = getelementptr inbounds %TypeUnion, %TypeUnion* %11, i1 0, i32 2
  %13 = load %Nat32, %Nat32* %12
;stmt3:
  %14 = load %Type*, %Type** @typeChar; loadImmPtr
  %15 = inttoptr i64 0 to%TokenInfo*
  %16 = call %Type* (%Type*, %Nat32, %TokenInfo*) @func384 (%Type* %14, %Nat32 %13, %TokenInfo* %15)
;stmt4:; loadImmPtr
  %17 = inttoptr i64 0 to%TokenInfo*
  %18 = call %Type* (%Type*, %TokenInfo*) @func382 (%Type* %16, %TokenInfo* %17)
;stmt5:
  %19 = extractvalue %LLVM_Value %0, 1
  %20 = insertvalue %LLVM_Value zeroinitializer, %LLVM_ValueKind 6, 0
  %21 = extractvalue %LLVM_Value %0, 1
  %22 = insertvalue %LLVM_Value %20, %Type* %21, 1
  %23 = insertvalue %LLVM_Value %22, %Nat32 %5, 4
  %24 = call %Nat32 (%Type*, %LLVM_Value) @func300 (%Type* %19, %LLVM_Value %23)
;stmt6:
  %25 = bitcast [12 x %Nat8]* @func328_str2 to %Str
  call void (%Str) @o (%Str %25)
;stmt7:; loadImmPtr
  %26 = inttoptr i64 0 to%TokenInfo*
  %27 = call %Type* (%Type*, %TokenInfo*) @func382 (%Type* %1, %TokenInfo* %26)
;stmt8:
  %28 = bitcast [8 x %Nat8]* @func328_str3 to %Str
  %29 = insertvalue %LLVM_Value zeroinitializer, %LLVM_ValueKind 9, 0
  %30 = insertvalue %LLVM_Value %29, %Type* %18, 1
  %31 = insertvalue %LLVM_Value %30, %Nat32 %24, 4
  %32 = call %LLVM_Value (%Str, %LLVM_Value, %Type*) @func317 (%Str %28, %LLVM_Value %31, %Type* %27)
;stmt9:
  %33 = bitcast [5 x %Nat8]* @func328_str4 to %Str
  %34 = call %Nat32 (%Str, %Type*) @func299 (%Str %33, %Type* %1)
;stmt10:
  call void () @comma ()
;stmt11:
  call void (%Type*) @func372 (%Type* %1)
;stmt12:
  %35 = bitcast [3 x %Nat8]* @func328_str5 to %Str
  call void (%Str) @o (%Str %35)
;stmt13:
  call void (%LLVM_Value) @func353 (%LLVM_Value %32)
;stmt14:
  %36 = insertvalue %LLVM_Value zeroinitializer, %LLVM_ValueKind 9, 0
  %37 = insertvalue %LLVM_Value %36, %Type* %1, 1
  %38 = insertvalue %LLVM_Value %37, %Nat32 %34, 4
  ret %LLVM_Value %38
}

define %LLVM_Value @func330 (%LLVM_Value, %Type*) {
;stmt0:
  %3 = bitcast [18 x %Nat8]* @func329_func330_str1 to %Str
  %4 = call %Int32 (%Str, ...) @printf (%Str %3)
;stmt1:
  %5 = extractvalue %LLVM_Value %0, 1
  call void (%Type*) @func81 (%Type* %5)
;stmt2:
  %6 = bitcast [6 x %Nat8]* @func329_func330_str2 to %Str
  %7 = call %Int32 (%Str, ...) @printf (%Str %6)
;stmt3:
  call void (%Type*) @func81 (%Type* %1)
;stmt4:
  %8 = bitcast [2 x %Nat8]* @func329_func330_str3 to %Str
  %9 = call %Int32 (%Str, ...) @printf (%Str %8)
;stmt5:
  %10 = bitcast [16 x %Nat8]* @func329_func330_str4 to %Str
  call void (%Str) @fatal (%Str %10)
;stmt6:
  %11 = insertvalue %LLVM_Value zeroinitializer, %LLVM_ValueKind 0, 0
  %12 = insertvalue %LLVM_Value %11, %Type* %1, 1
  ret %LLVM_Value %12
}

define %LLVM_Value @func329 (%ValueCast*) {
;stmt0:
  %2 = getelementptr inbounds %ValueCast, %ValueCast* %0, i1 0, i32 1
  %3 = load %Value*, %Value** %2
  %4 = call %LLVM_Value (%Value*) @func305 (%Value* %3)
;stmt1:
  %5 = getelementptr inbounds %ValueCast, %ValueCast* %0, i1 0, i32 0
  %6 = load %Type*, %Type** %5
;stmt2:
  %7 = extractvalue %LLVM_Value %4, 1
  %8 = getelementptr inbounds %Type, %Type* %7, i1 0, i32 0
  %9 = load %TypeKind, %TypeKind* %8
  %10 = icmp eq %TypeKind %9, 6
  br i1 %10, label %then_0, label %else_0
then_0:
;stmt3:
  %11 = bitcast [11 x %Nat8]* @func329_str1 to %Str
  %12 = call %Int32 (%Str, ...) @printf (%Str %11)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt4:
  %13 = extractvalue %LLVM_Value %4, 1
  %14 = getelementptr inbounds %Type, %Type* %13, i1 0, i32 0
  %15 = load %TypeKind, %TypeKind* %14
  %16 = icmp eq %TypeKind %15, 14
  br i1 %16, label %then_1, label %else_1
then_1:
;stmt5:
  %17 = extractvalue %LLVM_Value %4, 1
  %18 = getelementptr inbounds %Type, %Type* %17, i1 0, i32 13
  %19 = getelementptr inbounds %TypeUnion, %TypeUnion* %18, i1 0, i32 1
  %20 = load %Type*, %Type** %19; loadImmPtr
  %21 = inttoptr i64 0 to%Type*
  %22 = icmp eq %Type* %20, %21
  br i1 %22, label %then_2, label %else_2
then_2:
;stmt6:
  %23 = call %LLVM_Value (%LLVM_Value, %Type*) @eval_cast_union_to (%LLVM_Value %4, %Type* %6)
  ret %LLVM_Value %23
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt7:
  br label %select_1_0
select_1_0:
  %25 = call i1 (%Type*) @func390 (%Type* %6)
  %26 = icmp eq i1 1, %25
  br i1 %26, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %27 = call %LLVM_Value (%LLVM_Value, %Type*) @func318 (%LLVM_Value %4, %Type* %6)
  br label %select_1_end
select_1_1:
  %28 = getelementptr inbounds %Type, %Type* %6, i1 0, i32 0
  %29 = load %TypeKind, %TypeKind* %28
  %30 = icmp eq %TypeKind %29, 7
  %31 = icmp eq i1 1, %30
  br i1 %31, label %select_1_1_ok, label %select_1_2
select_1_1_ok:
  %32 = call %LLVM_Value (%LLVM_Value, %Type*) @func319 (%LLVM_Value %4, %Type* %6)
  br label %select_1_end
select_1_2:
  %33 = getelementptr inbounds %Type, %Type* %6, i1 0, i32 0
  %34 = load %TypeKind, %TypeKind* %33
  %35 = icmp eq %TypeKind %34, 5
  %36 = icmp eq i1 1, %35
  br i1 %36, label %select_1_2_ok, label %select_1_3
select_1_2_ok:
  %37 = call %LLVM_Value (%LLVM_Value, %Type*) @func323 (%LLVM_Value %4, %Type* %6)
  br label %select_1_end
select_1_3:
  %38 = getelementptr inbounds %Type, %Type* %6, i1 0, i32 0
  %39 = load %TypeKind, %TypeKind* %38
  %40 = icmp eq %TypeKind %39, 14
  %41 = icmp eq i1 1, %40
  br i1 %41, label %select_1_3_ok, label %select_1_4
select_1_3_ok:
  %42 = call %LLVM_Value (%LLVM_Value, %Type*) @eval_cast_to_union (%LLVM_Value %4, %Type* %6)
  br label %select_1_end
select_1_4:
  %43 = load %Type*, %Type** @typeUnit
  %44 = call i1 (%Type*, %Type*) @func426 (%Type* %6, %Type* %43)
  %45 = icmp eq i1 1, %44
  br i1 %45, label %select_1_4_ok, label %select_1_5
select_1_4_ok:
  %46 = insertvalue %LLVM_Value zeroinitializer, %LLVM_ValueKind 3, 0
  %47 = insertvalue %LLVM_Value %46, %Type* %6, 1
  br label %select_1_end
select_1_5:
  %48 = call %LLVM_Value (%LLVM_Value, %Type*) @func330 (%LLVM_Value %4, %Type* %6)
  br label %select_1_end
select_1_end:
  %49 = phi %LLVM_Value [ %27, %select_1_0_ok ], [ %32, %select_1_1_ok ], [ %37, %select_1_2_ok ], [ %42, %select_1_3_ok ], [ %47, %select_1_4_ok ], [ %48, %select_1_5 ]
  ret %LLVM_Value %49
}

define %Nat32 @func331 (%Str, %LLVM_Value, %LLVM_Value, %Type*) {
;stmt0:
  %5 = call %Nat32 (%Str, %Type*) @func299 (%Str %0, %Type* %3)
;stmt1:
  call void () @space ()
;stmt2:
  call void (%LLVM_Value) @func353 (%LLVM_Value %1)
;stmt3:
  call void () @comma ()
;stmt4:
  call void (%LLVM_Value) @func353 (%LLVM_Value %2)
;stmt5:
  ret %Nat32 %5
}

define %Str @func333 (i1) {
;stmt0:
  br i1 %0, label %then_0, label %else_0
then_0:
;stmt1:
  %2 = bitcast [5 x %Nat8]* @func332_func333_str1 to %Str
  ret %Str %2
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt2:
  %4 = bitcast [5 x %Nat8]* @func332_func333_str2 to %Str
  ret %Str %4
}

define %Str @func334 (i1) {
;stmt0:
  br i1 %0, label %then_0, label %else_0
then_0:
;stmt1:
  %2 = bitcast [5 x %Nat8]* @func332_func334_str1 to %Str
  ret %Str %2
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt2:
  %4 = bitcast [5 x %Nat8]* @func332_func334_str2 to %Str
  ret %Str %4
}

define %Str @func335 (i1) {
;stmt0:
  br i1 %0, label %then_0, label %else_0
then_0:
;stmt1:
  %2 = bitcast [9 x %Nat8]* @func332_func335_str1 to %Str
  ret %Str %2
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt2:
  %4 = bitcast [9 x %Nat8]* @func332_func335_str2 to %Str
  ret %Str %4
}

define %Str @func336 (i1) {
;stmt0:
  br i1 %0, label %then_0, label %else_0
then_0:
;stmt1:
  %2 = bitcast [9 x %Nat8]* @func332_func336_str1 to %Str
  ret %Str %2
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt2:
  %4 = bitcast [9 x %Nat8]* @func332_func336_str2 to %Str
  ret %Str %4
}

define %Str @func337 (i1) {
;stmt0:
  br i1 %0, label %then_0, label %else_0
then_0:
;stmt1:
  %2 = bitcast [9 x %Nat8]* @func332_func337_str1 to %Str
  ret %Str %2
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt2:
  %4 = bitcast [9 x %Nat8]* @func332_func337_str2 to %Str
  ret %Str %4
}

define %Str @func338 (i1) {
;stmt0:
  br i1 %0, label %then_0, label %else_0
then_0:
;stmt1:
  %2 = bitcast [9 x %Nat8]* @func332_func338_str1 to %Str
  ret %Str %2
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt2:
  %4 = bitcast [9 x %Nat8]* @func332_func338_str2 to %Str
  ret %Str %4
}

define %Str @func339 (i1) {
;stmt0:
  br i1 %0, label %then_0, label %else_0
then_0:
;stmt1:
  %2 = bitcast [5 x %Nat8]* @func332_func339_str1 to %Str
  ret %Str %2
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt2:
  %4 = bitcast [5 x %Nat8]* @func332_func339_str2 to %Str
  ret %Str %4
}

define %LLVM_Value @func332 (%ValueBin*) {
;stmt0:
  %2 = getelementptr inbounds %ValueBin, %ValueBin* %0, i1 0, i32 2
  %3 = load %Value*, %Value** %2
  %4 = call %LLVM_Value (%Value*) @func305 (%Value* %3)
;stmt1:
  %5 = getelementptr inbounds %ValueBin, %ValueBin* %0, i1 0, i32 3
  %6 = load %Value*, %Value** %5
  %7 = call %LLVM_Value (%Value*) @func305 (%Value* %6)
;stmt2:
  %8 = extractvalue %LLVM_Value %4, 1
  %9 = getelementptr inbounds %Type, %Type* %8, i1 0, i32 5
  %10 = getelementptr inbounds %TypeNumeric, %TypeNumeric* %9, i1 0, i32 1
  %11 = load i1, i1* %10
;stmt3:
  %12 = getelementptr inbounds %ValueBin, %ValueBin* %0, i1 0, i32 1
  %13 = load %ValueKind, %ValueKind* %12
  br label %select_1_0
select_1_0:
  %14 = icmp eq %ValueKind %13, 18
  br i1 %14, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %15 = bitcast [4 x %Nat8]* @func332_str1 to %Str
  br label %select_1_end
select_1_1:
  %16 = icmp eq %ValueKind %13, 19
  br i1 %16, label %select_1_1_ok, label %select_1_2
select_1_1_ok:
  %17 = bitcast [4 x %Nat8]* @func332_str2 to %Str
  br label %select_1_end
select_1_2:
  %18 = icmp eq %ValueKind %13, 20
  br i1 %18, label %select_1_2_ok, label %select_1_3
select_1_2_ok:
  %19 = bitcast [4 x %Nat8]* @func332_str3 to %Str
  br label %select_1_end
select_1_3:
  %20 = icmp eq %ValueKind %13, 21
  br i1 %20, label %select_1_3_ok, label %select_1_4
select_1_3_ok:
  %21 = call %Str (i1) @func333 (i1 %11)
  br label %select_1_end
select_1_4:
  %22 = icmp eq %ValueKind %13, 22
  br i1 %22, label %select_1_4_ok, label %select_1_5
select_1_4_ok:
  %23 = call %Str (i1) @func334 (i1 %11)
  br label %select_1_end
select_1_5:
  %24 = icmp eq %ValueKind %13, 23
  br i1 %24, label %select_1_5_ok, label %select_1_6
select_1_5_ok:
  %25 = bitcast [3 x %Nat8]* @func332_str4 to %Str
  br label %select_1_end
select_1_6:
  %26 = icmp eq %ValueKind %13, 24
  br i1 %26, label %select_1_6_ok, label %select_1_7
select_1_6_ok:
  %27 = bitcast [4 x %Nat8]* @func332_str5 to %Str
  br label %select_1_end
select_1_7:
  %28 = icmp eq %ValueKind %13, 25
  br i1 %28, label %select_1_7_ok, label %select_1_8
select_1_7_ok:
  %29 = bitcast [4 x %Nat8]* @func332_str6 to %Str
  br label %select_1_end
select_1_8:
  %30 = icmp eq %ValueKind %13, 26
  br i1 %30, label %select_1_8_ok, label %select_1_9
select_1_8_ok:
  %31 = bitcast [8 x %Nat8]* @func332_str7 to %Str
  br label %select_1_end
select_1_9:
  %32 = icmp eq %ValueKind %13, 27
  br i1 %32, label %select_1_9_ok, label %select_1_10
select_1_9_ok:
  %33 = bitcast [8 x %Nat8]* @func332_str8 to %Str
  br label %select_1_end
select_1_10:
  %34 = icmp eq %ValueKind %13, 28
  br i1 %34, label %select_1_10_ok, label %select_1_11
select_1_10_ok:
  %35 = call %Str (i1) @func335 (i1 %11)
  br label %select_1_end
select_1_11:
  %36 = icmp eq %ValueKind %13, 29
  br i1 %36, label %select_1_11_ok, label %select_1_12
select_1_11_ok:
  %37 = call %Str (i1) @func336 (i1 %11)
  br label %select_1_end
select_1_12:
  %38 = icmp eq %ValueKind %13, 30
  br i1 %38, label %select_1_12_ok, label %select_1_13
select_1_12_ok:
  %39 = call %Str (i1) @func337 (i1 %11)
  br label %select_1_end
select_1_13:
  %40 = icmp eq %ValueKind %13, 31
  br i1 %40, label %select_1_13_ok, label %select_1_14
select_1_13_ok:
  %41 = call %Str (i1) @func338 (i1 %11)
  br label %select_1_end
select_1_14:
  %42 = icmp eq %ValueKind %13, 33
  br i1 %42, label %select_1_14_ok, label %select_1_15
select_1_14_ok:
  %43 = bitcast [4 x %Nat8]* @func332_str9 to %Str
  br label %select_1_end
select_1_15:
  %44 = icmp eq %ValueKind %13, 34
  br i1 %44, label %select_1_15_ok, label %select_1_16
select_1_15_ok:
  %45 = call %Str (i1) @func339 (i1 %11)
  br label %select_1_end
select_1_16:
  %46 = bitcast [27 x %Nat8]* @func332_str10 to %Str
  br label %select_1_end
select_1_end:
  %47 = phi %Str [ %15, %select_1_0_ok ], [ %17, %select_1_1_ok ], [ %19, %select_1_2_ok ], [ %21, %select_1_3_ok ], [ %23, %select_1_4_ok ], [ %25, %select_1_5_ok ], [ %27, %select_1_6_ok ], [ %29, %select_1_7_ok ], [ %31, %select_1_8_ok ], [ %33, %select_1_9_ok ], [ %35, %select_1_10_ok ], [ %37, %select_1_11_ok ], [ %39, %select_1_12_ok ], [ %41, %select_1_13_ok ], [ %43, %select_1_14_ok ], [ %45, %select_1_15_ok ], [ %46, %select_1_16 ]
;stmt4:
  %48 = extractvalue %LLVM_Value %4, 1
  %49 = call %Nat32 (%Str, %LLVM_Value, %LLVM_Value, %Type*) @func331 (%Str %47, %LLVM_Value %4, %LLVM_Value %7, %Type* %48)
;stmt5:
  %50 = insertvalue %LLVM_Value zeroinitializer, %LLVM_ValueKind 9, 0
  %51 = getelementptr inbounds %ValueBin, %ValueBin* %0, i1 0, i32 0
  %52 = load %Type*, %Type** %51
  %53 = insertvalue %LLVM_Value %50, %Type* %52, 1
  %54 = insertvalue %LLVM_Value %53, %Nat32 %49, 4
  ret %LLVM_Value %54
}

define %LLVM_Value @func340 (%LLVM_Value, %Type*) {
;stmt0:
  %3 = bitcast [8 x %Nat8]* @func340_str1 to %Str
  %4 = extractvalue %LLVM_Value %0, 1
  %5 = call %LLVM_Value (%Str, %LLVM_Value, %Type*) @func317 (%Str %3, %LLVM_Value %0, %Type* %4)
  ret %LLVM_Value %5
}

define %LLVM_Value @loadImmPtr (%LLVM_Value) {
;stmt0:
  %2 = bitcast [13 x %Nat8]* @func341_str1 to %Str
  call void (%Str) @o (%Str %2)
;stmt1:
  %3 = call %Nat32 () @lab_get ()
;stmt2:
  %4 = load %FILE*, %FILE** @fout
  %5 = bitcast [29 x %Nat8]* @func341_str2 to %Str
  %6 = extractvalue %LLVM_Value %0, 2
  %7 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %4, %Str %5, %Nat32 %3, %Int64 %6)
;stmt3:
  %8 = extractvalue %LLVM_Value %0, 1
  call void (%Type*) @func372 (%Type* %8)
;stmt4:
  %9 = insertvalue %LLVM_Value zeroinitializer, %LLVM_ValueKind 9, 0
  %10 = extractvalue %LLVM_Value %0, 1
  %11 = insertvalue %LLVM_Value %9, %Type* %10, 1
  %12 = insertvalue %LLVM_Value %11, %Nat32 %3, 4
  ret %LLVM_Value %12
}

define %LLVM_Value @loadIfImmAs (%LLVM_Value, %Type*) {
;stmt0:
  %3 = extractvalue %LLVM_Value %0, 0
  br label %select_1_0
select_1_0:
  %4 = icmp eq %LLVM_ValueKind %3, 4
  br i1 %4, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %5 = bitcast [8 x %Nat8]* @func342_str1 to %Str
  %6 = call %LLVM_Value (%Str, %LLVM_Value, %Type*) @func317 (%Str %5, %LLVM_Value %0, %Type* %1)
  br label %select_1_end
select_1_1:
  br label %select_1_end
select_1_end:
  %7 = phi %LLVM_Value [ %6, %select_1_0_ok ], [ %0, %select_1_1 ]
  ret %LLVM_Value %7
}

define void @func344 (%Unit*, %Unit*, %Nat32, %Node*) {
;stmt0:
  %5 = bitcast %Unit* %0 to %ValueWhenVariant*
;stmt1:
  %6 = bitcast %Unit* %1 to %func343.type2*
;stmt2:
  %7 = load %FILE*, %FILE** @fout
  %8 = bitcast [15 x %Nat8]* @func343_func344_str1 to %Str
  %9 = getelementptr inbounds %func343.type2, %func343.type2* %6, i1 0, i32 1
  %10 = load %Nat32, %Nat32* %9
  %11 = getelementptr inbounds %func343.type2, %func343.type2* %6, i1 0, i32 2
  %12 = load %Nat32, %Nat32* %11
  %13 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %7, %Str %8, %Nat32 %10, %Nat32 %12)
;stmt3:
  %14 = getelementptr inbounds %ValueWhenVariant, %ValueWhenVariant* %5, i1 0, i32 1
  %15 = load %Value*, %Value** %14
  %16 = call %LLVM_Value (%Value*) @func305 (%Value* %15)
;stmt4:
  %17 = getelementptr inbounds %ValueWhenVariant, %ValueWhenVariant* %5, i1 0, i32 1
  %18 = load %Value*, %Value** %17
  %19 = getelementptr inbounds %Value, %Value* %18, i1 0, i32 0
  %20 = load %ValueKind, %ValueKind* %19
  %21 = icmp ne %ValueKind %20, 39
  br i1 %21, label %then_0, label %else_0
then_0:
;stmt5:
  %22 = bitcast [8 x %Nat8]* @func343_func344_str2 to %Str
  %23 = extractvalue %LLVM_Value %16, 1
  %24 = call %Nat32 (%Str, %Type*) @func299 (%Str %22, %Type* %23)
;stmt6:
  call void () @space ()
;stmt7:
  %25 = getelementptr inbounds %func343.type2, %func343.type2* %6, i1 0, i32 0
  %26 = load %LLVM_Value, %LLVM_Value* %25
  call void (%LLVM_Value) @func353 (%LLVM_Value %26)
;stmt8:
  call void () @comma ()
;stmt9:
  call void (%LLVM_Value) @func353 (%LLVM_Value %16)
;stmt10:
  %27 = load %FILE*, %FILE** @fout
  %28 = bitcast [14 x %Nat8]* @func343_func344_str3 to %Str
  %29 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %27, %Str %28, %Nat32 %24)
  br label %endif_0
else_0:
;stmt11:
  %30 = load %FILE*, %FILE** @fout
  %31 = bitcast [14 x %Nat8]* @func343_func344_str4 to %Str
  %32 = extractvalue %LLVM_Value %16, 4
  %33 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %30, %Str %31, %Nat32 %32)
  br label %endif_0
endif_0:
;stmt12:
  %34 = load %FILE*, %FILE** @fout
  %35 = bitcast [48 x %Nat8]* @func343_func344_str5 to %Str
  %36 = getelementptr inbounds %func343.type2, %func343.type2* %6, i1 0, i32 1
  %37 = load %Nat32, %Nat32* %36
  %38 = getelementptr inbounds %func343.type2, %func343.type2* %6, i1 0, i32 2
  %39 = load %Nat32, %Nat32* %38
  %40 = getelementptr inbounds %func343.type2, %func343.type2* %6, i1 0, i32 1
  %41 = load %Nat32, %Nat32* %40
  %42 = getelementptr inbounds %func343.type2, %func343.type2* %6, i1 0, i32 2
  %43 = load %Nat32, %Nat32* %42
  %44 = add %Nat32 %43, 1
  %45 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %34, %Str %35, %Nat32 %37, %Nat32 %39, %Nat32 %41, %Nat32 %44)
;stmt13:
  %46 = load %FILE*, %FILE** @fout
  %47 = bitcast [18 x %Nat8]* @func343_func344_str6 to %Str
  %48 = getelementptr inbounds %func343.type2, %func343.type2* %6, i1 0, i32 1
  %49 = load %Nat32, %Nat32* %48
  %50 = getelementptr inbounds %func343.type2, %func343.type2* %6, i1 0, i32 2
  %51 = load %Nat32, %Nat32* %50
  %52 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %46, %Str %47, %Nat32 %49, %Nat32 %51)
;stmt14:
  %53 = getelementptr inbounds %ValueWhenVariant, %ValueWhenVariant* %5, i1 0, i32 2
  %54 = load %Value*, %Value** %53
  %55 = call %LLVM_Value (%Value*) @func305 (%Value* %54)
;stmt15:
  %56 = getelementptr inbounds %func343.type2, %func343.type2* %6, i1 0, i32 4
  %57 = load %Type*, %Type** %56
  %58 = call %LLVM_Value (%LLVM_Value, %Type*) @loadIfImmAs (%LLVM_Value %55, %Type* %57)
;stmt16:
  %59 = load %FILE*, %FILE** @fout
  %60 = bitcast [28 x %Nat8]* @func343_func344_str7 to %Str
  %61 = getelementptr inbounds %func343.type2, %func343.type2* %6, i1 0, i32 1
  %62 = load %Nat32, %Nat32* %61
  %63 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %59, %Str %60, %Nat32 %62)
;stmt17:
  %64 = getelementptr inbounds %func343.type2, %func343.type2* %6, i1 0, i32 3
; index array
  %65 = getelementptr inbounds [256 x %Nat32], [256 x %Nat32]* %64, i1 0, %Nat32 %2
  %66 = extractvalue %LLVM_Value %58, 4
  store %Nat32 %66, %Nat32* %65, align 4
;stmt18:
  %67 = getelementptr inbounds %func343.type2, %func343.type2* %6, i1 0, i32 2
  %68 = getelementptr inbounds %func343.type2, %func343.type2* %6, i1 0, i32 2
  %69 = load %Nat32, %Nat32* %68
  %70 = add %Nat32 %69, 1
  store %Nat32 %70, %Nat32* %67, align 4
  ret void
}

define %LLVM_Value @func343 (%ValueWhen*) {
;stmt0:
  %2 = getelementptr inbounds %ValueWhen, %ValueWhen* %0, i1 0, i32 1
  %3 = load %Value*, %Value** %2
  %4 = call %LLVM_Value (%Value*) @func305 (%Value* %3)
;stmt1:
  %5 = load %Nat32, %Nat32* @select_no
  %6 = add %Nat32 %5, 1
  store %Nat32 %6, %Nat32* @select_no, align 4
;stmt2:
  %7 = load %Nat32, %Nat32* @select_no
;stmt3:
  %8 = getelementptr inbounds %ValueWhen, %ValueWhen* %0, i1 0, i32 2
  %9 = getelementptr inbounds %List, %List* %8, i1 0, i32 2
  %10 = load %Nat64, %Nat64* %9
;stmt4:
  %11 = getelementptr inbounds %ValueWhen, %ValueWhen* %0, i1 0, i32 0
  %12 = load %Type*, %Type** %11
;stmt5:
  %13 = alloca %func343.type2
  %14 = insertvalue %func343.type2 zeroinitializer, %LLVM_Value %4, 0
  %15 = insertvalue %func343.type2 %14, %Nat32 0, 2
  %16 = insertvalue %func343.type2 %15, %Nat32 %7, 1
  %17 = insertvalue %func343.type2 %16, %Type* %12, 4
  store %func343.type2 %17, %func343.type2* %13, align 8
;stmt6:
  %18 = load %FILE*, %FILE** @fout
  %19 = bitcast [26 x %Nat8]* @func343_str1 to %Str
  %20 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %18, %Str %19, %Nat32 %7)
;stmt7:
  %21 = getelementptr inbounds %ValueWhen, %ValueWhen* %0, i1 0, i32 2
  %22 = getelementptr inbounds %func343.type2, %func343.type2* %13, i1 0
  %23 = bitcast %func343.type2* %22 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @func64 (%List* %21, %ListForeachHandler @func344, %Unit* %23)
;stmt8:
  %24 = load %FILE*, %FILE** @fout
  %25 = bitcast [15 x %Nat8]* @func343_str2 to %Str
  %26 = getelementptr inbounds %func343.type2, %func343.type2* %13, i1 0, i32 2
  %27 = load %Nat32, %Nat32* %26
  %28 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %24, %Str %25, %Nat32 %7, %Nat32 %27)
;stmt9:
  %29 = getelementptr inbounds %ValueWhen, %ValueWhen* %0, i1 0, i32 3
  %30 = load %Value*, %Value** %29
  %31 = call %LLVM_Value (%Value*) @func305 (%Value* %30)
  %32 = getelementptr inbounds %func343.type2, %func343.type2* %13, i1 0, i32 4
  %33 = load %Type*, %Type** %32
  %34 = call %LLVM_Value (%LLVM_Value, %Type*) @loadIfImmAs (%LLVM_Value %31, %Type* %33)
;stmt10:
  %35 = load %FILE*, %FILE** @fout
  %36 = bitcast [28 x %Nat8]* @func343_str3 to %Str
  %37 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %35, %Str %36, %Nat32 %7)
;stmt11:
  %38 = load %FILE*, %FILE** @fout
  %39 = bitcast [16 x %Nat8]* @func343_str4 to %Str
  %40 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %38, %Str %39, %Nat32 %7)
;stmt12:
  %41 = load %Type*, %Type** @typeUnit
  %42 = call i1 (%Type*, %Type*) @func426 (%Type* %12, %Type* %41)
  %43 = xor i1 %42, 1
  br i1 %43, label %then_0, label %else_0
then_0:
;stmt13:
  %44 = bitcast [4 x %Nat8]* @func343_str5 to %Str
  %45 = call %Nat32 (%Str, %Type*) @func299 (%Str %44, %Type* %12)
;stmt14:
  call void () @space ()
;stmt15:
  %46 = alloca %Nat64
  store %Nat64 0, %Nat64* %46, align 8
;stmt16:
  br label %continue_0
continue_0:
  %47 = load %Nat64, %Nat64* %46
  %48 = icmp ult %Nat64 %47, %10
  br i1 %48, label %body_0, label %break_0
body_0:
;stmt17:
  %49 = load %FILE*, %FILE** @fout
  %50 = bitcast [30 x %Nat8]* @func343_str6 to %Str
  %51 = getelementptr inbounds %func343.type2, %func343.type2* %13, i1 0, i32 3
  %52 = load %Nat64, %Nat64* %46
; index array
  %53 = getelementptr inbounds [256 x %Nat32], [256 x %Nat32]* %51, i1 0, %Nat64 %52
  %54 = load %Nat32, %Nat32* %53
  %55 = load %Nat64, %Nat64* %46
  %56 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %49, %Str %50, %Nat32 %54, %Nat32 %7, %Nat64 %55)
;stmt18:
  %57 = load %Nat64, %Nat64* %46
  %58 = add %Nat64 %57, 1
  store %Nat64 %58, %Nat64* %46, align 8
  br label %continue_0
break_0:
;stmt19:
  %59 = load %FILE*, %FILE** @fout
  %60 = bitcast [25 x %Nat8]* @func343_str7 to %Str
  %61 = extractvalue %LLVM_Value %34, 4
  %62 = getelementptr inbounds %func343.type2, %func343.type2* %13, i1 0, i32 2
  %63 = load %Nat32, %Nat32* %62
  %64 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %59, %Str %60, %Nat32 %61, %Nat32 %7, %Nat32 %63)
;stmt20:
  %65 = insertvalue %LLVM_Value zeroinitializer, %LLVM_ValueKind 9, 0
  %66 = getelementptr inbounds %ValueWhen, %ValueWhen* %0, i1 0, i32 0
  %67 = load %Type*, %Type** %66
  %68 = insertvalue %LLVM_Value %65, %Type* %67, 1
  %69 = insertvalue %LLVM_Value %68, %Nat32 %45, 4
  ret %LLVM_Value %69
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt21:
  %71 = insertvalue %LLVM_Value zeroinitializer, %LLVM_ValueKind 0, 0
  %72 = getelementptr inbounds %ValueWhen, %ValueWhen* %0, i1 0, i32 0
  %73 = load %Type*, %Type** %72
  %74 = insertvalue %LLVM_Value %71, %Type* %73, 1
  ret %LLVM_Value %74
}

define void @func346 (%Unit*, %Unit*, %Unit*) {
;stmt0:
  %4 = bitcast %Unit* %0 to %Str
;stmt1:
  %5 = bitcast %Unit* %1 to %Value*
;stmt2:
  %6 = bitcast %Unit* %2 to %func345.type3*
;stmt3:
  %7 = call %LLVM_Value (%Value*) @func305 (%Value* %5)
;stmt4:
  %8 = getelementptr inbounds %func345.type3, %func345.type3* %6, i1 0, i32 0
  %9 = load %Type*, %Type** %8
  %10 = call %Decl* (%Type*, %Str) @func388 (%Type* %9, %Str %4)
;stmt5:
  %11 = getelementptr inbounds %Decl, %Decl* %10, i1 0, i32 3
  %12 = load %Nat16, %Nat16* %11
;stmt6:
  %13 = bitcast [12 x %Nat8]* @func345_func346_str1 to %Str
  %14 = getelementptr inbounds %func345.type3, %func345.type3* %6, i1 0, i32 0
  %15 = load %Type*, %Type** %14
  %16 = call %Nat32 (%Str, %Type*) @func299 (%Str %13, %Type* %15)
;stmt7:
  call void () @space ()
;stmt8:
  %17 = getelementptr inbounds %func345.type3, %func345.type3* %6, i1 0, i32 1
  %18 = load %LLVM_Value, %LLVM_Value* %17
  call void (%LLVM_Value) @func353 (%LLVM_Value %18)
;stmt9:
  call void () @comma ()
;stmt10:
  call void (%LLVM_Value) @func354 (%LLVM_Value %7)
;stmt11:
  call void () @comma ()
;stmt12:
  %19 = load %FILE*, %FILE** @fout
  %20 = bitcast [3 x %Nat8]* @func345_func346_str2 to %Str
  %21 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %19, %Str %20, %Nat16 %12)
;stmt13:
  %22 = getelementptr inbounds %func345.type3, %func345.type3* %6, i1 0, i32 1
  %23 = insertvalue %LLVM_Value zeroinitializer, %LLVM_ValueKind 9, 0
  %24 = getelementptr inbounds %func345.type3, %func345.type3* %6, i1 0, i32 0
  %25 = load %Type*, %Type** %24
  %26 = insertvalue %LLVM_Value %23, %Type* %25, 1
  %27 = insertvalue %LLVM_Value %26, %Nat32 %16, 4
  store %LLVM_Value %27, %LLVM_Value* %22, align 8
  ret void
}

define %LLVM_Value @func345 (%ValueRecord*) {
;stmt0:
  %2 = alloca %func345.type3
  %3 = getelementptr inbounds %ValueRecord, %ValueRecord* %0, i1 0, i32 0
  %4 = load %Type*, %Type** %3
  %5 = insertvalue %func345.type3 zeroinitializer, %Type* %4, 0
  %6 = insertvalue %LLVM_Value zeroinitializer, %LLVM_ValueKind 2, 0
  %7 = insertvalue %func345.type3 %5, %LLVM_Value %6, 1
  store %func345.type3 %7, %func345.type3* %2, align 8
;stmt1:
  %8 = getelementptr inbounds %ValueRecord, %ValueRecord* %0, i1 0, i32 1
  %9 = getelementptr inbounds %func345.type3, %func345.type3* %2, i1 0
  %10 = bitcast %func345.type3* %9 to %Unit*
  call void (%List*, %MapForeachHandler, %Unit*) @map_foreach (%List* %8, %MapForeachHandler @func346, %Unit* %10)
;stmt2:
  %11 = getelementptr inbounds %func345.type3, %func345.type3* %2, i1 0, i32 1
  %12 = load %LLVM_Value, %LLVM_Value* %11
  ret %LLVM_Value %12
}

define void @func348 (%Unit*, %Unit*, %Nat32, %Node*) {
;stmt0:
  %5 = bitcast %Unit* %0 to %Value*
;stmt1:
  %6 = bitcast %Unit* %1 to %func347.type4*
;stmt2:
  %7 = call %LLVM_Value (%Value*) @func305 (%Value* %5)
;stmt3:
  %8 = bitcast [12 x %Nat8]* @func347_func348_str1 to %Str
  %9 = getelementptr inbounds %func347.type4, %func347.type4* %6, i1 0, i32 0
  %10 = load %Type*, %Type** %9
  %11 = call %Nat32 (%Str, %Type*) @func299 (%Str %8, %Type* %10)
;stmt4:
  call void () @space ()
;stmt5:
  %12 = getelementptr inbounds %func347.type4, %func347.type4* %6, i1 0, i32 1
  %13 = load %LLVM_Value, %LLVM_Value* %12
  call void (%LLVM_Value) @func353 (%LLVM_Value %13)
;stmt6:
  call void () @comma ()
;stmt7:
  call void (%LLVM_Value) @func354 (%LLVM_Value %7)
;stmt8:
  call void () @comma ()
;stmt9:
  %14 = load %FILE*, %FILE** @fout
  %15 = bitcast [3 x %Nat8]* @func347_func348_str2 to %Str
  %16 = getelementptr inbounds %func347.type4, %func347.type4* %6, i1 0, i32 2
  %17 = load %Nat32, %Nat32* %16
  %18 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %14, %Str %15, %Nat32 %17)
;stmt10:
  %19 = getelementptr inbounds %func347.type4, %func347.type4* %6, i1 0, i32 1
  %20 = insertvalue %LLVM_Value zeroinitializer, %LLVM_ValueKind 9, 0
  %21 = getelementptr inbounds %func347.type4, %func347.type4* %6, i1 0, i32 0
  %22 = load %Type*, %Type** %21
  %23 = insertvalue %LLVM_Value %20, %Type* %22, 1
  %24 = insertvalue %LLVM_Value %23, %Nat32 %11, 4
  store %LLVM_Value %24, %LLVM_Value* %19, align 8
;stmt11:
  %25 = getelementptr inbounds %func347.type4, %func347.type4* %6, i1 0, i32 2
  %26 = getelementptr inbounds %func347.type4, %func347.type4* %6, i1 0, i32 2
  %27 = load %Nat32, %Nat32* %26
  %28 = add %Nat32 %27, 1
  store %Nat32 %28, %Nat32* %25, align 4
  ret void
}

define %LLVM_Value @func347 (%ValueArray*) {
;stmt0:
  %2 = alloca %func347.type4
  %3 = getelementptr inbounds %ValueArray, %ValueArray* %0, i1 0, i32 0
  %4 = load %Type*, %Type** %3
  %5 = insertvalue %func347.type4 zeroinitializer, %Type* %4, 0
  %6 = insertvalue %LLVM_Value zeroinitializer, %LLVM_ValueKind 2, 0
  %7 = insertvalue %func347.type4 %5, %LLVM_Value %6, 1
  %8 = insertvalue %func347.type4 %7, %Nat32 0, 2
  store %func347.type4 %8, %func347.type4* %2, align 8
;stmt1:
  %9 = getelementptr inbounds %ValueArray, %ValueArray* %0, i1 0, i32 1
  %10 = getelementptr inbounds %func347.type4, %func347.type4* %2, i1 0
  %11 = bitcast %func347.type4* %10 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @func64 (%List* %9, %ListForeachHandler @func348, %Unit* %11)
;stmt2:
  %12 = getelementptr inbounds %func347.type4, %func347.type4* %2, i1 0, i32 1
  %13 = load %LLVM_Value, %LLVM_Value* %12
  ret %LLVM_Value %13
}

define void @func349 (%Value*, %Value*) {
;stmt0:
  %3 = call %LLVM_Value (%Value*) @func302 (%Value* %0)
;stmt1:
  %4 = call %LLVM_Value (%Value*) @func305 (%Value* %1)
;stmt2:
  call void (%LLVM_Value, %LLVM_Value) @func350 (%LLVM_Value %3, %LLVM_Value %4)
  ret void
}

define void @func350 (%LLVM_Value, %LLVM_Value) {
;stmt0:
  %3 = extractvalue %LLVM_Value %1, 1
;stmt1:
  %4 = load %FILE*, %FILE** @fout
  %5 = bitcast [10 x %Nat8]* @func350_str1 to %Str
  %6 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %4, %Str %5)
;stmt2:
  call void (%Type*) @func372 (%Type* %3)
;stmt3:
  call void () @space ()
;stmt4:
  call void (%LLVM_Value) @func353 (%LLVM_Value %1)
;stmt5:
  call void () @comma ()
;stmt6:
  call void (%Type*) @func372 (%Type* %3)
;stmt7:
  %7 = bitcast [3 x %Nat8]* @func350_str2 to %Str
  call void (%Str) @o (%Str %7)
;stmt8:
  call void (%LLVM_Value) @func353 (%LLVM_Value %0)
;stmt9:
  %8 = load %FILE*, %FILE** @fout
  %9 = bitcast [11 x %Nat8]* @func350_str3 to %Str
  %10 = getelementptr inbounds %Type, %Type* %3, i1 0, i32 4
  %11 = load %Nat32, %Nat32* %10
  %12 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %8, %Str %9, %Nat32 %11)
  ret void
}

define %LLVM_Value @func351 (%LLVM_Value) {
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
  %5 = icmp eq %LLVM_ValueKind %2, 4
  br i1 %5, label %then_1, label %else_1
then_1:
;stmt4:
  %6 = extractvalue %LLVM_Value %0, 1
  %7 = call i1 (%Type*) @func390 (%Type* %6)
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
  %12 = icmp ne %LLVM_ValueKind %2, 6
  %13 = icmp ne %LLVM_ValueKind %2, 7
  %14 = icmp ne %LLVM_ValueKind %2, 8
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
  %19 = bitcast [5 x %Nat8]* @func351_str1 to %Str
  %20 = call %Nat32 (%Str, %Type*) @func299 (%Str %19, %Type* %18)
;stmt9:
  call void () @comma ()
;stmt10:
  call void (%Type*) @func372 (%Type* %18)
;stmt11:
  %21 = bitcast [3 x %Nat8]* @func351_str2 to %Str
  call void (%Str) @o (%Str %21)
;stmt12:
  call void (%LLVM_Value) @func353 (%LLVM_Value %0)
;stmt13:
  %22 = insertvalue %LLVM_Value zeroinitializer, %LLVM_ValueKind 9, 0
  %23 = insertvalue %LLVM_Value %22, %Type* %18, 1
  %24 = insertvalue %LLVM_Value %23, %Nat32 %20, 4
  ret %LLVM_Value %24
}

define %Int32 @print_val_imm (%LLVM_Value) {
;stmt0:
  %2 = extractvalue %LLVM_Value %0, 1
;stmt1:
  %3 = call i1 (%Type*) @func390 (%Type* %2)
  %4 = getelementptr inbounds %Type, %Type* %2, i1 0, i32 0
  %5 = load %TypeKind, %TypeKind* %4
  %6 = icmp eq %TypeKind %5, 10
  %7 = getelementptr inbounds %Type, %Type* %2, i1 0, i32 0
  %8 = load %TypeKind, %TypeKind* %7
  %9 = icmp eq %TypeKind %8, 12
  %10 = or i1 %6, %9
  %11 = or i1 %3, %10
;stmt2:
  %12 = getelementptr inbounds %Type, %Type* %2, i1 0, i32 0
  %13 = load %TypeKind, %TypeKind* %12
  %14 = icmp eq %TypeKind %13, 6
  br i1 %14, label %then_0, label %else_0
then_0:
;stmt3:
  %15 = getelementptr inbounds %Type, %Type* %2, i1 0, i32 12
  %16 = getelementptr inbounds %TypeVar, %TypeVar* %15, i1 0, i32 0
  %17 = load %Type*, %Type** %16
;stmt4:
  %18 = call i1 (%Type*) @func390 (%Type* %17)
  %19 = getelementptr inbounds %Type, %Type* %17, i1 0, i32 0
  %20 = load %TypeKind, %TypeKind* %19
  %21 = icmp eq %TypeKind %20, 10
  %22 = getelementptr inbounds %Type, %Type* %17, i1 0, i32 0
  %23 = load %TypeKind, %TypeKind* %22
  %24 = icmp eq %TypeKind %23, 12
  %25 = or i1 %21, %24
  %26 = or i1 %18, %25
  br i1 %26, label %then_1, label %else_1
then_1:
;stmt5:
  %27 = bitcast [16 x %Nat8]* @func352_str1 to %Str
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
  %32 = bitcast [16 x %Nat8]* @func352_str2 to %Str
  call void (%Str) @o (%Str %32)
  br label %endif_2
else_2:
;stmt9:
  %33 = load %FILE*, %FILE** @fout
  %34 = bitcast [5 x %Nat8]* @func352_str3 to %Str
  %35 = extractvalue %LLVM_Value %0, 2
  %36 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %33, %Str %34, %Int64 %35)
  br label %endif_2
endif_2:
;stmt10:
  ret %Int32 0
}

define void @func353 (%LLVM_Value) {
;stmt0:
  %2 = extractvalue %LLVM_Value %0, 0
  br label %select_1_0
select_1_0:
  %3 = icmp eq %LLVM_ValueKind %2, 4
  br i1 %3, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %4 = call %Int32 (%LLVM_Value) @print_val_imm (%LLVM_Value %0)
  br label %select_1_end
select_1_1:
  %5 = icmp eq %LLVM_ValueKind %2, 9
  br i1 %5, label %select_1_1_ok, label %select_1_2
select_1_1_ok:
  %6 = load %FILE*, %FILE** @fout
  %7 = bitcast [5 x %Nat8]* @func353_str1 to %Str
  %8 = extractvalue %LLVM_Value %0, 4
  %9 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %6, %Str %7, %Nat32 %8)
  br label %select_1_end
select_1_2:
  %10 = icmp eq %LLVM_ValueKind %2, 8
  br i1 %10, label %select_1_2_ok, label %select_1_3
select_1_2_ok:
  %11 = load %FILE*, %FILE** @fout
  %12 = bitcast [5 x %Nat8]* @func353_str2 to %Str
  %13 = extractvalue %LLVM_Value %0, 4
  %14 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %11, %Str %12, %Nat32 %13)
  br label %select_1_end
select_1_3:
  %15 = icmp eq %LLVM_ValueKind %2, 7
  br i1 %15, label %select_1_3_ok, label %select_1_4
select_1_3_ok:
  %16 = load %FILE*, %FILE** @fout
  %17 = bitcast [4 x %Nat8]* @func353_str3 to %Str
  %18 = extractvalue %LLVM_Value %0, 3
  %19 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %16, %Str %17, %Str %18)
  br label %select_1_end
select_1_4:
  %20 = icmp eq %LLVM_ValueKind %2, 5
  br i1 %20, label %select_1_4_ok, label %select_1_5
select_1_4_ok:
  %21 = load %FILE*, %FILE** @fout
  %22 = bitcast [4 x %Nat8]* @func353_str4 to %Str
  %23 = extractvalue %LLVM_Value %0, 3
  %24 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %21, %Str %22, %Str %23)
  br label %select_1_end
select_1_5:
  %25 = icmp eq %LLVM_ValueKind %2, 6
  br i1 %25, label %select_1_5_ok, label %select_1_6
select_1_5_ok:
  %26 = load %FILE*, %FILE** @fout
  %27 = bitcast [5 x %Nat8]* @func353_str5 to %Str
  %28 = extractvalue %LLVM_Value %0, 4
  %29 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %26, %Str %27, %Nat32 %28)
  br label %select_1_end
select_1_6:
  %30 = icmp eq %LLVM_ValueKind %2, 2
  br i1 %30, label %select_1_6_ok, label %select_1_7
select_1_6_ok:
  %31 = load %FILE*, %FILE** @fout
  %32 = bitcast [16 x %Nat8]* @func353_str6 to %Str
  %33 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %31, %Str %32)
  br label %select_1_end
select_1_7:
  %34 = icmp eq %LLVM_ValueKind %2, 1
  br i1 %34, label %select_1_7_ok, label %select_1_8
select_1_7_ok:
  %35 = load %FILE*, %FILE** @fout
  %36 = bitcast [6 x %Nat8]* @func353_str7 to %Str
  %37 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %35, %Str %36)
  br label %select_1_end
select_1_8:
  %38 = load %FILE*, %FILE** @fout
  %39 = bitcast [32 x %Nat8]* @func353_str8 to %Str
  %40 = extractvalue %LLVM_Value %0, 0
  %41 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %38, %Str %39, %LLVM_ValueKind %40)
  br label %select_1_end
select_1_end:
  %42 = phi %Int32 [ %4, %select_1_0_ok ], [ %9, %select_1_1_ok ], [ %14, %select_1_2_ok ], [ %19, %select_1_3_ok ], [ %24, %select_1_4_ok ], [ %29, %select_1_5_ok ], [ %33, %select_1_6_ok ], [ %37, %select_1_7_ok ], [ %41, %select_1_8 ]
  ret void
}

define void @func354 (%LLVM_Value) {
;stmt0:
  %2 = extractvalue %LLVM_Value %0, 1
  call void (%Type*) @func372 (%Type* %2)
;stmt1:
  call void () @space ()
;stmt2:
  call void (%LLVM_Value) @func353 (%LLVM_Value %0)
  ret void
}

define %LLVM_Value @func355 (%LLVM_Value) {
;stmt0:
  %2 = bitcast [12 x %Nat8]* @func355_str1 to %Str
  %3 = extractvalue %LLVM_Value %0, 1
  %4 = call %Nat32 (%Str, %Type*) @func299 (%Str %2, %Type* %3)
;stmt1:
  %5 = bitcast [9 x %Nat8]* @func355_str2 to %Str
  call void (%Str) @o (%Str %5)
;stmt2:
  %6 = insertvalue %LLVM_Value zeroinitializer, %LLVM_ValueKind 9, 0
  %7 = extractvalue %LLVM_Value %0, 1
  %8 = insertvalue %LLVM_Value %6, %Type* %7, 1
  %9 = insertvalue %LLVM_Value %8, %Nat32 %4, 4
  ret %LLVM_Value %9
}

define void @func356 (%Stmt*) {
;stmt0:
  %2 = getelementptr inbounds %Stmt, %Stmt* %0, i1 0, i32 0
  %3 = load %StmtKind, %StmtKind* %2
;stmt1:
  %4 = icmp ne %StmtKind %3, 2
  br i1 %4, label %then_0, label %else_0
then_0:
;stmt2:
  %5 = load %FILE*, %FILE** @fout
  %6 = bitcast [10 x %Nat8]* @func356_str1 to %Str
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
  %12 = getelementptr inbounds %Stmt, %Stmt* %0, i1 0, i32 3
  call void (%StmtBlock*) @func367 (%StmtBlock* %12)
  br label %select_1_end
select_1_1:
  %13 = icmp eq %StmtKind %3, 1
  br i1 %13, label %select_1_1_ok, label %select_1_2
select_1_1_ok:
  %14 = getelementptr inbounds %Stmt, %Stmt* %0, i1 0, i32 1
  call void (%StmtExpr*) @func359 (%StmtExpr* %14)
  br label %select_1_end
select_1_2:
  %15 = icmp eq %StmtKind %3, 4
  br i1 %15, label %select_1_2_ok, label %select_1_3
select_1_2_ok:
  %16 = getelementptr inbounds %Stmt, %Stmt* %0, i1 0, i32 2
  call void (%StmtAssign*) @func357 (%StmtAssign* %16)
  br label %select_1_end
select_1_3:
  %17 = icmp eq %StmtKind %3, 3
  br i1 %17, label %select_1_3_ok, label %select_1_4
select_1_3_ok:
  %18 = getelementptr inbounds %Stmt, %Stmt* %0, i1 0, i32 4
  %19 = load %Decl*, %Decl** %18
  call void (%Decl*) @func358 (%Decl* %19)
  br label %select_1_end
select_1_4:
  %20 = icmp eq %StmtKind %3, 5
  br i1 %20, label %select_1_4_ok, label %select_1_5
select_1_4_ok:
  %21 = getelementptr inbounds %Stmt, %Stmt* %0, i1 0, i32 5
  call void (%StmtIf*) @func360 (%StmtIf* %21)
  br label %select_1_end
select_1_5:
  %22 = icmp eq %StmtKind %3, 6
  br i1 %22, label %select_1_5_ok, label %select_1_6
select_1_5_ok:
  %23 = getelementptr inbounds %Stmt, %Stmt* %0, i1 0, i32 6
  call void (%StmtWhile*) @func361 (%StmtWhile* %23)
  br label %select_1_end
select_1_6:
  %24 = icmp eq %StmtKind %3, 7
  br i1 %24, label %select_1_6_ok, label %select_1_7
select_1_6_ok:
  %25 = getelementptr inbounds %Stmt, %Stmt* %0, i1 0, i32 7
  call void (%StmtReturn*) @func362 (%StmtReturn* %25)
  br label %select_1_end
select_1_7:
  %26 = icmp eq %StmtKind %3, 8
  br i1 %26, label %select_1_7_ok, label %select_1_8
select_1_7_ok:
  call void () @func363 ()
  br label %select_1_end
select_1_8:
  %27 = icmp eq %StmtKind %3, 9
  br i1 %27, label %select_1_8_ok, label %select_1_9
select_1_8_ok:
  call void () @func364 ()
  br label %select_1_end
select_1_9:
  %28 = icmp eq %StmtKind %3, 10
  br i1 %28, label %select_1_9_ok, label %select_1_10
select_1_9_ok:
  %29 = getelementptr inbounds %Stmt, %Stmt* %0, i1 0, i32 12
  %30 = load %Str, %Str* %29
  call void (%Str) @func365 (%Str %30)
  br label %select_1_end
select_1_10:
  %31 = icmp eq %StmtKind %3, 11
  br i1 %31, label %select_1_10_ok, label %select_1_11
select_1_10_ok:
  %32 = getelementptr inbounds %Stmt, %Stmt* %0, i1 0, i32 12
  %33 = load %Str, %Str* %32
  call void (%Str) @func366 (%Str %33)
  br label %select_1_end
select_1_11:
  %34 = load %FILE*, %FILE** @fout
  %35 = bitcast [22 x %Nat8]* @func356_str2 to %Str
  %36 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %34, %Str %35)
  br label %select_1_end
select_1_end:
  ret void
}

define void @func357 (%StmtAssign*) {
;stmt0:
  %2 = getelementptr inbounds %StmtAssign, %StmtAssign* %0, i1 0, i32 0
  %3 = load %Value*, %Value** %2
  %4 = getelementptr inbounds %StmtAssign, %StmtAssign* %0, i1 0, i32 1
  %5 = load %Value*, %Value** %4
  call void (%Value*, %Value*) @func349 (%Value* %3, %Value* %5)
  ret void
}

define void @func358 (%Decl*) {
;stmt0:
  %2 = bitcast [7 x %Nat8]* @func358_str1 to %Str
  %3 = getelementptr inbounds %Decl, %Decl* %0, i1 0, i32 1
  %4 = load %Type*, %Type** %3
  %5 = call %Nat32 (%Str, %Type*) @func299 (%Str %2, %Type* %4)
;stmt1:
  %6 = getelementptr inbounds %Decl, %Decl* %0, i1 0, i32 4
  store %Nat32 %5, %Nat32* %6, align 4
;stmt2:
  %7 = getelementptr inbounds %Decl, %Decl* %0, i1 0, i32 5
  %8 = load %Value*, %Value** %7
;stmt3:; loadImmPtr
  %9 = inttoptr i64 0 to%Value*
  %10 = icmp ne %Value* %8, %9
  br i1 %10, label %then_0, label %else_0
then_0:
;stmt4:
  %11 = call %LLVM_Value (%Value*) @func305 (%Value* %8)
;stmt5:
  %12 = insertvalue %LLVM_Value zeroinitializer, %LLVM_ValueKind 6, 0
  %13 = getelementptr inbounds %Decl, %Decl* %0, i1 0, i32 1
  %14 = load %Type*, %Type** %13
  %15 = insertvalue %LLVM_Value %12, %Type* %14, 1
  %16 = insertvalue %LLVM_Value %15, %Nat32 %5, 4
  call void (%LLVM_Value, %LLVM_Value) @func350 (%LLVM_Value %16, %LLVM_Value %11)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  ret void
}

define void @func359 (%StmtExpr*) {
;stmt0:
  %2 = getelementptr inbounds %StmtExpr, %StmtExpr* %0, i1 0, i32 0
  %3 = load %Value*, %Value** %2
  %4 = call %LLVM_Value (%Value*) @func305 (%Value* %3)
;stmt1:
  %5 = getelementptr inbounds %StmtExpr, %StmtExpr* %0, i1 0, i32 1
  %6 = extractvalue %LLVM_Value %4, 4
  store %Nat32 %6, %Nat32* %5, align 4
  ret void
}

define void @func360 (%StmtIf*) {
;stmt0:
  %2 = load %Nat32, %Nat32* @global_if_id
;stmt1:
  %3 = load %Nat32, %Nat32* @global_if_id
  %4 = add %Nat32 %3, 1
  store %Nat32 %4, %Nat32* @global_if_id, align 4
;stmt2:
  %5 = getelementptr inbounds %StmtIf, %StmtIf* %0, i1 0, i32 0
  %6 = load %Value*, %Value** %5
  %7 = call %LLVM_Value (%Value*) @func305 (%Value* %6)
;stmt3:
  %8 = load %FILE*, %FILE** @fout
  %9 = bitcast [10 x %Nat8]* @func360_str1 to %Str
  %10 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %8, %Str %9)
;stmt4:
  call void (%LLVM_Value) @func353 (%LLVM_Value %7)
;stmt5:
  %11 = load %FILE*, %FILE** @fout
  %12 = bitcast [35 x %Nat8]* @func360_str2 to %Str
  %13 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %11, %Str %12, %Nat32 %2, %Nat32 %2)
;stmt6:
  %14 = load %FILE*, %FILE** @fout
  %15 = bitcast [10 x %Nat8]* @func360_str3 to %Str
  %16 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %14, %Str %15, %Nat32 %2)
;stmt7:
  %17 = getelementptr inbounds %StmtIf, %StmtIf* %0, i1 0, i32 1
  %18 = load %Stmt*, %Stmt** %17
  call void (%Stmt*) @func356 (%Stmt* %18)
;stmt8:
  %19 = load %FILE*, %FILE** @fout
  %20 = bitcast [23 x %Nat8]* @func360_str4 to %Str
  %21 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %19, %Str %20, %Nat32 %2)
;stmt9:
  %22 = load %FILE*, %FILE** @fout
  %23 = bitcast [10 x %Nat8]* @func360_str5 to %Str
  %24 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %22, %Str %23, %Nat32 %2)
;stmt10:
  %25 = getelementptr inbounds %StmtIf, %StmtIf* %0, i1 0, i32 2
  %26 = load %union.4, %union.4* %25
  %27 = bitcast %Int64 0 to %Int64
  %28 = ptrtoint %union.4 %26 to %Int64
  %29 = icmp eq %Int64 %28, %27
  %30 = xor i1 %29, 1
  br i1 %30, label %then_0, label %else_0
then_0:
;stmt11:
  %31 = getelementptr inbounds %StmtIf, %StmtIf* %0, i1 0, i32 2
  %32 = load %union.4, %union.4* %31
  %33 = bitcast %union.4 %32 to %Stmt*
  call void (%Stmt*) @func356 (%Stmt* %33)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt12:
  %34 = load %FILE*, %FILE** @fout
  %35 = bitcast [23 x %Nat8]* @func360_str6 to %Str
  %36 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %34, %Str %35, %Nat32 %2)
;stmt13:
  %37 = load %FILE*, %FILE** @fout
  %38 = bitcast [11 x %Nat8]* @func360_str7 to %Str
  %39 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %37, %Str %38, %Nat32 %2)
  ret void
}

define void @func361 (%StmtWhile*) {
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
  %7 = bitcast [26 x %Nat8]* @func361_str1 to %Str
  %8 = load %Nat32, %Nat32* @while_id
  %9 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %6, %Str %7, %Nat32 %8)
;stmt4:
  %10 = load %FILE*, %FILE** @fout
  %11 = bitcast [14 x %Nat8]* @func361_str2 to %Str
  %12 = load %Nat32, %Nat32* @while_id
  %13 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %10, %Str %11, %Nat32 %12)
;stmt5:
  %14 = getelementptr inbounds %StmtWhile, %StmtWhile* %0, i1 0, i32 0
  %15 = load %Value*, %Value** %14
  %16 = call %LLVM_Value (%Value*) @func305 (%Value* %15)
;stmt6:
  %17 = load %FILE*, %FILE** @fout
  %18 = bitcast [10 x %Nat8]* @func361_str3 to %Str
  %19 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %17, %Str %18)
;stmt7:
  call void (%LLVM_Value) @func353 (%LLVM_Value %16)
;stmt8:
  %20 = load %FILE*, %FILE** @fout
  %21 = bitcast [36 x %Nat8]* @func361_str4 to %Str
  %22 = load %Nat32, %Nat32* @while_id
  %23 = load %Nat32, %Nat32* @while_id
  %24 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %20, %Str %21, %Nat32 %22, %Nat32 %23)
;stmt9:
  %25 = load %FILE*, %FILE** @fout
  %26 = bitcast [10 x %Nat8]* @func361_str5 to %Str
  %27 = load %Nat32, %Nat32* @while_id
  %28 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %25, %Str %26, %Nat32 %27)
;stmt10:
  %29 = getelementptr inbounds %StmtWhile, %StmtWhile* %0, i1 0, i32 1
  %30 = load %Stmt*, %Stmt** %29
  call void (%Stmt*) @func356 (%Stmt* %30)
;stmt11:
  %31 = load %FILE*, %FILE** @fout
  %32 = bitcast [26 x %Nat8]* @func361_str6 to %Str
  %33 = load %Nat32, %Nat32* @while_id
  %34 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %31, %Str %32, %Nat32 %33)
;stmt12:
  %35 = load %FILE*, %FILE** @fout
  %36 = bitcast [11 x %Nat8]* @func361_str7 to %Str
  %37 = load %Nat32, %Nat32* @while_id
  %38 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %35, %Str %36, %Nat32 %37)
;stmt13:
  store %Nat32 %2, %Nat32* @while_id, align 4
  ret void
}

define void @func362 (%StmtReturn*) {
;stmt0:
  %2 = getelementptr inbounds %StmtReturn, %StmtReturn* %0, i1 0, i32 0
  %3 = load %union.5, %union.5* %2
;stmt1:
  %4 = bitcast %Int64 0 to %Int64
  %5 = ptrtoint %union.5 %3 to %Int64
  %6 = icmp eq %Int64 %5, %4
  br i1 %6, label %then_0, label %else_0
then_0:
;stmt2:
  %7 = call %Nat32 () @lab_get ()
;stmt3:
  %8 = bitcast [10 x %Nat8]* @func362_str1 to %Str
  call void (%Str) @o (%Str %8)
;stmt4:
ret void
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt5:
  %10 = bitcast %union.5 %3 to %Value*
  %11 = call %LLVM_Value (%Value*) @func305 (%Value* %10)
;stmt6:
  %12 = load %FILE*, %FILE** @fout
  %13 = bitcast [8 x %Nat8]* @func362_str2 to %Str
  %14 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %12, %Str %13)
;stmt7:
  call void (%LLVM_Value) @func354 (%LLVM_Value %11)
;stmt8:
  %15 = call %Nat32 () @lab_get ()
  ret void
}

define void @func363 () {
;stmt0:
  %1 = call %Nat32 () @lab_get ()
;stmt1:
  %2 = load %FILE*, %FILE** @fout
  %3 = bitcast [23 x %Nat8]* @func363_str1 to %Str
  %4 = load %Nat32, %Nat32* @while_id
  %5 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %2, %Str %3, %Nat32 %4)
  ret void
}

define void @func364 () {
;stmt0:
  %1 = call %Nat32 () @lab_get ()
;stmt1:
  %2 = load %FILE*, %FILE** @fout
  %3 = bitcast [26 x %Nat8]* @func364_str1 to %Str
  %4 = load %Nat32, %Nat32* @while_id
  %5 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %2, %Str %3, %Nat32 %4)
  ret void
}

define void @func365 (%Str) {
;stmt0:
  %2 = call %Nat32 () @lab_get ()
;stmt1:
  %3 = load %FILE*, %FILE** @fout
  %4 = bitcast [17 x %Nat8]* @func365_str1 to %Str
  %5 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %3, %Str %4, %Str %0)
  ret void
}

define void @func366 (%Str) {
;stmt0:
  %2 = load %FILE*, %FILE** @fout
  %3 = bitcast [17 x %Nat8]* @func366_str1 to %Str
  %4 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %2, %Str %3, %Str %0)
;stmt1:
  %5 = load %FILE*, %FILE** @fout
  %6 = bitcast [5 x %Nat8]* @func366_str2 to %Str
  %7 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %5, %Str %6, %Str %0)
  ret void
}

define void @func368 (%Unit*, %Unit*, %Nat32, %Node*) {
;stmt0:
  %5 = load %Nat32, %Nat32* @blockno
  %6 = add %Nat32 %5, 1
  store %Nat32 %6, %Nat32* @blockno, align 4
;stmt1:
  %7 = bitcast %Unit* %0 to %Stmt*
  call void (%Stmt*) @func356 (%Stmt* %7)
  ret void
}

define void @func367 (%StmtBlock*) {
;stmt0:
  %2 = getelementptr inbounds %StmtBlock, %StmtBlock* %0, i1 0, i32 2; loadImmPtr
  %3 = inttoptr i64 0 to%Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @func64 (%List* %2, %ListForeachHandler @func368, %Unit* %3)
  ret void
}

define void @func370 (%Type*) {
;stmt0:
  %2 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 12
  %3 = getelementptr inbounds %TypeVar, %TypeVar* %2, i1 0, i32 0
  %4 = load %Type*, %Type** %3
  call void (%Type*) @func372 (%Type* %4)
  ret void
}

define void @func371 (%Type*) {
;stmt0:
  %2 = bitcast [20 x %Nat8]* @func369_func371_str1 to %Str
  call void (%Str) @o (%Str %2)
;stmt1:
  %3 = bitcast [18 x %Nat8]* @func369_func371_str2 to %Str
  %4 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 0
  %5 = load %TypeKind, %TypeKind* %4
  %6 = call %Int32 (%Str, ...) @printf (%Str %3, %TypeKind %5)
  ret void
}

define void @func369 (%Type*, i1, i1) {
;stmt0:; loadImmPtr
  %4 = inttoptr i64 0 to%Type*
  %5 = icmp ne %Type* %0, %4
  %6 = bitcast [26 x %Nat8]* @func369_str1 to %Str
  call void (i1, %Str) @assert (i1 %5, %Str %6)
;stmt1:
  %7 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 2
  %8 = load %Str, %Str* %7; loadImmPtr
  %9 = inttoptr i64 0 to%Str
  %10 = icmp ne %Str %8, %9
  %11 = and i1 %1, %10
  br i1 %11, label %then_0, label %else_0
then_0:
;stmt2:
  %12 = load %FILE*, %FILE** @fout
  %13 = bitcast [5 x %Nat8]* @func369_str2 to %Str
  %14 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 2
  %15 = load %Str, %Str* %14
  %16 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %12, %Str %13, %Str %15)
;stmt3:
ret void
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt4:
  %18 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 0
  %19 = load %TypeKind, %TypeKind* %18
  br label %select_1_0
select_1_0:
  %20 = icmp eq %TypeKind %19, 5
  br i1 %20, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %21 = load %FILE*, %FILE** @fout
  %22 = bitcast [5 x %Nat8]* @func369_str3 to %Str
  %23 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 2
  %24 = load %Str, %Str* %23
  %25 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %21, %Str %22, %Str %24)
  br label %select_1_end
select_1_1:
  %26 = icmp eq %TypeKind %19, 6
  br i1 %26, label %select_1_1_ok, label %select_1_2
select_1_1_ok:
  call void (%Type*) @func370 (%Type* %0)
  br label %select_1_end
select_1_2:
  %27 = icmp eq %TypeKind %19, 9
  br i1 %27, label %select_1_2_ok, label %select_1_3
select_1_2_ok:
  %28 = load %FILE*, %FILE** @fout
  %29 = bitcast [4 x %Nat8]* @func369_str4 to %Str
  %30 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %28, %Str %29, %Int64 16)
  br label %select_1_end
select_1_3:
  %31 = icmp eq %TypeKind %19, 10
  br i1 %31, label %select_1_3_ok, label %select_1_4
select_1_3_ok:
  %32 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 10
  call void (%TypeRecord*) @func373 (%TypeRecord* %32)
  br label %select_1_end
select_1_4:
  %33 = icmp eq %TypeKind %19, 12
  br i1 %33, label %select_1_4_ok, label %select_1_5
select_1_4_ok:
  %34 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 8
  call void (%TypeArray*) @func375 (%TypeArray* %34)
  br label %select_1_end
select_1_5:
  %35 = icmp eq %TypeKind %19, 13
  br i1 %35, label %select_1_5_ok, label %select_1_6
select_1_5_ok:
  %36 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 9
  call void (%TypeArrayU*) @func376 (%TypeArrayU* %36)
  br label %select_1_end
select_1_6:
  %37 = icmp eq %TypeKind %19, 11
  br i1 %37, label %select_1_6_ok, label %select_1_7
select_1_6_ok:
  %38 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 7
  call void (%TypePointer*) @func377 (%TypePointer* %38)
  br label %select_1_end
select_1_7:
  %39 = icmp eq %TypeKind %19, 8
  br i1 %39, label %select_1_7_ok, label %select_1_8
select_1_7_ok:
  %40 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 6
  call void (%TypeFunc*, i1) @func378 (%TypeFunc* %40, i1 %2)
  br label %select_1_end
select_1_8:
  %41 = icmp eq %TypeKind %19, 7
  br i1 %41, label %select_1_8_ok, label %select_1_9
select_1_8_ok:
  %42 = bitcast [3 x %Nat8]* @func369_str5 to %Str
  call void (%Str) @o (%Str %42)
  br label %select_1_end
select_1_9:
  %43 = icmp eq %TypeKind %19, 14
  br i1 %43, label %select_1_9_ok, label %select_1_10
select_1_9_ok:
  %44 = load %FILE*, %FILE** @fout
  %45 = bitcast [5 x %Nat8]* @func369_str6 to %Str
  %46 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 2
  %47 = load %Str, %Str* %46
  %48 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %44, %Str %45, %Str %47)
  br label %select_1_end
select_1_10:
  call void (%Type*) @func371 (%Type* %0)
  br label %select_1_end
select_1_end:
  ret void
}

define void @func372 (%Type*) {
;stmt0:
  call void (%Type*, i1, i1) @func369 (%Type* %0, i1 1, i1 1)
  ret void
}

define void @func374 (%Unit*, %Unit*, %Nat32, %Node*) {
;stmt0:
  %5 = icmp ugt %Nat32 %2, 0
  br i1 %5, label %then_0, label %else_0
then_0:
;stmt1:
  call void () @comma ()
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt2:
  %6 = bitcast %Unit* %0 to %Decl*
;stmt3:
  %7 = getelementptr inbounds %Decl, %Decl* %6, i1 0, i32 1
  %8 = load %Type*, %Type** %7
  call void (%Type*) @func372 (%Type* %8)
  ret void
}

define void @func373 (%TypeRecord*) {
;stmt0:
  %2 = bitcast [2 x %Nat8]* @func373_str1 to %Str
  call void (%Str) @o (%Str %2)
;stmt1:
  %3 = getelementptr inbounds %TypeRecord, %TypeRecord* %0, i1 0, i32 0
  %4 = load %List*, %List** %3; loadImmPtr
  %5 = inttoptr i64 0 to%Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @func64 (%List* %4, %ListForeachHandler @func374, %Unit* %5)
;stmt2:
  %6 = bitcast [2 x %Nat8]* @func373_str2 to %Str
  call void (%Str) @o (%Str %6)
  ret void
}

define void @func375 (%TypeArray*) {
;stmt0:
  %2 = load %FILE*, %FILE** @fout
  %3 = bitcast [7 x %Nat8]* @func375_str1 to %Str
  %4 = getelementptr inbounds %TypeArray, %TypeArray* %0, i1 0, i32 1
  %5 = load %Nat32, %Nat32* %4
  %6 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %2, %Str %3, %Nat32 %5)
;stmt1:
  %7 = getelementptr inbounds %TypeArray, %TypeArray* %0, i1 0, i32 0
  %8 = load %Type*, %Type** %7
  call void (%Type*) @func372 (%Type* %8)
;stmt2:
  %9 = bitcast [2 x %Nat8]* @func375_str2 to %Str
  call void (%Str) @o (%Str %9)
  ret void
}

define void @func376 (%TypeArrayU*) {
;stmt0:
  %2 = getelementptr inbounds %TypeArrayU, %TypeArrayU* %0, i1 0, i32 0
  %3 = load %Type*, %Type** %2
  call void (%Type*) @func372 (%Type* %3)
;stmt1:
  %4 = bitcast [2 x %Nat8]* @func376_str1 to %Str
  call void (%Str) @o (%Str %4)
  ret void
}

define void @func377 (%TypePointer*) {
;stmt0:
  %2 = getelementptr inbounds %TypePointer, %TypePointer* %0, i1 0, i32 0
  %3 = load %Type*, %Type** %2
  call void (%Type*) @func372 (%Type* %3)
;stmt1:
  %4 = bitcast [2 x %Nat8]* @func377_str1 to %Str
  call void (%Str) @o (%Str %4)
  ret void
}

define void @func379 (%Unit*, %Unit*, %Nat32, %Node*) {
;stmt0:
  %5 = icmp ugt %Nat32 %2, 0
  br i1 %5, label %then_0, label %else_0
then_0:
;stmt1:
  call void () @comma ()
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt2:
  %6 = bitcast %Unit* %0 to %Decl*
  %7 = getelementptr inbounds %Decl, %Decl* %6, i1 0, i32 1
  %8 = load %Type*, %Type** %7
  call void (%Type*) @func372 (%Type* %8)
  ret void
}

define void @func378 (%TypeFunc*, i1) {
;stmt0:
  %3 = getelementptr inbounds %TypeFunc, %TypeFunc* %0, i1 0, i32 1
  %4 = load %Type*, %Type** %3
  %5 = load %Type*, %Type** @typeUnit
  %6 = call i1 (%Type*, %Type*) @func426 (%Type* %4, %Type* %5)
  br i1 %6, label %then_0, label %else_0
then_0:
;stmt1:
  %7 = bitcast [5 x %Nat8]* @func378_str1 to %Str
  call void (%Str) @o (%Str %7)
  br label %endif_0
else_0:
;stmt2:
  %8 = getelementptr inbounds %TypeFunc, %TypeFunc* %0, i1 0, i32 1
  %9 = load %Type*, %Type** %8
  call void (%Type*) @func372 (%Type* %9)
  br label %endif_0
endif_0:
;stmt3:
  %10 = getelementptr inbounds %TypeFunc, %TypeFunc* %0, i1 0, i32 0
  %11 = load %Type*, %Type** %10
  %12 = getelementptr inbounds %Type, %Type* %11, i1 0, i32 10
  %13 = getelementptr inbounds %TypeRecord, %TypeRecord* %12, i1 0, i32 0
  %14 = load %List*, %List** %13
;stmt4:
  %15 = bitcast [3 x %Nat8]* @func378_str2 to %Str
  call void (%Str) @o (%Str %15)
;stmt5:; loadImmPtr
  %16 = inttoptr i64 0 to%Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @func64 (%List* %14, %ListForeachHandler @func379, %Unit* %16)
;stmt6:
  %17 = getelementptr inbounds %TypeFunc, %TypeFunc* %0, i1 0, i32 2
  %18 = load i1, i1* %17
  br i1 %18, label %then_1, label %else_1
then_1:
;stmt7:
  %19 = bitcast [6 x %Nat8]* @func378_str3 to %Str
  call void (%Str) @o (%Str %19)
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt8:
  %20 = bitcast [2 x %Nat8]* @func378_str4 to %Str
  call void (%Str) @o (%Str %20)
;stmt9:
  br i1 %1, label %then_2, label %else_2
then_2:
;stmt10:
  %21 = bitcast [2 x %Nat8]* @func378_str5 to %Str
  call void (%Str) @o (%Str %21)
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
  ret void
}

define %Type* @func380 (%TypeKind, %Nat32, %TokenInfo*) {
;stmt0:
  %4 = call %Unit* (%Nat32) @malloc (%Nat32 176)
  %5 = bitcast %Unit* %4 to %Type*
;stmt1:; loadImmPtr
  %6 = inttoptr i64 0 to%Type*
  %7 = icmp ne %Type* %5, %6
  %8 = bitcast [9 x %Nat8]* @func380_str1 to %Str
  call void (i1, %Str) @assert (i1 %7, %Str %8)
;stmt2:
  %9 = insertvalue %Type zeroinitializer, %TypeKind %0, 0
  %10 = insertvalue %Type %9, %Nat32 %1, 3
  %11 = insertvalue %Type %10, %Nat32 %1, 4
  %12 = insertvalue %Type %11, %TokenInfo* %2, 14
  store %Type %12, %Type* %5, align 8
;stmt3:
  ret %Type* %5
}

define %Type* @type_var_new (%Type*, %TokenInfo*) {
;stmt0:
  %3 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 3
  %4 = load %Nat32, %Nat32* %3
  %5 = call %Type* (%TypeKind, %Nat32, %TokenInfo*) @func380 (%TypeKind 6, %Nat32 %4, %TokenInfo* %1)
;stmt1:
  %6 = getelementptr inbounds %Type, %Type* %5, i1 0, i32 4
  %7 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 4
  %8 = load %Nat32, %Nat32* %7
  store %Nat32 %8, %Nat32* %6, align 4
;stmt2:
  %9 = getelementptr inbounds %Type, %Type* %5, i1 0, i32 12
  %10 = insertvalue %TypeVar zeroinitializer, %Type* %0, 0
  store %TypeVar %10, %TypeVar* %9, align 8
;stmt3:
  ret %Type* %5
}

define %Type* @func382 (%Type*, %TokenInfo*) {
;stmt0:
  %3 = call %Type* (%TypeKind, %Nat32, %TokenInfo*) @func380 (%TypeKind 11, %Nat32 8, %TokenInfo* %1)
;stmt1:
  %4 = getelementptr inbounds %Type, %Type* %3, i1 0, i32 7
  %5 = insertvalue %TypePointer zeroinitializer, %Type* %0, 0
  store %TypePointer %5, %TypePointer* %4, align 8
;stmt2:
  ret %Type* %3
}

define %Type* @func383 (%Type*, %TokenInfo*) {
;stmt0:
  %3 = call %Type* (%TypeKind, %Nat32, %TokenInfo*) @func380 (%TypeKind 13, %Nat32 8, %TokenInfo* %1)
;stmt1:
  %4 = getelementptr inbounds %Type, %Type* %3, i1 0, i32 9
  %5 = insertvalue %TypeArrayU zeroinitializer, %Type* %0, 0
  store %TypeArrayU %5, %TypeArrayU* %4, align 8
;stmt2:
  ret %Type* %3
}

define %Type* @func384 (%Type*, %Nat32, %TokenInfo*) {
;stmt0:
  %4 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 3
  %5 = load %Nat32, %Nat32* %4
  %6 = mul %Nat32 %1, %5
;stmt1:
  %7 = call %Type* (%TypeKind, %Nat32, %TokenInfo*) @func380 (%TypeKind 12, %Nat32 %6, %TokenInfo* %2)
;stmt2:
  %8 = getelementptr inbounds %Type, %Type* %7, i1 0, i32 4
  %9 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 4
  %10 = load %Nat32, %Nat32* %9
  store %Nat32 %10, %Nat32* %8, align 4
;stmt3:
  %11 = getelementptr inbounds %Type, %Type* %7, i1 0, i32 8
  %12 = insertvalue %TypeArray zeroinitializer, %Type* %0, 0
  %13 = insertvalue %TypeArray %12, %Nat32 %1, 1
  store %TypeArray %13, %TypeArray* %11, align 8
;stmt4:
  ret %Type* %7
}

define void @func386 (%Unit*, %Unit*, %Nat32, %Node*) {
;stmt0:
  %5 = bitcast %Unit* %0 to %EnumConstructor*
;stmt1:
  %6 = bitcast %Unit* %1 to %Type*
;stmt2:
  %7 = getelementptr inbounds %EnumConstructor, %EnumConstructor* %5, i1 0, i32 1
  %8 = load %Nat32, %Nat32* %7
  %9 = sext %Nat32 %8 to %Int64
  %10 = getelementptr inbounds %EnumConstructor, %EnumConstructor* %5, i1 0, i32 2
  %11 = load %TokenInfo*, %TokenInfo** %10
  %12 = call %Value* (%Type*, %Int64, %TokenInfo*) @func439 (%Type* %6, %Int64 %9, %TokenInfo* %11)
;stmt3:
  %13 = load %Module*, %Module** @module
  %14 = getelementptr inbounds %Module, %Module* %13, i1 0, i32 0
  %15 = getelementptr inbounds %EnumConstructor, %EnumConstructor* %5, i1 0, i32 0
  %16 = load %AstId*, %AstId** %15
  %17 = getelementptr inbounds %AstId, %AstId* %16, i1 0, i32 0
  %18 = load %Str, %Str* %17
  call void (%Index*, %Str, %Value*) @func141 (%Index* %14, %Str %18, %Value* %12)
  ret void
}

define %Type* @func385 (%List*, %TokenInfo*) {
;stmt0:
  %3 = call %Type* (%TypeKind, %Nat32, %TokenInfo*) @func380 (%TypeKind 9, %Nat32 2, %TokenInfo* %1)
;stmt1:
  %4 = bitcast %Type* %3 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @func64 (%List* %0, %ListForeachHandler @func386, %Unit* %4)
;stmt2:
  ret %Type* %3
}

define %Type* @func387 (%Type*, %Type*, i1, %TokenInfo*) {
;stmt0:
  %5 = call %Type* (%TypeKind, %Nat32, %TokenInfo*) @func380 (%TypeKind 8, %Nat32 8, %TokenInfo* %3)
;stmt1:
  %6 = getelementptr inbounds %Type, %Type* %5, i1 0, i32 6
  %7 = insertvalue %TypeFunc zeroinitializer, %Type* %0, 0
  %8 = insertvalue %TypeFunc %7, %Type* %1, 1
  %9 = insertvalue %TypeFunc %8, i1 %2, 2
  store %TypeFunc %9, %TypeFunc* %6, align 8
;stmt2:
  ret %Type* %5
}

define i1 @func389 (%Unit*, %Unit*, %Nat32) {
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

define %Decl* @func388 (%Type*, %Str) {
;stmt0:
  %3 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 10
  %4 = getelementptr inbounds %TypeRecord, %TypeRecord* %3, i1 0, i32 0
  %5 = load %List*, %List** %4
  %6 = bitcast %Str %1 to %Unit*
  %7 = call %Unit* (%List*, %ListSearchHandler, %Unit*) @list_search (%List* %5, %ListSearchHandler @func389, %Unit* %6)
  %8 = bitcast %Unit* %7 to %Decl*
  ret %Decl* %8
}

define i1 @func390 (%Type*) {
;stmt0:
  %2 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 0
  %3 = load %TypeKind, %TypeKind* %2
;stmt1:
  %4 = icmp eq %TypeKind %3, 3
  %5 = icmp eq %TypeKind %3, 11
  %6 = icmp eq %TypeKind %3, 8
  %7 = call i1 (%Type*) @func393 (%Type* %0)
  %8 = or i1 %6, %7
  %9 = or i1 %5, %8
  %10 = or i1 %4, %9
  ret i1 %10
}

define i1 @func391 (%Type*) {
;stmt0:
  %2 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 0
  %3 = load %TypeKind, %TypeKind* %2
  %4 = icmp eq %TypeKind %3, 12
  ret i1 %4
}

define i1 @func392 (%Type*) {
;stmt0:
  %2 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 0
  %3 = load %TypeKind, %TypeKind* %2
  %4 = icmp ne %TypeKind %3, 11
  br i1 %4, label %then_0, label %else_0
then_0:
;stmt1:
  ret i1 0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt2:
  %6 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 7
  %7 = getelementptr inbounds %TypePointer, %TypePointer* %6, i1 0, i32 0
  %8 = load %Type*, %Type** %7
  %9 = call i1 (%Type*) @func391 (%Type* %8)
  ret i1 %9
}

define i1 @func393 (%Type*) {
;stmt0:
  %2 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 0
  %3 = load %TypeKind, %TypeKind* %2
  %4 = icmp eq %TypeKind %3, 13
  ret i1 %4
}

define i1 @type_is_generic_num (%Type*) {
;stmt0:
  %2 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 0
  %3 = load %TypeKind, %TypeKind* %2
  %4 = icmp ne %TypeKind %3, 5
  br i1 %4, label %then_0, label %else_0
then_0:
;stmt1:
  ret i1 0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt2:
  %6 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 5
  %7 = getelementptr inbounds %TypeNumeric, %TypeNumeric* %6, i1 0, i32 0
  %8 = load %Nat32, %Nat32* %7
  %9 = icmp eq %Nat32 %8, 0
  ret i1 %9
}

define i1 @func395 (%Type*) {
;stmt0:
  %2 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 0
  %3 = load %TypeKind, %TypeKind* %2
  %4 = icmp ne %TypeKind %3, 5
  br i1 %4, label %then_0, label %else_0
then_0:
;stmt1:
  ret i1 0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt2:
  %6 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 5
  %7 = getelementptr inbounds %TypeNumeric, %TypeNumeric* %6, i1 0, i32 0
  %8 = load %Nat32, %Nat32* %7
  %9 = icmp ugt %Nat32 %8, 0
  ret i1 %9
}

define i1 @func396 (%Type*) {
;stmt0:
  %2 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 0
  %3 = load %TypeKind, %TypeKind* %2
  %4 = icmp eq %TypeKind %3, 10
  ret i1 %4
}

define i1 @func397 (%Type*) {
;stmt0:
  %2 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 0
  %3 = load %TypeKind, %TypeKind* %2
  %4 = icmp ne %TypeKind %3, 11
  br i1 %4, label %then_0, label %else_0
then_0:
;stmt1:
  ret i1 0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt2:
  %6 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 7
  %7 = getelementptr inbounds %TypePointer, %TypePointer* %6, i1 0, i32 0
  %8 = load %Type*, %Type** %7
  %9 = call i1 (%Type*) @func396 (%Type* %8)
  ret i1 %9
}

define i1 @typeIsPointerToUnit (%Type*) {
;stmt0:
  %2 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 0
  %3 = load %TypeKind, %TypeKind* %2
  %4 = icmp ne %TypeKind %3, 11
  br i1 %4, label %then_0, label %else_0
then_0:
;stmt1:
  ret i1 0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt2:
  %6 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 7
  %7 = getelementptr inbounds %TypePointer, %TypePointer* %6, i1 0, i32 0
  %8 = load %Type*, %Type** %7
  %9 = load %Type*, %Type** @typeUnit
  %10 = call i1 (%Type*, %Type*) @func426 (%Type* %8, %Type* %9)
  ret i1 %10
}

define i1 @func399 (%Type*) {
;stmt0:
  %2 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 0
  %3 = load %TypeKind, %TypeKind* %2
  %4 = icmp ne %TypeKind %3, 14
  br i1 %4, label %then_0, label %else_0
then_0:
;stmt1:
  ret i1 0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt2:
  %6 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 13
  %7 = getelementptr inbounds %TypeUnion, %TypeUnion* %6, i1 0, i32 0
  %8 = getelementptr inbounds %List, %List* %7, i1 0, i32 2
  %9 = load %Nat64, %Nat64* %8
  %10 = icmp ne %Nat64 %9, 2
  br i1 %10, label %then_1, label %else_1
then_1:
;stmt3:
  ret i1 0
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt4:
  %12 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 13
  %13 = getelementptr inbounds %TypeUnion, %TypeUnion* %12, i1 0, i32 0
  %14 = call %Unit* (%List*, %Nat32) @list_get (%List* %13, %Nat32 0)
  %15 = bitcast %Unit* %14 to %Type*
;stmt5:
  %16 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 13
  %17 = getelementptr inbounds %TypeUnion, %TypeUnion* %16, i1 0, i32 0
  %18 = call %Unit* (%List*, %Nat32) @list_get (%List* %17, %Nat32 1)
  %19 = bitcast %Unit* %18 to %Type*
;stmt6:
  %20 = getelementptr inbounds %Type, %Type* %15, i1 0, i32 0
  %21 = load %TypeKind, %TypeKind* %20
  %22 = icmp eq %TypeKind %21, 11
  %23 = load %Type*, %Type** @typeUnit
  %24 = call i1 (%Type*, %Type*) @func426 (%Type* %19, %Type* %23)
  %25 = and i1 %22, %24
  %26 = getelementptr inbounds %Type, %Type* %19, i1 0, i32 0
  %27 = load %TypeKind, %TypeKind* %26
  %28 = icmp eq %TypeKind %27, 11
  %29 = load %Type*, %Type** @typeUnit
  %30 = call i1 (%Type*, %Type*) @func426 (%Type* %15, %Type* %29)
  %31 = and i1 %28, %30
  %32 = or i1 %25, %31
  ret i1 %32
}

define %Type* @func400 (%AstType*) {
;stmt0:
  %2 = getelementptr inbounds %AstType, %AstType* %0, i1 0, i32 0
  %3 = load %AstTypeKind, %AstTypeKind* %2
  br label %select_1_0
select_1_0:
  %4 = icmp eq %AstTypeKind %3, 1
  br i1 %4, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %5 = call %Type* (%AstType*) @func403 (%AstType* %0)
  br label %select_1_end
select_1_1:
  %6 = icmp eq %AstTypeKind %3, 7
  br i1 %6, label %select_1_1_ok, label %select_1_2
select_1_1_ok:
  %7 = call %Type* (%AstType*) @func404 (%AstType* %0)
  br label %select_1_end
select_1_2:
  %8 = icmp eq %AstTypeKind %3, 9
  br i1 %8, label %select_1_2_ok, label %select_1_3
select_1_2_ok:
  %9 = call %Type* (%AstType*) @func402 (%AstType* %0)
  br label %select_1_end
select_1_3:
  %10 = icmp eq %AstTypeKind %3, 10
  br i1 %10, label %select_1_3_ok, label %select_1_4
select_1_3_ok:
  %11 = call %Type* (%AstType*) @func401 (%AstType* %0)
  br label %select_1_end
select_1_4:
  %12 = icmp eq %AstTypeKind %3, 5
  br i1 %12, label %select_1_4_ok, label %select_1_5
select_1_4_ok:
  %13 = call %Type* (%AstType*) @func406 (%AstType* %0)
  br label %select_1_end
select_1_5:
  %14 = icmp eq %AstTypeKind %3, 6
  br i1 %14, label %select_1_5_ok, label %select_1_6
select_1_5_ok:
  %15 = call %Type* (%AstType*) @func405 (%AstType* %0)
  br label %select_1_end
select_1_6:
  %16 = icmp eq %AstTypeKind %3, 8
  br i1 %16, label %select_1_6_ok, label %select_1_7
select_1_6_ok:
  %17 = call %Type* (%AstType*) @func407 (%AstType* %0)
  br label %select_1_end
select_1_7:
  %18 = icmp eq %AstTypeKind %3, 2
  br i1 %18, label %select_1_7_ok, label %select_1_8
select_1_7_ok:
  %19 = call %Type* (%AstType*) @func414 (%AstType* %0)
  br label %select_1_end
select_1_8:
  %20 = icmp eq %AstTypeKind %3, 3
  br i1 %20, label %select_1_8_ok, label %select_1_9
select_1_8_ok:
  %21 = call %Type* (%AstType*) @func410 (%AstType* %0)
  br label %select_1_end
select_1_9:
  %22 = icmp eq %AstTypeKind %3, 11
  br i1 %22, label %select_1_9_ok, label %select_1_10
select_1_9_ok:
  %23 = call %Type* (%AstType*) @func417 (%AstType* %0)
  br label %select_1_end
select_1_10:
  %24 = getelementptr inbounds %AstType, %AstType* %0, i1 0, i32 11
  %25 = load %TokenInfo*, %TokenInfo** %24
  %26 = call %Type* (%TypeKind, %Nat32, %TokenInfo*) @func380 (%TypeKind 2, %Nat32 0, %TokenInfo* %25)
  br label %select_1_end
select_1_end:
  %27 = phi %Type* [ %5, %select_1_0_ok ], [ %7, %select_1_1_ok ], [ %9, %select_1_2_ok ], [ %11, %select_1_3_ok ], [ %13, %select_1_4_ok ], [ %15, %select_1_5_ok ], [ %17, %select_1_6_ok ], [ %19, %select_1_7_ok ], [ %21, %select_1_8_ok ], [ %23, %select_1_9_ok ], [ %26, %select_1_10 ]
  ret %Type* %27
}

define %Type* @func401 (%AstType*) {
;stmt0:
  %2 = getelementptr inbounds %AstType, %AstType* %0, i1 0, i32 10
  %3 = getelementptr inbounds %AstTypeSpecial, %AstTypeSpecial* %2, i1 0, i32 0
  %4 = load %AstType*, %AstType** %3
  %5 = call %Type* (%AstType*) @func400 (%AstType* %4)
;stmt1:
  %6 = getelementptr inbounds %Type, %Type* %5, i1 0, i32 1
  %7 = load %Nat32, %Nat32* @spec_type_uid
  store %Nat32 %7, %Nat32* %6, align 4
;stmt2:
  %8 = load %Nat32, %Nat32* @spec_type_uid
  %9 = add %Nat32 %8, 1
  store %Nat32 %9, %Nat32* @spec_type_uid, align 4
;stmt3:
  ret %Type* %5
}

define %Type* @func402 (%AstType*) {
;stmt0:
  %2 = getelementptr inbounds %AstType, %AstType* %0, i1 0, i32 8
  %3 = getelementptr inbounds %AstTypeVar, %AstTypeVar* %2, i1 0, i32 0
  %4 = load %AstType*, %AstType** %3
  %5 = call %Type* (%AstType*) @func400 (%AstType* %4)
;stmt1:
  %6 = getelementptr inbounds %AstType, %AstType* %0, i1 0, i32 11
  %7 = load %TokenInfo*, %TokenInfo** %6
  %8 = call %Type* (%Type*, %TokenInfo*) @type_var_new (%Type* %5, %TokenInfo* %7)
  ret %Type* %8
}

define %Type* @func403 (%AstType*) {
;stmt0:
  %2 = getelementptr inbounds %AstType, %AstType* %0, i1 0, i32 1
  %3 = getelementptr inbounds %AstName, %AstName* %2, i1 0, i32 0
  %4 = load %AstId*, %AstId** %3
  %5 = getelementptr inbounds %AstId, %AstId* %4, i1 0, i32 0
  %6 = load %Str, %Str* %5
;stmt1:
  %7 = call %Type* (%Str) @func147 (%Str %6)
;stmt2:; loadImmPtr
  %8 = inttoptr i64 0 to%Type*
  %9 = icmp eq %Type* %7, %8
  br i1 %9, label %then_0, label %else_0
then_0:
;stmt3:
  %10 = getelementptr inbounds %AstType, %AstType* %0, i1 0, i32 11
  %11 = load %TokenInfo*, %TokenInfo** %10
  %12 = call %Type* (%TypeKind, %Nat32, %TokenInfo*) @func380 (%TypeKind 1, %Nat32 0, %TokenInfo* %11)
;stmt4:
  %13 = getelementptr inbounds %Type, %Type* %12, i1 0, i32 14
  %14 = getelementptr inbounds %AstType, %AstType* %0, i1 0, i32 1
  %15 = getelementptr inbounds %AstName, %AstName* %14, i1 0, i32 2
  %16 = load %TokenInfo*, %TokenInfo** %15
  store %TokenInfo* %16, %TokenInfo** %13, align 8
;stmt5:
  %17 = load %Module*, %Module** @module
  %18 = getelementptr inbounds %Module, %Module* %17, i1 0, i32 1
  call void (%Index*, %Str, %Type*) @func145 (%Index* %18, %Str %6, %Type* %12)
;stmt6:
  ret %Type* %12
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt7:
  ret %Type* %7
}

define %Type* @func404 (%AstType*) {
;stmt0:
  %2 = getelementptr inbounds %AstType, %AstType* %0, i1 0, i32 7
  %3 = getelementptr inbounds %AstTypeFunc, %AstTypeFunc* %2, i1 0, i32 0
  %4 = load %AstType*, %AstType** %3
  %5 = call %Type* (%AstType*) @func400 (%AstType* %4)
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
  %13 = call %Type* (%AstType*) @func400 (%AstType* %12)
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
  %18 = getelementptr inbounds %AstType, %AstType* %0, i1 0, i32 11
  %19 = load %TokenInfo*, %TokenInfo** %18
  %20 = call %Type* (%Type*, %Type*, i1, %TokenInfo*) @func387 (%Type* %5, %Type* %13, i1 0, %TokenInfo* %19)
  ret %Type* %20
}

define %Type* @func405 (%AstType*) {
;stmt0:
  %2 = getelementptr inbounds %AstType, %AstType* %0, i1 0, i32 4
  %3 = getelementptr inbounds %AstTypeArrayU, %AstTypeArrayU* %2, i1 0, i32 0
  %4 = load %AstType*, %AstType** %3
  %5 = call %Type* (%AstType*) @func400 (%AstType* %4)
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
  %10 = getelementptr inbounds %AstType, %AstType* %0, i1 0, i32 11
  %11 = load %TokenInfo*, %TokenInfo** %10
  %12 = call %Type* (%Type*, %TokenInfo*) @func383 (%Type* %5, %TokenInfo* %11)
  ret %Type* %12
}

define %Type* @func406 (%AstType*) {
;stmt0:
  %2 = getelementptr inbounds %AstType, %AstType* %0, i1 0, i32 3
  %3 = getelementptr inbounds %AstTypeArray, %AstTypeArray* %2, i1 0, i32 0
  %4 = load %AstType*, %AstType** %3
  %5 = call %Type* (%AstType*) @func400 (%AstType* %4)
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
  %13 = call %Value* (%AstValue*, i1) @func443 (%AstValue* %12, i1 0)
;stmt4:
  %14 = getelementptr inbounds %Value, %Value* %13, i1 0, i32 0
  %15 = load %ValueKind, %ValueKind* %14
  %16 = icmp eq %ValueKind %15, 1
  br i1 %16, label %then_1, label %else_1
then_1:
;stmt5:
  %17 = getelementptr inbounds %AstType, %AstType* %0, i1 0, i32 11
  %18 = load %TokenInfo*, %TokenInfo** %17
  %19 = call %Type* (%TypeKind, %Nat32, %TokenInfo*) @func380 (%TypeKind 2, %Nat32 0, %TokenInfo* %18)
  ret %Type* %19
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt6:
  %21 = getelementptr inbounds %Value, %Value* %13, i1 0, i32 2
  %22 = getelementptr inbounds %ValueImm, %ValueImm* %21, i1 0, i32 1
  %23 = load %Int64, %Int64* %22
  %24 = trunc %Int64 %23 to %Nat32
  %25 = getelementptr inbounds %AstType, %AstType* %0, i1 0, i32 11
  %26 = load %TokenInfo*, %TokenInfo** %25
  %27 = call %Type* (%Type*, %Nat32, %TokenInfo*) @func384 (%Type* %5, %Nat32 %24, %TokenInfo* %26)
  ret %Type* %27
}

define %Type* @func407 (%AstType*) {
;stmt0:
  %2 = getelementptr inbounds %AstType, %AstType* %0, i1 0, i32 5
  %3 = getelementptr inbounds %AstTypePointer, %AstTypePointer* %2, i1 0, i32 0
  %4 = load %AstType*, %AstType** %3
  %5 = call %Type* (%AstType*) @func400 (%AstType* %4)
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
  %10 = getelementptr inbounds %AstType, %AstType* %0, i1 0, i32 11
  %11 = load %TokenInfo*, %TokenInfo** %10
  %12 = call %Type* (%Type*, %TokenInfo*) @func382 (%Type* %5, %TokenInfo* %11)
  ret %Type* %12
}

define %Nat32 @align (%Nat32, %Nat32) {
;stmt0:
  %3 = icmp ne %Nat32 %1, 0
  %4 = bitcast [20 x %Nat8]* @func408_str1 to %Str
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

define %Decl* @func409 (%AstId*, %Type*, %TokenInfo*) {
;stmt0:
  %4 = call %Unit* (%Nat32) @malloc (%Nat32 48)
  %5 = bitcast %Unit* %4 to %Decl*
;stmt1:; loadImmPtr
  %6 = inttoptr i64 0 to%Decl*
  %7 = icmp ne %Decl* %5, %6
  %8 = bitcast [22 x %Nat8]* @func409_str1 to %Str
  call void (i1, %Str) @assert (i1 %7, %Str %8)
;stmt2:
  %9 = insertvalue %Decl zeroinitializer, %AstId* %0, 0
  %10 = insertvalue %Decl %9, %Type* %1, 1
  %11 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 4
  %12 = load %Nat32, %Nat32* %11
  %13 = insertvalue %Decl %10, %Nat32 %12, 2
  %14 = insertvalue %Decl %13, %TokenInfo* %2, 6
  store %Decl %14, %Decl* %5, align 8
;stmt3:
  ret %Decl* %5
}

define void @func412 (%Unit*, %Unit*, %Nat32, %Node*) {
;stmt0:
  %5 = bitcast %Unit* %0 to %AstId*
;stmt1:
  %6 = bitcast %Unit* %1 to %func410_func411.type6*
;stmt2:
  %7 = getelementptr inbounds %func410_func411.type6, %func410_func411.type6* %6, i1 0, i32 1
  %8 = load %Type*, %Type** %7
  %9 = getelementptr inbounds %AstId, %AstId* %5, i1 0, i32 1
  %10 = load %TokenInfo*, %TokenInfo** %9
  %11 = call %Decl* (%AstId*, %Type*, %TokenInfo*) @func409 (%AstId* %5, %Type* %8, %TokenInfo* %10)
;stmt3:
  %12 = getelementptr inbounds %func410_func411.type6, %func410_func411.type6* %6, i1 0, i32 0
  %13 = load %List*, %List** %12
  %14 = bitcast %Decl* %11 to %Unit*
  %15 = call i1 (%List*, %Unit*) @list_append (%List* %13, %Unit* %14)
  ret void
}

define void @func411 (%Unit*, %Unit*, %Nat32, %Node*) {
;stmt0:
  %5 = bitcast %Unit* %0 to %AstDecl*
;stmt1:
  %6 = bitcast %Unit* %1 to %func410.type5*
;stmt2:
  %7 = getelementptr inbounds %AstDecl, %AstDecl* %5, i1 0, i32 1
  %8 = load %AstType*, %AstType** %7
  %9 = call %Type* (%AstType*) @func400 (%AstType* %8)
;stmt3:
  %10 = getelementptr inbounds %Type, %Type* %9, i1 0, i32 0
  %11 = load %TypeKind, %TypeKind* %10
  %12 = icmp eq %TypeKind %11, 2
  br i1 %12, label %then_0, label %else_0
then_0:
;stmt4:
  %13 = bitcast [14 x %Nat8]* @func410_func411_str1 to %Str
  %14 = getelementptr inbounds %Type, %Type* %9, i1 0, i32 14
  %15 = load %TokenInfo*, %TokenInfo** %14
  call void (%Str, %TokenInfo*) @error (%Str %13, %TokenInfo* %15)
;stmt5:
  %16 = getelementptr inbounds %func410.type5, %func410.type5* %6, i1 0, i32 1
  store i1 1, i1* %16, align 1
;stmt6:
ret void
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt7:
  %18 = alloca %func410_func411.type6
  %19 = getelementptr inbounds %func410.type5, %func410.type5* %6, i1 0, i32 0
  %20 = load %List*, %List** %19
  %21 = insertvalue %func410_func411.type6 zeroinitializer, %List* %20, 0
  %22 = insertvalue %func410_func411.type6 %21, %Type* %9, 1
  store %func410_func411.type6 %22, %func410_func411.type6* %18, align 8
;stmt8:
  %23 = getelementptr inbounds %AstDecl, %AstDecl* %5, i1 0, i32 0
  %24 = getelementptr inbounds %func410_func411.type6, %func410_func411.type6* %18, i1 0
  %25 = bitcast %func410_func411.type6* %24 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @func64 (%List* %23, %ListForeachHandler @func412, %Unit* %25)
  ret void
}

define void @func413 (%Unit*, %Unit*, %Nat32, %Node*) {
;stmt0:
  %5 = bitcast %Unit* %0 to %Decl*
;stmt1:
  %6 = getelementptr inbounds %Decl, %Decl* %5, i1 0, i32 1
  %7 = load %Type*, %Type** %6
  %8 = getelementptr inbounds %Type, %Type* %7, i1 0, i32 0
  %9 = load %TypeKind, %TypeKind* %8
  %10 = icmp eq %TypeKind %9, 1
  br i1 %10, label %then_0, label %else_0
then_0:
;stmt2:
  %11 = bitcast [15 x %Nat8]* @func410_func413_str1 to %Str
  %12 = getelementptr inbounds %Decl, %Decl* %5, i1 0, i32 1
  %13 = load %Type*, %Type** %12
  %14 = getelementptr inbounds %Type, %Type* %13, i1 0, i32 14
  %15 = load %TokenInfo*, %TokenInfo** %14
  call void (%Str, %TokenInfo*) @error (%Str %11, %TokenInfo* %15)
;stmt3:
ret void
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt4:
  %17 = bitcast %Unit* %1 to %Type*
;stmt5:
  %18 = getelementptr inbounds %Decl, %Decl* %5, i1 0, i32 3
  %19 = trunc %Nat32 %2 to %Nat16
  store %Nat16 %19, %Nat16* %18, align 2
;stmt6:
  %20 = getelementptr inbounds %Type, %Type* %17, i1 0, i32 4
  %21 = load %Nat32, %Nat32* %20
  %22 = getelementptr inbounds %Decl, %Decl* %5, i1 0, i32 1
  %23 = load %Type*, %Type** %22
  %24 = getelementptr inbounds %Type, %Type* %23, i1 0, i32 4
  %25 = load %Nat32, %Nat32* %24
  %26 = icmp ult %Nat32 %21, %25
  br i1 %26, label %then_1, label %else_1
then_1:
;stmt7:
  %27 = getelementptr inbounds %Type, %Type* %17, i1 0, i32 4
  %28 = getelementptr inbounds %Decl, %Decl* %5, i1 0, i32 1
  %29 = load %Type*, %Type** %28
  %30 = getelementptr inbounds %Type, %Type* %29, i1 0, i32 4
  %31 = load %Nat32, %Nat32* %30
  store %Nat32 %31, %Nat32* %27, align 4
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt8:
  %32 = getelementptr inbounds %Type, %Type* %17, i1 0, i32 3
  %33 = load %Nat32, %Nat32* %32
  %34 = getelementptr inbounds %Type, %Type* %17, i1 0, i32 10
  %35 = getelementptr inbounds %TypeRecord, %TypeRecord* %34, i1 0, i32 1
  %36 = load %Nat32, %Nat32* %35
  %37 = sub %Nat32 %33, %36
;stmt9:
  %38 = getelementptr inbounds %Decl, %Decl* %5, i1 0, i32 1
  %39 = load %Type*, %Type** %38
  %40 = getelementptr inbounds %Type, %Type* %39, i1 0, i32 4
  %41 = load %Nat32, %Nat32* %40
  %42 = icmp eq %Nat32 %41, 0
  br i1 %42, label %then_2, label %else_2
then_2:
;stmt10:
  %43 = bitcast [11 x %Nat8]* @func410_func413_str2 to %Str
  %44 = getelementptr inbounds %Decl, %Decl* %5, i1 0, i32 1
  %45 = load %Type*, %Type** %44
  %46 = getelementptr inbounds %Type, %Type* %45, i1 0, i32 14
  %47 = load %TokenInfo*, %TokenInfo** %46
  call void (%Str, %TokenInfo*) @error (%Str %43, %TokenInfo* %47)
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
;stmt11:
  %48 = getelementptr inbounds %Type, %Type* %17, i1 0, i32 10
  %49 = getelementptr inbounds %TypeRecord, %TypeRecord* %48, i1 0, i32 1
  %50 = load %Nat32, %Nat32* %49
  %51 = getelementptr inbounds %Decl, %Decl* %5, i1 0, i32 1
  %52 = load %Type*, %Type** %51
  %53 = getelementptr inbounds %Type, %Type* %52, i1 0, i32 4
  %54 = load %Nat32, %Nat32* %53
  %55 = call %Nat32 (%Nat32, %Nat32) @align (%Nat32 %50, %Nat32 %54)
;stmt12:
  %56 = getelementptr inbounds %Decl, %Decl* %5, i1 0, i32 1
  %57 = load %Type*, %Type** %56
  %58 = getelementptr inbounds %Type, %Type* %57, i1 0, i32 3
  %59 = load %Nat32, %Nat32* %58
  %60 = add %Nat32 %55, %59
;stmt13:
  %61 = getelementptr inbounds %Type, %Type* %17, i1 0, i32 10
  %62 = getelementptr inbounds %TypeRecord, %TypeRecord* %61, i1 0, i32 1
  store %Nat32 %60, %Nat32* %62, align 4
;stmt14:
  %63 = getelementptr inbounds %Type, %Type* %17, i1 0, i32 3
  %64 = load %Nat32, %Nat32* %63
  %65 = icmp ugt %Nat32 %60, %64
  br i1 %65, label %then_3, label %else_3
then_3:
;stmt15:
  %66 = getelementptr inbounds %Type, %Type* %17, i1 0, i32 3
  %67 = getelementptr inbounds %Type, %Type* %17, i1 0, i32 4
  %68 = load %Nat32, %Nat32* %67
  %69 = call %Nat32 (%Nat32, %Nat32) @align (%Nat32 %60, %Nat32 %68)
  store %Nat32 %69, %Nat32* %66, align 4
  br label %endif_3
else_3:
  br label %endif_3
endif_3:
  ret void
}

define %Type* @func410 (%AstType*) {
;stmt0:
  %2 = load %Type*, %Type** @ctype
;stmt1:
  %3 = getelementptr inbounds %AstType, %AstType* %0, i1 0, i32 11
  %4 = load %TokenInfo*, %TokenInfo** %3
  %5 = call %Type* (%TypeKind, %Nat32, %TokenInfo*) @func380 (%TypeKind 10, %Nat32 0, %TokenInfo* %4)
;stmt2:
  store %Type* %5, %Type** @ctype, align 8
;stmt3:
  %6 = alloca %func410.type5
  %7 = call %List* () @map_new ()
  %8 = insertvalue %func410.type5 zeroinitializer, %List* %7, 0
  %9 = insertvalue %func410.type5 %8, i1 0, 1
  store %func410.type5 %9, %func410.type5* %6, align 8
;stmt4:
  %10 = getelementptr inbounds %AstType, %AstType* %0, i1 0, i32 6
  %11 = getelementptr inbounds %AstTypeRecord, %AstTypeRecord* %10, i1 0, i32 0
  %12 = getelementptr inbounds %func410.type5, %func410.type5* %6, i1 0
  %13 = bitcast %func410.type5* %12 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @func64 (%List* %11, %ListForeachHandler @func411, %Unit* %13)
;stmt5:
  store %Type* %2, %Type** @ctype, align 8
;stmt6:
  %14 = getelementptr inbounds %Type, %Type* %5, i1 0, i32 10
  %15 = getelementptr inbounds %TypeRecord, %TypeRecord* %14, i1 0, i32 0
  %16 = getelementptr inbounds %func410.type5, %func410.type5* %6, i1 0, i32 0
  %17 = load %List*, %List** %16
  store %List* %17, %List** %15, align 8
;stmt7:
  %18 = getelementptr inbounds %Type, %Type* %5, i1 0, i32 10
  %19 = getelementptr inbounds %TypeRecord, %TypeRecord* %18, i1 0, i32 0
  %20 = load %List*, %List** %19
  %21 = bitcast %Type* %5 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @func64 (%List* %20, %ListForeachHandler @func413, %Unit* %21)
;stmt8:
  ret %Type* %5
}

define void @func415 (%Unit*, %Unit*, %Nat32, %Node*) {
;stmt0:
  %5 = bitcast %Unit* %0 to %AstId*
;stmt1:
  %6 = bitcast %Unit* %1 to %List*
;stmt2:
  %7 = call %Unit* (%Nat32) @malloc (%Nat32 24)
  %8 = bitcast %Unit* %7 to %EnumConstructor*
;stmt3:
  %9 = insertvalue %EnumConstructor zeroinitializer, %AstId* %5, 0
  %10 = insertvalue %EnumConstructor %9, %Nat32 %2, 1; loadImmPtr
  %11 = inttoptr i64 0 to%TokenInfo*
  %12 = insertvalue %EnumConstructor %10, %TokenInfo* %11, 2
  store %EnumConstructor %12, %EnumConstructor* %8, align 8
;stmt4:
  %13 = bitcast %EnumConstructor* %8 to %Unit*
  %14 = call i1 (%List*, %Unit*) @list_append (%List* %6, %Unit* %13)
  ret void
}

define %Type* @func414 (%AstType*) {
;stmt0:
  %2 = call %List* () @map_new ()
;stmt1:
  %3 = getelementptr inbounds %AstType, %AstType* %0, i1 0, i32 2
  %4 = getelementptr inbounds %AstTypeEnum, %AstTypeEnum* %3, i1 0, i32 0
  %5 = bitcast %List* %2 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @func64 (%List* %4, %ListForeachHandler @func415, %Unit* %5)
;stmt2:
  %6 = getelementptr inbounds %AstType, %AstType* %0, i1 0, i32 11
  %7 = load %TokenInfo*, %TokenInfo** %6
  %8 = call %Type* (%List*, %TokenInfo*) @func385 (%List* %2, %TokenInfo* %7)
  ret %Type* %8
}

define %Nat32 @propagation (%Nat32) {
;stmt0:
  br label %select_1_0
select_1_0:
  %2 = icmp ule %Nat32 %0, 2
  %3 = icmp eq i1 1, %2
  br i1 %3, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %4 = bitcast %Nat32 2 to %Nat32
  br label %select_1_end
select_1_1:
  %5 = icmp ule %Nat32 %0, 4
  %6 = icmp eq i1 1, %5
  br i1 %6, label %select_1_1_ok, label %select_1_2
select_1_1_ok:
  %7 = bitcast %Nat32 4 to %Nat32
  br label %select_1_end
select_1_2:
  %8 = icmp ule %Nat32 %0, 8
  %9 = icmp eq i1 1, %8
  br i1 %9, label %select_1_2_ok, label %select_1_3
select_1_2_ok:
  %10 = bitcast %Nat32 8 to %Nat32
  br label %select_1_end
select_1_3:
  %11 = icmp ule %Nat32 %0, 16
  %12 = icmp eq i1 1, %11
  br i1 %12, label %select_1_3_ok, label %select_1_4
select_1_3_ok:
  %13 = bitcast %Nat32 16 to %Nat32
  br label %select_1_end
select_1_4:
  %14 = icmp ule %Nat32 %0, 32
  %15 = icmp eq i1 1, %14
  br i1 %15, label %select_1_4_ok, label %select_1_5
select_1_4_ok:
  %16 = bitcast %Nat32 32 to %Nat32
  br label %select_1_end
select_1_5:
  %17 = icmp ule %Nat32 %0, 64
  %18 = icmp eq i1 1, %17
  br i1 %18, label %select_1_5_ok, label %select_1_6
select_1_5_ok:
  %19 = bitcast %Nat32 64 to %Nat32
  br label %select_1_end
select_1_6:
  %20 = icmp ule %Nat32 %0, 128
  %21 = icmp eq i1 1, %20
  br i1 %21, label %select_1_6_ok, label %select_1_7
select_1_6_ok:
  %22 = bitcast %Nat32 128 to %Nat32
  br label %select_1_end
select_1_7:
  %23 = icmp ule %Nat32 %0, 256
  %24 = icmp eq i1 1, %23
  br i1 %24, label %select_1_7_ok, label %select_1_8
select_1_7_ok:
  %25 = bitcast %Nat32 256 to %Nat32
  br label %select_1_end
select_1_8:
  %26 = icmp ule %Nat32 %0, 512
  %27 = icmp eq i1 1, %26
  br i1 %27, label %select_1_8_ok, label %select_1_9
select_1_8_ok:
  %28 = bitcast %Nat32 512 to %Nat32
  br label %select_1_end
select_1_9:
  %29 = icmp ule %Nat32 %0, 1024
  %30 = icmp eq i1 1, %29
  br i1 %30, label %select_1_9_ok, label %select_1_10
select_1_9_ok:
  %31 = bitcast %Nat32 1024 to %Nat32
  br label %select_1_end
select_1_10:
  %32 = icmp ule %Nat32 %0, 2048
  %33 = icmp eq i1 1, %32
  br i1 %33, label %select_1_10_ok, label %select_1_11
select_1_10_ok:
  %34 = bitcast %Nat32 2048 to %Nat32
  br label %select_1_end
select_1_11:
  %35 = icmp ule %Nat32 %0, 4096
  %36 = icmp eq i1 1, %35
  br i1 %36, label %select_1_11_ok, label %select_1_12
select_1_11_ok:
  %37 = bitcast %Nat32 4096 to %Nat32
  br label %select_1_end
select_1_12:
  br label %select_1_end
select_1_end:
  %38 = phi %Nat32 [ %4, %select_1_0_ok ], [ %7, %select_1_1_ok ], [ %10, %select_1_2_ok ], [ %13, %select_1_3_ok ], [ %16, %select_1_4_ok ], [ %19, %select_1_5_ok ], [ %22, %select_1_6_ok ], [ %25, %select_1_7_ok ], [ %28, %select_1_8_ok ], [ %31, %select_1_9_ok ], [ %34, %select_1_10_ok ], [ %37, %select_1_11_ok ], [ %0, %select_1_12 ]
  ret %Nat32 %38
}

define void @func418 (%Unit*, %Unit*, %Nat32, %Node*) {
;stmt0:
  %5 = bitcast %Unit* %0 to %AstType*
;stmt1:
  %6 = bitcast %Unit* %1 to %func417.type7*
;stmt2:
  %7 = bitcast %Unit* %1 to %List*
;stmt3:
  %8 = call %Type* (%AstType*) @func400 (%AstType* %5)
;stmt4:
  %9 = getelementptr inbounds %func417.type7, %func417.type7* %6, i1 0, i32 1
  br label %select_1_0
select_1_0:
  %10 = getelementptr inbounds %Type, %Type* %8, i1 0, i32 3
  %11 = load %Nat32, %Nat32* %10
  %12 = getelementptr inbounds %func417.type7, %func417.type7* %6, i1 0, i32 1
  %13 = load %Nat32, %Nat32* %12
  %14 = icmp ugt %Nat32 %11, %13
  %15 = icmp eq i1 1, %14
  br i1 %15, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %16 = getelementptr inbounds %Type, %Type* %8, i1 0, i32 3
  %17 = load %Nat32, %Nat32* %16
  br label %select_1_end
select_1_1:
  %18 = getelementptr inbounds %func417.type7, %func417.type7* %6, i1 0, i32 1
  %19 = load %Nat32, %Nat32* %18
  br label %select_1_end
select_1_end:
  %20 = phi %Nat32 [ %17, %select_1_0_ok ], [ %19, %select_1_1 ]
  store %Nat32 %20, %Nat32* %9, align 4
;stmt5:
  %21 = getelementptr inbounds %func417.type7, %func417.type7* %6, i1 0, i32 0
  %22 = load %List*, %List** %21
  %23 = call i1 (%List*, %Type*) @func158 (%List* %22, %Type* %8)
  br i1 %23, label %then_0, label %else_0
then_0:
;stmt6:
  %24 = bitcast [35 x %Nat8]* @func417_func418_str1 to %Str
  %25 = getelementptr inbounds %Type, %Type* %8, i1 0, i32 14
  %26 = load %TokenInfo*, %TokenInfo** %25
  call void (%Str, %TokenInfo*) @error (%Str %24, %TokenInfo* %26)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt7:
  %27 = getelementptr inbounds %func417.type7, %func417.type7* %6, i1 0, i32 0
  %28 = load %List*, %List** %27
  %29 = bitcast %Type* %8 to %Unit*
  %30 = call i1 (%List*, %Unit*) @list_append (%List* %28, %Unit* %29)
  ret void
}

define %Type* @func417 (%AstType*) {
;stmt0:
  %2 = call %Str (%Nat32) @str_new (%Nat32 10)
;stmt1:
; eval index uarray
  %3 = getelementptr inbounds %Nat8, %Nat8* %2, %Int64 0
  %4 = bitcast %Nat8* %3 to %Unit*
  %5 = bitcast [3 x %Nat8]* @func417_str1 to %Str
  %6 = load %Nat32, %Nat32* @union_id
  %7 = call %Int32 (%Unit*, %Str, ...) @sprintf (%Unit* %4, %Str %5, %Nat32 %6)
;stmt2:
  %8 = bitcast [7 x %Nat8]* @func417_str2 to %Str
  %9 = call %Str (%Str, %Str) @cat (%Str %8, %Str %2)
;stmt3:
  %10 = load %Nat32, %Nat32* @union_id
  %11 = add %Nat32 %10, 1
  store %Nat32 %11, %Nat32* @union_id, align 4
;stmt4:
  %12 = getelementptr inbounds %AstType, %AstType* %0, i1 0, i32 11
  %13 = load %TokenInfo*, %TokenInfo** %12
  %14 = call %Type* (%TypeKind, %Nat32, %TokenInfo*) @func380 (%TypeKind 14, %Nat32 0, %TokenInfo* %13)
;stmt5:
  %15 = getelementptr inbounds %Type, %Type* %14, i1 0, i32 13
  %16 = getelementptr inbounds %TypeUnion, %TypeUnion* %15, i1 0, i32 0
  call void (%List*) @map_init (%List* %16)
;stmt6:
  %17 = getelementptr inbounds %Type, %Type* %14, i1 0, i32 2
  store %Str %9, %Str* %17, align 8
;stmt7:
  %18 = alloca %func417.type7
  %19 = getelementptr inbounds %Type, %Type* %14, i1 0, i32 13
  %20 = getelementptr inbounds %TypeUnion, %TypeUnion* %19, i1 0, i32 0
  %21 = insertvalue %func417.type7 zeroinitializer, %List* %20, 0
  store %func417.type7 %21, %func417.type7* %18, align 8
;stmt8:
  %22 = getelementptr inbounds %AstType, %AstType* %0, i1 0, i32 9
  %23 = getelementptr inbounds %AstTypeUnion, %AstTypeUnion* %22, i1 0, i32 0
  %24 = getelementptr inbounds %func417.type7, %func417.type7* %18, i1 0
  %25 = bitcast %func417.type7* %24 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @func64 (%List* %23, %ListForeachHandler @func418, %Unit* %25)
;stmt9:
  %26 = getelementptr inbounds %func417.type7, %func417.type7* %18, i1 0, i32 1
  %27 = load %Nat32, %Nat32* %26
  %28 = add %Nat32 %27, 2
  %29 = call %Nat32 (%Nat32, %Nat32) @align (%Nat32 %28, %Nat32 4)
  %30 = call %Nat32 (%Nat32) @propagation (%Nat32 %29)
;stmt10:
  %31 = getelementptr inbounds %Type, %Type* %14, i1 0, i32 3
  store %Nat32 %30, %Nat32* %31, align 4
;stmt11:
  %32 = getelementptr inbounds %Type, %Type* %14, i1 0, i32 4
  store %Nat32 %30, %Nat32* %32, align 4
;stmt12:
  %33 = getelementptr inbounds %Type, %Type* %14, i1 0, i32 13
  %34 = getelementptr inbounds %TypeUnion, %TypeUnion* %33, i1 0, i32 2
  %35 = getelementptr inbounds %func417.type7, %func417.type7* %18, i1 0, i32 1
  %36 = load %Nat32, %Nat32* %35
  store %Nat32 %36, %Nat32* %34, align 4
;stmt13:
  %37 = getelementptr inbounds %List, %List* @unions, i1 0
  %38 = bitcast %Type* %14 to %Unit*
  %39 = call i1 (%List*, %Unit*) @list_append (%List* %37, %Unit* %38)
;stmt14:
  %40 = call i1 (%Type*) @func399 (%Type* %14)
  br i1 %40, label %then_0, label %else_0
then_0:
;stmt15:
  %41 = load %Type*, %Type** @typeFreePtr
;stmt16:
  %42 = getelementptr inbounds %Type, %Type* %14, i1 0, i32 13
  %43 = getelementptr inbounds %TypeUnion, %TypeUnion* %42, i1 0, i32 1
  store %Type* %41, %Type** %43, align 8
  br label %endif_0
else_0:
;stmt17:
  %44 = getelementptr inbounds %Type, %Type* %14, i1 0, i32 13
  %45 = getelementptr inbounds %TypeUnion, %TypeUnion* %44, i1 0, i32 1; loadImmPtr
  %46 = inttoptr i64 0 to%Type*
  store %Type* %46, %Type** %45, align 8
  br label %endif_0
endif_0:
;stmt18:
  ret %Type* %14
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
  %12 = call i1 (%Type*, %Type*) @func426 (%Type* %9, %Type* %11)
  %13 = and i1 %7, %12
  ret i1 %13
}

define i1 @type_eq_func (%TypeFunc*, %TypeFunc*) {
;stmt0:
  %3 = getelementptr inbounds %TypeFunc, %TypeFunc* %0, i1 0, i32 0
  %4 = load %Type*, %Type** %3
  %5 = getelementptr inbounds %TypeFunc, %TypeFunc* %1, i1 0, i32 0
  %6 = load %Type*, %Type** %5
  %7 = call i1 (%Type*, %Type*) @func426 (%Type* %4, %Type* %6)
  %8 = getelementptr inbounds %TypeFunc, %TypeFunc* %0, i1 0, i32 1
  %9 = load %Type*, %Type** %8
  %10 = getelementptr inbounds %TypeFunc, %TypeFunc* %1, i1 0, i32 1
  %11 = load %Type*, %Type** %10
  %12 = call i1 (%Type*, %Type*) @func426 (%Type* %9, %Type* %11)
  %13 = and i1 %7, %12
  ret i1 %13
}

define i1 @func423 (%Unit*, %Unit*, %Unit*, %Nat32) {
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
  %22 = call i1 (%Type*, %Type*) @func426 (%Type* %19, %Type* %21)
  ret i1 %22
}

define i1 @type_eq_record (%TypeRecord*, %TypeRecord*) {
;stmt0:
  %3 = getelementptr inbounds %TypeRecord, %TypeRecord* %0, i1 0, i32 0
  %4 = load %List*, %List** %3
  %5 = getelementptr inbounds %TypeRecord, %TypeRecord* %1, i1 0, i32 0
  %6 = load %List*, %List** %5; loadImmPtr
  %7 = inttoptr i64 0 to%Unit*
  %8 = call i1 (%List*, %List*, %ListCompareHandler, %Unit*) @list_compare (%List* %4, %List* %6, %ListCompareHandler @func423, %Unit* %7)
  ret i1 %8
}

define i1 @func425 (%Unit*, %Unit*, %Unit*, %Nat32) {
;stmt0:
  %5 = bitcast %Unit* %0 to %Type*
;stmt1:
  %6 = bitcast %Unit* %1 to %Type*
;stmt2:
  %7 = call i1 (%Type*, %Type*) @func426 (%Type* %5, %Type* %6)
  ret i1 %7
}

define i1 @type_eq_union (%TypeUnion*, %TypeUnion*) {
;stmt0:
  %3 = getelementptr inbounds %TypeUnion, %TypeUnion* %0, i1 0, i32 0
  %4 = getelementptr inbounds %List, %List* %3, i1 0, i32 2
  %5 = load %Nat64, %Nat64* %4
  %6 = getelementptr inbounds %TypeUnion, %TypeUnion* %1, i1 0, i32 0
  %7 = getelementptr inbounds %List, %List* %6, i1 0, i32 2
  %8 = load %Nat64, %Nat64* %7
  %9 = icmp ne %Nat64 %5, %8
  br i1 %9, label %then_0, label %else_0
then_0:
;stmt1:
  ret i1 0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt2:
  %11 = getelementptr inbounds %TypeUnion, %TypeUnion* %0, i1 0, i32 0
  %12 = getelementptr inbounds %TypeUnion, %TypeUnion* %1, i1 0, i32 0; loadImmPtr
  %13 = inttoptr i64 0 to%Unit*
  %14 = call i1 (%List*, %List*, %ListCompareHandler, %Unit*) @list_compare (%List* %11, %List* %12, %ListCompareHandler @func425, %Unit* %13)
  ret i1 %14
}

define i1 @func426 (%Type*, %Type*) {
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
  %5 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 1
  %6 = load %Nat32, %Nat32* %5
  %7 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 1
  %8 = load %Nat32, %Nat32* %7
  %9 = icmp ne %Nat32 %6, %8
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
  %13 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 0
  %14 = load %TypeKind, %TypeKind* %13
  %15 = icmp ne %TypeKind %12, %14
  br i1 %15, label %then_2, label %else_2
then_2:
;stmt5:
  ret i1 0
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
;stmt6:
  %17 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 0
  %18 = load %TypeKind, %TypeKind* %17
  br label %select_1_0
select_1_0:
  %19 = icmp eq %TypeKind %18, 5
  br i1 %19, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %20 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 5
  %21 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 5
  %22 = call i1 (%TypeNumeric*, %TypeNumeric*) @type_eq_numeric (%TypeNumeric* %20, %TypeNumeric* %21)
  br label %select_1_end
select_1_1:
  %23 = icmp eq %TypeKind %18, 6
  br i1 %23, label %select_1_1_ok, label %select_1_2
select_1_1_ok:
  %24 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 12
  %25 = getelementptr inbounds %TypeVar, %TypeVar* %24, i1 0, i32 0
  %26 = load %Type*, %Type** %25
  %27 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 12
  %28 = getelementptr inbounds %TypeVar, %TypeVar* %27, i1 0, i32 0
  %29 = load %Type*, %Type** %28
  %30 = call i1 (%Type*, %Type*) @func426 (%Type* %26, %Type* %29)
  br label %select_1_end
select_1_2:
  %31 = icmp eq %TypeKind %18, 11
  br i1 %31, label %select_1_2_ok, label %select_1_3
select_1_2_ok:
  %32 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 7
  %33 = getelementptr inbounds %TypePointer, %TypePointer* %32, i1 0, i32 0
  %34 = load %Type*, %Type** %33
  %35 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 7
  %36 = getelementptr inbounds %TypePointer, %TypePointer* %35, i1 0, i32 0
  %37 = load %Type*, %Type** %36
  %38 = call i1 (%Type*, %Type*) @func426 (%Type* %34, %Type* %37)
  br label %select_1_end
select_1_3:
  %39 = icmp eq %TypeKind %18, 12
  br i1 %39, label %select_1_3_ok, label %select_1_4
select_1_3_ok:
  %40 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 8
  %41 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 8
  %42 = call i1 (%TypeArray*, %TypeArray*) @type_eq_array (%TypeArray* %40, %TypeArray* %41)
  br label %select_1_end
select_1_4:
  %43 = icmp eq %TypeKind %18, 13
  br i1 %43, label %select_1_4_ok, label %select_1_5
select_1_4_ok:
  %44 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 9
  %45 = getelementptr inbounds %TypeArrayU, %TypeArrayU* %44, i1 0, i32 0
  %46 = load %Type*, %Type** %45
  %47 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 9
  %48 = getelementptr inbounds %TypeArrayU, %TypeArrayU* %47, i1 0, i32 0
  %49 = load %Type*, %Type** %48
  %50 = call i1 (%Type*, %Type*) @func426 (%Type* %46, %Type* %49)
  br label %select_1_end
select_1_5:
  %51 = icmp eq %TypeKind %18, 8
  br i1 %51, label %select_1_5_ok, label %select_1_6
select_1_5_ok:
  %52 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 6
  %53 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 6
  %54 = call i1 (%TypeFunc*, %TypeFunc*) @type_eq_func (%TypeFunc* %52, %TypeFunc* %53)
  br label %select_1_end
select_1_6:
  %55 = icmp eq %TypeKind %18, 10
  br i1 %55, label %select_1_6_ok, label %select_1_7
select_1_6_ok:
  %56 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 10
  %57 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 10
  %58 = call i1 (%TypeRecord*, %TypeRecord*) @type_eq_record (%TypeRecord* %56, %TypeRecord* %57)
  br label %select_1_end
select_1_7:
  %59 = icmp eq %TypeKind %18, 14
  br i1 %59, label %select_1_7_ok, label %select_1_8
select_1_7_ok:
  %60 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 13
  %61 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 13
  %62 = call i1 (%TypeUnion*, %TypeUnion*) @type_eq_union (%TypeUnion* %60, %TypeUnion* %61)
  br label %select_1_end
select_1_8:
  %63 = icmp eq %TypeKind %18, 9
  br i1 %63, label %select_1_8_ok, label %select_1_9
select_1_8_ok:
  %64 = bitcast i1 0 to i1
  br label %select_1_end
select_1_9:
  %65 = icmp eq %TypeKind %18, 7
  br i1 %65, label %select_1_9_ok, label %select_1_10
select_1_9_ok:
  %66 = bitcast i1 1 to i1
  br label %select_1_end
select_1_10:
  %67 = bitcast i1 0 to i1
  br label %select_1_end
select_1_end:
  %68 = phi i1 [ %22, %select_1_0_ok ], [ %30, %select_1_1_ok ], [ %38, %select_1_2_ok ], [ %42, %select_1_3_ok ], [ %50, %select_1_4_ok ], [ %54, %select_1_5_ok ], [ %58, %select_1_6_ok ], [ %62, %select_1_7_ok ], [ %64, %select_1_8_ok ], [ %66, %select_1_9_ok ], [ %67, %select_1_10 ]
  ret i1 %68
}

define i1 @type_check (%Type*, %Type*, %TokenInfo*) {
;stmt0:
  %4 = call i1 (%Type*, %Type*) @func426 (%Type* %0, %Type* %1)
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

define %Type* @func429 (%Str, %Nat32, i1) {
;stmt0:
  %4 = udiv %Nat32 %1, 8
;stmt1:; loadImmPtr
  %5 = inttoptr i64 0 to%TokenInfo*
  %6 = call %Type* (%TypeKind, %Nat32, %TokenInfo*) @func380 (%TypeKind 5, %Nat32 %4, %TokenInfo* %5)
;stmt2:
  %7 = getelementptr inbounds %Type, %Type* %6, i1 0, i32 2
  store %Str %0, %Str* %7, align 8
;stmt3:
  %8 = getelementptr inbounds %Type, %Type* %6, i1 0, i32 5
  %9 = insertvalue %TypeNumeric zeroinitializer, %Nat32 %1, 0
  %10 = insertvalue %TypeNumeric %9, i1 %2, 1
  store %TypeNumeric %10, %TypeNumeric* %8, align 4
;stmt4:
  ret %Type* %6
}

define void @func428 () {
;stmt0:
  %1 = call %List* () @map_new (); loadImmPtr
  %2 = inttoptr i64 0 to%TokenInfo*
  %3 = call %Type* (%List*, %TokenInfo*) @func385 (%List* %1, %TokenInfo* %2)
  store %Type* %3, %Type** @typeVoid, align 8
;stmt1:
  %4 = load %Type*, %Type** @typeVoid
  %5 = getelementptr inbounds %Type, %Type* %4, i1 0, i32 2
  %6 = bitcast [5 x %Nat8]* @func428_str1 to %Str
  store %Str %6, %Str* %5, align 8
;stmt2:
  %7 = bitcast [5 x %Nat8]* @func428_str2 to %Str
  %8 = load %Type*, %Type** @typeVoid
  call void (%Str, %Type*) @builtin_type_bind (%Str %7, %Type* %8)
;stmt3:; loadImmPtr
  %9 = inttoptr i64 0 to%TokenInfo*
  %10 = call %Type* (%TypeKind, %Nat32, %TokenInfo*) @func380 (%TypeKind 10, %Nat32 0, %TokenInfo* %9)
  store %Type* %10, %Type** @typeUnit, align 8
;stmt4:
  %11 = load %Type*, %Type** @typeUnit
  %12 = getelementptr inbounds %Type, %Type* %11, i1 0, i32 10
  %13 = call %List* () @map_new ()
  %14 = insertvalue %TypeRecord zeroinitializer, %List* %13, 0
  store %TypeRecord %14, %TypeRecord* %12, align 8
;stmt5:
  %15 = load %Type*, %Type** @typeUnit
  %16 = getelementptr inbounds %Type, %Type* %15, i1 0, i32 2
  %17 = bitcast [5 x %Nat8]* @func428_str3 to %Str
  store %Str %17, %Str* %16, align 8
;stmt6:
  %18 = bitcast [5 x %Nat8]* @func428_str4 to %Str
  %19 = load %Type*, %Type** @typeUnit
  call void (%Str, %Type*) @builtin_type_bind (%Str %18, %Type* %19)
;stmt7:; loadImmPtr
  %20 = inttoptr i64 0 to%TokenInfo*
  %21 = call %Type* (%TypeKind, %Nat32, %TokenInfo*) @func380 (%TypeKind 7, %Nat32 1, %TokenInfo* %20)
  store %Type* %21, %Type** @typeBool, align 8
;stmt8:
  %22 = bitcast [5 x %Nat8]* @func428_str5 to %Str
  %23 = load %Type*, %Type** @typeBool
  call void (%Str, %Type*) @builtin_type_bind (%Str %22, %Type* %23)
;stmt9:
  %24 = bitcast [5 x %Nat8]* @func428_str6 to %Str
  %25 = call %Type* (%Str, %Nat32, i1) @func429 (%Str %24, %Nat32 8, i1 1)
;stmt10:
  %26 = bitcast [6 x %Nat8]* @func428_str7 to %Str
  %27 = call %Type* (%Str, %Nat32, i1) @func429 (%Str %26, %Nat32 16, i1 1)
;stmt11:
  %28 = bitcast [6 x %Nat8]* @func428_str8 to %Str
  %29 = call %Type* (%Str, %Nat32, i1) @func429 (%Str %28, %Nat32 32, i1 1)
;stmt12:
  %30 = bitcast [6 x %Nat8]* @func428_str9 to %Str
  %31 = call %Type* (%Str, %Nat32, i1) @func429 (%Str %30, %Nat32 64, i1 1)
;stmt13:
  %32 = bitcast [7 x %Nat8]* @func428_str10 to %Str
  %33 = call %Type* (%Str, %Nat32, i1) @func429 (%Str %32, %Nat32 128, i1 1)
;stmt14:
  %34 = bitcast [7 x %Nat8]* @func428_str11 to %Str
  %35 = call %Type* (%Str, %Nat32, i1) @func429 (%Str %34, %Nat32 256, i1 1)
;stmt15:
  %36 = bitcast [7 x %Nat8]* @func428_str12 to %Str
  %37 = call %Type* (%Str, %Nat32, i1) @func429 (%Str %36, %Nat32 512, i1 1)
;stmt16:
  %38 = bitcast [8 x %Nat8]* @func428_str13 to %Str
  %39 = call %Type* (%Str, %Nat32, i1) @func429 (%Str %38, %Nat32 1024, i1 1)
;stmt17:
  %40 = bitcast [5 x %Nat8]* @func428_str14 to %Str
  %41 = call %Type* (%Str, %Nat32, i1) @func429 (%Str %40, %Nat32 8, i1 0)
;stmt18:
  %42 = bitcast [6 x %Nat8]* @func428_str15 to %Str
  %43 = call %Type* (%Str, %Nat32, i1) @func429 (%Str %42, %Nat32 16, i1 0)
;stmt19:
  %44 = bitcast [6 x %Nat8]* @func428_str16 to %Str
  %45 = call %Type* (%Str, %Nat32, i1) @func429 (%Str %44, %Nat32 32, i1 0)
;stmt20:
  %46 = bitcast [6 x %Nat8]* @func428_str17 to %Str
  %47 = call %Type* (%Str, %Nat32, i1) @func429 (%Str %46, %Nat32 64, i1 0)
;stmt21:
  %48 = bitcast [7 x %Nat8]* @func428_str18 to %Str
  %49 = call %Type* (%Str, %Nat32, i1) @func429 (%Str %48, %Nat32 128, i1 0)
;stmt22:
  %50 = bitcast [7 x %Nat8]* @func428_str19 to %Str
  %51 = call %Type* (%Str, %Nat32, i1) @func429 (%Str %50, %Nat32 256, i1 0)
;stmt23:
  %52 = bitcast [7 x %Nat8]* @func428_str20 to %Str
  %53 = call %Type* (%Str, %Nat32, i1) @func429 (%Str %52, %Nat32 512, i1 0)
;stmt24:
  %54 = bitcast [8 x %Nat8]* @func428_str21 to %Str
  %55 = call %Type* (%Str, %Nat32, i1) @func429 (%Str %54, %Nat32 1024, i1 0)
;stmt25:
  %56 = bitcast [6 x %Nat8]* @func428_str22 to %Str
  call void (%Str, %Type*) @builtin_type_bind (%Str %56, %Type* %31)
;stmt26:
  %57 = bitcast [6 x %Nat8]* @func428_str23 to %Str
  call void (%Str, %Type*) @builtin_type_bind (%Str %57, %Type* %47)
;stmt27:
  %58 = bitcast [6 x %Nat8]* @func428_str24 to %Str
  call void (%Str, %Type*) @builtin_type_bind (%Str %58, %Type* %29)
;stmt28:
  %59 = bitcast [6 x %Nat8]* @func428_str25 to %Str
  call void (%Str, %Type*) @builtin_type_bind (%Str %59, %Type* %45)
;stmt29:
  %60 = bitcast [5 x %Nat8]* @func428_str26 to %Str
  call void (%Str, %Type*) @builtin_type_bind (%Str %60, %Type* %25)
;stmt30:
  %61 = bitcast [5 x %Nat8]* @func428_str27 to %Str
  call void (%Str, %Type*) @builtin_type_bind (%Str %61, %Type* %41)
;stmt31:
  %62 = bitcast [6 x %Nat8]* @func428_str28 to %Str
  call void (%Str, %Type*) @builtin_type_bind (%Str %62, %Type* %27)
;stmt32:
  %63 = bitcast [6 x %Nat8]* @func428_str29 to %Str
  call void (%Str, %Type*) @builtin_type_bind (%Str %63, %Type* %43)
;stmt33:
  store %Type* %41, %Type** @typeChar, align 8
;stmt34:
  %64 = load %Type*, %Type** @typeChar; loadImmPtr
  %65 = inttoptr i64 0 to%TokenInfo*
  %66 = call %Type* (%Type*, %TokenInfo*) @func383 (%Type* %64, %TokenInfo* %65)
  store %Type* %66, %Type** @typeStr, align 8
;stmt35:
  %67 = load %Type*, %Type** @typeStr
  %68 = getelementptr inbounds %Type, %Type* %67, i1 0, i32 2
  %69 = bitcast [4 x %Nat8]* @func428_str30 to %Str
  store %Str %69, %Str* %68, align 8
;stmt36:
  %70 = bitcast [4 x %Nat8]* @func428_str31 to %Str
  %71 = load %Type*, %Type** @typeStr
  call void (%Str, %Type*) @builtin_type_bind (%Str %70, %Type* %71)
;stmt37:
  %72 = bitcast [7 x %Nat8]* @func428_str32 to %Str
  call void (%Str, %Type*) @builtin_type_bind (%Str %72, %Type* %33)
;stmt38:
  %73 = bitcast [7 x %Nat8]* @func428_str33 to %Str
  call void (%Str, %Type*) @builtin_type_bind (%Str %73, %Type* %35)
;stmt39:
  %74 = bitcast [7 x %Nat8]* @func428_str34 to %Str
  call void (%Str, %Type*) @builtin_type_bind (%Str %74, %Type* %37)
;stmt40:
  %75 = bitcast [8 x %Nat8]* @func428_str35 to %Str
  call void (%Str, %Type*) @builtin_type_bind (%Str %75, %Type* %39)
;stmt41:
  %76 = bitcast [7 x %Nat8]* @func428_str36 to %Str
  call void (%Str, %Type*) @builtin_type_bind (%Str %76, %Type* %49)
;stmt42:
  %77 = bitcast [7 x %Nat8]* @func428_str37 to %Str
  call void (%Str, %Type*) @builtin_type_bind (%Str %77, %Type* %51)
;stmt43:
  %78 = bitcast [7 x %Nat8]* @func428_str38 to %Str
  call void (%Str, %Type*) @builtin_type_bind (%Str %78, %Type* %53)
;stmt44:
  %79 = bitcast [8 x %Nat8]* @func428_str39 to %Str
  call void (%Str, %Type*) @builtin_type_bind (%Str %79, %Type* %55)
;stmt45:
  %80 = load %Type*, %Type** @typeUnit; loadImmPtr
  %81 = inttoptr i64 0 to%TokenInfo*
  %82 = call %Type* (%Type*, %TokenInfo*) @func382 (%Type* %80, %TokenInfo* %81)
  store %Type* %82, %Type** @typeFreePtr, align 8
;stmt46:
  %83 = bitcast [8 x %Nat8]* @func428_str40 to %Str
  %84 = call %Type* (%Str, %Nat32, i1) @func429 (%Str %83, %Nat32 0, i1 1)
  store %Type* %84, %Type** @typeNumeric, align 8
;stmt47:
  %85 = call %Type* (%Nat32) @func430 (%Nat32 8)
  store %Type* %85, %Type** @typeBaseInt, align 8
  ret void
}

define %Type* @func431 () {
;stmt0:
  %1 = bitcast [27 x %Nat8]* @func430_func431_str1 to %Str
  call void (%Str) @fatal (%Str %1)
;stmt1:; loadImmPtr
  %2 = inttoptr i64 0 to%Type*
  ret %Type* %2
}

define %Type* @func430 (%Nat32) {
;stmt0:
  br label %select_1_0
select_1_0:
  %2 = icmp eq %Nat32 %0, 1
  br i1 %2, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %3 = bitcast [5 x %Nat8]* @func430_str1 to %Str
  %4 = call %Type* (%Str) @func147 (%Str %3)
  br label %select_1_end
select_1_1:
  %5 = icmp eq %Nat32 %0, 2
  br i1 %5, label %select_1_1_ok, label %select_1_2
select_1_1_ok:
  %6 = bitcast [6 x %Nat8]* @func430_str2 to %Str
  %7 = call %Type* (%Str) @func147 (%Str %6)
  br label %select_1_end
select_1_2:
  %8 = icmp eq %Nat32 %0, 4
  br i1 %8, label %select_1_2_ok, label %select_1_3
select_1_2_ok:
  %9 = bitcast [6 x %Nat8]* @func430_str3 to %Str
  %10 = call %Type* (%Str) @func147 (%Str %9)
  br label %select_1_end
select_1_3:
  %11 = icmp eq %Nat32 %0, 8
  br i1 %11, label %select_1_3_ok, label %select_1_4
select_1_3_ok:
  %12 = bitcast [6 x %Nat8]* @func430_str4 to %Str
  %13 = call %Type* (%Str) @func147 (%Str %12)
  br label %select_1_end
select_1_4:
  %14 = icmp eq %Nat32 %0, 16
  br i1 %14, label %select_1_4_ok, label %select_1_5
select_1_4_ok:
  %15 = bitcast [7 x %Nat8]* @func430_str5 to %Str
  %16 = call %Type* (%Str) @func147 (%Str %15)
  br label %select_1_end
select_1_5:
  %17 = icmp eq %Nat32 %0, 32
  br i1 %17, label %select_1_5_ok, label %select_1_6
select_1_5_ok:
  %18 = bitcast [7 x %Nat8]* @func430_str6 to %Str
  %19 = call %Type* (%Str) @func147 (%Str %18)
  br label %select_1_end
select_1_6:
  %20 = icmp eq %Nat32 %0, 64
  br i1 %20, label %select_1_6_ok, label %select_1_7
select_1_6_ok:
  %21 = bitcast [7 x %Nat8]* @func430_str7 to %Str
  %22 = call %Type* (%Str) @func147 (%Str %21)
  br label %select_1_end
select_1_7:
  %23 = icmp eq %Nat32 %0, 128
  br i1 %23, label %select_1_7_ok, label %select_1_8
select_1_7_ok:
  %24 = bitcast [8 x %Nat8]* @func430_str8 to %Str
  %25 = call %Type* (%Str) @func147 (%Str %24)
  br label %select_1_end
select_1_8:
  %26 = call %Type* () @func431 ()
  br label %select_1_end
select_1_end:
  %27 = phi %Type* [ %4, %select_1_0_ok ], [ %7, %select_1_1_ok ], [ %10, %select_1_2_ok ], [ %13, %select_1_3_ok ], [ %16, %select_1_4_ok ], [ %19, %select_1_5_ok ], [ %22, %select_1_6_ok ], [ %25, %select_1_7_ok ], [ %26, %select_1_8 ]
  ret %Type* %27
}

define void @func433 (%Unit*, %Unit*, %Nat32, %Node*) {
;stmt0:
  %5 = bitcast %Unit* %0 to %Type*
;stmt1:
  %6 = bitcast %Unit* %1 to %func432.type8*
;stmt2:
  %7 = getelementptr inbounds %func432.type8, %func432.type8* %6, i1 0, i32 0
  %8 = load %Type*, %Type** %7
  %9 = call i1 (%Type*, %Type*) @func426 (%Type* %5, %Type* %8)
  br i1 %9, label %then_0, label %else_0
then_0:
;stmt3:
  %10 = getelementptr inbounds %func432.type8, %func432.type8* %6, i1 0, i32 1
  store %Nat32 %2, %Nat32* %10, align 4
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  ret void
}

define %Nat32 @func432 (%Type*, %Type*) {
;stmt0:
  %3 = alloca %func432.type8
  %4 = insertvalue %func432.type8 zeroinitializer, %Type* %1, 0
  store %func432.type8 %4, %func432.type8* %3, align 8
;stmt1:
  %5 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 13
  %6 = getelementptr inbounds %TypeUnion, %TypeUnion* %5, i1 0, i32 0
  %7 = getelementptr inbounds %func432.type8, %func432.type8* %3, i1 0
  %8 = bitcast %func432.type8* %7 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @func64 (%List* %6, %ListForeachHandler @func433, %Unit* %8)
;stmt2:
  %9 = getelementptr inbounds %func432.type8, %func432.type8* %3, i1 0, i32 1
  %10 = load %Nat32, %Nat32* %9
  ret %Nat32 %10
}

define i1 @is_value_imm_num (%Value*) {
;stmt0:
  %2 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 0
  %3 = load %ValueKind, %ValueKind* %2
  %4 = icmp eq %ValueKind %3, 3
  ret i1 %4
}

define %union.12 @smalloc (%Nat32) {
;stmt0:
  %2 = call %Unit* (%Nat32) @malloc (%Nat32 %0)
;stmt1:; loadImmPtr
  %3 = inttoptr i64 0 to%Unit*
  %4 = icmp eq %Unit* %2, %3
  br i1 %4, label %then_0, label %else_0
then_0:
;stmt2:
  %5 = inttoptr %Unit zeroinitializer to %union.12
  ret %union.12 %5
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt3:
  %7 = bitcast %Unit* %2 to %union.12
  ret %union.12 %7
}

define %union.13 @vn () {
;stmt0:
  %1 = call %Unit* (%Nat32) @malloc (%Nat32 520)
  %2 = bitcast %Unit* %1 to %Value*
;stmt1:; loadImmPtr
  %3 = inttoptr i64 0 to%Value*
  %4 = icmp eq %Value* %2, %3
  br i1 %4, label %then_0, label %else_0
then_0:
;stmt2:
  %5 = bitcast [21 x %Nat8]* @func436_str1 to %Str
  call void (i1, %Str) @assert (i1 0, %Str %5)
;stmt3:
  %6 = inttoptr %Unit zeroinitializer to %union.13
  ret %union.13 %6
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt4:
  %8 = bitcast %Value* %2 to %union.13
  ret %union.13 %8
}

define %Value* @func437 (%ValueKind, %Type*, %TokenInfo*) {
;stmt0:
  %4 = call %Unit* (%Nat32) @malloc (%Nat32 520)
  %5 = bitcast %Unit* %4 to %Value*
;stmt1:; loadImmPtr
  %6 = inttoptr i64 0 to%Value*
  %7 = icmp ne %Value* %5, %6
  %8 = bitcast [21 x %Nat8]* @func437_str1 to %Str
  call void (i1, %Str) @assert (i1 %7, %Str %8)
;stmt2:
  %9 = insertvalue %Value zeroinitializer, %ValueKind %0, 0
  %10 = insertvalue %Value %9, %Type* %1, 1
  %11 = insertvalue %Value %10, %TokenInfo* %2, 19
  store %Value %11, %Value* %5, align 8
;stmt3:
  ret %Value* %5
}

define %Value* @value_new_poison (%TokenInfo*) {
;stmt0:
  %2 = call %Type* (%TypeKind, %Nat32, %TokenInfo*) @func380 (%TypeKind 2, %Nat32 0, %TokenInfo* %0)
;stmt1:
  %3 = call %Value* (%ValueKind, %Type*, %TokenInfo*) @func437 (%ValueKind 1, %Type* %2, %TokenInfo* %0)
  ret %Value* %3
}

define %Value* @func439 (%Type*, %Int64, %TokenInfo*) {
;stmt0:
  %4 = call %Value* (%ValueKind, %Type*, %TokenInfo*) @func437 (%ValueKind 3, %Type* %0, %TokenInfo* %2)
;stmt1:
  %5 = getelementptr inbounds %Value, %Value* %4, i1 0, i32 2
  %6 = insertvalue %ValueImm zeroinitializer, %Type* %0, 0
  %7 = insertvalue %ValueImm %6, %Int64 %1, 1
  %8 = insertvalue %ValueImm %7, %TokenInfo* %2, 2
  store %ValueImm %8, %ValueImm* %5, align 8
;stmt2:
  ret %Value* %4
}

define %Value* @dold2 (%Value*) {
;stmt0:
  %2 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 1
  %3 = load %Type*, %Type** %2
  %4 = getelementptr inbounds %Type, %Type* %3, i1 0, i32 0
  %5 = load %TypeKind, %TypeKind* %4
  br label %select_1_0
select_1_0:
  %6 = icmp eq %TypeKind %5, 6
  br i1 %6, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %7 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 1
  %8 = load %Type*, %Type** %7
  %9 = getelementptr inbounds %Type, %Type* %8, i1 0, i32 12
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
  ret %Value* %0
}

define %Value* @dold (%Value*) {
;stmt0:
  %2 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 1
  %3 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 1
  %4 = load %Type*, %Type** %3
  %5 = getelementptr inbounds %Type, %Type* %4, i1 0, i32 0
  %6 = load %TypeKind, %TypeKind* %5
  br label %select_1_0
select_1_0:
  %7 = icmp eq %TypeKind %6, 6
  br i1 %7, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %8 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 1
  %9 = load %Type*, %Type** %8
  %10 = getelementptr inbounds %Type, %Type* %9, i1 0, i32 12
  %11 = getelementptr inbounds %TypeVar, %TypeVar* %10, i1 0, i32 0
  %12 = load %Type*, %Type** %11
  br label %select_1_end
select_1_1:
  %13 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 1
  %14 = load %Type*, %Type** %13
  br label %select_1_end
select_1_end:
  %15 = phi %Type* [ %12, %select_1_0_ok ], [ %14, %select_1_1 ]
  store %Type* %15, %Type** %2, align 8
;stmt1:
  ret %Value* %0
}

define %Value* @func442 (%AstValue*) {
;stmt0:
  %2 = call %Value* (%AstValue*, i1) @func443 (%AstValue* %0, i1 1)
  ret %Value* %2
}

define %Value* @func443 (%AstValue*, i1) {
;stmt0:
  %3 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 0
  %4 = load %AstValueKind, %AstValueKind* %3
  br label %select_1_0
select_1_0:
  %5 = icmp eq %AstValueKind %4, 3
  br i1 %5, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %6 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 1
  %7 = call %Value* (%AstName*) @func479 (%AstName* %6)
  br label %select_1_end
select_1_1:
  %8 = icmp eq %AstValueKind %4, 1
  br i1 %8, label %select_1_1_ok, label %select_1_2
select_1_1_ok:
  %9 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 5
  %10 = call %Value* (%AstValueNumber*) @func480 (%AstValueNumber* %9)
  br label %select_1_end
select_1_2:
  %11 = icmp eq %AstValueKind %4, 4
  br i1 %11, label %select_1_2_ok, label %select_1_3
select_1_2_ok:
  %12 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 6
  %13 = call %Value* (%AstValueFunc*) @func482 (%AstValueFunc* %12)
  br label %select_1_end
select_1_3:
  %14 = icmp eq %AstValueKind %4, 5
  br i1 %14, label %select_1_3_ok, label %select_1_4
select_1_3_ok:
  %15 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 3
  %16 = call %Value* (%AstValueArray*) @func484 (%AstValueArray* %15)
  br label %select_1_end
select_1_4:
  %17 = icmp eq %AstValueKind %4, 6
  br i1 %17, label %select_1_4_ok, label %select_1_5
select_1_4_ok:
  %18 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 2
  %19 = call %Value* (%AstValueRecord*) @func485 (%AstValueRecord* %18)
  br label %select_1_end
select_1_5:
  %20 = icmp eq %AstValueKind %4, 2
  br i1 %20, label %select_1_5_ok, label %select_1_6
select_1_5_ok:
  %21 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 4
  %22 = call %Value* (%AstValueString*) @func481 (%AstValueString* %21)
  br label %select_1_end
select_1_6:
  %23 = icmp eq %AstValueKind %4, 7
  br i1 %23, label %select_1_6_ok, label %select_1_7
select_1_6_ok:
  %24 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 7
  %25 = call %Value* (%AstValueUnary*) @func449 (%AstValueUnary* %24)
  br label %select_1_end
select_1_7:
  %26 = icmp eq %AstValueKind %4, 8
  br i1 %26, label %select_1_7_ok, label %select_1_8
select_1_7_ok:
  %27 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 7
  %28 = call %Value* (%AstValueUnary*) @func450 (%AstValueUnary* %27)
  br label %select_1_end
select_1_8:
  %29 = icmp eq %AstValueKind %4, 9
  br i1 %29, label %select_1_8_ok, label %select_1_9
select_1_8_ok:
  %30 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 7
  %31 = call %Value* (%AstValueUnary*) @func489 (%AstValueUnary* %30)
  br label %select_1_end
select_1_9:
  %32 = icmp eq %AstValueKind %4, 10
  br i1 %32, label %select_1_9_ok, label %select_1_10
select_1_9_ok:
  %33 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 7
  %34 = call %Value* (%AstValueUnary*) @func488 (%AstValueUnary* %33)
  br label %select_1_end
select_1_10:
  %35 = icmp eq %AstValueKind %4, 11
  br i1 %35, label %select_1_10_ok, label %select_1_11
select_1_10_ok:
  %36 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 7
  %37 = call %Value* (%AstValueUnary*) @func487 (%AstValueUnary* %36)
  br label %select_1_end
select_1_11:
  %38 = icmp eq %AstValueKind %4, 12
  br i1 %38, label %select_1_11_ok, label %select_1_12
select_1_11_ok:
  %39 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 8
  %40 = call %Value* (%ValueKind, %AstValueBinary*) @func451 (%ValueKind 18, %AstValueBinary* %39)
  br label %select_1_end
select_1_12:
  %41 = icmp eq %AstValueKind %4, 13
  br i1 %41, label %select_1_12_ok, label %select_1_13
select_1_12_ok:
  %42 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 8
  %43 = call %Value* (%ValueKind, %AstValueBinary*) @func451 (%ValueKind 19, %AstValueBinary* %42)
  br label %select_1_end
select_1_13:
  %44 = icmp eq %AstValueKind %4, 14
  br i1 %44, label %select_1_13_ok, label %select_1_14
select_1_13_ok:
  %45 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 8
  %46 = call %Value* (%ValueKind, %AstValueBinary*) @func451 (%ValueKind 20, %AstValueBinary* %45)
  br label %select_1_end
select_1_14:
  %47 = icmp eq %AstValueKind %4, 15
  br i1 %47, label %select_1_14_ok, label %select_1_15
select_1_14_ok:
  %48 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 8
  %49 = call %Value* (%ValueKind, %AstValueBinary*) @func451 (%ValueKind 21, %AstValueBinary* %48)
  br label %select_1_end
select_1_15:
  %50 = icmp eq %AstValueKind %4, 16
  br i1 %50, label %select_1_15_ok, label %select_1_16
select_1_15_ok:
  %51 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 8
  %52 = call %Value* (%ValueKind, %AstValueBinary*) @func451 (%ValueKind 22, %AstValueBinary* %51)
  br label %select_1_end
select_1_16:
  %53 = icmp eq %AstValueKind %4, 19
  br i1 %53, label %select_1_16_ok, label %select_1_17
select_1_16_ok:
  %54 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 8
  %55 = call %Value* (%ValueKind, %AstValueBinary*) @func451 (%ValueKind 25, %AstValueBinary* %54)
  br label %select_1_end
select_1_17:
  %56 = icmp eq %AstValueKind %4, 18
  br i1 %56, label %select_1_17_ok, label %select_1_18
select_1_17_ok:
  %57 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 8
  %58 = call %Value* (%ValueKind, %AstValueBinary*) @func451 (%ValueKind 24, %AstValueBinary* %57)
  br label %select_1_end
select_1_18:
  %59 = icmp eq %AstValueKind %4, 17
  br i1 %59, label %select_1_18_ok, label %select_1_19
select_1_18_ok:
  %60 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 8
  %61 = call %Value* (%ValueKind, %AstValueBinary*) @func451 (%ValueKind 23, %AstValueBinary* %60)
  br label %select_1_end
select_1_19:
  %62 = icmp eq %AstValueKind %4, 22
  br i1 %62, label %select_1_19_ok, label %select_1_20
select_1_19_ok:
  %63 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 8
  %64 = call %Value* (%ValueKind, %AstValueBinary*) @func451 (%ValueKind 28, %AstValueBinary* %63)
  br label %select_1_end
select_1_20:
  %65 = icmp eq %AstValueKind %4, 23
  br i1 %65, label %select_1_20_ok, label %select_1_21
select_1_20_ok:
  %66 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 8
  %67 = call %Value* (%ValueKind, %AstValueBinary*) @func451 (%ValueKind 29, %AstValueBinary* %66)
  br label %select_1_end
select_1_21:
  %68 = icmp eq %AstValueKind %4, 20
  br i1 %68, label %select_1_21_ok, label %select_1_22
select_1_21_ok:
  %69 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 8
  %70 = call %Value* (%ValueKind, %AstValueBinary*) @func451 (%ValueKind 26, %AstValueBinary* %69)
  br label %select_1_end
select_1_22:
  %71 = icmp eq %AstValueKind %4, 21
  br i1 %71, label %select_1_22_ok, label %select_1_23
select_1_22_ok:
  %72 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 8
  %73 = call %Value* (%ValueKind, %AstValueBinary*) @func451 (%ValueKind 27, %AstValueBinary* %72)
  br label %select_1_end
select_1_23:
  %74 = icmp eq %AstValueKind %4, 24
  br i1 %74, label %select_1_23_ok, label %select_1_24
select_1_23_ok:
  %75 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 8
  %76 = call %Value* (%ValueKind, %AstValueBinary*) @func451 (%ValueKind 30, %AstValueBinary* %75)
  br label %select_1_end
select_1_24:
  %77 = icmp eq %AstValueKind %4, 25
  br i1 %77, label %select_1_24_ok, label %select_1_25
select_1_24_ok:
  %78 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 8
  %79 = call %Value* (%ValueKind, %AstValueBinary*) @func451 (%ValueKind 31, %AstValueBinary* %78)
  br label %select_1_end
select_1_25:
  %80 = icmp eq %AstValueKind %4, 26
  br i1 %80, label %select_1_25_ok, label %select_1_26
select_1_25_ok:
  %81 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 8
  %82 = call %Value* (%ValueKind, %AstValueBinary*) @func490 (%ValueKind 33, %AstValueBinary* %81)
  br label %select_1_end
select_1_26:
  %83 = icmp eq %AstValueKind %4, 27
  br i1 %83, label %select_1_26_ok, label %select_1_27
select_1_26_ok:
  %84 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 8
  %85 = call %Value* (%ValueKind, %AstValueBinary*) @func490 (%ValueKind 34, %AstValueBinary* %84)
  br label %select_1_end
select_1_27:
  %86 = icmp eq %AstValueKind %4, 28
  br i1 %86, label %select_1_27_ok, label %select_1_28
select_1_27_ok:
  %87 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 9
  %88 = call %Value* (%AstValueCall*) @func452 (%AstValueCall* %87)
  br label %select_1_end
select_1_28:
  %89 = icmp eq %AstValueKind %4, 29
  br i1 %89, label %select_1_28_ok, label %select_1_29
select_1_28_ok:
  %90 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 10
  %91 = call %Value* (%AstValueIndex*) @func455 (%AstValueIndex* %90)
  br label %select_1_end
select_1_29:
  %92 = icmp eq %AstValueKind %4, 30
  br i1 %92, label %select_1_29_ok, label %select_1_30
select_1_29_ok:
  %93 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 11
  %94 = call %Value* (%AstValueAccess*) @func457 (%AstValueAccess* %93)
  br label %select_1_end
select_1_30:
  %95 = icmp eq %AstValueKind %4, 31
  br i1 %95, label %select_1_30_ok, label %select_1_31
select_1_30_ok:
  %96 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 12
  %97 = call %Value* (%AstValueCast*) @func473 (%AstValueCast* %96)
  br label %select_1_end
select_1_31:
  %98 = icmp eq %AstValueKind %4, 32
  br i1 %98, label %select_1_31_ok, label %select_1_32
select_1_31_ok:
  %99 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 13
  %100 = call %Value* (%AstValueIs*) @func475 (%AstValueIs* %99)
  br label %select_1_end
select_1_32:
  %101 = icmp eq %AstValueKind %4, 33
  br i1 %101, label %select_1_32_ok, label %select_1_33
select_1_32_ok:
  %102 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 14
  %103 = call %Value* (%AstValueAs*) @func476 (%AstValueAs* %102)
  br label %select_1_end
select_1_33:
  %104 = icmp eq %AstValueKind %4, 34
  br i1 %104, label %select_1_33_ok, label %select_1_34
select_1_33_ok:
  %105 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 16
  %106 = call %Value* (%AstValueSizeof*) @func477 (%AstValueSizeof* %105)
  br label %select_1_end
select_1_34:
  %107 = icmp eq %AstValueKind %4, 35
  br i1 %107, label %select_1_34_ok, label %select_1_35
select_1_34_ok:
  %108 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 17
  %109 = call %Value* (%AstValueAlignof*) @func478 (%AstValueAlignof* %108)
  br label %select_1_end
select_1_35:
  %110 = icmp eq %AstValueKind %4, 36
  br i1 %110, label %select_1_35_ok, label %select_1_36
select_1_35_ok:
  %111 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 15
  %112 = call %Value* (%AstValueWhen*) @func447 (%AstValueWhen* %111)
  br label %select_1_end
select_1_36:
  %113 = icmp eq %AstValueKind %4, 0
  br i1 %113, label %select_1_36_ok, label %select_1_37
select_1_36_ok:
  %114 = call %Value* (%AstValue*) @func446 (%AstValue* %0)
  br label %select_1_end
select_1_37:
  %115 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 19
  %116 = load %TokenInfo*, %TokenInfo** %115
  %117 = call %Value* (%TokenInfo*) @value_new_poison (%TokenInfo* %116)
  br label %select_1_end
select_1_end:
  %118 = phi %Value* [ %7, %select_1_0_ok ], [ %10, %select_1_1_ok ], [ %13, %select_1_2_ok ], [ %16, %select_1_3_ok ], [ %19, %select_1_4_ok ], [ %22, %select_1_5_ok ], [ %25, %select_1_6_ok ], [ %28, %select_1_7_ok ], [ %31, %select_1_8_ok ], [ %34, %select_1_9_ok ], [ %37, %select_1_10_ok ], [ %40, %select_1_11_ok ], [ %43, %select_1_12_ok ], [ %46, %select_1_13_ok ], [ %49, %select_1_14_ok ], [ %52, %select_1_15_ok ], [ %55, %select_1_16_ok ], [ %58, %select_1_17_ok ], [ %61, %select_1_18_ok ], [ %64, %select_1_19_ok ], [ %67, %select_1_20_ok ], [ %70, %select_1_21_ok ], [ %73, %select_1_22_ok ], [ %76, %select_1_23_ok ], [ %79, %select_1_24_ok ], [ %82, %select_1_25_ok ], [ %85, %select_1_26_ok ], [ %88, %select_1_27_ok ], [ %91, %select_1_28_ok ], [ %94, %select_1_29_ok ], [ %97, %select_1_30_ok ], [ %100, %select_1_31_ok ], [ %103, %select_1_32_ok ], [ %106, %select_1_33_ok ], [ %109, %select_1_34_ok ], [ %112, %select_1_35_ok ], [ %114, %select_1_36_ok ], [ %117, %select_1_37 ]
;stmt1:; loadImmPtr
  %119 = inttoptr i64 0 to%Value*
  %120 = icmp ne %Value* %118, %119
  %121 = bitcast [20 x %Nat8]* @func443_str1 to %Str
  call void (i1, %Str) @assert (i1 %120, %Str %121)
;stmt2:
  %122 = getelementptr inbounds %Value, %Value* %118, i1 0, i32 0
  %123 = load %ValueKind, %ValueKind* %122
  %124 = icmp eq %ValueKind %123, 1
  br i1 %124, label %then_0, label %else_0
then_0:
;stmt3:
  ret %Value* %118
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt4:
  br label %select_2_0
select_2_0:
  %126 = icmp eq i1 %1, 1
  br i1 %126, label %select_2_0_ok, label %select_2_1
select_2_0_ok:
  %127 = call %Value* (%Value*) @dold (%Value* %118)
  br label %select_2_end
select_2_1:
  br label %select_2_end
select_2_end:
  %128 = phi %Value* [ %127, %select_2_0_ok ], [ %118, %select_2_1 ]
  ret %Value* %128
}

define %Value* @func445 (%AstValue*) {
;stmt0:
  %2 = bitcast [15 x %Nat8]* @func444_func445_str1 to %Str
  %3 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 19
  %4 = load %TokenInfo*, %TokenInfo** %3
  call void (%Str, %TokenInfo*) @error (%Str %2, %TokenInfo* %4)
;stmt1:
  %5 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 19
  %6 = load %TokenInfo*, %TokenInfo** %5
  %7 = call %Value* (%TokenInfo*) @value_new_poison (%TokenInfo* %6)
  ret %Value* %7
}

define %Value* @func444 (%AstValue*) {
;stmt0:
  %2 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 0
  %3 = load %AstValueKind, %AstValueKind* %2
  br label %select_1_0
select_1_0:
  %4 = icmp eq %AstValueKind %3, 3
  br i1 %4, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %5 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 1
  %6 = call %Value* (%AstName*) @func479 (%AstName* %5)
  br label %select_1_end
select_1_1:
  %7 = icmp eq %AstValueKind %3, 8
  br i1 %7, label %select_1_1_ok, label %select_1_2
select_1_1_ok:
  %8 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 7
  %9 = call %Value* (%AstValueUnary*) @func450 (%AstValueUnary* %8)
  br label %select_1_end
select_1_2:
  %10 = icmp eq %AstValueKind %3, 29
  br i1 %10, label %select_1_2_ok, label %select_1_3
select_1_2_ok:
  %11 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 10
  %12 = call %Value* (%AstValueIndex*) @func455 (%AstValueIndex* %11)
  br label %select_1_end
select_1_3:
  %13 = icmp eq %AstValueKind %3, 30
  br i1 %13, label %select_1_3_ok, label %select_1_4
select_1_3_ok:
  %14 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 11
  %15 = call %Value* (%AstValueAccess*) @func457 (%AstValueAccess* %14)
  br label %select_1_end
select_1_4:
  %16 = call %Value* (%AstValue*) @func445 (%AstValue* %0)
  br label %select_1_end
select_1_end:
  %17 = phi %Value* [ %6, %select_1_0_ok ], [ %9, %select_1_1_ok ], [ %12, %select_1_2_ok ], [ %15, %select_1_3_ok ], [ %16, %select_1_4 ]
  ret %Value* %17
}

define %Value* @func446 (%AstValue*) {
;stmt0:
  %2 = bitcast [19 x %Nat8]* @func446_str1 to %Str
  %3 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 19
  %4 = load %TokenInfo*, %TokenInfo** %3
  call void (%Str, %TokenInfo*) @error (%Str %2, %TokenInfo* %4)
;stmt1:
  %5 = bitcast [6 x %Nat8]* @func446_str2 to %Str
  call void (%Str) @fatal (%Str %5)
;stmt2:
  %6 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 19
  %7 = load %TokenInfo*, %TokenInfo** %6
  %8 = call %Value* (%TokenInfo*) @value_new_poison (%TokenInfo* %7)
  ret %Value* %8
}

define void @func448 (%Unit*, %Unit*, %Nat32, %Node*) {
;stmt0:
  %5 = bitcast %Unit* %0 to %AstValueWhenVariant*
;stmt1:
  %6 = bitcast %Unit* %1 to %func447.type9*
;stmt2:
  %7 = getelementptr inbounds %AstValueWhenVariant, %AstValueWhenVariant* %5, i1 0, i32 1
  %8 = load %AstValue*, %AstValue** %7; loadImmPtr
  %9 = inttoptr i64 0 to%AstValue*
  %10 = icmp ne %AstValue* %8, %9
  br i1 %10, label %then_0, label %else_0
then_0:
;stmt3:
  %11 = getelementptr inbounds %AstValueWhenVariant, %AstValueWhenVariant* %5, i1 0, i32 1
  %12 = load %AstValue*, %AstValue** %11
  %13 = call %Value* (%AstValue*) @func442 (%AstValue* %12)
  %14 = getelementptr inbounds %func447.type9, %func447.type9* %6, i1 0, i32 0
  %15 = load %Value*, %Value** %14
  %16 = getelementptr inbounds %Value, %Value* %15, i1 0, i32 1
  %17 = load %Type*, %Type** %16
  %18 = call %Value* (%Value*, %Type*) @func497 (%Value* %13, %Type* %17)
;stmt4:
  %19 = getelementptr inbounds %AstValueWhenVariant, %AstValueWhenVariant* %5, i1 0, i32 2
  %20 = load %AstValue*, %AstValue** %19
  %21 = call %Value* (%AstValue*) @func442 (%AstValue* %20)
;stmt5:
  %22 = getelementptr inbounds %func447.type9, %func447.type9* %6, i1 0, i32 1
  %23 = load %Type*, %Type** %22
  br label %select_1_0
select_1_0:; loadImmPtr
  %24 = inttoptr i64 0 to%Type*
  %25 = icmp eq %Type* %23, %24
  br i1 %25, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  br label %select_1_end
select_1_1:
  %26 = getelementptr inbounds %func447.type9, %func447.type9* %6, i1 0, i32 1
  %27 = load %Type*, %Type** %26
  %28 = call %Value* (%Value*, %Type*) @func497 (%Value* %21, %Type* %27)
  br label %select_1_end
select_1_end:
  %29 = phi %Value* [ %21, %select_1_0_ok ], [ %28, %select_1_1 ]
;stmt6:
  %30 = getelementptr inbounds %func447.type9, %func447.type9* %6, i1 0, i32 1
  %31 = load %Type*, %Type** %30; loadImmPtr
  %32 = inttoptr i64 0 to%Type*
  %33 = icmp eq %Type* %31, %32
  br i1 %33, label %then_1, label %else_1
then_1:
;stmt7:
  %34 = getelementptr inbounds %func447.type9, %func447.type9* %6, i1 0, i32 1
  %35 = getelementptr inbounds %Value, %Value* %29, i1 0, i32 1
  %36 = load %Type*, %Type** %35
  store %Type* %36, %Type** %34, align 8
  br label %endif_1
else_1:
;stmt8:
  %37 = getelementptr inbounds %func447.type9, %func447.type9* %6, i1 0, i32 1
  %38 = load %Type*, %Type** %37
  %39 = getelementptr inbounds %Value, %Value* %29, i1 0, i32 1
  %40 = load %Type*, %Type** %39
  %41 = getelementptr inbounds %Value, %Value* %29, i1 0, i32 19
  %42 = load %TokenInfo*, %TokenInfo** %41
  %43 = call i1 (%Type*, %Type*, %TokenInfo*) @type_check (%Type* %38, %Type* %40, %TokenInfo* %42)
  %44 = xor i1 %43, 1
  br i1 %44, label %then_2, label %else_2
then_2:
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
  br label %endif_1
endif_1:
;stmt9:
  %45 = getelementptr inbounds %func447.type9, %func447.type9* %6, i1 0, i32 0
  %46 = load %Value*, %Value** %45
  %47 = getelementptr inbounds %Value, %Value* %46, i1 0, i32 1
  %48 = load %Type*, %Type** %47
  %49 = getelementptr inbounds %Value, %Value* %18, i1 0, i32 1
  %50 = load %Type*, %Type** %49
  %51 = getelementptr inbounds %Value, %Value* %18, i1 0, i32 19
  %52 = load %TokenInfo*, %TokenInfo** %51
  %53 = call i1 (%Type*, %Type*, %TokenInfo*) @type_check (%Type* %48, %Type* %50, %TokenInfo* %52)
  %54 = xor i1 %53, 1
  br i1 %54, label %then_3, label %else_3
then_3:
  br label %endif_3
else_3:
  br label %endif_3
endif_3:
;stmt10:
  %55 = call %Unit* (%Nat32) @malloc (%Nat32 32)
  %56 = bitcast %Unit* %55 to %ValueWhenVariant*
;stmt11:
  %57 = insertvalue %ValueWhenVariant zeroinitializer, %Value* %18, 1
  %58 = insertvalue %ValueWhenVariant %57, %Value* %29, 2
  %59 = getelementptr inbounds %AstValueWhenVariant, %AstValueWhenVariant* %5, i1 0, i32 3
  %60 = load %TokenInfo*, %TokenInfo** %59
  %61 = insertvalue %ValueWhenVariant %58, %TokenInfo* %60, 3
  store %ValueWhenVariant %61, %ValueWhenVariant* %56, align 8
;stmt12:
  %62 = getelementptr inbounds %func447.type9, %func447.type9* %6, i1 0, i32 2
  %63 = bitcast %ValueWhenVariant* %56 to %Unit*
  %64 = call i1 (%List*, %Unit*) @list_append (%List* %62, %Unit* %63)
  br label %endif_0
else_0:
;stmt13:
  %65 = getelementptr inbounds %AstValueWhenVariant, %AstValueWhenVariant* %5, i1 0, i32 0
  %66 = load %AstType*, %AstType** %65
  %67 = call %Type* (%AstType*) @func400 (%AstType* %66)
;stmt14:
  %68 = getelementptr inbounds %func447.type9, %func447.type9* %6, i1 0, i32 0
  %69 = load %Value*, %Value** %68
  %70 = getelementptr inbounds %Value, %Value* %69, i1 0, i32 1
  %71 = load %Type*, %Type** %70
  %72 = getelementptr inbounds %Type, %Type* %71, i1 0, i32 0
  %73 = load %TypeKind, %TypeKind* %72
  %74 = icmp ne %TypeKind %73, 14
  br i1 %74, label %then_4, label %else_4
then_4:
;stmt15:
  %75 = bitcast [31 x %Nat8]* @func447_func448_str1 to %Str
  %76 = getelementptr inbounds %func447.type9, %func447.type9* %6, i1 0, i32 0
  %77 = load %Value*, %Value** %76
  %78 = getelementptr inbounds %Value, %Value* %77, i1 0, i32 19
  %79 = load %TokenInfo*, %TokenInfo** %78
  call void (%Str, %TokenInfo*) @error (%Str %75, %TokenInfo* %79)
  br label %endif_4
else_4:
  br label %endif_4
endif_4:
;stmt16:
  %80 = getelementptr inbounds %func447.type9, %func447.type9* %6, i1 0, i32 0
  %81 = load %Value*, %Value** %80
  %82 = getelementptr inbounds %Value, %Value* %81, i1 0, i32 1
  %83 = load %Type*, %Type** %82
  %84 = getelementptr inbounds %Type, %Type* %83, i1 0, i32 13
  %85 = getelementptr inbounds %TypeUnion, %TypeUnion* %84, i1 0, i32 0
  %86 = call i1 (%List*, %Type*) @func158 (%List* %85, %Type* %67)
  %87 = xor i1 %86, 1
  br i1 %87, label %then_5, label %else_5
then_5:
;stmt17:
  %88 = bitcast [11 x %Nat8]* @func447_func448_str2 to %Str
  %89 = getelementptr inbounds %Type, %Type* %67, i1 0, i32 14
  %90 = load %TokenInfo*, %TokenInfo** %89
  call void (%Str, %TokenInfo*) @error (%Str %88, %TokenInfo* %90)
  br label %endif_5
else_5:
  br label %endif_5
endif_5:
;stmt18:
  %91 = getelementptr inbounds %AstValueWhenVariant, %AstValueWhenVariant* %5, i1 0, i32 2
  %92 = load %AstValue*, %AstValue** %91
  %93 = call %Value* (%AstValue*) @func442 (%AstValue* %92)
;stmt19:
  %94 = getelementptr inbounds %func447.type9, %func447.type9* %6, i1 0, i32 1
  %95 = load %Type*, %Type** %94; loadImmPtr
  %96 = inttoptr i64 0 to%Type*
  %97 = icmp eq %Type* %95, %96
  br i1 %97, label %then_6, label %else_6
then_6:
;stmt20:
  %98 = getelementptr inbounds %func447.type9, %func447.type9* %6, i1 0, i32 1
  %99 = getelementptr inbounds %Value, %Value* %93, i1 0, i32 1
  %100 = load %Type*, %Type** %99
  store %Type* %100, %Type** %98, align 8
  br label %endif_6
else_6:
;stmt21:
  %101 = getelementptr inbounds %Value, %Value* %93, i1 0, i32 1
  %102 = load %Type*, %Type** %101
  %103 = getelementptr inbounds %func447.type9, %func447.type9* %6, i1 0, i32 1
  %104 = load %Type*, %Type** %103
  %105 = getelementptr inbounds %Value, %Value* %93, i1 0, i32 19
  %106 = load %TokenInfo*, %TokenInfo** %105
  %107 = call i1 (%Type*, %Type*, %TokenInfo*) @type_check (%Type* %102, %Type* %104, %TokenInfo* %106)
  %108 = xor i1 %107, 1
  br i1 %108, label %then_7, label %else_7
then_7:
  br label %endif_7
else_7:
  br label %endif_7
endif_7:
  br label %endif_6
endif_6:
;stmt22:
  %109 = getelementptr inbounds %func447.type9, %func447.type9* %6, i1 0, i32 1
  %110 = load %Type*, %Type** %109
  br label %select_2_0
select_2_0:; loadImmPtr
  %111 = inttoptr i64 0 to%Type*
  %112 = icmp eq %Type* %110, %111
  br i1 %112, label %select_2_0_ok, label %select_2_1
select_2_0_ok:
  br label %select_2_end
select_2_1:
  %113 = getelementptr inbounds %func447.type9, %func447.type9* %6, i1 0, i32 1
  %114 = load %Type*, %Type** %113
  %115 = call %Value* (%Value*, %Type*) @func497 (%Value* %93, %Type* %114)
  br label %select_2_end
select_2_end:
  %116 = phi %Value* [ %93, %select_2_0_ok ], [ %115, %select_2_1 ]
;stmt23:
  %117 = load %Type*, %Type** @typeBool
  %118 = getelementptr inbounds %Type, %Type* %67, i1 0, i32 14
  %119 = load %TokenInfo*, %TokenInfo** %118
  %120 = call %Value* (%ValueKind, %Type*, %TokenInfo*) @func437 (%ValueKind 39, %Type* %117, %TokenInfo* %119)
;stmt24:
  %121 = getelementptr inbounds %func447.type9, %func447.type9* %6, i1 0, i32 0
  %122 = load %Value*, %Value** %121
  %123 = getelementptr inbounds %Value, %Value* %122, i1 0, i32 1
  %124 = load %Type*, %Type** %123
  %125 = call %Nat32 (%Type*, %Type*) @func432 (%Type* %124, %Type* %67)
;stmt25:
  %126 = getelementptr inbounds %Value, %Value* %120, i1 0, i32 16
  %127 = load %Type*, %Type** @typeBool
  %128 = insertvalue %ValueIs zeroinitializer, %Type* %127, 0
  %129 = getelementptr inbounds %func447.type9, %func447.type9* %6, i1 0, i32 0
  %130 = load %Value*, %Value** %129
  %131 = insertvalue %ValueIs %128, %Value* %130, 1
  %132 = insertvalue %ValueIs %131, %Nat32 %125, 2
  %133 = getelementptr inbounds %Type, %Type* %67, i1 0, i32 14
  %134 = load %TokenInfo*, %TokenInfo** %133
  %135 = insertvalue %ValueIs %132, %TokenInfo* %134, 3
  store %ValueIs %135, %ValueIs* %126, align 8
;stmt26:
  %136 = call %Unit* (%Nat32) @malloc (%Nat32 32)
  %137 = bitcast %Unit* %136 to %ValueWhenVariant*
;stmt27:
  %138 = insertvalue %ValueWhenVariant zeroinitializer, %Value* %120, 1
  %139 = insertvalue %ValueWhenVariant %138, %Value* %116, 2
  %140 = getelementptr inbounds %AstValueWhenVariant, %AstValueWhenVariant* %5, i1 0, i32 3
  %141 = load %TokenInfo*, %TokenInfo** %140
  %142 = insertvalue %ValueWhenVariant %139, %TokenInfo* %141, 3
  store %ValueWhenVariant %142, %ValueWhenVariant* %137, align 8
;stmt28:
  %143 = getelementptr inbounds %func447.type9, %func447.type9* %6, i1 0, i32 2
  %144 = bitcast %ValueWhenVariant* %137 to %Unit*
  %145 = call i1 (%List*, %Unit*) @list_append (%List* %143, %Unit* %144)
  br label %endif_0
endif_0:
  ret void
}

define %Value* @func447 (%AstValueWhen*) {
;stmt0:
  %2 = getelementptr inbounds %AstValueWhen, %AstValueWhen* %0, i1 0, i32 0
  %3 = load %AstValue*, %AstValue** %2
  %4 = call %Value* (%AstValue*) @func442 (%AstValue* %3)
;stmt1:
  %5 = alloca %func447.type9
  %6 = insertvalue %func447.type9 zeroinitializer, %Value* %4, 0
  store %func447.type9 %6, %func447.type9* %5, align 8
;stmt2:
  %7 = getelementptr inbounds %AstValueWhen, %AstValueWhen* %0, i1 0, i32 1
  %8 = getelementptr inbounds %func447.type9, %func447.type9* %5, i1 0
  %9 = bitcast %func447.type9* %8 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @func64 (%List* %7, %ListForeachHandler @func448, %Unit* %9)
;stmt3:
  %10 = getelementptr inbounds %AstValueWhen, %AstValueWhen* %0, i1 0, i32 2
  %11 = load %AstValue*, %AstValue** %10; loadImmPtr
  %12 = inttoptr i64 0 to%AstValue*
  %13 = icmp eq %AstValue* %11, %12
  br i1 %13, label %then_0, label %else_0
then_0:
;stmt4:
  %14 = bitcast [25 x %Nat8]* @func447_str1 to %Str
  %15 = getelementptr inbounds %AstValueWhen, %AstValueWhen* %0, i1 0, i32 3
  %16 = load %TokenInfo*, %TokenInfo** %15
  call void (%Str, %TokenInfo*) @error (%Str %14, %TokenInfo* %16)
;stmt5:
  %17 = getelementptr inbounds %AstValueWhen, %AstValueWhen* %0, i1 0, i32 3
  %18 = load %TokenInfo*, %TokenInfo** %17
  %19 = call %Value* (%TokenInfo*) @value_new_poison (%TokenInfo* %18)
  ret %Value* %19
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt6:
  %21 = getelementptr inbounds %AstValueWhen, %AstValueWhen* %0, i1 0, i32 2
  %22 = load %AstValue*, %AstValue** %21
  %23 = call %Value* (%AstValue*) @func442 (%AstValue* %22)
  %24 = getelementptr inbounds %func447.type9, %func447.type9* %5, i1 0, i32 1
  %25 = load %Type*, %Type** %24
  %26 = call %Value* (%Value*, %Type*) @func497 (%Value* %23, %Type* %25)
;stmt7:
  %27 = getelementptr inbounds %func447.type9, %func447.type9* %5, i1 0, i32 1
  %28 = load %Type*, %Type** %27
  %29 = getelementptr inbounds %AstValueWhen, %AstValueWhen* %0, i1 0, i32 3
  %30 = load %TokenInfo*, %TokenInfo** %29
  %31 = call %Value* (%ValueKind, %Type*, %TokenInfo*) @func437 (%ValueKind 41, %Type* %28, %TokenInfo* %30)
;stmt8:
  %32 = getelementptr inbounds %Value, %Value* %31, i1 0, i32 18
  %33 = insertvalue %ValueWhen zeroinitializer, %Value* %4, 1
  %34 = getelementptr inbounds %func447.type9, %func447.type9* %5, i1 0, i32 2
  %35 = load %List, %List* %34
  %36 = insertvalue %ValueWhen %33, %List %35, 2
  %37 = insertvalue %ValueWhen %36, %Value* %26, 3
  %38 = getelementptr inbounds %func447.type9, %func447.type9* %5, i1 0, i32 1
  %39 = load %Type*, %Type** %38
  %40 = insertvalue %ValueWhen %37, %Type* %39, 0
  %41 = getelementptr inbounds %AstValueWhen, %AstValueWhen* %0, i1 0, i32 3
  %42 = load %TokenInfo*, %TokenInfo** %41
  %43 = insertvalue %ValueWhen %40, %TokenInfo* %42, 4
  store %ValueWhen %43, %ValueWhen* %32, align 8
;stmt9:
  ret %Value* %31
}

define %Value* @func449 (%AstValueUnary*) {
;stmt0:
  %2 = getelementptr inbounds %AstValueUnary, %AstValueUnary* %0, i1 0, i32 1
  %3 = load %AstValue*, %AstValue** %2
  %4 = call %Value* (%AstValue*) @func442 (%AstValue* %3)
;stmt1:
  %5 = getelementptr inbounds %Value, %Value* %4, i1 0, i32 0
  %6 = load %ValueKind, %ValueKind* %5
  %7 = icmp eq %ValueKind %6, 1
  br i1 %7, label %then_0, label %else_0
then_0:
;stmt2:
  ret %Value* %4
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt3:
  %9 = getelementptr inbounds %Value, %Value* %4, i1 0, i32 1
  %10 = getelementptr inbounds %Value, %Value* %4, i1 0, i32 1
  %11 = load %Type*, %Type** %10
  %12 = getelementptr inbounds %Type, %Type* %11, i1 0, i32 0
  %13 = load %TypeKind, %TypeKind* %12
  br label %select_1_0
select_1_0:
  %14 = icmp eq %TypeKind %13, 6
  br i1 %14, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %15 = getelementptr inbounds %Value, %Value* %4, i1 0, i32 1
  %16 = load %Type*, %Type** %15
  %17 = getelementptr inbounds %Type, %Type* %16, i1 0, i32 12
  %18 = getelementptr inbounds %TypeVar, %TypeVar* %17, i1 0, i32 0
  %19 = load %Type*, %Type** %18
  br label %select_1_end
select_1_1:
  %20 = getelementptr inbounds %Value, %Value* %4, i1 0, i32 1
  %21 = load %Type*, %Type** %20
  br label %select_1_end
select_1_end:
  %22 = phi %Type* [ %19, %select_1_0_ok ], [ %21, %select_1_1 ]
  store %Type* %22, %Type** %9, align 8
;stmt4:
  %23 = getelementptr inbounds %Value, %Value* %4, i1 0, i32 0
  %24 = load %ValueKind, %ValueKind* %23
  %25 = icmp eq %ValueKind %24, 1
  br i1 %25, label %then_1, label %else_1
then_1:
;stmt5:
  ret %Value* %4
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt6:
  %27 = getelementptr inbounds %Value, %Value* %4, i1 0, i32 1
  %28 = load %Type*, %Type** %27
  %29 = getelementptr inbounds %AstValueUnary, %AstValueUnary* %0, i1 0, i32 2
  %30 = load %TokenInfo*, %TokenInfo** %29
  %31 = call %Type* (%Type*, %TokenInfo*) @func382 (%Type* %28, %TokenInfo* %30)
;stmt7:
  %32 = getelementptr inbounds %AstValueUnary, %AstValueUnary* %0, i1 0, i32 2
  %33 = load %TokenInfo*, %TokenInfo** %32
  %34 = call %Value* (%ValueKind, %Type*, %TokenInfo*) @func437 (%ValueKind 13, %Type* %31, %TokenInfo* %33)
;stmt8:
  %35 = getelementptr inbounds %Value, %Value* %34, i1 0, i32 10
  %36 = insertvalue %ValueUn zeroinitializer, %Type* %31, 0
  %37 = insertvalue %ValueUn %36, %Value* %4, 1
  %38 = getelementptr inbounds %AstValueUnary, %AstValueUnary* %0, i1 0, i32 2
  %39 = load %TokenInfo*, %TokenInfo** %38
  %40 = insertvalue %ValueUn %37, %TokenInfo* %39, 2
  store %ValueUn %40, %ValueUn* %35, align 8
;stmt9:
  ret %Value* %34
}

define %Value* @func450 (%AstValueUnary*) {
;stmt0:
  %2 = getelementptr inbounds %AstValueUnary, %AstValueUnary* %0, i1 0, i32 1
  %3 = load %AstValue*, %AstValue** %2
  %4 = call %Value* (%AstValue*) @func442 (%AstValue* %3)
;stmt1:
  %5 = getelementptr inbounds %Value, %Value* %4, i1 0, i32 0
  %6 = load %ValueKind, %ValueKind* %5
  %7 = icmp eq %ValueKind %6, 1
  br i1 %7, label %then_0, label %else_0
then_0:
;stmt2:
  ret %Value* %4
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt3:
  %9 = getelementptr inbounds %Value, %Value* %4, i1 0, i32 1
  %10 = load %Type*, %Type** %9
  %11 = getelementptr inbounds %Type, %Type* %10, i1 0, i32 0
  %12 = load %TypeKind, %TypeKind* %11
  %13 = icmp ne %TypeKind %12, 11
  br i1 %13, label %then_1, label %else_1
then_1:
;stmt4:
  %14 = bitcast [17 x %Nat8]* @func450_str1 to %Str
  %15 = getelementptr inbounds %Value, %Value* %4, i1 0, i32 19
  %16 = load %TokenInfo*, %TokenInfo** %15
  call void (%Str, %TokenInfo*) @error (%Str %14, %TokenInfo* %16)
;stmt5:
  %17 = getelementptr inbounds %AstValueUnary, %AstValueUnary* %0, i1 0, i32 2
  %18 = load %TokenInfo*, %TokenInfo** %17
  %19 = call %Value* (%TokenInfo*) @value_new_poison (%TokenInfo* %18)
  ret %Value* %19
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt6:
  %21 = getelementptr inbounds %Value, %Value* %4, i1 0, i32 1
  %22 = load %Type*, %Type** %21
  %23 = getelementptr inbounds %Type, %Type* %22, i1 0, i32 7
  %24 = getelementptr inbounds %TypePointer, %TypePointer* %23, i1 0, i32 0
  %25 = load %Type*, %Type** %24
;stmt7:
  %26 = getelementptr inbounds %AstValueUnary, %AstValueUnary* %0, i1 0, i32 2
  %27 = load %TokenInfo*, %TokenInfo** %26
  %28 = call %Value* (%ValueKind, %Type*, %TokenInfo*) @func437 (%ValueKind 14, %Type* %25, %TokenInfo* %27)
;stmt8:
  %29 = getelementptr inbounds %Value, %Value* %28, i1 0, i32 10
  %30 = insertvalue %ValueUn zeroinitializer, %Type* %25, 0
  %31 = insertvalue %ValueUn %30, %Value* %4, 1
  %32 = getelementptr inbounds %AstValueUnary, %AstValueUnary* %0, i1 0, i32 2
  %33 = load %TokenInfo*, %TokenInfo** %32
  %34 = insertvalue %ValueUn %31, %TokenInfo* %33, 2
  store %ValueUn %34, %ValueUn* %29, align 8
;stmt9:
  ret %Value* %28
}

define %Value* @func451 (%ValueKind, %AstValueBinary*) {
;stmt0:
  %3 = getelementptr inbounds %AstValueBinary, %AstValueBinary* %1, i1 0, i32 1
  %4 = load %AstValue*, %AstValue** %3
  %5 = call %Value* (%AstValue*) @func442 (%AstValue* %4)
;stmt1:
  %6 = getelementptr inbounds %AstValueBinary, %AstValueBinary* %1, i1 0, i32 2
  %7 = load %AstValue*, %AstValue** %6
  %8 = call %Value* (%AstValue*) @func442 (%AstValue* %7)
;stmt2:
  %9 = getelementptr inbounds %Value, %Value* %5, i1 0, i32 0
  %10 = load %ValueKind, %ValueKind* %9
  %11 = icmp eq %ValueKind %10, 1
  br i1 %11, label %then_0, label %else_0
then_0:
;stmt3:
  ret %Value* %5
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt4:
  %13 = getelementptr inbounds %Value, %Value* %8, i1 0, i32 0
  %14 = load %ValueKind, %ValueKind* %13
  %15 = icmp eq %ValueKind %14, 1
  br i1 %15, label %then_1, label %else_1
then_1:
;stmt5:
  ret %Value* %8
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt6:
  %17 = getelementptr inbounds %Value, %Value* %8, i1 0, i32 1
  %18 = load %Type*, %Type** %17
  %19 = call %Value* (%Value*, %Type*) @func497 (%Value* %5, %Type* %18)
;stmt7:
  %20 = getelementptr inbounds %Value, %Value* %19, i1 0, i32 1
  %21 = load %Type*, %Type** %20
  %22 = call %Value* (%Value*, %Type*) @func497 (%Value* %8, %Type* %21)
;stmt8:
  %23 = getelementptr inbounds %Value, %Value* %19, i1 0, i32 1
  %24 = load %Type*, %Type** %23
  %25 = getelementptr inbounds %Value, %Value* %22, i1 0, i32 1
  %26 = load %Type*, %Type** %25
  %27 = getelementptr inbounds %AstValueBinary, %AstValueBinary* %1, i1 0, i32 3
  %28 = load %TokenInfo*, %TokenInfo** %27
  %29 = call i1 (%Type*, %Type*, %TokenInfo*) @type_check (%Type* %24, %Type* %26, %TokenInfo* %28)
  %30 = xor i1 %29, 1
  br i1 %30, label %then_2, label %else_2
then_2:
;stmt9:
  br label %fail
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
;stmt10:
  %32 = getelementptr inbounds %Value, %Value* %19, i1 0, i32 1
  %33 = load %Type*, %Type** %32
  %34 = call i1 (%ValueKind, %Type*) @func491 (%ValueKind %0, %Type* %33)
  %35 = xor i1 %34, 1
  br i1 %35, label %then_3, label %else_3
then_3:
;stmt11:
  %36 = bitcast [18 x %Nat8]* @func451_str1 to %Str
  %37 = getelementptr inbounds %AstValueBinary, %AstValueBinary* %1, i1 0, i32 3
  %38 = load %TokenInfo*, %TokenInfo** %37
  call void (%Str, %TokenInfo*) @error (%Str %36, %TokenInfo* %38)
;stmt12:
  br label %fail
  br label %endif_3
else_3:
  br label %endif_3
endif_3:
;stmt13:
  %40 = call i1 (%ValueKind) @func501 (%ValueKind %0)
  br label %select_1_0
select_1_0:
  %41 = icmp eq i1 %40, 1
  br i1 %41, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %42 = load %Type*, %Type** @typeBool
  br label %select_1_end
select_1_1:
  %43 = getelementptr inbounds %Value, %Value* %19, i1 0, i32 1
  %44 = load %Type*, %Type** %43
  br label %select_1_end
select_1_end:
  %45 = phi %Type* [ %42, %select_1_0_ok ], [ %44, %select_1_1 ]
;stmt14:
  %46 = call i1 (%Value*) @is_value_imm_num (%Value* %19)
  %47 = call i1 (%Value*) @is_value_imm_num (%Value* %22)
  %48 = and i1 %46, %47
  br i1 %48, label %then_4, label %else_4
then_4:
;stmt15:
  %49 = getelementptr inbounds %Value, %Value* %19, i1 0, i32 2
  %50 = getelementptr inbounds %ValueImm, %ValueImm* %49, i1 0, i32 1
  %51 = load %Int64, %Int64* %50
;stmt16:
  %52 = getelementptr inbounds %Value, %Value* %22, i1 0, i32 2
  %53 = getelementptr inbounds %ValueImm, %ValueImm* %52, i1 0, i32 1
  %54 = load %Int64, %Int64* %53
;stmt17:
  br label %select_2_0
select_2_0:
  %55 = icmp eq %ValueKind %0, 18
  br i1 %55, label %select_2_0_ok, label %select_2_1
select_2_0_ok:
  %56 = add %Int64 %51, %54
  br label %select_2_end
select_2_1:
  %57 = icmp eq %ValueKind %0, 19
  br i1 %57, label %select_2_1_ok, label %select_2_2
select_2_1_ok:
  %58 = sub %Int64 %51, %54
  br label %select_2_end
select_2_2:
  %59 = icmp eq %ValueKind %0, 20
  br i1 %59, label %select_2_2_ok, label %select_2_3
select_2_2_ok:
  %60 = mul %Int64 %51, %54
  br label %select_2_end
select_2_3:
  %61 = icmp eq %ValueKind %0, 21
  br i1 %61, label %select_2_3_ok, label %select_2_4
select_2_3_ok:
  %62 = sdiv %Int64 %51, %54
  br label %select_2_end
select_2_4:
  %63 = icmp eq %ValueKind %0, 22
  br i1 %63, label %select_2_4_ok, label %select_2_5
select_2_4_ok:
  %64 = srem %Int64 %51, %54
  br label %select_2_end
select_2_5:
  %65 = icmp eq %ValueKind %0, 23
  br i1 %65, label %select_2_5_ok, label %select_2_6
select_2_5_ok:
  %66 = or %Int64 %51, %54
  br label %select_2_end
select_2_6:
  %67 = icmp eq %ValueKind %0, 24
  br i1 %67, label %select_2_6_ok, label %select_2_7
select_2_6_ok:
  %68 = xor %Int64 %51, %54
  br label %select_2_end
select_2_7:
  %69 = icmp eq %ValueKind %0, 25
  br i1 %69, label %select_2_7_ok, label %select_2_8
select_2_7_ok:
  %70 = and %Int64 %51, %54
  br label %select_2_end
select_2_8:
  %71 = icmp eq %ValueKind %0, 26
  br i1 %71, label %select_2_8_ok, label %select_2_9
select_2_8_ok:
  %72 = icmp eq %Int64 %51, %54
  %73 = zext i1 %72 to %Int64
  br label %select_2_end
select_2_9:
  %74 = icmp eq %ValueKind %0, 27
  br i1 %74, label %select_2_9_ok, label %select_2_10
select_2_9_ok:
  %75 = icmp ne %Int64 %51, %54
  %76 = zext i1 %75 to %Int64
  br label %select_2_end
select_2_10:
  %77 = icmp eq %ValueKind %0, 28
  br i1 %77, label %select_2_10_ok, label %select_2_11
select_2_10_ok:
  %78 = icmp slt %Int64 %51, %54
  %79 = zext i1 %78 to %Int64
  br label %select_2_end
select_2_11:
  %80 = icmp eq %ValueKind %0, 29
  br i1 %80, label %select_2_11_ok, label %select_2_12
select_2_11_ok:
  %81 = icmp sgt %Int64 %51, %54
  %82 = zext i1 %81 to %Int64
  br label %select_2_end
select_2_12:
  %83 = icmp eq %ValueKind %0, 30
  br i1 %83, label %select_2_12_ok, label %select_2_13
select_2_12_ok:
  %84 = icmp sle %Int64 %51, %54
  %85 = zext i1 %84 to %Int64
  br label %select_2_end
select_2_13:
  %86 = icmp eq %ValueKind %0, 31
  br i1 %86, label %select_2_13_ok, label %select_2_14
select_2_13_ok:
  %87 = icmp sge %Int64 %51, %54
  %88 = zext i1 %87 to %Int64
  br label %select_2_end
select_2_14:
  %89 = bitcast %Int64 0 to %Int64
  br label %select_2_end
select_2_end:
  %90 = phi %Int64 [ %56, %select_2_0_ok ], [ %58, %select_2_1_ok ], [ %60, %select_2_2_ok ], [ %62, %select_2_3_ok ], [ %64, %select_2_4_ok ], [ %66, %select_2_5_ok ], [ %68, %select_2_6_ok ], [ %70, %select_2_7_ok ], [ %73, %select_2_8_ok ], [ %76, %select_2_9_ok ], [ %79, %select_2_10_ok ], [ %82, %select_2_11_ok ], [ %85, %select_2_12_ok ], [ %88, %select_2_13_ok ], [ %89, %select_2_14 ]
;stmt18:
  %91 = getelementptr inbounds %AstValueBinary, %AstValueBinary* %1, i1 0, i32 3
  %92 = load %TokenInfo*, %TokenInfo** %91
  %93 = call %Value* (%Type*, %Int64, %TokenInfo*) @func439 (%Type* %45, %Int64 %90, %TokenInfo* %92)
  ret %Value* %93
  br label %endif_4
else_4:
  br label %endif_4
endif_4:
;stmt19:
  %95 = getelementptr inbounds %AstValueBinary, %AstValueBinary* %1, i1 0, i32 3
  %96 = load %TokenInfo*, %TokenInfo** %95
  %97 = call %Value* (%ValueKind, %Type*, %TokenInfo*) @func437 (%ValueKind %0, %Type* %45, %TokenInfo* %96)
;stmt20:
  %98 = getelementptr inbounds %Value, %Value* %97, i1 0, i32 11
  %99 = insertvalue %ValueBin zeroinitializer, %Type* %45, 0
  %100 = insertvalue %ValueBin %99, %ValueKind %0, 1
  %101 = insertvalue %ValueBin %100, %Value* %19, 2
  %102 = insertvalue %ValueBin %101, %Value* %22, 3
  %103 = getelementptr inbounds %AstValueBinary, %AstValueBinary* %1, i1 0, i32 3
  %104 = load %TokenInfo*, %TokenInfo** %103
  %105 = insertvalue %ValueBin %102, %TokenInfo* %104, 4
  store %ValueBin %105, %ValueBin* %98, align 8
;stmt21:
  ret %Value* %97
;stmt22:
  br label %fail
fail:
;stmt23:
  %107 = getelementptr inbounds %AstValueBinary, %AstValueBinary* %1, i1 0, i32 3
  %108 = load %TokenInfo*, %TokenInfo** %107
  %109 = call %Value* (%TokenInfo*) @value_new_poison (%TokenInfo* %108)
  ret %Value* %109
}

define %Value* @func452 (%AstValueCall*) {
;stmt0:
  %2 = getelementptr inbounds %AstValueCall, %AstValueCall* %0, i1 0, i32 0
  %3 = load %AstValue*, %AstValue** %2
  %4 = call %Value* (%AstValue*) @func442 (%AstValue* %3)
;stmt1:
  %5 = getelementptr inbounds %Value, %Value* %4, i1 0, i32 0
  %6 = load %ValueKind, %ValueKind* %5
  %7 = icmp eq %ValueKind %6, 1
  br i1 %7, label %then_0, label %else_0
then_0:
;stmt2:
  ret %Value* %4
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt3:
  %9 = getelementptr inbounds %AstValueCall, %AstValueCall* %0, i1 0, i32 1
  %10 = getelementptr inbounds %AstValueCall, %AstValueCall* %0, i1 0, i32 2
  %11 = load %TokenInfo*, %TokenInfo** %10
  %12 = call %List* (%Value*, %List*, %TokenInfo*) @func453 (%Value* %4, %List* %9, %TokenInfo* %11)
;stmt4:
  %13 = getelementptr inbounds %Value, %Value* %4, i1 0, i32 1
  %14 = load %Type*, %Type** %13
  %15 = getelementptr inbounds %Type, %Type* %14, i1 0, i32 6
  %16 = getelementptr inbounds %TypeFunc, %TypeFunc* %15, i1 0, i32 1
  %17 = load %Type*, %Type** %16
;stmt5:
  %18 = getelementptr inbounds %AstValueCall, %AstValueCall* %0, i1 0, i32 2
  %19 = load %TokenInfo*, %TokenInfo** %18
  %20 = call %Value* (%ValueKind, %Type*, %TokenInfo*) @func437 (%ValueKind 35, %Type* %17, %TokenInfo* %19)
;stmt6:
  %21 = getelementptr inbounds %Value, %Value* %20, i1 0, i32 17
  %22 = insertvalue %ValueCall zeroinitializer, %Type* %17, 0
  %23 = insertvalue %ValueCall %22, %Value* %4, 1
  %24 = insertvalue %ValueCall %23, %List* %12, 2
  %25 = getelementptr inbounds %AstValueCall, %AstValueCall* %0, i1 0, i32 2
  %26 = load %TokenInfo*, %TokenInfo** %25
  %27 = insertvalue %ValueCall %24, %TokenInfo* %26, 3
  store %ValueCall %27, %ValueCall* %21, align 8
;stmt7:
  ret %Value* %20
;stmt8:
  br label %fail
fail:
;stmt9:
  %29 = getelementptr inbounds %AstValueCall, %AstValueCall* %0, i1 0, i32 2
  %30 = load %TokenInfo*, %TokenInfo** %29
  %31 = call %Value* (%TokenInfo*) @value_new_poison (%TokenInfo* %30)
  ret %Value* %31
}

define i1 @func454 (%Unit*, %Unit*, %Unit*, %Nat32) {
;stmt0:
  %5 = bitcast %Unit* %0 to %Decl*
;stmt1:
  %6 = bitcast %Unit* %1 to %AstValue*
;stmt2:
  %7 = bitcast %Unit* %2 to %func453.type10*
;stmt3:; loadImmPtr
  %8 = inttoptr i64 0 to%AstValue*
  %9 = icmp eq %AstValue* %6, %8
  br i1 %9, label %then_0, label %else_0
then_0:
;stmt4:
  %10 = bitcast [21 x %Nat8]* @func453_func454_str1 to %Str
  %11 = getelementptr inbounds %func453.type10, %func453.type10* %7, i1 0, i32 3
  %12 = load %TokenInfo*, %TokenInfo** %11
  call void (%Str, %TokenInfo*) @error (%Str %10, %TokenInfo* %12)
;stmt5:
  ret i1 0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt6:
  %14 = call %Value* (%AstValue*) @func442 (%AstValue* %6)
;stmt7:; loadImmPtr
  %15 = inttoptr i64 0 to%Decl*
  %16 = icmp eq %Decl* %5, %15
  br i1 %16, label %then_1, label %else_1
then_1:
;stmt8:
  %17 = getelementptr inbounds %func453.type10, %func453.type10* %7, i1 0, i32 0
  %18 = load %Value*, %Value** %17
  %19 = getelementptr inbounds %Value, %Value* %18, i1 0, i32 1
  %20 = load %Type*, %Type** %19
  %21 = getelementptr inbounds %Type, %Type* %20, i1 0, i32 6
  %22 = getelementptr inbounds %TypeFunc, %TypeFunc* %21, i1 0, i32 2
  %23 = load i1, i1* %22
  %24 = xor i1 %23, 1
  br i1 %24, label %then_2, label %else_2
then_2:
;stmt9:
  %25 = bitcast [16 x %Nat8]* @func453_func454_str2 to %Str
  %26 = getelementptr inbounds %Value, %Value* %14, i1 0, i32 19
  %27 = load %TokenInfo*, %TokenInfo** %26
  call void (%Str, %TokenInfo*) @error (%Str %25, %TokenInfo* %27)
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
;stmt10:
  %28 = call %Value* (%Value*) @func494 (%Value* %14)
;stmt11:
  %29 = getelementptr inbounds %func453.type10, %func453.type10* %7, i1 0, i32 2
  %30 = load %List*, %List** %29
  %31 = bitcast %Value* %28 to %Unit*
  %32 = call i1 (%List*, %Unit*) @list_append (%List* %30, %Unit* %31)
;stmt12:
  ret i1 1
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt13:
  %34 = getelementptr inbounds %Decl, %Decl* %5, i1 0, i32 1
  %35 = load %Type*, %Type** %34
  %36 = call %Value* (%Value*, %Type*) @func497 (%Value* %14, %Type* %35)
;stmt14:
  %37 = getelementptr inbounds %Decl, %Decl* %5, i1 0, i32 1
  %38 = load %Type*, %Type** %37
  %39 = getelementptr inbounds %Value, %Value* %36, i1 0, i32 1
  %40 = load %Type*, %Type** %39
  %41 = getelementptr inbounds %Value, %Value* %14, i1 0, i32 19
  %42 = load %TokenInfo*, %TokenInfo** %41
  %43 = call i1 (%Type*, %Type*, %TokenInfo*) @type_check (%Type* %38, %Type* %40, %TokenInfo* %42)
  %44 = xor i1 %43, 1
  br i1 %44, label %then_3, label %else_3
then_3:
  br label %endif_3
else_3:
  br label %endif_3
endif_3:
;stmt15:
  %45 = getelementptr inbounds %func453.type10, %func453.type10* %7, i1 0, i32 2
  %46 = load %List*, %List** %45
  %47 = bitcast %Value* %36 to %Unit*
  %48 = call i1 (%List*, %Unit*) @list_append (%List* %46, %Unit* %47)
;stmt16:
  ret i1 1
}

define %List* @func453 (%Value*, %List*, %TokenInfo*) {
;stmt0:
  %4 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 1
  %5 = load %Type*, %Type** %4
  %6 = getelementptr inbounds %Type, %Type* %5, i1 0, i32 6
  %7 = getelementptr inbounds %TypeFunc, %TypeFunc* %6, i1 0, i32 0
  %8 = load %Type*, %Type** %7
  %9 = getelementptr inbounds %Type, %Type* %8, i1 0, i32 10
  %10 = getelementptr inbounds %TypeRecord, %TypeRecord* %9, i1 0, i32 0
  %11 = load %List*, %List** %10
;stmt1:
  %12 = alloca %func453.type10
  %13 = insertvalue %func453.type10 zeroinitializer, %Value* %0, 0
  %14 = insertvalue %func453.type10 %13, %List* %11, 1
  %15 = call %List* () @map_new ()
  %16 = insertvalue %func453.type10 %14, %List* %15, 2
  %17 = insertvalue %func453.type10 %16, %TokenInfo* %2, 3
  store %func453.type10 %17, %func453.type10* %12, align 8
;stmt2:
  %18 = getelementptr inbounds %func453.type10, %func453.type10* %12, i1 0
  %19 = bitcast %func453.type10* %18 to %Unit*
  call void (%List*, %List*, %ListWhileHandler2, %Unit*) @list_while2_or (%List* %11, %List* %1, %ListWhileHandler2 @func454, %Unit* %19)
;stmt3:
  %20 = getelementptr inbounds %func453.type10, %func453.type10* %12, i1 0, i32 2
  %21 = load %List*, %List** %20
  ret %List* %21
}

define %Type* @func456 (%Type*) {
;stmt0:
  %2 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 0
  %3 = load %TypeKind, %TypeKind* %2
  br label %select_1_0
select_1_0:
  %4 = icmp eq %TypeKind %3, 12
  br i1 %4, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %5 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 8
  %6 = getelementptr inbounds %TypeArray, %TypeArray* %5, i1 0, i32 0
  %7 = load %Type*, %Type** %6
  br label %select_1_end
select_1_1:; loadImmPtr
  %8 = inttoptr i64 0 to%Type*
  br label %select_1_end
select_1_end:
  %9 = phi %Type* [ %7, %select_1_0_ok ], [ %8, %select_1_1 ]
  ret %Type* %9
}

define %Value* @func455 (%AstValueIndex*) {
;stmt0:
  %2 = getelementptr inbounds %AstValueIndex, %AstValueIndex* %0, i1 0, i32 0
  %3 = load %AstValue*, %AstValue** %2
  %4 = call %Value* (%AstValue*) @func442 (%AstValue* %3)
;stmt1:
  %5 = getelementptr inbounds %AstValueIndex, %AstValueIndex* %0, i1 0, i32 1
  %6 = load %AstValue*, %AstValue** %5
  %7 = call %Value* (%AstValue*) @func442 (%AstValue* %6)
;stmt2:
  %8 = getelementptr inbounds %Value, %Value* %4, i1 0, i32 0
  %9 = load %ValueKind, %ValueKind* %8
  %10 = icmp eq %ValueKind %9, 1
  br i1 %10, label %then_0, label %else_0
then_0:
;stmt3:
  br label %fail
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt4:
  %12 = getelementptr inbounds %Value, %Value* %7, i1 0, i32 0
  %13 = load %ValueKind, %ValueKind* %12
  %14 = icmp eq %ValueKind %13, 1
  br i1 %14, label %then_1, label %else_1
then_1:
;stmt5:
  br label %fail
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt6:
  %16 = getelementptr inbounds %Value, %Value* %4, i1 0, i32 1
  %17 = load %Type*, %Type** %16
  %18 = getelementptr inbounds %Type, %Type* %17, i1 0, i32 0
  %19 = load %TypeKind, %TypeKind* %18
  br label %select_1_0
select_1_0:
  %20 = icmp eq %TypeKind %19, 12
  br i1 %20, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %21 = getelementptr inbounds %Value, %Value* %4, i1 0, i32 1
  %22 = load %Type*, %Type** %21
  %23 = getelementptr inbounds %Type, %Type* %22, i1 0, i32 8
  %24 = getelementptr inbounds %TypeArray, %TypeArray* %23, i1 0, i32 0
  %25 = load %Type*, %Type** %24
  br label %select_1_end
select_1_1:
  %26 = icmp eq %TypeKind %19, 13
  br i1 %26, label %select_1_1_ok, label %select_1_2
select_1_1_ok:
  %27 = getelementptr inbounds %Value, %Value* %4, i1 0, i32 1
  %28 = load %Type*, %Type** %27
  %29 = getelementptr inbounds %Type, %Type* %28, i1 0, i32 9
  %30 = getelementptr inbounds %TypeArrayU, %TypeArrayU* %29, i1 0, i32 0
  %31 = load %Type*, %Type** %30
  br label %select_1_end
select_1_2:
  %32 = icmp eq %TypeKind %19, 11
  br i1 %32, label %select_1_2_ok, label %select_1_3
select_1_2_ok:
  %33 = getelementptr inbounds %Value, %Value* %4, i1 0, i32 1
  %34 = load %Type*, %Type** %33
  %35 = getelementptr inbounds %Type, %Type* %34, i1 0, i32 7
  %36 = getelementptr inbounds %TypePointer, %TypePointer* %35, i1 0, i32 0
  %37 = load %Type*, %Type** %36
  %38 = call %Type* (%Type*) @func456 (%Type* %37)
  br label %select_1_end
select_1_3:; loadImmPtr
  %39 = inttoptr i64 0 to%Type*
  br label %select_1_end
select_1_end:
  %40 = phi %Type* [ %25, %select_1_0_ok ], [ %31, %select_1_1_ok ], [ %38, %select_1_2_ok ], [ %39, %select_1_3 ]
;stmt7:; loadImmPtr
  %41 = inttoptr i64 0 to%Type*
  %42 = icmp eq %Type* %40, %41
  br i1 %42, label %then_2, label %else_2
then_2:
;stmt8:
  %43 = getelementptr inbounds %Value, %Value* %4, i1 0, i32 19
  %44 = load %TokenInfo*, %TokenInfo** %43
  %45 = getelementptr inbounds %Value, %Value* %4, i1 0, i32 1
  %46 = load %Type*, %Type** %45; loadImmPtr
  %47 = inttoptr i64 0 to%Type*
  call void (%TokenInfo*, %Type*, %Type*) @error_type_error (%TokenInfo* %44, %Type* %46, %Type* %47)
;stmt9:
  br label %fail
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
;stmt10:
  %49 = call %Value* (%Value*) @func494 (%Value* %7)
;stmt11:
  %50 = getelementptr inbounds %AstValueIndex, %AstValueIndex* %0, i1 0, i32 2
  %51 = load %TokenInfo*, %TokenInfo** %50
  %52 = call %Value* (%ValueKind, %Type*, %TokenInfo*) @func437 (%ValueKind 36, %Type* %40, %TokenInfo* %51)
;stmt12:
  %53 = getelementptr inbounds %Value, %Value* %52, i1 0, i32 12
  %54 = insertvalue %ValueIndex zeroinitializer, %Type* %40, 0
  %55 = insertvalue %ValueIndex %54, %Value* %4, 1
  %56 = insertvalue %ValueIndex %55, %Value* %49, 2
  %57 = getelementptr inbounds %AstValueIndex, %AstValueIndex* %0, i1 0, i32 2
  %58 = load %TokenInfo*, %TokenInfo** %57
  %59 = insertvalue %ValueIndex %56, %TokenInfo* %58, 3
  store %ValueIndex %59, %ValueIndex* %53, align 8
;stmt13:
  ret %Value* %52
;stmt14:
  br label %fail
fail:
;stmt15:
  %61 = getelementptr inbounds %AstValueIndex, %AstValueIndex* %0, i1 0, i32 2
  %62 = load %TokenInfo*, %TokenInfo** %61
  %63 = call %Value* (%TokenInfo*) @value_new_poison (%TokenInfo* %62)
  ret %Value* %63
}

define %Type* @func458 (%Type*) {
;stmt0:
  %2 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 0
  %3 = load %TypeKind, %TypeKind* %2
  br label %select_1_0
select_1_0:
  %4 = icmp eq %TypeKind %3, 10
  br i1 %4, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  br label %select_1_end
select_1_1:; loadImmPtr
  %5 = inttoptr i64 0 to%Type*
  br label %select_1_end
select_1_end:
  %6 = phi %Type* [ %0, %select_1_0_ok ], [ %5, %select_1_1 ]
  ret %Type* %6
}

define %Value* @func457 (%AstValueAccess*) {
;stmt0:
  %2 = getelementptr inbounds %AstValueAccess, %AstValueAccess* %0, i1 0, i32 0
  %3 = load %AstValue*, %AstValue** %2
  %4 = call %Value* (%AstValue*) @func442 (%AstValue* %3)
;stmt1:
  %5 = getelementptr inbounds %AstValueAccess, %AstValueAccess* %0, i1 0, i32 1
  %6 = load %AstId*, %AstId** %5
  %7 = getelementptr inbounds %AstId, %AstId* %6, i1 0, i32 0
  %8 = load %Str, %Str* %7
;stmt2:
  %9 = getelementptr inbounds %Value, %Value* %4, i1 0, i32 0
  %10 = load %ValueKind, %ValueKind* %9
  %11 = icmp eq %ValueKind %10, 1
  br i1 %11, label %then_0, label %else_0
then_0:
;stmt3:
  br label %fail
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt4:
  %13 = getelementptr inbounds %Value, %Value* %4, i1 0, i32 1
  %14 = load %Type*, %Type** %13
  %15 = getelementptr inbounds %Type, %Type* %14, i1 0, i32 0
  %16 = load %TypeKind, %TypeKind* %15
  br label %select_1_0
select_1_0:
  %17 = icmp eq %TypeKind %16, 10
  br i1 %17, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %18 = getelementptr inbounds %Value, %Value* %4, i1 0, i32 1
  %19 = load %Type*, %Type** %18
  br label %select_1_end
select_1_1:
  %20 = icmp eq %TypeKind %16, 11
  br i1 %20, label %select_1_1_ok, label %select_1_2
select_1_1_ok:
  %21 = getelementptr inbounds %Value, %Value* %4, i1 0, i32 1
  %22 = load %Type*, %Type** %21
  %23 = getelementptr inbounds %Type, %Type* %22, i1 0, i32 7
  %24 = getelementptr inbounds %TypePointer, %TypePointer* %23, i1 0, i32 0
  %25 = load %Type*, %Type** %24
  %26 = call %Type* (%Type*) @func458 (%Type* %25)
  br label %select_1_end
select_1_2:; loadImmPtr
  %27 = inttoptr i64 0 to%Type*
  br label %select_1_end
select_1_end:
  %28 = phi %Type* [ %19, %select_1_0_ok ], [ %26, %select_1_1_ok ], [ %27, %select_1_2 ]
;stmt5:; loadImmPtr
  %29 = inttoptr i64 0 to%Type*
  %30 = icmp eq %Type* %28, %29
  br i1 %30, label %then_1, label %else_1
then_1:
;stmt6:
  %31 = getelementptr inbounds %Value, %Value* %4, i1 0, i32 19
  %32 = load %TokenInfo*, %TokenInfo** %31
  %33 = getelementptr inbounds %Value, %Value* %4, i1 0, i32 1
  %34 = load %Type*, %Type** %33; loadImmPtr
  %35 = inttoptr i64 0 to%Type*
  call void (%TokenInfo*, %Type*, %Type*) @error_type_error (%TokenInfo* %32, %Type* %34, %Type* %35)
;stmt7:
  br label %fail
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt8:
  %37 = call %Decl* (%Type*, %Str) @func388 (%Type* %28, %Str %8)
;stmt9:; loadImmPtr
  %38 = inttoptr i64 0 to%Decl*
  %39 = icmp eq %Decl* %37, %38
  br i1 %39, label %then_2, label %else_2
then_2:
;stmt10:
  %40 = bitcast [16 x %Nat8]* @func457_str1 to %Str
  %41 = getelementptr inbounds %AstValueAccess, %AstValueAccess* %0, i1 0, i32 1
  %42 = load %AstId*, %AstId** %41
  %43 = getelementptr inbounds %AstId, %AstId* %42, i1 0, i32 1
  %44 = load %TokenInfo*, %TokenInfo** %43
  call void (%Str, %TokenInfo*) @error (%Str %40, %TokenInfo* %44)
;stmt11:
  br label %fail
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
;stmt12:
  %46 = getelementptr inbounds %Decl, %Decl* %37, i1 0, i32 1
  %47 = load %Type*, %Type** %46
;stmt13:
  %48 = getelementptr inbounds %AstValueAccess, %AstValueAccess* %0, i1 0, i32 2
  %49 = load %TokenInfo*, %TokenInfo** %48
  %50 = call %Value* (%ValueKind, %Type*, %TokenInfo*) @func437 (%ValueKind 37, %Type* %47, %TokenInfo* %49)
;stmt14:
  %51 = getelementptr inbounds %Value, %Value* %50, i1 0, i32 13
  %52 = insertvalue %ValueAccess zeroinitializer, %Type* %47, 0
  %53 = insertvalue %ValueAccess %52, %Value* %4, 1
  %54 = insertvalue %ValueAccess %53, %Str %8, 2
  %55 = getelementptr inbounds %AstValueAccess, %AstValueAccess* %0, i1 0, i32 2
  %56 = load %TokenInfo*, %TokenInfo** %55
  %57 = insertvalue %ValueAccess %54, %TokenInfo* %56, 3
  store %ValueAccess %57, %ValueAccess* %51, align 8
;stmt15:
  ret %Value* %50
;stmt16:
  br label %fail
fail:
;stmt17:
  %59 = getelementptr inbounds %AstValueAccess, %AstValueAccess* %0, i1 0, i32 2
  %60 = load %TokenInfo*, %TokenInfo** %59
  %61 = call %Value* (%TokenInfo*) @value_new_poison (%TokenInfo* %60)
  ret %Value* %61
}

define %Value* @do_value_cast_var (%Value*, %Type*, %TokenInfo*) {
;stmt0:
  %4 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 19
  %5 = load %TokenInfo*, %TokenInfo** %4
  %6 = call %Value* (%Value*, %Type*, %TokenInfo*) @func492 (%Value* %0, %Type* %1, %TokenInfo* %5)
  ret %Value* %6
}

define %Value* @do_value_cast_bool (%Value*, %Type*, %TokenInfo*) {
;stmt0:
  %4 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 0
  %5 = load %TypeKind, %TypeKind* %4
  %6 = icmp ne %TypeKind %5, 5
  br i1 %6, label %then_0, label %else_0
then_0:
;stmt1:
  %7 = bitcast [16 x %Nat8]* @func460_str1 to %Str
  call void (%Str, %TokenInfo*) @error (%Str %7, %TokenInfo* %2)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt2:
  %8 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 19
  %9 = load %TokenInfo*, %TokenInfo** %8
  %10 = call %Value* (%Value*, %Type*, %TokenInfo*) @func492 (%Value* %0, %Type* %1, %TokenInfo* %9)
  ret %Value* %10
}

define %Value* @do_value_cast_ref (%Value*, %Type*, %TokenInfo*) {
;stmt0:
  %4 = call i1 (%Type*) @func390 (%Type* %1)
  %5 = xor i1 %4, 1
  br i1 %5, label %then_0, label %else_0
then_0:
;stmt1:
  %6 = bitcast [16 x %Nat8]* @func461_str1 to %Str
  call void (%Str, %TokenInfo*) @error (%Str %6, %TokenInfo* %2)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt2:
  %7 = call %Value* (%Value*, %Type*, %TokenInfo*) @func492 (%Value* %0, %Type* %1, %TokenInfo* %2)
  ret %Value* %7
}

define %Value* @do_value_cast_num (%Value*, %Type*, %TokenInfo*) {
;stmt0:
  %4 = load i1, i1* @unsafe
  %5 = xor i1 %4, 1
  br i1 %5, label %then_0, label %else_0
then_0:
;stmt1:
  %6 = call i1 (%Type*) @func390 (%Type* %1)
  br i1 %6, label %then_1, label %else_1
then_1:
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt2:
  %7 = call %Value* (%Value*, %Type*, %TokenInfo*) @func492 (%Value* %0, %Type* %1, %TokenInfo* %2)
  ret %Value* %7
}

define %Value* @do_value_cast_func (%Value*, %Type*, %TokenInfo*) {
;stmt0:
  %4 = call i1 (%Type*) @typeIsPointerToUnit (%Type* %1)
  %5 = xor i1 %4, 1
  br i1 %5, label %then_0, label %else_0
then_0:
;stmt1:
  %6 = bitcast [16 x %Nat8]* @func463_str1 to %Str
  call void (%Str, %TokenInfo*) @error (%Str %6, %TokenInfo* %2)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt2:
  %7 = call %Value* (%Value*, %Type*, %TokenInfo*) @func492 (%Value* %0, %Type* %1, %TokenInfo* %2)
  ret %Value* %7
}

define %Value* @do_value_cast_set (%Value*, %Type*, %TokenInfo*) {
;stmt0:
  %4 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 0
  %5 = load %TypeKind, %TypeKind* %4
  %6 = icmp ne %TypeKind %5, 5
  br i1 %6, label %then_0, label %else_0
then_0:
;stmt1:
  %7 = bitcast [16 x %Nat8]* @func464_str1 to %Str
  call void (%Str, %TokenInfo*) @error (%Str %7, %TokenInfo* %2)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt2:
  %8 = call %Value* (%Value*, %Type*, %TokenInfo*) @func492 (%Value* %0, %Type* %1, %TokenInfo* %2)
  ret %Value* %8
}

define %Value* @do_value_cast_rec (%Value*, %Type*, %TokenInfo*) {
;stmt0:
  %4 = bitcast [16 x %Nat8]* @func465_str1 to %Str
  call void (%Str, %TokenInfo*) @error (%Str %4, %TokenInfo* %2)
;stmt1:
  %5 = call %Value* (%Value*, %Type*, %TokenInfo*) @func492 (%Value* %0, %Type* %1, %TokenInfo* %2)
  ret %Value* %5
}

define %Value* @do_value_cast_ptr (%Value*, %Type*, %TokenInfo*) {
;stmt0:
  %4 = call %Value* (%Value*, %Type*, %TokenInfo*) @func492 (%Value* %0, %Type* %1, %TokenInfo* %2)
  ret %Value* %4
}

define %Value* @do_value_cast_arr (%Value*, %Type*, %TokenInfo*) {
;stmt0:
  %4 = bitcast [16 x %Nat8]* @func467_str1 to %Str
  call void (%Str, %TokenInfo*) @error (%Str %4, %TokenInfo* %2)
;stmt1:
  %5 = call %Value* (%Value*, %Type*, %TokenInfo*) @func492 (%Value* %0, %Type* %1, %TokenInfo* %2)
  ret %Value* %5
}

define %Value* @do_value_cast_uarr (%Value*, %Type*, %TokenInfo*) {
;stmt0:
  %4 = call i1 (%Type*) @typeIsPointerToUnit (%Type* %1)
  %5 = xor i1 %4, 1
  br i1 %5, label %then_0, label %else_0
then_0:
;stmt1:
  %6 = bitcast [16 x %Nat8]* @func468_str1 to %Str
  call void (%Str, %TokenInfo*) @error (%Str %6, %TokenInfo* %2)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt2:
  %7 = call %Value* (%Value*, %Type*, %TokenInfo*) @func492 (%Value* %0, %Type* %1, %TokenInfo* %2)
  ret %Value* %7
}

define %Value* @do_value_cast_union (%Value*, %Type*, %TokenInfo*) {
;stmt0:
  %4 = call %Value* (%Value*, %Type*, %TokenInfo*) @func492 (%Value* %0, %Type* %1, %TokenInfo* %2)
  ret %Value* %4
}

define void @func471 (%Unit*, %Unit*, %Unit*) {
;stmt0:
  %4 = bitcast %Unit* %0 to %Str
;stmt1:
  %5 = bitcast %Unit* %1 to %Value*
;stmt2:
  %6 = bitcast %Unit* %2 to %func470.type11*
;stmt3:
  %7 = getelementptr inbounds %func470.type11, %func470.type11* %6, i1 0, i32 0
  %8 = load %Type*, %Type** %7
  %9 = call %Decl* (%Type*, %Str) @func388 (%Type* %8, %Str %4)
;stmt4:; loadImmPtr
  %10 = inttoptr i64 0 to%Decl*
  %11 = icmp ne %Decl* %9, %10
  %12 = bitcast [32 x %Nat8]* @func470_func471_str1 to %Str
  call void (i1, %Str) @assert (i1 %11, %Str %12)
;stmt5:
  %13 = getelementptr inbounds %Decl, %Decl* %9, i1 0, i32 1
  %14 = load %Type*, %Type** %13
  %15 = call %Value* (%Value*, %Type*) @func497 (%Value* %5, %Type* %14)
;stmt6:
  %16 = getelementptr inbounds %func470.type11, %func470.type11* %6, i1 0, i32 1
  %17 = bitcast %Value* %15 to %Unit*
  %18 = call i1 (%List*, %Str, %Unit*) @map_append (%List* %16, %Str %4, %Unit* %17)
  ret void
}

define %Value* @do_value_cast_gen_rec (%Value*, %Type*, %TokenInfo*) {
;stmt0:
  %4 = alloca %func470.type11
  %5 = insertvalue %func470.type11 zeroinitializer, %Type* %1, 0
  store %func470.type11 %5, %func470.type11* %4, align 8
;stmt1:
  %6 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 4
  %7 = getelementptr inbounds %ValueRecord, %ValueRecord* %6, i1 0, i32 1
  %8 = getelementptr inbounds %func470.type11, %func470.type11* %4, i1 0
  %9 = bitcast %func470.type11* %8 to %Unit*
  call void (%List*, %MapForeachHandler, %Unit*) @map_foreach (%List* %7, %MapForeachHandler @func471, %Unit* %9)
;stmt2:
  %10 = call %Value* (%ValueKind, %Type*, %TokenInfo*) @func437 (%ValueKind 8, %Type* %1, %TokenInfo* %2)
;stmt3:
  %11 = getelementptr inbounds %Value, %Value* %10, i1 0, i32 4
  %12 = insertvalue %ValueRecord zeroinitializer, %Type* %1, 0
  %13 = getelementptr inbounds %func470.type11, %func470.type11* %4, i1 0, i32 1
  %14 = load %List, %List* %13
  %15 = insertvalue %ValueRecord %12, %List %14, 1
  %16 = insertvalue %ValueRecord %15, %TokenInfo* %2, 2
  store %ValueRecord %16, %ValueRecord* %11, align 8
;stmt4:
  ret %Value* %10
}

define %Value* @do_value_cast_to_var (%Value*, %Type*, %TokenInfo*) {
;stmt0:
  %4 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 12
  %5 = getelementptr inbounds %TypeVar, %TypeVar* %4, i1 0, i32 0
  %6 = load %Type*, %Type** %5
  %7 = call %Value* (%Value*, %Type*, %TokenInfo*) @func492 (%Value* %0, %Type* %6, %TokenInfo* %2)
;stmt1:
  %8 = call %Str () @func156 ()
;stmt2:
  %9 = alloca %AstId
  %10 = insertvalue %AstId zeroinitializer, %Str %8, 0
  %11 = insertvalue %AstId %10, %TokenInfo* %2, 1
  store %AstId %11, %AstId* %9, align 8
;stmt3:
  %12 = load %FuncContext*, %FuncContext** @fctx
  br label %select_1_0
select_1_0:; loadImmPtr
  %13 = inttoptr i64 0 to%FuncContext*
  %14 = icmp eq %FuncContext* %12, %13
  br i1 %14, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %15 = getelementptr inbounds %AstId, %AstId* %9, i1 0
  %16 = call %Value* (%AstId*, %Type*, %Value*, %TokenInfo*) @func552 (%AstId* %15, %Type* %1, %Value* %7, %TokenInfo* %2)
  br label %select_1_end
select_1_1:
  %17 = getelementptr inbounds %AstId, %AstId* %9, i1 0
  %18 = call %Value* (%AstId*, %Type*, %Value*, %TokenInfo*) @func553 (%AstId* %17, %Type* %1, %Value* %7, %TokenInfo* %2)
  br label %select_1_end
select_1_end:
  %19 = phi %Value* [ %16, %select_1_0_ok ], [ %18, %select_1_1 ]
  ret %Value* %19
;stmt4:
  br label %fail
fail:
;stmt5:
  %21 = call %Value* (%TokenInfo*) @value_new_poison (%TokenInfo* %2)
  ret %Value* %21
}

define %Value* @func474 (%Value*, %Type*, %TokenInfo*) {
;stmt0:
  %4 = bitcast [18 x %Nat8]* @func473_func474_str1 to %Str
  call void (%Str) @fatal (%Str %4)
;stmt1:; loadImmPtr
  %5 = inttoptr i64 0 to%Value*
  ret %Value* %5
}

define %Value* @func473 (%AstValueCast*) {
;stmt0:
  %2 = getelementptr inbounds %AstValueCast, %AstValueCast* %0, i1 0, i32 0
  %3 = load %AstValue*, %AstValue** %2
  %4 = call %Value* (%AstValue*) @func442 (%AstValue* %3)
;stmt1:
  %5 = getelementptr inbounds %AstValueCast, %AstValueCast* %0, i1 0, i32 1
  %6 = load %AstType*, %AstType** %5
  %7 = call %Type* (%AstType*) @func400 (%AstType* %6)
;stmt2:
  %8 = getelementptr inbounds %Value, %Value* %4, i1 0, i32 0
  %9 = load %ValueKind, %ValueKind* %8
  %10 = icmp eq %ValueKind %9, 1
  br i1 %10, label %then_0, label %else_0
then_0:
;stmt3:
  br label %fail
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt4:
  %12 = getelementptr inbounds %Type, %Type* %7, i1 0, i32 0
  %13 = load %TypeKind, %TypeKind* %12
  %14 = icmp eq %TypeKind %13, 2
  br i1 %14, label %then_1, label %else_1
then_1:
;stmt5:
  br label %fail
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt6:
  %16 = getelementptr inbounds %AstValueCast, %AstValueCast* %0, i1 0, i32 2
  %17 = load %TokenInfo*, %TokenInfo** %16
;stmt7:
  %18 = getelementptr inbounds %Value, %Value* %4, i1 0, i32 1
  %19 = load %Type*, %Type** %18
  %20 = call i1 (%Type*, %Type*) @func426 (%Type* %19, %Type* %7)
  br i1 %20, label %then_2, label %else_2
then_2:
;stmt8:
  %21 = bitcast [18 x %Nat8]* @func473_str1 to %Str
  call void (%Str, %TokenInfo*) @warning (%Str %21, %TokenInfo* %17)
;stmt9:
  ret %Value* %4
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
;stmt10:
  %23 = getelementptr inbounds %Type, %Type* %7, i1 0, i32 0
  %24 = load %TypeKind, %TypeKind* %23
  %25 = icmp eq %TypeKind %24, 6
  br i1 %25, label %then_3, label %else_3
then_3:
;stmt11:
  %26 = call %Value* (%Value*, %Type*, %TokenInfo*) @do_value_cast_to_var (%Value* %4, %Type* %7, %TokenInfo* %17)
  ret %Value* %26
  br label %endif_3
else_3:
  br label %endif_3
endif_3:
;stmt12:
  %28 = getelementptr inbounds %Value, %Value* %4, i1 0, i32 1
  %29 = load %Type*, %Type** %28
  %30 = getelementptr inbounds %Type, %Type* %29, i1 0, i32 0
  %31 = load %TypeKind, %TypeKind* %30
  br label %select_1_0
select_1_0:
  %32 = icmp eq %TypeKind %31, 6
  br i1 %32, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %33 = call %Value* (%Value*, %Type*, %TokenInfo*) @do_value_cast_var (%Value* %4, %Type* %7, %TokenInfo* %17)
  br label %select_1_end
select_1_1:
  %34 = icmp eq %TypeKind %31, 7
  br i1 %34, label %select_1_1_ok, label %select_1_2
select_1_1_ok:
  %35 = call %Value* (%Value*, %Type*, %TokenInfo*) @do_value_cast_bool (%Value* %4, %Type* %7, %TokenInfo* %17)
  br label %select_1_end
select_1_2:
  %36 = icmp eq %TypeKind %31, 3
  br i1 %36, label %select_1_2_ok, label %select_1_3
select_1_2_ok:
  %37 = call %Value* (%Value*, %Type*, %TokenInfo*) @do_value_cast_ref (%Value* %4, %Type* %7, %TokenInfo* %17)
  br label %select_1_end
select_1_3:
  %38 = icmp eq %TypeKind %31, 4
  br i1 %38, label %select_1_3_ok, label %select_1_4
select_1_3_ok:
  %39 = call %Value* (%Value*, %Type*, %TokenInfo*) @do_value_cast_gen_rec (%Value* %4, %Type* %7, %TokenInfo* %17)
  br label %select_1_end
select_1_4:
  %40 = icmp eq %TypeKind %31, 5
  br i1 %40, label %select_1_4_ok, label %select_1_5
select_1_4_ok:
  %41 = call %Value* (%Value*, %Type*, %TokenInfo*) @do_value_cast_num (%Value* %4, %Type* %7, %TokenInfo* %17)
  br label %select_1_end
select_1_5:
  %42 = icmp eq %TypeKind %31, 8
  br i1 %42, label %select_1_5_ok, label %select_1_6
select_1_5_ok:
  %43 = call %Value* (%Value*, %Type*, %TokenInfo*) @do_value_cast_func (%Value* %4, %Type* %7, %TokenInfo* %17)
  br label %select_1_end
select_1_6:
  %44 = icmp eq %TypeKind %31, 9
  br i1 %44, label %select_1_6_ok, label %select_1_7
select_1_6_ok:
  %45 = call %Value* (%Value*, %Type*, %TokenInfo*) @do_value_cast_set (%Value* %4, %Type* %7, %TokenInfo* %17)
  br label %select_1_end
select_1_7:
  %46 = icmp eq %TypeKind %31, 10
  br i1 %46, label %select_1_7_ok, label %select_1_8
select_1_7_ok:
  %47 = call %Value* (%Value*, %Type*, %TokenInfo*) @do_value_cast_rec (%Value* %4, %Type* %7, %TokenInfo* %17)
  br label %select_1_end
select_1_8:
  %48 = icmp eq %TypeKind %31, 11
  br i1 %48, label %select_1_8_ok, label %select_1_9
select_1_8_ok:
  %49 = call %Value* (%Value*, %Type*, %TokenInfo*) @do_value_cast_ptr (%Value* %4, %Type* %7, %TokenInfo* %17)
  br label %select_1_end
select_1_9:
  %50 = icmp eq %TypeKind %31, 12
  br i1 %50, label %select_1_9_ok, label %select_1_10
select_1_9_ok:
  %51 = call %Value* (%Value*, %Type*, %TokenInfo*) @do_value_cast_arr (%Value* %4, %Type* %7, %TokenInfo* %17)
  br label %select_1_end
select_1_10:
  %52 = icmp eq %TypeKind %31, 13
  br i1 %52, label %select_1_10_ok, label %select_1_11
select_1_10_ok:
  %53 = call %Value* (%Value*, %Type*, %TokenInfo*) @do_value_cast_uarr (%Value* %4, %Type* %7, %TokenInfo* %17)
  br label %select_1_end
select_1_11:
  %54 = icmp eq %TypeKind %31, 14
  br i1 %54, label %select_1_11_ok, label %select_1_12
select_1_11_ok:
  %55 = call %Value* (%Value*, %Type*, %TokenInfo*) @do_value_cast_union (%Value* %4, %Type* %7, %TokenInfo* %17)
  br label %select_1_end
select_1_12:
  %56 = call %Value* (%Value*, %Type*, %TokenInfo*) @func474 (%Value* %4, %Type* %7, %TokenInfo* %17)
  br label %select_1_end
select_1_end:
  %57 = phi %Value* [ %33, %select_1_0_ok ], [ %35, %select_1_1_ok ], [ %37, %select_1_2_ok ], [ %39, %select_1_3_ok ], [ %41, %select_1_4_ok ], [ %43, %select_1_5_ok ], [ %45, %select_1_6_ok ], [ %47, %select_1_7_ok ], [ %49, %select_1_8_ok ], [ %51, %select_1_9_ok ], [ %53, %select_1_10_ok ], [ %55, %select_1_11_ok ], [ %56, %select_1_12 ]
  ret %Value* %57
;stmt13:
  br label %fail
fail:
;stmt14:
  %59 = getelementptr inbounds %AstValueCast, %AstValueCast* %0, i1 0, i32 2
  %60 = load %TokenInfo*, %TokenInfo** %59
  %61 = call %Value* (%TokenInfo*) @value_new_poison (%TokenInfo* %60)
  ret %Value* %61
}

define %Value* @func475 (%AstValueIs*) {
;stmt0:
  %2 = getelementptr inbounds %AstValueIs, %AstValueIs* %0, i1 0, i32 0
  %3 = load %AstValue*, %AstValue** %2
  %4 = call %Value* (%AstValue*) @func442 (%AstValue* %3)
;stmt1:
  %5 = getelementptr inbounds %AstValueIs, %AstValueIs* %0, i1 0, i32 1
  %6 = load %AstType*, %AstType** %5
  %7 = call %Type* (%AstType*) @func400 (%AstType* %6)
;stmt2:
  %8 = getelementptr inbounds %Value, %Value* %4, i1 0, i32 1
  %9 = load %Type*, %Type** %8
  %10 = getelementptr inbounds %Type, %Type* %9, i1 0, i32 0
  %11 = load %TypeKind, %TypeKind* %10
  %12 = icmp ne %TypeKind %11, 14
  br i1 %12, label %then_0, label %else_0
then_0:
;stmt3:
  %13 = bitcast [20 x %Nat8]* @func475_str1 to %Str
  %14 = getelementptr inbounds %Value, %Value* %4, i1 0, i32 19
  %15 = load %TokenInfo*, %TokenInfo** %14
  call void (%Str, %TokenInfo*) @error (%Str %13, %TokenInfo* %15)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt4:
  %16 = getelementptr inbounds %Value, %Value* %4, i1 0, i32 1
  %17 = load %Type*, %Type** %16
  %18 = getelementptr inbounds %Type, %Type* %17, i1 0, i32 13
  %19 = getelementptr inbounds %TypeUnion, %TypeUnion* %18, i1 0, i32 0
  %20 = call i1 (%List*, %Type*) @func158 (%List* %19, %Type* %7)
  %21 = xor i1 %20, 1
  br i1 %21, label %then_1, label %else_1
then_1:
;stmt5:
  %22 = bitcast [11 x %Nat8]* @func475_str2 to %Str
  %23 = getelementptr inbounds %Value, %Value* %4, i1 0, i32 19
  %24 = load %TokenInfo*, %TokenInfo** %23
  call void (%Str, %TokenInfo*) @error (%Str %22, %TokenInfo* %24)
;stmt6:
  br label %fail
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt7:
  %26 = getelementptr inbounds %Value, %Value* %4, i1 0, i32 1
  %27 = load %Type*, %Type** %26
  %28 = call %Nat32 (%Type*, %Type*) @func432 (%Type* %27, %Type* %7)
;stmt8:
  %29 = load %Type*, %Type** @typeBool
  %30 = getelementptr inbounds %AstValueIs, %AstValueIs* %0, i1 0, i32 2
  %31 = load %TokenInfo*, %TokenInfo** %30
  %32 = call %Value* (%ValueKind, %Type*, %TokenInfo*) @func437 (%ValueKind 39, %Type* %29, %TokenInfo* %31)
;stmt9:
  %33 = getelementptr inbounds %Value, %Value* %32, i1 0, i32 16
  %34 = load %Type*, %Type** @typeBool
  %35 = insertvalue %ValueIs zeroinitializer, %Type* %34, 0
  %36 = insertvalue %ValueIs %35, %Value* %4, 1
  %37 = insertvalue %ValueIs %36, %Nat32 %28, 2
  %38 = getelementptr inbounds %AstValueIs, %AstValueIs* %0, i1 0, i32 2
  %39 = load %TokenInfo*, %TokenInfo** %38
  %40 = insertvalue %ValueIs %37, %TokenInfo* %39, 3
  store %ValueIs %40, %ValueIs* %33, align 8
;stmt10:
  ret %Value* %32
;stmt11:
  br label %fail
fail:
;stmt12:
  %42 = getelementptr inbounds %AstValueIs, %AstValueIs* %0, i1 0, i32 2
  %43 = load %TokenInfo*, %TokenInfo** %42
  %44 = call %Value* (%TokenInfo*) @value_new_poison (%TokenInfo* %43)
  ret %Value* %44
}

define %Value* @func476 (%AstValueAs*) {
;stmt0:
  %2 = getelementptr inbounds %AstValueAs, %AstValueAs* %0, i1 0, i32 0
  %3 = load %AstValue*, %AstValue** %2
  %4 = call %Value* (%AstValue*) @func442 (%AstValue* %3)
;stmt1:
  %5 = getelementptr inbounds %AstValueAs, %AstValueAs* %0, i1 0, i32 1
  %6 = load %AstType*, %AstType** %5
  %7 = call %Type* (%AstType*) @func400 (%AstType* %6)
;stmt2:
  %8 = getelementptr inbounds %AstValueAs, %AstValueAs* %0, i1 0, i32 2
  %9 = load %TokenInfo*, %TokenInfo** %8
;stmt3:
  %10 = getelementptr inbounds %Value, %Value* %4, i1 0, i32 0
  %11 = load %ValueKind, %ValueKind* %10
  %12 = icmp eq %ValueKind %11, 1
  br i1 %12, label %then_0, label %else_0
then_0:
;stmt4:
  br label %fail
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt5:
  %14 = getelementptr inbounds %Type, %Type* %7, i1 0, i32 0
  %15 = load %TypeKind, %TypeKind* %14
  %16 = icmp eq %TypeKind %15, 2
  br i1 %16, label %then_1, label %else_1
then_1:
;stmt6:
  br label %fail
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt7:
  %18 = getelementptr inbounds %Value, %Value* %4, i1 0, i32 1
  %19 = load %Type*, %Type** %18
  %20 = getelementptr inbounds %Type, %Type* %19, i1 0, i32 13
  %21 = getelementptr inbounds %TypeUnion, %TypeUnion* %20, i1 0, i32 0
  %22 = call i1 (%List*, %Type*) @func158 (%List* %21, %Type* %7)
  %23 = xor i1 %22, 1
  br i1 %23, label %then_2, label %else_2
then_2:
;stmt8:
  %24 = bitcast [11 x %Nat8]* @func476_str1 to %Str
  %25 = getelementptr inbounds %Value, %Value* %4, i1 0, i32 19
  %26 = load %TokenInfo*, %TokenInfo** %25
  call void (%Str, %TokenInfo*) @error (%Str %24, %TokenInfo* %26)
;stmt9:
  br label %fail
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
;stmt10:
  %28 = getelementptr inbounds %Value, %Value* %4, i1 0, i32 1
  %29 = load %Type*, %Type** %28
  %30 = getelementptr inbounds %Type, %Type* %29, i1 0, i32 13
  %31 = getelementptr inbounds %TypeUnion, %TypeUnion* %30, i1 0, i32 1
  %32 = load %Type*, %Type** %31; loadImmPtr
  %33 = inttoptr i64 0 to%Type*
  %34 = icmp ne %Type* %32, %33
  br i1 %34, label %then_3, label %else_3
then_3:
;stmt11:
  %35 = getelementptr inbounds %AstValueAs, %AstValueAs* %0, i1 0, i32 2
  %36 = load %TokenInfo*, %TokenInfo** %35
  %37 = call %Value* (%Value*, %Type*, %TokenInfo*) @func492 (%Value* %4, %Type* %7, %TokenInfo* %36)
  ret %Value* %37
  br label %endif_3
else_3:
  br label %endif_3
endif_3:
;stmt12:
  %39 = call %Value* (%Value*, %Type*, %TokenInfo*) @func492 (%Value* %4, %Type* %7, %TokenInfo* %9)
  ret %Value* %39
;stmt13:
  br label %fail
fail:
;stmt14:
  %41 = getelementptr inbounds %AstValueAs, %AstValueAs* %0, i1 0, i32 2
  %42 = load %TokenInfo*, %TokenInfo** %41
  %43 = call %Value* (%TokenInfo*) @value_new_poison (%TokenInfo* %42)
  ret %Value* %43
}

define %Value* @func477 (%AstValueSizeof*) {
;stmt0:
  %2 = getelementptr inbounds %AstValueSizeof, %AstValueSizeof* %0, i1 0, i32 0
  %3 = load %AstType*, %AstType** %2
  %4 = call %Type* (%AstType*) @func400 (%AstType* %3)
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
  %12 = bitcast [20 x %Nat8]* @func477_str1 to %Str
  %13 = getelementptr inbounds %AstValueSizeof, %AstValueSizeof* %0, i1 0, i32 0
  %14 = load %AstType*, %AstType** %13
  %15 = getelementptr inbounds %AstType, %AstType* %14, i1 0, i32 11
  %16 = load %TokenInfo*, %TokenInfo** %15
  call void (%Str, %TokenInfo*) @error (%Str %12, %TokenInfo* %16)
;stmt5:
  %17 = getelementptr inbounds %AstValueSizeof, %AstValueSizeof* %0, i1 0, i32 1
  %18 = load %TokenInfo*, %TokenInfo** %17
  %19 = call %Value* (%TokenInfo*) @value_new_poison (%TokenInfo* %18)
  ret %Value* %19
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt6:
  %21 = load %Type*, %Type** @typeNumeric
  %22 = getelementptr inbounds %Type, %Type* %4, i1 0, i32 3
  %23 = load %Nat32, %Nat32* %22
  %24 = sext %Nat32 %23 to %Int64
  %25 = getelementptr inbounds %AstValueSizeof, %AstValueSizeof* %0, i1 0, i32 1
  %26 = load %TokenInfo*, %TokenInfo** %25
  %27 = call %Value* (%Type*, %Int64, %TokenInfo*) @func439 (%Type* %21, %Int64 %24, %TokenInfo* %26)
  ret %Value* %27
;stmt7:
  br label %fail
fail:
;stmt8:
  %29 = getelementptr inbounds %AstValueSizeof, %AstValueSizeof* %0, i1 0, i32 1
  %30 = load %TokenInfo*, %TokenInfo** %29
  %31 = call %Value* (%TokenInfo*) @value_new_poison (%TokenInfo* %30)
  ret %Value* %31
}

define %Value* @func478 (%AstValueAlignof*) {
;stmt0:
  %2 = getelementptr inbounds %AstValueAlignof, %AstValueAlignof* %0, i1 0, i32 0
  %3 = load %AstType*, %AstType** %2
  %4 = call %Type* (%AstType*) @func400 (%AstType* %3)
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
  %12 = bitcast [21 x %Nat8]* @func478_str1 to %Str
  %13 = getelementptr inbounds %AstValueAlignof, %AstValueAlignof* %0, i1 0, i32 0
  %14 = load %AstType*, %AstType** %13
  %15 = getelementptr inbounds %AstType, %AstType* %14, i1 0, i32 11
  %16 = load %TokenInfo*, %TokenInfo** %15
  call void (%Str, %TokenInfo*) @error (%Str %12, %TokenInfo* %16)
;stmt5:
  %17 = getelementptr inbounds %AstValueAlignof, %AstValueAlignof* %0, i1 0, i32 1
  %18 = load %TokenInfo*, %TokenInfo** %17
  %19 = call %Value* (%TokenInfo*) @value_new_poison (%TokenInfo* %18)
  ret %Value* %19
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt6:
  %21 = load %Type*, %Type** @typeNumeric
  %22 = getelementptr inbounds %Type, %Type* %4, i1 0, i32 3
  %23 = load %Nat32, %Nat32* %22
  %24 = sext %Nat32 %23 to %Int64
  %25 = getelementptr inbounds %AstValueAlignof, %AstValueAlignof* %0, i1 0, i32 1
  %26 = load %TokenInfo*, %TokenInfo** %25
  %27 = call %Value* (%Type*, %Int64, %TokenInfo*) @func439 (%Type* %21, %Int64 %24, %TokenInfo* %26)
  ret %Value* %27
;stmt7:
  br label %fail
fail:
;stmt8:
  %29 = getelementptr inbounds %AstValueAlignof, %AstValueAlignof* %0, i1 0, i32 1
  %30 = load %TokenInfo*, %TokenInfo** %29
  %31 = call %Value* (%TokenInfo*) @value_new_poison (%TokenInfo* %30)
  ret %Value* %31
}

define %Value* @func479 (%AstName*) {
;stmt0:
  %2 = getelementptr inbounds %AstName, %AstName* %0, i1 0, i32 0
  %3 = load %AstId*, %AstId** %2
  %4 = getelementptr inbounds %AstId, %AstId* %3, i1 0, i32 0
  %5 = load %Str, %Str* %4
;stmt1:
  %6 = call %Value* (%Str) @func139 (%Str %5)
;stmt2:; loadImmPtr
  %7 = inttoptr i64 0 to%Value*
  %8 = icmp eq %Value* %6, %7
  br i1 %8, label %then_0, label %else_0
then_0:
;stmt3:
  %9 = bitcast [16 x %Nat8]* @func479_str1 to %Str
  %10 = getelementptr inbounds %AstName, %AstName* %0, i1 0, i32 2
  %11 = load %TokenInfo*, %TokenInfo** %10
  call void (%Str, %TokenInfo*) @error (%Str %9, %TokenInfo* %11)
;stmt4:
  %12 = getelementptr inbounds %AstName, %AstName* %0, i1 0, i32 2
  %13 = load %TokenInfo*, %TokenInfo** %12
  %14 = call %Value* (%TokenInfo*) @value_new_poison (%TokenInfo* %13)
;stmt5:
  ret %Value* %14
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt6:
  ret %Value* %6
}

define %Value* @func480 (%AstValueNumber*) {
;stmt0:
  %2 = getelementptr inbounds %AstValueNumber, %AstValueNumber* %0, i1 0, i32 0
  %3 = load %Str, %Str* %2
;stmt1:
  %4 = alloca %Int64
  store %Int64 0, %Int64* %4, align 8
;stmt2:
; eval index uarray
  %5 = getelementptr inbounds %Nat8, %Nat8* %3, %Int64 0
  %6 = load %Nat8, %Nat8* %5
; index array
  %7 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func480_str1, i1 0, %Int64 0
  %8 = load %Nat8, %Nat8* %7
  %9 = icmp eq %Nat8 %6, %8
; eval index uarray
  %10 = getelementptr inbounds %Nat8, %Nat8* %3, %Int64 1
  %11 = load %Nat8, %Nat8* %10
; index array
  %12 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func480_str2, i1 0, %Int64 0
  %13 = load %Nat8, %Nat8* %12
  %14 = icmp eq %Nat8 %11, %13
  %15 = and i1 %9, %14
  br i1 %15, label %then_0, label %else_0
then_0:
;stmt3:
; eval index uarray
  %16 = getelementptr inbounds %Nat8, %Nat8* %3, %Int64 2
  %17 = bitcast %Nat8* %16 to %Unit*
  %18 = bitcast [5 x %Nat8]* @func480_str3 to %Str
  %19 = getelementptr inbounds %Int64, %Int64* %4, i1 0
  %20 = call %Int32 (%Unit*, %Str, ...) @sscanf (%Unit* %17, %Str %18, %Int64* %19)
  br label %endif_0
else_0:
;stmt4:
; eval index uarray
  %21 = getelementptr inbounds %Nat8, %Nat8* %3, %Int64 0
  %22 = bitcast %Nat8* %21 to %Unit*
  %23 = bitcast [5 x %Nat8]* @func480_str4 to %Str
  %24 = getelementptr inbounds %Int64, %Int64* %4, i1 0
  %25 = call %Int32 (%Unit*, %Str, ...) @sscanf (%Unit* %22, %Str %23, %Int64* %24)
  br label %endif_0
endif_0:
;stmt5:
  %26 = load %Type*, %Type** @typeNumeric
  %27 = load %Int64, %Int64* %4
  %28 = getelementptr inbounds %AstValueNumber, %AstValueNumber* %0, i1 0, i32 1
  %29 = load %TokenInfo*, %TokenInfo** %28
  %30 = call %Value* (%Type*, %Int64, %TokenInfo*) @func439 (%Type* %26, %Int64 %27, %TokenInfo* %29)
  ret %Value* %30
}

define %Value* @func481 (%AstValueString*) {
;stmt0:
  %2 = getelementptr inbounds %AstValueString, %AstValueString* %0, i1 0, i32 0
  %3 = load %Str, %Str* %2
;stmt1:
  %4 = call %Nat32 (%Str) @strlen (%Str %3)
  %5 = add %Nat32 %4, 1
;stmt2:
  %6 = load %Type*, %Type** @typeChar
  %7 = getelementptr inbounds %AstValueString, %AstValueString* %0, i1 0, i32 1
  %8 = load %TokenInfo*, %TokenInfo** %7
  %9 = call %Type* (%Type*, %Nat32, %TokenInfo*) @func384 (%Type* %6, %Nat32 %5, %TokenInfo* %8)
  %10 = getelementptr inbounds %AstValueString, %AstValueString* %0, i1 0, i32 1
  %11 = load %TokenInfo*, %TokenInfo** %10
  %12 = call %Type* (%Type*, %TokenInfo*) @func382 (%Type* %9, %TokenInfo* %11)
;stmt3:
  %13 = getelementptr inbounds %AstValueString, %AstValueString* %0, i1 0, i32 1
  %14 = load %TokenInfo*, %TokenInfo** %13
  %15 = call %Value* (%ValueKind, %Type*, %TokenInfo*) @func437 (%ValueKind 5, %Type* %12, %TokenInfo* %14)
;stmt4:
  %16 = call %Str () @func154 ()
;stmt5:
  %17 = getelementptr inbounds %Value, %Value* %15, i1 0, i32 6
  %18 = getelementptr inbounds %Assembly, %Assembly* @asm0, i1 0
  %19 = call %Definition* (%Assembly*, %Str, %Str, %Nat32) @func270 (%Assembly* %18, %Str %16, %Str %3, %Nat32 %5)
  store %Definition* %19, %Definition** %17, align 8
;stmt6:
  ret %Value* %15
}

define void @func483 (%Unit*, %Unit*, %Nat32, %Node*) {
;stmt0:
  %5 = bitcast %Unit* %0 to %Decl*
;stmt1:
  %6 = bitcast %Unit* %1 to %StmtBlock*
;stmt2:
  %7 = getelementptr inbounds %Decl, %Decl* %5, i1 0, i32 1
  %8 = load %Type*, %Type** %7
  %9 = getelementptr inbounds %Decl, %Decl* %5, i1 0, i32 6
  %10 = load %TokenInfo*, %TokenInfo** %9
  %11 = call %Value* (%ValueKind, %Type*, %TokenInfo*) @func437 (%ValueKind 7, %Type* %8, %TokenInfo* %10)
;stmt3:
  %12 = getelementptr inbounds %Value, %Value* %11, i1 0, i32 8
  store %Decl* %5, %Decl** %12, align 8
;stmt4:
  %13 = getelementptr inbounds %StmtBlock, %StmtBlock* %6, i1 0, i32 1
  %14 = getelementptr inbounds %Index, %Index* %13, i1 0, i32 1
  %15 = getelementptr inbounds %Decl, %Decl* %5, i1 0, i32 0
  %16 = load %AstId*, %AstId** %15
  %17 = getelementptr inbounds %AstId, %AstId* %16, i1 0, i32 0
  %18 = load %Str, %Str* %17
  %19 = bitcast %Value* %11 to %Unit*
  %20 = call i1 (%List*, %Str, %Unit*) @map_append (%List* %14, %Str %18, %Unit* %19)
  ret void
}

define %Value* @func482 (%AstValueFunc*) {
;stmt0:
  %2 = getelementptr inbounds %AstValueFunc, %AstValueFunc* %0, i1 0, i32 0
  %3 = load %AstType*, %AstType** %2
  %4 = call %Type* (%AstType*) @func400 (%AstType* %3)
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
  %9 = load %Nat32, %Nat32* @fuid
  %10 = add %Nat32 %9, 1
  store %Nat32 %10, %Nat32* @fuid, align 4
;stmt4:
  %11 = bitcast [5 x %Nat8]* @func482_str1 to %Str
  %12 = load %Nat32, %Nat32* @fuid
  %13 = call %Str (%Str, %Nat32) @func149 (%Str %11, %Nat32 %12)
;stmt5:
  %14 = getelementptr inbounds %AstValueFunc, %AstValueFunc* %0, i1 0, i32 1
  %15 = load %union.0, %union.0* %14
  %16 = bitcast %Int64 0 to %Int64
  %17 = ptrtoint %union.0 %15 to %Int64
  %18 = icmp eq %Int64 %17, %16
  br i1 %18, label %then_1, label %else_1
then_1:
;stmt6:
  %19 = getelementptr inbounds %AstValueFunc, %AstValueFunc* %0, i1 0, i32 2
  %20 = load %TokenInfo*, %TokenInfo** %19
  %21 = call %Value* (%ValueKind, %Type*, %TokenInfo*) @func437 (%ValueKind 5, %Type* %4, %TokenInfo* %20)
;stmt7:
  %22 = getelementptr inbounds %Value, %Value* %21, i1 0, i32 6
  %23 = getelementptr inbounds %Assembly, %Assembly* @asm0, i1 0; loadImmPtr
  %24 = inttoptr i64 0 to%StmtBlock*
  %25 = call %Definition* (%Assembly*, %Str, %Type*, %StmtBlock*) @func272 (%Assembly* %23, %Str %13, %Type* %4, %StmtBlock* %24)
  store %Definition* %25, %Definition** %22, align 8
;stmt8:
  ret %Value* %21
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt9:
  %27 = call %Unit* (%Nat32) @malloc (%Nat32 144)
  %28 = bitcast %Unit* %27 to %StmtBlock*; loadImmPtr
  %29 = inttoptr i64 0 to%StmtBlock*
  %30 = call %StmtBlock* (%StmtBlock*, %StmtBlock*) @func510 (%StmtBlock* %28, %StmtBlock* %29)
;stmt10:
  %31 = getelementptr inbounds %Type, %Type* %4, i1 0, i32 6
  %32 = getelementptr inbounds %TypeFunc, %TypeFunc* %31, i1 0, i32 0
  %33 = load %Type*, %Type** %32
  %34 = getelementptr inbounds %Type, %Type* %33, i1 0, i32 10
  %35 = getelementptr inbounds %TypeRecord, %TypeRecord* %34, i1 0, i32 0
  %36 = load %List*, %List** %35
  %37 = bitcast %StmtBlock* %30 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @func64 (%List* %36, %ListForeachHandler @func483, %Unit* %37)
;stmt11:
  %38 = getelementptr inbounds %AstValueFunc, %AstValueFunc* %0, i1 0, i32 1
  %39 = load %union.0, %union.0* %38
;stmt12:
  %40 = bitcast %Int64 0 to %Int64
  %41 = ptrtoint %union.0 %39 to %Int64
  %42 = icmp eq %Int64 %41, %40
  br i1 %42, label %then_2, label %else_2
then_2:
;stmt13:
  br label %fail
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
;stmt14:
  %44 = getelementptr inbounds %AstValueFunc, %AstValueFunc* %0, i1 0, i32 2
  %45 = load %TokenInfo*, %TokenInfo** %44
  %46 = call %Value* (%ValueKind, %Type*, %TokenInfo*) @func437 (%ValueKind 5, %Type* %4, %TokenInfo* %45)
;stmt15:
  %47 = load %FuncContext*, %FuncContext** @fctx; loadImmPtr
  %48 = inttoptr i64 0 to%FuncContext*
  %49 = icmp ne %FuncContext* %47, %48
  br i1 %49, label %then_3, label %else_3
then_3:
;stmt16:
  %50 = load %FuncContext*, %FuncContext** @fctx
  %51 = getelementptr inbounds %FuncContext, %FuncContext* %50, i1 0, i32 2
  %52 = load %StmtBlock*, %StmtBlock** %51
  %53 = getelementptr inbounds %StmtBlock, %StmtBlock* %52, i1 0, i32 3
  %54 = bitcast %Value* %46 to %Unit*
  %55 = call i1 (%List*, %Unit*) @list_append (%List* %53, %Unit* %54)
  br label %endif_3
else_3:
  br label %endif_3
endif_3:
;stmt17:
  %56 = load %FuncContext*, %FuncContext** @fctx
;stmt18:
  %57 = call %Unit* (%Nat32) @malloc (%Nat32 48)
  %58 = bitcast %Unit* %57 to %FuncContext*
  store %FuncContext* %58, %FuncContext** @fctx, align 8
;stmt19:
  %59 = load %FuncContext*, %FuncContext** @fctx
  %60 = bitcast %FuncContext* %59 to %Unit*
  %61 = call %Unit* (%Unit*, %Nat8, %Nat32) @memset (%Unit* %60, %Nat8 0, %Nat32 48)
;stmt20:
  %62 = load %FuncContext*, %FuncContext** @fctx
  %63 = getelementptr inbounds %FuncContext, %FuncContext* %62, i1 0, i32 0
  br label %select_1_0
select_1_0:; loadImmPtr
  %64 = inttoptr i64 0 to%FuncContext*
  %65 = icmp eq %FuncContext* %56, %64
  br i1 %65, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  br label %select_1_end
select_1_1:
  %66 = getelementptr inbounds %FuncContext, %FuncContext* %56, i1 0, i32 0
  %67 = load %Str, %Str* %66
  %68 = bitcast [2 x %Nat8]* @func482_str2 to %Str
  %69 = call %Str (%Str, %Str, %Str) @cat3 (%Str %67, %Str %68, %Str %13)
  br label %select_1_end
select_1_end:
  %70 = phi %Str [ %13, %select_1_0_ok ], [ %69, %select_1_1 ]
  store %Str %70, %Str* %63, align 8
;stmt21:
  %71 = load %FuncContext*, %FuncContext** @fctx
  %72 = getelementptr inbounds %FuncContext, %FuncContext* %71, i1 0, i32 2
  store %StmtBlock* %30, %StmtBlock** %72, align 8
;stmt22:
  %73 = load %FuncContext*, %FuncContext** @fctx
  %74 = getelementptr inbounds %FuncContext, %FuncContext* %73, i1 0, i32 1
  store %Value* %46, %Value** %74, align 8
;stmt23:
  %75 = bitcast %union.0 %39 to %union.3*
  %76 = call %union.6 (%union.3*) @func507 (%union.3* %75)
;stmt24:
  %77 = bitcast %Int64 0 to %Int64
  %78 = ptrtoint %union.6 %76 to %Int64
  %79 = icmp eq %Int64 %78, %77
  br i1 %79, label %then_4, label %else_4
then_4:
;stmt25:
  br label %fail
  br label %endif_4
else_4:
  br label %endif_4
endif_4:
;stmt26:
  %81 = bitcast %union.6 %76 to %Stmt*
;stmt27:
  %82 = getelementptr inbounds %Value, %Value* %46, i1 0, i32 6
  %83 = getelementptr inbounds %Assembly, %Assembly* @asm0, i1 0
  %84 = getelementptr inbounds %Stmt, %Stmt* %81, i1 0, i32 3
  %85 = call %Definition* (%Assembly*, %Str, %Type*, %StmtBlock*) @func272 (%Assembly* %83, %Str %13, %Type* %4, %StmtBlock* %84)
  store %Definition* %85, %Definition** %82, align 8
;stmt28:
  store %FuncContext* %56, %FuncContext** @fctx, align 8
;stmt29:
  ret %Value* %46
;stmt30:
  br label %fail
fail:
;stmt31:
  store %FuncContext* %56, %FuncContext** @fctx, align 8
;stmt32:
  %87 = getelementptr inbounds %AstValueFunc, %AstValueFunc* %0, i1 0, i32 2
  %88 = load %TokenInfo*, %TokenInfo** %87
  %89 = call %Value* (%TokenInfo*) @value_new_poison (%TokenInfo* %88)
  ret %Value* %89
}

define %Value* @func484 (%AstValueArray*) {
;stmt0:
  %2 = bitcast [15 x %Nat8]* @func484_str1 to %Str
  call void (%Str) @fatal (%Str %2)
;stmt1:
  br label %fail
fail:
;stmt2:
  %3 = getelementptr inbounds %AstValueArray, %AstValueArray* %0, i1 0, i32 1
  %4 = load %TokenInfo*, %TokenInfo** %3
  %5 = call %Value* (%TokenInfo*) @value_new_poison (%TokenInfo* %4)
  ret %Value* %5
}

define void @func486 (%Unit*, %Unit*, %Unit*) {
;stmt0:
  %4 = bitcast %Unit* %0 to %Str
;stmt1:
  %5 = bitcast %Unit* %1 to %AstValue*
;stmt2:
  %6 = bitcast %Unit* %2 to %func485.type12*
;stmt3:
  %7 = call %Value* (%AstValue*) @func442 (%AstValue* %5)
;stmt4:
  %8 = call %Unit* (%Nat32) @malloc (%Nat32 16)
  %9 = bitcast %Unit* %8 to %AstId*
;stmt5:
  %10 = insertvalue %AstId zeroinitializer, %Str %4, 0; loadImmPtr
  %11 = inttoptr i64 0 to%TokenInfo*
  %12 = insertvalue %AstId %10, %TokenInfo* %11, 1
  store %AstId %12, %AstId* %9, align 8
;stmt6:
  %13 = getelementptr inbounds %Value, %Value* %7, i1 0, i32 1
  %14 = load %Type*, %Type** %13; loadImmPtr
  %15 = inttoptr i64 0 to%TokenInfo*
  %16 = call %Decl* (%AstId*, %Type*, %TokenInfo*) @func409 (%AstId* %9, %Type* %14, %TokenInfo* %15)
;stmt7:
  %17 = getelementptr inbounds %func485.type12, %func485.type12* %6, i1 0, i32 0
  %18 = load %Type*, %Type** %17
  %19 = getelementptr inbounds %Type, %Type* %18, i1 0, i32 10
  %20 = getelementptr inbounds %TypeRecord, %TypeRecord* %19, i1 0, i32 0
  %21 = load %List*, %List** %20
  %22 = bitcast %Decl* %16 to %Unit*
  %23 = call i1 (%List*, %Unit*) @list_append (%List* %21, %Unit* %22)
;stmt8:
  %24 = getelementptr inbounds %func485.type12, %func485.type12* %6, i1 0, i32 1
  %25 = bitcast %Value* %7 to %Unit*
  %26 = call i1 (%List*, %Str, %Unit*) @map_append (%List* %24, %Str %4, %Unit* %25)
  ret void
}

define %Value* @func485 (%AstValueRecord*) {
;stmt0:
  %2 = call %Token* () @func190 ()
  %3 = getelementptr inbounds %Token, %Token* %2, i1 0, i32 1
;stmt1:
  %4 = call %Type* (%TypeKind, %Nat32, %TokenInfo*) @func380 (%TypeKind 4, %Nat32 0, %TokenInfo* %3)
;stmt2:
  %5 = getelementptr inbounds %Type, %Type* %4, i1 0, i32 10
  %6 = getelementptr inbounds %TypeRecord, %TypeRecord* %5, i1 0, i32 0
  %7 = call %List* () @map_new ()
  store %List* %7, %List** %6, align 8
;stmt3:
  %8 = alloca %func485.type12
  %9 = insertvalue %func485.type12 zeroinitializer, %Type* %4, 0
  store %func485.type12 %9, %func485.type12* %8, align 8
;stmt4:
  %10 = getelementptr inbounds %AstValueRecord, %AstValueRecord* %0, i1 0, i32 0
  %11 = getelementptr inbounds %func485.type12, %func485.type12* %8, i1 0
  %12 = bitcast %func485.type12* %11 to %Unit*
  call void (%List*, %MapForeachHandler, %Unit*) @map_foreach (%List* %10, %MapForeachHandler @func486, %Unit* %12)
;stmt5:
  %13 = getelementptr inbounds %AstValueRecord, %AstValueRecord* %0, i1 0, i32 1
  %14 = load %TokenInfo*, %TokenInfo** %13
  %15 = call %Value* (%ValueKind, %Type*, %TokenInfo*) @func437 (%ValueKind 9, %Type* %4, %TokenInfo* %14)
;stmt6:
  %16 = getelementptr inbounds %Value, %Value* %15, i1 0, i32 4
  %17 = insertvalue %ValueRecord zeroinitializer, %Type* %4, 0
  %18 = getelementptr inbounds %func485.type12, %func485.type12* %8, i1 0, i32 1
  %19 = load %List, %List* %18
  %20 = insertvalue %ValueRecord %17, %List %19, 1
  store %ValueRecord %20, %ValueRecord* %16, align 8
;stmt7:
  ret %Value* %15
;stmt8:
  br label %fail
fail:
;stmt9:
  %22 = getelementptr inbounds %AstValueRecord, %AstValueRecord* %0, i1 0, i32 1
  %23 = load %TokenInfo*, %TokenInfo** %22
  %24 = call %Value* (%TokenInfo*) @value_new_poison (%TokenInfo* %23)
  ret %Value* %24
}

define %Value* @func487 (%AstValueUnary*) {
;stmt0:
  %2 = getelementptr inbounds %AstValueUnary, %AstValueUnary* %0, i1 0, i32 1
  %3 = load %AstValue*, %AstValue** %2
  %4 = call %Value* (%AstValue*) @func442 (%AstValue* %3)
;stmt1:
  %5 = getelementptr inbounds %Value, %Value* %4, i1 0, i32 0
  %6 = load %ValueKind, %ValueKind* %5
  %7 = icmp eq %ValueKind %6, 1
  br i1 %7, label %then_0, label %else_0
then_0:
;stmt2:
  br label %fail
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt3:
  %9 = call i1 (%Value*) @is_value_imm_num (%Value* %4)
  br i1 %9, label %then_1, label %else_1
then_1:
;stmt4:
  %10 = getelementptr inbounds %Value, %Value* %4, i1 0, i32 1
  %11 = load %Type*, %Type** %10
  %12 = getelementptr inbounds %Value, %Value* %4, i1 0, i32 2
  %13 = getelementptr inbounds %ValueImm, %ValueImm* %12, i1 0, i32 1
  %14 = load %Int64, %Int64* %13
  %15 = getelementptr inbounds %AstValueUnary, %AstValueUnary* %0, i1 0, i32 2
  %16 = load %TokenInfo*, %TokenInfo** %15
  %17 = call %Value* (%Type*, %Int64, %TokenInfo*) @func439 (%Type* %11, %Int64 %14, %TokenInfo* %16)
  ret %Value* %17
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt5:
  %19 = getelementptr inbounds %Value, %Value* %4, i1 0, i32 1
  %20 = load %Type*, %Type** %19
  %21 = getelementptr inbounds %AstValueUnary, %AstValueUnary* %0, i1 0, i32 2
  %22 = load %TokenInfo*, %TokenInfo** %21
  %23 = call %Value* (%ValueKind, %Type*, %TokenInfo*) @func437 (%ValueKind 17, %Type* %20, %TokenInfo* %22)
;stmt6:
  %24 = getelementptr inbounds %Value, %Value* %23, i1 0, i32 10
  %25 = getelementptr inbounds %Value, %Value* %4, i1 0, i32 1
  %26 = load %Type*, %Type** %25
  %27 = insertvalue %ValueUn zeroinitializer, %Type* %26, 0
  %28 = insertvalue %ValueUn %27, %Value* %4, 1
  %29 = getelementptr inbounds %AstValueUnary, %AstValueUnary* %0, i1 0, i32 2
  %30 = load %TokenInfo*, %TokenInfo** %29
  %31 = insertvalue %ValueUn %28, %TokenInfo* %30, 2
  store %ValueUn %31, %ValueUn* %24, align 8
;stmt7:
  ret %Value* %23
;stmt8:
  br label %fail
fail:
;stmt9:
  %33 = getelementptr inbounds %AstValueUnary, %AstValueUnary* %0, i1 0, i32 2
  %34 = load %TokenInfo*, %TokenInfo** %33
  %35 = call %Value* (%TokenInfo*) @value_new_poison (%TokenInfo* %34)
  ret %Value* %35
}

define %Value* @func488 (%AstValueUnary*) {
;stmt0:
  %2 = getelementptr inbounds %AstValueUnary, %AstValueUnary* %0, i1 0, i32 1
  %3 = load %AstValue*, %AstValue** %2
  %4 = call %Value* (%AstValue*) @func442 (%AstValue* %3)
;stmt1:
  %5 = getelementptr inbounds %Value, %Value* %4, i1 0, i32 0
  %6 = load %ValueKind, %ValueKind* %5
  %7 = icmp eq %ValueKind %6, 1
  br i1 %7, label %then_0, label %else_0
then_0:
;stmt2:
  br label %fail
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt3:
  %9 = call i1 (%Value*) @is_value_imm_num (%Value* %4)
  br i1 %9, label %then_1, label %else_1
then_1:
;stmt4:
  %10 = getelementptr inbounds %Value, %Value* %4, i1 0, i32 1
  %11 = load %Type*, %Type** %10
  %12 = getelementptr inbounds %Value, %Value* %4, i1 0, i32 2
  %13 = getelementptr inbounds %ValueImm, %ValueImm* %12, i1 0, i32 1
  %14 = load %Int64, %Int64* %13
  %15 = sub nsw %Int64 0, %14
  %16 = getelementptr inbounds %AstValueUnary, %AstValueUnary* %0, i1 0, i32 2
  %17 = load %TokenInfo*, %TokenInfo** %16
  %18 = call %Value* (%Type*, %Int64, %TokenInfo*) @func439 (%Type* %11, %Int64 %15, %TokenInfo* %17)
  ret %Value* %18
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt5:
  %20 = getelementptr inbounds %Value, %Value* %4, i1 0, i32 1
  %21 = load %Type*, %Type** %20
  %22 = getelementptr inbounds %AstValueUnary, %AstValueUnary* %0, i1 0, i32 2
  %23 = load %TokenInfo*, %TokenInfo** %22
  %24 = call %Value* (%ValueKind, %Type*, %TokenInfo*) @func437 (%ValueKind 16, %Type* %21, %TokenInfo* %23)
;stmt6:
  %25 = getelementptr inbounds %Value, %Value* %24, i1 0, i32 10
  %26 = getelementptr inbounds %Value, %Value* %4, i1 0, i32 1
  %27 = load %Type*, %Type** %26
  %28 = insertvalue %ValueUn zeroinitializer, %Type* %27, 0
  %29 = insertvalue %ValueUn %28, %Value* %4, 1
  %30 = getelementptr inbounds %AstValueUnary, %AstValueUnary* %0, i1 0, i32 2
  %31 = load %TokenInfo*, %TokenInfo** %30
  %32 = insertvalue %ValueUn %29, %TokenInfo* %31, 2
  store %ValueUn %32, %ValueUn* %25, align 8
;stmt7:
  ret %Value* %24
;stmt8:
  br label %fail
fail:
;stmt9:
  %34 = getelementptr inbounds %AstValueUnary, %AstValueUnary* %0, i1 0, i32 2
  %35 = load %TokenInfo*, %TokenInfo** %34
  %36 = call %Value* (%TokenInfo*) @value_new_poison (%TokenInfo* %35)
  ret %Value* %36
}

define %Value* @func489 (%AstValueUnary*) {
;stmt0:
  %2 = getelementptr inbounds %AstValueUnary, %AstValueUnary* %0, i1 0, i32 1
  %3 = load %AstValue*, %AstValue** %2
  %4 = call %Value* (%AstValue*) @func442 (%AstValue* %3)
;stmt1:
  %5 = getelementptr inbounds %Value, %Value* %4, i1 0, i32 0
  %6 = load %ValueKind, %ValueKind* %5
  %7 = icmp eq %ValueKind %6, 1
  br i1 %7, label %then_0, label %else_0
then_0:
;stmt2:
  br label %fail
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt3:
  %9 = call i1 (%Value*) @is_value_imm_num (%Value* %4)
  br i1 %9, label %then_1, label %else_1
then_1:
;stmt4:
  %10 = getelementptr inbounds %Value, %Value* %4, i1 0, i32 1
  %11 = load %Type*, %Type** %10
  %12 = getelementptr inbounds %Value, %Value* %4, i1 0, i32 2
  %13 = getelementptr inbounds %ValueImm, %ValueImm* %12, i1 0, i32 1
  %14 = load %Int64, %Int64* %13
  %15 = xor %Int64 %14, -1
  %16 = getelementptr inbounds %AstValueUnary, %AstValueUnary* %0, i1 0, i32 2
  %17 = load %TokenInfo*, %TokenInfo** %16
  %18 = call %Value* (%Type*, %Int64, %TokenInfo*) @func439 (%Type* %11, %Int64 %15, %TokenInfo* %17)
  ret %Value* %18
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt5:
  %20 = getelementptr inbounds %Value, %Value* %4, i1 0, i32 1
  %21 = load %Type*, %Type** %20
  %22 = getelementptr inbounds %AstValueUnary, %AstValueUnary* %0, i1 0, i32 2
  %23 = load %TokenInfo*, %TokenInfo** %22
  %24 = call %Value* (%ValueKind, %Type*, %TokenInfo*) @func437 (%ValueKind 15, %Type* %21, %TokenInfo* %23)
;stmt6:
  %25 = getelementptr inbounds %Value, %Value* %24, i1 0, i32 10
  %26 = getelementptr inbounds %Value, %Value* %4, i1 0, i32 1
  %27 = load %Type*, %Type** %26
  %28 = insertvalue %ValueUn zeroinitializer, %Type* %27, 0
  %29 = insertvalue %ValueUn %28, %Value* %4, 1
  %30 = getelementptr inbounds %AstValueUnary, %AstValueUnary* %0, i1 0, i32 2
  %31 = load %TokenInfo*, %TokenInfo** %30
  %32 = insertvalue %ValueUn %29, %TokenInfo* %31, 2
  store %ValueUn %32, %ValueUn* %25, align 8
;stmt7:
  ret %Value* %24
;stmt8:
  br label %fail
fail:
;stmt9:
  %34 = getelementptr inbounds %AstValueUnary, %AstValueUnary* %0, i1 0, i32 2
  %35 = load %TokenInfo*, %TokenInfo** %34
  %36 = call %Value* (%TokenInfo*) @value_new_poison (%TokenInfo* %35)
  ret %Value* %36
}

define %Value* @func490 (%ValueKind, %AstValueBinary*) {
;stmt0:
  %3 = getelementptr inbounds %AstValueBinary, %AstValueBinary* %1, i1 0, i32 1
  %4 = load %AstValue*, %AstValue** %3
  %5 = call %Value* (%AstValue*) @func442 (%AstValue* %4)
;stmt1:
  %6 = getelementptr inbounds %AstValueBinary, %AstValueBinary* %1, i1 0, i32 2
  %7 = load %AstValue*, %AstValue** %6
  %8 = call %Value* (%AstValue*) @func442 (%AstValue* %7)
;stmt2:
  %9 = getelementptr inbounds %Value, %Value* %5, i1 0, i32 0
  %10 = load %ValueKind, %ValueKind* %9
  %11 = icmp eq %ValueKind %10, 1
  br i1 %11, label %then_0, label %else_0
then_0:
;stmt3:
  br label %fail
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt4:
  %13 = getelementptr inbounds %Value, %Value* %8, i1 0, i32 0
  %14 = load %ValueKind, %ValueKind* %13
  %15 = icmp eq %ValueKind %14, 1
  br i1 %15, label %then_1, label %else_1
then_1:
;stmt5:
  br label %fail
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt6:
  %17 = call i1 (%Value*) @is_value_imm_num (%Value* %5)
  %18 = call i1 (%Value*) @is_value_imm_num (%Value* %8)
  %19 = and i1 %17, %18
  br i1 %19, label %then_2, label %else_2
then_2:
;stmt7:
  br label %select_1_0
select_1_0:
  %20 = icmp eq %ValueKind %0, 33
  br i1 %20, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %21 = getelementptr inbounds %Value, %Value* %5, i1 0, i32 2
  %22 = getelementptr inbounds %ValueImm, %ValueImm* %21, i1 0, i32 1
  %23 = load %Int64, %Int64* %22
  %24 = getelementptr inbounds %Value, %Value* %8, i1 0, i32 2
  %25 = getelementptr inbounds %ValueImm, %ValueImm* %24, i1 0, i32 1
  %26 = load %Int64, %Int64* %25
  %27 = shl %Int64 %23, %26
  br label %select_1_end
select_1_1:
  %28 = getelementptr inbounds %Value, %Value* %5, i1 0, i32 2
  %29 = getelementptr inbounds %ValueImm, %ValueImm* %28, i1 0, i32 1
  %30 = load %Int64, %Int64* %29
  %31 = getelementptr inbounds %Value, %Value* %8, i1 0, i32 2
  %32 = getelementptr inbounds %ValueImm, %ValueImm* %31, i1 0, i32 1
  %33 = load %Int64, %Int64* %32
  %34 = ashr %Int64 %30, %33
  br label %select_1_end
select_1_end:
  %35 = phi %Int64 [ %27, %select_1_0_ok ], [ %34, %select_1_1 ]
;stmt8:
  %36 = getelementptr inbounds %Value, %Value* %5, i1 0, i32 1
  %37 = load %Type*, %Type** %36
  %38 = getelementptr inbounds %AstValueBinary, %AstValueBinary* %1, i1 0, i32 3
  %39 = load %TokenInfo*, %TokenInfo** %38
  %40 = call %Value* (%Type*, %Int64, %TokenInfo*) @func439 (%Type* %37, %Int64 %35, %TokenInfo* %39)
  ret %Value* %40
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
;stmt9:
  %42 = call %Value* (%Value*) @func494 (%Value* %5)
;stmt10:
  %43 = getelementptr inbounds %Value, %Value* %5, i1 0, i32 1
  %44 = load %Type*, %Type** %43
  %45 = getelementptr inbounds %Value, %Value* %8, i1 0, i32 19
  %46 = load %TokenInfo*, %TokenInfo** %45
  %47 = call %Value* (%Value*, %Type*, %TokenInfo*) @func492 (%Value* %8, %Type* %44, %TokenInfo* %46)
;stmt11:
  %48 = getelementptr inbounds %Value, %Value* %5, i1 0, i32 1
  %49 = load %Type*, %Type** %48
;stmt12:
  %50 = getelementptr inbounds %AstValueBinary, %AstValueBinary* %1, i1 0, i32 3
  %51 = load %TokenInfo*, %TokenInfo** %50
  %52 = call %Value* (%ValueKind, %Type*, %TokenInfo*) @func437 (%ValueKind %0, %Type* %49, %TokenInfo* %51)
;stmt13:
  %53 = getelementptr inbounds %Value, %Value* %52, i1 0, i32 11
  %54 = insertvalue %ValueBin zeroinitializer, %Type* %49, 0
  %55 = insertvalue %ValueBin %54, %ValueKind %0, 1
  %56 = insertvalue %ValueBin %55, %Value* %42, 2
  %57 = insertvalue %ValueBin %56, %Value* %47, 3
  %58 = getelementptr inbounds %AstValueBinary, %AstValueBinary* %1, i1 0, i32 3
  %59 = load %TokenInfo*, %TokenInfo** %58
  %60 = insertvalue %ValueBin %57, %TokenInfo* %59, 4
  store %ValueBin %60, %ValueBin* %53, align 8
;stmt14:
  ret %Value* %52
;stmt15:
  br label %fail
fail:
;stmt16:
  %62 = getelementptr inbounds %AstValueBinary, %AstValueBinary* %1, i1 0, i32 3
  %63 = load %TokenInfo*, %TokenInfo** %62
  %64 = call %Value* (%TokenInfo*) @value_new_poison (%TokenInfo* %63)
  ret %Value* %64
}

define i1 @func491 (%ValueKind, %Type*) {
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
  %9 = icmp eq %TypeKind %8, 10
  %10 = call i1 (%Type*) @func391 (%Type* %1)
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
  %13 = icmp eq %ValueKind %0, 26
  %14 = icmp eq %ValueKind %0, 27
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
  %17 = call i1 (%Type*) @func390 (%Type* %1)
  br i1 %17, label %then_3, label %else_3
then_3:
;stmt7:
  ret i1 0
  br label %endif_3
else_3:
  br label %endif_3
endif_3:
;stmt8:
  %19 = icmp ne %ValueKind %0, 25
  %20 = icmp ne %ValueKind %0, 23
  %21 = icmp ne %ValueKind %0, 24
  %22 = and i1 %20, %21
  %23 = and i1 %19, %22
  br i1 %23, label %then_4, label %else_4
then_4:
;stmt9:
  %24 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 0
  %25 = load %TypeKind, %TypeKind* %24
  %26 = icmp eq %TypeKind %25, 9
  %27 = load %Type*, %Type** @typeBool
  %28 = call i1 (%Type*, %Type*) @func426 (%Type* %1, %Type* %27)
  %29 = call i1 (%Type*) @func390 (%Type* %1)
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

define i1 @func493 (%Value*, %Type*) {
;stmt0:
  %3 = call i1 (%Value*) @is_value_imm_num (%Value* %0)
  ret i1 %3
}

define %Value* @func492 (%Value*, %Type*, %TokenInfo*) {
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
  %14 = call i1 (%Type*, %Type*) @func426 (%Type* %13, %Type* %1)
  br i1 %14, label %then_2, label %else_2
then_2:
;stmt5:
  ret %Value* %0
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
;stmt6:
  %16 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 0
  %17 = load %TypeKind, %TypeKind* %16
  %18 = icmp eq %TypeKind %17, 14
  br i1 %18, label %then_3, label %else_3
then_3:
;stmt7:
  br label %sact
;stmt8:
  %20 = bitcast [32 x %Nat8]* @func492_str1 to %Str
  call void (%Str, %TokenInfo*) @error (%Str %20, %TokenInfo* %2)
;stmt9:
  %21 = call %Value* (%TokenInfo*) @value_new_poison (%TokenInfo* %2)
  ret %Value* %21
  br label %endif_3
else_3:
  br label %endif_3
endif_3:
;stmt10:
  %23 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 1
  %24 = load %Type*, %Type** %23
  %25 = getelementptr inbounds %Type, %Type* %24, i1 0, i32 0
  %26 = load %TypeKind, %TypeKind* %25
  %27 = icmp eq %TypeKind %26, 4
  %28 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 0
  %29 = load %TypeKind, %TypeKind* %28
  %30 = icmp eq %TypeKind %29, 10
  %31 = and i1 %27, %30
  br i1 %31, label %then_4, label %else_4
then_4:
;stmt11:
  %32 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 1
  %33 = load %Type*, %Type** %32
  %34 = call i1 (%Type*, %Type*) @func495 (%Type* %33, %Type* %1)
  %35 = xor i1 %34, 1
  br i1 %35, label %then_5, label %else_5
then_5:
;stmt12:
  %36 = bitcast [11 x %Nat8]* @func492_str2 to %Str
  call void (%Str, %TokenInfo*) @error (%Str %36, %TokenInfo* %2)
  br label %endif_5
else_5:
  br label %endif_5
endif_5:
;stmt13:
  %37 = call %Value* (%Value*, %Type*, %TokenInfo*) @do_value_cast_gen_rec (%Value* %0, %Type* %1, %TokenInfo* %2)
  ret %Value* %37
  br label %endif_4
else_4:
  br label %endif_4
endif_4:
;stmt14:
  %39 = call i1 (%Value*, %Type*) @func493 (%Value* %0, %Type* %1)
  br i1 %39, label %then_6, label %else_6
then_6:
;stmt15:
  %40 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 2
  %41 = getelementptr inbounds %ValueImm, %ValueImm* %40, i1 0, i32 1
  %42 = load %Int64, %Int64* %41
  %43 = call %Value* (%Type*, %Int64, %TokenInfo*) @func439 (%Type* %1, %Int64 %42, %TokenInfo* %2)
  ret %Value* %43
  br label %endif_6
else_6:
  br label %endif_6
endif_6:
;stmt16:
  br label %sact
sact:
;stmt17:
  %45 = call %Value* (%ValueKind, %Type*, %TokenInfo*) @func437 (%ValueKind 38, %Type* %1, %TokenInfo* %2)
;stmt18:
  %46 = getelementptr inbounds %Value, %Value* %45, i1 0, i32 14
  %47 = insertvalue %ValueCast zeroinitializer, %Type* %1, 0
  %48 = insertvalue %ValueCast %47, %Value* %0, 1
  %49 = insertvalue %ValueCast %48, %TokenInfo* %2, 3
  store %ValueCast %49, %ValueCast* %46, align 8
;stmt19:
  ret %Value* %45
;stmt20:
  br label %fail
fail:
;stmt21:
  %51 = call %Value* (%TokenInfo*) @value_new_poison (%TokenInfo* %2)
  ret %Value* %51
}

define %Value* @func494 (%Value*) {
;stmt0:
  %2 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 1
  %3 = load %Type*, %Type** %2
  %4 = load %Type*, %Type** @typeNumeric
  %5 = call i1 (%Type*, %Type*) @func426 (%Type* %3, %Type* %4)
  br label %select_1_0
select_1_0:
  %6 = icmp eq i1 %5, 1
  br i1 %6, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %7 = load %Type*, %Type** @typeBaseInt
  %8 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 2
  %9 = getelementptr inbounds %ValueImm, %ValueImm* %8, i1 0, i32 1
  %10 = load %Int64, %Int64* %9
  %11 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 19
  %12 = load %TokenInfo*, %TokenInfo** %11
  %13 = call %Value* (%Type*, %Int64, %TokenInfo*) @func439 (%Type* %7, %Int64 %10, %TokenInfo* %12)
  br label %select_1_end
select_1_1:
  br label %select_1_end
select_1_end:
  %14 = phi %Value* [ %13, %select_1_0_ok ], [ %0, %select_1_1 ]
  ret %Value* %14
}

define i1 @func496 (%Unit*, %Unit*, %Nat32) {
;stmt0:
  %4 = bitcast %Unit* %0 to %Decl*
;stmt1:
  %5 = bitcast %Unit* %1 to %Type*
;stmt2:
  %6 = getelementptr inbounds %Decl, %Decl* %4, i1 0, i32 0
  %7 = load %AstId*, %AstId** %6
  %8 = getelementptr inbounds %AstId, %AstId* %7, i1 0, i32 0
  %9 = load %Str, %Str* %8
  %10 = call %Decl* (%Type*, %Str) @func388 (%Type* %5, %Str %9)
;stmt3:; loadImmPtr
  %11 = inttoptr i64 0 to%Decl*
  %12 = icmp eq %Decl* %10, %11
  br i1 %12, label %then_0, label %else_0
then_0:
;stmt4:
  ret i1 1
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt5:
  %14 = getelementptr inbounds %Decl, %Decl* %4, i1 0, i32 1
  %15 = load %Type*, %Type** %14
  %16 = getelementptr inbounds %Decl, %Decl* %10, i1 0, i32 1
  %17 = load %Type*, %Type** %16
  %18 = call i1 (%Type*, %Type*) @func426 (%Type* %15, %Type* %17)
  %19 = xor i1 %18, 1
  br i1 %19, label %then_1, label %else_1
then_1:
;stmt6:
  %20 = getelementptr inbounds %Decl, %Decl* %4, i1 0, i32 1
  %21 = load %Type*, %Type** %20
  %22 = call i1 (%Type*) @type_is_generic_num (%Type* %21)
  %23 = getelementptr inbounds %Decl, %Decl* %10, i1 0, i32 1
  %24 = load %Type*, %Type** %23
  %25 = call i1 (%Type*) @func395 (%Type* %24)
  %26 = and i1 %22, %25
  br i1 %26, label %then_2, label %else_2
then_2:
;stmt7:
  ret i1 0
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
;stmt8:
  %28 = getelementptr inbounds %Decl, %Decl* %4, i1 0, i32 1
  %29 = load %Type*, %Type** %28
  %30 = getelementptr inbounds %Type, %Type* %29, i1 0, i32 0
  %31 = load %TypeKind, %TypeKind* %30
  %32 = icmp eq %TypeKind %31, 3
  %33 = getelementptr inbounds %Decl, %Decl* %10, i1 0, i32 1
  %34 = load %Type*, %Type** %33
  %35 = call i1 (%Type*) @func390 (%Type* %34)
  %36 = and i1 %32, %35
  br i1 %36, label %then_3, label %else_3
then_3:
;stmt9:
  ret i1 0
  br label %endif_3
else_3:
  br label %endif_3
endif_3:
;stmt10:
  %38 = getelementptr inbounds %Decl, %Decl* %10, i1 0, i32 1
  %39 = load %Type*, %Type** %38
  %40 = getelementptr inbounds %Type, %Type* %39, i1 0, i32 0
  %41 = load %TypeKind, %TypeKind* %40
  %42 = icmp eq %TypeKind %41, 14
  br i1 %42, label %then_4, label %else_4
then_4:
;stmt11:
  %43 = getelementptr inbounds %Decl, %Decl* %10, i1 0, i32 1
  %44 = load %Type*, %Type** %43
  %45 = getelementptr inbounds %Type, %Type* %44, i1 0, i32 13
  %46 = getelementptr inbounds %TypeUnion, %TypeUnion* %45, i1 0, i32 0
  %47 = call i1 (%List*, %Type*) @func158 (%List* %46, %Type* %5)
  %48 = xor i1 %47, 1
  ret i1 %48
  br label %endif_4
else_4:
  br label %endif_4
endif_4:
;stmt12:
  %50 = getelementptr inbounds %Decl, %Decl* %4, i1 0, i32 1
  %51 = load %Type*, %Type** %50
  %52 = getelementptr inbounds %Type, %Type* %51, i1 0, i32 0
  %53 = load %TypeKind, %TypeKind* %52
  %54 = icmp eq %TypeKind %53, 4
  br i1 %54, label %then_5, label %else_5
then_5:
;stmt13:
  %55 = getelementptr inbounds %Decl, %Decl* %4, i1 0, i32 1
  %56 = load %Type*, %Type** %55
  %57 = getelementptr inbounds %Decl, %Decl* %10, i1 0, i32 1
  %58 = load %Type*, %Type** %57
  %59 = call i1 (%Type*, %Type*) @func495 (%Type* %56, %Type* %58)
  %60 = xor i1 %59, 1
  ret i1 %60
  br label %endif_5
else_5:
  br label %endif_5
endif_5:
;stmt14:
  ret i1 1
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt15:
  ret i1 0
}

define i1 @func495 (%Type*, %Type*) {
;stmt0:
  %3 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 0
  %4 = load %TypeKind, %TypeKind* %3
  %5 = icmp ne %TypeKind %4, 10
  br i1 %5, label %then_0, label %else_0
then_0:
;stmt1:
  ret i1 0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt2:
  %7 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 10
  %8 = getelementptr inbounds %TypeRecord, %TypeRecord* %7, i1 0, i32 0
  %9 = load %List*, %List** %8
  %10 = getelementptr inbounds %List, %List* %9, i1 0, i32 2
  %11 = load %Nat64, %Nat64* %10
  %12 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 10
  %13 = getelementptr inbounds %TypeRecord, %TypeRecord* %12, i1 0, i32 0
  %14 = load %List*, %List** %13
  %15 = getelementptr inbounds %List, %List* %14, i1 0, i32 2
  %16 = load %Nat64, %Nat64* %15
  %17 = icmp ugt %Nat64 %11, %16
  br i1 %17, label %then_1, label %else_1
then_1:
;stmt3:
  ret i1 0
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt4:
  %19 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 10
  %20 = getelementptr inbounds %TypeRecord, %TypeRecord* %19, i1 0, i32 0
  %21 = load %List*, %List** %20
  %22 = bitcast %Type* %1 to %Unit*
  %23 = call %Unit* (%List*, %ListSearchHandler, %Unit*) @list_search (%List* %21, %ListSearchHandler @func496, %Unit* %22)
;stmt5:; loadImmPtr
  %24 = inttoptr i64 0 to%Unit*
  %25 = icmp eq %Unit* %23, %24
  ret i1 %25
}

define %Value* @func497 (%Value*, %Type*) {
;stmt0:
  %3 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 1
  %4 = load %Type*, %Type** %3; loadImmPtr
  %5 = inttoptr i64 0 to%Type*
  %6 = icmp ne %Type* %4, %5
  %7 = bitcast [29 x %Nat8]* @func497_str1 to %Str
  call void (i1, %Str) @assert (i1 %6, %Str %7)
;stmt1:; loadImmPtr
  %8 = inttoptr i64 0 to%Type*
  %9 = icmp ne %Type* %1, %8
  %10 = bitcast [24 x %Nat8]* @func497_str2 to %Str
  call void (i1, %Str) @assert (i1 %9, %Str %10)
;stmt2:
  %11 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 0
  %12 = load %ValueKind, %ValueKind* %11
  %13 = icmp eq %ValueKind %12, 1
  br i1 %13, label %then_0, label %else_0
then_0:
;stmt3:
  ret %Value* %0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt4:
  %15 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 0
  %16 = load %TypeKind, %TypeKind* %15
  %17 = icmp eq %TypeKind %16, 2
  br i1 %17, label %then_1, label %else_1
then_1:
;stmt5:
  br label %fail
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt6:
  %19 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 1
  %20 = load %Type*, %Type** %19
  %21 = getelementptr inbounds %Type, %Type* %20, i1 0, i32 0
  %22 = load %TypeKind, %TypeKind* %21
  %23 = icmp eq %TypeKind %22, 3
  %24 = call i1 (%Type*) @func390 (%Type* %1)
  %25 = and i1 %23, %24
  br i1 %25, label %then_2, label %else_2
then_2:
;stmt7:
  %26 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 19
  %27 = load %TokenInfo*, %TokenInfo** %26
  %28 = call %Value* (%Value*, %Type*, %TokenInfo*) @do_value_cast_ref (%Value* %0, %Type* %1, %TokenInfo* %27)
;stmt8:
  ret %Value* %28
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
;stmt9:
  %30 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 0
  %31 = load %ValueKind, %ValueKind* %30
  %32 = icmp eq %ValueKind %31, 9
  br i1 %32, label %then_3, label %else_3
then_3:
;stmt10:
  %33 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 1
  %34 = load %Type*, %Type** %33
  %35 = call i1 (%Type*, %Type*) @func495 (%Type* %34, %Type* %1)
  %36 = xor i1 %35, 1
  br i1 %36, label %then_4, label %else_4
then_4:
;stmt11:
  ret %Value* %0
  br label %endif_4
else_4:
  br label %endif_4
endif_4:
;stmt12:
  %38 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 19
  %39 = load %TokenInfo*, %TokenInfo** %38
  %40 = call %Value* (%Value*, %Type*, %TokenInfo*) @do_value_cast_gen_rec (%Value* %0, %Type* %1, %TokenInfo* %39)
  ret %Value* %40
  br label %endif_3
else_3:
  br label %endif_3
endif_3:
;stmt13:
  %42 = call i1 (%Value*) @is_value_imm_num (%Value* %0)
  br i1 %42, label %then_5, label %else_5
then_5:
;stmt14:
  %43 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 1
  %44 = load %Type*, %Type** %43
  %45 = call i1 (%Type*) @type_is_generic_num (%Type* %44)
  %46 = call i1 (%Type*) @func395 (%Type* %1)
  %47 = and i1 %45, %46
  br i1 %47, label %then_6, label %else_6
then_6:
;stmt15:
  %48 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 5
  %49 = getelementptr inbounds %TypeNumeric, %TypeNumeric* %48, i1 0, i32 0
  %50 = load %Nat32, %Nat32* %49
  %51 = zext %Nat32 %50 to %Nat128
  %52 = shl %Nat128 1, %51
  %53 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 2
  %54 = getelementptr inbounds %ValueImm, %ValueImm* %53, i1 0, i32 1
  %55 = load %Int64, %Int64* %54
  %56 = zext %Int64 %55 to %Nat128
  %57 = icmp ule %Nat128 %52, %56
  br i1 %57, label %then_7, label %else_7
then_7:
;stmt16:
  %58 = bitcast [14 x %Nat8]* @func497_str3 to %Str
  %59 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 19
  %60 = load %TokenInfo*, %TokenInfo** %59
  call void (%Str, %TokenInfo*) @error (%Str %58, %TokenInfo* %60)
  br label %endif_7
else_7:
  br label %endif_7
endif_7:
;stmt17:
  %61 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 2
  %62 = getelementptr inbounds %ValueImm, %ValueImm* %61, i1 0, i32 1
  %63 = load %Int64, %Int64* %62
  %64 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 19
  %65 = load %TokenInfo*, %TokenInfo** %64
  %66 = call %Value* (%Type*, %Int64, %TokenInfo*) @func439 (%Type* %1, %Int64 %63, %TokenInfo* %65)
  ret %Value* %66
  br label %endif_6
else_6:
  br label %endif_6
endif_6:
  br label %endif_5
else_5:
  br label %endif_5
endif_5:
;stmt18:
  %68 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 1
  %69 = load %Type*, %Type** %68
  %70 = call i1 (%Type*, %Type*) @func498 (%Type* %69, %Type* %1)
  br i1 %70, label %then_8, label %else_8
then_8:
;stmt19:
  %71 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 19
  %72 = load %TokenInfo*, %TokenInfo** %71
  %73 = call %Value* (%Value*, %Type*, %TokenInfo*) @func492 (%Value* %0, %Type* %1, %TokenInfo* %72)
  ret %Value* %73
  br label %endif_8
else_8:
  br label %endif_8
endif_8:
;stmt20:
  ret %Value* %0
;stmt21:
  br label %fail
fail:
;stmt22:; loadImmPtr
  %76 = inttoptr i64 0 to%TokenInfo*
  %77 = call %Value* (%TokenInfo*) @value_new_poison (%TokenInfo* %76)
  ret %Value* %77
}

define i1 @func498 (%Type*, %Type*) {
;stmt0:
  %3 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 0
  %4 = load %TypeKind, %TypeKind* %3
;stmt1:
  %5 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 0
  %6 = load %TypeKind, %TypeKind* %5
;stmt2:
  %7 = call i1 (%Type*) @type_is_generic_num (%Type* %0)
  %8 = call i1 (%Type*) @func395 (%Type* %1)
  %9 = and i1 %7, %8
  br i1 %9, label %then_0, label %else_0
then_0:
;stmt3:
  ret i1 1
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt4:
  %11 = icmp eq %TypeKind %4, 3
  br i1 %11, label %then_1, label %else_1
then_1:
;stmt5:
  %12 = icmp eq %TypeKind %6, 11
  %13 = icmp eq %TypeKind %6, 13
  %14 = icmp eq %TypeKind %6, 8
  %15 = or i1 %13, %14
  %16 = or i1 %12, %15
  br i1 %16, label %then_2, label %else_2
then_2:
;stmt6:
  ret i1 1
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt7:
  %18 = icmp eq %TypeKind %4, 11
  br i1 %18, label %then_3, label %else_3
then_3:
;stmt8:
  %19 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 7
  %20 = getelementptr inbounds %TypePointer, %TypePointer* %19, i1 0, i32 0
  %21 = load %Type*, %Type** %20
  %22 = call i1 (%Type*) @func391 (%Type* %21)
  br i1 %22, label %then_4, label %else_4
then_4:
;stmt9:
  %23 = call i1 (%Type*) @func393 (%Type* %1)
  br i1 %23, label %then_5, label %else_5
then_5:
;stmt10:
  ret i1 1
  br label %endif_5
else_5:
  br label %endif_5
endif_5:
  br label %endif_4
else_4:
  br label %endif_4
endif_4:
;stmt11:
  %25 = icmp eq %TypeKind %6, 11
  br i1 %25, label %then_6, label %else_6
then_6:
;stmt12:
  %26 = load %Type*, %Type** @typeFreePtr
  %27 = call i1 (%Type*, %Type*) @func426 (%Type* %0, %Type* %26)
  br i1 %27, label %then_7, label %else_7
then_7:
;stmt13:
  ret i1 1
  br label %endif_7
else_7:
  br label %endif_7
endif_7:
;stmt14:
  %29 = load %Type*, %Type** @typeFreePtr
  %30 = call i1 (%Type*, %Type*) @func426 (%Type* %1, %Type* %29)
  br i1 %30, label %then_8, label %else_8
then_8:
;stmt15:
  ret i1 1
  br label %endif_8
else_8:
  br label %endif_8
endif_8:
  br label %endif_6
else_6:
  br label %endif_6
endif_6:
  br label %endif_3
else_3:
  br label %endif_3
endif_3:
;stmt16:
  %32 = icmp eq %TypeKind %6, 14
  br i1 %32, label %then_9, label %else_9
then_9:
;stmt17:
  %33 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 13
  %34 = getelementptr inbounds %TypeUnion, %TypeUnion* %33, i1 0, i32 0
  %35 = call i1 (%List*, %Type*) @func158 (%List* %34, %Type* %0)
  ret i1 %35
  br label %endif_9
else_9:
  br label %endif_9
endif_9:
;stmt18:
  ret i1 0
}

define i1 @func499 (%ValueKind) {
;stmt0:
  %2 = icmp eq %ValueKind %0, 13
  %3 = icmp eq %ValueKind %0, 14
  %4 = icmp eq %ValueKind %0, 16
  %5 = icmp eq %ValueKind %0, 17
  %6 = icmp eq %ValueKind %0, 15
  %7 = or i1 %5, %6
  %8 = or i1 %4, %7
  %9 = or i1 %3, %8
  %10 = or i1 %2, %9
  ret i1 %10
}

define i1 @func500 (%ValueKind) {
;stmt0:
  %2 = icmp eq %ValueKind %0, 18
  %3 = icmp eq %ValueKind %0, 19
  %4 = icmp eq %ValueKind %0, 20
  %5 = icmp eq %ValueKind %0, 21
  %6 = icmp eq %ValueKind %0, 22
  %7 = icmp eq %ValueKind %0, 25
  %8 = icmp eq %ValueKind %0, 23
  %9 = icmp eq %ValueKind %0, 24
  %10 = call i1 (%ValueKind) @func501 (%ValueKind %0)
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

define i1 @func501 (%ValueKind) {
;stmt0:
  %2 = icmp eq %ValueKind %0, 26
  %3 = icmp eq %ValueKind %0, 27
  %4 = icmp eq %ValueKind %0, 28
  %5 = icmp eq %ValueKind %0, 29
  %6 = icmp eq %ValueKind %0, 30
  %7 = icmp eq %ValueKind %0, 31
  %8 = or i1 %6, %7
  %9 = or i1 %5, %8
  %10 = or i1 %4, %9
  %11 = or i1 %3, %10
  %12 = or i1 %2, %11
  ret i1 %12
}

define i1 @func502 (%ValueKind) {
;stmt0:
  %2 = icmp eq %ValueKind %0, 33
  %3 = icmp eq %ValueKind %0, 34
  %4 = icmp eq %ValueKind %0, 35
  %5 = icmp eq %ValueKind %0, 36
  %6 = icmp eq %ValueKind %0, 37
  %7 = icmp eq %ValueKind %0, 35
  %8 = icmp eq %ValueKind %0, 38
  %9 = or i1 %7, %8
  %10 = or i1 %6, %9
  %11 = or i1 %5, %10
  %12 = or i1 %4, %11
  %13 = or i1 %3, %12
  %14 = or i1 %2, %13
  ret i1 %14
}

define i1 @func503 (%Value*) {
;stmt0:
  %2 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 1
  %3 = load %Type*, %Type** %2
  %4 = getelementptr inbounds %Type, %Type* %3, i1 0, i32 0
  %5 = load %TypeKind, %TypeKind* %4
  %6 = icmp eq %TypeKind %5, 6
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
  %10 = icmp eq %ValueKind %9, 36
  br i1 %10, label %then_1, label %else_1
then_1:
;stmt4:
  %11 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 12
  %12 = getelementptr inbounds %ValueIndex, %ValueIndex* %11, i1 0, i32 1
  %13 = load %Value*, %Value** %12
  %14 = getelementptr inbounds %Value, %Value* %13, i1 0, i32 1
  %15 = load %Type*, %Type** %14
  %16 = call i1 (%Type*) @func391 (%Type* %15)
;stmt5:
  %17 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 12
  %18 = getelementptr inbounds %ValueIndex, %ValueIndex* %17, i1 0, i32 1
  %19 = load %Value*, %Value** %18
  %20 = call i1 (%Value*) @func503 (%Value* %19)
  %21 = and i1 %20, %16
  ret i1 %21
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt6:
  %23 = icmp eq %ValueKind %9, 37
  br i1 %23, label %then_2, label %else_2
then_2:
;stmt7:
  %24 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 13
  %25 = getelementptr inbounds %ValueAccess, %ValueAccess* %24, i1 0, i32 1
  %26 = load %Value*, %Value** %25
  %27 = call i1 (%Value*) @func503 (%Value* %26)
  %28 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 13
  %29 = getelementptr inbounds %ValueAccess, %ValueAccess* %28, i1 0, i32 1
  %30 = load %Value*, %Value** %29
  %31 = getelementptr inbounds %Value, %Value* %30, i1 0, i32 1
  %32 = load %Type*, %Type** %31
  %33 = getelementptr inbounds %Type, %Type* %32, i1 0, i32 0
  %34 = load %TypeKind, %TypeKind* %33
  %35 = icmp ne %TypeKind %34, 11
  %36 = and i1 %27, %35
  ret i1 %36
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
;stmt8:
  %38 = icmp eq %ValueKind %9, 5
  %39 = icmp eq %ValueKind %9, 3
  %40 = icmp eq %ValueKind %9, 11
  %41 = icmp eq %ValueKind %9, 7
  %42 = or i1 %40, %41
  %43 = or i1 %39, %42
  %44 = or i1 %38, %43
  ret i1 %44
}

define i1 @func504 (%Value*) {
;stmt0:
  %2 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 0
  %3 = load %ValueKind, %ValueKind* %2
;stmt1:
  %4 = icmp eq %ValueKind %3, 12
  %5 = icmp eq %ValueKind %3, 6
  %6 = or i1 %4, %5
  ret i1 %6
}

define void @func505 () {
;stmt0:
  %1 = load %Type*, %Type** @typeBool; loadImmPtr
  %2 = inttoptr i64 0 to%TokenInfo*
  %3 = call %Value* (%Type*, %Int64, %TokenInfo*) @func439 (%Type* %1, %Int64 0, %TokenInfo* %2)
;stmt1:
  %4 = bitcast [6 x %Nat8]* @func505_str1 to %Str
  call void (%Str, %Value*) @builtin_value_bind (%Str %4, %Value* %3)
;stmt2:
  %5 = load %Type*, %Type** @typeBool; loadImmPtr
  %6 = inttoptr i64 0 to%TokenInfo*
  %7 = call %Value* (%Type*, %Int64, %TokenInfo*) @func439 (%Type* %5, %Int64 1, %TokenInfo* %6)
;stmt3:
  %8 = bitcast [5 x %Nat8]* @func505_str2 to %Str
  call void (%Str, %Value*) @builtin_value_bind (%Str %8, %Value* %7)
;stmt4:; loadImmPtr
  %9 = inttoptr i64 0 to%TokenInfo*
  %10 = call %Type* (%TypeKind, %Nat32, %TokenInfo*) @func380 (%TypeKind 3, %Nat32 8, %TokenInfo* %9)
;stmt5:; loadImmPtr
  %11 = inttoptr i64 0 to%TokenInfo*
  %12 = call %Value* (%Type*, %Int64, %TokenInfo*) @func439 (%Type* %10, %Int64 0, %TokenInfo* %11)
;stmt6:
  %13 = bitcast [4 x %Nat8]* @func505_str3 to %Str
  call void (%Str, %Value*) @builtin_value_bind (%Str %13, %Value* %12)
;stmt7:
  %14 = load %Type*, %Type** @typeUnit; loadImmPtr
  %15 = inttoptr i64 0 to%TokenInfo*
  %16 = call %Value* (%Type*, %Int64, %TokenInfo*) @func439 (%Type* %14, %Int64 0, %TokenInfo* %15)
;stmt8:
  %17 = bitcast [5 x %Nat8]* @func505_str4 to %Str
  call void (%Str, %Value*) @builtin_value_bind (%Str %17, %Value* %16)
  ret void
}

define %Stmt* @func506 (%StmtKind, %TokenInfo*) {
;stmt0:
  %3 = call %Unit* (%Nat32) @malloc (%Nat32 384)
  %4 = bitcast %Unit* %3 to %Stmt*
;stmt1:; loadImmPtr
  %5 = inttoptr i64 0 to%Stmt*
  %6 = icmp ne %Stmt* %4, %5
  %7 = bitcast [9 x %Nat8]* @func506_str1 to %Str
  call void (i1, %Str) @assert (i1 %6, %Str %7)
;stmt2:
  %8 = insertvalue %Stmt zeroinitializer, %StmtKind %0, 0
  %9 = insertvalue %Stmt %8, %TokenInfo* %1, 13
  store %Stmt %9, %Stmt* %4, align 16
;stmt3:
  ret %Stmt* %4
}

define %union.6 @func507 (%union.3*) {
;stmt0:
  %2 = load %union.3, %union.3* %0
;stmt1:
  br label %select_1_0
select_1_0:
  %3 = extractvalue %union.3 %2, 0
  %4 = bitcast %Int16 0 to %Int16
  %5 = icmp eq %Int16 %3, %4
  br i1 %5, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %6 = alloca %union.3
  store %union.3 %2, %union.3* %6, align 64
  %7 = getelementptr inbounds %union.3, %union.3* %6, i1 0, i32 1
  %8 = bitcast [48 x %Nat8]* %7 to %AstStmtAssign*
  %9 = load %AstStmtAssign, %AstStmtAssign* %8
  %10 = call %union.26 (%AstStmtAssign) @func508 (%AstStmtAssign %9)
  br label %select_1_end
select_1_1:
  %11 = extractvalue %union.3 %2, 0
  %12 = bitcast %Int16 1 to %Int16
  %13 = icmp eq %Int16 %11, %12
  br i1 %13, label %select_1_1_ok, label %select_1_2
select_1_1_ok:
  %14 = alloca %union.3
  store %union.3 %2, %union.3* %14, align 64
  %15 = getelementptr inbounds %union.3, %union.3* %14, i1 0, i32 1
  %16 = bitcast [48 x %Nat8]* %15 to %AstStmtValueBind*
  %17 = load %AstStmtValueBind, %AstStmtValueBind* %16
  %18 = call %union.27 (%AstStmtValueBind) @func509 (%AstStmtValueBind %17)
  br label %select_1_end
select_1_2:
  %19 = extractvalue %union.3 %2, 0
  %20 = bitcast %Int16 4 to %Int16
  %21 = icmp eq %Int16 %19, %20
  br i1 %21, label %select_1_2_ok, label %select_1_3
select_1_2_ok:
  %22 = alloca %union.3
  store %union.3 %2, %union.3* %22, align 64
  %23 = getelementptr inbounds %union.3, %union.3* %22, i1 0, i32 1
  %24 = bitcast [48 x %Nat8]* %23 to %AstStmtBlock*
  %25 = load %AstStmtBlock, %AstStmtBlock* %24
  %26 = call %union.28 (%AstStmtBlock) @func511 (%AstStmtBlock %25)
  br label %select_1_end
select_1_3:
  %27 = extractvalue %union.3 %2, 0
  %28 = bitcast %Int16 3 to %Int16
  %29 = icmp eq %Int16 %27, %28
  br i1 %29, label %select_1_3_ok, label %select_1_4
select_1_3_ok:
  %30 = alloca %union.3
  store %union.3 %2, %union.3* %30, align 64
  %31 = getelementptr inbounds %union.3, %union.3* %30, i1 0, i32 1
  %32 = bitcast [48 x %Nat8]* %31 to %AstStmtExpr*
  %33 = load %AstStmtExpr, %AstStmtExpr* %32
  %34 = call %union.29 (%AstStmtExpr) @func513 (%AstStmtExpr %33)
  br label %select_1_end
select_1_4:
  %35 = extractvalue %union.3 %2, 0
  %36 = bitcast %Int16 5 to %Int16
  %37 = icmp eq %Int16 %35, %36
  br i1 %37, label %select_1_4_ok, label %select_1_5
select_1_4_ok:
  %38 = alloca %union.3
  store %union.3 %2, %union.3* %38, align 64
  %39 = getelementptr inbounds %union.3, %union.3* %38, i1 0, i32 1
  %40 = bitcast [48 x %Nat8]* %39 to %AstStmtIf*
  %41 = load %AstStmtIf, %AstStmtIf* %40
  %42 = call %union.30 (%AstStmtIf) @func514 (%AstStmtIf %41)
  br label %select_1_end
select_1_5:
  %43 = extractvalue %union.3 %2, 0
  %44 = bitcast %Int16 6 to %Int16
  %45 = icmp eq %Int16 %43, %44
  br i1 %45, label %select_1_5_ok, label %select_1_6
select_1_5_ok:
  %46 = alloca %union.3
  store %union.3 %2, %union.3* %46, align 64
  %47 = getelementptr inbounds %union.3, %union.3* %46, i1 0, i32 1
  %48 = bitcast [48 x %Nat8]* %47 to %AstStmtWhile*
  %49 = load %AstStmtWhile, %AstStmtWhile* %48
  %50 = call %union.32 (%AstStmtWhile) @func515 (%AstStmtWhile %49)
  br label %select_1_end
select_1_6:
  %51 = extractvalue %union.3 %2, 0
  %52 = bitcast %Int16 7 to %Int16
  %53 = icmp eq %Int16 %51, %52
  br i1 %53, label %select_1_6_ok, label %select_1_7
select_1_6_ok:
  %54 = alloca %union.3
  store %union.3 %2, %union.3* %54, align 64
  %55 = getelementptr inbounds %union.3, %union.3* %54, i1 0, i32 1
  %56 = bitcast [48 x %Nat8]* %55 to %AstStmtReturn*
  %57 = load %AstStmtReturn, %AstStmtReturn* %56
  %58 = call %union.33 (%AstStmtReturn) @func516 (%AstStmtReturn %57)
  br label %select_1_end
select_1_7:
  %59 = extractvalue %union.3 %2, 0
  %60 = bitcast %Int16 2 to %Int16
  %61 = icmp eq %Int16 %59, %60
  br i1 %61, label %select_1_7_ok, label %select_1_8
select_1_7_ok:
  %62 = alloca %union.3
  store %union.3 %2, %union.3* %62, align 64
  %63 = getelementptr inbounds %union.3, %union.3* %62, i1 0, i32 1
  %64 = bitcast [48 x %Nat8]* %63 to %AstStmtTypeBind*
  %65 = load %AstStmtTypeBind, %AstStmtTypeBind* %64
  %66 = call %union.34 (%AstStmtTypeBind) @func517 (%AstStmtTypeBind %65)
  br label %select_1_end
select_1_8:
  %67 = extractvalue %union.3 %2, 0
  %68 = bitcast %Int16 10 to %Int16
  %69 = icmp eq %Int16 %67, %68
  br i1 %69, label %select_1_8_ok, label %select_1_9
select_1_8_ok:
  %70 = alloca %union.3
  store %union.3 %2, %union.3* %70, align 64
  %71 = getelementptr inbounds %union.3, %union.3* %70, i1 0, i32 1
  %72 = bitcast [48 x %Nat8]* %71 to %AstStmtBreak*
  %73 = load %AstStmtBreak, %AstStmtBreak* %72
  %74 = call %union.35 (%AstStmtBreak) @func518 (%AstStmtBreak %73)
  br label %select_1_end
select_1_9:
  %75 = extractvalue %union.3 %2, 0
  %76 = bitcast %Int16 11 to %Int16
  %77 = icmp eq %Int16 %75, %76
  br i1 %77, label %select_1_9_ok, label %select_1_10
select_1_9_ok:
  %78 = alloca %union.3
  store %union.3 %2, %union.3* %78, align 64
  %79 = getelementptr inbounds %union.3, %union.3* %78, i1 0, i32 1
  %80 = bitcast [48 x %Nat8]* %79 to %AstStmtContinue*
  %81 = load %AstStmtContinue, %AstStmtContinue* %80
  %82 = call %union.36 (%AstStmtContinue) @func519 (%AstStmtContinue %81)
  br label %select_1_end
select_1_10:
  %83 = extractvalue %union.3 %2, 0
  %84 = bitcast %Int16 8 to %Int16
  %85 = icmp eq %Int16 %83, %84
  br i1 %85, label %select_1_10_ok, label %select_1_11
select_1_10_ok:
  %86 = alloca %union.3
  store %union.3 %2, %union.3* %86, align 64
  %87 = getelementptr inbounds %union.3, %union.3* %86, i1 0, i32 1
  %88 = bitcast [48 x %Nat8]* %87 to %AstStmtGoto*
  %89 = load %AstStmtGoto, %AstStmtGoto* %88
  %90 = call %union.37 (%AstStmtGoto) @func520 (%AstStmtGoto %89)
  br label %select_1_end
select_1_11:
  %91 = extractvalue %union.3 %2, 0
  %92 = bitcast %Int16 9 to %Int16
  %93 = icmp eq %Int16 %91, %92
  br i1 %93, label %select_1_11_ok, label %select_1_12
select_1_11_ok:
  %94 = alloca %union.3
  store %union.3 %2, %union.3* %94, align 64
  %95 = getelementptr inbounds %union.3, %union.3* %94, i1 0, i32 1
  %96 = bitcast [48 x %Nat8]* %95 to %AstStmtLabel*
  %97 = load %AstStmtLabel, %AstStmtLabel* %96
  %98 = call %union.38 (%AstStmtLabel) @func521 (%AstStmtLabel %97)
  br label %select_1_end
select_1_12:
  %99 = inttoptr %Unit zeroinitializer to %union.14
  br label %select_1_end
select_1_end:
  %100 = phi %union.14 [ %10, %select_1_0_ok ], [ %18, %select_1_1_ok ], [ %26, %select_1_2_ok ], [ %34, %select_1_3_ok ], [ %42, %select_1_4_ok ], [ %50, %select_1_5_ok ], [ %58, %select_1_6_ok ], [ %66, %select_1_7_ok ], [ %74, %select_1_8_ok ], [ %82, %select_1_9_ok ], [ %90, %select_1_10_ok ], [ %98, %select_1_11_ok ], [ %99, %select_1_12 ]
  ret %union.14 %100
}

define %union.26 @func508 (%AstStmtAssign) {
;stmt0:
  %2 = extractvalue %AstStmtAssign %0, 1
  %3 = call %Value* (%AstValue*) @func442 (%AstValue* %2)
;stmt1:
  %4 = getelementptr inbounds %Value, %Value* %3, i1 0, i32 0
  %5 = load %ValueKind, %ValueKind* %4
  %6 = icmp eq %ValueKind %5, 1
  br i1 %6, label %then_0, label %else_0
then_0:
;stmt2:
  %7 = inttoptr %Unit zeroinitializer to %union.26
  ret %union.26 %7
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt3:
  %9 = extractvalue %AstStmtAssign %0, 0
  %10 = call %Value* (%AstValue*) @func444 (%AstValue* %9)
;stmt4:
  %11 = getelementptr inbounds %Value, %Value* %10, i1 0, i32 0
  %12 = load %ValueKind, %ValueKind* %11
  %13 = icmp eq %ValueKind %12, 1
  br i1 %13, label %then_1, label %else_1
then_1:
;stmt5:
  %14 = inttoptr %Unit zeroinitializer to %union.26
  ret %union.26 %14
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt6:
  %16 = call i1 (%Value*) @func503 (%Value* %10)
  br i1 %16, label %then_2, label %else_2
then_2:
;stmt7:
  %17 = bitcast [13 x %Nat8]* @func508_str1 to %Str
  %18 = extractvalue %AstStmtAssign %0, 2
  call void (%Str, %TokenInfo*) @error (%Str %17, %TokenInfo* %18)
;stmt8:
  %19 = inttoptr %Unit zeroinitializer to %union.26
  ret %union.26 %19
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
;stmt9:
  %21 = getelementptr inbounds %Value, %Value* %10, i1 0, i32 1
  %22 = load %Type*, %Type** %21
  %23 = getelementptr inbounds %Type, %Type* %22, i1 0, i32 0
  %24 = load %TypeKind, %TypeKind* %23
  br label %select_1_0
select_1_0:
  %25 = icmp eq %TypeKind %24, 6
  br i1 %25, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %26 = getelementptr inbounds %Value, %Value* %10, i1 0, i32 1
  %27 = load %Type*, %Type** %26
  %28 = getelementptr inbounds %Type, %Type* %27, i1 0, i32 12
  %29 = getelementptr inbounds %TypeVar, %TypeVar* %28, i1 0, i32 0
  %30 = load %Type*, %Type** %29
  br label %select_1_end
select_1_1:
  %31 = getelementptr inbounds %Value, %Value* %10, i1 0, i32 1
  %32 = load %Type*, %Type** %31
  br label %select_1_end
select_1_end:
  %33 = phi %Type* [ %30, %select_1_0_ok ], [ %32, %select_1_1 ]
;stmt10:
  %34 = call %Value* (%Value*, %Type*) @func497 (%Value* %3, %Type* %33)
;stmt11:
  %35 = getelementptr inbounds %Value, %Value* %34, i1 0, i32 1
  %36 = load %Type*, %Type** %35
  %37 = extractvalue %AstStmtAssign %0, 2
  %38 = call i1 (%Type*, %Type*, %TokenInfo*) @type_check (%Type* %33, %Type* %36, %TokenInfo* %37)
  %39 = xor i1 %38, 1
  br i1 %39, label %then_3, label %else_3
then_3:
;stmt12:
  %40 = inttoptr %Unit zeroinitializer to %union.26
  ret %union.26 %40
  br label %endif_3
else_3:
  br label %endif_3
endif_3:
;stmt13:
  %42 = extractvalue %AstStmtAssign %0, 2
  %43 = call %Stmt* (%StmtKind, %TokenInfo*) @func506 (%StmtKind 4, %TokenInfo* %42)
;stmt14:
  %44 = getelementptr inbounds %Stmt, %Stmt* %43, i1 0, i32 2
  %45 = insertvalue %StmtAssign zeroinitializer, %Value* %10, 0
  %46 = insertvalue %StmtAssign %45, %Value* %34, 1
  %47 = extractvalue %AstStmtAssign %0, 2
  %48 = insertvalue %StmtAssign %46, %TokenInfo* %47, 2
  store %StmtAssign %48, %StmtAssign* %44, align 8
;stmt15:
  %49 = bitcast %Stmt* %43 to %union.26
  ret %union.26 %49
}

define %union.27 @func509 (%AstStmtValueBind) {
;stmt0:
  %2 = extractvalue %AstStmtValueBind %0, 0
  %3 = getelementptr inbounds %AstId, %AstId* %2, i1 0, i32 0
  %4 = load %Str, %Str* %3
;stmt1:
  %5 = extractvalue %AstStmtValueBind %0, 1
  %6 = call %Value* (%AstValue*, i1) @func443 (%AstValue* %5, i1 0)
;stmt2:
  %7 = getelementptr inbounds %Value, %Value* %6, i1 0, i32 0
  %8 = load %ValueKind, %ValueKind* %7
;stmt3:
  %9 = icmp eq %ValueKind %8, 5
  %10 = icmp eq %ValueKind %8, 3
  %11 = icmp eq %ValueKind %8, 9
  %12 = or i1 %10, %11
  %13 = or i1 %9, %12
;stmt4:
  %14 = getelementptr inbounds %Value, %Value* %6, i1 0, i32 1
  %15 = load %Type*, %Type** %14
  %16 = getelementptr inbounds %Type, %Type* %15, i1 0, i32 0
  %17 = load %TypeKind, %TypeKind* %16
  %18 = icmp eq %TypeKind %17, 6
;stmt5:
  %19 = or i1 %13, %18
  br i1 %19, label %then_0, label %else_0
then_0:
;stmt6:
  %20 = load %FuncContext*, %FuncContext** @fctx
  %21 = getelementptr inbounds %FuncContext, %FuncContext* %20, i1 0, i32 2
  %22 = load %StmtBlock*, %StmtBlock** %21
  call void (%StmtBlock*, %Str, %Value*) @func142 (%StmtBlock* %22, %Str %4, %Value* %6)
;stmt7:
  %23 = inttoptr %Unit zeroinitializer to %union.27
  ret %union.27 %23
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt8:
  %25 = extractvalue %AstStmtValueBind %0, 2
  %26 = call %Stmt* (%StmtKind, %TokenInfo*) @func506 (%StmtKind 1, %TokenInfo* %25)
;stmt9:
  %27 = getelementptr inbounds %Stmt, %Stmt* %26, i1 0, i32 1
  %28 = getelementptr inbounds %StmtExpr, %StmtExpr* %27, i1 0, i32 0
  %29 = call %Value* (%Value*) @dold (%Value* %6)
  store %Value* %29, %Value** %28, align 8
;stmt10:
  %30 = getelementptr inbounds %Value, %Value* %6, i1 0, i32 1
  %31 = load %Type*, %Type** %30
  %32 = extractvalue %AstStmtValueBind %0, 2
  %33 = call %Value* (%ValueKind, %Type*, %TokenInfo*) @func437 (%ValueKind 11, %Type* %31, %TokenInfo* %32)
;stmt11:
  %34 = getelementptr inbounds %Value, %Value* %33, i1 0, i32 9
  %35 = getelementptr inbounds %Stmt, %Stmt* %26, i1 0, i32 1
  store %StmtExpr* %35, %StmtExpr** %34, align 8
;stmt12:
  call void (%Str, %Value*) @func143 (%Str %4, %Value* %33)
;stmt13:
  %36 = bitcast %Stmt* %26 to %union.27
  ret %union.27 %36
}

define %StmtBlock* @func510 (%StmtBlock*, %StmtBlock*) {
;stmt0:
  %3 = bitcast %StmtBlock* %0 to %Unit*
  %4 = call %Unit* (%Unit*, %Nat8, %Nat32) @memset (%Unit* %3, %Nat8 0, %Nat32 144)
;stmt1:
  %5 = getelementptr inbounds %StmtBlock, %StmtBlock* %0, i1 0, i32 0
  store %StmtBlock* %1, %StmtBlock** %5, align 8
;stmt2:
  %6 = getelementptr inbounds %StmtBlock, %StmtBlock* %0, i1 0, i32 1
  call void (%Index*) @func132 (%Index* %6)
;stmt3:
  %7 = getelementptr inbounds %StmtBlock, %StmtBlock* %0, i1 0, i32 2
  call void (%List*) @map_init (%List* %7)
;stmt4:
  %8 = getelementptr inbounds %StmtBlock, %StmtBlock* %0, i1 0, i32 3
  call void (%List*) @map_init (%List* %8)
;stmt5:
  ret %StmtBlock* %0
}

define void @func512 (%Unit*, %Unit*, %Nat32, %Node*) {
;stmt0:
  %5 = bitcast %Unit* %0 to %union.3*
;stmt1:
  %6 = call %union.6 (%union.3*) @func507 (%union.3* %5)
;stmt2:
  %7 = bitcast %Int64 0 to %Int64
  %8 = ptrtoint %union.6 %6 to %Int64
  %9 = icmp eq %Int64 %8, %7
  br i1 %9, label %then_0, label %else_0
then_0:
;stmt3:
ret void
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt4:
  %11 = bitcast %Unit* %1 to %List*
;stmt5:
  %12 = bitcast %union.6 %6 to %Stmt*
  %13 = bitcast %Stmt* %12 to %Unit*
  %14 = call i1 (%List*, %Unit*) @list_append (%List* %11, %Unit* %13)
  ret void
}

define %union.28 @func511 (%AstStmtBlock) {
;stmt0:
  %2 = extractvalue %AstStmtBlock %0, 1
  %3 = call %Stmt* (%StmtKind, %TokenInfo*) @func506 (%StmtKind 2, %TokenInfo* %2)
;stmt1:
  %4 = getelementptr inbounds %Stmt, %Stmt* %3, i1 0, i32 3
  %5 = load %FuncContext*, %FuncContext** @fctx
  %6 = getelementptr inbounds %FuncContext, %FuncContext* %5, i1 0, i32 2
  %7 = load %StmtBlock*, %StmtBlock** %6
  %8 = call %StmtBlock* (%StmtBlock*, %StmtBlock*) @func510 (%StmtBlock* %4, %StmtBlock* %7)
;stmt2:
  %9 = load %FuncContext*, %FuncContext** @fctx
  %10 = getelementptr inbounds %FuncContext, %FuncContext* %9, i1 0, i32 2
  store %StmtBlock* %8, %StmtBlock** %10, align 8
;stmt3:
  %11 = alloca %List
  %12 = extractvalue %AstStmtBlock %0, 0
  store %List %12, %List* %11, align 8
;stmt4:
  %13 = getelementptr inbounds %List, %List* %11, i1 0
  %14 = getelementptr inbounds %StmtBlock, %StmtBlock* %8, i1 0, i32 2
  %15 = bitcast %List* %14 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @func64 (%List* %13, %ListForeachHandler @func512, %Unit* %15)
;stmt5:
  %16 = load %FuncContext*, %FuncContext** @fctx
  %17 = getelementptr inbounds %FuncContext, %FuncContext* %16, i1 0, i32 2
  %18 = getelementptr inbounds %StmtBlock, %StmtBlock* %8, i1 0, i32 0
  %19 = load %StmtBlock*, %StmtBlock** %18
  store %StmtBlock* %19, %StmtBlock** %17, align 8
;stmt6:
  %20 = bitcast %Stmt* %3 to %union.28
  ret %union.28 %20
}

define %union.29 @func513 (%AstStmtExpr) {
;stmt0:
  %2 = extractvalue %AstStmtExpr %0, 0
  %3 = call %Value* (%AstValue*) @func442 (%AstValue* %2)
;stmt1:
  %4 = getelementptr inbounds %Value, %Value* %3, i1 0, i32 0
  %5 = load %ValueKind, %ValueKind* %4
  %6 = icmp eq %ValueKind %5, 1
  br i1 %6, label %then_0, label %else_0
then_0:
;stmt2:
  %7 = inttoptr %Unit zeroinitializer to %union.29
  ret %union.29 %7
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt3:
  %9 = getelementptr inbounds %Value, %Value* %3, i1 0, i32 1
  %10 = load %Type*, %Type** %9
  %11 = load %Type*, %Type** @typeUnit
  %12 = call i1 (%Type*, %Type*) @func426 (%Type* %10, %Type* %11)
  %13 = xor i1 %12, 1
  br i1 %13, label %then_1, label %else_1
then_1:
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt4:
  %14 = extractvalue %AstStmtExpr %0, 1
  %15 = call %Stmt* (%StmtKind, %TokenInfo*) @func506 (%StmtKind 1, %TokenInfo* %14)
;stmt5:
  %16 = getelementptr inbounds %Stmt, %Stmt* %15, i1 0, i32 1
  %17 = insertvalue %StmtExpr zeroinitializer, %Value* %3, 0
  store %StmtExpr %17, %StmtExpr* %16, align 8
;stmt6:
  %18 = bitcast %Stmt* %15 to %union.29
  ret %union.29 %18
}

define %union.30 @func514 (%AstStmtIf) {
;stmt0:
  %2 = extractvalue %AstStmtIf %0, 0
  %3 = call %Value* (%AstValue*) @func442 (%AstValue* %2)
;stmt1:
  %4 = extractvalue %AstStmtIf %0, 1
  %5 = call %union.6 (%union.3*) @func507 (%union.3* %4)
;stmt2:
  %6 = alloca %union.31
  %7 = inttoptr %Unit zeroinitializer to %union.31
  store %union.31 %7, %union.31* %6, align 16
;stmt3:
  %8 = extractvalue %AstStmtIf %0, 2
  %9 = bitcast %Int64 0 to %Int64
  %10 = ptrtoint %union.1 %8 to %Int64
  %11 = icmp eq %Int64 %10, %9
  %12 = xor i1 %11, 1
  br i1 %12, label %then_0, label %else_0
then_0:
;stmt4:
  %13 = extractvalue %AstStmtIf %0, 2
  %14 = bitcast %union.1 %13 to %union.3*
  %15 = call %union.6 (%union.3*) @func507 (%union.3* %14)
;stmt5:
  %16 = bitcast %Int64 0 to %Int64
  %17 = ptrtoint %union.6 %15 to %Int64
  %18 = icmp eq %Int64 %17, %16
  %19 = xor i1 %18, 1
  br i1 %19, label %then_1, label %else_1
then_1:
;stmt6:
  %20 = bitcast %union.6 %15 to %Stmt*
  %21 = bitcast %Stmt* %20 to %union.31
  store %union.31 %21, %union.31* %6, align 16
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt7:
  %22 = getelementptr inbounds %Value, %Value* %3, i1 0, i32 0
  %23 = load %ValueKind, %ValueKind* %22
  %24 = icmp eq %ValueKind %23, 1
  br i1 %24, label %then_2, label %else_2
then_2:
;stmt8:
  %25 = inttoptr %Unit zeroinitializer to %union.30
  ret %union.30 %25
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
;stmt9:
  %27 = load %Type*, %Type** @typeBool
  %28 = getelementptr inbounds %Value, %Value* %3, i1 0, i32 1
  %29 = load %Type*, %Type** %28
  %30 = getelementptr inbounds %Value, %Value* %3, i1 0, i32 19
  %31 = load %TokenInfo*, %TokenInfo** %30
  %32 = call i1 (%Type*, %Type*, %TokenInfo*) @type_check (%Type* %27, %Type* %29, %TokenInfo* %31)
  %33 = xor i1 %32, 1
  br i1 %33, label %then_3, label %else_3
then_3:
;stmt10:
  %34 = inttoptr %Unit zeroinitializer to %union.30
  ret %union.30 %34
  br label %endif_3
else_3:
  br label %endif_3
endif_3:
;stmt11:
  %36 = bitcast %Int64 0 to %Int64
  %37 = ptrtoint %union.6 %5 to %Int64
  %38 = icmp eq %Int64 %37, %36
  br i1 %38, label %then_4, label %else_4
then_4:
;stmt12:
  %39 = inttoptr %Unit zeroinitializer to %union.30
  ret %union.30 %39
  br label %endif_4
else_4:
  br label %endif_4
endif_4:
;stmt13:
  %41 = extractvalue %AstStmtIf %0, 3
  %42 = call %Stmt* (%StmtKind, %TokenInfo*) @func506 (%StmtKind 5, %TokenInfo* %41)
;stmt14:
  %43 = getelementptr inbounds %Stmt, %Stmt* %42, i1 0, i32 5
  %44 = insertvalue %StmtIf zeroinitializer, %Value* %3, 0
  %45 = bitcast %union.6 %5 to %Stmt*
  %46 = insertvalue %StmtIf %44, %Stmt* %45, 1
  %47 = load %union.31, %union.31* %6
  %48 = insertvalue %StmtIf %46, %union.31 %47, 2
  store %StmtIf %48, %StmtIf* %43, align 16
;stmt15:
  %49 = bitcast %Stmt* %42 to %union.30
  ret %union.30 %49
}

define %union.32 @func515 (%AstStmtWhile) {
;stmt0:
  %2 = extractvalue %AstStmtWhile %0, 0
  %3 = call %Value* (%AstValue*) @func442 (%AstValue* %2)
;stmt1:
  %4 = load %FuncContext*, %FuncContext** @fctx
  %5 = getelementptr inbounds %FuncContext, %FuncContext* %4, i1 0, i32 3
  %6 = load %FuncContext*, %FuncContext** @fctx
  %7 = getelementptr inbounds %FuncContext, %FuncContext* %6, i1 0, i32 3
  %8 = load %Nat32, %Nat32* %7
  %9 = add %Nat32 %8, 1
  store %Nat32 %9, %Nat32* %5, align 4
;stmt2:
  %10 = extractvalue %AstStmtWhile %0, 1
  %11 = call %union.6 (%union.3*) @func507 (%union.3* %10)
;stmt3:
  %12 = load %FuncContext*, %FuncContext** @fctx
  %13 = getelementptr inbounds %FuncContext, %FuncContext* %12, i1 0, i32 3
  %14 = load %FuncContext*, %FuncContext** @fctx
  %15 = getelementptr inbounds %FuncContext, %FuncContext* %14, i1 0, i32 3
  %16 = load %Nat32, %Nat32* %15
  %17 = sub %Nat32 %16, 1
  store %Nat32 %17, %Nat32* %13, align 4
;stmt4:
  %18 = getelementptr inbounds %Value, %Value* %3, i1 0, i32 0
  %19 = load %ValueKind, %ValueKind* %18
  %20 = icmp eq %ValueKind %19, 1
  br i1 %20, label %then_0, label %else_0
then_0:
;stmt5:
  %21 = inttoptr %Unit zeroinitializer to %union.32
  ret %union.32 %21
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt6:
  %23 = load %Type*, %Type** @typeBool
  %24 = getelementptr inbounds %Value, %Value* %3, i1 0, i32 1
  %25 = load %Type*, %Type** %24
  %26 = getelementptr inbounds %Value, %Value* %3, i1 0, i32 19
  %27 = load %TokenInfo*, %TokenInfo** %26
  %28 = call i1 (%Type*, %Type*, %TokenInfo*) @type_check (%Type* %23, %Type* %25, %TokenInfo* %27)
  %29 = xor i1 %28, 1
  br i1 %29, label %then_1, label %else_1
then_1:
;stmt7:
  %30 = inttoptr %Unit zeroinitializer to %union.32
  ret %union.32 %30
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt8:
  %32 = bitcast %Int64 0 to %Int64
  %33 = ptrtoint %union.6 %11 to %Int64
  %34 = icmp eq %Int64 %33, %32
  br i1 %34, label %then_2, label %else_2
then_2:
;stmt9:
  %35 = inttoptr %Unit zeroinitializer to %union.32
  ret %union.32 %35
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
;stmt10:
  %37 = extractvalue %AstStmtWhile %0, 2
  %38 = call %Stmt* (%StmtKind, %TokenInfo*) @func506 (%StmtKind 6, %TokenInfo* %37)
;stmt11:
  %39 = getelementptr inbounds %Stmt, %Stmt* %38, i1 0, i32 6
  %40 = insertvalue %StmtWhile zeroinitializer, %Value* %3, 0
  %41 = bitcast %union.6 %11 to %Stmt*
  %42 = insertvalue %StmtWhile %40, %Stmt* %41, 1
  store %StmtWhile %42, %StmtWhile* %39, align 8
;stmt12:
  %43 = bitcast %Stmt* %38 to %union.32
  ret %union.32 %43
}

define %union.33 @func516 (%AstStmtReturn) {
;stmt0:
  %2 = load %FuncContext*, %FuncContext** @fctx
  %3 = getelementptr inbounds %FuncContext, %FuncContext* %2, i1 0, i32 1
  %4 = load %Value*, %Value** %3
  %5 = getelementptr inbounds %Value, %Value* %4, i1 0, i32 1
  %6 = load %Type*, %Type** %5
  %7 = getelementptr inbounds %Type, %Type* %6, i1 0, i32 6
  %8 = getelementptr inbounds %TypeFunc, %TypeFunc* %7, i1 0, i32 1
  %9 = load %Type*, %Type** %8
;stmt1:
  %10 = extractvalue %AstStmtReturn %0, 0
;stmt2:
  %11 = bitcast %Int64 0 to %Int64
  %12 = ptrtoint %union.2 %10 to %Int64
  %13 = icmp eq %Int64 %12, %11
  br i1 %13, label %then_0, label %else_0
then_0:
;stmt3:
  %14 = load %Type*, %Type** @typeUnit
  %15 = call i1 (%Type*, %Type*) @func426 (%Type* %9, %Type* %14)
  %16 = xor i1 %15, 1
  br i1 %16, label %then_1, label %else_1
then_1:
;stmt4:
  %17 = bitcast [21 x %Nat8]* @func516_str1 to %Str
  %18 = extractvalue %AstStmtReturn %0, 1
  call void (%Str, %TokenInfo*) @error (%Str %17, %TokenInfo* %18)
;stmt5:
  %19 = inttoptr %Unit zeroinitializer to %union.33
  ret %union.33 %19
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt6:
  %21 = extractvalue %AstStmtReturn %0, 1
  %22 = call %Stmt* (%StmtKind, %TokenInfo*) @func506 (%StmtKind 7, %TokenInfo* %21)
;stmt7:
  %23 = getelementptr inbounds %Stmt, %Stmt* %22, i1 0, i32 7
  %24 = inttoptr %Unit zeroinitializer to %union.5
  %25 = insertvalue %StmtReturn zeroinitializer, %union.5 %24, 0
  %26 = extractvalue %AstStmtReturn %0, 1
  %27 = insertvalue %StmtReturn %25, %TokenInfo* %26, 1
  store %StmtReturn %27, %StmtReturn* %23, align 16
;stmt8:
  %28 = bitcast %Stmt* %22 to %union.33
  ret %union.33 %28
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt9:
  %30 = bitcast %union.2 %10 to %AstValue*
  %31 = call %Value* (%AstValue*) @func442 (%AstValue* %30)
;stmt10:
  %32 = getelementptr inbounds %Value, %Value* %31, i1 0, i32 0
  %33 = load %ValueKind, %ValueKind* %32
  %34 = icmp eq %ValueKind %33, 1
  br i1 %34, label %then_2, label %else_2
then_2:
;stmt11:
  %35 = inttoptr %Unit zeroinitializer to %union.33
  ret %union.33 %35
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
;stmt12:
  %37 = call %Value* (%Value*, %Type*) @func497 (%Value* %31, %Type* %9)
;stmt13:
  %38 = getelementptr inbounds %Value, %Value* %37, i1 0, i32 1
  %39 = load %Type*, %Type** %38
  %40 = getelementptr inbounds %Value, %Value* %31, i1 0, i32 19
  %41 = load %TokenInfo*, %TokenInfo** %40
  %42 = call i1 (%Type*, %Type*, %TokenInfo*) @type_check (%Type* %9, %Type* %39, %TokenInfo* %41)
  %43 = xor i1 %42, 1
  br i1 %43, label %then_3, label %else_3
then_3:
  br label %endif_3
else_3:
  br label %endif_3
endif_3:
;stmt14:
  %44 = extractvalue %AstStmtReturn %0, 1
  %45 = call %Stmt* (%StmtKind, %TokenInfo*) @func506 (%StmtKind 7, %TokenInfo* %44)
;stmt15:
  %46 = getelementptr inbounds %Stmt, %Stmt* %45, i1 0, i32 7
  %47 = bitcast %Value* %37 to %union.5
  %48 = insertvalue %StmtReturn zeroinitializer, %union.5 %47, 0
  %49 = extractvalue %AstStmtReturn %0, 1
  %50 = insertvalue %StmtReturn %48, %TokenInfo* %49, 1
  store %StmtReturn %50, %StmtReturn* %46, align 16
;stmt16:
  %51 = bitcast %Stmt* %45 to %union.33
  ret %union.33 %51
}

define %union.34 @func517 (%AstStmtTypeBind) {
;stmt0:
  %2 = extractvalue %AstStmtTypeBind %0, 0
  %3 = getelementptr inbounds %AstId, %AstId* %2, i1 0, i32 0
  %4 = load %Str, %Str* %3
;stmt1:
  %5 = extractvalue %AstStmtTypeBind %0, 1
  %6 = call %Type* (%AstType*) @func400 (%AstType* %5)
;stmt2:
  %7 = call %Str () @func150 ()
;stmt3:
  %8 = getelementptr inbounds %Type, %Type* %6, i1 0, i32 2
  %9 = load %Str, %Str* %8; loadImmPtr
  %10 = inttoptr i64 0 to%Str
  %11 = icmp eq %Str %9, %10
  br i1 %11, label %then_0, label %else_0
then_0:
;stmt4:
  %12 = getelementptr inbounds %Type, %Type* %6, i1 0, i32 2
  store %Str %7, %Str* %12, align 8
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt5:
  %13 = load %Module*, %Module** @module
  %14 = getelementptr inbounds %Module, %Module* %13, i1 0, i32 1
  call void (%Index*, %Str, %Type*) @func145 (%Index* %14, %Str %4, %Type* %6)
;stmt6:
  %15 = getelementptr inbounds %Assembly, %Assembly* @asm0, i1 0
  %16 = call %Definition* (%Assembly*, %Str, %Type*) @func269 (%Assembly* %15, %Str %7, %Type* %6)
;stmt7:
  %17 = inttoptr %Unit zeroinitializer to %union.34
  ret %union.34 %17
}

define %union.35 @func518 (%AstStmtBreak) {
;stmt0:
  %2 = load %FuncContext*, %FuncContext** @fctx
  %3 = getelementptr inbounds %FuncContext, %FuncContext* %2, i1 0, i32 3
  %4 = load %Nat32, %Nat32* %3
  %5 = icmp eq %Nat32 %4, 0
  br i1 %5, label %then_0, label %else_0
then_0:
;stmt1:
  %6 = bitcast [34 x %Nat8]* @func518_str1 to %Str; loadImmPtr
  %7 = inttoptr i64 0 to%TokenInfo*
  call void (%Str, %TokenInfo*) @error (%Str %6, %TokenInfo* %7)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt2:
  %8 = extractvalue %AstStmtBreak %0, 0
  %9 = call %Stmt* (%StmtKind, %TokenInfo*) @func506 (%StmtKind 8, %TokenInfo* %8)
  %10 = bitcast %Stmt* %9 to %union.35
  ret %union.35 %10
}

define %union.36 @func519 (%AstStmtContinue) {
;stmt0:
  %2 = load %FuncContext*, %FuncContext** @fctx
  %3 = getelementptr inbounds %FuncContext, %FuncContext* %2, i1 0, i32 3
  %4 = load %Nat32, %Nat32* %3
  %5 = icmp eq %Nat32 %4, 0
  br i1 %5, label %then_0, label %else_0
then_0:
;stmt1:
  %6 = bitcast [34 x %Nat8]* @func519_str1 to %Str; loadImmPtr
  %7 = inttoptr i64 0 to%TokenInfo*
  call void (%Str, %TokenInfo*) @error (%Str %6, %TokenInfo* %7)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt2:
  %8 = extractvalue %AstStmtContinue %0, 0
  %9 = call %Stmt* (%StmtKind, %TokenInfo*) @func506 (%StmtKind 9, %TokenInfo* %8)
  %10 = bitcast %Stmt* %9 to %union.36
  ret %union.36 %10
}

define %union.37 @func520 (%AstStmtGoto) {
;stmt0:
  %2 = extractvalue %AstStmtGoto %0, 1
  %3 = call %Stmt* (%StmtKind, %TokenInfo*) @func506 (%StmtKind 10, %TokenInfo* %2)
;stmt1:
  %4 = getelementptr inbounds %Stmt, %Stmt* %3, i1 0, i32 12
  %5 = extractvalue %AstStmtGoto %0, 0
  %6 = getelementptr inbounds %AstId, %AstId* %5, i1 0, i32 0
  %7 = load %Str, %Str* %6
  store %Str %7, %Str* %4, align 8
;stmt2:
  %8 = bitcast %Stmt* %3 to %union.37
  ret %union.37 %8
}

define %union.38 @func521 (%AstStmtLabel) {
;stmt0:
  %2 = extractvalue %AstStmtLabel %0, 1
  %3 = call %Stmt* (%StmtKind, %TokenInfo*) @func506 (%StmtKind 11, %TokenInfo* %2)
;stmt1:
  %4 = getelementptr inbounds %Stmt, %Stmt* %3, i1 0, i32 12
  %5 = extractvalue %AstStmtLabel %0, 0
  %6 = getelementptr inbounds %AstId, %AstId* %5, i1 0, i32 0
  %7 = load %Str, %Str* %6
  store %Str %7, %Str* %4, align 8
;stmt2:
  %8 = bitcast %Stmt* %3 to %union.38
  ret %union.38 %8
}

define void @module_init (%Module*) {
;stmt0:
  %2 = getelementptr inbounds %Module, %Module* %0, i1 0, i32 1
  call void (%Index*) @func132 (%Index* %2)
;stmt1:
  %3 = getelementptr inbounds %Module, %Module* %0, i1 0, i32 0
  call void (%Index*) @func132 (%Index* %3)
  ret void
}

define void @compiler_init () {
;stmt0:
  %1 = call %Unit* (%Nat32) @malloc (%Nat32 192)
  %2 = bitcast %Unit* %1 to %Module*
  store %Module* %2, %Module** @module, align 8
;stmt1:
  %3 = load %Module*, %Module** @module
  call void (%Module*) @module_init (%Module* %3)
;stmt2:
  %4 = getelementptr inbounds %Index, %Index* @builtinIndex, i1 0
  call void (%Index*) @func132 (%Index* %4)
;stmt3:
  call void () @func428 ()
;stmt4:
  call void () @func505 ()
;stmt5:
  %5 = bitcast [4 x %Nat8]* @func523_str1 to %Str
  %6 = call %Int32 (%Str, ...) @printf (%Str %5)
;stmt6:
  %7 = getelementptr inbounds %Assembly, %Assembly* @asm0, i1 0
  %8 = bitcast [7 x %Nat8]* @func523_str2 to %Str
  call void (%Assembly*, %Arch, %Str) @func264 (%Assembly* %7, %Arch 1, %Str %8)
  ret void
}

define void @func525 (%Definition*, %Str) {
;stmt0:
  %3 = getelementptr inbounds %Definition, %Definition* %0, i1 0, i32 2
  %4 = getelementptr inbounds %DefType, %DefType* %3, i1 0, i32 0
  store %Str %1, %Str* %4, align 8
  ret void
}

define void @func526 (%Definition*, %Str) {
;stmt0:
  %3 = getelementptr inbounds %Definition, %Definition* %0, i1 0, i32 3
  %4 = getelementptr inbounds %DefConst, %DefConst* %3, i1 0, i32 0
  store %Str %1, %Str* %4, align 8
  ret void
}

define void @func527 (%Definition*, %Str) {
;stmt0:
  %3 = getelementptr inbounds %Definition, %Definition* %0, i1 0, i32 1
  %4 = getelementptr inbounds %DefStr, %DefStr* %3, i1 0, i32 0
  store %Str %1, %Str* %4, align 8
  ret void
}

define void @func528 (%Definition*, %Str) {
;stmt0:
  %3 = getelementptr inbounds %Definition, %Definition* %0, i1 0, i32 4
  %4 = getelementptr inbounds %DefArray, %DefArray* %3, i1 0, i32 0
  store %Str %1, %Str* %4, align 8
  ret void
}

define void @func529 (%Definition*, %Str) {
;stmt0:
  %3 = getelementptr inbounds %Definition, %Definition* %0, i1 0, i32 5
  %4 = getelementptr inbounds %DefFunc, %DefFunc* %3, i1 0, i32 0
  store %Str %1, %Str* %4, align 8
  ret void
}

define void @func530 (%Definition*, %Str) {
;stmt0:
  %3 = getelementptr inbounds %Definition, %Definition* %0, i1 0, i32 6
  %4 = getelementptr inbounds %DefVar, %DefVar* %3, i1 0, i32 0
  store %Str %1, %Str* %4, align 8
  ret void
}

define void @func531 (%Definition*, %Str) {
;stmt0:
  %3 = getelementptr inbounds %Definition, %Definition* %0, i1 0, i32 7
  %4 = getelementptr inbounds %DefAlias, %DefAlias* %3, i1 0, i32 0
  store %Str %1, %Str* %4, align 8
  ret void
}

define void @func532 () {
  ret void
}

define void @def_rename (%Definition*, %Str) {
;stmt0:
  %3 = getelementptr inbounds %Definition, %Definition* %0, i1 0, i32 0
  %4 = load %DefinitionKind, %DefinitionKind* %3
  br label %select_1_0
select_1_0:
  %5 = icmp eq %DefinitionKind %4, 0
  br i1 %5, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  call void (%Definition*, %Str) @func525 (%Definition* %0, %Str %1)
  br label %select_1_end
select_1_1:
  %6 = icmp eq %DefinitionKind %4, 1
  br i1 %6, label %select_1_1_ok, label %select_1_2
select_1_1_ok:
  call void (%Definition*, %Str) @func526 (%Definition* %0, %Str %1)
  br label %select_1_end
select_1_2:
  %7 = icmp eq %DefinitionKind %4, 2
  br i1 %7, label %select_1_2_ok, label %select_1_3
select_1_2_ok:
  call void (%Definition*, %Str) @func527 (%Definition* %0, %Str %1)
  br label %select_1_end
select_1_3:
  %8 = icmp eq %DefinitionKind %4, 3
  br i1 %8, label %select_1_3_ok, label %select_1_4
select_1_3_ok:
  call void (%Definition*, %Str) @func528 (%Definition* %0, %Str %1)
  br label %select_1_end
select_1_4:
  %9 = icmp eq %DefinitionKind %4, 4
  br i1 %9, label %select_1_4_ok, label %select_1_5
select_1_4_ok:
  call void (%Definition*, %Str) @func529 (%Definition* %0, %Str %1)
  br label %select_1_end
select_1_5:
  %10 = icmp eq %DefinitionKind %4, 5
  br i1 %10, label %select_1_5_ok, label %select_1_6
select_1_5_ok:
  call void (%Definition*, %Str) @func530 (%Definition* %0, %Str %1)
  br label %select_1_end
select_1_6:
  %11 = icmp eq %DefinitionKind %4, 6
  br i1 %11, label %select_1_6_ok, label %select_1_7
select_1_6_ok:
  call void (%Definition*, %Str) @func531 (%Definition* %0, %Str %1)
  br label %select_1_end
select_1_7:
  call void () @func532 ()
  br label %select_1_end
select_1_end:
  ret void
}

define %Str @func534 (%Definition*) {
;stmt0:
  %2 = getelementptr inbounds %Definition, %Definition* %0, i1 0, i32 2
  %3 = getelementptr inbounds %DefType, %DefType* %2, i1 0, i32 0
  %4 = load %Str, %Str* %3
  ret %Str %4
}

define %Str @func535 (%Definition*) {
;stmt0:
  %2 = getelementptr inbounds %Definition, %Definition* %0, i1 0, i32 3
  %3 = getelementptr inbounds %DefConst, %DefConst* %2, i1 0, i32 0
  %4 = load %Str, %Str* %3
  ret %Str %4
}

define %Str @func536 (%Definition*) {
;stmt0:
  %2 = getelementptr inbounds %Definition, %Definition* %0, i1 0, i32 1
  %3 = getelementptr inbounds %DefStr, %DefStr* %2, i1 0, i32 0
  %4 = load %Str, %Str* %3
  ret %Str %4
}

define %Str @func537 (%Definition*) {
;stmt0:
  %2 = getelementptr inbounds %Definition, %Definition* %0, i1 0, i32 4
  %3 = getelementptr inbounds %DefArray, %DefArray* %2, i1 0, i32 0
  %4 = load %Str, %Str* %3
  ret %Str %4
}

define %Str @func538 (%Definition*) {
;stmt0:
  %2 = getelementptr inbounds %Definition, %Definition* %0, i1 0, i32 5
  %3 = getelementptr inbounds %DefFunc, %DefFunc* %2, i1 0, i32 0
  %4 = load %Str, %Str* %3
  ret %Str %4
}

define %Str @func539 (%Definition*) {
;stmt0:
  %2 = getelementptr inbounds %Definition, %Definition* %0, i1 0, i32 6
  %3 = getelementptr inbounds %DefVar, %DefVar* %2, i1 0, i32 0
  %4 = load %Str, %Str* %3
  ret %Str %4
}

define %Str @func540 (%Definition*) {
;stmt0:
  %2 = getelementptr inbounds %Definition, %Definition* %0, i1 0, i32 7
  %3 = getelementptr inbounds %DefAlias, %DefAlias* %2, i1 0, i32 0
  %4 = load %Str, %Str* %3
  ret %Str %4
}

define %Str @func541 () {
;stmt0:
  %1 = bitcast [17 x %Nat8]* @func533_func541_str1 to %Str
  ret %Str %1
}

define %Str @func533 (%Definition*) {
;stmt0:
  %2 = getelementptr inbounds %Definition, %Definition* %0, i1 0, i32 0
  %3 = load %DefinitionKind, %DefinitionKind* %2
  br label %select_1_0
select_1_0:
  %4 = icmp eq %DefinitionKind %3, 0
  br i1 %4, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %5 = call %Str (%Definition*) @func534 (%Definition* %0)
  br label %select_1_end
select_1_1:
  %6 = icmp eq %DefinitionKind %3, 1
  br i1 %6, label %select_1_1_ok, label %select_1_2
select_1_1_ok:
  %7 = call %Str (%Definition*) @func535 (%Definition* %0)
  br label %select_1_end
select_1_2:
  %8 = icmp eq %DefinitionKind %3, 2
  br i1 %8, label %select_1_2_ok, label %select_1_3
select_1_2_ok:
  %9 = call %Str (%Definition*) @func536 (%Definition* %0)
  br label %select_1_end
select_1_3:
  %10 = icmp eq %DefinitionKind %3, 3
  br i1 %10, label %select_1_3_ok, label %select_1_4
select_1_3_ok:
  %11 = call %Str (%Definition*) @func537 (%Definition* %0)
  br label %select_1_end
select_1_4:
  %12 = icmp eq %DefinitionKind %3, 4
  br i1 %12, label %select_1_4_ok, label %select_1_5
select_1_4_ok:
  %13 = call %Str (%Definition*) @func538 (%Definition* %0)
  br label %select_1_end
select_1_5:
  %14 = icmp eq %DefinitionKind %3, 5
  br i1 %14, label %select_1_5_ok, label %select_1_6
select_1_5_ok:
  %15 = call %Str (%Definition*) @func539 (%Definition* %0)
  br label %select_1_end
select_1_6:
  %16 = icmp eq %DefinitionKind %3, 6
  br i1 %16, label %select_1_6_ok, label %select_1_7
select_1_6_ok:
  %17 = call %Str (%Definition*) @func540 (%Definition* %0)
  br label %select_1_end
select_1_7:
  %18 = call %Str () @func541 ()
  br label %select_1_end
select_1_end:
  %19 = phi %Str [ %5, %select_1_0_ok ], [ %7, %select_1_1_ok ], [ %9, %select_1_2_ok ], [ %11, %select_1_3_ok ], [ %13, %select_1_4_ok ], [ %15, %select_1_5_ok ], [ %17, %select_1_6_ok ], [ %18, %select_1_7 ]
  ret %Str %19
}

define void @func544 () {
  ret void
}

define void @func543 (%Unit*, %Unit*, %Nat32, %Node*) {
;stmt0:
  %5 = bitcast %Unit* %0 to %AstNode*
;stmt1:
  %6 = getelementptr inbounds %AstNode, %AstNode* %5, i1 0, i32 1
  %7 = load %Unit*, %Unit** %6
;stmt2:
  %8 = getelementptr inbounds %AstNode, %AstNode* %5, i1 0, i32 0
  %9 = load %AstNodeKind, %AstNodeKind* %8
  br label %select_1_0
select_1_0:
  %10 = icmp eq %AstNodeKind %9, 2
  br i1 %10, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %11 = bitcast %Unit* %7 to %AstNodeBindType*
  call void (%AstNodeBindType*) @func546 (%AstNodeBindType* %11)
  br label %select_1_end
select_1_1:
  %12 = icmp eq %AstNodeKind %9, 3
  br i1 %12, label %select_1_1_ok, label %select_1_2
select_1_1_ok:
  %13 = bitcast %Unit* %7 to %AstNodeBindValue*
  call void (%AstNodeBindValue*) @func548 (%AstNodeBindValue* %13)
  br label %select_1_end
select_1_2:
  %14 = icmp eq %AstNodeKind %9, 5
  br i1 %14, label %select_1_2_ok, label %select_1_3
select_1_2_ok:
  %15 = bitcast %Unit* %7 to %AstNodeDeclValue*
  call void (%AstNodeDeclValue*) @func549 (%AstNodeDeclValue* %15)
  br label %select_1_end
select_1_3:
  %16 = icmp eq %AstNodeKind %9, 1
  br i1 %16, label %select_1_3_ok, label %select_1_4
select_1_3_ok:
  %17 = bitcast %Unit* %7 to %AstNodeImport*
  call void (%AstNodeImport*) @func545 (%AstNodeImport* %17)
  br label %select_1_end
select_1_4:
  call void () @func544 ()
  br label %select_1_end
select_1_end:
  ret void
}

define %Assembly* @func542 (%AstModule*) {
;stmt0:
  %2 = getelementptr inbounds %AstModule, %AstModule* %0, i1 0, i32 0; loadImmPtr
  %3 = inttoptr i64 0 to%Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @func64 (%List* %2, %ListForeachHandler @func543, %Unit* %3)
;stmt1:
  %4 = load %Int32, %Int32* @errcnt
  %5 = icmp sgt %Int32 %4, 0
  br i1 %5, label %then_0, label %else_0
then_0:
;stmt2:; loadImmPtr
  %6 = inttoptr i64 0 to%Assembly*
  ret %Assembly* %6
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt3:
  %8 = getelementptr inbounds %Assembly, %Assembly* @asm0, i1 0
  ret %Assembly* %8
}

define void @func545 (%AstNodeImport*) {
;stmt0:
  %2 = getelementptr inbounds %AstNodeImport, %AstNodeImport* %0, i1 0, i32 0
  %3 = load %Str, %Str* %2
;stmt1:
  %4 = getelementptr inbounds %List, %List* @imp_list, i1 0
  %5 = call %Unit* (%List*, %Str) @map_get (%List* %4, %Str %3); loadImmPtr
  %6 = inttoptr i64 0 to%Unit*
  %7 = icmp ne %Unit* %5, %6
  br i1 %7, label %then_0, label %else_0
then_0:
;stmt2:
ret void
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt3:
  %9 = getelementptr inbounds %List, %List* @imp_list, i1 0
  %10 = getelementptr inbounds %List, %List* @imp_list, i1 0
  %11 = bitcast %List* %10 to %Unit*
  %12 = call i1 (%List*, %Str, %Unit*) @map_append (%List* %9, %Str %3, %Unit* %11)
;stmt4:
  %13 = bitcast [3 x %Nat8]* @func545_str1 to %Str
  %14 = call %Str (%Str, %Str) @cat (%Str %3, %Str %13)
;stmt5:
  %15 = call i1 (%Str) @exists (%Str %14)
  br i1 %15, label %then_1, label %else_1
then_1:
;stmt6:
  %16 = call %union.7 (%Str) @parse (%Str %14)
;stmt7:
  %17 = bitcast %Int64 0 to %Int64
  %18 = ptrtoint %union.7 %16 to %Int64
  %19 = icmp ne %Int64 %18, %17
  br i1 %19, label %then_2, label %else_2
then_2:
;stmt8:
  %20 = bitcast %union.7 %16 to %AstModule*
  %21 = call %Assembly* (%AstModule*) @func542 (%AstModule* %20)
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
;stmt9:
ret void
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt10:
  %23 = bitcast [10 x %Nat8]* @cfgLibraryVar to %Str
  %24 = call %Str (%Str) @getenv (%Str %23)
;stmt11:
  %25 = bitcast [2 x %Nat8]* @func545_str2 to %Str
  %26 = bitcast [3 x %Nat8]* @func545_str3 to %Str
  %27 = call %Str (%Str, %Str, %Str, %Str) @cat4 (%Str %24, %Str %25, %Str %3, %Str %26)
;stmt12:
  %28 = call i1 (%Str) @exists (%Str %27)
  br i1 %28, label %then_3, label %else_3
then_3:
;stmt13:
  %29 = call %union.7 (%Str) @parse (%Str %27)
;stmt14:
  %30 = bitcast %Int64 0 to %Int64
  %31 = ptrtoint %union.7 %29 to %Int64
  %32 = icmp ne %Int64 %31, %30
  br i1 %32, label %then_4, label %else_4
then_4:
;stmt15:
  %33 = bitcast %union.7 %29 to %AstModule*
  %34 = call %Assembly* (%AstModule*) @func542 (%AstModule* %33)
  br label %endif_4
else_4:
  br label %endif_4
endif_4:
;stmt16:
ret void
  br label %endif_3
else_3:
  br label %endif_3
endif_3:
;stmt17:
  %36 = bitcast [15 x %Nat8]* @func545_str4 to %Str
  %37 = getelementptr inbounds %AstNodeImport, %AstNodeImport* %0, i1 0, i32 1
  %38 = load %TokenInfo*, %TokenInfo** %37
  call void (%Str, %TokenInfo*) @error (%Str %36, %TokenInfo* %38)
  ret void
}

define void @func546 (%AstNodeBindType*) {
;stmt0:
  %2 = getelementptr inbounds %AstNodeBindType, %AstNodeBindType* %0, i1 0, i32 0
  %3 = load %AstId*, %AstId** %2
  %4 = getelementptr inbounds %AstId, %AstId* %3, i1 0, i32 0
  %5 = load %Str, %Str* %4
;stmt1:
  %6 = getelementptr inbounds %AstNodeBindType, %AstNodeBindType* %0, i1 0, i32 1
  %7 = load %AstType*, %AstType** %6
  %8 = call %Type* (%AstType*) @func400 (%AstType* %7)
;stmt2:
  %9 = call %Type* (%Str) @func146 (%Str %5)
;stmt3:; loadImmPtr
  %10 = inttoptr i64 0 to%Type*
  %11 = icmp ne %Type* %9, %10
  br i1 %11, label %then_0, label %else_0
then_0:
;stmt4:
  %12 = getelementptr inbounds %Type, %Type* %9, i1 0, i32 0
  %13 = load %TypeKind, %TypeKind* %12
  %14 = icmp ne %TypeKind %13, 1
  br i1 %14, label %then_1, label %else_1
then_1:
;stmt5:
  %15 = bitcast [18 x %Nat8]* @func546_str1 to %Str
  %16 = getelementptr inbounds %AstNodeBindType, %AstNodeBindType* %0, i1 0, i32 2
  %17 = load %TokenInfo*, %TokenInfo** %16
  call void (%Str, %TokenInfo*) @error (%Str %15, %TokenInfo* %17)
;stmt6:
ret void
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt7:
  %19 = getelementptr inbounds %Type, %Type* %8, i1 0, i32 2
  %20 = load %Str, %Str* %19; loadImmPtr
  %21 = inttoptr i64 0 to%Str
  %22 = icmp eq %Str %20, %21
  br i1 %22, label %then_2, label %else_2
then_2:
;stmt8:
  %23 = getelementptr inbounds %Type, %Type* %8, i1 0, i32 2
  store %Str %5, %Str* %23, align 8
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
;stmt9:
  %24 = bitcast %Type* %9 to %Unit*
  %25 = bitcast %Type* %8 to %Unit*
  %26 = call %Unit* (%Unit*, %Unit*, %Nat32) @memcpy (%Unit* %24, %Unit* %25, %Nat32 176)
;stmt10:
  %27 = getelementptr inbounds %Assembly, %Assembly* @asm0, i1 0
  %28 = call %Definition* (%Assembly*, %Str, %Type*) @func269 (%Assembly* %27, %Str %5, %Type* %9)
;stmt11:
ret void
  br label %endif_0
else_0:
;stmt12:
  %30 = load %Module*, %Module** @module
  %31 = getelementptr inbounds %Module, %Module* %30, i1 0, i32 0
  call void (%Index*, %Str, %Type*) @func145 (%Index* %31, %Str %5, %Type* %8)
  br label %endif_0
endif_0:
;stmt13:
  %32 = getelementptr inbounds %Assembly, %Assembly* @asm0, i1 0
  %33 = call %Definition* (%Assembly*, %Str, %Type*) @func269 (%Assembly* %32, %Str %5, %Type* %8)
;stmt14:
  %34 = getelementptr inbounds %Type, %Type* %8, i1 0, i32 2
  %35 = load %Str, %Str* %34; loadImmPtr
  %36 = inttoptr i64 0 to%Str
  %37 = icmp eq %Str %35, %36
  br i1 %37, label %then_3, label %else_3
then_3:
;stmt15:
  %38 = getelementptr inbounds %Type, %Type* %8, i1 0, i32 2
  store %Str %5, %Str* %38, align 8
  br label %endif_3
else_3:
  br label %endif_3
endif_3:
  ret void
}

define %Value* @func547 (%Value*) {
;stmt0:
  %2 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 1
  %3 = load %Type*, %Type** %2
  %4 = getelementptr inbounds %Type, %Type* %3, i1 0, i32 0
  %5 = load %TypeKind, %TypeKind* %4
  %6 = icmp eq %TypeKind %5, 6
  br i1 %6, label %then_0, label %else_0
then_0:
;stmt1:
  %7 = call %Unit* (%Nat32) @malloc (%Nat32 520)
  %8 = bitcast %Unit* %7 to %Value*
;stmt2:
  %9 = bitcast %Value* %8 to %Unit*
  %10 = bitcast %Value* %0 to %Unit*
  %11 = call %Unit* (%Unit*, %Unit*, %Nat32) @memcpy (%Unit* %9, %Unit* %10, %Nat32 520)
;stmt3:
  %12 = getelementptr inbounds %Value, %Value* %8, i1 0, i32 1
  %13 = getelementptr inbounds %Value, %Value* %8, i1 0, i32 1
  %14 = load %Type*, %Type** %13
  %15 = getelementptr inbounds %Type, %Type* %14, i1 0, i32 12
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

define void @func548 (%AstNodeBindValue*) {
;stmt0:
  %2 = getelementptr inbounds %AstNodeBindValue, %AstNodeBindValue* %0, i1 0, i32 0
  %3 = load %AstId*, %AstId** %2
  %4 = getelementptr inbounds %AstId, %AstId* %3, i1 0, i32 0
  %5 = load %Str, %Str* %4
;stmt1:
  %6 = getelementptr inbounds %AstNodeBindValue, %AstNodeBindValue* %0, i1 0, i32 1
  %7 = load %AstValue*, %AstValue** %6
  %8 = call %Value* (%AstValue*, i1) @func443 (%AstValue* %7, i1 0)
;stmt2:
  %9 = call %Value* (%Value*) @func547 (%Value* %8)
;stmt3:
  %10 = call %Value* (%Str) @func138 (%Str %5)
;stmt4:; loadImmPtr
  %11 = inttoptr i64 0 to%Value*
  %12 = icmp ne %Value* %10, %11
  br i1 %12, label %then_0, label %else_0
then_0:
;stmt5:
  %13 = getelementptr inbounds %Value, %Value* %10, i1 0, i32 0
  %14 = load %ValueKind, %ValueKind* %13
  %15 = icmp ne %ValueKind %14, 2
  br i1 %15, label %then_1, label %else_1
then_1:
;stmt6:
  %16 = bitcast [19 x %Nat8]* @func548_str1 to %Str
  %17 = getelementptr inbounds %AstNodeBindValue, %AstNodeBindValue* %0, i1 0, i32 2
  %18 = load %TokenInfo*, %TokenInfo** %17
  call void (%Str, %TokenInfo*) @error (%Str %16, %TokenInfo* %18)
;stmt7:
ret void
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt8:
  %20 = bitcast %Value* %10 to %Unit*
  %21 = bitcast %Value* %9 to %Unit*
  %22 = call %Unit* (%Unit*, %Unit*, %Nat32) @memcpy (%Unit* %20, %Unit* %21, %Nat32 520)
;stmt9:
ret void
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt10:
  call void (%Str, %Value*) @func144 (%Str %5, %Value* %9)
;stmt11:
  %24 = getelementptr inbounds %Value, %Value* %9, i1 0, i32 1
  %25 = load %Type*, %Type** %24
  %26 = getelementptr inbounds %Type, %Type* %25, i1 0, i32 6
  %27 = getelementptr inbounds %TypeFunc, %TypeFunc* %26, i1 0, i32 2
  %28 = bitcast [7 x %Nat8]* @func548_str2 to %Str
  %29 = call %Int32 (%Str, %Str) @strcmp (%Str %28, %Str %5)
  %30 = icmp eq %Int32 %29, 0
  %31 = bitcast [6 x %Nat8]* @func548_str3 to %Str
  %32 = call %Int32 (%Str, %Str) @strcmp (%Str %31, %Str %5)
  %33 = icmp eq %Int32 %32, 0
  %34 = bitcast [7 x %Nat8]* @func548_str4 to %Str
  %35 = call %Int32 (%Str, %Str) @strcmp (%Str %34, %Str %5)
  %36 = icmp eq %Int32 %35, 0
  %37 = bitcast [8 x %Nat8]* @func548_str5 to %Str
  %38 = call %Int32 (%Str, %Str) @strcmp (%Str %37, %Str %5)
  %39 = icmp eq %Int32 %38, 0
  %40 = bitcast [8 x %Nat8]* @func548_str6 to %Str
  %41 = call %Int32 (%Str, %Str) @strcmp (%Str %40, %Str %5)
  %42 = icmp eq %Int32 %41, 0
  %43 = or i1 %39, %42
  %44 = or i1 %36, %43
  %45 = or i1 %33, %44
  %46 = or i1 %30, %45
  store i1 %46, i1* %27, align 1
;stmt12:
  %47 = getelementptr inbounds %Value, %Value* %9, i1 0, i32 6
  %48 = load %Definition*, %Definition** %47; loadImmPtr
  %49 = inttoptr i64 0 to%Definition*
  %50 = icmp ne %Definition* %48, %49
  br i1 %50, label %then_2, label %else_2
then_2:
;stmt13:
  %51 = getelementptr inbounds %Value, %Value* %9, i1 0, i32 6
  %52 = load %Definition*, %Definition** %51
  call void (%Definition*, %Str) @def_rename (%Definition* %52, %Str %5)
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
  ret void
}

define void @func550 (%Unit*, %Unit*, %Nat32, %Node*) {
;stmt0:
  %5 = bitcast %Unit* %0 to %AstId*
;stmt1:
  %6 = bitcast %Unit* %1 to %Type*
;stmt2:
  %7 = getelementptr inbounds %Type, %Type* %6, i1 0, i32 0
  %8 = load %TypeKind, %TypeKind* %7
  %9 = icmp eq %TypeKind %8, 1
  br i1 %9, label %then_0, label %else_0
then_0:
;stmt3:
  %10 = bitcast [15 x %Nat8]* @func549_func550_str1 to %Str
  %11 = getelementptr inbounds %Type, %Type* %6, i1 0, i32 14
  %12 = load %TokenInfo*, %TokenInfo** %11
  call void (%Str, %TokenInfo*) @error (%Str %10, %TokenInfo* %12)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt4:
  call void (%AstId*, %Type*) @func551 (%AstId* %5, %Type* %6)
  ret void
}

define void @func549 (%AstNodeDeclValue*) {
;stmt0:
  %2 = getelementptr inbounds %AstNodeDeclValue, %AstNodeDeclValue* %0, i1 0, i32 0
  %3 = load %AstDecl*, %AstDecl** %2
;stmt1:
  %4 = getelementptr inbounds %AstDecl, %AstDecl* %3, i1 0, i32 1
  %5 = load %AstType*, %AstType** %4
  %6 = call %Type* (%AstType*) @func400 (%AstType* %5)
;stmt2:
  %7 = getelementptr inbounds %AstDecl, %AstDecl* %3, i1 0, i32 0
  %8 = bitcast %Type* %6 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @func64 (%List* %7, %ListForeachHandler @func550, %Unit* %8)
  ret void
}

define void @func551 (%AstId*, %Type*) {
;stmt0:
  %3 = getelementptr inbounds %AstId, %AstId* %0, i1 0, i32 1
  %4 = load %TokenInfo*, %TokenInfo** %3
  %5 = call %Value* (%ValueKind, %Type*, %TokenInfo*) @func437 (%ValueKind 2, %Type* %1, %TokenInfo* %4)
;stmt1:
  %6 = getelementptr inbounds %AstId, %AstId* %0, i1 0, i32 0
  %7 = load %Str, %Str* %6
  call void (%Str, %Value*) @func144 (%Str %7, %Value* %5)
  ret void
}

define %Value* @func552 (%AstId*, %Type*, %Value*, %TokenInfo*) {
;stmt0:
  %5 = getelementptr inbounds %AstId, %AstId* %0, i1 0, i32 1
  %6 = load %TokenInfo*, %TokenInfo** %5
  %7 = call %Value* (%ValueKind, %Type*, %TokenInfo*) @func437 (%ValueKind 6, %Type* %1, %TokenInfo* %6)
;stmt1:
  %8 = getelementptr inbounds %Value, %Value* %7, i1 0, i32 6
  %9 = getelementptr inbounds %Assembly, %Assembly* @asm0, i1 0
  %10 = getelementptr inbounds %AstId, %AstId* %0, i1 0, i32 0
  %11 = load %Str, %Str* %10
  %12 = call %Definition* (%Assembly*, %Str, %Type*, %Value*) @func273 (%Assembly* %9, %Str %11, %Type* %1, %Value* %2)
  store %Definition* %12, %Definition** %8, align 8
;stmt2:
  %13 = getelementptr inbounds %AstId, %AstId* %0, i1 0, i32 0
  %14 = load %Str, %Str* %13
  call void (%Str, %Value*) @func144 (%Str %14, %Value* %7)
;stmt3:
  ret %Value* %7
}

define %Stmt* @func554 (%AstId*, %Type*, %Value*, %TokenInfo*) {
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
  %11 = call %Stmt* (%StmtKind, %TokenInfo*) @func506 (%StmtKind 3, %TokenInfo* %3)
;stmt5:
  %12 = getelementptr inbounds %Stmt, %Stmt* %11, i1 0, i32 4
  store %Decl* %6, %Decl** %12, align 8
;stmt6:
  ret %Stmt* %11
}

define void @func555 (%Stmt*) {
;stmt0:
  %2 = load %FuncContext*, %FuncContext** @fctx
  %3 = getelementptr inbounds %FuncContext, %FuncContext* %2, i1 0, i32 2
  %4 = load %StmtBlock*, %StmtBlock** %3
  %5 = getelementptr inbounds %StmtBlock, %StmtBlock* %4, i1 0, i32 2
  %6 = bitcast %Stmt* %0 to %Unit*
  %7 = call i1 (%List*, %Unit*) @list_append (%List* %5, %Unit* %6)
  ret void
}

define %Value* @func553 (%AstId*, %Type*, %Value*, %TokenInfo*) {
;stmt0:
  %5 = call %Value* (%ValueKind, %Type*, %TokenInfo*) @func437 (%ValueKind 12, %Type* %1, %TokenInfo* %3)
;stmt1:
  %6 = getelementptr inbounds %AstId, %AstId* %0, i1 0, i32 0
  %7 = load %Str, %Str* %6
  call void (%Str, %Value*) @func143 (%Str %7, %Value* %5)
;stmt2:; loadImmPtr
  %8 = inttoptr i64 0 to%TokenInfo*
  %9 = call %Stmt* (%AstId*, %Type*, %Value*, %TokenInfo*) @func554 (%AstId* %0, %Type* %1, %Value* %2, %TokenInfo* %8)
;stmt3:
  call void (%Stmt*) @func555 (%Stmt* %9)
;stmt4:
  %10 = getelementptr inbounds %Value, %Value* %5, i1 0, i32 7
  %11 = getelementptr inbounds %Stmt, %Stmt* %9, i1 0, i32 4
  %12 = load %Decl*, %Decl** %11
  store %Decl* %12, %Decl** %10, align 8
;stmt5:
  ret %Value* %5
}

define %Int32 @main (%Nat32, %Str*) {
;stmt0:
  %3 = bitcast [11 x %Nat8]* @func556_str1 to %Str
  %4 = call %Int32 (%Str, ...) @printf (%Str %3, %Int64 0, %Int64 5)
;stmt1:
  %5 = bitcast [7 x %Nat8]* @func556_str2 to %Str
  %6 = call %union.7 (%Str) @parse (%Str %5)
;stmt2:
  %7 = bitcast %Int64 0 to %Int64
  %8 = ptrtoint %union.7 %6 to %Int64
  %9 = icmp eq %Int64 %8, %7
  br i1 %9, label %then_0, label %else_0
then_0:
;stmt3:
  %10 = load %Int32, %Int32* @errcnt
  ret %Int32 %10
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt4:
  call void () @compiler_init ()
;stmt5:
  %12 = bitcast %union.7 %6 to %AstModule*
  %13 = call %Assembly* (%AstModule*) @func542 (%AstModule* %12)
;stmt6:; loadImmPtr
  %14 = inttoptr i64 0 to%Assembly*
  %15 = icmp ne %Assembly* %13, %14
  br i1 %15, label %then_1, label %else_1
then_1:
;stmt7:
  %16 = bitcast [11 x %Nat8]* @func556_str3 to %Str
  %17 = load %Nat32, %Nat32* @lines
  %18 = call %Int32 (%Str, ...) @printf (%Str %16, %Nat32 %17)
;stmt8:
  %19 = bitcast [7 x %Nat8]* @func556_str4 to %Str
  call void (%Assembly*, %Str) @func282 (%Assembly* %13, %Str %19)
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt9:
  %20 = load %Int32, %Int32* @errcnt
  ret %Int32 %20
}

;aliases:


;metadata:
