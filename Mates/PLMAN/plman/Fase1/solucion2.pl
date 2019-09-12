:-use_module('pl-man-game/main').

%Mapa1_1

rej1:-see(normal,down,'\\'),doAction(get(down)).

rej1:-see(normal,right,'.'),see(normal,up,'#'),see(normal,left,'#'),see(normal,down,'.'),doAction(move(down)).

rej1:-see(normal,right,'#'),see(normal,up,' '),see(normal,left,'#'),see(normal,down,'.'),doAction(move(down)).

rej1:-see(normal,right,'.'),see(normal,up,' '),see(normal,left,'#'),see(normal,down,'#'),doAction(move(right)).

rej1:-see(normal,right,'.'),see(normal,up,'#'),see(normal,left,' '),see(normal,down,'#'),doAction(move(right)).

rej1:-see(normal,right,'.'),see(normal,up,'.'),see(normal,left,' '),see(normal,down,'#'),doAction(move(up)).

rej1:-see(normal,right,'#'),see(normal,left,'#'),see(normal,down,' '),see(normal,up,'.'),doAction(move(up)).

rej1:-see(normal,right,'#'),see(normal,left,'.'),see(normal,down,' '),see(normal,up,'.'),doAction(move(left)).

rej1:-see(normal,right,' '),see(normal,left,'.'),see(normal,down,'#'),see(normal,up,'.'),doAction(move(left)).

rej1:-see(normal,right,' '),see(normal,left,'#'),see(normal,down,'#'),see(normal,up,'.'),doAction(move(up)).

rej1:-see(normal,right,'.'),see(normal,left,'#'),see(normal,down,' '),see(normal,up,'#'),doAction(move(right)).

rej1:-see(normal,right,'.'),see(normal,left,' '),see(normal,down,' '),see(normal,up,'#'),doAction(move(right)).

rej1:-see(normal,right,'#'),see(normal,left,' '),see(normal,down,' '),see(normal,up,'.'),doAction(move(up)).

rej1:-see(normal,right,'.'),see(normal,left,'.'),see(normal,down,' '),see(normal,up,'#'),doAction(move(left)).

rej1:-see(normal,right,' '),see(normal,left,'.'),see(normal,down,'#'),see(normal,up,'#'),doAction(move(left)).

rej1:-see(normal,right,' '),see(normal,left,' '),see(normal,down,'#'),see(normal,up,'#'),doAction(move(right)).

rej1:-see(normal,right,'.'),see(normal,left,' '),see(normal,down,' '),see(normal,up,'#'),doAction(move(right)).

rej1:-see(normal,right,'.'),see(normal,left,' '),see(normal,down,'.'),see(normal,up,'#'),doAction(move(down)).

rej1:-see(normal,right,'.'),see(normal,left,'#'),see(normal,down,' '),see(normal,up,' '),doAction(move(right)).

rej1:-see(normal,right,'#'),see(normal,left,' '),see(normal,down,'#'),see(normal,up,'.'),doAction(move(up)).

rej1:-see(normal,right,'.'),see(normal,left,' '),see(normal,down,' '),see(normal,up,'#'),doAction(move(right)).

rej1:-see(normal,right,'.'),see(normal,left,'.'),see(normal,down,'#'),see(normal,up,' '),doAction(move(left)).

rej1:-see(normal,right,' '),see(normal,left,' '),see(normal,down,'#'),see(normal,up,'.'),doAction(move(up)).

rej1:-see(normal,right,'#'),see(normal,left,' '),see(normal,down,' '),see(normal,up,'#'),doAction(move(down)).

rej1:-see(normal,right,' '),see(normal,left,' '),see(normal,down,'#'),see(normal,up,' '),doAction(move(right)).

rej1:-see(normal,right,'.'),see(normal,left,' '),see(normal,down,'#'),see(normal,up,' '),doAction(move(up)).

rej1:-see(normal,right,'#'),see(normal,left,'#'),see(normal,down,' '),see(normal,up,' '),doAction(move(up)).

rej1:-see(normal,right,'.'),see(normal,left,'#'),see(normal,down,'.'),see(normal,up,' '),doAction(move(down)).

rej1:-see(normal,right,'.'),see(normal,left,'#'),see(normal,down,'#'),see(normal,up,' '),doAction(move(right)).

rej1:-see(normal,right,'%'),see(normal,left,' '),see(normal,down,' '),see(normal,up,'#'),doAction(move(left)).

rej1:-see(normal,right,' '),see(normal,left,'#'),see(normal,down,' '),see(normal,up,' '),doAction(move(up)).

rej1:-see(normal,right,'#'),see(normal,left,' '),see(normal,down,'.'),see(normal,up,'#'),doAction(move(down)).

rej1:-see(normal,right,'#'),see(normal,left,'.'),see(normal,down,'.'),see(normal,up,' '),doAction(move(left)).

rej1:-see(normal,right,' '),see(normal,left,'.'),see(normal,down,'.'),see(normal,up,'#'),doAction(move(left)).

rej1:-see(normal,right,' '),see(normal,left,'%'),see(normal,down,'%'),see(normal,up,'#'),doAction(use(down)).

rej1:-see(normal,right,' '),see(normal,left,'%'),see(normal,down,'.'),see(normal,up,'#'),doAction(move(down)).

rej1:-see(normal,right,'.'),see(normal,left,'.'),see(normal,down,'%'),see(normal,up,' '),doAction(move(left)).

rej1:-see(normal,right,' '),see(normal,left,' '),see(normal,down,'#'),see(normal,up,'%'),doAction(use(up)).

rej1:-see(normal,right,' '),see(normal,left,' '),see(normal,down,' '),see(normal,up,'%'),doAction(move(right)).

rej1:-see(normal,right,' '),see(normal,left,' '),see(normal,down,' '),see(normal,up,'#'),doAction(move(right)).

rej1:-see(normal,right,' '),see(normal,left,' '),see(normal,down,'.'),see(normal,up,'#'),doAction(move(down)).

rej1:-see(normal,right,'#'),see(normal,left,' '),see(normal,down,'.'),see(normal,up,' '),doAction(move(down)).

rej1:-see(normal,right,'#'),see(normal,left,'.'),see(normal,down,'#'),see(normal,up,' '),doAction(move(left)).

rej1:-see(normal,right,' '),see(normal,left,'.'),see(normal,down,'#'),see(normal,up,'#'),doAction(move(left)).

rej1:-see(normal,right,' '),see(normal,left,'.'),see(normal,down,'#'),see(normal,up,'%'),doAction(move(left)).

%Mapa1_2

rej2:-see(normal,right,'#'),see(normal,left,' '),see(normal,down,'#'),see(normal,up,'#'),see(normal,down-right,'#'),see(normal,down-left,'#'),see(normal,up-right,'#'),see(normal,up-left,'#'),doAction(move(left)).

rej2:-see(normal,right,'.'),see(normal,left,'#'),see(normal,down,'.'),see(normal,up,' '),see(normal,down-right,'#'),see(normal,down-left,'#'),see(normal,up-right,'#'),see(normal,up-left,'#'),doAction(move(right)).

rej2:-see(normal,right,' '),see(normal,left,' '),see(normal,down,'#'),see(normal,up,'#'),see(normal,down-right,'#'),see(normal,down-left,'.'),see(normal,up-right,'#'),see(normal,up-left,' '),doAction(move(left)).

rej2:-see(normal,right,' '),see(normal,left,'#'),see(normal,down,'.'),see(normal,up,' '),see(normal,down-right,'#'),see(normal,down-left,'#'),see(normal,up-right,'#'),see(normal,up-left,'#'),doAction(move(down)).

rej2:-see(normal,right,'#'),see(normal,left,'#'),see(normal,down,'.'),see(normal,up,'#'),doAction(move(down)).

rej2:-see(normal,right,'#'),see(normal,left,'#'),see(normal,down,'.'),see(normal,up,' '),doAction(move(down)).

rej2:-see(normal,right,'.'),see(normal,left,'.'),see(normal,down,'#'),see(normal,up,' '),doAction(move(left)).

rej2:-see(normal,right,' '),see(normal,left,'.'),see(normal,down,'#'),see(normal,up,'#'),doAction(move(left)).

rej2:-see(normal,right,' '),see(normal,left,'.'),see(normal,down,'#'),see(normal,up,'.'),doAction(move(left)).

rej2:-see(normal,right,' '),see(normal,left,'#'),see(normal,down,'#'),see(normal,up,'.'),doAction(move(up)).

rej2:-see(normal,right,'#'),see(normal,left,'#'),see(normal,down,' '),see(normal,up,'.'),doAction(move(up)).

rej2:-see(normal,right,'.'),see(normal,left,'#'),see(normal,down,' '),see(normal,up,'#'),doAction(move(right)).

rej2:-see(normal,right,'.'),see(normal,left,' '),see(normal,down,'#'),see(normal,up,'#'),doAction(move(right)).

rej2:-see(normal,right,'.'),see(normal,left,' '),see(normal,down,'.'),see(normal,up,'#'),doAction(move(down)).

rej2:-see(normal,right,'#'),see(normal,left,'#'),see(normal,down,'.'),see(normal,up,' '),doAction(move(down)).

rej2:-see(normal,right,'#'),see(normal,left,'.'),see(normal,down,'.'),see(normal,up,' '),doAction(move(left)).

rej2:-see(normal,right,' '),see(normal,left,'.'),see(normal,down,'.'),see(normal,up,'#'),doAction(move(left)).

rej2:-see(normal,right,' '),see(normal,left,'#'),see(normal,down,'.'),see(normal,up,'#'),doAction(move(down)).

rej2:-see(normal,right,'.'),see(normal,left,'#'),see(normal,down,'.'),see(normal,up,' '),doAction(move(down)).

rej2:-see(normal,right,'.'),see(normal,left,'#'),see(normal,down,'#'),see(normal,up,' '),doAction(move(right)).

rej2:-see(normal,right,'.'),see(normal,left,' '),see(normal,down,'#'),see(normal,up,'.'),doAction(move(up)).

rej2:-see(normal,right,'.'),see(normal,left,' '),see(normal,down,' '),see(normal,up,' '),doAction(move(right)).

rej2:-see(normal,right,'#'),see(normal,left,' '),see(normal,down,'.'),see(normal,up,' '),doAction(move(down)).

rej2:-see(normal,right,'#'),see(normal,left,' '),see(normal,down,'.'),see(normal,up,' '),doAction(move(down)).

rej2:-see(normal,right,'#'),see(normal,left,'#'),see(normal,down,' '),see(normal,up,' '),doAction(move(down)).

rej2:-see(normal,right,' '),see(normal,left,' '),see(normal,down,'#'),see(normal,up,' '),doAction(move(right)).

rej2:-see(normal,right,' '),see(normal,left,' '),see(normal,down,'#'),see(normal,up,'#'),doAction(move(right)).

rej2:-see(normal,right,'.'),see(normal,left,' '),see(normal,down,'#'),see(normal,up,' '),doAction(move(right)).

rej2:-see(normal,right,'.'),see(normal,left,'.'),see(normal,down,' '),see(normal,up,'#'),doAction(move(left)).

rej2:-see(normal,right,'.'),see(normal,left,' '),see(normal,down,' '),see(normal,up,'#'),doAction(move(right)).

rej2:-see(normal,right,' '),see(normal,left,'#'),see(normal,down,'#'),see(normal,up,'#'),doAction(move(right)).

rej2:-see(normal,right,' '),see(normal,left,'.'),see(normal,down,'#'),see(normal,up,' '),doAction(move(left)).

rej2:-see(normal,right,'#'),see(normal,left,'.'),see(normal,down,' '),see(normal,up,'.'),doAction(move(left)).

rej2:-see(normal,right,'.'),see(normal,left,'#'),see(normal,down,' '),see(normal,up,'.'),doAction(move(right)).

rej2:-see(normal,right,'.'),see(normal,left,' '),see(normal,down,' '),see(normal,up,'.'),doAction(move(right)).

rej2:-see(normal,right,'.'),see(normal,left,'#'),see(normal,down,' '),see(normal,up,'.'),doAction(move(right)).

rej2:-see(normal,right,'#'),see(normal,left,' '),see(normal,down,' '),see(normal,up,'.'),doAction(move(up)).

rej2:-see(normal,right,' '),see(normal,left,'.'),see(normal,down,' '),see(normal,up,'.'),doAction(move(left)).

rej2:-see(normal,right,' '),see(normal,left,'#'),see(normal,down,' '),see(normal,up,'.'),doAction(move(up)).

rej2:-see(normal,right,' '),see(normal,left,'.'),see(normal,down,' '),see(normal,up,'#'),doAction(move(left)).

rej2:-see(normal,right,' '),see(normal,left,' '),see(normal,down,' '),see(normal,up,'#'),doAction(move(right)).

rej2:-see(normal,right,'.'),see(normal,left,' '),see(normal,down,'#'),see(normal,up,'#'),doAction(move(right)).

rej2:-see(normal,right,'#'),see(normal,left,' '),see(normal,down,' '),see(normal,up,'#'),doAction(move(down)).

rej2:-see(normal,right,'#'),see(normal,left,' '),see(normal,down,' '),see(normal,up,' '),doAction(move(down)).

rej2:-see(normal,right,'#'),see(normal,left,' '),see(normal,down,'#'),see(normal,up,'.'),doAction(move(up)).  

rej2:-see(normal,right,'#'),see(normal,left,'.'),see(normal,down,' '),see(normal,up,'#'),doAction(move(left)).

rej2:-see(normal,right,'#'),see(normal,left,' '),see(normal,down,' '),see(normal,up,'#'),doAction(move(down)).

rej2:-see(normal,right,'#'),see(normal,left,' '),see(normal,down,' '),see(normal,up,' '),doAction(move(down)).

rej2:-see(normal,right,'#'),see(normal,left,' '),see(normal,down,'#'),see(normal,up,' '),doAction(move(none)).



%Mapa1_3

rej3:-see(normal,right,'#'),see(normal,left,'.'),see(normal,down,'#'),see(normal,up,'#'),doAction(move(left)).

rej3:-see(normal,right,' ' ),see(normal,left,'.'),see(normal,down,'#'),see(normal,up,'#'),doAction(move(left)).

rej3:-see(normal,right,' '),see(normal,left,' '),see(normal,down-left,'.'),see(normal,down,'#'),see(normal,up,'#'),doAction(move(left)).

rej3:-see(normal,right,' '),see(normal,left,'#'),see(normal,down,'.'),see(normal,up,'#'),doAction(move(down)).

rej3:-see(normal,right,'#'),see(normal,left,'#'),see(normal,down,'.'),see(normal,up,' '),doAction(move(down)).

rej3:-see(normal,right,'.'),see(normal,left,'#'),see(normal,down,'#'),see(normal,up,' '),doAction(move(right)).

rej3:-see(normal,right,'.'),see(normal,left,' '),see(normal,down,'#'),see(normal,up,'#'),doAction(move(right)).

rej3:-see(normal,right,' '),see(normal,left,' '),see(normal,up-right,' '),see(normal,down,'#'),see(normal,up,'#'),doAction(move(right)).

rej3:-see(normal,right,'#'),see(normal,left,' '),see(normal,down,'#'),see(normal,up,' '),doAction(move(up)).

rej3:-see(normal,right,'#'),see(normal,left,'#'),see(normal,down,' '),see(normal,up,' '),doAction(move(up)).

rej3:-see(normal,right,'#'),see(normal,left,'#'),see(normal,down,' '),see(normal,up,'.'),doAction(move(up)).

rej3:-see(normal,right,'.'),see(normal,left,'#'),see(normal,down,' '),see(normal,up,'#'),doAction(move(right)).

rej3:-see(normal,right,'#'),see(normal,left,' '),see(normal,down,'.'),see(normal,up,'#'),doAction(move(down)).

rej3:-see(normal,right,'#'),see(normal,left,'.'),see(normal,down,'#'),see(normal,up,' '),doAction(move(left)).


