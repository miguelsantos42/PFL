pack([],[]).
pack([X],[[X]]).

pack([X,X|T],[[X|Sublist]|List]):-
  pack([X|T],[Sublist|List]).

pack([Y,Z|T],[[Y]|List]):-
  Y \= Z,
  pack([Z|T],List).

encode(List1,List2):-
  pack(List1,NewList),
  encode_Helper(NewList,[],List2).

encode_Helper([],Acc,Acc).
encode_Helper([[H|T]|Rest],Acc,[[H,N]|List2]):-
  length([H|T],N),
  encode_Helper(Rest,Acc,List2).