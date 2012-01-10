-module(problem6).
-author("kaladis").
-compile([export_all]).

%% The sum of the squares of the first ten natural numbers is, 12 + 22
%% + ... + 102 = 385

%% The square of the sum of the first ten natural numbers is, (1 + 2 +
%% ... + 10)2 = 552 = 3025

%% Hence the difference between the sum of the squares of the first
%% ten natural numbers and the square of the sum is 3025 − 385 = 2640.

%% Find the difference between the sum of the squares of the first one
%% hundred natural numbers and the square of the sum.

%% usage 
%% problem6:main(100).
%% result
%% 25164150

sum_of_squares(S,E)->
    sum_of_squares_list(lists:seq(S,E)).

sum_of_squares_list(L)->
    sum_of_squares_list(L,0).

sum_of_squares_list([],Acc)->
    Acc;
sum_of_squares_list([H|T],Acc)->
    sum_of_squares_list(T,Acc+(H*H)).

square_of_sums(S,E)->
    Sum = lists:sum(lists:seq(S,E)),
    Sum*Sum.

main(N)->
    square_of_sums(1,N) - sum_of_squares(1,N).
