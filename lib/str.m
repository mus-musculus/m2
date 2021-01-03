// lib/str


import "C"


strTerm = 0


// strlen
slen = (s : Str) -> Nat {
  c = 0 to Var Nat
  while s[c] != strTerm {c := c + 1}
  return c
}


// strcpy
// (copy text + strTerm)
strcp = (dst, src : Str) -> () {
  c = 0 to Var Nat32
  while true {
    dst[c] := src[c]
    c := c + 1
    if src[c] == strTerm {break}
  }
}


str_new = (len : Nat) -> Str {return malloc(len + 1) to Str}


// create copy of string
dup = (s : Str) -> Str {
  len = slen(s)
  new_s = str_new(len)
  strcp(new_s, s)
  return new_s
}


// создает новую строку которая включает содержимое двух переданных
cat = (s1, s2 : Str) -> Str {
  len1 = slen(s1)
  len2 = slen(s2)

  len12 = len1 + len2

  s = str_new(len12)

  strcp(&s[0] to Str, s1)
  strcp(&s[len1] to Str, s2)
  s[len12] := strTerm

  return s
}


// concat three strings to one new
cat3 = (s1, s2, s3 : Str) -> Str {
  len1 = slen(s1)
  len2 = slen(s2)
  len3 = slen(s3)

  len12 = len1 + len2
  len123 = len12 + len3

  s = str_new(len123)

  strcp(&s[0] to Str, s1)
  strcp(&s[len1] to Str, s2)
  strcp(&s[len12] to Str, s3)
  s[len123] := strTerm

  return s
}


// concat four strings to one new
cat4 = (s1, s2, s3, s4 : Str) -> Str {
  len1 = slen(s1)
  len2 = slen(s2)
  len3 = slen(s3)
  len4 = slen(s4)

  len12 = len1 + len2
  len123 = len12 + len3
  len1234 = len123 + len4

  s = str_new(len1234)

  strcp(&s[0] to Str, s1)
  strcp(&s[len1] to Str, s2)
  strcp(&s[len12] to Str, s3)
  strcp(&s[len123] to Str, s4)
  s[len1234] := strTerm

  return s
}


// concat five strings to one new
cat5 = (s1, s2, s3, s4, s5 : Str) -> Str {
  len1 = slen(s1)
  len2 = slen(s2)
  len3 = slen(s3)
  len4 = slen(s4)
  len5 = slen(s5)

  len12 = len1 + len2
  len123 = len12 + len3
  len1234 = len123 + len4
  len12345 = len1234 + len5

  s = str_new(len12345)

  strcp(&s[0] to Str, s1)
  strcp(&s[len1] to Str, s2)
  strcp(&s[len12] to Str, s3)
  strcp(&s[len123] to Str, s4)
  strcp(&s[len1234] to Str, s5)
  s[len12345] := strTerm

  return s
}


