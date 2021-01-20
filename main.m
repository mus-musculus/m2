/*
 * load в do_value
 * пофикси вывод ошибки когда указывает не на упоминание а на связывание
 * Если указано Var значит переменная, если не указан Var - не факт что не переменная.
 * Это для типов аргументов функции
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
import "scanner"
import "parser"
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

  /* если первым параметром не передано имя файла, то это main.m */
  /*fname = "main.m" to Var Str
  if argc > 1 {fname := argv[1]}*/

  /*printf ("sizeof Token %d\n", sizeof Token)
  printf ("sizeof AstValue %d\n", sizeof AstValue)
  printf ("sizeof Type %d\n", sizeof Type)*/
  printf ("sizeof Stmt %d\n", sizeof Stmt)
  printf ("sizeof Stmt2 %d\n", sizeof Stmt2)


  iff = 0 to Var StmtIf
  va = iff to Var Stmt2

  m = parse ("main.m")

  ee = errcnt

  if ee > 0 {return ee/* to Int32*/}

  compiler_init ()

  a = compile (m)

  if a != nil {
    printf ("lines: %d\n", lines)
    print_assembly (a, "out.ll")
  }

  eee = errcnt
  return eee/* to Int32*/
}


