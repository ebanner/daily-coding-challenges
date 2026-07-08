mat ← ↑ (1 2 2 3 5) (3 2 3 4 4) (2 4 5 3 1) (6 7 1 4 5) (5 1 1 2 4)

mat ← ↑ (2 2) (2 2)

n m ← ⍴ mat

P ← (n+2) (m+2) ⍴ 0
P[1+⍳n;1+⍳m] ← mat

step ← {⍵∨⊃∨/((¯1⊖⍵)∧P≥¯1⊖P) ((1⊖⍵)∧P≥1⊖P) ((¯1⌽⍵)∧P≥¯1⌽P) ((1⌽⍵)∧P≥1⌽P)}

⍝ p

mask ← (n+2) (m+2) ⍴ 0
mask[1+⍳n;2] ← 1
mask[2;1+⍳m] ← 1

p ← step ⍣≡ ⊢ mask

⍝ q

mask ← (n+2) (m+2) ⍴ 0
mask[1+⍳n;m+1] ← 1
mask[n+1;1+⍳m] ← 1

q ← step ⍣≡ ⊢ mask

+/ , p ∧ q
