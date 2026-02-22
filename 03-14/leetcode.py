def can_make_piles(i, candies, k):
    if i == 0:
        return True
    for candy in candies:
        k -= (candy // i)
        if k <= 0:
            return True
    return False

class Solution:
    def maximumCandies(self, candies: List[int], k: int) -> int:
        lo, hi = 0, 10**12
        mid = (hi+lo) // 2
        while True:
            if hi < lo:
                break

            if can_make_piles(mid, candies, k):
                lo = mid + 1
            else:
                hi = mid - 1

            mid = (hi+lo) // 2

        return max(mid, 0)

