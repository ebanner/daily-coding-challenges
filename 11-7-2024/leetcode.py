def get_binary(num):
    return list(map(int, format(num, '032b')))

def get_bitmask(candidates):
    bitmask = []
    for candidate in candidates:
        row = get_binary(candidate)
        bitmask.append(row)
    return bitmask

class Solution:
    def largestCombination(self, candidates: List[int]) -> int:
        n = len(candidates)
        bitmask = get_bitmask(candidates)
        max_ones = 1
        for j in range(32):
            num_ones = 0
            for i in range(n):
                if bitmask[i][j] == 1:
                    num_ones += 1
            if num_ones > max_ones:
                max_ones = num_ones
        return max_ones

