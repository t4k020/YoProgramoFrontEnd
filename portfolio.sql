-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-04-2023 a las 21:14:13
-- Versión del servidor: 10.4.25-MariaDB
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `portfolio`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `educacion`
--

CREATE TABLE `educacion` (
  `id` int(11) NOT NULL,
  `Especializacion` varchar(45) DEFAULT NULL,
  `FechaInicio` date DEFAULT NULL,
  `FechaFin` date DEFAULT NULL,
  `Tipo_De_Educacion_id` int(11) NOT NULL,
  `personas_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `educacion`
--

INSERT INTO `educacion` (`id`, `Especializacion`, `FechaInicio`, `FechaFin`, `Tipo_De_Educacion_id`, `personas_id`) VALUES
(1, 'Electromecanica', '2013-03-01', '2021-12-01', 1, 1),
(1, 'Informatica', '2023-04-01', NULL, 2, 1),
(3, 'Programacion', '2022-03-01', '2023-05-15', 3, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `experiencia_laboral`
--

CREATE TABLE `experiencia_laboral` (
  `id` int(11) NOT NULL,
  `NombreEmpresa` varchar(45) DEFAULT NULL,
  `EsTrabajoActual` tinyint(4) DEFAULT NULL,
  `FechaInicio` date DEFAULT NULL,
  `FechaFin` date DEFAULT NULL,
  `Descripcion` varchar(200) DEFAULT NULL,
  `Personas_id` int(11) NOT NULL,
  `Tipo_Empleo_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `experiencia_laboral`
--

INSERT INTO `experiencia_laboral` (`id`, `NombreEmpresa`, `EsTrabajoActual`, `FechaInicio`, `FechaFin`, `Descripcion`, `Personas_id`, `Tipo_Empleo_id`) VALUES
(1, 'xxxxx', 0, '2021-03-01', '2022-04-01', 'Diseñador web junior', 1, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas`
--

CREATE TABLE `personas` (
  `id` int(11) NOT NULL,
  `Nombre` varchar(45) DEFAULT NULL,
  `Apellido` varchar(45) DEFAULT NULL,
  `Domicilio` varchar(45) DEFAULT NULL,
  `FechaNac` date DEFAULT NULL,
  `Correo` varchar(45) DEFAULT NULL,
  `Telefono` varchar(12) DEFAULT NULL,
  `SobreMi` varchar(200) DEFAULT NULL,
  `Foto` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `personas`
--

INSERT INTO `personas` (`id`, `Nombre`, `Apellido`, `Domicilio`, `FechaNac`, `Correo`, `Telefono`, `SobreMi`, `Foto`) VALUES
(1, 'Gustavo', 'Ventura', 'lafayette1257', '2003-06-11', 'venturagustavoooo@gmail.com', '68350844', 'Estudiante de programación y informática\r\n', 'www.foto.com/foto');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyectos`
--

CREATE TABLE `proyectos` (
  `id` int(11) NOT NULL,
  `Nombre` varchar(45) DEFAULT NULL,
  `TiempoDeDesarollo` varchar(45) DEFAULT NULL,
  `Descripcion` varchar(200) DEFAULT NULL,
  `personas_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `proyectos`
--

INSERT INTO `proyectos` (`id`, `Nombre`, `TiempoDeDesarollo`, `Descripcion`, `personas_id`) VALUES
(1, 'Proyecto Ejemplo', '5 meses', 'Ejemplo de un proyecto', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_de_educacion`
--

CREATE TABLE `tipo_de_educacion` (
  `id` int(11) NOT NULL,
  `TipoDeEducacion` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipo_de_educacion`
--

INSERT INTO `tipo_de_educacion` (`id`, `TipoDeEducacion`) VALUES
(1, 'Secundaria'),
(2, 'Superior'),
(3, 'Curso');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_empleo`
--

CREATE TABLE `tipo_empleo` (
  `id` int(11) NOT NULL,
  `NombreTipoDeEmpleo` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipo_empleo`
--

INSERT INTO `tipo_empleo` (`id`, `NombreTipoDeEmpleo`) VALUES
(1, 'Part-time'),
(2, 'full-time'),
(3, 'freelance'),
(4, 'emprendimiento');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `educacion`
--
ALTER TABLE `educacion`
  ADD PRIMARY KEY (`id`,`Tipo_De_Educacion_id`,`personas_id`),
  ADD KEY `fk_Educacion_Tipo_De_Educacion1` (`Tipo_De_Educacion_id`),
  ADD KEY `fk_Educacion_personas1` (`personas_id`);

--
-- Indices de la tabla `experiencia_laboral`
--
ALTER TABLE `experiencia_laboral`
  ADD PRIMARY KEY (`id`,`Personas_id`,`Tipo_Empleo_id`),
  ADD KEY `fk_Experiencia_Laboral_Personas` (`Personas_id`),
  ADD KEY `fk_Experiencia_Laboral_Tipo_Empleo1` (`Tipo_Empleo_id`);

--
-- Indices de la tabla `personas`
--
ALTER TABLE `personas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `proyectos`
--
ALTER TABLE `proyectos`
  ADD PRIMARY KEY (`id`,`personas_id`),
  ADD KEY `fk_Proyectos_personas1` (`personas_id`);

--
-- Indices de la tabla `tipo_de_educacion`
--
ALTER TABLE `tipo_de_educacion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipo_empleo`
--
ALTER TABLE `tipo_empleo`
  ADD PRIMARY KEY (`id`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `educacion`
--
ALTER TABLE `educacion`
  ADD CONSTRAINT `fk_Educacion_Tipo_De_Educacion1` FOREIGN KEY (`Tipo_De_Educacion_id`) REFERENCES `tipo_de_educacion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Educacion_personas1` FOREIGN KEY (`personas_id`) REFERENCES `personas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `experiencia_laboral`
--
ALTER TABLE `experiencia_laboral`
  ADD CONSTRAINT `fk_Experiencia_Laboral_Personas` FOREIGN KEY (`Personas_id`) REFERENCES `personas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Experiencia_Laboral_Tipo_Empleo1` FOREIGN KEY (`Tipo_Empleo_id`) REFERENCES `tipo_empleo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `proyectos`
--
ALTER TABLE `proyectos`
  ADD CONSTRAINT `fk_Proyectos_personas1` FOREIGN KEY (`personas_id`) REFERENCES `personas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
