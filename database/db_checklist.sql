-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 15, 2023 at 01:21 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.0.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_checklist`
--

-- --------------------------------------------------------

--
-- Table structure for table `checklist`
--

CREATE TABLE `checklist` (
  `id` int(11) NOT NULL,
  `tanggal` datetime DEFAULT NULL,
  `toilet_id` int(11) NOT NULL,
  `kloset` varchar(10) DEFAULT NULL,
  `wastafel` varchar(10) DEFAULT NULL,
  `lantai` varchar(10) DEFAULT NULL,
  `dinding` varchar(10) DEFAULT NULL,
  `kaca` varchar(10) DEFAULT NULL,
  `bau` varchar(10) DEFAULT NULL,
  `sabun` varchar(10) DEFAULT NULL,
  `users_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `checklist`
--

INSERT INTO `checklist` (`id`, `tanggal`, `toilet_id`, `kloset`, `wastafel`, `lantai`, `dinding`, `kaca`, `bau`, `sabun`, `users_id`) VALUES
(27, '2023-01-04 19:00:24', 6, 'rusak', 'bersih', 'bersih', 'bersih', 'kotor', 'tidak', 'habis', 8),
(31, '2023-01-05 16:28:37', 6, 'Bersih', 'Bersih', 'Bersih', 'Bersih', 'Bersih', 'Tidak', 'Ada', 9);

-- --------------------------------------------------------

--
-- Table structure for table `toilet`
--

CREATE TABLE `toilet` (
  `id` int(11) NOT NULL,
  `lokasi` varchar(45) DEFAULT NULL,
  `keterangan` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `toilet`
--

INSERT INTO `toilet` (`id`, `lokasi`, `keterangan`) VALUES
(5, 'fasos 1', 'Belum'),
(6, 'fasos 2', 'belum'),
(7, 'ecc 2', 'sudah'),
(8, 'fat 1', 'belum'),
(10, 'Office', 'Sudah'),
(11, 'Office', 'Sudah');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `nama` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `stat` varchar(10) DEFAULT NULL,
  `rol` varchar(10) DEFAULT '2' COMMENT '1:Admin\r\n2:User'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `nama`, `email`, `stat`, `rol`) VALUES
(8, 'admin', '0192023a7bbd73250516f069df18b500', 'admin', 'defapabela@gmail.com', 'Aktif', 'Admin'),
(9, 'user', 'user123', 'deva', 'devafabela@gmail.com', 'Aktif', 'User');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `checklist`
--
ALTER TABLE `checklist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_checklist_toilet_idx` (`toilet_id`),
  ADD KEY `fk_checklist_users1_idx` (`users_id`);

--
-- Indexes for table `toilet`
--
ALTER TABLE `toilet`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username_UNIQUE` (`username`),
  ADD UNIQUE KEY `email_UNIQUE` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `checklist`
--
ALTER TABLE `checklist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `toilet`
--
ALTER TABLE `toilet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `checklist`
--
ALTER TABLE `checklist`
  ADD CONSTRAINT `fk_checklist_toilet` FOREIGN KEY (`toilet_id`) REFERENCES `toilet` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_checklist_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
