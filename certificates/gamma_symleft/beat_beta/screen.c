#include <stdio.h>
#include <string.h>
#include <math.h>
#define M 1024
static long double F[M][M],G[M][M];
static int f[M],g[M],lo[M],hi[M];
double screen(int n, const unsigned char *br){
 int p=(n+1)/2,q=n/2;if(p>=M||q>=M)return 1;
 f[p]=q+1;g[q]=p+1;
 for(int r=p-1;r>=0;r--){int x=2*r+3<n&&!br[2*r]?r+2:q+1;f[r]=x<f[r+1]?x:f[r+1];}
 for(int r=q-1;r>=0;r--){int x=2*r+4<n&&!br[2*r+1]?r+3:p+1;g[r]=x<g[r+1]?x:g[r+1];}
 int k=0;for(int i=0;i<=p;i++){while(k<q&&g[k]<=i)k++;lo[i]=k;hi[i]=i<p?f[i]-1:q;}
 for(int i=0;i<=p;i++)for(int j=lo[i];j<=hi[i];j++)F[i][j]=i+j==0?1:(i&&j>=lo[i-1]&&j<=hi[i-1]?F[i-1][j]:0)+(j>lo[i]?F[i][j-1]:0);
 for(int i=p;i>=0;i--)for(int j=hi[i];j>=lo[i];j--)G[i][j]=i==p&&j==q?1:(i<p&&j>=lo[i+1]&&j<=hi[i+1]?G[i+1][j]:0)+(j<hi[i]?G[i][j+1]:0);
 long double e=F[p][q],best=0;
 for(int i=1;i<=p;i++){
 long double s=0;int l=lo[i-1]>lo[i]?lo[i-1]:lo[i],h=hi[i-1]<hi[i]?hi[i-1]:hi[i];if(h>=q)h=q-1;if(h>f[i-1]-2)h=f[i-1]-2;
 for(int j=l;j<=h;j++){s+=F[i-1][j]*G[i][j];long double m=s<e-s?s:e-s;if(m>best)best=m;}}
 return best/e;
}
