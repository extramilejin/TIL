// 2021.01.13 extramilejin
// link: https://codeforces.com/problemset/problem/1472/C

#include<bits/stdc++.h>
using namespace std;
typedef long long ll;
const int MAX=200000+1;
ll arr[MAX],DP[MAX];
int n,t;
int main(){
	ios_base::sync_with_stdio(false);
	cin.tie(0);
	cin>>t;
	while(t--){
		cin>>n;
		ll maxScore=0;
		memset(DP,0,sizeof(DP));
		for(int i=1;i<=n;i++) cin>>arr[i];
		for(int i=1;i<=n;i++) {
			ll idx=i;
			ll score=0;
			do{
				score+=arr[idx];
				idx+=arr[idx];
				if(idx<=n&&DP[idx]<score) DP[idx]=score;
				else break;
			}while(idx<=n);

			if(maxScore<score) maxScore=score;
		}
		cout<<maxScore<<"\n";
	}
	return 0;
}

