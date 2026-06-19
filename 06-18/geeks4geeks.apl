mat ← ↑ (1 1 1 0) (1 0 0 1)

n m ← ⍴ mat

f ← {
  i j ← ⍵ ⋄
  (∨/ mat[⍳i;j]) + (∨/ mat[i;⍳j]) + (∨/ mat[i+⍳n-i;j]) + (∨/ mat[i;j+⍳m-j])
}

⎕ ← + / f¨ ⍸ 0 = mat
