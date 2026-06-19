prefixes←(⍳≢arr)↑¨⊂arr
f←{+/|⍵-⍵[⌊1+(≢⍵)÷2]}
⎕←f¨prefixes
