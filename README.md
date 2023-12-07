# Final-Project Laliga-Analitics

![portada](https://github.com/josegzr/Laliga-Analitics/blob/main/img/logo%20de%20la%20liga.jpg)

## Índice



## Descripción del proyecto
En este proyecto con herramietas como python he conseeguido las estadisticas de la liga de futbol Española de la temporada 2022/2023, agunas de estas estadisticas son: la clasificacion, los resultados de cada partido y los jugadores de cada equipo con sus propias estadisticas. He metido todos los datos en una base de datos de SQl llamada laliganalitics y he creado las relaciones que tienen entre si. Por ultimo con la herramienta de visualizacion PowerBI he visulaizado los datos para poder analizarlos.

### Objetivo:
El objetivo de este proyecto es analizar las estadisticas que he obtenido de cada equipo e sacar conclusiones de porque cada equipo quedo ese lugar en la tabla de clasificacion.

## Extraccion
Para empezar busque varias paginas web de futbol poder sacar las estadisticas y al final di con la pagina web el mundo deportivo. De esta pagina consegui sacar tres tablas:

Estas son las primeras 5 lineas y sus columnas de la tabla clasificacion:

</details>

<details>
<summary>https://www.mundodeportivo.com/resultados/futbol/laliga/clasificacion/2022-2023</summary>
<br>

 ![profootballreference](https://github.com/josegzr/Laliga-Analitics/blob/main/img/tabla%20de%20clasificacion.png)

Estas son las primeras 5 lineas y sus columnas de la tabla jugadores:

 </details>

<details>
<summary>https://www.mundodeportivo.com/resultados/futbol/laliga/equipos/2022-2023</summary>
<br>

 ![profootballreference](https://github.com/josegzr/Laliga-Analitics/blob/main/img/jugadores.png)

 Estas son las primeras 5 lineas y sus columnas de la tabla resultados:

 </details>

<details>
<summary>https://www.mundodeportivo.com/resultados/futbol/laliga/equipos/2022-2023</summary>
<br>

 ![profootballreference](https://github.com/josegzr/Laliga-Analitics/blob/main/img/resultados.png)
<details>

**Proceso de extracción**
La extraccion se hizo toda atraves de python con el metodo de web scraping y la libreria de selenium

**Proceso de transformacion**
En cuanto a la transformacion no tuve que hacer mucho par de cambios en los nombres de columnas eliminar unos cuantos duplicados en la tabla de jugadores y añadir unas columnas en la tabla de resultados para identificar a los equipos y saber quien habia ganado segun el resultado que habian obtenido.

## Metodo de creacion de Base de datos

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




