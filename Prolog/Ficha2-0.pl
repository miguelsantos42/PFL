%%1

r(a, b). 
r(a, d). 
r(b, a). 
r(a, c). 
s(b, c). 
s(b, d). 
s(c, c). 
s(d, e). 

%%a)
%i) r(X, Y), s(Y, Z) -> r(a, b) s(b, c) / r(a, b) s(b, d)/ r(a, d) s(d, e) / r(a, c) s(c, c).
%ii) s(Y, Y), r(X, Y) ->  s(c, c) r(a, c).
%iii) r(X, Y), s(Y, Y) ->  r(a, c) s(c, c).


%%b)

%2
pairs(X, Y):- d(X), q(Y). pairs(X, X):- u(X). u(1). d(2). d(4). q(4). q(16).

%3

a(a1, 1). 
a(A2, 2). 
a(a3, N). 
b(1, b1). 
b(2, B2). 
b(N, b3). 
c(X, Y):- a(X, Z), b(Z, Y). 
d(X, Y):- a(X, Z), b(Y, Z). 
d(X, Y):- a(Z, X), b(Z, Y). 


%%%4
%a)
factorial(0,1).
factorial(N,F):-
  N > 0,
  N1 is N-1,
  factorial(N1, F1),
  F is F1 * N. 

%b)
sum_rec(1,1).
sum_rec(N, Sum):-
  N > 1,
  N1 is N-1,
  sum_rec(N1, Sum1),
  Sum is Sum1 + N.

%c)
pow_rec(_,0,1).
pow_rec(N,Y,S):-
  Y > 0,
  Y1 is Y - 1,
  pow_rec(N, Y1, S1),
  S is S1 * N.

%d)
square_rec(N, S):-
  square_rec_helper(N,N,0,S).

square_rec_helper(N,0,Acc,Acc).
square_rec_helper(N,Count,Acc,S):-
  Count > 0,
  Count1 is Count-1,
  Acc1 is Acc + N,
  square_rec_helper(N,Count1,Acc1,S).

%e)
fibonacci(0,0).
fibonacci(1,1).
fibonacci(N, F):-
  N > 1,
  N1 is N - 1,
  N2 is N - 2,
  fibonacci(N1, F1),
  fibonacci(N2, F2),
  F is F1 + F2. 

%f) 
collatz(1,0).
collatz(N,S):-
  N > 1,
  (N mod 2 =:= 0 -> N1 is N // 2; N1 is 3 * N + 1),
  collatz(N1, S1),
  S is S1 + 1.

%g)?????????????????????????????????????????????


%%%5
%a)
factorial1(N,P) :- factorial_helper(N,1,P).

factorial_helper(0,Acc,Acc).
factorial_helper(N,Acc,F):-
  N >= 1,
  Acc1 is Acc * N,
  N1 is N - 1,
  factorial_helper(N1,Acc1,F).

%b)
sum1(N,S) :- sum1_helper(N,0,S).

sum1_helper(0,Acc,Acc).
sum1_helper(N,Acc,F):-
  N >= 1,
  Acc1 is Acc + N,
  N1 is N - 1,
  sum1_helper(N1,Acc1,F).

%c)
pow_rec1(X,Y,P) :- pow_rec_helper(X,Y,1,P).

pow_rec_helper(X,0,Acc,Acc).
pow_rec_helper(X,Y,Acc,R):-
  Y >= 1,
  Acc1 is Acc * X,
  Y1 is Y - 1,
  pow_rec_helper(X,Y1,Acc1,R).

%d)
square_rec1(N, S):- square_rec1_helper(N,N,0,S).

square_rec1_helper(_,0,Acc,Acc).
square_rec1_helper(N,Count,Acc,S):-
  Count >= 1,
  Count1 is Count - 1,
  Acc1 is Acc + N,
  square_rec1_helper(N,Count1,Acc1,S).


%e)
fibonacci1(N,F) :- fibonacci1_helper(N,0,1,F).

fibonacci1_helper(0,Acc,_,Acc).
fibonacci1_helper(N,Acc1,Acc2,F):-
  N > 0,
  R is Acc1 + Acc2,
  N1 is N-1,
  fibonacci1_helper(N1,Acc2,R,F).


%%%6)
%a)
gcd(X, 0, X).
gcd(X,Y,G):-
  Y > 0,
  R is X mod Y,
  gcd(Y,R,G).

%b)
lcm(X, Y, M):-
  gcd(X,Y,G),
  M is (X * Y)/G.


%%%7)
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


%%a)
ancestor_of(X,Y):- parent(X,Y).
ancestor_of(X,Y):-
  parent(X,Z),
  ancestor_of(Z,Y).

%%b)
descendant_of(X, Y):- parent(Y,X).
descendant_of(X,Y):-
  parent(Y,Z),
  descendant_of(X,Z).

%%c)
married(john, mary, 1990). 
divorced(john, mary, 2000).

married(peter, anna, 2005). 
divorced(peter, anna, 2015).

married(john, sarah, 2002).
divorced(john, sarah, 2012).


marriage_years(X, Y, Years) :- 
  married(X,Y,Start),
  divorced(X,Y,Divorce),
  Years is Divorce - Start.

%%d)
%i) descendant_of(X,gloria), \+, descendant_of(X,Jay). 
%ii) ancestor_of(haley, X), ancestor_of(lily,X).

%%e)
born(jay, 1946-5-23). 
born(claire, 1970-11-13). 
born(mitchell, 1973-7-10). 

%i) 
before(X, Y):-
  born(X, Y1-M1-D1),
  born(Y, Y2-M2-D2),
  (Y1 < Y2;
  (Y1 =:= Y2, M1 < M2);
  (Y1 =:= Y2, M1 =:= M2, D1 < D2)).

%ii)
older(X,Y,X):-
  before(X,Y).
older(X,Y,Y):-
  \+before(X,Y).

%iii)

%%%8
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

%a)most-gates 

most_gates(X):-
  gates(X,Gates),
  \+ (gates(_,Other_Gates), Other_Gates > Gates).

%b)least-gates

least_gates(X):-
  gates(X,Gates),
  \+ (gates(_,Other_Gates), Other_Gates < Gates).

%c)
diff_gates(X):-
  most_gates(MaxCircuit),
  gates(MaxCircuit, MaxGates),
  least_gates(MinCircuit),
  gates(MinCircuit, MinGates),
  X is MaxGates - MinGates.

%d)
same_team(X, Y):- 
  team(X,Team), 
  team(Y,Team), 
  X \= Y.

%e)???????????????????????????????????????????????????
is_from_winning_team(P, C):-
  winner(X,C),
  same_team(X,P).