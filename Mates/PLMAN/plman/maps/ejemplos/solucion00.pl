:-use_module('pl-man-game/main').

rej1:-see(normal,down,'.'),doAction(move(down).

rej1:-see(normal,right,'|'),doAction(move(none).

rej1:-see(normal,down,'.'),doAction(move(right).

rej1:-see(normal,up,'.'),doAction(move(up).

rej1:-see(normal,up,'|'),doAction(move(up).
