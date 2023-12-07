# Final-Project Laliga-Analitics

![portada](https://github.com/josegzr/Laliga-Analitics/blob/main/img/logo%20de%20la%20liga.jpg)

## Índice

1. [Descripción del proyecto](#descripción)
2. [Extracción](#extracción)
3. [Método de creación de Base de datos](#Basededatos)
4. [Visualización](#visualizacion)
5. [Conclusión](#conclusión)

<a name="descripción"/>

## Descripción del proyecto
En este proyecto con herramientas como python he conseguido las estadísticas de la liga de futbol española de la temporada 2022/2023, algunas de estas estadísticas son: la clasificación, los resultados de cada partido y los jugadores de cada equipo con sus propias estadísticas. He metido todos los datos en una base de datos de SQL llamada laliganalitics y he creado las relaciones que tienen entre sí. Por último, con la herramienta de visualización PowerBI he visualizado los datos para poder analizarlos.

### Objetivo:
El objetivo de este proyecto es analizar las estadísticas que he obtenido de cada equipo e sacar conclusiones de porque cada equipo quedo ese lugar en la tabla de clasificación.

<a name="extracción"/>

## Extracción
Para empezar, busqué varias páginas web de futbol poder sacar las estadísticas y al final di con la página web el mundo deportivo. De esta página conseguí sacar tres tablas:

Estas son las primeras 5 líneas y sus columnas de la tabla clasificación:

</details>

<details>
<summary>https://www.mundodeportivo.com/resultados/futbol/laliga/clasificacion/2022-2023</summary>
<br>

 ![profootballreference](https://github.com/josegzr/Laliga-Analitics/blob/main/img/tabla%20de%20clasificacion.png)

Estas son las primeras 5 líneas y sus columnas de la tabla jugadores:

 </details>

<details>
<summary>https://www.mundodeportivo.com/resultados/futbol/laliga/equipos/2022-2023</summary>
<br>

 ![profootballreference](https://github.com/josegzr/Laliga-Analitics/blob/main/img/jugadores.png)

 Estas son las primeras 5 líneas y sus columnas de la tabla resultados:

 </details>

<details>
<summary>https://www.mundodeportivo.com/resultados/futbol/laliga/equipos/2022-2023</summary>
<br>

 ![profootballreference](https://github.com/josegzr/Laliga-Analitics/blob/main/img/resultados.png)

</details>


**Proceso de extracción**
La extracción se hizo toda a través de python con el método de web scraping y la libreria de selenium

**Proceso de transformación**
En cuanto a la transformación no tuve que hacer mucho par de cambios en los nombres de columnas eliminar unos cuantos duplicados en la tabla de jugadores y añadir unas columnas en la tabla de resultados para identificar a los equipos y saber quién había ganado según el resultado que habían obtenido.

<a name="Basededatos"/>

## Método de creación de Base de datos

<details>

<summary>Código SQL </summary>

<br>

create database LaligaAnalitics;
use LaligaAnalitics;

CREATE TABLE clasificacion (
    ID_equipo INT PRIMARY KEY,
    Equipo VARCHAR(255),
    partidos_jugados INT,
    partidos_ganados INT,
    partidos_empatados INT,
    partidos_perdidos INT,
    goles_a_favor INT,
    goles_en_contra INT,
    total_puntos INT
);

CREATE TABLE resultados (
    Jornada INT PRIMARY KEY,
    fecha datetime,
    Equipo_local varchar(255),
    ID_equipo_local INT,
    Goles_del_Equipo_Local INT,
    Equipo_visitante varchar(255),
    ID_equipo_visitante INT,
    Goles_del_Equipo_Visitante INT,
    Resultado_Local varchar(255),
    Resultado_Visitante varchar(255),
    FOREIGN KEY (ID_equipo_local) REFERENCES clasificacion(ID_equipo),
    FOREIGN KEY (ID_equipo_visitante) REFERENCES clasificacion(ID_equipo)
);

CREATE TABLE jugadores (
    Nombre_jugador varchar(255) PRIMARY KEY,
    Dorsal varchar(255),
    Posicion varchar(255),
    Equipo varchar(255),
    ID_equipo INT,
    goles_marcados INT,
    asistencias INT,
    goles_recibidos INT,
    paradas INT,
    tarjetas_amarillas INT,
    tarjetas_rojas INT,
    FOREIGN KEY (ID_equipo) REFERENCES clasificacion(ID_equipo)
);

</details>

<details>
<summary>ERD</summary>

<br>

![EERD_manual](https://github.com/josegzr/Laliga-Analitics/blob/main/img/ERD.png)
<details>

<a name="visualizacion"/>

## Visualización

## Primera pagina

<details>
<summary>Primera página</summary>
<br>

 ![profootballreference](https://github.com/josegzr/Laliga-Analitics/blob/main/img/Primera%20pagina.png)


**Análisis de la primera pagina:**
En esta primera tabla podemos ver la clasificación y unas graficas de las tarjetas amarillas y rojas por equipos.
He querido comparar a los dos últimos equipos con los dos primeros por si había algún tipo de relación en la clasificación y
en estos dos casos se puede ver que claramente que los dos primeros equipos en la clasificación hicieron menos faltas que merecieran las tarjetas lo que podría llevar a la conclusión de que los equipos que se centran menos en hacer faltas podrían tener una ventaja a la hora de ganar los partidos y sobre todo ir sumando puntos.
Aunque tenemos equipos con los que hay esta conclusión no valdría como son el atlético de Madrid y el Betis. He identificado tres grupos a los que he llamado:
los rompe piernas y con los que hay que tener cuidado si juegas contra ellos que son los primeros 6 de la gráfica de tarjetas rojas, los conservadores que son los siguientes 8 con los que no te puedes fiar de que no te rompan una pierna y por ultimo los pacíficos, los 6 últimos, con los que puedes ir tranquilo por el campo de futbol, pero cuidado que puede haber sorpresas.

</details>

## Segunda pagina

<details>
<summary>Segunda página</summary>
<br>

 ![profootballreference](https://github.com/josegzr/Laliga-Analitics/blob/main/img/segunda%20pagina.png)


 **Análisis de la segunda pagina:**
En este segundo dasboard he querido analizar por posición, que posiciones tienen un porcentaje más alto de recibir tarjetas amarillas y tarjetas rojas.
las conclusiones son bastante obvias pero que hay que verlas, en cuanto a las tarjetas amarillas los mediocentros tienen un porcentaje
más alto ya que es donde se juega la mayor parte del tiempo y donde se intentan cometer las faltas, seguidos de ellos van los defensas, luego los delanteros y por
ultimo los porteros. En cuanto a las tarjetas rojas los defensas claramente tienen el porcentaje más alto seguidos de los mediocentros, después los delanteros y por último 1 portero del atlético de Madrid.

</details>

## Tercera pagina

<details>
<summary>Tercera página</summary>
<br>

 ![profootballreference](https://github.com/josegzr/Laliga-Analitics/blob/main/img/tercera%20pagina.png)


 **Análisis de la tercera página:**
En este tercer dasboard he querido analizar varias estadísticas por equipo, las primeras tablas que analizaremos son las de goles a favor y la de los goles en contra podemos ver como el elche siendo el último en la tabla tiene el menor número de goles a favor y el segundo mayor número de goles en contra por lo que conllevo a quedar último, luego tenemos el caso del Espanyol que en cuanto a goles a favor esta de mitad de la tabla para arriba pero en los goles en contra tiene el mayor número de goles por lo que le llevo a quedar antepenúltimo. Por otro lado, tenemos al barsa que no fue el equipo más goleador del año, pero si fue el equipo menos goleado por lo que le llevo a ganar la liga y sumar puntos partido a partido. Por último, he querido analizar las paradas de los porteros de cada equipo ya que muchas veces se le hecha toda la culpa al portero y he analizado dos equipos en concreto el Espanyol y el elche, en el caso del Espanyol claramente comparándolo con otros equipos si tiene bastante culpa los porteros, pero en el caso del elche podemos ver como los porteros tienen el segundo mejor porcentaje del total de las paradas por lo que lo que deberían es centrase más en defender y atacar.

</details>

## Cuarta página

<details>
<summary>Cuarta página</summary>
<br>

 ![profootballreference](https://github.com/josegzr/Laliga-Analitics/blob/main/img/cuarta%20pagina.png)


 **Análisis de la cuarta página:**
Por último, tenemos la página más obvia en cuanto a porque cada equipo quedo en la posición de la clasificación. En estos gráficos nos fijamos en los mismos equipos el Elche y el Barcelona. El Elche como local solo pudo ganar a tres equipos y empatar a 6 dejándoles moralmente bastante caídos y lo que nunca ayuda es a la afición en contra en muchas de las ocasiones. Podrían haber remontado como visitante pero solo pudo ganar a 2 equipos y empatar contra 4 lo que le llevo a tener las peores estadísticas de la temporada y dejarle en último lugar. Por el otro lado está el Barcelona que quedo primero el año pasado, consiguiendo 1 derrota y 3 empates como local, empeoro sus estadísticas como visitante teniendo 5 derrotas y 1 empate, pero llevándose las mejores estadísticas de resultados de toda la liga.

</details>

## Quinta página

<details>
<summary>Quinta página</summary>
<br>

 ![profootballreference](https://github.com/josegzr/Laliga-Analitics/blob/main/img/quinta%20pagina.png)


 **Análisis de la cuarta pagina:**
Esta página esta para que se vea por meses los resultados de los equipos cuando eran locales.

</details>

## Sexta página

<details>
<summary>Sexta página</summary>
<br>

 ![profootballreference](https://github.com/josegzr/Laliga-Analitics/blob/main/img/sexta%20pagina.png)


 **Análisis de la cuarta página:**
Esta página esta para que se vea por meses los resultados de los equipos cuando eran visitantes.

</details>

<a name="conclusión"/>

### Conclusión
En cuanto a las estadísticas de las tarjetas se veía clara la diferencia de los dos primeros a los dos últimos pero pasado esos 4 equipos ya no había una estructura clara en relación con la clasificación. En cuanto a los goles a favor y en contra ya vemos más claro que los equipos más goleados y que no tuviesen un alto número de goles a favor eran los equipos más bajos en la clasificación y por último y más obvio quienes no pudieron ganar partidos fueron los que descendieron la temporada pasada
