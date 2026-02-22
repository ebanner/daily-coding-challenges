def get_balls(limit):
    balls = [None]*(limit+1)
    return balls

def mark(balls, query):
    [i, color] = query
    balls[i] = color

def get_num_distinct(balls):
    distinct_colors = set(balls)
    try:
        distinct_colors.remove(None)
    except:
        pass
    num_distinct = len(distinct_colors)
    return num_distinct

class Solution:
    def queryResults(self, limit: int, queries: List[List[int]]) -> List[int]:
        balls = get_balls(limit)
        results = []
        for query in queries:
            mark(balls, query)
            result = get_num_distinct(balls)
            results.append(result)
        return results
        
