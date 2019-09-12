%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% DIF:	3
%%% PT:	00:30	[STS: 01:45]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

map_format_version(1.0).
load_behaviour(entitySequentialMovement).
load_behaviour(basicDoorKey).
map([['#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#'],
['#', '#', '#', '#', '#', '#', '.', '.', '.', '#', '#', '#', '#', '#', '#'],
['#', '.', '.', '.', '.', '.', '.', ' ', '.', '.', '.', '.', '.', '.', '#'],
['#', '#', '#', '#', '#', '.', '.', '.', '.', ' ', '#', '#', '#', '#', '#'],
['#', '#', '#', '#', '.', '.', '.', '.', '.', '.', '.', '#', '#', '#', '#'],
['#', '#', '#', '.', '.', '.', '.', ' ', '.', '.', '.', '.', '#', '#', '#'],
['#', '#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#', '#'],
['#', ' ', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#'],
['#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#']]).
map_size(15, 9).
num_dots(57).
pacman_start(7, 5).
initMap:- 
	addSolidObject('#'), 
	createGameEntity(OID_RD, '|', object, 3, 2, inactive, norule, 
			[ name('Puerta Roja'), solid(true), static(true), use_rule(norule),
			  description('Puerta que se abre con la llave roja'), appearance(attribs(bold, red, default))]),
	createGameEntity(OID_GD, '|', object, 11, 2, inactive, norule, 
			[ name('Puerta Verde'), solid(true), static(true), use_rule(norule),
			  description('Puerta que se abre con la llave verde'), appearance(attribs(bold, green, default))]),
	createGameEntity(OID_RK, 'r', object, 9, 3, inactive, norule, 
			[ name(llave_roja), solid(false), static(false), use_rule(basicDoorKey),
			  description('una llave de color rojo'), appearance(attribs(bold, red, default))]),
	createGameEntity(OID_GK, 'v', object, 1, 7, inactive, norule, 
			[ name(llave_verde),solid(false), static(false), use_rule(basicDoorKey),
			  description('una llave de color verde'), appearance(attribs(bold, green, default))]), 
	createGameEntity(EID_E, 'E', mortal, 7, 2, active, entitySequentialMovement, [appearance(attribs(normal, red, default))]),
	entitySequentialMovement(init, EID_E, [l,l,l,l,l,l,r,r,r,r,r,r,r,r,r,r,r,r,l,l,l,l,l,l], [no_repeat_moves]),
	basicDoorKey(init, OID_GD, ['pl-man':destroyGameEntity(OID_GD)], [OID_GK]),
	basicDoorKey(init, OID_RD, ['pl-man':destroyGameEntity(OID_RD)], [OID_RK]).
norule(_).
norule(_,_,_,_,_).
