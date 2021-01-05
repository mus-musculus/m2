// lib/data/list


import "C"
import "data/node"



List = (first, last : *Node, volume : Nat64)

/*
 * Foreach - проходят по всем элементам
 * Search - проходит по всем элементам или прерывается в процесе возвращая указатель
 * While - проходит пока f возвращает истину
 */


/*
 * Типы функций-обработчиков для объектов списка
 * параметр data - указатель на текущий элемент списка
 * параметр ctx - указатель на произвольные данные передаваемые извне
 * параметр index - номер текущего элемента в списке
 */

// list_foreach handler
ListForeachHandler = (data, ctx : *Unit, index : Nat) -> ()

// list_foreach2 handler
ListForeachHandler2 = (data1, data2, ctx : *Unit, index : Nat) -> ()

// list_while2 handler
ListWhileHandler2 = (data1, data2, ctx : *Unit, index : Nat) -> Bool

// list_compare handler
ListCompareHandler = (data1, data2, ctx : *Unit, index : Nat) -> Bool

// list_search handler
ListSearchHandler = (data, ctx : *Unit, index : Nat) -> Bool

// list_map handler
ListMapHandler = (data, ctx : *Unit, index : Nat) -> *Unit



exist list_foreach : (list : *List, f : ListForeachHandler, ctx : *Unit) -> ()


list_init = (list : *List) -> () {memset(list to *Unit, 0, sizeof List)}


list_new = () -> *List {
  n = malloc(sizeof List) to *List
  list_init(n)
  return n
}


// добавляет объект в конец списка
list_append = (list : *List, obj : *Unit) -> Bool {
  if list == nil or obj == nil {return false}

  new_node = node_new()

  new_node.data := obj

  if list.first == nil {
    list.first := new_node
  } else {
    node_append(list.last, new_node)
  }

  list.last := new_node

  list.volume := list.volume + 1
  return true
}


list_extend = (list1, list2 : *List) -> Bool {
  if list1 == nil or list2 == nil {return false}

  eext = ListForeachHandler {
    list1 = ctx to *List
    list_append(list1, data)
  }
  list_foreach(list2, eext, list1 to *Unit)

  return true
}


// подменяем значение o1 в списке на значение o2
list_subst = (list : *List, o1 : *Unit, o2 : *Unit) -> Bool {
  n = node_search_by_data(list.first, o1)
  if n == nil {return false}
  n.data := o2
  return true
}


list_node_remove = (list : *List, n : *Node) -> () {
  prev = n.prev
  next = n.next

  node_exclude(n)

  if list.first == n {list.first := next}
  if list.last == n {list.last := prev}

  free(n)

  list.volume := list.volume - 1
}


list_remove = (list : *List, o : *Unit) -> Bool {
  n = node_search_by_data(list.first, o)
  present = n != nil
  if present {list_node_remove(list, n)}
  return present
}


/*
 * Функция применяющая функцию f ко всем элементам списка list:
 * list - список
 * f - функция-обработчик с типом ListForeachHandler
 * param - свободный указатель, который будет передан функции f в качестве второго параметра (ctx)
 */
list_foreach = (list : *List, f : ListForeachHandler, ctx : *Unit) -> () {
  index = 0 to Var Nat
  n = list.first to Var *Node
  while n != nil {
    f(n.data, ctx, index)
    n := n.next
    index := index + 1
  }
}


list_foreach2 = (list1, list2 : *List, f : ListForeachHandler2, ctx : *Unit) -> () {
  n1 = list1.first to Var *Node
  n2 = list2.first to Var *Node
  index = 0 to Var Nat
  while n1 != nil and n2 != nil {
    f(n1.data, n2.data, ctx, index)
    n1 := n1.next; n2 := n2.next
    index := index + 1
  }
}

// продолжаем пока оба списка не кончатся. (Может приетать nil если списки не равны)
list_while2_or = (list1, list2 : *List, f : ListWhileHandler2, ctx : *Unit) -> () {
  n1 = list1.first to Var *Node
  n2 = list2.first to Var *Node
  index = 0 to Var Nat
  while n1 != nil or n2 != nil {
    data1 = select n1 {
      nil => nil to *Unit
      else => n1.data
    }

    data2 = select n2 {
      nil => nil to *Unit
      else => n2.data
    }

    if not f(data1, data2, ctx, index) {break}
    if n1 != nil {n1 := n1.next}
    if n2 != nil {n2 := n2.next}
    index := index + 1
  }
}

/*list_while2 = (list1, list2 : *List, f : ListForeachHandler2, ctx : *Unit) -> () {
  n1 = list1.first to Var *Node
  n2 = list2.first to Var *Node
  index = 0 to Var Nat
  while n1 != nil and n2 != nil {
    f(n1.data, n2.data, ctx, index)
    n1 := n1.next
    n2 := n2.next
    index := index + 1
  }
}*/


list_compare = (list1, list2 : *List, f : ListCompareHandler, ctx : *Unit) -> Bool {
  if list1.volume != list2.volume {return false}
  n1 = list1.first to Var *Node
  n2 = list2.first to Var *Node
  index = 0 to Var Nat
  while n1 != nil and n2 != nil {
    if not f(n1.data, n2.data, ctx, index) {return false}
    n1 := n1.next; n2 := n2.next
    index := index + 1
  }
  return true
}


list_search = (list : *List, f : ListSearchHandler, ctx : *Unit) -> *Unit {
  if list == nil {return nil}
  n = list.first to Var *Node
  index = 0 to Var Nat
  while n != nil {
    if f(n.data, ctx, index) {return n.data}
    n := n.next
    index := index + 1
  }
  return nil
}


list_map = (list : *List, f : ListMapHandler, ctx : *Unit) -> *List {
  if list == nil {return nil}
  index = 0 to Var Nat
  n = list.first to Var *Node
  result = list_new()
  while n != nil {
    res = f (n.data, ctx, index)
    if res != nil {
      list_append(result, res)
    }
    index := index + 1
    n := n.next
  }
  return result
}


