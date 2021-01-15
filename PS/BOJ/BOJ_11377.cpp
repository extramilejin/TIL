//2021.01.10 extramilejin

//Problem Link: https://www.acmicpc.net/problem/11377

#include<bits/stdc++.h>
using namespace std;

const int MAX = 1000 + 1;
int workers[MAX],tasks[MAX],N,M,K;
bool visited[MAX];
vector<vector<int>> canDo;

bool dfs(int a){
	if(visited[a]) return false;
	visited[a] = true;
	for(int i=0;i<(int)canDo[a].size();i++) {// worker a가 할 수 있는 일 탐색.
		int b = canDo[a][i];
		if(!tasks[b]||dfs(tasks[b])) {
			tasks[b] = a;
			workers[a] = b;
			return true;
		}
	}
	return false;
}

int biMatching(){						
	int ans = 0;
	for(int i=1;i<=N;i++){	// 최대 매칭 한 번 진행.
		memset(visited,0,sizeof(visited));
		if(dfs(i)) ans++;
	}
   
	for(int i=1;i<=N;i++){	// 매칭이 끝나고 일을 2번 할 수있는 K명의 직원과 일을 매칭.
		memset(visited,0,sizeof(visited));
		if(dfs(i)){ 
			ans++; 
			K--;
			if(!K) break;
		}
	}
	return ans;
}

int main(){
	ios_base::sync_with_stdio(false);
	cin.tie(0);
	cin>>N>>M>>K;
	canDo.resize(N+1);
	for(int i=1;i<=N;i++) {
		int cnt;
		cin>>cnt;
		while(cnt--){
			int taskNum;
			cin>>taskNum;
			canDo[i].push_back(taskNum); // i번째 직원이 할 수 있는일 저장.
		}
	}
	cout<<biMatching()<<"\n";	

	return 0;
}
