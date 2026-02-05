def transpose(box):
    n = len(box)
    m = len(box[0])
    transposed_box = [[0]*n for _ in range(m)]
    for i in range(n):
        for j in range(m):
            transposed_box[j][n-i-1] = box[i][j]
    return transposed_box

def make_stone_fall(stone, transposed_box):
    i, j = stone
    transposed_box[i][j] = '.'
    while i < len(transposed_box)-1 and transposed_box[i+1][j] != '#' and transposed_box[i+1][j] != '*':
        i += 1
    transposed_box[i][j] = '#'

class Solution:
    def rotateTheBox(self, box: List[List[str]]) -> List[List[str]]:
        transposed_box = transpose(box)
        n = len(transposed_box)
        m = len(transposed_box[0])
        for i in range(n-1, -1, -1):
            for j in range(m-1, -1, -1):
                stone = (i, j)
                if transposed_box[i][j] == '#':
                    make_stone_fall(stone, transposed_box)
                    
        return transposed_box
