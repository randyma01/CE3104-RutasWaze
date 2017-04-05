%___________________________________________________________________________

:-dynamic
	rpath/2.      % A reversed path
%Edge(+start,+end,+weight,+time)%

edge(a,b,4,8).
edge(a,c,5,7).

edge(b,a,4,8).
edge(b,d,6,9).

edge(c,a,5,7).
edge(c,d,3,9).

edge(d,c,3,9).
edge(d,b,6,9).


/*
 * afuera distancia
 * adentro tiempo
 *
 *		4km
 *     A------------------B
 *     |	8H	  |
 *     |		  |
 * 5km | 7H	       9H | 6km
 *     |                  |
 *     |	9H	  |
 *     C------------------C
 *              3km
 *
 *
 *               _
 *              |_|
 */


tiempo(From,To,Dist,Tim) :- edge(To,From,Dist,Tim).
tiempo(From,To,Dist,Tim) :- edge(From,To,Dist,Tim).

menorTiempo([H|Path], Tim) :-
	rpath([H|T], Ti), !, Tim < Ti,
	retract(rpath([H|_],_)),
	writef('%w is closer than %w\n', [[H|Path], [H|T]]),
	assert(rpath([H|Path], Tim)).

menorTiempo(Path, Tim) :-
	writef('New path:%w\n', [Path]),
	assert(rpath(Path,Tim)).

recorriendoTiempo(From, Path, _, Time) :-
	tiempo(From, T, 0, Tim),
	not(memberchk(T, Path)),
	menorTiempo([T,From|Path], Time+Tim),
	traverse(T,[From|Path],Time+Tim).

recorriendoTiempo(From) :-
	retractall(rpath(_,_)),
	recorriendoTiempo(From,[],_,0).

recorriendoTiempo(_).

dijkstraTime(From, To) :-
	recorriendoTiempo(From),
	rpath([To|RPath], Tim)->
	  reverse([To|RPath], Path),
	  Time is round(Tim),
	  writef('Shortest path is %w with time %w = %w\n',
	       [Path, Tim, Time]);
	writef('There is no route from %w to %w\n', [From, To]).



