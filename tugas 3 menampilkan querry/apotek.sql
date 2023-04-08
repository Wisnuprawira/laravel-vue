-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 08, 2023 at 10:01 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `apotek`
--

-- --------------------------------------------------------

--
-- Table structure for table `obat`
--

CREATE TABLE `obat` (
  `id_obat` varchar(64) NOT NULL,
  `nama_obat` varchar(64) NOT NULL,
  `pembuat_obat` varchar(64) NOT NULL,
  `stok_obat` varchar(255) NOT NULL,
  `tahun_kadaluarsa` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `obat`
--

INSERT INTO `obat` (`id_obat`, `nama_obat`, `pembuat_obat`, `stok_obat`, `tahun_kadaluarsa`) VALUES
('1', 'paramex', 'ucup', '1200', 2000),
('10', 'OBH', 'Cah Tenggorokan Gatel', '22', 2005),
('2', 'bodrexin', 'gaga', '15', 2006),
('3', 'panadol', 'hary', '122', 2015),
('4', 'Insana', 'dika kurniawan', '12312', 2023),
('5', 'Oskadon', 'Pancen Oye', '130', 2007),
('6', 'Procold', 'Kunto Aji', '300', 2013),
('7', 'Laserine', 'Anak kecil', '190', 2023),
('8', 'Komik', 'Cah Batuk', '60', 2023),
('9', 'Mylanta', 'Cah Maag', '20', 2023);

-- --------------------------------------------------------

--
-- Table structure for table `pasien`
--

CREATE TABLE `pasien` (
  `id_pasien` int(11) NOT NULL,
  `nama_pasien` varchar(64) NOT NULL,
  `tanggal_lahir_pasien` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pasien`
--

INSERT INTO `pasien` (`id_pasien`, `nama_pasien`, `tanggal_lahir_pasien`) VALUES
(1, 'Wisnu Prawira', '2013-04-03'),
(2, 'Yusuf Dwinata', '2014-04-03'),
(3, 'Gaga Suhendar', '2015-04-10'),
(4, 'Eko Purwanto', '2016-04-08'),
(5, 'Ma\'ruf Amin', '2017-04-18'),
(6, 'Joko Widodo', '2018-04-11'),
(7, 'Jessica Marpaung', '2019-04-17'),
(8, 'Wira Suhendar', '2020-04-06'),
(9, 'Sukino Gaming', '2023-04-12'),
(10, 'Yanto Gaming', '2023-04-26');

-- --------------------------------------------------------

--
-- Table structure for table `pembeli`
--

CREATE TABLE `pembeli` (
  `id` int(11) NOT NULL,
  `nama_pembeli` varchar(64) NOT NULL,
  `id_obat` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pembeli`
--

INSERT INTO `pembeli` (`id`, `nama_pembeli`, `id_obat`) VALUES
(1, 'Wisnu Prawira', 'paramex'),
(2, 'Yusuf Dwinata', 'bodrexin'),
(3, 'Gaga Suhendar', 'panadol'),
(4, 'Eko Purwanto', 'Mylanta'),
(5, 'Ma\'ruf Amin', 'Komik'),
(6, 'Joko Widodo', 'Oskadon'),
(9, 'Jesicca Marpaung', 'Insana'),
(10, 'Wira Suhendar', 'OBH'),
(13, 'Sukino Gaming', 'Laserine'),
(14, 'Yanto Gaming', 'Procold');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int(64) NOT NULL,
  `id_pasien` int(64) NOT NULL,
  `id_obat` varchar(64) NOT NULL,
  `jumlah_transaksi` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `id_pasien`, `id_obat`, `jumlah_transaksi`) VALUES
(1, 1, '1', '1'),
(10, 10, '10', '180'),
(2, 2, '2', '2'),
(3, 3, '3', '3'),
(4, 4, '4', '45'),
(5, 5, '5', '55'),
(6, 6, '6', '65'),
(7, 7, '7', '98'),
(8, 8, '8', '87'),
(9, 9, '9', '876');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `obat`
--
ALTER TABLE `obat`
  ADD UNIQUE KEY `id_obat` (`id_obat`),
  ADD UNIQUE KEY `nama_obat` (`nama_obat`);

--
-- Indexes for table `pasien`
--
ALTER TABLE `pasien`
  ADD PRIMARY KEY (`id_pasien`),
  ADD UNIQUE KEY `nama_pasien` (`nama_pasien`);

--
-- Indexes for table `pembeli`
--
ALTER TABLE `pembeli`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_obat` (`id_obat`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_obat`),
  ADD KEY `fk_pasien` (`id_pasien`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pasien`
--
ALTER TABLE `pasien`
  MODIFY `id_pasien` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `pembeli`
--
ALTER TABLE `pembeli`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pembeli`
--
ALTER TABLE `pembeli`
  ADD CONSTRAINT `pembeli_ibfk_1` FOREIGN KEY (`id_obat`) REFERENCES `obat` (`nama_obat`);

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `fk_pasien` FOREIGN KEY (`id_pasien`) REFERENCES `pasien` (`id_pasien`),
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`id_obat`) REFERENCES `obat` (`id_obat`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
