%Define the module that will hold the functions
-module(hello_world).
% export the function with zero parameters
-export([hello/0]).
-export([show/0]).
% this function is being exported with 1 parameter in each function
-export([old/1,randg/1]).
% this finction is being exported with 3 parameters in the function
-export([maps/3]).

% this is creating a record
-record(me, {name, age}).

% prints the things in show in a nice way then adds a new line twice
% function
println(What) -> io:format("~p~n~n", [What]).
% this print is for the descriptions that only prints one new line
% function
print(What) -> io:format("~p~n", [What]).

% recursion function example with the use of a guard
% when the number passed is greater than 35 you are old
% when it is less than 35 you are considered young
old(Age) when Age > 35 -> 'you are old';
old(Age) when Age < 35 -> 'you are young'. 


% hello function that prints hello world to the screen
hello() ->
    io:fwrite("hello world~n").


show() ->

    print("This shows Integers and Floats"),
    % this is using the print function and println to ger the format right
    println([2+3, 2#111, 16#ffa, 2.3e3]),

    print("This is a string"),
    println("This is a string in Erlang"),

    print("This is a example of Booleans"),
    println(true and false),

    print("This is an example of an atom"),
    println(cool),

    print("This is an example of a list"),
    println([1,2,3]),

    print("Example of head and tail in a list [1,2,3]"),
    [Head | Tail] = [1,2,3],

    print("This is the head"),
    println(Head),

    print("This is the tail or what is left after the head is off"),
    println(Tail),


    print("This is an example of an tuple"),
    println({"Dawson", 1, ok}),

    print("This is an example of an Map"),
    println(#{"age"=> 23}),

    print("This is an example of an Record"),
    println(#me{name="Dawson", age=20}),

    print("This is an example of an bit string and bianary"),
    println({<<"ABC">>, <<001>>}),

    print("This is an example of a reference"),
    println(make_ref()),

    print("This shows that a function also has a value"),
    Fun = fun() -> 10 end,
    println(Fun),

    print("This is an example of a process identifier"),
    println(self()).



% THis is a example of guards and recursion
randg(N) ->

    % the value of X is set to what ever the function old returns
    X = old(N),
    % we want to print the value of X in a nice way to the console
    io:fwrite("~p", [X]).


% This is an example to show the use of maping from a list
maps(N1, N2, N3) ->

    % Creates a list of 3 people with ages that are passed in
    Lst = [{"Person 1 age", N1},{"Person 2 age", N2},{"Person 3 age", N3}],
    %uses the maps to print the list
    io:fwrite("~p~n",[maps:from_list(Lst)]).