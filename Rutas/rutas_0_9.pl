/*
 *Proyecto:
           Rutas

 *Autores:
           Gustavo Fallas
           Ricardo Chang
           Randy Martínez

 *Contenidos:
           1. Declaraciones de validaciones necesarias.
	   2. Declaración de las Funciones/Reglas.
           3. Declaración de los hechos (con sus respectivos
	      predicados).

 *Uso:
           Para interctuar con el programa Rutas es necesario tener
           algún compilador del lenguaje Prolog (SWI-Prolog o
	   GNU-Prolog, son recomendados). Una vez abierto, se debe
	   consultar el archivo "rutas.pl" para interactuar con el
	   programa.

 *Notas:
           1. El porgama Rutas esta basado en las cuidades de Gótica y
              Metrópolis resprectivamente.
           2. El siguiente código del Algortimo de Dijkstra fue tomado c
              de la página
	      https://rosettacode.org/wiki/Dijkstra%27s_algorithm#Prolog
	      y usado como base para el programa de Rutas. Este mismo fue
	      modificado ajustado a los requerimientos.
*/


/*** 1. Declaraciones	de validaciones necesarias.***/
:-dynamic
	rpath/2.
:- dynamic(ruta/3).   % hacer modificaciones a la base de datos


/*** 2. Declaración de las Funciones/Reglas.***/


/*
 * camino(+From,+To,+Distance)
 *
 * Verifica que exista un arco,
 * arista o camino entre dos puntos
 * del grafo.
 */
camino(Inicio,Fin,Dist) :- ruta(Fin,Inicio,Dist).


/*
 * camino(+From,+To,+Distance)
 *
 * Verifica que un arco, camino
 * o via dentro del grafo tenga
 * su equivalente en la dirrección
 * opuesta.
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
 * una nueva ruta más corta.
 */
caminoMasCorto(Ruta, Dist) :-
	assert(rpath(Ruta,Dist)).

/*
 * recorrer(+From,+Path,+Dist)
 *
 * Revisa todos los nodos vecinos
 * por cada visitado actualiza la
 * ruta más corta y su respectiva
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
	  writef('La ruta más corta a recorrer es: %w, con una distancia de: %w = %w\n',
	       [Ruta, Dist, Distancia]);
	writef('Error, no existe una ruta de %w a %w\n', [Inicio, Fin]).


demorando(Inicio,Fin,Tiem) :- tiempo(Fin,Inicio,Tiem).

demorando(Inicio,Fin,Tiem) :- tiempo(Inicio,Fin,Tiem).


menorTiempo([H|Ruta], Tiem) :-
	rpath([H|T], Ti), !, Tiem < Ti,
	retract(rpath([H|_],_)),
	assert(rpath([H|Ruta], Tiem)).

menorTiempo(Ruta, Tiem) :-
	assert(rpath(Ruta,Tiem)).


recorrerPorTiempo(Inicio, Ruta, Tiem) :-
	demorando(Inicio, T, Ti),
	not(memberchk(T, Ruta)),
	menorTiempo([T,Inicio|Ruta], Tiem+Ti),
	recorrerPorTiempo(T,[Inicio|Ruta],Tiem+Ti).

recorrerPorTiempo(Inicio) :-
	retractall(rpath(_,_)),
	recorrerPorTiempo(Inicio,[],0).

recorrerPorTiempo(_).


dijkstraTiempo(Inicio, Fin) :-
	recorrerPorTiempo(Inicio),
	rpath([Fin|RRuta], Tiem)->
	  reverse([Fin|RRuta], Ruta),
	  Tiempo is round(Tiem),
	  writef('La ruta más corta a recorrer es: %w, con una distancia de: %w = %w\n',
	       [Ruta, Tiem, Tiempo]);
	writef('Error, no existe una ruta de %w a %w\n', [Inicio, Fin]).

/*
 * bloquearRuta(+X,+Y,+Z)
 *
 * Elimina una ruta de la base
 * de datos. Como las rutas son
 * no dirigidas, elimina la ruta
 * o la vía en ambos sentidos.
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
 * o la vía en ambos sentidos, con
 * un peso dado, que puese ser
 * el mismo que el anterior o
 * uno completamente nuevo.
 */

abrirRuta(X,Y,Z):-
	asserta(ruta(X,Y,Z)),
	asserta(ruta(Y,X,Z)).


/*
 * puntosVecinos(+X)
 *
 * Muestra como un punto
 * (x,y) los puntos vecinos
 * o adyacentes de interés.
 */
puntosVecinos(X):-
    ruta(X,Y,Z),
    ruta(Y,X,Z),
    append([X],[Y],R),
    write(R).


/*** 3.1 Declaración de los hechos: ruta(a,b,peso).***/

/**Gótica**/

/*Baticuea ->*/
ruta(baticueva, mansionWayne, 1).

/*Mansión Wayne -> */
ruta(mansionWayne, baticueva, 1).
ruta(mansionWayne, escuelaGotica, 4).
ruta(mansionWayne, bomberosGotica, 2).
ruta(mansionWayne, refugio, 3).

/*Bomberos de Gótica -> */
ruta(bomberosGotica, hospitalGotica, 1).
ruta(bomberosGotica, mansionWayne, 2).
ruta(bomberosGotica, policiaGotica,3).

/*Escuela de Gótica -> */
ruta(escuelaGotica, mansionWayne, 4).
ruta(escuelaGotica, libreriaGotica, 3).
ruta(escuelaGotica, municipalidadGotica, 2).
ruta(escuelaGotica, refugio, 2).

/*Refugio o Centro de Refugiados de Gótica -> */
ruta(refufio, escuelaGotica, 2).
ruta(refugio, libreriaGotica, 3).
ruta(refugio, municipalidadGotica, 2).
ruta(refugio, policiaGotica, 2).
ruta(refugio, hospitalGotica, 2).
ruta(refugio, mansionWayne, 3).

/*Municipalidad de Gótica -> */
ruta(municipalidadGotica, escuelaGotica, 2).
ruta(municipalidadGotica, libreriaGotica, 3).
ruta(municipalidadGotica, torreWayne, 1).
ruta(municipalidadGotica, mercadoGotica, 4).
ruta(municipalidadGotica, refugio, 2).
ruta(municipalidadGotica, restauranteGotica, 3).
ruta(municipalidadGotica, policiaGotica, 2).
ruta(municipalidadGotica, hospitalGotica, 2).

/*Librería de Gótica -> */
ruta(libreriaGotica, escuelaGotica, 3).
ruta(libreriaGotica, refugio, 3).
ruta(libreriaGotica, municipalidadGotica, 3).
ruta(libreriaGotica, restaurantelGotica, 2).
ruta(libreriaGotica, mercadoGotica, 3).

/*Restaurante de Gótica -> */
ruta(restauranteGotica, libreriaGotica, 2).
ruta(restauranteGotica, municipalidadGotica, 3).
ruta(restauranteGotica, mercadoGotica, 3).

/*Bolsa de Valores o Mercado de Gótica*/
ruta(mercadoGotica, libreriaGotica, 3).
ruta(mercadoGotica, restauranteGotica, 3).
ruta(mercadoGotica, torreWayne, 1).
ruta(mercadoGotica, municipalidadGotica, 4).

/*Torre Wayne de Gótica -> */
ruta(torreWayne, municipalidadGotica, 1).
ruta(torreWayne, policiaGotica, 1).
ruta(torreWayne, mercadoGotica, 1).
ruta(torreWayne, estatuaSuperman, 5).      %connexión con metrópoli
ruta(torreWayne, aeropuertoMetropoli, 5).  %conexión con metrópoli
ruta(torreWayne, gasolineraMetropoli, 5).  %conexión con metrópoli

/*Polícia de Gótica -> */
ruta(policiaGotica, bomberosGotica, 3).
ruta(policiaGotica, hospitalGotica, 2).
ruta(policiaGotica, refugio, 2).
ruta(policiaGotica, torreWayne, 1).
ruta(policiaGotica, municipalidadGotica, 2).
ruta(policiaGotica, gasolineraMetropoli, 4). %conexión con metrópoli

/*Hospital General Gótica*/
ruta(hospitalGotica, bomberosGotica, 1).
ruta(hospitalGotica, policiaGotica, 2).
ruta(hospitalGotica, refugio, 2).
ruta(hospitalGotica, municipalidadGotica, 2).

/**Metrópoli**/

/*Lex Corporation -> */
ruta(lexCorp, elPlaneta, 3).
ruta(lexCorp, gasolineraMetropoli, 2).

/*Gasolinera Metropoli -> */
ruta(gasolineraMetropoli, lexCorp, 2).
ruta(gasolineraMetropoli, elPlaneta, 2).
ruta(gasolineraMetropoli, estatuaSuperman, 2).
ruta(gasolineraMetropoli,  aeoropuertoMetropoli, 2).
ruta(gasolineraMetropoli, policiaGotica, 4).           %conexión con gotica

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

/* Tribunales de Justicia de Metrópolis -> */
ruta(tribunalesJustica, centroMilitar , 2).
ruta(tribunalesJustica, elPlaneta , 2).
ruta(tribunalesJustica, estatuaSuperman, 2).
ruta(tribunalesJustica, municipalidadMetropoli, 3).
ruta(tribunalesJustica, hospitalMetropoli, 4).

/*Municipalidad de Metrópolis -> */
ruta(municipalidadMetropoli, elPlaneta, 3).
ruta(municipalidadMetropoli, estatuaSuperman, 3).
ruta(municipalidadMetropoli, tribunalesJustica, 3).
ruta(municipalidadMetropoli, policiaMetropoli, 4).
ruta(municipalidadMetropoli, hospitalMetropoli, 2).

/*Aeropuerto General de Metrópoli -> */
ruta(aeropuertoMetropoli, policiaMetropoli, 3).
ruta(aeropuertoMetropoli, bomberosMetropoli, 4).
ruta(aeropuertoMetropoli, gasolineraMetropoli, 2).
ruta(aeropuertoMetropoli, estatuaSuperman, 2).
ruta(aeropuertoMetropoli, torreWayne, 5).            %conexión con gótica

/*Hospital General de Metrópoli -> */
ruta(hospitalMetropoli, policiaMetropoli, 2).
ruta(hospitalMetropoli, tribunalesJusticia, 4).
ruta(hospitalMetropoli, muncipalidadMetropoli, 2).
ruta(hospitalMetropoli, bomberosMetropoli, 6).

/*Polícia de Metrópoli -> */
ruta(policiaMetropoli, bomberosMetropoli, 3).
ruta(policiaMetropoli, aeropuertoMetropoli, 3).
ruta(policiaMetropoli, municipalidadMetropoli, 2).
ruta(policiaMetropoli, hospoitalMetropoli, 2).

/*Bomberos de Metrópoli -> */
ruta(bomberosMetropoli, hospitalMetropoli, 6).
ruta(bomberosMetropoli, policiaMetropoli, 3).
ruta(bomberosMetropoli, aeropuertoMetropoli, 4).

/*Estatua de Superman -> */
ruta(estatuaSuperman, tribunalesJusticia, 2).
ruta(estatuaSuperman, municipalidadMetropoli, 3).
ruta(estatuaSuperman, aeropuertoMetropoli, 2).
ruta(estatuaSuperman, gasolineraMetropoli, 2).
ruta(estatuaSuperman, torreWayne, 5).                %conexión con gótica
ruta(estatuaSuperman, elPlaneta, 2).


/*** 3.2 Declaración de los hechos: tiempo(a,b,peso).***/

/**Gótica**/

/*Baticuea ->*/
tiempo(baticueva, mansionWayne, 0).

/*Mansión Wayne -> */
tiempo(mansionWayne, baticueva, 0).
tiempo(mansionWayne, escuelaGotica, 15).
tiempo(mansionWayne, bomberosGotica, 15).
tiempo(mansionWayne, refugio, 20).

/*Bomberos de Gótica -> */
tiempo(bomberosGotica, hospitalGotica, 5).
tiempo(bomberosGotica, mansionWayne, 15).
tiempo(bomberosGotica, policiaGotica, 15).

/*Escuela de Gótica -> */
tiempo(escuelaGotica, mansionWayne, 15).
tiempo(escuelaGotica, libreriaGotica, 20).
tiempo(escuelaGotica, municipalidadGotica, 10).
tiempo(escuelaGotica, refugio, 10).

/*Refugio o Centro de Refugiados de Gótica -> */
tiempo(refufio, escuelaGotica, 10).
tiempo(refugio, libreriaGotica, 20).
tiempo(refugio, municipalidadGotica, 10).
tiempo(refugio, policiaGotica, 10).
tiempo(refugio, hospitalGotica, 10).
tiempo(refugio, mansionWayne, 20).

/*Municipalidad de Gótica -> */
tiempo(municipalidadGotica, escuelaGotica, 5).
tiempo(municipalidadGotica, libreriaGotica, 15).
tiempo(municipalidadGotica, torreWayne, 10).
tiempo(municipalidadGotica, mercadoGotica, 20).
tiempo(municipalidadGotica, refugio, 10).
tiempo(municipalidadGotica, restauranteGotica, 15).
tiempo(municipalidadGotica, policiaGotica, 10).
tiempo(municipalidadGotica, hospitalGotica, 10).

/*Librería de Gótica -> */
tiempo(libreriaGotica, escuelaGotica, 20).
tiempo(libreriaGotica, refugio, 15).
tiempo(libreriaGotica, municipalidadGotica, 15).
tiempo(libreriaGotica, restaurantelGotica, 10).
tiempo(libreriaGotica, mercadoGotica, 15).

/*Restaurante de Gótica -> */
tiempo(restauranteGotica, libreriaGotica, 10).
tiempo(restauranteGotica, municipalidadGotica, 20).
tiempo(restauranteGotica, mercadoGotica, 15).

/*Bolsa de Valores o Mercado de Gótica*/
tiempo(mercadoGotica, libreriaGotica, 15).
tiempo(mercadoGotica, restauranteGotica, 15).
tiempo(mercadoGotica, torreWayne, 5).
tiempo(mercadoGotica, municipalidadGotica, 20).

/*Torre Wayne de Gótica -> */
tiempo(torreWayne, municipalidadGotica, 10).
tiempo(torreWayne, policiaGotica, 5).
tiempo(torreWayne, mercadoGotica, 5).
tiempo(torreWayne, estatuaSuperman, 35).      % connexión con metrópoli
tiempo(torreWayne, aeropuertoMetropoli, 40).  % conexión con metrópoli
tiempo(torreWayne, gasolineraMetropoli, 35).  % conexión con metrópoli

/*Polícia de Gótica -> */
tiempo(policiaGotica, bomberosGotica, 15).
tiempo(policiaGotica, hospitalGotica, 10).
tiempo(policiaGotica, refugio, 10).
tiempo(policiaGotica, torreWayne, 5).
tiempo(policiaGotica, municipalidadGotica, 10).
tiempo(policiaGotica, gasolineraMetropoli, 40). % conexión con metrópoli

/*Hospital General Gótica*/
tiempo(hospitalGotica, bomberosGotica, 5).
tiempo(hospitalGotica, policiaGotica, 10).
tiempo(hospitalGotica, refugio, 10).
tiempo(hospitalGotica, municipalidadGotica, 10).

/**Metrópoli**/

/*Lex Corporation -> */
tiempo(lexCorp, elPlaneta, 20).
tiempo(lexCorp, gasolineraMetropoli, 15).

/*Gasolinera Metropoli -> */
tiempo(gasolineraMetropoli, lexCorp, 20).
tiempo(gasolineraMetropoli, elPlaneta, 15).
tiempo(gasolineraMetropoli, estatuaSuperman, 10).
tiempo(gasolineraMetropoli,  aeoropuertoMetropoli, 15).
tiempo(gasolineraMetropoli, policiaGotica, 40).           % conexión con gotica

/*El Planeta -> */
tiempo(elPlaneta, gasolineraMetropoli, 15).
tiempo(elPlaneta, estatuaSuperman, 15).
tiempo(elPlaneta, centroMilitar, 30).
tiempo(elPlaneta, lexCorp, 15).
tiempo(elPlaneta, tribunalesJusticia, 20).

/*Centro Militar -> */
tiempo(centroMilitar, naveZod, 15).
tiempo(centroMilitar, elPlaneta, 30).
tiempo(centroMilitar, tribunalesJustica, 15).

/*Nave del General Zod - >*/
tiempo(naveZod, centroMilitar, 15).

/* Tribunales de Justicia de Metrópolis -> */
tiempo(tribunalesJustica, centroMilitar , 15).
tiempo(tribunalesJustica, elPlaneta , 20).
tiempo(tribunalesJustica, estatuaSuperman, 15).
tiempo(tribunalesJustica, municipalidadMetropoli, 30).
tiempo(tribunalesJustica, hospitalMetropoli, 15).

/*Municipalidad de Metrópolis -> */
tiempo(municipalidadMetropoli, elPlaneta, 30).
tiempo(municipalidadMetropoli, estatuaSuperman, 25).
tiempo(municipalidadMetropoli, tribunalesJustica, 30).
tiempo(municipalidadMetropoli, policiaMetropoli, 10).
tiempo(municipalidadMetropoli, hospitalMetropoli, 5).

/*Aeropuerto General de Metrópoli -> */
tiempo(aeropuertoMetropoli, policiaMetropoli, 15).
tiempo(aeropuertoMetropoli, bomberosMetropoli, 15).
tiempo(aeropuertoMetropoli, gasolineraMetropoli, 15).
tiempo(aeropuertoMetropoli, estatuaSuperman, 15).
tiempo(aeropuertoMetropoli, torreWayne, 40).            % conexión con gótica

/*Hospital General de Metrópoli -> */
tiempo(hospitalMetropoli, policiaMetropoli, 5).
tiempo(hospitalMetropoli, tribunalesJusticia, 15).
tiempo(hospitalMetropoli, muncipalidadMetropoli, 5).
tiempo(hospitalMetropoli, bomberosMetropoli, 5).

/*Polícia de Metrópoli -> */
tiempo(policiaMetropoli, bomberosMetropoli, 10).
tiempo(policiaMetropoli, aeropuertoMetropoli, 15).
tiempo(policiaMetropoli, municipalidadMetropoli, 10).
tiempo(policiaMetropoli, hospoitalMetropoli, 5).

/*Bomberos de Metrópoli -> */
tiempo(bomberosMetropoli, hospitalMetropoli, 4).
tiempo(bomberosMetropoli, policiaMetropoli, 10).
tiempo(bomberosMetropoli, aeropuertoMetropoli, 15).

/*Estatua de Superman -> */
tiempo(estatuaSuperman, tribunalesJusticia, 15).
tiempo(estatuaSuperman, municipalidadMetropoli, 25).
tiempo(estatuaSuperman, aeropuertoMetropoli, 15).
tiempo(estatuaSuperman, gasolineraMetropoli, 10).
tiempo(estatuaSuperman, torreWayne, 45).                % conexión con gótica
tiempo(estatuaSuperman, elPlaneta, 15).