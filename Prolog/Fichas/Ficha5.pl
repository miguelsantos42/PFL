%%%1
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

%a)
children(Person, Children):-
  findall(Child,parent(Person,Child),Children).

%%%4
%flight(origin, destination, company, code, hour, duration)
flight(porto, lisbon, tap, tp1949, 1615, 60).
flight(lisbon, madrid, tap, tp1018, 1805, 75).
flight(lisbon, paris, tap, tp440, 1810, 150).
flight(lisbon, london, tap, tp1366, 1955, 165).
flight(london, lisbon, tap, tp1361, 1630, 160).
flight(porto, madrid, iberia, ib3095, 1640, 80).
flight(madrid, porto, iberia, ib3094, 1545, 80).
flight(madrid, lisbon, iberia, ib3106, 1945, 80).
flight(madrid, paris, iberia, ib3444, 1640, 125).
flight(madrid, london, iberia, ib3166, 1550, 145).
flight(london, madrid, iberia, ib3163, 1030, 140).
flight(porto, frankfurt, lufthansa, lh1177, 1230, 165).

direct_flight(O,D,Code):-
  flight(O,D,_,Code,_,_).

source_or_dest(N) :- direct_flight(N,_,_).
source_or_dest(N) :- direct_flight(_,N,_).

%%%a)
get_all_nodes(L):-
  findall(N, source_or_dest(N),Nodes),
  sort(Nodes,L).

%%%c)
find_flights(Ni,Nf,Fs):-
  dfs([Ni],NF,Fs).

dfs([NF|_],NF,[]).
dfs([Na|T],NF,[F|Fs]):-
  direct_flight(Na,Nb,F),
  \+member(Nb,[Na|T]),
  dfs([Nb,Na|T],Nf,Fs).

%%%d)
find_flights_bfs(Ni,Nf,Fs):-
  get_all_nodes(Ns),
  member(Ni,Ns),
  bfs([[Ni]-[]],Nf,L),
  reverse(L,Fs).

bfs([[Nf|_]-Fs|_],Nf,Fs).
bfs([[Na|T]-Fs|Ns],Nf,Sol):-
  findall([Nb,Na|T]-[F|Fs],(
    direct_flight(Na,Nb,F),
    \+member(Nb,[Na|T]),
  ),Ns1),
  append(Ns,Ns1,Ns2),
  bfs(Ns2,Nf,Sol).

