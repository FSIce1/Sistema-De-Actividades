-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-03-2019 a las 17:43:29
-- Versión del servidor: 10.1.37-MariaDB
-- Versión de PHP: 7.3.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proyectoactividades`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actividad`
--

CREATE TABLE `actividad` (
  `id_actividad` int(11) NOT NULL,
  `descripcion_actividad` text NOT NULL,
  `estado_actividad` tinyint(1) NOT NULL,
  `estadoTI_actividad` tinyint(1) DEFAULT NULL,
  `evento_actividadFK` int(11) NOT NULL,
  `id_usuarioFK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `actividad`
--

INSERT INTO `actividad` (`id_actividad`, `descripcion_actividad`, `estado_actividad`, `estadoTI_actividad`, `evento_actividadFK`, `id_usuarioFK`) VALUES
(12, 'act1', 0, 0, 3, 5),
(16, 'e.e', 0, 0, 4, 2),
(18, 'u.u', 0, 1, 4, 3),
(19, 'Ir', 0, 1, 4, 4),
(20, 'mejia lobazo', 1, 0, 4, 4),
(21, 'pazto', 0, 0, 3, 4),
(22, 'klhj', 0, 0, 3, 5),
(23, 'comprar halls :v', 0, 1, 5, 5),
(24, 'TAREA 1', 0, 1, 6, 6),
(25, 'jajjaja', 0, 0, 4, 4),
(26, 'irse al sitio', 1, 1, 4, 9),
(27, 'Comprar pan', 0, 1, 10, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargo`
--

CREATE TABLE `cargo` (
  `id_cargo` int(11) NOT NULL,
  `nombre_cargo` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cargo`
--

INSERT INTO `cargo` (`id_cargo`, `nombre_cargo`) VALUES
(1, 'Jefe de Operaciones'),
(2, 'Marketing'),
(3, 'Gestor de Proyectos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evento`
--

CREATE TABLE `evento` (
  `id_evento` int(11) NOT NULL,
  `diaInicio_evento` datetime NOT NULL,
  `diaFin_evento` datetime NOT NULL,
  `descripcion_evento` text NOT NULL,
  `colorFondo_evento` varchar(10) NOT NULL,
  `diaTerminado_evento` datetime DEFAULT NULL,
  `estado_evento` tinyint(4) NOT NULL,
  `usuario_eventoFK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `evento`
--

INSERT INTO `evento` (`id_evento`, `diaInicio_evento`, `diaFin_evento`, `descripcion_evento`, `colorFondo_evento`, `diaTerminado_evento`, `estado_evento`, `usuario_eventoFK`) VALUES
(1, '2019-02-12 05:00:00', '2019-02-28 05:00:00', 'Ir de Paseo', '#eb78eb', NULL, 1, 1),
(2, '2019-02-03 08:00:00', '2019-02-21 03:00:00', 'Reunión con el gerente', '#08e8fc', '2019-02-14 00:00:00', 1, 1),
(3, '2019-02-12 00:00:00', '2019-02-28 00:00:00', 'hablar', '#838cf7', '2019-02-22 00:00:00', 0, 1),
(4, '2019-02-04 00:00:00', '2019-02-22 03:00:00', 'coordinar', '#40e9ff', '2019-02-13 00:00:00', 0, 1),
(5, '2019-02-01 07:00:00', '2019-02-13 02:00:00', 'Evento 69', '#67db71', NULL, 1, 1),
(6, '2019-02-05 03:00:00', '2019-02-21 02:00:00', 'EVENTO PRUEBA', '#57dbe0', NULL, 0, 1),
(7, '2019-02-03 00:00:00', '2019-02-21 00:00:00', 'JJJ', '#b4c2b5', NULL, 0, 1),
(8, '2019-02-05 00:00:00', '2019-02-21 00:00:00', 'II', '#3e68e6', NULL, 0, 1),
(9, '2019-03-04 08:00:00', '2019-03-22 04:00:00', 'UUYUYU', '#d166d1', NULL, 0, 1),
(10, '2019-03-18 00:00:00', '2019-03-22 00:00:00', 'Fiesta', '#0faabf', NULL, 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipousuario`
--

CREATE TABLE `tipousuario` (
  `id_tipo` int(11) NOT NULL,
  `nombre_tipo` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipousuario`
--

INSERT INTO `tipousuario` (`id_tipo`, `nombre_tipo`) VALUES
(1, 'Administrador'),
(2, 'Usuario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `dni_usuario` int(8) NOT NULL,
  `contraseña_usuario` varchar(25) NOT NULL,
  `nombres_usuario` varchar(45) NOT NULL,
  `apellidos_usuario` varchar(45) NOT NULL,
  `email_usuario` varchar(35) NOT NULL,
  `descripcion_usuario` text,
  `estado_usuario` tinyint(1) NOT NULL,
  `cargo_usuarioFK` int(11) NOT NULL,
  `tipo_usuarioFK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `dni_usuario`, `contraseña_usuario`, `nombres_usuario`, `apellidos_usuario`, `email_usuario`, `descripcion_usuario`, `estado_usuario`, `cargo_usuarioFK`, `tipo_usuarioFK`) VALUES
(1, 72314652, '123', 'Darío Leoni', 'Ramos Amau', 'dramos@munichiclayo.gob.pe', '', 0, 3, 1),
(2, 12345678, '123', 'Pedro', 'Perez Sosa', 'juan@gmail.com', '                                                            \r\nLOl                                                            \r\n                                                        ', 0, 2, 2),
(3, 98989899, '123', 'Junior', 'Sánchez Custodio', 'Juniorwito@gmail.com', '                                                            \r\nchibolero                                                            \r\n                                                        ', 0, 1, 2),
(4, 15115151, '123', 'Karla Lo', 'Solari Gamboa', 'kar@gmail.com', '                                         \r\n                                                        ', 0, 2, 2),
(5, 14141414, '123', 'Juan ', 'Perez', 'juPer@gmail.com', 'Usuario de Prueba', 0, 2, 2),
(6, 66666666, '123', 'Jairo', 'Santamaria', 'ja@gmail.com', '', 0, 3, 2),
(7, 13231211, '123', 'GianFranco', 'Mejia Carhuajulca', 'lobo@gmail.com', 'cazador :v             ', 0, 3, 2),
(8, 87878787, '123', 'Elias', 'Gasteloide', 'eli@gmail.com', '', 0, 2, 2),
(9, 30243343, 'felipectmr', 'elias', 'gastelo', 'eliashot@adsads.com', '                                                                                                       felipectmr                 \r\n                                                        ', 0, 1, 2),
(10, 76679538, 'mily123', 'milagros', 'gamarra', 'milagros123@gmail.com', '                                                                                                                        \r\n                                                        ', 0, 2, 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `actividad`
--
ALTER TABLE `actividad`
  ADD PRIMARY KEY (`id_actividad`,`evento_actividadFK`,`id_usuarioFK`),
  ADD KEY `fk_actividad_evento1_idx` (`evento_actividadFK`),
  ADD KEY `fk_actividad_usuario1_idx` (`id_usuarioFK`);

--
-- Indices de la tabla `cargo`
--
ALTER TABLE `cargo`
  ADD PRIMARY KEY (`id_cargo`);

--
-- Indices de la tabla `evento`
--
ALTER TABLE `evento`
  ADD PRIMARY KEY (`id_evento`,`usuario_eventoFK`),
  ADD KEY `fk_evento_usuario1_idx` (`usuario_eventoFK`);

--
-- Indices de la tabla `tipousuario`
--
ALTER TABLE `tipousuario`
  ADD PRIMARY KEY (`id_tipo`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`,`cargo_usuarioFK`,`tipo_usuarioFK`),
  ADD UNIQUE KEY `dni_usuario_UNIQUE` (`dni_usuario`),
  ADD KEY `fk_usuario_cargo_idx` (`cargo_usuarioFK`),
  ADD KEY `fk_usuario_tipoUsuario1_idx` (`tipo_usuarioFK`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `actividad`
--
ALTER TABLE `actividad`
  MODIFY `id_actividad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `cargo`
--
ALTER TABLE `cargo`
  MODIFY `id_cargo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `evento`
--
ALTER TABLE `evento`
  MODIFY `id_evento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `tipousuario`
--
ALTER TABLE `tipousuario`
  MODIFY `id_tipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `actividad`
--
ALTER TABLE `actividad`
  ADD CONSTRAINT `fk_actividad_evento1` FOREIGN KEY (`evento_actividadFK`) REFERENCES `evento` (`id_evento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_actividad_usuario1` FOREIGN KEY (`id_usuarioFK`) REFERENCES `usuario` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `evento`
--
ALTER TABLE `evento`
  ADD CONSTRAINT `fk_evento_usuario1` FOREIGN KEY (`usuario_eventoFK`) REFERENCES `usuario` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_usuario_cargo` FOREIGN KEY (`cargo_usuarioFK`) REFERENCES `cargo` (`id_cargo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_usuario_tipoUsuario1` FOREIGN KEY (`tipo_usuarioFK`) REFERENCES `tipousuario` (`id_tipo`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
