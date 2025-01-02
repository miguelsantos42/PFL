last_element([H|T],Last):-
  last_element_helper(T,H,Last).

last_element_helper([],Acc,Acc).
last_element_helper([H|T],_,Last):-
  last_element_helper(T,H,Last).