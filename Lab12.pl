
% Directed Edges
edge('Makkah', 'Madinah').
edge('Makkah', 'Riyadh').
edge('Madinah', 'Taif').
edge('Madinah', 'Tabuk').
edge('Tabuk', 'Taif').
edge('Taif', 'Dammam').
edge('Riyadh', 'Dammam').
edge('Dammam', 'Riyadh').
edge('Dammam', 'Qatif').
edge('Qatif', 'Dammam').
edge('Qatif', 'Madinah').

% Find a path
travel(From, To, Path) :-
    go(From, To, [From], ReversePath),
    reverse(ReversePath, Path).

go(From, To, Visited, [To|Visited]) :-
    edge(From, To).

go(From, To, Visited, Path) :-
    edge(From, Next),
    \+ member(Next, Visited),
    go(Next, To, [Next|Visited], Path).
