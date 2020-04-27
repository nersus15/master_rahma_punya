-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 27, 2020 at 08:32 PM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `desa_tamansari`
--

-- --------------------------------------------------------

--
-- Table structure for table `profil`
--

CREATE TABLE `profil` (
  `id` varchar(30) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `alamat` varchar(200) NOT NULL,
  `no_hp` varchar(14) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_bidang`
--

CREATE TABLE `tbl_bidang` (
  `id_bidang` int(11) NOT NULL,
  `kode_rek` varchar(11) NOT NULL,
  `Nama_rek` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_rkp`
--

CREATE TABLE `tbl_rkp` (
  `id_rkp` int(11) NOT NULL,
  `id_usulan` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sub_bidang`
--

CREATE TABLE `tbl_sub_bidang` (
  `Id_sub_bidang` int(11) NOT NULL,
  `id_bidang` int(11) NOT NULL,
  `Sub_rek` varchar(11) DEFAULT '',
  `nama_sub_bidang` varchar(255) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_tahun`
--

CREATE TABLE `tbl_tahun` (
  `id_tahun` int(11) NOT NULL,
  `tahun` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_tahun`
--

INSERT INTO `tbl_tahun` (`id_tahun`, `tahun`) VALUES
(16, 2005),
(1, 2006),
(2, 2007),
(3, 2008),
(4, 2009),
(5, 2010),
(6, 2011),
(7, 2012),
(8, 2013),
(9, 2014),
(10, 2015),
(11, 2016),
(12, 2017),
(13, 2018),
(14, 2019),
(15, 2020),
(17, 2021);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `Id_user` int(11) NOT NULL,
  `username` varchar(128) DEFAULT '',
  `email` varchar(128) NOT NULL,
  `image` varchar(128) DEFAULT '',
  `password` varchar(256) DEFAULT '',
  `role` int(2) NOT NULL,
  `is_active` int(1) NOT NULL,
  `profil` int(30) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`Id_user`, `username`, `email`, `image`, `password`, `role`, `is_active`, `profil`, `date_created`) VALUES
(4, 'fathurrahman', 'fathur.ashter15@gmail.com', 'defaultL.jpg', '$2y$10$YOrQT5.rh8Jh/OxmadOtXe7xoXQ19B5oRgHWFjY5QbwHtKYHXR6Hm', 2, 1, 0, '2020-04-27 18:18:12'),
(5, 'fathurrahman', 'fathur.pashter15@gmail.com', 'defaultL.jpg', '$2y$10$YOrQT5.rh8Jh/OxmadOtXe7xoXQ19B5oRgHWFjY5QbwHtKYHXR6Hm', 1, 1, 0, '2020-04-27 18:18:07');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_usulan`
--

CREATE TABLE `tbl_usulan` (
  `id_usulan` int(11) NOT NULL,
  `id_tahun` int(11) DEFAULT NULL,
  `id_sub_bidang` int(11) DEFAULT NULL,
  `usulan` text DEFAULT NULL,
  `item` varchar(255) DEFAULT NULL,
  `volume` int(11) DEFAULT NULL,
  `satuan` varchar(20) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user_status`
--

CREATE TABLE `user_status` (
  `id` int(11) NOT NULL,
  `status` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_status`
--

INSERT INTO `user_status` (`id`, `status`) VALUES
(1, 'admin'),
(2, 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `profil`
--
ALTER TABLE `profil`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_bidang`
--
ALTER TABLE `tbl_bidang`
  ADD PRIMARY KEY (`id_bidang`);

--
-- Indexes for table `tbl_rkp`
--
ALTER TABLE `tbl_rkp`
  ADD PRIMARY KEY (`id_rkp`),
  ADD KEY `fk_rkp_usulan` (`id_usulan`);

--
-- Indexes for table `tbl_sub_bidang`
--
ALTER TABLE `tbl_sub_bidang`
  ADD PRIMARY KEY (`Id_sub_bidang`),
  ADD KEY `fk_sub_bidang` (`id_bidang`);

--
-- Indexes for table `tbl_tahun`
--
ALTER TABLE `tbl_tahun`
  ADD PRIMARY KEY (`id_tahun`),
  ADD KEY `fk_tahun_kegiUta` (`tahun`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`Id_user`);

--
-- Indexes for table `tbl_usulan`
--
ALTER TABLE `tbl_usulan`
  ADD PRIMARY KEY (`id_usulan`),
  ADD KEY `fk_usulan_Tahunn` (`id_tahun`),
  ADD KEY `fk_usulan_sub` (`id_sub_bidang`);

--
-- Indexes for table `user_status`
--
ALTER TABLE `user_status`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_bidang`
--
ALTER TABLE `tbl_bidang`
  MODIFY `id_bidang` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_rkp`
--
ALTER TABLE `tbl_rkp`
  MODIFY `id_rkp` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_tahun`
--
ALTER TABLE `tbl_tahun`
  MODIFY `id_tahun` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `Id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_usulan`
--
ALTER TABLE `tbl_usulan`
  MODIFY `id_usulan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_status`
--
ALTER TABLE `user_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_rkp`
--
ALTER TABLE `tbl_rkp`
  ADD CONSTRAINT `fk_rkp_usulan` FOREIGN KEY (`id_usulan`) REFERENCES `tbl_usulan` (`id_usulan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_sub_bidang`
--
ALTER TABLE `tbl_sub_bidang`
  ADD CONSTRAINT `fk_sub_bidang` FOREIGN KEY (`id_bidang`) REFERENCES `tbl_bidang` (`id_bidang`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_usulan`
--
ALTER TABLE `tbl_usulan`
  ADD CONSTRAINT `fk_usulan_Tahunn` FOREIGN KEY (`id_tahun`) REFERENCES `tbl_tahun` (`id_tahun`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_usulan_sub` FOREIGN KEY (`id_sub_bidang`) REFERENCES `tbl_sub_bidang` (`Id_sub_bidang`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
