-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Feb 02, 2017 at 11:15 AM
-- Server version: 10.1.9-MariaDB-log
-- PHP Version: 5.6.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `belajar`
--

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `naper` varchar(50) NOT NULL,
  `siup` varchar(20) NOT NULL,
  `notelp` varchar(20) NOT NULL,
  `napem` varchar(50) NOT NULL,
  `alamat` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`naper`, `siup`, `notelp`, `napem`, `alamat`) VALUES
('', '', '', '', ''),
(' PTPTLAH ', ' 159357 ', ' 0897848645 ', ' Loreman ', ' Diumpetin '),
('12', '2', '222222', '2', '2');

-- --------------------------------------------------------

--
-- Table structure for table `karyawan`
--

CREATE TABLE `karyawan` (
  `ktp` varchar(11) NOT NULL,
  `nakar` varchar(50) NOT NULL,
  `naper` varchar(50) NOT NULL,
  `notelp` varchar(20) NOT NULL,
  `alamat` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `karyawan`
--

INSERT INTO `karyawan` (`ktp`, `nakar`, `naper`, `notelp`, `alamat`) VALUES
('14045', 'Lorem', 'tes', '0878789764', 'asddsa');

-- --------------------------------------------------------

--
-- Table structure for table `kecamatan`
--

CREATE TABLE `kecamatan` (
  `id_kecamatan` int(11) NOT NULL,
  `id_kota_fk` int(11) DEFAULT NULL,
  `nama_kecamatan` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kecamatan`
--

INSERT INTO `kecamatan` (`id_kecamatan`, `id_kota_fk`, `nama_kecamatan`) VALUES
(1, 1, 'Asemrowo'),
(2, 1, 'Kenjeran'),
(3, 1, 'Rungkut'),
(4, 1, 'Wonokromo'),
(5, 2, 'Arjosari'),
(6, 2, 'Donomulyo'),
(7, 2, 'Tulungrejo'),
(8, 2, 'Kasembon'),
(9, 3, 'Banyumanik'),
(10, 3, 'Genuk'),
(11, 3, 'Tembalang'),
(12, 3, 'Tugu'),
(13, 4, 'Ngadirejo'),
(14, 4, 'Selogiri'),
(15, 4, 'Manyaran'),
(16, 4, 'Bulukerto'),
(17, 5, 'Buahbatu'),
(18, 5, 'Gedebage'),
(19, 5, 'Ujungberung'),
(20, 5, 'Sukasari'),
(21, 6, 'Plered'),
(22, 6, 'Jatiluhur'),
(23, 6, 'Wanayasa'),
(24, 6, 'Cibatu');

-- --------------------------------------------------------

--
-- Table structure for table `kota`
--

CREATE TABLE `kota` (
  `id_kota` int(11) NOT NULL,
  `id_provinsi_fk` int(11) DEFAULT NULL,
  `nama_kota` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kota`
--

INSERT INTO `kota` (`id_kota`, `id_provinsi_fk`, `nama_kota`) VALUES
(1, 1, 'Surabaya'),
(2, 1, 'Malang'),
(3, 2, 'Semarang'),
(4, 2, 'Wonogiri'),
(5, 3, 'Bandung'),
(6, 3, 'Purwakarta');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `id` int(11) NOT NULL,
  `user` varchar(10) NOT NULL,
  `pass` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`id`, `user`, `pass`) VALUES
(1, '1', 'admin'),
(2, '2', 'user');

-- --------------------------------------------------------

--
-- Table structure for table `pengaduan`
--

CREATE TABLE `pengaduan` (
  `notelp` varchar(20) NOT NULL,
  `napel` varchar(50) NOT NULL,
  `uraian` varchar(250) NOT NULL,
  `pihak` varchar(15) NOT NULL,
  `jabatan` varchar(15) NOT NULL,
  `klarifikasi` varchar(20) NOT NULL,
  `lembaga` varchar(15) NOT NULL,
  `upload` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pengaduan`
--

INSERT INTO `pengaduan` (`notelp`, `napel`, `uraian`, `pihak`, `jabatan`, `klarifikasi`, `lembaga`, `upload`) VALUES
('', '', '', '', '', 'Pilih Jabatan', 'Pilih Lembaga', ''),
('1', '12', ' 1', ' 1', ' 1', '', '', ''),
('2', '2', '2', '2', '2', 'dua', 'satu', ''),
('w', '', '', '', '', 'Pilih Jabatan', 'Pilih Lembaga', '');

-- --------------------------------------------------------

--
-- Table structure for table `provinsi`
--

CREATE TABLE `provinsi` (
  `id_provinsi` int(11) NOT NULL,
  `nama_provinsi` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `provinsi`
--

INSERT INTO `provinsi` (`id_provinsi`, `nama_provinsi`) VALUES
(1, 'Jawa Timur'),
(2, 'Jawa Tengah'),
(3, 'Jawa Barat');

-- --------------------------------------------------------

--
-- Table structure for table `smartcity`
--

CREATE TABLE `smartcity` (
  `sc_nik` varchar(255) NOT NULL,
  `sc_nama` varchar(255) NOT NULL,
  `sc_alamat` varchar(255) NOT NULL,
  `sc_keperluan` varchar(255) NOT NULL,
  `sc_ijazah` varchar(255) DEFAULT NULL,
  `sc_foto` varchar(255) DEFAULT NULL,
  `sc_pengantar` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `smartcity`
--

INSERT INTO `smartcity` (`sc_nik`, `sc_nama`, `sc_alamat`, `sc_keperluan`, `sc_ijazah`, `sc_foto`, `sc_pengantar`) VALUES
('1', 'lorem', 'jauh', 'akte', '1', '2', NULL),
('2', 'ipsum', 'deket', 'ktp', 'STATDAS2 (1).docx', 'FIKRI ZAIN_3215126551.pdf', 'Naskah Soal SBMPTN 2015 Tes Kemampuan Dasar Sains dan Teknologi (TKD Saintek) Kode Soal 522 by [pak-anang.blogspot.com].pdf'),
('3', '3', '3', 'ktp', NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`siup`);

--
-- Indexes for table `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`ktp`);

--
-- Indexes for table `kecamatan`
--
ALTER TABLE `kecamatan`
  ADD PRIMARY KEY (`id_kecamatan`);

--
-- Indexes for table `kota`
--
ALTER TABLE `kota`
  ADD PRIMARY KEY (`id_kota`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`user`);

--
-- Indexes for table `pengaduan`
--
ALTER TABLE `pengaduan`
  ADD PRIMARY KEY (`notelp`);

--
-- Indexes for table `provinsi`
--
ALTER TABLE `provinsi`
  ADD PRIMARY KEY (`id_provinsi`);

--
-- Indexes for table `smartcity`
--
ALTER TABLE `smartcity`
  ADD PRIMARY KEY (`sc_nik`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kecamatan`
--
ALTER TABLE `kecamatan`
  MODIFY `id_kecamatan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `kota`
--
ALTER TABLE `kota`
  MODIFY `id_kota` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;
--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `provinsi`
--
ALTER TABLE `provinsi`
  MODIFY `id_provinsi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
