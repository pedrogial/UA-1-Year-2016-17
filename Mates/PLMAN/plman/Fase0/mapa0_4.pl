%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% DIF:	4  (T)
%%% PT:	00:10	[STS: 00:30]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

map([['#', '#', '#', '#'],
['#', ' ', ' ', '#'],
['#', '#', '#', '#']]).
map_size(4, 3).
num_dots(1).
pacman_start(2, 1).
initMap:- 
	addSolidObject('#'), 
	createGameEntity('p', object, 1, 1, inactive, norule, 
	                 data(plumero, not_solid, not_static, norule, 'Plumero atrapapolvo')),
	entityType(EID_P, pacman),
	getObjectFrom(EID_P, 1, 1),
	createGameEntity('#', object, 3, 1, active, pickUpRule,
			 data(checker, solid, static, norule, 'Checks end of the game')),
	msgWindowWrite('Tu misión en este mapa consiste dejar el objeto que llevas contigo.').

% Rule to check if pacman has picked up the object
pickUpRule(_):-
	not(havingObject) ->
	dotEaten.
pickUpRule(_).

norule(_).
