v←'aeiou'
c←'bcdfghjklmnpqrstvwxyz'
{({⌈/(⍵⌿⍨⍵[;1]∊v)[;2]}+{⌈/(⍵⌿⍨ ⍵[;1]∊c)[;2]}){⍺(≢⍵)}⌸⍵}


