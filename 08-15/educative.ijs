arr ← 5 1 4

'a b c' ← ⍉ (3 3 3) ⊤ ⍳ 3*3

idxs ← ((3 3 3) ⊤ ⍳ 3*3) ≢⍨ (a < b) ∧ (b ≤ c)

idxs

i ← 0
j ← 1
k ← 2

w1 ← j ↓ (k+1) ↑ arr

w2 ← i ↓ j ↑ arr

(⊕/ w1) = ⊕/ w2

