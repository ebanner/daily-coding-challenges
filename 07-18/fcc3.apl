dice ← 6
target ← 35

result ← {¯4 ⌽ {+/⍵} ⌺ 6 ⊢ ⍵} ⍣ (dice-1) ⊢ 1 @ (4+⍳6) ⊢ (4⍴0) , ((6×dice)⍴0) , (6⍴0)



⌊ 0.5 + (+/ result) ÷ result[4 + target]
