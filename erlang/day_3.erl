-module(day_3).
-export([roulette_loop/0,
    doctor_loop/0,
    doctor_monitor/0,
    roulette_process/0]). 

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
            io:format("(doctor_loop) Creating and monitoring process.~n"),
            register(revolver, spawn_link(?MODULE, roulette_loop, [])),
            doctor_loop();
        kill ->
            io:format("ouch.~n"),
            exit({doctor, die, at, erlang:time()});
        {'EXIT', From, Reason} -> 
            io:format("The shooter ~p died with reason ~p.", [From, Reason]),
            io:format(" Restarting. ~n"),
            self() ! new, 
            doctor_loop()
    end.

doctor_monitor() ->
    process_flag(trap_exit, true),
    receive
        new ->
            io:format("(doctor_monitor) Creating and monitoring process.~n"),
            register(monitor, spawn_link(?MODULE, doctor_loop, [])),
            monitor ! new,
            doctor_monitor();
        {'EXIT', From, Reason} -> 
            io:format("The monitor ~p died with reason ~p.", [From, Reason]),
            io:format(" Restarting. ~n"),
            self() ! new, 
            doctor_monitor()
    end.

roulette_process() ->
    Doc = spawn(?MODULE, doctor_monitor, []),
    Doc ! new.

% c(day_3).
% day_3:roulette_process().
% revolver ! 1.
% revolver ! 2.
% revolver ! 3.
% revolver ! 4.
% monitor ! kill.
