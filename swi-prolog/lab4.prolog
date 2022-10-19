parent(john, bob).
parent(mary, bob).
parent(mary, ann).
parent(bob, liz).
parent(bob, paul).
parent(bob, sam).
parent(paul, pat).

man(john).
man(paul).
man(bob).
man(sam).
man(pat).

woman(ann).
woman(mary).
woman(liz).

father(X, Y) :- man(X), parent(X, Y).
mother(X, Y) :- woman(X), parent(X, Y).
brother(X, Y) :- man(X), parent(Z, X), parent(Z, Y), X \== Y.
sister(X, Y) :- woman(X), parent(Z, X), parent(Z, Y), X \== Y.
grandson(X, Y) :- man(X), parent(Z, X), parent(Y, Z).
aunt(X, Y) :- parent(Z, Y), sister(X, Z).
have_2_children(X) :- parent(X, Y), parent(X, Z), not((parent(X, A), A \== Z, A \== Y)).
continuer_of_the_family(X) :- father(X, Y), man(Y), !.

/** <examples>

?- father(X, sam).

?- mother(_, bob).

?- sister(X, sam).

?- sister(_, liz).

?- brother(X, bob).

?- grandson(X, mary).

?- grandson(paul, X).

?- aunt(X, sam).

?- (brother(_X, ann); sister(_X, ann)), parent(_X, _), !

?- have_2_children(X).

?- continuer_of_the_family(bob).

*/
