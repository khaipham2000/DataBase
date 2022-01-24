-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: Jan 22, 2022 at 10:43 AM
-- Server version: 8.0.27
-- PHP Version: 7.4.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `CoffeeShop`
--

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

CREATE TABLE `bill` (
  `id` varchar(5) NOT NULL,
  `id_customer` varchar(5) DEFAULT NULL,
  `id_employee` varchar(5) NOT NULL,
  `id_table_service` varchar(5) NOT NULL,
  `bill_date` date NOT NULL,
  `id_discount` varchar(5) DEFAULT NULL,
  `bill_money` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `bill`
--

INSERT INTO `bill` (`id`, `id_customer`, `id_employee`, `id_table_service`, `bill_date`, `id_discount`, `bill_money`) VALUES
('1', '1', '1', '1', '2022-01-11', '1', 580000),
('2', '2', '2', '2', '2022-03-12', '2', 210000),
('3', '3', '3', '3', '2022-02-26', '3', 900000),
('4', '4', '4', '4', '2022-01-25', '4', 610000),
('5', '5', '5', '5', '2022-01-15', '5', 390000);

-- --------------------------------------------------------

--
-- Table structure for table `bonus`
--

CREATE TABLE `bonus` (
  `id` varchar(5) NOT NULL,
  `reason_bonus` text NOT NULL,
  `bonus` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `bonus`
--

INSERT INTO `bonus` (`id`, `reason_bonus`, `bonus`) VALUES
('1', 'Tăng ca', 70000),
('2', 'Nhân viên xuất sắc nhất tháng', 1500000),
('3', 'Làm ngày lễ', 300000);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` varchar(5) NOT NULL,
  `name` text NOT NULL,
  `date_of_birth` date NOT NULL,
  `gender` enum('Male','Female') DEFAULT NULL,
  `mobile` varchar(11) NOT NULL,
  `email` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `name`, `date_of_birth`, `gender`, `mobile`, `email`) VALUES
('1', 'Colver Halksworth', '2001-11-04', 'Male', '2761142330', 'chalksworth0@domainmarket.com'),
('2', 'Carmelina Vaen', '2000-08-03', 'Male', '7221399921', 'cvaen1@theguardian.com'),
('3', 'Hieronymus Bisgrove', '1998-08-30', 'Male', '4526552127', 'hbisgrove2@jalbum.net'),
('4', 'Glenn Meadowcraft', '1996-09-01', 'Female', '8985430963', 'gmeadowcraft3@java.com'),
('5', 'Beverly Kellington', '1998-06-18', 'Male', '1696852013', 'bkellington4@google.com');

-- --------------------------------------------------------

--
-- Table structure for table `detail_bill`
--

CREATE TABLE `detail_bill` (
  `id` varchar(5) NOT NULL,
  `id_bill` varchar(5) NOT NULL,
  `id_item` varchar(5) NOT NULL,
  `amount` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `detail_bill`
--

INSERT INTO `detail_bill` (`id`, `id_bill`, `id_item`, `amount`) VALUES
('1', '1', '1', 5),
('2', '2', '2', 6),
('3', '3', '3', 10),
('4', '4', '4', 15),
('5', '5', '5', 3);

-- --------------------------------------------------------

--
-- Table structure for table `detail_import_ticket`
--

CREATE TABLE `detail_import_ticket` (
  `id` varchar(5) NOT NULL,
  `id_import_ticket` varchar(5) NOT NULL,
  `id_ingredient` varchar(5) NOT NULL,
  `quantity_of_goods` int NOT NULL,
  `money_per_goods` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `detail_import_ticket`
--

INSERT INTO `detail_import_ticket` (`id`, `id_import_ticket`, `id_ingredient`, `quantity_of_goods`, `money_per_goods`) VALUES
('1', '1', '1', 31, 178283),
('2', '2', '2', 34, 153755),
('3', '3', '3', 33, 119806),
('4', '4', '4', 40, 185615),
('5', '5', '5', 81, 188786);

-- --------------------------------------------------------

--
-- Table structure for table `discount`
--

CREATE TABLE `discount` (
  `id` varchar(5) NOT NULL,
  `name` text NOT NULL,
  `discount` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `discount`
--

INSERT INTO `discount` (`id`, `name`, `discount`) VALUES
('1', 'Mừng Tất niên', 0.15),
('2', 'Black Friday', 0.2),
('3', 'Sản phẩm mới', 0.1),
('4', 'Đem theo ly đựng nước', 0.25),
('5', 'Valentine', 0.15);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `id` varchar(5) NOT NULL,
  `name` text NOT NULL,
  `date` date NOT NULL,
  `gender` enum('Male','Female') DEFAULT NULL,
  `address` text NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `position` text NOT NULL,
  `username` text NOT NULL,
  `password` varchar(5) NOT NULL,
  `email` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `name`, `date`, `gender`, `address`, `mobile`, `position`, `username`, `password`, `email`) VALUES
('1', 'Thái', '2000-01-01', 'Male', 'Hà Nội', '01234567899', 'Staff', 'Nhism', '11111', 'thai@gmail.com'),
('2', 'Nguyễn Mạnh Cường', '1989-04-20', 'Male', 'Hà Nội', '02234567899', 'Manager', 'Cuong', '22222', 'cuong@gmail.com'),
('3', 'Phan Bích Hạnh', '2002-11-01', 'Female', 'Hà Nội', '01234567889', 'Staff', 'Diamond', '33333', 'hanh@gmail.com'),
('4', 'Đinh Phước Khoa', '1997-08-21', 'Male', 'Hà Nội', '01234567899', 'Bartender', 'Rambo', '44444', 'bo@gmail.com'),
('5', 'Ngô Mai Thanh', '2003-11-11', 'Female', 'Hà Nội', '01234567899', 'Staff', 'Thanh', '55555', 'thanh@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `import_ticket`
--

CREATE TABLE `import_ticket` (
  `id` varchar(5) NOT NULL,
  `id_employee` varchar(5) NOT NULL,
  `id_supplier` varchar(5) NOT NULL,
  `import_date` date NOT NULL,
  `imported_money` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `import_ticket`
--

INSERT INTO `import_ticket` (`id`, `id_employee`, `id_supplier`, `import_date`, `imported_money`) VALUES
('1', '1', '1', '2022-01-13', 2280500),
('2', '2', '2', '2022-01-08', 2158000),
('3', '3', '3', '2022-01-19', 3262000),
('4', '4', '4', '2022-01-04', 3481000),
('5', '5', '5', '2022-01-05', 1449000);

-- --------------------------------------------------------

--
-- Table structure for table `ingredient`
--

CREATE TABLE `ingredient` (
  `id` varchar(5) NOT NULL,
  `name` text NOT NULL,
  `unit` text NOT NULL,
  `production_date` date NOT NULL,
  `expiration_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `ingredient`
--

INSERT INTO `ingredient` (`id`, `name`, `unit`, `production_date`, `expiration_date`) VALUES
('1', 'Sugar', 'Kilogram', '2021-02-02', '2023-07-01'),
('2', 'Bobabop', 'Package', '2021-09-27', '2022-11-23'),
('3', 'Cake', 'Piece', '2021-01-10', '2022-06-14'),
('4', 'Milk', 'Box', '2021-11-05', '2022-06-04'),
('5', 'Coca', 'Bottle', '2021-05-06', '2023-11-14');

-- --------------------------------------------------------

--
-- Table structure for table `ingredient_type`
--

CREATE TABLE `ingredient_type` (
  `id` varchar(5) NOT NULL,
  `name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `ingredient_type`
--

INSERT INTO `ingredient_type` (`id`, `name`) VALUES
('1', 'Thực phẩm khô'),
('2', 'Thực phẩm tươi'),
('3', 'Thực phẩm đóng hộp'),
('4', 'Thực phẩm chế biến sẵn'),
('5', 'Thực phẩm ăn liền');

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `id` varchar(5) NOT NULL,
  `id_ingredient_type` varchar(5) NOT NULL,
  `name` text NOT NULL,
  `type` enum('Tea','Coffee','Milk Tea','Cake','Snacks') DEFAULT NULL,
  `image` text,
  `price` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`id`, `id_ingredient_type`, `name`, `type`, `image`, `price`) VALUES
('1', '1', 'Trà sữa hoa nhài', 'Milk Tea', NULL, 50000),
('2', '2', 'Bông lan trứng muối', 'Cake', NULL, 35000),
('3', '3', 'Bạc xỉu', 'Coffee', NULL, 45000),
('4', '4', 'Trà hoa cúc', 'Tea', NULL, 35000),
('5', '5', 'Đen đá', 'Coffee', NULL, 30000);

-- --------------------------------------------------------

--
-- Table structure for table `item_ingredient`
--

CREATE TABLE `item_ingredient` (
  `id_item` varchar(5) NOT NULL,
  `id_ingredient` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `item_ingredient`
--

INSERT INTO `item_ingredient` (`id_item`, `id_ingredient`) VALUES
('1', '1'),
('2', '2'),
('3', '3'),
('4', '4'),
('5', '5');

-- --------------------------------------------------------

--
-- Table structure for table `punish`
--

CREATE TABLE `punish` (
  `id` varchar(5) NOT NULL,
  `reason_punish` text NOT NULL,
  `punish` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `punish`
--

INSERT INTO `punish` (`id`, `reason_punish`, `punish`) VALUES
('1', 'Đi làm muộn', 50000),
('2', 'Nghỉ làm không có lý do', 150000),
('3', 'Làm vỡ cốc chén', 100000),
('4', 'Làm hỏng thiết bị quán', 4000000),
('5', 'Không dọn vệ sinh', 150000);

-- --------------------------------------------------------

--
-- Table structure for table `salary`
--

CREATE TABLE `salary` (
  `id` varchar(5) NOT NULL,
  `id_employee` varchar(5) NOT NULL,
  `id_shift` varchar(5) NOT NULL,
  `shift_number` int NOT NULL,
  `salary` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `salary`
--

INSERT INTO `salary` (`id`, `id_employee`, `id_shift`, `shift_number`, `salary`) VALUES
('1', '1', '1', 28, 2800000),
('2', '2', '3', 27, 3240000),
('3', '3', '2', 25, 2500000),
('4', '4', '1', 29, 2900000),
('5', '5', '4', 24, 6000000);

-- --------------------------------------------------------

--
-- Table structure for table `salary_bonus`
--

CREATE TABLE `salary_bonus` (
  `id` varchar(5) NOT NULL,
  `id_salary` varchar(5) NOT NULL,
  `id_bonus` varchar(5) DEFAULT NULL,
  `bonus_number` int DEFAULT NULL,
  `bonus_date` text,
  `total_bonus_money` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `salary_bonus`
--

INSERT INTO `salary_bonus` (`id`, `id_salary`, `id_bonus`, `bonus_number`, `bonus_date`, `total_bonus_money`) VALUES
('1', '1', '1', 3, '2000-01-05, 2000-01-07, 2000-01-10', 210000),
('2', '2', '1', 2, '2000-01-11, 2000-01-15', 140000),
('3', '3', '2', 1, '2021-01-01', 1500000),
('4', '4', '3', 1, '2000-01-01', 200000),
('5', '5', '1', 1, '2000-01-07', 70000);

-- --------------------------------------------------------

--
-- Table structure for table `salary_punish`
--

CREATE TABLE `salary_punish` (
  `id` varchar(5) NOT NULL,
  `id_salary` varchar(5) NOT NULL,
  `id_punish` varchar(5) DEFAULT NULL,
  `punish_number` int DEFAULT NULL,
  `punish_date` text,
  `total_punish_money` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `salary_punish`
--

INSERT INTO `salary_punish` (`id`, `id_salary`, `id_punish`, `punish_number`, `punish_date`, `total_punish_money`) VALUES
('1', '1', '1', 2, '2022-01-15, 2022-01-17', 100000),
('2', '2', '2', 1, '2022-01-10', 150000),
('3', '3', '5', 1, '2022-01-01', 150000),
('4', '4', '3', 2, '2022-01-15, 2022-01-17', 200000),
('5', '5', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `shift`
--

CREATE TABLE `shift` (
  `id` varchar(5) NOT NULL,
  `name` text NOT NULL,
  `start` time NOT NULL,
  `end` time NOT NULL,
  `month` enum('1','2','3','4','5','6','7','8','9','10','11','12') DEFAULT NULL,
  `salary_per_day` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `shift`
--

INSERT INTO `shift` (`id`, `name`, `start`, `end`, `month`, `salary_per_day`) VALUES
('1', 'Morning', '08:00:00', '13:00:00', '1', 100000),
('2', 'Afternoon', '13:00:00', '17:00:00', '1', 100000),
('3', 'Night', '17:00:00', '22:00:00', '1', 120000),
('4', 'Full-time', '08:00:00', '17:00:00', '1', 250000);

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `id` varchar(5) NOT NULL,
  `name` text NOT NULL,
  `CEO` text NOT NULL,
  `address` text NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `email` text NOT NULL,
  `bank_name` text NOT NULL,
  `bank_account_number` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`id`, `name`, `CEO`, `address`, `mobile`, `email`, `bank_name`, `bank_account_number`) VALUES
('1', 'Browsezoom', 'Felike Sheppey', 'Guashe', '5545421778', 'fsheppey0@cdc.gov', 'Stanton Group', '660742492011'),
('2', 'Pixope', 'Nigel Shyram', 'Szlachta', '6875604710', 'nshyram1@list-manage.com', 'Lynch, Carter and Prosacco', '256649104612'),
('3', 'Snaptags', 'Lydia Rippin', 'Lille', '6334810137', 'lrippin2@bloomberg.com', 'Oberbrunner-Effertz', '256649104613'),
('4', 'Topdrive', 'Ashly Pentelow', 'Tembilahan', '5067844383', 'apentelow3@usnews.com', 'Lowe Inc', '256649104622'),
('5', 'Gigabox', 'Anett Rohlfing', 'Ginatilan', '4468989682', 'arohlfing4@taobao.com', 'Cassin, Maggio and Collins', '728343243214');

-- --------------------------------------------------------

--
-- Table structure for table `table_service`
--

CREATE TABLE `table_service` (
  `id` varchar(5) NOT NULL,
  `name` text NOT NULL,
  `status` enum('Empty','Serviced','Not Yet Serviced') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `table_service`
--

INSERT INTO `table_service` (`id`, `name`, `status`) VALUES
('1', 'Pink', 'Serviced'),
('2', 'Teal', 'Not Yet Serviced'),
('3', 'Red', 'Serviced'),
('4', 'Blue', 'Serviced'),
('5', 'Gray', 'Not Yet Serviced'),
('6', 'Black', 'Empty');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_customer` (`id_customer`),
  ADD KEY `id_discount` (`id_discount`),
  ADD KEY `id_employee` (`id_employee`),
  ADD KEY `id_table_service` (`id_table_service`);

--
-- Indexes for table `bonus`
--
ALTER TABLE `bonus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `detail_bill`
--
ALTER TABLE `detail_bill`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_item` (`id_item`),
  ADD KEY `id_bill` (`id_bill`);

--
-- Indexes for table `detail_import_ticket`
--
ALTER TABLE `detail_import_ticket`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_import_ticket` (`id_import_ticket`),
  ADD KEY `id_ingredient` (`id_ingredient`);

--
-- Indexes for table `discount`
--
ALTER TABLE `discount`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `import_ticket`
--
ALTER TABLE `import_ticket`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_employee` (`id_employee`),
  ADD KEY `id_supplier` (`id_supplier`);

--
-- Indexes for table `ingredient`
--
ALTER TABLE `ingredient`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ingredient_type`
--
ALTER TABLE `ingredient_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_ingredient_type` (`id_ingredient_type`);

--
-- Indexes for table `item_ingredient`
--
ALTER TABLE `item_ingredient`
  ADD PRIMARY KEY (`id_item`,`id_ingredient`),
  ADD KEY `id_ingredient` (`id_ingredient`);

--
-- Indexes for table `punish`
--
ALTER TABLE `punish`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `salary`
--
ALTER TABLE `salary`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_employee` (`id_employee`),
  ADD KEY `id_shift` (`id_shift`);

--
-- Indexes for table `salary_bonus`
--
ALTER TABLE `salary_bonus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_salary` (`id_salary`),
  ADD KEY `id_bonus` (`id_bonus`);

--
-- Indexes for table `salary_punish`
--
ALTER TABLE `salary_punish`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_salary` (`id_salary`),
  ADD KEY `id_punish` (`id_punish`);

--
-- Indexes for table `shift`
--
ALTER TABLE `shift`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `table_service`
--
ALTER TABLE `table_service`
  ADD PRIMARY KEY (`id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bill`
--
ALTER TABLE `bill`
  ADD CONSTRAINT `bill_ibfk_1` FOREIGN KEY (`id_customer`) REFERENCES `customer` (`id`),
  ADD CONSTRAINT `bill_ibfk_2` FOREIGN KEY (`id_discount`) REFERENCES `discount` (`id`),
  ADD CONSTRAINT `bill_ibfk_3` FOREIGN KEY (`id_employee`) REFERENCES `employee` (`id`),
  ADD CONSTRAINT `bill_ibfk_4` FOREIGN KEY (`id_table_service`) REFERENCES `table_service` (`id`);

--
-- Constraints for table `detail_bill`
--
ALTER TABLE `detail_bill`
  ADD CONSTRAINT `detail_bill_ibfk_1` FOREIGN KEY (`id_item`) REFERENCES `item` (`id`),
  ADD CONSTRAINT `detail_bill_ibfk_2` FOREIGN KEY (`id_bill`) REFERENCES `bill` (`id`);

--
-- Constraints for table `detail_import_ticket`
--
ALTER TABLE `detail_import_ticket`
  ADD CONSTRAINT `detail_import_ticket_ibfk_1` FOREIGN KEY (`id_import_ticket`) REFERENCES `import_ticket` (`id`),
  ADD CONSTRAINT `detail_import_ticket_ibfk_2` FOREIGN KEY (`id_ingredient`) REFERENCES `ingredient` (`id`);

--
-- Constraints for table `import_ticket`
--
ALTER TABLE `import_ticket`
  ADD CONSTRAINT `import_ticket_ibfk_1` FOREIGN KEY (`id_employee`) REFERENCES `employee` (`id`),
  ADD CONSTRAINT `import_ticket_ibfk_2` FOREIGN KEY (`id_supplier`) REFERENCES `supplier` (`id`);

--
-- Constraints for table `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `item_ibfk_1` FOREIGN KEY (`id_ingredient_type`) REFERENCES `ingredient_type` (`id`);

--
-- Constraints for table `item_ingredient`
--
ALTER TABLE `item_ingredient`
  ADD CONSTRAINT `item_ingredient_ibfk_1` FOREIGN KEY (`id_item`) REFERENCES `item` (`id`),
  ADD CONSTRAINT `item_ingredient_ibfk_2` FOREIGN KEY (`id_ingredient`) REFERENCES `ingredient` (`id`);

--
-- Constraints for table `salary`
--
ALTER TABLE `salary`
  ADD CONSTRAINT `salary_ibfk_1` FOREIGN KEY (`id_employee`) REFERENCES `employee` (`id`),
  ADD CONSTRAINT `salary_ibfk_2` FOREIGN KEY (`id_shift`) REFERENCES `shift` (`id`);

--
-- Constraints for table `salary_bonus`
--
ALTER TABLE `salary_bonus`
  ADD CONSTRAINT `salary_bonus_ibfk_1` FOREIGN KEY (`id_salary`) REFERENCES `salary` (`id`),
  ADD CONSTRAINT `salary_bonus_ibfk_2` FOREIGN KEY (`id_bonus`) REFERENCES `bonus` (`id`);

--
-- Constraints for table `salary_punish`
--
ALTER TABLE `salary_punish`
  ADD CONSTRAINT `salary_punish_ibfk_1` FOREIGN KEY (`id_salary`) REFERENCES `salary` (`id`),
  ADD CONSTRAINT `salary_punish_ibfk_2` FOREIGN KEY (`id_punish`) REFERENCES `punish` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
