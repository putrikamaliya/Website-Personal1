-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 21 Jun 2024 pada 15.04
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tokoribj`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `nama` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`id_admin`, `username`, `password`, `nama`) VALUES
(1, 'admin', 'admin', 'admin');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(11) NOT NULL,
  `kategori` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `kategori`) VALUES
(8, 'Mahar'),
(12, 'Ringbox'),
(14, 'Gift'),
(15, 'Bucket');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ongkir`
--

CREATE TABLE `ongkir` (
  `id_ongkir` int(6) NOT NULL,
  `nama_kota` varchar(100) NOT NULL,
  `tarif` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `ongkir`
--

INSERT INTO `ongkir` (`id_ongkir`, `nama_kota`, `tarif`) VALUES
(1, 'Bogor', 25000),
(2, 'Jakarta', 30000),
(3, 'Bekasi', 50000),
(4, 'Tangerang', 15000),
(5, 'Bandung', 40000),
(6, 'Jogja', 100000),
(7, 'Depok', 20000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` int(11) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `nama_pelanggan` varchar(30) NOT NULL,
  `telepon` varchar(25) NOT NULL,
  `alamat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `email`, `password`, `nama_pelanggan`, `telepon`, `alamat`) VALUES
(1, 'lancelot@gmail.com', 'lancelot', 'Lancelot', '097654', 'jl. baru'),
(2, 'jonson@gmail.com', 'jonson', 'jonson', '09876543', 'jln kota baru'),
(3, 'anggi@gmail.com', 'anggi', 'anggi', '098765', 'jambi'),
(4, 'sony@gmail.com', 'sony', 'sony', '082179761220', 'jjjzsh'),
(5, 'aditiawan@gmail.com', '0987654321', 'Hanief Aditiawan', '02173692616', 'JL.PLN PONDOK AREN NO.25,RT014,RW001 PONDOK KARYA PONDOK AREN TANGERANG SELATAN 15225'),
(8, 'kameliaputri399@gmail.com', '12345678', 'putri', '083813600672', 'Jalan Jambu Pejaten Pasar Minggu');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_pembayaran` int(11) NOT NULL,
  `id_pembelian` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `bank` varchar(255) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `bukti` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `pembayaran`
--

INSERT INTO `pembayaran` (`id_pembayaran`, `id_pembelian`, `nama`, `bank`, `jumlah`, `tanggal`, `bukti`) VALUES
(2, 2, 'PUTRI KAMALIYA', 'BRI', 386000, '2021-07-24', '20210724051557afaf890e0e3c51e2c81cb212f6e9243b.jpg'),
(4, 4, 'khan', 'bri', 145000, '2021-07-24', '20210724080257afaf890e0e3c51e2c81cb212f6e9243b.jpg'),
(12, 15, 'putri', 'bri', 635, '2024-06-21', '20240621141626putri.jpg'),
(13, 16, 'mia', 'bca', 674000, '2024-06-21', '20240621143621putri.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembelian`
--

CREATE TABLE `pembelian` (
  `id_pembelian` int(11) NOT NULL,
  `id_pelanggan` int(11) NOT NULL,
  `id_ongkir` int(6) NOT NULL,
  `tgl_pembelian` date NOT NULL,
  `total_pembelian` int(11) NOT NULL,
  `nama_kota` varchar(100) NOT NULL,
  `tarif` int(11) NOT NULL,
  `alamat_pengiriman` text NOT NULL,
  `status_pembelian` varchar(100) NOT NULL DEFAULT 'pending',
  `resi_pengiriman` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `pembelian`
--

INSERT INTO `pembelian` (`id_pembelian`, `id_pelanggan`, `id_ongkir`, `tgl_pembelian`, `total_pembelian`, `nama_kota`, `tarif`, `alamat_pengiriman`, `status_pembelian`, `resi_pengiriman`) VALUES
(14, 8, 2, '2024-06-20', 524000, 'Jakarta', 30000, 'jl pahlawan jaktim', 'pending', ''),
(15, 8, 6, '2024-06-21', 633500, 'Jogja', 100000, 'klaten jalan pahlawan', 'barang dikirim', '01'),
(16, 8, 2, '2024-06-21', 674000, 'Jakarta', 30000, 'Jalan pejambon jakarta', 'barang dikirim', '001');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembelian_produk`
--

CREATE TABLE `pembelian_produk` (
  `id_pembelian_produk` int(11) NOT NULL,
  `id_pembelian` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `harga` int(11) NOT NULL,
  `berat` int(11) NOT NULL,
  `subberat` int(11) NOT NULL,
  `subharga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `pembelian_produk`
--

INSERT INTO `pembelian_produk` (`id_pembelian_produk`, `id_pembelian`, `id_produk`, `jumlah`, `nama`, `harga`, `berat`, `subberat`, `subharga`) VALUES
(18, 13, 103, 1, 'Kaliandra Mini', 395000, 1000, 1000, 395000),
(19, 13, 111, 1, 'Ceria', 125000, 1000, 1000, 125000),
(20, 14, 103, 1, 'Kaliandra Mini', 395000, 1000, 1000, 395000),
(21, 14, 105, 1, 'Little Series Naura', 99000, 750, 750, 99000),
(22, 15, 103, 1, 'Kaliandra Mini', 395000, 1000, 1000, 395000),
(23, 15, 110, 1, 'Bima series', 13500, 500, 500, 13500),
(24, 15, 97, 1, 'Polarid Series Briona', 125000, 1000, 1000, 125000),
(25, 16, 106, 1, 'Money Bucket Corong', 150000, 500, 500, 150000),
(26, 16, 103, 1, 'Kaliandra Mini', 395000, 1000, 1000, 395000),
(27, 16, 105, 1, 'Little Series Naura', 99000, 750, 750, 99000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk`
--

CREATE TABLE `produk` (
  `id_produk` int(11) NOT NULL,
  `nama_produk` varchar(50) NOT NULL,
  `id_kategori` varchar(50) NOT NULL,
  `harga` int(11) NOT NULL,
  `stok_produk` int(10) NOT NULL,
  `berat` int(11) NOT NULL,
  `foto_produk` varchar(50) NOT NULL,
  `deskripsi` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `produk`
--

INSERT INTO `produk` (`id_produk`, `nama_produk`, `id_kategori`, `harga`, `stok_produk`, `berat`, `foto_produk`, `deskripsi`) VALUES
(94, 'GB Perpans FA', '12', 90000, 20, 500, 'IMG-20240610-WA0039.jpg', ' Terarium Kaca Perpans\r\nRing Holder Bahan Kain\r\nHiasan Bunga Mutiara, Rustic\r\nWarna : Ungu, Biru, Pink, Merah, Kuning\r\n					\r\n		'),
(95, 'Thera Box Large', '12', 410000, 10, 1500, 'WhatsApp Image 2024-06-20 at 19.05.25_c730198f.jpg', 'Model : THERA BOX LARGE RUSTIC PREMIUM\r\nUkuran Kayu : 18-19 cm ketebalan 2-3 cm\r\nUkuran Box Thera (±) PxLxT : 16x13x6 cm\r\n		'),
(96, 'Kaliandra', '8', 415000, 3, 3000, 'IMG_20240611_192951.jpg', '  Frame size : 30x30cm\r\nJenis kayu natural atau coklat\r\nBacgraound transparan atau papan \r\n					\r\n					\r\n					\r\n					\r\n					\r\n		'),
(97, 'Polarid Series Briona', '14', 125000, 9, 1000, 'WhatsApp Image 2024-06-20 at 18.50.17_7ce52166.jpg', 'Frame bingkai 3D Kayu Natural Wood\r\nMenggunakan bunga kering & sintetis tidak mudah rusak/layu\r\nBISA UNTUK KEBUTUHAN :\r\n- Kado Wisuda/graduation\r\n- Kado Nikahan/Wedding\r\n- Kado Anniversarry\r\n- Kado Ulangtahun/Birthday\r\n- Kado Perpisahan\r\n- Kado Karyawan/Companies\r\n					\r\n					\r\n		'),
(98, 'Money Bucket', '15', 125000, 20, 50, 'WhatsApp Image 2024-06-20 at 19.10.18_dbe00c4e.jpg', 'Bucket uang dengan uang Replika(bisa custom uang asli(belum include))\r\n					\r\n					\r\n		'),
(99, 'Indira 1', '8', 296000, 10, 1000, 'WhatsApp Image 2024-06-20 at 19.03.53_2e55c520.jpg', 'ukuran frame kayu 20x20 \r\nbackground acrylic/transparan\r\nbisa custom warna dan tema\r\n					\r\n					\r\n		'),
(100, 'Falisha', '8', 326000, 10, 15000, 'WhatsApp Image 2024-06-20 at 19.04.04_b00839c6.jpg', ' ukuran frame kayu natural 20x25\r\nbisa custom tema dan bunga\r\ninclude uang replika			\r\n					\r\n					\r\n		'),
(101, 'Kaliandra BTS', '8', 1284000, 5, 2000, 'WhatsApp Image 2024-06-20 at 19.54.31_bbd4233e.jpg', 'Kaliandra mahar ukuran 20x30 dengan frame putih bonus FL(Tempat perhiasan satu set)\r\n					\r\n		'),
(102, 'Baskara', '8', 1040000, 3, 1500, 'WhatsApp Image 2024-06-20 at 19.54.06_9322e2d7.jpg', 'frame bentuk gunungan wayang, acrylic transparan\r\n					\r\n					\r\n					\r\n		'),
(103, 'Kaliandra Mini', '8', 395000, 6, 1000, 'WhatsApp Image 2024-06-20 at 19.54.20_9afe7b72.jpg', 'Frame full acrylic ukuran 15x20\r\n					\r\n		'),
(104, 'Sunshine Series', '14', 155000, 10, 1500, 'WhatsApp Image 2024-06-20 at 19.34.49_a8572713.jpg', 'UKURAN LUAR 23X23 / UKURAN KACA 19,5x19,5\r\n\r\nSPESIFIKASI PRODUK :\r\n- Frame Bingkai 3D Kayu natural wood \r\n- Menggunakan bunga kering & sintetis tidak mudah rusak/layu\r\n- BELUM TERMASUK STANDING FRAME\r\n- Free Jam dan baterai\r\n					\r\n		'),
(105, 'Little Series Naura', '14', 99000, 13, 750, 'WhatsApp Image 2024-06-20 at 18.50.54_0965fbdf.jpg', 'UKURAN LUAR 19X5 / UKURAN KACA 16X12\r\n\r\nSPESIFIKASI PRODUK :\r\n- Frame Bingkai 3D Kayu natural wood \r\n- Menggunakan bunga kering & sintetis tidak mudah rusak/layu\r\n\r\nBISA UNTUK KEBUTUHAN :\r\n- Kado Wisuda/graduation\r\n- Kado Nikahan/Wedding\r\n- Kado Anniversarry\r\n- Kado Ulangtahun/Birthday\r\n- Kado Perpisahan\r\n- Kado Karyawan/Companies\r\n \r\n					\r\n					\r\n		'),
(106, 'Money Bucket Corong', '15', 150000, 9, 500, 'WhatsApp Image 2024-06-20 at 19.10.17_999e9e69.jpg', 'uang dibentuk corong \r\nbisa custom warna dan uang\r\n		'),
(109, 'Glass Box Penta Dome FA', '12', 115000, 10, 100, 'WhatsApp Image 2024-06-20 at 19.04.39_c099b5fd.jpg', ' Terarium penta, ring holder gulung untuk tempat cincin sepasang	\r\n		'),
(110, 'Bima series', '12', 13500, 9, 500, 'WhatsApp Image 2024-06-20 at 19.04.49_dac0ee9d.jpg', ' kayu kotak dengan tutup untuk tempat cincin sepasang		\r\n		'),
(111, 'Ceria', '14', 125000, 9, 1000, 'WhatsApp Image 2024-06-20 at 18.50.31_43059dff.jpg', 'ukuran frame 20x20, foto printout lingkaran kayu rotan asli');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indeks untuk tabel `ongkir`
--
ALTER TABLE `ongkir`
  ADD PRIMARY KEY (`id_ongkir`);

--
-- Indeks untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indeks untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`);

--
-- Indeks untuk tabel `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`id_pembelian`);

--
-- Indeks untuk tabel `pembelian_produk`
--
ALTER TABLE `pembelian_produk`
  ADD PRIMARY KEY (`id_pembelian_produk`);

--
-- Indeks untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `ongkir`
--
ALTER TABLE `ongkir`
  MODIFY `id_ongkir` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id_pelanggan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id_pembayaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `pembelian`
--
ALTER TABLE `pembelian`
  MODIFY `id_pembelian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `pembelian_produk`
--
ALTER TABLE `pembelian_produk`
  MODIFY `id_pembelian_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT untuk tabel `produk`
--
ALTER TABLE `produk`
  MODIFY `id_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
