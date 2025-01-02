sum_list(List,Sum):-
  sum_list_helper(List,0,Sum).

sum_list_helper([],Acc,Acc).
sum_list_helper([H|T],Acc,Sum):-
  Acc1 is Acc + H,
  sum_list_helper(T,Acc1,Sum).