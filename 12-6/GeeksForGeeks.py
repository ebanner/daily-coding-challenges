class Solution:
    def hIndex(self, citations):
        sorted_citations = sorted(citations)
        n = len(citations)
        
        i = 0
        for possible_h in range(max(citations)+1):
            while True:
                if i < n and sorted_citations[i] >= possible_h:
                    break
                i += 1
                
            num_papers = n-i
            if num_papers >= possible_h:
                h = possible_h
            else:
                return h

        return h

