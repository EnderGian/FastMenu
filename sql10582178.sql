-- phpMyAdmin SQL Dump
-- version 4.7.1
-- https://www.phpmyadmin.net/
--
-- Host: sql10.freesqldatabase.com
-- Generation Time: Dec 07, 2022 at 02:20 AM
-- Server version: 5.5.62-0ubuntu0.14.04.1
-- PHP Version: 7.0.33-0ubuntu0.16.04.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sql10582178`
--

-- --------------------------------------------------------

--
-- Table structure for table `Funcionario`
--

CREATE TABLE `Funcionario` (
  `Id` bigint(20) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Senha` varchar(25) NOT NULL,
  `Username` varchar(25) NOT NULL,
  `Id_Restaurante` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ItemPedidos`
--

CREATE TABLE `ItemPedidos` (
  `Id` bigint(20) NOT NULL,
  `Id_produto` bigint(20) NOT NULL,
  `Id_Pedido` bigint(20) NOT NULL,
  `Preco` decimal(5,2) NOT NULL,
  `quantidade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Pedidos`
--

CREATE TABLE `Pedidos` (
  `Id` bigint(20) NOT NULL,
  `Id_funcionario` bigint(20) NOT NULL,
  `Id_usuario` bigint(20) NOT NULL,
  `Observacao` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Produtos`
--

CREATE TABLE `Produtos` (
  `Id` bigint(20) NOT NULL,
  `Id_Restaurante` bigint(20) NOT NULL,
  `Nome_Prato` varchar(250) NOT NULL,
  `Preco` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Restaurante`
--

CREATE TABLE `Restaurante` (
  `Id` bigint(20) NOT NULL,
  `Nome` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Usuarios`
--

CREATE TABLE `Usuarios` (
  `Id` int(6) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Senha` varchar(25) NOT NULL,
  `Username` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Usuarios`
--

INSERT INTO `Usuarios` (`Id`, `Email`, `Senha`, `Username`) VALUES
(1, 'abcde@hotmail.com', '1234567', 'carlos eduardo');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Funcionario`
--
ALTER TABLE `Funcionario`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD KEY `Restaurante` (`Id_Restaurante`);

--
-- Indexes for table `ItemPedidos`
--
ALTER TABLE `ItemPedidos`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Id_Pedido` (`Id_Pedido`),
  ADD KEY `Id_Produto` (`Id_produto`);

--
-- Indexes for table `Pedidos`
--
ALTER TABLE `Pedidos`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Id_Funcionario` (`Id_funcionario`),
  ADD KEY `Id_Usuario` (`Id_usuario`);

--
-- Indexes for table `Produtos`
--
ALTER TABLE `Produtos`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Id_Restaurante` (`Id_Restaurante`);

--
-- Indexes for table `Restaurante`
--
ALTER TABLE `Restaurante`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `Usuarios`
--
ALTER TABLE `Usuarios`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Funcionario`
--
ALTER TABLE `Funcionario`
  MODIFY `Id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ItemPedidos`
--
ALTER TABLE `ItemPedidos`
  MODIFY `Id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Pedidos`
--
ALTER TABLE `Pedidos`
  MODIFY `Id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Produtos`
--
ALTER TABLE `Produtos`
  MODIFY `Id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Restaurante`
--
ALTER TABLE `Restaurante`
  MODIFY `Id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Usuarios`
--
ALTER TABLE `Usuarios`
  MODIFY `Id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `Funcionario`
--
ALTER TABLE `Funcionario`
  ADD CONSTRAINT `Restaurante` FOREIGN KEY (`Id_Restaurante`) REFERENCES `Restaurante` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `ItemPedidos`
--
ALTER TABLE `ItemPedidos`
  ADD CONSTRAINT `Id_Produto` FOREIGN KEY (`Id_produto`) REFERENCES `Produtos` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `Id_Pedido` FOREIGN KEY (`Id_Pedido`) REFERENCES `Pedidos` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Pedidos`
--
ALTER TABLE `Pedidos`
  ADD CONSTRAINT `Id_Usuario` FOREIGN KEY (`Id_usuario`) REFERENCES `Funcionario` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `Id_Funcionario` FOREIGN KEY (`Id_funcionario`) REFERENCES `Funcionario` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Produtos`
--
ALTER TABLE `Produtos`
  ADD CONSTRAINT `Id_Restaurante` FOREIGN KEY (`Id_Restaurante`) REFERENCES `Restaurante` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
