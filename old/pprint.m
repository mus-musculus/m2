// ast/print


import "lib/C"
import "lib/data/list"

import "types"


indentStr = "  "


var indent : Nat

right = func () -> () {indent = indent + 1}
left = func () -> () {indent = indent - 1}

print_indent = func () -> () {
  var i : Nat
  i := 0
  while i < indent {
    printf("%s", indentStr)
    i := i + 1
  }
}

ast_print_id = func (id : *AstId) -> () {printf("%s", id.str)}

ast_print_module = func (a : *AstModule) -> () {
  printf("@@\n")

  print_node = func ListForeachHandler {
    ast_node = data to *AstNode

    printf("\n")
    if ast_node.kind == #AstNodeDeclVar {
      ast_print_stmt_vardef((ast_node.entity to *AstNodeDeclVar).decl)
    } else if ast_node.kind == #AstNodeBindType {
      ast_bind_type = ast_node.entity to *AstNodeBindType
      ast_print_id(ast_bind_type.id)
      printf(" = ")
      ast_print_type(ast_bind_type.type)
    } else if ast_node.kind == #AstNodeBindValue {
      ast_bind_value = ast_node.entity to *AstNodeBindValue
      ast_print_id(ast_bind_value.id)
      printf(" = ")
      ast_print_value(ast_bind_value.value)
    }
    //}
  }
  list_foreach(&a.nodes, print_node, nil)
  printf("\n")
}


/*ast_print_import = func (imp : *AstImport) -> () {
  printf("import \"%s\"", imp.string.str)
  if imp.name != nil {printf(" as %s", imp.name)}
  printf("\n")
}*/


/*
ast_print_bind = func (b : *AstBind) -> () {
  printf("%s = ", b.id)
  if b.kind == #AstBindName {
    ast_print_name(&b.name)
  } else if b.kind == #AstNodeBindValue {
    ast_print_value(b.value)
  } else if b.kind == #AstNodeBindType {
    ast_print_type(b.type)
  }

  printf("\n")
}
*/


ast_print_name = func (x : *AstName) -> () {
  if x.namespace != nil {
    printf("%s.%s", x.namespace.str, x.id.str)
  } else {
    printf("%s", x.id.str)
  }
}


ast_print_type = func (t : *AstType) -> () {
  k = t.kind
  if k == #AstTypeNamed {
    ast_print_name(&t.name)
  } else if k == #AstTypeFunc {
    ast_print_type_func(&t.func)
  } else if k == #AstTypeArrayU {
    ast_print_type_array_u(&t.array_u)
  } else if k == #AstTypeArray {
    ast_print_type_array(&t.array)
  } else if k == #AstTypePointer {
    ast_print_type_pointer(&t.pointer)
  } else if k == #AstTypeEnum {
    ast_print_type_enum(&t.enum)
  } else if k == #AstTypeRecord {
    ast_print_type_record(&t.record)
  } else if k == #AstTypeUnknown {
    printf("<AstTypeUnknown>")
  }
}


ast_print_type_array = func (t : *AstTypeArray) -> () {
  printf("["); ast_print_value(t.size); printf("]"); ast_print_type(t.of)
}

ast_print_type_array_u = func (t : *AstTypeArrayU) -> () {
  printf("[]"); ast_print_type(t.of)
}

ast_print_type_func = func (t : *AstTypeFunc) -> () {
  ast_print_type(t.from); printf(" -> "); ast_print_type(t.to)
}

ast_print_type_pointer = func (t : *AstTypePointer) -> () {
  printf("*"); ast_print_type(t.to)
}

ast_print_type_enum = func (t : *AstTypeEnum) -> () {
  printf("{")
  print_cons = func ListForeachHandler {
    if index > 0 {printf(", ")}
    cons = data to *AstId
    printf("%s", cons.str)
  }
  list_foreach(&t.constructors, print_cons, nil)
  printf("}")
}

ast_print_type_record = func (t : *AstTypeRecord) -> () {
  printf("(")
  print_field = func ListForeachHandler {
    entry = data to *AstDecl
    if index > 0 {printf(", ")}
    ast_print_decl(entry)
  }
  list_foreach(&t.decls, print_field, nil)
  printf(")")
}



ast_print_value = func (e : *AstValue) -> () {

  print_prefix = func (e : *AstValue, op : Str) -> () {
    printf("%s", op); ast_print_value(e.operand[0])
  }

  print_infix = func (e : *AstValue, op : Str) -> () {
    ast_print_value(e.operand[0]); printf(" %s ", op); ast_print_value(e.operand[1])
  }

  k = e.kind

  if k == #AstValueInvalid {
    printf("<AstValueInvalid>")
  } else if k == #AstValueId {
    printf("%s", e.name.id.str)
  } else if k == #AstValueNum {
    printf("%s", e.str)
  } else if k == #AstValueStr {
    printf("\"%s\"", e.str)
  } else if k == #AstValueFunc {
    ast_print_func(&e.func)
  } else if k == #AstValueArr {
    printf("<AstValueArr>")
  } else if k == #AstValueRec {
    printf("<AstValueRec>")
  } else if k == #AstValueRef {
    print_prefix(e, "&")
  } else if k == #AstValueDeref {
    print_prefix(e, "*")
  } else if k == #AstValueNot {
    print_prefix(e, "not ")
  } else if k == #AstValueMinus {
    print_prefix(e, "-")
  } else if k == #AstValueAdd {
    print_infix(e, "+")
  } else if k == #AstValueSub {
    print_infix(e, "-")
  } else if k == #AstValueMul {
    print_infix(e, "*")
  } else if k == #AstValueDiv {
    print_infix(e, "/")
  } else if k == #AstValueMod {
    print_infix(e, "%")
  } else if k == #AstValueAnd {
    print_infix(e, "and")
  } else if k == #AstValueXor {
    print_infix(e, "xor")
  } else if k == #AstValueOr {
    print_infix(e, "or")
  } else if k == #AstValueLt {
    print_infix(e, "<")
  } else if k == #AstValueGt {
    print_infix(e, ">")
  } else if k == #AstValueLe {
    print_infix(e, "<=")
  } else if k == #AstValueGe {
    print_infix(e, ">=")
  } else if k == #AstValueEq {
    print_infix(e, "==")
  } else if k == #AstValueNe {
    print_infix(e, "!=")
  } else if k == #AstValueShl {
    print_infix(e, "<<")
  } else if k == #AstValueShr {
    print_infix(e, ">>")
  } else if k == #AstValueCall {
    ast_print_value(e.call.func)
    printf("(")
    print_argument = func ListForeachHandler {
      arg = data to *AstValue
      if index > 0 {printf(", ")}
      ast_print_value(arg)
    }
    list_foreach(&e.call.args, print_argument, nil)
    printf(")")
  } else if k == #AstValueIndex {
    ast_print_value(e.index.array); printf("["); ast_print_value(e.index.index); printf("]")
  } else if k == #AstValueAccess {
    ast_print_value(e.access.rec); printf(".%s", e.access.field_id.str)
  } else if k == #AstValueCast {
    ast_print_value(e.cast.value); printf(" to "); ast_print_type(e.cast.type)
  } else if k == #AstValueSizeof {
    printf("sizeof "); ast_print_type(e.of_type)
  } else if k == #AstValueAlignof {
    printf("alignof "); ast_print_type(e.of_type)
  } else {
    printf("<ast_print_value>")
  }
}


PrintMode = {#General, #Inline}

ast_print_func = func (f : *AstValueFunc) -> () {
  m = #General
  printf("func "); ast_print_type(f.type); printf(" "); ast_print_stmt(f.block_stmt, m)
}


ast_print_stmt = func (s : *AstStmt, m : PrintMode) -> () {
  k = s.kind

  if m == #General and k != #AstStmtBlock {printf("\n"); print_indent()}

  if k == #AstStmtAssign {
    ast_print_stmt_assign(&s.assign)
  } else if k == #AstStmtValueDef {
    ast_print_stmt_valdef(&s.valdef)
  } else if k == #AstStmtBlock {
    ast_print_stmt_block(&s.block, m)
  } else if k == #AstStmtExpr {
    ast_print_stmt_value(&s.expr)
  } else if k == #AstStmtIf {
    ast_print_stmt_if(&s.if)
  } else if k == #AstStmtWhile {
    ast_print_stmt_while(&s.while)
  } else if k == #AstStmtReturn {
    ast_print_stmt_return(&s.return)
  //} else if k == #AstStmtVarDef {
  //  ast_print_stmt_vardef(&s.vardef)
  } else if k == #AstStmtTypeDef {
    ast_print_stmt_typedef(&s.typedef)
  } else if k == #AstStmtBreak {
    ast_print_stmt_break(s)
  } else if k == #AstStmtContinue {
    ast_print_stmt_continue(s)
  } else if k == #AstStmtGoto {
    ast_print_stmt_goto(&s.goto)
  } else if k == #AstStmtLabel {
    ast_print_stmt_label(&s.label)
  } else if k == #AstStmtUnknown {
    printf("<AstStmtUnknown>")
  }
}

ast_print_stmt_block = func (x : *AstStmtBlock, m : PrintMode) -> () {
  printf("{")
  right()
  print_stmt = func ListForeachHandler {
    s = data to *AstStmt
    ast_print_stmt(s, #General)
  }
  list_foreach(&x.stmts, print_stmt, nil)
  left()
  if m == #General {printf("\n"); print_indent();}
  printf("}")
}

ast_print_stmt_assign = func (x : *AstStmtAssign) -> () {
  ast_print_value(x.l); printf(" = "); ast_print_value(x.r)}

ast_print_stmt_valdef = func (x : *AstStmtValueDef) -> () {
  printf("%s = ", x.id); ast_print_value(x.expr)}

ast_print_stmt_value = func (x : *AstStmtExpr) -> () {ast_print_value(x.expr);}

ast_print_stmt_if = func (x : *AstStmtIf) -> () {
  printf("if "); ast_print_value(x.cond); printf(" "); ast_print_stmt(x.then, #General);
  if x._else != nil {printf(" else "); ast_print_stmt(x._else, #General);}}

ast_print_stmt_while = func (x : *AstStmtWhile) -> () {
  printf("while "); ast_print_value(x.cond); printf(" "); ast_print_stmt(x.block, #General)}

ast_print_stmt_return = func (x : *AstStmtReturn) -> () {
  printf("return "); if x.value != nil {ast_print_value(x.value)}}

ast_print_stmt_vardef = func (x : *AstDecl) -> () {
  printf("var "); ast_print_decl(x)}

ast_print_stmt_typedef = func (x : *AstStmtTypeDef) -> () {
  printf("type %s = ", x.id); ast_print_type(x.type)}

ast_print_stmt_break = func (x : *AstStmt) -> () {printf("break")}
ast_print_stmt_continue = func (x : *AstStmt) -> () {printf("continue")}
ast_print_stmt_goto = func (x : *AstStmtGoto) -> () {printf("goto %s", x.label)}
ast_print_stmt_label = func (x : *AstStmtLabel) -> () {printf("%s:", x.label)}

ast_print_decl = func (x : *AstDecl) -> () {
  print_id = func ListForeachHandler {
    id =  data to *AstId
    if index > 0 {printf(", ")}
    ast_print_id(id)
  }
  list_foreach(&x.ids, print_id, nil)
  printf(" : ")
  ast_print_type(x.type)
}

