get_day ← {
  month day ← ⍵ ⋄
  day + month ⊃ 0 , +\ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ⋄
}

parse ← {
  ⍎¨ 2 ¯2↑¨ ⊂ ⍵
}

alice_arrive ← '08-15'
alice_leave ← '08-18'
bob_arrive ← '08-16'
bob_leave ← '08-19'

get_days ← {
  ¯1 + (get_day parse ⍺) + ⍳ 1+(get_day parse ⍵)-(get_day parse ⍺)
}

≢ (alice_arrive get_days alice_leave) ∩ (bob_arrive get_days bob_leave)
