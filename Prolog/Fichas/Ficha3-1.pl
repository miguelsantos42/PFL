:- use_module(permutation).

%%%%%%%%%%%%%%%%%%%2 -> Recursion over Lists 
%%%a)
list_size([],0).
list_size([_|T], Size):-
  list_size(T,Size1),
  Size is Size1 + 1.

%%%b)
list_sum(List, Sum):-
  list_sum_Helper(List,0,Sum).

list_sum_Helper([],Acc,Acc).
list_sum_Helper([H|T],Acc,Sum):-
  Acc1 is Acc + H,
  list_sum_Helper(T,Acc1,Sum).

%%%c)
list_prod(List, Prod):-
  list_prod_Helper(List,1,Prod).

list_prod_Helper([],Acc,Acc).
list_prod_Helper([H|T],Acc,Prod):-
  Acc1 is Acc * H,
  list_prod_Helper(T,Acc1,Prod).

%%%d)
inner_product(List1, List2, Result):-
  inner_product_helper(List1,List2,0,Result).
  
inner_product_helper([],[],Acc,Acc).
inner_product_helper([H1|T1],[H2|T2],Acc,Result):-
  Acc1 is Acc + (H1 * H2),
  inner_product_helper(T1,T2,Acc1,Result).

%%%e)
count(Elem, List, N):-
  count_helper(Elem,List,0,N).

count_helper(_,[],Acc,Acc).
count_helper(Elem,[H|T],Acc,N):-
  (Elem =:= H -> Acc1 is Acc + 1; Acc1 is Acc),
  count_helper(Elem,T,Acc1,N).


%%%%%%%%%%%%%%%%3 -> List Manipulation
%%%a)
invert(List1, List2):-
  invert_Helper(List1, [], List2).

invert_Helper([],Acc,Acc).
invert_Helper([H|T],Acc,List2):-
  invert_Helper(T,[H|Acc],List2).

%%%b)
del_one(_,[],[]).
del_one(Elem, [H|T], T):-
  Elem =:= H.
del_one(Elem, [H|T], [H|List2]):-
  Elem =\= H,
  del_one(Elem, T, List2).

%%%c)
del_all(_,[],[]).
del_all(Elem, [Elem|T], List2):-
  del_all(Elem, T, List2).
del_all(Elem, [H|T], [H|List2]):-
  Elem =\= H,
  del_all(Elem, T, List2).

%%%d)
del_all_list(_,[],[]).
del_all_list(ListElem,[H|T],List2):-
  member(H,ListElem),
  del_all_list(ListElem,T,List2).
del_all_list(ListElem,[H|T],[H|List2]):-
  \+member(H,ListElem),
  del_all_list(ListElem,T,List2).

%%%e)
del_dups(List1, List2):-
  del_dups_helper(List1,[], TempList),
  reverse(TempList,List2).

del_dups_helper([],Acc,Acc).
del_dups_helper([H|T], Acc, List2):-
  member(H,Acc),
  del_dups_helper(T,Acc,List2).
del_dups_helper([H|T],Acc,List2):-
  \+member(H,Acc),
  del_dups_helper(T,[H|Acc],List2).

reverse(List1,List2):-
  reverse_helper(List1,[],List2).

reverse_helper(_,Acc,Acc).
reverse_helper([H|T],Acc,List2):-
  reverse_helper(T, [H|Acc], List2).

%%%f)
list_perm (L1, L2):-
  permutation(L1,L2).

%%%g)
replicate(Amount, Elem, List):-
  replicate_helper(Amount,Elem,[],List).

replicate_helper(0,_,Acc,Acc).
replicate_helper(Amount,Elem,Acc,List):-
  Amount1 is Amount - 1,
  replicate_helper(Amount1,Elem,[Elem|Acc],List).

%%%h)
intersperse(_,[],[]).
intersperse(_,[X],[X]).
intersperse(Elem, [H|T], [H,Elem|List2]):- 
  intersperse(Elem,T,List2).

%%%i)
insert_elem(0,List1,Elem,[Elem|List2]).
insert_elem(Index, [H|T], Elem, [H|List2]):-
  Index >= 1,
  Index1 is Index - 1,
  insert_elem(Index1, T, Elem, List2).

%%%j)
delete_elem(0,[Elem|List1],Elem,List2).
delete_elem(Index, [H|T], Elem, [H|List2]):-
  Index >= 1,
  Index1 is Index - 1,
  delete_elem(Index1,T,Elem,List2).

%%%k)
replace([Old|List],0,Old,New,[New|List2]).
replace([H|T], Index, Old, New, [H|List2]):-
  Index >= 1,
  Index1 is Index - 1,
  replace(T,Index1,Old,New,List2).

%%%%%%%%%%%4 -> Append, The Powerful
%%%a)
list_append([],L2,L2).
list_append([H|T], L2, [H|L3]):-
  list_append(T,L2,L3). 

%%%b)
list_member(Elem, List):-
  append(_, [Elem|_], List).

%%%c)
list_last(List, Last):-
  append(_,[Last],List).

%%%d)
list_nth(N, List, Elem):-
  N1 is N - 1,
  length(Prefix, N1),
  append(Prefix, [Elem|_], List).

%%%e)
list_append1([],[]).
list_append1([H|T], List) :-
    list_append1(T, NewList),
    append(H, NewList, List).

%%%f)
list_del(List, Elem, Res):-
  append(Prefix,[Elem|Suffix], List),
  append(Prefix,Suffix,Res).


%%%%%%%%%%%%%%%5 -> Lists of Numbers 

%%%%a) 
list_to(0,[]).
list_to(N, List):-
  N >= 1,
  list_to_helper(1,N,List).

list_to_helper(Actual,N,[]):- Actual > N.
list_to_helper(Actual,N,[Actual|List]):-
  Actual =< N,
  Actual1 is Actual + 1,
  list_to_helper(Actual1,N,List).

%%%%b)
list_from_to(Inf,Sup,[]):- Sup < Inf.
list_from_to(Inf, Sup, [Inf|List]):-
  Sup >= Inf,
  Inf1 is Inf + 1,
  list_from_to(Inf1,Sup,List).

%%%%c)
list_from_to_step(Inf,Sup,_,[]):- Sup < Inf.
list_from_to_step(Inf, Sup, Step, [Inf|List]):-
  Sup >= Inf,
  Inf1 is Inf + Step,
  list_from_to_step(Inf1,Sup,Step,List).

%%%%d)
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

%%%%%4
%%%%a)
list_append_1([],L2,L2).
list_append_1([H|T], L2, [H|L3]):-
  list_append_1(T,L2,L3).

%%%%b)
list_member_1(Elem, List):-
  append(_,[Elem|_],List).

%%%%c)
list_last(List, Last):-
  append(_,[Last],List).

%%%%d)
list_nth(N, List, Elem):-
  N1 is N - 1,
  length(Prefix,N1),
  append(Prefix,[Elem|_],List).

%%%%e)
list_append([],[]).
list_append([H|T], [H|List]):-
  list_append(T,NewList),
  append(H,NewList,List).

%%%%f)
list_del11([],_,[]).
list_del(List, Elem, Res):-
  append(Prefix,[Elem|Sufix],List),
  append(Prefix,Sufix,Res).