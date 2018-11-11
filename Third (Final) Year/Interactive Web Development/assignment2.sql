-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 17, 2017 at 11:09 AM
-- Server version: 10.1.24-MariaDB
-- PHP Version: 7.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `assignment2`
--
CREATE DATABASE IF NOT EXISTS `assignment2` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `assignment2`;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `username` varchar(20) NOT NULL,
  `password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`username`, `password`) VALUES
('testadmin', 'abc123');

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `booking_id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `room_num` varchar(8) NOT NULL,
  `start_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `end_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`booking_id`, `username`, `room_num`, `start_time`, `end_time`) VALUES
(3, 'asmith', 'JO07.101', '2017-09-25 12:59:00', '2017-09-26 12:59:00'),
(4, 'bhoward', 'JO18.204', '2017-07-02 10:30:00', '2017-07-02 12:30:00'),
(5, 'bhoward', 'JO07.101', '2017-08-24 13:30:00', '2017-08-24 15:30:00'),
(6, 'asmith', 'ML14.115', '2017-07-12 16:00:00', '2017-07-13 08:30:00'),
(7, 'asmith', 'JO18.330', '2017-09-25 13:30:00', '2017-09-28 12:00:00'),
(8, 'asmith', 'JO18.204', '2017-09-24 12:00:00', '2017-09-25 12:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `log_id` int(11) NOT NULL,
  `log_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_ip` tinytext NOT NULL,
  `log_details` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`log_id`, `log_time`, `log_ip`, `log_details`) VALUES
(4, '2017-10-09 06:42:32', '::1', 'asmith logged in'),
(5, '2017-10-09 06:42:56', '::1', 'testadmin logged in'),
(6, '2017-10-09 06:50:21', '::1', 'testadmin logged in'),
(7, '2017-10-09 06:51:20', '::1', 'asmith logged in'),
(8, '2017-10-09 06:51:41', '::1', 'testadmin logged in'),
(9, '2017-10-09 06:51:45', '::1', 'testadmin deleted a booking for JO07.101'),
(10, '2017-10-09 06:53:12', '::1', 'testadmin deleted room JO11.111'),
(20, '2017-10-09 07:16:51', '::1', 'testadmin logged in'),
(21, '2017-10-11 03:29:15', '::1', 'testadmin logged in'),
(22, '2017-10-17 03:06:16', '::1', 'testadmin logged in'),
(23, '2017-10-17 03:07:18', '::1', 'asmith logged in');

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `room_num` varchar(8) NOT NULL,
  `capacity` int(11) NOT NULL,
  `room_type_id` int(11) NOT NULL,
  `whiteboard` char(1) NOT NULL DEFAULT 'N',
  `projector` char(1) NOT NULL DEFAULT 'N',
  `audio_system` char(1) NOT NULL DEFAULT 'N',
  `telephone` char(1) NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`room_num`, `capacity`, `room_type_id`, `whiteboard`, `projector`, `audio_system`, `telephone`) VALUES
('JO07.101', 100, 1, 'Y', 'Y', 'N', 'N'),
('JO11.111', 100, 1, 'N', 'N', 'N', 'N'),
('JO18.204', 26, 3, 'N', 'N', 'N', 'N'),
('JO18.330', 16, 6, 'N', 'N', 'N', 'N'),
('ML14.115', 40, 2, 'N', 'N', 'N', 'N');

-- --------------------------------------------------------

--
-- Table structure for table `room_types`
--

CREATE TABLE `room_types` (
  `room_type_id` int(11) NOT NULL,
  `room_type_name` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `room_types`
--

INSERT INTO `room_types` (`room_type_id`, `room_type_name`) VALUES
(1, 'Lecture Theatre'),
(2, 'Classroom'),
(3, 'Computer Lab'),
(6, 'Meeting Room');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `username` varchar(20) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `surname` varchar(20) NOT NULL,
  `extension` int(4) NOT NULL,
  `password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`username`, `first_name`, `surname`, `extension`, `password`) VALUES
('asmith', 'Adam', 'Smith', 1234, 'abc123'),
('bhoward', 'Barry', 'Howard', 4523, 'swordfish99'),
('monkaS', 'monka', 'S', 1234, 'monkaS');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`booking_id`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`room_num`);

--
-- Indexes for table `room_types`
--
ALTER TABLE `room_types`
  ADD PRIMARY KEY (`room_type_id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `room_types`
--
ALTER TABLE `room_types`
  MODIFY `room_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
