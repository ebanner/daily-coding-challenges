communicate(Grid, C1, C2) :-
  member(C1, Grid),
  member(C2, Grid),

  C1 \== C2,

  [I1, J1] = C1,
  [I2, J2] = C2,

  (I1 =:= I2 ; J1 =:= J2).

main(Grid, N) :-
  findall(
    C,
    communicate(Grid, C, _),
    Cs_
  ),
  sort(Cs_, Cs), % dedup
  length(Cs, N).
