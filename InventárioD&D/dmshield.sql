-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Tempo de geração: 26/02/2026 às 21:50
-- Versão do servidor: 10.4.27-MariaDB
-- Versão do PHP: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `dmshield`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `inimigos`
--

CREATE TABLE `inimigos` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `tipo` varchar(100) DEFAULT NULL,
  `vida` int(11) DEFAULT NULL,
  `ca` int(11) DEFAULT NULL,
  `dados` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `inimigos`
--

INSERT INTO `inimigos` (`id`, `nome`, `tipo`, `vida`, `ca`, `dados`) VALUES
(6, 'Goblin', 'Humanoide', 10, 14, '{\"atributos\":{\"forca\":12,\"destreza\":18,\"constituicao\":8,\"inteligencia\":6,\"sabedoria\":6,\"carisma\":4},\"habilidades\":[],\"resistencias\":\"Nenhuma\",\"imunidades\":\"Nenhuma\",\"ataques\":[{\"nome\":\"Facada\",\"dano\":\"1d8 cortante\"}],\"nd\":0.5,\"xp\":100}'),
(32, 'a', '', 0, 0, '{\"atributos\":{\"forca\":\"\",\"destreza\":\"\",\"constituicao\":\"\",\"inteligencia\":\"\",\"sabedoria\":\"\",\"carisma\":\"\"},\"habilidades\":[],\"resistencias\":\"Nenhuma\",\"imunidades\":\"Nenhuma\",\"ataques\":[],\"nd\":\"\",\"xp\":\"\"}');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `inimigos`
--
ALTER TABLE `inimigos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `inimigos`
--
ALTER TABLE `inimigos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
