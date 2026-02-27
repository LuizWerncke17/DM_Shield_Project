-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Tempo de geração: 27/02/2026 às 21:53
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
-- Estrutura para tabela `anotacoes`
--

CREATE TABLE `anotacoes` (
  `id` int(11) NOT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `tipo` varchar(100) DEFAULT NULL,
  `informacoes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `anotacoes`
--

INSERT INTO `anotacoes` (`id`, `titulo`, `tipo`, `informacoes`) VALUES
(2, 'Banana', 'Missao', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
(3, 'm', 'Missao', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
(5, 'Banana', 'Outro', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQHlL6yoi89pGz-08CupN6qSa8NYH1CV5qxvA&s');

-- --------------------------------------------------------

--
-- Estrutura para tabela `consumiveis`
--

CREATE TABLE `consumiveis` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `tipo` varchar(100) DEFAULT NULL,
  `descricao` text DEFAULT NULL,
  `efeito` text DEFAULT NULL,
  `duracao` varchar(100) DEFAULT NULL,
  `valor` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `consumiveis`
--

INSERT INTO `consumiveis` (`id`, `nome`, `tipo`, `descricao`, `efeito`, `duracao`, `valor`) VALUES
(1, 'Banana', 'Comida', '', 'Nenhum', 'Instantânea', ''),
(2, 'Água', 'Bebida', '', 'Nenhum', 'Instantânea', '');

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

-- --------------------------------------------------------

--
-- Estrutura para tabela `itens`
--

CREATE TABLE `itens` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `tipo` varchar(100) DEFAULT NULL,
  `descricao` text DEFAULT NULL,
  `valor` varchar(50) DEFAULT NULL,
  `raridade` varchar(50) DEFAULT NULL,
  `efeito` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `itens`
--

INSERT INTO `itens` (`id`, `nome`, `tipo`, `descricao`, `valor`, `raridade`, `efeito`) VALUES
(1, 'Graveto', 'Arma', 'É um graveto encontrado no chão sem nada de especial', '0 PO', 'Comum', 'Nenhum'),
(3, 'j', 'Escudo', '', '', '', 'Nenhum'),
(4, 'v', 'Armadura', '', '', '', 'Nenhum');

-- --------------------------------------------------------

--
-- Estrutura para tabela `locais`
--

CREATE TABLE `locais` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `tipo` varchar(50) DEFAULT NULL,
  `descricao` text DEFAULT NULL,
  `dados` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`dados`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `npcs`
--

CREATE TABLE `npcs` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `raca` varchar(100) DEFAULT NULL,
  `vida` int(11) DEFAULT NULL,
  `ca` int(11) DEFAULT NULL,
  `dados` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`dados`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `npcs`
--

INSERT INTO `npcs` (`id`, `nome`, `raca`, `vida`, `ca`, `dados`) VALUES
(1, 'Eduardo', 'Gnomo', 0, 0, '{\"atributos\":{\"forca\":10,\"destreza\":10,\"constituicao\":10,\"inteligencia\":10,\"sabedoria\":10,\"carisma\":10},\"informacoes\":\"Nenhuma\",\"habilidades\":[],\"resistencias\":\"Nenhuma\",\"imunidades\":\"Nenhuma\",\"ataques\":[]}');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `anotacoes`
--
ALTER TABLE `anotacoes`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `consumiveis`
--
ALTER TABLE `consumiveis`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `inimigos`
--
ALTER TABLE `inimigos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `itens`
--
ALTER TABLE `itens`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `locais`
--
ALTER TABLE `locais`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `npcs`
--
ALTER TABLE `npcs`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `anotacoes`
--
ALTER TABLE `anotacoes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `consumiveis`
--
ALTER TABLE `consumiveis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `inimigos`
--
ALTER TABLE `inimigos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de tabela `itens`
--
ALTER TABLE `itens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `locais`
--
ALTER TABLE `locais`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `npcs`
--
ALTER TABLE `npcs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
