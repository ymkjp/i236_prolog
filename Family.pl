/* 例1 */
boy(taro).
boy(jiro).
boy(saburo).
brother(X,Y):-boy(X), boy(Y), X\=Y.

/* 例2 */
/* 男性 */
male(taro).
male(ichiro).
male(jiro).
male(saburo).

/* 女性 */
female(hanako).
female(tomoko).
female(sachiko).
female(youko).

/* 父親 */
father_of(taro, ichiro).
father_of(taro, jiro).
father_of(taro, tomoko).
father_of(ichiro, saburo).
father_of(ichiro, youko).

/* 母親 */
mother_of(hanako, ichiro).
mother_of(hanako, jiro).
mother_of(hanako, tomoko).
mother_of(sachiko, saburo).
mother_of(sachiko, youko).

/* 両親 ORは並べて書く */
parents_of(X, Y) :- mother_of(X, Y).
parents_of(X, Y) :- father_of(X, Y).

/* 息子 */
son_of(X, Y) :- parents_of(Y, X), male(Y).

/* 娘 */
daughter_of(X, Y) :- parents_of(X, Y), female(Y).

/* 祖父 */
grandfather_of(X, Y) :- father_of(X, Y), parents_of(Y, Z).
