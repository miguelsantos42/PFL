my_last(_,[]).
my_last(X,List):-
  append(_,[X],List).