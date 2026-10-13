:- use_module(library(clpfd)).

magic_square(R1, R2, R3) :-
  length(R1, M),
  length(R2, M),
  length(R3, M),
  M = 3,
  append([R1, R2, R3], Elems),
  Elems ins 1..50,
  all_distinct(Elems),
  sum(R1, #=, N),
  sum(R2, #=, N),
  sum(R3, #=, N),
  label(Elems).

% magic_square([2, 7, 6], [9, E, 1], [4, 3, 8]),
% format("~w~n~w~n~w~n", [[2, 7, 6], [9, E, 1], [4, 3, 8]]).

% magic_square([12, 17, 16], [19, E3, 10], [14, 13, 18]),
% format("~w~n~w~n~w~n", [[12, 17, 16], [19, E3, 10], [14, 13, 18]]).
