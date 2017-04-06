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
