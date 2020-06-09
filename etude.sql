-- phpMyAdmin SQL Dump
-- version 4.5.4.1
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Mar 09 Juin 2020 à 13:10
-- Version du serveur :  5.7.11
-- Version de PHP :  7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `etude`
--

-- --------------------------------------------------------

--
-- Structure de la table `etudiant`
--

CREATE TABLE `etudiant` (
  `id` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `Matiere` varchar(50) NOT NULL,
  `note` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `etudiant`
--

INSERT INTO `etudiant` (`id`, `nom`, `prenom`, `Matiere`, `note`) VALUES
(1, 'ADRAS', 'Romain', 'SLAM 3', 10),
(2, 'GARNIER', 'Wilson', 'SLAM 4', 15),
(3, 'MAHON', 'Thomas', 'Anglais', 14);

--
-- Déclencheurs `etudiant`
--
DELIMITER $$
CREATE TRIGGER `after_delete_employe` BEFORE DELETE ON `etudiant` FOR EACH ROW BEGIN
    INSERT INTO etudiant_histo (
        id, 
        nom, 
        prenom, 
        Matiere,
        note,
        date_histo,
        evenement_histo
        )
    VALUES (
        OLD.id,
        OLD.nom,
        OLD.prenom,
        OLD.Matiere,
        OLD.note,
        
now(),
      
        'DELETE');
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_update_etudiant` AFTER UPDATE ON `etudiant` FOR EACH ROW BEGIN
    INSERT INTO etudiant_histo (
        id, 
        nom, 
        prenom, 
        Matiere,
        note,
        date_histo,
        evenement_histo
         )
        
    VALUES (
        OLD.id,
        OLD.nom,
        OLD.prenom,
        OLD.Matiere,
        OLD.note,
        
now(),
     
        'UPDATE');
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `etudiant_histo`
--

CREATE TABLE `etudiant_histo` (
  `id` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `Matiere` varchar(50) NOT NULL,
  `note` int(11) NOT NULL,
  `date_histo` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `evenement_histo` char(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `etudiant_histo`
--

INSERT INTO `etudiant_histo` (`id`, `nom`, `prenom`, `Matiere`, `note`, `date_histo`, `evenement_histo`) VALUES
(3, 'MAHON', 'Thomasko', 'Anglais', 14, '2020-06-09 13:09:39', 'UPDATE');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `etudiant`
--
ALTER TABLE `etudiant`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `etudiant_histo`
--
ALTER TABLE `etudiant_histo`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `etudiant`
--
ALTER TABLE `etudiant`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
