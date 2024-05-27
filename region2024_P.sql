-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-04-2024 a las 16:23:42
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `region2023`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumno`
--

CREATE TABLE `alumno` (
  `id` int(11) NOT NULL,
  `titulo_sec` varchar(100) DEFAULT NULL,
  `escuela_sec` varchar(100) DEFAULT NULL,
  `anio_egreso` int(11) DEFAULT NULL,
  `persona_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `alumno`
--

INSERT INTO `alumno` (`id`, `titulo_sec`, `escuela_sec`, `anio_egreso`, `persona_id`) VALUES
(1, '1', '1', 1, 1),
(2, '2', '2', 2, 2),
(3, '3', '3', 3, 3),
(4, '4', '4', 4, 4),
(5, '5', '5', 5, 5),
(6, '5', '5', 5, 6),
(7, '6', '6', 6, 7),
(8, '7', '7', 7, 8),
(9, '8', '8', 8, 9),
(10, '1', '1', 1, 10),
(11, 'bachiller', 'normal2', 2000, 11),
(12, '1', '1', 2000, 12),
(13, 'bachiller', 'normal2', 2010, 13),
(14, 'bachiller', 'normal76', 1995, 14),
(15, '3', '3', 3, 15),
(16, 'Tecnico', 'Albert thomas', 1990, 16);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `instituto`
--

CREATE TABLE `instituto` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `numero` varchar(50) NOT NULL,
  `url_instituto` varchar(100) DEFAULT NULL,
  `tipo` varchar(10) NOT NULL,
  `email` varchar(100) NOT NULL,
  `calle` varchar(100) NOT NULL,
  `altura` varchar(10) NOT NULL,
  `numero_cue` varchar(15) NOT NULL,
  `localidad_id` int(11) NOT NULL,
  `instituto` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `instituto`
--

INSERT INTO `instituto` (`id`, `nombre`, `numero`, `url_instituto`, `tipo`, `email`, `calle`, `altura`, `numero_cue`, `localidad_id`, `instituto`) VALUES
(1, 'Instituto Superior de Formacion tecnica', '12', 'www.i12.com.ar', 'Central', 'i12@gmail.com', '7', '76', '23xxxxxx', 1, NULL),
(2, 'Instituto de Formacion Tecnica', '202', 'www.i202.com.ar', 'Central', 'i202@gmail.com', 'montevideo', '11', '45xxxxx', 2, NULL),
(3, 'Instituto de Formacion Tecnica', '213', 'http://www.institutosuperior213.edu.ar/', 'Central', 'i213@gmeil.com', '22', '21', '3123xxxx', 1, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `localidad`
--

CREATE TABLE `localidad` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `codigo_postal` varchar(10) DEFAULT NULL,
  `provincia_id` int(11) NOT NULL,
  `region_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `localidad`
--

INSERT INTO `localidad` (`id`, `nombre`, `codigo_postal`, `provincia_id`, `region_id`) VALUES
(1, 'La Plata', '1900', 1, 1),
(2, 'Berisso', '1904', 1, 1),
(3, 'Ensenada', '1925', 1, 1),
(4, 'Otro', '---', 6, 12);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext NOT NULL,
  `headers` longtext NOT NULL,
  `queue_name` varchar(190) NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modalidad`
--

CREATE TABLE `modalidad` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `modalidad`
--

INSERT INTO `modalidad` (`id`, `descripcion`) VALUES
(1, 'presencial'),
(2, 'on-line');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oferta_educativa`
--

CREATE TABLE `oferta_educativa` (
  `id` int(11) NOT NULL,
  `ciclo_lectivo` int(11) NOT NULL,
  `cupo` int(11) DEFAULT NULL,
  `tecnicatura_id` int(11) NOT NULL,
  `turno_id` int(11) NOT NULL,
  `instituto_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `oferta_educativa`
--

INSERT INTO `oferta_educativa` (`id`, `ciclo_lectivo`, `cupo`, `tecnicatura_id`, `turno_id`, `instituto_id`) VALUES
(1, 2024, NULL, 1, 1, 1),
(2, 2024, NULL, 2, 3, 1),
(3, 2024, NULL, 4, 1, 1),
(4, 2024, NULL, 3, 1, 2),
(5, 2024, NULL, 1, 1, 2),
(6, 2024, NULL, 4, 1, 3),
(7, 2024, NULL, 1, 2, 2),
(8, 2024, NULL, 2, 4, 2),
(9, 2024, NULL, 4, 3, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pais`
--

CREATE TABLE `pais` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `pais`
--

INSERT INTO `pais` (`id`, `descripcion`) VALUES
(1, 'Argentina'),
(2, 'Uruguay'),
(4, 'Brasil'),
(5, 'Chile'),
(6, 'Peru'),
(7, 'Paraguay'),
(8, 'Bolivia'),
(9, 'Venezuela'),
(10, 'Otro');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `dni_pasaporte` varchar(20) NOT NULL,
  `genero` varchar(10) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefono` varchar(25) DEFAULT NULL,
  `partido` varchar(50) NOT NULL,
  `calle` varchar(100) NOT NULL,
  `numero` varchar(10) DEFAULT NULL,
  `piso` int(11) DEFAULT NULL,
  `departamento` varchar(2) DEFAULT NULL,
  `pasillo` varchar(50) DEFAULT NULL,
  `pais_id` int(11) NOT NULL,
  `localidad_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`id`, `nombre`, `apellido`, `fecha_nacimiento`, `dni_pasaporte`, `genero`, `email`, `telefono`, `partido`, `calle`, `numero`, `piso`, `departamento`, `pasillo`, `pais_id`, `localidad_id`) VALUES
(1, '1', '1', '2018-01-01', '1', '1', '1', '1', '1', '1', '1', 1, '1', '1', 1, 1),
(2, '2', '2', '2018-01-01', '2', '2', '2', '2', '2', '2', '2', 2, '2', '2', 1, 1),
(3, '3', '3', '2018-01-01', '3', '3', '3', '3', '3', '3', '3', 3, '3', '3', 1, 1),
(4, '4', '4', '2018-01-01', '4', '4', '4', '4', '4', '4', '4', 4, '4', '4', 1, 1),
(5, '5', '5', '2018-01-01', '5', '5', '5', '5', '5', '5', '5', 5, '5', '5', 1, 1),
(6, '5', '5', '2018-01-01', '5', '5', '5', '5', '5', '5', '5', 5, '5', '5', 1, 1),
(7, '6', '6', '2018-01-01', '6', '6', '6', '6', '6', '6', '6', 6, '6', '6', 1, 1),
(8, '7', '7', '2018-01-01', '7', '7', '7', '7', '7', '7', '7', 7, '7', '7', 1, 1),
(9, '8', '8', '2018-01-01', '8', '8', '8', '8', '8', '8', '8', 8, '8', '8', 1, 1),
(10, '1', '1', '1903-01-01', '1', '1', '1', '1', '1', '1', '1', 1, '1', '1', 1, 1),
(11, 'gustavo', 'rodriguez', '1903-01-01', '270000', 'm', 'm@hotmail.com', '123412', 'lp', '1', '1', 1, '1', '1', 1, 1),
(12, 'gus', 'g', '1903-01-01', '1', '1', '1', '1', '1', '1', '1', 1, '1', '1', 1, 1),
(13, 'rodo', 'pepe', '1903-01-01', '1234', 'm', 'm@gmail.com', '12534', 'lp', '1', '1', 1, '1', '1', 1, 1),
(14, 'Ignacio', 'Company', '1903-01-01', '3333', 'otro', 'other@gmail.com', '3322', 'lp', '1', '22', 1, '1', '1', 1, 1),
(15, 'pepito', 'cybrian', '1903-01-01', '222', 'otro', 'ot@teatro.com', '132', '33', '3', '3', 3, '3', '3', 1, 1),
(16, 'Jhon', 'Doe', '1970-03-14', '333992', 'M', 'JhonD@gmail.com', '221-89898', 'La Plata', '1', '1', 1, '1', '1', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preinscripcion`
--

CREATE TABLE `preinscripcion` (
  `id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `alumno_id` int(11) NOT NULL,
  `oferta_educativa_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `preinscripcion`
--

INSERT INTO `preinscripcion` (`id`, `fecha`, `alumno_id`, `oferta_educativa_id`) VALUES
(16, '2023-03-12', 16, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provincia`
--

CREATE TABLE `provincia` (
  `id` int(11) NOT NULL,
  `pais_id` int(11) NOT NULL,
  `descripcion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `provincia`
--

INSERT INTO `provincia` (`id`, `pais_id`, `descripcion`) VALUES
(1, 1, 'Buenos Aires'),
(2, 1, 'Cordoba'),
(3, 1, 'Santa Fe'),
(4, 1, 'Tucuman'),
(5, 1, 'Entre Rios'),
(6, 10, 'Otro');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `region`
--

CREATE TABLE `region` (
  `id` int(11) NOT NULL,
  `numero` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `region`
--

INSERT INTO `region` (`id`, `numero`) VALUES
(1, 'I'),
(2, 'II'),
(3, 'III'),
(4, 'IV'),
(5, 'V'),
(6, 'VI'),
(7, 'VII'),
(8, 'VIII'),
(9, 'IX'),
(10, 'X'),
(11, 'XI'),
(12, 'Otro');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tecnicatura`
--

CREATE TABLE `tecnicatura` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `duracion` int(11) NOT NULL,
  `cantidad_asignaturas` int(11) DEFAULT NULL,
  `numero_resolucion` varchar(30) NOT NULL,
  `modalidad_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tecnicatura`
--

INSERT INTO `tecnicatura` (`id`, `nombre`, `duracion`, `cantidad_asignaturas`, `numero_resolucion`, `modalidad_id`) VALUES
(1, 'Tecnicatura Superior en Analisis de Sistemas', 3, 23, '06790-19', 1),
(2, 'Tecnico Superior en Desarrollo de Software', 3, 23, '06790-19', 1),
(3, 'Tecnico Superior en Biotecnologia', 3, 23, '58/11', 1),
(4, 'Técnico Superior en Ciencia de Datos e Inteligencia Artificial', 3, 23, '2730/22', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `telefono`
--

CREATE TABLE `telefono` (
  `id` int(11) NOT NULL,
  `numero` varchar(25) NOT NULL,
  `instituto_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `telefono`
--

INSERT INTO `telefono` (`id`, `numero`, `instituto_id`) VALUES
(1, '221-xxxxxxx', 1),
(2, '221-yyyyyyyy', 1),
(3, '221-ffffffff', 2),
(4, '221-ggggggg', 2),
(5, '221-wwwwww', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `turno`
--

CREATE TABLE `turno` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `turno`
--

INSERT INTO `turno` (`id`, `descripcion`) VALUES
(1, 'mañana'),
(2, 'tarde'),
(3, 'noche'),
(4, 'Vespertino');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) NOT NULL,
  `roles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`roles`)),
  `password` varchar(255) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `nombre`, `apellido`) VALUES
(1, 'admin@gmail.com', '[\"ROLE_SUPER_ADMIN\"]', '$2y$13$Z2PnDBMwzOvHBezAeNz/HO8tTC1sWHib3XXTcadfKsls.iqEXAsmy', 'rr', 'gg');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumno`
--
ALTER TABLE `alumno`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_1435D52DF5F88DB9` (`persona_id`);

--
-- Indices de la tabla `instituto`
--
ALTER TABLE `instituto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_2A805CCE67707C89` (`localidad_id`);

--
-- Indices de la tabla `localidad`
--
ALTER TABLE `localidad`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_4F68E0104E7121AF` (`provincia_id`),
  ADD KEY `IDX_4F68E01098260155` (`region_id`);

--
-- Indices de la tabla `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Indices de la tabla `modalidad`
--
ALTER TABLE `modalidad`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `oferta_educativa`
--
ALTER TABLE `oferta_educativa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_21B7C831E2D74A4D` (`tecnicatura_id`),
  ADD KEY `IDX_21B7C83169C5211E` (`turno_id`),
  ADD KEY `IDX_21B7C8316C6EF28` (`instituto_id`);

--
-- Indices de la tabla `pais`
--
ALTER TABLE `pais`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_51E5B69BC604D5C6` (`pais_id`),
  ADD KEY `IDX_51E5B69B67707C89` (`localidad_id`);

--
-- Indices de la tabla `preinscripcion`
--
ALTER TABLE `preinscripcion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_A9543049FC28E5EE` (`alumno_id`),
  ADD KEY `IDX_A954304915CE31DF` (`oferta_educativa_id`);

--
-- Indices de la tabla `provincia`
--
ALTER TABLE `provincia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_D39AF213C604D5C6` (`pais_id`);

--
-- Indices de la tabla `region`
--
ALTER TABLE `region`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tecnicatura`
--
ALTER TABLE `tecnicatura`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_17FAADB41E092B9F` (`modalidad_id`);

--
-- Indices de la tabla `telefono`
--
ALTER TABLE `telefono`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_C1E70A7F6C6EF28` (`instituto_id`);

--
-- Indices de la tabla `turno`
--
ALTER TABLE `turno`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alumno`
--
ALTER TABLE `alumno`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `instituto`
--
ALTER TABLE `instituto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `localidad`
--
ALTER TABLE `localidad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `modalidad`
--
ALTER TABLE `modalidad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `oferta_educativa`
--
ALTER TABLE `oferta_educativa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `pais`
--
ALTER TABLE `pais`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `preinscripcion`
--
ALTER TABLE `preinscripcion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `provincia`
--
ALTER TABLE `provincia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `region`
--
ALTER TABLE `region`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `tecnicatura`
--
ALTER TABLE `tecnicatura`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `telefono`
--
ALTER TABLE `telefono`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `turno`
--
ALTER TABLE `turno`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alumno`
--
ALTER TABLE `alumno`
  ADD CONSTRAINT `FK_1435D52DF5F88DB9` FOREIGN KEY (`persona_id`) REFERENCES `persona` (`id`);

--
-- Filtros para la tabla `instituto`
--
ALTER TABLE `instituto`
  ADD CONSTRAINT `FK_2A805CCE67707C89` FOREIGN KEY (`localidad_id`) REFERENCES `localidad` (`id`);

--
-- Filtros para la tabla `localidad`
--
ALTER TABLE `localidad`
  ADD CONSTRAINT `FK_4F68E0104E7121AF` FOREIGN KEY (`provincia_id`) REFERENCES `provincia` (`id`),
  ADD CONSTRAINT `FK_4F68E01098260155` FOREIGN KEY (`region_id`) REFERENCES `region` (`id`);

--
-- Filtros para la tabla `oferta_educativa`
--
ALTER TABLE `oferta_educativa`
  ADD CONSTRAINT `FK_21B7C83169C5211E` FOREIGN KEY (`turno_id`) REFERENCES `turno` (`id`),
  ADD CONSTRAINT `FK_21B7C8316C6EF28` FOREIGN KEY (`instituto_id`) REFERENCES `instituto` (`id`),
  ADD CONSTRAINT `FK_21B7C831E2D74A4D` FOREIGN KEY (`tecnicatura_id`) REFERENCES `tecnicatura` (`id`);

--
-- Filtros para la tabla `persona`
--
ALTER TABLE `persona`
  ADD CONSTRAINT `FK_51E5B69B67707C89` FOREIGN KEY (`localidad_id`) REFERENCES `localidad` (`id`),
  ADD CONSTRAINT `FK_51E5B69BC604D5C6` FOREIGN KEY (`pais_id`) REFERENCES `pais` (`id`);

--
-- Filtros para la tabla `preinscripcion`
--
ALTER TABLE `preinscripcion`
  ADD CONSTRAINT `FK_A954304915CE31DF` FOREIGN KEY (`oferta_educativa_id`) REFERENCES `oferta_educativa` (`id`),
  ADD CONSTRAINT `FK_A9543049FC28E5EE` FOREIGN KEY (`alumno_id`) REFERENCES `alumno` (`id`);

--
-- Filtros para la tabla `provincia`
--
ALTER TABLE `provincia`
  ADD CONSTRAINT `FK_D39AF213C604D5C6` FOREIGN KEY (`pais_id`) REFERENCES `pais` (`id`);

--
-- Filtros para la tabla `tecnicatura`
--
ALTER TABLE `tecnicatura`
  ADD CONSTRAINT `FK_17FAADB41E092B9F` FOREIGN KEY (`modalidad_id`) REFERENCES `modalidad` (`id`);

--
-- Filtros para la tabla `telefono`
--
ALTER TABLE `telefono`
  ADD CONSTRAINT `FK_C1E70A7F6C6EF28` FOREIGN KEY (`instituto_id`) REFERENCES `instituto` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
