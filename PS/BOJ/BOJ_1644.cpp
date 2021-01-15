#include<bits/stdc++.h>
using namespace std;
int N,l,r,ans;
vector<int> primes,nums;

   	// ������׽��� ü

void getPrimes(int N){

	nums.resize(N+1,1);		//nums �迭 1�� �ʱ�ȭ

	for(int i=2;i<=sqrt(N);i++){

		if(!nums[i]) continue; 	//� ���� ����� ���� üũ�Ǿ����Ƿ� continue;
		
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

	int vecSize=(int)primes.size(); //�Ҽ� �迭�� ũ��
	int partialSum=0;		// �κ� �� ����

	// �� ������ 
	while(1){
		if(partialSum>=N) partialSum-=primes[l++];   // �κ��� ����
		else if(r==vecSize) break;		     
		else partialSum+=primes[r++];  		     // �κ��� ����	
		if(partialSum==N) ans++; 	             
	}
	cout<<ans<<"\n";
	return 0;
}
