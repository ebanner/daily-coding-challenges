edges ← (1 2) (2 3) (4 2)

vertices ← ∪ ∊ edges

adj ← ∘.=⍨ ⍳(≢ vertices)

{(⍵⌷adj) ← 1 ⋄ ((⌽⍵)⌷adj) ← 1}¨ edges

⍸ ∧/ adj
