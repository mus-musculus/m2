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
%union.0 = type {i16, [40 x i8]}

%union.1 = type {i16, [24 x i8]}

%union.2 = type {i16, [40 x i8]}

%union.3 = type %Unit*

%union.4 = type {i16, [56 x i8]}

%union.5 = type %Unit*

%union.6 = type %Unit*

%union.7 = type {i16, [48 x i8]}

%union.8 = type {i16, [56 x i8]}

%union.9 = type {i16, [72 x i8]}

%union.10 = type {i16, [112 x i8]}

%union.11 = type %Unit*

%union.12 = type %Unit*

%union.13 = type {i16, [112 x i8]}

%union.14 = type %Unit*

%union.15 = type %Unit*

%union.16 = type %Unit*

%union.17 = type %Unit*

%union.18 = type %Unit*

%union.19 = type %Unit*

%union.20 = type %Unit*

%union.21 = type {i16, [40 x i8]}

%union.22 = type %Unit*

%union.23 = type %Unit*

%union.24 = type %Unit*



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
%Nothing = type i16
%Index = type {%List, %List}
%Context = type {%Context*, %Index}
%Module = type {%Context}
%FuncContext = type {%Str, %Value*, %StmtBlock*, %Context, %List, %Nat32, %Nat32, %Nat32, %Nat32}
%TokenKind = type i16
%TokenInfo = type {%Str, %Nat64, %Nat16, %Nat32, %Nat16}
%Token = type {%TokenKind, %TokenInfo, [0 x %Nat8]}
%LexerState = type {%Int32, %TokenKind, [255 x %Nat8], %Nat8, %Nat16, %TokenInfo}
%Source = type {%List}
%ParserState = type {%Source*, %Node*}
%AstNodeList = type {%Node*, %Node*, %Nat64, %Nat32}
%AstModule = type {%List, %Source*}
%ParserError = type i16
%ParserResult = type %union.0
%AstId = type {%Str, %TokenInfo*}
%AstName = type {%AstId*, %AstId*, %TokenInfo*}
%AstIdList = type {%Node*, %Node*, %Nat64, %Nat32}
%AstDecl = type {%List, %union.2*, %TokenInfo*, i1, i1}
%AstNodeComment = type {%Str, %TokenInfo*}
%AstNodeImport = type {%Str, %TokenInfo*}
%AstNodeBindType = type {%AstId*, %union.2*, %TokenInfo*}
%AstNodeBindValue = type {%AstId*, %union.4*, %TokenInfo*}
%AstNodeDeclType = type {%AstId*}
%AstNodeDeclValue = type {%AstDecl*}
%AstNodeDeclVar = type {%AstDecl*}
%AstNode = type %union.1
%AstDeclList = type {%Node*, %Node*, %Nat64, %Nat32}
%AstTypeList = type {%Node*, %Node*, %Nat64, %Nat32}
%AstTypeNamed = type {%AstId*, %AstId*, %TokenInfo*}
%AstTypeEnum = type {%List, %TokenInfo*}
%AstTypeRecord = type {%List, %TokenInfo*}
%AstTypeArray = type {%union.2*, %union.4*, %TokenInfo*}
%AstTypeArrayU = type {%union.2*, %TokenInfo*}
%AstTypePointer = type {%union.2*, %TokenInfo*}
%AstTypeFunc = type {%union.2*, %union.2*, i1, %TokenInfo*}
%AstTypeVar = type {%union.2*, %TokenInfo*}
%AstTypeNewType = type {%union.2*, %TokenInfo*}
%AstTypeUnion = type {%List, %TokenInfo*}
%AstTypeBinary = type {%union.2*, %union.2*, %TokenInfo*}
%AstTypeOr = type {%union.2*, %union.2*, %TokenInfo*}
%AstTypeAnd = type {%union.2*, %union.2*, %TokenInfo*}
%TypeParserError = type i16
%AstType = type %union.2
%AstValueFunc = type {%union.2*, %union.3, %TokenInfo*}
%AstValueCall = type {%union.4*, %List, %TokenInfo*}
%AstValueIndex = type {%union.4*, %union.4*, %TokenInfo*}
%AstValueAccess = type {%union.4*, %AstId*, %TokenInfo*}
%AstValueValType = type {%union.4*, %union.2*, %TokenInfo*}
%AstValueCast = type {%union.4*, %union.2*, %TokenInfo*}
%AstValueIs = type {%union.4*, %union.2*, %TokenInfo*}
%AstValueIsnt = type {%union.4*, %union.2*, %TokenInfo*}
%AstValueAs = type {%union.4*, %union.2*, %TokenInfo*}
%AstValueWhenVariant = type {%union.2*, %union.4*, %union.4*, %TokenInfo*}
%AstValueWhen = type {%union.4*, %List, %union.4*, %TokenInfo*}
%AstValueRecord = type {%List, %TokenInfo*}
%AstValueArray = type {%List, %TokenInfo*}
%AstValueBinary = type {%union.4*, %union.4*, %TokenInfo*}
%AstValueAdd = type {%union.4*, %union.4*, %TokenInfo*}
%AstValueSub = type {%union.4*, %union.4*, %TokenInfo*}
%AstValueMul = type {%union.4*, %union.4*, %TokenInfo*}
%AstValueDiv = type {%union.4*, %union.4*, %TokenInfo*}
%AstValueMod = type {%union.4*, %union.4*, %TokenInfo*}
%AstValueAnd = type {%union.4*, %union.4*, %TokenInfo*}
%AstValueOr = type {%union.4*, %union.4*, %TokenInfo*}
%AstValueXor = type {%union.4*, %union.4*, %TokenInfo*}
%AstValueEq = type {%union.4*, %union.4*, %TokenInfo*}
%AstValueNe = type {%union.4*, %union.4*, %TokenInfo*}
%AstValueLt = type {%union.4*, %union.4*, %TokenInfo*}
%AstValueGt = type {%union.4*, %union.4*, %TokenInfo*}
%AstValueLe = type {%union.4*, %union.4*, %TokenInfo*}
%AstValueGe = type {%union.4*, %union.4*, %TokenInfo*}
%AstValueShl = type {%union.4*, %union.4*, %TokenInfo*}
%AstValueShr = type {%union.4*, %union.4*, %TokenInfo*}
%AstValueUnary = type {%union.4*, %TokenInfo*}
%AstValueRef = type {%union.4*, %TokenInfo*}
%AstValueDeref = type {%union.4*, %TokenInfo*}
%AstValueMinus = type {%union.4*, %TokenInfo*}
%AstValuePlus = type {%union.4*, %TokenInfo*}
%AstValueNot = type {%union.4*, %TokenInfo*}
%AstValueSizeof = type {%union.2*, %TokenInfo*}
%AstValueAlignof = type {%union.2*, %TokenInfo*}
%AstValueString = type {%Str, %TokenInfo*}
%AstValueNumber = type {%Str, %TokenInfo*}
%AstValueName = type {%AstId*, %AstId*, %TokenInfo*}
%AstValue = type %union.4
%ValueParserError = type i16
%ValueParserResult = type %union.4
%AstStmtValueBind = type {%AstId*, %union.4*, %TokenInfo*}
%AstStmtTypeBind = type {%AstId*, %union.2*, %TokenInfo*}
%AstStmtExpr = type {%union.4*, %TokenInfo*}
%AstStmtAssign = type {%union.4*, %union.4*, %TokenInfo*}
%AstStmtBlock = type {%List, %TokenInfo*}
%AstStmtIf = type {%union.4*, %union.7*, %union.5, %TokenInfo*}
%AstStmtWhile = type {%union.4*, %union.7*, %TokenInfo*}
%AstStmtReturn = type {%union.6, %TokenInfo*}
%AstStmtGoto = type {%AstId*, %TokenInfo*}
%AstStmtLabel = type {%AstId*, %TokenInfo*}
%AstStmtBreak = type {%TokenInfo*}
%AstStmtAgain = type {%TokenInfo*}
%AstStmt = type %union.7
%TypeNumeric = type {%Nat32, i1, %TokenInfo*}
%TypeArray = type {%Type*, %Nat32, %TokenInfo*}
%TypeArrayU = type {%Type*, %TokenInfo*}
%TypeFunc = type {%Type*, %Type*, i1, %TokenInfo*}
%TypePointer = type {%Type*, %TokenInfo*}
%TypeRecord = type {%List*, %Nat32, %TokenInfo*}
%TypeVar = type {%Type*, %TokenInfo*}
%TypeEnum = type {%List*, %TokenInfo*}
%TypeUnion = type {%List, %Type*, %Nat32, %TokenInfo*}
%EnumConstructor = type {%AstId*, %Nat32, %TokenInfo*}
%Decl = type {%AstId*, %Type*, %Nat32, %Nat16, %Nat32, %Value*, %TokenInfo*}
%TypeKind = type i16
%TypePoison = type {%TokenInfo*}
%TypeUndefined = type {%TokenInfo*}
%TypeGenericReference = type {%TokenInfo*}
%TypeGenericRecord = type {%TokenInfo*}
%TypeBool = type {%TokenInfo*}
%TypeOr = type {%Type*, %Type*, %TokenInfo*}
%TypeNo = type i16
%Type2 = type %union.8
%Type = type {%TypeKind, %Nat32, %Str, %Nat32, %Nat32, %union.8, %TypeNumeric, %TypeFunc, %TypePointer, %TypeArray, %TypeArrayU, %TypeRecord, %TypeEnum, %TypeVar, %TypeUnion, %TypeOr, %TokenInfo*}
%ValueKind = type i16
%ValuePoison = type {%TokenInfo*}
%ValueUndefined = type {%Type*, %TokenInfo*}
%ValueImm = type {%Type*, %Int64, %TokenInfo*}
%ValueGenericRecord = type {%Type*, %List, %TokenInfo*}
%ValueRecord = type {%Type*, %List, %TokenInfo*}
%ValueArray = type {%Type*, %List, %TokenInfo*}
%ValueMention = type {%Type*, %Value*, %TokenInfo*}
%ValueUn = type {%Type*, %Value*, %TokenInfo*}
%ValueRef = type {%Type*, %Value*, %TokenInfo*}
%ValueDeref = type {%Type*, %Value*, %TokenInfo*}
%ValueNot = type {%Type*, %Value*, %TokenInfo*}
%ValueMinus = type {%Type*, %Value*, %TokenInfo*}
%ValuePlus = type {%Type*, %Value*, %TokenInfo*}
%ValueBin = type {%Type*, %Value*, %Value*, %TokenInfo*}
%ValueAdd = type {%Type*, %Value*, %Value*, %TokenInfo*}
%ValueSub = type {%Type*, %Value*, %Value*, %TokenInfo*}
%ValueMul = type {%Type*, %Value*, %Value*, %TokenInfo*}
%ValueDiv = type {%Type*, %Value*, %Value*, %TokenInfo*}
%ValueMod = type {%Type*, %Value*, %Value*, %TokenInfo*}
%ValueOr = type {%Type*, %Value*, %Value*, %TokenInfo*}
%ValueXor = type {%Type*, %Value*, %Value*, %TokenInfo*}
%ValueAnd = type {%Type*, %Value*, %Value*, %TokenInfo*}
%ValueEq = type {%Type*, %Value*, %Value*, %TokenInfo*}
%ValueNe = type {%Type*, %Value*, %Value*, %TokenInfo*}
%ValueLt = type {%Type*, %Value*, %Value*, %TokenInfo*}
%ValueGt = type {%Type*, %Value*, %Value*, %TokenInfo*}
%ValueLe = type {%Type*, %Value*, %Value*, %TokenInfo*}
%ValueGe = type {%Type*, %Value*, %Value*, %TokenInfo*}
%ValueShl = type {%Type*, %Value*, %Value*, %TokenInfo*}
%ValueShr = type {%Type*, %Value*, %Value*, %TokenInfo*}
%ValueCall = type {%Type*, %Value*, %List*, %TokenInfo*}
%ValueAccess = type {%Type*, %Value*, %Str, %TokenInfo*}
%ValueIndex = type {%Type*, %Value*, %Value*, %TokenInfo*}
%ValueCast = type {%Type*, %Value*, %Type*, %TokenInfo*}
%ValueAs = type {%Type*, %Value*, %Type*, %TokenInfo*}
%ValueIs = type {%Type*, %Value*, i1, %Nat32, %TokenInfo*}
%ValueIsnt = type {%Type*, %Value*, i1, %Nat32, %TokenInfo*}
%ValueWhenVariant = type {%Type*, %Value*, %Value*, %Nat32, %TokenInfo*}
%ValueWhen = type {%Type*, i1, %Value*, %List, %Value*, %TokenInfo*}
%ValueGlobalVar = type {%Type*, %Definition*, %TokenInfo*}
%ValueGlobalConst = type {%Type*, %Definition*, %TokenInfo*}
%ValueParam = type {%Type*, %Nat32, %TokenInfo*}
%ValueLocalVar = type {%Type*, %Nat32, %TokenInfo*}
%ValueLocalVal = type {%Type*, %Nat32, %TokenInfo*}
%ValueNo = type i16
%Value2 = type %union.9
%Value = type {%Type*, %union.9, %TokenInfo*, %TokenInfo*}
%NoBlock = type i16
%StmtBlock = type {%Context, %List, %TokenInfo*}
%MaybeBlock = type %union.10
%StmtVarDef = type {%AstId*, %Nat32, %Type*, %Value*, %TokenInfo*}
%StmtValBind = type {%Value*, %Nat32, %TokenInfo*}
%StmtExpr = type {%Value*, %TokenInfo*}
%StmtAssign = type {%Value*, %Value*, %TokenInfo*}
%StmtIf = type {%Value*, %union.13*, %union.11, %TokenInfo*}
%StmtWhile = type {%Value*, %union.13*, %TokenInfo*}
%StmtReturn = type {%union.12, %TokenInfo*}
%StmtBreak = type {%TokenInfo*}
%StmtAgain = type {%TokenInfo*}
%StmtGoto = type {%Str, %TokenInfo*}
%StmtLabel = type {%Str, %TokenInfo*}
%Stmt = type %union.13
%DefinitionKind = type i16
%DefType = type {%Str, %Type*}
%DefConst = type {%Str, %Type*, %Value*}
%DefStr = type {%Str, %Type*, %Str, %Nat32}
%DefArray = type {%Str, %Type*, %Nat32, %List}
%DefFunc = type {%Str, %Type*, %union.10}
%DefVar = type {%Str, %Type*, %Value*}
%DefAlias = type {%Str, %Type*, %Str}
%Definition = type {%DefinitionKind, %DefStr, %DefType, %DefConst, %DefArray, %DefFunc, %DefVar, %DefAlias}
%Assembly = type {%Str, %Str, %Str, %List, %List, %List, %List, %List, %List}
%Arch = type i16
%Rule = type i1 (%Nat8)*
%AstTypeParser = type %union.2* ()*
%AstValueParser = type %union.4* ()*
%AstStmtParser = type %union.17 (%TokenInfo*)*
%LLVM_ValueKind = type i16
%LLVM_Value = type {%LLVM_ValueKind, %Type*, %Int64, %Str, %Nat32}
%LLVM_ValueUndef = type {i1}
%LLVM_ValueZero = type {i1}
%LLVM_ValueEmpty = type {i1}
%LLVM_ValueById = type {%Type*, %Str}
%LLVM_ValueByReg = type {%Type*, %Nat32}
%LLVM_ValueImmediate = type {%Type*, %Int64}
%LLVM_ValueGlobalConst = type {%Type*, %Str}
%LLVM_ValueGlobalVar = type {%Type*, %Str}
%LLVM_ValueLocalVar = type {%Type*, %Nat32}
%LLVM_ValueAddress = type {%Type*, %Nat32}
%LLVM_ValueRegister = type {%Type*, %Nat32}
%LLVM_Value2 = type %union.21
%func305.type1 = type {[64 x %LLVM_Value], %Nat16}
%EvalCast = type %LLVM_Value (%LLVM_Value, %Type*)*
%func351.type2 = type {%LLVM_Value, %LLVM_Value, %Nat32, %Nat32, [256 x %Nat32], %Type*}
%func353.type3 = type {%Type*, %LLVM_Value}
%func355.type4 = type {%Type*, %LLVM_Value, %Nat32}
%func431.type5 = type {%List*, i1}
%func431_func432.type6 = type {%List*, %Type*}
%func451.type7 = type {%Type*, %Nat32}
%func481.type8 = type {%Value*, %Str, %Type*, %List, %Value*}
%func488.type9 = type {%Value*, %List*, %List*, %TokenInfo*}
%DoValueCast = type %Value* (%Value*, %Type*, %TokenInfo*)*
%func505.type10 = type {%Type*, %List}
%func523.type11 = type {%List, %union.23}
%func525.type12 = type {%Type*, %List}
%DoStmtResult = type %union.24

;strings:

@func29_str1 = private unnamed_addr constant [19 x i8] c"assert failed: %s\0A\00", align 1
@func30_str1 = private unnamed_addr constant [2 x i8] c"a\00", align 1
@func30_str2 = private unnamed_addr constant [2 x i8] c"z\00", align 1
@func31_str1 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@func31_str2 = private unnamed_addr constant [2 x i8] c"Z\00", align 1
@func32_str1 = private unnamed_addr constant [2 x i8] c"0\00", align 1
@func32_str2 = private unnamed_addr constant [2 x i8] c"9\00", align 1
@func88_str1 = private unnamed_addr constant [6 x i8] c"(nil)\00", align 1
@func88_str2 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@func88_str3 = private unnamed_addr constant [5 x i8] c"Self\00", align 1
@func88_str4 = private unnamed_addr constant [14 x i8] c"<TypeNumeric>\00", align 1
@func88_str5 = private unnamed_addr constant [5 x i8] c"Bool\00", align 1
@func88_str6 = private unnamed_addr constant [13 x i8] c"<TypePoison>\00", align 1
@func88_str7 = private unnamed_addr constant [16 x i8] c"<TypeForbidden>\00", align 1
@func88_str8 = private unnamed_addr constant [20 x i8] c"<TypeGenericRecord>\00", align 1
@func88_str9 = private unnamed_addr constant [14 x i8] c"<TypeUnknown>\00", align 1
@func89_str1 = private unnamed_addr constant [5 x i8] c"Var \00", align 1
@func90_str1 = private unnamed_addr constant [2 x i8] c"*\00", align 1
@func90_str2 = private unnamed_addr constant [2 x i8] c"(\00", align 1
@func90_str3 = private unnamed_addr constant [2 x i8] c")\00", align 1
@func91_str1 = private unnamed_addr constant [2 x i8] c"(\00", align 1
@func91_func92_str1 = private unnamed_addr constant [3 x i8] c", \00", align 1
@func91_func92_str2 = private unnamed_addr constant [6 x i8] c"%s : \00", align 1
@func91_str2 = private unnamed_addr constant [2 x i8] c")\00", align 1
@func93_str1 = private unnamed_addr constant [2 x i8] c"{\00", align 1
@func93_func94_str1 = private unnamed_addr constant [7 x i8] c"<%%s> \00", align 1
@func93_str2 = private unnamed_addr constant [2 x i8] c"}\00", align 1
@func95_str1 = private unnamed_addr constant [5 x i8] c"[%d]\00", align 1
@func96_str1 = private unnamed_addr constant [3 x i8] c"[]\00", align 1
@func97_str1 = private unnamed_addr constant [5 x i8] c" -> \00", align 1
@func98_func99_str1 = private unnamed_addr constant [5 x i8] c" or \00", align 1
@cfgLibraryVar = private unnamed_addr constant [10 x i8] c"MINOR_LIB\00", align 1
@func121_str1 = private unnamed_addr constant [21 x i8] c"\0A%c[0;%dm%s:%c[0m %s\00", align 1
@func122_str1 = private unnamed_addr constant [30 x i8] c"\0A%c[0;%dm%s%c[0m (%s:%d) : %s\00", align 1
@func123_str1 = private unnamed_addr constant [5 x i8] c"info\00", align 1
@func123_str2 = private unnamed_addr constant [5 x i8] c"info\00", align 1
@func123_str3 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func124_str1 = private unnamed_addr constant [8 x i8] c"warning\00", align 1
@func124_str2 = private unnamed_addr constant [8 x i8] c"warning\00", align 1
@func124_str3 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func124_str4 = private unnamed_addr constant [14 x i8] c"*** STOP ***\0A\00", align 1
@func125_str1 = private unnamed_addr constant [6 x i8] c"error\00", align 1
@func125_str2 = private unnamed_addr constant [6 x i8] c"error\00", align 1
@func125_str3 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func125_str4 = private unnamed_addr constant [14 x i8] c"*** STOP ***\0A\00", align 1
@func126_str1 = private unnamed_addr constant [17 x i8] c"\0A%c[0;%dm%s%c[0m\00", align 1
@func126_str2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func127_str1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func127_str2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func128_str1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func128_str2 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@func128_str3 = private unnamed_addr constant [2 x i8] c" \00", align 1
@func128_str4 = private unnamed_addr constant [15 x i8] c"%c[0;%dm^%c[0m\00", align 1
@func129_str1 = private unnamed_addr constant [6 x i8] c"fatal\00", align 1
@func129_str2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func130_str1 = private unnamed_addr constant [11 x i8] c"type error\00", align 1
@func130_str2 = private unnamed_addr constant [16 x i8] c"type expected: \00", align 1
@func130_str3 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func130_str4 = private unnamed_addr constant [16 x i8] c"type received: \00", align 1
@func130_str5 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func131_str1 = private unnamed_addr constant [3 x i8] c"%u\00", align 1
@func132_str1 = private unnamed_addr constant [6 x i8] c".type\00", align 1
@func133_str1 = private unnamed_addr constant [2 x i8] c"_\00", align 1
@func133_str2 = private unnamed_addr constant [1 x i8] c"\00", align 1
@func135_str1 = private unnamed_addr constant [5 x i8] c"func\00", align 1
@func136_str1 = private unnamed_addr constant [4 x i8] c"str\00", align 1
@func136_str2 = private unnamed_addr constant [4 x i8] c"str\00", align 1
@func137_str1 = private unnamed_addr constant [4 x i8] c"arr\00", align 1
@func138_str1 = private unnamed_addr constant [4 x i8] c"var\00", align 1
@func139_str1 = private unnamed_addr constant [5 x i8] c"Type\00", align 1
@func147_str1 = private unnamed_addr constant [5 x i8] c"self\00", align 1
@func148_str1 = private unnamed_addr constant [5 x i8] c"Self\00", align 1
@func149_str1 = private unnamed_addr constant [9 x i8] c"typebind\00", align 1
@func149_str2 = private unnamed_addr constant [44 x i8] c"type bind error: attempt to id redefinition\00", align 1
@func149_str3 = private unnamed_addr constant [18 x i8] c"bind AE_type: %s\0A\00", align 1
@func150_str1 = private unnamed_addr constant [8 x i8] c"valbind\00", align 1
@func150_str2 = private unnamed_addr constant [35 x i8] c"value bind error: id already bound\00", align 1
@func150_str3 = private unnamed_addr constant [19 x i8] c"first defined here\00", align 1
@func151_str1 = private unnamed_addr constant [11 x i8] c"name error\00", align 1
@func152_str1 = private unnamed_addr constant [11 x i8] c"name error\00", align 1
@func153_str1 = private unnamed_addr constant [2 x i8] c"/\00", align 1
@func156_str1 = private unnamed_addr constant [11 x i8] c"module=%s\0A\00", align 1
@func156_str2 = private unnamed_addr constant [17 x i8] c"module not exist\00", align 1
@func158_str1 = private unnamed_addr constant [10 x i8] c"file: %s\0A\00", align 1
@func158_str2 = private unnamed_addr constant [23 x i8] c"unexpected end-of-file\00", align 1
@func158_str3 = private unnamed_addr constant [16 x i8] c"too long token\0A\00", align 1
@func159_str1 = private unnamed_addr constant [2 x i8] c" \00", align 1
@func159_str2 = private unnamed_addr constant [2 x i8] c"\09\00", align 1
@func160_str1 = private unnamed_addr constant [2 x i8] c">\00", align 1
@func161_str1 = private unnamed_addr constant [2 x i8] c"/\00", align 1
@func161_str2 = private unnamed_addr constant [2 x i8] c"*\00", align 1
@func162_str1 = private unnamed_addr constant [2 x i8] c">\00", align 1
@func162_str2 = private unnamed_addr constant [2 x i8] c"=\00", align 1
@func163_str1 = private unnamed_addr constant [2 x i8] c"<\00", align 1
@func163_str2 = private unnamed_addr constant [2 x i8] c"=\00", align 1
@func164_str1 = private unnamed_addr constant [2 x i8] c"=\00", align 1
@func164_str2 = private unnamed_addr constant [2 x i8] c">\00", align 1
@func165_str1 = private unnamed_addr constant [2 x i8] c"=\00", align 1
@func166_str1 = private unnamed_addr constant [2 x i8] c"=\00", align 1
@func167_str1 = private unnamed_addr constant [2 x i8] c"_\00", align 1
@func167_str2 = private unnamed_addr constant [2 x i8] c"-\00", align 1
@func169_str1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func172_str1 = private unnamed_addr constant [2 x i8] c"_\00", align 1
@func172_str2 = private unnamed_addr constant [2 x i8] c"#\00", align 1
@func172_str3 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func172_str4 = private unnamed_addr constant [2 x i8] c":\00", align 1
@func172_str5 = private unnamed_addr constant [2 x i8] c"=\00", align 1
@func172_str6 = private unnamed_addr constant [2 x i8] c"-\00", align 1
@func172_str7 = private unnamed_addr constant [2 x i8] c"/\00", align 1
@func172_str8 = private unnamed_addr constant [2 x i8] c">\00", align 1
@func172_str9 = private unnamed_addr constant [2 x i8] c"<\00", align 1
@func172_str10 = private unnamed_addr constant [2 x i8] c"!\00", align 1
@func172_str11 = private unnamed_addr constant [2 x i8] c"\22\00", align 1
@func174_str1 = private unnamed_addr constant [2 x i8] c"/\00", align 1
@func174_str2 = private unnamed_addr constant [2 x i8] c"*\00", align 1
@func174_str3 = private unnamed_addr constant [23 x i8] c"unexpected end-of-file\00", align 1
@func174_str4 = private unnamed_addr constant [2 x i8] c"*\00", align 1
@func174_str5 = private unnamed_addr constant [2 x i8] c"/\00", align 1
@func174_str6 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func175_str1 = private unnamed_addr constant [2 x i8] c"\22\00", align 1
@func175_str2 = private unnamed_addr constant [23 x i8] c"unexpected end-of-file\00", align 1
@func175_str3 = private unnamed_addr constant [2 x i8] c"\5C\00", align 1
@func175_str4 = private unnamed_addr constant [2 x i8] c"n\00", align 1
@func175_str5 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func175_str6 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@func175_str7 = private unnamed_addr constant [2 x i8] c"\0D\00", align 1
@func175_str8 = private unnamed_addr constant [2 x i8] c"t\00", align 1
@func175_str9 = private unnamed_addr constant [2 x i8] c"\09\00", align 1
@func175_str10 = private unnamed_addr constant [2 x i8] c"\5C\00", align 1
@func175_str11 = private unnamed_addr constant [2 x i8] c"\5C\00", align 1
@func175_str12 = private unnamed_addr constant [2 x i8] c"\22\00", align 1
@func175_str13 = private unnamed_addr constant [2 x i8] c"\22\00", align 1
@func175_str14 = private unnamed_addr constant [2 x i8] c"0\00", align 1
@func175_str15 = private unnamed_addr constant [1 x i8] c"\00", align 1
@func175_str16 = private unnamed_addr constant [2 x i8] c"a\00", align 1
@func175_str17 = private unnamed_addr constant [2 x i8] c"\07\00", align 1
@func175_str18 = private unnamed_addr constant [2 x i8] c"b\00", align 1
@func175_str19 = private unnamed_addr constant [2 x i8] c"\08\00", align 1
@func175_str20 = private unnamed_addr constant [2 x i8] c"v\00", align 1
@func175_str21 = private unnamed_addr constant [2 x i8] c"\0B\00", align 1
@func175_str22 = private unnamed_addr constant [17 x i8] c"too long string\0A\00", align 1
@func182_str1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func186_str1 = private unnamed_addr constant [19 x i8] c"expected separator\00", align 1
@func187_str1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func187_str2 = private unnamed_addr constant [2 x i8] c";\00", align 1
@func187_str3 = private unnamed_addr constant [2 x i8] c"}\00", align 1
@func187_str4 = private unnamed_addr constant [2 x i8] c")\00", align 1
@func188_str1 = private unnamed_addr constant [2 x i8] c",\00", align 1
@func188_str2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func188_str3 = private unnamed_addr constant [27 x i8] c"expected comma or new line\00", align 1
@func189_str1 = private unnamed_addr constant [29 x i8] c"lex::skipto not implemented\0A\00", align 1
@func189_str2 = private unnamed_addr constant [12 x i8] c"tok = '%s'\0A\00", align 1
@func189_str3 = private unnamed_addr constant [18 x i8] c"skip_target = %s\0A\00", align 1
@func192_str1 = private unnamed_addr constant [18 x i8] c"unexpected symbol\00", align 1
@func192_str2 = private unnamed_addr constant [13 x i8] c"expected %s\0A\00", align 1
@func193_str1 = private unnamed_addr constant [11 x i8] c"ast_id_new\00", align 1
@func194_str1 = private unnamed_addr constant [13 x i8] c"expected id1\00", align 1
@func195_str1 = private unnamed_addr constant [2 x i8] c".\00", align 1
@func196_str1 = private unnamed_addr constant [16 x i8] c"ast_node_boxing\00", align 1
@func197_str1 = private unnamed_addr constant [7 x i8] c"import\00", align 1
@func197_str2 = private unnamed_addr constant [8 x i8] c"arghack\00", align 1
@func197_str3 = private unnamed_addr constant [6 x i8] c"exist\00", align 1
@func197_str4 = private unnamed_addr constant [7 x i8] c"extern\00", align 1
@func199_str1 = private unnamed_addr constant [2 x i8] c"=\00", align 1
@func200_str1 = private unnamed_addr constant [2 x i8] c"=\00", align 1
@func201_str1 = private unnamed_addr constant [18 x i8] c"parse_type malloc\00", align 1
@func202_str1 = private unnamed_addr constant [3 x i8] c"->\00", align 1
@func203_str1 = private unnamed_addr constant [3 x i8] c"or\00", align 1
@func204_str1 = private unnamed_addr constant [2 x i8] c"*\00", align 1
@func204_str2 = private unnamed_addr constant [2 x i8] c"[\00", align 1
@func204_str3 = private unnamed_addr constant [2 x i8] c"]\00", align 1
@func204_str4 = private unnamed_addr constant [2 x i8] c"]\00", align 1
@func205_str1 = private unnamed_addr constant [2 x i8] c"(\00", align 1
@func205_str2 = private unnamed_addr constant [2 x i8] c")\00", align 1
@func205_str3 = private unnamed_addr constant [2 x i8] c")\00", align 1
@func206_str1 = private unnamed_addr constant [2 x i8] c"{\00", align 1
@func206_str2 = private unnamed_addr constant [8 x i8] c"NewType\00", align 1
@func206_str3 = private unnamed_addr constant [4 x i8] c"Var\00", align 1
@func207_str1 = private unnamed_addr constant [2 x i8] c",\00", align 1
@func207_str2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func207_str3 = private unnamed_addr constant [2 x i8] c"}\00", align 1
@func207_str4 = private unnamed_addr constant [37 x i8] c"expected comma or new-line separator\00", align 1
@func208_str1 = private unnamed_addr constant [2 x i8] c")\00", align 1
@func208_str2 = private unnamed_addr constant [14 x i8] c"dofield error\00", align 1
@func208_str3 = private unnamed_addr constant [2 x i8] c",\00", align 1
@func209_str1 = private unnamed_addr constant [2 x i8] c",\00", align 1
@func209_str2 = private unnamed_addr constant [2 x i8] c":\00", align 1
@func210_str1 = private unnamed_addr constant [26 x i8] c"ast_value_new malloc fail\00", align 1
@func211_str1 = private unnamed_addr constant [3 x i8] c"or\00", align 1
@func212_str1 = private unnamed_addr constant [4 x i8] c"xor\00", align 1
@func213_str1 = private unnamed_addr constant [4 x i8] c"and\00", align 1
@func214_str1 = private unnamed_addr constant [3 x i8] c"==\00", align 1
@func214_str2 = private unnamed_addr constant [3 x i8] c"!=\00", align 1
@func215_str1 = private unnamed_addr constant [2 x i8] c"<\00", align 1
@func215_str2 = private unnamed_addr constant [2 x i8] c">\00", align 1
@func215_str3 = private unnamed_addr constant [3 x i8] c"<=\00", align 1
@func215_str4 = private unnamed_addr constant [3 x i8] c">=\00", align 1
@func216_str1 = private unnamed_addr constant [3 x i8] c"<<\00", align 1
@func216_str2 = private unnamed_addr constant [3 x i8] c">>\00", align 1
@func217_str1 = private unnamed_addr constant [2 x i8] c"+\00", align 1
@func217_str2 = private unnamed_addr constant [2 x i8] c"-\00", align 1
@func218_str1 = private unnamed_addr constant [2 x i8] c"*\00", align 1
@func218_str2 = private unnamed_addr constant [2 x i8] c"/\00", align 1
@func218_str3 = private unnamed_addr constant [2 x i8] c"%\00", align 1
@func219_str1 = private unnamed_addr constant [3 x i8] c"to\00", align 1
@func219_str2 = private unnamed_addr constant [3 x i8] c"is\00", align 1
@func219_str3 = private unnamed_addr constant [5 x i8] c"isnt\00", align 1
@func219_str4 = private unnamed_addr constant [3 x i8] c"as\00", align 1
@func220_str1 = private unnamed_addr constant [2 x i8] c"*\00", align 1
@func220_str2 = private unnamed_addr constant [2 x i8] c"&\00", align 1
@func220_str3 = private unnamed_addr constant [4 x i8] c"not\00", align 1
@func220_str4 = private unnamed_addr constant [2 x i8] c"-\00", align 1
@func220_str5 = private unnamed_addr constant [2 x i8] c"+\00", align 1
@func220_str6 = private unnamed_addr constant [7 x i8] c"sizeof\00", align 1
@func220_str7 = private unnamed_addr constant [23 x i8] c"sizeof expected <type>\00", align 1
@func220_str8 = private unnamed_addr constant [8 x i8] c"alignof\00", align 1
@func220_str9 = private unnamed_addr constant [24 x i8] c"alignof expected <type>\00", align 1
@func221_str1 = private unnamed_addr constant [2 x i8] c"(\00", align 1
@func221_str2 = private unnamed_addr constant [2 x i8] c")\00", align 1
@func221_str3 = private unnamed_addr constant [3 x i8] c",)\00", align 1
@func221_str4 = private unnamed_addr constant [2 x i8] c",\00", align 1
@func221_str5 = private unnamed_addr constant [2 x i8] c")\00", align 1
@func221_str6 = private unnamed_addr constant [2 x i8] c")\00", align 1
@func221_str7 = private unnamed_addr constant [2 x i8] c",\00", align 1
@func221_str8 = private unnamed_addr constant [2 x i8] c"[\00", align 1
@func221_str9 = private unnamed_addr constant [2 x i8] c"]\00", align 1
@func221_str10 = private unnamed_addr constant [2 x i8] c".\00", align 1
@func222_str1 = private unnamed_addr constant [2 x i8] c"(\00", align 1
@func222_str2 = private unnamed_addr constant [2 x i8] c")\00", align 1
@func223_func224_str1 = private unnamed_addr constant [2 x i8] c"@\00", align 1
@func223_func224_str2 = private unnamed_addr constant [19 x i8] c"unexpected symbol\0A\00", align 1
@func223_func224_str3 = private unnamed_addr constant [9 x i8] c"bad term\00", align 1
@func223_func225_str1 = private unnamed_addr constant [19 x i8] c"unexpected symbol\0A\00", align 1
@func223_func225_str2 = private unnamed_addr constant [14 x i8] c"received: %s\0A\00", align 1
@func223_func225_str3 = private unnamed_addr constant [9 x i8] c"bad term\00", align 1
@func226_str1 = private unnamed_addr constant [7 x i8] c"extern\00", align 1
@func226_str2 = private unnamed_addr constant [5 x i8] c"when\00", align 1
@func227_str1 = private unnamed_addr constant [2 x i8] c"{\00", align 1
@func227_str2 = private unnamed_addr constant [2 x i8] c"}\00", align 1
@func227_str3 = private unnamed_addr constant [5 x i8] c"else\00", align 1
@func227_str4 = private unnamed_addr constant [3 x i8] c"=>\00", align 1
@func227_str5 = private unnamed_addr constant [3 x i8] c"=>\00", align 1
@func229_str1 = private unnamed_addr constant [2 x i8] c"=\00", align 1
@func229_str2 = private unnamed_addr constant [2 x i8] c")\00", align 1
@func229_str3 = private unnamed_addr constant [2 x i8] c",\00", align 1
@func230_str1 = private unnamed_addr constant [2 x i8] c"[\00", align 1
@func230_str2 = private unnamed_addr constant [2 x i8] c"]\00", align 1
@func230_str3 = private unnamed_addr constant [2 x i8] c",\00", align 1
@func231_str1 = private unnamed_addr constant [2 x i8] c"{\00", align 1
@func234_str1 = private unnamed_addr constant [23 x i8] c"ast_stmt_boxing malloc\00", align 1
@func237_str1 = private unnamed_addr constant [2 x i8] c"=\00", align 1
@func237_func238_str1 = private unnamed_addr constant [2 x i8] c":\00", align 1
@func237_str2 = private unnamed_addr constant [2 x i8] c"{\00", align 1
@func237_str3 = private unnamed_addr constant [3 x i8] c"if\00", align 1
@func237_str4 = private unnamed_addr constant [6 x i8] c"while\00", align 1
@func237_str5 = private unnamed_addr constant [7 x i8] c"return\00", align 1
@func237_str6 = private unnamed_addr constant [6 x i8] c"break\00", align 1
@func237_str7 = private unnamed_addr constant [6 x i8] c"again\00", align 1
@func237_str8 = private unnamed_addr constant [5 x i8] c"goto\00", align 1
@func239_str1 = private unnamed_addr constant [3 x i8] c":=\00", align 1
@func240_str1 = private unnamed_addr constant [2 x i8] c"=\00", align 1
@func241_str1 = private unnamed_addr constant [2 x i8] c"=\00", align 1
@func242_str1 = private unnamed_addr constant [2 x i8] c"}\00", align 1
@func242_str2 = private unnamed_addr constant [23 x i8] c"unexpected end-of-file\00", align 1
@func242_str3 = private unnamed_addr constant [2 x i8] c"}\00", align 1
@func243_str1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func243_str2 = private unnamed_addr constant [2 x i8] c"{\00", align 1
@func243_str3 = private unnamed_addr constant [5 x i8] c"else\00", align 1
@func243_str4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func243_str5 = private unnamed_addr constant [3 x i8] c"if\00", align 1
@func243_str6 = private unnamed_addr constant [2 x i8] c"{\00", align 1
@func244_str1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func244_str2 = private unnamed_addr constant [2 x i8] c"{\00", align 1
@func245_str1 = private unnamed_addr constant [27 x i8] c"expected return expression\00", align 1
@func248_str1 = private unnamed_addr constant [2 x i8] c",\00", align 1
@func248_str2 = private unnamed_addr constant [2 x i8] c":\00", align 1
@func249_str1 = private unnamed_addr constant [2 x i8] c")\00", align 1
@func250_str1 = private unnamed_addr constant [2 x i8] c"(\00", align 1
@func250_str2 = private unnamed_addr constant [2 x i8] c"[\00", align 1
@func250_str3 = private unnamed_addr constant [2 x i8] c"{\00", align 1
@func250_str4 = private unnamed_addr constant [2 x i8] c"*\00", align 1
@func252_str1 = private unnamed_addr constant [2 x i8] c")\00", align 1
@func252_str2 = private unnamed_addr constant [2 x i8] c"=\00", align 1
@func253_func254_str1 = private unnamed_addr constant [38 x i8] c"e-m:o-i64:64-f80:128-n8:16:32:64-S128\00", align 1
@func253_func254_str2 = private unnamed_addr constant [27 x i8] c"x86_64-apple-macosx10.15.0\00", align 1
@func253_func255_str1 = private unnamed_addr constant [48 x i8] c"e-m:e-p:32:32-i64:64-v128:64:128-a:0:32-n32-S64\00", align 1
@func253_func255_str2 = private unnamed_addr constant [28 x i8] c"thumbv7em-unknown-none-eabi\00", align 1
@func253_func256_str1 = private unnamed_addr constant [1 x i8] c"\00", align 1
@func253_func256_str2 = private unnamed_addr constant [1 x i8] c"\00", align 1
@func257_str1 = private unnamed_addr constant [36 x i8] c"assembly::definition_new : x != nil\00", align 1
@func264_str1 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@func265_str1 = private unnamed_addr constant [4 x i8] c"\0A%s\00", align 1
@func266_str1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func267_str1 = private unnamed_addr constant [2 x i8] c" \00", align 1
@func268_str1 = private unnamed_addr constant [3 x i8] c", \00", align 1
@func271_str1 = private unnamed_addr constant [20 x i8] c"print_assembly: %s\0A\00", align 1
@func271_str2 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@func271_str3 = private unnamed_addr constant [26 x i8] c"cannot create output file\00", align 1
@func271_str4 = private unnamed_addr constant [16 x i8] c"; assembly: %s\0A\00", align 1
@func271_str5 = private unnamed_addr constant [27 x i8] c"; clang out2.ll && ./a.out\00", align 1
@func271_str6 = private unnamed_addr constant [44 x i8] c"; llc out2.ll ; for create .s file from .ll\00", align 1
@func271_str7 = private unnamed_addr constant [26 x i8] c"target datalayout = \22%s\22\0A\00", align 1
@func271_str8 = private unnamed_addr constant [22 x i8] c"target triple = \22%s\22\0A\00", align 1
@func271_str9 = private unnamed_addr constant [16 x i8] c"%Bool = type i1\00", align 1
@func271_str10 = private unnamed_addr constant [16 x i8] c"%Unit = type i1\00", align 1
@func271_str11 = private unnamed_addr constant [16 x i8] c"%Str = type i8*\00", align 1
@func271_str12 = private unnamed_addr constant [20 x i8] c"%Numeric = type i64\00", align 1
@func271_func272_str1 = private unnamed_addr constant [17 x i8] c"\0A%%%s = type i%d\00", align 1
@func271_str13 = private unnamed_addr constant [12 x i8] c"\0A; aliases:\00", align 1
@func271_func273_str1 = private unnamed_addr constant [14 x i8] c"\0A%%%s = type \00", align 1
@func271_func273_str2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func271_func273_str3 = private unnamed_addr constant [30 x i8] c"\0A%%%s = type {i16, [%d x i8]}\00", align 1
@func271_func273_str4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func271_str14 = private unnamed_addr constant [11 x i8] c"\0A\0A;types:\0A\00", align 1
@func271_str15 = private unnamed_addr constant [13 x i8] c"\0A\0A;strings:\0A\00", align 1
@func271_str16 = private unnamed_addr constant [12 x i8] c"\0A\0A;arrays:\0A\00", align 1
@func271_str17 = private unnamed_addr constant [10 x i8] c"\0A\0A;vars:\0A\00", align 1
@func271_str18 = private unnamed_addr constant [11 x i8] c"\0A\0A;funcs:\0A\00", align 1
@func271_str19 = private unnamed_addr constant [13 x i8] c"\0A\0A;aliases:\0A\00", align 1
@func271_str20 = private unnamed_addr constant [14 x i8] c"\0A\0A;metadata:\0A\00", align 1
@func280_str1 = private unnamed_addr constant [14 x i8] c"\0A%%%s = type \00", align 1
@func281_str1 = private unnamed_addr constant [38 x i8] c"\0A@%s = private unnamed_addr constant \00", align 1
@func281_str2 = private unnamed_addr constant [3 x i8] c" [\00", align 1
@func281_str3 = private unnamed_addr constant [12 x i8] c"], align 16\00", align 1
@func283_str1 = private unnamed_addr constant [50 x i8] c"\0A@%s = private unnamed_addr constant [%d x i8] c\22\00", align 1
@func283_str2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func283_str3 = private unnamed_addr constant [2 x i8] c"\0D\00", align 1
@func283_str4 = private unnamed_addr constant [2 x i8] c"\09\00", align 1
@func283_str5 = private unnamed_addr constant [2 x i8] c"\0B\00", align 1
@func283_str6 = private unnamed_addr constant [2 x i8] c"\07\00", align 1
@func283_str7 = private unnamed_addr constant [2 x i8] c"\08\00", align 1
@func283_str8 = private unnamed_addr constant [2 x i8] c"\5C\00", align 1
@func283_str9 = private unnamed_addr constant [2 x i8] c"\22\00", align 1
@func283_str10 = private unnamed_addr constant [6 x i8] c"\5C%02X\00", align 1
@func283_str11 = private unnamed_addr constant [3 x i8] c"%c\00", align 1
@func283_str12 = private unnamed_addr constant [14 x i8] c"\5C00\22, align 1\00", align 1
@func284_str1 = private unnamed_addr constant [15 x i8] c"\0A@%s = global \00", align 1
@func284_str2 = private unnamed_addr constant [16 x i8] c"zeroinitializer\00", align 1
@func284_str3 = private unnamed_addr constant [6 x i8] c"UUU!\0A\00", align 1
@func284_str4 = private unnamed_addr constant [16 x i8] c"zeroinitializer\00", align 1
@func284_str5 = private unnamed_addr constant [2 x i8] c"{\00", align 1
@func284_func285_str1 = private unnamed_addr constant [3 x i8] c", \00", align 1
@func284_str6 = private unnamed_addr constant [2 x i8] c"}\00", align 1
@func284_str7 = private unnamed_addr constant [29 x i8] c"expected constant init value\00", align 1
@func284_str8 = private unnamed_addr constant [16 x i8] c"zeroinitializer\00", align 1
@func284_str9 = private unnamed_addr constant [4 x i8] c"; 1\00", align 1
@func286_str1 = private unnamed_addr constant [20 x i8] c"prn/funcdef t = nil\00", align 1
@func286_str2 = private unnamed_addr constant [9 x i8] c"\0Adeclare\00", align 1
@func286_str3 = private unnamed_addr constant [9 x i8] c"\0A\0Adefine\00", align 1
@func286_str4 = private unnamed_addr constant [5 x i8] c"void\00", align 1
@func286_str5 = private unnamed_addr constant [7 x i8] c" @%s (\00", align 1
@func286_str6 = private unnamed_addr constant [6 x i8] c", ...\00", align 1
@func286_str7 = private unnamed_addr constant [2 x i8] c")\00", align 1
@func286_str8 = private unnamed_addr constant [3 x i8] c" {\00", align 1
@func286_str9 = private unnamed_addr constant [12 x i8] c"\0A  ret void\00", align 1
@func286_str10 = private unnamed_addr constant [3 x i8] c"\0A}\00", align 1
@func288_str1 = private unnamed_addr constant [14 x i8] c"\0A@%s = alias \00", align 1
@func288_str2 = private unnamed_addr constant [6 x i8] c"* @%s\00", align 1
@func289_str1 = private unnamed_addr constant [14 x i8] c"\0A  %%%d = %s \00", align 1
@func290_str1 = private unnamed_addr constant [23 x i8] c"getelementptr inbounds\00", align 1
@func290_str2 = private unnamed_addr constant [3 x i8] c"* \00", align 1
@func291_str1 = private unnamed_addr constant [13 x i8] c"extractvalue\00", align 1
@func291_str2 = private unnamed_addr constant [5 x i8] c", %u\00", align 1
@func294_func295_str1 = private unnamed_addr constant [17 x i8] c"<undef-def-kind>\00", align 1
@func296_func297_str1 = private unnamed_addr constant [28 x i8] c"error eval #ValueUndefined\0A\00", align 1
@func305_str1 = private unnamed_addr constant [4 x i8] c"\0A  \00", align 1
@func305_str2 = private unnamed_addr constant [8 x i8] c"%%%d = \00", align 1
@func305_str3 = private unnamed_addr constant [6 x i8] c"call \00", align 1
@func305_str4 = private unnamed_addr constant [3 x i8] c" (\00", align 1
@func305_str5 = private unnamed_addr constant [2 x i8] c")\00", align 1
@func307_str1 = private unnamed_addr constant [21 x i8] c"\0A; eval index uarray\00", align 1
@func308_func309_str1 = private unnamed_addr constant [15 x i8] c"\0A; index array\00", align 1
@func308_func309_str2 = private unnamed_addr constant [7 x i8] c"i1 0, \00", align 1
@func310_str1 = private unnamed_addr constant [29 x i8] c"print/expr:: x.field == nil\0A\00", align 1
@func310_str2 = private unnamed_addr constant [13 x i8] c"i1 0, i32 %u\00", align 1
@func311_str1 = private unnamed_addr constant [5 x i8] c"i1 0\00", align 1
@func313_str1 = private unnamed_addr constant [4 x i8] c"xor\00", align 1
@func313_str2 = private unnamed_addr constant [4 x i8] c", 1\00", align 1
@func313_str3 = private unnamed_addr constant [5 x i8] c", -1\00", align 1
@func314_str1 = private unnamed_addr constant [8 x i8] c"sub nsw\00", align 1
@func316_str1 = private unnamed_addr constant [5 x i8] c" to \00", align 1
@func317_str1 = private unnamed_addr constant [9 x i8] c"inttoptr\00", align 1
@func317_str2 = private unnamed_addr constant [8 x i8] c"bitcast\00", align 1
@func318_str1 = private unnamed_addr constant [6 x i8] c"trunc\00", align 1
@func319_str1 = private unnamed_addr constant [6 x i8] c"trunc\00", align 1
@func319_func320_str1 = private unnamed_addr constant [5 x i8] c"sext\00", align 1
@func319_func320_str2 = private unnamed_addr constant [5 x i8] c"zext\00", align 1
@func319_str2 = private unnamed_addr constant [8 x i8] c"bitcast\00", align 1
@func321_str1 = private unnamed_addr constant [6 x i8] c"trunc\00", align 1
@func321_str2 = private unnamed_addr constant [5 x i8] c"zext\00", align 1
@func321_str3 = private unnamed_addr constant [8 x i8] c"bitcast\00", align 1
@func322_str1 = private unnamed_addr constant [9 x i8] c"ptrtoint\00", align 1
@func322_str2 = private unnamed_addr constant [5 x i8] c"zext\00", align 1
@func322_str3 = private unnamed_addr constant [8 x i8] c"bitcast\00", align 1
@func322_str4 = private unnamed_addr constant [8 x i8] c"bitcast\00", align 1
@func322_str5 = private unnamed_addr constant [8 x i8] c"bitcast\00", align 1
@func322_func323_str1 = private unnamed_addr constant [26 x i8] c"\0A<invalid k = %d in cast>\00", align 1
@func322_func323_str2 = private unnamed_addr constant [6 x i8] c"cast \00", align 1
@func322_func323_str3 = private unnamed_addr constant [5 x i8] c" to \00", align 1
@func322_func323_str4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func322_func323_str5 = private unnamed_addr constant [19 x i8] c"eval_cast_to_basic\00", align 1
@func324_str1 = private unnamed_addr constant [8 x i8] c"bitcast\00", align 1
@func325_str1 = private unnamed_addr constant [9 x i8] c"ptrtoint\00", align 1
@func325_str2 = private unnamed_addr constant [8 x i8] c"icmp ne\00", align 1
@func325_str3 = private unnamed_addr constant [8 x i8] c"icmp eq\00", align 1
@func325_str4 = private unnamed_addr constant [31 x i8] c"eval_is :: union is not in reg\00", align 1
@func325_str5 = private unnamed_addr constant [29 x i8] c"\0A  %%%d = extractvalue %%%s \00", align 1
@func325_str6 = private unnamed_addr constant [4 x i8] c", 0\00", align 1
@func325_str7 = private unnamed_addr constant [8 x i8] c"icmp eq\00", align 1
@func325_str8 = private unnamed_addr constant [8 x i8] c"icmp ne\00", align 1
@func326_str1 = private unnamed_addr constant [7 x i8] c"alloca\00", align 1
@func326_str2 = private unnamed_addr constant [20 x i8] c"\0A; write variant %d\00", align 1
@func326_str3 = private unnamed_addr constant [12 x i8] c"i1 0, i32 0\00", align 1
@func326_str4 = private unnamed_addr constant [13 x i8] c"; write data\00", align 1
@func326_str5 = private unnamed_addr constant [12 x i8] c"i1 0, i32 1\00", align 1
@func326_str6 = private unnamed_addr constant [8 x i8] c"bitcast\00", align 1
@func326_str7 = private unnamed_addr constant [9 x i8] c"inttoptr\00", align 1
@func326_str8 = private unnamed_addr constant [9 x i8] c"inttoptr\00", align 1
@func326_str9 = private unnamed_addr constant [8 x i8] c"bitcast\00", align 1
@func327_str1 = private unnamed_addr constant [7 x i8] c"alloca\00", align 1
@func327_str2 = private unnamed_addr constant [12 x i8] c"i1 0, i32 1\00", align 1
@func327_str3 = private unnamed_addr constant [8 x i8] c"bitcast\00", align 1
@func327_str4 = private unnamed_addr constant [5 x i8] c"load\00", align 1
@func327_str5 = private unnamed_addr constant [3 x i8] c"* \00", align 1
@func328_str1 = private unnamed_addr constant [11 x i8] c"CAST VAR!\0A\00", align 1
@func328_func329_str1 = private unnamed_addr constant [18 x i8] c"eval_cast error:\0A\00", align 1
@func328_func329_str2 = private unnamed_addr constant [6 x i8] c" --> \00", align 1
@func328_func329_str3 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func328_func329_str4 = private unnamed_addr constant [16 x i8] c"eval_cast error\00", align 1
@func332_str1 = private unnamed_addr constant [4 x i8] c"add\00", align 1
@func333_str1 = private unnamed_addr constant [4 x i8] c"sub\00", align 1
@func334_str1 = private unnamed_addr constant [4 x i8] c"mul\00", align 1
@func335_str1 = private unnamed_addr constant [5 x i8] c"sdiv\00", align 1
@func335_str2 = private unnamed_addr constant [5 x i8] c"udiv\00", align 1
@func336_str1 = private unnamed_addr constant [5 x i8] c"srem\00", align 1
@func336_str2 = private unnamed_addr constant [5 x i8] c"urem\00", align 1
@func337_str1 = private unnamed_addr constant [3 x i8] c"or\00", align 1
@func338_str1 = private unnamed_addr constant [4 x i8] c"xor\00", align 1
@func339_str1 = private unnamed_addr constant [4 x i8] c"and\00", align 1
@func340_str1 = private unnamed_addr constant [8 x i8] c"icmp eq\00", align 1
@func341_str1 = private unnamed_addr constant [8 x i8] c"icmp ne\00", align 1
@func342_str1 = private unnamed_addr constant [9 x i8] c"icmp slt\00", align 1
@func342_str2 = private unnamed_addr constant [9 x i8] c"icmp ult\00", align 1
@func343_str1 = private unnamed_addr constant [9 x i8] c"icmp sgt\00", align 1
@func343_str2 = private unnamed_addr constant [9 x i8] c"icmp ugt\00", align 1
@func344_str1 = private unnamed_addr constant [9 x i8] c"icmp sle\00", align 1
@func344_str2 = private unnamed_addr constant [9 x i8] c"icmp ule\00", align 1
@func345_str1 = private unnamed_addr constant [9 x i8] c"icmp sge\00", align 1
@func345_str2 = private unnamed_addr constant [9 x i8] c"icmp uge\00", align 1
@func346_str1 = private unnamed_addr constant [4 x i8] c"shl\00", align 1
@func347_str1 = private unnamed_addr constant [5 x i8] c"ashr\00", align 1
@func347_str2 = private unnamed_addr constant [5 x i8] c"lshr\00", align 1
@func348_str1 = private unnamed_addr constant [8 x i8] c"bitcast\00", align 1
@func349_str1 = private unnamed_addr constant [13 x i8] c"; loadImmPtr\00", align 1
@func349_str2 = private unnamed_addr constant [29 x i8] c"\0A  %%%d = inttoptr i64 %d to\00", align 1
@func350_str1 = private unnamed_addr constant [8 x i8] c"bitcast\00", align 1
@func351_str1 = private unnamed_addr constant [29 x i8] c"\0A  %%%d = extractvalue %%%s \00", align 1
@func351_str2 = private unnamed_addr constant [4 x i8] c", 0\00", align 1
@func351_str3 = private unnamed_addr constant [26 x i8] c"\0A  br label %%select_%d_0\00", align 1
@func351_func352_str1 = private unnamed_addr constant [15 x i8] c"\0Aselect_%d_%d:\00", align 1
@func351_func352_str2 = private unnamed_addr constant [8 x i8] c"icmp eq\00", align 1
@func351_func352_str3 = private unnamed_addr constant [14 x i8] c"\0A  br i1 %%%d\00", align 1
@func351_func352_str4 = private unnamed_addr constant [8 x i8] c"icmp eq\00", align 1
@func351_func352_str5 = private unnamed_addr constant [14 x i8] c"\0A  br i1 %%%d\00", align 1
@func351_func352_str6 = private unnamed_addr constant [48 x i8] c", label %%select_%d_%d_ok, label %%select_%d_%d\00", align 1
@func351_func352_str7 = private unnamed_addr constant [18 x i8] c"\0Aselect_%d_%d_ok:\00", align 1
@func351_func352_str8 = private unnamed_addr constant [28 x i8] c"\0A  br label %%select_%d_end\00", align 1
@func351_str4 = private unnamed_addr constant [15 x i8] c"\0Aselect_%d_%d:\00", align 1
@func351_str5 = private unnamed_addr constant [28 x i8] c"\0A  br label %%select_%d_end\00", align 1
@func351_str6 = private unnamed_addr constant [16 x i8] c"\0Aselect_%d_end:\00", align 1
@func351_str7 = private unnamed_addr constant [4 x i8] c"phi\00", align 1
@func351_str8 = private unnamed_addr constant [30 x i8] c"[ %%%d, %%select_%d_%d_ok ], \00", align 1
@func351_str9 = private unnamed_addr constant [25 x i8] c"[ %%%d, %%select_%d_%d ]\00", align 1
@func353_func354_str1 = private unnamed_addr constant [12 x i8] c"insertvalue\00", align 1
@func353_func354_str2 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@func355_func356_str1 = private unnamed_addr constant [12 x i8] c"insertvalue\00", align 1
@func355_func356_str2 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@func358_str1 = private unnamed_addr constant [10 x i8] c"\0A  store \00", align 1
@func358_str2 = private unnamed_addr constant [3 x i8] c"* \00", align 1
@func358_str3 = private unnamed_addr constant [11 x i8] c", align %d\00", align 1
@func359_str1 = private unnamed_addr constant [5 x i8] c"load\00", align 1
@func359_str2 = private unnamed_addr constant [3 x i8] c"* \00", align 1
@func360_str1 = private unnamed_addr constant [16 x i8] c"zeroinitializer\00", align 1
@func360_str2 = private unnamed_addr constant [16 x i8] c"zeroinitializer\00", align 1
@func360_str3 = private unnamed_addr constant [5 x i8] c"%llu\00", align 1
@func361_str1 = private unnamed_addr constant [5 x i8] c"%%%d\00", align 1
@func361_str2 = private unnamed_addr constant [5 x i8] c"%%%d\00", align 1
@func361_str3 = private unnamed_addr constant [4 x i8] c"@%s\00", align 1
@func361_str4 = private unnamed_addr constant [4 x i8] c"@%s\00", align 1
@func361_str5 = private unnamed_addr constant [5 x i8] c"%%%d\00", align 1
@func361_str6 = private unnamed_addr constant [16 x i8] c"zeroinitializer\00", align 1
@func361_str7 = private unnamed_addr constant [6 x i8] c"undef\00", align 1
@func361_str8 = private unnamed_addr constant [32 x i8] c"<LLVM_ValueInvalid x.kind = %d>\00", align 1
@func363_str1 = private unnamed_addr constant [12 x i8] c"insertvalue\00", align 1
@func363_str2 = private unnamed_addr constant [9 x i8] c" undef, \00", align 1
@func364_str1 = private unnamed_addr constant [22 x i8] c"<print::stmt_unknown>\00", align 1
@func366_str1 = private unnamed_addr constant [7 x i8] c"alloca\00", align 1
@func369_str1 = private unnamed_addr constant [10 x i8] c"\0A  br i1 \00", align 1
@func369_str2 = private unnamed_addr constant [35 x i8] c", label %%then_%d, label %%else_%d\00", align 1
@func369_str3 = private unnamed_addr constant [10 x i8] c"\0Athen_%d:\00", align 1
@func369_str4 = private unnamed_addr constant [23 x i8] c"\0A  br label %%endif_%d\00", align 1
@func369_str5 = private unnamed_addr constant [10 x i8] c"\0Aelse_%d:\00", align 1
@func369_str6 = private unnamed_addr constant [23 x i8] c"\0A  br label %%endif_%d\00", align 1
@func369_str7 = private unnamed_addr constant [11 x i8] c"\0Aendif_%d:\00", align 1
@func370_str1 = private unnamed_addr constant [23 x i8] c"\0A  br label %%again_%d\00", align 1
@func370_str2 = private unnamed_addr constant [11 x i8] c"\0Aagain_%d:\00", align 1
@func370_str3 = private unnamed_addr constant [10 x i8] c"\0A  br i1 \00", align 1
@func370_str4 = private unnamed_addr constant [36 x i8] c", label %%body_%d, label %%break_%d\00", align 1
@func370_str5 = private unnamed_addr constant [10 x i8] c"\0Abody_%d:\00", align 1
@func370_str6 = private unnamed_addr constant [23 x i8] c"\0A  br label %%again_%d\00", align 1
@func370_str7 = private unnamed_addr constant [11 x i8] c"\0Abreak_%d:\00", align 1
@func371_str1 = private unnamed_addr constant [10 x i8] c"\0Aret void\00", align 1
@func371_str2 = private unnamed_addr constant [8 x i8] c"\0A  ret \00", align 1
@func372_str1 = private unnamed_addr constant [23 x i8] c"\0A  br label %%break_%d\00", align 1
@func373_str1 = private unnamed_addr constant [23 x i8] c"\0A  br label %%again_%d\00", align 1
@func374_str1 = private unnamed_addr constant [17 x i8] c"\0A  br label %%%s\00", align 1
@func375_str1 = private unnamed_addr constant [17 x i8] c"\0A  br label %%%s\00", align 1
@func375_str2 = private unnamed_addr constant [5 x i8] c"\0A%s:\00", align 1
@func378_str1 = private unnamed_addr constant [26 x i8] c"prn/printType :: t = nil\0A\00", align 1
@func378_str2 = private unnamed_addr constant [5 x i8] c"%%%s\00", align 1
@func378_str3 = private unnamed_addr constant [5 x i8] c"%%%s\00", align 1
@func378_str4 = private unnamed_addr constant [4 x i8] c"i%d\00", align 1
@func378_str5 = private unnamed_addr constant [3 x i8] c"i1\00", align 1
@func378_str6 = private unnamed_addr constant [5 x i8] c"%%%s\00", align 1
@func378_str7 = private unnamed_addr constant [5 x i8] c"%%%s\00", align 1
@func378_func380_str1 = private unnamed_addr constant [20 x i8] c"<type-unknown-kind>\00", align 1
@func378_func380_str2 = private unnamed_addr constant [18 x i8] c"unk type kind %d\0A\00", align 1
@func382_str1 = private unnamed_addr constant [2 x i8] c"{\00", align 1
@func382_str2 = private unnamed_addr constant [2 x i8] c"}\00", align 1
@func384_str1 = private unnamed_addr constant [7 x i8] c"[%d x \00", align 1
@func384_str2 = private unnamed_addr constant [2 x i8] c"]\00", align 1
@func385_str1 = private unnamed_addr constant [2 x i8] c"*\00", align 1
@func386_str1 = private unnamed_addr constant [2 x i8] c"*\00", align 1
@func387_str1 = private unnamed_addr constant [5 x i8] c"void\00", align 1
@func387_str2 = private unnamed_addr constant [3 x i8] c" (\00", align 1
@func387_str3 = private unnamed_addr constant [6 x i8] c", ...\00", align 1
@func387_str4 = private unnamed_addr constant [2 x i8] c")\00", align 1
@func387_str5 = private unnamed_addr constant [2 x i8] c"*\00", align 1
@func389_str1 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@func389_str2 = private unnamed_addr constant [7 x i8] c"union.\00", align 1
@func390_str1 = private unnamed_addr constant [20 x i8] c"alignment : align=0\00", align 1
@func393_str1 = private unnamed_addr constant [9 x i8] c"type_new\00", align 1
@func413_func414_str1 = private unnamed_addr constant [18 x i8] c"unknown type kind\00", align 1
@func430_str1 = private unnamed_addr constant [22 x i8] c"type_record_field_new\00", align 1
@func431_func432_str1 = private unnamed_addr constant [14 x i8] c"unknown type3\00", align 1
@func431_func434_str1 = private unnamed_addr constant [16 x i8] c"undefined type3\00", align 1
@func431_func434_str2 = private unnamed_addr constant [11 x i8] c"align 0 in\00", align 1
@func447_str1 = private unnamed_addr constant [5 x i8] c"Void\00", align 1
@func447_str2 = private unnamed_addr constant [5 x i8] c"Void\00", align 1
@func447_str3 = private unnamed_addr constant [5 x i8] c"Unit\00", align 1
@func447_str4 = private unnamed_addr constant [5 x i8] c"Unit\00", align 1
@func447_str5 = private unnamed_addr constant [5 x i8] c"Bool\00", align 1
@func447_str6 = private unnamed_addr constant [5 x i8] c"Int8\00", align 1
@func447_str7 = private unnamed_addr constant [6 x i8] c"Int16\00", align 1
@func447_str8 = private unnamed_addr constant [6 x i8] c"Int32\00", align 1
@func447_str9 = private unnamed_addr constant [6 x i8] c"Int64\00", align 1
@func447_str10 = private unnamed_addr constant [7 x i8] c"Int128\00", align 1
@func447_str11 = private unnamed_addr constant [7 x i8] c"Int256\00", align 1
@func447_str12 = private unnamed_addr constant [7 x i8] c"Int512\00", align 1
@func447_str13 = private unnamed_addr constant [8 x i8] c"Int1024\00", align 1
@func447_str14 = private unnamed_addr constant [5 x i8] c"Nat8\00", align 1
@func447_str15 = private unnamed_addr constant [6 x i8] c"Nat16\00", align 1
@func447_str16 = private unnamed_addr constant [6 x i8] c"Nat32\00", align 1
@func447_str17 = private unnamed_addr constant [6 x i8] c"Nat64\00", align 1
@func447_str18 = private unnamed_addr constant [7 x i8] c"Nat128\00", align 1
@func447_str19 = private unnamed_addr constant [7 x i8] c"Nat256\00", align 1
@func447_str20 = private unnamed_addr constant [7 x i8] c"Nat512\00", align 1
@func447_str21 = private unnamed_addr constant [8 x i8] c"Nat1024\00", align 1
@func447_str22 = private unnamed_addr constant [6 x i8] c"Int64\00", align 1
@func447_str23 = private unnamed_addr constant [6 x i8] c"Nat64\00", align 1
@func447_str24 = private unnamed_addr constant [6 x i8] c"Int32\00", align 1
@func447_str25 = private unnamed_addr constant [6 x i8] c"Nat32\00", align 1
@func447_str26 = private unnamed_addr constant [5 x i8] c"Int8\00", align 1
@func447_str27 = private unnamed_addr constant [5 x i8] c"Nat8\00", align 1
@func447_str28 = private unnamed_addr constant [6 x i8] c"Int16\00", align 1
@func447_str29 = private unnamed_addr constant [6 x i8] c"Nat16\00", align 1
@func447_str30 = private unnamed_addr constant [4 x i8] c"Str\00", align 1
@func447_str31 = private unnamed_addr constant [4 x i8] c"Str\00", align 1
@func447_str32 = private unnamed_addr constant [7 x i8] c"Int128\00", align 1
@func447_str33 = private unnamed_addr constant [7 x i8] c"Int256\00", align 1
@func447_str34 = private unnamed_addr constant [7 x i8] c"Int512\00", align 1
@func447_str35 = private unnamed_addr constant [8 x i8] c"Int1024\00", align 1
@func447_str36 = private unnamed_addr constant [7 x i8] c"Nat128\00", align 1
@func447_str37 = private unnamed_addr constant [7 x i8] c"Nat256\00", align 1
@func447_str38 = private unnamed_addr constant [7 x i8] c"Nat512\00", align 1
@func447_str39 = private unnamed_addr constant [8 x i8] c"Nat1024\00", align 1
@func447_str40 = private unnamed_addr constant [8 x i8] c"Numeric\00", align 1
@func449_str1 = private unnamed_addr constant [5 x i8] c"Int8\00", align 1
@func449_str2 = private unnamed_addr constant [6 x i8] c"Int16\00", align 1
@func449_str3 = private unnamed_addr constant [6 x i8] c"Int32\00", align 1
@func449_str4 = private unnamed_addr constant [6 x i8] c"Int64\00", align 1
@func449_str5 = private unnamed_addr constant [7 x i8] c"Int128\00", align 1
@func449_str6 = private unnamed_addr constant [7 x i8] c"Int256\00", align 1
@func449_str7 = private unnamed_addr constant [7 x i8] c"Int512\00", align 1
@func449_str8 = private unnamed_addr constant [8 x i8] c"Int1024\00", align 1
@func449_func450_str1 = private unnamed_addr constant [27 x i8] c"unsupported cfgIntegerSize\00", align 1
@func455_str1 = private unnamed_addr constant [21 x i8] c"value_new : v != nil\00", align 1
@func477_func478_str1 = private unnamed_addr constant [20 x i8] c"do_value : v == nil\00", align 1
@func479_func480_str1 = private unnamed_addr constant [17 x i8] c"invalid lvalue12\00", align 1
@func481_func482_str1 = private unnamed_addr constant [31 x i8] c"expected value with union type\00", align 1
@func481_func482_str2 = private unnamed_addr constant [11 x i8] c"type error\00", align 1
@func481_str1 = private unnamed_addr constant [25 x i8] c"expected 'other' variant\00", align 1
@func484_str1 = private unnamed_addr constant [17 x i8] c"expected pointer\00", align 1
@func485_str1 = private unnamed_addr constant [18 x i8] c"binary type error\00", align 1
@func488_func489_str1 = private unnamed_addr constant [21 x i8] c"not enough arguments\00", align 1
@func488_func489_str2 = private unnamed_addr constant [16 x i8] c"excess argument\00", align 1
@func492_str1 = private unnamed_addr constant [16 x i8] c"undefined field\00", align 1
@func495_str1 = private unnamed_addr constant [16 x i8] c"type cast error\00", align 1
@func496_str1 = private unnamed_addr constant [16 x i8] c"type cast error\00", align 1
@func498_str1 = private unnamed_addr constant [16 x i8] c"type cast error\00", align 1
@func499_str1 = private unnamed_addr constant [16 x i8] c"type cast error\00", align 1
@func500_str1 = private unnamed_addr constant [16 x i8] c"type cast error\00", align 1
@func502_str1 = private unnamed_addr constant [16 x i8] c"type cast error\00", align 1
@func503_str1 = private unnamed_addr constant [16 x i8] c"type cast error\00", align 1
@func505_func506_str1 = private unnamed_addr constant [32 x i8] c"do_value_cast_gen_rec field=nil\00", align 1
@func510_str1 = private unnamed_addr constant [18 x i8] c"cast to same type\00", align 1
@func510_func511_str1 = private unnamed_addr constant [18 x i8] c"do_value_cast unk\00", align 1
@func512_str1 = private unnamed_addr constant [20 x i8] c"expected union type\00", align 1
@func512_str2 = private unnamed_addr constant [11 x i8] c"type error\00", align 1
@func515_str1 = private unnamed_addr constant [11 x i8] c"type error\00", align 1
@func516_str1 = private unnamed_addr constant [20 x i8] c"sizeof unknown type\00", align 1
@func517_str1 = private unnamed_addr constant [21 x i8] c"alignof unknown type\00", align 1
@func518_str1 = private unnamed_addr constant [16 x i8] c"unknown value7\0A\00", align 1
@func519_str1 = private unnamed_addr constant [2 x i8] c"0\00", align 1
@func519_str2 = private unnamed_addr constant [2 x i8] c"x\00", align 1
@func519_str3 = private unnamed_addr constant [5 x i8] c"%llx\00", align 1
@func519_str4 = private unnamed_addr constant [5 x i8] c"%lld\00", align 1
@func521_str1 = private unnamed_addr constant [5 x i8] c"func\00", align 1
@func521_str2 = private unnamed_addr constant [2 x i8] c"_\00", align 1
@func532_str1 = private unnamed_addr constant [32 x i8] c"приведение юнион\00", align 1
@func532_str2 = private unnamed_addr constant [11 x i8] c"type error\00", align 1
@func537_str1 = private unnamed_addr constant [29 x i8] c"implicit_cast::v.type == nil\00", align 1
@func537_str2 = private unnamed_addr constant [24 x i8] c"implicit_cast::t == nil\00", align 1
@func537_str3 = private unnamed_addr constant [14 x i8] c"type overflow\00", align 1
@func540_str1 = private unnamed_addr constant [6 x i8] c"false\00", align 1
@func540_str2 = private unnamed_addr constant [5 x i8] c"true\00", align 1
@func540_str3 = private unnamed_addr constant [4 x i8] c"nil\00", align 1
@func540_str4 = private unnamed_addr constant [5 x i8] c"unit\00", align 1
@func542_str1 = private unnamed_addr constant [9 x i8] c"stmt_new\00", align 1
@func544_str1 = private unnamed_addr constant [13 x i8] c"invalid lval\00", align 1
@func552_str1 = private unnamed_addr constant [21 x i8] c"missing return value\00", align 1
@func554_str1 = private unnamed_addr constant [31 x i8] c"`break` outside a loop context\00", align 1
@func555_str1 = private unnamed_addr constant [31 x i8] c"`again` outside a loop context\00", align 1
@func559_str1 = private unnamed_addr constant [7 x i8] c"<name>\00", align 1
@func559_str2 = private unnamed_addr constant [4 x i8] c"##\0A\00", align 1
@func572_str1 = private unnamed_addr constant [3 x i8] c".m\00", align 1
@func572_str2 = private unnamed_addr constant [2 x i8] c"/\00", align 1
@func572_str3 = private unnamed_addr constant [3 x i8] c".m\00", align 1
@func572_str4 = private unnamed_addr constant [15 x i8] c"unknown import\00", align 1
@func573_str1 = private unnamed_addr constant [18 x i8] c"type redefination\00", align 1
@func575_str1 = private unnamed_addr constant [19 x i8] c"value redefination\00", align 1
@func575_str2 = private unnamed_addr constant [7 x i8] c"printf\00", align 1
@func575_str3 = private unnamed_addr constant [6 x i8] c"scanf\00", align 1
@func575_str4 = private unnamed_addr constant [7 x i8] c"sscanf\00", align 1
@func575_str5 = private unnamed_addr constant [8 x i8] c"sprintf\00", align 1
@func575_str6 = private unnamed_addr constant [8 x i8] c"fprintf\00", align 1
@func576_func577_str1 = private unnamed_addr constant [16 x i8] c"undefined type5\00", align 1
@func579_str1 = private unnamed_addr constant [11 x i8] c"m2 v%d.%d\0A\00", align 1
@func579_str2 = private unnamed_addr constant [7 x i8] c"main.m\00", align 1
@func579_str3 = private unnamed_addr constant [11 x i8] c"lines: %d\0A\00", align 1
@func579_str4 = private unnamed_addr constant [7 x i8] c"out.ll\00", align 1

;arrays:


;vars:

@lines = global %Nat32 0; 1
@typeVoid = global %Type* zeroinitializer; 1
@typeUnit = global %Type* zeroinitializer; 1
@typeBool = global %Type* zeroinitializer; 1
@typeChar = global %Type* zeroinitializer; 1
@typeStr = global %Type* zeroinitializer; 1
@typeBaseInt = global %Type* zeroinitializer; 1
@typeFreePtr = global %Type* zeroinitializer; 1
@typeNumeric = global %Type* zeroinitializer; 1
@unsafe = global i1 0; 1
@ctype = global %Type* zeroinitializer; 1
@asm0 = global %Assembly zeroinitializer; 1
@unions = global %List zeroinitializer; 1
@nocnt = global %Nat32 0; 1
@nocnt2 = global %Nat32 0; 1
@cctx = global %Context* zeroinitializer; 1
@builtinContext = global %Context zeroinitializer; 1
@module = global %Module* zeroinitializer; 1
@fctx = global %FuncContext* zeroinitializer; 1
@warncnt = global %Nat32 0; 1
@errcnt = global %Int32 0; 1
@local_type_id_cnt = global %Nat32 0; 1
@func_uid = global %Nat32 0; 1
@str_uid = global %Nat32 0; 1
@arr_uid = global %Nat32 0; 1
@var_uid = global %Nat32 0; 1
@type_uid = global %Nat32 0; 1
@lstate = global %LexerState zeroinitializer; 1
@pstat = global %ParserState zeroinitializer; 1
@external = global i1 0; 1
@comments = global i1 0; 1
@xarghack = global i1 0; 1
@fout = global %FILE* zeroinitializer; 1
@clab = global %Nat32 0; 1
@global_if_id = global %Nat32 0; 1
@global_while_id = global %Nat32 0; 1
@while_id = global %Nat32 0; 1
@blockno = global %Nat32 0; 1
@stmtno = global %Nat32 0; 1
@select_no = global %Nat32 0; 1
@local_vars_map = global [1024 x %Nat32] zeroinitializer; 1
@local_x_map = global [1024 x %Nat32] zeroinitializer; 1
@union_id = global %Nat32 0; 1
@spec_type_uid = global %Nat32 0; 1
@fuid = global %Nat32 0; 1
@imp_list = global %List zeroinitializer; 1

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
  %3 = xor i1 %0, 1
  br i1 %3, label %then_0, label %else_0
then_0:
  %4 = bitcast [19 x %Nat8]* @func29_str1 to %Str
  %5 = call %Int32 (%Str, ...) @printf (%Str %4, %Str %1)
  call void (%Int32) @exit (%Int32 1)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  ret void
}

define i1 @isLowerCase (%Nat8) {
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
  %2 = call i1 (%Nat8) @isLowerCase (%Nat8 %0)
  %3 = call i1 (%Nat8) @isUpperCase (%Nat8 %0)
  %4 = or i1 %2, %3
  ret i1 %4
}

define i1 @isAlNum (%Nat8) {
  %2 = call i1 (%Nat8) @isAlpha (%Nat8 %0)
  %3 = call i1 (%Nat8) @isDigit (%Nat8 %0)
  %4 = or i1 %2, %3
  ret i1 %4
}

define %Nat32 @slen (%Str) {
  %2 = alloca %Nat32
  store %Nat32 0, %Nat32* %2, align 4
  br label %again_0
again_0:
  %3 = load %Nat32, %Nat32* %2
; eval index uarray
  %4 = getelementptr inbounds %Nat8, %Nat8* %0, %Nat32 %3
  %5 = load %Nat8, %Nat8* %4
  %6 = icmp ne %Nat8 %5, 0
  br i1 %6, label %body_0, label %break_0
body_0:
  %7 = load %Nat32, %Nat32* %2
  %8 = add %Nat32 %7, 1
  store %Nat32 %8, %Nat32* %2, align 4
  br label %again_0
break_0:
  %9 = load %Nat32, %Nat32* %2
  ret %Nat32 %9
}

define void @strcp (%Str, %Str) {
  %3 = alloca %Nat32
  store %Nat32 0, %Nat32* %3, align 4
  br label %again_0
again_0:
  br i1 1, label %body_0, label %break_0
body_0:
  %4 = load %Nat32, %Nat32* %3
; eval index uarray
  %5 = getelementptr inbounds %Nat8, %Nat8* %0, %Nat32 %4
  %6 = load %Nat32, %Nat32* %3
; eval index uarray
  %7 = getelementptr inbounds %Nat8, %Nat8* %1, %Nat32 %6
  %8 = load %Nat8, %Nat8* %7
  store %Nat8 %8, %Nat8* %5, align 1
  %9 = load %Nat32, %Nat32* %3
  %10 = add %Nat32 %9, 1
  store %Nat32 %10, %Nat32* %3, align 4
  %11 = load %Nat32, %Nat32* %3
; eval index uarray
  %12 = getelementptr inbounds %Nat8, %Nat8* %1, %Nat32 %11
  %13 = load %Nat8, %Nat8* %12
  %14 = icmp eq %Nat8 %13, 0
  br i1 %14, label %then_0, label %else_0
then_0:
  br label %break_0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  br label %again_0
break_0:
  ret void
}

define %Str @str_new (%Nat32) {
  %2 = add %Nat32 %0, 1
  %3 = call %Unit* (%Nat32) @malloc (%Nat32 %2)
  %4 = bitcast %Unit* %3 to %Str
  ret %Str %4
}

define %Str @dup (%Str) {
  %2 = call %Nat32 (%Str) @slen (%Str %0)
  %3 = call %Str (%Nat32) @str_new (%Nat32 %2)
  call void (%Str, %Str) @strcp (%Str %3, %Str %0)
  ret %Str %3
}

define %Str @cat (%Str, %Str) {
  %3 = call %Nat32 (%Str) @slen (%Str %0)
  %4 = call %Nat32 (%Str) @slen (%Str %1)
  %5 = add %Nat32 %3, %4
  %6 = call %Str (%Nat32) @str_new (%Nat32 %5)
; eval index uarray
  %7 = getelementptr inbounds %Nat8, %Nat8* %6, %Int64 0
  %8 = bitcast %Nat8* %7 to %Str
  call void (%Str, %Str) @strcp (%Str %8, %Str %0)
; eval index uarray
  %9 = getelementptr inbounds %Nat8, %Nat8* %6, %Nat32 %3
  %10 = bitcast %Nat8* %9 to %Str
  call void (%Str, %Str) @strcp (%Str %10, %Str %1)
; eval index uarray
  %11 = getelementptr inbounds %Nat8, %Nat8* %6, %Nat32 %5
  store %Nat8 0, %Nat8* %11, align 1
  ret %Str %6
}

define %Str @cat3 (%Str, %Str, %Str) {
  %4 = call %Nat32 (%Str) @slen (%Str %0)
  %5 = call %Nat32 (%Str) @slen (%Str %1)
  %6 = call %Nat32 (%Str) @slen (%Str %2)
  %7 = add %Nat32 %4, %5
  %8 = add %Nat32 %7, %6
  %9 = call %Str (%Nat32) @str_new (%Nat32 %8)
; eval index uarray
  %10 = getelementptr inbounds %Nat8, %Nat8* %9, %Int64 0
  %11 = bitcast %Nat8* %10 to %Str
  call void (%Str, %Str) @strcp (%Str %11, %Str %0)
; eval index uarray
  %12 = getelementptr inbounds %Nat8, %Nat8* %9, %Nat32 %4
  %13 = bitcast %Nat8* %12 to %Str
  call void (%Str, %Str) @strcp (%Str %13, %Str %1)
; eval index uarray
  %14 = getelementptr inbounds %Nat8, %Nat8* %9, %Nat32 %7
  %15 = bitcast %Nat8* %14 to %Str
  call void (%Str, %Str) @strcp (%Str %15, %Str %2)
; eval index uarray
  %16 = getelementptr inbounds %Nat8, %Nat8* %9, %Nat32 %8
  store %Nat8 0, %Nat8* %16, align 1
  ret %Str %9
}

define %Str @cat4 (%Str, %Str, %Str, %Str) {
  %5 = call %Nat32 (%Str) @slen (%Str %0)
  %6 = call %Nat32 (%Str) @slen (%Str %1)
  %7 = call %Nat32 (%Str) @slen (%Str %2)
  %8 = call %Nat32 (%Str) @slen (%Str %3)
  %9 = add %Nat32 %5, %6
  %10 = add %Nat32 %9, %7
  %11 = add %Nat32 %10, %8
  %12 = call %Str (%Nat32) @str_new (%Nat32 %11)
; eval index uarray
  %13 = getelementptr inbounds %Nat8, %Nat8* %12, %Int64 0
  %14 = bitcast %Nat8* %13 to %Str
  call void (%Str, %Str) @strcp (%Str %14, %Str %0)
; eval index uarray
  %15 = getelementptr inbounds %Nat8, %Nat8* %12, %Nat32 %5
  %16 = bitcast %Nat8* %15 to %Str
  call void (%Str, %Str) @strcp (%Str %16, %Str %1)
; eval index uarray
  %17 = getelementptr inbounds %Nat8, %Nat8* %12, %Nat32 %9
  %18 = bitcast %Nat8* %17 to %Str
  call void (%Str, %Str) @strcp (%Str %18, %Str %2)
; eval index uarray
  %19 = getelementptr inbounds %Nat8, %Nat8* %12, %Nat32 %10
  %20 = bitcast %Nat8* %19 to %Str
  call void (%Str, %Str) @strcp (%Str %20, %Str %3)
; eval index uarray
  %21 = getelementptr inbounds %Nat8, %Nat8* %12, %Nat32 %11
  store %Nat8 0, %Nat8* %21, align 1
  ret %Str %12
}

define %Str @cat5 (%Str, %Str, %Str, %Str, %Str) {
  %6 = call %Nat32 (%Str) @slen (%Str %0)
  %7 = call %Nat32 (%Str) @slen (%Str %1)
  %8 = call %Nat32 (%Str) @slen (%Str %2)
  %9 = call %Nat32 (%Str) @slen (%Str %3)
  %10 = call %Nat32 (%Str) @slen (%Str %4)
  %11 = add %Nat32 %6, %7
  %12 = add %Nat32 %11, %8
  %13 = add %Nat32 %12, %9
  %14 = add %Nat32 %13, %10
  %15 = call %Str (%Nat32) @str_new (%Nat32 %14)
; eval index uarray
  %16 = getelementptr inbounds %Nat8, %Nat8* %15, %Int64 0
  %17 = bitcast %Nat8* %16 to %Str
  call void (%Str, %Str) @strcp (%Str %17, %Str %0)
; eval index uarray
  %18 = getelementptr inbounds %Nat8, %Nat8* %15, %Nat32 %6
  %19 = bitcast %Nat8* %18 to %Str
  call void (%Str, %Str) @strcp (%Str %19, %Str %1)
; eval index uarray
  %20 = getelementptr inbounds %Nat8, %Nat8* %15, %Nat32 %11
  %21 = bitcast %Nat8* %20 to %Str
  call void (%Str, %Str) @strcp (%Str %21, %Str %2)
; eval index uarray
  %22 = getelementptr inbounds %Nat8, %Nat8* %15, %Nat32 %12
  %23 = bitcast %Nat8* %22 to %Str
  call void (%Str, %Str) @strcp (%Str %23, %Str %3)
; eval index uarray
  %24 = getelementptr inbounds %Nat8, %Nat8* %15, %Nat32 %13
  %25 = bitcast %Nat8* %24 to %Str
  call void (%Str, %Str) @strcp (%Str %25, %Str %4)
; eval index uarray
  %26 = getelementptr inbounds %Nat8, %Nat8* %15, %Nat32 %14
  store %Nat8 0, %Nat8* %26, align 1
  ret %Str %15
}

define void @node_init (%Node*) {
  %2 = bitcast %Node* %0 to %Unit*
  %3 = call %Unit* (%Unit*, %Nat8, %Nat32) @memset (%Unit* %2, %Nat8 0, %Nat32 32)
  ret void
}

define %Node* @node_new (%Nat32) {
  %2 = add %Nat32 32, %0
  %3 = call %Unit* (%Nat32) @malloc (%Nat32 %2)
  %4 = bitcast %Unit* %3 to %Node*
  call void (%Node*) @node_init (%Node* %4)
  ret %Node* %4
}

define void @node_append (%Node*, %Node*) {
  %3 = getelementptr inbounds %Node, %Node* %0, i1 0, i32 1
  %4 = load %Node*, %Node** %3; loadImmPtr
  %5 = inttoptr i64 0 to%Node*
  %6 = icmp ne %Node* %4, %5
  br i1 %6, label %then_0, label %else_0
then_0:
  %7 = getelementptr inbounds %Node, %Node* %1, i1 0, i32 1
  store %Node* %4, %Node** %7, align 8
  %8 = getelementptr inbounds %Node, %Node* %4, i1 0, i32 0
  store %Node* %1, %Node** %8, align 8
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %9 = getelementptr inbounds %Node, %Node* %0, i1 0, i32 1
  store %Node* %1, %Node** %9, align 8
  %10 = getelementptr inbounds %Node, %Node* %1, i1 0, i32 0
  store %Node* %0, %Node** %10, align 8
  ret void
}

define %Node* @node_get (%Node*, %Nat32) {
  %3 = alloca %Nat32
  store %Nat32 0, %Nat32* %3, align 4; loadImmPtr
  %4 = inttoptr i64 0 to%Node*
  %5 = icmp eq %Node* %0, %4
  br i1 %5, label %then_0, label %else_0
then_0:; loadImmPtr
  %6 = inttoptr i64 0 to%Node*
  ret %Node* %6
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %8 = alloca %Node*
  store %Node* %0, %Node** %8, align 8
  br label %again_0
again_0:
  %9 = load %Nat32, %Nat32* %3
  %10 = icmp ult %Nat32 %9, %1
  br i1 %10, label %body_0, label %break_0
body_0:
  %11 = load %Node*, %Node** %8
  %12 = getelementptr inbounds %Node, %Node* %11, i1 0, i32 1
  %13 = load %Node*, %Node** %12; loadImmPtr
  %14 = inttoptr i64 0 to%Node*
  %15 = icmp eq %Node* %13, %14
  br i1 %15, label %then_1, label %else_1
then_1:; loadImmPtr
  %16 = inttoptr i64 0 to%Node*
  ret %Node* %16
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  %18 = load %Node*, %Node** %8
  %19 = getelementptr inbounds %Node, %Node* %18, i1 0, i32 1
  %20 = load %Node*, %Node** %19
  store %Node* %20, %Node** %8, align 8
  %21 = load %Nat32, %Nat32* %3
  %22 = add %Nat32 %21, 1
  store %Nat32 %22, %Nat32* %3, align 4
  br label %again_0
break_0:
  %23 = load %Node*, %Node** %8
  ret %Node* %23
}

define void @node_exclude (%Node*) {
  %2 = getelementptr inbounds %Node, %Node* %0, i1 0, i32 0
  %3 = load %Node*, %Node** %2
  %4 = getelementptr inbounds %Node, %Node* %0, i1 0, i32 1
  %5 = load %Node*, %Node** %4; loadImmPtr
  %6 = inttoptr i64 0 to%Node*
  %7 = icmp ne %Node* %3, %6
  br i1 %7, label %then_0, label %else_0
then_0:
  %8 = getelementptr inbounds %Node, %Node* %3, i1 0, i32 1
  store %Node* %5, %Node** %8, align 8
  br label %endif_0
else_0:
  br label %endif_0
endif_0:; loadImmPtr
  %9 = inttoptr i64 0 to%Node*
  %10 = icmp ne %Node* %5, %9
  br i1 %10, label %then_1, label %else_1
then_1:
  %11 = getelementptr inbounds %Node, %Node* %5, i1 0, i32 0
  store %Node* %3, %Node** %11, align 8
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  ret void
}

define void @node_foreach (%Node*, %NodeForeachHandler, %Unit*) {; loadImmPtr
  %4 = inttoptr i64 0 to%Node*
  %5 = icmp eq %Node* %0, %4
  br i1 %5, label %then_0, label %else_0
then_0:
ret void
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %7 = alloca %Node*
  store %Node* %0, %Node** %7, align 8
  %8 = alloca %Nat32
  store %Nat32 0, %Nat32* %8, align 4
  br label %again_0
again_0:
  %9 = load %Node*, %Node** %7; loadImmPtr
  %10 = inttoptr i64 0 to%Node*
  %11 = icmp ne %Node* %9, %10
  br i1 %11, label %body_0, label %break_0
body_0:
  %12 = load %Node*, %Node** %7
  %13 = load %Nat32, %Nat32* %8
  call void (%Node*, %Unit*, %Nat32) %1 (%Node* %12, %Unit* %2, %Nat32 %13)
  %14 = load %Node*, %Node** %7
  %15 = getelementptr inbounds %Node, %Node* %14, i1 0, i32 1
  %16 = load %Node*, %Node** %15
  store %Node* %16, %Node** %7, align 8
  %17 = load %Nat32, %Nat32* %8
  %18 = add %Nat32 %17, 1
  store %Nat32 %18, %Nat32* %8, align 4
  br label %again_0
break_0:
  ret void
}

define %Node* @node_search (%Node*, %NodeSearchHandler, %Unit*) {; loadImmPtr
  %4 = inttoptr i64 0 to%Node*
  %5 = icmp eq %Node* %0, %4
  br i1 %5, label %then_0, label %else_0
then_0:; loadImmPtr
  %6 = inttoptr i64 0 to%Node*
  ret %Node* %6
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %8 = alloca %Node*
  store %Node* %0, %Node** %8, align 8
  %9 = alloca %Nat32
  store %Nat32 0, %Nat32* %9, align 4
  br label %again_0
again_0:
  %10 = load %Node*, %Node** %8; loadImmPtr
  %11 = inttoptr i64 0 to%Node*
  %12 = icmp ne %Node* %10, %11
  br i1 %12, label %body_0, label %break_0
body_0:
  %13 = load %Node*, %Node** %8
  %14 = load %Nat32, %Nat32* %9
  %15 = call i1 (%Node*, %Unit*, %Nat32) %1 (%Node* %13, %Unit* %2, %Nat32 %14)
  br i1 %15, label %then_1, label %else_1
then_1:
  %16 = load %Node*, %Node** %8
  ret %Node* %16
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  %18 = load %Node*, %Node** %8
  %19 = getelementptr inbounds %Node, %Node* %18, i1 0, i32 1
  %20 = load %Node*, %Node** %19
  store %Node* %20, %Node** %8, align 8
  %21 = load %Nat32, %Nat32* %9
  %22 = add %Nat32 %21, 1
  store %Nat32 %22, %Nat32* %9, align 4
  br label %again_0
break_0:; loadImmPtr
  %23 = inttoptr i64 0 to%Node*
  ret %Node* %23
}

define i1 @func51 (%Node*, %Unit*, %Nat32) {
  %4 = getelementptr inbounds %Node, %Node* %0, i1 0, i32 3
  %5 = load %Unit*, %Unit** %4
  %6 = icmp eq %Unit* %5, %1
  ret i1 %6
}

define %Node* @node_search_by_data (%Node*, %Unit*) {
  %3 = call %Node* (%Node*, %NodeSearchHandler, %Unit*) @node_search (%Node* %0, %NodeSearchHandler @func51, %Unit* %1)
  ret %Node* %3
}

define void @map_init (%List*) {
  %2 = bitcast %List* %0 to %Unit*
  %3 = call %Unit* (%Unit*, %Nat8, %Nat32) @memset (%Unit* %2, %Nat8 0, %Nat32 32)
  ret void
}

define %List* @map_new () {
  %1 = call %Unit* (%Nat32) @malloc (%Nat32 32)
  %2 = bitcast %Unit* %1 to %List*
  call void (%List*) @map_init (%List* %2)
  ret %List* %2
}

define %List* @list_new_extra (%Nat32) {
  %2 = call %List* () @map_new ()
  %3 = getelementptr inbounds %List, %List* %2, i1 0, i32 3
  store %Nat32 %0, %Nat32* %3, align 4
  ret %List* %2
}

define i1 @list_append_node (%List*, %Node*) {; loadImmPtr
  %3 = inttoptr i64 0 to%List*
  %4 = icmp eq %List* %0, %3; loadImmPtr
  %5 = inttoptr i64 0 to%Node*
  %6 = icmp eq %Node* %1, %5
  %7 = or i1 %4, %6
  br i1 %7, label %then_0, label %else_0
then_0:
  ret i1 0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %9 = getelementptr inbounds %List, %List* %0, i1 0, i32 0
  %10 = load %Node*, %Node** %9; loadImmPtr
  %11 = inttoptr i64 0 to%Node*
  %12 = icmp eq %Node* %10, %11
  br i1 %12, label %then_1, label %else_1
then_1:
  %13 = getelementptr inbounds %List, %List* %0, i1 0, i32 0
  store %Node* %1, %Node** %13, align 8
  br label %endif_1
else_1:
  %14 = getelementptr inbounds %List, %List* %0, i1 0, i32 1
  %15 = load %Node*, %Node** %14
  call void (%Node*, %Node*) @node_append (%Node* %15, %Node* %1)
  br label %endif_1
endif_1:
  %16 = getelementptr inbounds %List, %List* %0, i1 0, i32 1
  store %Node* %1, %Node** %16, align 8
  %17 = getelementptr inbounds %List, %List* %0, i1 0, i32 2
  %18 = getelementptr inbounds %List, %List* %0, i1 0, i32 2
  %19 = load %Nat64, %Nat64* %18
  %20 = add %Nat64 %19, 1
  store %Nat64 %20, %Nat64* %17, align 8
  ret i1 1
}

define %Unit* @list_get (%List*, %Nat32) {
  %3 = getelementptr inbounds %List, %List* %0, i1 0, i32 0
  %4 = load %Node*, %Node** %3
  %5 = call %Node* (%Node*, %Nat32) @node_get (%Node* %4, %Nat32 %1); loadImmPtr
  %6 = inttoptr i64 0 to%Node*
  %7 = icmp eq %Node* %5, %6
  br i1 %7, label %then_0, label %else_0
then_0:; loadImmPtr
  %8 = inttoptr i64 0 to%Unit*
  ret %Unit* %8
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %10 = getelementptr inbounds %Node, %Node* %5, i1 0, i32 3
  %11 = load %Unit*, %Unit** %10
  ret %Unit* %11
}

define i1 @list_append (%List*, %Unit*) {; loadImmPtr
  %3 = inttoptr i64 0 to%List*
  %4 = icmp eq %List* %0, %3; loadImmPtr
  %5 = inttoptr i64 0 to%Unit*
  %6 = icmp eq %Unit* %1, %5
  %7 = or i1 %4, %6
  br i1 %7, label %then_0, label %else_0
then_0:
  ret i1 0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %9 = getelementptr inbounds %List, %List* %0, i1 0, i32 3
  %10 = load %Nat32, %Nat32* %9
  %11 = call %Node* (%Nat32) @node_new (%Nat32 %10)
  %12 = getelementptr inbounds %Node, %Node* %11, i1 0, i32 3
  store %Unit* %1, %Unit** %12, align 8
  %13 = call i1 (%List*, %Node*) @list_append_node (%List* %0, %Node* %11)
  ret i1 %13
}

define %Unit* @list_append_extra (%List*, %Nat32) {; loadImmPtr
  %3 = inttoptr i64 0 to%List*
  %4 = icmp eq %List* %0, %3
  br i1 %4, label %then_0, label %else_0
then_0:; loadImmPtr
  %5 = inttoptr i64 0 to%Unit*
  ret %Unit* %5
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %7 = call %Node* (%Nat32) @node_new (%Nat32 %1)
  %8 = ptrtoint %Node* %7 to %Nat32
  %9 = add %Nat32 %8, 32
  %10 = inttoptr %Nat32 %9 to %Unit*
  %11 = getelementptr inbounds %Node, %Node* %7, i1 0, i32 3
  store %Unit* %10, %Unit** %11, align 8
  %12 = getelementptr inbounds %List, %List* %0, i1 0, i32 0
  %13 = load %Node*, %Node** %12; loadImmPtr
  %14 = inttoptr i64 0 to%Node*
  %15 = icmp eq %Node* %13, %14
  br i1 %15, label %then_1, label %else_1
then_1:
  %16 = getelementptr inbounds %List, %List* %0, i1 0, i32 0
  store %Node* %7, %Node** %16, align 8
  br label %endif_1
else_1:
  %17 = getelementptr inbounds %List, %List* %0, i1 0, i32 1
  %18 = load %Node*, %Node** %17
  call void (%Node*, %Node*) @node_append (%Node* %18, %Node* %7)
  br label %endif_1
endif_1:
  %19 = getelementptr inbounds %List, %List* %0, i1 0, i32 1
  store %Node* %7, %Node** %19, align 8
  %20 = getelementptr inbounds %List, %List* %0, i1 0, i32 2
  %21 = getelementptr inbounds %List, %List* %0, i1 0, i32 2
  %22 = load %Nat64, %Nat64* %21
  %23 = add %Nat64 %22, 1
  store %Nat64 %23, %Nat64* %20, align 8
  ret %Unit* %10
}

define void @func60 (%Unit*, %Unit*, %Nat32, %Node*) {
  %5 = bitcast %Unit* %1 to %List*
  %6 = call i1 (%List*, %Unit*) @list_append (%List* %5, %Unit* %0)
  ret void
}

define i1 @list_extend (%List*, %List*) {; loadImmPtr
  %3 = inttoptr i64 0 to%List*
  %4 = icmp eq %List* %0, %3; loadImmPtr
  %5 = inttoptr i64 0 to%List*
  %6 = icmp eq %List* %1, %5
  %7 = or i1 %4, %6
  br i1 %7, label %then_0, label %else_0
then_0:
  ret i1 0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %9 = bitcast %List* %0 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @func64 (%List* %1, %ListForeachHandler @func60, %Unit* %9)
  ret i1 1
}

define i1 @list_subst (%List*, %Unit*, %Unit*) {
  %4 = getelementptr inbounds %List, %List* %0, i1 0, i32 0
  %5 = load %Node*, %Node** %4
  %6 = call %Node* (%Node*, %Unit*) @node_search_by_data (%Node* %5, %Unit* %1); loadImmPtr
  %7 = inttoptr i64 0 to%Node*
  %8 = icmp eq %Node* %6, %7
  br i1 %8, label %then_0, label %else_0
then_0:
  ret i1 0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %10 = getelementptr inbounds %Node, %Node* %6, i1 0, i32 3
  store %Unit* %2, %Unit** %10, align 8
  ret i1 1
}

define void @list_node_remove (%List*, %Node*) {
  %3 = getelementptr inbounds %Node, %Node* %1, i1 0, i32 0
  %4 = load %Node*, %Node** %3
  %5 = getelementptr inbounds %Node, %Node* %1, i1 0, i32 1
  %6 = load %Node*, %Node** %5
  call void (%Node*) @node_exclude (%Node* %1)
  %7 = getelementptr inbounds %List, %List* %0, i1 0, i32 0
  %8 = load %Node*, %Node** %7
  %9 = icmp eq %Node* %8, %1
  br i1 %9, label %then_0, label %else_0
then_0:
  %10 = getelementptr inbounds %List, %List* %0, i1 0, i32 0
  store %Node* %6, %Node** %10, align 8
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %11 = getelementptr inbounds %List, %List* %0, i1 0, i32 1
  %12 = load %Node*, %Node** %11
  %13 = icmp eq %Node* %12, %1
  br i1 %13, label %then_1, label %else_1
then_1:
  %14 = getelementptr inbounds %List, %List* %0, i1 0, i32 1
  store %Node* %4, %Node** %14, align 8
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  %15 = bitcast %Node* %1 to %Unit*
  call void (%Unit*) @free (%Unit* %15)
  %16 = getelementptr inbounds %List, %List* %0, i1 0, i32 2
  %17 = getelementptr inbounds %List, %List* %0, i1 0, i32 2
  %18 = load %Nat64, %Nat64* %17
  %19 = sub %Nat64 %18, 1
  store %Nat64 %19, %Nat64* %16, align 8
  ret void
}

define i1 @list_remove (%List*, %Unit*) {
  %3 = getelementptr inbounds %List, %List* %0, i1 0, i32 0
  %4 = load %Node*, %Node** %3
  %5 = call %Node* (%Node*, %Unit*) @node_search_by_data (%Node* %4, %Unit* %1); loadImmPtr
  %6 = inttoptr i64 0 to%Node*
  %7 = icmp ne %Node* %5, %6
  br i1 %7, label %then_0, label %else_0
then_0:
  call void (%List*, %Node*) @list_node_remove (%List* %0, %Node* %5)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  ret i1 %7
}

define void @func64 (%List*, %ListForeachHandler, %Unit*) {
  %4 = alloca %Nat32
  store %Nat32 0, %Nat32* %4, align 4
  %5 = alloca %Node*
  %6 = getelementptr inbounds %List, %List* %0, i1 0, i32 0
  %7 = load %Node*, %Node** %6
  store %Node* %7, %Node** %5, align 8
  br label %again_0
again_0:
  %8 = load %Node*, %Node** %5; loadImmPtr
  %9 = inttoptr i64 0 to%Node*
  %10 = icmp ne %Node* %8, %9
  br i1 %10, label %body_0, label %break_0
body_0:
  %11 = load %Node*, %Node** %5
  %12 = getelementptr inbounds %Node, %Node* %11, i1 0, i32 3
  %13 = load %Unit*, %Unit** %12
  %14 = load %Nat32, %Nat32* %4
  %15 = load %Node*, %Node** %5
  call void (%Unit*, %Unit*, %Nat32, %Node*) %1 (%Unit* %13, %Unit* %2, %Nat32 %14, %Node* %15)
  %16 = load %Node*, %Node** %5
  %17 = getelementptr inbounds %Node, %Node* %16, i1 0, i32 1
  %18 = load %Node*, %Node** %17
  store %Node* %18, %Node** %5, align 8
  %19 = load %Nat32, %Nat32* %4
  %20 = add %Nat32 %19, 1
  store %Nat32 %20, %Nat32* %4, align 4
  br label %again_0
break_0:
  ret void
}

define void @list_foreach2 (%List*, %List*, %ListForeachHandler2, %Unit*) {
  %5 = alloca %Node*
  %6 = getelementptr inbounds %List, %List* %0, i1 0, i32 0
  %7 = load %Node*, %Node** %6
  store %Node* %7, %Node** %5, align 8
  %8 = alloca %Node*
  %9 = getelementptr inbounds %List, %List* %1, i1 0, i32 0
  %10 = load %Node*, %Node** %9
  store %Node* %10, %Node** %8, align 8
  %11 = alloca %Nat32
  store %Nat32 0, %Nat32* %11, align 4
  br label %again_0
again_0:
  %12 = load %Node*, %Node** %5; loadImmPtr
  %13 = inttoptr i64 0 to%Node*
  %14 = icmp ne %Node* %12, %13
  %15 = load %Node*, %Node** %8; loadImmPtr
  %16 = inttoptr i64 0 to%Node*
  %17 = icmp ne %Node* %15, %16
  %18 = and i1 %14, %17
  br i1 %18, label %body_0, label %break_0
body_0:
  %19 = load %Node*, %Node** %5
  %20 = getelementptr inbounds %Node, %Node* %19, i1 0, i32 3
  %21 = load %Unit*, %Unit** %20
  %22 = load %Node*, %Node** %8
  %23 = getelementptr inbounds %Node, %Node* %22, i1 0, i32 3
  %24 = load %Unit*, %Unit** %23
  %25 = load %Nat32, %Nat32* %11
  call void (%Unit*, %Unit*, %Unit*, %Nat32) %2 (%Unit* %21, %Unit* %24, %Unit* %3, %Nat32 %25)
  %26 = load %Node*, %Node** %5
  %27 = getelementptr inbounds %Node, %Node* %26, i1 0, i32 1
  %28 = load %Node*, %Node** %27
  store %Node* %28, %Node** %5, align 8
  %29 = load %Node*, %Node** %8
  %30 = getelementptr inbounds %Node, %Node* %29, i1 0, i32 1
  %31 = load %Node*, %Node** %30
  store %Node* %31, %Node** %8, align 8
  %32 = load %Nat32, %Nat32* %11
  %33 = add %Nat32 %32, 1
  store %Nat32 %33, %Nat32* %11, align 4
  br label %again_0
break_0:
  ret void
}

define void @list_while2_or (%List*, %List*, %ListWhileHandler2, %Unit*) {
  %5 = alloca %Node*
  %6 = getelementptr inbounds %List, %List* %0, i1 0, i32 0
  %7 = load %Node*, %Node** %6
  store %Node* %7, %Node** %5, align 8
  %8 = alloca %Node*
  %9 = getelementptr inbounds %List, %List* %1, i1 0, i32 0
  %10 = load %Node*, %Node** %9
  store %Node* %10, %Node** %8, align 8
  %11 = alloca %Nat32
  store %Nat32 0, %Nat32* %11, align 4
  br label %again_0
again_0:
  %12 = load %Node*, %Node** %5; loadImmPtr
  %13 = inttoptr i64 0 to%Node*
  %14 = icmp ne %Node* %12, %13
  %15 = load %Node*, %Node** %8; loadImmPtr
  %16 = inttoptr i64 0 to%Node*
  %17 = icmp ne %Node* %15, %16
  %18 = or i1 %14, %17
  br i1 %18, label %body_0, label %break_0
body_0:
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
  %35 = load %Nat32, %Nat32* %11
  %36 = call i1 (%Unit*, %Unit*, %Unit*, %Nat32) %2 (%Unit* %26, %Unit* %34, %Unit* %3, %Nat32 %35)
  %37 = xor i1 %36, 1
  br i1 %37, label %then_0, label %else_0
then_0:
  br label %break_0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %39 = load %Node*, %Node** %5; loadImmPtr
  %40 = inttoptr i64 0 to%Node*
  %41 = icmp ne %Node* %39, %40
  br i1 %41, label %then_1, label %else_1
then_1:
  %42 = load %Node*, %Node** %5
  %43 = getelementptr inbounds %Node, %Node* %42, i1 0, i32 1
  %44 = load %Node*, %Node** %43
  store %Node* %44, %Node** %5, align 8
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  %45 = load %Node*, %Node** %8; loadImmPtr
  %46 = inttoptr i64 0 to%Node*
  %47 = icmp ne %Node* %45, %46
  br i1 %47, label %then_2, label %else_2
then_2:
  %48 = load %Node*, %Node** %8
  %49 = getelementptr inbounds %Node, %Node* %48, i1 0, i32 1
  %50 = load %Node*, %Node** %49
  store %Node* %50, %Node** %8, align 8
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
  %51 = load %Nat32, %Nat32* %11
  %52 = add %Nat32 %51, 1
  store %Nat32 %52, %Nat32* %11, align 4
  br label %again_0
break_0:
  ret void
}

define i1 @list_compare (%List*, %List*, %ListCompareHandler, %Unit*) {
  %5 = getelementptr inbounds %List, %List* %0, i1 0, i32 2
  %6 = load %Nat64, %Nat64* %5
  %7 = getelementptr inbounds %List, %List* %1, i1 0, i32 2
  %8 = load %Nat64, %Nat64* %7
  %9 = icmp ne %Nat64 %6, %8
  br i1 %9, label %then_0, label %else_0
then_0:
  ret i1 0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %11 = alloca %Node*
  %12 = getelementptr inbounds %List, %List* %0, i1 0, i32 0
  %13 = load %Node*, %Node** %12
  store %Node* %13, %Node** %11, align 8
  %14 = alloca %Node*
  %15 = getelementptr inbounds %List, %List* %1, i1 0, i32 0
  %16 = load %Node*, %Node** %15
  store %Node* %16, %Node** %14, align 8
  %17 = alloca %Nat32
  store %Nat32 0, %Nat32* %17, align 4
  br label %again_0
again_0:
  %18 = load %Node*, %Node** %11; loadImmPtr
  %19 = inttoptr i64 0 to%Node*
  %20 = icmp ne %Node* %18, %19
  %21 = load %Node*, %Node** %14; loadImmPtr
  %22 = inttoptr i64 0 to%Node*
  %23 = icmp ne %Node* %21, %22
  %24 = and i1 %20, %23
  br i1 %24, label %body_0, label %break_0
body_0:
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
  ret i1 0
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  %35 = load %Node*, %Node** %11
  %36 = getelementptr inbounds %Node, %Node* %35, i1 0, i32 1
  %37 = load %Node*, %Node** %36
  store %Node* %37, %Node** %11, align 8
  %38 = load %Node*, %Node** %14
  %39 = getelementptr inbounds %Node, %Node* %38, i1 0, i32 1
  %40 = load %Node*, %Node** %39
  store %Node* %40, %Node** %14, align 8
  %41 = load %Nat32, %Nat32* %17
  %42 = add %Nat32 %41, 1
  store %Nat32 %42, %Nat32* %17, align 4
  br label %again_0
break_0:
  ret i1 1
}

define %Unit* @list_search (%List*, %ListSearchHandler, %Unit*) {; loadImmPtr
  %4 = inttoptr i64 0 to%List*
  %5 = icmp eq %List* %0, %4
  br i1 %5, label %then_0, label %else_0
then_0:; loadImmPtr
  %6 = inttoptr i64 0 to%Unit*
  ret %Unit* %6
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %8 = alloca %Node*
  %9 = getelementptr inbounds %List, %List* %0, i1 0, i32 0
  %10 = load %Node*, %Node** %9
  store %Node* %10, %Node** %8, align 8
  %11 = alloca %Nat32
  store %Nat32 0, %Nat32* %11, align 4
  br label %again_0
again_0:
  %12 = load %Node*, %Node** %8; loadImmPtr
  %13 = inttoptr i64 0 to%Node*
  %14 = icmp ne %Node* %12, %13
  br i1 %14, label %body_0, label %break_0
body_0:
  %15 = load %Node*, %Node** %8
  %16 = getelementptr inbounds %Node, %Node* %15, i1 0, i32 3
  %17 = load %Unit*, %Unit** %16
  %18 = load %Nat32, %Nat32* %11
  %19 = call i1 (%Unit*, %Unit*, %Nat32) %1 (%Unit* %17, %Unit* %2, %Nat32 %18)
  br i1 %19, label %then_1, label %else_1
then_1:
  %20 = load %Node*, %Node** %8
  %21 = getelementptr inbounds %Node, %Node* %20, i1 0, i32 3
  %22 = load %Unit*, %Unit** %21
  ret %Unit* %22
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  %24 = load %Node*, %Node** %8
  %25 = getelementptr inbounds %Node, %Node* %24, i1 0, i32 1
  %26 = load %Node*, %Node** %25
  store %Node* %26, %Node** %8, align 8
  %27 = load %Nat32, %Nat32* %11
  %28 = add %Nat32 %27, 1
  store %Nat32 %28, %Nat32* %11, align 4
  br label %again_0
break_0:; loadImmPtr
  %29 = inttoptr i64 0 to%Unit*
  ret %Unit* %29
}

define %List* @list_map (%List*, %ListMapHandler, %Unit*) {; loadImmPtr
  %4 = inttoptr i64 0 to%List*
  %5 = icmp eq %List* %0, %4
  br i1 %5, label %then_0, label %else_0
then_0:; loadImmPtr
  %6 = inttoptr i64 0 to%List*
  ret %List* %6
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %8 = alloca %Nat32
  store %Nat32 0, %Nat32* %8, align 4
  %9 = alloca %Node*
  %10 = getelementptr inbounds %List, %List* %0, i1 0, i32 0
  %11 = load %Node*, %Node** %10
  store %Node* %11, %Node** %9, align 8
  %12 = call %List* () @map_new ()
  br label %again_0
again_0:
  %13 = load %Node*, %Node** %9; loadImmPtr
  %14 = inttoptr i64 0 to%Node*
  %15 = icmp ne %Node* %13, %14
  br i1 %15, label %body_0, label %break_0
body_0:
  %16 = load %Node*, %Node** %9
  %17 = getelementptr inbounds %Node, %Node* %16, i1 0, i32 3
  %18 = load %Unit*, %Unit** %17
  %19 = load %Nat32, %Nat32* %8
  %20 = call %Unit* (%Unit*, %Unit*, %Nat32) %1 (%Unit* %18, %Unit* %2, %Nat32 %19); loadImmPtr
  %21 = inttoptr i64 0 to%Unit*
  %22 = icmp ne %Unit* %20, %21
  br i1 %22, label %then_1, label %else_1
then_1:
  %23 = call i1 (%List*, %Unit*) @list_append (%List* %12, %Unit* %20)
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  %24 = load %Nat32, %Nat32* %8
  %25 = add %Nat32 %24, 1
  store %Nat32 %25, %Nat32* %8, align 4
  %26 = load %Node*, %Node** %9
  %27 = getelementptr inbounds %Node, %Node* %26, i1 0, i32 1
  %28 = load %Node*, %Node** %27
  store %Node* %28, %Node** %9, align 8
  br label %again_0
break_0:
  ret %List* %12
}

define i1 @map_append (%List*, %Str, %Unit*) {; loadImmPtr
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
  ret i1 0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %13 = call %Node* (%Nat32) @node_new (%Nat32 0)
  %14 = getelementptr inbounds %Node, %Node* %13, i1 0, i32 2
  %15 = bitcast %Str %1 to %Unit*
  store %Unit* %15, %Unit** %14, align 8
  %16 = getelementptr inbounds %Node, %Node* %13, i1 0, i32 3
  store %Unit* %2, %Unit** %16, align 8
  %17 = getelementptr inbounds %List, %List* %0, i1 0, i32 0
  %18 = load %Node*, %Node** %17; loadImmPtr
  %19 = inttoptr i64 0 to%Node*
  %20 = icmp eq %Node* %18, %19
  br i1 %20, label %then_1, label %else_1
then_1:
  %21 = getelementptr inbounds %List, %List* %0, i1 0, i32 0
  store %Node* %13, %Node** %21, align 8
  br label %endif_1
else_1:
  %22 = getelementptr inbounds %List, %List* %0, i1 0, i32 1
  %23 = load %Node*, %Node** %22
  call void (%Node*, %Node*) @node_append (%Node* %23, %Node* %13)
  br label %endif_1
endif_1:
  %24 = getelementptr inbounds %List, %List* %0, i1 0, i32 1
  store %Node* %13, %Node** %24, align 8
  %25 = getelementptr inbounds %List, %List* %0, i1 0, i32 2
  %26 = getelementptr inbounds %List, %List* %0, i1 0, i32 2
  %27 = load %Nat64, %Nat64* %26
  %28 = add %Nat64 %27, 1
  store %Nat64 %28, %Nat64* %25, align 8
  ret i1 1
}

define i1 @func72 (%Node*, %Unit*, %Nat32) {
  %4 = getelementptr inbounds %Node, %Node* %0, i1 0, i32 2
  %5 = load %Unit*, %Unit** %4
  %6 = bitcast %Unit* %5 to %Str
  %7 = bitcast %Unit* %1 to %Str
  %8 = call %Int32 (%Str, %Str) @strcmp (%Str %6, %Str %7)
  %9 = icmp eq %Int32 %8, 0
  ret i1 %9
}

define %Node* @map_list_node_get (%List*, %Str) {
  %3 = getelementptr inbounds %List, %List* %0, i1 0, i32 0
  %4 = load %Node*, %Node** %3
  %5 = bitcast %Str %1 to %Unit*
  %6 = call %Node* (%Node*, %NodeSearchHandler, %Unit*) @node_search (%Node* %4, %NodeSearchHandler @func72, %Unit* %5)
  ret %Node* %6
}

define void @map_reset (%List*, %Str, %Unit*) {
  %4 = call %Node* (%List*, %Str) @map_list_node_get (%List* %0, %Str %1)
  %5 = getelementptr inbounds %Node, %Node* %4, i1 0, i32 3
  store %Unit* %2, %Unit** %5, align 8
  ret void
}

define %Unit* @map_remove (%List*, %Str) {
  %3 = call %Node* (%List*, %Str) @map_list_node_get (%List* %0, %Str %1); loadImmPtr
  %4 = inttoptr i64 0 to%Node*
  %5 = icmp eq %Node* %3, %4
  br i1 %5, label %then_0, label %else_0
then_0:; loadImmPtr
  %6 = inttoptr i64 0 to%Unit*
  ret %Unit* %6
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %8 = getelementptr inbounds %Node, %Node* %3, i1 0, i32 3
  %9 = load %Unit*, %Unit** %8
  call void (%List*, %Node*) @list_node_remove (%List* %0, %Node* %3)
  ret %Unit* %9
}

define %Unit* @map_get (%List*, %Str) {
  %3 = call %Node* (%List*, %Str) @map_list_node_get (%List* %0, %Str %1); loadImmPtr
  %4 = inttoptr i64 0 to%Node*
  %5 = icmp ne %Node* %3, %4
  br i1 %5, label %then_0, label %else_0
then_0:
  %6 = getelementptr inbounds %Node, %Node* %3, i1 0, i32 3
  %7 = load %Unit*, %Unit** %6
  ret %Unit* %7
  br label %endif_0
else_0:
  br label %endif_0
endif_0:; loadImmPtr
  %9 = inttoptr i64 0 to%Unit*
  ret %Unit* %9
}

define void @map_foreach (%List*, %MapForeachHandler, %Unit*) {
  %4 = alloca %Node*
  %5 = getelementptr inbounds %List, %List* %0, i1 0, i32 0
  %6 = load %Node*, %Node** %5
  store %Node* %6, %Node** %4, align 8
  br label %again_0
again_0:
  %7 = load %Node*, %Node** %4; loadImmPtr
  %8 = inttoptr i64 0 to%Node*
  %9 = icmp ne %Node* %7, %8
  br i1 %9, label %body_0, label %break_0
body_0:
  %10 = load %Node*, %Node** %4
  %11 = getelementptr inbounds %Node, %Node* %10, i1 0, i32 2
  %12 = load %Unit*, %Unit** %11
  %13 = load %Node*, %Node** %4
  %14 = getelementptr inbounds %Node, %Node* %13, i1 0, i32 3
  %15 = load %Unit*, %Unit** %14
  call void (%Unit*, %Unit*, %Unit*) %1 (%Unit* %12, %Unit* %15, %Unit* %2)
  %16 = load %Node*, %Node** %4
  %17 = getelementptr inbounds %Node, %Node* %16, i1 0, i32 1
  %18 = load %Node*, %Node** %17
  store %Node* %18, %Node** %4, align 8
  br label %again_0
break_0:
  ret void
}

define void @func78 (%Unit*, %Unit*, %Unit*) {
  %4 = bitcast %Unit* %2 to %List*
  %5 = bitcast %Unit* %0 to %Str
  %6 = call i1 (%List*, %Str, %Unit*) @map_append (%List* %4, %Str %5, %Unit* %1)
  ret void
}

define i1 @map_extend (%List*, %List*) {; loadImmPtr
  %3 = inttoptr i64 0 to%List*
  %4 = icmp eq %List* %0, %3; loadImmPtr
  %5 = inttoptr i64 0 to%List*
  %6 = icmp eq %List* %1, %5
  %7 = or i1 %4, %6
  br i1 %7, label %then_0, label %else_0
then_0:
  ret i1 0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %9 = bitcast %List* %0 to %Unit*
  call void (%List*, %MapForeachHandler, %Unit*) @map_foreach (%List* %1, %MapForeachHandler @func78, %Unit* %9)
  ret i1 1
}

define i1 @exists (%Str) {
  %2 = call %Int32 (%Str, %Int32) @open (%Str %0, %Int32 0)
  %3 = icmp slt %Int32 %2, 0
  br i1 %3, label %then_0, label %else_0
then_0:
  ret i1 0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %5 = call %Int32 (%Int32) @close (%Int32 %2)
  ret i1 1
}

define i1 @isdir (%Str) {
  %2 = call %DIR* (%Str) @opendir (%Str %0); loadImmPtr
  %3 = inttoptr i64 0 to%DIR*
  %4 = icmp eq %DIR* %2, %3
  br i1 %4, label %then_0, label %else_0
then_0:
  ret i1 0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %6 = call %Int32 (%DIR*) @closedir (%DIR* %2)
  ret i1 1
}

define void @index_init (%Index*) {
  %2 = getelementptr inbounds %Index, %Index* %0, i1 0, i32 0
  call void (%List*) @map_init (%List* %2)
  %3 = getelementptr inbounds %Index, %Index* %0, i1 0, i32 1
  call void (%List*) @map_init (%List* %3)
  ret void
}

define void @index_extend (%Index*, %Index*) {
  %3 = getelementptr inbounds %Index, %Index* %0, i1 0, i32 0
  %4 = getelementptr inbounds %Index, %Index* %1, i1 0, i32 0
  %5 = call i1 (%List*, %List*) @map_extend (%List* %3, %List* %4)
  %6 = getelementptr inbounds %Index, %Index* %0, i1 0, i32 1
  %7 = getelementptr inbounds %Index, %Index* %1, i1 0, i32 1
  %8 = call i1 (%List*, %List*) @map_extend (%List* %6, %List* %7)
  ret void
}

define void @index_type_append (%Index*, %Str, %Type*) {
  %4 = getelementptr inbounds %Index, %Index* %0, i1 0, i32 0
  %5 = bitcast %Type* %2 to %Unit*
  %6 = call i1 (%List*, %Str, %Unit*) @map_append (%List* %4, %Str %1, %Unit* %5)
  ret void
}

define void @index_value_append (%Index*, %Str, %Value*) {
  %4 = getelementptr inbounds %Index, %Index* %0, i1 0, i32 1
  %5 = bitcast %Value* %2 to %Unit*
  %6 = call i1 (%List*, %Str, %Unit*) @map_append (%List* %4, %Str %1, %Unit* %5)
  ret void
}

define %Type* @index_type_get (%Index*, %Str) {
  %3 = getelementptr inbounds %Index, %Index* %0, i1 0, i32 0
  %4 = call %Unit* (%List*, %Str) @map_get (%List* %3, %Str %1)
  %5 = bitcast %Unit* %4 to %Type*
  ret %Type* %5
}

define %Value* @index_value_get (%Index*, %Str) {
  %3 = getelementptr inbounds %Index, %Index* %0, i1 0, i32 1
  %4 = call %Unit* (%List*, %Str) @map_get (%List* %3, %Str %1)
  %5 = bitcast %Unit* %4 to %Value*
  ret %Value* %5
}

define void @func87 (%Type*) {; loadImmPtr
  %2 = inttoptr i64 0 to%Type*
  call void (%Type*, %Type*) @func88 (%Type* %0, %Type* %2)
  ret void
}

define void @func88 (%Type*, %Type*) {; loadImmPtr
  %3 = inttoptr i64 0 to%Type*
  %4 = icmp eq %Type* %0, %3
  br i1 %4, label %then_0, label %else_0
then_0:
  %5 = bitcast [6 x %Nat8]* @func88_str1 to %Str
  %6 = call %Int32 (%Str, ...) @printf (%Str %5)
ret void
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %8 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 2
  %9 = load %Str, %Str* %8; loadImmPtr
  %10 = inttoptr i64 0 to%Str
  %11 = icmp ne %Str %9, %10
  br i1 %11, label %then_1, label %else_1
then_1:
  %12 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 0
  %13 = load %TypeKind, %TypeKind* %12
  %14 = icmp ne %TypeKind %13, 16
  br i1 %14, label %then_2, label %else_2
then_2:
  %15 = bitcast [3 x %Nat8]* @func88_str2 to %Str
  %16 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 2
  %17 = load %Str, %Str* %16
  %18 = call %Int32 (%Str, ...) @printf (%Str %15, %Str %17)
ret void
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  %20 = icmp eq %Type* %0, %1
  br i1 %20, label %then_3, label %else_3
then_3:
  %21 = bitcast [5 x %Nat8]* @func88_str3 to %Str
  %22 = call %Int32 (%Str, ...) @printf (%Str %21)
ret void
  br label %endif_3
else_3:
  br label %endif_3
endif_3:
  %24 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 0
  %25 = load %TypeKind, %TypeKind* %24
  br label %select_1_0
select_1_0:
  %26 = icmp eq %TypeKind %25, 5
  br i1 %26, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %27 = bitcast [14 x %Nat8]* @func88_str4 to %Str
  %28 = call %Int32 (%Str, ...) @printf (%Str %27)
  br label %select_1_end
select_1_1:
  %29 = icmp eq %TypeKind %25, 8
  br i1 %29, label %select_1_1_ok, label %select_1_2
select_1_1_ok:
  %30 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 13
  call void (%TypeVar*) @func89 (%TypeVar* %30)
  br label %select_1_end
select_1_2:
  %31 = icmp eq %TypeKind %25, 13
  br i1 %31, label %select_1_2_ok, label %select_1_3
select_1_2_ok:
  %32 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 8
  call void (%TypePointer*, %Type*) @func90 (%TypePointer* %32, %Type* %1)
  br label %select_1_end
select_1_3:
  %33 = icmp eq %TypeKind %25, 14
  br i1 %33, label %select_1_3_ok, label %select_1_4
select_1_3_ok:
  call void (%Type*, %Type*) @func95 (%Type* %0, %Type* %0)
  br label %select_1_end
select_1_4:
  %34 = icmp eq %TypeKind %25, 15
  br i1 %34, label %select_1_4_ok, label %select_1_5
select_1_4_ok:
  call void (%Type*, %Type*) @func96 (%Type* %0, %Type* %0)
  br label %select_1_end
select_1_5:
  %35 = icmp eq %TypeKind %25, 12
  br i1 %35, label %select_1_5_ok, label %select_1_6
select_1_5_ok:
  call void (%Type*) @func91 (%Type* %0)
  br label %select_1_end
select_1_6:
  %36 = icmp eq %TypeKind %25, 9
  br i1 %36, label %select_1_6_ok, label %select_1_7
select_1_6_ok:
  %37 = bitcast [5 x %Nat8]* @func88_str5 to %Str
  %38 = call %Int32 (%Str, ...) @printf (%Str %37)
  br label %select_1_end
select_1_7:
  %39 = icmp eq %TypeKind %25, 11
  br i1 %39, label %select_1_7_ok, label %select_1_8
select_1_7_ok:
  call void (%Type*) @func93 (%Type* %0)
  br label %select_1_end
select_1_8:
  %40 = icmp eq %TypeKind %25, 10
  br i1 %40, label %select_1_8_ok, label %select_1_9
select_1_8_ok:
  %41 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 7
  call void (%TypeFunc*) @func97 (%TypeFunc* %41)
  br label %select_1_end
select_1_9:
  %42 = icmp eq %TypeKind %25, 2
  br i1 %42, label %select_1_9_ok, label %select_1_10
select_1_9_ok:
  %43 = bitcast [13 x %Nat8]* @func88_str6 to %Str
  %44 = call %Int32 (%Str, ...) @printf (%Str %43)
  br label %select_1_end
select_1_10:
  %45 = icmp eq %TypeKind %25, 0
  br i1 %45, label %select_1_10_ok, label %select_1_11
select_1_10_ok:
  %46 = bitcast [16 x %Nat8]* @func88_str7 to %Str
  %47 = call %Int32 (%Str, ...) @printf (%Str %46)
  br label %select_1_end
select_1_11:
  %48 = icmp eq %TypeKind %25, 16
  br i1 %48, label %select_1_11_ok, label %select_1_12
select_1_11_ok:
  %49 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 14
  call void (%TypeUnion*) @func98 (%TypeUnion* %49)
  br label %select_1_end
select_1_12:
  %50 = icmp eq %TypeKind %25, 4
  br i1 %50, label %select_1_12_ok, label %select_1_13
select_1_12_ok:
  %51 = bitcast [20 x %Nat8]* @func88_str8 to %Str
  %52 = call %Int32 (%Str, ...) @printf (%Str %51)
  br label %select_1_end
select_1_13:
  %53 = bitcast [14 x %Nat8]* @func88_str9 to %Str
  %54 = call %Int32 (%Str, ...) @printf (%Str %53)
  br label %select_1_end
select_1_end:
  ret void
}

define void @func89 (%TypeVar*) {
  %2 = bitcast [5 x %Nat8]* @func89_str1 to %Str
  %3 = call %Int32 (%Str, ...) @printf (%Str %2)
  %4 = getelementptr inbounds %TypeVar, %TypeVar* %0, i1 0, i32 0
  %5 = load %Type*, %Type** %4
  call void (%Type*) @func87 (%Type* %5)
  ret void
}

define void @func90 (%TypePointer*, %Type*) {
  %3 = bitcast [2 x %Nat8]* @func90_str1 to %Str
  %4 = call %Int32 (%Str, ...) @printf (%Str %3)
  %5 = getelementptr inbounds %TypePointer, %TypePointer* %0, i1 0, i32 0
  %6 = load %Type*, %Type** %5
  %7 = getelementptr inbounds %Type, %Type* %6, i1 0, i32 0
  %8 = load %TypeKind, %TypeKind* %7
  %9 = icmp eq %TypeKind %8, 16
  %10 = getelementptr inbounds %TypePointer, %TypePointer* %0, i1 0, i32 0
  %11 = load %Type*, %Type** %10
  %12 = getelementptr inbounds %Type, %Type* %11, i1 0, i32 0
  %13 = load %TypeKind, %TypeKind* %12
  %14 = icmp eq %TypeKind %13, 10
  %15 = or i1 %9, %14
  br i1 %15, label %then_0, label %else_0
then_0:
  %16 = bitcast [2 x %Nat8]* @func90_str2 to %Str
  %17 = call %Int32 (%Str, ...) @printf (%Str %16)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %18 = getelementptr inbounds %TypePointer, %TypePointer* %0, i1 0, i32 0
  %19 = load %Type*, %Type** %18
  call void (%Type*, %Type*) @func88 (%Type* %19, %Type* %1)
  br i1 %15, label %then_1, label %else_1
then_1:
  %20 = bitcast [2 x %Nat8]* @func90_str3 to %Str
  %21 = call %Int32 (%Str, ...) @printf (%Str %20)
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  ret void
}

define void @func92 (%Unit*, %Unit*, %Nat32, %Node*) {
  %5 = bitcast %Unit* %0 to %Decl*
  %6 = bitcast %Unit* %1 to %Type*
  %7 = icmp ugt %Nat32 %2, 0
  br i1 %7, label %then_0, label %else_0
then_0:
  %8 = bitcast [3 x %Nat8]* @func91_func92_str1 to %Str
  %9 = call %Int32 (%Str, ...) @printf (%Str %8)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %10 = bitcast [6 x %Nat8]* @func91_func92_str2 to %Str
  %11 = getelementptr inbounds %Decl, %Decl* %5, i1 0, i32 0
  %12 = load %AstId*, %AstId** %11
  %13 = getelementptr inbounds %AstId, %AstId* %12, i1 0, i32 0
  %14 = load %Str, %Str* %13
  %15 = call %Int32 (%Str, ...) @printf (%Str %10, %Str %14)
  %16 = getelementptr inbounds %Decl, %Decl* %5, i1 0, i32 1
  %17 = load %Type*, %Type** %16
  call void (%Type*, %Type*) @func88 (%Type* %17, %Type* %6)
  ret void
}

define void @func91 (%Type*) {
  %2 = bitcast [2 x %Nat8]* @func91_str1 to %Str
  %3 = call %Int32 (%Str, ...) @printf (%Str %2)
  %4 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 11
  %5 = getelementptr inbounds %TypeRecord, %TypeRecord* %4, i1 0, i32 0
  %6 = load %List*, %List** %5
  %7 = bitcast %Type* %0 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @func64 (%List* %6, %ListForeachHandler @func92, %Unit* %7)
  %8 = bitcast [2 x %Nat8]* @func91_str2 to %Str
  %9 = call %Int32 (%Str, ...) @printf (%Str %8)
  ret void
}

define void @func94 (%Unit*, %Unit*, %Nat32, %Node*) {
  %5 = bitcast [7 x %Nat8]* @func93_func94_str1 to %Str
  %6 = call %Int32 (%Str, ...) @printf (%Str %5)
  ret void
}

define void @func93 (%Type*) {
  %2 = bitcast [2 x %Nat8]* @func93_str1 to %Str
  %3 = call %Int32 (%Str, ...) @printf (%Str %2)
  %4 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 12
  %5 = getelementptr inbounds %TypeEnum, %TypeEnum* %4, i1 0, i32 0
  %6 = load %List*, %List** %5; loadImmPtr
  %7 = inttoptr i64 0 to%Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @func64 (%List* %6, %ListForeachHandler @func94, %Unit* %7)
  %8 = bitcast [2 x %Nat8]* @func93_str2 to %Str
  %9 = call %Int32 (%Str, ...) @printf (%Str %8)
  ret void
}

define void @func95 (%Type*, %Type*) {
  %3 = bitcast [5 x %Nat8]* @func95_str1 to %Str
  %4 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 9
  %5 = getelementptr inbounds %TypeArray, %TypeArray* %4, i1 0, i32 1
  %6 = load %Nat32, %Nat32* %5
  %7 = call %Int32 (%Str, ...) @printf (%Str %3, %Nat32 %6)
  %8 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 9
  %9 = getelementptr inbounds %TypeArray, %TypeArray* %8, i1 0, i32 0
  %10 = load %Type*, %Type** %9
  call void (%Type*, %Type*) @func88 (%Type* %10, %Type* %1)
  ret void
}

define void @func96 (%Type*, %Type*) {
  %3 = bitcast [3 x %Nat8]* @func96_str1 to %Str
  %4 = call %Int32 (%Str, ...) @printf (%Str %3)
  %5 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 10
  %6 = getelementptr inbounds %TypeArrayU, %TypeArrayU* %5, i1 0, i32 0
  %7 = load %Type*, %Type** %6
  call void (%Type*, %Type*) @func88 (%Type* %7, %Type* %1)
  ret void
}

define void @func97 (%TypeFunc*) {
  %2 = getelementptr inbounds %TypeFunc, %TypeFunc* %0, i1 0, i32 0
  %3 = load %Type*, %Type** %2
  call void (%Type*) @func87 (%Type* %3)
  %4 = bitcast [5 x %Nat8]* @func97_str1 to %Str
  %5 = call %Int32 (%Str, ...) @printf (%Str %4)
  %6 = getelementptr inbounds %TypeFunc, %TypeFunc* %0, i1 0, i32 1
  %7 = load %Type*, %Type** %6
  call void (%Type*) @func87 (%Type* %7)
  ret void
}

define void @func99 (%Unit*, %Unit*, %Nat32, %Node*) {
  %5 = bitcast %Unit* %0 to %Type*
  call void (%Type*) @func87 (%Type* %5)
  %6 = getelementptr inbounds %Node, %Node* %3, i1 0, i32 1
  %7 = load %Node*, %Node** %6; loadImmPtr
  %8 = inttoptr i64 0 to%Node*
  %9 = icmp ne %Node* %7, %8
  br i1 %9, label %then_0, label %else_0
then_0:
  %10 = bitcast [5 x %Nat8]* @func98_func99_str1 to %Str
  %11 = call %Int32 (%Str, ...) @printf (%Str %10)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  ret void
}

define void @func98 (%TypeUnion*) {
  %2 = getelementptr inbounds %TypeUnion, %TypeUnion* %0, i1 0, i32 0; loadImmPtr
  %3 = inttoptr i64 0 to%Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @func64 (%List* %2, %ListForeachHandler @func99, %Unit* %3)
  ret void
}

define void @value_print_undefined (%Value*) {
  ret void
}

define void @value_print_immediate (%Value*) {
  ret void
}

define void @value_print_global_const (%Value*) {
  ret void
}

define void @value_print_global_var (%Value*) {
  ret void
}

define void @value_print_param (%Value*) {
  ret void
}

define void @value_print_local_const (%Value*) {
  ret void
}

define void @value_print_local_var (%Value*) {
  ret void
}

define void @value_print_ref (%Value*) {
  ret void
}

define void @value_print_deref (%Value*) {
  ret void
}

define void @value_print_not (%Value*) {
  ret void
}

define void @value_print_minus (%Value*) {
  ret void
}

define void @value_print_plus (%Value*) {
  ret void
}

define void @func112 (%Value*, %Str) {
  ret void
}

define void @value_print_load (%Value*) {
  ret void
}

define void @value_print_shl (%Value*) {
  ret void
}

define void @value_print_shr (%Value*) {
  ret void
}

define void @value_print_call (%Value*) {
  ret void
}

define void @value_print_index (%Value*) {
  ret void
}

define void @value_print_access (%Value*) {
  ret void
}

define void @value_print_cast (%Value*) {
  ret void
}

define void @value_print_select (%Value*) {
  ret void
}

define void @txt (%Str, %Nat8, %Str) {
  %4 = bitcast [21 x %Nat8]* @func121_str1 to %Str
  %5 = call %Int32 (%Str, ...) @printf (%Str %4, %Int64 27, %Nat8 %1, %Str %0, %Int64 27, %Str %2)
  ret void
}

define void @txti (%Str, %Nat8, %TokenInfo*, %Str) {
  %5 = bitcast [30 x %Nat8]* @func122_str1 to %Str
  %6 = getelementptr inbounds %TokenInfo, %TokenInfo* %2, i1 0, i32 0
  %7 = load %Str, %Str* %6
  %8 = getelementptr inbounds %TokenInfo, %TokenInfo* %2, i1 0, i32 3
  %9 = load %Nat32, %Nat32* %8
  %10 = call %Int32 (%Str, ...) @printf (%Str %5, %Int64 27, %Nat8 %1, %Str %0, %Int64 27, %Str %7, %Nat32 %9, %Str %3)
  ret void
}

define void @info (%Str, %TokenInfo*) {; loadImmPtr
  %3 = inttoptr i64 0 to%TokenInfo*
  %4 = icmp ne %TokenInfo* %1, %3
  br i1 %4, label %then_0, label %else_0
then_0:
  %5 = bitcast [5 x %Nat8]* @func123_str1 to %Str
  call void (%Str, %Nat8, %TokenInfo*, %Str) @txti (%Str %5, %Nat8 36, %TokenInfo* %1, %Str %0)
  call void (%TokenInfo*) @func128 (%TokenInfo* %1)
  br label %endif_0
else_0:
  %6 = bitcast [5 x %Nat8]* @func123_str2 to %Str
  call void (%Str, %Nat8, %Str) @txt (%Str %6, %Nat8 36, %Str %0)
  br label %endif_0
endif_0:
  %7 = bitcast [2 x %Nat8]* @func123_str3 to %Str
  %8 = call %Int32 (%Str, ...) @printf (%Str %7)
  ret void
}

define void @warning (%Str, %TokenInfo*) {; loadImmPtr
  %3 = inttoptr i64 0 to%TokenInfo*
  %4 = icmp ne %TokenInfo* %1, %3
  br i1 %4, label %then_0, label %else_0
then_0:
  %5 = bitcast [8 x %Nat8]* @func124_str1 to %Str
  call void (%Str, %Nat8, %TokenInfo*, %Str) @txti (%Str %5, %Nat8 34, %TokenInfo* %1, %Str %0)
  call void (%TokenInfo*) @func128 (%TokenInfo* %1)
  br label %endif_0
else_0:
  %6 = bitcast [8 x %Nat8]* @func124_str2 to %Str
  call void (%Str, %Nat8, %Str) @txt (%Str %6, %Nat8 34, %Str %0)
  br label %endif_0
endif_0:
  %7 = bitcast [2 x %Nat8]* @func124_str3 to %Str
  %8 = call %Int32 (%Str, ...) @printf (%Str %7)
  %9 = load %Nat32, %Nat32* @warncnt
  %10 = add %Nat32 %9, 1
  store %Nat32 %10, %Nat32* @warncnt, align 4
  %11 = load %Int32, %Int32* @errcnt
  %12 = icmp sgt %Int32 %11, 20
  br i1 %12, label %then_1, label %else_1
then_1:
  %13 = bitcast [14 x %Nat8]* @func124_str4 to %Str
  %14 = call %Int32 (%Str, ...) @printf (%Str %13)
  call void (%Int32) @exit (%Int32 1)
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  ret void
}

define void @error (%Str, %TokenInfo*) {; loadImmPtr
  %3 = inttoptr i64 0 to%TokenInfo*
  %4 = icmp eq %TokenInfo* %1, %3
  br i1 %4, label %then_0, label %else_0
then_0:
  %5 = bitcast [6 x %Nat8]* @func125_str1 to %Str
  call void (%Str, %Nat8, %Str) @txt (%Str %5, %Nat8 35, %Str %0)
  br label %endif_0
else_0:
  %6 = bitcast [6 x %Nat8]* @func125_str2 to %Str
  call void (%Str, %Nat8, %TokenInfo*, %Str) @txti (%Str %6, %Nat8 35, %TokenInfo* %1, %Str %0)
  call void (%TokenInfo*) @func128 (%TokenInfo* %1)
  br label %endif_0
endif_0:
  %7 = bitcast [2 x %Nat8]* @func125_str3 to %Str
  %8 = call %Int32 (%Str, ...) @printf (%Str %7)
  %9 = load %Int32, %Int32* @errcnt
  %10 = add %Int32 %9, 1
  store %Int32 %10, %Int32* @errcnt, align 4
  %11 = load %Int32, %Int32* @errcnt
  %12 = icmp sgt %Int32 %11, 20
  br i1 %12, label %then_1, label %else_1
then_1:
  %13 = bitcast [14 x %Nat8]* @func125_str4 to %Str
  %14 = call %Int32 (%Str, ...) @printf (%Str %13)
  call void (%Int32) @exit (%Int32 1)
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  ret void
}

define void @rem (%Str, %TokenInfo*) {
  %3 = bitcast [17 x %Nat8]* @func126_str1 to %Str
  %4 = call %Int32 (%Str, ...) @printf (%Str %3, %Int64 27, %Int64 33, %Str %0, %Int64 27); loadImmPtr
  %5 = inttoptr i64 0 to%TokenInfo*
  %6 = icmp ne %TokenInfo* %1, %5
  br i1 %6, label %then_0, label %else_0
then_0:
  call void (%TokenInfo*) @func128 (%TokenInfo* %1)
  %7 = bitcast [2 x %Nat8]* @func126_str2 to %Str
  %8 = call %Int32 (%Str, ...) @printf (%Str %7)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  ret void
}

define void @gline (%Str, %TokenInfo*) {
  %3 = getelementptr inbounds %TokenInfo, %TokenInfo* %1, i1 0, i32 0
  %4 = load %Str, %Str* %3
  %5 = call %Int32 (%Str, %Int32) @open (%Str %4, %Int32 0)
  %6 = icmp slt %Int32 %5, 0
  br i1 %6, label %then_0, label %else_0
then_0:
ret void
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %8 = getelementptr inbounds %TokenInfo, %TokenInfo* %1, i1 0, i32 3
  %9 = load %Nat32, %Nat32* %8
  %10 = alloca %Nat32
  store %Nat32 1, %Nat32* %10, align 4
  %11 = alloca %Nat32
  store %Nat32 0, %Nat32* %11, align 4
  %12 = alloca %Nat8
  store %Nat8 0, %Nat8* %12, align 1
  br label %again_0
again_0:
  br i1 1, label %body_0, label %break_0
body_0:
  %13 = load %Nat32, %Nat32* %10
  %14 = icmp eq %Nat32 %13, %9
  br i1 %14, label %then_1, label %else_1
then_1:
  br label %again_1
again_1:
  br i1 1, label %body_1, label %break_1
body_1:
  %15 = getelementptr inbounds %Nat8, %Nat8* %12, i1 0
  %16 = call %Int32 (%Int32, %Nat8*, %Nat32) @read (%Int32 %5, %Nat8* %15, %Nat32 1)
  %17 = icmp eq %Int32 %16, 0
  br i1 %17, label %then_2, label %else_2
then_2:
  br label %exit
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
  %19 = load %Nat32, %Nat32* %11
; eval index uarray
  %20 = getelementptr inbounds %Nat8, %Nat8* %0, %Nat32 %19
  %21 = load %Nat8, %Nat8* %12
  store %Nat8 %21, %Nat8* %20, align 1
  %22 = load %Nat32, %Nat32* %11
  %23 = add %Nat32 %22, 1
  store %Nat32 %23, %Nat32* %11, align 4
  %24 = load %Nat8, %Nat8* %12
; index array
  %25 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func127_str1, i1 0, %Int64 0
  %26 = load %Nat8, %Nat8* %25
  %27 = icmp eq %Nat8 %24, %26
  br i1 %27, label %then_3, label %else_3
then_3:
  br label %exit
  br label %endif_3
else_3:
  br label %endif_3
endif_3:
  br label %again_1
break_1:
  br label %endif_1
else_1:
  %29 = getelementptr inbounds %Nat8, %Nat8* %12, i1 0
  %30 = call %Int32 (%Int32, %Nat8*, %Nat32) @read (%Int32 %5, %Nat8* %29, %Nat32 1)
  %31 = load %Nat8, %Nat8* %12
; index array
  %32 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func127_str2, i1 0, %Int64 0
  %33 = load %Nat8, %Nat8* %32
  %34 = icmp eq %Nat8 %31, %33
  br i1 %34, label %then_4, label %else_4
then_4:
  %35 = load %Nat32, %Nat32* %10
  %36 = add %Nat32 %35, 1
  store %Nat32 %36, %Nat32* %10, align 4
  br label %endif_4
else_4:
  br label %endif_4
endif_4:
  br label %endif_1
endif_1:
  br label %again_0
break_0:
  br label %exit
exit:
  %37 = call %Int32 (%Int32) @close (%Int32 %5)
  %38 = load %Nat32, %Nat32* %11
; eval index uarray
  %39 = getelementptr inbounds %Nat8, %Nat8* %0, %Nat32 %38
  store %Nat8 0, %Nat8* %39, align 1
ret void
  ret void
}

define void @func128 (%TokenInfo*) {
  %2 = bitcast [2 x %Nat8]* @func128_str1 to %Str
  %3 = call %Int32 (%Str, ...) @printf (%Str %2)
  %4 = alloca [512 x %Nat8]
  store [512 x %Nat8] zeroinitializer, [512 x %Nat8]* %4, align 1
; index array
  %5 = getelementptr inbounds [512 x %Nat8], [512 x %Nat8]* %4, i1 0, %Int64 0
  %6 = bitcast %Nat8* %5 to %Unit*
  %7 = call %Unit* (%Unit*, %Nat8, %Nat32) @memset (%Unit* %6, %Nat8 0, %Nat32 512)
  %8 = getelementptr inbounds [512 x %Nat8], [512 x %Nat8]* %4, i1 0
  %9 = bitcast [512 x %Nat8]* %8 to %Str
  call void (%Str, %TokenInfo*) @gline (%Str %9, %TokenInfo* %0)
  %10 = bitcast [3 x %Nat8]* @func128_str2 to %Str
; index array
  %11 = getelementptr inbounds [512 x %Nat8], [512 x %Nat8]* %4, i1 0, %Int64 0
  %12 = call %Int32 (%Str, ...) @printf (%Str %10, %Nat8* %11)
  %13 = alloca %Nat16
  store %Nat16 1, %Nat16* %13, align 2
  br label %again_0
again_0:
  %14 = load %Nat16, %Nat16* %13
  %15 = getelementptr inbounds %TokenInfo, %TokenInfo* %0, i1 0, i32 4
  %16 = load %Nat16, %Nat16* %15
  %17 = icmp ult %Nat16 %14, %16
  br i1 %17, label %body_0, label %break_0
body_0:
  %18 = bitcast [2 x %Nat8]* @func128_str3 to %Str
  %19 = call %Int32 (%Str, ...) @printf (%Str %18)
  %20 = load %Nat16, %Nat16* %13
  %21 = add %Nat16 %20, 1
  store %Nat16 %21, %Nat16* %13, align 2
  br label %again_0
break_0:
  %22 = bitcast [15 x %Nat8]* @func128_str4 to %Str
  %23 = call %Int32 (%Str, ...) @printf (%Str %22, %Int64 27, %Int64 32, %Int64 27)
  ret void
}

define void @fatal (%Str) {
  %2 = bitcast [6 x %Nat8]* @func129_str1 to %Str
  call void (%Str, %Nat8, %Str) @txt (%Str %2, %Nat8 31, %Str %0)
  %3 = bitcast [2 x %Nat8]* @func129_str2 to %Str
  %4 = call %Int32 (%Str, ...) @printf (%Str %3)
  call void (%Int32) @exit (%Int32 1)
  ret void
}

define void @error_type_error (%TokenInfo*, %Type*, %Type*) {
  %4 = bitcast [11 x %Nat8]* @func130_str1 to %Str
  call void (%Str, %TokenInfo*) @error (%Str %4, %TokenInfo* %0); loadImmPtr
  %5 = inttoptr i64 0 to%Type*
  %6 = icmp ne %Type* %2, %5
  br i1 %6, label %then_0, label %else_0
then_0:
  %7 = bitcast [16 x %Nat8]* @func130_str2 to %Str
  %8 = call %Int32 (%Str, ...) @printf (%Str %7)
  call void (%Type*) @func87 (%Type* %2)
  %9 = bitcast [2 x %Nat8]* @func130_str3 to %Str
  %10 = call %Int32 (%Str, ...) @printf (%Str %9)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:; loadImmPtr
  %11 = inttoptr i64 0 to%Type*
  %12 = icmp ne %Type* %1, %11
  br i1 %12, label %then_1, label %else_1
then_1:
  %13 = bitcast [16 x %Nat8]* @func130_str4 to %Str
  %14 = call %Int32 (%Str, ...) @printf (%Str %13)
  call void (%Type*) @func87 (%Type* %1)
  %15 = bitcast [2 x %Nat8]* @func130_str5 to %Str
  %16 = call %Int32 (%Str, ...) @printf (%Str %15)
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  ret void
}

define %Str @func131 (%Str, %Nat32) {
  %3 = alloca [32 x %Nat8]
  store [32 x %Nat8] zeroinitializer, [32 x %Nat8]* %3, align 1
; index array
  %4 = getelementptr inbounds [32 x %Nat8], [32 x %Nat8]* %3, i1 0, %Int64 0
  %5 = bitcast %Nat8* %4 to %Unit*
  %6 = bitcast [3 x %Nat8]* @func131_str1 to %Str
  %7 = call %Int32 (%Unit*, %Str, ...) @sprintf (%Unit* %5, %Str %6, %Nat32 %1)
; index array
  %8 = getelementptr inbounds [32 x %Nat8], [32 x %Nat8]* %3, i1 0, %Int64 0
  %9 = bitcast %Nat8* %8 to %Str
  %10 = call %Str (%Str, %Str) @cat (%Str %0, %Str %9)
  ret %Str %10
}

define %Str @func132 () {
  %1 = load %Nat32, %Nat32* @local_type_id_cnt
  %2 = add %Nat32 %1, 1
  store %Nat32 %2, %Nat32* @local_type_id_cnt, align 4
  %3 = load %FuncContext*, %FuncContext** @fctx
  %4 = getelementptr inbounds %FuncContext, %FuncContext* %3, i1 0, i32 0
  %5 = load %Str, %Str* %4
  %6 = bitcast [6 x %Nat8]* @func132_str1 to %Str
  %7 = call %Str (%Str, %Str) @cat (%Str %5, %Str %6)
  %8 = load %Nat32, %Nat32* @local_type_id_cnt
  %9 = call %Str (%Str, %Nat32) @func131 (%Str %7, %Nat32 %8)
  ret %Str %9
}

define %Str @func133 () {
  %1 = load %FuncContext*, %FuncContext** @fctx; loadImmPtr
  %2 = inttoptr i64 0 to%FuncContext*
  %3 = icmp ne %FuncContext* %1, %2
  br i1 %3, label %then_0, label %else_0
then_0:
  %4 = load %FuncContext*, %FuncContext** @fctx
  %5 = getelementptr inbounds %FuncContext, %FuncContext* %4, i1 0, i32 0
  %6 = load %Str, %Str* %5
  %7 = bitcast [2 x %Nat8]* @func133_str1 to %Str
  %8 = call %Str (%Str, %Str) @cat (%Str %6, %Str %7)
  ret %Str %8
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %10 = bitcast [1 x %Nat8]* @func133_str2 to %Str
  ret %Str %10
}

define %Str @func134 (%Str, %Nat32*) {
  %3 = call %Str () @func133 ()
  %4 = load %Nat32, %Nat32* %1
  %5 = add %Nat32 %4, 1
  store %Nat32 %5, %Nat32* %1, align 4
  %6 = load %Nat32, %Nat32* %1
  %7 = call %Str (%Str, %Nat32) @func131 (%Str %0, %Nat32 %6)
  %8 = call %Str (%Str, %Str) @cat (%Str %3, %Str %7)
  ret %Str %8
}

define %Str @func135 () {
  %1 = bitcast [5 x %Nat8]* @func135_str1 to %Str
  %2 = call %Str (%Str, %Nat32*) @func134 (%Str %1, %Nat32* @func_uid)
  ret %Str %2
}

define %Str @func136 () {
  %1 = load %FuncContext*, %FuncContext** @fctx; loadImmPtr
  %2 = inttoptr i64 0 to%FuncContext*
  %3 = icmp ne %FuncContext* %1, %2
  br i1 %3, label %then_0, label %else_0
then_0:
  %4 = bitcast [4 x %Nat8]* @func136_str1 to %Str
  %5 = load %FuncContext*, %FuncContext** @fctx
  %6 = getelementptr inbounds %FuncContext, %FuncContext* %5, i1 0, i32 6
  %7 = call %Str (%Str, %Nat32*) @func134 (%Str %4, %Nat32* %6)
  ret %Str %7
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %9 = bitcast [4 x %Nat8]* @func136_str2 to %Str
  %10 = call %Str (%Str, %Nat32*) @func134 (%Str %9, %Nat32* @str_uid)
  ret %Str %10
}

define %Str @func137 () {
  %1 = bitcast [4 x %Nat8]* @func137_str1 to %Str
  %2 = call %Str (%Str, %Nat32*) @func134 (%Str %1, %Nat32* @arr_uid)
  ret %Str %2
}

define %Str @func138 () {
  %1 = bitcast [4 x %Nat8]* @func138_str1 to %Str
  %2 = call %Str (%Str, %Nat32*) @func134 (%Str %1, %Nat32* @var_uid)
  ret %Str %2
}

define %Str @func139 () {
  %1 = bitcast [5 x %Nat8]* @func139_str1 to %Str
  %2 = call %Str (%Str, %Nat32*) @func134 (%Str %1, %Nat32* @type_uid)
  ret %Str %2
}

define i1 @func141 (%Unit*, %Unit*, %Nat32) {
  %4 = bitcast %Unit* %0 to %Type*
  %5 = bitcast %Unit* %1 to %Type*
  %6 = call i1 (%Type*, %Type*) @func445 (%Type* %4, %Type* %5)
  ret i1 %6
}

define i1 @func140 (%List*, %Type*) {
  %3 = bitcast %Type* %1 to %Unit*
  %4 = call %Unit* (%List*, %ListSearchHandler, %Unit*) @list_search (%List* %0, %ListSearchHandler @func141, %Unit* %3); loadImmPtr
  %5 = inttoptr i64 0 to%Unit*
  %6 = icmp ne %Unit* %4, %5
  ret i1 %6
}

define void @context_init (%Context*, %Context*) {
  %3 = getelementptr inbounds %Context, %Context* %0, i1 0, i32 1
  call void (%Index*) @index_init (%Index* %3)
  %4 = getelementptr inbounds %Context, %Context* %0, i1 0, i32 0
  store %Context* %1, %Context** %4, align 8
  ret void
}

define void @context_type_append (%Context*, %Str, %Type*) {
  %4 = getelementptr inbounds %Context, %Context* %0, i1 0, i32 1
  call void (%Index*, %Str, %Type*) @index_type_append (%Index* %4, %Str %1, %Type* %2)
  ret void
}

define void @context_value_append (%Context*, %Str, %Value*) {
  %4 = getelementptr inbounds %Context, %Context* %0, i1 0, i32 1
  call void (%Index*, %Str, %Value*) @index_value_append (%Index* %4, %Str %1, %Value* %2)
  ret void
}

define %Type* @context_type_get (%Context*, %Str) {; loadImmPtr
  %3 = inttoptr i64 0 to%Context*
  %4 = icmp eq %Context* %0, %3
  br i1 %4, label %then_0, label %else_0
then_0:; loadImmPtr
  %5 = inttoptr i64 0 to%Type*
  ret %Type* %5
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %7 = getelementptr inbounds %Context, %Context* %0, i1 0, i32 1
  %8 = call %Type* (%Index*, %Str) @index_type_get (%Index* %7, %Str %1)
  br label %select_1_0
select_1_0:; loadImmPtr
  %9 = inttoptr i64 0 to%Type*
  %10 = icmp eq %Type* %8, %9
  br i1 %10, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %11 = getelementptr inbounds %Context, %Context* %0, i1 0, i32 0
  %12 = load %Context*, %Context** %11
  %13 = call %Type* (%Context*, %Str) @context_type_get (%Context* %12, %Str %1)
  br label %select_1_end
select_1_1:
  br label %select_1_end
select_1_end:
  %14 = phi %Type* [ %13, %select_1_0_ok ], [ %8, %select_1_1 ]
  ret %Type* %14
}

define %Value* @context_value_get (%Context*, %Str) {; loadImmPtr
  %3 = inttoptr i64 0 to%Context*
  %4 = icmp eq %Context* %0, %3
  br i1 %4, label %then_0, label %else_0
then_0:; loadImmPtr
  %5 = inttoptr i64 0 to%Value*
  ret %Value* %5
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %7 = getelementptr inbounds %Context, %Context* %0, i1 0, i32 1
  %8 = call %Value* (%Index*, %Str) @index_value_get (%Index* %7, %Str %1)
  br label %select_1_0
select_1_0:; loadImmPtr
  %9 = inttoptr i64 0 to%Value*
  %10 = icmp eq %Value* %8, %9
  br i1 %10, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %11 = getelementptr inbounds %Context, %Context* %0, i1 0, i32 0
  %12 = load %Context*, %Context** %11
  %13 = call %Value* (%Context*, %Str) @context_value_get (%Context* %12, %Str %1)
  br label %select_1_end
select_1_1:
  br label %select_1_end
select_1_end:
  %14 = phi %Value* [ %13, %select_1_0_ok ], [ %8, %select_1_1 ]
  ret %Value* %14
}

define %union.15 @valget (%Str) {
  %2 = load %Context*, %Context** @cctx
  %3 = call %Value* (%Context*, %Str) @context_value_get (%Context* %2, %Str %0); loadImmPtr
  %4 = inttoptr i64 0 to%Value*
  %5 = icmp ne %Value* %3, %4
  br i1 %5, label %then_0, label %else_0
then_0:
  %6 = bitcast %Value* %3 to %union.15
  ret %union.15 %6
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %8 = load %FuncContext*, %FuncContext** @fctx; loadImmPtr
  %9 = inttoptr i64 0 to%FuncContext*
  %10 = icmp ne %FuncContext* %8, %9
  br i1 %10, label %then_1, label %else_1
then_1:
  %11 = bitcast [5 x %Nat8]* @func147_str1 to %Str
  %12 = call %Int32 (%Str, %Str) @strcmp (%Str %0, %Str %11)
  %13 = icmp eq %Int32 %12, 0
  br i1 %13, label %then_2, label %else_2
then_2:
  %14 = load %FuncContext*, %FuncContext** @fctx
  %15 = getelementptr inbounds %FuncContext, %FuncContext* %14, i1 0, i32 1
  %16 = load %Value*, %Value** %15
  %17 = bitcast %Value* %16 to %union.15
  ret %union.15 %17
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  %19 = inttoptr %Unit zeroinitializer to %union.15
  ret %union.15 %19
}

define %union.16 @typeget (%Str) {
  %2 = load %Context*, %Context** @cctx
  %3 = call %Type* (%Context*, %Str) @context_type_get (%Context* %2, %Str %0); loadImmPtr
  %4 = inttoptr i64 0 to%Type*
  %5 = icmp ne %Type* %3, %4
  br i1 %5, label %then_0, label %else_0
then_0:
  %6 = bitcast %Type* %3 to %union.16
  ret %union.16 %6
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %8 = bitcast [5 x %Nat8]* @func148_str1 to %Str
  %9 = call %Int32 (%Str, %Str) @strcmp (%Str %0, %Str %8)
  %10 = icmp eq %Int32 %9, 0
  br i1 %10, label %then_1, label %else_1
then_1:
  %11 = load %Type*, %Type** @ctype
  %12 = bitcast %Type* %11 to %union.16
  ret %union.16 %12
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  %14 = inttoptr %Unit zeroinitializer to %union.16
  ret %union.16 %14
}

define void @typebind (%Str, %Type*) {
  %3 = load %Context*, %Context** @cctx; loadImmPtr
  %4 = inttoptr i64 0 to%Context*
  %5 = icmp ne %Context* %3, %4
  %6 = bitcast [9 x %Nat8]* @func149_str1 to %Str
  call void (i1, %Str) @assert (i1 %5, %Str %6)
  %7 = call %union.16 (%Str) @typeget (%Str %0)
  %8 = bitcast %Int64 0 to %Int64
  %9 = ptrtoint %union.16 %7 to %Int64
  %10 = icmp ne %Int64 %9, %8
  br i1 %10, label %then_0, label %else_0
then_0:
  %11 = bitcast %union.16 %7 to %Type*
  %12 = getelementptr inbounds %Type, %Type* %11, i1 0, i32 0
  %13 = load %TypeKind, %TypeKind* %12
  %14 = icmp ne %TypeKind %13, 1
  br i1 %14, label %then_1, label %else_1
then_1:
  %15 = bitcast [44 x %Nat8]* @func149_str2 to %Str
  %16 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 16
  %17 = load %TokenInfo*, %TokenInfo** %16
  call void (%Str, %TokenInfo*) @error (%Str %15, %TokenInfo* %17)
ret void
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  %19 = bitcast [18 x %Nat8]* @func149_str3 to %Str
  %20 = call %Int32 (%Str, ...) @printf (%Str %19, %Str %0)
  %21 = bitcast %Type* %11 to %Unit*
  %22 = bitcast %Type* %1 to %Unit*
  %23 = call %Unit* (%Unit*, %Unit*, %Nat32) @memcpy (%Unit* %21, %Unit* %22, %Nat32 384)
ret void
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %25 = load %Context*, %Context** @cctx
  call void (%Context*, %Str, %Type*) @context_type_append (%Context* %25, %Str %0, %Type* %1)
  ret void
}

define void @valbind (%Str, %Value*) {
  %3 = load %Context*, %Context** @cctx; loadImmPtr
  %4 = inttoptr i64 0 to%Context*
  %5 = icmp ne %Context* %3, %4
  %6 = bitcast [8 x %Nat8]* @func150_str1 to %Str
  call void (i1, %Str) @assert (i1 %5, %Str %6)
  %7 = call %union.15 (%Str) @valget (%Str %0)
  %8 = bitcast %Int64 0 to %Int64
  %9 = ptrtoint %union.15 %7 to %Int64
  %10 = icmp ne %Int64 %9, %8
  br i1 %10, label %then_0, label %else_0
then_0:
  %11 = bitcast %union.15 %7 to %Value*
  %12 = getelementptr inbounds %Value, %Value* %11, i1 0, i32 1
  %13 = load %union.9, %union.9* %12
  %14 = extractvalue %union.9 %13, 0
  %15 = bitcast %Int16 39 to %Int16
  %16 = icmp ne %Int16 %14, %15
  br i1 %16, label %then_1, label %else_1
then_1:
  %17 = bitcast [35 x %Nat8]* @func150_str2 to %Str
  %18 = getelementptr inbounds %Value, %Value* %1, i1 0, i32 3
  %19 = load %TokenInfo*, %TokenInfo** %18
  call void (%Str, %TokenInfo*) @error (%Str %17, %TokenInfo* %19)
  %20 = bitcast [19 x %Nat8]* @func150_str3 to %Str
  %21 = getelementptr inbounds %Value, %Value* %11, i1 0, i32 3
  %22 = load %TokenInfo*, %TokenInfo** %21
  call void (%Str, %TokenInfo*) @warning (%Str %20, %TokenInfo* %22)
ret void
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  %24 = bitcast %Value* %11 to %Unit*
  %25 = bitcast %Value* %1 to %Unit*
  %26 = call %Unit* (%Unit*, %Unit*, %Nat32) @memcpy (%Unit* %24, %Unit* %25, %Nat32 384)
ret void
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %28 = load %Context*, %Context** @cctx
  call void (%Context*, %Str, %Value*) @context_value_append (%Context* %28, %Str %0, %Value* %1)
  ret void
}

define void @valbind_local (%Str, %Value*) {
  %3 = load %Context*, %Context** @cctx
  %4 = getelementptr inbounds %Context, %Context* %3, i1 0, i32 1
  %5 = call %Value* (%Index*, %Str) @index_value_get (%Index* %4, %Str %0); loadImmPtr
  %6 = inttoptr i64 0 to%Value*
  %7 = icmp ne %Value* %5, %6
  br i1 %7, label %then_0, label %else_0
then_0:
  %8 = bitcast [11 x %Nat8]* @func151_str1 to %Str
  %9 = getelementptr inbounds %Value, %Value* %1, i1 0, i32 3
  %10 = load %TokenInfo*, %TokenInfo** %9
  call void (%Str, %TokenInfo*) @error (%Str %8, %TokenInfo* %10)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %11 = load %Context*, %Context** @cctx
  call void (%Context*, %Str, %Value*) @context_value_append (%Context* %11, %Str %0, %Value* %1)
  ret void
}

define void @typebind_local (%Str, %Type*) {
  %3 = load %Context*, %Context** @cctx
  %4 = getelementptr inbounds %Context, %Context* %3, i1 0, i32 1
  %5 = call %Type* (%Index*, %Str) @index_type_get (%Index* %4, %Str %0); loadImmPtr
  %6 = inttoptr i64 0 to%Type*
  %7 = icmp ne %Type* %5, %6
  br i1 %7, label %then_0, label %else_0
then_0:
  %8 = bitcast [11 x %Nat8]* @func152_str1 to %Str
  %9 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 16
  %10 = load %TokenInfo*, %TokenInfo** %9
  call void (%Str, %TokenInfo*) @error (%Str %8, %TokenInfo* %10)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %11 = load %Context*, %Context** @cctx
  call void (%Context*, %Str, %Type*) @context_type_append (%Context* %11, %Str %0, %Type* %1)
  ret void
}

define %Nat32 @prepart (%Str) {
  %2 = alloca %Nat32
  store %Nat32 0, %Nat32* %2, align 4
  %3 = alloca %Nat32
  store %Nat32 0, %Nat32* %3, align 4
  br label %again_0
again_0:
  %4 = load %Nat32, %Nat32* %3
; eval index uarray
  %5 = getelementptr inbounds %Nat8, %Nat8* %0, %Nat32 %4
  %6 = load %Nat8, %Nat8* %5
  %7 = icmp ne %Nat8 %6, 0
  br i1 %7, label %body_0, label %break_0
body_0:
  %8 = load %Nat32, %Nat32* %3
; eval index uarray
  %9 = getelementptr inbounds %Nat8, %Nat8* %0, %Nat32 %8
  %10 = load %Nat8, %Nat8* %9
; index array
  %11 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func153_str1, i1 0, %Int64 0
  %12 = load %Nat8, %Nat8* %11
  %13 = icmp eq %Nat8 %10, %12
  br i1 %13, label %then_0, label %else_0
then_0:
  %14 = load %Nat32, %Nat32* %3
  %15 = add %Nat32 %14, 1
  store %Nat32 %15, %Nat32* %2, align 4
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %16 = load %Nat32, %Nat32* %3
  %17 = add %Nat32 %16, 1
  store %Nat32 %17, %Nat32* %3, align 4
  br label %again_0
break_0:
  %18 = load %Nat32, %Nat32* %2
  ret %Nat32 %18
}

define %Str @getprefix (%Str) {
  %2 = call %Nat32 (%Str) @prepart (%Str %0)
  %3 = add %Nat32 %2, 1
  %4 = call %Unit* (%Nat32) @malloc (%Nat32 %3)
  %5 = bitcast %Unit* %4 to %Str
  %6 = bitcast %Str %5 to %Unit*
  %7 = bitcast %Str %0 to %Unit*
  %8 = call %Unit* (%Unit*, %Unit*, %Nat32) @memcpy (%Unit* %6, %Unit* %7, %Nat32 %2)
; eval index uarray
  %9 = getelementptr inbounds %Nat8, %Nat8* %5, %Nat32 %2
  store %Nat8 0, %Nat8* %9, align 1
  ret %Str %5
}

define %Str @get_last (%Str) {
  %2 = call %Nat32 (%Str) @prepart (%Str %0)
  %3 = call %Nat32 (%Str) @strlen (%Str %0)
  %4 = sub %Nat32 %3, %2
  %5 = add %Nat32 %4, 1
  %6 = call %Unit* (%Nat32) @malloc (%Nat32 %5)
  %7 = bitcast %Unit* %6 to %Str
  %8 = bitcast %Str %7 to %Unit*
; eval index uarray
  %9 = getelementptr inbounds %Nat8, %Nat8* %0, %Nat32 %2
  %10 = bitcast %Nat8* %9 to %Unit*
  %11 = call %Unit* (%Unit*, %Unit*, %Nat32) @memcpy (%Unit* %8, %Unit* %10, %Nat32 %4)
; eval index uarray
  %12 = getelementptr inbounds %Nat8, %Nat8* %7, %Nat32 %4
  store %Nat8 0, %Nat8* %12, align 1
  ret %Str %7
}

define void @lex_init (%Str) {
  %2 = call i1 (%Str) @exists (%Str %0)
  %3 = xor i1 %2, 1
  br i1 %3, label %then_0, label %else_0
then_0:
  %4 = bitcast [11 x %Nat8]* @func156_str1 to %Str
  %5 = call %Int32 (%Str, ...) @printf (%Str %4, %Str %0)
  %6 = bitcast [17 x %Nat8]* @func156_str2 to %Str
  call void (%Str) @fatal (%Str %6)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %7 = call %Int32 (%Str, %Int32) @open (%Str %0, %Int32 0)
  %8 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 0
  store %Int32 %7, %Int32* %8, align 4
  %9 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 4
  store %Nat16 1, %Nat16* %9, align 2
  %10 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 5
  %11 = insertvalue %TokenInfo zeroinitializer, %Str %0, 0
  %12 = insertvalue %TokenInfo %11, %Nat32 1, 3
  store %TokenInfo %12, %TokenInfo* %10, align 8
  ret void
}

define %Nat8 @getcc () {
  %1 = alloca %Nat8
  store %Nat8 0, %Nat8* %1, align 1
  %2 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 3
  %3 = load %Nat8, %Nat8* %2
  %4 = icmp ne %Nat8 %3, 0
  br i1 %4, label %then_0, label %else_0
then_0:
  %5 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 3
  %6 = load %Nat8, %Nat8* %5
  store %Nat8 %6, %Nat8* %1, align 1
  %7 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 3
  store %Nat8 0, %Nat8* %7, align 1
  br label %endif_0
else_0:
  %8 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 0
  %9 = load %Int32, %Int32* %8
  %10 = getelementptr inbounds %Nat8, %Nat8* %1, i1 0
  %11 = call %Int32 (%Int32, %Nat8*, %Nat32) @read (%Int32 %9, %Nat8* %10, %Nat32 1)
  %12 = icmp eq %Int32 %11, 0
  br i1 %12, label %then_1, label %else_1
then_1:
  ret %Nat8 0
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  %14 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 4
  %15 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 4
  %16 = load %Nat16, %Nat16* %15
  %17 = add %Nat16 %16, 1
  store %Nat16 %17, %Nat16* %14, align 2
  br label %endif_0
endif_0:
  %18 = load %Nat8, %Nat8* %1
  ret %Nat8 %18
}

define void @fill (%Rule) {
  br label %again_0
again_0:
  br i1 1, label %body_0, label %break_0
body_0:
  %2 = call %Nat8 () @getcc ()
  %3 = icmp eq %Nat8 %2, 0
  br i1 %3, label %then_0, label %else_0
then_0:
  %4 = bitcast [10 x %Nat8]* @func158_str1 to %Str
  %5 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 5
  %6 = getelementptr inbounds %TokenInfo, %TokenInfo* %5, i1 0, i32 0
  %7 = load %Str, %Str* %6
  %8 = call %Int32 (%Str, ...) @printf (%Str %4, %Str %7)
  %9 = bitcast [23 x %Nat8]* @func158_str2 to %Str
  call void (%Str) @fatal (%Str %9)
  call void (%Int32) @exit (%Int32 1)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %10 = call i1 (%Nat8) %0 (%Nat8 %2)
  br i1 %10, label %then_1, label %else_1
then_1:
  %11 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 2
  %12 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 5
  %13 = getelementptr inbounds %TokenInfo, %TokenInfo* %12, i1 0, i32 2
  %14 = load %Nat16, %Nat16* %13
; index array
  %15 = getelementptr inbounds [255 x %Nat8], [255 x %Nat8]* %11, i1 0, %Nat16 %14
  store %Nat8 %2, %Nat8* %15, align 1
  %16 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 5
  %17 = getelementptr inbounds %TokenInfo, %TokenInfo* %16, i1 0, i32 2
  %18 = load %Nat16, %Nat16* %17
  %19 = icmp uge %Nat16 %18, 254
  br i1 %19, label %then_2, label %else_2
then_2:
  %20 = bitcast [16 x %Nat8]* @func158_str3 to %Str
  call void (%Str) @fatal (%Str %20)
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
  %21 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 5
  %22 = getelementptr inbounds %TokenInfo, %TokenInfo* %21, i1 0, i32 2
  %23 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 5
  %24 = getelementptr inbounds %TokenInfo, %TokenInfo* %23, i1 0, i32 2
  %25 = load %Nat16, %Nat16* %24
  %26 = add %Nat16 %25, 1
  store %Nat16 %26, %Nat16* %22, align 2
  br label %endif_1
else_1:
  call void (%Nat8) @func178 (%Nat8 %2)
  %27 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 2
  %28 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 5
  %29 = getelementptr inbounds %TokenInfo, %TokenInfo* %28, i1 0, i32 2
  %30 = load %Nat16, %Nat16* %29
; index array
  %31 = getelementptr inbounds [255 x %Nat8], [255 x %Nat8]* %27, i1 0, %Nat16 %30
  store %Nat8 0, %Nat8* %31, align 1
  br label %break_0
  br label %endif_1
endif_1:
  br label %again_0
break_0:
  ret void
}

define i1 @blank (%Nat8) {
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

define i1 @minus (%Nat8) {
; index array
  %2 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func160_str1, i1 0, %Int64 0
  %3 = load %Nat8, %Nat8* %2
  %4 = icmp eq %Nat8 %0, %3
  ret i1 %4
}

define i1 @slash (%Nat8) {
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

define i1 @rarrow (%Nat8) {
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

define i1 @larrow (%Nat8) {
; index array
  %2 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func163_str1, i1 0, %Int64 0
  %3 = load %Nat8, %Nat8* %2
  %4 = icmp eq %Nat8 %0, %3
; index array
  %5 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func163_str2, i1 0, %Int64 0
  %6 = load %Nat8, %Nat8* %5
  %7 = icmp eq %Nat8 %0, %6
  %8 = or i1 %4, %7
  ret i1 %8
}

define i1 @eq (%Nat8) {
; index array
  %2 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func164_str1, i1 0, %Int64 0
  %3 = load %Nat8, %Nat8* %2
  %4 = icmp eq %Nat8 %0, %3
; index array
  %5 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func164_str2, i1 0, %Int64 0
  %6 = load %Nat8, %Nat8* %5
  %7 = icmp eq %Nat8 %0, %6
  %8 = or i1 %4, %7
  ret i1 %8
}

define i1 @ass (%Nat8) {
; index array
  %2 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func165_str1, i1 0, %Int64 0
  %3 = load %Nat8, %Nat8* %2
  %4 = icmp eq %Nat8 %0, %3
  ret i1 %4
}

define i1 @bang (%Nat8) {
; index array
  %2 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func166_str1, i1 0, %Int64 0
  %3 = load %Nat8, %Nat8* %2
  %4 = icmp eq %Nat8 %0, %3
  ret i1 %4
}

define i1 @id (%Nat8) {
  %2 = call i1 (%Nat8) @isAlNum (%Nat8 %0)
; index array
  %3 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func167_str1, i1 0, %Int64 0
  %4 = load %Nat8, %Nat8* %3
  %5 = icmp eq %Nat8 %0, %4
; index array
  %6 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func167_str2, i1 0, %Int64 0
  %7 = load %Nat8, %Nat8* %6
  %8 = icmp eq %Nat8 %0, %7
  %9 = or i1 %5, %8
  %10 = or i1 %2, %9
  ret i1 %10
}

define i1 @digit (%Nat8) {
  %2 = call i1 (%Nat8) @isAlNum (%Nat8 %0)
  ret i1 %2
}

define i1 @cpp_com (%Nat8) {
; index array
  %2 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func169_str1, i1 0, %Int64 0
  %3 = load %Nat8, %Nat8* %2
  %4 = icmp ne %Nat8 %0, %3
  ret i1 %4
}

define void @x_nl () {
  %1 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 1
  store %TokenKind 6, %TokenKind* %1, align 2
  ret void
}

define void @x_eof () {
  %1 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 1
  store %TokenKind 0, %TokenKind* %1, align 2
  %2 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 2
; index array
  %3 = getelementptr inbounds [255 x %Nat8], [255 x %Nat8]* %2, i1 0, %Int64 0
  store %Nat8 0, %Nat8* %3, align 1
  %4 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 5
  %5 = getelementptr inbounds %TokenInfo, %TokenInfo* %4, i1 0, i32 2
  store %Nat16 0, %Nat16* %5, align 2
  ret void
}

define void @func173 () {
  ret void
}

define %TokenKind @getToken () {
  %1 = alloca %Nat8
  store %Nat8 0, %Nat8* %1, align 1
  %2 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 1
  %3 = load %TokenKind, %TokenKind* %2
  %4 = icmp eq %TokenKind %3, 6
  br i1 %4, label %then_0, label %else_0
then_0:
  call void () @func177 ()
  %5 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 4
  store %Nat16 0, %Nat16* %5, align 2
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %6 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 1
  store %TokenKind 0, %TokenKind* %6, align 2
  %7 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 5
  %8 = getelementptr inbounds %TokenInfo, %TokenInfo* %7, i1 0, i32 2
  store %Nat16 0, %Nat16* %8, align 2
  br label %again_0
again_0:
  br i1 1, label %body_0, label %break_0
body_0:
  %9 = call %Nat8 () @getcc ()
  store %Nat8 %9, %Nat8* %1, align 1
  %10 = load %Nat8, %Nat8* %1
  %11 = call i1 (%Nat8) @blank (%Nat8 %10)
  %12 = xor i1 %11, 1
  br i1 %12, label %then_1, label %else_1
then_1:
  br label %break_0
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  br label %again_0
break_0:
  %14 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 5
  %15 = getelementptr inbounds %TokenInfo, %TokenInfo* %14, i1 0, i32 4
  %16 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 4
  %17 = load %Nat16, %Nat16* %16
  store %Nat16 %17, %Nat16* %15, align 2
  %18 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 5
  %19 = getelementptr inbounds %TokenInfo, %TokenInfo* %18, i1 0, i32 1
  %20 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 0
  %21 = load %Int32, %Int32* %20
  %22 = call %Int64 (%Int32, %Int64, %Int32) @lseek (%Int32 %21, %Int64 0, %Int32 1)
  %23 = bitcast %Int64 %22 to %Nat64
  store %Nat64 %23, %Nat64* %19, align 8
  %24 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 2
; index array
  %25 = getelementptr inbounds [255 x %Nat8], [255 x %Nat8]* %24, i1 0, %Int64 0
  %26 = load %Nat8, %Nat8* %1
  store %Nat8 %26, %Nat8* %25, align 1
  %27 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 5
  %28 = getelementptr inbounds %TokenInfo, %TokenInfo* %27, i1 0, i32 2
  store %Nat16 1, %Nat16* %28, align 2
  %29 = load %Nat8, %Nat8* %1
  %30 = call i1 (%Nat8) @isAlpha (%Nat8 %29)
  %31 = load %Nat8, %Nat8* %1
; index array
  %32 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func172_str1, i1 0, %Int64 0
  %33 = load %Nat8, %Nat8* %32
  %34 = icmp eq %Nat8 %31, %33
  %35 = load %Nat8, %Nat8* %1
; index array
  %36 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func172_str2, i1 0, %Int64 0
  %37 = load %Nat8, %Nat8* %36
  %38 = icmp eq %Nat8 %35, %37
  %39 = or i1 %34, %38
  %40 = or i1 %30, %39
  br i1 %40, label %then_2, label %else_2
then_2:
  %41 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 1
  store %TokenKind 1, %TokenKind* %41, align 2
  call void (%Rule) @fill (%Rule @id)
  br label %endif_2
else_2:
  %42 = load %Nat8, %Nat8* %1
  %43 = call i1 (%Nat8) @isDigit (%Nat8 %42)
  br i1 %43, label %then_3, label %else_3
then_3:
  %44 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 1
  store %TokenKind 2, %TokenKind* %44, align 2
  call void (%Rule) @fill (%Rule @digit)
  br label %endif_3
else_3:
  %45 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 1
  store %TokenKind 3, %TokenKind* %45, align 2
  %46 = load %Nat8, %Nat8* %1
  br label %select_1_0
select_1_0:
; index array
  %47 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func172_str3, i1 0, %Int64 0
  %48 = load %Nat8, %Nat8* %47
  %49 = icmp eq %Nat8 %46, %48
  br i1 %49, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  call void () @x_nl ()
  br label %select_1_end
select_1_1:
; index array
  %50 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func172_str4, i1 0, %Int64 0
  %51 = load %Nat8, %Nat8* %50
  %52 = icmp eq %Nat8 %46, %51
  br i1 %52, label %select_1_1_ok, label %select_1_2
select_1_1_ok:
  call void (%Rule) @fill (%Rule @ass)
  br label %select_1_end
select_1_2:
; index array
  %53 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func172_str5, i1 0, %Int64 0
  %54 = load %Nat8, %Nat8* %53
  %55 = icmp eq %Nat8 %46, %54
  br i1 %55, label %select_1_2_ok, label %select_1_3
select_1_2_ok:
  call void (%Rule) @fill (%Rule @eq)
  br label %select_1_end
select_1_3:
; index array
  %56 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func172_str6, i1 0, %Int64 0
  %57 = load %Nat8, %Nat8* %56
  %58 = icmp eq %Nat8 %46, %57
  br i1 %58, label %select_1_3_ok, label %select_1_4
select_1_3_ok:
  call void (%Rule) @fill (%Rule @minus)
  br label %select_1_end
select_1_4:
; index array
  %59 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func172_str7, i1 0, %Int64 0
  %60 = load %Nat8, %Nat8* %59
  %61 = icmp eq %Nat8 %46, %60
  br i1 %61, label %select_1_4_ok, label %select_1_5
select_1_4_ok:
  call void () @func174 ()
  br label %select_1_end
select_1_5:
; index array
  %62 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func172_str8, i1 0, %Int64 0
  %63 = load %Nat8, %Nat8* %62
  %64 = icmp eq %Nat8 %46, %63
  br i1 %64, label %select_1_5_ok, label %select_1_6
select_1_5_ok:
  call void (%Rule) @fill (%Rule @rarrow)
  br label %select_1_end
select_1_6:
; index array
  %65 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func172_str9, i1 0, %Int64 0
  %66 = load %Nat8, %Nat8* %65
  %67 = icmp eq %Nat8 %46, %66
  br i1 %67, label %select_1_6_ok, label %select_1_7
select_1_6_ok:
  call void (%Rule) @fill (%Rule @larrow)
  br label %select_1_end
select_1_7:
; index array
  %68 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func172_str10, i1 0, %Int64 0
  %69 = load %Nat8, %Nat8* %68
  %70 = icmp eq %Nat8 %46, %69
  br i1 %70, label %select_1_7_ok, label %select_1_8
select_1_7_ok:
  call void (%Rule) @fill (%Rule @bang)
  br label %select_1_end
select_1_8:
; index array
  %71 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func172_str11, i1 0, %Int64 0
  %72 = load %Nat8, %Nat8* %71
  %73 = icmp eq %Nat8 %46, %72
  br i1 %73, label %select_1_8_ok, label %select_1_9
select_1_8_ok:
  call void () @func175 ()
  br label %select_1_end
select_1_9:
  %74 = icmp eq %Nat8 %46, 0
  br i1 %74, label %select_1_9_ok, label %select_1_10
select_1_9_ok:
  call void () @x_eof ()
  br label %select_1_end
select_1_10:
  call void () @func173 ()
  br label %select_1_end
select_1_end:
  br label %endif_3
endif_3:
  br label %endif_2
endif_2:
  %75 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 2
  %76 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 5
  %77 = getelementptr inbounds %TokenInfo, %TokenInfo* %76, i1 0, i32 2
  %78 = load %Nat16, %Nat16* %77
; index array
  %79 = getelementptr inbounds [255 x %Nat8], [255 x %Nat8]* %75, i1 0, %Nat16 %78
  store %Nat8 0, %Nat8* %79, align 1
  %80 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 1
  %81 = load %TokenKind, %TokenKind* %80
  ret %TokenKind %81
}

define void @func174 () {
  %1 = alloca %Nat8
  store %Nat8 0, %Nat8* %1, align 1
  %2 = call %Nat8 () @getcc ()
; index array
  %3 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func174_str1, i1 0, %Int64 0
  %4 = load %Nat8, %Nat8* %3
  %5 = icmp eq %Nat8 %2, %4
  br i1 %5, label %then_0, label %else_0
then_0:
  call void (%Nat8) @func178 (%Nat8 %2)
  call void (%Rule) @fill (%Rule @cpp_com)
  %6 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 1
  store %TokenKind 5, %TokenKind* %6, align 2
  br label %endif_0
else_0:
; index array
  %7 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func174_str2, i1 0, %Int64 0
  %8 = load %Nat8, %Nat8* %7
  %9 = icmp eq %Nat8 %2, %8
  br i1 %9, label %then_1, label %else_1
then_1:
  %10 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 1
  store %TokenKind 5, %TokenKind* %10, align 2
  %11 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 2
; index array
  %12 = getelementptr inbounds [255 x %Nat8], [255 x %Nat8]* %11, i1 0, %Int64 0
  store %Nat8 0, %Nat8* %12, align 1
  br label %again_0
again_0:
  br i1 1, label %body_0, label %break_0
body_0:
  %13 = call %Nat8 () @getcc ()
  store %Nat8 %13, %Nat8* %1, align 1
  %14 = load %Nat8, %Nat8* %1
  %15 = icmp eq %Nat8 %14, 0
  br i1 %15, label %then_2, label %else_2
then_2:
  %16 = bitcast [23 x %Nat8]* @func174_str3 to %Str
  call void (%Str) @fatal (%Str %16)
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
  %17 = load %Nat8, %Nat8* %1
; index array
  %18 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func174_str4, i1 0, %Int64 0
  %19 = load %Nat8, %Nat8* %18
  %20 = icmp eq %Nat8 %17, %19
  br i1 %20, label %then_3, label %else_3
then_3:
  %21 = call %Nat8 () @getcc ()
  store %Nat8 %21, %Nat8* %1, align 1
  %22 = load %Nat8, %Nat8* %1
; index array
  %23 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func174_str5, i1 0, %Int64 0
  %24 = load %Nat8, %Nat8* %23
  %25 = icmp eq %Nat8 %22, %24
  br i1 %25, label %then_4, label %else_4
then_4:
  %26 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 2
  %27 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 5
  %28 = getelementptr inbounds %TokenInfo, %TokenInfo* %27, i1 0, i32 2
  %29 = load %Nat16, %Nat16* %28
; index array
  %30 = getelementptr inbounds [255 x %Nat8], [255 x %Nat8]* %26, i1 0, %Nat16 %29
  store %Nat8 0, %Nat8* %30, align 1
ret void
  br label %endif_4
else_4:
  %32 = load %Nat8, %Nat8* %1
  call void (%Nat8) @func178 (%Nat8 %32)
  br label %endif_4
endif_4:
  br label %endif_3
else_3:
  %33 = load %Nat8, %Nat8* %1
; index array
  %34 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func174_str6, i1 0, %Int64 0
  %35 = load %Nat8, %Nat8* %34
  %36 = icmp eq %Nat8 %33, %35
  br i1 %36, label %then_5, label %else_5
then_5:
  call void () @func177 ()
  br label %endif_5
else_5:
  br label %endif_5
endif_5:
  br label %endif_3
endif_3:
  br label %again_0
break_0:
  br label %endif_1
else_1:
  call void (%Nat8) @func178 (%Nat8 %2)
  call void (%Rule) @fill (%Rule @slash)
  br label %endif_1
endif_1:
  br label %endif_0
endif_0:
  ret void
}

define void @func175 () {
  %1 = alloca %Nat8
  store %Nat8 0, %Nat8* %1, align 1
  %2 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 1
  store %TokenKind 4, %TokenKind* %2, align 2
  %3 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 5
  %4 = getelementptr inbounds %TokenInfo, %TokenInfo* %3, i1 0, i32 2
  store %Nat16 0, %Nat16* %4, align 2
  br label %again_0
again_0:
  br i1 1, label %body_0, label %break_0
body_0:
  %5 = call %Nat8 () @getcc ()
  store %Nat8 %5, %Nat8* %1, align 1
  %6 = load %Nat8, %Nat8* %1
; index array
  %7 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func175_str1, i1 0, %Int64 0
  %8 = load %Nat8, %Nat8* %7
  %9 = icmp eq %Nat8 %6, %8
  br i1 %9, label %then_0, label %else_0
then_0:
  br label %break_0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %11 = load %Nat8, %Nat8* %1
  %12 = icmp eq %Nat8 %11, 0
  br i1 %12, label %then_1, label %else_1
then_1:
  %13 = bitcast [23 x %Nat8]* @func175_str2 to %Str
  call void (%Str) @fatal (%Str %13)
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  %14 = load %Nat8, %Nat8* %1
; index array
  %15 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func175_str3, i1 0, %Int64 0
  %16 = load %Nat8, %Nat8* %15
  %17 = icmp eq %Nat8 %14, %16
  br i1 %17, label %then_2, label %else_2
then_2:
  %18 = call %Nat8 () @getcc ()
  store %Nat8 %18, %Nat8* %1, align 1
  %19 = load %Nat8, %Nat8* %1
  br label %select_1_0
select_1_0:
; index array
  %20 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func175_str4, i1 0, %Int64 0
  %21 = load %Nat8, %Nat8* %20
  %22 = icmp eq %Nat8 %19, %21
  br i1 %22, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
; index array
  %23 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func175_str5, i1 0, %Int64 0
  %24 = load %Nat8, %Nat8* %23
  br label %select_1_end
select_1_1:
; index array
  %25 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func175_str6, i1 0, %Int64 0
  %26 = load %Nat8, %Nat8* %25
  %27 = icmp eq %Nat8 %19, %26
  br i1 %27, label %select_1_1_ok, label %select_1_2
select_1_1_ok:
; index array
  %28 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func175_str7, i1 0, %Int64 0
  %29 = load %Nat8, %Nat8* %28
  br label %select_1_end
select_1_2:
; index array
  %30 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func175_str8, i1 0, %Int64 0
  %31 = load %Nat8, %Nat8* %30
  %32 = icmp eq %Nat8 %19, %31
  br i1 %32, label %select_1_2_ok, label %select_1_3
select_1_2_ok:
; index array
  %33 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func175_str9, i1 0, %Int64 0
  %34 = load %Nat8, %Nat8* %33
  br label %select_1_end
select_1_3:
; index array
  %35 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func175_str10, i1 0, %Int64 0
  %36 = load %Nat8, %Nat8* %35
  %37 = icmp eq %Nat8 %19, %36
  br i1 %37, label %select_1_3_ok, label %select_1_4
select_1_3_ok:
; index array
  %38 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func175_str11, i1 0, %Int64 0
  %39 = load %Nat8, %Nat8* %38
  br label %select_1_end
select_1_4:
; index array
  %40 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func175_str12, i1 0, %Int64 0
  %41 = load %Nat8, %Nat8* %40
  %42 = icmp eq %Nat8 %19, %41
  br i1 %42, label %select_1_4_ok, label %select_1_5
select_1_4_ok:
; index array
  %43 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func175_str13, i1 0, %Int64 0
  %44 = load %Nat8, %Nat8* %43
  br label %select_1_end
select_1_5:
; index array
  %45 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func175_str14, i1 0, %Int64 0
  %46 = load %Nat8, %Nat8* %45
  %47 = icmp eq %Nat8 %19, %46
  br i1 %47, label %select_1_5_ok, label %select_1_6
select_1_5_ok:
; index array
  %48 = getelementptr inbounds [1 x %Nat8], [1 x %Nat8]* @func175_str15, i1 0, %Int64 0
  %49 = load %Nat8, %Nat8* %48
  br label %select_1_end
select_1_6:
; index array
  %50 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func175_str16, i1 0, %Int64 0
  %51 = load %Nat8, %Nat8* %50
  %52 = icmp eq %Nat8 %19, %51
  br i1 %52, label %select_1_6_ok, label %select_1_7
select_1_6_ok:
; index array
  %53 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func175_str17, i1 0, %Int64 0
  %54 = load %Nat8, %Nat8* %53
  br label %select_1_end
select_1_7:
; index array
  %55 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func175_str18, i1 0, %Int64 0
  %56 = load %Nat8, %Nat8* %55
  %57 = icmp eq %Nat8 %19, %56
  br i1 %57, label %select_1_7_ok, label %select_1_8
select_1_7_ok:
; index array
  %58 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func175_str19, i1 0, %Int64 0
  %59 = load %Nat8, %Nat8* %58
  br label %select_1_end
select_1_8:
; index array
  %60 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func175_str20, i1 0, %Int64 0
  %61 = load %Nat8, %Nat8* %60
  %62 = icmp eq %Nat8 %19, %61
  br i1 %62, label %select_1_8_ok, label %select_1_9
select_1_8_ok:
; index array
  %63 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func175_str21, i1 0, %Int64 0
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
  %67 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 5
  %68 = getelementptr inbounds %TokenInfo, %TokenInfo* %67, i1 0, i32 2
  %69 = load %Nat16, %Nat16* %68
  %70 = icmp uge %Nat16 %69, 254
  br i1 %70, label %then_3, label %else_3
then_3:
  %71 = bitcast [17 x %Nat8]* @func175_str22 to %Str
  call void (%Str) @fatal (%Str %71)
  br label %endif_3
else_3:
  br label %endif_3
endif_3:
  %72 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 2
  %73 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 5
  %74 = getelementptr inbounds %TokenInfo, %TokenInfo* %73, i1 0, i32 2
  %75 = load %Nat16, %Nat16* %74
; index array
  %76 = getelementptr inbounds [255 x %Nat8], [255 x %Nat8]* %72, i1 0, %Nat16 %75
  %77 = load %Nat8, %Nat8* %1
  store %Nat8 %77, %Nat8* %76, align 1
  %78 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 5
  %79 = getelementptr inbounds %TokenInfo, %TokenInfo* %78, i1 0, i32 2
  %80 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 5
  %81 = getelementptr inbounds %TokenInfo, %TokenInfo* %80, i1 0, i32 2
  %82 = load %Nat16, %Nat16* %81
  %83 = add %Nat16 %82, 1
  store %Nat16 %83, %Nat16* %79, align 2
  br label %again_0
break_0:
  %84 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 2
  %85 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 5
  %86 = getelementptr inbounds %TokenInfo, %TokenInfo* %85, i1 0, i32 2
  %87 = load %Nat16, %Nat16* %86
; index array
  %88 = getelementptr inbounds [255 x %Nat8], [255 x %Nat8]* %84, i1 0, %Nat16 %87
  store %Nat8 0, %Nat8* %88, align 1
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
  %2 = call %Unit* (%Nat32) @malloc (%Nat32 32)
  %3 = bitcast %Unit* %2 to %Source*
  %4 = getelementptr inbounds %Source, %Source* %3, i1 0, i32 0
  call void (%List*) @map_init (%List* %4)
  call void (%Str) @lex_init (%Str %0)
  br label %again_0
again_0:
  br i1 1, label %body_0, label %break_0
body_0:
  %5 = call %TokenKind () @getToken ()
  %6 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 5
  %7 = getelementptr inbounds %TokenInfo, %TokenInfo* %6, i1 0, i32 2
  %8 = load %Nat16, %Nat16* %7
  %9 = add %Nat16 %8, 1
  %10 = zext %Nat16 %9 to %Nat32
  %11 = add %Nat32 40, %10
  %12 = call %Unit* (%Nat32) @malloc (%Nat32 %11)
  %13 = bitcast %Unit* %12 to %Token*
  %14 = getelementptr inbounds %Token, %Token* %13, i1 0, i32 0
  %15 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 1
  %16 = load %TokenKind, %TokenKind* %15
  store %TokenKind %16, %TokenKind* %14, align 2
  %17 = getelementptr inbounds %Token, %Token* %13, i1 0, i32 1
  %18 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 5
  %19 = load %TokenInfo, %TokenInfo* %18
  store %TokenInfo %19, %TokenInfo* %17, align 8
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
  %28 = getelementptr inbounds %Token, %Token* %13, i1 0, i32 2
  %29 = sub %Nat16 %9, 1
; index array
  %30 = getelementptr inbounds [0 x %Nat8], [0 x %Nat8]* %28, i1 0, %Nat16 %29
  store %Nat8 0, %Nat8* %30, align 1
  %31 = getelementptr inbounds %Source, %Source* %3, i1 0, i32 0
  %32 = bitcast %Token* %13 to %Unit*
  %33 = call i1 (%List*, %Unit*) @list_append (%List* %31, %Unit* %32)
  %34 = icmp eq %TokenKind %5, 0
  br i1 %34, label %then_0, label %else_0
then_0:
  br label %break_0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  br label %again_0
break_0:
  %36 = load %Nat32, %Nat32* @lines
  %37 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 5
  %38 = getelementptr inbounds %TokenInfo, %TokenInfo* %37, i1 0, i32 3
  %39 = load %Nat32, %Nat32* %38
  %40 = add %Nat32 %36, %39
  store %Nat32 %40, %Nat32* @lines, align 4
  ret %Source* %3
}

define void @func177 () {
  %1 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 5
  %2 = getelementptr inbounds %TokenInfo, %TokenInfo* %1, i1 0, i32 3
  %3 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 5
  %4 = getelementptr inbounds %TokenInfo, %TokenInfo* %3, i1 0, i32 3
  %5 = load %Nat32, %Nat32* %4
  %6 = add %Nat32 %5, 1
  store %Nat32 %6, %Nat32* %2, align 4
  ret void
}

define void @func178 (%Nat8) {
  %2 = getelementptr inbounds %LexerState, %LexerState* @lstate, i1 0, i32 3
  store %Nat8 %0, %Nat8* %2, align 1
  ret void
}

define %Node* @gett () {
  %1 = getelementptr inbounds %ParserState, %ParserState* @pstat, i1 0, i32 1
  %2 = load %Node*, %Node** %1
  ret %Node* %2
}

define void @sett (%Node*) {
  %2 = getelementptr inbounds %ParserState, %ParserState* @pstat, i1 0, i32 1
  store %Node* %0, %Node** %2, align 8
  ret void
}

define void @skip () {
  %1 = getelementptr inbounds %ParserState, %ParserState* @pstat, i1 0, i32 1
  %2 = getelementptr inbounds %ParserState, %ParserState* @pstat, i1 0, i32 1
  %3 = load %Node*, %Node** %2
  %4 = getelementptr inbounds %Node, %Node* %3, i1 0, i32 1
  %5 = load %Node*, %Node** %4
  store %Node* %5, %Node** %1, align 8
  ret void
}

define void @skip_nl () {
  br label %again_0
again_0:
  %1 = bitcast [2 x %Nat8]* @func182_str1 to %Str
  %2 = call i1 (%Str) @func191 (%Str %1)
  br i1 %2, label %body_0, label %break_0
body_0:
  br label %again_0
break_0:
  ret void
}

define %Token* @func183 () {
  %1 = call %Node* () @gett ()
  %2 = getelementptr inbounds %Node, %Node* %1, i1 0, i32 3
  %3 = load %Unit*, %Unit** %2
  %4 = bitcast %Unit* %3 to %Token*
  %5 = load i1, i1* @comments
  %6 = xor i1 %5, 1
  br i1 %6, label %then_0, label %else_0
then_0:
  %7 = getelementptr inbounds %Token, %Token* %4, i1 0, i32 0
  %8 = load %TokenKind, %TokenKind* %7
  %9 = icmp eq %TokenKind %8, 5
  br i1 %9, label %then_1, label %else_1
then_1:
  call void () @skip ()
  %10 = call %Token* () @func183 ()
  ret %Token* %10
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  ret %Token* %4
}

define i1 @eof () {
  %1 = call %Token* () @func183 ()
  %2 = getelementptr inbounds %Token, %Token* %1, i1 0, i32 0
  %3 = load %TokenKind, %TokenKind* %2
  %4 = icmp eq %TokenKind %3, 0
  ret i1 %4
}

define %Token* @nextok () {
  %1 = call %Node* () @gett ()
  %2 = getelementptr inbounds %Node, %Node* %1, i1 0, i32 1
  %3 = load %Node*, %Node** %2; loadImmPtr
  %4 = inttoptr i64 0 to%Node*
  %5 = icmp ne %Node* %3, %4
  br i1 %5, label %then_0, label %else_0
then_0:
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
endif_0:; loadImmPtr
  %13 = inttoptr i64 0 to%Token*
  ret %Token* %13
}

define i1 @need_sep () {
  %1 = call %Token* () @func183 ()
  %2 = call i1 () @func187 ()
  %3 = icmp eq i1 %2, 0
  br i1 %3, label %then_0, label %else_0
then_0:
  %4 = bitcast [19 x %Nat8]* @func186_str1 to %Str
  %5 = getelementptr inbounds %Token, %Token* %1, i1 0, i32 1
  call void (%Str, %TokenInfo*) @error (%Str %4, %TokenInfo* %5)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  ret i1 %2
}

define i1 @func187 () {
  %1 = call %Token* () @func183 ()
  %2 = getelementptr inbounds %Token, %Token* %1, i1 0, i32 2
; index array
  %3 = getelementptr inbounds [0 x %Nat8], [0 x %Nat8]* %2, i1 0, %Int64 0
  %4 = load %Nat8, %Nat8* %3
; index array
  %5 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func187_str1, i1 0, %Int64 0
  %6 = load %Nat8, %Nat8* %5
  %7 = icmp eq %Nat8 %4, %6
; index array
  %8 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func187_str2, i1 0, %Int64 0
  %9 = load %Nat8, %Nat8* %8
  %10 = icmp eq %Nat8 %4, %9
  %11 = or i1 %7, %10
  br i1 %11, label %then_0, label %else_0
then_0:
  call void () @skip ()
  ret i1 1
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
; index array
  %13 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func187_str3, i1 0, %Int64 0
  %14 = load %Nat8, %Nat8* %13
  %15 = icmp eq %Nat8 %4, %14
; index array
  %16 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func187_str4, i1 0, %Int64 0
  %17 = load %Nat8, %Nat8* %16
  %18 = icmp eq %Nat8 %4, %17
  %19 = or i1 %15, %18
  br i1 %19, label %then_1, label %else_1
then_1:
  ret i1 1
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  ret i1 0
}

define void @need_comma_or_nl () {
  %1 = call %Token* () @func183 ()
  %2 = getelementptr inbounds %Token, %Token* %1, i1 0, i32 1
  %3 = bitcast [2 x %Nat8]* @func188_str1 to %Str
  %4 = call i1 (%Str) @func191 (%Str %3)
  br i1 %4, label %then_0, label %else_0
then_0:
ret void
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %6 = bitcast [2 x %Nat8]* @func188_str2 to %Str
  %7 = call i1 (%Str) @func191 (%Str %6)
  br i1 %7, label %then_1, label %else_1
then_1:
ret void
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  %9 = bitcast [27 x %Nat8]* @func188_str3 to %Str
  call void (%Str, %TokenInfo*) @error (%Str %9, %TokenInfo* %2)
  ret void
}

define void @skipto (%Str) {
  %2 = bitcast [29 x %Nat8]* @func189_str1 to %Str; loadImmPtr
  %3 = inttoptr i64 0 to%TokenInfo*
  call void (%Str, %TokenInfo*) @error (%Str %2, %TokenInfo* %3)
  %4 = bitcast [12 x %Nat8]* @func189_str2 to %Str
  %5 = call %Token* () @func183 ()
  %6 = getelementptr inbounds %Token, %Token* %5, i1 0, i32 2
  %7 = call %Int32 (%Str, ...) @printf (%Str %4, [0 x %Nat8]* %6)
  %8 = bitcast [18 x %Nat8]* @func189_str3 to %Str
  %9 = call %Int32 (%Str, ...) @printf (%Str %8, %Str %0)
  call void (%Int32) @exit (%Int32 1)
  ret void
}

define i1 @look (%Str) {
  %2 = call %Token* () @func183 ()
  %3 = getelementptr inbounds %Token, %Token* %2, i1 0, i32 0
  %4 = load %TokenKind, %TokenKind* %3
  %5 = icmp eq %TokenKind %4, 4
  %6 = icmp eq %TokenKind %4, 0
  %7 = or i1 %5, %6
  br i1 %7, label %then_0, label %else_0
then_0:
  ret i1 0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %9 = getelementptr inbounds %Token, %Token* %2, i1 0, i32 2
  %10 = bitcast [0 x %Nat8]* %9 to %Str
  %11 = call %Int32 (%Str, %Str) @strcmp (%Str %0, %Str %10)
  %12 = icmp eq %Int32 %11, 0
  ret i1 %12
}

define i1 @func191 (%Str) {
  %2 = call i1 (%Str) @look (%Str %0)
  br i1 %2, label %then_0, label %else_0
then_0:
  call void () @skip ()
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  ret i1 %2
}

define i1 @need (%Str) {
  %2 = call i1 (%Str) @func191 (%Str %0)
  %3 = icmp eq i1 %2, 0
  br i1 %3, label %then_0, label %else_0
then_0:
  %4 = call %Token* () @func183 ()
  %5 = bitcast [18 x %Nat8]* @func192_str1 to %Str
  %6 = getelementptr inbounds %Token, %Token* %4, i1 0, i32 1
  call void (%Str, %TokenInfo*) @error (%Str %5, %TokenInfo* %6)
  %7 = bitcast [13 x %Nat8]* @func192_str2 to %Str
  %8 = call %Int32 (%Str, ...) @printf (%Str %7, %Str %0)
  call void () @skip ()
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  ret i1 %2
}

define %AstId* @ast_id_new (%Str, %TokenInfo*) {
  %3 = call %Unit* (%Nat32) @malloc (%Nat32 16)
  %4 = bitcast %Unit* %3 to %AstId*; loadImmPtr
  %5 = inttoptr i64 0 to%AstId*
  %6 = icmp ne %AstId* %4, %5
  %7 = bitcast [11 x %Nat8]* @func193_str1 to %Str
  call void (i1, %Str) @assert (i1 %6, %Str %7)
  %8 = insertvalue %AstId zeroinitializer, %Str %0, 0
  %9 = insertvalue %AstId %8, %TokenInfo* %1, 1
  store %AstId %9, %AstId* %4, align 8
  ret %AstId* %4
}

define %AstId* @parse_id () {
  %1 = call %Token* () @func183 ()
  %2 = getelementptr inbounds %Token, %Token* %1, i1 0, i32 0
  %3 = load %TokenKind, %TokenKind* %2
  %4 = icmp ne %TokenKind %3, 1
  br i1 %4, label %then_0, label %else_0
then_0:
  %5 = bitcast [13 x %Nat8]* @func194_str1 to %Str
  %6 = getelementptr inbounds %Token, %Token* %1, i1 0, i32 1
  call void (%Str, %TokenInfo*) @error (%Str %5, %TokenInfo* %6); loadImmPtr
  %7 = inttoptr i64 0 to%AstId*
  ret %AstId* %7
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %9 = getelementptr inbounds %Token, %Token* %1, i1 0, i32 2
; index array
  %10 = getelementptr inbounds [0 x %Nat8], [0 x %Nat8]* %9, i1 0, %Int64 0
  %11 = bitcast %Nat8* %10 to %Str
  %12 = getelementptr inbounds %Token, %Token* %1, i1 0, i32 1
  %13 = call %AstId* (%Str, %TokenInfo*) @ast_id_new (%Str %11, %TokenInfo* %12)
  call void () @skip ()
  ret %AstId* %13
}

define %AstName @parse_name () {
  %1 = alloca %AstName
  store %AstName zeroinitializer, %AstName* %1, align 8
  %2 = getelementptr inbounds %AstName, %AstName* %1, i1 0, i32 2
  %3 = call %Token* () @func183 ()
  %4 = getelementptr inbounds %Token, %Token* %3, i1 0, i32 1
  store %TokenInfo* %4, %TokenInfo** %2, align 8
  %5 = call %AstId* () @parse_id ()
  %6 = bitcast [2 x %Nat8]* @func195_str1 to %Str
  %7 = call i1 (%Str) @func191 (%Str %6)
  br i1 %7, label %then_0, label %else_0
then_0:
  %8 = getelementptr inbounds %AstName, %AstName* %1, i1 0, i32 0
  %9 = call %AstId* () @parse_id ()
  store %AstId* %9, %AstId** %8, align 8
  %10 = getelementptr inbounds %AstName, %AstName* %1, i1 0, i32 1
  store %AstId* %5, %AstId** %10, align 8
  br label %endif_0
else_0:
  %11 = getelementptr inbounds %AstName, %AstName* %1, i1 0, i32 0
  store %AstId* %5, %AstId** %11, align 8
  %12 = getelementptr inbounds %AstName, %AstName* %1, i1 0, i32 1; loadImmPtr
  %13 = inttoptr i64 0 to%AstId*
  store %AstId* %13, %AstId** %12, align 8
  br label %endif_0
endif_0:
  %14 = load %AstName, %AstName* %1
  ret %AstName %14
}

define %union.1* @ast_node_boxing (%union.1) {
  %2 = call %Unit* (%Nat32) @malloc (%Nat32 32)
  %3 = bitcast %Unit* %2 to %union.1*; loadImmPtr
  %4 = inttoptr i64 0 to%union.1*
  %5 = icmp ne %union.1* %3, %4
  %6 = bitcast [16 x %Nat8]* @func196_str1 to %Str
  call void (i1, %Str) @assert (i1 %5, %Str %6)
  store %union.1 %0, %union.1* %3, align 32
  ret %union.1* %3
}

define %union.0 @parse (%Str) {
  %2 = alloca %List
  store %List zeroinitializer, %List* %2, align 8
  %3 = getelementptr inbounds %List, %List* %2, i1 0
  call void (%List*) @map_init (%List* %3)
  %4 = getelementptr inbounds %ParserState, %ParserState* @pstat, i1 0, i32 0
  %5 = call %Source* (%Str) @tokenize (%Str %0)
  store %Source* %5, %Source** %4, align 8
  %6 = getelementptr inbounds %ParserState, %ParserState* @pstat, i1 0, i32 1
  %7 = getelementptr inbounds %ParserState, %ParserState* @pstat, i1 0, i32 0
  %8 = load %Source*, %Source** %7
  %9 = getelementptr inbounds %Source, %Source* %8, i1 0, i32 0
  %10 = getelementptr inbounds %List, %List* %9, i1 0, i32 0
  %11 = load %Node*, %Node** %10
  store %Node* %11, %Node** %6, align 8
  br label %again_0
again_0:
  br i1 1, label %body_0, label %break_0
body_0:
  %12 = call %Token* () @func183 ()
  %13 = getelementptr inbounds %Token, %Token* %12, i1 0, i32 0
  %14 = load %TokenKind, %TokenKind* %13
  %15 = icmp eq %TokenKind %14, 0
  br i1 %15, label %then_0, label %else_0
then_0:
  br label %break_0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %17 = getelementptr inbounds %Token, %Token* %12, i1 0, i32 0
  %18 = load %TokenKind, %TokenKind* %17
  %19 = icmp eq %TokenKind %18, 6
  br i1 %19, label %then_1, label %else_1
then_1:
  call void () @skip ()
  br label %again_0
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  %21 = getelementptr inbounds %Token, %Token* %12, i1 0, i32 0
  %22 = load %TokenKind, %TokenKind* %21
  %23 = icmp eq %TokenKind %22, 5
  br i1 %23, label %then_2, label %else_2
then_2:
  call void () @skip ()
  br label %again_0
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
  %25 = bitcast [7 x %Nat8]* @func197_str1 to %Str
  %26 = call i1 (%Str) @func191 (%Str %25)
  br i1 %26, label %then_3, label %else_3
then_3:
  %27 = call %AstNodeImport () @func198 ()
  %28 = alloca %union.1
; write variant 5
  %29 = getelementptr inbounds %union.1, %union.1* %28, i1 0, i32 0
  store %Int16 5, %Int16* %29, align 2
; write data
  %30 = getelementptr inbounds %union.1, %union.1* %28, i1 0, i32 1
  %31 = bitcast [24 x %Nat8]* %30 to %AstNodeImport*
  store %AstNodeImport %27, %AstNodeImport* %31, align 8
  %32 = load %union.1, %union.1* %28
  %33 = call %union.1* (%union.1) @ast_node_boxing (%union.1 %32)
  %34 = getelementptr inbounds %List, %List* %2, i1 0
  %35 = bitcast %union.1* %33 to %Unit*
  %36 = call i1 (%List*, %Unit*) @list_append (%List* %34, %Unit* %35)
  br label %again_0
  br label %endif_3
else_3:
  br label %break_0
  br label %endif_3
endif_3:
  br label %again_0
break_0:
  br label %again_1
again_1:
  br i1 1, label %body_1, label %break_1
body_1:
  %39 = call %Token* () @func183 ()
  %40 = getelementptr inbounds %Token, %Token* %39, i1 0, i32 0
  %41 = load %TokenKind, %TokenKind* %40
  %42 = icmp eq %TokenKind %41, 0
  br i1 %42, label %then_4, label %else_4
then_4:
  br label %break_1
  br label %endif_4
else_4:
  br label %endif_4
endif_4:
  %44 = getelementptr inbounds %Token, %Token* %39, i1 0, i32 0
  %45 = load %TokenKind, %TokenKind* %44
  %46 = icmp eq %TokenKind %45, 6
  br i1 %46, label %then_5, label %else_5
then_5:
  call void () @skip ()
  br label %again_1
  br label %endif_5
else_5:
  br label %endif_5
endif_5:
  %48 = getelementptr inbounds %Token, %Token* %39, i1 0, i32 0
  %49 = load %TokenKind, %TokenKind* %48
  %50 = icmp eq %TokenKind %49, 5
  br i1 %50, label %then_6, label %else_6
then_6:
  call void () @skip ()
  br label %again_1
  br label %endif_6
else_6:
  br label %endif_6
endif_6:
  %52 = bitcast [8 x %Nat8]* @func197_str2 to %Str
  %53 = call i1 (%Str) @func191 (%Str %52)
  %54 = bitcast [6 x %Nat8]* @func197_str3 to %Str
  %55 = call i1 (%Str) @func191 (%Str %54)
  br i1 %55, label %then_7, label %else_7
then_7:
  %56 = call %Token* () @func183 ()
  %57 = getelementptr inbounds %Token, %Token* %56, i1 0, i32 2
; index array
  %58 = getelementptr inbounds [0 x %Nat8], [0 x %Nat8]* %57, i1 0, %Int64 0
  %59 = load %Nat8, %Nat8* %58
  %60 = call i1 (%Nat8) @isUpperCase (%Nat8 %59)
  br i1 %60, label %then_8, label %else_8
then_8:
  %61 = call %AstId* () @parse_id ()
  %62 = call %Unit* (%Nat32) @malloc (%Nat32 8)
  %63 = bitcast %Unit* %62 to %AstNodeDeclType*
  %64 = getelementptr inbounds %AstNodeDeclType, %AstNodeDeclType* %63, i1 0, i32 0
  store %AstId* %61, %AstId** %64, align 8
  %65 = insertvalue %AstNodeDeclType zeroinitializer, %AstId* %61, 0
  %66 = alloca %union.1
; write variant 2
  %67 = getelementptr inbounds %union.1, %union.1* %66, i1 0, i32 0
  store %Int16 2, %Int16* %67, align 2
; write data
  %68 = getelementptr inbounds %union.1, %union.1* %66, i1 0, i32 1
  %69 = bitcast [24 x %Nat8]* %68 to %AstNodeDeclType*
  store %AstNodeDeclType %65, %AstNodeDeclType* %69, align 8
  %70 = load %union.1, %union.1* %66
  %71 = call %union.1* (%union.1) @ast_node_boxing (%union.1 %70)
  %72 = getelementptr inbounds %List, %List* %2, i1 0
  %73 = bitcast %union.1* %71 to %Unit*
  %74 = call i1 (%List*, %Unit*) @list_append (%List* %72, %Unit* %73)
  br label %endif_8
else_8:
  %75 = call %Unit* (%Nat32) @malloc (%Nat32 8)
  %76 = bitcast %Unit* %75 to %AstNodeDeclVar*
  %77 = getelementptr inbounds %AstNodeDeclVar, %AstNodeDeclVar* %76, i1 0, i32 0
  %78 = call %AstDecl* (i1) @func209 (i1 0)
  store %AstDecl* %78, %AstDecl** %77, align 8
  %79 = getelementptr inbounds %AstNodeDeclVar, %AstNodeDeclVar* %76, i1 0, i32 0
  %80 = load %AstDecl*, %AstDecl** %79
  %81 = insertvalue %AstNodeDeclValue zeroinitializer, %AstDecl* %80, 0
  %82 = alloca %union.1
; write variant 0
  %83 = getelementptr inbounds %union.1, %union.1* %82, i1 0, i32 0
  store %Int16 0, %Int16* %83, align 2
; write data
  %84 = getelementptr inbounds %union.1, %union.1* %82, i1 0, i32 1
  %85 = bitcast [24 x %Nat8]* %84 to %AstNodeDeclValue*
  store %AstNodeDeclValue %81, %AstNodeDeclValue* %85, align 8
  %86 = load %union.1, %union.1* %82
  %87 = call %union.1* (%union.1) @ast_node_boxing (%union.1 %86)
  %88 = getelementptr inbounds %List, %List* %2, i1 0
  %89 = bitcast %union.1* %87 to %Unit*
  %90 = call i1 (%List*, %Unit*) @list_append (%List* %88, %Unit* %89)
  br label %endif_8
endif_8:
  br label %again_1
  br label %endif_7
else_7:
  %92 = bitcast [7 x %Nat8]* @func197_str4 to %Str
  %93 = call i1 (%Str) @func191 (%Str %92)
  br i1 %93, label %then_9, label %else_9
then_9:
  %94 = call %AstDecl* (i1) @func209 (i1 0)
  %95 = getelementptr inbounds %AstDecl, %AstDecl* %94, i1 0, i32 1
  %96 = load %union.2*, %union.2** %95
  %97 = insertvalue %AstValueFunc zeroinitializer, %union.2* %96, 0
  %98 = inttoptr %Unit zeroinitializer to %union.3
  %99 = insertvalue %AstValueFunc %97, %union.3 %98, 1
  %100 = alloca %union.4
; write variant 31
  %101 = getelementptr inbounds %union.4, %union.4* %100, i1 0, i32 0
  store %Int16 31, %Int16* %101, align 2
; write data
  %102 = getelementptr inbounds %union.4, %union.4* %100, i1 0, i32 1
  %103 = bitcast [56 x %Nat8]* %102 to %AstValueFunc*
  store %AstValueFunc %99, %AstValueFunc* %103, align 16
  %104 = load %union.4, %union.4* %100
  %105 = call %union.4* (%union.4) @func210 (%union.4 %104)
  %106 = call %Unit* (%Nat32) @malloc (%Nat32 24)
  %107 = bitcast %Unit* %106 to %AstNodeBindValue*
  %108 = getelementptr inbounds %AstDecl, %AstDecl* %94, i1 0, i32 0
  %109 = getelementptr inbounds %List, %List* %108, i1 0, i32 0
  %110 = load %Node*, %Node** %109
  %111 = getelementptr inbounds %Node, %Node* %110, i1 0, i32 3
  %112 = load %Unit*, %Unit** %111
  %113 = bitcast %Unit* %112 to %AstId*
  %114 = insertvalue %AstNodeBindValue zeroinitializer, %AstId* %113, 0
  %115 = insertvalue %AstNodeBindValue %114, %union.4* %105, 1
  %116 = getelementptr inbounds %AstDecl, %AstDecl* %94, i1 0, i32 2
  %117 = load %TokenInfo*, %TokenInfo** %116
  %118 = insertvalue %AstNodeBindValue %115, %TokenInfo* %117, 2
  store %AstNodeBindValue %118, %AstNodeBindValue* %107, align 8
  %119 = getelementptr inbounds %AstNodeBindValue, %AstNodeBindValue* %107, i1 0, i32 0
  %120 = load %AstId*, %AstId** %119
  %121 = insertvalue %AstNodeBindValue zeroinitializer, %AstId* %120, 0
  %122 = insertvalue %AstNodeBindValue %121, %union.4* %105, 1
  %123 = getelementptr inbounds %AstNodeBindValue, %AstNodeBindValue* %107, i1 0, i32 2
  %124 = load %TokenInfo*, %TokenInfo** %123
  %125 = insertvalue %AstNodeBindValue %122, %TokenInfo* %124, 2
  %126 = alloca %union.1
; write variant 3
  %127 = getelementptr inbounds %union.1, %union.1* %126, i1 0, i32 0
  store %Int16 3, %Int16* %127, align 2
; write data
  %128 = getelementptr inbounds %union.1, %union.1* %126, i1 0, i32 1
  %129 = bitcast [24 x %Nat8]* %128 to %AstNodeBindValue*
  store %AstNodeBindValue %125, %AstNodeBindValue* %129, align 8
  %130 = load %union.1, %union.1* %126
  %131 = call %union.1* (%union.1) @ast_node_boxing (%union.1 %130)
  %132 = getelementptr inbounds %List, %List* %2, i1 0
  %133 = bitcast %union.1* %131 to %Unit*
  %134 = call i1 (%List*, %Unit*) @list_append (%List* %132, %Unit* %133)
  br label %again_1
  br label %endif_9
else_9:
  br label %endif_9
endif_9:
  br label %endif_7
endif_7:
  %136 = getelementptr inbounds %Token, %Token* %39, i1 0, i32 2
; index array
  %137 = getelementptr inbounds [0 x %Nat8], [0 x %Nat8]* %136, i1 0, %Int64 0
  %138 = load %Nat8, %Nat8* %137
  %139 = call i1 (%Nat8) @isAlpha (%Nat8 %138)
  br i1 %139, label %then_10, label %else_10
then_10:
  %140 = getelementptr inbounds %Token, %Token* %39, i1 0, i32 2
; index array
  %141 = getelementptr inbounds [0 x %Nat8], [0 x %Nat8]* %140, i1 0, %Int64 0
  %142 = load %Nat8, %Nat8* %141
  %143 = call i1 (%Nat8) @isUpperCase (%Nat8 %142)
  br i1 %143, label %then_11, label %else_11
then_11:
  %144 = call %AstNodeBindType () @func199 ()
  %145 = alloca %union.1
; write variant 4
  %146 = getelementptr inbounds %union.1, %union.1* %145, i1 0, i32 0
  store %Int16 4, %Int16* %146, align 2
; write data
  %147 = getelementptr inbounds %union.1, %union.1* %145, i1 0, i32 1
  %148 = bitcast [24 x %Nat8]* %147 to %AstNodeBindType*
  store %AstNodeBindType %144, %AstNodeBindType* %148, align 8
  %149 = load %union.1, %union.1* %145
  %150 = call %union.1* (%union.1) @ast_node_boxing (%union.1 %149)
  %151 = getelementptr inbounds %List, %List* %2, i1 0
  %152 = bitcast %union.1* %150 to %Unit*
  %153 = call i1 (%List*, %Unit*) @list_append (%List* %151, %Unit* %152)
  br label %endif_11
else_11:
  %154 = call %AstNodeBindValue () @func200 ()
  %155 = alloca %union.1
; write variant 3
  %156 = getelementptr inbounds %union.1, %union.1* %155, i1 0, i32 0
  store %Int16 3, %Int16* %156, align 2
; write data
  %157 = getelementptr inbounds %union.1, %union.1* %155, i1 0, i32 1
  %158 = bitcast [24 x %Nat8]* %157 to %AstNodeBindValue*
  store %AstNodeBindValue %154, %AstNodeBindValue* %158, align 8
  %159 = load %union.1, %union.1* %155
  %160 = call %union.1* (%union.1) @ast_node_boxing (%union.1 %159)
  %161 = getelementptr inbounds %List, %List* %2, i1 0
  %162 = bitcast %union.1* %160 to %Unit*
  %163 = call i1 (%List*, %Unit*) @list_append (%List* %161, %Unit* %162)
  br label %endif_11
endif_11:
  br label %endif_10
else_10:
  br label %endif_10
endif_10:
  br label %again_1
break_1:
  %164 = load %Int32, %Int32* @errcnt
  %165 = icmp sgt %Int32 %164, 0
  br i1 %165, label %then_12, label %else_12
then_12:
  %166 = alloca %union.0
; write variant 1
  %167 = getelementptr inbounds %union.0, %union.0* %166, i1 0, i32 0
  store %Int16 1, %Int16* %167, align 2
; write data
  %168 = getelementptr inbounds %union.0, %union.0* %166, i1 0, i32 1
  %169 = bitcast [40 x %Nat8]* %168 to %ParserError*
  store %ParserError 0, %ParserError* %169, align 2
  %170 = load %union.0, %union.0* %166
  ret %union.0 %170
  br label %endif_12
else_12:
  br label %endif_12
endif_12:
  %172 = load %List, %List* %2
  %173 = insertvalue %AstModule zeroinitializer, %List %172, 0
  %174 = getelementptr inbounds %ParserState, %ParserState* @pstat, i1 0, i32 0
  %175 = load %Source*, %Source** %174
  %176 = insertvalue %AstModule %173, %Source* %175, 1
  %177 = alloca %union.0
; write variant 0
  %178 = getelementptr inbounds %union.0, %union.0* %177, i1 0, i32 0
  store %Int16 0, %Int16* %178, align 2
; write data
  %179 = getelementptr inbounds %union.0, %union.0* %177, i1 0, i32 1
  %180 = bitcast [40 x %Nat8]* %179 to %AstModule*
  store %AstModule %176, %AstModule* %180, align 8
  %181 = load %union.0, %union.0* %177
  ret %union.0 %181
}

define %AstNodeImport @func198 () {
  %1 = call %Token* () @func183 ()
  %2 = getelementptr inbounds %Token, %Token* %1, i1 0, i32 2
; index array
  %3 = getelementptr inbounds [0 x %Nat8], [0 x %Nat8]* %2, i1 0, %Int64 0
  %4 = bitcast %Nat8* %3 to %Str
  %5 = call %Str (%Str) @dup (%Str %4)
  %6 = getelementptr inbounds %Token, %Token* %1, i1 0, i32 1
  call void () @skip ()
  %7 = insertvalue %AstNodeImport zeroinitializer, %Str %5, 0
  %8 = insertvalue %AstNodeImport %7, %TokenInfo* %6, 1
  ret %AstNodeImport %8
}

define %AstNodeBindType @func199 () {
  %1 = call %AstId* () @parse_id ()
  %2 = call %Token* () @func183 ()
  %3 = getelementptr inbounds %Token, %Token* %2, i1 0, i32 1
  %4 = bitcast [2 x %Nat8]* @func199_str1 to %Str
  %5 = call i1 (%Str) @need (%Str %4)
  %6 = call %union.2* () @func202 ()
  %7 = insertvalue %AstNodeBindType zeroinitializer, %AstId* %1, 0
  %8 = insertvalue %AstNodeBindType %7, %union.2* %6, 1
  %9 = insertvalue %AstNodeBindType %8, %TokenInfo* %3, 2
  ret %AstNodeBindType %9
}

define %AstNodeBindValue @func200 () {
  %1 = call %AstId* () @parse_id ()
  %2 = call %Token* () @func183 ()
  %3 = getelementptr inbounds %Token, %Token* %2, i1 0, i32 1
  %4 = bitcast [2 x %Nat8]* @func200_str1 to %Str
  %5 = call i1 (%Str) @need (%Str %4)
  %6 = call %union.4* () @func211 ()
  %7 = insertvalue %AstNodeBindValue zeroinitializer, %AstId* %1, 0
  %8 = insertvalue %AstNodeBindValue %7, %union.4* %6, 1
  %9 = insertvalue %AstNodeBindValue %8, %TokenInfo* %3, 2
  ret %AstNodeBindValue %9
}

define %union.2* @ast_type_new (%union.2) {
  %2 = call %Unit* (%Nat32) @malloc (%Nat32 64)
  %3 = bitcast %Unit* %2 to %union.2*; loadImmPtr
  %4 = inttoptr i64 0 to%union.2*
  %5 = icmp ne %union.2* %3, %4
  %6 = bitcast [18 x %Nat8]* @func201_str1 to %Str
  call void (i1, %Str) @assert (i1 %5, %Str %6)
  store %union.2 %0, %union.2* %3, align 64
  ret %union.2* %3
}

define %union.2* @func202 () {
  %1 = call %union.2* () @func203 ()
  %2 = call %Token* () @func183 ()
  %3 = bitcast [3 x %Nat8]* @func202_str1 to %Str
  %4 = call i1 (%Str) @func191 (%Str %3)
  br i1 %4, label %then_0, label %else_0
then_0:
  %5 = call %union.2* () @func202 ()
  %6 = insertvalue %AstTypeFunc zeroinitializer, %union.2* %1, 0
  %7 = insertvalue %AstTypeFunc %6, %union.2* %5, 1
  %8 = getelementptr inbounds %Token, %Token* %2, i1 0, i32 1
  %9 = insertvalue %AstTypeFunc %7, %TokenInfo* %8, 3
  %10 = alloca %union.2
; write variant 3
  %11 = getelementptr inbounds %union.2, %union.2* %10, i1 0, i32 0
  store %Int16 3, %Int16* %11, align 2
; write data
  %12 = getelementptr inbounds %union.2, %union.2* %10, i1 0, i32 1
  %13 = bitcast [40 x %Nat8]* %12 to %AstTypeFunc*
  store %AstTypeFunc %9, %AstTypeFunc* %13, align 8
  %14 = load %union.2, %union.2* %10
  %15 = call %union.2* (%union.2) @ast_type_new (%union.2 %14)
  ret %union.2* %15
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  ret %union.2* %1
}

define %union.2* @func203 () {
  %1 = call %union.2* () @func204 ()
  %2 = call %Token* () @func183 ()
  %3 = bitcast [3 x %Nat8]* @func203_str1 to %Str
  %4 = call i1 (%Str) @func191 (%Str %3)
  br i1 %4, label %then_0, label %else_0
then_0:
  call void () @skip_nl ()
  %5 = call %union.2* () @func203 ()
  %6 = insertvalue %AstTypeBinary zeroinitializer, %union.2* %1, 0
  %7 = insertvalue %AstTypeBinary %6, %union.2* %5, 1
  %8 = getelementptr inbounds %Token, %Token* %2, i1 0, i32 1
  %9 = insertvalue %AstTypeBinary %7, %TokenInfo* %8, 2
  %10 = alloca %union.2
; write variant 9
  %11 = getelementptr inbounds %union.2, %union.2* %10, i1 0, i32 0
  store %Int16 9, %Int16* %11, align 2
; write data
  %12 = getelementptr inbounds %union.2, %union.2* %10, i1 0, i32 1
  %13 = bitcast [40 x %Nat8]* %12 to %AstTypeBinary*
  store %AstTypeBinary %9, %AstTypeBinary* %13, align 8
  %14 = load %union.2, %union.2* %10
  %15 = call %union.2* (%union.2) @ast_type_new (%union.2 %14)
  ret %union.2* %15
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  ret %union.2* %1
}

define %union.2* @func204 () {
  %1 = call %Token* () @func183 ()
  %2 = bitcast [2 x %Nat8]* @func204_str1 to %Str
  %3 = call i1 (%Str) @func191 (%Str %2)
  br i1 %3, label %then_0, label %else_0
then_0:
  %4 = call %union.2* () @func204 ()
  %5 = insertvalue %AstTypePointer zeroinitializer, %union.2* %4, 0
  %6 = getelementptr inbounds %Token, %Token* %1, i1 0, i32 1
  %7 = insertvalue %AstTypePointer %5, %TokenInfo* %6, 1
  %8 = alloca %union.2
; write variant 4
  %9 = getelementptr inbounds %union.2, %union.2* %8, i1 0, i32 0
  store %Int16 4, %Int16* %9, align 2
; write data
  %10 = getelementptr inbounds %union.2, %union.2* %8, i1 0, i32 1
  %11 = bitcast [40 x %Nat8]* %10 to %AstTypePointer*
  store %AstTypePointer %7, %AstTypePointer* %11, align 8
  %12 = load %union.2, %union.2* %8
  %13 = call %union.2* (%union.2) @ast_type_new (%union.2 %12)
  ret %union.2* %13
  br label %endif_0
else_0:
  %15 = bitcast [2 x %Nat8]* @func204_str2 to %Str
  %16 = call i1 (%Str) @func191 (%Str %15)
  br i1 %16, label %then_1, label %else_1
then_1:
  %17 = bitcast [2 x %Nat8]* @func204_str3 to %Str
  %18 = call i1 (%Str) @func191 (%Str %17)
  br i1 %18, label %then_2, label %else_2
then_2:
  %19 = call %union.2* () @func204 ()
  %20 = insertvalue %AstTypeArrayU zeroinitializer, %union.2* %19, 0
  %21 = getelementptr inbounds %Token, %Token* %1, i1 0, i32 1
  %22 = insertvalue %AstTypeArrayU %20, %TokenInfo* %21, 1
  %23 = alloca %union.2
; write variant 5
  %24 = getelementptr inbounds %union.2, %union.2* %23, i1 0, i32 0
  store %Int16 5, %Int16* %24, align 2
; write data
  %25 = getelementptr inbounds %union.2, %union.2* %23, i1 0, i32 1
  %26 = bitcast [40 x %Nat8]* %25 to %AstTypeArrayU*
  store %AstTypeArrayU %22, %AstTypeArrayU* %26, align 8
  %27 = load %union.2, %union.2* %23
  %28 = call %union.2* (%union.2) @ast_type_new (%union.2 %27)
  ret %union.2* %28
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
  %30 = call %union.4* () @func211 ()
  %31 = bitcast [2 x %Nat8]* @func204_str4 to %Str
  %32 = call i1 (%Str) @need (%Str %31)
  %33 = call %union.2* () @func204 ()
  %34 = insertvalue %AstTypeArray zeroinitializer, %union.2* %33, 0
  %35 = insertvalue %AstTypeArray %34, %union.4* %30, 1
  %36 = getelementptr inbounds %Token, %Token* %1, i1 0, i32 1
  %37 = insertvalue %AstTypeArray %35, %TokenInfo* %36, 2
  %38 = alloca %union.2
; write variant 6
  %39 = getelementptr inbounds %union.2, %union.2* %38, i1 0, i32 0
  store %Int16 6, %Int16* %39, align 2
; write data
  %40 = getelementptr inbounds %union.2, %union.2* %38, i1 0, i32 1
  %41 = bitcast [40 x %Nat8]* %40 to %AstTypeArray*
  store %AstTypeArray %37, %AstTypeArray* %41, align 8
  %42 = load %union.2, %union.2* %38
  %43 = call %union.2* (%union.2) @ast_type_new (%union.2 %42)
  ret %union.2* %43
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  br label %endif_0
endif_0:
  %45 = call %union.2* () @func205 ()
  ret %union.2* %45
}

define %union.2* @func205 () {
  %1 = call %Token* () @func183 ()
  %2 = bitcast [2 x %Nat8]* @func205_str1 to %Str
  %3 = call i1 (%Str) @func191 (%Str %2)
  br i1 %3, label %then_0, label %else_0
then_0:
  %4 = bitcast [2 x %Nat8]* @func205_str2 to %Str
  %5 = call i1 (%Str) @look (%Str %4)
  %6 = call i1 () @func248 ()
  %7 = or i1 %5, %6
  br i1 %7, label %then_1, label %else_1
then_1:
  %8 = call %union.2* () @func208 ()
  ret %union.2* %8
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  %10 = call %union.2* () @func202 ()
  %11 = bitcast [2 x %Nat8]* @func205_str3 to %Str
  %12 = call i1 (%Str) @need (%Str %11)
  ret %union.2* %10
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %14 = call %union.2* () @func206 ()
  ret %union.2* %14
}

define %union.2* @func206 () {
  %1 = bitcast [2 x %Nat8]* @func206_str1 to %Str
  %2 = call i1 (%Str) @func191 (%Str %1)
  br i1 %2, label %then_0, label %else_0
then_0:
  %3 = call %union.2* () @func207 ()
  ret %union.2* %3
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %5 = call %Token* () @func183 ()
  %6 = bitcast [8 x %Nat8]* @func206_str2 to %Str
  %7 = call i1 (%Str) @func191 (%Str %6)
  br i1 %7, label %then_1, label %else_1
then_1:
  %8 = call %union.2* () @func202 ()
  %9 = insertvalue %AstTypeNewType zeroinitializer, %union.2* %8, 0
  %10 = getelementptr inbounds %Token, %Token* %5, i1 0, i32 1
  %11 = insertvalue %AstTypeNewType %9, %TokenInfo* %10, 1
  %12 = alloca %union.2
; write variant 0
  %13 = getelementptr inbounds %union.2, %union.2* %12, i1 0, i32 0
  store %Int16 0, %Int16* %13, align 2
; write data
  %14 = getelementptr inbounds %union.2, %union.2* %12, i1 0, i32 1
  %15 = bitcast [40 x %Nat8]* %14 to %AstTypeNewType*
  store %AstTypeNewType %11, %AstTypeNewType* %15, align 8
  %16 = load %union.2, %union.2* %12
  %17 = call %union.2* (%union.2) @ast_type_new (%union.2 %16)
  ret %union.2* %17
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  %19 = bitcast [4 x %Nat8]* @func206_str3 to %Str
  %20 = call i1 (%Str) @func191 (%Str %19)
  br i1 %20, label %then_2, label %else_2
then_2:
  %21 = call %union.2* () @func202 ()
  %22 = insertvalue %AstTypeVar zeroinitializer, %union.2* %21, 0
  %23 = getelementptr inbounds %Token, %Token* %5, i1 0, i32 1
  %24 = insertvalue %AstTypeVar %22, %TokenInfo* %23, 1
  %25 = alloca %union.2
; write variant 2
  %26 = getelementptr inbounds %union.2, %union.2* %25, i1 0, i32 0
  store %Int16 2, %Int16* %26, align 2
; write data
  %27 = getelementptr inbounds %union.2, %union.2* %25, i1 0, i32 1
  %28 = bitcast [40 x %Nat8]* %27 to %AstTypeVar*
  store %AstTypeVar %24, %AstTypeVar* %28, align 8
  %29 = load %union.2, %union.2* %25
  %30 = call %union.2* (%union.2) @ast_type_new (%union.2 %29)
  ret %union.2* %30
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
  %32 = call %AstName () @parse_name ()
  %33 = alloca %union.2
; write variant 11
  %34 = getelementptr inbounds %union.2, %union.2* %33, i1 0, i32 0
  store %Int16 11, %Int16* %34, align 2
; write data
  %35 = getelementptr inbounds %union.2, %union.2* %33, i1 0, i32 1
  %36 = bitcast [40 x %Nat8]* %35 to %AstName*
  store %AstName %32, %AstName* %36, align 8
  %37 = load %union.2, %union.2* %33
  %38 = call %union.2* (%union.2) @ast_type_new (%union.2 %37)
  ret %union.2* %38
}

define %union.2* @func207 () {
  %1 = call %Token* () @func183 ()
  %2 = alloca %List
  store %List zeroinitializer, %List* %2, align 8
  %3 = getelementptr inbounds %List, %List* %2, i1 0
  call void (%List*) @map_init (%List* %3)
  call void () @skip_nl ()
  br label %again_0
again_0:
  br i1 1, label %body_0, label %break_0
body_0:
  call void () @skip_nl ()
  %4 = call %Token* () @func183 ()
  %5 = getelementptr inbounds %Token, %Token* %4, i1 0, i32 1
  %6 = call %AstId* () @parse_id ()
  %7 = getelementptr inbounds %List, %List* %2, i1 0
  %8 = bitcast %AstId* %6 to %Unit*
  %9 = call i1 (%List*, %Unit*) @list_append (%List* %7, %Unit* %8)
  %10 = call %Token* () @func183 ()
  %11 = getelementptr inbounds %Token, %Token* %10, i1 0, i32 1
  %12 = bitcast [2 x %Nat8]* @func207_str1 to %Str
  %13 = call i1 (%Str) @func191 (%Str %12)
  br i1 %13, label %then_0, label %else_0
then_0:
  br label %again_0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %15 = bitcast [2 x %Nat8]* @func207_str2 to %Str
  %16 = call i1 (%Str) @func191 (%Str %15)
  call void () @skip_nl ()
  %17 = bitcast [2 x %Nat8]* @func207_str3 to %Str
  %18 = call i1 (%Str) @func191 (%Str %17)
  br i1 %18, label %then_1, label %else_1
then_1:
  br label %break_0
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  %20 = xor i1 %16, 1
  br i1 %20, label %then_2, label %else_2
then_2:
  %21 = bitcast [37 x %Nat8]* @func207_str4 to %Str
  call void (%Str, %TokenInfo*) @error (%Str %21, %TokenInfo* %11)
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
  br label %again_0
break_0:
  %22 = load %List, %List* %2
  %23 = insertvalue %AstTypeEnum zeroinitializer, %List %22, 0
  %24 = getelementptr inbounds %Token, %Token* %1, i1 0, i32 1
  %25 = insertvalue %AstTypeEnum %23, %TokenInfo* %24, 1
  %26 = alloca %union.2
; write variant 10
  %27 = getelementptr inbounds %union.2, %union.2* %26, i1 0, i32 0
  store %Int16 10, %Int16* %27, align 2
; write data
  %28 = getelementptr inbounds %union.2, %union.2* %26, i1 0, i32 1
  %29 = bitcast [40 x %Nat8]* %28 to %AstTypeEnum*
  store %AstTypeEnum %25, %AstTypeEnum* %29, align 8
  %30 = load %union.2, %union.2* %26
  %31 = call %union.2* (%union.2) @ast_type_new (%union.2 %30)
  ret %union.2* %31
}

define %union.2* @func208 () {
  %1 = call %Token* () @func183 ()
  %2 = alloca %List
  store %List zeroinitializer, %List* %2, align 8
  %3 = getelementptr inbounds %List, %List* %2, i1 0
  call void (%List*) @map_init (%List* %3)
  br label %again_0
again_0:
  br i1 1, label %body_0, label %break_0
body_0:
  call void () @skip_nl ()
  %4 = bitcast [2 x %Nat8]* @func208_str1 to %Str
  %5 = call i1 (%Str) @func191 (%Str %4)
  br i1 %5, label %then_0, label %else_0
then_0:
  br label %break_0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %7 = call %Token* () @func183 ()
  %8 = getelementptr inbounds %Token, %Token* %7, i1 0, i32 1
  %9 = call %AstDecl* (i1) @func209 (i1 0); loadImmPtr
  %10 = inttoptr i64 0 to%AstDecl*
  %11 = icmp eq %AstDecl* %9, %10
  br i1 %11, label %then_1, label %else_1
then_1:
  %12 = bitcast [14 x %Nat8]* @func208_str2 to %Str
  call void (%Str, %TokenInfo*) @error (%Str %12, %TokenInfo* %8)
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  %13 = bitcast [2 x %Nat8]* @func208_str3 to %Str
  %14 = call i1 (%Str) @func191 (%Str %13)
  call void () @skip_nl ()
  %15 = getelementptr inbounds %List, %List* %2, i1 0
  %16 = bitcast %AstDecl* %9 to %Unit*
  %17 = call i1 (%List*, %Unit*) @list_append (%List* %15, %Unit* %16)
  br label %again_0
break_0:
  %18 = load %List, %List* %2
  %19 = insertvalue %AstTypeRecord zeroinitializer, %List %18, 0
  %20 = getelementptr inbounds %Token, %Token* %1, i1 0, i32 1
  %21 = insertvalue %AstTypeRecord %19, %TokenInfo* %20, 1
  %22 = alloca %union.2
; write variant 7
  %23 = getelementptr inbounds %union.2, %union.2* %22, i1 0, i32 0
  store %Int16 7, %Int16* %23, align 2
; write data
  %24 = getelementptr inbounds %union.2, %union.2* %22, i1 0, i32 1
  %25 = bitcast [40 x %Nat8]* %24 to %AstTypeRecord*
  store %AstTypeRecord %21, %AstTypeRecord* %25, align 8
  %26 = load %union.2, %union.2* %22
  %27 = call %union.2* (%union.2) @ast_type_new (%union.2 %26)
  ret %union.2* %27
}

define %AstDecl* @func209 (i1) {
  %2 = alloca %List
  store %List zeroinitializer, %List* %2, align 8
  %3 = getelementptr inbounds %List, %List* %2, i1 0
  call void (%List*) @map_init (%List* %3)
  br label %again_0
again_0:
  br i1 1, label %body_0, label %break_0
body_0:
  %4 = call %AstId* () @parse_id ()
  %5 = getelementptr inbounds %List, %List* %2, i1 0
  %6 = bitcast %AstId* %4 to %Unit*
  %7 = call i1 (%List*, %Unit*) @list_append (%List* %5, %Unit* %6)
  %8 = bitcast [2 x %Nat8]* @func209_str1 to %Str
  %9 = call i1 (%Str) @func191 (%Str %8)
  %10 = xor i1 %9, 1
  br i1 %10, label %then_0, label %else_0
then_0:
  br label %break_0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  call void () @skip_nl ()
  br label %again_0
break_0:
  %12 = call %Token* () @func183 ()
  %13 = getelementptr inbounds %Token, %Token* %12, i1 0, i32 1
  %14 = bitcast [2 x %Nat8]* @func209_str2 to %Str
  %15 = call i1 (%Str) @need (%Str %14)
  %16 = call %union.2* () @func202 ()
  %17 = call %Unit* (%Nat32) @malloc (%Nat32 56)
  %18 = bitcast %Unit* %17 to %AstDecl*
  %19 = load %List, %List* %2
  %20 = insertvalue %AstDecl zeroinitializer, %List %19, 0
  %21 = insertvalue %AstDecl %20, %union.2* %16, 1
  %22 = load i1, i1* @external
  %23 = insertvalue %AstDecl %21, i1 %22, 3
  %24 = load i1, i1* @xarghack
  %25 = insertvalue %AstDecl %23, i1 %24, 4
  %26 = insertvalue %AstDecl %25, %TokenInfo* %13, 2
  store %AstDecl %26, %AstDecl* %18, align 8
  ret %AstDecl* %18
}

define %union.4* @func210 (%union.4) {
  %2 = call %Unit* (%Nat32) @malloc (%Nat32 64)
  %3 = bitcast %Unit* %2 to %union.4*; loadImmPtr
  %4 = inttoptr i64 0 to%union.4*
  %5 = icmp ne %union.4* %3, %4
  %6 = bitcast [26 x %Nat8]* @func210_str1 to %Str
  call void (i1, %Str) @assert (i1 %5, %Str %6)
  store %union.4 %0, %union.4* %3, align 64
  ret %union.4* %3
}

define %union.4* @func211 () {
  %1 = alloca %union.4*
  %2 = call %union.4* () @func212 ()
  store %union.4* %2, %union.4** %1, align 8
  %3 = load %union.4*, %union.4** %1; loadImmPtr
  %4 = inttoptr i64 0 to%union.4*
  %5 = icmp eq %union.4* %3, %4
  br i1 %5, label %then_0, label %else_0
then_0:; loadImmPtr
  %6 = inttoptr i64 0 to%union.4*
  ret %union.4* %6
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %8 = call %Token* () @func183 ()
  %9 = getelementptr inbounds %Token, %Token* %8, i1 0, i32 1
  %10 = bitcast [3 x %Nat8]* @func211_str1 to %Str
  %11 = call i1 (%Str) @func191 (%Str %10)
  br i1 %11, label %then_1, label %else_1
then_1:
  call void () @skip_nl ()
  %12 = load %union.4*, %union.4** %1
  %13 = call %union.4* () @func211 ()
  %14 = insertvalue %AstValueBinary zeroinitializer, %union.4* %12, 0
  %15 = insertvalue %AstValueBinary %14, %union.4* %13, 1
  %16 = insertvalue %AstValueBinary %15, %TokenInfo* %9, 2
  %17 = alloca %union.4
; write variant 19
  %18 = getelementptr inbounds %union.4, %union.4* %17, i1 0, i32 0
  store %Int16 19, %Int16* %18, align 2
; write data
  %19 = getelementptr inbounds %union.4, %union.4* %17, i1 0, i32 1
  %20 = bitcast [56 x %Nat8]* %19 to %AstValueBinary*
  store %AstValueBinary %16, %AstValueBinary* %20, align 8
  %21 = load %union.4, %union.4* %17
  %22 = call %union.4* (%union.4) @func210 (%union.4 %21)
  store %union.4* %22, %union.4** %1, align 8
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  %23 = load %union.4*, %union.4** %1
  ret %union.4* %23
}

define %union.4* @func212 () {
  %1 = alloca %union.4*
  %2 = call %union.4* () @func213 ()
  store %union.4* %2, %union.4** %1, align 8
  %3 = load %union.4*, %union.4** %1; loadImmPtr
  %4 = inttoptr i64 0 to%union.4*
  %5 = icmp eq %union.4* %3, %4
  br i1 %5, label %then_0, label %else_0
then_0:; loadImmPtr
  %6 = inttoptr i64 0 to%union.4*
  ret %union.4* %6
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %8 = call %Token* () @func183 ()
  %9 = getelementptr inbounds %Token, %Token* %8, i1 0, i32 1
  %10 = bitcast [4 x %Nat8]* @func212_str1 to %Str
  %11 = call i1 (%Str) @func191 (%Str %10)
  br i1 %11, label %then_1, label %else_1
then_1:
  call void () @skip_nl ()
  %12 = load %union.4*, %union.4** %1
  %13 = call %union.4* () @func212 ()
  %14 = insertvalue %AstValueBinary zeroinitializer, %union.4* %12, 0
  %15 = insertvalue %AstValueBinary %14, %union.4* %13, 1
  %16 = insertvalue %AstValueBinary %15, %TokenInfo* %9, 2
  %17 = alloca %union.4
; write variant 18
  %18 = getelementptr inbounds %union.4, %union.4* %17, i1 0, i32 0
  store %Int16 18, %Int16* %18, align 2
; write data
  %19 = getelementptr inbounds %union.4, %union.4* %17, i1 0, i32 1
  %20 = bitcast [56 x %Nat8]* %19 to %AstValueBinary*
  store %AstValueBinary %16, %AstValueBinary* %20, align 8
  %21 = load %union.4, %union.4* %17
  %22 = call %union.4* (%union.4) @func210 (%union.4 %21)
  store %union.4* %22, %union.4** %1, align 8
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  %23 = load %union.4*, %union.4** %1
  ret %union.4* %23
}

define %union.4* @func213 () {
  %1 = alloca %union.4*
  %2 = call %union.4* () @func214 ()
  store %union.4* %2, %union.4** %1, align 8
  %3 = load %union.4*, %union.4** %1; loadImmPtr
  %4 = inttoptr i64 0 to%union.4*
  %5 = icmp eq %union.4* %3, %4
  br i1 %5, label %then_0, label %else_0
then_0:; loadImmPtr
  %6 = inttoptr i64 0 to%union.4*
  ret %union.4* %6
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %8 = call %Token* () @func183 ()
  %9 = getelementptr inbounds %Token, %Token* %8, i1 0, i32 1
  %10 = bitcast [4 x %Nat8]* @func213_str1 to %Str
  %11 = call i1 (%Str) @func191 (%Str %10)
  br i1 %11, label %then_1, label %else_1
then_1:
  call void () @skip_nl ()
  %12 = load %union.4*, %union.4** %1
  %13 = call %union.4* () @func213 ()
  %14 = insertvalue %AstValueBinary zeroinitializer, %union.4* %12, 0
  %15 = insertvalue %AstValueBinary %14, %union.4* %13, 1
  %16 = insertvalue %AstValueBinary %15, %TokenInfo* %9, 2
  %17 = alloca %union.4
; write variant 20
  %18 = getelementptr inbounds %union.4, %union.4* %17, i1 0, i32 0
  store %Int16 20, %Int16* %18, align 2
; write data
  %19 = getelementptr inbounds %union.4, %union.4* %17, i1 0, i32 1
  %20 = bitcast [56 x %Nat8]* %19 to %AstValueBinary*
  store %AstValueBinary %16, %AstValueBinary* %20, align 8
  %21 = load %union.4, %union.4* %17
  %22 = call %union.4* (%union.4) @func210 (%union.4 %21)
  store %union.4* %22, %union.4** %1, align 8
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  %23 = load %union.4*, %union.4** %1
  ret %union.4* %23
}

define %union.4* @func214 () {
  %1 = alloca %union.4*
  %2 = call %union.4* () @func215 ()
  store %union.4* %2, %union.4** %1, align 8
  %3 = load %union.4*, %union.4** %1; loadImmPtr
  %4 = inttoptr i64 0 to%union.4*
  %5 = icmp eq %union.4* %3, %4
  br i1 %5, label %then_0, label %else_0
then_0:; loadImmPtr
  %6 = inttoptr i64 0 to%union.4*
  ret %union.4* %6
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  br label %again_0
again_0:
  br i1 1, label %body_0, label %break_0
body_0:
  %8 = call %Token* () @func183 ()
  %9 = getelementptr inbounds %Token, %Token* %8, i1 0, i32 1
  %10 = bitcast [3 x %Nat8]* @func214_str1 to %Str
  %11 = call i1 (%Str) @func191 (%Str %10)
  br i1 %11, label %then_1, label %else_1
then_1:
  call void () @skip_nl ()
  %12 = load %union.4*, %union.4** %1
  %13 = call %union.4* () @func214 ()
  %14 = insertvalue %AstValueBinary zeroinitializer, %union.4* %12, 0
  %15 = insertvalue %AstValueBinary %14, %union.4* %13, 1
  %16 = insertvalue %AstValueBinary %15, %TokenInfo* %9, 2
  %17 = alloca %union.4
; write variant 17
  %18 = getelementptr inbounds %union.4, %union.4* %17, i1 0, i32 0
  store %Int16 17, %Int16* %18, align 2
; write data
  %19 = getelementptr inbounds %union.4, %union.4* %17, i1 0, i32 1
  %20 = bitcast [56 x %Nat8]* %19 to %AstValueBinary*
  store %AstValueBinary %16, %AstValueBinary* %20, align 8
  %21 = load %union.4, %union.4* %17
  %22 = call %union.4* (%union.4) @func210 (%union.4 %21)
  store %union.4* %22, %union.4** %1, align 8
  br label %endif_1
else_1:
  %23 = bitcast [3 x %Nat8]* @func214_str2 to %Str
  %24 = call i1 (%Str) @func191 (%Str %23)
  br i1 %24, label %then_2, label %else_2
then_2:
  call void () @skip_nl ()
  %25 = load %union.4*, %union.4** %1
  %26 = call %union.4* () @func214 ()
  %27 = insertvalue %AstValueBinary zeroinitializer, %union.4* %25, 0
  %28 = insertvalue %AstValueBinary %27, %union.4* %26, 1
  %29 = insertvalue %AstValueBinary %28, %TokenInfo* %9, 2
  %30 = alloca %union.4
; write variant 16
  %31 = getelementptr inbounds %union.4, %union.4* %30, i1 0, i32 0
  store %Int16 16, %Int16* %31, align 2
; write data
  %32 = getelementptr inbounds %union.4, %union.4* %30, i1 0, i32 1
  %33 = bitcast [56 x %Nat8]* %32 to %AstValueBinary*
  store %AstValueBinary %29, %AstValueBinary* %33, align 8
  %34 = load %union.4, %union.4* %30
  %35 = call %union.4* (%union.4) @func210 (%union.4 %34)
  store %union.4* %35, %union.4** %1, align 8
  br label %endif_2
else_2:
  br label %break_0
  br label %endif_2
endif_2:
  br label %endif_1
endif_1:
  br label %again_0
break_0:
  %37 = load %union.4*, %union.4** %1
  ret %union.4* %37
}

define %union.4* @func215 () {
  %1 = alloca %union.4*
  %2 = call %union.4* () @func216 ()
  store %union.4* %2, %union.4** %1, align 8
  %3 = load %union.4*, %union.4** %1; loadImmPtr
  %4 = inttoptr i64 0 to%union.4*
  %5 = icmp eq %union.4* %3, %4
  br i1 %5, label %then_0, label %else_0
then_0:; loadImmPtr
  %6 = inttoptr i64 0 to%union.4*
  ret %union.4* %6
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  br label %again_0
again_0:
  br i1 1, label %body_0, label %break_0
body_0:
  %8 = call %Token* () @func183 ()
  %9 = getelementptr inbounds %Token, %Token* %8, i1 0, i32 1
  %10 = bitcast [2 x %Nat8]* @func215_str1 to %Str
  %11 = call i1 (%Str) @func191 (%Str %10)
  br i1 %11, label %then_1, label %else_1
then_1:
  call void () @skip_nl ()
  %12 = load %union.4*, %union.4** %1
  %13 = call %union.4* () @func216 ()
  %14 = insertvalue %AstValueBinary zeroinitializer, %union.4* %12, 0
  %15 = insertvalue %AstValueBinary %14, %union.4* %13, 1
  %16 = insertvalue %AstValueBinary %15, %TokenInfo* %9, 2
  %17 = alloca %union.4
; write variant 15
  %18 = getelementptr inbounds %union.4, %union.4* %17, i1 0, i32 0
  store %Int16 15, %Int16* %18, align 2
; write data
  %19 = getelementptr inbounds %union.4, %union.4* %17, i1 0, i32 1
  %20 = bitcast [56 x %Nat8]* %19 to %AstValueBinary*
  store %AstValueBinary %16, %AstValueBinary* %20, align 8
  %21 = load %union.4, %union.4* %17
  %22 = call %union.4* (%union.4) @func210 (%union.4 %21)
  store %union.4* %22, %union.4** %1, align 8
  br label %endif_1
else_1:
  %23 = bitcast [2 x %Nat8]* @func215_str2 to %Str
  %24 = call i1 (%Str) @func191 (%Str %23)
  br i1 %24, label %then_2, label %else_2
then_2:
  call void () @skip_nl ()
  %25 = load %union.4*, %union.4** %1
  %26 = call %union.4* () @func216 ()
  %27 = insertvalue %AstValueBinary zeroinitializer, %union.4* %25, 0
  %28 = insertvalue %AstValueBinary %27, %union.4* %26, 1
  %29 = insertvalue %AstValueBinary %28, %TokenInfo* %9, 2
  %30 = alloca %union.4
; write variant 14
  %31 = getelementptr inbounds %union.4, %union.4* %30, i1 0, i32 0
  store %Int16 14, %Int16* %31, align 2
; write data
  %32 = getelementptr inbounds %union.4, %union.4* %30, i1 0, i32 1
  %33 = bitcast [56 x %Nat8]* %32 to %AstValueBinary*
  store %AstValueBinary %29, %AstValueBinary* %33, align 8
  %34 = load %union.4, %union.4* %30
  %35 = call %union.4* (%union.4) @func210 (%union.4 %34)
  store %union.4* %35, %union.4** %1, align 8
  br label %endif_2
else_2:
  %36 = bitcast [3 x %Nat8]* @func215_str3 to %Str
  %37 = call i1 (%Str) @func191 (%Str %36)
  br i1 %37, label %then_3, label %else_3
then_3:
  call void () @skip_nl ()
  %38 = load %union.4*, %union.4** %1
  %39 = call %union.4* () @func216 ()
  %40 = insertvalue %AstValueBinary zeroinitializer, %union.4* %38, 0
  %41 = insertvalue %AstValueBinary %40, %union.4* %39, 1
  %42 = insertvalue %AstValueBinary %41, %TokenInfo* %9, 2
  %43 = alloca %union.4
; write variant 13
  %44 = getelementptr inbounds %union.4, %union.4* %43, i1 0, i32 0
  store %Int16 13, %Int16* %44, align 2
; write data
  %45 = getelementptr inbounds %union.4, %union.4* %43, i1 0, i32 1
  %46 = bitcast [56 x %Nat8]* %45 to %AstValueBinary*
  store %AstValueBinary %42, %AstValueBinary* %46, align 8
  %47 = load %union.4, %union.4* %43
  %48 = call %union.4* (%union.4) @func210 (%union.4 %47)
  store %union.4* %48, %union.4** %1, align 8
  br label %endif_3
else_3:
  %49 = bitcast [3 x %Nat8]* @func215_str4 to %Str
  %50 = call i1 (%Str) @func191 (%Str %49)
  br i1 %50, label %then_4, label %else_4
then_4:
  call void () @skip_nl ()
  %51 = load %union.4*, %union.4** %1
  %52 = call %union.4* () @func216 ()
  %53 = insertvalue %AstValueBinary zeroinitializer, %union.4* %51, 0
  %54 = insertvalue %AstValueBinary %53, %union.4* %52, 1
  %55 = insertvalue %AstValueBinary %54, %TokenInfo* %9, 2
  %56 = alloca %union.4
; write variant 12
  %57 = getelementptr inbounds %union.4, %union.4* %56, i1 0, i32 0
  store %Int16 12, %Int16* %57, align 2
; write data
  %58 = getelementptr inbounds %union.4, %union.4* %56, i1 0, i32 1
  %59 = bitcast [56 x %Nat8]* %58 to %AstValueBinary*
  store %AstValueBinary %55, %AstValueBinary* %59, align 8
  %60 = load %union.4, %union.4* %56
  %61 = call %union.4* (%union.4) @func210 (%union.4 %60)
  store %union.4* %61, %union.4** %1, align 8
  br label %endif_4
else_4:
  br label %break_0
  br label %endif_4
endif_4:
  br label %endif_3
endif_3:
  br label %endif_2
endif_2:
  br label %endif_1
endif_1:
  br label %again_0
break_0:
  %63 = load %union.4*, %union.4** %1
  ret %union.4* %63
}

define %union.4* @func216 () {
  %1 = alloca %union.4*
  %2 = call %union.4* () @func217 ()
  store %union.4* %2, %union.4** %1, align 8
  %3 = load %union.4*, %union.4** %1; loadImmPtr
  %4 = inttoptr i64 0 to%union.4*
  %5 = icmp eq %union.4* %3, %4
  br i1 %5, label %then_0, label %else_0
then_0:; loadImmPtr
  %6 = inttoptr i64 0 to%union.4*
  ret %union.4* %6
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  br label %again_0
again_0:
  br i1 1, label %body_0, label %break_0
body_0:
  %8 = call %Token* () @func183 ()
  %9 = getelementptr inbounds %Token, %Token* %8, i1 0, i32 1
  %10 = bitcast [3 x %Nat8]* @func216_str1 to %Str
  %11 = call i1 (%Str) @func191 (%Str %10)
  br i1 %11, label %then_1, label %else_1
then_1:
  call void () @skip_nl ()
  %12 = load %union.4*, %union.4** %1
  %13 = call %union.4* () @func217 ()
  %14 = insertvalue %AstValueBinary zeroinitializer, %union.4* %12, 0
  %15 = insertvalue %AstValueBinary %14, %union.4* %13, 1
  %16 = insertvalue %AstValueBinary %15, %TokenInfo* %9, 2
  %17 = alloca %union.4
; write variant 11
  %18 = getelementptr inbounds %union.4, %union.4* %17, i1 0, i32 0
  store %Int16 11, %Int16* %18, align 2
; write data
  %19 = getelementptr inbounds %union.4, %union.4* %17, i1 0, i32 1
  %20 = bitcast [56 x %Nat8]* %19 to %AstValueBinary*
  store %AstValueBinary %16, %AstValueBinary* %20, align 8
  %21 = load %union.4, %union.4* %17
  %22 = call %union.4* (%union.4) @func210 (%union.4 %21)
  store %union.4* %22, %union.4** %1, align 8
  br label %endif_1
else_1:
  %23 = bitcast [3 x %Nat8]* @func216_str2 to %Str
  %24 = call i1 (%Str) @func191 (%Str %23)
  br i1 %24, label %then_2, label %else_2
then_2:
  call void () @skip_nl ()
  %25 = load %union.4*, %union.4** %1
  %26 = call %union.4* () @func217 ()
  %27 = insertvalue %AstValueBinary zeroinitializer, %union.4* %25, 0
  %28 = insertvalue %AstValueBinary %27, %union.4* %26, 1
  %29 = insertvalue %AstValueBinary %28, %TokenInfo* %9, 2
  %30 = alloca %union.4
; write variant 10
  %31 = getelementptr inbounds %union.4, %union.4* %30, i1 0, i32 0
  store %Int16 10, %Int16* %31, align 2
; write data
  %32 = getelementptr inbounds %union.4, %union.4* %30, i1 0, i32 1
  %33 = bitcast [56 x %Nat8]* %32 to %AstValueBinary*
  store %AstValueBinary %29, %AstValueBinary* %33, align 8
  %34 = load %union.4, %union.4* %30
  %35 = call %union.4* (%union.4) @func210 (%union.4 %34)
  store %union.4* %35, %union.4** %1, align 8
  br label %endif_2
else_2:
  br label %break_0
  br label %endif_2
endif_2:
  br label %endif_1
endif_1:
  br label %again_0
break_0:
  %37 = load %union.4*, %union.4** %1
  ret %union.4* %37
}

define %union.4* @func217 () {
  %1 = alloca %union.4*
  %2 = call %union.4* () @func218 ()
  store %union.4* %2, %union.4** %1, align 8
  %3 = load %union.4*, %union.4** %1; loadImmPtr
  %4 = inttoptr i64 0 to%union.4*
  %5 = icmp eq %union.4* %3, %4
  br i1 %5, label %then_0, label %else_0
then_0:; loadImmPtr
  %6 = inttoptr i64 0 to%union.4*
  ret %union.4* %6
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  br label %again_0
again_0:
  br i1 1, label %body_0, label %break_0
body_0:
  %8 = call %Token* () @func183 ()
  %9 = getelementptr inbounds %Token, %Token* %8, i1 0, i32 1
  %10 = bitcast [2 x %Nat8]* @func217_str1 to %Str
  %11 = call i1 (%Str) @func191 (%Str %10)
  br i1 %11, label %then_1, label %else_1
then_1:
  call void () @skip_nl ()
  %12 = load %union.4*, %union.4** %1
  %13 = call %union.4* () @func218 ()
  %14 = insertvalue %AstValueBinary zeroinitializer, %union.4* %12, 0
  %15 = insertvalue %AstValueBinary %14, %union.4* %13, 1
  %16 = insertvalue %AstValueBinary %15, %TokenInfo* %9, 2
  %17 = alloca %union.4
; write variant 25
  %18 = getelementptr inbounds %union.4, %union.4* %17, i1 0, i32 0
  store %Int16 25, %Int16* %18, align 2
; write data
  %19 = getelementptr inbounds %union.4, %union.4* %17, i1 0, i32 1
  %20 = bitcast [56 x %Nat8]* %19 to %AstValueBinary*
  store %AstValueBinary %16, %AstValueBinary* %20, align 8
  %21 = load %union.4, %union.4* %17
  %22 = call %union.4* (%union.4) @func210 (%union.4 %21)
  store %union.4* %22, %union.4** %1, align 8
  br label %endif_1
else_1:
  %23 = bitcast [2 x %Nat8]* @func217_str2 to %Str
  %24 = call i1 (%Str) @func191 (%Str %23)
  br i1 %24, label %then_2, label %else_2
then_2:
  call void () @skip_nl ()
  %25 = load %union.4*, %union.4** %1
  %26 = call %union.4* () @func218 ()
  %27 = insertvalue %AstValueBinary zeroinitializer, %union.4* %25, 0
  %28 = insertvalue %AstValueBinary %27, %union.4* %26, 1
  %29 = insertvalue %AstValueBinary %28, %TokenInfo* %9, 2
  %30 = alloca %union.4
; write variant 24
  %31 = getelementptr inbounds %union.4, %union.4* %30, i1 0, i32 0
  store %Int16 24, %Int16* %31, align 2
; write data
  %32 = getelementptr inbounds %union.4, %union.4* %30, i1 0, i32 1
  %33 = bitcast [56 x %Nat8]* %32 to %AstValueBinary*
  store %AstValueBinary %29, %AstValueBinary* %33, align 8
  %34 = load %union.4, %union.4* %30
  %35 = call %union.4* (%union.4) @func210 (%union.4 %34)
  store %union.4* %35, %union.4** %1, align 8
  br label %endif_2
else_2:
  br label %break_0
  br label %endif_2
endif_2:
  br label %endif_1
endif_1:
  br label %again_0
break_0:
  %37 = load %union.4*, %union.4** %1
  ret %union.4* %37
}

define %union.4* @func218 () {
  %1 = alloca %union.4*
  %2 = call %union.4* () @func219 ()
  store %union.4* %2, %union.4** %1, align 8
  %3 = load %union.4*, %union.4** %1; loadImmPtr
  %4 = inttoptr i64 0 to%union.4*
  %5 = icmp eq %union.4* %3, %4
  br i1 %5, label %then_0, label %else_0
then_0:; loadImmPtr
  %6 = inttoptr i64 0 to%union.4*
  ret %union.4* %6
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  br label %again_0
again_0:
  br i1 1, label %body_0, label %break_0
body_0:
  %8 = call %Token* () @func183 ()
  %9 = getelementptr inbounds %Token, %Token* %8, i1 0, i32 1
  %10 = bitcast [2 x %Nat8]* @func218_str1 to %Str
  %11 = call i1 (%Str) @func191 (%Str %10)
  br i1 %11, label %then_1, label %else_1
then_1:
  call void () @skip_nl ()
  %12 = load %union.4*, %union.4** %1
  %13 = call %union.4* () @func219 ()
  %14 = insertvalue %AstValueBinary zeroinitializer, %union.4* %12, 0
  %15 = insertvalue %AstValueBinary %14, %union.4* %13, 1
  %16 = insertvalue %AstValueBinary %15, %TokenInfo* %9, 2
  %17 = alloca %union.4
; write variant 23
  %18 = getelementptr inbounds %union.4, %union.4* %17, i1 0, i32 0
  store %Int16 23, %Int16* %18, align 2
; write data
  %19 = getelementptr inbounds %union.4, %union.4* %17, i1 0, i32 1
  %20 = bitcast [56 x %Nat8]* %19 to %AstValueBinary*
  store %AstValueBinary %16, %AstValueBinary* %20, align 8
  %21 = load %union.4, %union.4* %17
  %22 = call %union.4* (%union.4) @func210 (%union.4 %21)
  store %union.4* %22, %union.4** %1, align 8
  br label %endif_1
else_1:
  %23 = bitcast [2 x %Nat8]* @func218_str2 to %Str
  %24 = call i1 (%Str) @func191 (%Str %23)
  br i1 %24, label %then_2, label %else_2
then_2:
  call void () @skip_nl ()
  %25 = load %union.4*, %union.4** %1
  %26 = call %union.4* () @func219 ()
  %27 = insertvalue %AstValueBinary zeroinitializer, %union.4* %25, 0
  %28 = insertvalue %AstValueBinary %27, %union.4* %26, 1
  %29 = insertvalue %AstValueBinary %28, %TokenInfo* %9, 2
  %30 = alloca %union.4
; write variant 22
  %31 = getelementptr inbounds %union.4, %union.4* %30, i1 0, i32 0
  store %Int16 22, %Int16* %31, align 2
; write data
  %32 = getelementptr inbounds %union.4, %union.4* %30, i1 0, i32 1
  %33 = bitcast [56 x %Nat8]* %32 to %AstValueBinary*
  store %AstValueBinary %29, %AstValueBinary* %33, align 8
  %34 = load %union.4, %union.4* %30
  %35 = call %union.4* (%union.4) @func210 (%union.4 %34)
  store %union.4* %35, %union.4** %1, align 8
  br label %endif_2
else_2:
  %36 = bitcast [2 x %Nat8]* @func218_str3 to %Str
  %37 = call i1 (%Str) @func191 (%Str %36)
  br i1 %37, label %then_3, label %else_3
then_3:
  call void () @skip_nl ()
  %38 = load %union.4*, %union.4** %1
  %39 = call %union.4* () @func219 ()
  %40 = insertvalue %AstValueBinary zeroinitializer, %union.4* %38, 0
  %41 = insertvalue %AstValueBinary %40, %union.4* %39, 1
  %42 = insertvalue %AstValueBinary %41, %TokenInfo* %9, 2
  %43 = alloca %union.4
; write variant 21
  %44 = getelementptr inbounds %union.4, %union.4* %43, i1 0, i32 0
  store %Int16 21, %Int16* %44, align 2
; write data
  %45 = getelementptr inbounds %union.4, %union.4* %43, i1 0, i32 1
  %46 = bitcast [56 x %Nat8]* %45 to %AstValueBinary*
  store %AstValueBinary %42, %AstValueBinary* %46, align 8
  %47 = load %union.4, %union.4* %43
  %48 = call %union.4* (%union.4) @func210 (%union.4 %47)
  store %union.4* %48, %union.4** %1, align 8
  br label %endif_3
else_3:
  br label %break_0
  br label %endif_3
endif_3:
  br label %endif_2
endif_2:
  br label %endif_1
endif_1:
  br label %again_0
break_0:
  %50 = load %union.4*, %union.4** %1
  ret %union.4* %50
}

define %union.4* @func219 () {
  %1 = alloca %union.4*
  %2 = call %union.4* () @func220 ()
  store %union.4* %2, %union.4** %1, align 8
  %3 = load %union.4*, %union.4** %1; loadImmPtr
  %4 = inttoptr i64 0 to%union.4*
  %5 = icmp eq %union.4* %3, %4
  br i1 %5, label %then_0, label %else_0
then_0:; loadImmPtr
  %6 = inttoptr i64 0 to%union.4*
  ret %union.4* %6
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %8 = call %Token* () @func183 ()
  %9 = getelementptr inbounds %Token, %Token* %8, i1 0, i32 1
  %10 = bitcast [3 x %Nat8]* @func219_str1 to %Str
  %11 = call i1 (%Str) @func191 (%Str %10)
  br i1 %11, label %then_1, label %else_1
then_1:
  %12 = call %union.2* () @func202 ()
  %13 = load %union.4*, %union.4** %1
  %14 = insertvalue %AstValueValType zeroinitializer, %union.4* %13, 0
  %15 = insertvalue %AstValueValType %14, %union.2* %12, 1
  %16 = insertvalue %AstValueValType %15, %TokenInfo* %9, 2
  %17 = alloca %union.4
; write variant 6
  %18 = getelementptr inbounds %union.4, %union.4* %17, i1 0, i32 0
  store %Int16 6, %Int16* %18, align 2
; write data
  %19 = getelementptr inbounds %union.4, %union.4* %17, i1 0, i32 1
  %20 = bitcast [56 x %Nat8]* %19 to %AstValueValType*
  store %AstValueValType %16, %AstValueValType* %20, align 8
  %21 = load %union.4, %union.4* %17
  %22 = call %union.4* (%union.4) @func210 (%union.4 %21)
  store %union.4* %22, %union.4** %1, align 8
  br label %endif_1
else_1:
  %23 = bitcast [3 x %Nat8]* @func219_str2 to %Str
  %24 = call i1 (%Str) @func191 (%Str %23)
  br i1 %24, label %then_2, label %else_2
then_2:
  %25 = call %union.2* () @func202 ()
  %26 = load %union.4*, %union.4** %1
  %27 = insertvalue %AstValueValType zeroinitializer, %union.4* %26, 0
  %28 = insertvalue %AstValueValType %27, %union.2* %25, 1
  %29 = insertvalue %AstValueValType %28, %TokenInfo* %9, 2
  %30 = alloca %union.4
; write variant 5
  %31 = getelementptr inbounds %union.4, %union.4* %30, i1 0, i32 0
  store %Int16 5, %Int16* %31, align 2
; write data
  %32 = getelementptr inbounds %union.4, %union.4* %30, i1 0, i32 1
  %33 = bitcast [56 x %Nat8]* %32 to %AstValueValType*
  store %AstValueValType %29, %AstValueValType* %33, align 8
  %34 = load %union.4, %union.4* %30
  %35 = call %union.4* (%union.4) @func210 (%union.4 %34)
  store %union.4* %35, %union.4** %1, align 8
  br label %endif_2
else_2:
  %36 = bitcast [5 x %Nat8]* @func219_str3 to %Str
  %37 = call i1 (%Str) @func191 (%Str %36)
  br i1 %37, label %then_3, label %else_3
then_3:
  %38 = call %union.2* () @func202 ()
  %39 = load %union.4*, %union.4** %1
  %40 = insertvalue %AstValueValType zeroinitializer, %union.4* %39, 0
  %41 = insertvalue %AstValueValType %40, %union.2* %38, 1
  %42 = insertvalue %AstValueValType %41, %TokenInfo* %9, 2
  %43 = alloca %union.4
; write variant 4
  %44 = getelementptr inbounds %union.4, %union.4* %43, i1 0, i32 0
  store %Int16 4, %Int16* %44, align 2
; write data
  %45 = getelementptr inbounds %union.4, %union.4* %43, i1 0, i32 1
  %46 = bitcast [56 x %Nat8]* %45 to %AstValueValType*
  store %AstValueValType %42, %AstValueValType* %46, align 8
  %47 = load %union.4, %union.4* %43
  %48 = call %union.4* (%union.4) @func210 (%union.4 %47)
  store %union.4* %48, %union.4** %1, align 8
  br label %endif_3
else_3:
  %49 = bitcast [3 x %Nat8]* @func219_str4 to %Str
  %50 = call i1 (%Str) @func191 (%Str %49)
  br i1 %50, label %then_4, label %else_4
then_4:
  %51 = call %union.2* () @func202 ()
  %52 = load %union.4*, %union.4** %1
  %53 = insertvalue %AstValueValType zeroinitializer, %union.4* %52, 0
  %54 = insertvalue %AstValueValType %53, %union.2* %51, 1
  %55 = insertvalue %AstValueValType %54, %TokenInfo* %9, 2
  %56 = alloca %union.4
; write variant 3
  %57 = getelementptr inbounds %union.4, %union.4* %56, i1 0, i32 0
  store %Int16 3, %Int16* %57, align 2
; write data
  %58 = getelementptr inbounds %union.4, %union.4* %56, i1 0, i32 1
  %59 = bitcast [56 x %Nat8]* %58 to %AstValueValType*
  store %AstValueValType %55, %AstValueValType* %59, align 8
  %60 = load %union.4, %union.4* %56
  %61 = call %union.4* (%union.4) @func210 (%union.4 %60)
  store %union.4* %61, %union.4** %1, align 8
  br label %endif_4
else_4:
  br label %endif_4
endif_4:
  br label %endif_3
endif_3:
  br label %endif_2
endif_2:
  br label %endif_1
endif_1:
  %62 = load %union.4*, %union.4** %1
  ret %union.4* %62
}

define %union.4* @func220 () {
  %1 = alloca %union.4*; loadImmPtr
  %2 = inttoptr i64 0 to%union.4*
  store %union.4* %2, %union.4** %1, align 8
  %3 = call %Token* () @func183 ()
  %4 = getelementptr inbounds %Token, %Token* %3, i1 0, i32 1
  %5 = bitcast [2 x %Nat8]* @func220_str1 to %Str
  %6 = call i1 (%Str) @func191 (%Str %5)
  br i1 %6, label %then_0, label %else_0
then_0:
  %7 = call %union.4* () @func220 ()
  %8 = insertvalue %AstValueUnary zeroinitializer, %union.4* %7, 0
  %9 = insertvalue %AstValueUnary %8, %TokenInfo* %4, 1
  %10 = alloca %union.4
; write variant 29
  %11 = getelementptr inbounds %union.4, %union.4* %10, i1 0, i32 0
  store %Int16 29, %Int16* %11, align 2
; write data
  %12 = getelementptr inbounds %union.4, %union.4* %10, i1 0, i32 1
  %13 = bitcast [56 x %Nat8]* %12 to %AstValueUnary*
  store %AstValueUnary %9, %AstValueUnary* %13, align 8
  %14 = load %union.4, %union.4* %10
  %15 = call %union.4* (%union.4) @func210 (%union.4 %14)
  store %union.4* %15, %union.4** %1, align 8
  br label %endif_0
else_0:
  %16 = bitcast [2 x %Nat8]* @func220_str2 to %Str
  %17 = call i1 (%Str) @func191 (%Str %16)
  br i1 %17, label %then_1, label %else_1
then_1:
  %18 = call %union.4* () @func221 ()
  %19 = insertvalue %AstValueUnary zeroinitializer, %union.4* %18, 0
  %20 = insertvalue %AstValueUnary %19, %TokenInfo* %4, 1
  %21 = alloca %union.4
; write variant 30
  %22 = getelementptr inbounds %union.4, %union.4* %21, i1 0, i32 0
  store %Int16 30, %Int16* %22, align 2
; write data
  %23 = getelementptr inbounds %union.4, %union.4* %21, i1 0, i32 1
  %24 = bitcast [56 x %Nat8]* %23 to %AstValueUnary*
  store %AstValueUnary %20, %AstValueUnary* %24, align 8
  %25 = load %union.4, %union.4* %21
  %26 = call %union.4* (%union.4) @func210 (%union.4 %25)
  store %union.4* %26, %union.4** %1, align 8
  br label %endif_1
else_1:
  %27 = bitcast [4 x %Nat8]* @func220_str3 to %Str
  %28 = call i1 (%Str) @func191 (%Str %27)
  br i1 %28, label %then_2, label %else_2
then_2:
  %29 = call %union.4* () @func220 ()
  %30 = insertvalue %AstValueUnary zeroinitializer, %union.4* %29, 0
  %31 = insertvalue %AstValueUnary %30, %TokenInfo* %4, 1
  %32 = alloca %union.4
; write variant 26
  %33 = getelementptr inbounds %union.4, %union.4* %32, i1 0, i32 0
  store %Int16 26, %Int16* %33, align 2
; write data
  %34 = getelementptr inbounds %union.4, %union.4* %32, i1 0, i32 1
  %35 = bitcast [56 x %Nat8]* %34 to %AstValueUnary*
  store %AstValueUnary %31, %AstValueUnary* %35, align 8
  %36 = load %union.4, %union.4* %32
  %37 = call %union.4* (%union.4) @func210 (%union.4 %36)
  store %union.4* %37, %union.4** %1, align 8
  br label %endif_2
else_2:
  %38 = bitcast [2 x %Nat8]* @func220_str4 to %Str
  %39 = call i1 (%Str) @func191 (%Str %38)
  br i1 %39, label %then_3, label %else_3
then_3:
  %40 = call %union.4* () @func220 ()
  %41 = insertvalue %AstValueUnary zeroinitializer, %union.4* %40, 0
  %42 = insertvalue %AstValueUnary %41, %TokenInfo* %4, 1
  %43 = alloca %union.4
; write variant 28
  %44 = getelementptr inbounds %union.4, %union.4* %43, i1 0, i32 0
  store %Int16 28, %Int16* %44, align 2
; write data
  %45 = getelementptr inbounds %union.4, %union.4* %43, i1 0, i32 1
  %46 = bitcast [56 x %Nat8]* %45 to %AstValueUnary*
  store %AstValueUnary %42, %AstValueUnary* %46, align 8
  %47 = load %union.4, %union.4* %43
  %48 = call %union.4* (%union.4) @func210 (%union.4 %47)
  store %union.4* %48, %union.4** %1, align 8
  br label %endif_3
else_3:
  %49 = bitcast [2 x %Nat8]* @func220_str5 to %Str
  %50 = call i1 (%Str) @func191 (%Str %49)
  br i1 %50, label %then_4, label %else_4
then_4:
  %51 = call %union.4* () @func220 ()
  %52 = insertvalue %AstValueUnary zeroinitializer, %union.4* %51, 0
  %53 = insertvalue %AstValueUnary %52, %TokenInfo* %4, 1
  %54 = alloca %union.4
; write variant 27
  %55 = getelementptr inbounds %union.4, %union.4* %54, i1 0, i32 0
  store %Int16 27, %Int16* %55, align 2
; write data
  %56 = getelementptr inbounds %union.4, %union.4* %54, i1 0, i32 1
  %57 = bitcast [56 x %Nat8]* %56 to %AstValueUnary*
  store %AstValueUnary %53, %AstValueUnary* %57, align 8
  %58 = load %union.4, %union.4* %54
  %59 = call %union.4* (%union.4) @func210 (%union.4 %58)
  store %union.4* %59, %union.4** %1, align 8
  br label %endif_4
else_4:
  %60 = bitcast [7 x %Nat8]* @func220_str6 to %Str
  %61 = call i1 (%Str) @func191 (%Str %60)
  br i1 %61, label %then_5, label %else_5
then_5:
  %62 = call %Token* () @func183 ()
  %63 = getelementptr inbounds %Token, %Token* %62, i1 0, i32 1
  %64 = call %union.2* () @func202 (); loadImmPtr
  %65 = inttoptr i64 0 to%union.2*
  %66 = icmp eq %union.2* %64, %65
  br i1 %66, label %then_6, label %else_6
then_6:
  %67 = bitcast [23 x %Nat8]* @func220_str7 to %Str
  call void (%Str, %TokenInfo*) @error (%Str %67, %TokenInfo* %63); loadImmPtr
  %68 = inttoptr i64 0 to%union.4*
  ret %union.4* %68
  br label %endif_6
else_6:
  br label %endif_6
endif_6:
  %70 = insertvalue %AstValueSizeof zeroinitializer, %union.2* %64, 0
  %71 = insertvalue %AstValueSizeof %70, %TokenInfo* %4, 1
  %72 = alloca %union.4
; write variant 0
  %73 = getelementptr inbounds %union.4, %union.4* %72, i1 0, i32 0
  store %Int16 0, %Int16* %73, align 2
; write data
  %74 = getelementptr inbounds %union.4, %union.4* %72, i1 0, i32 1
  %75 = bitcast [56 x %Nat8]* %74 to %AstValueSizeof*
  store %AstValueSizeof %71, %AstValueSizeof* %75, align 8
  %76 = load %union.4, %union.4* %72
  %77 = call %union.4* (%union.4) @func210 (%union.4 %76)
  store %union.4* %77, %union.4** %1, align 8
  br label %endif_5
else_5:
  %78 = bitcast [8 x %Nat8]* @func220_str8 to %Str
  %79 = call i1 (%Str) @func191 (%Str %78)
  br i1 %79, label %then_7, label %else_7
then_7:
  %80 = call %Token* () @func183 ()
  %81 = getelementptr inbounds %Token, %Token* %80, i1 0, i32 1
  %82 = call %union.2* () @func202 (); loadImmPtr
  %83 = inttoptr i64 0 to%union.2*
  %84 = icmp eq %union.2* %82, %83
  br i1 %84, label %then_8, label %else_8
then_8:
  %85 = bitcast [24 x %Nat8]* @func220_str9 to %Str
  call void (%Str, %TokenInfo*) @error (%Str %85, %TokenInfo* %81); loadImmPtr
  %86 = inttoptr i64 0 to%union.4*
  ret %union.4* %86
  br label %endif_8
else_8:
  br label %endif_8
endif_8:
  %88 = insertvalue %AstValueAlignof zeroinitializer, %union.2* %82, 0
  %89 = insertvalue %AstValueAlignof %88, %TokenInfo* %4, 1
  %90 = alloca %union.4
; write variant 1
  %91 = getelementptr inbounds %union.4, %union.4* %90, i1 0, i32 0
  store %Int16 1, %Int16* %91, align 2
; write data
  %92 = getelementptr inbounds %union.4, %union.4* %90, i1 0, i32 1
  %93 = bitcast [56 x %Nat8]* %92 to %AstValueAlignof*
  store %AstValueAlignof %89, %AstValueAlignof* %93, align 8
  %94 = load %union.4, %union.4* %90
  %95 = call %union.4* (%union.4) @func210 (%union.4 %94)
  store %union.4* %95, %union.4** %1, align 8
  br label %endif_7
else_7:
  %96 = call %union.4* () @func221 ()
  store %union.4* %96, %union.4** %1, align 8
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
  %97 = load %union.4*, %union.4** %1
  ret %union.4* %97
}

define %union.4* @func221 () {
  %1 = alloca %union.4*
  %2 = call %union.4* () @func222 ()
  store %union.4* %2, %union.4** %1, align 8
  %3 = load %union.4*, %union.4** %1; loadImmPtr
  %4 = inttoptr i64 0 to%union.4*
  %5 = icmp eq %union.4* %3, %4
  br i1 %5, label %then_0, label %else_0
then_0:; loadImmPtr
  %6 = inttoptr i64 0 to%union.4*
  ret %union.4* %6
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  br label %again_0
again_0:
  br i1 1, label %body_0, label %break_0
body_0:
  %8 = call %Token* () @func183 ()
  %9 = getelementptr inbounds %Token, %Token* %8, i1 0, i32 1
  %10 = bitcast [2 x %Nat8]* @func221_str1 to %Str
  %11 = call i1 (%Str) @func191 (%Str %10)
  br i1 %11, label %then_1, label %else_1
then_1:
  %12 = call %List* () @map_new ()
  br label %again_1
again_1:
  %13 = bitcast [2 x %Nat8]* @func221_str2 to %Str
  %14 = call i1 (%Str) @func191 (%Str %13)
  %15 = xor i1 %14, 1
  br i1 %15, label %body_1, label %break_1
body_1:
  %16 = call %Token* () @func183 ()
  %17 = getelementptr inbounds %Token, %Token* %16, i1 0, i32 1
  %18 = call %union.4* () @func211 (); loadImmPtr
  %19 = inttoptr i64 0 to%union.4*
  %20 = icmp eq %union.4* %18, %19
  br i1 %20, label %then_2, label %else_2
then_2:
  %21 = bitcast [3 x %Nat8]* @func221_str3 to %Str
  call void (%Str) @skipto (%Str %21)
  %22 = bitcast [2 x %Nat8]* @func221_str4 to %Str
  %23 = call i1 (%Str) @func191 (%Str %22)
  br i1 %23, label %then_3, label %else_3
then_3:
  br label %again_1
  br label %endif_3
else_3:
  %25 = bitcast [2 x %Nat8]* @func221_str5 to %Str
  %26 = call i1 (%Str) @func191 (%Str %25)
  br i1 %26, label %then_4, label %else_4
then_4:
  br label %break_1
  br label %endif_4
else_4:; loadImmPtr
  %28 = inttoptr i64 0 to%union.4*
  ret %union.4* %28
  br label %endif_4
endif_4:
  br label %endif_3
endif_3:
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
  %30 = bitcast %union.4* %18 to %Unit*
  %31 = call i1 (%List*, %Unit*) @list_append (%List* %12, %Unit* %30)
  %32 = bitcast [2 x %Nat8]* @func221_str6 to %Str
  %33 = call i1 (%Str) @func191 (%Str %32)
  %34 = xor i1 %33, 1
  br i1 %34, label %then_5, label %else_5
then_5:
  %35 = bitcast [2 x %Nat8]* @func221_str7 to %Str
  %36 = call i1 (%Str) @need (%Str %35)
  br label %endif_5
else_5:
  br label %break_1
  br label %endif_5
endif_5:
  br label %again_1
break_1:
  %38 = load %union.4*, %union.4** %1
  %39 = insertvalue %AstValueCall zeroinitializer, %union.4* %38, 0
  %40 = load %List, %List* %12
  %41 = insertvalue %AstValueCall %39, %List %40, 1
  %42 = insertvalue %AstValueCall %41, %TokenInfo* %9, 2
  %43 = alloca %union.4
; write variant 9
  %44 = getelementptr inbounds %union.4, %union.4* %43, i1 0, i32 0
  store %Int16 9, %Int16* %44, align 2
; write data
  %45 = getelementptr inbounds %union.4, %union.4* %43, i1 0, i32 1
  %46 = bitcast [56 x %Nat8]* %45 to %AstValueCall*
  store %AstValueCall %42, %AstValueCall* %46, align 8
  %47 = load %union.4, %union.4* %43
  %48 = call %union.4* (%union.4) @func210 (%union.4 %47)
  store %union.4* %48, %union.4** %1, align 8
  br label %endif_1
else_1:
  %49 = bitcast [2 x %Nat8]* @func221_str8 to %Str
  %50 = call i1 (%Str) @func191 (%Str %49)
  br i1 %50, label %then_6, label %else_6
then_6:
  %51 = call %union.4* () @func211 ()
  %52 = bitcast [2 x %Nat8]* @func221_str9 to %Str
  %53 = call i1 (%Str) @func191 (%Str %52)
  %54 = load %union.4*, %union.4** %1
  %55 = insertvalue %AstValueIndex zeroinitializer, %union.4* %54, 0
  %56 = insertvalue %AstValueIndex %55, %union.4* %51, 1
  %57 = insertvalue %AstValueIndex %56, %TokenInfo* %9, 2
  %58 = alloca %union.4
; write variant 8
  %59 = getelementptr inbounds %union.4, %union.4* %58, i1 0, i32 0
  store %Int16 8, %Int16* %59, align 2
; write data
  %60 = getelementptr inbounds %union.4, %union.4* %58, i1 0, i32 1
  %61 = bitcast [56 x %Nat8]* %60 to %AstValueIndex*
  store %AstValueIndex %57, %AstValueIndex* %61, align 8
  %62 = load %union.4, %union.4* %58
  %63 = call %union.4* (%union.4) @func210 (%union.4 %62)
  store %union.4* %63, %union.4** %1, align 8
  br label %endif_6
else_6:
  %64 = bitcast [2 x %Nat8]* @func221_str10 to %Str
  %65 = call i1 (%Str) @func191 (%Str %64)
  br i1 %65, label %then_7, label %else_7
then_7:
  %66 = call %AstId* () @parse_id ()
  %67 = load %union.4*, %union.4** %1
  %68 = insertvalue %AstValueAccess zeroinitializer, %union.4* %67, 0
  %69 = insertvalue %AstValueAccess %68, %AstId* %66, 1
  %70 = insertvalue %AstValueAccess %69, %TokenInfo* %9, 2
  %71 = alloca %union.4
; write variant 7
  %72 = getelementptr inbounds %union.4, %union.4* %71, i1 0, i32 0
  store %Int16 7, %Int16* %72, align 2
; write data
  %73 = getelementptr inbounds %union.4, %union.4* %71, i1 0, i32 1
  %74 = bitcast [56 x %Nat8]* %73 to %AstValueAccess*
  store %AstValueAccess %70, %AstValueAccess* %74, align 8
  %75 = load %union.4, %union.4* %71
  %76 = call %union.4* (%union.4) @func210 (%union.4 %75)
  store %union.4* %76, %union.4** %1, align 8
  br label %endif_7
else_7:
  br label %break_0
  br label %endif_7
endif_7:
  br label %endif_6
endif_6:
  br label %endif_1
endif_1:
  br label %again_0
break_0:
  %78 = load %union.4*, %union.4** %1
  ret %union.4* %78
}

define %union.4* @func222 () {
  %1 = call i1 () @func250 ()
  br i1 %1, label %then_0, label %else_0
then_0:
  %2 = call %union.4* () @func231 ()
  ret %union.4* %2
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %4 = alloca %union.4*; loadImmPtr
  %5 = inttoptr i64 0 to%union.4*
  store %union.4* %5, %union.4** %4, align 8
  %6 = call %Token* () @func183 ()
  %7 = getelementptr inbounds %Token, %Token* %6, i1 0, i32 1
  %8 = bitcast [2 x %Nat8]* @func222_str1 to %Str
  %9 = call i1 (%Str) @func191 (%Str %8)
  br i1 %9, label %then_1, label %else_1
then_1:
  %10 = call i1 () @func252 ()
  br i1 %10, label %then_2, label %else_2
then_2:
  %11 = call %union.4* () @func229 ()
  ret %union.4* %11
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
  %13 = call %union.4* () @func211 ()
  store %union.4* %13, %union.4** %4, align 8
  %14 = bitcast [2 x %Nat8]* @func222_str2 to %Str
  %15 = call i1 (%Str) @need (%Str %14)
  br label %endif_1
else_1:
  %16 = call %union.4* () @func223 ()
  store %union.4* %16, %union.4** %4, align 8
  br label %endif_1
endif_1:
  %17 = load %union.4*, %union.4** %4
  ret %union.4* %17
}

define %union.4* @func224 (%Token*) {
  %2 = bitcast [2 x %Nat8]* @func223_func224_str1 to %Str
  %3 = call i1 (%Str) @func191 (%Str %2)
  br i1 %3, label %then_0, label %else_0
then_0:
  %4 = call %union.4* () @func230 ()
  ret %union.4* %4
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %6 = bitcast [19 x %Nat8]* @func223_func224_str2 to %Str
  %7 = getelementptr inbounds %Token, %Token* %0, i1 0, i32 1
  call void (%Str, %TokenInfo*) @error (%Str %6, %TokenInfo* %7)
  %8 = bitcast [9 x %Nat8]* @func223_func224_str3 to %Str
  call void (i1, %Str) @assert (i1 0, %Str %8); loadImmPtr
  %9 = inttoptr i64 0 to%union.4*
  ret %union.4* %9
}

define %union.4* @func225 (%Token*) {
  %2 = bitcast [19 x %Nat8]* @func223_func225_str1 to %Str
  %3 = getelementptr inbounds %Token, %Token* %0, i1 0, i32 1
  call void (%Str, %TokenInfo*) @error (%Str %2, %TokenInfo* %3)
  %4 = bitcast [14 x %Nat8]* @func223_func225_str2 to %Str
  %5 = getelementptr inbounds %Token, %Token* %0, i1 0, i32 2
; index array
  %6 = getelementptr inbounds [0 x %Nat8], [0 x %Nat8]* %5, i1 0, %Int64 0
  %7 = call %Int32 (%Str, ...) @printf (%Str %4, %Nat8* %6)
  %8 = bitcast [9 x %Nat8]* @func223_func225_str3 to %Str
  call void (i1, %Str) @assert (i1 0, %Str %8); loadImmPtr
  %9 = inttoptr i64 0 to%union.4*
  ret %union.4* %9
}

define %union.4* @func223 () {
  %1 = call %Token* () @func183 ()
  %2 = getelementptr inbounds %Token, %Token* %1, i1 0, i32 0
  %3 = load %TokenKind, %TokenKind* %2
  br label %select_1_0
select_1_0:
  %4 = icmp eq %TokenKind %3, 1
  br i1 %4, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %5 = call %union.4* () @func226 ()
  br label %select_1_end
select_1_1:
  %6 = icmp eq %TokenKind %3, 2
  br i1 %6, label %select_1_1_ok, label %select_1_2
select_1_1_ok:
  %7 = call %union.4* () @func233 ()
  br label %select_1_end
select_1_2:
  %8 = icmp eq %TokenKind %3, 4
  br i1 %8, label %select_1_2_ok, label %select_1_3
select_1_2_ok:
  %9 = call %union.4* () @func228 ()
  br label %select_1_end
select_1_3:
  %10 = icmp eq %TokenKind %3, 3
  br i1 %10, label %select_1_3_ok, label %select_1_4
select_1_3_ok:
  %11 = call %union.4* (%Token*) @func224 (%Token* %1)
  br label %select_1_end
select_1_4:
  %12 = call %union.4* (%Token*) @func225 (%Token* %1)
  br label %select_1_end
select_1_end:
  %13 = phi %union.4* [ %5, %select_1_0_ok ], [ %7, %select_1_1_ok ], [ %9, %select_1_2_ok ], [ %11, %select_1_3_ok ], [ %12, %select_1_4 ]
  ret %union.4* %13
}

define %union.4* @func226 () {
  %1 = call %Token* () @func183 ()
  %2 = getelementptr inbounds %Token, %Token* %1, i1 0, i32 1
  %3 = bitcast [7 x %Nat8]* @func226_str1 to %Str
  %4 = call i1 (%Str) @func191 (%Str %3)
  br i1 %4, label %then_0, label %else_0
then_0:
  %5 = call %union.4* () @func232 ()
  ret %union.4* %5
  br label %endif_0
else_0:
  %7 = bitcast [5 x %Nat8]* @func226_str2 to %Str
  %8 = call i1 (%Str) @func191 (%Str %7)
  br i1 %8, label %then_1, label %else_1
then_1:
  %9 = call %union.4* () @func227 ()
  ret %union.4* %9
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  br label %endif_0
endif_0:
  %11 = call %AstId* () @parse_id (); loadImmPtr
  %12 = inttoptr i64 0 to%AstId*
  %13 = icmp eq %AstId* %11, %12
  br i1 %13, label %then_2, label %else_2
then_2:; loadImmPtr
  %14 = inttoptr i64 0 to%union.4*
  ret %union.4* %14
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
  %16 = insertvalue %AstName zeroinitializer, %AstId* %11, 0
  %17 = insertvalue %AstName %16, %TokenInfo* %2, 2
  %18 = alloca %union.4
; write variant 36
  %19 = getelementptr inbounds %union.4, %union.4* %18, i1 0, i32 0
  store %Int16 36, %Int16* %19, align 2
; write data
  %20 = getelementptr inbounds %union.4, %union.4* %18, i1 0, i32 1
  %21 = bitcast [56 x %Nat8]* %20 to %AstName*
  store %AstName %17, %AstName* %21, align 8
  %22 = load %union.4, %union.4* %18
  %23 = call %union.4* (%union.4) @func210 (%union.4 %22)
  ret %union.4* %23
  br label %fail
fail:; loadImmPtr
  %25 = inttoptr i64 0 to%union.4*
  ret %union.4* %25
}

define %union.4* @func227 () {
  %1 = call %Token* () @func183 ()
  %2 = alloca %List
  store %List zeroinitializer, %List* %2, align 8
  %3 = getelementptr inbounds %List, %List* %2, i1 0
  call void (%List*) @map_init (%List* %3)
  %4 = alloca %union.4*; loadImmPtr
  %5 = inttoptr i64 0 to%union.4*
  store %union.4* %5, %union.4** %4, align 8
  %6 = call %union.4* () @func211 ()
  call void () @skip_nl ()
  %7 = call %Token* () @func183 ()
  %8 = getelementptr inbounds %Token, %Token* %7, i1 0, i32 1
  %9 = bitcast [2 x %Nat8]* @func227_str1 to %Str
  %10 = call i1 (%Str) @need (%Str %9)
  call void () @skip_nl ()
  br label %again_0
again_0:
  %11 = bitcast [2 x %Nat8]* @func227_str2 to %Str
  %12 = call i1 (%Str) @func191 (%Str %11)
  %13 = xor i1 %12, 1
  br i1 %13, label %body_0, label %break_0
body_0:
  %14 = bitcast [5 x %Nat8]* @func227_str3 to %Str
  %15 = call i1 (%Str) @func191 (%Str %14)
  br i1 %15, label %then_0, label %else_0
then_0:
  %16 = bitcast [3 x %Nat8]* @func227_str4 to %Str
  %17 = call i1 (%Str) @need (%Str %16)
  %18 = call %union.4* () @func211 ()
  store %union.4* %18, %union.4** %4, align 8
  call void () @skip_nl ()
  br label %again_0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %20 = call %Unit* (%Nat32) @malloc (%Nat32 32)
  %21 = bitcast %Unit* %20 to %AstValueWhenVariant*
  %22 = bitcast %AstValueWhenVariant* %21 to %Unit*
  %23 = call %Unit* (%Unit*, %Nat8, %Nat32) @memset (%Unit* %22, %Nat8 0, %Nat32 32)
  %24 = call i1 () @func250 ()
  br i1 %24, label %then_1, label %else_1
then_1:
  %25 = getelementptr inbounds %AstValueWhenVariant, %AstValueWhenVariant* %21, i1 0, i32 0
  %26 = call %union.2* () @func202 ()
  store %union.2* %26, %union.2** %25, align 8
  br label %endif_1
else_1:
  %27 = getelementptr inbounds %AstValueWhenVariant, %AstValueWhenVariant* %21, i1 0, i32 1
  %28 = call %union.4* () @func211 ()
  store %union.4* %28, %union.4** %27, align 8
  br label %endif_1
endif_1:
  %29 = bitcast [3 x %Nat8]* @func227_str5 to %Str
  %30 = call i1 (%Str) @need (%Str %29)
  %31 = getelementptr inbounds %AstValueWhenVariant, %AstValueWhenVariant* %21, i1 0, i32 2
  %32 = call %union.4* () @func211 ()
  store %union.4* %32, %union.4** %31, align 8
  call void () @skip_nl ()
  %33 = getelementptr inbounds %List, %List* %2, i1 0
  %34 = bitcast %AstValueWhenVariant* %21 to %Unit*
  %35 = call i1 (%List*, %Unit*) @list_append (%List* %33, %Unit* %34)
  br label %again_0
break_0:
  %36 = insertvalue %AstValueWhen zeroinitializer, %union.4* %6, 0
  %37 = load %List, %List* %2
  %38 = insertvalue %AstValueWhen %36, %List %37, 1
  %39 = load %union.4*, %union.4** %4
  %40 = insertvalue %AstValueWhen %38, %union.4* %39, 2
  %41 = insertvalue %AstValueWhen %40, %TokenInfo* %8, 3
  %42 = alloca %union.4
; write variant 2
  %43 = getelementptr inbounds %union.4, %union.4* %42, i1 0, i32 0
  store %Int16 2, %Int16* %43, align 2
; write data
  %44 = getelementptr inbounds %union.4, %union.4* %42, i1 0, i32 1
  %45 = bitcast [56 x %Nat8]* %44 to %AstValueWhen*
  store %AstValueWhen %41, %AstValueWhen* %45, align 8
  %46 = load %union.4, %union.4* %42
  %47 = call %union.4* (%union.4) @func210 (%union.4 %46)
  ret %union.4* %47
}

define %union.4* @func228 () {
  %1 = call %Token* () @func183 ()
  %2 = getelementptr inbounds %Token, %Token* %1, i1 0, i32 2
  %3 = bitcast [0 x %Nat8]* %2 to %Str
  %4 = call %Nat32 (%Str) @strlen (%Str %3)
  %5 = add %Nat32 %4, 1
  %6 = bitcast [0 x %Nat8]* %2 to %Str
  %7 = call %Str (%Str) @dup (%Str %6)
  call void () @skip ()
  %8 = insertvalue %AstValueString zeroinitializer, %Str %7, 0
  %9 = getelementptr inbounds %Token, %Token* %1, i1 0, i32 1
  %10 = insertvalue %AstValueString %8, %TokenInfo* %9, 1
  %11 = alloca %union.4
; write variant 33
  %12 = getelementptr inbounds %union.4, %union.4* %11, i1 0, i32 0
  store %Int16 33, %Int16* %12, align 2
; write data
  %13 = getelementptr inbounds %union.4, %union.4* %11, i1 0, i32 1
  %14 = bitcast [56 x %Nat8]* %13 to %AstValueString*
  store %AstValueString %10, %AstValueString* %14, align 8
  %15 = load %union.4, %union.4* %11
  %16 = call %union.4* (%union.4) @func210 (%union.4 %15)
  ret %union.4* %16
}

define %union.4* @func229 () {
  %1 = alloca %List
  store %List zeroinitializer, %List* %1, align 8
  %2 = call %Token* () @func183 ()
  %3 = getelementptr inbounds %Token, %Token* %2, i1 0, i32 1
  br label %again_0
again_0:
  br i1 1, label %body_0, label %break_0
body_0:
  %4 = call %AstId* () @parse_id ()
  %5 = bitcast [2 x %Nat8]* @func229_str1 to %Str
  %6 = call i1 (%Str) @need (%Str %5)
  %7 = call %union.4* () @func211 ()
  %8 = getelementptr inbounds %List, %List* %1, i1 0
  %9 = getelementptr inbounds %AstId, %AstId* %4, i1 0, i32 0
  %10 = load %Str, %Str* %9
  %11 = bitcast %union.4* %7 to %Unit*
  %12 = call i1 (%List*, %Str, %Unit*) @map_append (%List* %8, %Str %10, %Unit* %11)
  %13 = bitcast [2 x %Nat8]* @func229_str2 to %Str
  %14 = call i1 (%Str) @func191 (%Str %13)
  br i1 %14, label %then_0, label %else_0
then_0:
  br label %break_0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %16 = bitcast [2 x %Nat8]* @func229_str3 to %Str
  %17 = call i1 (%Str) @need (%Str %16)
  br label %again_0
break_0:
  %18 = load %List, %List* %1
  %19 = insertvalue %AstValueRecord zeroinitializer, %List %18, 0
  %20 = insertvalue %AstValueRecord %19, %TokenInfo* %3, 1
  %21 = alloca %union.4
; write variant 35
  %22 = getelementptr inbounds %union.4, %union.4* %21, i1 0, i32 0
  store %Int16 35, %Int16* %22, align 2
; write data
  %23 = getelementptr inbounds %union.4, %union.4* %21, i1 0, i32 1
  %24 = bitcast [56 x %Nat8]* %23 to %AstValueRecord*
  store %AstValueRecord %20, %AstValueRecord* %24, align 8
  %25 = load %union.4, %union.4* %21
  %26 = call %union.4* (%union.4) @func210 (%union.4 %25)
  ret %union.4* %26
}

define %union.4* @func230 () {
  %1 = call %Token* () @func183 ()
  %2 = getelementptr inbounds %Token, %Token* %1, i1 0, i32 1
  %3 = bitcast [2 x %Nat8]* @func230_str1 to %Str
  %4 = call i1 (%Str) @func191 (%Str %3)
  %5 = alloca %List
  store %List zeroinitializer, %List* %5, align 8
  %6 = alloca %Nat32
  store %Nat32 0, %Nat32* %6, align 4
  br label %again_0
again_0:
  br i1 1, label %body_0, label %break_0
body_0:
  %7 = call %union.4* () @func211 ()
  %8 = getelementptr inbounds %List, %List* %5, i1 0
  %9 = bitcast %union.4* %7 to %Unit*
  %10 = call i1 (%List*, %Unit*) @list_append (%List* %8, %Unit* %9)
  %11 = load %Nat32, %Nat32* %6
  %12 = add %Nat32 %11, 1
  store %Nat32 %12, %Nat32* %6, align 4
  %13 = bitcast [2 x %Nat8]* @func230_str2 to %Str
  %14 = call i1 (%Str) @func191 (%Str %13)
  br i1 %14, label %then_0, label %else_0
then_0:
  br label %break_0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %16 = bitcast [2 x %Nat8]* @func230_str3 to %Str
  %17 = call i1 (%Str) @need (%Str %16)
  br label %again_0
break_0:
  %18 = load %List, %List* %5
  %19 = insertvalue %AstValueArray zeroinitializer, %List %18, 0
  %20 = insertvalue %AstValueArray %19, %TokenInfo* %2, 1
  %21 = alloca %union.4
; write variant 34
  %22 = getelementptr inbounds %union.4, %union.4* %21, i1 0, i32 0
  store %Int16 34, %Int16* %22, align 2
; write data
  %23 = getelementptr inbounds %union.4, %union.4* %21, i1 0, i32 1
  %24 = bitcast [56 x %Nat8]* %23 to %AstValueArray*
  store %AstValueArray %20, %AstValueArray* %24, align 8
  %25 = load %union.4, %union.4* %21
  %26 = call %union.4* (%union.4) @func210 (%union.4 %25)
  ret %union.4* %26
}

define %union.4* @func231 () {
  %1 = call %Token* () @func183 ()
  %2 = getelementptr inbounds %Token, %Token* %1, i1 0, i32 1
  %3 = call %union.2* () @func202 ()
  call void () @skip_nl ()
  %4 = call %Token* () @func183 ()
  %5 = getelementptr inbounds %Token, %Token* %4, i1 0, i32 1
  %6 = bitcast [2 x %Nat8]* @func231_str1 to %Str
  %7 = call i1 (%Str) @need (%Str %6)
  %8 = call %union.17 (%TokenInfo*) @func242 (%TokenInfo* %5)
  %9 = insertvalue %AstValueFunc zeroinitializer, %union.2* %3, 0
  %10 = bitcast %union.17 %8 to %union.7*
  %11 = bitcast %union.7* %10 to %union.3
  %12 = insertvalue %AstValueFunc %9, %union.3 %11, 1
  %13 = insertvalue %AstValueFunc %12, %TokenInfo* %5, 2
  %14 = alloca %union.4
; write variant 31
  %15 = getelementptr inbounds %union.4, %union.4* %14, i1 0, i32 0
  store %Int16 31, %Int16* %15, align 2
; write data
  %16 = getelementptr inbounds %union.4, %union.4* %14, i1 0, i32 1
  %17 = bitcast [56 x %Nat8]* %16 to %AstValueFunc*
  store %AstValueFunc %13, %AstValueFunc* %17, align 16
  %18 = load %union.4, %union.4* %14
  %19 = call %union.4* (%union.4) @func210 (%union.4 %18)
  ret %union.4* %19
}

define %union.4* @func232 () {
  %1 = call %Token* () @func183 ()
  %2 = getelementptr inbounds %Token, %Token* %1, i1 0, i32 1
  %3 = call %union.2* () @func202 ()
  %4 = insertvalue %AstValueFunc zeroinitializer, %union.2* %3, 0
  %5 = inttoptr %Unit zeroinitializer to %union.3
  %6 = insertvalue %AstValueFunc %4, %union.3 %5, 1
  %7 = insertvalue %AstValueFunc %6, %TokenInfo* %2, 2
  %8 = alloca %union.4
; write variant 31
  %9 = getelementptr inbounds %union.4, %union.4* %8, i1 0, i32 0
  store %Int16 31, %Int16* %9, align 2
; write data
  %10 = getelementptr inbounds %union.4, %union.4* %8, i1 0, i32 1
  %11 = bitcast [56 x %Nat8]* %10 to %AstValueFunc*
  store %AstValueFunc %7, %AstValueFunc* %11, align 16
  %12 = load %union.4, %union.4* %8
  %13 = call %union.4* (%union.4) @func210 (%union.4 %12)
  ret %union.4* %13
}

define %union.4* @func233 () {
  %1 = call %Token* () @func183 ()
  %2 = getelementptr inbounds %Token, %Token* %1, i1 0, i32 1
  %3 = getelementptr inbounds %Token, %Token* %1, i1 0, i32 2
; index array
  %4 = getelementptr inbounds [0 x %Nat8], [0 x %Nat8]* %3, i1 0, %Int64 0
  %5 = bitcast %Nat8* %4 to %Str
  %6 = call %Str (%Str) @dup (%Str %5)
  call void () @skip ()
  %7 = insertvalue %AstValueNumber zeroinitializer, %Str %6, 0
  %8 = insertvalue %AstValueNumber %7, %TokenInfo* %2, 1
  %9 = alloca %union.4
; write variant 32
  %10 = getelementptr inbounds %union.4, %union.4* %9, i1 0, i32 0
  store %Int16 32, %Int16* %10, align 2
; write data
  %11 = getelementptr inbounds %union.4, %union.4* %9, i1 0, i32 1
  %12 = bitcast [56 x %Nat8]* %11 to %AstValueNumber*
  store %AstValueNumber %8, %AstValueNumber* %12, align 8
  %13 = load %union.4, %union.4* %9
  %14 = call %union.4* (%union.4) @func210 (%union.4 %13)
  ret %union.4* %14
}

define %union.7* @ast_stmt_boxing (%union.7) {
  %2 = call %Unit* (%Nat32) @malloc (%Nat32 64)
  %3 = bitcast %Unit* %2 to %union.7*; loadImmPtr
  %4 = inttoptr i64 0 to%union.7*
  %5 = icmp ne %union.7* %3, %4
  %6 = bitcast [23 x %Nat8]* @func234_str1 to %Str
  call void (i1, %Str) @assert (i1 %5, %Str %6)
  store %union.7 %0, %union.7* %3, align 64
  ret %union.7* %3
}

define %union.17 @func235 (%TokenInfo*) {
  %2 = insertvalue %AstStmtBreak zeroinitializer, %TokenInfo* %0, 0
  %3 = alloca %union.7
; write variant 0
  %4 = getelementptr inbounds %union.7, %union.7* %3, i1 0, i32 0
  store %Int16 0, %Int16* %4, align 2
; write data
  %5 = getelementptr inbounds %union.7, %union.7* %3, i1 0, i32 1
  %6 = bitcast [48 x %Nat8]* %5 to %AstStmtBreak*
  store %AstStmtBreak %2, %AstStmtBreak* %6, align 8
  %7 = load %union.7, %union.7* %3
  %8 = call %union.7* (%union.7) @ast_stmt_boxing (%union.7 %7)
  %9 = bitcast %union.7* %8 to %union.17
  ret %union.17 %9
}

define %union.17 @func236 (%TokenInfo*) {
  %2 = insertvalue %AstStmtAgain zeroinitializer, %TokenInfo* %0, 0
  %3 = alloca %union.7
; write variant 1
  %4 = getelementptr inbounds %union.7, %union.7* %3, i1 0, i32 0
  store %Int16 1, %Int16* %4, align 2
; write data
  %5 = getelementptr inbounds %union.7, %union.7* %3, i1 0, i32 1
  %6 = bitcast [48 x %Nat8]* %5 to %AstStmtAgain*
  store %AstStmtAgain %2, %AstStmtAgain* %6, align 8
  %7 = load %union.7, %union.7* %3
  %8 = call %union.7* (%union.7) @ast_stmt_boxing (%union.7 %7)
  %9 = bitcast %union.7* %8 to %union.17
  ret %union.17 %9
}

define %union.19 @func238 () {
  %1 = call %Token* () @func183 ()
  %2 = getelementptr inbounds %Token, %Token* %1, i1 0, i32 0
  %3 = load %TokenKind, %TokenKind* %2
  %4 = icmp eq %TokenKind %3, 1
  br i1 %4, label %then_0, label %else_0
then_0:
  %5 = call %Token* () @nextok ()
  %6 = getelementptr inbounds %Token, %Token* %5, i1 0, i32 2
; index array
  %7 = getelementptr inbounds [0 x %Nat8], [0 x %Nat8]* %6, i1 0, %Int64 0
  %8 = load %Nat8, %Nat8* %7
; index array
  %9 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func237_func238_str1, i1 0, %Int64 0
  %10 = load %Nat8, %Nat8* %9
  %11 = icmp eq %Nat8 %8, %10
  %12 = getelementptr inbounds %Token, %Token* %5, i1 0, i32 1
  %13 = getelementptr inbounds %TokenInfo, %TokenInfo* %12, i1 0, i32 2
  %14 = load %Nat16, %Nat16* %13
  %15 = icmp eq %Nat16 %14, 1
  %16 = and i1 %11, %15
  br i1 %16, label %then_1, label %else_1
then_1:
  %17 = call %AstId* () @parse_id ()
  call void () @skip ()
  %18 = call %Token* () @func183 ()
  %19 = getelementptr inbounds %Token, %Token* %18, i1 0, i32 1
  %20 = insertvalue %AstStmtLabel zeroinitializer, %AstId* %17, 0
  %21 = insertvalue %AstStmtLabel %20, %TokenInfo* %19, 1
  %22 = alloca %union.7
; write variant 2
  %23 = getelementptr inbounds %union.7, %union.7* %22, i1 0, i32 0
  store %Int16 2, %Int16* %23, align 2
; write data
  %24 = getelementptr inbounds %union.7, %union.7* %22, i1 0, i32 1
  %25 = bitcast [48 x %Nat8]* %24 to %AstStmtLabel*
  store %AstStmtLabel %21, %AstStmtLabel* %25, align 8
  %26 = load %union.7, %union.7* %22
  %27 = call %union.7* (%union.7) @ast_stmt_boxing (%union.7 %26)
  %28 = bitcast %union.7* %27 to %union.19
  ret %union.19 %28
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %30 = getelementptr inbounds %Token, %Token* %1, i1 0, i32 1
  %31 = call %union.17 (%TokenInfo*) @func239 (%TokenInfo* %30)
  ret %union.17 %31
}

define %union.18 @parse_stmt () {
  %1 = call %Token* () @func183 ()
  %2 = call %Token* () @nextok ()
  %3 = getelementptr inbounds %Token, %Token* %1, i1 0, i32 1
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
  %13 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func237_str1, i1 0, %Int64 0
  %14 = load %Nat8, %Nat8* %13
  %15 = icmp eq %Nat8 %12, %14
  %16 = and i1 %9, %15
  %17 = and i1 %6, %16
  br i1 %17, label %then_0, label %else_0
then_0:
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
  %23 = call %union.17 (%TokenInfo*) @func241 (%TokenInfo* %3)
  br label %select_1_end
select_1_1:
  %24 = call %union.17 (%TokenInfo*) @func240 (%TokenInfo* %3)
  br label %select_1_end
select_1_end:
  %25 = phi %union.17 [ %23, %select_1_0_ok ], [ %24, %select_1_1 ]
  ret %union.17 %25
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  br label %select_2_0
select_2_0:
  %27 = bitcast [2 x %Nat8]* @func237_str2 to %Str
  %28 = call i1 (%Str) @func191 (%Str %27)
  %29 = icmp eq i1 1, %28
  br i1 %29, label %select_2_0_ok, label %select_2_1
select_2_0_ok:
  %30 = call %union.17 (%TokenInfo*) @func242 (%TokenInfo* %3)
  br label %select_2_end
select_2_1:
  %31 = bitcast [3 x %Nat8]* @func237_str3 to %Str
  %32 = call i1 (%Str) @func191 (%Str %31)
  %33 = icmp eq i1 1, %32
  br i1 %33, label %select_2_1_ok, label %select_2_2
select_2_1_ok:
  %34 = call %union.17 (%TokenInfo*) @func243 (%TokenInfo* %3)
  br label %select_2_end
select_2_2:
  %35 = bitcast [6 x %Nat8]* @func237_str4 to %Str
  %36 = call i1 (%Str) @func191 (%Str %35)
  %37 = icmp eq i1 1, %36
  br i1 %37, label %select_2_2_ok, label %select_2_3
select_2_2_ok:
  %38 = call %union.17 (%TokenInfo*) @func244 (%TokenInfo* %3)
  br label %select_2_end
select_2_3:
  %39 = bitcast [7 x %Nat8]* @func237_str5 to %Str
  %40 = call i1 (%Str) @func191 (%Str %39)
  %41 = icmp eq i1 1, %40
  br i1 %41, label %select_2_3_ok, label %select_2_4
select_2_3_ok:
  %42 = call %union.17 (%TokenInfo*) @func245 (%TokenInfo* %3)
  br label %select_2_end
select_2_4:
  %43 = bitcast [6 x %Nat8]* @func237_str6 to %Str
  %44 = call i1 (%Str) @func191 (%Str %43)
  %45 = icmp eq i1 1, %44
  br i1 %45, label %select_2_4_ok, label %select_2_5
select_2_4_ok:
  %46 = call %union.17 (%TokenInfo*) @func235 (%TokenInfo* %3)
  br label %select_2_end
select_2_5:
  %47 = bitcast [6 x %Nat8]* @func237_str7 to %Str
  %48 = call i1 (%Str) @func191 (%Str %47)
  %49 = icmp eq i1 1, %48
  br i1 %49, label %select_2_5_ok, label %select_2_6
select_2_5_ok:
  %50 = call %union.17 (%TokenInfo*) @func236 (%TokenInfo* %3)
  br label %select_2_end
select_2_6:
  %51 = bitcast [5 x %Nat8]* @func237_str8 to %Str
  %52 = call i1 (%Str) @func191 (%Str %51)
  %53 = icmp eq i1 1, %52
  br i1 %53, label %select_2_6_ok, label %select_2_7
select_2_6_ok:
  %54 = call %union.17 (%TokenInfo*) @func246 (%TokenInfo* %3)
  br label %select_2_end
select_2_7:
  %55 = call %union.19 () @func238 ()
  br label %select_2_end
select_2_end:
  %56 = phi %union.17 [ %30, %select_2_0_ok ], [ %34, %select_2_1_ok ], [ %38, %select_2_2_ok ], [ %42, %select_2_3_ok ], [ %46, %select_2_4_ok ], [ %50, %select_2_5_ok ], [ %54, %select_2_6_ok ], [ %55, %select_2_7 ]
  ret %union.17 %56
}

define %union.17 @func239 (%TokenInfo*) {
  %2 = call %union.4* () @func211 ()
  %3 = call %Token* () @func183 ()
  %4 = getelementptr inbounds %Token, %Token* %3, i1 0, i32 1
  %5 = bitcast [3 x %Nat8]* @func239_str1 to %Str
  %6 = call i1 (%Str) @func191 (%Str %5)
  br i1 %6, label %then_0, label %else_0
then_0:
  %7 = call %union.4* () @func211 ()
  %8 = insertvalue %AstStmtAssign zeroinitializer, %union.4* %2, 0
  %9 = insertvalue %AstStmtAssign %8, %union.4* %7, 1
  %10 = insertvalue %AstStmtAssign %9, %TokenInfo* %4, 2
  %11 = alloca %union.7
; write variant 11
  %12 = getelementptr inbounds %union.7, %union.7* %11, i1 0, i32 0
  store %Int16 11, %Int16* %12, align 2
; write data
  %13 = getelementptr inbounds %union.7, %union.7* %11, i1 0, i32 1
  %14 = bitcast [48 x %Nat8]* %13 to %AstStmtAssign*
  store %AstStmtAssign %10, %AstStmtAssign* %14, align 8
  %15 = load %union.7, %union.7* %11
  %16 = call %union.7* (%union.7) @ast_stmt_boxing (%union.7 %15)
  %17 = bitcast %union.7* %16 to %union.17
  ret %union.17 %17
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %19 = insertvalue %AstStmtExpr zeroinitializer, %union.4* %2, 0
  %20 = insertvalue %AstStmtExpr %19, %TokenInfo* %0, 1
  %21 = alloca %union.7
; write variant 8
  %22 = getelementptr inbounds %union.7, %union.7* %21, i1 0, i32 0
  store %Int16 8, %Int16* %22, align 2
; write data
  %23 = getelementptr inbounds %union.7, %union.7* %21, i1 0, i32 1
  %24 = bitcast [48 x %Nat8]* %23 to %AstStmtExpr*
  store %AstStmtExpr %20, %AstStmtExpr* %24, align 8
  %25 = load %union.7, %union.7* %21
  %26 = call %union.7* (%union.7) @ast_stmt_boxing (%union.7 %25)
  %27 = bitcast %union.7* %26 to %union.17
  ret %union.17 %27
}

define %union.17 @func240 (%TokenInfo*) {
  %2 = call %Token* () @func183 ()
  %3 = getelementptr inbounds %Token, %Token* %2, i1 0, i32 1
  %4 = call %AstId* () @parse_id ()
  %5 = bitcast [2 x %Nat8]* @func240_str1 to %Str
  %6 = call i1 (%Str) @need (%Str %5)
  %7 = call %union.4* () @func211 (); loadImmPtr
  %8 = inttoptr i64 0 to%AstId*
  %9 = icmp eq %AstId* %4, %8; loadImmPtr
  %10 = inttoptr i64 0 to%union.4*
  %11 = icmp eq %union.4* %7, %10
  %12 = or i1 %9, %11
  br i1 %12, label %then_0, label %else_0
then_0:
  %13 = inttoptr %Unit zeroinitializer to %union.17
  ret %union.17 %13
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %15 = insertvalue %AstStmtValueBind zeroinitializer, %AstId* %4, 0
  %16 = insertvalue %AstStmtValueBind %15, %union.4* %7, 1
  %17 = insertvalue %AstStmtValueBind %16, %TokenInfo* %3, 2
  %18 = alloca %union.7
; write variant 10
  %19 = getelementptr inbounds %union.7, %union.7* %18, i1 0, i32 0
  store %Int16 10, %Int16* %19, align 2
; write data
  %20 = getelementptr inbounds %union.7, %union.7* %18, i1 0, i32 1
  %21 = bitcast [48 x %Nat8]* %20 to %AstStmtValueBind*
  store %AstStmtValueBind %17, %AstStmtValueBind* %21, align 8
  %22 = load %union.7, %union.7* %18
  %23 = call %union.7* (%union.7) @ast_stmt_boxing (%union.7 %22)
  %24 = bitcast %union.7* %23 to %union.17
  ret %union.17 %24
}

define %union.17 @func241 (%TokenInfo*) {
  %2 = call %Token* () @func183 ()
  %3 = getelementptr inbounds %Token, %Token* %2, i1 0, i32 1
  %4 = call %AstId* () @parse_id ()
  %5 = bitcast [2 x %Nat8]* @func241_str1 to %Str
  %6 = call i1 (%Str) @need (%Str %5)
  %7 = call %union.2* () @func202 (); loadImmPtr
  %8 = inttoptr i64 0 to%AstId*
  %9 = icmp eq %AstId* %4, %8; loadImmPtr
  %10 = inttoptr i64 0 to%union.2*
  %11 = icmp eq %union.2* %7, %10
  %12 = or i1 %9, %11
  br i1 %12, label %then_0, label %else_0
then_0:
  %13 = inttoptr %Unit zeroinitializer to %union.17
  ret %union.17 %13
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %15 = insertvalue %AstStmtTypeBind zeroinitializer, %AstId* %4, 0
  %16 = insertvalue %AstStmtTypeBind %15, %union.2* %7, 1
  %17 = insertvalue %AstStmtTypeBind %16, %TokenInfo* %3, 2
  %18 = alloca %union.7
; write variant 9
  %19 = getelementptr inbounds %union.7, %union.7* %18, i1 0, i32 0
  store %Int16 9, %Int16* %19, align 2
; write data
  %20 = getelementptr inbounds %union.7, %union.7* %18, i1 0, i32 1
  %21 = bitcast [48 x %Nat8]* %20 to %AstStmtTypeBind*
  store %AstStmtTypeBind %17, %AstStmtTypeBind* %21, align 8
  %22 = load %union.7, %union.7* %18
  %23 = call %union.7* (%union.7) @ast_stmt_boxing (%union.7 %22)
  %24 = bitcast %union.7* %23 to %union.17
  ret %union.17 %24
}

define %union.17 @func242 (%TokenInfo*) {
  %2 = alloca %List
  store %List zeroinitializer, %List* %2, align 8
  %3 = getelementptr inbounds %List, %List* %2, i1 0
  call void (%List*) @map_init (%List* %3)
  br label %again_0
again_0:
  %4 = bitcast [2 x %Nat8]* @func242_str1 to %Str
  %5 = call i1 (%Str) @func191 (%Str %4)
  %6 = xor i1 %5, 1
  br i1 %6, label %body_0, label %break_0
body_0:
  call void () @skip_nl ()
  %7 = call i1 () @eof ()
  br i1 %7, label %then_0, label %else_0
then_0:
  %8 = bitcast [23 x %Nat8]* @func242_str2 to %Str
  call void (%Str) @fatal (%Str %8)
  br label %break_0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %10 = bitcast [2 x %Nat8]* @func242_str3 to %Str
  %11 = call i1 (%Str) @func191 (%Str %10)
  br i1 %11, label %then_1, label %else_1
then_1:
  br label %break_0
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  %13 = call %union.18 () @parse_stmt ()
  %14 = bitcast %Int64 0 to %Int64
  %15 = ptrtoint %union.18 %13 to %Int64
  %16 = icmp eq %Int64 %15, %14
  %17 = xor i1 %16, 1
  br i1 %17, label %then_2, label %else_2
then_2:
  %18 = call i1 () @need_sep ()
  %19 = getelementptr inbounds %List, %List* %2, i1 0
  %20 = bitcast %union.18 %13 to %union.7*
  %21 = bitcast %union.7* %20 to %Unit*
  %22 = call i1 (%List*, %Unit*) @list_append (%List* %19, %Unit* %21)
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
  br label %again_0
break_0:
  %23 = load %List, %List* %2
  %24 = insertvalue %AstStmtBlock zeroinitializer, %List %23, 0
  %25 = insertvalue %AstStmtBlock %24, %TokenInfo* %0, 1
  %26 = alloca %union.7
; write variant 7
  %27 = getelementptr inbounds %union.7, %union.7* %26, i1 0, i32 0
  store %Int16 7, %Int16* %27, align 2
; write data
  %28 = getelementptr inbounds %union.7, %union.7* %26, i1 0, i32 1
  %29 = bitcast [48 x %Nat8]* %28 to %AstStmtBlock*
  store %AstStmtBlock %25, %AstStmtBlock* %29, align 8
  %30 = load %union.7, %union.7* %26
  %31 = call %union.7* (%union.7) @ast_stmt_boxing (%union.7 %30)
  %32 = bitcast %union.7* %31 to %union.17
  ret %union.17 %32
}

define %union.17 @func243 (%TokenInfo*) {
  %2 = call %union.4* () @func211 ()
  %3 = bitcast [2 x %Nat8]* @func243_str1 to %Str
  %4 = call i1 (%Str) @func191 (%Str %3)
  %5 = call %Token* () @func183 ()
  %6 = getelementptr inbounds %Token, %Token* %5, i1 0, i32 1
  %7 = bitcast [2 x %Nat8]* @func243_str2 to %Str
  %8 = call i1 (%Str) @need (%Str %7)
  %9 = call %union.17 (%TokenInfo*) @func242 (%TokenInfo* %6)
  %10 = alloca %union.20
  %11 = inttoptr %Unit zeroinitializer to %union.20
  store %union.20 %11, %union.20* %10, align 16
  %12 = bitcast [5 x %Nat8]* @func243_str3 to %Str
  %13 = call i1 (%Str) @func191 (%Str %12)
  br i1 %13, label %then_0, label %else_0
then_0:
  %14 = bitcast [2 x %Nat8]* @func243_str4 to %Str
  %15 = call i1 (%Str) @func191 (%Str %14)
  %16 = call %Token* () @func183 ()
  %17 = getelementptr inbounds %Token, %Token* %16, i1 0, i32 1
  %18 = bitcast [3 x %Nat8]* @func243_str5 to %Str
  %19 = call i1 (%Str) @func191 (%Str %18)
  br i1 %19, label %then_1, label %else_1
then_1:
  %20 = call %union.17 (%TokenInfo*) @func243 (%TokenInfo* %17)
  store %union.17 %20, %union.17* %10, align 16
  br label %endif_1
else_1:
  %21 = bitcast [2 x %Nat8]* @func243_str6 to %Str
  %22 = call i1 (%Str) @need (%Str %21)
  %23 = call %union.17 (%TokenInfo*) @func242 (%TokenInfo* %17)
  store %union.17 %23, %union.17* %10, align 16
  br label %endif_1
endif_1:
  br label %endif_0
else_0:
  br label %endif_0
endif_0:; loadImmPtr
  %24 = inttoptr i64 0 to%union.4*
  %25 = icmp eq %union.4* %2, %24
  br i1 %25, label %then_2, label %else_2
then_2:
  %26 = inttoptr %Unit zeroinitializer to %union.17
  ret %union.17 %26
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
  %28 = bitcast %Int64 0 to %Int64
  %29 = ptrtoint %union.17 %9 to %Int64
  %30 = icmp eq %Int64 %29, %28
  br i1 %30, label %then_3, label %else_3
then_3:
  %31 = inttoptr %Unit zeroinitializer to %union.17
  ret %union.17 %31
  br label %endif_3
else_3:
  br label %endif_3
endif_3:
  %33 = insertvalue %AstStmtIf zeroinitializer, %union.4* %2, 0
  %34 = bitcast %union.17 %9 to %union.7*
  %35 = insertvalue %AstStmtIf %33, %union.7* %34, 1
  %36 = load %union.20, %union.20* %10
  %37 = insertvalue %AstStmtIf %35, %union.20 %36, 2
  %38 = insertvalue %AstStmtIf %37, %TokenInfo* %0, 3
  %39 = alloca %union.7
; write variant 6
  %40 = getelementptr inbounds %union.7, %union.7* %39, i1 0, i32 0
  store %Int16 6, %Int16* %40, align 2
; write data
  %41 = getelementptr inbounds %union.7, %union.7* %39, i1 0, i32 1
  %42 = bitcast [48 x %Nat8]* %41 to %AstStmtIf*
  store %AstStmtIf %38, %AstStmtIf* %42, align 16
  %43 = load %union.7, %union.7* %39
  %44 = call %union.7* (%union.7) @ast_stmt_boxing (%union.7 %43)
  %45 = bitcast %union.7* %44 to %union.17
  ret %union.17 %45
}

define %union.17 @func244 (%TokenInfo*) {
  %2 = call %union.4* () @func211 ()
  %3 = bitcast [2 x %Nat8]* @func244_str1 to %Str
  %4 = call i1 (%Str) @func191 (%Str %3)
  %5 = call %Token* () @func183 ()
  %6 = getelementptr inbounds %Token, %Token* %5, i1 0, i32 1
  %7 = bitcast [2 x %Nat8]* @func244_str2 to %Str
  %8 = call i1 (%Str) @need (%Str %7)
  %9 = call %union.17 (%TokenInfo*) @func242 (%TokenInfo* %6); loadImmPtr
  %10 = inttoptr i64 0 to%union.4*
  %11 = icmp eq %union.4* %2, %10
  br i1 %11, label %then_0, label %else_0
then_0:
  %12 = inttoptr %Unit zeroinitializer to %union.17
  ret %union.17 %12
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %14 = bitcast %Int64 0 to %Int64
  %15 = ptrtoint %union.17 %9 to %Int64
  %16 = icmp eq %Int64 %15, %14
  br i1 %16, label %then_1, label %else_1
then_1:
  %17 = inttoptr %Unit zeroinitializer to %union.17
  ret %union.17 %17
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  %19 = insertvalue %AstStmtWhile zeroinitializer, %union.4* %2, 0
  %20 = bitcast %union.17 %9 to %union.7*
  %21 = insertvalue %AstStmtWhile %19, %union.7* %20, 1
  %22 = insertvalue %AstStmtWhile %21, %TokenInfo* %0, 2
  %23 = alloca %union.7
; write variant 5
  %24 = getelementptr inbounds %union.7, %union.7* %23, i1 0, i32 0
  store %Int16 5, %Int16* %24, align 2
; write data
  %25 = getelementptr inbounds %union.7, %union.7* %23, i1 0, i32 1
  %26 = bitcast [48 x %Nat8]* %25 to %AstStmtWhile*
  store %AstStmtWhile %22, %AstStmtWhile* %26, align 8
  %27 = load %union.7, %union.7* %23
  %28 = call %union.7* (%union.7) @ast_stmt_boxing (%union.7 %27)
  %29 = bitcast %union.7* %28 to %union.17
  ret %union.17 %29
}

define %union.17 @func245 (%TokenInfo*) {
  %2 = call i1 () @func187 ()
  br i1 %2, label %then_0, label %else_0
then_0:
  %3 = inttoptr %Unit zeroinitializer to %union.6
  %4 = insertvalue %AstStmtReturn zeroinitializer, %union.6 %3, 0
  %5 = insertvalue %AstStmtReturn %4, %TokenInfo* %0, 1
  %6 = alloca %union.7
; write variant 4
  %7 = getelementptr inbounds %union.7, %union.7* %6, i1 0, i32 0
  store %Int16 4, %Int16* %7, align 2
; write data
  %8 = getelementptr inbounds %union.7, %union.7* %6, i1 0, i32 1
  %9 = bitcast [48 x %Nat8]* %8 to %AstStmtReturn*
  store %AstStmtReturn %5, %AstStmtReturn* %9, align 16
  %10 = load %union.7, %union.7* %6
  %11 = call %union.7* (%union.7) @ast_stmt_boxing (%union.7 %10)
  %12 = bitcast %union.7* %11 to %union.17
  ret %union.17 %12
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %14 = call %Token* () @func183 ()
  %15 = getelementptr inbounds %Token, %Token* %14, i1 0, i32 1
  %16 = call %union.4* () @func211 (); loadImmPtr
  %17 = inttoptr i64 0 to%union.4*
  %18 = icmp eq %union.4* %16, %17
  br i1 %18, label %then_1, label %else_1
then_1:
  %19 = bitcast [27 x %Nat8]* @func245_str1 to %Str
  call void (%Str, %TokenInfo*) @error (%Str %19, %TokenInfo* %15)
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  %20 = bitcast %union.4* %16 to %union.6
  %21 = insertvalue %AstStmtReturn zeroinitializer, %union.6 %20, 0
  %22 = insertvalue %AstStmtReturn %21, %TokenInfo* %15, 1
  %23 = alloca %union.7
; write variant 4
  %24 = getelementptr inbounds %union.7, %union.7* %23, i1 0, i32 0
  store %Int16 4, %Int16* %24, align 2
; write data
  %25 = getelementptr inbounds %union.7, %union.7* %23, i1 0, i32 1
  %26 = bitcast [48 x %Nat8]* %25 to %AstStmtReturn*
  store %AstStmtReturn %22, %AstStmtReturn* %26, align 16
  %27 = load %union.7, %union.7* %23
  %28 = call %union.7* (%union.7) @ast_stmt_boxing (%union.7 %27)
  %29 = bitcast %union.7* %28 to %union.17
  ret %union.17 %29
}

define %union.17 @func246 (%TokenInfo*) {
  %2 = call %AstId* () @parse_id ()
  %3 = insertvalue %AstStmtGoto zeroinitializer, %AstId* %2, 0
  %4 = insertvalue %AstStmtGoto %3, %TokenInfo* %0, 1
  %5 = alloca %union.7
; write variant 3
  %6 = getelementptr inbounds %union.7, %union.7* %5, i1 0, i32 0
  store %Int16 3, %Int16* %6, align 2
; write data
  %7 = getelementptr inbounds %union.7, %union.7* %5, i1 0, i32 1
  %8 = bitcast [48 x %Nat8]* %7 to %AstStmtGoto*
  store %AstStmtGoto %4, %AstStmtGoto* %8, align 8
  %9 = load %union.7, %union.7* %5
  %10 = call %union.7* (%union.7) @ast_stmt_boxing (%union.7 %9)
  %11 = bitcast %union.7* %10 to %union.17
  ret %union.17 %11
}

define %Token* @tn2tok (%Node*) {
  %2 = getelementptr inbounds %Node, %Node* %0, i1 0, i32 3
  %3 = load %Unit*, %Unit** %2
  %4 = bitcast %Unit* %3 to %Token*
  ret %Token* %4
}

define i1 @func248 () {
  %1 = call %Node* () @gett ()
  call void () @skip_nl ()
  %2 = call %Token* () @func183 ()
  %3 = getelementptr inbounds %Token, %Token* %2, i1 0, i32 0
  %4 = load %TokenKind, %TokenKind* %3
  %5 = icmp ne %TokenKind %4, 1
  br i1 %5, label %then_0, label %else_0
then_0:
  br label %no
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  call void () @skip ()
  %7 = bitcast [2 x %Nat8]* @func248_str1 to %Str
  %8 = call i1 (%Str) @func191 (%Str %7)
  br i1 %8, label %then_1, label %else_1
then_1:
  br label %yes
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  %10 = bitcast [2 x %Nat8]* @func248_str2 to %Str
  %11 = call i1 (%Str) @func191 (%Str %10)
  br i1 %11, label %then_2, label %else_2
then_2:
  br label %yes
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
  br label %no
no:
  call void (%Node*) @sett (%Node* %1)
  ret i1 0
  br label %yes
yes:
  call void (%Node*) @sett (%Node* %1)
  ret i1 1
}

define i1 @is_it_type_rec () {
  call void () @skip ()
  call void () @skip_nl ()
  %1 = bitcast [2 x %Nat8]* @func249_str1 to %Str
  %2 = call i1 (%Str) @func191 (%Str %1)
  br i1 %2, label %then_0, label %else_0
then_0:
  ret i1 1
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %4 = call i1 () @func248 ()
  ret i1 %4
}

define i1 @func251 () {
  call void () @skip ()
  %1 = call i1 () @func250 ()
  ret i1 %1
}

define i1 @func250 () {
  %1 = call %Node* () @gett ()
  %2 = getelementptr inbounds %Node, %Node* %1, i1 0, i32 3
  %3 = load %Unit*, %Unit** %2
  %4 = bitcast %Unit* %3 to %Token*
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
  ret i1 0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  call void () @skip_nl ()
  %19 = call %Token* () @func183 ()
  %20 = getelementptr inbounds %Token, %Token* %19, i1 0, i32 2
; index array
  %21 = getelementptr inbounds [0 x %Nat8], [0 x %Nat8]* %20, i1 0, %Int64 0
  %22 = load %Nat8, %Nat8* %21
  %23 = getelementptr inbounds %Token, %Token* %19, i1 0, i32 0
  %24 = load %TokenKind, %TokenKind* %23
  %25 = icmp eq %TokenKind %24, 1
  br i1 %25, label %then_1, label %else_1
then_1:
  call void (%Node*) @sett (%Node* %1)
  %26 = call i1 (%Nat8) @isUpperCase (%Nat8 %22)
  ret i1 %26
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  br label %select_2_0
select_2_0:
; index array
  %28 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func250_str1, i1 0, %Int64 0
  %29 = load %Nat8, %Nat8* %28
  %30 = icmp eq %Nat8 %22, %29
  br i1 %30, label %select_2_0_ok, label %select_2_1
select_2_0_ok:
  %31 = call i1 () @is_it_type_rec ()
  br label %select_2_end
select_2_1:
; index array
  %32 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func250_str2, i1 0, %Int64 0
  %33 = load %Nat8, %Nat8* %32
  %34 = icmp eq %Nat8 %22, %33
  br i1 %34, label %select_2_1_ok, label %select_2_2
select_2_1_ok:
  %35 = bitcast i1 1 to i1
  br label %select_2_end
select_2_2:
; index array
  %36 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func250_str3, i1 0, %Int64 0
  %37 = load %Nat8, %Nat8* %36
  %38 = icmp eq %Nat8 %22, %37
  br i1 %38, label %select_2_2_ok, label %select_2_3
select_2_2_ok:
  %39 = bitcast i1 1 to i1
  br label %select_2_end
select_2_3:
; index array
  %40 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func250_str4, i1 0, %Int64 0
  %41 = load %Nat8, %Nat8* %40
  %42 = icmp eq %Nat8 %22, %41
  br i1 %42, label %select_2_3_ok, label %select_2_4
select_2_3_ok:
  %43 = call i1 () @func251 ()
  br label %select_2_end
select_2_4:
  %44 = bitcast i1 0 to i1
  br label %select_2_end
select_2_end:
  %45 = phi i1 [ %31, %select_2_0_ok ], [ %35, %select_2_1_ok ], [ %39, %select_2_2_ok ], [ %43, %select_2_3_ok ], [ %44, %select_2_4 ]
  br i1 %45, label %then_2, label %else_2
then_2:
  br label %yes
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
  br label %no
no:
  call void (%Node*) @sett (%Node* %1)
  ret i1 0
  br label %yes
yes:
  call void (%Node*) @sett (%Node* %1)
  ret i1 1
}

define i1 @func252 () {
  %1 = call %Node* () @gett ()
  call void () @skip_nl ()
  %2 = bitcast [2 x %Nat8]* @func252_str1 to %Str
  %3 = call i1 (%Str) @func191 (%Str %2)
  br i1 %3, label %then_0, label %else_0
then_0:
  br label %yes
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %5 = call %Token* () @func183 ()
  %6 = getelementptr inbounds %Token, %Token* %5, i1 0, i32 0
  %7 = load %TokenKind, %TokenKind* %6
  %8 = icmp ne %TokenKind %7, 1
  br i1 %8, label %then_1, label %else_1
then_1:
  br label %no
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  call void () @skip ()
  %10 = bitcast [2 x %Nat8]* @func252_str2 to %Str
  %11 = call i1 (%Str) @func191 (%Str %10)
  br i1 %11, label %then_2, label %else_2
then_2:
  br label %yes
  br label %endif_2
else_2:
  br label %no
  br label %endif_2
endif_2:
  br label %no
no:
  call void (%Node*) @sett (%Node* %1)
  ret i1 0
  br label %yes
yes:
  call void (%Node*) @sett (%Node* %1)
  ret i1 1
}

define void @func254 (%Assembly*) {
  %2 = getelementptr inbounds %Assembly, %Assembly* %0, i1 0, i32 1
  %3 = bitcast [38 x %Nat8]* @func253_func254_str1 to %Str
  store %Str %3, %Str* %2, align 8
  %4 = getelementptr inbounds %Assembly, %Assembly* %0, i1 0, i32 2
  %5 = bitcast [27 x %Nat8]* @func253_func254_str2 to %Str
  store %Str %5, %Str* %4, align 8
  ret void
}

define void @func255 (%Assembly*) {
  %2 = getelementptr inbounds %Assembly, %Assembly* %0, i1 0, i32 1
  %3 = bitcast [48 x %Nat8]* @func253_func255_str1 to %Str
  store %Str %3, %Str* %2, align 8
  %4 = getelementptr inbounds %Assembly, %Assembly* %0, i1 0, i32 2
  %5 = bitcast [28 x %Nat8]* @func253_func255_str2 to %Str
  store %Str %5, %Str* %4, align 8
  ret void
}

define void @func256 (%Assembly*) {
  %2 = getelementptr inbounds %Assembly, %Assembly* %0, i1 0, i32 1
  %3 = bitcast [1 x %Nat8]* @func253_func256_str1 to %Str
  store %Str %3, %Str* %2, align 8
  %4 = getelementptr inbounds %Assembly, %Assembly* %0, i1 0, i32 2
  %5 = bitcast [1 x %Nat8]* @func253_func256_str2 to %Str
  store %Str %5, %Str* %4, align 8
  ret void
}

define void @func253 (%Assembly*, %Arch, %Str) {
  %4 = getelementptr inbounds %Assembly, %Assembly* %0, i1 0, i32 0
  store %Str %2, %Str* %4, align 8
  br label %select_1_0
select_1_0:
  %5 = icmp eq %Arch %1, 1
  br i1 %5, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  call void (%Assembly*) @func254 (%Assembly* %0)
  br label %select_1_end
select_1_1:
  %6 = icmp eq %Arch %1, 2
  br i1 %6, label %select_1_1_ok, label %select_1_2
select_1_1_ok:
  call void (%Assembly*) @func255 (%Assembly* %0)
  br label %select_1_end
select_1_2:
  call void (%Assembly*) @func256 (%Assembly* %0)
  br label %select_1_end
select_1_end:
  ret void
}

define %Definition* @func257 (%DefinitionKind, %Str) {
  %3 = call %Unit* (%Nat32) @malloc (%Nat32 640)
  %4 = bitcast %Unit* %3 to %Definition*; loadImmPtr
  %5 = inttoptr i64 0 to%Definition*
  %6 = icmp ne %Definition* %4, %5
  %7 = bitcast [36 x %Nat8]* @func257_str1 to %Str
  call void (i1, %Str) @assert (i1 %6, %Str %7)
  %8 = bitcast %Definition* %4 to %Unit*
  %9 = call %Unit* (%Unit*, %Nat8, %Nat32) @memset (%Unit* %8, %Nat8 0, %Nat32 640)
  %10 = getelementptr inbounds %Definition, %Definition* %4, i1 0, i32 0
  store %DefinitionKind %0, %DefinitionKind* %10, align 2
  ret %Definition* %4
}

define %Definition* @func258 (%Assembly*, %Str, %Type*) {
  %4 = call %Definition* (%DefinitionKind, %Str) @func257 (%DefinitionKind 0, %Str %1)
  %5 = getelementptr inbounds %Definition, %Definition* %4, i1 0, i32 2
  %6 = insertvalue %DefType zeroinitializer, %Str %1, 0
  %7 = insertvalue %DefType %6, %Type* %2, 1
  store %DefType %7, %DefType* %5, align 8
  %8 = getelementptr inbounds %Assembly, %Assembly* %0, i1 0, i32 3
  %9 = bitcast %Definition* %4 to %Unit*
  %10 = call i1 (%List*, %Unit*) @list_append (%List* %8, %Unit* %9)
  ret %Definition* %4
}

define %Definition* @func259 (%Assembly*, %Str, %Str, %Nat32) {
  %5 = call %Definition* (%DefinitionKind, %Str) @func257 (%DefinitionKind 2, %Str %1)
  %6 = getelementptr inbounds %Definition, %Definition* %5, i1 0, i32 1
  %7 = insertvalue %DefStr zeroinitializer, %Str %1, 0
  %8 = insertvalue %DefStr %7, %Str %2, 2
  %9 = insertvalue %DefStr %8, %Nat32 %3, 3
  store %DefStr %9, %DefStr* %6, align 8
  %10 = getelementptr inbounds %Assembly, %Assembly* %0, i1 0, i32 6
  %11 = bitcast %Definition* %5 to %Unit*
  %12 = call i1 (%List*, %Unit*) @list_append (%List* %10, %Unit* %11)
  ret %Definition* %5
}

define %Definition* @func260 (%Assembly*, %Str, %Type*, %List) {
  %5 = call %Definition* (%DefinitionKind, %Str) @func257 (%DefinitionKind 3, %Str %1)
  %6 = getelementptr inbounds %Definition, %Definition* %5, i1 0, i32 4
  %7 = insertvalue %DefArray zeroinitializer, %Str %1, 0
  %8 = insertvalue %DefArray %7, %Type* %2, 1
  %9 = insertvalue %DefArray %8, %List %3, 3
  store %DefArray %9, %DefArray* %6, align 8
  %10 = getelementptr inbounds %Assembly, %Assembly* %0, i1 0, i32 5
  %11 = bitcast %Definition* %5 to %Unit*
  %12 = call i1 (%List*, %Unit*) @list_append (%List* %10, %Unit* %11)
  ret %Definition* %5
}

define %Definition* @func261 (%Assembly*, %Str, %Type*, %union.10) {
  %5 = call %Definition* (%DefinitionKind, %Str) @func257 (%DefinitionKind 4, %Str %1)
  %6 = getelementptr inbounds %Definition, %Definition* %5, i1 0, i32 5
  %7 = insertvalue %DefFunc zeroinitializer, %Str %1, 0
  %8 = insertvalue %DefFunc %7, %Type* %2, 1
  %9 = insertvalue %DefFunc %8, %union.10 %3, 2
  store %DefFunc %9, %DefFunc* %6, align 128
  %10 = getelementptr inbounds %Assembly, %Assembly* %0, i1 0, i32 8
  %11 = bitcast %Definition* %5 to %Unit*
  %12 = call i1 (%List*, %Unit*) @list_append (%List* %10, %Unit* %11)
  ret %Definition* %5
}

define %Definition* @func262 (%Assembly*, %Str, %Type*, %Value*) {
  %5 = call %Definition* (%DefinitionKind, %Str) @func257 (%DefinitionKind 5, %Str %1)
  %6 = getelementptr inbounds %Definition, %Definition* %5, i1 0, i32 6
  %7 = insertvalue %DefVar zeroinitializer, %Str %1, 0
  %8 = insertvalue %DefVar %7, %Type* %2, 1
  %9 = insertvalue %DefVar %8, %Value* %3, 2
  store %DefVar %9, %DefVar* %6, align 8
  %10 = getelementptr inbounds %Assembly, %Assembly* %0, i1 0, i32 7
  %11 = bitcast %Definition* %5 to %Unit*
  %12 = call i1 (%List*, %Unit*) @list_append (%List* %10, %Unit* %11)
  ret %Definition* %5
}

define %Definition* @func263 (%Assembly*, %Str, %Type*, %Str) {
  %5 = call %Definition* (%DefinitionKind, %Str) @func257 (%DefinitionKind 6, %Str %1)
  %6 = getelementptr inbounds %Definition, %Definition* %5, i1 0, i32 7
  %7 = insertvalue %DefAlias zeroinitializer, %Str %1, 0
  %8 = insertvalue %DefAlias %7, %Type* %2, 1
  %9 = insertvalue %DefAlias %8, %Str %3, 2
  store %DefAlias %9, %DefAlias* %6, align 8
  %10 = getelementptr inbounds %Assembly, %Assembly* %0, i1 0, i32 4
  %11 = bitcast %Definition* %5 to %Unit*
  %12 = call i1 (%List*, %Unit*) @list_append (%List* %10, %Unit* %11)
  ret %Definition* %5
}

define void @o (%Str) {
  %2 = load %FILE*, %FILE** @fout
  %3 = bitcast [3 x %Nat8]* @func264_str1 to %Str
  %4 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %2, %Str %3, %Str %0)
  ret void
}

define void @ol (%Str) {
  %2 = load %FILE*, %FILE** @fout
  %3 = bitcast [4 x %Nat8]* @func265_str1 to %Str
  %4 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %2, %Str %3, %Str %0)
  ret void
}

define void @nl () {
  %1 = bitcast [2 x %Nat8]* @func266_str1 to %Str
  call void (%Str) @o (%Str %1)
  ret void
}

define void @space () {
  %1 = bitcast [2 x %Nat8]* @func267_str1 to %Str
  call void (%Str) @o (%Str %1)
  ret void
}

define void @comma () {
  %1 = bitcast [3 x %Nat8]* @func268_str1 to %Str
  call void (%Str) @o (%Str %1)
  ret void
}

define void @lab_reset (%Nat32) {
  store %Nat32 %0, %Nat32* @clab, align 4
  ret void
}

define %Nat32 @lab_get () {
  %1 = load %Nat32, %Nat32* @clab
  %2 = load %Nat32, %Nat32* @clab
  %3 = add %Nat32 %2, 1
  store %Nat32 %3, %Nat32* @clab, align 4
  ret %Nat32 %1
}

define void @func272 (%Unit*, %Unit*, %Unit*) {
  %4 = bitcast %Unit* %0 to %Str
  %5 = bitcast %Unit* %1 to %Type*
  %6 = call i1 (%Type*) @func408 (%Type* %5)
  br i1 %6, label %then_0, label %else_0
then_0:
  %7 = load %FILE*, %FILE** @fout
  %8 = bitcast [17 x %Nat8]* @func271_func272_str1 to %Str
  %9 = getelementptr inbounds %Type, %Type* %5, i1 0, i32 6
  %10 = getelementptr inbounds %TypeNumeric, %TypeNumeric* %9, i1 0, i32 0
  %11 = load %Nat32, %Nat32* %10
  %12 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %7, %Str %8, %Str %4, %Nat32 %11)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  ret void
}

define void @func273 (%Unit*, %Unit*, %Nat32, %Node*) {
  %5 = bitcast %Unit* %0 to %Type*
  %6 = getelementptr inbounds %Type, %Type* %5, i1 0, i32 14
  %7 = getelementptr inbounds %TypeUnion, %TypeUnion* %6, i1 0, i32 1
  %8 = load %Type*, %Type** %7; loadImmPtr
  %9 = inttoptr i64 0 to%Type*
  %10 = icmp ne %Type* %8, %9
  br i1 %10, label %then_0, label %else_0
then_0:
  %11 = load %FILE*, %FILE** @fout
  %12 = bitcast [14 x %Nat8]* @func271_func273_str1 to %Str
  %13 = getelementptr inbounds %Type, %Type* %5, i1 0, i32 2
  %14 = load %Str, %Str* %13
  %15 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %11, %Str %12, %Str %14)
  %16 = getelementptr inbounds %Type, %Type* %5, i1 0, i32 14
  %17 = getelementptr inbounds %TypeUnion, %TypeUnion* %16, i1 0, i32 1
  %18 = load %Type*, %Type** %17
  call void (%Type*) @func381 (%Type* %18)
  %19 = bitcast [2 x %Nat8]* @func271_func273_str2 to %Str
  call void (%Str) @o (%Str %19)
  br label %endif_0
else_0:
  %20 = load %FILE*, %FILE** @fout
  %21 = bitcast [30 x %Nat8]* @func271_func273_str3 to %Str
  %22 = getelementptr inbounds %Type, %Type* %5, i1 0, i32 2
  %23 = load %Str, %Str* %22
  %24 = getelementptr inbounds %Type, %Type* %5, i1 0, i32 14
  %25 = getelementptr inbounds %TypeUnion, %TypeUnion* %24, i1 0, i32 2
  %26 = load %Nat32, %Nat32* %25
  %27 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %20, %Str %21, %Str %23, %Nat32 %26)
  %28 = bitcast [2 x %Nat8]* @func271_func273_str4 to %Str
  call void (%Str) @o (%Str %28)
  br label %endif_0
endif_0:
  ret void
}

define void @func274 (%Unit*, %Unit*, %Nat32, %Node*) {
  %5 = bitcast %Unit* %0 to %Definition*
  %6 = getelementptr inbounds %Definition, %Definition* %5, i1 0, i32 2
  %7 = getelementptr inbounds %DefType, %DefType* %6, i1 0, i32 0
  %8 = load %Str, %Str* %7
  %9 = getelementptr inbounds %DefType, %DefType* %6, i1 0, i32 1
  %10 = load %Type*, %Type** %9
  call void (%Str, %Type*) @func280 (%Str %8, %Type* %10)
  ret void
}

define void @func275 (%Unit*, %Unit*, %Nat32, %Node*) {
  %5 = bitcast %Unit* %0 to %Definition*
  %6 = getelementptr inbounds %Definition, %Definition* %5, i1 0, i32 1
  %7 = getelementptr inbounds %DefStr, %DefStr* %6, i1 0, i32 0
  %8 = load %Str, %Str* %7
  %9 = getelementptr inbounds %DefStr, %DefStr* %6, i1 0, i32 3
  %10 = load %Nat32, %Nat32* %9
  %11 = getelementptr inbounds %DefStr, %DefStr* %6, i1 0, i32 2
  %12 = load %Str, %Str* %11
  call void (%Str, %Nat32, %Str) @func283 (%Str %8, %Nat32 %10, %Str %12)
  ret void
}

define void @func276 (%Unit*, %Unit*, %Nat32, %Node*) {
  %5 = bitcast %Unit* %0 to %Definition*
  %6 = getelementptr inbounds %Definition, %Definition* %5, i1 0, i32 4
  %7 = getelementptr inbounds %DefArray, %DefArray* %6, i1 0, i32 0
  %8 = load %Str, %Str* %7
  %9 = getelementptr inbounds %DefArray, %DefArray* %6, i1 0, i32 1
  %10 = load %Type*, %Type** %9
  %11 = getelementptr inbounds %DefArray, %DefArray* %6, i1 0, i32 3
  call void (%Str, %Type*, %List*) @func281 (%Str %8, %Type* %10, %List* %11)
  ret void
}

define void @func277 (%Unit*, %Unit*, %Nat32, %Node*) {
  %5 = bitcast %Unit* %0 to %Definition*
  %6 = getelementptr inbounds %Definition, %Definition* %5, i1 0, i32 6
  %7 = getelementptr inbounds %DefVar, %DefVar* %6, i1 0, i32 0
  %8 = load %Str, %Str* %7
  %9 = getelementptr inbounds %DefVar, %DefVar* %6, i1 0, i32 1
  %10 = load %Type*, %Type** %9
  %11 = getelementptr inbounds %DefVar, %DefVar* %6, i1 0, i32 2
  %12 = load %Value*, %Value** %11
  call void (%Str, %Type*, %Value*) @func284 (%Str %8, %Type* %10, %Value* %12)
  ret void
}

define void @func278 (%Unit*, %Unit*, %Nat32, %Node*) {
  %5 = bitcast %Unit* %0 to %Definition*
  %6 = getelementptr inbounds %Definition, %Definition* %5, i1 0, i32 5
  %7 = getelementptr inbounds %DefFunc, %DefFunc* %6, i1 0, i32 0
  %8 = load %Str, %Str* %7
  %9 = getelementptr inbounds %DefFunc, %DefFunc* %6, i1 0, i32 1
  %10 = load %Type*, %Type** %9
  %11 = getelementptr inbounds %DefFunc, %DefFunc* %6, i1 0, i32 2
  %12 = load %union.10, %union.10* %11
  call void (%Str, %Type*, %union.10) @func286 (%Str %8, %Type* %10, %union.10 %12)
  ret void
}

define void @func279 (%Unit*, %Unit*, %Nat32, %Node*) {
  %5 = bitcast %Unit* %0 to %Definition*
  %6 = getelementptr inbounds %Definition, %Definition* %5, i1 0, i32 7
  %7 = getelementptr inbounds %DefAlias, %DefAlias* %6, i1 0, i32 0
  %8 = load %Str, %Str* %7
  %9 = getelementptr inbounds %DefAlias, %DefAlias* %6, i1 0, i32 1
  %10 = load %Type*, %Type** %9
  %11 = getelementptr inbounds %DefAlias, %DefAlias* %6, i1 0, i32 2
  %12 = load %Str, %Str* %11
  call void (%Str, %Type*, %Str) @func288 (%Str %8, %Type* %10, %Str %12)
  ret void
}

define void @func271 (%Assembly*, %Str) {
  %3 = bitcast [20 x %Nat8]* @func271_str1 to %Str
  %4 = getelementptr inbounds %Assembly, %Assembly* %0, i1 0, i32 0
  %5 = load %Str, %Str* %4
  %6 = call %Int32 (%Str, ...) @printf (%Str %3, %Str %5)
  %7 = bitcast [2 x %Nat8]* @func271_str2 to %Str
  %8 = call %FILE* (%Str, %Str) @fopen (%Str %1, %Str %7)
  store %FILE* %8, %FILE** @fout, align 8
  %9 = load %FILE*, %FILE** @fout; loadImmPtr
  %10 = inttoptr i64 0 to%FILE*
  %11 = icmp eq %FILE* %9, %10
  br i1 %11, label %then_0, label %else_0
then_0:
  %12 = bitcast [26 x %Nat8]* @func271_str3 to %Str
  call void (%Str) @fatal (%Str %12)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %13 = load %FILE*, %FILE** @fout
  %14 = bitcast [16 x %Nat8]* @func271_str4 to %Str
  %15 = getelementptr inbounds %Assembly, %Assembly* %0, i1 0, i32 0
  %16 = load %Str, %Str* %15
  %17 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %13, %Str %14, %Str %16)
  %18 = bitcast [27 x %Nat8]* @func271_str5 to %Str
  call void (%Str) @ol (%Str %18)
  %19 = bitcast [44 x %Nat8]* @func271_str6 to %Str
  call void (%Str) @ol (%Str %19)
  call void () @nl ()
  %20 = load %FILE*, %FILE** @fout
  %21 = bitcast [26 x %Nat8]* @func271_str7 to %Str
  %22 = getelementptr inbounds %Assembly, %Assembly* %0, i1 0, i32 1
  %23 = load %Str, %Str* %22
  %24 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %20, %Str %21, %Str %23)
  %25 = load %FILE*, %FILE** @fout
  %26 = bitcast [22 x %Nat8]* @func271_str8 to %Str
  %27 = getelementptr inbounds %Assembly, %Assembly* %0, i1 0, i32 2
  %28 = load %Str, %Str* %27
  %29 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %25, %Str %26, %Str %28)
  call void () @nl ()
  %30 = bitcast [16 x %Nat8]* @func271_str9 to %Str
  call void (%Str) @ol (%Str %30)
  %31 = bitcast [16 x %Nat8]* @func271_str10 to %Str
  call void (%Str) @ol (%Str %31)
  %32 = bitcast [16 x %Nat8]* @func271_str11 to %Str
  call void (%Str) @ol (%Str %32)
  %33 = bitcast [20 x %Nat8]* @func271_str12 to %Str
  call void (%Str) @ol (%Str %33)
  %34 = getelementptr inbounds %Context, %Context* @builtinContext, i1 0, i32 1
  %35 = getelementptr inbounds %Index, %Index* %34, i1 0, i32 0; loadImmPtr
  %36 = inttoptr i64 0 to%Unit*
  call void (%List*, %MapForeachHandler, %Unit*) @map_foreach (%List* %35, %MapForeachHandler @func272, %Unit* %36)
  %37 = bitcast [12 x %Nat8]* @func271_str13 to %Str
  call void (%Str) @ol (%Str %37); loadImmPtr
  %38 = inttoptr i64 0 to%Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @func64 (%List* @unions, %ListForeachHandler @func273, %Unit* %38)
  call void () @nl ()
  %39 = bitcast [11 x %Nat8]* @func271_str14 to %Str
  call void (%Str) @o (%Str %39)
  %40 = getelementptr inbounds %Assembly, %Assembly* %0, i1 0, i32 3; loadImmPtr
  %41 = inttoptr i64 0 to%Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @func64 (%List* %40, %ListForeachHandler @func274, %Unit* %41)
  %42 = bitcast [13 x %Nat8]* @func271_str15 to %Str
  call void (%Str) @o (%Str %42)
  %43 = getelementptr inbounds %Assembly, %Assembly* %0, i1 0, i32 6; loadImmPtr
  %44 = inttoptr i64 0 to%Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @func64 (%List* %43, %ListForeachHandler @func275, %Unit* %44)
  %45 = bitcast [12 x %Nat8]* @func271_str16 to %Str
  call void (%Str) @o (%Str %45)
  %46 = getelementptr inbounds %Assembly, %Assembly* %0, i1 0, i32 5; loadImmPtr
  %47 = inttoptr i64 0 to%Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @func64 (%List* %46, %ListForeachHandler @func276, %Unit* %47)
  %48 = bitcast [10 x %Nat8]* @func271_str17 to %Str
  call void (%Str) @o (%Str %48)
  %49 = getelementptr inbounds %Assembly, %Assembly* %0, i1 0, i32 7; loadImmPtr
  %50 = inttoptr i64 0 to%Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @func64 (%List* %49, %ListForeachHandler @func277, %Unit* %50)
  %51 = bitcast [11 x %Nat8]* @func271_str18 to %Str
  call void (%Str) @o (%Str %51)
  %52 = getelementptr inbounds %Assembly, %Assembly* %0, i1 0, i32 8; loadImmPtr
  %53 = inttoptr i64 0 to%Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @func64 (%List* %52, %ListForeachHandler @func278, %Unit* %53)
  %54 = bitcast [13 x %Nat8]* @func271_str19 to %Str
  call void (%Str) @o (%Str %54)
  %55 = getelementptr inbounds %Assembly, %Assembly* %0, i1 0, i32 4; loadImmPtr
  %56 = inttoptr i64 0 to%Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @func64 (%List* %55, %ListForeachHandler @func279, %Unit* %56)
  %57 = bitcast [14 x %Nat8]* @func271_str20 to %Str
  call void (%Str) @o (%Str %57)
  ret void
}

define void @func280 (%Str, %Type*) {
  %3 = load %FILE*, %FILE** @fout
  %4 = bitcast [14 x %Nat8]* @func280_str1 to %Str
  %5 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %3, %Str %4, %Str %0)
  call void (%Type*, i1, i1) @func378 (%Type* %1, i1 0, i1 1)
  ret void
}

define void @func282 (%Unit*, %Unit*, %Nat32, %Node*) {
  %5 = icmp ugt %Nat32 %2, 0
  br i1 %5, label %then_0, label %else_0
then_0:
  call void () @comma ()
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %6 = bitcast %Unit* %0 to %Value*
  %7 = call %LLVM_Value (%Value*) @func298 (%Value* %6)
  call void (%LLVM_Value) @func362 (%LLVM_Value %7)
  ret void
}

define void @func281 (%Str, %Type*, %List*) {
  %4 = load %FILE*, %FILE** @fout
  %5 = bitcast [38 x %Nat8]* @func281_str1 to %Str
  %6 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %4, %Str %5, %Str %0)
  call void (%Type*) @func381 (%Type* %1)
  %7 = bitcast [3 x %Nat8]* @func281_str2 to %Str
  call void (%Str) @o (%Str %7); loadImmPtr
  %8 = inttoptr i64 0 to%Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @func64 (%List* %2, %ListForeachHandler @func282, %Unit* %8)
  %9 = bitcast [12 x %Nat8]* @func281_str3 to %Str
  call void (%Str) @o (%Str %9)
  ret void
}

define void @func283 (%Str, %Nat32, %Str) {
  %4 = load %FILE*, %FILE** @fout
  %5 = bitcast [50 x %Nat8]* @func283_str1 to %Str
  %6 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %4, %Str %5, %Str %0, %Nat32 %1)
  %7 = alloca %Nat32
  store %Nat32 0, %Nat32* %7, align 4
  br label %again_0
again_0:
  br i1 1, label %body_0, label %break_0
body_0:
  %8 = load %Nat32, %Nat32* %7
; eval index uarray
  %9 = getelementptr inbounds %Nat8, %Nat8* %2, %Nat32 %8
  %10 = load %Nat8, %Nat8* %9
  %11 = load %Nat32, %Nat32* %7
  %12 = add %Nat32 %11, 1
  store %Nat32 %12, %Nat32* %7, align 4
  %13 = icmp eq %Nat8 %10, 0
  br i1 %13, label %then_0, label %else_0
then_0:
  br label %break_0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
; index array
  %15 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func283_str2, i1 0, %Int64 0
  %16 = load %Nat8, %Nat8* %15
  %17 = icmp eq %Nat8 %10, %16
; index array
  %18 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func283_str3, i1 0, %Int64 0
  %19 = load %Nat8, %Nat8* %18
  %20 = icmp eq %Nat8 %10, %19
; index array
  %21 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func283_str4, i1 0, %Int64 0
  %22 = load %Nat8, %Nat8* %21
  %23 = icmp eq %Nat8 %10, %22
; index array
  %24 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func283_str5, i1 0, %Int64 0
  %25 = load %Nat8, %Nat8* %24
  %26 = icmp eq %Nat8 %10, %25
; index array
  %27 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func283_str6, i1 0, %Int64 0
  %28 = load %Nat8, %Nat8* %27
  %29 = icmp eq %Nat8 %10, %28
; index array
  %30 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func283_str7, i1 0, %Int64 0
  %31 = load %Nat8, %Nat8* %30
  %32 = icmp eq %Nat8 %10, %31
; index array
  %33 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func283_str8, i1 0, %Int64 0
  %34 = load %Nat8, %Nat8* %33
  %35 = icmp eq %Nat8 %10, %34
; index array
  %36 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func283_str9, i1 0, %Int64 0
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
  %46 = load %FILE*, %FILE** @fout
  %47 = bitcast [6 x %Nat8]* @func283_str10 to %Str
  %48 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %46, %Str %47, %Nat8 %10)
  br label %endif_1
else_1:
  %49 = load %FILE*, %FILE** @fout
  %50 = bitcast [3 x %Nat8]* @func283_str11 to %Str
  %51 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %49, %Str %50, %Nat8 %10)
  br label %endif_1
endif_1:
  br label %again_0
break_0:
  %52 = bitcast [14 x %Nat8]* @func283_str12 to %Str
  call void (%Str) @o (%Str %52)
  ret void
}

define void @func285 (%Unit*, %Unit*, %Nat32, %Node*) {
  %5 = icmp ugt %Nat32 %2, 0
  br i1 %5, label %then_0, label %else_0
then_0:
  %6 = bitcast [3 x %Nat8]* @func284_func285_str1 to %Str
  call void (%Str) @o (%Str %6)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %7 = bitcast %Unit* %0 to %Value*
  %8 = call %LLVM_Value (%Value*) @func296 (%Value* %7)
  call void (%LLVM_Value) @func362 (%LLVM_Value %8)
  ret void
}

define void @func284 (%Str, %Type*, %Value*) {
  %4 = load %FILE*, %FILE** @fout
  %5 = bitcast [15 x %Nat8]* @func284_str1 to %Str
  %6 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %4, %Str %5, %Str %0)
  call void (%Type*) @func381 (%Type* %1)
  call void () @space (); loadImmPtr
  %7 = inttoptr i64 0 to%Value*
  %8 = icmp eq %Value* %2, %7
  br i1 %8, label %then_0, label %else_0
then_0:
  %9 = bitcast [16 x %Nat8]* @func284_str2 to %Str
  call void (%Str) @o (%Str %9)
ret void
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %11 = getelementptr inbounds %Value, %Value* %2, i1 0, i32 1
  %12 = load %union.9, %union.9* %11
  %13 = extractvalue %union.9 %12, 0
  %14 = bitcast %Int16 37 to %Int16
  %15 = icmp eq %Int16 %13, %14
  br i1 %15, label %then_1, label %else_1
then_1:
  %16 = getelementptr inbounds %Value, %Value* %2, i1 0, i32 1
  %17 = load %union.9, %union.9* %16
  %18 = alloca %union.9
  store %union.9 %17, %union.9* %18, align 128
  %19 = getelementptr inbounds %union.9, %union.9* %18, i1 0, i32 1
  %20 = bitcast [72 x %Nat8]* %19 to %ValueRecord*
  %21 = load %ValueRecord, %ValueRecord* %20
  %22 = extractvalue %ValueRecord %21, 1
  %23 = extractvalue %List %22, 2
  %24 = icmp eq %Nat64 %23, 0
  br i1 %24, label %then_2, label %else_2
then_2:
  %25 = bitcast [6 x %Nat8]* @func284_str3 to %Str
  %26 = call %Int32 (%Str, ...) @printf (%Str %25)
  %27 = bitcast [16 x %Nat8]* @func284_str4 to %Str
  call void (%Str) @o (%Str %27)
ret void
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
  %29 = bitcast [2 x %Nat8]* @func284_str5 to %Str
  call void (%Str) @o (%Str %29)
  %30 = alloca %ValueRecord
  store %ValueRecord %21, %ValueRecord* %30, align 8
  %31 = getelementptr inbounds %ValueRecord, %ValueRecord* %30, i1 0, i32 1; loadImmPtr
  %32 = inttoptr i64 0 to%Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @func64 (%List* %31, %ListForeachHandler @func285, %Unit* %32)
  %33 = bitcast [2 x %Nat8]* @func284_str6 to %Str
  call void (%Str) @o (%Str %33)
ret void
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  %35 = call %LLVM_Value (%Value*) @func296 (%Value* %2)
  %36 = extractvalue %LLVM_Value %35, 0
  %37 = icmp ne %LLVM_ValueKind %36, 4
  br i1 %37, label %then_3, label %else_3
then_3:
  %38 = bitcast [29 x %Nat8]* @func284_str7 to %Str
  %39 = getelementptr inbounds %Value, %Value* %2, i1 0, i32 3
  %40 = load %TokenInfo*, %TokenInfo** %39
  call void (%Str, %TokenInfo*) @error (%Str %38, %TokenInfo* %40)
  %41 = bitcast [16 x %Nat8]* @func284_str8 to %Str
  call void (%Str) @o (%Str %41)
ret void
  br label %endif_3
else_3:
  br label %endif_3
endif_3:
  call void (%LLVM_Value) @func361 (%LLVM_Value %35)
  %43 = bitcast [4 x %Nat8]* @func284_str9 to %Str
  call void (%Str) @o (%Str %43)
  ret void
}

define void @func287 (%Unit*, %Unit*, %Nat32, %Node*) {
  %5 = bitcast %Unit* %0 to %Decl*
  %6 = icmp ugt %Nat32 %2, 0
  br i1 %6, label %then_0, label %else_0
then_0:
  call void () @comma ()
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %7 = getelementptr inbounds %Decl, %Decl* %5, i1 0, i32 1
  %8 = load %Type*, %Type** %7
  call void (%Type*) @func381 (%Type* %8)
  ret void
}

define void @func286 (%Str, %Type*, %union.10) {
  %4 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 7
  %5 = getelementptr inbounds %TypeFunc, %TypeFunc* %4, i1 0, i32 0
  %6 = load %Type*, %Type** %5
  %7 = getelementptr inbounds %Type, %Type* %6, i1 0, i32 11
  %8 = getelementptr inbounds %TypeRecord, %TypeRecord* %7, i1 0, i32 0
  %9 = load %List*, %List** %8
  %10 = getelementptr inbounds %List, %List* %9, i1 0, i32 2
  %11 = load %Nat64, %Nat64* %10
  %12 = add %Nat64 %11, 1
  store %Nat32 0, %Nat32* @select_no, align 4
  %13 = trunc %Nat64 %12 to %Nat32
  call void (%Nat32) @lab_reset (%Nat32 %13); loadImmPtr
  %14 = inttoptr i64 0 to%Type*
  %15 = icmp ne %Type* %1, %14
  %16 = bitcast [20 x %Nat8]* @func286_str1 to %Str
  call void (i1, %Str) @assert (i1 %15, %Str %16)
  %17 = extractvalue %union.10 %2, 0
  %18 = bitcast %Int16 1 to %Int16
  %19 = icmp eq %Int16 %17, %18
  br i1 %19, label %then_0, label %else_0
then_0:
  %20 = bitcast [9 x %Nat8]* @func286_str2 to %Str
  call void (%Str) @o (%Str %20)
  br label %endif_0
else_0:
  %21 = bitcast [9 x %Nat8]* @func286_str3 to %Str
  call void (%Str) @o (%Str %21)
  br label %endif_0
endif_0:
  call void () @space ()
  %22 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 7
  %23 = getelementptr inbounds %TypeFunc, %TypeFunc* %22, i1 0, i32 1
  %24 = load %Type*, %Type** %23
  %25 = load %Type*, %Type** @typeUnit
  %26 = call i1 (%Type*, %Type*) @func445 (%Type* %24, %Type* %25)
  br i1 %26, label %then_1, label %else_1
then_1:
  %27 = bitcast [5 x %Nat8]* @func286_str4 to %Str
  call void (%Str) @o (%Str %27)
  br label %endif_1
else_1:
  %28 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 7
  %29 = getelementptr inbounds %TypeFunc, %TypeFunc* %28, i1 0, i32 1
  %30 = load %Type*, %Type** %29
  call void (%Type*) @func381 (%Type* %30)
  br label %endif_1
endif_1:
  %31 = load %FILE*, %FILE** @fout
  %32 = bitcast [7 x %Nat8]* @func286_str5 to %Str
  %33 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %31, %Str %32, %Str %0); loadImmPtr
  %34 = inttoptr i64 0 to%Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @func64 (%List* %9, %ListForeachHandler @func287, %Unit* %34)
  %35 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 7
  %36 = getelementptr inbounds %TypeFunc, %TypeFunc* %35, i1 0, i32 2
  %37 = load i1, i1* %36
  br i1 %37, label %then_2, label %else_2
then_2:
  %38 = bitcast [6 x %Nat8]* @func286_str6 to %Str
  call void (%Str) @o (%Str %38)
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
  %39 = bitcast [2 x %Nat8]* @func286_str7 to %Str
  call void (%Str) @o (%Str %39)
  %40 = extractvalue %union.10 %2, 0
  %41 = bitcast %Int16 0 to %Int16
  %42 = icmp eq %Int16 %40, %41
  br i1 %42, label %then_3, label %else_3
then_3:
  %43 = bitcast [3 x %Nat8]* @func286_str8 to %Str
  call void (%Str) @o (%Str %43)
  store %Nat32 0, %Nat32* @global_if_id, align 4
  store %Nat32 0, %Nat32* @global_while_id, align 4
  store %Nat32 0, %Nat32* @while_id, align 4
  store %Nat32 0, %Nat32* @stmtno, align 4
  store %Nat32 0, %Nat32* @blockno, align 4
  %44 = alloca %union.10
  store %union.10 %2, %union.10* %44, align 128
  %45 = getelementptr inbounds %union.10, %union.10* %44, i1 0, i32 1
  %46 = bitcast [112 x %Nat8]* %45 to %StmtBlock*
  %47 = load %StmtBlock, %StmtBlock* %46
  call void (%StmtBlock) @func376 (%StmtBlock %47)
  br i1 %26, label %then_4, label %else_4
then_4:
  %48 = bitcast [12 x %Nat8]* @func286_str9 to %Str
  call void (%Str) @o (%Str %48)
  br label %endif_4
else_4:
  br label %endif_4
endif_4:
  %49 = bitcast [3 x %Nat8]* @func286_str10 to %Str
  call void (%Str) @o (%Str %49)
  br label %endif_3
else_3:
  br label %endif_3
endif_3:
  ret void
}

define void @func288 (%Str, %Type*, %Str) {
  %4 = load %FILE*, %FILE** @fout
  %5 = bitcast [14 x %Nat8]* @func288_str1 to %Str
  %6 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %4, %Str %5, %Str %0)
  call void (%Type*, i1, i1) @func378 (%Type* %1, i1 0, i1 0)
  call void () @comma ()
  call void (%Type*, i1, i1) @func378 (%Type* %1, i1 0, i1 0)
  %7 = load %FILE*, %FILE** @fout
  %8 = bitcast [6 x %Nat8]* @func288_str2 to %Str
  %9 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %7, %Str %8, %Str %2)
  ret void
}

define %Nat32 @func289 (%Str, %Type*) {
  %3 = call %Nat32 () @lab_get ()
  %4 = load %FILE*, %FILE** @fout
  %5 = bitcast [14 x %Nat8]* @func289_str1 to %Str
  %6 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %4, %Str %5, %Nat32 %3, %Str %0)
  call void (%Type*) @func381 (%Type* %1)
  ret %Nat32 %3
}

define %Nat32 @func290 (%Type*, %LLVM_Value) {
  %3 = bitcast [23 x %Nat8]* @func290_str1 to %Str
  %4 = call %Nat32 (%Str, %Type*) @func289 (%Str %3, %Type* %0)
  call void () @comma ()
  call void (%Type*) @func381 (%Type* %0)
  %5 = bitcast [3 x %Nat8]* @func290_str2 to %Str
  call void (%Str) @o (%Str %5)
  call void (%LLVM_Value) @func361 (%LLVM_Value %1)
  call void () @comma ()
  ret %Nat32 %4
}

define %Nat32 @func291 (%Type*, %LLVM_Value, %Nat32) {
  %4 = bitcast [13 x %Nat8]* @func291_str1 to %Str
  %5 = call %Nat32 (%Str, %Type*) @func289 (%Str %4, %Type* %0)
  call void () @space ()
  call void (%LLVM_Value) @func361 (%LLVM_Value %1)
  %6 = load %FILE*, %FILE** @fout
  %7 = bitcast [5 x %Nat8]* @func291_str2 to %Str
  %8 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %6, %Str %7, %Nat32 %2)
  ret %Nat32 %5
}

define %Nat32 @func292 (%Str, %LLVM_Value, %LLVM_Value) {
  %4 = extractvalue %LLVM_Value %1, 1
  %5 = call %Nat32 (%Str, %Type*) @func289 (%Str %0, %Type* %4)
  call void () @space ()
  call void (%LLVM_Value) @func361 (%LLVM_Value %1)
  call void () @comma ()
  call void (%LLVM_Value) @func361 (%LLVM_Value %2)
  ret %Nat32 %5
}

define %Nat32 @llvm_binary_su (%Str, %Str, %LLVM_Value, %LLVM_Value) {
  %5 = extractvalue %LLVM_Value %2, 1
  %6 = getelementptr inbounds %Type, %Type* %5, i1 0, i32 6
  %7 = getelementptr inbounds %TypeNumeric, %TypeNumeric* %6, i1 0, i32 1
  %8 = load i1, i1* %7
  br label %select_1_0
select_1_0:
  %9 = icmp eq i1 %8, 1
  br i1 %9, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  br label %select_1_end
select_1_1:
  br label %select_1_end
select_1_end:
  %10 = phi %Str [ %0, %select_1_0_ok ], [ %1, %select_1_1 ]
  %11 = call %Nat32 (%Str, %LLVM_Value, %LLVM_Value) @func292 (%Str %10, %LLVM_Value %2, %LLVM_Value %3)
  ret %Nat32 %11
}

define %Str @func295 () {
  %1 = bitcast [17 x %Nat8]* @func294_func295_str1 to %Str
  ret %Str %1
}

define %Str @def_getname (%Definition*) {
  %2 = getelementptr inbounds %Definition, %Definition* %0, i1 0, i32 0
  %3 = load %DefinitionKind, %DefinitionKind* %2
  br label %select_1_0
select_1_0:
  %4 = icmp eq %DefinitionKind %3, 0
  br i1 %4, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %5 = getelementptr inbounds %Definition, %Definition* %0, i1 0, i32 2
  %6 = getelementptr inbounds %DefType, %DefType* %5, i1 0, i32 0
  %7 = load %Str, %Str* %6
  br label %select_1_end
select_1_1:
  %8 = icmp eq %DefinitionKind %3, 1
  br i1 %8, label %select_1_1_ok, label %select_1_2
select_1_1_ok:
  %9 = getelementptr inbounds %Definition, %Definition* %0, i1 0, i32 3
  %10 = getelementptr inbounds %DefConst, %DefConst* %9, i1 0, i32 0
  %11 = load %Str, %Str* %10
  br label %select_1_end
select_1_2:
  %12 = icmp eq %DefinitionKind %3, 2
  br i1 %12, label %select_1_2_ok, label %select_1_3
select_1_2_ok:
  %13 = getelementptr inbounds %Definition, %Definition* %0, i1 0, i32 1
  %14 = getelementptr inbounds %DefStr, %DefStr* %13, i1 0, i32 0
  %15 = load %Str, %Str* %14
  br label %select_1_end
select_1_3:
  %16 = icmp eq %DefinitionKind %3, 3
  br i1 %16, label %select_1_3_ok, label %select_1_4
select_1_3_ok:
  %17 = getelementptr inbounds %Definition, %Definition* %0, i1 0, i32 4
  %18 = getelementptr inbounds %DefArray, %DefArray* %17, i1 0, i32 0
  %19 = load %Str, %Str* %18
  br label %select_1_end
select_1_4:
  %20 = icmp eq %DefinitionKind %3, 4
  br i1 %20, label %select_1_4_ok, label %select_1_5
select_1_4_ok:
  %21 = getelementptr inbounds %Definition, %Definition* %0, i1 0, i32 5
  %22 = getelementptr inbounds %DefFunc, %DefFunc* %21, i1 0, i32 0
  %23 = load %Str, %Str* %22
  br label %select_1_end
select_1_5:
  %24 = icmp eq %DefinitionKind %3, 5
  br i1 %24, label %select_1_5_ok, label %select_1_6
select_1_5_ok:
  %25 = getelementptr inbounds %Definition, %Definition* %0, i1 0, i32 6
  %26 = getelementptr inbounds %DefVar, %DefVar* %25, i1 0, i32 0
  %27 = load %Str, %Str* %26
  br label %select_1_end
select_1_6:
  %28 = icmp eq %DefinitionKind %3, 6
  br i1 %28, label %select_1_6_ok, label %select_1_7
select_1_6_ok:
  %29 = getelementptr inbounds %Definition, %Definition* %0, i1 0, i32 7
  %30 = getelementptr inbounds %DefAlias, %DefAlias* %29, i1 0, i32 0
  %31 = load %Str, %Str* %30
  br label %select_1_end
select_1_7:
  %32 = call %Str () @func295 ()
  br label %select_1_end
select_1_end:
  %33 = phi %Str [ %7, %select_1_0_ok ], [ %11, %select_1_1_ok ], [ %15, %select_1_2_ok ], [ %19, %select_1_3_ok ], [ %23, %select_1_4_ok ], [ %27, %select_1_5_ok ], [ %31, %select_1_6_ok ], [ %32, %select_1_7 ]
  ret %Str %33
}

define %LLVM_Value @func297 (%Value*) {
  %2 = bitcast [28 x %Nat8]* @func296_func297_str1 to %Str
  call void (%Str) @fatal (%Str %2)
  %3 = insertvalue %LLVM_Value zeroinitializer, %LLVM_ValueKind 0, 0
  ret %LLVM_Value %3
}

define %LLVM_Value @func296 (%Value*) {
  %2 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 1
  %3 = load %union.9, %union.9* %2
  %4 = extractvalue %union.9 %3, 0
  br label %select_1_0
select_1_0:
  %5 = bitcast %Int16 38 to %Int16
  %6 = icmp eq %Int16 %4, %5
  br i1 %6, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %7 = alloca %union.9
  store %union.9 %3, %union.9* %7, align 128
  %8 = getelementptr inbounds %union.9, %union.9* %7, i1 0, i32 1
  %9 = bitcast [72 x %Nat8]* %8 to %ValueImm*
  %10 = load %ValueImm, %ValueImm* %9
  %11 = call %LLVM_Value (%ValueImm) @func299 (%ValueImm %10)
  br label %select_1_end
select_1_1:
  %12 = bitcast %Int16 33 to %Int16
  %13 = icmp eq %Int16 %4, %12
  br i1 %13, label %select_1_1_ok, label %select_1_2
select_1_1_ok:
  %14 = alloca %union.9
  store %union.9 %3, %union.9* %14, align 128
  %15 = getelementptr inbounds %union.9, %union.9* %14, i1 0, i32 1
  %16 = bitcast [72 x %Nat8]* %15 to %ValueGlobalConst*
  %17 = load %ValueGlobalConst, %ValueGlobalConst* %16
  %18 = call %LLVM_Value (%ValueGlobalConst) @func302 (%ValueGlobalConst %17)
  br label %select_1_end
select_1_2:
  %19 = bitcast %Int16 34 to %Int16
  %20 = icmp eq %Int16 %4, %19
  br i1 %20, label %select_1_2_ok, label %select_1_3
select_1_2_ok:
  %21 = alloca %union.9
  store %union.9 %3, %union.9* %21, align 128
  %22 = getelementptr inbounds %union.9, %union.9* %21, i1 0, i32 1
  %23 = bitcast [72 x %Nat8]* %22 to %ValueGlobalVar*
  %24 = load %ValueGlobalVar, %ValueGlobalVar* %23
  %25 = call %LLVM_Value (%ValueGlobalVar) @func303 (%ValueGlobalVar %24)
  br label %select_1_end
select_1_3:
  %26 = bitcast %Int16 30 to %Int16
  %27 = icmp eq %Int16 %4, %26
  br i1 %27, label %select_1_3_ok, label %select_1_4
select_1_3_ok:
  %28 = alloca %union.9
  store %union.9 %3, %union.9* %28, align 128
  %29 = getelementptr inbounds %union.9, %union.9* %28, i1 0, i32 1
  %30 = bitcast [72 x %Nat8]* %29 to %ValueLocalVal*
  %31 = load %ValueLocalVal, %ValueLocalVal* %30
  %32 = call %LLVM_Value (%ValueLocalVal) @func304 (%ValueLocalVal %31)
  br label %select_1_end
select_1_4:
  %33 = bitcast %Int16 31 to %Int16
  %34 = icmp eq %Int16 %4, %33
  br i1 %34, label %select_1_4_ok, label %select_1_5
select_1_4_ok:
  %35 = alloca %union.9
  store %union.9 %3, %union.9* %35, align 128
  %36 = getelementptr inbounds %union.9, %union.9* %35, i1 0, i32 1
  %37 = bitcast [72 x %Nat8]* %36 to %ValueLocalVar*
  %38 = load %ValueLocalVar, %ValueLocalVar* %37
  %39 = call %LLVM_Value (%ValueLocalVar) @func301 (%ValueLocalVar %38)
  br label %select_1_end
select_1_5:
  %40 = bitcast %Int16 32 to %Int16
  %41 = icmp eq %Int16 %4, %40
  br i1 %41, label %select_1_5_ok, label %select_1_6
select_1_5_ok:
  %42 = alloca %union.9
  store %union.9 %3, %union.9* %42, align 128
  %43 = getelementptr inbounds %union.9, %union.9* %42, i1 0, i32 1
  %44 = bitcast [72 x %Nat8]* %43 to %ValueParam*
  %45 = load %ValueParam, %ValueParam* %44
  %46 = call %LLVM_Value (%ValueParam) @func300 (%ValueParam %45)
  br label %select_1_end
select_1_6:
  %47 = bitcast %Int16 24 to %Int16
  %48 = icmp eq %Int16 %4, %47
  br i1 %48, label %select_1_6_ok, label %select_1_7
select_1_6_ok:
  %49 = alloca %union.9
  store %union.9 %3, %union.9* %49, align 128
  %50 = getelementptr inbounds %union.9, %union.9* %49, i1 0, i32 1
  %51 = bitcast [72 x %Nat8]* %50 to %ValueBin*
  %52 = load %ValueBin, %ValueBin* %51
  %53 = call %LLVM_Value (%ValueBin) @func332 (%ValueBin %52)
  br label %select_1_end
select_1_7:
  %54 = bitcast %Int16 23 to %Int16
  %55 = icmp eq %Int16 %4, %54
  br i1 %55, label %select_1_7_ok, label %select_1_8
select_1_7_ok:
  %56 = alloca %union.9
  store %union.9 %3, %union.9* %56, align 128
  %57 = getelementptr inbounds %union.9, %union.9* %56, i1 0, i32 1
  %58 = bitcast [72 x %Nat8]* %57 to %ValueBin*
  %59 = load %ValueBin, %ValueBin* %58
  %60 = call %LLVM_Value (%ValueBin) @func333 (%ValueBin %59)
  br label %select_1_end
select_1_8:
  %61 = bitcast %Int16 22 to %Int16
  %62 = icmp eq %Int16 %4, %61
  br i1 %62, label %select_1_8_ok, label %select_1_9
select_1_8_ok:
  %63 = alloca %union.9
  store %union.9 %3, %union.9* %63, align 128
  %64 = getelementptr inbounds %union.9, %union.9* %63, i1 0, i32 1
  %65 = bitcast [72 x %Nat8]* %64 to %ValueBin*
  %66 = load %ValueBin, %ValueBin* %65
  %67 = call %LLVM_Value (%ValueBin) @func334 (%ValueBin %66)
  br label %select_1_end
select_1_9:
  %68 = bitcast %Int16 21 to %Int16
  %69 = icmp eq %Int16 %4, %68
  br i1 %69, label %select_1_9_ok, label %select_1_10
select_1_9_ok:
  %70 = alloca %union.9
  store %union.9 %3, %union.9* %70, align 128
  %71 = getelementptr inbounds %union.9, %union.9* %70, i1 0, i32 1
  %72 = bitcast [72 x %Nat8]* %71 to %ValueBin*
  %73 = load %ValueBin, %ValueBin* %72
  %74 = call %LLVM_Value (%ValueBin) @func335 (%ValueBin %73)
  br label %select_1_end
select_1_10:
  %75 = bitcast %Int16 20 to %Int16
  %76 = icmp eq %Int16 %4, %75
  br i1 %76, label %select_1_10_ok, label %select_1_11
select_1_10_ok:
  %77 = alloca %union.9
  store %union.9 %3, %union.9* %77, align 128
  %78 = getelementptr inbounds %union.9, %union.9* %77, i1 0, i32 1
  %79 = bitcast [72 x %Nat8]* %78 to %ValueBin*
  %80 = load %ValueBin, %ValueBin* %79
  %81 = call %LLVM_Value (%ValueBin) @func336 (%ValueBin %80)
  br label %select_1_end
select_1_11:
  %82 = bitcast %Int16 17 to %Int16
  %83 = icmp eq %Int16 %4, %82
  br i1 %83, label %select_1_11_ok, label %select_1_12
select_1_11_ok:
  %84 = alloca %union.9
  store %union.9 %3, %union.9* %84, align 128
  %85 = getelementptr inbounds %union.9, %union.9* %84, i1 0, i32 1
  %86 = bitcast [72 x %Nat8]* %85 to %ValueBin*
  %87 = load %ValueBin, %ValueBin* %86
  %88 = call %LLVM_Value (%ValueBin) @func339 (%ValueBin %87)
  br label %select_1_end
select_1_12:
  %89 = bitcast %Int16 19 to %Int16
  %90 = icmp eq %Int16 %4, %89
  br i1 %90, label %select_1_12_ok, label %select_1_13
select_1_12_ok:
  %91 = alloca %union.9
  store %union.9 %3, %union.9* %91, align 128
  %92 = getelementptr inbounds %union.9, %union.9* %91, i1 0, i32 1
  %93 = bitcast [72 x %Nat8]* %92 to %ValueBin*
  %94 = load %ValueBin, %ValueBin* %93
  %95 = call %LLVM_Value (%ValueBin) @func337 (%ValueBin %94)
  br label %select_1_end
select_1_13:
  %96 = bitcast %Int16 18 to %Int16
  %97 = icmp eq %Int16 %4, %96
  br i1 %97, label %select_1_13_ok, label %select_1_14
select_1_13_ok:
  %98 = alloca %union.9
  store %union.9 %3, %union.9* %98, align 128
  %99 = getelementptr inbounds %union.9, %union.9* %98, i1 0, i32 1
  %100 = bitcast [72 x %Nat8]* %99 to %ValueBin*
  %101 = load %ValueBin, %ValueBin* %100
  %102 = call %LLVM_Value (%ValueBin) @func338 (%ValueBin %101)
  br label %select_1_end
select_1_14:
  %103 = bitcast %Int16 16 to %Int16
  %104 = icmp eq %Int16 %4, %103
  br i1 %104, label %select_1_14_ok, label %select_1_15
select_1_14_ok:
  %105 = alloca %union.9
  store %union.9 %3, %union.9* %105, align 128
  %106 = getelementptr inbounds %union.9, %union.9* %105, i1 0, i32 1
  %107 = bitcast [72 x %Nat8]* %106 to %ValueBin*
  %108 = load %ValueBin, %ValueBin* %107
  %109 = call %LLVM_Value (%ValueBin) @func340 (%ValueBin %108)
  br label %select_1_end
select_1_15:
  %110 = bitcast %Int16 15 to %Int16
  %111 = icmp eq %Int16 %4, %110
  br i1 %111, label %select_1_15_ok, label %select_1_16
select_1_15_ok:
  %112 = alloca %union.9
  store %union.9 %3, %union.9* %112, align 128
  %113 = getelementptr inbounds %union.9, %union.9* %112, i1 0, i32 1
  %114 = bitcast [72 x %Nat8]* %113 to %ValueBin*
  %115 = load %ValueBin, %ValueBin* %114
  %116 = call %LLVM_Value (%ValueBin) @func341 (%ValueBin %115)
  br label %select_1_end
select_1_16:
  %117 = bitcast %Int16 14 to %Int16
  %118 = icmp eq %Int16 %4, %117
  br i1 %118, label %select_1_16_ok, label %select_1_17
select_1_16_ok:
  %119 = alloca %union.9
  store %union.9 %3, %union.9* %119, align 128
  %120 = getelementptr inbounds %union.9, %union.9* %119, i1 0, i32 1
  %121 = bitcast [72 x %Nat8]* %120 to %ValueBin*
  %122 = load %ValueBin, %ValueBin* %121
  %123 = call %LLVM_Value (%ValueBin) @func342 (%ValueBin %122)
  br label %select_1_end
select_1_17:
  %124 = bitcast %Int16 13 to %Int16
  %125 = icmp eq %Int16 %4, %124
  br i1 %125, label %select_1_17_ok, label %select_1_18
select_1_17_ok:
  %126 = alloca %union.9
  store %union.9 %3, %union.9* %126, align 128
  %127 = getelementptr inbounds %union.9, %union.9* %126, i1 0, i32 1
  %128 = bitcast [72 x %Nat8]* %127 to %ValueBin*
  %129 = load %ValueBin, %ValueBin* %128
  %130 = call %LLVM_Value (%ValueBin) @func343 (%ValueBin %129)
  br label %select_1_end
select_1_18:
  %131 = bitcast %Int16 12 to %Int16
  %132 = icmp eq %Int16 %4, %131
  br i1 %132, label %select_1_18_ok, label %select_1_19
select_1_18_ok:
  %133 = alloca %union.9
  store %union.9 %3, %union.9* %133, align 128
  %134 = getelementptr inbounds %union.9, %union.9* %133, i1 0, i32 1
  %135 = bitcast [72 x %Nat8]* %134 to %ValueBin*
  %136 = load %ValueBin, %ValueBin* %135
  %137 = call %LLVM_Value (%ValueBin) @func344 (%ValueBin %136)
  br label %select_1_end
select_1_19:
  %138 = bitcast %Int16 11 to %Int16
  %139 = icmp eq %Int16 %4, %138
  br i1 %139, label %select_1_19_ok, label %select_1_20
select_1_19_ok:
  %140 = alloca %union.9
  store %union.9 %3, %union.9* %140, align 128
  %141 = getelementptr inbounds %union.9, %union.9* %140, i1 0, i32 1
  %142 = bitcast [72 x %Nat8]* %141 to %ValueBin*
  %143 = load %ValueBin, %ValueBin* %142
  %144 = call %LLVM_Value (%ValueBin) @func345 (%ValueBin %143)
  br label %select_1_end
select_1_20:
  %145 = bitcast %Int16 10 to %Int16
  %146 = icmp eq %Int16 %4, %145
  br i1 %146, label %select_1_20_ok, label %select_1_21
select_1_20_ok:
  %147 = alloca %union.9
  store %union.9 %3, %union.9* %147, align 128
  %148 = getelementptr inbounds %union.9, %union.9* %147, i1 0, i32 1
  %149 = bitcast [72 x %Nat8]* %148 to %ValueBin*
  %150 = load %ValueBin, %ValueBin* %149
  %151 = call %LLVM_Value (%ValueBin) @func346 (%ValueBin %150)
  br label %select_1_end
select_1_21:
  %152 = bitcast %Int16 9 to %Int16
  %153 = icmp eq %Int16 %4, %152
  br i1 %153, label %select_1_21_ok, label %select_1_22
select_1_21_ok:
  %154 = alloca %union.9
  store %union.9 %3, %union.9* %154, align 128
  %155 = getelementptr inbounds %union.9, %union.9* %154, i1 0, i32 1
  %156 = bitcast [72 x %Nat8]* %155 to %ValueBin*
  %157 = load %ValueBin, %ValueBin* %156
  %158 = call %LLVM_Value (%ValueBin) @func347 (%ValueBin %157)
  br label %select_1_end
select_1_22:
  %159 = bitcast %Int16 2 to %Int16
  %160 = icmp eq %Int16 %4, %159
  br i1 %160, label %select_1_22_ok, label %select_1_23
select_1_22_ok:
  %161 = alloca %union.9
  store %union.9 %3, %union.9* %161, align 128
  %162 = getelementptr inbounds %union.9, %union.9* %161, i1 0, i32 1
  %163 = bitcast [72 x %Nat8]* %162 to %ValueCall*
  %164 = load %ValueCall, %ValueCall* %163
  %165 = call %LLVM_Value (%ValueCall) @func305 (%ValueCall %164)
  br label %select_1_end
select_1_23:
  %166 = bitcast %Int16 8 to %Int16
  %167 = icmp eq %Int16 %4, %166
  br i1 %167, label %select_1_23_ok, label %select_1_24
select_1_23_ok:
  %168 = alloca %union.9
  store %union.9 %3, %union.9* %168, align 128
  %169 = getelementptr inbounds %union.9, %union.9* %168, i1 0, i32 1
  %170 = bitcast [72 x %Nat8]* %169 to %ValueIndex*
  %171 = load %ValueIndex, %ValueIndex* %170
  %172 = call %LLVM_Value (%ValueIndex) @func308 (%ValueIndex %171)
  br label %select_1_end
select_1_24:
  %173 = bitcast %Int16 7 to %Int16
  %174 = icmp eq %Int16 %4, %173
  br i1 %174, label %select_1_24_ok, label %select_1_25
select_1_24_ok:
  %175 = alloca %union.9
  store %union.9 %3, %union.9* %175, align 128
  %176 = getelementptr inbounds %union.9, %union.9* %175, i1 0, i32 1
  %177 = bitcast [72 x %Nat8]* %176 to %ValueAccess*
  %178 = load %ValueAccess, %ValueAccess* %177
  %179 = call %LLVM_Value (%ValueAccess) @func310 (%ValueAccess %178)
  br label %select_1_end
select_1_25:
  %180 = bitcast %Int16 29 to %Int16
  %181 = icmp eq %Int16 %4, %180
  br i1 %181, label %select_1_25_ok, label %select_1_26
select_1_25_ok:
  %182 = alloca %union.9
  store %union.9 %3, %union.9* %182, align 128
  %183 = getelementptr inbounds %union.9, %union.9* %182, i1 0, i32 1
  %184 = bitcast [72 x %Nat8]* %183 to %ValueUn*
  %185 = load %ValueUn, %ValueUn* %184
  %186 = call %LLVM_Value (%ValueUn) @func311 (%ValueUn %185)
  br label %select_1_end
select_1_26:
  %187 = bitcast %Int16 28 to %Int16
  %188 = icmp eq %Int16 %4, %187
  br i1 %188, label %select_1_26_ok, label %select_1_27
select_1_26_ok:
  %189 = alloca %union.9
  store %union.9 %3, %union.9* %189, align 128
  %190 = getelementptr inbounds %union.9, %union.9* %189, i1 0, i32 1
  %191 = bitcast [72 x %Nat8]* %190 to %ValueUn*
  %192 = load %ValueUn, %ValueUn* %191
  %193 = call %LLVM_Value (%ValueUn) @func312 (%ValueUn %192)
  br label %select_1_end
select_1_27:
  %194 = bitcast %Int16 26 to %Int16
  %195 = icmp eq %Int16 %4, %194
  br i1 %195, label %select_1_27_ok, label %select_1_28
select_1_27_ok:
  %196 = alloca %union.9
  store %union.9 %3, %union.9* %196, align 128
  %197 = getelementptr inbounds %union.9, %union.9* %196, i1 0, i32 1
  %198 = bitcast [72 x %Nat8]* %197 to %ValueUn*
  %199 = load %ValueUn, %ValueUn* %198
  %200 = call %LLVM_Value (%ValueUn) @func314 (%ValueUn %199)
  br label %select_1_end
select_1_28:
  %201 = bitcast %Int16 25 to %Int16
  %202 = icmp eq %Int16 %4, %201
  br i1 %202, label %select_1_28_ok, label %select_1_29
select_1_28_ok:
  %203 = alloca %union.9
  store %union.9 %3, %union.9* %203, align 128
  %204 = getelementptr inbounds %union.9, %union.9* %203, i1 0, i32 1
  %205 = bitcast [72 x %Nat8]* %204 to %ValueUn*
  %206 = load %ValueUn, %ValueUn* %205
  %207 = call %LLVM_Value (%ValueUn) @func315 (%ValueUn %206)
  br label %select_1_end
select_1_29:
  %208 = bitcast %Int16 27 to %Int16
  %209 = icmp eq %Int16 %4, %208
  br i1 %209, label %select_1_29_ok, label %select_1_30
select_1_29_ok:
  %210 = alloca %union.9
  store %union.9 %3, %union.9* %210, align 128
  %211 = getelementptr inbounds %union.9, %union.9* %210, i1 0, i32 1
  %212 = bitcast [72 x %Nat8]* %211 to %ValueUn*
  %213 = load %ValueUn, %ValueUn* %212
  %214 = call %LLVM_Value (%ValueUn) @func313 (%ValueUn %213)
  br label %select_1_end
select_1_30:
  %215 = bitcast %Int16 6 to %Int16
  %216 = icmp eq %Int16 %4, %215
  br i1 %216, label %select_1_30_ok, label %select_1_31
select_1_30_ok:
  %217 = alloca %union.9
  store %union.9 %3, %union.9* %217, align 128
  %218 = getelementptr inbounds %union.9, %union.9* %217, i1 0, i32 1
  %219 = bitcast [72 x %Nat8]* %218 to %ValueCast*
  %220 = load %ValueCast, %ValueCast* %219
  %221 = call %LLVM_Value (%ValueCast) @func328 (%ValueCast %220)
  br label %select_1_end
select_1_31:
  %222 = bitcast %Int16 5 to %Int16
  %223 = icmp eq %Int16 %4, %222
  br i1 %223, label %select_1_31_ok, label %select_1_32
select_1_31_ok:
  %224 = alloca %union.9
  store %union.9 %3, %union.9* %224, align 128
  %225 = getelementptr inbounds %union.9, %union.9* %224, i1 0, i32 1
  %226 = bitcast [72 x %Nat8]* %225 to %ValueAs*
  %227 = load %ValueAs, %ValueAs* %226
  %228 = call %LLVM_Value (%ValueAs) @func324 (%ValueAs %227)
  br label %select_1_end
select_1_32:
  %229 = bitcast %Int16 4 to %Int16
  %230 = icmp eq %Int16 %4, %229
  br i1 %230, label %select_1_32_ok, label %select_1_33
select_1_32_ok:
  %231 = alloca %union.9
  store %union.9 %3, %union.9* %231, align 128
  %232 = getelementptr inbounds %union.9, %union.9* %231, i1 0, i32 1
  %233 = bitcast [72 x %Nat8]* %232 to %ValueIs*
  %234 = load %ValueIs, %ValueIs* %233
  %235 = call %LLVM_Value (%ValueIs) @func325 (%ValueIs %234)
  br label %select_1_end
select_1_33:
  %236 = bitcast %Int16 0 to %Int16
  %237 = icmp eq %Int16 %4, %236
  br i1 %237, label %select_1_33_ok, label %select_1_34
select_1_33_ok:
  %238 = alloca %union.9
  store %union.9 %3, %union.9* %238, align 128
  %239 = getelementptr inbounds %union.9, %union.9* %238, i1 0, i32 1
  %240 = bitcast [72 x %Nat8]* %239 to %ValueWhen*
  %241 = load %ValueWhen, %ValueWhen* %240
  %242 = call %LLVM_Value (%ValueWhen) @func351 (%ValueWhen %241)
  br label %select_1_end
select_1_34:
  %243 = bitcast %Int16 37 to %Int16
  %244 = icmp eq %Int16 %4, %243
  br i1 %244, label %select_1_34_ok, label %select_1_35
select_1_34_ok:
  %245 = alloca %union.9
  store %union.9 %3, %union.9* %245, align 128
  %246 = getelementptr inbounds %union.9, %union.9* %245, i1 0, i32 1
  %247 = bitcast [72 x %Nat8]* %246 to %ValueRecord*
  %248 = load %ValueRecord, %ValueRecord* %247
  %249 = call %LLVM_Value (%ValueRecord) @func353 (%ValueRecord %248)
  br label %select_1_end
select_1_35:
  %250 = bitcast %Int16 35 to %Int16
  %251 = icmp eq %Int16 %4, %250
  br i1 %251, label %select_1_35_ok, label %select_1_36
select_1_35_ok:
  %252 = alloca %union.9
  store %union.9 %3, %union.9* %252, align 128
  %253 = getelementptr inbounds %union.9, %union.9* %252, i1 0, i32 1
  %254 = bitcast [72 x %Nat8]* %253 to %ValueArray*
  %255 = load %ValueArray, %ValueArray* %254
  %256 = call %LLVM_Value (%ValueArray) @func355 (%ValueArray %255)
  br label %select_1_end
select_1_36:
  %257 = call %LLVM_Value (%Value*) @func297 (%Value* %0)
  br label %select_1_end
select_1_end:
  %258 = phi %LLVM_Value [ %11, %select_1_0_ok ], [ %18, %select_1_1_ok ], [ %25, %select_1_2_ok ], [ %32, %select_1_3_ok ], [ %39, %select_1_4_ok ], [ %46, %select_1_5_ok ], [ %53, %select_1_6_ok ], [ %60, %select_1_7_ok ], [ %67, %select_1_8_ok ], [ %74, %select_1_9_ok ], [ %81, %select_1_10_ok ], [ %88, %select_1_11_ok ], [ %95, %select_1_12_ok ], [ %102, %select_1_13_ok ], [ %109, %select_1_14_ok ], [ %116, %select_1_15_ok ], [ %123, %select_1_16_ok ], [ %130, %select_1_17_ok ], [ %137, %select_1_18_ok ], [ %144, %select_1_19_ok ], [ %151, %select_1_20_ok ], [ %158, %select_1_21_ok ], [ %165, %select_1_22_ok ], [ %172, %select_1_23_ok ], [ %179, %select_1_24_ok ], [ %186, %select_1_25_ok ], [ %193, %select_1_26_ok ], [ %200, %select_1_27_ok ], [ %207, %select_1_28_ok ], [ %214, %select_1_29_ok ], [ %221, %select_1_30_ok ], [ %228, %select_1_31_ok ], [ %235, %select_1_32_ok ], [ %242, %select_1_33_ok ], [ %249, %select_1_34_ok ], [ %256, %select_1_35_ok ], [ %257, %select_1_36 ]
  ret %LLVM_Value %258
}

define %LLVM_Value @func298 (%Value*) {
  %2 = call %LLVM_Value (%Value*) @func296 (%Value* %0)
  %3 = call %LLVM_Value (%LLVM_Value) @func359 (%LLVM_Value %2)
  ret %LLVM_Value %3
}

define %LLVM_Value @func299 (%ValueImm) {
  %2 = insertvalue %LLVM_Value zeroinitializer, %LLVM_ValueKind 4, 0
  %3 = extractvalue %ValueImm %0, 0
  %4 = insertvalue %LLVM_Value %2, %Type* %3, 1
  %5 = extractvalue %ValueImm %0, 1
  %6 = insertvalue %LLVM_Value %4, %Int64 %5, 2
  ret %LLVM_Value %6
}

define %LLVM_Value @func300 (%ValueParam) {
  %2 = insertvalue %LLVM_Value zeroinitializer, %LLVM_ValueKind 9, 0
  %3 = extractvalue %ValueParam %0, 0
  %4 = insertvalue %LLVM_Value %2, %Type* %3, 1
  %5 = extractvalue %ValueParam %0, 1
  %6 = insertvalue %LLVM_Value %4, %Nat32 %5, 4
  ret %LLVM_Value %6
}

define %LLVM_Value @func301 (%ValueLocalVar) {
  %2 = extractvalue %ValueLocalVar %0, 0
  %3 = getelementptr inbounds %Type, %Type* %2, i1 0, i32 13
  %4 = getelementptr inbounds %TypeVar, %TypeVar* %3, i1 0, i32 0
  %5 = load %Type*, %Type** %4
  %6 = insertvalue %LLVM_Value zeroinitializer, %LLVM_ValueKind 6, 0
  %7 = insertvalue %LLVM_Value %6, %Type* %5, 1
  %8 = extractvalue %ValueLocalVar %0, 1
; index array
  %9 = getelementptr inbounds [1024 x %Nat32], [1024 x %Nat32]* @local_vars_map, i1 0, %Nat32 %8
  %10 = load %Nat32, %Nat32* %9
  %11 = insertvalue %LLVM_Value %7, %Nat32 %10, 4
  ret %LLVM_Value %11
}

define %LLVM_Value @func302 (%ValueGlobalConst) {
  %2 = insertvalue %LLVM_Value zeroinitializer, %LLVM_ValueKind 5, 0
  %3 = extractvalue %ValueGlobalConst %0, 0
  %4 = insertvalue %LLVM_Value %2, %Type* %3, 1
  %5 = extractvalue %ValueGlobalConst %0, 1
  %6 = call %Str (%Definition*) @def_getname (%Definition* %5)
  %7 = insertvalue %LLVM_Value %4, %Str %6, 3
  ret %LLVM_Value %7
}

define %LLVM_Value @func303 (%ValueGlobalVar) {
  %2 = extractvalue %ValueGlobalVar %0, 0
  %3 = getelementptr inbounds %Type, %Type* %2, i1 0, i32 13
  %4 = getelementptr inbounds %TypeVar, %TypeVar* %3, i1 0, i32 0
  %5 = load %Type*, %Type** %4
  %6 = insertvalue %LLVM_Value zeroinitializer, %LLVM_ValueKind 7, 0
  %7 = insertvalue %LLVM_Value %6, %Type* %5, 1
  %8 = extractvalue %ValueGlobalVar %0, 1
  %9 = call %Str (%Definition*) @def_getname (%Definition* %8)
  %10 = insertvalue %LLVM_Value %7, %Str %9, 3
  ret %LLVM_Value %10
}

define %LLVM_Value @func304 (%ValueLocalVal) {
  %2 = insertvalue %LLVM_Value zeroinitializer, %LLVM_ValueKind 9, 0
  %3 = extractvalue %ValueLocalVal %0, 0
  %4 = insertvalue %LLVM_Value %2, %Type* %3, 1
  %5 = extractvalue %ValueLocalVal %0, 1
; index array
  %6 = getelementptr inbounds [1024 x %Nat32], [1024 x %Nat32]* @local_x_map, i1 0, %Nat32 %5
  %7 = load %Nat32, %Nat32* %6
  %8 = insertvalue %LLVM_Value %4, %Nat32 %7, 4
  ret %LLVM_Value %8
}

define void @func306 (%Unit*, %Unit*, %Nat32, %Node*) {
  %5 = bitcast %Unit* %0 to %Value*
  %6 = bitcast %Unit* %1 to %func305.type1*
  %7 = getelementptr inbounds %func305.type1, %func305.type1* %6, i1 0, i32 0
  %8 = getelementptr inbounds %func305.type1, %func305.type1* %6, i1 0, i32 1
  %9 = load %Nat16, %Nat16* %8
; index array
  %10 = getelementptr inbounds [64 x %LLVM_Value], [64 x %LLVM_Value]* %7, i1 0, %Nat16 %9
  %11 = call %LLVM_Value (%Value*) @func298 (%Value* %5)
  store %LLVM_Value %11, %LLVM_Value* %10, align 8
  %12 = getelementptr inbounds %func305.type1, %func305.type1* %6, i1 0, i32 1
  %13 = getelementptr inbounds %func305.type1, %func305.type1* %6, i1 0, i32 1
  %14 = load %Nat16, %Nat16* %13
  %15 = add %Nat16 %14, 1
  store %Nat16 %15, %Nat16* %12, align 2
  ret void
}

define %LLVM_Value @func305 (%ValueCall) {
  %2 = alloca %func305.type1
  store %func305.type1 zeroinitializer, %func305.type1* %2, align 8
  %3 = getelementptr inbounds %func305.type1, %func305.type1* %2, i1 0, i32 1
  store %Nat16 0, %Nat16* %3, align 2
  %4 = extractvalue %ValueCall %0, 2
  %5 = getelementptr inbounds %func305.type1, %func305.type1* %2, i1 0
  %6 = bitcast %func305.type1* %5 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @func64 (%List* %4, %ListForeachHandler @func306, %Unit* %6)
  %7 = extractvalue %ValueCall %0, 1
  %8 = call %LLVM_Value (%Value*) @func298 (%Value* %7)
  %9 = bitcast [4 x %Nat8]* @func305_str1 to %Str
  call void (%Str) @o (%Str %9)
  %10 = alloca %Nat32
  store %Nat32 0, %Nat32* %10, align 4
  %11 = extractvalue %LLVM_Value %8, 1
  %12 = getelementptr inbounds %Type, %Type* %11, i1 0, i32 7
  %13 = getelementptr inbounds %TypeFunc, %TypeFunc* %12, i1 0, i32 1
  %14 = load %Type*, %Type** %13
  %15 = load %Type*, %Type** @typeUnit
  %16 = call i1 (%Type*, %Type*) @func445 (%Type* %14, %Type* %15)
  %17 = xor i1 %16, 1
  br i1 %17, label %then_0, label %else_0
then_0:
  %18 = call %Nat32 () @lab_get ()
  store %Nat32 %18, %Nat32* %10, align 4
  %19 = load %FILE*, %FILE** @fout
  %20 = bitcast [8 x %Nat8]* @func305_str2 to %Str
  %21 = load %Nat32, %Nat32* %10
  %22 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %19, %Str %20, %Nat32 %21)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %23 = bitcast [6 x %Nat8]* @func305_str3 to %Str
  call void (%Str) @o (%Str %23)
  %24 = extractvalue %LLVM_Value %8, 1
  call void (%Type*, i1, i1) @func378 (%Type* %24, i1 0, i1 0)
  call void () @space ()
  call void (%LLVM_Value) @func361 (%LLVM_Value %8)
  %25 = bitcast [3 x %Nat8]* @func305_str4 to %Str
  call void (%Str) @o (%Str %25)
  %26 = alloca %Nat16
  store %Nat16 0, %Nat16* %26, align 2
  br label %again_0
again_0:
  %27 = load %Nat16, %Nat16* %26
  %28 = getelementptr inbounds %func305.type1, %func305.type1* %2, i1 0, i32 1
  %29 = load %Nat16, %Nat16* %28
  %30 = icmp ult %Nat16 %27, %29
  br i1 %30, label %body_0, label %break_0
body_0:
  %31 = load %Nat16, %Nat16* %26
  %32 = icmp ugt %Nat16 %31, 0
  br i1 %32, label %then_1, label %else_1
then_1:
  call void () @comma ()
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  %33 = getelementptr inbounds %func305.type1, %func305.type1* %2, i1 0, i32 0
  %34 = load %Nat16, %Nat16* %26
; index array
  %35 = getelementptr inbounds [64 x %LLVM_Value], [64 x %LLVM_Value]* %33, i1 0, %Nat16 %34
  %36 = load %LLVM_Value, %LLVM_Value* %35
  call void (%LLVM_Value) @func362 (%LLVM_Value %36)
  %37 = load %Nat16, %Nat16* %26
  %38 = add %Nat16 %37, 1
  store %Nat16 %38, %Nat16* %26, align 2
  br label %again_0
break_0:
  %39 = bitcast [2 x %Nat8]* @func305_str5 to %Str
  call void (%Str) @o (%Str %39)
  %40 = insertvalue %LLVM_Value zeroinitializer, %LLVM_ValueKind 9, 0
  %41 = extractvalue %ValueCall %0, 0
  %42 = insertvalue %LLVM_Value %40, %Type* %41, 1
  %43 = load %Nat32, %Nat32* %10
  %44 = insertvalue %LLVM_Value %42, %Nat32 %43, 4
  ret %LLVM_Value %44
}

define %LLVM_Value @eval_index_uarray (%LLVM_Value, %LLVM_Value) {
  %3 = bitcast [21 x %Nat8]* @func307_str1 to %Str
  call void (%Str) @o (%Str %3)
  %4 = extractvalue %LLVM_Value %0, 1
  %5 = getelementptr inbounds %Type, %Type* %4, i1 0, i32 10
  %6 = getelementptr inbounds %TypeArrayU, %TypeArrayU* %5, i1 0, i32 0
  %7 = load %Type*, %Type** %6
  %8 = call %Nat32 (%Type*, %LLVM_Value) @func290 (%Type* %7, %LLVM_Value %0)
  call void (%LLVM_Value) @func362 (%LLVM_Value %1)
  %9 = insertvalue %LLVM_Value zeroinitializer, %LLVM_ValueKind 8, 0
  %10 = insertvalue %LLVM_Value %9, %Type* %7, 1
  %11 = insertvalue %LLVM_Value %10, %Nat32 %8, 4
  ret %LLVM_Value %11
}

define %LLVM_Value @func309 (%LLVM_Value, %LLVM_Value) {
  %3 = bitcast [15 x %Nat8]* @func308_func309_str1 to %Str
  call void (%Str) @o (%Str %3)
  %4 = extractvalue %LLVM_Value %0, 1
  %5 = getelementptr inbounds %Type, %Type* %4, i1 0, i32 0
  %6 = load %TypeKind, %TypeKind* %5
  br label %select_1_0
select_1_0:
  %7 = icmp eq %TypeKind %6, 14
  br i1 %7, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %8 = extractvalue %LLVM_Value %0, 1
  br label %select_1_end
select_1_1:
  %9 = extractvalue %LLVM_Value %0, 1
  %10 = getelementptr inbounds %Type, %Type* %9, i1 0, i32 8
  %11 = getelementptr inbounds %TypePointer, %TypePointer* %10, i1 0, i32 0
  %12 = load %Type*, %Type** %11
  br label %select_1_end
select_1_end:
  %13 = phi %Type* [ %8, %select_1_0_ok ], [ %12, %select_1_1 ]
  %14 = call %Nat32 (%Type*, %LLVM_Value) @func290 (%Type* %13, %LLVM_Value %0)
  %15 = bitcast [7 x %Nat8]* @func308_func309_str2 to %Str
  call void (%Str) @o (%Str %15)
  call void (%LLVM_Value) @func362 (%LLVM_Value %1)
  %16 = getelementptr inbounds %Type, %Type* %13, i1 0, i32 9
  %17 = getelementptr inbounds %TypeArray, %TypeArray* %16, i1 0, i32 0
  %18 = load %Type*, %Type** %17
  %19 = insertvalue %LLVM_Value zeroinitializer, %LLVM_ValueKind 8, 0
  %20 = insertvalue %LLVM_Value %19, %Type* %18, 1
  %21 = insertvalue %LLVM_Value %20, %Nat32 %14, 4
  ret %LLVM_Value %21
}

define %LLVM_Value @func308 (%ValueIndex) {
  %2 = extractvalue %ValueIndex %0, 1
  %3 = call %LLVM_Value (%Value*) @func296 (%Value* %2)
  %4 = extractvalue %ValueIndex %0, 2
  %5 = call %LLVM_Value (%Value*) @func298 (%Value* %4)
  %6 = extractvalue %LLVM_Value %3, 1
  %7 = call i1 (%Type*) @func406 (%Type* %6)
  br i1 %7, label %then_0, label %else_0
then_0:
  %8 = call %LLVM_Value (%LLVM_Value, %LLVM_Value) @eval_index_uarray (%LLVM_Value %3, %LLVM_Value %5)
  ret %LLVM_Value %8
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %10 = extractvalue %LLVM_Value %3, 0
  %11 = icmp eq %LLVM_ValueKind %10, 9
  %12 = extractvalue %LLVM_Value %3, 1
  %13 = call i1 (%Type*) @func404 (%Type* %12)
  %14 = and i1 %11, %13
  %15 = and i1 %14, 1
  br i1 %15, label %then_1, label %else_1
then_1:
  %16 = extractvalue %LLVM_Value %3, 1
  %17 = extractvalue %LLVM_Value %5, 2
  %18 = trunc %Int64 %17 to %Nat32
  %19 = call %Nat32 (%Type*, %LLVM_Value, %Nat32) @func291 (%Type* %16, %LLVM_Value %3, %Nat32 %18)
  %20 = insertvalue %LLVM_Value zeroinitializer, %LLVM_ValueKind 9, 0
  %21 = extractvalue %ValueIndex %0, 0
  %22 = insertvalue %LLVM_Value %20, %Type* %21, 1
  %23 = insertvalue %LLVM_Value %22, %Nat32 %19, 4
  ret %LLVM_Value %23
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  %25 = call %LLVM_Value (%LLVM_Value, %LLVM_Value) @func309 (%LLVM_Value %3, %LLVM_Value %5)
  ret %LLVM_Value %25
}

define %LLVM_Value @func310 (%ValueAccess) {
  %2 = extractvalue %ValueAccess %0, 2; loadImmPtr
  %3 = inttoptr i64 0 to%Str
  %4 = icmp ne %Str %2, %3
  %5 = bitcast [29 x %Nat8]* @func310_str1 to %Str
  call void (i1, %Str) @assert (i1 %4, %Str %5)
  %6 = extractvalue %ValueAccess %0, 1
  %7 = getelementptr inbounds %Value, %Value* %6, i1 0, i32 1
  %8 = load %union.9, %union.9* %7
  %9 = extractvalue %union.9 %8, 0
  %10 = bitcast %Int16 7 to %Int16
  %11 = icmp eq %Int16 %9, %10
  br i1 %11, label %then_0, label %else_0
then_0:
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %12 = extractvalue %ValueAccess %0, 1
  %13 = call %LLVM_Value (%Value*) @func296 (%Value* %12)
  %14 = extractvalue %LLVM_Value %13, 1
  %15 = getelementptr inbounds %Type, %Type* %14, i1 0, i32 0
  %16 = load %TypeKind, %TypeKind* %15
  %17 = icmp eq %TypeKind %16, 13
  br label %select_1_0
select_1_0:
  %18 = icmp eq i1 %17, 1
  br i1 %18, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %19 = extractvalue %LLVM_Value %13, 1
  %20 = getelementptr inbounds %Type, %Type* %19, i1 0, i32 8
  %21 = getelementptr inbounds %TypePointer, %TypePointer* %20, i1 0, i32 0
  %22 = load %Type*, %Type** %21
  br label %select_1_end
select_1_1:
  %23 = extractvalue %LLVM_Value %13, 1
  br label %select_1_end
select_1_end:
  %24 = phi %Type* [ %22, %select_1_0_ok ], [ %23, %select_1_1 ]
  %25 = extractvalue %ValueAccess %0, 2
  %26 = call %Decl* (%Type*, %Str) @func401 (%Type* %24, %Str %25)
  %27 = getelementptr inbounds %Decl, %Decl* %26, i1 0, i32 3
  %28 = load %Nat16, %Nat16* %27
  %29 = xor i1 %17, 1
  br i1 %29, label %then_1, label %else_1
then_1:
  %30 = extractvalue %LLVM_Value %13, 0
  %31 = icmp eq %LLVM_ValueKind %30, 9
  br i1 %31, label %then_2, label %else_2
then_2:
  %32 = zext %Nat16 %28 to %Nat32
  %33 = call %Nat32 (%Type*, %LLVM_Value, %Nat32) @func291 (%Type* %24, %LLVM_Value %13, %Nat32 %32)
  %34 = insertvalue %LLVM_Value zeroinitializer, %LLVM_ValueKind 9, 0
  %35 = extractvalue %ValueAccess %0, 0
  %36 = insertvalue %LLVM_Value %34, %Type* %35, 1
  %37 = insertvalue %LLVM_Value %36, %Nat32 %33, 4
  ret %LLVM_Value %37
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  br label %select_2_0
select_2_0:
  %39 = icmp eq i1 %17, 1
  br i1 %39, label %select_2_0_ok, label %select_2_1
select_2_0_ok:
  %40 = call %LLVM_Value (%LLVM_Value) @func359 (%LLVM_Value %13)
  br label %select_2_end
select_2_1:
  br label %select_2_end
select_2_end:
  %41 = phi %LLVM_Value [ %40, %select_2_0_ok ], [ %13, %select_2_1 ]
  %42 = call %Nat32 (%Type*, %LLVM_Value) @func290 (%Type* %24, %LLVM_Value %41)
  %43 = load %FILE*, %FILE** @fout
  %44 = bitcast [13 x %Nat8]* @func310_str2 to %Str
  %45 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %43, %Str %44, %Nat16 %28)
  %46 = insertvalue %LLVM_Value zeroinitializer, %LLVM_ValueKind 8, 0
  %47 = extractvalue %ValueAccess %0, 0
  %48 = insertvalue %LLVM_Value %46, %Type* %47, 1
  %49 = insertvalue %LLVM_Value %48, %Nat32 %42, 4
  ret %LLVM_Value %49
}

define %LLVM_Value @func311 (%ValueUn) {
  %2 = extractvalue %ValueUn %0, 1
  %3 = getelementptr inbounds %Value, %Value* %2, i1 0, i32 1
  %4 = load %union.9, %union.9* %3
  %5 = extractvalue %union.9 %4, 0
  %6 = bitcast %Int16 34 to %Int16
  %7 = icmp eq %Int16 %5, %6
  br i1 %7, label %then_0, label %else_0
then_0:
  %8 = extractvalue %ValueUn %0, 1
  %9 = getelementptr inbounds %Value, %Value* %8, i1 0, i32 1
  %10 = load %union.9, %union.9* %9
  %11 = alloca %union.9
  store %union.9 %10, %union.9* %11, align 128
  %12 = getelementptr inbounds %union.9, %union.9* %11, i1 0, i32 1
  %13 = bitcast [72 x %Nat8]* %12 to %ValueGlobalVar*
  %14 = load %ValueGlobalVar, %ValueGlobalVar* %13
  %15 = extractvalue %ValueGlobalVar %14, 1
  %16 = call %Str (%Definition*) @def_getname (%Definition* %15)
  %17 = insertvalue %LLVM_Value zeroinitializer, %LLVM_ValueKind 5, 0
  %18 = extractvalue %ValueUn %0, 0
  %19 = insertvalue %LLVM_Value %17, %Type* %18, 1
  %20 = insertvalue %LLVM_Value %19, %Str %16, 3
  ret %LLVM_Value %20
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %22 = extractvalue %ValueUn %0, 1
  %23 = call %LLVM_Value (%Value*) @func296 (%Value* %22)
  %24 = extractvalue %LLVM_Value %23, 0
  %25 = icmp eq %LLVM_ValueKind %24, 8
  br i1 %25, label %then_1, label %else_1
then_1:
  %26 = insertvalue %LLVM_Value zeroinitializer, %LLVM_ValueKind 9, 0
  %27 = extractvalue %ValueUn %0, 0
  %28 = insertvalue %LLVM_Value %26, %Type* %27, 1
  %29 = extractvalue %LLVM_Value %23, 4
  %30 = insertvalue %LLVM_Value %28, %Nat32 %29, 4
  ret %LLVM_Value %30
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  %32 = extractvalue %LLVM_Value %23, 1
  %33 = call %Nat32 (%Type*, %LLVM_Value) @func290 (%Type* %32, %LLVM_Value %23)
  %34 = bitcast [5 x %Nat8]* @func311_str1 to %Str
  call void (%Str) @o (%Str %34)
  %35 = insertvalue %LLVM_Value zeroinitializer, %LLVM_ValueKind 9, 0
  %36 = extractvalue %ValueUn %0, 0
  %37 = insertvalue %LLVM_Value %35, %Type* %36, 1
  %38 = insertvalue %LLVM_Value %37, %Nat32 %33, 4
  ret %LLVM_Value %38
}

define %LLVM_Value @func312 (%ValueUn) {
  %2 = extractvalue %ValueUn %0, 1
  %3 = call %LLVM_Value (%Value*) @func298 (%Value* %2)
  %4 = insertvalue %LLVM_Value zeroinitializer, %LLVM_ValueKind 8, 0
  %5 = extractvalue %ValueUn %0, 0
  %6 = insertvalue %LLVM_Value %4, %Type* %5, 1
  %7 = extractvalue %LLVM_Value %3, 4
  %8 = insertvalue %LLVM_Value %6, %Nat32 %7, 4
  ret %LLVM_Value %8
}

define %LLVM_Value @func313 (%ValueUn) {
  %2 = extractvalue %ValueUn %0, 1
  %3 = call %LLVM_Value (%Value*) @func298 (%Value* %2)
  %4 = bitcast [4 x %Nat8]* @func313_str1 to %Str
  %5 = extractvalue %LLVM_Value %3, 1
  %6 = call %Nat32 (%Str, %Type*) @func289 (%Str %4, %Type* %5)
  call void () @space ()
  call void (%LLVM_Value) @func361 (%LLVM_Value %3)
  %7 = extractvalue %LLVM_Value %3, 1
  %8 = load %Type*, %Type** @typeBool
  %9 = call i1 (%Type*, %Type*) @func445 (%Type* %7, %Type* %8)
  br i1 %9, label %then_0, label %else_0
then_0:
  %10 = bitcast [4 x %Nat8]* @func313_str2 to %Str
  call void (%Str) @o (%Str %10)
  br label %endif_0
else_0:
  %11 = bitcast [5 x %Nat8]* @func313_str3 to %Str
  call void (%Str) @o (%Str %11)
  br label %endif_0
endif_0:
  %12 = insertvalue %LLVM_Value zeroinitializer, %LLVM_ValueKind 9, 0
  %13 = extractvalue %LLVM_Value %3, 1
  %14 = insertvalue %LLVM_Value %12, %Type* %13, 1
  %15 = insertvalue %LLVM_Value %14, %Nat32 %6, 4
  ret %LLVM_Value %15
}

define %LLVM_Value @func314 (%ValueUn) {
  %2 = extractvalue %ValueUn %0, 1
  %3 = call %LLVM_Value (%Value*) @func298 (%Value* %2)
  %4 = bitcast [8 x %Nat8]* @func314_str1 to %Str
  %5 = insertvalue %LLVM_Value zeroinitializer, %LLVM_ValueKind 4, 0
  %6 = load %Type*, %Type** @typeBaseInt
  %7 = insertvalue %LLVM_Value %5, %Type* %6, 1
  %8 = insertvalue %LLVM_Value %7, %Int64 0, 2
  %9 = call %Nat32 (%Str, %LLVM_Value, %LLVM_Value) @func292 (%Str %4, %LLVM_Value %8, %LLVM_Value %3)
  %10 = insertvalue %LLVM_Value zeroinitializer, %LLVM_ValueKind 9, 0
  %11 = extractvalue %LLVM_Value %3, 1
  %12 = insertvalue %LLVM_Value %10, %Type* %11, 1
  %13 = insertvalue %LLVM_Value %12, %Nat32 %9, 4
  ret %LLVM_Value %13
}

define %LLVM_Value @func315 (%ValueUn) {
  %2 = extractvalue %ValueUn %0, 1
  %3 = call %LLVM_Value (%Value*) @func298 (%Value* %2)
  ret %LLVM_Value %3
}

define %LLVM_Value @func316 (%Str, %LLVM_Value, %Type*) {
  %4 = extractvalue %LLVM_Value %1, 1
  %5 = call %Nat32 (%Str, %Type*) @func289 (%Str %0, %Type* %4)
  call void () @space ()
  call void (%LLVM_Value) @func361 (%LLVM_Value %1)
  %6 = bitcast [5 x %Nat8]* @func316_str1 to %Str
  call void (%Str) @o (%Str %6)
  call void (%Type*) @func381 (%Type* %2)
  %7 = insertvalue %LLVM_Value zeroinitializer, %LLVM_ValueKind 9, 0
  %8 = insertvalue %LLVM_Value %7, %Type* %2, 1
  %9 = insertvalue %LLVM_Value %8, %Nat32 %5, 4
  ret %LLVM_Value %9
}

define %LLVM_Value @func317 (%LLVM_Value, %Type*) {
  %3 = extractvalue %LLVM_Value %0, 1
  %4 = getelementptr inbounds %Type, %Type* %3, i1 0, i32 0
  %5 = load %TypeKind, %TypeKind* %4
  br label %select_1_0
select_1_0:
  %6 = icmp eq %TypeKind %5, 5
  br i1 %6, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %7 = bitcast [9 x %Nat8]* @func317_str1 to %Str
  %8 = call %LLVM_Value (%Str, %LLVM_Value, %Type*) @func316 (%Str %7, %LLVM_Value %0, %Type* %1)
  br label %select_1_end
select_1_1:
  %9 = bitcast [8 x %Nat8]* @func317_str2 to %Str
  %10 = call %LLVM_Value (%Str, %LLVM_Value, %Type*) @func316 (%Str %9, %LLVM_Value %0, %Type* %1)
  br label %select_1_end
select_1_end:
  %11 = phi %LLVM_Value [ %8, %select_1_0_ok ], [ %10, %select_1_1 ]
  ret %LLVM_Value %11
}

define %LLVM_Value @func318 (%LLVM_Value, %Type*) {
  %3 = bitcast [6 x %Nat8]* @func318_str1 to %Str
  %4 = call %LLVM_Value (%Str, %LLVM_Value, %Type*) @func316 (%Str %3, %LLVM_Value %0, %Type* %1)
  ret %LLVM_Value %4
}

define %LLVM_Value @func320 (%LLVM_Value, %Type*) {
  %3 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 6
  %4 = getelementptr inbounds %TypeNumeric, %TypeNumeric* %3, i1 0, i32 1
  %5 = load i1, i1* %4
  br label %select_1_0
select_1_0:
  %6 = icmp eq i1 %5, 1
  br i1 %6, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %7 = bitcast [5 x %Nat8]* @func319_func320_str1 to %Str
  %8 = call %LLVM_Value (%Str, %LLVM_Value, %Type*) @func316 (%Str %7, %LLVM_Value %0, %Type* %1)
  br label %select_1_end
select_1_1:
  %9 = bitcast [5 x %Nat8]* @func319_func320_str2 to %Str
  %10 = call %LLVM_Value (%Str, %LLVM_Value, %Type*) @func316 (%Str %9, %LLVM_Value %0, %Type* %1)
  br label %select_1_end
select_1_end:
  %11 = phi %LLVM_Value [ %8, %select_1_0_ok ], [ %10, %select_1_1 ]
  ret %LLVM_Value %11
}

define %LLVM_Value @eval_cast_basic_to_basic (%LLVM_Value, %Type*) {
  br label %select_1_0
select_1_0:
  %3 = extractvalue %LLVM_Value %0, 1
  %4 = getelementptr inbounds %Type, %Type* %3, i1 0, i32 6
  %5 = getelementptr inbounds %TypeNumeric, %TypeNumeric* %4, i1 0, i32 0
  %6 = load %Nat32, %Nat32* %5
  %7 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 6
  %8 = getelementptr inbounds %TypeNumeric, %TypeNumeric* %7, i1 0, i32 0
  %9 = load %Nat32, %Nat32* %8
  %10 = icmp ugt %Nat32 %6, %9
  %11 = icmp eq i1 1, %10
  br i1 %11, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %12 = bitcast [6 x %Nat8]* @func319_str1 to %Str
  %13 = call %LLVM_Value (%Str, %LLVM_Value, %Type*) @func316 (%Str %12, %LLVM_Value %0, %Type* %1)
  br label %select_1_end
select_1_1:
  %14 = extractvalue %LLVM_Value %0, 1
  %15 = getelementptr inbounds %Type, %Type* %14, i1 0, i32 6
  %16 = getelementptr inbounds %TypeNumeric, %TypeNumeric* %15, i1 0, i32 0
  %17 = load %Nat32, %Nat32* %16
  %18 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 6
  %19 = getelementptr inbounds %TypeNumeric, %TypeNumeric* %18, i1 0, i32 0
  %20 = load %Nat32, %Nat32* %19
  %21 = icmp ult %Nat32 %17, %20
  %22 = icmp eq i1 1, %21
  br i1 %22, label %select_1_1_ok, label %select_1_2
select_1_1_ok:
  %23 = call %LLVM_Value (%LLVM_Value, %Type*) @func320 (%LLVM_Value %0, %Type* %1)
  br label %select_1_end
select_1_2:
  %24 = bitcast [8 x %Nat8]* @func319_str2 to %Str
  %25 = call %LLVM_Value (%Str, %LLVM_Value, %Type*) @func316 (%Str %24, %LLVM_Value %0, %Type* %1)
  br label %select_1_end
select_1_end:
  %26 = phi %LLVM_Value [ %13, %select_1_0_ok ], [ %23, %select_1_1_ok ], [ %25, %select_1_2 ]
  ret %LLVM_Value %26
}

define %LLVM_Value @eval_cast_enum_to_basic (%LLVM_Value, %Type*) {
  br label %select_1_0
select_1_0:
  %3 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 6
  %4 = getelementptr inbounds %TypeNumeric, %TypeNumeric* %3, i1 0, i32 0
  %5 = load %Nat32, %Nat32* %4
  %6 = icmp ugt %Nat32 2, %5
  %7 = icmp eq i1 1, %6
  br i1 %7, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %8 = bitcast [6 x %Nat8]* @func321_str1 to %Str
  %9 = call %LLVM_Value (%Str, %LLVM_Value, %Type*) @func316 (%Str %8, %LLVM_Value %0, %Type* %1)
  br label %select_1_end
select_1_1:
  %10 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 6
  %11 = getelementptr inbounds %TypeNumeric, %TypeNumeric* %10, i1 0, i32 0
  %12 = load %Nat32, %Nat32* %11
  %13 = icmp ult %Nat32 2, %12
  %14 = icmp eq i1 1, %13
  br i1 %14, label %select_1_1_ok, label %select_1_2
select_1_1_ok:
  %15 = bitcast [5 x %Nat8]* @func321_str2 to %Str
  %16 = call %LLVM_Value (%Str, %LLVM_Value, %Type*) @func316 (%Str %15, %LLVM_Value %0, %Type* %1)
  br label %select_1_end
select_1_2:
  %17 = bitcast [8 x %Nat8]* @func321_str3 to %Str
  %18 = call %LLVM_Value (%Str, %LLVM_Value, %Type*) @func316 (%Str %17, %LLVM_Value %0, %Type* %1)
  br label %select_1_end
select_1_end:
  %19 = phi %LLVM_Value [ %9, %select_1_0_ok ], [ %16, %select_1_1_ok ], [ %18, %select_1_2 ]
  ret %LLVM_Value %19
}

define %LLVM_Value @func323 (%LLVM_Value, %Type*) {
  %3 = extractvalue %LLVM_Value %0, 1
  %4 = getelementptr inbounds %Type, %Type* %3, i1 0, i32 0
  %5 = load %TypeKind, %TypeKind* %4
  %6 = load %FILE*, %FILE** @fout
  %7 = bitcast [26 x %Nat8]* @func322_func323_str1 to %Str
  %8 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %6, %Str %7, %TypeKind %5)
  %9 = bitcast [6 x %Nat8]* @func322_func323_str2 to %Str
  %10 = call %Int32 (%Str, ...) @printf (%Str %9)
  %11 = extractvalue %LLVM_Value %0, 1
  call void (%Type*) @func87 (%Type* %11)
  %12 = bitcast [5 x %Nat8]* @func322_func323_str3 to %Str
  %13 = call %Int32 (%Str, ...) @printf (%Str %12)
  call void (%Type*) @func87 (%Type* %1)
  %14 = bitcast [2 x %Nat8]* @func322_func323_str4 to %Str
  %15 = call %Int32 (%Str, ...) @printf (%Str %14)
  %16 = bitcast [19 x %Nat8]* @func322_func323_str5 to %Str
  call void (i1, %Str) @assert (i1 0, %Str %16)
  %17 = insertvalue %LLVM_Value zeroinitializer, %LLVM_ValueKind 0, 0
  ret %LLVM_Value %17
}

define %LLVM_Value @func322 (%LLVM_Value, %Type*) {
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
  %8 = icmp eq %TypeKind %5, 13
  br i1 %8, label %select_1_1_ok, label %select_1_2
select_1_1_ok:
  %9 = bitcast [9 x %Nat8]* @func322_str1 to %Str
  %10 = call %LLVM_Value (%Str, %LLVM_Value, %Type*) @func316 (%Str %9, %LLVM_Value %0, %Type* %1)
  br label %select_1_end
select_1_2:
  %11 = icmp eq %TypeKind %5, 11
  br i1 %11, label %select_1_2_ok, label %select_1_3
select_1_2_ok:
  %12 = call %LLVM_Value (%LLVM_Value, %Type*) @eval_cast_enum_to_basic (%LLVM_Value %0, %Type* %1)
  br label %select_1_end
select_1_3:
  %13 = icmp eq %TypeKind %5, 9
  br i1 %13, label %select_1_3_ok, label %select_1_4
select_1_3_ok:
  %14 = bitcast [5 x %Nat8]* @func322_str2 to %Str
  %15 = call %LLVM_Value (%Str, %LLVM_Value, %Type*) @func316 (%Str %14, %LLVM_Value %0, %Type* %1)
  br label %select_1_end
select_1_4:
  %16 = icmp eq %TypeKind %5, 16
  br i1 %16, label %select_1_4_ok, label %select_1_5
select_1_4_ok:
  %17 = bitcast [8 x %Nat8]* @func322_str3 to %Str
  %18 = call %LLVM_Value (%Str, %LLVM_Value, %Type*) @func316 (%Str %17, %LLVM_Value %0, %Type* %1)
  br label %select_1_end
select_1_5:
  %19 = icmp eq %TypeKind %5, 6
  br i1 %19, label %select_1_5_ok, label %select_1_6
select_1_5_ok:
  %20 = bitcast [8 x %Nat8]* @func322_str4 to %Str
  %21 = call %LLVM_Value (%Str, %LLVM_Value, %Type*) @func316 (%Str %20, %LLVM_Value %0, %Type* %1)
  br label %select_1_end
select_1_6:
  %22 = icmp eq %TypeKind %5, 12
  br i1 %22, label %select_1_6_ok, label %select_1_7
select_1_6_ok:
  %23 = bitcast [8 x %Nat8]* @func322_str5 to %Str
  %24 = call %LLVM_Value (%Str, %LLVM_Value, %Type*) @func316 (%Str %23, %LLVM_Value %0, %Type* %1)
  br label %select_1_end
select_1_7:
  %25 = call %LLVM_Value (%LLVM_Value, %Type*) @func323 (%LLVM_Value %0, %Type* %1)
  br label %select_1_end
select_1_end:
  %26 = phi %LLVM_Value [ %7, %select_1_0_ok ], [ %10, %select_1_1_ok ], [ %12, %select_1_2_ok ], [ %15, %select_1_3_ok ], [ %18, %select_1_4_ok ], [ %21, %select_1_5_ok ], [ %24, %select_1_6_ok ], [ %25, %select_1_7 ]
  ret %LLVM_Value %26
}

define %LLVM_Value @func324 (%ValueAs) {
  %2 = extractvalue %ValueAs %0, 1
  %3 = call %LLVM_Value (%Value*) @func298 (%Value* %2)
  %4 = extractvalue %ValueAs %0, 0
  %5 = bitcast [8 x %Nat8]* @func324_str1 to %Str
  %6 = call %LLVM_Value (%Str, %LLVM_Value, %Type*) @func316 (%Str %5, %LLVM_Value %3, %Type* %4)
  ret %LLVM_Value %6
}

define %LLVM_Value @func325 (%ValueIs) {
  %2 = extractvalue %ValueIs %0, 1
  %3 = call %LLVM_Value (%Value*) @func298 (%Value* %2)
  %4 = extractvalue %LLVM_Value %3, 1
  %5 = getelementptr inbounds %Type, %Type* %4, i1 0, i32 14
  %6 = getelementptr inbounds %TypeUnion, %TypeUnion* %5, i1 0, i32 1
  %7 = load %Type*, %Type** %6; loadImmPtr
  %8 = inttoptr i64 0 to%Type*
  %9 = icmp ne %Type* %7, %8
  br i1 %9, label %then_0, label %else_0
then_0:
  %10 = insertvalue %LLVM_Value zeroinitializer, %LLVM_ValueKind 4, 0
  %11 = load %Type*, %Type** @typeBaseInt
  %12 = insertvalue %LLVM_Value %10, %Type* %11, 1
  %13 = insertvalue %LLVM_Value %12, %Int64 0, 2
  %14 = load %Type*, %Type** @typeBaseInt
  %15 = call %LLVM_Value (%LLVM_Value, %Type*) @func348 (%LLVM_Value %13, %Type* %14)
  %16 = bitcast [9 x %Nat8]* @func325_str1 to %Str
  %17 = load %Type*, %Type** @typeBaseInt
  %18 = call %LLVM_Value (%Str, %LLVM_Value, %Type*) @func316 (%Str %16, %LLVM_Value %3, %Type* %17)
  %19 = extractvalue %ValueIs %0, 3
  br label %select_1_0
select_1_0:
  %20 = extractvalue %ValueIs %0, 2
  %21 = xor i1 %20, 1
  %22 = zext i1 %21 to %Nat32
  %23 = icmp eq %Nat32 %19, %22
  br i1 %23, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %24 = bitcast [8 x %Nat8]* @func325_str2 to %Str
  %25 = call %Nat32 (%Str, %LLVM_Value, %LLVM_Value) @func292 (%Str %24, %LLVM_Value %18, %LLVM_Value %15)
  br label %select_1_end
select_1_1:
  %26 = extractvalue %ValueIs %0, 2
  %27 = zext i1 %26 to %Nat32
  %28 = icmp eq %Nat32 %19, %27
  br i1 %28, label %select_1_1_ok, label %select_1_2
select_1_1_ok:
  %29 = bitcast [8 x %Nat8]* @func325_str3 to %Str
  %30 = call %Nat32 (%Str, %LLVM_Value, %LLVM_Value) @func292 (%Str %29, %LLVM_Value %18, %LLVM_Value %15)
  br label %select_1_end
select_1_2:
  %31 = bitcast %Nat32 0 to %Nat32
  br label %select_1_end
select_1_end:
  %32 = phi %Nat32 [ %25, %select_1_0_ok ], [ %30, %select_1_1_ok ], [ %31, %select_1_2 ]
  %33 = insertvalue %LLVM_Value zeroinitializer, %LLVM_ValueKind 9, 0
  %34 = load %Type*, %Type** @typeBool
  %35 = insertvalue %LLVM_Value %33, %Type* %34, 1
  %36 = insertvalue %LLVM_Value %35, %Nat32 %32, 4
  ret %LLVM_Value %36
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %38 = extractvalue %LLVM_Value %3, 0
  %39 = icmp ne %LLVM_ValueKind %38, 9
  br i1 %39, label %then_1, label %else_1
then_1:
  %40 = bitcast [31 x %Nat8]* @func325_str4 to %Str
  call void (%Str) @fatal (%Str %40)
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  %41 = call %Nat32 () @lab_get ()
  %42 = load %FILE*, %FILE** @fout
  %43 = bitcast [29 x %Nat8]* @func325_str5 to %Str
  %44 = extractvalue %LLVM_Value %3, 1
  %45 = getelementptr inbounds %Type, %Type* %44, i1 0, i32 2
  %46 = load %Str, %Str* %45
  %47 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %42, %Str %43, %Nat32 %41, %Str %46)
  call void (%LLVM_Value) @func361 (%LLVM_Value %3)
  %48 = bitcast [4 x %Nat8]* @func325_str6 to %Str
  call void (%Str) @o (%Str %48)
  %49 = call %Type* (%Nat32) @func449 (%Nat32 2)
  %50 = insertvalue %LLVM_Value zeroinitializer, %LLVM_ValueKind 4, 0
  %51 = insertvalue %LLVM_Value %50, %Type* %49, 1
  %52 = extractvalue %ValueIs %0, 3
  %53 = sext %Nat32 %52 to %Int64
  %54 = insertvalue %LLVM_Value %51, %Int64 %53, 2
  %55 = load %Type*, %Type** @typeBaseInt
  %56 = call %LLVM_Value (%LLVM_Value, %Type*) @func348 (%LLVM_Value %54, %Type* %55)
  %57 = extractvalue %ValueIs %0, 2
  br label %select_2_0
select_2_0:
  %58 = icmp eq i1 %57, 1
  br i1 %58, label %select_2_0_ok, label %select_2_1
select_2_0_ok:
  %59 = bitcast [8 x %Nat8]* @func325_str7 to %Str
  %60 = insertvalue %LLVM_Value zeroinitializer, %LLVM_ValueKind 9, 0
  %61 = insertvalue %LLVM_Value %60, %Type* %49, 1
  %62 = insertvalue %LLVM_Value %61, %Nat32 %41, 4
  %63 = call %Nat32 (%Str, %LLVM_Value, %LLVM_Value) @func292 (%Str %59, %LLVM_Value %62, %LLVM_Value %56)
  br label %select_2_end
select_2_1:
  %64 = bitcast [8 x %Nat8]* @func325_str8 to %Str
  %65 = insertvalue %LLVM_Value zeroinitializer, %LLVM_ValueKind 9, 0
  %66 = insertvalue %LLVM_Value %65, %Type* %49, 1
  %67 = insertvalue %LLVM_Value %66, %Nat32 %41, 4
  %68 = call %Nat32 (%Str, %LLVM_Value, %LLVM_Value) @func292 (%Str %64, %LLVM_Value %67, %LLVM_Value %56)
  br label %select_2_end
select_2_end:
  %69 = phi %Nat32 [ %63, %select_2_0_ok ], [ %68, %select_2_1 ]
  %70 = insertvalue %LLVM_Value zeroinitializer, %LLVM_ValueKind 9, 0
  %71 = load %Type*, %Type** @typeBool
  %72 = insertvalue %LLVM_Value %70, %Type* %71, 1
  %73 = insertvalue %LLVM_Value %72, %Nat32 %69, 4
  ret %LLVM_Value %73
}

define %LLVM_Value @eval_cast_to_union (%LLVM_Value, %Type*) {
  %3 = extractvalue %LLVM_Value %0, 1
  %4 = call %Nat32 (%Type*, %Type*) @func451 (%Type* %1, %Type* %3)
  %5 = call i1 (%Type*) @func412 (%Type* %1)
  %6 = xor i1 %5, 1
  br i1 %6, label %then_0, label %else_0
then_0:
  %7 = bitcast [7 x %Nat8]* @func326_str1 to %Str
  %8 = call %Nat32 (%Str, %Type*) @func289 (%Str %7, %Type* %1)
  %9 = call %Type* (%Nat32) @func449 (%Nat32 2); loadImmPtr
  %10 = inttoptr i64 0 to%TokenInfo*
  %11 = call %Type* (%Type*, %TokenInfo*) @func395 (%Type* %9, %TokenInfo* %10)
  %12 = load %FILE*, %FILE** @fout
  %13 = bitcast [20 x %Nat8]* @func326_str2 to %Str
  %14 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %12, %Str %13, %Nat32 %4)
  %15 = insertvalue %LLVM_Value zeroinitializer, %LLVM_ValueKind 6, 0
  %16 = insertvalue %LLVM_Value %15, %Type* %1, 1
  %17 = insertvalue %LLVM_Value %16, %Nat32 %8, 4
  %18 = call %Nat32 (%Type*, %LLVM_Value) @func290 (%Type* %1, %LLVM_Value %17)
  %19 = bitcast [12 x %Nat8]* @func326_str3 to %Str
  call void (%Str) @o (%Str %19)
  %20 = insertvalue %LLVM_Value zeroinitializer, %LLVM_ValueKind 9, 0
  %21 = insertvalue %LLVM_Value %20, %Type* %11, 1
  %22 = insertvalue %LLVM_Value %21, %Nat32 %18, 4
  %23 = insertvalue %LLVM_Value zeroinitializer, %LLVM_ValueKind 4, 0
  %24 = insertvalue %LLVM_Value %23, %Type* %9, 1
  %25 = sext %Nat32 %4 to %Int64
  %26 = insertvalue %LLVM_Value %24, %Int64 %25, 2
  call void (%LLVM_Value, %LLVM_Value) @func358 (%LLVM_Value %22, %LLVM_Value %26)
  %27 = bitcast [13 x %Nat8]* @func326_str4 to %Str
  call void (%Str) @ol (%Str %27)
  %28 = insertvalue %LLVM_Value zeroinitializer, %LLVM_ValueKind 6, 0
  %29 = insertvalue %LLVM_Value %28, %Type* %1, 1
  %30 = insertvalue %LLVM_Value %29, %Nat32 %8, 4
  %31 = call %Nat32 (%Type*, %LLVM_Value) @func290 (%Type* %1, %LLVM_Value %30)
  %32 = bitcast [12 x %Nat8]* @func326_str5 to %Str
  call void (%Str) @o (%Str %32)
  %33 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 14
  %34 = getelementptr inbounds %TypeUnion, %TypeUnion* %33, i1 0, i32 2
  %35 = load %Nat32, %Nat32* %34
  %36 = load %Type*, %Type** @typeChar; loadImmPtr
  %37 = inttoptr i64 0 to%TokenInfo*
  %38 = call %Type* (%Type*, %Nat32, %TokenInfo*) @func397 (%Type* %36, %Nat32 %35, %TokenInfo* %37); loadImmPtr
  %39 = inttoptr i64 0 to%TokenInfo*
  %40 = call %Type* (%Type*, %TokenInfo*) @func395 (%Type* %38, %TokenInfo* %39)
  %41 = bitcast [8 x %Nat8]* @func326_str6 to %Str
  %42 = insertvalue %LLVM_Value zeroinitializer, %LLVM_ValueKind 9, 0
  %43 = insertvalue %LLVM_Value %42, %Type* %40, 1
  %44 = insertvalue %LLVM_Value %43, %Nat32 %31, 4
  %45 = extractvalue %LLVM_Value %0, 1; loadImmPtr
  %46 = inttoptr i64 0 to%TokenInfo*
  %47 = call %Type* (%Type*, %TokenInfo*) @func395 (%Type* %45, %TokenInfo* %46)
  %48 = call %LLVM_Value (%Str, %LLVM_Value, %Type*) @func316 (%Str %41, %LLVM_Value %44, %Type* %47)
  call void (%LLVM_Value, %LLVM_Value) @func358 (%LLVM_Value %48, %LLVM_Value %0)
  %49 = insertvalue %LLVM_Value zeroinitializer, %LLVM_ValueKind 6, 0
  %50 = insertvalue %LLVM_Value %49, %Type* %1, 1
  %51 = insertvalue %LLVM_Value %50, %Nat32 %8, 4
  ret %LLVM_Value %51
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  br label %select_1_0
select_1_0:
  %53 = extractvalue %LLVM_Value %0, 1
  %54 = load %Type*, %Type** @typeUnit
  %55 = call i1 (%Type*, %Type*) @func445 (%Type* %53, %Type* %54)
  %56 = icmp eq i1 1, %55
  br i1 %56, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %57 = bitcast [9 x %Nat8]* @func326_str7 to %Str
  %58 = call %LLVM_Value (%Str, %LLVM_Value, %Type*) @func316 (%Str %57, %LLVM_Value %0, %Type* %1)
  br label %select_1_end
select_1_1:
  %59 = extractvalue %LLVM_Value %0, 1
  %60 = getelementptr inbounds %Type, %Type* %59, i1 0, i32 0
  %61 = load %TypeKind, %TypeKind* %60
  %62 = icmp eq %TypeKind %61, 5
  %63 = icmp eq i1 1, %62
  br i1 %63, label %select_1_1_ok, label %select_1_2
select_1_1_ok:
  %64 = bitcast [9 x %Nat8]* @func326_str8 to %Str
  %65 = call %LLVM_Value (%Str, %LLVM_Value, %Type*) @func316 (%Str %64, %LLVM_Value %0, %Type* %1)
  br label %select_1_end
select_1_2:
  %66 = bitcast [8 x %Nat8]* @func326_str9 to %Str
  %67 = call %LLVM_Value (%Str, %LLVM_Value, %Type*) @func316 (%Str %66, %LLVM_Value %0, %Type* %1)
  br label %select_1_end
select_1_end:
  %68 = phi %LLVM_Value [ %58, %select_1_0_ok ], [ %65, %select_1_1_ok ], [ %67, %select_1_2 ]
  ret %LLVM_Value %68
}

define %LLVM_Value @eval_cast_union_to (%LLVM_Value, %Type*) {
  %3 = bitcast [7 x %Nat8]* @func327_str1 to %Str
  %4 = extractvalue %LLVM_Value %0, 1
  %5 = call %Nat32 (%Str, %Type*) @func289 (%Str %3, %Type* %4)
  %6 = insertvalue %LLVM_Value zeroinitializer, %LLVM_ValueKind 6, 0
  %7 = extractvalue %LLVM_Value %0, 1
  %8 = insertvalue %LLVM_Value %6, %Type* %7, 1
  %9 = insertvalue %LLVM_Value %8, %Nat32 %5, 4
  call void (%LLVM_Value, %LLVM_Value) @func358 (%LLVM_Value %9, %LLVM_Value %0)
  %10 = extractvalue %LLVM_Value %0, 1
  %11 = getelementptr inbounds %Type, %Type* %10, i1 0, i32 14
  %12 = getelementptr inbounds %TypeUnion, %TypeUnion* %11, i1 0, i32 2
  %13 = load %Nat32, %Nat32* %12
  %14 = load %Type*, %Type** @typeChar; loadImmPtr
  %15 = inttoptr i64 0 to%TokenInfo*
  %16 = call %Type* (%Type*, %Nat32, %TokenInfo*) @func397 (%Type* %14, %Nat32 %13, %TokenInfo* %15); loadImmPtr
  %17 = inttoptr i64 0 to%TokenInfo*
  %18 = call %Type* (%Type*, %TokenInfo*) @func395 (%Type* %16, %TokenInfo* %17)
  %19 = extractvalue %LLVM_Value %0, 1
  %20 = insertvalue %LLVM_Value zeroinitializer, %LLVM_ValueKind 6, 0
  %21 = extractvalue %LLVM_Value %0, 1
  %22 = insertvalue %LLVM_Value %20, %Type* %21, 1
  %23 = insertvalue %LLVM_Value %22, %Nat32 %5, 4
  %24 = call %Nat32 (%Type*, %LLVM_Value) @func290 (%Type* %19, %LLVM_Value %23)
  %25 = bitcast [12 x %Nat8]* @func327_str2 to %Str
  call void (%Str) @o (%Str %25); loadImmPtr
  %26 = inttoptr i64 0 to%TokenInfo*
  %27 = call %Type* (%Type*, %TokenInfo*) @func395 (%Type* %1, %TokenInfo* %26)
  %28 = bitcast [8 x %Nat8]* @func327_str3 to %Str
  %29 = insertvalue %LLVM_Value zeroinitializer, %LLVM_ValueKind 9, 0
  %30 = insertvalue %LLVM_Value %29, %Type* %18, 1
  %31 = insertvalue %LLVM_Value %30, %Nat32 %24, 4
  %32 = call %LLVM_Value (%Str, %LLVM_Value, %Type*) @func316 (%Str %28, %LLVM_Value %31, %Type* %27)
  %33 = bitcast [5 x %Nat8]* @func327_str4 to %Str
  %34 = call %Nat32 (%Str, %Type*) @func289 (%Str %33, %Type* %1)
  call void () @comma ()
  call void (%Type*) @func381 (%Type* %1)
  %35 = bitcast [3 x %Nat8]* @func327_str5 to %Str
  call void (%Str) @o (%Str %35)
  call void (%LLVM_Value) @func361 (%LLVM_Value %32)
  %36 = insertvalue %LLVM_Value zeroinitializer, %LLVM_ValueKind 9, 0
  %37 = insertvalue %LLVM_Value %36, %Type* %1, 1
  %38 = insertvalue %LLVM_Value %37, %Nat32 %34, 4
  ret %LLVM_Value %38
}

define %LLVM_Value @func329 (%LLVM_Value, %Type*) {
  %3 = bitcast [18 x %Nat8]* @func328_func329_str1 to %Str
  %4 = call %Int32 (%Str, ...) @printf (%Str %3)
  %5 = extractvalue %LLVM_Value %0, 1
  call void (%Type*) @func87 (%Type* %5)
  %6 = bitcast [6 x %Nat8]* @func328_func329_str2 to %Str
  %7 = call %Int32 (%Str, ...) @printf (%Str %6)
  call void (%Type*) @func87 (%Type* %1)
  %8 = bitcast [2 x %Nat8]* @func328_func329_str3 to %Str
  %9 = call %Int32 (%Str, ...) @printf (%Str %8)
  %10 = bitcast [16 x %Nat8]* @func328_func329_str4 to %Str
  call void (%Str) @fatal (%Str %10)
  %11 = insertvalue %LLVM_Value zeroinitializer, %LLVM_ValueKind 0, 0
  %12 = insertvalue %LLVM_Value %11, %Type* %1, 1
  ret %LLVM_Value %12
}

define %LLVM_Value @func328 (%ValueCast) {
  %2 = extractvalue %ValueCast %0, 1
  %3 = call %LLVM_Value (%Value*) @func298 (%Value* %2)
  %4 = extractvalue %ValueCast %0, 0
  %5 = extractvalue %LLVM_Value %3, 1
  %6 = getelementptr inbounds %Type, %Type* %5, i1 0, i32 0
  %7 = load %TypeKind, %TypeKind* %6
  %8 = icmp eq %TypeKind %7, 8
  br i1 %8, label %then_0, label %else_0
then_0:
  %9 = bitcast [11 x %Nat8]* @func328_str1 to %Str
  %10 = call %Int32 (%Str, ...) @printf (%Str %9)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %11 = extractvalue %LLVM_Value %3, 1
  %12 = getelementptr inbounds %Type, %Type* %11, i1 0, i32 0
  %13 = load %TypeKind, %TypeKind* %12
  %14 = icmp eq %TypeKind %13, 16
  br i1 %14, label %then_1, label %else_1
then_1:
  %15 = extractvalue %LLVM_Value %3, 1
  %16 = getelementptr inbounds %Type, %Type* %15, i1 0, i32 14
  %17 = getelementptr inbounds %TypeUnion, %TypeUnion* %16, i1 0, i32 1
  %18 = load %Type*, %Type** %17; loadImmPtr
  %19 = inttoptr i64 0 to%Type*
  %20 = icmp eq %Type* %18, %19
  br i1 %20, label %then_2, label %else_2
then_2:
  %21 = call %LLVM_Value (%LLVM_Value, %Type*) @eval_cast_union_to (%LLVM_Value %3, %Type* %4)
  ret %LLVM_Value %21
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  %23 = extractvalue %LLVM_Value %3, 1
  %24 = getelementptr inbounds %Type, %Type* %23, i1 0, i32 0
  %25 = load %TypeKind, %TypeKind* %24
  %26 = icmp eq %TypeKind %25, 6
  br i1 %26, label %then_3, label %else_3
then_3:
  %27 = extractvalue %LLVM_Value %3, 1
  %28 = getelementptr inbounds %Type, %Type* %27, i1 0, i32 14
  %29 = getelementptr inbounds %TypeUnion, %TypeUnion* %28, i1 0, i32 1
  %30 = load %Type*, %Type** %29; loadImmPtr
  %31 = inttoptr i64 0 to%Type*
  %32 = icmp eq %Type* %30, %31
  br i1 %32, label %then_4, label %else_4
then_4:
  %33 = call %LLVM_Value (%LLVM_Value, %Type*) @eval_cast_union_to (%LLVM_Value %3, %Type* %4)
  ret %LLVM_Value %33
  br label %endif_4
else_4:
  br label %endif_4
endif_4:
  br label %endif_3
else_3:
  br label %endif_3
endif_3:
  br label %select_1_0
select_1_0:
  %35 = call i1 (%Type*) @func403 (%Type* %4)
  %36 = icmp eq i1 1, %35
  br i1 %36, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %37 = call %LLVM_Value (%LLVM_Value, %Type*) @func317 (%LLVM_Value %3, %Type* %4)
  br label %select_1_end
select_1_1:
  %38 = getelementptr inbounds %Type, %Type* %4, i1 0, i32 0
  %39 = load %TypeKind, %TypeKind* %38
  %40 = icmp eq %TypeKind %39, 9
  %41 = icmp eq i1 1, %40
  br i1 %41, label %select_1_1_ok, label %select_1_2
select_1_1_ok:
  %42 = call %LLVM_Value (%LLVM_Value, %Type*) @func318 (%LLVM_Value %3, %Type* %4)
  br label %select_1_end
select_1_2:
  %43 = getelementptr inbounds %Type, %Type* %4, i1 0, i32 0
  %44 = load %TypeKind, %TypeKind* %43
  %45 = icmp eq %TypeKind %44, 5
  %46 = icmp eq i1 1, %45
  br i1 %46, label %select_1_2_ok, label %select_1_3
select_1_2_ok:
  %47 = call %LLVM_Value (%LLVM_Value, %Type*) @func322 (%LLVM_Value %3, %Type* %4)
  br label %select_1_end
select_1_3:
  %48 = getelementptr inbounds %Type, %Type* %4, i1 0, i32 0
  %49 = load %TypeKind, %TypeKind* %48
  %50 = icmp eq %TypeKind %49, 16
  %51 = icmp eq i1 1, %50
  br i1 %51, label %select_1_3_ok, label %select_1_4
select_1_3_ok:
  %52 = call %LLVM_Value (%LLVM_Value, %Type*) @eval_cast_to_union (%LLVM_Value %3, %Type* %4)
  br label %select_1_end
select_1_4:
  %53 = load %Type*, %Type** @typeUnit
  %54 = call i1 (%Type*, %Type*) @func445 (%Type* %4, %Type* %53)
  %55 = icmp eq i1 1, %54
  br i1 %55, label %select_1_4_ok, label %select_1_5
select_1_4_ok:
  %56 = insertvalue %LLVM_Value zeroinitializer, %LLVM_ValueKind 3, 0
  %57 = insertvalue %LLVM_Value %56, %Type* %4, 1
  br label %select_1_end
select_1_5:
  %58 = call %LLVM_Value (%LLVM_Value, %Type*) @func329 (%LLVM_Value %3, %Type* %4)
  br label %select_1_end
select_1_end:
  %59 = phi %LLVM_Value [ %37, %select_1_0_ok ], [ %42, %select_1_1_ok ], [ %47, %select_1_2_ok ], [ %52, %select_1_3_ok ], [ %57, %select_1_4_ok ], [ %58, %select_1_5 ]
  ret %LLVM_Value %59
}

define %LLVM_Value @eval_binary (%Str, %Value*, %Value*, %Type*) {
  %5 = call %LLVM_Value (%Value*) @func298 (%Value* %1)
  %6 = call %LLVM_Value (%Value*) @func298 (%Value* %2)
  %7 = call %Nat32 (%Str, %LLVM_Value, %LLVM_Value) @func292 (%Str %0, %LLVM_Value %5, %LLVM_Value %6)
  %8 = insertvalue %LLVM_Value zeroinitializer, %LLVM_ValueKind 9, 0
  %9 = insertvalue %LLVM_Value %8, %Type* %3, 1
  %10 = insertvalue %LLVM_Value %9, %Nat32 %7, 4
  ret %LLVM_Value %10
}

define %LLVM_Value @eval_binary_su (%Str, %Str, %Value*, %Value*, %Type*) {
  %6 = call %LLVM_Value (%Value*) @func298 (%Value* %2)
  %7 = call %LLVM_Value (%Value*) @func298 (%Value* %3)
  %8 = call %Nat32 (%Str, %Str, %LLVM_Value, %LLVM_Value) @llvm_binary_su (%Str %0, %Str %1, %LLVM_Value %6, %LLVM_Value %7)
  %9 = insertvalue %LLVM_Value zeroinitializer, %LLVM_ValueKind 9, 0
  %10 = insertvalue %LLVM_Value %9, %Type* %4, 1
  %11 = insertvalue %LLVM_Value %10, %Nat32 %8, 4
  ret %LLVM_Value %11
}

define %LLVM_Value @func332 (%ValueBin) {
  %2 = bitcast [4 x %Nat8]* @func332_str1 to %Str
  %3 = extractvalue %ValueBin %0, 1
  %4 = extractvalue %ValueBin %0, 2
  %5 = extractvalue %ValueBin %0, 0
  %6 = call %LLVM_Value (%Str, %Value*, %Value*, %Type*) @eval_binary (%Str %2, %Value* %3, %Value* %4, %Type* %5)
  ret %LLVM_Value %6
}

define %LLVM_Value @func333 (%ValueBin) {
  %2 = bitcast [4 x %Nat8]* @func333_str1 to %Str
  %3 = extractvalue %ValueBin %0, 1
  %4 = extractvalue %ValueBin %0, 2
  %5 = extractvalue %ValueBin %0, 0
  %6 = call %LLVM_Value (%Str, %Value*, %Value*, %Type*) @eval_binary (%Str %2, %Value* %3, %Value* %4, %Type* %5)
  ret %LLVM_Value %6
}

define %LLVM_Value @func334 (%ValueBin) {
  %2 = bitcast [4 x %Nat8]* @func334_str1 to %Str
  %3 = extractvalue %ValueBin %0, 1
  %4 = extractvalue %ValueBin %0, 2
  %5 = extractvalue %ValueBin %0, 0
  %6 = call %LLVM_Value (%Str, %Value*, %Value*, %Type*) @eval_binary (%Str %2, %Value* %3, %Value* %4, %Type* %5)
  ret %LLVM_Value %6
}

define %LLVM_Value @func335 (%ValueBin) {
  %2 = bitcast [5 x %Nat8]* @func335_str1 to %Str
  %3 = bitcast [5 x %Nat8]* @func335_str2 to %Str
  %4 = extractvalue %ValueBin %0, 1
  %5 = extractvalue %ValueBin %0, 2
  %6 = extractvalue %ValueBin %0, 0
  %7 = call %LLVM_Value (%Str, %Str, %Value*, %Value*, %Type*) @eval_binary_su (%Str %2, %Str %3, %Value* %4, %Value* %5, %Type* %6)
  ret %LLVM_Value %7
}

define %LLVM_Value @func336 (%ValueBin) {
  %2 = bitcast [5 x %Nat8]* @func336_str1 to %Str
  %3 = bitcast [5 x %Nat8]* @func336_str2 to %Str
  %4 = extractvalue %ValueBin %0, 1
  %5 = extractvalue %ValueBin %0, 2
  %6 = extractvalue %ValueBin %0, 0
  %7 = call %LLVM_Value (%Str, %Str, %Value*, %Value*, %Type*) @eval_binary_su (%Str %2, %Str %3, %Value* %4, %Value* %5, %Type* %6)
  ret %LLVM_Value %7
}

define %LLVM_Value @func337 (%ValueBin) {
  %2 = bitcast [3 x %Nat8]* @func337_str1 to %Str
  %3 = extractvalue %ValueBin %0, 1
  %4 = extractvalue %ValueBin %0, 2
  %5 = extractvalue %ValueBin %0, 0
  %6 = call %LLVM_Value (%Str, %Value*, %Value*, %Type*) @eval_binary (%Str %2, %Value* %3, %Value* %4, %Type* %5)
  ret %LLVM_Value %6
}

define %LLVM_Value @func338 (%ValueBin) {
  %2 = bitcast [4 x %Nat8]* @func338_str1 to %Str
  %3 = extractvalue %ValueBin %0, 1
  %4 = extractvalue %ValueBin %0, 2
  %5 = extractvalue %ValueBin %0, 0
  %6 = call %LLVM_Value (%Str, %Value*, %Value*, %Type*) @eval_binary (%Str %2, %Value* %3, %Value* %4, %Type* %5)
  ret %LLVM_Value %6
}

define %LLVM_Value @func339 (%ValueBin) {
  %2 = bitcast [4 x %Nat8]* @func339_str1 to %Str
  %3 = extractvalue %ValueBin %0, 1
  %4 = extractvalue %ValueBin %0, 2
  %5 = extractvalue %ValueBin %0, 0
  %6 = call %LLVM_Value (%Str, %Value*, %Value*, %Type*) @eval_binary (%Str %2, %Value* %3, %Value* %4, %Type* %5)
  ret %LLVM_Value %6
}

define %LLVM_Value @func340 (%ValueBin) {
  %2 = bitcast [8 x %Nat8]* @func340_str1 to %Str
  %3 = extractvalue %ValueBin %0, 1
  %4 = extractvalue %ValueBin %0, 2
  %5 = extractvalue %ValueBin %0, 0
  %6 = call %LLVM_Value (%Str, %Value*, %Value*, %Type*) @eval_binary (%Str %2, %Value* %3, %Value* %4, %Type* %5)
  ret %LLVM_Value %6
}

define %LLVM_Value @func341 (%ValueBin) {
  %2 = bitcast [8 x %Nat8]* @func341_str1 to %Str
  %3 = extractvalue %ValueBin %0, 1
  %4 = extractvalue %ValueBin %0, 2
  %5 = extractvalue %ValueBin %0, 0
  %6 = call %LLVM_Value (%Str, %Value*, %Value*, %Type*) @eval_binary (%Str %2, %Value* %3, %Value* %4, %Type* %5)
  ret %LLVM_Value %6
}

define %LLVM_Value @func342 (%ValueBin) {
  %2 = bitcast [9 x %Nat8]* @func342_str1 to %Str
  %3 = bitcast [9 x %Nat8]* @func342_str2 to %Str
  %4 = extractvalue %ValueBin %0, 1
  %5 = extractvalue %ValueBin %0, 2
  %6 = extractvalue %ValueBin %0, 0
  %7 = call %LLVM_Value (%Str, %Str, %Value*, %Value*, %Type*) @eval_binary_su (%Str %2, %Str %3, %Value* %4, %Value* %5, %Type* %6)
  ret %LLVM_Value %7
}

define %LLVM_Value @func343 (%ValueBin) {
  %2 = bitcast [9 x %Nat8]* @func343_str1 to %Str
  %3 = bitcast [9 x %Nat8]* @func343_str2 to %Str
  %4 = extractvalue %ValueBin %0, 1
  %5 = extractvalue %ValueBin %0, 2
  %6 = extractvalue %ValueBin %0, 0
  %7 = call %LLVM_Value (%Str, %Str, %Value*, %Value*, %Type*) @eval_binary_su (%Str %2, %Str %3, %Value* %4, %Value* %5, %Type* %6)
  ret %LLVM_Value %7
}

define %LLVM_Value @func344 (%ValueBin) {
  %2 = bitcast [9 x %Nat8]* @func344_str1 to %Str
  %3 = bitcast [9 x %Nat8]* @func344_str2 to %Str
  %4 = extractvalue %ValueBin %0, 1
  %5 = extractvalue %ValueBin %0, 2
  %6 = extractvalue %ValueBin %0, 0
  %7 = call %LLVM_Value (%Str, %Str, %Value*, %Value*, %Type*) @eval_binary_su (%Str %2, %Str %3, %Value* %4, %Value* %5, %Type* %6)
  ret %LLVM_Value %7
}

define %LLVM_Value @func345 (%ValueBin) {
  %2 = bitcast [9 x %Nat8]* @func345_str1 to %Str
  %3 = bitcast [9 x %Nat8]* @func345_str2 to %Str
  %4 = extractvalue %ValueBin %0, 1
  %5 = extractvalue %ValueBin %0, 2
  %6 = extractvalue %ValueBin %0, 0
  %7 = call %LLVM_Value (%Str, %Str, %Value*, %Value*, %Type*) @eval_binary_su (%Str %2, %Str %3, %Value* %4, %Value* %5, %Type* %6)
  ret %LLVM_Value %7
}

define %LLVM_Value @func346 (%ValueBin) {
  %2 = bitcast [4 x %Nat8]* @func346_str1 to %Str
  %3 = extractvalue %ValueBin %0, 1
  %4 = extractvalue %ValueBin %0, 2
  %5 = extractvalue %ValueBin %0, 0
  %6 = call %LLVM_Value (%Str, %Value*, %Value*, %Type*) @eval_binary (%Str %2, %Value* %3, %Value* %4, %Type* %5)
  ret %LLVM_Value %6
}

define %LLVM_Value @func347 (%ValueBin) {
  %2 = bitcast [5 x %Nat8]* @func347_str1 to %Str
  %3 = bitcast [5 x %Nat8]* @func347_str2 to %Str
  %4 = extractvalue %ValueBin %0, 1
  %5 = extractvalue %ValueBin %0, 2
  %6 = extractvalue %ValueBin %0, 0
  %7 = call %LLVM_Value (%Str, %Str, %Value*, %Value*, %Type*) @eval_binary_su (%Str %2, %Str %3, %Value* %4, %Value* %5, %Type* %6)
  ret %LLVM_Value %7
}

define %LLVM_Value @func348 (%LLVM_Value, %Type*) {
  %3 = bitcast [8 x %Nat8]* @func348_str1 to %Str
  %4 = extractvalue %LLVM_Value %0, 1
  %5 = call %LLVM_Value (%Str, %LLVM_Value, %Type*) @func316 (%Str %3, %LLVM_Value %0, %Type* %4)
  ret %LLVM_Value %5
}

define %LLVM_Value @loadImmPtr (%LLVM_Value) {
  %2 = bitcast [13 x %Nat8]* @func349_str1 to %Str
  call void (%Str) @o (%Str %2)
  %3 = call %Nat32 () @lab_get ()
  %4 = load %FILE*, %FILE** @fout
  %5 = bitcast [29 x %Nat8]* @func349_str2 to %Str
  %6 = extractvalue %LLVM_Value %0, 2
  %7 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %4, %Str %5, %Nat32 %3, %Int64 %6)
  %8 = extractvalue %LLVM_Value %0, 1
  call void (%Type*) @func381 (%Type* %8)
  %9 = insertvalue %LLVM_Value zeroinitializer, %LLVM_ValueKind 9, 0
  %10 = extractvalue %LLVM_Value %0, 1
  %11 = insertvalue %LLVM_Value %9, %Type* %10, 1
  %12 = insertvalue %LLVM_Value %11, %Nat32 %3, 4
  ret %LLVM_Value %12
}

define %LLVM_Value @loadIfImmAs (%LLVM_Value, %Type*) {
  %3 = extractvalue %LLVM_Value %0, 0
  br label %select_1_0
select_1_0:
  %4 = icmp eq %LLVM_ValueKind %3, 4
  br i1 %4, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %5 = bitcast [8 x %Nat8]* @func350_str1 to %Str
  %6 = call %LLVM_Value (%Str, %LLVM_Value, %Type*) @func316 (%Str %5, %LLVM_Value %0, %Type* %1)
  br label %select_1_end
select_1_1:
  br label %select_1_end
select_1_end:
  %7 = phi %LLVM_Value [ %6, %select_1_0_ok ], [ %0, %select_1_1 ]
  ret %LLVM_Value %7
}

define void @func352 (%Unit*, %Unit*, %Nat32, %Node*) {
  %5 = bitcast %Unit* %0 to %ValueWhenVariant*
  %6 = bitcast %Unit* %1 to %func351.type2*
  %7 = load %FILE*, %FILE** @fout
  %8 = bitcast [15 x %Nat8]* @func351_func352_str1 to %Str
  %9 = getelementptr inbounds %func351.type2, %func351.type2* %6, i1 0, i32 2
  %10 = load %Nat32, %Nat32* %9
  %11 = getelementptr inbounds %func351.type2, %func351.type2* %6, i1 0, i32 3
  %12 = load %Nat32, %Nat32* %11
  %13 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %7, %Str %8, %Nat32 %10, %Nat32 %12)
  %14 = getelementptr inbounds %ValueWhenVariant, %ValueWhenVariant* %5, i1 0, i32 1
  %15 = load %Value*, %Value** %14; loadImmPtr
  %16 = inttoptr i64 0 to%Value*
  %17 = icmp ne %Value* %15, %16
  br i1 %17, label %then_0, label %else_0
then_0:
  %18 = getelementptr inbounds %ValueWhenVariant, %ValueWhenVariant* %5, i1 0, i32 1
  %19 = load %Value*, %Value** %18
  %20 = call %LLVM_Value (%Value*) @func298 (%Value* %19)
  %21 = bitcast [8 x %Nat8]* @func351_func352_str2 to %Str
  %22 = getelementptr inbounds %func351.type2, %func351.type2* %6, i1 0, i32 0
  %23 = load %LLVM_Value, %LLVM_Value* %22
  %24 = call %Nat32 (%Str, %LLVM_Value, %LLVM_Value) @func292 (%Str %21, %LLVM_Value %23, %LLVM_Value %20)
  %25 = load %FILE*, %FILE** @fout
  %26 = bitcast [14 x %Nat8]* @func351_func352_str3 to %Str
  %27 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %25, %Str %26, %Nat32 %24)
  br label %endif_0
else_0:
  %28 = call %Type* (%Nat32) @func449 (%Nat32 2)
  %29 = insertvalue %LLVM_Value zeroinitializer, %LLVM_ValueKind 4, 0
  %30 = insertvalue %LLVM_Value %29, %Type* %28, 1
  %31 = getelementptr inbounds %ValueWhenVariant, %ValueWhenVariant* %5, i1 0, i32 3
  %32 = load %Nat32, %Nat32* %31
  %33 = sext %Nat32 %32 to %Int64
  %34 = insertvalue %LLVM_Value %30, %Int64 %33, 2
  %35 = call %LLVM_Value (%LLVM_Value, %Type*) @func348 (%LLVM_Value %34, %Type* %28)
  %36 = bitcast [8 x %Nat8]* @func351_func352_str4 to %Str
  %37 = getelementptr inbounds %func351.type2, %func351.type2* %6, i1 0, i32 1
  %38 = load %LLVM_Value, %LLVM_Value* %37
  %39 = call %Nat32 (%Str, %LLVM_Value, %LLVM_Value) @func292 (%Str %36, %LLVM_Value %38, %LLVM_Value %35)
  %40 = load %FILE*, %FILE** @fout
  %41 = bitcast [14 x %Nat8]* @func351_func352_str5 to %Str
  %42 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %40, %Str %41, %Nat32 %39)
  br label %endif_0
endif_0:
  %43 = load %FILE*, %FILE** @fout
  %44 = bitcast [48 x %Nat8]* @func351_func352_str6 to %Str
  %45 = getelementptr inbounds %func351.type2, %func351.type2* %6, i1 0, i32 2
  %46 = load %Nat32, %Nat32* %45
  %47 = getelementptr inbounds %func351.type2, %func351.type2* %6, i1 0, i32 3
  %48 = load %Nat32, %Nat32* %47
  %49 = getelementptr inbounds %func351.type2, %func351.type2* %6, i1 0, i32 2
  %50 = load %Nat32, %Nat32* %49
  %51 = getelementptr inbounds %func351.type2, %func351.type2* %6, i1 0, i32 3
  %52 = load %Nat32, %Nat32* %51
  %53 = add %Nat32 %52, 1
  %54 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %43, %Str %44, %Nat32 %46, %Nat32 %48, %Nat32 %50, %Nat32 %53)
  %55 = load %FILE*, %FILE** @fout
  %56 = bitcast [18 x %Nat8]* @func351_func352_str7 to %Str
  %57 = getelementptr inbounds %func351.type2, %func351.type2* %6, i1 0, i32 2
  %58 = load %Nat32, %Nat32* %57
  %59 = getelementptr inbounds %func351.type2, %func351.type2* %6, i1 0, i32 3
  %60 = load %Nat32, %Nat32* %59
  %61 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %55, %Str %56, %Nat32 %58, %Nat32 %60)
  %62 = getelementptr inbounds %ValueWhenVariant, %ValueWhenVariant* %5, i1 0, i32 2
  %63 = load %Value*, %Value** %62
  %64 = call %LLVM_Value (%Value*) @func298 (%Value* %63)
  %65 = getelementptr inbounds %func351.type2, %func351.type2* %6, i1 0, i32 5
  %66 = load %Type*, %Type** %65
  %67 = call %LLVM_Value (%LLVM_Value, %Type*) @loadIfImmAs (%LLVM_Value %64, %Type* %66)
  %68 = load %FILE*, %FILE** @fout
  %69 = bitcast [28 x %Nat8]* @func351_func352_str8 to %Str
  %70 = getelementptr inbounds %func351.type2, %func351.type2* %6, i1 0, i32 2
  %71 = load %Nat32, %Nat32* %70
  %72 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %68, %Str %69, %Nat32 %71)
  %73 = getelementptr inbounds %func351.type2, %func351.type2* %6, i1 0, i32 4
; index array
  %74 = getelementptr inbounds [256 x %Nat32], [256 x %Nat32]* %73, i1 0, %Nat32 %2
  %75 = extractvalue %LLVM_Value %67, 4
  store %Nat32 %75, %Nat32* %74, align 4
  %76 = getelementptr inbounds %func351.type2, %func351.type2* %6, i1 0, i32 3
  %77 = getelementptr inbounds %func351.type2, %func351.type2* %6, i1 0, i32 3
  %78 = load %Nat32, %Nat32* %77
  %79 = add %Nat32 %78, 1
  store %Nat32 %79, %Nat32* %76, align 4
  ret void
}

define %LLVM_Value @func351 (%ValueWhen) {
  %2 = extractvalue %ValueWhen %0, 2
  %3 = call %LLVM_Value (%Value*) @func298 (%Value* %2)
  %4 = alloca %LLVM_Value
  store %LLVM_Value zeroinitializer, %LLVM_Value* %4, align 8
  %5 = extractvalue %ValueWhen %0, 1
  br i1 %5, label %then_0, label %else_0
then_0:
  %6 = call %Nat32 () @lab_get ()
  %7 = load %FILE*, %FILE** @fout
  %8 = bitcast [29 x %Nat8]* @func351_str1 to %Str
  %9 = extractvalue %LLVM_Value %3, 1
  %10 = getelementptr inbounds %Type, %Type* %9, i1 0, i32 2
  %11 = load %Str, %Str* %10
  %12 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %7, %Str %8, %Nat32 %6, %Str %11)
  call void (%LLVM_Value) @func361 (%LLVM_Value %3)
  %13 = bitcast [4 x %Nat8]* @func351_str2 to %Str
  call void (%Str) @o (%Str %13)
  %14 = call %Type* (%Nat32) @func449 (%Nat32 2)
  %15 = insertvalue %LLVM_Value zeroinitializer, %LLVM_ValueKind 9, 0
  %16 = insertvalue %LLVM_Value %15, %Type* %14, 1
  %17 = insertvalue %LLVM_Value %16, %Nat32 %6, 4
  store %LLVM_Value %17, %LLVM_Value* %4, align 8
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %18 = load %Nat32, %Nat32* @select_no
  %19 = add %Nat32 %18, 1
  store %Nat32 %19, %Nat32* @select_no, align 4
  %20 = load %Nat32, %Nat32* @select_no
  %21 = extractvalue %ValueWhen %0, 3
  %22 = extractvalue %List %21, 2
  %23 = extractvalue %ValueWhen %0, 0
  %24 = alloca %func351.type2
  %25 = insertvalue %func351.type2 zeroinitializer, %LLVM_Value %3, 0
  %26 = load %LLVM_Value, %LLVM_Value* %4
  %27 = insertvalue %func351.type2 %25, %LLVM_Value %26, 1
  %28 = insertvalue %func351.type2 %27, %Nat32 0, 3
  %29 = insertvalue %func351.type2 %28, %Nat32 %20, 2
  %30 = insertvalue %func351.type2 %29, %Type* %23, 5
  store %func351.type2 %30, %func351.type2* %24, align 8
  %31 = load %FILE*, %FILE** @fout
  %32 = bitcast [26 x %Nat8]* @func351_str3 to %Str
  %33 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %31, %Str %32, %Nat32 %20)
  %34 = alloca %List
  %35 = extractvalue %ValueWhen %0, 3
  store %List %35, %List* %34, align 8
  %36 = getelementptr inbounds %List, %List* %34, i1 0
  %37 = getelementptr inbounds %func351.type2, %func351.type2* %24, i1 0
  %38 = bitcast %func351.type2* %37 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @func64 (%List* %36, %ListForeachHandler @func352, %Unit* %38)
  %39 = load %FILE*, %FILE** @fout
  %40 = bitcast [15 x %Nat8]* @func351_str4 to %Str
  %41 = getelementptr inbounds %func351.type2, %func351.type2* %24, i1 0, i32 3
  %42 = load %Nat32, %Nat32* %41
  %43 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %39, %Str %40, %Nat32 %20, %Nat32 %42)
  %44 = extractvalue %ValueWhen %0, 4
  %45 = call %LLVM_Value (%Value*) @func298 (%Value* %44)
  %46 = getelementptr inbounds %func351.type2, %func351.type2* %24, i1 0, i32 5
  %47 = load %Type*, %Type** %46
  %48 = call %LLVM_Value (%LLVM_Value, %Type*) @loadIfImmAs (%LLVM_Value %45, %Type* %47)
  %49 = load %FILE*, %FILE** @fout
  %50 = bitcast [28 x %Nat8]* @func351_str5 to %Str
  %51 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %49, %Str %50, %Nat32 %20)
  %52 = load %FILE*, %FILE** @fout
  %53 = bitcast [16 x %Nat8]* @func351_str6 to %Str
  %54 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %52, %Str %53, %Nat32 %20)
  %55 = load %Type*, %Type** @typeUnit
  %56 = call i1 (%Type*, %Type*) @func445 (%Type* %23, %Type* %55)
  %57 = xor i1 %56, 1
  br i1 %57, label %then_1, label %else_1
then_1:
  %58 = bitcast [4 x %Nat8]* @func351_str7 to %Str
  %59 = call %Nat32 (%Str, %Type*) @func289 (%Str %58, %Type* %23)
  call void () @space ()
  %60 = alloca %Nat64
  store %Nat64 0, %Nat64* %60, align 8
  br label %again_0
again_0:
  %61 = load %Nat64, %Nat64* %60
  %62 = icmp ult %Nat64 %61, %22
  br i1 %62, label %body_0, label %break_0
body_0:
  %63 = load %FILE*, %FILE** @fout
  %64 = bitcast [30 x %Nat8]* @func351_str8 to %Str
  %65 = getelementptr inbounds %func351.type2, %func351.type2* %24, i1 0, i32 4
  %66 = load %Nat64, %Nat64* %60
; index array
  %67 = getelementptr inbounds [256 x %Nat32], [256 x %Nat32]* %65, i1 0, %Nat64 %66
  %68 = load %Nat32, %Nat32* %67
  %69 = load %Nat64, %Nat64* %60
  %70 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %63, %Str %64, %Nat32 %68, %Nat32 %20, %Nat64 %69)
  %71 = load %Nat64, %Nat64* %60
  %72 = add %Nat64 %71, 1
  store %Nat64 %72, %Nat64* %60, align 8
  br label %again_0
break_0:
  %73 = load %FILE*, %FILE** @fout
  %74 = bitcast [25 x %Nat8]* @func351_str9 to %Str
  %75 = extractvalue %LLVM_Value %48, 4
  %76 = getelementptr inbounds %func351.type2, %func351.type2* %24, i1 0, i32 3
  %77 = load %Nat32, %Nat32* %76
  %78 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %73, %Str %74, %Nat32 %75, %Nat32 %20, %Nat32 %77)
  %79 = insertvalue %LLVM_Value zeroinitializer, %LLVM_ValueKind 9, 0
  %80 = extractvalue %ValueWhen %0, 0
  %81 = insertvalue %LLVM_Value %79, %Type* %80, 1
  %82 = insertvalue %LLVM_Value %81, %Nat32 %59, 4
  ret %LLVM_Value %82
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  %84 = insertvalue %LLVM_Value zeroinitializer, %LLVM_ValueKind 0, 0
  %85 = extractvalue %ValueWhen %0, 0
  %86 = insertvalue %LLVM_Value %84, %Type* %85, 1
  ret %LLVM_Value %86
}

define void @func354 (%Unit*, %Unit*, %Unit*) {
  %4 = bitcast %Unit* %0 to %Str
  %5 = bitcast %Unit* %1 to %Value*
  %6 = bitcast %Unit* %2 to %func353.type3*
  %7 = call %LLVM_Value (%Value*) @func298 (%Value* %5)
  %8 = getelementptr inbounds %func353.type3, %func353.type3* %6, i1 0, i32 0
  %9 = load %Type*, %Type** %8
  %10 = call %Decl* (%Type*, %Str) @func401 (%Type* %9, %Str %4)
  %11 = getelementptr inbounds %Decl, %Decl* %10, i1 0, i32 3
  %12 = load %Nat16, %Nat16* %11
  %13 = bitcast [12 x %Nat8]* @func353_func354_str1 to %Str
  %14 = getelementptr inbounds %func353.type3, %func353.type3* %6, i1 0, i32 0
  %15 = load %Type*, %Type** %14
  %16 = call %Nat32 (%Str, %Type*) @func289 (%Str %13, %Type* %15)
  call void () @space ()
  %17 = getelementptr inbounds %func353.type3, %func353.type3* %6, i1 0, i32 1
  %18 = load %LLVM_Value, %LLVM_Value* %17
  call void (%LLVM_Value) @func361 (%LLVM_Value %18)
  call void () @comma ()
  call void (%LLVM_Value) @func362 (%LLVM_Value %7)
  call void () @comma ()
  %19 = load %FILE*, %FILE** @fout
  %20 = bitcast [3 x %Nat8]* @func353_func354_str2 to %Str
  %21 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %19, %Str %20, %Nat16 %12)
  %22 = getelementptr inbounds %func353.type3, %func353.type3* %6, i1 0, i32 1
  %23 = insertvalue %LLVM_Value zeroinitializer, %LLVM_ValueKind 9, 0
  %24 = getelementptr inbounds %func353.type3, %func353.type3* %6, i1 0, i32 0
  %25 = load %Type*, %Type** %24
  %26 = insertvalue %LLVM_Value %23, %Type* %25, 1
  %27 = insertvalue %LLVM_Value %26, %Nat32 %16, 4
  store %LLVM_Value %27, %LLVM_Value* %22, align 8
  ret void
}

define %LLVM_Value @func353 (%ValueRecord) {
  %2 = alloca %func353.type3
  %3 = extractvalue %ValueRecord %0, 0
  %4 = insertvalue %func353.type3 zeroinitializer, %Type* %3, 0
  %5 = insertvalue %LLVM_Value zeroinitializer, %LLVM_ValueKind 2, 0
  %6 = insertvalue %func353.type3 %4, %LLVM_Value %5, 1
  store %func353.type3 %6, %func353.type3* %2, align 8
  %7 = alloca %List
  %8 = extractvalue %ValueRecord %0, 1
  store %List %8, %List* %7, align 8
  %9 = getelementptr inbounds %List, %List* %7, i1 0
  %10 = getelementptr inbounds %func353.type3, %func353.type3* %2, i1 0
  %11 = bitcast %func353.type3* %10 to %Unit*
  call void (%List*, %MapForeachHandler, %Unit*) @map_foreach (%List* %9, %MapForeachHandler @func354, %Unit* %11)
  %12 = getelementptr inbounds %func353.type3, %func353.type3* %2, i1 0, i32 1
  %13 = load %LLVM_Value, %LLVM_Value* %12
  ret %LLVM_Value %13
}

define void @func356 (%Unit*, %Unit*, %Nat32, %Node*) {
  %5 = bitcast %Unit* %0 to %Value*
  %6 = bitcast %Unit* %1 to %func355.type4*
  %7 = call %LLVM_Value (%Value*) @func298 (%Value* %5)
  %8 = bitcast [12 x %Nat8]* @func355_func356_str1 to %Str
  %9 = getelementptr inbounds %func355.type4, %func355.type4* %6, i1 0, i32 0
  %10 = load %Type*, %Type** %9
  %11 = call %Nat32 (%Str, %Type*) @func289 (%Str %8, %Type* %10)
  call void () @space ()
  %12 = getelementptr inbounds %func355.type4, %func355.type4* %6, i1 0, i32 1
  %13 = load %LLVM_Value, %LLVM_Value* %12
  call void (%LLVM_Value) @func361 (%LLVM_Value %13)
  call void () @comma ()
  call void (%LLVM_Value) @func362 (%LLVM_Value %7)
  call void () @comma ()
  %14 = load %FILE*, %FILE** @fout
  %15 = bitcast [3 x %Nat8]* @func355_func356_str2 to %Str
  %16 = getelementptr inbounds %func355.type4, %func355.type4* %6, i1 0, i32 2
  %17 = load %Nat32, %Nat32* %16
  %18 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %14, %Str %15, %Nat32 %17)
  %19 = getelementptr inbounds %func355.type4, %func355.type4* %6, i1 0, i32 1
  %20 = insertvalue %LLVM_Value zeroinitializer, %LLVM_ValueKind 9, 0
  %21 = getelementptr inbounds %func355.type4, %func355.type4* %6, i1 0, i32 0
  %22 = load %Type*, %Type** %21
  %23 = insertvalue %LLVM_Value %20, %Type* %22, 1
  %24 = insertvalue %LLVM_Value %23, %Nat32 %11, 4
  store %LLVM_Value %24, %LLVM_Value* %19, align 8
  %25 = getelementptr inbounds %func355.type4, %func355.type4* %6, i1 0, i32 2
  %26 = getelementptr inbounds %func355.type4, %func355.type4* %6, i1 0, i32 2
  %27 = load %Nat32, %Nat32* %26
  %28 = add %Nat32 %27, 1
  store %Nat32 %28, %Nat32* %25, align 4
  ret void
}

define %LLVM_Value @func355 (%ValueArray) {
  %2 = alloca %func355.type4
  %3 = extractvalue %ValueArray %0, 0
  %4 = insertvalue %func355.type4 zeroinitializer, %Type* %3, 0
  %5 = insertvalue %LLVM_Value zeroinitializer, %LLVM_ValueKind 2, 0
  %6 = insertvalue %func355.type4 %4, %LLVM_Value %5, 1
  %7 = insertvalue %func355.type4 %6, %Nat32 0, 2
  store %func355.type4 %7, %func355.type4* %2, align 8
  %8 = alloca %List
  %9 = extractvalue %ValueArray %0, 1
  store %List %9, %List* %8, align 8
  %10 = getelementptr inbounds %List, %List* %8, i1 0
  %11 = getelementptr inbounds %func355.type4, %func355.type4* %2, i1 0
  %12 = bitcast %func355.type4* %11 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @func64 (%List* %10, %ListForeachHandler @func356, %Unit* %12)
  %13 = getelementptr inbounds %func355.type4, %func355.type4* %2, i1 0, i32 1
  %14 = load %LLVM_Value, %LLVM_Value* %13
  ret %LLVM_Value %14
}

define void @func357 (%Value*, %Value*) {
  %3 = call %LLVM_Value (%Value*) @func296 (%Value* %0)
  %4 = call %LLVM_Value (%Value*) @func298 (%Value* %1)
  call void (%LLVM_Value, %LLVM_Value) @func358 (%LLVM_Value %3, %LLVM_Value %4)
  ret void
}

define void @func358 (%LLVM_Value, %LLVM_Value) {
  %3 = extractvalue %LLVM_Value %1, 1
  %4 = load %FILE*, %FILE** @fout
  %5 = bitcast [10 x %Nat8]* @func358_str1 to %Str
  %6 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %4, %Str %5)
  call void (%Type*) @func381 (%Type* %3)
  call void () @space ()
  call void (%LLVM_Value) @func361 (%LLVM_Value %1)
  call void () @comma ()
  call void (%Type*) @func381 (%Type* %3)
  %7 = bitcast [3 x %Nat8]* @func358_str2 to %Str
  call void (%Str) @o (%Str %7)
  call void (%LLVM_Value) @func361 (%LLVM_Value %0)
  %8 = load %FILE*, %FILE** @fout
  %9 = bitcast [11 x %Nat8]* @func358_str3 to %Str
  %10 = getelementptr inbounds %Type, %Type* %3, i1 0, i32 4
  %11 = load %Nat32, %Nat32* %10
  %12 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %8, %Str %9, %Nat32 %11)
  ret void
}

define %LLVM_Value @func359 (%LLVM_Value) {
  %2 = extractvalue %LLVM_Value %0, 0
  %3 = icmp eq %LLVM_ValueKind %2, 0
  br i1 %3, label %then_0, label %else_0
then_0:
  ret %LLVM_Value %0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %5 = icmp eq %LLVM_ValueKind %2, 4
  br i1 %5, label %then_1, label %else_1
then_1:
  %6 = extractvalue %LLVM_Value %0, 1
  %7 = call i1 (%Type*) @func403 (%Type* %6)
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
  %12 = icmp ne %LLVM_ValueKind %2, 6
  %13 = icmp ne %LLVM_ValueKind %2, 7
  %14 = icmp ne %LLVM_ValueKind %2, 8
  %15 = and i1 %13, %14
  %16 = and i1 %12, %15
  br i1 %16, label %then_2, label %else_2
then_2:
  ret %LLVM_Value %0
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
  %18 = extractvalue %LLVM_Value %0, 1
  %19 = bitcast [5 x %Nat8]* @func359_str1 to %Str
  %20 = call %Nat32 (%Str, %Type*) @func289 (%Str %19, %Type* %18)
  call void () @comma ()
  call void (%Type*) @func381 (%Type* %18)
  %21 = bitcast [3 x %Nat8]* @func359_str2 to %Str
  call void (%Str) @o (%Str %21)
  call void (%LLVM_Value) @func361 (%LLVM_Value %0)
  %22 = insertvalue %LLVM_Value zeroinitializer, %LLVM_ValueKind 9, 0
  %23 = insertvalue %LLVM_Value %22, %Type* %18, 1
  %24 = insertvalue %LLVM_Value %23, %Nat32 %20, 4
  ret %LLVM_Value %24
}

define %Int32 @print_val_imm (%LLVM_Value) {
  %2 = extractvalue %LLVM_Value %0, 1
  %3 = call i1 (%Type*) @func403 (%Type* %2)
  %4 = getelementptr inbounds %Type, %Type* %2, i1 0, i32 0
  %5 = load %TypeKind, %TypeKind* %4
  %6 = icmp eq %TypeKind %5, 12
  %7 = getelementptr inbounds %Type, %Type* %2, i1 0, i32 0
  %8 = load %TypeKind, %TypeKind* %7
  %9 = icmp eq %TypeKind %8, 14
  %10 = or i1 %6, %9
  %11 = or i1 %3, %10
  %12 = getelementptr inbounds %Type, %Type* %2, i1 0, i32 0
  %13 = load %TypeKind, %TypeKind* %12
  %14 = icmp eq %TypeKind %13, 8
  br i1 %14, label %then_0, label %else_0
then_0:
  %15 = getelementptr inbounds %Type, %Type* %2, i1 0, i32 13
  %16 = getelementptr inbounds %TypeVar, %TypeVar* %15, i1 0, i32 0
  %17 = load %Type*, %Type** %16
  %18 = call i1 (%Type*) @func403 (%Type* %17)
  %19 = getelementptr inbounds %Type, %Type* %17, i1 0, i32 0
  %20 = load %TypeKind, %TypeKind* %19
  %21 = icmp eq %TypeKind %20, 12
  %22 = getelementptr inbounds %Type, %Type* %17, i1 0, i32 0
  %23 = load %TypeKind, %TypeKind* %22
  %24 = icmp eq %TypeKind %23, 14
  %25 = or i1 %21, %24
  %26 = or i1 %18, %25
  br i1 %26, label %then_1, label %else_1
then_1:
  %27 = bitcast [16 x %Nat8]* @func360_str1 to %Str
  call void (%Str) @o (%Str %27)
  ret %Int32 0
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %29 = extractvalue %LLVM_Value %0, 2
  %30 = icmp eq %Int64 %29, 0
  %31 = and i1 %11, %30
  br i1 %31, label %then_2, label %else_2
then_2:
  %32 = bitcast [16 x %Nat8]* @func360_str2 to %Str
  call void (%Str) @o (%Str %32)
  br label %endif_2
else_2:
  %33 = load %FILE*, %FILE** @fout
  %34 = bitcast [5 x %Nat8]* @func360_str3 to %Str
  %35 = extractvalue %LLVM_Value %0, 2
  %36 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %33, %Str %34, %Int64 %35)
  br label %endif_2
endif_2:
  ret %Int32 0
}

define void @func361 (%LLVM_Value) {
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
  %7 = bitcast [5 x %Nat8]* @func361_str1 to %Str
  %8 = extractvalue %LLVM_Value %0, 4
  %9 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %6, %Str %7, %Nat32 %8)
  br label %select_1_end
select_1_2:
  %10 = icmp eq %LLVM_ValueKind %2, 8
  br i1 %10, label %select_1_2_ok, label %select_1_3
select_1_2_ok:
  %11 = load %FILE*, %FILE** @fout
  %12 = bitcast [5 x %Nat8]* @func361_str2 to %Str
  %13 = extractvalue %LLVM_Value %0, 4
  %14 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %11, %Str %12, %Nat32 %13)
  br label %select_1_end
select_1_3:
  %15 = icmp eq %LLVM_ValueKind %2, 7
  br i1 %15, label %select_1_3_ok, label %select_1_4
select_1_3_ok:
  %16 = load %FILE*, %FILE** @fout
  %17 = bitcast [4 x %Nat8]* @func361_str3 to %Str
  %18 = extractvalue %LLVM_Value %0, 3
  %19 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %16, %Str %17, %Str %18)
  br label %select_1_end
select_1_4:
  %20 = icmp eq %LLVM_ValueKind %2, 5
  br i1 %20, label %select_1_4_ok, label %select_1_5
select_1_4_ok:
  %21 = load %FILE*, %FILE** @fout
  %22 = bitcast [4 x %Nat8]* @func361_str4 to %Str
  %23 = extractvalue %LLVM_Value %0, 3
  %24 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %21, %Str %22, %Str %23)
  br label %select_1_end
select_1_5:
  %25 = icmp eq %LLVM_ValueKind %2, 6
  br i1 %25, label %select_1_5_ok, label %select_1_6
select_1_5_ok:
  %26 = load %FILE*, %FILE** @fout
  %27 = bitcast [5 x %Nat8]* @func361_str5 to %Str
  %28 = extractvalue %LLVM_Value %0, 4
  %29 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %26, %Str %27, %Nat32 %28)
  br label %select_1_end
select_1_6:
  %30 = icmp eq %LLVM_ValueKind %2, 2
  br i1 %30, label %select_1_6_ok, label %select_1_7
select_1_6_ok:
  %31 = load %FILE*, %FILE** @fout
  %32 = bitcast [16 x %Nat8]* @func361_str6 to %Str
  %33 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %31, %Str %32)
  br label %select_1_end
select_1_7:
  %34 = icmp eq %LLVM_ValueKind %2, 1
  br i1 %34, label %select_1_7_ok, label %select_1_8
select_1_7_ok:
  %35 = load %FILE*, %FILE** @fout
  %36 = bitcast [6 x %Nat8]* @func361_str7 to %Str
  %37 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %35, %Str %36)
  br label %select_1_end
select_1_8:
  %38 = load %FILE*, %FILE** @fout
  %39 = bitcast [32 x %Nat8]* @func361_str8 to %Str
  %40 = extractvalue %LLVM_Value %0, 0
  %41 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %38, %Str %39, %LLVM_ValueKind %40)
  br label %select_1_end
select_1_end:
  %42 = phi %Int32 [ %4, %select_1_0_ok ], [ %9, %select_1_1_ok ], [ %14, %select_1_2_ok ], [ %19, %select_1_3_ok ], [ %24, %select_1_4_ok ], [ %29, %select_1_5_ok ], [ %33, %select_1_6_ok ], [ %37, %select_1_7_ok ], [ %41, %select_1_8 ]
  ret void
}

define void @func362 (%LLVM_Value) {
  %2 = extractvalue %LLVM_Value %0, 1
  call void (%Type*) @func381 (%Type* %2)
  call void () @space ()
  call void (%LLVM_Value) @func361 (%LLVM_Value %0)
  ret void
}

define %LLVM_Value @func363 (%LLVM_Value) {
  %2 = bitcast [12 x %Nat8]* @func363_str1 to %Str
  %3 = extractvalue %LLVM_Value %0, 1
  %4 = call %Nat32 (%Str, %Type*) @func289 (%Str %2, %Type* %3)
  %5 = bitcast [9 x %Nat8]* @func363_str2 to %Str
  call void (%Str) @o (%Str %5)
  %6 = insertvalue %LLVM_Value zeroinitializer, %LLVM_ValueKind 9, 0
  %7 = extractvalue %LLVM_Value %0, 1
  %8 = insertvalue %LLVM_Value %6, %Type* %7, 1
  %9 = insertvalue %LLVM_Value %8, %Nat32 %4, 4
  ret %LLVM_Value %9
}

define void @func364 (%union.13*) {
  %2 = load %union.13, %union.13* %0
  %3 = extractvalue %union.13 %2, 0
  br label %select_1_0
select_1_0:
  %4 = bitcast %Int16 9 to %Int16
  %5 = icmp eq %Int16 %3, %4
  br i1 %5, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %6 = alloca %union.13
  store %union.13 %2, %union.13* %6, align 128
  %7 = getelementptr inbounds %union.13, %union.13* %6, i1 0, i32 1
  %8 = bitcast [112 x %Nat8]* %7 to %StmtBlock*
  %9 = load %StmtBlock, %StmtBlock* %8
  call void (%StmtBlock) @func376 (%StmtBlock %9)
  br label %select_1_end
select_1_1:
  %10 = bitcast %Int16 10 to %Int16
  %11 = icmp eq %Int16 %3, %10
  br i1 %11, label %select_1_1_ok, label %select_1_2
select_1_1_ok:
  %12 = alloca %union.13
  store %union.13 %2, %union.13* %12, align 128
  %13 = getelementptr inbounds %union.13, %union.13* %12, i1 0, i32 1
  %14 = bitcast [112 x %Nat8]* %13 to %StmtValBind*
  %15 = load %StmtValBind, %StmtValBind* %14
  call void (%StmtValBind) @func367 (%StmtValBind %15)
  br label %select_1_end
select_1_2:
  %16 = bitcast %Int16 11 to %Int16
  %17 = icmp eq %Int16 %3, %16
  br i1 %17, label %select_1_2_ok, label %select_1_3
select_1_2_ok:
  %18 = alloca %union.13
  store %union.13 %2, %union.13* %18, align 128
  %19 = getelementptr inbounds %union.13, %union.13* %18, i1 0, i32 1
  %20 = bitcast [112 x %Nat8]* %19 to %StmtExpr*
  %21 = load %StmtExpr, %StmtExpr* %20
  call void (%StmtExpr) @func368 (%StmtExpr %21)
  br label %select_1_end
select_1_3:
  %22 = bitcast %Int16 8 to %Int16
  %23 = icmp eq %Int16 %3, %22
  br i1 %23, label %select_1_3_ok, label %select_1_4
select_1_3_ok:
  %24 = alloca %union.13
  store %union.13 %2, %union.13* %24, align 128
  %25 = getelementptr inbounds %union.13, %union.13* %24, i1 0, i32 1
  %26 = bitcast [112 x %Nat8]* %25 to %StmtAssign*
  %27 = load %StmtAssign, %StmtAssign* %26
  call void (%StmtAssign) @func365 (%StmtAssign %27)
  br label %select_1_end
select_1_4:
  %28 = bitcast %Int16 1 to %Int16
  %29 = icmp eq %Int16 %3, %28
  br i1 %29, label %select_1_4_ok, label %select_1_5
select_1_4_ok:
  %30 = alloca %union.13
  store %union.13 %2, %union.13* %30, align 128
  %31 = getelementptr inbounds %union.13, %union.13* %30, i1 0, i32 1
  %32 = bitcast [112 x %Nat8]* %31 to %StmtVarDef*
  %33 = load %StmtVarDef, %StmtVarDef* %32
  call void (%StmtVarDef) @func366 (%StmtVarDef %33)
  br label %select_1_end
select_1_5:
  %34 = bitcast %Int16 7 to %Int16
  %35 = icmp eq %Int16 %3, %34
  br i1 %35, label %select_1_5_ok, label %select_1_6
select_1_5_ok:
  %36 = alloca %union.13
  store %union.13 %2, %union.13* %36, align 128
  %37 = getelementptr inbounds %union.13, %union.13* %36, i1 0, i32 1
  %38 = bitcast [112 x %Nat8]* %37 to %StmtIf*
  %39 = load %StmtIf, %StmtIf* %38
  call void (%StmtIf) @func369 (%StmtIf %39)
  br label %select_1_end
select_1_6:
  %40 = bitcast %Int16 6 to %Int16
  %41 = icmp eq %Int16 %3, %40
  br i1 %41, label %select_1_6_ok, label %select_1_7
select_1_6_ok:
  %42 = alloca %union.13
  store %union.13 %2, %union.13* %42, align 128
  %43 = getelementptr inbounds %union.13, %union.13* %42, i1 0, i32 1
  %44 = bitcast [112 x %Nat8]* %43 to %StmtWhile*
  %45 = load %StmtWhile, %StmtWhile* %44
  call void (%StmtWhile) @func370 (%StmtWhile %45)
  br label %select_1_end
select_1_7:
  %46 = bitcast %Int16 5 to %Int16
  %47 = icmp eq %Int16 %3, %46
  br i1 %47, label %select_1_7_ok, label %select_1_8
select_1_7_ok:
  %48 = alloca %union.13
  store %union.13 %2, %union.13* %48, align 128
  %49 = getelementptr inbounds %union.13, %union.13* %48, i1 0, i32 1
  %50 = bitcast [112 x %Nat8]* %49 to %StmtReturn*
  %51 = load %StmtReturn, %StmtReturn* %50
  call void (%StmtReturn) @func371 (%StmtReturn %51)
  br label %select_1_end
select_1_8:
  %52 = bitcast %Int16 4 to %Int16
  %53 = icmp eq %Int16 %3, %52
  br i1 %53, label %select_1_8_ok, label %select_1_9
select_1_8_ok:
  %54 = alloca %union.13
  store %union.13 %2, %union.13* %54, align 128
  %55 = getelementptr inbounds %union.13, %union.13* %54, i1 0, i32 1
  %56 = bitcast [112 x %Nat8]* %55 to %StmtBreak*
  %57 = load %StmtBreak, %StmtBreak* %56
  call void (%StmtBreak) @func372 (%StmtBreak %57)
  br label %select_1_end
select_1_9:
  %58 = bitcast %Int16 3 to %Int16
  %59 = icmp eq %Int16 %3, %58
  br i1 %59, label %select_1_9_ok, label %select_1_10
select_1_9_ok:
  %60 = alloca %union.13
  store %union.13 %2, %union.13* %60, align 128
  %61 = getelementptr inbounds %union.13, %union.13* %60, i1 0, i32 1
  %62 = bitcast [112 x %Nat8]* %61 to %StmtAgain*
  %63 = load %StmtAgain, %StmtAgain* %62
  call void (%StmtAgain) @func373 (%StmtAgain %63)
  br label %select_1_end
select_1_10:
  %64 = bitcast %Int16 2 to %Int16
  %65 = icmp eq %Int16 %3, %64
  br i1 %65, label %select_1_10_ok, label %select_1_11
select_1_10_ok:
  %66 = alloca %union.13
  store %union.13 %2, %union.13* %66, align 128
  %67 = getelementptr inbounds %union.13, %union.13* %66, i1 0, i32 1
  %68 = bitcast [112 x %Nat8]* %67 to %StmtGoto*
  %69 = load %StmtGoto, %StmtGoto* %68
  call void (%StmtGoto) @func374 (%StmtGoto %69)
  br label %select_1_end
select_1_11:
  %70 = bitcast %Int16 0 to %Int16
  %71 = icmp eq %Int16 %3, %70
  br i1 %71, label %select_1_11_ok, label %select_1_12
select_1_11_ok:
  %72 = alloca %union.13
  store %union.13 %2, %union.13* %72, align 128
  %73 = getelementptr inbounds %union.13, %union.13* %72, i1 0, i32 1
  %74 = bitcast [112 x %Nat8]* %73 to %StmtLabel*
  %75 = load %StmtLabel, %StmtLabel* %74
  call void (%StmtLabel) @func375 (%StmtLabel %75)
  br label %select_1_end
select_1_12:
  %76 = load %FILE*, %FILE** @fout
  %77 = bitcast [22 x %Nat8]* @func364_str1 to %Str
  %78 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %76, %Str %77)
  br label %select_1_end
select_1_end:
  ret void
}

define void @func365 (%StmtAssign) {
  %2 = extractvalue %StmtAssign %0, 0
  %3 = extractvalue %StmtAssign %0, 1
  call void (%Value*, %Value*) @func357 (%Value* %2, %Value* %3)
  ret void
}

define void @func366 (%StmtVarDef) {
  %2 = bitcast [7 x %Nat8]* @func366_str1 to %Str
  %3 = extractvalue %StmtVarDef %0, 2
  %4 = call %Nat32 (%Str, %Type*) @func289 (%Str %2, %Type* %3)
  %5 = extractvalue %StmtVarDef %0, 1
; index array
  %6 = getelementptr inbounds [1024 x %Nat32], [1024 x %Nat32]* @local_vars_map, i1 0, %Nat32 %5
  store %Nat32 %4, %Nat32* %6, align 4
  %7 = extractvalue %StmtVarDef %0, 3; loadImmPtr
  %8 = inttoptr i64 0 to%Value*
  %9 = icmp ne %Value* %7, %8
  br i1 %9, label %then_0, label %else_0
then_0:
  %10 = call %LLVM_Value (%Value*) @func298 (%Value* %7)
  %11 = insertvalue %LLVM_Value zeroinitializer, %LLVM_ValueKind 6, 0
  %12 = extractvalue %StmtVarDef %0, 2
  %13 = insertvalue %LLVM_Value %11, %Type* %12, 1
  %14 = insertvalue %LLVM_Value %13, %Nat32 %4, 4
  call void (%LLVM_Value, %LLVM_Value) @func358 (%LLVM_Value %14, %LLVM_Value %10)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  ret void
}

define void @func367 (%StmtValBind) {
  %2 = extractvalue %StmtValBind %0, 0
  %3 = call %LLVM_Value (%Value*) @func298 (%Value* %2)
  %4 = extractvalue %StmtValBind %0, 1
; index array
  %5 = getelementptr inbounds [1024 x %Nat32], [1024 x %Nat32]* @local_x_map, i1 0, %Nat32 %4
  %6 = extractvalue %LLVM_Value %3, 4
  store %Nat32 %6, %Nat32* %5, align 4
  ret void
}

define void @func368 (%StmtExpr) {
  %2 = extractvalue %StmtExpr %0, 0
  %3 = call %LLVM_Value (%Value*) @func298 (%Value* %2)
  ret void
}

define void @func369 (%StmtIf) {
  %2 = load %Nat32, %Nat32* @global_if_id
  %3 = load %Nat32, %Nat32* @global_if_id
  %4 = add %Nat32 %3, 1
  store %Nat32 %4, %Nat32* @global_if_id, align 4
  %5 = extractvalue %StmtIf %0, 0
  %6 = call %LLVM_Value (%Value*) @func298 (%Value* %5)
  %7 = load %FILE*, %FILE** @fout
  %8 = bitcast [10 x %Nat8]* @func369_str1 to %Str
  %9 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %7, %Str %8)
  call void (%LLVM_Value) @func361 (%LLVM_Value %6)
  %10 = load %FILE*, %FILE** @fout
  %11 = bitcast [35 x %Nat8]* @func369_str2 to %Str
  %12 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %10, %Str %11, %Nat32 %2, %Nat32 %2)
  %13 = load %FILE*, %FILE** @fout
  %14 = bitcast [10 x %Nat8]* @func369_str3 to %Str
  %15 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %13, %Str %14, %Nat32 %2)
  %16 = extractvalue %StmtIf %0, 1
  call void (%union.13*) @func364 (%union.13* %16)
  %17 = load %FILE*, %FILE** @fout
  %18 = bitcast [23 x %Nat8]* @func369_str4 to %Str
  %19 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %17, %Str %18, %Nat32 %2)
  %20 = load %FILE*, %FILE** @fout
  %21 = bitcast [10 x %Nat8]* @func369_str5 to %Str
  %22 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %20, %Str %21, %Nat32 %2)
  %23 = extractvalue %StmtIf %0, 2
  %24 = bitcast %Int64 0 to %Int64
  %25 = ptrtoint %union.11 %23 to %Int64
  %26 = icmp eq %Int64 %25, %24
  %27 = xor i1 %26, 1
  br i1 %27, label %then_0, label %else_0
then_0:
  %28 = extractvalue %StmtIf %0, 2
  %29 = bitcast %union.11 %28 to %union.13*
  call void (%union.13*) @func364 (%union.13* %29)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %30 = load %FILE*, %FILE** @fout
  %31 = bitcast [23 x %Nat8]* @func369_str6 to %Str
  %32 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %30, %Str %31, %Nat32 %2)
  %33 = load %FILE*, %FILE** @fout
  %34 = bitcast [11 x %Nat8]* @func369_str7 to %Str
  %35 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %33, %Str %34, %Nat32 %2)
  ret void
}

define void @func370 (%StmtWhile) {
  %2 = load %Nat32, %Nat32* @while_id
  %3 = load %Nat32, %Nat32* @global_while_id
  store %Nat32 %3, %Nat32* @while_id, align 4
  %4 = load %Nat32, %Nat32* @global_while_id
  %5 = add %Nat32 %4, 1
  store %Nat32 %5, %Nat32* @global_while_id, align 4
  %6 = load %FILE*, %FILE** @fout
  %7 = bitcast [23 x %Nat8]* @func370_str1 to %Str
  %8 = load %Nat32, %Nat32* @while_id
  %9 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %6, %Str %7, %Nat32 %8)
  %10 = load %FILE*, %FILE** @fout
  %11 = bitcast [11 x %Nat8]* @func370_str2 to %Str
  %12 = load %Nat32, %Nat32* @while_id
  %13 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %10, %Str %11, %Nat32 %12)
  %14 = extractvalue %StmtWhile %0, 0
  %15 = call %LLVM_Value (%Value*) @func298 (%Value* %14)
  %16 = load %FILE*, %FILE** @fout
  %17 = bitcast [10 x %Nat8]* @func370_str3 to %Str
  %18 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %16, %Str %17)
  call void (%LLVM_Value) @func361 (%LLVM_Value %15)
  %19 = load %FILE*, %FILE** @fout
  %20 = bitcast [36 x %Nat8]* @func370_str4 to %Str
  %21 = load %Nat32, %Nat32* @while_id
  %22 = load %Nat32, %Nat32* @while_id
  %23 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %19, %Str %20, %Nat32 %21, %Nat32 %22)
  %24 = load %FILE*, %FILE** @fout
  %25 = bitcast [10 x %Nat8]* @func370_str5 to %Str
  %26 = load %Nat32, %Nat32* @while_id
  %27 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %24, %Str %25, %Nat32 %26)
  %28 = extractvalue %StmtWhile %0, 1
  call void (%union.13*) @func364 (%union.13* %28)
  %29 = load %FILE*, %FILE** @fout
  %30 = bitcast [23 x %Nat8]* @func370_str6 to %Str
  %31 = load %Nat32, %Nat32* @while_id
  %32 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %29, %Str %30, %Nat32 %31)
  %33 = load %FILE*, %FILE** @fout
  %34 = bitcast [11 x %Nat8]* @func370_str7 to %Str
  %35 = load %Nat32, %Nat32* @while_id
  %36 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %33, %Str %34, %Nat32 %35)
  store %Nat32 %2, %Nat32* @while_id, align 4
  ret void
}

define void @func371 (%StmtReturn) {
  %2 = extractvalue %StmtReturn %0, 0
  %3 = bitcast %Int64 0 to %Int64
  %4 = ptrtoint %union.12 %2 to %Int64
  %5 = icmp eq %Int64 %4, %3
  br i1 %5, label %then_0, label %else_0
then_0:
  %6 = call %Nat32 () @lab_get ()
  %7 = bitcast [10 x %Nat8]* @func371_str1 to %Str
  call void (%Str) @o (%Str %7)
ret void
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %9 = bitcast %union.12 %2 to %Value*
  %10 = call %LLVM_Value (%Value*) @func298 (%Value* %9)
  %11 = load %FILE*, %FILE** @fout
  %12 = bitcast [8 x %Nat8]* @func371_str2 to %Str
  %13 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %11, %Str %12)
  call void (%LLVM_Value) @func362 (%LLVM_Value %10)
  %14 = call %Nat32 () @lab_get ()
  ret void
}

define void @func372 (%StmtBreak) {
  %2 = call %Nat32 () @lab_get ()
  %3 = load %FILE*, %FILE** @fout
  %4 = bitcast [23 x %Nat8]* @func372_str1 to %Str
  %5 = load %Nat32, %Nat32* @while_id
  %6 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %3, %Str %4, %Nat32 %5)
  ret void
}

define void @func373 (%StmtAgain) {
  %2 = call %Nat32 () @lab_get ()
  %3 = load %FILE*, %FILE** @fout
  %4 = bitcast [23 x %Nat8]* @func373_str1 to %Str
  %5 = load %Nat32, %Nat32* @while_id
  %6 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %3, %Str %4, %Nat32 %5)
  ret void
}

define void @func374 (%StmtGoto) {
  %2 = call %Nat32 () @lab_get ()
  %3 = load %FILE*, %FILE** @fout
  %4 = bitcast [17 x %Nat8]* @func374_str1 to %Str
  %5 = extractvalue %StmtGoto %0, 0
  %6 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %3, %Str %4, %Str %5)
  ret void
}

define void @func375 (%StmtLabel) {
  %2 = load %FILE*, %FILE** @fout
  %3 = bitcast [17 x %Nat8]* @func375_str1 to %Str
  %4 = extractvalue %StmtLabel %0, 0
  %5 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %2, %Str %3, %Str %4)
  %6 = load %FILE*, %FILE** @fout
  %7 = bitcast [5 x %Nat8]* @func375_str2 to %Str
  %8 = extractvalue %StmtLabel %0, 0
  %9 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %6, %Str %7, %Str %8)
  ret void
}

define void @func377 (%Unit*, %Unit*, %Nat32, %Node*) {
  %5 = load %Nat32, %Nat32* @blockno
  %6 = add %Nat32 %5, 1
  store %Nat32 %6, %Nat32* @blockno, align 4
  %7 = bitcast %Unit* %0 to %union.13*
  call void (%union.13*) @func364 (%union.13* %7)
  ret void
}

define void @func376 (%StmtBlock) {
  %2 = alloca %List
  %3 = extractvalue %StmtBlock %0, 1
  store %List %3, %List* %2, align 8
  %4 = getelementptr inbounds %List, %List* %2, i1 0; loadImmPtr
  %5 = inttoptr i64 0 to%Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @func64 (%List* %4, %ListForeachHandler @func377, %Unit* %5)
  ret void
}

define void @func379 (%Type*) {
  %2 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 13
  %3 = getelementptr inbounds %TypeVar, %TypeVar* %2, i1 0, i32 0
  %4 = load %Type*, %Type** %3
  call void (%Type*) @func381 (%Type* %4)
  ret void
}

define void @func380 (%Type*) {
  %2 = bitcast [20 x %Nat8]* @func378_func380_str1 to %Str
  call void (%Str) @o (%Str %2)
  %3 = bitcast [18 x %Nat8]* @func378_func380_str2 to %Str
  %4 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 0
  %5 = load %TypeKind, %TypeKind* %4
  %6 = call %Int32 (%Str, ...) @printf (%Str %3, %TypeKind %5)
  ret void
}

define void @func378 (%Type*, i1, i1) {; loadImmPtr
  %4 = inttoptr i64 0 to%Type*
  %5 = icmp ne %Type* %0, %4
  %6 = bitcast [26 x %Nat8]* @func378_str1 to %Str
  call void (i1, %Str) @assert (i1 %5, %Str %6)
  %7 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 2
  %8 = load %Str, %Str* %7; loadImmPtr
  %9 = inttoptr i64 0 to%Str
  %10 = icmp ne %Str %8, %9
  %11 = and i1 %1, %10
  br i1 %11, label %then_0, label %else_0
then_0:
  %12 = load %FILE*, %FILE** @fout
  %13 = bitcast [5 x %Nat8]* @func378_str2 to %Str
  %14 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 2
  %15 = load %Str, %Str* %14
  %16 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %12, %Str %13, %Str %15)
ret void
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %18 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 0
  %19 = load %TypeKind, %TypeKind* %18
  br label %select_1_0
select_1_0:
  %20 = icmp eq %TypeKind %19, 5
  br i1 %20, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %21 = load %FILE*, %FILE** @fout
  %22 = bitcast [5 x %Nat8]* @func378_str3 to %Str
  %23 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 2
  %24 = load %Str, %Str* %23
  %25 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %21, %Str %22, %Str %24)
  br label %select_1_end
select_1_1:
  %26 = icmp eq %TypeKind %19, 8
  br i1 %26, label %select_1_1_ok, label %select_1_2
select_1_1_ok:
  call void (%Type*) @func379 (%Type* %0)
  br label %select_1_end
select_1_2:
  %27 = icmp eq %TypeKind %19, 11
  br i1 %27, label %select_1_2_ok, label %select_1_3
select_1_2_ok:
  %28 = load %FILE*, %FILE** @fout
  %29 = bitcast [4 x %Nat8]* @func378_str4 to %Str
  %30 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %28, %Str %29, %Int64 16)
  br label %select_1_end
select_1_3:
  %31 = icmp eq %TypeKind %19, 12
  br i1 %31, label %select_1_3_ok, label %select_1_4
select_1_3_ok:
  %32 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 11
  call void (%TypeRecord*) @func382 (%TypeRecord* %32)
  br label %select_1_end
select_1_4:
  %33 = icmp eq %TypeKind %19, 14
  br i1 %33, label %select_1_4_ok, label %select_1_5
select_1_4_ok:
  %34 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 9
  call void (%TypeArray*) @func384 (%TypeArray* %34)
  br label %select_1_end
select_1_5:
  %35 = icmp eq %TypeKind %19, 15
  br i1 %35, label %select_1_5_ok, label %select_1_6
select_1_5_ok:
  %36 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 10
  call void (%TypeArrayU*) @func385 (%TypeArrayU* %36)
  br label %select_1_end
select_1_6:
  %37 = icmp eq %TypeKind %19, 13
  br i1 %37, label %select_1_6_ok, label %select_1_7
select_1_6_ok:
  %38 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 8
  call void (%TypePointer*) @func386 (%TypePointer* %38)
  br label %select_1_end
select_1_7:
  %39 = icmp eq %TypeKind %19, 10
  br i1 %39, label %select_1_7_ok, label %select_1_8
select_1_7_ok:
  %40 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 7
  call void (%TypeFunc*, i1) @func387 (%TypeFunc* %40, i1 %2)
  br label %select_1_end
select_1_8:
  %41 = icmp eq %TypeKind %19, 9
  br i1 %41, label %select_1_8_ok, label %select_1_9
select_1_8_ok:
  %42 = bitcast [3 x %Nat8]* @func378_str5 to %Str
  call void (%Str) @o (%Str %42)
  br label %select_1_end
select_1_9:
  %43 = icmp eq %TypeKind %19, 16
  br i1 %43, label %select_1_9_ok, label %select_1_10
select_1_9_ok:
  %44 = load %FILE*, %FILE** @fout
  %45 = bitcast [5 x %Nat8]* @func378_str6 to %Str
  %46 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 2
  %47 = load %Str, %Str* %46
  %48 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %44, %Str %45, %Str %47)
  br label %select_1_end
select_1_10:
  %49 = icmp eq %TypeKind %19, 6
  br i1 %49, label %select_1_10_ok, label %select_1_11
select_1_10_ok:
  %50 = load %FILE*, %FILE** @fout
  %51 = bitcast [5 x %Nat8]* @func378_str7 to %Str
  %52 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 2
  %53 = load %Str, %Str* %52
  %54 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %50, %Str %51, %Str %53)
  br label %select_1_end
select_1_11:
  call void (%Type*) @func380 (%Type* %0)
  br label %select_1_end
select_1_end:
  ret void
}

define void @func381 (%Type*) {
  call void (%Type*, i1, i1) @func378 (%Type* %0, i1 1, i1 1)
  ret void
}

define void @func383 (%Unit*, %Unit*, %Nat32, %Node*) {
  %5 = icmp ugt %Nat32 %2, 0
  br i1 %5, label %then_0, label %else_0
then_0:
  call void () @comma ()
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %6 = bitcast %Unit* %0 to %Decl*
  %7 = getelementptr inbounds %Decl, %Decl* %6, i1 0, i32 1
  %8 = load %Type*, %Type** %7
  call void (%Type*) @func381 (%Type* %8)
  ret void
}

define void @func382 (%TypeRecord*) {
  %2 = bitcast [2 x %Nat8]* @func382_str1 to %Str
  call void (%Str) @o (%Str %2)
  %3 = getelementptr inbounds %TypeRecord, %TypeRecord* %0, i1 0, i32 0
  %4 = load %List*, %List** %3; loadImmPtr
  %5 = inttoptr i64 0 to%Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @func64 (%List* %4, %ListForeachHandler @func383, %Unit* %5)
  %6 = bitcast [2 x %Nat8]* @func382_str2 to %Str
  call void (%Str) @o (%Str %6)
  ret void
}

define void @func384 (%TypeArray*) {
  %2 = load %FILE*, %FILE** @fout
  %3 = bitcast [7 x %Nat8]* @func384_str1 to %Str
  %4 = getelementptr inbounds %TypeArray, %TypeArray* %0, i1 0, i32 1
  %5 = load %Nat32, %Nat32* %4
  %6 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %2, %Str %3, %Nat32 %5)
  %7 = getelementptr inbounds %TypeArray, %TypeArray* %0, i1 0, i32 0
  %8 = load %Type*, %Type** %7
  call void (%Type*) @func381 (%Type* %8)
  %9 = bitcast [2 x %Nat8]* @func384_str2 to %Str
  call void (%Str) @o (%Str %9)
  ret void
}

define void @func385 (%TypeArrayU*) {
  %2 = getelementptr inbounds %TypeArrayU, %TypeArrayU* %0, i1 0, i32 0
  %3 = load %Type*, %Type** %2
  call void (%Type*) @func381 (%Type* %3)
  %4 = bitcast [2 x %Nat8]* @func385_str1 to %Str
  call void (%Str) @o (%Str %4)
  ret void
}

define void @func386 (%TypePointer*) {
  %2 = getelementptr inbounds %TypePointer, %TypePointer* %0, i1 0, i32 0
  %3 = load %Type*, %Type** %2
  call void (%Type*) @func381 (%Type* %3)
  %4 = bitcast [2 x %Nat8]* @func386_str1 to %Str
  call void (%Str) @o (%Str %4)
  ret void
}

define void @func388 (%Unit*, %Unit*, %Nat32, %Node*) {
  %5 = icmp ugt %Nat32 %2, 0
  br i1 %5, label %then_0, label %else_0
then_0:
  call void () @comma ()
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %6 = bitcast %Unit* %0 to %Decl*
  %7 = getelementptr inbounds %Decl, %Decl* %6, i1 0, i32 1
  %8 = load %Type*, %Type** %7
  call void (%Type*) @func381 (%Type* %8)
  ret void
}

define void @func387 (%TypeFunc*, i1) {
  %3 = getelementptr inbounds %TypeFunc, %TypeFunc* %0, i1 0, i32 1
  %4 = load %Type*, %Type** %3
  %5 = load %Type*, %Type** @typeUnit
  %6 = call i1 (%Type*, %Type*) @func445 (%Type* %4, %Type* %5)
  br i1 %6, label %then_0, label %else_0
then_0:
  %7 = bitcast [5 x %Nat8]* @func387_str1 to %Str
  call void (%Str) @o (%Str %7)
  br label %endif_0
else_0:
  %8 = getelementptr inbounds %TypeFunc, %TypeFunc* %0, i1 0, i32 1
  %9 = load %Type*, %Type** %8
  call void (%Type*) @func381 (%Type* %9)
  br label %endif_0
endif_0:
  %10 = getelementptr inbounds %TypeFunc, %TypeFunc* %0, i1 0, i32 0
  %11 = load %Type*, %Type** %10
  %12 = getelementptr inbounds %Type, %Type* %11, i1 0, i32 11
  %13 = getelementptr inbounds %TypeRecord, %TypeRecord* %12, i1 0, i32 0
  %14 = load %List*, %List** %13
  %15 = bitcast [3 x %Nat8]* @func387_str2 to %Str
  call void (%Str) @o (%Str %15); loadImmPtr
  %16 = inttoptr i64 0 to%Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @func64 (%List* %14, %ListForeachHandler @func388, %Unit* %16)
  %17 = getelementptr inbounds %TypeFunc, %TypeFunc* %0, i1 0, i32 2
  %18 = load i1, i1* %17
  br i1 %18, label %then_1, label %else_1
then_1:
  %19 = bitcast [6 x %Nat8]* @func387_str3 to %Str
  call void (%Str) @o (%Str %19)
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  %20 = bitcast [2 x %Nat8]* @func387_str4 to %Str
  call void (%Str) @o (%Str %20)
  br i1 %1, label %then_2, label %else_2
then_2:
  %21 = bitcast [2 x %Nat8]* @func387_str5 to %Str
  call void (%Str) @o (%Str %21)
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
  ret void
}

define %Str @name_union_get () {
  %1 = call %Str (%Nat32) @str_new (%Nat32 10)
; eval index uarray
  %2 = getelementptr inbounds %Nat8, %Nat8* %1, %Int64 0
  %3 = bitcast %Nat8* %2 to %Unit*
  %4 = bitcast [3 x %Nat8]* @func389_str1 to %Str
  %5 = load %Nat32, %Nat32* @union_id
  %6 = call %Int32 (%Unit*, %Str, ...) @sprintf (%Unit* %3, %Str %4, %Nat32 %5)
  %7 = bitcast [7 x %Nat8]* @func389_str2 to %Str
  %8 = call %Str (%Str, %Str) @cat (%Str %7, %Str %1)
  %9 = load %Nat32, %Nat32* @union_id
  %10 = add %Nat32 %9, 1
  store %Nat32 %10, %Nat32* @union_id, align 4
  ret %Str %8
}

define %Nat32 @align (%Nat32, %Nat32) {
  %3 = icmp ne %Nat32 %1, 0
  %4 = bitcast [20 x %Nat8]* @func390_str1 to %Str
  call void (i1, %Str) @assert (i1 %3, %Str %4)
  %5 = urem %Nat32 %0, %1
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

define %Nat32 @propagation (%Nat32) {
  %2 = alloca %Nat32
  store %Nat32 1, %Nat32* %2, align 4
  br label %again_0
again_0:
  %3 = load %Nat32, %Nat32* %2
  %4 = icmp ult %Nat32 %3, %0
  br i1 %4, label %body_0, label %break_0
body_0:
  %5 = load %Nat32, %Nat32* %2
  %6 = shl %Nat32 %5, 1
  store %Nat32 %6, %Nat32* %2, align 4
  br label %again_0
break_0:
  %7 = load %Nat32, %Nat32* %2
  ret %Nat32 %7
}

define %Nat32 @max (%Nat32, %Nat32) {
  br label %select_1_0
select_1_0:
  %3 = icmp ugt %Nat32 %0, %1
  %4 = icmp eq i1 1, %3
  br i1 %4, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  br label %select_1_end
select_1_1:
  %5 = icmp ult %Nat32 %0, %1
  %6 = icmp eq i1 1, %5
  br i1 %6, label %select_1_1_ok, label %select_1_2
select_1_1_ok:
  br label %select_1_end
select_1_2:
  br label %select_1_end
select_1_end:
  %7 = phi %Nat32 [ %0, %select_1_0_ok ], [ %1, %select_1_1_ok ], [ %0, %select_1_2 ]
  ret %Nat32 %7
}

define %Type* @func393 (%TypeKind, %union.8, %Nat32, %TokenInfo*) {
  %5 = call %Unit* (%Nat32) @malloc (%Nat32 384)
  %6 = bitcast %Unit* %5 to %Type*; loadImmPtr
  %7 = inttoptr i64 0 to%Type*
  %8 = icmp ne %Type* %6, %7
  %9 = bitcast [9 x %Nat8]* @func393_str1 to %Str
  call void (i1, %Str) @assert (i1 %8, %Str %9)
  %10 = insertvalue %Type zeroinitializer, %TypeKind %0, 0
  %11 = insertvalue %Type %10, %Nat32 %2, 3
  %12 = insertvalue %Type %11, %Nat32 %2, 4
  %13 = insertvalue %Type %12, %TokenInfo* %3, 16
  store %Type %13, %Type* %6, align 64
  ret %Type* %6
}

define %Type* @type_var_new (%Type*, %TokenInfo*) {
  %3 = insertvalue %TypeVar zeroinitializer, %Type* %0, 0
  %4 = alloca %union.8
; write variant 9
  %5 = getelementptr inbounds %union.8, %union.8* %4, i1 0, i32 0
  store %Int16 9, %Int16* %5, align 2
; write data
  %6 = getelementptr inbounds %union.8, %union.8* %4, i1 0, i32 1
  %7 = bitcast [56 x %Nat8]* %6 to %TypeVar*
  store %TypeVar %3, %TypeVar* %7, align 8
  %8 = load %union.8, %union.8* %4
  %9 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 3
  %10 = load %Nat32, %Nat32* %9
  %11 = call %Type* (%TypeKind, %union.8, %Nat32, %TokenInfo*) @func393 (%TypeKind 8, %union.8 %8, %Nat32 %10, %TokenInfo* %1)
  %12 = getelementptr inbounds %Type, %Type* %11, i1 0, i32 4
  %13 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 4
  %14 = load %Nat32, %Nat32* %13
  store %Nat32 %14, %Nat32* %12, align 4
  %15 = getelementptr inbounds %Type, %Type* %11, i1 0, i32 13
  %16 = insertvalue %TypeVar zeroinitializer, %Type* %0, 0
  store %TypeVar %16, %TypeVar* %15, align 8
  ret %Type* %11
}

define %Type* @func395 (%Type*, %TokenInfo*) {
  %3 = insertvalue %TypePointer zeroinitializer, %Type* %0, 0
  %4 = alloca %union.8
; write variant 4
  %5 = getelementptr inbounds %union.8, %union.8* %4, i1 0, i32 0
  store %Int16 4, %Int16* %5, align 2
; write data
  %6 = getelementptr inbounds %union.8, %union.8* %4, i1 0, i32 1
  %7 = bitcast [56 x %Nat8]* %6 to %TypePointer*
  store %TypePointer %3, %TypePointer* %7, align 8
  %8 = load %union.8, %union.8* %4
  %9 = call %Type* (%TypeKind, %union.8, %Nat32, %TokenInfo*) @func393 (%TypeKind 13, %union.8 %8, %Nat32 8, %TokenInfo* %1)
  %10 = getelementptr inbounds %Type, %Type* %9, i1 0, i32 8
  %11 = insertvalue %TypePointer zeroinitializer, %Type* %0, 0
  store %TypePointer %11, %TypePointer* %10, align 8
  ret %Type* %9
}

define %Type* @func396 (%Type*, %TokenInfo*) {
  %3 = insertvalue %TypeArrayU zeroinitializer, %Type* %0, 0
  %4 = alloca %union.8
; write variant 2
  %5 = getelementptr inbounds %union.8, %union.8* %4, i1 0, i32 0
  store %Int16 2, %Int16* %5, align 2
; write data
  %6 = getelementptr inbounds %union.8, %union.8* %4, i1 0, i32 1
  %7 = bitcast [56 x %Nat8]* %6 to %TypeArrayU*
  store %TypeArrayU %3, %TypeArrayU* %7, align 8
  %8 = load %union.8, %union.8* %4
  %9 = call %Type* (%TypeKind, %union.8, %Nat32, %TokenInfo*) @func393 (%TypeKind 15, %union.8 %8, %Nat32 8, %TokenInfo* %1)
  %10 = getelementptr inbounds %Type, %Type* %9, i1 0, i32 10
  %11 = insertvalue %TypeArrayU zeroinitializer, %Type* %0, 0
  store %TypeArrayU %11, %TypeArrayU* %10, align 8
  ret %Type* %9
}

define %Type* @func397 (%Type*, %Nat32, %TokenInfo*) {
  %4 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 3
  %5 = load %Nat32, %Nat32* %4
  %6 = mul %Nat32 %1, %5
  %7 = insertvalue %TypeArray zeroinitializer, %Type* %0, 0
  %8 = insertvalue %TypeArray %7, %Nat32 %1, 1
  %9 = alloca %union.8
; write variant 3
  %10 = getelementptr inbounds %union.8, %union.8* %9, i1 0, i32 0
  store %Int16 3, %Int16* %10, align 2
; write data
  %11 = getelementptr inbounds %union.8, %union.8* %9, i1 0, i32 1
  %12 = bitcast [56 x %Nat8]* %11 to %TypeArray*
  store %TypeArray %8, %TypeArray* %12, align 8
  %13 = load %union.8, %union.8* %9
  %14 = call %Type* (%TypeKind, %union.8, %Nat32, %TokenInfo*) @func393 (%TypeKind 14, %union.8 %13, %Nat32 %6, %TokenInfo* %2)
  %15 = getelementptr inbounds %Type, %Type* %14, i1 0, i32 4
  %16 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 4
  %17 = load %Nat32, %Nat32* %16
  store %Nat32 %17, %Nat32* %15, align 4
  %18 = getelementptr inbounds %Type, %Type* %14, i1 0, i32 9
  %19 = insertvalue %TypeArray zeroinitializer, %Type* %0, 0
  %20 = insertvalue %TypeArray %19, %Nat32 %1, 1
  store %TypeArray %20, %TypeArray* %18, align 8
  ret %Type* %14
}

define void @func399 (%Unit*, %Unit*, %Nat32, %Node*) {
  %5 = bitcast %Unit* %0 to %EnumConstructor*
  %6 = bitcast %Unit* %1 to %Type*
  %7 = getelementptr inbounds %EnumConstructor, %EnumConstructor* %5, i1 0, i32 1
  %8 = load %Nat32, %Nat32* %7
  %9 = sext %Nat32 %8 to %Int64
  %10 = getelementptr inbounds %EnumConstructor, %EnumConstructor* %5, i1 0, i32 2
  %11 = load %TokenInfo*, %TokenInfo** %10
  %12 = call %Value* (%Type*, %Int64, %TokenInfo*) @func457 (%Type* %6, %Int64 %9, %TokenInfo* %11)
  %13 = getelementptr inbounds %EnumConstructor, %EnumConstructor* %5, i1 0, i32 0
  %14 = load %AstId*, %AstId** %13
  %15 = getelementptr inbounds %AstId, %AstId* %14, i1 0, i32 0
  %16 = load %Str, %Str* %15
  call void (%Str, %Value*) @valbind (%Str %16, %Value* %12)
  ret void
}

define %Type* @func398 (%List*, %TokenInfo*) {
  %3 = alloca %union.8
; write variant 1
  %4 = getelementptr inbounds %union.8, %union.8* %3, i1 0, i32 0
  store %Int16 1, %Int16* %4, align 2
; write data
  %5 = getelementptr inbounds %union.8, %union.8* %3, i1 0, i32 1
  %6 = bitcast [56 x %Nat8]* %5 to %TypeNo*
  store %TypeNo 0, %TypeNo* %6, align 2
  %7 = load %union.8, %union.8* %3
  %8 = call %Type* (%TypeKind, %union.8, %Nat32, %TokenInfo*) @func393 (%TypeKind 11, %union.8 %7, %Nat32 2, %TokenInfo* %1)
  %9 = bitcast %Type* %8 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @func64 (%List* %0, %ListForeachHandler @func399, %Unit* %9)
  ret %Type* %8
}

define %Type* @func400 (%Type*, %Type*, i1, %TokenInfo*) {
  %5 = insertvalue %TypeFunc zeroinitializer, %Type* %0, 0
  %6 = insertvalue %TypeFunc %5, %Type* %1, 1
  %7 = insertvalue %TypeFunc %6, i1 %2, 2
  %8 = alloca %union.8
; write variant 7
  %9 = getelementptr inbounds %union.8, %union.8* %8, i1 0, i32 0
  store %Int16 7, %Int16* %9, align 2
; write data
  %10 = getelementptr inbounds %union.8, %union.8* %8, i1 0, i32 1
  %11 = bitcast [56 x %Nat8]* %10 to %TypeFunc*
  store %TypeFunc %7, %TypeFunc* %11, align 8
  %12 = load %union.8, %union.8* %8
  %13 = call %Type* (%TypeKind, %union.8, %Nat32, %TokenInfo*) @func393 (%TypeKind 10, %union.8 %12, %Nat32 8, %TokenInfo* %3)
  %14 = getelementptr inbounds %Type, %Type* %13, i1 0, i32 7
  %15 = insertvalue %TypeFunc zeroinitializer, %Type* %0, 0
  %16 = insertvalue %TypeFunc %15, %Type* %1, 1
  %17 = insertvalue %TypeFunc %16, i1 %2, 2
  store %TypeFunc %17, %TypeFunc* %14, align 8
  ret %Type* %13
}

define i1 @func402 (%Unit*, %Unit*, %Nat32) {
  %4 = bitcast %Unit* %0 to %Decl*
  %5 = bitcast %Unit* %1 to %Str
  %6 = getelementptr inbounds %Decl, %Decl* %4, i1 0, i32 0
  %7 = load %AstId*, %AstId** %6
  %8 = getelementptr inbounds %AstId, %AstId* %7, i1 0, i32 0
  %9 = load %Str, %Str* %8
  %10 = call %Int32 (%Str, %Str) @strcmp (%Str %9, %Str %5)
  %11 = icmp eq %Int32 %10, 0
  ret i1 %11
}

define %Decl* @func401 (%Type*, %Str) {
  %3 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 11
  %4 = getelementptr inbounds %TypeRecord, %TypeRecord* %3, i1 0, i32 0
  %5 = load %List*, %List** %4
  %6 = bitcast %Str %1 to %Unit*
  %7 = call %Unit* (%List*, %ListSearchHandler, %Unit*) @list_search (%List* %5, %ListSearchHandler @func402, %Unit* %6)
  %8 = bitcast %Unit* %7 to %Decl*
  ret %Decl* %8
}

define i1 @func403 (%Type*) {
  %2 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 0
  %3 = load %TypeKind, %TypeKind* %2
  %4 = icmp eq %TypeKind %3, 3
  %5 = icmp eq %TypeKind %3, 13
  %6 = icmp eq %TypeKind %3, 10
  %7 = call i1 (%Type*) @func406 (%Type* %0)
  %8 = or i1 %6, %7
  %9 = or i1 %5, %8
  %10 = or i1 %4, %9
  ret i1 %10
}

define i1 @func404 (%Type*) {
  %2 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 0
  %3 = load %TypeKind, %TypeKind* %2
  %4 = icmp eq %TypeKind %3, 14
  ret i1 %4
}

define i1 @func405 (%Type*) {
  %2 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 0
  %3 = load %TypeKind, %TypeKind* %2
  %4 = icmp ne %TypeKind %3, 13
  br i1 %4, label %then_0, label %else_0
then_0:
  ret i1 0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %6 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 8
  %7 = getelementptr inbounds %TypePointer, %TypePointer* %6, i1 0, i32 0
  %8 = load %Type*, %Type** %7
  %9 = call i1 (%Type*) @func404 (%Type* %8)
  ret i1 %9
}

define i1 @func406 (%Type*) {
  %2 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 0
  %3 = load %TypeKind, %TypeKind* %2
  %4 = icmp eq %TypeKind %3, 15
  ret i1 %4
}

define i1 @type_is_generic_num (%Type*) {
  %2 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 0
  %3 = load %TypeKind, %TypeKind* %2
  %4 = icmp ne %TypeKind %3, 5
  br i1 %4, label %then_0, label %else_0
then_0:
  ret i1 0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %6 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 6
  %7 = getelementptr inbounds %TypeNumeric, %TypeNumeric* %6, i1 0, i32 0
  %8 = load %Nat32, %Nat32* %7
  %9 = icmp eq %Nat32 %8, 0
  ret i1 %9
}

define i1 @func408 (%Type*) {
  %2 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 0
  %3 = load %TypeKind, %TypeKind* %2
  %4 = icmp ne %TypeKind %3, 5
  br i1 %4, label %then_0, label %else_0
then_0:
  ret i1 0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %6 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 6
  %7 = getelementptr inbounds %TypeNumeric, %TypeNumeric* %6, i1 0, i32 0
  %8 = load %Nat32, %Nat32* %7
  %9 = icmp ugt %Nat32 %8, 0
  ret i1 %9
}

define i1 @func409 (%Type*) {
  %2 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 0
  %3 = load %TypeKind, %TypeKind* %2
  %4 = icmp eq %TypeKind %3, 12
  ret i1 %4
}

define i1 @func410 (%Type*) {
  %2 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 0
  %3 = load %TypeKind, %TypeKind* %2
  %4 = icmp ne %TypeKind %3, 13
  br i1 %4, label %then_0, label %else_0
then_0:
  ret i1 0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %6 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 8
  %7 = getelementptr inbounds %TypePointer, %TypePointer* %6, i1 0, i32 0
  %8 = load %Type*, %Type** %7
  %9 = call i1 (%Type*) @func409 (%Type* %8)
  ret i1 %9
}

define i1 @typeIsPointerToUnit (%Type*) {
  %2 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 0
  %3 = load %TypeKind, %TypeKind* %2
  %4 = icmp ne %TypeKind %3, 13
  br i1 %4, label %then_0, label %else_0
then_0:
  ret i1 0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %6 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 8
  %7 = getelementptr inbounds %TypePointer, %TypePointer* %6, i1 0, i32 0
  %8 = load %Type*, %Type** %7
  %9 = load %Type*, %Type** @typeUnit
  %10 = call i1 (%Type*, %Type*) @func445 (%Type* %8, %Type* %9)
  ret i1 %10
}

define i1 @func412 (%Type*) {
  %2 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 0
  %3 = load %TypeKind, %TypeKind* %2
  %4 = icmp ne %TypeKind %3, 16
  br i1 %4, label %then_0, label %else_0
then_0:
  ret i1 0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %6 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 14
  %7 = getelementptr inbounds %TypeUnion, %TypeUnion* %6, i1 0, i32 0
  %8 = getelementptr inbounds %List, %List* %7, i1 0, i32 2
  %9 = load %Nat64, %Nat64* %8
  %10 = icmp ne %Nat64 %9, 2
  br i1 %10, label %then_1, label %else_1
then_1:
  ret i1 0
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  %12 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 14
  %13 = getelementptr inbounds %TypeUnion, %TypeUnion* %12, i1 0, i32 0
  %14 = call %Unit* (%List*, %Nat32) @list_get (%List* %13, %Nat32 0)
  %15 = bitcast %Unit* %14 to %Type*
  %16 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 14
  %17 = getelementptr inbounds %TypeUnion, %TypeUnion* %16, i1 0, i32 0
  %18 = call %Unit* (%List*, %Nat32) @list_get (%List* %17, %Nat32 1)
  %19 = bitcast %Unit* %18 to %Type*
  %20 = getelementptr inbounds %Type, %Type* %15, i1 0, i32 0
  %21 = load %TypeKind, %TypeKind* %20
  %22 = icmp eq %TypeKind %21, 13
  %23 = load %Type*, %Type** @typeUnit
  %24 = call i1 (%Type*, %Type*) @func445 (%Type* %19, %Type* %23)
  %25 = and i1 %22, %24
  %26 = getelementptr inbounds %Type, %Type* %19, i1 0, i32 0
  %27 = load %TypeKind, %TypeKind* %26
  %28 = icmp eq %TypeKind %27, 13
  %29 = load %Type*, %Type** @typeUnit
  %30 = call i1 (%Type*, %Type*) @func445 (%Type* %15, %Type* %29)
  %31 = and i1 %28, %30
  %32 = or i1 %25, %31
  ret i1 %32
}

define %Type* @func414 () {
  %1 = bitcast [18 x %Nat8]* @func413_func414_str1 to %Str
  call void (%Str) @fatal (%Str %1); loadImmPtr
  %2 = inttoptr i64 0 to%Type*
  ret %Type* %2
}

define %Type* @func413 (%union.2*) {
  %2 = load %union.2, %union.2* %0
  %3 = extractvalue %union.2 %2, 0
  br label %select_1_0
select_1_0:
  %4 = bitcast %Int16 11 to %Int16
  %5 = icmp eq %Int16 %3, %4
  br i1 %5, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %6 = alloca %union.2
  store %union.2 %2, %union.2* %6, align 64
  %7 = getelementptr inbounds %union.2, %union.2* %6, i1 0, i32 1
  %8 = bitcast [40 x %Nat8]* %7 to %AstName*
  %9 = load %AstName, %AstName* %8
  %10 = call %Type* (%AstName) @func425 (%AstName %9)
  br label %select_1_end
select_1_1:
  %11 = bitcast %Int16 7 to %Int16
  %12 = icmp eq %Int16 %3, %11
  br i1 %12, label %select_1_1_ok, label %select_1_2
select_1_1_ok:
  %13 = alloca %union.2
  store %union.2 %2, %union.2* %13, align 64
  %14 = getelementptr inbounds %union.2, %union.2* %13, i1 0, i32 1
  %15 = bitcast [40 x %Nat8]* %14 to %AstTypeRecord*
  %16 = load %AstTypeRecord, %AstTypeRecord* %15
  %17 = call %Type* (%AstTypeRecord) @func431 (%AstTypeRecord %16)
  br label %select_1_end
select_1_2:
  %18 = bitcast %Int16 3 to %Int16
  %19 = icmp eq %Int16 %3, %18
  br i1 %19, label %select_1_2_ok, label %select_1_3
select_1_2_ok:
  %20 = alloca %union.2
  store %union.2 %2, %union.2* %20, align 64
  %21 = getelementptr inbounds %union.2, %union.2* %20, i1 0, i32 1
  %22 = bitcast [40 x %Nat8]* %21 to %AstTypeFunc*
  %23 = load %AstTypeFunc, %AstTypeFunc* %22
  %24 = call %Type* (%AstTypeFunc) @func426 (%AstTypeFunc %23)
  br label %select_1_end
select_1_3:
  %25 = bitcast %Int16 9 to %Int16
  %26 = icmp eq %Int16 %3, %25
  br i1 %26, label %select_1_3_ok, label %select_1_4
select_1_3_ok:
  %27 = alloca %union.2
  store %union.2 %2, %union.2* %27, align 64
  %28 = getelementptr inbounds %union.2, %union.2* %27, i1 0, i32 1
  %29 = bitcast [40 x %Nat8]* %28 to %AstTypeBinary*
  %30 = load %AstTypeBinary, %AstTypeBinary* %29
  %31 = call %Type* (%AstTypeBinary) @func421 (%AstTypeBinary %30)
  br label %select_1_end
select_1_4:
  %32 = bitcast %Int16 2 to %Int16
  %33 = icmp eq %Int16 %3, %32
  br i1 %33, label %select_1_4_ok, label %select_1_5
select_1_4_ok:
  %34 = alloca %union.2
  store %union.2 %2, %union.2* %34, align 64
  %35 = getelementptr inbounds %union.2, %union.2* %34, i1 0, i32 1
  %36 = bitcast [40 x %Nat8]* %35 to %AstTypeVar*
  %37 = load %AstTypeVar, %AstTypeVar* %36
  %38 = call %Type* (%AstTypeVar) @func424 (%AstTypeVar %37)
  br label %select_1_end
select_1_5:
  %39 = bitcast %Int16 0 to %Int16
  %40 = icmp eq %Int16 %3, %39
  br i1 %40, label %select_1_5_ok, label %select_1_6
select_1_5_ok:
  %41 = alloca %union.2
  store %union.2 %2, %union.2* %41, align 64
  %42 = getelementptr inbounds %union.2, %union.2* %41, i1 0, i32 1
  %43 = bitcast [40 x %Nat8]* %42 to %AstTypeNewType*
  %44 = load %AstTypeNewType, %AstTypeNewType* %43
  %45 = call %Type* (%AstTypeNewType) @func423 (%AstTypeNewType %44)
  br label %select_1_end
select_1_6:
  %46 = bitcast %Int16 6 to %Int16
  %47 = icmp eq %Int16 %3, %46
  br i1 %47, label %select_1_6_ok, label %select_1_7
select_1_6_ok:
  %48 = alloca %union.2
  store %union.2 %2, %union.2* %48, align 64
  %49 = getelementptr inbounds %union.2, %union.2* %48, i1 0, i32 1
  %50 = bitcast [40 x %Nat8]* %49 to %AstTypeArray*
  %51 = load %AstTypeArray, %AstTypeArray* %50
  %52 = call %Type* (%AstTypeArray) @func428 (%AstTypeArray %51)
  br label %select_1_end
select_1_7:
  %53 = bitcast %Int16 5 to %Int16
  %54 = icmp eq %Int16 %3, %53
  br i1 %54, label %select_1_7_ok, label %select_1_8
select_1_7_ok:
  %55 = alloca %union.2
  store %union.2 %2, %union.2* %55, align 64
  %56 = getelementptr inbounds %union.2, %union.2* %55, i1 0, i32 1
  %57 = bitcast [40 x %Nat8]* %56 to %AstTypeArrayU*
  %58 = load %AstTypeArrayU, %AstTypeArrayU* %57
  %59 = call %Type* (%AstTypeArrayU) @func427 (%AstTypeArrayU %58)
  br label %select_1_end
select_1_8:
  %60 = bitcast %Int16 4 to %Int16
  %61 = icmp eq %Int16 %3, %60
  br i1 %61, label %select_1_8_ok, label %select_1_9
select_1_8_ok:
  %62 = alloca %union.2
  store %union.2 %2, %union.2* %62, align 64
  %63 = getelementptr inbounds %union.2, %union.2* %62, i1 0, i32 1
  %64 = bitcast [40 x %Nat8]* %63 to %AstTypePointer*
  %65 = load %AstTypePointer, %AstTypePointer* %64
  %66 = call %Type* (%AstTypePointer) @func429 (%AstTypePointer %65)
  br label %select_1_end
select_1_9:
  %67 = bitcast %Int16 10 to %Int16
  %68 = icmp eq %Int16 %3, %67
  br i1 %68, label %select_1_9_ok, label %select_1_10
select_1_9_ok:
  %69 = alloca %union.2
  store %union.2 %2, %union.2* %69, align 64
  %70 = getelementptr inbounds %union.2, %union.2* %69, i1 0, i32 1
  %71 = bitcast [40 x %Nat8]* %70 to %AstTypeEnum*
  %72 = load %AstTypeEnum, %AstTypeEnum* %71
  %73 = call %Type* (%AstTypeEnum) @func435 (%AstTypeEnum %72)
  br label %select_1_end
select_1_10:
  %74 = call %Type* () @func414 ()
  br label %select_1_end
select_1_end:
  %75 = phi %Type* [ %10, %select_1_0_ok ], [ %17, %select_1_1_ok ], [ %24, %select_1_2_ok ], [ %31, %select_1_3_ok ], [ %38, %select_1_4_ok ], [ %45, %select_1_5_ok ], [ %52, %select_1_6_ok ], [ %59, %select_1_7_ok ], [ %66, %select_1_8_ok ], [ %73, %select_1_9_ok ], [ %74, %select_1_10 ]
  ret %Type* %75
}

define %Type* @type_new_or (%TokenInfo*) {
  %2 = call %Str () @name_union_get ()
  %3 = alloca %union.8
; write variant 1
  %4 = getelementptr inbounds %union.8, %union.8* %3, i1 0, i32 0
  store %Int16 1, %Int16* %4, align 2
; write data
  %5 = getelementptr inbounds %union.8, %union.8* %3, i1 0, i32 1
  %6 = bitcast [56 x %Nat8]* %5 to %TypeNo*
  store %TypeNo 0, %TypeNo* %6, align 2
  %7 = load %union.8, %union.8* %3
  %8 = call %Type* (%TypeKind, %union.8, %Nat32, %TokenInfo*) @func393 (%TypeKind 16, %union.8 %7, %Nat32 0, %TokenInfo* %0)
  %9 = bitcast %Type* %8 to %Unit*
  %10 = call i1 (%List*, %Unit*) @list_append (%List* @unions, %Unit* %9)
  %11 = getelementptr inbounds %Type, %Type* %8, i1 0, i32 14
  %12 = getelementptr inbounds %TypeUnion, %TypeUnion* %11, i1 0, i32 0
  call void (%List*) @map_init (%List* %12)
  %13 = getelementptr inbounds %Type, %Type* %8, i1 0, i32 2
  store %Str %2, %Str* %13, align 8
  ret %Type* %8
}

define %Type* @type_or_add (%Type*, %Type*) {
  %3 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 14
  %4 = getelementptr inbounds %TypeUnion, %TypeUnion* %3, i1 0, i32 0
  %5 = bitcast %Type* %1 to %Unit*
  %6 = call i1 (%List*, %Unit*) @list_append (%List* %4, %Unit* %5)
  %7 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 14
  %8 = getelementptr inbounds %TypeUnion, %TypeUnion* %7, i1 0, i32 2
  %9 = load %Nat32, %Nat32* %8
  %10 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 3
  %11 = load %Nat32, %Nat32* %10
  %12 = call %Nat32 (%Nat32, %Nat32) @max (%Nat32 %9, %Nat32 %11)
  %13 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 14
  %14 = getelementptr inbounds %TypeUnion, %TypeUnion* %13, i1 0, i32 2
  store %Nat32 %12, %Nat32* %14, align 4
  %15 = add %Nat32 %12, 2
  %16 = call %Nat32 (%Nat32, %Nat32) @align (%Nat32 %15, %Nat32 4)
  %17 = call %Nat32 (%Nat32) @propagation (%Nat32 %16)
  %18 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 3
  store %Nat32 %17, %Nat32* %18, align 4
  %19 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 4
  store %Nat32 %17, %Nat32* %19, align 4
  %20 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 14
  %21 = getelementptr inbounds %TypeUnion, %TypeUnion* %20, i1 0, i32 1; loadImmPtr
  %22 = inttoptr i64 0 to%Type*
  store %Type* %22, %Type** %21, align 8
  ret %Type* %0
}

define void @func418 (%Unit*, %Unit*, %Nat32, %Node*) {
  %5 = bitcast %Unit* %0 to %Type*
  %6 = bitcast %Unit* %1 to %Type*
  %7 = call %Type* (%Type*, %Type*) @type_or_add (%Type* %6, %Type* %5)
  ret void
}

define void @func419 (%Unit*, %Unit*, %Nat32, %Node*) {
  %5 = bitcast %Unit* %0 to %Type*
  %6 = bitcast %Unit* %1 to %Type*
  %7 = call %Type* (%Type*, %Type*) @type_or_add (%Type* %6, %Type* %5)
  ret void
}

define %Type* @type_union_merge (%Type*, %Type*, %TokenInfo*) {
  %4 = call %Type* (%TokenInfo*) @type_new_or (%TokenInfo* %2)
  %5 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 14
  %6 = getelementptr inbounds %TypeUnion, %TypeUnion* %5, i1 0, i32 0
  %7 = bitcast %Type* %4 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @func64 (%List* %6, %ListForeachHandler @func418, %Unit* %7)
  %8 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 14
  %9 = getelementptr inbounds %TypeUnion, %TypeUnion* %8, i1 0, i32 0
  %10 = bitcast %Type* %4 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @func64 (%List* %9, %ListForeachHandler @func419, %Unit* %10)
  ret %Type* %4
}

define %Type* @type_new_or2 (%Type*, %Type*, %TokenInfo*) {
  %4 = call %Type* (%TokenInfo*) @type_new_or (%TokenInfo* %2)
  %5 = call %Type* (%Type*, %Type*) @type_or_add (%Type* %4, %Type* %0)
  %6 = call %Type* (%Type*, %Type*) @type_or_add (%Type* %4, %Type* %1)
  %7 = call i1 (%Type*) @func412 (%Type* %4)
  br i1 %7, label %then_0, label %else_0
then_0:
  %8 = getelementptr inbounds %Type, %Type* %4, i1 0, i32 14
  %9 = getelementptr inbounds %TypeUnion, %TypeUnion* %8, i1 0, i32 1
  %10 = load %Type*, %Type** @typeFreePtr
  store %Type* %10, %Type** %9, align 8
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  ret %Type* %4
}

define %Type* @func421 (%AstTypeBinary) {
  %2 = extractvalue %AstTypeBinary %0, 0
  %3 = call %Type* (%union.2*) @func413 (%union.2* %2)
  %4 = extractvalue %AstTypeBinary %0, 1
  %5 = call %Type* (%union.2*) @func413 (%union.2* %4)
  %6 = getelementptr inbounds %Type, %Type* %3, i1 0, i32 0
  %7 = load %TypeKind, %TypeKind* %6
  %8 = icmp eq %TypeKind %7, 16
  %9 = getelementptr inbounds %Type, %Type* %5, i1 0, i32 0
  %10 = load %TypeKind, %TypeKind* %9
  %11 = icmp eq %TypeKind %10, 16
  %12 = and i1 %8, %11
  br i1 %12, label %then_0, label %else_0
then_0:
  %13 = getelementptr inbounds %Type, %Type* %3, i1 0, i32 1
  %14 = load %Nat32, %Nat32* %13
  %15 = icmp eq %Nat32 %14, 0
  %16 = getelementptr inbounds %Type, %Type* %5, i1 0, i32 1
  %17 = load %Nat32, %Nat32* %16
  %18 = icmp eq %Nat32 %17, 0
  %19 = and i1 %15, %18
  br i1 %19, label %then_1, label %else_1
then_1:
  %20 = extractvalue %AstTypeBinary %0, 2
  %21 = call %Type* (%Type*, %Type*, %TokenInfo*) @type_union_merge (%Type* %3, %Type* %5, %TokenInfo* %20)
  ret %Type* %21
  br label %endif_1
else_1:
  %23 = extractvalue %AstTypeBinary %0, 2
  %24 = call %Type* (%Type*, %Type*, %TokenInfo*) @type_new_or2 (%Type* %3, %Type* %5, %TokenInfo* %23)
  ret %Type* %24
  br label %endif_1
endif_1:
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %26 = getelementptr inbounds %Type, %Type* %3, i1 0, i32 0
  %27 = load %TypeKind, %TypeKind* %26
  %28 = icmp eq %TypeKind %27, 16
  br i1 %28, label %then_2, label %else_2
then_2:
  %29 = getelementptr inbounds %Type, %Type* %3, i1 0, i32 1
  %30 = load %Nat32, %Nat32* %29
  %31 = icmp eq %Nat32 %30, 0
  br i1 %31, label %then_3, label %else_3
then_3:
  br label %endif_3
else_3:
  br label %endif_3
endif_3:
  %32 = call %Type* (%Type*, %Type*) @type_or_add (%Type* %3, %Type* %5)
  ret %Type* %32
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
  %34 = getelementptr inbounds %Type, %Type* %5, i1 0, i32 0
  %35 = load %TypeKind, %TypeKind* %34
  %36 = icmp eq %TypeKind %35, 16
  br i1 %36, label %then_4, label %else_4
then_4:
  %37 = call %Type* (%Type*, %Type*) @type_or_add (%Type* %5, %Type* %3)
  ret %Type* %37
  br label %endif_4
else_4:
  br label %endif_4
endif_4:
  %39 = extractvalue %AstTypeBinary %0, 2
  %40 = call %Type* (%Type*, %Type*, %TokenInfo*) @type_new_or2 (%Type* %3, %Type* %5, %TokenInfo* %39)
  ret %Type* %40
}

define i1 @is_type_in_type_or (%Type*, %Type*) {
  %3 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 15
  %4 = getelementptr inbounds %TypeOr, %TypeOr* %3, i1 0, i32 0
  %5 = load %Type*, %Type** %4
  %6 = getelementptr inbounds %Type, %Type* %5, i1 0, i32 0
  %7 = load %TypeKind, %TypeKind* %6
  %8 = icmp eq %TypeKind %7, 6
  br i1 %8, label %then_0, label %else_0
then_0:
  %9 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 15
  %10 = getelementptr inbounds %TypeOr, %TypeOr* %9, i1 0, i32 0
  %11 = load %Type*, %Type** %10
  %12 = call i1 (%Type*, %Type*) @is_type_in_type_or (%Type* %11, %Type* %1)
  br i1 %12, label %then_1, label %else_1
then_1:
  ret i1 1
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %14 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 15
  %15 = getelementptr inbounds %TypeOr, %TypeOr* %14, i1 0, i32 1
  %16 = load %Type*, %Type** %15
  %17 = getelementptr inbounds %Type, %Type* %16, i1 0, i32 0
  %18 = load %TypeKind, %TypeKind* %17
  %19 = icmp eq %TypeKind %18, 6
  br i1 %19, label %then_2, label %else_2
then_2:
  %20 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 15
  %21 = getelementptr inbounds %TypeOr, %TypeOr* %20, i1 0, i32 1
  %22 = load %Type*, %Type** %21
  %23 = call i1 (%Type*, %Type*) @is_type_in_type_or (%Type* %22, %Type* %1)
  br i1 %23, label %then_3, label %else_3
then_3:
  ret i1 1
  br label %endif_3
else_3:
  br label %endif_3
endif_3:
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
  %25 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 15
  %26 = getelementptr inbounds %TypeOr, %TypeOr* %25, i1 0, i32 0
  %27 = load %Type*, %Type** %26
  %28 = call i1 (%Type*, %Type*) @func445 (%Type* %27, %Type* %1)
  %29 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 15
  %30 = getelementptr inbounds %TypeOr, %TypeOr* %29, i1 0, i32 1
  %31 = load %Type*, %Type** %30
  %32 = call i1 (%Type*, %Type*) @func445 (%Type* %31, %Type* %1)
  %33 = or i1 %28, %32
  br i1 %33, label %then_4, label %else_4
then_4:
  ret i1 1
  br label %endif_4
else_4:
  br label %endif_4
endif_4:
  ret i1 0
}

define %Type* @func423 (%AstTypeNewType) {
  %2 = extractvalue %AstTypeNewType %0, 0
  %3 = call %Type* (%union.2*) @func413 (%union.2* %2)
  %4 = extractvalue %AstTypeNewType %0, 1
  %5 = insertvalue %TypePoison zeroinitializer, %TokenInfo* %4, 0
  %6 = alloca %union.8
; write variant 15
  %7 = getelementptr inbounds %union.8, %union.8* %6, i1 0, i32 0
  store %Int16 15, %Int16* %7, align 2
; write data
  %8 = getelementptr inbounds %union.8, %union.8* %6, i1 0, i32 1
  %9 = bitcast [56 x %Nat8]* %8 to %TypePoison*
  store %TypePoison %5, %TypePoison* %9, align 8
  %10 = load %union.8, %union.8* %6
  %11 = extractvalue %AstTypeNewType %0, 1
  %12 = call %Type* (%TypeKind, %union.8, %Nat32, %TokenInfo*) @func393 (%TypeKind 2, %union.8 %10, %Nat32 0, %TokenInfo* %11)
  %13 = bitcast %Type* %12 to %Unit*
  %14 = bitcast %Type* %3 to %Unit*
  %15 = call %Unit* (%Unit*, %Unit*, %Nat32) @memcpy (%Unit* %13, %Unit* %14, %Nat32 384)
  %16 = getelementptr inbounds %Type, %Type* %12, i1 0, i32 1
  %17 = load %Nat32, %Nat32* @spec_type_uid
  store %Nat32 %17, %Nat32* %16, align 4
  %18 = load %Nat32, %Nat32* @spec_type_uid
  %19 = add %Nat32 %18, 1
  store %Nat32 %19, %Nat32* @spec_type_uid, align 4
  ret %Type* %12
}

define %Type* @func424 (%AstTypeVar) {
  %2 = extractvalue %AstTypeVar %0, 0
  %3 = call %Type* (%union.2*) @func413 (%union.2* %2)
  %4 = extractvalue %AstTypeVar %0, 1
  %5 = call %Type* (%Type*, %TokenInfo*) @type_var_new (%Type* %3, %TokenInfo* %4)
  ret %Type* %5
}

define %Type* @func425 (%AstName) {
  %2 = extractvalue %AstName %0, 0
  %3 = getelementptr inbounds %AstId, %AstId* %2, i1 0, i32 0
  %4 = load %Str, %Str* %3
  %5 = call %union.16 (%Str) @typeget (%Str %4)
  %6 = bitcast %Int64 0 to %Int64
  %7 = ptrtoint %union.16 %5 to %Int64
  %8 = icmp eq %Int64 %7, %6
  br i1 %8, label %then_0, label %else_0
then_0:
  %9 = extractvalue %AstName %0, 2
  %10 = insertvalue %TypeUndefined zeroinitializer, %TokenInfo* %9, 0
  %11 = alloca %union.8
; write variant 14
  %12 = getelementptr inbounds %union.8, %union.8* %11, i1 0, i32 0
  store %Int16 14, %Int16* %12, align 2
; write data
  %13 = getelementptr inbounds %union.8, %union.8* %11, i1 0, i32 1
  %14 = bitcast [56 x %Nat8]* %13 to %TypeUndefined*
  store %TypeUndefined %10, %TypeUndefined* %14, align 8
  %15 = load %union.8, %union.8* %11
  %16 = extractvalue %AstName %0, 2
  %17 = call %Type* (%TypeKind, %union.8, %Nat32, %TokenInfo*) @func393 (%TypeKind 1, %union.8 %15, %Nat32 0, %TokenInfo* %16)
  %18 = getelementptr inbounds %Type, %Type* %17, i1 0, i32 16
  %19 = extractvalue %AstName %0, 2
  store %TokenInfo* %19, %TokenInfo** %18, align 8
  call void (%Str, %Type*) @typebind (%Str %4, %Type* %17)
  ret %Type* %17
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %21 = bitcast %union.16 %5 to %Type*
  ret %Type* %21
}

define %Type* @func426 (%AstTypeFunc) {
  %2 = extractvalue %AstTypeFunc %0, 0
  %3 = call %Type* (%union.2*) @func413 (%union.2* %2)
  %4 = getelementptr inbounds %Type, %Type* %3, i1 0, i32 0
  %5 = load %TypeKind, %TypeKind* %4
  %6 = icmp eq %TypeKind %5, 2
  br i1 %6, label %then_0, label %else_0
then_0:
  ret %Type* %3
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %8 = extractvalue %AstTypeFunc %0, 1
  %9 = call %Type* (%union.2*) @func413 (%union.2* %8)
  %10 = getelementptr inbounds %Type, %Type* %9, i1 0, i32 0
  %11 = load %TypeKind, %TypeKind* %10
  %12 = icmp eq %TypeKind %11, 2
  br i1 %12, label %then_1, label %else_1
then_1:
  ret %Type* %9
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  %14 = extractvalue %AstTypeFunc %0, 3
  %15 = call %Type* (%Type*, %Type*, i1, %TokenInfo*) @func400 (%Type* %3, %Type* %9, i1 0, %TokenInfo* %14)
  ret %Type* %15
}

define %Type* @func427 (%AstTypeArrayU) {
  %2 = extractvalue %AstTypeArrayU %0, 0
  %3 = call %Type* (%union.2*) @func413 (%union.2* %2)
  %4 = getelementptr inbounds %Type, %Type* %3, i1 0, i32 0
  %5 = load %TypeKind, %TypeKind* %4
  %6 = icmp eq %TypeKind %5, 2
  br i1 %6, label %then_0, label %else_0
then_0:
  ret %Type* %3
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %8 = extractvalue %AstTypeArrayU %0, 1
  %9 = call %Type* (%Type*, %TokenInfo*) @func396 (%Type* %3, %TokenInfo* %8)
  ret %Type* %9
}

define %Type* @func428 (%AstTypeArray) {
  %2 = extractvalue %AstTypeArray %0, 0
  %3 = call %Type* (%union.2*) @func413 (%union.2* %2)
  %4 = getelementptr inbounds %Type, %Type* %3, i1 0, i32 0
  %5 = load %TypeKind, %TypeKind* %4
  %6 = icmp eq %TypeKind %5, 2
  br i1 %6, label %then_0, label %else_0
then_0:
  ret %Type* %3
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %8 = extractvalue %AstTypeArray %0, 1
  %9 = call %Value* (%union.4*, i1) @func477 (%union.4* %8, i1 0)
  %10 = getelementptr inbounds %Value, %Value* %9, i1 0, i32 1
  %11 = load %union.9, %union.9* %10
  %12 = extractvalue %union.9 %11, 0
  %13 = bitcast %Int16 40 to %Int16
  %14 = icmp eq %Int16 %12, %13
  br i1 %14, label %then_1, label %else_1
then_1:
  %15 = extractvalue %AstTypeArray %0, 2
  %16 = insertvalue %TypePoison zeroinitializer, %TokenInfo* %15, 0
  %17 = alloca %union.8
; write variant 15
  %18 = getelementptr inbounds %union.8, %union.8* %17, i1 0, i32 0
  store %Int16 15, %Int16* %18, align 2
; write data
  %19 = getelementptr inbounds %union.8, %union.8* %17, i1 0, i32 1
  %20 = bitcast [56 x %Nat8]* %19 to %TypePoison*
  store %TypePoison %16, %TypePoison* %20, align 8
  %21 = load %union.8, %union.8* %17
  %22 = extractvalue %AstTypeArray %0, 2
  %23 = call %Type* (%TypeKind, %union.8, %Nat32, %TokenInfo*) @func393 (%TypeKind 2, %union.8 %21, %Nat32 0, %TokenInfo* %22)
  ret %Type* %23
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  %25 = getelementptr inbounds %Value, %Value* %9, i1 0, i32 1
  %26 = load %union.9, %union.9* %25
  %27 = alloca %union.9
  store %union.9 %26, %union.9* %27, align 128
  %28 = getelementptr inbounds %union.9, %union.9* %27, i1 0, i32 1
  %29 = bitcast [72 x %Nat8]* %28 to %ValueImm*
  %30 = load %ValueImm, %ValueImm* %29
  %31 = extractvalue %ValueImm %30, 1
  %32 = trunc %Int64 %31 to %Nat32
  %33 = extractvalue %AstTypeArray %0, 2
  %34 = call %Type* (%Type*, %Nat32, %TokenInfo*) @func397 (%Type* %3, %Nat32 %32, %TokenInfo* %33)
  ret %Type* %34
}

define %Type* @func429 (%AstTypePointer) {
  %2 = extractvalue %AstTypePointer %0, 0
  %3 = call %Type* (%union.2*) @func413 (%union.2* %2)
  %4 = getelementptr inbounds %Type, %Type* %3, i1 0, i32 0
  %5 = load %TypeKind, %TypeKind* %4
  %6 = icmp eq %TypeKind %5, 2
  br i1 %6, label %then_0, label %else_0
then_0:
  ret %Type* %3
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %8 = extractvalue %AstTypePointer %0, 1
  %9 = call %Type* (%Type*, %TokenInfo*) @func395 (%Type* %3, %TokenInfo* %8)
  ret %Type* %9
}

define %Decl* @func430 (%AstId*, %Type*, %TokenInfo*) {
  %4 = call %Unit* (%Nat32) @malloc (%Nat32 48)
  %5 = bitcast %Unit* %4 to %Decl*; loadImmPtr
  %6 = inttoptr i64 0 to%Decl*
  %7 = icmp ne %Decl* %5, %6
  %8 = bitcast [22 x %Nat8]* @func430_str1 to %Str
  call void (i1, %Str) @assert (i1 %7, %Str %8)
  %9 = insertvalue %Decl zeroinitializer, %AstId* %0, 0
  %10 = insertvalue %Decl %9, %Type* %1, 1
  %11 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 4
  %12 = load %Nat32, %Nat32* %11
  %13 = insertvalue %Decl %10, %Nat32 %12, 2
  %14 = insertvalue %Decl %13, %TokenInfo* %2, 6
  store %Decl %14, %Decl* %5, align 8
  ret %Decl* %5
}

define void @func433 (%Unit*, %Unit*, %Nat32, %Node*) {
  %5 = bitcast %Unit* %0 to %AstId*
  %6 = bitcast %Unit* %1 to %func431_func432.type6*
  %7 = getelementptr inbounds %func431_func432.type6, %func431_func432.type6* %6, i1 0, i32 1
  %8 = load %Type*, %Type** %7
  %9 = getelementptr inbounds %AstId, %AstId* %5, i1 0, i32 1
  %10 = load %TokenInfo*, %TokenInfo** %9
  %11 = call %Decl* (%AstId*, %Type*, %TokenInfo*) @func430 (%AstId* %5, %Type* %8, %TokenInfo* %10)
  %12 = getelementptr inbounds %func431_func432.type6, %func431_func432.type6* %6, i1 0, i32 0
  %13 = load %List*, %List** %12
  %14 = bitcast %Decl* %11 to %Unit*
  %15 = call i1 (%List*, %Unit*) @list_append (%List* %13, %Unit* %14)
  ret void
}

define void @func432 (%Unit*, %Unit*, %Nat32, %Node*) {
  %5 = bitcast %Unit* %0 to %AstDecl*
  %6 = bitcast %Unit* %1 to %func431.type5*
  %7 = getelementptr inbounds %AstDecl, %AstDecl* %5, i1 0, i32 1
  %8 = load %union.2*, %union.2** %7
  %9 = call %Type* (%union.2*) @func413 (%union.2* %8)
  %10 = getelementptr inbounds %Type, %Type* %9, i1 0, i32 0
  %11 = load %TypeKind, %TypeKind* %10
  %12 = icmp eq %TypeKind %11, 2
  br i1 %12, label %then_0, label %else_0
then_0:
  %13 = bitcast [14 x %Nat8]* @func431_func432_str1 to %Str
  %14 = getelementptr inbounds %Type, %Type* %9, i1 0, i32 16
  %15 = load %TokenInfo*, %TokenInfo** %14
  call void (%Str, %TokenInfo*) @error (%Str %13, %TokenInfo* %15)
  %16 = getelementptr inbounds %func431.type5, %func431.type5* %6, i1 0, i32 1
  store i1 1, i1* %16, align 1
ret void
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %18 = alloca %func431_func432.type6
  %19 = getelementptr inbounds %func431.type5, %func431.type5* %6, i1 0, i32 0
  %20 = load %List*, %List** %19
  %21 = insertvalue %func431_func432.type6 zeroinitializer, %List* %20, 0
  %22 = insertvalue %func431_func432.type6 %21, %Type* %9, 1
  store %func431_func432.type6 %22, %func431_func432.type6* %18, align 8
  %23 = getelementptr inbounds %AstDecl, %AstDecl* %5, i1 0, i32 0
  %24 = getelementptr inbounds %func431_func432.type6, %func431_func432.type6* %18, i1 0
  %25 = bitcast %func431_func432.type6* %24 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @func64 (%List* %23, %ListForeachHandler @func433, %Unit* %25)
  ret void
}

define void @func434 (%Unit*, %Unit*, %Nat32, %Node*) {
  %5 = bitcast %Unit* %0 to %Decl*
  %6 = getelementptr inbounds %Decl, %Decl* %5, i1 0, i32 1
  %7 = load %Type*, %Type** %6
  %8 = getelementptr inbounds %Type, %Type* %7, i1 0, i32 0
  %9 = load %TypeKind, %TypeKind* %8
  %10 = icmp eq %TypeKind %9, 1
  br i1 %10, label %then_0, label %else_0
then_0:
  %11 = bitcast [16 x %Nat8]* @func431_func434_str1 to %Str
  %12 = getelementptr inbounds %Decl, %Decl* %5, i1 0, i32 1
  %13 = load %Type*, %Type** %12
  %14 = getelementptr inbounds %Type, %Type* %13, i1 0, i32 16
  %15 = load %TokenInfo*, %TokenInfo** %14
  call void (%Str, %TokenInfo*) @error (%Str %11, %TokenInfo* %15)
ret void
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %17 = bitcast %Unit* %1 to %Type*
  %18 = getelementptr inbounds %Decl, %Decl* %5, i1 0, i32 3
  %19 = trunc %Nat32 %2 to %Nat16
  store %Nat16 %19, %Nat16* %18, align 2
  %20 = getelementptr inbounds %Type, %Type* %17, i1 0, i32 4
  %21 = load %Nat32, %Nat32* %20
  %22 = getelementptr inbounds %Decl, %Decl* %5, i1 0, i32 1
  %23 = load %Type*, %Type** %22
  %24 = getelementptr inbounds %Type, %Type* %23, i1 0, i32 4
  %25 = load %Nat32, %Nat32* %24
  %26 = icmp ult %Nat32 %21, %25
  br i1 %26, label %then_1, label %else_1
then_1:
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
  %32 = getelementptr inbounds %Type, %Type* %17, i1 0, i32 3
  %33 = load %Nat32, %Nat32* %32
  %34 = getelementptr inbounds %Type, %Type* %17, i1 0, i32 11
  %35 = getelementptr inbounds %TypeRecord, %TypeRecord* %34, i1 0, i32 1
  %36 = load %Nat32, %Nat32* %35
  %37 = sub %Nat32 %33, %36
  %38 = getelementptr inbounds %Decl, %Decl* %5, i1 0, i32 1
  %39 = load %Type*, %Type** %38
  %40 = getelementptr inbounds %Type, %Type* %39, i1 0, i32 4
  %41 = load %Nat32, %Nat32* %40
  %42 = icmp eq %Nat32 %41, 0
  br i1 %42, label %then_2, label %else_2
then_2:
  %43 = bitcast [11 x %Nat8]* @func431_func434_str2 to %Str
  %44 = getelementptr inbounds %Decl, %Decl* %5, i1 0, i32 1
  %45 = load %Type*, %Type** %44
  %46 = getelementptr inbounds %Type, %Type* %45, i1 0, i32 16
  %47 = load %TokenInfo*, %TokenInfo** %46
  call void (%Str, %TokenInfo*) @error (%Str %43, %TokenInfo* %47)
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
  %48 = getelementptr inbounds %Type, %Type* %17, i1 0, i32 11
  %49 = getelementptr inbounds %TypeRecord, %TypeRecord* %48, i1 0, i32 1
  %50 = load %Nat32, %Nat32* %49
  %51 = getelementptr inbounds %Decl, %Decl* %5, i1 0, i32 1
  %52 = load %Type*, %Type** %51
  %53 = getelementptr inbounds %Type, %Type* %52, i1 0, i32 4
  %54 = load %Nat32, %Nat32* %53
  %55 = call %Nat32 (%Nat32, %Nat32) @align (%Nat32 %50, %Nat32 %54)
  %56 = getelementptr inbounds %Decl, %Decl* %5, i1 0, i32 1
  %57 = load %Type*, %Type** %56
  %58 = getelementptr inbounds %Type, %Type* %57, i1 0, i32 3
  %59 = load %Nat32, %Nat32* %58
  %60 = add %Nat32 %55, %59
  %61 = getelementptr inbounds %Type, %Type* %17, i1 0, i32 11
  %62 = getelementptr inbounds %TypeRecord, %TypeRecord* %61, i1 0, i32 1
  store %Nat32 %60, %Nat32* %62, align 4
  %63 = getelementptr inbounds %Type, %Type* %17, i1 0, i32 3
  %64 = load %Nat32, %Nat32* %63
  %65 = icmp ugt %Nat32 %60, %64
  br i1 %65, label %then_3, label %else_3
then_3:
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

define %Type* @func431 (%AstTypeRecord) {
  %2 = load %Type*, %Type** @ctype
  %3 = alloca %union.8
; write variant 1
  %4 = getelementptr inbounds %union.8, %union.8* %3, i1 0, i32 0
  store %Int16 1, %Int16* %4, align 2
; write data
  %5 = getelementptr inbounds %union.8, %union.8* %3, i1 0, i32 1
  %6 = bitcast [56 x %Nat8]* %5 to %TypeNo*
  store %TypeNo 0, %TypeNo* %6, align 2
  %7 = load %union.8, %union.8* %3
  %8 = extractvalue %AstTypeRecord %0, 1
  %9 = call %Type* (%TypeKind, %union.8, %Nat32, %TokenInfo*) @func393 (%TypeKind 12, %union.8 %7, %Nat32 0, %TokenInfo* %8)
  store %Type* %9, %Type** @ctype, align 8
  %10 = alloca %func431.type5
  %11 = call %List* () @map_new ()
  %12 = insertvalue %func431.type5 zeroinitializer, %List* %11, 0
  %13 = insertvalue %func431.type5 %12, i1 0, 1
  store %func431.type5 %13, %func431.type5* %10, align 8
  %14 = alloca %List
  %15 = extractvalue %AstTypeRecord %0, 0
  store %List %15, %List* %14, align 8
  %16 = getelementptr inbounds %List, %List* %14, i1 0
  %17 = getelementptr inbounds %func431.type5, %func431.type5* %10, i1 0
  %18 = bitcast %func431.type5* %17 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @func64 (%List* %16, %ListForeachHandler @func432, %Unit* %18)
  store %Type* %2, %Type** @ctype, align 8
  %19 = getelementptr inbounds %Type, %Type* %9, i1 0, i32 11
  %20 = getelementptr inbounds %TypeRecord, %TypeRecord* %19, i1 0, i32 0
  %21 = getelementptr inbounds %func431.type5, %func431.type5* %10, i1 0, i32 0
  %22 = load %List*, %List** %21
  store %List* %22, %List** %20, align 8
  %23 = getelementptr inbounds %Type, %Type* %9, i1 0, i32 11
  %24 = getelementptr inbounds %TypeRecord, %TypeRecord* %23, i1 0, i32 0
  %25 = load %List*, %List** %24
  %26 = bitcast %Type* %9 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @func64 (%List* %25, %ListForeachHandler @func434, %Unit* %26)
  ret %Type* %9
}

define void @func436 (%Unit*, %Unit*, %Nat32, %Node*) {
  %5 = bitcast %Unit* %0 to %AstId*
  %6 = bitcast %Unit* %1 to %List*
  %7 = call %Unit* (%Nat32) @malloc (%Nat32 24)
  %8 = bitcast %Unit* %7 to %EnumConstructor*
  %9 = insertvalue %EnumConstructor zeroinitializer, %AstId* %5, 0
  %10 = insertvalue %EnumConstructor %9, %Nat32 %2, 1
  %11 = getelementptr inbounds %AstId, %AstId* %5, i1 0, i32 1
  %12 = load %TokenInfo*, %TokenInfo** %11
  %13 = insertvalue %EnumConstructor %10, %TokenInfo* %12, 2
  store %EnumConstructor %13, %EnumConstructor* %8, align 8
  %14 = bitcast %EnumConstructor* %8 to %Unit*
  %15 = call i1 (%List*, %Unit*) @list_append (%List* %6, %Unit* %14)
  ret void
}

define %Type* @func435 (%AstTypeEnum) {
  %2 = call %List* () @map_new ()
  %3 = alloca %List
  %4 = extractvalue %AstTypeEnum %0, 0
  store %List %4, %List* %3, align 8
  %5 = getelementptr inbounds %List, %List* %3, i1 0
  %6 = bitcast %List* %2 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @func64 (%List* %5, %ListForeachHandler @func436, %Unit* %6)
  %7 = extractvalue %AstTypeEnum %0, 1
  %8 = call %Type* (%List*, %TokenInfo*) @func398 (%List* %2, %TokenInfo* %7)
  ret %Type* %8
}

define i1 @type_eq_numeric (%TypeNumeric, %TypeNumeric) {
  %3 = extractvalue %TypeNumeric %0, 0
  %4 = extractvalue %TypeNumeric %1, 0
  %5 = icmp eq %Nat32 %3, %4
  %6 = extractvalue %TypeNumeric %0, 1
  %7 = extractvalue %TypeNumeric %1, 1
  %8 = icmp eq i1 %6, %7
  %9 = and i1 %5, %8
  ret i1 %9
}

define i1 @type_eq_array (%TypeArray, %TypeArray) {
  %3 = extractvalue %TypeArray %0, 1
  %4 = extractvalue %TypeArray %1, 1
  %5 = icmp eq %Nat32 %3, %4
  %6 = extractvalue %TypeArray %0, 0
  %7 = extractvalue %TypeArray %1, 0
  %8 = call i1 (%Type*, %Type*) @func445 (%Type* %6, %Type* %7)
  %9 = and i1 %5, %8
  ret i1 %9
}

define i1 @type_eq_func (%TypeFunc, %TypeFunc) {
  %3 = extractvalue %TypeFunc %0, 0
  %4 = extractvalue %TypeFunc %1, 0
  %5 = call i1 (%Type*, %Type*) @func445 (%Type* %3, %Type* %4)
  %6 = extractvalue %TypeFunc %0, 1
  %7 = extractvalue %TypeFunc %1, 1
  %8 = call i1 (%Type*, %Type*) @func445 (%Type* %6, %Type* %7)
  %9 = and i1 %5, %8
  ret i1 %9
}

define i1 @func441 (%Unit*, %Unit*, %Unit*, %Nat32) {
  %5 = bitcast %Unit* %0 to %Decl*
  %6 = bitcast %Unit* %1 to %Decl*
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
  ret i1 0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %18 = getelementptr inbounds %Decl, %Decl* %5, i1 0, i32 1
  %19 = load %Type*, %Type** %18
  %20 = getelementptr inbounds %Decl, %Decl* %6, i1 0, i32 1
  %21 = load %Type*, %Type** %20
  %22 = call i1 (%Type*, %Type*) @func445 (%Type* %19, %Type* %21)
  ret i1 %22
}

define i1 @type_eq_record (%TypeRecord, %TypeRecord) {
  %3 = extractvalue %TypeRecord %0, 0
  %4 = extractvalue %TypeRecord %1, 0; loadImmPtr
  %5 = inttoptr i64 0 to%Unit*
  %6 = call i1 (%List*, %List*, %ListCompareHandler, %Unit*) @list_compare (%List* %3, %List* %4, %ListCompareHandler @func441, %Unit* %5)
  ret i1 %6
}

define i1 @func443 (%Unit*, %Unit*, %Unit*, %Nat32) {
  %5 = bitcast %Unit* %0 to %Type*
  %6 = bitcast %Unit* %1 to %Type*
  %7 = call i1 (%Type*, %Type*) @func445 (%Type* %5, %Type* %6)
  ret i1 %7
}

define i1 @type_eq_union (%TypeUnion, %TypeUnion) {
  %3 = extractvalue %TypeUnion %0, 0
  %4 = extractvalue %List %3, 2
  %5 = extractvalue %TypeUnion %1, 0
  %6 = extractvalue %List %5, 2
  %7 = icmp ne %Nat64 %4, %6
  br i1 %7, label %then_0, label %else_0
then_0:
  ret i1 0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %9 = alloca %List
  %10 = extractvalue %TypeUnion %0, 0
  store %List %10, %List* %9, align 8
  %11 = alloca %List
  %12 = extractvalue %TypeUnion %1, 0
  store %List %12, %List* %11, align 8
  %13 = getelementptr inbounds %List, %List* %9, i1 0
  %14 = getelementptr inbounds %List, %List* %11, i1 0; loadImmPtr
  %15 = inttoptr i64 0 to%Unit*
  %16 = call i1 (%List*, %List*, %ListCompareHandler, %Unit*) @list_compare (%List* %13, %List* %14, %ListCompareHandler @func443, %Unit* %15)
  ret i1 %16
}

define i1 @type_eq_or (%TypeOr, %TypeOr) {
  %3 = extractvalue %TypeOr %0, 0
  %4 = extractvalue %TypeOr %1, 0
  %5 = call i1 (%Type*, %Type*) @func445 (%Type* %3, %Type* %4)
  %6 = extractvalue %TypeOr %0, 1
  %7 = extractvalue %TypeOr %1, 1
  %8 = call i1 (%Type*, %Type*) @func445 (%Type* %6, %Type* %7)
  %9 = and i1 %5, %8
  ret i1 %9
}

define i1 @func445 (%Type*, %Type*) {
  %3 = icmp eq %Type* %0, %1
  br i1 %3, label %then_0, label %else_0
then_0:
  ret i1 1
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %5 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 1
  %6 = load %Nat32, %Nat32* %5
  %7 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 1
  %8 = load %Nat32, %Nat32* %7
  %9 = icmp ne %Nat32 %6, %8
  br i1 %9, label %then_1, label %else_1
then_1:
  ret i1 0
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  %11 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 1
  %12 = load %Nat32, %Nat32* %11
  %13 = icmp ugt %Nat32 %12, 0
  br i1 %13, label %then_2, label %else_2
then_2:
  ret i1 1
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
  %15 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 0
  %16 = load %TypeKind, %TypeKind* %15
  %17 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 0
  %18 = load %TypeKind, %TypeKind* %17
  %19 = icmp ne %TypeKind %16, %18
  br i1 %19, label %then_3, label %else_3
then_3:
  ret i1 0
  br label %endif_3
else_3:
  br label %endif_3
endif_3:
  %21 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 0
  %22 = load %TypeKind, %TypeKind* %21
  br label %select_1_0
select_1_0:
  %23 = icmp eq %TypeKind %22, 5
  br i1 %23, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %24 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 6
  %25 = load %TypeNumeric, %TypeNumeric* %24
  %26 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 6
  %27 = load %TypeNumeric, %TypeNumeric* %26
  %28 = call i1 (%TypeNumeric, %TypeNumeric) @type_eq_numeric (%TypeNumeric %25, %TypeNumeric %27)
  br label %select_1_end
select_1_1:
  %29 = icmp eq %TypeKind %22, 8
  br i1 %29, label %select_1_1_ok, label %select_1_2
select_1_1_ok:
  %30 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 13
  %31 = getelementptr inbounds %TypeVar, %TypeVar* %30, i1 0, i32 0
  %32 = load %Type*, %Type** %31
  %33 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 13
  %34 = getelementptr inbounds %TypeVar, %TypeVar* %33, i1 0, i32 0
  %35 = load %Type*, %Type** %34
  %36 = call i1 (%Type*, %Type*) @func445 (%Type* %32, %Type* %35)
  br label %select_1_end
select_1_2:
  %37 = icmp eq %TypeKind %22, 13
  br i1 %37, label %select_1_2_ok, label %select_1_3
select_1_2_ok:
  %38 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 8
  %39 = getelementptr inbounds %TypePointer, %TypePointer* %38, i1 0, i32 0
  %40 = load %Type*, %Type** %39
  %41 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 8
  %42 = getelementptr inbounds %TypePointer, %TypePointer* %41, i1 0, i32 0
  %43 = load %Type*, %Type** %42
  %44 = call i1 (%Type*, %Type*) @func445 (%Type* %40, %Type* %43)
  br label %select_1_end
select_1_3:
  %45 = icmp eq %TypeKind %22, 14
  br i1 %45, label %select_1_3_ok, label %select_1_4
select_1_3_ok:
  %46 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 9
  %47 = load %TypeArray, %TypeArray* %46
  %48 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 9
  %49 = load %TypeArray, %TypeArray* %48
  %50 = call i1 (%TypeArray, %TypeArray) @type_eq_array (%TypeArray %47, %TypeArray %49)
  br label %select_1_end
select_1_4:
  %51 = icmp eq %TypeKind %22, 15
  br i1 %51, label %select_1_4_ok, label %select_1_5
select_1_4_ok:
  %52 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 10
  %53 = getelementptr inbounds %TypeArrayU, %TypeArrayU* %52, i1 0, i32 0
  %54 = load %Type*, %Type** %53
  %55 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 10
  %56 = getelementptr inbounds %TypeArrayU, %TypeArrayU* %55, i1 0, i32 0
  %57 = load %Type*, %Type** %56
  %58 = call i1 (%Type*, %Type*) @func445 (%Type* %54, %Type* %57)
  br label %select_1_end
select_1_5:
  %59 = icmp eq %TypeKind %22, 10
  br i1 %59, label %select_1_5_ok, label %select_1_6
select_1_5_ok:
  %60 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 7
  %61 = load %TypeFunc, %TypeFunc* %60
  %62 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 7
  %63 = load %TypeFunc, %TypeFunc* %62
  %64 = call i1 (%TypeFunc, %TypeFunc) @type_eq_func (%TypeFunc %61, %TypeFunc %63)
  br label %select_1_end
select_1_6:
  %65 = icmp eq %TypeKind %22, 12
  br i1 %65, label %select_1_6_ok, label %select_1_7
select_1_6_ok:
  %66 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 11
  %67 = load %TypeRecord, %TypeRecord* %66
  %68 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 11
  %69 = load %TypeRecord, %TypeRecord* %68
  %70 = call i1 (%TypeRecord, %TypeRecord) @type_eq_record (%TypeRecord %67, %TypeRecord %69)
  br label %select_1_end
select_1_7:
  %71 = icmp eq %TypeKind %22, 16
  br i1 %71, label %select_1_7_ok, label %select_1_8
select_1_7_ok:
  %72 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 14
  %73 = load %TypeUnion, %TypeUnion* %72
  %74 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 14
  %75 = load %TypeUnion, %TypeUnion* %74
  %76 = call i1 (%TypeUnion, %TypeUnion) @type_eq_union (%TypeUnion %73, %TypeUnion %75)
  br label %select_1_end
select_1_8:
  %77 = icmp eq %TypeKind %22, 6
  br i1 %77, label %select_1_8_ok, label %select_1_9
select_1_8_ok:
  %78 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 15
  %79 = load %TypeOr, %TypeOr* %78
  %80 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 15
  %81 = load %TypeOr, %TypeOr* %80
  %82 = call i1 (%TypeOr, %TypeOr) @type_eq_or (%TypeOr %79, %TypeOr %81)
  br label %select_1_end
select_1_9:
  %83 = icmp eq %TypeKind %22, 11
  br i1 %83, label %select_1_9_ok, label %select_1_10
select_1_9_ok:
  %84 = bitcast i1 0 to i1
  br label %select_1_end
select_1_10:
  %85 = icmp eq %TypeKind %22, 9
  br i1 %85, label %select_1_10_ok, label %select_1_11
select_1_10_ok:
  %86 = bitcast i1 1 to i1
  br label %select_1_end
select_1_11:
  %87 = bitcast i1 0 to i1
  br label %select_1_end
select_1_end:
  %88 = phi i1 [ %28, %select_1_0_ok ], [ %36, %select_1_1_ok ], [ %44, %select_1_2_ok ], [ %50, %select_1_3_ok ], [ %58, %select_1_4_ok ], [ %64, %select_1_5_ok ], [ %70, %select_1_6_ok ], [ %76, %select_1_7_ok ], [ %82, %select_1_8_ok ], [ %84, %select_1_9_ok ], [ %86, %select_1_10_ok ], [ %87, %select_1_11 ]
  ret i1 %88
}

define i1 @type_check (%Type*, %Type*, %TokenInfo*) {
  %4 = call i1 (%Type*, %Type*) @func445 (%Type* %0, %Type* %1)
  %5 = xor i1 %4, 1
  br i1 %5, label %then_0, label %else_0
then_0:
  call void (%TokenInfo*, %Type*, %Type*) @error_type_error (%TokenInfo* %2, %Type* %1, %Type* %0)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  ret i1 %4
}

define %Type* @func448 (%Str, %Nat32, i1) {
  %4 = udiv %Nat32 %1, 8
  %5 = insertvalue %TypeNumeric zeroinitializer, %Nat32 %1, 0
  %6 = insertvalue %TypeNumeric %5, i1 %2, 1
  %7 = alloca %union.8
; write variant 11
  %8 = getelementptr inbounds %union.8, %union.8* %7, i1 0, i32 0
  store %Int16 11, %Int16* %8, align 2
; write data
  %9 = getelementptr inbounds %union.8, %union.8* %7, i1 0, i32 1
  %10 = bitcast [56 x %Nat8]* %9 to %TypeNumeric*
  store %TypeNumeric %6, %TypeNumeric* %10, align 8
  %11 = load %union.8, %union.8* %7; loadImmPtr
  %12 = inttoptr i64 0 to%TokenInfo*
  %13 = call %Type* (%TypeKind, %union.8, %Nat32, %TokenInfo*) @func393 (%TypeKind 5, %union.8 %11, %Nat32 %4, %TokenInfo* %12)
  %14 = getelementptr inbounds %Type, %Type* %13, i1 0, i32 2
  store %Str %0, %Str* %14, align 8
  %15 = getelementptr inbounds %Type, %Type* %13, i1 0, i32 6
  %16 = insertvalue %TypeNumeric zeroinitializer, %Nat32 %1, 0
  %17 = insertvalue %TypeNumeric %16, i1 %2, 1
  store %TypeNumeric %17, %TypeNumeric* %15, align 8
  ret %Type* %13
}

define void @func447 () {
  %1 = call %List* () @map_new (); loadImmPtr
  %2 = inttoptr i64 0 to%TokenInfo*
  %3 = call %Type* (%List*, %TokenInfo*) @func398 (%List* %1, %TokenInfo* %2)
  store %Type* %3, %Type** @typeVoid, align 8
  %4 = load %Type*, %Type** @typeVoid
  %5 = getelementptr inbounds %Type, %Type* %4, i1 0, i32 2
  %6 = bitcast [5 x %Nat8]* @func447_str1 to %Str
  store %Str %6, %Str* %5, align 8
  %7 = bitcast [5 x %Nat8]* @func447_str2 to %Str
  %8 = load %Type*, %Type** @typeVoid
  call void (%Str, %Type*) @typebind (%Str %7, %Type* %8)
  %9 = call %List* () @map_new ()
  %10 = insertvalue %TypeRecord zeroinitializer, %List* %9, 0
  %11 = alloca %union.8
; write variant 5
  %12 = getelementptr inbounds %union.8, %union.8* %11, i1 0, i32 0
  store %Int16 5, %Int16* %12, align 2
; write data
  %13 = getelementptr inbounds %union.8, %union.8* %11, i1 0, i32 1
  %14 = bitcast [56 x %Nat8]* %13 to %TypeRecord*
  store %TypeRecord %10, %TypeRecord* %14, align 8
  %15 = load %union.8, %union.8* %11; loadImmPtr
  %16 = inttoptr i64 0 to%TokenInfo*
  %17 = call %Type* (%TypeKind, %union.8, %Nat32, %TokenInfo*) @func393 (%TypeKind 12, %union.8 %15, %Nat32 0, %TokenInfo* %16)
  store %Type* %17, %Type** @typeUnit, align 8
  %18 = load %Type*, %Type** @typeUnit
  %19 = getelementptr inbounds %Type, %Type* %18, i1 0, i32 11
  %20 = insertvalue %TypeRecord zeroinitializer, %List* %9, 0
  store %TypeRecord %20, %TypeRecord* %19, align 8
  %21 = load %Type*, %Type** @typeUnit
  %22 = getelementptr inbounds %Type, %Type* %21, i1 0, i32 2
  %23 = bitcast [5 x %Nat8]* @func447_str3 to %Str
  store %Str %23, %Str* %22, align 8
  %24 = bitcast [5 x %Nat8]* @func447_str4 to %Str
  %25 = load %Type*, %Type** @typeUnit
  call void (%Str, %Type*) @typebind (%Str %24, %Type* %25); loadImmPtr
  %26 = inttoptr i64 0 to%TokenInfo*
  %27 = insertvalue %TypeBool zeroinitializer, %TokenInfo* %26, 0
  %28 = alloca %union.8
; write variant 8
  %29 = getelementptr inbounds %union.8, %union.8* %28, i1 0, i32 0
  store %Int16 8, %Int16* %29, align 2
; write data
  %30 = getelementptr inbounds %union.8, %union.8* %28, i1 0, i32 1
  %31 = bitcast [56 x %Nat8]* %30 to %TypeBool*
  store %TypeBool %27, %TypeBool* %31, align 8
  %32 = load %union.8, %union.8* %28; loadImmPtr
  %33 = inttoptr i64 0 to%TokenInfo*
  %34 = call %Type* (%TypeKind, %union.8, %Nat32, %TokenInfo*) @func393 (%TypeKind 9, %union.8 %32, %Nat32 1, %TokenInfo* %33)
  store %Type* %34, %Type** @typeBool, align 8
  %35 = bitcast [5 x %Nat8]* @func447_str5 to %Str
  %36 = load %Type*, %Type** @typeBool
  call void (%Str, %Type*) @typebind (%Str %35, %Type* %36)
  %37 = bitcast [5 x %Nat8]* @func447_str6 to %Str
  %38 = call %Type* (%Str, %Nat32, i1) @func448 (%Str %37, %Nat32 8, i1 1)
  %39 = bitcast [6 x %Nat8]* @func447_str7 to %Str
  %40 = call %Type* (%Str, %Nat32, i1) @func448 (%Str %39, %Nat32 16, i1 1)
  %41 = bitcast [6 x %Nat8]* @func447_str8 to %Str
  %42 = call %Type* (%Str, %Nat32, i1) @func448 (%Str %41, %Nat32 32, i1 1)
  %43 = bitcast [6 x %Nat8]* @func447_str9 to %Str
  %44 = call %Type* (%Str, %Nat32, i1) @func448 (%Str %43, %Nat32 64, i1 1)
  %45 = bitcast [7 x %Nat8]* @func447_str10 to %Str
  %46 = call %Type* (%Str, %Nat32, i1) @func448 (%Str %45, %Nat32 128, i1 1)
  %47 = bitcast [7 x %Nat8]* @func447_str11 to %Str
  %48 = call %Type* (%Str, %Nat32, i1) @func448 (%Str %47, %Nat32 256, i1 1)
  %49 = bitcast [7 x %Nat8]* @func447_str12 to %Str
  %50 = call %Type* (%Str, %Nat32, i1) @func448 (%Str %49, %Nat32 512, i1 1)
  %51 = bitcast [8 x %Nat8]* @func447_str13 to %Str
  %52 = call %Type* (%Str, %Nat32, i1) @func448 (%Str %51, %Nat32 1024, i1 1)
  %53 = bitcast [5 x %Nat8]* @func447_str14 to %Str
  %54 = call %Type* (%Str, %Nat32, i1) @func448 (%Str %53, %Nat32 8, i1 0)
  %55 = bitcast [6 x %Nat8]* @func447_str15 to %Str
  %56 = call %Type* (%Str, %Nat32, i1) @func448 (%Str %55, %Nat32 16, i1 0)
  %57 = bitcast [6 x %Nat8]* @func447_str16 to %Str
  %58 = call %Type* (%Str, %Nat32, i1) @func448 (%Str %57, %Nat32 32, i1 0)
  %59 = bitcast [6 x %Nat8]* @func447_str17 to %Str
  %60 = call %Type* (%Str, %Nat32, i1) @func448 (%Str %59, %Nat32 64, i1 0)
  %61 = bitcast [7 x %Nat8]* @func447_str18 to %Str
  %62 = call %Type* (%Str, %Nat32, i1) @func448 (%Str %61, %Nat32 128, i1 0)
  %63 = bitcast [7 x %Nat8]* @func447_str19 to %Str
  %64 = call %Type* (%Str, %Nat32, i1) @func448 (%Str %63, %Nat32 256, i1 0)
  %65 = bitcast [7 x %Nat8]* @func447_str20 to %Str
  %66 = call %Type* (%Str, %Nat32, i1) @func448 (%Str %65, %Nat32 512, i1 0)
  %67 = bitcast [8 x %Nat8]* @func447_str21 to %Str
  %68 = call %Type* (%Str, %Nat32, i1) @func448 (%Str %67, %Nat32 1024, i1 0)
  %69 = bitcast [6 x %Nat8]* @func447_str22 to %Str
  call void (%Str, %Type*) @typebind (%Str %69, %Type* %44)
  %70 = bitcast [6 x %Nat8]* @func447_str23 to %Str
  call void (%Str, %Type*) @typebind (%Str %70, %Type* %60)
  %71 = bitcast [6 x %Nat8]* @func447_str24 to %Str
  call void (%Str, %Type*) @typebind (%Str %71, %Type* %42)
  %72 = bitcast [6 x %Nat8]* @func447_str25 to %Str
  call void (%Str, %Type*) @typebind (%Str %72, %Type* %58)
  %73 = bitcast [5 x %Nat8]* @func447_str26 to %Str
  call void (%Str, %Type*) @typebind (%Str %73, %Type* %38)
  %74 = bitcast [5 x %Nat8]* @func447_str27 to %Str
  call void (%Str, %Type*) @typebind (%Str %74, %Type* %54)
  %75 = bitcast [6 x %Nat8]* @func447_str28 to %Str
  call void (%Str, %Type*) @typebind (%Str %75, %Type* %40)
  %76 = bitcast [6 x %Nat8]* @func447_str29 to %Str
  call void (%Str, %Type*) @typebind (%Str %76, %Type* %56)
  store %Type* %54, %Type** @typeChar, align 8
  %77 = load %Type*, %Type** @typeChar; loadImmPtr
  %78 = inttoptr i64 0 to%TokenInfo*
  %79 = call %Type* (%Type*, %TokenInfo*) @func396 (%Type* %77, %TokenInfo* %78)
  store %Type* %79, %Type** @typeStr, align 8
  %80 = load %Type*, %Type** @typeStr
  %81 = getelementptr inbounds %Type, %Type* %80, i1 0, i32 2
  %82 = bitcast [4 x %Nat8]* @func447_str30 to %Str
  store %Str %82, %Str* %81, align 8
  %83 = bitcast [4 x %Nat8]* @func447_str31 to %Str
  %84 = load %Type*, %Type** @typeStr
  call void (%Str, %Type*) @typebind (%Str %83, %Type* %84)
  %85 = bitcast [7 x %Nat8]* @func447_str32 to %Str
  call void (%Str, %Type*) @typebind (%Str %85, %Type* %46)
  %86 = bitcast [7 x %Nat8]* @func447_str33 to %Str
  call void (%Str, %Type*) @typebind (%Str %86, %Type* %48)
  %87 = bitcast [7 x %Nat8]* @func447_str34 to %Str
  call void (%Str, %Type*) @typebind (%Str %87, %Type* %50)
  %88 = bitcast [8 x %Nat8]* @func447_str35 to %Str
  call void (%Str, %Type*) @typebind (%Str %88, %Type* %52)
  %89 = bitcast [7 x %Nat8]* @func447_str36 to %Str
  call void (%Str, %Type*) @typebind (%Str %89, %Type* %62)
  %90 = bitcast [7 x %Nat8]* @func447_str37 to %Str
  call void (%Str, %Type*) @typebind (%Str %90, %Type* %64)
  %91 = bitcast [7 x %Nat8]* @func447_str38 to %Str
  call void (%Str, %Type*) @typebind (%Str %91, %Type* %66)
  %92 = bitcast [8 x %Nat8]* @func447_str39 to %Str
  call void (%Str, %Type*) @typebind (%Str %92, %Type* %68)
  %93 = load %Type*, %Type** @typeUnit; loadImmPtr
  %94 = inttoptr i64 0 to%TokenInfo*
  %95 = call %Type* (%Type*, %TokenInfo*) @func395 (%Type* %93, %TokenInfo* %94)
  store %Type* %95, %Type** @typeFreePtr, align 8
  %96 = bitcast [8 x %Nat8]* @func447_str40 to %Str
  %97 = call %Type* (%Str, %Nat32, i1) @func448 (%Str %96, %Nat32 0, i1 1)
  store %Type* %97, %Type** @typeNumeric, align 8
  %98 = call %Type* (%Nat32) @func449 (%Nat32 8)
  store %Type* %98, %Type** @typeBaseInt, align 8
  ret void
}

define %Type* @func450 () {
  %1 = bitcast [27 x %Nat8]* @func449_func450_str1 to %Str
  call void (%Str) @fatal (%Str %1); loadImmPtr
  %2 = inttoptr i64 0 to%Type*
  ret %Type* %2
}

define %Type* @func449 (%Nat32) {
  br label %select_1_0
select_1_0:
  %2 = icmp eq %Nat32 %0, 1
  br i1 %2, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %3 = bitcast [5 x %Nat8]* @func449_str1 to %Str
  %4 = call %union.16 (%Str) @typeget (%Str %3)
  br label %select_1_end
select_1_1:
  %5 = icmp eq %Nat32 %0, 2
  br i1 %5, label %select_1_1_ok, label %select_1_2
select_1_1_ok:
  %6 = bitcast [6 x %Nat8]* @func449_str2 to %Str
  %7 = call %union.16 (%Str) @typeget (%Str %6)
  br label %select_1_end
select_1_2:
  %8 = icmp eq %Nat32 %0, 4
  br i1 %8, label %select_1_2_ok, label %select_1_3
select_1_2_ok:
  %9 = bitcast [6 x %Nat8]* @func449_str3 to %Str
  %10 = call %union.16 (%Str) @typeget (%Str %9)
  br label %select_1_end
select_1_3:
  %11 = icmp eq %Nat32 %0, 8
  br i1 %11, label %select_1_3_ok, label %select_1_4
select_1_3_ok:
  %12 = bitcast [6 x %Nat8]* @func449_str4 to %Str
  %13 = call %union.16 (%Str) @typeget (%Str %12)
  br label %select_1_end
select_1_4:
  %14 = icmp eq %Nat32 %0, 16
  br i1 %14, label %select_1_4_ok, label %select_1_5
select_1_4_ok:
  %15 = bitcast [7 x %Nat8]* @func449_str5 to %Str
  %16 = call %union.16 (%Str) @typeget (%Str %15)
  br label %select_1_end
select_1_5:
  %17 = icmp eq %Nat32 %0, 32
  br i1 %17, label %select_1_5_ok, label %select_1_6
select_1_5_ok:
  %18 = bitcast [7 x %Nat8]* @func449_str6 to %Str
  %19 = call %union.16 (%Str) @typeget (%Str %18)
  br label %select_1_end
select_1_6:
  %20 = icmp eq %Nat32 %0, 64
  br i1 %20, label %select_1_6_ok, label %select_1_7
select_1_6_ok:
  %21 = bitcast [7 x %Nat8]* @func449_str7 to %Str
  %22 = call %union.16 (%Str) @typeget (%Str %21)
  br label %select_1_end
select_1_7:
  %23 = icmp eq %Nat32 %0, 128
  br i1 %23, label %select_1_7_ok, label %select_1_8
select_1_7_ok:
  %24 = bitcast [8 x %Nat8]* @func449_str8 to %Str
  %25 = call %union.16 (%Str) @typeget (%Str %24)
  br label %select_1_end
select_1_8:
  %26 = call %Type* () @func450 ()
  %27 = bitcast %Type* %26 to %union.16
  br label %select_1_end
select_1_end:
  %28 = phi %union.16 [ %4, %select_1_0_ok ], [ %7, %select_1_1_ok ], [ %10, %select_1_2_ok ], [ %13, %select_1_3_ok ], [ %16, %select_1_4_ok ], [ %19, %select_1_5_ok ], [ %22, %select_1_6_ok ], [ %25, %select_1_7_ok ], [ %27, %select_1_8 ]
  %29 = bitcast %union.16 %28 to %Type*
  ret %Type* %29
}

define void @func452 (%Unit*, %Unit*, %Nat32, %Node*) {
  %5 = bitcast %Unit* %0 to %Type*
  %6 = bitcast %Unit* %1 to %func451.type7*
  %7 = getelementptr inbounds %func451.type7, %func451.type7* %6, i1 0, i32 0
  %8 = load %Type*, %Type** %7
  %9 = call i1 (%Type*, %Type*) @func445 (%Type* %5, %Type* %8)
  br i1 %9, label %then_0, label %else_0
then_0:
  %10 = getelementptr inbounds %func451.type7, %func451.type7* %6, i1 0, i32 1
  store %Nat32 %2, %Nat32* %10, align 4
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  ret void
}

define %Nat32 @func451 (%Type*, %Type*) {
  %3 = alloca %func451.type7
  %4 = insertvalue %func451.type7 zeroinitializer, %Type* %1, 0
  store %func451.type7 %4, %func451.type7* %3, align 8
  %5 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 14
  %6 = getelementptr inbounds %TypeUnion, %TypeUnion* %5, i1 0, i32 0
  %7 = getelementptr inbounds %func451.type7, %func451.type7* %3, i1 0
  %8 = bitcast %func451.type7* %7 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @func64 (%List* %6, %ListForeachHandler @func452, %Unit* %8)
  %9 = getelementptr inbounds %func451.type7, %func451.type7* %3, i1 0, i32 1
  %10 = load %Nat32, %Nat32* %9
  ret %Nat32 %10
}

define i1 @is_value_imm_num (%Value*) {
  %2 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 1
  %3 = load %union.9, %union.9* %2
  %4 = extractvalue %union.9 %3, 0
  %5 = bitcast %Int16 38 to %Int16
  %6 = icmp eq %Int16 %4, %5
  ret i1 %6
}

define %union.22 @smalloc (%Nat32) {
  %2 = call %Unit* (%Nat32) @malloc (%Nat32 %0); loadImmPtr
  %3 = inttoptr i64 0 to%Unit*
  %4 = icmp eq %Unit* %2, %3
  br i1 %4, label %then_0, label %else_0
then_0:
  %5 = inttoptr %Unit zeroinitializer to %union.22
  ret %union.22 %5
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %7 = bitcast %Unit* %2 to %union.22
  ret %union.22 %7
}

define %Value* @func455 (%union.9, %Type*, %TokenInfo*) {
  %4 = call %Unit* (%Nat32) @malloc (%Nat32 384)
  %5 = bitcast %Unit* %4 to %Value*; loadImmPtr
  %6 = inttoptr i64 0 to%Value*
  %7 = icmp ne %Value* %5, %6
  %8 = bitcast [21 x %Nat8]* @func455_str1 to %Str
  call void (i1, %Str) @assert (i1 %7, %Str %8)
  %9 = insertvalue %Value zeroinitializer, %Type* %1, 0
  %10 = insertvalue %Value %9, %TokenInfo* %2, 3
  %11 = insertvalue %Value %10, %union.9 %0, 1
  store %Value %11, %Value* %5, align 128
  ret %Value* %5
}

define %Value* @value_new_poison (%TokenInfo*) {
  %2 = insertvalue %TypePoison zeroinitializer, %TokenInfo* %0, 0
  %3 = alloca %union.8
; write variant 15
  %4 = getelementptr inbounds %union.8, %union.8* %3, i1 0, i32 0
  store %Int16 15, %Int16* %4, align 2
; write data
  %5 = getelementptr inbounds %union.8, %union.8* %3, i1 0, i32 1
  %6 = bitcast [56 x %Nat8]* %5 to %TypePoison*
  store %TypePoison %2, %TypePoison* %6, align 8
  %7 = load %union.8, %union.8* %3
  %8 = call %Type* (%TypeKind, %union.8, %Nat32, %TokenInfo*) @func393 (%TypeKind 2, %union.8 %7, %Nat32 0, %TokenInfo* %0)
  %9 = insertvalue %ValuePoison zeroinitializer, %TokenInfo* %0, 0
  %10 = alloca %union.9
; write variant 40
  %11 = getelementptr inbounds %union.9, %union.9* %10, i1 0, i32 0
  store %Int16 40, %Int16* %11, align 2
; write data
  %12 = getelementptr inbounds %union.9, %union.9* %10, i1 0, i32 1
  %13 = bitcast [72 x %Nat8]* %12 to %ValuePoison*
  store %ValuePoison %9, %ValuePoison* %13, align 8
  %14 = load %union.9, %union.9* %10
  %15 = call %Value* (%union.9, %Type*, %TokenInfo*) @func455 (%union.9 %14, %Type* %8, %TokenInfo* %0)
  ret %Value* %15
}

define %Value* @func457 (%Type*, %Int64, %TokenInfo*) {
  %4 = insertvalue %ValueImm zeroinitializer, %Type* %0, 0
  %5 = insertvalue %ValueImm %4, %Int64 %1, 1
  %6 = insertvalue %ValueImm %5, %TokenInfo* %2, 2
  %7 = alloca %union.9
; write variant 38
  %8 = getelementptr inbounds %union.9, %union.9* %7, i1 0, i32 0
  store %Int16 38, %Int16* %8, align 2
; write data
  %9 = getelementptr inbounds %union.9, %union.9* %7, i1 0, i32 1
  %10 = bitcast [72 x %Nat8]* %9 to %ValueImm*
  store %ValueImm %6, %ValueImm* %10, align 8
  %11 = load %union.9, %union.9* %7
  %12 = call %Value* (%union.9, %Type*, %TokenInfo*) @func455 (%union.9 %11, %Type* %0, %TokenInfo* %2)
  ret %Value* %12
}

define %Value* @dold2 (%Value*) {
  %2 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 0
  %3 = load %Type*, %Type** %2
  %4 = getelementptr inbounds %Type, %Type* %3, i1 0, i32 0
  %5 = load %TypeKind, %TypeKind* %4
  br label %select_1_0
select_1_0:
  %6 = icmp eq %TypeKind %5, 8
  br i1 %6, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %7 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 0
  %8 = load %Type*, %Type** %7
  %9 = getelementptr inbounds %Type, %Type* %8, i1 0, i32 13
  %10 = getelementptr inbounds %TypeVar, %TypeVar* %9, i1 0, i32 0
  %11 = load %Type*, %Type** %10
  br label %select_1_end
select_1_1:
  %12 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 0
  %13 = load %Type*, %Type** %12
  br label %select_1_end
select_1_end:
  %14 = phi %Type* [ %11, %select_1_0_ok ], [ %13, %select_1_1 ]
  ret %Value* %0
}

define %Value* @dold (%Value*) {
  %2 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 0
  %3 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 0
  %4 = load %Type*, %Type** %3
  %5 = getelementptr inbounds %Type, %Type* %4, i1 0, i32 0
  %6 = load %TypeKind, %TypeKind* %5
  br label %select_1_0
select_1_0:
  %7 = icmp eq %TypeKind %6, 8
  br i1 %7, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %8 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 0
  %9 = load %Type*, %Type** %8
  %10 = getelementptr inbounds %Type, %Type* %9, i1 0, i32 13
  %11 = getelementptr inbounds %TypeVar, %TypeVar* %10, i1 0, i32 0
  %12 = load %Type*, %Type** %11
  br label %select_1_end
select_1_1:
  %13 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 0
  %14 = load %Type*, %Type** %13
  br label %select_1_end
select_1_end:
  %15 = phi %Type* [ %12, %select_1_0_ok ], [ %14, %select_1_1 ]
  store %Type* %15, %Type** %2, align 8
  ret %Value* %0
}

define %Value* @func460 (%AstValueBinary) {
  %2 = extractvalue %AstValueBinary %0, 0
  %3 = extractvalue %AstValueBinary %0, 1
  %4 = extractvalue %AstValueBinary %0, 2
  %5 = call %Value* (%ValueKind, %union.4*, %union.4*, %TokenInfo*) @func485 (%ValueKind 18, %union.4* %2, %union.4* %3, %TokenInfo* %4)
  ret %Value* %5
}

define %Value* @do_value_sub (%AstValueBinary) {
  %2 = extractvalue %AstValueBinary %0, 0
  %3 = extractvalue %AstValueBinary %0, 1
  %4 = extractvalue %AstValueBinary %0, 2
  %5 = call %Value* (%ValueKind, %union.4*, %union.4*, %TokenInfo*) @func485 (%ValueKind 19, %union.4* %2, %union.4* %3, %TokenInfo* %4)
  ret %Value* %5
}

define %Value* @do_value_mul (%AstValueBinary) {
  %2 = extractvalue %AstValueBinary %0, 0
  %3 = extractvalue %AstValueBinary %0, 1
  %4 = extractvalue %AstValueBinary %0, 2
  %5 = call %Value* (%ValueKind, %union.4*, %union.4*, %TokenInfo*) @func485 (%ValueKind 20, %union.4* %2, %union.4* %3, %TokenInfo* %4)
  ret %Value* %5
}

define %Value* @do_value_div (%AstValueBinary) {
  %2 = extractvalue %AstValueBinary %0, 0
  %3 = extractvalue %AstValueBinary %0, 1
  %4 = extractvalue %AstValueBinary %0, 2
  %5 = call %Value* (%ValueKind, %union.4*, %union.4*, %TokenInfo*) @func485 (%ValueKind 21, %union.4* %2, %union.4* %3, %TokenInfo* %4)
  ret %Value* %5
}

define %Value* @do_value_mod (%AstValueBinary) {
  %2 = extractvalue %AstValueBinary %0, 0
  %3 = extractvalue %AstValueBinary %0, 1
  %4 = extractvalue %AstValueBinary %0, 2
  %5 = call %Value* (%ValueKind, %union.4*, %union.4*, %TokenInfo*) @func485 (%ValueKind 22, %union.4* %2, %union.4* %3, %TokenInfo* %4)
  ret %Value* %5
}

define %Value* @do_value_and (%AstValueBinary) {
  %2 = extractvalue %AstValueBinary %0, 0
  %3 = extractvalue %AstValueBinary %0, 1
  %4 = extractvalue %AstValueBinary %0, 2
  %5 = call %Value* (%ValueKind, %union.4*, %union.4*, %TokenInfo*) @func485 (%ValueKind 25, %union.4* %2, %union.4* %3, %TokenInfo* %4)
  ret %Value* %5
}

define %Value* @do_value_or (%AstValueBinary) {
  %2 = extractvalue %AstValueBinary %0, 0
  %3 = extractvalue %AstValueBinary %0, 1
  %4 = extractvalue %AstValueBinary %0, 2
  %5 = call %Value* (%ValueKind, %union.4*, %union.4*, %TokenInfo*) @func485 (%ValueKind 23, %union.4* %2, %union.4* %3, %TokenInfo* %4)
  ret %Value* %5
}

define %Value* @do_value_xor (%AstValueBinary) {
  %2 = extractvalue %AstValueBinary %0, 0
  %3 = extractvalue %AstValueBinary %0, 1
  %4 = extractvalue %AstValueBinary %0, 2
  %5 = call %Value* (%ValueKind, %union.4*, %union.4*, %TokenInfo*) @func485 (%ValueKind 24, %union.4* %2, %union.4* %3, %TokenInfo* %4)
  ret %Value* %5
}

define %Value* @do_value_eq (%AstValueBinary) {
  %2 = extractvalue %AstValueBinary %0, 0
  %3 = extractvalue %AstValueBinary %0, 1
  %4 = extractvalue %AstValueBinary %0, 2
  %5 = call %Value* (%ValueKind, %union.4*, %union.4*, %TokenInfo*) @func485 (%ValueKind 26, %union.4* %2, %union.4* %3, %TokenInfo* %4)
  ret %Value* %5
}

define %Value* @do_value_ne (%AstValueBinary) {
  %2 = extractvalue %AstValueBinary %0, 0
  %3 = extractvalue %AstValueBinary %0, 1
  %4 = extractvalue %AstValueBinary %0, 2
  %5 = call %Value* (%ValueKind, %union.4*, %union.4*, %TokenInfo*) @func485 (%ValueKind 27, %union.4* %2, %union.4* %3, %TokenInfo* %4)
  ret %Value* %5
}

define %Value* @do_value_lt (%AstValueBinary) {
  %2 = extractvalue %AstValueBinary %0, 0
  %3 = extractvalue %AstValueBinary %0, 1
  %4 = extractvalue %AstValueBinary %0, 2
  %5 = call %Value* (%ValueKind, %union.4*, %union.4*, %TokenInfo*) @func485 (%ValueKind 28, %union.4* %2, %union.4* %3, %TokenInfo* %4)
  ret %Value* %5
}

define %Value* @do_value_gt (%AstValueBinary) {
  %2 = extractvalue %AstValueBinary %0, 0
  %3 = extractvalue %AstValueBinary %0, 1
  %4 = extractvalue %AstValueBinary %0, 2
  %5 = call %Value* (%ValueKind, %union.4*, %union.4*, %TokenInfo*) @func485 (%ValueKind 29, %union.4* %2, %union.4* %3, %TokenInfo* %4)
  ret %Value* %5
}

define %Value* @do_value_le (%AstValueBinary) {
  %2 = extractvalue %AstValueBinary %0, 0
  %3 = extractvalue %AstValueBinary %0, 1
  %4 = extractvalue %AstValueBinary %0, 2
  %5 = call %Value* (%ValueKind, %union.4*, %union.4*, %TokenInfo*) @func485 (%ValueKind 30, %union.4* %2, %union.4* %3, %TokenInfo* %4)
  ret %Value* %5
}

define %Value* @do_value_ge (%AstValueBinary) {
  %2 = extractvalue %AstValueBinary %0, 0
  %3 = extractvalue %AstValueBinary %0, 1
  %4 = extractvalue %AstValueBinary %0, 2
  %5 = call %Value* (%ValueKind, %union.4*, %union.4*, %TokenInfo*) @func485 (%ValueKind 31, %union.4* %2, %union.4* %3, %TokenInfo* %4)
  ret %Value* %5
}

define %Value* @do_value_shr (%AstValueBinary) {
  %2 = extractvalue %AstValueBinary %0, 0
  %3 = extractvalue %AstValueBinary %0, 1
  %4 = extractvalue %AstValueBinary %0, 2
  %5 = call %Value* (%ValueKind, %union.4*, %union.4*, %TokenInfo*) @func530 (%ValueKind 34, %union.4* %2, %union.4* %3, %TokenInfo* %4)
  ret %Value* %5
}

define %Value* @do_value_shl (%AstValueBinary) {
  %2 = extractvalue %AstValueBinary %0, 0
  %3 = extractvalue %AstValueBinary %0, 1
  %4 = extractvalue %AstValueBinary %0, 2
  %5 = call %Value* (%ValueKind, %union.4*, %union.4*, %TokenInfo*) @func530 (%ValueKind 33, %union.4* %2, %union.4* %3, %TokenInfo* %4)
  ret %Value* %5
}

define %Value* @func476 (%union.4*) {
  %2 = call %Value* (%union.4*, i1) @func477 (%union.4* %0, i1 1)
  ret %Value* %2
}

define %Value* @func478 (%union.4*) {
  %2 = bitcast [20 x %Nat8]* @func477_func478_str1 to %Str
  call void (%Str) @fatal (%Str %2); loadImmPtr
  %3 = inttoptr i64 0 to%TokenInfo*
  %4 = call %Value* (%TokenInfo*) @value_new_poison (%TokenInfo* %3)
  ret %Value* %4
}

define %Value* @func477 (%union.4*, i1) {
  %3 = load %union.4, %union.4* %0
  %4 = extractvalue %union.4 %3, 0
  br label %select_1_0
select_1_0:
  %5 = bitcast %Int16 36 to %Int16
  %6 = icmp eq %Int16 %4, %5
  br i1 %6, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %7 = alloca %union.4
  store %union.4 %3, %union.4* %7, align 64
  %8 = getelementptr inbounds %union.4, %union.4* %7, i1 0, i32 1
  %9 = bitcast [56 x %Nat8]* %8 to %AstName*
  %10 = load %AstName, %AstName* %9
  %11 = call %Value* (%AstName) @func518 (%AstName %10)
  br label %select_1_end
select_1_1:
  %12 = bitcast %Int16 32 to %Int16
  %13 = icmp eq %Int16 %4, %12
  br i1 %13, label %select_1_1_ok, label %select_1_2
select_1_1_ok:
  %14 = alloca %union.4
  store %union.4 %3, %union.4* %14, align 64
  %15 = getelementptr inbounds %union.4, %union.4* %14, i1 0, i32 1
  %16 = bitcast [56 x %Nat8]* %15 to %AstValueNumber*
  %17 = load %AstValueNumber, %AstValueNumber* %16
  %18 = call %Value* (%AstValueNumber) @func519 (%AstValueNumber %17)
  br label %select_1_end
select_1_2:
  %19 = bitcast %Int16 31 to %Int16
  %20 = icmp eq %Int16 %4, %19
  br i1 %20, label %select_1_2_ok, label %select_1_3
select_1_2_ok:
  %21 = alloca %union.4
  store %union.4 %3, %union.4* %21, align 64
  %22 = getelementptr inbounds %union.4, %union.4* %21, i1 0, i32 1
  %23 = bitcast [56 x %Nat8]* %22 to %AstValueFunc*
  %24 = load %AstValueFunc, %AstValueFunc* %23
  %25 = call %Value* (%AstValueFunc) @func521 (%AstValueFunc %24)
  br label %select_1_end
select_1_3:
  %26 = bitcast %Int16 34 to %Int16
  %27 = icmp eq %Int16 %4, %26
  br i1 %27, label %select_1_3_ok, label %select_1_4
select_1_3_ok:
  %28 = alloca %union.4
  store %union.4 %3, %union.4* %28, align 64
  %29 = getelementptr inbounds %union.4, %union.4* %28, i1 0, i32 1
  %30 = bitcast [56 x %Nat8]* %29 to %AstValueArray*
  %31 = load %AstValueArray, %AstValueArray* %30
  %32 = call %Value* (%AstValueArray) @func523 (%AstValueArray %31)
  br label %select_1_end
select_1_4:
  %33 = bitcast %Int16 35 to %Int16
  %34 = icmp eq %Int16 %4, %33
  br i1 %34, label %select_1_4_ok, label %select_1_5
select_1_4_ok:
  %35 = alloca %union.4
  store %union.4 %3, %union.4* %35, align 64
  %36 = getelementptr inbounds %union.4, %union.4* %35, i1 0, i32 1
  %37 = bitcast [56 x %Nat8]* %36 to %AstValueRecord*
  %38 = load %AstValueRecord, %AstValueRecord* %37
  %39 = call %Value* (%AstValueRecord) @func525 (%AstValueRecord %38)
  br label %select_1_end
select_1_5:
  %40 = bitcast %Int16 33 to %Int16
  %41 = icmp eq %Int16 %4, %40
  br i1 %41, label %select_1_5_ok, label %select_1_6
select_1_5_ok:
  %42 = alloca %union.4
  store %union.4 %3, %union.4* %42, align 64
  %43 = getelementptr inbounds %union.4, %union.4* %42, i1 0, i32 1
  %44 = bitcast [56 x %Nat8]* %43 to %AstValueString*
  %45 = load %AstValueString, %AstValueString* %44
  %46 = call %Value* (%AstValueString) @func520 (%AstValueString %45)
  br label %select_1_end
select_1_6:
  %47 = bitcast %Int16 30 to %Int16
  %48 = icmp eq %Int16 %4, %47
  br i1 %48, label %select_1_6_ok, label %select_1_7
select_1_6_ok:
  %49 = alloca %union.4
  store %union.4 %3, %union.4* %49, align 64
  %50 = getelementptr inbounds %union.4, %union.4* %49, i1 0, i32 1
  %51 = bitcast [56 x %Nat8]* %50 to %AstValueUnary*
  %52 = load %AstValueUnary, %AstValueUnary* %51
  %53 = call %Value* (%AstValueUnary) @func483 (%AstValueUnary %52)
  br label %select_1_end
select_1_7:
  %54 = bitcast %Int16 29 to %Int16
  %55 = icmp eq %Int16 %4, %54
  br i1 %55, label %select_1_7_ok, label %select_1_8
select_1_7_ok:
  %56 = alloca %union.4
  store %union.4 %3, %union.4* %56, align 64
  %57 = getelementptr inbounds %union.4, %union.4* %56, i1 0, i32 1
  %58 = bitcast [56 x %Nat8]* %57 to %AstValueUnary*
  %59 = load %AstValueUnary, %AstValueUnary* %58
  %60 = call %Value* (%AstValueUnary) @func484 (%AstValueUnary %59)
  br label %select_1_end
select_1_8:
  %61 = bitcast %Int16 28 to %Int16
  %62 = icmp eq %Int16 %4, %61
  br i1 %62, label %select_1_8_ok, label %select_1_9
select_1_8_ok:
  %63 = alloca %union.4
  store %union.4 %3, %union.4* %63, align 64
  %64 = getelementptr inbounds %union.4, %union.4* %63, i1 0, i32 1
  %65 = bitcast [56 x %Nat8]* %64 to %AstValueUnary*
  %66 = load %AstValueUnary, %AstValueUnary* %65
  %67 = call %Value* (%AstValueUnary) @func528 (%AstValueUnary %66)
  br label %select_1_end
select_1_9:
  %68 = bitcast %Int16 27 to %Int16
  %69 = icmp eq %Int16 %4, %68
  br i1 %69, label %select_1_9_ok, label %select_1_10
select_1_9_ok:
  %70 = alloca %union.4
  store %union.4 %3, %union.4* %70, align 64
  %71 = getelementptr inbounds %union.4, %union.4* %70, i1 0, i32 1
  %72 = bitcast [56 x %Nat8]* %71 to %AstValueUnary*
  %73 = load %AstValueUnary, %AstValueUnary* %72
  %74 = call %Value* (%AstValueUnary) @func527 (%AstValueUnary %73)
  br label %select_1_end
select_1_10:
  %75 = bitcast %Int16 26 to %Int16
  %76 = icmp eq %Int16 %4, %75
  br i1 %76, label %select_1_10_ok, label %select_1_11
select_1_10_ok:
  %77 = alloca %union.4
  store %union.4 %3, %union.4* %77, align 64
  %78 = getelementptr inbounds %union.4, %union.4* %77, i1 0, i32 1
  %79 = bitcast [56 x %Nat8]* %78 to %AstValueUnary*
  %80 = load %AstValueUnary, %AstValueUnary* %79
  %81 = call %Value* (%AstValueUnary) @func529 (%AstValueUnary %80)
  br label %select_1_end
select_1_11:
  %82 = bitcast %Int16 25 to %Int16
  %83 = icmp eq %Int16 %4, %82
  br i1 %83, label %select_1_11_ok, label %select_1_12
select_1_11_ok:
  %84 = alloca %union.4
  store %union.4 %3, %union.4* %84, align 64
  %85 = getelementptr inbounds %union.4, %union.4* %84, i1 0, i32 1
  %86 = bitcast [56 x %Nat8]* %85 to %AstValueBinary*
  %87 = load %AstValueBinary, %AstValueBinary* %86
  %88 = call %Value* (%AstValueBinary) @func460 (%AstValueBinary %87)
  br label %select_1_end
select_1_12:
  %89 = bitcast %Int16 24 to %Int16
  %90 = icmp eq %Int16 %4, %89
  br i1 %90, label %select_1_12_ok, label %select_1_13
select_1_12_ok:
  %91 = alloca %union.4
  store %union.4 %3, %union.4* %91, align 64
  %92 = getelementptr inbounds %union.4, %union.4* %91, i1 0, i32 1
  %93 = bitcast [56 x %Nat8]* %92 to %AstValueBinary*
  %94 = load %AstValueBinary, %AstValueBinary* %93
  %95 = call %Value* (%AstValueBinary) @do_value_sub (%AstValueBinary %94)
  br label %select_1_end
select_1_13:
  %96 = bitcast %Int16 23 to %Int16
  %97 = icmp eq %Int16 %4, %96
  br i1 %97, label %select_1_13_ok, label %select_1_14
select_1_13_ok:
  %98 = alloca %union.4
  store %union.4 %3, %union.4* %98, align 64
  %99 = getelementptr inbounds %union.4, %union.4* %98, i1 0, i32 1
  %100 = bitcast [56 x %Nat8]* %99 to %AstValueBinary*
  %101 = load %AstValueBinary, %AstValueBinary* %100
  %102 = call %Value* (%AstValueBinary) @do_value_mul (%AstValueBinary %101)
  br label %select_1_end
select_1_14:
  %103 = bitcast %Int16 22 to %Int16
  %104 = icmp eq %Int16 %4, %103
  br i1 %104, label %select_1_14_ok, label %select_1_15
select_1_14_ok:
  %105 = alloca %union.4
  store %union.4 %3, %union.4* %105, align 64
  %106 = getelementptr inbounds %union.4, %union.4* %105, i1 0, i32 1
  %107 = bitcast [56 x %Nat8]* %106 to %AstValueBinary*
  %108 = load %AstValueBinary, %AstValueBinary* %107
  %109 = call %Value* (%AstValueBinary) @do_value_div (%AstValueBinary %108)
  br label %select_1_end
select_1_15:
  %110 = bitcast %Int16 21 to %Int16
  %111 = icmp eq %Int16 %4, %110
  br i1 %111, label %select_1_15_ok, label %select_1_16
select_1_15_ok:
  %112 = alloca %union.4
  store %union.4 %3, %union.4* %112, align 64
  %113 = getelementptr inbounds %union.4, %union.4* %112, i1 0, i32 1
  %114 = bitcast [56 x %Nat8]* %113 to %AstValueBinary*
  %115 = load %AstValueBinary, %AstValueBinary* %114
  %116 = call %Value* (%AstValueBinary) @do_value_mod (%AstValueBinary %115)
  br label %select_1_end
select_1_16:
  %117 = bitcast %Int16 20 to %Int16
  %118 = icmp eq %Int16 %4, %117
  br i1 %118, label %select_1_16_ok, label %select_1_17
select_1_16_ok:
  %119 = alloca %union.4
  store %union.4 %3, %union.4* %119, align 64
  %120 = getelementptr inbounds %union.4, %union.4* %119, i1 0, i32 1
  %121 = bitcast [56 x %Nat8]* %120 to %AstValueBinary*
  %122 = load %AstValueBinary, %AstValueBinary* %121
  %123 = call %Value* (%AstValueBinary) @do_value_and (%AstValueBinary %122)
  br label %select_1_end
select_1_17:
  %124 = bitcast %Int16 18 to %Int16
  %125 = icmp eq %Int16 %4, %124
  br i1 %125, label %select_1_17_ok, label %select_1_18
select_1_17_ok:
  %126 = alloca %union.4
  store %union.4 %3, %union.4* %126, align 64
  %127 = getelementptr inbounds %union.4, %union.4* %126, i1 0, i32 1
  %128 = bitcast [56 x %Nat8]* %127 to %AstValueBinary*
  %129 = load %AstValueBinary, %AstValueBinary* %128
  %130 = call %Value* (%AstValueBinary) @do_value_xor (%AstValueBinary %129)
  br label %select_1_end
select_1_18:
  %131 = bitcast %Int16 19 to %Int16
  %132 = icmp eq %Int16 %4, %131
  br i1 %132, label %select_1_18_ok, label %select_1_19
select_1_18_ok:
  %133 = alloca %union.4
  store %union.4 %3, %union.4* %133, align 64
  %134 = getelementptr inbounds %union.4, %union.4* %133, i1 0, i32 1
  %135 = bitcast [56 x %Nat8]* %134 to %AstValueBinary*
  %136 = load %AstValueBinary, %AstValueBinary* %135
  %137 = call %Value* (%AstValueBinary) @do_value_or (%AstValueBinary %136)
  br label %select_1_end
select_1_19:
  %138 = bitcast %Int16 15 to %Int16
  %139 = icmp eq %Int16 %4, %138
  br i1 %139, label %select_1_19_ok, label %select_1_20
select_1_19_ok:
  %140 = alloca %union.4
  store %union.4 %3, %union.4* %140, align 64
  %141 = getelementptr inbounds %union.4, %union.4* %140, i1 0, i32 1
  %142 = bitcast [56 x %Nat8]* %141 to %AstValueBinary*
  %143 = load %AstValueBinary, %AstValueBinary* %142
  %144 = call %Value* (%AstValueBinary) @do_value_lt (%AstValueBinary %143)
  br label %select_1_end
select_1_20:
  %145 = bitcast %Int16 14 to %Int16
  %146 = icmp eq %Int16 %4, %145
  br i1 %146, label %select_1_20_ok, label %select_1_21
select_1_20_ok:
  %147 = alloca %union.4
  store %union.4 %3, %union.4* %147, align 64
  %148 = getelementptr inbounds %union.4, %union.4* %147, i1 0, i32 1
  %149 = bitcast [56 x %Nat8]* %148 to %AstValueBinary*
  %150 = load %AstValueBinary, %AstValueBinary* %149
  %151 = call %Value* (%AstValueBinary) @do_value_gt (%AstValueBinary %150)
  br label %select_1_end
select_1_21:
  %152 = bitcast %Int16 17 to %Int16
  %153 = icmp eq %Int16 %4, %152
  br i1 %153, label %select_1_21_ok, label %select_1_22
select_1_21_ok:
  %154 = alloca %union.4
  store %union.4 %3, %union.4* %154, align 64
  %155 = getelementptr inbounds %union.4, %union.4* %154, i1 0, i32 1
  %156 = bitcast [56 x %Nat8]* %155 to %AstValueBinary*
  %157 = load %AstValueBinary, %AstValueBinary* %156
  %158 = call %Value* (%AstValueBinary) @do_value_eq (%AstValueBinary %157)
  br label %select_1_end
select_1_22:
  %159 = bitcast %Int16 16 to %Int16
  %160 = icmp eq %Int16 %4, %159
  br i1 %160, label %select_1_22_ok, label %select_1_23
select_1_22_ok:
  %161 = alloca %union.4
  store %union.4 %3, %union.4* %161, align 64
  %162 = getelementptr inbounds %union.4, %union.4* %161, i1 0, i32 1
  %163 = bitcast [56 x %Nat8]* %162 to %AstValueBinary*
  %164 = load %AstValueBinary, %AstValueBinary* %163
  %165 = call %Value* (%AstValueBinary) @do_value_ne (%AstValueBinary %164)
  br label %select_1_end
select_1_23:
  %166 = bitcast %Int16 13 to %Int16
  %167 = icmp eq %Int16 %4, %166
  br i1 %167, label %select_1_23_ok, label %select_1_24
select_1_23_ok:
  %168 = alloca %union.4
  store %union.4 %3, %union.4* %168, align 64
  %169 = getelementptr inbounds %union.4, %union.4* %168, i1 0, i32 1
  %170 = bitcast [56 x %Nat8]* %169 to %AstValueBinary*
  %171 = load %AstValueBinary, %AstValueBinary* %170
  %172 = call %Value* (%AstValueBinary) @do_value_le (%AstValueBinary %171)
  br label %select_1_end
select_1_24:
  %173 = bitcast %Int16 12 to %Int16
  %174 = icmp eq %Int16 %4, %173
  br i1 %174, label %select_1_24_ok, label %select_1_25
select_1_24_ok:
  %175 = alloca %union.4
  store %union.4 %3, %union.4* %175, align 64
  %176 = getelementptr inbounds %union.4, %union.4* %175, i1 0, i32 1
  %177 = bitcast [56 x %Nat8]* %176 to %AstValueBinary*
  %178 = load %AstValueBinary, %AstValueBinary* %177
  %179 = call %Value* (%AstValueBinary) @do_value_ge (%AstValueBinary %178)
  br label %select_1_end
select_1_25:
  %180 = bitcast %Int16 11 to %Int16
  %181 = icmp eq %Int16 %4, %180
  br i1 %181, label %select_1_25_ok, label %select_1_26
select_1_25_ok:
  %182 = alloca %union.4
  store %union.4 %3, %union.4* %182, align 64
  %183 = getelementptr inbounds %union.4, %union.4* %182, i1 0, i32 1
  %184 = bitcast [56 x %Nat8]* %183 to %AstValueBinary*
  %185 = load %AstValueBinary, %AstValueBinary* %184
  %186 = call %Value* (%AstValueBinary) @do_value_shl (%AstValueBinary %185)
  br label %select_1_end
select_1_26:
  %187 = bitcast %Int16 10 to %Int16
  %188 = icmp eq %Int16 %4, %187
  br i1 %188, label %select_1_26_ok, label %select_1_27
select_1_26_ok:
  %189 = alloca %union.4
  store %union.4 %3, %union.4* %189, align 64
  %190 = getelementptr inbounds %union.4, %union.4* %189, i1 0, i32 1
  %191 = bitcast [56 x %Nat8]* %190 to %AstValueBinary*
  %192 = load %AstValueBinary, %AstValueBinary* %191
  %193 = call %Value* (%AstValueBinary) @do_value_shr (%AstValueBinary %192)
  br label %select_1_end
select_1_27:
  %194 = bitcast %Int16 9 to %Int16
  %195 = icmp eq %Int16 %4, %194
  br i1 %195, label %select_1_27_ok, label %select_1_28
select_1_27_ok:
  %196 = alloca %union.4
  store %union.4 %3, %union.4* %196, align 64
  %197 = getelementptr inbounds %union.4, %union.4* %196, i1 0, i32 1
  %198 = bitcast [56 x %Nat8]* %197 to %AstValueCall*
  %199 = load %AstValueCall, %AstValueCall* %198
  %200 = call %Value* (%AstValueCall) @func487 (%AstValueCall %199)
  br label %select_1_end
select_1_28:
  %201 = bitcast %Int16 8 to %Int16
  %202 = icmp eq %Int16 %4, %201
  br i1 %202, label %select_1_28_ok, label %select_1_29
select_1_28_ok:
  %203 = alloca %union.4
  store %union.4 %3, %union.4* %203, align 64
  %204 = getelementptr inbounds %union.4, %union.4* %203, i1 0, i32 1
  %205 = bitcast [56 x %Nat8]* %204 to %AstValueIndex*
  %206 = load %AstValueIndex, %AstValueIndex* %205
  %207 = call %Value* (%AstValueIndex) @func490 (%AstValueIndex %206)
  br label %select_1_end
select_1_29:
  %208 = bitcast %Int16 7 to %Int16
  %209 = icmp eq %Int16 %4, %208
  br i1 %209, label %select_1_29_ok, label %select_1_30
select_1_29_ok:
  %210 = alloca %union.4
  store %union.4 %3, %union.4* %210, align 64
  %211 = getelementptr inbounds %union.4, %union.4* %210, i1 0, i32 1
  %212 = bitcast [56 x %Nat8]* %211 to %AstValueAccess*
  %213 = load %AstValueAccess, %AstValueAccess* %212
  %214 = call %Value* (%AstValueAccess) @func492 (%AstValueAccess %213)
  br label %select_1_end
select_1_30:
  %215 = bitcast %Int16 6 to %Int16
  %216 = icmp eq %Int16 %4, %215
  br i1 %216, label %select_1_30_ok, label %select_1_31
select_1_30_ok:
  %217 = alloca %union.4
  store %union.4 %3, %union.4* %217, align 64
  %218 = getelementptr inbounds %union.4, %union.4* %217, i1 0, i32 1
  %219 = bitcast [56 x %Nat8]* %218 to %AstValueValType*
  %220 = load %AstValueValType, %AstValueValType* %219
  %221 = call %Value* (%AstValueValType) @func510 (%AstValueValType %220)
  br label %select_1_end
select_1_31:
  %222 = bitcast %Int16 5 to %Int16
  %223 = icmp eq %Int16 %4, %222
  br i1 %223, label %select_1_31_ok, label %select_1_32
select_1_31_ok:
  %224 = alloca %union.4
  store %union.4 %3, %union.4* %224, align 64
  %225 = getelementptr inbounds %union.4, %union.4* %224, i1 0, i32 1
  %226 = bitcast [56 x %Nat8]* %225 to %AstValueValType*
  %227 = load %AstValueValType, %AstValueValType* %226
  %228 = call %Value* (%AstValueValType) @func513 (%AstValueValType %227)
  br label %select_1_end
select_1_32:
  %229 = bitcast %Int16 4 to %Int16
  %230 = icmp eq %Int16 %4, %229
  br i1 %230, label %select_1_32_ok, label %select_1_33
select_1_32_ok:
  %231 = alloca %union.4
  store %union.4 %3, %union.4* %231, align 64
  %232 = getelementptr inbounds %union.4, %union.4* %231, i1 0, i32 1
  %233 = bitcast [56 x %Nat8]* %232 to %AstValueValType*
  %234 = load %AstValueValType, %AstValueValType* %233
  %235 = call %Value* (%AstValueValType) @func514 (%AstValueValType %234)
  br label %select_1_end
select_1_33:
  %236 = bitcast %Int16 3 to %Int16
  %237 = icmp eq %Int16 %4, %236
  br i1 %237, label %select_1_33_ok, label %select_1_34
select_1_33_ok:
  %238 = alloca %union.4
  store %union.4 %3, %union.4* %238, align 64
  %239 = getelementptr inbounds %union.4, %union.4* %238, i1 0, i32 1
  %240 = bitcast [56 x %Nat8]* %239 to %AstValueValType*
  %241 = load %AstValueValType, %AstValueValType* %240
  %242 = call %Value* (%AstValueValType) @func515 (%AstValueValType %241)
  br label %select_1_end
select_1_34:
  %243 = bitcast %Int16 0 to %Int16
  %244 = icmp eq %Int16 %4, %243
  br i1 %244, label %select_1_34_ok, label %select_1_35
select_1_34_ok:
  %245 = alloca %union.4
  store %union.4 %3, %union.4* %245, align 64
  %246 = getelementptr inbounds %union.4, %union.4* %245, i1 0, i32 1
  %247 = bitcast [56 x %Nat8]* %246 to %AstValueSizeof*
  %248 = load %AstValueSizeof, %AstValueSizeof* %247
  %249 = call %Value* (%AstValueSizeof) @func516 (%AstValueSizeof %248)
  br label %select_1_end
select_1_35:
  %250 = bitcast %Int16 1 to %Int16
  %251 = icmp eq %Int16 %4, %250
  br i1 %251, label %select_1_35_ok, label %select_1_36
select_1_35_ok:
  %252 = alloca %union.4
  store %union.4 %3, %union.4* %252, align 64
  %253 = getelementptr inbounds %union.4, %union.4* %252, i1 0, i32 1
  %254 = bitcast [56 x %Nat8]* %253 to %AstValueAlignof*
  %255 = load %AstValueAlignof, %AstValueAlignof* %254
  %256 = call %Value* (%AstValueAlignof) @func517 (%AstValueAlignof %255)
  br label %select_1_end
select_1_36:
  %257 = bitcast %Int16 2 to %Int16
  %258 = icmp eq %Int16 %4, %257
  br i1 %258, label %select_1_36_ok, label %select_1_37
select_1_36_ok:
  %259 = alloca %union.4
  store %union.4 %3, %union.4* %259, align 64
  %260 = getelementptr inbounds %union.4, %union.4* %259, i1 0, i32 1
  %261 = bitcast [56 x %Nat8]* %260 to %AstValueWhen*
  %262 = load %AstValueWhen, %AstValueWhen* %261
  %263 = call %Value* (%AstValueWhen) @func481 (%AstValueWhen %262)
  br label %select_1_end
select_1_37:
  %264 = call %Value* (%union.4*) @func478 (%union.4* %0)
  br label %select_1_end
select_1_end:
  %265 = phi %Value* [ %11, %select_1_0_ok ], [ %18, %select_1_1_ok ], [ %25, %select_1_2_ok ], [ %32, %select_1_3_ok ], [ %39, %select_1_4_ok ], [ %46, %select_1_5_ok ], [ %53, %select_1_6_ok ], [ %60, %select_1_7_ok ], [ %67, %select_1_8_ok ], [ %74, %select_1_9_ok ], [ %81, %select_1_10_ok ], [ %88, %select_1_11_ok ], [ %95, %select_1_12_ok ], [ %102, %select_1_13_ok ], [ %109, %select_1_14_ok ], [ %116, %select_1_15_ok ], [ %123, %select_1_16_ok ], [ %130, %select_1_17_ok ], [ %137, %select_1_18_ok ], [ %144, %select_1_19_ok ], [ %151, %select_1_20_ok ], [ %158, %select_1_21_ok ], [ %165, %select_1_22_ok ], [ %172, %select_1_23_ok ], [ %179, %select_1_24_ok ], [ %186, %select_1_25_ok ], [ %193, %select_1_26_ok ], [ %200, %select_1_27_ok ], [ %207, %select_1_28_ok ], [ %214, %select_1_29_ok ], [ %221, %select_1_30_ok ], [ %228, %select_1_31_ok ], [ %235, %select_1_32_ok ], [ %242, %select_1_33_ok ], [ %249, %select_1_34_ok ], [ %256, %select_1_35_ok ], [ %263, %select_1_36_ok ], [ %264, %select_1_37 ]
  %266 = getelementptr inbounds %Value, %Value* %265, i1 0, i32 1
  %267 = load %union.9, %union.9* %266
  %268 = extractvalue %union.9 %267, 0
  %269 = bitcast %Int16 40 to %Int16
  %270 = icmp eq %Int16 %268, %269
  br i1 %270, label %then_0, label %else_0
then_0:
  ret %Value* %265
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  br label %select_2_0
select_2_0:
  %272 = icmp eq i1 %1, 1
  br i1 %272, label %select_2_0_ok, label %select_2_1
select_2_0_ok:
  %273 = call %Value* (%Value*) @dold (%Value* %265)
  br label %select_2_end
select_2_1:
  br label %select_2_end
select_2_end:
  %274 = phi %Value* [ %273, %select_2_0_ok ], [ %265, %select_2_1 ]
  ret %Value* %274
}

define %Value* @func480 (%union.4*) {
  %2 = bitcast [17 x %Nat8]* @func479_func480_str1 to %Str; loadImmPtr
  %3 = inttoptr i64 0 to%TokenInfo*
  call void (%Str, %TokenInfo*) @error (%Str %2, %TokenInfo* %3); loadImmPtr
  %4 = inttoptr i64 0 to%TokenInfo*
  %5 = call %Value* (%TokenInfo*) @value_new_poison (%TokenInfo* %4)
  ret %Value* %5
}

define %Value* @func479 (%union.4*) {
  %2 = load %union.4, %union.4* %0
  %3 = extractvalue %union.4 %2, 0
  br label %select_1_0
select_1_0:
  %4 = bitcast %Int16 36 to %Int16
  %5 = icmp eq %Int16 %3, %4
  br i1 %5, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %6 = alloca %union.4
  store %union.4 %2, %union.4* %6, align 64
  %7 = getelementptr inbounds %union.4, %union.4* %6, i1 0, i32 1
  %8 = bitcast [56 x %Nat8]* %7 to %AstName*
  %9 = load %AstName, %AstName* %8
  %10 = call %Value* (%AstName) @func518 (%AstName %9)
  br label %select_1_end
select_1_1:
  %11 = bitcast %Int16 29 to %Int16
  %12 = icmp eq %Int16 %3, %11
  br i1 %12, label %select_1_1_ok, label %select_1_2
select_1_1_ok:
  %13 = alloca %union.4
  store %union.4 %2, %union.4* %13, align 64
  %14 = getelementptr inbounds %union.4, %union.4* %13, i1 0, i32 1
  %15 = bitcast [56 x %Nat8]* %14 to %AstValueUnary*
  %16 = load %AstValueUnary, %AstValueUnary* %15
  %17 = call %Value* (%AstValueUnary) @func484 (%AstValueUnary %16)
  br label %select_1_end
select_1_2:
  %18 = bitcast %Int16 8 to %Int16
  %19 = icmp eq %Int16 %3, %18
  br i1 %19, label %select_1_2_ok, label %select_1_3
select_1_2_ok:
  %20 = alloca %union.4
  store %union.4 %2, %union.4* %20, align 64
  %21 = getelementptr inbounds %union.4, %union.4* %20, i1 0, i32 1
  %22 = bitcast [56 x %Nat8]* %21 to %AstValueIndex*
  %23 = load %AstValueIndex, %AstValueIndex* %22
  %24 = call %Value* (%AstValueIndex) @func490 (%AstValueIndex %23)
  br label %select_1_end
select_1_3:
  %25 = bitcast %Int16 7 to %Int16
  %26 = icmp eq %Int16 %3, %25
  br i1 %26, label %select_1_3_ok, label %select_1_4
select_1_3_ok:
  %27 = alloca %union.4
  store %union.4 %2, %union.4* %27, align 64
  %28 = getelementptr inbounds %union.4, %union.4* %27, i1 0, i32 1
  %29 = bitcast [56 x %Nat8]* %28 to %AstValueAccess*
  %30 = load %AstValueAccess, %AstValueAccess* %29
  %31 = call %Value* (%AstValueAccess) @func492 (%AstValueAccess %30)
  br label %select_1_end
select_1_4:
  %32 = call %Value* (%union.4*) @func480 (%union.4* %0)
  br label %select_1_end
select_1_end:
  %33 = phi %Value* [ %10, %select_1_0_ok ], [ %17, %select_1_1_ok ], [ %24, %select_1_2_ok ], [ %31, %select_1_3_ok ], [ %32, %select_1_4 ]
  ret %Value* %33
}

define void @func482 (%Unit*, %Unit*, %Nat32, %Node*) {
  %5 = bitcast %Unit* %0 to %AstValueWhenVariant*
  %6 = bitcast %Unit* %1 to %func481.type8*
  %7 = getelementptr inbounds %AstValueWhenVariant, %AstValueWhenVariant* %5, i1 0, i32 1
  %8 = load %union.4*, %union.4** %7; loadImmPtr
  %9 = inttoptr i64 0 to%union.4*
  %10 = icmp ne %union.4* %8, %9
  br i1 %10, label %then_0, label %else_0
then_0:
  %11 = getelementptr inbounds %AstValueWhenVariant, %AstValueWhenVariant* %5, i1 0, i32 1
  %12 = load %union.4*, %union.4** %11
  %13 = call %Value* (%union.4*) @func476 (%union.4* %12)
  %14 = getelementptr inbounds %func481.type8, %func481.type8* %6, i1 0, i32 0
  %15 = load %Value*, %Value** %14
  %16 = getelementptr inbounds %Value, %Value* %15, i1 0, i32 0
  %17 = load %Type*, %Type** %16
  %18 = call %Value* (%Value*, %Type*) @func537 (%Value* %13, %Type* %17)
  %19 = getelementptr inbounds %AstValueWhenVariant, %AstValueWhenVariant* %5, i1 0, i32 2
  %20 = load %union.4*, %union.4** %19
  %21 = call %Value* (%union.4*) @func476 (%union.4* %20)
  %22 = getelementptr inbounds %func481.type8, %func481.type8* %6, i1 0, i32 2
  %23 = load %Type*, %Type** %22
  br label %select_1_0
select_1_0:; loadImmPtr
  %24 = inttoptr i64 0 to%Type*
  %25 = icmp eq %Type* %23, %24
  br i1 %25, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  br label %select_1_end
select_1_1:
  %26 = getelementptr inbounds %func481.type8, %func481.type8* %6, i1 0, i32 2
  %27 = load %Type*, %Type** %26
  %28 = call %Value* (%Value*, %Type*) @func537 (%Value* %21, %Type* %27)
  br label %select_1_end
select_1_end:
  %29 = phi %Value* [ %21, %select_1_0_ok ], [ %28, %select_1_1 ]
  %30 = getelementptr inbounds %func481.type8, %func481.type8* %6, i1 0, i32 2
  %31 = load %Type*, %Type** %30; loadImmPtr
  %32 = inttoptr i64 0 to%Type*
  %33 = icmp eq %Type* %31, %32
  br i1 %33, label %then_1, label %else_1
then_1:
  %34 = getelementptr inbounds %func481.type8, %func481.type8* %6, i1 0, i32 2
  %35 = getelementptr inbounds %Value, %Value* %29, i1 0, i32 0
  %36 = load %Type*, %Type** %35
  store %Type* %36, %Type** %34, align 8
  br label %endif_1
else_1:
  %37 = getelementptr inbounds %func481.type8, %func481.type8* %6, i1 0, i32 2
  %38 = load %Type*, %Type** %37
  %39 = getelementptr inbounds %Value, %Value* %29, i1 0, i32 0
  %40 = load %Type*, %Type** %39
  %41 = getelementptr inbounds %Value, %Value* %29, i1 0, i32 3
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
  %45 = getelementptr inbounds %func481.type8, %func481.type8* %6, i1 0, i32 0
  %46 = load %Value*, %Value** %45
  %47 = getelementptr inbounds %Value, %Value* %46, i1 0, i32 0
  %48 = load %Type*, %Type** %47
  %49 = getelementptr inbounds %Value, %Value* %18, i1 0, i32 0
  %50 = load %Type*, %Type** %49
  %51 = getelementptr inbounds %Value, %Value* %18, i1 0, i32 3
  %52 = load %TokenInfo*, %TokenInfo** %51
  %53 = call i1 (%Type*, %Type*, %TokenInfo*) @type_check (%Type* %48, %Type* %50, %TokenInfo* %52)
  %54 = xor i1 %53, 1
  br i1 %54, label %then_3, label %else_3
then_3:
  br label %endif_3
else_3:
  br label %endif_3
endif_3:
  %55 = call %Unit* (%Nat32) @malloc (%Nat32 40)
  %56 = bitcast %Unit* %55 to %ValueWhenVariant*
  %57 = insertvalue %ValueWhenVariant zeroinitializer, %Value* %18, 1
  %58 = insertvalue %ValueWhenVariant %57, %Value* %29, 2
  %59 = getelementptr inbounds %AstValueWhenVariant, %AstValueWhenVariant* %5, i1 0, i32 3
  %60 = load %TokenInfo*, %TokenInfo** %59
  %61 = insertvalue %ValueWhenVariant %58, %TokenInfo* %60, 4
  store %ValueWhenVariant %61, %ValueWhenVariant* %56, align 8
  %62 = getelementptr inbounds %func481.type8, %func481.type8* %6, i1 0, i32 3
  %63 = bitcast %ValueWhenVariant* %56 to %Unit*
  %64 = call i1 (%List*, %Unit*) @list_append (%List* %62, %Unit* %63)
  br label %endif_0
else_0:
  %65 = getelementptr inbounds %AstValueWhenVariant, %AstValueWhenVariant* %5, i1 0, i32 0
  %66 = load %union.2*, %union.2** %65
  %67 = call %Type* (%union.2*) @func413 (%union.2* %66)
  %68 = getelementptr inbounds %func481.type8, %func481.type8* %6, i1 0, i32 0
  %69 = load %Value*, %Value** %68
  %70 = getelementptr inbounds %Value, %Value* %69, i1 0, i32 0
  %71 = load %Type*, %Type** %70
  %72 = getelementptr inbounds %Type, %Type* %71, i1 0, i32 0
  %73 = load %TypeKind, %TypeKind* %72
  %74 = icmp ne %TypeKind %73, 16
  br i1 %74, label %then_4, label %else_4
then_4:
  %75 = bitcast [31 x %Nat8]* @func481_func482_str1 to %Str
  %76 = getelementptr inbounds %func481.type8, %func481.type8* %6, i1 0, i32 0
  %77 = load %Value*, %Value** %76
  %78 = getelementptr inbounds %Value, %Value* %77, i1 0, i32 3
  %79 = load %TokenInfo*, %TokenInfo** %78
  call void (%Str, %TokenInfo*) @error (%Str %75, %TokenInfo* %79)
  br label %endif_4
else_4:
  br label %endif_4
endif_4:
  %80 = getelementptr inbounds %func481.type8, %func481.type8* %6, i1 0, i32 0
  %81 = load %Value*, %Value** %80
  %82 = getelementptr inbounds %Value, %Value* %81, i1 0, i32 0
  %83 = load %Type*, %Type** %82
  %84 = getelementptr inbounds %Type, %Type* %83, i1 0, i32 14
  %85 = getelementptr inbounds %TypeUnion, %TypeUnion* %84, i1 0, i32 0
  %86 = call i1 (%List*, %Type*) @func140 (%List* %85, %Type* %67)
  %87 = xor i1 %86, 1
  br i1 %87, label %then_5, label %else_5
then_5:
  %88 = bitcast [11 x %Nat8]* @func481_func482_str2 to %Str
  %89 = getelementptr inbounds %Type, %Type* %67, i1 0, i32 16
  %90 = load %TokenInfo*, %TokenInfo** %89
  call void (%Str, %TokenInfo*) @error (%Str %88, %TokenInfo* %90)
  br label %endif_5
else_5:
  br label %endif_5
endif_5:
  %91 = alloca %Context
  %92 = load %Context*, %Context** @cctx
  %93 = insertvalue %Context zeroinitializer, %Context* %92, 0
  store %Context %93, %Context* %91, align 8
  %94 = load %Context*, %Context** @cctx
  %95 = getelementptr inbounds %AstValueWhenVariant, %AstValueWhenVariant* %5, i1 0, i32 2
  %96 = load %union.4*, %union.4** %95
  %97 = call %Value* (%union.4*) @func476 (%union.4* %96)
  store %Context* %94, %Context** @cctx, align 8
  %98 = getelementptr inbounds %func481.type8, %func481.type8* %6, i1 0, i32 2
  %99 = load %Type*, %Type** %98; loadImmPtr
  %100 = inttoptr i64 0 to%Type*
  %101 = icmp eq %Type* %99, %100
  br i1 %101, label %then_6, label %else_6
then_6:
  %102 = getelementptr inbounds %func481.type8, %func481.type8* %6, i1 0, i32 2
  %103 = getelementptr inbounds %Value, %Value* %97, i1 0, i32 0
  %104 = load %Type*, %Type** %103
  store %Type* %104, %Type** %102, align 8
  br label %endif_6
else_6:
  %105 = getelementptr inbounds %Value, %Value* %97, i1 0, i32 0
  %106 = load %Type*, %Type** %105
  %107 = getelementptr inbounds %func481.type8, %func481.type8* %6, i1 0, i32 2
  %108 = load %Type*, %Type** %107
  %109 = getelementptr inbounds %Value, %Value* %97, i1 0, i32 3
  %110 = load %TokenInfo*, %TokenInfo** %109
  %111 = call i1 (%Type*, %Type*, %TokenInfo*) @type_check (%Type* %106, %Type* %108, %TokenInfo* %110)
  %112 = xor i1 %111, 1
  br i1 %112, label %then_7, label %else_7
then_7:
  br label %endif_7
else_7:
  br label %endif_7
endif_7:
  br label %endif_6
endif_6:
  %113 = getelementptr inbounds %func481.type8, %func481.type8* %6, i1 0, i32 2
  %114 = load %Type*, %Type** %113
  br label %select_2_0
select_2_0:; loadImmPtr
  %115 = inttoptr i64 0 to%Type*
  %116 = icmp eq %Type* %114, %115
  br i1 %116, label %select_2_0_ok, label %select_2_1
select_2_0_ok:
  br label %select_2_end
select_2_1:
  %117 = getelementptr inbounds %func481.type8, %func481.type8* %6, i1 0, i32 2
  %118 = load %Type*, %Type** %117
  %119 = call %Value* (%Value*, %Type*) @func537 (%Value* %97, %Type* %118)
  br label %select_2_end
select_2_end:
  %120 = phi %Value* [ %97, %select_2_0_ok ], [ %119, %select_2_1 ]
  %121 = getelementptr inbounds %func481.type8, %func481.type8* %6, i1 0, i32 0
  %122 = load %Value*, %Value** %121
  %123 = getelementptr inbounds %Value, %Value* %122, i1 0, i32 0
  %124 = load %Type*, %Type** %123
  %125 = call %Nat32 (%Type*, %Type*) @func451 (%Type* %124, %Type* %67)
  %126 = call %Unit* (%Nat32) @malloc (%Nat32 40)
  %127 = bitcast %Unit* %126 to %ValueWhenVariant*; loadImmPtr
  %128 = inttoptr i64 0 to%Value*
  %129 = insertvalue %ValueWhenVariant zeroinitializer, %Value* %128, 1
  %130 = insertvalue %ValueWhenVariant %129, %Nat32 %125, 3
  %131 = insertvalue %ValueWhenVariant %130, %Value* %120, 2
  %132 = getelementptr inbounds %AstValueWhenVariant, %AstValueWhenVariant* %5, i1 0, i32 3
  %133 = load %TokenInfo*, %TokenInfo** %132
  %134 = insertvalue %ValueWhenVariant %131, %TokenInfo* %133, 4
  store %ValueWhenVariant %134, %ValueWhenVariant* %127, align 8
  %135 = getelementptr inbounds %func481.type8, %func481.type8* %6, i1 0, i32 3
  %136 = bitcast %ValueWhenVariant* %127 to %Unit*
  %137 = call i1 (%List*, %Unit*) @list_append (%List* %135, %Unit* %136)
  br label %endif_0
endif_0:
  ret void
}

define %Value* @func481 (%AstValueWhen) {
  %2 = extractvalue %AstValueWhen %0, 0
  %3 = call %Value* (%union.4*) @func476 (%union.4* %2)
  %4 = alloca %func481.type8
  %5 = insertvalue %func481.type8 zeroinitializer, %Value* %3, 0
  store %func481.type8 %5, %func481.type8* %4, align 8
  %6 = alloca %List
  %7 = extractvalue %AstValueWhen %0, 1
  store %List %7, %List* %6, align 8
  %8 = getelementptr inbounds %List, %List* %6, i1 0
  %9 = getelementptr inbounds %func481.type8, %func481.type8* %4, i1 0
  %10 = bitcast %func481.type8* %9 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @func64 (%List* %8, %ListForeachHandler @func482, %Unit* %10)
  %11 = extractvalue %AstValueWhen %0, 2; loadImmPtr
  %12 = inttoptr i64 0 to%union.4*
  %13 = icmp eq %union.4* %11, %12
  br i1 %13, label %then_0, label %else_0
then_0:
  %14 = bitcast [25 x %Nat8]* @func481_str1 to %Str
  %15 = extractvalue %AstValueWhen %0, 3
  call void (%Str, %TokenInfo*) @error (%Str %14, %TokenInfo* %15)
  %16 = extractvalue %AstValueWhen %0, 3
  %17 = call %Value* (%TokenInfo*) @value_new_poison (%TokenInfo* %16)
  ret %Value* %17
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %19 = extractvalue %AstValueWhen %0, 2
  %20 = call %Value* (%union.4*) @func476 (%union.4* %19)
  %21 = getelementptr inbounds %func481.type8, %func481.type8* %4, i1 0, i32 2
  %22 = load %Type*, %Type** %21
  %23 = call %Value* (%Value*, %Type*) @func537 (%Value* %20, %Type* %22)
  %24 = getelementptr inbounds %Value, %Value* %3, i1 0, i32 0
  %25 = load %Type*, %Type** %24
  %26 = getelementptr inbounds %Type, %Type* %25, i1 0, i32 0
  %27 = load %TypeKind, %TypeKind* %26
  %28 = icmp eq %TypeKind %27, 16
  %29 = insertvalue %ValueWhen zeroinitializer, %Value* %3, 2
  %30 = insertvalue %ValueWhen %29, i1 %28, 1
  %31 = getelementptr inbounds %func481.type8, %func481.type8* %4, i1 0, i32 3
  %32 = load %List, %List* %31
  %33 = insertvalue %ValueWhen %30, %List %32, 3
  %34 = insertvalue %ValueWhen %33, %Value* %23, 4
  %35 = getelementptr inbounds %func481.type8, %func481.type8* %4, i1 0, i32 2
  %36 = load %Type*, %Type** %35
  %37 = insertvalue %ValueWhen %34, %Type* %36, 0
  %38 = extractvalue %AstValueWhen %0, 3
  %39 = insertvalue %ValueWhen %37, %TokenInfo* %38, 5
  %40 = alloca %union.9
; write variant 0
  %41 = getelementptr inbounds %union.9, %union.9* %40, i1 0, i32 0
  store %Int16 0, %Int16* %41, align 2
; write data
  %42 = getelementptr inbounds %union.9, %union.9* %40, i1 0, i32 1
  %43 = bitcast [72 x %Nat8]* %42 to %ValueWhen*
  store %ValueWhen %39, %ValueWhen* %43, align 8
  %44 = load %union.9, %union.9* %40
  %45 = getelementptr inbounds %func481.type8, %func481.type8* %4, i1 0, i32 2
  %46 = load %Type*, %Type** %45
  %47 = extractvalue %AstValueWhen %0, 3
  %48 = call %Value* (%union.9, %Type*, %TokenInfo*) @func455 (%union.9 %44, %Type* %46, %TokenInfo* %47)
  ret %Value* %48
}

define %Value* @func483 (%AstValueUnary) {
  %2 = extractvalue %AstValueUnary %0, 0
  %3 = call %Value* (%union.4*) @func476 (%union.4* %2)
  %4 = getelementptr inbounds %Value, %Value* %3, i1 0, i32 1
  %5 = load %union.9, %union.9* %4
  %6 = extractvalue %union.9 %5, 0
  %7 = bitcast %Int16 40 to %Int16
  %8 = icmp eq %Int16 %6, %7
  br i1 %8, label %then_0, label %else_0
then_0:
  ret %Value* %3
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %10 = getelementptr inbounds %Value, %Value* %3, i1 0, i32 0
  %11 = getelementptr inbounds %Value, %Value* %3, i1 0, i32 0
  %12 = load %Type*, %Type** %11
  %13 = getelementptr inbounds %Type, %Type* %12, i1 0, i32 0
  %14 = load %TypeKind, %TypeKind* %13
  br label %select_1_0
select_1_0:
  %15 = icmp eq %TypeKind %14, 8
  br i1 %15, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %16 = getelementptr inbounds %Value, %Value* %3, i1 0, i32 0
  %17 = load %Type*, %Type** %16
  %18 = getelementptr inbounds %Type, %Type* %17, i1 0, i32 13
  %19 = getelementptr inbounds %TypeVar, %TypeVar* %18, i1 0, i32 0
  %20 = load %Type*, %Type** %19
  br label %select_1_end
select_1_1:
  %21 = getelementptr inbounds %Value, %Value* %3, i1 0, i32 0
  %22 = load %Type*, %Type** %21
  br label %select_1_end
select_1_end:
  %23 = phi %Type* [ %20, %select_1_0_ok ], [ %22, %select_1_1 ]
  store %Type* %23, %Type** %10, align 8
  %24 = getelementptr inbounds %Value, %Value* %3, i1 0, i32 1
  %25 = load %union.9, %union.9* %24
  %26 = extractvalue %union.9 %25, 0
  %27 = bitcast %Int16 40 to %Int16
  %28 = icmp eq %Int16 %26, %27
  br i1 %28, label %then_1, label %else_1
then_1:
  ret %Value* %3
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  %30 = getelementptr inbounds %Value, %Value* %3, i1 0, i32 0
  %31 = load %Type*, %Type** %30
  %32 = extractvalue %AstValueUnary %0, 1
  %33 = call %Type* (%Type*, %TokenInfo*) @func395 (%Type* %31, %TokenInfo* %32)
  %34 = insertvalue %ValueUn zeroinitializer, %Type* %33, 0
  %35 = insertvalue %ValueUn %34, %Value* %3, 1
  %36 = extractvalue %AstValueUnary %0, 1
  %37 = insertvalue %ValueUn %35, %TokenInfo* %36, 2
  %38 = alloca %union.9
; write variant 29
  %39 = getelementptr inbounds %union.9, %union.9* %38, i1 0, i32 0
  store %Int16 29, %Int16* %39, align 2
; write data
  %40 = getelementptr inbounds %union.9, %union.9* %38, i1 0, i32 1
  %41 = bitcast [72 x %Nat8]* %40 to %ValueUn*
  store %ValueUn %37, %ValueUn* %41, align 8
  %42 = load %union.9, %union.9* %38
  %43 = extractvalue %AstValueUnary %0, 1
  %44 = call %Value* (%union.9, %Type*, %TokenInfo*) @func455 (%union.9 %42, %Type* %33, %TokenInfo* %43)
  ret %Value* %44
}

define %Value* @func484 (%AstValueUnary) {
  %2 = extractvalue %AstValueUnary %0, 0
  %3 = call %Value* (%union.4*) @func476 (%union.4* %2)
  %4 = getelementptr inbounds %Value, %Value* %3, i1 0, i32 1
  %5 = load %union.9, %union.9* %4
  %6 = extractvalue %union.9 %5, 0
  %7 = bitcast %Int16 40 to %Int16
  %8 = icmp eq %Int16 %6, %7
  br i1 %8, label %then_0, label %else_0
then_0:
  ret %Value* %3
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %10 = getelementptr inbounds %Value, %Value* %3, i1 0, i32 0
  %11 = load %Type*, %Type** %10
  %12 = getelementptr inbounds %Type, %Type* %11, i1 0, i32 0
  %13 = load %TypeKind, %TypeKind* %12
  %14 = icmp ne %TypeKind %13, 13
  br i1 %14, label %then_1, label %else_1
then_1:
  %15 = bitcast [17 x %Nat8]* @func484_str1 to %Str
  %16 = getelementptr inbounds %Value, %Value* %3, i1 0, i32 3
  %17 = load %TokenInfo*, %TokenInfo** %16
  call void (%Str, %TokenInfo*) @error (%Str %15, %TokenInfo* %17)
  %18 = extractvalue %AstValueUnary %0, 1
  %19 = call %Value* (%TokenInfo*) @value_new_poison (%TokenInfo* %18)
  ret %Value* %19
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  %21 = getelementptr inbounds %Value, %Value* %3, i1 0, i32 0
  %22 = load %Type*, %Type** %21
  %23 = getelementptr inbounds %Type, %Type* %22, i1 0, i32 8
  %24 = getelementptr inbounds %TypePointer, %TypePointer* %23, i1 0, i32 0
  %25 = load %Type*, %Type** %24
  %26 = insertvalue %ValueUn zeroinitializer, %Type* %25, 0
  %27 = insertvalue %ValueUn %26, %Value* %3, 1
  %28 = extractvalue %AstValueUnary %0, 1
  %29 = insertvalue %ValueUn %27, %TokenInfo* %28, 2
  %30 = alloca %union.9
; write variant 28
  %31 = getelementptr inbounds %union.9, %union.9* %30, i1 0, i32 0
  store %Int16 28, %Int16* %31, align 2
; write data
  %32 = getelementptr inbounds %union.9, %union.9* %30, i1 0, i32 1
  %33 = bitcast [72 x %Nat8]* %32 to %ValueUn*
  store %ValueUn %29, %ValueUn* %33, align 8
  %34 = load %union.9, %union.9* %30
  %35 = extractvalue %AstValueUnary %0, 1
  %36 = call %Value* (%union.9, %Type*, %TokenInfo*) @func455 (%union.9 %34, %Type* %25, %TokenInfo* %35)
  ret %Value* %36
}

define i1 @func486 (%ValueKind) {
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

define %Value* @func485 (%ValueKind, %union.4*, %union.4*, %TokenInfo*) {
  %5 = call %Value* (%union.4*) @func476 (%union.4* %1)
  %6 = call %Value* (%union.4*) @func476 (%union.4* %2)
  %7 = getelementptr inbounds %Value, %Value* %5, i1 0, i32 1
  %8 = load %union.9, %union.9* %7
  %9 = extractvalue %union.9 %8, 0
  %10 = bitcast %Int16 40 to %Int16
  %11 = icmp eq %Int16 %9, %10
  br i1 %11, label %then_0, label %else_0
then_0:
  ret %Value* %5
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %13 = getelementptr inbounds %Value, %Value* %6, i1 0, i32 1
  %14 = load %union.9, %union.9* %13
  %15 = extractvalue %union.9 %14, 0
  %16 = bitcast %Int16 40 to %Int16
  %17 = icmp eq %Int16 %15, %16
  br i1 %17, label %then_1, label %else_1
then_1:
  ret %Value* %6
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  %19 = getelementptr inbounds %Value, %Value* %6, i1 0, i32 0
  %20 = load %Type*, %Type** %19
  %21 = call %Value* (%Value*, %Type*) @func537 (%Value* %5, %Type* %20)
  %22 = getelementptr inbounds %Value, %Value* %21, i1 0, i32 0
  %23 = load %Type*, %Type** %22
  %24 = call %Value* (%Value*, %Type*) @func537 (%Value* %6, %Type* %23)
  %25 = getelementptr inbounds %Value, %Value* %21, i1 0, i32 0
  %26 = load %Type*, %Type** %25
  %27 = getelementptr inbounds %Value, %Value* %24, i1 0, i32 0
  %28 = load %Type*, %Type** %27
  %29 = call i1 (%Type*, %Type*, %TokenInfo*) @type_check (%Type* %26, %Type* %28, %TokenInfo* %3)
  %30 = xor i1 %29, 1
  br i1 %30, label %then_2, label %else_2
then_2:
  br label %fail
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
  %32 = getelementptr inbounds %Value, %Value* %21, i1 0, i32 0
  %33 = load %Type*, %Type** %32
  %34 = call i1 (%ValueKind, %Type*) @func531 (%ValueKind %0, %Type* %33)
  %35 = xor i1 %34, 1
  br i1 %35, label %then_3, label %else_3
then_3:
  %36 = bitcast [18 x %Nat8]* @func485_str1 to %Str
  call void (%Str, %TokenInfo*) @error (%Str %36, %TokenInfo* %3)
  br label %fail
  br label %endif_3
else_3:
  br label %endif_3
endif_3:
  %38 = call i1 (%ValueKind) @func486 (%ValueKind %0)
  br label %select_1_0
select_1_0:
  %39 = icmp eq i1 %38, 1
  br i1 %39, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %40 = load %Type*, %Type** @typeBool
  br label %select_1_end
select_1_1:
  %41 = getelementptr inbounds %Value, %Value* %21, i1 0, i32 0
  %42 = load %Type*, %Type** %41
  br label %select_1_end
select_1_end:
  %43 = phi %Type* [ %40, %select_1_0_ok ], [ %42, %select_1_1 ]
  %44 = call i1 (%Value*) @is_value_imm_num (%Value* %21)
  %45 = call i1 (%Value*) @is_value_imm_num (%Value* %24)
  %46 = and i1 %44, %45
  br i1 %46, label %then_4, label %else_4
then_4:
  %47 = getelementptr inbounds %Value, %Value* %21, i1 0, i32 1
  %48 = load %union.9, %union.9* %47
  %49 = alloca %union.9
  store %union.9 %48, %union.9* %49, align 128
  %50 = getelementptr inbounds %union.9, %union.9* %49, i1 0, i32 1
  %51 = bitcast [72 x %Nat8]* %50 to %ValueImm*
  %52 = load %ValueImm, %ValueImm* %51
  %53 = extractvalue %ValueImm %52, 1
  %54 = getelementptr inbounds %Value, %Value* %24, i1 0, i32 1
  %55 = load %union.9, %union.9* %54
  %56 = alloca %union.9
  store %union.9 %55, %union.9* %56, align 128
  %57 = getelementptr inbounds %union.9, %union.9* %56, i1 0, i32 1
  %58 = bitcast [72 x %Nat8]* %57 to %ValueImm*
  %59 = load %ValueImm, %ValueImm* %58
  %60 = extractvalue %ValueImm %59, 1
  br label %select_2_0
select_2_0:
  %61 = icmp eq %ValueKind %0, 18
  br i1 %61, label %select_2_0_ok, label %select_2_1
select_2_0_ok:
  %62 = add %Int64 %53, %60
  br label %select_2_end
select_2_1:
  %63 = icmp eq %ValueKind %0, 19
  br i1 %63, label %select_2_1_ok, label %select_2_2
select_2_1_ok:
  %64 = sub %Int64 %53, %60
  br label %select_2_end
select_2_2:
  %65 = icmp eq %ValueKind %0, 20
  br i1 %65, label %select_2_2_ok, label %select_2_3
select_2_2_ok:
  %66 = mul %Int64 %53, %60
  br label %select_2_end
select_2_3:
  %67 = icmp eq %ValueKind %0, 21
  br i1 %67, label %select_2_3_ok, label %select_2_4
select_2_3_ok:
  %68 = sdiv %Int64 %53, %60
  br label %select_2_end
select_2_4:
  %69 = icmp eq %ValueKind %0, 22
  br i1 %69, label %select_2_4_ok, label %select_2_5
select_2_4_ok:
  %70 = srem %Int64 %53, %60
  br label %select_2_end
select_2_5:
  %71 = icmp eq %ValueKind %0, 23
  br i1 %71, label %select_2_5_ok, label %select_2_6
select_2_5_ok:
  %72 = or %Int64 %53, %60
  br label %select_2_end
select_2_6:
  %73 = icmp eq %ValueKind %0, 24
  br i1 %73, label %select_2_6_ok, label %select_2_7
select_2_6_ok:
  %74 = xor %Int64 %53, %60
  br label %select_2_end
select_2_7:
  %75 = icmp eq %ValueKind %0, 25
  br i1 %75, label %select_2_7_ok, label %select_2_8
select_2_7_ok:
  %76 = and %Int64 %53, %60
  br label %select_2_end
select_2_8:
  %77 = icmp eq %ValueKind %0, 26
  br i1 %77, label %select_2_8_ok, label %select_2_9
select_2_8_ok:
  %78 = icmp eq %Int64 %53, %60
  %79 = zext i1 %78 to %Int64
  br label %select_2_end
select_2_9:
  %80 = icmp eq %ValueKind %0, 27
  br i1 %80, label %select_2_9_ok, label %select_2_10
select_2_9_ok:
  %81 = icmp ne %Int64 %53, %60
  %82 = zext i1 %81 to %Int64
  br label %select_2_end
select_2_10:
  %83 = icmp eq %ValueKind %0, 28
  br i1 %83, label %select_2_10_ok, label %select_2_11
select_2_10_ok:
  %84 = icmp slt %Int64 %53, %60
  %85 = zext i1 %84 to %Int64
  br label %select_2_end
select_2_11:
  %86 = icmp eq %ValueKind %0, 29
  br i1 %86, label %select_2_11_ok, label %select_2_12
select_2_11_ok:
  %87 = icmp sgt %Int64 %53, %60
  %88 = zext i1 %87 to %Int64
  br label %select_2_end
select_2_12:
  %89 = icmp eq %ValueKind %0, 30
  br i1 %89, label %select_2_12_ok, label %select_2_13
select_2_12_ok:
  %90 = icmp sle %Int64 %53, %60
  %91 = zext i1 %90 to %Int64
  br label %select_2_end
select_2_13:
  %92 = icmp eq %ValueKind %0, 31
  br i1 %92, label %select_2_13_ok, label %select_2_14
select_2_13_ok:
  %93 = icmp sge %Int64 %53, %60
  %94 = zext i1 %93 to %Int64
  br label %select_2_end
select_2_14:
  %95 = bitcast %Int64 0 to %Int64
  br label %select_2_end
select_2_end:
  %96 = phi %Int64 [ %62, %select_2_0_ok ], [ %64, %select_2_1_ok ], [ %66, %select_2_2_ok ], [ %68, %select_2_3_ok ], [ %70, %select_2_4_ok ], [ %72, %select_2_5_ok ], [ %74, %select_2_6_ok ], [ %76, %select_2_7_ok ], [ %79, %select_2_8_ok ], [ %82, %select_2_9_ok ], [ %85, %select_2_10_ok ], [ %88, %select_2_11_ok ], [ %91, %select_2_12_ok ], [ %94, %select_2_13_ok ], [ %95, %select_2_14 ]
  %97 = call %Value* (%Type*, %Int64, %TokenInfo*) @func457 (%Type* %43, %Int64 %96, %TokenInfo* %3)
  ret %Value* %97
  br label %endif_4
else_4:
  br label %endif_4
endif_4:
  br label %select_3_0
select_3_0:
  %99 = icmp eq %ValueKind %0, 18
  br i1 %99, label %select_3_0_ok, label %select_3_1
select_3_0_ok:
  %100 = insertvalue %ValueBin zeroinitializer, %Type* %43, 0
  %101 = insertvalue %ValueBin %100, %Value* %21, 1
  %102 = insertvalue %ValueBin %101, %Value* %24, 2
  %103 = insertvalue %ValueBin %102, %TokenInfo* %3, 3
  %104 = alloca %union.9
; write variant 24
  %105 = getelementptr inbounds %union.9, %union.9* %104, i1 0, i32 0
  store %Int16 24, %Int16* %105, align 2
; write data
  %106 = getelementptr inbounds %union.9, %union.9* %104, i1 0, i32 1
  %107 = bitcast [72 x %Nat8]* %106 to %ValueBin*
  store %ValueBin %103, %ValueBin* %107, align 8
  %108 = load %union.9, %union.9* %104
  %109 = call %Value* (%union.9, %Type*, %TokenInfo*) @func455 (%union.9 %108, %Type* %43, %TokenInfo* %3)
  br label %select_3_end
select_3_1:
  %110 = icmp eq %ValueKind %0, 19
  br i1 %110, label %select_3_1_ok, label %select_3_2
select_3_1_ok:
  %111 = insertvalue %ValueBin zeroinitializer, %Type* %43, 0
  %112 = insertvalue %ValueBin %111, %Value* %21, 1
  %113 = insertvalue %ValueBin %112, %Value* %24, 2
  %114 = insertvalue %ValueBin %113, %TokenInfo* %3, 3
  %115 = alloca %union.9
; write variant 23
  %116 = getelementptr inbounds %union.9, %union.9* %115, i1 0, i32 0
  store %Int16 23, %Int16* %116, align 2
; write data
  %117 = getelementptr inbounds %union.9, %union.9* %115, i1 0, i32 1
  %118 = bitcast [72 x %Nat8]* %117 to %ValueBin*
  store %ValueBin %114, %ValueBin* %118, align 8
  %119 = load %union.9, %union.9* %115
  %120 = call %Value* (%union.9, %Type*, %TokenInfo*) @func455 (%union.9 %119, %Type* %43, %TokenInfo* %3)
  br label %select_3_end
select_3_2:
  %121 = icmp eq %ValueKind %0, 20
  br i1 %121, label %select_3_2_ok, label %select_3_3
select_3_2_ok:
  %122 = insertvalue %ValueBin zeroinitializer, %Type* %43, 0
  %123 = insertvalue %ValueBin %122, %Value* %21, 1
  %124 = insertvalue %ValueBin %123, %Value* %24, 2
  %125 = insertvalue %ValueBin %124, %TokenInfo* %3, 3
  %126 = alloca %union.9
; write variant 22
  %127 = getelementptr inbounds %union.9, %union.9* %126, i1 0, i32 0
  store %Int16 22, %Int16* %127, align 2
; write data
  %128 = getelementptr inbounds %union.9, %union.9* %126, i1 0, i32 1
  %129 = bitcast [72 x %Nat8]* %128 to %ValueBin*
  store %ValueBin %125, %ValueBin* %129, align 8
  %130 = load %union.9, %union.9* %126
  %131 = call %Value* (%union.9, %Type*, %TokenInfo*) @func455 (%union.9 %130, %Type* %43, %TokenInfo* %3)
  br label %select_3_end
select_3_3:
  %132 = icmp eq %ValueKind %0, 21
  br i1 %132, label %select_3_3_ok, label %select_3_4
select_3_3_ok:
  %133 = insertvalue %ValueBin zeroinitializer, %Type* %43, 0
  %134 = insertvalue %ValueBin %133, %Value* %21, 1
  %135 = insertvalue %ValueBin %134, %Value* %24, 2
  %136 = insertvalue %ValueBin %135, %TokenInfo* %3, 3
  %137 = alloca %union.9
; write variant 21
  %138 = getelementptr inbounds %union.9, %union.9* %137, i1 0, i32 0
  store %Int16 21, %Int16* %138, align 2
; write data
  %139 = getelementptr inbounds %union.9, %union.9* %137, i1 0, i32 1
  %140 = bitcast [72 x %Nat8]* %139 to %ValueBin*
  store %ValueBin %136, %ValueBin* %140, align 8
  %141 = load %union.9, %union.9* %137
  %142 = call %Value* (%union.9, %Type*, %TokenInfo*) @func455 (%union.9 %141, %Type* %43, %TokenInfo* %3)
  br label %select_3_end
select_3_4:
  %143 = icmp eq %ValueKind %0, 22
  br i1 %143, label %select_3_4_ok, label %select_3_5
select_3_4_ok:
  %144 = insertvalue %ValueBin zeroinitializer, %Type* %43, 0
  %145 = insertvalue %ValueBin %144, %Value* %21, 1
  %146 = insertvalue %ValueBin %145, %Value* %24, 2
  %147 = insertvalue %ValueBin %146, %TokenInfo* %3, 3
  %148 = alloca %union.9
; write variant 20
  %149 = getelementptr inbounds %union.9, %union.9* %148, i1 0, i32 0
  store %Int16 20, %Int16* %149, align 2
; write data
  %150 = getelementptr inbounds %union.9, %union.9* %148, i1 0, i32 1
  %151 = bitcast [72 x %Nat8]* %150 to %ValueBin*
  store %ValueBin %147, %ValueBin* %151, align 8
  %152 = load %union.9, %union.9* %148
  %153 = call %Value* (%union.9, %Type*, %TokenInfo*) @func455 (%union.9 %152, %Type* %43, %TokenInfo* %3)
  br label %select_3_end
select_3_5:
  %154 = icmp eq %ValueKind %0, 23
  br i1 %154, label %select_3_5_ok, label %select_3_6
select_3_5_ok:
  %155 = insertvalue %ValueBin zeroinitializer, %Type* %43, 0
  %156 = insertvalue %ValueBin %155, %Value* %21, 1
  %157 = insertvalue %ValueBin %156, %Value* %24, 2
  %158 = insertvalue %ValueBin %157, %TokenInfo* %3, 3
  %159 = alloca %union.9
; write variant 19
  %160 = getelementptr inbounds %union.9, %union.9* %159, i1 0, i32 0
  store %Int16 19, %Int16* %160, align 2
; write data
  %161 = getelementptr inbounds %union.9, %union.9* %159, i1 0, i32 1
  %162 = bitcast [72 x %Nat8]* %161 to %ValueBin*
  store %ValueBin %158, %ValueBin* %162, align 8
  %163 = load %union.9, %union.9* %159
  %164 = call %Value* (%union.9, %Type*, %TokenInfo*) @func455 (%union.9 %163, %Type* %43, %TokenInfo* %3)
  br label %select_3_end
select_3_6:
  %165 = icmp eq %ValueKind %0, 24
  br i1 %165, label %select_3_6_ok, label %select_3_7
select_3_6_ok:
  %166 = insertvalue %ValueBin zeroinitializer, %Type* %43, 0
  %167 = insertvalue %ValueBin %166, %Value* %21, 1
  %168 = insertvalue %ValueBin %167, %Value* %24, 2
  %169 = insertvalue %ValueBin %168, %TokenInfo* %3, 3
  %170 = alloca %union.9
; write variant 18
  %171 = getelementptr inbounds %union.9, %union.9* %170, i1 0, i32 0
  store %Int16 18, %Int16* %171, align 2
; write data
  %172 = getelementptr inbounds %union.9, %union.9* %170, i1 0, i32 1
  %173 = bitcast [72 x %Nat8]* %172 to %ValueBin*
  store %ValueBin %169, %ValueBin* %173, align 8
  %174 = load %union.9, %union.9* %170
  %175 = call %Value* (%union.9, %Type*, %TokenInfo*) @func455 (%union.9 %174, %Type* %43, %TokenInfo* %3)
  br label %select_3_end
select_3_7:
  %176 = icmp eq %ValueKind %0, 25
  br i1 %176, label %select_3_7_ok, label %select_3_8
select_3_7_ok:
  %177 = insertvalue %ValueBin zeroinitializer, %Type* %43, 0
  %178 = insertvalue %ValueBin %177, %Value* %21, 1
  %179 = insertvalue %ValueBin %178, %Value* %24, 2
  %180 = insertvalue %ValueBin %179, %TokenInfo* %3, 3
  %181 = alloca %union.9
; write variant 17
  %182 = getelementptr inbounds %union.9, %union.9* %181, i1 0, i32 0
  store %Int16 17, %Int16* %182, align 2
; write data
  %183 = getelementptr inbounds %union.9, %union.9* %181, i1 0, i32 1
  %184 = bitcast [72 x %Nat8]* %183 to %ValueBin*
  store %ValueBin %180, %ValueBin* %184, align 8
  %185 = load %union.9, %union.9* %181
  %186 = call %Value* (%union.9, %Type*, %TokenInfo*) @func455 (%union.9 %185, %Type* %43, %TokenInfo* %3)
  br label %select_3_end
select_3_8:
  %187 = icmp eq %ValueKind %0, 26
  br i1 %187, label %select_3_8_ok, label %select_3_9
select_3_8_ok:
  %188 = insertvalue %ValueBin zeroinitializer, %Type* %43, 0
  %189 = insertvalue %ValueBin %188, %Value* %21, 1
  %190 = insertvalue %ValueBin %189, %Value* %24, 2
  %191 = insertvalue %ValueBin %190, %TokenInfo* %3, 3
  %192 = alloca %union.9
; write variant 16
  %193 = getelementptr inbounds %union.9, %union.9* %192, i1 0, i32 0
  store %Int16 16, %Int16* %193, align 2
; write data
  %194 = getelementptr inbounds %union.9, %union.9* %192, i1 0, i32 1
  %195 = bitcast [72 x %Nat8]* %194 to %ValueBin*
  store %ValueBin %191, %ValueBin* %195, align 8
  %196 = load %union.9, %union.9* %192
  %197 = call %Value* (%union.9, %Type*, %TokenInfo*) @func455 (%union.9 %196, %Type* %43, %TokenInfo* %3)
  br label %select_3_end
select_3_9:
  %198 = icmp eq %ValueKind %0, 27
  br i1 %198, label %select_3_9_ok, label %select_3_10
select_3_9_ok:
  %199 = insertvalue %ValueBin zeroinitializer, %Type* %43, 0
  %200 = insertvalue %ValueBin %199, %Value* %21, 1
  %201 = insertvalue %ValueBin %200, %Value* %24, 2
  %202 = insertvalue %ValueBin %201, %TokenInfo* %3, 3
  %203 = alloca %union.9
; write variant 15
  %204 = getelementptr inbounds %union.9, %union.9* %203, i1 0, i32 0
  store %Int16 15, %Int16* %204, align 2
; write data
  %205 = getelementptr inbounds %union.9, %union.9* %203, i1 0, i32 1
  %206 = bitcast [72 x %Nat8]* %205 to %ValueBin*
  store %ValueBin %202, %ValueBin* %206, align 8
  %207 = load %union.9, %union.9* %203
  %208 = call %Value* (%union.9, %Type*, %TokenInfo*) @func455 (%union.9 %207, %Type* %43, %TokenInfo* %3)
  br label %select_3_end
select_3_10:
  %209 = icmp eq %ValueKind %0, 28
  br i1 %209, label %select_3_10_ok, label %select_3_11
select_3_10_ok:
  %210 = insertvalue %ValueBin zeroinitializer, %Type* %43, 0
  %211 = insertvalue %ValueBin %210, %Value* %21, 1
  %212 = insertvalue %ValueBin %211, %Value* %24, 2
  %213 = insertvalue %ValueBin %212, %TokenInfo* %3, 3
  %214 = alloca %union.9
; write variant 14
  %215 = getelementptr inbounds %union.9, %union.9* %214, i1 0, i32 0
  store %Int16 14, %Int16* %215, align 2
; write data
  %216 = getelementptr inbounds %union.9, %union.9* %214, i1 0, i32 1
  %217 = bitcast [72 x %Nat8]* %216 to %ValueBin*
  store %ValueBin %213, %ValueBin* %217, align 8
  %218 = load %union.9, %union.9* %214
  %219 = call %Value* (%union.9, %Type*, %TokenInfo*) @func455 (%union.9 %218, %Type* %43, %TokenInfo* %3)
  br label %select_3_end
select_3_11:
  %220 = icmp eq %ValueKind %0, 29
  br i1 %220, label %select_3_11_ok, label %select_3_12
select_3_11_ok:
  %221 = insertvalue %ValueBin zeroinitializer, %Type* %43, 0
  %222 = insertvalue %ValueBin %221, %Value* %21, 1
  %223 = insertvalue %ValueBin %222, %Value* %24, 2
  %224 = insertvalue %ValueBin %223, %TokenInfo* %3, 3
  %225 = alloca %union.9
; write variant 13
  %226 = getelementptr inbounds %union.9, %union.9* %225, i1 0, i32 0
  store %Int16 13, %Int16* %226, align 2
; write data
  %227 = getelementptr inbounds %union.9, %union.9* %225, i1 0, i32 1
  %228 = bitcast [72 x %Nat8]* %227 to %ValueBin*
  store %ValueBin %224, %ValueBin* %228, align 8
  %229 = load %union.9, %union.9* %225
  %230 = call %Value* (%union.9, %Type*, %TokenInfo*) @func455 (%union.9 %229, %Type* %43, %TokenInfo* %3)
  br label %select_3_end
select_3_12:
  %231 = icmp eq %ValueKind %0, 30
  br i1 %231, label %select_3_12_ok, label %select_3_13
select_3_12_ok:
  %232 = insertvalue %ValueBin zeroinitializer, %Type* %43, 0
  %233 = insertvalue %ValueBin %232, %Value* %21, 1
  %234 = insertvalue %ValueBin %233, %Value* %24, 2
  %235 = insertvalue %ValueBin %234, %TokenInfo* %3, 3
  %236 = alloca %union.9
; write variant 12
  %237 = getelementptr inbounds %union.9, %union.9* %236, i1 0, i32 0
  store %Int16 12, %Int16* %237, align 2
; write data
  %238 = getelementptr inbounds %union.9, %union.9* %236, i1 0, i32 1
  %239 = bitcast [72 x %Nat8]* %238 to %ValueBin*
  store %ValueBin %235, %ValueBin* %239, align 8
  %240 = load %union.9, %union.9* %236
  %241 = call %Value* (%union.9, %Type*, %TokenInfo*) @func455 (%union.9 %240, %Type* %43, %TokenInfo* %3)
  br label %select_3_end
select_3_13:
  %242 = icmp eq %ValueKind %0, 31
  br i1 %242, label %select_3_13_ok, label %select_3_14
select_3_13_ok:
  %243 = insertvalue %ValueBin zeroinitializer, %Type* %43, 0
  %244 = insertvalue %ValueBin %243, %Value* %21, 1
  %245 = insertvalue %ValueBin %244, %Value* %24, 2
  %246 = insertvalue %ValueBin %245, %TokenInfo* %3, 3
  %247 = alloca %union.9
; write variant 11
  %248 = getelementptr inbounds %union.9, %union.9* %247, i1 0, i32 0
  store %Int16 11, %Int16* %248, align 2
; write data
  %249 = getelementptr inbounds %union.9, %union.9* %247, i1 0, i32 1
  %250 = bitcast [72 x %Nat8]* %249 to %ValueBin*
  store %ValueBin %246, %ValueBin* %250, align 8
  %251 = load %union.9, %union.9* %247
  %252 = call %Value* (%union.9, %Type*, %TokenInfo*) @func455 (%union.9 %251, %Type* %43, %TokenInfo* %3)
  br label %select_3_end
select_3_14:
  %253 = call %Value* (%TokenInfo*) @value_new_poison (%TokenInfo* %3)
  br label %select_3_end
select_3_end:
  %254 = phi %Value* [ %109, %select_3_0_ok ], [ %120, %select_3_1_ok ], [ %131, %select_3_2_ok ], [ %142, %select_3_3_ok ], [ %153, %select_3_4_ok ], [ %164, %select_3_5_ok ], [ %175, %select_3_6_ok ], [ %186, %select_3_7_ok ], [ %197, %select_3_8_ok ], [ %208, %select_3_9_ok ], [ %219, %select_3_10_ok ], [ %230, %select_3_11_ok ], [ %241, %select_3_12_ok ], [ %252, %select_3_13_ok ], [ %253, %select_3_14 ]
  ret %Value* %254
  br label %fail
fail:
  %256 = call %Value* (%TokenInfo*) @value_new_poison (%TokenInfo* %3)
  ret %Value* %256
}

define %Value* @func487 (%AstValueCall) {
  %2 = extractvalue %AstValueCall %0, 0
  %3 = call %Value* (%union.4*) @func476 (%union.4* %2)
  %4 = getelementptr inbounds %Value, %Value* %3, i1 0, i32 1
  %5 = load %union.9, %union.9* %4
  %6 = extractvalue %union.9 %5, 0
  %7 = bitcast %Int16 40 to %Int16
  %8 = icmp eq %Int16 %6, %7
  br i1 %8, label %then_0, label %else_0
then_0:
  ret %Value* %3
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %10 = alloca %List
  %11 = extractvalue %AstValueCall %0, 1
  store %List %11, %List* %10, align 8
  %12 = getelementptr inbounds %List, %List* %10, i1 0
  %13 = extractvalue %AstValueCall %0, 2
  %14 = call %List* (%Value*, %List*, %TokenInfo*) @func488 (%Value* %3, %List* %12, %TokenInfo* %13)
  %15 = getelementptr inbounds %Value, %Value* %3, i1 0, i32 0
  %16 = load %Type*, %Type** %15
  %17 = getelementptr inbounds %Type, %Type* %16, i1 0, i32 7
  %18 = getelementptr inbounds %TypeFunc, %TypeFunc* %17, i1 0, i32 1
  %19 = load %Type*, %Type** %18
  %20 = insertvalue %ValueCall zeroinitializer, %Type* %19, 0
  %21 = insertvalue %ValueCall %20, %Value* %3, 1
  %22 = insertvalue %ValueCall %21, %List* %14, 2
  %23 = extractvalue %AstValueCall %0, 2
  %24 = insertvalue %ValueCall %22, %TokenInfo* %23, 3
  %25 = alloca %union.9
; write variant 2
  %26 = getelementptr inbounds %union.9, %union.9* %25, i1 0, i32 0
  store %Int16 2, %Int16* %26, align 2
; write data
  %27 = getelementptr inbounds %union.9, %union.9* %25, i1 0, i32 1
  %28 = bitcast [72 x %Nat8]* %27 to %ValueCall*
  store %ValueCall %24, %ValueCall* %28, align 8
  %29 = load %union.9, %union.9* %25
  %30 = extractvalue %AstValueCall %0, 2
  %31 = call %Value* (%union.9, %Type*, %TokenInfo*) @func455 (%union.9 %29, %Type* %19, %TokenInfo* %30)
  ret %Value* %31
  br label %fail
fail:
  %33 = extractvalue %AstValueCall %0, 2
  %34 = call %Value* (%TokenInfo*) @value_new_poison (%TokenInfo* %33)
  ret %Value* %34
}

define i1 @func489 (%Unit*, %Unit*, %Unit*, %Nat32) {
  %5 = bitcast %Unit* %0 to %Decl*
  %6 = bitcast %Unit* %1 to %union.4*
  %7 = bitcast %Unit* %2 to %func488.type9*; loadImmPtr
  %8 = inttoptr i64 0 to%union.4*
  %9 = icmp eq %union.4* %6, %8
  br i1 %9, label %then_0, label %else_0
then_0:
  %10 = bitcast [21 x %Nat8]* @func488_func489_str1 to %Str
  %11 = getelementptr inbounds %func488.type9, %func488.type9* %7, i1 0, i32 3
  %12 = load %TokenInfo*, %TokenInfo** %11
  call void (%Str, %TokenInfo*) @error (%Str %10, %TokenInfo* %12)
  ret i1 0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %14 = call %Value* (%union.4*) @func476 (%union.4* %6); loadImmPtr
  %15 = inttoptr i64 0 to%Decl*
  %16 = icmp eq %Decl* %5, %15
  br i1 %16, label %then_1, label %else_1
then_1:
  %17 = getelementptr inbounds %func488.type9, %func488.type9* %7, i1 0, i32 0
  %18 = load %Value*, %Value** %17
  %19 = getelementptr inbounds %Value, %Value* %18, i1 0, i32 0
  %20 = load %Type*, %Type** %19
  %21 = getelementptr inbounds %Type, %Type* %20, i1 0, i32 7
  %22 = getelementptr inbounds %TypeFunc, %TypeFunc* %21, i1 0, i32 2
  %23 = load i1, i1* %22
  %24 = xor i1 %23, 1
  br i1 %24, label %then_2, label %else_2
then_2:
  %25 = bitcast [16 x %Nat8]* @func488_func489_str2 to %Str
  %26 = getelementptr inbounds %Value, %Value* %14, i1 0, i32 3
  %27 = load %TokenInfo*, %TokenInfo** %26
  call void (%Str, %TokenInfo*) @error (%Str %25, %TokenInfo* %27)
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
  %28 = call %Value* (%Value*) @func534 (%Value* %14)
  %29 = getelementptr inbounds %func488.type9, %func488.type9* %7, i1 0, i32 2
  %30 = load %List*, %List** %29
  %31 = bitcast %Value* %28 to %Unit*
  %32 = call i1 (%List*, %Unit*) @list_append (%List* %30, %Unit* %31)
  ret i1 1
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  %34 = getelementptr inbounds %Decl, %Decl* %5, i1 0, i32 1
  %35 = load %Type*, %Type** %34
  %36 = call %Value* (%Value*, %Type*) @func537 (%Value* %14, %Type* %35)
  %37 = getelementptr inbounds %Decl, %Decl* %5, i1 0, i32 1
  %38 = load %Type*, %Type** %37
  %39 = getelementptr inbounds %Value, %Value* %36, i1 0, i32 0
  %40 = load %Type*, %Type** %39
  %41 = getelementptr inbounds %Value, %Value* %14, i1 0, i32 3
  %42 = load %TokenInfo*, %TokenInfo** %41
  %43 = call i1 (%Type*, %Type*, %TokenInfo*) @type_check (%Type* %38, %Type* %40, %TokenInfo* %42)
  %44 = xor i1 %43, 1
  br i1 %44, label %then_3, label %else_3
then_3:
  br label %endif_3
else_3:
  br label %endif_3
endif_3:
  %45 = getelementptr inbounds %func488.type9, %func488.type9* %7, i1 0, i32 2
  %46 = load %List*, %List** %45
  %47 = bitcast %Value* %36 to %Unit*
  %48 = call i1 (%List*, %Unit*) @list_append (%List* %46, %Unit* %47)
  ret i1 1
}

define %List* @func488 (%Value*, %List*, %TokenInfo*) {
  %4 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 0
  %5 = load %Type*, %Type** %4
  %6 = getelementptr inbounds %Type, %Type* %5, i1 0, i32 7
  %7 = getelementptr inbounds %TypeFunc, %TypeFunc* %6, i1 0, i32 0
  %8 = load %Type*, %Type** %7
  %9 = getelementptr inbounds %Type, %Type* %8, i1 0, i32 11
  %10 = getelementptr inbounds %TypeRecord, %TypeRecord* %9, i1 0, i32 0
  %11 = load %List*, %List** %10
  %12 = alloca %func488.type9
  %13 = insertvalue %func488.type9 zeroinitializer, %Value* %0, 0
  %14 = insertvalue %func488.type9 %13, %List* %11, 1
  %15 = call %List* () @map_new ()
  %16 = insertvalue %func488.type9 %14, %List* %15, 2
  %17 = insertvalue %func488.type9 %16, %TokenInfo* %2, 3
  store %func488.type9 %17, %func488.type9* %12, align 8
  %18 = getelementptr inbounds %func488.type9, %func488.type9* %12, i1 0
  %19 = bitcast %func488.type9* %18 to %Unit*
  call void (%List*, %List*, %ListWhileHandler2, %Unit*) @list_while2_or (%List* %11, %List* %1, %ListWhileHandler2 @func489, %Unit* %19)
  %20 = getelementptr inbounds %func488.type9, %func488.type9* %12, i1 0, i32 2
  %21 = load %List*, %List** %20
  ret %List* %21
}

define %Type* @func491 (%Type*) {
  %2 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 0
  %3 = load %TypeKind, %TypeKind* %2
  br label %select_1_0
select_1_0:
  %4 = icmp eq %TypeKind %3, 14
  br i1 %4, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %5 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 9
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

define %Value* @func490 (%AstValueIndex) {
  %2 = extractvalue %AstValueIndex %0, 0
  %3 = call %Value* (%union.4*) @func476 (%union.4* %2)
  %4 = extractvalue %AstValueIndex %0, 1
  %5 = call %Value* (%union.4*) @func476 (%union.4* %4)
  %6 = getelementptr inbounds %Value, %Value* %3, i1 0, i32 1
  %7 = load %union.9, %union.9* %6
  %8 = extractvalue %union.9 %7, 0
  %9 = bitcast %Int16 40 to %Int16
  %10 = icmp eq %Int16 %8, %9
  br i1 %10, label %then_0, label %else_0
then_0:
  br label %fail
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %12 = getelementptr inbounds %Value, %Value* %5, i1 0, i32 1
  %13 = load %union.9, %union.9* %12
  %14 = extractvalue %union.9 %13, 0
  %15 = bitcast %Int16 40 to %Int16
  %16 = icmp eq %Int16 %14, %15
  br i1 %16, label %then_1, label %else_1
then_1:
  br label %fail
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  %18 = getelementptr inbounds %Value, %Value* %3, i1 0, i32 0
  %19 = load %Type*, %Type** %18
  %20 = getelementptr inbounds %Type, %Type* %19, i1 0, i32 0
  %21 = load %TypeKind, %TypeKind* %20
  br label %select_1_0
select_1_0:
  %22 = icmp eq %TypeKind %21, 14
  br i1 %22, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %23 = getelementptr inbounds %Value, %Value* %3, i1 0, i32 0
  %24 = load %Type*, %Type** %23
  %25 = getelementptr inbounds %Type, %Type* %24, i1 0, i32 9
  %26 = getelementptr inbounds %TypeArray, %TypeArray* %25, i1 0, i32 0
  %27 = load %Type*, %Type** %26
  br label %select_1_end
select_1_1:
  %28 = icmp eq %TypeKind %21, 15
  br i1 %28, label %select_1_1_ok, label %select_1_2
select_1_1_ok:
  %29 = getelementptr inbounds %Value, %Value* %3, i1 0, i32 0
  %30 = load %Type*, %Type** %29
  %31 = getelementptr inbounds %Type, %Type* %30, i1 0, i32 10
  %32 = getelementptr inbounds %TypeArrayU, %TypeArrayU* %31, i1 0, i32 0
  %33 = load %Type*, %Type** %32
  br label %select_1_end
select_1_2:
  %34 = icmp eq %TypeKind %21, 13
  br i1 %34, label %select_1_2_ok, label %select_1_3
select_1_2_ok:
  %35 = getelementptr inbounds %Value, %Value* %3, i1 0, i32 0
  %36 = load %Type*, %Type** %35
  %37 = getelementptr inbounds %Type, %Type* %36, i1 0, i32 8
  %38 = getelementptr inbounds %TypePointer, %TypePointer* %37, i1 0, i32 0
  %39 = load %Type*, %Type** %38
  %40 = call %Type* (%Type*) @func491 (%Type* %39)
  br label %select_1_end
select_1_3:; loadImmPtr
  %41 = inttoptr i64 0 to%Type*
  br label %select_1_end
select_1_end:
  %42 = phi %Type* [ %27, %select_1_0_ok ], [ %33, %select_1_1_ok ], [ %40, %select_1_2_ok ], [ %41, %select_1_3 ]; loadImmPtr
  %43 = inttoptr i64 0 to%Type*
  %44 = icmp eq %Type* %42, %43
  br i1 %44, label %then_2, label %else_2
then_2:
  %45 = getelementptr inbounds %Value, %Value* %3, i1 0, i32 3
  %46 = load %TokenInfo*, %TokenInfo** %45
  %47 = getelementptr inbounds %Value, %Value* %3, i1 0, i32 0
  %48 = load %Type*, %Type** %47; loadImmPtr
  %49 = inttoptr i64 0 to%Type*
  call void (%TokenInfo*, %Type*, %Type*) @error_type_error (%TokenInfo* %46, %Type* %48, %Type* %49)
  br label %fail
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
  %51 = call %Value* (%Value*) @func534 (%Value* %5)
  %52 = insertvalue %ValueIndex zeroinitializer, %Type* %42, 0
  %53 = insertvalue %ValueIndex %52, %Value* %3, 1
  %54 = insertvalue %ValueIndex %53, %Value* %51, 2
  %55 = extractvalue %AstValueIndex %0, 2
  %56 = insertvalue %ValueIndex %54, %TokenInfo* %55, 3
  %57 = alloca %union.9
; write variant 8
  %58 = getelementptr inbounds %union.9, %union.9* %57, i1 0, i32 0
  store %Int16 8, %Int16* %58, align 2
; write data
  %59 = getelementptr inbounds %union.9, %union.9* %57, i1 0, i32 1
  %60 = bitcast [72 x %Nat8]* %59 to %ValueIndex*
  store %ValueIndex %56, %ValueIndex* %60, align 8
  %61 = load %union.9, %union.9* %57
  %62 = extractvalue %AstValueIndex %0, 2
  %63 = call %Value* (%union.9, %Type*, %TokenInfo*) @func455 (%union.9 %61, %Type* %42, %TokenInfo* %62)
  ret %Value* %63
  br label %fail
fail:
  %65 = extractvalue %AstValueIndex %0, 2
  %66 = call %Value* (%TokenInfo*) @value_new_poison (%TokenInfo* %65)
  ret %Value* %66
}

define %Type* @func493 (%Type*) {
  %2 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 0
  %3 = load %TypeKind, %TypeKind* %2
  br label %select_1_0
select_1_0:
  %4 = icmp eq %TypeKind %3, 12
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

define %Value* @func492 (%AstValueAccess) {
  %2 = extractvalue %AstValueAccess %0, 0
  %3 = call %Value* (%union.4*) @func476 (%union.4* %2)
  %4 = extractvalue %AstValueAccess %0, 1
  %5 = getelementptr inbounds %AstId, %AstId* %4, i1 0, i32 0
  %6 = load %Str, %Str* %5
  %7 = getelementptr inbounds %Value, %Value* %3, i1 0, i32 1
  %8 = load %union.9, %union.9* %7
  %9 = extractvalue %union.9 %8, 0
  %10 = bitcast %Int16 40 to %Int16
  %11 = icmp eq %Int16 %9, %10
  br i1 %11, label %then_0, label %else_0
then_0:
  br label %fail
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %13 = getelementptr inbounds %Value, %Value* %3, i1 0, i32 0
  %14 = load %Type*, %Type** %13
  %15 = getelementptr inbounds %Type, %Type* %14, i1 0, i32 0
  %16 = load %TypeKind, %TypeKind* %15
  br label %select_1_0
select_1_0:
  %17 = icmp eq %TypeKind %16, 12
  br i1 %17, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %18 = getelementptr inbounds %Value, %Value* %3, i1 0, i32 0
  %19 = load %Type*, %Type** %18
  br label %select_1_end
select_1_1:
  %20 = icmp eq %TypeKind %16, 13
  br i1 %20, label %select_1_1_ok, label %select_1_2
select_1_1_ok:
  %21 = getelementptr inbounds %Value, %Value* %3, i1 0, i32 0
  %22 = load %Type*, %Type** %21
  %23 = getelementptr inbounds %Type, %Type* %22, i1 0, i32 8
  %24 = getelementptr inbounds %TypePointer, %TypePointer* %23, i1 0, i32 0
  %25 = load %Type*, %Type** %24
  %26 = call %Type* (%Type*) @func493 (%Type* %25)
  br label %select_1_end
select_1_2:; loadImmPtr
  %27 = inttoptr i64 0 to%Type*
  br label %select_1_end
select_1_end:
  %28 = phi %Type* [ %19, %select_1_0_ok ], [ %26, %select_1_1_ok ], [ %27, %select_1_2 ]; loadImmPtr
  %29 = inttoptr i64 0 to%Type*
  %30 = icmp eq %Type* %28, %29
  br i1 %30, label %then_1, label %else_1
then_1:
  %31 = getelementptr inbounds %Value, %Value* %3, i1 0, i32 3
  %32 = load %TokenInfo*, %TokenInfo** %31
  %33 = getelementptr inbounds %Value, %Value* %3, i1 0, i32 0
  %34 = load %Type*, %Type** %33; loadImmPtr
  %35 = inttoptr i64 0 to%Type*
  call void (%TokenInfo*, %Type*, %Type*) @error_type_error (%TokenInfo* %32, %Type* %34, %Type* %35)
  br label %fail
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  %37 = call %Decl* (%Type*, %Str) @func401 (%Type* %28, %Str %6); loadImmPtr
  %38 = inttoptr i64 0 to%Decl*
  %39 = icmp eq %Decl* %37, %38
  br i1 %39, label %then_2, label %else_2
then_2:
  %40 = bitcast [16 x %Nat8]* @func492_str1 to %Str
  %41 = extractvalue %AstValueAccess %0, 1
  %42 = getelementptr inbounds %AstId, %AstId* %41, i1 0, i32 1
  %43 = load %TokenInfo*, %TokenInfo** %42
  call void (%Str, %TokenInfo*) @error (%Str %40, %TokenInfo* %43)
  br label %fail
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
  %45 = getelementptr inbounds %Decl, %Decl* %37, i1 0, i32 1
  %46 = load %Type*, %Type** %45
  %47 = insertvalue %ValueAccess zeroinitializer, %Type* %46, 0
  %48 = insertvalue %ValueAccess %47, %Value* %3, 1
  %49 = insertvalue %ValueAccess %48, %Str %6, 2
  %50 = extractvalue %AstValueAccess %0, 2
  %51 = insertvalue %ValueAccess %49, %TokenInfo* %50, 3
  %52 = alloca %union.9
; write variant 7
  %53 = getelementptr inbounds %union.9, %union.9* %52, i1 0, i32 0
  store %Int16 7, %Int16* %53, align 2
; write data
  %54 = getelementptr inbounds %union.9, %union.9* %52, i1 0, i32 1
  %55 = bitcast [72 x %Nat8]* %54 to %ValueAccess*
  store %ValueAccess %51, %ValueAccess* %55, align 8
  %56 = load %union.9, %union.9* %52
  %57 = extractvalue %AstValueAccess %0, 2
  %58 = call %Value* (%union.9, %Type*, %TokenInfo*) @func455 (%union.9 %56, %Type* %46, %TokenInfo* %57)
  ret %Value* %58
  br label %fail
fail:
  %60 = extractvalue %AstValueAccess %0, 2
  %61 = call %Value* (%TokenInfo*) @value_new_poison (%TokenInfo* %60)
  ret %Value* %61
}

define %Value* @do_value_cast_var (%Value*, %Type*, %TokenInfo*) {
  %4 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 3
  %5 = load %TokenInfo*, %TokenInfo** %4
  %6 = call %Value* (%Value*, %Type*, %TokenInfo*) @func532 (%Value* %0, %Type* %1, %TokenInfo* %5)
  ret %Value* %6
}

define %Value* @do_value_cast_bool (%Value*, %Type*, %TokenInfo*) {
  %4 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 0
  %5 = load %TypeKind, %TypeKind* %4
  %6 = icmp ne %TypeKind %5, 5
  br i1 %6, label %then_0, label %else_0
then_0:
  %7 = bitcast [16 x %Nat8]* @func495_str1 to %Str
  call void (%Str, %TokenInfo*) @error (%Str %7, %TokenInfo* %2)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %8 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 3
  %9 = load %TokenInfo*, %TokenInfo** %8
  %10 = call %Value* (%Value*, %Type*, %TokenInfo*) @func532 (%Value* %0, %Type* %1, %TokenInfo* %9)
  ret %Value* %10
}

define %Value* @do_value_cast_ref (%Value*, %Type*, %TokenInfo*) {
  %4 = call i1 (%Type*) @func403 (%Type* %1)
  %5 = xor i1 %4, 1
  br i1 %5, label %then_0, label %else_0
then_0:
  %6 = bitcast [16 x %Nat8]* @func496_str1 to %Str
  call void (%Str, %TokenInfo*) @error (%Str %6, %TokenInfo* %2)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %7 = call %Value* (%Value*, %Type*, %TokenInfo*) @func532 (%Value* %0, %Type* %1, %TokenInfo* %2)
  ret %Value* %7
}

define %Value* @do_value_cast_num (%Value*, %Type*, %TokenInfo*) {
  %4 = load i1, i1* @unsafe
  %5 = xor i1 %4, 1
  br i1 %5, label %then_0, label %else_0
then_0:
  %6 = call i1 (%Type*) @func403 (%Type* %1)
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
  %7 = call %Value* (%Value*, %Type*, %TokenInfo*) @func532 (%Value* %0, %Type* %1, %TokenInfo* %2)
  ret %Value* %7
}

define %Value* @do_value_cast_func (%Value*, %Type*, %TokenInfo*) {
  %4 = call i1 (%Type*) @typeIsPointerToUnit (%Type* %1)
  %5 = xor i1 %4, 1
  br i1 %5, label %then_0, label %else_0
then_0:
  %6 = bitcast [16 x %Nat8]* @func498_str1 to %Str
  call void (%Str, %TokenInfo*) @error (%Str %6, %TokenInfo* %2)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %7 = call %Value* (%Value*, %Type*, %TokenInfo*) @func532 (%Value* %0, %Type* %1, %TokenInfo* %2)
  ret %Value* %7
}

define %Value* @do_value_cast_set (%Value*, %Type*, %TokenInfo*) {
  %4 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 0
  %5 = load %TypeKind, %TypeKind* %4
  %6 = icmp ne %TypeKind %5, 5
  br i1 %6, label %then_0, label %else_0
then_0:
  %7 = bitcast [16 x %Nat8]* @func499_str1 to %Str
  call void (%Str, %TokenInfo*) @error (%Str %7, %TokenInfo* %2)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %8 = call %Value* (%Value*, %Type*, %TokenInfo*) @func532 (%Value* %0, %Type* %1, %TokenInfo* %2)
  ret %Value* %8
}

define %Value* @do_value_cast_rec (%Value*, %Type*, %TokenInfo*) {
  %4 = bitcast [16 x %Nat8]* @func500_str1 to %Str
  call void (%Str, %TokenInfo*) @error (%Str %4, %TokenInfo* %2)
  %5 = call %Value* (%Value*, %Type*, %TokenInfo*) @func532 (%Value* %0, %Type* %1, %TokenInfo* %2)
  ret %Value* %5
}

define %Value* @do_value_cast_ptr (%Value*, %Type*, %TokenInfo*) {
  %4 = call %Value* (%Value*, %Type*, %TokenInfo*) @func532 (%Value* %0, %Type* %1, %TokenInfo* %2)
  ret %Value* %4
}

define %Value* @do_value_cast_arr (%Value*, %Type*, %TokenInfo*) {
  %4 = bitcast [16 x %Nat8]* @func502_str1 to %Str
  call void (%Str, %TokenInfo*) @error (%Str %4, %TokenInfo* %2)
  %5 = call %Value* (%Value*, %Type*, %TokenInfo*) @func532 (%Value* %0, %Type* %1, %TokenInfo* %2)
  ret %Value* %5
}

define %Value* @do_value_cast_uarr (%Value*, %Type*, %TokenInfo*) {
  %4 = call i1 (%Type*) @typeIsPointerToUnit (%Type* %1)
  %5 = xor i1 %4, 1
  br i1 %5, label %then_0, label %else_0
then_0:
  %6 = bitcast [16 x %Nat8]* @func503_str1 to %Str
  call void (%Str, %TokenInfo*) @error (%Str %6, %TokenInfo* %2)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %7 = call %Value* (%Value*, %Type*, %TokenInfo*) @func532 (%Value* %0, %Type* %1, %TokenInfo* %2)
  ret %Value* %7
}

define %Value* @do_value_cast_union (%Value*, %Type*, %TokenInfo*) {
  %4 = call %Value* (%Value*, %Type*, %TokenInfo*) @func532 (%Value* %0, %Type* %1, %TokenInfo* %2)
  ret %Value* %4
}

define void @func506 (%Unit*, %Unit*, %Unit*) {
  %4 = bitcast %Unit* %0 to %Str
  %5 = bitcast %Unit* %1 to %Value*
  %6 = bitcast %Unit* %2 to %func505.type10*
  %7 = getelementptr inbounds %func505.type10, %func505.type10* %6, i1 0, i32 0
  %8 = load %Type*, %Type** %7
  %9 = call %Decl* (%Type*, %Str) @func401 (%Type* %8, %Str %4); loadImmPtr
  %10 = inttoptr i64 0 to%Decl*
  %11 = icmp ne %Decl* %9, %10
  %12 = bitcast [32 x %Nat8]* @func505_func506_str1 to %Str
  call void (i1, %Str) @assert (i1 %11, %Str %12)
  %13 = getelementptr inbounds %Decl, %Decl* %9, i1 0, i32 1
  %14 = load %Type*, %Type** %13
  %15 = call %Value* (%Value*, %Type*) @func537 (%Value* %5, %Type* %14)
  %16 = getelementptr inbounds %func505.type10, %func505.type10* %6, i1 0, i32 1
  %17 = bitcast %Value* %15 to %Unit*
  %18 = call i1 (%List*, %Str, %Unit*) @map_append (%List* %16, %Str %4, %Unit* %17)
  ret void
}

define %Value* @do_value_cast_gen_rec (%Value*, %Type*, %TokenInfo*) {
  %4 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 1
  %5 = load %union.9, %union.9* %4
  %6 = alloca %union.9
  store %union.9 %5, %union.9* %6, align 128
  %7 = getelementptr inbounds %union.9, %union.9* %6, i1 0, i32 1
  %8 = bitcast [72 x %Nat8]* %7 to %ValueRecord*
  %9 = load %ValueRecord, %ValueRecord* %8
  %10 = alloca %func505.type10
  %11 = insertvalue %func505.type10 zeroinitializer, %Type* %1, 0
  store %func505.type10 %11, %func505.type10* %10, align 8
  %12 = alloca %List
  %13 = extractvalue %ValueRecord %9, 1
  store %List %13, %List* %12, align 8
  %14 = getelementptr inbounds %List, %List* %12, i1 0
  %15 = getelementptr inbounds %func505.type10, %func505.type10* %10, i1 0
  %16 = bitcast %func505.type10* %15 to %Unit*
  call void (%List*, %MapForeachHandler, %Unit*) @map_foreach (%List* %14, %MapForeachHandler @func506, %Unit* %16)
  %17 = insertvalue %ValueRecord zeroinitializer, %Type* %1, 0
  %18 = getelementptr inbounds %func505.type10, %func505.type10* %10, i1 0, i32 1
  %19 = load %List, %List* %18
  %20 = insertvalue %ValueRecord %17, %List %19, 1
  %21 = insertvalue %ValueRecord %20, %TokenInfo* %2, 2
  %22 = alloca %union.9
; write variant 37
  %23 = getelementptr inbounds %union.9, %union.9* %22, i1 0, i32 0
  store %Int16 37, %Int16* %23, align 2
; write data
  %24 = getelementptr inbounds %union.9, %union.9* %22, i1 0, i32 1
  %25 = bitcast [72 x %Nat8]* %24 to %ValueRecord*
  store %ValueRecord %21, %ValueRecord* %25, align 8
  %26 = load %union.9, %union.9* %22
  %27 = call %Value* (%union.9, %Type*, %TokenInfo*) @func455 (%union.9 %26, %Type* %1, %TokenInfo* %2)
  ret %Value* %27
}

define %Value* @func508 (%AstId*, %Type*, %Value*, %TokenInfo*) {
  %5 = getelementptr inbounds %AstId, %AstId* %0, i1 0, i32 0
  %6 = load %Str, %Str* %5
  %7 = call %Definition* (%Assembly*, %Str, %Type*, %Value*) @func262 (%Assembly* @asm0, %Str %6, %Type* %1, %Value* %2)
  %8 = insertvalue %ValueGlobalVar zeroinitializer, %Type* %1, 0
  %9 = insertvalue %ValueGlobalVar %8, %Definition* %7, 1
  %10 = getelementptr inbounds %AstId, %AstId* %0, i1 0, i32 1
  %11 = load %TokenInfo*, %TokenInfo** %10
  %12 = insertvalue %ValueGlobalVar %9, %TokenInfo* %11, 2
  %13 = alloca %union.9
; write variant 34
  %14 = getelementptr inbounds %union.9, %union.9* %13, i1 0, i32 0
  store %Int16 34, %Int16* %14, align 2
; write data
  %15 = getelementptr inbounds %union.9, %union.9* %13, i1 0, i32 1
  %16 = bitcast [72 x %Nat8]* %15 to %ValueGlobalVar*
  store %ValueGlobalVar %12, %ValueGlobalVar* %16, align 8
  %17 = load %union.9, %union.9* %13
  %18 = getelementptr inbounds %AstId, %AstId* %0, i1 0, i32 1
  %19 = load %TokenInfo*, %TokenInfo** %18
  %20 = call %Value* (%union.9, %Type*, %TokenInfo*) @func455 (%union.9 %17, %Type* %1, %TokenInfo* %19)
  %21 = getelementptr inbounds %AstId, %AstId* %0, i1 0, i32 0
  %22 = load %Str, %Str* %21
  call void (%Str, %Value*) @valbind (%Str %22, %Value* %20)
  ret %Value* %20
}

define %Value* @func509 (%AstId*, %Type*, %Value*, %TokenInfo*) {; loadImmPtr
  %5 = inttoptr i64 0 to%TokenInfo*
  %6 = call %union.13* (%AstId*, %Type*, %Value*, %TokenInfo*) @func545 (%AstId* %0, %Type* %1, %Value* %2, %TokenInfo* %5)
  %7 = load %FuncContext*, %FuncContext** @fctx
  %8 = getelementptr inbounds %FuncContext, %FuncContext* %7, i1 0, i32 2
  %9 = load %StmtBlock*, %StmtBlock** %8
  %10 = getelementptr inbounds %StmtBlock, %StmtBlock* %9, i1 0, i32 1
  %11 = bitcast %union.13* %6 to %Unit*
  %12 = call i1 (%List*, %Unit*) @list_append (%List* %10, %Unit* %11)
  %13 = load %union.13, %union.13* %6
  %14 = alloca %union.13
  store %union.13 %13, %union.13* %14, align 128
  %15 = getelementptr inbounds %union.13, %union.13* %14, i1 0, i32 1
  %16 = bitcast [112 x %Nat8]* %15 to %StmtVarDef*
  %17 = load %StmtVarDef, %StmtVarDef* %16
  %18 = extractvalue %StmtVarDef %17, 1
  %19 = insertvalue %ValueLocalVar zeroinitializer, %Type* %1, 0
  %20 = insertvalue %ValueLocalVar %19, %Nat32 %18, 1
  %21 = insertvalue %ValueLocalVar %20, %TokenInfo* %3, 2
  %22 = alloca %union.9
; write variant 31
  %23 = getelementptr inbounds %union.9, %union.9* %22, i1 0, i32 0
  store %Int16 31, %Int16* %23, align 2
; write data
  %24 = getelementptr inbounds %union.9, %union.9* %22, i1 0, i32 1
  %25 = bitcast [72 x %Nat8]* %24 to %ValueLocalVar*
  store %ValueLocalVar %21, %ValueLocalVar* %25, align 8
  %26 = load %union.9, %union.9* %22
  %27 = call %Value* (%union.9, %Type*, %TokenInfo*) @func455 (%union.9 %26, %Type* %1, %TokenInfo* %3)
  %28 = getelementptr inbounds %AstId, %AstId* %0, i1 0, i32 0
  %29 = load %Str, %Str* %28
  call void (%Str, %Value*) @valbind (%Str %29, %Value* %27)
  ret %Value* %27
}

define %Value* @do_value_cast_to_var (%Value*, %Type*, %TokenInfo*) {
  %4 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 13
  %5 = getelementptr inbounds %TypeVar, %TypeVar* %4, i1 0, i32 0
  %6 = load %Type*, %Type** %5
  %7 = call %Value* (%Value*, %Type*, %TokenInfo*) @func532 (%Value* %0, %Type* %6, %TokenInfo* %2)
  %8 = call %Str () @func138 ()
  %9 = alloca %AstId
  %10 = insertvalue %AstId zeroinitializer, %Str %8, 0
  %11 = insertvalue %AstId %10, %TokenInfo* %2, 1
  store %AstId %11, %AstId* %9, align 8
  %12 = load %FuncContext*, %FuncContext** @fctx
  br label %select_1_0
select_1_0:; loadImmPtr
  %13 = inttoptr i64 0 to%FuncContext*
  %14 = icmp eq %FuncContext* %12, %13
  br i1 %14, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %15 = getelementptr inbounds %AstId, %AstId* %9, i1 0
  %16 = call %Value* (%AstId*, %Type*, %Value*, %TokenInfo*) @func508 (%AstId* %15, %Type* %1, %Value* %7, %TokenInfo* %2)
  br label %select_1_end
select_1_1:
  %17 = getelementptr inbounds %AstId, %AstId* %9, i1 0
  %18 = call %Value* (%AstId*, %Type*, %Value*, %TokenInfo*) @func509 (%AstId* %17, %Type* %1, %Value* %7, %TokenInfo* %2)
  br label %select_1_end
select_1_end:
  %19 = phi %Value* [ %16, %select_1_0_ok ], [ %18, %select_1_1 ]
  ret %Value* %19
  br label %fail
fail:
  %21 = call %Value* (%TokenInfo*) @value_new_poison (%TokenInfo* %2)
  ret %Value* %21
}

define %Value* @func511 (%Value*, %Type*, %TokenInfo*) {
  %4 = bitcast [18 x %Nat8]* @func510_func511_str1 to %Str
  call void (%Str) @fatal (%Str %4); loadImmPtr
  %5 = inttoptr i64 0 to%Value*
  ret %Value* %5
}

define %Value* @func510 (%AstValueValType) {
  %2 = extractvalue %AstValueValType %0, 0
  %3 = call %Value* (%union.4*) @func476 (%union.4* %2)
  %4 = extractvalue %AstValueValType %0, 1
  %5 = call %Type* (%union.2*) @func413 (%union.2* %4)
  %6 = getelementptr inbounds %Value, %Value* %3, i1 0, i32 1
  %7 = load %union.9, %union.9* %6
  %8 = extractvalue %union.9 %7, 0
  %9 = bitcast %Int16 40 to %Int16
  %10 = icmp eq %Int16 %8, %9
  br i1 %10, label %then_0, label %else_0
then_0:
  br label %fail
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %12 = getelementptr inbounds %Type, %Type* %5, i1 0, i32 0
  %13 = load %TypeKind, %TypeKind* %12
  %14 = icmp eq %TypeKind %13, 2
  br i1 %14, label %then_1, label %else_1
then_1:
  br label %fail
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  %16 = extractvalue %AstValueValType %0, 2
  %17 = getelementptr inbounds %Value, %Value* %3, i1 0, i32 0
  %18 = load %Type*, %Type** %17
  %19 = call i1 (%Type*, %Type*) @func445 (%Type* %18, %Type* %5)
  br i1 %19, label %then_2, label %else_2
then_2:
  %20 = bitcast [18 x %Nat8]* @func510_str1 to %Str
  call void (%Str, %TokenInfo*) @warning (%Str %20, %TokenInfo* %16)
  ret %Value* %3
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
  %22 = getelementptr inbounds %Type, %Type* %5, i1 0, i32 0
  %23 = load %TypeKind, %TypeKind* %22
  %24 = icmp eq %TypeKind %23, 8
  br i1 %24, label %then_3, label %else_3
then_3:
  %25 = call %Value* (%Value*, %Type*, %TokenInfo*) @do_value_cast_to_var (%Value* %3, %Type* %5, %TokenInfo* %16)
  ret %Value* %25
  br label %endif_3
else_3:
  br label %endif_3
endif_3:
  %27 = getelementptr inbounds %Value, %Value* %3, i1 0, i32 0
  %28 = load %Type*, %Type** %27
  %29 = getelementptr inbounds %Type, %Type* %28, i1 0, i32 0
  %30 = load %TypeKind, %TypeKind* %29
  br label %select_1_0
select_1_0:
  %31 = icmp eq %TypeKind %30, 8
  br i1 %31, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %32 = call %Value* (%Value*, %Type*, %TokenInfo*) @do_value_cast_var (%Value* %3, %Type* %5, %TokenInfo* %16)
  br label %select_1_end
select_1_1:
  %33 = icmp eq %TypeKind %30, 9
  br i1 %33, label %select_1_1_ok, label %select_1_2
select_1_1_ok:
  %34 = call %Value* (%Value*, %Type*, %TokenInfo*) @do_value_cast_bool (%Value* %3, %Type* %5, %TokenInfo* %16)
  br label %select_1_end
select_1_2:
  %35 = icmp eq %TypeKind %30, 3
  br i1 %35, label %select_1_2_ok, label %select_1_3
select_1_2_ok:
  %36 = call %Value* (%Value*, %Type*, %TokenInfo*) @do_value_cast_ref (%Value* %3, %Type* %5, %TokenInfo* %16)
  br label %select_1_end
select_1_3:
  %37 = icmp eq %TypeKind %30, 4
  br i1 %37, label %select_1_3_ok, label %select_1_4
select_1_3_ok:
  %38 = call %Value* (%Value*, %Type*, %TokenInfo*) @do_value_cast_gen_rec (%Value* %3, %Type* %5, %TokenInfo* %16)
  br label %select_1_end
select_1_4:
  %39 = icmp eq %TypeKind %30, 5
  br i1 %39, label %select_1_4_ok, label %select_1_5
select_1_4_ok:
  %40 = call %Value* (%Value*, %Type*, %TokenInfo*) @do_value_cast_num (%Value* %3, %Type* %5, %TokenInfo* %16)
  br label %select_1_end
select_1_5:
  %41 = icmp eq %TypeKind %30, 10
  br i1 %41, label %select_1_5_ok, label %select_1_6
select_1_5_ok:
  %42 = call %Value* (%Value*, %Type*, %TokenInfo*) @do_value_cast_func (%Value* %3, %Type* %5, %TokenInfo* %16)
  br label %select_1_end
select_1_6:
  %43 = icmp eq %TypeKind %30, 11
  br i1 %43, label %select_1_6_ok, label %select_1_7
select_1_6_ok:
  %44 = call %Value* (%Value*, %Type*, %TokenInfo*) @do_value_cast_set (%Value* %3, %Type* %5, %TokenInfo* %16)
  br label %select_1_end
select_1_7:
  %45 = icmp eq %TypeKind %30, 12
  br i1 %45, label %select_1_7_ok, label %select_1_8
select_1_7_ok:
  %46 = call %Value* (%Value*, %Type*, %TokenInfo*) @do_value_cast_rec (%Value* %3, %Type* %5, %TokenInfo* %16)
  br label %select_1_end
select_1_8:
  %47 = icmp eq %TypeKind %30, 13
  br i1 %47, label %select_1_8_ok, label %select_1_9
select_1_8_ok:
  %48 = call %Value* (%Value*, %Type*, %TokenInfo*) @do_value_cast_ptr (%Value* %3, %Type* %5, %TokenInfo* %16)
  br label %select_1_end
select_1_9:
  %49 = icmp eq %TypeKind %30, 14
  br i1 %49, label %select_1_9_ok, label %select_1_10
select_1_9_ok:
  %50 = call %Value* (%Value*, %Type*, %TokenInfo*) @do_value_cast_arr (%Value* %3, %Type* %5, %TokenInfo* %16)
  br label %select_1_end
select_1_10:
  %51 = icmp eq %TypeKind %30, 15
  br i1 %51, label %select_1_10_ok, label %select_1_11
select_1_10_ok:
  %52 = call %Value* (%Value*, %Type*, %TokenInfo*) @do_value_cast_uarr (%Value* %3, %Type* %5, %TokenInfo* %16)
  br label %select_1_end
select_1_11:
  %53 = icmp eq %TypeKind %30, 16
  br i1 %53, label %select_1_11_ok, label %select_1_12
select_1_11_ok:
  %54 = call %Value* (%Value*, %Type*, %TokenInfo*) @do_value_cast_union (%Value* %3, %Type* %5, %TokenInfo* %16)
  br label %select_1_end
select_1_12:
  %55 = call %Value* (%Value*, %Type*, %TokenInfo*) @func511 (%Value* %3, %Type* %5, %TokenInfo* %16)
  br label %select_1_end
select_1_end:
  %56 = phi %Value* [ %32, %select_1_0_ok ], [ %34, %select_1_1_ok ], [ %36, %select_1_2_ok ], [ %38, %select_1_3_ok ], [ %40, %select_1_4_ok ], [ %42, %select_1_5_ok ], [ %44, %select_1_6_ok ], [ %46, %select_1_7_ok ], [ %48, %select_1_8_ok ], [ %50, %select_1_9_ok ], [ %52, %select_1_10_ok ], [ %54, %select_1_11_ok ], [ %55, %select_1_12 ]
  ret %Value* %56
  br label %fail
fail:
  %58 = extractvalue %AstValueValType %0, 2
  %59 = call %Value* (%TokenInfo*) @value_new_poison (%TokenInfo* %58)
  ret %Value* %59
}

define %Value* @value_union_type_check (%union.4*, %union.2*, i1, %TokenInfo*) {
  %5 = call %Value* (%union.4*) @func476 (%union.4* %0)
  %6 = call %Type* (%union.2*) @func413 (%union.2* %1)
  %7 = getelementptr inbounds %Value, %Value* %5, i1 0, i32 0
  %8 = load %Type*, %Type** %7
  %9 = getelementptr inbounds %Type, %Type* %8, i1 0, i32 0
  %10 = load %TypeKind, %TypeKind* %9
  %11 = icmp ne %TypeKind %10, 16
  br i1 %11, label %then_0, label %else_0
then_0:
  %12 = bitcast [20 x %Nat8]* @func512_str1 to %Str
  %13 = getelementptr inbounds %Value, %Value* %5, i1 0, i32 3
  %14 = load %TokenInfo*, %TokenInfo** %13
  call void (%Str, %TokenInfo*) @error (%Str %12, %TokenInfo* %14)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %15 = getelementptr inbounds %Value, %Value* %5, i1 0, i32 0
  %16 = load %Type*, %Type** %15
  %17 = getelementptr inbounds %Type, %Type* %16, i1 0, i32 14
  %18 = getelementptr inbounds %TypeUnion, %TypeUnion* %17, i1 0, i32 0
  %19 = call i1 (%List*, %Type*) @func140 (%List* %18, %Type* %6)
  %20 = xor i1 %19, 1
  br i1 %20, label %then_1, label %else_1
then_1:
  %21 = bitcast [11 x %Nat8]* @func512_str2 to %Str
  %22 = getelementptr inbounds %Value, %Value* %5, i1 0, i32 3
  %23 = load %TokenInfo*, %TokenInfo** %22
  call void (%Str, %TokenInfo*) @error (%Str %21, %TokenInfo* %23)
  br label %fail
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  %25 = getelementptr inbounds %Value, %Value* %5, i1 0, i32 0
  %26 = load %Type*, %Type** %25
  %27 = call %Nat32 (%Type*, %Type*) @func451 (%Type* %26, %Type* %6)
  %28 = load %Type*, %Type** @typeBool
  %29 = insertvalue %ValueIs zeroinitializer, %Type* %28, 0
  %30 = insertvalue %ValueIs %29, %Value* %5, 1
  %31 = insertvalue %ValueIs %30, %Nat32 %27, 3
  %32 = insertvalue %ValueIs %31, i1 %2, 2
  %33 = insertvalue %ValueIs %32, %TokenInfo* %3, 4
  %34 = alloca %union.9
; write variant 4
  %35 = getelementptr inbounds %union.9, %union.9* %34, i1 0, i32 0
  store %Int16 4, %Int16* %35, align 2
; write data
  %36 = getelementptr inbounds %union.9, %union.9* %34, i1 0, i32 1
  %37 = bitcast [72 x %Nat8]* %36 to %ValueIs*
  store %ValueIs %33, %ValueIs* %37, align 8
  %38 = load %union.9, %union.9* %34
  %39 = load %Type*, %Type** @typeBool
  %40 = call %Value* (%union.9, %Type*, %TokenInfo*) @func455 (%union.9 %38, %Type* %39, %TokenInfo* %3)
  ret %Value* %40
  br label %fail
fail:
  %42 = call %Value* (%TokenInfo*) @value_new_poison (%TokenInfo* %3)
  ret %Value* %42
}

define %Value* @func513 (%AstValueValType) {
  %2 = extractvalue %AstValueValType %0, 0
  %3 = extractvalue %AstValueValType %0, 1
  %4 = extractvalue %AstValueValType %0, 2
  %5 = call %Value* (%union.4*, %union.2*, i1, %TokenInfo*) @value_union_type_check (%union.4* %2, %union.2* %3, i1 1, %TokenInfo* %4)
  ret %Value* %5
}

define %Value* @func514 (%AstValueValType) {
  %2 = extractvalue %AstValueValType %0, 0
  %3 = extractvalue %AstValueValType %0, 1
  %4 = extractvalue %AstValueValType %0, 2
  %5 = call %Value* (%union.4*, %union.2*, i1, %TokenInfo*) @value_union_type_check (%union.4* %2, %union.2* %3, i1 0, %TokenInfo* %4)
  ret %Value* %5
}

define %Value* @func515 (%AstValueValType) {
  %2 = extractvalue %AstValueValType %0, 0
  %3 = call %Value* (%union.4*) @func476 (%union.4* %2)
  %4 = extractvalue %AstValueValType %0, 1
  %5 = call %Type* (%union.2*) @func413 (%union.2* %4)
  %6 = extractvalue %AstValueValType %0, 2
  %7 = getelementptr inbounds %Value, %Value* %3, i1 0, i32 1
  %8 = load %union.9, %union.9* %7
  %9 = extractvalue %union.9 %8, 0
  %10 = bitcast %Int16 40 to %Int16
  %11 = icmp eq %Int16 %9, %10
  br i1 %11, label %then_0, label %else_0
then_0:
  br label %fail
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %13 = getelementptr inbounds %Type, %Type* %5, i1 0, i32 0
  %14 = load %TypeKind, %TypeKind* %13
  %15 = icmp eq %TypeKind %14, 2
  br i1 %15, label %then_1, label %else_1
then_1:
  br label %fail
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  %17 = getelementptr inbounds %Value, %Value* %3, i1 0, i32 0
  %18 = load %Type*, %Type** %17
  %19 = getelementptr inbounds %Type, %Type* %18, i1 0, i32 14
  %20 = getelementptr inbounds %TypeUnion, %TypeUnion* %19, i1 0, i32 0
  %21 = call i1 (%List*, %Type*) @func140 (%List* %20, %Type* %5)
  %22 = xor i1 %21, 1
  br i1 %22, label %then_2, label %else_2
then_2:
  %23 = bitcast [11 x %Nat8]* @func515_str1 to %Str
  %24 = getelementptr inbounds %Value, %Value* %3, i1 0, i32 3
  %25 = load %TokenInfo*, %TokenInfo** %24
  call void (%Str, %TokenInfo*) @error (%Str %23, %TokenInfo* %25)
  br label %fail
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
  %27 = getelementptr inbounds %Value, %Value* %3, i1 0, i32 0
  %28 = load %Type*, %Type** %27
  %29 = getelementptr inbounds %Type, %Type* %28, i1 0, i32 14
  %30 = getelementptr inbounds %TypeUnion, %TypeUnion* %29, i1 0, i32 1
  %31 = load %Type*, %Type** %30; loadImmPtr
  %32 = inttoptr i64 0 to%Type*
  %33 = icmp ne %Type* %31, %32
  br i1 %33, label %then_3, label %else_3
then_3:
  %34 = extractvalue %AstValueValType %0, 2
  %35 = call %Value* (%Value*, %Type*, %TokenInfo*) @func532 (%Value* %3, %Type* %5, %TokenInfo* %34)
  ret %Value* %35
  br label %endif_3
else_3:
  br label %endif_3
endif_3:
  %37 = call %Value* (%Value*, %Type*, %TokenInfo*) @func532 (%Value* %3, %Type* %5, %TokenInfo* %6)
  ret %Value* %37
  br label %fail
fail:
  %39 = extractvalue %AstValueValType %0, 2
  %40 = call %Value* (%TokenInfo*) @value_new_poison (%TokenInfo* %39)
  ret %Value* %40
}

define %Value* @func516 (%AstValueSizeof) {
  %2 = extractvalue %AstValueSizeof %0, 0
  %3 = call %Type* (%union.2*) @func413 (%union.2* %2)
  %4 = getelementptr inbounds %Type, %Type* %3, i1 0, i32 0
  %5 = load %TypeKind, %TypeKind* %4
  %6 = icmp eq %TypeKind %5, 2
  br i1 %6, label %then_0, label %else_0
then_0:
  br label %fail
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %8 = getelementptr inbounds %Type, %Type* %3, i1 0, i32 0
  %9 = load %TypeKind, %TypeKind* %8
  %10 = icmp eq %TypeKind %9, 1
  br i1 %10, label %then_1, label %else_1
then_1:
  %11 = bitcast [20 x %Nat8]* @func516_str1 to %Str
  %12 = extractvalue %AstValueSizeof %0, 1
  call void (%Str, %TokenInfo*) @error (%Str %11, %TokenInfo* %12)
  %13 = extractvalue %AstValueSizeof %0, 1
  %14 = call %Value* (%TokenInfo*) @value_new_poison (%TokenInfo* %13)
  ret %Value* %14
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  %16 = load %Type*, %Type** @typeNumeric
  %17 = getelementptr inbounds %Type, %Type* %3, i1 0, i32 3
  %18 = load %Nat32, %Nat32* %17
  %19 = sext %Nat32 %18 to %Int64
  %20 = extractvalue %AstValueSizeof %0, 1
  %21 = call %Value* (%Type*, %Int64, %TokenInfo*) @func457 (%Type* %16, %Int64 %19, %TokenInfo* %20)
  ret %Value* %21
  br label %fail
fail:
  %23 = extractvalue %AstValueSizeof %0, 1
  %24 = call %Value* (%TokenInfo*) @value_new_poison (%TokenInfo* %23)
  ret %Value* %24
}

define %Value* @func517 (%AstValueAlignof) {
  %2 = extractvalue %AstValueAlignof %0, 0
  %3 = call %Type* (%union.2*) @func413 (%union.2* %2)
  %4 = getelementptr inbounds %Type, %Type* %3, i1 0, i32 0
  %5 = load %TypeKind, %TypeKind* %4
  %6 = icmp eq %TypeKind %5, 2
  br i1 %6, label %then_0, label %else_0
then_0:
  br label %fail
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %8 = getelementptr inbounds %Type, %Type* %3, i1 0, i32 0
  %9 = load %TypeKind, %TypeKind* %8
  %10 = icmp eq %TypeKind %9, 1
  br i1 %10, label %then_1, label %else_1
then_1:
  %11 = bitcast [21 x %Nat8]* @func517_str1 to %Str
  %12 = extractvalue %AstValueAlignof %0, 1
  call void (%Str, %TokenInfo*) @error (%Str %11, %TokenInfo* %12)
  %13 = extractvalue %AstValueAlignof %0, 1
  %14 = call %Value* (%TokenInfo*) @value_new_poison (%TokenInfo* %13)
  ret %Value* %14
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  %16 = load %Type*, %Type** @typeNumeric
  %17 = getelementptr inbounds %Type, %Type* %3, i1 0, i32 3
  %18 = load %Nat32, %Nat32* %17
  %19 = sext %Nat32 %18 to %Int64
  %20 = extractvalue %AstValueAlignof %0, 1
  %21 = call %Value* (%Type*, %Int64, %TokenInfo*) @func457 (%Type* %16, %Int64 %19, %TokenInfo* %20)
  ret %Value* %21
  br label %fail
fail:
  %23 = extractvalue %AstValueAlignof %0, 1
  %24 = call %Value* (%TokenInfo*) @value_new_poison (%TokenInfo* %23)
  ret %Value* %24
}

define %Value* @func518 (%AstName) {
  %2 = extractvalue %AstName %0, 0
  %3 = getelementptr inbounds %AstId, %AstId* %2, i1 0, i32 0
  %4 = load %Str, %Str* %3
  %5 = call %union.15 (%Str) @valget (%Str %4)
  %6 = bitcast %Int64 0 to %Int64
  %7 = ptrtoint %union.15 %5 to %Int64
  %8 = icmp eq %Int64 %7, %6
  br i1 %8, label %then_0, label %else_0
then_0:
  %9 = bitcast [16 x %Nat8]* @func518_str1 to %Str
  %10 = extractvalue %AstName %0, 2
  call void (%Str, %TokenInfo*) @error (%Str %9, %TokenInfo* %10)
  %11 = extractvalue %AstName %0, 2
  %12 = call %Value* (%TokenInfo*) @value_new_poison (%TokenInfo* %11)
  ret %Value* %12
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %14 = bitcast %union.15 %5 to %Value*
  %15 = getelementptr inbounds %Value, %Value* %14, i1 0, i32 3
  %16 = extractvalue %AstName %0, 2
  store %TokenInfo* %16, %TokenInfo** %15, align 8
  ret %Value* %14
}

define %Value* @func519 (%AstValueNumber) {
  %2 = extractvalue %AstValueNumber %0, 0
  %3 = alloca %Int64
  store %Int64 0, %Int64* %3, align 8
; eval index uarray
  %4 = getelementptr inbounds %Nat8, %Nat8* %2, %Int64 0
  %5 = load %Nat8, %Nat8* %4
; index array
  %6 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func519_str1, i1 0, %Int64 0
  %7 = load %Nat8, %Nat8* %6
  %8 = icmp eq %Nat8 %5, %7
; eval index uarray
  %9 = getelementptr inbounds %Nat8, %Nat8* %2, %Int64 1
  %10 = load %Nat8, %Nat8* %9
; index array
  %11 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func519_str2, i1 0, %Int64 0
  %12 = load %Nat8, %Nat8* %11
  %13 = icmp eq %Nat8 %10, %12
  %14 = and i1 %8, %13
  br i1 %14, label %then_0, label %else_0
then_0:
; eval index uarray
  %15 = getelementptr inbounds %Nat8, %Nat8* %2, %Int64 2
  %16 = bitcast %Nat8* %15 to %Unit*
  %17 = bitcast [5 x %Nat8]* @func519_str3 to %Str
  %18 = getelementptr inbounds %Int64, %Int64* %3, i1 0
  %19 = call %Int32 (%Unit*, %Str, ...) @sscanf (%Unit* %16, %Str %17, %Int64* %18)
  br label %endif_0
else_0:
; eval index uarray
  %20 = getelementptr inbounds %Nat8, %Nat8* %2, %Int64 0
  %21 = bitcast %Nat8* %20 to %Unit*
  %22 = bitcast [5 x %Nat8]* @func519_str4 to %Str
  %23 = getelementptr inbounds %Int64, %Int64* %3, i1 0
  %24 = call %Int32 (%Unit*, %Str, ...) @sscanf (%Unit* %21, %Str %22, %Int64* %23)
  br label %endif_0
endif_0:
  %25 = load %Type*, %Type** @typeNumeric
  %26 = load %Int64, %Int64* %3
  %27 = extractvalue %AstValueNumber %0, 1
  %28 = call %Value* (%Type*, %Int64, %TokenInfo*) @func457 (%Type* %25, %Int64 %26, %TokenInfo* %27)
  ret %Value* %28
}

define %Value* @func520 (%AstValueString) {
  %2 = extractvalue %AstValueString %0, 0
  %3 = call %Nat32 (%Str) @strlen (%Str %2)
  %4 = add %Nat32 %3, 1
  %5 = load %Type*, %Type** @typeChar
  %6 = extractvalue %AstValueString %0, 1
  %7 = call %Type* (%Type*, %Nat32, %TokenInfo*) @func397 (%Type* %5, %Nat32 %4, %TokenInfo* %6)
  %8 = extractvalue %AstValueString %0, 1
  %9 = call %Type* (%Type*, %TokenInfo*) @func395 (%Type* %7, %TokenInfo* %8)
  %10 = call %Str () @func136 ()
  %11 = call %Definition* (%Assembly*, %Str, %Str, %Nat32) @func259 (%Assembly* @asm0, %Str %10, %Str %2, %Nat32 %4)
  %12 = insertvalue %ValueGlobalConst zeroinitializer, %Type* %9, 0
  %13 = insertvalue %ValueGlobalConst %12, %Definition* %11, 1
  %14 = extractvalue %AstValueString %0, 1
  %15 = insertvalue %ValueGlobalConst %13, %TokenInfo* %14, 2
  %16 = alloca %union.9
; write variant 33
  %17 = getelementptr inbounds %union.9, %union.9* %16, i1 0, i32 0
  store %Int16 33, %Int16* %17, align 2
; write data
  %18 = getelementptr inbounds %union.9, %union.9* %16, i1 0, i32 1
  %19 = bitcast [72 x %Nat8]* %18 to %ValueGlobalConst*
  store %ValueGlobalConst %15, %ValueGlobalConst* %19, align 8
  %20 = load %union.9, %union.9* %16
  %21 = extractvalue %AstValueString %0, 1
  %22 = call %Value* (%union.9, %Type*, %TokenInfo*) @func455 (%union.9 %20, %Type* %9, %TokenInfo* %21)
  ret %Value* %22
}

define void @func522 (%Unit*, %Unit*, %Nat32, %Node*) {
  %5 = bitcast %Unit* %0 to %Decl*
  %6 = getelementptr inbounds %Decl, %Decl* %5, i1 0, i32 1
  %7 = load %Type*, %Type** %6
  %8 = insertvalue %ValueParam zeroinitializer, %Type* %7, 0
  %9 = getelementptr inbounds %Decl, %Decl* %5, i1 0, i32 3
  %10 = load %Nat16, %Nat16* %9
  %11 = zext %Nat16 %10 to %Nat32
  %12 = insertvalue %ValueParam %8, %Nat32 %11, 1
  %13 = getelementptr inbounds %Decl, %Decl* %5, i1 0, i32 6
  %14 = load %TokenInfo*, %TokenInfo** %13
  %15 = insertvalue %ValueParam %12, %TokenInfo* %14, 2
  %16 = alloca %union.9
; write variant 32
  %17 = getelementptr inbounds %union.9, %union.9* %16, i1 0, i32 0
  store %Int16 32, %Int16* %17, align 2
; write data
  %18 = getelementptr inbounds %union.9, %union.9* %16, i1 0, i32 1
  %19 = bitcast [72 x %Nat8]* %18 to %ValueParam*
  store %ValueParam %15, %ValueParam* %19, align 8
  %20 = load %union.9, %union.9* %16
  %21 = getelementptr inbounds %Decl, %Decl* %5, i1 0, i32 1
  %22 = load %Type*, %Type** %21
  %23 = getelementptr inbounds %Decl, %Decl* %5, i1 0, i32 6
  %24 = load %TokenInfo*, %TokenInfo** %23
  %25 = call %Value* (%union.9, %Type*, %TokenInfo*) @func455 (%union.9 %20, %Type* %22, %TokenInfo* %24)
  %26 = getelementptr inbounds %Decl, %Decl* %5, i1 0, i32 0
  %27 = load %AstId*, %AstId** %26
  %28 = getelementptr inbounds %AstId, %AstId* %27, i1 0, i32 0
  %29 = load %Str, %Str* %28
  call void (%Str, %Value*) @valbind_local (%Str %29, %Value* %25)
  ret void
}

define %Value* @func521 (%AstValueFunc) {
  %2 = extractvalue %AstValueFunc %0, 0
  %3 = call %Type* (%union.2*) @func413 (%union.2* %2)
  %4 = getelementptr inbounds %Type, %Type* %3, i1 0, i32 0
  %5 = load %TypeKind, %TypeKind* %4
  %6 = icmp eq %TypeKind %5, 2
  br i1 %6, label %then_0, label %else_0
then_0:
  br label %fail
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %8 = load %Nat32, %Nat32* @nocnt
  store %Nat32 0, %Nat32* @nocnt, align 4
  %9 = load %Nat32, %Nat32* @fuid
  %10 = add %Nat32 %9, 1
  store %Nat32 %10, %Nat32* @fuid, align 4
  %11 = bitcast [5 x %Nat8]* @func521_str1 to %Str
  %12 = load %Nat32, %Nat32* @fuid
  %13 = call %Str (%Str, %Nat32) @func131 (%Str %11, %Nat32 %12)
  %14 = extractvalue %AstValueFunc %0, 1
  %15 = bitcast %Int64 0 to %Int64
  %16 = ptrtoint %union.3 %14 to %Int64
  %17 = icmp eq %Int64 %16, %15
  br i1 %17, label %then_1, label %else_1
then_1:
  %18 = alloca %union.10
; write variant 1
  %19 = getelementptr inbounds %union.10, %union.10* %18, i1 0, i32 0
  store %Int16 1, %Int16* %19, align 2
; write data
  %20 = getelementptr inbounds %union.10, %union.10* %18, i1 0, i32 1
  %21 = bitcast [112 x %Nat8]* %20 to %NoBlock*
  store %NoBlock 0, %NoBlock* %21, align 2
  %22 = load %union.10, %union.10* %18
  %23 = call %Definition* (%Assembly*, %Str, %Type*, %union.10) @func261 (%Assembly* @asm0, %Str %13, %Type* %3, %union.10 %22)
  %24 = insertvalue %ValueGlobalConst zeroinitializer, %Type* %3, 0
  %25 = insertvalue %ValueGlobalConst %24, %Definition* %23, 1
  %26 = extractvalue %AstValueFunc %0, 2
  %27 = insertvalue %ValueGlobalConst %25, %TokenInfo* %26, 2
  %28 = alloca %union.9
; write variant 33
  %29 = getelementptr inbounds %union.9, %union.9* %28, i1 0, i32 0
  store %Int16 33, %Int16* %29, align 2
; write data
  %30 = getelementptr inbounds %union.9, %union.9* %28, i1 0, i32 1
  %31 = bitcast [72 x %Nat8]* %30 to %ValueGlobalConst*
  store %ValueGlobalConst %27, %ValueGlobalConst* %31, align 8
  %32 = load %union.9, %union.9* %28
  %33 = extractvalue %AstValueFunc %0, 2
  %34 = call %Value* (%union.9, %Type*, %TokenInfo*) @func455 (%union.9 %32, %Type* %3, %TokenInfo* %33)
  ret %Value* %34
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  %36 = extractvalue %AstValueFunc %0, 1
  %37 = bitcast %Int64 0 to %Int64
  %38 = ptrtoint %union.3 %36 to %Int64
  %39 = icmp eq %Int64 %38, %37
  br i1 %39, label %then_2, label %else_2
then_2:
  br label %fail
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
  %41 = alloca %union.9
; write variant 1
  %42 = getelementptr inbounds %union.9, %union.9* %41, i1 0, i32 0
  store %Int16 1, %Int16* %42, align 2
; write data
  %43 = getelementptr inbounds %union.9, %union.9* %41, i1 0, i32 1
  %44 = bitcast [72 x %Nat8]* %43 to %ValueNo*
  store %ValueNo 0, %ValueNo* %44, align 2
  %45 = load %union.9, %union.9* %41
  %46 = extractvalue %AstValueFunc %0, 2
  %47 = call %Value* (%union.9, %Type*, %TokenInfo*) @func455 (%union.9 %45, %Type* %3, %TokenInfo* %46)
  %48 = load %FuncContext*, %FuncContext** @fctx; loadImmPtr
  %49 = inttoptr i64 0 to%FuncContext*
  %50 = icmp ne %FuncContext* %48, %49
  br i1 %50, label %then_3, label %else_3
then_3:
  %51 = load %FuncContext*, %FuncContext** @fctx
  %52 = getelementptr inbounds %FuncContext, %FuncContext* %51, i1 0, i32 4
  %53 = bitcast %Value* %47 to %Unit*
  %54 = call i1 (%List*, %Unit*) @list_append (%List* %52, %Unit* %53)
  br label %endif_3
else_3:
  br label %endif_3
endif_3:
  %55 = load %FuncContext*, %FuncContext** @fctx
  %56 = call %Unit* (%Nat32) @malloc (%Nat32 144)
  %57 = bitcast %Unit* %56 to %FuncContext*
  store %FuncContext* %57, %FuncContext** @fctx, align 8
  %58 = load %FuncContext*, %FuncContext** @fctx
  %59 = bitcast %FuncContext* %58 to %Unit*
  %60 = call %Unit* (%Unit*, %Nat8, %Nat32) @memset (%Unit* %59, %Nat8 0, %Nat32 144)
  %61 = load %FuncContext*, %FuncContext** @fctx
  %62 = getelementptr inbounds %FuncContext, %FuncContext* %61, i1 0, i32 4
  call void (%List*) @map_init (%List* %62)
  %63 = load %FuncContext*, %FuncContext** @fctx
  %64 = getelementptr inbounds %FuncContext, %FuncContext* %63, i1 0, i32 0
  br label %select_1_0
select_1_0:; loadImmPtr
  %65 = inttoptr i64 0 to%FuncContext*
  %66 = icmp eq %FuncContext* %55, %65
  br i1 %66, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  br label %select_1_end
select_1_1:
  %67 = getelementptr inbounds %FuncContext, %FuncContext* %55, i1 0, i32 0
  %68 = load %Str, %Str* %67
  %69 = bitcast [2 x %Nat8]* @func521_str2 to %Str
  %70 = call %Str (%Str, %Str, %Str) @cat3 (%Str %68, %Str %69, %Str %13)
  br label %select_1_end
select_1_end:
  %71 = phi %Str [ %13, %select_1_0_ok ], [ %70, %select_1_1 ]
  store %Str %71, %Str* %64, align 8
  %72 = load %FuncContext*, %FuncContext** @fctx
  %73 = getelementptr inbounds %FuncContext, %FuncContext* %72, i1 0, i32 2; loadImmPtr
  %74 = inttoptr i64 0 to%StmtBlock*
  store %StmtBlock* %74, %StmtBlock** %73, align 8
  %75 = load %FuncContext*, %FuncContext** @fctx
  %76 = getelementptr inbounds %FuncContext, %FuncContext* %75, i1 0, i32 1
  store %Value* %47, %Value** %76, align 8
  %77 = load %Context*, %Context** @cctx
  %78 = load %FuncContext*, %FuncContext** @fctx
  %79 = getelementptr inbounds %FuncContext, %FuncContext* %78, i1 0, i32 3
  %80 = load %Module*, %Module** @module
  %81 = getelementptr inbounds %Module, %Module* %80, i1 0, i32 0
  call void (%Context*, %Context*) @context_init (%Context* %79, %Context* %81)
  %82 = load %FuncContext*, %FuncContext** @fctx
  %83 = getelementptr inbounds %FuncContext, %FuncContext* %82, i1 0, i32 3
  store %Context* %83, %Context** @cctx, align 8
  %84 = getelementptr inbounds %Type, %Type* %3, i1 0, i32 7
  %85 = getelementptr inbounds %TypeFunc, %TypeFunc* %84, i1 0, i32 0
  %86 = load %Type*, %Type** %85
  %87 = getelementptr inbounds %Type, %Type* %86, i1 0, i32 11
  %88 = getelementptr inbounds %TypeRecord, %TypeRecord* %87, i1 0, i32 0
  %89 = load %List*, %List** %88; loadImmPtr
  %90 = inttoptr i64 0 to%Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @func64 (%List* %89, %ListForeachHandler @func522, %Unit* %90)
  %91 = bitcast %union.3 %36 to %union.7*
  %92 = call %union.24 (%union.7*) @func543 (%union.7* %91)
  %93 = bitcast %Int64 0 to %Int64
  %94 = ptrtoint %union.14 %92 to %Int64
  %95 = icmp eq %Int64 %94, %93
  br i1 %95, label %then_4, label %else_4
then_4:
  br label %fail
  br label %endif_4
else_4:
  br label %endif_4
endif_4:
  %97 = bitcast %union.14 %92 to %union.13*
  %98 = load %union.13, %union.13* %97
  %99 = alloca %union.13
  store %union.13 %98, %union.13* %99, align 128
  %100 = getelementptr inbounds %union.13, %union.13* %99, i1 0, i32 1
  %101 = bitcast [112 x %Nat8]* %100 to %StmtBlock*
  %102 = load %StmtBlock, %StmtBlock* %101
  %103 = alloca %union.10
; write variant 0
  %104 = getelementptr inbounds %union.10, %union.10* %103, i1 0, i32 0
  store %Int16 0, %Int16* %104, align 2
; write data
  %105 = getelementptr inbounds %union.10, %union.10* %103, i1 0, i32 1
  %106 = bitcast [112 x %Nat8]* %105 to %StmtBlock*
  store %StmtBlock %102, %StmtBlock* %106, align 8
  %107 = load %union.10, %union.10* %103
  %108 = call %Definition* (%Assembly*, %Str, %Type*, %union.10) @func261 (%Assembly* @asm0, %Str %13, %Type* %3, %union.10 %107)
  %109 = getelementptr inbounds %Value, %Value* %47, i1 0, i32 1
  %110 = insertvalue %ValueGlobalConst zeroinitializer, %Type* %3, 0
  %111 = insertvalue %ValueGlobalConst %110, %Definition* %108, 1
  %112 = extractvalue %AstValueFunc %0, 2
  %113 = insertvalue %ValueGlobalConst %111, %TokenInfo* %112, 2
  %114 = alloca %union.9
; write variant 33
  %115 = getelementptr inbounds %union.9, %union.9* %114, i1 0, i32 0
  store %Int16 33, %Int16* %115, align 2
; write data
  %116 = getelementptr inbounds %union.9, %union.9* %114, i1 0, i32 1
  %117 = bitcast [72 x %Nat8]* %116 to %ValueGlobalConst*
  store %ValueGlobalConst %113, %ValueGlobalConst* %117, align 8
  %118 = load %union.9, %union.9* %114
  store %union.9 %118, %union.9* %109, align 128
  store %Context* %77, %Context** @cctx, align 8
  store %FuncContext* %55, %FuncContext** @fctx, align 8
  store %Nat32 %8, %Nat32* @nocnt, align 4
  ret %Value* %47
  br label %fail
fail:
  store %Context* %77, %Context** @cctx, align 8
  store %FuncContext* %55, %FuncContext** @fctx, align 8
  %120 = extractvalue %AstValueFunc %0, 2
  %121 = call %Value* (%TokenInfo*) @value_new_poison (%TokenInfo* %120)
  ret %Value* %121
}

define void @func524 (%Unit*, %Unit*, %Nat32, %Node*) {
  %5 = bitcast %Unit* %0 to %union.4*
  %6 = bitcast %Unit* %1 to %func523.type11*
  %7 = call %Value* (%union.4*) @func476 (%union.4* %5)
  %8 = getelementptr inbounds %Value, %Value* %7, i1 0, i32 1
  %9 = load %union.9, %union.9* %8
  %10 = extractvalue %union.9 %9, 0
  %11 = bitcast %Int16 40 to %Int16
  %12 = icmp eq %Int16 %10, %11
  br i1 %12, label %then_0, label %else_0
then_0:
ret void
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %14 = alloca %Value*; loadImmPtr
  %15 = inttoptr i64 0 to%Value*
  store %Value* %15, %Value** %14, align 8
  %16 = getelementptr inbounds %func523.type11, %func523.type11* %6, i1 0, i32 1
  %17 = load %union.23, %union.23* %16
  %18 = bitcast %Int64 0 to %Int64
  %19 = ptrtoint %union.23 %17 to %Int64
  %20 = icmp eq %Int64 %19, %18
  br i1 %20, label %then_1, label %else_1
then_1:
  %21 = call %Value* (%Value*) @func534 (%Value* %7)
  store %Value* %21, %Value** %14, align 8
  %22 = getelementptr inbounds %func523.type11, %func523.type11* %6, i1 0, i32 1
  %23 = load %Value*, %Value** %14
  %24 = getelementptr inbounds %Value, %Value* %23, i1 0, i32 0
  %25 = load %Type*, %Type** %24
  %26 = bitcast %Type* %25 to %union.23
  store %union.23 %26, %union.23* %22, align 16
  br label %endif_1
else_1:
  %27 = getelementptr inbounds %func523.type11, %func523.type11* %6, i1 0, i32 1
  %28 = load %union.23, %union.23* %27
  %29 = bitcast %union.23 %28 to %Type*
  %30 = call %Value* (%Value*, %Type*) @func537 (%Value* %7, %Type* %29)
  store %Value* %30, %Value** %14, align 8
  %31 = getelementptr inbounds %func523.type11, %func523.type11* %6, i1 0, i32 1
  %32 = load %union.23, %union.23* %31
  %33 = bitcast %union.23 %32 to %Type*
  %34 = load %Value*, %Value** %14
  %35 = getelementptr inbounds %Value, %Value* %34, i1 0, i32 0
  %36 = load %Type*, %Type** %35
  %37 = load %Value*, %Value** %14
  %38 = getelementptr inbounds %Value, %Value* %37, i1 0, i32 3
  %39 = load %TokenInfo*, %TokenInfo** %38
  %40 = call i1 (%Type*, %Type*, %TokenInfo*) @type_check (%Type* %33, %Type* %36, %TokenInfo* %39)
  br label %endif_1
endif_1:
  %41 = getelementptr inbounds %func523.type11, %func523.type11* %6, i1 0, i32 0
  %42 = load %Value*, %Value** %14
  %43 = bitcast %Value* %42 to %Unit*
  %44 = call i1 (%List*, %Unit*) @list_append (%List* %41, %Unit* %43)
  ret void
}

define %Value* @func523 (%AstValueArray) {
  %2 = alloca %func523.type11
  store %func523.type11 zeroinitializer, %func523.type11* %2, align 16
  %3 = getelementptr inbounds %func523.type11, %func523.type11* %2, i1 0, i32 1
  %4 = inttoptr %Unit zeroinitializer to %union.23
  store %union.23 %4, %union.23* %3, align 16
  %5 = getelementptr inbounds %func523.type11, %func523.type11* %2, i1 0, i32 0
  call void (%List*) @map_init (%List* %5)
  %6 = alloca %AstValueArray
  store %AstValueArray %0, %AstValueArray* %6, align 8
  %7 = getelementptr inbounds %AstValueArray, %AstValueArray* %6, i1 0, i32 0
  %8 = getelementptr inbounds %func523.type11, %func523.type11* %2, i1 0
  %9 = bitcast %func523.type11* %8 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @func64 (%List* %7, %ListForeachHandler @func524, %Unit* %9)
  %10 = getelementptr inbounds %func523.type11, %func523.type11* %2, i1 0, i32 1
  %11 = load %union.23, %union.23* %10
  %12 = bitcast %union.23 %11 to %Type*
  %13 = getelementptr inbounds %func523.type11, %func523.type11* %2, i1 0, i32 0
  %14 = getelementptr inbounds %List, %List* %13, i1 0, i32 2
  %15 = load %Nat64, %Nat64* %14
  %16 = trunc %Nat64 %15 to %Nat32
  %17 = extractvalue %AstValueArray %0, 1
  %18 = call %Type* (%Type*, %Nat32, %TokenInfo*) @func397 (%Type* %12, %Nat32 %16, %TokenInfo* %17)
  %19 = call %Str () @func137 ()
  %20 = getelementptr inbounds %func523.type11, %func523.type11* %2, i1 0, i32 0
  %21 = load %List, %List* %20
  %22 = call %Definition* (%Assembly*, %Str, %Type*, %List) @func260 (%Assembly* @asm0, %Str %19, %Type* %18, %List %21)
  %23 = insertvalue %ValueGlobalConst zeroinitializer, %Type* %18, 0
  %24 = insertvalue %ValueGlobalConst %23, %Definition* %22, 1
  %25 = extractvalue %AstValueArray %0, 1
  %26 = insertvalue %ValueGlobalConst %24, %TokenInfo* %25, 2
  %27 = alloca %union.9
; write variant 33
  %28 = getelementptr inbounds %union.9, %union.9* %27, i1 0, i32 0
  store %Int16 33, %Int16* %28, align 2
; write data
  %29 = getelementptr inbounds %union.9, %union.9* %27, i1 0, i32 1
  %30 = bitcast [72 x %Nat8]* %29 to %ValueGlobalConst*
  store %ValueGlobalConst %26, %ValueGlobalConst* %30, align 8
  %31 = load %union.9, %union.9* %27
  %32 = extractvalue %AstValueArray %0, 1
  %33 = call %Value* (%union.9, %Type*, %TokenInfo*) @func455 (%union.9 %31, %Type* %18, %TokenInfo* %32)
  ret %Value* %33
  br label %fail
fail:
  %35 = extractvalue %AstValueArray %0, 1
  %36 = call %Value* (%TokenInfo*) @value_new_poison (%TokenInfo* %35)
  ret %Value* %36
}

define void @func526 (%Unit*, %Unit*, %Unit*) {
  %4 = bitcast %Unit* %0 to %Str
  %5 = bitcast %Unit* %1 to %union.4*
  %6 = bitcast %Unit* %2 to %func525.type12*
  %7 = call %Value* (%union.4*) @func476 (%union.4* %5)
  %8 = call %Unit* (%Nat32) @malloc (%Nat32 16)
  %9 = bitcast %Unit* %8 to %AstId*
  %10 = insertvalue %AstId zeroinitializer, %Str %4, 0; loadImmPtr
  %11 = inttoptr i64 0 to%TokenInfo*
  %12 = insertvalue %AstId %10, %TokenInfo* %11, 1
  store %AstId %12, %AstId* %9, align 8
  %13 = getelementptr inbounds %Value, %Value* %7, i1 0, i32 0
  %14 = load %Type*, %Type** %13; loadImmPtr
  %15 = inttoptr i64 0 to%TokenInfo*
  %16 = call %Decl* (%AstId*, %Type*, %TokenInfo*) @func430 (%AstId* %9, %Type* %14, %TokenInfo* %15)
  %17 = getelementptr inbounds %func525.type12, %func525.type12* %6, i1 0, i32 0
  %18 = load %Type*, %Type** %17
  %19 = getelementptr inbounds %Type, %Type* %18, i1 0, i32 11
  %20 = getelementptr inbounds %TypeRecord, %TypeRecord* %19, i1 0, i32 0
  %21 = load %List*, %List** %20
  %22 = bitcast %Decl* %16 to %Unit*
  %23 = call i1 (%List*, %Unit*) @list_append (%List* %21, %Unit* %22)
  %24 = getelementptr inbounds %func525.type12, %func525.type12* %6, i1 0, i32 1
  %25 = bitcast %Value* %7 to %Unit*
  %26 = call i1 (%List*, %Str, %Unit*) @map_append (%List* %24, %Str %4, %Unit* %25)
  ret void
}

define %Value* @func525 (%AstValueRecord) {
  %2 = call %Token* () @func183 ()
  %3 = getelementptr inbounds %Token, %Token* %2, i1 0, i32 1
  %4 = insertvalue %TypeGenericRecord zeroinitializer, %TokenInfo* %3, 0
  %5 = alloca %union.8
; write variant 12
  %6 = getelementptr inbounds %union.8, %union.8* %5, i1 0, i32 0
  store %Int16 12, %Int16* %6, align 2
; write data
  %7 = getelementptr inbounds %union.8, %union.8* %5, i1 0, i32 1
  %8 = bitcast [56 x %Nat8]* %7 to %TypeGenericRecord*
  store %TypeGenericRecord %4, %TypeGenericRecord* %8, align 8
  %9 = load %union.8, %union.8* %5
  %10 = call %Type* (%TypeKind, %union.8, %Nat32, %TokenInfo*) @func393 (%TypeKind 4, %union.8 %9, %Nat32 0, %TokenInfo* %3)
  %11 = getelementptr inbounds %Type, %Type* %10, i1 0, i32 11
  %12 = getelementptr inbounds %TypeRecord, %TypeRecord* %11, i1 0, i32 0
  %13 = call %List* () @map_new ()
  store %List* %13, %List** %12, align 8
  %14 = alloca %func525.type12
  %15 = insertvalue %func525.type12 zeroinitializer, %Type* %10, 0
  store %func525.type12 %15, %func525.type12* %14, align 8
  %16 = alloca %List
  %17 = extractvalue %AstValueRecord %0, 0
  store %List %17, %List* %16, align 8
  %18 = getelementptr inbounds %List, %List* %16, i1 0
  %19 = getelementptr inbounds %func525.type12, %func525.type12* %14, i1 0
  %20 = bitcast %func525.type12* %19 to %Unit*
  call void (%List*, %MapForeachHandler, %Unit*) @map_foreach (%List* %18, %MapForeachHandler @func526, %Unit* %20)
  %21 = insertvalue %ValueGenericRecord zeroinitializer, %Type* %10, 0
  %22 = getelementptr inbounds %func525.type12, %func525.type12* %14, i1 0, i32 1
  %23 = load %List, %List* %22
  %24 = insertvalue %ValueGenericRecord %21, %List %23, 1
  %25 = alloca %union.9
; write variant 36
  %26 = getelementptr inbounds %union.9, %union.9* %25, i1 0, i32 0
  store %Int16 36, %Int16* %26, align 2
; write data
  %27 = getelementptr inbounds %union.9, %union.9* %25, i1 0, i32 1
  %28 = bitcast [72 x %Nat8]* %27 to %ValueGenericRecord*
  store %ValueGenericRecord %24, %ValueGenericRecord* %28, align 8
  %29 = load %union.9, %union.9* %25
  %30 = extractvalue %AstValueRecord %0, 1
  %31 = call %Value* (%union.9, %Type*, %TokenInfo*) @func455 (%union.9 %29, %Type* %10, %TokenInfo* %30)
  ret %Value* %31
  br label %fail
fail:
  %33 = extractvalue %AstValueRecord %0, 1
  %34 = call %Value* (%TokenInfo*) @value_new_poison (%TokenInfo* %33)
  ret %Value* %34
}

define %Value* @func527 (%AstValueUnary) {
  %2 = extractvalue %AstValueUnary %0, 0
  %3 = call %Value* (%union.4*) @func476 (%union.4* %2)
  %4 = getelementptr inbounds %Value, %Value* %3, i1 0, i32 1
  %5 = load %union.9, %union.9* %4
  %6 = extractvalue %union.9 %5, 0
  %7 = bitcast %Int16 40 to %Int16
  %8 = icmp eq %Int16 %6, %7
  br i1 %8, label %then_0, label %else_0
then_0:
  br label %fail
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %10 = call i1 (%Value*) @is_value_imm_num (%Value* %3)
  br i1 %10, label %then_1, label %else_1
then_1:
  %11 = getelementptr inbounds %Value, %Value* %3, i1 0, i32 1
  %12 = load %union.9, %union.9* %11
  %13 = alloca %union.9
  store %union.9 %12, %union.9* %13, align 128
  %14 = getelementptr inbounds %union.9, %union.9* %13, i1 0, i32 1
  %15 = bitcast [72 x %Nat8]* %14 to %ValueImm*
  %16 = load %ValueImm, %ValueImm* %15
  %17 = extractvalue %ValueImm %16, 1
  %18 = getelementptr inbounds %Value, %Value* %3, i1 0, i32 0
  %19 = load %Type*, %Type** %18
  %20 = extractvalue %AstValueUnary %0, 1
  %21 = call %Value* (%Type*, %Int64, %TokenInfo*) @func457 (%Type* %19, %Int64 %17, %TokenInfo* %20)
  ret %Value* %21
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  %23 = getelementptr inbounds %Value, %Value* %3, i1 0, i32 0
  %24 = load %Type*, %Type** %23
  %25 = insertvalue %ValueUn zeroinitializer, %Type* %24, 0
  %26 = insertvalue %ValueUn %25, %Value* %3, 1
  %27 = extractvalue %AstValueUnary %0, 1
  %28 = insertvalue %ValueUn %26, %TokenInfo* %27, 2
  %29 = alloca %union.9
; write variant 25
  %30 = getelementptr inbounds %union.9, %union.9* %29, i1 0, i32 0
  store %Int16 25, %Int16* %30, align 2
; write data
  %31 = getelementptr inbounds %union.9, %union.9* %29, i1 0, i32 1
  %32 = bitcast [72 x %Nat8]* %31 to %ValueUn*
  store %ValueUn %28, %ValueUn* %32, align 8
  %33 = load %union.9, %union.9* %29
  %34 = getelementptr inbounds %Value, %Value* %3, i1 0, i32 0
  %35 = load %Type*, %Type** %34
  %36 = extractvalue %AstValueUnary %0, 1
  %37 = call %Value* (%union.9, %Type*, %TokenInfo*) @func455 (%union.9 %33, %Type* %35, %TokenInfo* %36)
  ret %Value* %37
  br label %fail
fail:
  %39 = extractvalue %AstValueUnary %0, 1
  %40 = call %Value* (%TokenInfo*) @value_new_poison (%TokenInfo* %39)
  ret %Value* %40
}

define %Value* @func528 (%AstValueUnary) {
  %2 = extractvalue %AstValueUnary %0, 0
  %3 = call %Value* (%union.4*) @func476 (%union.4* %2)
  %4 = getelementptr inbounds %Value, %Value* %3, i1 0, i32 1
  %5 = load %union.9, %union.9* %4
  %6 = extractvalue %union.9 %5, 0
  %7 = bitcast %Int16 40 to %Int16
  %8 = icmp eq %Int16 %6, %7
  br i1 %8, label %then_0, label %else_0
then_0:
  br label %fail
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %10 = call i1 (%Value*) @is_value_imm_num (%Value* %3)
  br i1 %10, label %then_1, label %else_1
then_1:
  %11 = getelementptr inbounds %Value, %Value* %3, i1 0, i32 1
  %12 = load %union.9, %union.9* %11
  %13 = alloca %union.9
  store %union.9 %12, %union.9* %13, align 128
  %14 = getelementptr inbounds %union.9, %union.9* %13, i1 0, i32 1
  %15 = bitcast [72 x %Nat8]* %14 to %ValueImm*
  %16 = load %ValueImm, %ValueImm* %15
  %17 = extractvalue %ValueImm %16, 1
  %18 = getelementptr inbounds %Value, %Value* %3, i1 0, i32 0
  %19 = load %Type*, %Type** %18
  %20 = sub nsw %Int64 0, %17
  %21 = extractvalue %AstValueUnary %0, 1
  %22 = call %Value* (%Type*, %Int64, %TokenInfo*) @func457 (%Type* %19, %Int64 %20, %TokenInfo* %21)
  ret %Value* %22
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  %24 = getelementptr inbounds %Value, %Value* %3, i1 0, i32 0
  %25 = load %Type*, %Type** %24
  %26 = insertvalue %ValueUn zeroinitializer, %Type* %25, 0
  %27 = insertvalue %ValueUn %26, %Value* %3, 1
  %28 = extractvalue %AstValueUnary %0, 1
  %29 = insertvalue %ValueUn %27, %TokenInfo* %28, 2
  %30 = alloca %union.9
; write variant 26
  %31 = getelementptr inbounds %union.9, %union.9* %30, i1 0, i32 0
  store %Int16 26, %Int16* %31, align 2
; write data
  %32 = getelementptr inbounds %union.9, %union.9* %30, i1 0, i32 1
  %33 = bitcast [72 x %Nat8]* %32 to %ValueUn*
  store %ValueUn %29, %ValueUn* %33, align 8
  %34 = load %union.9, %union.9* %30
  %35 = getelementptr inbounds %Value, %Value* %3, i1 0, i32 0
  %36 = load %Type*, %Type** %35
  %37 = extractvalue %AstValueUnary %0, 1
  %38 = call %Value* (%union.9, %Type*, %TokenInfo*) @func455 (%union.9 %34, %Type* %36, %TokenInfo* %37)
  ret %Value* %38
  br label %fail
fail:
  %40 = extractvalue %AstValueUnary %0, 1
  %41 = call %Value* (%TokenInfo*) @value_new_poison (%TokenInfo* %40)
  ret %Value* %41
}

define %Value* @func529 (%AstValueUnary) {
  %2 = extractvalue %AstValueUnary %0, 0
  %3 = call %Value* (%union.4*) @func476 (%union.4* %2)
  %4 = getelementptr inbounds %Value, %Value* %3, i1 0, i32 1
  %5 = load %union.9, %union.9* %4
  %6 = extractvalue %union.9 %5, 0
  %7 = bitcast %Int16 40 to %Int16
  %8 = icmp eq %Int16 %6, %7
  br i1 %8, label %then_0, label %else_0
then_0:
  br label %fail
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %10 = call i1 (%Value*) @is_value_imm_num (%Value* %3)
  br i1 %10, label %then_1, label %else_1
then_1:
  %11 = getelementptr inbounds %Value, %Value* %3, i1 0, i32 1
  %12 = load %union.9, %union.9* %11
  %13 = alloca %union.9
  store %union.9 %12, %union.9* %13, align 128
  %14 = getelementptr inbounds %union.9, %union.9* %13, i1 0, i32 1
  %15 = bitcast [72 x %Nat8]* %14 to %ValueImm*
  %16 = load %ValueImm, %ValueImm* %15
  %17 = extractvalue %ValueImm %16, 1
  %18 = getelementptr inbounds %Value, %Value* %3, i1 0, i32 0
  %19 = load %Type*, %Type** %18
  %20 = xor %Int64 %17, -1
  %21 = extractvalue %AstValueUnary %0, 1
  %22 = call %Value* (%Type*, %Int64, %TokenInfo*) @func457 (%Type* %19, %Int64 %20, %TokenInfo* %21)
  ret %Value* %22
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  %24 = getelementptr inbounds %Value, %Value* %3, i1 0, i32 0
  %25 = load %Type*, %Type** %24
  %26 = insertvalue %ValueUn zeroinitializer, %Type* %25, 0
  %27 = insertvalue %ValueUn %26, %Value* %3, 1
  %28 = extractvalue %AstValueUnary %0, 1
  %29 = insertvalue %ValueUn %27, %TokenInfo* %28, 2
  %30 = alloca %union.9
; write variant 27
  %31 = getelementptr inbounds %union.9, %union.9* %30, i1 0, i32 0
  store %Int16 27, %Int16* %31, align 2
; write data
  %32 = getelementptr inbounds %union.9, %union.9* %30, i1 0, i32 1
  %33 = bitcast [72 x %Nat8]* %32 to %ValueUn*
  store %ValueUn %29, %ValueUn* %33, align 8
  %34 = load %union.9, %union.9* %30
  %35 = getelementptr inbounds %Value, %Value* %3, i1 0, i32 0
  %36 = load %Type*, %Type** %35
  %37 = extractvalue %AstValueUnary %0, 1
  %38 = call %Value* (%union.9, %Type*, %TokenInfo*) @func455 (%union.9 %34, %Type* %36, %TokenInfo* %37)
  ret %Value* %38
  br label %fail
fail:
  %40 = extractvalue %AstValueUnary %0, 1
  %41 = call %Value* (%TokenInfo*) @value_new_poison (%TokenInfo* %40)
  ret %Value* %41
}

define %Value* @func530 (%ValueKind, %union.4*, %union.4*, %TokenInfo*) {
  %5 = call %Value* (%union.4*) @func476 (%union.4* %1)
  %6 = call %Value* (%union.4*) @func476 (%union.4* %2)
  %7 = getelementptr inbounds %Value, %Value* %5, i1 0, i32 1
  %8 = load %union.9, %union.9* %7
  %9 = extractvalue %union.9 %8, 0
  %10 = bitcast %Int16 40 to %Int16
  %11 = icmp eq %Int16 %9, %10
  br i1 %11, label %then_0, label %else_0
then_0:
  br label %fail
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %13 = getelementptr inbounds %Value, %Value* %6, i1 0, i32 1
  %14 = load %union.9, %union.9* %13
  %15 = extractvalue %union.9 %14, 0
  %16 = bitcast %Int16 40 to %Int16
  %17 = icmp eq %Int16 %15, %16
  br i1 %17, label %then_1, label %else_1
then_1:
  br label %fail
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  %19 = call i1 (%Value*) @is_value_imm_num (%Value* %5)
  %20 = call i1 (%Value*) @is_value_imm_num (%Value* %6)
  %21 = and i1 %19, %20
  br i1 %21, label %then_2, label %else_2
then_2:
  %22 = getelementptr inbounds %Value, %Value* %5, i1 0, i32 1
  %23 = load %union.9, %union.9* %22
  %24 = alloca %union.9
  store %union.9 %23, %union.9* %24, align 128
  %25 = getelementptr inbounds %union.9, %union.9* %24, i1 0, i32 1
  %26 = bitcast [72 x %Nat8]* %25 to %ValueImm*
  %27 = load %ValueImm, %ValueImm* %26
  %28 = extractvalue %ValueImm %27, 1
  %29 = getelementptr inbounds %Value, %Value* %6, i1 0, i32 1
  %30 = load %union.9, %union.9* %29
  %31 = alloca %union.9
  store %union.9 %30, %union.9* %31, align 128
  %32 = getelementptr inbounds %union.9, %union.9* %31, i1 0, i32 1
  %33 = bitcast [72 x %Nat8]* %32 to %ValueImm*
  %34 = load %ValueImm, %ValueImm* %33
  %35 = extractvalue %ValueImm %34, 1
  br label %select_1_0
select_1_0:
  %36 = icmp eq %ValueKind %0, 33
  br i1 %36, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %37 = shl %Int64 %28, %35
  br label %select_1_end
select_1_1:
  %38 = ashr %Int64 %28, %35
  br label %select_1_end
select_1_end:
  %39 = phi %Int64 [ %37, %select_1_0_ok ], [ %38, %select_1_1 ]
  %40 = getelementptr inbounds %Value, %Value* %5, i1 0, i32 0
  %41 = load %Type*, %Type** %40
  %42 = call %Value* (%Type*, %Int64, %TokenInfo*) @func457 (%Type* %41, %Int64 %39, %TokenInfo* %3)
  ret %Value* %42
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
  %44 = call %Value* (%Value*) @func534 (%Value* %5)
  %45 = getelementptr inbounds %Value, %Value* %5, i1 0, i32 0
  %46 = load %Type*, %Type** %45
  %47 = getelementptr inbounds %Value, %Value* %6, i1 0, i32 3
  %48 = load %TokenInfo*, %TokenInfo** %47
  %49 = call %Value* (%Value*, %Type*, %TokenInfo*) @func532 (%Value* %6, %Type* %46, %TokenInfo* %48)
  %50 = getelementptr inbounds %Value, %Value* %5, i1 0, i32 0
  %51 = load %Type*, %Type** %50
  br label %select_2_0
select_2_0:
  %52 = icmp eq %ValueKind %0, 33
  br i1 %52, label %select_2_0_ok, label %select_2_1
select_2_0_ok:
  %53 = insertvalue %ValueBin zeroinitializer, %Type* %51, 0
  %54 = insertvalue %ValueBin %53, %Value* %44, 1
  %55 = insertvalue %ValueBin %54, %Value* %49, 2
  %56 = insertvalue %ValueBin %55, %TokenInfo* %3, 3
  %57 = alloca %union.9
; write variant 10
  %58 = getelementptr inbounds %union.9, %union.9* %57, i1 0, i32 0
  store %Int16 10, %Int16* %58, align 2
; write data
  %59 = getelementptr inbounds %union.9, %union.9* %57, i1 0, i32 1
  %60 = bitcast [72 x %Nat8]* %59 to %ValueBin*
  store %ValueBin %56, %ValueBin* %60, align 8
  %61 = load %union.9, %union.9* %57
  %62 = call %Value* (%union.9, %Type*, %TokenInfo*) @func455 (%union.9 %61, %Type* %51, %TokenInfo* %3)
  br label %select_2_end
select_2_1:
  %63 = icmp eq %ValueKind %0, 34
  br i1 %63, label %select_2_1_ok, label %select_2_2
select_2_1_ok:
  %64 = insertvalue %ValueBin zeroinitializer, %Type* %51, 0
  %65 = insertvalue %ValueBin %64, %Value* %44, 1
  %66 = insertvalue %ValueBin %65, %Value* %49, 2
  %67 = insertvalue %ValueBin %66, %TokenInfo* %3, 3
  %68 = alloca %union.9
; write variant 9
  %69 = getelementptr inbounds %union.9, %union.9* %68, i1 0, i32 0
  store %Int16 9, %Int16* %69, align 2
; write data
  %70 = getelementptr inbounds %union.9, %union.9* %68, i1 0, i32 1
  %71 = bitcast [72 x %Nat8]* %70 to %ValueBin*
  store %ValueBin %67, %ValueBin* %71, align 8
  %72 = load %union.9, %union.9* %68
  %73 = call %Value* (%union.9, %Type*, %TokenInfo*) @func455 (%union.9 %72, %Type* %51, %TokenInfo* %3)
  br label %select_2_end
select_2_2:
  %74 = call %Value* (%TokenInfo*) @value_new_poison (%TokenInfo* %3)
  br label %select_2_end
select_2_end:
  %75 = phi %Value* [ %62, %select_2_0_ok ], [ %73, %select_2_1_ok ], [ %74, %select_2_2 ]
  ret %Value* %75
  br label %fail
fail:
  %77 = call %Value* (%TokenInfo*) @value_new_poison (%TokenInfo* %3)
  ret %Value* %77
}

define i1 @func531 (%ValueKind, %Type*) {
  %3 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 0
  %4 = load %TypeKind, %TypeKind* %3
  %5 = icmp eq %TypeKind %4, 2
  br i1 %5, label %then_0, label %else_0
then_0:
  ret i1 1
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %7 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 0
  %8 = load %TypeKind, %TypeKind* %7
  %9 = icmp eq %TypeKind %8, 12
  %10 = call i1 (%Type*) @func404 (%Type* %1)
  %11 = or i1 %9, %10
  br i1 %11, label %then_1, label %else_1
then_1:
  ret i1 0
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  %13 = icmp eq %ValueKind %0, 26
  %14 = icmp eq %ValueKind %0, 27
  %15 = or i1 %13, %14
  br i1 %15, label %then_2, label %else_2
then_2:
  ret i1 1
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
  %17 = call i1 (%Type*) @func403 (%Type* %1)
  br i1 %17, label %then_3, label %else_3
then_3:
  ret i1 0
  br label %endif_3
else_3:
  br label %endif_3
endif_3:
  %19 = icmp ne %ValueKind %0, 25
  %20 = icmp ne %ValueKind %0, 23
  %21 = icmp ne %ValueKind %0, 24
  %22 = and i1 %20, %21
  %23 = and i1 %19, %22
  br i1 %23, label %then_4, label %else_4
then_4:
  %24 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 0
  %25 = load %TypeKind, %TypeKind* %24
  %26 = icmp eq %TypeKind %25, 11
  %27 = load %Type*, %Type** @typeBool
  %28 = call i1 (%Type*, %Type*) @func445 (%Type* %1, %Type* %27)
  %29 = call i1 (%Type*) @func403 (%Type* %1)
  %30 = or i1 %28, %29
  %31 = or i1 %26, %30
  br i1 %31, label %then_5, label %else_5
then_5:
  ret i1 0
  br label %endif_5
else_5:
  br label %endif_5
endif_5:
  br label %endif_4
else_4:
  br label %endif_4
endif_4:
  ret i1 1
}

define i1 @func533 (%Value*, %Type*) {
  %3 = call i1 (%Value*) @is_value_imm_num (%Value* %0)
  ret i1 %3
}

define %Value* @func532 (%Value*, %Type*, %TokenInfo*) {
  %4 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 1
  %5 = load %union.9, %union.9* %4
  %6 = extractvalue %union.9 %5, 0
  %7 = bitcast %Int16 40 to %Int16
  %8 = icmp eq %Int16 %6, %7
  br i1 %8, label %then_0, label %else_0
then_0:
  br label %fail
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %10 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 0
  %11 = load %TypeKind, %TypeKind* %10
  %12 = icmp eq %TypeKind %11, 2
  br i1 %12, label %then_1, label %else_1
then_1:
  br label %fail
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  %14 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 0
  %15 = load %Type*, %Type** %14
  %16 = call i1 (%Type*, %Type*) @func445 (%Type* %15, %Type* %1)
  br i1 %16, label %then_2, label %else_2
then_2:
  ret %Value* %0
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
  %18 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 0
  %19 = load %TypeKind, %TypeKind* %18
  %20 = icmp eq %TypeKind %19, 16
  br i1 %20, label %then_3, label %else_3
then_3:
  br label %sact
  %22 = bitcast [32 x %Nat8]* @func532_str1 to %Str
  call void (%Str, %TokenInfo*) @error (%Str %22, %TokenInfo* %2)
  %23 = call %Value* (%TokenInfo*) @value_new_poison (%TokenInfo* %2)
  ret %Value* %23
  br label %endif_3
else_3:
  br label %endif_3
endif_3:
  %25 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 0
  %26 = load %Type*, %Type** %25
  %27 = getelementptr inbounds %Type, %Type* %26, i1 0, i32 0
  %28 = load %TypeKind, %TypeKind* %27
  %29 = icmp eq %TypeKind %28, 4
  %30 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 0
  %31 = load %TypeKind, %TypeKind* %30
  %32 = icmp eq %TypeKind %31, 12
  %33 = and i1 %29, %32
  br i1 %33, label %then_4, label %else_4
then_4:
  %34 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 0
  %35 = load %Type*, %Type** %34
  %36 = call i1 (%Type*, %Type*) @func535 (%Type* %35, %Type* %1)
  %37 = xor i1 %36, 1
  br i1 %37, label %then_5, label %else_5
then_5:
  %38 = bitcast [11 x %Nat8]* @func532_str2 to %Str
  call void (%Str, %TokenInfo*) @error (%Str %38, %TokenInfo* %2)
  br label %endif_5
else_5:
  br label %endif_5
endif_5:
  %39 = call %Value* (%Value*, %Type*, %TokenInfo*) @do_value_cast_gen_rec (%Value* %0, %Type* %1, %TokenInfo* %2)
  ret %Value* %39
  br label %endif_4
else_4:
  br label %endif_4
endif_4:
  %41 = call i1 (%Value*, %Type*) @func533 (%Value* %0, %Type* %1)
  br i1 %41, label %then_6, label %else_6
then_6:
  %42 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 1
  %43 = load %union.9, %union.9* %42
  %44 = alloca %union.9
  store %union.9 %43, %union.9* %44, align 128
  %45 = getelementptr inbounds %union.9, %union.9* %44, i1 0, i32 1
  %46 = bitcast [72 x %Nat8]* %45 to %ValueImm*
  %47 = load %ValueImm, %ValueImm* %46
  %48 = extractvalue %ValueImm %47, 1
  %49 = call %Value* (%Type*, %Int64, %TokenInfo*) @func457 (%Type* %1, %Int64 %48, %TokenInfo* %2)
  ret %Value* %49
  br label %endif_6
else_6:
  br label %endif_6
endif_6:
  br label %sact
sact:
  %51 = insertvalue %ValueCast zeroinitializer, %Type* %1, 0
  %52 = insertvalue %ValueCast %51, %Value* %0, 1
  %53 = insertvalue %ValueCast %52, %TokenInfo* %2, 3
  %54 = alloca %union.9
; write variant 6
  %55 = getelementptr inbounds %union.9, %union.9* %54, i1 0, i32 0
  store %Int16 6, %Int16* %55, align 2
; write data
  %56 = getelementptr inbounds %union.9, %union.9* %54, i1 0, i32 1
  %57 = bitcast [72 x %Nat8]* %56 to %ValueCast*
  store %ValueCast %53, %ValueCast* %57, align 8
  %58 = load %union.9, %union.9* %54
  %59 = call %Value* (%union.9, %Type*, %TokenInfo*) @func455 (%union.9 %58, %Type* %1, %TokenInfo* %2)
  ret %Value* %59
  br label %fail
fail:
  %61 = call %Value* (%TokenInfo*) @value_new_poison (%TokenInfo* %2)
  ret %Value* %61
}

define %Value* @func534 (%Value*) {
  %2 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 0
  %3 = load %Type*, %Type** %2
  %4 = load %Type*, %Type** @typeNumeric
  %5 = call i1 (%Type*, %Type*) @func445 (%Type* %3, %Type* %4)
  br label %select_1_0
select_1_0:
  %6 = icmp eq i1 %5, 1
  br i1 %6, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %7 = load %Type*, %Type** @typeBaseInt
  %8 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 1
  %9 = load %union.9, %union.9* %8
  %10 = alloca %union.9
  store %union.9 %9, %union.9* %10, align 128
  %11 = getelementptr inbounds %union.9, %union.9* %10, i1 0, i32 1
  %12 = bitcast [72 x %Nat8]* %11 to %ValueImm*
  %13 = load %ValueImm, %ValueImm* %12
  %14 = extractvalue %ValueImm %13, 1
  %15 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 3
  %16 = load %TokenInfo*, %TokenInfo** %15
  %17 = call %Value* (%Type*, %Int64, %TokenInfo*) @func457 (%Type* %7, %Int64 %14, %TokenInfo* %16)
  br label %select_1_end
select_1_1:
  br label %select_1_end
select_1_end:
  %18 = phi %Value* [ %17, %select_1_0_ok ], [ %0, %select_1_1 ]
  ret %Value* %18
}

define i1 @func536 (%Unit*, %Unit*, %Nat32) {
  %4 = bitcast %Unit* %0 to %Decl*
  %5 = bitcast %Unit* %1 to %Type*
  %6 = getelementptr inbounds %Decl, %Decl* %4, i1 0, i32 0
  %7 = load %AstId*, %AstId** %6
  %8 = getelementptr inbounds %AstId, %AstId* %7, i1 0, i32 0
  %9 = load %Str, %Str* %8
  %10 = call %Decl* (%Type*, %Str) @func401 (%Type* %5, %Str %9); loadImmPtr
  %11 = inttoptr i64 0 to%Decl*
  %12 = icmp eq %Decl* %10, %11
  br i1 %12, label %then_0, label %else_0
then_0:
  ret i1 1
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %14 = getelementptr inbounds %Decl, %Decl* %4, i1 0, i32 1
  %15 = load %Type*, %Type** %14
  %16 = getelementptr inbounds %Decl, %Decl* %10, i1 0, i32 1
  %17 = load %Type*, %Type** %16
  %18 = call i1 (%Type*, %Type*) @func445 (%Type* %15, %Type* %17)
  %19 = xor i1 %18, 1
  br i1 %19, label %then_1, label %else_1
then_1:
  %20 = getelementptr inbounds %Decl, %Decl* %4, i1 0, i32 1
  %21 = load %Type*, %Type** %20
  %22 = call i1 (%Type*) @type_is_generic_num (%Type* %21)
  %23 = getelementptr inbounds %Decl, %Decl* %10, i1 0, i32 1
  %24 = load %Type*, %Type** %23
  %25 = call i1 (%Type*) @func408 (%Type* %24)
  %26 = and i1 %22, %25
  br i1 %26, label %then_2, label %else_2
then_2:
  ret i1 0
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
  %28 = getelementptr inbounds %Decl, %Decl* %4, i1 0, i32 1
  %29 = load %Type*, %Type** %28
  %30 = getelementptr inbounds %Type, %Type* %29, i1 0, i32 0
  %31 = load %TypeKind, %TypeKind* %30
  %32 = icmp eq %TypeKind %31, 3
  %33 = getelementptr inbounds %Decl, %Decl* %10, i1 0, i32 1
  %34 = load %Type*, %Type** %33
  %35 = call i1 (%Type*) @func403 (%Type* %34)
  %36 = and i1 %32, %35
  br i1 %36, label %then_3, label %else_3
then_3:
  ret i1 0
  br label %endif_3
else_3:
  br label %endif_3
endif_3:
  %38 = getelementptr inbounds %Decl, %Decl* %10, i1 0, i32 1
  %39 = load %Type*, %Type** %38
  %40 = getelementptr inbounds %Type, %Type* %39, i1 0, i32 0
  %41 = load %TypeKind, %TypeKind* %40
  %42 = icmp eq %TypeKind %41, 16
  br i1 %42, label %then_4, label %else_4
then_4:
  %43 = getelementptr inbounds %Decl, %Decl* %10, i1 0, i32 1
  %44 = load %Type*, %Type** %43
  %45 = getelementptr inbounds %Type, %Type* %44, i1 0, i32 14
  %46 = getelementptr inbounds %TypeUnion, %TypeUnion* %45, i1 0, i32 0
  %47 = call i1 (%List*, %Type*) @func140 (%List* %46, %Type* %5)
  %48 = xor i1 %47, 1
  ret i1 %48
  br label %endif_4
else_4:
  br label %endif_4
endif_4:
  %50 = getelementptr inbounds %Decl, %Decl* %4, i1 0, i32 1
  %51 = load %Type*, %Type** %50
  %52 = getelementptr inbounds %Type, %Type* %51, i1 0, i32 0
  %53 = load %TypeKind, %TypeKind* %52
  %54 = icmp eq %TypeKind %53, 4
  br i1 %54, label %then_5, label %else_5
then_5:
  %55 = getelementptr inbounds %Decl, %Decl* %4, i1 0, i32 1
  %56 = load %Type*, %Type** %55
  %57 = getelementptr inbounds %Decl, %Decl* %10, i1 0, i32 1
  %58 = load %Type*, %Type** %57
  %59 = call i1 (%Type*, %Type*) @func535 (%Type* %56, %Type* %58)
  %60 = xor i1 %59, 1
  ret i1 %60
  br label %endif_5
else_5:
  br label %endif_5
endif_5:
  ret i1 1
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  ret i1 0
}

define i1 @func535 (%Type*, %Type*) {
  %3 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 0
  %4 = load %TypeKind, %TypeKind* %3
  %5 = icmp ne %TypeKind %4, 12
  br i1 %5, label %then_0, label %else_0
then_0:
  ret i1 0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %7 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 11
  %8 = getelementptr inbounds %TypeRecord, %TypeRecord* %7, i1 0, i32 0
  %9 = load %List*, %List** %8
  %10 = getelementptr inbounds %List, %List* %9, i1 0, i32 2
  %11 = load %Nat64, %Nat64* %10
  %12 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 11
  %13 = getelementptr inbounds %TypeRecord, %TypeRecord* %12, i1 0, i32 0
  %14 = load %List*, %List** %13
  %15 = getelementptr inbounds %List, %List* %14, i1 0, i32 2
  %16 = load %Nat64, %Nat64* %15
  %17 = icmp ugt %Nat64 %11, %16
  br i1 %17, label %then_1, label %else_1
then_1:
  ret i1 0
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  %19 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 11
  %20 = getelementptr inbounds %TypeRecord, %TypeRecord* %19, i1 0, i32 0
  %21 = load %List*, %List** %20
  %22 = bitcast %Type* %1 to %Unit*
  %23 = call %Unit* (%List*, %ListSearchHandler, %Unit*) @list_search (%List* %21, %ListSearchHandler @func536, %Unit* %22); loadImmPtr
  %24 = inttoptr i64 0 to%Unit*
  %25 = icmp eq %Unit* %23, %24
  ret i1 %25
}

define %Value* @func537 (%Value*, %Type*) {
  %3 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 0
  %4 = load %Type*, %Type** %3; loadImmPtr
  %5 = inttoptr i64 0 to%Type*
  %6 = icmp ne %Type* %4, %5
  %7 = bitcast [29 x %Nat8]* @func537_str1 to %Str
  call void (i1, %Str) @assert (i1 %6, %Str %7); loadImmPtr
  %8 = inttoptr i64 0 to%Type*
  %9 = icmp ne %Type* %1, %8
  %10 = bitcast [24 x %Nat8]* @func537_str2 to %Str
  call void (i1, %Str) @assert (i1 %9, %Str %10)
  %11 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 1
  %12 = load %union.9, %union.9* %11
  %13 = extractvalue %union.9 %12, 0
  %14 = bitcast %Int16 40 to %Int16
  %15 = icmp eq %Int16 %13, %14
  br i1 %15, label %then_0, label %else_0
then_0:
  ret %Value* %0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %17 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 0
  %18 = load %TypeKind, %TypeKind* %17
  %19 = icmp eq %TypeKind %18, 2
  br i1 %19, label %then_1, label %else_1
then_1:
  br label %fail
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  %21 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 0
  %22 = load %Type*, %Type** %21
  %23 = getelementptr inbounds %Type, %Type* %22, i1 0, i32 0
  %24 = load %TypeKind, %TypeKind* %23
  %25 = icmp eq %TypeKind %24, 3
  %26 = call i1 (%Type*) @func403 (%Type* %1)
  %27 = and i1 %25, %26
  br i1 %27, label %then_2, label %else_2
then_2:
  %28 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 3
  %29 = load %TokenInfo*, %TokenInfo** %28
  %30 = call %Value* (%Value*, %Type*, %TokenInfo*) @do_value_cast_ref (%Value* %0, %Type* %1, %TokenInfo* %29)
  ret %Value* %30
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
  %32 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 1
  %33 = load %union.9, %union.9* %32
  %34 = extractvalue %union.9 %33, 0
  %35 = bitcast %Int16 36 to %Int16
  %36 = icmp eq %Int16 %34, %35
  br i1 %36, label %then_3, label %else_3
then_3:
  %37 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 0
  %38 = load %Type*, %Type** %37
  %39 = call i1 (%Type*, %Type*) @func535 (%Type* %38, %Type* %1)
  %40 = xor i1 %39, 1
  br i1 %40, label %then_4, label %else_4
then_4:
  ret %Value* %0
  br label %endif_4
else_4:
  br label %endif_4
endif_4:
  %42 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 3
  %43 = load %TokenInfo*, %TokenInfo** %42
  %44 = call %Value* (%Value*, %Type*, %TokenInfo*) @do_value_cast_gen_rec (%Value* %0, %Type* %1, %TokenInfo* %43)
  ret %Value* %44
  br label %endif_3
else_3:
  br label %endif_3
endif_3:
  %46 = call i1 (%Value*) @is_value_imm_num (%Value* %0)
  br i1 %46, label %then_5, label %else_5
then_5:
  %47 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 0
  %48 = load %Type*, %Type** %47
  %49 = call i1 (%Type*) @type_is_generic_num (%Type* %48)
  %50 = call i1 (%Type*) @func408 (%Type* %1)
  %51 = and i1 %49, %50
  br i1 %51, label %then_6, label %else_6
then_6:
  %52 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 1
  %53 = load %union.9, %union.9* %52
  %54 = alloca %union.9
  store %union.9 %53, %union.9* %54, align 128
  %55 = getelementptr inbounds %union.9, %union.9* %54, i1 0, i32 1
  %56 = bitcast [72 x %Nat8]* %55 to %ValueImm*
  %57 = load %ValueImm, %ValueImm* %56
  %58 = extractvalue %ValueImm %57, 1
  %59 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 6
  %60 = getelementptr inbounds %TypeNumeric, %TypeNumeric* %59, i1 0, i32 0
  %61 = load %Nat32, %Nat32* %60
  %62 = zext %Nat32 %61 to %Nat128
  %63 = shl %Nat128 1, %62
  %64 = zext %Int64 %58 to %Nat128
  %65 = icmp ule %Nat128 %63, %64
  br i1 %65, label %then_7, label %else_7
then_7:
  %66 = bitcast [14 x %Nat8]* @func537_str3 to %Str
  %67 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 3
  %68 = load %TokenInfo*, %TokenInfo** %67
  call void (%Str, %TokenInfo*) @error (%Str %66, %TokenInfo* %68)
  br label %endif_7
else_7:
  br label %endif_7
endif_7:
  %69 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 3
  %70 = load %TokenInfo*, %TokenInfo** %69
  %71 = call %Value* (%Type*, %Int64, %TokenInfo*) @func457 (%Type* %1, %Int64 %58, %TokenInfo* %70)
  ret %Value* %71
  br label %endif_6
else_6:
  br label %endif_6
endif_6:
  br label %endif_5
else_5:
  br label %endif_5
endif_5:
  %73 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 0
  %74 = load %Type*, %Type** %73
  %75 = call i1 (%Type*, %Type*) @func538 (%Type* %74, %Type* %1)
  br i1 %75, label %then_8, label %else_8
then_8:
  %76 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 3
  %77 = load %TokenInfo*, %TokenInfo** %76
  %78 = call %Value* (%Value*, %Type*, %TokenInfo*) @func532 (%Value* %0, %Type* %1, %TokenInfo* %77)
  ret %Value* %78
  br label %endif_8
else_8:
  br label %endif_8
endif_8:
  ret %Value* %0
  br label %fail
fail:; loadImmPtr
  %81 = inttoptr i64 0 to%TokenInfo*
  %82 = call %Value* (%TokenInfo*) @value_new_poison (%TokenInfo* %81)
  ret %Value* %82
}

define i1 @func538 (%Type*, %Type*) {
  %3 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 0
  %4 = load %TypeKind, %TypeKind* %3
  %5 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 0
  %6 = load %TypeKind, %TypeKind* %5
  %7 = call i1 (%Type*) @type_is_generic_num (%Type* %0)
  %8 = call i1 (%Type*) @func408 (%Type* %1)
  %9 = and i1 %7, %8
  br i1 %9, label %then_0, label %else_0
then_0:
  ret i1 1
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %11 = icmp eq %TypeKind %4, 3
  br i1 %11, label %then_1, label %else_1
then_1:
  %12 = icmp eq %TypeKind %6, 13
  %13 = icmp eq %TypeKind %6, 15
  %14 = icmp eq %TypeKind %6, 10
  %15 = or i1 %13, %14
  %16 = or i1 %12, %15
  br i1 %16, label %then_2, label %else_2
then_2:
  ret i1 1
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  %18 = icmp eq %TypeKind %4, 13
  br i1 %18, label %then_3, label %else_3
then_3:
  %19 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 8
  %20 = getelementptr inbounds %TypePointer, %TypePointer* %19, i1 0, i32 0
  %21 = load %Type*, %Type** %20
  %22 = call i1 (%Type*) @func404 (%Type* %21)
  br i1 %22, label %then_4, label %else_4
then_4:
  %23 = call i1 (%Type*) @func406 (%Type* %1)
  br i1 %23, label %then_5, label %else_5
then_5:
  ret i1 1
  br label %endif_5
else_5:
  br label %endif_5
endif_5:
  br label %endif_4
else_4:
  br label %endif_4
endif_4:
  %25 = icmp eq %TypeKind %6, 13
  br i1 %25, label %then_6, label %else_6
then_6:
  %26 = load %Type*, %Type** @typeFreePtr
  %27 = call i1 (%Type*, %Type*) @func445 (%Type* %0, %Type* %26)
  br i1 %27, label %then_7, label %else_7
then_7:
  ret i1 1
  br label %endif_7
else_7:
  br label %endif_7
endif_7:
  %29 = load %Type*, %Type** @typeFreePtr
  %30 = call i1 (%Type*, %Type*) @func445 (%Type* %1, %Type* %29)
  br i1 %30, label %then_8, label %else_8
then_8:
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
  %32 = icmp eq %TypeKind %6, 16
  br i1 %32, label %then_9, label %else_9
then_9:
  %33 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 14
  %34 = getelementptr inbounds %TypeUnion, %TypeUnion* %33, i1 0, i32 0
  %35 = call i1 (%List*, %Type*) @func140 (%List* %34, %Type* %0)
  ret i1 %35
  br label %endif_9
else_9:
  br label %endif_9
endif_9:
  ret i1 0
}

define i1 @func539 (%Value*) {
  %2 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 0
  %3 = load %Type*, %Type** %2
  %4 = getelementptr inbounds %Type, %Type* %3, i1 0, i32 0
  %5 = load %TypeKind, %TypeKind* %4
  %6 = icmp eq %TypeKind %5, 8
  br i1 %6, label %then_0, label %else_0
then_0:
  ret i1 0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %8 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 1
  %9 = load %union.9, %union.9* %8
  %10 = extractvalue %union.9 %9, 0
  %11 = bitcast %Int16 8 to %Int16
  %12 = icmp eq %Int16 %10, %11
  br i1 %12, label %then_1, label %else_1
then_1:
  %13 = alloca %union.9
  store %union.9 %9, %union.9* %13, align 128
  %14 = getelementptr inbounds %union.9, %union.9* %13, i1 0, i32 1
  %15 = bitcast [72 x %Nat8]* %14 to %ValueIndex*
  %16 = load %ValueIndex, %ValueIndex* %15
  %17 = extractvalue %ValueIndex %16, 1
  %18 = getelementptr inbounds %Value, %Value* %17, i1 0, i32 0
  %19 = load %Type*, %Type** %18
  %20 = call i1 (%Type*) @func404 (%Type* %19)
  %21 = extractvalue %ValueIndex %16, 1
  %22 = call i1 (%Value*) @func539 (%Value* %21)
  %23 = and i1 %22, %20
  ret i1 %23
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  %25 = extractvalue %union.9 %9, 0
  %26 = bitcast %Int16 7 to %Int16
  %27 = icmp eq %Int16 %25, %26
  br i1 %27, label %then_2, label %else_2
then_2:
  %28 = alloca %union.9
  store %union.9 %9, %union.9* %28, align 128
  %29 = getelementptr inbounds %union.9, %union.9* %28, i1 0, i32 1
  %30 = bitcast [72 x %Nat8]* %29 to %ValueAccess*
  %31 = load %ValueAccess, %ValueAccess* %30
  %32 = extractvalue %ValueAccess %31, 1
  %33 = call i1 (%Value*) @func539 (%Value* %32)
  %34 = extractvalue %ValueAccess %31, 1
  %35 = getelementptr inbounds %Value, %Value* %34, i1 0, i32 0
  %36 = load %Type*, %Type** %35
  %37 = getelementptr inbounds %Type, %Type* %36, i1 0, i32 0
  %38 = load %TypeKind, %TypeKind* %37
  %39 = icmp ne %TypeKind %38, 13
  %40 = and i1 %33, %39
  ret i1 %40
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
  %42 = extractvalue %union.9 %9, 0
  %43 = bitcast %Int16 33 to %Int16
  %44 = icmp eq %Int16 %42, %43
  %45 = extractvalue %union.9 %9, 0
  %46 = bitcast %Int16 38 to %Int16
  %47 = icmp eq %Int16 %45, %46
  %48 = extractvalue %union.9 %9, 0
  %49 = bitcast %Int16 30 to %Int16
  %50 = icmp eq %Int16 %48, %49
  %51 = extractvalue %union.9 %9, 0
  %52 = bitcast %Int16 32 to %Int16
  %53 = icmp eq %Int16 %51, %52
  %54 = or i1 %50, %53
  %55 = or i1 %47, %54
  %56 = or i1 %44, %55
  ret i1 %56
}

define void @func540 () {
  %1 = load %Type*, %Type** @typeBool; loadImmPtr
  %2 = inttoptr i64 0 to%TokenInfo*
  %3 = call %Value* (%Type*, %Int64, %TokenInfo*) @func457 (%Type* %1, %Int64 0, %TokenInfo* %2)
  %4 = bitcast [6 x %Nat8]* @func540_str1 to %Str
  call void (%Str, %Value*) @valbind (%Str %4, %Value* %3)
  %5 = load %Type*, %Type** @typeBool; loadImmPtr
  %6 = inttoptr i64 0 to%TokenInfo*
  %7 = call %Value* (%Type*, %Int64, %TokenInfo*) @func457 (%Type* %5, %Int64 1, %TokenInfo* %6)
  %8 = bitcast [5 x %Nat8]* @func540_str2 to %Str
  call void (%Str, %Value*) @valbind (%Str %8, %Value* %7); loadImmPtr
  %9 = inttoptr i64 0 to%TokenInfo*
  %10 = insertvalue %TypeGenericReference zeroinitializer, %TokenInfo* %9, 0
  %11 = alloca %union.8
; write variant 13
  %12 = getelementptr inbounds %union.8, %union.8* %11, i1 0, i32 0
  store %Int16 13, %Int16* %12, align 2
; write data
  %13 = getelementptr inbounds %union.8, %union.8* %11, i1 0, i32 1
  %14 = bitcast [56 x %Nat8]* %13 to %TypeGenericReference*
  store %TypeGenericReference %10, %TypeGenericReference* %14, align 8
  %15 = load %union.8, %union.8* %11; loadImmPtr
  %16 = inttoptr i64 0 to%TokenInfo*
  %17 = call %Type* (%TypeKind, %union.8, %Nat32, %TokenInfo*) @func393 (%TypeKind 3, %union.8 %15, %Nat32 8, %TokenInfo* %16); loadImmPtr
  %18 = inttoptr i64 0 to%TokenInfo*
  %19 = call %Value* (%Type*, %Int64, %TokenInfo*) @func457 (%Type* %17, %Int64 0, %TokenInfo* %18)
  %20 = bitcast [4 x %Nat8]* @func540_str3 to %Str
  call void (%Str, %Value*) @valbind (%Str %20, %Value* %19)
  %21 = load %Type*, %Type** @typeUnit; loadImmPtr
  %22 = inttoptr i64 0 to%TokenInfo*
  %23 = call %Value* (%Type*, %Int64, %TokenInfo*) @func457 (%Type* %21, %Int64 0, %TokenInfo* %22)
  %24 = bitcast [5 x %Nat8]* @func540_str4 to %Str
  call void (%Str, %Value*) @valbind (%Str %24, %Value* %23)
  ret void
}

define %Type* @func541 (%Value) {
  %2 = extractvalue %Value %0, 1
  %3 = extractvalue %union.9 %2, 0
  br label %select_1_0
select_1_0:
  %4 = bitcast %Int16 38 to %Int16
  %5 = icmp eq %Int16 %3, %4
  br i1 %5, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %6 = alloca %union.9
  store %union.9 %2, %union.9* %6, align 128
  %7 = getelementptr inbounds %union.9, %union.9* %6, i1 0, i32 1
  %8 = bitcast [72 x %Nat8]* %7 to %ValueImm*
  %9 = load %ValueImm, %ValueImm* %8
  %10 = extractvalue %ValueImm %9, 0
  br label %select_1_end
select_1_1:
  %11 = bitcast %Int16 33 to %Int16
  %12 = icmp eq %Int16 %3, %11
  br i1 %12, label %select_1_1_ok, label %select_1_2
select_1_1_ok:
  %13 = alloca %union.9
  store %union.9 %2, %union.9* %13, align 128
  %14 = getelementptr inbounds %union.9, %union.9* %13, i1 0, i32 1
  %15 = bitcast [72 x %Nat8]* %14 to %ValueGlobalConst*
  %16 = load %ValueGlobalConst, %ValueGlobalConst* %15
  %17 = extractvalue %ValueGlobalConst %16, 0
  br label %select_1_end
select_1_2:
  %18 = bitcast %Int16 34 to %Int16
  %19 = icmp eq %Int16 %3, %18
  br i1 %19, label %select_1_2_ok, label %select_1_3
select_1_2_ok:
  %20 = alloca %union.9
  store %union.9 %2, %union.9* %20, align 128
  %21 = getelementptr inbounds %union.9, %union.9* %20, i1 0, i32 1
  %22 = bitcast [72 x %Nat8]* %21 to %ValueGlobalVar*
  %23 = load %ValueGlobalVar, %ValueGlobalVar* %22
  %24 = extractvalue %ValueGlobalVar %23, 0
  br label %select_1_end
select_1_3:
  %25 = bitcast %Int16 30 to %Int16
  %26 = icmp eq %Int16 %3, %25
  br i1 %26, label %select_1_3_ok, label %select_1_4
select_1_3_ok:
  %27 = alloca %union.9
  store %union.9 %2, %union.9* %27, align 128
  %28 = getelementptr inbounds %union.9, %union.9* %27, i1 0, i32 1
  %29 = bitcast [72 x %Nat8]* %28 to %ValueLocalVal*
  %30 = load %ValueLocalVal, %ValueLocalVal* %29
  %31 = extractvalue %ValueLocalVal %30, 0
  br label %select_1_end
select_1_4:
  %32 = bitcast %Int16 31 to %Int16
  %33 = icmp eq %Int16 %3, %32
  br i1 %33, label %select_1_4_ok, label %select_1_5
select_1_4_ok:
  %34 = alloca %union.9
  store %union.9 %2, %union.9* %34, align 128
  %35 = getelementptr inbounds %union.9, %union.9* %34, i1 0, i32 1
  %36 = bitcast [72 x %Nat8]* %35 to %ValueLocalVar*
  %37 = load %ValueLocalVar, %ValueLocalVar* %36
  %38 = extractvalue %ValueLocalVar %37, 0
  br label %select_1_end
select_1_5:
  %39 = bitcast %Int16 32 to %Int16
  %40 = icmp eq %Int16 %3, %39
  br i1 %40, label %select_1_5_ok, label %select_1_6
select_1_5_ok:
  %41 = alloca %union.9
  store %union.9 %2, %union.9* %41, align 128
  %42 = getelementptr inbounds %union.9, %union.9* %41, i1 0, i32 1
  %43 = bitcast [72 x %Nat8]* %42 to %ValueParam*
  %44 = load %ValueParam, %ValueParam* %43
  %45 = extractvalue %ValueParam %44, 0
  br label %select_1_end
select_1_6:
  %46 = bitcast %Int16 24 to %Int16
  %47 = icmp eq %Int16 %3, %46
  br i1 %47, label %select_1_6_ok, label %select_1_7
select_1_6_ok:
  %48 = alloca %union.9
  store %union.9 %2, %union.9* %48, align 128
  %49 = getelementptr inbounds %union.9, %union.9* %48, i1 0, i32 1
  %50 = bitcast [72 x %Nat8]* %49 to %ValueBin*
  %51 = load %ValueBin, %ValueBin* %50
  %52 = extractvalue %ValueBin %51, 0
  br label %select_1_end
select_1_7:
  %53 = bitcast %Int16 23 to %Int16
  %54 = icmp eq %Int16 %3, %53
  br i1 %54, label %select_1_7_ok, label %select_1_8
select_1_7_ok:
  %55 = alloca %union.9
  store %union.9 %2, %union.9* %55, align 128
  %56 = getelementptr inbounds %union.9, %union.9* %55, i1 0, i32 1
  %57 = bitcast [72 x %Nat8]* %56 to %ValueBin*
  %58 = load %ValueBin, %ValueBin* %57
  %59 = extractvalue %ValueBin %58, 0
  br label %select_1_end
select_1_8:
  %60 = bitcast %Int16 22 to %Int16
  %61 = icmp eq %Int16 %3, %60
  br i1 %61, label %select_1_8_ok, label %select_1_9
select_1_8_ok:
  %62 = alloca %union.9
  store %union.9 %2, %union.9* %62, align 128
  %63 = getelementptr inbounds %union.9, %union.9* %62, i1 0, i32 1
  %64 = bitcast [72 x %Nat8]* %63 to %ValueBin*
  %65 = load %ValueBin, %ValueBin* %64
  %66 = extractvalue %ValueBin %65, 0
  br label %select_1_end
select_1_9:
  %67 = bitcast %Int16 21 to %Int16
  %68 = icmp eq %Int16 %3, %67
  br i1 %68, label %select_1_9_ok, label %select_1_10
select_1_9_ok:
  %69 = alloca %union.9
  store %union.9 %2, %union.9* %69, align 128
  %70 = getelementptr inbounds %union.9, %union.9* %69, i1 0, i32 1
  %71 = bitcast [72 x %Nat8]* %70 to %ValueBin*
  %72 = load %ValueBin, %ValueBin* %71
  %73 = extractvalue %ValueBin %72, 0
  br label %select_1_end
select_1_10:
  %74 = bitcast %Int16 20 to %Int16
  %75 = icmp eq %Int16 %3, %74
  br i1 %75, label %select_1_10_ok, label %select_1_11
select_1_10_ok:
  %76 = alloca %union.9
  store %union.9 %2, %union.9* %76, align 128
  %77 = getelementptr inbounds %union.9, %union.9* %76, i1 0, i32 1
  %78 = bitcast [72 x %Nat8]* %77 to %ValueBin*
  %79 = load %ValueBin, %ValueBin* %78
  %80 = extractvalue %ValueBin %79, 0
  br label %select_1_end
select_1_11:
  %81 = bitcast %Int16 17 to %Int16
  %82 = icmp eq %Int16 %3, %81
  br i1 %82, label %select_1_11_ok, label %select_1_12
select_1_11_ok:
  %83 = alloca %union.9
  store %union.9 %2, %union.9* %83, align 128
  %84 = getelementptr inbounds %union.9, %union.9* %83, i1 0, i32 1
  %85 = bitcast [72 x %Nat8]* %84 to %ValueBin*
  %86 = load %ValueBin, %ValueBin* %85
  %87 = extractvalue %ValueBin %86, 0
  br label %select_1_end
select_1_12:
  %88 = bitcast %Int16 19 to %Int16
  %89 = icmp eq %Int16 %3, %88
  br i1 %89, label %select_1_12_ok, label %select_1_13
select_1_12_ok:
  %90 = alloca %union.9
  store %union.9 %2, %union.9* %90, align 128
  %91 = getelementptr inbounds %union.9, %union.9* %90, i1 0, i32 1
  %92 = bitcast [72 x %Nat8]* %91 to %ValueBin*
  %93 = load %ValueBin, %ValueBin* %92
  %94 = extractvalue %ValueBin %93, 0
  br label %select_1_end
select_1_13:
  %95 = bitcast %Int16 18 to %Int16
  %96 = icmp eq %Int16 %3, %95
  br i1 %96, label %select_1_13_ok, label %select_1_14
select_1_13_ok:
  %97 = alloca %union.9
  store %union.9 %2, %union.9* %97, align 128
  %98 = getelementptr inbounds %union.9, %union.9* %97, i1 0, i32 1
  %99 = bitcast [72 x %Nat8]* %98 to %ValueBin*
  %100 = load %ValueBin, %ValueBin* %99
  %101 = extractvalue %ValueBin %100, 0
  br label %select_1_end
select_1_14:
  %102 = bitcast %Int16 16 to %Int16
  %103 = icmp eq %Int16 %3, %102
  br i1 %103, label %select_1_14_ok, label %select_1_15
select_1_14_ok:
  %104 = alloca %union.9
  store %union.9 %2, %union.9* %104, align 128
  %105 = getelementptr inbounds %union.9, %union.9* %104, i1 0, i32 1
  %106 = bitcast [72 x %Nat8]* %105 to %ValueBin*
  %107 = load %ValueBin, %ValueBin* %106
  %108 = extractvalue %ValueBin %107, 0
  br label %select_1_end
select_1_15:
  %109 = bitcast %Int16 15 to %Int16
  %110 = icmp eq %Int16 %3, %109
  br i1 %110, label %select_1_15_ok, label %select_1_16
select_1_15_ok:
  %111 = alloca %union.9
  store %union.9 %2, %union.9* %111, align 128
  %112 = getelementptr inbounds %union.9, %union.9* %111, i1 0, i32 1
  %113 = bitcast [72 x %Nat8]* %112 to %ValueBin*
  %114 = load %ValueBin, %ValueBin* %113
  %115 = extractvalue %ValueBin %114, 0
  br label %select_1_end
select_1_16:
  %116 = bitcast %Int16 14 to %Int16
  %117 = icmp eq %Int16 %3, %116
  br i1 %117, label %select_1_16_ok, label %select_1_17
select_1_16_ok:
  %118 = alloca %union.9
  store %union.9 %2, %union.9* %118, align 128
  %119 = getelementptr inbounds %union.9, %union.9* %118, i1 0, i32 1
  %120 = bitcast [72 x %Nat8]* %119 to %ValueBin*
  %121 = load %ValueBin, %ValueBin* %120
  %122 = extractvalue %ValueBin %121, 0
  br label %select_1_end
select_1_17:
  %123 = bitcast %Int16 13 to %Int16
  %124 = icmp eq %Int16 %3, %123
  br i1 %124, label %select_1_17_ok, label %select_1_18
select_1_17_ok:
  %125 = alloca %union.9
  store %union.9 %2, %union.9* %125, align 128
  %126 = getelementptr inbounds %union.9, %union.9* %125, i1 0, i32 1
  %127 = bitcast [72 x %Nat8]* %126 to %ValueBin*
  %128 = load %ValueBin, %ValueBin* %127
  %129 = extractvalue %ValueBin %128, 0
  br label %select_1_end
select_1_18:
  %130 = bitcast %Int16 12 to %Int16
  %131 = icmp eq %Int16 %3, %130
  br i1 %131, label %select_1_18_ok, label %select_1_19
select_1_18_ok:
  %132 = alloca %union.9
  store %union.9 %2, %union.9* %132, align 128
  %133 = getelementptr inbounds %union.9, %union.9* %132, i1 0, i32 1
  %134 = bitcast [72 x %Nat8]* %133 to %ValueBin*
  %135 = load %ValueBin, %ValueBin* %134
  %136 = extractvalue %ValueBin %135, 0
  br label %select_1_end
select_1_19:
  %137 = bitcast %Int16 11 to %Int16
  %138 = icmp eq %Int16 %3, %137
  br i1 %138, label %select_1_19_ok, label %select_1_20
select_1_19_ok:
  %139 = alloca %union.9
  store %union.9 %2, %union.9* %139, align 128
  %140 = getelementptr inbounds %union.9, %union.9* %139, i1 0, i32 1
  %141 = bitcast [72 x %Nat8]* %140 to %ValueBin*
  %142 = load %ValueBin, %ValueBin* %141
  %143 = extractvalue %ValueBin %142, 0
  br label %select_1_end
select_1_20:
  %144 = bitcast %Int16 10 to %Int16
  %145 = icmp eq %Int16 %3, %144
  br i1 %145, label %select_1_20_ok, label %select_1_21
select_1_20_ok:
  %146 = alloca %union.9
  store %union.9 %2, %union.9* %146, align 128
  %147 = getelementptr inbounds %union.9, %union.9* %146, i1 0, i32 1
  %148 = bitcast [72 x %Nat8]* %147 to %ValueBin*
  %149 = load %ValueBin, %ValueBin* %148
  %150 = extractvalue %ValueBin %149, 0
  br label %select_1_end
select_1_21:
  %151 = bitcast %Int16 9 to %Int16
  %152 = icmp eq %Int16 %3, %151
  br i1 %152, label %select_1_21_ok, label %select_1_22
select_1_21_ok:
  %153 = alloca %union.9
  store %union.9 %2, %union.9* %153, align 128
  %154 = getelementptr inbounds %union.9, %union.9* %153, i1 0, i32 1
  %155 = bitcast [72 x %Nat8]* %154 to %ValueBin*
  %156 = load %ValueBin, %ValueBin* %155
  %157 = extractvalue %ValueBin %156, 0
  br label %select_1_end
select_1_22:
  %158 = bitcast %Int16 2 to %Int16
  %159 = icmp eq %Int16 %3, %158
  br i1 %159, label %select_1_22_ok, label %select_1_23
select_1_22_ok:
  %160 = alloca %union.9
  store %union.9 %2, %union.9* %160, align 128
  %161 = getelementptr inbounds %union.9, %union.9* %160, i1 0, i32 1
  %162 = bitcast [72 x %Nat8]* %161 to %ValueCall*
  %163 = load %ValueCall, %ValueCall* %162
  %164 = extractvalue %ValueCall %163, 0
  br label %select_1_end
select_1_23:
  %165 = bitcast %Int16 8 to %Int16
  %166 = icmp eq %Int16 %3, %165
  br i1 %166, label %select_1_23_ok, label %select_1_24
select_1_23_ok:
  %167 = alloca %union.9
  store %union.9 %2, %union.9* %167, align 128
  %168 = getelementptr inbounds %union.9, %union.9* %167, i1 0, i32 1
  %169 = bitcast [72 x %Nat8]* %168 to %ValueIndex*
  %170 = load %ValueIndex, %ValueIndex* %169
  %171 = extractvalue %ValueIndex %170, 0
  br label %select_1_end
select_1_24:
  %172 = bitcast %Int16 7 to %Int16
  %173 = icmp eq %Int16 %3, %172
  br i1 %173, label %select_1_24_ok, label %select_1_25
select_1_24_ok:
  %174 = alloca %union.9
  store %union.9 %2, %union.9* %174, align 128
  %175 = getelementptr inbounds %union.9, %union.9* %174, i1 0, i32 1
  %176 = bitcast [72 x %Nat8]* %175 to %ValueAccess*
  %177 = load %ValueAccess, %ValueAccess* %176
  %178 = extractvalue %ValueAccess %177, 0
  br label %select_1_end
select_1_25:
  %179 = bitcast %Int16 29 to %Int16
  %180 = icmp eq %Int16 %3, %179
  br i1 %180, label %select_1_25_ok, label %select_1_26
select_1_25_ok:
  %181 = alloca %union.9
  store %union.9 %2, %union.9* %181, align 128
  %182 = getelementptr inbounds %union.9, %union.9* %181, i1 0, i32 1
  %183 = bitcast [72 x %Nat8]* %182 to %ValueUn*
  %184 = load %ValueUn, %ValueUn* %183
  %185 = extractvalue %ValueUn %184, 0
  br label %select_1_end
select_1_26:
  %186 = bitcast %Int16 28 to %Int16
  %187 = icmp eq %Int16 %3, %186
  br i1 %187, label %select_1_26_ok, label %select_1_27
select_1_26_ok:
  %188 = alloca %union.9
  store %union.9 %2, %union.9* %188, align 128
  %189 = getelementptr inbounds %union.9, %union.9* %188, i1 0, i32 1
  %190 = bitcast [72 x %Nat8]* %189 to %ValueUn*
  %191 = load %ValueUn, %ValueUn* %190
  %192 = extractvalue %ValueUn %191, 0
  br label %select_1_end
select_1_27:
  %193 = bitcast %Int16 26 to %Int16
  %194 = icmp eq %Int16 %3, %193
  br i1 %194, label %select_1_27_ok, label %select_1_28
select_1_27_ok:
  %195 = alloca %union.9
  store %union.9 %2, %union.9* %195, align 128
  %196 = getelementptr inbounds %union.9, %union.9* %195, i1 0, i32 1
  %197 = bitcast [72 x %Nat8]* %196 to %ValueUn*
  %198 = load %ValueUn, %ValueUn* %197
  %199 = extractvalue %ValueUn %198, 0
  br label %select_1_end
select_1_28:
  %200 = bitcast %Int16 25 to %Int16
  %201 = icmp eq %Int16 %3, %200
  br i1 %201, label %select_1_28_ok, label %select_1_29
select_1_28_ok:
  %202 = alloca %union.9
  store %union.9 %2, %union.9* %202, align 128
  %203 = getelementptr inbounds %union.9, %union.9* %202, i1 0, i32 1
  %204 = bitcast [72 x %Nat8]* %203 to %ValueUn*
  %205 = load %ValueUn, %ValueUn* %204
  %206 = extractvalue %ValueUn %205, 0
  br label %select_1_end
select_1_29:
  %207 = bitcast %Int16 27 to %Int16
  %208 = icmp eq %Int16 %3, %207
  br i1 %208, label %select_1_29_ok, label %select_1_30
select_1_29_ok:
  %209 = alloca %union.9
  store %union.9 %2, %union.9* %209, align 128
  %210 = getelementptr inbounds %union.9, %union.9* %209, i1 0, i32 1
  %211 = bitcast [72 x %Nat8]* %210 to %ValueUn*
  %212 = load %ValueUn, %ValueUn* %211
  %213 = extractvalue %ValueUn %212, 0
  br label %select_1_end
select_1_30:
  %214 = bitcast %Int16 6 to %Int16
  %215 = icmp eq %Int16 %3, %214
  br i1 %215, label %select_1_30_ok, label %select_1_31
select_1_30_ok:
  %216 = alloca %union.9
  store %union.9 %2, %union.9* %216, align 128
  %217 = getelementptr inbounds %union.9, %union.9* %216, i1 0, i32 1
  %218 = bitcast [72 x %Nat8]* %217 to %ValueCast*
  %219 = load %ValueCast, %ValueCast* %218
  %220 = extractvalue %ValueCast %219, 0
  br label %select_1_end
select_1_31:
  %221 = bitcast %Int16 5 to %Int16
  %222 = icmp eq %Int16 %3, %221
  br i1 %222, label %select_1_31_ok, label %select_1_32
select_1_31_ok:
  %223 = alloca %union.9
  store %union.9 %2, %union.9* %223, align 128
  %224 = getelementptr inbounds %union.9, %union.9* %223, i1 0, i32 1
  %225 = bitcast [72 x %Nat8]* %224 to %ValueAs*
  %226 = load %ValueAs, %ValueAs* %225
  %227 = extractvalue %ValueAs %226, 0
  br label %select_1_end
select_1_32:
  %228 = bitcast %Int16 4 to %Int16
  %229 = icmp eq %Int16 %3, %228
  br i1 %229, label %select_1_32_ok, label %select_1_33
select_1_32_ok:
  %230 = alloca %union.9
  store %union.9 %2, %union.9* %230, align 128
  %231 = getelementptr inbounds %union.9, %union.9* %230, i1 0, i32 1
  %232 = bitcast [72 x %Nat8]* %231 to %ValueIs*
  %233 = load %ValueIs, %ValueIs* %232
  %234 = extractvalue %ValueIs %233, 0
  br label %select_1_end
select_1_33:
  %235 = bitcast %Int16 0 to %Int16
  %236 = icmp eq %Int16 %3, %235
  br i1 %236, label %select_1_33_ok, label %select_1_34
select_1_33_ok:
  %237 = alloca %union.9
  store %union.9 %2, %union.9* %237, align 128
  %238 = getelementptr inbounds %union.9, %union.9* %237, i1 0, i32 1
  %239 = bitcast [72 x %Nat8]* %238 to %ValueWhen*
  %240 = load %ValueWhen, %ValueWhen* %239
  %241 = extractvalue %ValueWhen %240, 0
  br label %select_1_end
select_1_34:
  %242 = bitcast %Int16 37 to %Int16
  %243 = icmp eq %Int16 %3, %242
  br i1 %243, label %select_1_34_ok, label %select_1_35
select_1_34_ok:
  %244 = alloca %union.9
  store %union.9 %2, %union.9* %244, align 128
  %245 = getelementptr inbounds %union.9, %union.9* %244, i1 0, i32 1
  %246 = bitcast [72 x %Nat8]* %245 to %ValueRecord*
  %247 = load %ValueRecord, %ValueRecord* %246
  %248 = extractvalue %ValueRecord %247, 0
  br label %select_1_end
select_1_35:
  %249 = bitcast %Int16 35 to %Int16
  %250 = icmp eq %Int16 %3, %249
  br i1 %250, label %select_1_35_ok, label %select_1_36
select_1_35_ok:
  %251 = alloca %union.9
  store %union.9 %2, %union.9* %251, align 128
  %252 = getelementptr inbounds %union.9, %union.9* %251, i1 0, i32 1
  %253 = bitcast [72 x %Nat8]* %252 to %ValueArray*
  %254 = load %ValueArray, %ValueArray* %253
  %255 = extractvalue %ValueArray %254, 0
  br label %select_1_end
select_1_36:
  %256 = extractvalue %Value %0, 3
  %257 = insertvalue %TypePoison zeroinitializer, %TokenInfo* %256, 0
  %258 = alloca %union.8
; write variant 15
  %259 = getelementptr inbounds %union.8, %union.8* %258, i1 0, i32 0
  store %Int16 15, %Int16* %259, align 2
; write data
  %260 = getelementptr inbounds %union.8, %union.8* %258, i1 0, i32 1
  %261 = bitcast [56 x %Nat8]* %260 to %TypePoison*
  store %TypePoison %257, %TypePoison* %261, align 8
  %262 = load %union.8, %union.8* %258; loadImmPtr
  %263 = inttoptr i64 0 to%TokenInfo*
  %264 = call %Type* (%TypeKind, %union.8, %Nat32, %TokenInfo*) @func393 (%TypeKind 2, %union.8 %262, %Nat32 0, %TokenInfo* %263)
  br label %select_1_end
select_1_end:
  %265 = phi %Type* [ %10, %select_1_0_ok ], [ %17, %select_1_1_ok ], [ %24, %select_1_2_ok ], [ %31, %select_1_3_ok ], [ %38, %select_1_4_ok ], [ %45, %select_1_5_ok ], [ %52, %select_1_6_ok ], [ %59, %select_1_7_ok ], [ %66, %select_1_8_ok ], [ %73, %select_1_9_ok ], [ %80, %select_1_10_ok ], [ %87, %select_1_11_ok ], [ %94, %select_1_12_ok ], [ %101, %select_1_13_ok ], [ %108, %select_1_14_ok ], [ %115, %select_1_15_ok ], [ %122, %select_1_16_ok ], [ %129, %select_1_17_ok ], [ %136, %select_1_18_ok ], [ %143, %select_1_19_ok ], [ %150, %select_1_20_ok ], [ %157, %select_1_21_ok ], [ %164, %select_1_22_ok ], [ %171, %select_1_23_ok ], [ %178, %select_1_24_ok ], [ %185, %select_1_25_ok ], [ %192, %select_1_26_ok ], [ %199, %select_1_27_ok ], [ %206, %select_1_28_ok ], [ %213, %select_1_29_ok ], [ %220, %select_1_30_ok ], [ %227, %select_1_31_ok ], [ %234, %select_1_32_ok ], [ %241, %select_1_33_ok ], [ %248, %select_1_34_ok ], [ %255, %select_1_35_ok ], [ %264, %select_1_36 ]
  ret %Type* %265
}

define %union.13* @stmt_new (%union.13) {
  %2 = call %Unit* (%Nat32) @malloc (%Nat32 128)
  %3 = bitcast %Unit* %2 to %union.13*; loadImmPtr
  %4 = inttoptr i64 0 to%union.13*
  %5 = icmp ne %union.13* %3, %4
  %6 = bitcast [9 x %Nat8]* @func542_str1 to %Str
  call void (i1, %Str) @assert (i1 %5, %Str %6)
  store %union.13 %0, %union.13* %3, align 128
  ret %union.13* %3
}

define %union.24 @func543 (%union.7*) {
  %2 = load %union.7, %union.7* %0
  %3 = extractvalue %union.7 %2, 0
  br label %select_1_0
select_1_0:
  %4 = bitcast %Int16 11 to %Int16
  %5 = icmp eq %Int16 %3, %4
  br i1 %5, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %6 = alloca %union.7
  store %union.7 %2, %union.7* %6, align 64
  %7 = getelementptr inbounds %union.7, %union.7* %6, i1 0, i32 1
  %8 = bitcast [48 x %Nat8]* %7 to %AstStmtAssign*
  %9 = load %AstStmtAssign, %AstStmtAssign* %8
  %10 = call %union.24 (%AstStmtAssign) @func544 (%AstStmtAssign %9)
  br label %select_1_end
select_1_1:
  %11 = bitcast %Int16 10 to %Int16
  %12 = icmp eq %Int16 %3, %11
  br i1 %12, label %select_1_1_ok, label %select_1_2
select_1_1_ok:
  %13 = alloca %union.7
  store %union.7 %2, %union.7* %13, align 64
  %14 = getelementptr inbounds %union.7, %union.7* %13, i1 0, i32 1
  %15 = bitcast [48 x %Nat8]* %14 to %AstStmtValueBind*
  %16 = load %AstStmtValueBind, %AstStmtValueBind* %15
  %17 = call %union.24 (%AstStmtValueBind) @func546 (%AstStmtValueBind %16)
  br label %select_1_end
select_1_2:
  %18 = bitcast %Int16 7 to %Int16
  %19 = icmp eq %Int16 %3, %18
  br i1 %19, label %select_1_2_ok, label %select_1_3
select_1_2_ok:
  %20 = alloca %union.7
  store %union.7 %2, %union.7* %20, align 64
  %21 = getelementptr inbounds %union.7, %union.7* %20, i1 0, i32 1
  %22 = bitcast [48 x %Nat8]* %21 to %AstStmtBlock*
  %23 = load %AstStmtBlock, %AstStmtBlock* %22
  %24 = call %union.24 (%AstStmtBlock) @func547 (%AstStmtBlock %23)
  br label %select_1_end
select_1_3:
  %25 = bitcast %Int16 8 to %Int16
  %26 = icmp eq %Int16 %3, %25
  br i1 %26, label %select_1_3_ok, label %select_1_4
select_1_3_ok:
  %27 = alloca %union.7
  store %union.7 %2, %union.7* %27, align 64
  %28 = getelementptr inbounds %union.7, %union.7* %27, i1 0, i32 1
  %29 = bitcast [48 x %Nat8]* %28 to %AstStmtExpr*
  %30 = load %AstStmtExpr, %AstStmtExpr* %29
  %31 = call %union.24 (%AstStmtExpr) @func549 (%AstStmtExpr %30)
  br label %select_1_end
select_1_4:
  %32 = bitcast %Int16 6 to %Int16
  %33 = icmp eq %Int16 %3, %32
  br i1 %33, label %select_1_4_ok, label %select_1_5
select_1_4_ok:
  %34 = alloca %union.7
  store %union.7 %2, %union.7* %34, align 64
  %35 = getelementptr inbounds %union.7, %union.7* %34, i1 0, i32 1
  %36 = bitcast [48 x %Nat8]* %35 to %AstStmtIf*
  %37 = load %AstStmtIf, %AstStmtIf* %36
  %38 = call %union.24 (%AstStmtIf) @func550 (%AstStmtIf %37)
  br label %select_1_end
select_1_5:
  %39 = bitcast %Int16 5 to %Int16
  %40 = icmp eq %Int16 %3, %39
  br i1 %40, label %select_1_5_ok, label %select_1_6
select_1_5_ok:
  %41 = alloca %union.7
  store %union.7 %2, %union.7* %41, align 64
  %42 = getelementptr inbounds %union.7, %union.7* %41, i1 0, i32 1
  %43 = bitcast [48 x %Nat8]* %42 to %AstStmtWhile*
  %44 = load %AstStmtWhile, %AstStmtWhile* %43
  %45 = call %union.24 (%AstStmtWhile) @func551 (%AstStmtWhile %44)
  br label %select_1_end
select_1_6:
  %46 = bitcast %Int16 4 to %Int16
  %47 = icmp eq %Int16 %3, %46
  br i1 %47, label %select_1_6_ok, label %select_1_7
select_1_6_ok:
  %48 = alloca %union.7
  store %union.7 %2, %union.7* %48, align 64
  %49 = getelementptr inbounds %union.7, %union.7* %48, i1 0, i32 1
  %50 = bitcast [48 x %Nat8]* %49 to %AstStmtReturn*
  %51 = load %AstStmtReturn, %AstStmtReturn* %50
  %52 = call %union.24 (%AstStmtReturn) @func552 (%AstStmtReturn %51)
  br label %select_1_end
select_1_7:
  %53 = bitcast %Int16 9 to %Int16
  %54 = icmp eq %Int16 %3, %53
  br i1 %54, label %select_1_7_ok, label %select_1_8
select_1_7_ok:
  %55 = alloca %union.7
  store %union.7 %2, %union.7* %55, align 64
  %56 = getelementptr inbounds %union.7, %union.7* %55, i1 0, i32 1
  %57 = bitcast [48 x %Nat8]* %56 to %AstStmtTypeBind*
  %58 = load %AstStmtTypeBind, %AstStmtTypeBind* %57
  %59 = call %union.24 (%AstStmtTypeBind) @func553 (%AstStmtTypeBind %58)
  br label %select_1_end
select_1_8:
  %60 = bitcast %Int16 0 to %Int16
  %61 = icmp eq %Int16 %3, %60
  br i1 %61, label %select_1_8_ok, label %select_1_9
select_1_8_ok:
  %62 = alloca %union.7
  store %union.7 %2, %union.7* %62, align 64
  %63 = getelementptr inbounds %union.7, %union.7* %62, i1 0, i32 1
  %64 = bitcast [48 x %Nat8]* %63 to %AstStmtBreak*
  %65 = load %AstStmtBreak, %AstStmtBreak* %64
  %66 = call %union.24 (%AstStmtBreak) @func554 (%AstStmtBreak %65)
  br label %select_1_end
select_1_9:
  %67 = bitcast %Int16 1 to %Int16
  %68 = icmp eq %Int16 %3, %67
  br i1 %68, label %select_1_9_ok, label %select_1_10
select_1_9_ok:
  %69 = alloca %union.7
  store %union.7 %2, %union.7* %69, align 64
  %70 = getelementptr inbounds %union.7, %union.7* %69, i1 0, i32 1
  %71 = bitcast [48 x %Nat8]* %70 to %AstStmtAgain*
  %72 = load %AstStmtAgain, %AstStmtAgain* %71
  %73 = call %union.24 (%AstStmtAgain) @func555 (%AstStmtAgain %72)
  br label %select_1_end
select_1_10:
  %74 = bitcast %Int16 3 to %Int16
  %75 = icmp eq %Int16 %3, %74
  br i1 %75, label %select_1_10_ok, label %select_1_11
select_1_10_ok:
  %76 = alloca %union.7
  store %union.7 %2, %union.7* %76, align 64
  %77 = getelementptr inbounds %union.7, %union.7* %76, i1 0, i32 1
  %78 = bitcast [48 x %Nat8]* %77 to %AstStmtGoto*
  %79 = load %AstStmtGoto, %AstStmtGoto* %78
  %80 = call %union.24 (%AstStmtGoto) @func556 (%AstStmtGoto %79)
  br label %select_1_end
select_1_11:
  %81 = bitcast %Int16 2 to %Int16
  %82 = icmp eq %Int16 %3, %81
  br i1 %82, label %select_1_11_ok, label %select_1_12
select_1_11_ok:
  %83 = alloca %union.7
  store %union.7 %2, %union.7* %83, align 64
  %84 = getelementptr inbounds %union.7, %union.7* %83, i1 0, i32 1
  %85 = bitcast [48 x %Nat8]* %84 to %AstStmtLabel*
  %86 = load %AstStmtLabel, %AstStmtLabel* %85
  %87 = call %union.24 (%AstStmtLabel) @func557 (%AstStmtLabel %86)
  br label %select_1_end
select_1_12:
  %88 = inttoptr %Unit zeroinitializer to %union.24
  br label %select_1_end
select_1_end:
  %89 = phi %union.24 [ %10, %select_1_0_ok ], [ %17, %select_1_1_ok ], [ %24, %select_1_2_ok ], [ %31, %select_1_3_ok ], [ %38, %select_1_4_ok ], [ %45, %select_1_5_ok ], [ %52, %select_1_6_ok ], [ %59, %select_1_7_ok ], [ %66, %select_1_8_ok ], [ %73, %select_1_9_ok ], [ %80, %select_1_10_ok ], [ %87, %select_1_11_ok ], [ %88, %select_1_12 ]
  ret %union.24 %89
}

define %union.24 @func544 (%AstStmtAssign) {
  %2 = extractvalue %AstStmtAssign %0, 1
  %3 = call %Value* (%union.4*) @func476 (%union.4* %2)
  %4 = getelementptr inbounds %Value, %Value* %3, i1 0, i32 1
  %5 = load %union.9, %union.9* %4
  %6 = extractvalue %union.9 %5, 0
  %7 = bitcast %Int16 40 to %Int16
  %8 = icmp eq %Int16 %6, %7
  br i1 %8, label %then_0, label %else_0
then_0:
  %9 = inttoptr %Unit zeroinitializer to %union.24
  ret %union.24 %9
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %11 = extractvalue %AstStmtAssign %0, 0
  %12 = call %Value* (%union.4*) @func479 (%union.4* %11)
  %13 = getelementptr inbounds %Value, %Value* %12, i1 0, i32 1
  %14 = load %union.9, %union.9* %13
  %15 = extractvalue %union.9 %14, 0
  %16 = bitcast %Int16 40 to %Int16
  %17 = icmp eq %Int16 %15, %16
  br i1 %17, label %then_1, label %else_1
then_1:
  %18 = inttoptr %Unit zeroinitializer to %union.24
  ret %union.24 %18
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  %20 = call i1 (%Value*) @func539 (%Value* %12)
  br i1 %20, label %then_2, label %else_2
then_2:
  %21 = bitcast [13 x %Nat8]* @func544_str1 to %Str
  %22 = extractvalue %AstStmtAssign %0, 2
  call void (%Str, %TokenInfo*) @error (%Str %21, %TokenInfo* %22)
  %23 = inttoptr %Unit zeroinitializer to %union.24
  ret %union.24 %23
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
  %25 = getelementptr inbounds %Value, %Value* %12, i1 0, i32 0
  %26 = load %Type*, %Type** %25
  %27 = getelementptr inbounds %Type, %Type* %26, i1 0, i32 0
  %28 = load %TypeKind, %TypeKind* %27
  br label %select_1_0
select_1_0:
  %29 = icmp eq %TypeKind %28, 8
  br i1 %29, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %30 = getelementptr inbounds %Value, %Value* %12, i1 0, i32 0
  %31 = load %Type*, %Type** %30
  %32 = getelementptr inbounds %Type, %Type* %31, i1 0, i32 13
  %33 = getelementptr inbounds %TypeVar, %TypeVar* %32, i1 0, i32 0
  %34 = load %Type*, %Type** %33
  br label %select_1_end
select_1_1:
  %35 = getelementptr inbounds %Value, %Value* %12, i1 0, i32 0
  %36 = load %Type*, %Type** %35
  br label %select_1_end
select_1_end:
  %37 = phi %Type* [ %34, %select_1_0_ok ], [ %36, %select_1_1 ]
  %38 = call %Value* (%Value*, %Type*) @func537 (%Value* %3, %Type* %37)
  %39 = getelementptr inbounds %Value, %Value* %38, i1 0, i32 0
  %40 = load %Type*, %Type** %39
  %41 = extractvalue %AstStmtAssign %0, 2
  %42 = call i1 (%Type*, %Type*, %TokenInfo*) @type_check (%Type* %37, %Type* %40, %TokenInfo* %41)
  %43 = xor i1 %42, 1
  br i1 %43, label %then_3, label %else_3
then_3:
  %44 = inttoptr %Unit zeroinitializer to %union.24
  ret %union.24 %44
  br label %endif_3
else_3:
  br label %endif_3
endif_3:
  %46 = insertvalue %StmtAssign zeroinitializer, %Value* %12, 0
  %47 = insertvalue %StmtAssign %46, %Value* %38, 1
  %48 = extractvalue %AstStmtAssign %0, 2
  %49 = insertvalue %StmtAssign %47, %TokenInfo* %48, 2
  %50 = alloca %union.13
; write variant 8
  %51 = getelementptr inbounds %union.13, %union.13* %50, i1 0, i32 0
  store %Int16 8, %Int16* %51, align 2
; write data
  %52 = getelementptr inbounds %union.13, %union.13* %50, i1 0, i32 1
  %53 = bitcast [112 x %Nat8]* %52 to %StmtAssign*
  store %StmtAssign %49, %StmtAssign* %53, align 8
  %54 = load %union.13, %union.13* %50
  %55 = call %union.13* (%union.13) @stmt_new (%union.13 %54)
  %56 = bitcast %union.13* %55 to %union.24
  ret %union.24 %56
}

define %union.13* @func545 (%AstId*, %Type*, %Value*, %TokenInfo*) {
  %5 = insertvalue %StmtVarDef zeroinitializer, %AstId* %0, 0
  %6 = load %Nat32, %Nat32* @nocnt
  %7 = insertvalue %StmtVarDef %5, %Nat32 %6, 1
  %8 = insertvalue %StmtVarDef %7, %Type* %1, 2
  %9 = call %Value* (%Value*) @dold (%Value* %2)
  %10 = insertvalue %StmtVarDef %8, %Value* %9, 3
  %11 = insertvalue %StmtVarDef %10, %TokenInfo* %3, 4
  %12 = alloca %union.13
; write variant 1
  %13 = getelementptr inbounds %union.13, %union.13* %12, i1 0, i32 0
  store %Int16 1, %Int16* %13, align 2
; write data
  %14 = getelementptr inbounds %union.13, %union.13* %12, i1 0, i32 1
  %15 = bitcast [112 x %Nat8]* %14 to %StmtVarDef*
  store %StmtVarDef %11, %StmtVarDef* %15, align 8
  %16 = load %union.13, %union.13* %12
  %17 = call %union.13* (%union.13) @stmt_new (%union.13 %16)
  %18 = load %Nat32, %Nat32* @nocnt
  %19 = add %Nat32 %18, 1
  store %Nat32 %19, %Nat32* @nocnt, align 4
  ret %union.13* %17
}

define %union.24 @func546 (%AstStmtValueBind) {
  %2 = extractvalue %AstStmtValueBind %0, 0
  %3 = getelementptr inbounds %AstId, %AstId* %2, i1 0, i32 0
  %4 = load %Str, %Str* %3
  %5 = extractvalue %AstStmtValueBind %0, 1
  %6 = call %Value* (%union.4*, i1) @func477 (%union.4* %5, i1 0)
  %7 = getelementptr inbounds %Value, %Value* %6, i1 0, i32 1
  %8 = load %union.9, %union.9* %7
  %9 = extractvalue %union.9 %8, 0
  %10 = bitcast %Int16 33 to %Int16
  %11 = icmp eq %Int16 %9, %10
  %12 = extractvalue %union.9 %8, 0
  %13 = bitcast %Int16 38 to %Int16
  %14 = icmp eq %Int16 %12, %13
  %15 = extractvalue %union.9 %8, 0
  %16 = bitcast %Int16 36 to %Int16
  %17 = icmp eq %Int16 %15, %16
  %18 = or i1 %14, %17
  %19 = or i1 %11, %18
  %20 = getelementptr inbounds %Value, %Value* %6, i1 0, i32 0
  %21 = load %Type*, %Type** %20
  %22 = getelementptr inbounds %Type, %Type* %21, i1 0, i32 0
  %23 = load %TypeKind, %TypeKind* %22
  %24 = icmp eq %TypeKind %23, 8
  %25 = or i1 %19, %24
  br i1 %25, label %then_0, label %else_0
then_0:
  call void (%Str, %Value*) @valbind_local (%Str %4, %Value* %6)
  %26 = inttoptr %Unit zeroinitializer to %union.24
  ret %union.24 %26
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %28 = insertvalue %StmtValBind zeroinitializer, %Value* %6, 0
  %29 = load %Nat32, %Nat32* @nocnt2
  %30 = insertvalue %StmtValBind %28, %Nat32 %29, 1
  %31 = extractvalue %AstStmtValueBind %0, 2
  %32 = insertvalue %StmtValBind %30, %TokenInfo* %31, 2
  %33 = alloca %union.13
; write variant 10
  %34 = getelementptr inbounds %union.13, %union.13* %33, i1 0, i32 0
  store %Int16 10, %Int16* %34, align 2
; write data
  %35 = getelementptr inbounds %union.13, %union.13* %33, i1 0, i32 1
  %36 = bitcast [112 x %Nat8]* %35 to %StmtValBind*
  store %StmtValBind %32, %StmtValBind* %36, align 8
  %37 = load %union.13, %union.13* %33
  %38 = call %union.13* (%union.13) @stmt_new (%union.13 %37)
  %39 = getelementptr inbounds %Value, %Value* %6, i1 0, i32 0
  %40 = load %Type*, %Type** %39
  %41 = insertvalue %ValueLocalVal zeroinitializer, %Type* %40, 0
  %42 = load %Nat32, %Nat32* @nocnt2
  %43 = insertvalue %ValueLocalVal %41, %Nat32 %42, 1
  %44 = extractvalue %AstStmtValueBind %0, 2
  %45 = insertvalue %ValueLocalVal %43, %TokenInfo* %44, 2
  %46 = alloca %union.9
; write variant 30
  %47 = getelementptr inbounds %union.9, %union.9* %46, i1 0, i32 0
  store %Int16 30, %Int16* %47, align 2
; write data
  %48 = getelementptr inbounds %union.9, %union.9* %46, i1 0, i32 1
  %49 = bitcast [72 x %Nat8]* %48 to %ValueLocalVal*
  store %ValueLocalVal %45, %ValueLocalVal* %49, align 8
  %50 = load %union.9, %union.9* %46
  %51 = getelementptr inbounds %Value, %Value* %6, i1 0, i32 0
  %52 = load %Type*, %Type** %51
  %53 = extractvalue %AstStmtValueBind %0, 2
  %54 = call %Value* (%union.9, %Type*, %TokenInfo*) @func455 (%union.9 %50, %Type* %52, %TokenInfo* %53)
  %55 = getelementptr inbounds %Value, %Value* %54, i1 0, i32 2
  %56 = extractvalue %AstStmtValueBind %0, 2
  store %TokenInfo* %56, %TokenInfo** %55, align 8
  call void (%Str, %Value*) @valbind_local (%Str %4, %Value* %54)
  %57 = load %Nat32, %Nat32* @nocnt2
  %58 = add %Nat32 %57, 1
  store %Nat32 %58, %Nat32* @nocnt2, align 4
  %59 = bitcast %union.13* %38 to %union.24
  ret %union.24 %59
}

define void @func548 (%Unit*, %Unit*, %Nat32, %Node*) {
  %5 = bitcast %Unit* %0 to %union.7*
  %6 = call %union.24 (%union.7*) @func543 (%union.7* %5)
  %7 = bitcast %Int64 0 to %Int64
  %8 = ptrtoint %union.24 %6 to %Int64
  %9 = icmp eq %Int64 %8, %7
  br i1 %9, label %then_0, label %else_0
then_0:
ret void
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %11 = bitcast %Unit* %1 to %List*
  %12 = bitcast %union.24 %6 to %union.13*
  %13 = bitcast %union.13* %12 to %Unit*
  %14 = call i1 (%List*, %Unit*) @list_append (%List* %11, %Unit* %13)
  ret void
}

define %union.24 @func547 (%AstStmtBlock) {
  %2 = alloca %StmtBlock
  store %StmtBlock zeroinitializer, %StmtBlock* %2, align 8
  %3 = getelementptr inbounds %StmtBlock, %StmtBlock* %2, i1 0, i32 0
  %4 = load %Context*, %Context** @cctx
  call void (%Context*, %Context*) @context_init (%Context* %3, %Context* %4)
  %5 = getelementptr inbounds %StmtBlock, %StmtBlock* %2, i1 0, i32 1
  call void (%List*) @map_init (%List* %5)
  %6 = load %FuncContext*, %FuncContext** @fctx
  %7 = getelementptr inbounds %FuncContext, %FuncContext* %6, i1 0, i32 2
  %8 = load %StmtBlock*, %StmtBlock** %7
  %9 = getelementptr inbounds %StmtBlock, %StmtBlock* %2, i1 0, i32 0
  %10 = load %Context*, %Context** @cctx
  call void (%Context*, %Context*) @context_init (%Context* %9, %Context* %10)
  %11 = getelementptr inbounds %StmtBlock, %StmtBlock* %2, i1 0, i32 0
  store %Context* %11, %Context** @cctx, align 8
  %12 = load %FuncContext*, %FuncContext** @fctx
  %13 = getelementptr inbounds %FuncContext, %FuncContext* %12, i1 0, i32 2
  %14 = getelementptr inbounds %StmtBlock, %StmtBlock* %2, i1 0
  store %StmtBlock* %14, %StmtBlock** %13, align 8
  %15 = alloca %List
  %16 = extractvalue %AstStmtBlock %0, 0
  store %List %16, %List* %15, align 8
  %17 = getelementptr inbounds %List, %List* %15, i1 0
  %18 = getelementptr inbounds %StmtBlock, %StmtBlock* %2, i1 0, i32 1
  %19 = bitcast %List* %18 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @func64 (%List* %17, %ListForeachHandler @func548, %Unit* %19)
  %20 = getelementptr inbounds %StmtBlock, %StmtBlock* %2, i1 0, i32 0
  %21 = getelementptr inbounds %Context, %Context* %20, i1 0, i32 0
  %22 = load %Context*, %Context** %21
  store %Context* %22, %Context** @cctx, align 8
  %23 = load %FuncContext*, %FuncContext** @fctx
  %24 = getelementptr inbounds %FuncContext, %FuncContext* %23, i1 0, i32 2
  store %StmtBlock* %8, %StmtBlock** %24, align 8
  %25 = getelementptr inbounds %StmtBlock, %StmtBlock* %2, i1 0, i32 1
  %26 = load %List, %List* %25
  %27 = insertvalue %StmtBlock zeroinitializer, %List %26, 1
  %28 = extractvalue %AstStmtBlock %0, 1
  %29 = insertvalue %StmtBlock %27, %TokenInfo* %28, 2
  %30 = alloca %union.13
; write variant 9
  %31 = getelementptr inbounds %union.13, %union.13* %30, i1 0, i32 0
  store %Int16 9, %Int16* %31, align 2
; write data
  %32 = getelementptr inbounds %union.13, %union.13* %30, i1 0, i32 1
  %33 = bitcast [112 x %Nat8]* %32 to %StmtBlock*
  store %StmtBlock %29, %StmtBlock* %33, align 8
  %34 = load %union.13, %union.13* %30
  %35 = call %union.13* (%union.13) @stmt_new (%union.13 %34)
  %36 = bitcast %union.13* %35 to %union.24
  ret %union.24 %36
}

define %union.24 @func549 (%AstStmtExpr) {
  %2 = extractvalue %AstStmtExpr %0, 0
  %3 = call %Value* (%union.4*) @func476 (%union.4* %2)
  %4 = getelementptr inbounds %Value, %Value* %3, i1 0, i32 1
  %5 = load %union.9, %union.9* %4
  %6 = extractvalue %union.9 %5, 0
  %7 = bitcast %Int16 40 to %Int16
  %8 = icmp eq %Int16 %6, %7
  br i1 %8, label %then_0, label %else_0
then_0:
  %9 = inttoptr %Unit zeroinitializer to %union.24
  ret %union.24 %9
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %11 = getelementptr inbounds %Value, %Value* %3, i1 0, i32 0
  %12 = load %Type*, %Type** %11
  %13 = load %Type*, %Type** @typeUnit
  %14 = call i1 (%Type*, %Type*) @func445 (%Type* %12, %Type* %13)
  %15 = xor i1 %14, 1
  br i1 %15, label %then_1, label %else_1
then_1:
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  %16 = insertvalue %StmtExpr zeroinitializer, %Value* %3, 0
  %17 = extractvalue %AstStmtExpr %0, 1
  %18 = insertvalue %StmtExpr %16, %TokenInfo* %17, 1
  %19 = alloca %union.13
; write variant 11
  %20 = getelementptr inbounds %union.13, %union.13* %19, i1 0, i32 0
  store %Int16 11, %Int16* %20, align 2
; write data
  %21 = getelementptr inbounds %union.13, %union.13* %19, i1 0, i32 1
  %22 = bitcast [112 x %Nat8]* %21 to %StmtExpr*
  store %StmtExpr %18, %StmtExpr* %22, align 8
  %23 = load %union.13, %union.13* %19
  %24 = call %union.13* (%union.13) @stmt_new (%union.13 %23)
  %25 = bitcast %union.13* %24 to %union.24
  ret %union.24 %25
}

define %union.24 @func550 (%AstStmtIf) {
  %2 = extractvalue %AstStmtIf %0, 0
  %3 = call %Value* (%union.4*) @func476 (%union.4* %2)
  %4 = extractvalue %AstStmtIf %0, 1
  %5 = call %union.24 (%union.7*) @func543 (%union.7* %4)
  %6 = alloca %union.24
  %7 = inttoptr %Unit zeroinitializer to %union.24
  store %union.24 %7, %union.24* %6, align 16
  %8 = extractvalue %AstStmtIf %0, 2
  %9 = bitcast %Int64 0 to %Int64
  %10 = ptrtoint %union.5 %8 to %Int64
  %11 = icmp eq %Int64 %10, %9
  %12 = xor i1 %11, 1
  br i1 %12, label %then_0, label %else_0
then_0:
  %13 = extractvalue %AstStmtIf %0, 2
  %14 = bitcast %union.5 %13 to %union.7*
  %15 = call %union.24 (%union.7*) @func543 (%union.7* %14)
  %16 = bitcast %Int64 0 to %Int64
  %17 = ptrtoint %union.24 %15 to %Int64
  %18 = icmp eq %Int64 %17, %16
  %19 = xor i1 %18, 1
  br i1 %19, label %then_1, label %else_1
then_1:
  %20 = bitcast %union.24 %15 to %union.13*
  %21 = bitcast %union.13* %20 to %union.24
  store %union.24 %21, %union.24* %6, align 16
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %22 = getelementptr inbounds %Value, %Value* %3, i1 0, i32 1
  %23 = load %union.9, %union.9* %22
  %24 = extractvalue %union.9 %23, 0
  %25 = bitcast %Int16 40 to %Int16
  %26 = icmp eq %Int16 %24, %25
  br i1 %26, label %then_2, label %else_2
then_2:
  %27 = inttoptr %Unit zeroinitializer to %union.24
  ret %union.24 %27
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
  %29 = load %Type*, %Type** @typeBool
  %30 = getelementptr inbounds %Value, %Value* %3, i1 0, i32 0
  %31 = load %Type*, %Type** %30
  %32 = getelementptr inbounds %Value, %Value* %3, i1 0, i32 3
  %33 = load %TokenInfo*, %TokenInfo** %32
  %34 = call i1 (%Type*, %Type*, %TokenInfo*) @type_check (%Type* %29, %Type* %31, %TokenInfo* %33)
  %35 = xor i1 %34, 1
  br i1 %35, label %then_3, label %else_3
then_3:
  %36 = inttoptr %Unit zeroinitializer to %union.24
  ret %union.24 %36
  br label %endif_3
else_3:
  br label %endif_3
endif_3:
  %38 = bitcast %Int64 0 to %Int64
  %39 = ptrtoint %union.24 %5 to %Int64
  %40 = icmp eq %Int64 %39, %38
  br i1 %40, label %then_4, label %else_4
then_4:
  %41 = inttoptr %Unit zeroinitializer to %union.24
  ret %union.24 %41
  br label %endif_4
else_4:
  br label %endif_4
endif_4:
  %43 = insertvalue %StmtIf zeroinitializer, %Value* %3, 0
  %44 = bitcast %union.24 %5 to %union.13*
  %45 = insertvalue %StmtIf %43, %union.13* %44, 1
  %46 = load %union.24, %union.24* %6
  %47 = insertvalue %StmtIf %45, %union.24 %46, 2
  %48 = extractvalue %AstStmtIf %0, 3
  %49 = insertvalue %StmtIf %47, %TokenInfo* %48, 3
  %50 = alloca %union.13
; write variant 7
  %51 = getelementptr inbounds %union.13, %union.13* %50, i1 0, i32 0
  store %Int16 7, %Int16* %51, align 2
; write data
  %52 = getelementptr inbounds %union.13, %union.13* %50, i1 0, i32 1
  %53 = bitcast [112 x %Nat8]* %52 to %StmtIf*
  store %StmtIf %49, %StmtIf* %53, align 16
  %54 = load %union.13, %union.13* %50
  %55 = call %union.13* (%union.13) @stmt_new (%union.13 %54)
  %56 = bitcast %union.13* %55 to %union.24
  ret %union.24 %56
}

define %union.24 @func551 (%AstStmtWhile) {
  %2 = extractvalue %AstStmtWhile %0, 0
  %3 = call %Value* (%union.4*) @func476 (%union.4* %2)
  %4 = load %FuncContext*, %FuncContext** @fctx
  %5 = getelementptr inbounds %FuncContext, %FuncContext* %4, i1 0, i32 5
  %6 = load %FuncContext*, %FuncContext** @fctx
  %7 = getelementptr inbounds %FuncContext, %FuncContext* %6, i1 0, i32 5
  %8 = load %Nat32, %Nat32* %7
  %9 = add %Nat32 %8, 1
  store %Nat32 %9, %Nat32* %5, align 4
  %10 = extractvalue %AstStmtWhile %0, 1
  %11 = call %union.24 (%union.7*) @func543 (%union.7* %10)
  %12 = load %FuncContext*, %FuncContext** @fctx
  %13 = getelementptr inbounds %FuncContext, %FuncContext* %12, i1 0, i32 5
  %14 = load %FuncContext*, %FuncContext** @fctx
  %15 = getelementptr inbounds %FuncContext, %FuncContext* %14, i1 0, i32 5
  %16 = load %Nat32, %Nat32* %15
  %17 = sub %Nat32 %16, 1
  store %Nat32 %17, %Nat32* %13, align 4
  %18 = getelementptr inbounds %Value, %Value* %3, i1 0, i32 1
  %19 = load %union.9, %union.9* %18
  %20 = extractvalue %union.9 %19, 0
  %21 = bitcast %Int16 40 to %Int16
  %22 = icmp eq %Int16 %20, %21
  br i1 %22, label %then_0, label %else_0
then_0:
  %23 = inttoptr %Unit zeroinitializer to %union.24
  ret %union.24 %23
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %25 = load %Type*, %Type** @typeBool
  %26 = getelementptr inbounds %Value, %Value* %3, i1 0, i32 0
  %27 = load %Type*, %Type** %26
  %28 = getelementptr inbounds %Value, %Value* %3, i1 0, i32 3
  %29 = load %TokenInfo*, %TokenInfo** %28
  %30 = call i1 (%Type*, %Type*, %TokenInfo*) @type_check (%Type* %25, %Type* %27, %TokenInfo* %29)
  %31 = xor i1 %30, 1
  br i1 %31, label %then_1, label %else_1
then_1:
  %32 = inttoptr %Unit zeroinitializer to %union.24
  ret %union.24 %32
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  %34 = bitcast %Int64 0 to %Int64
  %35 = ptrtoint %union.24 %11 to %Int64
  %36 = icmp eq %Int64 %35, %34
  br i1 %36, label %then_2, label %else_2
then_2:
  %37 = inttoptr %Unit zeroinitializer to %union.24
  ret %union.24 %37
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
  %39 = insertvalue %StmtWhile zeroinitializer, %Value* %3, 0
  %40 = bitcast %union.24 %11 to %union.13*
  %41 = insertvalue %StmtWhile %39, %union.13* %40, 1
  %42 = extractvalue %AstStmtWhile %0, 2
  %43 = insertvalue %StmtWhile %41, %TokenInfo* %42, 2
  %44 = alloca %union.13
; write variant 6
  %45 = getelementptr inbounds %union.13, %union.13* %44, i1 0, i32 0
  store %Int16 6, %Int16* %45, align 2
; write data
  %46 = getelementptr inbounds %union.13, %union.13* %44, i1 0, i32 1
  %47 = bitcast [112 x %Nat8]* %46 to %StmtWhile*
  store %StmtWhile %43, %StmtWhile* %47, align 8
  %48 = load %union.13, %union.13* %44
  %49 = call %union.13* (%union.13) @stmt_new (%union.13 %48)
  %50 = bitcast %union.13* %49 to %union.24
  ret %union.24 %50
}

define %union.24 @func552 (%AstStmtReturn) {
  %2 = load %FuncContext*, %FuncContext** @fctx
  %3 = getelementptr inbounds %FuncContext, %FuncContext* %2, i1 0, i32 1
  %4 = load %Value*, %Value** %3
  %5 = getelementptr inbounds %Value, %Value* %4, i1 0, i32 0
  %6 = load %Type*, %Type** %5
  %7 = getelementptr inbounds %Type, %Type* %6, i1 0, i32 7
  %8 = getelementptr inbounds %TypeFunc, %TypeFunc* %7, i1 0, i32 1
  %9 = load %Type*, %Type** %8
  %10 = extractvalue %AstStmtReturn %0, 0
  %11 = bitcast %Int64 0 to %Int64
  %12 = ptrtoint %union.6 %10 to %Int64
  %13 = icmp eq %Int64 %12, %11
  br i1 %13, label %then_0, label %else_0
then_0:
  %14 = load %Type*, %Type** @typeUnit
  %15 = call i1 (%Type*, %Type*) @func445 (%Type* %9, %Type* %14)
  %16 = xor i1 %15, 1
  br i1 %16, label %then_1, label %else_1
then_1:
  %17 = bitcast [21 x %Nat8]* @func552_str1 to %Str
  %18 = extractvalue %AstStmtReturn %0, 1
  call void (%Str, %TokenInfo*) @error (%Str %17, %TokenInfo* %18)
  %19 = inttoptr %Unit zeroinitializer to %union.24
  ret %union.24 %19
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  %21 = inttoptr %Unit zeroinitializer to %union.12
  %22 = insertvalue %StmtReturn zeroinitializer, %union.12 %21, 0
  %23 = extractvalue %AstStmtReturn %0, 1
  %24 = insertvalue %StmtReturn %22, %TokenInfo* %23, 1
  %25 = alloca %union.13
; write variant 5
  %26 = getelementptr inbounds %union.13, %union.13* %25, i1 0, i32 0
  store %Int16 5, %Int16* %26, align 2
; write data
  %27 = getelementptr inbounds %union.13, %union.13* %25, i1 0, i32 1
  %28 = bitcast [112 x %Nat8]* %27 to %StmtReturn*
  store %StmtReturn %24, %StmtReturn* %28, align 16
  %29 = load %union.13, %union.13* %25
  %30 = call %union.13* (%union.13) @stmt_new (%union.13 %29)
  %31 = bitcast %union.13* %30 to %union.24
  ret %union.24 %31
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %33 = bitcast %union.6 %10 to %union.4*
  %34 = call %Value* (%union.4*) @func476 (%union.4* %33)
  %35 = getelementptr inbounds %Value, %Value* %34, i1 0, i32 1
  %36 = load %union.9, %union.9* %35
  %37 = extractvalue %union.9 %36, 0
  %38 = bitcast %Int16 40 to %Int16
  %39 = icmp eq %Int16 %37, %38
  br i1 %39, label %then_2, label %else_2
then_2:
  %40 = inttoptr %Unit zeroinitializer to %union.24
  ret %union.24 %40
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
  %42 = call %Value* (%Value*, %Type*) @func537 (%Value* %34, %Type* %9)
  %43 = getelementptr inbounds %Value, %Value* %42, i1 0, i32 0
  %44 = load %Type*, %Type** %43
  %45 = getelementptr inbounds %Value, %Value* %34, i1 0, i32 3
  %46 = load %TokenInfo*, %TokenInfo** %45
  %47 = call i1 (%Type*, %Type*, %TokenInfo*) @type_check (%Type* %9, %Type* %44, %TokenInfo* %46)
  %48 = xor i1 %47, 1
  br i1 %48, label %then_3, label %else_3
then_3:
  br label %endif_3
else_3:
  br label %endif_3
endif_3:
  %49 = bitcast %Value* %42 to %union.12
  %50 = insertvalue %StmtReturn zeroinitializer, %union.12 %49, 0
  %51 = extractvalue %AstStmtReturn %0, 1
  %52 = insertvalue %StmtReturn %50, %TokenInfo* %51, 1
  %53 = alloca %union.13
; write variant 5
  %54 = getelementptr inbounds %union.13, %union.13* %53, i1 0, i32 0
  store %Int16 5, %Int16* %54, align 2
; write data
  %55 = getelementptr inbounds %union.13, %union.13* %53, i1 0, i32 1
  %56 = bitcast [112 x %Nat8]* %55 to %StmtReturn*
  store %StmtReturn %52, %StmtReturn* %56, align 16
  %57 = load %union.13, %union.13* %53
  %58 = call %union.13* (%union.13) @stmt_new (%union.13 %57)
  %59 = bitcast %union.13* %58 to %union.24
  ret %union.24 %59
}

define %union.24 @func553 (%AstStmtTypeBind) {
  %2 = extractvalue %AstStmtTypeBind %0, 0
  %3 = getelementptr inbounds %AstId, %AstId* %2, i1 0, i32 0
  %4 = load %Str, %Str* %3
  %5 = extractvalue %AstStmtTypeBind %0, 1
  %6 = call %Type* (%union.2*) @func413 (%union.2* %5)
  %7 = call %Str () @func132 ()
  %8 = getelementptr inbounds %Type, %Type* %6, i1 0, i32 2
  %9 = load %Str, %Str* %8; loadImmPtr
  %10 = inttoptr i64 0 to%Str
  %11 = icmp eq %Str %9, %10
  br i1 %11, label %then_0, label %else_0
then_0:
  %12 = getelementptr inbounds %Type, %Type* %6, i1 0, i32 2
  store %Str %7, %Str* %12, align 8
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %13 = load %Module*, %Module** @module
  %14 = getelementptr inbounds %Module, %Module* %13, i1 0, i32 0
  call void (%Context*, %Str, %Type*) @context_type_append (%Context* %14, %Str %4, %Type* %6)
  %15 = call %Definition* (%Assembly*, %Str, %Type*) @func258 (%Assembly* @asm0, %Str %7, %Type* %6)
  %16 = inttoptr %Unit zeroinitializer to %union.24
  ret %union.24 %16
}

define %union.24 @func554 (%AstStmtBreak) {
  %2 = load %FuncContext*, %FuncContext** @fctx
  %3 = getelementptr inbounds %FuncContext, %FuncContext* %2, i1 0, i32 5
  %4 = load %Nat32, %Nat32* %3
  %5 = icmp eq %Nat32 %4, 0
  br i1 %5, label %then_0, label %else_0
then_0:
  %6 = bitcast [31 x %Nat8]* @func554_str1 to %Str; loadImmPtr
  %7 = inttoptr i64 0 to%TokenInfo*
  call void (%Str, %TokenInfo*) @error (%Str %6, %TokenInfo* %7)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %8 = extractvalue %AstStmtBreak %0, 0
  %9 = insertvalue %StmtBreak zeroinitializer, %TokenInfo* %8, 0
  %10 = alloca %union.13
; write variant 4
  %11 = getelementptr inbounds %union.13, %union.13* %10, i1 0, i32 0
  store %Int16 4, %Int16* %11, align 2
; write data
  %12 = getelementptr inbounds %union.13, %union.13* %10, i1 0, i32 1
  %13 = bitcast [112 x %Nat8]* %12 to %StmtBreak*
  store %StmtBreak %9, %StmtBreak* %13, align 8
  %14 = load %union.13, %union.13* %10
  %15 = call %union.13* (%union.13) @stmt_new (%union.13 %14)
  %16 = bitcast %union.13* %15 to %union.24
  ret %union.24 %16
}

define %union.24 @func555 (%AstStmtAgain) {
  %2 = load %FuncContext*, %FuncContext** @fctx
  %3 = getelementptr inbounds %FuncContext, %FuncContext* %2, i1 0, i32 5
  %4 = load %Nat32, %Nat32* %3
  %5 = icmp eq %Nat32 %4, 0
  br i1 %5, label %then_0, label %else_0
then_0:
  %6 = bitcast [31 x %Nat8]* @func555_str1 to %Str; loadImmPtr
  %7 = inttoptr i64 0 to%TokenInfo*
  call void (%Str, %TokenInfo*) @error (%Str %6, %TokenInfo* %7)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %8 = extractvalue %AstStmtAgain %0, 0
  %9 = insertvalue %StmtAgain zeroinitializer, %TokenInfo* %8, 0
  %10 = alloca %union.13
; write variant 3
  %11 = getelementptr inbounds %union.13, %union.13* %10, i1 0, i32 0
  store %Int16 3, %Int16* %11, align 2
; write data
  %12 = getelementptr inbounds %union.13, %union.13* %10, i1 0, i32 1
  %13 = bitcast [112 x %Nat8]* %12 to %StmtAgain*
  store %StmtAgain %9, %StmtAgain* %13, align 8
  %14 = load %union.13, %union.13* %10
  %15 = call %union.13* (%union.13) @stmt_new (%union.13 %14)
  %16 = bitcast %union.13* %15 to %union.24
  ret %union.24 %16
}

define %union.24 @func556 (%AstStmtGoto) {
  %2 = extractvalue %AstStmtGoto %0, 0
  %3 = getelementptr inbounds %AstId, %AstId* %2, i1 0, i32 0
  %4 = load %Str, %Str* %3
  %5 = insertvalue %StmtGoto zeroinitializer, %Str %4, 0
  %6 = extractvalue %AstStmtGoto %0, 1
  %7 = insertvalue %StmtGoto %5, %TokenInfo* %6, 1
  %8 = alloca %union.13
; write variant 2
  %9 = getelementptr inbounds %union.13, %union.13* %8, i1 0, i32 0
  store %Int16 2, %Int16* %9, align 2
; write data
  %10 = getelementptr inbounds %union.13, %union.13* %8, i1 0, i32 1
  %11 = bitcast [112 x %Nat8]* %10 to %StmtGoto*
  store %StmtGoto %7, %StmtGoto* %11, align 8
  %12 = load %union.13, %union.13* %8
  %13 = call %union.13* (%union.13) @stmt_new (%union.13 %12)
  %14 = bitcast %union.13* %13 to %union.24
  ret %union.24 %14
}

define %union.24 @func557 (%AstStmtLabel) {
  %2 = extractvalue %AstStmtLabel %0, 0
  %3 = getelementptr inbounds %AstId, %AstId* %2, i1 0, i32 0
  %4 = load %Str, %Str* %3
  %5 = insertvalue %StmtLabel zeroinitializer, %Str %4, 0
  %6 = extractvalue %AstStmtLabel %0, 1
  %7 = insertvalue %StmtLabel %5, %TokenInfo* %6, 1
  %8 = alloca %union.13
; write variant 0
  %9 = getelementptr inbounds %union.13, %union.13* %8, i1 0, i32 0
  store %Int16 0, %Int16* %9, align 2
; write data
  %10 = getelementptr inbounds %union.13, %union.13* %8, i1 0, i32 1
  %11 = bitcast [112 x %Nat8]* %10 to %StmtLabel*
  store %StmtLabel %7, %StmtLabel* %11, align 8
  %12 = load %union.13, %union.13* %8
  %13 = call %union.13* (%union.13) @stmt_new (%union.13 %12)
  %14 = bitcast %union.13* %13 to %union.24
  ret %union.24 %14
}

define void @module_init (%Module*, %Context*) {
  %3 = getelementptr inbounds %Module, %Module* %0, i1 0, i32 0
  call void (%Context*, %Context*) @context_init (%Context* %3, %Context* %1)
  ret void
}

define void @compiler_init () {; loadImmPtr
  %1 = inttoptr i64 0 to%Context*
  call void (%Context*, %Context*) @context_init (%Context* @builtinContext, %Context* %1)
  store %Context* @builtinContext, %Context** @cctx, align 8
  call void () @func447 ()
  call void () @func540 ()
  %2 = call %Unit* (%Nat32) @malloc (%Nat32 72)
  %3 = bitcast %Unit* %2 to %Module*
  store %Module* %3, %Module** @module, align 8
  %4 = load %Module*, %Module** @module
  %5 = load %Context*, %Context** @cctx
  call void (%Module*, %Context*) @module_init (%Module* %4, %Context* %5)
  %6 = load %Module*, %Module** @module
  %7 = getelementptr inbounds %Module, %Module* %6, i1 0, i32 0
  store %Context* %7, %Context** @cctx, align 8
  %8 = bitcast [7 x %Nat8]* @func559_str1 to %Str
  call void (%Assembly*, %Arch, %Str) @func253 (%Assembly* @asm0, %Arch 1, %Str %8)
  %9 = bitcast [4 x %Nat8]* @func559_str2 to %Str
  %10 = call %Int32 (%Str, ...) @printf (%Str %9)
  ret void
}

define void @func561 (%Definition*, %Str) {
  %3 = getelementptr inbounds %Definition, %Definition* %0, i1 0, i32 2
  %4 = getelementptr inbounds %DefType, %DefType* %3, i1 0, i32 0
  store %Str %1, %Str* %4, align 8
  ret void
}

define void @func562 (%Definition*, %Str) {
  %3 = getelementptr inbounds %Definition, %Definition* %0, i1 0, i32 3
  %4 = getelementptr inbounds %DefConst, %DefConst* %3, i1 0, i32 0
  store %Str %1, %Str* %4, align 8
  ret void
}

define void @func563 (%Definition*, %Str) {
  %3 = getelementptr inbounds %Definition, %Definition* %0, i1 0, i32 1
  %4 = getelementptr inbounds %DefStr, %DefStr* %3, i1 0, i32 0
  store %Str %1, %Str* %4, align 8
  ret void
}

define void @func564 (%Definition*, %Str) {
  %3 = getelementptr inbounds %Definition, %Definition* %0, i1 0, i32 4
  %4 = getelementptr inbounds %DefArray, %DefArray* %3, i1 0, i32 0
  store %Str %1, %Str* %4, align 8
  ret void
}

define void @func565 (%Definition*, %Str) {
  %3 = getelementptr inbounds %Definition, %Definition* %0, i1 0, i32 5
  %4 = getelementptr inbounds %DefFunc, %DefFunc* %3, i1 0, i32 0
  store %Str %1, %Str* %4, align 8
  ret void
}

define void @func566 (%Definition*, %Str) {
  %3 = getelementptr inbounds %Definition, %Definition* %0, i1 0, i32 6
  %4 = getelementptr inbounds %DefVar, %DefVar* %3, i1 0, i32 0
  store %Str %1, %Str* %4, align 8
  ret void
}

define void @func567 (%Definition*, %Str) {
  %3 = getelementptr inbounds %Definition, %Definition* %0, i1 0, i32 7
  %4 = getelementptr inbounds %DefAlias, %DefAlias* %3, i1 0, i32 0
  store %Str %1, %Str* %4, align 8
  ret void
}

define void @func568 () {
  ret void
}

define void @def_rename (%Definition*, %Str) {
  %3 = getelementptr inbounds %Definition, %Definition* %0, i1 0, i32 0
  %4 = load %DefinitionKind, %DefinitionKind* %3
  br label %select_1_0
select_1_0:
  %5 = icmp eq %DefinitionKind %4, 0
  br i1 %5, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  call void (%Definition*, %Str) @func561 (%Definition* %0, %Str %1)
  br label %select_1_end
select_1_1:
  %6 = icmp eq %DefinitionKind %4, 1
  br i1 %6, label %select_1_1_ok, label %select_1_2
select_1_1_ok:
  call void (%Definition*, %Str) @func562 (%Definition* %0, %Str %1)
  br label %select_1_end
select_1_2:
  %7 = icmp eq %DefinitionKind %4, 2
  br i1 %7, label %select_1_2_ok, label %select_1_3
select_1_2_ok:
  call void (%Definition*, %Str) @func563 (%Definition* %0, %Str %1)
  br label %select_1_end
select_1_3:
  %8 = icmp eq %DefinitionKind %4, 3
  br i1 %8, label %select_1_3_ok, label %select_1_4
select_1_3_ok:
  call void (%Definition*, %Str) @func564 (%Definition* %0, %Str %1)
  br label %select_1_end
select_1_4:
  %9 = icmp eq %DefinitionKind %4, 4
  br i1 %9, label %select_1_4_ok, label %select_1_5
select_1_4_ok:
  call void (%Definition*, %Str) @func565 (%Definition* %0, %Str %1)
  br label %select_1_end
select_1_5:
  %10 = icmp eq %DefinitionKind %4, 5
  br i1 %10, label %select_1_5_ok, label %select_1_6
select_1_5_ok:
  call void (%Definition*, %Str) @func566 (%Definition* %0, %Str %1)
  br label %select_1_end
select_1_6:
  %11 = icmp eq %DefinitionKind %4, 6
  br i1 %11, label %select_1_6_ok, label %select_1_7
select_1_6_ok:
  call void (%Definition*, %Str) @func567 (%Definition* %0, %Str %1)
  br label %select_1_end
select_1_7:
  call void () @func568 ()
  br label %select_1_end
select_1_end:
  ret void
}

define void @func571 () {
  ret void
}

define void @func570 (%Unit*, %Unit*, %Nat32, %Node*) {
  %5 = bitcast %Unit* %0 to %union.1*
  %6 = load %union.1, %union.1* %5
  %7 = extractvalue %union.1 %6, 0
  br label %select_1_0
select_1_0:
  %8 = bitcast %Int16 4 to %Int16
  %9 = icmp eq %Int16 %7, %8
  br i1 %9, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %10 = alloca %union.1
  store %union.1 %6, %union.1* %10, align 32
  %11 = getelementptr inbounds %union.1, %union.1* %10, i1 0, i32 1
  %12 = bitcast [24 x %Nat8]* %11 to %AstNodeBindType*
  %13 = load %AstNodeBindType, %AstNodeBindType* %12
  call void (%AstNodeBindType) @func573 (%AstNodeBindType %13)
  br label %select_1_end
select_1_1:
  %14 = bitcast %Int16 3 to %Int16
  %15 = icmp eq %Int16 %7, %14
  br i1 %15, label %select_1_1_ok, label %select_1_2
select_1_1_ok:
  %16 = alloca %union.1
  store %union.1 %6, %union.1* %16, align 32
  %17 = getelementptr inbounds %union.1, %union.1* %16, i1 0, i32 1
  %18 = bitcast [24 x %Nat8]* %17 to %AstNodeBindValue*
  %19 = load %AstNodeBindValue, %AstNodeBindValue* %18
  call void (%AstNodeBindValue) @func575 (%AstNodeBindValue %19)
  br label %select_1_end
select_1_2:
  %20 = bitcast %Int16 0 to %Int16
  %21 = icmp eq %Int16 %7, %20
  br i1 %21, label %select_1_2_ok, label %select_1_3
select_1_2_ok:
  %22 = alloca %union.1
  store %union.1 %6, %union.1* %22, align 32
  %23 = getelementptr inbounds %union.1, %union.1* %22, i1 0, i32 1
  %24 = bitcast [24 x %Nat8]* %23 to %AstNodeDeclValue*
  %25 = load %AstNodeDeclValue, %AstNodeDeclValue* %24
  call void (%AstNodeDeclValue) @func576 (%AstNodeDeclValue %25)
  br label %select_1_end
select_1_3:
  %26 = bitcast %Int16 5 to %Int16
  %27 = icmp eq %Int16 %7, %26
  br i1 %27, label %select_1_3_ok, label %select_1_4
select_1_3_ok:
  %28 = alloca %union.1
  store %union.1 %6, %union.1* %28, align 32
  %29 = getelementptr inbounds %union.1, %union.1* %28, i1 0, i32 1
  %30 = bitcast [24 x %Nat8]* %29 to %AstNodeImport*
  %31 = load %AstNodeImport, %AstNodeImport* %30
  call void (%AstNodeImport) @func572 (%AstNodeImport %31)
  br label %select_1_end
select_1_4:
  call void () @func571 ()
  br label %select_1_end
select_1_end:
  ret void
}

define %Assembly* @func569 (%AstModule) {
  %2 = alloca %List
  %3 = extractvalue %AstModule %0, 0
  store %List %3, %List* %2, align 8
  %4 = getelementptr inbounds %List, %List* %2, i1 0; loadImmPtr
  %5 = inttoptr i64 0 to%Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @func64 (%List* %4, %ListForeachHandler @func570, %Unit* %5)
  %6 = load %Int32, %Int32* @errcnt
  %7 = icmp sgt %Int32 %6, 0
  br i1 %7, label %then_0, label %else_0
then_0:; loadImmPtr
  %8 = inttoptr i64 0 to%Assembly*
  ret %Assembly* %8
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  ret %Assembly* @asm0
}

define void @func572 (%AstNodeImport) {
  %2 = extractvalue %AstNodeImport %0, 0
  %3 = call %Unit* (%List*, %Str) @map_get (%List* @imp_list, %Str %2); loadImmPtr
  %4 = inttoptr i64 0 to%Unit*
  %5 = icmp ne %Unit* %3, %4
  br i1 %5, label %then_0, label %else_0
then_0:
ret void
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  %7 = bitcast %List* @imp_list to %Unit*
  %8 = call i1 (%List*, %Str, %Unit*) @map_append (%List* @imp_list, %Str %2, %Unit* %7)
  %9 = bitcast [3 x %Nat8]* @func572_str1 to %Str
  %10 = call %Str (%Str, %Str) @cat (%Str %2, %Str %9)
  %11 = call i1 (%Str) @exists (%Str %10)
  br i1 %11, label %then_1, label %else_1
then_1:
  %12 = call %union.0 (%Str) @parse (%Str %10)
  %13 = extractvalue %union.0 %12, 0
  %14 = bitcast %Int16 0 to %Int16
  %15 = icmp eq %Int16 %13, %14
  br i1 %15, label %then_2, label %else_2
then_2:
  %16 = alloca %union.0
  store %union.0 %12, %union.0* %16, align 64
  %17 = getelementptr inbounds %union.0, %union.0* %16, i1 0, i32 1
  %18 = bitcast [40 x %Nat8]* %17 to %AstModule*
  %19 = load %AstModule, %AstModule* %18
  %20 = call %Assembly* (%AstModule) @func569 (%AstModule %19)
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
ret void
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  %22 = bitcast [10 x %Nat8]* @cfgLibraryVar to %Str
  %23 = call %Str (%Str) @getenv (%Str %22)
  %24 = bitcast [2 x %Nat8]* @func572_str2 to %Str
  %25 = bitcast [3 x %Nat8]* @func572_str3 to %Str
  %26 = call %Str (%Str, %Str, %Str, %Str) @cat4 (%Str %23, %Str %24, %Str %2, %Str %25)
  %27 = call i1 (%Str) @exists (%Str %26)
  br i1 %27, label %then_3, label %else_3
then_3:
  %28 = call %union.0 (%Str) @parse (%Str %26)
  %29 = extractvalue %union.0 %28, 0
  %30 = bitcast %Int16 0 to %Int16
  %31 = icmp eq %Int16 %29, %30
  br i1 %31, label %then_4, label %else_4
then_4:
  %32 = alloca %union.0
  store %union.0 %28, %union.0* %32, align 64
  %33 = getelementptr inbounds %union.0, %union.0* %32, i1 0, i32 1
  %34 = bitcast [40 x %Nat8]* %33 to %AstModule*
  %35 = load %AstModule, %AstModule* %34
  %36 = call %Assembly* (%AstModule) @func569 (%AstModule %35)
  br label %endif_4
else_4:
  br label %endif_4
endif_4:
ret void
  br label %endif_3
else_3:
  br label %endif_3
endif_3:
  %38 = bitcast [15 x %Nat8]* @func572_str4 to %Str
  %39 = extractvalue %AstNodeImport %0, 1
  call void (%Str, %TokenInfo*) @error (%Str %38, %TokenInfo* %39)
  ret void
}

define void @func573 (%AstNodeBindType) {
  %2 = extractvalue %AstNodeBindType %0, 0
  %3 = getelementptr inbounds %AstId, %AstId* %2, i1 0, i32 0
  %4 = load %Str, %Str* %3
  %5 = extractvalue %AstNodeBindType %0, 1
  %6 = call %Type* (%union.2*) @func413 (%union.2* %5)
  %7 = call %union.16 (%Str) @typeget (%Str %4)
  %8 = bitcast %Int64 0 to %Int64
  %9 = ptrtoint %union.16 %7 to %Int64
  %10 = icmp ne %Int64 %9, %8
  br i1 %10, label %then_0, label %else_0
then_0:
  %11 = bitcast %union.16 %7 to %Type*
  %12 = getelementptr inbounds %Type, %Type* %11, i1 0, i32 0
  %13 = load %TypeKind, %TypeKind* %12
  %14 = icmp ne %TypeKind %13, 1
  br i1 %14, label %then_1, label %else_1
then_1:
  %15 = bitcast [18 x %Nat8]* @func573_str1 to %Str
  %16 = extractvalue %AstNodeBindType %0, 2
  call void (%Str, %TokenInfo*) @error (%Str %15, %TokenInfo* %16)
ret void
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  %18 = getelementptr inbounds %Type, %Type* %6, i1 0, i32 2
  %19 = load %Str, %Str* %18; loadImmPtr
  %20 = inttoptr i64 0 to%Str
  %21 = icmp eq %Str %19, %20
  br i1 %21, label %then_2, label %else_2
then_2:
  %22 = getelementptr inbounds %Type, %Type* %6, i1 0, i32 2
  store %Str %4, %Str* %22, align 8
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
  %23 = bitcast %Type* %11 to %Unit*
  %24 = bitcast %Type* %6 to %Unit*
  %25 = call %Unit* (%Unit*, %Unit*, %Nat32) @memcpy (%Unit* %23, %Unit* %24, %Nat32 384)
  %26 = call %Definition* (%Assembly*, %Str, %Type*) @func258 (%Assembly* @asm0, %Str %4, %Type* %11)
ret void
  br label %endif_0
else_0:
  call void (%Str, %Type*) @typebind (%Str %4, %Type* %6)
  br label %endif_0
endif_0:
  %28 = call %Definition* (%Assembly*, %Str, %Type*) @func258 (%Assembly* @asm0, %Str %4, %Type* %6)
  %29 = getelementptr inbounds %Type, %Type* %6, i1 0, i32 2
  %30 = load %Str, %Str* %29; loadImmPtr
  %31 = inttoptr i64 0 to%Str
  %32 = icmp eq %Str %30, %31
  br i1 %32, label %then_3, label %else_3
then_3:
  %33 = getelementptr inbounds %Type, %Type* %6, i1 0, i32 2
  store %Str %4, %Str* %33, align 8
  br label %endif_3
else_3:
  br label %endif_3
endif_3:
  ret void
}

define %Value* @func574 (%Value*) {
  %2 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 0
  %3 = load %Type*, %Type** %2
  %4 = getelementptr inbounds %Type, %Type* %3, i1 0, i32 0
  %5 = load %TypeKind, %TypeKind* %4
  %6 = icmp eq %TypeKind %5, 8
  br i1 %6, label %then_0, label %else_0
then_0:
  %7 = call %Unit* (%Nat32) @malloc (%Nat32 384)
  %8 = bitcast %Unit* %7 to %Value*
  %9 = bitcast %Value* %8 to %Unit*
  %10 = bitcast %Value* %0 to %Unit*
  %11 = call %Unit* (%Unit*, %Unit*, %Nat32) @memcpy (%Unit* %9, %Unit* %10, %Nat32 384)
  %12 = getelementptr inbounds %Value, %Value* %8, i1 0, i32 0
  %13 = getelementptr inbounds %Value, %Value* %8, i1 0, i32 0
  %14 = load %Type*, %Type** %13
  %15 = getelementptr inbounds %Type, %Type* %14, i1 0, i32 13
  %16 = getelementptr inbounds %TypeVar, %TypeVar* %15, i1 0, i32 0
  %17 = load %Type*, %Type** %16
  store %Type* %17, %Type** %12, align 8
  ret %Value* %8
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  ret %Value* %0
}

define void @func575 (%AstNodeBindValue) {
  %2 = extractvalue %AstNodeBindValue %0, 0
  %3 = getelementptr inbounds %AstId, %AstId* %2, i1 0, i32 0
  %4 = load %Str, %Str* %3
  %5 = extractvalue %AstNodeBindValue %0, 1
  %6 = call %Value* (%union.4*, i1) @func477 (%union.4* %5, i1 0)
  %7 = call %Value* (%Value*) @func574 (%Value* %6)
  %8 = call %union.15 (%Str) @valget (%Str %4)
  %9 = bitcast %Int64 0 to %Int64
  %10 = ptrtoint %union.15 %8 to %Int64
  %11 = icmp ne %Int64 %10, %9
  br i1 %11, label %then_0, label %else_0
then_0:
  %12 = bitcast %union.15 %8 to %Value*
  %13 = getelementptr inbounds %Value, %Value* %12, i1 0, i32 1
  %14 = load %union.9, %union.9* %13
  %15 = extractvalue %union.9 %14, 0
  %16 = bitcast %Int16 39 to %Int16
  %17 = icmp ne %Int16 %15, %16
  br i1 %17, label %then_1, label %else_1
then_1:
  %18 = bitcast [19 x %Nat8]* @func575_str1 to %Str
  %19 = extractvalue %AstNodeBindValue %0, 2
  call void (%Str, %TokenInfo*) @error (%Str %18, %TokenInfo* %19)
ret void
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  %21 = bitcast %Value* %12 to %Unit*
  %22 = bitcast %Value* %7 to %Unit*
  %23 = call %Unit* (%Unit*, %Unit*, %Nat32) @memcpy (%Unit* %21, %Unit* %22, %Nat32 384)
ret void
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  call void (%Str, %Value*) @valbind (%Str %4, %Value* %7)
  %25 = getelementptr inbounds %Value, %Value* %7, i1 0, i32 0
  %26 = load %Type*, %Type** %25
  %27 = getelementptr inbounds %Type, %Type* %26, i1 0, i32 7
  %28 = getelementptr inbounds %TypeFunc, %TypeFunc* %27, i1 0, i32 2
  %29 = bitcast [7 x %Nat8]* @func575_str2 to %Str
  %30 = call %Int32 (%Str, %Str) @strcmp (%Str %29, %Str %4)
  %31 = icmp eq %Int32 %30, 0
  %32 = bitcast [6 x %Nat8]* @func575_str3 to %Str
  %33 = call %Int32 (%Str, %Str) @strcmp (%Str %32, %Str %4)
  %34 = icmp eq %Int32 %33, 0
  %35 = bitcast [7 x %Nat8]* @func575_str4 to %Str
  %36 = call %Int32 (%Str, %Str) @strcmp (%Str %35, %Str %4)
  %37 = icmp eq %Int32 %36, 0
  %38 = bitcast [8 x %Nat8]* @func575_str5 to %Str
  %39 = call %Int32 (%Str, %Str) @strcmp (%Str %38, %Str %4)
  %40 = icmp eq %Int32 %39, 0
  %41 = bitcast [8 x %Nat8]* @func575_str6 to %Str
  %42 = call %Int32 (%Str, %Str) @strcmp (%Str %41, %Str %4)
  %43 = icmp eq %Int32 %42, 0
  %44 = or i1 %40, %43
  %45 = or i1 %37, %44
  %46 = or i1 %34, %45
  %47 = or i1 %31, %46
  store i1 %47, i1* %28, align 1
  %48 = getelementptr inbounds %Value, %Value* %7, i1 0, i32 1
  %49 = load %union.9, %union.9* %48
  %50 = extractvalue %union.9 %49, 0
  %51 = bitcast %Int16 34 to %Int16
  %52 = icmp eq %Int16 %50, %51
  br i1 %52, label %then_2, label %else_2
then_2:
  %53 = getelementptr inbounds %Value, %Value* %7, i1 0, i32 1
  %54 = load %union.9, %union.9* %53
  %55 = alloca %union.9
  store %union.9 %54, %union.9* %55, align 128
  %56 = getelementptr inbounds %union.9, %union.9* %55, i1 0, i32 1
  %57 = bitcast [72 x %Nat8]* %56 to %ValueGlobalVar*
  %58 = load %ValueGlobalVar, %ValueGlobalVar* %57
  %59 = extractvalue %ValueGlobalVar %58, 1
  call void (%Definition*, %Str) @def_rename (%Definition* %59, %Str %4)
  br label %endif_2
else_2:
  %60 = getelementptr inbounds %Value, %Value* %7, i1 0, i32 1
  %61 = load %union.9, %union.9* %60
  %62 = extractvalue %union.9 %61, 0
  %63 = bitcast %Int16 33 to %Int16
  %64 = icmp eq %Int16 %62, %63
  br i1 %64, label %then_3, label %else_3
then_3:
  %65 = getelementptr inbounds %Value, %Value* %7, i1 0, i32 1
  %66 = load %union.9, %union.9* %65
  %67 = alloca %union.9
  store %union.9 %66, %union.9* %67, align 128
  %68 = getelementptr inbounds %union.9, %union.9* %67, i1 0, i32 1
  %69 = bitcast [72 x %Nat8]* %68 to %ValueGlobalConst*
  %70 = load %ValueGlobalConst, %ValueGlobalConst* %69
  %71 = extractvalue %ValueGlobalConst %70, 1
  call void (%Definition*, %Str) @def_rename (%Definition* %71, %Str %4)
  br label %endif_3
else_3:
  br label %endif_3
endif_3:
  br label %endif_2
endif_2:
  ret void
}

define void @func577 (%Unit*, %Unit*, %Nat32, %Node*) {
  %5 = bitcast %Unit* %0 to %AstId*
  %6 = bitcast %Unit* %1 to %Type*
  %7 = getelementptr inbounds %Type, %Type* %6, i1 0, i32 0
  %8 = load %TypeKind, %TypeKind* %7
  %9 = icmp eq %TypeKind %8, 1
  br i1 %9, label %then_0, label %else_0
then_0:
  %10 = bitcast [16 x %Nat8]* @func576_func577_str1 to %Str
  %11 = getelementptr inbounds %Type, %Type* %6, i1 0, i32 16
  %12 = load %TokenInfo*, %TokenInfo** %11
  call void (%Str, %TokenInfo*) @error (%Str %10, %TokenInfo* %12)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  call void (%AstId*, %Type*) @func578 (%AstId* %5, %Type* %6)
  ret void
}

define void @func576 (%AstNodeDeclValue) {
  %2 = extractvalue %AstNodeDeclValue %0, 0
  %3 = getelementptr inbounds %AstDecl, %AstDecl* %2, i1 0, i32 1
  %4 = load %union.2*, %union.2** %3
  %5 = call %Type* (%union.2*) @func413 (%union.2* %4)
  %6 = getelementptr inbounds %AstDecl, %AstDecl* %2, i1 0, i32 0
  %7 = bitcast %Type* %5 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @func64 (%List* %6, %ListForeachHandler @func577, %Unit* %7)
  ret void
}

define void @func578 (%AstId*, %Type*) {
  %3 = insertvalue %ValueUndefined zeroinitializer, %Type* %1, 0
  %4 = getelementptr inbounds %AstId, %AstId* %0, i1 0, i32 1
  %5 = load %TokenInfo*, %TokenInfo** %4
  %6 = insertvalue %ValueUndefined %3, %TokenInfo* %5, 1
  %7 = alloca %union.9
; write variant 39
  %8 = getelementptr inbounds %union.9, %union.9* %7, i1 0, i32 0
  store %Int16 39, %Int16* %8, align 2
; write data
  %9 = getelementptr inbounds %union.9, %union.9* %7, i1 0, i32 1
  %10 = bitcast [72 x %Nat8]* %9 to %ValueUndefined*
  store %ValueUndefined %6, %ValueUndefined* %10, align 8
  %11 = load %union.9, %union.9* %7
  %12 = getelementptr inbounds %AstId, %AstId* %0, i1 0, i32 1
  %13 = load %TokenInfo*, %TokenInfo** %12
  %14 = call %Value* (%union.9, %Type*, %TokenInfo*) @func455 (%union.9 %11, %Type* %1, %TokenInfo* %13)
  %15 = getelementptr inbounds %AstId, %AstId* %0, i1 0, i32 0
  %16 = load %Str, %Str* %15
  call void (%Str, %Value*) @valbind (%Str %16, %Value* %14)
  ret void
}

define %Int32 @main (%Nat32, %Str*) {
  %3 = bitcast [11 x %Nat8]* @func579_str1 to %Str
  %4 = call %Int32 (%Str, ...) @printf (%Str %3, %Int64 0, %Int64 5)
  %5 = bitcast [7 x %Nat8]* @func579_str2 to %Str
  %6 = call %union.0 (%Str) @parse (%Str %5)
  %7 = extractvalue %union.0 %6, 0
  %8 = bitcast %Int16 1 to %Int16
  %9 = icmp eq %Int16 %7, %8
  br i1 %9, label %then_0, label %else_0
then_0:
  %10 = load %Int32, %Int32* @errcnt
  ret %Int32 %10
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  call void () @compiler_init ()
  %12 = alloca %union.0
  store %union.0 %6, %union.0* %12, align 64
  %13 = getelementptr inbounds %union.0, %union.0* %12, i1 0, i32 1
  %14 = bitcast [40 x %Nat8]* %13 to %AstModule*
  %15 = load %AstModule, %AstModule* %14
  %16 = call %Assembly* (%AstModule) @func569 (%AstModule %15); loadImmPtr
  %17 = inttoptr i64 0 to%Assembly*
  %18 = icmp ne %Assembly* %16, %17
  br i1 %18, label %then_1, label %else_1
then_1:
  %19 = bitcast [11 x %Nat8]* @func579_str3 to %Str
  %20 = load %Nat32, %Nat32* @lines
  %21 = call %Int32 (%Str, ...) @printf (%Str %19, %Nat32 %20)
  %22 = bitcast [7 x %Nat8]* @func579_str4 to %Str
  call void (%Assembly*, %Str) @func271 (%Assembly* %16, %Str %22)
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  %23 = load %Int32, %Int32* @errcnt
  ret %Int32 %23
}

;aliases:


;metadata:
