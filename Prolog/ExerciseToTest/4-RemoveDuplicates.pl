remove_Duplicates(List,NewList):-
  remove_Duplicates_Helper(List,[],ReverseList),
  reverse(ReverseList,NewList).

remove_Duplicates_Helper([],Acc,Acc).
remove_Duplicates_Helper([H|T],Acc,NewList):-
  member(H,Acc),
  remove_Duplicates_Helper(T,Acc,NewList).

remove_Duplicates_Helper([H|T],Acc,NewList):-
  \+member(H,Acc),
  remove_Duplicates_Helper(T,[H|Acc],NewList).

