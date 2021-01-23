/*****************************************************************************/
/*                              Statement                                    */
/*****************************************************************************/


stmt_new = (kind : StmtKind, ti : *TokenInfo) -> *Stmt {
  s = malloc (sizeof Stmt) to *Stmt
  assert (s != nil, "stmt_new")
  *s := (kind=kind, ti=ti)
  return s
}


exist do_stmt_assign   : (x : *AstStmtAssign) -> *Stmt or Unit
exist do_stmt_valdef   : (x : *AstStmtValueDef) -> *Stmt or Unit
exist do_stmt_block    : (x : *AstStmtBlock) -> *Stmt or Unit
exist do_stmt_expr     : (x : *AstStmtExpr) -> *Stmt or Unit
exist do_stmt_if       : (x : *AstStmtIf) -> *Stmt or Unit
exist do_stmt_while    : (x : *AstStmtWhile) -> *Stmt or Unit
exist do_stmt_return   : (x : *AstStmtReturn) -> *Stmt or Unit
exist do_stmt_typedef  : (x : *AstStmtTypeDef) -> *Stmt or Unit
exist do_stmt_break    : (x : *AstStmtBreak) -> *Stmt or Unit
exist do_stmt_continue : (x : *AstStmtContinue) -> *Stmt or Unit
exist do_stmt_goto     : (x : *AstStmtGoto) -> *Stmt or Unit
exist do_stmt_label    : (x : *AstStmtLabel) -> *Stmt or Unit


do_stmt = DoStmt {
  return when x.kind {
    #AstStmtAssign   => do_stmt_assign   (&x.assign)
    #AstStmtValueDef => do_stmt_valdef   (&x.valdef)
    #AstStmtBlock    => do_stmt_block    (&x.block)
    #AstStmtExpr     => do_stmt_expr     (&x.expr)
    #AstStmtIf       => do_stmt_if       (&x.if)
    #AstStmtWhile    => do_stmt_while    (&x.while)
    #AstStmtReturn   => do_stmt_return   (&x.return)
    #AstStmtTypeDef  => do_stmt_typedef  (&x.typedef)
    #AstStmtBreak    => do_stmt_break    (&x.break)
    #AstStmtContinue => do_stmt_continue (&x.continue)
    #AstStmtGoto     => do_stmt_goto     (&x.goto)
    #AstStmtLabel    => do_stmt_label    (&x.label)
    //#AstStmtVarDef => do_stmt_vardef (x)
    else => unit
  }
}

/*
есть проблема связанная с lval и rval - раньше я решал ее с помощью #ValueAddress
но! Если композитное значение лежит в регистре то этот подход не работает.
Значит мне придется явно передавать во все функции семейства do_value флаг
lval - означающий что не нужно загружать значение окончательно.
*/
do_stmt_assign = (x : *AstStmtAssign) -> *Stmt or Unit {
  rval0 = do_value (x.r)

  if rval0.kind == #ValuePoison {return unit}

  lx = x.l
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
    error ("invalid lval", x.ti)
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

  if not type_check (ltype, rval.type, x.ti) {
    return unit
  }

  s = stmt_new (#StmtAssign, x.ti)
  s.assign := (l=lval, r=rval, ti=x.ti)
  return s
}

// РАЗБЕРИСЬ НАКОНЕЦ ЧТО ТУТ ВОБЩЕ ПРОИСХОДИТ!! (НИХЕРА НЕ ПОНЯТНО!!)
do_stmt_valdef = (x : *AstStmtValueDef) -> *Stmt or Unit {
  id = x.id
  v = do_valuex (x.expr, false)

  // пока так
  if v.kind == #ValueGenericRecord {
    // дженерики просто заносятся в индекс но не печатаются принтером
    bind_value_in_block (fctx.cblock, id.str, v)
    return unit
  }

  // Local
  // важно чтобы undef переменные попадали сюда так как иначе
  // происходит просто связывание id с переменной а не с ее значением по месту
  // это слабое место, Саня, придумай как переделать let
  if v.type.kind != #TypeVar {
    k = v.kind
    if k != #ValueGlobalConst and
       k != #ValueImmediate or
       k == #ValueUndefined {

      v0 = value_new (#ValueLocalConst, v.type, x.ti)
      bind_value_local (id.str, v0)

      se = stmt_new (#StmtExpr, x.ti)
      se.expr.v := dold (v)
      v0.expr := &se.expr
      return se
    }
  }

  //printf("F= "); value_print_kind(v.kind); printf("\n");

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


do_stmt_block = (x : *AstStmtBlock) -> *Stmt or Unit {
  s = stmt_new (#StmtBlock, x.ti)

  b = stmt_block_new (&s.block, fctx.cblock)

  fctx.cblock := b

  hstmt = ListForeachHandler {
    ast_stmt = data to *AstStmt
    stmt = do_stmt (ast_stmt)
    // just skip broken statements
    if stmt is Unit {return}
    stmts = ctx to *List
    list_append (stmts, stmt as *Stmt)
  }
  list_foreach (&x.stmts, hstmt, &b.stmts)

  fctx.cblock := b.parent  // restore old cblock value

  return s
}


do_stmt_expr = (x : *AstStmtExpr) -> *Stmt or Unit {
  v = do_value (x.expr)

  if v.kind == #ValuePoison {return unit}

  if not type_eq (v.type, typeUnit) {
    //warning("ignoring value", x.ti)
  }

  s = stmt_new (#StmtExpr, x.ti)
  s.expr := (v=v)
  return s
}


do_stmt_if = (x : *AstStmtIf) -> *Stmt or Unit {
  cond = do_value (x.cond)
  then = do_stmt (x.then)

  _else = unit to Var *Stmt or Unit

  if not (x.else is Unit) {
    els = do_stmt (x.else as *AstStmt)
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

  s = stmt_new (#StmtIf, x.ti)
  s.if := (cond=cond, then=then as *Stmt, else=_else)
  return s
}


do_stmt_while = (x : *AstStmtWhile) -> *Stmt or Unit {
  cond = do_value (x.cond)

  fctx.loop := fctx.loop + 1
  block = do_stmt (x.block)
  fctx.loop := fctx.loop - 1

  if cond.kind == #ValuePoison {return unit}

  if not type_check (typeBool, cond.type, cond.ti) {
    return unit
  }

  if block is Unit {return unit}

  s = stmt_new (#StmtWhile, x.ti)
  s.while := (cond=cond, stmt=block as *Stmt)
  return s
}


do_stmt_return = (x : *AstStmtReturn) -> *Stmt or Unit {
  func_to = fctx.cfunc.type.func.to
  rv = x.value

  if rv is Unit {
    if not type_eq (func_to, typeUnit) {
      error("missing return value", x.ti)
      return unit
    }

    s = stmt_new (#StmtReturn, x.ti)
    s.return := @StmtReturn (value=unit, ti=x.ti)
    return s
  }

  v0 = do_value (rv as *AstValue)
  if v0.kind == #ValuePoison {return unit}
  v = implicit_cast (v0, func_to)
  if not type_check (func_to, v.type, v0.ti) {}

  s = stmt_new (#StmtReturn, x.ti)
  s.return := @StmtReturn (value=v, ti=x.ti)
  return s
}


/*do_stmt_vardef = (x : *AstStmtVarDef) -> *Stmt or Unit {
  type = do_type(x.vardef.type)
  ti = x.vardef.ti
  add_var = ListForeachHandler {
    ast_id = data to *AstId
    type = ctx to *Type
    create_local_var(ast_id, type, nil, ast_id.ti)
  }
  list_foreach(&x.vardef.ids, add_var, type)

  return unit
}*/


do_stmt_typedef = (x : *AstStmtTypeDef) -> *Stmt or Unit {
  id = x.id.str
  _type = do_type (x.type)

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


do_stmt_break = (x : *AstStmtBreak) -> *Stmt or Unit {
  if fctx.loop == 0 {error ("`break` outside any loop operator", nil)}
  return stmt_new (#StmtBreak, x.ti)
}


do_stmt_continue = (x : *AstStmtContinue) -> *Stmt or Unit {
  if fctx.loop == 0 {error ("`break` outside any loop operator", nil)}
  return stmt_new (#StmtContinue, x.ti)
}


do_stmt_goto = (x : *AstStmtGoto) -> *Stmt or Unit {
  s = stmt_new (#StmtGoto, x.ti)
  s.l := x.label.str
  return s
}


do_stmt_label = (x : *AstStmtLabel) -> *Stmt or Unit {
  s = stmt_new (#StmtLabel, x.ti)
  s.l := x.label.str
  return s
}


