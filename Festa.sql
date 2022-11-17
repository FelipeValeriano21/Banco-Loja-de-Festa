-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 20-Set-2022 às 13:41
-- Versão do servidor: 5.7.36
-- versão do PHP: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `aniversario`
--
CREATE DATABASE IF NOT EXISTS `aniversario` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `aniversario`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `bebida`
--

DROP TABLE IF EXISTS `bebida`;
CREATE TABLE IF NOT EXISTS `bebida` (
  `Produtos_idProdutos` int(10) UNSIGNED NOT NULL,
  `Litros` int(11) DEFAULT NULL,
  `Marca` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`Produtos_idProdutos`),
  KEY `Bebida_FKIndex1` (`Produtos_idProdutos`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `bebida`
--

INSERT INTO `bebida` (`Produtos_idProdutos`, `Litros`, `Marca`) VALUES
(3, 250, 'Coca-Cola'),
(5, 500, 'Del Valle');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

DROP TABLE IF EXISTS `cliente`;
CREATE TABLE IF NOT EXISTS `cliente` (
  `idCliente` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `telefone` int(11) DEFAULT NULL,
  `endereco` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`idCliente`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`idCliente`, `nome`, `email`, `telefone`, `endereco`) VALUES
(1, 'Felipe', 'Felipe@gmail.com', 962849695, 'AvPaulista'),
(2, 'Luan', 'Luan@gmail.com', 962639594, 'RuaFredericoGrotte');

-- --------------------------------------------------------

--
-- Estrutura da tabela `comida`
--

DROP TABLE IF EXISTS `comida`;
CREATE TABLE IF NOT EXISTS `comida` (
  `Produtos_idProdutos` int(10) UNSIGNED NOT NULL,
  `Medida` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Produtos_idProdutos`),
  KEY `Comida_FKIndex1` (`Produtos_idProdutos`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `comida`
--

INSERT INTO `comida` (`Produtos_idProdutos`, `Medida`) VALUES
(1, '1kg'),
(2, '1kg');

-- --------------------------------------------------------

--
-- Estrutura da tabela `enfeite`
--

DROP TABLE IF EXISTS `enfeite`;
CREATE TABLE IF NOT EXISTS `enfeite` (
  `Produtos_idProdutos` int(10) UNSIGNED NOT NULL,
  `Tipo` varchar(20) DEFAULT NULL,
  `Medida` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Produtos_idProdutos`),
  KEY `Enfeite_FKIndex1` (`Produtos_idProdutos`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `enfeite`
--

INSERT INTO `enfeite` (`Produtos_idProdutos`, `Tipo`, `Medida`) VALUES
(4, 'utensilio', 'pequeno'),
(6, 'utensilio', '250ml');

-- --------------------------------------------------------

--
-- Estrutura da tabela `itens_de_pedido`
--

DROP TABLE IF EXISTS `itens_de_pedido`;
CREATE TABLE IF NOT EXISTS `itens_de_pedido` (
  `Pedido_idPedido` int(10) UNSIGNED NOT NULL,
  `Produtos_idProdutos` int(10) UNSIGNED NOT NULL,
  `valor` int(5) DEFAULT NULL,
  `quantidade` int(5) DEFAULT NULL,
  `medida` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Pedido_idPedido`,`Produtos_idProdutos`),
  KEY `Pedido_has_Produtos_FKIndex1` (`Pedido_idPedido`),
  KEY `Pedido_has_Produtos_FKIndex2` (`Produtos_idProdutos`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `itens_de_pedido`
--

INSERT INTO `itens_de_pedido` (`Pedido_idPedido`, `Produtos_idProdutos`, `valor`, `quantidade`, `medida`) VALUES
(1, 1, 50, 1, 'kg'),
(2, 2, 120, 3, 'kg');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedido`
--

DROP TABLE IF EXISTS `pedido`;
CREATE TABLE IF NOT EXISTS `pedido` (
  `idPedido` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Cliente_idCliente` int(11) NOT NULL,
  `Data_Festa` date DEFAULT NULL,
  `Data_Entrega` date DEFAULT NULL,
  `Tipo_Entrega` varchar(20) DEFAULT NULL,
  `Endereco` varchar(30) DEFAULT NULL,
  `Aniversariante` varchar(20) DEFAULT NULL,
  `Tema` varchar(20) DEFAULT NULL,
  `Idade` int(3) DEFAULT NULL,
  `Cor` varchar(20) DEFAULT NULL,
  `Valor` int(5) DEFAULT NULL,
  `Frete` int(5) DEFAULT NULL,
  `Sinal` int(5) DEFAULT NULL,
  `Valor_Final` int(5) DEFAULT NULL,
  PRIMARY KEY (`idPedido`),
  KEY `Pedido_FKIndex1` (`Cliente_idCliente`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `pedido`
--

INSERT INTO `pedido` (`idPedido`, `Cliente_idCliente`, `Data_Festa`, `Data_Entrega`, `Tipo_Entrega`, `Endereco`, `Aniversariante`, `Tema`, `Idade`, `Cor`, `Valor`, `Frete`, `Sinal`, `Valor_Final`) VALUES
(1, 1, '2022-10-09', '2022-10-09', 'Casa', 'RuaGaglianoNetto', 'Geovana', 'Frozen', 12, 'Azul', 250, 50, 0, 300),
(2, 2, '2022-09-30', '2022-09-27', 'Loja', 'Rua Frederico Grotte 322 ', 'Matheus', 'Sao Paulo', 18, 'Vermelho', 120, 30, 50, 100);

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos`
--

DROP TABLE IF EXISTS `produtos`;
CREATE TABLE IF NOT EXISTS `produtos` (
  `idProdutos` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nome` varchar(20) DEFAULT NULL,
  `quantidade` int(5) DEFAULT NULL,
  `valor` int(5) DEFAULT NULL,
  PRIMARY KEY (`idProdutos`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `produtos`
--

INSERT INTO `produtos` (`idProdutos`, `nome`, `quantidade`, `valor`) VALUES
(1, 'Salgado', 100, 45),
(2, 'Bolo', 50, 40),
(3, 'Refrigerante', 60, 4),
(4, 'Prato_Plastico', 500, 5),
(5, 'Suco', 200, 5),
(6, 'Copo', 1000, 10);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
