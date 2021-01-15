#include<bits/stdc++.h>
using namespace std;
const int MAX=500;
const int INF=987654321;
int T,K,arr[MAX],DP[MAX][MAX],prefix[MAX];

int sumChapter(int s,int e){
	if(s>=e) return 0;

	if(DP[s][e]!=INF) return DP[s][e];

	int& ret=DP[s][e];

	ret=INF;

	for(int i=s;i<=e;i++){
		ret=min(ret,sumChapter(s,i)+sumChapter(i+1,e)+prefix[e]-prefix[s-1]);
	}

	return ret;
}

int main(){
	ios_base::sync_with_stdio(false);
	cin.tie(NULL); cout.tie(NULL);
	cin>>T;
	while(T--){
		cin>>K;
		fill(DP[0],DP[K],INF);
		for(int i=0;i<K;i++) {
			cin>>arr[i];
			DP[i][i]=arr[i];
			if(!i) {
				prefix[i]=arr[i];
				continue;
			}
			prefix[i]=prefix[i-1]+arr[i];
		}
		cout<<sumChapter(0,K-1)<<"\n";
	}
	return 0;
}
