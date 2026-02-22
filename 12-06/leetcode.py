class Solution:
    def maxCount(self, banned: List[int], n: int, maxSum: int) -> int:
        num_ints = 0
        for i in range(1, n+1):
            if maxSum - i < 0:
                return num_ints
            
            if i in banned:
                continue

            if maxSum - i >= 0:
                maxSum -= i
                num_ints += 1

        return num_ints

