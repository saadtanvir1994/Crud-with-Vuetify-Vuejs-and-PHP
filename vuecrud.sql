-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 25, 2019 at 11:01 PM
-- Server version: 10.1.40-MariaDB
-- PHP Version: 7.1.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vuecrud`
--

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `email`, `mobile`) VALUES
(1, 'saadtanvir', 'saadtanvir1994@gmail.com', '3316105976'),
(4, 'Umair Ali Malik', 'thebooksyard@gmail.com', '03227313333'),
(5, 'Darly Johns', 'darlyjohn@co.uk', '03321764532'),
(6, 'Jorgan Loie', 'jorganloie@gmail.com', '03261234892'),
(8, 'Jyole', 'jyole@gmail.com', '03316105977'),
(9, 'Jesli', 'jesli@gmail.com', '92333122322'),
(10, 'kalo', 'kalo@gmail.com', '92934588685'),
(16, 'kelly Cruse', 'kellycruse@gmail.com', '98432312314'),
(17, 'Doe John', 'doejohn@gmail.com', '98765432211'),
(18, 'greet', 'greet@gmail.com', '12345677896'),
(19, 'hydary', 'hello@gmail.com', '34234234234'),
(20, 'frage', 'feagde@gmail.com', '15346434323');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
