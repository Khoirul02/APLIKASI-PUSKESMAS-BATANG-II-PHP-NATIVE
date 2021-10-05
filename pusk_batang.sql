-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 05 Okt 2021 pada 10.39
-- Versi server: 10.1.38-MariaDB
-- Versi PHP: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pusk_batang`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `antrian`
--

CREATE TABLE `antrian` (
  `id` int(11) NOT NULL,
  `id_pasien` int(11) NOT NULL,
  `id_poli` int(11) NOT NULL,
  `no_antrian` int(11) NOT NULL,
  `create_at_antrian` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `antrian`
--

INSERT INTO `antrian` (`id`, `id_pasien`, `id_poli`, `no_antrian`, `create_at_antrian`) VALUES
(7, 6, 1, 1, '2021-10-01 14:56:13'),
(17, 6, 2, 1, '2021-10-05 08:35:57'),
(18, 6, 1, 1, '2021-10-05 08:36:07');

-- --------------------------------------------------------

--
-- Struktur dari tabel `dokter`
--

CREATE TABLE `dokter` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `bidang` varchar(100) NOT NULL,
  `status` enum('ada','tidak') NOT NULL,
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `dokter`
--

INSERT INTO `dokter` (`id`, `nama`, `bidang`, `status`, `create_at`) VALUES
(1, 'dr. Martina Yulianti, Sp PD FINASIM', 'Dokter Spesialis Obsgyn', 'ada', '2021-09-30 07:43:04'),
(2, 'dr. Rajiman, M.Kes, Sp.THT-KL', 'Dokter Spesialis Kesehatan Jiwa', 'tidak', '2021-09-30 07:43:04');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pasien`
--

CREATE TABLE `pasien` (
  `id` int(11) NOT NULL,
  `nama_pasien` varchar(50) NOT NULL,
  `no_kk` bigint(16) NOT NULL,
  `nik` bigint(16) NOT NULL,
  `nohp` bigint(15) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `jenkel` enum('laki-laki','perempuan') NOT NULL,
  `alamat` text NOT NULL,
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pasien`
--

INSERT INTO `pasien` (`id`, `nama_pasien`, `no_kk`, `nik`, `nohp`, `tgl_lahir`, `jenkel`, `alamat`, `create_at`) VALUES
(1, 'Oprah Ross', 838288084193887, 7966075420985262, 80386967916, '2003-08-18', 'laki-laki', 'Ap #981-7129 Nonummy Rd.', '2021-09-30 07:53:40'),
(2, 'Todd Clements', 6264929170612227, 3115449120795374, 84309003324, '2000-07-29', 'laki-laki', '424-5323 Nunc St.', '2021-09-30 07:53:40'),
(3, 'Acton Keith', 3772700499758658, 4475310285431417, 88218611628, '1993-03-05', 'perempuan', 'Ap #519-8901 Vel Ave', '2021-09-30 07:53:40'),
(4, 'Sonia Wagner', 4288554786704727, 376747953653042, 80638882325, '2004-02-05', 'laki-laki', 'Ap #697-2646 Neque. Av.', '2021-09-30 07:53:40'),
(5, 'Wing James', 9921580076085508, 9018008795229176, 81695308671, '2002-05-20', 'laki-laki', 'Ap #801-5605 Sed Rd.', '2021-09-30 07:53:40'),
(6, 'Khoirul Huda', 99215800760855, 1234567890123456, 85713728021, '1999-02-21', 'laki-laki', 'Dsn. Kenteng RT 01 / RW 07 Ds. Kenteng Kec. Toroh Kab. Grobogan', '2021-10-04 07:16:18');

-- --------------------------------------------------------

--
-- Struktur dari tabel `poli`
--

CREATE TABLE `poli` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `poli`
--

INSERT INTO `poli` (`id`, `nama`, `create_at`) VALUES
(1, 'Poli Kebidanan', '2021-09-30 07:54:27'),
(2, 'Poli Anak/Pediatrik', '2021-09-30 07:54:51');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `nama`, `username`, `password`) VALUES
(1, 'Admin', 'admin', '21232f297a57a5a743894a0e4a801fc3');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `antrian`
--
ALTER TABLE `antrian`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `dokter`
--
ALTER TABLE `dokter`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pasien`
--
ALTER TABLE `pasien`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `poli`
--
ALTER TABLE `poli`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `antrian`
--
ALTER TABLE `antrian`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT untuk tabel `dokter`
--
ALTER TABLE `dokter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `pasien`
--
ALTER TABLE `pasien`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `poli`
--
ALTER TABLE `poli`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
