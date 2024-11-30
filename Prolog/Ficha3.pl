:- use_module(library(lists)).
%%1
%a) a) | ?- [a | [b, c, d] ] = [a, b, c, d]  -> True
%b) [a | b, c, d ] = [a, b, c, d]  -> False
%c) [a | [b | [c, d] ] ] = [a, b, c, d]  -> True
%d) [H|T] = [pfl, lbaw, fsi, ipc] -> H = [pfl], T = [lbaw,fsi,ipc]
%e) [H|T] = [lbaw, ltw] -> H = [lbaw], T = [ltw]
%f) [H|T] = [leic] -> H = [leic], T = []
%g) [H|T] = [] -> False 
%h) [H|T] = [leic, [pfl, ipc, lbaw, fsi] ] -> H = [leic], T = [[pfl,ipc,lbaw,fsi]]
%i) [H|T] = [leic, Two] -> H = [leic], T = [Two]
%j) [Inst, feup] = [gram, LEIC] -> Inst = gram, feup = LEIC
%k) [One, Two | Tail] = [1, 2, 3, 4] -> One = [1], Two = [2], Tail = [3,4]
%L) [One, Two | Tail] = [leic | Rest] -> False

%%2
%a)list_size(List, Size):-
list_size([],0).
list_size([_|T], S):-
  list_size(T, S1),
  S is S1 + 1.

%b)list_sum(+List, ?Sum):-
list_sum([],0).
list_sum([H|T],S):-
  list_sum(T,S1),
  S is S1 + H.

%c)list_prod(+List, ?Prod):-
list_prod([],1).
list_prod([H|T],S):-
  list_prod(T,S1),
  S is S1 * H.

%d)inner_product (+List1, +List2, ?Result)
inner_product([],[],0).
inner_product([H1|T1], [H2|T2], R):-
  inner_product(T1,T2,R1),
  R is R1 + (H1*H2).

%e)count(+Elem, +List, ?N).
count(_,[],0).

count(X,[H|T],N):-
  H =:= X, 
  count(X,T,N1),
  N is N1 + 1.

count(X,[H|T],N):-
  H =\= X,
  count(X,T,N).

%%%3
%%a)
%a1)invert(+List1, ?List2)
invert(Lista1,L):-
  invert_Helper(Lista1, [], L).

invert_Helper([],Acc,Acc).
invert_Helper([H|T], Acc, L):-
  invert_Helper(T, [H|Acc], L).

%a2)invert1(+List1, ?List2)
invert1([],[]).
invert1([H|T],L):-
  invert1(T,L1),
  append(L1,[H],L).

%%b)del_one(+Elem, +List1, ?List2)
del_one(_,[],[]).
del_one(X, [X|T], T).
del_one(X, [H|T], [H|R]):-
  X =\= H,
  del_one(X,T,R).

%%c)del_all(+Elem, +List1, ?List2)
del_all(_,[],[]).
del_all(X,[X|T],R):-
  del_all(X,T,R).
del_all(X,[H|T],[H|R]):-
  X =\= H,
  del_all(X,T,R).

%%d)del_all_list(+ListElems, +List1, ?List2)
del_all_list(_,[],[]).
del_all_list(_,List1,List1).
del_all_list([H|T],List1,R):-
  del_all(H,List1,R1),
  del_all_list(T,R1,R).

%%e)del_dups(+List1, ?List2)
del_dups([],[]).
del_dups([H|T],[H|L]):-
  \+member(H,T),
  del_dups(T,L).
del_dups([H|T],L):-
  member(H,T),
  del_dups(T,L).

%%f)list_perm (+L1, +L2)
list_perm(Lista1,Lista2):-
  permutation(Lista1,Lista2).

%%g)replicate(+Amount, +Elem, ?List) 
replicate(0,_,[]).
replicate(Amount, Elem, List):-
  replicate