%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% DIF:	5
%%% PT:	__:__	[STS: __:__]
%%%
%%% INDETERMINISMOS DE ESTE MAPA
%%%------------------------------------------------------------
%%% En este mapa hay varios objetos indeterministas, que 
%%% enumeramos a continuación:
%%% 1) Puertas de acceso al teletransportador:
%%%    Aparecen 3 puertas de colores diferentes que dan acceso
%%%    al teletransportador en la zona superior izquierda. Las
%%%    3 puertas están siempre en el mismo sitio, pero en orden
%%%    aleatorio.
%%% 2) Llaves para las puertas de acceso:
%%%    Al igual que las puertas, aparecen 3 llaves en la zona
%%%    inferior derecha de la sala superior del mapa. Las 3
%%%    llaves están siempre en el mismo sitio pero, al igual
%%%    que las puertas, en orden aleatorio.
%%% 3) Enemigo que protege las llaves:
%%%    Este enemigo siempre patrulla de izquierda a derecha,
%%%    desde la pared hasta la primera llave que encuentre.
%%%    El enemigo aparece aleatoriamente en una columna distinta
%%%    cada vez, aunque siempre en la misma fila. Concretamente
%%%    puede aparecer en las columnas 1-5.
%%%
%%% El resto de elementos en este mapa son deterministas
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

map_format_version(1.0).
load_behaviour(basicTeletransport).
load_behaviour(basicDoorKey).
load_behaviour(automaticArcher).
load_behaviour(enemyBasicMovement).
map([['#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#'],
['#', ' ', ' ', ' ', ' ', ' ', '.', '.', '.', '.', '.', '.', '.', '#'],
['#', '#', '#', '#', '#', '.', '.', '.', '.', '.', '.', '.', '.', '#'],
['#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#'],
['#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#', '#', '#', '#'],
['#', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '#'],
['#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#'],
['#', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '#'],
['#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#'],
['#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#'],
['#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#'],
['#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#']]).
map_size(14, 12).
num_dots(72).
pacman_start(5, 1).
initMap:- 
	addSolidObject('#'), 

	% Teletransport
	createGameEntity(OID_TT, '?', object, 1, 1, active, basicTeletransport, 
			[name(teletransporte), solid(false), static(true), use_rule(norule),
			description('Runa antigua de teletransporte'), appearance(attribs(bold, black, white))]),
	basicTeletransport(init, OID_TT, from(1, 1), to(1, 7), ['@'], []),

	% 3 Doors
	randomPermutation([2,3,4], OL),
   [D1X, D2X, D3X] = OL,
	createGameEntity(OID_D1, '|', object, D1X, 1, inactive, norule, 
			[name(puerta_roja), solid(true), static(true), use_rule(norule),
			description('Puerta que se abre con la llave roja'), appearance(attribs(bold, black, red))]), 
	createGameEntity(OID_D2, '|', object, D2X, 1, inactive, norule, 
			[name(puerta_azul), solid(true), static(true), use_rule(norule),
			description('Puerta que se abre con la llave azul'), appearance(attribs(bold, black, cyan))]), 
	createGameEntity(OID_D3, '|', object, D3X, 1, inactive, norule, 
			[name(puerta_naranja), solid(true), static(true), use_rule(norule),
			description('Puerta que se abre con la llave naranja'), appearance(attribs(bold, black, yellow))]), 
	
	% 3 keys
	randomPermutation([10,11,12], KL),
   [K1X, K2X, K3X] = KL,
	createGameEntity(OID_K1, '-', object, K1X, 5, inactive, norule, 
			[name(llave_roja), solid(false), static(false), use_rule(basicDoorKey),
			description('Llave que abre la puerta roja'), appearance(attribs(bold, red, default))]), 
	createGameEntity(OID_K2, '-', object, K2X, 5, inactive, norule, 
			[name(llave_azul), solid(false), static(false), use_rule(basicDoorKey),
			description('Llave que abre la puerta azul'), appearance(attribs(bold, cyan, default))]), 
	createGameEntity(OID_K3, '-', object, K3X, 5, inactive, norule, 
			[name(llave_naranja), solid(false), static(false), use_rule(basicDoorKey),
			description('Llave que abre la puerta naranja'), appearance(attribs(normal, yellow, default))]), 
	basicDoorKey(init, OID_D1, [ 'pl-man':destroyGameEntity(OID_D1) ], [ OID_K1 ]),
	basicDoorKey(init, OID_D2, [ 'pl-man':destroyGameEntity(OID_D2) ], [ OID_K2 ]),
	basicDoorKey(init, OID_D3, [ 'pl-man':destroyGameEntity(OID_D3) ], [ OID_K3 ]),

	% Automatic Archers
	createGameEntity(OID_AR1, 'v', object, 3, 7, active, automaticArcher, 
			[name(arquero), solid(false), static(true), use_rule(norule),
			description('Arquero automático del rey'), appearance(attribs(bold, yellow, default))]), 
	createGameEntity(OID_AR2, 'v', object, 5, 7, active, automaticArcher, 
			[name(arquero), solid(false), static(true), use_rule(norule),
			description('Arquero automático del rey'), appearance(attribs(bold, yellow, default))]), 
	createGameEntity(OID_AR3, 'v', object, 7, 7, active, automaticArcher, 
			[name(arquero), solid(false), static(true), use_rule(norule),
			description('Arquero automático del rey'), appearance(attribs(bold, yellow, default))]), 
	createGameEntity(OID_AR4, 'v', object, 9, 7, active, automaticArcher, 
			[name(arquero), solid(false), static(true), use_rule(norule),
			description('Arquero automático del rey'), appearance(attribs(bold, yellow, default))]), 
	createGameEntity(OID_AR5, 'v', object, 11, 7, active, automaticArcher, 
			[name(arquero), solid(false), static(true), use_rule(norule),
			description('Arquero automático del rey'), appearance(attribs(bold, yellow, default))]), 
	automaticArcher(init, OID_AR1, ['@'], down, 3, [ continuous, bullet_appearance('|', bold, red, default) ]),
	automaticArcher(init, OID_AR2, ['@'], down, 4, [ continuous, bullet_appearance('|', bold, red, default) ]),
	automaticArcher(init, OID_AR3, ['@'], down, 3, [ continuous, bullet_appearance('|', bold, red, default) ]),
	automaticArcher(init, OID_AR4, ['@'], down, 4, [ continuous, bullet_appearance('|', bold, red, default) ]),
	automaticArcher(init, OID_AR5, ['@'], down, 3, [ continuous, bullet_appearance('|', bold, red, default) ]),
			
	% Enemy
	createGameEntity(EID_0, 'E', mortal, rnd(1,5), 5, active, enemyBasicMovement, [appearance(attribs(normal, red, default))]),
	enemyBasicMovement(init, EID_0, left-right, ['-', '#']).
	

norule(_).
norule(_,_,_,_,_).
