class Node:
    def __init__(self, present=False, children=None):
        self.present = present
        self.children = children or {}
    
    def __str__(self):
        return f"present: {self.present}, children: {self.children}"


def add(elem, trie):
    root = trie
    node = root
    for digit in elem:
        if digit not in node.children:
            node.children = {**{digit: Node()}, **node.children}
        node = node.children[digit]
    node.present = True
    return root


def make_trie(arr):
    root = Node()
    for elem in arr:
        add(elem, root)
    return root


def get_longest_common_prefix(elem, trie):
    prefix = []
    node = trie
    for digit in elem:
        if digit in node.children:
            prefix.append(digit)
            node = node.children[digit]
        else:
            return ''.join(prefix)
    return ''.join(prefix)


class Solution:
    def longestCommonPrefix(self, arr1: List[int], arr2: List[int]) -> int:
        arr1 = list(map(str, arr1))
        arr2 = list(map(str, arr2))
        arr2_trie = make_trie(arr2)
        max_longest_common_prefix = ''
        for a in arr1:
            longest_common_prefix = get_longest_common_prefix(a, arr2_trie)
            if len(longest_common_prefix) > len(max_longest_common_prefix):
                max_longest_common_prefix = longest_common_prefix
        return len(max_longest_common_prefix)
