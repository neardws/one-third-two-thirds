import pickle,csv
from analyze import struct
summary,ext=pickle.load(open("ext.pkl","rb"))
w=csv.writer(open("extremes.csv","w",newline=""));w.writerow(["n","kind","digraph6","e","delta","width","height","disjoint_union","ordinal_summands","covers"])
for n in range(3,11):
  eq,gt=ext[n]
  for kind,L in (("eq",eq),("gt",gt)):
    for d,d6,e,x,y in L:
      s=struct(d6);w.writerow([n,kind,d6,e,str(d),s["width"],s["height"],s["disjoint_union"],s["ordinal_summands"],s["covers"]])
      if n>=8 or kind=="eq": print(n,kind,d,e,s["width"],s["height"],s["disjoint_union"],s["ordinal_summands"],"|",s["covers"] if kind=="gt" else "")
