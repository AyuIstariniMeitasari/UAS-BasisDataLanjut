-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 08, 2025 at 01:52 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_latihan`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_kategori`
--

CREATE TABLE `tbl_kategori` (
  `id` int(11) UNSIGNED NOT NULL,
  `kategori` varchar(200) NOT NULL,
  `slug` varchar(100) DEFAULT NULL,
  `aktif` enum('Y','N') NOT NULL DEFAULT 'Y',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_kategori`
--

INSERT INTO `tbl_kategori` (`id`, `kategori`, `slug`, `aktif`, `created_at`, `updated_at`) VALUES
(1, 'Teknologi', NULL, 'Y', '2025-01-07 08:08:48', '2025-01-07 08:08:48'),
(2, 'Olahraga', NULL, 'Y', '2025-01-07 08:08:48', '2025-01-07 08:08:48'),
(3, 'Hiburan', NULL, 'Y', '2025-01-07 08:08:48', '2025-01-07 08:08:48'),
(4, 'Teknologi', NULL, 'Y', '2025-01-07 08:09:48', '2025-01-07 08:09:48'),
(5, 'Olahraga', NULL, 'Y', '2025-01-07 08:09:48', '2025-01-07 08:09:48'),
(6, 'Hiburan', NULL, 'Y', '2025-01-07 08:09:48', '2025-01-07 08:09:48');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_log`
--

CREATE TABLE `tbl_log` (
  `id` int(11) NOT NULL,
  `keterangan` enum('INSERT','UPDATE','DELETE') NOT NULL,
  `user` varchar(100) NOT NULL,
  `waktu` datetime NOT NULL DEFAULT current_timestamp(),
  `title_lama` varchar(255) DEFAULT NULL,
  `title_baru` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_posts`
--

CREATE TABLE `tbl_posts` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(200) NOT NULL,
  `slug` varchar(200) NOT NULL,
  `user_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `image` varchar(100) DEFAULT 'Noimage.jpg',
  `hits` int(11) NOT NULL DEFAULT 0,
  `active` enum('Y','N') NOT NULL DEFAULT 'Y',
  `status` enum('publish','draft') NOT NULL DEFAULT 'publish',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Triggers `tbl_posts`
--
DELIMITER $$
CREATE TRIGGER `log_delete_posts` BEFORE DELETE ON `tbl_posts` FOR EACH ROW BEGIN
    INSERT INTO tbl_log (keterangan, user, waktu, title_lama, title_baru)
    VALUES (
        'DELETE',
        SESSION_USER(),
        NOW(),
        OLD.title,
        NULL
    );
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `log_insert_posts` AFTER INSERT ON `tbl_posts` FOR EACH ROW BEGIN
    INSERT INTO tbl_log (keterangan, user, waktu, title_lama, title_baru)
    VALUES (
        'INSERT', 
        SESSION_USER(),  -- Bisa ganti dengan CURRENT_USER() jika diperlukan
        NOW(), 
        NULL, 
        NEW.title
    );
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `log_update_posts` BEFORE UPDATE ON `tbl_posts` FOR EACH ROW BEGIN
    INSERT INTO tbl_log (keterangan, user, waktu, title_lama, title_baru)
    VALUES (
        'UPDATE',
        SESSION_USER(),
        NOW(),
        OLD.title,
        NEW.title
    );
END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_kategori`
--
ALTER TABLE `tbl_kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_log`
--
ALTER TABLE `tbl_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_posts`
--
ALTER TABLE `tbl_posts`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_kategori`
--
ALTER TABLE `tbl_kategori`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_log`
--
ALTER TABLE `tbl_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_posts`
--
ALTER TABLE `tbl_posts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
