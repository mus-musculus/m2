

lines = 0 to Var Nat  // счетчик количества отсканированных строк за всю компиляцию

typeVoid = nil to Var *Type
typeUnit = nil to Var *Type
typeBool = nil to Var *Type
typeChar = nil to Var *Type
typeStr = nil to Var *Type

typeBaseInt = nil to Var *Type
typeFreePtr = nil to Var *Type
typeNumeric = nil to Var *Type


unsafe = false to Var Bool

// used only for "Self" type
ctype = nil to Var *Type

// current function context attributes
fctx = nil to Var *FuncContext

// result assembly
asm0 = 0 to Var Assembly


// типы которые нужно будет распечатать в самом начале
// ! перенеси в сборку!
unions = 0 to Var List


nocnt = 0 to Var Nat
nocnt2 = 0 to Var Nat  // wtf?


