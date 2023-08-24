-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : jeu. 24 août 2023 à 11:57
-- Version du serveur : 10.11.3-MariaDB
-- Version de PHP : 8.2.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `JobBoard`
--

-- --------------------------------------------------------

--
-- Structure de la table `city`
--

CREATE TABLE `city` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `city`
--

INSERT INTO `city` (`id`, `name`) VALUES
(1, 'Giraud'),
(2, 'Dijoux'),
(3, 'Diallo'),
(4, 'Renaud-les-Bains'),
(5, 'Hubert'),
(6, 'Normand'),
(7, 'Gros-sur-Mer'),
(8, 'Gosselin'),
(9, 'Andre-les-Bains'),
(10, 'Bouvier'),
(11, 'Seguin'),
(12, 'Descamps'),
(13, 'Lacroix-sur-Mathieu'),
(14, 'Labbedan'),
(15, 'Pottier-la-Forêt'),
(16, 'Gauthier'),
(17, 'Launay'),
(18, 'Hamon'),
(19, 'Masson'),
(20, 'Ruiz'),
(41, 'Paris');

-- --------------------------------------------------------

--
-- Structure de la table `company`
--

CREATE TABLE `company` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `company`
--

INSERT INTO `company` (`id`, `name`) VALUES
(1, 'Joseph'),
(2, 'Allard SARL'),
(3, 'Sanchez'),
(4, 'Morin'),
(5, 'Neveu S.A.R.L.'),
(6, 'Guyon'),
(7, 'Leroy'),
(8, 'Dufour'),
(9, 'Lombard Hardy S.A.S.'),
(10, 'Girard'),
(11, 'Lombard'),
(12, 'Martin'),
(13, 'Martel Michaud et Fils'),
(14, 'Petitjean'),
(15, 'Lamy'),
(16, 'Laporte'),
(17, 'Bernard SA'),
(18, 'Bigot'),
(19, 'Brun et Fils'),
(20, 'Mallet Peron SARL');

-- --------------------------------------------------------

--
-- Structure de la table `contract_type`
--

CREATE TABLE `contract_type` (
  `id` int(11) NOT NULL,
  `contract_type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `contract_type`
--

INSERT INTO `contract_type` (`id`, `contract_type`) VALUES
(1, 'CDD'),
(2, 'Stage'),
(3, 'Alternance'),
(4, 'Freelance'),
(5, 'CDI');

-- --------------------------------------------------------

--
-- Structure de la table `job_ad`
--

CREATE TABLE `job_ad` (
  `id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  `contract_type_id` int(11) NOT NULL,
  `job_type_id` int(11) NOT NULL,
  `upload_date` date NOT NULL,
  `update_date` date NOT NULL,
  `job_ad_name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `job_ad`
--

INSERT INTO `job_ad` (`id`, `company_id`, `city_id`, `contract_type_id`, `job_type_id`, `upload_date`, `update_date`, `job_ad_name`, `description`, `image`) VALUES
(1, 18, 2, 4, 3, '2023-07-23', '2022-12-14', 'Designer', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'https://plus.unsplash.com/premium_photo-1674761372146-fd8871c08374?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=200&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTY5Mjg3NzMwNw&ixlib=rb-4.0.3&q=80&w=200'),
(2, 13, 7, 5, 9, '2023-07-25', '2022-09-05', 'Développeur', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'https://images.unsplash.com/photo-1691264122434-3b5a1dac81d5?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=200&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTY5Mjg3NzM5MA&ixlib=rb-4.0.3&q=80&w=200'),
(3, 7, 1, 5, 7, '2023-01-30', '2022-12-18', 'Autre', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'https://images.unsplash.com/photo-1691859323511-009bd4148295?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=200&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTY5Mjg3NzQyMw&ixlib=rb-4.0.3&q=80&w=200'),
(4, 10, 13, 4, 8, '2023-08-20', '2023-04-30', 'Commercial', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'https://images.unsplash.com/photo-1691155056059-82a814c79240?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=200&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTY5Mjg3NzQwOQ&ixlib=rb-4.0.3&q=80&w=200'),
(5, 20, 11, 3, 5, '2023-02-17', '2023-06-20', 'Autre', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'https://plus.unsplash.com/premium_photo-1673029926917-40a9e3336b5b?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=200&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTY5Mjg3NzQyMw&ixlib=rb-4.0.3&q=80&w=200'),
(6, 1, 17, 3, 3, '2022-09-16', '2023-05-06', 'Juridique', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'https://plus.unsplash.com/premium_photo-1691948105905-46c20aa7c335?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=200&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTY5Mjg3NzQyNA&ixlib=rb-4.0.3&q=80&w=200'),
(7, 5, 19, 2, 4, '2023-05-31', '2022-12-11', 'Développeur', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'https://images.unsplash.com/photo-1516908205727-40afad9449a8?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=200&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTY5Mjg3NzQyMw&ixlib=rb-4.0.3&q=80&w=200'),
(8, 15, 17, 5, 9, '2023-05-03', '2023-08-04', 'Autre', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'https://images.unsplash.com/photo-1691544931894-52f012e69000?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=200&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTY5Mjg3NzI2OA&ixlib=rb-4.0.3&q=80&w=200'),
(9, 11, 15, 4, 5, '2023-07-13', '2023-05-07', 'Finance', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'https://images.unsplash.com/photo-1692605914042-a96efa521086?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=200&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTY5Mjg3NzQyNA&ixlib=rb-4.0.3&q=80&w=200'),
(10, 13, 14, 4, 2, '2023-04-16', '2023-08-02', 'Communication', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'https://images.unsplash.com/photo-1692736230086-970c58a6af31?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=200&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTY5Mjg3NzQyMw&ixlib=rb-4.0.3&q=80&w=200'),
(11, 10, 5, 4, 2, '2023-01-10', '2023-08-09', 'Commercial', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'https://images.unsplash.com/photo-1690915611188-2d6e2fc30c1f?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=200&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTY5Mjg3NzQyNA&ixlib=rb-4.0.3&q=80&w=200'),
(12, 13, 2, 2, 2, '2023-06-06', '2023-06-03', 'RH', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'https://images.unsplash.com/photo-1691441131439-19b4587e30d5?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=200&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTY5Mjg3NzE4Mw&ixlib=rb-4.0.3&q=80&w=200'),
(13, 11, 20, 3, 6, '2023-01-11', '2023-08-08', 'Commercial', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'https://plus.unsplash.com/premium_photo-1691948105905-46c20aa7c335?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=200&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTY5Mjg3NzQyNA&ixlib=rb-4.0.3&q=80&w=200'),
(14, 6, 12, 4, 6, '2023-01-03', '2023-03-21', 'Commercial', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'https://plus.unsplash.com/premium_photo-1691868613734-4d9c6dd34c1c?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=200&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTY5Mjg3NzQyNA&ixlib=rb-4.0.3&q=80&w=200'),
(15, 11, 11, 3, 6, '2023-07-01', '2023-05-09', 'RH', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'https://plus.unsplash.com/premium_photo-1673283380425-0f41f67db1c0?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=200&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTY5Mjg3NzQyNA&ixlib=rb-4.0.3&q=80&w=200'),
(16, 14, 17, 3, 7, '2023-02-19', '2023-01-15', 'Commercial', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'https://images.unsplash.com/photo-1690984806741-451b34409f17?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=200&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTY5Mjg3NzQyNA&ixlib=rb-4.0.3&q=80&w=200'),
(17, 10, 10, 2, 4, '2023-03-17', '2023-02-05', 'Communication', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'https://images.unsplash.com/photo-1692007081099-eacaf058af14?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=200&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTY5Mjg3NzQyNA&ixlib=rb-4.0.3&q=80&w=200'),
(18, 14, 14, 4, 3, '2023-04-03', '2023-03-07', 'Designer', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'https://plus.unsplash.com/premium_photo-1683147670995-a9338b7ab00b?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=200&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTY5Mjg3NzQyNQ&ixlib=rb-4.0.3&q=80&w=200'),
(19, 13, 2, 1, 5, '2022-09-23', '2023-05-28', 'Développeur', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'https://plus.unsplash.com/premium_photo-1673239605865-bfcab01dca06?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=200&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTY5Mjg3NzQyNQ&ixlib=rb-4.0.3&q=80&w=200'),
(20, 19, 18, 5, 2, '2023-06-22', '2023-05-15', 'Juridique', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'https://images.unsplash.com/photo-1690671667654-618d5ad38b21?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=200&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTY5Mjg3NzQyNQ&ixlib=rb-4.0.3&q=80&w=200'),
(21, 1, 9, 3, 5, '2023-06-30', '2023-06-13', 'Finance', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'https://images.unsplash.com/photo-1666013943155-40fdb51f0bd0?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=200&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTY5Mjg3NzQyNA&ixlib=rb-4.0.3&q=80&w=200'),
(22, 6, 15, 3, 7, '2023-07-01', '2022-10-16', 'Finance', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'https://images.unsplash.com/photo-1603748623205-8665c0836241?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=200&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTY5Mjg3NzQyNQ&ixlib=rb-4.0.3&q=80&w=200'),
(23, 13, 20, 2, 9, '2023-05-03', '2023-05-22', 'Finance', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'https://images.unsplash.com/photo-1691225557634-863116e2eb1b?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=200&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTY5Mjg3NzQyNQ&ixlib=rb-4.0.3&q=80&w=200'),
(24, 6, 5, 5, 1, '2022-11-04', '2022-11-26', 'Juridique', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'https://plus.unsplash.com/premium_photo-1672242576944-bc571388a2c4?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=200&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTY5Mjg3NzQyNQ&ixlib=rb-4.0.3&q=80&w=200'),
(25, 7, 16, 3, 1, '2023-06-05', '2023-04-11', 'Autre', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'https://plus.unsplash.com/premium_photo-1673002094103-b2657755f800?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=200&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTY5Mjg3NzQyNQ&ixlib=rb-4.0.3&q=80&w=200'),
(26, 15, 2, 1, 5, '2023-06-11', '2023-06-20', 'Designer', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'https://plus.unsplash.com/premium_photo-1691592718398-bafc8c7cfdad?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=200&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTY5Mjg3NzQyNQ&ixlib=rb-4.0.3&q=80&w=200'),
(27, 15, 3, 5, 3, '2023-07-28', '2022-10-25', 'RH', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'https://images.unsplash.com/photo-1691509376984-01ccc4c54dd2?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=200&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTY5Mjg3NzQyNQ&ixlib=rb-4.0.3&q=80&w=200'),
(28, 15, 6, 3, 3, '2023-05-17', '2022-10-22', 'Designer', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'https://images.unsplash.com/photo-1692095296815-943c0e214cd0?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=200&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTY5Mjg3NzQyNQ&ixlib=rb-4.0.3&q=80&w=200'),
(29, 19, 16, 3, 9, '2023-07-01', '2023-08-14', 'Autre', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'https://images.unsplash.com/photo-1692791754463-c4782e14e367?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=200&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTY5Mjg3NzQyNA&ixlib=rb-4.0.3&q=80&w=200'),
(30, 20, 20, 3, 3, '2023-06-05', '2022-11-08', 'Marketing', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'https://plus.unsplash.com/premium_photo-1682470006825-3d693cc05320?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=200&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTY5Mjg3NzQyNg&ixlib=rb-4.0.3&q=80&w=200'),
(31, 2, 10, 2, 3, '2023-05-30', '2023-08-05', 'Marketing', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'https://plus.unsplash.com/premium_photo-1671395156589-60e35bfb346a?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=200&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTY5Mjg3NzQyNQ&ixlib=rb-4.0.3&q=80&w=200'),
(32, 11, 1, 4, 3, '2023-05-28', '2023-05-09', 'Communication', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'https://images.unsplash.com/photo-1646021780609-9c908307edc5?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=200&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTY5Mjg3NzQyNA&ixlib=rb-4.0.3&q=80&w=200'),
(33, 4, 10, 3, 6, '2023-05-29', '2023-07-20', 'Développeur', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'https://images.unsplash.com/photo-1690297692857-daf5d94076f5?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=200&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTY5Mjg3NzQyNQ&ixlib=rb-4.0.3&q=80&w=200'),
(34, 18, 3, 3, 4, '2023-03-26', '2023-05-30', 'Communication', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'https://plus.unsplash.com/premium_photo-1688464908137-b210f7df7f5b?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=200&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTY5Mjg3NzQyNg&ixlib=rb-4.0.3&q=80&w=200'),
(35, 2, 17, 4, 5, '2022-11-08', '2023-06-01', 'RH', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'https://plus.unsplash.com/premium_photo-1663030812574-793cee6f3491?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=200&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTY5Mjg3NzQyNg&ixlib=rb-4.0.3&q=80&w=200'),
(36, 12, 10, 1, 2, '2023-04-05', '2023-07-04', 'Designer', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'https://plus.unsplash.com/premium_photo-1689693057637-65556cc083f4?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=200&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTY5Mjg3NzQyNg&ixlib=rb-4.0.3&q=80&w=200'),
(37, 7, 14, 5, 5, '2023-03-10', '2023-07-05', 'RH', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'https://plus.unsplash.com/premium_photo-1670590830058-8a75600c10e1?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=200&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTY5Mjg3NzQyNg&ixlib=rb-4.0.3&q=80&w=200'),
(38, 10, 20, 5, 5, '2023-02-02', '2023-03-08', 'Développeur', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'https://plus.unsplash.com/premium_photo-1692287215128-97a2ee2dfcfa?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=200&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTY5Mjg3NzQyNg&ixlib=rb-4.0.3&q=80&w=200'),
(39, 3, 2, 1, 6, '2023-07-11', '2023-05-01', 'Commercial', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'https://plus.unsplash.com/premium_photo-1689751740042-3031b760b34f?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=200&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTY5Mjg3NzQyNw&ixlib=rb-4.0.3&q=80&w=200'),
(40, 10, 9, 2, 3, '2022-12-22', '2022-11-13', 'Juridique', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'https://images.unsplash.com/photo-1691782465514-5c7e4c76a558?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=200&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTY5Mjg3NzQyNw&ixlib=rb-4.0.3&q=80&w=200'),
(41, 16, 19, 1, 4, '2022-10-15', '2023-04-19', 'Autre', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'https://plus.unsplash.com/premium_photo-1686575437960-c3eb86c3f00f?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=200&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTY5Mjg3NzQyNw&ixlib=rb-4.0.3&q=80&w=200'),
(42, 1, 13, 4, 7, '2023-07-11', '2022-10-19', 'Communication', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'https://images.unsplash.com/photo-1691155056059-82a814c79240?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=200&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTY5Mjg3NzQyNw&ixlib=rb-4.0.3&q=80&w=200'),
(43, 20, 7, 5, 4, '2023-06-12', '2022-08-28', 'Marketing', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'https://images.unsplash.com/photo-1681256172482-ae5740706fe6?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=200&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTY5Mjg3NzQyNg&ixlib=rb-4.0.3&q=80&w=200'),
(44, 17, 2, 4, 5, '2022-08-28', '2022-10-22', 'Designer', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'https://images.unsplash.com/photo-1691997365297-258325a5e9d1?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=200&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTY5Mjg3NzQyNg&ixlib=rb-4.0.3&q=80&w=200'),
(45, 17, 7, 4, 4, '2022-12-02', '2023-02-13', 'Autre', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'https://images.unsplash.com/photo-1690055899078-63be27a01cdc?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=200&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTY5Mjg3NzQyNw&ixlib=rb-4.0.3&q=80&w=200'),
(46, 2, 6, 2, 5, '2023-03-03', '2022-10-20', 'Designer', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'https://images.unsplash.com/photo-1691629028503-0fc680775da4?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=200&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTY5Mjg3NzQyNg&ixlib=rb-4.0.3&q=80&w=200'),
(47, 20, 14, 3, 3, '2023-02-14', '2022-10-09', 'Commercial', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'https://images.unsplash.com/photo-1690859532357-30c444a0d2d9?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=200&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTY5Mjg3NzQyNw&ixlib=rb-4.0.3&q=80&w=200'),
(48, 6, 19, 1, 9, '2023-06-27', '2023-07-16', 'Finance', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'https://plus.unsplash.com/premium_photo-1682913884645-3cd2e794908e?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=200&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTY5Mjg3NzQyNw&ixlib=rb-4.0.3&q=80&w=200'),
(49, 11, 4, 4, 9, '2022-11-27', '2023-05-11', 'Commercial', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'https://plus.unsplash.com/premium_photo-1673254849347-8d4a5f51c5cc?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=200&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTY5Mjg3NzQyNg&ixlib=rb-4.0.3&q=80&w=200'),
(50, 13, 6, 4, 7, '2022-10-30', '2023-06-03', 'Communication', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'https://images.unsplash.com/photo-1691378647797-58dd658d6081?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=200&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTY5Mjg3NzQyNw&ixlib=rb-4.0.3&q=80&w=200');

-- --------------------------------------------------------

--
-- Structure de la table `job_type`
--

CREATE TABLE `job_type` (
  `id` int(11) NOT NULL,
  `job_type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `job_type`
--

INSERT INTO `job_type` (`id`, `job_type`) VALUES
(1, 'Design'),
(2, 'Marketing'),
(3, 'Communication'),
(4, 'Commercial'),
(5, 'RH'),
(6, 'Finance'),
(7, 'Juridique'),
(8, 'Autre'),
(9, 'Développement'),
(19, 'Vendeur');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `contract_type`
--
ALTER TABLE `contract_type`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `job_ad`
--
ALTER TABLE `job_ad`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_C339C4A1979B1AD6` (`company_id`),
  ADD KEY `IDX_C339C4A18BAC62AF` (`city_id`),
  ADD KEY `IDX_C339C4A1CD1DF15B` (`contract_type_id`),
  ADD KEY `IDX_C339C4A15FA33B08` (`job_type_id`);

--
-- Index pour la table `job_type`
--
ALTER TABLE `job_type`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `city`
--
ALTER TABLE `city`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT pour la table `company`
--
ALTER TABLE `company`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT pour la table `contract_type`
--
ALTER TABLE `contract_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `job_ad`
--
ALTER TABLE `job_ad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT pour la table `job_type`
--
ALTER TABLE `job_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `job_ad`
--
ALTER TABLE `job_ad`
  ADD CONSTRAINT `FK_C339C4A15FA33B08` FOREIGN KEY (`job_type_id`) REFERENCES `job_type` (`id`),
  ADD CONSTRAINT `FK_C339C4A18BAC62AF` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`),
  ADD CONSTRAINT `FK_C339C4A1979B1AD6` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`),
  ADD CONSTRAINT `FK_C339C4A1CD1DF15B` FOREIGN KEY (`contract_type_id`) REFERENCES `contract_type` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
