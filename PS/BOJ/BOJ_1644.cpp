#include<bits/stdc++.h>
using namespace std;
int N,l,r,ans;
vector<int> primes,nums;

   	// 에라토네스의 체

void getPrimes(int N){

	nums.resize(N+1,1);		//nums 배열 1로 초기화

	for(int i=2;i<=sqrt(N);i++){

		if(!nums[i]) continue; 	//어떤 수의 배수인 수로 체크되었으므로 continue;
		
		for(int j=2*i;j<=N;j+=i){
			nums[j]=0;
		}
	}

	for(int i=2;i<=N;i++)if(nums[i]) primes.push_back(i);
	
	return;
}

int main(){
	ios_base::sync_with_stdio(false);
	cin.tie(0);

	cin>>N;

	getPrimes(N);

	int vecSize=(int)primes.size(); //소수 배열의 크기
	int partialSum=0;		// 부분 합 변수

	// 투 포인터 
	while(1){
		if(partialSum>=N) partialSum-=primes[l++];   // 부분합 감소
		else if(r==vecSize) break;		     
		else partialSum+=primes[r++];  		     // 부분합 증가	
		if(partialSum==N) ans++; 	             
	}
	cout<<ans<<"\n";
	return 0;
}
