def isBSTRecursive(node):
    if node == None:
        return True, -float('inf'), float('inf')

    is_bst_left, left_min, left_max = isBSTRecursive(node.left)
    is_bst_right, right_min, right_max = isBSTRecursive(node.right)
    
    if left_min == -float('inf'):
        left_max = -float('inf')
        
    if right_max == float('inf'):
        right_min = float('inf')

    node_result = left_max < node.data < right_min
    
    left_min = left_min if left_min != -float('inf') else node.data
    right_max = right_max if right_max != float('inf') else node.data
    
    return node_result and \
        is_bst_left and is_bst_right, left_min, right_max

class Solution:
    def isBST(self, root):
        result, _, _ = isBSTRecursive(root)
        return result

