/*
 * load в do_value
 * пофикси вывод ошибки когда указывает не на упоминание а на связывание
 * Если указано Var значит переменная, если не указан Var - не факт что не переменная.
 * Это для типов аргументов функции
 * Конструирование и связывание
 */


import "C"
import "assert"
import "ascii"
import "str"
import "data/node"
import "data/list"
import "data/map"
import "sys/fs"

import "types"
import "proto"
import "vars"

import "debug"
import "error"
import "cfg"
import "data"
import "scanner/main"
import "parser/main"
import "printer"

import "type"
import "value"
import "stmt"
import "cpl"



// not_null реши что там за херня??!!

compilerVersionMajor = 0
compilerVersionMinor = 5



main = (argc : Nat, argv : []Str) -> Int32 {
  printf ("m2 v%d.%d\n", compilerVersionMajor, compilerVersionMinor)

  m = parse ("main.m")

  if m is ParserError {return errcnt}

  compiler_init ()

  a = compile (m as AstModule)

  if a != nil {
    printf ("lines: %d\n", lines)
    print_assembly (a, "out.ll")
  }

  return errcnt
}


