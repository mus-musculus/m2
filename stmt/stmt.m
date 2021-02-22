/*****************************************************************************/
/*                              Statement                                    */
/*****************************************************************************/


stmt_new = (x : Stmt) -> *Stmt {
  s = malloc (sizeof Stmt) to *Stmt
  assert (s != nil, "stmt_new")
  *s := x
  return s
}

DoStmtResult = *Stmt or Unit

exist do_stmt_assign   : (x : AstStmtAssign) -> DoStmtResult
exist do_stmt_valbind  : (x : AstStmtValueBind) -> DoStmtResult
exist do_stmt_block    : (x : AstStmtBlock) -> DoStmtResult
exist do_stmt_expr     : (x : AstStmtExpr) -> DoStmtResult
exist do_stmt_if       : (x : AstStmtIf) -> DoStmtResult
exist do_stmt_while    : (x : AstStmtWhile) -> DoStmtResult
exist do_stmt_return   : (x : AstStmtReturn) -> DoStmtResult
exist do_stmt_typebind : (x : AstStmtTypeBind) -> DoStmtResult
exist do_stmt_break    : (x : AstStmtBreak) -> DoStmtResult
exist do_stmt_again    : (x : AstStmtAgain) -> DoStmtResult
exist do_stmt_goto     : (x : AstStmtGoto) -> DoStmtResult
exist do_stmt_label    : (x : AstStmtLabel) -> DoStmtResult


do_stmt = (x : *AstStmt) -> DoStmtResult {
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
do_stmt_assign = (x : AstStmtAssign) -> DoStmtResult {
  rval0 = do_value (x.r)

  if rval0.data is ValuePoison {return unit}

  lval = do_lvalue(x.l)

  if lval.data is ValuePoison {return unit}

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


do_stmt_valbind = (x : AstStmtValueBind) -> DoStmtResult {
  id = x.id.str
  v = do_valuex (x.expr, false)

  d = v.data
  is_constbind = (d is ValueGlobalConst) or
                 (d is ValueImm) or
                 (d is ValueGenericRecord)

  is_varbind = v.type.kind == #TypeVar

  if is_constbind or is_varbind {
    // просто связываем имя с константным значением или новой переменной
    valbind_local (id, v)
    return unit
  }

  // Сюда попадают неизменяемые значения (регистры)
  // инициализируемые в рантайме

  // создаем стейтмент который в принтере назначит регистр выражению
  se = stmt_new ((v=v, no=nocnt2, ti=x.ti) to StmtValBind)

  // и создаем значение которое ссылается на вырадение в стейтменте
  v0 = value_new ((type=v.type, no=nocnt2, ti=x.ti) to ValueLocalVal, v.type, x.ti)
  v0.bind_at := x.ti  // <

  valbind_local (id, v0)

  nocnt2 := nocnt2 + 1
  return se
}


do_stmt_block = (x : AstStmtBlock) -> DoStmtResult {
  sb = 0 to Var StmtBlock
  context_init (&sb.ctx, cctx)
  list_init (&sb.stmts)

  //stmt_block_init (&sb)
  old_cblock = fctx.cblock

  context_init (&sb.ctx, cctx)
  cctx := &sb.ctx

  fctx.cblock := &sb

  do_stmt_in_block = ListForeachHandler {
    ast_stmt = data to *AstStmt
    stmt = do_stmt (ast_stmt)
    // just skip up broken statements
    if stmt is Unit {return}
    stmts = ctx to *List
    list_append (stmts, stmt as *Stmt)
  }
  list_foreach (&(x.stmts to Var List), do_stmt_in_block, &sb.stmts)

  cctx := sb.ctx.parent
  fctx.cblock := old_cblock  // restore old cblock value

  return stmt_new ((stmts=sb.stmts, ti=x.ti) to StmtBlock)
}


do_stmt_expr = (x : AstStmtExpr) -> DoStmtResult {
  v = do_value (x.expr)

  if v.data is ValuePoison {return unit}

  if not type_eq (v.type, typeUnit) {
    //warning("ignoring value", x.ti)
  }

  return stmt_new ((v=v, ti=x.ti) to StmtExpr)
}


do_stmt_if = (x : AstStmtIf) -> DoStmtResult {
  cond = do_value (x.cond)
  then = do_stmt (x.then)

  _else = unit to Var DoStmtResult

  if not (x.else is Unit) {
    els = do_stmt (x.else as *AstStmt)
    if not (els is Unit) {
      _else := els as *Stmt
    }
  }

  if cond.data is ValuePoison {return unit}

  if not type_check (typeBool, cond.type, cond.ti) {
    return unit
  }

  if then is Unit {return unit}

  return stmt_new ((cond=cond, then=then as *Stmt, else=_else, ti=x.ti) to StmtIf)
}


do_stmt_while = (x : AstStmtWhile) -> DoStmtResult {
  cond = do_value (x.cond)

  fctx.loop := fctx.loop + 1
  block = do_stmt (x.block)
  fctx.loop := fctx.loop - 1

  if cond.data is ValuePoison {return unit}

  if not type_check (typeBool, cond.type, cond.ti) {
    return unit
  }

  if block is Unit {return unit}

  return stmt_new ((cond=cond, stmt=block as *Stmt, ti=x.ti) to StmtWhile)
}


do_stmt_return = (x : AstStmtReturn) -> DoStmtResult {
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
  if v0.data is ValuePoison {return unit}
  v = implicit_cast (v0, func_to)
  if not type_check (func_to, v.type, v0.ti) {}

  return stmt_new ((value=v, ti=x.ti) to StmtReturn)
}


do_stmt_typebind = (x : AstStmtTypeBind) -> DoStmtResult {
  id = x.id.str
  _type = do_type (x.type)

  uid = get_suid_type_local ()
  if _type.aka == nil {_type.aka := uid}

//  // bind type in local index
//  bind_type(&cblock.index, id, _type)

  // ПОКА даже локальные тпы идут в индекс модуля,
  // тк локальные функции исользуют контекст модуля и им часто нужны
  // локалные типы связанные в контексте функции-родителя
  //typebind (id, _type)
  context_type_append (&module.ctx, id, _type)

  //typebind_local (id, _type)

  // creating data for printer
  asmTypedefAdd (&asm0, uid, _type)

  return unit
}


do_stmt_break = (x : AstStmtBreak) -> DoStmtResult {
  if fctx.loop == 0 {error ("`break` outside a loop context", nil)}
  return stmt_new ((ti=x.ti) to StmtBreak)
}


do_stmt_again = (x : AstStmtAgain) -> DoStmtResult {
  if fctx.loop == 0 {error ("`again` outside a loop context", nil)}
  return stmt_new ((ti=x.ti) to StmtAgain)
}


do_stmt_goto = (x : AstStmtGoto) -> DoStmtResult {
  return stmt_new ((label=x.label.str, ti=x.ti) to StmtGoto)
}


do_stmt_label = (x : AstStmtLabel) -> DoStmtResult {
  return stmt_new ((label=x.label.str, ti=x.ti) to StmtLabel)
}


