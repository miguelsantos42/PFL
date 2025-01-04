list_size([],0).
list_size(List,Total):-
  list_size_helper(List,0,Total).

list_size_helper([],Acc,Acc).
list_size_helper([_|T],Acc,Total):-
  Acc1 is Acc + 1,
  list_size_helper(T,Acc1,Total).