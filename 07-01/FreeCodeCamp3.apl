name ← 'John Doe'

names ← (≠∘' '⊆⊢) name

v1 v2 ← {+/ +/ 'aeiou' ∘.= ⎕C ⍵}¨ names

c1 c2 ← {+/ +/ 'bcdfghjklmnpqrstvwxyz' ∘.= ⎕C ⍵}¨ names

l1 l2 ← ≢¨ names

lucky ← ⌈ -/ (l1 l2[⍒l1 l2]) × (c1 c2[⍒c1 c2]) × v1 v2[⍒v1 v2]

⎕ ← lucky
