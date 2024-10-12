class Solution(object):
    def minAddToMakeValid(self, s): 
        """ 
        :type s: str
        :rtype: int
        """
        num_open = 0 
        num_left = 0
        for c in s:
            if c == '(':
                num_open += 1
            else:
                if num_open == 0:
                    num_left += 1
                else:
                    num_open -= 1
        num_right = num_open
        
        return num_left + num_right

