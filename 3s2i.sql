-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jul 08, 2021 at 07:49 PM
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
  `addressID` int(11) NOT NULL AUTO_INCREMENT,
  `Stsreet` varchar(100) NOT NULL,
  `ZipCode` int(11) NOT NULL,
  `CityID` int(11) NOT NULL,
  PRIMARY KEY (`addressID`),
  KEY `fk_city` (`CityID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `assignement`
--

DROP TABLE IF EXISTS `assignement`;
CREATE TABLE IF NOT EXISTS `assignement` (
  `FunctionID` int(11) NOT NULL,
  `EmployeeID` int(11) NOT NULL,
  `UpdatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`FunctionID`),
  KEY `fkEmployee` (`EmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `CategoryID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Description` text NOT NULL,
  `SubCategoryID` int(11) NOT NULL,
  PRIMARY KEY (`CategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
CREATE TABLE IF NOT EXISTS `city` (
  `CityID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `StateID` int(11) NOT NULL,
  PRIMARY KEY (`CityID`),
  KEY `FK_state` (`StateID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
CREATE TABLE IF NOT EXISTS `country` (
  `CountryID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Flag` varchar(100) NOT NULL,
  `Continent` varchar(100) NOT NULL,
  `ISO` int(11) NOT NULL,
  `Phone` int(11) NOT NULL,
  PRIMARY KEY (`CountryID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE IF NOT EXISTS `customer` (
  `CustomerID` int(11) NOT NULL AUTO_INCREMENT,
  `Username` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `IsVerified` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  PRIMARY KEY (`CustomerID`),
  KEY `fk_user1` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
CREATE TABLE IF NOT EXISTS `employee` (
  `EmployeeID` int(11) NOT NULL AUTO_INCREMENT,
  `Username` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `UserID` int(11) NOT NULL,
  PRIMARY KEY (`EmployeeID`),
  KEY `fk_user3` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `function`
--

DROP TABLE IF EXISTS `function`;
CREATE TABLE IF NOT EXISTS `function` (
  `FunctionID` int(11) NOT NULL AUTO_INCREMENT,
  `Poste` varchar(100) NOT NULL,
  `DateRecrutement` date NOT NULL,
  PRIMARY KEY (`FunctionID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
CREATE TABLE IF NOT EXISTS `invoice` (
  `InvoiceID` int(11) NOT NULL AUTO_INCREMENT,
  `Date` date NOT NULL,
  `orderID` int(11) NOT NULL,
  PRIMARY KEY (`InvoiceID`),
  KEY `fk_order3` (`orderID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mouvement`
--

DROP TABLE IF EXISTS `mouvement`;
CREATE TABLE IF NOT EXISTS `mouvement` (
  `MouvementID` int(11) NOT NULL AUTO_INCREMENT,
  `Quantity` int(11) NOT NULL,
  `Price` int(11) NOT NULL,
  `In` int(11) NOT NULL,
  `Out` int(11) NOT NULL,
  `Transfered` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  PRIMARY KEY (`MouvementID`),
  KEY `fk_Product1` (`ProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
CREATE TABLE IF NOT EXISTS `order` (
  `OrderID` int(11) NOT NULL AUTO_INCREMENT,
  `Dueamount` double NOT NULL,
  `InnoNumber` int(11) NOT NULL,
  `OrderDate` date NOT NULL,
  `Status` varchar(100) NOT NULL,
  PRIMARY KEY (`OrderID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `orderdetails`
--

DROP TABLE IF EXISTS `orderdetails`;
CREATE TABLE IF NOT EXISTS `orderdetails` (
  `OrderDetailID` int(11) NOT NULL AUTO_INCREMENT,
  `Quantity` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `InnoNumber` int(11) NOT NULL,
  `OrderID` int(11) NOT NULL,
  PRIMARY KEY (`OrderDetailID`),
  KEY `fk_users5` (`UserID`),
  KEY `FK_oRDER` (`ProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `organization`
--

DROP TABLE IF EXISTS `organization`;
CREATE TABLE IF NOT EXISTS `organization` (
  `OrganizationID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` int(11) NOT NULL,
  `FiscalCode` int(11) NOT NULL,
  `Patentcode` int(11) NOT NULL,
  `LegalStatus` int(11) NOT NULL,
  `Category` varchar(100) NOT NULL,
  `Finality` varchar(100) NOT NULL,
  `size` varchar(100) NOT NULL,
  `Sector` varchar(100) NOT NULL,
  `Scope` varchar(100) NOT NULL,
  PRIMARY KEY (`OrganizationID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `ProductID` int(11) NOT NULL AUTO_INCREMENT,
  `TMPCode` varchar(100) NOT NULL,
  `code` varchar(100) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Description` text NOT NULL,
  `Brand` varchar(100) NOT NULL,
  `MesureUnit` varchar(100) NOT NULL,
  `Weight` double NOT NULL,
  `Height` double NOT NULL,
  `SKU` int(11) NOT NULL,
  `UPC` int(11) NOT NULL,
  `ISBN` int(11) NOT NULL,
  `IsExpirable` int(11) NOT NULL,
  `IsReparable` int(11) NOT NULL,
  `Texture` varchar(100) NOT NULL,
  `Stock` int(11) NOT NULL,
  `Image` varchar(150) NOT NULL,
  `CategoryID` int(11) NOT NULL,
  PRIMARY KEY (`ProductID`),
  KEY `fk_categorie` (`CategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `productdetails`
--

DROP TABLE IF EXISTS `productdetails`;
CREATE TABLE IF NOT EXISTS `productdetails` (
  `ProductDetailsID` int(11) NOT NULL AUTO_INCREMENT,
  `Max` int(11) NOT NULL,
  `Min` int(11) NOT NULL,
  `Threshold` int(11) NOT NULL,
  `Security` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  PRIMARY KEY (`ProductDetailsID`),
  KEY `fk_Product` (`ProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `productsupplier`
--

DROP TABLE IF EXISTS `productsupplier`;
CREATE TABLE IF NOT EXISTS `productsupplier` (
  `ProductID` int(11) NOT NULL,
  `SupplierID` int(11) NOT NULL,
  PRIMARY KEY (`ProductID`,`SupplierID`),
  KEY `fkS` (`SupplierID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `RoleID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  PRIMARY KEY (`RoleID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `state`
--

DROP TABLE IF EXISTS `state`;
CREATE TABLE IF NOT EXISTS `state` (
  `StateID` int(11) NOT NULL AUTO_INCREMENT,
  `StateCode` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `CountryID` int(11) NOT NULL,
  PRIMARY KEY (`StateID`),
  KEY `FK_country` (`CountryID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
CREATE TABLE IF NOT EXISTS `supplier` (
  `SupplierID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `FiscalCode` varchar(100) NOT NULL,
  `Patentcode` varchar(100) NOT NULL,
  `Cellphone` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `LegalStatus` varchar(100) NOT NULL,
  `Finality` varchar(100) NOT NULL,
  `Size` int(11) NOT NULL,
  `Sector` varchar(100) NOT NULL,
  `Scope` varchar(100) NOT NULL,
  PRIMARY KEY (`SupplierID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `unity`
--

DROP TABLE IF EXISTS `unity`;
CREATE TABLE IF NOT EXISTS `unity` (
  `UnityID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` int(11) NOT NULL,
  `Code` int(11) NOT NULL,
  `UnitySubID` int(11) NOT NULL,
  `OrganizationID` int(11) NOT NULL,
  PRIMARY KEY (`UnityID`),
  KEY `FK_o` (`OrganizationID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `UserID` int(11) NOT NULL AUTO_INCREMENT,
  `Firstname` varchar(100) NOT NULL,
  `Lastname` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Cellphone` int(11) NOT NULL,
  `Dateofbirth` date NOT NULL,
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
CREATE TABLE IF NOT EXISTS `user_role` (
  `UserID` int(11) NOT NULL,
  `RoleID` int(11) NOT NULL,
  PRIMARY KEY (`RoleID`,`UserID`),
  KEY `user` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `warehouse`
--

DROP TABLE IF EXISTS `warehouse`;
CREATE TABLE IF NOT EXISTS `warehouse` (
  `WarehouseID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Code` int(11) NOT NULL,
  `AddressID` int(11) NOT NULL,
  PRIMARY KEY (`WarehouseID`),
  KEY `fk_address` (`AddressID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `warehouse_supplier`
--

DROP TABLE IF EXISTS `warehouse_supplier`;
CREATE TABLE IF NOT EXISTS `warehouse_supplier` (
  `Warehouse_SupplierID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Code` int(11) NOT NULL,
  `AddressID` int(11) NOT NULL,
  PRIMARY KEY (`Warehouse_SupplierID`),
  KEY `FKadd` (`AddressID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `fk_city` FOREIGN KEY (`CityID`) REFERENCES `city` (`CityID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `assignement`
--
ALTER TABLE `assignement`
  ADD CONSTRAINT `fkEmployee` FOREIGN KEY (`EmployeeID`) REFERENCES `employee` (`EmployeeID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fkFunction` FOREIGN KEY (`FunctionID`) REFERENCES `function` (`FunctionID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `city`
--
ALTER TABLE `city`
  ADD CONSTRAINT `FK_state` FOREIGN KEY (`StateID`) REFERENCES `state` (`StateID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `fk_user1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `fk_user3` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `fk_order3` FOREIGN KEY (`orderID`) REFERENCES `order` (`OrderID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `mouvement`
--
ALTER TABLE `mouvement`
  ADD CONSTRAINT `fk_Product1` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD CONSTRAINT `FK_oRDER` FOREIGN KEY (`ProductID`) REFERENCES `order` (`OrderID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fkPr` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_users5` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `fk_categorie` FOREIGN KEY (`CategoryID`) REFERENCES `category` (`CategoryID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `productdetails`
--
ALTER TABLE `productdetails`
  ADD CONSTRAINT `fk_Product` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `productsupplier`
--
ALTER TABLE `productsupplier`
  ADD CONSTRAINT `fkP` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fkS` FOREIGN KEY (`SupplierID`) REFERENCES `supplier` (`SupplierID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `state`
--
ALTER TABLE `state`
  ADD CONSTRAINT `FK_country` FOREIGN KEY (`CountryID`) REFERENCES `country` (`CountryID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `unity`
--
ALTER TABLE `unity`
  ADD CONSTRAINT `FK_o` FOREIGN KEY (`OrganizationID`) REFERENCES `organization` (`OrganizationID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_role`
--
ALTER TABLE `user_role`
  ADD CONSTRAINT `role` FOREIGN KEY (`RoleID`) REFERENCES `role` (`RoleID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `warehouse`
--
ALTER TABLE `warehouse`
  ADD CONSTRAINT `fk_address` FOREIGN KEY (`AddressID`) REFERENCES `address` (`addressID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `warehouse_supplier`
--
ALTER TABLE `warehouse_supplier`
  ADD CONSTRAINT `FKadd` FOREIGN KEY (`AddressID`) REFERENCES `address` (`addressID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
