


mcpy = (dst, src : *Unit, size : Nat) -> () {
  i = 0 to Var Nat
  while i < size {
    (dst to []Nat8)[i] := (src to []Nat8)[i]
    i := i + 1
  }
}



