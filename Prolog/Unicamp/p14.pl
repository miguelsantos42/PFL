dupli([],[]).
dupli([H|T],[H,H|List]):-
  dupli(T,List).