-module(problem18).
-author("kaladis").
-compile([export_all]).

%% By starting at the top of the triangle below and moving to adjacent
%% numbers on the row below, the maximum total from top to bottom is 23.

%%    3
%%   7 4
%%  2 4 6
%% 8 5 9 3

%% That is, 3 + 7 + 4 + 9 = 23.
%% However, Problem 67, is the same challenge with a triangle containing
%% one-hundred rows; it cannot be solved by brute force, and requires a
%% clever method!

%% Input:
%% problem18:path([[1],[2,1],[4,5,2],[7,8,9,10],[4,53,5,94,54]]).
%% Output:
%% [{path,[1,1,2,3,4]},{values,[1,2,5,9,94]}]

check_input([])->
    not_ok;
check_input(L)->
    check_input(L,1,ok).

check_input([],_Count,ok) ->
    ok;
check_input([H|T],Count,ok) when Count == length(H) ->
    check_input(T,Count+1,ok);
check_input(_H,_Count,ok) ->
    not_ok.

path([H|T])->
    case check_input([H|T]) of
	ok ->
	    path(T,[1],H);
	not_ok ->
	    io:format("Please check the input")
    end.

path([],Path,Values)->
    [{path,lists:reverse(Path)},{values,lists:reverse(Values)}];

path([H|T],Path, Values) ->
    CurPs = hd(Path),
    L = lists:nth(CurPs,H),
    R = lists:nth(CurPs+1,H),
    case L > R  of
	true ->
	    path(T,[CurPs|Path],[lists:nth(CurPs,H)|Values]);
	false ->
	    path(T,[CurPs+1|Path],[lists:nth(CurPs+1,H)|Values])
    end.
