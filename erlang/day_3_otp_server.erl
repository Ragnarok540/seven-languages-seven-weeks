% • Create a basic OTP server that logs messages to a file.
-module(day_3_otp_server).
-behaviour(gen_server).

%% API
-export([start_link/0, ping/1, log_message/2]).
%% gen_server callbacks
-export([init/1, handle_call/3, handle_cast/2]).

start_link() ->
    gen_server:start_link({local, ?MODULE}, ?MODULE, [], []).

ping(Server) ->
    gen_server:call(Server, ping).

log_message(Server, Message) ->
    gen_server:call(Server, {log_message, Message}).

init(_Args) ->
    {ok, {}}.

handle_call(ping, _From, State) ->
    {reply, pong, State};
handle_call({log_message, Message}, _From, State) ->
    {ok, F} = file:open("messages.txt", [append]),
    file:write(F, Message ++ "\n"),
    {reply, log_message, State}.

handle_cast(_msg, State) ->
    {noreply, State}.

% c(day_3_otp_server).
% {ok, Pid} = day_3_otp_server:start_link().
% day_3_otp_server:ping(Pid).
% day_3_otp_server:log_message(Pid, "hi").
