%%%%%%%%%%%%1 -> How the Cut works 

s(1). 
s(2):- !. 
s(3). 

/*

s(X). -> X = 1; X = 2.
s(X), s(Y). -> (X = 1, Y = 1); (X = 1, Y = 2); (X = 2, Y = 1); (X=2 , Y = 2).
s(X), !, s(Y). -> X = 1.

X = 1 -> Y = 1 / Y = 2

*/


%%%%%%%%%%%%%%%2 -> The effect of a Cut 

data(one). 
data(two). 
data(three). 
cut_test_a(X):- data(X). 
cut_test_a('five'). 
cut_test_b(X):- data(X), !. 
cut_test_b('five'). 
cut_test_c(X, Y):- data(X) , data(Y). 
cut_test_c('five', 'five'). 

/*
%%%%%%%%%a)| ?- cut_test_a(X), write(X), nl, fail.

cut_test_a(X) :- data(X) -> one, two, three -> write(X)

cut_test_a(X) -> data(X) -> write(X) -> nl

cut_test_a('five') -> write(X)

%%%%%%%%%%b)| ?- cut_test_b(X), write(X), nl, fail.

cut_test_b(X):- data(X), !. -> one -> write(X)

%%%%%%%%%%c)| ?- cut_test_c(X, Y), write(X-Y), nl, fail.

cut_test_c(X, Y):- data(X-Y), !, data(Y). -> (one-one), (one-two), (one-three)

cut_test_c('five', 'five'). -> (five-five)

*/

test(rcom, 'December').
test(pfl, 'January').
test(fsi, 'January').

project(ipc).
project(rcom).
project(lbaw).
project(pfl).

exam(rcom, 'January').
exam(lbaw, 'January').

study(C) :- test(C, _).
study(C) :- exam(C, _).

on_fire(C, X) :- project(C), study(X), !. % é mais eficiente

/*

on_fire(C, X) :- project(C) , study(X), C \= X.
{
C = ipc, rcom, lbaw, pfl
(C=ipc) -> X = rcom, lbaw, pfl, fsi
(C=rcom) -> X = ipc, lbaw, pfl, fsi
(C=lbaw) -> X = rcom, ipc, pfl, fsi
(C=pfl) -> X = rcom, lbaw, ipc, fsi
}

on_fire(C, X) :- project(C) , ! , study(X).
{
C = ipc
X = rcom, lbaw, pfl, fsi, ipc
}

on_fire(C, X) :- project(C) , study(X), !.
{
C = ipc
X = rcom
}


study(C) -> rcom, lbaw, ipc, pfl, fsi
project(C) -> ipc, rcom, lbaw, pfl

project(C) -> ipc, rcom, lbaw, pfl
study(C) -> ipc, pfl, rcom, lbaw

*/


% study(C)


/*

*/

person(diogo).
age(diogo, 21).

person(miguel).
age(miguel, 10).

turtle(teresa).
age(teresa, 52).

turtle(rute).
age(rute, 2).

immature(X):- adult(X), write(X), nl, fail.
immature(_X).
adult(X):- person(X), !, age(X, N), N >=18.
adult(X):- turtle(X), !, age(X, N), N >=50.

%%%%%%%%%%%%%%%%%%%%%4 - Maximum Value 

max(A, B, C, A):-
  (A >= B),
  (A >= C),! .

max(A,B,C,B):-
  (B >= C),! .

max(A,B,C,C).

%%%%%%%%%%%%%%%%%%%%%5 - Data Input and Output 

%%%%a)
print_n(0,_).
print_n(N, S):-
  N >= 1,
  write(S),
  N1 is N - 1,
  print_n(N1,S).

%%%%%b)
print_text(Text, Symbol, Padding):-
  write(Symbol),
  print_n(Padding,' '),
  write(Text),
  print_n(Padding,' '),
  write(Symbol).


%%%%%d)

% read_number(X) :-
%   read_number_rec(X).

% read_number_rec([]).
% read_number_rec([Reading | ToRead]) :-
%   get_code(Reading), % perguntar digito e guardar no reading
%   read_number_rec(ToRead).


%%%%%%%%%% 6 -> List Printing

%%%%%a)
print_full_list([]).
print_full_list([H]) :-
  write(H), !.
print_full_list([H|T]):-
  write(H),
  write(', '),
  print_full_list(T).

%%%%%b)
print_list([]).
print_list(L):-
  length(L, N),
  N =< 11,
  write('['),
  print_full_list(L),
  write(']').
print_list(L):-
  length(L, N),
  N >= 12,
  write('['),
  get_first_elements(L, First),
  print_full_list(First),
  write(', ... , '),
  get_middle_elements(L, Middle),
  print_full_list(Middle),
  write(', ... , '),
  get_last_elements(L, Last),
  print_full_list(Last),
  write(']').

get_first_elements(L, Elements) :- 
  length(Elements,3),
  append(Elements, _, L).

get_middle_elements(L, Elements) :-
  length(L,N),
  N1 is N // 2 - 1,
  length(First, N1),
  append(First, Last, L),
  get_first_elements(Last, Elements).
   
/*

[a,b,c,d,e,f,g] -> Head
[h,i,j,k,l,m,n,o,p] -> Tail

First -> 3
[a,b,c,d,e,f,g]

append([_,_,_], Middle, [a,b,c,d,e,f,g])

get_first_elements(Tail, Elements).`


*/


get_last_elements(L, Elements) :-
  length(Elements,3),
  append(_,Elements,L).

  % [_,_,_]
  % [1,2,3,4,5]
  % append([_,_,_,_], _, L) -> [1,2,3,4]

/*

[0, 2]
[N/2-1, N/2+1]
[N-3, N-1]

*/

%%%%%%c)
print_matrix([]).
print_matrix([H|T]):-
  write('['),
  print_full_list(H),
  write(']'),nl,
  print_matrix(T).


  