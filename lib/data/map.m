// data/map


import "C"
import "data/node"
import "data/list"



Map = List

MapForeachHandler = (k, v : *Unit, ctx : *Unit) -> ()



map_new = list_new
map_init = list_init


map_append = (m : *Map, k : Str, v : *Unit) -> Bool {
  if m == nil or k == nil or v == nil {return false}

  new_node = node_new(0)

  new_node.key := k to *Unit
  new_node.data := v

  if m.first == nil {
    m.first := new_node
  } else {
    node_append(m.last, new_node)
  }

  m.last := new_node

  m.volume := m.volume + 1
  return true
}


map_list_node_get = (m : *Map, k : Str) -> *Node {
  serch_by_key = NodeSearchHandler {
    return strcmp(n.key to Str, ctx to Str) == 0
  }
  return node_search(m.first, serch_by_key, k to *Unit)
}


map_reset = (m : *Map, k : Str, v : *Unit) -> () {
  n = map_list_node_get(m, k)
  n.data := v
}


// возвращает ссылку на данные из изъятой ноды
map_remove = (m : *Map, k : Str) -> *Unit {
  n = map_list_node_get(m, k)
  if n == nil {return nil}
  data = n.data
  list_node_remove(m, n)
  return data
}


//map_get = map_list_node_get
map_get = (m : *Map, k : Str) -> *Unit {
  n = map_list_node_get(m, k)
  if n != nil {return n.data}
  return nil
}


map_foreach = (m : *Map, f : MapForeachHandler, ctx : *Unit) -> () {
  n = m.first to Var *Node
  while n != nil {
    f(n.key, n.data, ctx)
    n := n.next
  }
}

// map1 <- map2
map_extend = (map1, map2 : *Map) -> Bool {
  if map1 == nil or map2 == nil {return false}

  mext = MapForeachHandler {
    map1 = ctx to *Map
    map_append(map1, k to Str, v)
  }
  map_foreach(map2, mext, map1)

  return true
}


