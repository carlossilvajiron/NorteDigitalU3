-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-08-2025 a las 03:29:35
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `mercy_developer`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `Id` int(10) UNSIGNED NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `Apellido` varchar(45) NOT NULL,
  `Correo` varchar(45) DEFAULT NULL,
  `Telefono` varchar(45) DEFAULT NULL,
  `Direccion` varchar(30) DEFAULT NULL,
  `Estado` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`Id`, `Nombre`, `Apellido`, `Correo`, `Telefono`, `Direccion`, `Estado`) VALUES
(2, 'Vicente', 'Lopez', 'vicente@cftmail.cl', '+567899034', 'quillay ', 1),
(3, 'Pedro', 'S', 'Pedro@cftmail.cl', '+569444000', 'CFT', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `descripcionservicio`
--

CREATE TABLE `descripcionservicio` (
  `Id` int(10) UNSIGNED NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `ServicioId` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recepcionequipo`
--

CREATE TABLE `recepcionequipo` (
  `Id` int(10) UNSIGNED NOT NULL,
  `ServicioId` int(10) UNSIGNED NOT NULL,
  `ClienteId` int(10) UNSIGNED NOT NULL,
  `fecha` datetime NOT NULL DEFAULT current_timestamp(),
  `TipoPc` int(11) NOT NULL,
  `Accesorio` varchar(400) DEFAULT NULL,
  `MarcaPc` varchar(60) NOT NULL,
  `ModeloPc` varchar(60) NOT NULL,
  `NSerie` varchar(100) DEFAULT NULL,
  `CapacidadRam` int(10) UNSIGNED DEFAULT NULL,
  `TipoAlmacenamiento` int(11) NOT NULL,
  `CapacidadAlmacenamiento` varchar(60) NOT NULL,
  `TipoGpu` int(11) NOT NULL,
  `Grafico` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio`
--

CREATE TABLE `servicio` (
  `Id` int(10) UNSIGNED NOT NULL,
  `Nombre` varchar(60) NOT NULL,
  `Precio` int(10) UNSIGNED NOT NULL,
  `Sku` varchar(50) NOT NULL,
  `Estado` int(11) NOT NULL DEFAULT 1,
  `UsuarioId` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `servicio`
--

INSERT INTO `servicio` (`Id`, `Nombre`, `Precio`, `Sku`, `Estado`, `UsuarioId`) VALUES
(1, 'Formateo', 10000, '1', 1, 3),
(3, 'Pepe', 10000, '2', 1, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `Id` int(10) UNSIGNED NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `Apellido` varchar(45) NOT NULL,
  `Correo` varchar(45) NOT NULL,
  `Password` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`Id`, `Nombre`, `Apellido`, `Correo`, `Password`) VALUES
(3, 'vicente', 'lopez', 'vicente@cftmail.cl', '1234');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `Correo_UNIQUE` (`Correo`);

--
-- Indices de la tabla `descripcionservicio`
--
ALTER TABLE `descripcionservicio`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `fk_descripcion_servicio_idx` (`ServicioId`);

--
-- Indices de la tabla `recepcionequipo`
--
ALTER TABLE `recepcionequipo`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `NSerie_UNIQUE` (`NSerie`),
  ADD KEY `fk_recepcion_servicio_idx` (`ServicioId`),
  ADD KEY `fk_recepcion_cliente_idx` (`ClienteId`);

--
-- Indices de la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `Sku_UNIQUE` (`Sku`),
  ADD KEY `fk_servicio_usuario_idx` (`UsuarioId`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `Correo_UNIQUE` (`Correo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `descripcionservicio`
--
ALTER TABLE `descripcionservicio`
  MODIFY `Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `recepcionequipo`
--
ALTER TABLE `recepcionequipo`
  MODIFY `Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `servicio`
--
ALTER TABLE `servicio`
  MODIFY `Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `descripcionservicio`
--
ALTER TABLE `descripcionservicio`
  ADD CONSTRAINT `fk_descripcion_servicio` FOREIGN KEY (`ServicioId`) REFERENCES `servicio` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `recepcionequipo`
--
ALTER TABLE `recepcionequipo`
  ADD CONSTRAINT `fk_recepcion_cliente` FOREIGN KEY (`ClienteId`) REFERENCES `cliente` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_recepcion_servicio` FOREIGN KEY (`ServicioId`) REFERENCES `servicio` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD CONSTRAINT `fk_servicio_usuario` FOREIGN KEY (`UsuarioId`) REFERENCES `usuario` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
