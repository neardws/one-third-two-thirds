from w2lib import *
import math
kappa=(93-math.sqrt(6697))/32
def chen(m,n):
    rels=[('a',i,'b',i+1) for i in range(1,m+1) if i%5 in (1,2,3,4) and i+1<=n]
    rels+=[('b',j,'a',j+2) for j in range(1,n+1) if j%5 in (0,2,4) and j+2<=m]
    return closure_fg(m,n,rels)
print("Chen P(5k,5k): kappa=%.9f"%kappa)
for k in range(1,13):
    f,g=chen(5*k,5*k); d,e,a=delta(5*k,5*k,f,g)
    print(k,10*k,d if k<=3 else "", "%.9f"%float(d), "gap=%.3e"%(float(d)-kappa))
