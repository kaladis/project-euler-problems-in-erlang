-module(problem4).
-compile([export_all]).

%% A palindromic number reads the same both ways. The largest
%% palindrome made from the product of two 2-digit numbers is 9009 =
%% 91 × 99. 
%% Find the largest palindrome made from the product of two 
%% 3-digit numbers

%% NOT COMPLETE

largest_pali_3()->
    L = lists:seq(100,999),
    loopL(L,L).

loopL([],_L)->
    ok;
loopL([H|T],L)->
    loopN(H,L),
    loopL(T,L).

loopN(_N,[])->
    ok;
loopN(N,[H|T]) ->
    io:format("~p*~p~n",[N,H]),
    loopN(N,T).

main()->
    largest_pali_3().
