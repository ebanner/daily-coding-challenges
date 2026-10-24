% n = 2
% m = 3

delta('U', [ 1, 0]).
delta('D', [-1, 0]).
delta('L', [ 0,-1]).
delta('R', [ 0, 1]).


deltas(Text, Ds) :-
    atom_chars(Text, Cs),
    maplist(delta, Cs, Ds).


add([DR,DC], [R0,C0], [R,C]) :-
  R is R0+DR, C is C0+DC.


move(Start, Text, End) :-
  deltas(Text, Deltas),
  foldl(add, Deltas, Start, End).


valid(N, M, [DI, DJ]) :-
  Start = [SI, SJ],
  between(1, N, SI),
  between(1, M, SJ),

  move(Start, 'LLRU', [DI, DJ]),

  DI > 0,
  DJ > 0, DJ =< M,
  DI =< N.
