import Alloy.C
open scoped Alloy.C

alloy c include <lean/lean.h> <stdint.h> <string.h>

alloy c extern "lean_memset_zero"
def ByteArray.zeroes (n : USize) : ByteArray :=
  lean_object *res = lean_alloc_sarray(1, n, n);
  uint8_t * it = lean_sarray_cptr(res);
  memset(it, 0, n)
  return res;
