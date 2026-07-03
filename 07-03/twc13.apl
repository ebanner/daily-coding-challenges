f ← {⌈/ 0 , (⍵ ⌿⍨ ⍵[;1] ∊ ⍺)[;2]}
{('aeiou'∘f + 'bcdfghjklmnpqrstvwxyz'∘f) {⍺ (≢⍵)} ⌸ ,⍵}'x'
