-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Tempo de geração: 02/03/2026 às 21:47
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
(6, 'Início', 'Lembrete', 'Amanda e Manu estarão indo para Phandalin, pois escutaram sobre o novo restaurante que vai inaugurar logo e querem estar lá para ver a festa, no caminho, em um cruzamento triplo, irão encontrar a Lívia em dúvida de para onde ir, já que a placa está quebrada, vão ajudar ela e ir juntas. Um coelho preto de olhos vermelhos vai pular na frente delas, e aí é com elas. Chegando em Phandalin elas estarão soltas, mas devem ir ver o Kael no bar. Lipe vai estar fazendo um show no bar, e João estará na plateia, na frente do palco bebendo, elas podem falar com Kael, mas quando chegar no drop da música do Lipe irei interromper e fazer a cena foda. Depois da música um valentão chamado Carlos vai chamar eles para um desafio de bebidas.\n\nPagar 20 PO pra participar. \nLembrando que podem sair a qualquer momento. \n1° turno: bebem sem nada de mais\n2° turno: Constituição CD 8\n3° turno: Constituição CD 12\n4° turno: ConstituiçãoCD 16\nE por aí vai. \nSe falhar na salvaguarda do quarto turno algo aleatório acontecerá a noite, e a pessoa n saberá de nada, aos demais, irei perguntar oq eles fazem depois do evento, as pessoas que chegarem no quarto turno acordam com um ponto de exaustão e dor de cabeça como ressaca.'),
(7, 'Tour', 'Evento', 'Depois de eles afugentarem o velho teddy, no dia seguinte ao evento de bebidas, o prefeito agradece eles com 20 PO pra cada, e leva eles para um Tour por Phandalin, aí blz, tenho que pegar a foto e ir apresentando os lugares.\n\nDepois do tour quando estiverem passando pela igreja de novo vai ter o símbolo de um olho cortado feito em ketchup, com a escrita \"O observador irá se erguer\", caso a Manu use o óculos do tempo ela vai ver uma pessoa com túnica cinza claro  escrevendo isso, e ela deixando cair uma chave que tem esse olho e o número 61C. (pode ser encontrada naturalmente com percepção CD 14).'),
(8, 'Pedido de ajuda', 'Missao', 'O lojista asiático chamado Tekomo, vai pedir ajuda deles para irem atrás de uma caravana com destino ao vilarejo vizinho, mas que nunca chegou, e do grupo de aventureiros que ele já tinha mandado atrás dela. Quando eles adentrarem a floresta sombria o clima ficará meio pesado, e com um teste de percepção CD 12 para ver se estão ligados, eles podem encontrar rastros da caravana saíndo do caminho a força em direção a uma clareira, com patas de cavalos espalhadas loucamente até lá. Quando chegarem verão 2 chacais e 1 homem chacal que estavam comendo os cadáveres podres dos aventureiros, e se chegarem de forma furtiva podem atacar surpreendidos. Caixas de suprimentos da caravana estarão espalhadas pela clareira, a caravana vai estar quebrada no fundo, com um baú secreto dentro CD 12 investigação.\n\nos inimigos podem quebrar as caixas, são 10 no total, e cada uma vale 10 PO se entregue no próximo vilarejo'),
(9, 'Perseguição', 'Evento', 'Depois de explorarem a clareira e pegarem as caixas ele voltarão para a trilha, vou deixar eles conversarem um pouco, enquanto diminuo o volume da música, até o silêncio absoluto, onde peço um teste de intuição CD 12 como sexto sentido. Quem passar vai receber uma mensagem trêmula em sua cabeça, dizendo \"CORRA, e não olhe para trás\", se alguém olhar, salvaguarda de sabedoria CD 15 para não ficar paralisado por um turno, quem passar na intuição já começa com -1 falha, e assim começa a perseguição, em que todos jogam Destreza CD 10, quem chegar a 3 falhas primeiro (ou se todos chegarem a 10 sucessos) termina a perseguição, e tem sua cena de morte que quero criar na hora, violenta ou rápida dependendo de como a pessoa morrer.'),
(10, 'Ressureição', 'Evento', 'Quem morrer para o Wendigo vai ter um encontro com a morte em um lugar totalmente branco e cheio de névoa cinza espessa, e vai poder renascer contanto que perca 1 ponto de constituição temporariamente (maldição superior), e tem que seguir as ordens dela, se não toma dano necro, e vai ter como objetivo principal garantir que o cataclismo ocorra, também não pode relevar nada sobre esse termo de ressureição para ninguém.');

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
(3, 'Cerveja', 'Bebida', 'Uma bebida comum que está em todo bar', 'Se tomar mais do que sua constituição, salvaguarda de constituição CD 10 + número da dose para não ficar bêbado. \nDesvantagem em acertos e testes de INT, SAB e CAR.', '1 hora a 1 dia', '1 PO');

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
(34, 'Velho teddy', 'Bestas', 25, 11, '{\"atributos\":{\"forca\":15,\"destreza\":10,\"constituicao\":14,\"inteligencia\":2,\"sabedoria\":12,\"carisma\":7},\"habilidades\":[],\"resistencias\":\"Nenhuma\",\"imunidades\":\"Nenhuma\",\"ataques\":[{\"nome\":\"Mordida +3\",\"dano\":\"1d6 + 2 perfurante\"},{\"nome\":\"Garras +3\",\"dano\":\"2d4 + 2 cortante\"}],\"nd\":0.5,\"xp\":100}'),
(35, 'Chacal', 'Bestas', 0, 0, '{\"atributos\":{\"forca\":10,\"destreza\":10,\"constituicao\":10,\"inteligencia\":10,\"sabedoria\":10,\"carisma\":10},\"habilidades\":[],\"resistencias\":\"Nenhuma\",\"imunidades\":\"Nenhuma\",\"ataques\":[],\"nd\":\"\",\"xp\":\"\"}'),
(36, 'Homem-Chacal', 'Humanoides', 0, 0, '{\"atributos\":{\"forca\":10,\"destreza\":10,\"constituicao\":10,\"inteligencia\":10,\"sabedoria\":10,\"carisma\":10},\"habilidades\":[],\"resistencias\":\"Nenhuma\",\"imunidades\":\"Nenhuma\",\"ataques\":[],\"nd\":\"\",\"xp\":\"\"}'),
(37, 'Wendigo', 'Mortos-vivos', 0, 0, '{\"atributos\":{\"forca\":10,\"destreza\":10,\"constituicao\":10,\"inteligencia\":10,\"sabedoria\":10,\"carisma\":10},\"habilidades\":[],\"resistencias\":\"Nenhuma\",\"imunidades\":\"Nenhuma\",\"ataques\":[],\"nd\":\"\",\"xp\":\"\"}'),
(38, 'Morte', 'Mortos-vivos', 0, 0, '{\"atributos\":{\"forca\":10,\"destreza\":10,\"constituicao\":10,\"inteligencia\":10,\"sabedoria\":10,\"carisma\":10},\"habilidades\":[],\"resistencias\":\"Nenhuma\",\"imunidades\":\"Nenhuma\",\"ataques\":[],\"nd\":\"\",\"xp\":\"\"}');

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
(1, 'Graveto', 'Arma', 'É um graveto encontrado no chão sem nada de especial', '0 PO', 'Comum', 'Nenhum');

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

--
-- Despejando dados para a tabela `locais`
--

INSERT INTO `locais` (`id`, `nome`, `tipo`, `descricao`, `dados`) VALUES
(7, 'Phandalin', 'Vilarejo', 'O vilarejo principal, que aparecerá por muito ainda', '{\"npcs\":[{\"id\":3,\"nome\":\"Carlos\",\"raca\":\"Meio Orc\",\"vida\":15,\"ca\":12,\"dados\":{\"atributos\":{\"forca\":14,\"destreza\":8,\"constituicao\":16,\"inteligencia\":7,\"sabedoria\":6,\"carisma\":6},\"informacoes\":\"Um valentão Bêbado que vai chamar a competição de bebidas depois do Lipe\",\"habilidades\":[],\"resistencias\":\"Nenhuma\",\"imunidades\":\"Nenhuma\",\"ataques\":[{\"nome\":\"Soco\",\"dano\":\"1d6 contundente\"}]},\"instanceId\":1772484191361.4417,\"npcId\":3,\"ficha\":{\"id\":3,\"nome\":\"Carlos\",\"raca\":\"Meio Orc\",\"vida\":15,\"ca\":12,\"dados\":{\"atributos\":{\"forca\":14,\"destreza\":8,\"constituicao\":16,\"inteligencia\":7,\"sabedoria\":6,\"carisma\":6},\"informacoes\":\"Um valentão Bêbado que vai chamar a competição de bebidas depois do Lipe\",\"habilidades\":[],\"resistencias\":\"Nenhuma\",\"imunidades\":\"Nenhuma\",\"ataques\":[{\"nome\":\"Soco\",\"dano\":\"1d6 contundente\"}]}},\"numero\":1},{\"id\":4,\"nome\":\"Comparsa\",\"raca\":\"Humano\",\"vida\":10,\"ca\":10,\"dados\":{\"atributos\":{\"forca\":12,\"destreza\":10,\"constituicao\":12,\"inteligencia\":10,\"sabedoria\":10,\"carisma\":12},\"informacoes\":\"O comparsa do Carlos que vai participar da competição também\",\"habilidades\":[],\"resistencias\":\"Nenhuma\",\"imunidades\":\"Nenhuma\",\"ataques\":[{\"nome\":\"Soco\",\"dano\":\"1d4 contundente\"}]},\"instanceId\":1772484192897.7822,\"npcId\":4,\"ficha\":{\"id\":4,\"nome\":\"Comparsa\",\"raca\":\"Humano\",\"vida\":10,\"ca\":10,\"dados\":{\"atributos\":{\"forca\":12,\"destreza\":10,\"constituicao\":12,\"inteligencia\":10,\"sabedoria\":10,\"carisma\":12},\"informacoes\":\"O comparsa do Carlos que vai participar da competição também\",\"habilidades\":[],\"resistencias\":\"Nenhuma\",\"imunidades\":\"Nenhuma\",\"ataques\":[{\"nome\":\"Soco\",\"dano\":\"1d4 contundente\"}]}},\"numero\":1},{\"id\":5,\"nome\":\"Wendel pref.\",\"raca\":\"Meio Elfo\",\"vida\":8,\"ca\":10,\"dados\":{\"atributos\":{\"forca\":8,\"destreza\":14,\"constituicao\":10,\"inteligencia\":14,\"sabedoria\":12,\"carisma\":12},\"informacoes\":\"Prefeito de Phandalin, tem um cervo chamado Wallace\",\"habilidades\":[],\"resistencias\":\"Nenhuma\",\"imunidades\":\"Nenhuma\",\"ataques\":[]},\"instanceId\":1772484194857.8274,\"npcId\":5,\"ficha\":{\"id\":5,\"nome\":\"Wendel pref.\",\"raca\":\"Meio Elfo\",\"vida\":8,\"ca\":10,\"dados\":{\"atributos\":{\"forca\":8,\"destreza\":14,\"constituicao\":10,\"inteligencia\":14,\"sabedoria\":12,\"carisma\":12},\"informacoes\":\"Prefeito de Phandalin, tem um cervo chamado Wallace\",\"habilidades\":[],\"resistencias\":\"Nenhuma\",\"imunidades\":\"Nenhuma\",\"ataques\":[]}},\"numero\":1},{\"id\":6,\"nome\":\"Escanor\",\"raca\":\"Humano\",\"vida\":22,\"ca\":12,\"dados\":{\"atributos\":{\"forca\":16,\"destreza\":8,\"constituicao\":16,\"inteligencia\":10,\"sabedoria\":12,\"carisma\":16},\"informacoes\":\"O ferreiro de Phandalin, quando com armadura tem 18 de CA. Cheio de cicatrizes de queimaduras e cortes espalhadas pelo corpo.\",\"habilidades\":[],\"resistencias\":\"Fogo\",\"imunidades\":\"Nenhuma\",\"ataques\":[]},\"instanceId\":1772484196577.0479,\"npcId\":6,\"ficha\":{\"id\":6,\"nome\":\"Escanor\",\"raca\":\"Humano\",\"vida\":22,\"ca\":12,\"dados\":{\"atributos\":{\"forca\":16,\"destreza\":8,\"constituicao\":16,\"inteligencia\":10,\"sabedoria\":12,\"carisma\":16},\"informacoes\":\"O ferreiro de Phandalin, quando com armadura tem 18 de CA. Cheio de cicatrizes de queimaduras e cortes espalhadas pelo corpo.\",\"habilidades\":[],\"resistencias\":\"Fogo\",\"imunidades\":\"Nenhuma\",\"ataques\":[]}},\"numero\":1}],\"inimigos\":[{\"id\":34,\"nome\":\"Velho teddy\",\"tipo\":\"Bestas\",\"vida\":25,\"ca\":11,\"dados\":{\"atributos\":{\"forca\":15,\"destreza\":10,\"constituicao\":14,\"inteligencia\":2,\"sabedoria\":12,\"carisma\":7},\"habilidades\":[],\"resistencias\":\"Nenhuma\",\"imunidades\":\"Nenhuma\",\"ataques\":[{\"nome\":\"Mordida +3\",\"dano\":\"1d6 + 2 perfurante\"},{\"nome\":\"Garras +3\",\"dano\":\"2d4 + 2 cortante\"}],\"nd\":0.5,\"xp\":100},\"instanceId\":1772484201177.451,\"inimigoId\":34,\"ficha\":{\"id\":34,\"nome\":\"Velho teddy\",\"tipo\":\"Bestas\",\"vida\":25,\"ca\":11,\"dados\":{\"atributos\":{\"forca\":15,\"destreza\":10,\"constituicao\":14,\"inteligencia\":2,\"sabedoria\":12,\"carisma\":7},\"habilidades\":[],\"resistencias\":\"Nenhuma\",\"imunidades\":\"Nenhuma\",\"ataques\":[{\"nome\":\"Mordida +3\",\"dano\":\"1d6 + 2 perfurante\"},{\"nome\":\"Garras +3\",\"dano\":\"2d4 + 2 cortante\"}],\"nd\":0.5,\"xp\":100}},\"numero\":1}],\"itens\":[],\"consumiveis\":[{\"id\":3,\"nome\":\"Cerveja\",\"tipo\":\"Bebida\",\"descricao\":\"Uma bebida comum que está em todo bar\",\"efeito\":\"Se tomar mais do que sua constituição, salvaguarda de constituição CD 10 + número da dose para não ficar bêbado. \\nDesvantagem em acertos e testes de INT, SAB e CAR.\",\"duracao\":\"1 hora a 1 dia\",\"valor\":\"1 PO\",\"instanceId\":1772484218512.1304,\"consumivelId\":3,\"ficha\":{\"id\":3,\"nome\":\"Cerveja\",\"tipo\":\"Bebida\",\"descricao\":\"Uma bebida comum que está em todo bar\",\"efeito\":\"Se tomar mais do que sua constituição, salvaguarda de constituição CD 10 + número da dose para não ficar bêbado. \\nDesvantagem em acertos e testes de INT, SAB e CAR.\",\"duracao\":\"1 hora a 1 dia\",\"valor\":\"1 PO\"},\"numero\":1}],\"anotacoes\":[{\"id\":6,\"titulo\":\"Início\",\"tipo\":\"Lembrete\",\"informacoes\":\"Amanda e Manu estarão indo para Phandalin, pois escutaram sobre o novo restaurante que vai inaugurar logo e querem estar lá para ver a festa, no caminho, em um cruzamento triplo, irão encontrar a Lívia em dúvida de para onde ir, já que a placa está quebrada, vão ajudar ela e ir juntas. Um coelho preto de olhos vermelhos vai pular na frente delas, e aí é com elas. Chegando em Phandalin elas estarão soltas, mas devem ir ver o Kael no bar. Lipe vai estar fazendo um show no bar, e João estará na plateia, na frente do palco bebendo, elas podem falar com Kael, mas quando chegar no drop da música do Lipe irei interromper e fazer a cena foda. Depois da música um valentão chamado Carlos vai chamar eles para um desafio de bebidas.\\n\\nPagar 20 PO pra participar. \\nLembrando que podem sair a qualquer momento. \\n1° turno: bebem sem nada de mais\\n2° turno: Constituição CD 8\\n3° turno: Constituição CD 12\\n4° turno: ConstituiçãoCD 16\\nE por aí vai. \\nSe falhar na salvaguarda do quarto turno algo aleatório acontecerá a noite, e a pessoa n saberá de nada, aos demais, irei perguntar oq eles fazem depois do evento, as pessoas que chegarem no quarto turno acordam com um ponto de exaustão e dor de cabeça como ressaca.\",\"instanceId\":1772484224064.4773,\"anotacaoId\":6,\"ficha\":{\"id\":6,\"titulo\":\"Início\",\"tipo\":\"Lembrete\",\"informacoes\":\"Amanda e Manu estarão indo para Phandalin, pois escutaram sobre o novo restaurante que vai inaugurar logo e querem estar lá para ver a festa, no caminho, em um cruzamento triplo, irão encontrar a Lívia em dúvida de para onde ir, já que a placa está quebrada, vão ajudar ela e ir juntas. Um coelho preto de olhos vermelhos vai pular na frente delas, e aí é com elas. Chegando em Phandalin elas estarão soltas, mas devem ir ver o Kael no bar. Lipe vai estar fazendo um show no bar, e João estará na plateia, na frente do palco bebendo, elas podem falar com Kael, mas quando chegar no drop da música do Lipe irei interromper e fazer a cena foda. Depois da música um valentão chamado Carlos vai chamar eles para um desafio de bebidas.\\n\\nPagar 20 PO pra participar. \\nLembrando que podem sair a qualquer momento. \\n1° turno: bebem sem nada de mais\\n2° turno: Constituição CD 8\\n3° turno: Constituição CD 12\\n4° turno: ConstituiçãoCD 16\\nE por aí vai. \\nSe falhar na salvaguarda do quarto turno algo aleatório acontecerá a noite, e a pessoa n saberá de nada, aos demais, irei perguntar oq eles fazem depois do evento, as pessoas que chegarem no quarto turno acordam com um ponto de exaustão e dor de cabeça como ressaca.\"},\"numero\":1},{\"id\":7,\"titulo\":\"Tour\",\"tipo\":\"Evento\",\"informacoes\":\"Depois de eles afugentarem o velho teddy, no dia seguinte ao evento de bebidas, o prefeito agradece eles com 20 PO pra cada, e leva eles para um Tour por Phandalin, aí blz, tenho que pegar a foto e ir apresentando os lugares.\\n\\nDepois do tour quando estiverem passando pela igreja de novo vai ter o símbolo de um olho cortado feito em ketchup, com a escrita \\\"O observador irá se erguer\\\", caso a Manu use o óculos do tempo ela vai ver uma pessoa com túnica cinza claro  escrevendo isso, e ela deixando cair uma chave que tem esse olho e o número 61C. (pode ser encontrada naturalmente com percepção CD 14).\",\"instanceId\":1772484225792.084,\"anotacaoId\":7,\"ficha\":{\"id\":7,\"titulo\":\"Tour\",\"tipo\":\"Evento\",\"informacoes\":\"Depois de eles afugentarem o velho teddy, no dia seguinte ao evento de bebidas, o prefeito agradece eles com 20 PO pra cada, e leva eles para um Tour por Phandalin, aí blz, tenho que pegar a foto e ir apresentando os lugares.\\n\\nDepois do tour quando estiverem passando pela igreja de novo vai ter o símbolo de um olho cortado feito em ketchup, com a escrita \\\"O observador irá se erguer\\\", caso a Manu use o óculos do tempo ela vai ver uma pessoa com túnica cinza claro  escrevendo isso, e ela deixando cair uma chave que tem esse olho e o número 61C. (pode ser encontrada naturalmente com percepção CD 14).\"},\"numero\":1},{\"id\":8,\"titulo\":\"Pedido de ajuda\",\"tipo\":\"Missao\",\"informacoes\":\"O lojista asiático chamado Tekomo, vai pedir ajuda deles para irem atrás de uma caravana com destino ao vilarejo vizinho, mas que nunca chegou, e do grupo de aventureiros que ele já tinha mandado atrás dela. Quando eles adentrarem a floresta sombria o clima ficará meio pesado, e com um teste de percepção CD 12 para ver se estão ligados, eles podem encontrar rastros da caravana saíndo do caminho a força em direção a uma clareira, com patas de cavalos espalhadas loucamente até lá. Quando chegarem verão 2 chacais e 1 homem chacal que estavam comendo os cadáveres podres dos aventureiros, e se chegarem de forma furtiva podem atacar surpreendidos. Caixas de suprimentos da caravana estarão espalhadas pela clareira, a caravana vai estar quebrada no fundo, com um baú secreto dentro CD 12 investigação.\\n\\nos inimigos podem quebrar as caixas, são 10 no total, e cada uma vale 10 PO se entregue no próximo vilarejo\",\"instanceId\":1772484231312.3599,\"anotacaoId\":8,\"ficha\":{\"id\":8,\"titulo\":\"Pedido de ajuda\",\"tipo\":\"Missao\",\"informacoes\":\"O lojista asiático chamado Tekomo, vai pedir ajuda deles para irem atrás de uma caravana com destino ao vilarejo vizinho, mas que nunca chegou, e do grupo de aventureiros que ele já tinha mandado atrás dela. Quando eles adentrarem a floresta sombria o clima ficará meio pesado, e com um teste de percepção CD 12 para ver se estão ligados, eles podem encontrar rastros da caravana saíndo do caminho a força em direção a uma clareira, com patas de cavalos espalhadas loucamente até lá. Quando chegarem verão 2 chacais e 1 homem chacal que estavam comendo os cadáveres podres dos aventureiros, e se chegarem de forma furtiva podem atacar surpreendidos. Caixas de suprimentos da caravana estarão espalhadas pela clareira, a caravana vai estar quebrada no fundo, com um baú secreto dentro CD 12 investigação.\\n\\nos inimigos podem quebrar as caixas, são 10 no total, e cada uma vale 10 PO se entregue no próximo vilarejo\"},\"numero\":1}]}'),
(8, 'Floresta Escura', 'Natural', 'Uma floresta densa, cheia de névoa pesada e árvores escuras, o vento assobia quando passa entre os galhos, todos os testes relaionados a visão tem desvantagem, visão de penumbra a até 3 metros.', '{\"npcs\":[],\"inimigos\":[{\"id\":35,\"nome\":\"Chacal\",\"tipo\":\"Bestas\",\"vida\":0,\"ca\":0,\"dados\":{\"atributos\":{\"forca\":10,\"destreza\":10,\"constituicao\":10,\"inteligencia\":10,\"sabedoria\":10,\"carisma\":10},\"habilidades\":[],\"resistencias\":\"Nenhuma\",\"imunidades\":\"Nenhuma\",\"ataques\":[],\"nd\":\"\",\"xp\":\"\"},\"instanceId\":1772484328000.0396,\"inimigoId\":35,\"ficha\":{\"id\":35,\"nome\":\"Chacal\",\"tipo\":\"Bestas\",\"vida\":0,\"ca\":0,\"dados\":{\"atributos\":{\"forca\":10,\"destreza\":10,\"constituicao\":10,\"inteligencia\":10,\"sabedoria\":10,\"carisma\":10},\"habilidades\":[],\"resistencias\":\"Nenhuma\",\"imunidades\":\"Nenhuma\",\"ataques\":[],\"nd\":\"\",\"xp\":\"\"}},\"numero\":1},{\"id\":36,\"nome\":\"Homem-Chacal\",\"tipo\":\"Humanoides\",\"vida\":0,\"ca\":0,\"dados\":{\"atributos\":{\"forca\":10,\"destreza\":10,\"constituicao\":10,\"inteligencia\":10,\"sabedoria\":10,\"carisma\":10},\"habilidades\":[],\"resistencias\":\"Nenhuma\",\"imunidades\":\"Nenhuma\",\"ataques\":[],\"nd\":\"\",\"xp\":\"\"},\"instanceId\":1772484329616.228,\"inimigoId\":36,\"ficha\":{\"id\":36,\"nome\":\"Homem-Chacal\",\"tipo\":\"Humanoides\",\"vida\":0,\"ca\":0,\"dados\":{\"atributos\":{\"forca\":10,\"destreza\":10,\"constituicao\":10,\"inteligencia\":10,\"sabedoria\":10,\"carisma\":10},\"habilidades\":[],\"resistencias\":\"Nenhuma\",\"imunidades\":\"Nenhuma\",\"ataques\":[],\"nd\":\"\",\"xp\":\"\"}},\"numero\":1},{\"id\":37,\"nome\":\"Wendigo\",\"tipo\":\"Mortos-vivos\",\"vida\":0,\"ca\":0,\"dados\":{\"atributos\":{\"forca\":10,\"destreza\":10,\"constituicao\":10,\"inteligencia\":10,\"sabedoria\":10,\"carisma\":10},\"habilidades\":[],\"resistencias\":\"Nenhuma\",\"imunidades\":\"Nenhuma\",\"ataques\":[],\"nd\":\"\",\"xp\":\"\"},\"instanceId\":1772484331472.8967,\"inimigoId\":37,\"ficha\":{\"id\":37,\"nome\":\"Wendigo\",\"tipo\":\"Mortos-vivos\",\"vida\":0,\"ca\":0,\"dados\":{\"atributos\":{\"forca\":10,\"destreza\":10,\"constituicao\":10,\"inteligencia\":10,\"sabedoria\":10,\"carisma\":10},\"habilidades\":[],\"resistencias\":\"Nenhuma\",\"imunidades\":\"Nenhuma\",\"ataques\":[],\"nd\":\"\",\"xp\":\"\"}},\"numero\":1},{\"id\":38,\"nome\":\"Morte\",\"tipo\":\"Mortos-vivos\",\"vida\":0,\"ca\":0,\"dados\":{\"atributos\":{\"forca\":10,\"destreza\":10,\"constituicao\":10,\"inteligencia\":10,\"sabedoria\":10,\"carisma\":10},\"habilidades\":[],\"resistencias\":\"Nenhuma\",\"imunidades\":\"Nenhuma\",\"ataques\":[],\"nd\":\"\",\"xp\":\"\"},\"instanceId\":1772484337999.717,\"inimigoId\":38,\"ficha\":{\"id\":38,\"nome\":\"Morte\",\"tipo\":\"Mortos-vivos\",\"vida\":0,\"ca\":0,\"dados\":{\"atributos\":{\"forca\":10,\"destreza\":10,\"constituicao\":10,\"inteligencia\":10,\"sabedoria\":10,\"carisma\":10},\"habilidades\":[],\"resistencias\":\"Nenhuma\",\"imunidades\":\"Nenhuma\",\"ataques\":[],\"nd\":\"\",\"xp\":\"\"}},\"numero\":1}],\"itens\":[{\"id\":1,\"nome\":\"Graveto\",\"tipo\":\"Arma\",\"descricao\":\"É um graveto encontrado no chão sem nada de especial\",\"valor\":\"0 PO\",\"raridade\":\"Comum\",\"efeito\":\"Nenhum\",\"instanceId\":1772484346119.8386,\"itemId\":1,\"ficha\":{\"id\":1,\"nome\":\"Graveto\",\"tipo\":\"Arma\",\"descricao\":\"É um graveto encontrado no chão sem nada de especial\",\"valor\":\"0 PO\",\"raridade\":\"Comum\",\"efeito\":\"Nenhum\"},\"numero\":1}],\"consumiveis\":[],\"anotacoes\":[{\"id\":9,\"titulo\":\"Perseguição\",\"tipo\":\"Evento\",\"informacoes\":\"Depois de explorarem a clareira e pegarem as caixas ele voltarão para a trilha, vou deixar eles conversarem um pouco, enquanto diminuo o volume da música, até o silêncio absoluto, onde peço um teste de intuição CD 12 como sexto sentido. Quem passar vai receber uma mensagem trêmula em sua cabeça, dizendo \\\"CORRA, e não olhe para trás\\\", se alguém olhar, salvaguarda de sabedoria CD 15 para não ficar paralisado por um turno, quem passar na intuição já começa com -1 falha, e assim começa a perseguição, em que todos jogam Destreza CD 10, quem chegar a 3 falhas primeiro (ou se todos chegarem a 10 sucessos) termina a perseguição, e tem sua cena de morte que quero criar na hora, violenta ou rápida dependendo de como a pessoa morrer.\",\"instanceId\":1772484351855.6938,\"anotacaoId\":9,\"ficha\":{\"id\":9,\"titulo\":\"Perseguição\",\"tipo\":\"Evento\",\"informacoes\":\"Depois de explorarem a clareira e pegarem as caixas ele voltarão para a trilha, vou deixar eles conversarem um pouco, enquanto diminuo o volume da música, até o silêncio absoluto, onde peço um teste de intuição CD 12 como sexto sentido. Quem passar vai receber uma mensagem trêmula em sua cabeça, dizendo \\\"CORRA, e não olhe para trás\\\", se alguém olhar, salvaguarda de sabedoria CD 15 para não ficar paralisado por um turno, quem passar na intuição já começa com -1 falha, e assim começa a perseguição, em que todos jogam Destreza CD 10, quem chegar a 3 falhas primeiro (ou se todos chegarem a 10 sucessos) termina a perseguição, e tem sua cena de morte que quero criar na hora, violenta ou rápida dependendo de como a pessoa morrer.\"},\"numero\":1},{\"id\":10,\"titulo\":\"Ressureição\",\"tipo\":\"Evento\",\"informacoes\":\"Quem morrer para o Wendigo vai ter um encontro com a morte em um lugar totalmente branco e cheio de névoa cinza espessa, e vai poder renascer contanto que perca 1 ponto de constituição temporariamente (maldição superior), e tem que seguir as ordens dela, se não toma dano necro, e vai ter como objetivo principal garantir que o cataclismo ocorra, também não pode relevar nada sobre esse termo de ressureição para ninguém.\",\"instanceId\":1772484353687.0774,\"anotacaoId\":10,\"ficha\":{\"id\":10,\"titulo\":\"Ressureição\",\"tipo\":\"Evento\",\"informacoes\":\"Quem morrer para o Wendigo vai ter um encontro com a morte em um lugar totalmente branco e cheio de névoa cinza espessa, e vai poder renascer contanto que perca 1 ponto de constituição temporariamente (maldição superior), e tem que seguir as ordens dela, se não toma dano necro, e vai ter como objetivo principal garantir que o cataclismo ocorra, também não pode relevar nada sobre esse termo de ressureição para ninguém.\"},\"numero\":1}]}');

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
(3, 'Carlos', 'Meio Orc', 15, 12, '{\"atributos\":{\"forca\":14,\"destreza\":8,\"constituicao\":16,\"inteligencia\":7,\"sabedoria\":6,\"carisma\":6},\"informacoes\":\"Um valentão Bêbado que vai chamar a competição de bebidas depois do Lipe\",\"habilidades\":[],\"resistencias\":\"Nenhuma\",\"imunidades\":\"Nenhuma\",\"ataques\":[{\"nome\":\"Soco\",\"dano\":\"1d6 contundente\"}]}'),
(4, 'Comparsa', 'Humano', 10, 10, '{\"atributos\":{\"forca\":12,\"destreza\":10,\"constituicao\":12,\"inteligencia\":10,\"sabedoria\":10,\"carisma\":12},\"informacoes\":\"O comparsa do Carlos que vai participar da competição também\",\"habilidades\":[],\"resistencias\":\"Nenhuma\",\"imunidades\":\"Nenhuma\",\"ataques\":[{\"nome\":\"Soco\",\"dano\":\"1d4 contundente\"}]}'),
(5, 'Wendel pref.', 'Meio Elfo', 8, 10, '{\"atributos\":{\"forca\":8,\"destreza\":14,\"constituicao\":10,\"inteligencia\":14,\"sabedoria\":12,\"carisma\":12},\"informacoes\":\"Prefeito de Phandalin, tem um cervo chamado Wallace\",\"habilidades\":[],\"resistencias\":\"Nenhuma\",\"imunidades\":\"Nenhuma\",\"ataques\":[]}'),
(6, 'Escanor', 'Humano', 22, 12, '{\"atributos\":{\"forca\":16,\"destreza\":8,\"constituicao\":16,\"inteligencia\":10,\"sabedoria\":12,\"carisma\":16},\"informacoes\":\"O ferreiro de Phandalin, quando com armadura tem 18 de CA. Cheio de cicatrizes de queimaduras e cortes espalhadas pelo corpo.\",\"habilidades\":[],\"resistencias\":\"Fogo\",\"imunidades\":\"Nenhuma\",\"ataques\":[]}');

-- --------------------------------------------------------

--
-- Estrutura para tabela `sessoes`
--

CREATE TABLE `sessoes` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `descricao` text DEFAULT NULL,
  `dados` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `sessoes`
--

INSERT INTO `sessoes` (`id`, `nome`, `descricao`, `dados`) VALUES
(6, 'Sessão 1 - A fuga', 'Desde a apresentação dos jogadores de forma descontraída, até a morte de um companheiro', '{\"locais\":[{\"id\":7,\"nome\":\"Phandalin\",\"tipo\":\"Vilarejo\",\"descricao\":\"O vilarejo principal, que aparecerá por muito ainda\",\"dados\":{\"npcs\":[{\"id\":3,\"nome\":\"Carlos\",\"raca\":\"Meio Orc\",\"vida\":15,\"ca\":12,\"dados\":{\"atributos\":{\"forca\":14,\"destreza\":8,\"constituicao\":16,\"inteligencia\":7,\"sabedoria\":6,\"carisma\":6},\"informacoes\":\"Um valentão Bêbado que vai chamar a competição de bebidas depois do Lipe\",\"habilidades\":[],\"resistencias\":\"Nenhuma\",\"imunidades\":\"Nenhuma\",\"ataques\":[{\"nome\":\"Soco\",\"dano\":\"1d6 contundente\"}]},\"instanceId\":1772484191361.4417,\"npcId\":3,\"ficha\":{\"id\":3,\"nome\":\"Carlos\",\"raca\":\"Meio Orc\",\"vida\":15,\"ca\":12,\"dados\":{\"atributos\":{\"forca\":14,\"destreza\":8,\"constituicao\":16,\"inteligencia\":7,\"sabedoria\":6,\"carisma\":6},\"informacoes\":\"Um valentão Bêbado que vai chamar a competição de bebidas depois do Lipe\",\"habilidades\":[],\"resistencias\":\"Nenhuma\",\"imunidades\":\"Nenhuma\",\"ataques\":[{\"nome\":\"Soco\",\"dano\":\"1d6 contundente\"}]}},\"numero\":1},{\"id\":4,\"nome\":\"Comparsa\",\"raca\":\"Humano\",\"vida\":10,\"ca\":10,\"dados\":{\"atributos\":{\"forca\":12,\"destreza\":10,\"constituicao\":12,\"inteligencia\":10,\"sabedoria\":10,\"carisma\":12},\"informacoes\":\"O comparsa do Carlos que vai participar da competição também\",\"habilidades\":[],\"resistencias\":\"Nenhuma\",\"imunidades\":\"Nenhuma\",\"ataques\":[{\"nome\":\"Soco\",\"dano\":\"1d4 contundente\"}]},\"instanceId\":1772484192897.7822,\"npcId\":4,\"ficha\":{\"id\":4,\"nome\":\"Comparsa\",\"raca\":\"Humano\",\"vida\":10,\"ca\":10,\"dados\":{\"atributos\":{\"forca\":12,\"destreza\":10,\"constituicao\":12,\"inteligencia\":10,\"sabedoria\":10,\"carisma\":12},\"informacoes\":\"O comparsa do Carlos que vai participar da competição também\",\"habilidades\":[],\"resistencias\":\"Nenhuma\",\"imunidades\":\"Nenhuma\",\"ataques\":[{\"nome\":\"Soco\",\"dano\":\"1d4 contundente\"}]}},\"numero\":1},{\"id\":5,\"nome\":\"Wendel pref.\",\"raca\":\"Meio Elfo\",\"vida\":8,\"ca\":10,\"dados\":{\"atributos\":{\"forca\":8,\"destreza\":14,\"constituicao\":10,\"inteligencia\":14,\"sabedoria\":12,\"carisma\":12},\"informacoes\":\"Prefeito de Phandalin, tem um cervo chamado Wallace\",\"habilidades\":[],\"resistencias\":\"Nenhuma\",\"imunidades\":\"Nenhuma\",\"ataques\":[]},\"instanceId\":1772484194857.8274,\"npcId\":5,\"ficha\":{\"id\":5,\"nome\":\"Wendel pref.\",\"raca\":\"Meio Elfo\",\"vida\":8,\"ca\":10,\"dados\":{\"atributos\":{\"forca\":8,\"destreza\":14,\"constituicao\":10,\"inteligencia\":14,\"sabedoria\":12,\"carisma\":12},\"informacoes\":\"Prefeito de Phandalin, tem um cervo chamado Wallace\",\"habilidades\":[],\"resistencias\":\"Nenhuma\",\"imunidades\":\"Nenhuma\",\"ataques\":[]}},\"numero\":1},{\"id\":6,\"nome\":\"Escanor\",\"raca\":\"Humano\",\"vida\":22,\"ca\":12,\"dados\":{\"atributos\":{\"forca\":16,\"destreza\":8,\"constituicao\":16,\"inteligencia\":10,\"sabedoria\":12,\"carisma\":16},\"informacoes\":\"O ferreiro de Phandalin, quando com armadura tem 18 de CA. Cheio de cicatrizes de queimaduras e cortes espalhadas pelo corpo.\",\"habilidades\":[],\"resistencias\":\"Fogo\",\"imunidades\":\"Nenhuma\",\"ataques\":[]},\"instanceId\":1772484196577.0479,\"npcId\":6,\"ficha\":{\"id\":6,\"nome\":\"Escanor\",\"raca\":\"Humano\",\"vida\":22,\"ca\":12,\"dados\":{\"atributos\":{\"forca\":16,\"destreza\":8,\"constituicao\":16,\"inteligencia\":10,\"sabedoria\":12,\"carisma\":16},\"informacoes\":\"O ferreiro de Phandalin, quando com armadura tem 18 de CA. Cheio de cicatrizes de queimaduras e cortes espalhadas pelo corpo.\",\"habilidades\":[],\"resistencias\":\"Fogo\",\"imunidades\":\"Nenhuma\",\"ataques\":[]}},\"numero\":1}],\"inimigos\":[{\"id\":34,\"nome\":\"Velho teddy\",\"tipo\":\"Bestas\",\"vida\":25,\"ca\":11,\"dados\":{\"atributos\":{\"forca\":15,\"destreza\":10,\"constituicao\":14,\"inteligencia\":2,\"sabedoria\":12,\"carisma\":7},\"habilidades\":[],\"resistencias\":\"Nenhuma\",\"imunidades\":\"Nenhuma\",\"ataques\":[{\"nome\":\"Mordida +3\",\"dano\":\"1d6 + 2 perfurante\"},{\"nome\":\"Garras +3\",\"dano\":\"2d4 + 2 cortante\"}],\"nd\":0.5,\"xp\":100},\"instanceId\":1772484201177.451,\"inimigoId\":34,\"ficha\":{\"id\":34,\"nome\":\"Velho teddy\",\"tipo\":\"Bestas\",\"vida\":25,\"ca\":11,\"dados\":{\"atributos\":{\"forca\":15,\"destreza\":10,\"constituicao\":14,\"inteligencia\":2,\"sabedoria\":12,\"carisma\":7},\"habilidades\":[],\"resistencias\":\"Nenhuma\",\"imunidades\":\"Nenhuma\",\"ataques\":[{\"nome\":\"Mordida +3\",\"dano\":\"1d6 + 2 perfurante\"},{\"nome\":\"Garras +3\",\"dano\":\"2d4 + 2 cortante\"}],\"nd\":0.5,\"xp\":100}},\"numero\":1}],\"itens\":[],\"consumiveis\":[{\"id\":3,\"nome\":\"Cerveja\",\"tipo\":\"Bebida\",\"descricao\":\"Uma bebida comum que está em todo bar\",\"efeito\":\"Se tomar mais do que sua constituição, salvaguarda de constituição CD 10 + número da dose para não ficar bêbado. \\nDesvantagem em acertos e testes de INT, SAB e CAR.\",\"duracao\":\"1 hora a 1 dia\",\"valor\":\"1 PO\",\"instanceId\":1772484218512.1304,\"consumivelId\":3,\"ficha\":{\"id\":3,\"nome\":\"Cerveja\",\"tipo\":\"Bebida\",\"descricao\":\"Uma bebida comum que está em todo bar\",\"efeito\":\"Se tomar mais do que sua constituição, salvaguarda de constituição CD 10 + número da dose para não ficar bêbado. \\nDesvantagem em acertos e testes de INT, SAB e CAR.\",\"duracao\":\"1 hora a 1 dia\",\"valor\":\"1 PO\"},\"numero\":1}],\"anotacoes\":[{\"id\":6,\"titulo\":\"Início\",\"tipo\":\"Lembrete\",\"informacoes\":\"Amanda e Manu estarão indo para Phandalin, pois escutaram sobre o novo restaurante que vai inaugurar logo e querem estar lá para ver a festa, no caminho, em um cruzamento triplo, irão encontrar a Lívia em dúvida de para onde ir, já que a placa está quebrada, vão ajudar ela e ir juntas. Um coelho preto de olhos vermelhos vai pular na frente delas, e aí é com elas. Chegando em Phandalin elas estarão soltas, mas devem ir ver o Kael no bar. Lipe vai estar fazendo um show no bar, e João estará na plateia, na frente do palco bebendo, elas podem falar com Kael, mas quando chegar no drop da música do Lipe irei interromper e fazer a cena foda. Depois da música um valentão chamado Carlos vai chamar eles para um desafio de bebidas.\\n\\nPagar 20 PO pra participar. \\nLembrando que podem sair a qualquer momento. \\n1° turno: bebem sem nada de mais\\n2° turno: Constituição CD 8\\n3° turno: Constituição CD 12\\n4° turno: ConstituiçãoCD 16\\nE por aí vai. \\nSe falhar na salvaguarda do quarto turno algo aleatório acontecerá a noite, e a pessoa n saberá de nada, aos demais, irei perguntar oq eles fazem depois do evento, as pessoas que chegarem no quarto turno acordam com um ponto de exaustão e dor de cabeça como ressaca.\",\"instanceId\":1772484224064.4773,\"anotacaoId\":6,\"ficha\":{\"id\":6,\"titulo\":\"Início\",\"tipo\":\"Lembrete\",\"informacoes\":\"Amanda e Manu estarão indo para Phandalin, pois escutaram sobre o novo restaurante que vai inaugurar logo e querem estar lá para ver a festa, no caminho, em um cruzamento triplo, irão encontrar a Lívia em dúvida de para onde ir, já que a placa está quebrada, vão ajudar ela e ir juntas. Um coelho preto de olhos vermelhos vai pular na frente delas, e aí é com elas. Chegando em Phandalin elas estarão soltas, mas devem ir ver o Kael no bar. Lipe vai estar fazendo um show no bar, e João estará na plateia, na frente do palco bebendo, elas podem falar com Kael, mas quando chegar no drop da música do Lipe irei interromper e fazer a cena foda. Depois da música um valentão chamado Carlos vai chamar eles para um desafio de bebidas.\\n\\nPagar 20 PO pra participar. \\nLembrando que podem sair a qualquer momento. \\n1° turno: bebem sem nada de mais\\n2° turno: Constituição CD 8\\n3° turno: Constituição CD 12\\n4° turno: ConstituiçãoCD 16\\nE por aí vai. \\nSe falhar na salvaguarda do quarto turno algo aleatório acontecerá a noite, e a pessoa n saberá de nada, aos demais, irei perguntar oq eles fazem depois do evento, as pessoas que chegarem no quarto turno acordam com um ponto de exaustão e dor de cabeça como ressaca.\"},\"numero\":1},{\"id\":7,\"titulo\":\"Tour\",\"tipo\":\"Evento\",\"informacoes\":\"Depois de eles afugentarem o velho teddy, no dia seguinte ao evento de bebidas, o prefeito agradece eles com 20 PO pra cada, e leva eles para um Tour por Phandalin, aí blz, tenho que pegar a foto e ir apresentando os lugares.\\n\\nDepois do tour quando estiverem passando pela igreja de novo vai ter o símbolo de um olho cortado feito em ketchup, com a escrita \\\"O observador irá se erguer\\\", caso a Manu use o óculos do tempo ela vai ver uma pessoa com túnica cinza claro  escrevendo isso, e ela deixando cair uma chave que tem esse olho e o número 61C. (pode ser encontrada naturalmente com percepção CD 14).\",\"instanceId\":1772484225792.084,\"anotacaoId\":7,\"ficha\":{\"id\":7,\"titulo\":\"Tour\",\"tipo\":\"Evento\",\"informacoes\":\"Depois de eles afugentarem o velho teddy, no dia seguinte ao evento de bebidas, o prefeito agradece eles com 20 PO pra cada, e leva eles para um Tour por Phandalin, aí blz, tenho que pegar a foto e ir apresentando os lugares.\\n\\nDepois do tour quando estiverem passando pela igreja de novo vai ter o símbolo de um olho cortado feito em ketchup, com a escrita \\\"O observador irá se erguer\\\", caso a Manu use o óculos do tempo ela vai ver uma pessoa com túnica cinza claro  escrevendo isso, e ela deixando cair uma chave que tem esse olho e o número 61C. (pode ser encontrada naturalmente com percepção CD 14).\"},\"numero\":1},{\"id\":8,\"titulo\":\"Pedido de ajuda\",\"tipo\":\"Missao\",\"informacoes\":\"O lojista asiático chamado Tekomo, vai pedir ajuda deles para irem atrás de uma caravana com destino ao vilarejo vizinho, mas que nunca chegou, e do grupo de aventureiros que ele já tinha mandado atrás dela. Quando eles adentrarem a floresta sombria o clima ficará meio pesado, e com um teste de percepção CD 12 para ver se estão ligados, eles podem encontrar rastros da caravana saíndo do caminho a força em direção a uma clareira, com patas de cavalos espalhadas loucamente até lá. Quando chegarem verão 2 chacais e 1 homem chacal que estavam comendo os cadáveres podres dos aventureiros, e se chegarem de forma furtiva podem atacar surpreendidos. Caixas de suprimentos da caravana estarão espalhadas pela clareira, a caravana vai estar quebrada no fundo, com um baú secreto dentro CD 12 investigação.\\n\\nos inimigos podem quebrar as caixas, são 10 no total, e cada uma vale 10 PO se entregue no próximo vilarejo\",\"instanceId\":1772484231312.3599,\"anotacaoId\":8,\"ficha\":{\"id\":8,\"titulo\":\"Pedido de ajuda\",\"tipo\":\"Missao\",\"informacoes\":\"O lojista asiático chamado Tekomo, vai pedir ajuda deles para irem atrás de uma caravana com destino ao vilarejo vizinho, mas que nunca chegou, e do grupo de aventureiros que ele já tinha mandado atrás dela. Quando eles adentrarem a floresta sombria o clima ficará meio pesado, e com um teste de percepção CD 12 para ver se estão ligados, eles podem encontrar rastros da caravana saíndo do caminho a força em direção a uma clareira, com patas de cavalos espalhadas loucamente até lá. Quando chegarem verão 2 chacais e 1 homem chacal que estavam comendo os cadáveres podres dos aventureiros, e se chegarem de forma furtiva podem atacar surpreendidos. Caixas de suprimentos da caravana estarão espalhadas pela clareira, a caravana vai estar quebrada no fundo, com um baú secreto dentro CD 12 investigação.\\n\\nos inimigos podem quebrar as caixas, são 10 no total, e cada uma vale 10 PO se entregue no próximo vilarejo\"},\"numero\":1}]},\"instanceId\":1772484403247.1863,\"localId\":7,\"infoBasica\":{\"nome\":\"Phandalin\",\"tipo\":\"Vilarejo\",\"descricao\":\"O vilarejo principal, que aparecerá por muito ainda\"}},{\"id\":8,\"nome\":\"Floresta Escura\",\"tipo\":\"Natural\",\"descricao\":\"Uma floresta densa, cheia de névoa pesada e árvores escuras, o vento assobia quando passa entre os galhos, todos os testes relaionados a visão tem desvantagem, visão de penumbra a até 3 metros.\",\"dados\":{\"npcs\":[],\"inimigos\":[{\"id\":35,\"nome\":\"Chacal\",\"tipo\":\"Bestas\",\"vida\":0,\"ca\":0,\"dados\":{\"atributos\":{\"forca\":10,\"destreza\":10,\"constituicao\":10,\"inteligencia\":10,\"sabedoria\":10,\"carisma\":10},\"habilidades\":[],\"resistencias\":\"Nenhuma\",\"imunidades\":\"Nenhuma\",\"ataques\":[],\"nd\":\"\",\"xp\":\"\"},\"instanceId\":1772484328000.0396,\"inimigoId\":35,\"ficha\":{\"id\":35,\"nome\":\"Chacal\",\"tipo\":\"Bestas\",\"vida\":0,\"ca\":0,\"dados\":{\"atributos\":{\"forca\":10,\"destreza\":10,\"constituicao\":10,\"inteligencia\":10,\"sabedoria\":10,\"carisma\":10},\"habilidades\":[],\"resistencias\":\"Nenhuma\",\"imunidades\":\"Nenhuma\",\"ataques\":[],\"nd\":\"\",\"xp\":\"\"}},\"numero\":1},{\"id\":36,\"nome\":\"Homem-Chacal\",\"tipo\":\"Humanoides\",\"vida\":0,\"ca\":0,\"dados\":{\"atributos\":{\"forca\":10,\"destreza\":10,\"constituicao\":10,\"inteligencia\":10,\"sabedoria\":10,\"carisma\":10},\"habilidades\":[],\"resistencias\":\"Nenhuma\",\"imunidades\":\"Nenhuma\",\"ataques\":[],\"nd\":\"\",\"xp\":\"\"},\"instanceId\":1772484329616.228,\"inimigoId\":36,\"ficha\":{\"id\":36,\"nome\":\"Homem-Chacal\",\"tipo\":\"Humanoides\",\"vida\":0,\"ca\":0,\"dados\":{\"atributos\":{\"forca\":10,\"destreza\":10,\"constituicao\":10,\"inteligencia\":10,\"sabedoria\":10,\"carisma\":10},\"habilidades\":[],\"resistencias\":\"Nenhuma\",\"imunidades\":\"Nenhuma\",\"ataques\":[],\"nd\":\"\",\"xp\":\"\"}},\"numero\":1},{\"id\":37,\"nome\":\"Wendigo\",\"tipo\":\"Mortos-vivos\",\"vida\":0,\"ca\":0,\"dados\":{\"atributos\":{\"forca\":10,\"destreza\":10,\"constituicao\":10,\"inteligencia\":10,\"sabedoria\":10,\"carisma\":10},\"habilidades\":[],\"resistencias\":\"Nenhuma\",\"imunidades\":\"Nenhuma\",\"ataques\":[],\"nd\":\"\",\"xp\":\"\"},\"instanceId\":1772484331472.8967,\"inimigoId\":37,\"ficha\":{\"id\":37,\"nome\":\"Wendigo\",\"tipo\":\"Mortos-vivos\",\"vida\":0,\"ca\":0,\"dados\":{\"atributos\":{\"forca\":10,\"destreza\":10,\"constituicao\":10,\"inteligencia\":10,\"sabedoria\":10,\"carisma\":10},\"habilidades\":[],\"resistencias\":\"Nenhuma\",\"imunidades\":\"Nenhuma\",\"ataques\":[],\"nd\":\"\",\"xp\":\"\"}},\"numero\":1},{\"id\":38,\"nome\":\"Morte\",\"tipo\":\"Mortos-vivos\",\"vida\":0,\"ca\":0,\"dados\":{\"atributos\":{\"forca\":10,\"destreza\":10,\"constituicao\":10,\"inteligencia\":10,\"sabedoria\":10,\"carisma\":10},\"habilidades\":[],\"resistencias\":\"Nenhuma\",\"imunidades\":\"Nenhuma\",\"ataques\":[],\"nd\":\"\",\"xp\":\"\"},\"instanceId\":1772484337999.717,\"inimigoId\":38,\"ficha\":{\"id\":38,\"nome\":\"Morte\",\"tipo\":\"Mortos-vivos\",\"vida\":0,\"ca\":0,\"dados\":{\"atributos\":{\"forca\":10,\"destreza\":10,\"constituicao\":10,\"inteligencia\":10,\"sabedoria\":10,\"carisma\":10},\"habilidades\":[],\"resistencias\":\"Nenhuma\",\"imunidades\":\"Nenhuma\",\"ataques\":[],\"nd\":\"\",\"xp\":\"\"}},\"numero\":1}],\"itens\":[{\"id\":1,\"nome\":\"Graveto\",\"tipo\":\"Arma\",\"descricao\":\"É um graveto encontrado no chão sem nada de especial\",\"valor\":\"0 PO\",\"raridade\":\"Comum\",\"efeito\":\"Nenhum\",\"instanceId\":1772484346119.8386,\"itemId\":1,\"ficha\":{\"id\":1,\"nome\":\"Graveto\",\"tipo\":\"Arma\",\"descricao\":\"É um graveto encontrado no chão sem nada de especial\",\"valor\":\"0 PO\",\"raridade\":\"Comum\",\"efeito\":\"Nenhum\"},\"numero\":1}],\"consumiveis\":[],\"anotacoes\":[{\"id\":9,\"titulo\":\"Perseguição\",\"tipo\":\"Evento\",\"informacoes\":\"Depois de explorarem a clareira e pegarem as caixas ele voltarão para a trilha, vou deixar eles conversarem um pouco, enquanto diminuo o volume da música, até o silêncio absoluto, onde peço um teste de intuição CD 12 como sexto sentido. Quem passar vai receber uma mensagem trêmula em sua cabeça, dizendo \\\"CORRA, e não olhe para trás\\\", se alguém olhar, salvaguarda de sabedoria CD 15 para não ficar paralisado por um turno, quem passar na intuição já começa com -1 falha, e assim começa a perseguição, em que todos jogam Destreza CD 10, quem chegar a 3 falhas primeiro (ou se todos chegarem a 10 sucessos) termina a perseguição, e tem sua cena de morte que quero criar na hora, violenta ou rápida dependendo de como a pessoa morrer.\",\"instanceId\":1772484351855.6938,\"anotacaoId\":9,\"ficha\":{\"id\":9,\"titulo\":\"Perseguição\",\"tipo\":\"Evento\",\"informacoes\":\"Depois de explorarem a clareira e pegarem as caixas ele voltarão para a trilha, vou deixar eles conversarem um pouco, enquanto diminuo o volume da música, até o silêncio absoluto, onde peço um teste de intuição CD 12 como sexto sentido. Quem passar vai receber uma mensagem trêmula em sua cabeça, dizendo \\\"CORRA, e não olhe para trás\\\", se alguém olhar, salvaguarda de sabedoria CD 15 para não ficar paralisado por um turno, quem passar na intuição já começa com -1 falha, e assim começa a perseguição, em que todos jogam Destreza CD 10, quem chegar a 3 falhas primeiro (ou se todos chegarem a 10 sucessos) termina a perseguição, e tem sua cena de morte que quero criar na hora, violenta ou rápida dependendo de como a pessoa morrer.\"},\"numero\":1},{\"id\":10,\"titulo\":\"Ressureição\",\"tipo\":\"Evento\",\"informacoes\":\"Quem morrer para o Wendigo vai ter um encontro com a morte em um lugar totalmente branco e cheio de névoa cinza espessa, e vai poder renascer contanto que perca 1 ponto de constituição temporariamente (maldição superior), e tem que seguir as ordens dela, se não toma dano necro, e vai ter como objetivo principal garantir que o cataclismo ocorra, também não pode relevar nada sobre esse termo de ressureição para ninguém.\",\"instanceId\":1772484353687.0774,\"anotacaoId\":10,\"ficha\":{\"id\":10,\"titulo\":\"Ressureição\",\"tipo\":\"Evento\",\"informacoes\":\"Quem morrer para o Wendigo vai ter um encontro com a morte em um lugar totalmente branco e cheio de névoa cinza espessa, e vai poder renascer contanto que perca 1 ponto de constituição temporariamente (maldição superior), e tem que seguir as ordens dela, se não toma dano necro, e vai ter como objetivo principal garantir que o cataclismo ocorra, também não pode relevar nada sobre esse termo de ressureição para ninguém.\"},\"numero\":1}]},\"instanceId\":1772484404912.2021,\"localId\":8,\"infoBasica\":{\"nome\":\"Floresta Escura\",\"tipo\":\"Natural\",\"descricao\":\"Uma floresta densa, cheia de névoa pesada e árvores escuras, o vento assobia quando passa entre os galhos, todos os testes relaionados a visão tem desvantagem, visão de penumbra a até 3 metros.\"}}]}');

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
-- Índices de tabela `sessoes`
--
ALTER TABLE `sessoes`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `anotacoes`
--
ALTER TABLE `anotacoes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `consumiveis`
--
ALTER TABLE `consumiveis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `inimigos`
--
ALTER TABLE `inimigos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT de tabela `itens`
--
ALTER TABLE `itens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `locais`
--
ALTER TABLE `locais`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `npcs`
--
ALTER TABLE `npcs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `sessoes`
--
ALTER TABLE `sessoes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
