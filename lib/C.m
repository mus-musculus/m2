// lib/C


Int    = Int32
Off_T  = Int64
Nat    = Nat32
Size_T = Nat


FILE = ()


extern malloc : (size : Nat32) -> *Unit
extern memset : (mem : *Unit, c : Nat8, n : Size_T) -> *Unit
extern memcpy : (dst, src : *Unit, len : Size_T) -> *Unit
extern memcmp : (ptr1, ptr2 : *Unit, num : Size_T) -> Int
extern free   : (mem : *Unit) -> ()

extern putchar : (char : Int8) -> Int32

extern strcmp  : (s1, s2 : Str) -> Int
extern strncmp : (s1, s2 : Str, n : Size_T) -> Int
extern strcpy  : (dst, src : Str) -> *Nat8
extern strlen  : (s : Str) -> Size_T


c_SEEK_SET = 0
c_SEEK_CUR = 1
c_SEEK_END = 2


/*
 * На самом деле этот модуль создавался ради этой функции
 */
arghack extern printf  : (s : Str) -> Int32
arghack extern scanf   : (format : Str) -> Int

arghack extern sscanf  : (buf : *Unit, format : Str) -> Int
arghack extern sprintf : (buf : *Unit, format : Str) -> Int

extern chdir  : (dir : Str) -> Int

extern fopen  : (fname : Str, mode : Str) -> *FILE
arghack extern fprintf : (stream : *FILE, format : Str) -> Int
extern fseek  : (stream : *FILE, offset : Int64, whence : Int) -> Int
extern fclose : (fp : *FILE) -> Int



c_O_RDONLY = 0x0000  // open for reading only
c_O_WRONLY = 0x0001  // open for writing only
c_O_RDWR   = 0x0002  // open for reading and writing


extern open  : (path : Str, oflags : Int) -> Int
extern read, write : (handle : Int, buf : *Nat8, len : Nat32) -> Int
extern lseek : (fd : Int, offset : Off_T, whence : Int) -> Off_T
extern close : (fd : Int) -> Int
extern exit  : (rc : Int) -> ()


DIR = ()


extern opendir  : (name : Str) -> *DIR
extern closedir : (dirp : *DIR) -> Int

extern getcwd : (buf : Str, size : Size_T) -> Str

extern getenv : (name : Str) -> Str


