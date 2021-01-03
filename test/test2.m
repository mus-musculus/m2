

import "C"


Name = (first, last : Str)
Sex = {#Male, #Female}
Men = (name : Name, age : Nat32, sex : Sex)



print_name = func (n : Name) -> () {
  printf("firstname: %s\n", n.first)
  printf("lastname: %s\n", n.last)
}

print_men = func (men : Men) -> () {
  print_name(men.name)
  printf("age: %u\n", men.age)
  printf("sex: ")
  if men.sex == #Male {
    printf("M")
  } else {
    printf("F")
  }
  printf("\n")
}

print_men_by_ptr = func (men : *Men) -> () {
  print_men(*men)
}


