from heapq import heappop, heappush

MAX_COST = 125000000


def get_costs(grid):
    n = len(grid)
    costs = [[MAX_COST]*n for _ in range(n)]
    costs[0][0] = grid[0][0]
    return costs
    

def get_visited(n):
    visited = [[0]*n for _ in range(n)]
    return visited
    
    
def pop(frontier):
    cost, node = heappop(frontier)
    return node


def push(frontier, neighbor, costs):
    i, j = neighbor
    cost = costs[i][j]
    heappush(frontier, (cost, neighbor))


def get_neighbors(node, n):
    i, j = node
    neighbors = []
    if i > 0: # up
        neighbors.append([i-1, j])
    if i < n-1: # down
        neighbors.append([i+1, j])
    if j > 0: # left
        neighbors.append([i, j-1])
    if j < n-1: # right
        neighbors.append([i, j+1])
    return neighbors
    

class Solution:
    
    #Function to return the minimum cost to react at bottom
    #right cell from top left cell.
    def minimumCostPath(self, grid):
        n = len(grid)
        costs = get_costs(grid)
        visited = get_visited(n)
        frontier = []
        push(frontier, (0, 0), costs)
        while True:
            node = pop(frontier)
            [node_i, node_j] = node
            cost = costs[node_i][node_j]
            visited[node_i][node_j] = 1
            for neighbor in get_neighbors(node, n):
                [neighbor_i, neighbor_j] = neighbor
                if cost + grid[neighbor_i][neighbor_j] < costs[neighbor_i][neighbor_j]:
                    costs[neighbor_i][neighbor_j] = cost + grid[neighbor_i][neighbor_j]
                if [neighbor_i, neighbor_j] == [n-1, n-1]:
                    return costs[n-1][n-1]
                if visited[neighbor_i][neighbor_j] == 0:
                    push(frontier, neighbor, costs)


if __name__ == '__main__':
    result = Solution().minimumCostPath([
        [9, 4, 9, 9],
        [6, 7, 6, 4],
        [8, 3, 3, 7],
        [7, 4, 9, 10]
    ])

    # result = Solution().minimumCostPath([
    #     [4, 4],
    #     [3, 7],
    # ])

    print(result)
