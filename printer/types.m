/*****************************************************************************/
/*                             Assembly                                      */
/*****************************************************************************/


DefinitionKind = {#DefType, #DefConst, #DefStr, #DefArray, #DefFunc, #DefVar, #DefAlias}


DefType  = (id : Str, type : *Type)
DefConst = (id : Str, type : *Type, value : *Value)
DefStr   = (id : Str, type : *Type, data : Str, len : Nat)
DefArray = (id : Str, type : *Type, len : Nat, values : *List)
DefFunc  = (id : Str, type : *Type, block : MaybeBlock)
DefVar   = (id : Str, type : *Type, init_value : *Value)
DefAlias = (id : Str, type : *Type, org : Str)

/*Definition2 = DefType or
             DefConst or
             DefStr or
             DefArray or
             DefFunc or
             DefVar or
             DefAlias*/


Definition = (
  kind : DefinitionKind

  stringdef : DefStr
  typedef   : DefType
  constdef  : DefConst
  arraydef  : DefArray
  funcdef   : DefFunc
  vardef    : DefVar
  aliasdef  : DefAlias
)



Assembly = (
  name : Str

  datalayout,
  triple : Str  // for LLVM (stub)

  // sections
  types,        // of *DefType
  aliases,      // od *DefAlias
  arrays,       // of *DefArray
  strings,      // of *DefStr
  vars,         // of *DefVar
  funcs : List  // of *DefFunc
)



/*****************************************************************************/
/*                                LLVM                                       */
/*****************************************************************************/


Arch = {#Arch_Unknown, #Arch-x64, #Arch-ARM-CM3}


