-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 22, 2023 at 09:54 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `spot_ev`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `booking_id` int(11) NOT NULL,
  `station_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT '0',
  `time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`booking_id`, `station_id`, `user_id`, `date`, `status`, `time`) VALUES
(1, 1, 2, '2023-07-24', '0', '01:30:00'),
(2, 1, 12, '2023-07-24', '0', '01:00:00'),
(3, 1, 12, '2023-07-24', '0', '02:30:00'),
(4, 1, 12, '2023-07-24', '0', '03:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `complaint_tb`
--

CREATE TABLE `complaint_tb` (
  `complaint_id` int(11) NOT NULL,
  `station_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `complain_type` varchar(100) NOT NULL,
  `other_complaints` varchar(100) NOT NULL,
  `description` varchar(250) NOT NULL,
  `date` datetime NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `complaint_tb`
--

INSERT INTO `complaint_tb` (`complaint_id`, `station_id`, `user_id`, `complain_type`, `other_complaints`, `description`, `date`, `status`) VALUES
(1, 1, 2, 'Slow Charging', '', 'very Slow charging fecility', '0000-00-00 00:00:00', ''),
(2, 1, 12, 'Network Issue', '', 'bad network 😬', '0000-00-00 00:00:00', '');

-- --------------------------------------------------------

--
-- Table structure for table `connector_tb`
--

CREATE TABLE `connector_tb` (
  `connector_id` int(11) NOT NULL,
  `connector_type` varchar(50) NOT NULL,
  `power_capacity` int(11) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `favourites`
--

CREATE TABLE `favourites` (
  `fav_id` int(11) NOT NULL,
  `station_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `login_tb`
--

CREATE TABLE `login_tb` (
  `login_id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(25) NOT NULL,
  `user_type` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `login_tb`
--

INSERT INTO `login_tb` (`login_id`, `email`, `password`, `user_type`) VALUES
(1, 'admin@gmail.com', 'admin123', 'admin'),
(2, 'abcd@gmail.com', 'abcd12345', 'user'),
(3, 'ather@gmail.com', 'ather12345', 'station'),
(4, 'eesl@gmail.com', 'eesl12345', 'station'),
(5, 'olaev@ail.com', 'olaev12345', 'station'),
(6, 'nexon@gmail.com', 'nexon12345', 'station'),
(10, 'eaay@gmail.com', 'easy12345', 'station'),
(11, 'super@gmail.com', 'super12345', 'station'),
(12, 'anju@gmail.com ', 'anju12345', 'user');

-- --------------------------------------------------------

--
-- Table structure for table `myvehicle`
--

CREATE TABLE `myvehicle` (
  `mv_id` int(11) NOT NULL,
  `user_log_id` int(11) NOT NULL,
  `v_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `myvehicle`
--

INSERT INTO `myvehicle` (`mv_id`, `user_log_id`, `v_id`) VALUES
(2, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `offer`
--

CREATE TABLE `offer` (
  `offer_id` int(11) NOT NULL,
  `station_log_id` int(11) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `offer`
--

INSERT INTO `offer` (`offer_id`, `station_log_id`, `image`) VALUES
(1, 3, '2058784153.jpg'),
(2, 3, '351949772.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `review_tb`
--

CREATE TABLE `review_tb` (
  `review_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `station_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `comment` varchar(100) NOT NULL,
  `timestamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `review_tb`
--

INSERT INTO `review_tb` (`review_id`, `user_id`, `station_id`, `rating`, `comment`, `timestamp`) VALUES
(1, 2, 1, 5, 'Good service👍🏻', '2023-07-21 21:44:05'),
(2, 12, 1, 4, 'good customer service 😊', '2023-07-21 22:07:58');

-- --------------------------------------------------------

--
-- Table structure for table `slot_tb`
--

CREATE TABLE `slot_tb` (
  `slot_id` int(11) NOT NULL,
  `station_id` int(11) NOT NULL,
  `connector_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `station_tb`
--

CREATE TABLE `station_tb` (
  `station_id` int(11) NOT NULL,
  `login_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `mobile_no` bigint(10) NOT NULL,
  `place` varchar(50) NOT NULL,
  `location` varchar(20) NOT NULL,
  `lattitude` float NOT NULL,
  `longitude` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `station_tb`
--

INSERT INTO `station_tb` (`station_id`, `login_id`, `name`, `mobile_no`, `place`, `location`, `lattitude`, `longitude`) VALUES
(1, 3, 'Ather Grid', 9988523652, 'Kondotti', '', 0, 0),
(2, 4, 'EESL Charging', 8866332255, 'Manjeri', '', 0, 0),
(3, 5, 'Ola Ev', 8896523255, 'Malappuram', '', 0, 0),
(4, 6, 'Nexon', 8956363699, 'Kondotti', '', 0, 0),
(8, 10, 'Easy Charge', 8899652358, 'Malappuram', '', 0, 0),
(9, 11, 'Super Charge', 8696532588, 'Malappuram ', '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_register_tb`
--

CREATE TABLE `user_register_tb` (
  `reg_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `mobile_no` bigint(10) NOT NULL,
  `place` varchar(40) NOT NULL,
  `login_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_register_tb`
--

INSERT INTO `user_register_tb` (`reg_id`, `name`, `mobile_no`, `place`, `login_id`) VALUES
(1, 'abc', 8956231245, '', 2),
(2, 'anju', 8956231245, 'Malappuram ', 12);

-- --------------------------------------------------------

--
-- Table structure for table `vehicles`
--

CREATE TABLE `vehicles` (
  `v_id` int(11) NOT NULL,
  `brand` varchar(30) NOT NULL,
  `name` varchar(40) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vehicles`
--

INSERT INTO `vehicles` (`v_id`, `brand`, `name`, `image`) VALUES
(1, 'Tata', 'Tata Tiago EV', '967359144.webp'),
(2, 'Tata', 'Tata Nexon EV Max', '60295804.webp'),
(3, 'Tata', 'Tata Nexon EV Prime', '908076708.webp'),
(9, 'Hyundai', 'Hyundai Exter', '1525150425.png'),
(10, 'Hyundai', 'Maruti Suzuki Invicto', '2127624507.png'),
(11, 'Mahindra', 'Mahindra XUV 400', '345938125.png'),
(12, 'Mahindra', 'Mahindra Scorpio N', '1812640657.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`booking_id`);

--
-- Indexes for table `complaint_tb`
--
ALTER TABLE `complaint_tb`
  ADD PRIMARY KEY (`complaint_id`);

--
-- Indexes for table `connector_tb`
--
ALTER TABLE `connector_tb`
  ADD PRIMARY KEY (`connector_id`);

--
-- Indexes for table `favourites`
--
ALTER TABLE `favourites`
  ADD PRIMARY KEY (`fav_id`);

--
-- Indexes for table `login_tb`
--
ALTER TABLE `login_tb`
  ADD PRIMARY KEY (`login_id`);

--
-- Indexes for table `myvehicle`
--
ALTER TABLE `myvehicle`
  ADD PRIMARY KEY (`mv_id`);

--
-- Indexes for table `offer`
--
ALTER TABLE `offer`
  ADD PRIMARY KEY (`offer_id`);

--
-- Indexes for table `review_tb`
--
ALTER TABLE `review_tb`
  ADD PRIMARY KEY (`review_id`);

--
-- Indexes for table `slot_tb`
--
ALTER TABLE `slot_tb`
  ADD PRIMARY KEY (`slot_id`);

--
-- Indexes for table `station_tb`
--
ALTER TABLE `station_tb`
  ADD PRIMARY KEY (`station_id`);

--
-- Indexes for table `user_register_tb`
--
ALTER TABLE `user_register_tb`
  ADD PRIMARY KEY (`reg_id`);

--
-- Indexes for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`v_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `complaint_tb`
--
ALTER TABLE `complaint_tb`
  MODIFY `complaint_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `connector_tb`
--
ALTER TABLE `connector_tb`
  MODIFY `connector_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `favourites`
--
ALTER TABLE `favourites`
  MODIFY `fav_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `login_tb`
--
ALTER TABLE `login_tb`
  MODIFY `login_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `myvehicle`
--
ALTER TABLE `myvehicle`
  MODIFY `mv_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `offer`
--
ALTER TABLE `offer`
  MODIFY `offer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `review_tb`
--
ALTER TABLE `review_tb`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `slot_tb`
--
ALTER TABLE `slot_tb`
  MODIFY `slot_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `station_tb`
--
ALTER TABLE `station_tb`
  MODIFY `station_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `user_register_tb`
--
ALTER TABLE `user_register_tb`
  MODIFY `reg_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `vehicles`
--
ALTER TABLE `vehicles`
  MODIFY `v_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
