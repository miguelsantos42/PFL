is_Palindrome(List):-
  reverse(List,Newlist),
  List = Newlist.

reverse(List,Newlist):-
  reverse_helper(List,[],Newlist).

reverse_helper([],Acc,Acc).
reverse_helper([H|T],Acc,Newlist):-
  reverse_helper(T,[H|Acc],Newlist).