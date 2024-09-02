MAX_COST = 125000000


def get_costs(grid):
    n = len(grid)
    costs = [[MAX_COST]*n for _ in range(n)]
    costs[0][0] = grid[0][0]
    return costs
    

def get_visited(n):
    visited = [[0]*n for _ in range(n)]
    return visited
    
    
def pop_lowest(frontier, costs):
    min_node = None
    min_cost = MAX_COST
    for [node_i, node_j] in frontier:
        cost = costs[node_i][node_j]
        if cost < min_cost:
            min_node = [node_i, node_j]
            min_cost = cost
    frontier.remove(min_node)
    return min_node


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
        frontier = [[0, 0]]
        while True:
            node = pop_lowest(frontier, costs)
            [node_i, node_j] = node
            # print('popped', node)
            cost = costs[node_i][node_j]
            # print('cost', cost)
            visited[node_i][node_j] = 1
            for neighbor in get_neighbors(node, n):
                [neighbor_i, neighbor_j] = neighbor
                if cost + grid[neighbor_i][neighbor_j] < costs[neighbor_i][neighbor_j]:
                    # print(f'setting neighbor {neighbor} = cost {cost + grid[neighbor_i][neighbor_j]}')
                    costs[neighbor_i][neighbor_j] = cost + grid[neighbor_i][neighbor_j]
                if [neighbor_i, neighbor_j] == [n-1, n-1]:
                    return costs[n-1][n-1]
                if visited[neighbor_i][neighbor_j] == 0:
                    # print('putting neighbor on the frontier:', neighbor)
                    frontier.append([neighbor_i, neighbor_j])


if __name__ == '__main__':
    Solution().minimumCostPath([
        [9, 4, 9, 9],
        [6, 7, 6, 4],
        [8, 3, 3, 7],
        [7, 4, 9, 10]
    ])

    # Solution().minimumCostPath([
    #     [4, 4],
    #     [3, 7],
    # ])
