-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 28, 2023 at 09:05 AM
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
(1, 1, 5, '2023-07-29', '0', '01:00:00'),
(2, 1, 5, '2023-07-31', '1', '01:30:00'),
(3, 1, 5, '2023-07-29', '0', '02:00:00'),
(4, 2, 5, '2023-07-29', '1', '03:00:00');

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
(2, 1, 12, 'Network Issue', '', 'bad network 😬', '0000-00-00 00:00:00', ''),
(3, 1, 5, 'Slow Charging', '', 'very slow charging fecility😬', '0000-00-00 00:00:00', '');

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

--
-- Dumping data for table `favourites`
--

INSERT INTO `favourites` (`fav_id`, `station_id`, `user_id`) VALUES
(1, 1, 5);

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
(2, 'ather@gmail.com ', 'ather12345', 'station'),
(3, 'easy@gmail.com ', 'easy12345', 'station'),
(4, 'speed@gmail.com', 'speed12345', 'station'),
(5, 'abcd@gmail.com ', 'abcd12345', 'user'),
(6, 'ram@gmail.com', 'ram123456', 'user'),
(7, 'anu@gmail.com ', 'anu123456', 'user'),
(8, 'max@gmail.com', 'max123456', 'station');

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
(1, 5, 1),
(2, 5, 2);

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
(1, 2, '1027480495.jpg'),
(2, 2, '1358942783.jpg'),
(3, 2, '2072071936.jpg');

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
(1, 5, 1, 5, 'Good service👍🏻', '2023-07-28 12:15:09');

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
  `latitude` varchar(100) NOT NULL,
  `longitude` varchar(100) NOT NULL,
  `district` varchar(100) NOT NULL DEFAULT 'Malappuram'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `station_tb`
--

INSERT INTO `station_tb` (`station_id`, `login_id`, `name`, `mobile_no`, `place`, `location`, `latitude`, `longitude`, `district`) VALUES
(1, 2, 'AtherGrid', 5823568900, 'kondotty', '', '10.977726', '76.22373', 'Malappuram'),
(2, 3, 'EasyCharge', 9856230088, 'Malappuram ', '', '11.1457', '75.9643', 'Malappuram'),
(3, 4, 'speed24', 9652353566, 'kozhikode', '', '11.2606636', '75.7903877', 'Kozhikode'),
(4, 8, 'MaxCharging', 8089562355, 'thirur', '', '10.852', '76.03845', 'Malappuram');

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
(1, 'abcd', 8866523255, 'Malappuram ', 5),
(2, 'Ram', 8956336699, 'Kondotti', 6),
(3, 'Anu', 8956238080, 'thirur', 7);

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
(1, 'Tata', 'Tata Tiago EV', '1812640657.png'),
(2, 'Tata', 'Tata Nexon EV Max', '60295804.webp'),
(3, 'Tata', 'Tata Nexon EV Prime', '1812640657.png'),
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
  MODIFY `complaint_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `connector_tb`
--
ALTER TABLE `connector_tb`
  MODIFY `connector_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `favourites`
--
ALTER TABLE `favourites`
  MODIFY `fav_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `login_tb`
--
ALTER TABLE `login_tb`
  MODIFY `login_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `myvehicle`
--
ALTER TABLE `myvehicle`
  MODIFY `mv_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `offer`
--
ALTER TABLE `offer`
  MODIFY `offer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `review_tb`
--
ALTER TABLE `review_tb`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `slot_tb`
--
ALTER TABLE `slot_tb`
  MODIFY `slot_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `station_tb`
--
ALTER TABLE `station_tb`
  MODIFY `station_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user_register_tb`
--
ALTER TABLE `user_register_tb`
  MODIFY `reg_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `vehicles`
--
ALTER TABLE `vehicles`
  MODIFY `v_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
