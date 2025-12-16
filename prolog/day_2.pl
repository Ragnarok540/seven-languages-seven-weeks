:- include('util.pl').

% [day_2].

% • Reverse the elements of a list.

reverse2([], []).
reverse2([H|T], RevList) :-
    append(RevT, [H], RevList),
    reverse2(T, RevT).

 reverse3([], Z, Z).
 reverse3([H|T], Z, Acc) :-
    reverse3(T, Z, [H|Acc]).
reverse3(Ls, X) :-
    reverse3(Ls, X, []).

% reverse3([3, 2, 1], X).

reverse4([]) --> [].
reverse4([H|T]) --> reverse4(T), [H].

% phrase(reverse4([a,b,c]), Ls).

% • Find the smallest element of a list.

num_num_min(X, Y, Min) :-
    Min #= min(X, Y).

list_min([H|T], Min) :-
    foldl(num_num_min, T, H, Min).

% list_min([3,1,2], Min).

% • Sort the elements of a list.

sort2([], Z, Z).
sort2(Unsorted, Sorted, Acc) :-
    list_min(Unsorted, Min),
    select(Min, Unsorted, UnsortedF),
    % delete(Unsorted, Min, UnsortedF),
    sort2(UnsortedF, Sorted, [Min|Acc]).
sort2(Unsorted, Sorted) :-
    sort2(Unsorted, Sorted, []).

% sort2([2,3,4,1], X).
