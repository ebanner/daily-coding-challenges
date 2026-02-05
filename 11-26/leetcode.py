class Solution:
    def findChampion(self, n: int, edges: List[List[int]]) -> int:
        nodes = list(range(n))
        for _, u in edges:
            try:
                nodes.remove(u)
            except:
                pass
        
        if len(nodes) == 1:
            return nodes[0]
        else:
            return -1
 
