#include<bits/stdc++.h>
using namespace std;
const int MAXV=100001;
int N,K,DP[MAXV];
int main(){
	ios_base::sync_with_stdio(false);
	cin.tie(NULL);cout.tie(NULL);
	cin>>N>>K;
	for(int i=0;i<N;i++){
	       int W,V;
	       cin>>W>>V;
	       for(int j=K;j>=W;j--){
		       DP[j]=max(DP[j],DP[j-W]+V);
	       }
  	}	       
	cout<<DP[K]<<"\n";
	return 0;
}
