{
  mat (n m)←⍵ (⍴⍵)
  P←(n+2) (m+2)⍴0 ⋄ P[1+⍳n;1+⍳m]←mat
  step←{⍵∨((¯1⊖⍵)∧P≥¯1⊖P)∨((1⊖⍵)∧P≥1⊖P)∨((¯1⌽⍵)∧P≥¯1⌽P)∨((1⌽⍵)∧P≥1⌽P)}
  pmask←(n+2) (m+2)⍴0 ⋄ pmask[1+⍳n;2]←1 ⋄ pmask[2;1+⍳m]←1
  qmask←(n+2) (m+2)⍴0 ⋄ qmask[1+⍳n;m+1]←1 ⋄ qmask[n+1;1+⍳m]←1
  +/,(step⍣≡⊢pmask)∧(step⍣≡⊢qmask)
}
