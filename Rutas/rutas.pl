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



/***Declaración de los hechos. Base de datos del los maapas.***/

/**Gotica**/

/*Baticuea ->*/
ruta(baticueva, mansionWayne).

/*Mansion Wayne -> */
ruta(mansionWayne, baticueva).
ruta(mansionWayne, escuelaGotica).
ruta(mansionWayne, bomberosGotica).
ruta(mansionWayne, refugio).

/*Bomberos de Gotica -> */
ruta(bomberosGotica, hospitalGotica).
ruta(bomberosGotica, mansionWayne).
ruta(bomberosGotica, policiaGotica).

/*Escuela de Gotica -> */
ruta(escuelaGotica, mansionWayne).
ruta(scuelaGotica, libreriaGotica).
ruta(escuelaGotica, mercadoGotica).
ruta(escuelaGotica, centroComercialGotica).
ruta(escuelaGotica, municipalidadGotica).
ruta(escuelaGotica, refugio).
ruta(escuelaGotica, torreWayne).

/*Refugio o Centro de Refugiados de Gotica -> */
ruta(refugio, mansionWayne).
ruta(refufio, escuelaGotica).
ruta(refugio, libreriaGotica).
ruta(refugio, municipalidadGotica).
ruta(refugio, torreWayne).
ruta(refugio, mercadoGotica).
ruta(refugio, policiaGotica).
ruta(refugio, hospitalGotica).

/*Municipalidad de Gotica -> */
ruta(municipalidadGotica, escuelaGotica).
ruta(municipalidadGotica, libreriaGotica).
ruta(municipalidadGotica, torreWayne).
ruta(municipalidadGotica, mercadoGotica).
ruta(municipalidadGotica, refugio).

/*Libreria de Gotica -> */
ruta(libreriaGotica, escuelaGotica ).
ruta(libreriaGotica, refugio).
ruta(libreriaGotica, municipalidadGotica).
ruta(libreriaGotica, centroComercialGotica).
ruta(libreriaGotica, mercadoGotica).
ruta(libreriaGotica, torreWayne).

/*Centro Comercial de Gotica -> */
ruta(centroComercialGotica, libreriaGotica).
ruta(centroComercialGotica, terminalTren).
ruta(centroComercialGotica, mercadoGotica).

/*Bolsa de Valores o Mercado de Gotica*/
ruta(mercado, libreriaGotica ).
ruta(mercado, escuelaGotica).
ruta(mercado, centroComercialGotica).
ruta(mercado, terminalTren).
ruta(mercado, torreWayne).
ruta(mercado, municipalidadGotica).
ruta(mercado, refugio).

/*Terminal Tren de Gotica -> */
ruta(terminalTren, centroComercialGotica).
ruta(terminalTren, mercadoGotica).

/*Torre Wayne de Gotica -> */
ruta(torreWayne, municipalidadGotica ).
ruta(torreWayne, escuelaGotica).
ruta(torreWayne, refugio).
ruta(torreWayne, libreriaGotica).
ruta(torreWayne, mercadoGotica).

/*Policia de Gotica -> */
ruta(policiaGotica, asiloArkham).
ruta(policiaGotica, bomberosGotica).
ruta(policiaGotica, hospitalGotica).
ruta(policiaGotica, refugio).
ruta(policiaGotica, torreWayne).

/*Asilo Arkham -> */
ruta(asiloArkham,policiaGotica).

/*Hospital General Gotica*/
ruta(hospitalGotica, bomberosGotica ).
ruta(hospitalGotica, policiaGotica).
ruta(hospitalGotica, refugio).




