def get_level_sums(root):
    frontier = [root]
    level_sums = []
    while frontier:
        level_sum = sum(node.val for node in frontier)
        level_sums.append(level_sum)

        new_frontier = []
        for node in frontier:
            if node.left:
                new_frontier.append(node.left)
            if node.right:
                new_frontier.append(node.right)

        frontier = new_frontier
    return level_sums


def largest(arr, k):
    if k > len(arr):
        return -1
    kth_largest = list(sorted(arr))[-k]
    return kth_largest


# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def kthLargestLevelSum(self, root: Optional[TreeNode], k: int) -> int:
        level_sums = get_level_sums(root)
        kth_largest_sum = largest(level_sums, k)
        return kth_largest_sum
        
