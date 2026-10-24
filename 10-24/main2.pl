delta('U', [ 1, 0]).
delta('D', [-1, 0]).
delta('L', [ 0,-1]).
delta('R', [ 0, 1]).

deltas(Text, Ds) :-
  atom_chars(Text, Cs),
  maplist(delta, Cs, Ds).

add([DR,DC], [R0,C0], [R,C]) :-
  R is R0+DR, C is C0+DC.

path(Start, Text, End) :-
  deltas(Text, Deltas),
  scanl(add, Deltas, Start, End).

in_grid(N, M, [I, J]) :-
  I > 0, 
  J > 0, J =< M,
  I =< N.

valid([N, M], Text, Start) :-
  Start = [SI, SJ],
  between(1, N, SI),
  between(1, M, SJ),

  path(Start, Text, Path),
  maplist(in_grid(N, M), Path).
