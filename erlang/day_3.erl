-module(day_3).
-export([translate_loop/0, translate_process/0, roulette_loop/0, doctor_loop/0, roulette_process/0]). % doctor_monitor/0,

% • Monitor the translate_service and restart it should it die.

translate_loop() ->
    receive
        "casa" -> 
            io:format("house~n"), 
            translate_loop();
        "blanca" -> 
            io:format("white~n"), 
            translate_loop();
        _ -> 
            io:format("I don't understand.~n"), 
            translate_loop()
    end.

translate_process() ->
    Pid = spawn(?MODULE, translate_loop, []),
    Pid ! "casa",
    Pid ! "blanca",
    Pid ! "loco".

% c(day_3).
% day_3:translate_process().

% • Make the Doctor process restart itself if it should die.
% • Make a monitor for the Doctor monitor. If either monitor dies,
% restart it.

roulette_loop() ->
    receive
        3 ->
            io:format("bang.~n"),
            exit({roulette, die, at, erlang:time()});
        _ ->
            io:format("click~n"),
            roulette_loop()
    end.

doctor_loop() ->
    process_flag(trap_exit, true),
    receive
        new ->
            io:format("Creating and monitoring process.~n"),
            register(revolver, spawn_link(?MODULE, roulette_loop, [])),
            doctor_loop();
        {'EXIT', From, Reason} -> 
            io:format("The shooter ~p died with reason ~p.", [From, Reason]),
            io:format(" Restarting. ~n"),
            self() ! new, 
            doctor_loop()
    end.

% doctor_monitor() ->
%     receive
%         start ->
%             Mon = monitor(process, spawn(?MODULE, doctor_loop, [])),
%             Mon ! new,
%             doctor_monitor();
%         kill ->
%             exit({doctor, die, at, erlang:time()});
%         {'DOWN', MonitorRef, Type, Object, Info} ->
%             io:format("The doctor ~p died with reason ~p.", [MonitorRef, Info]),
%             io:format(" Restarting. ~n"),
%             self() ! start,
%             doctor_monitor()
%     end.

roulette_process() ->
    Doc = spawn(?MODULE, doctor_loop, []),
    Doc ! new.

% c(day_3).
% day_3:roulette_process().
% revolver ! 1.
% revolver ! 2.
% revolver ! 3.
% revolver ! 4.

% • Create a basic OTP server that logs messages to a file.
% • Make the translate_service work across a network.
