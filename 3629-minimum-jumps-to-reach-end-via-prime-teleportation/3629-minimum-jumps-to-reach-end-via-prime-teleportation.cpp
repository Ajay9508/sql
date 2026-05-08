class Solution {
public:
vector<bool>isprime;
    void buildSieve(int maxElemt){
        isprime.resize(maxElemt+1,true);
        isprime[0]=false;
        isprime[1]=false;
        for(int num=2;num*num <=maxElemt;num++){
            if(isprime[num]){
                for(int m=num*num;m<=maxElemt;m+=num){
                    isprime[m]=false;
                }
            }
        }
    };
    int minJumps(vector<int>& nums) {
        int n= nums.size();
        int count=0;
        unordered_map<int,vector<int>>mp; //map  
        int maxElemt =0;
        for(int i=0;i<n;i++){
            mp[nums[i]].push_back(i);
            maxElemt =max(maxElemt,nums[i]); 
        }
        //for prime number
        buildSieve(maxElemt);
        queue<int>que;
        vector<bool>visited(n,false);
        que.push(0);
        visited[0]=true;
        unordered_set<int> seen;
        while(!que.empty()){
            int size = que.size();
            while(size--){
                int i=que.front();
                que.pop();
                if(i==n-1){
                    return count;
                }
                if(i-1>0&&!visited[i-1]){
                    que.push(i-1);
                    visited[i-1]=true;
                }
                if(i+1<=n-1&&!visited[i+1]){
                    que.push(i+1);
                    visited[i+1]=true;
                }
                if(!isprime[nums[i]] || seen.count(nums[i])){
                    continue;
                }
                for(int m = nums[i];m<=maxElemt;m+=nums[i]){
                    if(!mp.contains(m)){
                        continue;
                    }
                    for(int &j : mp[m]){
                        if(!visited[j]){
                        que.push(j);
                        visited[j]=true;
                        }
                    }
                }
                seen.insert(nums[i]);

            }
            count++;
        }
        return count;
    }
};