name ← 'Elizabeth Hernandez'

cons ← 'bcdfghjklmnpqrstvwxyz'

first last ← (≠∘' '⊆⊢) name

v1 v2 ← (+/ +/ 'aeiou' ∘.= ⎕C first) (+/ +/ 'aeiou' ∘.= ⎕C last)

c1 c2 ← (+/ +/ cons ∘.= ⎕C first) (+/ +/ cons ∘.= ⎕C last)

V v ← v1 v2[⍒v1 v2]

C c ← c1 c2[⍒c1 c2]

l1 l2 ← (≢first) (≢last)

L l ← l1 l2[⍒l1 l2]

lucky ← ⌈ (L × C × V) - l × c × v

⎕ ← lucky

