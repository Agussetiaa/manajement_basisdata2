-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 04 Okt 2024 pada 09.29
-- Versi server: 10.4.20-MariaDB
-- Versi PHP: 8.0.8

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
-- Struktur dari tabel `kamar`
--

CREATE TABLE `kamar` (
  `id_kamar` int(11) NOT NULL,
  `nomor_kamar` varchar(10) NOT NULL,
  `tipe_kamar` varchar(50) DEFAULT NULL,
  `harga_per_malam` decimal(10,2) DEFAULT NULL,
  `status` varchar(20) DEFAULT 'tersedia'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `kamar`
--

INSERT INTO `kamar` (`id_kamar`, `nomor_kamar`, `tipe_kamar`, `harga_per_malam`, `status`) VALUES
(1, '101', 'Deluxe', '500000.00', 'tersedia'),
(2, '102', 'Standard', '350000.00', 'tersedia'),
(3, '103', 'Suite', '750000.00', 'tersedia'),
(4, '104', 'Standard', '350000.00', 'dipesan'),
(5, '105', 'Deluxe', '500000.00', 'tersedia'),
(6, '101', 'Deluxe', '500000.00', 'tersedia'),
(7, '102', 'Standard', '350000.00', 'tersedia'),
(8, '103', 'Suite', '750000.00', 'tersedia'),
(9, '104', 'Standard', '350000.00', 'dipesan'),
(10, '105', 'Deluxe', '500000.00', 'tersedia');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `no_telepon` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `nama`, `alamat`, `no_telepon`, `email`) VALUES
(1, 'Budi Santoso', 'Jl. Merpati No. 12, Jakarta', '081234567890', 'budi.santoso@gmail.com'),
(2, 'Siti Nurhaliza', 'Jl. Anggrek No. 45, Bandung', '081298765432', 'siti.nurhaliza@yahoo.com'),
(3, 'Ahmad Rifai', 'Jl. Kenanga No. 23, Surabaya', '081312345678', 'ahmad.rifai@hotmail.com'),
(4, 'Budi Santoso', 'Jl. Merpati No. 12, Jakarta', '081234567890', 'budi.santoso@gmail.com'),
(5, 'Siti Nurhaliza', 'Jl. Anggrek No. 45, Bandung', '081298765432', 'siti.nurhaliza@yahoo.com'),
(6, 'Ahmad Rifai', 'Jl. Kenanga No. 23, Surabaya', '081312345678', 'ahmad.rifai@hotmail.com');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembayaran`
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
-- Dumping data untuk tabel `pembayaran`
--

INSERT INTO `pembayaran` (`id_pembayaran`, `id_reservasi`, `tanggal_pembayaran`, `jumlah`, `metode_pembayaran`, `status_pembayaran`) VALUES
(19, 4, '2024-10-04', '700000.00', 'Transfer Bank', 'selesai'),
(20, 5, '2024-10-05', '2000000.00', 'Kartu Kredit', 'selesai'),
(21, 6, '2024-10-06', '3000000.00', 'Transfer Bank', 'pending');

-- --------------------------------------------------------

--
-- Struktur dari tabel `reservasi`
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
-- Dumping data untuk tabel `reservasi`
--

INSERT INTO `reservasi` (`id_reservasi`, `id_pelanggan`, `id_kamar`, `tanggal_checkin`, `tanggal_checkout`, `total_harga`, `status_reservasi`) VALUES
(4, 1, 1, '2024-10-05', '2024-10-07', '700000.00', 'dipesan'),
(5, 2, 2, '2024-10-06', '2024-10-10', '2000000.00', 'dipesan'),
(6, 3, 3, '2024-10-08', '2024-10-12', '3000000.00', 'dipesan'),
(7, 1, 1, '2024-10-05', '2024-10-07', '700000.00', 'dipesan'),
(8, 2, 2, '2024-10-06', '2024-10-10', '2000000.00', 'dipesan'),
(9, 3, 3, '2024-10-08', '2024-10-12', '3000000.00', 'dipesan'),
(10, 1, 1, '2024-10-05', '2024-10-07', '700000.00', 'dipesan'),
(11, 2, 2, '2024-10-06', '2024-10-10', '2000000.00', 'dipesan'),
(12, 3, 3, '2024-10-08', '2024-10-12', '3000000.00', 'dipesan'),
(13, 1, 1, '2024-10-05', '2024-10-07', '700000.00', 'dipesan'),
(14, 2, 2, '2024-10-06', '2024-10-10', '2000000.00', 'dipesan'),
(15, 3, 3, '2024-10-08', '2024-10-12', '3000000.00', 'dipesan');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `kamar`
--
ALTER TABLE `kamar`
  ADD PRIMARY KEY (`id_kamar`);

--
-- Indeks untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indeks untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`),
  ADD KEY `id_reservasi` (`id_reservasi`);

--
-- Indeks untuk tabel `reservasi`
--
ALTER TABLE `reservasi`
  ADD PRIMARY KEY (`id_reservasi`),
  ADD KEY `id_pelanggan` (`id_pelanggan`),
  ADD KEY `id_kamar` (`id_kamar`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `kamar`
--
ALTER TABLE `kamar`
  MODIFY `id_kamar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id_pelanggan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id_pembayaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT untuk tabel `reservasi`
--
ALTER TABLE `reservasi`
  MODIFY `id_reservasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD CONSTRAINT `pembayaran_ibfk_1` FOREIGN KEY (`id_reservasi`) REFERENCES `reservasi` (`id_reservasi`);

--
-- Ketidakleluasaan untuk tabel `reservasi`
--
ALTER TABLE `reservasi`
  ADD CONSTRAINT `reservasi_ibfk_1` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`),
  ADD CONSTRAINT `reservasi_ibfk_2` FOREIGN KEY (`id_kamar`) REFERENCES `kamar` (`id_kamar`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
