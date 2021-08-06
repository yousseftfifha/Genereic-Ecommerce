-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 06 août 2021 à 20:13
-- Version du serveur :  5.7.19
-- Version de PHP : 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `3s2i`
--

-- --------------------------------------------------------

--
-- Structure de la table `address`
--

DROP TABLE IF EXISTS `address`;
CREATE TABLE IF NOT EXISTS `address` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `zipcode` varchar(255) DEFAULT NULL,
  `type_address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `address_customer`
--

DROP TABLE IF EXISTS `address_customer`;
CREATE TABLE IF NOT EXISTS `address_customer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `zipcode` varchar(255) DEFAULT NULL,
  `type_address` varchar(255) DEFAULT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK7jsd9ypl6vxj3t9t62urp8ru4` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `address_customer`
--

INSERT INTO `address_customer` (`id`, `city`, `country`, `state`, `street`, `zipcode`, `type_address`, `customer_id`) VALUES
(1, 'ezzahra', 'Tunisia', 'Gouvernorat of Tunis', '16 rue kairouan', '2034', 'DELIVERY', 2);

-- --------------------------------------------------------

--
-- Structure de la table `cart`
--

DROP TABLE IF EXISTS `cart`;
CREATE TABLE IF NOT EXISTS `cart` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `quantity` int(11) DEFAULT NULL,
  `productid` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKkh5di77cfr01hq05rbcogspec` (`productid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKpgmhfouqt5uv16jdndcust0or` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=305 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id`, `parent_id`, `name`, `description`, `url`) VALUES
(1, NULL, 'Electronics', 'Electronics is the study and use of electrical devices that operate at relatively low voltages by controlling the flow of electrons or other electrically charged particles in devices such as thermionic valves and semiconductors. ', 'http://localhost:8081/downloadFile/cpu.svg'),
(3, NULL, 'Computers', ' supercomputers, mainframe computers, minicomputers, microcomputers, and finally mobile computers.', 'http://localhost:8081/downloadFile/laptop.svg'),
(4, NULL, 'SmartHome', 'a home equipped with lighting, heating, and electronic devices that can be controlled remotely by smartphone or computer.', 'http://localhost:8081/downloadFile/smarthome.svg'),
(5, NULL, 'Arts & Gifts', 'something given voluntarily without payment in return, as to show favor toward someone, honor an occasion, or make a gesture of assistance; present. ... something bestowed or acquired without any particular effort by the recipient or without its being earned: Those extra points he got in the game were a total gift.', 'http://localhost:8081/downloadFile/gift-bag.svg'),
(6, NULL, 'Automotive', 'relating to or concerned with motor vehicles.', 'http://localhost:8081/downloadFile/car.svg'),
(7, NULL, 'Baby', 'Baby\'s daily tools', 'http://localhost:8081/downloadFile/baby-boy.svg'),
(9, NULL, 'Beauty & personal care', ' Beauty and personal care is an art field that addresses the looks and health of someone\'s hair, nails, and skin. This field of beauty and personal care encompasses a wide range of careers such as stylists, barbers, manicurists, pedicurists, makeup artists, and education.', 'http://localhost:8081/downloadFile/skincare.svg'),
(10, NULL, 'Women\'s fashion', 'a popular or the latest style of clothing, hair, decoration, or behaviour.', 'http://localhost:8081/downloadFile/fashion.svg'),
(11, NULL, 'Men\'s fashion', 'An increase in influential new designers has questioned the fundamentals of apparels and has led to a novel line of clothing style for the postmodern male.', 'http://localhost:8081/downloadFile/fashion%20(1).svg'),
(12, NULL, 'Boys\'s fashion', 'An increase in influential new designers has questioned the fundamentals of apparels and has led to a novel line of clothing style for the postmodern male.', 'http://localhost:8081/downloadFile/worker.svg'),
(13, NULL, 'Health & Household', 'Tax filer + spouse + tax dependents = household. ... Include your spouse and tax dependents even if they don\'t need health coverage.', 'http://localhost:8081/downloadFile/woman.svg'),
(14, NULL, 'Home & kitchen', 'Home & kitchen daily Tools', 'http://localhost:8081/downloadFile/kitchen.svg'),
(15, NULL, 'Industrial & Scientific', 'It is this science that is employed by production companies in order to develop, adapt, and produce a product for the consumer market', 'http://localhost:8081/downloadFile/contruction.svg'),
(16, NULL, 'Luggage', 'suitcases or other bags in which to pack personal belongings for travelling.', 'http://localhost:8081/downloadFile/suitcase.svg'),
(17, NULL, 'Movies & Television', 'Television film. A television film is a feature-length motion picture that is produced and originally distributed by or to a television network, in contrast to theatrical films made explicitly for initial showing in movie theaters', 'http://localhost:8081/downloadFile/movies.svg'),
(18, NULL, 'Pet Supplies', 'Retail store services for the sale of pet food, pet supplies, pet accessories, foodstuffs for animals, animal requisites. tmClass.\nPeople also ask', 'http://localhost:8081/downloadFile/pet-supplies.svg'),
(19, NULL, 'Software', 'Software is the programs and routines for a computer or the program material for an electronic device which make it run. An example of software is Excel or Windows or iTunes', 'http://localhost:8081/downloadFile/software.svg'),
(20, NULL, 'Sports & Outdoor', 'a sport that is played outdoors. field sport. hunting, hunt - the pursuit and killing or capture of wild animals regarded as a sport. fishing, sportfishing - the act of someone who fishes as a diversion. athletics, sport - an active diversion requiring physical exertion and competition', 'http://localhost:8081/downloadFile/sport.svg'),
(21, NULL, 'Tools & Home Improvement', 'Home improvement can consist of projects that upgrade an existing home interior (such as electrical and plumbing), exterior (masonry, concrete, siding, roofing) ...', 'http://localhost:8081/downloadFile/home-repair.svg'),
(22, NULL, 'Toys & Games', 'Toys and games are the tools of play, and play is a large part of social life. ... Adults gave them to children during festival times, and the young made toys for themselves in moments of freedom from control or work out of gourds, bits of wood, or animal parts.', 'http://localhost:8081/downloadFile/puzzle.svg'),
(23, NULL, 'Video Games', 'a game played by electronically manipulating images produced by a computer program on a monitor or other display.', 'http://localhost:8081/downloadFile/console.svg'),
(24, 1, 'Accessories & Supplies', 'Electronics is the study and use of electrical devices that operate at relatively low voltages by controlling the flow of electrons or other electrically charged particles in devices such as thermionic valves and semiconductors. ', 'http://localhost:8081/downloadFile/cpu.svg'),
(25, 1, 'Camera & Photo', 'Electronics is the study and use of electrical devices that operate at relatively low voltages by controlling the flow of electrons or other electrically charged particles in devices such as thermionic valves and semiconductors. ', 'http://localhost:8081/downloadFile/cpu.svg'),
(26, 1, 'Car & Vehicle Electronics', 'Electronics is the study and use of electrical devices that operate at relatively low voltages by controlling the flow of electrons or other electrically charged particles in devices such as thermionic valves and semiconductors. ', 'http://localhost:8081/downloadFile/cpu.svg'),
(27, 1, 'Cell Phones & Accessories', 'Electronics is the study and use of electrical devices that operate at relatively low voltages by controlling the flow of electrons or other electrically charged particles in devices such as thermionic valves and semiconductors. ', 'http://localhost:8081/downloadFile/cpu.svg'),
(28, 1, 'Computers & Accessories', 'Electronics is the study and use of electrical devices that operate at relatively low voltages by controlling the flow of electrons or other electrically charged particles in devices such as thermionic valves and semiconductors. ', 'http://localhost:8081/downloadFile/cpu.svg'),
(29, 1, 'GPS & Navigation', 'Electronics is the study and use of electrical devices that operate at relatively low voltages by controlling the flow of electrons or other electrically charged particles in devices such as thermionic valves and semiconductors. ', 'http://localhost:8081/downloadFile/cpu.svg'),
(30, 1, 'Headphones', 'Electronics is the study and use of electrical devices that operate at relatively low voltages by controlling the flow of electrons or other electrically charged particles in devices such as thermionic valves and semiconductors. ', 'http://localhost:8081/downloadFile/cpu.svg'),
(31, 1, 'Home Audio', 'Electronics is the study and use of electrical devices that operate at relatively low voltages by controlling the flow of electrons or other electrically charged particles in devices such as thermionic valves and semiconductors. ', 'http://localhost:8081/downloadFile/cpu.svg'),
(32, 1, 'Office Electronics', 'Electronics is the study and use of electrical devices that operate at relatively low voltages by controlling the flow of electrons or other electrically charged particles in devices such as thermionic valves and semiconductors. ', 'http://localhost:8081/downloadFile/cpu.svg'),
(33, 1, 'Portable Audio & Video', 'Electronics is the study and use of electrical devices that operate at relatively low voltages by controlling the flow of electrons or other electrically charged particles in devices such as thermionic valves and semiconductors. ', 'http://localhost:8081/downloadFile/cpu.svg'),
(34, 1, 'Security & Surveillance', 'Electronics is the study and use of electrical devices that operate at relatively low voltages by controlling the flow of electrons or other electrically charged particles in devices such as thermionic valves and semiconductors. ', 'http://localhost:8081/downloadFile/cpu.svg'),
(35, 1, 'Service Plans', 'Electronics is the study and use of electrical devices that operate at relatively low voltages by controlling the flow of electrons or other electrically charged particles in devices such as thermionic valves and semiconductors. ', 'http://localhost:8081/downloadFile/cpu.svg'),
(36, 1, 'Television & Video', 'Electronics is the study and use of electrical devices that operate at relatively low voltages by controlling the flow of electrons or other electrically charged particles in devices such as thermionic valves and semiconductors. ', 'http://localhost:8081/downloadFile/cpu.svg'),
(37, 1, 'Video Game Consoles & Accessories', 'Electronics is the study and use of electrical devices that operate at relatively low voltages by controlling the flow of electrons or other electrically charged particles in devices such as thermionic valves and semiconductors. ', 'http://localhost:8081/downloadFile/cpu.svg'),
(38, 1, 'Video Projectors', 'Electronics is the study and use of electrical devices that operate at relatively low voltages by controlling the flow of electrons or other electrically charged particles in devices such as thermionic valves and semiconductors. ', 'http://localhost:8081/downloadFile/cpu.svg'),
(39, 1, 'Accessories & Supplies', 'Electronics is the study and use of electrical devices that operate at relatively low voltages by controlling the flow of electrons or other electrically charged particles in devices such as thermionic valves and semiconductors. ', 'http://localhost:8081/downloadFile/cpu.svg'),
(40, 1, 'eBook Readers & Accessories', 'Electronics is the study and use of electrical devices that operate at relatively low voltages by controlling the flow of electrons or other electrically charged particles in devices such as thermionic valves and semiconductors. ', 'http://localhost:8081/downloadFile/cpu.svg'),
(41, 3, 'Computer Accessories & Peripherals', ' supercomputers, mainframe computers, minicomputers, microcomputers, and finally mobile computers.', 'http://localhost:8081/downloadFile/laptop.svg'),
(42, 3, 'Computer Components', ' supercomputers, mainframe computers, minicomputers, microcomputers, and finally mobile computers.', 'http://localhost:8081/downloadFile/laptop.svg'),
(43, 3, 'Computers & Tablets', ' supercomputers, mainframe computers, minicomputers, microcomputers, and finally mobile computers.', 'http://localhost:8081/downloadFile/laptop.svg'),
(44, 3, 'Data Storage', ' supercomputers, mainframe computers, minicomputers, microcomputers, and finally mobile computers.', 'http://localhost:8081/downloadFile/laptop.svg'),
(45, 3, 'External Components', ' supercomputers, mainframe computers, minicomputers, microcomputers, and finally mobile computers.', 'http://localhost:8081/downloadFile/laptop.svg'),
(46, 3, 'Laptop Accessories', ' supercomputers, mainframe computers, minicomputers, microcomputers, and finally mobile computers.', 'http://localhost:8081/downloadFile/laptop.svg'),
(47, 3, 'Monitors', ' supercomputers, mainframe computers, minicomputers, microcomputers, and finally mobile computers.', 'http://localhost:8081/downloadFile/laptop.svg'),
(48, 3, 'Networking Products', ' supercomputers, mainframe computers, minicomputers, microcomputers, and finally mobile computers.', 'http://localhost:8081/downloadFile/laptop.svg'),
(49, 3, 'Power Strips & Surge Protectors', ' supercomputers, mainframe computers, minicomputers, microcomputers, and finally mobile computers.', 'http://localhost:8081/downloadFile/laptop.svg'),
(50, 3, 'Printers', ' supercomputers, mainframe computers, minicomputers, microcomputers, and finally mobile computers.', 'http://localhost:8081/downloadFile/laptop.svg'),
(51, 3, 'Scanners', ' supercomputers, mainframe computers, minicomputers, microcomputers, and finally mobile computers.', 'http://localhost:8081/downloadFile/laptop.svg'),
(52, 3, 'Servers', ' supercomputers, mainframe computers, minicomputers, microcomputers, and finally mobile computers.', 'http://localhost:8081/downloadFile/laptop.svg'),
(53, 3, 'Tablet Accessories', ' supercomputers, mainframe computers, minicomputers, microcomputers, and finally mobile computers.', 'http://localhost:8081/downloadFile/laptop.svg'),
(54, 3, 'Tablet Replacement Parts', ' supercomputers, mainframe computers, minicomputers, microcomputers, and finally mobile computers.', 'http://localhost:8081/downloadFile/laptop.svg'),
(55, 3, 'Warranties & Services', ' supercomputers, mainframe computers, minicomputers, microcomputers, and finally mobile computers.', 'http://localhost:8081/downloadFile/laptop.svg'),
(56, 4, 'Amazon Smart Home', 'a home equipped with lighting, heating, and electronic devices that can be controlled remotely by smartphone or computer.', 'http://localhost:8081/downloadFile/smarthome.svg'),
(57, 4, 'Smart Home Lighting', 'a home equipped with lighting, heating, and electronic devices that can be controlled remotely by smartphone or computer.', 'http://localhost:8081/downloadFile/smarthome.svg'),
(58, 4, 'Smart Locks and Entry', 'a home equipped with lighting, heating, and electronic devices that can be controlled remotely by smartphone or computer.', 'http://localhost:8081/downloadFile/smarthome.svg'),
(59, 4, 'Plugs and Outlets', 'a home equipped with lighting, heating, and electronic devices that can be controlled remotely by smartphone or computer.', 'http://localhost:8081/downloadFile/smarthome.svg'),
(60, 4, 'Security Cameras and Systems', 'a home equipped with lighting, heating, and electronic devices that can be controlled remotely by smartphone or computer.', 'http://localhost:8081/downloadFile/smarthome.svg'),
(61, 4, 'New Smart Devices', 'a home equipped with lighting, heating, and electronic devices that can be controlled remotely by smartphone or computer.', 'http://localhost:8081/downloadFile/smarthome.svg'),
(62, 4, 'Heating and Cooling', 'a home equipped with lighting, heating, and electronic devices that can be controlled remotely by smartphone or computer.', 'http://localhost:8081/downloadFile/smarthome.svg'),
(63, 4, 'Detectors and Sensors', 'a home equipped with lighting, heating, and electronic devices that can be controlled remotely by smartphone or computer.', 'http://localhost:8081/downloadFile/smarthome.svg'),
(64, 4, 'Home Entertainment', 'a home equipped with lighting, heating, and electronic devices that can be controlled remotely by smartphone or computer.', 'http://localhost:8081/downloadFile/smarthome.svg'),
(65, 4, 'Pet', 'a home equipped with lighting, heating, and electronic devices that can be controlled remotely by smartphone or computer.', 'http://localhost:8081/downloadFile/smarthome.svg'),
(66, 4, 'Voice Assistants and Hubs', 'a home equipped with lighting, heating, and electronic devices that can be controlled remotely by smartphone or computer.', 'http://localhost:8081/downloadFile/smarthome.svg'),
(67, 4, 'Kitchen', 'a home equipped with lighting, heating, and electronic devices that can be controlled remotely by smartphone or computer.', 'http://localhost:8081/downloadFile/smarthome.svg'),
(68, 4, 'Vacuums and Mops', 'a home equipped with lighting, heating, and electronic devices that can be controlled remotely by smartphone or computer.', 'http://localhost:8081/downloadFile/smarthome.svg'),
(69, 4, 'Lawn and Garden', 'a home equipped with lighting, heating, and electronic devices that can be controlled remotely by smartphone or computer.', 'http://localhost:8081/downloadFile/smarthome.svg'),
(70, 4, 'WIFI and Networking', 'a home equipped with lighting, heating, and electronic devices that can be controlled remotely by smartphone or computer.', 'http://localhost:8081/downloadFile/smarthome.svg'),
(71, 4, 'Other Solutions', 'a home equipped with lighting, heating, and electronic devices that can be controlled remotely by smartphone or computer.', 'http://localhost:8081/downloadFile/smarthome.svg'),
(72, 5, 'Painting, Drawing & Art Supplies', 'something given voluntarily without payment in return, as to show favor toward someone, honor an occasion, or make a gesture of assistance; present. ... something bestowed or acquired without any particular effort by the recipient or without its being earned: Those extra points he got in the game were a total gift.', 'http://localhost:8081/downloadFile/gift-bag.svg'),
(73, 5, 'Beading & Jewelry Making', 'something given voluntarily without payment in return, as to show favor toward someone, honor an occasion, or make a gesture of assistance; present. ... something bestowed or acquired without any particular effort by the recipient or without its being earned: Those extra points he got in the game were a total gift.', 'http://localhost:8081/downloadFile/gift-bag.svg'),
(74, 5, 'Crafting', 'something given voluntarily without payment in return, as to show favor toward someone, honor an occasion, or make a gesture of assistance; present. ... something bestowed or acquired without any particular effort by the recipient or without its being earned: Those extra points he got in the game were a total gift.', 'http://localhost:8081/downloadFile/gift-bag.svg'),
(75, 5, 'Fabric', 'something given voluntarily without payment in return, as to show favor toward someone, honor an occasion, or make a gesture of assistance; present. ... something bestowed or acquired without any particular effort by the recipient or without its being earned: Those extra points he got in the game were a total gift.', 'http://localhost:8081/downloadFile/gift-bag.svg'),
(76, 5, 'Fabric Decorating', 'something given voluntarily without payment in return, as to show favor toward someone, honor an occasion, or make a gesture of assistance; present. ... something bestowed or acquired without any particular effort by the recipient or without its being earned: Those extra points he got in the game were a total gift.', 'http://localhost:8081/downloadFile/gift-bag.svg'),
(77, 5, 'Knitting & Crochet', 'something given voluntarily without payment in return, as to show favor toward someone, honor an occasion, or make a gesture of assistance; present. ... something bestowed or acquired without any particular effort by the recipient or without its being earned: Those extra points he got in the game were a total gift.', 'http://localhost:8081/downloadFile/gift-bag.svg'),
(78, 5, 'Needlework', 'something given voluntarily without payment in return, as to show favor toward someone, honor an occasion, or make a gesture of assistance; present. ... something bestowed or acquired without any particular effort by the recipient or without its being earned: Those extra points he got in the game were a total gift.', 'http://localhost:8081/downloadFile/gift-bag.svg'),
(79, 5, 'Organization, Storage & Transport', 'something given voluntarily without payment in return, as to show favor toward someone, honor an occasion, or make a gesture of assistance; present. ... something bestowed or acquired without any particular effort by the recipient or without its being earned: Those extra points he got in the game were a total gift.', 'http://localhost:8081/downloadFile/gift-bag.svg'),
(80, 5, 'Printmaking', 'something given voluntarily without payment in return, as to show favor toward someone, honor an occasion, or make a gesture of assistance; present. ... something bestowed or acquired without any particular effort by the recipient or without its being earned: Those extra points he got in the game were a total gift.', 'http://localhost:8081/downloadFile/gift-bag.svg'),
(81, 5, 'Scrapbooking & Stamping', 'something given voluntarily without payment in return, as to show favor toward someone, honor an occasion, or make a gesture of assistance; present. ... something bestowed or acquired without any particular effort by the recipient or without its being earned: Those extra points he got in the game were a total gift.', 'http://localhost:8081/downloadFile/gift-bag.svg'),
(82, 5, 'Sewing', 'something given voluntarily without payment in return, as to show favor toward someone, honor an occasion, or make a gesture of assistance; present. ... something bestowed or acquired without any particular effort by the recipient or without its being earned: Those extra points he got in the game were a total gift.', 'http://localhost:8081/downloadFile/gift-bag.svg'),
(83, 5, 'Party Decorations & Supplies', 'something given voluntarily without payment in return, as to show favor toward someone, honor an occasion, or make a gesture of assistance; present. ... something bestowed or acquired without any particular effort by the recipient or without its being earned: Those extra points he got in the game were a total gift.', 'http://localhost:8081/downloadFile/gift-bag.svg'),
(84, 5, 'Gift Wrapping Supplies', 'something given voluntarily without payment in return, as to show favor toward someone, honor an occasion, or make a gesture of assistance; present. ... something bestowed or acquired without any particular effort by the recipient or without its being earned: Those extra points he got in the game were a total gift.', 'http://localhost:8081/downloadFile/gift-bag.svg'),
(85, 6, 'Car Care', 'relating to or concerned with motor vehicles.', 'http://localhost:8081/downloadFile/car.svg'),
(86, 6, 'Car Electronics & Accessories', 'relating to or concerned with motor vehicles.', 'http://localhost:8081/downloadFile/car.svg'),
(87, 6, 'Interior Accessories', 'relating to or concerned with motor vehicles.', 'http://localhost:8081/downloadFile/car.svg'),
(88, 6, 'Lights & Lighting Accessories', 'relating to or concerned with motor vehicles.', 'http://localhost:8081/downloadFile/car.svg'),
(89, 6, 'Exterior Accessories', 'relating to or concerned with motor vehicles.', 'http://localhost:8081/downloadFile/car.svg'),
(90, 6, 'Motorcycle & Powersports', 'relating to or concerned with motor vehicles.', 'http://localhost:8081/downloadFile/car.svg'),
(91, 6, 'Oils & Fluids', 'relating to or concerned with motor vehicles.', 'http://localhost:8081/downloadFile/car.svg'),
(92, 6, 'Paint & Paint Supplies', 'relating to or concerned with motor vehicles.', 'http://localhost:8081/downloadFile/car.svg'),
(93, 6, 'Performance Parts & Accessories', 'relating to or concerned with motor vehicles.', 'http://localhost:8081/downloadFile/car.svg'),
(94, 6, 'Replacement Parts', 'relating to or concerned with motor vehicles.', 'http://localhost:8081/downloadFile/car.svg'),
(95, 6, 'RV Parts & Accessories', 'relating to or concerned with motor vehicles.', 'http://localhost:8081/downloadFile/car.svg'),
(96, 6, 'Tires & Wheels', 'relating to or concerned with motor vehicles.', 'http://localhost:8081/downloadFile/car.svg'),
(97, 6, 'Tools & Equipment', 'relating to or concerned with motor vehicles.', 'http://localhost:8081/downloadFile/car.svg'),
(98, 6, 'Automotive Enthusiast Merchandise', 'relating to or concerned with motor vehicles.', 'http://localhost:8081/downloadFile/car.svg'),
(99, 6, 'Heavy Duty & Commercial Vehicle Equipment', 'relating to or concerned with motor vehicles.', 'http://localhost:8081/downloadFile/car.svg'),
(100, 7, 'Activity & Entertainment', 'Baby\'s daily tools', 'http://localhost:8081/downloadFile/baby-boy.svg'),
(101, 7, 'Baby & Toddler Toys', 'Baby\'s daily tools', 'http://localhost:8081/downloadFile/baby-boy.svg'),
(102, 7, 'Apparel & Accessories', 'Baby\'s daily tools', 'http://localhost:8081/downloadFile/baby-boy.svg'),
(103, 7, 'Baby Care', 'Baby\'s daily tools', 'http://localhost:8081/downloadFile/baby-boy.svg'),
(104, 7, 'Baby Stationery', 'Baby\'s daily tools', 'http://localhost:8081/downloadFile/baby-boy.svg'),
(105, 7, 'Car Seats & Accessories', 'Baby\'s daily tools', 'http://localhost:8081/downloadFile/baby-boy.svg'),
(106, 7, 'Diapering', 'Baby\'s daily tools', 'http://localhost:8081/downloadFile/baby-boy.svg'),
(107, 7, 'Feeding', 'Baby\'s daily tools', 'http://localhost:8081/downloadFile/baby-boy.svg'),
(108, 7, 'Gifts', 'Baby\'s daily tools', 'http://localhost:8081/downloadFile/baby-boy.svg'),
(109, 7, 'Nursery', 'Baby\'s daily tools', 'http://localhost:8081/downloadFile/baby-boy.svg'),
(110, 7, 'Potty Training', 'Baby\'s daily tools', 'http://localhost:8081/downloadFile/baby-boy.svg'),
(111, 7, 'Pregnancy & Maternity', 'Baby\'s daily tools', 'http://localhost:8081/downloadFile/baby-boy.svg'),
(112, 7, 'Safety', 'Baby\'s daily tools', 'http://localhost:8081/downloadFile/baby-boy.svg'),
(113, 7, 'Strollers & Accessories', 'Baby\'s daily tools', 'http://localhost:8081/downloadFile/baby-boy.svg'),
(114, 7, 'Travel Gear', 'Baby\'s daily tools', 'http://localhost:8081/downloadFile/baby-boy.svg'),
(115, 9, 'Makeup', ' Beauty and personal care is an art field that addresses the looks and health of someone\'s hair, nails, and skin. This field of beauty and personal care encompasses a wide range of careers such as stylists, barbers, manicurists, pedicurists, makeup artists, and education.', 'http://localhost:8081/downloadFile/skincare.svg'),
(116, 9, 'Skin Care', ' Beauty and personal care is an art field that addresses the looks and health of someone\'s hair, nails, and skin. This field of beauty and personal care encompasses a wide range of careers such as stylists, barbers, manicurists, pedicurists, makeup artists, and education.', 'http://localhost:8081/downloadFile/skincare.svg'),
(117, 9, 'Hair Care', ' Beauty and personal care is an art field that addresses the looks and health of someone\'s hair, nails, and skin. This field of beauty and personal care encompasses a wide range of careers such as stylists, barbers, manicurists, pedicurists, makeup artists, and education.', 'http://localhost:8081/downloadFile/skincare.svg'),
(118, 9, 'Fragrance', ' Beauty and personal care is an art field that addresses the looks and health of someone\'s hair, nails, and skin. This field of beauty and personal care encompasses a wide range of careers such as stylists, barbers, manicurists, pedicurists, makeup artists, and education.', 'http://localhost:8081/downloadFile/skincare.svg'),
(119, 9, 'Foot, Hand & Nail Care', ' Beauty and personal care is an art field that addresses the looks and health of someone\'s hair, nails, and skin. This field of beauty and personal care encompasses a wide range of careers such as stylists, barbers, manicurists, pedicurists, makeup artists, and education.', 'http://localhost:8081/downloadFile/skincare.svg'),
(120, 9, 'Tools & Accessories', ' Beauty and personal care is an art field that addresses the looks and health of someone\'s hair, nails, and skin. This field of beauty and personal care encompasses a wide range of careers such as stylists, barbers, manicurists, pedicurists, makeup artists, and education.', 'http://localhost:8081/downloadFile/skincare.svg'),
(121, 9, 'Shave & Hair Removal', ' Beauty and personal care is an art field that addresses the looks and health of someone\'s hair, nails, and skin. This field of beauty and personal care encompasses a wide range of careers such as stylists, barbers, manicurists, pedicurists, makeup artists, and education.', 'http://localhost:8081/downloadFile/skincare.svg'),
(122, 9, 'Personal Care', ' Beauty and personal care is an art field that addresses the looks and health of someone\'s hair, nails, and skin. This field of beauty and personal care encompasses a wide range of careers such as stylists, barbers, manicurists, pedicurists, makeup artists, and education.', 'http://localhost:8081/downloadFile/skincare.svg'),
(123, 9, 'Oral Care', ' Beauty and personal care is an art field that addresses the looks and health of someone\'s hair, nails, and skin. This field of beauty and personal care encompasses a wide range of careers such as stylists, barbers, manicurists, pedicurists, makeup artists, and education.', 'http://localhost:8081/downloadFile/skincare.svg'),
(124, 10, 'Shoes', 'a popular or the latest style of clothing, hair, decoration, or behaviour.', 'http://localhost:8081/downloadFile/fashion.svg'),
(125, 10, 'Clothing', 'a popular or the latest style of clothing, hair, decoration, or behaviour.', 'http://localhost:8081/downloadFile/fashion.svg'),
(126, 10, 'Jewelry', 'a popular or the latest style of clothing, hair, decoration, or behaviour.', 'http://localhost:8081/downloadFile/fashion.svg'),
(127, 10, 'Watches', 'a popular or the latest style of clothing, hair, decoration, or behaviour.', 'http://localhost:8081/downloadFile/fashion.svg'),
(128, 10, 'Handbags', 'a popular or the latest style of clothing, hair, decoration, or behaviour.', 'http://localhost:8081/downloadFile/fashion.svg'),
(129, 10, 'Accessories', 'a popular or the latest style of clothing, hair, decoration, or behaviour.', 'http://localhost:8081/downloadFile/fashion.svg'),
(130, 10, 'Men\'s Fashion', 'a popular or the latest style of clothing, hair, decoration, or behaviour.', 'http://localhost:8081/downloadFile/fashion.svg'),
(131, 10, 'Girls\' Fashion', 'a popular or the latest style of clothing, hair, decoration, or behaviour.', 'http://localhost:8081/downloadFile/fashion.svg'),
(132, 10, 'Boys\' Fashion', 'a popular or the latest style of clothing, hair, decoration, or behaviour.', 'http://localhost:8081/downloadFile/fashion.svg'),
(133, 11, 'Clothing', 'An increase in influential new designers has questioned the fundamentals of apparels and has led to a novel line of clothing style for the postmodern male.', 'http://localhost:8081/downloadFile/fashion%20(1).svg'),
(134, 11, 'Clothing', 'An increase in influential new designers has questioned the fundamentals of apparels and has led to a novel line of clothing style for the postmodern male.', 'http://localhost:8081/downloadFile/fashion%20(1).svg'),
(135, 11, 'Watches', 'An increase in influential new designers has questioned the fundamentals of apparels and has led to a novel line of clothing style for the postmodern male.', 'http://localhost:8081/downloadFile/fashion%20(1).svg'),
(136, 11, 'Accessories', 'An increase in influential new designers has questioned the fundamentals of apparels and has led to a novel line of clothing style for the postmodern male.', 'http://localhost:8081/downloadFile/fashion%20(1).svg'),
(137, 11, 'Women\'s Fashion', 'An increase in influential new designers has questioned the fundamentals of apparels and has led to a novel line of clothing style for the postmodern male.', 'http://localhost:8081/downloadFile/fashion%20(1).svg'),
(138, 11, 'Girls\' Fashion', 'An increase in influential new designers has questioned the fundamentals of apparels and has led to a novel line of clothing style for the postmodern male.', 'http://localhost:8081/downloadFile/fashion%20(1).svg'),
(139, 11, 'Boys\' Fashion', 'An increase in influential new designers has questioned the fundamentals of apparels and has led to a novel line of clothing style for the postmodern male.', 'http://localhost:8081/downloadFile/fashion%20(1).svg'),
(140, 12, 'Clothing', 'An increase in influential new designers has questioned the fundamentals of apparels and has led to a novel line of clothing style for the postmodern male.', 'http://localhost:8081/downloadFile/worker.svg'),
(141, 12, 'Shoes', 'An increase in influential new designers has questioned the fundamentals of apparels and has led to a novel line of clothing style for the postmodern male.', 'http://localhost:8081/downloadFile/worker.svg'),
(142, 12, 'Watches', 'An increase in influential new designers has questioned the fundamentals of apparels and has led to a novel line of clothing style for the postmodern male.', 'http://localhost:8081/downloadFile/worker.svg'),
(143, 12, 'Jewelry', 'An increase in influential new designers has questioned the fundamentals of apparels and has led to a novel line of clothing style for the postmodern male.', 'http://localhost:8081/downloadFile/worker.svg'),
(144, 12, 'Accessories', 'An increase in influential new designers has questioned the fundamentals of apparels and has led to a novel line of clothing style for the postmodern male.', 'http://localhost:8081/downloadFile/worker.svg'),
(145, 12, 'School Uniforms', 'An increase in influential new designers has questioned the fundamentals of apparels and has led to a novel line of clothing style for the postmodern male.', 'http://localhost:8081/downloadFile/worker.svg'),
(146, 12, 'Women\'s Fashion', 'An increase in influential new designers has questioned the fundamentals of apparels and has led to a novel line of clothing style for the postmodern male.', 'http://localhost:8081/downloadFile/worker.svg'),
(147, 12, 'Men\'s Fashion', 'An increase in influential new designers has questioned the fundamentals of apparels and has led to a novel line of clothing style for the postmodern male.', 'http://localhost:8081/downloadFile/worker.svg'),
(148, 12, 'Girls\' Fashion', 'An increase in influential new designers has questioned the fundamentals of apparels and has led to a novel line of clothing style for the postmodern male.', 'http://localhost:8081/downloadFile/worker.svg'),
(149, 13, 'Baby & Child Care', 'Tax filer + spouse + tax dependents = household. ... Include your spouse and tax dependents even if they don\'t need health coverage.', 'http://localhost:8081/downloadFile/woman.svg'),
(150, 13, 'Health Care', 'Tax filer + spouse + tax dependents = household. ... Include your spouse and tax dependents even if they don\'t need health coverage.', 'http://localhost:8081/downloadFile/woman.svg'),
(151, 13, 'Household Supplies', 'Tax filer + spouse + tax dependents = household. ... Include your spouse and tax dependents even if they don\'t need health coverage.', 'http://localhost:8081/downloadFile/woman.svg'),
(152, 13, 'Medical Supplies & Equipment', 'Tax filer + spouse + tax dependents = household. ... Include your spouse and tax dependents even if they don\'t need health coverage.', 'http://localhost:8081/downloadFile/woman.svg'),
(153, 13, 'Oral Care', 'Tax filer + spouse + tax dependents = household. ... Include your spouse and tax dependents even if they don\'t need health coverage.', 'http://localhost:8081/downloadFile/woman.svg'),
(154, 13, 'Personal Care', 'Tax filer + spouse + tax dependents = household. ... Include your spouse and tax dependents even if they don\'t need health coverage.', 'http://localhost:8081/downloadFile/woman.svg'),
(155, 13, 'Sexual Wellness', 'Tax filer + spouse + tax dependents = household. ... Include your spouse and tax dependents even if they don\'t need health coverage.', 'http://localhost:8081/downloadFile/woman.svg'),
(156, 13, 'Sports Nutrition', 'Tax filer + spouse + tax dependents = household. ... Include your spouse and tax dependents even if they don\'t need health coverage.', 'http://localhost:8081/downloadFile/woman.svg'),
(157, 13, 'Stationery & Gift Wrapping Supplies', 'Tax filer + spouse + tax dependents = household. ... Include your spouse and tax dependents even if they don\'t need health coverage.', 'http://localhost:8081/downloadFile/woman.svg'),
(158, 13, 'Vision Care', 'Tax filer + spouse + tax dependents = household. ... Include your spouse and tax dependents even if they don\'t need health coverage.', 'http://localhost:8081/downloadFile/woman.svg'),
(159, 13, 'Vitamins & Dietary Supplements', 'Tax filer + spouse + tax dependents = household. ... Include your spouse and tax dependents even if they don\'t need health coverage.', 'http://localhost:8081/downloadFile/woman.svg'),
(160, 13, 'Wellness & Relaxation', 'Tax filer + spouse + tax dependents = household. ... Include your spouse and tax dependents even if they don\'t need health coverage.', 'http://localhost:8081/downloadFile/woman.svg'),
(161, 14, 'Kitchen & Dining', 'Home & kitchen daily Tools', 'http://localhost:8081/downloadFile/kitchen.svg'),
(162, 14, 'Kids\' Home Store', 'Home & kitchen daily Tools', 'http://localhost:8081/downloadFile/kitchen.svg'),
(163, 14, 'Bedding', 'Home & kitchen daily Tools', 'http://localhost:8081/downloadFile/kitchen.svg'),
(164, 14, 'Bath', 'Home & kitchen daily Tools', 'http://localhost:8081/downloadFile/kitchen.svg'),
(165, 14, 'Furniture', 'Home & kitchen daily Tools', 'http://localhost:8081/downloadFile/kitchen.svg'),
(166, 14, 'Home Décor', 'Home & kitchen daily Tools', 'http://localhost:8081/downloadFile/kitchen.svg'),
(167, 14, 'Wall Art', 'Home & kitchen daily Tools', 'http://localhost:8081/downloadFile/kitchen.svg'),
(168, 14, 'Lighting & Ceiling Fans', 'Home & kitchen daily Tools', 'http://localhost:8081/downloadFile/kitchen.svg'),
(169, 14, 'Seasonal Décor', 'Home & kitchen daily Tools', 'http://localhost:8081/downloadFile/kitchen.svg'),
(170, 14, 'Event & Party Supplies', 'Home & kitchen daily Tools', 'http://localhost:8081/downloadFile/kitchen.svg'),
(171, 14, 'Heating, Cooling & Air Quality', 'Home & kitchen daily Tools', 'http://localhost:8081/downloadFile/kitchen.svg'),
(172, 14, 'Irons & Steamers', 'Home & kitchen daily Tools', 'http://localhost:8081/downloadFile/kitchen.svg'),
(173, 14, 'Vacuums & Floor Care', 'Home & kitchen daily Tools', 'http://localhost:8081/downloadFile/kitchen.svg'),
(174, 14, 'Storage & Organization', 'Home & kitchen daily Tools', 'http://localhost:8081/downloadFile/kitchen.svg'),
(175, 14, 'Cleaning Supplies', 'Home & kitchen daily Tools', 'http://localhost:8081/downloadFile/kitchen.svg'),
(176, 15, 'Abrasive & Finishing Products', 'It is this science that is employed by production companies in order to develop, adapt, and produce a product for the consumer market', 'http://localhost:8081/downloadFile/contruction.svg'),
(177, 15, 'Additive Manufacturing Products', 'It is this science that is employed by production companies in order to develop, adapt, and produce a product for the consumer market', 'http://localhost:8081/downloadFile/contruction.svg'),
(178, 15, 'Commercial Door Products', 'It is this science that is employed by production companies in order to develop, adapt, and produce a product for the consumer market', 'http://localhost:8081/downloadFile/contruction.svg'),
(179, 15, 'Cutting Tools', 'It is this science that is employed by production companies in order to develop, adapt, and produce a product for the consumer market', 'http://localhost:8081/downloadFile/contruction.svg'),
(180, 15, 'Fasteners', 'It is this science that is employed by production companies in order to develop, adapt, and produce a product for the consumer market', 'http://localhost:8081/downloadFile/contruction.svg'),
(181, 15, 'Filtration', 'It is this science that is employed by production companies in order to develop, adapt, and produce a product for the consumer market', 'http://localhost:8081/downloadFile/contruction.svg'),
(182, 15, 'Food Service Equipment & Supplies', 'It is this science that is employed by production companies in order to develop, adapt, and produce a product for the consumer market', 'http://localhost:8081/downloadFile/contruction.svg'),
(183, 15, 'Hydraulics, Pneumatics & Plumbing', 'It is this science that is employed by production companies in order to develop, adapt, and produce a product for the consumer market', 'http://localhost:8081/downloadFile/contruction.svg'),
(184, 15, 'Industrial Electrical', 'It is this science that is employed by production companies in order to develop, adapt, and produce a product for the consumer market', 'http://localhost:8081/downloadFile/contruction.svg'),
(185, 15, 'Industrial Hardware', 'It is this science that is employed by production companies in order to develop, adapt, and produce a product for the consumer market', 'http://localhost:8081/downloadFile/contruction.svg'),
(186, 15, 'Industrial Power & Hand Tools', 'It is this science that is employed by production companies in order to develop, adapt, and produce a product for the consumer market', 'http://localhost:8081/downloadFile/contruction.svg'),
(187, 15, 'Janitorial & Sanitation Supplies', 'It is this science that is employed by production companies in order to develop, adapt, and produce a product for the consumer market', 'http://localhost:8081/downloadFile/contruction.svg'),
(188, 15, 'Lab & Scientific Products', 'It is this science that is employed by production companies in order to develop, adapt, and produce a product for the consumer market', 'http://localhost:8081/downloadFile/contruction.svg'),
(189, 15, 'Material Handling Products', 'It is this science that is employed by production companies in order to develop, adapt, and produce a product for the consumer market', 'http://localhost:8081/downloadFile/contruction.svg'),
(190, 15, 'Occupational Health & Safety Products', 'It is this science that is employed by production companies in order to develop, adapt, and produce a product for the consumer market', 'http://localhost:8081/downloadFile/contruction.svg'),
(191, 15, 'Packaging & Shipping Supplies', 'It is this science that is employed by production companies in order to develop, adapt, and produce a product for the consumer market', 'http://localhost:8081/downloadFile/contruction.svg'),
(192, 15, 'Power Transmission Products', 'It is this science that is employed by production companies in order to develop, adapt, and produce a product for the consumer market', 'http://localhost:8081/downloadFile/contruction.svg'),
(193, 15, 'Professional Dental Supplies', 'It is this science that is employed by production companies in order to develop, adapt, and produce a product for the consumer market', 'http://localhost:8081/downloadFile/contruction.svg'),
(194, 15, 'Professional Medical Supplies', 'It is this science that is employed by production companies in order to develop, adapt, and produce a product for the consumer market', 'http://localhost:8081/downloadFile/contruction.svg'),
(195, 15, 'Raw Materials', 'It is this science that is employed by production companies in order to develop, adapt, and produce a product for the consumer market', 'http://localhost:8081/downloadFile/contruction.svg'),
(196, 15, 'Retail Store Fixtures & Equipment', 'It is this science that is employed by production companies in order to develop, adapt, and produce a product for the consumer market', 'http://localhost:8081/downloadFile/contruction.svg'),
(197, 15, 'Robotics', 'It is this science that is employed by production companies in order to develop, adapt, and produce a product for the consumer market', 'http://localhost:8081/downloadFile/contruction.svg'),
(198, 15, 'Science Education', 'It is this science that is employed by production companies in order to develop, adapt, and produce a product for the consumer market', 'http://localhost:8081/downloadFile/contruction.svg'),
(199, 15, 'Tapes, Adhesives & Sealants', 'It is this science that is employed by production companies in order to develop, adapt, and produce a product for the consumer market', 'http://localhost:8081/downloadFile/contruction.svg'),
(200, 15, 'Test, Measure & Inspect', 'It is this science that is employed by production companies in order to develop, adapt, and produce a product for the consumer market', 'http://localhost:8081/downloadFile/contruction.svg'),
(201, 16, 'Carry-ons', 'suitcases or other bags in which to pack personal belongings for travelling.', 'http://localhost:8081/downloadFile/suitcase.svg'),
(202, 16, 'Backpacks', 'suitcases or other bags in which to pack personal belongings for travelling.', 'http://localhost:8081/downloadFile/suitcase.svg'),
(203, 16, 'Garment bags', 'suitcases or other bags in which to pack personal belongings for travelling.', 'http://localhost:8081/downloadFile/suitcase.svg'),
(204, 16, 'Travel Totes', 'suitcases or other bags in which to pack personal belongings for travelling.', 'http://localhost:8081/downloadFile/suitcase.svg'),
(205, 16, 'Luggage Sets', 'suitcases or other bags in which to pack personal belongings for travelling.', 'http://localhost:8081/downloadFile/suitcase.svg'),
(206, 16, 'Laptop Bags', 'suitcases or other bags in which to pack personal belongings for travelling.', 'http://localhost:8081/downloadFile/suitcase.svg'),
(207, 16, 'Suitcases', 'suitcases or other bags in which to pack personal belongings for travelling.', 'http://localhost:8081/downloadFile/suitcase.svg'),
(208, 16, 'Kids Luggage', 'suitcases or other bags in which to pack personal belongings for travelling.', 'http://localhost:8081/downloadFile/suitcase.svg'),
(209, 16, 'Messenger Bags', 'suitcases or other bags in which to pack personal belongings for travelling.', 'http://localhost:8081/downloadFile/suitcase.svg'),
(210, 16, 'Umbrellas', 'suitcases or other bags in which to pack personal belongings for travelling.', 'http://localhost:8081/downloadFile/suitcase.svg'),
(211, 16, 'Duffles', 'suitcases or other bags in which to pack personal belongings for travelling.', 'http://localhost:8081/downloadFile/suitcase.svg'),
(212, 16, 'Travel Accessories', 'suitcases or other bags in which to pack personal belongings for travelling.', 'http://localhost:8081/downloadFile/suitcase.svg'),
(213, 17, 'Movies', 'Television film. A television film is a feature-length motion picture that is produced and originally distributed by or to a television network, in contrast to theatrical films made explicitly for initial showing in movie theaters', 'http://localhost:8081/downloadFile/movies.svg'),
(214, 17, 'TV Shows', 'Television film. A television film is a feature-length motion picture that is produced and originally distributed by or to a television network, in contrast to theatrical films made explicitly for initial showing in movie theaters', 'http://localhost:8081/downloadFile/movies.svg'),
(215, 17, 'Blu-ray', 'Television film. A television film is a feature-length motion picture that is produced and originally distributed by or to a television network, in contrast to theatrical films made explicitly for initial showing in movie theaters', 'http://localhost:8081/downloadFile/movies.svg'),
(216, 17, '4K Ultra HD', 'Television film. A television film is a feature-length motion picture that is produced and originally distributed by or to a television network, in contrast to theatrical films made explicitly for initial showing in movie theaters', 'http://localhost:8081/downloadFile/movies.svg'),
(217, 17, 'Best Sellers', 'Television film. A television film is a feature-length motion picture that is produced and originally distributed by or to a television network, in contrast to theatrical films made explicitly for initial showing in movie theaters', 'http://localhost:8081/downloadFile/movies.svg'),
(218, 17, 'Today\'s Deals', 'Television film. A television film is a feature-length motion picture that is produced and originally distributed by or to a television network, in contrast to theatrical films made explicitly for initial showing in movie theaters', 'http://localhost:8081/downloadFile/movies.svg'),
(219, 17, 'New Releases', 'Television film. A television film is a feature-length motion picture that is produced and originally distributed by or to a television network, in contrast to theatrical films made explicitly for initial showing in movie theaters', 'http://localhost:8081/downloadFile/movies.svg'),
(220, 17, 'Pre-orders', 'Television film. A television film is a feature-length motion picture that is produced and originally distributed by or to a television network, in contrast to theatrical films made explicitly for initial showing in movie theaters', 'http://localhost:8081/downloadFile/movies.svg'),
(221, 17, 'Kids & Family', 'Television film. A television film is a feature-length motion picture that is produced and originally distributed by or to a television network, in contrast to theatrical films made explicitly for initial showing in movie theaters', 'http://localhost:8081/downloadFile/movies.svg'),
(222, 17, 'Prime Video', 'Television film. A television film is a feature-length motion picture that is produced and originally distributed by or to a television network, in contrast to theatrical films made explicitly for initial showing in movie theaters', 'http://localhost:8081/downloadFile/movies.svg'),
(223, 18, 'Dogs', 'Retail store services for the sale of pet food, pet supplies, pet accessories, foodstuffs for animals, animal requisites. tmClass.\nPeople also ask', 'http://localhost:8081/downloadFile/pet-supplies.svg'),
(224, 18, 'Cats', 'Retail store services for the sale of pet food, pet supplies, pet accessories, foodstuffs for animals, animal requisites. tmClass.\nPeople also ask', 'http://localhost:8081/downloadFile/pet-supplies.svg'),
(225, 18, 'Fish & Aquatic Pets', 'Retail store services for the sale of pet food, pet supplies, pet accessories, foodstuffs for animals, animal requisites. tmClass.\nPeople also ask', 'http://localhost:8081/downloadFile/pet-supplies.svg'),
(226, 18, 'Birds', 'Retail store services for the sale of pet food, pet supplies, pet accessories, foodstuffs for animals, animal requisites. tmClass.\nPeople also ask', 'http://localhost:8081/downloadFile/pet-supplies.svg'),
(227, 18, 'Horses', 'Retail store services for the sale of pet food, pet supplies, pet accessories, foodstuffs for animals, animal requisites. tmClass.\nPeople also ask', 'http://localhost:8081/downloadFile/pet-supplies.svg'),
(228, 18, 'Reptiles & Amphibians', 'Retail store services for the sale of pet food, pet supplies, pet accessories, foodstuffs for animals, animal requisites. tmClass.\nPeople also ask', 'http://localhost:8081/downloadFile/pet-supplies.svg'),
(229, 18, 'Small Animals', 'Retail store services for the sale of pet food, pet supplies, pet accessories, foodstuffs for animals, animal requisites. tmClass.\nPeople also ask', 'http://localhost:8081/downloadFile/pet-supplies.svg'),
(230, 19, 'Accounting & Finance', 'Software is the programs and routines for a computer or the program material for an electronic device which make it run. An example of software is Excel or Windows or iTunes', 'http://localhost:8081/downloadFile/software.svg');
INSERT INTO `category` (`id`, `parent_id`, `name`, `description`, `url`) VALUES
(231, 19, 'Antivirus & Security', 'Software is the programs and routines for a computer or the program material for an electronic device which make it run. An example of software is Excel or Windows or iTunes', 'http://localhost:8081/downloadFile/software.svg'),
(232, 19, 'Business & Office', 'Software is the programs and routines for a computer or the program material for an electronic device which make it run. An example of software is Excel or Windows or iTunes', 'http://localhost:8081/downloadFile/software.svg'),
(233, 19, 'Children\'s', 'Software is the programs and routines for a computer or the program material for an electronic device which make it run. An example of software is Excel or Windows or iTunes', 'http://localhost:8081/downloadFile/software.svg'),
(234, 19, 'Design & Illustration', 'Software is the programs and routines for a computer or the program material for an electronic device which make it run. An example of software is Excel or Windows or iTunes', 'http://localhost:8081/downloadFile/software.svg'),
(235, 19, 'Digital Software', 'Software is the programs and routines for a computer or the program material for an electronic device which make it run. An example of software is Excel or Windows or iTunes', 'http://localhost:8081/downloadFile/software.svg'),
(236, 19, 'Education & Reference', 'Software is the programs and routines for a computer or the program material for an electronic device which make it run. An example of software is Excel or Windows or iTunes', 'http://localhost:8081/downloadFile/software.svg'),
(237, 19, 'Games', 'Software is the programs and routines for a computer or the program material for an electronic device which make it run. An example of software is Excel or Windows or iTunes', 'http://localhost:8081/downloadFile/software.svg'),
(238, 19, 'Lifestyle & Hobbies', 'Software is the programs and routines for a computer or the program material for an electronic device which make it run. An example of software is Excel or Windows or iTunes', 'http://localhost:8081/downloadFile/software.svg'),
(239, 19, 'Networking & Servers', 'Software is the programs and routines for a computer or the program material for an electronic device which make it run. An example of software is Excel or Windows or iTunes', 'http://localhost:8081/downloadFile/software.svg'),
(240, 19, 'Music', 'Software is the programs and routines for a computer or the program material for an electronic device which make it run. An example of software is Excel or Windows or iTunes', 'http://localhost:8081/downloadFile/software.svg'),
(241, 19, 'Operating Systems', 'Software is the programs and routines for a computer or the program material for an electronic device which make it run. An example of software is Excel or Windows or iTunes', 'http://localhost:8081/downloadFile/software.svg'),
(242, 19, 'Photography & Finance', 'Software is the programs and routines for a computer or the program material for an electronic device which make it run. An example of software is Excel or Windows or iTunes', 'http://localhost:8081/downloadFile/software.svg'),
(243, 19, 'Programming & Web Development', 'Software is the programs and routines for a computer or the program material for an electronic device which make it run. An example of software is Excel or Windows or iTunes', 'http://localhost:8081/downloadFile/software.svg'),
(244, 19, 'Tax Preparation', 'Software is the programs and routines for a computer or the program material for an electronic device which make it run. An example of software is Excel or Windows or iTunes', 'http://localhost:8081/downloadFile/software.svg'),
(245, 19, 'Utilities', 'Software is the programs and routines for a computer or the program material for an electronic device which make it run. An example of software is Excel or Windows or iTunes', 'http://localhost:8081/downloadFile/software.svg'),
(246, 19, 'Video', 'Software is the programs and routines for a computer or the program material for an electronic device which make it run. An example of software is Excel or Windows or iTunes', 'http://localhost:8081/downloadFile/software.svg'),
(247, 20, 'Sports & Outdoor', 'a sport that is played outdoors. field sport. hunting, hunt - the pursuit and killing or capture of wild animals regarded as a sport. fishing, sportfishing - the act of someone who fishes as a diversion. athletics, sport - an active diversion requiring physical exertion and competition', 'http://localhost:8081/downloadFile/sport.svg'),
(248, 20, 'Outdoor Recreation', 'a sport that is played outdoors. field sport. hunting, hunt - the pursuit and killing or capture of wild animals regarded as a sport. fishing, sportfishing - the act of someone who fishes as a diversion. athletics, sport - an active diversion requiring physical exertion and competition', 'http://localhost:8081/downloadFile/sport.svg'),
(249, 20, 'Sports & Fitness', 'a sport that is played outdoors. field sport. hunting, hunt - the pursuit and killing or capture of wild animals regarded as a sport. fishing, sportfishing - the act of someone who fishes as a diversion. athletics, sport - an active diversion requiring physical exertion and competition', 'http://localhost:8081/downloadFile/sport.svg'),
(250, 20, 'Fan Shop', 'a sport that is played outdoors. field sport. hunting, hunt - the pursuit and killing or capture of wild animals regarded as a sport. fishing, sportfishing - the act of someone who fishes as a diversion. athletics, sport - an active diversion requiring physical exertion and competition', 'http://localhost:8081/downloadFile/sport.svg'),
(251, 21, 'Tools & Home Improvement', 'Home improvement can consist of projects that upgrade an existing home interior (such as electrical and plumbing), exterior (masonry, concrete, siding, roofing) ...', 'http://localhost:8081/downloadFile/home-repair.svg'),
(252, 21, 'Appliances', 'Home improvement can consist of projects that upgrade an existing home interior (such as electrical and plumbing), exterior (masonry, concrete, siding, roofing) ...', 'http://localhost:8081/downloadFile/home-repair.svg'),
(253, 21, 'Building Supplies', 'Home improvement can consist of projects that upgrade an existing home interior (such as electrical and plumbing), exterior (masonry, concrete, siding, roofing) ...', 'http://localhost:8081/downloadFile/home-repair.svg'),
(254, 21, 'Electrical', 'Home improvement can consist of projects that upgrade an existing home interior (such as electrical and plumbing), exterior (masonry, concrete, siding, roofing) ...', 'http://localhost:8081/downloadFile/home-repair.svg'),
(255, 21, 'Hardware', 'Home improvement can consist of projects that upgrade an existing home interior (such as electrical and plumbing), exterior (masonry, concrete, siding, roofing) ...', 'http://localhost:8081/downloadFile/home-repair.svg'),
(256, 21, 'Light Bulbs', 'Home improvement can consist of projects that upgrade an existing home interior (such as electrical and plumbing), exterior (masonry, concrete, siding, roofing) ...', 'http://localhost:8081/downloadFile/home-repair.svg'),
(257, 21, 'Kitchen & Bath Fixtures', 'Home improvement can consist of projects that upgrade an existing home interior (such as electrical and plumbing), exterior (masonry, concrete, siding, roofing) ...', 'http://localhost:8081/downloadFile/home-repair.svg'),
(258, 21, 'Lighting & Ceiling Fans', 'Home improvement can consist of projects that upgrade an existing home interior (such as electrical and plumbing), exterior (masonry, concrete, siding, roofing) ...', 'http://localhost:8081/downloadFile/home-repair.svg'),
(259, 21, 'Measuring & Layout Tools', 'Home improvement can consist of projects that upgrade an existing home interior (such as electrical and plumbing), exterior (masonry, concrete, siding, roofing) ...', 'http://localhost:8081/downloadFile/home-repair.svg'),
(260, 21, 'Painting Supplies & Wall Treatments', 'Home improvement can consist of projects that upgrade an existing home interior (such as electrical and plumbing), exterior (masonry, concrete, siding, roofing) ...', 'http://localhost:8081/downloadFile/home-repair.svg'),
(261, 21, 'Power & Hand Tools', 'Home improvement can consist of projects that upgrade an existing home interior (such as electrical and plumbing), exterior (masonry, concrete, siding, roofing) ...', 'http://localhost:8081/downloadFile/home-repair.svg'),
(262, 21, 'Rough Plumbing', 'Home improvement can consist of projects that upgrade an existing home interior (such as electrical and plumbing), exterior (masonry, concrete, siding, roofing) ...', 'http://localhost:8081/downloadFile/home-repair.svg'),
(263, 21, 'Safety & Security', 'Home improvement can consist of projects that upgrade an existing home interior (such as electrical and plumbing), exterior (masonry, concrete, siding, roofing) ...', 'http://localhost:8081/downloadFile/home-repair.svg'),
(264, 21, 'Storage & Home Organization', 'Home improvement can consist of projects that upgrade an existing home interior (such as electrical and plumbing), exterior (masonry, concrete, siding, roofing) ...', 'http://localhost:8081/downloadFile/home-repair.svg'),
(265, 21, 'Welding & Soldering', 'Home improvement can consist of projects that upgrade an existing home interior (such as electrical and plumbing), exterior (masonry, concrete, siding, roofing) ...', 'http://localhost:8081/downloadFile/home-repair.svg'),
(266, 22, 'Action Figures & Statues', 'Toys and games are the tools of play, and play is a large part of social life. ... Adults gave them to children during festival times, and the young made toys for themselves in moments of freedom from control or work out of gourds, bits of wood, or animal parts.', 'http://localhost:8081/downloadFile/puzzle.svg'),
(267, 22, 'Arts & Crafts', 'Toys and games are the tools of play, and play is a large part of social life. ... Adults gave them to children during festival times, and the young made toys for themselves in moments of freedom from control or work out of gourds, bits of wood, or animal parts.', 'http://localhost:8081/downloadFile/puzzle.svg'),
(268, 22, 'Building Toys', 'Toys and games are the tools of play, and play is a large part of social life. ... Adults gave them to children during festival times, and the young made toys for themselves in moments of freedom from control or work out of gourds, bits of wood, or animal parts.', 'http://localhost:8081/downloadFile/puzzle.svg'),
(269, 22, 'Baby & Toddler Toys', 'Toys and games are the tools of play, and play is a large part of social life. ... Adults gave them to children during festival times, and the young made toys for themselves in moments of freedom from control or work out of gourds, bits of wood, or animal parts.', 'http://localhost:8081/downloadFile/puzzle.svg'),
(270, 22, 'Dolls & Accessories', 'Toys and games are the tools of play, and play is a large part of social life. ... Adults gave them to children during festival times, and the young made toys for themselves in moments of freedom from control or work out of gourds, bits of wood, or animal parts.', 'http://localhost:8081/downloadFile/puzzle.svg'),
(271, 22, 'Dress Up & Pretend Play', 'Toys and games are the tools of play, and play is a large part of social life. ... Adults gave them to children during festival times, and the young made toys for themselves in moments of freedom from control or work out of gourds, bits of wood, or animal parts.', 'http://localhost:8081/downloadFile/puzzle.svg'),
(272, 22, 'Toys & Games', 'Toys and games are the tools of play, and play is a large part of social life. ... Adults gave them to children during festival times, and the young made toys for themselves in moments of freedom from control or work out of gourds, bits of wood, or animal parts.', 'http://localhost:8081/downloadFile/puzzle.svg'),
(273, 22, 'Grown-Up Toys', 'Toys and games are the tools of play, and play is a large part of social life. ... Adults gave them to children during festival times, and the young made toys for themselves in moments of freedom from control or work out of gourds, bits of wood, or animal parts.', 'http://localhost:8081/downloadFile/puzzle.svg'),
(274, 22, 'Kids\' Electronics', 'Toys and games are the tools of play, and play is a large part of social life. ... Adults gave them to children during festival times, and the young made toys for themselves in moments of freedom from control or work out of gourds, bits of wood, or animal parts.', 'http://localhost:8081/downloadFile/puzzle.svg'),
(275, 22, 'Hobbies', 'Toys and games are the tools of play, and play is a large part of social life. ... Adults gave them to children during festival times, and the young made toys for themselves in moments of freedom from control or work out of gourds, bits of wood, or animal parts.', 'http://localhost:8081/downloadFile/puzzle.svg'),
(276, 22, 'Kids\' Furniture, Décor & Storage', 'Toys and games are the tools of play, and play is a large part of social life. ... Adults gave them to children during festival times, and the young made toys for themselves in moments of freedom from control or work out of gourds, bits of wood, or animal parts.', 'http://localhost:8081/downloadFile/puzzle.svg'),
(277, 22, 'Learning & Education', 'Toys and games are the tools of play, and play is a large part of social life. ... Adults gave them to children during festival times, and the young made toys for themselves in moments of freedom from control or work out of gourds, bits of wood, or animal parts.', 'http://localhost:8081/downloadFile/puzzle.svg'),
(278, 22, 'Novelty & Gag Toys', 'Toys and games are the tools of play, and play is a large part of social life. ... Adults gave them to children during festival times, and the young made toys for themselves in moments of freedom from control or work out of gourds, bits of wood, or animal parts.', 'http://localhost:8081/downloadFile/puzzle.svg'),
(279, 22, 'Party Supplies', 'Toys and games are the tools of play, and play is a large part of social life. ... Adults gave them to children during festival times, and the young made toys for themselves in moments of freedom from control or work out of gourds, bits of wood, or animal parts.', 'http://localhost:8081/downloadFile/puzzle.svg'),
(280, 22, 'Puppets', 'Toys and games are the tools of play, and play is a large part of social life. ... Adults gave them to children during festival times, and the young made toys for themselves in moments of freedom from control or work out of gourds, bits of wood, or animal parts.', 'http://localhost:8081/downloadFile/puzzle.svg'),
(281, 22, 'Puzzles', 'Toys and games are the tools of play, and play is a large part of social life. ... Adults gave them to children during festival times, and the young made toys for themselves in moments of freedom from control or work out of gourds, bits of wood, or animal parts.', 'http://localhost:8081/downloadFile/puzzle.svg'),
(282, 22, 'Sports & Outdoor Play', 'Toys and games are the tools of play, and play is a large part of social life. ... Adults gave them to children during festival times, and the young made toys for themselves in moments of freedom from control or work out of gourds, bits of wood, or animal parts.', 'http://localhost:8081/downloadFile/puzzle.svg'),
(283, 22, 'Stuffed Animals & Plush Toys', 'Toys and games are the tools of play, and play is a large part of social life. ... Adults gave them to children during festival times, and the young made toys for themselves in moments of freedom from control or work out of gourds, bits of wood, or animal parts.', 'http://localhost:8081/downloadFile/puzzle.svg'),
(284, 22, 'Toy Remote Control & Play Vehicles', 'Toys and games are the tools of play, and play is a large part of social life. ... Adults gave them to children during festival times, and the young made toys for themselves in moments of freedom from control or work out of gourds, bits of wood, or animal parts.', 'http://localhost:8081/downloadFile/puzzle.svg'),
(285, 22, 'Tricycles, Scooters & Wagons', 'Toys and games are the tools of play, and play is a large part of social life. ... Adults gave them to children during festival times, and the young made toys for themselves in moments of freedom from control or work out of gourds, bits of wood, or animal parts.', 'http://localhost:8081/downloadFile/puzzle.svg'),
(286, 22, 'Video Games', 'Toys and games are the tools of play, and play is a large part of social life. ... Adults gave them to children during festival times, and the young made toys for themselves in moments of freedom from control or work out of gourds, bits of wood, or animal parts.', 'http://localhost:8081/downloadFile/puzzle.svg'),
(287, 23, 'Video Games', 'a game played by electronically manipulating images produced by a computer program on a monitor or other display.', 'http://localhost:8081/downloadFile/console.svg'),
(288, 23, 'PlayStation 4', 'a game played by electronically manipulating images produced by a computer program on a monitor or other display.', 'http://localhost:8081/downloadFile/console.svg'),
(289, 23, 'PlayStation 3', 'a game played by electronically manipulating images produced by a computer program on a monitor or other display.', 'http://localhost:8081/downloadFile/console.svg'),
(290, 23, 'Xbox One', 'a game played by electronically manipulating images produced by a computer program on a monitor or other display.', 'http://localhost:8081/downloadFile/console.svg'),
(291, 23, 'Xbox 360', 'a game played by electronically manipulating images produced by a computer program on a monitor or other display.', 'http://localhost:8081/downloadFile/console.svg'),
(292, 23, 'Nintendo Switch', 'a game played by electronically manipulating images produced by a computer program on a monitor or other display.', 'http://localhost:8081/downloadFile/console.svg'),
(293, 23, 'Wii U', 'a game played by electronically manipulating images produced by a computer program on a monitor or other display.', 'http://localhost:8081/downloadFile/console.svg'),
(294, 23, 'Wii', 'a game played by electronically manipulating images produced by a computer program on a monitor or other display.', 'http://localhost:8081/downloadFile/console.svg'),
(295, 23, 'PC', 'a game played by electronically manipulating images produced by a computer program on a monitor or other display.', 'http://localhost:8081/downloadFile/console.svg'),
(296, 23, 'Mac', 'a game played by electronically manipulating images produced by a computer program on a monitor or other display.', 'http://localhost:8081/downloadFile/console.svg'),
(297, 23, 'Nintendo 3DS & 2DS', 'a game played by electronically manipulating images produced by a computer program on a monitor or other display.', 'http://localhost:8081/downloadFile/console.svg'),
(298, 23, 'Nintendo DS', 'a game played by electronically manipulating images produced by a computer program on a monitor or other display.', 'http://localhost:8081/downloadFile/console.svg'),
(299, 23, 'PlayStation Vita', 'a game played by electronically manipulating images produced by a computer program on a monitor or other display.', 'http://localhost:8081/downloadFile/console.svg'),
(300, 23, 'Sony PSP', 'a game played by electronically manipulating images produced by a computer program on a monitor or other display.', 'http://localhost:8081/downloadFile/console.svg'),
(301, 23, 'Retro Gaming & Microconsoles', 'a game played by electronically manipulating images produced by a computer program on a monitor or other display.', 'http://localhost:8081/downloadFile/console.svg'),
(302, 23, 'Accessories', 'a game played by electronically manipulating images produced by a computer program on a monitor or other display.', 'http://localhost:8081/downloadFile/console.svg'),
(303, 23, 'Digital Games', 'a game played by electronically manipulating images produced by a computer program on a monitor or other display.', 'http://localhost:8081/downloadFile/console.svg'),
(304, 23, 'Kids & Family', 'a game played by electronically manipulating images produced by a computer program on a monitor or other display.', 'http://localhost:8081/downloadFile/console.svg');

-- --------------------------------------------------------

--
-- Structure de la table `currency`
--

DROP TABLE IF EXISTS `currency`;
CREATE TABLE IF NOT EXISTS `currency` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `currency_name` varchar(50) NOT NULL,
  `currency_code` varchar(50) NOT NULL,
  `currency_rate` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `currency`
--

INSERT INTO `currency` (`id`, `currency_name`, `currency_code`, `currency_rate`) VALUES
(1, 'euro', '€', 1.45),
(2, 'dinar', 'TND', 1),
(3, 'dollar', '£', 2.5);

-- --------------------------------------------------------

--
-- Structure de la table `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE IF NOT EXISTS `customer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dateofbirth` date DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `cellphone` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `url` varchar(255) DEFAULT 'http://localhost:8081/downloadFile/image_picker4915816687608941235.jpg',
  PRIMARY KEY (`id`),
  KEY `FKj8dlm21j202cadsbfkoem0s58` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `customer`
--

INSERT INTO `customer` (`id`, `dateofbirth`, `firstname`, `gender`, `lastname`, `cellphone`, `user_id`, `url`) VALUES
(2, '2000-02-24', 'youssef', 'MALE', 'tfifha', '20245989', 3, 'http://localhost:8081/downloadFile/image_picker4915816687608941235.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `delivery_customer`
--

DROP TABLE IF EXISTS `delivery_customer`;
CREATE TABLE IF NOT EXISTS `delivery_customer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `delivery_number` varchar(50) DEFAULT NULL,
  `delivery_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `customer_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK648oi5aabpbty3u4kkbisj47g` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `delivery_customer`
--

INSERT INTO `delivery_customer` (`id`, `delivery_number`, `delivery_date`, `customer_id`) VALUES
(1, '145A', '2021-08-03 17:00:20', 2);

-- --------------------------------------------------------

--
-- Structure de la table `delivery_customer_items`
--

DROP TABLE IF EXISTS `delivery_customer_items`;
CREATE TABLE IF NOT EXISTS `delivery_customer_items` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `item_seq` int(11) DEFAULT NULL,
  `quantity_shipped` int(11) DEFAULT NULL,
  `quantity_accepted` int(11) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `delivery_id` bigint(20) DEFAULT NULL,
  `order_item_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK` (`delivery_id`),
  KEY `FK69s4s12thfnvgs3f4ngwwl8ng` (`order_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `delivery_supplier`
--

DROP TABLE IF EXISTS `delivery_supplier`;
CREATE TABLE IF NOT EXISTS `delivery_supplier` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `delivery_number` varchar(50) DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `organization_id` bigint(20) DEFAULT NULL,
  `supplier_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKrahbuvn1yak2bmnl3xump9nt5` (`organization_id`),
  KEY `FK648oi5aabpbty3u4kkbisj47g` (`supplier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `delivery_supplier_items`
--

DROP TABLE IF EXISTS `delivery_supplier_items`;
CREATE TABLE IF NOT EXISTS `delivery_supplier_items` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `item_seq` int(11) DEFAULT NULL,
  `quantity_shipped` int(11) DEFAULT NULL,
  `quantity_accepted` int(11) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `delivery_id` bigint(20) DEFAULT NULL,
  `order_item_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKguxmn4x4aitfv1q7prx2du9l0` (`delivery_id`),
  KEY `FKdswxrcx5ikh73m1oc6n1xipwy` (`order_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `employees`
--

DROP TABLE IF EXISTS `employees`;
CREATE TABLE IF NOT EXISTS `employees` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dateofbirth` date DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `cellphone` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKgph7ais5uxsg9qyv486wu989i` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `employees`
--

INSERT INTO `employees` (`id`, `dateofbirth`, `firstname`, `gender`, `lastname`, `cellphone`, `user_id`) VALUES
(2, '2000-02-02', 'admin', 'FEMALE', 'admin', '71475852', 4),
(3, '2000-02-02', 'admin', 'MALE', 'admin', '71475852', 5);

-- --------------------------------------------------------

--
-- Structure de la table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
CREATE TABLE IF NOT EXISTS `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `hibernate_sequence`
--

INSERT INTO `hibernate_sequence` (`next_val`) VALUES
(19);

-- --------------------------------------------------------

--
-- Structure de la table `mouvement`
--

DROP TABLE IF EXISTS `mouvement`;
CREATE TABLE IF NOT EXISTS `mouvement` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `mouvement_type` varchar(10) NOT NULL,
  `mouvement_date` datetime DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `unit_price` double DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `delivery_item` bigint(20) DEFAULT NULL,
  `warehouse_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKk0fgvyrd4gg1eugabyqg2cbxd` (`product_id`),
  KEY `FKwarehouse` (`warehouse_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `mouvement`
--

INSERT INTO `mouvement` (`id`, `mouvement_type`, `mouvement_date`, `quantity`, `unit_price`, `product_id`, `delivery_item`, `warehouse_id`) VALUES
(1, 'IN', '2021-08-05 17:52:44', 10, 140, 1, NULL, NULL),
(2, 'IN', '2021-08-06 15:17:24', 10, 114, 2, NULL, NULL),
(3, 'IN', '2021-08-06 16:44:21', 8, NULL, 1, NULL, NULL),
(4, 'IN', '2021-08-06 16:44:21', 9, NULL, 2, NULL, NULL),
(5, 'IN', '2021-08-06 16:54:21', 6, NULL, 1, NULL, NULL),
(6, 'IN', '2021-08-06 16:54:21', 8, NULL, 2, NULL, NULL),
(7, 'IN', '2021-08-06 17:00:04', 4, NULL, 1, NULL, NULL),
(8, 'IN', '2021-08-06 17:00:04', 7, NULL, 2, NULL, NULL),
(9, 'IN', '2021-08-06 17:03:05', 2, NULL, 1, NULL, NULL),
(10, 'IN', '2021-08-06 17:03:05', 6, NULL, 2, NULL, NULL),
(11, 'IN', '2021-08-06 17:04:17', 0, NULL, 1, NULL, NULL),
(12, 'IN', '2021-08-06 17:04:17', 5, NULL, 2, NULL, NULL),
(13, 'IN', '2021-08-06 17:07:09', -2, NULL, 1, NULL, NULL),
(14, 'IN', '2021-08-06 17:07:09', 4, NULL, 2, NULL, NULL),
(15, 'IN', '2021-08-06 17:09:21', -4, NULL, 1, NULL, NULL),
(16, 'IN', '2021-08-06 17:09:21', 3, NULL, 2, NULL, NULL),
(17, 'IN', '2021-08-06 19:02:52', -6, NULL, 1, NULL, NULL),
(18, 'IN', '2021-08-06 19:04:09', -8, NULL, 1, NULL, NULL),
(19, 'IN', '2021-08-06 19:09:40', -9, NULL, 1, NULL, NULL),
(20, 'IN', '2021-08-06 19:18:21', -10, NULL, 1, NULL, NULL),
(21, 'IN', '2021-08-06 19:18:21', 2, NULL, 2, NULL, NULL),
(22, 'IN', '2021-08-06 19:42:25', -11, NULL, 1, NULL, NULL),
(23, 'IN', '2021-08-06 19:52:06', -12, NULL, 1, NULL, NULL),
(24, 'IN', '2021-08-06 19:55:16', -14, NULL, 1, NULL, NULL),
(25, 'IN', '2021-08-06 20:05:24', -15, NULL, 1, NULL, NULL),
(26, 'IN', '2021-08-06 20:08:50', -16, NULL, 1, NULL, NULL),
(27, 'IN', '2021-08-06 20:15:22', -17, NULL, 1, NULL, NULL),
(28, 'IN', '2021-08-06 20:55:20', -19, NULL, 1, NULL, NULL),
(29, 'IN', '2021-08-06 21:09:59', 10, 33, 3, NULL, NULL),
(30, 'IN', '2021-08-06 21:12:22', 9, NULL, 3, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `orders_customer`
--

DROP TABLE IF EXISTS `orders_customer`;
CREATE TABLE IF NOT EXISTS `orders_customer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_number` varchar(25) NOT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(25) DEFAULT NULL,
  `sent_media` varchar(25) DEFAULT 'OnLine',
  `urgent` varchar(25) DEFAULT 'Normal',
  `customer_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKel9kyl84ego2otj2accfd8mr7` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `orders_customer`
--

INSERT INTO `orders_customer` (`id`, `order_number`, `created_date`, `status`, `sent_media`, `urgent`, `customer_id`) VALUES
(5, '70698', '2021-08-06 17:09:21', 'PENDING', 'sss', 'qqq', 2),
(10, '82070', '2021-08-06 19:42:26', 'PENDING', 'INTRANET', 'NORMALE', 2),
(15, '31977', '2021-08-06 20:15:22', 'PENDING', 'INTRANET', 'NORMALE', 2),
(16, '12449', '2021-08-06 20:55:21', 'PENDING', 'INTRANET', 'NORMALE', 2),
(17, '68964', '2021-08-06 21:12:22', 'PENDING', 'INTRANET', 'NORMALE', 2);

-- --------------------------------------------------------

--
-- Structure de la table `orders_supplier`
--

DROP TABLE IF EXISTS `orders_supplier`;
CREATE TABLE IF NOT EXISTS `orders_supplier` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_number` varchar(25) NOT NULL,
  `order_date` datetime DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `canceled_date` datetime DEFAULT NULL,
  `status` varchar(25) DEFAULT 'In progress',
  `sent_media` varchar(25) DEFAULT 'Mail',
  `urgent` varchar(25) DEFAULT 'Normal',
  `supplier_id` bigint(20) DEFAULT NULL,
  `currency_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKbd9quld26gnavvivvij6jctme` (`supplier_id`),
  KEY `FKcurrency` (`currency_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `order_customer_items`
--

DROP TABLE IF EXISTS `order_customer_items`;
CREATE TABLE IF NOT EXISTS `order_customer_items` (
  `id` bigint(20) NOT NULL,
  `item_seq` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `vat_code` double NOT NULL DEFAULT '19',
  `discount_code` double NOT NULL DEFAULT '0',
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `order_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKm3mp87f5ygbbfuqfdhc09y9a` (`order_id`),
  KEY `FKatri80p9fodn2lpjxxpcv03hm` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `order_customer_items`
--

INSERT INTO `order_customer_items` (`id`, `item_seq`, `quantity`, `vat_code`, `discount_code`, `created_date`, `order_id`, `product_id`) VALUES
(6, 0, 1, 19, 0, '2021-08-06 17:09:21', 5, 2),
(11, 0, 1, 19, 0, '2021-08-06 19:42:25', 10, 1),
(16, 0, 1, 19, 0, '2021-08-06 20:15:22', 15, 1),
(17, 0, 2, 19, 0, '2021-08-06 20:55:20', 16, 1),
(18, 0, 1, 19, 0, '2021-08-06 21:12:22', 17, 3);

-- --------------------------------------------------------

--
-- Structure de la table `order_supplier_items`
--

DROP TABLE IF EXISTS `order_supplier_items`;
CREATE TABLE IF NOT EXISTS `order_supplier_items` (
  `id` bigint(20) NOT NULL,
  `item_seq` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `unit_price` double NOT NULL,
  `vat_code` double NOT NULL DEFAULT '19',
  `discount_rate` double NOT NULL DEFAULT '0',
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `order_id` bigint(20) DEFAULT NULL,
  `product_supplier_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKhaphc0cy1nm6odx07lug8rvln` (`order_id`),
  KEY `FKqwtap8md4g0nqq814hhilitac` (`product_supplier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `organization`
--

DROP TABLE IF EXISTS `organization`;
CREATE TABLE IF NOT EXISTS `organization` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `fiscalcode` varchar(255) NOT NULL,
  `patentcode` varchar(255) NOT NULL,
  `legalstatus` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `finality` varchar(255) NOT NULL,
  `size` varchar(255) NOT NULL,
  `sector` varchar(255) NOT NULL,
  `scope` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `organization`
--

INSERT INTO `organization` (`id`, `name`, `fiscalcode`, `patentcode`, `legalstatus`, `category`, `finality`, `size`, `sector`, `scope`) VALUES
(1, '3s2i Group', '1452', '22250', 'Society', 'Organization', 'Economical', 'Big', 'Secondary', 'Material');

-- --------------------------------------------------------

--
-- Structure de la table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `brand` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `isbn` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `sku` int(11) DEFAULT NULL,
  `tmpcode` varchar(255) DEFAULT NULL,
  `category` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKqx9wikktsev17ctu0kcpkrafc` (`category`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `product`
--

INSERT INTO `product` (`id`, `brand`, `code`, `description`, `isbn`, `name`, `sku`, `tmpcode`, `category`) VALUES
(1, 'TOZO ', '12AW', 'TOZO T6 True Wireless Earbuds Bluetooth Headphones Touch Control with Wireless Charging Case IPX8 Waterproof Stereo Earphones in-Ear Built-in Mic Headset Premium Deep Bass for Sport Black', 1111004, 'TOZO T6', 1110001, 'T12AW', 24),
(2, 'SAMSUNG ', '12AW', 'SAMSUNG: EVO Select 128GB MicroSDXC UHS-I U3 100MB/s Full HD & 4K UHD Memory Card with Adapter (MB-ME128HA)', 1111004, 'SAMSUNG: EVO', 1110001, 'T12AW', 24),
(3, 'Neewer ', '12AW', 'Neewer Ring Light Kit:18 48cm Outer 55W 5500K Dimmable LED Ring Light, Light Stand, Carrying Bag for Camera,Smartphone,YouTube,TikTok,Self-Portrait Shooting, Black, Model:10088612', 1111004, 'Ring Light', 1110001, 'T12AW', 25);

-- --------------------------------------------------------

--
-- Structure de la table `product_details`
--

DROP TABLE IF EXISTS `product_details`;
CREATE TABLE IF NOT EXISTS `product_details` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `attribute` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK4y967p539vfvrt7tn47rlhr2q` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `product_details`
--

INSERT INTO `product_details` (`id`, `attribute`, `value`, `product_id`) VALUES
(1, 'Color', 'BLACK', 1),
(2, 'Color', 'BLACK', 2),
(3, 'Flash Memory Type', 'Micro SDXC', 2),
(4, 'Secure Digital Association Speed Class', 'Class 10', 2),
(5, 'Dimmable', '18/48cm Outer 55W 5500K 240 Pieces', 3);

-- --------------------------------------------------------

--
-- Structure de la table `product_extra_cost`
--

DROP TABLE IF EXISTS `product_extra_cost`;
CREATE TABLE IF NOT EXISTS `product_extra_cost` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fixed_cost` double NOT NULL,
  `variable_cost` double NOT NULL,
  `profit_margin` double NOT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK838eqmn63sfta0iiv8v9r300v` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `product_extra_cost`
--

INSERT INTO `product_extra_cost` (`id`, `fixed_cost`, `variable_cost`, `profit_margin`, `product_id`) VALUES
(1, 140, 10, 19, 1),
(2, 120, 19, 20, 2),
(3, 25, 2, 20, 3);

-- --------------------------------------------------------

--
-- Structure de la table `product_image`
--

DROP TABLE IF EXISTS `product_image`;
CREATE TABLE IF NOT EXISTS `product_image` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8ut1k90uxasdhv7ek0ifvrktm` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `product_image`
--

INSERT INTO `product_image` (`id`, `url`, `product_id`) VALUES
(1, 'http://localhost:8081/downloadFile/61eAIJI+nPL._AC_SL1500_.jpg', 1),
(2, 'http://localhost:8081/downloadFile/61PSpNQlsQL._AC_SL1440_.jpg', 2),
(3, 'http://localhost:8081/downloadFile/61Vr+9FI8PL._AC_SL1440_.jpg', 2),
(4, 'http://localhost:8081/downloadFile/81axmUuRHrL._AC_SL1500_.jpg', 2),
(5, 'http://localhost:8081/downloadFile/71+JKKAnfoL._AC_SL1500_.jpg', 3),
(6, 'http://localhost:8081/downloadFile/71br3XRdErL._AC_SL1500_.jpg', 3),
(7, 'http://localhost:8081/downloadFile/71Cc5uJ7f+L._AC_SL1500_.jpg', 3);

-- --------------------------------------------------------

--
-- Structure de la table `product_information`
--

DROP TABLE IF EXISTS `product_information`;
CREATE TABLE IF NOT EXISTS `product_information` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `max` int(11) DEFAULT NULL,
  `min` int(11) DEFAULT NULL,
  `security` int(11) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKqiugp8n149cegb6a8167jcc45` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `product_information`
--

INSERT INTO `product_information` (`id`, `max`, `min`, `security`, `product_id`) VALUES
(1, 20, 5, 6, 1),
(2, 20, 5, 6, 2),
(3, 20, 5, 6, 3);

-- --------------------------------------------------------

--
-- Structure de la table `product_supplier`
--

DROP TABLE IF EXISTS `product_supplier`;
CREATE TABLE IF NOT EXISTS `product_supplier` (
  `product_id` bigint(20) NOT NULL,
  `Supplier_id` bigint(20) NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `delivery_eta` varchar(255) DEFAULT NULL,
  `discount_rate` double DEFAULT NULL,
  `supplier_product_code` varchar(255) DEFAULT NULL,
  `unit_price` double DEFAULT NULL,
  `vat_code` double DEFAULT NULL,
  `currency_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`product_id`,`Supplier_id`),
  KEY `FKgu4p14kgkxrb8rxdvkcvjaggb` (`currency_id`),
  KEY `FKojmkj7n4g02l3vj0lf10j7rer` (`Supplier_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `product_supplier`
--

INSERT INTO `product_supplier` (`product_id`, `Supplier_id`, `created_date`, `delivery_eta`, `discount_rate`, `supplier_product_code`, `unit_price`, `vat_code`, `currency_id`) VALUES
(1, 1, '2021-08-05 16:45:25', 'dda', 0, '1', 140, 14, 1),
(2, 2, '2021-08-06 16:45:25', '4 days', 0, '2', 114, 16, 2),
(3, 2, '2021-08-06 16:45:25', '4 days', 0, '3', 33, 16, 2);

-- --------------------------------------------------------

--
-- Structure de la table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `roles`
--

INSERT INTO `roles` (`id`, `name`) VALUES
(1, 'ROLE_ADMIN'),
(2, 'ROLE_USER');

-- --------------------------------------------------------

--
-- Structure de la table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
CREATE TABLE IF NOT EXISTS `supplier` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category` varchar(255) DEFAULT NULL,
  `finality` varchar(255) DEFAULT NULL,
  `fiscalcode` varchar(255) DEFAULT NULL,
  `legalstatus` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `patentcode` varchar(255) DEFAULT NULL,
  `scope` varchar(255) DEFAULT NULL,
  `sector` varchar(255) DEFAULT NULL,
  `size` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `supplier`
--

INSERT INTO `supplier` (`id`, `category`, `finality`, `fiscalcode`, `legalstatus`, `name`, `patentcode`, `scope`, `sector`, `size`) VALUES
(1, 'Organization', 'Economical', '1452', 'Society', 'pull&bear', '22250', 'Material', 'Secondary', 'Small'),
(2, 'Enterprise', 'Social', '145d', 'individual Enterprise ', 'Samsung', '5420D', 'Material', 'Secondary', 'Small');

-- --------------------------------------------------------

--
-- Structure de la table `unity`
--

DROP TABLE IF EXISTS `unity`;
CREATE TABLE IF NOT EXISTS `unity` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `unity_code` varchar(255) DEFAULT NULL,
  `unity_name` varchar(255) DEFAULT NULL,
  `unity_sub_id` bigint(20) DEFAULT NULL,
  `organization_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKeujskbxogat334yjlm0y36y1b` (`unity_sub_id`),
  KEY `FKsqqmnuei3vhrhpt9dxlpbcge7` (`organization_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `password`, `username`) VALUES
(3, 'youssef.tfifha@esprit.tn', '$2a$10$.KMRtD85wwUOvgIraEkvWOPV7sssLg3sHXUtc8A7RN7bqYE7fjPuu', 'youssef'),
(4, 'admin@3s2i.tn', '$2a$10$.KMRtD85wwUOvgIraEkvWOPV7sssLg3sHXUtc8A7RN7bqYE7fjPuu', 'admin'),
(5, 'admin3.contact@esprit.tn', '$2a$10$67r1pApMFewtvIzjXmmpUeTa3Ji3BSJjXZCCJ74lAd0cF/N0EHYrG', 'admin1');

-- --------------------------------------------------------

--
-- Structure de la table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
CREATE TABLE IF NOT EXISTS `user_roles` (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FKh8ciramu9cc9q3qcqiv4ue8a6` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `user_roles`
--

INSERT INTO `user_roles` (`user_id`, `role_id`) VALUES
(4, 1),
(5, 1),
(3, 2);

-- --------------------------------------------------------

--
-- Structure de la table `warehouse`
--

DROP TABLE IF EXISTS `warehouse`;
CREATE TABLE IF NOT EXISTS `warehouse` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `warehouse_name` varchar(255) NOT NULL,
  `code` varchar(25) NOT NULL,
  `ref` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `organization_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_organization` (`organization_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `address_customer`
--
ALTER TABLE `address_customer`
  ADD CONSTRAINT `FK7jsd9ypl6vxj3t9t62urp8ru4` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`);

--
-- Contraintes pour la table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `FKkh5di77cfr01hq05rbcogspec` FOREIGN KEY (`productid`) REFERENCES `product` (`id`);

--
-- Contraintes pour la table `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `FKpgmhfouqt5uv16jdndcust0or` FOREIGN KEY (`parent_id`) REFERENCES `category` (`id`);

--
-- Contraintes pour la table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `FKj8dlm21j202cadsbfkoem0s58` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `delivery_customer`
--
ALTER TABLE `delivery_customer`
  ADD CONSTRAINT `FKfo27jjrd9f90nmyor0xwpfolb` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`);

--
-- Contraintes pour la table `delivery_customer_items`
--
ALTER TABLE `delivery_customer_items`
  ADD CONSTRAINT `FK69s4s12thfnvgs3f4ngwwl8ng` FOREIGN KEY (`order_item_id`) REFERENCES `order_customer_items` (`id`),
  ADD CONSTRAINT `FKhjih2o30egx73ulx7tlnc987b` FOREIGN KEY (`delivery_id`) REFERENCES `delivery_customer` (`id`);

--
-- Contraintes pour la table `delivery_supplier`
--
ALTER TABLE `delivery_supplier`
  ADD CONSTRAINT `FK648oi5aabpbty3u4kkbisj47g` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`),
  ADD CONSTRAINT `FKrahbuvn1yak2bmnl3xump9nt5` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`id`);

--
-- Contraintes pour la table `delivery_supplier_items`
--
ALTER TABLE `delivery_supplier_items`
  ADD CONSTRAINT `FKdswxrcx5ikh73m1oc6n1xipwy` FOREIGN KEY (`order_item_id`) REFERENCES `order_supplier_items` (`id`),
  ADD CONSTRAINT `FKguxmn4x4aitfv1q7prx2du9l0` FOREIGN KEY (`delivery_id`) REFERENCES `delivery_supplier` (`id`);

--
-- Contraintes pour la table `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `FKgph7ais5uxsg9qyv486wu989i` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `mouvement`
--
ALTER TABLE `mouvement`
  ADD CONSTRAINT `FKdua112xyjki9euyeh76ahu2dl` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouse` (`id`),
  ADD CONSTRAINT `FKk0fgvyrd4gg1eugabyqg2cbxd` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Contraintes pour la table `orders_customer`
--
ALTER TABLE `orders_customer`
  ADD CONSTRAINT `FKel9kyl84ego2otj2accfd8mr7` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`);

--
-- Contraintes pour la table `orders_supplier`
--
ALTER TABLE `orders_supplier`
  ADD CONSTRAINT `FKbd9quld26gnavvivvij6jctme` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`),
  ADD CONSTRAINT `fk_currency1` FOREIGN KEY (`currency_id`) REFERENCES `currency` (`id`);

--
-- Contraintes pour la table `order_customer_items`
--
ALTER TABLE `order_customer_items`
  ADD CONSTRAINT `FKatri80p9fodn2lpjxxpcv03hm` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `FKm3mp87f5ygbbfuqfdhc09y9a` FOREIGN KEY (`order_id`) REFERENCES `orders_customer` (`id`);

--
-- Contraintes pour la table `order_supplier_items`
--
ALTER TABLE `order_supplier_items`
  ADD CONSTRAINT `FKhaphc0cy1nm6odx07lug8rvln` FOREIGN KEY (`order_id`) REFERENCES `orders_supplier` (`id`),
  ADD CONSTRAINT `FKqwtap8md4g0nqq814hhilitac` FOREIGN KEY (`product_supplier_id`) REFERENCES `product_supplier` (`id`);

--
-- Contraintes pour la table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FKqx9wikktsev17ctu0kcpkrafc` FOREIGN KEY (`category`) REFERENCES `category` (`id`);

--
-- Contraintes pour la table `product_details`
--
ALTER TABLE `product_details`
  ADD CONSTRAINT `FK4y967p539vfvrt7tn47rlhr2q` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Contraintes pour la table `product_extra_cost`
--
ALTER TABLE `product_extra_cost`
  ADD CONSTRAINT `FK838eqmn63sfta0iiv8v9r300v` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Contraintes pour la table `product_image`
--
ALTER TABLE `product_image`
  ADD CONSTRAINT `FK8ut1k90uxasdhv7ek0ifvrktm` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Contraintes pour la table `product_information`
--
ALTER TABLE `product_information`
  ADD CONSTRAINT `FKqiugp8n149cegb6a8167jcc45` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Contraintes pour la table `unity`
--
ALTER TABLE `unity`
  ADD CONSTRAINT `FKeujskbxogat334yjlm0y36y1b` FOREIGN KEY (`unity_sub_id`) REFERENCES `unity` (`id`),
  ADD CONSTRAINT `FKsqqmnuei3vhrhpt9dxlpbcge7` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`id`);

--
-- Contraintes pour la table `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `FK55itppkw3i07do3h7qoclqd4k` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FKh8ciramu9cc9q3qcqiv4ue8a6` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Contraintes pour la table `warehouse`
--
ALTER TABLE `warehouse`
  ADD CONSTRAINT `FK363w26pip2e3j8p65pao5xkvc` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
