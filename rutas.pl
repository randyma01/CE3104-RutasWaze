/*
Proyecto:
          Rutas

Autores:  Gustavo Fallas
          Ricardo Chang
          Randy Martínez

Contenidos:
          1. Declaración de los hechos (con sus respectivos predicados).
          2. Declaración de Funciones/Reglas.

Uso:
          Para interctuar con el programa Rutas es necesario tener
          algún compilador del lenguaje Prolog (SWI-Prolog o GNU-Prolog,
          son recomendados). Una vez abierto, se debe consultar el
          archivo "rutas.pl" para interactuar con el programa.

Notas:
          El porgama Rutas esta basado en las cuidades de Gótica y
          Metrópolis resprectivamente.

*/



/***Declaración de los hechos: ruta(a,b,peso).***/

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
ruta(mercado, libreriaGotica, 3).
ruta(mercado, restauranteGotica, 3).
ruta(mercado, torreWayne, 1).
ruta(mercado, municipalidadGotica, 4).

/*Torre Wayne de Gótica -> */
ruta(torreWayne, municipalidadGotica, 1).
ruta(torreWayne, policiaGotica, 1).
ruta(torreWayne, mercadoGotica, 1).

/*Polícia de Gótica -> */
ruta(policiaGotica, bomberosGotica, 3).
ruta(policiaGotica, hospitalGotica, 2).
ruta(policiaGotica, refugio, 2).
ruta(policiaGotica, torreWayne, 1).
ruta(policiaGotica, municipalidadGotica, 2).

/*Hospital General Gótica*/
ruta(hospitalGotica, bomberosGotica, 1).
ruta(hospitalGotica, policiaGotica, 2).
ruta(hospitalGotica, refugio, 2).
ruta(hospitalGotica, municipalidadGotica, 2).

/**Metrópoli**/

/*Lex Corporatiom -> */
ruta(lexCorp, elPlaneta, 3).
ruta(lexCorp, gasolineraMetropoli, 2).

/*Gasolinera Metropoli -> */
ruta(gasolineraMetropoli, lexCorp, 2).
ruta(gasolineraMetropoli, elPlaneta, 2).
ruta(gasolineraMetropoli, estatuaSuperman, 3).
ruta(gasolineraMetropoli,  aeoropuertoMetropoli, 2).

/*El Planeta -> */
ruta(elPlaneta, gasolineraMetropoli, 2).
ruta(elPlaneta, estatuaSuperman, 2).
ruta(elPlaneta, centroMilitar, 2).
ruta(elPlaneta, lexCorp, 3).
ruta(elPlaneta, tribunalesJusticia, 3).

/*Centro Militar -> */
ruta(centroMilitar, naveZod, 3).
ruta(centroMilitar, elPlaneta, 2).
ruta(centroMilitar, tribunalesJustica, 2).

/*Nave del General Zod - >*/
ruta(naveZod, centroMilitar, 3).

/* Tribunales de Justicia de Metrópolis -> */
ruta(tribunalesJustica, centroMilitar , 2).
ruta(tribunalesJustica, elPlaneta , 4).
ruta(tribunalesJustica, estatuaSuperman, 4).
ruta(tribunalesJustica, municipalidadMetropoli, 3).
ruta(tribunalesJustica, hospitalMetropoli,4).

/*Municipalidad de Metrópolis -> */
ruta(municipalidadMetropoli, elPlaneta, 5).
ruta(municipalidadMetropoli, estatuaSuperman, 5).
ruta(municipalidadMetropoli, tribunalesJustica, 3).
ruta(municipalidadMetropoli, policiaMetropoli, 4).
ruta(municipalidadMetropoli, hospitalMetropoli, 2).

/*Aeropuerto General de Metrópoli -> */
ruta(aeropuertoMetropoli, policiaMetropoli, 2).
ruta(aeropuertoMetropoli, bomberosMetropoli, 4).
ruta(aeropuertoMetropoli, gasolineraMetropoli, 2).
ruta(aeropuertoMetropoli, estatuaSuperman, 2).

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

