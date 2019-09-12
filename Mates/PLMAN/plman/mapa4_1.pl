%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% DIF:	2
%%% PT:	01:20	[STS: 05:30]
%%%
%%% INDETERMINISMOS DE ESTE MAPA
%%%------------------------------------------------------------
%%% Este mapa cuenta con 3 factores indeterministas que se
%%% describen a continuación:
%%% 1) Arqueros automaticos:
%%%	Aparecen 2 arqueros automáticos, uno a la izquierda y 
%%%	otro a la derecha del mapa al comienzo de la partida. 
%%%	La fila en que estos arqueros aparecen es siempre aleatoria.
%%%	Además, ambos arqueros disparan con una frecuencia que
%%%	se establece aleatoriamente al comienzo de la partida.
%%%	La frecuencia es un disparo cada 3 a 7 ciclos de ejecución.
%%% 2) Posición inicial de PL-MAN:
%%%	PL-Man aparece siempre en la zona central del mapa (filas
%%%	4 a 6, columnas 3 a 25) de forma completamente aleatoria.
%%% 3) Posición de las aberturas de paso en los muros:
%%%	Ambos muros tienen siempre una abertura de paso que 
%%%	aparece aleatoriamente en cualquier columna de toda la
%%%	longitud de los muros, salvo en los extremos. Es decir,
%%%	en columnas de la 3 a la 25.
%%%
%%% El resto de elementos del mapa son deterministas.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

map_format_version(1.0).
load_behaviour(combiner).
load_behaviour(automaticArcher).
load_behaviour(enemyBasicMovement).
map([['#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#'],
['#', ' ', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', ' ', '#'],
['#', ' ', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', ' ', '#'],
['#', ' ', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', ' ', '#'],
['#', ' ', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', ' ', '#'],
['#', ' ', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', ' ', '#'],
['#', ' ', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', ' ', '#'],
['#', ' ', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', ' ', '#'],
['#', ' ', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', ' ', '#'],
['#', ' ', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', ' ', '#'],
['#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#']]).
map_size(29, 11).
num_dots(175).
pacman_start(X, Y):- randomBetween(3, 25, X), randomBetween(4,6,Y).
initMap:- 
	addSolidObject('#'),
	
	% Wall Waypasses
	randomBetween(3,25, XW1), randomBetween(3,25, XW2),
	setDCellContent(XW1, 3, ' '),
	setDCellContent(XW2, 7, ' '),
	
	% Automatic Archers 
	createGameEntity(OID_0, ')', object, 1, rnd(1,9), active, combiner([automaticArcher, enemyBasicMovement]), 
			[name(arquero1), solid(false), static(true), use_rule(norule),
			description('Arquero automático del rey'), appearance(attribs(bold, yellow, default))]), 
	createGameEntity(OID_1, '(', object, 27, rnd(1,9), active, combiner([automaticArcher, enemyBasicMovement]), 
			[name(arquero2), solid(false), static(true), use_rule(norule),
			description('Arquero automático del rey'), appearance(attribs(bold, yellow, default))]), 
	enemyBasicMovement(init, OID_0, down-up, ['#']),
	enemyBasicMovement(init, OID_1, up-down, ['#']),
	randomBetween(3,8,D1), randomBetween(3,8,D2),
   automaticArcher(init, OID_0, ['@'], right, D1, [ continuous, bullet_appearance('>', bold, red, default) ]),
   automaticArcher(init, OID_1, ['@'],  left, D2, [ continuous, bullet_appearance('<', bold, red, default) ]).
norule(_).
norule(_,_,_,_,_).
