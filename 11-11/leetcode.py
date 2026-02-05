import math

def is_prime(num):
    if num == 2:
        return True

    for i in range(2, math.ceil(math.sqrt(num))+1):
        if num % i == 0:
            return False
    return True

class Solution:
    def primeSubOperation(self, nums: List[int]) -> bool:
        prev_num = -1
        for num in nums:
            for i in range(num-1, 1, -1):
                if not is_prime(i):
                    continue
                
                p = i
                if num-p > prev_num:
                    prev_num = num-p
                    break
            else:
                if not prev_num < num:
                    return False
                prev_num = num
        return True
