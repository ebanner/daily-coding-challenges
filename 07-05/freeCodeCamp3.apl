grid ← ↑ ('G' 'B' 'G' 'B') ('R' 'B' 'B' 'G') ('B' 'G' 'B' 'R') ('B' 'G' 'G' 'B')
row col ← 3 3
color ← 'G'

{
  grid (row col) color ← ⍵ ⋄
  mask ← grid = grid[row;col] ⋄
  fill ← (⍴ grid) ⍴ 0 ⋄
  fill[row;col] ← 1 ⋄
  result ← {mask ∧ ⍵ ∨ ⊃ ∨/ (1⌽⍵) (¯1⌽⍵) (1⊖⍵) (¯1⊖⍵)} ⍣ ≡ ⊢ fill ⋄
  grid[⍸result] ← color ⋄
  grid
} grid (row col) color

expected ← ↑ (('G' 'G' 'G' 'B') ('R' 'G' 'G' 'G') ('B' 'G' 'G' 'R') ('B' 'G' 'G' 'B'))
expected
