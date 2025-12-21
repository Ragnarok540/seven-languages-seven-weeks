-module(day_1).
-export([num_words/1, count_to/1, validate/1]).

% • Write a function that uses recursion to return the number of
% words in a string.

num_words([]) -> 1;
num_words([H|T]) ->
    case H of
        32 -> 1 + num_words(T);
        _ -> num_words(T)
    end.

% c(day_1).
% day_1:num_words("Hello").
% day_1:num_words("Hello World").

% • Write a function that uses recursion to count to ten.

count_to(0) -> io:format("done\n", []);
count_to(Num) ->
    io:format("~w\n", [Num]),
    count_to(Num - 1).

% c(day_1).
% day_1:count_to(10).

% • Write a function that uses matching to selectively print “success”
% or “error: message” given input of the form {error, Message} or
% success.

validate(Input) ->
    case Input of
        success ->
            io:format("success\n", []);
        {error, Message} ->
            io:format("error: ~s\n", [Message]);
        _ ->
            io:format("bad input: ~s\n", [Input])
    end.

% c(day_1).
% day_1:validate(success).
% day_1:validate({error, "timeout"}).
% day_1:validate(qwerty).
