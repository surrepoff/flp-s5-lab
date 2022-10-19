parent(mary, bob).
parent(mary, ann).
parent(john, bob).
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

а) Кто отец Сэма?
?- father(X, sam).

б) Есть ли мать у Боба? (ответ должен быть true)
?- mother(_, bob).

в) Кто сестра Сэма?
?- sister(X, sam).

г) Есть ли сестра у Лиз?
?- sister(_, liz).

д) Кто брат Боба?
?- brother(X, bob).

е) Кто внуки Мэри?
?- grandson(X, mary).

ж) Чей внук Паул?
?- grandson(paul, X).

з) Кто тетя Сэма?
?- aunt(X, sam).

и) Есть ли племянники у Энн?
?- (brother(_X, ann); sister(_X, ann)), parent(_X, _), !.

к) У кого ровно двое детей? (Пролог-система должна находить только Мэри, и,
причем, только один раз).
?- have_2_children(X).

л) Боб - продолжатель рода?
?- continuer_of_the_family(bob).

*/
