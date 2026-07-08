{
  msg ms←⍵ ⍺
  days←ms÷1000×60×60×24
  days<7 : 'leave it'
  (days≥7)∧(∨/'bump'⍷⎕C msg) : 'close it'
  'bump it'
}