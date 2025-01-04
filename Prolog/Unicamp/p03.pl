element_at(X,[X|_],1).
element_at(X,[_|List],Pos):-
  Pos > 1,
  Pos1 is Pos - 1,
  element_at(X,List,Pos1).