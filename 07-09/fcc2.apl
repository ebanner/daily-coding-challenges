{
  (0=≢⍺)∧(∨/'bug'⍷⍵)∨(∨/'error'⍷⍵) : ('bug' 'needs triage')
  (0=≢⍺)∧(∨/'feature'⍷⍵)∨(∨/'add'⍷⍵) : ('enhancement' 'discussing')
  ((⊂'discussing')∊⍺) ∧ ((∨/'planned'⍷⍵)∨(∨/'next'⍷⍵)) : (⊂'on the roadmap'),⍺~⊂'discussing'
  ((⊂'needs triage')∊⍺) : (⊂'help wanted'),⍺~⊂'needs triage'
  ((⊂'discussing')∊⍺) : (⊂'help wanted'),⍺~⊂'discussing'
  (∨/'security'⍷⍵) : (⊂'critical'),⍺
}
