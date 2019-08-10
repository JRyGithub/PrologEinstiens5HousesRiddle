/* leftOf(X, Y) :- X is Y-1.
rightOf(X, Y) :- X is Y+1.

neighbours(X,Y) :- leftOf(X,Y).
neighbours(Y,X) :- rightOf(X,Y).

solution (Houses, Fishowner) :-
	Houses = [
			house(1, n1, c1, p1, d1, cb1),
			house(2, n2, c2, p2, d2, cb2),
			house(3, n3, c3, p3, d3, cb3),
			house(4, n4, c4, p4, d4, cb4),
			house(5, n5, c5, p5, d5, cb5)],
		%the brit lives in Red House
	member(_, brit, red, _, _, _),
		%the Swede keeps dogs as pets
	member(_, swede, _, dogs, _, _),
		%the Dane drinks tea
	member(_, dane, _, _, tea, _),
		%the green house is on the left of the white house
	member(X, _, green, _, _, _),
	member(Y, _, white, _, _, _),
	leftOf(X,Y),
		%the green house’s owner drinks coffee
	member(_, _, green, _, coffee, _),
	%the person who smokes Pall Mall rears birds
	member(_, _, _, birds, _, pallMall),
	%the owner of the yellow house smokes Dunhill
	member(_, _, yellow, _, _, dunhill),
	%the man living in the center house drinks milk
	member(3, _, _, _, milk, _),
	%the Norwegian lives in the first house
	member(1, norwegian, _, _, _, _),
	%the man who smokes blends lives next to the one who keeps cats
	member(Z, _, _, _, _, blends),
	memebr(W, _, _, cats, _, _),
	neighbours(Z,W),
	%the man who keeps horses lives next to the man who smokes Dunhill
	member(U, _, _, _, _, dunhill),
	memebr(V, _, _, horses, _, _),
	neighbours(Z,W),
	%the owner who smokes BlueMaster drinks beer
	member(_, _, _, _, beer, blueMaster),
	%the German smokes Prince
	member(_, german, _, _, _, prince),
	%the Norwegian lives next to the blue house
	member(J, norwegian, _, _, _, _),
	memebr(K, _, blue, _, _, _),
	neighbours(K,J),
	%the man who smokes blend has a neighbor who drinks water
	member(A, _, _, _, _, blends),
	memeber(B, _, _, _, water, _),
	neighbours(A,B),
	%Fishowner has a fish
	member(_, Fishowner, _, fish, _, _). */
	neighbor(X, Y, List) :-
		nextto(X, Y, List);
		nextto(Y, X, List).  
	
	% Houses is list of 5-tuple [nationality, pet, drink, smoke, color]
	fishowner(Houses, FishOwner):-
		member([brit, _, _, _, red], Houses),  %Hint 1
		member([swede, dog, _, _, _], Houses), %Hint 2
		member([dane, _, tea, _, _], Houses), %Hint 3
		nextto([_, _, _, _, green], [_, _, _, _, white], Houses), %Hint 4
		member([_, _, coffee, _, green], Houses), %Hint 5
		member([_, bird, _, pallmall, _], Houses), %Hint 6
		member([_, _, _, dunhill, yellow], Houses), %Hint 7
		nth1(3, Houses, [_, _, milk, _, _]), %Hint 8
		nth1(1, Houses, [norwegian, _, _, _, _]), %Hint 9
		neighbor([_, _, _, blends,_], [_, cat, _, _, _], Houses), %Hint 10
		neighbor([_, horse, _, _, _], [_, _, _, dunhill, _], Houses), %Hint 11
		member([_, _, beer, bluemasters, _], Houses), %Hint 12
		member([german, _, _, prince, _], Houses), %Hint 13
		neighbor([norwegian, _, _, _, _], [_, _, _, _, blue], Houses), %Hint 14
		neighbor([_, _, _, blends,_], [_, _, water, _, _], Houses), %Hint 15
		member([FishOwner, fish, _, _, _], Houses).
	
	solution(X) :- 
		fishowner([_, _, _, _, _], X).