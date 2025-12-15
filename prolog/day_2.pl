:- include('util.pl').

% • Reverse the elements of a list.

reverse2([], []).
reverse2([H|T], RevList) :-
    append(RevT, [H], RevList),
    reverse2(T, RevT).

 reverse3([], Z, Z).
 reverse3([H|T], Z, Acc) :-
    reverse3(T, Z, [H|Acc]).

% reverse3([3, 2, 1], X, []).

reverse4([]) --> [].
reverse4([L|Ls]) --> reverse4(Ls), [L].

% phrase(reverse4([a,b,c]), Ls).

% • Find the smallest element of a list.

num_num_min(X, Y, Min) :-
    Min #= min(X, Y).

list_min([H|T], Min) :-
    foldl(num_num_min, T, H, Min).

% list_min([3,1,2], Min).

% • Sort the elements of a list.
