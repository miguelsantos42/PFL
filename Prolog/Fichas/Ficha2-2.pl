%%%4
%a)
factorial(0,1).
factorial(N, F):-
  N >= 1,
  N1 is N - 1,
  factorial(N1,F1),
  F is F1 * N. 

%b)
sum_rec(1,1).
sum_rec(N, Sum):-
  N >= 1,
  N1 is N - 1,
  sum_rec(N1, Sum1),
  Sum is Sum1 + N.

%c)
pow_rec(X,0,1).
pow_rec(X, Y, P):-
  Y >= 1,
  Y1 is Y - 1,
  pow_rec(X,Y1,P1),
  P is P1 * X.

%d)
square_rec(N, S):-
  square_rec_helper(N,N,0,S).

square_rec_helper(N,0,Acc,Acc).
square_rec_helper(N,Count,Acc,P):-
  Count >= 1,
  Count1 is Count - 1,
  Acc1 is Acc + N,
  square_rec_helper(N,Count1,Acc1,P). 

%e)
fibonacci(0,0).
fibonacci(1,1).
fibonacci(N, F):-
  N > 1,
  N1 is N - 1,
  N2 is N - 2,
  fibonacci(N1,F1),
  fibonacci(N2,F2),
  F is F1 + F2.


%f)
collatz(1,0)
collatz(N, S):-
  N >= 1,
  (N mod 2 =:= 0 -> N1 is N // 2; N1 is 3 * N + 1),
  collatz(N1,S1),
  S is S1 + 1.

%%%5)
%a)
factorial1(N,P):-
  factorial1_helper(N,1,P).

factorial1_helper(0,Acc,Acc).
factorial1_helper(N,Acc,P):-
  N >= 1,
  Acc1 is Acc * N,
  N1 is N - 1,
  factorial1_helper(N1,Acc1,P).

%b)
sum_rec1(N,Sum):-
  sum_rec1_helper(N,0,Sum).

sum_rec1_helper(0,Acc,Acc).
sum_rec1_helper(N,Acc,Sum):-
  N >= 1,
  Acc1 is Acc + N,
  N1 is N - 1,
  sum_rec1_helper(N1,Acc1,Sum).

%c) 
pow_rec1(X, Y, P):-
  pow_rec1_helper(X,Y,1,P).

pow_rec1_helper(X,0,Acc,Acc).
pow_rec1_helper(X,Y,Acc,P):-
  Y >= 1,
  Acc1 is Acc * X,
  Y1 is Y - 1,
  pow_rec1_helper(X,Y1,Acc1,P).

%d)
square_rec1(N,S):-
  square_rec1_helper(N,N,0,S).

square_rec1_helper(N,0,Acc,Acc).
square_rec1_helper(N,Y,Acc,S):-
  Y >= 1,
  Acc1 is N + Acc,
  Y1 is Y - 1,
  square_rec1_helper(N,Y1,Acc1,S).

%e)
fibonacci1(N,F):-
  fibonacci1_helper(N,0,1,F).

fibonacci1_helper(0,Acc1,_,Acc1).
fibonacci1_helper(1,_,Acc2,Acc2).
fibonacci1_helper(N,Acc1,Acc2,F):-
  N > 1,
  N1 is N - 1,
  Next is Acc1 + Acc2,
  fibonacci1_helper(N1,Acc2,Next,F).

%%%6)
%a)
gcd(X,0,X).
gcd(X, Y, G):-
  Y > 0,
  R is X mod Y,
  gcd(Y,R,G). 

%b)
lcm(X, Y, M):-
  gcd(X,Y,G),
  M is (X * Y) // G.

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

%a)
most_gates(X):-
  gates(X,Gates),
  \+ (gates(_,Other_Gates), Other_Gates > Gates).

%b)
least_gates(X):-
  gates(X,Gates),
  \+ (gates(_,Other_Gates), Other_Gates < Gates).

%c)
gate_diff(X):-
  most_gates(MaxCircuit),
  gates(MaxCircuit,MaxGates),
  least_gates(MinCircuit),
  gates(MinCircuit,MinGates),
  X is MaxGates - MinGates.

%d)
same_team(X, Y):-
  team(X,Team),
  team(Y,Team),
  X \= Y.