-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema laligaanalitics
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema laligaanalitics
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `laligaanalitics` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `laligaanalitics` ;

-- -----------------------------------------------------
-- Table `laligaanalitics`.`clasificacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laligaanalitics`.`clasificacion` (
  `ID_equipo` INT NOT NULL,
  `Equipo` VARCHAR(255) NULL DEFAULT NULL,
  `partidos_jugados` INT NULL DEFAULT NULL,
  `partidos_ganados` INT NULL DEFAULT NULL,
  `partidos_empatados` INT NULL DEFAULT NULL,
  `partidos_perdidos` INT NULL DEFAULT NULL,
  `goles_a_favor` INT NULL DEFAULT NULL,
  `goles_en_contra` INT NULL DEFAULT NULL,
  `total_puntos` INT NULL DEFAULT NULL,
  PRIMARY KEY (`ID_equipo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `laligaanalitics`.`jugadores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laligaanalitics`.`jugadores` (
  `Nombre_jugador` VARCHAR(255) NOT NULL,
  `Dorsal` VARCHAR(255) NULL DEFAULT NULL,
  `Posicion` VARCHAR(255) NULL DEFAULT NULL,
  `Equipo` VARCHAR(255) NULL DEFAULT NULL,
  `ID_equipo` INT NULL DEFAULT NULL,
  `goles_marcados` INT NULL DEFAULT NULL,
  `asistencias` INT NULL DEFAULT NULL,
  `goles_recibidos` INT NULL DEFAULT NULL,
  `paradas` INT NULL DEFAULT NULL,
  `tarjetas_amarillas` INT NULL DEFAULT NULL,
  `tarjetas_rojas` INT NULL DEFAULT NULL,
  PRIMARY KEY (`Nombre_jugador`),
  CONSTRAINT `jugadores_ibfk_1`
    FOREIGN KEY (`ID_equipo`)
    REFERENCES `laligaanalitics`.`clasificacion` (`ID_equipo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;




-- -----------------------------------------------------
-- Table `laligaanalitics`.`resultados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laligaanalitics`.`resultados` (
  `ID_partido` INT NOT NULL,
  `Jornada` INT NOT NULL,
  `fecha` DATETIME NULL DEFAULT NULL,
  `Equipo_local` VARCHAR(255) NULL DEFAULT NULL,
  `ID_equipo_local` INT NULL DEFAULT NULL,
  `Goles_del_Equipo_Local` INT NULL DEFAULT NULL,
  `Equipo_visitante` VARCHAR(255) NULL DEFAULT NULL,
  `ID_equipo_visitante` INT NULL DEFAULT NULL,
  `Goles_del_Equipo_Visitante` INT NULL DEFAULT NULL,
  `Resultado_Local` VARCHAR(255) NULL DEFAULT NULL,
  `Resultado_Visitante` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_partido`),
  CONSTRAINT `resultados_ibfk_1`
    FOREIGN KEY (`ID_equipo_local`)
    REFERENCES `laligaanalitics`.`clasificacion` (`ID_equipo`),
  CONSTRAINT `resultados_ibfk_2`
    FOREIGN KEY (`ID_equipo_visitante`)
    REFERENCES `laligaanalitics`.`clasificacion` (`ID_equipo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


