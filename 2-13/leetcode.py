from heapq import heappush as push, heappop as pop, heapify

class Solution:
    def minOperations(self, nums: List[int], k: int) -> int:
        heap = nums
        heapify(nums)

        num_ops = 0
        while True:
            x = pop(heap)
            if x >= k:
                break

            y = pop(heap)
            z = min(x, y) * 2 + max(x, y)
            push(heap, z)

            num_ops += 1

        return num_ops

