% In this section, I’m going to outline a single problem called sleeping
% barber. It was created by Edsger Dijkstra in 1965. It has these
% characteristics:
% • A barber shop takes customers.
% • Customers arrive at random intervals, from ten to thirty
% milliseconds.
% • The barber shop has three chairs in the waiting room.
% • The barber shop has one barber and one barber chair.
% • When the barber’s chair is empty, a customer sits in the chair,
% wakes up the barber, and gets a haircut.
% • If the chairs are occupied, all new customers will turn away.
% • Haircuts take twenty milliseconds.
% • After a customer receives a haircut, he gets up and leaves.
% Write a multithreaded program to determine how many haircuts a bar-
% ber can give in ten seconds.

-module(day_3_clojure).
-export([start/0, barbershop/1, wait_room/2, customer/1, barber/1]).

start() ->
    Barber = spawn(?MODULE, barber, [sleep]),
    Queue = queue:new(),
    WaitRoom = spawn(?MODULE, wait_room, [Barber, Queue]),
    barbershop(WaitRoom).

barbershop(WaitRoom) ->
    RandTime = rand:uniform(2000) + 1000,
    timer:sleep(RandTime),
    WaitRoom ! new_customer,
    barbershop(WaitRoom).

wait_room(Barber, Queue) ->
    receive
        new_customer ->
            Customer = spawn(?MODULE, customer, [self()]),
            io:format("New Customer: ~p.~n", [Customer]),
            Len = queue:len(Queue),
            io:format("Current queue: ~p.~n", [Queue]),
            if
                Len < 3 ->
                    NewQueue = queue:in(Customer, Queue),
                    Customer ! wait,
                    wait_room(Barber, NewQueue);
                Len >= 3 ->
                    Customer ! left,
                    wait_room(Barber, Queue);
                true ->
                    io:format("No one in Queue.~n")
            end;
        next ->
            case queue:out(Queue) of
                {{value, Customer}, NewQueue} ->
                    Barber ! {haircut, Customer},
                    wait_room(Barber, NewQueue);
                _ ->
                    wait_room(Barber, Queue)
            end
    end.

customer(WaitRoom) ->
    receive
        wait ->
            io:format("Customer ~p is waiting.~n", [self()]),
            customer(WaitRoom); % ready?
        done ->
            WaitRoom ! next,
            io:format("Customer ~p is done.~n", [self()]),
            ok;
        left ->
            WaitRoom ! next,
            io:format("Customer ~p left.~n", [self()]),
            ok
    end.

barber(sleep) ->
    receive
        {haircut, Customer} ->
            io:format("Barber performing haircut on ~p.~n", [Customer]),
            barber({haircut, Customer});
        _ ->
            io:format("Barber is sleeping.~n"),
            sleep
    end;
barber({haircut, Customer}) ->
    timer:sleep(4000),
    Customer ! done,
    barber(sleep).

% c(day_3_clojure).
% day_3_clojure:start().
% TODO: fix so it starts cutting hair with the first customer, and not just
% when a customer leaves becuase the waiting room is full
