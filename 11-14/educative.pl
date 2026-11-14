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

main(Nums, Result) :-
  aggregate_all(
    sum(Sum),
    ( 
      subarray(Nums, Sub),
      length(Sub, N),
      N mod 2 =:= 1,
      sum_list(Sub, Sum)
    ),
    Result
  ).
