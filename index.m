

Index = (types, values : Map)  // Symtab


index_init = (index : *Index) -> () {
  map_init(&index.types)
  map_init(&index.values)
}

index_extend = (dst, src : *Index) -> () {
  map_extend(&dst.types, &src.types)
  map_extend(&dst.values, &src.values)
}

index_type_append = (index : *Index, id : Str, t : *Type) -> () {
  map_append(&index.types, id, t)
}

index_value_append = (index : *Index, id : Str, v : *Value) -> (){
  map_append(&index.values, id, v)
}

index_type_get = (index : *Index, id : Str) -> *Type {
  return map_get(&index.types, id) to *Type
}

index_value_get = (index : *Index, id : Str) -> *Value {
  return map_get(&index.values, id) to *Value
}


