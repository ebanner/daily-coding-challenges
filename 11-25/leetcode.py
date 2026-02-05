def get_zero(board):
    new_board = [row[:] for row in board]
    for i in range(len(board)):
        for j in range(len(board[0])):
            if board[i][j] == 0:
                return i, j

def left(board):
    new_board = [row[:] for row in board]
    i, j = get_zero(board)
    if j == 0:
        return None
    new_board[i][j-1], new_board[i][j] = 0, new_board[i][j-1]
    return new_board

def right(board):
    new_board = [row[:] for row in board]
    i, j = get_zero(board)
    if j == len(board[0])-1:
        return None
    new_board[i][j+1], new_board[i][j] = 0, new_board[i][j+1]
    return new_board

def up(board):
    new_board = [row[:] for row in board]
    i, j = get_zero(board)
    if i == 0:
        return None
    new_board[i-1][j], new_board[i][j] = 0, new_board[i-1][j]
    return new_board

def down(board):
    new_board = [row[:] for row in board]
    i, j = get_zero(board)
    if i == len(board)-1:
        return None
    new_board[i+1][j], new_board[i][j] = 0, new_board[i+1][j]
    return new_board

def is_goal(board):
    return board[0][0] == 1 and board[0][1] == 2 and board[0][2] == 3 and \
           board[1][0] == 4 and board[1][1] == 5 and board[1][2] == 0

class Solution:
    def slidingPuzzle(self, board: List[List[int]]) -> int:
        frontier = [board]
        visited = []
        level = 0
        while frontier:
            new_frontier = []
            for board in frontier:
                if is_goal(board):
                    return level
                visited.append(board)
                left_board = left(board)
                if left_board not in visited and left_board:
                    new_frontier.append(left_board)
                right_board = right(board)
                if right_board not in visited and right_board:
                    new_frontier.append(right_board)
                up_board = up(board)
                if up_board not in visited and up_board:
                    new_frontier.append(up_board)
                down_board = down(board)
                if down_board not in visited and down_board:
                    new_frontier.append(down_board)
            frontier = new_frontier
            level += 1
        return -1

