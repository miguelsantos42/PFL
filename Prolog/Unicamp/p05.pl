reverse_list([],[]).
reverse_list(List1,List2):-
  reverse_list_helper(List1,[],List2).

reverse_list_helper([],Acc,Acc).
reverse_list_helper([H|T],Acc,List2):-
  reverse_list_helper(T,[H|Acc],List2).