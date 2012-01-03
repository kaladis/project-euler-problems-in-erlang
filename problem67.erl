-module(problem67).
-author("kaladis").
-compile([export_all]).
%% By starting at the top of the triangle below and moving to adjacent
%% numbers on the row below, the maximum total from top to bottom is
%% 23.
%% 
%%     3
%%    7 4
%%   2 4 6
%%  8 5 9 3

%% That is, 3 + 7 + 4 + 9 = 23.

%% Find the maximum total from top to bottom in triangle.txt (right
%% click and 'Save Link/Target As...'), a 15K text file containing a
%% triangle with one-hundred rows.
%% NOTE: This is a much more difficult version of Problem 18. It is
%% not possible to try every route to solve this problem, as there are
%% 299 altogether! If you could check one trillion (1012) routes every
%% second it would take over twenty billion years to check them
%% all. There is an efficient algorithm to solve it.

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
    L = list_to_integer(lists:nth(CurPs,H)),
    R = list_to_integer(lists:nth(CurPs+1,H)),
    case L > R  of
	true ->
	    path(T,[CurPs|Path],[lists:nth(CurPs,H)|Values]);
	false ->
	    path(T,[CurPs+1|Path],[lists:nth(CurPs+1,H)|Values])
    end.


readlines(FileName) ->
    {ok, Device} = file:open(FileName, [read]),
    get_all_lines(Device, []).

get_all_lines(Device, Accum) ->
    case io:get_line(Device, "") of
        eof  -> 
	    file:close(Device), 
	    lists:reverse(Accum);
        Line ->
	    Temp = string:tokens((lists:reverse(tl(lists:reverse(Line))))," "),
	    get_all_lines(Device, [ Temp | Accum] )
    end.

main()->
    L = readlines("triangle.txt"),
    path(L).
