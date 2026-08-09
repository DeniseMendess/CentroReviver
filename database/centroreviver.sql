-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3308
-- Tempo de geração: 09-Ago-2026 às 11:33
-- Versão do servidor: 10.4.32-MariaDB
-- versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `centroreviver`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `permissao`
--

CREATE TABLE `permissao` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `chavePermissao` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `permissao`
--

INSERT INTO `permissao` (`id`, `nome`, `chavePermissao`) VALUES
(1, 'Dashboard Super Administrador', 'DASHBOARD_SUPER_ADMIN'),
(2, 'Dashboard Administrador', 'DASHBOARD_ADMIN'),
(3, 'Dashboard Médico', 'DASHBOARD_MEDICO'),
(4, 'Dashboard Enfermeiro', 'DASHBOARD_ENFERMEIRO'),
(5, 'Cadastrar Usuario', 'USUARIO_CADASTRAR'),
(6, 'Listar Usuario', 'USUARIO_LISTAR'),
(7, 'Editar Usuario', 'USUARIO_EDITAR'),
(8, 'Excluir Usuario', 'USUARIO_EXCLUIR'),
(9, 'Cadastrar Paciente', 'PACIENTE_CADASTRAR'),
(10, 'Listar Paciente', 'PACIENTE_LISTAR'),
(11, 'Editar Paciente', 'PACIENTE_EDITAR'),
(12, 'Excluir Paciente', 'PACIENTE_EXCLUIR'),
(13, 'Cadastrar Triagem', 'TRIAGEM_CADASTRAR'),
(14, 'Listar Triagem', 'TRIAGEM_LISTAR'),
(15, 'Editar Triagem', 'TRIAGEM_EDITAR'),
(16, 'Excluir Triagem', 'TRIAGEM_EXCLUIR'),
(17, 'Cadastrar Consulta', 'CONSULTA_CADASTRAR'),
(18, 'Listar Consulta', 'CONSULTA_LISTAR'),
(19, 'Editar Consulta', 'CONSULTA_EDITAR'),
(20, 'Excluir Consulta', 'CONSULTA_EXCLUIR'),
(21, 'Cadastrar Exame', 'EXAME_CADASTRAR'),
(22, 'Listar Exame', 'EXAME_LISTAR'),
(23, 'Editar Exame', 'EXAME_EDITAR'),
(24, 'Solicitar Exame', 'EXAME_SOLICITAR'),
(25, 'Excluir Exame', 'EXAME_EXCLUIR'),
(26, 'Cadastrar Receita', 'RECEITA_CADASTRAR'),
(27, 'Listar Receita', 'RECEITA_LISTAR'),
(28, 'Editar Receita', 'RECEITA_EDITAR'),
(29, 'Excluir Receita', 'RECEITA_EXCLUIR'),
(30, 'Gerar Relatórios', 'RELATORIOS_GERAR');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pessoa`
--

CREATE TABLE `pessoa` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `dataNasc` date NOT NULL,
  `genero` enum('Feminino','Masculino') NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `bairro` varchar(255) NOT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `criadoEm` datetime DEFAULT current_timestamp(),
  `atualizadoEm` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` enum('ativo','deletado') DEFAULT 'ativo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `pessoa`
--

INSERT INTO `pessoa` (`id`, `nome`, `dataNasc`, `genero`, `telefone`, `bairro`, `foto`, `criadoEm`, `atualizadoEm`, `estado`) VALUES
(15, 'Denise Mendes', '2000-06-19', 'Feminino', '937753527', 'Sapú 2', NULL, '2026-07-23 23:41:12', '2026-07-23 23:41:12', 'ativo');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_usuario`
--

CREATE TABLE `tipo_usuario` (
  `id` int(11) NOT NULL,
  `cargo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `tipo_usuario`
--

INSERT INTO `tipo_usuario` (`id`, `cargo`) VALUES
(2, 'Administrador'),
(4, 'Enfermeiro'),
(3, 'Médico'),
(1, 'Super Administrador');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_usuario_permissao`
--

CREATE TABLE `tipo_usuario_permissao` (
  `id` int(11) NOT NULL,
  `tipoUsuarioId` int(11) NOT NULL,
  `permissaoId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `tipo_usuario_permissao`
--

INSERT INTO `tipo_usuario_permissao` (`id`, `tipoUsuarioId`, `permissaoId`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `senhaHash` varchar(255) NOT NULL,
  `estadoCivil` enum('Solteiro(a)','Casado(a)','Divorciado(a)','Viuvo(a)') DEFAULT 'Solteiro(a)',
  `BI` varchar(50) NOT NULL,
  `pessoaId` int(11) NOT NULL,
  `tipoUsuarioId` int(11) NOT NULL,
  `criadoPor` int(11) DEFAULT NULL,
  `atualizadoEm` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`id`, `email`, `senhaHash`, `estadoCivil`, `BI`, `pessoaId`, `tipoUsuarioId`, `criadoPor`, `atualizadoEm`) VALUES
(1, 'denisemendes259@gmail.com', '$2y$10$UMAfYZPFuBiawXHZvyocV.w62P2xZi8p5t3FM/r/Bzl7eKbSxwwTe', 'Solteiro(a)', '009802325LA304', 15, 1, NULL, '2026-07-24 04:27:03');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario_permissao`
--

CREATE TABLE `usuario_permissao` (
  `id` int(11) NOT NULL,
  `usuarioId` int(11) NOT NULL,
  `permissaoId` int(11) NOT NULL,
  `permitido` tinyint(1) NOT NULL,
  `criadoEm` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `permissao`
--
ALTER TABLE `permissao`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `chavePermissao` (`chavePermissao`);

--
-- Índices para tabela `pessoa`
--
ALTER TABLE `pessoa`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tipo_usuario`
--
ALTER TABLE `tipo_usuario`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cargo` (`cargo`);

--
-- Índices para tabela `tipo_usuario_permissao`
--
ALTER TABLE `tipo_usuario_permissao`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tipoUsuarioId` (`tipoUsuarioId`),
  ADD UNIQUE KEY `permissaoId` (`permissaoId`);

--
-- Índices para tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `BI` (`BI`),
  ADD KEY `fk_pessoa_id` (`pessoaId`),
  ADD KEY `fk_tipo_usuario` (`tipoUsuarioId`),
  ADD KEY `fk_usuario_criadoPor` (`criadoPor`);

--
-- Índices para tabela `usuario_permissao`
--
ALTER TABLE `usuario_permissao`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usuarioId` (`usuarioId`,`permissaoId`),
  ADD KEY `permissaoId` (`permissaoId`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `permissao`
--
ALTER TABLE `permissao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de tabela `pessoa`
--
ALTER TABLE `pessoa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de tabela `tipo_usuario`
--
ALTER TABLE `tipo_usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `tipo_usuario_permissao`
--
ALTER TABLE `tipo_usuario_permissao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `usuario_permissao`
--
ALTER TABLE `usuario_permissao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `tipo_usuario_permissao`
--
ALTER TABLE `tipo_usuario_permissao`
  ADD CONSTRAINT `tipo_usuario_permissao_ibfk_1` FOREIGN KEY (`tipoUsuarioId`) REFERENCES `tipo_usuario` (`id`),
  ADD CONSTRAINT `tipo_usuario_permissao_ibfk_2` FOREIGN KEY (`permissaoId`) REFERENCES `permissao` (`id`);

--
-- Limitadores para a tabela `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_pessoa_id` FOREIGN KEY (`pessoaId`) REFERENCES `pessoa` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tipo_usuario` FOREIGN KEY (`tipoUsuarioId`) REFERENCES `tipo_usuario` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_usuario_criadoPor` FOREIGN KEY (`criadoPor`) REFERENCES `usuario` (`id`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `usuario_permissao`
--
ALTER TABLE `usuario_permissao`
  ADD CONSTRAINT `usuario_permissao_ibfk_1` FOREIGN KEY (`usuarioId`) REFERENCES `usuario` (`id`),
  ADD CONSTRAINT `usuario_permissao_ibfk_2` FOREIGN KEY (`permissaoId`) REFERENCES `permissao` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
