def get_num_negative(matrix):
    num_negative = sum(1 for row in matrix for elem in row if elem < 0)
    return num_negative

def matin(key, matrix):
    for row in matrix:
        for elem in row:
            if elem == key:
                return True
    return False

def matabs(matrix):
    n = len(matrix)
    mat = [[0]*n for row in range(n)]
    for i in range(n):
        for j in range(n):
            mat[i][j] = abs(matrix[i][j])
    return mat

def matsum(matrix):
    sum = 0
    for row in matrix:
        for elem in row:
            sum += elem
    return sum

def matmin(matrix):
    min_elem = 100001
    for row in matrix:
        for elem in row:
            min_elem = min(elem, min_elem)
    return min_elem

class Solution:
    def maxMatrixSum(self, matrix: List[List[int]]) -> int:
        num_negative = get_num_negative(matrix)
        if num_negative % 2 == 0 or matin(0, matrix):
            return matsum(matabs(matrix))
        else:
            return matsum(matabs(matrix)) - 2*matmin(matabs(matrix))

