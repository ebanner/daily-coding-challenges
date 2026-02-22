class Solution:
    def chalkReplacer(self, chalk: List[int], k: int) -> int:
        rem = k % sum(chalk)
        for i, c in enumerate(chalk):
            if c > rem:
                return i
            rem -= c

