height←2 5 4 3 7
widths heights←(1-⍨∘.-⍨⍳≢height)(∘.⌊⍨height)
⎕←⌈/⌈/widths×heights
