class Solution:
    def queryResults(self, limit: int, queries: List[List[int]]) -> List[int]:
        balls = {}
        results = []
        for i, color in queries:
            balls[i] = color
            distinct_colors = set(balls.values())
            num_distinct = len(distinct_colors)
            result = num_distinct
            results.append(result)
        return results

