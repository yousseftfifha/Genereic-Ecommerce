
INSERT INTO `product` (`id`, `name`, `brand`, `description`, `sku`, `code`, `tmpcode`, `isbn`, `category`) VALUES
(3, 'TOZO T6 True Wireless Earbuds', 'TOZO ', 'TOZO T6 True Wireless Earbuds Bluetooth Headphones Touch Control with Wireless Charging Case IPX8 Waterproof Stereo Earphones in-Ear Built-in Mic Headset Premium Deep Bass for Sport Black', 1110001, '12AW', 'T12AW', 1111004, 24),
(4, 'Acer Aspire 5 A515-46-R14K Slim Laptop ', 'Acer ', 'Acer Aspire 5 A515-46-R14K Slim Laptop | 15.6 Full HD IPS | AMD Ryzen 3 3350U Quad-Core Mobile Processor | 4GB DDR4 | 128GB NVMe SSD | WiFi 6 | Backlit KB | Amazon Alexa | Windows 10 Home (S Mode)Powerful Productivity:', 1110201, '12AB', 'T12AC', 1111044, 43),
(14, 'SAMSUNG: EVO', 'SAMSUNG', 'SAMSUNG: EVO Select 128GB MicroSDXC UHS-I U3 100MB/s Full HD & 4K UHD Memory Card with Adapter (MB-ME128HA)', 1110201, '12AB', 'T12AC', 1111044, 25),
(15, 'Smartwatch  ', 'Fitbit ', 'Fitbit Sense Advanced Smartwatch with Tools for Heart Health, Stress Management & Skin Temperature Trends, Carbon/Graphite, One Size (S & L Bands Included)', 1110201, '12AB', 'T12AC', 1111044, 24);



INSERT INTO `productdetails` (`id`, `attribute`, `value`, `product`) VALUES
(1, 'Color', 'BLACK', 3),
(2, 'Form Factor', 'In Ear', 3),
(3, 'BLUETOOTH', 'BLUETOOTH 5. 0', 3),
(4, 'waterproof', 'TRUE', 3),
(5, 'Series', 'A515-46-R14K', 4),
(6, 'Specific Uses For Product', 'Multimedia, Personal, Business', 4),
(7, 'Screen Size', '15.6 Inches', 4),
(8, 'Operating System', 'Windows 10 S', 4),
(9, 'Max Screen Resolution', '1920 x 1080 Pixels', 4),
(10, 'Processor', '?3.5 GHz ryzen_3', 4),
(11, 'RAM', '??4 GB DDR4', 4),
(12, 'Memory Speed', '?128 GB SSD', 4),
(13, 'Color', '?Silver', 4),
(14, 'Computer Memory Type', '??DDR4 SDRAM', 4),
(15, 'Power Source', '???Battery Powered', 4),
(16, 'Batteries', '???1 Lithium Polymer batteries required. (included)', 4),
(20, 'Flash Memory Type	', 'Micro SDXC\n', 14),
(21, 'Hardware Interface	', 'MicroSDXC', 14),
(22, 'Secure Digital Association Speed Class	', 'Class 10\n', 14),
(23, 'Memory Storage Capacity	', '128 GB', 14),
(24, 'Supported Application', 'Weather, Sleep Monitor, Reminders, Voice Assistant, Alexa, Phone, GPS, Heart Rate Monitor', 15),
(25, 'Wireless Communication Standard', 'Bluetooth', 15),
(26, 'Color', 'Carbon/Graphite', 15),
(27, 'Connectivity Technology', 'GPS', 15),
(28, 'Human Interface Input', 'Microphone', 15),
(29, 'Battery Cell Composition', 'Lithium Ion', 15);



INSERT INTO `productimage` (`id`, `url`, `product`) VALUES
(1, 'http://localhost:8081/downloadFile/61eAIJI+nPL._AC_SL1500_.jpg', 3),
(2, 'http://localhost:8081/downloadFile/81RohxdjvFL._AC_SL1500_.jpg', 3),
(3, 'http://localhost:8081/downloadFile/71kgUtLvpaL._AC_SL1500_.jpg', 3),
(4, 'http://localhost:8081/downloadFile/71d-CVN0pAL._AC_SL1500_.jpg', 3),
(5, 'http://localhost:8081/downloadFile/71sPF0TyztL._AC_SL1500_.jpg', 3),
(6, 'http://localhost:8081/downloadFile/719oMqG2UtL._AC_SL1500_.jpg', 3),
(7, 'http://localhost:8081/downloadFile/71gtHnQGfQL._AC_SL1500_.jpg', 3),
(9, 'http://localhost:8081/downloadFile/51b2xaZY4TL._AC_SL1500_.jpg', 4),
(10, 'http://localhost:8081/downloadFile/71AmKW4yuMS._AC_SL1500_.jpg', 4),
(11, 'http://localhost:8081/downloadFile/71CKs9n1d7S._AC_SL1500_.jpg', 4),
(12, 'http://localhost:8081/downloadFile/71CYU9UGgaS._AC_SL1500_.jpg', 4),
(13, 'http://localhost:8081/downloadFile/71dxg6IDASS._AC_SL1500_.jpg', 4),
(14, 'http://localhost:8081/downloadFile/71esri4NxrL._AC_SL1500_.jpg', 4),
(15, 'http://localhost:8081/downloadFile/71k95iZEk5S._AC_SL1500_.jpg', 4),
(16, 'http://localhost:8081/downloadFile/71mGg-paOdL._AC_SL1500_.jpg', 4),
(17, 'http://localhost:8081/downloadFile/71wE-2pa1TS._AC_SL1500_.jpg', 4),
(18, 'http://localhost:8081/downloadFile/71wE-2pa1TS._AC_SL1500_.jpg', 4),
(19, 'http://localhost:8081/downloadFile/71YVpcbSAlS._AC_SL1500_.jpg', 4),
(20, 'http://localhost:8081/downloadFile/71ZZkFclRhS._AC_SL1500_.jpg', 4),
(21, 'http://localhost:8081/downloadFile/81hPA1cxiTS._AC_SL1500_.jpg', 4),
(22, 'http://localhost:8081/downloadFile/714+yuXQFmS._AC_SL1500_.jpg', 4),
(23, 'http://localhost:8081/downloadFile/719k37ONwoL._AC_SL1500_.jpg', 4),
(28, 'http://localhost:8081/downloadFile/61PSpNQlsQL._AC_SL1440_.jpg', 14),
(29, 'http://localhost:8081/downloadFile/61Vr+9FI8PL._AC_SL1440_.jpg', 14),
(30, 'http://localhost:8081/downloadFile/81axmUuRHrL._AC_SL1500_.jpg', 14),
(31, 'http://localhost:8081/downloadFile/81bq7PsYrCL._AC_SL1500_.jpg', 14),
(32, 'http://localhost:8081/downloadFile/81WLZZFVOTL._AC_SL1500_.jpg', 14),
(33, 'http://localhost:8081/downloadFile/81yQNkjCPEL._AC_SL1500_.jpg', 14),
(34, 'http://localhost:8081/downloadFile/619wrQwJfML._AC_SL1440_.jpg', 14),
(35, 'http://localhost:8081/downloadFile/6175wb+NlSL._AC_SL1440_.jpg', 14),
(36, 'http://localhost:8081/downloadFile/71aTj2reqZL._AC_SL1500_.jpg', 15),
(37, 'http://localhost:8081/downloadFile/71cEKQXXpiS._AC_SL1500_.jpg', 15),
(38, 'http://localhost:8081/downloadFile/71EnbumenhL._AC_SL1500_.jpg', 15),
(39, 'http://localhost:8081/downloadFile/71eY97aKRfL._AC_SL1500_.jpg', 15),
(40, 'http://localhost:8081/downloadFile/71v3v1CSo8L._AC_SL1500_.jpg', 15),
(41, 'http://localhost:8081/downloadFile/71wEvOoTCvL._AC_SL1500_.jpg', 15),
(42, 'http://localhost:8081/downloadFile/81RXLDOO3wL._AC_SL1500_.jpg', 15);


INSERT INTO `productinformation` (`id`, `max`, `min`, `security`, `threshold`, `product`) VALUES
(1, 10, 5, 5, 5, 3),
(2, 10, 5, 5, 5, 4),
(3, 10, 5, 5, 5, 14),
(4, 10, 5, 5, 5, 15);
