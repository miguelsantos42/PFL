%%%%%%%1
my_last(X,List):-
  append(_,[X],List).

%%%%%%%3
element_at(X,List,Pos):-
  Pos1 is Pos - 1,
  length(Prefix,Pos1),
  append(Prefix,[X|_],List).

%%%%%%%4
list_size(List,X):-
  list_size_Helper(List,0,X).

list_size_Helper([],Acc,Acc).
list_size_Helper([H|T],Acc,X):-
  Acc1 is Acc + 1,
  list_size_Helper(T,Acc1,X).

%%%%%%%5
reverse_list(List,X):-
  reverse_list_Helper(List,[],X).

reverse_list_Helper([],Acc,Acc).
reverse_list_Helper([H|T], Acc, X):-
  reverse_list_Helper(T,[H|Acc], X).

%%%%%%%6
is_palindrome([]).
is_palindrome([X]).
is_palindrome(List):-
  reverse_list(List,ListReversed),
  List = ListReversed.

%%%%%%%%8
compress(List1,List2):-
  compress_Helper(List1,[],NewList),
  reverse_list(NewList,List2).

compress_Helper([],Acc,Acc).
compress_Helper([H|T],Acc,List2):-
  \+member(H,Acc),
  compress_Helper(T,[H|Acc],List2).
compress_Helper([H|T],Acc,List2):-
  member(H,Acc),
  compress_Helper(T,Acc,List2).

%%%%%%%%%9
pack([],[]).
pack([X],[[X]]).

pack([X,X|Rest],[[X|Sublist]|List]):-
  pack([X|Rest],[Sublist|List]).

pack([Y,Z|Rest],[[Y]|List]):-
  Y \= Z,
  pack([Z|Rest],List).

%%%%%%%%%10
encode(List1,List2):-
  pack(List1,NewList),
  encode_helper(NewList,[],List2).
  
encode_helper([],Acc,Acc).
encode_helper([[H|T]|Rest],Acc,[[H,N]|List2]):-
  length([H|T],N),
  encode_helper(Rest,Acc,List2).

%%%%%%%%%%11
pack1([],[]).
pack1([X],[[X]]).
pack1([X,X|Rest],[[X|Sublist]|List]):-
  pack1([X|Rest],[Sublist|List]).
pack1([Y,Z|T],[[Y]|List]):-
  Y \= Z,
  pack1([Z|T],List).

encode1(List1,List2):-
  pack1(List1,NewList),
  encode1_Helper(NewList,[],ListMid),
  reverse_list(ListMid,List2).

encode1_Helper([],Acc,Acc).
encode1_Helper([[H|T]|Rest],Acc,List2):-
  length([H|T],N),
  N > 1,
  encode1_Helper(Rest,[[N,H]|Acc],List2).
encode1_Helper([[H]|Rest],Acc,List2):-
  encode1_Helper(Rest,[H|Acc],List2).

