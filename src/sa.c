// simulated annealing over width-2 posets (f,g) minimizing delta among indecomposable ones
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#define M 128
int p,q,f[M],g[M];
double F[M][M],G[M][M];
static unsigned long long rs;static double rnd(){rs^=rs<<13;rs^=rs>>7;rs^=rs<<17;return (rs>>11)*(1.0/9007199254740992.0);}
int valid(){for(int i=1;i<=p;i++){if(f[i]<1||f[i]>q+1)return 0;if(i>1&&f[i]<f[i-1])return 0;if(f[i]<=q&&g[f[i]]<=i)return 0;}
 for(int j=1;j<=q;j++){if(g[j]<1||g[j]>p+1)return 0;if(j>1&&g[j]<g[j-1])return 0;}return 1;}
int decomposable(){for(int i=0;i<=p;i++)for(int j=0;j<=q;j++){if(i+j==0||i+j==p+q)continue;
 int ok=1;if(i>0&&j<q&&f[i]>j+1)ok=0;if(j>0&&i<p&&g[j]>i+1)ok=0;
 // also boundary: if i==0, need b_j < a_1: g[j]<=1 ; if j==0 need f[i]<=1 (covered above when j<q: f[i]>1 -> not ok)
 if(i==0&&g[j]>1)ok=0; if(j==0&&f[i]>1)ok=0; if(ok)return 1;}return 0;}
double eval(){ if(decomposable())return 1;
 static int cA[M],cB[M];
 for(int i=0;i<=p;i++){int c=0;for(int k=1;k<=q;k++)if(g[k]<=i)c++;cB[i]=c;}
 for(int j=0;j<=q;j++){int c=0;for(int k=1;k<=p;k++)if(f[k]<=j)c++;cA[j]=c;}
 for(int i=0;i<=p;i++)for(int j=0;j<=q;j++){int v=cB[i]<=j&&cA[j]<=i;F[i][j]=!v?0:(i+j==0?1:(i?F[i-1][j]:0)+(j?F[i][j-1]:0));}
 for(int i=p;i>=0;i--)for(int j=q;j>=0;j--){int v=cB[i]<=j&&cA[j]<=i;G[i][j]=!v?0:(i==p&&j==q?1:(i<p?G[i+1][j]:0)+(j<q?G[i][j+1]:0));}
 double e=F[p][q],bm=0;
 for(int i=1;i<=p;i++){double s=0;for(int j=1;j<=q;j++){s+=F[i-1][j-1]*G[i][j-1];if(f[i]<=j||g[j]<=i)continue;double m=s<e-s?s:e-s;if(m>bm)bm=m;}}
 return bm/e;}
int main(int argc,char**argv){p=atoi(argv[1]);q=atoi(argv[2]);long iters=atol(argv[3]);rs=atoll(argv[4])*2654435761ULL+1;
 double T0=atof(argv[5]);
 for(int i=1;i<=p;i++){f[i]=i+1;if(f[i]>q+1)f[i]=q+1;} for(int j=1;j<=q;j++){g[j]=j+2;if(g[j]>p+1)g[j]=p+1;}
 if(!valid()){fprintf(stderr,"init invalid\n");}
 double cur=eval(),best=cur;int bf[M],bg[M];for(int i=0;i<M;i++){bf[i]=f[i];bg[i]=g[i];}
 for(long t=0;t<iters;t++){double T=T0*pow(1e-4,(double)t/iters);
  int side=rnd()<0.5,idx=side?1+(int)(rnd()*p):1+(int)(rnd()*q),d=rnd()<0.5?-1:1;
  int *arr=side?f:g;int old=arr[idx];arr[idx]+=d;
  if(!valid()){arr[idx]=old;continue;}
  double v=eval();
  if(v<=cur||rnd()<exp((cur-v)/T)){cur=v;if(v<best){best=v;for(int i=0;i<M;i++){bf[i]=f[i];bg[i]=g[i];}}}
  else arr[idx]=old;}
 printf("%.12f p=%d q=%d f=",best,p,q);for(int i=1;i<=p;i++)printf("%d,",bf[i]);printf(" g=");for(int j=1;j<=q;j++)printf("%d,",bg[j]);printf("\n");}
