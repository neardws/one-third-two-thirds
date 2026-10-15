#include <stdlib.h>
// reads digraph6 Hasse diagrams (nauty-genposetg), outputs n,d6,e(P),best_k,x,y,nrel
// best_k = #ext with x before y maximizing min(k,e-k)
#include <stdio.h>
#include <string.h>
#include <stdint.h>
int main(int argc,char**argv){double thr=argc>1?atof(argv[1]):2.0;char line[256];static uint64_t f[1<<12],g[1<<12];static char isdown[1<<12];
while(fgets(line,256,stdin)){line[strcspn(line,"\r\n")]=0;if(line[0]!='&')continue;
 int n=line[1]-63;int up[16]={0};int bit=0;const char*p=line+2;
 for(int i=0;i<n;i++)for(int j=0;j<n;j++){int c=p[bit/6]-63;if((c>>(5-bit%6))&1)up[i]|=1<<j;bit++;}
 // closure: below[j]= set of i<j
 int below[16]={0};for(int it=0;it<n;it++)for(int i=0;i<n;i++)for(int j=0;j<n;j++)if(up[i]>>j&1)below[j]|=below[i]|(1<<i);
 int N=1<<n;for(int D=0;D<N;D++){isdown[D]=1;for(int j=0;j<n;j++)if((D>>j&1)&&((below[j]&D)!=below[j])){isdown[D]=0;break;}}
 memset(f,0,8*N);memset(g,0,8*N);f[0]=1;
 for(int D=0;D<N;D++)if(isdown[D]&&f[D])for(int j=0;j<n;j++)if(!(D>>j&1)&&isdown[D|1<<j])f[D|1<<j]+=f[D];
 g[N-1]=1;for(int D=N-1;D>=0;D--)if(isdown[D])for(int j=0;j<n;j++)if(!(D>>j&1)&&isdown[D|1<<j])g[D]+=g[D|1<<j];
 uint64_t e=f[N-1],bk=0;int bx=-1,by=-1,nrel=0;
 for(int x=0;x<n;x++)for(int y=x+1;y<n;y++){if((below[y]>>x&1)||(below[x]>>y&1)){nrel++;continue;}
  uint64_t k=0;for(int D=0;D<N;D++)if(isdown[D]&&!(D>>x&1)&&!(D>>y&1)&&isdown[D|1<<x])k+=f[D]*g[D|1<<x];
  uint64_t m=k<e-k?k:e-k;if(bx<0||m>bk){bk=m;bx=x;by=y;}}
 if(bx<0)continue; if((double)bk>=thr*(double)e)continue;
 printf("%d,%s,%llu,%llu,%d,%d\n",n,line,(unsigned long long)e,(unsigned long long)bk,bx,by);}
}
