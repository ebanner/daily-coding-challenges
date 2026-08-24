str ← '24:00'

time ← 60 60 ⊤ (÷∘3) 60 ⊥ ⍎¨ ':' chopstring str

join ← {(⍕0⌷⍵) , ':' , (⍕1⌷⍵)}

join time

NB. Piece 1: parse each boxed string to number, obverse formats back to string
numsOf =: (".&>) :. (":&>)

NB. Piece 2: chopstring's inverse — whatever rejoins with ':' between pieces
NB. (I don't know chopstring's exact join counterpart — see note below)
timeStr =: (':'&chopstring) :. joinFn

NB. Full composition: string ↔ total seconds
ToSec =: (60&#.) @ numsOf @ timeStr

NB. The actual verb — divide is done entirely "under" ToSec
MilePace =: dyad : '(%&x) &. ToSec y'
