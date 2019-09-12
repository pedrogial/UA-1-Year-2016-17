:-use_module('pl-man-game/main').

%Mapa01
regla:-not(havingObject),lleva(' ').
regla:-havingObject(appearance('a')), lleva('a').
regla:-havingObject(appearance('+')), lleva('+').

%llevar00

lleva(' '):-see(normal,right,'#'),see(normal,down,' '),see(normal,left,' '),see(normal,up,' '),see(normal,up-right,'#'),see(normal,down-right,' '), see(normal,down-left,' '),see(normal,up-left,' '),doAction(move(left)).

lleva(' '):-see(normal,right,' '),see(normal,down,' '),see(normal,left,' '),see(normal,up,'#'),see(normal,up-right,'#'),see(normal,down-right,' '), see(normal,down-left,' '),see(normal,up-left,'#'),doAction(move(left)).

lleva(' '):-see(normal,right,' '),see(normal,down,' '),see(normal,left,'#'),see(normal,up,' '),see(normal,up-right,' '),see(normal,up-left,'#'),doAction(move(up)).

lleva(' '):-see(normal,right,' '),see(normal,down,' '),see(normal,left,'#'),see(normal,up,' '),see(normal,up-right,' '),see(normal,up-left,'.'),doAction(move(up)).

lleva(' '):-see(normal,right,'#'),see(normal,down,'.'),see(normal,left,'#'),see(normal,up,' '),see(normal,up-right,' '),see(normal,down-right,'#'), see(normal,down-left,'#'),see(normal,up-left,'#'),doAction(move(down)).

%_________________________________________________________

lleva(' '):-see(normal,right,' '),see(normal,down,'#'),see(normal,left,' '),see(normal,up,'#'),doAction(move(right)).

lleva(' '):-see(normal,right,' '),see(normal,down,'#'),see(normal,left,' '),see(normal,up,' '),doAction(move(right)).

lleva(' '):-see(normal,right,' '),see(normal,down,'#'),see(normal,left,' '),see(normal,up,' '),doAction(move(right)).

lleva(' '):-see(normal,right,'#'),see(normal,down,' '),see(normal,left,'#'),see(normal,up,' '),doAction(move(down)).

lleva(' '):-see(normal,right,'#'),see(normal,down,'.'),see(normal,left,'.'),see(normal,up,'#'),doAction(move(down)).

lleva(' '):-see(normal,right,'#'),see(normal,down,'.'),see(normal,left,'#'),see(normal,up,' '),doAction(move(up)).

lleva(' '):-see(normal,right,'#'),see(normal,down,' '),see(normal,left,'.'),see(normal,up,'#'),doAction(move(left)).

lleva(' '):-see(normal,right,' '),see(normal,down,'#'),see(normal,left,'.'),see(normal,up,'#'),doAction(move(left)).

lleva(' '):-see(normal,right,' '),see(normal,down,'.'),see(normal,left,'.'),see(normal,up,'#'),doAction(move(down)).

lleva(' '):-see(normal,right,'#'),see(normal,down,'#'),see(normal,left,'.'),see(normal,up,' '),doAction(move(left)).

lleva(' '):-see(normal,right,' '),see(normal,down,'.'),see(normal,left,'#'),see(normal,up,'.'),doAction(move(up)).

lleva(' '):-see(normal,right,' '),see(normal,down,' '),see(normal,left,'.'),see(normal,up,'#'),doAction(move(left)).

lleva(' '):-see(normal,right,' '),see(normal,down,'a'),see(normal,left,'#'),see(normal,up,'.'),doAction(move(up)).

lleva(' '):-see(normal,right,' '),see(normal,down,' '),see(normal,left,'#'),see(normal,up,'#'),doAction(move(down)).

lleva(' '):-see(normal,right,' '),see(normal,down,'a'),see(normal,left,'#'),see(normal,up,' '),doAction(get(down)).

lleva(' '):-see(normal,right,'+'),see(normal,down,'#'),see(normal,left,' '),see(normal,up,'a'),doAction(get(right)).

lleva(' '):-see(normal,right,'.'),see(normal,down,'#'),see(normal,left,'+'),see(normal,up,'a'),doAction(move(right)).

lleva(' '):-see(normal,right,'.'),see(normal,down,'#'),see(normal,left,' '),see(normal,up,'#'),doAction(move(right)).

lleva(' '):-see(normal,right,'.'),see(normal,down,'#'),see(normal,left,' '),see(normal,up,'.'),doAction(move(right)).

lleva(' '):-see(normal,right,'.'),see(normal,down,'#'),see(normal,left,' '),see(normal,up,'.'),doAction(move(up)).

lleva(' '):-see(normal,right,'.'),see(normal,down,'#'),see(normal,left,' '),see(normal,up,'F'),doAction(move(right)).

lleva(' '):-see(normal,right,'.'),see(normal,down,'#'),see(normal,left,'F'),see(normal,up,'#'),doAction(move(right)).

lleva(' '):-see(normal,right,'.'),see(normal,down,'#'),see(normal,left,'F'),see(normal,up,'F'),doAction(move(right)).

lleva(' '):-see(normal,right,'#'),see(normal,down,'#'),see(normal,left,' '),see(normal,up,'.'),doAction(move(up)).

lleva(' '):-see(normal,right,'#'),see(normal,down,' '),see(normal,left,'#'),see(normal,up,'.'),doAction(move(up)).

lleva(' '):-see(normal,right,' '),see(normal,down,'.'),see(normal,left,'.'),see(normal,up,'#'),doAction(move(left)).

lleva(' '):-see(normal,right,' '),see(normal,down,'#'),see(normal,left,'+'),see(normal,up,' '),doAction(move(right)).


lleva(' '):-see(normal,right,'E'),doAction(move(up)).
lleva(' '):-see(normal,down,'E'),doAction(move(none)).
lleva(' '):-see(normal,right,'.'),doAction(move(right)).
lleva(' '):-see(normal,left,'.'),doAction(move(left)).
lleva(' '):-see(normal,up,'.'),doAction(move(up)).
lleva(' '):-see(normal,down,'.'),doAction(move(down)).

%lleva1

%_________________________________________________
lleva('a'):-see(normal,right,' '),see(normal,down,' '),see(normal,left,'#'),see(normal,up,' '),doAction(move(down)).

lleva('a'):-see(normal,right,'#'),see(normal,down,'.'),see(normal,left,'#'),see(normal,up,' '),doAction(move(down)).


lleva('a'):-see(normal,right,'.'),see(normal,down,'#'),see(normal,left,'#'),see(normal,up,' '),doAction(move(right)).

lleva('a'):-see(normal,right,'.'),see(normal,down,'#'),see(normal,left,' '),see(normal,up,'#'),doAction(move(right)).

lleva('a'):-see(normal,right,'.'),see(normal,down,'#'),see(normal,left,' '),see(normal,up,'.'),doAction(move(up)).

lleva('a'):-see(normal,right,'.'),see(normal,down,' '),see(normal,left,'#'),see(normal,up,'#'),doAction(move(right)).

lleva('a'):-see(normal,right,'.'),see(normal,down,'.'),see(normal,left,' '),see(normal,up,'#'),doAction(move(right)).

lleva('a'):-see(normal,right,'#'),see(normal,down,'.'),see(normal,left,' '),see(normal,up,' '),doAction(move(down)).

lleva('a'):-see(normal,right,'.'),see(normal,down,'#'),see(normal,left,'.'),see(normal,up,' '),doAction(move(left)).

lleva('a'):-see(normal,right,' '),see(normal,down,'#'),see(normal,left,' '),see(normal,up,' '),doAction(move(right)).

lleva('a'):-see(normal,right,'.'),see(normal,down,'#'),see(normal,left,' '),see(normal,up,' '),doAction(move(right)).

lleva('a'):-see(normal,right,'|'),see(normal,down,'.'),see(normal,left,' '),see(normal,up,' '),doAction(move(down)).

lleva('a'):-see(normal,right,'#'),see(normal,up-right,'|'),see(normal,down,'#'),see(normal,left,' '),see(normal,up,' '),doAction(move(up)).

lleva('a'):-see(normal,right,'|'),doAction(use(right)).

lleva('a'):-see(normal,right,'.'),see(normal,down,' '),see(normal,left,' '),see(normal,up,' '),doAction(move(right)).

lleva('a'):-see(normal,right,'.'),see(normal,down,'#'),see(normal,left,' '),see(normal,up,'#'),doAction(move(right)).

lleva('a'):-see(normal,right,'.'),see(normal,down,'.'),see(normal,left,' '),see(normal,up,'.'),doAction(move(down)).

lleva('a'):-see(normal,right,'.'),see(normal,down,'#'),see(normal,left,' '),see(normal,up,'#'),doAction(move(right)).

lleva('a'):-see(normal,right,'.'),see(normal,down,' '),see(normal,left,' '),see(normal,up,'.'),doAction(move(right)).

lleva('a'):-see(normal,right,'.'),see(normal,down,'#'),see(normal,left,' '),see(normal,up,'#'),doAction(move(right)).

lleva('a'):-see(normal,right,'.'),see(normal,down,'#'),see(normal,left,' '),see(normal,up,'E'),doAction(move(right)).

lleva('a'):-see(normal,right,'E'),see(normal,down,'#'),see(normal,left,' '),see(normal,up,'.'),doAction(move(up)).

lleva('a'):-see(normal,right,' '),see(normal,down,'E'),see(normal,left,' '),see(normal,up,'.'),doAction(move(right)).

lleva('a'):-see(normal,right,'.'),see(normal,down,'E'),see(normal,left,'.'),see(normal,up,'.'),doAction(move(left)).



lleva('a'):-see(normal,right,'.'),see(normal,down,'.'),see(normal,left,' '),see(normal,up,'.'),doAction(move(down)).

lleva('a'):-see(normal,right,'.'),see(normal,down,'#'),see(normal,left,' '),see(normal,up,'#'),doAction(move(right)).

lleva('a'):-see(normal,right,'+'),see(normal,down,'#'),see(normal,left,' '),see(normal,up,'.'),doAction(move(up)).

lleva('a'):-see(normal,right,'#'),see(normal,down,' '),see(normal,left,' '),see(normal,up,'E'),doAction(move(left)).

lleva('a'):-see(normal,right,' '),see(normal,down,' '),see(normal,left,' '),see(normal,up,'.'),doAction(move(right)).

lleva('a'):-see(normal,right,' '),see(normal,down,' '),see(normal,left,' '),see(normal,up,'E'),doAction(move(right)).

lleva('a'):-see(normal,right,'#'),see(normal,down,' '),see(normal,left,' '),see(normal,up,'.'),doAction(move(up)).

lleva('a'):-see(normal,right,'#'),see(normal,down,' '),see(normal,left,'.'),see(normal,up,'.'),doAction(move(up)).

lleva('a'):-see(normal,right,'#'),see(normal,down,' '),see(normal,left,'.'),see(normal,up,'#'),doAction(move(left)).

lleva('a'):-see(normal,right,' '),see(normal,down,'.'),see(normal,left,'.'),see(normal,up,'#'),doAction(move(down)).

lleva('a'):-see(normal,right,' '),see(normal,down,' '),see(normal,left,'.'),see(normal,up,' '),doAction(move(left)).

lleva('a'):-see(normal,right,' '),see(normal,down,' '),see(normal,left,' '),see(normal,up,'.'),doAction(move(right)).

lleva('a'):-see(normal,right,' '),see(normal,down,' '),see(normal,left,'.'),see(normal,up,'E'),doAction(move(none)).

lleva('a'):-see(normal,right,' '),see(normal,down,'E'),see(normal,left,'.'),see(normal,up,'.'),doAction(move(up)).

lleva('a'):-see(normal,right,' '),see(normal,down,' '),see(normal,left,'.'),see(normal,up,'#'),doAction(move(left)).

lleva('a'):-see(normal,right,' '),see(normal,down,' '),see(normal,left,'.'),see(normal,up,' '),doAction(move(left)).

lleva('a'):-see(normal,right,' '),see(normal,down,' '),see(normal,left,'.'),see(normal,up,'.'),doAction(move(up)).

lleva('a'):-see(normal,right,'E'),see(normal,down,' '),see(normal,left,'.'),see(normal,up,'#'),doAction(move(left)).

lleva('a'):-see(normal,right,'E'),see(normal,down,'.'),see(normal,left,'.'),see(normal,up,'#'),doAction(move(left)).

lleva('a'):-see(normal,right,'E'),see(normal,down,'.'),see(normal,left,'#'),see(normal,up,'#'),doAction(move(down)).

lleva('a'):-see(normal,right,'.'),see(normal,down,' '),see(normal,left,'#'),see(normal,up,'E'),doAction(move(right)).

lleva('a'):-see(normal,right,'.'),see(normal,down,'E'),see(normal,left,' '),see(normal,up,'E'),doAction(move(right)).

lleva('a'):-see(normal,right,' '),see(normal,down,' '),see(normal,left,' '),see(normal,up,' '),doAction(move(right)).

lleva('a'):-see(normal,right,'E'),see(normal,down,' '),see(normal,left,' '),see(normal,up,' '),doAction(move(down)).

lleva('a'):-see(normal,right,'#'),see(normal,down,' '),see(normal,left,' '),see(normal,up,' '),doAction(move(down)).

lleva('a'):-see(normal,right,'+'),see(normal,down,'#'),see(normal,left,' '),see(normal,up,' '),doAction(drop(up)).

%lleva2
lleva('+'):-see(normal,right,'.'),see(normal,down,'#'),see(normal,up-left,'.'),see(normal,left,'F'),see(normal,up,'#'),doAction(drop(left)).

lleva('+'):-see(normal,right,'.'),see(normal,down,'#'),see(normal,left,' '),see(normal,up,'a'),doAction(move(right)).

lleva('+'):-see(normal,right,'.'),see(normal,down,'#'),see(normal,left,' '),see(normal,up,'.'),doAction(move(right)).

lleva('+'):-see(normal,right,'.'),see(normal,down,'#'),see(normal,left,' '),see(normal,up,'#'),doAction(move(right)).


lleva('+'):-see(normal,right,'E'),doAction(move(up)).
lleva('+'):-see(normal,down,'E'),doAction(move(none)).
lleva('+'):-see(normal,right,'.'),doAction(move(right)).
lleva('+'):-see(normal,left,'.'),doAction(move(left)).
lleva('+'):-see(normal,up,'.'),doAction(move(up)).
lleva('+'):-see(normal,down,'.'),doAction(move(down)).

