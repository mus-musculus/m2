; assembly: <name>

; clang out2.ll && ./a.out
; llc out2.ll ; for create .s file from .ll
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"target triple = "x86_64-apple-macosx10.15.0"

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
%Point = type {%Nat32, %Nat32}
%Rx = type %Int16

;strings:

@func29_str1 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@func29_str2 = private unnamed_addr constant [2 x i8] c"K\00", align 1
@func29_str3 = private unnamed_addr constant [2 x i8] c"B\00", align 1
@func29_str4 = private unnamed_addr constant [6 x i8] c"> %s\0A\00", align 1

;arrays:


;vars:

@gv = global %Point* zeroinitializer

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

define %Int32 @main () {
;stmt0:
  br label %select_1_0
select_1_0:
  %1 = icmp eq %Rx 0, 0
  br i1 %1, label %select_1_0_ok, label %select_1_1
select_1_0_ok:
  br label %select_2_0
select_2_0:
  %2 = icmp eq i1 1, 1
  br i1 %2, label %select_2_0_ok, label %select_2_1
select_2_0_ok:
  %3 = bitcast [2 x %Nat8]* @func29_str1 to %Str
  br label %select_2_end
select_2_1:
  %4 = bitcast [2 x %Nat8]* @func29_str2 to %Str
  br label %select_2_end
select_2_end:
  %5 = phi %Str [ %3, %select_2_0_ok ], [ %4, %select_2_1 ]
  br label %select_1_end
select_1_1:
  %6 = bitcast [2 x %Nat8]* @func29_str3 to %Str
  br label %select_1_end
select_1_end:
  %7 = phi %Str [ %5, %select_2_end ], [ %6, %select_1_1 ]
;stmt1:
  %8 = bitcast [6 x %Nat8]* @func29_str4 to %Str
  %9 = call %Int32 (%Str, ...) @printf (%Str %8, %Str %7)
;stmt2:
  ret %Int32 0
}

;aliases:


;metadata:
