// lib/assert


import "C"


assert = (cond : Bool, text : Str) -> () {
  if not cond {
    printf("assert failed: %s\n", text)
    exit(1)
  }
}


