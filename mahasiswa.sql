-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 12, 2021 at 10:19 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `apy_db`
--
CREATE DATABASE IF NOT EXISTS `apy_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `apy_db`;

-- --------------------------------------------------------

--
-- Table structure for table `inventaris`
--

CREATE TABLE `inventaris` (
  `id_inventaris` int(11) UNSIGNED NOT NULL,
  `nama` varchar(30) DEFAULT NULL,
  `kondisi` varchar(5) DEFAULT NULL,
  `keterangan` text DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `id_jenis` int(11) DEFAULT NULL,
  `tanggal_register` date DEFAULT NULL,
  `id_ruang` int(11) DEFAULT NULL,
  `kode_inventaris` varchar(20) DEFAULT NULL,
  `id_petugas` int(11) DEFAULT NULL,
  `asal_barang` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `inventaris`
--

INSERT INTO `inventaris` (`id_inventaris`, `nama`, `kondisi`, `keterangan`, `jumlah`, `id_jenis`, `tanggal_register`, `id_ruang`, `kode_inventaris`, `id_petugas`, `asal_barang`) VALUES
(73, 'Papan Tulis', 'Baik', '-', 11, 61, '2021-01-05', 24, 'A87686', 0, 'Hibah'),
(74, 'Laptop', 'Baik', '-', 5, 60, '2021-01-05', 25, 'A6588', 0, 'Bukan Hibah'),
(75, 'Printer', 'Baik', '-', 3, 60, '2021-01-05', 24, 'A3979', 0, 'Bukan Hibah');

-- --------------------------------------------------------

--
-- Table structure for table `jenis`
--

CREATE TABLE `jenis` (
  `id_jenis` int(11) UNSIGNED NOT NULL,
  `nama_jenis` varchar(30) DEFAULT NULL,
  `kode_jenis` varchar(20) DEFAULT NULL,
  `keterangan_jenis` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jenis`
--

INSERT INTO `jenis` (`id_jenis`, `nama_jenis`, `kode_jenis`, `keterangan_jenis`) VALUES
(60, 'Elektronik', 'B001', '-'),
(61, 'Non Elektronik', 'B002', '-'),
(65, 'elektronik', 'B003', '-');

-- --------------------------------------------------------

--
-- Table structure for table `pegawai`
--

CREATE TABLE `pegawai` (
  `id_pegawai` int(11) UNSIGNED NOT NULL,
  `nama_pegawai` varchar(30) DEFAULT NULL,
  `nik` int(15) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `jenis_kelamin` varchar(20) DEFAULT NULL,
  `telepon` int(15) DEFAULT NULL,
  `posisi` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pegawai`
--

INSERT INTO `pegawai` (`id_pegawai`, `nama_pegawai`, `nik`, `alamat`, `jenis_kelamin`, `telepon`, `posisi`) VALUES
(20, 'Suryadi', 2147483647, 'Jl. Gatot Subroto. no.21', 'Laki - laki', 2147483647, 'Guru'),
(21, 'Lina Agustin', 2147483647, 'Jl. Jendral Sudirman. No.05', 'Perempuan', 2147483647, 'Guru');

-- --------------------------------------------------------

--
-- Table structure for table `pengembalian`
--

CREATE TABLE `pengembalian` (
  `id_pengembalian` int(11) NOT NULL,
  `id_pegawai` int(11) NOT NULL,
  `nama_siswa` varchar(25) NOT NULL,
  `id_inventaris` int(11) NOT NULL,
  `jumlah_pinjam` int(11) NOT NULL,
  `tanggal_pinjam` date DEFAULT NULL,
  `tanggal_kembali` date DEFAULT NULL,
  `jam_pinjam` time DEFAULT NULL,
  `jam_kembali` time DEFAULT NULL,
  `status_peminjaman` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pengembalian`
--

INSERT INTO `pengembalian` (`id_pengembalian`, `id_pegawai`, `nama_siswa`, `id_inventaris`, `jumlah_pinjam`, `tanggal_pinjam`, `tanggal_kembali`, `jam_pinjam`, `jam_kembali`, `status_peminjaman`) VALUES
(47, 15, 'iugy', 59, 1, '2021-01-02', '2021-01-02', '14:36:46', '14:37:59', 'Dikembalikan'),
(48, 19, '', 63, 1, '2021-01-04', '2021-01-04', '08:30:27', '08:32:56', 'Dikembalikan'),
(49, 19, 'Rifki ', 63, 1, '2021-01-04', '2021-01-05', '00:00:00', '05:27:55', 'Dikembalikan'),
(50, 19, 'io', 63, 1, '2021-01-05', '2021-01-05', '00:00:00', '05:36:36', 'Dikembalikan'),
(51, 19, 'Rifki ', 63, 1, '2021-01-05', '2021-01-05', '00:00:00', '05:37:27', 'Dikembalikan'),
(53, 19, 'genandra', 72, 1, '2021-01-05', '2021-01-05', '05:46:18', '06:03:13', 'Dikembalikan'),
(54, 21, 'Rifki ', 74, 1, '2021-01-05', '2021-01-05', '14:08:04', '15:59:29', 'Dikembalikan');

-- --------------------------------------------------------

--
-- Table structure for table `pinjam`
--

CREATE TABLE `pinjam` (
  `id_pinjam` int(11) NOT NULL,
  `id_pegawai` int(11) NOT NULL,
  `nama_siswa` varchar(25) NOT NULL,
  `id_inventaris` int(11) NOT NULL,
  `jumlah_pinjam` int(11) NOT NULL,
  `tanggal_pinjam` date NOT NULL,
  `jam_pinjam` time DEFAULT NULL,
  `tanggal_kembali` date DEFAULT NULL,
  `status_peminjaman` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pinjam`
--

INSERT INTO `pinjam` (`id_pinjam`, `id_pegawai`, `nama_siswa`, `id_inventaris`, `jumlah_pinjam`, `tanggal_pinjam`, `jam_pinjam`, `tanggal_kembali`, `status_peminjaman`) VALUES
(85, 20, 'Adi', 73, 1, '2021-01-05', '15:58:04', NULL, 'Sedang dipinjam');

-- --------------------------------------------------------

--
-- Table structure for table `ruang`
--

CREATE TABLE `ruang` (
  `id_ruang` int(11) UNSIGNED NOT NULL,
  `nama_ruang` varchar(20) DEFAULT NULL,
  `kode_ruang` varchar(20) DEFAULT NULL,
  `keterangan_ruang` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ruang`
--

INSERT INTO `ruang` (`id_ruang`, `nama_ruang`, `kode_ruang`, `keterangan_ruang`) VALUES
(23, 'Lab TKJ', 'R001', '-'),
(24, 'Lab Multimedia', 'R002', '-'),
(25, 'Lab RPL', 'R003', '-'),
(26, 'Lab TSM', 'R004', '-');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) UNSIGNED NOT NULL,
  `username` varchar(15) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `nama_user` varchar(30) DEFAULT NULL,
  `id_level` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `username`, `password`, `nama_user`, `id_level`) VALUES
(1, 'admin', '356a192b7913b04c54574d18c28d46e6395428ab', 'Admin', 1),
(2, 'kepsek', 'da4b9237bacccdf19c0760cab7aec4a8359010b0', 'Kepala Sekolah', 2),
(3, 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'Administrator', 1),
(4, 'kepalasekolah', 'b662544d3fc7d4933a6d7bc935a6149275cf55f6', 'Kepala Sekolah', 2),
(5, 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'Administrator', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `inventaris`
--
ALTER TABLE `inventaris`
  ADD PRIMARY KEY (`id_inventaris`);

--
-- Indexes for table `jenis`
--
ALTER TABLE `jenis`
  ADD PRIMARY KEY (`id_jenis`);

--
-- Indexes for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`id_pegawai`);

--
-- Indexes for table `pengembalian`
--
ALTER TABLE `pengembalian`
  ADD PRIMARY KEY (`id_pengembalian`);

--
-- Indexes for table `pinjam`
--
ALTER TABLE `pinjam`
  ADD PRIMARY KEY (`id_pinjam`);

--
-- Indexes for table `ruang`
--
ALTER TABLE `ruang`
  ADD PRIMARY KEY (`id_ruang`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `inventaris`
--
ALTER TABLE `inventaris`
  MODIFY `id_inventaris` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `jenis`
--
ALTER TABLE `jenis`
  MODIFY `id_jenis` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `pegawai`
--
ALTER TABLE `pegawai`
  MODIFY `id_pegawai` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `pengembalian`
--
ALTER TABLE `pengembalian`
  MODIFY `id_pengembalian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `pinjam`
--
ALTER TABLE `pinjam`
  MODIFY `id_pinjam` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT for table `ruang`
--
ALTER TABLE `ruang`
  MODIFY `id_ruang` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- Database: `coffeeshop`
--
CREATE DATABASE IF NOT EXISTS `coffeeshop` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `coffeeshop`;

-- --------------------------------------------------------

--
-- Table structure for table `kopi`
--

CREATE TABLE `kopi` (
  `Kode_Kopi` varchar(5) NOT NULL,
  `Nama` varchar(20) NOT NULL,
  `Harga` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kopi`
--

INSERT INTO `kopi` (`Kode_Kopi`, `Nama`, `Harga`) VALUES
('C001', 'Expresso', 12000),
('C002', 'Cappuccinos', 15000),
('C003', 'Frapuccino', 8000),
('C004', 'American grip', 17000),
('C005', 'Expresso Susu', 17000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kopi`
--
ALTER TABLE `kopi`
  ADD PRIMARY KEY (`Kode_Kopi`);
--
-- Database: `db_karyawan`
--
CREATE DATABASE IF NOT EXISTS `db_karyawan` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `db_karyawan`;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(10) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `level` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `data`
--

CREATE TABLE `data` (
  `Nomor_Pegawai` varchar(10) NOT NULL,
  `Nama` varchar(30) NOT NULL,
  `Jenis_Kelamin` varchar(20) NOT NULL,
  `Status` varchar(20) NOT NULL,
  `Tanggal_Lahir` date NOT NULL,
  `Alamat` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `table_karyawan`
--

CREATE TABLE `table_karyawan` (
  `no_pegawai` varchar(50) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `kelamin` varchar(10) NOT NULL,
  `status` varchar(50) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `alamat` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `table_karyawan`
--

INSERT INTO `table_karyawan` (`no_pegawai`, `nama`, `kelamin`, `status`, `tanggal_lahir`, `alamat`) VALUES
('Kar01', 'Udin', 'Laki-laki', 'Menikah', '2000-08-09', 'Manyar');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- Database: `db_mahasiswa`
--
CREATE DATABASE IF NOT EXISTS `db_mahasiswa` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `db_mahasiswa`;

-- --------------------------------------------------------

--
-- Table structure for table `tb_mahasiswa`
--

CREATE TABLE `tb_mahasiswa` (
  `nim` varchar(50) NOT NULL,
  `nama` text NOT NULL,
  `kelas` varchar(10) NOT NULL,
  `jurusan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_mahasiswa`
--

INSERT INTO `tb_mahasiswa` (`nim`, `nama`, `kelas`, `jurusan`) VALUES
('1903052', 'Naufal Ramdhan', 'D3TI2B', 'Teknik Infromatika');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_mahasiswa`
--
ALTER TABLE `tb_mahasiswa`
  ADD PRIMARY KEY (`nim`);
--
-- Database: `inv`
--
CREATE DATABASE IF NOT EXISTS `inv` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `inv`;

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id_barang` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `jenis` varchar(30) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `keterangan` text NOT NULL,
  `kondisi` varchar(20) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `tgl_regis` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `detail_pinjam`
--

CREATE TABLE `detail_pinjam` (
  `id_detail` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `peminjam` varchar(50) NOT NULL,
  `id_peminjaman` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `peminjaman`
--

CREATE TABLE `peminjaman` (
  `id_peminjaman` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `tgl_pinjam` date NOT NULL,
  `tgl_kembali` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indexes for table `detail_pinjam`
--
ALTER TABLE `detail_pinjam`
  ADD PRIMARY KEY (`id_detail`);

--
-- Indexes for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`id_peminjaman`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `id_barang` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `detail_pinjam`
--
ALTER TABLE `detail_pinjam`
  MODIFY `id_detail` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `peminjaman`
--
ALTER TABLE `peminjaman`
  MODIFY `id_peminjaman` int(11) NOT NULL AUTO_INCREMENT;
--
-- Database: `karyawan`
--
CREATE DATABASE IF NOT EXISTS `karyawan` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `karyawan`;

-- --------------------------------------------------------

--
-- Table structure for table `table_karyawan`
--

CREATE TABLE `table_karyawan` (
  `no_pegawai` varchar(50) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `kelamin` varchar(10) NOT NULL,
  `status` varchar(50) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `alamat` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `table_karyawan`
--

INSERT INTO `table_karyawan` (`no_pegawai`, `nama`, `kelamin`, `status`, `tanggal_lahir`, `alamat`) VALUES
('Kar02', 'Joko', 'Laki-laki', 'Menikah', '1998-01-02', 'Kehitam'),
('Kar03', 'Andi', 'Laki-laki', 'Belum Menikah', '1997-08-21', 'Mulyokarta'),
('Kar04', 'Sari', 'Perempuan', 'Belum Menikah', '1998-05-23', 'Meikartu'),
('Kar05', 'Nida', 'Perempuan', 'Menikah', '1995-08-09', 'Bandung'),
('Kar06', 'Indah', 'Perempuan', 'Belum Menikah', '2000-07-01', 'Indramayu'),
('kar07', 'Gerri', 'Laki-laki', 'Belum Menikah', '2001-01-16', 'Jakarta');
--
-- Database: `kasir_cofe`
--
CREATE DATABASE IF NOT EXISTS `kasir_cofe` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `kasir_cofe`;

-- --------------------------------------------------------

--
-- Table structure for table `data_jenis_menu`
--

CREATE TABLE `data_jenis_menu` (
  `id` int(11) NOT NULL,
  `nama_jenis_menu` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `data_jenis_menu`
--

INSERT INTO `data_jenis_menu` (`id`, `nama_jenis_menu`) VALUES
(1, 'Makanan'),
(2, 'Minuman'),
(3, 'Snack');

-- --------------------------------------------------------

--
-- Table structure for table `data_menu`
--

CREATE TABLE `data_menu` (
  `kode_menu` varchar(50) NOT NULL,
  `nama_menu` varchar(50) NOT NULL,
  `harga_menu` double DEFAULT 0,
  `diskon_menu` double DEFAULT 0,
  `id_jenis_menu` int(11) NOT NULL,
  `satuan` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `data_menu`
--

INSERT INTO `data_menu` (`kode_menu`, `nama_menu`, `harga_menu`, `diskon_menu`, `id_jenis_menu`, `satuan`) VALUES
('111111', 'Nasi Goreng', 20000, 10, 1, 'Porsi'),
('121212', 'Nasi Goreng Ayam Kalasan', 25000, 0, 1, 'Porsi'),
('122211', 'Kentang Goreng Balado', 15000, 0, 3, 'Porsi'),
('123123', 'Ice Capocino Cincau', 15000, 0, 2, 'Gelas'),
('123456', 'Nasi Goreng Biasa', 14000, 0, 1, 'Porsi');

-- --------------------------------------------------------

--
-- Table structure for table `data_menu_foto`
--

CREATE TABLE `data_menu_foto` (
  `id` int(11) NOT NULL,
  `kode_menu` varchar(50) DEFAULT NULL,
  `foto` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `data_menu_foto`
--

INSERT INTO `data_menu_foto` (`id`, `kode_menu`, `foto`) VALUES
(3, '111111', '11052018122003.png'),
(4, '111111', '11052018122128.png'),
(5, '123456', '11052018122346.png'),
(6, '123456', '11052018122423.png'),
(7, '111111', '12052018222325.png'),
(8, '123123', '16052018235731.png'),
(9, '122211', '17052018193743.png');

-- --------------------------------------------------------

--
-- Table structure for table `profil`
--

CREATE TABLE `profil` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `logo_cofe` varchar(100) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `kota` varchar(100) DEFAULT NULL,
  `no_telpon` varchar(100) DEFAULT NULL,
  `ppn` double DEFAULT 0,
  `catatan_kaki` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `profil`
--

INSERT INTO `profil` (`id`, `nama`, `logo_cofe`, `alamat`, `kota`, `no_telpon`, `ppn`, `catatan_kaki`) VALUES
(1, 'HERO KAFFE', '21052018211918.png', '<p>Jl. Hevea Baru</p>\r\n<p>Jl.</p>', 'Barabai', '085249134144', 10, 'For Coming Soon');

-- --------------------------------------------------------

--
-- Table structure for table `temporary_order_detail`
--

CREATE TABLE `temporary_order_detail` (
  `kode_order` varchar(50) NOT NULL,
  `kode_menu` varchar(50) NOT NULL,
  `nama_menu` varchar(50) DEFAULT NULL,
  `harga_menu` double DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `satuan` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `trans_order`
--

CREATE TABLE `trans_order` (
  `kode_order` varchar(50) NOT NULL,
  `id_user` varchar(50) NOT NULL,
  `diskon` int(11) NOT NULL,
  `no_meja` varchar(50) NOT NULL,
  `tanggal` date NOT NULL,
  `jam` time NOT NULL,
  `tunai` double DEFAULT NULL,
  `ppn` double DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `trans_order`
--

INSERT INTO `trans_order` (`kode_order`, `id_user`, `diskon`, `no_meja`, `tanggal`, `jam`, `tunai`, `ppn`) VALUES
('Ord-3b819e', '3', 0, '1', '2018-05-18', '12:56:04', 100000, NULL),
('Ord-5c0109', '3', 0, '12', '2018-05-21', '22:30:15', 60000, NULL),
('Ord-6251e2', '4', 10, '1', '2018-05-21', '15:03:57', 100000, NULL),
('Ord-9e4193', '1', 0, '2', '2018-05-23', '20:50:55', 100000, 10),
('Ord-9ea427', '3', 0, '3', '2018-05-21', '08:23:52', 100000, NULL),
('Ord-d00e55', '1', 0, '1', '2018-05-19', '11:25:37', 100000, NULL),
('Ord-fe3df8', '3', 0, '3', '2018-05-19', '19:32:09', 150000, NULL);

--
-- Triggers `trans_order`
--
DELIMITER $$
CREATE TRIGGER `trans_order_after_delete` AFTER DELETE ON `trans_order` FOR EACH ROW BEGIN
delete from trans_order_detail where kode_order=old.kode_order;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `trans_order_detail`
--

CREATE TABLE `trans_order_detail` (
  `kode_order` varchar(50) NOT NULL,
  `kode_menu` varchar(50) NOT NULL,
  `nama_menu` varchar(50) DEFAULT NULL,
  `harga_menu` double DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `satuan` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `trans_order_detail`
--

INSERT INTO `trans_order_detail` (`kode_order`, `kode_menu`, `nama_menu`, `harga_menu`, `qty`, `satuan`) VALUES
('Ord-3b819e', '111111', 'Nasi Goreng', 18000, 1, 'Porsi'),
('Ord-3b819e', '121212', 'Nasi Goreng Ayam Kalasan', 25000, 1, 'Porsi'),
('Ord-5c0109', '111111', 'Nasi Goreng', 18000, 1, 'Porsi'),
('Ord-5c0109', '121212', 'Nasi Goreng Ayam Kalasan', 25000, 1, 'Porsi'),
('Ord-5c0109', '122211', 'Kentang Goreng Balado', 15000, 1, 'Porsi'),
('Ord-6251e2', '121212', 'Nasi Goreng Ayam Kalasan', 25000, 1, 'Porsi'),
('Ord-6251e2', '122211', 'Kentang Goreng Balado', 15000, 1, 'Porsi'),
('Ord-9e4193', '121212', 'Nasi Goreng Ayam Kalasan', 25000, 2, 'Porsi'),
('Ord-9e4193', '122211', 'Kentang Goreng Balado', 15000, 2, 'Porsi'),
('Ord-9ea427', '111111', 'Nasi Goreng', 18000, 1, 'Porsi'),
('Ord-9ea427', '121212', 'Nasi Goreng Ayam Kalasan', 25000, 1, 'Porsi'),
('Ord-9ea427', '123123', 'Ice Capocino Cincau', 15000, 1, 'Gelas'),
('Ord-d00e55', '111111', 'Nasi Goreng', 18000, 1, 'Porsi'),
('Ord-d00e55', '121212', 'Nasi Goreng Ayam Kalasan', 25000, 1, 'Porsi'),
('Ord-d00e55', '122211', 'Kentang Goreng Balado', 15000, 1, 'Porsi'),
('Ord-d00e55', '123123', 'Ice Capocino Cincau', 15000, 1, 'Gelas'),
('Ord-fe3df8', '111111', 'Nasi Goreng', 18000, 2, 'Porsi'),
('Ord-fe3df8', '121212', 'Nasi Goreng Ayam Kalasan', 25000, 2, 'Porsi'),
('Ord-fe3df8', '122211', 'Kentang Goreng Balado', 15000, 1, 'Porsi'),
('Ord-fe3df8', '123123', 'Ice Capocino Cincau', 15000, 1, 'Gelas'),
('Ord-fe3df8', '123456', 'Nasi Goreng Biasa', 14000, 1, 'Porsi');

-- --------------------------------------------------------

--
-- Table structure for table `trans_pengeluaran`
--

CREATE TABLE `trans_pengeluaran` (
  `id` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `nama_belanja` varchar(225) DEFAULT NULL,
  `harga` double DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `trans_pengeluaran`
--

INSERT INTO `trans_pengeluaran` (`id`, `tanggal`, `id_user`, `nama_belanja`, `harga`) VALUES
(1, '2018-05-19', 1, 'Gula Pasir', 12500),
(2, '2018-05-18', 1, 'Gula Arin', 10000),
(4, '2018-05-19', 3, 'Listrik', 22500),
(5, '2018-05-19', 1, 'Beras 1 Kg', 10000),
(6, '2018-05-19', 3, 'Belanja Nota', 5000),
(7, '2018-05-19', 3, 'Beras', 12000),
(8, '2018-05-19', 3, 'a', 22000),
(9, '2018-05-21', 3, 'GulaPAsir', 12500),
(10, '2018-05-21', 1, 'Gula Pasir', 12500),
(11, '2018-05-21', 4, 'Listrik', 52500);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(50) NOT NULL,
  `level_user` int(11) NOT NULL,
  `nama_admin` varchar(128) NOT NULL,
  `foto` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `no_telpon` varchar(25) NOT NULL DEFAULT '08',
  `is_active` bit(1) DEFAULT b'0',
  `last_login_dt` date NOT NULL,
  `last_login_tm` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `level_user`, `nama_admin`, `foto`, `email`, `no_telpon`, `is_active`, `last_login_dt`, `last_login_tm`) VALUES
(1, 'admin', 'admin', 1, 'Yusda Helmani', '19052018193514.png', 'yusdahelmani@gmail.com', '08', b'1', '2018-04-26', '2008-04-28'),
(3, 'kasir1', '12345', 2, 'Andika', '21052018150751.png', 'adndika@gamil.com', '085348824545', b'1', '0000-00-00', '0000-00-00'),
(4, 'kasir2', '12345', 2, 'Yamin Subarja', '', 'yamin@gmail.com', '08', b'1', '0000-00-00', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `user_level`
--

CREATE TABLE `user_level` (
  `id` int(11) NOT NULL,
  `level_user` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_level`
--

INSERT INTO `user_level` (`id`, `level_user`) VALUES
(1, 'admin'),
(2, 'kasir');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `data_jenis_menu`
--
ALTER TABLE `data_jenis_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_menu`
--
ALTER TABLE `data_menu`
  ADD PRIMARY KEY (`kode_menu`),
  ADD KEY `FK_data_menu_data_jenis_menu` (`id_jenis_menu`);

--
-- Indexes for table `data_menu_foto`
--
ALTER TABLE `data_menu_foto`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `profil`
--
ALTER TABLE `profil`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `temporary_order_detail`
--
ALTER TABLE `temporary_order_detail`
  ADD PRIMARY KEY (`kode_order`,`kode_menu`);

--
-- Indexes for table `trans_order`
--
ALTER TABLE `trans_order`
  ADD PRIMARY KEY (`kode_order`);

--
-- Indexes for table `trans_order_detail`
--
ALTER TABLE `trans_order_detail`
  ADD PRIMARY KEY (`kode_order`,`kode_menu`);

--
-- Indexes for table `trans_pengeluaran`
--
ALTER TABLE `trans_pengeluaran`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_level`
--
ALTER TABLE `user_level`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `data_jenis_menu`
--
ALTER TABLE `data_jenis_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `data_menu_foto`
--
ALTER TABLE `data_menu_foto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `profil`
--
ALTER TABLE `profil`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `trans_pengeluaran`
--
ALTER TABLE `trans_pengeluaran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user_level`
--
ALTER TABLE `user_level`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `data_menu`
--
ALTER TABLE `data_menu`
  ADD CONSTRAINT `FK_data_menu_data_jenis_menu` FOREIGN KEY (`id_jenis_menu`) REFERENCES `data_jenis_menu` (`id`);
--
-- Database: `kasir_coffe`
--
CREATE DATABASE IF NOT EXISTS `kasir_coffe` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `kasir_coffe`;
--
-- Database: `latihanyii1`
--
CREATE DATABASE IF NOT EXISTS `latihanyii1` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `latihanyii1`;

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `Nim` int(11) NOT NULL,
  `Nama` varchar(50) NOT NULL,
  `Jurusan` varchar(50) NOT NULL,
  `TTL` varchar(50) NOT NULL,
  `Alamat` varchar(70) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`Nim`, `Nama`, `Jurusan`, `TTL`, `Alamat`) VALUES
(2, 'Ayu Nurul', 'Teknik Informatika', 'Indramayu, 01 Mei 2000', 'Indramayu'),
(3, 'Indah Rosalia', 'Teknik Informatika', 'Indramayu, 01 Juli 2000', 'Sindang');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`Nim`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  MODIFY `Nim` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Database: `lat_procedure`
--
CREATE DATABASE IF NOT EXISTS `lat_procedure` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `lat_procedure`;

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `NIM` int(10) NOT NULL,
  `Nama` varchar(25) NOT NULL,
  `Jenis_kelamin` varchar(15) NOT NULL,
  `Alamat` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
--
-- Database: `mahasiswa`
--
CREATE DATABASE IF NOT EXISTS `mahasiswa` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `mahasiswa`;

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `ID_Mahasiswa` int(15) NOT NULL,
  `Nama` varchar(30) NOT NULL,
  `Kelas` varchar(10) NOT NULL,
  `Jurusan` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
--
-- Database: `pemesananbaju`
--
CREATE DATABASE IF NOT EXISTS `pemesananbaju` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `pemesananbaju`;

-- --------------------------------------------------------

--
-- Table structure for table `baju`
--

CREATE TABLE `baju` (
  `KodeBaju` varchar(5) NOT NULL,
  `NamaBaju` varchar(30) NOT NULL,
  `Harga` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `baju`
--

INSERT INTO `baju` (`KodeBaju`, `NamaBaju`, `Harga`) VALUES
('b02', 'Kemeja', 100000),
('b03', 'Cardigan', 120000),
('b04', 'jaket', 180000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `baju`
--
ALTER TABLE `baju`
  ADD PRIMARY KEY (`KodeBaju`);
--
-- Database: `penjualan_db`
--
CREATE DATABASE IF NOT EXISTS `penjualan_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `penjualan_db`;

-- --------------------------------------------------------

--
-- Table structure for table `pj_akses`
--

CREATE TABLE `pj_akses` (
  `id_akses` tinyint(1) UNSIGNED NOT NULL,
  `label` varchar(10) NOT NULL,
  `level_akses` varchar(15) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pj_akses`
--

INSERT INTO `pj_akses` (`id_akses`, `label`, `level_akses`) VALUES
(1, 'admin', 'Administrator'),
(2, 'kasir', 'Staff Kasir'),
(3, 'inventory', 'Staff Inventory'),
(4, 'keuangan', 'Staff Keuangan');

-- --------------------------------------------------------

--
-- Table structure for table `pj_barang`
--

CREATE TABLE `pj_barang` (
  `id_barang` int(1) UNSIGNED NOT NULL,
  `kode_barang` varchar(40) NOT NULL,
  `nama_barang` varchar(60) NOT NULL,
  `total_stok` mediumint(1) UNSIGNED NOT NULL,
  `harga` decimal(10,0) NOT NULL,
  `id_kategori_barang` mediumint(1) UNSIGNED NOT NULL,
  `id_merk_barang` mediumint(1) UNSIGNED DEFAULT NULL,
  `keterangan` text NOT NULL,
  `dihapus` enum('tidak','ya') NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pj_barang`
--

INSERT INTO `pj_barang` (`id_barang`, `kode_barang`, `nama_barang`, `total_stok`, `harga`, `id_kategori_barang`, `id_merk_barang`, `keterangan`, `dihapus`) VALUES
(1, '0001', 'Nike Sport C993', 3, '400000', 1, 2, '', 'tidak'),
(2, '0002', 'Runme Everynight Y98', 43, '120000', 3, 6, '', 'tidak'),
(3, '0003', 'My Lovely Bag 877', 29, '350000', 2, 3, '', 'tidak'),
(4, '0004', 'Quick Silver Gaul', 15, '35000', 3, 5, '', 'tidak'),
(5, '0005', 'My Cool Shoes', 39, '550000', 1, 2, '', 'tidak'),
(6, '3453453', 'Testing', 45, '929992', 1, 6, '', 'ya'),
(7, '9982429', 'Tes ada', 67, '600000', 3, 3, '', 'ya'),
(8, '8787829', 'Yes desk', 88, '999999', 1, 3, '', 'ya'),
(9, '0009', 'Test', 18, '100000', 3, 1, '', 'ya'),
(10, '99989', 'Test', 9, '99', 1, 2, '', 'ya'),
(11, '00010', 'Rinso', 16, '30000', 3, NULL, '', 'tidak'),
(12, '00011', 'mouse', 20, '20000', 3, 1, '', 'tidak'),
(13, '00012', 'Soklin Lantai', 20, '3000', 3, 1, '', 'tidak'),
(14, '00013', 'Beras Merah', 15, '2000', 3, 1, '', 'tidak'),
(16, '00018', 'Testing', 20, '3000', 4, 3, '', 'tidak');

-- --------------------------------------------------------

--
-- Table structure for table `pj_ci_sessions`
--

CREATE TABLE `pj_ci_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pj_ci_sessions`
--

INSERT INTO `pj_ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('9830f6a823ae8a8119f451cae9ac1a154a724f9d', '127.0.0.1', 1594809326, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343830393032373b61705f69645f757365727c733a313a2231223b61705f70617373776f72647c733a34303a2264303333653232616533343861656235363630666332313430616563333538353063346461393937223b61705f6e616d617c733a31303a2242616e672041646d696e223b61705f6c6576656c7c733a353a2261646d696e223b61705f6c6576656c5f63617074696f6e7c733a31333a2241646d696e6973747261746f72223b),
('27598aeb7afea7ce511d4422a15f79f9701d053a', '127.0.0.1', 1594809368, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343830393333343b61705f69645f757365727c733a313a2231223b61705f70617373776f72647c733a34303a2264303333653232616533343861656235363630666332313430616563333538353063346461393937223b61705f6e616d617c733a31303a2242616e672041646d696e223b61705f6c6576656c7c733a353a2261646d696e223b61705f6c6576656c5f63617074696f6e7c733a31333a2241646d696e6973747261746f72223b),
('52c9e57395ab86892799da9b5da7766505c67ff7', '127.0.0.1', 1594810675, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343830393833343b61705f69645f757365727c733a313a2231223b61705f70617373776f72647c733a34303a2264303333653232616533343861656235363630666332313430616563333538353063346461393937223b61705f6e616d617c733a31303a2242616e672041646d696e223b61705f6c6576656c7c733a353a2261646d696e223b61705f6c6576656c5f63617074696f6e7c733a31333a2241646d696e6973747261746f72223b),
('34511511c2653918d7eeadd8d22516b6f7cc79d5', '127.0.0.1', 1594810913, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343831303637373b61705f69645f757365727c733a313a2231223b61705f70617373776f72647c733a34303a2264303333653232616533343861656235363630666332313430616563333538353063346461393937223b61705f6e616d617c733a31303a2242616e672041646d696e223b61705f6c6576656c7c733a353a2261646d696e223b61705f6c6576656c5f63617074696f6e7c733a31333a2241646d696e6973747261746f72223b),
('9639e0cd81df0e6545501d192b2905eb758103e3', '127.0.0.1', 1594811445, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343831313036363b61705f69645f757365727c733a313a2231223b61705f70617373776f72647c733a34303a2264303333653232616533343861656235363630666332313430616563333538353063346461393937223b61705f6e616d617c733a31303a2242616e672041646d696e223b61705f6c6576656c7c733a353a2261646d696e223b61705f6c6576656c5f63617074696f6e7c733a31333a2241646d696e6973747261746f72223b),
('3f33dd75dd690d8724011dfc3ab85a4ad4171bef', '127.0.0.1', 1594811454, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343831313434363b61705f69645f757365727c733a313a2231223b61705f70617373776f72647c733a34303a2264303333653232616533343861656235363630666332313430616563333538353063346461393937223b61705f6e616d617c733a31303a2242616e672041646d696e223b61705f6c6576656c7c733a353a2261646d696e223b61705f6c6576656c5f63617074696f6e7c733a31333a2241646d696e6973747261746f72223b),
('7f541e687ccfa51b09ab7aef74dd6a937acda65b', '::1', 1594812476, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343831323239313b),
('b93c27fefb07c64a4ebdccdee44caa38d18fd064', '::1', 1596116095, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539363131353931313b),
('d6728ae3d52d0aca33e27f3be8c8e77e7c682e25', '::1', 1596117021, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539363131363931333b),
('ede45e56347ad29fa2696932f0014a70f4e64efb', '::1', 1596117198, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539363131363933363b),
('15cf6cac0d1909559dd8481839a4d6141eb955f4', '::1', 1596117605, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539363131373331313b61705f69645f757365727c733a313a2231223b61705f70617373776f72647c733a34303a2264303333653232616533343861656235363630666332313430616563333538353063346461393937223b61705f6e616d617c733a31303a2242616e672041646d696e223b61705f6c6576656c7c733a353a2261646d696e223b61705f6c6576656c5f63617074696f6e7c733a31333a2241646d696e6973747261746f72223b),
('e0896226912132a5b4b8e0c679cf71a08996c385', '::1', 1596117859, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539363131373631383b61705f69645f757365727c733a313a2232223b61705f70617373776f72647c733a34303a2238363931653466633533623939646135343463653836653232616362613632643133333532656666223b61705f6e616d617c733a373a2243656e74696e69223b61705f6c6576656c7c733a353a226b61736972223b61705f6c6576656c5f63617074696f6e7c733a31313a225374616666204b61736972223b),
('2qfr4bq8iii3buk6nd21gamvph', '::1', 1615958665, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353935383636353b),
('o2t8ivp6g2ss0a4iq9i360t60g', '::1', 1615958677, 0x61705f69645f757365727c733a313a2231223b61705f70617373776f72647c733a34303a2264303333653232616533343861656235363630666332313430616563333538353063346461393937223b61705f6e616d617c733a31303a2242616e672041646d696e223b61705f6c6576656c7c733a353a2261646d696e223b61705f6c6576656c5f63617074696f6e7c733a31333a2241646d696e6973747261746f72223b),
('n044rukmtnsgij0nu01motk0vs', '::1', 1615958677, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353935383637373b),
('gscqpr34b4ik6v7fu3d9qth0c8', '::1', 1615958677, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353935383637373b),
('d2vstgfj3cvhpml07960n5oi6a', '::1', 1615958686, 0x61705f69645f757365727c733a313a2231223b61705f70617373776f72647c733a34303a2264303333653232616533343861656235363630666332313430616563333538353063346461393937223b61705f6e616d617c733a31303a2242616e672041646d696e223b61705f6c6576656c7c733a353a2261646d696e223b61705f6c6576656c5f63617074696f6e7c733a31333a2241646d696e6973747261746f72223b),
('0ppbr71j5ifert3tni5cm8clbe', '::1', 1615958686, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353935383638363b),
('9tosvb7al0s4k51cmfeem9l2lb', '::1', 1615958686, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353935383638363b),
('5m6vnbcrnmec7oush5t2s1vcpg', '::1', 1615958709, 0x61705f69645f757365727c733a313a2231223b61705f70617373776f72647c733a34303a2264303333653232616533343861656235363630666332313430616563333538353063346461393937223b61705f6e616d617c733a31303a2242616e672041646d696e223b61705f6c6576656c7c733a353a2261646d696e223b61705f6c6576656c5f63617074696f6e7c733a31333a2241646d696e6973747261746f72223b),
('ts8tivi7klsm5cnepbfknphgdn', '::1', 1615958709, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353935383730393b),
('2315do0p3ge7k42gs7vejb0nk3', '::1', 1615958709, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353935383730393b),
('7pv2dapjd2a7qaar75phbei439', '::1', 1615958865, 0x61705f69645f757365727c733a313a2231223b61705f70617373776f72647c733a34303a2264303333653232616533343861656235363630666332313430616563333538353063346461393937223b61705f6e616d617c733a31303a2242616e672041646d696e223b61705f6c6576656c7c733a353a2261646d696e223b61705f6c6576656c5f63617074696f6e7c733a31333a2241646d696e6973747261746f72223b),
('2jrcread4ccamo5bacpolvdvs7', '::1', 1615958865, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353935383836353b),
('05a8bv1qmm3ttakf05sg2io7c3', '::1', 1615958866, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353935383836363b),
('gbora5om0vspsfnmnr40silr27', '::1', 1615958913, ''),
('ms369so39etb5hi1jetsgo7c00', '::1', 1615958944, ''),
('s6me0qm1tfem90j46aeqjj93sf', '::1', 1615958948, ''),
('1c01d4aud0i04p0qa8u1b85a30', '::1', 1615958960, ''),
('ie7q1qu68n8q8vspendb1fqpmj', '::1', 1615958973, ''),
('petmhaa951eoho0nqnhqcinfv1', '::1', 1615959088, ''),
('etj1t2d2knpus8rifjmmtip3sd', '::1', 1615959091, ''),
('m5fdvfsps6c3uvaq9bu7on87dk', '::1', 1615959098, ''),
('t0ofl92p9a40eeglmgi3k341bo', '::1', 1615959106, ''),
('ieq7gq7j453a5anvou738cihp5', '::1', 1618544008, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631383534343030383b);

-- --------------------------------------------------------

--
-- Table structure for table `pj_kategori_barang`
--

CREATE TABLE `pj_kategori_barang` (
  `id_kategori_barang` mediumint(1) UNSIGNED NOT NULL,
  `kategori` varchar(40) NOT NULL,
  `dihapus` enum('tidak','ya') NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pj_kategori_barang`
--

INSERT INTO `pj_kategori_barang` (`id_kategori_barang`, `kategori`, `dihapus`) VALUES
(1, 'Sepatu', 'ya'),
(2, 'Tas', 'tidak'),
(3, 'Baju', 'tidak'),
(4, 'Celana', 'tidak'),
(5, 'Topi', 'ya'),
(6, 'Gelang', 'ya'),
(7, 'Jam', 'ya'),
(8, 'Topi', 'tidak');

-- --------------------------------------------------------

--
-- Table structure for table `pj_merk_barang`
--

CREATE TABLE `pj_merk_barang` (
  `id_merk_barang` mediumint(1) UNSIGNED NOT NULL,
  `merk` varchar(40) NOT NULL,
  `dihapus` enum('tidak','ya') NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pj_merk_barang`
--

INSERT INTO `pj_merk_barang` (`id_merk_barang`, `merk`, `dihapus`) VALUES
(1, 'Adidas', 'tidak'),
(2, 'Nike', 'tidak'),
(3, 'BodyPack', 'tidak'),
(4, 'Jansport', 'tidak'),
(5, 'Nevada', 'tidak'),
(6, 'Jackloth', 'tidak'),
(7, 'Pierro', 'ya'),
(8, 'Pierro', 'ya'),
(9, 'Pierro', 'ya'),
(10, 'Converse', 'tidak'),
(11, 'Piero', 'ya'),
(12, 'Teen', 'ya'),
(13, 'adass2', 'ya'),
(14, 'asda', 'ya'),
(15, 'sada3', 'ya'),
(16, 'asda 3', 'ya'),
(17, '333', 'ya');

-- --------------------------------------------------------

--
-- Table structure for table `pj_pelanggan`
--

CREATE TABLE `pj_pelanggan` (
  `id_pelanggan` mediumint(1) UNSIGNED NOT NULL,
  `nama` varchar(40) NOT NULL,
  `alamat` text DEFAULT NULL,
  `telp` varchar(40) DEFAULT NULL,
  `info_tambahan` text DEFAULT NULL,
  `kode_unik` varchar(30) NOT NULL,
  `waktu_input` datetime NOT NULL,
  `dihapus` enum('tidak','ya') NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pj_pelanggan`
--

INSERT INTO `pj_pelanggan` (`id_pelanggan`, `nama`, `alamat`, `telp`, `info_tambahan`, `kode_unik`, `waktu_input`, `dihapus`) VALUES
(1, 'Pak Udin', 'Jalan Kayumanis 2 Baru', '08838493439', 'Testtt', '', '2016-05-07 22:44:25', 'ya'),
(2, 'Pak Jarwo', 'Kemanggisan deket binus', '4353535353', NULL, '', '2016-05-07 22:44:49', 'tidak'),
(3, 'Joko', 'Kayumanis', '08773682882', '', '', '2016-05-23 16:31:47', 'tidak'),
(4, 'Budi', 'Salemba', '089930393829', 'Testing', '', '2016-05-23 16:33:00', 'ya'),
(5, 'Mira', 'Pisangan', '09938829232', '', '', '2016-05-23 16:36:45', 'tidak'),
(6, 'Deden', 'Jauh', '990393', 'Test', '', '2016-05-24 20:54:58', 'ya'),
(7, 'Jamil', 'Berlan', '0934934939', '', '14640998941', '2016-05-24 21:24:54', 'tidak'),
(8, 'Budi', 'Jatinegara', '8349393439', '', '14640999321', '2016-05-24 21:25:32', 'tidak'),
(9, 'Kodok', 'Test', '0000', '', '14641003271', '2016-05-24 21:32:07', 'tidak'),
(10, 'Brandon', 'Test', '99030', '', '14641003401', '2016-05-24 21:32:20', 'tidak'),
(11, 'Broke', 'Test', '9900', 'Test', '14641005481', '2016-05-24 21:35:48', 'tidak'),
(12, 'Narji', 'Test', '000', 'Test', '14641006401', '2016-05-24 21:37:20', 'tidak'),
(13, 'Bernard', 'Test', '0000', 'test', '14641006651', '2016-05-24 21:37:45', 'tidak'),
(14, 'Nani', 'Test\r\n\r\nAja', '0000', 'Test\r\n\r\nAja', '14641016551', '2016-05-24 21:54:15', 'ya'),
(15, 'Norman', 'Test', '0039349', '', '14641017311', '2016-05-24 21:55:31', 'tidak'),
(16, 'Melina', 'Jauh', '9900039', 'Test', '14661682871', '2016-06-17 19:58:07', 'tidak'),
(17, 'Malih', 'test', '3434343', '', '14729767201', '2016-09-04 15:12:00', 'tidak'),
(18, 'jaka', 'jaka', '0000', 'jaka', '14729767881', '2016-09-04 15:13:08', 'tidak'),
(19, 'makak', 'kkk', '999', 'kakad', '14729768261', '2016-09-04 15:13:46', 'tidak'),
(20, 'asda', 'asda', '2342', 'asdad', '14729768371', '2016-09-04 15:13:57', 'tidak'),
(21, 'asdadadasdad', 'test', '324', 'asdadad', '14729768481', '2016-09-04 15:14:08', 'tidak');

-- --------------------------------------------------------

--
-- Table structure for table `pj_penjualan_detail`
--

CREATE TABLE `pj_penjualan_detail` (
  `id_penjualan_d` int(1) UNSIGNED NOT NULL,
  `id_penjualan_m` int(1) UNSIGNED NOT NULL,
  `id_barang` int(1) NOT NULL,
  `jumlah_beli` smallint(1) UNSIGNED NOT NULL,
  `harga_satuan` decimal(10,0) NOT NULL,
  `total` decimal(10,0) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pj_penjualan_detail`
--

INSERT INTO `pj_penjualan_detail` (`id_penjualan_d`, `id_penjualan_m`, `id_barang`, `jumlah_beli`, `harga_satuan`, `total`) VALUES
(2, 2, 2, 1, '120000', '120000'),
(3, 2, 4, 1, '35000', '35000'),
(4, 3, 3, 1, '350000', '350000'),
(5, 4, 2, 1, '120000', '120000'),
(6, 4, 11, 2, '30000', '60000'),
(7, 4, 4, 2, '35000', '70000'),
(11, 6, 2, 1, '120000', '120000'),
(10, 6, 1, 1, '400000', '400000'),
(12, 7, 4, 1, '35000', '35000'),
(13, 8, 3, 1, '350000', '350000'),
(14, 9, 1, 1, '400000', '400000'),
(15, 9, 2, 1, '120000', '120000'),
(16, 9, 3, 1, '350000', '350000'),
(17, 9, 4, 1, '35000', '35000'),
(18, 10, 1, 1, '400000', '400000'),
(19, 10, 2, 1, '120000', '120000'),
(20, 10, 3, 1, '350000', '350000'),
(21, 11, 1, 1, '400000', '400000'),
(22, 11, 3, 1, '350000', '350000'),
(23, 12, 3, 2, '350000', '700000'),
(26, 15, 1, 1, '400000', '400000'),
(27, 16, 1, 1, '400000', '400000'),
(28, 16, 2, 2, '120000', '240000'),
(29, 16, 3, 1, '350000', '350000'),
(30, 17, 11, 1, '30000', '30000');

-- --------------------------------------------------------

--
-- Table structure for table `pj_penjualan_master`
--

CREATE TABLE `pj_penjualan_master` (
  `id_penjualan_m` int(1) UNSIGNED NOT NULL,
  `nomor_nota` varchar(40) NOT NULL,
  `tanggal` datetime NOT NULL,
  `grand_total` decimal(10,0) NOT NULL,
  `bayar` decimal(10,0) NOT NULL,
  `keterangan_lain` text DEFAULT NULL,
  `id_pelanggan` mediumint(1) UNSIGNED DEFAULT NULL,
  `id_user` mediumint(1) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pj_penjualan_master`
--

INSERT INTO `pj_penjualan_master` (`id_penjualan_m`, `nomor_nota`, `tanggal`, `grand_total`, `bayar`, `keterangan_lain`, `id_pelanggan`, `id_user`) VALUES
(2, '57431A97D5DF8', '2016-05-23 16:58:31', '155000', '160000', '', 3, 1),
(3, '57431BDDAFA9D2', '2016-05-23 17:03:57', '350000', '400000', '', 3, 2),
(4, '57445D46655AB1', '2016-05-24 15:55:18', '250000', '260000', '', NULL, 1),
(6, '576406086CB611', '2016-06-17 16:15:36', '520000', '550000', '', NULL, 1),
(7, '57655546C37441', '2016-06-18 16:05:58', '35000', '40000', '', NULL, 1),
(8, '57655552ABF781', '2016-06-18 16:06:10', '350000', '400000', '', NULL, 1),
(9, '577A31BABCDC51', '2016-07-04 11:51:54', '905000', '910000', '', NULL, 1),
(10, '577A3327991DC1', '2016-07-04 11:57:59', '870000', '880000', 'Dibayar Langsung', NULL, 1),
(11, '577A3793C67CB1', '2016-07-04 12:16:51', '750000', '750000', '', NULL, 1),
(12, '57CA627F897FB1', '2016-09-03 07:41:19', '700000', '800000', '', NULL, 1),
(15, '57CBD697806F61', '2016-09-04 10:08:55', '400000', '500000', '', NULL, 1),
(16, '5F0EDBB2394441', '2020-07-15 12:34:26', '990000', '1000000', 'Demo', NULL, 1),
(17, '5F0EE8069F26C1', '2020-07-15 13:27:02', '30000', '30000', 'asu', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `pj_user`
--

CREATE TABLE `pj_user` (
  `id_user` mediumint(1) UNSIGNED NOT NULL,
  `username` varchar(40) NOT NULL,
  `password` varchar(60) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `id_akses` tinyint(1) UNSIGNED NOT NULL,
  `status` enum('Aktif','Non Aktif') NOT NULL,
  `dihapus` enum('tidak','ya') NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pj_user`
--

INSERT INTO `pj_user` (`id_user`, `username`, `password`, `nama`, `id_akses`, `status`, `dihapus`) VALUES
(1, 'admin', 'admin', 'Bang Admin', 1, 'Aktif', 'tidak'),
(2, 'kasir', '8691e4fc53b99da544ce86e22acba62d13352eff', 'Centini', 2, 'Aktif', 'tidak'),
(3, 'kasir2', '08dfc5f04f9704943a423ea5732b98d3567cbd49', 'Kasir Dua', 2, 'Aktif', 'ya'),
(4, 'jaka', '2ec22095503fe843326e7c19dd2ab98716b63e4d', 'Jaka Sembung', 3, 'Aktif', 'ya'),
(5, 'gudang', 'a80dd043eb5b682b4148b9fc2b0feabb2c606fff', 'Bapak Gudang', 3, 'Aktif', 'tidak'),
(6, 'uang', '7838e4583d05fe73c7b0d8b0c4d1197fee990ac3', 'Mas Keuangan', 4, 'Aktif', 'tidak'),
(7, 'amir', '1dd89e5367785ba89076cd264daac0464fdf0d7b', 'amir', 3, 'Aktif', 'ya');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pj_akses`
--
ALTER TABLE `pj_akses`
  ADD PRIMARY KEY (`id_akses`);

--
-- Indexes for table `pj_barang`
--
ALTER TABLE `pj_barang`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indexes for table `pj_ci_sessions`
--
ALTER TABLE `pj_ci_sessions`
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- Indexes for table `pj_kategori_barang`
--
ALTER TABLE `pj_kategori_barang`
  ADD PRIMARY KEY (`id_kategori_barang`);

--
-- Indexes for table `pj_merk_barang`
--
ALTER TABLE `pj_merk_barang`
  ADD PRIMARY KEY (`id_merk_barang`);

--
-- Indexes for table `pj_pelanggan`
--
ALTER TABLE `pj_pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indexes for table `pj_penjualan_detail`
--
ALTER TABLE `pj_penjualan_detail`
  ADD PRIMARY KEY (`id_penjualan_d`);

--
-- Indexes for table `pj_penjualan_master`
--
ALTER TABLE `pj_penjualan_master`
  ADD PRIMARY KEY (`id_penjualan_m`);

--
-- Indexes for table `pj_user`
--
ALTER TABLE `pj_user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pj_akses`
--
ALTER TABLE `pj_akses`
  MODIFY `id_akses` tinyint(1) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pj_barang`
--
ALTER TABLE `pj_barang`
  MODIFY `id_barang` int(1) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `pj_kategori_barang`
--
ALTER TABLE `pj_kategori_barang`
  MODIFY `id_kategori_barang` mediumint(1) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `pj_merk_barang`
--
ALTER TABLE `pj_merk_barang`
  MODIFY `id_merk_barang` mediumint(1) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `pj_pelanggan`
--
ALTER TABLE `pj_pelanggan`
  MODIFY `id_pelanggan` mediumint(1) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `pj_penjualan_detail`
--
ALTER TABLE `pj_penjualan_detail`
  MODIFY `id_penjualan_d` int(1) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `pj_penjualan_master`
--
ALTER TABLE `pj_penjualan_master`
  MODIFY `id_penjualan_m` int(1) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `pj_user`
--
ALTER TABLE `pj_user`
  MODIFY `id_user` mediumint(1) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin DEFAULT NULL,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

--
-- Dumping data for table `pma__designer_settings`
--

INSERT INTO `pma__designer_settings` (`username`, `settings_data`) VALUES
('root', '{\"snap_to_grid\":\"off\",\"relation_lines\":\"true\",\"angular_direct\":\"direct\"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

--
-- Dumping data for table `pma__export_templates`
--

INSERT INTO `pma__export_templates` (`id`, `username`, `export_type`, `template_name`, `template_data`) VALUES
(1, 'root', 'server', 'mahasiswa', '{\"quick_or_custom\":\"quick\",\"what\":\"sql\",\"db_select[]\":[\"apy_db\",\"coffeeshop\",\"db_karyawan\",\"db_mahasiswa\",\"inv\",\"karyawan\",\"kasir_cofe\",\"kasir_coffe\",\"latihanyii1\",\"lat_procedure\",\"mahasiswa\",\"pemesananbaju\",\"penjualan_db\",\"phpmyadmin\",\"restoran\",\"shop\",\"test\",\"tiketing-pesawat_db\"],\"aliases_new\":\"\",\"output_format\":\"sendit\",\"filename_template\":\"@SERVER@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_structure_or_data\":\"data\",\"excel_null\":\"NULL\",\"excel_columns\":\"something\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"json_structure_or_data\":\"data\",\"json_unicode\":\"something\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"Structure of table @TABLE@\",\"latex_structure_continued_caption\":\"Structure of table @TABLE@ (continued)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"Content of table @TABLE@\",\"latex_data_continued_caption\":\"Content of table @TABLE@ (continued)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"mediawiki_structure_or_data\":\"data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"pdf_report_title\":\"\",\"pdf_structure_or_data\":\"data\",\"phparray_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_use_transaction\":\"something\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_create_table\":\"something\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"yaml_structure_or_data\":\"data\",\"\":null,\"as_separate_files\":null,\"csv_removeCRLF\":null,\"csv_columns\":null,\"excel_removeCRLF\":null,\"json_pretty_print\":null,\"htmlword_columns\":null,\"ods_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_drop_database\":null,\"sql_drop_table\":null,\"sql_if_not_exists\":null,\"sql_view_current_user\":null,\"sql_or_replace_view\":null,\"sql_procedure_function\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"texytext_columns\":null}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data for table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"latihanyii1\",\"table\":\"mahasiswa\"},{\"db\":\"karyawan\",\"table\":\"table_karyawan\"},{\"db\":\"db_karyawan\",\"table\":\"table_karyawan\"},{\"db\":\"db_karyawan\",\"table\":\"admin\"},{\"db\":\"db_karyawan\",\"table\":\"data\"},{\"db\":\"restoran\",\"table\":\"pembayaran\"},{\"db\":\"restoran\",\"table\":\"transaksi\"},{\"db\":\"restoran\",\"table\":\"masakan\"},{\"db\":\"restoran\",\"table\":\"pengguna\"},{\"db\":\"restoran\",\"table\":\"pengaturan\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin DEFAULT NULL,
  `data_sql` longtext COLLATE utf8_bin DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2021-07-12 08:14:57', '{\"Console\\/Mode\":\"collapse\",\"lang\":\"en_GB\"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `restoran`
--
CREATE DATABASE IF NOT EXISTS `restoran` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `restoran`;

-- --------------------------------------------------------

--
-- Table structure for table `kategori_masakan`
--

CREATE TABLE `kategori_masakan` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kategori_masakan`
--

INSERT INTO `kategori_masakan` (`id`, `nama`) VALUES
(1, 'Espresso Based'),
(2, 'Non Coffee'),
(4, 'Snack'),
(5, 'Ice Coffee'),
(6, 'Makanan'),
(7, 'Manual Brew'),
(8, 'minuman');

-- --------------------------------------------------------

--
-- Table structure for table `masakan`
--

CREATE TABLE `masakan` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `harga` int(7) NOT NULL,
  `gambar` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `masakan`
--

INSERT INTO `masakan` (`id`, `nama`, `id_kategori`, `harga`, `gambar`) VALUES
(9, 'cappuccino', 1, 18000, 'cappuccino.jpg'),
(10, 'Strawberry Milkshake', 2, 15000, 'strawberry_milkshake.jpg'),
(11, 'kopsus muara', 5, 15000, 'kopsus.jpg'),
(12, 'Greentea Milk', 2, 15000, 'greenteamilk.jpg'),
(13, 'Cold White', 5, 18000, 'cold_white.jpg'),
(14, 'Tubruk', 7, 15000, 'Tubruk.jpg'),
(15, 'Espresso', 1, 11000, 'Espresso.jpg'),
(16, 'V60 Drip', 7, 15000, 'V60.jpg'),
(17, 'Nasi Goreng', 6, 17000, 'segaGoreng.jpg'),
(18, 'teh', 2, 5000, 'IN.PNG');

-- --------------------------------------------------------

--
-- Table structure for table `meja`
--

CREATE TABLE `meja` (
  `id` int(11) NOT NULL,
  `no_meja` int(3) NOT NULL,
  `jumlah_kursi` int(11) NOT NULL,
  `status` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `meja`
--

INSERT INTO `meja` (`id`, `no_meja`, `jumlah_kursi`, `status`) VALUES
(1, 1, 4, '1'),
(6, 2, 4, '1'),
(7, 3, 5, '1'),
(8, 4, 4, '1'),
(9, 5, 4, '1'),
(10, 6, 6, '1'),
(11, 7, 8, '1'),
(12, 8, 5, '0');

-- --------------------------------------------------------

--
-- Table structure for table `ordermeja`
--

CREATE TABLE `ordermeja` (
  `id` int(11) NOT NULL,
  `no_meja` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `keterangan` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ordermeja`
--

INSERT INTO `ordermeja` (`id`, `no_meja`, `tanggal`, `keterangan`) VALUES
(2, 4, '2020-03-31', 'Dinner'),
(5, 3, '2021-09-08', 'Tidak Ada'),
(6, 5, '2021-06-11', 'ulang tahun'),
(14, 1, '2021-06-07', 'dine in'),
(15, 6, '2021-06-07', 'dine in\r\n'),
(16, 7, '2021-06-07', 'dine in'),
(17, 8, '2021-06-07', 'dine in'),
(18, 9, '2021-06-07', 'dine in'),
(19, 10, '2021-06-07', 'dine in'),
(20, 11, '2021-06-12', 'reuni');

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id` int(11) NOT NULL,
  `id_bayar` varchar(20) NOT NULL,
  `uang_bayar` int(11) NOT NULL,
  `kembalian` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pengaturan`
--

CREATE TABLE `pengaturan` (
  `nama` varchar(100) NOT NULL,
  `alamat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pengaturan`
--

INSERT INTO `pengaturan` (`nama`, `alamat`) VALUES
('MUARA COFFEE INDRAMAYU', 'JALAN');

-- --------------------------------------------------------

--
-- Table structure for table `pengguna`
--

CREATE TABLE `pengguna` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pengguna`
--

INSERT INTO `pengguna` (`id`, `username`, `password`) VALUES
(1, 'admin', '$2y$10$NYgbnscO0dm7Lfxkk.t3wendlzK21JKAEkb5mm7gQV7SW2hSBAT.y'),
(6, 'genandra', '$2y$10$IEskH.0VuMvoiHrWdFFn9.k42j6e4PVgUSCW50BfzZTahWGRAZdnq'),
(7, 'alip', '$2y$10$6DIDN3dZblFQwb0dRncFNO2NgHCWgciFNvv95HJWAjt4FjYcZZvmO');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id` int(11) NOT NULL,
  `masakan` varchar(100) NOT NULL,
  `total` varchar(11) NOT NULL,
  `no_meja` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `harga` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id`, `masakan`, `total`, `no_meja`, `tanggal`, `harga`) VALUES
(15, 'Strawberry Milkshake', '9', 3, '2021-06-07', '15000'),
(16, 'cappuccino', '1', 2, '2021-06-07', '18000'),
(17, 'cappuccino,Strawberry Milkshake', '1,1', 1, '2021-06-07', '18000,15000'),
(18, 'cappuccino', '2', 2, '2021-06-09', '18000'),
(19, 'cappuccino', '2', 2, '2021-06-09', '18000'),
(20, 'Espresso,Nasi Goreng,Cold White,cappuccino,Strawberry Milkshake', '2,10,3,2,2', 7, '2021-06-09', '11000,17000,18000,18000,15000');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kategori_masakan`
--
ALTER TABLE `kategori_masakan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `masakan`
--
ALTER TABLE `masakan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `meja`
--
ALTER TABLE `meja`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `no_meja` (`no_meja`);

--
-- Indexes for table `ordermeja`
--
ALTER TABLE `ordermeja`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `pengaturan`
--
ALTER TABLE `pengaturan`
  ADD KEY `nama` (`nama`);

--
-- Indexes for table `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kategori_masakan`
--
ALTER TABLE `kategori_masakan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `masakan`
--
ALTER TABLE `masakan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `meja`
--
ALTER TABLE `meja`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `ordermeja`
--
ALTER TABLE `ordermeja`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `pengguna`
--
ALTER TABLE `pengguna`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD CONSTRAINT `pembayaran_ibfk_1` FOREIGN KEY (`id`) REFERENCES `transaksi` (`id`);
--
-- Database: `shop`
--
CREATE DATABASE IF NOT EXISTS `shop` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `shop`;

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id` int(11) NOT NULL,
  `id_barang` varchar(255) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `nama_barang` text NOT NULL,
  `merk` varchar(255) NOT NULL,
  `harga_beli` varchar(255) NOT NULL,
  `harga_jual` varchar(255) NOT NULL,
  `satuan_barang` varchar(255) NOT NULL,
  `stok` text NOT NULL,
  `tgl_input` varchar(255) NOT NULL,
  `tgl_update` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id`, `id_barang`, `id_kategori`, `nama_barang`, `merk`, `harga_beli`, `harga_jual`, `satuan_barang`, `stok`, `tgl_input`, `tgl_update`) VALUES
(6, 'BR001', 8, 'Kain Ihrom Laki-laki', 'camel', '150000', '200000', 'PCS', '15', '11 December 2020, 11:08', '13 December 2020, 14:12'),
(7, 'BR002', 8, 'Kain Ihrom Perempuan', 'camel', '150000', '180000', 'PCS', '14', '13 December 2020, 14:13', NULL),
(8, 'BR003', 8, 'Sabuk', 'none', '30000', '35000', 'PCS', '15', '13 December 2020, 14:15', NULL),
(9, 'BR004', 8, 'Sarung Tangan', 'none', '10000', '15000', 'PCS', '15', '13 December 2020, 14:18', NULL),
(10, 'BR005', 8, 'Kaos Kaki', 'none', '5000', '10000', 'PCS', '15', '13 December 2020, 14:19', NULL),
(11, 'BR006', 8, 'Sepatu Perempuan', 'none', '70000', '80000', 'PCS', '15', '13 December 2020, 14:21', NULL),
(12, 'BR007', 8, 'Sepatu Laki-laki', 'none', '95000', '110000', 'PCS', '20', '13 December 2020, 14:22', NULL),
(13, 'BR008', 8, 'Kaos Dalam Perempuan', 'none', '30000', '40000', 'PCS', '14', '13 December 2020, 14:23', NULL),
(14, 'BR009', 8, 'Kaos Dalam Laki-laki', 'none', '35000', '45000', 'PCS', '13', '13 December 2020, 14:24', '15 December 2020, 9:21'),
(17, 'BR010', 9, 'Kurma Azwa', 'none', '200000', '250000', 'KG', '15', '15 December 2020, 9:24', NULL),
(18, 'BR011', 9, 'Kurma Sukari', 'none', '250000', '280000', 'KG', '20', '15 December 2020, 9:24', NULL),
(19, 'BR012', 9, 'Kurma Palem', 'none', '50000', '65000', 'KG', '20', '15 December 2020, 9:25', NULL),
(20, 'BR013', 9, 'Air Zam-zam', 'none', '300000', '400000', 'LITER', '100', '15 December 2020, 9:27', NULL),
(21, 'BR014', 9, 'Botol Zam-zam', 'none', '20000', '30000', 'PCS', '50', '15 December 2020, 9:28', NULL),
(22, 'BR015', 9, 'Kismis', 'none', '60000', '70000', 'KG', '20', '15 December 2020, 9:30', NULL),
(23, 'BR016', 9, 'Kacang Arab', 'none', '70000', '80000', 'KG', '20', '15 December 2020, 9:31', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(11) NOT NULL,
  `nama_kategori` varchar(255) NOT NULL,
  `tgl_input` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`, `tgl_input`) VALUES
(8, 'Pakaian', '11 December 2020, 11:02'),
(9, 'oleh-oleh', '11 December 2020, 11:03');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `id_login` int(11) NOT NULL,
  `user` varchar(255) NOT NULL,
  `pass` char(32) NOT NULL,
  `id_member` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`id_login`, `user`, `pass`, `id_member`) VALUES
(1, 'admin', '202cb962ac59075b964b07152d234b70', 1);

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `id_member` int(11) NOT NULL,
  `nm_member` varchar(255) NOT NULL,
  `alamat_member` text NOT NULL,
  `telepon` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `gambar` text NOT NULL,
  `NIK` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`id_member`, `nm_member`, `alamat_member`, `telepon`, `email`, `gambar`, `NIK`) VALUES
(1, 'amar faza el haromain', 'desa cantigi', '087828996999', 'amarfazaelharomain@gmail.com', 'unnamed.jpg', 'Owner');

-- --------------------------------------------------------

--
-- Table structure for table `nota`
--

CREATE TABLE `nota` (
  `id_nota` int(11) NOT NULL,
  `id_barang` varchar(255) NOT NULL,
  `id_member` int(11) NOT NULL,
  `jumlah` varchar(255) NOT NULL,
  `total` varchar(255) NOT NULL,
  `tanggal_input` varchar(255) NOT NULL,
  `periode` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `nota`
--

INSERT INTO `nota` (`id_nota`, `id_barang`, `id_member`, `jumlah`, `total`, `tanggal_input`, `periode`) VALUES
(1, 'BR001', 1, '4', '12000', '6 October 2020, 0:45', '10-2020'),
(2, 'BR001', 1, '4', '12000', '6 October 2020, 0:45', '10-2020'),
(3, 'BR001', 1, '4', '12000', '6 October 2020, 0:45', '10-2020'),
(4, 'BR001', 1, '4', '12000', '6 October 2020, 0:45', '10-2020'),
(5, 'BR001', 1, '2', '6000', '6 October 2020, 0:49', '10-2020'),
(6, 'BR001', 1, '2', '6000', '6 October 2020, 0:49', '10-2020'),
(7, 'BR001', 1, '2', '6000', '6 October 2020, 1:15', '10-2020'),
(8, 'BR002', 1, '2', '6000', '6 October 2020, 1:17', '10-2020'),
(9, 'BR001', 1, '2', '6000', '6 October 2020, 1:20', '10-2020'),
(10, 'BR001', 1, '2', '6000', '6 October 2020, 1:51', '12-2020'),
(11, 'BR008', 1, '1', '40000', '13 December 2020, 14:26', '12-2020'),
(12, 'BR009', 1, '2', '90000', '13 December 2020, 14:26', '12-2020'),
(13, 'BR001', 1, '2', '400000', '13 December 2020, 14:27', '12-2020'),
(14, 'BR002', 1, '1', '180000', '13 December 2020, 14:27', '12-2020');

-- --------------------------------------------------------

--
-- Table structure for table `penjualan`
--

CREATE TABLE `penjualan` (
  `id_penjualan` int(11) NOT NULL,
  `id_barang` varchar(255) NOT NULL,
  `id_member` int(11) NOT NULL,
  `jumlah` varchar(255) NOT NULL,
  `total` varchar(255) NOT NULL,
  `tanggal_input` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `penjualan`
--

INSERT INTO `penjualan` (`id_penjualan`, `id_barang`, `id_member`, `jumlah`, `total`, `tanggal_input`) VALUES
(24, 'BR008', 1, '1', '40000', '13 December 2020, 14:26'),
(25, 'BR009', 1, '2', '90000', '13 December 2020, 14:26'),
(26, 'BR001', 1, '2', '400000', '13 December 2020, 14:27'),
(27, 'BR002', 1, '1', '180000', '13 December 2020, 14:27');

-- --------------------------------------------------------

--
-- Table structure for table `toko`
--

CREATE TABLE `toko` (
  `id_toko` int(11) NOT NULL,
  `nama_toko` varchar(255) NOT NULL,
  `alamat_toko` text NOT NULL,
  `tlp` varchar(255) NOT NULL,
  `nama_pemilik` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `toko`
--

INSERT INTO `toko` (`id_toko`, `nama_toko`, `alamat_toko`, `tlp`, `nama_pemilik`) VALUES
(1, 'amar faza el haromain', 'desa cantigi', '089618173609', 'amar faza');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id_login`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`id_member`);

--
-- Indexes for table `nota`
--
ALTER TABLE `nota`
  ADD PRIMARY KEY (`id_nota`);

--
-- Indexes for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`id_penjualan`);

--
-- Indexes for table `toko`
--
ALTER TABLE `toko`
  ADD PRIMARY KEY (`id_toko`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `id_login` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `member`
--
ALTER TABLE `member`
  MODIFY `id_member` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `nota`
--
ALTER TABLE `nota`
  MODIFY `id_nota` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `penjualan`
--
ALTER TABLE `penjualan`
  MODIFY `id_penjualan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `toko`
--
ALTER TABLE `toko`
  MODIFY `id_toko` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
--
-- Database: `tiketing-pesawat_db`
--
CREATE DATABASE IF NOT EXISTS `tiketing-pesawat_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `tiketing-pesawat_db`;

-- --------------------------------------------------------

--
-- Table structure for table `tb_bandara`
--

CREATE TABLE `tb_bandara` (
  `id_bandara` varchar(11) NOT NULL,
  `kode` varchar(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `kota` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_bandara`
--

INSERT INTO `tb_bandara` (`id_bandara`, `kode`, `nama`, `kota`) VALUES
('BAN180001', 'SRG', ' Bandar Udara Internasional Achmad Yani', 'Semarang'),
('BAN180002', 'CGK ', ' Bandar Udara Internasional Soekarno-Hatta', 'Tangerang'),
('BAN180003', 'HLP', 'Bandar Udara Internasional Halim Perdanakusuma', 'Jakarta'),
('BAN180004', 'DPS ', ' Bandar Udara Internasional Ngurah Rai', 'Denpasar'),
('BAN180005', 'BPN', ' Bandar Udara Sultan Aji Muhammad Sulaiman', 'Balik Papan'),
('BAN180006', 'JOG', ' Bandar Udara Internasional Adisutjipto', 'Seleman'),
('BAN180007', 'BDO', 'Bandar Udara Internasional Husein Sastranegara', 'Bandung'),
('BAN180008', 'SUB', 'Bandar Udara Internasional Juanda', 'Sidoarjo'),
('BAN180009', 'MDC ', ' Bandar Udara Internasional Sam Ratulangi', 'Manado'),
('BAN180010', 'DJJ', ' Bandar Udara Internasional Sentani', 'Jayapura');

-- --------------------------------------------------------

--
-- Table structure for table `tb_booking`
--

CREATE TABLE `tb_booking` (
  `id_booking` varchar(11) NOT NULL,
  `id_customer` varchar(11) NOT NULL,
  `tgl_booking` date NOT NULL,
  `jumlah_penumpang` int(11) NOT NULL,
  `total_tarif` varchar(255) NOT NULL,
  `status_bayar` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_customer`
--

CREATE TABLE `tb_customer` (
  `id_customer` varchar(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `kota` varchar(255) NOT NULL,
  `negara` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_dtl_booking`
--

CREATE TABLE `tb_dtl_booking` (
  `id_detail` int(11) NOT NULL,
  `id_tarif` varchar(11) NOT NULL,
  `id_booking` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_passenger`
--

CREATE TABLE `tb_passenger` (
  `id_passenger` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `no_kursi` varchar(50) NOT NULL,
  `id_detail` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_penerbangan`
--

CREATE TABLE `tb_penerbangan` (
  `id_penerbangan` varchar(11) NOT NULL,
  `id_bandara` varchar(11) NOT NULL,
  `id_pesawat` varchar(11) NOT NULL,
  `tgl_penerbangan` date NOT NULL,
  `asal` varchar(255) NOT NULL,
  `tujuan` varchar(255) NOT NULL,
  `jam_berangkat` time NOT NULL,
  `jam_tiba` time NOT NULL,
  `bandara_tujuan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_pesawat`
--

CREATE TABLE `tb_pesawat` (
  `id_pesawat` varchar(11) NOT NULL,
  `tipe_pesawat` varchar(255) NOT NULL,
  `jml_kursi_ekonomi` varchar(255) NOT NULL,
  `jml_kursi_bisnis` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_pesawat`
--

INSERT INTO `tb_pesawat` (`id_pesawat`, `tipe_pesawat`, `jml_kursi_ekonomi`, `jml_kursi_bisnis`) VALUES
('PES180001', 'Airbus A330-300', '213', '34'),
('PES180002', 'Boeing 737 Max 8', '162', '8'),
('PES180003', 'Airbus A330-200', '186', '36'),
('PES180004', 'Bombardier CRJ1000 NextGen', '96', '0'),
('PES180005', 'ATR 72-600', '66', '0'),
('PES180006', 'Boeing 777-300ER', '26', '367'),
('PES180007', 'Boeing 737-800NG', '150', '12');

-- --------------------------------------------------------

--
-- Table structure for table `tb_tarif_penerbangan`
--

CREATE TABLE `tb_tarif_penerbangan` (
  `id_tarif` varchar(11) NOT NULL,
  `id_penerbangan` varchar(11) NOT NULL,
  `kelas` varchar(255) NOT NULL,
  `tarif` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

CREATE TABLE `tb_user` (
  `id_user` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `level` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_user`
--

INSERT INTO `tb_user` (`id_user`, `username`, `password`, `level`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin'),
(2, 'manager', '1d0258c2440a8d19e716292b231e3190', 'manager'),
(3, 'petugas', 'afb91ef692fd08c445e8cb1bab2ccf9c', 'petugas'),
(4, 'su', '0b180078d994cb2b5ed89d7ce8e7eea2', 'superuser');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_bandara`
--
ALTER TABLE `tb_bandara`
  ADD PRIMARY KEY (`id_bandara`);

--
-- Indexes for table `tb_booking`
--
ALTER TABLE `tb_booking`
  ADD PRIMARY KEY (`id_booking`);

--
-- Indexes for table `tb_customer`
--
ALTER TABLE `tb_customer`
  ADD PRIMARY KEY (`id_customer`);

--
-- Indexes for table `tb_dtl_booking`
--
ALTER TABLE `tb_dtl_booking`
  ADD PRIMARY KEY (`id_detail`);

--
-- Indexes for table `tb_passenger`
--
ALTER TABLE `tb_passenger`
  ADD PRIMARY KEY (`id_passenger`);

--
-- Indexes for table `tb_penerbangan`
--
ALTER TABLE `tb_penerbangan`
  ADD PRIMARY KEY (`id_penerbangan`);

--
-- Indexes for table `tb_pesawat`
--
ALTER TABLE `tb_pesawat`
  ADD PRIMARY KEY (`id_pesawat`);

--
-- Indexes for table `tb_tarif_penerbangan`
--
ALTER TABLE `tb_tarif_penerbangan`
  ADD PRIMARY KEY (`id_tarif`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_dtl_booking`
--
ALTER TABLE `tb_dtl_booking`
  MODIFY `id_detail` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_passenger`
--
ALTER TABLE `tb_passenger`
  MODIFY `id_passenger` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
