-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:8889
-- Généré le : lun. 07 nov. 2022 à 13:58
-- Version du serveur :  5.7.34
-- Version de PHP : 7.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `Exercice-2-Evaluation`
--

-- --------------------------------------------------------

--
-- Structure de la table `Classes`
--

CREATE TABLE `Classes` (
  `ID_classe` int(11) NOT NULL,
  `nombre_eleves_classe` int(11) NOT NULL,
  `ID_ecole` int(11) NOT NULL,
  `ID_prof_responsable` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `Ecoles`
--

CREATE TABLE `Ecoles` (
  `ID_ecole` int(11) NOT NULL,
  `nom_ecole` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `Matières`
--

CREATE TABLE `Matières` (
  `ID_Matière` int(11) NOT NULL,
  `nom_matière` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `Profs`
--

CREATE TABLE `Profs` (
  `ID_professeur` int(11) NOT NULL,
  `nom_prof` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `Table_de_liaison_profs_matières`
--

CREATE TABLE `Table_de_liaison_profs_matières` (
  `ID_Profs` int(11) NOT NULL,
  `ID_Matières` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `Classes`
--
ALTER TABLE `Classes`
  ADD PRIMARY KEY (`ID_classe`),
  ADD KEY `Ecole_de_classe` (`ID_ecole`);

--
-- Index pour la table `Ecoles`
--
ALTER TABLE `Ecoles`
  ADD PRIMARY KEY (`ID_ecole`);

--
-- Index pour la table `Matières`
--
ALTER TABLE `Matières`
  ADD PRIMARY KEY (`ID_Matière`);

--
-- Index pour la table `Profs`
--
ALTER TABLE `Profs`
  ADD PRIMARY KEY (`ID_professeur`);

--
-- Index pour la table `Table_de_liaison_profs_matières`
--
ALTER TABLE `Table_de_liaison_profs_matières`
  ADD KEY `ID_Profs` (`ID_Profs`),
  ADD KEY `ID_Matières` (`ID_Matières`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `Classes`
--
ALTER TABLE `Classes`
  MODIFY `ID_classe` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Ecoles`
--
ALTER TABLE `Ecoles`
  MODIFY `ID_ecole` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Matières`
--
ALTER TABLE `Matières`
  MODIFY `ID_Matière` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Profs`
--
ALTER TABLE `Profs`
  MODIFY `ID_professeur` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `Classes`
--
ALTER TABLE `Classes`
  ADD CONSTRAINT `Ecole_de_classe` FOREIGN KEY (`ID_ecole`) REFERENCES `Ecoles` (`ID_ecole`),
  ADD CONSTRAINT `Prof_de_classe` FOREIGN KEY (`ID_classe`) REFERENCES `Profs` (`ID_professeur`);

--
-- Contraintes pour la table `Matières`
--
ALTER TABLE `Matières`
  ADD CONSTRAINT `ID_Matière` FOREIGN KEY (`ID_Matière`) REFERENCES `Profs` (`ID_professeur`);

--
-- Contraintes pour la table `Table_de_liaison_profs_matières`
--
ALTER TABLE `Table_de_liaison_profs_matières`
  ADD CONSTRAINT `ID_Matières` FOREIGN KEY (`ID_Matières`) REFERENCES `Matières` (`ID_Matière`),
  ADD CONSTRAINT `ID_Profs` FOREIGN KEY (`ID_Profs`) REFERENCES `Profs` (`ID_professeur`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
