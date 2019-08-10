/* Assignment 1 Prolog
Joshua Ryland 5654548 jryl559
Logic Puzzle Einstiens Puzzle and Who has the fish?
*/
houses(Houses) :-
	% There is list of 5 houses (Houses)
	% Each House with this list (h) has:
	%h(nationality,pets,cigarbrand,drink,colourHouse)
	length(Houses, 5),                                            %  Establishing Amount of Houses
	member(h(english,_,_,_,red), Houses),                         %  1
	member(h(swede,dogs,_,_,_), Houses),                         %  2
    member(h(dane,_,_,tea,_), Houses),                       %  3
    next(h(_,_,_,_,green), h(_,_,_,_,white), Houses),             %  4
	member(h(_,_,_,coffee,green), Houses),                        %  5
	member(h(_,birds,pallMall,_,_), Houses),                       %  6
	member(h(_,_,dunhill,_,yellow), Houses),                         %  7
	Houses = [_,_,h(_,_,_,milk,_),_,_],                           %  8
	Houses = [h(norwegian,_,_,_,_)|_],                            % 9
	next(h(_,cats,_,_,_), h(_,_,blends,_,_), Houses),        % 10
	next(h(_,_,dunhill,_,_), h(_,horses,_,_,_), Houses),              % 11
	member(h(_,_,blueMaster,beer,_), Houses),                         % 12
	member(h(german,_,prince,_,_), Houses),                       % 13
	next(h(norwegian,_,_,_,_), h(_,_,_,_,blue), Houses),          % 14
	next(h(_,_,_,water,_), h(_,_,blends,_,_), Houses), 		% 15
	member(h(_,fish,_,_,_), Houses).		% 16 This while not a rule is implied by question.
%the predicates, take two variables and list variable
%they both say that within List(Ls), there is maybe a house then AorB house then AorB House then maybe some other houses.
%effectively allowing you to dictate whether or not two houses are next to each other
next(A, B, Ls) :- append(_, [A,B|_], Ls).
next(A, B, Ls) :- append(_, [B,A|_], Ls).

%This predicate simply calls the houses predicate establishing Houses list and queries
%this list for the house owner who has a fish
fishOwner(Owner) :-
	houses(Houses),
	member(h(Owner,fish,_,_,_), Houses).