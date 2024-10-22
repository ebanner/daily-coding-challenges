def get_subsets(indices, s):
    i = 0
    subsets = []
    for j in indices:
        subset = s[i:j+1]
        subsets.append(subset)
        i = j+1
    subset = s[i:]
    subsets.append(subset)
    return subsets


def is_valid(indices, s):
    subsets = get_subsets(indices, s)
    valid = len(subsets) == len(set(subsets))
    return valid


def get_largest_unique_split(indices, i, s):
    if not is_valid(indices, s):
        return -1
    if i == len(s)-1:
        return len(indices)+1
    else:
        return max(
            get_largest_unique_split(indices+[i], i+1, s), # split
            get_largest_unique_split(indices, i+1, s), # no split
        )


class Solution:
    def maxUniqueSplit(self, s: str) -> int:
        largest_unique_split = get_largest_unique_split([], 0, s)
        return largest_unique_split
