/*****************************************************************************/
/*                              Statement                                    */
/*****************************************************************************/


stmt_new = (x : Stmt) -> *Stmt {
  s = malloc (sizeof Stmt) to *Stmt
  assert (s != nil, "stmt_new")
  *s := x
  return s
}


exist do_stmt_assign   : (x : AstStmtAssign) -> *Stmt or Unit
exist do_stmt_valbind  : (x : AstStmtValueBind) -> *Stmt or Unit
exist do_stmt_block    : (x : AstStmtBlock) -> *Stmt or Unit
exist do_stmt_expr     : (x : AstStmtExpr) -> *Stmt or Unit
exist do_stmt_if       : (x : AstStmtIf) -> *Stmt or Unit
exist do_stmt_while    : (x : AstStmtWhile) -> *Stmt or Unit
exist do_stmt_return   : (x : AstStmtReturn) -> *Stmt or Unit
exist do_stmt_typebind : (x : AstStmtTypeBind) -> *Stmt or Unit
exist do_stmt_break    : (x : AstStmtBreak) -> *Stmt or Unit
exist do_stmt_again    : (x : AstStmtAgain) -> *Stmt or Unit
exist do_stmt_goto     : (x : AstStmtGoto) -> *Stmt or Unit
exist do_stmt_label    : (x : AstStmtLabel) -> *Stmt or Unit


do_stmt = DoStmt {
  xx = *x
  return when xx {
    AstStmtAssign    => do_stmt_assign   (xx to AstStmtAssign)
    AstStmtValueBind => do_stmt_valbind  (xx to AstStmtValueBind)
    AstStmtBlock     => do_stmt_block    (xx to AstStmtBlock)
    AstStmtExpr      => do_stmt_expr     (xx to AstStmtExpr)
    AstStmtIf        => do_stmt_if       (xx to AstStmtIf)
    AstStmtWhile     => do_stmt_while    (xx to AstStmtWhile)
    AstStmtReturn    => do_stmt_return   (xx to AstStmtReturn)
    AstStmtTypeBind  => do_stmt_typebind (xx to AstStmtTypeBind)
    AstStmtBreak     => do_stmt_break    (xx to AstStmtBreak)
    AstStmtAgain     => do_stmt_again    (xx to AstStmtAgain)
    AstStmtGoto      => do_stmt_goto     (xx to AstStmtGoto)
    AstStmtLabel     => do_stmt_label    (xx to AstStmtLabel)
    //AstStmtVarDef  => do_stmt_vardef (x)
    else => unit
  }
}

/*
есть проблема связанная с lval и rval - раньше я решал ее с помощью #ValueAddress
но! Если композитное значение лежит в регистре то этот подход не работает.
Значит мне придется явно передавать во все функции семейства do_value флаг
lval - означающий что не нужно загружать значение окончательно.
*/
do_stmt_assign = (x : AstStmtAssign) -> *Stmt or Unit {
  rval0 = do_value (x.r)

  if rval0.kind == #ValuePoison {return unit}

  lval = do_lvalue(x.l)

  if lval.kind == #ValuePoison {return unit}

  if value_is_readonly (lval) {
    error ("invalid lval", x.ti)
    return unit
  }

  ltype = when lval.type.kind {
    #TypeVar => lval.type.var.of
    else => lval.type
  }


  rval = implicit_cast (rval0, ltype)

  if not type_check (ltype, rval.type, x.ti) {
    return unit
  }

  return stmt_new ((l=lval, r=rval, ti=x.ti) to StmtAssign)
}




// used in cpl
stmt_new_vardef = (id : *AstId, t : *Type, init_value : *Value, ti : *TokenInfo) -> *Stmt {
  s = stmt_new ((id=id, no=nocnt, type=t, init_value=dold (init_value), ti=ti) to StmtVarDef)
  nocnt := nocnt + 1
  return s
}


do_stmt_valbind = (x : AstStmtValueBind) -> *Stmt or Unit {
  id = x.id.str
  v = do_valuex (x.expr, false)

  k = v.kind
  is_constbind = k == #ValueGlobalConst or
                 k == #ValueImmediate or
                 k == #ValueGenericRecord
  is_varbind = v.type.kind == #TypeVar

  if is_constbind or is_varbind {
    // просто связываем имя с константным значением или новой переменной
    bind_value_in_block (fctx.cblock, id, v)
    return unit
  }

  // Сюда попадают неизменяемые значения (регистры)
  // инициализируемые в рантайме

  // создаем стейтмент который в принтере назначит регистр выражению
  se = stmt_new ((v=v, no=nocnt2, ti=x.ti) to StmtValBind)

  // и создаем значение которое ссылается на вырадение в стейтменте
  v0 = value_new (#ValueLocalConst, v.type, x.ti)
  v0.locval := (type=v.type, no=nocnt2, ti=x.ti)
  bind_value_local (id, v0)

  nocnt2 := nocnt2 + 1
  return se
}


stmt_block_init = (b, parent : *StmtBlock) -> *StmtBlock {
  memset (b, 0, sizeof StmtBlock)
  b.parent := parent
  index_init (&b.index)
  list_init (&b.stmts)
  list_init (&b.local_funcs)
  return b
}


do_stmt_block = (x : AstStmtBlock) -> *Stmt or Unit {
  sb = 0 to Var StmtBlock
  stmt_block_init (&sb, fctx.cblock)

  fctx.cblock := &sb

  hstmt = ListForeachHandler {
    ast_stmt = data to *AstStmt
    stmt = do_stmt (ast_stmt)
    // just skip up broken statements
    if stmt is Unit {return}
    stmts = ctx to *List
    list_append (stmts, stmt as *Stmt)
  }
  list_foreach (&(x.stmts to Var List), hstmt, &sb.stmts)

  fctx.cblock := sb.parent  // restore old cblock value

  return stmt_new ((stmts=sb.stmts, parent=sb.parent, index=sb.index, local_funcs=sb.local_funcs, ti=x.ti) to StmtBlock)
}


do_stmt_expr = (x : AstStmtExpr) -> *Stmt or Unit {
  v = do_value (x.expr)

  if v.kind == #ValuePoison {return unit}

  if not type_eq (v.type, typeUnit) {
    //warning("ignoring value", x.ti)
  }

  return stmt_new ((v=v, ti=x.ti) to StmtValBind)
}


do_stmt_if = (x : AstStmtIf) -> *Stmt or Unit {
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

  return stmt_new ((cond=cond, then=then as *Stmt, else=_else, ti=x.ti) to StmtIf)
}


do_stmt_while = (x : AstStmtWhile) -> *Stmt or Unit {
  cond = do_value (x.cond)

  fctx.loop := fctx.loop + 1
  block = do_stmt (x.block)
  fctx.loop := fctx.loop - 1

  if cond.kind == #ValuePoison {return unit}

  if not type_check (typeBool, cond.type, cond.ti) {
    return unit
  }

  if block is Unit {return unit}

  return stmt_new ((cond=cond, stmt=block as *Stmt, ti=x.ti) to StmtWhile)
}


do_stmt_return = (x : AstStmtReturn) -> *Stmt or Unit {
  func_to = fctx.cfunc.type.func.to
  rv = x.value

  if rv is Unit {
    if not type_eq (func_to, typeUnit) {
      error("missing return value", x.ti)
      return unit
    }

    return stmt_new ((value=unit, ti=x.ti) to StmtReturn)
  }

  v0 = do_value (rv as *AstValue)
  if v0.kind == #ValuePoison {return unit}
  v = implicit_cast (v0, func_to)
  if not type_check (func_to, v.type, v0.ti) {}

  return stmt_new ((value=v, ti=x.ti) to StmtReturn)
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

do_stmt_typebind = (x : AstStmtTypeBind) -> *Stmt or Unit {
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


do_stmt_break = (x : AstStmtBreak) -> *Stmt or Unit {
  if fctx.loop == 0 {error ("`break` outside a loop context", nil)}
  return stmt_new ((ti=x.ti) to StmtBreak)
}


do_stmt_again = (x : AstStmtAgain) -> *Stmt or Unit {
  if fctx.loop == 0 {error ("`again` outside a loop context", nil)}
  return stmt_new ((ti=x.ti) to StmtAgain)
}


do_stmt_goto = (x : AstStmtGoto) -> *Stmt or Unit {
  return stmt_new ((label=x.label.str, ti=x.ti) to StmtGoto)
}


do_stmt_label = (x : AstStmtLabel) -> *Stmt or Unit {
  return stmt_new ((label=x.label.str, ti=x.ti) to StmtLabel)
}


