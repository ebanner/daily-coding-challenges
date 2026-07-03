alpha ← ⎕UCS 96+⍳26

word ← 'programming'

+/ (⌈/ +/ (alpha ~ 'aeiou') ∘.= word) (⌈/ +/ 'aeiou' ∘.= word)

{≢⍵}⌸

{⍺ (≢ ⍵)}⌸ 'mississippi'

m ← {⍺ (≢⍵)} ⌸ 'mississippi'

(m[;1] ∊ 'aeiou')

vowel count ← ∊ (m[;1] ∊ 'aeiou') ⌿ m

'aeiou' 'bcdfghjklmnpqrstvwxyz' ({⌈/ (⍵ ⌿⍨ ⍵[;1] ∊ ⍺[1])[;2]} + {⌈/ (⍵ ⌿⍨ ⍵[;1] ∊ ⍺[2])[;2]}) m

({⌈/ (⍵ ⌿⍨ ⍵[;1] ∊ 'aeiou' )[;2]} + {⌈/ (⍵ ⌿⍨ ⍵[;1] ∊ 'bcdfghjklmnpqrstvwxyz')[;2]}) m

v ← 'aeiou'
c ← 'bcdfghjklmnpqrstvwxyz'
({⌈/ (⍵ ⌿⍨ ⍵[;1] ∊ v)[;2]} + {⌈/ (⍵ ⌿⍨ ⍵[;1] ∊ c)[;2]}) m
