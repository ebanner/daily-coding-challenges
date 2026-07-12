{
  n m←⍴⍵
  padded←(n+2) (m+2)⍴0 ⋄ padded[1+⍳n;1+⍳m]←grid
  step←{(⍵∧1⌽⍵)⌈(⍵∧¯1⌽⍵)⌈(⍵∧1⊖⍵)⌈(⍵∧¯1⊖⍵)}
  0<+/,1=step⍣≡⊢padded
}

