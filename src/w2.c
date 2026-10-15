// enumerate width-2 posets as chains a1<..<ap, b1<..<bq with monotone cross maps
// f[i]=min j with a_i<b_j (q+1 none), g[j]=min i with b_j<a_i (p+1 none)
// prints for each n: posets not linear sums whose delta>1/3 is among the smallest K distinct values
#include <stdio.h>
#include <stdlib.h>
typedef unsigned long long u64;
int n,p,q,f[20],g[20];
typedef struct{u64 m,e;int p,q,f[20],g[20];} Rec;
#define K 6
Rec best[K*8];int nb=0;long long cnt=0,cntInd=0;
static int lt(u64 m1,u64 e1,u64 m2,u64 e2){return (unsigned __int128)m1*e2<(unsigned __int128)m2*e1;}
static int eqf(u64 m1,u64 e1,u64 m2,u64 e2){return (unsigned __int128)m1*e2==(unsigned __int128)m2*e1;}
void eval(){
 // validity transitive
 for(int i=1;i<=p;i++)if(f[i]<=q&&g[f[i]]<=i)return;
 for(int j=1;j<=q;j++)if(g[j]<=p&&f[g[j]]<=j)return;
 cnt++;
 // linear sum?
 for(int i=0;i<=p;i++)for(int j=0;j<=q;j++){if(i+j==0||i+j==n)continue;
   int ok=1; if(i>0&&j<q&&f[i]>j+1)ok=0; if(j>0&&i<p&&g[j]>i+1)ok=0;
   // also need first-part a's below remaining... if j==q, remaining are a's only: fine. if i==p similarly.
   if(ok)return;}
 cntInd++;
 int cA[20],cB[20]; // cntB(i)=#{k:g[k]<=i}, cntA(j)=#{k:f[k]<=j}
 for(int i=0;i<=p;i++){cB[i]=0;for(int k=1;k<=q;k++)if(g[k]<=i)cB[i]++;}
 for(int j=0;j<=q;j++){cA[j]=0;for(int k=1;k<=p;k++)if(f[k]<=j)cA[j]++;}
 static u64 F[20][20],G[20][20];
 for(int i=0;i<=p;i++)for(int j=0;j<=q;j++){int v=cB[i]<=j&&cA[j]<=i;
   F[i][j]=!v?0:(i+j==0?1:(i?F[i-1][j]:0)+(j?F[i][j-1]:0));}
 for(int i=p;i>=0;i--)for(int j=q;j>=0;j--){int v=cB[i]<=j&&cA[j]<=i;
   G[i][j]=!v?0:(i==p&&j==q?1:(i<p?G[i+1][j]:0)+(j<q?G[i][j+1]:0));}
 u64 e=F[p][q],bm=0;
 for(int i=1;i<=p;i++){u64 s=0;for(int j=1;j<=q;j++){s+=F[i-1][j-1]*G[i][j-1];
   // pair a_i,b_j incomparable?
   if(f[i]<=j||g[j]<=i)continue; u64 m=s<e-s?s:e-s; if(m>bm)bm=m;}}
 if(3*bm==e)return; // delta=1/3 shouldn't happen for indecomposable; skip but flag
 // insert into best list (keep up to K distinct values, few reps each)
 int distinct=0; for(int t=0;t<nb;t++){ if(t==0||!eqf(best[t].m,best[t].e,best[t-1].m,best[t-1].e))distinct++;}
 if(distinct>=K&&!lt(bm,e,best[nb-1].m,best[nb-1].e)&&!eqf(bm,e,best[nb-1].m,best[nb-1].e))return;
 int samecount=0;for(int t=0;t<nb;t++)if(eqf(best[t].m,best[t].e,bm,e))samecount++;
 if(samecount>=6)return;
 Rec r;r.m=bm;r.e=e;r.p=p;r.q=q;for(int i=0;i<=p+1;i++)r.f[i]=f[i];for(int j=0;j<=q+1;j++)r.g[j]=g[j];
 int pos=nb;while(pos>0&&lt(bm,e,best[pos-1].m,best[pos-1].e))pos--;
 if(nb<K*8)nb++; for(int t=nb-1;t>pos;t--)best[t]=best[t-1]; if(pos<K*8)best[pos]=r;
 // trim to K distinct
 distinct=0;for(int t=0;t<nb;t++){if(t==0||!eqf(best[t].m,best[t].e,best[t-1].m,best[t-1].e))distinct++; if(distinct>K){nb=t;break;}}
}
void recg(int j,int lo){ if(j>q){eval();return;} for(int v=lo;v<=p+1;v++){g[j]=v;recg(j+1,v);} }
void recf(int i,int lo){ if(i>p){recg(1,1);return;} for(int v=lo;v<=q+1;v++){f[i]=v;recf(i+1,v);} }
int main(int argc,char**argv){n=atoi(argv[1]);p=atoi(argv[2]);q=n-p;recf(1,1);
 printf("#n=%d p=%d q=%d valid=%lld indec=%lld\n",n,p,q,cnt,cntInd);
 for(int t=0;t<nb;t++){printf("%llu %llu p=%d q=%d f=",best[t].m,best[t].e,best[t].p,best[t].q);
  for(int i=1;i<=best[t].p;i++)printf("%d,",best[t].f[i]);printf(" g=");for(int j=1;j<=best[t].q;j++)printf("%d,",best[t].g[j]);printf("\n");}}
