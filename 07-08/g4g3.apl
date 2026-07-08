{
  n m ← ⍴ ⍵

  P ← (n+2) (m+2) ⍴ 0
  P[1+⍳n;1+⍳m] ← ⍵

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
}
