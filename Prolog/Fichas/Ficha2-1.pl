%%%4
%a)
factorial(0,1).
factorial(N,F):-
  N >= 1,
  N1 is N - 1,
  factorial(N1,F1),
  F is F1 * N.

%b)
sum_rec(0,0).
sum_rec(N,Sum):-
  N >= 1,
  N1 is N - 1,
  sum_rec(N1,Sum1),
  Sum is Sum1 + N.

%c)
pow_rec(_,0,1).
pow_rec(X,Y,P):-
  Y >= 1,
  Y1 is Y - 1,
  pow_rec(X,Y1,P1),
  P is P1 * X.
  

%d)
square_rec(N, S):-
  square_rec_helper(N,N,0,S).

square_rec_helper(N,0,Acc,Acc).
square_rec_helper(N,Count,Acc,S):-
  Count >= 1,
  Count1 is Count-1,
  Acc1 is Acc + N,
  square_rec_helper(N,Count1,Acc1,S).


%e)
fibonacci(0,0).
fibonacci(1,1).
fibonacci(N,F):-
  N >= 1,
  N1 is N - 2,
  N2 is N - 1,
  fibonacci(N1,F1),
  fibonacci(N2,F2),
  F is F1 + F2. 

%f)
collatz(1,0).
collatz(N,S):-
  N > 1,
  (N mod 2 =:= 0 -> N1 is N // 2;
   N1 is 3 * N + 1),
  collatz(N1, S1),
  S is S1 + 1.

%%%5
%a)
factorial1(N,S):-
  factorial1_helper(N,1,S).

factorial1_helper(0,Acc,Acc).
factorial1_helper(N,Acc,S):-
  N >= 1,
  Acc1 is Acc * N,
  N1 is N - 1,
  factorial1_helper(N1,Acc1,S).

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
pow_rec1(N,E,S):-
  pow_rec1_helper(N,E,0,S).

pow_rec1_helper(_,0,Acc,Acc).
pow_rec1_helper(N,Y,Acc,R):-
  Y >= 1,
  Acc1 is Acc * N,
  Y1 is Y - 1,
  pow_rec1_helper(N,Y1,Acc,R).

%d)
square_rec1(N, S):-
  square_rec1_helper(N,N,0,S).

square_rec1_helper(N,0,Acc,Acc).
square_rec1_helper(N,Y,Acc,R):-
  Y >= 1,
  Y1 is Y - 1,
  Acc1 is Acc + N,
  square_rec1_helper(N,Y1,Acc1,R). 

%e)
fibonacci1(N,F):-
  fibonacci1_helper(N,0,1,F).

fibonacci1_helper(0,Acc,_,Acc).
fibonacci1_helper(N,Acc1,Acc2,S):-
  N >= 0,
  R is Acc1 + Acc2,
  N1 is N - 1,
  fibonacci1_helper(N1,Acc2,R,S).