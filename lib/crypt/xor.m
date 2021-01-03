
import "C"

xor_encrypter = (buf : Str, buflen : Nat, key : Str, keylen : Nat) -> () {
  i = 0 to Var Nat
  j = 0 to Var Nat
  while i < buflen {
    if j == keylen {j := 0}
    buf[i] := buf[i] xor key[j]
    i := i + 1
    j := j + 1
  }
}

xor_encrypt = xor_encrypter
xor_decrypt = xor_encrypter

