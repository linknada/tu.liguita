-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-03-2020 a las 17:29:13
-- Versión del servidor: 10.1.30-MariaDB
-- Versión de PHP: 5.6.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tuliguita`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asistencia`
--

CREATE TABLE `asistencia` (
  `idasistencia` int(3) NOT NULL,
  `idpartido` int(3) NOT NULL,
  `idjugador` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `idcategoria` int(3) NOT NULL,
  `nombre` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipo`
--

CREATE TABLE `equipo` (
  `idequipo` int(3) NOT NULL,
  `idliga` int(3) NOT NULL,
  `nombre` varchar(15) NOT NULL,
  `delegado` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gol`
--

CREATE TABLE `gol` (
  `idgoles` int(3) NOT NULL,
  `idasistencia` int(3) NOT NULL,
  `idjugador` int(3) NOT NULL,
  `goles` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jornada`
--

CREATE TABLE `jornada` (
  `idjornada` int(3) NOT NULL,
  `idliga` int(3) NOT NULL,
  `numerojornada` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jugador`
--

CREATE TABLE `jugador` (
  `idjugador` int(3) NOT NULL,
  `idequipo` int(3) NOT NULL,
  `nombre` varchar(15) NOT NULL,
  `apellido` varchar(15) NOT NULL,
  `dorsal` int(3) NOT NULL,
  `nacimiento` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `liga`
--

CREATE TABLE `liga` (
  `idliga` int(3) NOT NULL,
  `idtemporada` int(3) NOT NULL,
  `idcategoria` int(3) NOT NULL,
  `nombre` varchar(15) NOT NULL,
  `delegado` varchar(15) NOT NULL,
  `ppvictoria` int(3) NOT NULL,
  `ppempate` int(3) NOT NULL,
  `ppderrota` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `partido`
--

CREATE TABLE `partido` (
  `idpartido` int(3) NOT NULL,
  `idjornada` int(3) NOT NULL,
  `equipo1` int(3) NOT NULL,
  `equipo2` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarjetas`
--

CREATE TABLE `tarjetas` (
  `idtarjetas` int(3) NOT NULL,
  `idasistencia` int(3) NOT NULL,
  `idjugador` int(3) NOT NULL,
  `amarilla` int(3) NOT NULL,
  `roja` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `temporada`
--

CREATE TABLE `temporada` (
  `idtemporada` int(3) NOT NULL,
  `nombre` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asistencia`
--
ALTER TABLE `asistencia`
  ADD PRIMARY KEY (`idasistencia`),
  ADD KEY `idpartido` (`idpartido`),
  ADD KEY `idjugador` (`idjugador`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`idcategoria`);

--
-- Indices de la tabla `equipo`
--
ALTER TABLE `equipo`
  ADD PRIMARY KEY (`idequipo`),
  ADD KEY `idliga` (`idliga`);

--
-- Indices de la tabla `gol`
--
ALTER TABLE `gol`
  ADD PRIMARY KEY (`idgoles`),
  ADD KEY `idpartido` (`idasistencia`),
  ADD KEY `idjugador` (`idjugador`);

--
-- Indices de la tabla `jornada`
--
ALTER TABLE `jornada`
  ADD PRIMARY KEY (`idjornada`),
  ADD KEY `idliga` (`idliga`);

--
-- Indices de la tabla `jugador`
--
ALTER TABLE `jugador`
  ADD PRIMARY KEY (`idjugador`),
  ADD KEY `idequipo` (`idequipo`);

--
-- Indices de la tabla `liga`
--
ALTER TABLE `liga`
  ADD PRIMARY KEY (`idliga`),
  ADD KEY `idtemporada` (`idtemporada`),
  ADD KEY `idcategoria` (`idcategoria`);

--
-- Indices de la tabla `partido`
--
ALTER TABLE `partido`
  ADD PRIMARY KEY (`idpartido`),
  ADD KEY `idjornada` (`idjornada`),
  ADD KEY `equipo1` (`equipo1`),
  ADD KEY `equipo2` (`equipo2`);

--
-- Indices de la tabla `tarjetas`
--
ALTER TABLE `tarjetas`
  ADD PRIMARY KEY (`idtarjetas`),
  ADD KEY `idpartido` (`idasistencia`),
  ADD KEY `idjugador` (`idjugador`);

--
-- Indices de la tabla `temporada`
--
ALTER TABLE `temporada`
  ADD PRIMARY KEY (`idtemporada`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `asistencia`
--
ALTER TABLE `asistencia`
  MODIFY `idasistencia` int(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `idcategoria` int(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `equipo`
--
ALTER TABLE `equipo`
  MODIFY `idequipo` int(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `gol`
--
ALTER TABLE `gol`
  MODIFY `idgoles` int(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `jornada`
--
ALTER TABLE `jornada`
  MODIFY `idjornada` int(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `jugador`
--
ALTER TABLE `jugador`
  MODIFY `idjugador` int(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `liga`
--
ALTER TABLE `liga`
  MODIFY `idliga` int(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `partido`
--
ALTER TABLE `partido`
  MODIFY `idpartido` int(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tarjetas`
--
ALTER TABLE `tarjetas`
  MODIFY `idtarjetas` int(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `temporada`
--
ALTER TABLE `temporada`
  MODIFY `idtemporada` int(3) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asistencia`
--
ALTER TABLE `asistencia`
  ADD CONSTRAINT `asistencia_ibfk_1` FOREIGN KEY (`idpartido`) REFERENCES `partido` (`idpartido`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `asistencia_ibfk_2` FOREIGN KEY (`idjugador`) REFERENCES `jugador` (`idjugador`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `equipo`
--
ALTER TABLE `equipo`
  ADD CONSTRAINT `equipo_ibfk_1` FOREIGN KEY (`idliga`) REFERENCES `liga` (`idliga`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `gol`
--
ALTER TABLE `gol`
  ADD CONSTRAINT `gol_ibfk_1` FOREIGN KEY (`idasistencia`) REFERENCES `asistencia` (`idasistencia`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `gol_ibfk_2` FOREIGN KEY (`idjugador`) REFERENCES `jugador` (`idjugador`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `jornada`
--
ALTER TABLE `jornada`
  ADD CONSTRAINT `jornada_ibfk_1` FOREIGN KEY (`idliga`) REFERENCES `liga` (`idliga`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `jugador`
--
ALTER TABLE `jugador`
  ADD CONSTRAINT `jugador_ibfk_1` FOREIGN KEY (`idequipo`) REFERENCES `equipo` (`idequipo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `liga`
--
ALTER TABLE `liga`
  ADD CONSTRAINT `liga_ibfk_1` FOREIGN KEY (`idtemporada`) REFERENCES `temporada` (`idtemporada`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `liga_ibfk_2` FOREIGN KEY (`idcategoria`) REFERENCES `categoria` (`idcategoria`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `partido`
--
ALTER TABLE `partido`
  ADD CONSTRAINT `partido_ibfk_1` FOREIGN KEY (`idjornada`) REFERENCES `jornada` (`idjornada`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `partido_ibfk_2` FOREIGN KEY (`equipo1`) REFERENCES `equipo` (`idequipo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `partido_ibfk_3` FOREIGN KEY (`equipo2`) REFERENCES `equipo` (`idequipo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tarjetas`
--
ALTER TABLE `tarjetas`
  ADD CONSTRAINT `tarjetas_ibfk_1` FOREIGN KEY (`idasistencia`) REFERENCES `asistencia` (`idasistencia`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tarjetas_ibfk_2` FOREIGN KEY (`idjugador`) REFERENCES `jugador` (`idjugador`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
