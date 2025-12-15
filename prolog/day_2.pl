% • Reverse the elements of a list.

reverse2([], []).
reverse2([H|T], RevList) :-
    append(RevT, [H], RevList),
    reverse2(T, RevT).

 reverse3([], Z, Z).
 reverse3([H|T], Z, Acc) :-
    reverse3(T, Z, [H|Acc]).

% reverse3([3, 2, 1], X, []).

% • Find the smallest element of a list.



% • Sort the elements of a list.


