import ctypes
from pathlib import Path
lib=ctypes.CDLL(str(Path('screen.so').resolve()))
lib.screen.argtypes=[ctypes.c_int,ctypes.POINTER(ctypes.c_ubyte)];lib.screen.restype=ctypes.c_double

def screen(n,br):
    a=(ctypes.c_ubyte*n)()
    for j in br:a[j]=1
    return lib.screen(n,a)
