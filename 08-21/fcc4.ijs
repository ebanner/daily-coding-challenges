str ← '24:00'

split ← chopstring

join ← {(⍕0⌷⍵),⍺,(⍕1⌷⍵)}

3 {(÷∘⍺) ⍢ ((60∘⊥) @: ((⍎¨) :. (⍕¨)) @: ((':'∘split) :. (':'∘join))) ⍵} str
