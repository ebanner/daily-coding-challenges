alice_arrive ← '08-15'
alice_leave ← '08-18'
bob_arrive ← '08-16'
bob_leave ← '08-19'

{
  get_days ← {
    a b ← ⍵ ⋄
    get_day ← {m d←⍵ ⋄ d+m⊃0,+\31 28 31 30 31 30 31 31 30 31 30 31} ⋄
    parse ← {⍎¨2 ¯2↑¨⊂⍵} ⋄
    ¯1+(get_day parse a)+⍳1+b-⍥(get_day parse)a
  } ⋄
  ≢⍺∩⍥get_days⍵
}

alice_arrive alice_leave f bob_arrive bob_leave
