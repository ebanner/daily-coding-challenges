grid ← ↑ (('G' 'B' 'G' 'B') ('R' 'B' 'B' 'G') ('B' 'G' 'B' 'R') ('B' 'G' 'G' 'B'))

grid

mask ← grid = 'B'

mask

fill ← (⍴ grid) ⍴ 0

fill[3;3] ← 1

fill

mask ∧ fill ∨ ⊃ ∨/ (1⌽fill) (¯1⌽fill) (1⊖fill) (¯1⊖fill)

result ← {mask ∧ ⍵ ∨ ⊃ ∨/ (1⌽⍵) (¯1⌽⍵) (1⊖⍵) (¯1⊖⍵)} ⍣ ≡ ⊢ fill

grid[⍸result] ← 'G'

grid

expected ← ↑ (('G' 'G' 'G' 'B') ('R' 'G' 'G' 'G') ('B' 'G' 'G' 'R') ('B' 'G' 'G' 'B'))

expected

grid
