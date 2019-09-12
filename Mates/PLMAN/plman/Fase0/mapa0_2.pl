%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% DIF:	2  (T)
%%% PT:	00:10	[STS: 00:30]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

map([['#', '#', '#'],
['#', '.', '#'],
['#', '.', '#'],
['#', ' ', '#'],
['#', '.', '#'],
['#', '.', '#'],
['#', '.', '#'],
['#', ' ', '#'],
['#', '#', '#']]).
map_size(3, 9).
num_dots(5).
pacman_start(1, 7).
initMap:- 
	addSolidObject('#'), 
	createGameEntity('E', object, 1, 3, inactive, norule, 
	                 data(ejercicios, not_solid, static, norule, 'ejercicios de logica')).
norule(_).
