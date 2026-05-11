class Solution {
    public int[] separateDigits(int[] nums) {
        ArrayList<Integer> arrlist = new ArrayList<>();
        for(int i=0;i<nums.length;i++){
            int num= nums[i];
            Stack<Integer> st =new Stack<>();
        while(num>0){
            st.push(num%10);
            num/=10;
        }
        while(!st.isEmpty()){
            arrlist.add(st.pop());
        }
        }
        int n = arrlist.size();
        int []ans = new int[n];
        for(int i=0;i<n;i++){
            ans[i]=arrlist.get(i);
        }
        return ans;
    }
}