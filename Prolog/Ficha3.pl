%%%1
%a) ?- [a | [b, c, d] ] = [a, b, c, d]  -> True
%b) ?- [a | b, c, d ] = [a, b, c, d] -> False
%c) ?- [a | [b | [c, d] ] ] = [a, b, c, d] -> True
%d) [H|T] = [pfl, lbaw, fsi, ipc] -> H = [pfl], T = [lbaw,fsi,ipc]
%e) [H|T] = [lbaw, ltw] -> H = [lbaw] , T = [ltw]
%f) [H|T] = [leic] -> h = [leic], T = []
%g) [H|T] = [] -> False
%h) [H|T] = [leic, [pfl, ipc, lbaw, fsi]] = H = [leic], T=[[pfl,ipc,lbaw,fsi]]
%i) [H|T] = [leic, Two] -> H = [leic] , T = [Two]
%j) [Inst, feup] = [gram, LEIC] -> Ints = gram, feup = LEIC
%k) [One, Two | Tail] = [1, 2, 3, 4] -> One = 1, Two = 2, Tail = [3,4]
%l) [One, Two | Tail] = [leic | Rest] -> One = leic, Two = Rest, Tail=[]


%%%4
%d)
list_nth(N, List, Elem):-
  length(Part,N),
  append(Part, [Elem|_], List).

list_nth2(0,[Elem|_],Elem).
list_nth2(N,[_|T],Elem):-
  N > 0,
  N1 is N-1,
  list_nth2(N1,T,Elem).

%g)
list_before(First, Second, List):-
  