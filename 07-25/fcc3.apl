grid ← ↑ (0 0 1) (0 1 0) (0 0 1)

n m ← ⍴ grid

pad ← ⌈/ , grid

p ← (-pad) ⊖ (-pad) ⌽ ((pad×2) + ⍴ grid) ↑ grid

(-2×pad) + ⊃ ⍸ ⊃ ∧/ (⍸p) {0@(⊂⍺) ⊢ 1@(((⍵[1]-1) + ⍳ pad + 1 + pad) ∘., (⍵[2]-1) + ⍳ pad + 1 + pad)⊢(⍴p)⍴0}¨ ⍸grid
