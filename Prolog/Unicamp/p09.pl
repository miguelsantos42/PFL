/*
pack1([], []).
pack1([Current | Next], [X | Y]) :-
  helper(Current, Next, Remainings, X),
  pack1(Remainings, Y).

%%%% [a,a,a,a,b,c,c,a,a,d,e,e,e,e]

% helper(+FirstChar, +RemainingEqualChars, -RemainingDifferentChars, -Sublists)

helper(Current, [], [], [Current]). % se a letra estiver sozinha, cria sublista só com essa letra
helper(Current, [ImmediateNext | Nexts], [ImmediateNext | Nexts], [Current]) :- Current \= ImmediateNext.
helper(Current, [Current | Nexts], DifferentNexts , [Current | WhatsNext]) :- helper(Current, Nexts, DifferentNexts, WhatsNext). 
*/


pack([], []).

pack([X],[[X]]).

pack([Current , Current | Next], [[Current | Sublist] | X]) :-
  pack([Current|Next], [Sublist|X]).

pack([Z , Y | Next], [[Z]|X]):-
  Z \= Y,
  pack([Y|Next], X).
