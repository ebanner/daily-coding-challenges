str ← '24:00'

time ← 60 60 ⊤ (÷∘3) 60 ⊥ ⍎¨ ':' chopstring str

join ← {(⍕0⌷⍵) , ':' , (⍕1⌷⍵)}

numsOf =: (⍎¨) :. (⍕¨)

timeStr =: (':'∘chopstring) :. join

ToSec =: (60∘⊥) @: numsOf @: timeStr

(÷∘3) ⍢ ToSec str

MilePace ← {
(÷∘⍺) ⍢ ToSec ⍵
}

3 MilePace str
