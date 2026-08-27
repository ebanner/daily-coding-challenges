str ← '24:00'

f ← (60∘⊥) @: ((⍎¨) :. (⍕¨)) @: ((':'∘chopstring) :. {(⍕0⌷⍵),':',(⍕1⌷⍵)})

(÷∘3) ⍢ f str

MilePace ← {
  (÷∘⍺) ⍢ f ⍵
}

3 MilePace str
