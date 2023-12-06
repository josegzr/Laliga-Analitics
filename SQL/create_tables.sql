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
    