-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 05, 2018 at 06:17 PM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 7.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vue-laravel-application`
--

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `bio` mediumtext COLLATE utf8mb4_unicode_ci,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'profile.png',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `type`, `bio`, `photo`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Uzzal kar', 'uzzalkar12@gmail.com', NULL, '$2y$10$kx82RFT2j890B9JqqA7oeucpWLDr6fm80qRd/g7iDJw1LiLfUuuiC', 'user', NULL, 'profile.png', NULL, '2018-10-01 10:31:15', '2018-10-01 10:31:15'),
(2, 'John', 'john@gmail.com', NULL, '$2y$10$YSi8KwTf/SbQYWmSzkolqusOUP4xFfepeM0ifmv/uANcivVnQKKW6', 'user', 'Bio', NULL, NULL, '2018-10-05 07:20:58', '2018-10-05 07:20:58'),
(3, 'text', 'text@gmail.com', NULL, '$2y$10$MeQ53P/YR02bOj54Ixjd.O/uZZBh.0pApyLH2P3mLEvFRGySWhekS', 'admin', 'text', NULL, NULL, '2018-10-05 07:27:37', '2018-10-05 07:27:37'),
(4, 'trgrt', 'grtg@gg.com', NULL, '$2y$10$1bo18c6/ZNmyxT.PImQIuuPFeLeKjpbcGB9jqN0ExMduNa9uh2VaW', 'user', 'grgr', NULL, NULL, '2018-10-05 08:43:43', '2018-10-05 08:43:43'),
(5, 'uyuy', 'fdvfd@ghyt.com', NULL, '$2y$10$ybZY2d6dOXzzmCd.5/F0duXh1KGu58JRdOwzQExpOJXH6IJidpSmm', 'admin', 'hrth', NULL, NULL, '2018-10-05 09:14:26', '2018-10-05 09:14:26'),
(6, 'sweet', 'sweet@g.com', NULL, '$2y$10$hYzxa6yEd7jNcyaGTn2SR.ALLtYWMuJ5bkucaNAqd4HAPB9FdnVzK', 'admin', 'frefg', NULL, NULL, '2018-10-05 09:17:42', '2018-10-05 09:17:42'),
(7, 'ggggg', 'd@g.com', NULL, '$2y$10$bJw6TPuZiA2t6cJm5ai99usL2d9QomgvTw8KrsVekl92bUFya0BZ6', 'admin', 'f', NULL, NULL, '2018-10-05 09:51:06', '2018-10-05 09:51:06');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
