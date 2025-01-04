compress([],[]).

compress([H],[H]).

compress([H,H|T],List2):-
  compress([H|T],List2).

compress([H1,H2|T],[H1|List2]):-
  H1 \= H2,
  compress([H2|T], List2).
