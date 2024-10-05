-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 05, 2024 at 03:51 AM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hotel_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `kamar`
--

CREATE TABLE `kamar` (
  `id_kamar` int(11) NOT NULL,
  `nomor_kamar` varchar(10) NOT NULL,
  `tipe_kamar` varchar(50) DEFAULT NULL,
  `harga_per_malam` decimal(10,2) DEFAULT NULL,
  `status` varchar(20) DEFAULT 'tersedia'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kamar`
--

INSERT INTO `kamar` (`id_kamar`, `nomor_kamar`, `tipe_kamar`, `harga_per_malam`, `status`) VALUES
(1, '101', 'Single', '100.00', 'tersedia'),
(2, '102', 'Single', '100.00', 'tersedia'),
(3, '201', 'Double', '150.00', 'terpakai'),
(4, '202', 'Double', '150.00', 'tersedia'),
(5, '301', 'Suite', '300.00', 'terpakai'),
(6, '302', 'Suite', '300.00', 'tersedia'),
(7, '303', 'Suite', '300.00', 'tersedia'),
(8, '401', 'Single', '100.00', 'terpakai'),
(9, '402', 'Double', '150.00', 'tersedia'),
(10, '403', 'Suite', '300.00', 'tersedia');

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `no_telepon` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `nama`, `alamat`, `no_telepon`, `email`) VALUES
(1, 'John Doe', '123 Elm Street', '123-456-7890', 'john.doe@example.com'),
(2, 'Jane Smith', '456 Oak Avenue', '234-567-8901', 'jane.smith@example.com'),
(3, 'Alice Johnson', '789 Pine Road', '345-678-9012', 'alice.johnson@example.com'),
(4, 'Bob Brown', '101 Maple Lane', '456-789-0123', 'bob.brown@example.com'),
(5, 'Charlie Davis', '202 Cedar Boulevard', '567-890-1234', 'charlie.davis@example.com'),
(6, 'Diana Evans', '303 Birch Drive', '678-901-2345', 'diana.evans@example.com'),
(7, 'Frank Green', '404 Walnut Court', '789-012-3456', 'frank.green@example.com'),
(8, 'Grace Hall', '505 Redwood Way', '890-123-4567', 'grace.hall@example.com'),
(9, 'Henry Adams', '606 Palm Street', '901-234-5678', 'henry.adams@example.com'),
(10, 'Ivy Brooks', '707 Magnolia Terrace', '012-345-6789', 'ivy.brooks@example.com');

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_pembayaran` int(11) NOT NULL,
  `id_reservasi` int(11) DEFAULT NULL,
  `tanggal_pembayaran` date DEFAULT NULL,
  `jumlah` decimal(10,2) DEFAULT NULL,
  `metode_pembayaran` varchar(50) DEFAULT NULL,
  `status_pembayaran` varchar(20) DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pembayaran`
--

INSERT INTO `pembayaran` (`id_pembayaran`, `id_reservasi`, `tanggal_pembayaran`, `jumlah`, `metode_pembayaran`, `status_pembayaran`) VALUES
(11, 11, '2024-10-01', '1.00', 'cash', 'pending'),
(12, 19, '2024-10-01', '1.00', 'debit', 'selesai'),
(13, 18, '2024-10-01', '1.00', 'cash', 'selesai'),
(14, 17, '2024-10-02', '5.00', 'debit', 'selesai'),
(15, 16, '2024-10-05', '4.00', 'cash', 'selesai'),
(16, 15, '2024-10-14', '4.00', 'cash', 'pending'),
(17, 14, '2024-10-03', '3.00', 'debit', 'selesai'),
(18, 13, '2024-10-17', '1.00', 'debit', 'pending'),
(19, 12, '2024-10-10', '1.00', 'debit', 'selesai'),
(20, 20, '2024-10-02', '1.00', 'cash', 'selesai');

-- --------------------------------------------------------

--
-- Table structure for table `reservasi`
--

CREATE TABLE `reservasi` (
  `id_reservasi` int(11) NOT NULL,
  `id_pelanggan` int(11) DEFAULT NULL,
  `id_kamar` int(11) DEFAULT NULL,
  `tanggal_checkin` date DEFAULT NULL,
  `tanggal_checkout` date DEFAULT NULL,
  `total_harga` decimal(10,2) DEFAULT NULL,
  `status_reservasi` varchar(50) DEFAULT 'dipesan'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reservasi`
--

INSERT INTO `reservasi` (`id_reservasi`, `id_pelanggan`, `id_kamar`, `tanggal_checkin`, `tanggal_checkout`, `total_harga`, `status_reservasi`) VALUES
(11, 3, 1, '2024-10-01', '2024-10-02', '100.00', 'dipesan'),
(12, 4, 2, '2024-10-04', '2024-10-05', '100.00', 'dipesan'),
(13, 5, 3, '2024-10-01', '2024-10-09', '150.00', 'dipesan'),
(14, 6, 4, '2024-10-23', '2024-10-31', '150.00', 'dipesan'),
(15, 7, 5, '2024-10-15', '2024-10-16', '300.00', 'dipesan'),
(16, 8, 6, '2024-10-18', '2024-10-19', '300.00', 'dipesan'),
(17, 9, 7, '2024-10-28', '2024-10-30', '300.00', 'dipesan'),
(18, 10, 8, '2024-10-02', '2024-10-03', '100.00', 'dipesan'),
(19, 1, 9, '2024-10-14', '2024-10-16', '150.00', 'dipesan'),
(20, 2, 10, '2024-10-12', '2024-10-22', '300.00', 'dipesan');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kamar`
--
ALTER TABLE `kamar`
  ADD PRIMARY KEY (`id_kamar`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`),
  ADD KEY `id_reservasi` (`id_reservasi`);

--
-- Indexes for table `reservasi`
--
ALTER TABLE `reservasi`
  ADD PRIMARY KEY (`id_reservasi`),
  ADD KEY `id_pelanggan` (`id_pelanggan`),
  ADD KEY `id_kamar` (`id_kamar`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kamar`
--
ALTER TABLE `kamar`
  MODIFY `id_kamar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id_pelanggan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id_pembayaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `reservasi`
--
ALTER TABLE `reservasi`
  MODIFY `id_reservasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD CONSTRAINT `pembayaran_ibfk_1` FOREIGN KEY (`id_reservasi`) REFERENCES `reservasi` (`id_reservasi`);

--
-- Constraints for table `reservasi`
--
ALTER TABLE `reservasi`
  ADD CONSTRAINT `reservasi_ibfk_1` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`),
  ADD CONSTRAINT `reservasi_ibfk_2` FOREIGN KEY (`id_kamar`) REFERENCES `kamar` (`id_kamar`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
