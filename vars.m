

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



// result assembly
asm0 = unit to Var Assembly


// типы которые нужно будет распечатать в самом начале
// ! перенеси в сборку!
unions = unit to Var List


nocnt = 0 to Var Nat
nocnt2 = 0 to Var Nat  // wtf?


// pointer to current context (!)
cctx = nil to Var *Context


builtinContext = unit to Var Context

module = nil to Var *Module

// current function context attributes
fctx = nil to Var *FuncContext



