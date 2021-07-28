-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jul 28, 2021 at 04:48 PM
-- Server version: 5.7.19
-- PHP Version: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `3s2i`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
CREATE TABLE IF NOT EXISTS `address` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `zipcode` varchar(255) DEFAULT NULL,
  `customer` bigint(20) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK7jsd9ypl6vxj3t9t62urp8ru4` (`customer`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`id`, `city`, `country`, `state`, `street`, `zipcode`, `customer`, `type`) VALUES
(8, 'Carthage', '??    Tunisia', 'Tunis Governorate', '16 urue kairouan', '2034', 24, 'DOMICILE'),
(9, 'Carthage', '??    Tunisia', 'Tunis Governorate', '16 RUE LLL', '2034', 24, 'DOMICILE');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `url` varchar(255) DEFAULT NULL,
  `idup` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKpgmhfouqt5uv16jdndcust0or` (`idup`)
) ENGINE=InnoDB AUTO_INCREMENT=305 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `description`, `url`, `idup`) VALUES
(1, 'Electronics', 'Electronics is the study and use of electrical devices that operate at relatively low voltages by controlling the flow of electrons or other electrically charged particles in devices such as thermionic valves and semiconductors. ', 'http://localhost:8081/downloadFile/cpu.svg', NULL),
(3, 'Computers', ' supercomputers, mainframe computers, minicomputers, microcomputers, and finally mobile computers.', 'http://localhost:8081/downloadFile/laptop.svg', NULL),
(4, 'SmartHome', 'a home equipped with lighting, heating, and electronic devices that can be controlled remotely by smartphone or computer.', 'http://localhost:8081/downloadFile/smarthome.svg', NULL),
(5, 'Arts & Gifts', 'something given voluntarily without payment in return, as to show favor toward someone, honor an occasion, or make a gesture of assistance; present. ... something bestowed or acquired without any particular effort by the recipient or without its being earned: Those extra points he got in the game were a total gift.', 'http://localhost:8081/downloadFile/gift-bag.svg', NULL),
(6, 'Automotive', 'relating to or concerned with motor vehicles.', 'http://localhost:8081/downloadFile/car.svg', NULL),
(7, 'Baby', 'Baby\'s daily tools', 'http://localhost:8081/downloadFile/baby-boy.svg', NULL),
(9, 'Beauty & personal care', ' Beauty and personal care is an art field that addresses the looks and health of someone\'s hair, nails, and skin. This field of beauty and personal care encompasses a wide range of careers such as stylists, barbers, manicurists, pedicurists, makeup artists, and education.', 'http://localhost:8081/downloadFile/skincare.svg', NULL),
(10, 'Women\'s fashion', 'a popular or the latest style of clothing, hair, decoration, or behaviour.', 'http://localhost:8081/downloadFile/fashion.svg', NULL),
(11, 'Men\'s fashion', 'An increase in influential new designers has questioned the fundamentals of apparels and has led to a novel line of clothing style for the postmodern male.', 'http://localhost:8081/downloadFile/fashion%20(1).svg', NULL),
(12, 'Boys\'s fashion', 'An increase in influential new designers has questioned the fundamentals of apparels and has led to a novel line of clothing style for the postmodern male.', 'http://localhost:8081/downloadFile/worker.svg', NULL),
(13, 'Health & Household', 'Tax filer + spouse + tax dependents = household. ... Include your spouse and tax dependents even if they don\'t need health coverage.', 'http://localhost:8081/downloadFile/woman.svg', NULL),
(14, 'Home & kitchen', 'Home & kitchen daily Tools', 'http://localhost:8081/downloadFile/kitchen.svg', NULL),
(15, 'Industrial & Scientific', 'It is this science that is employed by production companies in order to develop, adapt, and produce a product for the consumer market', 'http://localhost:8081/downloadFile/contruction.svg', NULL),
(16, 'Luggage', 'suitcases or other bags in which to pack personal belongings for travelling.', 'http://localhost:8081/downloadFile/suitcase.svg', NULL),
(17, 'Movies & Television', 'Television film. A television film is a feature-length motion picture that is produced and originally distributed by or to a television network, in contrast to theatrical films made explicitly for initial showing in movie theaters', 'http://localhost:8081/downloadFile/movies.svg', NULL),
(18, 'Pet Supplies', 'Retail store services for the sale of pet food, pet supplies, pet accessories, foodstuffs for animals, animal requisites. tmClass.\nPeople also ask', 'http://localhost:8081/downloadFile/pet-supplies.svg', NULL),
(19, 'Software', 'Software is the programs and routines for a computer or the program material for an electronic device which make it run. An example of software is Excel or Windows or iTunes', 'http://localhost:8081/downloadFile/software.svg', NULL),
(20, 'Sports & Outdoor', 'a sport that is played outdoors. field sport. hunting, hunt - the pursuit and killing or capture of wild animals regarded as a sport. fishing, sportfishing - the act of someone who fishes as a diversion. athletics, sport - an active diversion requiring physical exertion and competition', 'http://localhost:8081/downloadFile/sport.svg', NULL),
(21, 'Tools & Home Improvement', 'Home improvement can consist of projects that upgrade an existing home interior (such as electrical and plumbing), exterior (masonry, concrete, siding, roofing) ...', 'http://localhost:8081/downloadFile/home-repair.svg', NULL),
(22, 'Toys & Games', 'Toys and games are the tools of play, and play is a large part of social life. ... Adults gave them to children during festival times, and the young made toys for themselves in moments of freedom from control or work out of gourds, bits of wood, or animal parts.', 'http://localhost:8081/downloadFile/puzzle.svg', NULL),
(23, 'Video Games', 'a game played by electronically manipulating images produced by a computer program on a monitor or other display.', 'http://localhost:8081/downloadFile/console.svg', NULL),
(24, 'Accessories & Supplies', 'Electronics is the study and use of electrical devices that operate at relatively low voltages by controlling the flow of electrons or other electrically charged particles in devices such as thermionic valves and semiconductors. ', 'http://localhost:8081/downloadFile/cpu.svg', 1),
(25, 'Camera & Photo', 'Electronics is the study and use of electrical devices that operate at relatively low voltages by controlling the flow of electrons or other electrically charged particles in devices such as thermionic valves and semiconductors. ', 'http://localhost:8081/downloadFile/cpu.svg', 1),
(26, 'Car & Vehicle Electronics', 'Electronics is the study and use of electrical devices that operate at relatively low voltages by controlling the flow of electrons or other electrically charged particles in devices such as thermionic valves and semiconductors. ', 'http://localhost:8081/downloadFile/cpu.svg', 1),
(27, 'Cell Phones & Accessories', 'Electronics is the study and use of electrical devices that operate at relatively low voltages by controlling the flow of electrons or other electrically charged particles in devices such as thermionic valves and semiconductors. ', 'http://localhost:8081/downloadFile/cpu.svg', 1),
(28, 'Computers & Accessories', 'Electronics is the study and use of electrical devices that operate at relatively low voltages by controlling the flow of electrons or other electrically charged particles in devices such as thermionic valves and semiconductors. ', 'http://localhost:8081/downloadFile/cpu.svg', 1),
(29, 'GPS & Navigation', 'Electronics is the study and use of electrical devices that operate at relatively low voltages by controlling the flow of electrons or other electrically charged particles in devices such as thermionic valves and semiconductors. ', 'http://localhost:8081/downloadFile/cpu.svg', 1),
(30, 'Headphones', 'Electronics is the study and use of electrical devices that operate at relatively low voltages by controlling the flow of electrons or other electrically charged particles in devices such as thermionic valves and semiconductors. ', 'http://localhost:8081/downloadFile/cpu.svg', 1),
(31, 'Home Audio', 'Electronics is the study and use of electrical devices that operate at relatively low voltages by controlling the flow of electrons or other electrically charged particles in devices such as thermionic valves and semiconductors. ', 'http://localhost:8081/downloadFile/cpu.svg', 1),
(32, 'Office Electronics', 'Electronics is the study and use of electrical devices that operate at relatively low voltages by controlling the flow of electrons or other electrically charged particles in devices such as thermionic valves and semiconductors. ', 'http://localhost:8081/downloadFile/cpu.svg', 1),
(33, 'Portable Audio & Video', 'Electronics is the study and use of electrical devices that operate at relatively low voltages by controlling the flow of electrons or other electrically charged particles in devices such as thermionic valves and semiconductors. ', 'http://localhost:8081/downloadFile/cpu.svg', 1),
(34, 'Security & Surveillance', 'Electronics is the study and use of electrical devices that operate at relatively low voltages by controlling the flow of electrons or other electrically charged particles in devices such as thermionic valves and semiconductors. ', 'http://localhost:8081/downloadFile/cpu.svg', 1),
(35, 'Service Plans', 'Electronics is the study and use of electrical devices that operate at relatively low voltages by controlling the flow of electrons or other electrically charged particles in devices such as thermionic valves and semiconductors. ', 'http://localhost:8081/downloadFile/cpu.svg', 1),
(36, 'Television & Video', 'Electronics is the study and use of electrical devices that operate at relatively low voltages by controlling the flow of electrons or other electrically charged particles in devices such as thermionic valves and semiconductors. ', 'http://localhost:8081/downloadFile/cpu.svg', 1),
(37, 'Video Game Consoles & Accessories', 'Electronics is the study and use of electrical devices that operate at relatively low voltages by controlling the flow of electrons or other electrically charged particles in devices such as thermionic valves and semiconductors. ', 'http://localhost:8081/downloadFile/cpu.svg', 1),
(38, 'Video Projectors', 'Electronics is the study and use of electrical devices that operate at relatively low voltages by controlling the flow of electrons or other electrically charged particles in devices such as thermionic valves and semiconductors. ', 'http://localhost:8081/downloadFile/cpu.svg', 1),
(39, 'Accessories & Supplies', 'Electronics is the study and use of electrical devices that operate at relatively low voltages by controlling the flow of electrons or other electrically charged particles in devices such as thermionic valves and semiconductors. ', 'http://localhost:8081/downloadFile/cpu.svg', 1),
(40, 'eBook Readers & Accessories', 'Electronics is the study and use of electrical devices that operate at relatively low voltages by controlling the flow of electrons or other electrically charged particles in devices such as thermionic valves and semiconductors. ', 'http://localhost:8081/downloadFile/cpu.svg', 1),
(41, 'Computer Accessories & Peripherals', ' supercomputers, mainframe computers, minicomputers, microcomputers, and finally mobile computers.', 'http://localhost:8081/downloadFile/laptop.svg', 3),
(42, 'Computer Components', ' supercomputers, mainframe computers, minicomputers, microcomputers, and finally mobile computers.', 'http://localhost:8081/downloadFile/laptop.svg', 3),
(43, 'Computers & Tablets', ' supercomputers, mainframe computers, minicomputers, microcomputers, and finally mobile computers.', 'http://localhost:8081/downloadFile/laptop.svg', 3),
(44, 'Data Storage', ' supercomputers, mainframe computers, minicomputers, microcomputers, and finally mobile computers.', 'http://localhost:8081/downloadFile/laptop.svg', 3),
(45, 'External Components', ' supercomputers, mainframe computers, minicomputers, microcomputers, and finally mobile computers.', 'http://localhost:8081/downloadFile/laptop.svg', 3),
(46, 'Laptop Accessories', ' supercomputers, mainframe computers, minicomputers, microcomputers, and finally mobile computers.', 'http://localhost:8081/downloadFile/laptop.svg', 3),
(47, 'Monitors', ' supercomputers, mainframe computers, minicomputers, microcomputers, and finally mobile computers.', 'http://localhost:8081/downloadFile/laptop.svg', 3),
(48, 'Networking Products', ' supercomputers, mainframe computers, minicomputers, microcomputers, and finally mobile computers.', 'http://localhost:8081/downloadFile/laptop.svg', 3),
(49, 'Power Strips & Surge Protectors', ' supercomputers, mainframe computers, minicomputers, microcomputers, and finally mobile computers.', 'http://localhost:8081/downloadFile/laptop.svg', 3),
(50, 'Printers', ' supercomputers, mainframe computers, minicomputers, microcomputers, and finally mobile computers.', 'http://localhost:8081/downloadFile/laptop.svg', 3),
(51, 'Scanners', ' supercomputers, mainframe computers, minicomputers, microcomputers, and finally mobile computers.', 'http://localhost:8081/downloadFile/laptop.svg', 3),
(52, 'Servers', ' supercomputers, mainframe computers, minicomputers, microcomputers, and finally mobile computers.', 'http://localhost:8081/downloadFile/laptop.svg', 3),
(53, 'Tablet Accessories', ' supercomputers, mainframe computers, minicomputers, microcomputers, and finally mobile computers.', 'http://localhost:8081/downloadFile/laptop.svg', 3),
(54, 'Tablet Replacement Parts', ' supercomputers, mainframe computers, minicomputers, microcomputers, and finally mobile computers.', 'http://localhost:8081/downloadFile/laptop.svg', 3),
(55, 'Warranties & Services', ' supercomputers, mainframe computers, minicomputers, microcomputers, and finally mobile computers.', 'http://localhost:8081/downloadFile/laptop.svg', 3),
(56, 'Amazon Smart Home', 'a home equipped with lighting, heating, and electronic devices that can be controlled remotely by smartphone or computer.', 'http://localhost:8081/downloadFile/smarthome.svg', 4),
(57, 'Smart Home Lighting', 'a home equipped with lighting, heating, and electronic devices that can be controlled remotely by smartphone or computer.', 'http://localhost:8081/downloadFile/smarthome.svg', 4),
(58, 'Smart Locks and Entry', 'a home equipped with lighting, heating, and electronic devices that can be controlled remotely by smartphone or computer.', 'http://localhost:8081/downloadFile/smarthome.svg', 4),
(59, 'Plugs and Outlets', 'a home equipped with lighting, heating, and electronic devices that can be controlled remotely by smartphone or computer.', 'http://localhost:8081/downloadFile/smarthome.svg', 4),
(60, 'Security Cameras and Systems', 'a home equipped with lighting, heating, and electronic devices that can be controlled remotely by smartphone or computer.', 'http://localhost:8081/downloadFile/smarthome.svg', 4),
(61, 'New Smart Devices', 'a home equipped with lighting, heating, and electronic devices that can be controlled remotely by smartphone or computer.', 'http://localhost:8081/downloadFile/smarthome.svg', 4),
(62, 'Heating and Cooling', 'a home equipped with lighting, heating, and electronic devices that can be controlled remotely by smartphone or computer.', 'http://localhost:8081/downloadFile/smarthome.svg', 4),
(63, 'Detectors and Sensors', 'a home equipped with lighting, heating, and electronic devices that can be controlled remotely by smartphone or computer.', 'http://localhost:8081/downloadFile/smarthome.svg', 4),
(64, 'Home Entertainment', 'a home equipped with lighting, heating, and electronic devices that can be controlled remotely by smartphone or computer.', 'http://localhost:8081/downloadFile/smarthome.svg', 4),
(65, 'Pet', 'a home equipped with lighting, heating, and electronic devices that can be controlled remotely by smartphone or computer.', 'http://localhost:8081/downloadFile/smarthome.svg', 4),
(66, 'Voice Assistants and Hubs', 'a home equipped with lighting, heating, and electronic devices that can be controlled remotely by smartphone or computer.', 'http://localhost:8081/downloadFile/smarthome.svg', 4),
(67, 'Kitchen', 'a home equipped with lighting, heating, and electronic devices that can be controlled remotely by smartphone or computer.', 'http://localhost:8081/downloadFile/smarthome.svg', 4),
(68, 'Vacuums and Mops', 'a home equipped with lighting, heating, and electronic devices that can be controlled remotely by smartphone or computer.', 'http://localhost:8081/downloadFile/smarthome.svg', 4),
(69, 'Lawn and Garden', 'a home equipped with lighting, heating, and electronic devices that can be controlled remotely by smartphone or computer.', 'http://localhost:8081/downloadFile/smarthome.svg', 4),
(70, 'WIFI and Networking', 'a home equipped with lighting, heating, and electronic devices that can be controlled remotely by smartphone or computer.', 'http://localhost:8081/downloadFile/smarthome.svg', 4),
(71, 'Other Solutions', 'a home equipped with lighting, heating, and electronic devices that can be controlled remotely by smartphone or computer.', 'http://localhost:8081/downloadFile/smarthome.svg', 4),
(72, 'Painting, Drawing & Art Supplies', 'something given voluntarily without payment in return, as to show favor toward someone, honor an occasion, or make a gesture of assistance; present. ... something bestowed or acquired without any particular effort by the recipient or without its being earned: Those extra points he got in the game were a total gift.', 'http://localhost:8081/downloadFile/gift-bag.svg', 5),
(73, 'Beading & Jewelry Making', 'something given voluntarily without payment in return, as to show favor toward someone, honor an occasion, or make a gesture of assistance; present. ... something bestowed or acquired without any particular effort by the recipient or without its being earned: Those extra points he got in the game were a total gift.', 'http://localhost:8081/downloadFile/gift-bag.svg', 5),
(74, 'Crafting', 'something given voluntarily without payment in return, as to show favor toward someone, honor an occasion, or make a gesture of assistance; present. ... something bestowed or acquired without any particular effort by the recipient or without its being earned: Those extra points he got in the game were a total gift.', 'http://localhost:8081/downloadFile/gift-bag.svg', 5),
(75, 'Fabric', 'something given voluntarily without payment in return, as to show favor toward someone, honor an occasion, or make a gesture of assistance; present. ... something bestowed or acquired without any particular effort by the recipient or without its being earned: Those extra points he got in the game were a total gift.', 'http://localhost:8081/downloadFile/gift-bag.svg', 5),
(76, 'Fabric Decorating', 'something given voluntarily without payment in return, as to show favor toward someone, honor an occasion, or make a gesture of assistance; present. ... something bestowed or acquired without any particular effort by the recipient or without its being earned: Those extra points he got in the game were a total gift.', 'http://localhost:8081/downloadFile/gift-bag.svg', 5),
(77, 'Knitting & Crochet', 'something given voluntarily without payment in return, as to show favor toward someone, honor an occasion, or make a gesture of assistance; present. ... something bestowed or acquired without any particular effort by the recipient or without its being earned: Those extra points he got in the game were a total gift.', 'http://localhost:8081/downloadFile/gift-bag.svg', 5),
(78, 'Needlework', 'something given voluntarily without payment in return, as to show favor toward someone, honor an occasion, or make a gesture of assistance; present. ... something bestowed or acquired without any particular effort by the recipient or without its being earned: Those extra points he got in the game were a total gift.', 'http://localhost:8081/downloadFile/gift-bag.svg', 5),
(79, 'Organization, Storage & Transport', 'something given voluntarily without payment in return, as to show favor toward someone, honor an occasion, or make a gesture of assistance; present. ... something bestowed or acquired without any particular effort by the recipient or without its being earned: Those extra points he got in the game were a total gift.', 'http://localhost:8081/downloadFile/gift-bag.svg', 5),
(80, 'Printmaking', 'something given voluntarily without payment in return, as to show favor toward someone, honor an occasion, or make a gesture of assistance; present. ... something bestowed or acquired without any particular effort by the recipient or without its being earned: Those extra points he got in the game were a total gift.', 'http://localhost:8081/downloadFile/gift-bag.svg', 5),
(81, 'Scrapbooking & Stamping', 'something given voluntarily without payment in return, as to show favor toward someone, honor an occasion, or make a gesture of assistance; present. ... something bestowed or acquired without any particular effort by the recipient or without its being earned: Those extra points he got in the game were a total gift.', 'http://localhost:8081/downloadFile/gift-bag.svg', 5),
(82, 'Sewing', 'something given voluntarily without payment in return, as to show favor toward someone, honor an occasion, or make a gesture of assistance; present. ... something bestowed or acquired without any particular effort by the recipient or without its being earned: Those extra points he got in the game were a total gift.', 'http://localhost:8081/downloadFile/gift-bag.svg', 5),
(83, 'Party Decorations & Supplies', 'something given voluntarily without payment in return, as to show favor toward someone, honor an occasion, or make a gesture of assistance; present. ... something bestowed or acquired without any particular effort by the recipient or without its being earned: Those extra points he got in the game were a total gift.', 'http://localhost:8081/downloadFile/gift-bag.svg', 5),
(84, 'Gift Wrapping Supplies', 'something given voluntarily without payment in return, as to show favor toward someone, honor an occasion, or make a gesture of assistance; present. ... something bestowed or acquired without any particular effort by the recipient or without its being earned: Those extra points he got in the game were a total gift.', 'http://localhost:8081/downloadFile/gift-bag.svg', 5),
(85, 'Car Care', 'relating to or concerned with motor vehicles.', 'http://localhost:8081/downloadFile/car.svg', 6),
(86, 'Car Electronics & Accessories', 'relating to or concerned with motor vehicles.', 'http://localhost:8081/downloadFile/car.svg', 6),
(87, 'Interior Accessories', 'relating to or concerned with motor vehicles.', 'http://localhost:8081/downloadFile/car.svg', 6),
(88, 'Lights & Lighting Accessories', 'relating to or concerned with motor vehicles.', 'http://localhost:8081/downloadFile/car.svg', 6),
(89, 'Exterior Accessories', 'relating to or concerned with motor vehicles.', 'http://localhost:8081/downloadFile/car.svg', 6),
(90, 'Motorcycle & Powersports', 'relating to or concerned with motor vehicles.', 'http://localhost:8081/downloadFile/car.svg', 6),
(91, 'Oils & Fluids', 'relating to or concerned with motor vehicles.', 'http://localhost:8081/downloadFile/car.svg', 6),
(92, 'Paint & Paint Supplies', 'relating to or concerned with motor vehicles.', 'http://localhost:8081/downloadFile/car.svg', 6),
(93, 'Performance Parts & Accessories', 'relating to or concerned with motor vehicles.', 'http://localhost:8081/downloadFile/car.svg', 6),
(94, 'Replacement Parts', 'relating to or concerned with motor vehicles.', 'http://localhost:8081/downloadFile/car.svg', 6),
(95, 'RV Parts & Accessories', 'relating to or concerned with motor vehicles.', 'http://localhost:8081/downloadFile/car.svg', 6),
(96, 'Tires & Wheels', 'relating to or concerned with motor vehicles.', 'http://localhost:8081/downloadFile/car.svg', 6),
(97, 'Tools & Equipment', 'relating to or concerned with motor vehicles.', 'http://localhost:8081/downloadFile/car.svg', 6),
(98, 'Automotive Enthusiast Merchandise', 'relating to or concerned with motor vehicles.', 'http://localhost:8081/downloadFile/car.svg', 6),
(99, 'Heavy Duty & Commercial Vehicle Equipment', 'relating to or concerned with motor vehicles.', 'http://localhost:8081/downloadFile/car.svg', 6),
(100, 'Activity & Entertainment', 'Baby\'s daily tools', 'http://localhost:8081/downloadFile/baby-boy.svg', 7),
(101, 'Baby & Toddler Toys', 'Baby\'s daily tools', 'http://localhost:8081/downloadFile/baby-boy.svg', 7),
(102, 'Apparel & Accessories', 'Baby\'s daily tools', 'http://localhost:8081/downloadFile/baby-boy.svg', 7),
(103, 'Baby Care', 'Baby\'s daily tools', 'http://localhost:8081/downloadFile/baby-boy.svg', 7),
(104, 'Baby Stationery', 'Baby\'s daily tools', 'http://localhost:8081/downloadFile/baby-boy.svg', 7),
(105, 'Car Seats & Accessories', 'Baby\'s daily tools', 'http://localhost:8081/downloadFile/baby-boy.svg', 7),
(106, 'Diapering', 'Baby\'s daily tools', 'http://localhost:8081/downloadFile/baby-boy.svg', 7),
(107, 'Feeding', 'Baby\'s daily tools', 'http://localhost:8081/downloadFile/baby-boy.svg', 7),
(108, 'Gifts', 'Baby\'s daily tools', 'http://localhost:8081/downloadFile/baby-boy.svg', 7),
(109, 'Nursery', 'Baby\'s daily tools', 'http://localhost:8081/downloadFile/baby-boy.svg', 7),
(110, 'Potty Training', 'Baby\'s daily tools', 'http://localhost:8081/downloadFile/baby-boy.svg', 7),
(111, 'Pregnancy & Maternity', 'Baby\'s daily tools', 'http://localhost:8081/downloadFile/baby-boy.svg', 7),
(112, 'Safety', 'Baby\'s daily tools', 'http://localhost:8081/downloadFile/baby-boy.svg', 7),
(113, 'Strollers & Accessories', 'Baby\'s daily tools', 'http://localhost:8081/downloadFile/baby-boy.svg', 7),
(114, 'Travel Gear', 'Baby\'s daily tools', 'http://localhost:8081/downloadFile/baby-boy.svg', 7),
(115, 'Makeup', ' Beauty and personal care is an art field that addresses the looks and health of someone\'s hair, nails, and skin. This field of beauty and personal care encompasses a wide range of careers such as stylists, barbers, manicurists, pedicurists, makeup artists, and education.', 'http://localhost:8081/downloadFile/skincare.svg', 9),
(116, 'Skin Care', ' Beauty and personal care is an art field that addresses the looks and health of someone\'s hair, nails, and skin. This field of beauty and personal care encompasses a wide range of careers such as stylists, barbers, manicurists, pedicurists, makeup artists, and education.', 'http://localhost:8081/downloadFile/skincare.svg', 9),
(117, 'Hair Care', ' Beauty and personal care is an art field that addresses the looks and health of someone\'s hair, nails, and skin. This field of beauty and personal care encompasses a wide range of careers such as stylists, barbers, manicurists, pedicurists, makeup artists, and education.', 'http://localhost:8081/downloadFile/skincare.svg', 9),
(118, 'Fragrance', ' Beauty and personal care is an art field that addresses the looks and health of someone\'s hair, nails, and skin. This field of beauty and personal care encompasses a wide range of careers such as stylists, barbers, manicurists, pedicurists, makeup artists, and education.', 'http://localhost:8081/downloadFile/skincare.svg', 9),
(119, 'Foot, Hand & Nail Care', ' Beauty and personal care is an art field that addresses the looks and health of someone\'s hair, nails, and skin. This field of beauty and personal care encompasses a wide range of careers such as stylists, barbers, manicurists, pedicurists, makeup artists, and education.', 'http://localhost:8081/downloadFile/skincare.svg', 9),
(120, 'Tools & Accessories', ' Beauty and personal care is an art field that addresses the looks and health of someone\'s hair, nails, and skin. This field of beauty and personal care encompasses a wide range of careers such as stylists, barbers, manicurists, pedicurists, makeup artists, and education.', 'http://localhost:8081/downloadFile/skincare.svg', 9),
(121, 'Shave & Hair Removal', ' Beauty and personal care is an art field that addresses the looks and health of someone\'s hair, nails, and skin. This field of beauty and personal care encompasses a wide range of careers such as stylists, barbers, manicurists, pedicurists, makeup artists, and education.', 'http://localhost:8081/downloadFile/skincare.svg', 9),
(122, 'Personal Care', ' Beauty and personal care is an art field that addresses the looks and health of someone\'s hair, nails, and skin. This field of beauty and personal care encompasses a wide range of careers such as stylists, barbers, manicurists, pedicurists, makeup artists, and education.', 'http://localhost:8081/downloadFile/skincare.svg', 9),
(123, 'Oral Care', ' Beauty and personal care is an art field that addresses the looks and health of someone\'s hair, nails, and skin. This field of beauty and personal care encompasses a wide range of careers such as stylists, barbers, manicurists, pedicurists, makeup artists, and education.', 'http://localhost:8081/downloadFile/skincare.svg', 9),
(124, 'Shoes', 'a popular or the latest style of clothing, hair, decoration, or behaviour.', 'http://localhost:8081/downloadFile/fashion.svg', 10),
(125, 'Clothing', 'a popular or the latest style of clothing, hair, decoration, or behaviour.', 'http://localhost:8081/downloadFile/fashion.svg', 10),
(126, 'Jewelry', 'a popular or the latest style of clothing, hair, decoration, or behaviour.', 'http://localhost:8081/downloadFile/fashion.svg', 10),
(127, 'Watches', 'a popular or the latest style of clothing, hair, decoration, or behaviour.', 'http://localhost:8081/downloadFile/fashion.svg', 10),
(128, 'Handbags', 'a popular or the latest style of clothing, hair, decoration, or behaviour.', 'http://localhost:8081/downloadFile/fashion.svg', 10),
(129, 'Accessories', 'a popular or the latest style of clothing, hair, decoration, or behaviour.', 'http://localhost:8081/downloadFile/fashion.svg', 10),
(130, 'Men\'s Fashion', 'a popular or the latest style of clothing, hair, decoration, or behaviour.', 'http://localhost:8081/downloadFile/fashion.svg', 10),
(131, 'Girls\' Fashion', 'a popular or the latest style of clothing, hair, decoration, or behaviour.', 'http://localhost:8081/downloadFile/fashion.svg', 10),
(132, 'Boys\' Fashion', 'a popular or the latest style of clothing, hair, decoration, or behaviour.', 'http://localhost:8081/downloadFile/fashion.svg', 10),
(133, 'Clothing', 'An increase in influential new designers has questioned the fundamentals of apparels and has led to a novel line of clothing style for the postmodern male.', 'http://localhost:8081/downloadFile/fashion%20(1).svg', 11),
(134, 'Clothing', 'An increase in influential new designers has questioned the fundamentals of apparels and has led to a novel line of clothing style for the postmodern male.', 'http://localhost:8081/downloadFile/fashion%20(1).svg', 11),
(135, 'Watches', 'An increase in influential new designers has questioned the fundamentals of apparels and has led to a novel line of clothing style for the postmodern male.', 'http://localhost:8081/downloadFile/fashion%20(1).svg', 11),
(136, 'Accessories', 'An increase in influential new designers has questioned the fundamentals of apparels and has led to a novel line of clothing style for the postmodern male.', 'http://localhost:8081/downloadFile/fashion%20(1).svg', 11),
(137, 'Women\'s Fashion', 'An increase in influential new designers has questioned the fundamentals of apparels and has led to a novel line of clothing style for the postmodern male.', 'http://localhost:8081/downloadFile/fashion%20(1).svg', 11),
(138, 'Girls\' Fashion', 'An increase in influential new designers has questioned the fundamentals of apparels and has led to a novel line of clothing style for the postmodern male.', 'http://localhost:8081/downloadFile/fashion%20(1).svg', 11),
(139, 'Boys\' Fashion', 'An increase in influential new designers has questioned the fundamentals of apparels and has led to a novel line of clothing style for the postmodern male.', 'http://localhost:8081/downloadFile/fashion%20(1).svg', 11),
(140, 'Clothing', 'An increase in influential new designers has questioned the fundamentals of apparels and has led to a novel line of clothing style for the postmodern male.', 'http://localhost:8081/downloadFile/worker.svg', 12),
(141, 'Shoes', 'An increase in influential new designers has questioned the fundamentals of apparels and has led to a novel line of clothing style for the postmodern male.', 'http://localhost:8081/downloadFile/worker.svg', 12),
(142, 'Watches', 'An increase in influential new designers has questioned the fundamentals of apparels and has led to a novel line of clothing style for the postmodern male.', 'http://localhost:8081/downloadFile/worker.svg', 12),
(143, 'Jewelry', 'An increase in influential new designers has questioned the fundamentals of apparels and has led to a novel line of clothing style for the postmodern male.', 'http://localhost:8081/downloadFile/worker.svg', 12),
(144, 'Accessories', 'An increase in influential new designers has questioned the fundamentals of apparels and has led to a novel line of clothing style for the postmodern male.', 'http://localhost:8081/downloadFile/worker.svg', 12),
(145, 'School Uniforms', 'An increase in influential new designers has questioned the fundamentals of apparels and has led to a novel line of clothing style for the postmodern male.', 'http://localhost:8081/downloadFile/worker.svg', 12),
(146, 'Women\'s Fashion', 'An increase in influential new designers has questioned the fundamentals of apparels and has led to a novel line of clothing style for the postmodern male.', 'http://localhost:8081/downloadFile/worker.svg', 12),
(147, 'Men\'s Fashion', 'An increase in influential new designers has questioned the fundamentals of apparels and has led to a novel line of clothing style for the postmodern male.', 'http://localhost:8081/downloadFile/worker.svg', 12),
(148, 'Girls\' Fashion', 'An increase in influential new designers has questioned the fundamentals of apparels and has led to a novel line of clothing style for the postmodern male.', 'http://localhost:8081/downloadFile/worker.svg', 12),
(149, 'Baby & Child Care', 'Tax filer + spouse + tax dependents = household. ... Include your spouse and tax dependents even if they don\'t need health coverage.', 'http://localhost:8081/downloadFile/woman.svg', 13),
(150, 'Health Care', 'Tax filer + spouse + tax dependents = household. ... Include your spouse and tax dependents even if they don\'t need health coverage.', 'http://localhost:8081/downloadFile/woman.svg', 13),
(151, 'Household Supplies', 'Tax filer + spouse + tax dependents = household. ... Include your spouse and tax dependents even if they don\'t need health coverage.', 'http://localhost:8081/downloadFile/woman.svg', 13),
(152, 'Medical Supplies & Equipment', 'Tax filer + spouse + tax dependents = household. ... Include your spouse and tax dependents even if they don\'t need health coverage.', 'http://localhost:8081/downloadFile/woman.svg', 13),
(153, 'Oral Care', 'Tax filer + spouse + tax dependents = household. ... Include your spouse and tax dependents even if they don\'t need health coverage.', 'http://localhost:8081/downloadFile/woman.svg', 13),
(154, 'Personal Care', 'Tax filer + spouse + tax dependents = household. ... Include your spouse and tax dependents even if they don\'t need health coverage.', 'http://localhost:8081/downloadFile/woman.svg', 13),
(155, 'Sexual Wellness', 'Tax filer + spouse + tax dependents = household. ... Include your spouse and tax dependents even if they don\'t need health coverage.', 'http://localhost:8081/downloadFile/woman.svg', 13),
(156, 'Sports Nutrition', 'Tax filer + spouse + tax dependents = household. ... Include your spouse and tax dependents even if they don\'t need health coverage.', 'http://localhost:8081/downloadFile/woman.svg', 13),
(157, 'Stationery & Gift Wrapping Supplies', 'Tax filer + spouse + tax dependents = household. ... Include your spouse and tax dependents even if they don\'t need health coverage.', 'http://localhost:8081/downloadFile/woman.svg', 13),
(158, 'Vision Care', 'Tax filer + spouse + tax dependents = household. ... Include your spouse and tax dependents even if they don\'t need health coverage.', 'http://localhost:8081/downloadFile/woman.svg', 13),
(159, 'Vitamins & Dietary Supplements', 'Tax filer + spouse + tax dependents = household. ... Include your spouse and tax dependents even if they don\'t need health coverage.', 'http://localhost:8081/downloadFile/woman.svg', 13),
(160, 'Wellness & Relaxation', 'Tax filer + spouse + tax dependents = household. ... Include your spouse and tax dependents even if they don\'t need health coverage.', 'http://localhost:8081/downloadFile/woman.svg', 13),
(161, 'Kitchen & Dining', 'Home & kitchen daily Tools', 'http://localhost:8081/downloadFile/kitchen.svg', 14),
(162, 'Kids\' Home Store', 'Home & kitchen daily Tools', 'http://localhost:8081/downloadFile/kitchen.svg', 14),
(163, 'Bedding', 'Home & kitchen daily Tools', 'http://localhost:8081/downloadFile/kitchen.svg', 14),
(164, 'Bath', 'Home & kitchen daily Tools', 'http://localhost:8081/downloadFile/kitchen.svg', 14),
(165, 'Furniture', 'Home & kitchen daily Tools', 'http://localhost:8081/downloadFile/kitchen.svg', 14),
(166, 'Home Décor', 'Home & kitchen daily Tools', 'http://localhost:8081/downloadFile/kitchen.svg', 14),
(167, 'Wall Art', 'Home & kitchen daily Tools', 'http://localhost:8081/downloadFile/kitchen.svg', 14),
(168, 'Lighting & Ceiling Fans', 'Home & kitchen daily Tools', 'http://localhost:8081/downloadFile/kitchen.svg', 14),
(169, 'Seasonal Décor', 'Home & kitchen daily Tools', 'http://localhost:8081/downloadFile/kitchen.svg', 14),
(170, 'Event & Party Supplies', 'Home & kitchen daily Tools', 'http://localhost:8081/downloadFile/kitchen.svg', 14),
(171, 'Heating, Cooling & Air Quality', 'Home & kitchen daily Tools', 'http://localhost:8081/downloadFile/kitchen.svg', 14),
(172, 'Irons & Steamers', 'Home & kitchen daily Tools', 'http://localhost:8081/downloadFile/kitchen.svg', 14),
(173, 'Vacuums & Floor Care', 'Home & kitchen daily Tools', 'http://localhost:8081/downloadFile/kitchen.svg', 14),
(174, 'Storage & Organization', 'Home & kitchen daily Tools', 'http://localhost:8081/downloadFile/kitchen.svg', 14),
(175, 'Cleaning Supplies', 'Home & kitchen daily Tools', 'http://localhost:8081/downloadFile/kitchen.svg', 14),
(176, 'Abrasive & Finishing Products', 'It is this science that is employed by production companies in order to develop, adapt, and produce a product for the consumer market', 'http://localhost:8081/downloadFile/contruction.svg', 15),
(177, 'Additive Manufacturing Products', 'It is this science that is employed by production companies in order to develop, adapt, and produce a product for the consumer market', 'http://localhost:8081/downloadFile/contruction.svg', 15),
(178, 'Commercial Door Products', 'It is this science that is employed by production companies in order to develop, adapt, and produce a product for the consumer market', 'http://localhost:8081/downloadFile/contruction.svg', 15),
(179, 'Cutting Tools', 'It is this science that is employed by production companies in order to develop, adapt, and produce a product for the consumer market', 'http://localhost:8081/downloadFile/contruction.svg', 15),
(180, 'Fasteners', 'It is this science that is employed by production companies in order to develop, adapt, and produce a product for the consumer market', 'http://localhost:8081/downloadFile/contruction.svg', 15),
(181, 'Filtration', 'It is this science that is employed by production companies in order to develop, adapt, and produce a product for the consumer market', 'http://localhost:8081/downloadFile/contruction.svg', 15),
(182, 'Food Service Equipment & Supplies', 'It is this science that is employed by production companies in order to develop, adapt, and produce a product for the consumer market', 'http://localhost:8081/downloadFile/contruction.svg', 15),
(183, 'Hydraulics, Pneumatics & Plumbing', 'It is this science that is employed by production companies in order to develop, adapt, and produce a product for the consumer market', 'http://localhost:8081/downloadFile/contruction.svg', 15),
(184, 'Industrial Electrical', 'It is this science that is employed by production companies in order to develop, adapt, and produce a product for the consumer market', 'http://localhost:8081/downloadFile/contruction.svg', 15),
(185, 'Industrial Hardware', 'It is this science that is employed by production companies in order to develop, adapt, and produce a product for the consumer market', 'http://localhost:8081/downloadFile/contruction.svg', 15),
(186, 'Industrial Power & Hand Tools', 'It is this science that is employed by production companies in order to develop, adapt, and produce a product for the consumer market', 'http://localhost:8081/downloadFile/contruction.svg', 15),
(187, 'Janitorial & Sanitation Supplies', 'It is this science that is employed by production companies in order to develop, adapt, and produce a product for the consumer market', 'http://localhost:8081/downloadFile/contruction.svg', 15),
(188, 'Lab & Scientific Products', 'It is this science that is employed by production companies in order to develop, adapt, and produce a product for the consumer market', 'http://localhost:8081/downloadFile/contruction.svg', 15),
(189, 'Material Handling Products', 'It is this science that is employed by production companies in order to develop, adapt, and produce a product for the consumer market', 'http://localhost:8081/downloadFile/contruction.svg', 15),
(190, 'Occupational Health & Safety Products', 'It is this science that is employed by production companies in order to develop, adapt, and produce a product for the consumer market', 'http://localhost:8081/downloadFile/contruction.svg', 15),
(191, 'Packaging & Shipping Supplies', 'It is this science that is employed by production companies in order to develop, adapt, and produce a product for the consumer market', 'http://localhost:8081/downloadFile/contruction.svg', 15),
(192, 'Power Transmission Products', 'It is this science that is employed by production companies in order to develop, adapt, and produce a product for the consumer market', 'http://localhost:8081/downloadFile/contruction.svg', 15),
(193, 'Professional Dental Supplies', 'It is this science that is employed by production companies in order to develop, adapt, and produce a product for the consumer market', 'http://localhost:8081/downloadFile/contruction.svg', 15),
(194, 'Professional Medical Supplies', 'It is this science that is employed by production companies in order to develop, adapt, and produce a product for the consumer market', 'http://localhost:8081/downloadFile/contruction.svg', 15),
(195, 'Raw Materials', 'It is this science that is employed by production companies in order to develop, adapt, and produce a product for the consumer market', 'http://localhost:8081/downloadFile/contruction.svg', 15),
(196, 'Retail Store Fixtures & Equipment', 'It is this science that is employed by production companies in order to develop, adapt, and produce a product for the consumer market', 'http://localhost:8081/downloadFile/contruction.svg', 15),
(197, 'Robotics', 'It is this science that is employed by production companies in order to develop, adapt, and produce a product for the consumer market', 'http://localhost:8081/downloadFile/contruction.svg', 15),
(198, 'Science Education', 'It is this science that is employed by production companies in order to develop, adapt, and produce a product for the consumer market', 'http://localhost:8081/downloadFile/contruction.svg', 15),
(199, 'Tapes, Adhesives & Sealants', 'It is this science that is employed by production companies in order to develop, adapt, and produce a product for the consumer market', 'http://localhost:8081/downloadFile/contruction.svg', 15),
(200, 'Test, Measure & Inspect', 'It is this science that is employed by production companies in order to develop, adapt, and produce a product for the consumer market', 'http://localhost:8081/downloadFile/contruction.svg', 15),
(201, 'Carry-ons', 'suitcases or other bags in which to pack personal belongings for travelling.', 'http://localhost:8081/downloadFile/suitcase.svg', 16),
(202, 'Backpacks', 'suitcases or other bags in which to pack personal belongings for travelling.', 'http://localhost:8081/downloadFile/suitcase.svg', 16),
(203, 'Garment bags', 'suitcases or other bags in which to pack personal belongings for travelling.', 'http://localhost:8081/downloadFile/suitcase.svg', 16),
(204, 'Travel Totes', 'suitcases or other bags in which to pack personal belongings for travelling.', 'http://localhost:8081/downloadFile/suitcase.svg', 16),
(205, 'Luggage Sets', 'suitcases or other bags in which to pack personal belongings for travelling.', 'http://localhost:8081/downloadFile/suitcase.svg', 16),
(206, 'Laptop Bags', 'suitcases or other bags in which to pack personal belongings for travelling.', 'http://localhost:8081/downloadFile/suitcase.svg', 16),
(207, 'Suitcases', 'suitcases or other bags in which to pack personal belongings for travelling.', 'http://localhost:8081/downloadFile/suitcase.svg', 16),
(208, 'Kids Luggage', 'suitcases or other bags in which to pack personal belongings for travelling.', 'http://localhost:8081/downloadFile/suitcase.svg', 16),
(209, 'Messenger Bags', 'suitcases or other bags in which to pack personal belongings for travelling.', 'http://localhost:8081/downloadFile/suitcase.svg', 16),
(210, 'Umbrellas', 'suitcases or other bags in which to pack personal belongings for travelling.', 'http://localhost:8081/downloadFile/suitcase.svg', 16),
(211, 'Duffles', 'suitcases or other bags in which to pack personal belongings for travelling.', 'http://localhost:8081/downloadFile/suitcase.svg', 16),
(212, 'Travel Accessories', 'suitcases or other bags in which to pack personal belongings for travelling.', 'http://localhost:8081/downloadFile/suitcase.svg', 16),
(213, 'Movies', 'Television film. A television film is a feature-length motion picture that is produced and originally distributed by or to a television network, in contrast to theatrical films made explicitly for initial showing in movie theaters', 'http://localhost:8081/downloadFile/movies.svg', 17),
(214, 'TV Shows', 'Television film. A television film is a feature-length motion picture that is produced and originally distributed by or to a television network, in contrast to theatrical films made explicitly for initial showing in movie theaters', 'http://localhost:8081/downloadFile/movies.svg', 17),
(215, 'Blu-ray', 'Television film. A television film is a feature-length motion picture that is produced and originally distributed by or to a television network, in contrast to theatrical films made explicitly for initial showing in movie theaters', 'http://localhost:8081/downloadFile/movies.svg', 17),
(216, '4K Ultra HD', 'Television film. A television film is a feature-length motion picture that is produced and originally distributed by or to a television network, in contrast to theatrical films made explicitly for initial showing in movie theaters', 'http://localhost:8081/downloadFile/movies.svg', 17),
(217, 'Best Sellers', 'Television film. A television film is a feature-length motion picture that is produced and originally distributed by or to a television network, in contrast to theatrical films made explicitly for initial showing in movie theaters', 'http://localhost:8081/downloadFile/movies.svg', 17),
(218, 'Today\'s Deals', 'Television film. A television film is a feature-length motion picture that is produced and originally distributed by or to a television network, in contrast to theatrical films made explicitly for initial showing in movie theaters', 'http://localhost:8081/downloadFile/movies.svg', 17),
(219, 'New Releases', 'Television film. A television film is a feature-length motion picture that is produced and originally distributed by or to a television network, in contrast to theatrical films made explicitly for initial showing in movie theaters', 'http://localhost:8081/downloadFile/movies.svg', 17),
(220, 'Pre-orders', 'Television film. A television film is a feature-length motion picture that is produced and originally distributed by or to a television network, in contrast to theatrical films made explicitly for initial showing in movie theaters', 'http://localhost:8081/downloadFile/movies.svg', 17),
(221, 'Kids & Family', 'Television film. A television film is a feature-length motion picture that is produced and originally distributed by or to a television network, in contrast to theatrical films made explicitly for initial showing in movie theaters', 'http://localhost:8081/downloadFile/movies.svg', 17),
(222, 'Prime Video', 'Television film. A television film is a feature-length motion picture that is produced and originally distributed by or to a television network, in contrast to theatrical films made explicitly for initial showing in movie theaters', 'http://localhost:8081/downloadFile/movies.svg', 17),
(223, 'Dogs', 'Retail store services for the sale of pet food, pet supplies, pet accessories, foodstuffs for animals, animal requisites. tmClass.\nPeople also ask', 'http://localhost:8081/downloadFile/pet-supplies.svg', 18),
(224, 'Cats', 'Retail store services for the sale of pet food, pet supplies, pet accessories, foodstuffs for animals, animal requisites. tmClass.\nPeople also ask', 'http://localhost:8081/downloadFile/pet-supplies.svg', 18),
(225, 'Fish & Aquatic Pets', 'Retail store services for the sale of pet food, pet supplies, pet accessories, foodstuffs for animals, animal requisites. tmClass.\nPeople also ask', 'http://localhost:8081/downloadFile/pet-supplies.svg', 18),
(226, 'Birds', 'Retail store services for the sale of pet food, pet supplies, pet accessories, foodstuffs for animals, animal requisites. tmClass.\nPeople also ask', 'http://localhost:8081/downloadFile/pet-supplies.svg', 18),
(227, 'Horses', 'Retail store services for the sale of pet food, pet supplies, pet accessories, foodstuffs for animals, animal requisites. tmClass.\nPeople also ask', 'http://localhost:8081/downloadFile/pet-supplies.svg', 18),
(228, 'Reptiles & Amphibians', 'Retail store services for the sale of pet food, pet supplies, pet accessories, foodstuffs for animals, animal requisites. tmClass.\nPeople also ask', 'http://localhost:8081/downloadFile/pet-supplies.svg', 18),
(229, 'Small Animals', 'Retail store services for the sale of pet food, pet supplies, pet accessories, foodstuffs for animals, animal requisites. tmClass.\nPeople also ask', 'http://localhost:8081/downloadFile/pet-supplies.svg', 18),
(230, 'Accounting & Finance', 'Software is the programs and routines for a computer or the program material for an electronic device which make it run. An example of software is Excel or Windows or iTunes', 'http://localhost:8081/downloadFile/software.svg', 19);
INSERT INTO `category` (`id`, `name`, `description`, `url`, `idup`) VALUES
(231, 'Antivirus & Security', 'Software is the programs and routines for a computer or the program material for an electronic device which make it run. An example of software is Excel or Windows or iTunes', 'http://localhost:8081/downloadFile/software.svg', 19),
(232, 'Business & Office', 'Software is the programs and routines for a computer or the program material for an electronic device which make it run. An example of software is Excel or Windows or iTunes', 'http://localhost:8081/downloadFile/software.svg', 19),
(233, 'Children\'s', 'Software is the programs and routines for a computer or the program material for an electronic device which make it run. An example of software is Excel or Windows or iTunes', 'http://localhost:8081/downloadFile/software.svg', 19),
(234, 'Design & Illustration', 'Software is the programs and routines for a computer or the program material for an electronic device which make it run. An example of software is Excel or Windows or iTunes', 'http://localhost:8081/downloadFile/software.svg', 19),
(235, 'Digital Software', 'Software is the programs and routines for a computer or the program material for an electronic device which make it run. An example of software is Excel or Windows or iTunes', 'http://localhost:8081/downloadFile/software.svg', 19),
(236, 'Education & Reference', 'Software is the programs and routines for a computer or the program material for an electronic device which make it run. An example of software is Excel or Windows or iTunes', 'http://localhost:8081/downloadFile/software.svg', 19),
(237, 'Games', 'Software is the programs and routines for a computer or the program material for an electronic device which make it run. An example of software is Excel or Windows or iTunes', 'http://localhost:8081/downloadFile/software.svg', 19),
(238, 'Lifestyle & Hobbies', 'Software is the programs and routines for a computer or the program material for an electronic device which make it run. An example of software is Excel or Windows or iTunes', 'http://localhost:8081/downloadFile/software.svg', 19),
(239, 'Networking & Servers', 'Software is the programs and routines for a computer or the program material for an electronic device which make it run. An example of software is Excel or Windows or iTunes', 'http://localhost:8081/downloadFile/software.svg', 19),
(240, 'Music', 'Software is the programs and routines for a computer or the program material for an electronic device which make it run. An example of software is Excel or Windows or iTunes', 'http://localhost:8081/downloadFile/software.svg', 19),
(241, 'Operating Systems', 'Software is the programs and routines for a computer or the program material for an electronic device which make it run. An example of software is Excel or Windows or iTunes', 'http://localhost:8081/downloadFile/software.svg', 19),
(242, 'Photography & Finance', 'Software is the programs and routines for a computer or the program material for an electronic device which make it run. An example of software is Excel or Windows or iTunes', 'http://localhost:8081/downloadFile/software.svg', 19),
(243, 'Programming & Web Development', 'Software is the programs and routines for a computer or the program material for an electronic device which make it run. An example of software is Excel or Windows or iTunes', 'http://localhost:8081/downloadFile/software.svg', 19),
(244, 'Tax Preparation', 'Software is the programs and routines for a computer or the program material for an electronic device which make it run. An example of software is Excel or Windows or iTunes', 'http://localhost:8081/downloadFile/software.svg', 19),
(245, 'Utilities', 'Software is the programs and routines for a computer or the program material for an electronic device which make it run. An example of software is Excel or Windows or iTunes', 'http://localhost:8081/downloadFile/software.svg', 19),
(246, 'Video', 'Software is the programs and routines for a computer or the program material for an electronic device which make it run. An example of software is Excel or Windows or iTunes', 'http://localhost:8081/downloadFile/software.svg', 19),
(247, 'Sports & Outdoor', 'a sport that is played outdoors. field sport. hunting, hunt - the pursuit and killing or capture of wild animals regarded as a sport. fishing, sportfishing - the act of someone who fishes as a diversion. athletics, sport - an active diversion requiring physical exertion and competition', 'http://localhost:8081/downloadFile/sport.svg', 20),
(248, 'Outdoor Recreation', 'a sport that is played outdoors. field sport. hunting, hunt - the pursuit and killing or capture of wild animals regarded as a sport. fishing, sportfishing - the act of someone who fishes as a diversion. athletics, sport - an active diversion requiring physical exertion and competition', 'http://localhost:8081/downloadFile/sport.svg', 20),
(249, 'Sports & Fitness', 'a sport that is played outdoors. field sport. hunting, hunt - the pursuit and killing or capture of wild animals regarded as a sport. fishing, sportfishing - the act of someone who fishes as a diversion. athletics, sport - an active diversion requiring physical exertion and competition', 'http://localhost:8081/downloadFile/sport.svg', 20),
(250, 'Fan Shop', 'a sport that is played outdoors. field sport. hunting, hunt - the pursuit and killing or capture of wild animals regarded as a sport. fishing, sportfishing - the act of someone who fishes as a diversion. athletics, sport - an active diversion requiring physical exertion and competition', 'http://localhost:8081/downloadFile/sport.svg', 20),
(251, 'Tools & Home Improvement', 'Home improvement can consist of projects that upgrade an existing home interior (such as electrical and plumbing), exterior (masonry, concrete, siding, roofing) ...', 'http://localhost:8081/downloadFile/home-repair.svg', 21),
(252, 'Appliances', 'Home improvement can consist of projects that upgrade an existing home interior (such as electrical and plumbing), exterior (masonry, concrete, siding, roofing) ...', 'http://localhost:8081/downloadFile/home-repair.svg', 21),
(253, 'Building Supplies', 'Home improvement can consist of projects that upgrade an existing home interior (such as electrical and plumbing), exterior (masonry, concrete, siding, roofing) ...', 'http://localhost:8081/downloadFile/home-repair.svg', 21),
(254, 'Electrical', 'Home improvement can consist of projects that upgrade an existing home interior (such as electrical and plumbing), exterior (masonry, concrete, siding, roofing) ...', 'http://localhost:8081/downloadFile/home-repair.svg', 21),
(255, 'Hardware', 'Home improvement can consist of projects that upgrade an existing home interior (such as electrical and plumbing), exterior (masonry, concrete, siding, roofing) ...', 'http://localhost:8081/downloadFile/home-repair.svg', 21),
(256, 'Light Bulbs', 'Home improvement can consist of projects that upgrade an existing home interior (such as electrical and plumbing), exterior (masonry, concrete, siding, roofing) ...', 'http://localhost:8081/downloadFile/home-repair.svg', 21),
(257, 'Kitchen & Bath Fixtures', 'Home improvement can consist of projects that upgrade an existing home interior (such as electrical and plumbing), exterior (masonry, concrete, siding, roofing) ...', 'http://localhost:8081/downloadFile/home-repair.svg', 21),
(258, 'Lighting & Ceiling Fans', 'Home improvement can consist of projects that upgrade an existing home interior (such as electrical and plumbing), exterior (masonry, concrete, siding, roofing) ...', 'http://localhost:8081/downloadFile/home-repair.svg', 21),
(259, 'Measuring & Layout Tools', 'Home improvement can consist of projects that upgrade an existing home interior (such as electrical and plumbing), exterior (masonry, concrete, siding, roofing) ...', 'http://localhost:8081/downloadFile/home-repair.svg', 21),
(260, 'Painting Supplies & Wall Treatments', 'Home improvement can consist of projects that upgrade an existing home interior (such as electrical and plumbing), exterior (masonry, concrete, siding, roofing) ...', 'http://localhost:8081/downloadFile/home-repair.svg', 21),
(261, 'Power & Hand Tools', 'Home improvement can consist of projects that upgrade an existing home interior (such as electrical and plumbing), exterior (masonry, concrete, siding, roofing) ...', 'http://localhost:8081/downloadFile/home-repair.svg', 21),
(262, 'Rough Plumbing', 'Home improvement can consist of projects that upgrade an existing home interior (such as electrical and plumbing), exterior (masonry, concrete, siding, roofing) ...', 'http://localhost:8081/downloadFile/home-repair.svg', 21),
(263, 'Safety & Security', 'Home improvement can consist of projects that upgrade an existing home interior (such as electrical and plumbing), exterior (masonry, concrete, siding, roofing) ...', 'http://localhost:8081/downloadFile/home-repair.svg', 21),
(264, 'Storage & Home Organization', 'Home improvement can consist of projects that upgrade an existing home interior (such as electrical and plumbing), exterior (masonry, concrete, siding, roofing) ...', 'http://localhost:8081/downloadFile/home-repair.svg', 21),
(265, 'Welding & Soldering', 'Home improvement can consist of projects that upgrade an existing home interior (such as electrical and plumbing), exterior (masonry, concrete, siding, roofing) ...', 'http://localhost:8081/downloadFile/home-repair.svg', 21),
(266, 'Action Figures & Statues', 'Toys and games are the tools of play, and play is a large part of social life. ... Adults gave them to children during festival times, and the young made toys for themselves in moments of freedom from control or work out of gourds, bits of wood, or animal parts.', 'http://localhost:8081/downloadFile/puzzle.svg', 22),
(267, 'Arts & Crafts', 'Toys and games are the tools of play, and play is a large part of social life. ... Adults gave them to children during festival times, and the young made toys for themselves in moments of freedom from control or work out of gourds, bits of wood, or animal parts.', 'http://localhost:8081/downloadFile/puzzle.svg', 22),
(268, 'Building Toys', 'Toys and games are the tools of play, and play is a large part of social life. ... Adults gave them to children during festival times, and the young made toys for themselves in moments of freedom from control or work out of gourds, bits of wood, or animal parts.', 'http://localhost:8081/downloadFile/puzzle.svg', 22),
(269, 'Baby & Toddler Toys', 'Toys and games are the tools of play, and play is a large part of social life. ... Adults gave them to children during festival times, and the young made toys for themselves in moments of freedom from control or work out of gourds, bits of wood, or animal parts.', 'http://localhost:8081/downloadFile/puzzle.svg', 22),
(270, 'Dolls & Accessories', 'Toys and games are the tools of play, and play is a large part of social life. ... Adults gave them to children during festival times, and the young made toys for themselves in moments of freedom from control or work out of gourds, bits of wood, or animal parts.', 'http://localhost:8081/downloadFile/puzzle.svg', 22),
(271, 'Dress Up & Pretend Play', 'Toys and games are the tools of play, and play is a large part of social life. ... Adults gave them to children during festival times, and the young made toys for themselves in moments of freedom from control or work out of gourds, bits of wood, or animal parts.', 'http://localhost:8081/downloadFile/puzzle.svg', 22),
(272, 'Toys & Games', 'Toys and games are the tools of play, and play is a large part of social life. ... Adults gave them to children during festival times, and the young made toys for themselves in moments of freedom from control or work out of gourds, bits of wood, or animal parts.', 'http://localhost:8081/downloadFile/puzzle.svg', 22),
(273, 'Grown-Up Toys', 'Toys and games are the tools of play, and play is a large part of social life. ... Adults gave them to children during festival times, and the young made toys for themselves in moments of freedom from control or work out of gourds, bits of wood, or animal parts.', 'http://localhost:8081/downloadFile/puzzle.svg', 22),
(274, 'Kids\' Electronics', 'Toys and games are the tools of play, and play is a large part of social life. ... Adults gave them to children during festival times, and the young made toys for themselves in moments of freedom from control or work out of gourds, bits of wood, or animal parts.', 'http://localhost:8081/downloadFile/puzzle.svg', 22),
(275, 'Hobbies', 'Toys and games are the tools of play, and play is a large part of social life. ... Adults gave them to children during festival times, and the young made toys for themselves in moments of freedom from control or work out of gourds, bits of wood, or animal parts.', 'http://localhost:8081/downloadFile/puzzle.svg', 22),
(276, 'Kids\' Furniture, Décor & Storage', 'Toys and games are the tools of play, and play is a large part of social life. ... Adults gave them to children during festival times, and the young made toys for themselves in moments of freedom from control or work out of gourds, bits of wood, or animal parts.', 'http://localhost:8081/downloadFile/puzzle.svg', 22),
(277, 'Learning & Education', 'Toys and games are the tools of play, and play is a large part of social life. ... Adults gave them to children during festival times, and the young made toys for themselves in moments of freedom from control or work out of gourds, bits of wood, or animal parts.', 'http://localhost:8081/downloadFile/puzzle.svg', 22),
(278, 'Novelty & Gag Toys', 'Toys and games are the tools of play, and play is a large part of social life. ... Adults gave them to children during festival times, and the young made toys for themselves in moments of freedom from control or work out of gourds, bits of wood, or animal parts.', 'http://localhost:8081/downloadFile/puzzle.svg', 22),
(279, 'Party Supplies', 'Toys and games are the tools of play, and play is a large part of social life. ... Adults gave them to children during festival times, and the young made toys for themselves in moments of freedom from control or work out of gourds, bits of wood, or animal parts.', 'http://localhost:8081/downloadFile/puzzle.svg', 22),
(280, 'Puppets', 'Toys and games are the tools of play, and play is a large part of social life. ... Adults gave them to children during festival times, and the young made toys for themselves in moments of freedom from control or work out of gourds, bits of wood, or animal parts.', 'http://localhost:8081/downloadFile/puzzle.svg', 22),
(281, 'Puzzles', 'Toys and games are the tools of play, and play is a large part of social life. ... Adults gave them to children during festival times, and the young made toys for themselves in moments of freedom from control or work out of gourds, bits of wood, or animal parts.', 'http://localhost:8081/downloadFile/puzzle.svg', 22),
(282, 'Sports & Outdoor Play', 'Toys and games are the tools of play, and play is a large part of social life. ... Adults gave them to children during festival times, and the young made toys for themselves in moments of freedom from control or work out of gourds, bits of wood, or animal parts.', 'http://localhost:8081/downloadFile/puzzle.svg', 22),
(283, 'Stuffed Animals & Plush Toys', 'Toys and games are the tools of play, and play is a large part of social life. ... Adults gave them to children during festival times, and the young made toys for themselves in moments of freedom from control or work out of gourds, bits of wood, or animal parts.', 'http://localhost:8081/downloadFile/puzzle.svg', 22),
(284, 'Toy Remote Control & Play Vehicles', 'Toys and games are the tools of play, and play is a large part of social life. ... Adults gave them to children during festival times, and the young made toys for themselves in moments of freedom from control or work out of gourds, bits of wood, or animal parts.', 'http://localhost:8081/downloadFile/puzzle.svg', 22),
(285, 'Tricycles, Scooters & Wagons', 'Toys and games are the tools of play, and play is a large part of social life. ... Adults gave them to children during festival times, and the young made toys for themselves in moments of freedom from control or work out of gourds, bits of wood, or animal parts.', 'http://localhost:8081/downloadFile/puzzle.svg', 22),
(286, 'Video Games', 'Toys and games are the tools of play, and play is a large part of social life. ... Adults gave them to children during festival times, and the young made toys for themselves in moments of freedom from control or work out of gourds, bits of wood, or animal parts.', 'http://localhost:8081/downloadFile/puzzle.svg', 22),
(287, 'Video Games', 'a game played by electronically manipulating images produced by a computer program on a monitor or other display.', 'http://localhost:8081/downloadFile/console.svg', 23),
(288, 'PlayStation 4', 'a game played by electronically manipulating images produced by a computer program on a monitor or other display.', 'http://localhost:8081/downloadFile/console.svg', 23),
(289, 'PlayStation 3', 'a game played by electronically manipulating images produced by a computer program on a monitor or other display.', 'http://localhost:8081/downloadFile/console.svg', 23),
(290, 'Xbox One', 'a game played by electronically manipulating images produced by a computer program on a monitor or other display.', 'http://localhost:8081/downloadFile/console.svg', 23),
(291, 'Xbox 360', 'a game played by electronically manipulating images produced by a computer program on a monitor or other display.', 'http://localhost:8081/downloadFile/console.svg', 23),
(292, 'Nintendo Switch', 'a game played by electronically manipulating images produced by a computer program on a monitor or other display.', 'http://localhost:8081/downloadFile/console.svg', 23),
(293, 'Wii U', 'a game played by electronically manipulating images produced by a computer program on a monitor or other display.', 'http://localhost:8081/downloadFile/console.svg', 23),
(294, 'Wii', 'a game played by electronically manipulating images produced by a computer program on a monitor or other display.', 'http://localhost:8081/downloadFile/console.svg', 23),
(295, 'PC', 'a game played by electronically manipulating images produced by a computer program on a monitor or other display.', 'http://localhost:8081/downloadFile/console.svg', 23),
(296, 'Mac', 'a game played by electronically manipulating images produced by a computer program on a monitor or other display.', 'http://localhost:8081/downloadFile/console.svg', 23),
(297, 'Nintendo 3DS & 2DS', 'a game played by electronically manipulating images produced by a computer program on a monitor or other display.', 'http://localhost:8081/downloadFile/console.svg', 23),
(298, 'Nintendo DS', 'a game played by electronically manipulating images produced by a computer program on a monitor or other display.', 'http://localhost:8081/downloadFile/console.svg', 23),
(299, 'PlayStation Vita', 'a game played by electronically manipulating images produced by a computer program on a monitor or other display.', 'http://localhost:8081/downloadFile/console.svg', 23),
(300, 'Sony PSP', 'a game played by electronically manipulating images produced by a computer program on a monitor or other display.', 'http://localhost:8081/downloadFile/console.svg', 23),
(301, 'Retro Gaming & Microconsoles', 'a game played by electronically manipulating images produced by a computer program on a monitor or other display.', 'http://localhost:8081/downloadFile/console.svg', 23),
(302, 'Accessories', 'a game played by electronically manipulating images produced by a computer program on a monitor or other display.', 'http://localhost:8081/downloadFile/console.svg', 23),
(303, 'Digital Games', 'a game played by electronically manipulating images produced by a computer program on a monitor or other display.', 'http://localhost:8081/downloadFile/console.svg', 23),
(304, 'Kids & Family', 'a game played by electronically manipulating images produced by a computer program on a monitor or other display.', 'http://localhost:8081/downloadFile/console.svg', 23);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `dateofbirth`, `firstname`, `gender`, `lastname`, `cellphone`, `user_id`, `url`) VALUES
(24, '2021-07-27', 'youssef', 'MALE', 'Ttfifha', '20245989', 37, 'http://localhost:8081/downloadFile/image_picker4915816687608941235.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `dateofbirth`, `firstname`, `gender`, `lastname`, `cellphone`, `user_id`) VALUES
(4, '2000-02-02', 'admin', 'MALE', 'admin', '71475852', 35);

-- --------------------------------------------------------

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
CREATE TABLE IF NOT EXISTS `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hibernate_sequence`
--

INSERT INTO `hibernate_sequence` (`next_val`) VALUES
(59);

-- --------------------------------------------------------

--
-- Table structure for table `mouvement`
--

DROP TABLE IF EXISTS `mouvement`;
CREATE TABLE IF NOT EXISTS `mouvement` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `typemouvement` varchar(10) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `product` bigint(20) DEFAULT NULL,
  `mouvementdate` datetime DEFAULT NULL,
  `unitprice` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKk0fgvyrd4gg1eugabyqg2cbxd` (`product`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mouvement`
--

INSERT INTO `mouvement` (`id`, `typemouvement`, `quantity`, `product`, `mouvementdate`, `unitprice`) VALUES
(1, 'IN', 10, 1, '2021-07-25 09:15:45', NULL),
(2, 'IN', 10, 2, '2021-07-25 09:15:45', NULL),
(3, 'IN', 10, 3, '2021-07-26 09:15:45', NULL),
(4, 'IN', 10, 4, '2021-07-26 09:15:45', NULL),
(5, 'IN', 10, 5, '2021-07-26 09:15:45', NULL),
(6, 'OUT', 9, 1, '2021-07-27 09:10:45', NULL),
(7, 'OUT', 8, 1, '2021-07-27 09:15:45', NULL),
(8, 'OUT', 9, 2, '2021-07-27 09:17:07', NULL),
(9, 'OUT', 8, 2, '2021-07-27 09:17:23', NULL),
(10, 'OUT', 6, 1, '2021-07-27 09:17:36', NULL),
(11, 'OUT', 4, 1, '2021-07-27 09:25:44', NULL),
(12, 'OUT', 7, 2, '2021-07-27 09:25:44', NULL),
(13, 'OUT', 9, 3, '2021-07-27 09:25:44', NULL),
(14, 'OUT', 4, 1, '2021-07-27 15:16:40', NULL),
(15, 'OUT', 6, 2, '2021-07-27 15:16:40', NULL),
(16, 'OUT', 8, 3, '2021-07-27 15:16:40', NULL),
(17, 'OUT', 9, 5, '2021-07-27 15:16:40', NULL),
(18, 'OUT', 2, 1, '2021-07-27 16:47:09', NULL),
(19, 'OUT', 5, 2, '2021-07-27 16:47:09', NULL),
(20, 'IN', 10, 7, '2021-07-27 17:52:53', NULL),
(21, 'OUT', 6, 5, '2021-07-27 19:36:13', NULL),
(22, 'OUT', 9, 7, '2021-07-27 19:36:13', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `orderitems`
--

DROP TABLE IF EXISTS `orderitems`;
CREATE TABLE IF NOT EXISTS `orderitems` (
  `id` bigint(20) NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKm3mp87f5ygbbfuqfdhc09y9a` (`order_id`),
  KEY `FKatri80p9fodn2lpjxxpcv03hm` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orderitems`
--

INSERT INTO `orderitems` (`id`, `created_date`, `quantity`, `order_id`, `product_id`) VALUES
(55, '2021-07-27 16:47:09', 2, 14, 1),
(56, '2021-07-27 16:47:09', 1, 14, 2),
(57, '2021-07-27 19:36:13', 3, 15, 5),
(58, '2021-07-27 19:36:13', 1, 15, 7);

-- --------------------------------------------------------

--
-- Table structure for table `orderitemsupplier`
--

DROP TABLE IF EXISTS `orderitemsupplier`;
CREATE TABLE IF NOT EXISTS `orderitemsupplier` (
  `id` bigint(20) NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `order_supplier_id` bigint(20) DEFAULT NULL,
  `productsupplier_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKhaphc0cy1nm6odx07lug8rvln` (`order_supplier_id`),
  KEY `FKqwtap8md4g0nqq814hhilitac` (`productsupplier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_date` datetime DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKel9kyl84ego2otj2accfd8mr7` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `created_date`, `status`, `user_id`) VALUES
(14, '2021-07-27 16:47:09', 'PENDING', 37),
(15, '2021-07-27 19:36:13', 'PENDING', 37);

-- --------------------------------------------------------

--
-- Table structure for table `ordersupplier`
--

DROP TABLE IF EXISTS `ordersupplier`;
CREATE TABLE IF NOT EXISTS `ordersupplier` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_date` datetime DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `supplier_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKbd9quld26gnavvivvij6jctme` (`supplier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `organization`
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
-- Dumping data for table `organization`
--

INSERT INTO `organization` (`id`, `name`, `fiscalcode`, `patentcode`, `legalstatus`, `category`, `finality`, `size`, `sector`, `scope`) VALUES
(1, '3S2I', 'RSSMRA74D22A0001Q', 'b82y5', 'Company', 'Enterprise', 'Economical', 'Large', 'Ntics', 'International Activity');

-- --------------------------------------------------------

--
-- Table structure for table `product`
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `brand`, `code`, `description`, `isbn`, `name`, `sku`, `tmpcode`, `category`) VALUES
(1, 'TOZO ', '12AW', 'TOZO T6 True Wireless Earbuds Bluetooth Headphones Touch Control with Wireless Charging Case IPX8 Waterproof Stereo Earphones in-Ear Built-in Mic Headset Premium Deep Bass for Sport Black', 1111004, 'TOZO T6 True Wireless Earbuds', 1110001, 'T12AW', 24),
(2, 'SAMSUNG ', '12AW', 'SAMSUNG: EVO Select 128GB MicroSDXC UHS-I U3 100MB/s Full HD & 4K UHD Memory Card with Adapter (MB-ME128HA)', 1111004, 'SAMSUNG: EVO', 1110001, 'T12AW', 24),
(3, 'Neewer  ', '12AW', 'Neewer Ring Light Kit:18\'\'/48cm Outer 55W 5500K Dimmable LED Ring Light, Light Stand, Carrying Bag for Camera,Smartphone,YouTube,TikTok,Self-Portrait Shooting, Black, Model:10088612', 1111004, 'Ring Light', 1110001, 'T12AW', 25),
(4, 'iOttie ', '12AW', 'iOttie Easy One Touch 4 Dash & Windshield Universal Car Mount Phone Holder Desk Stand for iPhone, Samsung, Moto, Huawei, Nokia, LG, Smartphones', 1111004, 'iOttie ', 1110001, 'T12AW', 26),
(5, 'Acer ', '12AW', 'Acer Aspire 5 A515-46-R14K Slim Laptop | 15.6 Full HD IPS | AMD Ryzen 3 3350U Quad-Core Mobile Processor | 4GB DDR4 | 128GB NVMe SSD | WiFi 6 | Backlit KB | Amazon Alexa | Windows 10 Home (S mode)', 1111004, 'Acer Aspire 5 ', 1110001, 'T12AW', 43),
(7, 'SAMSUNG  ', '12AW', 'SAMSUNG Galaxy S21 Ultra 5G Factory Unlocked Android Cell Phone 256GB US Version Smartphone Pro-Grade Camera 8K Video 108MP High Res, Phantom Black', 1111104, 'Galaxy S21 ', 11100101, 'T12AW', 27);

-- --------------------------------------------------------

--
-- Table structure for table `productdetails`
--

DROP TABLE IF EXISTS `productdetails`;
CREATE TABLE IF NOT EXISTS `productdetails` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `attribute` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `product` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK4y967p539vfvrt7tn47rlhr2q` (`product`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `productdetails`
--

INSERT INTO `productdetails` (`id`, `attribute`, `value`, `product`) VALUES
(1, 'Color', 'BLACK', 1),
(2, 'Color', 'BLACK', 2),
(3, 'Flash Memory Type', 'Micro SDXC', 2),
(4, 'Secure Digital Association Speed Class', 'Class 10', 2),
(5, 'Memory Storage Capacity', '128 GB', 2),
(6, 'Dimmable ', '18\'\'/48cm Outer 55W 5500K 240 Pieces', 3),
(7, 'Mounting Type', 'Dashboard and Windshield', 4),
(8, 'Special Feature', 'Universal Phone Control', 4),
(9, 'Compatible Phone Models', 'IPhone 12/ 12 mini/ 12 pro/ 12 pro max/ SE/ 11/ 11 Pro/ 11 Pro Max/ XS/ XR/ XS Max/ X/ 8/ 8 Plus/ 7', 4),
(10, 'Model Name', '852306006596', 4),
(11, 'Series', 'A515-46-R14K', 5),
(12, 'Specific Uses For Product', 'Multimedia, Personal, Business', 5),
(13, 'Display Size', '15.6 inches LED', 5),
(14, 'Operating System', 'Windows 10 S', 5),
(24, 'Model Name', 'P3', 7),
(25, 'Wireless Carrier', 'Unlocked', 7),
(26, 'Form Factor', 'Smartphone', 7),
(27, 'Memory Storage Capacity', '256 GB', 7),
(28, 'Operating System', 'Android', 7),
(29, 'Color', 'Phantom Black', 7),
(30, 'Cellular Technology', '5G', 7),
(31, 'Model Year', '2021', 7),
(32, 'Display Size', '6.8 inches AMOLED', 7);

-- --------------------------------------------------------

--
-- Table structure for table `productimage`
--

DROP TABLE IF EXISTS `productimage`;
CREATE TABLE IF NOT EXISTS `productimage` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) DEFAULT NULL,
  `product` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8ut1k90uxasdhv7ek0ifvrktm` (`product`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `productimage`
--

INSERT INTO `productimage` (`id`, `url`, `product`) VALUES
(1, 'http://localhost:8081/downloadFile/61eAIJI+nPL._AC_SL1500_.jpg', 1),
(2, 'http://localhost:8081/downloadFile/71A7SdqzcML._AC_SL1500_.jpg', 1),
(3, 'http://localhost:8081/downloadFile/71G+Ty9p3RL._AC_SL1500_.jpg', 1),
(4, 'http://localhost:8081/downloadFile/71Jg3ZbDDwL._AC_SL1500_.jpg', 1),
(5, 'http://localhost:8081/downloadFile/71rjegReukL._AC_SL1500_.jpg', 1),
(6, 'http://localhost:8081/downloadFile/71rLGE51UAL._AC_SL1500_.jpg', 1),
(7, 'http://localhost:8081/downloadFile/71-S-dtu42L._AC_SL1500_.jpg', 1),
(8, 'http://localhost:8081/downloadFile/71vnkR9pmgL._AC_SL1500_.jpg', 1),
(9, 'http://localhost:8081/downloadFile/7174oO6Np4L._AC_SL1500_.jpg', 1),
(10, 'http://localhost:8081/downloadFile/61PSpNQlsQL._AC_SL1440_.jpg', 2),
(11, 'http://localhost:8081/downloadFile/61Vr+9FI8PL._AC_SL1440_.jpg', 2),
(12, 'http://localhost:8081/downloadFile/81axmUuRHrL._AC_SL1500_.jpg', 2),
(13, 'http://localhost:8081/downloadFile/81bq7PsYrCL._AC_SL1500_.jpg', 2),
(14, 'http://localhost:8081/downloadFile/81WLZZFVOTL._AC_SL1500_.jpg', 2),
(15, 'http://localhost:8081/downloadFile/81yQNkjCPEL._AC_SL1500_.jpg', 2),
(16, 'http://localhost:8081/downloadFile/619wrQwJfML._AC_SL1440_.jpg', 2),
(17, 'http://localhost:8081/downloadFile/6175wb+NlSL._AC_SL1440_.jpg', 2),
(18, 'http://localhost:8081/downloadFile/71+JKKAnfoL._AC_SL1500_.jpg', 3),
(19, 'http://localhost:8081/downloadFile/71br3XRdErL._AC_SL1500_.jpg', 3),
(20, 'http://localhost:8081/downloadFile/71Cc5uJ7f+L._AC_SL1500_.jpg', 3),
(21, 'http://localhost:8081/downloadFile/71r+O7WmJoL._AC_SL1500_.jpg', 3),
(22, 'http://localhost:8081/downloadFile/71WAQs6pNGL._AC_SL1500_.jpg', 3),
(23, 'http://localhost:8081/downloadFile/71q30IQXKiL._AC_SL1500_.jpg', 4),
(24, 'http://localhost:8081/downloadFile/71vo7i41SlL._AC_SL1500_.jpg', 4),
(25, 'http://localhost:8081/downloadFile/81YqefIFZDL._AC_SL1500_.jpg', 4),
(26, 'http://localhost:8081/downloadFile/718NVofDrCL._AC_SL1500_.jpg', 4),
(27, 'http://localhost:8081/downloadFile/51b2xaZY4TL._AC_SL1500_.jpg', 5),
(28, 'http://localhost:8081/downloadFile/71AmKW4yuMS._AC_SL1500_.jpg', 5),
(29, 'http://localhost:8081/downloadFile/71CKs9n1d7S._AC_SL1500_.jpg', 5),
(30, 'http://localhost:8081/downloadFile/71CYU9UGgaS._AC_SL1500_.jpg', 5),
(31, 'http://localhost:8081/downloadFile/71dxg6IDASS._AC_SL1500_.jpg', 5),
(32, 'http://localhost:8081/downloadFile/71esri4NxrL._AC_SL1500_.jpg', 5),
(33, 'http://localhost:8081/downloadFile/71k95iZEk5S._AC_SL1500_.jpg', 5),
(34, 'http://localhost:8081/downloadFile/71mGg-paOdL._AC_SL1500_.jpg', 5),
(35, 'http://localhost:8081/downloadFile/71wE-2pa1TS._AC_SL1500_.jpg', 5),
(36, 'http://localhost:8081/downloadFile/71YVpcbSAlS._AC_SL1500_.jpg', 5),
(37, 'http://localhost:8081/downloadFile/71ZZkFclRhS._AC_SL1500_.jpg', 5),
(38, 'http://localhost:8081/downloadFile/81hPA1cxiTS._AC_SL1500_.jpg', 5),
(39, 'http://localhost:8081/downloadFile/615S89u-wUL._AC_SL1464_.jpg', 5),
(40, 'http://localhost:8081/downloadFile/714+yuXQFmS._AC_SL1500_.jpg', 5),
(41, 'http://localhost:8081/downloadFile/719k37ONwoL._AC_SL1500_.jpg', 5),
(42, 'http://localhost:8081/downloadFile/61L1wmWGM7L._AC_SL1500_.jpg', 7),
(43, 'http://localhost:8081/downloadFile/61O45C5qASL._AC_SL1000_.jpg', 7),
(44, 'http://localhost:8081/downloadFile/61phaJPkGTL._AC_SL1500_.jpg', 7),
(45, 'http://localhost:8081/downloadFile/61vhR6MFaeL._AC_SL1500_.jpg', 7),
(46, 'http://localhost:8081/downloadFile/91BG98VgvCL._AC_SL1500_.jpg', 7),
(47, 'http://localhost:8081/downloadFile/91umLqj5x6L._AC_SL1500_.jpg', 7),
(48, 'http://localhost:8081/downloadFile/611gGEftfGL._AC_SL1500_.jpg', 7);

-- --------------------------------------------------------

--
-- Table structure for table `productinformation`
--

DROP TABLE IF EXISTS `productinformation`;
CREATE TABLE IF NOT EXISTS `productinformation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `max` int(11) DEFAULT NULL,
  `min` int(11) DEFAULT NULL,
  `security` int(11) DEFAULT NULL,
  `threshold` int(11) DEFAULT NULL,
  `product` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKqiugp8n149cegb6a8167jcc45` (`product`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `productinformation`
--

INSERT INTO `productinformation` (`id`, `max`, `min`, `security`, `threshold`, `product`) VALUES
(1, 20, 5, 6, 6, 1),
(2, 20, 5, 6, 6, 2),
(3, 20, 5, 6, 6, 3),
(4, 20, 5, 6, 6, 4),
(5, 20, 5, 6, 6, 5),
(6, 20, 5, 6, 6, 7);

-- --------------------------------------------------------

--
-- Table structure for table `productprice`
--

DROP TABLE IF EXISTS `productprice`;
CREATE TABLE IF NOT EXISTS `productprice` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fc` double NOT NULL,
  `vc` double NOT NULL,
  `product` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK838eqmn63sfta0iiv8v9r300v` (`product`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `productprice`
--

INSERT INTO `productprice` (`id`, `fc`, `vc`, `product`) VALUES
(1, 450, 140, NULL),
(2, 150.7, 140.7, NULL),
(3, 130.4, 145.7, NULL),
(4, 450.4, 100.7, NULL),
(5, 450.4, 100.7, NULL),
(7, 120.4, 100.7, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `productsupplier`
--

DROP TABLE IF EXISTS `productsupplier`;
CREATE TABLE IF NOT EXISTS `productsupplier` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `brand` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `delivery_eta` varchar(255) DEFAULT NULL,
  `margin_rate` double DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `tva` double DEFAULT NULL,
  `unit_price` double DEFAULT NULL,
  `supplier_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKmlfyde02igwr2hpfbcb6mpiny` (`product_id`),
  KEY `FKpag88uc6srnxy6l96x962g3go` (`supplier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`) VALUES
(1, 'ROLE_ADMIN'),
(2, 'ROLE_USER');

-- --------------------------------------------------------

--
-- Table structure for table `sales_order`
--

DROP TABLE IF EXISTS `sales_order`;
CREATE TABLE IF NOT EXISTS `sales_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_date` datetime DEFAULT NULL,
  `purchase_date` datetime DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `supplier_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKlpcoqik2w8lhexpym1ikccjw4` (`supplier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sales_order_item`
--

DROP TABLE IF EXISTS `sales_order_item`;
CREATE TABLE IF NOT EXISTS `sales_order_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `discount_amount` int(11) DEFAULT NULL,
  `quantity_cancelled` int(11) DEFAULT NULL,
  `quantity_invoiced` int(11) DEFAULT NULL,
  `quantity_ordered` int(11) DEFAULT NULL,
  `quantity_refunded` int(11) DEFAULT NULL,
  `quantity_returned` int(11) DEFAULT NULL,
  `quantity_shipped` int(11) DEFAULT NULL,
  `order_supplier_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1gu312j4j3cx797378a8cuppf` (`order_supplier_id`),
  KEY `FK90kp7ijblbswlbs1caw9yap4` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
CREATE TABLE IF NOT EXISTS `supplier` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category` varchar(255) NOT NULL,
  `finality` varchar(255) NOT NULL,
  `fiscalcode` varchar(255) NOT NULL,
  `legalstatus` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `patentcode` varchar(255) NOT NULL,
  `scope` varchar(255) NOT NULL,
  `sector` varchar(255) NOT NULL,
  `size` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`id`, `category`, `finality`, `fiscalcode`, `legalstatus`, `name`, `patentcode`, `scope`, `sector`, `size`) VALUES
(1, 'Enterprise', 'Economical', 'RSSMRA74D22A0001Q', 'Company', 'Toshiba', 'b82y5', 'International Activity', 'Ntics', 'Large'),
(2, 'Enterprise', 'Economical', 'RSSMRA74D22A0001Q', 'Company', 'Samsung', 'b82y5', 'International Activity', 'Economy', 'Small');

-- --------------------------------------------------------

--
-- Table structure for table `unity`
--

DROP TABLE IF EXISTS `unity`;
CREATE TABLE IF NOT EXISTS `unity` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `unity_code` varchar(255) DEFAULT NULL,
  `unity_name` varchar(255) DEFAULT NULL,
  `unity_sub_id` bigint(20) DEFAULT NULL,
  `organization` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKeujskbxogat334yjlm0y36y1b` (`unity_sub_id`),
  KEY `FKsqqmnuei3vhrhpt9dxlpbcge7` (`organization`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `password`, `username`) VALUES
(35, 'admin1.contact@esprit.tn', '$2a$10$zTqMOtfLvQxtPeQ8SnDp5.OQSdwEMGMEtwuyCrGqNBvVu3kN2yqiq', 'admin'),
(37, 'youssef.tfifha@esprit.tn', '$2a$10$KKWHxDhWBHU6JL2XQGfPcO4edR9UeJOpoFod4noic75rEXCY1CNpe', 'youssef');

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
CREATE TABLE IF NOT EXISTS `user_roles` (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FKh8ciramu9cc9q3qcqiv4ue8a6` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_roles`
--

INSERT INTO `user_roles` (`user_id`, `role_id`) VALUES
(35, 1),
(37, 2);

-- --------------------------------------------------------

--
-- Table structure for table `warehouse`
--

DROP TABLE IF EXISTS `warehouse`;
CREATE TABLE IF NOT EXISTS `warehouse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `code` int(11) NOT NULL,
  `addressID` int(11) NOT NULL,
  `ref` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `warehouse_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_address` (`addressID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `FK7jsd9ypl6vxj3t9t62urp8ru4` FOREIGN KEY (`customer`) REFERENCES `customer` (`id`);

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `FKkh5di77cfr01hq05rbcogspec` FOREIGN KEY (`productid`) REFERENCES `product` (`id`);

--
-- Constraints for table `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `FKpgmhfouqt5uv16jdndcust0or` FOREIGN KEY (`idup`) REFERENCES `category` (`id`);

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `FKj8dlm21j202cadsbfkoem0s58` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `FKgph7ais5uxsg9qyv486wu989i` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `mouvement`
--
ALTER TABLE `mouvement`
  ADD CONSTRAINT `FKk0fgvyrd4gg1eugabyqg2cbxd` FOREIGN KEY (`product`) REFERENCES `product` (`id`);

--
-- Constraints for table `orderitems`
--
ALTER TABLE `orderitems`
  ADD CONSTRAINT `FKatri80p9fodn2lpjxxpcv03hm` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `FKm3mp87f5ygbbfuqfdhc09y9a` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);

--
-- Constraints for table `orderitemsupplier`
--
ALTER TABLE `orderitemsupplier`
  ADD CONSTRAINT `FKhaphc0cy1nm6odx07lug8rvln` FOREIGN KEY (`order_supplier_id`) REFERENCES `ordersupplier` (`id`),
  ADD CONSTRAINT `FKqwtap8md4g0nqq814hhilitac` FOREIGN KEY (`productsupplier_id`) REFERENCES `productsupplier` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `FKel9kyl84ego2otj2accfd8mr7` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `ordersupplier`
--
ALTER TABLE `ordersupplier`
  ADD CONSTRAINT `FKbd9quld26gnavvivvij6jctme` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FKqx9wikktsev17ctu0kcpkrafc` FOREIGN KEY (`category`) REFERENCES `category` (`id`);

--
-- Constraints for table `productdetails`
--
ALTER TABLE `productdetails`
  ADD CONSTRAINT `FK4y967p539vfvrt7tn47rlhr2q` FOREIGN KEY (`product`) REFERENCES `product` (`id`);

--
-- Constraints for table `productimage`
--
ALTER TABLE `productimage`
  ADD CONSTRAINT `FK8ut1k90uxasdhv7ek0ifvrktm` FOREIGN KEY (`product`) REFERENCES `product` (`id`);

--
-- Constraints for table `productinformation`
--
ALTER TABLE `productinformation`
  ADD CONSTRAINT `FKqiugp8n149cegb6a8167jcc45` FOREIGN KEY (`product`) REFERENCES `product` (`id`);

--
-- Constraints for table `productprice`
--
ALTER TABLE `productprice`
  ADD CONSTRAINT `FK838eqmn63sfta0iiv8v9r300v` FOREIGN KEY (`product`) REFERENCES `product` (`id`);

--
-- Constraints for table `productsupplier`
--
ALTER TABLE `productsupplier`
  ADD CONSTRAINT `FKmlfyde02igwr2hpfbcb6mpiny` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `FKpag88uc6srnxy6l96x962g3go` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`);

--
-- Constraints for table `sales_order`
--
ALTER TABLE `sales_order`
  ADD CONSTRAINT `FKlpcoqik2w8lhexpym1ikccjw4` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`);

--
-- Constraints for table `sales_order_item`
--
ALTER TABLE `sales_order_item`
  ADD CONSTRAINT `FK1gu312j4j3cx797378a8cuppf` FOREIGN KEY (`order_supplier_id`) REFERENCES `ordersupplier` (`id`),
  ADD CONSTRAINT `FK90kp7ijblbswlbs1caw9yap4` FOREIGN KEY (`product_id`) REFERENCES `productsupplier` (`id`);

--
-- Constraints for table `unity`
--
ALTER TABLE `unity`
  ADD CONSTRAINT `FKeujskbxogat334yjlm0y36y1b` FOREIGN KEY (`unity_sub_id`) REFERENCES `unity` (`id`),
  ADD CONSTRAINT `FKsqqmnuei3vhrhpt9dxlpbcge7` FOREIGN KEY (`organization`) REFERENCES `organization` (`id`);

--
-- Constraints for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `FK55itppkw3i07do3h7qoclqd4k` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FKh8ciramu9cc9q3qcqiv4ue8a6` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
