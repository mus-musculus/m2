// lib/sys/path


import "C"


// возвращает длину части пути предшествующей последнему /, плюс его позиция
// "/" -> 1
// "/usr/alex" -> 5
// "" -> 0
prepart = (path : Str) -> Nat {
  len = 0 to Var Nat
  c = 0 to Var Nat
  while path[c] != 0 {
    if path[c] == "/"[0] {len := c + 1}
    c := c + 1
  }
  return len
}


// получает путь к файлу, возвращает новую строку с его директорией
// "/usr/alex/home/p/m2/main.m" -> "/usr/alex/home/p/m2"
// "/usr" -> "/"
getprefix = (path : Str) -> Str {
  pre = prepart(path)
  s = malloc(pre + 1) to Str
  memcpy(s to *Unit, path to *Unit, pre)
  s[pre] := 0
  return s
}


// получает путь к файлу, возвращает новую строку с последним именем в пути
// "/usr/alex/home/p/m2/main.m" -> "main.m"
// "/usr/alex/home/p/m2/lib" -> "lib"
get_last = (path : Str) -> Str {
  pre = prepart(path)
  len0 = strlen(path) - pre
  str = malloc(len0 + 1) to Str
  memcpy(str to *Unit, &path[pre] to *Unit, len0)
  str[len0] := 0
  return str
}


