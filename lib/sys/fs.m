// lib/sys/fs


import "C"


// File (or directory) exists?
exists = (fname : Str) -> Bool {
  fd = open(fname, c_O_RDONLY)
  if fd < 0 {return false}
  close(fd)
  return true
}


// It's a directory?
isdir = (name : Str) -> Bool {
  d = opendir(name)
  if d == nil {return false}
  closedir(d)
  return true
}


