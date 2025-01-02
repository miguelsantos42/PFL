%%%%%%%1
%%%a
male(frank).
male(jay).
male(javier).
male(merle).
male(phil).
male(mitchell).
male(cameron). % Example of a homosexual relationship. This affects how we define siblings!
male(joe).
male(manny).
male(bo).
male(dylan).

female(grace).
female(dede).
female(gloria).
female(barb).
female(claire).
female(pameron).
female(haley).

parent(grace,phil).
parent(frank,phil).

parent(dede,claire).
parent(jay,claire).
parent(dede,mitchell).
parent(jay,mitchell).

parent(jay,joe).
parent(gloria,joe).

parent(gloria,manny).
parent(javier,manny).

parent(barb,cameron).
parent(merle,cameron).
parent(barb,pameron).
parent(merle,pameron).

parent(phil,haley).
parent(claire,haley).
parent(phil,alex).
parent(claire,alex).
parent(phil,luke).
parent(claire,luke).

parent(mitchell,lily).
parent(cameron,lily).
parent(mitchell,rexford).
parent(cameron,rexford).

parent(pameron,calhoun).
parent(bo,calhoun).

% Casais na árvore genealógica
married(jay, gloria).
married(gloria, jay).

married(jay, dede).
married(dede, jay).

married(gloria, javier).
married(javier, gloria).

married(cameron, mitchell).
married(mitchell, cameron).

married(phil, claire).
married(claire, phil).

married(haley, dylan).
married(dylan, haley).

married(pameron, bo).
married(bo, pameron).

%%%c
%%1
father(X,Y) :- male(X), parent(X,Y).
%%2
grandparent(X,Z) :- male(X), parent(X,Y), parent(Y,Z).
%%3
grandmother(X,Z) :- female(X), parent(X,Y), parent(Y,Z).
%%4
siblings(X,Y) :- parent(Z,X), parent(Z,Y), X \= Y.
%%5
halfsiblings(X,Y) :- parent(Z,X), parent(Z,Y), parent(V,X), parent(W,Y), X \= Y, Z \= V, V \= W, Z \= W.
%%6
cousins(X,Y) :- parent(W,X), parent(V,Y), siblings(W,V).
%%7a
uncle(X,Y) :- siblings(X,K), parent(K,Y), male(X), X \= K.
%%7b
uncle1(X,Y) :- parent(W,Y), siblings(Z,W), married(X,W), male(X).

%%%e
married(Person1, Person2, Year).
divorce(Person1, Person2, Year).

%%%%%%%%%%%%%%%%%%%%%%%%%2

%%%a
% Professores e os cursos que ensinam
teaches(adalberto, algorithms).
teaches(bernardete, databases).
teaches(capitolino, compilers).
teaches(dalmindo, statistics).
teaches(ermelinda, networks).

% Estudantes e os cursos que frequentam
attends(alberto, algorithms).
attends(bruna, algorithms).
attends(cristina, algorithms).
attends(diogo, algorithms).
attends(eduarda, algorithms).

attends(antonio, databases).
attends(bruno, databases).
attends(cristina, databases).
attends(duarte, databases).
attends(eduardo, databases).

attends(alberto, compilers).
attends(bernardo, compilers).
attends(clara, compilers).
attends(diana, compilers).
attends(eurico, compilers).

attends(antonio, statistics).
attends(bruna, statistics).
attends(claudio, statistics).
attends(duarte, statistics).
attends(eva, statistics).

attends(alvaro, networks).
attends(beatriz, networks).
attends(claudio, networks).
attends(diana, networks).
attends(eduardo, networks).

%%%%c
%%c1
is_student_of(X,Y) :- attends(X,Course), teaches(Y, Course).

%%c2
student_of(X,Y) :- teaches(X,Course), attends(Y,Course).

%%c3
teachers_of(X,Y) :- attends(X, Course), teaches(Y,Course).

%%c4
both(X,Y,Z) :- attends(Z, Course1), attends(Z, Course2), teaches(X,Course1), teaches(Y, Course2), X \= Y, Course1 \= Course2.

%%c5
colleagues(X,Y) :- attends(X,Course), attends(Y,Course), X \= Y.

%%c6
student_more_one_course(X) :- attends(X, Course1), attends(X, Course2), Course1 @< Course2.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%3

%%a)
% Pilots
pilot(lamb).
pilot(besenyei).
pilot(chambliss).
pilot(maclean).
pilot(mangold).
pilot(jones).
pilot(bonhomme).

% Teams
team(lamb, breitling).
team(besenyei, red_bull).
team(chambliss, red_bull).
team(maclean, mediterranean_racing_team).
team(mangold, cobra).
team(jones, matador).
team(bonhomme, matador).

% Aircraft
aircraft(lamb, mx2).
aircraft(besenyei, edge540).
aircraft(chambliss, edge540).
aircraft(maclean, edge540).
aircraft(mangold, edge540).
aircraft(jones, edge540).
aircraft(bonhomme, edge540).

% Circuits
circuit(istanbul).
circuit(budapest).
circuit(porto).

% Wins
winner(jones, porto).
winner(mangold, budapest).
winner(mangold, istanbul).

% Gates in circuits
gates(istanbul, 9).
gates(budapest, 6).
gates(porto, 5).

% Team wins if one of its pilots wins
team_wins(Team, Circuit) :-
    winner(Pilot, Circuit),
    team(Pilot, Team).

%%%%%%%b
pilot_not_drive_edge540(Pilot):-
  aircraft(Pilot,Plane),
  Plane \= edge540.

pilot_won_more_than_one(Pilot):-
  winner(Pilot, Circuit1), winner(Pilot, Circuit2), Circuit1 \= Circuit2.

plain_ruled_pilot(Aircraft):-
  winner(X,porto), aircraft(X,Aircraft).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%4
code_error(1, 'Integer Overflow').
code_error(2, 'Division by zero').
code_error(3, 'ID Unknown').

translate(Code, Meaning):-
  code_error(Code, Meaning).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5

job(technician, eleuterio).
job(technician, juvenaldo).
job(analyst, leonilde).
job(analyst, marciliano).
job(engineer, osvaldo).
job(engineer, porfirio).
job(engineer, reginaldo).
job(supervisor, sisnando).
job(chief_supervisor, gertrudes).
job(secretary, felismina).
job(director, asdrubal).
supervised_by(technician, engineer).
supervised_by(engineer, supervisor).
supervised_by(analyst, supervisor).
supervised_by(supervisor, chief_supervisor).
supervised_by(chief_supervisor, director).
supervised_by(secretary, director).

%%%a e b 
%%i) qual é a posição na empresa do sisnando sabendo que vigia o analista? Supervisor
%ii) quem supervisiana aquele que supervisiona o técnico? Supervisor
%iii) quem são os engenheiros e os analistas que são supervisionados pelo supervisor? leonilde, marciliano, osvaldo, porfirio, reginaldo 
%iv) qual o trabalho daquele que é supervisionado pelo asdrubal e qual o seu nome? gertrudes

%%%c
%i)
superviser(X,Y) :- job(X,Job1), job(Y,Job2), supervised_by(Job2, Job1).

%ii) 
superviser_turbo(X,Y) :- job(X,Job1), job(Y,Job2), supervised_by(Job1, Chief1), supervised_by(Job2, Chief2), Chief1 = Chief2.

%%iii)
supervises_multiple_jobs(X) :- job(X, Job), supervised_by(Job1, Job), supervised_by(Job2, Job), Job1 \= Job2.

%iv) 
superviser_of_supervisor(X,Y) :-  job(X,Job1), job(Y,Job2), supervised_by(Job1,X1), supervised_by(Job2,Y2), supervised_by(Y2,X1).