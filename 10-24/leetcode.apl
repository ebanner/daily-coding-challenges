get_day ← {
  months ← 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ⋄
  month day ← ⍵ ⋄
  starts ← 0 , +\ months ⋄
  day + starts[month] ⋄
}

parse ← {
  date ← ⍵ ⋄
  month ← ⍎ 2 ↑ date ⋄
  day ← ⍎ ¯2 ↑ date ⋄
  month day
}

alice_arrive ← '08-15'
alice_leave ← '08-18'
bob_arrive ← '08-16'
bob_leave ← '08-19'

alice_arrive ← '10-01'
alice_leave ← '10-31'
bob_arrive ← '11-01'
bob_leave ← '12-31'

get_days ← {
  a ← get_day parse ⍺ ⋄
  b ← get_day parse ⍵ ⋄
  ¯1 + a + ⍳ 1+b-a
}

≢ (alice_arrive get_days alice_leave) ∩ (bob_arrive get_days bob_leave)
