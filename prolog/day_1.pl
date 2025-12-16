% [day_1].

author(tolkien, lotr).
author(martin, got).
author(tolkien, hobbit).
author(herbert, dune).

% author(tolkien, X).

plays(mary, guitar).
plays(andrew, keyboard).
plays(lex, guitar).
plays(mary, drums).
plays(paul, bass).
plays(andrew, guitar).

genre(mary, rock).
genre(andrew, pop).
genre(lex, rock).
genre(paul, punk).
genre(paul, ska).

genre_plays(X, Y, Z) :-
    genre(Z, X),
    plays(Z, Y).

% genre_plays(X, guitar, Z).
