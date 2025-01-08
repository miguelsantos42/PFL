compress([],[]).

compress([X],[X]).

compress([H1,H2|T],[H1|List2]):-
  H1 \= H2,
  compress([H2|T], List2).
  
compress([H1,H2|T],List2):-
  H1 == H2,
  compress([H2|T],List2).