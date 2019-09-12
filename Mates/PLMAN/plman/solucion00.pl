:-use_module('pl-man-game/main').

rej1:-see(normal,down,'.'),doAction(move(down)).

rej1:-see(normal,right,'|'),doAction(move(none)).

rej1:-see(normal,right,'.'),doAction(move(right)).

rej1:-see(normal,up,'.'),doAction(move(up)).

rej1:-see(normal,up,'|'),doAction(move(up)).

rej2:-see(normal, right, ' '),see(normal, left, '.'),havingObject,doAction(move(left)).
rej2:-see(normal,right,' '),not(havingObject),doAction(move(right)).
rej2:-not(havingObject),see(normal, right, 'a'),doAction(get(right)).
rej2:-see(normal,left,' '),havingObject,doAction(move(left)).
rej2:-see(normal,left,'|'),havingObject,doAction(use(left)).

%Mapa00
regla:-not(havingObject),lleva(' ').
regla:-havingObject(appearance('a')), lleva('a').
regla:-havingObject(appearance('r')), lleva('r').

%lleva0
lleva(' '):-see(normal,up,'r'),doAction(get(up)).
lleva(' '):-see(normal,right,' '),see(normal,down,'#'),doAction(move(right)).
lleva(' '):-see(normal,right,'#'),see(normal,down,'#'),doAction(move(up)).
lleva(' '):-see(normal,up-right,'a'),see(normal,down,' '),doAction(move(up)).
lleva(' '):-see(normal,right,'#'),see(normal,down,' '),doAction(move(up)).
lleva(' '):-see(normal,right,'a'),doAction(get(right)).
lleva(' '):-see(normal,right,'.'),doAction(move(right)).


%lleva1
lleva('a'):-see(normal,left,'#'),see(normal,right,' '),see(normal,down,'#'),doAction(drop(up)).
lleva('a'):-see(normal,right,' '),see(normal,left,' '),doAction(move(left)).
lleva('a'):-see(normal,left,'#'),see(normal,right,' '),doAction(move(down)).
lleva('a'):-see(normal,left,'#'),see(normal,right,'#'),doAction(move(down)).
lleva('a'):-see(normal,left,'#'),see(normal,right,'|'),doAction(use(right)).

%lleva2
lleva('r'):-see(normal,right,'#'),see(normal,left,'#'),see(normal,up,'#'),doAction(move(down)).
lleva('r'):-see(normal,left,' '),see(normal,right,'#'),doAction(move(left)).
lleva('r'):-see(normal,left,' '),see(normal,right,' '),doAction(move(left)).
lleva('r'):-see(normal,left,'#'),see(normal,right,' '),see(normal,down,'#'),see(normal,up,'a'),doAction(move(up)).
lleva('r'):-see(normal,left,'#'),see(normal,right,'#'),see(normal,down,'a'),see(normal,up,' '),doAction(move(up)).
lleva('r'):-see(normal,left,'#'),see(normal,right,'#'),see(normal,down,' '),see(normal,up,' '),doAction(move(up)).
lleva('r'):-see(normal,left,'#'),see(normal,right,' '),see(normal,down,' '),see(normal,up,' '),doAction(move(up)).
lleva('r'):-see(normal,left,'#'),see(normal,right,'|'),see(normal,down,' '),see(normal,up,'#'),doAction(use(right)).
lleva('r'):-see(normal,left,'#'),see(normal,right,'.'),see(normal,down,' '),see(normal,up,'#'),doAction(drop(down)).






