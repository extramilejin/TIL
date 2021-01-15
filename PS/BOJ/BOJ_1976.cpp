#include<bits/stdc++.h>
using namespace std;
const int MAX=200+2;
bool impossible=false;
int N,M,parents[MAX];
vector<int> plan;

int do_find(int u){
	if(u==parents[u]) return u;

	return parents[u]=do_find(parents[u]); 
}

void do_union(int u,int v){
	u=do_find(u);
	v=do_find(v);
	if(u==v) return;
	parents[u] = v;
}

int main(){
	ios_base::sync_with_stdio(false);
	cin.tie(0);
	cin>>N>>M;
	for(int i=1;i<=N;i++) parents[i]=i;
	for(int i=1;i<=N;i++){
		for(int j=1;j<=N;j++){
			int connection;
			cin>>connection;
			if(connection){
				do_union(min(i,j),max(i,j));
			}
		}
	}

	while(M--){
		int city;
		cin>>city;
		plan.push_back(city);
	}

	for(int i=0;i<(int)plan.size()-1;i++){
		if(do_find(plan[i])!=do_find(plan[i+1])) impossible=true;
	}

	if(impossible) cout<<"NO\n";
	else cout<<"YES\n";

	return 0;
}
