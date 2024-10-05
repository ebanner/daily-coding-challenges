def get_counts(s):
    counts = {}
    for c in s:
        add(c, counts)
    return counts


def remove(c, letter_counts):
    letter_counts[c] -= 1
    if letter_counts[c] == 0:
        del letter_counts[c]


def add(c, counts):
    if c not in counts:
        counts[c] = 0
    counts[c] += 1


def get_num_matching(s1_counts, window_counts):
    num_matching = 0
    for key in s1_counts:
        if s1_counts[key] == window_counts.get(key):
            num_matching += 1
    return num_matching


class Solution:
    def checkInclusion(self, s1: str, s2: str) -> bool:
        window_size = len(s1)
        window_counts = get_counts(s2[:window_size])
        s1_counts = get_counts(s1)
        
        num_matching = get_num_matching(s1_counts, window_counts)
        if num_matching == len(s1_counts):
            return True

        for i in range(1, len(s2)-window_size+1):
            a = s2[i-1]
            if s1_counts.get(a, -1) == window_counts.get(a, -2):
                num_matching -= 1
            
            remove(a, window_counts)
            
            if s1_counts.get(a, -1) == window_counts.get(a, -2):
                num_matching += 1
            
            b = s2[i+window_size-1]

            if s1_counts.get(b, -1) == window_counts.get(b, -2):
                num_matching -= 1

            add(b, window_counts)

            if s1_counts.get(b, -1) == window_counts.get(b, -2):
                num_matching += 1

            if num_matching == len(s1_counts):
                return True

        return False

