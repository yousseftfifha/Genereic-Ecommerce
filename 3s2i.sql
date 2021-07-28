-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jul 28, 2021 at 04:49 PM
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
CREATE TABLE IF NOT EXISTS `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
