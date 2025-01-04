is_Palindrome(List1):-
  is_Palindrome_helper(List1,[],List2),
  List2 = List1.

is_Palindrome_helper([],Acc,Acc).
is_Palindrome_helper([H|T],Acc,X):-
  is_Palindrome_helper(T,[H|Acc],X).

