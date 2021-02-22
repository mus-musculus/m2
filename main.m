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
import "nothing"

import "index"
import "types"
import "scanner/types"
import "parser/types"
import "type/types"
import "value/types"
import "stmt/types"
import "printer/types"

import "proto"
import "vars"

import "debug"
import "error"
import "cfg"
import "data"


import "ctx"
import "scanner/scanner"
import "parser/parser"
import "printer/printer"

import "type/type"
import "value/value"
import "stmt/stmt"
import "cpl"


compilerVersionMajor = 0
compilerVersionMinor = 5


arr = array [1, 2]

main = (argc : Nat, argv : []Str) -> Int32 {
  printf ("m2 v%d.%d\n", compilerVersionMajor, compilerVersionMinor)

  printf("arr:0 = %d\n", arr[0])
  printf("arr:1 = %d\n", arr[1])

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


