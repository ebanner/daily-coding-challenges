patterns ← 'a' 'abc' 'bc' 'd'
word ← 'abc'

⎕ ← +/ patterns ∘.(∨/⍤⍷) ⊂ word
