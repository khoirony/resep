-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 29, 2022 at 03:58 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `resep_masakan`
--

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` bigint(20) NOT NULL,
  `nama_kategori` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`) VALUES
(1, 'Berminyak'),
(2, 'Berkuah'),
(3, 'Camilan'),
(4, 'Vegan');

-- --------------------------------------------------------

--
-- Table structure for table `kesulitan`
--

CREATE TABLE `kesulitan` (
  `id_kesulitan` bigint(20) NOT NULL,
  `nama_level` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kesulitan`
--

INSERT INTO `kesulitan` (`id_kesulitan`, `nama_level`) VALUES
(1, 'mudah'),
(2, 'lumayan'),
(3, 'Rumit'),
(4, 'Master Chef');

-- --------------------------------------------------------

--
-- Table structure for table `komentar`
--

CREATE TABLE `komentar` (
  `id_komentar` bigint(20) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_resep` int(11) NOT NULL,
  `rating` float NOT NULL,
  `komentar` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `komentar`
--

INSERT INTO `komentar` (`id_komentar`, `id_user`, `id_resep`, `rating`, `komentar`) VALUES
(1, 6, 3, 4.5, 'mantap'),
(2, 1, 2, 4.7, 'joss'),
(3, 5, 1, 4, 'mayan'),
(4, 1, 2, 4.2, 'oke'),
(5, 6, 5, 3.5, 'pedes euy'),
(6, 1, 6, 4, 'mayanlah'),
(7, 5, 8, 5, 'seger'),
(8, 1, 7, 4, 'oke'),
(9, 5, 4, 4.6, 'okesih'),
(10, 6, 8, 4.3, 'sip');

-- --------------------------------------------------------

--
-- Table structure for table `mengkategorikan`
--

CREATE TABLE `mengkategorikan` (
  `id_mengkategorikan` bigint(20) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `id_resep` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mengkategorikan`
--

INSERT INTO `mengkategorikan` (`id_mengkategorikan`, `id_kategori`, `id_resep`) VALUES
(1, 3, 2),
(2, 1, 1),
(3, 2, 3),
(4, 4, 4),
(5, 1, 6),
(6, 2, 5),
(7, 2, 5),
(8, 2, 8),
(9, 4, 8),
(10, 1, 7);

-- --------------------------------------------------------

--
-- Table structure for table `resep`
--

CREATE TABLE `resep` (
  `id_resep` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_kesulitan` int(11) NOT NULL,
  `nama_resep` varchar(255) NOT NULL,
  `durasi` time NOT NULL,
  `porsi` int(11) NOT NULL,
  `bahan` text NOT NULL,
  `langkah_memasak` text NOT NULL,
  `foto` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `resep`
--

INSERT INTO `resep` (`id_resep`, `id_user`, `id_kesulitan`, `nama_resep`, `durasi`, `porsi`, `bahan`, `langkah_memasak`, `foto`) VALUES
(1, 2, 1, 'Nasi Goreng', '00:15:00', 3, '1 piring penuh nasi\n1 sdm jagung manis yang telah dipipil\n1 sdm kacang polong\n3 sdm daging ayam cincang yang telah ditumis\n1 butir telur, kocok\n1 sdt bawang putih (haluskan, tumis)\n1 sdm minyak ikan\n1 sdm kecap manis\n½ sdt garam\nKaldu penyedap, secukupnya jika suka\nSambal, secukupnya jika suka pedas\nMinyak goreng, secukupnya untuk memasak', '1. Siapkan semua bahan. \n2. Tumis bawang putih hingga harum kemudian masukkan telur. Masak orak-arik bersama bawang putih. \n3. Tambahkan kacang polong dan jagung manis yang telah direbus sebelumnya. Masak beberapa saat. \n4. Tambahkan daging ayam cincang yang telah ditumis sebelumnya. \n5. Masukkan nasi putih ke dalam wajan. Aduk rata.\n6. Tambahkan garam, minyak ikan, kecap, sambal dan penyedap sesuai selera. Aduk rata semua bahan. \n7. Koreksi rasa, angkat nasi goreng yang telah matang. \n8. Sajikan bersama sayur lalapan berupa wortel atau mentimun. ', 'nasi_goreng.jpg'),
(2, 3, 2, 'Donat Mini Tanpa Diuleni yang Lembut dan Empuk', '00:30:00', 5, '- 250 gr tepung terigu protein tinggi\n- 1/2 sdm ragi instan\n- 1,5 sdm gula pasir\n- 2 butir kuning telur\n- 125 ml susu cair dingin\n- 1 sdm butter\n- 1/4 sdt garam\n- Gula halus\n- Cokelat', '1. Masukkan tepung terigu, gula pasir, ragi instan, kuning telur, dan susu cair ke dalam wadah, aduk rata sekitar 1 menit. Lalu masukkan butter dan garam, aduk lagi hingga tercampur rata menggunakan mixer sekitar 1 menit, lalu keluarkan adonan, bentuk bulat. diamkan adonan sekitar 30 sampai 45 menit sampai mengembang.\r\n2. Setelah itu, kempiskan adonan, lalu timbang, bagi adonan dengan berat masing-masing kurang lebih 25 gram atau sesuai selera, bentuk bulat, biarkan sampai mengembang ringan.\r\n3. Panaskan minyak secukupnya, lalu goreng donat dengan api sedang cenderung kecil. Cukup membalik donat 1 kali selama menggoreng supaya donat tidak berminyak.\r\n4. Tunggu sampai donat benar-benar dingin baru diberi topping sesuai selera. Donat mini siap disajikan.', 'donat.jpg'),
(3, 2, 3, 'Soto Lamongan', '01:00:00', 4, '- 1 ekor (700 g) ayam kampung\r\n- 2.5 L air\r\n- 5 lembar daun jeruk\r\n- 1 sdt garam\r\n- 1 sdt gula pasir\r\n- 2 sdm Bango Kecap Manis Light\r\n- 2 batang serai, memarkan\r\n- 2 cm lengkuas, memarkan\r\n- 2 sdm minyak, untuk menumis\r\n- 300 ml minyak, untuk menggoreng\r\n- 12 butir bawang merah\r\n- 8 siung bawang putih\r\n- 2 cm jahe\r\n- 3 cm kunyit bakar\r\n- 4 butir kemiri\r\n- 1 sdm bawang putih goreng\r\n- 1 sdm bawang merah goreng\r\n- 50g suun kering, seduh air hangat, tiriskan\r\n- 2 buah tomat, potong kasar\r\n- 2 batang daun seledri, cincang halus\r\n- 3 butir telur ayam rebus, iris\r\n- 200 g kol, iris halus', '1. Dalam panci, rebus air dan ayam dengan api kecil. Masak hingga ayam matang dan lunak. Saring kaldu dan sisihkan.\r\n\r\n2. Panaskan minyak, goreng ayam hingga kecokelatan. Suwir-suwir.\r\n\r\n3. Dalam panci, rebus kembali kaldu hingga mendidih.\r\n\r\n4. Panaskan minyak, tumis bumbu halus, serai, lengkuas, dan daun jeruk hingga harum.\r\n\r\n5. Tuang tumisan bumbu, garam, gula, dan Bango Kecap Manis Light ke dalam rebusan kaldu. Masak hingga mendidih.\r\n\r\n6. Tata bahan pelengkap di mangkuk, kecuali sambal. Beri suwiran ayam, siram dengan kuah soto. Sajikan selagi hangat.', 'soto.jpg'),
(4, 3, 2, 'Kentang manis panggang Mediterania', '00:30:00', 3, '4 ubi jalar ukuran sedang* (masing-masing ~140 g)\n• 1 kaleng buncis 15 ons (425 g), dibilas dan dikeringkan\n• 1/2 sdm minyak zaitun\n• 1/2 sdt masing-masing jinten, ketumbar, kayu manis, paprika asap (atau biasa)\n• opsional: Sejumput garam laut atau jus lemon\n\nSaus bumbu bawang putih\n• 1/4 cangkir (60 g) houmous (atau tahini)\n• jus 1/2 lemon (~1 sdm)\n• 3/4 - 1 sdt adas kering (atau di bawah 2-3 sdt segar)\n• 3 siung bawang putih, cincang (1 1/2 sendok makan atau 9 g)\n• Air atau susu almond tanpa pemanis untuk mengencerkan\n• opsional: Garam laut secukupnya\n\nTopping (opsional)\n• 1/4 cangkir (45 g) tomat ceri, potong dadu\n• 1/4 cangkir (15 g) peterseli cincang, cincang\n• 2 sdm (30 ml) jus lemon\n• Saus cabai bawang putih', '1. Panaskan oven hingga 400 derajat F (204 C) dan lapisi loyang besar dengan kertas timah.\r\n2. Bilas dan gosok kentang dan potong setengah panjangnya. Ini akan mempercepat waktu memasak. Jika tidak, biarkan utuh dan panggang lebih lama (kira-kira dua kali lipat waktu (45 menit - 1 jam).\r\n3. Aduk buncis yang sudah dibilas dan dikeringkan dengan minyak zaitun dan rempah-rempah dan letakkan di atas loyang berlapis foil.\r\n4. Gosok ubi jalar dengan sedikit minyak zaitun dan letakkan menghadap ke bawah di atas loyang yang sama (atau loyang lain tergantung ukurannya).\r\n5. Sementara ubi jalar dan buncis sedang dipanggang, siapkan saus Anda dengan menambahkan semua bahan ke dalam mangkuk pencampur dan kocok agar tercampur rata, hanya tambahkan air secukupnya ke susu almond untuk mengencerkan sehingga dapat dituangkan. Cicipi dan sesuaikan bumbu sesuai kebutuhan. Tambahkan lebih banyak bawang putih agar lebih mantap, garam untuk rasa gurih, jus lemon untuk kesegaran, dan adas untuk rasa rempah yang lebih kuat.\r\n6. CATATAN: Jika Anda tidak punya houmous, tahini akan menjadi pengganti saus yang bagus - sesuaikan saja bumbunya untuk mengakomodasi kekurangan rasa yang disediakan tahini.\r\n7. Siapkan juga topping tomat-peterseli dengan menaburkan tomat dan peterseli dengan air jeruk lemon dan sisihkan untuk diasinkan.\r\n8. Setelah ubi jalar empuk dan buncis berwarna cokelat keemasan - kira-kira 25 menit - keluarkan dari oven.\r\n9. Untuk penyajian, balikkan daging kentang ke atas dan hancurkan sedikit bagian dalamnya. Kemudian hiasi dengan buncis, saus, dan hiasan tomat peterseli. \r\n10. Hidangkan segera.', 'kentang.jpg'),
(5, 4, 3, 'Tongseng Ayam Mercon', '01:00:00', 4, '800g daging ayam tanpa kulit, potong 12 buah\r\n4 sdm santan kental\r\n400ml air\r\n2 batang serai\r\n300g kol\r\n3 buah tomat hijau, potong kotak\r\n2 batang daun bawang, potong 1 cm\r\n5 sdm Bango Kecap Manis\r\n1 sdm merica putih bubuk\r\n2 sdm minyak, untuk menumis\r\n\r\n10 buah cabai rawit merah\r\n6 butir bawang merah\r\n3 siung bawang putih\r\n3 butir kemiri\r\n2 sdt Royco Kaldu Ayam\r\n1 sdt ketumbar butiran\r\n1 sdt gula pasir\r\n3 sdm bawang merah goreng', '1 Bumbu halus: Masukkan semua bahan ke dalam blender termasuk Royco Kaldu Ayam. Proses hingga halus.\r\n\r\n2 Panaskan minyak dalam wajan, tumis bumbu halus hingga harum. Masukkan serai, daging ayam, dan air, aduk rata. Masak hingga daging matang.\r\n\r\n3 Masukkan santan, kol, tomat, dan daun bawang. Masak hingga santan mendidih.\r\n\r\n4 Tambahkan Bango Kecap Manis, gula dan merica.\r\n\r\n5 Taburi bawang goreng. Sajikan.', 'tongseng.jpg'),
(6, 2, 4, 'Steak Saus Mushroom', '01:00:00', 3, '500g daging sirloin, potong\r\nbuncis\r\nwortel\r\njagung manis\r\nkentang, goreng\r\ngaram\r\nmerica hitam bubuk\r\n\r\nBahan saus mushroom\r\n100g jamur champignon, iris tipis\r\n2 siung bawang putih\r\n1 buah bawang bombay\r\n5 sdm Bango Kecap Manis\r\n200ml kaldu sapi\r\n2 sdm tepung terigu\r\n1 sdm margarin, untuk menumis\r\nmerica putih bubuk\r\ngaram\r\noregano', '1 Lumuri daging dengan garam dan lada, kemudian diamkan beberapa saat.\r\n\r\n2 Saus mushroom: Cincang halus bawang putih dan bawang bombay lalu tumis dengan margarin. Masukkan jamur, aduk sampai rata, kemudian tambahkan Bango Kecap Manis, kaldu sapi, tepung terigu, garam, lada bubuk dan oregano. Masak terus sampai saus mengental, setelah itu angkat dan tempatkan dalam mangkuk kecil.\r\n\r\n3 Potong-potong dan rebus buncis, wortel dan jagung manis dipotong-potong sampai matang. Tiriskan dan tata di piring.\r\n\r\n4 Goreng kentang hingga matang. Tiriskan dan tata di atas piring.\r\n\r\n5 Terakhir, panggang daging sirloin sesuai tingkat kematangan yang diinginkan.\r\n\r\n6 Sajikan steak bersama sayur, kentang dan saus mushroom.', 'steak.jpg'),
(7, 7, 4, 'Pepes Ayam Bumbu Kuning', '01:00:00', 4, '1 ekor ayam, buang kulit, potong 4 bagian\r\n2 batang serai, memarkan\r\n2 lembar daun salam\r\n300ml air\r\n65ml santan instan\r\n1sdt garam\r\n½sdm Royco Kaldu Ayam Spesial\r\n16 buah cabai rawit merah\r\n100g daun kemangi, petiki daunnya\r\n3 sdm minyak, untuk menumis\r\nDaun pisang, untuk membungkus\r\nTusuk gigi\r\n\r\nBumbu halus\r\n7 butir bawang merah\r\n5 siung bawang putih\r\n4 butir kemiri\r\n3cm kunyit\r\n2cm jahe, iris\r\n1 sdm ketumbar', '1 Panaskan minyak, tumis bumbu halus, serai, dan daun salam hingga harum, masukkan daging ayam, aduk rata. Tuang air dan santan, masak hingga mendidih.\r\n\r\n2 Tambahkan garam dan Royco Kaldu Ayam Spesial, masak hingga daging ayam hampir matang dan airnya menyusut. Angkat. Sisihkan.\r\n\r\n3 Panaskan daun pisang di atas api kecil untuk melenturkan daun pisang agar lebih mudah dilipat.\r\n\r\n4 Tumpuk 3 lembar daun pisang, letakkan 1 potong daging ayam ungkep ke atasnya. Tambahkan ¼ bagian cabai rawit, dan daun kemangi. Lipat daun pisang membentuk tum, kemudian sematkan dengan tusuk gigi. Ulangi proses serupa pada sisa bahan.\r\n\r\n5 Kukus pepes ayam dalam dandang panas selama 15 menit. Angkat. Sajikan.', 'pepes.jpg'),
(8, 7, 1, 'Sayur Asem Jawa Timur', '01:00:00', 4, '100g buncis, potong 3 cm\r\n10 buah belimbing wuluh\r\n2 buah wortel, potong bulat tebal 1 cm\r\n200gr jagung putren, belah 2 memanjang\r\n10 buah cabai rawit merah\r\n2L air\r\n6 butir bawang merah, iris\r\n3 siung bawang putih, iris\r\n2 lembar daun salam\r\n2cm lengkuas, memarkan\r\n4 sdt garam\r\n1 sdt gula pasir\r\n3 sdm Bango Kecap Manis', '1 Rebus air, bawang merah, bawang putih, daun salam, lengkuas, dan belimbing sayur hingga harum.\r\n\r\n2 Masukkan buncis, wortel, jagung putren, cabai rawit, dan Bango Kecap Manis. Aduk rata.\r\n\r\n3 Tambahkan garam dan gula. Masak hingga matang.', 'sayur_asem.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id_role` bigint(20) NOT NULL,
  `nama_role` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id_role`, `nama_role`) VALUES
(1, 'Chef'),
(2, 'Pencari Resep');

-- --------------------------------------------------------

--
-- Table structure for table `suka`
--

CREATE TABLE `suka` (
  `id_suka` bigint(20) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_resep` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `suka`
--

INSERT INTO `suka` (`id_suka`, `id_user`, `id_resep`, `status`) VALUES
(1, 6, 2, 1),
(2, 1, 3, 1),
(3, 5, 1, 1),
(4, 1, 3, 1),
(5, 6, 5, 1),
(6, 6, 6, 1),
(7, 1, 5, 1),
(8, 5, 5, 1),
(9, 4, 6, 1),
(10, 3, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` bigint(20) NOT NULL,
  `id_role` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(50) NOT NULL,
  `gender` enum('Laki-Laki','Perempuan') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `id_role`, `nama`, `email`, `password`, `gender`) VALUES
(1, 2, 'khoirony', 'khoirony@gmail.com', '12345', 'Laki-Laki'),
(2, 1, 'Juna', 'juna@gmail.com', '23451', 'Laki-Laki'),
(3, 1, 'arnold', 'arnold@gmail.com', '99999', 'Laki-Laki'),
(4, 1, 'renata', 'renata@gmail.com', '2323', 'Perempuan'),
(5, 2, 'rendy', 'ren@gmail.com', '12345', 'Laki-Laki'),
(6, 2, 'abdul', 'abd@gmail.com', '2323', 'Laki-Laki'),
(7, 1, 'meyrinska', 'mey@gmail.com', '25255', 'Perempuan');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `kesulitan`
--
ALTER TABLE `kesulitan`
  ADD PRIMARY KEY (`id_kesulitan`);

--
-- Indexes for table `komentar`
--
ALTER TABLE `komentar`
  ADD PRIMARY KEY (`id_komentar`);

--
-- Indexes for table `mengkategorikan`
--
ALTER TABLE `mengkategorikan`
  ADD PRIMARY KEY (`id_mengkategorikan`);

--
-- Indexes for table `resep`
--
ALTER TABLE `resep`
  ADD PRIMARY KEY (`id_resep`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id_role`);

--
-- Indexes for table `suka`
--
ALTER TABLE `suka`
  ADD PRIMARY KEY (`id_suka`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `kesulitan`
--
ALTER TABLE `kesulitan`
  MODIFY `id_kesulitan` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `komentar`
--
ALTER TABLE `komentar`
  MODIFY `id_komentar` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `mengkategorikan`
--
ALTER TABLE `mengkategorikan`
  MODIFY `id_mengkategorikan` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `resep`
--
ALTER TABLE `resep`
  MODIFY `id_resep` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id_role` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `suka`
--
ALTER TABLE `suka`
  MODIFY `id_suka` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
