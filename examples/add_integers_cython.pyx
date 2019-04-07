from libc.stdint cimport uint64_t

def f(uint64_t n):
    cdef uint64_t total = 0
    cdef uint64_t i = 0
    while i < n:
        total += i
        i += 1
    return total

def f_no_annotations(n):
    total = 0
    i = 0
    while i < n:
        total += i
        i += 1
    return total
