class Solution(object):
    def minimumSteps(self, s):
        """
        :type s: str
        :rtype: int
        """
        open_idx = 0
        while open_idx < len(s) and s[open_idx] == '0':
            open_idx += 1

        zero_idx = open_idx + 1
        while zero_idx < len(s) and s[zero_idx] == '1':
            zero_idx += 1

        num_steps = 0
        while zero_idx < len(s):
            num_steps += zero_idx - open_idx

            open_idx += 1

            zero_idx += 1
            while zero_idx < len(s) and s[zero_idx] == '1':
                zero_idx += 1

        return num_steps
