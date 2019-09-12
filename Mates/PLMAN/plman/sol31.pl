:-use_module('pl-man-game/main').
:-dynamic estado/1.

%Mapa01________________________________________
cambiar(E):- retractall(estado(_)),assert(estado(E)).

m(D):-doAction(move(D)).
s(D,O):-see(normal,D,O).
g(D):-doAction(get(D)).
u(D):-doAction(use(D)).
d(D):-doAction(drop(D)).

%_______________________________________________
r(arriba):-s(down,'#'),s(right,' '),s(left,' '),s(up,'#'),s(down-right,'#'),move(right).
r(arriba):-s(down,'#'),s(right,'-'),s(left,' '),s(up,' '),s(down-right,'#'),g(right),cambiar(llave).
r(arriba):-s(down,' '),s(right,'#'),s(left,' '),s(up,' '),s(down-right,'-'),m(down).
r(arriba):-s(down,' '),s(right,'.'),s(left,' '),s(up,' '),s(up-left,' '),m(right).
r(arriba):-s(down,'E'),s(right,'.'),s(left,' '),s(up,' '),s(up-left,' '),m(none).
r(arriba):-s(down,' '),s(right,'.'),s(left,'#'),s(up,' '),s(up-left,'#'),m(right).
r(arriba):-s(down,'.'),s(right,' '),s(left,'#'),s(up,'#'),s(down-right,'.'),s(up-left,'#'),m(down).
r(arriba):-s(down,'.'),s(right,' '),s(left,'.'),s(up,'#'),s(down-right,'.'),s(up-left,'#'),m(left).
r(arriba):-s(down,'.'),s(right,' '),s(left,'.'),s(up,' '),s(down-right,'.'),s(up-left,'.'),m(left).
r(arriba):-s(down,' '),s(right,' '),s(left,'#'),s(up,' '),m(down).
r(arriba):-s(down,'.'),s(right,' '),s(left,'.'),s(up,' '),s(down-right,'.'),s(up-left,'#'),m(left).
r(arriba):-s(down,'.'),s(right,' '),s(left,'.'),s(up,'#'),m(down).	
r(arriba):-s(right,'.'),s(down,'.'),m(right).
r(arriba):-s(down,'.'),s(right,'#'),s(left,' '),s(up,'#'),m(down).
r(arriba):-s(down,'.'),s(right,'#'),s(left,'.'),s(up,' '),m(down).
r(arriba):-s(down,'#'),s(right,'#'),s(left,'.'),s(up,' '),m(left).
r(arriba):-s(down,'#'),s(right,' '),s(left,'.'),s(up,'.'),m(up).
r(arriba):-s(down,' '),s(right,' '),s(left,'.'),s(up,' '),m(left).
r(arriba):-s(down,'.'),s(right,' '),s(left,'.'),s(up,' '),m(down).
r(arriba):-s(down,'#'),s(right,' '),s(left,'.'),s(up,' '),m(left).
r(arriba):-s(down,'.'),s(right,' '),s(left,'.'),s(up,'.'),m(up).
%__________________________________________________
r(llave):-s(down,' '),s(right,' '),s(left,' '),s(up,'#'),s(down-right,' '),s(down-left,'-'),d(down),cambiar(coger3).
r(llave):-s(down-left,'-'),s(right,' '),s(down,' '),s(left,' '),s(up,'#'),d(down),cambiar(probar).
r(llave):-s(down,'#'),s(right,' '),s(left,' '),s(up,'#'),m(left).
r(llave):-s(down,'#'),s(right,' '),s(left,' '),s(up,' '),m(up).
r(llave):-s(down,' '),s(right,'#'),s(left,' '),s(up,' '),m(up).
r(llave):-s(down,' '),s(right,' '),s(left,' '),s(up,' '),m(up).
r(llave):-s(down,' '),s(right,' '),s(left,' '),s(up,'#'),m(left).
r(llave):-s(down,' '),s(right,' '),s(left,'|'),s(up,'#'),d(down), cambiar(coger).
%__________________________________________________
r(coger):-s(down,'E'),s(right,'#'),s(left,' '),s(up,' '),m(none),cambiar(coger2).
r(coger):-s(down,' '),s(right,' '),s(left,'|'),s(up,'#'),m(right).
r(coger):-s(down,' '),s(right,' '),s(left,'|'),s(up,'#'),m(right).
r(coger):-s(down,'-'),s(right,' '),s(left,'|'),s(up,'#'),m(right).
r(coger):-s(down,' '),s(right,' '),s(left,' '),s(up,'#'),m(right).
r(coger):-s(down,' '),s(right,'#'),s(left,' '),s(up,'#'),m(down).
r(coger):-s(down,' '),s(right,'#'),s(left,' '),s(up,' '),m(down).
r(coger):-s(down,'#'),s(right,'#'),s(left,' '),s(up,' '),m(left).
r(coger):-s(down,'#'),s(right,' '),s(left,' '),s(up,' '),m(left).
r(coger):-s(down,' '),s(right,' '),s(left,' '),s(up,' '),m(down).
r(coger):-s(down,' '),s(right,'#'),s(left,' '),s(up,' '),m(down).
r(coger):-s(down,'#'),s(right,' '),s(left,'E'),s(up,' '),m(up).
r(coger):-s(down,'E'),s(right,' '),s(left,' '),s(up,' '),m(right).
r(coger):-s(right,'#'),s(left,' '),s(up,' '),s(down,'E'),m(none).
%__________________________________________________
r(coger2):-s(down,' '),s(right,'#'),s(left,' '),s(up,' '),s(down-right,'E'),m(none).
r(coger2):-s(down,'E'),s(right,'#'),s(left,' '),s(up,' '),m(none).
r(coger2):-s(down,' '),s(right,'#'),s(left,' '),s(up,' '),m(down).
r(coger2):-s(down,'#'),s(right,' '),s(left,' '),s(up,' '),m(right).
r(coger2):-s(down,'#'),s(right,'-'),s(left,' '),s(up,'#'),g(right),cambiar(llave).

%__________________________________________________
r(coger3):-s(down,'#'),s(right,'-'),s(left,' '),s(up,'#'),g(right),cambiar(llave2).
r(coger3):-s(down,'#'),s(right,' '),s(left,' '),s(up,' '),s(up-right,'#'),m(right).
r(coger3):-s(down,'-'),s(right,' '),s(left,' '),s(up,'#'),m(right).
r(coger3):-s(down,' '),s(right,' '),s(left,'-'),s(up,'#'),m(right).
r(coger3):-s(down,' '),s(right,' '),s(left,'|'),s(up,'#'),m(right).
r(coger3):-s(down,' '),s(right,' '),s(left,'|'),s(up,'#'),m(right).
r(coger3):-s(down,'-'),s(right,' '),s(left,'|'),s(up,'#'),m(right).
r(coger3):-s(down,' '),s(right,' '),s(left,' '),s(up,'#'),m(right).
r(coger3):-s(down,' '),s(right,'#'),s(left,' '),s(up,'#'),m(down).
r(coger3):-s(down,' '),s(right,'#'),s(left,' '),s(up,' '),m(down).
r(coger3):-s(down,'#'),s(right,'#'),s(left,' '),s(up,' '),m(left).
r(coger3):-s(down,'#'),s(right,' '),s(left,' '),s(up,' '),m(left).
r(coger3):-s(down,' '),s(right,' '),s(left,' '),s(up,' '),m(down).
r(coger3):-s(down,'#'),s(right,' '),s(left,' '),s(up,'#'),m(right).
r(coger3):-s(down,' '),s(right,'#'),s(left,' '),s(up,' '),m(down).
%__________________________________________________
r(llave2):-s(down,' '),s(right,' '),s(left,' '),s(up,'#'),s(down-right,' '),s(down-left,'-'),m(left).
r(llave2):-s(down,'-'),s(right,' '),s(left,' '),s(up,'#'),m(left).
r(llave2):-s(down,'-'),s(right,' '),s(left,'|'),s(up,'#'),u(left), cambiar(comprobar).
r(llave2):-s(down,'#'),s(right,' '),s(left,' '),s(up,'#'),m(left).
r(llave2):-s(down,'#'),s(right,' '),s(left,' '),s(up,' '),m(up).
r(llave2):-s(down,' '),s(right,'#'),s(left,' '),s(up,' '),m(up).
r(llave2):-s(down,' '),s(right,' '),s(left,' '),s(up,' '),m(up).
r(llave2):-s(down,' '),s(right,' '),s(left,' '),s(up,'#'),m(left).
r(llave2):-s(down,' '),s(right,' '),s(left,' '),s(up,'#'),m(left).

%__________________________________________________
r(probar):-s(down,' '),s(right,'-'),s(left,' '),s(up,'#'),m(left).
r(probar):-s(down,'-'),s(right,' '),s(left,' '),s(up,'#'),m(left).
r(probar):-s(down,'#'),s(right,' '),s(left,'|'),s(up,'#'),u(left),cambiar(comprobar5).
r(probar):-s(down,'-'),s(right,' '),s(left,'|'),s(up,'#'),u(left),cambiar(comprobar4).
%__________________________________________________
r(comprobar):-s(down,'#'),s(right,' '),s(left,'|'),s(up,'#'),m(right).
r(comprobar):-s(down,'-'),s(right,' '),s(left,' '),s(up,'#'),s(down-right,'-'),m(right).
r(comprobar):-s(down,'-'),s(right,' '),s(left,'|'),s(up,'#'),m(right).
r(comprobar):-s(down,' '),s(right,'-'),s(left,' '),s(up,'#'),d(down),cambiar(comprobar2).
r(comprobar):-s(down,'-'),s(right,' '),s(left,' '),s(up,'#'),s(down-right,' '),d(right).
r(comprobar):-s(down,'-'),s(right,'-'),s(left,' '),s(up,'#'),g(down), cambiar(probar).
%__________________________________________________
r(comprobar2):-s(down,'-'),s(right,'-'),s(left,' '),s(up,'#'),m(left).
r(comprobar2):-s(down,'-'),s(right,' '),s(left,'|'),s(up,'#'),g(down).
r(comprobar2):-s(down,' '),s(right,' '),s(left,'|'),s(up,'#'),u(left),cambiar(comprobar3).
%__________________________ ________________________
r(comprobar3):-s(down,' '),s(right,' '),s(left,' '),s(up,'#'),d(down).
r(comprobar3):-s(down,'-'),s(right,' '),s(left,' '),s(up,'#'),m(right).
%__________________________________________________
r(comprobar5):-s(down,'#'),s(right,' '),s(left,' '),s(up,'#'),m(right).
r(comprobar5):-s(down,'#'),s(right,' '),s(left,'|'),s(up,'#'),m(right).
r(comprobar5):-s(down,'-'),s(right,' '),s(left,' '),s(up,'#'),s(down-right,' '),m(right).
r(comprobar5):-s(down,' '),s(right,'-'),s(left,' '),s(up,'#'),d(down),cambiar(probar2).
%__________________________________________________
r(comprobar4):-s(down,'-'),s(right,' '),s(left,'|'),s(up,'#'),m(right).
r(comprobar4):-s(down,'#'),s(right,' '),s(left,' '),s(up,'#'),m(left).
r(comprobar4):-s(down,'-'),s(right,' '),s(left,' '),s(up,'#'),m(right).
r(comprobar4):-s(down,' '),s(right,'-'),s(left,' '),s(up,'#'),d(down),cambiar(probar4).
r(comprobar4):-s(down,'-'),s(right, '-'),s(left,' '),s(up,'#'),g(right),cambiar(probar).
%__________________________________________________
r(probar2):-s(down,'-'),s(right,'-'),s(left,' '),s(up,'#'),m(left).
r(probar2):-s(down,'-'),s(right,' '),s(left,' '),s(up,'#'),g(down).
r(probar2):-s(down,' '),s(right,' '),s(left,' '),s(up,'#'),m(left).
r(probar2):-s(down,'#'),s( right,' '),s(left,' '),s(up,'#'),m(left).
r(probar2):-s(down,'#'),s( right,' '),s(left,'|'),s(up,'#'),u(left).
r(probar2):-s(down,'#'),s( right,' '),s(left,' '),s(up,'#'),d(right).
r(probar2):-s(down,'#'),s( right,'-'),s(left,' '),s(up,'#'),m(left).

%__________________________________________________
r(probar3):-s(down,'-'),s(right,'-'),s(left,' '),s(up,'#'),m(left).
r(probar3):-s(down,'-'),s(right,'-'),s(left,' '),s(up,'#'),m(left).
r(probar3):-s(down,'-'),s(right,' '),s(left,' '),s(up,'#'),g(down).
r(probar3):-s(down,' '),s(right,' '),s(left,' '),s(up,'#'),m(left).
r(probar3):-s(down,'#'),s(right,' '),s(left,'|'),s(up,'#'),u(left).
%__________________________________________________
r(probar4):-s(down,'-'),s(right,'-'),s(left,' '),s(up,'#'),m(left).
r(probar4):-s(down,'-'),s(right,' '),s(left,' '),s(up,'#'),g(down).
r(probar4):-s(down,' '),s(right,' '),s(left,'|'),s(up,'#'),u(left).
r(probar4):-s(down,' '),s(right,' '),s(left,' '),s(up,'#'),d(down).


%__________________________________________________
r(init):-retractall(estado(_)),assert(estado(arriba)).
r:- estado(arriba),r(arriba).
r:- estado(llave),r(llave).
r:- estado(llave2),r(llave2).
r:- estado(coger),r(coger).
r:- estado(coger2),r(coger2).
r:- estado(coger3),r(coger3).
r:- estado(probar),r(probar).
r:- estado(probar2),r(probar2).
r:- estado(probar3),r(probar3).
r:- estado(probar4),r(probar4).
r:- estado(comprobar),r(comprobar).
r:- estado(comprobar2),r(comprobar2).
r:- estado(comprobar3),r(comprobar3).
r:- estado(comprobar4),r(comprobar4).
r:- estado(comprobar5),r(comprobar5).


