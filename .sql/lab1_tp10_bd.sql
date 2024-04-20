-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-04-2024 a las 22:41:46
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
-- Base de datos: `lab1_tp10_bd`
--
CREATE DATABASE IF NOT EXISTS `lab1_tp10_bd` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `lab1_tp10_bd`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `id_empleado` int(11) NOT NULL,
  `dni` bigint(20) NOT NULL,
  `apellido` varchar(58) NOT NULL,
  `nombre_empleado` varchar(58) NOT NULL,
  `acceso` int(11) NOT NULL,
  `estado` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`id_empleado`, `dni`, `apellido`, `nombre_empleado`, `acceso`, `estado`) VALUES
(1, 123456789, 'González', 'Juan', 1, 1),
(2, 987654321, 'Martínez', 'María', 2, 1),
(3, 111222333, 'Rodríguez', 'Carlos', 3, 1),
(4, 444555666, 'Fernández', 'Laura', 1, 1),
(5, 777888999, 'López', 'Andrés', 2, 1),
(6, 666555444, 'Gómez', 'Ana', 3, 1),
(7, 333222111, 'Díaz', 'Diego', 1, 1),
(8, 999888777, 'Pérez', 'Sofía', 2, 1),
(9, 555444333, 'Hernández', 'Lucía', 3, 1),
(10, 222111000, 'Muñoz', 'Pedro', 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `herramienta`
--

CREATE TABLE `herramienta` (
  `id_Herramienta` int(11) NOT NULL,
  `nombre_h` varchar(60) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `stock` int(11) NOT NULL,
  `estado` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `herramienta`
--

INSERT INTO `herramienta` (`id_Herramienta`, `nombre_h`, `descripcion`, `stock`, `estado`) VALUES
(1, 'Martillo', 'Herramienta para golpear', 10, 1),
(2, 'Destornillador', 'Herramienta para atornillar', 20, 1),
(3, 'Sierra', 'Herramienta para cortar', 30, 1),
(4, 'Llave inglesa', 'Herramienta para ajustar', 40, 1),
(5, 'Taladro', 'Herramienta para perforar', 50, 1),
(6, 'Llave de tubo', 'Herramienta para ajustar tuercas', 60, 1),
(7, 'Alicate', 'Herramienta para sujetar y cortar', 70, 1),
(8, 'Destornillador de punta plana', 'Herramienta para atornillar', 80, 1),
(9, 'Cinta métrica', 'Herramienta para medir', 90, 1),
(10, 'Pala', 'Herramienta para cavar', 100, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimiento`
--

CREATE TABLE `movimiento` (
  `id_movimiento` int(11) NOT NULL,
  `id_empleado` int(11) NOT NULL,
  `id_herramienta` int(11) NOT NULL,
  `fechaP` date NOT NULL,
  `fechaD` date DEFAULT NULL,
  `cantidadRet` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `movimiento`
--

INSERT INTO `movimiento` (`id_movimiento`, `id_empleado`, `id_herramienta`, `fechaP`, `fechaD`, `cantidadRet`) VALUES
(1, 1, 1, '2023-10-20', NULL, 1),
(2, 2, 2, '2023-11-19', '2023-12-02', 4),
(3, 3, 3, '2023-12-10', NULL, 1),
(4, 4, 4, '2023-12-15', '2023-12-20', 3),
(5, 5, 5, '2023-12-16', NULL, 1),
(6, 6, 6, '2023-12-17', '2024-02-01', 2),
(7, 7, 7, '2024-01-14', NULL, 1),
(8, 8, 8, '2024-02-13', '2024-04-16', 3),
(9, 9, 9, '2024-03-12', NULL, 1),
(10, 10, 10, '2024-04-11', '2024-04-14', 5);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`id_empleado`),
  ADD UNIQUE KEY `dni` (`dni`);

--
-- Indices de la tabla `herramienta`
--
ALTER TABLE `herramienta`
  ADD PRIMARY KEY (`id_Herramienta`);

--
-- Indices de la tabla `movimiento`
--
ALTER TABLE `movimiento`
  ADD PRIMARY KEY (`id_movimiento`),
  ADD KEY `id_empleado` (`id_empleado`),
  ADD KEY `id_herramienta` (`id_herramienta`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `id_empleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `herramienta`
--
ALTER TABLE `herramienta`
  MODIFY `id_Herramienta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `movimiento`
--
ALTER TABLE `movimiento`
  MODIFY `id_movimiento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `movimiento`
--
ALTER TABLE `movimiento`
  ADD CONSTRAINT `movimiento_ibfk_1` FOREIGN KEY (`id_empleado`) REFERENCES `empleado` (`id_empleado`),
  ADD CONSTRAINT `movimiento_ibfk_2` FOREIGN KEY (`id_herramienta`) REFERENCES `herramienta` (`id_Herramienta`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
