%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% DIF:	4+
%%% PT:	00:18	[STS: 00:54]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

map_format_version(1.0).
load_behaviour(pushBlocks).
map([['#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#'],
['#', ' ', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#'],
['#', '.', '#', '#', '#', '#', '.', '#', '.', '.', '#', '.', '#', '.', '.', '#', '.', '#', ' ', '#', '#', '.', '#'],
['#', '.', '#', '.', '.', '.', '.', '#', ' ', '#', '#', '.', '#', '.', '.', '#', '.', '.', '.', '.', '.', '.', '#'],
['#', '.', '#', '.', '.', '.', '.', '#', '#', '#', '#', '.', '#', '.', '.', '#', '.', '.', '.', '.', '.', '.', '#'],
['#', '.', '#', '#', '#', '#', '.', '#', '.', '.', '#', '.', '#', '#', '#', '#', '.', '#', '#', ' ', '#', '.', '#'],
['#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#'],
['#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#']]).
map_size(23, 8).
num_dots(85).
pacman_start(1, 1).
initMap:- 
	addSolidObject('#'), 
	createGameEntity(OID_P, '\\', object, 8, 3, inactive, norule, 
			[name(palanca), solid(false), static(false), use_rule(pushBlocks),
			description('Palanca que puede mover bloques pesados'), appearance(attribs(bold, cyan, default))]), 
	createGameEntity(OID_B1, '%', object, 18, 3, inactive, norule, 
			[name(bloque1), solid(true), static(true), use_rule(norule),
			description('Bloque muy pesado que solo puede moverse haciendo palanca'), appearance(attribs(bold, black, green))]), 
	createGameEntity(OID_B2, '%', object, 19, 4, inactive, norule, 
			[name(bloque2), solid(true), static(true), use_rule(norule),
			description('Bloque muy pesado que solo puede moverse haciendo palanca'), appearance(attribs(bold, black, green))]), 
	pushBlocks(init, OID_O, [OID_B1, OID_B2]).
norule(_).
norule(_,_,_,_,_).
