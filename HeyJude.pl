/**
Hey Jude
https://en.wikipedia.org/wiki/Hey_Jude
http://40.media.tumblr.com/tumblr_kolo40SQZq1qzy3cwo1_r1_1280.jpg
*/

/**
Words
*/
name_of(jude, 'Jude').
hey(Person, Sentence) :-
  name_of(Person, Name),
  append(['hey'], [Name], Words),
  join(Words, ' ', Sentence).

doNot(Index, Sentence) :-
  somethingNegative(Index, Thing),
  append(['don\'t'], [Thing], Words),
  join(Words, ' ', Sentence).
somethingNegative(0, 'make it bad').
somethingNegative(1, 'be afraid').
somethingNegative(2, 'let me down').
somethingNegative(Index, Word) :- R is Index mod 3, somethingNegative(R, Word).

do(Index, Word) :- somethingPositive(Index, Word).
somethingPositive(0, 'take a sad song and make it better').
somethingPositive(1, 'you were made to go out and get her').
somethingPositive(2, 'you have found her, now go and get her').
somethingPositive(Index, Word) :- R is Index mod 3, somethingPositive(R, Word).

remember(Index, Sentence) :-
  somethingImportant(Index, Thing),
  append(['remember to'], [Thing], Words),
  join(Words, ' ', Sentence).
somethingImportant(0, 'let her into your heart').
somethingImportant(1, 'let her under your skin').
somethingImportant(Index, Word) :- R is Index mod 2, somethingImportant(R, Word).

result(Index, Sentence) :-
  startSomehow(Index, Thing),
  append(['then you'], [Thing], WordList_1),
  append(WordList_1, ['to make it better'], WordList_2),
  join(WordList_2, ' ', Sentence).
startSomehow(0, 'can start').
startSomehow(1, 'begin').
startSomehow(Index, Somehow) :- R is Index mod 2, startSomehow(R, Somehow).

lastPart(RepeatTimes, Sentence) :-
  sayBetter(BetterPart),
  sayNa(RepeatTimes, Nanana),
  join([BetterPart, Nanana], '~n~n', Sentence).

sayBetter(Sentence) :- sayBetter(5, [], Sentence).
sayBetter(0, Words, Sentence) :-
  append(Words, ['waaaa'], WordList),
  join(WordList, ' ', Sentence).
sayBetter(N, Words, Sentence) :-
  Times is N - 1,
  append(Words, ['better'], WordList),
  sayBetter(Times, WordList, Sentence).

sayNa(RepeatTimes, Sentence) :- sayNa(RepeatTimes, [], Sentence).
sayNa(0, Words, Sentence) :- join(Words, ' ', Sentence).
sayNa(RepeatTimes, Words, Sentence) :-
  RestTimes is RepeatTimes - 1,
  append(Words, ['na'], WordList),
  sayNa(RestTimes, WordList, Sentence).

/**
Formatting
*/
formatParagraph(SentenceList, Sentences) :- join(SentenceList, '~n', Sentences).
join(Ls, X, Y) :- concat_atom(Ls, X, Y).

/**
Lyrics
*/
createParagraph(N, Paragraph) :-
  hey(jude, CallName),
  doNot(N, DoNotDoThis),
  do(N, DoThis),
  remember(N, RememberTo),
  result(N, ThenYou),
  formatParagraph([
    CallName,
    DoNotDoThis,
    DoThis,
    RememberTo,
    ThenYou
  ], Paragraph).

createPart(RepeatTimes, Part) :-
  TimesOfSayingNa is RepeatTimes * RepeatTimes,
  createPart(RepeatTimes, TimesOfSayingNa, [], Part).
createPart(0, Times, Paragraphs, Part) :-
  join(Paragraphs, '~n~n', MainPart),
  lastPart(Times, EndOfPart),
  append([MainPart], [EndOfPart], FullPart),
  join(FullPart, '~n', Part).
createPart(Index, Times, Paragraphs, Part) :-
  createParagraph(Index, Paragraph),
  append(Paragraphs, [Paragraph], ParagraphList),
  NextIndex is Index - 1,
  createPart(NextIndex, Times, ParagraphList, Part).

print_lyric :- createPart(6, Lyric), format(Lyric).
print_lyric(N) :- createPart(N, Lyric), format(Lyric).
