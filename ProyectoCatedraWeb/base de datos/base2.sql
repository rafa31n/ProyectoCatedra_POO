-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: telecomunicacion2-mysql.services.clever-cloud.com:3306
-- Generation Time: May 05, 2022 at 07:48 PM
-- Server version: 8.0.15-5
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `telecomunicacion2`
--
CREATE DATABASE IF NOT EXISTS `telecomunicacion2` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `telecomunicacion2`;

-- --------------------------------------------------------

--
-- Table structure for table `argumento`
--

CREATE TABLE `argumento` (
  `id_argumento` int(11) NOT NULL,
  `id_caso` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `argumentos_descripcion` varchar(200) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bitacora`
--

CREATE TABLE `bitacora` (
  `id_bitacora` int(11) NOT NULL,
  `id_caso` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `titulo_bitacora` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `descripcion_bitacora` varchar(150) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `fecha_bitacora` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cargo`
--

CREATE TABLE `cargo` (
  `id_cargo` int(11) NOT NULL,
  `nombre_cargo` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `cargo`
--

INSERT INTO `cargo` (`id_cargo`, `nombre_cargo`) VALUES
(1, 'programador'),
(2, 'admin'),
(3, 'jefe de Area'),
(4, 'jefe de Desarrollo'),
(5, 'tester');

-- --------------------------------------------------------

--
-- Table structure for table `caso`
--

CREATE TABLE `caso` (
  `id_caso` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `id_estado` int(11) NOT NULL,
  `id_departamento` int(11) NOT NULL,
  `progreso` decimal(10,0) NOT NULL,
  `titulo` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `descripcion` varchar(150) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `pdf_caso` blob,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_final` date DEFAULT NULL,
  `fecha_creacion` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `caso`
--

INSERT INTO `caso` (`id_caso`, `id_estado`, `id_departamento`, `progreso`, `titulo`, `descripcion`, `pdf_caso`, `fecha_inicio`, `fecha_final`, `fecha_creacion`) VALUES
('AAAAAenproceso', 1, 1, '0', 'ssaas', 'ds', NULL, NULL, NULL, '2022-04-18'),
('aaaad232', 4, 1, '0', 'das', '12', NULL, NULL, NULL, '2022-04-18');

-- --------------------------------------------------------

--
-- Table structure for table `casos_finalizados`
--

CREATE TABLE `casos_finalizados` (
  `id_CasoFinalizado` int(11) NOT NULL,
  `id_caso` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `fecha_produccion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Table structure for table `departamento`
--

CREATE TABLE `departamento` (
  `id_departamento` int(11) NOT NULL,
  `nombre_departamento` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `departamento`
--

INSERT INTO `departamento` (`id_departamento`, `nombre_departamento`) VALUES
(1, 'Desarrollo de software'),
(2, 'Finanzas'),
(3, 'Ventas'),
(4, 'Facturación fija'),
(6, 'Facturacion Movil');

-- --------------------------------------------------------

--
-- Table structure for table `estado`
--

CREATE TABLE `estado` (
  `id_estado` int(11) NOT NULL,
  `nombre_estado` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `estado`
--

INSERT INTO `estado` (`id_estado`, `nombre_estado`) VALUES
(1, 'en proceso'),
(2, 'vencido'),
(3, 'finalizado'),
(4, 'en espera de respuesta'),
(5, 'solicitud rechazada'),
(6, 'esperando aprobacion de área solicitante'),
(7, 'Devuelto con observaciones');

-- --------------------------------------------------------

--
-- Table structure for table `historial_caso`
--

CREATE TABLE `historial_caso` (
  `id_historial` int(11) NOT NULL,
  `id_caso` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `Fecha_Hora_historial` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `descripcion_historial` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `observacion`
--

CREATE TABLE `observacion` (
  `id_observacion` int(11) NOT NULL,
  `id_caso` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `descripcion_observacion` varchar(150) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Table structure for table `probador_caso`
--

CREATE TABLE `probador_caso` (
  `id_testing` int(11) NOT NULL,
  `id_caso` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `probador_caso`
--

INSERT INTO `probador_caso` (`id_testing`, `id_caso`, `id_usuario`) VALUES
(9, 'AAAAAenproceso', 9);

-- --------------------------------------------------------

--
-- Table structure for table `programador_caso`
--

CREATE TABLE `programador_caso` (
  `id_programador_caso` int(11) NOT NULL,
  `id_caso` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `programador_caso`
--

INSERT INTO `programador_caso` (`id_programador_caso`, `id_caso`, `id_usuario`) VALUES
(1, 'AAAAAenproceso', 1),
(2, 'aaaad232', 1);

-- --------------------------------------------------------

--
-- Table structure for table `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `nombre_usuario` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `apellido_usuario` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `username_usuario` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `contrasena_usuario` int(50) NOT NULL,
  `id_departamento` int(11) NOT NULL,
  `id_cargo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nombre_usuario`, `apellido_usuario`, `username_usuario`, `contrasena_usuario`, `id_departamento`, `id_cargo`) VALUES
(1, 'Mario', 'taza', 'Mario1', 123, 1, 1),
(2, 'luis', '', 'admin', 123, 1, 2),
(3, 'marco', '', '0', 123, 1, 3),
(5, 'Loa progranm', '', '0', 123, 2, 1),
(7, 'programador2', '', '0', 123, 1, 1),
(8, 'jefed', '', '0', 123, 1, 4),
(9, 'probador', '', 'tester', 123, 1, 5),
(10, 'probador2', '', '0', 123, 1, 5),
(13, 'jefe2', '', '0', 123, 2, 4),
(14, 'ministro', 'aaa', 'adminFi', 123, 2, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `argumento`
--
ALTER TABLE `argumento`
  ADD PRIMARY KEY (`id_argumento`),
  ADD KEY `id_caso` (`id_caso`);

--
-- Indexes for table `bitacora`
--
ALTER TABLE `bitacora`
  ADD PRIMARY KEY (`id_bitacora`),
  ADD KEY `id_caso` (`id_caso`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indexes for table `cargo`
--
ALTER TABLE `cargo`
  ADD PRIMARY KEY (`id_cargo`);

--
-- Indexes for table `caso`
--
ALTER TABLE `caso`
  ADD PRIMARY KEY (`id_caso`),
  ADD KEY `caso_ibfk_1` (`id_estado`),
  ADD KEY `caso_ibfk_2` (`id_departamento`);

--
-- Indexes for table `casos_finalizados`
--
ALTER TABLE `casos_finalizados`
  ADD PRIMARY KEY (`id_CasoFinalizado`),
  ADD KEY `id_caso` (`id_caso`);

--
-- Indexes for table `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`id_departamento`);

--
-- Indexes for table `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`id_estado`);

--
-- Indexes for table `historial_caso`
--
ALTER TABLE `historial_caso`
  ADD PRIMARY KEY (`id_historial`),
  ADD KEY `historial_caso_ibfk_30` (`id_usuario`),
  ADD KEY `id_caso` (`id_caso`);

--
-- Indexes for table `observacion`
--
ALTER TABLE `observacion`
  ADD PRIMARY KEY (`id_observacion`),
  ADD KEY `id_caso` (`id_caso`);

--
-- Indexes for table `probador_caso`
--
ALTER TABLE `probador_caso`
  ADD PRIMARY KEY (`id_testing`),
  ADD KEY `id_caso` (`id_caso`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indexes for table `programador_caso`
--
ALTER TABLE `programador_caso`
  ADD PRIMARY KEY (`id_programador_caso`),
  ADD KEY `id_caso` (`id_caso`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `id_departamento` (`id_departamento`),
  ADD KEY `id_cargo` (`id_cargo`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `argumento`
--
ALTER TABLE `argumento`
  MODIFY `id_argumento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bitacora`
--
ALTER TABLE `bitacora`
  MODIFY `id_bitacora` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `cargo`
--
ALTER TABLE `cargo`
  MODIFY `id_cargo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `casos_finalizados`
--
ALTER TABLE `casos_finalizados`
  MODIFY `id_CasoFinalizado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `departamento`
--
ALTER TABLE `departamento`
  MODIFY `id_departamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `estado`
--
ALTER TABLE `estado`
  MODIFY `id_estado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `historial_caso`
--
ALTER TABLE `historial_caso`
  MODIFY `id_historial` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `observacion`
--
ALTER TABLE `observacion`
  MODIFY `id_observacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `probador_caso`
--
ALTER TABLE `probador_caso`
  MODIFY `id_testing` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `programador_caso`
--
ALTER TABLE `programador_caso`
  MODIFY `id_programador_caso` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `argumento`
--
ALTER TABLE `argumento`
  ADD CONSTRAINT `argumento_ibfk_1` FOREIGN KEY (`id_caso`) REFERENCES `caso` (`id_caso`);

--
-- Constraints for table `bitacora`
--
ALTER TABLE `bitacora`
  ADD CONSTRAINT `bitacora_ibfk_1` FOREIGN KEY (`id_caso`) REFERENCES `caso` (`id_caso`),
  ADD CONSTRAINT `bitacora_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);

--
-- Constraints for table `caso`
--
ALTER TABLE `caso`
  ADD CONSTRAINT `caso_ibfk_1` FOREIGN KEY (`id_estado`) REFERENCES `estado` (`id_estado`),
  ADD CONSTRAINT `caso_ibfk_2` FOREIGN KEY (`id_departamento`) REFERENCES `departamento` (`id_departamento`);

--
-- Constraints for table `casos_finalizados`
--
ALTER TABLE `casos_finalizados`
  ADD CONSTRAINT `casos_finalizados_ibfk_1` FOREIGN KEY (`id_caso`) REFERENCES `caso` (`id_caso`);

--
-- Constraints for table `historial_caso`
--
ALTER TABLE `historial_caso`
  ADD CONSTRAINT `historial_caso_ibfk_30` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `historial_caso_ibfk_31` FOREIGN KEY (`id_caso`) REFERENCES `caso` (`id_caso`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `observacion`
--
ALTER TABLE `observacion`
  ADD CONSTRAINT `observacion_ibfk_1` FOREIGN KEY (`id_caso`) REFERENCES `caso` (`id_caso`);

--
-- Constraints for table `probador_caso`
--
ALTER TABLE `probador_caso`
  ADD CONSTRAINT `probador_caso_ibfk_1` FOREIGN KEY (`id_caso`) REFERENCES `caso` (`id_caso`),
  ADD CONSTRAINT `probador_caso_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);

--
-- Constraints for table `programador_caso`
--
ALTER TABLE `programador_caso`
  ADD CONSTRAINT `programador_caso_ibfk_1` FOREIGN KEY (`id_caso`) REFERENCES `caso` (`id_caso`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `programador_caso_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`id_departamento`) REFERENCES `departamento` (`id_departamento`),
  ADD CONSTRAINT `usuario_ibfk_2` FOREIGN KEY (`id_cargo`) REFERENCES `cargo` (`id_cargo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
