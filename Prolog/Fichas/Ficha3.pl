:- use_module(library(lists), permutation).
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
replicate(Amount, Elem, [Elem|List]):-
  Amount > 0,
  Amount1 is Amount - 1,
  replicate(Amount1, Elem, List).

%%h)intersperse(+Elem, +List1, ?List2)
intersperse(_,[],[]).
intersperse(X,[H|T],[H,X|L]):-
  intersperse(X,T,L).

%%i)insert_elem(+Index, +List1, +Elem, ?List2)
insert_elem(0,L,X,[X|L]).
insert_elem(N,[H|T],X,[H|R]):-
  N >= 1,
  N1 is N - 1,
  insert_elem(N1,T,X,R).

%%j)delete_elem(+Index, +List1, ?Elem, ?List2)
delete_elem(0,[E|T],E,T).
delete_elem(N,[H|T],E,[H|L]):-
  N >= 1,
  N1 is N-1,
  delete_elem(N1,T,E,L).

%%k)replace(+List1, +Index, ?Old, +New, ?List2)
replace([H|T],0,H,E,[E|T]).
replace([H|T], Index, Old, X, [H|L]):-
  Index >= 1,
  Index1 is Index - 1,
  replace(T,Index1,Old,X,L).


%%%4
%%a)list_append(?L1, ?L2, ?L3)
list_append([],L2,L2).
list_append([H1|T1], L2, [H1|L3]) :-
  list_append(T1,L2,L3).

%%b)list_member(?Elem, ?List)
list_member(Elem, List) :- append(_, [Elem | _] , List).

%% List -> [1,2,3,4]
%% Elem -> 2

%% append(_, [2 | _], [1,2,3,4]) -> [_ | 2 | _] = [1,2,3,4]
%% [_ | Elem | _ ] -> [.. Elem ..]


%%c)list_last(+List, ?Last) 
list_last(List, Last) :- append(_, [Last], List).

%% [_ | Last]

%% List -> [1,2,3,4]
%% Last -> 5
%% [1,2,3,4,5] -> [1,2,3,4 | 5] -> [1,2,3,4] [5] : List

%%

%d)list_nth(?N, ?List, ?Elem)
list_nth(N,List,Elem):-
N1 is N - 1,
length(Prefix, N1),
append(Prefix, [Elem | _] , List).


%e) list_append(+ListOfLists, ?List)
list_append1([],[]).
list_append1([H|T], List):-
  append(H,Resto,List),
  list_append1(T, Resto).


%f) list_del(+List, +Elem, ?Res)
list_del(List,Elem,Res):-
  append(Prefix, [Elem|Sufix], List),
  append(Prefix, Sufix, Res).

%g)list_before(?First, ?Second, ?List)
list_before(First, Second, List):-
  append(Prefix,[First|Rest],List),
  append(_,[Second|_],Rest).

%h) list_replace_one(+X, +Y, +List1, ?List2)
list_replace_one(X, Y, List1, List2):-
append(Prefix,[X|Suffix], List1),
append(Prefix,[Y|Suffix], List2).

%i) list_repeated(+X, +List)
list_repeated(X, List):-
  append(Prefix, [X|Rest], List),
  append(_, [X|_], Rest).

%j)list_slice(+List1, +Index, +Size, ?List2)


%%%5
%%a)
list_to(0,[]).
list_to(N, L) :-
  N >= 1,
  list_tohelper(1,N,L).

list_tohelper(Actual,N,[]) :- Actual > N.
list_tohelper(Actual,N,[Actual|L]):-
  Actual =< N,
  Next is Actual + 1,
  list_tohelper(Next,N,L).

%%b)
list_from_to(Sup,Sup,[Sup]).
list_from_to(Inf, Sup, [Inf|List]):-
  Inf =< Sup,
  Inf1 is Inf + 1,
  list_from_to(Inf1,Sup,List).

%%c)
list_from_to_step(Inf,Sup,_,[]) :- Sup < Inf.
list_from_to_step(Inf, Sup, Step, [Inf|List]):- 
  Inf =< Sup,
  Inf1 is Inf + Step,
  list_from_to_step(Inf1,Sup,Step,List).

%d)
list_from_to_reverse(Inf,Inf,[Inf]).
list_from_to_reverse(Inf, Sup, [Sup|List]):-
  Sup >= Inf,
  Sup1 is Sup - 1,
  list_from_to_reverse(Inf,Sup1,List).

list_from_to_step_reverse(Inf,Inf,_,[]).
list_from_to_step_reverse(Inf, Sup, Step, [Sup|List]):- 
  Sup >= Inf,
  Sup1 is Sup - Step,
  list_from_to_step_reverse(Inf,Sup1,Step,List).

%%e)???????????????????????????????????????????

%%f)???????????????????????????????????????????

%%%7
%%a)
is_ordered([]).
is_ordered([_]).
is_ordered([X,Y|T]):-
  X =< Y,
  is_ordered([Y|T]).

%%b)
insert_ordered(X,[],[X]).
insert_ordered(V, [H|T], [V,H|T]):- 
  V =< H.
insert_ordered(V, [H|T], [H|L]):-
  H =< V,
  insert_ordered(V,T,L).

%%c)
insert_sort([],[]).
insert_sort([H|T], L):-
  insert_sort(T,L1),
  insert_ordered(H,L1,L).