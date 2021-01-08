// lib/data/node


import "C"


Node = (prev, next : *Self, key, data  : *Unit)


NodeForeachHandler = (n : *Node, ctx : *Unit, index : Nat) -> ()
NodeSearchHandler = (n : *Node, ctx : *Unit, index : Nat) -> Bool



node_init = (node : *Node) -> () {memset(node to *Unit, 0, sizeof Node)}


// extra - объем дополнительной памяти
node_new = (extra : Nat) -> *Node {
  new_node = malloc(sizeof Node + extra) to *Node
  node_init(new_node)
  return new_node
}


// добавляет ноду an после ноды n
// если после n были ноды, они добавляются после an (то есть это по сути вставка)
node_append = (n : *Node, an : *Node) -> () {
  // insert before?
  nnext = n.next
  if nnext != nil {
    an.next := nnext
    nnext.prev := an
  }

  n.next := an
  an.prev := n
}


// исключает ноду из цепочки в которой она участвует
node_exclude = (node : *Node) -> () {
  prev = node.prev
  next = node.next
  if prev != nil {prev.next := next}
  if next != nil {next.prev := prev}
}


node_foreach = (node_chain : *Node, f : NodeForeachHandler, ctx : *Unit) -> () {
  if node_chain == nil {return}
  n = node_chain to Var *Node
  index = 0 to Var Nat
  while n != nil {
    f(n, ctx, index)
    n := n.next
    index := index + 1
  }
}


// применяет f к каждой ноде в цепочке node_chain
node_search = (node_chain : *Node, f : NodeSearchHandler, ctx : *Unit) -> *Node {
  if node_chain == nil {return nil}
  n = node_chain to Var *Node
  index = 0 to Var Nat
  while n != nil {
    if f(n, ctx, index) {return n}
    n := n.next
    index := index + 1
  }
  return nil
}


// поиск ноды по ссылке на data
node_search_by_data = (node_chain : *Node, data : *Unit) -> *Node {
  return node_search(node_chain, func NodeSearchHandler {return n.data == ctx}, data)
}


