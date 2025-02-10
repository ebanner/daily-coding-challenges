class Solution:
    def clearDigits(self, s: str) -> str:
        i = 0
        n = len(s)
        S = list(s)
        while True:
            if i >= n:
                break

            if S[i].isnumeric():
                del S[i]
                del S[i-1]
                n -= 2
                i -= 1
            else:
                i += 1

        result = ''.join(S)
        return result

