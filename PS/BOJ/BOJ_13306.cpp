// 2021.01.12 extramilejin
// 문제 링크: https://www.acmicpc.net/problem/13306

#include<bits/stdc++.h>
using namespace std;
typedef pair<int,pair<int,int>> ipii;
const int MAX = 200000 + 1;
int N,Q,par[MAX];
stack<ipii> qList;
stack<string> ans;

int doFind(int x){
	if(x==par[x]) return x;
	return par[x]=doFind(par[x]);
}

void doUnion(int a, int b){
	a=doFind(a);
	b=doFind(b);
	if(a==b) return;
	par[a]=b;
}


int main(){
	ios_base::sync_with_stdio(false);
	cin.tie(0);
	cin>>N>>Q;
	for(int i=1;i<=N-1;i++){
		int parNode;
		cin>>parNode;
		par[i+1]=parNode;
	}
	int cnt=N-1+Q;
	while(cnt--){
		int x,b,c,d;
		cin>>x;
		if(!x) {
			cin>>b;
			qList.push({0,{b,par[b]}});
			par[b]=b;
		}
		else{
			cin>>c>>d;
			qList.push({1,{c,d}});
		}
	}
	while(!qList.empty()){
		if(qList.top().first){
			int c=qList.top().second.first;
			int d=qList.top().second.second;
			if(doFind(c)==doFind(d)) ans.push("YES");
			else ans.push("NO");
		}
		else{
			int par=qList.top().second.second;	
			int child=qList.top().second.first;
			doUnion(child,par);
		}
		qList.pop();
	}

	while(!ans.empty()){
		cout<<ans.top()<<"\n";
		ans.pop();
	}
	return 0;
}

