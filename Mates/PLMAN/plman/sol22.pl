:-use_module('pl-man-game/main').

%Mapa01
regla:-not(havingObject),lleva(' ').
regla:-havingObject(appearance('a')), lleva('a').
regla:-havingObject(appearance('r')), lleva('r').
regla:-havingObject(appearance('v')), lleva('v').

%lleva
lleva(' '):-see(normal,right,'v'),doAction(get(right)).
lleva(' '):-see(normal,right,' '),see(normal,left,' '),see(normal,up-right,' '),see(normal,down,'#'),see(normal,up,' '),doAction(move(left)).
lleva(' '):-see(normal,right,' '),see(normal,left,'a'),see(normal,down,'#'),see(normal,up,'#'),doAction(move(right)).
lleva(' '):-see(normal,right,' '),see(normal,left,' '),see(normal,down,'#'),see(normal,up,' '),doAction(move(up)).
lleva(' '):-see(normal,right,'#'),see(normal,left,'#'),see(normal,down,' '),see(normal,up,' '),doAction(move(up)).
lleva(' '):-see(normal,right,'#'),see(normal,left,' '),see(normal,down,' '),see(normal,up,' '),doAction(move(left)).
lleva(' '):-see(normal,right,' '),see(normal,left,'E'),see(normal,down,'#'),see(normal,up,'#'),doAction(move(right)).
lleva(' '):-see(normal,right,' '),see(normal,left,'E'),see(normal,down,'#'),see(normal,up,' '),doAction(move(up)).
lleva(' '):-see(normal,right,' '),see(normal,left,' '),see(normal,down,'E'),see(normal,up,'#'),doAction(move(left)).
lleva(' '):-see(normal,right,'E'),see(normal,left,' '),see(normal,down,'#'),see(normal,up,'#'),doAction(move(left)).
lleva(' '):-see(normal,right,'.'),see(normal,left,' '),see(normal,down,'.'),see(normal,up,' '),see(normal,up-left,' '),see(normal,up-right,'#'),see(normal,down-left,'.'),see(normal,down-right,'#'),doAction(move(down)).
lleva(' '):-see(normal,right,' '),see(normal,left,'#'),see(normal,down,'r'),see(normal,up,' '),doAction(move(right)).
lleva(' '):-see(normal,right,' '),see(normal,left,' '),see(normal,down,' '),see(normal,up,' '),see(normal,down-left,'r'),doAction(move(down)).
lleva(' '):-see(normal,right,' '),see(normal,left,' '),see(normal,down,'#'),see(normal,up,'#'),doAction(move(left)).
lleva(' '):-see(normal,right,' '),see(normal,left,'r'),see(normal,down,'#'),see(normal,up,' '),doAction(get(left)).
lleva(' '):-see(normal,down,'E'),doAction(move(up)).
lleva(' '):-see(normal,right,'a'),doAction(get(right)).
lleva(' '):-see(normal,right,'a'),doAction(get(right)).
lleva(' '):-see(normal,right,'.'),doAction(move(right)).
lleva(' '):-see(normal,left,'.'),doAction(move(left)).
lleva(' '):-see(normal,up,'.'),doAction(move(up)).
lleva(' '):-see(normal,down,'.'),doAction(move(down)).

%lleva1
lleva('a'):-see(normal,right,' '),see(normal,left,' '),see(normal,down-left,'#'),see(normal,down-right,'#'),see(normal,up-right,' '),see(normal,down,'#'),see(normal,up,'#'),doAction(drop(left)).
lleva('a'):-see(normal,right,' '),see(normal,left,'|'),see(normal,down,' '),see(normal,up,' '),doAction(move(up)).
lleva('a'):-see(normal,right,' '),see(normal,left,'#'),see(normal,down-left,'|'),see(normal,down,'.'),see(normal,up,'.'),doAction(move(down)).
lleva('a'):-see(normal,right,'E'),see(normal,left,'.'),see(normal,down-left,' '),see(normal,down,' '),see(normal,up,'E'),doAction(move(down)).
lleva('a'):-see(normal,right,'#'),see(normal,left,' '),see(normal,down-left,' '),see(normal,down,' '),see(normal,up,'.'),doAction(move(left)).
lleva('a'):-see(normal,right,'#'),see(normal,left,' '),see(normal,down-left,'#'),see(normal,down,'#'),see(normal,up,' '),doAction(move(up)).
lleva('a'):-see(normal,right,'#'),see(normal,left,' '),see(normal,down-left,'E'),see(normal,down,'.'),see(normal,up,'.'),doAction(move(down)).
lleva('a'):-see(normal,right,'E'),doAction(move(up)).
lleva('a'):-see(normal,up-right,'E'),doAction(move(none)).
lleva('a'):-see(normal,right,' '),see(normal,left,'E'),see(normal,down,' '),see(normal,up,'#'),doAction(move(down)).
lleva('a'):-see(normal,right,' '),see(normal,left,' '),see(normal,down,'E'),see(normal,up,'#'),doAction(move(right)).
lleva('a'):-see(normal,down-left,'E'),doAction(move(none)).
lleva('a'):-see(normal,right,' '),see(normal,left,' '),see(normal,down,'#'),doAction(move(right)).
lleva('a'):-see(normal,left,'E'),doAction(move(none)).
lleva('a'):-see(normal,right,'.'),doAction(move(right)).
lleva('a'):-see(normal,left,'.'),doAction(move(left)).
lleva('a'):-see(normal,up,'.'),doAction(move(up)).
lleva('a'):-see(normal,down,'.'),doAction(move(down)).
lleva('a'):-see(normal,right,' '),see(normal,left,' '),see(normal,down,' '),see(normal,up,'#'),doAction(move(left)).
lleva('a'):-see(normal,down,' '),doAction(move(down)).
lleva('a'):-see(normal,down,'_'),doAction(use(down)).

%lleva2
lleva('r'):-see(normal,right,'v'),doAction(drop(left)).
lleva('r'):-see(normal,right,'.'),see(normal,left,' '),see(normal,down,'#'),see(normal,up,'.'),doAction(move(up)).
lleva('r'):-see(normal,right,' '),see(normal,left,' '),see(normal,down,' '),see(normal,up,' '),see(normal,up-right,'E'),doAction(move(none)).
lleva('r'):-see(normal,right,' '),see(normal,left,' '),see(normal,down,' '),see(normal,up,' '),see(normal,down-right,'E'),doAction(move(right)).
lleva('r'):-see(normal,right,' '),see(normal,left,' '),see(normal,down,'#'),see(normal,up,' '),doAction(move(up)).
lleva('r'):-see(normal,right,' '),see(normal,left,' '),see(normal,down,' '),see(normal,up,' '),doAction(move(up)).
lleva('r'):-see(normal,right,'E'),doAction(move(none)).
lleva('r'):-see(normal,right,'.'),doAction(move(right)).
lleva('r'):-see(normal,left,'.'),doAction(move(left)).
lleva('r'):-see(normal,up,'.'),doAction(move(up)).
lleva('r'):-see(normal,down,'.'),doAction(move(down)).

%lleva3

lleva('v'):-see(normal,right,' '),see(normal,left,'r'),see(normal,down,'#'),see(normal,up,' '),doAction(move(up)).
lleva('v'):-see(normal,right,' '),see(normal,left,' '),see(normal,down,' '),see(normal,up,'#'),doAction(move(right)).
lleva('v'):-see(normal,right,' '),see(normal,left,' '),see(normal,down,'#'),see(normal,up,'#'),doAction(move(right)).
lleva('v'):-see(normal,right,' '),see(normal,left,' '),see(normal,down,' '),see(normal,up,' '),doAction(move(up)).
lleva('v'):-see(normal,right,' '),see(normal,left,'#'),see(normal,down,' '),see(normal,up,' '),doAction(move(up)).
lleva('v'):-see(normal,right,'E'),see(normal,left,' '),see(normal,down,' '),see(normal,up,' '),doAction(move(up)).
lleva('v'):-see(normal,right,'|'),doAction(use(right)).
lleva('v'):-see(normal,right,'.'),doAction(move(right)).
