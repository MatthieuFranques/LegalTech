-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  mar. 24 mai 2022 à 07:04
-- Version du serveur :  5.7.17
-- Version de PHP :  5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `legaltech`
--

-- --------------------------------------------------------

--
-- Structure de la table `connexion`
--

CREATE TABLE `connexion` (
  `ID_CONNEXION` bigint(4) NOT NULL,
  `ID_UTILISATEUR` int(4) NOT NULL,
  `LOGIN` char(32) DEFAULT NULL,
  `MDP` char(32) DEFAULT NULL,
  `TYPEC` char(32) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `connexion`
--

INSERT INTO `connexion` (`ID_CONNEXION`, `ID_UTILISATEUR`, `LOGIN`, `MDP`, `TYPEC`) VALUES
(1, 1, 'Utilisateur', 'Utilisateur', 'U'),
(2, 14, 'matt', 'a', 'U'),
(4, 16, 'franqum', 'mattdu12', 'U'),
(5, 17, 'val', 'val', 'U'),
(18, 18, 'Avocat', 'Avocat', 'A');

-- --------------------------------------------------------

--
-- Structure de la table `contenu_formulaire`
--

CREATE TABLE `contenu_formulaire` (
  `ID_CONTENU_FORMULAIRE` int(4) NOT NULL,
  `ID_UTILISATEUR` char(32) NOT NULL,
  `ID_FORMULAIRE` char(32) NOT NULL,
  `ID_ETAT` int(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `contenu_formulaire`
--

INSERT INTO `contenu_formulaire` (`ID_CONTENU_FORMULAIRE`, `ID_UTILISATEUR`, `ID_FORMULAIRE`, `ID_ETAT`) VALUES
(109, '18', '11', 1),
(108, '1', '4', 2),
(107, '1', '4', 3),
(106, '1', '10', 2);

-- --------------------------------------------------------

--
-- Structure de la table `etat`
--

CREATE TABLE `etat` (
  `ID_ETAT` int(4) NOT NULL,
  `LIBELLEE` char(75) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `etat`
--

INSERT INTO `etat` (`ID_ETAT`, `LIBELLEE`) VALUES
(1, 'En cours de traitement'),
(2, 'Validé'),
(3, 'Refusé');

-- --------------------------------------------------------

--
-- Structure de la table `formulaire`
--

CREATE TABLE `formulaire` (
  `ID_FORMULAIRE` char(32) NOT NULL,
  `TYPE` char(32) DEFAULT NULL,
  `LIBELLE` char(32) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `formulaire`
--

INSERT INTO `formulaire` (`ID_FORMULAIRE`, `TYPE`, `LIBELLE`) VALUES
('1', 'CE', 'SAS'),
('2', 'CE', 'SCI'),
('3', 'CE', 'SARL'),
('4', 'CE', 'Micro-Entreprise'),
('5', 'CO', 'Injonction d\'impayé'),
('6', 'CO', 'Dissolution-Radiation'),
('7', 'CO', 'Mise en demeure de recouvrement'),
('8', 'CO', 'Assignation en contrefaçon'),
('9', 'CO', 'Injonction de faire'),
('10', 'CE', 'SASU'),
('11', 'CE', 'EURL');

-- --------------------------------------------------------

--
-- Structure de la table `reponse_question`
--

CREATE TABLE `reponse_question` (
  `ID_REPONSE` int(4) NOT NULL,
  `ID_CONTENU_FORMULAIRE` int(4) NOT NULL,
  `CONTENU` longtext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `reponse_question`
--

INSERT INTO `reponse_question` (`ID_REPONSE`, `ID_CONTENU_FORMULAIRE`, `CONTENU`) VALUES
(82, 109, 'Moins de 3 mois'),
(81, 108, '12 Place st Sernin'),
(80, 108, 'btp31'),
(79, 108, 'BTP'),
(78, 108, 'Moins de 3 mois'),
(77, 107, 'Rodez'),
(76, 107, 'Tourisme aveyron'),
(75, 107, 'Tourisme'),
(74, 107, 'Moins de 3 mois'),
(73, 106, '18 rue Pharaon'),
(72, 106, 'Legal Entreprise'),
(71, 106, 'BTP'),
(70, 106, 'Plus de 3 mois'),
(66, 105, 'Plus de 3 mois'),
(67, 105, 'Tourisme'),
(68, 105, ''),
(69, 105, 'frf');

-- --------------------------------------------------------

--
-- Structure de la table `tarif`
--

CREATE TABLE `tarif` (
  `ID_TARIF` char(32) NOT NULL,
  `ID_FORMULAIRE` char(32) NOT NULL,
  `COUT` decimal(10,2) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `tarif`
--

INSERT INTO `tarif` (`ID_TARIF`, `ID_FORMULAIRE`, `COUT`) VALUES
('1', '1', '75.00'),
('2', '2', '150.00'),
('3', '3', '85.00'),
('4', '4', '49.00'),
('6', '6', '156.00'),
('5', '5', '45.00'),
('7', '7', '237.00'),
('8', '8', '320.00'),
('9', '9', '320.00'),
('10', '10', '150.00'),
('11', '11', '139.00');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `ID_UTILISATEUR` int(4) NOT NULL,
  `NOM` char(32) DEFAULT NULL,
  `PRENOM` char(32) DEFAULT NULL,
  `MAIL` char(32) DEFAULT NULL,
  `TELEPHONE` char(32) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`ID_UTILISATEUR`, `NOM`, `PRENOM`, `MAIL`, `TELEPHONE`) VALUES
(1, 'Utilisateur', 'Pierre', 'pierre@gmail.com', '0102030405'),
(16, 'Franques', 'Matthieu', 'mattdu12@gmail.com', '098765432'),
(17, 'DL', 'VAL', 'VAL.DEL@gmail.com', '098765432'),
(18, 'Avocat', 'Pierre', 'pierre@gmail.com', '0102030405'),
(14, 'matt', 'Matthieu', 'LegalEntreprise@gmail.com', '098765432');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `connexion`
--
ALTER TABLE `connexion`
  ADD PRIMARY KEY (`ID_CONNEXION`),
  ADD KEY `I_FK_CONNEXION_UTILISATEUR` (`ID_UTILISATEUR`);

--
-- Index pour la table `contenu_formulaire`
--
ALTER TABLE `contenu_formulaire`
  ADD PRIMARY KEY (`ID_CONTENU_FORMULAIRE`),
  ADD KEY `I_FK_CONTENU_FORMULAIRE_UTILISATEUR` (`ID_UTILISATEUR`),
  ADD KEY `I_FK_CONTENU_FORMULAIRE_FORMULAIRE` (`ID_FORMULAIRE`);

--
-- Index pour la table `etat`
--
ALTER TABLE `etat`
  ADD PRIMARY KEY (`ID_ETAT`);

--
-- Index pour la table `formulaire`
--
ALTER TABLE `formulaire`
  ADD PRIMARY KEY (`ID_FORMULAIRE`);

--
-- Index pour la table `reponse_question`
--
ALTER TABLE `reponse_question`
  ADD PRIMARY KEY (`ID_REPONSE`),
  ADD KEY `I_FK_REPONSE_QUESTION_CONTENU_FORMULAIRE` (`ID_CONTENU_FORMULAIRE`);

--
-- Index pour la table `tarif`
--
ALTER TABLE `tarif`
  ADD PRIMARY KEY (`ID_TARIF`),
  ADD KEY `I_FK_TARIF_FORMULAIRE` (`ID_FORMULAIRE`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`ID_UTILISATEUR`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `connexion`
--
ALTER TABLE `connexion`
  MODIFY `ID_CONNEXION` bigint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT pour la table `contenu_formulaire`
--
ALTER TABLE `contenu_formulaire`
  MODIFY `ID_CONTENU_FORMULAIRE` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;
--
-- AUTO_INCREMENT pour la table `reponse_question`
--
ALTER TABLE `reponse_question`
  MODIFY `ID_REPONSE` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;
--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `ID_UTILISATEUR` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
