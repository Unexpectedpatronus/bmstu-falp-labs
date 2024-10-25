% Карта лабиринта: каждая ячейка описывается через map(X, Y, Содержимое).
% Содержимое: p - пустая клетка, w - стена, t(TX, TY) - телепорт, trap(K) - ловушка
map(1, 1, p).
map(1, 2, w).
map(1, 3, p).
map(1, 4, t(2, 2)).
map(2, 1, p).
map(2, 2, p).
map(2, 3, trap(3)).
map(2, 4, p).

% Позиция выхода
exit(2, 4).

% Перемещение игрока (обычное и прыжок через клетку)
move(X, Y, NX, Y) :- NX is X + 1.  % вправо
move(X, Y, NX, Y) :- NX is X - 1.  % влево
move(X, Y, X, NY) :- NY is Y + 1.  % вниз
move(X, Y, X, NY) :- NY is Y - 1.  % вверх
move(X, Y, NX, Y) :- NX is X + 2.  % прыжок вправо
move(X, Y, NX, Y) :- NX is X - 2.  % прыжок влево
move(X, Y, X, NY) :- NY is Y + 2.  % прыжок вниз
move(X, Y, X, NY) :- NY is Y - 2.  % прыжок вверх

% Проверка, можно ли идти на клетку (не является стеной)
can_move(X, Y) :- map(X, Y, p).
can_move(X, Y) :- map(X, Y, t(_, _)).  % Телепорт
can_move(X, Y) :- map(X, Y, trap(_)).  % Ловушка

% Поиск выхода
find_exit(X, Y, _, _) :-
    exit(X, Y),
    format('Выход найден на (~w, ~w)~n', [X, Y]).

find_exit(X, Y, Visited, Steps) :-
    \+ member((X, Y), Visited),  % Проверяем, что клетка не была посещена
    can_move(X, Y),              % Проверяем, что можно переместиться на клетку
    map(X, Y, t(TX, TY)),        % Если находим телепорт
    find_exit(TX, TY, [(X, Y) | Visited], Steps).  % Телепортируемся

find_exit(X, Y, Visited, Steps) :-
    \+ member((X, Y), Visited),  % Проверяем, что клетка не была посещена
    can_move(X, Y),              % Проверяем, что можно переместиться на клетку
    map(X, Y, trap(K)),          % Проверяем на ловушку
    Steps mod K =\= 0,           % Ловушка срабатывает каждые K шагов
    move(X, Y, NX, NY),          % Пробуем переместиться
    find_exit(NX, NY, [(X, Y) | Visited], Steps + 1).

find_exit(X, Y, Visited, Steps) :-
    \+ member((X, Y), Visited),  % Проверяем, что клетка не была посещена
    can_move(X, Y),              % Проверяем, что можно переместиться на клетку
    move(X, Y, NX, NY),          % Пробуем переместиться
    find_exit(NX, NY, [(X, Y) | Visited], Steps + 1).

% Начать поиск
start :-
    start(1, 1).

start(X, Y) :-
    find_exit(X, Y, [], 0).
