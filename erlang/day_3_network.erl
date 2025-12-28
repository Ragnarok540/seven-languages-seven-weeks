% • Make the translate_service work across a network.
% • Monitor the translate_service and restart it should it die.

-module(day_3_network).
-export([translate_loop/0,
    translate_monitor_loop/0,
    translate_process/0]). 

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
            exit({translator, die, at, erlang:time()})
    end.

translate_monitor_loop() ->
    process_flag(trap_exit, true),
    receive
        new ->
            io:format("Creating and monitoring process.~n"),
            register(trans, spawn_link(?MODULE, translate_loop, [])),
            translate_monitor_loop();
        {'EXIT', From, Reason} -> 
            io:format("The translator ~p died with reason ~p.", [From, Reason]),
            io:format(" Restarting. ~n"),
            self() ! new, 
            translate_monitor_loop()
    end.

translate_process() ->
    Trans = spawn(?MODULE, translate_monitor_loop, []),
    Trans ! new.

% c(day_3).
% day_3:translate_process().
% trans ! "casa".
% trans ! "blanca".
% trans ! "loco".
% trans ! "casa".
