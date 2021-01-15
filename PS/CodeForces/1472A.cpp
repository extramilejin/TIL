// 2021.01.13 extramilejin
// link: https://codeforces.com/problemset/problem/1472/A

#include<bits/stdc++.h>

using namespace std;
int n,w,h,t;
int main(){
	ios_base::sync_with_stdio(false);
	cin.tie(0);
	cin>>t;
	while(t--){
		cin>>w>>h>>n;
		int wcnt=0,hcnt=0;
		while(w%2==0){
			wcnt++;
			w/=2;
		}
		while(h%2==0){
			hcnt++;
			h/=2;
		}
		if(pow(2,(wcnt+hcnt))>=n) cout<<"YES\n";
		else cout<<"NO\n";
	}
	return 0;
}
