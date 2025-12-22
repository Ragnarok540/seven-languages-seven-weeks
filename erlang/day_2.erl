-module(day_2).
-export([get_value/2, get_total/1, matches/2, check_won/2, who_won/1]).

% • Consider a list of keyword-value tuples, such as [{erlang, "a
% functional language"}, {ruby, "an OO language"}]. Write a function
% that accepts the list and a keyword and returns the associated
% value for the keyword.

get_value([], Keyword) ->
    io:format("keyword not found: ~s\n", [Keyword]);
get_value(AssocList, Keyword) ->
    [H|T] = AssocList,
    case H of
        {Keyword, Value} ->
            io:format("~s\n", [Value]);
        _ -> get_value(T, Keyword)
    end.

% c(day_2).
% AssocList = [{erlang, "a functional language"}, {ruby, "an OO language"}].
% day_2:get_value(AssocList, ruby).
% day_2:get_value(AssocList, python).

% • Consider a shopping list that looks like [{item quantity price}, ...].
% Write a list comprehension that builds a list of items of the form
% [{item total_price}, ...], where total_price is quantity times price.

get_total(ShoppingList) ->
    [{Item, Price * Quantity} || {Item, Quantity, Price} <- ShoppingList].

% c(day_2).
% ShoppingList = [{eggs, 6, 5}, {milk, 4, 2}, {bread, 2, 3}].
% day_2:get_total(ShoppingList).

% • Write a program that reads a tic-tac-toe board presented as a list
% or a tuple of size nine. Return the winner (x or o) if a winner
% has been determined, cat if there are no more possible moves,
% or no_winner if no player has won yet.

matches(_, []) ->
    true;
matches(Value, List) ->
    [H|T] = List,
    case H of
        Value ->
            true and matches(Value, T);
        _ -> false
    end.

% List1 = [1,1,1,1].
% day_2:matches(1, List1).
% List2 = ["A", "B", "C"].
% day_2:matches("A", List2).

check_arr(Symbol, true) ->
    Symbol;
check_arr(_, false) ->
    "".

check(Symbol, List) ->
    check_arr(Symbol, matches(Symbol, List)).

% List3 = ["X", "X", "X"].
% day_2:check("X", List).

check_won(_, []) -> false;
check_won(Symbol, List) ->
    [H|T] = List,
    case check(Symbol, H) of
        Symbol -> true;
        _ -> check_won(Symbol, T)
    end.

% List4 = [["X", "O", "X"], ["X", "X", "X"]].
% day_2:check_won("X", List4).

who_won(Board) ->
    [A, B, C,
     D, E, F,
     G, H, I] = Board,
    Cases = [[A, B, C], [D, E, F], [G, H, I],
             [A, D, G], [B, E, H], [C, F, I],
             [A, E, I], [C, E, G]],
    X = check_won("X", Cases),
    if
        X -> "X";
        true ->
            O = check_won("O", Cases),
            if
                O -> "O";
                true -> "Nobody"
            end
    end.

% Board2 = ["X", "O", "O",
%           "X", "X", "O",
%           "O", "X", "O"].
% day_2:who_won(["O", "X", "O",
%                "X", " ", "X",
%                " ", "X", "O"]).
