-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-03-2022 a las 16:32:23
-- Versión del servidor: 10.4.19-MariaDB
-- Versión de PHP: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cajero`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cajero`
--

CREATE TABLE `cajero` (
  `ID_CAJERO` int(11) NOT NULL,
  `NOMBRE_CAJERO` char(50) DEFAULT NULL,
  `CEDULA_CAJERO` char(50) DEFAULT NULL,
  `ACTIVO_CAJERO` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cajero`
--

INSERT INTO `cajero` (`ID_CAJERO`, `NOMBRE_CAJERO`, `CEDULA_CAJERO`, `ACTIVO_CAJERO`) VALUES
(1, 'Alejandra Martinez', '1722188198', 1),
(2, 'Marco Zambrano', '1726568465', 1),
(3, 'Ismael Cañas', '1722345464', 1),
(4, 'Melanie Guerrero', '2315894126', 1),
(5, 'Estafano Gorgolio', '0801546689', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `ID_CLIENTE` int(11) NOT NULL,
  `NOMBRE_CLIENTE` char(50) DEFAULT NULL,
  `APELLIDO_CLIENTE` char(50) DEFAULT NULL,
  `CEDULA_CLIENTE` char(12) DEFAULT NULL,
  `TELEFONO_CLIENTE` char(15) DEFAULT NULL,
  `FECHANACIMIENTO_CLIENTE` date DEFAULT NULL,
  `SEXO_CLIENTE` char(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`ID_CLIENTE`, `NOMBRE_CLIENTE`, `APELLIDO_CLIENTE`, `CEDULA_CLIENTE`, `TELEFONO_CLIENTE`, `FECHANACIMIENTO_CLIENTE`, `SEXO_CLIENTE`) VALUES
(1, 'Joel', 'Velasco', '1726944026', '0981223926', '1997-12-24', 'Masculino'),
(2, 'Miguel', 'Castillo', '2548165843', '0954842545', '1998-06-22', 'Masculino'),
(3, 'Ernesto', 'Bahamonde', '1727409748', '0944564684', '1998-02-12', 'Masculino');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuenta_bancaria`
--

CREATE TABLE `cuenta_bancaria` (
  `ID_CUENTABANCARIA` int(11) NOT NULL,
  `ID_CLIENTE` int(11) DEFAULT NULL,
  `TIPO_CUENTABANCARIA` char(30) NOT NULL,
  `FECHACREACION_CUENTABANCARIA` date DEFAULT NULL,
  `SALDO_CUENTABANCARIA` float(8,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cuenta_bancaria`
--

INSERT INTO `cuenta_bancaria` (`ID_CUENTABANCARIA`, `ID_CLIENTE`, `TIPO_CUENTABANCARIA`, `FECHACREACION_CUENTABANCARIA`, `SALDO_CUENTABANCARIA`) VALUES
(1, 1, 'Ahorros', '2021-09-13', 3037.00),
(2, 2, 'Corriente', '2021-09-13', 2050.00),
(3, 3, 'Ahorros', '2021-09-13', 550.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarjeta`
--

CREATE TABLE `tarjeta` (
  `ID_TARJETA` int(11) NOT NULL,
  `ID_CUENTABANCARIA` int(11) DEFAULT NULL,
  `CONTRASENA_TARJETA` char(20) DEFAULT NULL,
  `FECHACREACION_TARJETA` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tarjeta`
--

INSERT INTO `tarjeta` (`ID_TARJETA`, `ID_CUENTABANCARIA`, `CONTRASENA_TARJETA`, `FECHACREACION_TARJETA`) VALUES
(1, 1, '12345', '2021-09-13'),
(2, 2, '12345', '2021-09-13'),
(3, 3, '12345', '2021-09-13');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transaccion`
--

CREATE TABLE `transaccion` (
  `ID_TRANSACCION` int(11) NOT NULL,
  `ID_CLIENTE` int(11) DEFAULT NULL,
  `ID_CAJERO` int(11) DEFAULT NULL,
  `ID_CUENTABANCARIA` int(11) DEFAULT NULL,
  `FECHA_TRANSACCION` datetime NOT NULL,
  `TIPO_TRANSACCION` char(50) DEFAULT NULL,
  `CANTIDAD_TRANSACCION` float(8,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `transaccion`
--

INSERT INTO `transaccion` (`ID_TRANSACCION`, `ID_CLIENTE`, `ID_CAJERO`, `ID_CUENTABANCARIA`, `FECHA_TRANSACCION`, `TIPO_TRANSACCION`, `CANTIDAD_TRANSACCION`) VALUES
(1, 1, 1, 1, '2021-08-13 00:00:00', 'Retiro', 50.00),
(2, 1, 1, 1, '2021-09-01 00:00:00', 'Deposito', 50.00),
(3, 1, 1, 1, '2021-09-08 00:00:00', 'Retiro', 50.00),
(4, 1, 1, 1, '2021-09-14 00:00:00', 'Deposito', 50.00),
(5, 1, 1, 1, '2021-09-14 00:00:00', 'Retiro', 5.00),
(6, 1, 1, 1, '2021-09-14 00:00:00', 'Deposito', 50.00),
(7, 1, 2, 1, '2022-02-24 00:00:00', 'Deposito', 1.00),
(8, 1, 1, 1, '2022-02-24 00:00:00', 'Deposito', 20.00),
(9, 1, 1, 1, '2022-02-24 00:00:00', 'Deposito', 20.00),
(10, 1, 1, 1, '2022-02-24 00:00:00', 'Deposito', 20.00),
(11, 1, 1, 1, '2022-02-24 00:00:00', 'Deposito', 10.00),
(12, 1, 1, 1, '2022-02-24 00:00:00', 'Deposito', 20.00),
(13, 1, 1, 1, '2022-02-24 00:00:00', 'Deposito', 20.00),
(14, 1, 1, 1, '2022-02-24 00:00:00', 'Deposito', 23.00),
(15, 1, 1, 1, '2022-02-24 00:00:00', 'Deposito', 20.00),
(16, 1, 1, 1, '2022-02-24 00:00:00', 'Deposito', 20.00),
(17, 1, 1, 1, '2022-02-24 00:00:00', 'Deposito', 10.00),
(18, 1, 1, 1, '2022-02-24 00:00:00', 'Deposito', 20.00),
(19, 1, 1, 1, '2022-02-24 00:00:00', 'Deposito', 12.00),
(20, 1, 1, 1, '2022-02-24 00:00:00', 'Deposito', 2.00),
(21, 1, 1, 1, '2022-02-24 00:00:00', 'Deposito', 2.00),
(22, 1, 1, 1, '2022-02-24 00:00:00', 'Deposito', 1.00),
(23, 1, 1, 1, '2022-02-24 00:00:00', 'Deposito', 1.00),
(24, 1, 1, 1, '2022-02-24 00:00:00', 'Deposito', 2.00),
(25, 1, 1, 1, '2022-02-24 00:00:00', 'Deposito', 2.00),
(26, 1, 1, 1, '2022-02-24 00:00:00', 'Deposito', 2.00),
(27, 1, 1, 1, '2022-02-24 00:00:00', 'Deposito', 1.00),
(28, 1, 1, 1, '2022-02-24 00:00:00', 'Deposito', 23.00),
(29, 1, 1, 1, '2022-02-24 00:00:00', 'Deposito', 2.00),
(30, 1, 1, 1, '2022-02-24 00:00:00', 'Deposito', 2.00),
(31, 1, 1, 1, '2022-02-24 00:00:00', 'Deposito', 1.00),
(32, 1, 1, 1, '2022-02-24 00:00:00', 'Deposito', 2.00),
(33, 1, 1, 1, '2022-02-25 00:00:00', 'Deposito', 21.00),
(34, 1, 1, 1, '2022-02-25 00:00:00', 'Deposito', 23.00),
(35, 1, 1, 1, '2022-02-25 00:00:00', 'Deposito', 2.00),
(36, 1, 1, 1, '2022-02-25 00:00:00', 'Deposito', 2.00),
(37, 1, 1, 1, '2022-02-25 00:00:00', 'Deposito', 2.00),
(38, 1, 1, 1, '2022-02-25 00:00:00', 'Deposito', 23.00),
(39, 1, 1, 1, '2022-02-25 00:00:00', 'Deposito', 2.00),
(40, 1, 1, 1, '2022-02-25 00:00:00', 'Deposito', 2.00),
(42, 1, 1, 1, '2022-02-25 00:00:00', 'Deposito', 2.00),
(43, 1, 1, 1, '2022-02-25 00:00:00', 'Deposito', 4.00),
(44, 1, 1, 1, '2022-02-25 00:00:00', 'Retiro', 2.00),
(45, 1, 2, 1, '2022-02-25 00:00:00', 'Retiro', 3.00),
(46, 1, 1, 1, '2022-02-25 00:00:00', 'Retiro', 3.00),
(47, 1, 1, 1, '2022-02-25 00:00:00', 'Retiro', 2.00),
(48, 1, 2, 1, '2022-02-25 00:00:00', 'Deposito', 3.00),
(49, 1, 1, 1, '2022-02-25 00:00:00', 'Deposito', 44.00),
(50, 1, 1, 1, '2022-02-25 00:00:00', 'Deposito', 23.00),
(51, 1, 1, 1, '2022-02-25 00:00:00', 'Deposito', 234.00),
(52, 1, 1, 1, '2022-02-25 00:00:00', 'Retiro', 32.00),
(53, 1, 1, 1, '2022-02-25 00:00:00', 'Retiro', 23.00),
(54, 1, 1, 1, '2022-02-25 00:00:00', 'Deposito', 1.00),
(55, 1, 1, 1, '2022-02-25 00:00:00', 'Retiro', 1.00),
(56, 1, 1, 1, '2022-02-25 00:00:00', 'Retiro', 12.00),
(57, 1, 1, 1, '2022-02-25 00:00:00', 'Deposito', 23.00),
(58, 1, 1, 1, '2022-02-25 00:00:00', 'Deposito', 23.00),
(59, 1, 1, 1, '2022-02-25 00:00:00', 'Deposito', 234.00),
(60, 1, 1, 1, '2022-02-25 00:00:00', 'Deposito', 12.00),
(61, 1, 1, 1, '2022-02-25 00:00:00', 'Retiro', 12.00),
(62, 1, 1, 1, '2022-02-25 00:00:00', 'Retiro', 3.00),
(63, 1, 1, 1, '2022-02-25 00:00:00', 'Deposito', 2.00),
(64, 1, 1, 1, '2022-02-25 00:00:00', 'Deposito', 23.00),
(65, 1, 1, 1, '2022-02-25 00:00:00', 'Retiro', 54.00),
(66, 1, 1, 1, '2022-02-25 00:00:00', 'Retiro', 23.00),
(67, 1, 1, 1, '2022-02-25 00:00:00', 'Retiro', 23.00),
(68, 1, 1, 1, '2022-02-25 00:00:00', 'Deposito', 232.00),
(69, 1, 1, 1, '2022-02-25 00:00:00', 'Deposito', 23.00),
(70, 1, 1, 1, '2022-02-25 00:00:00', 'Retiro', 2.00),
(71, 1, 1, 1, '2022-02-25 00:00:00', 'Deposito', 23.00),
(72, 1, 1, 1, '2022-02-25 00:00:00', 'Deposito', 3.00),
(73, 1, 1, 1, '2022-02-25 00:00:00', 'Deposito', 2.00),
(74, 1, 1, 1, '2022-02-25 00:00:00', 'Retiro', 23.00),
(75, 1, 1, 1, '2022-02-25 00:00:00', 'Retiro', 23.00),
(76, 1, 1, 1, '2022-02-25 00:00:00', 'Deposito', 76.00),
(77, 1, 1, 1, '2022-02-25 00:00:00', 'Deposito', 2.00),
(78, 1, 1, 1, '2022-02-25 00:00:00', 'Deposito', 2.00),
(79, 1, 1, 1, '2022-02-25 00:00:00', 'Deposito', 2.00),
(80, 1, 1, 1, '2022-02-25 00:00:00', 'Retiro', 1.00),
(81, 1, 1, 1, '2022-02-25 00:00:00', 'Deposito', 1.00);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cajero`
--
ALTER TABLE `cajero`
  ADD PRIMARY KEY (`ID_CAJERO`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`ID_CLIENTE`);

--
-- Indices de la tabla `cuenta_bancaria`
--
ALTER TABLE `cuenta_bancaria`
  ADD PRIMARY KEY (`ID_CUENTABANCARIA`),
  ADD KEY `FK_RELATIONSHIP_1` (`ID_CLIENTE`);

--
-- Indices de la tabla `tarjeta`
--
ALTER TABLE `tarjeta`
  ADD PRIMARY KEY (`ID_TARJETA`),
  ADD KEY `FK_RELATIONSHIP_4` (`ID_CUENTABANCARIA`);

--
-- Indices de la tabla `transaccion`
--
ALTER TABLE `transaccion`
  ADD PRIMARY KEY (`ID_TRANSACCION`),
  ADD KEY `FK_RELATIONSHIP_2` (`ID_CLIENTE`),
  ADD KEY `FK_RELATIONSHIP_3` (`ID_CAJERO`),
  ADD KEY `FK_RELATIONSHIP_5` (`ID_CUENTABANCARIA`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cajero`
--
ALTER TABLE `cajero`
  MODIFY `ID_CAJERO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `ID_CLIENTE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `cuenta_bancaria`
--
ALTER TABLE `cuenta_bancaria`
  MODIFY `ID_CUENTABANCARIA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tarjeta`
--
ALTER TABLE `tarjeta`
  MODIFY `ID_TARJETA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `transaccion`
--
ALTER TABLE `transaccion`
  MODIFY `ID_TRANSACCION` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cuenta_bancaria`
--
ALTER TABLE `cuenta_bancaria`
  ADD CONSTRAINT `FK_RELATIONSHIP_1` FOREIGN KEY (`ID_CLIENTE`) REFERENCES `clientes` (`ID_CLIENTE`);

--
-- Filtros para la tabla `tarjeta`
--
ALTER TABLE `tarjeta`
  ADD CONSTRAINT `FK_RELATIONSHIP_4` FOREIGN KEY (`ID_CUENTABANCARIA`) REFERENCES `cuenta_bancaria` (`ID_CUENTABANCARIA`);

--
-- Filtros para la tabla `transaccion`
--
ALTER TABLE `transaccion`
  ADD CONSTRAINT `FK_RELATIONSHIP_2` FOREIGN KEY (`ID_CLIENTE`) REFERENCES `clientes` (`ID_CLIENTE`),
  ADD CONSTRAINT `FK_RELATIONSHIP_3` FOREIGN KEY (`ID_CAJERO`) REFERENCES `cajero` (`ID_CAJERO`),
  ADD CONSTRAINT `FK_RELATIONSHIP_5` FOREIGN KEY (`ID_CUENTABANCARIA`) REFERENCES `cuenta_bancaria` (`ID_CUENTABANCARIA`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
