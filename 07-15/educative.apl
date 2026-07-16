edges ← (1 2) (1 3) (2 3)

vertices ← ∪ ∊ edges

u v ← edge

parent ← {⊃⊃ groups[⍸ ⍵∘{⍺∊⍵}¨ groups]}

get ← {⊃ groups[⍸ ⍵∘{⍺=⊃⍵}¨ groups]}

union ← {
  (⊂ ∪ (get ⍵[1]) , (get ⍵[2])) , (⊂ get ⍵[2]) ~⍨ ⍺ ~ (⊂ get ⍵[1])
}

groups ← ,¨ vertices

(groups union (parent u) (parent v))

groups

groups ← (parent 1) union (parent 3)

groups

groups ← (parent 2) union (parent 3)

{⍺ union (parent ⍵[1]) (parent ⍵[2]) }\ (⊂ groups) , edges
