:-use_module('pl-man-game/main').

%Mapa01
regla:-not(havingObject),lleva(' ').
regla:-havingObject(appearance('r')), lleva('r').
regla:-havingObject(appearance('v')), lleva('v').

%lleva00
lleva(' '):-see(normal,right,' '),see(normal,left,' '),see(normal,down,'r'),see(normal,up,'#'),doAction(move(down)).
lleva(' '):-see(normal,right,'#'),see(normal,left,' '),see(normal,down,' '),see(normal,up,' '),doAction(move(left)).
lleva(' '):-see(normal,right,'r'),see(normal,left,' '),see(normal,down,' '),see(normal,up,' '),doAction(get(right)).

lleva(' '):-see(normal,down,'#'),see(normal,up,' '),see(normal,left,'v'),doAction(get(left)).
lleva(' '):-see(normal,right,'.'),doAction(move(right)).
lleva(' '):-see(normal,down,'.'),doAction(move(down)).
lleva(' '):-see(normal,right,'E'),doAction(move(none)).
lleva(' '):-see(normal,left,'.'),doAction(move(left)).
lleva(' '):-see(normal,up,'.'),doAction(move(up)).
lleva(' '):-see(normal,down,'#'),see(normal,up,'#'),doAction(move(left)).
lleva(' '):-see(normal,down,' '),see(normal,up,' '),doAction(move(down)).
lleva(' '):-see(normal,down,'#'),see(normal,up,' '),doAction(move(left)).


%lleva01
lleva('v'):-see(normal,right,' '),see(normal,left,' '),see(normal,down,'#'),see(normal,up,'#'),see(normal,down-left,'r'),doAction(drop(right)).
lleva('v'):-see(normal,right,' '),see(normal,left,' '),see(normal,down,'#'),see(normal,up,'#'),doAction(move(left)).
lleva('v'):-see(normal,right,'#'),see(normal,left,' '),see(normal,down,'#'),see(normal,up,'#'),doAction(move(left)).
lleva('v'):-see(normal,down,'#'),see(normal,up,'#'),see(normal,right,'|'),doAction(use(right)).
lleva('v'):-see(normal,right,'#'),see(normal,left,' '),see(normal,down-left,'E'),see(normal,down,' '),see(normal,up,'#'),doAction(move(down)).
lleva('v'):-see(normal,right,' '),see(normal,left,' '),see(normal,down-right,'r'),see(normal,down,' '),see(normal,up,' '),doAction(move(right)).
lleva('v'):-see(normal,right,' '),see(normal,left,' '),see(normal,down,'#'),see(normal,up,' '),doAction(move(up)).
lleva('v'):-see(normal,right,' '),see(normal,left,'#'),see(normal,down,' '),see(normal,up,'#'),doAction(move(right)).
lleva('v'):-see(normal,right,'#'),see(normal,left,' '),see(normal,down,' '),see(normal,up,'#'),doAction(move(left)).
lleva('v'):-see(normal,right,' '),see(normal,left,' '),see(normal,down,' '),see(normal,up,'r'),doAction(move(left)).
lleva('v'):-see(normal,right,' '),see(normal,left,' '),see(normal,down,' '),see(normal,up,' '),doAction(move(up)).
lleva('v'):-see(normal,right,'E'),see(normal,left,' '),see(normal,down,'r'),see(normal,up,'#'),doAction(move(left)).
lleva('v'):-see(normal,right,'E'),see(normal,left,' '),see(normal,down,' '),see(normal,up,' '),doAction(move(up)).

lleva('v'):-see(normal,right,'.'),doAction(move(right)).
lleva('v'):-see(normal,down,'.'),doAction(move(down)).
lleva('v'):-see(normal,right,'E'),doAction(move(none)).
lleva('v'):-see(normal,down,'E'),doAction(move(none)).
lleva('v'):-see(normal,left,'.'),doAction(move(left)).
lleva('v'):-see(normal,up,'.'),doAction(move(up)).

%lleva03
lleva('r'):-see(normal,left,'|'),doAction(use(left)).
lleva('r'):-see(normal,right,' '),see(normal,left,' '),see(normal,down,'#'),see(normal,up,'#'),doAction(move(left)).
lleva('r'):-see(normal,right,' '),see(normal,left,' '),see(normal,down,' '),see(normal,up,' '),doAction(move(left)).
lleva('r'):-see(normal,right,' '),see(normal,left,'#'),see(normal,down,' '),see(normal,up,' '),doAction(move(up)).
lleva('r'):-see(normal,right,'.'),doAction(move(right)).
lleva('r'):-see(normal,down,'.'),doAction(move(down)).
lleva('r'):-see(normal,right,'E'),doAction(move(none)).
lleva('r'):-see(normal,down,'E'),doAction(move(none)).
lleva('r'):-see(normal,left,'.'),doAction(move(left)).
lleva('r'):-see(normal,up,'.'),doAction(move(up)).
