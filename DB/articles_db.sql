-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 13, 2023 at 08:07 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `articles_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE `articles` (
  `art_id` int(11) NOT NULL,
  `art_titre` varchar(30) DEFAULT NULL,
  `art_description` text DEFAULT NULL,
  `art_creation_date` datetime DEFAULT NULL,
  `art_update_date` datetime DEFAULT NULL,
  `cat_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `articles`
--

INSERT INTO `articles` (`art_id`, `art_titre`, `art_description`, `art_creation_date`, `art_update_date`, `cat_id`, `user_id`) VALUES
(11, 'Premier Article', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s\r\n', '2023-11-12 14:20:11', '2023-12-13 18:43:23', 9, 1),
(12, 'Deuxieme article', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s', '2023-11-12 14:20:33', '2023-12-13 18:44:44', 10, 1),
(13, 'Troisieme article', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s', '2023-11-12 14:20:51', '2023-12-13 20:06:39', 9, 1),
(14, 'Cinquieme article', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s\r\n', '2023-12-13 12:35:32', '2023-12-13 13:09:05', 14, 2);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(11) NOT NULL,
  `cat_titre` varchar(30) DEFAULT NULL,
  `cat_description` text DEFAULT NULL,
  `cat_creation_date` datetime DEFAULT NULL,
  `cat_update_date` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_titre`, `cat_description`, `cat_creation_date`, `cat_update_date`, `user_id`) VALUES
(9, 'Category 1', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Eos?\r\n', '2023-11-12 14:19:07', '2023-12-13 18:43:03', 1),
(10, 'Category 2', 'Lorem ipsum dolor sit amet consectetur adipisicing elit\n', '2023-11-12 14:19:23', '2023-11-12 14:50:12', 1),
(11, 'Category 3', 'Lorem ipsum dolor sit amet consectetur \r\n', '2023-11-12 14:19:37', '2023-11-12 14:19:37', 1),
(14, 'Category 5', 'Lorem ipsum dolor sit amet consectetur', '2023-12-13 12:17:54', '2023-12-13 12:26:18', 2);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(10) DEFAULT NULL,
  `user_email` varchar(50) DEFAULT NULL,
  `user_pwd` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_name`, `user_email`, `user_pwd`) VALUES
(1, 'Gh0st', 'elmahi.achraf9@gmail.com', '$2a$12$VsswfMHe4B6EwgL.loaNKuY2Ez9xxf4TRMbFgsQMEHSts6PRtrEtK'),
(2, 'Achraf', 'elmahi.achraf1@gmail.com', '$2a$12$b7gsAAR5WcKCe4sAcEM17evoLPXsrzsYLcy6EgT8014dIf5PkmSpq'),
(6, 'John', 'john.homelander@gmail.com', '$2a$12$dpnjZOGZa3mCqtPSJfHqtODhJCuPBzvPIipjTNSHXODSno7d.Zk2q');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`art_id`),
  ADD KEY `cat_id` (`cat_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `articles`
--
ALTER TABLE `articles`
  MODIFY `art_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `articles`
--
ALTER TABLE `articles`
  ADD CONSTRAINT `articles_ibfk_1` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`cat_id`),
  ADD CONSTRAINT `articles_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
