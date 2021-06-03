-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-05-2021 a las 10:13:00
-- Versión del servidor: 10.4.17-MariaDB
-- Versión de PHP: 7.2.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `votacion`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnos`
--

CREATE TABLE `alumnos` (
  `id_alumnos` int(11) NOT NULL,
  `cedula_alumno` varchar(250) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `carrera` varchar(50) NOT NULL,
  `cod_candidato` varchar(250) NOT NULL,
  `voto` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `alumnos`
--

INSERT INTO `alumnos` (`id_alumnos`, `cedula_alumno`, `nombre`, `carrera`, `cod_candidato`, `voto`) VALUES
(93, '20151052', 'angel gomez', 'Ingenieria de Sistemas', '20161092', 1),
(94, '20113652', 'edwar montero', 'Ingenieria Industrial', '76455522', 1),
(95, '20202020', 'ernesto bringas', 'Ingenieria de Sistemas', '20161092', 1),
(96, '19951995', 'carlos flores', 'Ingenieria de Sistemas', '76455522', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `candidatos`
--

CREATE TABLE `candidatos` (
  `id_candidato` int(11) NOT NULL,
  `cedula_candidato` varchar(250) NOT NULL,
  `nombre` varchar(250) NOT NULL,
  `cod_candidato` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `candidatos`
--

INSERT INTO `candidatos` (`id_candidato`, `cedula_candidato`, `nombre`, `cod_candidato`) VALUES
(8, '20161092', 'enrique sandoval', '20161092'),
(9, '76455522', 'jorge haro', '76455522');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carreras`
--

CREATE TABLE `carreras` (
  `id_carreras` int(50) NOT NULL,
  `carreras` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `carreras`
--

INSERT INTO `carreras` (`id_carreras`, `carreras`) VALUES
(0, 'Ingenieria Industrial'),
(1, 'Ingenieria de Sistemas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `clave` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nombre`, `usuario`, `clave`) VALUES
(1, 'administrador', 'admin', 'admin');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `votos`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `votos` (
`carrera` varchar(50)
,`cod_candidato` varchar(250)
,`nombre` varchar(250)
,`votos` bigint(21)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `votos`
--
DROP TABLE IF EXISTS `votos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `votos`  AS SELECT `alumnos`.`carrera` AS `carrera`, `alumnos`.`cod_candidato` AS `cod_candidato`, `candidatos`.`nombre` AS `nombre`, count(`alumnos`.`carrera`) AS `votos` FROM (`alumnos` join `candidatos` on(`candidatos`.`cod_candidato` = `alumnos`.`cod_candidato`)) GROUP BY `alumnos`.`carrera`, `alumnos`.`cod_candidato`, `candidatos`.`nombre` ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  ADD UNIQUE KEY `id_alumnos` (`id_alumnos`);

--
-- Indices de la tabla `candidatos`
--
ALTER TABLE `candidatos`
  ADD PRIMARY KEY (`id_candidato`),
  ADD UNIQUE KEY `cedula_candidato` (`cedula_candidato`);

--
-- Indices de la tabla `carreras`
--
ALTER TABLE `carreras`
  ADD PRIMARY KEY (`id_carreras`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD UNIQUE KEY `id_usuario` (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  MODIFY `id_alumnos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT de la tabla `candidatos`
--
ALTER TABLE `candidatos`
  MODIFY `id_candidato` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `carreras`
--
ALTER TABLE `carreras`
  MODIFY `id_carreras` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
