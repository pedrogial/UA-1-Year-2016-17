:-use_module('pl-man-game/main').
:-dynamic estado/1.

%Mapa01________________________________________
cambiar(E):- retractall(estado(_)),assert(estado(E)).

m(D):-doAction(move(D)).
s(D,O):-see(normal,D,O).
g(D):-doAction(get(D)).
u(D):-doAction(use(D)).
d(D):-doAction(drop(D)).

%______________________________________________
r(arriba):-s(left,' '),s(right,'#'),s(up,' '),s(down,'#'),s(down-right,'#'),s(down-left,'#'),s(up-right,'#'),s(up-left,' '),m(left),cambiar(abajo).
r(arriba):-s(left,' '),s(right,' '),s(up,'#'),s(down,' '),s(down-right,' '),s(down-left,' '),s(up-right,'#'),s(up-left,'#'),m(down).
r(arriba):-s(left,'.'),s(right,' '),s(up,'#'),s(down,'.'),s(down-right,'<'),s(down-left,'.'),s(up-right,'#'),s(up-left,'#'),m(left).
r(arriba):-s(left,'.'),s(right,' '),s(up,'#'),s(down,'<'),s(down-right,'.'),s(down-left,'.'),s(up-right,'#'),s(up-left,'#'),m(left).
r(arriba):-s(left,' '),s(right,' '),s(up,' '),s(down,' '),s(down-right,' '),s(down-left,' '),s(up-right,' '),s(up-left,'>'),m(right).
r(arriba):-s(left,' '),s(right,'.'),s(up,' '),s(down,'#'),s(down-right,'#'),s(down-left,' '),s(up-right,'.'),s(up-left,'>'),m(right).
r(arriba):-s(left,'.'),s(right,' '),s(up,' '),s(down,'#'),s(down-right,'#'),s(down-left,'#'),s(up-right,' '),s(up-left,' '),m(right).
r(arriba):-s(left,' '),s(right,'.'),s(up,' '),s(down,' '),s(down-right,'.'),s(down-left,'>'),s(up-right,'.'),s(up-left,' '),m(right).
r(arriba):-s(left,'.'),s(right,' '),s(up,'#'),s(down,'.'),s(down-right,' '),s(down-left,'>'),s(up-right,' '),s(up-left,'#'),m(left).
r(arriba):-s(left,'.'),s(right,' '),s(up,'#'),s(down,' '),s(down-right,'<'),s(down-left,'.'),s(up-right,'#'),s(up-left,'#'),m(left).
r(arriba):-s(left,'.'),s(right,' '),s(up,' '),s(down,' '),s(down-right,' '),s(down-left,'.'),s(up-right,' '),s(up-left,' '),m(down).
r(arriba):-s(left,'>'),s(right,'.'),s(up,' '),s(down,'#'),s(down-right,'#'),s(down-left,'#'),s(up-right,'<'),s(up-left,' '),m(right).
r(arriba):-s(left,'.'),s(right,' '),s(up,'#'),s(down,' '),s(down-right,' '),s(down-left,'>'),s(up-right,'#'),s(up-left,'#'),m(left).
r(arriba):-s(left,'.'),s(right,'.'),s(up,' '),s(down,'#'),s(down-right,'#'),s(down-left,' '),s(up-right,'.'),s(up-left,' '),m(right).
r(arriba):-s(left,'.'),s(right,'<'),s(up,' '),s(down,'>'),s(down-right,' '),s(down-left,'.'),s(up-right,' '),s(up-left,' '),m(left).
r(arriba):-s(left,'.'),s(right,' '),s(up,'#'),s(down,' '),s(down-right,' '),s(down-left,'>'),s(up-right,'#'),s(up-left,' '),m(left).
r(arriba):-s(left,'>'),s(right,'.'),s(up,'#'),s(down,' '),s(down-right,' '),s(up-right,'#'),m(down).
r(arriba):-s(left,'#'),s(right,'#'),s(up,' '),s(down,' '),s(down-right,' '),s(up-right,'.'),m(up).
r(arriba):-s(left,' '),s(right,'.'),s(up,' '),s(down,' '),s(down-right,'<'),s(up-right,'.'),m(right).
r(arriba):-s(left,'#'),s(right,' '),s(up,' '),s(down,' '),s(down-left,'#'),s(up-right,'#'),m(down).
r(arriba):-s(left,'>'),s(right,' '),s(up,' '),s(down,'#'),s(down-left,'#'),s(up-right,'<'),m(right).
r(arriba):-s(left,' '),s(right,'.'),s(up,'>'),s(down,'#'),s(down-left,'#'),s(up-left,' '),m(left).
r(arriba):-s(left,' '),s(right,'.'),s(up,' '),s(down,'#'),s(down-left,'#'),s(up-left,'>'),m(right).
r(arriba):-s(left,'.'),s(right,' '),s(up,'<'),s(down,'#'),s(down-left,'#'),s(up-left,'.'),m(right).
r(arriba):-s(left,'.'),s(right,' '),s(up,' '),s(down,'.'),s(down-left,'>'),s(up-left,'.'),m(left).
r(arriba):-s(left,'.'),s(right,' '),s(up,'#'),s(down,'<'),s(down-right,' '),s(up-left,'#'),m(left).
r(arriba):-s(left,' '),s(right,'.'),s(up,' '),s(down,' '),s(down-right,'<'),s(up-left,'>'),m(right).
r(arriba):-s(left,'.'),s(right,' '),s(up,' '),s(down,'.'),s(down-right,'<'),m(left).
r(arriba):-s(left,' '),s(right,' '),s(up,' '),s(down,' '),s(up-right,'<'),m(down).
r(arriba):-s(left,'.'),s(right,' '),s(up,'#'),s(down,'.'),s(up-right,'.'),m(down).
r(arriba):-s(left,' '),s(right,'.'),s(up,' '),s(down,'#'),s(up-right,'<'),m(right).
r(arriba):-s(left,' '),s(right,'.'),s(up,' '),s(down,'#'),m(up).
r(arriba):-s(left,'.'),s(right,' '),s(up,'#'),s(down,'<'),m(down).
r(arriba):-s(left,'.'),s(right,'<'),s(up,'#'),s(down,'.'),m(down).
r(arriba):-s(left,'.'),s(right,' '),s(up,' '),s(down,'.'),m(down).
r(arriba):-s(left,'.'),s(right,' '),s(up,'#'),s(down,'.'),m(down).
r(arriba):-s(left,'.'),s(right,' '),s(up,'#'),s(down,' '),m(down).
r(arriba):-s(left,'>'),s(right,' '),s(up,'#'),s(down,' '),m(down).
r(arriba):-s(left,' '),s(right,'.'),s(up,' '),s(down,' '),m(down).
r(arriba):-s(left,' '),s(right,' '),s(up,' '),s(down,' '),m(up).
r(arriba):-s(left,'#'),s(right,'#'),s(up,' '),s(down,'>'),m(none).
r(arriba):-s(left,'#'),s(right,'#'),s(up,' '),s(down,'<'),m(none).
r(arriba):-s(left,'#'),s(right,'#'),s(up,' '),s(down,' '),m(down).
r(arriba):-s(down-left,'<'),m(none).
r(arriba):-s(down-right,'<'),m(none).
r(arriba):-s(up-left,'<'),m(none).
r(arriba):-s(up-right,'<'),m(none).
r(arriba):-s(down-left,'>'),m(none).
r(arriba):-s(down-right,'>'),m(none).
r(arriba):-s(up-left,'>'),m(none).
r(arriba):-s(up-right,'>'),m(none).
r(arriba):-s(up,'.'),m(up).
r(arriba):-s(left,'.'),m(left).
r(arriba):-s(down,'.'),m(down).
r(arriba):-s(right,'.'),m(right).
r(arriba):-s(up,'<'),m(right).
r(arriba):-s(left,'<'),m(up).
r(arriba):-s(down,'<'),m(right).
r(arriba):-s(right,'<'),s(up,'#'),m(down).
r(arriba):-s(right,'<'),m(up).
r(arriba):-s(up,'>'),m(left).
r(arriba):-s(left,'>'),m(up).
r(arriba):-s(down,'>'),m(left).
r(arriba):-s(right,'>'),m(up).
r(arriba):-s(right,'.'),m(down).
r(arriba):-s(right,' '),m(right).
r(arriba):-s(right,')'),m(right).
r(arriba):-s(right,'#'),m(down).
r(arriba):-s(left,'#'),m(down).


r(abajo):-s(down-left,'<'),m(none).
r(abajo):-s(down-right,'<'),m(none).
r(abajo):-s(up-left,'<'),m(none).
r(abajo):-s(up-right,'<'),m(none).
r(abajo):-s(down-left,'>'),m(none).
r(abajo):-s(down-right,'>'),m(none).
r(abajo):-s(up-left,'>'),m(none).
r(abajo):-s(up-right,'>'),m(none).
r(abajo):-s(up,'.'),m(up).
r(abajo):-s(left,'.'),m(left).
r(abajo):-s(down,'.'),m(down).
r(abajo):-s(right,'.'),m(right).
r(abajo):-s(up,'<'),m(right).
r(abajo):-s(left,'<'),m(up).
r(abajo):-s(down,'<'),m(right).
r(abajo):-s(right,'<'),s(up,'#'),m(down).
r(abajo):-s(right,'<'),m(up).
r(abajo):-s(up,'>'),m(left).
r(abajo):-s(left,'>'),m(up).
r(abajo):-s(down,'>'),m(left).
r(abajo):-s(right,'>'),m(up).
r(abajo):-s(right,'.'),m(down).
r(abajo):-s(right,' '),m(right).
r(abajo):-s(right,')'),m(right).
r(abajo):-s(right,'#'),m(down).
r(abajo):-s(left,'#'),m(down).
r(abajo):-s(down,'#'),m(left).

%__________________________________________________
r(init):-retractall(estado(_)),assert(estado(arriba)).
r:- estado(arriba),r(arriba).
r:- estado(abajo),r(abajo).



