% • Take the sizer application and add a message to count the number
% of links on the page.
% • Bonus problem: Make the sizer follow the links on a given page,
% and load them as well. For example, a sizer for “google.com” would
% compute the size for Google and all of the pages it links to.

-module(day_3_scala).
-export([start/0,
    get_page/1,
    get_length/1,
    time_it/2,
    sequential/1,
    concurrent/1,
    start_re/0,
    get_uppercase/1,
    print_captured/2]).

start() ->
    inets:start(),
    ssl:start(),
    UrlList = ["https://www.bbc.com/",
        "http://www.erlang.org/",
        "http://www.google.com/",
        "http://www.cnn.com/"],
    io:format("Sequential:\n", []),
    time_it(sequential, [UrlList]),
    io:format("\nConcurrent:\n", []),
    time_it(concurrent, [UrlList]).

get_page(Url) ->
	case httpc:request(Url) of
		{ok, {{_, 200, _}, _, Body}} -> Body;
		{error, Err} ->
			io:format("ERROR: ~p~n", [Err])
	end.

get_length(Url) ->
    Body = get_page(Url),
    Length = string:length(Body),
    io:format("Site: ~p, Length: ~p\n", [Url, Length]).

time_it(Fun, Args) ->
    {Time, _Value} = timer:tc(?MODULE, Fun, Args),
    io:format("Time: ~p\n", [Time]).

sequential([]) -> ok;
sequential(UrlList) ->
    [H|T] = UrlList,
    get_length(H),
    sequential(T).

concurrent([]) -> ok;
concurrent(UrlList) ->
    [H|T] = UrlList,
    spawn(?MODULE, get_length, [H]),
    concurrent(T).

start_re() ->
    inets:start(),
    ssl:start(),
    Body = get_page("http://www.erlang.org/"),
    Captured = get_uppercase(Body),
    print_captured(Body, Captured).

get_uppercase(Body) ->
    Regex = "([A-Z])\\w+",
    {ok, Re} = re:compile(Regex, [multiline]),
    case re:run(Body, Re, [global]) of
        {match, Captured} ->
            Captured;
        nomatch ->
            io:format("No match.\n", [])
    end.

print_captured(_, []) -> ok;
print_captured(Body, Captured) ->
    [H|T] = Captured,
    [{Start, Length}, _] = H,
    Match = string:slice(Body, Start, Length),
    io:format("~p~n", [Match]),
    print_captured(Body, T).

% c(day_3_scala).
% day_3_scala:start().
% day_3_scala:start_re().
