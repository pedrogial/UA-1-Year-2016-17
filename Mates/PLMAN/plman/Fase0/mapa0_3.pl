%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% DIF:	3  (T)
%%% PT:	00:10	[STS: 00:30]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

map_format_version(1.0).
map([['#', '#', '#', '#'],
['#', ' ', ' ', '#'],
['#', '#', '#', '#']]).
map_size(5, 3).
num_dots(1).
pacman_start(2, 1).
initMap:- 
	addSolidObject('#'), 
	createGameEntity('h', object, 1, 1, inactive, norule, 
	                 data(silla, solid, not_static, norule, 'Silla del tiempo: Te teletransporta al levantarla.')),
	createGameEntity('#', object, 3, 1, active, pickUpRule,
			 data(checker, solid, static, norule, 'Checks end of the game')),
	msgWindowWrite('Tu misión consiste únicamente en coger la silla del tiempo.').

pickUpRule(_):-
	havingObject ->
	dotEaten.
pickUpRule(_).

norule(_).
norule(_,_,_,_,_).
