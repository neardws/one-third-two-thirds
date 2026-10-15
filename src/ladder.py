from w2lib import *
import math
def ladder(m):  # n=2m: a_i<b_{i+1} (i<m), b_j<a_{j+2} for j=2..m-2
    rels=[('a',i,'b',i+1) for i in range(1,m)]+[('b',j,'a',j+2) for j in range(2,m-2)]
    return closure_fg(m,m,rels)
for m in range(5,31):
    f,g=ladder(m); d,e,a=delta(m,m,f,g)
    print(2*m, d if m<=9 else "", "%.12f"%float(d), e if m<=9 else "", a)
phi=(1+5**.5)/2
