-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Jun 06, 2023 at 12:50 AM
-- Server version: 10.6.11-MariaDB
-- PHP Version: 8.1.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `app`
--

-- --------------------------------------------------------

--
-- Table structure for table `business`
--

DROP TABLE IF EXISTS `business`;
CREATE TABLE IF NOT EXISTS `business` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(25) DEFAULT NULL,
  `postalcode` varchar(25) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `business`
--

INSERT INTO `business` (`id`, `name`, `address`, `city`, `state`, `postalcode`, `description`, `created`, `modified`) VALUES
(1, 'Surfside Web', '803 Oak St', 'Myrtle Beach', 'SC', '29577', 'Awesome place for web applications.', '2023-06-03 18:14:27', '2023-06-03 18:14:27'),
(2, 'Monster Reservations', '4503 Socastee Blvd', 'Myrtle Beach', 'SC', '29588', 'Reserve your timeshare today!', '2023-06-04 14:41:47', '2023-06-04 14:41:47');

--
-- Triggers `business`
--
DROP TRIGGER IF EXISTS `business_log_insert`;
DELIMITER $$
CREATE TRIGGER `business_log_insert` BEFORE INSERT ON `business` FOR EACH ROW BEGIN SET NEW.created = NOW(); SET NEW.modified = NOW(); END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `business_log_update`;
DELIMITER $$
CREATE TRIGGER `business_log_update` BEFORE UPDATE ON `business` FOR EACH ROW BEGIN SET NEW.modified = NOW(); END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `business_tag`
--

DROP TABLE IF EXISTS `business_tag`;
CREATE TABLE IF NOT EXISTS `business_tag` (
  `business_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`business_id`,`tag_id`),
  KEY `IDX_9DFA86F3A89DB457` (`business_id`),
  KEY `IDX_9DFA86F3BAD26311` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `business_tag`
--

INSERT INTO `business_tag` (`business_id`, `tag_id`) VALUES
(1, 18),
(1, 20),
(1, 21),
(1, 22),
(2, 14),
(2, 20),
(2, 21),
(2, 23);

-- --------------------------------------------------------

--
-- Table structure for table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
CREATE TABLE IF NOT EXISTS `doctrine_migration_versions` (
  `version` varchar(191) NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20230603203007', '2023-06-03 20:30:19', 94),
('DoctrineMigrations\\Version20230603211006', '2023-06-03 21:15:34', 60),
('DoctrineMigrations\\Version20230604192446', '2023-06-04 19:25:04', 48),
('DoctrineMigrations\\Version20230604193708', '2023-06-04 19:37:25', 16),
('DoctrineMigrations\\Version20230605210847', '2023-06-05 21:09:34', 39),
('DoctrineMigrations\\Version20230605211705', '2023-06-05 21:17:17', 9);

-- --------------------------------------------------------

--
-- Table structure for table `messenger_messages`
--

DROP TABLE IF EXISTS `messenger_messages`;
CREATE TABLE IF NOT EXISTS `messenger_messages` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `body` longtext NOT NULL,
  `headers` longtext NOT NULL,
  `queue_name` varchar(190) NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `available_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `delivered_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`),
  KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  KEY `IDX_75EA56E016BA31DB` (`delivered_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `search`
--

DROP TABLE IF EXISTS `search`;
CREATE TABLE IF NOT EXISTS `search` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `searchtext` longtext DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `search`
--

INSERT INTO `search` (`id`, `searchtext`, `created`, `modified`) VALUES
(1, 'dev', '2023-06-05 16:44:37', '2023-06-05 16:44:37'),
(2, 'dev', '2023-06-05 16:44:56', '2023-06-05 16:44:56'),
(3, 'dev', '2023-06-05 16:45:26', '2023-06-05 16:45:26'),
(4, 'dev', '2023-06-05 16:46:12', '2023-06-05 16:46:12'),
(5, 'dev', '2023-06-05 16:47:49', '2023-06-05 16:47:49'),
(6, 'dev', '2023-06-05 16:48:00', '2023-06-05 16:48:00');

--
-- Triggers `search`
--
DROP TRIGGER IF EXISTS `search_log_insert`;
DELIMITER $$
CREATE TRIGGER `search_log_insert` BEFORE INSERT ON `search` FOR EACH ROW BEGIN SET NEW.created = NOW(); SET NEW.modified = NOW(); END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `search_log_update`;
DELIMITER $$
CREATE TRIGGER `search_log_update` BEFORE UPDATE ON `search` FOR EACH ROW BEGIN SET NEW.modified = NOW(); END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `search_tag`
--

DROP TABLE IF EXISTS `search_tag`;
CREATE TABLE IF NOT EXISTS `search_tag` (
  `search_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`search_id`,`tag_id`),
  KEY `IDX_C732C33C650760A9` (`search_id`),
  KEY `IDX_C732C33CBAD26311` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `search_tag`
--

INSERT INTO `search_tag` (`search_id`, `tag_id`) VALUES
(1, 18),
(1, 20),
(1, 21),
(1, 23),
(2, 20),
(2, 21),
(2, 23),
(3, 20),
(3, 21),
(3, 23),
(4, 20),
(4, 21),
(4, 23),
(5, 20),
(5, 21),
(5, 23),
(6, 20),
(6, 21),
(6, 23);

-- --------------------------------------------------------

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
CREATE TABLE IF NOT EXISTS `tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tag`
--

INSERT INTO `tag` (`id`, `name`, `created`, `modified`) VALUES
(1, 'Pool', '2023-06-03 17:16:18', '2023-06-04 12:20:08'),
(2, 'Golf', '2023-06-03 17:16:24', '2023-06-04 12:20:15'),
(3, 'Marina', '2023-06-04 12:20:28', '2023-06-04 12:20:28'),
(4, 'Basketball Court', '2023-06-04 12:20:39', '2023-06-04 12:20:39'),
(5, 'Bike Trails', '2023-06-04 12:20:49', '2023-06-04 12:20:49'),
(6, 'Boat Dock', '2023-06-04 12:21:01', '2023-06-04 12:21:01'),
(7, 'Barbecue', '2023-06-04 12:21:19', '2023-06-04 12:21:19'),
(8, 'Playground', '2023-06-04 12:21:39', '2023-06-04 12:21:39'),
(9, 'Sauna', '2023-06-04 12:21:46', '2023-06-04 12:21:46'),
(10, 'Tennis Court', '2023-06-04 12:21:54', '2023-06-04 12:21:54'),
(11, 'Hot Tub', '2023-06-04 12:22:06', '2023-06-04 12:22:06'),
(12, 'Waterfront', '2023-06-04 12:26:30', '2023-06-04 12:26:30'),
(13, 'Fitness Center', '2023-06-04 12:28:07', '2023-06-04 12:28:07'),
(14, 'Valet Parking', '2023-06-04 12:29:03', '2023-06-04 12:29:03'),
(15, 'Garage', '2023-06-04 12:29:11', '2023-06-04 12:29:11'),
(16, 'Elevator', '2023-06-04 12:29:29', '2023-06-04 12:29:29'),
(17, 'Billiard Room', '2023-06-04 12:30:02', '2023-06-04 12:30:02'),
(18, 'Bar', '2023-06-04 12:30:12', '2023-06-04 12:30:12'),
(19, 'Restaurant', '2023-06-04 15:00:34', '2023-06-04 15:00:34'),
(20, 'Web Design', '2023-06-04 15:00:43', '2023-06-04 15:00:43'),
(21, 'Databases', '2023-06-04 15:00:54', '2023-06-04 15:00:54'),
(22, 'Web Hosting', '2023-06-04 15:01:02', '2023-06-04 15:01:02'),
(23, 'Service', '2023-06-04 15:01:20', '2023-06-04 15:01:20');

--
-- Triggers `tag`
--
DROP TRIGGER IF EXISTS `tag_log_insert`;
DELIMITER $$
CREATE TRIGGER `tag_log_insert` BEFORE INSERT ON `tag` FOR EACH ROW BEGIN SET NEW.created = NOW(); SET NEW.modified = NOW(); END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `tag_log_update`;
DELIMITER $$
CREATE TRIGGER `tag_log_update` BEFORE UPDATE ON `tag` FOR EACH ROW BEGIN SET NEW.modified = NOW(); END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(180) NOT NULL,
  `roles` longtext NOT NULL COMMENT '(DC2Type:json)',
  `password` varchar(255) NOT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `firstname`, `lastname`) VALUES
(1, 'scott.e.reynolds.phone@gmail.com', '[\"ROLE_USER\", \"ROLE_ADMIN\"]', '$2y$13$jAR7FGkY.4od1W17o4NR2utoYXaoJkpj1TsUkNgxsECYfJcgMglAq', 'Scott', 'Reynolds');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `business_tag`
--
ALTER TABLE `business_tag`
  ADD CONSTRAINT `FK_9DFA86F3A89DB457` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_9DFA86F3BAD26311` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `search_tag`
--
ALTER TABLE `search_tag`
  ADD CONSTRAINT `FK_C732C33C650760A9` FOREIGN KEY (`search_id`) REFERENCES `search` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_C732C33CBAD26311` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
