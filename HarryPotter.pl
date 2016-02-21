/**
Main Characters
**/
student(harry).
student(ron).
student(hermione).

friends(harry, ron).
friends(harry, hermione).
friends(ron, hermione).

/**
Genders
**/
male(harry).
male(ron).
female(hermione).
female(ginny).

/**
Ages
**/
age(harry, 17).
age(ron, 17).
age(hermione, 17).
age(Person, 11) :- newStudent(Person).
newStudent(charlie).

/**
Families
**/
mother_of(hermione, alice).
father_of(hermione, bob).
sibling_of(ron, ginny).

parents_of(X, Y) :- mother_of(X, Y).
parents_of(X, Y) :- father_of(X, Y).
son_of(X, Y) :- parents_of(Y, X), male(Y).
daughter_of(X, Y) :- parents_of(X, Y), female(Y).
child_of(X, Y) :- parents_of(Y, X).
opposite_sex(X, Y):-  male(X), female(Y).
opposite_sex(X, Y):-  female(X), male(Y).

/* X get married with Y in Harry Potter Series */
get_married_with(X, Y) :-
  friends(X, Friend),
  sibling_of(Friend, Y),
  opposite_sex(X, Y).

/**
Dorm members
Orderd from senior to junior
**/
dorm_members([
  percy,
  angelina,
  lee,
  katie,
  alicia,
  fred,
  george,
  lavender,
  harry,
  ron,
  hermione,
  dean,
  seamus,
  neville,
  parvati,
  colin,
  dennis]).

oldest_member(List, Y) :- [Y|_] = List.
youngest_member(List, Y) :-
  reverse(List, ReversedList),
  oldest_member(ReversedList, Y).

/**
Examination
**/
owlTest(Person, false) :- age(Person, Age), Age < 15, !.
owlTest(_, true).

/**
Muggle has no magical skills
**/
muggle(alice).
muggle(bob).

/**
Questions

?- parents_of(hermione, X), muggle(X).
X = alice ;
X = bob.

?- student(X), muggle(X).
false.

?- get_married_with(harry, Who).
Who = ginny ;

?- youngest_member(Y, Who), dorm_members(Y).
Y = [percy, angelina, lee, katie, alicia, fred, george, lavender, harry|...],
Who = dennis.

?- owlTest(X, IsTarget), newStudent(X).
X = charlie,
IsTarget = false.

**/
