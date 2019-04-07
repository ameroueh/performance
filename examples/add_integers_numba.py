from numba import jit


@jit(nopython=True)
def f_numba(n):
    total = 0
    i = 0
    while i < n:
        total += i
        i += 1
    return total


from numba import jit, uint64


@jit(uint64(uint64), nopython=True)
def f_numba_with_signature(n):
    total = 0
    i = 0
    while i < n:
        total += i
        i += 1
    return total
