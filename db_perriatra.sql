-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 12-05-2025 a las 10:18:31
-- Versión del servidor: 8.3.0
-- Versión de PHP: 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_perriatra`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mascota`
--

DROP TABLE IF EXISTS `mascota`;
CREATE TABLE IF NOT EXISTS `mascota` (
  `chip` int NOT NULL,
  `Nombre` varchar(25) NOT NULL,
  `Genere` varchar(1) NOT NULL,
  `Especie` varchar(3) NOT NULL,
  `Raza` int DEFAULT NULL,
  `Fecha_Nacimiento` date DEFAULT NULL,
  `Propietario` int DEFAULT NULL,
  `Vet` int DEFAULT NULL,
  PRIMARY KEY (`Chip`),
  KEY `mascota_raza_fk` (`Raza`),
  KEY `mascota_propietario_fk` (`Propietario`),
  KEY `mascota_vet_fk` (`Vet`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `mascota`
--

INSERT INTO `mascota` (`chip`, `Nombre`, `Genere`, `Especie`, `Raza`, `Fecha_Nacimiento`, `Propietario`, `Vet`) VALUES
(3301, 'DUC', 'M', 'per', 106, '2010-10-02', 44999222, 27),
(3302, 'IBIS', 'F', 'gat', 111, '2011-07-30', 44999222, 22),
(3303, 'FUFI', 'M', 'gat', 103, '2012-09-08', 44777333, 21),
(3304, 'BRU', 'M', 'gat', 112, '2011-12-09', 44666222, 27),
(3305, 'GINKGO', 'M', 'per', 104, '2010-10-10', 44666222, 23),
(3306, 'IBIS', 'F', 'per', 109, '2011-11-11', 44888999, 22),
(3307, 'GARFIEL', 'M', 'gat', 107, '2012-02-22', 44888999, 24),
(3308, 'KENZO', 'M', 'per', 101, '2010-04-27', 44222111, 24),
(3309, 'LEO', 'M', 'per', 109, '2011-03-18', 44999333, 25),
(3310, 'MANCHA', 'F', 'gat', 102, '2012-02-02', 44999333, 27),
(3311, 'ANOUK', 'M', 'gat', 103, '2010-07-07', 44666888, 26),
(3312, 'NUKA', 'F', 'gos', 104, '2011-01-07', 44666222, 23);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `propietario`
--

DROP TABLE IF EXISTS `propietario`;
CREATE TABLE IF NOT EXISTS `propietario` (
  `DNI` int NOT NULL,
  `Nombre` varchar(55) NOT NULL,
  `Direccion` text,
  `Telf` int NOT NULL,
  `Mail` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`DNI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `propietario`
--

INSERT INTO `propietario` (`DNI`, `Nombre`, `Direccion`, `Telf`, `Mail`) VALUES
(44999222, 'JAMES', 'BALMES 34', 666112233, 'james@mail.com'),
(44777333, 'WARD', 'SEGRE 9', 666778899, 'ward@mail.com'),
(44666222, 'FORD', 'AMPOSTA 58', 666554433, 'ford@mail.com'),
(44888999, 'SMITH', 'UNIO 98', 666115566, 'smith@mail.com'),
(44222111, 'SCOTT', 'FLORIDA 70', 666002244, 'scott@mail.com'),
(44999333, 'ADAMS', 'UNIVERSIDAD 2', 666996611, 'adams@mail.com'),
(44666888, 'MILLER', 'INDUSTRIA 104', 666662299, 'miller@mail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `raza`
--

DROP TABLE IF EXISTS `raza`;
CREATE TABLE IF NOT EXISTS `raza` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(25) NOT NULL,
  `Altura` int DEFAULT NULL,
  `Peso` int DEFAULT NULL,
  `Caracter` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `raza`
--

INSERT INTO `raza` (`Id`, `Nombre`, `Altura`, `Peso`, `Caracter`) VALUES
(101, 'Pastor alemán', 60, 40, 'Fiel'),
(102, 'Sphynx', 15, 3, 'Amigable'),
(103, 'Maine coon', 25, 9, 'Tranquilo'),
(104, 'Border collie', 40, 18, 'Inteligente'),
(105, 'Beagle', 33, 15, 'Cazador'),
(106, 'Perro para', 47, 22, 'Pastor'),
(107, 'Bengalí', 20, 4, 'Activo'),
(108, 'Labrador', 59, 30, 'Obediente'),
(109, 'Golden Retriever', 61, 32, 'Trabajador'),
(110, 'Persa', 20, 5, 'Curioso'),
(111, 'Chartreux', 18, 6, 'Dormilon'),
(112, 'Siamès', 15, 3, 'Tranquilo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `veterinario`
--

DROP TABLE IF EXISTS `veterinario`;
CREATE TABLE IF NOT EXISTS `veterinario` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(25) NOT NULL,
  `Telf` varchar(15) DEFAULT NULL,
  `Especialidad` varchar(20) DEFAULT NULL,
  `Fecha_Contrato` date NOT NULL,
  `Salario` decimal(7,2) NOT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `veterinario`
--

INSERT INTO `veterinario` (`Id`, `Nombre`, `Telf`, `Especialidad`, `Fecha_Contrato`, `Salario`) VALUES
(21, 'KING', '931112233', 'Cardiología', '1981-11-17', 5000.00),
(22, 'BLAKE', '932223344', 'General', '1981-05-01', 2850.00),
(23, 'CLARK', '933334455', 'Dermatología', '1981-06-09', 2450.00),
(24, 'JONES', '934445566', 'Traumatología', '1981-04-02', 2975.00),
(25, 'MARTIN', '935556677', 'Oftalmología', '1981-09-28', 1250.00),
(26, 'ALLEN', '936667788', 'General', '1981-02-20', 1600.00),
(27, 'TURNER', '939991122', 'Traumatología', '1981-09-08', 1500.00);
COMMIT;
