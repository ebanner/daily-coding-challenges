class Solution:
    def checkIfExist(self, arr: List[int]) -> bool:
        nums = set()
        for num in arr:
            if (num%2 == 0 and num//2 in nums) or num*2 in nums:
                return True
            nums.add(num)
        return False

