mat ← ↑ (1 2) (0 5)

odds ← ⍸ 1 = 2 | ⍳≢mat

⎕ ← , (⌽⍤1 @ odds) mat
