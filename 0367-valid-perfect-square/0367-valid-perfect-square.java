class Solution {
    public boolean isPerfectSquare(int num) {
     if(num<0) return false;
     long left =1;
     long right = num;
     while(left<=right){
        long mid = left+(right-left)/2;
        long res = mid*mid;
        if(res == num){
            return true;
        }else if(res<num){
        left = mid+1;
        }else
             right = mid-1;
     }
     return false;
    }
}