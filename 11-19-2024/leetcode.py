def init(nums, k):
    sum = 0
    counts = {}
    for i in range(k):
        sum += nums[i]
        add(counts, nums[i])
    
    max_sum = 0
    if len(counts) == k:
        max_sum = sum
    
    return sum, counts, max_sum

def add(counts, elem):
    if elem not in counts:
        counts[elem] = 0
    counts[elem] += 1

def remove(counts, elem):
    counts[elem] -= 1
    if counts[elem] == 0:
        del counts[elem]

class Solution:
    def maximumSubarraySum(self, nums: List[int], k: int) -> int:
        sum, counts, max_sum = init(nums, k)
        for i in range(1, len(nums)-k+1):
            sum -= nums[i-1]
            sum += nums[i+k-1]
            remove(counts, nums[i-1])
            add(counts, nums[i+k-1])

            if len(counts) == k:
                max_sum = max(max_sum, sum)
                
        return max_sum
