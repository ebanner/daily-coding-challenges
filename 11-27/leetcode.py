def init(n):
    shortest = [[0]*n for _ in range(n)]
    for i in range(n):
        shortest[i][i:n] = range(n-i)
    return shortest

class Solution:
    def shortestDistanceAfterQueries(self, n: int, queries: List[List[int]]) -> List[int]:
        shortest = init(n)
        output = []
        for s, u in queries:
            shortest[s][u] = 1

            # i -> s -> u -> j < i -> j?
            for i in range(s, -1, -1):
                for j in range(u, n):
                    if shortest[i][s] + shortest[s][u] + shortest[u][j] < shortest[i][j]:
                        shortest[i][j] = shortest[i][s] + shortest[s][u] + shortest[u][j]

            output.append(shortest[0][n-1])
        return output

