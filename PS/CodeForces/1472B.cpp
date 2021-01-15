// 2021.01.13 extramilejin
// link: https://codeforces.com/problemset/problem/1472/B

#include<bits/stdc++.h>
using namespace std;
int n,t;

int main(){
	ios_base::sync_with_stdio(false);
	cin.tie(0);
	cin>>t;
	while(t--){
		cin>>n;
		int twoCnt=0;
		int oneCnt=0;
		int total=0;
		while(n--){
			int tmp;
			cin>>tmp;
			total+=tmp;
			if(tmp%2) {
				oneCnt++;
			}
			else {
				twoCnt++;
			}
		}
		if(oneCnt%2) cout<<"NO\n";
		else if(twoCnt%2==0&&oneCnt%2==0) cout<<"YES\n";
		else if(twoCnt%2==1&&oneCnt%2==0&&oneCnt>=2) cout<<"YES\n";
		else cout<<"NO\n";
		// 2가 짝수개, 1도 짝수개
		// 2가 홀수개, 1도 짝수개 >=2
		// 1이 홀수개 바로 false;
	}

	return 0;
}
