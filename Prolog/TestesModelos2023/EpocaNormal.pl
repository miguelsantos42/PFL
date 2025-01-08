:-dynamic saga/4, movie/8.

%saga(SagaID, Saga Name, Number of Movies in Saga, Creator)
saga(1, 'Jurassic Park',  6, 'Michael Crichton').
saga(2, 'Indiana Jones',  4, 'George Lucas').
saga(3, 'Star Wars',      9, 'George Lucas').
saga(4, 'Harry Potter',   0, 'J. K. Rowling').
saga(6, 'Jaws',           0, 'Peter Benchley').

%movie(Movie Title, Year of Release, SagaID, Duration, IMDB Score, Director, Composer, Cast)
movie('Jurassic Park',                  1993, 1, 127, 8.2, 'Steven Spielberg', 'John Williams',     ['Sam Neill', 'Jeff Goldblum', 'Laura Dern', 'BD Wong']).
movie('The Lost World: Jurassic Park',  1997, 1, 129, 6.5, 'Steven Spielberg', 'John Williams',     ['Jeff Goldblum', 'Julianne Moore', 'Vince Vaughn', 'Richard Schiff']).
movie('Jurassic Park III',              2001, 1,  92, 5.9, 'Joe Johnston',     'Don Davis',         ['Sam Neill', 'William H. Macy', 'Téa Leoni']).
movie('Jurassic World',                 2015, 1, 124, 6.9, 'Colin Trevorrow',  'Michael Giacchino', ['Chris Pratt', 'Bryce Dallas Howard', 'Irrfan Khan', 'BD Wong']).
movie('Jurassic World: Fallen Kingdom', 2018, 1, 128, 6.1, 'J.A. Bayona',      'Michael Giacchino', ['Chris Pratt', 'Bryce Dallas Howard', 'James Cromwell', 'BD Wong']).
movie('Jurassic World: Dominion',       2022, 1, 147, 5.6, 'Colin Trevorrow',  'Michael Giacchino', ['Chris Pratt', 'Bryce Dallas Howard', 'Campbell Scott', 'BD Wong']).

movie('Raiders of the Lost Ark',       1981, 2, 115, 8.4, 'Steven Spielberg', 'John Williams', ['Harrison Ford', 'Karen Allen', 'John Rhys-Davies']).
movie('The Temple of Doom',            1984, 2, 118, 7.5, 'Steven Spielberg', 'John Williams', ['Harrison Ford', 'Kate Capshaw', 'Ke Huy Quan']).
movie('The Last Crusade',              1989, 2, 127, 8.2, 'Steven Spielberg', 'John Williams', ['Harrison Ford', 'Alison Doody', 'Sean Connery']).
movie('Kingdom of the Crystal Skull',  2008, 2, 122, 6.2, 'Steven Spielberg', 'John Williams', ['Harrison Ford', 'Karen Allen', 'Shia LaBeouf']).

movie('The Phantom Menace',       1999, 3, 136, 6.5, 'George Lucas',     'John Williams', ['Ewan McGregor', 'Liam Neeson', 'Natalie Portman', 'Ian McDiarmid']).
movie('Attack of the Clones',     2002, 3, 142, 6.6, 'George Lucas',     'John Williams', ['Ewan McGregor', 'Hayden Christensen', 'Natalie Portman', 'Christopher Lee']).
movie('Revenge of the Sith',      2005, 3, 140, 7.6, 'George Lucas',     'John Williams', ['Ewan McGregor', 'Hayden Christensen', 'Natalie Portman', 'Christopher Lee']).
movie('A New Hope',               1977, 3, 121, 8.6, 'George Lucas',     'John Williams', ['Harrison Ford', 'Mark Hamill', 'Carrie Fisher', 'Alec Guinness']).
movie('The Empire Strikes Back',  1980, 3, 124, 8.7, 'Irvin Kershner',   'John Williams', ['Harrison Ford', 'Mark Hamill', 'Carrie Fisher', 'Billy Dee Williams']).
movie('Return of the Jedi',       1983, 3, 131, 8.3, 'Richard Marquand', 'John Williams', ['Harrison Ford', 'Mark Hamill', 'Carrie Fisher', 'Ian McDiarmid']).
movie('The Force Awakens',        2015, 3, 138, 7.8, 'J. J. Abrams',     'John Williams', ['Daisy Ridley', 'Harrison Ford', 'Mark Hamill', 'Carrie Fisher']).
movie('The Last Jedi',            2017, 3, 152, 6.9, 'Rian Johnson',     'John Williams', ['Daisy Ridley', 'Mark Hamill', 'Carrie Fisher', 'John Boyega']).
movie('The Rise of Skywalker',    2019, 3, 141, 6.4, 'J. J. Abrams',     'John Williams', ['Daisy Ridley', 'Mark Hamill', 'John Boyega', 'Adam Driver']).

%%1
%saga(SagaID, Saga Name, Number of Movies in Saga, Creator)
%movie(Movie Title, Year of Release, SagaID, Duration, IMDB Score, Director, Composer, Cast)

same_saga(Movie1, Movie2):-
  movie(Movie1,_,SagaID,_,_,_,_,_),
  movie(Movie2,_,SagaID,_,_,_,_,_),
  Movie1 \= Movie2.

%%2
movie_from_saga(Movie, Saga):-
  movie(Movie,_,SagaID,_,_,_,_,_),
  saga(SagaID,Saga,_,_).

%%3
saga_longest_movie(Saga, Movie):-
  saga(SagaID,Saga,_,_),
  movie(Movie,_,SagaID,Duration1,_,_,_,_),
  \+ (
    movie(_,_,SagaID,Duration2,_,_,_,_), 
    Duration2 > Duration1
  ).

/*

\+
append()
retract, assert

*/

%%4
/*
 retract(movie('Jurassic Park', _, _ , _ ,_,).
 asserta(movie('Novo filme', _,_,_,_,_)).
*/
%saga(SagaID, Saga Name, Number of Movies in Saga, Creator)
%movie(Movie Title, Year of Release, SagaID, Duration, IMDB Score, Director, Composer, Cast)
add_movie_to_saga(Saga, Movie, Year, Duration, Score, Director, Composer, Cast) :-
  saga(SagaID,Saga,_,_),
  movie(Movie,Year,Saga,Duration,Score,Director,Composer,Cast), !, fail.
add_movie_to_saga(Saga, Movie, Year, Duration, Score, Director, Composer, Cast) :-
  saga(SagaID,Saga,Number_Movies,Creator),
  Number_Movies1 is Number_Movies + 1,
  retract(saga(SagaID,Saga,Number_Movies,Creator)),
  assertz(saga(SagaID,Saga,Number_Movies1,Creator)),
  assertz(movie(Movie,Year,Saga,Duration,Score,Director,Composer,Cast)).

%%5
movies_from_saga(Saga, Movies):-
  saga(SagaID,Saga,_,_),
  movie_from_saga_help(SagaID,[],MoviesList),
  sort(MoviesList, SortedMovies),
  remove_year(SortedMovies, MoviesReverse),
  reverse(MoviesReverse,Movies).

movie_from_saga_help(SagaID, Movies, Movies) :-
  saga(SagaID, _, No, _),
  length(Movies, No).
movie_from_saga_help(SagaID, Acc, Movies):-
  movie(Title,Year,SagaID,_,_,_,_,_),
  \+ member(Year-Title, Acc), !,
  movie_from_saga_help(SagaID,[Year-Title|Acc],Movies).

remove_year([],[]).
remove_year([Year-Title | Remaining], [Title | Movies]) :-
  remove_year(Remaining,Movies).

reverse(MoviesReverse,Movies):-
  reverse_Helper(MoviesReverse,[],Movies).

reverse_Helper([],Acc,Acc).
reverse_Helper([H|T],Acc,Movies):-
  reverse_Helper(T,[H|Acc],Movies).

%%6
%saga(SagaID, Saga Name, Number of Movies in Saga, Creator)
%movie(Movie Title, Year of Release, SagaID, Duration, IMDB Score, Director, Composer, Cast)
saga_cast(Saga, Cast):-
  saga(SagaID,Saga,_,_),
  findall(Actor,(movie(_,_,SagaID,_,_,_,_,CastList),member(Actor,CastList)),Actors),
  sort(Actors,Cast).

%%7
sample_cast(Saga, Cast):-
  saga_cast(Saga,CastList),
  sample_cast_Helper(CastList,[],CastReversed),
  reverse(CastReversed,Cast).

sample_cast_Helper([],Acc,Acc).
sample_cast_Helper([H,_|T],Acc,Cast):-
  sample_cast_Helper(T,[H|Acc],Cast).

%%8
composer_rating(Composer, AvgScore):-
  findall(Score,(movie(_,_,_,_,Score,_,Composer,_)),ScoreList),
  composer_rating_Helper(ScoreList,0,Score1),
  score_final(Score1,ScoreList,AvgScore).

composer_rating_Helper([],Acc,Acc).
composer_rating_Helper([H|T],Acc,Score1):-
  Acc1 is Acc + H,
  composer_rating_Helper(T,Acc1,Score1).

score_final(Score1,ScoreList,AvgScore):-
  length(ScoreList,N),
  AvgScore is Score1 / N.

%%14
connected(Person1, Person2):-
    connected2(Person1, Person2),
    Person1 \= Person2.
connected(Person1, Person2):-
    connected2(Person2, Person1),
    Person1 \= Person2.
    
connected2(Person1, Person2):-
    movie(_T, _Y, _S, _D, _Sc, Person1, Person2, _).
connected2(Person1, Person2):-
    movie(_T, _Y, _S, _D, _Sc, Person1, _C, Cast),
    member(Person2, Cast).
connected2(Person1, Person2):-
    movie(_T, _Y, _S, _D, _Sc, _Dir, Person1, Cast),
    member(Person2, Cast).
connected2(Person1, Person2):-
    movie(_T, _Y, _S, _D, _Sc, _Dir, _Comp, Cast),
    member(Person1, Cast),
    member(Person2, Cast).

%%14

/*
connected_degree(Origin, Dest, Degree) :-
  bfs([[Origin]-[]], Dest, Connections),
  write(Connections),
  length(Connections, Degree).

bfs([[Dest | _ ]-Connections | _], Dest, Connections).
bfs([[Current | Remaining]-CurrentConnections | FuturePaths], Dest, Solution) :-
  findall([Connection, Current | Remaining]-[Connection | CurrentConnections], (
    connected(Connection, Current),
    \+ member(Connection, [Current | Remaining])
  ), PossibleConnections),
  append(PossibleConnections, FuturePaths, NewFuturePaths),
  bfs(NewFuturePaths, Dest, Solution).

*/

connected_degree(Origin, Dest, Degree) :-
  bfs([[Origin]], Dest, Path),
  length(Path, Degree).

bfs([[Dest | Path] | _], Dest, Path) :- !.
bfs([[CurrentPerson | NextPersons] | FuturePaths], Dest, Degree) :-
  findall(NextPerson, (
    connected(CurrentPerson, NextPerson),
    \+ member(NextPerson, [CurrentPerson | NextPersons])
  ), List),
  sort(List, SortedList), % [Diogo, Pedro, Miguel]
  append_all(SortedList, [CurrentPerson | NextPersons], ToSee),
  append(FuturePaths, ToSee, NewFuturePaths), % [[], [], []]
  bfs(NewFuturePaths, Dest, Degree).

append_all([], _ , []).
append_all([CurrentName | FutureNames], List, [[CurrentName | List] | Rest]) :-
  append_all(FutureNames, List, Rest).

/*

append_all([], _List, []).
append_all([H|T], List, [ [H|List] |NT]):-
	append_all(T, List, NT).


[[Marco | Pedro | Joaquim] | [] | [] | []]
[Diogo | Miguel | António]

append_all([Diogo | Miguel | António], [[Marco | Pedro | Joaquim] | [] | [] | []], )

*/