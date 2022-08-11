-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 13 Jan 2022 pada 07.38
-- Versi server: 10.4.19-MariaDB
-- Versi PHP: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fbhash`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add dataset', 7, 'add_dataset'),
(26, 'Can change dataset', 7, 'change_dataset'),
(27, 'Can delete dataset', 7, 'delete_dataset'),
(28, 'Can view dataset', 7, 'view_dataset'),
(29, 'Can add datatest', 8, 'add_datatest'),
(30, 'Can change datatest', 8, 'change_datatest'),
(31, 'Can delete datatest', 8, 'delete_datatest'),
(32, 'Can view datatest', 8, 'view_datatest'),
(33, 'Can add tf', 9, 'add_tf'),
(34, 'Can change tf', 9, 'change_tf'),
(35, 'Can delete tf', 9, 'delete_tf'),
(36, 'Can view tf', 9, 'view_tf');

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(7, 'kosin_proses', 'dataset'),
(8, 'kosin_proses', 'datatest'),
(9, 'kosin_proses', 'tf'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Struktur dari tabel `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2020-12-13 10:46:43.279963'),
(2, 'auth', '0001_initial', '2020-12-13 10:46:45.369763'),
(3, 'admin', '0001_initial', '2020-12-13 10:46:52.097485'),
(4, 'admin', '0002_logentry_remove_auto_add', '2020-12-13 10:46:53.785453'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2020-12-13 10:46:53.869895'),
(6, 'contenttypes', '0002_remove_content_type_name', '2020-12-13 10:46:55.163431'),
(7, 'auth', '0002_alter_permission_name_max_length', '2020-12-13 10:46:55.347298'),
(8, 'auth', '0003_alter_user_email_max_length', '2020-12-13 10:46:55.526413'),
(9, 'auth', '0004_alter_user_username_opts', '2020-12-13 10:46:55.624463'),
(10, 'auth', '0005_alter_user_last_login_null', '2020-12-13 10:46:56.198667'),
(11, 'auth', '0006_require_contenttypes_0002', '2020-12-13 10:46:56.239832'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2020-12-13 10:46:56.331484'),
(13, 'auth', '0008_alter_user_username_max_length', '2020-12-13 10:46:56.497483'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2020-12-13 10:46:56.742457'),
(15, 'auth', '0010_alter_group_name_max_length', '2020-12-13 10:46:56.932551'),
(16, 'auth', '0011_update_proxy_permissions', '2020-12-13 10:46:57.019745'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2020-12-13 10:46:57.200207'),
(18, 'kosin_proses', '0001_initial', '2020-12-13 10:46:57.868873'),
(19, 'kosin_proses', '0002_auto_20201119_0602', '2020-12-13 10:46:59.102139'),
(20, 'kosin_proses', '0003_auto_20201119_0613', '2020-12-13 10:47:00.006207'),
(21, 'kosin_proses', '0004_auto_20201120_0311', '2020-12-13 10:47:01.502553'),
(22, 'kosin_proses', '0005_auto_20201120_1214', '2020-12-13 10:47:02.417475'),
(23, 'sessions', '0001_initial', '2020-12-13 10:47:02.744834'),
(24, 'kosin_proses', '0006_auto_20210101_0919', '2021-01-01 09:19:15.178719'),
(25, 'kosin_proses', '0007_tf', '2021-02-03 20:39:38.138946'),
(26, 'kosin_proses', '0008_auto_20210321_1931', '2021-03-22 20:00:19.293241');

-- --------------------------------------------------------

--
-- Struktur dari tabel `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('00xibs27j7thipnv1uo6en5p2lswo6lx', '.eJxVjMsOwiAQRf-FtSE8CoMu3fsNhBkGqRqalHZl_HfbpAvd3nPOfYuY1qXGtfMcxywuQovT74aJntx2kB-p3SdJU1vmEeWuyIN2eZsyv66H-3dQU69bjRTIB2vQGKTBo9FegxtsAIakAmvtSyHHxfmzUrhJYI31QACsCmfx-QLSMDei:1l2EA9:i0XpnANEiD9xYT7XMFgClIl7eMzmwWZAofsrPHY3B1c', '2021-02-03 14:08:45.229259'),
('grzgwsxtcbd319ot6rq7cx9pgqhp8n28', '.eJzVjssOgjAURH_F3HXTtAVadOnelUsgzW25gMgjobAy_rtgMNFPcDtz5mQeYHGZG7sEmuythBNIYN-ZQ3-nYSvKFod65H4c5unm-IbwvQ38MpbUnXf2R9BgaNa186nXaaScUs7H2imppUniKDVkUKQkpa4qn1CV6KMQboVMpCJtvDEkKnpLewoBawqrLstysLYN4_BJc2CCKcFyuFKHPc6HEuf1Mc-hYH9KF_B8AX3YiM0:1l6yxD:sQyQf4G9woeCJgdZdqZCZiOWtOwvxtJklIuvPrXyfiU', '2021-02-16 16:55:03.269124'),
('iqob2w4bxqpqapmond9e3lsedzdcdqtt', '.eJxVjMsOwiAQRf-FtSE8CoMu3fsNhBkGqRqalHZl_HfbpAvd3nPOfYuY1qXGtfMcxywuQovT74aJntx2kB-p3SdJU1vmEeWuyIN2eZsyv66H-3dQU69bjRTIB2vQGKTBo9FegxtsAIakAmvtSyHHxfmzUrhJYI31QACsCmfx-QLSMDei:1kvYjJ:gg2sJdNp0v_TUCWr4Fx5eqXP17iMXdG2mn-e6wOxqG0', '2021-01-16 04:41:29.856935');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kosin_proses_dataset`
--

CREATE TABLE `kosin_proses_dataset` (
  `id` int(11) NOT NULL,
  `dataset_judul` longtext NOT NULL,
  `dataset_flie` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kosin_proses_dataset`
--

INSERT INTO `kosin_proses_dataset` (`id`, `dataset_judul`, `dataset_flie`) VALUES
(676, '1', '17_KB_kSB061j.jpeg'),
(677, '2', '29_KB.jpeg'),
(678, '3', '41_KB.jpeg'),
(679, '4', '42_KB.jpeg'),
(680, '5', '45_KB.jpeg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kosin_proses_datatest`
--

CREATE TABLE `kosin_proses_datatest` (
  `id` int(11) NOT NULL,
  `datates_judul` longtext NOT NULL,
  `datates_flie` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kosin_proses_datatest`
--

INSERT INTO `kosin_proses_datatest` (`id`, `datates_judul`, `datates_flie`) VALUES
(757, 'datatest', '17_KB_MQN55NG.jpeg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kosin_proses_tf`
--

CREATE TABLE `kosin_proses_tf` (
  `id` int(11) NOT NULL,
  `kata` varchar(225) NOT NULL,
  `frequency` int(11) NOT NULL,
  `dataset_id` int(11) NOT NULL,
  `dataset_judul` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `kosin_proses_tf`
--

INSERT INTO `kosin_proses_tf` (`id`, `kata`, `frequency`, `dataset_id`, `dataset_judul`) VALUES
(9454, 'SELAMAT', 1, 676, '1'),
(9455, 'ELAMAT ', 1, 676, '1'),
(9456, 'LAMAT D', 1, 676, '1'),
(9457, 'AMAT DA', 1, 676, '1'),
(9458, 'MAT DAN', 1, 676, '1'),
(9459, 'AT DAN ', 1, 676, '1'),
(9460, 'T DAN S', 1, 676, '1'),
(9461, ' DAN SU', 1, 676, '1'),
(9462, 'DAN SUK', 1, 676, '1'),
(9463, 'AN SUKS', 1, 676, '1'),
(9464, 'N SUKSE', 1, 676, '1'),
(9465, ' SUKSES', 1, 676, '1'),
(9466, 'HELLO J', 1, 677, '2'),
(9467, 'ELLO JA', 1, 677, '2'),
(9468, 'LLO JAM', 1, 677, '2'),
(9469, 'LO JAMA', 1, 677, '2'),
(9470, 'O JAMAL', 1, 677, '2'),
(9471, 'SELAMAT', 1, 678, '3'),
(9472, 'ELAMAT ', 1, 678, '3'),
(9473, 'LAMAT P', 1, 678, '3'),
(9474, 'AMAT PA', 1, 678, '3'),
(9475, 'MAT PAG', 1, 678, '3'),
(9476, 'AT PAGI', 1, 678, '3'),
(9477, 'SELAMAT', 1, 679, '4'),
(9478, 'ELAMAT ', 1, 679, '4'),
(9479, 'LAMAT D', 1, 679, '4'),
(9480, 'AMAT DA', 1, 679, '4'),
(9481, 'MAT DAT', 1, 679, '4'),
(9482, 'AT DATA', 1, 679, '4'),
(9483, 'T DATAN', 1, 679, '4'),
(9484, ' DATANG', 1, 679, '4'),
(9485, '| AM JA', 1, 680, '5'),
(9486, ' AM JAM', 1, 680, '5'),
(9487, 'AM JAMA', 1, 680, '5'),
(9488, 'M JAMAL', 1, 680, '5');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indeks untuk tabel `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indeks untuk tabel `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indeks untuk tabel `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indeks untuk tabel `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indeks untuk tabel `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indeks untuk tabel `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indeks untuk tabel `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indeks untuk tabel `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indeks untuk tabel `kosin_proses_dataset`
--
ALTER TABLE `kosin_proses_dataset`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `kosin_proses_datatest`
--
ALTER TABLE `kosin_proses_datatest`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `kosin_proses_tf`
--
ALTER TABLE `kosin_proses_tf`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `kosin_proses_dataset`
--
ALTER TABLE `kosin_proses_dataset`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=681;

--
-- AUTO_INCREMENT untuk tabel `kosin_proses_datatest`
--
ALTER TABLE `kosin_proses_datatest`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=758;

--
-- AUTO_INCREMENT untuk tabel `kosin_proses_tf`
--
ALTER TABLE `kosin_proses_tf`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9489;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
