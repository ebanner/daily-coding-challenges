parse ← {
  m←+\(1×⍵='(')+(¯1×⍵=')') ⋄
  mm←(-∘1@(⍸⍵='('))m ⋄
  mmm←¯1@(⍸(mm=0)∧⍵∊'()')⊢mm ⋄
  (2⌊mmm+1)⊆⍵
}

eval ← {
  ∧/3='()'⍳⍵ : ⌽⍵ ⋄
  ⌽⊃,/eval¨parse ⍵
}

main ← {
  ⊃,/eval¨parse ⍵
}
