isogram(Phrase):-
  string_lower(Phrase, LowerPhrase),
  string_to_char(LowerPhrase, CharList),
  isogram_list(CharList).

