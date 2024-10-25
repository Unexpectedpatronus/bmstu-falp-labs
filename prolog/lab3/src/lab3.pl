% Фибоначчи
fib(0, 0).
fib(1, 1).
fib(N, F) :-
    N > 1,
    N1 is N - 1,
    N2 is N - 2,
    fib(N1, F1),
    fib(N2, F2),
    F is F1 + F2.


% Фибоначчи с мемоизацией
:- dynamic fib_mem/2.

fib_mem(0, 0).
fib_mem(1, 1).
fib_mem(N, F) :-
    N > 1,
    N1 is N - 1,
    N2 is N - 2,
    fib_mem(N1, F1),
    fib_mem(N2, F2),
    F is F1 + F2,
    assertz(fib_mem(N, F)).



% Факториал
fact(0, 1).
fact(N, F) :-
    N > 0,
    N1 is N - 1,
    fact(N1, F1),
    F is F1 * N.

% Факториал с мемоизацией
:- dynamic fact_mem/2.

fact_mem(0, 1).
fact_mem(N, F) :-
    N > 0,
    N1 is N - 1,
    fact_mem(N1, F1),
    F is N * F1,
    assertz(fact_mem(N, F)).