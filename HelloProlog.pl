
/*
リストの要素を求める述語
(_Ys): アンダーバー始まりの変数は無名変数
未使用変数がコンパイル時にWarningがでるのをなくす
first_of_list([a,b,c,d],Z).
rest_of_list([a,b,c,d],Z).
*/
first_of_list([X | _Ys], X).
rest_of_list([_X | Ys], Ys).

/*
リストにデータを追加する述語
unshift_to_list(a, [b,c,d], Z).
push_to_list(a, [b,c,d], Z).
*/
unshift_to_list(X, Ls, [X | Ls]).
push_to_list([], X, [X]).
push_to_list([Y|Ls], X, [Y|Zs])
  :- push_to_list(Ls, X, Zs).

/*
n番目の要素を求める
trace(my_retrieve).
my_retrieve(3, [sprint, summer, autumn, winter], X)
nodebug.
*/
my_retrieve(1, [X | _Ls], X).
my_retrieve(N, [_Y | Ls], X)
  :- N > 1, N1 is N - 1, my_retrieve(N1, Ls, X).

/*
n番目にデータを挿入
 my_insert(2, e, [a,b,c,d], X).
*/
my_insert(1, X, Ls, [X | Ls]).
my_insert(N, X, [Y | Ls], [Y | Zs])
  :- N > 1, N1 is N - 1, my_insert(N1, X, Ls, Zs).

/*
リストの長さを求める
*/

/*
リストの結合
- ひっつけるとZになるXとY
my_append([a, b, c], [d, e, f], Z).
my_append(Z, [c, d], [a, b, c, d]).
my_append(X, Y, [a, b, c, d]).
*/

/*
要素がリストに含まれているかどうか
*/


/*
リストを逆順にする
1. 停止条件: 元リストが空になったらどうするか?
2. 再帰
  (a) 元リストから1文字目を取り出す
  (b) 新リストにその文字を追加する (append)
my_reverse([q, p, o], X).
*/
my_reverse([], []).
my_reverse([Y | Ls], X)
  :- my_reverse(Ls, Z), append(Z, [Y], X).



/**
1からNまでの整数の和「S」を求める sum(N, S) を作成せよ
1. 停止条件:
2. 再帰条件:
sum(N, S) :- N =< 1, !.
sum(N, S) :- N1 is N - 1, sum(N1, S1), S is S1 + N.
*/

/**
*/
