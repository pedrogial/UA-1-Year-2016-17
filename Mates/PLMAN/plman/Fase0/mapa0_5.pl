%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% DIF:	5  (T)
%%% PT:	00:10	[STS: 00:30]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

map_format_version(1.0).
load_behaviour(gunBasic).
map([['#', '#', '#', '#', '#', '#', '#'],
['#', ' ', ' ', ' ', ' ', ' ', '#'],
['#', '#', '#', '#', '#', '#', '#']]).
map_size(4, 3).
num_dots(1).
pacman_start(5, 1).
initMap:- 
	addSolidObject('#'), 
	createGameEntity(OID, 'l', object, 4, 1, inactive, norule, 
	                 data(derringer, not_solid, not_static, gunBasic, 'Pistola derringer con 1 sólo disparo. Úsala bien.')),
	createGameEntity('E', mortal, 1, 1, inactive, norule, 0),
	entityType(EID_P, pacman),
	getObjectFrom(EID_P, 4, 1),
	createGameEntity('#', object, 1, 2, active, destroyRule,
			 data(checker, solid, static, norule, 'Checks end of the game')),
	msgWindowWrite('Tu misión en este mapa consiste en matar al enemigo.'),
	gunBasic(init, OID, 1, ['E'], keep).

% Rule to check if pacman has picked up the object
destroyRule(_):-
	not(entityLocation(_, 1, 1, 'E')) ->
	dotEaten.
pickUpRule(_).

norule(_).
