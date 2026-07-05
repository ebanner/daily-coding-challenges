{
  grid (row col) color ← ⍵ ⋄
  mask ← grid = grid[row;col] ⋄
  fill ← 1 @ (⊂ row , col) ⊢ (⍴grid) ⍴ 0 ⋄
  result ← {mask ∧ ⍵ ∨ ⊃ ∨/ (1⌽⍵) (¯1⌽⍵) (1⊖⍵) (¯1⊖⍵)} ⍣ ≡ ⊢ fill ⋄
  grid[⍸result] ← color ⋄
  grid
}

