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

%union.6 = type %Unit*

%union.7 = type %Unit*

%union.8 = type %Unit*

%union.9 = type %Unit*



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
%AstTypeEnum = type {%List}
%AstTypeRecord = type {%List}
%AstTypeArray = type {%AstType*, %AstValue*}
%AstTypeArrayU = type {%AstType*}
%AstTypePointer = type {%AstType*}
%AstTypeFunc = type {%AstType*, %AstType*, i1}
%AstTypeVar = type {%AstType*}
%AstTypeUnion = type {%List}
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
%AstValueFunc = type {%AstType*, %AstStmt*}
%AstValueCall = type {%AstValue*, %List}
%AstValueIndex = type {%AstValue*, %AstValue*}
%AstValueAccess = type {%AstValue*, %AstId*}
%AstValueCast = type {%AstValue*, %AstType*}
%AstValueIs = type {%AstValue*, %AstType*}
%AstValueAs = type {%AstValue*, %AstType*}
%AstValueSelectVariant = type {%AstValue*, %AstValue*}
%AstValueSelect = type {%AstValue*, %List, %AstValue*}
%AstValue = type {%AstValueKind, %Str, %AstName, [2 x %AstValue*], %AstType*, %AstValueFunc, %AstValueCall, %AstValueIndex, %AstValueAccess, %AstValueCast, %AstValueIs, %AstValueAs, %AstValueSelect, i1, %TokenInfo*}
%AstStmtKind = type i16
%AstStmtValueDef = type {%AstId*, %AstValue*}
%AstStmtTypeDef = type {%AstId*, %AstType*}
%AstStmtExpr = type {%AstValue*}
%AstStmtAssign = type {%AstValue*, %AstValue*}
%AstStmtBlock = type {%List}
%AstStmtIf = type {%AstValue*, %AstStmt*, %union.0}
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
%TypeUnion = type {%List, %Type*}
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
%ValueSelectVariant = type {%Value*, %Value*}
%ValueSelect = type {%Value*, %List, %Value*}
%Value = type {%ValueKind, %Type*, %Int64, %List, %Definition*, %Decl*, %Decl*, %Expr*, %ValueUn, %ValueBin, %ValueIndex, %ValueAccess, %ValueCast, %ValueAs, %ValueIs, %ValueCall, %Type*, %ValueSelect, %Value*, i1, %Str, %TokenInfo*}
%StmtKind = type i16
%Index = type {%List, %List}
%Block = type {%Block*, %Index, %List, %List, %TokenInfo*}
%Expr = type {%Value*, %Nat32}
%If = type {%Value*, %Stmt*, %union.1}
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
%DoStmt = type %union.2 (%AstStmt*)*
%Eval = type %LLVM_Value (%Value*)*
%Rule = type i1 (%Nat8)*
%AstTypeParser = type %AstType* ()*
%AstValueParser = type %AstValue* ()*
%AstStmtParser = type %union.3 (%TokenInfo*)*
%func305.type1 = type {[64 x %LLVM_Value], %Nat16}
%EvalCast = type %LLVM_Value (%LLVM_Value, %Type*)*
%func341.type2 = type {%LLVM_Value, %Nat32, %Nat32, [256 x %Nat32], %Type*}
%func401.type3 = type {%List*, i1}
%func401_func402.type4 = type {%List*, %Type*}
%func408.type5 = type {%List*, %Nat32}
%func431.type6 = type {%Value*, %Value*}
%func437.type7 = type {%Value*, %List*, %List*, %TokenInfo*}
%DoValueCast = type %Value* (%Value*, %Type*, %TokenInfo*)*
%func456.type8 = type {%Type*, %Nat32}

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
@func82_str8 = private unnamed_addr constant [14 x i8] c"<TypeUnknown>\00", align 1
@func83_str1 = private unnamed_addr constant [5 x i8] c"Var \00", align 1
@func84_str1 = private unnamed_addr constant [2 x i8] c"*\00", align 1
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
@func94_str36 = private unnamed_addr constant [13 x i8] c"#ValueSelect\00", align 1
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
@func165_str1 = private unnamed_addr constant [23 x i8] c"unexpected end-of-file\00", align 1
@func165_str2 = private unnamed_addr constant [16 x i8] c"too long token\0A\00", align 1
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
@func195_str1 = private unnamed_addr constant [29 x i8] c"lex::skipto not implemented\0A\00", align 1
@func195_str2 = private unnamed_addr constant [12 x i8] c"tok = '%s'\0A\00", align 1
@func195_str3 = private unnamed_addr constant [18 x i8] c"skip_target = %s\0A\00", align 1
@func198_str1 = private unnamed_addr constant [18 x i8] c"unexpected symbol\00", align 1
@func198_str2 = private unnamed_addr constant [13 x i8] c"expected %s\0A\00", align 1
@func199_str1 = private unnamed_addr constant [11 x i8] c"ast_id_new\00", align 1
@func200_str1 = private unnamed_addr constant [13 x i8] c"expected id1\00", align 1
@func201_str1 = private unnamed_addr constant [2 x i8] c".\00", align 1
@func202_str1 = private unnamed_addr constant [13 x i8] c"ast_node_new\00", align 1
@func203_str1 = private unnamed_addr constant [7 x i8] c"import\00", align 1
@func203_str2 = private unnamed_addr constant [8 x i8] c"arghack\00", align 1
@func203_str3 = private unnamed_addr constant [6 x i8] c"exist\00", align 1
@func203_str4 = private unnamed_addr constant [7 x i8] c"extern\00", align 1
@func205_str1 = private unnamed_addr constant [2 x i8] c"=\00", align 1
@func206_str1 = private unnamed_addr constant [2 x i8] c"=\00", align 1
@func207_str1 = private unnamed_addr constant [18 x i8] c"parse_type malloc\00", align 1
@func208_str1 = private unnamed_addr constant [3 x i8] c"->\00", align 1
@func209_str1 = private unnamed_addr constant [3 x i8] c"or\00", align 1
@func209_str2 = private unnamed_addr constant [3 x i8] c"or\00", align 1
@func210_str1 = private unnamed_addr constant [2 x i8] c"*\00", align 1
@func210_str2 = private unnamed_addr constant [2 x i8] c"[\00", align 1
@func210_str3 = private unnamed_addr constant [2 x i8] c"]\00", align 1
@func210_str4 = private unnamed_addr constant [2 x i8] c"]\00", align 1
@func211_str1 = private unnamed_addr constant [2 x i8] c"(\00", align 1
@func211_str2 = private unnamed_addr constant [2 x i8] c")\00", align 1
@func211_str3 = private unnamed_addr constant [2 x i8] c")\00", align 1
@func212_str1 = private unnamed_addr constant [2 x i8] c"{\00", align 1
@func212_str2 = private unnamed_addr constant [4 x i8] c"Var\00", align 1
@func213_str1 = private unnamed_addr constant [2 x i8] c"}\00", align 1
@func213_str2 = private unnamed_addr constant [2 x i8] c",\00", align 1
@func213_str3 = private unnamed_addr constant [2 x i8] c"}\00", align 1
@func214_str1 = private unnamed_addr constant [2 x i8] c")\00", align 1
@func214_str2 = private unnamed_addr constant [14 x i8] c"dofield error\00", align 1
@func214_str3 = private unnamed_addr constant [2 x i8] c",\00", align 1
@func215_str1 = private unnamed_addr constant [2 x i8] c"*\00", align 1
@func216_str1 = private unnamed_addr constant [2 x i8] c"[\00", align 1
@func216_str2 = private unnamed_addr constant [2 x i8] c"]\00", align 1
@func216_str3 = private unnamed_addr constant [2 x i8] c"]\00", align 1
@func217_str1 = private unnamed_addr constant [2 x i8] c",\00", align 1
@func217_str2 = private unnamed_addr constant [2 x i8] c":\00", align 1
@func218_str1 = private unnamed_addr constant [21 x i8] c"ast_value_new malloc\00", align 1
@func221_str1 = private unnamed_addr constant [3 x i8] c"or\00", align 1
@func222_str1 = private unnamed_addr constant [4 x i8] c"xor\00", align 1
@func223_str1 = private unnamed_addr constant [4 x i8] c"and\00", align 1
@func224_str1 = private unnamed_addr constant [3 x i8] c"==\00", align 1
@func224_str2 = private unnamed_addr constant [3 x i8] c"!=\00", align 1
@func225_str1 = private unnamed_addr constant [2 x i8] c"<\00", align 1
@func225_str2 = private unnamed_addr constant [2 x i8] c">\00", align 1
@func225_str3 = private unnamed_addr constant [3 x i8] c"<=\00", align 1
@func225_str4 = private unnamed_addr constant [3 x i8] c">=\00", align 1
@func226_str1 = private unnamed_addr constant [3 x i8] c"<<\00", align 1
@func226_str2 = private unnamed_addr constant [3 x i8] c">>\00", align 1
@func227_str1 = private unnamed_addr constant [2 x i8] c"+\00", align 1
@func227_str2 = private unnamed_addr constant [2 x i8] c"-\00", align 1
@func228_str1 = private unnamed_addr constant [2 x i8] c"*\00", align 1
@func228_str2 = private unnamed_addr constant [2 x i8] c"/\00", align 1
@func228_str3 = private unnamed_addr constant [2 x i8] c"%\00", align 1
@func229_str1 = private unnamed_addr constant [3 x i8] c"to\00", align 1
@func229_str2 = private unnamed_addr constant [3 x i8] c"is\00", align 1
@func229_str3 = private unnamed_addr constant [3 x i8] c"as\00", align 1
@func230_str1 = private unnamed_addr constant [2 x i8] c"*\00", align 1
@func230_str2 = private unnamed_addr constant [2 x i8] c"&\00", align 1
@func230_str3 = private unnamed_addr constant [4 x i8] c"not\00", align 1
@func230_str4 = private unnamed_addr constant [2 x i8] c"-\00", align 1
@func230_str5 = private unnamed_addr constant [2 x i8] c"+\00", align 1
@func230_str6 = private unnamed_addr constant [7 x i8] c"sizeof\00", align 1
@func230_str7 = private unnamed_addr constant [23 x i8] c"sizeof expected <type>\00", align 1
@func230_str8 = private unnamed_addr constant [8 x i8] c"alignof\00", align 1
@func230_str9 = private unnamed_addr constant [24 x i8] c"alignof expected <type>\00", align 1
@func231_str1 = private unnamed_addr constant [2 x i8] c"(\00", align 1
@func231_str2 = private unnamed_addr constant [2 x i8] c")\00", align 1
@func231_str3 = private unnamed_addr constant [3 x i8] c",)\00", align 1
@func231_str4 = private unnamed_addr constant [2 x i8] c",\00", align 1
@func231_str5 = private unnamed_addr constant [2 x i8] c")\00", align 1
@func231_str6 = private unnamed_addr constant [2 x i8] c")\00", align 1
@func231_str7 = private unnamed_addr constant [2 x i8] c",\00", align 1
@func231_str8 = private unnamed_addr constant [2 x i8] c"[\00", align 1
@func231_str9 = private unnamed_addr constant [2 x i8] c"]\00", align 1
@func231_str10 = private unnamed_addr constant [2 x i8] c".\00", align 1
@func232_str1 = private unnamed_addr constant [2 x i8] c"(\00", align 1
@func232_str2 = private unnamed_addr constant [2 x i8] c")\00", align 1
@func233_func234_str1 = private unnamed_addr constant [19 x i8] c"unexpected symbol\0A\00", align 1
@func233_func234_str2 = private unnamed_addr constant [14 x i8] c"received: %s\0A\00", align 1
@func233_func234_str3 = private unnamed_addr constant [9 x i8] c"bad term\00", align 1
@func235_str1 = private unnamed_addr constant [5 x i8] c"func\00", align 1
@func235_str2 = private unnamed_addr constant [7 x i8] c"extern\00", align 1
@func235_str3 = private unnamed_addr constant [6 x i8] c"array\00", align 1
@func235_str4 = private unnamed_addr constant [5 x i8] c"when\00", align 1
@func236_str1 = private unnamed_addr constant [2 x i8] c"{\00", align 1
@func236_str2 = private unnamed_addr constant [2 x i8] c"}\00", align 1
@func236_str3 = private unnamed_addr constant [5 x i8] c"else\00", align 1
@func236_str4 = private unnamed_addr constant [3 x i8] c"=>\00", align 1
@func236_str5 = private unnamed_addr constant [3 x i8] c"=>\00", align 1
@func239_str1 = private unnamed_addr constant [2 x i8] c"{\00", align 1
@func242_str1 = private unnamed_addr constant [21 x i8] c"ast_value_new malloc\00", align 1
@func245_str1 = private unnamed_addr constant [2 x i8] c"=\00", align 1
@func245_str2 = private unnamed_addr constant [2 x i8] c"_\00", align 1
@func245_func246_str1 = private unnamed_addr constant [2 x i8] c":\00", align 1
@func245_str3 = private unnamed_addr constant [4 x i8] c"let\00", align 1
@func245_str4 = private unnamed_addr constant [2 x i8] c"{\00", align 1
@func245_str5 = private unnamed_addr constant [3 x i8] c"if\00", align 1
@func245_str6 = private unnamed_addr constant [6 x i8] c"while\00", align 1
@func245_str7 = private unnamed_addr constant [7 x i8] c"return\00", align 1
@func245_str8 = private unnamed_addr constant [6 x i8] c"break\00", align 1
@func245_str9 = private unnamed_addr constant [9 x i8] c"continue\00", align 1
@func245_str10 = private unnamed_addr constant [5 x i8] c"type\00", align 1
@func245_str11 = private unnamed_addr constant [5 x i8] c"goto\00", align 1
@func247_str1 = private unnamed_addr constant [3 x i8] c":=\00", align 1
@func248_str1 = private unnamed_addr constant [2 x i8] c"=\00", align 1
@func249_str1 = private unnamed_addr constant [2 x i8] c"=\00", align 1
@func250_str1 = private unnamed_addr constant [2 x i8] c"}\00", align 1
@func250_str2 = private unnamed_addr constant [23 x i8] c"unexpected end-of-file\00", align 1
@func250_str3 = private unnamed_addr constant [2 x i8] c"}\00", align 1
@func251_str1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func251_str2 = private unnamed_addr constant [2 x i8] c"{\00", align 1
@func251_str3 = private unnamed_addr constant [5 x i8] c"else\00", align 1
@func251_str4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func251_str5 = private unnamed_addr constant [3 x i8] c"if\00", align 1
@func251_str6 = private unnamed_addr constant [2 x i8] c"{\00", align 1
@func252_str1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func252_str2 = private unnamed_addr constant [2 x i8] c"{\00", align 1
@func253_str1 = private unnamed_addr constant [27 x i8] c"expected return expression\00", align 1
@func257_str1 = private unnamed_addr constant [2 x i8] c",\00", align 1
@func257_str2 = private unnamed_addr constant [2 x i8] c":\00", align 1
@func258_str1 = private unnamed_addr constant [2 x i8] c")\00", align 1
@func259_str1 = private unnamed_addr constant [2 x i8] c"(\00", align 1
@func259_str2 = private unnamed_addr constant [2 x i8] c"[\00", align 1
@func259_str3 = private unnamed_addr constant [2 x i8] c"{\00", align 1
@func259_str4 = private unnamed_addr constant [2 x i8] c"*\00", align 1
@func261_func262_str1 = private unnamed_addr constant [38 x i8] c"e-m:o-i64:64-f80:128-n8:16:32:64-S128\00", align 1
@func261_func262_str2 = private unnamed_addr constant [27 x i8] c"x86_64-apple-macosx10.15.0\00", align 1
@func261_func263_str1 = private unnamed_addr constant [48 x i8] c"e-m:e-p:32:32-i64:64-v128:64:128-a:0:32-n32-S64\00", align 1
@func261_func263_str2 = private unnamed_addr constant [28 x i8] c"thumbv7em-unknown-none-eabi\00", align 1
@func265_str1 = private unnamed_addr constant [36 x i8] c"assembly::definition_new : x != nil\00", align 1
@func272_str1 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@func273_str1 = private unnamed_addr constant [4 x i8] c"\0A%s\00", align 1
@func274_str1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func275_str1 = private unnamed_addr constant [2 x i8] c" \00", align 1
@func276_str1 = private unnamed_addr constant [3 x i8] c", \00", align 1
@func279_str1 = private unnamed_addr constant [20 x i8] c"print_assembly: %s\0A\00", align 1
@func279_str2 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@func279_str3 = private unnamed_addr constant [26 x i8] c"cannot create output file\00", align 1
@func279_str4 = private unnamed_addr constant [16 x i8] c"; assembly: %s\0A\00", align 1
@func279_str5 = private unnamed_addr constant [27 x i8] c"; clang out2.ll && ./a.out\00", align 1
@func279_str6 = private unnamed_addr constant [44 x i8] c"; llc out2.ll ; for create .s file from .ll\00", align 1
@func279_str7 = private unnamed_addr constant [26 x i8] c"target datalayout = \22%s\22\0A\00", align 1
@func279_str8 = private unnamed_addr constant [22 x i8] c"target triple = \22%s\22\0A\00", align 1
@func279_str9 = private unnamed_addr constant [16 x i8] c"%Bool = type i1\00", align 1
@func279_str10 = private unnamed_addr constant [16 x i8] c"%Unit = type i1\00", align 1
@func279_str11 = private unnamed_addr constant [16 x i8] c"%Str = type i8*\00", align 1
@func279_str12 = private unnamed_addr constant [20 x i8] c"%Numeric = type i64\00", align 1
@func279_func280_str1 = private unnamed_addr constant [17 x i8] c"\0A%%%s = type i%d\00", align 1
@func279_str13 = private unnamed_addr constant [12 x i8] c"\0A; aliases:\00", align 1
@func279_func281_str1 = private unnamed_addr constant [14 x i8] c"\0A%%%s = type \00", align 1
@func279_func281_str2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func279_str14 = private unnamed_addr constant [11 x i8] c"\0A\0A;types:\0A\00", align 1
@func279_str15 = private unnamed_addr constant [13 x i8] c"\0A\0A;strings:\0A\00", align 1
@func279_str16 = private unnamed_addr constant [12 x i8] c"\0A\0A;arrays:\0A\00", align 1
@func279_str17 = private unnamed_addr constant [10 x i8] c"\0A\0A;vars:\0A\00", align 1
@func279_str18 = private unnamed_addr constant [11 x i8] c"\0A\0A;funcs:\0A\00", align 1
@func279_str19 = private unnamed_addr constant [13 x i8] c"\0A\0A;aliases:\0A\00", align 1
@func279_str20 = private unnamed_addr constant [14 x i8] c"\0A\0A;metadata:\0A\00", align 1
@func288_str1 = private unnamed_addr constant [14 x i8] c"\0A%%%s = type \00", align 1
@func289_str1 = private unnamed_addr constant [38 x i8] c"\0A@%s = private unnamed_addr constant \00", align 1
@func289_str2 = private unnamed_addr constant [3 x i8] c" [\00", align 1
@func289_str3 = private unnamed_addr constant [12 x i8] c"], align 16\00", align 1
@func291_str1 = private unnamed_addr constant [50 x i8] c"\0A@%s = private unnamed_addr constant [%d x i8] c\22\00", align 1
@func291_str2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func291_str3 = private unnamed_addr constant [2 x i8] c"\0D\00", align 1
@func291_str4 = private unnamed_addr constant [2 x i8] c"\09\00", align 1
@func291_str5 = private unnamed_addr constant [2 x i8] c"\0B\00", align 1
@func291_str6 = private unnamed_addr constant [2 x i8] c"\07\00", align 1
@func291_str7 = private unnamed_addr constant [2 x i8] c"\08\00", align 1
@func291_str8 = private unnamed_addr constant [2 x i8] c"\5C\00", align 1
@func291_str9 = private unnamed_addr constant [2 x i8] c"\22\00", align 1
@func291_str10 = private unnamed_addr constant [6 x i8] c"\5C%02X\00", align 1
@func291_str11 = private unnamed_addr constant [3 x i8] c"%c\00", align 1
@func291_str12 = private unnamed_addr constant [16 x i8] c"\5C%02d\22, align 1\00", align 1
@func292_str1 = private unnamed_addr constant [15 x i8] c"\0A@%s = global \00", align 1
@func292_str2 = private unnamed_addr constant [16 x i8] c"zeroinitializer\00", align 1
@func292_str3 = private unnamed_addr constant [29 x i8] c"expected constant init value\00", align 1
@func292_str4 = private unnamed_addr constant [16 x i8] c"zeroinitializer\00", align 1
@func293_str1 = private unnamed_addr constant [3 x i8] c"xx\00", align 1
@func293_str2 = private unnamed_addr constant [6 x i8] c"xx : \00", align 1
@func293_str3 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func293_str4 = private unnamed_addr constant [11 x i8] c"Maybe? %d\0A\00", align 1
@func293_str5 = private unnamed_addr constant [20 x i8] c"prn/funcdef t = nil\00", align 1
@func293_str6 = private unnamed_addr constant [9 x i8] c"\0Adeclare\00", align 1
@func293_str7 = private unnamed_addr constant [9 x i8] c"\0A\0Adefine\00", align 1
@func293_str8 = private unnamed_addr constant [5 x i8] c"void\00", align 1
@func293_str9 = private unnamed_addr constant [7 x i8] c" @%s (\00", align 1
@func293_str10 = private unnamed_addr constant [6 x i8] c", ...\00", align 1
@func293_str11 = private unnamed_addr constant [2 x i8] c")\00", align 1
@func293_str12 = private unnamed_addr constant [3 x i8] c" {\00", align 1
@func293_str13 = private unnamed_addr constant [12 x i8] c"\0A  ret void\00", align 1
@func293_str14 = private unnamed_addr constant [3 x i8] c"\0A}\00", align 1
@func295_str1 = private unnamed_addr constant [14 x i8] c"\0A@%s = alias \00", align 1
@func295_str2 = private unnamed_addr constant [6 x i8] c"* @%s\00", align 1
@func300_str1 = private unnamed_addr constant [14 x i8] c"\0A  %%%d = %s \00", align 1
@func301_str1 = private unnamed_addr constant [23 x i8] c"getelementptr inbounds\00", align 1
@func301_str2 = private unnamed_addr constant [3 x i8] c"* \00", align 1
@func302_str1 = private unnamed_addr constant [13 x i8] c"extractvalue\00", align 1
@func302_str2 = private unnamed_addr constant [5 x i8] c", %u\00", align 1
@func303_func304_str1 = private unnamed_addr constant [28 x i8] c"error eval #ValueUndefined\0A\00", align 1
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
@func322_func323_str1 = private unnamed_addr constant [24 x i8] c"\0A<invalid k %d in cast>\00", align 1
@func322_func323_str2 = private unnamed_addr constant [18 x i8] c"e.type.kind = %d\0A\00", align 1
@func322_func323_str3 = private unnamed_addr constant [19 x i8] c"eval_cast_to_basic\00", align 1
@func325_str1 = private unnamed_addr constant [9 x i8] c"ptrtoint\00", align 1
@func325_str2 = private unnamed_addr constant [8 x i8] c"icmp ne\00", align 1
@func325_str3 = private unnamed_addr constant [8 x i8] c"icmp eq\00", align 1
@func325_str4 = private unnamed_addr constant [8 x i8] c"icmp eq\00", align 1
@func326_str1 = private unnamed_addr constant [9 x i8] c"inttoptr\00", align 1
@func326_str2 = private unnamed_addr constant [9 x i8] c"inttoptr\00", align 1
@func326_str3 = private unnamed_addr constant [8 x i8] c"bitcast\00", align 1
@func327_func328_str1 = private unnamed_addr constant [18 x i8] c"eval_cast error:\0A\00", align 1
@func327_func328_str2 = private unnamed_addr constant [6 x i8] c" --> \00", align 1
@func327_func328_str3 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func327_func328_str4 = private unnamed_addr constant [16 x i8] c"eval_cast error\00", align 1
@func330_str1 = private unnamed_addr constant [4 x i8] c"add\00", align 1
@func330_str2 = private unnamed_addr constant [4 x i8] c"sub\00", align 1
@func330_str3 = private unnamed_addr constant [4 x i8] c"mul\00", align 1
@func330_func331_str1 = private unnamed_addr constant [5 x i8] c"sdiv\00", align 1
@func330_func331_str2 = private unnamed_addr constant [5 x i8] c"udiv\00", align 1
@func330_func332_str1 = private unnamed_addr constant [5 x i8] c"srem\00", align 1
@func330_func332_str2 = private unnamed_addr constant [5 x i8] c"urem\00", align 1
@func330_str4 = private unnamed_addr constant [3 x i8] c"or\00", align 1
@func330_str5 = private unnamed_addr constant [4 x i8] c"xor\00", align 1
@func330_str6 = private unnamed_addr constant [4 x i8] c"and\00", align 1
@func330_str7 = private unnamed_addr constant [8 x i8] c"icmp eq\00", align 1
@func330_str8 = private unnamed_addr constant [8 x i8] c"icmp ne\00", align 1
@func330_func333_str1 = private unnamed_addr constant [9 x i8] c"icmp slt\00", align 1
@func330_func333_str2 = private unnamed_addr constant [9 x i8] c"icmp ult\00", align 1
@func330_func334_str1 = private unnamed_addr constant [9 x i8] c"icmp sgt\00", align 1
@func330_func334_str2 = private unnamed_addr constant [9 x i8] c"icmp ugt\00", align 1
@func330_func335_str1 = private unnamed_addr constant [9 x i8] c"icmp sle\00", align 1
@func330_func335_str2 = private unnamed_addr constant [9 x i8] c"icmp ule\00", align 1
@func330_func336_str1 = private unnamed_addr constant [9 x i8] c"icmp sge\00", align 1
@func330_func336_str2 = private unnamed_addr constant [9 x i8] c"icmp uge\00", align 1
@func330_str9 = private unnamed_addr constant [4 x i8] c"shl\00", align 1
@func330_func337_str1 = private unnamed_addr constant [5 x i8] c"ashr\00", align 1
@func330_func337_str2 = private unnamed_addr constant [5 x i8] c"lshr\00", align 1
@func330_str10 = private unnamed_addr constant [27 x i8] c"<unknown-binary-operation>\00", align 1
@func338_str1 = private unnamed_addr constant [8 x i8] c"bitcast\00", align 1
@func339_str1 = private unnamed_addr constant [9 x i8] c"inttoptr\00", align 1
@func340_str1 = private unnamed_addr constant [8 x i8] c"bitcast\00", align 1
@func341_str1 = private unnamed_addr constant [26 x i8] c"\0A  br label %%select_%d_0\00", align 1
@func341_func342_str1 = private unnamed_addr constant [15 x i8] c"\0Aselect_%d_%d:\00", align 1
@func341_func342_str2 = private unnamed_addr constant [8 x i8] c"icmp eq\00", align 1
@func341_func342_str3 = private unnamed_addr constant [14 x i8] c"\0A  br i1 %%%d\00", align 1
@func341_func342_str4 = private unnamed_addr constant [48 x i8] c", label %%select_%d_%d_ok, label %%select_%d_%d\00", align 1
@func341_func342_str5 = private unnamed_addr constant [18 x i8] c"\0Aselect_%d_%d_ok:\00", align 1
@func341_func342_str6 = private unnamed_addr constant [28 x i8] c"\0A  br label %%select_%d_end\00", align 1
@func341_str2 = private unnamed_addr constant [15 x i8] c"\0Aselect_%d_%d:\00", align 1
@func341_str3 = private unnamed_addr constant [28 x i8] c"\0A  br label %%select_%d_end\00", align 1
@func341_str4 = private unnamed_addr constant [16 x i8] c"\0Aselect_%d_end:\00", align 1
@func341_str5 = private unnamed_addr constant [4 x i8] c"phi\00", align 1
@func341_str6 = private unnamed_addr constant [30 x i8] c"[ %%%d, %%select_%d_%d_ok ], \00", align 1
@func341_str7 = private unnamed_addr constant [25 x i8] c"[ %%%d, %%select_%d_%d ]\00", align 1
@func344_str1 = private unnamed_addr constant [10 x i8] c"\0A  store \00", align 1
@func344_str2 = private unnamed_addr constant [3 x i8] c"* \00", align 1
@func344_str3 = private unnamed_addr constant [11 x i8] c", align %d\00", align 1
@func345_str1 = private unnamed_addr constant [5 x i8] c"load\00", align 1
@func345_str2 = private unnamed_addr constant [3 x i8] c"* \00", align 1
@func346_str1 = private unnamed_addr constant [16 x i8] c"zeroinitializer\00", align 1
@func346_str2 = private unnamed_addr constant [16 x i8] c"zeroinitializer\00", align 1
@func346_str3 = private unnamed_addr constant [5 x i8] c"%llu\00", align 1
@func347_str1 = private unnamed_addr constant [5 x i8] c"%%%d\00", align 1
@func347_str2 = private unnamed_addr constant [5 x i8] c"%%%d\00", align 1
@func347_str3 = private unnamed_addr constant [4 x i8] c"@%s\00", align 1
@func347_str4 = private unnamed_addr constant [4 x i8] c"@%s\00", align 1
@func347_str5 = private unnamed_addr constant [5 x i8] c"%%%d\00", align 1
@func347_str6 = private unnamed_addr constant [32 x i8] c"<LLVM_ValueInvalid x.kind = %d>\00", align 1
@func349_str1 = private unnamed_addr constant [12 x i8] c"insertvalue\00", align 1
@func349_str2 = private unnamed_addr constant [9 x i8] c" undef, \00", align 1
@func350_str1 = private unnamed_addr constant [10 x i8] c"\0A;stmt%d:\00", align 1
@func350_str2 = private unnamed_addr constant [22 x i8] c"<print::stmt_unknown>\00", align 1
@func351_str1 = private unnamed_addr constant [7 x i8] c"alloca\00", align 1
@func353_str1 = private unnamed_addr constant [10 x i8] c"\0A  br i1 \00", align 1
@func353_str2 = private unnamed_addr constant [35 x i8] c", label %%then_%d, label %%else_%d\00", align 1
@func353_str3 = private unnamed_addr constant [10 x i8] c"\0Athen_%d:\00", align 1
@func353_str4 = private unnamed_addr constant [23 x i8] c"\0A  br label %%endif_%d\00", align 1
@func353_str5 = private unnamed_addr constant [10 x i8] c"\0Aelse_%d:\00", align 1
@func353_str6 = private unnamed_addr constant [23 x i8] c"\0A  br label %%endif_%d\00", align 1
@func353_str7 = private unnamed_addr constant [11 x i8] c"\0Aendif_%d:\00", align 1
@func354_str1 = private unnamed_addr constant [26 x i8] c"\0A  br label %%continue_%d\00", align 1
@func354_str2 = private unnamed_addr constant [14 x i8] c"\0Acontinue_%d:\00", align 1
@func354_str3 = private unnamed_addr constant [10 x i8] c"\0A  br i1 \00", align 1
@func354_str4 = private unnamed_addr constant [36 x i8] c", label %%body_%d, label %%break_%d\00", align 1
@func354_str5 = private unnamed_addr constant [10 x i8] c"\0Abody_%d:\00", align 1
@func354_str6 = private unnamed_addr constant [26 x i8] c"\0A  br label %%continue_%d\00", align 1
@func354_str7 = private unnamed_addr constant [11 x i8] c"\0Abreak_%d:\00", align 1
@func355_str1 = private unnamed_addr constant [10 x i8] c"\0Aret void\00", align 1
@func355_str2 = private unnamed_addr constant [8 x i8] c"\0A  ret \00", align 1
@func356_str1 = private unnamed_addr constant [23 x i8] c"\0A  br label %%break_%d\00", align 1
@func357_str1 = private unnamed_addr constant [26 x i8] c"\0A  br label %%continue_%d\00", align 1
@func358_str1 = private unnamed_addr constant [17 x i8] c"\0A  br label %%%s\00", align 1
@func359_str1 = private unnamed_addr constant [17 x i8] c"\0A  br label %%%s\00", align 1
@func359_str2 = private unnamed_addr constant [5 x i8] c"\0A%s:\00", align 1
@func362_str1 = private unnamed_addr constant [26 x i8] c"prn/printType :: t = nil\0A\00", align 1
@func362_str2 = private unnamed_addr constant [5 x i8] c"%%%s\00", align 1
@func362_str3 = private unnamed_addr constant [5 x i8] c"%%%s\00", align 1
@func362_str4 = private unnamed_addr constant [4 x i8] c"i%d\00", align 1
@func362_str5 = private unnamed_addr constant [3 x i8] c"i1\00", align 1
@func362_str6 = private unnamed_addr constant [5 x i8] c"%%%s\00", align 1
@func362_func364_str1 = private unnamed_addr constant [20 x i8] c"<type-unknown-kind>\00", align 1
@func362_func364_str2 = private unnamed_addr constant [18 x i8] c"unk type kind %d\0A\00", align 1
@func366_str1 = private unnamed_addr constant [2 x i8] c"{\00", align 1
@func366_str2 = private unnamed_addr constant [2 x i8] c"}\00", align 1
@func368_str1 = private unnamed_addr constant [7 x i8] c"[%d x \00", align 1
@func368_str2 = private unnamed_addr constant [2 x i8] c"]\00", align 1
@func369_str1 = private unnamed_addr constant [2 x i8] c"*\00", align 1
@func370_str1 = private unnamed_addr constant [2 x i8] c"*\00", align 1
@func371_str1 = private unnamed_addr constant [5 x i8] c"void\00", align 1
@func371_str2 = private unnamed_addr constant [3 x i8] c" (\00", align 1
@func371_str3 = private unnamed_addr constant [6 x i8] c", ...\00", align 1
@func371_str4 = private unnamed_addr constant [2 x i8] c")\00", align 1
@func371_str5 = private unnamed_addr constant [2 x i8] c"*\00", align 1
@func373_str1 = private unnamed_addr constant [9 x i8] c"type_new\00", align 1
@func400_str1 = private unnamed_addr constant [20 x i8] c"alignment : align=0\00", align 1
@func401_func402_str1 = private unnamed_addr constant [14 x i8] c"unknown type3\00", align 1
@func401_func402_func403_func404_str1 = private unnamed_addr constant [10 x i8] c"field_new\00", align 1
@func401_func405_str1 = private unnamed_addr constant [15 x i8] c"undefined type\00", align 1
@func401_func405_str2 = private unnamed_addr constant [11 x i8] c"align 0 in\00", align 1
@func408_str1 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@func408_str2 = private unnamed_addr constant [7 x i8] c"union.\00", align 1
@func408_str3 = private unnamed_addr constant [11 x i8] c"Not maybe\0A\00", align 1
@func408_str4 = private unnamed_addr constant [10 x i8] c"field_new\00", align 1
@func408_str5 = private unnamed_addr constant [6 x i8] c"Nat16\00", align 1
@func408_str6 = private unnamed_addr constant [5 x i8] c"Nat8\00", align 1
@func408_str7 = private unnamed_addr constant [10 x i8] c"field_new\00", align 1
@func419_str1 = private unnamed_addr constant [5 x i8] c"Void\00", align 1
@func419_str2 = private unnamed_addr constant [5 x i8] c"Void\00", align 1
@func419_str3 = private unnamed_addr constant [5 x i8] c"Unit\00", align 1
@func419_str4 = private unnamed_addr constant [5 x i8] c"Unit\00", align 1
@func419_str5 = private unnamed_addr constant [5 x i8] c"Bool\00", align 1
@func419_str6 = private unnamed_addr constant [5 x i8] c"Int8\00", align 1
@func419_str7 = private unnamed_addr constant [6 x i8] c"Int16\00", align 1
@func419_str8 = private unnamed_addr constant [6 x i8] c"Int32\00", align 1
@func419_str9 = private unnamed_addr constant [6 x i8] c"Int64\00", align 1
@func419_str10 = private unnamed_addr constant [7 x i8] c"Int128\00", align 1
@func419_str11 = private unnamed_addr constant [7 x i8] c"Int256\00", align 1
@func419_str12 = private unnamed_addr constant [7 x i8] c"Int512\00", align 1
@func419_str13 = private unnamed_addr constant [8 x i8] c"Int1024\00", align 1
@func419_str14 = private unnamed_addr constant [5 x i8] c"Nat8\00", align 1
@func419_str15 = private unnamed_addr constant [6 x i8] c"Nat16\00", align 1
@func419_str16 = private unnamed_addr constant [6 x i8] c"Nat32\00", align 1
@func419_str17 = private unnamed_addr constant [6 x i8] c"Nat64\00", align 1
@func419_str18 = private unnamed_addr constant [7 x i8] c"Nat128\00", align 1
@func419_str19 = private unnamed_addr constant [7 x i8] c"Nat256\00", align 1
@func419_str20 = private unnamed_addr constant [7 x i8] c"Nat512\00", align 1
@func419_str21 = private unnamed_addr constant [8 x i8] c"Nat1024\00", align 1
@func419_str22 = private unnamed_addr constant [6 x i8] c"Int64\00", align 1
@func419_str23 = private unnamed_addr constant [6 x i8] c"Nat64\00", align 1
@func419_str24 = private unnamed_addr constant [6 x i8] c"Int32\00", align 1
@func419_str25 = private unnamed_addr constant [6 x i8] c"Nat32\00", align 1
@func419_str26 = private unnamed_addr constant [5 x i8] c"Int8\00", align 1
@func419_str27 = private unnamed_addr constant [5 x i8] c"Nat8\00", align 1
@func419_str28 = private unnamed_addr constant [6 x i8] c"Int16\00", align 1
@func419_str29 = private unnamed_addr constant [6 x i8] c"Nat16\00", align 1
@func419_str30 = private unnamed_addr constant [4 x i8] c"Str\00", align 1
@func419_str31 = private unnamed_addr constant [4 x i8] c"Str\00", align 1
@func419_str32 = private unnamed_addr constant [7 x i8] c"Int128\00", align 1
@func419_str33 = private unnamed_addr constant [7 x i8] c"Int256\00", align 1
@func419_str34 = private unnamed_addr constant [7 x i8] c"Int512\00", align 1
@func419_str35 = private unnamed_addr constant [8 x i8] c"Int1024\00", align 1
@func419_str36 = private unnamed_addr constant [7 x i8] c"Nat128\00", align 1
@func419_str37 = private unnamed_addr constant [7 x i8] c"Nat256\00", align 1
@func419_str38 = private unnamed_addr constant [7 x i8] c"Nat512\00", align 1
@func419_str39 = private unnamed_addr constant [8 x i8] c"Nat1024\00", align 1
@func419_str40 = private unnamed_addr constant [8 x i8] c"Numeric\00", align 1
@func419_func421_str1 = private unnamed_addr constant [27 x i8] c"unsupported cfgIntegerSize\00", align 1
@func423_str1 = private unnamed_addr constant [21 x i8] c"value_new : v != nil\00", align 1
@func424_str1 = private unnamed_addr constant [21 x i8] c"value_new : v != nil\00", align 1
@func429_str1 = private unnamed_addr constant [20 x i8] c"do_value : v == nil\00", align 1
@func430_str1 = private unnamed_addr constant [19 x i8] c"do_value_forbidden\00", align 1
@func430_str2 = private unnamed_addr constant [6 x i8] c"stop.\00", align 1
@func431_str1 = private unnamed_addr constant [25 x i8] c"expected 'other' variant\00", align 1
@func434_str1 = private unnamed_addr constant [17 x i8] c"expected pointer\00", align 1
@func435_str1 = private unnamed_addr constant [18 x i8] c"binary type error\00", align 1
@func437_func438_str1 = private unnamed_addr constant [21 x i8] c"not enough arguments\00", align 1
@func437_func438_str2 = private unnamed_addr constant [16 x i8] c"excess argument\00", align 1
@func441_str1 = private unnamed_addr constant [16 x i8] c"undefined field\00", align 1
@func444_str1 = private unnamed_addr constant [16 x i8] c"type cast error\00", align 1
@func445_str1 = private unnamed_addr constant [16 x i8] c"type cast error\00", align 1
@func447_str1 = private unnamed_addr constant [16 x i8] c"type cast error\00", align 1
@func448_str1 = private unnamed_addr constant [16 x i8] c"type cast error\00", align 1
@func449_str1 = private unnamed_addr constant [16 x i8] c"type cast error\00", align 1
@func451_str1 = private unnamed_addr constant [16 x i8] c"type cast error\00", align 1
@func452_str1 = private unnamed_addr constant [16 x i8] c"type cast error\00", align 1
@func454_str1 = private unnamed_addr constant [18 x i8] c"cast to same type\00", align 1
@func454_func455_str1 = private unnamed_addr constant [18 x i8] c"do_value_cast unk\00", align 1
@func456_str1 = private unnamed_addr constant [20 x i8] c"expected maybe type\00", align 1
@func456_str2 = private unnamed_addr constant [11 x i8] c"type error\00", align 1
@func458_str1 = private unnamed_addr constant [21 x i8] c"expected maybe value\00", align 1
@func458_str2 = private unnamed_addr constant [11 x i8] c"type error\00", align 1
@func459_str1 = private unnamed_addr constant [20 x i8] c"sizeof unknown type\00", align 1
@func460_str1 = private unnamed_addr constant [21 x i8] c"alignof unknown type\00", align 1
@func461_str1 = private unnamed_addr constant [15 x i8] c"unknown value\0A\00", align 1
@func462_str1 = private unnamed_addr constant [2 x i8] c"0\00", align 1
@func462_str2 = private unnamed_addr constant [2 x i8] c"x\00", align 1
@func462_str3 = private unnamed_addr constant [5 x i8] c"%llx\00", align 1
@func462_str4 = private unnamed_addr constant [5 x i8] c"%lld\00", align 1
@func464_str1 = private unnamed_addr constant [5 x i8] c"func\00", align 1
@func464_str2 = private unnamed_addr constant [2 x i8] c"_\00", align 1
@func473_str1 = private unnamed_addr constant [32 x i8] c"приведение юнион\00", align 1
@func476_str1 = private unnamed_addr constant [29 x i8] c"implicit_cast::v.type == nil\00", align 1
@func476_str2 = private unnamed_addr constant [24 x i8] c"implicit_cast::t == nil\00", align 1
@func476_str3 = private unnamed_addr constant [14 x i8] c"type overflow\00", align 1
@func484_str1 = private unnamed_addr constant [6 x i8] c"false\00", align 1
@func484_str2 = private unnamed_addr constant [5 x i8] c"true\00", align 1
@func484_str3 = private unnamed_addr constant [4 x i8] c"nil\00", align 1
@func484_str4 = private unnamed_addr constant [5 x i8] c"unit\00", align 1
@func485_str1 = private unnamed_addr constant [9 x i8] c"stmt_new\00", align 1
@func488_str1 = private unnamed_addr constant [16 x i8] c"expected lvalue\00", align 1
@func488_str2 = private unnamed_addr constant [13 x i8] c"invalid lval\00", align 1
@func496_str1 = private unnamed_addr constant [21 x i8] c"missing return value\00", align 1
@func500_str1 = private unnamed_addr constant [34 x i8] c"`break` outside any loop operator\00", align 1
@func501_str1 = private unnamed_addr constant [34 x i8] c"`break` outside any loop operator\00", align 1
@func505_str1 = private unnamed_addr constant [4 x i8] c"##\0A\00", align 1
@func505_str2 = private unnamed_addr constant [7 x i8] c"<name>\00", align 1
@func509_str1 = private unnamed_addr constant [3 x i8] c".m\00", align 1
@func509_str2 = private unnamed_addr constant [2 x i8] c"/\00", align 1
@func509_str3 = private unnamed_addr constant [3 x i8] c".m\00", align 1
@func509_str4 = private unnamed_addr constant [15 x i8] c"unknown import\00", align 1
@func510_str1 = private unnamed_addr constant [18 x i8] c"type redefination\00", align 1
@func512_str1 = private unnamed_addr constant [19 x i8] c"value redefination\00", align 1
@func512_str2 = private unnamed_addr constant [7 x i8] c"printf\00", align 1
@func512_str3 = private unnamed_addr constant [6 x i8] c"scanf\00", align 1
@func512_str4 = private unnamed_addr constant [7 x i8] c"sscanf\00", align 1
@func512_str5 = private unnamed_addr constant [8 x i8] c"sprintf\00", align 1
@func512_str6 = private unnamed_addr constant [8 x i8] c"fprintf\00", align 1
@func513_func514_str1 = private unnamed_addr constant [15 x i8] c"undefined type\00", align 1
@func520_str1 = private unnamed_addr constant [11 x i8] c"m2 v%d.%d\0A\00", align 1
@func520_str2 = private unnamed_addr constant [7 x i8] c"main.m\00", align 1
@func520_str3 = private unnamed_addr constant [11 x i8] c"lines: %d\0A\00", align 1
@func520_str4 = private unnamed_addr constant [7 x i8] c"out.ll\00", align 1

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

define %Node* @node_get (%Node*, %Nat32) {
;stmt0:
  %3 = alloca %Nat32
  store %Nat32 0, %Nat32* %3, align 4
;stmt1:
  %4 = icmp eq %Node* %0, zeroinitializer
  br i1 %4, label %then_0, label %else_0
then_0:
;stmt2:
  ret %Node* zeroinitializer
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt3:
  %6 = alloca %Node*
  store %Node* %0, %Node** %6, align 8
;stmt4:
  br label %continue_0
continue_0:
  %7 = load %Nat32, %Nat32* %3
  %8 = icmp ult %Nat32 %7, %1
  br i1 %8, label %body_0, label %break_0
body_0:
;stmt5:
  %9 = load %Node*, %Node** %6
  %10 = getelementptr inbounds %Node, %Node* %9, i1 0, i32 1
  %11 = load %Node*, %Node** %10
  %12 = icmp eq %Node* %11, zeroinitializer
  br i1 %12, label %then_1, label %else_1
then_1:
;stmt6:
  ret %Node* zeroinitializer
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt7:
  %14 = load %Node*, %Node** %6
  %15 = getelementptr inbounds %Node, %Node* %14, i1 0, i32 1
  %16 = load %Node*, %Node** %15
  store %Node* %16, %Node** %6, align 8
;stmt8:
  %17 = load %Nat32, %Nat32* %3
  %18 = add %Nat32 %17, 1
  store %Nat32 %18, %Nat32* %3, align 4
  br label %continue_0
break_0:
;stmt9:
  %19 = load %Node*, %Node** %6
  ret %Node* %19
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
;stmt0:
  %3 = icmp eq %List* %0, zeroinitializer
  %4 = icmp eq %Node* %1, zeroinitializer
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
  %7 = getelementptr inbounds %List, %List* %0, i1 0, i32 0
  %8 = load %Node*, %Node** %7
  %9 = icmp eq %Node* %8, zeroinitializer
  br i1 %9, label %then_1, label %else_1
then_1:
;stmt3:
  %10 = getelementptr inbounds %List, %List* %0, i1 0, i32 0
  store %Node* %1, %Node** %10, align 8
  br label %endif_1
else_1:
;stmt4:
  %11 = getelementptr inbounds %List, %List* %0, i1 0, i32 1
  %12 = load %Node*, %Node** %11
  call void (%Node*, %Node*) @node_append (%Node* %12, %Node* %1)
  br label %endif_1
endif_1:
;stmt5:
  %13 = getelementptr inbounds %List, %List* %0, i1 0, i32 1
  store %Node* %1, %Node** %13, align 8
;stmt6:
  %14 = getelementptr inbounds %List, %List* %0, i1 0, i32 2
  %15 = getelementptr inbounds %List, %List* %0, i1 0, i32 2
  %16 = load %Nat64, %Nat64* %15
  %17 = add %Nat64 %16, 1
  store %Nat64 %17, %Nat64* %14, align 8
;stmt7:
  ret i1 1
}

define %Unit* @list_get (%List*, %Nat32) {
;stmt0:
  %3 = getelementptr inbounds %List, %List* %0, i1 0, i32 0
  %4 = load %Node*, %Node** %3
  %5 = call %Node* (%Node*, %Nat32) @node_get (%Node* %4, %Nat32 %1)
;stmt1:
  %6 = icmp eq %Node* %5, zeroinitializer
  br i1 %6, label %then_0, label %else_0
then_0:
;stmt2:
  ret %Unit* zeroinitializer
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt3:
  %8 = getelementptr inbounds %Node, %Node* %5, i1 0, i32 3
  %9 = load %Unit*, %Unit** %8
  ret %Unit* %9
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
  %7 = getelementptr inbounds %List, %List* %0, i1 0, i32 3
  %8 = load %Nat32, %Nat32* %7
  %9 = call %Node* (%Nat32) @node_new (%Nat32 %8)
;stmt3:
  %10 = getelementptr inbounds %Node, %Node* %9, i1 0, i32 3
  store %Unit* %1, %Unit** %10, align 8
;stmt4:
  %11 = call i1 (%List*, %Node*) @list_append_node (%List* %0, %Node* %9)
  ret i1 %11
}

define %Unit* @list_append_extra (%List*, %Nat32) {
;stmt0:
  %3 = icmp eq %List* %0, zeroinitializer
  br i1 %3, label %then_0, label %else_0
then_0:
;stmt1:
  ret %Unit* zeroinitializer
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt2:
  %5 = call %Node* (%Nat32) @node_new (%Nat32 %1)
;stmt3:
  %6 = ptrtoint %Node* %5 to %Nat32
  %7 = add %Nat32 %6, 32
  %8 = inttoptr %Nat32 %7 to %Unit*
;stmt4:
  %9 = getelementptr inbounds %Node, %Node* %5, i1 0, i32 3
  store %Unit* %8, %Unit** %9, align 8
;stmt5:
  %10 = getelementptr inbounds %List, %List* %0, i1 0, i32 0
  %11 = load %Node*, %Node** %10
  %12 = icmp eq %Node* %11, zeroinitializer
  br i1 %12, label %then_1, label %else_1
then_1:
;stmt6:
  %13 = getelementptr inbounds %List, %List* %0, i1 0, i32 0
  store %Node* %5, %Node** %13, align 8
  br label %endif_1
else_1:
;stmt7:
  %14 = getelementptr inbounds %List, %List* %0, i1 0, i32 1
  %15 = load %Node*, %Node** %14
  call void (%Node*, %Node*) @node_append (%Node* %15, %Node* %5)
  br label %endif_1
endif_1:
;stmt8:
  %16 = getelementptr inbounds %List, %List* %0, i1 0, i32 1
  store %Node* %5, %Node** %16, align 8
;stmt9:
  %17 = getelementptr inbounds %List, %List* %0, i1 0, i32 2
  %18 = getelementptr inbounds %List, %List* %0, i1 0, i32 2
  %19 = load %Nat64, %Nat64* %18
  %20 = add %Nat64 %19, 1
  store %Nat64 %20, %Nat64* %17, align 8
;stmt10:
  ret %Unit* %8
}

define void @func60 (%Unit*, %Unit*, %Nat32, %Node*) {
;stmt0:
  %5 = bitcast %Unit* %1 to %List*
;stmt1:
  %6 = call i1 (%List*, %Unit*) @list_append (%List* %5, %Unit* %0)
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
  call void (%List*, %ListForeachHandler, %Unit*) @func64 (%List* %1, %ListForeachHandler @func60, %Unit* %7)
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
  %8 = load %Node*, %Node** %5
  %9 = icmp ne %Node* %8, zeroinitializer
  br i1 %9, label %body_0, label %break_0
body_0:
;stmt3:
  %10 = load %Node*, %Node** %5
  %11 = getelementptr inbounds %Node, %Node* %10, i1 0, i32 3
  %12 = load %Unit*, %Unit** %11
  %13 = load %Nat32, %Nat32* %4
  %14 = load %Node*, %Node** %5
  call void (%Unit*, %Unit*, %Nat32, %Node*) %1 (%Unit* %12, %Unit* %2, %Nat32 %13, %Node* %14)
;stmt4:
  %15 = load %Node*, %Node** %5
  %16 = getelementptr inbounds %Node, %Node* %15, i1 0, i32 1
  %17 = load %Node*, %Node** %16
  store %Node* %17, %Node** %5, align 8
;stmt5:
  %18 = load %Nat32, %Nat32* %4
  %19 = add %Nat32 %18, 1
  store %Nat32 %19, %Nat32* %4, align 4
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

define void @func78 (%Unit*, %Unit*, %Unit*) {
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
  call void (%List*, %MapForeachHandler, %Unit*) @map_foreach (%List* %1, %MapForeachHandler @func78, %Unit* %7)
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

define void @func81 (%Type*) {
;stmt0:
  call void (%Type*, %Type*) @func82 (%Type* %0, %Type* zeroinitializer)
  ret void
}

define void @func82 (%Type*, %Type*) {
;stmt0:
  %3 = icmp eq %Type* %0, zeroinitializer
  br i1 %3, label %then_0, label %else_0
then_0:
;stmt1:
  %4 = bitcast [6 x %Nat8]* @func82_str1 to %Str
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
  %10 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 0
  %11 = load %TypeKind, %TypeKind* %10
  %12 = icmp ne %TypeKind %11, 13
  br i1 %12, label %then_2, label %else_2
then_2:
;stmt5:
  %13 = bitcast [3 x %Nat8]* @func82_str2 to %Str
  %14 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 1
  %15 = load %Str, %Str* %14
  %16 = call %Int32 (%Str, ...) @printf (%Str %13, %Str %15)
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
  %18 = icmp eq %Type* %0, %1
  br i1 %18, label %then_3, label %else_3
then_3:
;stmt8:
  %19 = bitcast [5 x %Nat8]* @func82_str3 to %Str
  %20 = call %Int32 (%Str, ...) @printf (%Str %19)
;stmt9:
ret void
  br label %endif_3
else_3:
  br label %endif_3
endif_3:
;stmt10:
  %22 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 0
  %23 = load %TypeKind, %TypeKind* %22
  br label %select_1_0
select_1_0:
  %24 = icmp eq %TypeKind %23, 4
  br i1 %24, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %25 = bitcast [14 x %Nat8]* @func82_str4 to %Str
  %26 = call %Int32 (%Str, ...) @printf (%Str %25)
  br label %select_1_end
select_1_1:
  %27 = icmp eq %TypeKind %23, 5
  br i1 %27, label %select_1_1_ok, label %select_1_2
select_1_1_ok:
  %28 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 11
  call void (%TypeVar*) @func83 (%TypeVar* %28)
  br label %select_1_end
select_1_2:
  %29 = icmp eq %TypeKind %23, 10
  br i1 %29, label %select_1_2_ok, label %select_1_3
select_1_2_ok:
  %30 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 6
  call void (%TypePointer*, %Type*) @func84 (%TypePointer* %30, %Type* %1)
  br label %select_1_end
select_1_3:
  %31 = icmp eq %TypeKind %23, 11
  br i1 %31, label %select_1_3_ok, label %select_1_4
select_1_3_ok:
  call void (%Type*, %Type*) @func89 (%Type* %0, %Type* %0)
  br label %select_1_end
select_1_4:
  %32 = icmp eq %TypeKind %23, 12
  br i1 %32, label %select_1_4_ok, label %select_1_5
select_1_4_ok:
  call void (%Type*, %Type*) @func90 (%Type* %0, %Type* %0)
  br label %select_1_end
select_1_5:
  %33 = icmp eq %TypeKind %23, 9
  br i1 %33, label %select_1_5_ok, label %select_1_6
select_1_5_ok:
  call void (%Type*) @func85 (%Type* %0)
  br label %select_1_end
select_1_6:
  %34 = icmp eq %TypeKind %23, 6
  br i1 %34, label %select_1_6_ok, label %select_1_7
select_1_6_ok:
  %35 = bitcast [5 x %Nat8]* @func82_str5 to %Str
  %36 = call %Int32 (%Str, ...) @printf (%Str %35)
  br label %select_1_end
select_1_7:
  %37 = icmp eq %TypeKind %23, 8
  br i1 %37, label %select_1_7_ok, label %select_1_8
select_1_7_ok:
  call void (%Type*) @func87 (%Type* %0)
  br label %select_1_end
select_1_8:
  %38 = icmp eq %TypeKind %23, 7
  br i1 %38, label %select_1_8_ok, label %select_1_9
select_1_8_ok:
  %39 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 5
  call void (%TypeFunc*) @func91 (%TypeFunc* %39)
  br label %select_1_end
select_1_9:
  %40 = icmp eq %TypeKind %23, 2
  br i1 %40, label %select_1_9_ok, label %select_1_10
select_1_9_ok:
  %41 = bitcast [13 x %Nat8]* @func82_str6 to %Str
  %42 = call %Int32 (%Str, ...) @printf (%Str %41)
  br label %select_1_end
select_1_10:
  %43 = icmp eq %TypeKind %23, 0
  br i1 %43, label %select_1_10_ok, label %select_1_11
select_1_10_ok:
  %44 = bitcast [16 x %Nat8]* @func82_str7 to %Str
  %45 = call %Int32 (%Str, ...) @printf (%Str %44)
  br label %select_1_end
select_1_11:
  %46 = icmp eq %TypeKind %23, 13
  br i1 %46, label %select_1_11_ok, label %select_1_12
select_1_11_ok:
  %47 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 12
  call void (%TypeUnion*) @func92 (%TypeUnion* %47)
  br label %select_1_end
select_1_12:
  %48 = bitcast [14 x %Nat8]* @func82_str8 to %Str
  %49 = call %Int32 (%Str, ...) @printf (%Str %48)
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
  call void (%Type*, %Type*) @func82 (%Type* %6, %Type* %1)
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
  %4 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 9
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
  %4 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 10
  %5 = getelementptr inbounds %TypeEnum, %TypeEnum* %4, i1 0, i32 0
  %6 = load %List*, %List** %5
  call void (%List*, %ListForeachHandler, %Unit*) @func64 (%List* %6, %ListForeachHandler @func88, %Unit* zeroinitializer)
;stmt2:
  %7 = bitcast [2 x %Nat8]* @func87_str2 to %Str
  %8 = call %Int32 (%Str, ...) @printf (%Str %7)
  ret void
}

define void @func89 (%Type*, %Type*) {
;stmt0:
  %3 = bitcast [5 x %Nat8]* @func89_str1 to %Str
  %4 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 7
  %5 = getelementptr inbounds %TypeArray, %TypeArray* %4, i1 0, i32 1
  %6 = load %Nat32, %Nat32* %5
  %7 = call %Int32 (%Str, ...) @printf (%Str %3, %Nat32 %6)
;stmt1:
  %8 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 7
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
  %5 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 8
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
  %7 = load %Node*, %Node** %6
  %8 = icmp ne %Node* %7, zeroinitializer
  br i1 %8, label %then_0, label %else_0
then_0:
;stmt3:
  %9 = bitcast [5 x %Nat8]* @func92_func93_str1 to %Str
  %10 = call %Int32 (%Str, ...) @printf (%Str %9)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  ret void
}

define void @func92 (%TypeUnion*) {
;stmt0:
  %2 = getelementptr inbounds %TypeUnion, %TypeUnion* %0, i1 0, i32 0
  call void (%List*, %ListForeachHandler, %Unit*) @func64 (%List* %2, %ListForeachHandler @func93, %Unit* zeroinitializer)
  ret void
}

define void @value_print_kind (%ValueKind) {
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
  %10 = icmp eq %ValueKind %0, 4
  br i1 %10, label %select_1_4_ok, label %select_1_5
select_1_4_ok:
  %11 = bitcast [18 x %Nat8]* @func94_str5 to %Str
  br label %select_1_end
select_1_5:
  %12 = icmp eq %ValueKind %0, 5
  br i1 %12, label %select_1_5_ok, label %select_1_6
select_1_5_ok:
  %13 = bitcast [16 x %Nat8]* @func94_str6 to %Str
  br label %select_1_end
select_1_6:
  %14 = icmp eq %ValueKind %0, 6
  br i1 %14, label %select_1_6_ok, label %select_1_7
select_1_6_ok:
  %15 = bitcast [12 x %Nat8]* @func94_str7 to %Str
  br label %select_1_end
select_1_7:
  %16 = icmp eq %ValueKind %0, 7
  br i1 %16, label %select_1_7_ok, label %select_1_8
select_1_7_ok:
  %17 = bitcast [17 x %Nat8]* @func94_str8 to %Str
  br label %select_1_end
select_1_8:
  %18 = icmp eq %ValueKind %0, 8
  br i1 %18, label %select_1_8_ok, label %select_1_9
select_1_8_ok:
  %19 = bitcast [15 x %Nat8]* @func94_str9 to %Str
  br label %select_1_end
select_1_9:
  %20 = icmp eq %ValueKind %0, 9
  br i1 %20, label %select_1_9_ok, label %select_1_10
select_1_9_ok:
  %21 = bitcast [10 x %Nat8]* @func94_str10 to %Str
  br label %select_1_end
select_1_10:
  %22 = icmp eq %ValueKind %0, 10
  br i1 %22, label %select_1_10_ok, label %select_1_11
select_1_10_ok:
  %23 = bitcast [12 x %Nat8]* @func94_str11 to %Str
  br label %select_1_end
select_1_11:
  %24 = icmp eq %ValueKind %0, 11
  br i1 %24, label %select_1_11_ok, label %select_1_12
select_1_11_ok:
  %25 = bitcast [10 x %Nat8]* @func94_str12 to %Str
  br label %select_1_end
select_1_12:
  %26 = icmp eq %ValueKind %0, 12
  br i1 %26, label %select_1_12_ok, label %select_1_13
select_1_12_ok:
  %27 = bitcast [12 x %Nat8]* @func94_str13 to %Str
  br label %select_1_end
select_1_13:
  %28 = icmp eq %ValueKind %0, 13
  br i1 %28, label %select_1_13_ok, label %select_1_14
select_1_13_ok:
  %29 = bitcast [11 x %Nat8]* @func94_str14 to %Str
  br label %select_1_end
select_1_14:
  %30 = icmp eq %ValueKind %0, 14
  br i1 %30, label %select_1_14_ok, label %select_1_15
select_1_14_ok:
  %31 = bitcast [10 x %Nat8]* @func94_str15 to %Str
  br label %select_1_end
select_1_15:
  %32 = icmp eq %ValueKind %0, 15
  br i1 %32, label %select_1_15_ok, label %select_1_16
select_1_15_ok:
  %33 = bitcast [10 x %Nat8]* @func94_str16 to %Str
  br label %select_1_end
select_1_16:
  %34 = icmp eq %ValueKind %0, 16
  br i1 %34, label %select_1_16_ok, label %select_1_17
select_1_16_ok:
  %35 = bitcast [10 x %Nat8]* @func94_str17 to %Str
  br label %select_1_end
select_1_17:
  %36 = icmp eq %ValueKind %0, 17
  br i1 %36, label %select_1_17_ok, label %select_1_18
select_1_17_ok:
  %37 = bitcast [10 x %Nat8]* @func94_str18 to %Str
  br label %select_1_end
select_1_18:
  %38 = icmp eq %ValueKind %0, 18
  br i1 %38, label %select_1_18_ok, label %select_1_19
select_1_18_ok:
  %39 = bitcast [10 x %Nat8]* @func94_str19 to %Str
  br label %select_1_end
select_1_19:
  %40 = icmp eq %ValueKind %0, 19
  br i1 %40, label %select_1_19_ok, label %select_1_20
select_1_19_ok:
  %41 = bitcast [9 x %Nat8]* @func94_str20 to %Str
  br label %select_1_end
select_1_20:
  %42 = icmp eq %ValueKind %0, 20
  br i1 %42, label %select_1_20_ok, label %select_1_21
select_1_20_ok:
  %43 = bitcast [10 x %Nat8]* @func94_str21 to %Str
  br label %select_1_end
select_1_21:
  %44 = icmp eq %ValueKind %0, 21
  br i1 %44, label %select_1_21_ok, label %select_1_22
select_1_21_ok:
  %45 = bitcast [10 x %Nat8]* @func94_str22 to %Str
  br label %select_1_end
select_1_22:
  %46 = icmp eq %ValueKind %0, 22
  br i1 %46, label %select_1_22_ok, label %select_1_23
select_1_22_ok:
  %47 = bitcast [9 x %Nat8]* @func94_str23 to %Str
  br label %select_1_end
select_1_23:
  %48 = icmp eq %ValueKind %0, 23
  br i1 %48, label %select_1_23_ok, label %select_1_24
select_1_23_ok:
  %49 = bitcast [9 x %Nat8]* @func94_str24 to %Str
  br label %select_1_end
select_1_24:
  %50 = icmp eq %ValueKind %0, 24
  br i1 %50, label %select_1_24_ok, label %select_1_25
select_1_24_ok:
  %51 = bitcast [9 x %Nat8]* @func94_str25 to %Str
  br label %select_1_end
select_1_25:
  %52 = icmp eq %ValueKind %0, 25
  br i1 %52, label %select_1_25_ok, label %select_1_26
select_1_25_ok:
  %53 = bitcast [9 x %Nat8]* @func94_str26 to %Str
  br label %select_1_end
select_1_26:
  %54 = icmp eq %ValueKind %0, 26
  br i1 %54, label %select_1_26_ok, label %select_1_27
select_1_26_ok:
  %55 = bitcast [9 x %Nat8]* @func94_str27 to %Str
  br label %select_1_end
select_1_27:
  %56 = icmp eq %ValueKind %0, 27
  br i1 %56, label %select_1_27_ok, label %select_1_28
select_1_27_ok:
  %57 = bitcast [9 x %Nat8]* @func94_str28 to %Str
  br label %select_1_end
select_1_28:
  %58 = icmp eq %ValueKind %0, 28
  br i1 %58, label %select_1_28_ok, label %select_1_29
select_1_28_ok:
  %59 = bitcast [11 x %Nat8]* @func94_str29 to %Str
  br label %select_1_end
select_1_29:
  %60 = icmp eq %ValueKind %0, 29
  br i1 %60, label %select_1_29_ok, label %select_1_30
select_1_29_ok:
  %61 = bitcast [10 x %Nat8]* @func94_str30 to %Str
  br label %select_1_end
select_1_30:
  %62 = icmp eq %ValueKind %0, 30
  br i1 %62, label %select_1_30_ok, label %select_1_31
select_1_30_ok:
  %63 = bitcast [10 x %Nat8]* @func94_str31 to %Str
  br label %select_1_end
select_1_31:
  %64 = icmp eq %ValueKind %0, 31
  br i1 %64, label %select_1_31_ok, label %select_1_32
select_1_31_ok:
  %65 = bitcast [11 x %Nat8]* @func94_str32 to %Str
  br label %select_1_end
select_1_32:
  %66 = icmp eq %ValueKind %0, 32
  br i1 %66, label %select_1_32_ok, label %select_1_33
select_1_32_ok:
  %67 = bitcast [12 x %Nat8]* @func94_str33 to %Str
  br label %select_1_end
select_1_33:
  %68 = icmp eq %ValueKind %0, 33
  br i1 %68, label %select_1_33_ok, label %select_1_34
select_1_33_ok:
  %69 = bitcast [13 x %Nat8]* @func94_str34 to %Str
  br label %select_1_end
select_1_34:
  %70 = icmp eq %ValueKind %0, 34
  br i1 %70, label %select_1_34_ok, label %select_1_35
select_1_34_ok:
  %71 = bitcast [11 x %Nat8]* @func94_str35 to %Str
  br label %select_1_end
select_1_35:
  %72 = icmp eq %ValueKind %0, 37
  br i1 %72, label %select_1_35_ok, label %select_1_36
select_1_35_ok:
  %73 = bitcast [13 x %Nat8]* @func94_str36 to %Str
  br label %select_1_end
select_1_36:
  %74 = bitcast [21 x %Nat8]* @func94_str37 to %Str
  br label %select_1_end
select_1_end:
  %75 = phi %Str [ %3, %select_1_0_ok ], [ %5, %select_1_1_ok ], [ %7, %select_1_2_ok ], [ %9, %select_1_3_ok ], [ %11, %select_1_4_ok ], [ %13, %select_1_5_ok ], [ %15, %select_1_6_ok ], [ %17, %select_1_7_ok ], [ %19, %select_1_8_ok ], [ %21, %select_1_9_ok ], [ %23, %select_1_10_ok ], [ %25, %select_1_11_ok ], [ %27, %select_1_12_ok ], [ %29, %select_1_13_ok ], [ %31, %select_1_14_ok ], [ %33, %select_1_15_ok ], [ %35, %select_1_16_ok ], [ %37, %select_1_17_ok ], [ %39, %select_1_18_ok ], [ %41, %select_1_19_ok ], [ %43, %select_1_20_ok ], [ %45, %select_1_21_ok ], [ %47, %select_1_22_ok ], [ %49, %select_1_23_ok ], [ %51, %select_1_24_ok ], [ %53, %select_1_25_ok ], [ %55, %select_1_26_ok ], [ %57, %select_1_27_ok ], [ %59, %select_1_28_ok ], [ %61, %select_1_29_ok ], [ %63, %select_1_30_ok ], [ %65, %select_1_31_ok ], [ %67, %select_1_32_ok ], [ %69, %select_1_33_ok ], [ %71, %select_1_34_ok ], [ %73, %select_1_35_ok ], [ %74, %select_1_36 ]
;stmt1:
  %76 = bitcast [3 x %Nat8]* @func94_str38 to %Str
  %77 = call %Int32 (%Str, ...) @printf (%Str %76, %Str %75)
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
  %14 = icmp eq %ValueKind %9, 4
  br i1 %14, label %select_1_4_ok, label %select_1_5
select_1_4_ok:
  call void (%Value*) @func101 (%Value* %0)
  br label %select_1_end
select_1_5:
  %15 = icmp eq %ValueKind %9, 5
  br i1 %15, label %select_1_5_ok, label %select_1_6
select_1_5_ok:
  call void (%Value*) @func102 (%Value* %0)
  br label %select_1_end
select_1_6:
  %16 = icmp eq %ValueKind %9, 6
  br i1 %16, label %select_1_6_ok, label %select_1_7
select_1_6_ok:
  call void (%Value*) @func103 (%Value* %0)
  br label %select_1_end
select_1_7:
  %17 = icmp eq %ValueKind %9, 7
  br i1 %17, label %select_1_7_ok, label %select_1_8
select_1_7_ok:
  call void (%Value*) @func104 (%Value* %0)
  br label %select_1_end
select_1_8:
  %18 = icmp eq %ValueKind %9, 8
  br i1 %18, label %select_1_8_ok, label %select_1_9
select_1_8_ok:
  call void (%Value*) @func105 (%Value* %0)
  br label %select_1_end
select_1_9:
  %19 = icmp eq %ValueKind %9, 9
  br i1 %19, label %select_1_9_ok, label %select_1_10
select_1_9_ok:
  call void (%Value*) @func106 (%Value* %0)
  br label %select_1_end
select_1_10:
  %20 = icmp eq %ValueKind %9, 10
  br i1 %20, label %select_1_10_ok, label %select_1_11
select_1_10_ok:
  call void (%Value*) @func107 (%Value* %0)
  br label %select_1_end
select_1_11:
  %21 = icmp eq %ValueKind %9, 11
  br i1 %21, label %select_1_11_ok, label %select_1_12
select_1_11_ok:
  call void (%Value*) @func108 (%Value* %0)
  br label %select_1_end
select_1_12:
  %22 = icmp eq %ValueKind %9, 12
  br i1 %22, label %select_1_12_ok, label %select_1_13
select_1_12_ok:
  call void (%Value*) @func109 (%Value* %0)
  br label %select_1_end
select_1_13:
  %23 = icmp eq %ValueKind %9, 13
  br i1 %23, label %select_1_13_ok, label %select_1_14
select_1_13_ok:
  call void (%Value*) @func110 (%Value* %0)
  br label %select_1_end
select_1_14:
  %24 = icmp eq %ValueKind %9, 14
  br i1 %24, label %select_1_14_ok, label %select_1_15
select_1_14_ok:
  %25 = bitcast [4 x %Nat8]* @func95_str3 to %Str
  call void (%Value*, %Str) @func111 (%Value* %0, %Str %25)
  br label %select_1_end
select_1_15:
  %26 = icmp eq %ValueKind %9, 15
  br i1 %26, label %select_1_15_ok, label %select_1_16
select_1_15_ok:
  %27 = bitcast [4 x %Nat8]* @func95_str4 to %Str
  call void (%Value*, %Str) @func111 (%Value* %0, %Str %27)
  br label %select_1_end
select_1_16:
  %28 = icmp eq %ValueKind %9, 16
  br i1 %28, label %select_1_16_ok, label %select_1_17
select_1_16_ok:
  %29 = bitcast [4 x %Nat8]* @func95_str5 to %Str
  call void (%Value*, %Str) @func111 (%Value* %0, %Str %29)
  br label %select_1_end
select_1_17:
  %30 = icmp eq %ValueKind %9, 17
  br i1 %30, label %select_1_17_ok, label %select_1_18
select_1_17_ok:
  %31 = bitcast [4 x %Nat8]* @func95_str6 to %Str
  call void (%Value*, %Str) @func111 (%Value* %0, %Str %31)
  br label %select_1_end
select_1_18:
  %32 = icmp eq %ValueKind %9, 18
  br i1 %32, label %select_1_18_ok, label %select_1_19
select_1_18_ok:
  %33 = bitcast [4 x %Nat8]* @func95_str7 to %Str
  call void (%Value*, %Str) @func111 (%Value* %0, %Str %33)
  br label %select_1_end
select_1_19:
  %34 = icmp eq %ValueKind %9, 19
  br i1 %34, label %select_1_19_ok, label %select_1_20
select_1_19_ok:
  %35 = bitcast [3 x %Nat8]* @func95_str8 to %Str
  call void (%Value*, %Str) @func111 (%Value* %0, %Str %35)
  br label %select_1_end
select_1_20:
  %36 = icmp eq %ValueKind %9, 20
  br i1 %36, label %select_1_20_ok, label %select_1_21
select_1_20_ok:
  %37 = bitcast [4 x %Nat8]* @func95_str9 to %Str
  call void (%Value*, %Str) @func111 (%Value* %0, %Str %37)
  br label %select_1_end
select_1_21:
  %38 = icmp eq %ValueKind %9, 21
  br i1 %38, label %select_1_21_ok, label %select_1_22
select_1_21_ok:
  %39 = bitcast [4 x %Nat8]* @func95_str10 to %Str
  call void (%Value*, %Str) @func111 (%Value* %0, %Str %39)
  br label %select_1_end
select_1_22:
  %40 = icmp eq %ValueKind %9, 22
  br i1 %40, label %select_1_22_ok, label %select_1_23
select_1_22_ok:
  %41 = bitcast [3 x %Nat8]* @func95_str11 to %Str
  call void (%Value*, %Str) @func111 (%Value* %0, %Str %41)
  br label %select_1_end
select_1_23:
  %42 = icmp eq %ValueKind %9, 23
  br i1 %42, label %select_1_23_ok, label %select_1_24
select_1_23_ok:
  %43 = bitcast [3 x %Nat8]* @func95_str12 to %Str
  call void (%Value*, %Str) @func111 (%Value* %0, %Str %43)
  br label %select_1_end
select_1_24:
  %44 = icmp eq %ValueKind %9, 24
  br i1 %44, label %select_1_24_ok, label %select_1_25
select_1_24_ok:
  %45 = bitcast [3 x %Nat8]* @func95_str13 to %Str
  call void (%Value*, %Str) @func111 (%Value* %0, %Str %45)
  br label %select_1_end
select_1_25:
  %46 = icmp eq %ValueKind %9, 25
  br i1 %46, label %select_1_25_ok, label %select_1_26
select_1_25_ok:
  %47 = bitcast [3 x %Nat8]* @func95_str14 to %Str
  call void (%Value*, %Str) @func111 (%Value* %0, %Str %47)
  br label %select_1_end
select_1_26:
  %48 = icmp eq %ValueKind %9, 26
  br i1 %48, label %select_1_26_ok, label %select_1_27
select_1_26_ok:
  %49 = bitcast [3 x %Nat8]* @func95_str15 to %Str
  call void (%Value*, %Str) @func111 (%Value* %0, %Str %49)
  br label %select_1_end
select_1_27:
  %50 = icmp eq %ValueKind %9, 27
  br i1 %50, label %select_1_27_ok, label %select_1_28
select_1_27_ok:
  %51 = bitcast [3 x %Nat8]* @func95_str16 to %Str
  call void (%Value*, %Str) @func111 (%Value* %0, %Str %51)
  br label %select_1_end
select_1_28:
  %52 = icmp eq %ValueKind %9, 28
  br i1 %52, label %select_1_28_ok, label %select_1_29
select_1_28_ok:
  call void (%Value*) @func112 (%Value* %0)
  br label %select_1_end
select_1_29:
  %53 = icmp eq %ValueKind %9, 29
  br i1 %53, label %select_1_29_ok, label %select_1_30
select_1_29_ok:
  call void (%Value*) @func113 (%Value* %0)
  br label %select_1_end
select_1_30:
  %54 = icmp eq %ValueKind %9, 30
  br i1 %54, label %select_1_30_ok, label %select_1_31
select_1_30_ok:
  call void (%Value*) @func114 (%Value* %0)
  br label %select_1_end
select_1_31:
  %55 = icmp eq %ValueKind %9, 31
  br i1 %55, label %select_1_31_ok, label %select_1_32
select_1_31_ok:
  call void (%Value*) @func115 (%Value* %0)
  br label %select_1_end
select_1_32:
  %56 = icmp eq %ValueKind %9, 32
  br i1 %56, label %select_1_32_ok, label %select_1_33
select_1_32_ok:
  call void (%Value*) @func116 (%Value* %0)
  br label %select_1_end
select_1_33:
  %57 = icmp eq %ValueKind %9, 33
  br i1 %57, label %select_1_33_ok, label %select_1_34
select_1_33_ok:
  call void (%Value*) @func117 (%Value* %0)
  br label %select_1_end
select_1_34:
  %58 = icmp eq %ValueKind %9, 34
  br i1 %58, label %select_1_34_ok, label %select_1_35
select_1_34_ok:
  call void (%Value*) @func118 (%Value* %0)
  br label %select_1_end
select_1_35:
  %59 = icmp eq %ValueKind %9, 37
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
  %7 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 9
  %8 = getelementptr inbounds %ValueBin, %ValueBin* %7, i1 0, i32 0
  %9 = load %Value*, %Value** %8
  %10 = getelementptr inbounds %Value, %Value* %9, i1 0, i32 1
  %11 = load %Type*, %Type** %10
  call void (%Type*) @func81 (%Type* %11)
;stmt3:
  %12 = bitcast [12 x %Nat8]* @func111_str3 to %Str
  %13 = call %Int32 (%Str, ...) @printf (%Str %12)
;stmt4:
  %14 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 9
  %15 = getelementptr inbounds %ValueBin, %ValueBin* %14, i1 0, i32 0
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
;stmt0:
  %3 = icmp ne %TokenInfo* %1, zeroinitializer
  br i1 %3, label %then_0, label %else_0
then_0:
;stmt1:
  %4 = bitcast [5 x %Nat8]* @func122_str1 to %Str
  call void (%Str, %Nat8, %TokenInfo*, %Str) @txti (%Str %4, %Nat8 36, %TokenInfo* %1, %Str %0)
;stmt2:
  call void (%TokenInfo*) @func127 (%TokenInfo* %1)
  br label %endif_0
else_0:
;stmt3:
  %5 = bitcast [5 x %Nat8]* @func122_str2 to %Str
  call void (%Str, %Nat8, %Str) @txt (%Str %5, %Nat8 36, %Str %0)
  br label %endif_0
endif_0:
;stmt4:
  %6 = bitcast [2 x %Nat8]* @func122_str3 to %Str
  %7 = call %Int32 (%Str, ...) @printf (%Str %6)
  ret void
}

define void @warning (%Str, %TokenInfo*) {
;stmt0:
  %3 = icmp ne %TokenInfo* %1, zeroinitializer
  br i1 %3, label %then_0, label %else_0
then_0:
;stmt1:
  %4 = bitcast [8 x %Nat8]* @func123_str1 to %Str
  call void (%Str, %Nat8, %TokenInfo*, %Str) @txti (%Str %4, %Nat8 34, %TokenInfo* %1, %Str %0)
;stmt2:
  call void (%TokenInfo*) @func127 (%TokenInfo* %1)
  br label %endif_0
else_0:
;stmt3:
  %5 = bitcast [8 x %Nat8]* @func123_str2 to %Str
  call void (%Str, %Nat8, %Str) @txt (%Str %5, %Nat8 34, %Str %0)
  br label %endif_0
endif_0:
;stmt4:
  %6 = bitcast [2 x %Nat8]* @func123_str3 to %Str
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
  %12 = bitcast [14 x %Nat8]* @func123_str4 to %Str
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
  %4 = bitcast [6 x %Nat8]* @func124_str1 to %Str
  call void (%Str, %Nat8, %Str) @txt (%Str %4, %Nat8 35, %Str %0)
  br label %endif_0
else_0:
;stmt2:
  %5 = bitcast [6 x %Nat8]* @func124_str2 to %Str
  call void (%Str, %Nat8, %TokenInfo*, %Str) @txti (%Str %5, %Nat8 35, %TokenInfo* %1, %Str %0)
;stmt3:
  call void (%TokenInfo*) @func127 (%TokenInfo* %1)
  br label %endif_0
endif_0:
;stmt4:
  %6 = bitcast [2 x %Nat8]* @func124_str3 to %Str
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
  %12 = bitcast [14 x %Nat8]* @func124_str4 to %Str
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
  %3 = bitcast [17 x %Nat8]* @func125_str1 to %Str
  %4 = call %Int32 (%Str, ...) @printf (%Str %3, %Int64 27, %Int64 33, %Str %0, %Int64 27)
;stmt1:
  %5 = icmp ne %TokenInfo* %1, zeroinitializer
  br i1 %5, label %then_0, label %else_0
then_0:
;stmt2:
  call void (%TokenInfo*) @func127 (%TokenInfo* %1)
;stmt3:
  %6 = bitcast [2 x %Nat8]* @func125_str2 to %Str
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
;stmt1:
  %5 = icmp ne %Type* %2, zeroinitializer
  br i1 %5, label %then_0, label %else_0
then_0:
;stmt2:
  %6 = bitcast [16 x %Nat8]* @func129_str2 to %Str
  %7 = call %Int32 (%Str, ...) @printf (%Str %6)
;stmt3:
  call void (%Type*) @func81 (%Type* %2)
;stmt4:
  %8 = bitcast [2 x %Nat8]* @func129_str3 to %Str
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
  %11 = bitcast [16 x %Nat8]* @func129_str4 to %Str
  %12 = call %Int32 (%Str, ...) @printf (%Str %11)
;stmt7:
  call void (%Type*) @func81 (%Type* %1)
;stmt8:
  %13 = bitcast [2 x %Nat8]* @func129_str5 to %Str
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
  %9 = call %Value* (%Index*, %Str) @func137 (%Index* %8, %Str %0)
  ret %Value* %9
}

define %Value* @func140 (%Str, %Block*) {
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
  %6 = call %Value* (%Index*, %Str) @func137 (%Index* %5, %Str %0)
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
  %11 = call %Value* (%Str, %Block*) @func140 (%Str %0, %Block* %10)
  ret %Value* %11
}

define %Value* @func139 (%Str) {
;stmt0:
  %2 = load %FuncContext*, %FuncContext** @fctx
  %3 = icmp ne %FuncContext* %2, zeroinitializer
  br i1 %3, label %then_0, label %else_0
then_0:
;stmt1:
  %4 = load %FuncContext*, %FuncContext** @fctx
  %5 = getelementptr inbounds %FuncContext, %FuncContext* %4, i1 0, i32 2
  %6 = load %Block*, %Block** %5
  %7 = call %Value* (%Str, %Block*) @func140 (%Str %0, %Block* %6)
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
  %10 = call %Value* (%Str) @func138 (%Str %0)
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
  %14 = call %Value* (%Index*, %Str) @func137 (%Index* %13, %Str %0)
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
  %19 = bitcast [5 x %Nat8]* @func139_str1 to %Str
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

define void @func141 (%Index*, %Str, %Value*) {
;stmt0:
  %4 = call %Value* (%Index*, %Str) @func137 (%Index* %0, %Str %1)
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
  %9 = bitcast [35 x %Nat8]* @func141_str1 to %Str
  %10 = getelementptr inbounds %Value, %Value* %2, i1 0, i32 21
  %11 = load %TokenInfo*, %TokenInfo** %10
  call void (%Str, %TokenInfo*) @error (%Str %9, %TokenInfo* %11)
;stmt4:
  %12 = bitcast [19 x %Nat8]* @func141_str2 to %Str
  %13 = getelementptr inbounds %Value, %Value* %4, i1 0, i32 21
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
  %18 = call %Unit* (%Unit*, %Unit*, %Nat32) @memcpy (%Unit* %16, %Unit* %17, %Nat32 296)
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

define void @func142 (%Block*, %Str, %Value*) {
;stmt0:
  %4 = getelementptr inbounds %Block, %Block* %0, i1 0, i32 1
  call void (%Index*, %Str, %Value*) @func141 (%Index* %4, %Str %1, %Value* %2)
  ret void
}

define void @func143 (%Str, %Value*) {
;stmt0:
  %3 = load %FuncContext*, %FuncContext** @fctx
  %4 = getelementptr inbounds %FuncContext, %FuncContext* %3, i1 0, i32 2
  %5 = load %Block*, %Block** %4
  call void (%Block*, %Str, %Value*) @func142 (%Block* %5, %Str %0, %Value* %1)
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
  %9 = call %Type* (%Index*, %Str) @func136 (%Index* %8, %Str %0)
  ret %Type* %9
}

define %Type* @func148 (%Str, %Block*) {
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
  %6 = call %Type* (%Index*, %Str) @func136 (%Index* %5, %Str %0)
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
  %11 = call %Type* (%Str, %Block*) @func148 (%Str %0, %Block* %10)
  ret %Type* %11
}

define %Type* @func147 (%Str) {
;stmt0:
  %2 = getelementptr inbounds %Index, %Index* @builtinIndex, i1 0
  %3 = call %Type* (%Index*, %Str) @func136 (%Index* %2, %Str %0)
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
  %11 = call %Type* (%Str, %Block*) @func148 (%Str %0, %Block* %10)
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
  %14 = call %Type* (%Str) @func146 (%Str %0)
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
  %17 = bitcast [5 x %Nat8]* @func147_str1 to %Str
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
  %1 = load %FuncContext*, %FuncContext** @fctx
  %2 = icmp ne %FuncContext* %1, zeroinitializer
  br i1 %2, label %then_0, label %else_0
then_0:
;stmt1:
  %3 = load %FuncContext*, %FuncContext** @fctx
  %4 = getelementptr inbounds %FuncContext, %FuncContext* %3, i1 0, i32 0
  %5 = load %Str, %Str* %4
  %6 = bitcast [2 x %Nat8]* @func151_str1 to %Str
  %7 = call %Str (%Str, %Str) @cat (%Str %5, %Str %6)
  ret %Str %7
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt2:
  %9 = bitcast [1 x %Nat8]* @func151_str2 to %Str
  ret %Str %9
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
  %1 = load %FuncContext*, %FuncContext** @fctx
  %2 = icmp ne %FuncContext* %1, zeroinitializer
  br i1 %2, label %then_0, label %else_0
then_0:
;stmt1:
  %3 = bitcast [4 x %Nat8]* @func154_str1 to %Str
  %4 = load %FuncContext*, %FuncContext** @fctx
  %5 = getelementptr inbounds %FuncContext, %FuncContext* %4, i1 0, i32 5
  %6 = call %Str (%Str, %Nat32*) @func152 (%Str %3, %Nat32* %5)
  ret %Str %6
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt2:
  %8 = bitcast [4 x %Nat8]* @func154_str2 to %Str
  %9 = getelementptr inbounds %Nat32, %Nat32* @str_uid, i1 0
  %10 = call %Str (%Str, %Nat32*) @func152 (%Str %8, %Nat32* %9)
  ret %Str %10
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
  %6 = call i1 (%Type*, %Type*) @func417 (%Type* %4, %Type* %5)
  ret i1 %6
}

define i1 @func158 (%List*, %Type*) {
;stmt0:
  %3 = bitcast %Type* %1 to %Unit*
  %4 = call %Unit* (%List*, %ListSearchHandler, %Unit*) @list_search (%List* %0, %ListSearchHandler @func159, %Unit* %3)
  %5 = icmp ne %Unit* %4, zeroinitializer
  ret i1 %5
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
  %4 = bitcast [23 x %Nat8]* @func165_str1 to %Str
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
  %15 = bitcast [16 x %Nat8]* @func165_str2 to %Str
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
  call void (%Nat8) @func185 (%Nat8 %2)
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
  br label %endif_2
endif_2:
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
  %2 = call i1 (%Str) @func197 (%Str %1)
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

define void @skipto (%Str) {
;stmt0:
  %2 = bitcast [29 x %Nat8]* @func195_str1 to %Str
  call void (%Str, %TokenInfo*) @error (%Str %2, %TokenInfo* zeroinitializer)
;stmt1:
  %3 = bitcast [12 x %Nat8]* @func195_str2 to %Str
  %4 = call %Token* () @func190 ()
  %5 = getelementptr inbounds %Token, %Token* %4, i1 0, i32 2
  %6 = call %Int32 (%Str, ...) @printf (%Str %3, [0 x %Nat8]* %5)
;stmt2:
  %7 = bitcast [18 x %Nat8]* @func195_str3 to %Str
  %8 = call %Int32 (%Str, ...) @printf (%Str %7, %Str %0)
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

define i1 @func197 (%Str) {
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
  %2 = call i1 (%Str) @func197 (%Str %0)
;stmt1:
  %3 = icmp eq i1 %2, 0
  br i1 %3, label %then_0, label %else_0
then_0:
;stmt2:
  %4 = call %Token* () @func190 ()
;stmt3:
  %5 = bitcast [18 x %Nat8]* @func198_str1 to %Str
  %6 = getelementptr inbounds %Token, %Token* %4, i1 0, i32 1
  call void (%Str, %TokenInfo*) @error (%Str %5, %TokenInfo* %6)
;stmt4:
  %7 = bitcast [13 x %Nat8]* @func198_str2 to %Str
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
  %6 = bitcast [11 x %Nat8]* @func199_str1 to %Str
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
  %1 = call %Token* () @func190 ()
;stmt1:
  %2 = getelementptr inbounds %Token, %Token* %1, i1 0, i32 0
  %3 = load %TokenKind, %TokenKind* %2
  %4 = icmp ne %TokenKind %3, 1
  br i1 %4, label %then_0, label %else_0
then_0:
;stmt2:
  %5 = bitcast [13 x %Nat8]* @func200_str1 to %Str
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
  %3 = call %Token* () @func190 ()
  %4 = getelementptr inbounds %Token, %Token* %3, i1 0, i32 1
  store %TokenInfo* %4, %TokenInfo** %2, align 8
;stmt2:
  %5 = call %AstId* () @parse_id ()
;stmt3:
  %6 = bitcast [2 x %Nat8]* @func201_str1 to %Str
  %7 = call i1 (%Str) @func197 (%Str %6)
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
  %6 = bitcast [13 x %Nat8]* @func202_str1 to %Str
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
  %28 = bitcast [7 x %Nat8]* @func203_str1 to %Str
  %29 = call i1 (%Str) @func197 (%Str %28)
  br i1 %29, label %then_3, label %else_3
then_3:
;stmt16:
  %30 = call %AstNode* () @func204 ()
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
  %49 = bitcast [8 x %Nat8]* @func203_str2 to %Str
  %50 = call i1 (%Str) @func197 (%Str %49)
;stmt31:
  %51 = bitcast [6 x %Nat8]* @func203_str3 to %Str
  %52 = call i1 (%Str) @func197 (%Str %51)
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
  %70 = call %AstDecl* (i1) @func217 (i1 0)
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
  %77 = bitcast [7 x %Nat8]* @func203_str4 to %Str
  %78 = call i1 (%Str) @func197 (%Str %77)
  br i1 %78, label %then_9, label %else_9
then_9:
;stmt43:
  %79 = call %AstDecl* (i1) @func217 (i1 0)
;stmt44:
  %80 = getelementptr inbounds %AstDecl, %AstDecl* %79, i1 0, i32 2
  %81 = load %TokenInfo*, %TokenInfo** %80
  %82 = call %AstValue* (%AstValueKind, %TokenInfo*) @func218 (%AstValueKind 4, %TokenInfo* %81)
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
  %92 = getelementptr inbounds %AstValue, %AstValue* %82, i1 0, i32 13
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
  %122 = call %AstNodeBindType* () @func205 ()
;stmt58:
  %123 = getelementptr inbounds %AstModule, %AstModule* %3, i1 0, i32 0
  %124 = bitcast %AstNodeBindType* %122 to %Unit*
  %125 = call %AstNode* (%AstNodeKind, %Unit*) @ast_node_new (%AstNodeKind 2, %Unit* %124)
  %126 = bitcast %AstNode* %125 to %Unit*
  %127 = call i1 (%List*, %Unit*) @list_append (%List* %123, %Unit* %126)
  br label %endif_11
else_11:
;stmt59:
  %128 = call %AstNodeBindValue* () @func206 ()
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

define %AstNode* @func204 () {
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

define %AstNodeBindType* @func205 () {
;stmt0:
  %1 = call %Unit* (%Nat32) @malloc (%Nat32 24)
  %2 = bitcast %Unit* %1 to %AstNodeBindType*
;stmt1:
  %3 = call %AstId* () @parse_id ()
;stmt2:
  %4 = call %Token* () @func190 ()
  %5 = getelementptr inbounds %Token, %Token* %4, i1 0, i32 1
;stmt3:
  %6 = bitcast [2 x %Nat8]* @func205_str1 to %Str
  %7 = call i1 (%Str) @need (%Str %6)
;stmt4:
  %8 = call %AstType* () @func208 ()
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

define %AstNodeBindValue* @func206 () {
;stmt0:
  %1 = call %Unit* (%Nat32) @malloc (%Nat32 24)
  %2 = bitcast %Unit* %1 to %AstNodeBindValue*
;stmt1:
  %3 = call %AstId* () @parse_id ()
;stmt2:
  %4 = call %Token* () @func190 ()
  %5 = getelementptr inbounds %Token, %Token* %4, i1 0, i32 1
;stmt3:
  %6 = bitcast [2 x %Nat8]* @func206_str1 to %Str
  %7 = call i1 (%Str) @need (%Str %6)
;stmt4:
  %8 = getelementptr inbounds %AstNodeBindValue, %AstNodeBindValue* %2, i1 0, i32 0
  store %AstId* %3, %AstId** %8, align 8
;stmt5:
  %9 = getelementptr inbounds %AstNodeBindValue, %AstNodeBindValue* %2, i1 0, i32 1
  %10 = call %AstValue* () @func221 ()
  store %AstValue* %10, %AstValue** %9, align 8
;stmt6:
  %11 = getelementptr inbounds %AstNodeBindValue, %AstNodeBindValue* %2, i1 0, i32 2
  store %TokenInfo* %5, %TokenInfo** %11, align 8
;stmt7:
  ret %AstNodeBindValue* %2
}

define %AstType* @ast_type_new (%AstTypeKind, %TokenInfo*) {
;stmt0:
  %3 = call %Unit* (%Nat32) @malloc (%Nat32 200)
  %4 = bitcast %Unit* %3 to %AstType*
;stmt1:
  %5 = icmp ne %AstType* %4, zeroinitializer
  %6 = bitcast [18 x %Nat8]* @func207_str1 to %Str
  call void (i1, %Str) @assert (i1 %5, %Str %6)
;stmt2:
  %7 = getelementptr inbounds %AstType, %AstType* %4, i1 0, i32 0
  store %AstTypeKind %0, %AstTypeKind* %7, align 2
;stmt3:
  %8 = getelementptr inbounds %AstType, %AstType* %4, i1 0, i32 10
  store %TokenInfo* %1, %TokenInfo** %8, align 8
;stmt4:
  ret %AstType* %4
}

define %AstType* @func208 () {
;stmt0:
  %1 = call %AstType* () @func209 ()
;stmt1:
  %2 = call %Token* () @func190 ()
;stmt2:
  %3 = bitcast [3 x %Nat8]* @func208_str1 to %Str
  %4 = call i1 (%Str) @func197 (%Str %3)
  br i1 %4, label %then_0, label %else_0
then_0:
;stmt3:
;stmt4:
  %5 = call %AstType* () @func208 ()
;stmt5:
  %6 = getelementptr inbounds %Token, %Token* %2, i1 0, i32 1
  %7 = call %AstType* (%AstTypeKind, %TokenInfo*) @ast_type_new (%AstTypeKind 6, %TokenInfo* %6)
;stmt6:
  %8 = getelementptr inbounds %AstType, %AstType* %7, i1 0, i32 7
  %9 = getelementptr inbounds %AstTypeFunc, %AstTypeFunc* %8, i1 0, i32 0
  store %AstType* %1, %AstType** %9, align 8
;stmt7:
  %10 = getelementptr inbounds %AstType, %AstType* %7, i1 0, i32 7
  %11 = getelementptr inbounds %AstTypeFunc, %AstTypeFunc* %10, i1 0, i32 1
  store %AstType* %5, %AstType** %11, align 8
;stmt8:
  ret %AstType* %7
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt9:
  ret %AstType* %1
}

define %AstType* @func209 () {
;stmt0:
  %1 = call %AstType* () @func210 ()
;stmt1:
  %2 = call %Token* () @func190 ()
;stmt2:
  %3 = bitcast [3 x %Nat8]* @func209_str1 to %Str
  %4 = call i1 (%Str) @func197 (%Str %3)
  br i1 %4, label %then_0, label %else_0
then_0:
;stmt3:
  %5 = getelementptr inbounds %Token, %Token* %2, i1 0, i32 1
  %6 = call %AstType* (%AstTypeKind, %TokenInfo*) @ast_type_new (%AstTypeKind 9, %TokenInfo* %5)
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
  %13 = call %AstType* () @func210 ()
;stmt7:
  %14 = getelementptr inbounds %AstType, %AstType* %6, i1 0, i32 9
  %15 = getelementptr inbounds %AstTypeUnion, %AstTypeUnion* %14, i1 0, i32 0
  %16 = bitcast %AstType* %13 to %Unit*
  %17 = call i1 (%List*, %Unit*) @list_append (%List* %15, %Unit* %16)
;stmt8:
  br label %continue_0
continue_0:
  %18 = bitcast [3 x %Nat8]* @func209_str2 to %Str
  %19 = call i1 (%Str) @func197 (%Str %18)
  br i1 %19, label %body_0, label %break_0
body_0:
;stmt9:
  %20 = call %AstType* () @func210 ()
;stmt10:
  %21 = getelementptr inbounds %AstType, %AstType* %6, i1 0, i32 9
  %22 = getelementptr inbounds %AstTypeUnion, %AstTypeUnion* %21, i1 0, i32 0
  %23 = bitcast %AstType* %20 to %Unit*
  %24 = call i1 (%List*, %Unit*) @list_append (%List* %22, %Unit* %23)
  br label %continue_0
break_0:
;stmt11:
  ret %AstType* %6
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt12:
  ret %AstType* %1
}

define %AstType* @func210 () {
;stmt0:
  %1 = call %Token* () @func190 ()
;stmt1:
  %2 = bitcast [2 x %Nat8]* @func210_str1 to %Str
  %3 = call i1 (%Str) @func197 (%Str %2)
  br i1 %3, label %then_0, label %else_0
then_0:
;stmt2:
  %4 = getelementptr inbounds %Token, %Token* %1, i1 0, i32 1
  %5 = call %AstType* (%AstTypeKind, %TokenInfo*) @ast_type_new (%AstTypeKind 7, %TokenInfo* %4)
;stmt3:
  %6 = getelementptr inbounds %AstType, %AstType* %5, i1 0, i32 5
  %7 = getelementptr inbounds %AstTypePointer, %AstTypePointer* %6, i1 0, i32 0
  %8 = call %AstType* () @func210 ()
  store %AstType* %8, %AstType** %7, align 8
;stmt4:
  ret %AstType* %5
  br label %endif_0
else_0:
;stmt5:
  %10 = bitcast [2 x %Nat8]* @func210_str2 to %Str
  %11 = call i1 (%Str) @func197 (%Str %10)
  br i1 %11, label %then_1, label %else_1
then_1:
;stmt6:
  %12 = bitcast [2 x %Nat8]* @func210_str3 to %Str
  %13 = call i1 (%Str) @func197 (%Str %12)
  br i1 %13, label %then_2, label %else_2
then_2:
;stmt7:
  %14 = getelementptr inbounds %Token, %Token* %1, i1 0, i32 1
  %15 = call %AstType* (%AstTypeKind, %TokenInfo*) @ast_type_new (%AstTypeKind 5, %TokenInfo* %14)
;stmt8:
  %16 = call %AstType* () @func210 ()
;stmt9:
  %17 = getelementptr inbounds %AstType, %AstType* %15, i1 0, i32 4
  %18 = getelementptr inbounds %AstTypeArrayU, %AstTypeArrayU* %17, i1 0, i32 0
  store %AstType* %16, %AstType** %18, align 8
;stmt10:
  ret %AstType* %15
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
;stmt11:
  %20 = getelementptr inbounds %Token, %Token* %1, i1 0, i32 1
  %21 = call %AstType* (%AstTypeKind, %TokenInfo*) @ast_type_new (%AstTypeKind 4, %TokenInfo* %20)
;stmt12:
  %22 = call %AstValue* () @func221 ()
;stmt13:
  %23 = bitcast [2 x %Nat8]* @func210_str4 to %Str
  %24 = call i1 (%Str) @need (%Str %23)
;stmt14:
  %25 = call %AstType* () @func210 ()
;stmt15:
  %26 = getelementptr inbounds %AstType, %AstType* %21, i1 0, i32 3
  %27 = getelementptr inbounds %AstTypeArray, %AstTypeArray* %26, i1 0, i32 1
  store %AstValue* %22, %AstValue** %27, align 8
;stmt16:
  %28 = getelementptr inbounds %AstType, %AstType* %21, i1 0, i32 3
  %29 = getelementptr inbounds %AstTypeArray, %AstTypeArray* %28, i1 0, i32 0
  store %AstType* %25, %AstType** %29, align 8
;stmt17:
  ret %AstType* %21
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  br label %endif_0
endif_0:
;stmt18:
  %31 = call %AstType* () @func211 ()
  ret %AstType* %31
}

define %AstType* @func211 () {
;stmt0:
  %1 = call %Token* () @func190 ()
;stmt1:
  %2 = bitcast [2 x %Nat8]* @func211_str1 to %Str
  %3 = call i1 (%Str) @func197 (%Str %2)
  br i1 %3, label %then_0, label %else_0
then_0:
;stmt2:
  %4 = bitcast [2 x %Nat8]* @func211_str2 to %Str
  %5 = call i1 (%Str) @look (%Str %4)
  %6 = call i1 () @func257 ()
  %7 = or i1 %5, %6
  br i1 %7, label %then_1, label %else_1
then_1:
;stmt3:
  %8 = call %AstType* () @func214 ()
  ret %AstType* %8
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt4:
  %10 = call %AstType* () @func208 ()
;stmt5:
  %11 = bitcast [2 x %Nat8]* @func211_str3 to %Str
  %12 = call i1 (%Str) @need (%Str %11)
;stmt6:
  ret %AstType* %10
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt7:
  %14 = call %AstType* () @func212 ()
  ret %AstType* %14
}

define %AstType* @func212 () {
;stmt0:
  %1 = bitcast [2 x %Nat8]* @func212_str1 to %Str
  %2 = call i1 (%Str) @func197 (%Str %1)
  br i1 %2, label %then_0, label %else_0
then_0:
;stmt1:
  %3 = call %AstType* () @func213 ()
  ret %AstType* %3
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt2:
  %5 = call %Token* () @func190 ()
;stmt3:
  %6 = bitcast [4 x %Nat8]* @func212_str2 to %Str
  %7 = call i1 (%Str) @func197 (%Str %6)
  br i1 %7, label %then_1, label %else_1
then_1:
;stmt4:
  %8 = getelementptr inbounds %Token, %Token* %5, i1 0, i32 1
  %9 = call %AstType* (%AstTypeKind, %TokenInfo*) @ast_type_new (%AstTypeKind 8, %TokenInfo* %8)
;stmt5:
  %10 = getelementptr inbounds %AstType, %AstType* %9, i1 0, i32 8
  %11 = getelementptr inbounds %AstTypeVar, %AstTypeVar* %10, i1 0, i32 0
  %12 = call %AstType* () @func208 ()
  store %AstType* %12, %AstType** %11, align 8
;stmt6:
  ret %AstType* %9
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt7:
  %14 = getelementptr inbounds %Token, %Token* %5, i1 0, i32 1
  %15 = call %AstType* (%AstTypeKind, %TokenInfo*) @ast_type_new (%AstTypeKind 1, %TokenInfo* %14)
;stmt8:
  %16 = getelementptr inbounds %AstType, %AstType* %15, i1 0, i32 1
  %17 = call %AstName () @parse_name ()
  store %AstName %17, %AstName* %16, align 8
;stmt9:
  ret %AstType* %15
}

define %AstType* @func213 () {
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
  %4 = bitcast [2 x %Nat8]* @func213_str1 to %Str
  %5 = call i1 (%Str) @func197 (%Str %4)
  %6 = xor i1 %5, 1
  br i1 %6, label %body_0, label %break_0
body_0:
;stmt4:
  call void () @skip_nl ()
;stmt5:
  %7 = call %Token* () @func190 ()
  %8 = getelementptr inbounds %Token, %Token* %7, i1 0, i32 1
;stmt6:
  %9 = call %AstId* () @parse_id ()
;stmt7:
  %10 = getelementptr inbounds %AstType, %AstType* %3, i1 0, i32 2
  %11 = getelementptr inbounds %AstTypeEnum, %AstTypeEnum* %10, i1 0, i32 0
  %12 = bitcast %AstId* %9 to %Unit*
  %13 = call i1 (%List*, %Unit*) @list_append (%List* %11, %Unit* %12)
;stmt8:
  %14 = bitcast [2 x %Nat8]* @func213_str2 to %Str
  %15 = call i1 (%Str) @func197 (%Str %14)
  %16 = xor i1 %15, 1
  br i1 %16, label %then_0, label %else_0
then_0:
;stmt9:
  call void () @skip_nl ()
;stmt10:
  %17 = bitcast [2 x %Nat8]* @func213_str3 to %Str
  %18 = call i1 (%Str) @need (%Str %17)
;stmt11:
  br label %break_0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  br label %continue_0
break_0:
;stmt12:
  ret %AstType* %3
}

define %AstType* @func214 () {
;stmt0:
  %1 = call %Token* () @func190 ()
;stmt1:
  %2 = getelementptr inbounds %Token, %Token* %1, i1 0, i32 1
  %3 = call %AstType* (%AstTypeKind, %TokenInfo*) @ast_type_new (%AstTypeKind 3, %TokenInfo* %2)
;stmt2:
  %4 = alloca %List
  store %List zeroinitializer, %List* %4, align 8
;stmt3:
  %5 = getelementptr inbounds %List, %List* %4, i1 0
  call void (%List*) @map_init (%List* %5)
;stmt4:
  br label %continue_0
continue_0:
  br i1 1, label %body_0, label %break_0
body_0:
;stmt5:
  call void () @skip_nl ()
;stmt6:
  %6 = bitcast [2 x %Nat8]* @func214_str1 to %Str
  %7 = call i1 (%Str) @func197 (%Str %6)
  br i1 %7, label %then_0, label %else_0
then_0:
;stmt7:
  br label %break_0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt8:
  %9 = call %Token* () @func190 ()
  %10 = getelementptr inbounds %Token, %Token* %9, i1 0, i32 1
;stmt9:
  %11 = call %AstDecl* (i1) @func217 (i1 0)
;stmt10:
  %12 = icmp eq %AstDecl* %11, zeroinitializer
  br i1 %12, label %then_1, label %else_1
then_1:
;stmt11:
  %13 = bitcast [14 x %Nat8]* @func214_str2 to %Str
  call void (%Str, %TokenInfo*) @error (%Str %13, %TokenInfo* %10)
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt12:
  %14 = bitcast [2 x %Nat8]* @func214_str3 to %Str
  %15 = call i1 (%Str) @func197 (%Str %14)
;stmt13:
  call void () @skip_nl ()
;stmt14:
  %16 = getelementptr inbounds %List, %List* %4, i1 0
  %17 = bitcast %AstDecl* %11 to %Unit*
  %18 = call i1 (%List*, %Unit*) @list_append (%List* %16, %Unit* %17)
  br label %continue_0
break_0:
;stmt15:
  %19 = getelementptr inbounds %AstType, %AstType* %3, i1 0, i32 6
  %20 = getelementptr inbounds %AstTypeRecord, %AstTypeRecord* %19, i1 0, i32 0
  %21 = load %List, %List* %4
  store %List %21, %List* %20, align 8
;stmt16:
  ret %AstType* %3
}

define %AstType* @func215 () {
;stmt0:
  %1 = call %Token* () @func190 ()
;stmt1:
  %2 = bitcast [2 x %Nat8]* @func215_str1 to %Str
  %3 = call i1 (%Str) @need (%Str %2)
;stmt2:
  %4 = getelementptr inbounds %Token, %Token* %1, i1 0, i32 1
  %5 = call %AstType* (%AstTypeKind, %TokenInfo*) @ast_type_new (%AstTypeKind 7, %TokenInfo* %4)
;stmt3:
  %6 = getelementptr inbounds %AstType, %AstType* %5, i1 0, i32 5
  %7 = getelementptr inbounds %AstTypePointer, %AstTypePointer* %6, i1 0, i32 0
  %8 = call %AstType* () @func208 ()
  store %AstType* %8, %AstType** %7, align 8
;stmt4:
  ret %AstType* %5
}

define %AstType* @func216 () {
;stmt0:
  %1 = call %Token* () @func190 ()
;stmt1:
  %2 = bitcast [2 x %Nat8]* @func216_str1 to %Str
  %3 = call i1 (%Str) @need (%Str %2)
;stmt2:
  %4 = bitcast [2 x %Nat8]* @func216_str2 to %Str
  %5 = call i1 (%Str) @func197 (%Str %4)
  br i1 %5, label %then_0, label %else_0
then_0:
;stmt3:
  %6 = getelementptr inbounds %Token, %Token* %1, i1 0, i32 1
  %7 = call %AstType* (%AstTypeKind, %TokenInfo*) @ast_type_new (%AstTypeKind 5, %TokenInfo* %6)
;stmt4:
  %8 = call %AstType* () @func208 ()
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
  %14 = call %AstValue* () @func221 ()
;stmt9:
  %15 = bitcast [2 x %Nat8]* @func216_str3 to %Str
  %16 = call i1 (%Str) @need (%Str %15)
;stmt10:
  %17 = call %AstType* () @func208 ()
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

define %AstDecl* @func217 (i1) {
;stmt0:
  %2 = call %Unit* (%Nat32) @malloc (%Nat32 64)
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
  %9 = bitcast [2 x %Nat8]* @func217_str1 to %Str
  %10 = call i1 (%Str) @func197 (%Str %9)
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
  %14 = call %Token* () @func190 ()
  %15 = getelementptr inbounds %Token, %Token* %14, i1 0, i32 1
  store %TokenInfo* %15, %TokenInfo** %13, align 8
;stmt9:
  %16 = bitcast [2 x %Nat8]* @func217_str2 to %Str
  %17 = call i1 (%Str) @need (%Str %16)
;stmt10:
  %18 = call %AstType* () @func208 ()
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

define %AstValue* @func218 (%AstValueKind, %TokenInfo*) {
;stmt0:
  %3 = call %Unit* (%Nat32) @malloc (%Nat32 264)
  %4 = bitcast %Unit* %3 to %AstValue*
;stmt1:
  %5 = icmp ne %AstValue* %4, zeroinitializer
  %6 = bitcast [21 x %Nat8]* @func218_str1 to %Str
  call void (i1, %Str) @assert (i1 %5, %Str %6)
;stmt2:
  %7 = bitcast %AstValue* %4 to %Unit*
  %8 = call %Unit* (%Unit*, %Nat8, %Nat32) @memset (%Unit* %7, %Nat8 0, %Nat32 264)
;stmt3:
  %9 = getelementptr inbounds %AstValue, %AstValue* %4, i1 0, i32 0
  store %AstValueKind %0, %AstValueKind* %9, align 2
;stmt4:
  %10 = getelementptr inbounds %AstValue, %AstValue* %4, i1 0, i32 14
  store %TokenInfo* %1, %TokenInfo** %10, align 8
;stmt5:
  ret %AstValue* %4
}

define %AstValue* @prefix (%AstValueKind, %AstValue*, %TokenInfo*) {
;stmt0:
  %4 = call %AstValue* (%AstValueKind, %TokenInfo*) @func218 (%AstValueKind %0, %TokenInfo* %2)
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
  %5 = call %AstValue* (%AstValueKind, %TokenInfo*) @func218 (%AstValueKind %0, %TokenInfo* %3)
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

define %AstValue* @func221 () {
;stmt0:
  %1 = alloca %AstValue*
  %2 = call %AstValue* () @func222 ()
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
  %6 = call %Token* () @func190 ()
  %7 = getelementptr inbounds %Token, %Token* %6, i1 0, i32 1
;stmt4:
  %8 = bitcast [3 x %Nat8]* @func221_str1 to %Str
  %9 = call i1 (%Str) @func197 (%Str %8)
  br i1 %9, label %then_1, label %else_1
then_1:
;stmt5:
  call void () @skip_nl ()
;stmt6:
  %10 = call %AstValue* () @func221 ()
;stmt7:
  %11 = load %AstValue*, %AstValue** %1
  %12 = call %AstValue* (%AstValueKind, %AstValue*, %AstValue*, %TokenInfo*) @infix (%AstValueKind 17, %AstValue* %11, %AstValue* %10, %TokenInfo* %7)
  store %AstValue* %12, %AstValue** %1, align 8
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt8:
  %13 = load %AstValue*, %AstValue** %1
  ret %AstValue* %13
}

define %AstValue* @func222 () {
;stmt0:
  %1 = alloca %AstValue*
  %2 = call %AstValue* () @func223 ()
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
  %6 = call %Token* () @func190 ()
  %7 = getelementptr inbounds %Token, %Token* %6, i1 0, i32 1
;stmt4:
  %8 = bitcast [4 x %Nat8]* @func222_str1 to %Str
  %9 = call i1 (%Str) @func197 (%Str %8)
  br i1 %9, label %then_1, label %else_1
then_1:
;stmt5:
  call void () @skip_nl ()
;stmt6:
  %10 = call %AstValue* () @func222 ()
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

define %AstValue* @func223 () {
;stmt0:
  %1 = alloca %AstValue*
  %2 = call %AstValue* () @func224 ()
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
  %6 = call %Token* () @func190 ()
  %7 = getelementptr inbounds %Token, %Token* %6, i1 0, i32 1
;stmt4:
  %8 = bitcast [4 x %Nat8]* @func223_str1 to %Str
  %9 = call i1 (%Str) @func197 (%Str %8)
  br i1 %9, label %then_1, label %else_1
then_1:
;stmt5:
  call void () @skip_nl ()
;stmt6:
  %10 = call %AstValue* () @func223 ()
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

define %AstValue* @func224 () {
;stmt0:
  %1 = alloca %AstValue*
  %2 = call %AstValue* () @func225 ()
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
  %6 = call %Token* () @func190 ()
  %7 = getelementptr inbounds %Token, %Token* %6, i1 0, i32 1
;stmt5:
  %8 = bitcast [3 x %Nat8]* @func224_str1 to %Str
  %9 = call i1 (%Str) @func197 (%Str %8)
  br i1 %9, label %then_1, label %else_1
then_1:
;stmt6:
  call void () @skip_nl ()
;stmt7:
  %10 = call %AstValue* () @func224 ()
;stmt8:
  %11 = load %AstValue*, %AstValue** %1
  %12 = call %AstValue* (%AstValueKind, %AstValue*, %AstValue*, %TokenInfo*) @infix (%AstValueKind 20, %AstValue* %11, %AstValue* %10, %TokenInfo* %7)
  store %AstValue* %12, %AstValue** %1, align 8
  br label %endif_1
else_1:
;stmt9:
  %13 = bitcast [3 x %Nat8]* @func224_str2 to %Str
  %14 = call i1 (%Str) @func197 (%Str %13)
  br i1 %14, label %then_2, label %else_2
then_2:
;stmt10:
  call void () @skip_nl ()
;stmt11:
  %15 = call %AstValue* () @func224 ()
;stmt12:
  %16 = load %AstValue*, %AstValue** %1
  %17 = call %AstValue* (%AstValueKind, %AstValue*, %AstValue*, %TokenInfo*) @infix (%AstValueKind 21, %AstValue* %16, %AstValue* %15, %TokenInfo* %7)
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

define %AstValue* @func225 () {
;stmt0:
  %1 = alloca %AstValue*
  %2 = call %AstValue* () @func226 ()
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
  %6 = call %Token* () @func190 ()
  %7 = getelementptr inbounds %Token, %Token* %6, i1 0, i32 1
;stmt5:
  %8 = bitcast [2 x %Nat8]* @func225_str1 to %Str
  %9 = call i1 (%Str) @func197 (%Str %8)
  br i1 %9, label %then_1, label %else_1
then_1:
;stmt6:
  call void () @skip_nl ()
;stmt7:
  %10 = call %AstValue* () @func226 ()
;stmt8:
  %11 = load %AstValue*, %AstValue** %1
  %12 = call %AstValue* (%AstValueKind, %AstValue*, %AstValue*, %TokenInfo*) @infix (%AstValueKind 22, %AstValue* %11, %AstValue* %10, %TokenInfo* %7)
  store %AstValue* %12, %AstValue** %1, align 8
  br label %endif_1
else_1:
;stmt9:
  %13 = bitcast [2 x %Nat8]* @func225_str2 to %Str
  %14 = call i1 (%Str) @func197 (%Str %13)
  br i1 %14, label %then_2, label %else_2
then_2:
;stmt10:
  call void () @skip_nl ()
;stmt11:
  %15 = call %AstValue* () @func226 ()
;stmt12:
  %16 = load %AstValue*, %AstValue** %1
  %17 = call %AstValue* (%AstValueKind, %AstValue*, %AstValue*, %TokenInfo*) @infix (%AstValueKind 23, %AstValue* %16, %AstValue* %15, %TokenInfo* %7)
  store %AstValue* %17, %AstValue** %1, align 8
  br label %endif_2
else_2:
;stmt13:
  %18 = bitcast [3 x %Nat8]* @func225_str3 to %Str
  %19 = call i1 (%Str) @func197 (%Str %18)
  br i1 %19, label %then_3, label %else_3
then_3:
;stmt14:
  call void () @skip_nl ()
;stmt15:
  %20 = call %AstValue* () @func226 ()
;stmt16:
  %21 = load %AstValue*, %AstValue** %1
  %22 = call %AstValue* (%AstValueKind, %AstValue*, %AstValue*, %TokenInfo*) @infix (%AstValueKind 24, %AstValue* %21, %AstValue* %20, %TokenInfo* %7)
  store %AstValue* %22, %AstValue** %1, align 8
  br label %endif_3
else_3:
;stmt17:
  %23 = bitcast [3 x %Nat8]* @func225_str4 to %Str
  %24 = call i1 (%Str) @func197 (%Str %23)
  br i1 %24, label %then_4, label %else_4
then_4:
;stmt18:
  call void () @skip_nl ()
;stmt19:
  %25 = call %AstValue* () @func226 ()
;stmt20:
  %26 = load %AstValue*, %AstValue** %1
  %27 = call %AstValue* (%AstValueKind, %AstValue*, %AstValue*, %TokenInfo*) @infix (%AstValueKind 25, %AstValue* %26, %AstValue* %25, %TokenInfo* %7)
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

define %AstValue* @func226 () {
;stmt0:
  %1 = alloca %AstValue*
  %2 = call %AstValue* () @func227 ()
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
  %6 = call %Token* () @func190 ()
  %7 = getelementptr inbounds %Token, %Token* %6, i1 0, i32 1
;stmt5:
  %8 = bitcast [3 x %Nat8]* @func226_str1 to %Str
  %9 = call i1 (%Str) @func197 (%Str %8)
  br i1 %9, label %then_1, label %else_1
then_1:
;stmt6:
  call void () @skip_nl ()
;stmt7:
  %10 = call %AstValue* () @func227 ()
;stmt8:
  %11 = load %AstValue*, %AstValue** %1
  %12 = call %AstValue* (%AstValueKind, %AstValue*, %AstValue*, %TokenInfo*) @infix (%AstValueKind 26, %AstValue* %11, %AstValue* %10, %TokenInfo* %7)
  store %AstValue* %12, %AstValue** %1, align 8
  br label %endif_1
else_1:
;stmt9:
  %13 = bitcast [3 x %Nat8]* @func226_str2 to %Str
  %14 = call i1 (%Str) @func197 (%Str %13)
  br i1 %14, label %then_2, label %else_2
then_2:
;stmt10:
  call void () @skip_nl ()
;stmt11:
  %15 = call %AstValue* () @func227 ()
;stmt12:
  %16 = load %AstValue*, %AstValue** %1
  %17 = call %AstValue* (%AstValueKind, %AstValue*, %AstValue*, %TokenInfo*) @infix (%AstValueKind 27, %AstValue* %16, %AstValue* %15, %TokenInfo* %7)
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

define %AstValue* @func227 () {
;stmt0:
  %1 = alloca %AstValue*
  %2 = call %AstValue* () @func228 ()
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
  %6 = call %Token* () @func190 ()
  %7 = getelementptr inbounds %Token, %Token* %6, i1 0, i32 1
;stmt5:
  %8 = bitcast [2 x %Nat8]* @func227_str1 to %Str
  %9 = call i1 (%Str) @func197 (%Str %8)
  br i1 %9, label %then_1, label %else_1
then_1:
;stmt6:
  call void () @skip_nl ()
;stmt7:
  %10 = call %AstValue* () @func228 ()
;stmt8:
  %11 = load %AstValue*, %AstValue** %1
  %12 = call %AstValue* (%AstValueKind, %AstValue*, %AstValue*, %TokenInfo*) @infix (%AstValueKind 12, %AstValue* %11, %AstValue* %10, %TokenInfo* %7)
  store %AstValue* %12, %AstValue** %1, align 8
  br label %endif_1
else_1:
;stmt9:
  %13 = bitcast [2 x %Nat8]* @func227_str2 to %Str
  %14 = call i1 (%Str) @func197 (%Str %13)
  br i1 %14, label %then_2, label %else_2
then_2:
;stmt10:
  call void () @skip_nl ()
;stmt11:
  %15 = call %AstValue* () @func228 ()
;stmt12:
  %16 = load %AstValue*, %AstValue** %1
  %17 = call %AstValue* (%AstValueKind, %AstValue*, %AstValue*, %TokenInfo*) @infix (%AstValueKind 13, %AstValue* %16, %AstValue* %15, %TokenInfo* %7)
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

define %AstValue* @func228 () {
;stmt0:
  %1 = alloca %AstValue*
  %2 = call %AstValue* () @func229 ()
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
  %6 = call %Token* () @func190 ()
  %7 = getelementptr inbounds %Token, %Token* %6, i1 0, i32 1
;stmt5:
  %8 = bitcast [2 x %Nat8]* @func228_str1 to %Str
  %9 = call i1 (%Str) @func197 (%Str %8)
  br i1 %9, label %then_1, label %else_1
then_1:
;stmt6:
  call void () @skip_nl ()
;stmt7:
  %10 = call %AstValue* () @func229 ()
;stmt8:
  %11 = load %AstValue*, %AstValue** %1
  %12 = call %AstValue* (%AstValueKind, %AstValue*, %AstValue*, %TokenInfo*) @infix (%AstValueKind 14, %AstValue* %11, %AstValue* %10, %TokenInfo* %7)
  store %AstValue* %12, %AstValue** %1, align 8
  br label %endif_1
else_1:
;stmt9:
  %13 = bitcast [2 x %Nat8]* @func228_str2 to %Str
  %14 = call i1 (%Str) @func197 (%Str %13)
  br i1 %14, label %then_2, label %else_2
then_2:
;stmt10:
  call void () @skip_nl ()
;stmt11:
  %15 = call %AstValue* () @func229 ()
;stmt12:
  %16 = load %AstValue*, %AstValue** %1
  %17 = call %AstValue* (%AstValueKind, %AstValue*, %AstValue*, %TokenInfo*) @infix (%AstValueKind 15, %AstValue* %16, %AstValue* %15, %TokenInfo* %7)
  store %AstValue* %17, %AstValue** %1, align 8
  br label %endif_2
else_2:
;stmt13:
  %18 = bitcast [2 x %Nat8]* @func228_str3 to %Str
  %19 = call i1 (%Str) @func197 (%Str %18)
  br i1 %19, label %then_3, label %else_3
then_3:
;stmt14:
  call void () @skip_nl ()
;stmt15:
  %20 = call %AstValue* () @func229 ()
;stmt16:
  %21 = load %AstValue*, %AstValue** %1
  %22 = call %AstValue* (%AstValueKind, %AstValue*, %AstValue*, %TokenInfo*) @infix (%AstValueKind 16, %AstValue* %21, %AstValue* %20, %TokenInfo* %7)
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

define %AstValue* @func229 () {
;stmt0:
  %1 = alloca %AstValue*
  %2 = call %AstValue* () @func230 ()
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
  %6 = call %Token* () @func190 ()
  %7 = getelementptr inbounds %Token, %Token* %6, i1 0, i32 1
;stmt4:
  %8 = bitcast [3 x %Nat8]* @func229_str1 to %Str
  %9 = call i1 (%Str) @func197 (%Str %8)
  br i1 %9, label %then_1, label %else_1
then_1:
;stmt5:
  %10 = call %AstType* () @func208 ()
;stmt6:
  %11 = call %AstValue* (%AstValueKind, %TokenInfo*) @func218 (%AstValueKind 31, %TokenInfo* %7)
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
;stmt10:
  %17 = bitcast [3 x %Nat8]* @func229_str2 to %Str
  %18 = call i1 (%Str) @func197 (%Str %17)
  br i1 %18, label %then_2, label %else_2
then_2:
;stmt11:
  %19 = call %AstType* () @func208 ()
;stmt12:
  %20 = call %AstValue* (%AstValueKind, %TokenInfo*) @func218 (%AstValueKind 32, %TokenInfo* %7)
;stmt13:
  %21 = getelementptr inbounds %AstValue, %AstValue* %20, i1 0, i32 10
  %22 = getelementptr inbounds %AstValueIs, %AstValueIs* %21, i1 0, i32 0
  %23 = load %AstValue*, %AstValue** %1
  store %AstValue* %23, %AstValue** %22, align 8
;stmt14:
  %24 = getelementptr inbounds %AstValue, %AstValue* %20, i1 0, i32 10
  %25 = getelementptr inbounds %AstValueIs, %AstValueIs* %24, i1 0, i32 1
  store %AstType* %19, %AstType** %25, align 8
;stmt15:
  store %AstValue* %20, %AstValue** %1, align 8
  br label %endif_2
else_2:
;stmt16:
  %26 = bitcast [3 x %Nat8]* @func229_str3 to %Str
  %27 = call i1 (%Str) @func197 (%Str %26)
  br i1 %27, label %then_3, label %else_3
then_3:
;stmt17:
  %28 = call %AstType* () @func208 ()
;stmt18:
  %29 = call %AstValue* (%AstValueKind, %TokenInfo*) @func218 (%AstValueKind 33, %TokenInfo* %7)
;stmt19:
  %30 = getelementptr inbounds %AstValue, %AstValue* %29, i1 0, i32 11
  %31 = getelementptr inbounds %AstValueAs, %AstValueAs* %30, i1 0, i32 0
  %32 = load %AstValue*, %AstValue** %1
  store %AstValue* %32, %AstValue** %31, align 8
;stmt20:
  %33 = getelementptr inbounds %AstValue, %AstValue* %29, i1 0, i32 11
  %34 = getelementptr inbounds %AstValueAs, %AstValueAs* %33, i1 0, i32 1
  store %AstType* %28, %AstType** %34, align 8
;stmt21:
  store %AstValue* %29, %AstValue** %1, align 8
  br label %endif_3
else_3:
  br label %endif_3
endif_3:
  br label %endif_2
endif_2:
  br label %endif_1
endif_1:
;stmt22:
  %35 = load %AstValue*, %AstValue** %1
  ret %AstValue* %35
}

define %AstValue* @func230 () {
;stmt0:
  %1 = alloca %AstValue*
  store %AstValue* zeroinitializer, %AstValue** %1, align 8
;stmt1:
  %2 = call %Token* () @func190 ()
  %3 = getelementptr inbounds %Token, %Token* %2, i1 0, i32 1
;stmt2:
  %4 = bitcast [2 x %Nat8]* @func230_str1 to %Str
  %5 = call i1 (%Str) @func197 (%Str %4)
  br i1 %5, label %then_0, label %else_0
then_0:
;stmt3:
  %6 = call %AstValue* () @func230 ()
;stmt4:
  %7 = call %AstValue* (%AstValueKind, %AstValue*, %TokenInfo*) @prefix (%AstValueKind 8, %AstValue* %6, %TokenInfo* %3)
  store %AstValue* %7, %AstValue** %1, align 8
  br label %endif_0
else_0:
;stmt5:
  %8 = bitcast [2 x %Nat8]* @func230_str2 to %Str
  %9 = call i1 (%Str) @func197 (%Str %8)
  br i1 %9, label %then_1, label %else_1
then_1:
;stmt6:
  %10 = call %AstValue* () @func231 ()
;stmt7:
  %11 = call %AstValue* (%AstValueKind, %AstValue*, %TokenInfo*) @prefix (%AstValueKind 7, %AstValue* %10, %TokenInfo* %3)
  store %AstValue* %11, %AstValue** %1, align 8
  br label %endif_1
else_1:
;stmt8:
  %12 = bitcast [4 x %Nat8]* @func230_str3 to %Str
  %13 = call i1 (%Str) @func197 (%Str %12)
  br i1 %13, label %then_2, label %else_2
then_2:
;stmt9:
  %14 = call %AstValue* () @func230 ()
;stmt10:
  %15 = call %AstValue* (%AstValueKind, %AstValue*, %TokenInfo*) @prefix (%AstValueKind 9, %AstValue* %14, %TokenInfo* %3)
  store %AstValue* %15, %AstValue** %1, align 8
  br label %endif_2
else_2:
;stmt11:
  %16 = bitcast [2 x %Nat8]* @func230_str4 to %Str
  %17 = call i1 (%Str) @func197 (%Str %16)
  br i1 %17, label %then_3, label %else_3
then_3:
;stmt12:
  %18 = call %AstValue* () @func230 ()
;stmt13:
  %19 = call %AstValue* (%AstValueKind, %AstValue*, %TokenInfo*) @prefix (%AstValueKind 10, %AstValue* %18, %TokenInfo* %3)
  store %AstValue* %19, %AstValue** %1, align 8
  br label %endif_3
else_3:
;stmt14:
  %20 = bitcast [2 x %Nat8]* @func230_str5 to %Str
  %21 = call i1 (%Str) @func197 (%Str %20)
  br i1 %21, label %then_4, label %else_4
then_4:
;stmt15:
  %22 = call %AstValue* () @func230 ()
;stmt16:
  %23 = call %AstValue* (%AstValueKind, %AstValue*, %TokenInfo*) @prefix (%AstValueKind 11, %AstValue* %22, %TokenInfo* %3)
  store %AstValue* %23, %AstValue** %1, align 8
  br label %endif_4
else_4:
;stmt17:
  %24 = bitcast [7 x %Nat8]* @func230_str6 to %Str
  %25 = call i1 (%Str) @func197 (%Str %24)
  br i1 %25, label %then_5, label %else_5
then_5:
;stmt18:
  %26 = call %Token* () @func190 ()
  %27 = getelementptr inbounds %Token, %Token* %26, i1 0, i32 1
;stmt19:
  %28 = call %AstType* () @func208 ()
;stmt20:
  %29 = icmp eq %AstType* %28, zeroinitializer
  br i1 %29, label %then_6, label %else_6
then_6:
;stmt21:
  %30 = bitcast [23 x %Nat8]* @func230_str7 to %Str
  call void (%Str, %TokenInfo*) @error (%Str %30, %TokenInfo* %27)
;stmt22:
  ret %AstValue* zeroinitializer
  br label %endif_6
else_6:
  br label %endif_6
endif_6:
;stmt23:
  %32 = call %AstValue* (%AstValueKind, %TokenInfo*) @func218 (%AstValueKind 34, %TokenInfo* %3)
;stmt24:
  %33 = getelementptr inbounds %AstValue, %AstValue* %32, i1 0, i32 4
  store %AstType* %28, %AstType** %33, align 8
;stmt25:
  store %AstValue* %32, %AstValue** %1, align 8
  br label %endif_5
else_5:
;stmt26:
  %34 = bitcast [8 x %Nat8]* @func230_str8 to %Str
  %35 = call i1 (%Str) @func197 (%Str %34)
  br i1 %35, label %then_7, label %else_7
then_7:
;stmt27:
  %36 = call %Token* () @func190 ()
  %37 = getelementptr inbounds %Token, %Token* %36, i1 0, i32 1
;stmt28:
  %38 = call %AstType* () @func208 ()
;stmt29:
  %39 = icmp eq %AstType* %38, zeroinitializer
  br i1 %39, label %then_8, label %else_8
then_8:
;stmt30:
  %40 = bitcast [24 x %Nat8]* @func230_str9 to %Str
  call void (%Str, %TokenInfo*) @error (%Str %40, %TokenInfo* %37)
;stmt31:
  ret %AstValue* zeroinitializer
  br label %endif_8
else_8:
  br label %endif_8
endif_8:
;stmt32:
  %42 = call %AstValue* (%AstValueKind, %TokenInfo*) @func218 (%AstValueKind 35, %TokenInfo* %3)
;stmt33:
  %43 = getelementptr inbounds %AstValue, %AstValue* %42, i1 0, i32 4
  store %AstType* %38, %AstType** %43, align 8
;stmt34:
  store %AstValue* %42, %AstValue** %1, align 8
  br label %endif_7
else_7:
;stmt35:
  %44 = call %AstValue* () @func231 ()
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

define %AstValue* @func231 () {
;stmt0:
  %1 = alloca %AstValue*
  %2 = call %AstValue* () @func232 ()
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
  %6 = call %Token* () @func190 ()
  %7 = getelementptr inbounds %Token, %Token* %6, i1 0, i32 1
;stmt5:
  %8 = bitcast [2 x %Nat8]* @func231_str1 to %Str
  %9 = call i1 (%Str) @func197 (%Str %8)
  br i1 %9, label %then_1, label %else_1
then_1:
;stmt6:
  %10 = call %List* () @map_new ()
;stmt7:
  br label %continue_1
continue_1:
  %11 = bitcast [2 x %Nat8]* @func231_str2 to %Str
  %12 = call i1 (%Str) @func197 (%Str %11)
  %13 = xor i1 %12, 1
  br i1 %13, label %body_1, label %break_1
body_1:
;stmt8:
  %14 = call %Token* () @func190 ()
  %15 = getelementptr inbounds %Token, %Token* %14, i1 0, i32 1
;stmt9:
  %16 = call %AstValue* () @func221 ()
;stmt10:
  %17 = icmp eq %AstValue* %16, zeroinitializer
  br i1 %17, label %then_2, label %else_2
then_2:
;stmt11:
  %18 = bitcast [3 x %Nat8]* @func231_str3 to %Str
  call void (%Str) @skipto (%Str %18)
;stmt12:
  %19 = bitcast [2 x %Nat8]* @func231_str4 to %Str
  %20 = call i1 (%Str) @func197 (%Str %19)
  br i1 %20, label %then_3, label %else_3
then_3:
;stmt13:
  br label %continue_1
  br label %endif_3
else_3:
;stmt14:
  %22 = bitcast [2 x %Nat8]* @func231_str5 to %Str
  %23 = call i1 (%Str) @func197 (%Str %22)
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
  %28 = bitcast [2 x %Nat8]* @func231_str6 to %Str
  %29 = call i1 (%Str) @func197 (%Str %28)
  %30 = xor i1 %29, 1
  br i1 %30, label %then_5, label %else_5
then_5:
;stmt19:
  %31 = bitcast [2 x %Nat8]* @func231_str7 to %Str
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
  %34 = call %AstValue* (%AstValueKind, %TokenInfo*) @func218 (%AstValueKind 28, %TokenInfo* %7)
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
  %41 = bitcast [2 x %Nat8]* @func231_str8 to %Str
  %42 = call i1 (%Str) @func197 (%Str %41)
  br i1 %42, label %then_6, label %else_6
then_6:
;stmt26:
  %43 = call %AstValue* () @func221 ()
;stmt27:
  %44 = bitcast [2 x %Nat8]* @func231_str9 to %Str
  %45 = call i1 (%Str) @func197 (%Str %44)
;stmt28:
  %46 = call %AstValue* (%AstValueKind, %TokenInfo*) @func218 (%AstValueKind 29, %TokenInfo* %7)
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
  %52 = bitcast [2 x %Nat8]* @func231_str10 to %Str
  %53 = call i1 (%Str) @func197 (%Str %52)
  br i1 %53, label %then_7, label %else_7
then_7:
;stmt33:
  %54 = call %AstId* () @parse_id ()
;stmt34:
  %55 = call %AstValue* (%AstValueKind, %TokenInfo*) @func218 (%AstValueKind 30, %TokenInfo* %7)
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

define %AstValue* @func232 () {
;stmt0:
  %1 = call i1 () @func259 ()
  br i1 %1, label %then_0, label %else_0
then_0:
;stmt1:
  %2 = call %AstValue* () @func239 ()
  ret %AstValue* %2
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt2:
  %4 = alloca %AstValue*
  store %AstValue* zeroinitializer, %AstValue** %4, align 8
;stmt3:
  %5 = call %Token* () @func190 ()
  %6 = getelementptr inbounds %Token, %Token* %5, i1 0, i32 1
;stmt4:
  %7 = bitcast [2 x %Nat8]* @func232_str1 to %Str
  %8 = call i1 (%Str) @func197 (%Str %7)
  br i1 %8, label %then_1, label %else_1
then_1:
;stmt5:
  %9 = call %AstValue* () @func221 ()
  store %AstValue* %9, %AstValue** %4, align 8
;stmt6:
  %10 = bitcast [2 x %Nat8]* @func232_str2 to %Str
  %11 = call i1 (%Str) @need (%Str %10)
  br label %endif_1
else_1:
;stmt7:
  %12 = call %AstValue* () @func233 ()
  store %AstValue* %12, %AstValue** %4, align 8
  br label %endif_1
endif_1:
;stmt8:
  %13 = load %AstValue*, %AstValue** %4
  ret %AstValue* %13
}

define %AstValue* @func234 (%Token*) {
;stmt0:
  %2 = bitcast [19 x %Nat8]* @func233_func234_str1 to %Str
  %3 = getelementptr inbounds %Token, %Token* %0, i1 0, i32 1
  call void (%Str, %TokenInfo*) @error (%Str %2, %TokenInfo* %3)
;stmt1:
  %4 = bitcast [14 x %Nat8]* @func233_func234_str2 to %Str
  %5 = getelementptr inbounds %Token, %Token* %0, i1 0, i32 2
; index array
  %6 = getelementptr inbounds [0 x %Nat8], [0 x %Nat8]* %5, i1 0, %Int64 0
  %7 = call %Int32 (%Str, ...) @printf (%Str %4, %Nat8* %6)
;stmt2:
  %8 = bitcast [9 x %Nat8]* @func233_func234_str3 to %Str
  call void (i1, %Str) @assert (i1 0, %Str %8)
;stmt3:
  ret %AstValue* zeroinitializer
}

define %AstValue* @func233 () {
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
  %5 = call %AstValue* () @func235 ()
  br label %select_1_end
select_1_1:
  %6 = icmp eq %TokenKind %3, 2
  br i1 %6, label %select_1_1_ok, label %select_1_2
select_1_1_ok:
  %7 = call %AstValue* () @func241 ()
  br label %select_1_end
select_1_2:
  %8 = icmp eq %TokenKind %3, 4
  br i1 %8, label %select_1_2_ok, label %select_1_3
select_1_2_ok:
  %9 = call %AstValue* () @func237 ()
  br label %select_1_end
select_1_3:
  %10 = call %AstValue* (%Token*) @func234 (%Token* %1)
  br label %select_1_end
select_1_end:
  %11 = phi %AstValue* [ %5, %select_1_0_ok ], [ %7, %select_1_1_ok ], [ %9, %select_1_2_ok ], [ %10, %select_1_3 ]
  ret %AstValue* %11
}

define %AstValue* @func235 () {
;stmt0:
  %1 = call %Token* () @func190 ()
  %2 = getelementptr inbounds %Token, %Token* %1, i1 0, i32 1
;stmt1:
  %3 = bitcast [5 x %Nat8]* @func235_str1 to %Str
  %4 = call i1 (%Str) @func197 (%Str %3)
  br i1 %4, label %then_0, label %else_0
then_0:
;stmt2:
  %5 = call %AstValue* () @func239 ()
  ret %AstValue* %5
  br label %endif_0
else_0:
;stmt3:
  %7 = bitcast [7 x %Nat8]* @func235_str2 to %Str
  %8 = call i1 (%Str) @func197 (%Str %7)
  br i1 %8, label %then_1, label %else_1
then_1:
;stmt4:
  %9 = call %AstValue* () @func240 ()
  ret %AstValue* %9
  br label %endif_1
else_1:
;stmt5:
  %11 = bitcast [6 x %Nat8]* @func235_str3 to %Str
  %12 = call i1 (%Str) @func197 (%Str %11)
  br i1 %12, label %then_2, label %else_2
then_2:
;stmt6:
  %13 = call %AstValue* () @func238 ()
  ret %AstValue* %13
  br label %endif_2
else_2:
;stmt7:
  %15 = bitcast [5 x %Nat8]* @func235_str4 to %Str
  %16 = call i1 (%Str) @func197 (%Str %15)
  br i1 %16, label %then_3, label %else_3
then_3:
;stmt8:
  %17 = call %AstValue* () @func236 ()
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
  %22 = call %AstValue* (%AstValueKind, %TokenInfo*) @func218 (%AstValueKind 3, %TokenInfo* %2)
;stmt13:
  %23 = getelementptr inbounds %AstValue, %AstValue* %22, i1 0, i32 2
  %24 = getelementptr inbounds %AstName, %AstName* %23, i1 0, i32 0
  store %AstId* %19, %AstId** %24, align 8
;stmt14:
  %25 = getelementptr inbounds %AstValue, %AstValue* %22, i1 0, i32 2
  %26 = getelementptr inbounds %AstName, %AstName* %25, i1 0, i32 2
  store %TokenInfo* %2, %TokenInfo** %26, align 8
;stmt15:
  ret %AstValue* %22
;stmt16:
  br label %fail
fail:
;stmt17:
  ret %AstValue* zeroinitializer
}

define %AstValue* @func236 () {
;stmt0:
  %1 = call %Token* () @func190 ()
;stmt1:
  %2 = getelementptr inbounds %Token, %Token* %1, i1 0, i32 1
  %3 = call %AstValue* (%AstValueKind, %TokenInfo*) @func218 (%AstValueKind 36, %TokenInfo* %2)
;stmt2:
  %4 = getelementptr inbounds %AstValue, %AstValue* %3, i1 0, i32 12
  %5 = getelementptr inbounds %AstValueSelect, %AstValueSelect* %4, i1 0, i32 1
  call void (%List*) @map_init (%List* %5)
;stmt3:
  %6 = getelementptr inbounds %AstValue, %AstValue* %3, i1 0, i32 12
  %7 = getelementptr inbounds %AstValueSelect, %AstValueSelect* %6, i1 0, i32 0
  %8 = call %AstValue* () @func221 ()
  store %AstValue* %8, %AstValue** %7, align 8
;stmt4:
  call void () @skip_nl ()
;stmt5:
  %9 = bitcast [2 x %Nat8]* @func236_str1 to %Str
  %10 = call i1 (%Str) @need (%Str %9)
;stmt6:
  call void () @skip_nl ()
;stmt7:
  br label %continue_0
continue_0:
  %11 = bitcast [2 x %Nat8]* @func236_str2 to %Str
  %12 = call i1 (%Str) @func197 (%Str %11)
  %13 = xor i1 %12, 1
  br i1 %13, label %body_0, label %break_0
body_0:
;stmt8:
  %14 = bitcast [5 x %Nat8]* @func236_str3 to %Str
  %15 = call i1 (%Str) @func197 (%Str %14)
  br i1 %15, label %then_0, label %else_0
then_0:
;stmt9:
  %16 = bitcast [3 x %Nat8]* @func236_str4 to %Str
  %17 = call i1 (%Str) @need (%Str %16)
;stmt10:
  %18 = getelementptr inbounds %AstValue, %AstValue* %3, i1 0, i32 12
  %19 = getelementptr inbounds %AstValueSelect, %AstValueSelect* %18, i1 0, i32 2
  %20 = call %AstValue* () @func221 ()
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
  %25 = call %AstValue* () @func221 ()
  store %AstValue* %25, %AstValue** %24, align 8
;stmt15:
  %26 = bitcast [3 x %Nat8]* @func236_str5 to %Str
  %27 = call i1 (%Str) @need (%Str %26)
;stmt16:
  %28 = getelementptr inbounds %AstValueSelectVariant, %AstValueSelectVariant* %23, i1 0, i32 1
  %29 = call %AstValue* () @func221 ()
  store %AstValue* %29, %AstValue** %28, align 8
;stmt17:
  call void () @skip_nl ()
;stmt18:
  %30 = getelementptr inbounds %AstValue, %AstValue* %3, i1 0, i32 12
  %31 = getelementptr inbounds %AstValueSelect, %AstValueSelect* %30, i1 0, i32 1
  %32 = bitcast %AstValueSelectVariant* %23 to %Unit*
  %33 = call i1 (%List*, %Unit*) @list_append (%List* %31, %Unit* %32)
  br label %continue_0
break_0:
;stmt19:
  ret %AstValue* %3
}

define %AstValue* @func237 () {
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
  %9 = call %AstValue* (%AstValueKind, %TokenInfo*) @func218 (%AstValueKind 2, %TokenInfo* %8)
;stmt6:
  %10 = getelementptr inbounds %AstValue, %AstValue* %9, i1 0, i32 1
  store %Str %7, %Str* %10, align 8
;stmt7:
  ret %AstValue* %9
}

define %AstValue* @func238 () {
;stmt0:
  ret %AstValue* zeroinitializer
}

define %AstValue* @func239 () {
;stmt0:
  %1 = call %Token* () @func190 ()
  %2 = getelementptr inbounds %Token, %Token* %1, i1 0, i32 1
;stmt1:
  %3 = call %AstType* () @func208 ()
;stmt2:
  call void () @skip_nl ()
;stmt3:
  %4 = call %Token* () @func190 ()
  %5 = getelementptr inbounds %Token, %Token* %4, i1 0, i32 1
;stmt4:
  %6 = bitcast [2 x %Nat8]* @func239_str1 to %Str
  %7 = call i1 (%Str) @need (%Str %6)
;stmt5:
  %8 = call %union.3 (%TokenInfo*) @func250 (%TokenInfo* %5)
;stmt6:
  %9 = call %AstValue* (%AstValueKind, %TokenInfo*) @func218 (%AstValueKind 4, %TokenInfo* %2)
;stmt7:
  %10 = getelementptr inbounds %AstValue, %AstValue* %9, i1 0, i32 5
  %11 = getelementptr inbounds %AstValueFunc, %AstValueFunc* %10, i1 0, i32 0
  store %AstType* %3, %AstType** %11, align 8
;stmt8:
  %12 = getelementptr inbounds %AstValue, %AstValue* %9, i1 0, i32 5
  %13 = getelementptr inbounds %AstValueFunc, %AstValueFunc* %12, i1 0, i32 1
  %14 = bitcast %union.3 %8 to %AstStmt*
  store %AstStmt* %14, %AstStmt** %13, align 8
;stmt9:
  ret %AstValue* %9
}

define %AstValue* @func240 () {
;stmt0:
  %1 = call %Token* () @func190 ()
  %2 = getelementptr inbounds %Token, %Token* %1, i1 0, i32 1
;stmt1:
  %3 = call %AstType* () @func208 ()
;stmt2:
  %4 = call %AstValue* (%AstValueKind, %TokenInfo*) @func218 (%AstValueKind 4, %TokenInfo* %2)
;stmt3:
  %5 = getelementptr inbounds %AstValue, %AstValue* %4, i1 0, i32 5
  %6 = getelementptr inbounds %AstValueFunc, %AstValueFunc* %5, i1 0, i32 0
  store %AstType* %3, %AstType** %6, align 8
;stmt4:
  %7 = getelementptr inbounds %AstValue, %AstValue* %4, i1 0, i32 13
  store i1 1, i1* %7, align 1
;stmt5:
  %8 = getelementptr inbounds %AstValue, %AstValue* %4, i1 0, i32 5
  %9 = getelementptr inbounds %AstValueFunc, %AstValueFunc* %8, i1 0, i32 1
  store %AstStmt* zeroinitializer, %AstStmt** %9, align 8
;stmt6:
  ret %AstValue* %4
}

define %AstValue* @func241 () {
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
  %7 = call %AstValue* (%AstValueKind, %TokenInfo*) @func218 (%AstValueKind 1, %TokenInfo* %2)
;stmt5:
  %8 = getelementptr inbounds %AstValue, %AstValue* %7, i1 0, i32 1
  store %Str %6, %Str* %8, align 8
;stmt6:
  ret %AstValue* %7
}

define %AstStmt* @ast_stmt_new (%AstStmtKind, %TokenInfo*) {
;stmt0:
  %3 = call %Unit* (%Nat32) @malloc (%Nat32 232)
  %4 = bitcast %Unit* %3 to %AstStmt*
;stmt1:
  %5 = icmp ne %AstStmt* %4, zeroinitializer
  %6 = bitcast [21 x %Nat8]* @func242_str1 to %Str
  call void (i1, %Str) @assert (i1 %5, %Str %6)
;stmt2:
  %7 = bitcast %AstStmt* %4 to %Unit*
  %8 = call %Unit* (%Unit*, %Nat8, %Nat32) @memset (%Unit* %7, %Nat8 0, %Nat32 232)
;stmt3:
  %9 = getelementptr inbounds %AstStmt, %AstStmt* %4, i1 0, i32 0
  store %AstStmtKind %0, %AstStmtKind* %9, align 2
;stmt4:
  %10 = getelementptr inbounds %AstStmt, %AstStmt* %4, i1 0, i32 12
  store %TokenInfo* %1, %TokenInfo** %10, align 8
;stmt5:
  ret %AstStmt* %4
}

define %union.3 @parse_stmt_break (%TokenInfo*) {
;stmt0:
  %2 = call %AstStmt* (%AstStmtKind, %TokenInfo*) @ast_stmt_new (%AstStmtKind 10, %TokenInfo* %0)
  %3 = bitcast %AstStmt* %2 to %union.3
  ret %union.3 %3
}

define %union.3 @parse_stmt_continue (%TokenInfo*) {
;stmt0:
  %2 = call %AstStmt* (%AstStmtKind, %TokenInfo*) @ast_stmt_new (%AstStmtKind 11, %TokenInfo* %0)
  %3 = bitcast %AstStmt* %2 to %union.3
  ret %union.3 %3
}

define %union.5 @func246 () {
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
  %9 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func245_func246_str1, i1 0, %Int64 0
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
  %20 = call %AstStmt* (%AstStmtKind, %TokenInfo*) @ast_stmt_new (%AstStmtKind 13, %TokenInfo* %19)
;stmt8:
  %21 = getelementptr inbounds %AstStmt, %AstStmt* %20, i1 0, i32 11
  %22 = getelementptr inbounds %AstStmtLabel, %AstStmtLabel* %21, i1 0, i32 0
  store %AstId* %17, %AstId** %22, align 8
;stmt9:
  %23 = bitcast %AstStmt* %20 to %union.5
  ret %union.5 %23
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt10:
  %25 = getelementptr inbounds %Token, %Token* %1, i1 0, i32 1
  %26 = call %union.3 (%TokenInfo*) @func247 (%TokenInfo* %25)
  ret %union.3 %26
}

define %union.4 @parse_stmt () {
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
  %13 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func245_str1, i1 0, %Int64 0
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
  %25 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func245_str2, i1 0, %Int64 0
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
  %35 = bitcast [4 x %Nat8]* @func245_str3 to %Str
  %36 = call i1 (%Str) @func197 (%Str %35)
  %37 = or i1 %36, %29
  %38 = icmp eq i1 1, %37
  br i1 %38, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %39 = call %union.3 (%TokenInfo*) @func248 (%TokenInfo* %3)
  br label %select_1_end
select_1_1:
  %40 = bitcast [2 x %Nat8]* @func245_str4 to %Str
  %41 = call i1 (%Str) @func197 (%Str %40)
  %42 = icmp eq i1 1, %41
  br i1 %42, label %select_1_1_ok, label %select_1_2
select_1_1_ok:
  %43 = call %union.3 (%TokenInfo*) @func250 (%TokenInfo* %3)
  br label %select_1_end
select_1_2:
  %44 = bitcast [3 x %Nat8]* @func245_str5 to %Str
  %45 = call i1 (%Str) @func197 (%Str %44)
  %46 = icmp eq i1 1, %45
  br i1 %46, label %select_1_2_ok, label %select_1_3
select_1_2_ok:
  %47 = call %union.3 (%TokenInfo*) @func251 (%TokenInfo* %3)
  br label %select_1_end
select_1_3:
  %48 = bitcast [6 x %Nat8]* @func245_str6 to %Str
  %49 = call i1 (%Str) @func197 (%Str %48)
  %50 = icmp eq i1 1, %49
  br i1 %50, label %select_1_3_ok, label %select_1_4
select_1_3_ok:
  %51 = call %union.3 (%TokenInfo*) @func252 (%TokenInfo* %3)
  br label %select_1_end
select_1_4:
  %52 = bitcast [7 x %Nat8]* @func245_str7 to %Str
  %53 = call i1 (%Str) @func197 (%Str %52)
  %54 = icmp eq i1 1, %53
  br i1 %54, label %select_1_4_ok, label %select_1_5
select_1_4_ok:
  %55 = call %union.3 (%TokenInfo*) @func253 (%TokenInfo* %3)
  br label %select_1_end
select_1_5:
  %56 = bitcast [6 x %Nat8]* @func245_str8 to %Str
  %57 = call i1 (%Str) @func197 (%Str %56)
  %58 = icmp eq i1 1, %57
  br i1 %58, label %select_1_5_ok, label %select_1_6
select_1_5_ok:
  %59 = call %union.3 (%TokenInfo*) @parse_stmt_break (%TokenInfo* %3)
  br label %select_1_end
select_1_6:
  %60 = bitcast [9 x %Nat8]* @func245_str9 to %Str
  %61 = call i1 (%Str) @func197 (%Str %60)
  %62 = icmp eq i1 1, %61
  br i1 %62, label %select_1_6_ok, label %select_1_7
select_1_6_ok:
  %63 = call %union.3 (%TokenInfo*) @parse_stmt_continue (%TokenInfo* %3)
  br label %select_1_end
select_1_7:
  %64 = bitcast [5 x %Nat8]* @func245_str10 to %Str
  %65 = call i1 (%Str) @func197 (%Str %64)
  %66 = or i1 %65, %34
  %67 = icmp eq i1 1, %66
  br i1 %67, label %select_1_7_ok, label %select_1_8
select_1_7_ok:
  %68 = call %union.3 (%TokenInfo*) @func249 (%TokenInfo* %3)
  br label %select_1_end
select_1_8:
  %69 = bitcast [5 x %Nat8]* @func245_str11 to %Str
  %70 = call i1 (%Str) @func197 (%Str %69)
  %71 = icmp eq i1 1, %70
  br i1 %71, label %select_1_8_ok, label %select_1_9
select_1_8_ok:
  %72 = call %union.3 (%TokenInfo*) @func254 (%TokenInfo* %3)
  br label %select_1_end
select_1_9:
  %73 = call %union.5 () @func246 ()
  br label %select_1_end
select_1_end:
  %74 = phi %union.3 [ %39, %select_1_0_ok ], [ %43, %select_1_1_ok ], [ %47, %select_1_2_ok ], [ %51, %select_1_3_ok ], [ %55, %select_1_4_ok ], [ %59, %select_1_5_ok ], [ %63, %select_1_6_ok ], [ %68, %select_1_7_ok ], [ %72, %select_1_8_ok ], [ %73, %select_1_9 ]
  ret %union.3 %74
}

define %union.3 @func247 (%TokenInfo*) {
;stmt0:
  %2 = call %AstValue* () @func221 ()
;stmt1:
  %3 = bitcast [3 x %Nat8]* @func247_str1 to %Str
  %4 = call i1 (%Str) @func197 (%Str %3)
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
  %10 = call %AstValue* () @func221 ()
  store %AstValue* %10, %AstValue** %9, align 8
;stmt5:
  %11 = bitcast %AstStmt* %5 to %union.3
  ret %union.3 %11
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt6:
  %13 = call %AstStmt* (%AstStmtKind, %TokenInfo*) @ast_stmt_new (%AstStmtKind 4, %TokenInfo* %0)
;stmt7:
  %14 = getelementptr inbounds %AstStmt, %AstStmt* %13, i1 0, i32 5
  %15 = getelementptr inbounds %AstStmtExpr, %AstStmtExpr* %14, i1 0, i32 0
  store %AstValue* %2, %AstValue** %15, align 8
;stmt8:
  %16 = bitcast %AstStmt* %13 to %union.3
  ret %union.3 %16
}

define %union.3 @func248 (%TokenInfo*) {
;stmt0:
  %2 = call %Token* () @func190 ()
  %3 = getelementptr inbounds %Token, %Token* %2, i1 0, i32 1
;stmt1:
  %4 = call %AstId* () @parse_id ()
;stmt2:
  %5 = bitcast [2 x %Nat8]* @func248_str1 to %Str
  %6 = call i1 (%Str) @need (%Str %5)
;stmt3:
  %7 = call %AstValue* () @func221 ()
;stmt4:
  %8 = icmp eq %AstId* %4, zeroinitializer
  %9 = icmp eq %AstValue* %7, zeroinitializer
  %10 = or i1 %8, %9
  br i1 %10, label %then_0, label %else_0
then_0:
;stmt5:
  %11 = inttoptr %Unit zeroinitializer to %union.3
  ret %union.3 %11
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt6:
  %13 = call %AstStmt* (%AstStmtKind, %TokenInfo*) @ast_stmt_new (%AstStmtKind 1, %TokenInfo* %3)
;stmt7:
  %14 = getelementptr inbounds %AstStmt, %AstStmt* %13, i1 0, i32 3
  %15 = getelementptr inbounds %AstStmtValueDef, %AstStmtValueDef* %14, i1 0, i32 0
  store %AstId* %4, %AstId** %15, align 8
;stmt8:
  %16 = getelementptr inbounds %AstStmt, %AstStmt* %13, i1 0, i32 3
  %17 = getelementptr inbounds %AstStmtValueDef, %AstStmtValueDef* %16, i1 0, i32 1
  store %AstValue* %7, %AstValue** %17, align 8
;stmt9:
  %18 = bitcast %AstStmt* %13 to %union.3
  ret %union.3 %18
}

define %union.3 @func249 (%TokenInfo*) {
;stmt0:
  %2 = call %Token* () @func190 ()
  %3 = getelementptr inbounds %Token, %Token* %2, i1 0, i32 1
;stmt1:
  %4 = call %AstId* () @parse_id ()
;stmt2:
  %5 = bitcast [2 x %Nat8]* @func249_str1 to %Str
  %6 = call i1 (%Str) @need (%Str %5)
;stmt3:
  %7 = call %AstType* () @func208 ()
;stmt4:
  %8 = icmp eq %AstId* %4, zeroinitializer
  %9 = icmp eq %AstType* %7, zeroinitializer
  %10 = or i1 %8, %9
  br i1 %10, label %then_0, label %else_0
then_0:
;stmt5:
  %11 = inttoptr %Unit zeroinitializer to %union.3
  ret %union.3 %11
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt6:
  %13 = call %AstStmt* (%AstStmtKind, %TokenInfo*) @ast_stmt_new (%AstStmtKind 2, %TokenInfo* %3)
;stmt7:
  %14 = getelementptr inbounds %AstStmt, %AstStmt* %13, i1 0, i32 4
  %15 = getelementptr inbounds %AstStmtTypeDef, %AstStmtTypeDef* %14, i1 0, i32 0
  store %AstId* %4, %AstId** %15, align 8
;stmt8:
  %16 = getelementptr inbounds %AstStmt, %AstStmt* %13, i1 0, i32 4
  %17 = getelementptr inbounds %AstStmtTypeDef, %AstStmtTypeDef* %16, i1 0, i32 1
  store %AstType* %7, %AstType** %17, align 8
;stmt9:
  %18 = bitcast %AstStmt* %13 to %union.3
  ret %union.3 %18
}

define %union.3 @func250 (%TokenInfo*) {
;stmt0:
  %2 = call %AstStmt* (%AstStmtKind, %TokenInfo*) @ast_stmt_new (%AstStmtKind 6, %TokenInfo* %0)
;stmt1:
  %3 = getelementptr inbounds %AstStmt, %AstStmt* %2, i1 0, i32 6
  %4 = getelementptr inbounds %AstStmtBlock, %AstStmtBlock* %3, i1 0, i32 0
  call void (%List*) @map_init (%List* %4)
;stmt2:
  br label %continue_0
continue_0:
  %5 = bitcast [2 x %Nat8]* @func250_str1 to %Str
  %6 = call i1 (%Str) @func197 (%Str %5)
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
  %9 = bitcast [23 x %Nat8]* @func250_str2 to %Str
  call void (%Str) @fatal (%Str %9)
;stmt6:
  br label %break_0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt7:
  %11 = bitcast [2 x %Nat8]* @func250_str3 to %Str
  %12 = call i1 (%Str) @func197 (%Str %11)
  br i1 %12, label %then_1, label %else_1
then_1:
;stmt8:
  br label %break_0
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt9:
  %14 = call %union.4 () @parse_stmt ()
;stmt10:
  %15 = ptrtoint %union.4 %14 to %Int64
  %16 = bitcast %Int64 0 to %Int64
  %17 = icmp eq %Int64 %15, %16
  %18 = xor i1 %17, 1
  br i1 %18, label %then_2, label %else_2
then_2:
;stmt11:
  %19 = call i1 () @sep ()
;stmt12:
  %20 = getelementptr inbounds %AstStmt, %AstStmt* %2, i1 0, i32 6
  %21 = getelementptr inbounds %AstStmtBlock, %AstStmtBlock* %20, i1 0, i32 0
  %22 = bitcast %union.4 %14 to %AstStmt*
  %23 = bitcast %AstStmt* %22 to %Unit*
  %24 = call i1 (%List*, %Unit*) @list_append (%List* %21, %Unit* %23)
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
  br label %continue_0
break_0:
;stmt13:
  %25 = bitcast %AstStmt* %2 to %union.3
  ret %union.3 %25
}

define %union.3 @func251 (%TokenInfo*) {
;stmt0:
  %2 = call %AstValue* () @func221 ()
;stmt1:
  %3 = bitcast [2 x %Nat8]* @func251_str1 to %Str
  %4 = call i1 (%Str) @func197 (%Str %3)
;stmt2:
  %5 = call %Token* () @func190 ()
  %6 = getelementptr inbounds %Token, %Token* %5, i1 0, i32 1
;stmt3:
  %7 = bitcast [2 x %Nat8]* @func251_str2 to %Str
  %8 = call i1 (%Str) @need (%Str %7)
;stmt4:
  %9 = call %union.3 (%TokenInfo*) @func250 (%TokenInfo* %6)
;stmt5:
  %10 = alloca %union.6
  %11 = inttoptr %Unit zeroinitializer to %union.6
  store %union.6 %11, %union.6* %10, align 8
;stmt6:
  %12 = bitcast [5 x %Nat8]* @func251_str3 to %Str
  %13 = call i1 (%Str) @func197 (%Str %12)
  br i1 %13, label %then_0, label %else_0
then_0:
;stmt7:
  %14 = bitcast [2 x %Nat8]* @func251_str4 to %Str
  %15 = call i1 (%Str) @func197 (%Str %14)
;stmt8:
  %16 = call %Token* () @func190 ()
  %17 = getelementptr inbounds %Token, %Token* %16, i1 0, i32 1
;stmt9:
  %18 = bitcast [3 x %Nat8]* @func251_str5 to %Str
  %19 = call i1 (%Str) @func197 (%Str %18)
  br i1 %19, label %then_1, label %else_1
then_1:
;stmt10:
  %20 = call %union.3 (%TokenInfo*) @func251 (%TokenInfo* %17)
  store %union.3 %20, %union.3* %10, align 8
  br label %endif_1
else_1:
;stmt11:
  %21 = bitcast [2 x %Nat8]* @func251_str6 to %Str
  %22 = call i1 (%Str) @need (%Str %21)
;stmt12:
  %23 = call %union.3 (%TokenInfo*) @func250 (%TokenInfo* %17)
  store %union.3 %23, %union.3* %10, align 8
  br label %endif_1
endif_1:
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt13:
  %24 = icmp eq %AstValue* %2, zeroinitializer
  br i1 %24, label %then_2, label %else_2
then_2:
;stmt14:
  %25 = inttoptr %Unit zeroinitializer to %union.3
  ret %union.3 %25
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
;stmt15:
  %27 = ptrtoint %union.3 %9 to %Int64
  %28 = bitcast %Int64 0 to %Int64
  %29 = icmp eq %Int64 %27, %28
  br i1 %29, label %then_3, label %else_3
then_3:
;stmt16:
  %30 = inttoptr %Unit zeroinitializer to %union.3
  ret %union.3 %30
  br label %endif_3
else_3:
  br label %endif_3
endif_3:
;stmt17:
  %32 = call %AstStmt* (%AstStmtKind, %TokenInfo*) @ast_stmt_new (%AstStmtKind 7, %TokenInfo* %0)
;stmt18:
  %33 = getelementptr inbounds %AstStmt, %AstStmt* %32, i1 0, i32 7
  %34 = getelementptr inbounds %AstStmtIf, %AstStmtIf* %33, i1 0, i32 0
  store %AstValue* %2, %AstValue** %34, align 8
;stmt19:
  %35 = getelementptr inbounds %AstStmt, %AstStmt* %32, i1 0, i32 7
  %36 = getelementptr inbounds %AstStmtIf, %AstStmtIf* %35, i1 0, i32 1
  %37 = bitcast %union.3 %9 to %AstStmt*
  store %AstStmt* %37, %AstStmt** %36, align 8
;stmt20:
  %38 = getelementptr inbounds %AstStmt, %AstStmt* %32, i1 0, i32 7
  %39 = getelementptr inbounds %AstStmtIf, %AstStmtIf* %38, i1 0, i32 2
  %40 = load %union.6, %union.6* %10
  store %union.6 %40, %union.6* %39, align 8
;stmt21:
  %41 = bitcast %AstStmt* %32 to %union.3
  ret %union.3 %41
}

define %union.3 @func252 (%TokenInfo*) {
;stmt0:
  %2 = call %AstValue* () @func221 ()
;stmt1:
  %3 = bitcast [2 x %Nat8]* @func252_str1 to %Str
  %4 = call i1 (%Str) @func197 (%Str %3)
;stmt2:
  %5 = call %Token* () @func190 ()
  %6 = getelementptr inbounds %Token, %Token* %5, i1 0, i32 1
;stmt3:
  %7 = bitcast [2 x %Nat8]* @func252_str2 to %Str
  %8 = call i1 (%Str) @need (%Str %7)
;stmt4:
  %9 = call %union.3 (%TokenInfo*) @func250 (%TokenInfo* %6)
;stmt5:
  %10 = icmp eq %AstValue* %2, zeroinitializer
  br i1 %10, label %then_0, label %else_0
then_0:
;stmt6:
  %11 = inttoptr %Unit zeroinitializer to %union.3
  ret %union.3 %11
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt7:
  %13 = ptrtoint %union.3 %9 to %Int64
  %14 = bitcast %Int64 0 to %Int64
  %15 = icmp eq %Int64 %13, %14
  br i1 %15, label %then_1, label %else_1
then_1:
;stmt8:
  %16 = inttoptr %Unit zeroinitializer to %union.3
  ret %union.3 %16
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt9:
  %18 = call %AstStmt* (%AstStmtKind, %TokenInfo*) @ast_stmt_new (%AstStmtKind 8, %TokenInfo* %0)
;stmt10:
  %19 = getelementptr inbounds %AstStmt, %AstStmt* %18, i1 0, i32 8
  %20 = getelementptr inbounds %AstStmtWhile, %AstStmtWhile* %19, i1 0, i32 0
  store %AstValue* %2, %AstValue** %20, align 8
;stmt11:
  %21 = getelementptr inbounds %AstStmt, %AstStmt* %18, i1 0, i32 8
  %22 = getelementptr inbounds %AstStmtWhile, %AstStmtWhile* %21, i1 0, i32 1
  %23 = bitcast %union.3 %9 to %AstStmt*
  store %AstStmt* %23, %AstStmt** %22, align 8
;stmt12:
  %24 = bitcast %AstStmt* %18 to %union.3
  ret %union.3 %24
}

define %union.3 @func253 (%TokenInfo*) {
;stmt0:
  %2 = call i1 () @func194 ()
  br i1 %2, label %then_0, label %else_0
then_0:
;stmt1:
  %3 = call %AstStmt* (%AstStmtKind, %TokenInfo*) @ast_stmt_new (%AstStmtKind 9, %TokenInfo* %0)
  %4 = bitcast %AstStmt* %3 to %union.3
  ret %union.3 %4
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt2:
  %6 = call %Token* () @func190 ()
  %7 = getelementptr inbounds %Token, %Token* %6, i1 0, i32 1
;stmt3:
  %8 = call %AstValue* () @func221 ()
;stmt4:
  %9 = icmp eq %AstValue* %8, zeroinitializer
  br i1 %9, label %then_1, label %else_1
then_1:
;stmt5:
  %10 = bitcast [27 x %Nat8]* @func253_str1 to %Str
  call void (%Str, %TokenInfo*) @error (%Str %10, %TokenInfo* %7)
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt6:
  %11 = call %AstStmt* (%AstStmtKind, %TokenInfo*) @ast_stmt_new (%AstStmtKind 9, %TokenInfo* %7)
;stmt7:
  %12 = getelementptr inbounds %AstStmt, %AstStmt* %11, i1 0, i32 9
  %13 = getelementptr inbounds %AstStmtReturn, %AstStmtReturn* %12, i1 0, i32 0
  store %AstValue* %8, %AstValue** %13, align 8
;stmt8:
  %14 = bitcast %AstStmt* %11 to %union.3
  ret %union.3 %14
}

define %union.3 @func254 (%TokenInfo*) {
;stmt0:
  %2 = call %AstStmt* (%AstStmtKind, %TokenInfo*) @ast_stmt_new (%AstStmtKind 12, %TokenInfo* %0)
;stmt1:
  %3 = getelementptr inbounds %AstStmt, %AstStmt* %2, i1 0, i32 10
  %4 = getelementptr inbounds %AstStmtGoto, %AstStmtGoto* %3, i1 0, i32 0
  %5 = call %AstId* () @parse_id ()
  store %AstId* %5, %AstId** %4, align 8
;stmt2:
  %6 = bitcast %AstStmt* %2 to %union.3
  ret %union.3 %6
}

define %union.3 @func255 (%TokenInfo*) {
;stmt0:
  %2 = call %AstStmt* (%AstStmtKind, %TokenInfo*) @ast_stmt_new (%AstStmtKind 3, %TokenInfo* %0)
;stmt1:
  %3 = call %AstDecl* (i1) @func217 (i1 0)
;stmt2:
  %4 = getelementptr inbounds %AstStmt, %AstStmt* %2, i1 0, i32 2
  %5 = load %AstDecl, %AstDecl* %3
  store %AstDecl %5, %AstDecl* %4, align 8
;stmt3:
  %6 = bitcast %AstStmt* %2 to %union.3
  ret %union.3 %6
}

define %Token* @tn2tok (%Node*) {
;stmt0:
  %2 = getelementptr inbounds %Node, %Node* %0, i1 0, i32 3
  %3 = load %Unit*, %Unit** %2
  %4 = bitcast %Unit* %3 to %Token*
  ret %Token* %4
}

define i1 @func257 () {
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
  %7 = bitcast [2 x %Nat8]* @func257_str1 to %Str
  %8 = call i1 (%Str) @func197 (%Str %7)
  br i1 %8, label %then_1, label %else_1
then_1:
;stmt7:
  br label %yes
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt8:
  %10 = bitcast [2 x %Nat8]* @func257_str2 to %Str
  %11 = call i1 (%Str) @func197 (%Str %10)
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
  %1 = bitcast [2 x %Nat8]* @func258_str1 to %Str
  %2 = call i1 (%Str) @func197 (%Str %1)
  br i1 %2, label %then_0, label %else_0
then_0:
;stmt3:
  ret i1 1
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt4:
  %4 = call i1 () @func257 ()
  ret i1 %4
}

define i1 @func260 () {
;stmt0:
  call void () @skip ()
;stmt1:
  %1 = call i1 () @func259 ()
  ret i1 %1
}

define i1 @func259 () {
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
  %28 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func259_str1, i1 0, %Int64 0
  %29 = load %Nat8, %Nat8* %28
  %30 = icmp eq %Nat8 %22, %29
  br i1 %30, label %select_2_0_ok, label %select_2_1
select_2_0_ok:
  %31 = call i1 () @is_it_type_rec ()
  br label %select_2_end
select_2_1:
; index array
  %32 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func259_str2, i1 0, %Int64 0
  %33 = load %Nat8, %Nat8* %32
  %34 = icmp eq %Nat8 %22, %33
  br i1 %34, label %select_2_1_ok, label %select_2_2
select_2_1_ok:
  %35 = bitcast i1 1 to i1
  br label %select_2_end
select_2_2:
; index array
  %36 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func259_str3, i1 0, %Int64 0
  %37 = load %Nat8, %Nat8* %36
  %38 = icmp eq %Nat8 %22, %37
  br i1 %38, label %select_2_2_ok, label %select_2_3
select_2_2_ok:
  %39 = bitcast i1 1 to i1
  br label %select_2_end
select_2_3:
; index array
  %40 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func259_str4, i1 0, %Int64 0
  %41 = load %Nat8, %Nat8* %40
  %42 = icmp eq %Nat8 %22, %41
  br i1 %42, label %select_2_3_ok, label %select_2_4
select_2_3_ok:
  %43 = call i1 () @func260 ()
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

define void @func262 (%Assembly*) {
;stmt0:
  %2 = getelementptr inbounds %Assembly, %Assembly* %0, i1 0, i32 1
  %3 = bitcast [38 x %Nat8]* @func261_func262_str1 to %Str
  store %Str %3, %Str* %2, align 8
;stmt1:
  %4 = getelementptr inbounds %Assembly, %Assembly* %0, i1 0, i32 2
  %5 = bitcast [27 x %Nat8]* @func261_func262_str2 to %Str
  store %Str %5, %Str* %4, align 8
  ret void
}

define void @func263 (%Assembly*) {
;stmt0:
  %2 = getelementptr inbounds %Assembly, %Assembly* %0, i1 0, i32 1
  %3 = bitcast [48 x %Nat8]* @func261_func263_str1 to %Str
  store %Str %3, %Str* %2, align 8
;stmt1:
  %4 = getelementptr inbounds %Assembly, %Assembly* %0, i1 0, i32 2
  %5 = bitcast [28 x %Nat8]* @func261_func263_str2 to %Str
  store %Str %5, %Str* %4, align 8
  ret void
}

define void @func264 (%Assembly*) {
;stmt0:
  %2 = getelementptr inbounds %Assembly, %Assembly* %0, i1 0, i32 1
  store %Str zeroinitializer, %Str* %2, align 8
;stmt1:
  %3 = getelementptr inbounds %Assembly, %Assembly* %0, i1 0, i32 2
  store %Str zeroinitializer, %Str* %3, align 8
  ret void
}

define void @func261 (%Assembly*, %Arch, %Str) {
;stmt0:
  %4 = getelementptr inbounds %Assembly, %Assembly* %0, i1 0, i32 0
  store %Str %2, %Str* %4, align 8
;stmt1:
  br label %select_1_0
select_1_0:
  %5 = icmp eq %Arch %1, 1
  br i1 %5, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  call void (%Assembly*) @func262 (%Assembly* %0)
  br label %select_1_end
select_1_1:
  %6 = icmp eq %Arch %1, 2
  br i1 %6, label %select_1_1_ok, label %select_1_2
select_1_1_ok:
  call void (%Assembly*) @func263 (%Assembly* %0)
  br label %select_1_end
select_1_2:
  call void (%Assembly*) @func264 (%Assembly* %0)
  br label %select_1_end
select_1_end:
  ret void
}

define %Definition* @func265 (%DefinitionKind, %Str) {
;stmt0:
  %3 = call %Unit* (%Nat32) @malloc (%Nat32 128)
  %4 = bitcast %Unit* %3 to %Definition*
;stmt1:
  %5 = icmp ne %Definition* %4, zeroinitializer
  %6 = bitcast [36 x %Nat8]* @func265_str1 to %Str
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

define %Definition* @func266 (%Assembly*, %Str, %Type*) {
;stmt0:
  %4 = call %Definition* (%DefinitionKind, %Str) @func265 (%DefinitionKind 0, %Str %1)
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

define %Definition* @func267 (%Assembly*, %Str, %Str, %Nat32) {
;stmt0:
  %5 = call %Definition* (%DefinitionKind, %Str) @func265 (%DefinitionKind 2, %Str %1)
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

define %Definition* @func268 (%Assembly*, %Str, %Type*, %List*) {
;stmt0:
  %5 = call %Definition* (%DefinitionKind, %Str) @func265 (%DefinitionKind 3, %Str %1)
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

define %Definition* @func269 (%Assembly*, %Str, %Type*, %Block*) {
;stmt0:
  %5 = call %Definition* (%DefinitionKind, %Str) @func265 (%DefinitionKind 4, %Str %1)
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

define %Definition* @func270 (%Assembly*, %Str, %Type*, %Value*) {
;stmt0:
  %5 = call %Definition* (%DefinitionKind, %Str) @func265 (%DefinitionKind 5, %Str %1)
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

define %Definition* @func271 (%Assembly*, %Str, %Type*, %Str) {
;stmt0:
  %5 = call %Definition* (%DefinitionKind, %Str) @func265 (%DefinitionKind 6, %Str %1)
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
  %3 = bitcast [3 x %Nat8]* @func272_str1 to %Str
  %4 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %2, %Str %3, %Str %0)
  ret void
}

define void @ol (%Str) {
;stmt0:
  %2 = load %FILE*, %FILE** @fout
  %3 = bitcast [4 x %Nat8]* @func273_str1 to %Str
  %4 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %2, %Str %3, %Str %0)
  ret void
}

define void @nl () {
;stmt0:
  %1 = bitcast [2 x %Nat8]* @func274_str1 to %Str
  call void (%Str) @o (%Str %1)
  ret void
}

define void @space () {
;stmt0:
  %1 = bitcast [2 x %Nat8]* @func275_str1 to %Str
  call void (%Str) @o (%Str %1)
  ret void
}

define void @comma () {
;stmt0:
  %1 = bitcast [3 x %Nat8]* @func276_str1 to %Str
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

define void @func280 (%Unit*, %Unit*, %Unit*) {
;stmt0:
  %4 = bitcast %Unit* %0 to %Str
;stmt1:
  %5 = bitcast %Unit* %1 to %Type*
;stmt2:
  %6 = call i1 (%Type*) @func388 (%Type* %5)
  br i1 %6, label %then_0, label %else_0
then_0:
;stmt3:
  %7 = load %FILE*, %FILE** @fout
  %8 = bitcast [17 x %Nat8]* @func279_func280_str1 to %Str
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

define void @func281 (%Unit*, %Unit*, %Nat32, %Node*) {
;stmt0:
  %5 = bitcast %Unit* %0 to %Type*
;stmt1:
  %6 = load %FILE*, %FILE** @fout
  %7 = bitcast [14 x %Nat8]* @func279_func281_str1 to %Str
  %8 = getelementptr inbounds %Type, %Type* %5, i1 0, i32 1
  %9 = load %Str, %Str* %8
  %10 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %6, %Str %7, %Str %9)
;stmt2:
  %11 = getelementptr inbounds %Type, %Type* %5, i1 0, i32 12
  %12 = getelementptr inbounds %TypeUnion, %TypeUnion* %11, i1 0, i32 1
  %13 = load %Type*, %Type** %12
  call void (%Type*) @func365 (%Type* %13)
;stmt3:
  %14 = bitcast [2 x %Nat8]* @func279_func281_str2 to %Str
  call void (%Str) @o (%Str %14)
  ret void
}

define void @func282 (%Unit*, %Unit*, %Nat32, %Node*) {
;stmt0:
  %5 = bitcast %Unit* %0 to %Definition*
;stmt1:
  %6 = getelementptr inbounds %Definition, %Definition* %5, i1 0, i32 3
;stmt2:
  %7 = getelementptr inbounds %Definition, %Definition* %5, i1 0, i32 1
  %8 = load %Str, %Str* %7
  %9 = getelementptr inbounds %DefType, %DefType* %6, i1 0, i32 0
  %10 = load %Type*, %Type** %9
  call void (%Str, %Type*) @func288 (%Str %8, %Type* %10)
  ret void
}

define void @func283 (%Unit*, %Unit*, %Nat32, %Node*) {
;stmt0:
  %5 = bitcast %Unit* %0 to %Definition*
;stmt1:
  %6 = getelementptr inbounds %Definition, %Definition* %5, i1 0, i32 2
;stmt2:
  %7 = getelementptr inbounds %Definition, %Definition* %5, i1 0, i32 1
  %8 = load %Str, %Str* %7
  %9 = getelementptr inbounds %DefStr, %DefStr* %6, i1 0, i32 1
  %10 = load %Nat32, %Nat32* %9
  %11 = getelementptr inbounds %DefStr, %DefStr* %6, i1 0, i32 0
  %12 = load %Str, %Str* %11
  call void (%Str, %Nat32, %Str) @func291 (%Str %8, %Nat32 %10, %Str %12)
  ret void
}

define void @func284 (%Unit*, %Unit*, %Nat32, %Node*) {
;stmt0:
  %5 = bitcast %Unit* %0 to %Definition*
;stmt1:
  %6 = getelementptr inbounds %Definition, %Definition* %5, i1 0, i32 5
;stmt2:
  %7 = getelementptr inbounds %Definition, %Definition* %5, i1 0, i32 1
  %8 = load %Str, %Str* %7
  %9 = getelementptr inbounds %DefArray, %DefArray* %6, i1 0, i32 0
  %10 = load %Type*, %Type** %9
  %11 = getelementptr inbounds %DefArray, %DefArray* %6, i1 0, i32 2
  %12 = load %List*, %List** %11
  call void (%Str, %Type*, %List*) @func289 (%Str %8, %Type* %10, %List* %12)
  ret void
}

define void @func285 (%Unit*, %Unit*, %Nat32, %Node*) {
;stmt0:
  %5 = bitcast %Unit* %0 to %Definition*
;stmt1:
  %6 = getelementptr inbounds %Definition, %Definition* %5, i1 0, i32 7
;stmt2:
  %7 = getelementptr inbounds %Definition, %Definition* %5, i1 0, i32 1
  %8 = load %Str, %Str* %7
  %9 = getelementptr inbounds %DefVar, %DefVar* %6, i1 0, i32 0
  %10 = load %Type*, %Type** %9
  %11 = getelementptr inbounds %DefVar, %DefVar* %6, i1 0, i32 1
  %12 = load %Value*, %Value** %11
  call void (%Str, %Type*, %Value*) @func292 (%Str %8, %Type* %10, %Value* %12)
  ret void
}

define void @func286 (%Unit*, %Unit*, %Nat32, %Node*) {
;stmt0:
  %5 = bitcast %Unit* %0 to %Definition*
;stmt1:
  %6 = getelementptr inbounds %Definition, %Definition* %5, i1 0, i32 6
;stmt2:
  %7 = getelementptr inbounds %Definition, %Definition* %5, i1 0, i32 1
  %8 = load %Str, %Str* %7
  %9 = getelementptr inbounds %DefFunc, %DefFunc* %6, i1 0, i32 0
  %10 = load %Type*, %Type** %9
  %11 = getelementptr inbounds %DefFunc, %DefFunc* %6, i1 0, i32 1
  %12 = load %Block*, %Block** %11
  call void (%Str, %Type*, %Block*) @func293 (%Str %8, %Type* %10, %Block* %12)
  ret void
}

define void @func287 (%Unit*, %Unit*, %Nat32, %Node*) {
;stmt0:
  %5 = bitcast %Unit* %0 to %Definition*
;stmt1:
  %6 = getelementptr inbounds %Definition, %Definition* %5, i1 0, i32 8
;stmt2:
  %7 = getelementptr inbounds %Definition, %Definition* %5, i1 0, i32 1
  %8 = load %Str, %Str* %7
  %9 = getelementptr inbounds %DefAlias, %DefAlias* %6, i1 0, i32 1
  %10 = load %Type*, %Type** %9
  %11 = getelementptr inbounds %DefAlias, %DefAlias* %6, i1 0, i32 2
  %12 = load %Str, %Str* %11
  call void (%Str, %Type*, %Str) @func295 (%Str %8, %Type* %10, %Str %12)
  ret void
}

define void @func279 (%Assembly*, %Str) {
;stmt0:
  %3 = bitcast [20 x %Nat8]* @func279_str1 to %Str
  %4 = getelementptr inbounds %Assembly, %Assembly* %0, i1 0, i32 0
  %5 = load %Str, %Str* %4
  %6 = call %Int32 (%Str, ...) @printf (%Str %3, %Str %5)
;stmt1:
  %7 = bitcast [2 x %Nat8]* @func279_str2 to %Str
  %8 = call %FILE* (%Str, %Str) @fopen (%Str %1, %Str %7)
  store %FILE* %8, %FILE** @fout, align 8
;stmt2:
  %9 = load %FILE*, %FILE** @fout
  %10 = icmp eq %FILE* %9, zeroinitializer
  br i1 %10, label %then_0, label %else_0
then_0:
;stmt3:
  %11 = bitcast [26 x %Nat8]* @func279_str3 to %Str
  call void (%Str) @fatal (%Str %11)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt4:
  %12 = load %FILE*, %FILE** @fout
  %13 = bitcast [16 x %Nat8]* @func279_str4 to %Str
  %14 = getelementptr inbounds %Assembly, %Assembly* %0, i1 0, i32 0
  %15 = load %Str, %Str* %14
  %16 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %12, %Str %13, %Str %15)
;stmt5:
  %17 = bitcast [27 x %Nat8]* @func279_str5 to %Str
  call void (%Str) @ol (%Str %17)
;stmt6:
  %18 = bitcast [44 x %Nat8]* @func279_str6 to %Str
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
  %23 = bitcast [26 x %Nat8]* @func279_str7 to %Str
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
  %31 = bitcast [22 x %Nat8]* @func279_str8 to %Str
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
  %35 = bitcast [16 x %Nat8]* @func279_str9 to %Str
  call void (%Str) @ol (%Str %35)
;stmt14:
  %36 = bitcast [16 x %Nat8]* @func279_str10 to %Str
  call void (%Str) @ol (%Str %36)
;stmt15:
  %37 = bitcast [16 x %Nat8]* @func279_str11 to %Str
  call void (%Str) @ol (%Str %37)
;stmt16:
  %38 = bitcast [20 x %Nat8]* @func279_str12 to %Str
  call void (%Str) @ol (%Str %38)
;stmt17:
  %39 = getelementptr inbounds %Index, %Index* @builtinIndex, i1 0, i32 0
  call void (%List*, %MapForeachHandler, %Unit*) @map_foreach (%List* %39, %MapForeachHandler @func280, %Unit* zeroinitializer)
;stmt18:
  %40 = bitcast [12 x %Nat8]* @func279_str13 to %Str
  call void (%Str) @ol (%Str %40)
;stmt19:
  %41 = getelementptr inbounds %List, %List* @unions, i1 0
  call void (%List*, %ListForeachHandler, %Unit*) @func64 (%List* %41, %ListForeachHandler @func281, %Unit* zeroinitializer)
;stmt20:
  call void () @nl ()
;stmt21:
  %42 = bitcast [11 x %Nat8]* @func279_str14 to %Str
  call void (%Str) @o (%Str %42)
;stmt22:
  %43 = getelementptr inbounds %Assembly, %Assembly* %0, i1 0, i32 3
  call void (%List*, %ListForeachHandler, %Unit*) @func64 (%List* %43, %ListForeachHandler @func282, %Unit* zeroinitializer)
;stmt23:
  %44 = bitcast [13 x %Nat8]* @func279_str15 to %Str
  call void (%Str) @o (%Str %44)
;stmt24:
  %45 = getelementptr inbounds %Assembly, %Assembly* %0, i1 0, i32 6
  call void (%List*, %ListForeachHandler, %Unit*) @func64 (%List* %45, %ListForeachHandler @func283, %Unit* zeroinitializer)
;stmt25:
  %46 = bitcast [12 x %Nat8]* @func279_str16 to %Str
  call void (%Str) @o (%Str %46)
;stmt26:
  %47 = getelementptr inbounds %Assembly, %Assembly* %0, i1 0, i32 5
  call void (%List*, %ListForeachHandler, %Unit*) @func64 (%List* %47, %ListForeachHandler @func284, %Unit* zeroinitializer)
;stmt27:
  %48 = bitcast [10 x %Nat8]* @func279_str17 to %Str
  call void (%Str) @o (%Str %48)
;stmt28:
  %49 = getelementptr inbounds %Assembly, %Assembly* %0, i1 0, i32 7
  call void (%List*, %ListForeachHandler, %Unit*) @func64 (%List* %49, %ListForeachHandler @func285, %Unit* zeroinitializer)
;stmt29:
  %50 = bitcast [11 x %Nat8]* @func279_str18 to %Str
  call void (%Str) @o (%Str %50)
;stmt30:
  %51 = getelementptr inbounds %Assembly, %Assembly* %0, i1 0, i32 8
  call void (%List*, %ListForeachHandler, %Unit*) @func64 (%List* %51, %ListForeachHandler @func286, %Unit* zeroinitializer)
;stmt31:
  %52 = bitcast [13 x %Nat8]* @func279_str19 to %Str
  call void (%Str) @o (%Str %52)
;stmt32:
  %53 = getelementptr inbounds %Assembly, %Assembly* %0, i1 0, i32 4
  call void (%List*, %ListForeachHandler, %Unit*) @func64 (%List* %53, %ListForeachHandler @func287, %Unit* zeroinitializer)
;stmt33:
  %54 = bitcast [14 x %Nat8]* @func279_str20 to %Str
  call void (%Str) @o (%Str %54)
  ret void
}

define void @func288 (%Str, %Type*) {
;stmt0:
  %3 = load %FILE*, %FILE** @fout
  %4 = bitcast [14 x %Nat8]* @func288_str1 to %Str
  %5 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %3, %Str %4, %Str %0)
;stmt1:
  call void (%Type*, i1, i1) @func362 (%Type* %1, i1 0, i1 1)
  ret void
}

define void @func290 (%Unit*, %Unit*, %Nat32, %Node*) {
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
  %7 = call %LLVM_Value (%Value*) @func303 (%Value* %6)
;stmt4:
  call void (%LLVM_Value) @func348 (%LLVM_Value %7)
  ret void
}

define void @func289 (%Str, %Type*, %List*) {
;stmt0:
  %4 = load %FILE*, %FILE** @fout
  %5 = bitcast [38 x %Nat8]* @func289_str1 to %Str
  %6 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %4, %Str %5, %Str %0)
;stmt1:
  call void (%Type*) @func365 (%Type* %1)
;stmt2:
  %7 = bitcast [3 x %Nat8]* @func289_str2 to %Str
  call void (%Str) @o (%Str %7)
;stmt3:
  call void (%List*, %ListForeachHandler, %Unit*) @func64 (%List* %2, %ListForeachHandler @func290, %Unit* zeroinitializer)
;stmt4:
  %8 = bitcast [12 x %Nat8]* @func289_str3 to %Str
  call void (%Str) @o (%Str %8)
  ret void
}

define void @func291 (%Str, %Nat32, %Str) {
;stmt0:
  %4 = load %FILE*, %FILE** @fout
  %5 = bitcast [50 x %Nat8]* @func291_str1 to %Str
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
  %15 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func291_str2, i1 0, %Int64 0
  %16 = load %Nat8, %Nat8* %15
  %17 = icmp eq %Nat8 %10, %16
; index array
  %18 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func291_str3, i1 0, %Int64 0
  %19 = load %Nat8, %Nat8* %18
  %20 = icmp eq %Nat8 %10, %19
; index array
  %21 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func291_str4, i1 0, %Int64 0
  %22 = load %Nat8, %Nat8* %21
  %23 = icmp eq %Nat8 %10, %22
; index array
  %24 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func291_str5, i1 0, %Int64 0
  %25 = load %Nat8, %Nat8* %24
  %26 = icmp eq %Nat8 %10, %25
; index array
  %27 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func291_str6, i1 0, %Int64 0
  %28 = load %Nat8, %Nat8* %27
  %29 = icmp eq %Nat8 %10, %28
; index array
  %30 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func291_str7, i1 0, %Int64 0
  %31 = load %Nat8, %Nat8* %30
  %32 = icmp eq %Nat8 %10, %31
; index array
  %33 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func291_str8, i1 0, %Int64 0
  %34 = load %Nat8, %Nat8* %33
  %35 = icmp eq %Nat8 %10, %34
; index array
  %36 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func291_str9, i1 0, %Int64 0
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
  %47 = bitcast [6 x %Nat8]* @func291_str10 to %Str
  %48 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %46, %Str %47, %Nat8 %10)
  br label %endif_1
else_1:
;stmt9:
  %49 = load %FILE*, %FILE** @fout
  %50 = bitcast [3 x %Nat8]* @func291_str11 to %Str
  %51 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %49, %Str %50, %Nat8 %10)
  br label %endif_1
endif_1:
  br label %continue_0
break_0:
;stmt10:
  %52 = load %FILE*, %FILE** @fout
  %53 = bitcast [16 x %Nat8]* @func291_str12 to %Str
  %54 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %52, %Str %53, %Int64 0)
  ret void
}

define void @func292 (%Str, %Type*, %Value*) {
;stmt0:
  %4 = load %FILE*, %FILE** @fout
  %5 = bitcast [15 x %Nat8]* @func292_str1 to %Str
  %6 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %4, %Str %5, %Str %0)
;stmt1:
  call void (%Type*) @func365 (%Type* %1)
;stmt2:
  call void () @space ()
;stmt3:
  %7 = icmp eq %Value* %2, zeroinitializer
  br i1 %7, label %then_0, label %else_0
then_0:
;stmt4:
  %8 = bitcast [16 x %Nat8]* @func292_str2 to %Str
  call void (%Str) @o (%Str %8)
;stmt5:
ret void
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt6:
  %10 = call %LLVM_Value (%Value*) @func303 (%Value* %2)
;stmt7:
  %11 = extractvalue %LLVM_Value %10, 0
  %12 = icmp ne %LLVM_ValueKind %11, 2
  br i1 %12, label %then_1, label %else_1
then_1:
;stmt8:
  %13 = bitcast [29 x %Nat8]* @func292_str3 to %Str
  %14 = getelementptr inbounds %Value, %Value* %2, i1 0, i32 21
  %15 = load %TokenInfo*, %TokenInfo** %14
  call void (%Str, %TokenInfo*) @error (%Str %13, %TokenInfo* %15)
;stmt9:
  %16 = bitcast [16 x %Nat8]* @func292_str4 to %Str
  call void (%Str) @o (%Str %16)
;stmt10:
ret void
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt11:
  call void (%LLVM_Value) @func347 (%LLVM_Value %10)
  ret void
}

define void @func294 (%Unit*, %Unit*, %Nat32, %Node*) {
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
  call void (%Type*) @func365 (%Type* %8)
  ret void
}

define void @func293 (%Str, %Type*, %Block*) {
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
  %13 = bitcast [3 x %Nat8]* @func293_str1 to %Str
  %14 = call %Int32 (%Str, %Str) @strcmp (%Str %0, %Str %13)
  %15 = icmp eq %Int32 %14, 0
  br i1 %15, label %then_0, label %else_0
then_0:
;stmt3:
  %16 = bitcast [6 x %Nat8]* @func293_str2 to %Str
  %17 = call %Int32 (%Str, ...) @printf (%Str %16)
;stmt4:
  call void (%Type*) @func81 (%Type* %1)
;stmt5:
  %18 = bitcast [2 x %Nat8]* @func293_str3 to %Str
  %19 = call %Int32 (%Str, ...) @printf (%Str %18)
;stmt6:
  %20 = bitcast [11 x %Nat8]* @func293_str4 to %Str
  %21 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 5
  %22 = getelementptr inbounds %TypeFunc, %TypeFunc* %21, i1 0, i32 1
  %23 = load %Type*, %Type** %22
  %24 = call i1 (%Type*) @func392 (%Type* %23)
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
;stmt9:
  %27 = icmp ne %Type* %1, zeroinitializer
  %28 = bitcast [20 x %Nat8]* @func293_str5 to %Str
  call void (i1, %Str) @assert (i1 %27, %Str %28)
;stmt10:
  %29 = icmp eq %Block* %2, zeroinitializer
  br i1 %29, label %then_1, label %else_1
then_1:
;stmt11:
  %30 = bitcast [9 x %Nat8]* @func293_str6 to %Str
  call void (%Str) @o (%Str %30)
  br label %endif_1
else_1:
;stmt12:
  %31 = bitcast [9 x %Nat8]* @func293_str7 to %Str
  call void (%Str) @o (%Str %31)
  br label %endif_1
endif_1:
;stmt13:
  call void () @space ()
;stmt14:
  %32 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 5
  %33 = getelementptr inbounds %TypeFunc, %TypeFunc* %32, i1 0, i32 1
  %34 = load %Type*, %Type** %33
  %35 = load %Type*, %Type** @typeUnit
  %36 = call i1 (%Type*, %Type*) @func417 (%Type* %34, %Type* %35)
;stmt15:
  br i1 %36, label %then_2, label %else_2
then_2:
;stmt16:
  %37 = bitcast [5 x %Nat8]* @func293_str8 to %Str
  call void (%Str) @o (%Str %37)
  br label %endif_2
else_2:
;stmt17:
  %38 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 5
  %39 = getelementptr inbounds %TypeFunc, %TypeFunc* %38, i1 0, i32 1
  %40 = load %Type*, %Type** %39
  call void (%Type*) @func365 (%Type* %40)
  br label %endif_2
endif_2:
;stmt18:
  %41 = load %FILE*, %FILE** @fout
  %42 = bitcast [7 x %Nat8]* @func293_str9 to %Str
  %43 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %41, %Str %42, %Str %0)
;stmt19:
  call void (%List*, %ListForeachHandler, %Unit*) @func64 (%List* %9, %ListForeachHandler @func294, %Unit* zeroinitializer)
;stmt20:
  %44 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 5
  %45 = getelementptr inbounds %TypeFunc, %TypeFunc* %44, i1 0, i32 2
  %46 = load i1, i1* %45
  br i1 %46, label %then_3, label %else_3
then_3:
;stmt21:
  %47 = bitcast [6 x %Nat8]* @func293_str10 to %Str
  call void (%Str) @o (%Str %47)
  br label %endif_3
else_3:
  br label %endif_3
endif_3:
;stmt22:
  %48 = bitcast [2 x %Nat8]* @func293_str11 to %Str
  call void (%Str) @o (%Str %48)
;stmt23:
  %49 = icmp ne %Block* %2, zeroinitializer
  br i1 %49, label %then_4, label %else_4
then_4:
  br label %endif_4
else_4:
  br label %endif_4
endif_4:
;stmt24:
  %50 = icmp ne %Block* %2, zeroinitializer
  br i1 %50, label %then_5, label %else_5
then_5:
;stmt25:
  %51 = bitcast [3 x %Nat8]* @func293_str12 to %Str
  call void (%Str) @o (%Str %51)
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
  call void (%Block*) @func360 (%Block* %2)
;stmt32:
  br i1 %36, label %then_6, label %else_6
then_6:
;stmt33:
  %52 = bitcast [12 x %Nat8]* @func293_str13 to %Str
  call void (%Str) @o (%Str %52)
  br label %endif_6
else_6:
  br label %endif_6
endif_6:
;stmt34:
  %53 = bitcast [3 x %Nat8]* @func293_str14 to %Str
  call void (%Str) @o (%Str %53)
  br label %endif_5
else_5:
  br label %endif_5
endif_5:
  ret void
}

define void @func295 (%Str, %Type*, %Str) {
;stmt0:
  %4 = load %FILE*, %FILE** @fout
  %5 = bitcast [14 x %Nat8]* @func295_str1 to %Str
  %6 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %4, %Str %5, %Str %0)
;stmt1:
  call void (%Type*, i1, i1) @func362 (%Type* %1, i1 0, i1 0)
;stmt2:
  call void () @comma ()
;stmt3:
  call void (%Type*, i1, i1) @func362 (%Type* %1, i1 0, i1 0)
;stmt4:
  %7 = load %FILE*, %FILE** @fout
  %8 = bitcast [6 x %Nat8]* @func295_str2 to %Str
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

define %Nat32 @func300 (%Str, %Type*) {
;stmt0:
  %3 = call %Nat32 () @lab_get ()
;stmt1:
  %4 = load %FILE*, %FILE** @fout
  %5 = bitcast [14 x %Nat8]* @func300_str1 to %Str
  %6 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %4, %Str %5, %Nat32 %3, %Str %0)
;stmt2:
  call void (%Type*) @func365 (%Type* %1)
;stmt3:
  ret %Nat32 %3
}

define %Nat32 @func301 (%Type*, %LLVM_Value) {
;stmt0:
  %3 = bitcast [23 x %Nat8]* @func301_str1 to %Str
  %4 = call %Nat32 (%Str, %Type*) @func300 (%Str %3, %Type* %0)
;stmt1:
  call void () @comma ()
;stmt2:
  call void (%Type*) @func365 (%Type* %0)
;stmt3:
  %5 = bitcast [3 x %Nat8]* @func301_str2 to %Str
  call void (%Str) @o (%Str %5)
;stmt4:
  call void (%LLVM_Value) @func347 (%LLVM_Value %1)
;stmt5:
  call void () @comma ()
;stmt6:
  ret %Nat32 %4
}

define %Nat32 @func302 (%Type*, %LLVM_Value, %Nat32) {
;stmt0:
  %4 = bitcast [13 x %Nat8]* @func302_str1 to %Str
  %5 = call %Nat32 (%Str, %Type*) @func300 (%Str %4, %Type* %0)
;stmt1:
  call void () @space ()
;stmt2:
  call void (%LLVM_Value) @func347 (%LLVM_Value %1)
;stmt3:
  %6 = load %FILE*, %FILE** @fout
  %7 = bitcast [5 x %Nat8]* @func302_str2 to %Str
  %8 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %6, %Str %7, %Nat32 %2)
;stmt4:
  ret %Nat32 %5
}

define %LLVM_Value @func304 (%Value*) {
;stmt0:
  %2 = bitcast [28 x %Nat8]* @func303_func304_str1 to %Str
  call void (%Str) @fatal (%Str %2)
;stmt1:
  %3 = call %LLVM_Value (%LLVM_ValueKind, %Type*, %Int64) @llval_create (%LLVM_ValueKind 0, %Type* zeroinitializer, %Int64 0)
  ret %LLVM_Value %3
}

define %LLVM_Value @func303 (%Value*) {
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
  %53 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 18
  %54 = load %Value*, %Value** %53
  %55 = call %LLVM_Value (%Value*) @func303 (%Value* %54)
  %56 = call %LLVM_Value (%LLVM_Value) @func345 (%LLVM_Value %55)
  br label %select_1_end
select_1_7:
  %57 = icmp eq %ValueKind %3, 31
  br i1 %57, label %select_1_7_ok, label %select_1_8
select_1_7_ok:
  %58 = call %LLVM_Value (%Value*) @func305 (%Value* %0)
  br label %select_1_end
select_1_8:
  %59 = icmp eq %ValueKind %3, 32
  br i1 %59, label %select_1_8_ok, label %select_1_9
select_1_8_ok:
  %60 = call %LLVM_Value (%Value*) @func308 (%Value* %0)
  br label %select_1_end
select_1_9:
  %61 = icmp eq %ValueKind %3, 33
  br i1 %61, label %select_1_9_ok, label %select_1_10
select_1_9_ok:
  %62 = call %LLVM_Value (%Value*) @func310 (%Value* %0)
  br label %select_1_end
select_1_10:
  %63 = icmp eq %ValueKind %3, 9
  br i1 %63, label %select_1_10_ok, label %select_1_11
select_1_10_ok:
  %64 = call %LLVM_Value (%Value*) @func311 (%Value* %0)
  br label %select_1_end
select_1_11:
  %65 = icmp eq %ValueKind %3, 10
  br i1 %65, label %select_1_11_ok, label %select_1_12
select_1_11_ok:
  %66 = call %LLVM_Value (%Value*) @func312 (%Value* %0)
  br label %select_1_end
select_1_12:
  %67 = icmp eq %ValueKind %3, 12
  br i1 %67, label %select_1_12_ok, label %select_1_13
select_1_12_ok:
  %68 = call %LLVM_Value (%Value*) @func314 (%Value* %0)
  br label %select_1_end
select_1_13:
  %69 = icmp eq %ValueKind %3, 13
  br i1 %69, label %select_1_13_ok, label %select_1_14
select_1_13_ok:
  %70 = call %LLVM_Value (%Value*) @func315 (%Value* %0)
  br label %select_1_end
select_1_14:
  %71 = icmp eq %ValueKind %3, 11
  br i1 %71, label %select_1_14_ok, label %select_1_15
select_1_14_ok:
  %72 = call %LLVM_Value (%Value*) @func313 (%Value* %0)
  br label %select_1_end
select_1_15:
  %73 = icmp eq %ValueKind %3, 34
  br i1 %73, label %select_1_15_ok, label %select_1_16
select_1_15_ok:
  %74 = call %LLVM_Value (%Value*) @func327 (%Value* %0)
  br label %select_1_end
select_1_16:
  %75 = icmp eq %ValueKind %3, 36
  br i1 %75, label %select_1_16_ok, label %select_1_17
select_1_16_ok:
  %76 = call %LLVM_Value (%Value*) @func324 (%Value* %0)
  br label %select_1_end
select_1_17:
  %77 = icmp eq %ValueKind %3, 35
  br i1 %77, label %select_1_17_ok, label %select_1_18
select_1_17_ok:
  %78 = call %LLVM_Value (%Value*) @func325 (%Value* %0)
  br label %select_1_end
select_1_18:
  %79 = icmp eq %ValueKind %3, 37
  br i1 %79, label %select_1_18_ok, label %select_1_19
select_1_18_ok:
  %80 = call %LLVM_Value (%Value*) @func341 (%Value* %0)
  br label %select_1_end
select_1_19:
  %81 = icmp eq %ValueKind %3, 2
  br i1 %81, label %select_1_19_ok, label %select_1_20
select_1_19_ok:
  %82 = call %LLVM_Value (%Value*) @func304 (%Value* %0)
  br label %select_1_end
select_1_20:
  %83 = call %LLVM_Value (%Value*) @func330 (%Value* %0)
  br label %select_1_end
select_1_end:
  %84 = phi %LLVM_Value [ %9, %select_1_0_ok ], [ %17, %select_1_1_ok ], [ %25, %select_1_2_ok ], [ %33, %select_1_3_ok ], [ %42, %select_1_4_ok ], [ %51, %select_1_5_ok ], [ %56, %select_1_6_ok ], [ %58, %select_1_7_ok ], [ %60, %select_1_8_ok ], [ %62, %select_1_9_ok ], [ %64, %select_1_10_ok ], [ %66, %select_1_11_ok ], [ %68, %select_1_12_ok ], [ %70, %select_1_13_ok ], [ %72, %select_1_14_ok ], [ %74, %select_1_15_ok ], [ %76, %select_1_16_ok ], [ %78, %select_1_17_ok ], [ %80, %select_1_18_ok ], [ %82, %select_1_19_ok ], [ %83, %select_1_20 ]
  ret %LLVM_Value %84
}

define void @func306 (%Unit*, %Unit*, %Nat32, %Node*) {
;stmt0:
  %5 = bitcast %Unit* %0 to %Value*
;stmt1:
  %6 = bitcast %Unit* %1 to %func305.type1*
;stmt2:
  %7 = getelementptr inbounds %func305.type1, %func305.type1* %6, i1 0, i32 0
  %8 = getelementptr inbounds %func305.type1, %func305.type1* %6, i1 0, i32 1
  %9 = load %Nat16, %Nat16* %8
; index array
  %10 = getelementptr inbounds [64 x %LLVM_Value], [64 x %LLVM_Value]* %7, i1 0, %Nat16 %9
  %11 = call %LLVM_Value (%Value*) @func303 (%Value* %5)
  store %LLVM_Value %11, %LLVM_Value* %10, align 8
;stmt3:
  %12 = getelementptr inbounds %func305.type1, %func305.type1* %6, i1 0, i32 1
  %13 = getelementptr inbounds %func305.type1, %func305.type1* %6, i1 0, i32 1
  %14 = load %Nat16, %Nat16* %13
  %15 = add %Nat16 %14, 1
  store %Nat16 %15, %Nat16* %12, align 2
  ret void
}

define %LLVM_Value @func305 (%Value*) {
;stmt0:
  %2 = alloca %func305.type1
  store %func305.type1 zeroinitializer, %func305.type1* %2, align 8
;stmt1:
  %3 = getelementptr inbounds %func305.type1, %func305.type1* %2, i1 0, i32 1
  store %Nat16 0, %Nat16* %3, align 2
;stmt2:
  %4 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 15
  %5 = getelementptr inbounds %ValueCall, %ValueCall* %4, i1 0, i32 1
  %6 = load %List*, %List** %5
  %7 = getelementptr inbounds %func305.type1, %func305.type1* %2, i1 0
  %8 = bitcast %func305.type1* %7 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @func64 (%List* %6, %ListForeachHandler @func306, %Unit* %8)
;stmt3:
  %9 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 15
  %10 = getelementptr inbounds %ValueCall, %ValueCall* %9, i1 0, i32 0
  %11 = load %Value*, %Value** %10
  %12 = call %LLVM_Value (%Value*) @func303 (%Value* %11)
;stmt4:
  %13 = bitcast [4 x %Nat8]* @func305_str1 to %Str
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
  %20 = call i1 (%Type*, %Type*) @func417 (%Type* %18, %Type* %19)
  %21 = xor i1 %20, 1
  br i1 %21, label %then_0, label %else_0
then_0:
;stmt7:
  %22 = call %Nat32 () @lab_get ()
  store %Nat32 %22, %Nat32* %14, align 4
;stmt8:
  %23 = load %FILE*, %FILE** @fout
  %24 = bitcast [8 x %Nat8]* @func305_str2 to %Str
  %25 = load %Nat32, %Nat32* %14
  %26 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %23, %Str %24, %Nat32 %25)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt9:
  %27 = bitcast [6 x %Nat8]* @func305_str3 to %Str
  call void (%Str) @o (%Str %27)
;stmt10:
  %28 = extractvalue %LLVM_Value %12, 1
  call void (%Type*, i1, i1) @func362 (%Type* %28, i1 0, i1 0)
;stmt11:
  call void () @space ()
;stmt12:
  call void (%LLVM_Value) @func347 (%LLVM_Value %12)
;stmt13:
  %29 = bitcast [3 x %Nat8]* @func305_str4 to %Str
  call void (%Str) @o (%Str %29)
;stmt14:
  %30 = alloca %Nat16
  store %Nat16 0, %Nat16* %30, align 2
;stmt15:
  br label %continue_0
continue_0:
  %31 = load %Nat16, %Nat16* %30
  %32 = getelementptr inbounds %func305.type1, %func305.type1* %2, i1 0, i32 1
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
  %37 = getelementptr inbounds %func305.type1, %func305.type1* %2, i1 0, i32 0
  %38 = load %Nat16, %Nat16* %30
; index array
  %39 = getelementptr inbounds [64 x %LLVM_Value], [64 x %LLVM_Value]* %37, i1 0, %Nat16 %38
  %40 = load %LLVM_Value, %LLVM_Value* %39
  call void (%LLVM_Value) @func348 (%LLVM_Value %40)
;stmt19:
  %41 = load %Nat16, %Nat16* %30
  %42 = add %Nat16 %41, 1
  store %Nat16 %42, %Nat16* %30, align 2
  br label %continue_0
break_0:
;stmt20:
  %43 = bitcast [2 x %Nat8]* @func305_str5 to %Str
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
  %3 = bitcast [21 x %Nat8]* @func307_str1 to %Str
  call void (%Str) @o (%Str %3)
;stmt1:
  %4 = extractvalue %LLVM_Value %0, 1
  %5 = getelementptr inbounds %Type, %Type* %4, i1 0, i32 8
  %6 = getelementptr inbounds %TypeArrayU, %TypeArrayU* %5, i1 0, i32 0
  %7 = load %Type*, %Type** %6
;stmt2:
  %8 = call %Nat32 (%Type*, %LLVM_Value) @func301 (%Type* %7, %LLVM_Value %0)
;stmt3:
  call void (%LLVM_Value) @func348 (%LLVM_Value %1)
;stmt4:
  %9 = call %LLVM_Value (%Type*, %Nat32) @llval_create_adr (%Type* %7, %Nat32 %8)
  ret %LLVM_Value %9
}

define %LLVM_Value @func309 (%LLVM_Value, %LLVM_Value) {
;stmt0:
  %3 = bitcast [15 x %Nat8]* @func308_func309_str1 to %Str
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
  %14 = call %Nat32 (%Type*, %LLVM_Value) @func301 (%Type* %13, %LLVM_Value %0)
;stmt3:
  %15 = bitcast [7 x %Nat8]* @func308_func309_str2 to %Str
  call void (%Str) @o (%Str %15)
;stmt4:
  call void (%LLVM_Value) @func348 (%LLVM_Value %1)
;stmt5:
  %16 = getelementptr inbounds %Type, %Type* %13, i1 0, i32 7
  %17 = getelementptr inbounds %TypeArray, %TypeArray* %16, i1 0, i32 0
  %18 = load %Type*, %Type** %17
;stmt6:
  %19 = call %LLVM_Value (%Type*, %Nat32) @llval_create_adr (%Type* %18, %Nat32 %14)
  ret %LLVM_Value %19
}

define %LLVM_Value @func308 (%Value*) {
;stmt0:
  %2 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 10
  %3 = getelementptr inbounds %ValueIndex, %ValueIndex* %2, i1 0, i32 0
  %4 = load %Value*, %Value** %3
  %5 = call %LLVM_Value (%Value*) @func303 (%Value* %4)
;stmt1:
  %6 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 10
  %7 = getelementptr inbounds %ValueIndex, %ValueIndex* %6, i1 0, i32 1
  %8 = load %Value*, %Value** %7
  %9 = call %LLVM_Value (%Value*) @func303 (%Value* %8)
;stmt2:
  %10 = extractvalue %LLVM_Value %5, 1
  %11 = call i1 (%Type*) @func386 (%Type* %10)
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
  %17 = call i1 (%Type*) @func384 (%Type* %16)
  %18 = and i1 %15, %17
;stmt5:
  %19 = and i1 %18, 1
  br i1 %19, label %then_1, label %else_1
then_1:
;stmt6:
  %20 = extractvalue %LLVM_Value %5, 1
  %21 = extractvalue %LLVM_Value %9, 2
  %22 = trunc %Int64 %21 to %Nat32
  %23 = call %Nat32 (%Type*, %LLVM_Value, %Nat32) @func302 (%Type* %20, %LLVM_Value %5, %Nat32 %22)
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
  %28 = call %LLVM_Value (%LLVM_Value, %LLVM_Value) @func309 (%LLVM_Value %5, %LLVM_Value %9)
  ret %LLVM_Value %28
}

define %LLVM_Value @func310 (%Value*) {
;stmt0:
  %2 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 11
  %3 = getelementptr inbounds %ValueAccess, %ValueAccess* %2, i1 0, i32 1
  %4 = load %Str, %Str* %3
  %5 = icmp ne %Str %4, zeroinitializer
  %6 = bitcast [29 x %Nat8]* @func310_str1 to %Str
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
  %16 = call %LLVM_Value (%Value*) @func303 (%Value* %15)
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
  %31 = call %Decl* (%Type*, %Str) @func381 (%Type* %27, %Str %30)
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
  %38 = call %Nat32 (%Type*, %LLVM_Value, %Nat32) @func302 (%Type* %27, %LLVM_Value %16, %Nat32 %37)
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
  %44 = call %LLVM_Value (%LLVM_Value) @func345 (%LLVM_Value %16)
  br label %select_2_end
select_2_1:
  br label %select_2_end
select_2_end:
  %45 = phi %LLVM_Value [ %44, %select_2_0_ok ], [ %16, %select_2_1 ]
;stmt12:
  %46 = call %Nat32 (%Type*, %LLVM_Value) @func301 (%Type* %27, %LLVM_Value %45)
;stmt13:
  %47 = load %FILE*, %FILE** @fout
  %48 = bitcast [13 x %Nat8]* @func310_str2 to %Str
  %49 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %47, %Str %48, %Nat16 %33)
;stmt14:
  %50 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 1
  %51 = load %Type*, %Type** %50
  %52 = call %LLVM_Value (%Type*, %Nat32) @llval_create_adr (%Type* %51, %Nat32 %46)
  ret %LLVM_Value %52
}

define %LLVM_Value @func311 (%Value*) {
;stmt0:
  %2 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 8
  %3 = getelementptr inbounds %ValueUn, %ValueUn* %2, i1 0, i32 0
  %4 = load %Value*, %Value** %3
  %5 = call %LLVM_Value (%Value*) @func303 (%Value* %4)
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
  %14 = call %Nat32 (%Type*, %LLVM_Value) @func301 (%Type* %13, %LLVM_Value %5)
;stmt4:
  %15 = bitcast [5 x %Nat8]* @func311_str1 to %Str
  call void (%Str) @o (%Str %15)
;stmt5:
  %16 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 1
  %17 = load %Type*, %Type** %16
  %18 = call %LLVM_Value (%Type*, %Nat32) @llval_create_reg (%Type* %17, %Nat32 %14)
  ret %LLVM_Value %18
}

define %LLVM_Value @func312 (%Value*) {
;stmt0:
  %2 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 8
  %3 = getelementptr inbounds %ValueUn, %ValueUn* %2, i1 0, i32 0
  %4 = load %Value*, %Value** %3
  %5 = call %LLVM_Value (%Value*) @func303 (%Value* %4)
;stmt1:
  %6 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 1
  %7 = load %Type*, %Type** %6
  %8 = extractvalue %LLVM_Value %5, 4
  %9 = call %LLVM_Value (%Type*, %Nat32) @llval_create_adr (%Type* %7, %Nat32 %8)
  ret %LLVM_Value %9
}

define %LLVM_Value @func313 (%Value*) {
;stmt0:
  %2 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 8
  %3 = getelementptr inbounds %ValueUn, %ValueUn* %2, i1 0, i32 0
  %4 = load %Value*, %Value** %3
  %5 = call %LLVM_Value (%Value*) @func303 (%Value* %4)
;stmt1:
  %6 = bitcast [4 x %Nat8]* @func313_str1 to %Str
  %7 = extractvalue %LLVM_Value %5, 1
  %8 = call %Nat32 (%Str, %Type*) @func300 (%Str %6, %Type* %7)
;stmt2:
  call void () @space ()
;stmt3:
  call void (%LLVM_Value) @func347 (%LLVM_Value %5)
;stmt4:
  %9 = extractvalue %LLVM_Value %5, 1
  %10 = load %Type*, %Type** @typeBool
  %11 = call i1 (%Type*, %Type*) @func417 (%Type* %9, %Type* %10)
  br i1 %11, label %then_0, label %else_0
then_0:
;stmt5:
  %12 = bitcast [4 x %Nat8]* @func313_str2 to %Str
  call void (%Str) @o (%Str %12)
  br label %endif_0
else_0:
;stmt6:
  %13 = bitcast [5 x %Nat8]* @func313_str3 to %Str
  call void (%Str) @o (%Str %13)
  br label %endif_0
endif_0:
;stmt7:
  %14 = extractvalue %LLVM_Value %5, 1
  %15 = call %LLVM_Value (%Type*, %Nat32) @llval_create_reg (%Type* %14, %Nat32 %8)
  ret %LLVM_Value %15
}

define %LLVM_Value @func314 (%Value*) {
;stmt0:
  %2 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 8
  %3 = getelementptr inbounds %ValueUn, %ValueUn* %2, i1 0, i32 0
  %4 = load %Value*, %Value** %3
  %5 = call %LLVM_Value (%Value*) @func303 (%Value* %4)
;stmt1:
  %6 = load %Type*, %Type** @typeBaseInt
  %7 = call %LLVM_Value (%LLVM_ValueKind, %Type*, %Int64) @llval_create (%LLVM_ValueKind 2, %Type* %6, %Int64 0)
;stmt2:
  %8 = bitcast [8 x %Nat8]* @func314_str1 to %Str
  %9 = extractvalue %LLVM_Value %5, 1
  %10 = call %Nat32 (%Str, %LLVM_Value, %LLVM_Value, %Type*) @func329 (%Str %8, %LLVM_Value %7, %LLVM_Value %5, %Type* %9)
;stmt3:
  %11 = extractvalue %LLVM_Value %5, 1
  %12 = call %LLVM_Value (%Type*, %Nat32) @llval_create_reg (%Type* %11, %Nat32 %10)
  ret %LLVM_Value %12
}

define %LLVM_Value @func315 (%Value*) {
;stmt0:
  %2 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 8
  %3 = getelementptr inbounds %ValueUn, %ValueUn* %2, i1 0, i32 0
  %4 = load %Value*, %Value** %3
  %5 = call %LLVM_Value (%Value*) @func303 (%Value* %4)
  ret %LLVM_Value %5
}

define %LLVM_Value @func316 (%Str, %LLVM_Value, %Type*) {
;stmt0:
  %4 = extractvalue %LLVM_Value %1, 1
  %5 = call %Nat32 (%Str, %Type*) @func300 (%Str %0, %Type* %4)
;stmt1:
  call void () @space ()
;stmt2:
  call void (%LLVM_Value) @func347 (%LLVM_Value %1)
;stmt3:
  %6 = bitcast [5 x %Nat8]* @func316_str1 to %Str
  call void (%Str) @o (%Str %6)
;stmt4:
  call void (%Type*) @func365 (%Type* %2)
;stmt5:
  %7 = call %LLVM_Value (%Type*, %Nat32) @llval_create_reg (%Type* %2, %Nat32 %5)
  ret %LLVM_Value %7
}

define %LLVM_Value @func317 (%LLVM_Value, %Type*) {
;stmt0:
  %3 = extractvalue %LLVM_Value %0, 1
  %4 = getelementptr inbounds %Type, %Type* %3, i1 0, i32 0
  %5 = load %TypeKind, %TypeKind* %4
  br label %select_1_0
select_1_0:
  %6 = icmp eq %TypeKind %5, 4
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
;stmt0:
  %3 = bitcast [6 x %Nat8]* @func318_str1 to %Str
  %4 = call %LLVM_Value (%Str, %LLVM_Value, %Type*) @func316 (%Str %3, %LLVM_Value %0, %Type* %1)
  ret %LLVM_Value %4
}

define %LLVM_Value @func320 (%LLVM_Value, %Type*) {
;stmt0:
  %3 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 4
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
  %12 = bitcast [6 x %Nat8]* @func319_str1 to %Str
  %13 = call %LLVM_Value (%Str, %LLVM_Value, %Type*) @func316 (%Str %12, %LLVM_Value %0, %Type* %1)
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
  %8 = bitcast [6 x %Nat8]* @func321_str1 to %Str
  %9 = call %LLVM_Value (%Str, %LLVM_Value, %Type*) @func316 (%Str %8, %LLVM_Value %0, %Type* %1)
  br label %select_1_end
select_1_1:
  %10 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 4
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
;stmt0:
  %3 = extractvalue %LLVM_Value %0, 1
  %4 = getelementptr inbounds %Type, %Type* %3, i1 0, i32 0
  %5 = load %TypeKind, %TypeKind* %4
;stmt1:
  %6 = load %FILE*, %FILE** @fout
  %7 = bitcast [24 x %Nat8]* @func322_func323_str1 to %Str
  %8 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %6, %Str %7, %TypeKind %5)
;stmt2:
  %9 = bitcast [18 x %Nat8]* @func322_func323_str2 to %Str
  %10 = call %Int32 (%Str, ...) @printf (%Str %9, %TypeKind %5)
;stmt3:
  %11 = bitcast [19 x %Nat8]* @func322_func323_str3 to %Str
  call void (i1, %Str) @assert (i1 0, %Str %11)
;stmt4:
  %12 = call %LLVM_Value (%LLVM_ValueKind, %Type*, %Int64) @llval_create (%LLVM_ValueKind 0, %Type* zeroinitializer, %Int64 0)
  ret %LLVM_Value %12
}

define %LLVM_Value @func322 (%LLVM_Value, %Type*) {
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
  %9 = bitcast [9 x %Nat8]* @func322_str1 to %Str
  %10 = call %LLVM_Value (%Str, %LLVM_Value, %Type*) @func316 (%Str %9, %LLVM_Value %0, %Type* %1)
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
  %14 = bitcast [5 x %Nat8]* @func322_str2 to %Str
  %15 = call %LLVM_Value (%Str, %LLVM_Value, %Type*) @func316 (%Str %14, %LLVM_Value %0, %Type* %1)
  br label %select_1_end
select_1_4:
  %16 = icmp eq %TypeKind %5, 13
  br i1 %16, label %select_1_4_ok, label %select_1_5
select_1_4_ok:
  %17 = bitcast [8 x %Nat8]* @func322_str3 to %Str
  %18 = call %LLVM_Value (%Str, %LLVM_Value, %Type*) @func316 (%Str %17, %LLVM_Value %0, %Type* %1)
  br label %select_1_end
select_1_5:
  %19 = call %LLVM_Value (%LLVM_Value, %Type*) @func323 (%LLVM_Value %0, %Type* %1)
  br label %select_1_end
select_1_end:
  %20 = phi %LLVM_Value [ %7, %select_1_0_ok ], [ %10, %select_1_1_ok ], [ %12, %select_1_2_ok ], [ %15, %select_1_3_ok ], [ %18, %select_1_4_ok ], [ %19, %select_1_5 ]
  ret %LLVM_Value %20
}

define %LLVM_Value @func324 (%Value*) {
;stmt0:
  %2 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 13
  %3 = getelementptr inbounds %ValueAs, %ValueAs* %2, i1 0, i32 0
  %4 = load %Value*, %Value** %3
  %5 = call %LLVM_Value (%Value*) @func303 (%Value* %4)
;stmt1:
  %6 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 13
  %7 = getelementptr inbounds %ValueAs, %ValueAs* %6, i1 0, i32 1
  %8 = load %Type*, %Type** %7
;stmt2:
  %9 = load %Type*, %Type** @typeBool
  %10 = call %LLVM_Value (%LLVM_ValueKind, %Type*, %Int64) @llval_create (%LLVM_ValueKind 1, %Type* %9, %Int64 0)
  ret %LLVM_Value %10
}

define %LLVM_Value @func325 (%Value*) {
;stmt0:
  %2 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 14
  %3 = getelementptr inbounds %ValueIs, %ValueIs* %2, i1 0, i32 0
  %4 = load %Value*, %Value** %3
  %5 = call %LLVM_Value (%Value*) @func303 (%Value* %4)
;stmt1:
  %6 = bitcast [9 x %Nat8]* @func325_str1 to %Str
  %7 = load %Type*, %Type** @typeBaseInt
  %8 = call %LLVM_Value (%Str, %LLVM_Value, %Type*) @func316 (%Str %6, %LLVM_Value %5, %Type* %7)
;stmt2:
  %9 = load %Type*, %Type** @typeBaseInt
  %10 = call %LLVM_Value (%LLVM_ValueKind, %Type*, %Int64) @llval_create (%LLVM_ValueKind 2, %Type* %9, %Int64 0)
;stmt3:
  %11 = load %Type*, %Type** @typeBaseInt
  %12 = call %LLVM_Value (%LLVM_Value, %Type*) @func338 (%LLVM_Value %10, %Type* %11)
;stmt4:
  %13 = extractvalue %LLVM_Value %5, 1
  %14 = getelementptr inbounds %Type, %Type* %13, i1 0, i32 12
  %15 = getelementptr inbounds %TypeUnion, %TypeUnion* %14, i1 0, i32 1
  %16 = load %Type*, %Type** %15
  %17 = getelementptr inbounds %Type, %Type* %16, i1 0, i32 0
  %18 = load %TypeKind, %TypeKind* %17
  %19 = icmp eq %TypeKind %18, 10
  br i1 %19, label %then_0, label %else_0
then_0:
;stmt5:
  %20 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 14
  %21 = getelementptr inbounds %ValueIs, %ValueIs* %20, i1 0, i32 1
  %22 = load %Nat32, %Nat32* %21
  br label %select_1_0
select_1_0:
  %23 = icmp eq %Nat32 %22, 0
  br i1 %23, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %24 = bitcast [8 x %Nat8]* @func325_str2 to %Str
  %25 = load %Type*, %Type** @typeBaseInt
  %26 = call %Nat32 (%Str, %LLVM_Value, %LLVM_Value, %Type*) @func329 (%Str %24, %LLVM_Value %8, %LLVM_Value %12, %Type* %25)
  br label %select_1_end
select_1_1:
  %27 = icmp eq %Nat32 %22, 1
  br i1 %27, label %select_1_1_ok, label %select_1_2
select_1_1_ok:
  %28 = bitcast [8 x %Nat8]* @func325_str3 to %Str
  %29 = load %Type*, %Type** @typeBaseInt
  %30 = call %Nat32 (%Str, %LLVM_Value, %LLVM_Value, %Type*) @func329 (%Str %28, %LLVM_Value %8, %LLVM_Value %12, %Type* %29)
  br label %select_1_end
select_1_2:
  %31 = bitcast %Nat32 0 to %Nat32
  br label %select_1_end
select_1_end:
  %32 = phi %Nat32 [ %26, %select_1_0_ok ], [ %30, %select_1_1_ok ], [ %31, %select_1_2 ]
;stmt6:
  %33 = load %Type*, %Type** @typeBool
  %34 = call %LLVM_Value (%Type*, %Nat32) @llval_create_reg (%Type* %33, %Nat32 %32)
  ret %LLVM_Value %34
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt7:
  %36 = bitcast [8 x %Nat8]* @func325_str4 to %Str
  %37 = load %Type*, %Type** @typeBaseInt
  %38 = call %Nat32 (%Str, %LLVM_Value, %LLVM_Value, %Type*) @func329 (%Str %36, %LLVM_Value %8, %LLVM_Value %12, %Type* %37)
;stmt8:
  %39 = load %Type*, %Type** @typeBool
  %40 = call %LLVM_Value (%Type*, %Nat32) @llval_create_reg (%Type* %39, %Nat32 %38)
  ret %LLVM_Value %40
}

define %LLVM_Value @eval_cast_to_union (%LLVM_Value, %Type*) {
;stmt0:
  br label %select_1_0
select_1_0:
  %3 = extractvalue %LLVM_Value %0, 1
  %4 = load %Type*, %Type** @typeUnit
  %5 = call i1 (%Type*, %Type*) @func417 (%Type* %3, %Type* %4)
  %6 = icmp eq i1 1, %5
  br i1 %6, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %7 = bitcast [9 x %Nat8]* @func326_str1 to %Str
  %8 = call %LLVM_Value (%Str, %LLVM_Value, %Type*) @func316 (%Str %7, %LLVM_Value %0, %Type* %1)
  br label %select_1_end
select_1_1:
  %9 = extractvalue %LLVM_Value %0, 1
  %10 = getelementptr inbounds %Type, %Type* %9, i1 0, i32 0
  %11 = load %TypeKind, %TypeKind* %10
  %12 = icmp eq %TypeKind %11, 4
  %13 = icmp eq i1 1, %12
  br i1 %13, label %select_1_1_ok, label %select_1_2
select_1_1_ok:
  %14 = bitcast [9 x %Nat8]* @func326_str2 to %Str
  %15 = call %LLVM_Value (%Str, %LLVM_Value, %Type*) @func316 (%Str %14, %LLVM_Value %0, %Type* %1)
  br label %select_1_end
select_1_2:
  %16 = bitcast [8 x %Nat8]* @func326_str3 to %Str
  %17 = call %LLVM_Value (%Str, %LLVM_Value, %Type*) @func316 (%Str %16, %LLVM_Value %0, %Type* %1)
  br label %select_1_end
select_1_end:
  %18 = phi %LLVM_Value [ %8, %select_1_0_ok ], [ %15, %select_1_1_ok ], [ %17, %select_1_2 ]
  ret %LLVM_Value %18
}

define %LLVM_Value @func328 (%LLVM_Value, %Type*) {
;stmt0:
  %3 = bitcast [18 x %Nat8]* @func327_func328_str1 to %Str
  %4 = call %Int32 (%Str, ...) @printf (%Str %3)
;stmt1:
  %5 = extractvalue %LLVM_Value %0, 1
  call void (%Type*) @func81 (%Type* %5)
;stmt2:
  %6 = bitcast [6 x %Nat8]* @func327_func328_str2 to %Str
  %7 = call %Int32 (%Str, ...) @printf (%Str %6)
;stmt3:
  call void (%Type*) @func81 (%Type* %1)
;stmt4:
  %8 = bitcast [2 x %Nat8]* @func327_func328_str3 to %Str
  %9 = call %Int32 (%Str, ...) @printf (%Str %8)
;stmt5:
  %10 = bitcast [16 x %Nat8]* @func327_func328_str4 to %Str
  call void (%Str) @fatal (%Str %10)
;stmt6:
  %11 = call %LLVM_Value (%LLVM_ValueKind, %Type*, %Int64) @llval_create (%LLVM_ValueKind 0, %Type* %1, %Int64 0)
  ret %LLVM_Value %11
}

define %LLVM_Value @func327 (%Value*) {
;stmt0:
  %2 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 12
  %3 = getelementptr inbounds %ValueCast, %ValueCast* %2, i1 0, i32 0
  %4 = load %Value*, %Value** %3
  %5 = call %LLVM_Value (%Value*) @func303 (%Value* %4)
;stmt1:
  %6 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 12
  %7 = getelementptr inbounds %ValueCast, %ValueCast* %6, i1 0, i32 1
  %8 = load %Type*, %Type** %7
;stmt2:
  br label %select_1_0
select_1_0:
  %9 = call i1 (%Type*) @func383 (%Type* %8)
  %10 = icmp eq i1 1, %9
  br i1 %10, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %11 = call %LLVM_Value (%LLVM_Value, %Type*) @func317 (%LLVM_Value %5, %Type* %8)
  br label %select_1_end
select_1_1:
  %12 = getelementptr inbounds %Type, %Type* %8, i1 0, i32 0
  %13 = load %TypeKind, %TypeKind* %12
  %14 = icmp eq %TypeKind %13, 6
  %15 = icmp eq i1 1, %14
  br i1 %15, label %select_1_1_ok, label %select_1_2
select_1_1_ok:
  %16 = call %LLVM_Value (%LLVM_Value, %Type*) @func318 (%LLVM_Value %5, %Type* %8)
  br label %select_1_end
select_1_2:
  %17 = getelementptr inbounds %Type, %Type* %8, i1 0, i32 0
  %18 = load %TypeKind, %TypeKind* %17
  %19 = icmp eq %TypeKind %18, 4
  %20 = icmp eq i1 1, %19
  br i1 %20, label %select_1_2_ok, label %select_1_3
select_1_2_ok:
  %21 = call %LLVM_Value (%LLVM_Value, %Type*) @func322 (%LLVM_Value %5, %Type* %8)
  br label %select_1_end
select_1_3:
  %22 = getelementptr inbounds %Type, %Type* %8, i1 0, i32 0
  %23 = load %TypeKind, %TypeKind* %22
  %24 = icmp eq %TypeKind %23, 13
  %25 = icmp eq i1 1, %24
  br i1 %25, label %select_1_3_ok, label %select_1_4
select_1_3_ok:
  %26 = call %LLVM_Value (%LLVM_Value, %Type*) @eval_cast_to_union (%LLVM_Value %5, %Type* %8)
  br label %select_1_end
select_1_4:
  %27 = load %Type*, %Type** @typeUnit
  %28 = call i1 (%Type*, %Type*) @func417 (%Type* %8, %Type* %27)
  %29 = icmp eq i1 1, %28
  br i1 %29, label %select_1_4_ok, label %select_1_5
select_1_4_ok:
  %30 = call %LLVM_Value (%LLVM_ValueKind, %Type*, %Int64) @llval_create (%LLVM_ValueKind 1, %Type* %8, %Int64 0)
  br label %select_1_end
select_1_5:
  %31 = call %LLVM_Value (%LLVM_Value, %Type*) @func328 (%LLVM_Value %5, %Type* %8)
  br label %select_1_end
select_1_end:
  %32 = phi %LLVM_Value [ %11, %select_1_0_ok ], [ %16, %select_1_1_ok ], [ %21, %select_1_2_ok ], [ %26, %select_1_3_ok ], [ %30, %select_1_4_ok ], [ %31, %select_1_5 ]
  ret %LLVM_Value %32
}

define %Nat32 @func329 (%Str, %LLVM_Value, %LLVM_Value, %Type*) {
;stmt0:
  %5 = call %Nat32 (%Str, %Type*) @func300 (%Str %0, %Type* %3)
;stmt1:
  call void () @space ()
;stmt2:
  call void (%LLVM_Value) @func347 (%LLVM_Value %1)
;stmt3:
  call void () @comma ()
;stmt4:
  call void (%LLVM_Value) @func347 (%LLVM_Value %2)
;stmt5:
  ret %Nat32 %5
}

define %Str @func331 (i1) {
;stmt0:
  br i1 %0, label %then_0, label %else_0
then_0:
;stmt1:
  %2 = bitcast [5 x %Nat8]* @func330_func331_str1 to %Str
  ret %Str %2
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt2:
  %4 = bitcast [5 x %Nat8]* @func330_func331_str2 to %Str
  ret %Str %4
}

define %Str @func332 (i1) {
;stmt0:
  br i1 %0, label %then_0, label %else_0
then_0:
;stmt1:
  %2 = bitcast [5 x %Nat8]* @func330_func332_str1 to %Str
  ret %Str %2
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt2:
  %4 = bitcast [5 x %Nat8]* @func330_func332_str2 to %Str
  ret %Str %4
}

define %Str @func333 (i1) {
;stmt0:
  br i1 %0, label %then_0, label %else_0
then_0:
;stmt1:
  %2 = bitcast [9 x %Nat8]* @func330_func333_str1 to %Str
  ret %Str %2
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt2:
  %4 = bitcast [9 x %Nat8]* @func330_func333_str2 to %Str
  ret %Str %4
}

define %Str @func334 (i1) {
;stmt0:
  br i1 %0, label %then_0, label %else_0
then_0:
;stmt1:
  %2 = bitcast [9 x %Nat8]* @func330_func334_str1 to %Str
  ret %Str %2
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt2:
  %4 = bitcast [9 x %Nat8]* @func330_func334_str2 to %Str
  ret %Str %4
}

define %Str @func335 (i1) {
;stmt0:
  br i1 %0, label %then_0, label %else_0
then_0:
;stmt1:
  %2 = bitcast [9 x %Nat8]* @func330_func335_str1 to %Str
  ret %Str %2
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt2:
  %4 = bitcast [9 x %Nat8]* @func330_func335_str2 to %Str
  ret %Str %4
}

define %Str @func336 (i1) {
;stmt0:
  br i1 %0, label %then_0, label %else_0
then_0:
;stmt1:
  %2 = bitcast [9 x %Nat8]* @func330_func336_str1 to %Str
  ret %Str %2
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt2:
  %4 = bitcast [9 x %Nat8]* @func330_func336_str2 to %Str
  ret %Str %4
}

define %Str @func337 (i1) {
;stmt0:
  br i1 %0, label %then_0, label %else_0
then_0:
;stmt1:
  %2 = bitcast [5 x %Nat8]* @func330_func337_str1 to %Str
  ret %Str %2
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt2:
  %4 = bitcast [5 x %Nat8]* @func330_func337_str2 to %Str
  ret %Str %4
}

define %LLVM_Value @func330 (%Value*) {
;stmt0:
  %2 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 9
  %3 = getelementptr inbounds %ValueBin, %ValueBin* %2, i1 0, i32 0
  %4 = load %Value*, %Value** %3
  %5 = call %LLVM_Value (%Value*) @func303 (%Value* %4)
;stmt1:
  %6 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 9
  %7 = getelementptr inbounds %ValueBin, %ValueBin* %6, i1 0, i32 1
  %8 = load %Value*, %Value** %7
  %9 = call %LLVM_Value (%Value*) @func303 (%Value* %8)
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
  %17 = bitcast [4 x %Nat8]* @func330_str1 to %Str
  br label %select_1_end
select_1_1:
  %18 = icmp eq %ValueKind %15, 15
  br i1 %18, label %select_1_1_ok, label %select_1_2
select_1_1_ok:
  %19 = bitcast [4 x %Nat8]* @func330_str2 to %Str
  br label %select_1_end
select_1_2:
  %20 = icmp eq %ValueKind %15, 16
  br i1 %20, label %select_1_2_ok, label %select_1_3
select_1_2_ok:
  %21 = bitcast [4 x %Nat8]* @func330_str3 to %Str
  br label %select_1_end
select_1_3:
  %22 = icmp eq %ValueKind %15, 17
  br i1 %22, label %select_1_3_ok, label %select_1_4
select_1_3_ok:
  %23 = call %Str (i1) @func331 (i1 %13)
  br label %select_1_end
select_1_4:
  %24 = icmp eq %ValueKind %15, 18
  br i1 %24, label %select_1_4_ok, label %select_1_5
select_1_4_ok:
  %25 = call %Str (i1) @func332 (i1 %13)
  br label %select_1_end
select_1_5:
  %26 = icmp eq %ValueKind %15, 19
  br i1 %26, label %select_1_5_ok, label %select_1_6
select_1_5_ok:
  %27 = bitcast [3 x %Nat8]* @func330_str4 to %Str
  br label %select_1_end
select_1_6:
  %28 = icmp eq %ValueKind %15, 20
  br i1 %28, label %select_1_6_ok, label %select_1_7
select_1_6_ok:
  %29 = bitcast [4 x %Nat8]* @func330_str5 to %Str
  br label %select_1_end
select_1_7:
  %30 = icmp eq %ValueKind %15, 21
  br i1 %30, label %select_1_7_ok, label %select_1_8
select_1_7_ok:
  %31 = bitcast [4 x %Nat8]* @func330_str6 to %Str
  br label %select_1_end
select_1_8:
  %32 = icmp eq %ValueKind %15, 22
  br i1 %32, label %select_1_8_ok, label %select_1_9
select_1_8_ok:
  %33 = bitcast [8 x %Nat8]* @func330_str7 to %Str
  br label %select_1_end
select_1_9:
  %34 = icmp eq %ValueKind %15, 23
  br i1 %34, label %select_1_9_ok, label %select_1_10
select_1_9_ok:
  %35 = bitcast [8 x %Nat8]* @func330_str8 to %Str
  br label %select_1_end
select_1_10:
  %36 = icmp eq %ValueKind %15, 24
  br i1 %36, label %select_1_10_ok, label %select_1_11
select_1_10_ok:
  %37 = call %Str (i1) @func333 (i1 %13)
  br label %select_1_end
select_1_11:
  %38 = icmp eq %ValueKind %15, 25
  br i1 %38, label %select_1_11_ok, label %select_1_12
select_1_11_ok:
  %39 = call %Str (i1) @func334 (i1 %13)
  br label %select_1_end
select_1_12:
  %40 = icmp eq %ValueKind %15, 26
  br i1 %40, label %select_1_12_ok, label %select_1_13
select_1_12_ok:
  %41 = call %Str (i1) @func335 (i1 %13)
  br label %select_1_end
select_1_13:
  %42 = icmp eq %ValueKind %15, 27
  br i1 %42, label %select_1_13_ok, label %select_1_14
select_1_13_ok:
  %43 = call %Str (i1) @func336 (i1 %13)
  br label %select_1_end
select_1_14:
  %44 = icmp eq %ValueKind %15, 29
  br i1 %44, label %select_1_14_ok, label %select_1_15
select_1_14_ok:
  %45 = bitcast [4 x %Nat8]* @func330_str9 to %Str
  br label %select_1_end
select_1_15:
  %46 = icmp eq %ValueKind %15, 30
  br i1 %46, label %select_1_15_ok, label %select_1_16
select_1_15_ok:
  %47 = call %Str (i1) @func337 (i1 %13)
  br label %select_1_end
select_1_16:
  %48 = bitcast [27 x %Nat8]* @func330_str10 to %Str
  br label %select_1_end
select_1_end:
  %49 = phi %Str [ %17, %select_1_0_ok ], [ %19, %select_1_1_ok ], [ %21, %select_1_2_ok ], [ %23, %select_1_3_ok ], [ %25, %select_1_4_ok ], [ %27, %select_1_5_ok ], [ %29, %select_1_6_ok ], [ %31, %select_1_7_ok ], [ %33, %select_1_8_ok ], [ %35, %select_1_9_ok ], [ %37, %select_1_10_ok ], [ %39, %select_1_11_ok ], [ %41, %select_1_12_ok ], [ %43, %select_1_13_ok ], [ %45, %select_1_14_ok ], [ %47, %select_1_15_ok ], [ %48, %select_1_16 ]
;stmt4:
  %50 = extractvalue %LLVM_Value %5, 1
  %51 = call %Nat32 (%Str, %LLVM_Value, %LLVM_Value, %Type*) @func329 (%Str %49, %LLVM_Value %5, %LLVM_Value %9, %Type* %50)
;stmt5:
  %52 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 1
  %53 = load %Type*, %Type** %52
  %54 = call %LLVM_Value (%Type*, %Nat32) @llval_create_reg (%Type* %53, %Nat32 %51)
  ret %LLVM_Value %54
}

define %LLVM_Value @func338 (%LLVM_Value, %Type*) {
;stmt0:
  %3 = bitcast [8 x %Nat8]* @func338_str1 to %Str
  %4 = extractvalue %LLVM_Value %0, 1
  %5 = call %LLVM_Value (%Str, %LLVM_Value, %Type*) @func316 (%Str %3, %LLVM_Value %0, %Type* %4)
  ret %LLVM_Value %5
}

define %LLVM_Value @loadImmPtr (%LLVM_Value) {
;stmt0:
  %2 = bitcast [9 x %Nat8]* @func339_str1 to %Str
  %3 = extractvalue %LLVM_Value %0, 1
  %4 = call %LLVM_Value (%Str, %LLVM_Value, %Type*) @func316 (%Str %2, %LLVM_Value %0, %Type* %3)
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
  %5 = bitcast [8 x %Nat8]* @func340_str1 to %Str
  %6 = call %LLVM_Value (%Str, %LLVM_Value, %Type*) @func316 (%Str %5, %LLVM_Value %0, %Type* %1)
  br label %select_1_end
select_1_1:
  br label %select_1_end
select_1_end:
  %7 = phi %LLVM_Value [ %6, %select_1_0_ok ], [ %0, %select_1_1 ]
  ret %LLVM_Value %7
}

define void @func342 (%Unit*, %Unit*, %Nat32, %Node*) {
;stmt0:
  %5 = bitcast %Unit* %0 to %ValueSelectVariant*
;stmt1:
  %6 = bitcast %Unit* %1 to %func341.type2*
;stmt2:
  %7 = load %FILE*, %FILE** @fout
  %8 = bitcast [15 x %Nat8]* @func341_func342_str1 to %Str
  %9 = getelementptr inbounds %func341.type2, %func341.type2* %6, i1 0, i32 1
  %10 = load %Nat32, %Nat32* %9
  %11 = getelementptr inbounds %func341.type2, %func341.type2* %6, i1 0, i32 2
  %12 = load %Nat32, %Nat32* %11
  %13 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %7, %Str %8, %Nat32 %10, %Nat32 %12)
;stmt3:
  %14 = getelementptr inbounds %ValueSelectVariant, %ValueSelectVariant* %5, i1 0, i32 0
  %15 = load %Value*, %Value** %14
  %16 = call %LLVM_Value (%Value*) @func303 (%Value* %15)
;stmt4:
  %17 = bitcast [8 x %Nat8]* @func341_func342_str2 to %Str
  %18 = extractvalue %LLVM_Value %16, 1
  %19 = call %Nat32 (%Str, %Type*) @func300 (%Str %17, %Type* %18)
;stmt5:
  call void () @space ()
;stmt6:
  %20 = getelementptr inbounds %func341.type2, %func341.type2* %6, i1 0, i32 0
  %21 = load %LLVM_Value, %LLVM_Value* %20
  call void (%LLVM_Value) @func347 (%LLVM_Value %21)
;stmt7:
  call void () @comma ()
;stmt8:
  call void (%LLVM_Value) @func347 (%LLVM_Value %16)
;stmt9:
  %22 = load %FILE*, %FILE** @fout
  %23 = bitcast [14 x %Nat8]* @func341_func342_str3 to %Str
  %24 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %22, %Str %23, %Nat32 %19)
;stmt10:
  %25 = load %FILE*, %FILE** @fout
  %26 = bitcast [48 x %Nat8]* @func341_func342_str4 to %Str
  %27 = getelementptr inbounds %func341.type2, %func341.type2* %6, i1 0, i32 1
  %28 = load %Nat32, %Nat32* %27
  %29 = getelementptr inbounds %func341.type2, %func341.type2* %6, i1 0, i32 2
  %30 = load %Nat32, %Nat32* %29
  %31 = getelementptr inbounds %func341.type2, %func341.type2* %6, i1 0, i32 1
  %32 = load %Nat32, %Nat32* %31
  %33 = getelementptr inbounds %func341.type2, %func341.type2* %6, i1 0, i32 2
  %34 = load %Nat32, %Nat32* %33
  %35 = add %Nat32 %34, 1
  %36 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %25, %Str %26, %Nat32 %28, %Nat32 %30, %Nat32 %32, %Nat32 %35)
;stmt11:
  %37 = load %FILE*, %FILE** @fout
  %38 = bitcast [18 x %Nat8]* @func341_func342_str5 to %Str
  %39 = getelementptr inbounds %func341.type2, %func341.type2* %6, i1 0, i32 1
  %40 = load %Nat32, %Nat32* %39
  %41 = getelementptr inbounds %func341.type2, %func341.type2* %6, i1 0, i32 2
  %42 = load %Nat32, %Nat32* %41
  %43 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %37, %Str %38, %Nat32 %40, %Nat32 %42)
;stmt12:
  %44 = getelementptr inbounds %ValueSelectVariant, %ValueSelectVariant* %5, i1 0, i32 1
  %45 = load %Value*, %Value** %44
  %46 = call %LLVM_Value (%Value*) @func303 (%Value* %45)
;stmt13:
  %47 = getelementptr inbounds %func341.type2, %func341.type2* %6, i1 0, i32 4
  %48 = load %Type*, %Type** %47
  %49 = call %LLVM_Value (%LLVM_Value, %Type*) @loadIfImmAs (%LLVM_Value %46, %Type* %48)
;stmt14:
  %50 = load %FILE*, %FILE** @fout
  %51 = bitcast [28 x %Nat8]* @func341_func342_str6 to %Str
  %52 = getelementptr inbounds %func341.type2, %func341.type2* %6, i1 0, i32 1
  %53 = load %Nat32, %Nat32* %52
  %54 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %50, %Str %51, %Nat32 %53)
;stmt15:
  %55 = getelementptr inbounds %func341.type2, %func341.type2* %6, i1 0, i32 3
; index array
  %56 = getelementptr inbounds [256 x %Nat32], [256 x %Nat32]* %55, i1 0, %Nat32 %2
  %57 = extractvalue %LLVM_Value %49, 4
  store %Nat32 %57, %Nat32* %56, align 4
;stmt16:
  %58 = getelementptr inbounds %func341.type2, %func341.type2* %6, i1 0, i32 2
  %59 = getelementptr inbounds %func341.type2, %func341.type2* %6, i1 0, i32 2
  %60 = load %Nat32, %Nat32* %59
  %61 = add %Nat32 %60, 1
  store %Nat32 %61, %Nat32* %58, align 4
  ret void
}

define %LLVM_Value @func341 (%Value*) {
;stmt0:
  %2 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 17
  %3 = getelementptr inbounds %ValueSelect, %ValueSelect* %2, i1 0, i32 0
  %4 = load %Value*, %Value** %3
  %5 = call %LLVM_Value (%Value*) @func303 (%Value* %4)
;stmt1:
  %6 = load %Nat32, %Nat32* @select_no
  %7 = add %Nat32 %6, 1
  store %Nat32 %7, %Nat32* @select_no, align 4
;stmt2:
  %8 = load %Nat32, %Nat32* @select_no
;stmt3:
  %9 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 17
  %10 = getelementptr inbounds %ValueSelect, %ValueSelect* %9, i1 0, i32 1
  %11 = getelementptr inbounds %List, %List* %10, i1 0, i32 2
  %12 = load %Nat64, %Nat64* %11
;stmt4:
  %13 = alloca %func341.type2
  store %func341.type2 zeroinitializer, %func341.type2* %13, align 8
;stmt5:
  %14 = getelementptr inbounds %func341.type2, %func341.type2* %13, i1 0, i32 0
  store %LLVM_Value %5, %LLVM_Value* %14, align 8
;stmt6:
  %15 = getelementptr inbounds %func341.type2, %func341.type2* %13, i1 0, i32 2
  store %Nat32 0, %Nat32* %15, align 4
;stmt7:
  %16 = getelementptr inbounds %func341.type2, %func341.type2* %13, i1 0, i32 1
  store %Nat32 %8, %Nat32* %16, align 4
;stmt8:
  %17 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 1
  %18 = load %Type*, %Type** %17
;stmt9:
  %19 = getelementptr inbounds %func341.type2, %func341.type2* %13, i1 0, i32 4
  store %Type* %18, %Type** %19, align 8
;stmt10:
  %20 = load %FILE*, %FILE** @fout
  %21 = bitcast [26 x %Nat8]* @func341_str1 to %Str
  %22 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %20, %Str %21, %Nat32 %8)
;stmt11:
  %23 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 17
  %24 = getelementptr inbounds %ValueSelect, %ValueSelect* %23, i1 0, i32 1
  %25 = getelementptr inbounds %func341.type2, %func341.type2* %13, i1 0
  %26 = bitcast %func341.type2* %25 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @func64 (%List* %24, %ListForeachHandler @func342, %Unit* %26)
;stmt12:
  %27 = load %FILE*, %FILE** @fout
  %28 = bitcast [15 x %Nat8]* @func341_str2 to %Str
  %29 = getelementptr inbounds %func341.type2, %func341.type2* %13, i1 0, i32 2
  %30 = load %Nat32, %Nat32* %29
  %31 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %27, %Str %28, %Nat32 %8, %Nat32 %30)
;stmt13:
  %32 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 17
  %33 = getelementptr inbounds %ValueSelect, %ValueSelect* %32, i1 0, i32 2
  %34 = load %Value*, %Value** %33
  %35 = call %LLVM_Value (%Value*) @func303 (%Value* %34)
  %36 = getelementptr inbounds %func341.type2, %func341.type2* %13, i1 0, i32 4
  %37 = load %Type*, %Type** %36
  %38 = call %LLVM_Value (%LLVM_Value, %Type*) @loadIfImmAs (%LLVM_Value %35, %Type* %37)
;stmt14:
  %39 = load %FILE*, %FILE** @fout
  %40 = bitcast [28 x %Nat8]* @func341_str3 to %Str
  %41 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %39, %Str %40, %Nat32 %8)
;stmt15:
  %42 = load %FILE*, %FILE** @fout
  %43 = bitcast [16 x %Nat8]* @func341_str4 to %Str
  %44 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %42, %Str %43, %Nat32 %8)
;stmt16:
  %45 = load %Type*, %Type** @typeUnit
  %46 = call i1 (%Type*, %Type*) @func417 (%Type* %18, %Type* %45)
  %47 = xor i1 %46, 1
  br i1 %47, label %then_0, label %else_0
then_0:
;stmt17:
  %48 = bitcast [4 x %Nat8]* @func341_str5 to %Str
  %49 = call %Nat32 (%Str, %Type*) @func300 (%Str %48, %Type* %18)
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
  %54 = bitcast [30 x %Nat8]* @func341_str6 to %Str
  %55 = getelementptr inbounds %func341.type2, %func341.type2* %13, i1 0, i32 3
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
  %64 = bitcast [25 x %Nat8]* @func341_str7 to %Str
  %65 = extractvalue %LLVM_Value %38, 4
  %66 = getelementptr inbounds %func341.type2, %func341.type2* %13, i1 0, i32 2
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

define void @func343 (%Value*, %Value*) {
;stmt0:
  %3 = call %LLVM_Value (%Value*) @func303 (%Value* %0)
;stmt1:
  %4 = call %LLVM_Value (%Value*) @func303 (%Value* %1)
;stmt2:
  call void (%LLVM_Value, %LLVM_Value) @func344 (%LLVM_Value %3, %LLVM_Value %4)
  ret void
}

define void @func344 (%LLVM_Value, %LLVM_Value) {
;stmt0:
  %3 = extractvalue %LLVM_Value %1, 1
;stmt1:
  %4 = load %FILE*, %FILE** @fout
  %5 = bitcast [10 x %Nat8]* @func344_str1 to %Str
  %6 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %4, %Str %5)
;stmt2:
  call void (%Type*) @func365 (%Type* %3)
;stmt3:
  call void () @space ()
;stmt4:
  call void (%LLVM_Value) @func347 (%LLVM_Value %1)
;stmt5:
  call void () @comma ()
;stmt6:
  call void (%Type*) @func365 (%Type* %3)
;stmt7:
  %7 = bitcast [3 x %Nat8]* @func344_str2 to %Str
  call void (%Str) @o (%Str %7)
;stmt8:
  call void (%LLVM_Value) @func347 (%LLVM_Value %0)
;stmt9:
  %8 = load %FILE*, %FILE** @fout
  %9 = bitcast [11 x %Nat8]* @func344_str3 to %Str
  %10 = getelementptr inbounds %Type, %Type* %3, i1 0, i32 3
  %11 = load %Nat32, %Nat32* %10
  %12 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %8, %Str %9, %Nat32 %11)
  ret void
}

define %LLVM_Value @func345 (%LLVM_Value) {
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
  %7 = call i1 (%Type*) @func383 (%Type* %6)
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
  %19 = bitcast [5 x %Nat8]* @func345_str1 to %Str
  %20 = call %Nat32 (%Str, %Type*) @func300 (%Str %19, %Type* %18)
;stmt9:
  call void () @comma ()
;stmt10:
  call void (%Type*) @func365 (%Type* %18)
;stmt11:
  %21 = bitcast [3 x %Nat8]* @func345_str2 to %Str
  call void (%Str) @o (%Str %21)
;stmt12:
  call void (%LLVM_Value) @func347 (%LLVM_Value %0)
;stmt13:
  %22 = call %LLVM_Value (%Type*, %Nat32) @llval_create_reg (%Type* %18, %Nat32 %20)
  ret %LLVM_Value %22
}

define %Int32 @print_val_imm (%LLVM_Value) {
;stmt0:
  %2 = extractvalue %LLVM_Value %0, 1
;stmt1:
  %3 = call i1 (%Type*) @func383 (%Type* %2)
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
  %18 = call i1 (%Type*) @func383 (%Type* %17)
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
  %27 = bitcast [16 x %Nat8]* @func346_str1 to %Str
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
  %32 = bitcast [16 x %Nat8]* @func346_str2 to %Str
  call void (%Str) @o (%Str %32)
  br label %endif_2
else_2:
;stmt9:
  %33 = load %FILE*, %FILE** @fout
  %34 = bitcast [5 x %Nat8]* @func346_str3 to %Str
  %35 = extractvalue %LLVM_Value %0, 2
  %36 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %33, %Str %34, %Int64 %35)
  br label %endif_2
endif_2:
;stmt10:
  ret %Int32 0
}

define void @func347 (%LLVM_Value) {
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
  %7 = bitcast [5 x %Nat8]* @func347_str1 to %Str
  %8 = extractvalue %LLVM_Value %0, 4
  %9 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %6, %Str %7, %Nat32 %8)
  br label %select_1_end
select_1_2:
  %10 = icmp eq %LLVM_ValueKind %2, 6
  br i1 %10, label %select_1_2_ok, label %select_1_3
select_1_2_ok:
  %11 = load %FILE*, %FILE** @fout
  %12 = bitcast [5 x %Nat8]* @func347_str2 to %Str
  %13 = extractvalue %LLVM_Value %0, 4
  %14 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %11, %Str %12, %Nat32 %13)
  br label %select_1_end
select_1_3:
  %15 = icmp eq %LLVM_ValueKind %2, 5
  br i1 %15, label %select_1_3_ok, label %select_1_4
select_1_3_ok:
  %16 = load %FILE*, %FILE** @fout
  %17 = bitcast [4 x %Nat8]* @func347_str3 to %Str
  %18 = extractvalue %LLVM_Value %0, 3
  %19 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %16, %Str %17, %Str %18)
  br label %select_1_end
select_1_4:
  %20 = icmp eq %LLVM_ValueKind %2, 3
  br i1 %20, label %select_1_4_ok, label %select_1_5
select_1_4_ok:
  %21 = load %FILE*, %FILE** @fout
  %22 = bitcast [4 x %Nat8]* @func347_str4 to %Str
  %23 = extractvalue %LLVM_Value %0, 3
  %24 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %21, %Str %22, %Str %23)
  br label %select_1_end
select_1_5:
  %25 = icmp eq %LLVM_ValueKind %2, 4
  br i1 %25, label %select_1_5_ok, label %select_1_6
select_1_5_ok:
  %26 = load %FILE*, %FILE** @fout
  %27 = bitcast [5 x %Nat8]* @func347_str5 to %Str
  %28 = extractvalue %LLVM_Value %0, 4
  %29 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %26, %Str %27, %Nat32 %28)
  br label %select_1_end
select_1_6:
  %30 = load %FILE*, %FILE** @fout
  %31 = bitcast [32 x %Nat8]* @func347_str6 to %Str
  %32 = extractvalue %LLVM_Value %0, 0
  %33 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %30, %Str %31, %LLVM_ValueKind %32)
  br label %select_1_end
select_1_end:
  %34 = phi %Int32 [ %4, %select_1_0_ok ], [ %9, %select_1_1_ok ], [ %14, %select_1_2_ok ], [ %19, %select_1_3_ok ], [ %24, %select_1_4_ok ], [ %29, %select_1_5_ok ], [ %33, %select_1_6 ]
  ret void
}

define void @func348 (%LLVM_Value) {
;stmt0:
  %2 = extractvalue %LLVM_Value %0, 1
  call void (%Type*) @func365 (%Type* %2)
;stmt1:
  call void () @space ()
;stmt2:
  call void (%LLVM_Value) @func347 (%LLVM_Value %0)
  ret void
}

define %LLVM_Value @func349 (%LLVM_Value) {
;stmt0:
  %2 = bitcast [12 x %Nat8]* @func349_str1 to %Str
  %3 = extractvalue %LLVM_Value %0, 1
  %4 = call %Nat32 (%Str, %Type*) @func300 (%Str %2, %Type* %3)
;stmt1:
  %5 = bitcast [9 x %Nat8]* @func349_str2 to %Str
  call void (%Str) @o (%Str %5)
;stmt2:
  %6 = extractvalue %LLVM_Value %0, 1
  %7 = call %LLVM_Value (%Type*, %Nat32) @llval_create_reg (%Type* %6, %Nat32 %4)
  ret %LLVM_Value %7
}

define void @func350 (%Stmt*) {
;stmt0:
  %2 = getelementptr inbounds %Stmt, %Stmt* %0, i1 0, i32 0
  %3 = load %StmtKind, %StmtKind* %2
;stmt1:
  %4 = icmp ne %StmtKind %3, 2
  br i1 %4, label %then_0, label %else_0
then_0:
;stmt2:
  %5 = load %FILE*, %FILE** @fout
  %6 = bitcast [10 x %Nat8]* @func350_str1 to %Str
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
  call void (%Block*) @func360 (%Block* %12)
  br label %select_1_end
select_1_1:
  %13 = icmp eq %StmtKind %3, 1
  br i1 %13, label %select_1_1_ok, label %select_1_2
select_1_1_ok:
  %14 = getelementptr inbounds %Stmt, %Stmt* %0, i1 0, i32 3
  call void (%Expr*) @func352 (%Expr* %14)
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
  call void (%Value*, %Value*) @func343 (%Value* %18, %Value* %21)
  br label %select_1_end
select_1_3:
  %22 = icmp eq %StmtKind %3, 3
  br i1 %22, label %select_1_3_ok, label %select_1_4
select_1_3_ok:
  %23 = getelementptr inbounds %Stmt, %Stmt* %0, i1 0, i32 4
  %24 = load %Decl*, %Decl** %23
  call void (%Decl*) @func351 (%Decl* %24)
  br label %select_1_end
select_1_4:
  %25 = icmp eq %StmtKind %3, 5
  br i1 %25, label %select_1_4_ok, label %select_1_5
select_1_4_ok:
  %26 = getelementptr inbounds %Stmt, %Stmt* %0, i1 0, i32 6
  call void (%If*) @func353 (%If* %26)
  br label %select_1_end
select_1_5:
  %27 = icmp eq %StmtKind %3, 6
  br i1 %27, label %select_1_5_ok, label %select_1_6
select_1_5_ok:
  %28 = getelementptr inbounds %Stmt, %Stmt* %0, i1 0, i32 5
  call void (%While*) @func354 (%While* %28)
  br label %select_1_end
select_1_6:
  %29 = icmp eq %StmtKind %3, 7
  br i1 %29, label %select_1_6_ok, label %select_1_7
select_1_6_ok:
  %30 = getelementptr inbounds %Stmt, %Stmt* %0, i1 0, i32 1
; index array
  %31 = getelementptr inbounds [2 x %Value*], [2 x %Value*]* %30, i1 0, %Int64 0
  %32 = load %Value*, %Value** %31
  call void (%Value*) @func355 (%Value* %32)
  br label %select_1_end
select_1_7:
  %33 = icmp eq %StmtKind %3, 8
  br i1 %33, label %select_1_7_ok, label %select_1_8
select_1_7_ok:
  call void () @func356 ()
  br label %select_1_end
select_1_8:
  %34 = icmp eq %StmtKind %3, 9
  br i1 %34, label %select_1_8_ok, label %select_1_9
select_1_8_ok:
  call void () @func357 ()
  br label %select_1_end
select_1_9:
  %35 = icmp eq %StmtKind %3, 10
  br i1 %35, label %select_1_9_ok, label %select_1_10
select_1_9_ok:
  %36 = getelementptr inbounds %Stmt, %Stmt* %0, i1 0, i32 7
  %37 = load %Str, %Str* %36
  call void (%Str) @func358 (%Str %37)
  br label %select_1_end
select_1_10:
  %38 = icmp eq %StmtKind %3, 11
  br i1 %38, label %select_1_10_ok, label %select_1_11
select_1_10_ok:
  %39 = getelementptr inbounds %Stmt, %Stmt* %0, i1 0, i32 7
  %40 = load %Str, %Str* %39
  call void (%Str) @func359 (%Str %40)
  br label %select_1_end
select_1_11:
  %41 = load %FILE*, %FILE** @fout
  %42 = bitcast [22 x %Nat8]* @func350_str2 to %Str
  %43 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %41, %Str %42)
  br label %select_1_end
select_1_end:
  ret void
}

define void @func351 (%Decl*) {
;stmt0:
  %2 = bitcast [7 x %Nat8]* @func351_str1 to %Str
  %3 = getelementptr inbounds %Decl, %Decl* %0, i1 0, i32 1
  %4 = load %Type*, %Type** %3
  %5 = call %Nat32 (%Str, %Type*) @func300 (%Str %2, %Type* %4)
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
  %10 = call %LLVM_Value (%Value*) @func303 (%Value* %8)
;stmt5:
  %11 = getelementptr inbounds %Decl, %Decl* %0, i1 0, i32 1
  %12 = load %Type*, %Type** %11
  %13 = sext %Nat32 %5 to %Int64
  %14 = call %LLVM_Value (%LLVM_ValueKind, %Type*, %Int64) @llval_create (%LLVM_ValueKind 4, %Type* %12, %Int64 %13)
;stmt6:
  call void (%LLVM_Value, %LLVM_Value) @func344 (%LLVM_Value %14, %LLVM_Value %10)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  ret void
}

define void @func352 (%Expr*) {
;stmt0:
  %2 = getelementptr inbounds %Expr, %Expr* %0, i1 0, i32 0
  %3 = load %Value*, %Value** %2
  %4 = call %LLVM_Value (%Value*) @func303 (%Value* %3)
;stmt1:
  %5 = getelementptr inbounds %Expr, %Expr* %0, i1 0, i32 1
  %6 = extractvalue %LLVM_Value %4, 4
  store %Nat32 %6, %Nat32* %5, align 4
  ret void
}

define void @func353 (%If*) {
;stmt0:
  %2 = load %Nat32, %Nat32* @global_if_id
;stmt1:
  %3 = load %Nat32, %Nat32* @global_if_id
  %4 = add %Nat32 %3, 1
  store %Nat32 %4, %Nat32* @global_if_id, align 4
;stmt2:
  %5 = getelementptr inbounds %If, %If* %0, i1 0, i32 0
  %6 = load %Value*, %Value** %5
  %7 = call %LLVM_Value (%Value*) @func303 (%Value* %6)
;stmt3:
  %8 = load %FILE*, %FILE** @fout
  %9 = bitcast [10 x %Nat8]* @func353_str1 to %Str
  %10 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %8, %Str %9)
;stmt4:
  call void (%LLVM_Value) @func347 (%LLVM_Value %7)
;stmt5:
  %11 = load %FILE*, %FILE** @fout
  %12 = bitcast [35 x %Nat8]* @func353_str2 to %Str
  %13 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %11, %Str %12, %Nat32 %2, %Nat32 %2)
;stmt6:
  %14 = load %FILE*, %FILE** @fout
  %15 = bitcast [10 x %Nat8]* @func353_str3 to %Str
  %16 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %14, %Str %15, %Nat32 %2)
;stmt7:
  %17 = getelementptr inbounds %If, %If* %0, i1 0, i32 1
  %18 = load %Stmt*, %Stmt** %17
  call void (%Stmt*) @func350 (%Stmt* %18)
;stmt8:
  %19 = load %FILE*, %FILE** @fout
  %20 = bitcast [23 x %Nat8]* @func353_str4 to %Str
  %21 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %19, %Str %20, %Nat32 %2)
;stmt9:
  %22 = load %FILE*, %FILE** @fout
  %23 = bitcast [10 x %Nat8]* @func353_str5 to %Str
  %24 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %22, %Str %23, %Nat32 %2)
;stmt10:
  %25 = getelementptr inbounds %If, %If* %0, i1 0, i32 2
  %26 = load %union.1, %union.1* %25
  %27 = ptrtoint %union.1 %26 to %Int64
  %28 = bitcast %Int64 0 to %Int64
  %29 = icmp eq %Int64 %27, %28
  %30 = xor i1 %29, 1
  br i1 %30, label %then_0, label %else_0
then_0:
;stmt11:
  %31 = getelementptr inbounds %If, %If* %0, i1 0, i32 2
  %32 = load %union.1, %union.1* %31
  %33 = bitcast %union.1 %32 to %Stmt*
  call void (%Stmt*) @func350 (%Stmt* %33)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt12:
  %34 = load %FILE*, %FILE** @fout
  %35 = bitcast [23 x %Nat8]* @func353_str6 to %Str
  %36 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %34, %Str %35, %Nat32 %2)
;stmt13:
  %37 = load %FILE*, %FILE** @fout
  %38 = bitcast [11 x %Nat8]* @func353_str7 to %Str
  %39 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %37, %Str %38, %Nat32 %2)
  ret void
}

define void @func354 (%While*) {
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
  %7 = bitcast [26 x %Nat8]* @func354_str1 to %Str
  %8 = load %Nat32, %Nat32* @while_id
  %9 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %6, %Str %7, %Nat32 %8)
;stmt4:
  %10 = load %FILE*, %FILE** @fout
  %11 = bitcast [14 x %Nat8]* @func354_str2 to %Str
  %12 = load %Nat32, %Nat32* @while_id
  %13 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %10, %Str %11, %Nat32 %12)
;stmt5:
  %14 = getelementptr inbounds %While, %While* %0, i1 0, i32 0
  %15 = load %Value*, %Value** %14
  %16 = call %LLVM_Value (%Value*) @func303 (%Value* %15)
;stmt6:
  %17 = load %FILE*, %FILE** @fout
  %18 = bitcast [10 x %Nat8]* @func354_str3 to %Str
  %19 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %17, %Str %18)
;stmt7:
  call void (%LLVM_Value) @func347 (%LLVM_Value %16)
;stmt8:
  %20 = load %FILE*, %FILE** @fout
  %21 = bitcast [36 x %Nat8]* @func354_str4 to %Str
  %22 = load %Nat32, %Nat32* @while_id
  %23 = load %Nat32, %Nat32* @while_id
  %24 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %20, %Str %21, %Nat32 %22, %Nat32 %23)
;stmt9:
  %25 = load %FILE*, %FILE** @fout
  %26 = bitcast [10 x %Nat8]* @func354_str5 to %Str
  %27 = load %Nat32, %Nat32* @while_id
  %28 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %25, %Str %26, %Nat32 %27)
;stmt10:
  %29 = getelementptr inbounds %While, %While* %0, i1 0, i32 1
  %30 = load %Stmt*, %Stmt** %29
  call void (%Stmt*) @func350 (%Stmt* %30)
;stmt11:
  %31 = load %FILE*, %FILE** @fout
  %32 = bitcast [26 x %Nat8]* @func354_str6 to %Str
  %33 = load %Nat32, %Nat32* @while_id
  %34 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %31, %Str %32, %Nat32 %33)
;stmt12:
  %35 = load %FILE*, %FILE** @fout
  %36 = bitcast [11 x %Nat8]* @func354_str7 to %Str
  %37 = load %Nat32, %Nat32* @while_id
  %38 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %35, %Str %36, %Nat32 %37)
;stmt13:
  store %Nat32 %2, %Nat32* @while_id, align 4
  ret void
}

define void @func355 (%Value*) {
;stmt0:
  %2 = icmp eq %Value* %0, zeroinitializer
  br i1 %2, label %then_0, label %else_0
then_0:
;stmt1:
  %3 = call %Nat32 () @lab_get ()
;stmt2:
  %4 = bitcast [10 x %Nat8]* @func355_str1 to %Str
  call void (%Str) @o (%Str %4)
;stmt3:
ret void
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt4:
  %6 = call %LLVM_Value (%Value*) @func303 (%Value* %0)
;stmt5:
  %7 = load %FILE*, %FILE** @fout
  %8 = bitcast [8 x %Nat8]* @func355_str2 to %Str
  %9 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %7, %Str %8)
;stmt6:
  call void (%LLVM_Value) @func348 (%LLVM_Value %6)
;stmt7:
  %10 = call %Nat32 () @lab_get ()
  ret void
}

define void @func356 () {
;stmt0:
  %1 = call %Nat32 () @lab_get ()
;stmt1:
  %2 = load %FILE*, %FILE** @fout
  %3 = bitcast [23 x %Nat8]* @func356_str1 to %Str
  %4 = load %Nat32, %Nat32* @while_id
  %5 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %2, %Str %3, %Nat32 %4)
  ret void
}

define void @func357 () {
;stmt0:
  %1 = call %Nat32 () @lab_get ()
;stmt1:
  %2 = load %FILE*, %FILE** @fout
  %3 = bitcast [26 x %Nat8]* @func357_str1 to %Str
  %4 = load %Nat32, %Nat32* @while_id
  %5 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %2, %Str %3, %Nat32 %4)
  ret void
}

define void @func358 (%Str) {
;stmt0:
  %2 = call %Nat32 () @lab_get ()
;stmt1:
  %3 = load %FILE*, %FILE** @fout
  %4 = bitcast [17 x %Nat8]* @func358_str1 to %Str
  %5 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %3, %Str %4, %Str %0)
  ret void
}

define void @func359 (%Str) {
;stmt0:
  %2 = load %FILE*, %FILE** @fout
  %3 = bitcast [17 x %Nat8]* @func359_str1 to %Str
  %4 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %2, %Str %3, %Str %0)
;stmt1:
  %5 = load %FILE*, %FILE** @fout
  %6 = bitcast [5 x %Nat8]* @func359_str2 to %Str
  %7 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %5, %Str %6, %Str %0)
  ret void
}

define void @func361 (%Unit*, %Unit*, %Nat32, %Node*) {
;stmt0:
  %5 = load %Nat32, %Nat32* @blockno
  %6 = add %Nat32 %5, 1
  store %Nat32 %6, %Nat32* @blockno, align 4
;stmt1:
  %7 = bitcast %Unit* %0 to %Stmt*
  call void (%Stmt*) @func350 (%Stmt* %7)
  ret void
}

define void @func360 (%Block*) {
;stmt0:
  %2 = getelementptr inbounds %Block, %Block* %0, i1 0, i32 2
  call void (%List*, %ListForeachHandler, %Unit*) @func64 (%List* %2, %ListForeachHandler @func361, %Unit* zeroinitializer)
  ret void
}

define void @func363 (%Type*) {
;stmt0:
  %2 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 11
  %3 = getelementptr inbounds %TypeVar, %TypeVar* %2, i1 0, i32 0
  %4 = load %Type*, %Type** %3
  call void (%Type*) @func365 (%Type* %4)
  ret void
}

define void @func364 (%Type*) {
;stmt0:
  %2 = bitcast [20 x %Nat8]* @func362_func364_str1 to %Str
  call void (%Str) @o (%Str %2)
;stmt1:
  %3 = bitcast [18 x %Nat8]* @func362_func364_str2 to %Str
  %4 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 0
  %5 = load %TypeKind, %TypeKind* %4
  %6 = call %Int32 (%Str, ...) @printf (%Str %3, %TypeKind %5)
  ret void
}

define void @func362 (%Type*, i1, i1) {
;stmt0:
  %4 = icmp ne %Type* %0, zeroinitializer
  %5 = bitcast [26 x %Nat8]* @func362_str1 to %Str
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
  %11 = bitcast [5 x %Nat8]* @func362_str2 to %Str
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
  %20 = bitcast [5 x %Nat8]* @func362_str3 to %Str
  %21 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 1
  %22 = load %Str, %Str* %21
  %23 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %19, %Str %20, %Str %22)
  br label %select_1_end
select_1_1:
  %24 = icmp eq %TypeKind %17, 5
  br i1 %24, label %select_1_1_ok, label %select_1_2
select_1_1_ok:
  call void (%Type*) @func363 (%Type* %0)
  br label %select_1_end
select_1_2:
  %25 = icmp eq %TypeKind %17, 8
  br i1 %25, label %select_1_2_ok, label %select_1_3
select_1_2_ok:
  %26 = load %FILE*, %FILE** @fout
  %27 = bitcast [4 x %Nat8]* @func362_str4 to %Str
  %28 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %26, %Str %27, %Int64 16)
  br label %select_1_end
select_1_3:
  %29 = icmp eq %TypeKind %17, 9
  br i1 %29, label %select_1_3_ok, label %select_1_4
select_1_3_ok:
  %30 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 9
  call void (%TypeRecord*) @func366 (%TypeRecord* %30)
  br label %select_1_end
select_1_4:
  %31 = icmp eq %TypeKind %17, 11
  br i1 %31, label %select_1_4_ok, label %select_1_5
select_1_4_ok:
  %32 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 7
  call void (%TypeArray*) @func368 (%TypeArray* %32)
  br label %select_1_end
select_1_5:
  %33 = icmp eq %TypeKind %17, 12
  br i1 %33, label %select_1_5_ok, label %select_1_6
select_1_5_ok:
  %34 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 8
  call void (%TypeArrayU*) @func369 (%TypeArrayU* %34)
  br label %select_1_end
select_1_6:
  %35 = icmp eq %TypeKind %17, 10
  br i1 %35, label %select_1_6_ok, label %select_1_7
select_1_6_ok:
  %36 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 6
  call void (%TypePointer*) @func370 (%TypePointer* %36)
  br label %select_1_end
select_1_7:
  %37 = icmp eq %TypeKind %17, 7
  br i1 %37, label %select_1_7_ok, label %select_1_8
select_1_7_ok:
  %38 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 5
  call void (%TypeFunc*, i1) @func371 (%TypeFunc* %38, i1 %2)
  br label %select_1_end
select_1_8:
  %39 = icmp eq %TypeKind %17, 6
  br i1 %39, label %select_1_8_ok, label %select_1_9
select_1_8_ok:
  %40 = bitcast [3 x %Nat8]* @func362_str5 to %Str
  call void (%Str) @o (%Str %40)
  br label %select_1_end
select_1_9:
  %41 = icmp eq %TypeKind %17, 13
  br i1 %41, label %select_1_9_ok, label %select_1_10
select_1_9_ok:
  %42 = load %FILE*, %FILE** @fout
  %43 = bitcast [5 x %Nat8]* @func362_str6 to %Str
  %44 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 1
  %45 = load %Str, %Str* %44
  %46 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %42, %Str %43, %Str %45)
  br label %select_1_end
select_1_10:
  call void (%Type*) @func364 (%Type* %0)
  br label %select_1_end
select_1_end:
  ret void
}

define void @func365 (%Type*) {
;stmt0:
  call void (%Type*, i1, i1) @func362 (%Type* %0, i1 1, i1 1)
  ret void
}

define void @func367 (%Unit*, %Unit*, %Nat32, %Node*) {
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
  call void (%Type*) @func365 (%Type* %8)
  ret void
}

define void @func366 (%TypeRecord*) {
;stmt0:
  %2 = bitcast [2 x %Nat8]* @func366_str1 to %Str
  call void (%Str) @o (%Str %2)
;stmt1:
  %3 = getelementptr inbounds %TypeRecord, %TypeRecord* %0, i1 0, i32 0
  %4 = load %List*, %List** %3
  call void (%List*, %ListForeachHandler, %Unit*) @func64 (%List* %4, %ListForeachHandler @func367, %Unit* zeroinitializer)
;stmt2:
  %5 = bitcast [2 x %Nat8]* @func366_str2 to %Str
  call void (%Str) @o (%Str %5)
  ret void
}

define void @func368 (%TypeArray*) {
;stmt0:
  %2 = load %FILE*, %FILE** @fout
  %3 = bitcast [7 x %Nat8]* @func368_str1 to %Str
  %4 = getelementptr inbounds %TypeArray, %TypeArray* %0, i1 0, i32 1
  %5 = load %Nat32, %Nat32* %4
  %6 = call %Int32 (%FILE*, %Str, ...) @fprintf (%FILE* %2, %Str %3, %Nat32 %5)
;stmt1:
  %7 = getelementptr inbounds %TypeArray, %TypeArray* %0, i1 0, i32 0
  %8 = load %Type*, %Type** %7
  call void (%Type*) @func365 (%Type* %8)
;stmt2:
  %9 = bitcast [2 x %Nat8]* @func368_str2 to %Str
  call void (%Str) @o (%Str %9)
  ret void
}

define void @func369 (%TypeArrayU*) {
;stmt0:
  %2 = getelementptr inbounds %TypeArrayU, %TypeArrayU* %0, i1 0, i32 0
  %3 = load %Type*, %Type** %2
  call void (%Type*) @func365 (%Type* %3)
;stmt1:
  %4 = bitcast [2 x %Nat8]* @func369_str1 to %Str
  call void (%Str) @o (%Str %4)
  ret void
}

define void @func370 (%TypePointer*) {
;stmt0:
  %2 = getelementptr inbounds %TypePointer, %TypePointer* %0, i1 0, i32 0
  %3 = load %Type*, %Type** %2
  call void (%Type*) @func365 (%Type* %3)
;stmt1:
  %4 = bitcast [2 x %Nat8]* @func370_str1 to %Str
  call void (%Str) @o (%Str %4)
  ret void
}

define void @func372 (%Unit*, %Unit*, %Nat32, %Node*) {
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
  call void (%Type*) @func365 (%Type* %8)
  ret void
}

define void @func371 (%TypeFunc*, i1) {
;stmt0:
  %3 = getelementptr inbounds %TypeFunc, %TypeFunc* %0, i1 0, i32 1
  %4 = load %Type*, %Type** %3
  %5 = load %Type*, %Type** @typeUnit
  %6 = call i1 (%Type*, %Type*) @func417 (%Type* %4, %Type* %5)
  br i1 %6, label %then_0, label %else_0
then_0:
;stmt1:
  %7 = bitcast [5 x %Nat8]* @func371_str1 to %Str
  call void (%Str) @o (%Str %7)
  br label %endif_0
else_0:
;stmt2:
  %8 = getelementptr inbounds %TypeFunc, %TypeFunc* %0, i1 0, i32 1
  %9 = load %Type*, %Type** %8
  call void (%Type*) @func365 (%Type* %9)
  br label %endif_0
endif_0:
;stmt3:
  %10 = getelementptr inbounds %TypeFunc, %TypeFunc* %0, i1 0, i32 0
  %11 = load %Type*, %Type** %10
  %12 = getelementptr inbounds %Type, %Type* %11, i1 0, i32 9
  %13 = getelementptr inbounds %TypeRecord, %TypeRecord* %12, i1 0, i32 0
  %14 = load %List*, %List** %13
;stmt4:
  %15 = bitcast [3 x %Nat8]* @func371_str2 to %Str
  call void (%Str) @o (%Str %15)
;stmt5:
  call void (%List*, %ListForeachHandler, %Unit*) @func64 (%List* %14, %ListForeachHandler @func372, %Unit* zeroinitializer)
;stmt6:
  %16 = getelementptr inbounds %TypeFunc, %TypeFunc* %0, i1 0, i32 2
  %17 = load i1, i1* %16
  br i1 %17, label %then_1, label %else_1
then_1:
;stmt7:
  %18 = bitcast [6 x %Nat8]* @func371_str3 to %Str
  call void (%Str) @o (%Str %18)
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt8:
  %19 = bitcast [2 x %Nat8]* @func371_str4 to %Str
  call void (%Str) @o (%Str %19)
;stmt9:
  br i1 %1, label %then_2, label %else_2
then_2:
;stmt10:
  %20 = bitcast [2 x %Nat8]* @func371_str5 to %Str
  call void (%Str) @o (%Str %20)
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
  ret void
}

define %Type* @func373 (%TypeKind, %Nat32, %TokenInfo*) {
;stmt0:
  %4 = call %Unit* (%Nat32) @malloc (%Nat32 176)
  %5 = bitcast %Unit* %4 to %Type*
;stmt1:
  %6 = icmp ne %Type* %5, zeroinitializer
  %7 = bitcast [9 x %Nat8]* @func373_str1 to %Str
  call void (i1, %Str) @assert (i1 %6, %Str %7)
;stmt2:
  %8 = bitcast %Type* %5 to %Unit*
  %9 = call %Unit* (%Unit*, %Nat8, %Nat32) @memset (%Unit* %8, %Nat8 0, %Nat32 176)
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
  %13 = getelementptr inbounds %Type, %Type* %5, i1 0, i32 13
  store %TokenInfo* %2, %TokenInfo** %13, align 8
;stmt7:
  ret %Type* %5
}

define %Type* @type_var_new (%Type*, %TokenInfo*) {
;stmt0:
  %3 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 2
  %4 = load %Nat32, %Nat32* %3
  %5 = call %Type* (%TypeKind, %Nat32, %TokenInfo*) @func373 (%TypeKind 5, %Nat32 %4, %TokenInfo* %1)
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

define %Type* @func375 (%Type*, %TokenInfo*) {
;stmt0:
  %3 = call %Type* (%TypeKind, %Nat32, %TokenInfo*) @func373 (%TypeKind 10, %Nat32 8, %TokenInfo* %1)
;stmt1:
  %4 = getelementptr inbounds %Type, %Type* %3, i1 0, i32 6
  %5 = getelementptr inbounds %TypePointer, %TypePointer* %4, i1 0, i32 0
  store %Type* %0, %Type** %5, align 8
;stmt2:
  ret %Type* %3
}

define %Type* @func376 (%Type*, %TokenInfo*) {
;stmt0:
  %3 = call %Type* (%TypeKind, %Nat32, %TokenInfo*) @func373 (%TypeKind 12, %Nat32 8, %TokenInfo* %1)
;stmt1:
  %4 = getelementptr inbounds %Type, %Type* %3, i1 0, i32 8
  %5 = getelementptr inbounds %TypeArrayU, %TypeArrayU* %4, i1 0, i32 0
  store %Type* %0, %Type** %5, align 8
;stmt2:
  ret %Type* %3
}

define %Type* @func377 (%Type*, %Nat32, %TokenInfo*) {
;stmt0:
  %4 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 2
  %5 = load %Nat32, %Nat32* %4
  %6 = mul %Nat32 %1, %5
;stmt1:
  %7 = call %Type* (%TypeKind, %Nat32, %TokenInfo*) @func373 (%TypeKind 11, %Nat32 %6, %TokenInfo* %2)
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

define void @func379 (%Unit*, %Unit*, %Nat32, %Node*) {
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
  %12 = call %Value* (%Type*, %Int64, %TokenInfo*) @func426 (%Type* %6, %Int64 %9, %TokenInfo* %11)
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

define %Type* @func378 (%List*, %TokenInfo*) {
;stmt0:
  %3 = call %Type* (%TypeKind, %Nat32, %TokenInfo*) @func373 (%TypeKind 8, %Nat32 2, %TokenInfo* %1)
;stmt1:
  %4 = bitcast %Type* %3 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @func64 (%List* %0, %ListForeachHandler @func379, %Unit* %4)
;stmt2:
  ret %Type* %3
}

define %Type* @func380 (%Type*, %Type*, i1, %TokenInfo*) {
;stmt0:
  %5 = call %Type* (%TypeKind, %Nat32, %TokenInfo*) @func373 (%TypeKind 7, %Nat32 8, %TokenInfo* %3)
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

define i1 @func382 (%Unit*, %Unit*, %Nat32) {
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

define %Decl* @func381 (%Type*, %Str) {
;stmt0:
  %3 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 9
  %4 = getelementptr inbounds %TypeRecord, %TypeRecord* %3, i1 0, i32 0
  %5 = load %List*, %List** %4
  %6 = bitcast %Str %1 to %Unit*
  %7 = call %Unit* (%List*, %ListSearchHandler, %Unit*) @list_search (%List* %5, %ListSearchHandler @func382, %Unit* %6)
  %8 = bitcast %Unit* %7 to %Decl*
  ret %Decl* %8
}

define i1 @func383 (%Type*) {
;stmt0:
  %2 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 0
  %3 = load %TypeKind, %TypeKind* %2
;stmt1:
  %4 = icmp eq %TypeKind %3, 3
  %5 = icmp eq %TypeKind %3, 10
  %6 = icmp eq %TypeKind %3, 7
  %7 = call i1 (%Type*) @func386 (%Type* %0)
  %8 = or i1 %6, %7
  %9 = or i1 %5, %8
  %10 = or i1 %4, %9
  ret i1 %10
}

define i1 @func384 (%Type*) {
;stmt0:
  %2 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 0
  %3 = load %TypeKind, %TypeKind* %2
  %4 = icmp eq %TypeKind %3, 11
  ret i1 %4
}

define i1 @func385 (%Type*) {
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
  %9 = call i1 (%Type*) @func384 (%Type* %8)
  ret i1 %9
}

define i1 @func386 (%Type*) {
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

define i1 @func388 (%Type*) {
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

define i1 @func389 (%Type*) {
;stmt0:
  %2 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 0
  %3 = load %TypeKind, %TypeKind* %2
  %4 = icmp eq %TypeKind %3, 9
  ret i1 %4
}

define i1 @func390 (%Type*) {
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
  %9 = call i1 (%Type*) @func389 (%Type* %8)
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
  %10 = call i1 (%Type*, %Type*) @func417 (%Type* %8, %Type* %9)
  ret i1 %10
}

define i1 @func392 (%Type*) {
;stmt0:
  %2 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 0
  %3 = load %TypeKind, %TypeKind* %2
  %4 = icmp ne %TypeKind %3, 13
  br i1 %4, label %then_0, label %else_0
then_0:
;stmt1:
  ret i1 0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt2:
  %6 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 12
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
  %12 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 12
  %13 = getelementptr inbounds %TypeUnion, %TypeUnion* %12, i1 0, i32 0
  %14 = call %Unit* (%List*, %Nat32) @list_get (%List* %13, %Nat32 0)
  %15 = bitcast %Unit* %14 to %Type*
;stmt5:
  %16 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 12
  %17 = getelementptr inbounds %TypeUnion, %TypeUnion* %16, i1 0, i32 0
  %18 = call %Unit* (%List*, %Nat32) @list_get (%List* %17, %Nat32 1)
  %19 = bitcast %Unit* %18 to %Type*
;stmt6:
  %20 = getelementptr inbounds %Type, %Type* %15, i1 0, i32 0
  %21 = load %TypeKind, %TypeKind* %20
  %22 = icmp eq %TypeKind %21, 10
  %23 = load %Type*, %Type** @typeUnit
  %24 = call i1 (%Type*, %Type*) @func417 (%Type* %19, %Type* %23)
  %25 = and i1 %22, %24
  %26 = getelementptr inbounds %Type, %Type* %19, i1 0, i32 0
  %27 = load %TypeKind, %TypeKind* %26
  %28 = icmp eq %TypeKind %27, 10
  %29 = load %Type*, %Type** @typeUnit
  %30 = call i1 (%Type*, %Type*) @func417 (%Type* %15, %Type* %29)
  %31 = and i1 %28, %30
  %32 = or i1 %25, %31
  ret i1 %32
}

define %Type* @func393 (%AstType*) {
;stmt0:
  %2 = getelementptr inbounds %AstType, %AstType* %0, i1 0, i32 0
  %3 = load %AstTypeKind, %AstTypeKind* %2
  br label %select_1_0
select_1_0:
  %4 = icmp eq %AstTypeKind %3, 1
  br i1 %4, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %5 = call %Type* (%AstType*) @func395 (%AstType* %0)
  br label %select_1_end
select_1_1:
  %6 = icmp eq %AstTypeKind %3, 6
  br i1 %6, label %select_1_1_ok, label %select_1_2
select_1_1_ok:
  %7 = call %Type* (%AstType*) @func396 (%AstType* %0)
  br label %select_1_end
select_1_2:
  %8 = icmp eq %AstTypeKind %3, 8
  br i1 %8, label %select_1_2_ok, label %select_1_3
select_1_2_ok:
  %9 = call %Type* (%AstType*) @func394 (%AstType* %0)
  br label %select_1_end
select_1_3:
  %10 = icmp eq %AstTypeKind %3, 4
  br i1 %10, label %select_1_3_ok, label %select_1_4
select_1_3_ok:
  %11 = call %Type* (%AstType*) @func398 (%AstType* %0)
  br label %select_1_end
select_1_4:
  %12 = icmp eq %AstTypeKind %3, 5
  br i1 %12, label %select_1_4_ok, label %select_1_5
select_1_4_ok:
  %13 = call %Type* (%AstType*) @func397 (%AstType* %0)
  br label %select_1_end
select_1_5:
  %14 = icmp eq %AstTypeKind %3, 7
  br i1 %14, label %select_1_5_ok, label %select_1_6
select_1_5_ok:
  %15 = call %Type* (%AstType*) @func399 (%AstType* %0)
  br label %select_1_end
select_1_6:
  %16 = icmp eq %AstTypeKind %3, 2
  br i1 %16, label %select_1_6_ok, label %select_1_7
select_1_6_ok:
  %17 = call %Type* (%AstType*) @func406 (%AstType* %0)
  br label %select_1_end
select_1_7:
  %18 = icmp eq %AstTypeKind %3, 3
  br i1 %18, label %select_1_7_ok, label %select_1_8
select_1_7_ok:
  %19 = call %Type* (%AstType*) @func401 (%AstType* %0)
  br label %select_1_end
select_1_8:
  %20 = icmp eq %AstTypeKind %3, 9
  br i1 %20, label %select_1_8_ok, label %select_1_9
select_1_8_ok:
  %21 = call %Type* (%AstType*) @func408 (%AstType* %0)
  br label %select_1_end
select_1_9:
  %22 = getelementptr inbounds %AstType, %AstType* %0, i1 0, i32 10
  %23 = load %TokenInfo*, %TokenInfo** %22
  %24 = call %Type* (%TypeKind, %Nat32, %TokenInfo*) @func373 (%TypeKind 2, %Nat32 0, %TokenInfo* %23)
  br label %select_1_end
select_1_end:
  %25 = phi %Type* [ %5, %select_1_0_ok ], [ %7, %select_1_1_ok ], [ %9, %select_1_2_ok ], [ %11, %select_1_3_ok ], [ %13, %select_1_4_ok ], [ %15, %select_1_5_ok ], [ %17, %select_1_6_ok ], [ %19, %select_1_7_ok ], [ %21, %select_1_8_ok ], [ %24, %select_1_9 ]
  ret %Type* %25
}

define %Type* @func394 (%AstType*) {
;stmt0:
  %2 = getelementptr inbounds %AstType, %AstType* %0, i1 0, i32 8
  %3 = getelementptr inbounds %AstTypeVar, %AstTypeVar* %2, i1 0, i32 0
  %4 = load %AstType*, %AstType** %3
  %5 = call %Type* (%AstType*) @func393 (%AstType* %4)
;stmt1:
  %6 = getelementptr inbounds %AstType, %AstType* %0, i1 0, i32 10
  %7 = load %TokenInfo*, %TokenInfo** %6
  %8 = call %Type* (%Type*, %TokenInfo*) @type_var_new (%Type* %5, %TokenInfo* %7)
  ret %Type* %8
}

define %Type* @func395 (%AstType*) {
;stmt0:
  %2 = getelementptr inbounds %AstType, %AstType* %0, i1 0, i32 1
  %3 = getelementptr inbounds %AstName, %AstName* %2, i1 0, i32 0
  %4 = load %AstId*, %AstId** %3
  %5 = getelementptr inbounds %AstId, %AstId* %4, i1 0, i32 0
  %6 = load %Str, %Str* %5
;stmt1:
  %7 = call %Type* (%Str) @func147 (%Str %6)
;stmt2:
  %8 = icmp eq %Type* %7, zeroinitializer
  br i1 %8, label %then_0, label %else_0
then_0:
;stmt3:
  %9 = getelementptr inbounds %AstType, %AstType* %0, i1 0, i32 10
  %10 = load %TokenInfo*, %TokenInfo** %9
  %11 = call %Type* (%TypeKind, %Nat32, %TokenInfo*) @func373 (%TypeKind 1, %Nat32 0, %TokenInfo* %10)
;stmt4:
  %12 = getelementptr inbounds %Type, %Type* %11, i1 0, i32 13
  %13 = getelementptr inbounds %AstType, %AstType* %0, i1 0, i32 1
  %14 = getelementptr inbounds %AstName, %AstName* %13, i1 0, i32 2
  %15 = load %TokenInfo*, %TokenInfo** %14
  store %TokenInfo* %15, %TokenInfo** %12, align 8
;stmt5:
  %16 = load %Module*, %Module** @module
  %17 = getelementptr inbounds %Module, %Module* %16, i1 0, i32 1
  call void (%Index*, %Str, %Type*) @func145 (%Index* %17, %Str %6, %Type* %11)
;stmt6:
  ret %Type* %11
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt7:
  ret %Type* %7
}

define %Type* @func396 (%AstType*) {
;stmt0:
  %2 = getelementptr inbounds %AstType, %AstType* %0, i1 0, i32 7
  %3 = getelementptr inbounds %AstTypeFunc, %AstTypeFunc* %2, i1 0, i32 0
  %4 = load %AstType*, %AstType** %3
  %5 = call %Type* (%AstType*) @func393 (%AstType* %4)
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
  %13 = call %Type* (%AstType*) @func393 (%AstType* %12)
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
  %18 = getelementptr inbounds %AstType, %AstType* %0, i1 0, i32 10
  %19 = load %TokenInfo*, %TokenInfo** %18
  %20 = call %Type* (%Type*, %Type*, i1, %TokenInfo*) @func380 (%Type* %5, %Type* %13, i1 0, %TokenInfo* %19)
  ret %Type* %20
}

define %Type* @func397 (%AstType*) {
;stmt0:
  %2 = getelementptr inbounds %AstType, %AstType* %0, i1 0, i32 4
  %3 = getelementptr inbounds %AstTypeArrayU, %AstTypeArrayU* %2, i1 0, i32 0
  %4 = load %AstType*, %AstType** %3
  %5 = call %Type* (%AstType*) @func393 (%AstType* %4)
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
  %10 = getelementptr inbounds %AstType, %AstType* %0, i1 0, i32 10
  %11 = load %TokenInfo*, %TokenInfo** %10
  %12 = call %Type* (%Type*, %TokenInfo*) @func376 (%Type* %5, %TokenInfo* %11)
  ret %Type* %12
}

define %Type* @func398 (%AstType*) {
;stmt0:
  %2 = getelementptr inbounds %AstType, %AstType* %0, i1 0, i32 3
  %3 = getelementptr inbounds %AstTypeArray, %AstTypeArray* %2, i1 0, i32 0
  %4 = load %AstType*, %AstType** %3
  %5 = call %Type* (%AstType*) @func393 (%AstType* %4)
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
  %13 = call %Value* (%AstValue*, i1) @func429 (%AstValue* %12, i1 0)
;stmt4:
  %14 = getelementptr inbounds %Value, %Value* %13, i1 0, i32 0
  %15 = load %ValueKind, %ValueKind* %14
  %16 = icmp eq %ValueKind %15, 1
  br i1 %16, label %then_1, label %else_1
then_1:
;stmt5:
  %17 = getelementptr inbounds %AstType, %AstType* %0, i1 0, i32 10
  %18 = load %TokenInfo*, %TokenInfo** %17
  %19 = call %Type* (%TypeKind, %Nat32, %TokenInfo*) @func373 (%TypeKind 2, %Nat32 0, %TokenInfo* %18)
  ret %Type* %19
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt6:
  %21 = getelementptr inbounds %Value, %Value* %13, i1 0, i32 2
  %22 = load %Int64, %Int64* %21
  %23 = trunc %Int64 %22 to %Nat32
  %24 = getelementptr inbounds %AstType, %AstType* %0, i1 0, i32 10
  %25 = load %TokenInfo*, %TokenInfo** %24
  %26 = call %Type* (%Type*, %Nat32, %TokenInfo*) @func377 (%Type* %5, %Nat32 %23, %TokenInfo* %25)
  ret %Type* %26
}

define %Type* @func399 (%AstType*) {
;stmt0:
  %2 = getelementptr inbounds %AstType, %AstType* %0, i1 0, i32 5
  %3 = getelementptr inbounds %AstTypePointer, %AstTypePointer* %2, i1 0, i32 0
  %4 = load %AstType*, %AstType** %3
  %5 = call %Type* (%AstType*) @func393 (%AstType* %4)
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
  %10 = getelementptr inbounds %AstType, %AstType* %0, i1 0, i32 10
  %11 = load %TokenInfo*, %TokenInfo** %10
  %12 = call %Type* (%Type*, %TokenInfo*) @func375 (%Type* %5, %TokenInfo* %11)
  ret %Type* %12
}

define %Nat32 @align (%Nat32, %Nat32) {
;stmt0:
  %3 = icmp ne %Nat32 %1, 0
  %4 = bitcast [20 x %Nat8]* @func400_str1 to %Str
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

define %Decl* @func404 (%AstId*, %Type*, %TokenInfo*) {
;stmt0:
  %4 = call %Unit* (%Nat32) @malloc (%Nat32 48)
  %5 = bitcast %Unit* %4 to %Decl*
;stmt1:
  %6 = icmp ne %Decl* %5, zeroinitializer
  %7 = bitcast [10 x %Nat8]* @func401_func402_func403_func404_str1 to %Str
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

define void @func403 (%Unit*, %Unit*, %Nat32, %Node*) {
;stmt0:
  %5 = bitcast %Unit* %0 to %AstId*
;stmt1:
  %6 = bitcast %Unit* %1 to %func401_func402.type4*
;stmt2:
  %7 = getelementptr inbounds %func401_func402.type4, %func401_func402.type4* %6, i1 0, i32 1
  %8 = load %Type*, %Type** %7
  %9 = getelementptr inbounds %AstId, %AstId* %5, i1 0, i32 1
  %10 = load %TokenInfo*, %TokenInfo** %9
  %11 = call %Decl* (%AstId*, %Type*, %TokenInfo*) @func404 (%AstId* %5, %Type* %8, %TokenInfo* %10)
;stmt3:
  %12 = getelementptr inbounds %func401_func402.type4, %func401_func402.type4* %6, i1 0, i32 0
  %13 = load %List*, %List** %12
  %14 = bitcast %Decl* %11 to %Unit*
  %15 = call i1 (%List*, %Unit*) @list_append (%List* %13, %Unit* %14)
  ret void
}

define void @func402 (%Unit*, %Unit*, %Nat32, %Node*) {
;stmt0:
  %5 = bitcast %Unit* %0 to %AstDecl*
;stmt1:
  %6 = bitcast %Unit* %1 to %func401.type3*
;stmt2:
  %7 = getelementptr inbounds %AstDecl, %AstDecl* %5, i1 0, i32 1
  %8 = load %AstType*, %AstType** %7
  %9 = call %Type* (%AstType*) @func393 (%AstType* %8)
;stmt3:
  %10 = getelementptr inbounds %Type, %Type* %9, i1 0, i32 0
  %11 = load %TypeKind, %TypeKind* %10
  %12 = icmp eq %TypeKind %11, 2
  br i1 %12, label %then_0, label %else_0
then_0:
;stmt4:
  %13 = bitcast [14 x %Nat8]* @func401_func402_str1 to %Str
  %14 = getelementptr inbounds %Type, %Type* %9, i1 0, i32 13
  %15 = load %TokenInfo*, %TokenInfo** %14
  call void (%Str, %TokenInfo*) @error (%Str %13, %TokenInfo* %15)
;stmt5:
  %16 = getelementptr inbounds %func401.type3, %func401.type3* %6, i1 0, i32 1
  store i1 1, i1* %16, align 1
;stmt6:
ret void
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt7:
  %18 = alloca %func401_func402.type4
  store %func401_func402.type4 zeroinitializer, %func401_func402.type4* %18, align 8
;stmt8:
  %19 = getelementptr inbounds %func401_func402.type4, %func401_func402.type4* %18, i1 0, i32 0
  %20 = getelementptr inbounds %func401.type3, %func401.type3* %6, i1 0, i32 0
  %21 = load %List*, %List** %20
  store %List* %21, %List** %19, align 8
;stmt9:
  %22 = getelementptr inbounds %func401_func402.type4, %func401_func402.type4* %18, i1 0, i32 1
  store %Type* %9, %Type** %22, align 8
;stmt10:
  %23 = getelementptr inbounds %AstDecl, %AstDecl* %5, i1 0, i32 0
  %24 = getelementptr inbounds %func401_func402.type4, %func401_func402.type4* %18, i1 0
  %25 = bitcast %func401_func402.type4* %24 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @func64 (%List* %23, %ListForeachHandler @func403, %Unit* %25)
  ret void
}

define void @func405 (%Unit*, %Unit*, %Nat32, %Node*) {
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
  %11 = bitcast [15 x %Nat8]* @func401_func405_str1 to %Str
  %12 = getelementptr inbounds %Decl, %Decl* %5, i1 0, i32 1
  %13 = load %Type*, %Type** %12
  %14 = getelementptr inbounds %Type, %Type* %13, i1 0, i32 13
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
  %20 = getelementptr inbounds %Type, %Type* %17, i1 0, i32 3
  %21 = load %Nat32, %Nat32* %20
  %22 = getelementptr inbounds %Decl, %Decl* %5, i1 0, i32 1
  %23 = load %Type*, %Type** %22
  %24 = getelementptr inbounds %Type, %Type* %23, i1 0, i32 3
  %25 = load %Nat32, %Nat32* %24
  %26 = icmp ult %Nat32 %21, %25
  br i1 %26, label %then_1, label %else_1
then_1:
;stmt7:
  %27 = getelementptr inbounds %Type, %Type* %17, i1 0, i32 3
  %28 = getelementptr inbounds %Decl, %Decl* %5, i1 0, i32 1
  %29 = load %Type*, %Type** %28
  %30 = getelementptr inbounds %Type, %Type* %29, i1 0, i32 3
  %31 = load %Nat32, %Nat32* %30
  store %Nat32 %31, %Nat32* %27, align 4
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt8:
  %32 = getelementptr inbounds %Type, %Type* %17, i1 0, i32 2
  %33 = load %Nat32, %Nat32* %32
  %34 = getelementptr inbounds %Type, %Type* %17, i1 0, i32 9
  %35 = getelementptr inbounds %TypeRecord, %TypeRecord* %34, i1 0, i32 1
  %36 = load %Nat32, %Nat32* %35
  %37 = sub %Nat32 %33, %36
;stmt9:
  %38 = getelementptr inbounds %Decl, %Decl* %5, i1 0, i32 1
  %39 = load %Type*, %Type** %38
  %40 = getelementptr inbounds %Type, %Type* %39, i1 0, i32 3
  %41 = load %Nat32, %Nat32* %40
  %42 = icmp eq %Nat32 %41, 0
  br i1 %42, label %then_2, label %else_2
then_2:
;stmt10:
  %43 = bitcast [11 x %Nat8]* @func401_func405_str2 to %Str
  %44 = getelementptr inbounds %Decl, %Decl* %5, i1 0, i32 1
  %45 = load %Type*, %Type** %44
  %46 = getelementptr inbounds %Type, %Type* %45, i1 0, i32 13
  %47 = load %TokenInfo*, %TokenInfo** %46
  call void (%Str, %TokenInfo*) @error (%Str %43, %TokenInfo* %47)
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
;stmt11:
  %48 = getelementptr inbounds %Type, %Type* %17, i1 0, i32 9
  %49 = getelementptr inbounds %TypeRecord, %TypeRecord* %48, i1 0, i32 1
  %50 = load %Nat32, %Nat32* %49
  %51 = getelementptr inbounds %Decl, %Decl* %5, i1 0, i32 1
  %52 = load %Type*, %Type** %51
  %53 = getelementptr inbounds %Type, %Type* %52, i1 0, i32 3
  %54 = load %Nat32, %Nat32* %53
  %55 = call %Nat32 (%Nat32, %Nat32) @align (%Nat32 %50, %Nat32 %54)
;stmt12:
  %56 = getelementptr inbounds %Decl, %Decl* %5, i1 0, i32 1
  %57 = load %Type*, %Type** %56
  %58 = getelementptr inbounds %Type, %Type* %57, i1 0, i32 2
  %59 = load %Nat32, %Nat32* %58
  %60 = add %Nat32 %55, %59
;stmt13:
  %61 = getelementptr inbounds %Type, %Type* %17, i1 0, i32 9
  %62 = getelementptr inbounds %TypeRecord, %TypeRecord* %61, i1 0, i32 1
  store %Nat32 %60, %Nat32* %62, align 4
;stmt14:
  %63 = getelementptr inbounds %Type, %Type* %17, i1 0, i32 2
  %64 = load %Nat32, %Nat32* %63
  %65 = icmp ugt %Nat32 %60, %64
  br i1 %65, label %then_3, label %else_3
then_3:
;stmt15:
  %66 = getelementptr inbounds %Type, %Type* %17, i1 0, i32 2
  %67 = getelementptr inbounds %Type, %Type* %17, i1 0, i32 3
  %68 = load %Nat32, %Nat32* %67
  %69 = call %Nat32 (%Nat32, %Nat32) @align (%Nat32 %60, %Nat32 %68)
  store %Nat32 %69, %Nat32* %66, align 4
  br label %endif_3
else_3:
  br label %endif_3
endif_3:
  ret void
}

define %Type* @func401 (%AstType*) {
;stmt0:
  %2 = load %Type*, %Type** @ctype
;stmt1:
  %3 = getelementptr inbounds %AstType, %AstType* %0, i1 0, i32 10
  %4 = load %TokenInfo*, %TokenInfo** %3
  %5 = call %Type* (%TypeKind, %Nat32, %TokenInfo*) @func373 (%TypeKind 9, %Nat32 0, %TokenInfo* %4)
;stmt2:
  store %Type* %5, %Type** @ctype, align 8
;stmt3:
  %6 = alloca %func401.type3
  store %func401.type3 zeroinitializer, %func401.type3* %6, align 8
;stmt4:
  %7 = getelementptr inbounds %func401.type3, %func401.type3* %6, i1 0, i32 0
  %8 = call %List* () @map_new ()
  store %List* %8, %List** %7, align 8
;stmt5:
  %9 = getelementptr inbounds %func401.type3, %func401.type3* %6, i1 0, i32 1
  store i1 0, i1* %9, align 1
;stmt6:
  %10 = getelementptr inbounds %AstType, %AstType* %0, i1 0, i32 6
  %11 = getelementptr inbounds %AstTypeRecord, %AstTypeRecord* %10, i1 0, i32 0
  %12 = getelementptr inbounds %func401.type3, %func401.type3* %6, i1 0
  %13 = bitcast %func401.type3* %12 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @func64 (%List* %11, %ListForeachHandler @func402, %Unit* %13)
;stmt7:
  store %Type* %2, %Type** @ctype, align 8
;stmt8:
  %14 = getelementptr inbounds %Type, %Type* %5, i1 0, i32 9
  %15 = getelementptr inbounds %TypeRecord, %TypeRecord* %14, i1 0, i32 0
  %16 = getelementptr inbounds %func401.type3, %func401.type3* %6, i1 0, i32 0
  %17 = load %List*, %List** %16
  store %List* %17, %List** %15, align 8
;stmt9:
  %18 = getelementptr inbounds %Type, %Type* %5, i1 0, i32 9
  %19 = getelementptr inbounds %TypeRecord, %TypeRecord* %18, i1 0, i32 0
  %20 = load %List*, %List** %19
  %21 = bitcast %Type* %5 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @func64 (%List* %20, %ListForeachHandler @func405, %Unit* %21)
;stmt10:
  ret %Type* %5
}

define void @func407 (%Unit*, %Unit*, %Nat32, %Node*) {
;stmt0:
  %5 = bitcast %Unit* %0 to %AstId*
;stmt1:
  %6 = bitcast %Unit* %1 to %List*
;stmt2:
  %7 = call %Unit* (%Nat32) @malloc (%Nat32 24)
  %8 = bitcast %Unit* %7 to %EnumConstructor*
;stmt3:
  %9 = getelementptr inbounds %EnumConstructor, %EnumConstructor* %8, i1 0, i32 0
  store %AstId* %5, %AstId** %9, align 8
;stmt4:
  %10 = getelementptr inbounds %EnumConstructor, %EnumConstructor* %8, i1 0, i32 1
  store %Nat32 %2, %Nat32* %10, align 4
;stmt5:
  %11 = getelementptr inbounds %EnumConstructor, %EnumConstructor* %8, i1 0, i32 2
  store %TokenInfo* zeroinitializer, %TokenInfo** %11, align 8
;stmt6:
  %12 = bitcast %EnumConstructor* %8 to %Unit*
  %13 = call i1 (%List*, %Unit*) @list_append (%List* %6, %Unit* %12)
  ret void
}

define %Type* @func406 (%AstType*) {
;stmt0:
  %2 = call %List* () @map_new ()
;stmt1:
  %3 = getelementptr inbounds %AstType, %AstType* %0, i1 0, i32 2
  %4 = getelementptr inbounds %AstTypeEnum, %AstTypeEnum* %3, i1 0, i32 0
  %5 = bitcast %List* %2 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @func64 (%List* %4, %ListForeachHandler @func407, %Unit* %5)
;stmt2:
  %6 = getelementptr inbounds %AstType, %AstType* %0, i1 0, i32 10
  %7 = load %TokenInfo*, %TokenInfo** %6
  %8 = call %Type* (%List*, %TokenInfo*) @func378 (%List* %2, %TokenInfo* %7)
  ret %Type* %8
}

define void @func409 (%Unit*, %Unit*, %Nat32, %Node*) {
;stmt0:
  %5 = bitcast %Unit* %0 to %AstType*
;stmt1:
  %6 = bitcast %Unit* %1 to %func408.type5*
;stmt2:
  %7 = bitcast %Unit* %1 to %List*
;stmt3:
  %8 = call %Type* (%AstType*) @func393 (%AstType* %5)
;stmt4:
  %9 = getelementptr inbounds %func408.type5, %func408.type5* %6, i1 0, i32 1
  br label %select_1_0
select_1_0:
  %10 = getelementptr inbounds %Type, %Type* %8, i1 0, i32 2
  %11 = load %Nat32, %Nat32* %10
  %12 = getelementptr inbounds %func408.type5, %func408.type5* %6, i1 0, i32 1
  %13 = load %Nat32, %Nat32* %12
  %14 = icmp ugt %Nat32 %11, %13
  %15 = icmp eq i1 1, %14
  br i1 %15, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %16 = getelementptr inbounds %Type, %Type* %8, i1 0, i32 2
  %17 = load %Nat32, %Nat32* %16
  br label %select_1_end
select_1_1:
  %18 = getelementptr inbounds %func408.type5, %func408.type5* %6, i1 0, i32 1
  %19 = load %Nat32, %Nat32* %18
  br label %select_1_end
select_1_end:
  %20 = phi %Nat32 [ %17, %select_1_0_ok ], [ %19, %select_1_1 ]
  store %Nat32 %20, %Nat32* %9, align 4
;stmt5:
  %21 = getelementptr inbounds %func408.type5, %func408.type5* %6, i1 0, i32 0
  %22 = load %List*, %List** %21
  %23 = bitcast %Type* %8 to %Unit*
  %24 = call i1 (%List*, %Unit*) @list_append (%List* %22, %Unit* %23)
  ret void
}

define %Type* @func408 (%AstType*) {
;stmt0:
  %2 = call %Str (%Nat32) @str_new (%Nat32 10)
;stmt1:
; eval index uarray
  %3 = getelementptr inbounds %Nat8, %Nat8* %2, %Int64 0
  %4 = bitcast %Nat8* %3 to %Unit*
  %5 = bitcast [3 x %Nat8]* @func408_str1 to %Str
  %6 = load %Nat32, %Nat32* @union_id
  %7 = call %Int32 (%Unit*, %Str, ...) @sprintf (%Unit* %4, %Str %5, %Nat32 %6)
;stmt2:
  %8 = bitcast [7 x %Nat8]* @func408_str2 to %Str
  %9 = call %Str (%Str, %Str) @cat (%Str %8, %Str %2)
;stmt3:
  %10 = load %Nat32, %Nat32* @union_id
  %11 = add %Nat32 %10, 1
  store %Nat32 %11, %Nat32* @union_id, align 4
;stmt4:
  %12 = getelementptr inbounds %AstType, %AstType* %0, i1 0, i32 10
  %13 = load %TokenInfo*, %TokenInfo** %12
  %14 = call %Type* (%TypeKind, %Nat32, %TokenInfo*) @func373 (%TypeKind 13, %Nat32 0, %TokenInfo* %13)
;stmt5:
  %15 = getelementptr inbounds %Type, %Type* %14, i1 0, i32 1
  store %Str %9, %Str* %15, align 8
;stmt6:
  %16 = alloca %func408.type5
  store %func408.type5 zeroinitializer, %func408.type5* %16, align 8
;stmt7:
  %17 = getelementptr inbounds %func408.type5, %func408.type5* %16, i1 0, i32 0
  %18 = getelementptr inbounds %Type, %Type* %14, i1 0, i32 12
  %19 = getelementptr inbounds %TypeUnion, %TypeUnion* %18, i1 0, i32 0
  store %List* %19, %List** %17, align 8
;stmt8:
  %20 = getelementptr inbounds %Type, %Type* %14, i1 0, i32 12
  %21 = getelementptr inbounds %TypeUnion, %TypeUnion* %20, i1 0, i32 0
  call void (%List*) @map_init (%List* %21)
;stmt9:
  %22 = getelementptr inbounds %AstType, %AstType* %0, i1 0, i32 9
  %23 = getelementptr inbounds %AstTypeUnion, %AstTypeUnion* %22, i1 0, i32 0
  %24 = getelementptr inbounds %func408.type5, %func408.type5* %16, i1 0
  %25 = bitcast %func408.type5* %24 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @func64 (%List* %23, %ListForeachHandler @func409, %Unit* %25)
;stmt10:
  %26 = getelementptr inbounds %Type, %Type* %14, i1 0, i32 2
  %27 = getelementptr inbounds %func408.type5, %func408.type5* %16, i1 0, i32 1
  %28 = load %Nat32, %Nat32* %27
  store %Nat32 %28, %Nat32* %26, align 4
;stmt11:
  %29 = getelementptr inbounds %Type, %Type* %14, i1 0, i32 3
  %30 = getelementptr inbounds %func408.type5, %func408.type5* %16, i1 0, i32 1
  %31 = load %Nat32, %Nat32* %30
  store %Nat32 %31, %Nat32* %29, align 4
;stmt12:
  %32 = getelementptr inbounds %List, %List* @unions, i1 0
  %33 = bitcast %Type* %14 to %Unit*
  %34 = call i1 (%List*, %Unit*) @list_append (%List* %32, %Unit* %33)
;stmt13:
  %35 = call i1 (%Type*) @func392 (%Type* %14)
  br i1 %35, label %then_0, label %else_0
then_0:
;stmt14:
  %36 = load %Type*, %Type** @typeFreePtr
;stmt15:
  %37 = getelementptr inbounds %Type, %Type* %14, i1 0, i32 12
  %38 = getelementptr inbounds %TypeUnion, %TypeUnion* %37, i1 0, i32 1
  store %Type* %36, %Type** %38, align 8
  br label %endif_0
else_0:
;stmt16:
  %39 = bitcast [11 x %Nat8]* @func408_str3 to %Str
  %40 = call %Int32 (%Str, ...) @printf (%Str %39)
;stmt17:
  %41 = getelementptr inbounds %func408.type5, %func408.type5* %16, i1 0, i32 1
  %42 = load %Nat32, %Nat32* %41
  %43 = add %Nat32 %42, 2
  %44 = getelementptr inbounds %AstType, %AstType* %0, i1 0, i32 10
  %45 = load %TokenInfo*, %TokenInfo** %44
  %46 = call %Type* (%TypeKind, %Nat32, %TokenInfo*) @func373 (%TypeKind 9, %Nat32 %43, %TokenInfo* %45)
;stmt18:
  %47 = getelementptr inbounds %Type, %Type* %14, i1 0, i32 12
  %48 = getelementptr inbounds %TypeUnion, %TypeUnion* %47, i1 0, i32 1
  store %Type* %46, %Type** %48, align 8
;stmt19:
  %49 = call %List* () @map_new ()
;stmt20:
  %50 = call %Unit* (%Nat32) @malloc (%Nat32 48)
  %51 = bitcast %Unit* %50 to %Decl*
;stmt21:
  %52 = icmp ne %Decl* %51, zeroinitializer
  %53 = bitcast [10 x %Nat8]* @func408_str4 to %Str
  call void (i1, %Str) @assert (i1 %52, %Str %53)
;stmt22:
  %54 = getelementptr inbounds %Decl, %Decl* %51, i1 0, i32 0
  store %AstId* zeroinitializer, %AstId** %54, align 8
;stmt23:
  %55 = getelementptr inbounds %Decl, %Decl* %51, i1 0, i32 1
  %56 = bitcast [6 x %Nat8]* @func408_str5 to %Str
  %57 = call %Type* (%Str) @func147 (%Str %56)
  store %Type* %57, %Type** %55, align 8
;stmt24:
  %58 = getelementptr inbounds %Decl, %Decl* %51, i1 0, i32 3
  store %Nat16 0, %Nat16* %58, align 2
;stmt25:
  %59 = getelementptr inbounds %Decl, %Decl* %51, i1 0, i32 2
  %60 = getelementptr inbounds %Type, %Type* %14, i1 0, i32 3
  %61 = load %Nat32, %Nat32* %60
  store %Nat32 %61, %Nat32* %59, align 4
;stmt26:
  %62 = getelementptr inbounds %Decl, %Decl* %51, i1 0, i32 6
  store %TokenInfo* zeroinitializer, %TokenInfo** %62, align 8
;stmt27:
  %63 = bitcast %Decl* %51 to %Unit*
  %64 = call i1 (%List*, %Unit*) @list_append (%List* %49, %Unit* %63)
;stmt28:
  %65 = bitcast [5 x %Nat8]* @func408_str6 to %Str
  %66 = call %Type* (%Str) @func147 (%Str %65)
;stmt29:
  %67 = getelementptr inbounds %Type, %Type* %14, i1 0, i32 2
  %68 = load %Nat32, %Nat32* %67
  %69 = call %Type* (%Type*, %Nat32, %TokenInfo*) @func377 (%Type* %66, %Nat32 %68, %TokenInfo* zeroinitializer)
;stmt30:
  %70 = call %Unit* (%Nat32) @malloc (%Nat32 48)
  %71 = bitcast %Unit* %70 to %Decl*
;stmt31:
  %72 = icmp ne %Decl* %71, zeroinitializer
  %73 = bitcast [10 x %Nat8]* @func408_str7 to %Str
  call void (i1, %Str) @assert (i1 %72, %Str %73)
;stmt32:
  %74 = getelementptr inbounds %Decl, %Decl* %71, i1 0, i32 0
  store %AstId* zeroinitializer, %AstId** %74, align 8
;stmt33:
  %75 = getelementptr inbounds %Decl, %Decl* %71, i1 0, i32 1
  store %Type* %69, %Type** %75, align 8
;stmt34:
  %76 = getelementptr inbounds %Decl, %Decl* %71, i1 0, i32 3
  store %Nat16 1, %Nat16* %76, align 2
;stmt35:
  %77 = getelementptr inbounds %Decl, %Decl* %71, i1 0, i32 2
  %78 = getelementptr inbounds %Type, %Type* %14, i1 0, i32 3
  %79 = load %Nat32, %Nat32* %78
  store %Nat32 %79, %Nat32* %77, align 4
;stmt36:
  %80 = getelementptr inbounds %Decl, %Decl* %71, i1 0, i32 6
  store %TokenInfo* zeroinitializer, %TokenInfo** %80, align 8
;stmt37:
  %81 = bitcast %Decl* %71 to %Unit*
  %82 = call i1 (%List*, %Unit*) @list_append (%List* %49, %Unit* %81)
;stmt38:
  %83 = getelementptr inbounds %Type, %Type* %46, i1 0, i32 9
  %84 = getelementptr inbounds %TypeRecord, %TypeRecord* %83, i1 0, i32 0
  store %List* %49, %List** %84, align 8
  br label %endif_0
endif_0:
;stmt39:
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
  %12 = call i1 (%Type*, %Type*) @func417 (%Type* %9, %Type* %11)
  %13 = and i1 %7, %12
  ret i1 %13
}

define i1 @type_eq_func (%TypeFunc*, %TypeFunc*) {
;stmt0:
  %3 = getelementptr inbounds %TypeFunc, %TypeFunc* %0, i1 0, i32 0
  %4 = load %Type*, %Type** %3
  %5 = getelementptr inbounds %TypeFunc, %TypeFunc* %1, i1 0, i32 0
  %6 = load %Type*, %Type** %5
  %7 = call i1 (%Type*, %Type*) @func417 (%Type* %4, %Type* %6)
  %8 = getelementptr inbounds %TypeFunc, %TypeFunc* %0, i1 0, i32 1
  %9 = load %Type*, %Type** %8
  %10 = getelementptr inbounds %TypeFunc, %TypeFunc* %1, i1 0, i32 1
  %11 = load %Type*, %Type** %10
  %12 = call i1 (%Type*, %Type*) @func417 (%Type* %9, %Type* %11)
  %13 = and i1 %7, %12
  ret i1 %13
}

define i1 @func414 (%Unit*, %Unit*, %Unit*, %Nat32) {
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
  %22 = call i1 (%Type*, %Type*) @func417 (%Type* %19, %Type* %21)
  ret i1 %22
}

define i1 @type_eq_record (%TypeRecord*, %TypeRecord*) {
;stmt0:
  %3 = getelementptr inbounds %TypeRecord, %TypeRecord* %0, i1 0, i32 0
  %4 = load %List*, %List** %3
  %5 = getelementptr inbounds %TypeRecord, %TypeRecord* %1, i1 0, i32 0
  %6 = load %List*, %List** %5
  %7 = call i1 (%List*, %List*, %ListCompareHandler, %Unit*) @list_compare (%List* %4, %List* %6, %ListCompareHandler @func414, %Unit* zeroinitializer)
  ret i1 %7
}

define i1 @func416 (%Unit*, %Unit*, %Unit*, %Nat32) {
;stmt0:
  %5 = bitcast %Unit* %0 to %Type*
;stmt1:
  %6 = bitcast %Unit* %1 to %Type*
;stmt2:
  %7 = call i1 (%Type*, %Type*) @func417 (%Type* %5, %Type* %6)
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
  %12 = getelementptr inbounds %TypeUnion, %TypeUnion* %1, i1 0, i32 0
  %13 = call i1 (%List*, %List*, %ListCompareHandler, %Unit*) @list_compare (%List* %11, %List* %12, %ListCompareHandler @func416, %Unit* zeroinitializer)
  ret i1 %13
}

define i1 @func417 (%Type*, %Type*) {
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
  %24 = call i1 (%Type*, %Type*) @func417 (%Type* %20, %Type* %23)
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
  %32 = call i1 (%Type*, %Type*) @func417 (%Type* %28, %Type* %31)
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
  %44 = call i1 (%Type*, %Type*) @func417 (%Type* %40, %Type* %43)
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
  %53 = icmp eq %TypeKind %12, 13
  br i1 %53, label %select_1_7_ok, label %select_1_8
select_1_7_ok:
  %54 = getelementptr inbounds %Type, %Type* %0, i1 0, i32 12
  %55 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 12
  %56 = call i1 (%TypeUnion*, %TypeUnion*) @type_eq_union (%TypeUnion* %54, %TypeUnion* %55)
  br label %select_1_end
select_1_8:
  %57 = icmp eq %TypeKind %12, 8
  br i1 %57, label %select_1_8_ok, label %select_1_9
select_1_8_ok:
  %58 = bitcast i1 0 to i1
  br label %select_1_end
select_1_9:
  %59 = icmp eq %TypeKind %12, 6
  br i1 %59, label %select_1_9_ok, label %select_1_10
select_1_9_ok:
  %60 = bitcast i1 1 to i1
  br label %select_1_end
select_1_10:
  %61 = bitcast i1 0 to i1
  br label %select_1_end
select_1_end:
  %62 = phi i1 [ %16, %select_1_0_ok ], [ %24, %select_1_1_ok ], [ %32, %select_1_2_ok ], [ %36, %select_1_3_ok ], [ %44, %select_1_4_ok ], [ %48, %select_1_5_ok ], [ %52, %select_1_6_ok ], [ %56, %select_1_7_ok ], [ %58, %select_1_8_ok ], [ %60, %select_1_9_ok ], [ %61, %select_1_10 ]
  ret i1 %62
}

define i1 @type_check (%Type*, %Type*, %TokenInfo*) {
;stmt0:
  %4 = call i1 (%Type*, %Type*) @func417 (%Type* %0, %Type* %1)
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

define %Type* @func420 (%Str, %Nat32, i1) {
;stmt0:
  %4 = udiv %Nat32 %1, 8
;stmt1:
  %5 = call %Type* (%TypeKind, %Nat32, %TokenInfo*) @func373 (%TypeKind 4, %Nat32 %4, %TokenInfo* zeroinitializer)
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

define %Type* @func421 () {
;stmt0:
  %1 = bitcast [27 x %Nat8]* @func419_func421_str1 to %Str
  call void (%Str) @fatal (%Str %1)
;stmt1:
  ret %Type* zeroinitializer
}

define void @func419 () {
;stmt0:
  %1 = call %List* () @map_new ()
  %2 = call %Type* (%List*, %TokenInfo*) @func378 (%List* %1, %TokenInfo* zeroinitializer)
  store %Type* %2, %Type** @typeVoid, align 8
;stmt1:
  %3 = load %Type*, %Type** @typeVoid
  %4 = getelementptr inbounds %Type, %Type* %3, i1 0, i32 1
  %5 = bitcast [5 x %Nat8]* @func419_str1 to %Str
  store %Str %5, %Str* %4, align 8
;stmt2:
  %6 = bitcast [5 x %Nat8]* @func419_str2 to %Str
  %7 = load %Type*, %Type** @typeVoid
  call void (%Str, %Type*) @builtin_type_bind (%Str %6, %Type* %7)
;stmt3:
  %8 = call %Type* (%TypeKind, %Nat32, %TokenInfo*) @func373 (%TypeKind 9, %Nat32 0, %TokenInfo* zeroinitializer)
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
  %15 = bitcast [5 x %Nat8]* @func419_str3 to %Str
  store %Str %15, %Str* %14, align 8
;stmt6:
  %16 = bitcast [5 x %Nat8]* @func419_str4 to %Str
  %17 = load %Type*, %Type** @typeUnit
  call void (%Str, %Type*) @builtin_type_bind (%Str %16, %Type* %17)
;stmt7:
  %18 = call %Type* (%TypeKind, %Nat32, %TokenInfo*) @func373 (%TypeKind 6, %Nat32 1, %TokenInfo* zeroinitializer)
  store %Type* %18, %Type** @typeBool, align 8
;stmt8:
  %19 = bitcast [5 x %Nat8]* @func419_str5 to %Str
  %20 = load %Type*, %Type** @typeBool
  call void (%Str, %Type*) @builtin_type_bind (%Str %19, %Type* %20)
;stmt9:
  %21 = bitcast [5 x %Nat8]* @func419_str6 to %Str
  %22 = call %Type* (%Str, %Nat32, i1) @func420 (%Str %21, %Nat32 8, i1 1)
;stmt10:
  %23 = bitcast [6 x %Nat8]* @func419_str7 to %Str
  %24 = call %Type* (%Str, %Nat32, i1) @func420 (%Str %23, %Nat32 16, i1 1)
;stmt11:
  %25 = bitcast [6 x %Nat8]* @func419_str8 to %Str
  %26 = call %Type* (%Str, %Nat32, i1) @func420 (%Str %25, %Nat32 32, i1 1)
;stmt12:
  %27 = bitcast [6 x %Nat8]* @func419_str9 to %Str
  %28 = call %Type* (%Str, %Nat32, i1) @func420 (%Str %27, %Nat32 64, i1 1)
;stmt13:
  %29 = bitcast [7 x %Nat8]* @func419_str10 to %Str
  %30 = call %Type* (%Str, %Nat32, i1) @func420 (%Str %29, %Nat32 128, i1 1)
;stmt14:
  %31 = bitcast [7 x %Nat8]* @func419_str11 to %Str
  %32 = call %Type* (%Str, %Nat32, i1) @func420 (%Str %31, %Nat32 256, i1 1)
;stmt15:
  %33 = bitcast [7 x %Nat8]* @func419_str12 to %Str
  %34 = call %Type* (%Str, %Nat32, i1) @func420 (%Str %33, %Nat32 512, i1 1)
;stmt16:
  %35 = bitcast [8 x %Nat8]* @func419_str13 to %Str
  %36 = call %Type* (%Str, %Nat32, i1) @func420 (%Str %35, %Nat32 1024, i1 1)
;stmt17:
  %37 = bitcast [5 x %Nat8]* @func419_str14 to %Str
  %38 = call %Type* (%Str, %Nat32, i1) @func420 (%Str %37, %Nat32 8, i1 0)
;stmt18:
  %39 = bitcast [6 x %Nat8]* @func419_str15 to %Str
  %40 = call %Type* (%Str, %Nat32, i1) @func420 (%Str %39, %Nat32 16, i1 0)
;stmt19:
  %41 = bitcast [6 x %Nat8]* @func419_str16 to %Str
  %42 = call %Type* (%Str, %Nat32, i1) @func420 (%Str %41, %Nat32 32, i1 0)
;stmt20:
  %43 = bitcast [6 x %Nat8]* @func419_str17 to %Str
  %44 = call %Type* (%Str, %Nat32, i1) @func420 (%Str %43, %Nat32 64, i1 0)
;stmt21:
  %45 = bitcast [7 x %Nat8]* @func419_str18 to %Str
  %46 = call %Type* (%Str, %Nat32, i1) @func420 (%Str %45, %Nat32 128, i1 0)
;stmt22:
  %47 = bitcast [7 x %Nat8]* @func419_str19 to %Str
  %48 = call %Type* (%Str, %Nat32, i1) @func420 (%Str %47, %Nat32 256, i1 0)
;stmt23:
  %49 = bitcast [7 x %Nat8]* @func419_str20 to %Str
  %50 = call %Type* (%Str, %Nat32, i1) @func420 (%Str %49, %Nat32 512, i1 0)
;stmt24:
  %51 = bitcast [8 x %Nat8]* @func419_str21 to %Str
  %52 = call %Type* (%Str, %Nat32, i1) @func420 (%Str %51, %Nat32 1024, i1 0)
;stmt25:
  %53 = bitcast [6 x %Nat8]* @func419_str22 to %Str
  call void (%Str, %Type*) @builtin_type_bind (%Str %53, %Type* %28)
;stmt26:
  %54 = bitcast [6 x %Nat8]* @func419_str23 to %Str
  call void (%Str, %Type*) @builtin_type_bind (%Str %54, %Type* %44)
;stmt27:
  %55 = bitcast [6 x %Nat8]* @func419_str24 to %Str
  call void (%Str, %Type*) @builtin_type_bind (%Str %55, %Type* %26)
;stmt28:
  %56 = bitcast [6 x %Nat8]* @func419_str25 to %Str
  call void (%Str, %Type*) @builtin_type_bind (%Str %56, %Type* %42)
;stmt29:
  %57 = bitcast [5 x %Nat8]* @func419_str26 to %Str
  call void (%Str, %Type*) @builtin_type_bind (%Str %57, %Type* %22)
;stmt30:
  %58 = bitcast [5 x %Nat8]* @func419_str27 to %Str
  call void (%Str, %Type*) @builtin_type_bind (%Str %58, %Type* %38)
;stmt31:
  %59 = bitcast [6 x %Nat8]* @func419_str28 to %Str
  call void (%Str, %Type*) @builtin_type_bind (%Str %59, %Type* %24)
;stmt32:
  %60 = bitcast [6 x %Nat8]* @func419_str29 to %Str
  call void (%Str, %Type*) @builtin_type_bind (%Str %60, %Type* %40)
;stmt33:
  store %Type* %38, %Type** @typeChar, align 8
;stmt34:
  %61 = load %Type*, %Type** @typeChar
  %62 = call %Type* (%Type*, %TokenInfo*) @func376 (%Type* %61, %TokenInfo* zeroinitializer)
  store %Type* %62, %Type** @typeStr, align 8
;stmt35:
  %63 = load %Type*, %Type** @typeStr
  %64 = getelementptr inbounds %Type, %Type* %63, i1 0, i32 1
  %65 = bitcast [4 x %Nat8]* @func419_str30 to %Str
  store %Str %65, %Str* %64, align 8
;stmt36:
  %66 = bitcast [4 x %Nat8]* @func419_str31 to %Str
  %67 = load %Type*, %Type** @typeStr
  call void (%Str, %Type*) @builtin_type_bind (%Str %66, %Type* %67)
;stmt37:
  %68 = bitcast [7 x %Nat8]* @func419_str32 to %Str
  call void (%Str, %Type*) @builtin_type_bind (%Str %68, %Type* %30)
;stmt38:
  %69 = bitcast [7 x %Nat8]* @func419_str33 to %Str
  call void (%Str, %Type*) @builtin_type_bind (%Str %69, %Type* %32)
;stmt39:
  %70 = bitcast [7 x %Nat8]* @func419_str34 to %Str
  call void (%Str, %Type*) @builtin_type_bind (%Str %70, %Type* %34)
;stmt40:
  %71 = bitcast [8 x %Nat8]* @func419_str35 to %Str
  call void (%Str, %Type*) @builtin_type_bind (%Str %71, %Type* %36)
;stmt41:
  %72 = bitcast [7 x %Nat8]* @func419_str36 to %Str
  call void (%Str, %Type*) @builtin_type_bind (%Str %72, %Type* %46)
;stmt42:
  %73 = bitcast [7 x %Nat8]* @func419_str37 to %Str
  call void (%Str, %Type*) @builtin_type_bind (%Str %73, %Type* %48)
;stmt43:
  %74 = bitcast [7 x %Nat8]* @func419_str38 to %Str
  call void (%Str, %Type*) @builtin_type_bind (%Str %74, %Type* %50)
;stmt44:
  %75 = bitcast [8 x %Nat8]* @func419_str39 to %Str
  call void (%Str, %Type*) @builtin_type_bind (%Str %75, %Type* %52)
;stmt45:
  %76 = load %Type*, %Type** @typeUnit
  %77 = call %Type* (%Type*, %TokenInfo*) @func375 (%Type* %76, %TokenInfo* zeroinitializer)
  store %Type* %77, %Type** @typeFreePtr, align 8
;stmt46:
  %78 = bitcast [8 x %Nat8]* @func419_str40 to %Str
  %79 = call %Type* (%Str, %Nat32, i1) @func420 (%Str %78, %Nat32 0, i1 1)
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
  %85 = call %Type* () @func421 ()
  br label %select_1_end
select_1_end:
  %86 = phi %Type* [ %24, %select_1_0_ok ], [ %26, %select_1_1_ok ], [ %28, %select_1_2_ok ], [ %30, %select_1_3_ok ], [ %32, %select_1_4_ok ], [ %85, %select_1_5 ]
  store %Type* %86, %Type** @typeBaseInt, align 8
  ret void
}

define %union.7 @smalloc (%Nat32) {
;stmt0:
  %2 = call %Unit* (%Nat32) @malloc (%Nat32 %0)
;stmt1:
  %3 = icmp eq %Unit* %2, zeroinitializer
  br i1 %3, label %then_0, label %else_0
then_0:
;stmt2:
  %4 = inttoptr %Unit zeroinitializer to %union.7
  ret %union.7 %4
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt3:
  %6 = bitcast %Unit* %2 to %union.7
  ret %union.7 %6
}

define %union.8 @vn () {
;stmt0:
  %1 = call %Unit* (%Nat32) @malloc (%Nat32 296)
  %2 = bitcast %Unit* %1 to %Value*
;stmt1:
  %3 = icmp eq %Value* %2, zeroinitializer
  br i1 %3, label %then_0, label %else_0
then_0:
;stmt2:
  %4 = bitcast [21 x %Nat8]* @func423_str1 to %Str
  call void (i1, %Str) @assert (i1 0, %Str %4)
;stmt3:
  %5 = inttoptr %Unit zeroinitializer to %union.8
  ret %union.8 %5
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt4:
  %7 = bitcast %Value* %2 to %union.8
  ret %union.8 %7
}

define %Value* @func424 (%ValueKind, %Type*, %TokenInfo*) {
;stmt0:
  %4 = call %Unit* (%Nat32) @malloc (%Nat32 296)
  %5 = bitcast %Unit* %4 to %Value*
;stmt1:
  %6 = icmp ne %Value* %5, zeroinitializer
  %7 = bitcast [21 x %Nat8]* @func424_str1 to %Str
  call void (i1, %Str) @assert (i1 %6, %Str %7)
;stmt2:
  %8 = bitcast %Value* %5 to %Unit*
  %9 = call %Unit* (%Unit*, %Nat8, %Nat32) @memset (%Unit* %8, %Nat8 0, %Nat32 296)
;stmt3:
  %10 = getelementptr inbounds %Value, %Value* %5, i1 0, i32 0
  store %ValueKind %0, %ValueKind* %10, align 2
;stmt4:
  %11 = getelementptr inbounds %Value, %Value* %5, i1 0, i32 1
  store %Type* %1, %Type** %11, align 8
;stmt5:
  %12 = getelementptr inbounds %Value, %Value* %5, i1 0, i32 21
  store %TokenInfo* %2, %TokenInfo** %12, align 8
;stmt6:
  ret %Value* %5
}

define %Value* @value_new_poison (%TokenInfo*) {
;stmt0:
  %2 = call %Type* (%TypeKind, %Nat32, %TokenInfo*) @func373 (%TypeKind 2, %Nat32 0, %TokenInfo* %0)
;stmt1:
  %3 = call %Value* (%ValueKind, %Type*, %TokenInfo*) @func424 (%ValueKind 1, %Type* %2, %TokenInfo* %0)
  ret %Value* %3
}

define %Value* @func426 (%Type*, %Int64, %TokenInfo*) {
;stmt0:
  %4 = call %Value* (%ValueKind, %Type*, %TokenInfo*) @func424 (%ValueKind 3, %Type* %0, %TokenInfo* %2)
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
  %32 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 21
  %33 = load %TokenInfo*, %TokenInfo** %32
  %34 = call %Value* (%ValueKind, %Type*, %TokenInfo*) @func424 (%ValueKind 28, %Type* %14, %TokenInfo* %33)
;stmt4:
  %35 = getelementptr inbounds %Value, %Value* %34, i1 0, i32 18
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

define %Value* @func428 (%AstValue*) {
;stmt0:
  %2 = call %Value* (%AstValue*, i1) @func429 (%AstValue* %0, i1 1)
  ret %Value* %2
}

define %Value* @func429 (%AstValue*, i1) {
;stmt0:
  %3 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 0
  %4 = load %AstValueKind, %AstValueKind* %3
  br label %select_1_0
select_1_0:
  %5 = icmp eq %AstValueKind %4, 3
  br i1 %5, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %6 = call %Value* (%AstValue*) @func461 (%AstValue* %0)
  br label %select_1_end
select_1_1:
  %7 = icmp eq %AstValueKind %4, 1
  br i1 %7, label %select_1_1_ok, label %select_1_2
select_1_1_ok:
  %8 = call %Value* (%AstValue*) @func462 (%AstValue* %0)
  br label %select_1_end
select_1_2:
  %9 = icmp eq %AstValueKind %4, 2
  br i1 %9, label %select_1_2_ok, label %select_1_3
select_1_2_ok:
  %10 = call %Value* (%AstValue*) @func463 (%AstValue* %0)
  br label %select_1_end
select_1_3:
  %11 = icmp eq %AstValueKind %4, 4
  br i1 %11, label %select_1_3_ok, label %select_1_4
select_1_3_ok:
  %12 = call %Value* (%AstValue*) @func464 (%AstValue* %0)
  br label %select_1_end
select_1_4:
  %13 = icmp eq %AstValueKind %4, 5
  br i1 %13, label %select_1_4_ok, label %select_1_5
select_1_4_ok:
  %14 = call %Value* (%AstValue*) @func466 (%AstValue* %0)
  br label %select_1_end
select_1_5:
  %15 = icmp eq %AstValueKind %4, 6
  br i1 %15, label %select_1_5_ok, label %select_1_6
select_1_5_ok:
  %16 = call %Value* (%AstValue*) @func467 (%AstValue* %0)
  br label %select_1_end
select_1_6:
  %17 = icmp eq %AstValueKind %4, 7
  br i1 %17, label %select_1_6_ok, label %select_1_7
select_1_6_ok:
  %18 = call %Value* (%AstValue*) @func433 (%AstValue* %0)
  br label %select_1_end
select_1_7:
  %19 = icmp eq %AstValueKind %4, 8
  br i1 %19, label %select_1_7_ok, label %select_1_8
select_1_7_ok:
  %20 = call %Value* (%AstValue*) @func434 (%AstValue* %0)
  br label %select_1_end
select_1_8:
  %21 = icmp eq %AstValueKind %4, 9
  br i1 %21, label %select_1_8_ok, label %select_1_9
select_1_8_ok:
  %22 = call %Value* (%AstValue*) @func470 (%AstValue* %0)
  br label %select_1_end
select_1_9:
  %23 = icmp eq %AstValueKind %4, 10
  br i1 %23, label %select_1_9_ok, label %select_1_10
select_1_9_ok:
  %24 = call %Value* (%AstValue*) @func469 (%AstValue* %0)
  br label %select_1_end
select_1_10:
  %25 = icmp eq %AstValueKind %4, 11
  br i1 %25, label %select_1_10_ok, label %select_1_11
select_1_10_ok:
  %26 = call %Value* (%AstValue*) @func468 (%AstValue* %0)
  br label %select_1_end
select_1_11:
  %27 = icmp eq %AstValueKind %4, 12
  br i1 %27, label %select_1_11_ok, label %select_1_12
select_1_11_ok:
  %28 = call %Value* (%ValueKind, %AstValue*) @func435 (%ValueKind 14, %AstValue* %0)
  br label %select_1_end
select_1_12:
  %29 = icmp eq %AstValueKind %4, 13
  br i1 %29, label %select_1_12_ok, label %select_1_13
select_1_12_ok:
  %30 = call %Value* (%ValueKind, %AstValue*) @func435 (%ValueKind 15, %AstValue* %0)
  br label %select_1_end
select_1_13:
  %31 = icmp eq %AstValueKind %4, 14
  br i1 %31, label %select_1_13_ok, label %select_1_14
select_1_13_ok:
  %32 = call %Value* (%ValueKind, %AstValue*) @func435 (%ValueKind 16, %AstValue* %0)
  br label %select_1_end
select_1_14:
  %33 = icmp eq %AstValueKind %4, 15
  br i1 %33, label %select_1_14_ok, label %select_1_15
select_1_14_ok:
  %34 = call %Value* (%ValueKind, %AstValue*) @func435 (%ValueKind 17, %AstValue* %0)
  br label %select_1_end
select_1_15:
  %35 = icmp eq %AstValueKind %4, 16
  br i1 %35, label %select_1_15_ok, label %select_1_16
select_1_15_ok:
  %36 = call %Value* (%ValueKind, %AstValue*) @func435 (%ValueKind 18, %AstValue* %0)
  br label %select_1_end
select_1_16:
  %37 = icmp eq %AstValueKind %4, 19
  br i1 %37, label %select_1_16_ok, label %select_1_17
select_1_16_ok:
  %38 = call %Value* (%ValueKind, %AstValue*) @func435 (%ValueKind 21, %AstValue* %0)
  br label %select_1_end
select_1_17:
  %39 = icmp eq %AstValueKind %4, 18
  br i1 %39, label %select_1_17_ok, label %select_1_18
select_1_17_ok:
  %40 = call %Value* (%ValueKind, %AstValue*) @func435 (%ValueKind 20, %AstValue* %0)
  br label %select_1_end
select_1_18:
  %41 = icmp eq %AstValueKind %4, 17
  br i1 %41, label %select_1_18_ok, label %select_1_19
select_1_18_ok:
  %42 = call %Value* (%ValueKind, %AstValue*) @func435 (%ValueKind 19, %AstValue* %0)
  br label %select_1_end
select_1_19:
  %43 = icmp eq %AstValueKind %4, 22
  br i1 %43, label %select_1_19_ok, label %select_1_20
select_1_19_ok:
  %44 = call %Value* (%ValueKind, %AstValue*) @func435 (%ValueKind 24, %AstValue* %0)
  br label %select_1_end
select_1_20:
  %45 = icmp eq %AstValueKind %4, 23
  br i1 %45, label %select_1_20_ok, label %select_1_21
select_1_20_ok:
  %46 = call %Value* (%ValueKind, %AstValue*) @func435 (%ValueKind 25, %AstValue* %0)
  br label %select_1_end
select_1_21:
  %47 = icmp eq %AstValueKind %4, 20
  br i1 %47, label %select_1_21_ok, label %select_1_22
select_1_21_ok:
  %48 = call %Value* (%ValueKind, %AstValue*) @func435 (%ValueKind 22, %AstValue* %0)
  br label %select_1_end
select_1_22:
  %49 = icmp eq %AstValueKind %4, 21
  br i1 %49, label %select_1_22_ok, label %select_1_23
select_1_22_ok:
  %50 = call %Value* (%ValueKind, %AstValue*) @func435 (%ValueKind 23, %AstValue* %0)
  br label %select_1_end
select_1_23:
  %51 = icmp eq %AstValueKind %4, 24
  br i1 %51, label %select_1_23_ok, label %select_1_24
select_1_23_ok:
  %52 = call %Value* (%ValueKind, %AstValue*) @func435 (%ValueKind 26, %AstValue* %0)
  br label %select_1_end
select_1_24:
  %53 = icmp eq %AstValueKind %4, 25
  br i1 %53, label %select_1_24_ok, label %select_1_25
select_1_24_ok:
  %54 = call %Value* (%ValueKind, %AstValue*) @func435 (%ValueKind 27, %AstValue* %0)
  br label %select_1_end
select_1_25:
  %55 = icmp eq %AstValueKind %4, 26
  br i1 %55, label %select_1_25_ok, label %select_1_26
select_1_25_ok:
  %56 = call %Value* (%AstValue*) @func471 (%AstValue* %0)
  br label %select_1_end
select_1_26:
  %57 = icmp eq %AstValueKind %4, 27
  br i1 %57, label %select_1_26_ok, label %select_1_27
select_1_26_ok:
  %58 = call %Value* (%AstValue*) @func471 (%AstValue* %0)
  br label %select_1_end
select_1_27:
  %59 = icmp eq %AstValueKind %4, 28
  br i1 %59, label %select_1_27_ok, label %select_1_28
select_1_27_ok:
  %60 = call %Value* (%AstValue*) @func436 (%AstValue* %0)
  br label %select_1_end
select_1_28:
  %61 = icmp eq %AstValueKind %4, 29
  br i1 %61, label %select_1_28_ok, label %select_1_29
select_1_28_ok:
  %62 = call %Value* (%AstValue*) @func439 (%AstValue* %0)
  br label %select_1_end
select_1_29:
  %63 = icmp eq %AstValueKind %4, 30
  br i1 %63, label %select_1_29_ok, label %select_1_30
select_1_29_ok:
  %64 = call %Value* (%AstValue*) @func441 (%AstValue* %0)
  br label %select_1_end
select_1_30:
  %65 = icmp eq %AstValueKind %4, 31
  br i1 %65, label %select_1_30_ok, label %select_1_31
select_1_30_ok:
  %66 = call %Value* (%AstValue*) @func454 (%AstValue* %0)
  br label %select_1_end
select_1_31:
  %67 = icmp eq %AstValueKind %4, 32
  br i1 %67, label %select_1_31_ok, label %select_1_32
select_1_31_ok:
  %68 = call %Value* (%AstValue*) @func456 (%AstValue* %0)
  br label %select_1_end
select_1_32:
  %69 = icmp eq %AstValueKind %4, 33
  br i1 %69, label %select_1_32_ok, label %select_1_33
select_1_32_ok:
  %70 = call %Value* (%AstValue*) @func458 (%AstValue* %0)
  br label %select_1_end
select_1_33:
  %71 = icmp eq %AstValueKind %4, 34
  br i1 %71, label %select_1_33_ok, label %select_1_34
select_1_33_ok:
  %72 = call %Value* (%AstValue*) @func459 (%AstValue* %0)
  br label %select_1_end
select_1_34:
  %73 = icmp eq %AstValueKind %4, 35
  br i1 %73, label %select_1_34_ok, label %select_1_35
select_1_34_ok:
  %74 = call %Value* (%AstValue*) @func460 (%AstValue* %0)
  br label %select_1_end
select_1_35:
  %75 = icmp eq %AstValueKind %4, 36
  br i1 %75, label %select_1_35_ok, label %select_1_36
select_1_35_ok:
  %76 = call %Value* (%AstValue*) @func431 (%AstValue* %0)
  br label %select_1_end
select_1_36:
  %77 = icmp eq %AstValueKind %4, 0
  br i1 %77, label %select_1_36_ok, label %select_1_37
select_1_36_ok:
  %78 = call %Value* (%AstValue*) @func430 (%AstValue* %0)
  br label %select_1_end
select_1_37:
  %79 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 14
  %80 = load %TokenInfo*, %TokenInfo** %79
  %81 = call %Value* (%TokenInfo*) @value_new_poison (%TokenInfo* %80)
  br label %select_1_end
select_1_end:
  %82 = phi %Value* [ %6, %select_1_0_ok ], [ %8, %select_1_1_ok ], [ %10, %select_1_2_ok ], [ %12, %select_1_3_ok ], [ %14, %select_1_4_ok ], [ %16, %select_1_5_ok ], [ %18, %select_1_6_ok ], [ %20, %select_1_7_ok ], [ %22, %select_1_8_ok ], [ %24, %select_1_9_ok ], [ %26, %select_1_10_ok ], [ %28, %select_1_11_ok ], [ %30, %select_1_12_ok ], [ %32, %select_1_13_ok ], [ %34, %select_1_14_ok ], [ %36, %select_1_15_ok ], [ %38, %select_1_16_ok ], [ %40, %select_1_17_ok ], [ %42, %select_1_18_ok ], [ %44, %select_1_19_ok ], [ %46, %select_1_20_ok ], [ %48, %select_1_21_ok ], [ %50, %select_1_22_ok ], [ %52, %select_1_23_ok ], [ %54, %select_1_24_ok ], [ %56, %select_1_25_ok ], [ %58, %select_1_26_ok ], [ %60, %select_1_27_ok ], [ %62, %select_1_28_ok ], [ %64, %select_1_29_ok ], [ %66, %select_1_30_ok ], [ %68, %select_1_31_ok ], [ %70, %select_1_32_ok ], [ %72, %select_1_33_ok ], [ %74, %select_1_34_ok ], [ %76, %select_1_35_ok ], [ %78, %select_1_36_ok ], [ %81, %select_1_37 ]
;stmt1:
  %83 = icmp ne %Value* %82, zeroinitializer
  %84 = bitcast [20 x %Nat8]* @func429_str1 to %Str
  call void (i1, %Str) @assert (i1 %83, %Str %84)
;stmt2:
  %85 = getelementptr inbounds %Value, %Value* %82, i1 0, i32 0
  %86 = load %ValueKind, %ValueKind* %85
  %87 = icmp eq %ValueKind %86, 1
  br i1 %87, label %then_0, label %else_0
then_0:
;stmt3:
  ret %Value* %82
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt4:
  br label %select_2_0
select_2_0:
  %89 = icmp eq i1 %1, 1
  br i1 %89, label %select_2_0_ok, label %select_2_1
select_2_0_ok:
  %90 = call %Value* (%Value*) @dold (%Value* %82)
  br label %select_2_end
select_2_1:
  br label %select_2_end
select_2_end:
  %91 = phi %Value* [ %90, %select_2_0_ok ], [ %82, %select_2_1 ]
  ret %Value* %91
}

define %Value* @func430 (%AstValue*) {
;stmt0:
  %2 = bitcast [19 x %Nat8]* @func430_str1 to %Str
  %3 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 14
  %4 = load %TokenInfo*, %TokenInfo** %3
  call void (%Str, %TokenInfo*) @error (%Str %2, %TokenInfo* %4)
;stmt1:
  %5 = bitcast [6 x %Nat8]* @func430_str2 to %Str
  call void (%Str) @fatal (%Str %5)
;stmt2:
  %6 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 14
  %7 = load %TokenInfo*, %TokenInfo** %6
  %8 = call %Value* (%TokenInfo*) @value_new_poison (%TokenInfo* %7)
  ret %Value* %8
}

define void @func432 (%Unit*, %Unit*, %Nat32, %Node*) {
;stmt0:
  %5 = bitcast %Unit* %0 to %AstValueSelectVariant*
;stmt1:
  %6 = bitcast %Unit* %1 to %func431.type6*
;stmt2:
  %7 = getelementptr inbounds %AstValueSelectVariant, %AstValueSelectVariant* %5, i1 0, i32 0
  %8 = load %AstValue*, %AstValue** %7
  %9 = call %Value* (%AstValue*) @func428 (%AstValue* %8)
  %10 = getelementptr inbounds %func431.type6, %func431.type6* %6, i1 0, i32 0
  %11 = load %Value*, %Value** %10
  %12 = getelementptr inbounds %Value, %Value* %11, i1 0, i32 1
  %13 = load %Type*, %Type** %12
  %14 = call %Value* (%Value*, %Type*) @func476 (%Value* %9, %Type* %13)
;stmt3:
  %15 = getelementptr inbounds %AstValueSelectVariant, %AstValueSelectVariant* %5, i1 0, i32 1
  %16 = load %AstValue*, %AstValue** %15
  %17 = call %Value* (%AstValue*) @func428 (%AstValue* %16)
;stmt4:
  %18 = getelementptr inbounds %func431.type6, %func431.type6* %6, i1 0, i32 1
  %19 = load %Value*, %Value** %18
  %20 = getelementptr inbounds %Value, %Value* %19, i1 0, i32 1
  %21 = load %Type*, %Type** %20
  %22 = icmp eq %Type* %21, zeroinitializer
  br i1 %22, label %then_0, label %else_0
then_0:
;stmt5:
  %23 = getelementptr inbounds %func431.type6, %func431.type6* %6, i1 0, i32 1
  %24 = load %Value*, %Value** %23
  %25 = getelementptr inbounds %Value, %Value* %24, i1 0, i32 1
  %26 = getelementptr inbounds %Value, %Value* %17, i1 0, i32 1
  %27 = load %Type*, %Type** %26
  store %Type* %27, %Type** %25, align 8
  br label %endif_0
else_0:
;stmt6:
  %28 = getelementptr inbounds %Value, %Value* %17, i1 0, i32 1
  %29 = load %Type*, %Type** %28
  %30 = getelementptr inbounds %func431.type6, %func431.type6* %6, i1 0, i32 1
  %31 = load %Value*, %Value** %30
  %32 = getelementptr inbounds %Value, %Value* %31, i1 0, i32 1
  %33 = load %Type*, %Type** %32
  %34 = getelementptr inbounds %Value, %Value* %17, i1 0, i32 21
  %35 = load %TokenInfo*, %TokenInfo** %34
  %36 = call i1 (%Type*, %Type*, %TokenInfo*) @type_check (%Type* %29, %Type* %33, %TokenInfo* %35)
  %37 = xor i1 %36, 1
  br i1 %37, label %then_1, label %else_1
then_1:
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  br label %endif_0
endif_0:
;stmt7:
  %38 = getelementptr inbounds %func431.type6, %func431.type6* %6, i1 0, i32 1
  %39 = load %Value*, %Value** %38
  %40 = getelementptr inbounds %Value, %Value* %39, i1 0, i32 1
  %41 = load %Type*, %Type** %40
  br label %select_1_0
select_1_0:
  %42 = icmp eq %Type* %41, zeroinitializer
  br i1 %42, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  br label %select_1_end
select_1_1:
  %43 = getelementptr inbounds %func431.type6, %func431.type6* %6, i1 0, i32 1
  %44 = load %Value*, %Value** %43
  %45 = getelementptr inbounds %Value, %Value* %44, i1 0, i32 1
  %46 = load %Type*, %Type** %45
  %47 = call %Value* (%Value*, %Type*) @func476 (%Value* %17, %Type* %46)
  br label %select_1_end
select_1_end:
  %48 = phi %Value* [ %17, %select_1_0_ok ], [ %47, %select_1_1 ]
;stmt8:
  %49 = call %Unit* (%Nat32) @malloc (%Nat32 16)
  %50 = bitcast %Unit* %49 to %ValueSelectVariant*
;stmt9:
  %51 = getelementptr inbounds %func431.type6, %func431.type6* %6, i1 0, i32 0
  %52 = load %Value*, %Value** %51
  %53 = getelementptr inbounds %Value, %Value* %52, i1 0, i32 1
  %54 = load %Type*, %Type** %53
  %55 = getelementptr inbounds %Value, %Value* %14, i1 0, i32 1
  %56 = load %Type*, %Type** %55
  %57 = getelementptr inbounds %Value, %Value* %14, i1 0, i32 21
  %58 = load %TokenInfo*, %TokenInfo** %57
  %59 = call i1 (%Type*, %Type*, %TokenInfo*) @type_check (%Type* %54, %Type* %56, %TokenInfo* %58)
  %60 = xor i1 %59, 1
  br i1 %60, label %then_2, label %else_2
then_2:
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
;stmt10:
  %61 = getelementptr inbounds %ValueSelectVariant, %ValueSelectVariant* %50, i1 0, i32 0
  store %Value* %14, %Value** %61, align 8
;stmt11:
  %62 = getelementptr inbounds %ValueSelectVariant, %ValueSelectVariant* %50, i1 0, i32 1
  store %Value* %48, %Value** %62, align 8
;stmt12:
  %63 = getelementptr inbounds %func431.type6, %func431.type6* %6, i1 0, i32 1
  %64 = load %Value*, %Value** %63
  %65 = getelementptr inbounds %Value, %Value* %64, i1 0, i32 17
  %66 = getelementptr inbounds %ValueSelect, %ValueSelect* %65, i1 0, i32 1
  %67 = bitcast %ValueSelectVariant* %50 to %Unit*
  %68 = call i1 (%List*, %Unit*) @list_append (%List* %66, %Unit* %67)
  ret void
}

define %Value* @func431 (%AstValue*) {
;stmt0:
  %2 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 14
  %3 = load %TokenInfo*, %TokenInfo** %2
  %4 = call %Value* (%ValueKind, %Type*, %TokenInfo*) @func424 (%ValueKind 37, %Type* zeroinitializer, %TokenInfo* %3)
;stmt1:
  %5 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 12
  %6 = getelementptr inbounds %AstValueSelect, %AstValueSelect* %5, i1 0, i32 0
  %7 = load %AstValue*, %AstValue** %6
  %8 = call %Value* (%AstValue*) @func428 (%AstValue* %7)
;stmt2:
  %9 = getelementptr inbounds %Value, %Value* %4, i1 0, i32 17
  %10 = getelementptr inbounds %ValueSelect, %ValueSelect* %9, i1 0, i32 0
  store %Value* %8, %Value** %10, align 8
;stmt3:
  %11 = alloca %func431.type6
  store %func431.type6 zeroinitializer, %func431.type6* %11, align 8
;stmt4:
  %12 = getelementptr inbounds %func431.type6, %func431.type6* %11, i1 0, i32 0
  store %Value* %8, %Value** %12, align 8
;stmt5:
  %13 = getelementptr inbounds %func431.type6, %func431.type6* %11, i1 0, i32 1
  store %Value* %4, %Value** %13, align 8
;stmt6:
  %14 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 12
  %15 = getelementptr inbounds %AstValueSelect, %AstValueSelect* %14, i1 0, i32 1
  %16 = getelementptr inbounds %func431.type6, %func431.type6* %11, i1 0
  %17 = bitcast %func431.type6* %16 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @func64 (%List* %15, %ListForeachHandler @func432, %Unit* %17)
;stmt7:
  %18 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 12
  %19 = getelementptr inbounds %AstValueSelect, %AstValueSelect* %18, i1 0, i32 2
  %20 = load %AstValue*, %AstValue** %19
  %21 = icmp eq %AstValue* %20, zeroinitializer
  br i1 %21, label %then_0, label %else_0
then_0:
;stmt8:
  %22 = bitcast [25 x %Nat8]* @func431_str1 to %Str
  %23 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 14
  %24 = load %TokenInfo*, %TokenInfo** %23
  call void (%Str, %TokenInfo*) @error (%Str %22, %TokenInfo* %24)
;stmt9:
  %25 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 14
  %26 = load %TokenInfo*, %TokenInfo** %25
  %27 = call %Value* (%TokenInfo*) @value_new_poison (%TokenInfo* %26)
  ret %Value* %27
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt10:
  %29 = getelementptr inbounds %Value, %Value* %4, i1 0, i32 17
  %30 = getelementptr inbounds %ValueSelect, %ValueSelect* %29, i1 0, i32 2
  %31 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 12
  %32 = getelementptr inbounds %AstValueSelect, %AstValueSelect* %31, i1 0, i32 2
  %33 = load %AstValue*, %AstValue** %32
  %34 = call %Value* (%AstValue*) @func428 (%AstValue* %33)
  %35 = getelementptr inbounds %func431.type6, %func431.type6* %11, i1 0, i32 1
  %36 = load %Value*, %Value** %35
  %37 = getelementptr inbounds %Value, %Value* %36, i1 0, i32 1
  %38 = load %Type*, %Type** %37
  %39 = call %Value* (%Value*, %Type*) @func476 (%Value* %34, %Type* %38)
  store %Value* %39, %Value** %30, align 8
;stmt11:
  %40 = getelementptr inbounds %Value, %Value* %4, i1 0, i32 21
  %41 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 14
  %42 = load %TokenInfo*, %TokenInfo** %41
  store %TokenInfo* %42, %TokenInfo** %40, align 8
;stmt12:
  ret %Value* %4
}

define %Value* @func433 (%AstValue*) {
;stmt0:
  %2 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 3
; index array
  %3 = getelementptr inbounds [2 x %AstValue*], [2 x %AstValue*]* %2, i1 0, %Int64 0
  %4 = load %AstValue*, %AstValue** %3
  %5 = call %Value* (%AstValue*, i1) @func429 (%AstValue* %4, i1 0)
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
  %27 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 14
  %28 = load %TokenInfo*, %TokenInfo** %27
  %29 = call %Type* (%Type*, %TokenInfo*) @func375 (%Type* %26, %TokenInfo* %28)
  %30 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 14
  %31 = load %TokenInfo*, %TokenInfo** %30
  %32 = call %Value* (%ValueKind, %Type*, %TokenInfo*) @func424 (%ValueKind 9, %Type* %29, %TokenInfo* %31)
;stmt9:
  %33 = getelementptr inbounds %Value, %Value* %32, i1 0, i32 8
  %34 = getelementptr inbounds %ValueUn, %ValueUn* %33, i1 0, i32 0
  store %Value* %5, %Value** %34, align 8
;stmt10:
  ret %Value* %32
}

define %Value* @func434 (%AstValue*) {
;stmt0:
  %2 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 3
; index array
  %3 = getelementptr inbounds [2 x %AstValue*], [2 x %AstValue*]* %2, i1 0, %Int64 0
  %4 = load %AstValue*, %AstValue** %3
  %5 = call %Value* (%AstValue*) @func428 (%AstValue* %4)
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
  %15 = bitcast [17 x %Nat8]* @func434_str1 to %Str
  %16 = getelementptr inbounds %Value, %Value* %5, i1 0, i32 21
  %17 = load %TokenInfo*, %TokenInfo** %16
  call void (%Str, %TokenInfo*) @error (%Str %15, %TokenInfo* %17)
;stmt5:
  %18 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 14
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
  %27 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 14
  %28 = load %TokenInfo*, %TokenInfo** %27
  %29 = call %Value* (%ValueKind, %Type*, %TokenInfo*) @func424 (%ValueKind 10, %Type* %26, %TokenInfo* %28)
;stmt7:
  %30 = getelementptr inbounds %Value, %Value* %29, i1 0, i32 8
  %31 = getelementptr inbounds %ValueUn, %ValueUn* %30, i1 0, i32 0
  store %Value* %5, %Value** %31, align 8
;stmt8:
  ret %Value* %29
}

define %Value* @func435 (%ValueKind, %AstValue*) {
;stmt0:
  %3 = getelementptr inbounds %AstValue, %AstValue* %1, i1 0, i32 3
; index array
  %4 = getelementptr inbounds [2 x %AstValue*], [2 x %AstValue*]* %3, i1 0, %Int64 0
  %5 = load %AstValue*, %AstValue** %4
  %6 = call %Value* (%AstValue*) @func428 (%AstValue* %5)
;stmt1:
  %7 = getelementptr inbounds %AstValue, %AstValue* %1, i1 0, i32 3
; index array
  %8 = getelementptr inbounds [2 x %AstValue*], [2 x %AstValue*]* %7, i1 0, %Int64 1
  %9 = load %AstValue*, %AstValue** %8
  %10 = call %Value* (%AstValue*) @func428 (%AstValue* %9)
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
  %21 = call %Value* (%Value*, %Type*) @func476 (%Value* %6, %Type* %20)
;stmt7:
  %22 = getelementptr inbounds %Value, %Value* %21, i1 0, i32 1
  %23 = load %Type*, %Type** %22
  %24 = call %Value* (%Value*, %Type*) @func476 (%Value* %10, %Type* %23)
;stmt8:
  %25 = getelementptr inbounds %Value, %Value* %21, i1 0, i32 1
  %26 = load %Type*, %Type** %25
  %27 = getelementptr inbounds %Value, %Value* %24, i1 0, i32 1
  %28 = load %Type*, %Type** %27
  %29 = getelementptr inbounds %AstValue, %AstValue* %1, i1 0, i32 14
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
  %36 = call i1 (%ValueKind, %Type*) @func472 (%ValueKind %0, %Type* %35)
  %37 = xor i1 %36, 1
  br i1 %37, label %then_3, label %else_3
then_3:
;stmt11:
  %38 = bitcast [18 x %Nat8]* @func435_str1 to %Str
  %39 = getelementptr inbounds %AstValue, %AstValue* %1, i1 0, i32 14
  %40 = load %TokenInfo*, %TokenInfo** %39
  call void (%Str, %TokenInfo*) @error (%Str %38, %TokenInfo* %40)
;stmt12:
  br label %fail
  br label %endif_3
else_3:
  br label %endif_3
endif_3:
;stmt13:
  %42 = call i1 (%ValueKind) @func480 (%ValueKind %0)
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
  %95 = getelementptr inbounds %AstValue, %AstValue* %1, i1 0, i32 14
  %96 = load %TokenInfo*, %TokenInfo** %95
  %97 = call %Value* (%Type*, %Int64, %TokenInfo*) @func426 (%Type* %47, %Int64 %94, %TokenInfo* %96)
  ret %Value* %97
  br label %endif_4
else_4:
  br label %endif_4
endif_4:
;stmt19:
  %99 = getelementptr inbounds %AstValue, %AstValue* %1, i1 0, i32 14
  %100 = load %TokenInfo*, %TokenInfo** %99
  %101 = call %Value* (%ValueKind, %Type*, %TokenInfo*) @func424 (%ValueKind %0, %Type* %47, %TokenInfo* %100)
;stmt20:
  %102 = getelementptr inbounds %Value, %Value* %101, i1 0, i32 9
  %103 = getelementptr inbounds %ValueBin, %ValueBin* %102, i1 0, i32 0
  store %Value* %21, %Value** %103, align 8
;stmt21:
  %104 = getelementptr inbounds %Value, %Value* %101, i1 0, i32 9
  %105 = getelementptr inbounds %ValueBin, %ValueBin* %104, i1 0, i32 1
  store %Value* %24, %Value** %105, align 8
;stmt22:
  %106 = getelementptr inbounds %Value, %Value* %101, i1 0, i32 19
  %107 = getelementptr inbounds %Value, %Value* %21, i1 0, i32 19
  %108 = load i1, i1* %107
  %109 = getelementptr inbounds %Value, %Value* %24, i1 0, i32 19
  %110 = load i1, i1* %109
  %111 = or i1 %108, %110
  store i1 %111, i1* %106, align 1
;stmt23:
  ret %Value* %101
;stmt24:
  br label %fail
fail:
;stmt25:
  %113 = getelementptr inbounds %AstValue, %AstValue* %1, i1 0, i32 14
  %114 = load %TokenInfo*, %TokenInfo** %113
  %115 = call %Value* (%TokenInfo*) @value_new_poison (%TokenInfo* %114)
  ret %Value* %115
}

define %Value* @func436 (%AstValue*) {
;stmt0:
  %2 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 6
  %3 = getelementptr inbounds %AstValueCall, %AstValueCall* %2, i1 0, i32 0
  %4 = load %AstValue*, %AstValue** %3
  %5 = call %Value* (%AstValue*) @func428 (%AstValue* %4)
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
  %12 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 14
  %13 = load %TokenInfo*, %TokenInfo** %12
  %14 = call %List* (%Value*, %List*, %TokenInfo*) @func437 (%Value* %5, %List* %11, %TokenInfo* %13)
;stmt4:
  %15 = getelementptr inbounds %Value, %Value* %5, i1 0, i32 1
  %16 = load %Type*, %Type** %15
  %17 = getelementptr inbounds %Type, %Type* %16, i1 0, i32 5
  %18 = getelementptr inbounds %TypeFunc, %TypeFunc* %17, i1 0, i32 1
  %19 = load %Type*, %Type** %18
  %20 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 14
  %21 = load %TokenInfo*, %TokenInfo** %20
  %22 = call %Value* (%ValueKind, %Type*, %TokenInfo*) @func424 (%ValueKind 31, %Type* %19, %TokenInfo* %21)
;stmt5:
  %23 = getelementptr inbounds %Value, %Value* %22, i1 0, i32 15
  %24 = getelementptr inbounds %ValueCall, %ValueCall* %23, i1 0, i32 0
  store %Value* %5, %Value** %24, align 8
;stmt6:
  %25 = getelementptr inbounds %Value, %Value* %22, i1 0, i32 15
  %26 = getelementptr inbounds %ValueCall, %ValueCall* %25, i1 0, i32 1
  store %List* %14, %List** %26, align 8
;stmt7:
  ret %Value* %22
;stmt8:
  br label %fail
fail:
;stmt9:
  %28 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 14
  %29 = load %TokenInfo*, %TokenInfo** %28
  %30 = call %Value* (%TokenInfo*) @value_new_poison (%TokenInfo* %29)
  ret %Value* %30
}

define i1 @func438 (%Unit*, %Unit*, %Unit*, %Nat32) {
;stmt0:
  %5 = bitcast %Unit* %0 to %Decl*
;stmt1:
  %6 = bitcast %Unit* %1 to %AstValue*
;stmt2:
  %7 = bitcast %Unit* %2 to %func437.type7*
;stmt3:
  %8 = icmp eq %AstValue* %6, zeroinitializer
  br i1 %8, label %then_0, label %else_0
then_0:
;stmt4:
  %9 = bitcast [21 x %Nat8]* @func437_func438_str1 to %Str
  %10 = getelementptr inbounds %func437.type7, %func437.type7* %7, i1 0, i32 3
  %11 = load %TokenInfo*, %TokenInfo** %10
  call void (%Str, %TokenInfo*) @error (%Str %9, %TokenInfo* %11)
;stmt5:
  ret i1 0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt6:
  %13 = call %Value* (%AstValue*) @func428 (%AstValue* %6)
;stmt7:
  %14 = icmp eq %Decl* %5, zeroinitializer
  br i1 %14, label %then_1, label %else_1
then_1:
;stmt8:
  %15 = getelementptr inbounds %func437.type7, %func437.type7* %7, i1 0, i32 0
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
  %23 = bitcast [16 x %Nat8]* @func437_func438_str2 to %Str
  %24 = getelementptr inbounds %Value, %Value* %13, i1 0, i32 21
  %25 = load %TokenInfo*, %TokenInfo** %24
  call void (%Str, %TokenInfo*) @error (%Str %23, %TokenInfo* %25)
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
;stmt10:
  %26 = call %Value* (%Value*) @func475 (%Value* %13)
;stmt11:
  %27 = getelementptr inbounds %func437.type7, %func437.type7* %7, i1 0, i32 2
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
  %34 = call %Value* (%Value*, %Type*) @func476 (%Value* %13, %Type* %33)
;stmt14:
  %35 = getelementptr inbounds %Decl, %Decl* %5, i1 0, i32 1
  %36 = load %Type*, %Type** %35
  %37 = getelementptr inbounds %Value, %Value* %34, i1 0, i32 1
  %38 = load %Type*, %Type** %37
  %39 = getelementptr inbounds %Value, %Value* %34, i1 0, i32 21
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
  %43 = getelementptr inbounds %func437.type7, %func437.type7* %7, i1 0, i32 2
  %44 = load %List*, %List** %43
  %45 = bitcast %Value* %34 to %Unit*
  %46 = call i1 (%List*, %Unit*) @list_append (%List* %44, %Unit* %45)
;stmt16:
  ret i1 1
}

define %List* @func437 (%Value*, %List*, %TokenInfo*) {
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
  %12 = alloca %func437.type7
  store %func437.type7 zeroinitializer, %func437.type7* %12, align 8
;stmt2:
  %13 = getelementptr inbounds %func437.type7, %func437.type7* %12, i1 0, i32 0
  store %Value* %0, %Value** %13, align 8
;stmt3:
  %14 = getelementptr inbounds %func437.type7, %func437.type7* %12, i1 0, i32 1
  store %List* %11, %List** %14, align 8
;stmt4:
  %15 = getelementptr inbounds %func437.type7, %func437.type7* %12, i1 0, i32 2
  %16 = call %List* () @map_new ()
  store %List* %16, %List** %15, align 8
;stmt5:
  %17 = getelementptr inbounds %func437.type7, %func437.type7* %12, i1 0, i32 3
  store %TokenInfo* %2, %TokenInfo** %17, align 8
;stmt6:
  %18 = getelementptr inbounds %func437.type7, %func437.type7* %12, i1 0
  %19 = bitcast %func437.type7* %18 to %Unit*
  call void (%List*, %List*, %ListWhileHandler2, %Unit*) @list_while2_or (%List* %11, %List* %1, %ListWhileHandler2 @func438, %Unit* %19)
;stmt7:
  %20 = getelementptr inbounds %func437.type7, %func437.type7* %12, i1 0, i32 2
  %21 = load %List*, %List** %20
  ret %List* %21
}

define %Type* @func440 (%Type*) {
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

define %Value* @func439 (%AstValue*) {
;stmt0:
  %2 = alloca %Value*
  %3 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 7
  %4 = getelementptr inbounds %AstValueIndex, %AstValueIndex* %3, i1 0, i32 0
  %5 = load %AstValue*, %AstValue** %4
  %6 = call %Value* (%AstValue*, i1) @func429 (%AstValue* %5, i1 0)
  %7 = call %Value* (%Value*) @func511 (%Value* %6)
  store %Value* %7, %Value** %2, align 8
;stmt1:
  %8 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 7
  %9 = getelementptr inbounds %AstValueIndex, %AstValueIndex* %8, i1 0, i32 1
  %10 = load %AstValue*, %AstValue** %9
  %11 = call %Value* (%AstValue*) @func428 (%AstValue* %10)
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
  %47 = call %Type* (%Type*) @func440 (%Type* %46)
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
  %52 = getelementptr inbounds %Value, %Value* %51, i1 0, i32 21
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
  %58 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 14
  %59 = load %TokenInfo*, %TokenInfo** %58
  %60 = call %Value* (%ValueKind, %Type*, %TokenInfo*) @func424 (%ValueKind 32, %Type* %49, %TokenInfo* %59)
;stmt11:
  %61 = getelementptr inbounds %Value, %Value* %60, i1 0, i32 10
  %62 = getelementptr inbounds %ValueIndex, %ValueIndex* %61, i1 0, i32 0
  %63 = load %Value*, %Value** %2
  store %Value* %63, %Value** %62, align 8
;stmt12:
  %64 = getelementptr inbounds %Value, %Value* %60, i1 0, i32 10
  %65 = getelementptr inbounds %ValueIndex, %ValueIndex* %64, i1 0, i32 1
  %66 = call %Value* (%Value*) @func475 (%Value* %11)
  store %Value* %66, %Value** %65, align 8
;stmt13:
  ret %Value* %60
;stmt14:
  br label %fail
fail:
;stmt15:
  %68 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 14
  %69 = load %TokenInfo*, %TokenInfo** %68
  %70 = call %Value* (%TokenInfo*) @value_new_poison (%TokenInfo* %69)
  ret %Value* %70
}

define %Type* @func442 (%Type*) {
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

define %Value* @func441 (%AstValue*) {
;stmt0:
  %2 = alloca %Value*
  %3 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 8
  %4 = getelementptr inbounds %AstValueAccess, %AstValueAccess* %3, i1 0, i32 0
  %5 = load %AstValue*, %AstValue** %4
  %6 = call %Value* (%AstValue*, i1) @func429 (%AstValue* %5, i1 0)
  %7 = call %Value* (%Value*) @func511 (%Value* %6)
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
  %34 = call %Type* (%Type*) @func442 (%Type* %33)
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
  %39 = getelementptr inbounds %Value, %Value* %38, i1 0, i32 21
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
  %45 = call %Decl* (%Type*, %Str) @func381 (%Type* %36, %Str %12)
;stmt9:
  %46 = icmp eq %Decl* %45, zeroinitializer
  br i1 %46, label %then_2, label %else_2
then_2:
;stmt10:
  %47 = bitcast [16 x %Nat8]* @func441_str1 to %Str
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
  %56 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 14
  %57 = load %TokenInfo*, %TokenInfo** %56
  %58 = call %Value* (%ValueKind, %Type*, %TokenInfo*) @func424 (%ValueKind 33, %Type* %55, %TokenInfo* %57)
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
  %65 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 14
  %66 = load %TokenInfo*, %TokenInfo** %65
  %67 = call %Value* (%TokenInfo*) @value_new_poison (%TokenInfo* %66)
  ret %Value* %67
}

define %Value* @do_value_cast_var (%Value*, %Type*, %TokenInfo*) {
;stmt0:
  %4 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 21
  %5 = load %TokenInfo*, %TokenInfo** %4
  %6 = call %Value* (%Value*, %Type*, %TokenInfo*) @func473 (%Value* %0, %Type* %1, %TokenInfo* %5)
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
  %7 = bitcast [16 x %Nat8]* @func444_str1 to %Str
  call void (%Str, %TokenInfo*) @error (%Str %7, %TokenInfo* %2)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt2:
  %8 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 21
  %9 = load %TokenInfo*, %TokenInfo** %8
  %10 = call %Value* (%Value*, %Type*, %TokenInfo*) @func473 (%Value* %0, %Type* %1, %TokenInfo* %9)
  ret %Value* %10
}

define %Value* @do_value_cast_ref (%Value*, %Type*, %TokenInfo*) {
;stmt0:
  %4 = call i1 (%Type*) @func383 (%Type* %1)
  %5 = xor i1 %4, 1
  br i1 %5, label %then_0, label %else_0
then_0:
;stmt1:
  %6 = bitcast [16 x %Nat8]* @func445_str1 to %Str
  call void (%Str, %TokenInfo*) @error (%Str %6, %TokenInfo* %2)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt2:
  %7 = call %Value* (%Value*, %Type*, %TokenInfo*) @func473 (%Value* %0, %Type* %1, %TokenInfo* %2)
  ret %Value* %7
}

define %Value* @do_value_cast_num (%Value*, %Type*, %TokenInfo*) {
;stmt0:
  %4 = load i1, i1* @unsafe
  %5 = xor i1 %4, 1
  br i1 %5, label %then_0, label %else_0
then_0:
;stmt1:
  %6 = call i1 (%Type*) @func383 (%Type* %1)
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
  %7 = call %Value* (%Value*, %Type*, %TokenInfo*) @func473 (%Value* %0, %Type* %1, %TokenInfo* %2)
  ret %Value* %7
}

define %Value* @do_value_cast_func (%Value*, %Type*, %TokenInfo*) {
;stmt0:
  %4 = call i1 (%Type*) @typeIsPointerToUnit (%Type* %1)
  %5 = xor i1 %4, 1
  br i1 %5, label %then_0, label %else_0
then_0:
;stmt1:
  %6 = bitcast [16 x %Nat8]* @func447_str1 to %Str
  call void (%Str, %TokenInfo*) @error (%Str %6, %TokenInfo* %2)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt2:
  %7 = call %Value* (%Value*, %Type*, %TokenInfo*) @func473 (%Value* %0, %Type* %1, %TokenInfo* %2)
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
  %7 = bitcast [16 x %Nat8]* @func448_str1 to %Str
  call void (%Str, %TokenInfo*) @error (%Str %7, %TokenInfo* %2)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt2:
  %8 = call %Value* (%Value*, %Type*, %TokenInfo*) @func473 (%Value* %0, %Type* %1, %TokenInfo* %2)
  ret %Value* %8
}

define %Value* @do_value_cast_rec (%Value*, %Type*, %TokenInfo*) {
;stmt0:
  %4 = bitcast [16 x %Nat8]* @func449_str1 to %Str
  call void (%Str, %TokenInfo*) @error (%Str %4, %TokenInfo* %2)
;stmt1:
  %5 = call %Value* (%Value*, %Type*, %TokenInfo*) @func473 (%Value* %0, %Type* %1, %TokenInfo* %2)
  ret %Value* %5
}

define %Value* @do_value_cast_ptr (%Value*, %Type*, %TokenInfo*) {
;stmt0:
  %4 = call %Value* (%Value*, %Type*, %TokenInfo*) @func473 (%Value* %0, %Type* %1, %TokenInfo* %2)
  ret %Value* %4
}

define %Value* @do_value_cast_arr (%Value*, %Type*, %TokenInfo*) {
;stmt0:
  %4 = bitcast [16 x %Nat8]* @func451_str1 to %Str
  call void (%Str, %TokenInfo*) @error (%Str %4, %TokenInfo* %2)
;stmt1:
  %5 = call %Value* (%Value*, %Type*, %TokenInfo*) @func473 (%Value* %0, %Type* %1, %TokenInfo* %2)
  ret %Value* %5
}

define %Value* @do_value_cast_uarr (%Value*, %Type*, %TokenInfo*) {
;stmt0:
  %4 = call i1 (%Type*) @typeIsPointerToUnit (%Type* %1)
  %5 = xor i1 %4, 1
  br i1 %5, label %then_0, label %else_0
then_0:
;stmt1:
  %6 = bitcast [16 x %Nat8]* @func452_str1 to %Str
  call void (%Str, %TokenInfo*) @error (%Str %6, %TokenInfo* %2)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt2:
  %7 = call %Value* (%Value*, %Type*, %TokenInfo*) @func473 (%Value* %0, %Type* %1, %TokenInfo* %2)
  ret %Value* %7
}

define %Value* @do_value_cast_union (%Value*, %Type*, %TokenInfo*) {
;stmt0:
  %4 = call %Value* (%Value*, %Type*, %TokenInfo*) @func473 (%Value* %0, %Type* %1, %TokenInfo* %2)
  ret %Value* %4
}

define %Value* @func455 (%Value*, %Type*, %TokenInfo*) {
;stmt0:
  %4 = bitcast [18 x %Nat8]* @func454_func455_str1 to %Str
  call void (%Str) @fatal (%Str %4)
;stmt1:
  ret %Value* zeroinitializer
}

define %Value* @func454 (%AstValue*) {
;stmt0:
  %2 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 9
  %3 = getelementptr inbounds %AstValueCast, %AstValueCast* %2, i1 0, i32 0
  %4 = load %AstValue*, %AstValue** %3
  %5 = call %Value* (%AstValue*) @func428 (%AstValue* %4)
;stmt1:
  %6 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 9
  %7 = getelementptr inbounds %AstValueCast, %AstValueCast* %6, i1 0, i32 1
  %8 = load %AstType*, %AstType** %7
  %9 = call %Type* (%AstType*) @func393 (%AstType* %8)
;stmt2:
  %10 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 14
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
  %25 = call i1 (%Type*, %Type*) @func417 (%Type* %24, %Type* %9)
  br i1 %25, label %then_3, label %else_3
then_3:
;stmt9:
  %26 = bitcast [18 x %Nat8]* @func454_str1 to %Str
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
  %54 = icmp eq %TypeKind %31, 13
  br i1 %54, label %select_1_11_ok, label %select_1_12
select_1_11_ok:
  %55 = call %Value* (%Value*, %Type*, %TokenInfo*) @do_value_cast_union (%Value* %5, %Type* %9, %TokenInfo* %11)
  br label %select_1_end
select_1_12:
  %56 = call %Value* (%Value*, %Type*, %TokenInfo*) @func455 (%Value* %5, %Type* %9, %TokenInfo* %11)
  br label %select_1_end
select_1_end:
  %57 = phi %Value* [ %33, %select_1_0_ok ], [ %35, %select_1_1_ok ], [ %37, %select_1_2_ok ], [ %39, %select_1_3_ok ], [ %41, %select_1_4_ok ], [ %43, %select_1_5_ok ], [ %45, %select_1_6_ok ], [ %47, %select_1_7_ok ], [ %49, %select_1_8_ok ], [ %51, %select_1_9_ok ], [ %53, %select_1_10_ok ], [ %55, %select_1_11_ok ], [ %56, %select_1_12 ]
  ret %Value* %57
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
;stmt12:
  %59 = getelementptr inbounds %Type, %Type* %9, i1 0, i32 11
  %60 = getelementptr inbounds %TypeVar, %TypeVar* %59, i1 0, i32 0
  %61 = load %Type*, %Type** %60
;stmt13:
  %62 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 14
  %63 = load %TokenInfo*, %TokenInfo** %62
  %64 = call %Value* (%Value*, %Type*, %TokenInfo*) @func473 (%Value* %5, %Type* %61, %TokenInfo* %63)
;stmt14:
  %65 = getelementptr inbounds %Value, %Value* %64, i1 0, i32 1
  %66 = getelementptr inbounds %Value, %Value* %64, i1 0, i32 1
  %67 = load %Type*, %Type** %66
  %68 = getelementptr inbounds %Type, %Type* %9, i1 0, i32 13
  %69 = load %TokenInfo*, %TokenInfo** %68
  %70 = call %Type* (%Type*, %TokenInfo*) @type_var_new (%Type* %67, %TokenInfo* %69)
  store %Type* %70, %Type** %65, align 8
;stmt15:
  %71 = call %Str () @func156 ()
;stmt16:
  %72 = load %FuncContext*, %FuncContext** @fctx
  %73 = icmp ne %FuncContext* %72, zeroinitializer
  br i1 %73, label %then_4, label %else_4
then_4:
;stmt17:
  %74 = alloca %AstId
  store %AstId zeroinitializer, %AstId* %74, align 8
;stmt18:
  %75 = getelementptr inbounds %AstId, %AstId* %74, i1 0, i32 0
  store %Str %71, %Str* %75, align 8
;stmt19:
  %76 = getelementptr inbounds %AstId, %AstId* %74, i1 0, i32 1
  %77 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 14
  %78 = load %TokenInfo*, %TokenInfo** %77
  store %TokenInfo* %78, %TokenInfo** %76, align 8
;stmt20:
  %79 = getelementptr inbounds %AstId, %AstId* %74, i1 0
  %80 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 14
  %81 = load %TokenInfo*, %TokenInfo** %80
  %82 = call %Value* (%AstId*, %Type*, %Value*, %TokenInfo*) @func517 (%AstId* %79, %Type* %9, %Value* %64, %TokenInfo* %81)
  ret %Value* %82
  br label %endif_4
else_4:
;stmt21:
  %84 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 14
  %85 = load %TokenInfo*, %TokenInfo** %84
  %86 = call %Value* (%Str, %Type*, %Value*, %TokenInfo*) @func516 (%Str %71, %Type* %9, %Value* %64, %TokenInfo* %85)
  ret %Value* %86
  br label %endif_4
endif_4:
;stmt22:
  br label %fail
fail:
;stmt23:
  %88 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 14
  %89 = load %TokenInfo*, %TokenInfo** %88
  %90 = call %Value* (%TokenInfo*) @value_new_poison (%TokenInfo* %89)
  ret %Value* %90
}

define void @func457 (%Unit*, %Unit*, %Nat32, %Node*) {
;stmt0:
  %5 = bitcast %Unit* %0 to %Type*
;stmt1:
  %6 = bitcast %Unit* %1 to %func456.type8*
;stmt2:
  %7 = getelementptr inbounds %func456.type8, %func456.type8* %6, i1 0, i32 0
  %8 = load %Type*, %Type** %7
  %9 = call i1 (%Type*, %Type*) @func417 (%Type* %5, %Type* %8)
  br i1 %9, label %then_0, label %else_0
then_0:
;stmt3:
  %10 = getelementptr inbounds %func456.type8, %func456.type8* %6, i1 0, i32 1
  store %Nat32 %2, %Nat32* %10, align 4
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  ret void
}

define %Value* @func456 (%AstValue*) {
;stmt0:
  %2 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 10
  %3 = getelementptr inbounds %AstValueIs, %AstValueIs* %2, i1 0, i32 0
  %4 = load %AstValue*, %AstValue** %3
  %5 = call %Value* (%AstValue*) @func428 (%AstValue* %4)
;stmt1:
  %6 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 10
  %7 = getelementptr inbounds %AstValueIs, %AstValueIs* %6, i1 0, i32 1
  %8 = load %AstType*, %AstType** %7
  %9 = call %Type* (%AstType*) @func393 (%AstType* %8)
;stmt2:
  %10 = getelementptr inbounds %Value, %Value* %5, i1 0, i32 1
  %11 = load %Type*, %Type** %10
  %12 = call i1 (%Type*) @func392 (%Type* %11)
  %13 = xor i1 %12, 1
  br i1 %13, label %then_0, label %else_0
then_0:
;stmt3:
  %14 = bitcast [20 x %Nat8]* @func456_str1 to %Str
  %15 = getelementptr inbounds %Value, %Value* %5, i1 0, i32 21
  %16 = load %TokenInfo*, %TokenInfo** %15
  call void (%Str, %TokenInfo*) @error (%Str %14, %TokenInfo* %16)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt4:
  %17 = getelementptr inbounds %Value, %Value* %5, i1 0, i32 1
  %18 = load %Type*, %Type** %17
  %19 = getelementptr inbounds %Type, %Type* %18, i1 0, i32 12
  %20 = getelementptr inbounds %TypeUnion, %TypeUnion* %19, i1 0, i32 0
  %21 = call i1 (%List*, %Type*) @func158 (%List* %20, %Type* %9)
  %22 = xor i1 %21, 1
  br i1 %22, label %then_1, label %else_1
then_1:
;stmt5:
  %23 = bitcast [11 x %Nat8]* @func456_str2 to %Str
  %24 = getelementptr inbounds %Value, %Value* %5, i1 0, i32 21
  %25 = load %TokenInfo*, %TokenInfo** %24
  call void (%Str, %TokenInfo*) @error (%Str %23, %TokenInfo* %25)
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt6:
  %26 = alloca %func456.type8
  store %func456.type8 zeroinitializer, %func456.type8* %26, align 8
;stmt7:
  %27 = getelementptr inbounds %func456.type8, %func456.type8* %26, i1 0, i32 0
  store %Type* %9, %Type** %27, align 8
;stmt8:
  %28 = getelementptr inbounds %Value, %Value* %5, i1 0, i32 1
  %29 = load %Type*, %Type** %28
  %30 = getelementptr inbounds %Type, %Type* %29, i1 0, i32 12
  %31 = getelementptr inbounds %TypeUnion, %TypeUnion* %30, i1 0, i32 0
  %32 = getelementptr inbounds %func456.type8, %func456.type8* %26, i1 0
  %33 = bitcast %func456.type8* %32 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @func64 (%List* %31, %ListForeachHandler @func457, %Unit* %33)
;stmt9:
  %34 = load %Type*, %Type** @typeBool
  %35 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 14
  %36 = load %TokenInfo*, %TokenInfo** %35
  %37 = call %Value* (%ValueKind, %Type*, %TokenInfo*) @func424 (%ValueKind 35, %Type* %34, %TokenInfo* %36)
;stmt10:
  %38 = getelementptr inbounds %Value, %Value* %37, i1 0, i32 14
  %39 = getelementptr inbounds %ValueIs, %ValueIs* %38, i1 0, i32 0
  store %Value* %5, %Value** %39, align 8
;stmt11:
  %40 = getelementptr inbounds %Value, %Value* %37, i1 0, i32 14
  %41 = getelementptr inbounds %ValueIs, %ValueIs* %40, i1 0, i32 1
  %42 = getelementptr inbounds %func456.type8, %func456.type8* %26, i1 0, i32 1
  %43 = load %Nat32, %Nat32* %42
  store %Nat32 %43, %Nat32* %41, align 4
;stmt12:
  ret %Value* %37
}

define %Value* @func458 (%AstValue*) {
;stmt0:
  %2 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 11
  %3 = getelementptr inbounds %AstValueAs, %AstValueAs* %2, i1 0, i32 0
  %4 = load %AstValue*, %AstValue** %3
  %5 = call %Value* (%AstValue*) @func428 (%AstValue* %4)
;stmt1:
  %6 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 11
  %7 = getelementptr inbounds %AstValueAs, %AstValueAs* %6, i1 0, i32 1
  %8 = load %AstType*, %AstType** %7
  %9 = call %Type* (%AstType*) @func393 (%AstType* %8)
;stmt2:
  %10 = getelementptr inbounds %Value, %Value* %5, i1 0, i32 1
  %11 = load %Type*, %Type** %10
  %12 = call i1 (%Type*) @func392 (%Type* %11)
  %13 = xor i1 %12, 1
  br i1 %13, label %then_0, label %else_0
then_0:
;stmt3:
  %14 = bitcast [21 x %Nat8]* @func458_str1 to %Str
  %15 = getelementptr inbounds %Value, %Value* %5, i1 0, i32 21
  %16 = load %TokenInfo*, %TokenInfo** %15
  call void (%Str, %TokenInfo*) @error (%Str %14, %TokenInfo* %16)
;stmt4:
  br label %fail
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt5:
  %18 = getelementptr inbounds %Value, %Value* %5, i1 0, i32 1
  %19 = load %Type*, %Type** %18
  %20 = getelementptr inbounds %Type, %Type* %19, i1 0, i32 12
  %21 = getelementptr inbounds %TypeUnion, %TypeUnion* %20, i1 0, i32 0
  %22 = call i1 (%List*, %Type*) @func158 (%List* %21, %Type* %9)
  %23 = xor i1 %22, 1
  br i1 %23, label %then_1, label %else_1
then_1:
;stmt6:
  %24 = bitcast [11 x %Nat8]* @func458_str2 to %Str
  %25 = getelementptr inbounds %Value, %Value* %5, i1 0, i32 21
  %26 = load %TokenInfo*, %TokenInfo** %25
  call void (%Str, %TokenInfo*) @error (%Str %24, %TokenInfo* %26)
;stmt7:
  br label %fail
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt8:
  %28 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 14
  %29 = load %TokenInfo*, %TokenInfo** %28
  %30 = call %Value* (%Value*, %Type*, %TokenInfo*) @func473 (%Value* %5, %Type* %9, %TokenInfo* %29)
  ret %Value* %30
;stmt9:
  br label %fail
fail:
;stmt10:
  %32 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 14
  %33 = load %TokenInfo*, %TokenInfo** %32
  %34 = call %Value* (%TokenInfo*) @value_new_poison (%TokenInfo* %33)
  ret %Value* %34
}

define %Value* @func459 (%AstValue*) {
;stmt0:
  %2 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 4
  %3 = load %AstType*, %AstType** %2
  %4 = call %Type* (%AstType*) @func393 (%AstType* %3)
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
  %12 = bitcast [20 x %Nat8]* @func459_str1 to %Str
  %13 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 4
  %14 = load %AstType*, %AstType** %13
  %15 = getelementptr inbounds %AstType, %AstType* %14, i1 0, i32 10
  %16 = load %TokenInfo*, %TokenInfo** %15
  call void (%Str, %TokenInfo*) @error (%Str %12, %TokenInfo* %16)
;stmt5:
  %17 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 14
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
  %25 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 14
  %26 = load %TokenInfo*, %TokenInfo** %25
  %27 = call %Value* (%Type*, %Int64, %TokenInfo*) @func426 (%Type* %21, %Int64 %24, %TokenInfo* %26)
  ret %Value* %27
;stmt7:
  br label %fail
fail:
;stmt8:
  %29 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 14
  %30 = load %TokenInfo*, %TokenInfo** %29
  %31 = call %Value* (%TokenInfo*) @value_new_poison (%TokenInfo* %30)
  ret %Value* %31
}

define %Value* @func460 (%AstValue*) {
;stmt0:
  %2 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 4
  %3 = load %AstType*, %AstType** %2
  %4 = call %Type* (%AstType*) @func393 (%AstType* %3)
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
  %12 = bitcast [21 x %Nat8]* @func460_str1 to %Str
  %13 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 4
  %14 = load %AstType*, %AstType** %13
  %15 = getelementptr inbounds %AstType, %AstType* %14, i1 0, i32 10
  %16 = load %TokenInfo*, %TokenInfo** %15
  call void (%Str, %TokenInfo*) @error (%Str %12, %TokenInfo* %16)
;stmt5:
  %17 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 14
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
  %25 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 14
  %26 = load %TokenInfo*, %TokenInfo** %25
  %27 = call %Value* (%Type*, %Int64, %TokenInfo*) @func426 (%Type* %21, %Int64 %24, %TokenInfo* %26)
  ret %Value* %27
;stmt7:
  br label %fail
fail:
;stmt8:
  %29 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 14
  %30 = load %TokenInfo*, %TokenInfo** %29
  %31 = call %Value* (%TokenInfo*) @value_new_poison (%TokenInfo* %30)
  ret %Value* %31
}

define %Value* @func461 (%AstValue*) {
;stmt0:
  %2 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 2
  %3 = getelementptr inbounds %AstName, %AstName* %2, i1 0, i32 0
  %4 = load %AstId*, %AstId** %3
  %5 = getelementptr inbounds %AstId, %AstId* %4, i1 0, i32 0
  %6 = load %Str, %Str* %5
;stmt1:
  %7 = call %Value* (%Str) @func139 (%Str %6)
;stmt2:
  %8 = icmp eq %Value* %7, zeroinitializer
  br i1 %8, label %then_0, label %else_0
then_0:
;stmt3:
  %9 = bitcast [15 x %Nat8]* @func461_str1 to %Str
  %10 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 14
  %11 = load %TokenInfo*, %TokenInfo** %10
  call void (%Str, %TokenInfo*) @error (%Str %9, %TokenInfo* %11)
;stmt4:
  %12 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 14
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

define %Value* @func462 (%AstValue*) {
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
  %7 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func462_str1, i1 0, %Int64 0
  %8 = load %Nat8, %Nat8* %7
  %9 = icmp eq %Nat8 %6, %8
; eval index uarray
  %10 = getelementptr inbounds %Nat8, %Nat8* %3, %Int64 1
  %11 = load %Nat8, %Nat8* %10
; index array
  %12 = getelementptr inbounds [2 x %Nat8], [2 x %Nat8]* @func462_str2, i1 0, %Int64 0
  %13 = load %Nat8, %Nat8* %12
  %14 = icmp eq %Nat8 %11, %13
  %15 = and i1 %9, %14
  br i1 %15, label %then_0, label %else_0
then_0:
;stmt3:
; eval index uarray
  %16 = getelementptr inbounds %Nat8, %Nat8* %3, %Int64 2
  %17 = bitcast %Nat8* %16 to %Unit*
  %18 = bitcast [5 x %Nat8]* @func462_str3 to %Str
  %19 = getelementptr inbounds %Int64, %Int64* %4, i1 0
  %20 = call %Int32 (%Unit*, %Str, ...) @sscanf (%Unit* %17, %Str %18, %Int64* %19)
  br label %endif_0
else_0:
;stmt4:
; eval index uarray
  %21 = getelementptr inbounds %Nat8, %Nat8* %3, %Int64 0
  %22 = bitcast %Nat8* %21 to %Unit*
  %23 = bitcast [5 x %Nat8]* @func462_str4 to %Str
  %24 = getelementptr inbounds %Int64, %Int64* %4, i1 0
  %25 = call %Int32 (%Unit*, %Str, ...) @sscanf (%Unit* %22, %Str %23, %Int64* %24)
  br label %endif_0
endif_0:
;stmt5:
  %26 = load %Type*, %Type** @typeNumeric
  %27 = load %Int64, %Int64* %4
  %28 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 14
  %29 = load %TokenInfo*, %TokenInfo** %28
  %30 = call %Value* (%Type*, %Int64, %TokenInfo*) @func426 (%Type* %26, %Int64 %27, %TokenInfo* %29)
  ret %Value* %30
}

define %Value* @func463 (%AstValue*) {
;stmt0:
  %2 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 1
  %3 = load %Str, %Str* %2
;stmt1:
  %4 = call %Nat32 (%Str) @strlen (%Str %3)
  %5 = add %Nat32 %4, 1
;stmt2:
  %6 = load %Type*, %Type** @typeChar
  %7 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 14
  %8 = load %TokenInfo*, %TokenInfo** %7
  %9 = call %Type* (%Type*, %Nat32, %TokenInfo*) @func377 (%Type* %6, %Nat32 %5, %TokenInfo* %8)
  %10 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 14
  %11 = load %TokenInfo*, %TokenInfo** %10
  %12 = call %Type* (%Type*, %TokenInfo*) @func375 (%Type* %9, %TokenInfo* %11)
;stmt3:
  %13 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 14
  %14 = load %TokenInfo*, %TokenInfo** %13
  %15 = call %Value* (%ValueKind, %Type*, %TokenInfo*) @func424 (%ValueKind 4, %Type* %12, %TokenInfo* %14)
;stmt4:
  %16 = call %Str () @func154 ()
;stmt5:
  %17 = getelementptr inbounds %Value, %Value* %15, i1 0, i32 4
  %18 = getelementptr inbounds %Assembly, %Assembly* @asm0, i1 0
  %19 = call %Definition* (%Assembly*, %Str, %Str, %Nat32) @func267 (%Assembly* %18, %Str %16, %Str %3, %Nat32 %5)
  store %Definition* %19, %Definition** %17, align 8
;stmt6:
  ret %Value* %15
}

define void @func465 (%Unit*, %Unit*, %Nat32, %Node*) {
;stmt0:
  %5 = bitcast %Unit* %0 to %Decl*
;stmt1:
  %6 = bitcast %Unit* %1 to %Block*
;stmt2:
  %7 = getelementptr inbounds %Decl, %Decl* %5, i1 0, i32 1
  %8 = load %Type*, %Type** %7
  %9 = getelementptr inbounds %Decl, %Decl* %5, i1 0, i32 6
  %10 = load %TokenInfo*, %TokenInfo** %9
  %11 = call %Value* (%ValueKind, %Type*, %TokenInfo*) @func424 (%ValueKind 6, %Type* %8, %TokenInfo* %10)
;stmt3:
  %12 = getelementptr inbounds %Value, %Value* %11, i1 0, i32 6
  store %Decl* %5, %Decl** %12, align 8
;stmt4:
  %13 = getelementptr inbounds %Block, %Block* %6, i1 0, i32 1
  %14 = getelementptr inbounds %Index, %Index* %13, i1 0, i32 1
  %15 = getelementptr inbounds %Decl, %Decl* %5, i1 0, i32 0
  %16 = load %AstId*, %AstId** %15
  %17 = getelementptr inbounds %AstId, %AstId* %16, i1 0, i32 0
  %18 = load %Str, %Str* %17
  %19 = bitcast %Value* %11 to %Unit*
  %20 = call i1 (%List*, %Str, %Unit*) @map_append (%List* %14, %Str %18, %Unit* %19)
  ret void
}

define %Value* @func464 (%AstValue*) {
;stmt0:
  %2 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 5
  %3 = getelementptr inbounds %AstValueFunc, %AstValueFunc* %2, i1 0, i32 0
  %4 = load %AstType*, %AstType** %3
  %5 = call %Type* (%AstType*) @func393 (%AstType* %4)
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
  %12 = bitcast [5 x %Nat8]* @func464_str1 to %Str
  %13 = load %Nat32, %Nat32* @fuid
  %14 = call %Str (%Str, %Nat32) @func149 (%Str %12, %Nat32 %13)
;stmt5:
  %15 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 13
  %16 = load i1, i1* %15
  br i1 %16, label %then_1, label %else_1
then_1:
;stmt6:
  %17 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 14
  %18 = load %TokenInfo*, %TokenInfo** %17
  %19 = call %Value* (%ValueKind, %Type*, %TokenInfo*) @func424 (%ValueKind 4, %Type* %5, %TokenInfo* %18)
;stmt7:
  %20 = getelementptr inbounds %Value, %Value* %19, i1 0, i32 4
  %21 = getelementptr inbounds %Assembly, %Assembly* @asm0, i1 0
  %22 = call %Definition* (%Assembly*, %Str, %Type*, %Block*) @func269 (%Assembly* %21, %Str %14, %Type* %5, %Block* zeroinitializer)
  store %Definition* %22, %Definition** %20, align 8
;stmt8:
  ret %Value* %19
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt9:
  %24 = call %Unit* (%Nat32) @malloc (%Nat32 144)
  %25 = bitcast %Unit* %24 to %Block*
  %26 = call %Block* (%Block*, %Block*) @func490 (%Block* %25, %Block* zeroinitializer)
;stmt10:
  %27 = getelementptr inbounds %Type, %Type* %5, i1 0, i32 5
  %28 = getelementptr inbounds %TypeFunc, %TypeFunc* %27, i1 0, i32 0
  %29 = load %Type*, %Type** %28
  %30 = getelementptr inbounds %Type, %Type* %29, i1 0, i32 9
  %31 = getelementptr inbounds %TypeRecord, %TypeRecord* %30, i1 0, i32 0
  %32 = load %List*, %List** %31
  %33 = bitcast %Block* %26 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @func64 (%List* %32, %ListForeachHandler @func465, %Unit* %33)
;stmt11:
  %34 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 5
  %35 = getelementptr inbounds %AstValueFunc, %AstValueFunc* %34, i1 0, i32 1
  %36 = load %AstStmt*, %AstStmt** %35
  %37 = getelementptr inbounds %AstStmt, %AstStmt* %36, i1 0, i32 12
  %38 = load %TokenInfo*, %TokenInfo** %37
  %39 = call %Value* (%ValueKind, %Type*, %TokenInfo*) @func424 (%ValueKind 4, %Type* %5, %TokenInfo* %38)
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
  %59 = bitcast [2 x %Nat8]* @func464_str2 to %Str
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
  %69 = call %union.2 (%AstStmt*) @func487 (%AstStmt* %68)
;stmt21:
  %70 = ptrtoint %union.2 %69 to %Int64
  %71 = bitcast %Int64 0 to %Int64
  %72 = icmp eq %Int64 %70, %71
  br i1 %72, label %then_3, label %else_3
then_3:
;stmt22:
  br label %fail
  br label %endif_3
else_3:
  br label %endif_3
endif_3:
;stmt23:
  %74 = bitcast %union.2 %69 to %Stmt*
;stmt24:
  %75 = getelementptr inbounds %Value, %Value* %39, i1 0, i32 4
  %76 = getelementptr inbounds %Assembly, %Assembly* @asm0, i1 0
  %77 = getelementptr inbounds %Stmt, %Stmt* %74, i1 0, i32 2
  %78 = call %Definition* (%Assembly*, %Str, %Type*, %Block*) @func269 (%Assembly* %76, %Str %14, %Type* %5, %Block* %77)
  store %Definition* %78, %Definition** %75, align 8
;stmt25:
  store %FuncContext* %48, %FuncContext** @fctx, align 8
;stmt26:
  ret %Value* %39
;stmt27:
  br label %fail
fail:
;stmt28:
  store %FuncContext* %48, %FuncContext** @fctx, align 8
;stmt29:
  %80 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 14
  %81 = load %TokenInfo*, %TokenInfo** %80
  %82 = call %Value* (%TokenInfo*) @value_new_poison (%TokenInfo* %81)
  ret %Value* %82
}

define %Value* @func466 (%AstValue*) {
;stmt0:
  %2 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 14
  %3 = load %TokenInfo*, %TokenInfo** %2
  %4 = call %Value* (%TokenInfo*) @value_new_poison (%TokenInfo* %3)
  ret %Value* %4
}

define %Value* @func467 (%AstValue*) {
;stmt0:
  %2 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 14
  %3 = load %TokenInfo*, %TokenInfo** %2
  %4 = call %Value* (%TokenInfo*) @value_new_poison (%TokenInfo* %3)
  ret %Value* %4
}

define %Value* @func468 (%AstValue*) {
;stmt0:
  %2 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 3
; index array
  %3 = getelementptr inbounds [2 x %AstValue*], [2 x %AstValue*]* %2, i1 0, %Int64 0
  %4 = load %AstValue*, %AstValue** %3
  %5 = call %Value* (%AstValue*) @func428 (%AstValue* %4)
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
  %17 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 14
  %18 = load %TokenInfo*, %TokenInfo** %17
  %19 = call %Value* (%Type*, %Int64, %TokenInfo*) @func426 (%Type* %14, %Int64 %16, %TokenInfo* %18)
  ret %Value* %19
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt5:
  %21 = getelementptr inbounds %Value, %Value* %5, i1 0, i32 1
  %22 = load %Type*, %Type** %21
  %23 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 14
  %24 = load %TokenInfo*, %TokenInfo** %23
  %25 = call %Value* (%ValueKind, %Type*, %TokenInfo*) @func424 (%ValueKind 13, %Type* %22, %TokenInfo* %24)
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
  %29 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 14
  %30 = load %TokenInfo*, %TokenInfo** %29
  %31 = call %Value* (%TokenInfo*) @value_new_poison (%TokenInfo* %30)
  ret %Value* %31
}

define %Value* @func469 (%AstValue*) {
;stmt0:
  %2 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 3
; index array
  %3 = getelementptr inbounds [2 x %AstValue*], [2 x %AstValue*]* %2, i1 0, %Int64 0
  %4 = load %AstValue*, %AstValue** %3
  %5 = call %Value* (%AstValue*) @func428 (%AstValue* %4)
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
  %18 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 14
  %19 = load %TokenInfo*, %TokenInfo** %18
  %20 = call %Value* (%Type*, %Int64, %TokenInfo*) @func426 (%Type* %14, %Int64 %17, %TokenInfo* %19)
  ret %Value* %20
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt5:
  %22 = getelementptr inbounds %Value, %Value* %5, i1 0, i32 1
  %23 = load %Type*, %Type** %22
  %24 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 14
  %25 = load %TokenInfo*, %TokenInfo** %24
  %26 = call %Value* (%ValueKind, %Type*, %TokenInfo*) @func424 (%ValueKind 12, %Type* %23, %TokenInfo* %25)
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
  %30 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 14
  %31 = load %TokenInfo*, %TokenInfo** %30
  %32 = call %Value* (%TokenInfo*) @value_new_poison (%TokenInfo* %31)
  ret %Value* %32
}

define %Value* @func470 (%AstValue*) {
;stmt0:
  %2 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 3
; index array
  %3 = getelementptr inbounds [2 x %AstValue*], [2 x %AstValue*]* %2, i1 0, %Int64 0
  %4 = load %AstValue*, %AstValue** %3
  %5 = call %Value* (%AstValue*) @func428 (%AstValue* %4)
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
  %18 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 14
  %19 = load %TokenInfo*, %TokenInfo** %18
  %20 = call %Value* (%Type*, %Int64, %TokenInfo*) @func426 (%Type* %14, %Int64 %17, %TokenInfo* %19)
  ret %Value* %20
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt5:
  %22 = getelementptr inbounds %Value, %Value* %5, i1 0, i32 1
  %23 = load %Type*, %Type** %22
  %24 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 14
  %25 = load %TokenInfo*, %TokenInfo** %24
  %26 = call %Value* (%ValueKind, %Type*, %TokenInfo*) @func424 (%ValueKind 11, %Type* %23, %TokenInfo* %25)
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
  %30 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 14
  %31 = load %TokenInfo*, %TokenInfo** %30
  %32 = call %Value* (%TokenInfo*) @value_new_poison (%TokenInfo* %31)
  ret %Value* %32
}

define %Value* @func471 (%AstValue*) {
;stmt0:
  %2 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 3
; index array
  %3 = getelementptr inbounds [2 x %AstValue*], [2 x %AstValue*]* %2, i1 0, %Int64 0
  %4 = load %AstValue*, %AstValue** %3
  %5 = call %Value* (%AstValue*) @func428 (%AstValue* %4)
;stmt1:
  %6 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 3
; index array
  %7 = getelementptr inbounds [2 x %AstValue*], [2 x %AstValue*]* %6, i1 0, %Int64 1
  %8 = load %AstValue*, %AstValue** %7
  %9 = call %Value* (%AstValue*) @func428 (%AstValue* %8)
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
  %20 = icmp eq %AstValueKind %19, 26
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
  %45 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 14
  %46 = load %TokenInfo*, %TokenInfo** %45
  %47 = call %Value* (%Type*, %Int64, %TokenInfo*) @func426 (%Type* %44, %Int64 %42, %TokenInfo* %46)
  ret %Value* %47
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
;stmt10:
  %49 = call %Value* (%Value*) @func475 (%Value* %5)
;stmt11:
  %50 = getelementptr inbounds %Value, %Value* %5, i1 0, i32 1
  %51 = load %Type*, %Type** %50
  %52 = getelementptr inbounds %Value, %Value* %9, i1 0, i32 21
  %53 = load %TokenInfo*, %TokenInfo** %52
  %54 = call %Value* (%Value*, %Type*, %TokenInfo*) @func473 (%Value* %9, %Type* %51, %TokenInfo* %53)
;stmt12:
  %55 = getelementptr inbounds %Value, %Value* %5, i1 0, i32 1
  %56 = load %Type*, %Type** %55
  %57 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 14
  %58 = load %TokenInfo*, %TokenInfo** %57
  %59 = call %Value* (%ValueKind, %Type*, %TokenInfo*) @func424 (%ValueKind %23, %Type* %56, %TokenInfo* %58)
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
  %65 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 14
  %66 = load %TokenInfo*, %TokenInfo** %65
  %67 = call %Value* (%TokenInfo*) @value_new_poison (%TokenInfo* %66)
  ret %Value* %67
}

define i1 @func472 (%ValueKind, %Type*) {
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
  %10 = call i1 (%Type*) @func384 (%Type* %1)
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
  %17 = call i1 (%Type*) @func383 (%Type* %1)
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
  %28 = call i1 (%Type*, %Type*) @func417 (%Type* %1, %Type* %27)
  %29 = call i1 (%Type*) @func383 (%Type* %1)
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

define i1 @func474 (%Value*, %Type*) {
;stmt0:
  %3 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 0
  %4 = load %ValueKind, %ValueKind* %3
  %5 = icmp eq %ValueKind %4, 3
  ret i1 %5
}

define %Value* @func473 (%Value*, %Type*, %TokenInfo*) {
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
  %14 = call i1 (%Type*, %Type*) @func417 (%Type* %13, %Type* %1)
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
  %18 = icmp eq %TypeKind %17, 13
  br i1 %18, label %then_3, label %else_3
then_3:
;stmt7:
  br label %sact
;stmt8:
  %20 = bitcast [32 x %Nat8]* @func473_str1 to %Str
  call void (%Str, %TokenInfo*) @error (%Str %20, %TokenInfo* %2)
;stmt9:
  %21 = call %Value* (%TokenInfo*) @value_new_poison (%TokenInfo* %2)
  ret %Value* %21
  br label %endif_3
else_3:
  br label %endif_3
endif_3:
;stmt10:
  %23 = call i1 (%Value*, %Type*) @func474 (%Value* %0, %Type* %1)
  br i1 %23, label %then_4, label %else_4
then_4:
;stmt11:
  %24 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 2
  %25 = load %Int64, %Int64* %24
  %26 = call %Value* (%Type*, %Int64, %TokenInfo*) @func426 (%Type* %1, %Int64 %25, %TokenInfo* %2)
  ret %Value* %26
  br label %endif_4
else_4:
  br label %endif_4
endif_4:
;stmt12:
  br label %sact
sact:
;stmt13:
  %28 = call %Value* (%ValueKind, %Type*, %TokenInfo*) @func424 (%ValueKind 34, %Type* %1, %TokenInfo* %2)
;stmt14:
  %29 = getelementptr inbounds %Value, %Value* %28, i1 0, i32 12
  %30 = getelementptr inbounds %ValueCast, %ValueCast* %29, i1 0, i32 0
  store %Value* %0, %Value** %30, align 8
;stmt15:
  %31 = getelementptr inbounds %Value, %Value* %28, i1 0, i32 12
  %32 = getelementptr inbounds %ValueCast, %ValueCast* %31, i1 0, i32 1
  store %Type* %1, %Type** %32, align 8
;stmt16:
  ret %Value* %28
;stmt17:
  br label %fail
fail:
;stmt18:
  %34 = call %Value* (%TokenInfo*) @value_new_poison (%TokenInfo* %2)
  ret %Value* %34
}

define %Value* @func475 (%Value*) {
;stmt0:
  %2 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 1
  %3 = load %Type*, %Type** %2
  %4 = load %Type*, %Type** @typeNumeric
  %5 = call i1 (%Type*, %Type*) @func417 (%Type* %3, %Type* %4)
  br label %select_1_0
select_1_0:
  %6 = icmp eq i1 %5, 1
  br i1 %6, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %7 = load %Type*, %Type** @typeBaseInt
  %8 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 2
  %9 = load %Int64, %Int64* %8
  %10 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 21
  %11 = load %TokenInfo*, %TokenInfo** %10
  %12 = call %Value* (%Type*, %Int64, %TokenInfo*) @func426 (%Type* %7, %Int64 %9, %TokenInfo* %11)
  br label %select_1_end
select_1_1:
  br label %select_1_end
select_1_end:
  %13 = phi %Value* [ %12, %select_1_0_ok ], [ %0, %select_1_1 ]
  ret %Value* %13
}

define %Value* @func476 (%Value*, %Type*) {
;stmt0:
  %3 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 1
  %4 = load %Type*, %Type** %3
  %5 = icmp ne %Type* %4, zeroinitializer
  %6 = bitcast [29 x %Nat8]* @func476_str1 to %Str
  call void (i1, %Str) @assert (i1 %5, %Str %6)
;stmt1:
  %7 = icmp ne %Type* %1, zeroinitializer
  %8 = bitcast [24 x %Nat8]* @func476_str2 to %Str
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
  %23 = call i1 (%Type*) @func388 (%Type* %1)
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
  %34 = bitcast [14 x %Nat8]* @func476_str3 to %Str
  %35 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 21
  %36 = load %TokenInfo*, %TokenInfo** %35
  call void (%Str, %TokenInfo*) @error (%Str %34, %TokenInfo* %36)
  br label %endif_4
else_4:
  br label %endif_4
endif_4:
;stmt10:
  %37 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 2
  %38 = load %Int64, %Int64* %37
  %39 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 21
  %40 = load %TokenInfo*, %TokenInfo** %39
  %41 = call %Value* (%Type*, %Int64, %TokenInfo*) @func426 (%Type* %1, %Int64 %38, %TokenInfo* %40)
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
  %45 = call i1 (%Type*, %Type*) @func477 (%Type* %44, %Type* %1)
  br i1 %45, label %then_5, label %else_5
then_5:
;stmt12:
  %46 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 21
  %47 = load %TokenInfo*, %TokenInfo** %46
  %48 = call %Value* (%Value*, %Type*, %TokenInfo*) @func473 (%Value* %0, %Type* %1, %TokenInfo* %47)
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

define i1 @func477 (%Type*, %Type*) {
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
  %18 = call i1 (%Type*) @func384 (%Type* %17)
  br i1 %18, label %then_3, label %else_3
then_3:
;stmt7:
  %19 = call i1 (%Type*) @func386 (%Type* %1)
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
  %23 = call i1 (%Type*, %Type*) @func417 (%Type* %0, %Type* %22)
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
  %26 = call i1 (%Type*, %Type*) @func417 (%Type* %1, %Type* %25)
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
  %28 = icmp eq %TypeKind %6, 13
  br i1 %28, label %then_8, label %else_8
then_8:
;stmt15:
  %29 = getelementptr inbounds %Type, %Type* %1, i1 0, i32 12
  %30 = getelementptr inbounds %TypeUnion, %TypeUnion* %29, i1 0, i32 0
  %31 = call i1 (%List*, %Type*) @func158 (%List* %30, %Type* %0)
  ret i1 %31
  br label %endif_8
else_8:
  br label %endif_8
endif_8:
;stmt16:
  ret i1 0
}

define i1 @func478 (%ValueKind) {
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

define i1 @func479 (%ValueKind) {
;stmt0:
  %2 = icmp eq %ValueKind %0, 14
  %3 = icmp eq %ValueKind %0, 15
  %4 = icmp eq %ValueKind %0, 16
  %5 = icmp eq %ValueKind %0, 17
  %6 = icmp eq %ValueKind %0, 18
  %7 = icmp eq %ValueKind %0, 21
  %8 = icmp eq %ValueKind %0, 19
  %9 = icmp eq %ValueKind %0, 20
  %10 = call i1 (%ValueKind) @func480 (%ValueKind %0)
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

define i1 @func480 (%ValueKind) {
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

define i1 @func481 (%ValueKind) {
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

define i1 @func482 (%Value*) {
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
  %16 = call i1 (%Type*) @func384 (%Type* %15)
;stmt5:
  %17 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 10
  %18 = getelementptr inbounds %ValueIndex, %ValueIndex* %17, i1 0, i32 0
  %19 = load %Value*, %Value** %18
  %20 = call i1 (%Value*) @func482 (%Value* %19)
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
  %27 = call i1 (%Value*) @func482 (%Value* %26)
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

define i1 @func483 (%Value*) {
;stmt0:
  %2 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 0
  %3 = load %ValueKind, %ValueKind* %2
;stmt1:
  %4 = icmp eq %ValueKind %3, 8
  %5 = icmp eq %ValueKind %3, 5
  %6 = or i1 %4, %5
  ret i1 %6
}

define void @func484 () {
;stmt0:
  %1 = load %Type*, %Type** @typeBool
  %2 = call %Value* (%Type*, %Int64, %TokenInfo*) @func426 (%Type* %1, %Int64 0, %TokenInfo* zeroinitializer)
;stmt1:
  %3 = bitcast [6 x %Nat8]* @func484_str1 to %Str
  call void (%Str, %Value*) @builtin_value_bind (%Str %3, %Value* %2)
;stmt2:
  %4 = load %Type*, %Type** @typeBool
  %5 = call %Value* (%Type*, %Int64, %TokenInfo*) @func426 (%Type* %4, %Int64 1, %TokenInfo* zeroinitializer)
;stmt3:
  %6 = bitcast [5 x %Nat8]* @func484_str2 to %Str
  call void (%Str, %Value*) @builtin_value_bind (%Str %6, %Value* %5)
;stmt4:
  %7 = call %Type* (%TypeKind, %Nat32, %TokenInfo*) @func373 (%TypeKind 3, %Nat32 8, %TokenInfo* zeroinitializer)
;stmt5:
  %8 = call %Value* (%Type*, %Int64, %TokenInfo*) @func426 (%Type* %7, %Int64 0, %TokenInfo* zeroinitializer)
;stmt6:
  %9 = bitcast [4 x %Nat8]* @func484_str3 to %Str
  call void (%Str, %Value*) @builtin_value_bind (%Str %9, %Value* %8)
;stmt7:
  %10 = load %Type*, %Type** @typeUnit
  %11 = call %Value* (%Type*, %Int64, %TokenInfo*) @func426 (%Type* %10, %Int64 0, %TokenInfo* zeroinitializer)
;stmt8:
  %12 = bitcast [5 x %Nat8]* @func484_str4 to %Str
  call void (%Str, %Value*) @builtin_value_bind (%Str %12, %Value* %11)
  ret void
}

define %Stmt* @func485 (%StmtKind, %TokenInfo*) {
;stmt0:
  %3 = call %Unit* (%Nat32) @malloc (%Nat32 248)
  %4 = bitcast %Unit* %3 to %Stmt*
;stmt1:
  %5 = icmp ne %Stmt* %4, zeroinitializer
  %6 = bitcast [9 x %Nat8]* @func485_str1 to %Str
  call void (i1, %Str) @assert (i1 %5, %Str %6)
;stmt2:
  %7 = bitcast %Stmt* %4 to %Unit*
  %8 = call %Unit* (%Unit*, %Nat8, %Nat32) @memset (%Unit* %7, %Nat8 0, %Nat32 248)
;stmt3:
  %9 = getelementptr inbounds %Stmt, %Stmt* %4, i1 0, i32 0
  store %StmtKind %0, %StmtKind* %9, align 2
;stmt4:
  %10 = getelementptr inbounds %Stmt, %Stmt* %4, i1 0, i32 8
  store %TokenInfo* %1, %TokenInfo** %10, align 8
;stmt5:
  ret %Stmt* %4
}

define %Stmt* @func486 (%Value*, %Value*, %TokenInfo*) {
;stmt0:
  %4 = call %Stmt* (%StmtKind, %TokenInfo*) @func485 (%StmtKind 4, %TokenInfo* %2)
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

define %union.2 @func487 (%AstStmt*) {
;stmt0:
  %2 = getelementptr inbounds %AstStmt, %AstStmt* %0, i1 0, i32 0
  %3 = load %AstStmtKind, %AstStmtKind* %2
  br label %select_1_0
select_1_0:
  %4 = icmp eq %AstStmtKind %3, 5
  br i1 %4, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %5 = call %union.2 (%AstStmt*) @func488 (%AstStmt* %0)
  br label %select_1_end
select_1_1:
  %6 = icmp eq %AstStmtKind %3, 1
  br i1 %6, label %select_1_1_ok, label %select_1_2
select_1_1_ok:
  %7 = call %union.2 (%AstStmt*) @func489 (%AstStmt* %0)
  br label %select_1_end
select_1_2:
  %8 = icmp eq %AstStmtKind %3, 6
  br i1 %8, label %select_1_2_ok, label %select_1_3
select_1_2_ok:
  %9 = call %union.2 (%AstStmt*) @func491 (%AstStmt* %0)
  br label %select_1_end
select_1_3:
  %10 = icmp eq %AstStmtKind %3, 4
  br i1 %10, label %select_1_3_ok, label %select_1_4
select_1_3_ok:
  %11 = call %union.2 (%AstStmt*) @func493 (%AstStmt* %0)
  br label %select_1_end
select_1_4:
  %12 = icmp eq %AstStmtKind %3, 7
  br i1 %12, label %select_1_4_ok, label %select_1_5
select_1_4_ok:
  %13 = call %union.2 (%AstStmt*) @func494 (%AstStmt* %0)
  br label %select_1_end
select_1_5:
  %14 = icmp eq %AstStmtKind %3, 8
  br i1 %14, label %select_1_5_ok, label %select_1_6
select_1_5_ok:
  %15 = call %union.2 (%AstStmt*) @func495 (%AstStmt* %0)
  br label %select_1_end
select_1_6:
  %16 = icmp eq %AstStmtKind %3, 9
  br i1 %16, label %select_1_6_ok, label %select_1_7
select_1_6_ok:
  %17 = call %union.2 (%AstStmt*) @func496 (%AstStmt* %0)
  br label %select_1_end
select_1_7:
  %18 = icmp eq %AstStmtKind %3, 2
  br i1 %18, label %select_1_7_ok, label %select_1_8
select_1_7_ok:
  %19 = call %union.2 (%AstStmt*) @func499 (%AstStmt* %0)
  br label %select_1_end
select_1_8:
  %20 = icmp eq %AstStmtKind %3, 10
  br i1 %20, label %select_1_8_ok, label %select_1_9
select_1_8_ok:
  %21 = call %union.2 (%AstStmt*) @func500 (%AstStmt* %0)
  br label %select_1_end
select_1_9:
  %22 = icmp eq %AstStmtKind %3, 11
  br i1 %22, label %select_1_9_ok, label %select_1_10
select_1_9_ok:
  %23 = call %union.2 (%AstStmt*) @func501 (%AstStmt* %0)
  br label %select_1_end
select_1_10:
  %24 = icmp eq %AstStmtKind %3, 12
  br i1 %24, label %select_1_10_ok, label %select_1_11
select_1_10_ok:
  %25 = call %union.2 (%AstStmt*) @func502 (%AstStmt* %0)
  br label %select_1_end
select_1_11:
  %26 = icmp eq %AstStmtKind %3, 13
  br i1 %26, label %select_1_11_ok, label %select_1_12
select_1_11_ok:
  %27 = call %union.2 (%AstStmt*) @func503 (%AstStmt* %0)
  br label %select_1_end
select_1_12:
  %28 = inttoptr %Unit zeroinitializer to %union.2
  br label %select_1_end
select_1_end:
  %29 = phi %union.2 [ %5, %select_1_0_ok ], [ %7, %select_1_1_ok ], [ %9, %select_1_2_ok ], [ %11, %select_1_3_ok ], [ %13, %select_1_4_ok ], [ %15, %select_1_5_ok ], [ %17, %select_1_6_ok ], [ %19, %select_1_7_ok ], [ %21, %select_1_8_ok ], [ %23, %select_1_9_ok ], [ %25, %select_1_10_ok ], [ %27, %select_1_11_ok ], [ %28, %select_1_12 ]
  ret %union.2 %29
}

define %union.2 @func488 (%AstStmt*) {
;stmt0:
  %2 = getelementptr inbounds %AstStmt, %AstStmt* %0, i1 0, i32 1
  %3 = getelementptr inbounds %AstStmtAssign, %AstStmtAssign* %2, i1 0, i32 1
  %4 = load %AstValue*, %AstValue** %3
  %5 = call %Value* (%AstValue*) @func428 (%AstValue* %4)
;stmt1:
  %6 = getelementptr inbounds %Value, %Value* %5, i1 0, i32 0
  %7 = load %ValueKind, %ValueKind* %6
  %8 = icmp eq %ValueKind %7, 1
  br i1 %8, label %then_0, label %else_0
then_0:
;stmt2:
  %9 = inttoptr %Unit zeroinitializer to %union.2
  ret %union.2 %9
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt3:
  %11 = getelementptr inbounds %AstStmt, %AstStmt* %0, i1 0, i32 1
  %12 = getelementptr inbounds %AstStmtAssign, %AstStmtAssign* %11, i1 0, i32 0
  %13 = load %AstValue*, %AstValue** %12
;stmt4:
  %14 = getelementptr inbounds %AstValue, %AstValue* %13, i1 0, i32 0
  %15 = load %AstValueKind, %AstValueKind* %14
  br label %select_1_0
select_1_0:
  %16 = icmp eq %AstValueKind %15, 3
  br i1 %16, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  %17 = call %Value* (%AstValue*) @func461 (%AstValue* %13)
  br label %select_1_end
select_1_1:
  %18 = icmp eq %AstValueKind %15, 8
  br i1 %18, label %select_1_1_ok, label %select_1_2
select_1_1_ok:
  %19 = call %Value* (%AstValue*) @func434 (%AstValue* %13)
  br label %select_1_end
select_1_2:
  %20 = icmp eq %AstValueKind %15, 29
  br i1 %20, label %select_1_2_ok, label %select_1_3
select_1_2_ok:
  %21 = call %Value* (%AstValue*) @func439 (%AstValue* %13)
  br label %select_1_end
select_1_3:
  %22 = icmp eq %AstValueKind %15, 30
  br i1 %22, label %select_1_3_ok, label %select_1_4
select_1_3_ok:
  %23 = call %Value* (%AstValue*) @func441 (%AstValue* %13)
  br label %select_1_end
select_1_4:
  %24 = bitcast %Value* zeroinitializer to %Value*
  br label %select_1_end
select_1_end:
  %25 = phi %Value* [ %17, %select_1_0_ok ], [ %19, %select_1_1_ok ], [ %21, %select_1_2_ok ], [ %23, %select_1_3_ok ], [ %24, %select_1_4 ]
;stmt5:
  %26 = icmp eq %Value* %25, zeroinitializer
  br i1 %26, label %then_1, label %else_1
then_1:
;stmt6:
  %27 = bitcast [16 x %Nat8]* @func488_str1 to %Str
  %28 = getelementptr inbounds %AstValue, %AstValue* %13, i1 0, i32 14
  %29 = load %TokenInfo*, %TokenInfo** %28
  call void (%Str, %TokenInfo*) @error (%Str %27, %TokenInfo* %29)
;stmt7:
  %30 = inttoptr %Unit zeroinitializer to %union.2
  ret %union.2 %30
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt8:
  %32 = call i1 (%Value*) @func482 (%Value* %25)
  br i1 %32, label %then_2, label %else_2
then_2:
;stmt9:
  %33 = bitcast [13 x %Nat8]* @func488_str2 to %Str
  %34 = getelementptr inbounds %AstStmt, %AstStmt* %0, i1 0, i32 12
  %35 = load %TokenInfo*, %TokenInfo** %34
  call void (%Str, %TokenInfo*) @error (%Str %33, %TokenInfo* %35)
;stmt10:
  %36 = inttoptr %Unit zeroinitializer to %union.2
  ret %union.2 %36
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
;stmt11:
  %38 = getelementptr inbounds %AstValue, %AstValue* %13, i1 0, i32 0
  %39 = load %AstValueKind, %AstValueKind* %38
  %40 = icmp ne %AstValueKind %39, 30
  %41 = getelementptr inbounds %AstValue, %AstValue* %13, i1 0, i32 0
  %42 = load %AstValueKind, %AstValueKind* %41
  %43 = icmp ne %AstValueKind %42, 29
  %44 = getelementptr inbounds %AstValue, %AstValue* %13, i1 0, i32 0
  %45 = load %AstValueKind, %AstValueKind* %44
  %46 = icmp ne %AstValueKind %45, 8
  %47 = and i1 %43, %46
  %48 = and i1 %40, %47
  br i1 %48, label %then_3, label %else_3
then_3:
  br label %endif_3
else_3:
  br label %endif_3
endif_3:
;stmt12:
  %49 = getelementptr inbounds %Value, %Value* %25, i1 0, i32 1
  %50 = load %Type*, %Type** %49
  %51 = getelementptr inbounds %Type, %Type* %50, i1 0, i32 0
  %52 = load %TypeKind, %TypeKind* %51
  br label %select_2_0
select_2_0:
  %53 = icmp eq %TypeKind %52, 5
  br i1 %53, label %select_2_0_ok, label %select_2_1
select_2_0_ok:
  %54 = getelementptr inbounds %Value, %Value* %25, i1 0, i32 1
  %55 = load %Type*, %Type** %54
  %56 = getelementptr inbounds %Type, %Type* %55, i1 0, i32 11
  %57 = getelementptr inbounds %TypeVar, %TypeVar* %56, i1 0, i32 0
  %58 = load %Type*, %Type** %57
  br label %select_2_end
select_2_1:
  %59 = getelementptr inbounds %Value, %Value* %25, i1 0, i32 1
  %60 = load %Type*, %Type** %59
  br label %select_2_end
select_2_end:
  %61 = phi %Type* [ %58, %select_2_0_ok ], [ %60, %select_2_1 ]
;stmt13:
  %62 = call %Value* (%Value*, %Type*) @func476 (%Value* %5, %Type* %61)
;stmt14:
  %63 = getelementptr inbounds %Value, %Value* %62, i1 0, i32 1
  %64 = load %Type*, %Type** %63
  %65 = getelementptr inbounds %AstStmt, %AstStmt* %0, i1 0, i32 12
  %66 = load %TokenInfo*, %TokenInfo** %65
  %67 = call i1 (%Type*, %Type*, %TokenInfo*) @type_check (%Type* %61, %Type* %64, %TokenInfo* %66)
  %68 = xor i1 %67, 1
  br i1 %68, label %then_4, label %else_4
then_4:
;stmt15:
  %69 = inttoptr %Unit zeroinitializer to %union.2
  ret %union.2 %69
  br label %endif_4
else_4:
  br label %endif_4
endif_4:
;stmt16:
  %71 = getelementptr inbounds %AstStmt, %AstStmt* %0, i1 0, i32 12
  %72 = load %TokenInfo*, %TokenInfo** %71
  %73 = call %Stmt* (%Value*, %Value*, %TokenInfo*) @func486 (%Value* %25, %Value* %62, %TokenInfo* %72)
  %74 = bitcast %Stmt* %73 to %union.2
  ret %union.2 %74
}

define %union.2 @func489 (%AstStmt*) {
;stmt0:
  %2 = getelementptr inbounds %AstStmt, %AstStmt* %0, i1 0, i32 3
  %3 = getelementptr inbounds %AstStmtValueDef, %AstStmtValueDef* %2, i1 0, i32 0
  %4 = load %AstId*, %AstId** %3
;stmt1:
  %5 = getelementptr inbounds %AstStmt, %AstStmt* %0, i1 0, i32 3
  %6 = getelementptr inbounds %AstStmtValueDef, %AstStmtValueDef* %5, i1 0, i32 1
  %7 = load %AstValue*, %AstValue** %6
  %8 = call %Value* (%AstValue*, i1) @func429 (%AstValue* %7, i1 0)
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
  %25 = call %Value* (%ValueKind, %Type*, %TokenInfo*) @func424 (%ValueKind 7, %Type* %22, %TokenInfo* %24)
;stmt6:
  %26 = getelementptr inbounds %AstId, %AstId* %4, i1 0, i32 0
  %27 = load %Str, %Str* %26
  call void (%Str, %Value*) @func143 (%Str %27, %Value* %25)
;stmt7:
  %28 = getelementptr inbounds %AstStmt, %AstStmt* %0, i1 0, i32 12
  %29 = load %TokenInfo*, %TokenInfo** %28
  %30 = call %Stmt* (%StmtKind, %TokenInfo*) @func485 (%StmtKind 1, %TokenInfo* %29)
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
  %36 = bitcast %Stmt* %30 to %union.2
  ret %union.2 %36
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt11:
  %38 = load %FuncContext*, %FuncContext** @fctx
  %39 = getelementptr inbounds %FuncContext, %FuncContext* %38, i1 0, i32 2
  %40 = load %Block*, %Block** %39
  %41 = getelementptr inbounds %AstId, %AstId* %4, i1 0, i32 0
  %42 = load %Str, %Str* %41
  call void (%Block*, %Str, %Value*) @func142 (%Block* %40, %Str %42, %Value* %8)
;stmt12:
  %43 = inttoptr %Unit zeroinitializer to %union.2
  ret %union.2 %43
}

define %Block* @func490 (%Block*, %Block*) {
;stmt0:
  %3 = bitcast %Block* %0 to %Unit*
  %4 = call %Unit* (%Unit*, %Nat8, %Nat32) @memset (%Unit* %3, %Nat8 0, %Nat32 144)
;stmt1:
  %5 = getelementptr inbounds %Block, %Block* %0, i1 0, i32 0
  store %Block* %1, %Block** %5, align 8
;stmt2:
  %6 = getelementptr inbounds %Block, %Block* %0, i1 0, i32 1
  call void (%Index*) @func132 (%Index* %6)
;stmt3:
  %7 = getelementptr inbounds %Block, %Block* %0, i1 0, i32 2
  call void (%List*) @map_init (%List* %7)
;stmt4:
  %8 = getelementptr inbounds %Block, %Block* %0, i1 0, i32 3
  call void (%List*) @map_init (%List* %8)
;stmt5:
  ret %Block* %0
}

define void @func492 (%Unit*, %Unit*, %Nat32, %Node*) {
;stmt0:
  %5 = bitcast %Unit* %0 to %AstStmt*
;stmt1:
  %6 = call %union.2 (%AstStmt*) @func487 (%AstStmt* %5)
;stmt2:
  %7 = ptrtoint %union.2 %6 to %Int64
  %8 = bitcast %Int64 0 to %Int64
  %9 = icmp eq %Int64 %7, %8
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
  %12 = bitcast %union.2 %6 to %Stmt*
  %13 = bitcast %Stmt* %12 to %Unit*
  %14 = call i1 (%List*, %Unit*) @list_append (%List* %11, %Unit* %13)
  ret void
}

define %union.2 @func491 (%AstStmt*) {
;stmt0:
  %2 = getelementptr inbounds %AstStmt, %AstStmt* %0, i1 0, i32 12
  %3 = load %TokenInfo*, %TokenInfo** %2
  %4 = call %Stmt* (%StmtKind, %TokenInfo*) @func485 (%StmtKind 2, %TokenInfo* %3)
;stmt1:
  %5 = getelementptr inbounds %Stmt, %Stmt* %4, i1 0, i32 2
  %6 = load %FuncContext*, %FuncContext** @fctx
  %7 = getelementptr inbounds %FuncContext, %FuncContext* %6, i1 0, i32 2
  %8 = load %Block*, %Block** %7
  %9 = call %Block* (%Block*, %Block*) @func490 (%Block* %5, %Block* %8)
;stmt2:
  %10 = load %FuncContext*, %FuncContext** @fctx
  %11 = getelementptr inbounds %FuncContext, %FuncContext* %10, i1 0, i32 2
  store %Block* %9, %Block** %11, align 8
;stmt3:
  %12 = getelementptr inbounds %AstStmt, %AstStmt* %0, i1 0, i32 6
  %13 = getelementptr inbounds %AstStmtBlock, %AstStmtBlock* %12, i1 0, i32 0
  %14 = getelementptr inbounds %Block, %Block* %9, i1 0, i32 2
  %15 = bitcast %List* %14 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @func64 (%List* %13, %ListForeachHandler @func492, %Unit* %15)
;stmt4:
  %16 = load %FuncContext*, %FuncContext** @fctx
  %17 = getelementptr inbounds %FuncContext, %FuncContext* %16, i1 0, i32 2
  %18 = getelementptr inbounds %Block, %Block* %9, i1 0, i32 0
  %19 = load %Block*, %Block** %18
  store %Block* %19, %Block** %17, align 8
;stmt5:
  %20 = bitcast %Stmt* %4 to %union.2
  ret %union.2 %20
}

define %union.2 @func493 (%AstStmt*) {
;stmt0:
  %2 = getelementptr inbounds %AstStmt, %AstStmt* %0, i1 0, i32 5
  %3 = getelementptr inbounds %AstStmtExpr, %AstStmtExpr* %2, i1 0, i32 0
  %4 = load %AstValue*, %AstValue** %3
  %5 = call %Value* (%AstValue*) @func428 (%AstValue* %4)
;stmt1:
  %6 = getelementptr inbounds %Value, %Value* %5, i1 0, i32 0
  %7 = load %ValueKind, %ValueKind* %6
  %8 = icmp eq %ValueKind %7, 1
  br i1 %8, label %then_0, label %else_0
then_0:
;stmt2:
  %9 = inttoptr %Unit zeroinitializer to %union.2
  ret %union.2 %9
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt3:
  %11 = getelementptr inbounds %Value, %Value* %5, i1 0, i32 1
  %12 = load %Type*, %Type** %11
  %13 = load %Type*, %Type** @typeUnit
  %14 = call i1 (%Type*, %Type*) @func417 (%Type* %12, %Type* %13)
  %15 = xor i1 %14, 1
  br i1 %15, label %then_1, label %else_1
then_1:
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt4:
  %16 = getelementptr inbounds %AstStmt, %AstStmt* %0, i1 0, i32 12
  %17 = load %TokenInfo*, %TokenInfo** %16
  %18 = call %Stmt* (%StmtKind, %TokenInfo*) @func485 (%StmtKind 1, %TokenInfo* %17)
;stmt5:
  %19 = getelementptr inbounds %Stmt, %Stmt* %18, i1 0, i32 3
  %20 = getelementptr inbounds %Expr, %Expr* %19, i1 0, i32 0
  store %Value* %5, %Value** %20, align 8
;stmt6:
  %21 = bitcast %Stmt* %18 to %union.2
  ret %union.2 %21
}

define %union.2 @func494 (%AstStmt*) {
;stmt0:
  %2 = getelementptr inbounds %AstStmt, %AstStmt* %0, i1 0, i32 7
  %3 = getelementptr inbounds %AstStmtIf, %AstStmtIf* %2, i1 0, i32 0
  %4 = load %AstValue*, %AstValue** %3
  %5 = call %Value* (%AstValue*) @func428 (%AstValue* %4)
;stmt1:
  %6 = getelementptr inbounds %AstStmt, %AstStmt* %0, i1 0, i32 7
  %7 = getelementptr inbounds %AstStmtIf, %AstStmtIf* %6, i1 0, i32 1
  %8 = load %AstStmt*, %AstStmt** %7
  %9 = call %union.2 (%AstStmt*) @func487 (%AstStmt* %8)
;stmt2:
  %10 = alloca %union.9
  %11 = inttoptr %Unit zeroinitializer to %union.9
  store %union.9 %11, %union.9* %10, align 8
;stmt3:
  %12 = getelementptr inbounds %AstStmt, %AstStmt* %0, i1 0, i32 7
  %13 = getelementptr inbounds %AstStmtIf, %AstStmtIf* %12, i1 0, i32 2
  %14 = load %union.0, %union.0* %13
  %15 = ptrtoint %union.0 %14 to %Int64
  %16 = bitcast %Int64 0 to %Int64
  %17 = icmp eq %Int64 %15, %16
  %18 = xor i1 %17, 1
  br i1 %18, label %then_0, label %else_0
then_0:
;stmt4:
  %19 = getelementptr inbounds %AstStmt, %AstStmt* %0, i1 0, i32 7
  %20 = getelementptr inbounds %AstStmtIf, %AstStmtIf* %19, i1 0, i32 2
  %21 = load %union.0, %union.0* %20
  %22 = bitcast %union.0 %21 to %AstStmt*
  %23 = call %union.2 (%AstStmt*) @func487 (%AstStmt* %22)
;stmt5:
  %24 = ptrtoint %union.2 %23 to %Int64
  %25 = bitcast %Int64 0 to %Int64
  %26 = icmp eq %Int64 %24, %25
  %27 = xor i1 %26, 1
  br i1 %27, label %then_1, label %else_1
then_1:
;stmt6:
  %28 = bitcast %union.2 %23 to %Stmt*
  %29 = bitcast %Stmt* %28 to %union.9
  store %union.9 %29, %union.9* %10, align 8
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt7:
  %30 = getelementptr inbounds %Value, %Value* %5, i1 0, i32 0
  %31 = load %ValueKind, %ValueKind* %30
  %32 = icmp eq %ValueKind %31, 1
  br i1 %32, label %then_2, label %else_2
then_2:
;stmt8:
  %33 = inttoptr %Unit zeroinitializer to %union.2
  ret %union.2 %33
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
;stmt9:
  %35 = load %Type*, %Type** @typeBool
  %36 = getelementptr inbounds %Value, %Value* %5, i1 0, i32 1
  %37 = load %Type*, %Type** %36
  %38 = getelementptr inbounds %Value, %Value* %5, i1 0, i32 21
  %39 = load %TokenInfo*, %TokenInfo** %38
  %40 = call i1 (%Type*, %Type*, %TokenInfo*) @type_check (%Type* %35, %Type* %37, %TokenInfo* %39)
  %41 = xor i1 %40, 1
  br i1 %41, label %then_3, label %else_3
then_3:
;stmt10:
  %42 = inttoptr %Unit zeroinitializer to %union.2
  ret %union.2 %42
  br label %endif_3
else_3:
  br label %endif_3
endif_3:
;stmt11:
  %44 = ptrtoint %union.2 %9 to %Int64
  %45 = bitcast %Int64 0 to %Int64
  %46 = icmp eq %Int64 %44, %45
  br i1 %46, label %then_4, label %else_4
then_4:
;stmt12:
  %47 = inttoptr %Unit zeroinitializer to %union.2
  ret %union.2 %47
  br label %endif_4
else_4:
  br label %endif_4
endif_4:
;stmt13:
  %49 = getelementptr inbounds %AstStmt, %AstStmt* %0, i1 0, i32 12
  %50 = load %TokenInfo*, %TokenInfo** %49
  %51 = call %Stmt* (%StmtKind, %TokenInfo*) @func485 (%StmtKind 5, %TokenInfo* %50)
;stmt14:
  %52 = getelementptr inbounds %Stmt, %Stmt* %51, i1 0, i32 6
  %53 = getelementptr inbounds %If, %If* %52, i1 0, i32 0
  store %Value* %5, %Value** %53, align 8
;stmt15:
  %54 = getelementptr inbounds %Stmt, %Stmt* %51, i1 0, i32 6
  %55 = getelementptr inbounds %If, %If* %54, i1 0, i32 1
  %56 = bitcast %union.2 %9 to %Stmt*
  store %Stmt* %56, %Stmt** %55, align 8
;stmt16:
  %57 = getelementptr inbounds %Stmt, %Stmt* %51, i1 0, i32 6
  %58 = getelementptr inbounds %If, %If* %57, i1 0, i32 2
  %59 = load %union.9, %union.9* %10
  store %union.9 %59, %union.9* %58, align 8
;stmt17:
  %60 = bitcast %Stmt* %51 to %union.2
  ret %union.2 %60
}

define %union.2 @func495 (%AstStmt*) {
;stmt0:
  %2 = getelementptr inbounds %AstStmt, %AstStmt* %0, i1 0, i32 8
  %3 = getelementptr inbounds %AstStmtWhile, %AstStmtWhile* %2, i1 0, i32 0
  %4 = load %AstValue*, %AstValue** %3
  %5 = call %Value* (%AstValue*) @func428 (%AstValue* %4)
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
  %15 = call %union.2 (%AstStmt*) @func487 (%AstStmt* %14)
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
  %25 = inttoptr %Unit zeroinitializer to %union.2
  ret %union.2 %25
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt6:
  %27 = load %Type*, %Type** @typeBool
  %28 = getelementptr inbounds %Value, %Value* %5, i1 0, i32 1
  %29 = load %Type*, %Type** %28
  %30 = getelementptr inbounds %Value, %Value* %5, i1 0, i32 21
  %31 = load %TokenInfo*, %TokenInfo** %30
  %32 = call i1 (%Type*, %Type*, %TokenInfo*) @type_check (%Type* %27, %Type* %29, %TokenInfo* %31)
  %33 = xor i1 %32, 1
  br i1 %33, label %then_1, label %else_1
then_1:
;stmt7:
  %34 = inttoptr %Unit zeroinitializer to %union.2
  ret %union.2 %34
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
;stmt8:
  %36 = ptrtoint %union.2 %15 to %Int64
  %37 = bitcast %Int64 0 to %Int64
  %38 = icmp eq %Int64 %36, %37
  br i1 %38, label %then_2, label %else_2
then_2:
;stmt9:
  %39 = inttoptr %Unit zeroinitializer to %union.2
  ret %union.2 %39
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
;stmt10:
  %41 = getelementptr inbounds %AstStmt, %AstStmt* %0, i1 0, i32 12
  %42 = load %TokenInfo*, %TokenInfo** %41
  %43 = call %Stmt* (%StmtKind, %TokenInfo*) @func485 (%StmtKind 6, %TokenInfo* %42)
;stmt11:
  %44 = getelementptr inbounds %Stmt, %Stmt* %43, i1 0, i32 5
  %45 = getelementptr inbounds %While, %While* %44, i1 0, i32 0
  store %Value* %5, %Value** %45, align 8
;stmt12:
  %46 = getelementptr inbounds %Stmt, %Stmt* %43, i1 0, i32 5
  %47 = getelementptr inbounds %While, %While* %46, i1 0, i32 1
  %48 = bitcast %union.2 %15 to %Stmt*
  store %Stmt* %48, %Stmt** %47, align 8
;stmt13:
  %49 = bitcast %Stmt* %43 to %union.2
  ret %union.2 %49
}

define %Value* @func497 (%AstValue*, %Type*) {
;stmt0:
  %3 = call %Value* (%AstValue*) @func428 (%AstValue* %0)
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
  %8 = call %Value* (%Value*, %Type*) @func476 (%Value* %3, %Type* %1)
;stmt4:
  %9 = getelementptr inbounds %Value, %Value* %8, i1 0, i32 1
  %10 = load %Type*, %Type** %9
  %11 = getelementptr inbounds %AstValue, %AstValue* %0, i1 0, i32 14
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

define %union.2 @func496 (%AstStmt*) {
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
  %15 = call %Value* (%AstValue*, %Type*) @func497 (%AstValue* %12, %Type* %9)
  br label %select_1_end
select_1_end:
  %16 = phi %Value* [ %14, %select_1_0_ok ], [ %15, %select_1_1 ]
;stmt3:
  %17 = icmp eq %Value* %16, zeroinitializer
  br i1 %17, label %then_0, label %else_0
then_0:
;stmt4:
  %18 = load %Type*, %Type** @typeUnit
  %19 = call i1 (%Type*, %Type*) @func417 (%Type* %9, %Type* %18)
  %20 = xor i1 %19, 1
  br i1 %20, label %then_1, label %else_1
then_1:
;stmt5:
  %21 = bitcast [21 x %Nat8]* @func496_str1 to %Str
  %22 = getelementptr inbounds %AstStmt, %AstStmt* %0, i1 0, i32 12
  %23 = load %TokenInfo*, %TokenInfo** %22
  call void (%Str, %TokenInfo*) @error (%Str %21, %TokenInfo* %23)
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt6:
  %24 = getelementptr inbounds %AstStmt, %AstStmt* %0, i1 0, i32 12
  %25 = load %TokenInfo*, %TokenInfo** %24
  %26 = call %Stmt* (%StmtKind, %TokenInfo*) @func485 (%StmtKind 7, %TokenInfo* %25)
;stmt7:
  %27 = getelementptr inbounds %Stmt, %Stmt* %26, i1 0, i32 1
; index array
  %28 = getelementptr inbounds [2 x %Value*], [2 x %Value*]* %27, i1 0, %Int64 0
  store %Value* %16, %Value** %28, align 8
;stmt8:
  %29 = bitcast %Stmt* %26 to %union.2
  ret %union.2 %29
}

define %union.2 @func498 (%AstStmt*) {
;stmt0:
  %2 = inttoptr %Unit zeroinitializer to %union.2
  ret %union.2 %2
}

define %union.2 @func499 (%AstStmt*) {
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
  %10 = call %Type* (%AstType*) @func393 (%AstType* %9)
;stmt2:
  %11 = call %Str () @func150 ()
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
  call void (%Index*, %Str, %Type*) @func145 (%Index* %17, %Str %6, %Type* %10)
;stmt6:
  %18 = getelementptr inbounds %Assembly, %Assembly* @asm0, i1 0
  %19 = call %Definition* (%Assembly*, %Str, %Type*) @func266 (%Assembly* %18, %Str %11, %Type* %10)
;stmt7:
  %20 = inttoptr %Unit zeroinitializer to %union.2
  ret %union.2 %20
}

define %union.2 @func500 (%AstStmt*) {
;stmt0:
  %2 = load %FuncContext*, %FuncContext** @fctx
  %3 = getelementptr inbounds %FuncContext, %FuncContext* %2, i1 0, i32 3
  %4 = load %Nat32, %Nat32* %3
  %5 = icmp eq %Nat32 %4, 0
  br i1 %5, label %then_0, label %else_0
then_0:
;stmt1:
  %6 = bitcast [34 x %Nat8]* @func500_str1 to %Str
  call void (%Str, %TokenInfo*) @error (%Str %6, %TokenInfo* zeroinitializer)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt2:
  %7 = getelementptr inbounds %AstStmt, %AstStmt* %0, i1 0, i32 12
  %8 = load %TokenInfo*, %TokenInfo** %7
  %9 = call %Stmt* (%StmtKind, %TokenInfo*) @func485 (%StmtKind 8, %TokenInfo* %8)
  %10 = bitcast %Stmt* %9 to %union.2
  ret %union.2 %10
}

define %union.2 @func501 (%AstStmt*) {
;stmt0:
  %2 = load %FuncContext*, %FuncContext** @fctx
  %3 = getelementptr inbounds %FuncContext, %FuncContext* %2, i1 0, i32 3
  %4 = load %Nat32, %Nat32* %3
  %5 = icmp eq %Nat32 %4, 0
  br i1 %5, label %then_0, label %else_0
then_0:
;stmt1:
  %6 = bitcast [34 x %Nat8]* @func501_str1 to %Str
  call void (%Str, %TokenInfo*) @error (%Str %6, %TokenInfo* zeroinitializer)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt2:
  %7 = getelementptr inbounds %AstStmt, %AstStmt* %0, i1 0, i32 12
  %8 = load %TokenInfo*, %TokenInfo** %7
  %9 = call %Stmt* (%StmtKind, %TokenInfo*) @func485 (%StmtKind 9, %TokenInfo* %8)
  %10 = bitcast %Stmt* %9 to %union.2
  ret %union.2 %10
}

define %union.2 @func502 (%AstStmt*) {
;stmt0:
  %2 = getelementptr inbounds %AstStmt, %AstStmt* %0, i1 0, i32 12
  %3 = load %TokenInfo*, %TokenInfo** %2
  %4 = call %Stmt* (%StmtKind, %TokenInfo*) @func485 (%StmtKind 10, %TokenInfo* %3)
;stmt1:
  %5 = getelementptr inbounds %Stmt, %Stmt* %4, i1 0, i32 7
  %6 = getelementptr inbounds %AstStmt, %AstStmt* %0, i1 0, i32 10
  %7 = getelementptr inbounds %AstStmtGoto, %AstStmtGoto* %6, i1 0, i32 0
  %8 = load %AstId*, %AstId** %7
  %9 = getelementptr inbounds %AstId, %AstId* %8, i1 0, i32 0
  %10 = load %Str, %Str* %9
  store %Str %10, %Str* %5, align 8
;stmt2:
  %11 = bitcast %Stmt* %4 to %union.2
  ret %union.2 %11
}

define %union.2 @func503 (%AstStmt*) {
;stmt0:
  %2 = getelementptr inbounds %AstStmt, %AstStmt* %0, i1 0, i32 12
  %3 = load %TokenInfo*, %TokenInfo** %2
  %4 = call %Stmt* (%StmtKind, %TokenInfo*) @func485 (%StmtKind 11, %TokenInfo* %3)
;stmt1:
  %5 = getelementptr inbounds %Stmt, %Stmt* %4, i1 0, i32 7
  %6 = getelementptr inbounds %AstStmt, %AstStmt* %0, i1 0, i32 11
  %7 = getelementptr inbounds %AstStmtLabel, %AstStmtLabel* %6, i1 0, i32 0
  %8 = load %AstId*, %AstId** %7
  %9 = getelementptr inbounds %AstId, %AstId* %8, i1 0, i32 0
  %10 = load %Str, %Str* %9
  store %Str %10, %Str* %5, align 8
;stmt2:
  %11 = bitcast %Stmt* %4 to %union.2
  ret %union.2 %11
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
  call void () @func419 ()
;stmt4:
  call void () @func484 ()
;stmt5:
  %5 = bitcast [4 x %Nat8]* @func505_str1 to %Str
  %6 = call %Int32 (%Str, ...) @printf (%Str %5)
;stmt6:
  %7 = getelementptr inbounds %Assembly, %Assembly* @asm0, i1 0
  %8 = bitcast [7 x %Nat8]* @func505_str2 to %Str
  call void (%Assembly*, %Arch, %Str) @func261 (%Assembly* %7, %Arch 1, %Str %8)
  ret void
}

define void @func508 () {
  ret void
}

define void @func507 (%Unit*, %Unit*, %Nat32, %Node*) {
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
  call void (%AstNodeBindType*) @func510 (%AstNodeBindType* %11)
  br label %select_1_end
select_1_1:
  %12 = icmp eq %AstNodeKind %9, 3
  br i1 %12, label %select_1_1_ok, label %select_1_2
select_1_1_ok:
  %13 = bitcast %Unit* %7 to %AstNodeBindValue*
  call void (%AstNodeBindValue*) @func512 (%AstNodeBindValue* %13)
  br label %select_1_end
select_1_2:
  %14 = icmp eq %AstNodeKind %9, 5
  br i1 %14, label %select_1_2_ok, label %select_1_3
select_1_2_ok:
  %15 = bitcast %Unit* %7 to %AstNodeDeclValue*
  call void (%AstNodeDeclValue*) @func513 (%AstNodeDeclValue* %15)
  br label %select_1_end
select_1_3:
  %16 = icmp eq %AstNodeKind %9, 1
  br i1 %16, label %select_1_3_ok, label %select_1_4
select_1_3_ok:
  %17 = bitcast %Unit* %7 to %AstNodeImport*
  call void (%AstNodeImport*) @func509 (%AstNodeImport* %17)
  br label %select_1_end
select_1_4:
  call void () @func508 ()
  br label %select_1_end
select_1_end:
  ret void
}

define %Assembly* @func506 (%AstModule*) {
;stmt0:
  %2 = getelementptr inbounds %AstModule, %AstModule* %0, i1 0, i32 0
  call void (%List*, %ListForeachHandler, %Unit*) @func64 (%List* %2, %ListForeachHandler @func507, %Unit* zeroinitializer)
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

define void @func509 (%AstNodeImport*) {
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
  %12 = bitcast [3 x %Nat8]* @func509_str1 to %Str
  %13 = call %Str (%Str, %Str) @cat (%Str %3, %Str %12)
;stmt5:
  %14 = call i1 (%Str) @exists (%Str %13)
  br i1 %14, label %then_1, label %else_1
then_1:
;stmt6:
  %15 = call %AstModule* (%Str) @parse (%Str %13)
;stmt7:
  %16 = call %Assembly* (%AstModule*) @func506 (%AstModule* %15)
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
  %20 = bitcast [2 x %Nat8]* @func509_str2 to %Str
  %21 = bitcast [3 x %Nat8]* @func509_str3 to %Str
  %22 = call %Str (%Str, %Str, %Str, %Str) @cat4 (%Str %19, %Str %20, %Str %3, %Str %21)
;stmt11:
  %23 = call i1 (%Str) @exists (%Str %22)
  br i1 %23, label %then_2, label %else_2
then_2:
;stmt12:
  %24 = call %AstModule* (%Str) @parse (%Str %22)
;stmt13:
  %25 = call %Assembly* (%AstModule*) @func506 (%AstModule* %24)
;stmt14:
ret void
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
;stmt15:
  %27 = bitcast [15 x %Nat8]* @func509_str4 to %Str
  %28 = getelementptr inbounds %AstNodeImport, %AstNodeImport* %0, i1 0, i32 1
  %29 = load %TokenInfo*, %TokenInfo** %28
  call void (%Str, %TokenInfo*) @error (%Str %27, %TokenInfo* %29)
  ret void
}

define void @func510 (%AstNodeBindType*) {
;stmt0:
  %2 = getelementptr inbounds %AstNodeBindType, %AstNodeBindType* %0, i1 0, i32 0
  %3 = load %AstId*, %AstId** %2
  %4 = getelementptr inbounds %AstId, %AstId* %3, i1 0, i32 0
  %5 = load %Str, %Str* %4
;stmt1:
  %6 = getelementptr inbounds %AstNodeBindType, %AstNodeBindType* %0, i1 0, i32 1
  %7 = load %AstType*, %AstType** %6
  %8 = call %Type* (%AstType*) @func393 (%AstType* %7)
;stmt2:
  %9 = call %Type* (%Str) @func146 (%Str %5)
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
  %14 = bitcast [18 x %Nat8]* @func510_str1 to %Str
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
  %24 = call %Unit* (%Unit*, %Unit*, %Nat32) @memcpy (%Unit* %22, %Unit* %23, %Nat32 176)
;stmt10:
  %25 = getelementptr inbounds %Assembly, %Assembly* @asm0, i1 0
  %26 = call %Definition* (%Assembly*, %Str, %Type*) @func266 (%Assembly* %25, %Str %5, %Type* %9)
;stmt11:
ret void
  br label %endif_0
else_0:
;stmt12:
  %28 = load %Module*, %Module** @module
  %29 = getelementptr inbounds %Module, %Module* %28, i1 0, i32 0
  call void (%Index*, %Str, %Type*) @func145 (%Index* %29, %Str %5, %Type* %8)
  br label %endif_0
endif_0:
;stmt13:
  %30 = getelementptr inbounds %Assembly, %Assembly* @asm0, i1 0
  %31 = call %Definition* (%Assembly*, %Str, %Type*) @func266 (%Assembly* %30, %Str %5, %Type* %8)
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

define %Value* @func511 (%Value*) {
;stmt0:
  %2 = getelementptr inbounds %Value, %Value* %0, i1 0, i32 1
  %3 = load %Type*, %Type** %2
  %4 = getelementptr inbounds %Type, %Type* %3, i1 0, i32 0
  %5 = load %TypeKind, %TypeKind* %4
  %6 = icmp eq %TypeKind %5, 5
  br i1 %6, label %then_0, label %else_0
then_0:
;stmt1:
  %7 = call %Unit* (%Nat32) @malloc (%Nat32 296)
  %8 = bitcast %Unit* %7 to %Value*
;stmt2:
  %9 = bitcast %Value* %8 to %Unit*
  %10 = bitcast %Value* %0 to %Unit*
  %11 = call %Unit* (%Unit*, %Unit*, %Nat32) @memcpy (%Unit* %9, %Unit* %10, %Nat32 296)
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

define void @func512 (%AstNodeBindValue*) {
;stmt0:
  %2 = getelementptr inbounds %AstNodeBindValue, %AstNodeBindValue* %0, i1 0, i32 0
  %3 = load %AstId*, %AstId** %2
  %4 = getelementptr inbounds %AstId, %AstId* %3, i1 0, i32 0
  %5 = load %Str, %Str* %4
;stmt1:
  %6 = getelementptr inbounds %AstNodeBindValue, %AstNodeBindValue* %0, i1 0, i32 1
  %7 = load %AstValue*, %AstValue** %6
  %8 = call %Value* (%AstValue*, i1) @func429 (%AstValue* %7, i1 0)
;stmt2:
  %9 = call %Value* (%Value*) @func511 (%Value* %8)
;stmt3:
  %10 = call %Value* (%Str) @func138 (%Str %5)
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
  %15 = bitcast [19 x %Nat8]* @func512_str1 to %Str
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
  %21 = call %Unit* (%Unit*, %Unit*, %Nat32) @memcpy (%Unit* %19, %Unit* %20, %Nat32 296)
;stmt9:
ret void
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt10:
  call void (%Str, %Value*) @func144 (%Str %5, %Value* %9)
;stmt11:
  %23 = getelementptr inbounds %Value, %Value* %9, i1 0, i32 1
  %24 = load %Type*, %Type** %23
  %25 = getelementptr inbounds %Type, %Type* %24, i1 0, i32 5
  %26 = getelementptr inbounds %TypeFunc, %TypeFunc* %25, i1 0, i32 2
  %27 = bitcast [7 x %Nat8]* @func512_str2 to %Str
  %28 = call %Int32 (%Str, %Str) @strcmp (%Str %27, %Str %5)
  %29 = icmp eq %Int32 %28, 0
  %30 = bitcast [6 x %Nat8]* @func512_str3 to %Str
  %31 = call %Int32 (%Str, %Str) @strcmp (%Str %30, %Str %5)
  %32 = icmp eq %Int32 %31, 0
  %33 = bitcast [7 x %Nat8]* @func512_str4 to %Str
  %34 = call %Int32 (%Str, %Str) @strcmp (%Str %33, %Str %5)
  %35 = icmp eq %Int32 %34, 0
  %36 = bitcast [8 x %Nat8]* @func512_str5 to %Str
  %37 = call %Int32 (%Str, %Str) @strcmp (%Str %36, %Str %5)
  %38 = icmp eq %Int32 %37, 0
  %39 = bitcast [8 x %Nat8]* @func512_str6 to %Str
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

define void @func514 (%Unit*, %Unit*, %Nat32, %Node*) {
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
  %10 = bitcast [15 x %Nat8]* @func513_func514_str1 to %Str
  %11 = getelementptr inbounds %Type, %Type* %6, i1 0, i32 13
  %12 = load %TokenInfo*, %TokenInfo** %11
  call void (%Str, %TokenInfo*) @error (%Str %10, %TokenInfo* %12)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
;stmt4:
  call void (%AstId*, %Type*) @func515 (%AstId* %5, %Type* %6)
  ret void
}

define void @func513 (%AstNodeDeclValue*) {
;stmt0:
  %2 = getelementptr inbounds %AstNodeDeclValue, %AstNodeDeclValue* %0, i1 0, i32 0
  %3 = load %AstDecl*, %AstDecl** %2
;stmt1:
  %4 = getelementptr inbounds %AstDecl, %AstDecl* %3, i1 0, i32 1
  %5 = load %AstType*, %AstType** %4
  %6 = call %Type* (%AstType*) @func393 (%AstType* %5)
;stmt2:
  %7 = getelementptr inbounds %AstDecl, %AstDecl* %3, i1 0, i32 0
  %8 = bitcast %Type* %6 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @func64 (%List* %7, %ListForeachHandler @func514, %Unit* %8)
  ret void
}

define void @func515 (%AstId*, %Type*) {
;stmt0:
  %3 = getelementptr inbounds %AstId, %AstId* %0, i1 0, i32 1
  %4 = load %TokenInfo*, %TokenInfo** %3
  %5 = call %Value* (%ValueKind, %Type*, %TokenInfo*) @func424 (%ValueKind 2, %Type* %1, %TokenInfo* %4)
;stmt1:
  %6 = getelementptr inbounds %AstId, %AstId* %0, i1 0, i32 0
  %7 = load %Str, %Str* %6
  call void (%Str, %Value*) @func144 (%Str %7, %Value* %5)
  ret void
}

define %Value* @func516 (%Str, %Type*, %Value*, %TokenInfo*) {
;stmt0:
  %5 = call %Value* (%ValueKind, %Type*, %TokenInfo*) @func424 (%ValueKind 5, %Type* %1, %TokenInfo* %3)
;stmt1:
  %6 = getelementptr inbounds %Value, %Value* %5, i1 0, i32 19
  store i1 1, i1* %6, align 1
;stmt2:
  %7 = getelementptr inbounds %Value, %Value* %5, i1 0, i32 4
  %8 = getelementptr inbounds %Assembly, %Assembly* @asm0, i1 0
  %9 = call %Definition* (%Assembly*, %Str, %Type*, %Value*) @func270 (%Assembly* %8, %Str %0, %Type* %1, %Value* %2)
  store %Definition* %9, %Definition** %7, align 8
;stmt3:
  call void (%Str, %Value*) @func144 (%Str %0, %Value* %5)
;stmt4:
  ret %Value* %5
}

define %Stmt* @func518 (%AstId*, %Type*, %Value*, %TokenInfo*) {
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
  %11 = call %Stmt* (%StmtKind, %TokenInfo*) @func485 (%StmtKind 3, %TokenInfo* %3)
;stmt5:
  %12 = getelementptr inbounds %Stmt, %Stmt* %11, i1 0, i32 4
  store %Decl* %6, %Decl** %12, align 8
;stmt6:
  ret %Stmt* %11
}

define void @func519 (%Stmt*) {
;stmt0:
  %2 = load %FuncContext*, %FuncContext** @fctx
  %3 = getelementptr inbounds %FuncContext, %FuncContext* %2, i1 0, i32 2
  %4 = load %Block*, %Block** %3
  %5 = getelementptr inbounds %Block, %Block* %4, i1 0, i32 2
  %6 = bitcast %Stmt* %0 to %Unit*
  %7 = call i1 (%List*, %Unit*) @list_append (%List* %5, %Unit* %6)
  ret void
}

define %Value* @func517 (%AstId*, %Type*, %Value*, %TokenInfo*) {
;stmt0:
  %5 = call %Value* (%ValueKind, %Type*, %TokenInfo*) @func424 (%ValueKind 8, %Type* %1, %TokenInfo* %3)
;stmt1:
  %6 = getelementptr inbounds %AstId, %AstId* %0, i1 0, i32 0
  %7 = load %Str, %Str* %6
  call void (%Str, %Value*) @func143 (%Str %7, %Value* %5)
;stmt2:
  %8 = call %Stmt* (%AstId*, %Type*, %Value*, %TokenInfo*) @func518 (%AstId* %0, %Type* %1, %Value* %2, %TokenInfo* zeroinitializer)
;stmt3:
  call void (%Stmt*) @func519 (%Stmt* %8)
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
  %3 = bitcast [11 x %Nat8]* @func520_str1 to %Str
  %4 = call %Int32 (%Str, ...) @printf (%Str %3, %Int64 0, %Int64 5)
;stmt1:
  %5 = bitcast [7 x %Nat8]* @func520_str2 to %Str
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
  %10 = call %Assembly* (%AstModule*) @func506 (%AstModule* %6)
;stmt7:
  %11 = icmp ne %Assembly* %10, zeroinitializer
  br i1 %11, label %then_1, label %else_1
then_1:
;stmt8:
  %12 = bitcast [11 x %Nat8]* @func520_str3 to %Str
  %13 = load %Nat32, %Nat32* @lines
  %14 = call %Int32 (%Str, ...) @printf (%Str %12, %Nat32 %13)
;stmt9:
  %15 = bitcast [7 x %Nat8]* @func520_str4 to %Str
  call void (%Assembly*, %Str) @func279 (%Assembly* %10, %Str %15)
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
