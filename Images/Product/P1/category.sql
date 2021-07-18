-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jul 18, 2021 at 08:40 PM
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
-- Database: `test3s2i`
--

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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

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
(23, 'Video Games', 'a game played by electronically manipulating images produced by a computer program on a monitor or other display.', 'http://localhost:8081/downloadFile/console.svg', NULL);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `FKpgmhfouqt5uv16jdndcust0or` FOREIGN KEY (`idup`) REFERENCES `category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
