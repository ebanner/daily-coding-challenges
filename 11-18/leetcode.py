def get_zeros(code):
    zeros = [0]*len(code)
    return zeros

def compute_sum(code, k):
    lookahead_sum = 0
    for j in range(1, abs(k)+1):
        if k < 0:
            j *= -1
        lookahead_sum += code[(0+j) % len(code)]
    return lookahead_sum

class Solution:
    def decrypt(self, code: List[int], k: int) -> List[int]:
        result = get_zeros(code)
        lookahead_sum = compute_sum(code, k)
        result[0] = lookahead_sum
        if k > 0:
            indexes = range(1, len(code))
        else:
            indexes = range(len(code)-1, 0, -1)
        for i in indexes:
            lookahead_sum -= code[i]
            lookahead_sum += code[(i+k) % len(code)]
            result[i] = lookahead_sum
        return result
