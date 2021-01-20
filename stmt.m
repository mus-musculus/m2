/*****************************************************************************/
/*                              Statement                                    */
/*****************************************************************************/


stmt_new = (kind : StmtKind, ti : *TokenInfo) -> *Stmt {
  s = malloc (sizeof Stmt) to *Stmt
  assert (s != nil, "stmt_new")
  memset (s, 0, sizeof Stmt)
  s.kind := kind
  s.ti := ti
  return s
}


stmt_assign_new = (l, r : *Value, ti : *TokenInfo) -> *Stmt {
  s = stmt_new (#StmtAssign, ti)
  s.a[0] := l
  s.a[1] := r
  return s
}


do_stmt = DoStmt {
  return when x.kind {
    #AstStmtAssign   => do_stmt_assign   (x)
    #AstStmtValueDef => do_stmt_valdef   (x)
    #AstStmtBlock    => do_stmt_block    (x)
    #AstStmtExpr     => do_stmt_expr     (x)
    #AstStmtIf       => do_stmt_if       (x)
    #AstStmtWhile    => do_stmt_while    (x)
    #AstStmtReturn   => do_stmt_return   (x)
    //#AstStmtVarDef   => do_stmt_vardef (x)
    #AstStmtTypeDef  => do_stmt_typedef  (x)
    #AstStmtBreak    => do_stmt_break    (x)
    #AstStmtContinue => do_stmt_continue (x)
    #AstStmtGoto     => do_stmt_goto     (x)
    #AstStmtLabel    => do_stmt_label    (x)
    else => unit
  }
}

/*
есть проблема связанная с lval и rval - раньше я решал ее с помощью #ValueAddress
но! Если композитное значение лежит в регистре то этот подход не работает.
Значит мне придется явно передавать во все функции семейства do_value флаг
lval - означающий что не нужно загружать значение окончательно.
*/
do_stmt_assign = DoStmt {
  rval0 = do_value (x.assign.r)

  if rval0.kind == #ValuePoison {return unit}

  lx = x.assign.l
  lval = when lx.kind {
    #AstValueId => do_value_named      (lx)
    #AstValueDeref => do_value_deref   (lx)
    #AstValueIndex => do_value_index   (lx)
    #AstValueAccess => do_value_access (lx)
    else => nil
  }

  if lval == nil {
    error ("expected lvalue", lx.ti)
    return unit
  }

  if value_is_readonly (lval) {
    error ("invalid lval", x.assign.ti)
    return unit
  }

  if lx.kind != #AstValueAccess and
     lx.kind != #AstValueIndex and
     lx.kind != #AstValueDeref
  {
    /*if lval.type.kind != #TypeVar {
      //warning("expected var", x.ti)
    }*/
  }

  ltype = when lval.type.kind {
    #TypeVar => lval.type.var.of
    else => lval.type
  }

  rval = implicit_cast (rval0, ltype)

  if not type_check (ltype, rval.type, x.assign.ti) {
    return unit
  }

  return stmt_assign_new (lval, rval, x.assign.ti)
}


do_stmt_valdef = DoStmt {
  id = x.valdef.id
  v = do_valuex (x.valdef.expr, false)

  // Local
  // важно чтобы undef переменные попадали сюда так как иначе
  // происходит просто связывание id с переменной а не с ее значением по месту
  // это слабое место, Саня, придумай как переделать let
  if v.type.kind != #TypeVar {
    k = v.kind
    if k != #ValueGlobalConst and
       k != #ValueImmediate or
       k == #ValueUndefined {

      v0 = value_new (#ValueLocalConst, v.type, x.valdef.ti)
      bind_value_local (id.str, v0)

      se = stmt_new (#StmtExpr, x.valdef.ti)
      se.e.v := dold (v)
      v0.expr := &se.e
      return se
    }
  }

  bind_value_in_block (fctx.cblock, id.str, v)
  return unit
}


stmt_block_new = (b, parent : *Block) -> *Block {
  //b = malloc(sizeof Block) to *Block
  //assert(b != nil, "stmt_block_new : b != nil")
  memset (b, 0, sizeof Block)

  b.parent := parent

  index_init (&b.index)
  list_init (&b.stmts)
  list_init (&b.local_funcs)

  return b
}


do_stmt_block = DoStmt {
  s = stmt_new (#StmtBlock, x.block.ti)

  b = stmt_block_new (&s.b, fctx.cblock)

  fctx.cblock := b

  hstmt = ListForeachHandler {
    ast_stmt = data to *AstStmt
    stmt = do_stmt (ast_stmt)
    // just skip broken statements
    if stmt is Unit {return}
    stmts = ctx to *List
    list_append (stmts, stmt as *Stmt)
  }
  list_foreach (&x.block.stmts, hstmt, &b.stmts)

  fctx.cblock := b.parent  // restore old cblock value

  return s
}


do_stmt_expr = DoStmt {
  v = do_value (x.expr.expr)

  if v.kind == #ValuePoison {return unit}

  if not type_eq (v.type, typeUnit) {
    //warning("ignoring value", x.ti)
  }

  s = stmt_new (#StmtExpr, x.expr.ti)
  s.e.v := v
  return s
}


do_stmt_if = DoStmt {
  cond = do_value (x.if.cond)
  then = do_stmt (x.if.then)

  _else = unit to Var *Stmt or Unit

  if not (x.if.else is Unit) {
    els = do_stmt (x.if.else as *AstStmt)
    if not (els is Unit) {
      _else := els as *Stmt
    }
  }

//  _else = when x.if._else {
//    nil => nil to *Stmt
//    else => do_stmt (x.if._else)
//  }

  if cond.kind == #ValuePoison {return unit}

  if not type_check (typeBool, cond.type, cond.ti) {
    return unit
  }

  if then is Unit {return unit}

  s = stmt_new (#StmtIf, x.if.ti)
  s.i.cond := cond
  s.i.then := then as *Stmt
  s.i.else := _else
  return s
}


do_stmt_while = DoStmt {
  cond = do_value (x.while.cond)

  fctx.loop := fctx.loop + 1
  block = do_stmt (x.while.block)
  fctx.loop := fctx.loop - 1

  if cond.kind == #ValuePoison {return unit}

  if not type_check (typeBool, cond.type, cond.ti) {
    return unit
  }

  if block is Unit {return unit}

  s = stmt_new (#StmtWhile, x.while.ti)
  s.w.cond := cond
  s.w.stmt := block as *Stmt
  return s
}


do_stmt_return = DoStmt {
  func_to = fctx.cfunc.type.func.to
  rv = x.return.value

  retval = when rv {
    nil => nil to *Value

    else => (rv : *AstValue, ft : *Type) -> *Value {
      v0 = do_value (rv)
      if v0.kind == #ValuePoison {return nil}
      v = implicit_cast (v0, ft)
      if not type_check (ft, v.type, rv.ti) {}
      return v
    } (rv, func_to)
  }

  // missing return value
  if retval == nil {
    if not type_eq (func_to, typeUnit) {
      error("missing return value", x.return.ti)
    }
  }

  s = stmt_new (#StmtReturn, x.return.ti)
  s.a[0] := retval
  return s
}


do_stmt_vardef = DoStmt {
  /*type = do_type(x.vardef.type)
  ti = x.vardef.ti
  add_var = ListForeachHandler {
    ast_id = data to *AstId
    type = ctx to *Type
    create_local_var(ast_id, type, nil, ast_id.ti)
  }
  list_foreach(&x.vardef.ids, add_var, type)
  */
  return unit
}


do_stmt_typedef = DoStmt {
  id = x.typedef.id.str
  _type = do_type (x.typedef.type)

  uid = get_suid_type_local ()
  if _type.aka == nil {_type.aka := uid}

//  // bind type in local index
//  bind_type(&cblock.index, id, _type)

  // in GLOBAL index (временно тк не могу скомпилить сам себя, изза этого)
  bind_type (&module.private, id, _type)
  // creating data for printer
  asmTypedefAdd (&asm0, uid, _type)

  return unit
}


do_stmt_break = DoStmt {
  if fctx.loop == 0 {error ("`break` outside any loop operator", nil)}
  return stmt_new (#StmtBreak, x.break.ti)
}


do_stmt_continue = DoStmt {
  if fctx.loop == 0 {error ("`break` outside any loop operator", nil)}
  return stmt_new (#StmtContinue, x.continue.ti)
}


do_stmt_goto = DoStmt {
  s = stmt_new (#StmtGoto, x.goto.ti)
  s.l := x.goto.label.str
  return s
}


do_stmt_label = DoStmt {
  s = stmt_new (#StmtLabel, x.label.ti)
  s.l := x.label.label.str
  return s
}


