def get_num_whites(window):
    num_whites = 0
    for block in window:
        if block == 'W':
            num_whites += 1 
    return num_whites

class Solution:
    def minimumRecolors(self, blocks: str, k: int) -> int:
        min_num_whites = 100
        for i in range(len(blocks)-k+1):
            window = blocks[i:i+k]
            num_whites = get_num_whites(window)
            if num_whites < min_num_whites:
                min_num_whites = num_whites
        
        return min_num_whites
