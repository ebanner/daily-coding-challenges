class Solution:
    def queryResults(self, limit: int, queries: List[List[int]]) -> List[int]:
        colors = {}
        painted = {}
        results = []
        for x, y in queries:
            if x in painted:
                color = painted[x]
                colors[color].remove(x)
                if colors[color] == []:
                    del colors[color]

            if y not in colors:
                colors[y] = []
            
            colors[y].append(x)
            painted[x] = y

            num_distinct_colors = len(colors.keys())
            result = num_distinct_colors
            results.append(result)
            
        return results

