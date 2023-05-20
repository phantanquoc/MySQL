-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 20, 2023 at 09:54 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `iot_database`
--

-- --------------------------------------------------------

--
-- Table structure for table `esp32_table_dht11_record`
--

CREATE TABLE `esp32_table_dht11_record` (
  `id` varchar(255) NOT NULL,
  `board` varchar(255) NOT NULL,
  `temperature` float(10,2) NOT NULL,
  `humidity` int(3) NOT NULL,
  `status_read_sensor_dht11` varchar(255) NOT NULL,
  `time` time NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `esp32_table_dht11_record`
--

INSERT INTO `esp32_table_dht11_record` (`id`, `board`, `temperature`, `humidity`, `status_read_sensor_dht11`, `time`, `date`) VALUES
('02JnErHY7Q', 'esp32_02', 29.00, 69, 'SUCCEED', '13:31:54', '2023-05-20'),
('0TFDwi22Md', 'esp32_02', 30.00, 58, 'SUCCEED', '13:22:21', '2023-05-20'),
('1emmmyq1Eo', 'esp32_02', 29.00, 59, 'SUCCEED', '12:53:15', '2023-05-20'),
('2rnvTBZnA5', 'esp32_02', 30.00, 60, 'SUCCEED', '13:19:02', '2023-05-20'),
('4CIdUMKbXD', 'esp32_02', 30.00, 58, 'SUCCEED', '13:20:31', '2023-05-20'),
('64y1CXtpMq', 'esp32_02', 30.00, 57, 'SUCCEED', '13:23:49', '2023-05-20'),
('7dPEueHDiB', 'esp32_02', 30.00, 61, 'SUCCEED', '13:16:50', '2023-05-20'),
('8U6ILSnt6v', 'esp32_02', 30.00, 57, 'SUCCEED', '13:23:05', '2023-05-20'),
('9o8JuvLsmh', 'esp32_02', 28.00, 61, 'SUCCEED', '12:51:47', '2023-05-20'),
('AVeFc2QJQU', 'esp32_02', 30.80, 84, 'SUCCEED', '12:07:22', '2023-05-16'),
('Bv1zpD6jlD', 'esp32_02', 29.00, 69, 'SUCCEED', '13:31:32', '2023-05-20'),
('ByrXGvoAlq', 'esp32_02', 30.00, 60, 'SUCCEED', '13:18:18', '2023-05-20'),
('cUgEJpyOGQ', 'esp32_02', 29.00, 62, 'SUCCEED', '13:15:22', '2023-05-20'),
('DdA1Evzrf5', 'esp32_02', 30.00, 61, 'SUCCEED', '13:17:34', '2023-05-20'),
('dt2C02G39K', 'esp32_02', 30.00, 60, 'SUCCEED', '13:18:40', '2023-05-20'),
('E8QLP1644s', 'esp32_02', 30.80, 85, 'SUCCEED', '12:07:01', '2023-05-16'),
('EcJUschVpl', 'esp32_02', 30.00, 61, 'SUCCEED', '13:16:28', '2023-05-20'),
('ERz9dlNK4Z', 'esp32_02', 30.00, 60, 'SUCCEED', '13:17:56', '2023-05-20'),
('et4jSIvDWi', 'esp32_02', 28.00, 72, 'SUCCEED', '13:27:08', '2023-05-20'),
('EXjbpyZBTH', 'esp32_02', 33.00, 60, 'SUCCEED', '12:39:56', '2023-05-20'),
('F0lbYZ21LL', 'esp32_02', 29.00, 69, 'SUCCEED', '13:32:16', '2023-05-20'),
('F6anCRqXEC', 'esp32_02', 30.00, 58, 'SUCCEED', '13:21:15', '2023-05-20'),
('fhPMF3byQD', 'esp32_02', 0.00, 0, 'FAILED', '12:04:09', '2023-05-16'),
('fJsHSFGG4m', 'esp32_02', 30.00, 58, 'SUCCEED', '13:21:37', '2023-05-20'),
('FrbiAibMgZ', 'esp32_02', 28.00, 72, 'SUCCEED', '13:28:14', '2023-05-20'),
('fw72ZzNUQH', 'esp32_02', 30.00, 58, 'SUCCEED', '13:22:43', '2023-05-20'),
('GAe2gPmlGo', 'esp32_02', 30.00, 57, 'SUCCEED', '13:23:28', '2023-05-20'),
('GFB2Y7qHm9', 'esp32_02', 28.00, 72, 'SUCCEED', '13:28:58', '2023-05-20'),
('hDyQIIWCuk', 'esp32_02', 29.00, 57, 'SUCCEED', '13:05:36', '2023-05-20'),
('heeWXk7rAM', 'esp32_02', 28.00, 71, 'SUCCEED', '13:29:42', '2023-05-20'),
('HJiPBJGGtM', 'esp32_02', 29.00, 70, 'SUCCEED', '13:31:10', '2023-05-20'),
('lM3oj8t5NE', 'esp32_02', 29.00, 58, 'SUCCEED', '12:55:04', '2023-05-20'),
('m6hVUI2W4P', 'esp32_02', 0.00, 0, 'FAILED', '23:31:28', '2023-05-11'),
('mHlc3fqAHW', 'esp32_02', 28.00, 71, 'SUCCEED', '13:29:20', '2023-05-20'),
('mxN2y8ojW9', 'esp32_02', 0.00, 0, 'FAILED', '23:30:17', '2023-05-11'),
('n4A4dvJdDb', 'esp32_02', 29.00, 57, 'SUCCEED', '12:56:33', '2023-05-20'),
('NF6YkLvu8f', 'esp32_02', 28.00, 70, 'SUCCEED', '13:30:04', '2023-05-20'),
('ohSQx21pyE', 'esp32_02', 29.00, 70, 'SUCCEED', '13:30:26', '2023-05-20'),
('op2S8o5rP9', 'esp32_02', 28.00, 72, 'SUCCEED', '13:28:36', '2023-05-20'),
('ozhFdZui7Y', 'esp32_02', 29.00, 60, 'SUCCEED', '12:52:09', '2023-05-20'),
('p7UXzmu4Nd', 'esp32_02', 29.00, 57, 'SUCCEED', '12:55:49', '2023-05-20'),
('PFqvPoJrPo', 'esp32_02', 33.00, 39, 'SUCCEED', '12:42:53', '2023-05-20'),
('PHL3J3mLpT', 'esp32_02', 28.00, 72, 'SUCCEED', '13:27:30', '2023-05-20'),
('PrSdvFg9w2', 'esp32_02', 29.00, 60, 'SUCCEED', '12:52:53', '2023-05-20'),
('pV5OlQIADZ', 'esp32_02', 29.00, 61, 'SUCCEED', '13:15:44', '2023-05-20'),
('qXi9p1g6PL', 'esp32_02', 0.00, 0, 'FAILED', '12:50:45', '2023-05-20'),
('R2rsgg2pwi', 'esp32_02', 29.00, 57, 'SUCCEED', '12:56:11', '2023-05-20'),
('RfIczMmnhB', 'esp32_02', 29.00, 59, 'SUCCEED', '12:54:21', '2023-05-20'),
('rQOqAUCtkO', 'esp32_02', 29.00, 60, 'SUCCEED', '12:52:31', '2023-05-20'),
('SAk3EUYmpp', 'esp32_02', 29.00, 58, 'SUCCEED', '12:54:42', '2023-05-20'),
('sKqnqJO8P1', 'esp32_02', 30.80, 84, 'SUCCEED', '12:07:43', '2023-05-16'),
('stNI1LLzIn', 'esp32_02', 0.00, 0, 'FAILED', '23:30:38', '2023-05-11'),
('SXqOTYu1XH', 'esp32_02', 29.00, 58, 'SUCCEED', '12:55:27', '2023-05-20'),
('t3DdY7ITvw', 'esp32_02', 29.00, 70, 'SUCCEED', '13:30:48', '2023-05-20'),
('teUYn35qeD', 'esp32_02', 30.00, 58, 'SUCCEED', '13:19:46', '2023-05-20'),
('u0J1slLiro', 'esp32_02', 28.00, 72, 'SUCCEED', '13:27:52', '2023-05-20'),
('Vgi9jViUeC', 'esp32_02', 30.00, 58, 'SUCCEED', '13:20:08', '2023-05-20'),
('X5GwLmuheh', 'esp32_02', 30.00, 57, 'SUCCEED', '13:24:34', '2023-05-20'),
('XebvXPs4tL', 'esp32_02', 30.00, 58, 'SUCCEED', '13:21:59', '2023-05-20'),
('XUTLQ9CcUD', 'esp32_02', 30.00, 58, 'SUCCEED', '13:20:53', '2023-05-20'),
('XVNDWPEuGA', 'esp32_02', 28.00, 72, 'SUCCEED', '13:26:45', '2023-05-20'),
('yF8EEMdC8t', 'esp32_02', 30.00, 57, 'SUCCEED', '13:24:11', '2023-05-20'),
('ZJkGcJ5gPl', 'esp32_02', 30.00, 59, 'SUCCEED', '13:19:24', '2023-05-20');

-- --------------------------------------------------------

--
-- Table structure for table `esp32_table_dht11_update`
--

CREATE TABLE `esp32_table_dht11_update` (
  `id` varchar(255) NOT NULL,
  `temperature` float(10,2) NOT NULL,
  `humidity` int(3) NOT NULL,
  `status_read_sensor_dht11` varchar(255) NOT NULL,
  `time` time NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `esp32_table_dht11_update`
--

INSERT INTO `esp32_table_dht11_update` (`id`, `temperature`, `humidity`, `status_read_sensor_dht11`, `time`, `date`) VALUES
('esp32_01', 29.80, 84, 'SUCCEED', '09:06:53', '2023-04-22'),
('esp32_02', 29.00, 69, 'SUCCEED', '13:32:16', '2023-05-20');

-- --------------------------------------------------------

--
-- Table structure for table `esp32_table_test`
--

CREATE TABLE `esp32_table_test` (
  `id` varchar(255) NOT NULL,
  `temperature` float(10,2) NOT NULL,
  `humidity` int(3) NOT NULL,
  `status_read_sensor_dht11` varchar(255) NOT NULL,
  `LED_01` varchar(255) NOT NULL,
  `LED_02` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `esp32_table_test`
--

INSERT INTO `esp32_table_test` (`id`, `temperature`, `humidity`, `status_read_sensor_dht11`, `LED_01`, `LED_02`) VALUES
('esp32_01', 28.50, 61, 'SUCCEED', 'OFF', 'OFF');

-- --------------------------------------------------------

--
-- Table structure for table `iot_device`
--

CREATE TABLE `iot_device` (
  `ID` int(11) DEFAULT NULL,
  `humidity` decimal(4,2) DEFAULT NULL,
  `temperature` decimal(4,2) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `esp32_table_dht11_record`
--
ALTER TABLE `esp32_table_dht11_record`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `esp32_table_dht11_update`
--
ALTER TABLE `esp32_table_dht11_update`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `esp32_table_test`
--
ALTER TABLE `esp32_table_test`
  ADD PRIMARY KEY (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
