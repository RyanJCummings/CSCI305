adjacent(X,Y) :- X is (Y + 1);
                 X is (Y - 1).

hallway([bedroom(_,1), bedroom(_,2), bedroom(_,3), bedroom(_,4), bedroom(_,5)]).

who_sleeps(X) :- hallway(X),
    member(bedroom(hunter, A), X), A \= 5,
    member(bedroom(laura, B), X), B \= 1,
    member(bedroom(addiley, C), X), 
    member(bedroom(ramey, D), X), D > B, 
    member(bedroom(arnie, E), X), E \= 1, E \= 5, \+ (adjacent(E,B)), \+ (adjacent(E,C)).
