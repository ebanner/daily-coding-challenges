def get_bitmask(grid):
    m, n = len(grid), len(grid[0])
    bitmask = [[0]*n for _ in range(m)]
    return bitmask


def set_first_column_to_ones(bitmask):
    m, n = len(bitmask), len(bitmask[0])
    for i in range(m):
        bitmask[i][0] = 1
    return bitmask


def fill_next_column(column_number, bitmask, grid):
    m, n = len(bitmask), len(bitmask[0])
    for i in range(m):
        if bitmask[i][column_number] == 0:
            continue
        
        # up right
        if i != 0:
            if grid[i-1][column_number+1] > grid[i][column_number]:
                bitmask[i-1][column_number+1] = 1
        
        # right
        if column_number != n-1:
            if grid[i][column_number+1] > grid[i][column_number]:
                bitmask[i][column_number+1] = 1

        # down right
        if i != m-1:
            if grid[i+1][column_number+1] > grid[i][column_number]:
                bitmask[i+1][column_number+1] = 1

    return bitmask


def get_furtherst_column_with_a_one_in_it(bitmask):
    m, n = len(bitmask), len(bitmask[0])
    for j in range(n):
        for i in range(m):
            if bitmask[i][j] == 1:
                break
        else:
            return j-1
    return n-1


class Solution:
    def maxMoves(self, grid: List[List[int]]) -> int:
        m, n = len(grid), len(grid[0])

        bitmask = get_bitmask(grid) # bitmask of size mxn with zeros
        bitmask = set_first_column_to_ones(bitmask)
        for column_number in range(n-1):
            bitmask = fill_next_column(column_number, bitmask, grid)
        
        column = get_furtherst_column_with_a_one_in_it(bitmask)
        max_moves = column
        return max_moves
