-module(problem1).
-author("kaladis").
-compile([export_all]).

%% If we list all the natural numbers below 10 that are multiples of 3
%% or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.  Find
%% the sum of all the multiples of 3 or 5 below 1000(N).

sum_of_nums_3_5(N)->
    L = lists:seq(1,N-1),
    sum_of_nums_3_5(L,0).

sum_of_nums_3_5([],Acc)->
    Acc;
sum_of_nums_3_5([H|T],Acc) when H rem 3 == 0 orelse H rem 5 == 0 ->
    sum_of_nums_3_5(T,Acc+H);
sum_of_nums_3_5([_H|T],Acc) ->
    sum_of_nums_3_5(T,Acc).

main()->
    sum_of_nums_3_5(1000).
    
