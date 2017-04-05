/*
 *Proyecto:
           Rutas

 *Autores:
           Gustavo Fallas
           Ricardo Chang
           Randy Mart�nez

 *Contenidos:
           1. Declaraci�n de los hechos (con sus respectivos
	      predicados).
	   2. Declaraci�n de las Funciones/Reglas.

 *Uso:
           Para interctuar con el programa Rutas es necesario tener
           alg�n compilador del lenguaje Prolog (SWI-Prolog o
	   GNU-Prolog, son recomendados). Una vez abierto, se debe
	   consultar el archivo "rutas.pl" para interactuar con el
	   programa.

 *Notas:
           1. El porgama Rutas esta basado en las cuidades de G�tica y
              Metr�polis resprectivamente.
           2. El siguiente c�digo del Algortimo de Dijkstra fue tomado c
              de la p�gina
	      https://rosettacode.org/wiki/Dijkstra%27s_algorithm#Prolog
	      y usado como base para el programa de Rutas. Este mismo fue
	      modificado ajustado a los requerimientos.
*
*/

:-dynamic
	rpath/2.

:- dynamic(ruta/3).   % hacer modificaciones a la base de datos


/***Declaraci�n de los hechos: ruta(a,b,peso).***/

/**G�tica**/

/*Baticuea ->*/
ruta(baticueva, mansionWayne, 1).

/*Mansi�n Wayne -> */
ruta(mansionWayne, baticueva, 1).
ruta(mansionWayne, escuelaGotica, 4).
ruta(mansionWayne, bomberosGotica, 2).
ruta(mansionWayne, refugio, 3).

/*Bomberos de G�tica -> */
ruta(bomberosGotica, hospitalGotica, 1).
ruta(bomberosGotica, mansionWayne, 2).
ruta(bomberosGotica, policiaGotica,3).

/*Escuela de G�tica -> */
ruta(escuelaGotica, mansionWayne, 4).
ruta(escuelaGotica, libreriaGotica, 3).
ruta(escuelaGotica, municipalidadGotica, 2).
ruta(escuelaGotica, refugio, 2).

/*Refugio o Centro de Refugiados de G�tica -> */
ruta(refufio, escuelaGotica, 2).
ruta(refugio, libreriaGotica, 3).
ruta(refugio, municipalidadGotica, 2).
ruta(refugio, policiaGotica, 2).
ruta(refugio, hospitalGotica, 2).
ruta(refugio, mansionWayne, 3).

/*Municipalidad de G�tica -> */
ruta(municipalidadGotica, escuelaGotica, 2).
ruta(municipalidadGotica, libreriaGotica, 3).
ruta(municipalidadGotica, torreWayne, 1).
ruta(municipalidadGotica, mercadoGotica, 4).
ruta(municipalidadGotica, refugio, 2).
ruta(municipalidadGotica, restauranteGotica, 3).
ruta(municipalidadGotica, policiaGotica, 2).
ruta(municipalidadGotica, hospitalGotica, 2).

/*Librer�a de G�tica -> */
ruta(libreriaGotica, escuelaGotica, 3).
ruta(libreriaGotica, refugio, 3).
ruta(libreriaGotica, municipalidadGotica, 3).
ruta(libreriaGotica, restaurantelGotica, 2).
ruta(libreriaGotica, mercadoGotica, 3).

/*Restaurante de G�tica -> */
ruta(restauranteGotica, libreriaGotica, 2).
ruta(restauranteGotica, municipalidadGotica, 3).
ruta(restauranteGotica, mercadoGotica, 3).

/*Bolsa de Valores o Mercado de G�tica*/
ruta(mercadoGotica, libreriaGotica, 3).
ruta(mercadoGotica, restauranteGotica, 3).
ruta(mercadoGotica, torreWayne, 1).
ruta(mercadoGotica, municipalidadGotica, 4).

/*Torre Wayne de G�tica -> */
ruta(torreWayne, municipalidadGotica, 1).
ruta(torreWayne, policiaGotica, 1).
ruta(torreWayne, mercadoGotica, 1).
ruta(torreWayne, estatuaSuperman, 5).      %connexi�n con metr�poli
ruta(torreWayne, aeropuertoMetropoli, 5).  %conexi�n con metr�poli
ruta(torreWayne, gasolineraMetropoli, 5).  %conexi�n con metr�poli

/*Pol�cia de G�tica -> */
ruta(policiaGotica, bomberosGotica, 3).
ruta(policiaGotica, hospitalGotica, 2).
ruta(policiaGotica, refugio, 2).
ruta(policiaGotica, torreWayne, 1).
ruta(policiaGotica, municipalidadGotica, 2).
ruta(policiaGotica, gasolineraMetropoli, 4). %conexi�n con metr�poli

/*Hospital General G�tica*/
ruta(hospitalGotica, bomberosGotica, 1).
ruta(hospitalGotica, policiaGotica, 2).
ruta(hospitalGotica, refugio, 2).
ruta(hospitalGotica, municipalidadGotica, 2).

/**Metr�poli**/

/*Lex Corporatiom -> */
ruta(lexCorp, elPlaneta, 3).
ruta(lexCorp, gasolineraMetropoli, 2).

/*Gasolinera Metropoli -> */
ruta(gasolineraMetropoli, lexCorp, 2).
ruta(gasolineraMetropoli, elPlaneta, 2).
ruta(gasolineraMetropoli, estatuaSuperman, 2).
ruta(gasolineraMetropoli,  aeoropuertoMetropoli, 2).
ruta(gasolineraMetropoli, policiaGotica, 4).           %conexi�n con gotica

/*El Planeta -> */
ruta(elPlaneta, gasolineraMetropoli, 2).
ruta(elPlaneta, estatuaSuperman, 2).
ruta(elPlaneta, centroMilitar, 2).
ruta(elPlaneta, lexCorp, 3).
ruta(elPlaneta, tribunalesJusticia, 2).

/*Centro Militar -> */
ruta(centroMilitar, naveZod, 3).
ruta(centroMilitar, elPlaneta, 2).
ruta(centroMilitar, tribunalesJustica, 2).

/*Nave del General Zod - >*/
ruta(naveZod, centroMilitar, 3).

/* Tribunales de Justicia de Metr�polis -> */
ruta(tribunalesJustica, centroMilitar , 2).
ruta(tribunalesJustica, elPlaneta , 2).
ruta(tribunalesJustica, estatuaSuperman, 2).
ruta(tribunalesJustica, municipalidadMetropoli, 3).
ruta(tribunalesJustica, hospitalMetropoli, 4).

/*Municipalidad de Metr�polis -> */
ruta(municipalidadMetropoli, elPlaneta, 3).
ruta(municipalidadMetropoli, estatuaSuperman, 3).
ruta(municipalidadMetropoli, tribunalesJustica, 3).
ruta(municipalidadMetropoli, policiaMetropoli, 4).
ruta(municipalidadMetropoli, hospitalMetropoli, 2).

/*Aeropuerto General de Metr�poli -> */
ruta(aeropuertoMetropoli, policiaMetropoli, 3).
ruta(aeropuertoMetropoli, bomberosMetropoli, 4).
ruta(aeropuertoMetropoli, gasolineraMetropoli, 2).
ruta(aeropuertoMetropoli, estatuaSuperman, 2).
ruta(aeropuertoMetropoli, torreWayne, 5).            %conexi�n con g�tica

/*Hospital General de Metr�poli -> */
ruta(hospitalMetropoli, policiaMetropoli, 2).
ruta(hospitalMetropoli, tribunalesJusticia, 4).
ruta(hospitalMetropoli, muncipalidadMetropoli, 2).
ruta(hospitalMetropoli, bomberosMetropoli, 6).

/*Pol�cia de Metr�poli -> */
ruta(policiaMetropoli, bomberosMetropoli, 3).
ruta(policiaMetropoli, aeropuertoMetropoli, 3).
ruta(policiaMetropoli, municipalidadMetropoli, 2).
ruta(policiaMetropoli, hospoitalMetropoli, 2).

/*Bomberos de Metr�poli -> */
ruta(bomberosMetropoli, hospitalMetropoli, 6).
ruta(bomberosMetropoli, policiaMetropoli, 3).
ruta(bomberosMetropoli, aeropuertoMetropoli, 4).

/*Estatua de Superman -> */
ruta(estatuaSuperman, tribunalesJusticia, 2).
ruta(estatuaSuperman, municipalidadMetropoli, 3).
ruta(estatuaSuperman, aeropuertoMetropoli, 2).
ruta(estatuaSuperman, gasolineraMetropoli, 2).
ruta(estatuaSuperman, torrwWayne, 5).                %conexi�n con g�tica
ruta(estatuaSuperman, elPlaneta, 2).


/***Declaraci�n de las Funciones/Reglas.***/


/*
 * camino(+From,+To,+Distance)
 */
camino(Inicio,Fin,Dist) :- ruta(Fin,Inicio,Dist).


/*
 * camino(+From,+To,+Distance)
 *
 * Si la ruta < ruta en la lista? remplazo
 * nodo en la lista [H|_].
 */
camino(Inicio,Fin,Dist) :- ruta(Inicio,Fin,Dist).

/*
 * caminoMasCorto(+[H|Path],+Dis)
 */
caminoMasCorto([H|Ruta], Dist) :-
	rpath([H|T], D), !, Dist < D,
	retract(rpath([H|_],_)),
	assert(rpath([H|Ruta], Dist)).

/*
 * caminoMasCorto(+Path,+Dist)
 *
 * Si no encuentra ruta, busca
 * una nueva ruta m�s corta.
 */
caminoMasCorto(Ruta, Dist) :-
	assert(rpath(Ruta,Dist)).

/*
 * recorrer(+From,+Path,+Dist)
 *
 * Revisa todos los nodos vecinos
 * por cada visitado actualiza la
 * ruta m�s corta y su respectiva
 * distancia, el mejor vecino es
 * escogido para la ruta.
 */
recorrer(Inicio, Ruta, Dist) :-
	camino(Inicio, T, D),
	not(memberchk(T, Ruta)),
	caminoMasCorto([T,Inicio|Ruta], Dist+D),
	recorrer(T,[Inicio|Ruta],Dist+D).

/*
 * recorrer(+Inicio)
 *
 * Elimina soluciones que no sirve
 * recorre desde el inicio.
 */
recorrer(Inicio) :-
	retractall(rpath(_,_)),
	recorrer(Inicio,[],0).

/*
 * recorrer(_).
 */
recorrer(_).

/*
 * dijkstraDistancia(+Inicio,+Fin)
 *
 * Encuentra todas las distancias,
 * si encuentra el punto de fin
 * elabora el camino con la menor
 * distancia y reporta los nodos
 * a recorrer con su respectivo
 * peso.
 *
 */
dijkstraDistancia(Inicio, Fin) :-
	recorrer(Inicio),
	rpath([Fin|RRuta], Dist)->
	  reverse([Fin|RRuta], Ruta),
	  Distancia is round(Dist),
	  writef('La ruta m�s corta a recorrer es: %w, con una distancia de: %w = %w\n',
	       [Ruta, Dist, Distancia]);
	writef('Error, no existe una ruta de %w a %w\n', [Inicio, Fin]).



/*
 * bloquearRuta(+X,+Y,+Z)
 *
 * Elimina una ruta de la base
 * de datos. Como las rutas son
 * no dirigidas, elimina la ruta
 * o la v�a en ambos sentidos.
 */
bloquearRuta(X,Y,Z):-
	retract(ruta(X,Y,Z)),
	retract(ruta(Y,X,Z)).


/*
 * abrirRuta(+X,+Y,+Z)
 *
 * Crea una ruta de la base
 * de datos. Como las rutas son
 * no dirigidas, crea la ruta
 * o la v�a en ambos sentidos, con
 * un peso dado, que puese ser
 * el mismo que el anterior o
 * uno completamente nuevo.
 */

abrirRuta(X,Y,Z):-
	asserta(ruta(X,Y,Z)),
	asserta(ruta(Y,X,Z)).




