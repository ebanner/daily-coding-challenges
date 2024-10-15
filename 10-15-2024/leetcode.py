def bubble(s, i, j):
    num_steps = 0
    for k in range(j, i, -1):
        s[k-1], s[k] = s[k], s[k-1]
        num_steps += 1
    return num_steps


class Solution(object):
    def minimumSteps(self, s):
        """
        :type s: str
        :rtype: int
        """
        s = list(s)

        open_idx = 0
        while open_idx < len(s) and s[open_idx] == '0':
            open_idx += 1
        
        zero_idx = open_idx + 1
        while zero_idx < len(s) and s[zero_idx] == '1':
            zero_idx += 1

        num_steps = 0
        while zero_idx < len(s):
            num_steps += bubble(s, open_idx, zero_idx)

            open_idx += 1
            while s[open_idx] == '0':
                open_idx += 1

            zero_idx += 1
            while zero_idx < len(s) and s[zero_idx] == '1':
                zero_idx += 1

        return num_steps

