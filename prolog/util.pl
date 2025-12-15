foldl(Goal, List, V0, V) :-
    foldl_(List, Goal, V0, V).

foldl_([], _, V, V).
foldl_([H|T], Goal, V0, V) :-
    call(Goal, H, V0, V1),
    foldl_(T, Goal, V1, V).
