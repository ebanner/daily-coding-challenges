def get_edit_distance(s1, s2):
    edit_distance = 0
    for c1, c2 in zip(s1, s2):
        if c1 != c2:
            edit_distance += 1
    return edit_distance


def get_nonmatching_chars(s1, s2):
    s1_chars, s2_chars = [], []
    for c1, c2 in zip(s1, s2):
        if c1 != c2:
            s1_chars.append(c1)
            s2_chars.append(c2)
    return s1_chars, s2_chars


class Solution:
    def areAlmostEqual(self, s1: str, s2: str) -> bool:
        edit_distance = get_edit_distance(s1, s2)
        if edit_distance > 2:
            return False

        s1_chars, s2_chars = get_nonmatching_chars(s1, s2)

        return sorted(s1_chars) == sorted(s2_chars)

