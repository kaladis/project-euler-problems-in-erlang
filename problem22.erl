%% Using names.txt (right click and 'Save Link/Target As...'), a 46K text
%% file containing over five-thousand first names, begin by sorting it
%% into alphabetical order. Then working out the alphabetical value for
%% each name, multiply this value by its alphabetical position in the
%% list to obtain a name score.

%% For example, when the list is sorted into alphabetical order, COLIN,
%% which is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the
%% list. So, COLIN would obtain a score of 938 × 53 = 49714.

%% What is the total of all the name scores in the file?

%% "MARY","PATRICIA","LINDA","BARBARA"

%% NOT COMPELETE 

-module(problem22).
-compile([export_all]).

total_score(L)->
    total_score(L,0,1).

total_score([],Acc,_Counter)->
    Acc;
total_score([H|T], Acc, Counter)->
    Score = Counter * alpha_score(H),
    total_score(T,Acc+Score,Counter+1).

alpha_score(Name)->
    alpha_score(Name,1,0).

alpha_score(Name,Position,Acc) when Position =< length(Name)->
    Alpha = string:substr(Name,Position,1),
    alpha_score(Name,Position+1,Acc+alpha_value(Alpha));

alpha_score(_Name,_Position,Acc) ->
    Acc.

alpha_value(Alpha)->
    if 
	Alpha == "a" orelse Alpha == "A" ->  1;
	Alpha == "d" orelse Alpha == "D" ->  4;
	Alpha == "i" orelse Alpha == "I" ->  9;
	Alpha == "k" orelse Alpha == "K" ->  11;
	Alpha == "l" orelse Alpha == "L" ->  12;
	Alpha == "s" orelse Alpha == "S" ->  19;
	true -> 0
    end.
