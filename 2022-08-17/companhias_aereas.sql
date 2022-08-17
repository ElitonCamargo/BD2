-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 28-Maio-2021 às 19:39
-- Versão do servidor: 8.0.21
-- versão do PHP: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `companhias_aereas`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `aeroporto`
--

DROP TABLE IF EXISTS `aeroporto`;
CREATE TABLE IF NOT EXISTS `aeroporto` (
  `CodigoAeroporto` char(3) NOT NULL,
  `NomeAeroporto` varchar(50) NOT NULL,
  `CodigoMunicipio` int NOT NULL,
  PRIMARY KEY (`CodigoAeroporto`),
  KEY `FK_AeroportoMunicipio` (`CodigoMunicipio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `aeroporto`
--

INSERT INTO `aeroporto` (`CodigoAeroporto`, `NomeAeroporto`, `CodigoMunicipio`) VALUES
('CGH', 'CONGONHAS', 1),
('CPQ', 'VIRACOPOS', 2),
('EZE', 'BUENOS AIRES', 12),
('FLN', 'FLORIANÓPOLIS', 7),
('GIG', 'GALEÃO', 17),
('GRU', 'CUMBICA - INTERNACIONAL DE GUARULHOS', 16),
('NYK', 'KENNEDY', 18),
('NYL', 'LA GUARDIA', 18),
('PAC', 'CHARLES DE GAULLE', 13),
('RAO', 'RIBEIRÃO PRETO', 3),
('ROM', 'ROME INTERNATIONAL', 14),
('SDU', 'SANTOS DUMONT', 17),
('VIX', 'VITÓRIA', 9);

-- --------------------------------------------------------

--
-- Estrutura da tabela `aviao`
--

DROP TABLE IF EXISTS `aviao`;
CREATE TABLE IF NOT EXISTS `aviao` (
  `CodigoAviao` int NOT NULL,
  `ModeloAviao` varchar(30) NOT NULL,
  `PassageirosAviao` decimal(3,0) DEFAULT NULL,
  `CapacidadeCarga` decimal(10,2) DEFAULT NULL,
  `CodigoCompanhia` int NOT NULL,
  PRIMARY KEY (`CodigoAviao`),
  KEY `FK_AviaoCompanhia` (`CodigoCompanhia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `aviao`
--

INSERT INTO `aviao` (`CodigoAviao`, `ModeloAviao`, `PassageirosAviao`, `CapacidadeCarga`, `CodigoCompanhia`) VALUES
(1, 'AIRBUS A300-600', '267', '165000.00', 2),
(2, 'AIRBUS A340-300', '295', '275000.00', 1),
(3, 'ANTONOV AN-124 RUSLAN CONDOR', '88', '405000.00', 7),
(4, 'BOEING 777-200', '320', '247210.00', 3),
(5, 'BOEING 767-400', '375', '204120.00', 1),
(6, 'FOKKER 100', '108', '45810.00', 4),
(7, 'McDONNELL DOUGLAS MD11', '280', '285990.00', 1),
(8, 'EMBRAER ERJ 145', '50', '20600.00', 3),
(9, 'McDONNELL DOUGLAS MD07', NULL, '285990.00', 5),
(10, 'FOKKER 70', NULL, '43714.00', 6);

-- --------------------------------------------------------

--
-- Estrutura da tabela `companhiaaerea`
--

DROP TABLE IF EXISTS `companhiaaerea`;
CREATE TABLE IF NOT EXISTS `companhiaaerea` (
  `CodigoCompanhia` int NOT NULL,
  `NomeCompanhia` varchar(30) NOT NULL,
  PRIMARY KEY (`CodigoCompanhia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `companhiaaerea`
--

INSERT INTO `companhiaaerea` (`CodigoCompanhia`, `NomeCompanhia`) VALUES
(1, 'VARIG'),
(2, 'DELTA AIRLINES'),
(3, 'TAM'),
(4, 'GOL'),
(5, 'BRA'),
(6, 'LAN CHILE'),
(7, 'AEROLINEAS ARGENTINAS'),
(8, 'AIR FRANCE'),
(9, 'Azul');

-- --------------------------------------------------------

--
-- Estrutura da tabela `escalas`
--

DROP TABLE IF EXISTS `escalas`;
CREATE TABLE IF NOT EXISTS `escalas` (
  `CodigoVoo` char(6) NOT NULL,
  `DataEscala` date NOT NULL,
  `CodigoAeroporto` char(3) NOT NULL,
  `CodigoPiloto` char(4) NOT NULL,
  `CodigoAviao` int NOT NULL,
  PRIMARY KEY (`CodigoVoo`,`DataEscala`,`CodigoAeroporto`),
  KEY `CodigoAeroporto` (`CodigoAeroporto`),
  KEY `CodigoPiloto` (`CodigoPiloto`),
  KEY `CodigoAviao` (`CodigoAviao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `escalas`
--

INSERT INTO `escalas` (`CodigoVoo`, `DataEscala`, `CodigoAeroporto`, `CodigoPiloto`, `CodigoAviao`) VALUES
('CO2509', '2012-01-10', 'NYK', 'C005', 4),
('CO2509', '2012-02-10', 'NYK', 'C005', 4),
('CO2509', '2012-03-10', 'NYK', 'C005', 4),
('CO2509', '2012-04-10', 'NYK', 'C005', 4),
('CO2509', '2012-05-10', 'NYK', 'C005', 4),
('CO2509', '2012-06-10', 'NYK', 'C005', 4),
('CO2509', '2012-07-10', 'NYK', 'C005', 4),
('CO2509', '2012-08-10', 'NYK', 'C005', 4),
('CO2511', '2012-01-08', 'NYK', 'P008', 7),
('CO2511', '2012-02-08', 'NYK', 'P008', 7),
('CO2511', '2012-03-08', 'NYK', 'P008', 7),
('CO2511', '2012-04-08', 'NYK', 'P008', 7),
('CO2511', '2012-05-08', 'NYK', 'P008', 7),
('CO2511', '2012-06-08', 'NYK', 'P008', 7),
('CO2511', '2012-07-08', 'NYK', 'P008', 7),
('CO2511', '2012-08-08', 'NYK', 'P008', 7),
('JJ1423', '2012-01-07', 'CPQ', 'P004', 5),
('JJ1423', '2012-02-07', 'CPQ', 'P004', 5),
('JJ1423', '2012-03-07', 'CPQ', 'P004', 5),
('JJ1423', '2012-04-07', 'CPQ', 'P004', 5),
('JJ1423', '2012-05-07', 'CPQ', 'P004', 5),
('JJ1423', '2012-06-07', 'CPQ', 'P004', 5),
('JJ1423', '2012-07-07', 'CPQ', 'P004', 5),
('JJ1423', '2012-08-07', 'CPQ', 'P004', 5),
('JJ1828', '2012-01-09', 'GIG', 'P002', 7),
('JJ1828', '2012-02-09', 'GIG', 'P002', 7),
('JJ1828', '2012-03-09', 'GIG', 'P002', 7),
('JJ1828', '2012-04-09', 'GIG', 'P002', 7),
('JJ1828', '2012-05-09', 'GIG', 'P002', 7),
('JJ1828', '2012-06-09', 'GIG', 'P002', 7),
('JJ1828', '2012-07-09', 'GIG', 'P002', 7),
('JJ1828', '2012-08-09', 'GIG', 'P002', 7),
('KJ1422', '2012-01-01', 'GIG', 'P007', 2),
('KJ1422', '2012-02-01', 'GIG', 'P007', 2),
('KJ1422', '2012-03-01', 'GIG', 'P007', 2),
('KJ1422', '2012-04-01', 'GIG', 'P007', 2),
('KJ1422', '2012-05-01', 'GIG', 'P007', 2),
('KJ1422', '2012-06-01', 'GIG', 'P007', 2),
('KJ1422', '2012-07-01', 'GIG', 'P007', 2),
('KJ1422', '2012-08-01', 'GIG', 'P007', 2),
('KJ1423', '2012-01-09', 'PAC', 'P001', 8),
('KJ1423', '2012-02-09', 'PAC', 'P001', 8),
('KJ1423', '2012-03-09', 'PAC', 'P001', 8),
('KJ1423', '2012-04-09', 'PAC', 'P001', 8),
('KJ1423', '2012-05-09', 'PAC', 'P001', 8),
('KJ1423', '2012-06-09', 'PAC', 'P001', 8),
('KJ1423', '2012-07-09', 'PAC', 'P001', 8),
('KJ1423', '2012-08-09', 'PAC', 'P001', 8),
('KJ7408', '2012-01-04', 'FLN', 'P008', 1),
('KJ7408', '2012-02-04', 'FLN', 'P008', 1),
('KJ7408', '2012-03-04', 'FLN', 'P008', 1),
('KJ7408', '2012-04-04', 'FLN', 'P008', 1),
('KJ7408', '2012-05-04', 'FLN', 'P008', 1),
('KJ7408', '2012-06-04', 'FLN', 'P008', 1),
('KJ7408', '2012-07-04', 'FLN', 'P008', 1),
('KJ7408', '2012-08-04', 'FLN', 'P008', 1),
('KJ7409', '2012-01-08', 'FLN', 'P003', 6),
('KJ7409', '2012-02-08', 'FLN', 'P003', 6),
('KJ7409', '2012-03-08', 'FLN', 'P003', 6),
('KJ7409', '2012-04-08', 'FLN', 'P003', 6),
('KJ7409', '2012-05-08', 'FLN', 'P003', 6),
('KJ7409', '2012-06-08', 'FLN', 'P003', 6),
('KJ7409', '2012-07-08', 'FLN', 'P003', 6),
('KJ7409', '2012-08-08', 'FLN', 'P003', 6),
('TY0911', '2012-01-11', 'EZE', 'C006', 3),
('TY0911', '2012-02-11', 'EZE', 'C006', 3),
('TY0911', '2012-03-11', 'EZE', 'C006', 3),
('TY0911', '2012-04-11', 'EZE', 'C006', 3),
('TY0911', '2012-05-11', 'EZE', 'C006', 3),
('TY0911', '2012-06-11', 'EZE', 'C006', 3),
('TY0911', '2012-07-11', 'EZE', 'C006', 3),
('TY0911', '2012-08-11', 'EZE', 'C006', 3),
('TY0912', '2012-01-07', 'PAC', 'P007', 5),
('TY0912', '2012-02-07', 'PAC', 'P007', 5),
('TY0912', '2012-03-07', 'PAC', 'P007', 5),
('TY0912', '2012-04-07', 'PAC', 'P007', 5),
('TY0912', '2012-05-07', 'PAC', 'P007', 5),
('TY0912', '2012-06-07', 'PAC', 'P007', 5),
('TY0912', '2012-07-07', 'PAC', 'P007', 5),
('TY0912', '2012-08-07', 'PAC', 'P007', 5);

-- --------------------------------------------------------

--
-- Estrutura da tabela `estado`
--

DROP TABLE IF EXISTS `estado`;
CREATE TABLE IF NOT EXISTS `estado` (
  `SiglaEstado` char(2) NOT NULL,
  `NomeEstado` varchar(30) NOT NULL,
  `SiglaPais` char(3) NOT NULL,
  PRIMARY KEY (`SiglaEstado`),
  KEY `FK_Estado` (`SiglaPais`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `estado`
--

INSERT INTO `estado` (`SiglaEstado`, `NomeEstado`, `SiglaPais`) VALUES
('BA', 'BAHIA', 'BRA'),
('BU', 'BUENOS AIRES', 'ARG'),
('DF', 'DISTRITO FEDERAL', 'BRA'),
('ES', 'ESPÍRITO SANTO', 'BRA'),
('LI', 'LIMA', 'PER'),
('MG', 'MINAS GERAIS', 'BRA'),
('MT', 'MATO GROSSO', 'BRA'),
('PA', 'PARIS', 'FRA'),
('PB', 'PARAÍBA', 'BRA'),
('PR', 'PARANÁ', 'BRA'),
('RJ', 'RIO DE JANEIRO', 'BRA'),
('RN', 'RIO GRANDE DO NORTE', 'BRA'),
('RO', 'ROMA', 'ITA'),
('RS', 'RIO GRANDE DO SUL', 'BRA'),
('SC', 'SANTA CATARINA', 'BRA'),
('SP', 'SÃO PAULO', 'BRA');

-- --------------------------------------------------------

--
-- Estrutura da tabela `municipio`
--

DROP TABLE IF EXISTS `municipio`;
CREATE TABLE IF NOT EXISTS `municipio` (
  `CodigoMunicipio` int NOT NULL,
  `NomeMunicipio` varchar(30) NOT NULL,
  `SiglaEstado` char(2) NOT NULL,
  PRIMARY KEY (`CodigoMunicipio`),
  KEY `FK_Municipio` (`SiglaEstado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `municipio`
--

INSERT INTO `municipio` (`CodigoMunicipio`, `NomeMunicipio`, `SiglaEstado`) VALUES
(1, 'SÃO PAULO', 'SP'),
(2, 'CAMPINAS', 'SP'),
(3, 'RIBEIRÃO PRETO', 'SP'),
(5, 'PORTO ALEGRE', 'RS'),
(7, 'FLORIANÓPOLIS', 'SC'),
(8, 'SALVADOR', 'BA'),
(9, 'VITÓRIA', 'ES'),
(10, 'NATAL', 'RN'),
(11, 'TIGRE', 'BU'),
(12, 'BUENOS AIRES', 'BU'),
(13, 'PARIS', 'PA'),
(14, 'ROMA', 'RO'),
(15, 'JOÃO PESSOA', 'PB'),
(16, 'GUARULHOS', 'SP'),
(17, 'RIO DE JANEIRO', 'RJ'),
(18, 'LIMA', 'LI');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pais`
--

DROP TABLE IF EXISTS `pais`;
CREATE TABLE IF NOT EXISTS `pais` (
  `SiglaPais` char(3) NOT NULL,
  `NomePais` varchar(30) NOT NULL,
  `NacionalidadePais` varchar(30) NOT NULL,
  PRIMARY KEY (`SiglaPais`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `pais`
--

INSERT INTO `pais` (`SiglaPais`, `NomePais`, `NacionalidadePais`) VALUES
('ALE', 'ALEMANHA', 'ALEMÃO'),
('ARG', 'ARGENTINA', 'ARGENTINO'),
('BRA', 'BRASIL', 'BRASILEIRO'),
('CHI', 'CHILE', 'CHILENO'),
('ESP', 'ESPANHA', 'ESPANHOL'),
('FRA', 'FRANÇA', 'FRANCÊS'),
('ITA', 'ITÁLIA', 'ITALIANO'),
('PER', 'PERU', 'PERUANO'),
('SUI', 'SUIÇA', 'SUIÇO');

-- --------------------------------------------------------

--
-- Estrutura da tabela `piloto`
--

DROP TABLE IF EXISTS `piloto`;
CREATE TABLE IF NOT EXISTS `piloto` (
  `CodigoPiloto` char(4) NOT NULL,
  `NomePiloto` varchar(30) NOT NULL,
  `SalarioPiloto` decimal(10,2) NOT NULL,
  `Gratificacao` decimal(10,2) NOT NULL,
  `DataAdmissaoPiloto` date DEFAULT NULL,
  `CodigoMunicipio` int NOT NULL,
  `CodigoCompanhia` int NOT NULL,
  PRIMARY KEY (`CodigoPiloto`),
  KEY `FK_PilotoCompanhia` (`CodigoCompanhia`),
  KEY `FK_PilotoMunicipio` (`CodigoMunicipio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `piloto`
--

INSERT INTO `piloto` (`CodigoPiloto`, `NomePiloto`, `SalarioPiloto`, `Gratificacao`, `DataAdmissaoPiloto`, `CodigoMunicipio`, `CodigoCompanhia`) VALUES
('C005', 'APARECIDO GONÇALVES', '3080.25', '400.50', '1999-05-22', 8, 3),
('C006', 'ANTONIO MARCOS SILVA', '3980.72', '715.84', '2002-04-14', 12, 7),
('P001', 'josé aParecido GONÇALVES', '4080.25', '400.50', '1998-04-22', 8, 3),
('P002', 'MARCOS ANTONIO SILVA ', '2980.72', '715.84', '2001-03-14', 12, 1),
('P003', 'JOSÉ ALVES DO NASCIMENTO', '5174.29', '0.00', '2012-04-09', 17, 4),
('P004', 'PetER RICHARD EMES', '9174.29', '1040.55', '2003-11-15', 18, 2),
('P007', 'MARIA DE JESUS DO NASCIMENTO', '3174.29', '0.00', '2012-05-09', 17, 1),
('P008', 'JOHN KENNEDY BUSH', '9174.29', '1000.00', '2004-12-16', 18, 2),
('P009', 'MARCOS OLIVEIRA BUSH', '11174.29', '2000.70', '2002-12-16', 14, 9);

-- --------------------------------------------------------

--
-- Estrutura da tabela `voo`
--

DROP TABLE IF EXISTS `voo`;
CREATE TABLE IF NOT EXISTS `voo` (
  `DestinoVoo` char(3) NOT NULL,
  `OrigemVoo` char(3) NOT NULL,
  `CodigoVoo` char(6) NOT NULL,
  PRIMARY KEY (`CodigoVoo`),
  KEY `FK_OrigemVoo` (`OrigemVoo`),
  KEY `FK_DestinoVoo` (`DestinoVoo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `voo`
--

INSERT INTO `voo` (`DestinoVoo`, `OrigemVoo`, `CodigoVoo`) VALUES
('NYK', 'NYL', 'CO2509'),
('NYL', 'NYK', 'CO2511'),
('GRU', 'CPQ', 'JJ1422'),
('CPQ', 'GRU', 'JJ1423'),
('GRU', 'FLN', 'JJ1827'),
('FLN', 'GRU', 'JJ1828'),
('GIG', 'VIX', 'KJ1422'),
('VIX', 'GIG', 'KJ1423'),
('FLN', 'RAO', 'KJ7408'),
('RAO', 'FLN', 'KJ7409'),
('EZE', 'PAC', 'TY0911'),
('PAC', 'EZE', 'TY0912');

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `aeroporto`
--
ALTER TABLE `aeroporto`
  ADD CONSTRAINT `FK_AeroportoMunicipio` FOREIGN KEY (`CodigoMunicipio`) REFERENCES `municipio` (`CodigoMunicipio`);

--
-- Limitadores para a tabela `aviao`
--
ALTER TABLE `aviao`
  ADD CONSTRAINT `FK_AviaoCompanhia` FOREIGN KEY (`CodigoCompanhia`) REFERENCES `companhiaaerea` (`CodigoCompanhia`);

--
-- Limitadores para a tabela `escalas`
--
ALTER TABLE `escalas`
  ADD CONSTRAINT `escalas_ibfk_1` FOREIGN KEY (`CodigoVoo`) REFERENCES `voo` (`CodigoVoo`),
  ADD CONSTRAINT `escalas_ibfk_2` FOREIGN KEY (`CodigoAeroporto`) REFERENCES `aeroporto` (`CodigoAeroporto`),
  ADD CONSTRAINT `escalas_ibfk_3` FOREIGN KEY (`CodigoPiloto`) REFERENCES `piloto` (`CodigoPiloto`),
  ADD CONSTRAINT `escalas_ibfk_4` FOREIGN KEY (`CodigoAviao`) REFERENCES `aviao` (`CodigoAviao`);

--
-- Limitadores para a tabela `estado`
--
ALTER TABLE `estado`
  ADD CONSTRAINT `FK_Estado` FOREIGN KEY (`SiglaPais`) REFERENCES `pais` (`SiglaPais`);

--
-- Limitadores para a tabela `municipio`
--
ALTER TABLE `municipio`
  ADD CONSTRAINT `FK_Municipio` FOREIGN KEY (`SiglaEstado`) REFERENCES `estado` (`SiglaEstado`);

--
-- Limitadores para a tabela `piloto`
--
ALTER TABLE `piloto`
  ADD CONSTRAINT `FK_PilotoCompanhia` FOREIGN KEY (`CodigoCompanhia`) REFERENCES `companhiaaerea` (`CodigoCompanhia`),
  ADD CONSTRAINT `FK_PilotoMunicipio` FOREIGN KEY (`CodigoMunicipio`) REFERENCES `municipio` (`CodigoMunicipio`);

--
-- Limitadores para a tabela `voo`
--
ALTER TABLE `voo`
  ADD CONSTRAINT `FK_DestinoVoo` FOREIGN KEY (`DestinoVoo`) REFERENCES `aeroporto` (`CodigoAeroporto`),
  ADD CONSTRAINT `FK_OrigemVoo` FOREIGN KEY (`OrigemVoo`) REFERENCES `aeroporto` (`CodigoAeroporto`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
