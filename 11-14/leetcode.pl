slice(List, [I, J], Slice) :-
  length(Prefix, I),
  append(Prefix, Rest, List),
  N is J - I + 1,
  length(Slice, N),
  append(Slice, _, Rest).

subarray(Nums, Sub) :-
  length(Nums, N),
  Last is N - 1,
  between(0, Last, I),
  between(I, Last, J),
  slice(Nums, [I, J], Sub).

main(Nums, [L, R], Result) :-
  aggregate_all(
    min(Sum),
    ( 
      subarray(Nums, Sub),
      length(Sub, N),
      L =< N, N =< R,
      sum_list(Sub, Sum),
      Sum > 0
    ),
    Result
  ).
