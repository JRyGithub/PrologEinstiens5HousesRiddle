/*Tells you whether or not someone is a half sister
Joshua Ryland 5654548 jryl559
*/
%females
female(ann).
female(mary).
female(sue).
female(maddie).

%males
male(ed).
male(sam).


%parents of (parent,child)
parent(sue, mary).
parent(sue, ann).
parent(sue, maddie).
parent(ed, mary).
parent(sam, ann).
parent(ed, maddie).

%HalfSister
halfSisterOf(Sister, Nibling):-
	parent(A, Sister),
	parent(A, Nibling),
	parent(B, Sister),
	parent(C, Nibling),
	not(B = C),
	not(A = B),
	not(A = C),
	female(Sister),
	not(Sister = Nibling).
