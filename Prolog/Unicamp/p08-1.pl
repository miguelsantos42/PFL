compress([H],[H]).
compress([H,H|T],X):-
  compress([H|T],X).
compress([H1,H2|T],X):-
  H1 =\= H2,
  compress(T,X).