%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% DIF:	4
%%% PT:	00:35	[STS: 02:00]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

map_format_version(1.0).
load_behaviour(basicDoorKey).
load_behaviour(enemyFollower).
load_behaviour(mineExplosion).
load_behaviour(enemyBasicMovement).
map([['#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#'],
['#', '.', '.', '.', '.', '.', '.', '.', '.', '#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#'],
['#', '.', '.', '#', '#', '.', '.', '#', '.', '#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#', '.', '#', '.', '#', '.', '#', '.', '#', '.', '#'],
['#', ' ', '#', '.', '.', '.', '#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#', '.', '#', '.', '#', '.', '#', '.', '#', '.', '#'],
['#', '.', '.', '.', '.', '.', '.', '.', '.', '#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#'],
['#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#']]).
map_size(32, 6).
num_dots(100).
pacman_start(8, 1).
initMap:- 
	addSolidObject('#'), 
	% DOOR & KEY
	createGameEntity(OID_D, '|', object, 9, 3, inactive, norule, 
			[name(puerta_azul), solid(true), static(true), use_rule(norule),
			description('Puerta que se abre con la llave azul'), appearance(attribs(normal, black, cyan))]), 
	createGameEntity(OID_K, 'a', object, 1, 3, inactive, norule, 
			[name(llave_azul), solid(false), static(false), use_rule(basicDoorKey),
			description('Llave que abre la puerta azul'), appearance(attribs(bold, cyan, default))]),
	basicDoorKey(init, OID_D, [ 'pl-man':destroyGameEntity(OID_D) ], [ OID_K ]),

	% MINE
	createGameEntity(OID_2, '+', object, 21, 4, active, mine, 
			[name(mina), solid(false), static(false), use_rule(norule),
			description('Mina potente que explota a los 2 segundos de ser dejada'), appearance(attribs(bold, cyan, default))]),
	mine(init, OID_2, 2, 2, [ no_destroy(['.']) ]),
	
	% FIRST STEP ENEMIES
	createGameEntity(EID_0, 'E', mortal, 20, 1, active, enemyBasicMovement, [appearance(attribs(normal, red, default))]), 
	createGameEntity(EID_1, 'E', mortal, 15, 3, active, enemyBasicMovement, [appearance(attribs(normal, red, default))]), 
	createGameEntity(EID_4, 'E', mortal, 11, 2, active, enemyBasicMovement, [appearance(attribs(normal, red, default))]), 
	createGameEntity(EID_6, 'E', mortal, 18, 4, active, enemyBasicMovement, [appearance(attribs(normal, red, default))]),
	enemyBasicMovement(init, EID_0, left-right, ['#']),
	enemyBasicMovement(init, EID_1, left-right, ['#', '|']),
	enemyBasicMovement(init, EID_4, left-right, ['#']),
	enemyBasicMovement(init, EID_6, left-right, ['#', '+']),

	% FOLLOWER GHOSTS
	createGameEntity(EID_2, 'F', mortal, 24, 2, active, enemyFollower, [appearance(attribs(normal, red, default))]), 
	createGameEntity(EID_3, 'F', mortal, 28, 2, active, enemyFollower, [appearance(attribs(normal, red, default))]), 
	createGameEntity(EID_5, 'F', mortal, 26, 3, active, enemyFollower, [appearance(attribs(normal, red, default))]), 
	enemyFollower(init, EID_2, ['@'], [up, down, left, right], [delay(1)]),
	enemyFollower(init, EID_3, ['@'], [up, down, left, right], [delay(1)]),
	enemyFollower(init, EID_5, ['@'], [up, down, left, right], [delay(1)]).

norule(_).
norule(_,_,_,_,_).
