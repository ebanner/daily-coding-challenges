prime_(N) :-
  N1 is N - 1,
  \+ (
    between(2, N1, D),
    N mod D =:= 0
  ).

prime(P) :-
    between(2, inf, P),
    prime_(P).

main(N, P) :-
  call_nth(prime(P), N).

