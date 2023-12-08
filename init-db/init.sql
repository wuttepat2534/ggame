-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: Nov 02, 2023 at 02:00 PM
-- Server version: 8.0.34
-- PHP Version: 8.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_gggame`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `datetime_lastlogin` datetime DEFAULT NULL,
  `get_browser` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `status` enum('Y','N') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y',
  `status_delete` enum('Y','N') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `contact_number` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`, `username`, `password`, `datetime_lastlogin`, `get_browser`, `status`, `status_delete`, `created_at`, `updated_at`, `contact_number`) VALUES
(1, 'admin', 'admin01', '$2a$12$txRrO/VE/XsEIurb9Gs.2.KZg0sw1SAjLMUzQgTad7X2UQ1mZOv1q', NULL, NULL, 'Y', 'Y', '2023-04-17 06:23:16', '2023-04-17 06:23:16', '0978454454'),
(2, 'admintest00', 'admintest', '$2a$12$U5KKkYIBfDy1XnM3lsyqEe3Rc/dCeRzluqkcHM4TSuKxkuK0g/7h2', NULL, NULL, 'Y', 'N', '2023-04-17 07:50:51', '2023-04-17 07:50:51', '0788751245'),
(3, 'admintest01', 'admintest01', '$2a$12$c3q0ErCOJt3Ww2bP9UESJ.EKcdzk4wlU7YM49aPw9s3Tvqv5noPWu', NULL, NULL, 'Y', 'N', '2023-04-17 09:27:54', '2023-04-17 09:27:54', '0854415621'),
(4, 'admintest02', 'admintest02', '$2a$12$8LBsaQ052PkMsjqYPRQkWu0Pn7nTIpchhoPeS3GOpNRDwhVVMcrei', NULL, NULL, 'Y', 'N', '2023-04-20 07:31:53', '2023-04-20 07:31:53', '0789445254'),
(5, 'admintest3', 'admintest3', '$2a$12$yhidiomnp6JDuMiW8e5A5u1tDZnPK4rASqO0bqy00wTSsKH5a4QU2', NULL, NULL, 'Y', 'N', '2023-04-20 07:32:10', '2023-04-20 07:32:10', '0545453333'),
(6, 'admintest4', 'admintest4', '$2a$12$oaZ6eitByvwaai4Svr05YO.0QLR1VhH50D7oxwiPoACbEqCqxe962', NULL, NULL, 'Y', 'N', '2023-04-20 07:32:18', '2023-04-20 07:32:18', '0990825941'),
(7, 'admintest05', 'admintest05', '$2a$12$Y4D0aE9P3f5lq6KSvOgN8u6lD6hC2pgZjiXn.uVvLpEkXZIfuzjnK', NULL, NULL, 'Y', 'N', '2023-04-20 07:32:25', '2023-04-20 07:32:25', '0545453333'),
(8, 'admintest06', 'admintest06', '$2a$12$sbsgT9VBhV70cx6j2KUPfuK744bmo49nW7hKtgojcxlLmCixrcsOm', NULL, NULL, 'Y', 'N', '2023-04-20 07:32:33', '2023-04-20 07:32:33', '0'),
(9, 'admin06', 'admin06', '$2a$12$IHq5WMEQy42pLWUkliwHbONcD/3AxRLuZ6fcTTILx5noX.H6VXIWi', NULL, NULL, 'Y', 'N', '2023-04-20 07:32:46', '2023-04-20 07:32:46', '0'),
(10, 'admin10', 'admin10', '$2a$12$.78r2Cnu8Fa6cazVev1dm.VvXIajjDfLPB87Qju9.0NU9bxRG5MGa', NULL, NULL, 'Y', 'N', '2023-04-20 07:33:00', '2023-04-20 07:33:00', '0'),
(11, 'admin11', 'admin11', '$2a$12$3rEnwyqClA7jLaY85Gg41.Qqv17IvrexIjVD3LWo93zJiTrXRd2Ri', NULL, NULL, 'Y', 'N', '2023-04-20 07:33:07', '2023-04-20 07:33:07', '0'),
(12, 'admin011', 'admin011', '$2a$12$PC3jgUNpwgb6OtpnxW4.gOVFSMwDB3rL5qu58fGWmVRGTX/Z5s5PO', NULL, NULL, 'Y', 'N', '2023-04-20 07:33:14', '2023-04-20 07:33:14', '0'),
(13, 'Admin012', 'Admin012', '$2a$12$eDFFTJAwv5Vv4bQXwbMcV.9C1wijhrKvLurvf.gjv1xV6PAqDgXOa', NULL, NULL, 'Y', 'N', '2023-04-20 13:59:53', '2023-04-20 13:59:53', '0'),
(14, 'adminhui', 'adminhui', '$2a$12$QNxyS1TZxB9slDNVli7RiOEr2w3n9yyfo2JK5GSz7PKrG1T6pP9BK', NULL, NULL, 'Y', 'N', '2023-04-24 19:03:48', '2023-04-24 19:03:48', '0'),
(15, 'หุ้ย01', 'huiadmin01', '$2a$12$dCHdgf1dSammHVJjXdoPj.MrBHi1L2uD6vHRI.ih.Ozm7SgYc7N9C', NULL, NULL, 'Y', 'N', '2023-04-25 03:57:44', '2023-04-25 03:57:44', '0'),
(16, 'adminHuiTest', 'adminHuiTest', '$2a$12$prb54Qvobxcic7l1L9TZ.eRoRFbh/vRwCGA/xRQ4jJ7VpHS58Sd5q', NULL, NULL, 'Y', 'N', '2023-04-26 08:01:11', '2023-04-26 08:01:11', '0990825964'),
(17, 'GGadmin', 'GGadmin', '$2a$12$tRreQ5jBpi006qaorG/RRuk0txL7KFNNvFYflglzzb7EtxDnqWYXe', NULL, NULL, 'Y', 'N', '2023-04-26 08:02:41', '2023-04-26 08:02:41', '0990825964'),
(18, 'GGadmin01', 'GGadmin01', '$2a$12$80tuRgfHVGlUkGbt4Z85ZuMe8GRMC2KOP7VnzAuT/vQyCp63.k.Ya', NULL, NULL, 'Y', 'N', '2023-04-26 08:09:05', '2023-04-26 08:09:05', '0990825941'),
(19, 'GGadmin02', 'GGadmin02', '$2a$12$K67OF9SPf1M//rAu1.d1pu2cKAgTnE/pGUeSWf71Rkuih8f8.9Szy', NULL, NULL, 'Y', 'N', '2023-04-26 08:10:52', '2023-04-26 08:10:52', '0990825964');

-- --------------------------------------------------------

--
-- Table structure for table `agent`
--

CREATE TABLE `agent` (
  `id` bigint UNSIGNED NOT NULL,
  `website_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `status` enum('Y','N') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y',
  `status_delete` enum('Y','N') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `contact_number` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `credit` float(15,2) DEFAULT '0.00',
  `commission` float(15,2) DEFAULT '0.00',
  `tpye` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'agent',
  `role` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `agent`
--

INSERT INTO `agent` (`id`, `website_name`, `name`, `username`, `password`, `status`, `status_delete`, `created_at`, `updated_at`, `contact_number`, `credit`, `commission`, `tpye`, `role`) VALUES
(1, NULL, 'agent001', 'agent111', '$2a$12$lOTfpiqpS4UUw4OUD970seeZ0EfVWtQk/yYM0FBwqMx3zJzwfD1nC', 'Y', 'N', '2023-04-18 10:01:41', '2023-04-18 10:01:41', '0778569255', 40000.00, 300.00, 'agent', NULL),
(2, NULL, 'agent002', 'agent01', '$2a$12$lOTfpiqpS4UUw4OUD970seeZ0EfVWtQk/yYM0FBwqMx3zJzwfD1nC', 'Y', 'N', '2023-04-18 10:09:44', '2023-04-18 10:09:44', '0778888888', 10000.00, 200.00, 'agent', NULL),
(3, NULL, 'undefined', 'agent03', '$2a$12$lOTfpiqpS4UUw4OUD970seeZ0EfVWtQk/yYM0FBwqMx3zJzwfD1nC', 'Y', 'Y', '2023-04-18 10:09:50', '2023-04-18 10:09:50', '0452342377', 30000.00, 0.00, 'agent', NULL),
(4, NULL, 'agent04', 'agent04', '$2a$12$lOTfpiqpS4UUw4OUD970seeZ0EfVWtQk/yYM0FBwqMx3zJzwfD1nC', 'Y', 'N', '2023-04-20 10:50:05', '2023-04-20 10:50:05', '0883569875', 30254.00, 0.00, 'agent', NULL),
(5, NULL, 'Bookiezz', 'agent05', '$2a$12$lOTfpiqpS4UUw4OUD970seeZ0EfVWtQk/yYM0FBwqMx3zJzwfD1nC', 'Y', 'N', '2023-04-20 10:50:11', '2023-04-20 10:50:11', '0545453333', 300000.00, 0.00, 'agent', NULL),
(6, NULL, 'undefined', 'agent05', '$2a$12$lOTfpiqpS4UUw4OUD970seeZ0EfVWtQk/yYM0FBwqMx3zJzwfD1nC', 'Y', 'N', '2023-04-20 10:50:20', '2023-04-20 10:50:20', '0990825941', 40000.00, 300.00, 'agent', NULL),
(7, NULL, 'agent055', 'agent055', '$2a$12$lOTfpiqpS4UUw4OUD970seeZ0EfVWtQk/yYM0FBwqMx3zJzwfD1nC', 'Y', 'N', '2023-04-20 10:50:27', '2023-04-20 10:50:27', '0943169915', 4500.00, 2055.00, 'agent', NULL),
(8, NULL, 'agent066', 'agent066', '$2a$12$lOTfpiqpS4UUw4OUD970seeZ0EfVWtQk/yYM0FBwqMx3zJzwfD1nC', 'Y', 'N', '2023-04-20 10:50:35', '2023-04-20 10:50:35', NULL, 0.00, 1000.00, 'agent', NULL),
(9, NULL, 'agent07', 'agent07', '$2a$12$lOTfpiqpS4UUw4OUD970seeZ0EfVWtQk/yYM0FBwqMx3zJzwfD1nC', 'Y', 'N', '2023-04-20 10:50:42', '2023-04-20 10:50:42', NULL, 0.00, 0.00, 'agent', NULL),
(10, NULL, 'agent11', 'agent11', '$2a$12$lOTfpiqpS4UUw4OUD970seeZ0EfVWtQk/yYM0FBwqMx3zJzwfD1nC', 'Y', 'N', '2023-04-20 10:50:49', '2023-04-20 10:50:49', NULL, 0.00, 700.00, 'agent', NULL),
(11, NULL, 'agent12', 'agent12', '$2a$12$lOTfpiqpS4UUw4OUD970seeZ0EfVWtQk/yYM0FBwqMx3zJzwfD1nC', 'Y', 'N', '2023-04-20 10:51:04', '2023-04-20 10:51:04', NULL, 0.00, 0.00, 'agent', NULL),
(12, NULL, 'agent14', 'agent14', '$2a$12$lOTfpiqpS4UUw4OUD970seeZ0EfVWtQk/yYM0FBwqMx3zJzwfD1nC', 'Y', 'N', '2023-04-20 10:51:11', '2023-04-20 10:51:11', NULL, 0.00, 0.00, 'agent', NULL),
(13, NULL, 'agent111', 'agent111', '$2a$12$lOTfpiqpS4UUw4OUD970seeZ0EfVWtQk/yYM0FBwqMx3zJzwfD1nC', 'Y', 'N', '2023-04-20 10:51:19', '2023-04-20 10:51:19', NULL, 0.00, 0.00, 'agent', NULL),
(14, NULL, 'agent0234', 'agent0234', '$2a$12$lOTfpiqpS4UUw4OUD970seeZ0EfVWtQk/yYM0FBwqMx3zJzwfD1nC', 'Y', 'N', '2023-04-26 06:06:45', '2023-04-26 06:06:45', '0990854415', 50004.00, 0.00, 'agent', NULL),
(15, NULL, 'fgdgdgd', 'dgdgdgd', '$2a$12$lOTfpiqpS4UUw4OUD970seeZ0EfVWtQk/yYM0FBwqMx3zJzwfD1nC', 'Y', 'N', '2023-04-26 06:08:52', '2023-04-26 06:08:52', '0555555555', 0.00, 250.00, 'agent', NULL),
(16, NULL, 'GGagent01', 'GGagent01', '$2a$12$lOTfpiqpS4UUw4OUD970seeZ0EfVWtQk/yYM0FBwqMx3zJzwfD1nC', 'Y', 'N', '2023-04-26 08:12:31', '2023-04-26 08:12:31', '0990825964', 15000.00, 0.00, 'agent', NULL),
(17, NULL, 'OstArifureta', 'ffffffff', '$2a$12$lOTfpiqpS4UUw4OUD970seeZ0EfVWtQk/yYM0FBwqMx3zJzwfD1nC', 'Y', 'N', '2023-05-19 07:24:57', '2023-05-19 07:24:57', '0998542263', 5020.00, 0.00, 'agent', NULL),
(18, NULL, 'Ginga', 'UltramanGinga', '$2a$12$3GUX8XgasDzSwn/GtopoheRNkUb6QQMnG8pgNnA4C1xQ/6QQsH.hK', 'Y', 'N', '2023-05-24 16:39:20', '2023-05-24 16:39:20', '0838985624', 52300.00, 0.00, 'agent', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `allgame`
--

CREATE TABLE `allgame` (
  `id` bigint NOT NULL,
  `namegame` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `img` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `linkgame` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `allgame`
--

INSERT INTO `allgame` (`id`, `namegame`, `img`, `linkgame`) VALUES
(1, 'Go Gold Planet', 'https://dogzilla.live/images/icon_3', 'https://gogoldplanet.toonta.com'),
(2, 'Lucky Bunny Gold', 'https://dogzilla.live/images/icon_2', 'https://luckybunnygold.toonta.com'),
(3, 'CowBoys VS Aliens', 'https://dogzilla.live/images/icon_1', 'https://cowboyvsalien.toonta.com'),
(4, 'Buunty Balloon', 'https://dogzilla.live/images/icon_5', 'https://bountyballoon.toonta.com'),
(6, 'RoBo Farm', 'https://dogzilla.live/images/icon_4', 'https://robofarm.toonta.com'),
(7, 'Tower Rush', 'https://dogzilla.live/images/icon_6', 'https://towerrush.toonta.com');

-- --------------------------------------------------------

--
-- Table structure for table `banknames`
--

CREATE TABLE `banknames` (
  `id` bigint UNSIGNED NOT NULL,
  `bankname_code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `bankname_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `images` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `status` enum('Y','N') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y',
  `status_delete` enum('Y','N') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `banknames`
--

INSERT INTO `banknames` (`id`, `bankname_code`, `bankname_name`, `images`, `status`, `status_delete`, `created_at`, `updated_at`) VALUES
(1, 'BBL', 'ธนาคารกรุงเทพ', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-bbl.png', 'Y', 'N', '2022-01-04 08:54:54', '2023-05-05 14:04:29'),
(2, 'KBANK', 'ธนาคารกสิกรไทย', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-kbank.png', 'Y', 'N', '2022-01-04 08:54:54', '2022-01-04 08:54:54'),
(3, 'SCB', 'ธนาคารไทยพาณิชย์', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-scb.png', 'Y', 'N', '2022-01-04 08:54:54', '2022-01-04 08:54:54'),
(4, 'BAY', 'ธนาคารกรุงศรีอยุธยา', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-bay.png', 'Y', 'N', '2022-01-04 08:54:54', '2023-05-05 12:19:41'),
(5, 'KTB', 'ธนาคารกรุงไทย', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-ktb.png', 'Y', 'N', '2022-01-04 08:54:54', '2022-01-04 08:54:54'),
(6, 'TMB', 'ทหารไทย', '6.png', 'Y', 'N', '2022-01-04 08:54:54', '2022-01-04 08:54:54'),
(7, 'KKP', 'ธนาคารเกียรตินาคินภัทร', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-kk.png', 'Y', 'N', '2022-01-04 08:54:54', '2022-01-04 08:54:54'),
(8, 'CIMB', 'ธนาคารซีไอเอ็มบีไทย', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-cimb.png', 'Y', 'N', '2022-01-04 08:54:54', '2022-01-04 08:54:54'),
(9, 'TISCO', 'ธนาคารทิสโก้', '9.png', 'Y', 'N', '2022-01-04 08:54:54', '2022-01-04 08:54:54'),
(10, 'TBANK', 'ธนาคารทหารไทยธนชาต', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-ttb.png', 'Y', 'N', '2022-01-04 08:54:54', '2022-01-04 08:54:54'),
(11, 'LHBANK', 'แลนด์ แอนด์ เฮ้าส์', '11.png', 'Y', 'N', '2022-01-04 08:54:54', '2022-01-04 08:54:54'),
(12, 'UOB', 'ธนาคารยูโอบี', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.uob.co.th%2Fpersonal%2Findex.page&psig=AOvVaw2KddkKwBRjVK_cWM1YgvvI&ust=1690280164670000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCMDwyriOp4ADFQAAAAAdAAAAABAE', 'Y', 'N', '2022-01-04 08:54:54', '2022-01-04 08:54:54'),
(13, 'STAN', 'สแตนดาร์ดชาร์เตอร์ด', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-sc.png', 'Y', 'N', '2022-01-04 08:54:54', '2022-01-04 08:54:54'),
(14, 'ICBC', 'ธนาคารไอซีบีซี (ไทย)', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-cimb.png', 'Y', 'N', '2022-01-04 08:54:54', '2022-01-04 08:54:54'),
(15, 'GSB', 'ธนาคารออมสิน', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-gsb.png', 'Y', 'N', '2022-01-04 08:54:54', '2022-01-04 08:54:54'),
(16, 'GHBANK', 'ธนาคารอาคารสงเคราะห์', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-baac.png', 'Y', 'N', '2022-01-04 08:54:54', '2022-01-04 08:54:54'),
(17, 'IBANK', 'อิสลามแห่งประเทศไทย', '17.png', 'Y', 'N', '2022-01-04 08:54:54', '2022-01-04 08:54:54');

-- --------------------------------------------------------

--
-- Table structure for table `comgogoldplanet`
--

CREATE TABLE `comgogoldplanet` (
  `id` bigint NOT NULL,
  `bet_gogold` float DEFAULT '0',
  `win_gogold` float DEFAULT '0',
  `bet_luckybunny` float(15,2) DEFAULT '0.00',
  `win_luckybunny` float(15,2) DEFAULT '0.00',
  `bet_aliens` float(15,2) DEFAULT '0.00',
  `win_aliens` decimal(15,2) DEFAULT '0.00',
  `commission` float(15,2) DEFAULT '0.00',
  `day` date DEFAULT NULL,
  `monthly` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comgogoldplanet`
--

INSERT INTO `comgogoldplanet` (`id`, `bet_gogold`, `win_gogold`, `bet_luckybunny`, `win_luckybunny`, `bet_aliens`, `win_aliens`, `commission`, `day`, `monthly`) VALUES
(20, 0, 0, 0.00, 0.00, 0.00, 0.00, 0.00, '2023-10-23', '2023-10-23'),
(21, 0, 0, 0.00, 0.00, 0.00, 0.00, 0.00, '2023-10-24', '2023-10-24'),
(22, 0, 0, 0.00, 0.00, 0.00, 0.00, 0.00, '2023-11-01', '2023-11-01');

-- --------------------------------------------------------

--
-- Table structure for table `commissionsubagent`
--

CREATE TABLE `commissionsubagent` (
  `id` bigint NOT NULL,
  `idsub_agent` bigint DEFAULT NULL,
  `id_agent` bigint DEFAULT NULL,
  `game_id` float(15,2) DEFAULT NULL,
  `total` float(15,2) DEFAULT '0.00',
  `time` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `commissionsubagent`
--

INSERT INTO `commissionsubagent` (`id`, `idsub_agent`, `id_agent`, `game_id`, `total`, `time`) VALUES
(1, 2, 2, 1.00, 0.00, '2023-05-22');

-- --------------------------------------------------------

--
-- Table structure for table `creditpromotion`
--

CREATE TABLE `creditpromotion` (
  `id` bigint NOT NULL,
  `agnetidcreate` int NOT NULL,
  `repost` enum('ทั่วไป','อีเวนท์') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'ทั่วไป',
  `startpromotion` date NOT NULL,
  `endpromotion` date NOT NULL,
  `typebonus` enum('Percent','Fixed rate') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'Percent',
  `bunus` float(15,2) NOT NULL DEFAULT '0.00',
  `maxbunus` float(15,2) NOT NULL,
  `valusbunus` float(15,2) NOT NULL,
  `groupuser` varchar(300) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `afterPromotion` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `receiving_data_type` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `valus_receiving` int NOT NULL,
  `data_type` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `valus_day` int NOT NULL,
  `numberoftimes_person` int NOT NULL,
  `ipAddress_attempts` int NOT NULL,
  `reset` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_danish_ci NOT NULL,
  `withdrawalType` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `withdraw_data_type` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'ไม่มี',
  `withdraw_max` float(15,2) NOT NULL DEFAULT '1.00',
  `withdraw_valus` int NOT NULL DEFAULT '0',
  `statuspromotion` enum('Y','N') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'Y',
  `promotiontype` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `namepromotion` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `leakedPro` enum('เปอร์เซ็นต์','ค่าคงที่') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'เปอร์เซ็นต์',
  `receiving_data_typeI` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `receiving_data_typeII` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `data_typeI` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `data_typeII` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `resetI` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `resetII` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `withdrawalTypeII` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `withdrawalTypeIII` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `withdraw_valusII` int NOT NULL DEFAULT '0',
  `withdraw_valusIII` int NOT NULL DEFAULT '0',
  `status_topup` enum('Y','N') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'N',
  `filename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `details` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `passwordpromotion` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `promotionsupport` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `webtype` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `multiplier` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `typelistsuppost` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `quantity` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `quantityI` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `quantityII` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `creditpromotion`
--

INSERT INTO `creditpromotion` (`id`, `agnetidcreate`, `repost`, `startpromotion`, `endpromotion`, `typebonus`, `bunus`, `maxbunus`, `valusbunus`, `groupuser`, `afterPromotion`, `receiving_data_type`, `valus_receiving`, `data_type`, `valus_day`, `numberoftimes_person`, `ipAddress_attempts`, `reset`, `withdrawalType`, `withdraw_data_type`, `withdraw_max`, `withdraw_valus`, `statuspromotion`, `promotiontype`, `namepromotion`, `leakedPro`, `receiving_data_typeI`, `receiving_data_typeII`, `data_typeI`, `data_typeII`, `resetI`, `resetII`, `withdrawalTypeII`, `withdrawalTypeIII`, `withdraw_valusII`, `withdraw_valusIII`, `status_topup`, `filename`, `details`, `passwordpromotion`, `promotionsupport`, `webtype`, `multiplier`, `typelistsuppost`, `quantity`, `quantityI`, `quantityII`) VALUES
(1, 2, 'ทั่วไป', '2023-10-24', '2023-10-24', 'Percent', 100.00, 500.00, 5.00, '', '', 'ฝากเงินครั้งแรก', 0, '', 0, 0, 0, '00.00.00', 'Turnover Rate', '', 0.00, 0, 'N', 'ฝาก', 'โบนัสต้อนรับสมาชิกใหม่ 100%', 'ค่าคงที่', 'undefined', 'undefined', 'undefined', 'undefined', '00.00.00', '00.00.00', 'ถอน', '', 3000, 0, 'N', 'file_dateVal_1698380448100_banner01.jpg', '<span style=\"color: rgb(230, 0, 0);\">เงื่อนไข</span><ul><li>สำหรับสมาชิกใหม่เท่านั้น</li><li>ฝากขั้นต่ำ 100 บาท จึงจะมีสิทธิ์รับโบนัส</li><li>สมาชิกต้องทำเทิร์น 5 เท่า จึงจะมีสิทธิ์ถอน-</li><li>ถอนสูงสุด 3000 บาท</li><li>ค่ายเกมส์ที่ร่วมรายการ PG Solf , Dogzilla เท่านั้น</li></ul><br>*<span style=\"color: rgb(0, 71, 178);\">หากพบเห็นเจตนาในการล่าโปรโมชั่นหรือการใช้ช่องโหว่ใดๆ เพื่อเอื้อประโยชน์ให้กับผู้เล่นจากการรับเงินโบนัส TOONTA ขอสงวนสิทธิ์ในการระงับการจ่ายเงินและยิดเครดิตทั้งหมด ทุกกรณี!&nbsp;การตัดสินของทีมงานถือเป็นที่สิ้นสุด</span>', 'cost-type-euyfxd', 'PG Soft,Slotxo,Joker123,Askmebet,Habanero,Spade Gaming,Micro Gaming,Simple Play,Live22,Evoplay,CQ9,Jili,Mannaplay,Funky Games,Yggdrasil Gaming,UPG Slot,Ameba,Ambslot,Netent2,Red Tiger,Dragon Gaming,Ace333,I8,WmSlot,Spinix,Ninja slot,918 Kiss,Pragmatic Play Slot,DOGZILLA', 'game', '5', 'PG Soft,Slotxo,Joker123,Askmebet,Habanero,Spade Gaming,Micro Gaming,Simple Play,Live22,Evoplay,CQ9,Jili,Mannaplay,Funky Games,Yggdrasil Gaming,UPG Slot,Ameba,Ambslot,Netent2,Red Tiger,Dragon Gaming,Ace333,I8,WmSlot,Spinix,Ninja slot,918 Kiss,Pragmatic Play Slot,DOGZILLA', NULL, NULL, NULL),
(2, 2, 'ทั่วไป', '2023-10-20', '2023-10-20', 'Percent', 30.00, 300.00, 5.00, '', '', 'รายวัน', 0, '', 0, 0, 0, '00.00.00', 'Turnover Rate', '', 0.00, 0, 'N', 'ฝาก', 'ฝากแรกของวันรับโบนัส 30%', 'ค่าคงที่', '', 'undefined', '', 'undefined', '00.00.00', '00.00.00', 'ถอน', '', 5000, 0, 'N', 'null', '- ค่ายเกมส์ที่ร่วมรายการ PG Soft , Dogzilla เท่านั้น\n- ฝากขั้นต่ำ 100 \n- โบนัสสูงสุด 300\n- เทิร์นโอเวอร์ 5 เท่า\n- ถอนได้สูงสุด 5,000 บาท\n- โปรโมชั่นนี้รับได้ 1 ครั้ง / วัน\n- ห้ามซื้อฟรีสปิน ห้ามสะสมฟรีเกมส์\n\nตัวอย่างเทิร์นโอเวอร์ \nเงินฝากครั้งแรก = 300 บาท\nโบนัส = 30% x 300 บาท = 90 บาท\nยอดเงินที่ต้องทำการเทิร์นโอเวอร์ = ( เงินฝาก 300 + โบนัส 90 ) x 5 = 1,950 บาท\n\n*หากพบเห็นเจตนาในการล่าโปรโมชั่นหรือการใช้ช่องโหว่ใดๆ เพื่อเอื้อประโยชน์ให้กับผู้เล่นจากการรับเงินโบนัส SANDWIN ขอสงวนสิทธิ์ในการระงับการจ่ายเงินและยิดเครดิตทั้งหมด ทุกกรณี! การตัดสินของทีมงานถือเป็นที่สิ้นสุด', 'cost-type-rk0b4f', 'PG Soft,Slotxo,Joker123,Askmebet,Habanero,Spade Gaming,Micro Gaming,Simple Play,Live22,Evoplay,CQ9,Jili,Mannaplay,Funky Games,Yggdrasil Gaming,UPG Slot,Ameba,Ambslot,Netent2,Red Tiger,Dragon Gaming,Ace333,I8,WmSlot,Spinix,Ninja slot,918 Kiss,Pragmatic Play Slot,DOGZILLA', 'game', '5', 'undefined', NULL, NULL, NULL),
(3, 2, 'ทั่วไป', '2023-10-20', '2023-10-20', 'Percent', 30.00, 300.00, 5.00, '', '', 'รายวัน', 0, '', 0, 0, 0, '00.00.00', 'Turnover Rate', '', 0.00, 0, 'N', 'ฝาก', 'ฝากแรกของวันรับโบนัส 30%', 'ค่าคงที่', '', 'undefined', '', 'undefined', '00.00.00', '00.00.00', 'ถอน', '', 5000, 0, 'N', 'null', '- ค่ายเกมส์ที่ร่วมรายการ PG Soft , Dogzilla เท่านั้น\n- ฝากขั้นต่ำ 100 \n- โบนัสสูงสุด 300\n- เทิร์นโอเวอร์ 5 เท่า\n- ถอนได้สูงสุด 5,000 บาท\n- โปรโมชั่นนี้รับได้ 1 ครั้ง / วัน\n- ห้ามซื้อฟรีสปิน ห้ามสะสมฟรีเกมส์\n\nตัวอย่างเทิร์นโอเวอร์ \nเงินฝากครั้งแรก = 300 บาท\nโบนัส = 30% x 300 บาท = 90 บาท\nยอดเงินที่ต้องทำการเทิร์นโอเวอร์ = ( เงินฝาก 300 + โบนัส 90 ) x 5 = 1,950 บาท\n\n*หากพบเห็นเจตนาในการล่าโปรโมชั่นหรือการใช้ช่องโหว่ใดๆ เพื่อเอื้อประโยชน์ให้กับผู้เล่นจากการรับเงินโบนัส SANDWIN ขอสงวนสิทธิ์ในการระงับการจ่ายเงินและยิดเครดิตทั้งหมด ทุกกรณี! การตัดสินของทีมงานถือเป็นที่สิ้นสุด', 'cost-type-rk0b4f', 'PG Soft,Slotxo,Joker123,Askmebet,Habanero,Spade Gaming,Micro Gaming,Simple Play,Live22,Evoplay,CQ9,Jili,Mannaplay,Funky Games,Yggdrasil Gaming,UPG Slot,Ameba,Ambslot,Netent2,Red Tiger,Dragon Gaming,Ace333,I8,WmSlot,Spinix,Ninja slot,918 Kiss,Pragmatic Play Slot,DOGZILLA', 'game', '5', 'undefined', NULL, NULL, NULL),
(4, 2, 'ทั่วไป', '2023-10-20', '2023-10-20', 'Percent', 30.00, 300.00, 5.00, '', '', 'รายวัน', 0, '', 0, 0, 0, '00.00.00', 'Turnover Rate', '', 0.00, 0, 'N', 'ฝาก', 'ฝากแรกของวันรับโบนัส 30%', 'ค่าคงที่', '', 'undefined', '', 'undefined', '00.00.00', '00.00.00', 'ถอน', '', 5000, 0, 'N', 'null', '- ค่ายเกมส์ที่ร่วมรายการ PG Soft , Dogzilla เท่านั้น\n- ฝากขั้นต่ำ 100 \n- โบนัสสูงสุด 300\n- เทิร์นโอเวอร์ 5 เท่า\n- ถอนได้สูงสุด 5,000 บาท\n- โปรโมชั่นนี้รับได้ 1 ครั้ง / วัน\n- ห้ามซื้อฟรีสปิน ห้ามสะสมฟรีเกมส์\n\nตัวอย่างเทิร์นโอเวอร์ \nเงินฝากครั้งแรก = 300 บาท\nโบนัส = 30% x 300 บาท = 90 บาท\nยอดเงินที่ต้องทำการเทิร์นโอเวอร์ = ( เงินฝาก 300 + โบนัส 90 ) x 5 = 1,950 บาท\n\n*หากพบเห็นเจตนาในการล่าโปรโมชั่นหรือการใช้ช่องโหว่ใดๆ เพื่อเอื้อประโยชน์ให้กับผู้เล่นจากการรับเงินโบนัส SANDWIN ขอสงวนสิทธิ์ในการระงับการจ่ายเงินและยิดเครดิตทั้งหมด ทุกกรณี! การตัดสินของทีมงานถือเป็นที่สิ้นสุด', 'cost-type-rk0b4f', 'PG Soft,Slotxo,Joker123,Askmebet,Habanero,Spade Gaming,Micro Gaming,Simple Play,Live22,Evoplay,CQ9,Jili,Mannaplay,Funky Games,Yggdrasil Gaming,UPG Slot,Ameba,Ambslot,Netent2,Red Tiger,Dragon Gaming,Ace333,I8,WmSlot,Spinix,Ninja slot,918 Kiss,Pragmatic Play Slot,DOGZILLA', 'game', '5', 'undefined', NULL, NULL, NULL),
(5, 2, 'ทั่วไป', '2023-10-23', '2023-10-23', 'Percent', 10.00, 100.00, 5.00, '', '', 'ฝาก', 0, 'มากกว่า', 0, 0, 0, '00.00.00', 'Turnover Rate', '', 0.00, 0, 'N', 'ฝาก', 'ทุกยอดฝากรับโบนัส 10%', 'ค่าคงที่', 'undefined', 'undefined', 'undefined', 'undefined', '00.00.00', '00.00.00', '', '', 0, 0, 'N', 'file_dateVal_1698380467750_banner02.jpg', '<span style=\"color: rgb(230, 0, 0);\">เงื่อนไข</span><ul><li>ค่ายเกมส์ที่ร่วมรายการ PG Soft , Dogzilla เท่านั้น</li><li>ฝากขั้นต่ำ 100- โบนัสสูงสุด 100</li><li>เทิร์นโอเวอร์ 2 เท่า</li><li>โปรโมชั่นนี้รับได้ทั้งวัน</li><li>ห้ามซื้อฟรีสปิน ห้ามสะสมฟรีเกมส์</li></ul><br><span style=\"color: rgb(230, 0, 0);\">ตัวอย่างเทิร์นโอเวอร์</span><ul><li>เงินฝาก = 300 บาทโบนัส = 10% x 300 บาท = 30 บาท</li><li>ยอดเงินที่ต้องทำการเทิร์นโอเวอร์ = ( เงินฝาก 300 + โบนัส 30 ) x 2 = 660 บาท</li></ul><br><span style=\"color: rgb(107, 36, 178);\">*หากพบเห็นเจตนาในการใช้ช่องโหว่ใดๆ เพื่อเอื้อประโยชน์ให้กับผู้เล่นจากการรับเงินโบนัส TOONTA ขอสงวนสิทธิ์ในการระงับการจ่ายเงินและยิดเครดิตทั้งหมด ทุกกรณี!</span>', 'cost-type-ckr26s', 'PG Soft,Slotxo,Joker123,Askmebet,Habanero,Spade Gaming,Micro Gaming,Simple Play,Live22,Evoplay,CQ9,Jili,Mannaplay,Funky Games,Yggdrasil Gaming,UPG Slot,Ameba,Ambslot,Netent2,Red Tiger,Dragon Gaming,Ace333,I8,WmSlot,Spinix,Ninja slot,918 Kiss,Pragmatic Play Slot,DOGZILLA', 'game', '2', 'PG Soft,Slotxo,Joker123,Askmebet,Habanero,Spade Gaming,Micro Gaming,Simple Play,Live22,Evoplay,CQ9,Jili,Mannaplay,Funky Games,Yggdrasil Gaming,UPG Slot,Ameba,Ambslot,Netent2,Red Tiger,Dragon Gaming,Ace333,I8,WmSlot,Spinix,Ninja slot,918 Kiss,Pragmatic Play Slot,DOGZILLA', NULL, NULL, NULL),
(6, 2, 'ทั่วไป', '2023-10-20', '2023-10-20', 'Percent', 30.00, 300.00, 5.00, '', '', 'รายวัน', 0, '', 0, 0, 0, '00.00.00', 'Turnover Rate', '', 0.00, 0, 'N', 'ฝาก', 'ฝากแรกของวันรับโบนัส 30%', 'ค่าคงที่', 'undefined', 'undefined', 'undefined', 'undefined', '00.00.00', '00.00.00', 'ถอน', '', 5000, 0, 'N', 'null', 'null', 'cost-type-co4j', 'PG Soft,Slotxo,Joker123,Askmebet,Habanero,Spade Gaming,Micro Gaming,Simple Play,Live22,Evoplay,CQ9,Jili,Mannaplay,Funky Games,Yggdrasil Gaming,UPG Slot,Ameba,Ambslot,Netent2,Red Tiger,Dragon Gaming,Ace333,I8,WmSlot,Spinix,Ninja slot,918 Kiss,Pragmatic Play Slot,DOGZILLA', 'game', '5', 'undefined', NULL, NULL, NULL),
(7, 2, 'ทั่วไป', '2023-10-20', '2023-10-20', 'Percent', 30.00, 300.00, 5.00, '', '', 'รายวัน', 0, '', 0, 0, 0, '00.00.00', 'Turnover Rate', '', 0.00, 0, 'N', 'ฝาก', 'ฝากแรกของวันรับโบนัส 30%', 'ค่าคงที่', 'undefined', 'undefined', 'undefined', 'undefined', '00.00.00', '00.00.00', 'ถอน', '', 5000, 0, 'N', 'null', 'null', 'cost-type-co4j', 'PG Soft,Slotxo,Joker123,Askmebet,Habanero,Spade Gaming,Micro Gaming,Simple Play,Live22,Evoplay,CQ9,Jili,Mannaplay,Funky Games,Yggdrasil Gaming,UPG Slot,Ameba,Ambslot,Netent2,Red Tiger,Dragon Gaming,Ace333,I8,WmSlot,Spinix,Ninja slot,918 Kiss,Pragmatic Play Slot,DOGZILLA', 'game', '5', 'undefined', NULL, NULL, NULL),
(8, 2, 'ทั่วไป', '2023-10-20', '2023-10-20', 'Percent', 30.00, 300.00, 5.00, '', '', 'รายวัน', 0, '', 0, 0, 0, '00.00.00', 'Turnover Rate', '', 0.00, 0, 'N', 'ฝาก', 'ฝากแรกของวันรับโบนัส 30%', 'ค่าคงที่', 'undefined', 'undefined', 'undefined', 'undefined', '00.00.00', '00.00.00', 'ถอน', '', 5000, 0, 'N', 'null', 'null', 'cost-type-co4j', 'PG Soft,Slotxo,Joker123,Askmebet,Habanero,Spade Gaming,Micro Gaming,Simple Play,Live22,Evoplay,CQ9,Jili,Mannaplay,Funky Games,Yggdrasil Gaming,UPG Slot,Ameba,Ambslot,Netent2,Red Tiger,Dragon Gaming,Ace333,I8,WmSlot,Spinix,Ninja slot,918 Kiss,Pragmatic Play Slot,DOGZILLA', 'game', '5', 'undefined', NULL, NULL, NULL),
(9, 2, 'ทั่วไป', '2023-10-23', '2023-10-23', 'Percent', 30.00, 300.00, 5.00, '', '', 'รายวัน', 0, '', 0, 0, 0, '00.00.00', 'Turnover Rate', '', 0.00, 0, 'N', 'ฝาก', 'ฝากแรกของวันรับโบนัส 30%', 'ค่าคงที่', 'undefined', 'undefined', 'undefined', 'undefined', '00.00.00', '00.00.00', '', '', 0, 0, 'N', 'file_dateVal_1698380482713_banner03.jpg', '<span style=\"color: rgb(230, 0, 0);\">เงื่อนไข</span><ul><li>ค่ายเกมส์ที่ร่วมรายการ PG Soft , Dogzilla</li><li>ฝากขั้นต่ำ 100 โบนัสสูงสุด 300</li><li>เทิร์นโอเวอร์ 5 เท่า</li><li>ถอนได้สูงสุด 5,000 บาท</li><li>โปรโมชั่นนี้รับได้ 1 ครั้ง / วัน</li><li>ห้ามซื้อฟรีสปิน ห้ามสะสมฟรีเกมส์</li></ul><br><span style=\"color: rgb(230, 0, 0);\">ตัวอย่างเทิร์นโอเวอร์&nbsp;</span><ul><li>เงินฝากครั้งแรก = 300 บาท</li><li>โบนัส = 30% x 300 บาท = 90 บาท</li><li>ยอดเงินที่ต้องทำการเทิร์นโอเวอร์ = ( เงินฝาก 300 + โบนัส 90 ) x 5 = 1,950 บาท</li></ul><br><span style=\"color: rgb(0, 102, 204);\">*หากพบเห็นเจตนาในการล่าโปรโมชั่นหรือการใช้ช่องโหว่ใดๆ เพื่อเอื้อประโยชน์ให้กับผู้เล่นจากการรับเงินโบนัส SANDWIN ขอสงวนสิทธิ์ในการระงับการจ่ายเงินและยิดเครดิตทั้งหมด ทุกกรณี!&nbsp;การตัดสินของทีมงานถือเป็นที่สิ้นสุด</span>', 'cost-type-bbzfz', 'DOGZILLA,PG Soft', 'game', '5', 'DOGZILLA,PG Soft', NULL, NULL, NULL),
(10, 2, 'ทั่วไป', '2023-10-23', '2023-10-23', 'Percent', 50.00, 100.00, 5.00, '', '', 'ฝากเงินครั้งแรก', 0, '', 0, 0, 0, '00.00.00', 'Turnover Rate', '', 0.00, 0, 'N', 'ฝาก', 'ค่ายใหม่มาแรง Dogzilla แจก 50%', 'ค่าคงที่', '', '', 'undefined', 'undefined', '00.00.00', '00.00.00', '', '', 0, 0, 'N', 'file_dateVal_1698380493960_banner04.jpg', '<span style=\"color: rgb(230, 0, 0);\">เงื่อนไข</span><ul><li>ค่ายเกมส์ที่ร่วมรายการ Dogzilla</li><li>ฝากขั้นต่ำ 100- เทิร์นโอเวอร์ 5 เท่า</li><li>ถอนได้สูงสุด 5,000 บาท</li><li>โปรโมชั่นนี้รับได้ 1 ครั้ง / วัน</li><li>ห้ามซื้อฟรีสปิน ห้ามสะสมฟรีเกมส์</li></ul><br><span style=\"color: rgb(230, 0, 0);\">ตัวอย่างเทิร์นโอเวอร์&nbsp;</span><ul><li>เงินฝากครั้งแรก = 100 บาท</li><li>โบนัส = 50% x 100 บาท = 50 บาท</li><li>ยอดเงินที่ต้องทำการเทิร์นโอเวอร์ = ( เงินฝาก 100 + โบนัส 50 ) x 5 = 750 บาท</li></ul><br>*<span style=\"color: rgb(0, 71, 178);\">หากพบเห็นเจตนาในการล่าโปรโมชั่นหรือการใช้ช่องโหว่ใดๆ เพื่อเอื้อประโยชน์ให้กับผู้เล่นจากการรับเงินโบนัส TOONTA ขอสงวนสิทธิ์ในการระงับการจ่ายเงินและยิดเครดิตทั้งหมด ทุกกรณี!&nbsp;การตัดสินของทีมงานถือเป็นที่สิ้นสุด</span>', 'cost-type-l9it7', 'DOGZILLA,Joker123,PG Soft,Askmebet,Micro Gaming,Spade Gaming,Habanero,Red Tiger,Netent2,Ambslot,Ameba,UPG Slot,Dragon Gaming,Ace333,I8,WmSlot,Spinix,Simple Play,Live22', 'game', '3', 'DOGZILLA,Joker123,PG Soft,Askmebet,Micro Gaming,Spade Gaming,Habanero,Red Tiger,Netent2,Ambslot,Ameba,UPG Slot,Dragon Gaming,Ace333,I8,WmSlot,Spinix,Simple Play,Live22', NULL, NULL, NULL),
(11, 2, 'ทั่วไป', '2023-10-24', '2023-10-24', 'Percent', 20.00, 100.00, 100.00, '', '', 'รายวัน', 0, '', 0, 0, 0, '00.00.00', 'Turnover Rate', '', 0.00, 0, 'N', 'ฝาก', 'testesttesttetstest', 'เปอร์เซ็นต์', 'undefined', 'undefined', 'undefined', 'undefined', '00.00.00', '00.00.00', '', '', 0, 0, 'N', 'file_dateVal_1698122647698_banner4.jpg', 'undefined', 'cost-type-uvdvup', 'Micro Gaming,Simple Play,Evoplay,CQ9,Jili,Mannaplay,Funky Games,Yggdrasil Gaming,UPG Slot,Ameba,Ambslot,Netent2,Red Tiger,Dragon Gaming,Ace333,I8,WmSlot,Spinix,Ninja slot,918 Kiss,Pragmatic Play Slot,DOGZILLA', 'game', '3', 'undefined', NULL, NULL, NULL),
(12, 2, 'ทั่วไป', '2023-10-27', '2023-12-30', 'Percent', 150.00, 150.00, 5.00, '', '', 'ฝากเงินครั้งแรก', 0, '', 0, 0, 0, 'Invalid', 'Turnover Rate', '', 0.00, 0, 'Y', 'ฝาก', 'สมาชิกใหม่รับโบนัส 100%', 'ค่าคงที่', 'จำนวนครั้งของ IpAddress', 'ฝาก', 'undefined', 'undefined', 'Invalid', 'Invalid', 'ถอน', '', 1500, 0, 'N', 'file_dateVal_1698404276363_banner01.jpg', 'เงื่อนไข<ul><li><span style=\"color: rgb(231, 76, 60);\">- </span><span style=\"color: rgb(241, 196, 15);\">ค่ายเกมส์ที่เข้าร่วม PG Soft และ Dogzilla</span></li><li>- ฝาก 150 รับ 300- เทิร์นโอเวอร์ 4 เท่า</li><li>- ถอนได้สูงสุด 1,500 บาท</li><li>- โปรโมชั่นนี้สำหรับสมาชิกใหม่เท่านั้น</li><li>-&nbsp;ห้ามซื้อฟรีสปิน ห้ามสะสมฟรีเกมส์</li><li>- หลังจากทำรายการถอนเงินแล้วเครดิตจะเหลือ 0 ทันที</li></ul><strong style=\"color: rgb(231, 76, 60);\">*หากพบเห็นเจตนาในการล่าโปรโมชั่นหรือการใช้ช่องโหว่ใดๆ เพื่อเอื้อประโยชน์ให้กับผู้เล่นจากการรับเงินโบนัส TOONTA ขอสงวนสิทธิ์ในการระงับการจ่ายเงินและยิดเครดิตทั้งหมด ทุกกรณี!&nbsp;การตัดสินของทีมงานถือเป็นที่สิ้นสุด</strong>', 'cost-type-q3v3ai', 'PG Soft,DOGZILLA', 'game', '4', 'PG Soft,DOGZILLA', '0', '1', '150'),
(13, 2, 'ทั่วไป', '2023-10-27', '2023-10-30', 'Fixed rate', 150.00, 150.00, 5.00, '', '', 'ฝากเงินครั้งแรก', 0, '', 0, 0, 0, 'Invalid', 'Turnover Rate', '', 0.00, 0, 'Y', 'ฝาก', 'สมาชิกใหม่รับโบนัส 100%', 'ค่าคงที่', 'จำนวนครั้งของ IpAddress', 'ฝาก', '', 'เท่ากับ', 'Invalid', 'Invalid', 'ถอน', '', 1500, 0, 'N', 'file_dateVal_1698422413238_banner01.jpg', '<p>เงื่อนไข</p><ul><li><span style=\"color: rgb(241, 196, 15);\">ค่ายเกมส์ที่เข้าร่วม PG Soft และ Dogzilla</span></li><li> ฝาก 150 รับ 300</li><li>เทิร์นโอเวอร์ 4 เท่า</li><li>ถอนได้สูงสุด 1,500 บาท</li><li>โปรโมชั่นนี้สำหรับสมาชิกใหม่เท่านั้น</li><li>ห้ามซื้อฟรีสปิน ห้ามสะสมฟรีเกมส์</li><li>หลังจากทำรายการถอนเงินแล้วเครดิตจะเหลือ 0 ทันที</li></ul><p><strong style=\"color: rgb(231, 76, 60);\">*หากพบเห็นเจตนาในการล่าโปรโมชั่นหรือการใช้ช่องโหว่ใดๆ เพื่อเอื้อประโยชน์ให้กับผู้เล่นจากการรับเงินโบนัส TOONTA ขอสงวนสิทธิ์ในการระงับการจ่ายเงินและยิดเครดิตทั้งหมด ทุกกรณี!&nbsp;การตัดสินของทีมงานถือเป็นที่สิ้นสุด</strong></p>', 'cost-type-r7rbii', 'PG Soft,DOGZILLA', 'game', '4', 'undefined', '0', '1', '150');

-- --------------------------------------------------------

--
-- Table structure for table `depositaccount`
--

CREATE TABLE `depositaccount` (
  `id` bigint NOT NULL,
  `bankName` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'ธนาคารไทยพาณิชย์',
  `webname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'TOONTA',
  `agent_id` bigint DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `balance` int NOT NULL DEFAULT '0',
  `billMatched` int NOT NULL DEFAULT '0',
  `complated` int NOT NULL DEFAULT '0',
  `accountNumber` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `algorithm` enum('Sms','Bot Bank','Bank API') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Sms',
  `activestatus` enum('เปิดใช้งาน','ปิดใช้งาน') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'เปิดใช้งาน',
  `accountRocked` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `autorocker` int NOT NULL DEFAULT '0',
  `imgbank` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `accountName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nameAccount` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `depositaccount`
--

INSERT INTO `depositaccount` (`id`, `bankName`, `webname`, `agent_id`, `status`, `balance`, `billMatched`, `complated`, `accountNumber`, `algorithm`, `activestatus`, `accountRocked`, `autorocker`, `imgbank`, `accountName`, `nameAccount`) VALUES
(2, 'ธนาคารออมสิน', 'TOONTA', 2, 'แก้ไขไม่ได้ เนื่องจากผูก Api', 15, 15, 15, '020042001691', 'Sms', 'เปิดใช้งาน', 'Test', 100, 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-gsb.png', 'นาย พีรวัส ขวัญแก้ว', 'นายพีรวัสขวัญแก้ว'),
(3, 'ธนาคารกสิกรไทย', 'TOONTA', 2, 'แก้ไขไม่ได้ เนื่องจากผูก Api', 0, 0, 0, '1653149774', 'Sms', 'เปิดใช้งาน', 'Test', 0, 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-kbank.png', 'MS. MY HAY MAY -', 'MS. MY HAY MAY -');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `id` bigint NOT NULL,
  `agent_id` bigint NOT NULL,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` enum('true','false') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'true',
  `created_at` timestamp NOT NULL,
  `login_latest` timestamp NOT NULL,
  `ip_address` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '000.00.0.0',
  `role` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `levelrole` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tpye` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'พนักงาน'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `agent_id`, `username`, `password`, `name`, `phonenumber`, `status`, `created_at`, `login_latest`, `ip_address`, `role`, `levelrole`, `tpye`) VALUES
(1, 2, 'roottest', '25f9e794323b453885f5181f1b624d0b', 'โกโจ ซาโตรุ', '0000000000', 'true', '2023-10-20 14:49:43', '2023-10-20 14:49:43', '192.168.224.4', 'แอดมิน', 'สมาชิก,รายชื่อสมาชิก,แก้ไข,แก้ไขUser,รายงานการอัพเดทระบบ,กลุ่ม,รายงาน,ยอดได้เสีย,ยอดได้เสียรายเกม,รายงานการเล่นเกม,รายงานยอดแทงและยอดชนะ,รายงานยอดฝากถอนเงิน,รายงานยอดสมัครผู้เล่น,Dashboard,การเงิน,บัญชีฝาก,บัญชีถอน,สร้างฝาก', 'พนักงาน'),
(2, 2, 'victest', 'ef775988943825d2871e1cfa75473ec0', 'vic ทดสอบ', '0000000000', 'false', '2023-10-20 17:31:14', '2023-10-20 17:31:14', '172.22.0.4', 'ตรวจสอบ', 'ยอดได้เสีย,ยอดได้เสียรายเกม,รายงานการเล่นเกม,รายงานยอดสมัครผู้เล่น,รายงานยอดฝากถอนเงิน,รายงานยอดแทงและยอดชนะ,Dashboard,สมาชิก,รายชื่อสมาชิก,เพิ่มสมาชิก,กลุ่ม,สร้างกลุ่ม,แก้ไข,แสดงข้อมูล,ประวัติการทำรายการ,แก้ไขUser,เพิ่มเครดิต,ลดเครดิต,ฝากถอน,เปลี่ยนรหัสผ่าน,Ban,โปรโมชั่น,พนักงาน,รายชื่อพนักงาน,การเงิน,ฝาก,ถอน,รอการเช็คถอน,บัญชีฝาก,บัญชีถอน,รายงาน', 'พนักงาน');

-- --------------------------------------------------------

--
-- Table structure for table `game`
--

CREATE TABLE `game` (
  `id` bigint NOT NULL,
  `growshrink` int DEFAULT NULL,
  `fiatValue` int DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `symbol` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `linkgame` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `game`
--

INSERT INTO `game` (`id`, `growshrink`, `fiatValue`, `name`, `symbol`, `icon`, `linkgame`) VALUES
(1, 10, 3000, 'Go Gold Planet', 'LTC', '/img/thumbs/icontest3.png', NULL),
(2, 30, 1500, 'CowBoys VS Aliens', 'BTC', '/img/thumbs/icontest1.png', NULL),
(3, 40, 1000, 'Lucky Bunny Gold', 'ETH', '/img/thumbs/icontest2.png', NULL),
(4, 20, 2000, 'CowboyVsAlien', 'SOL', '/img/thumbs/solana.png', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `gamecamptotal`
--

CREATE TABLE `gamecamptotal` (
  `id` bigint NOT NULL,
  `namegamecamp` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `grossComm` double(15,2) NOT NULL DEFAULT '0.00',
  `turnover` double(15,2) NOT NULL DEFAULT '0.00',
  `win` double(15,2) NOT NULL DEFAULT '0.00',
  `lose` double(15,2) NOT NULL DEFAULT '0.00',
  `commmember` double(15,2) NOT NULL DEFAULT '0.00',
  `totalmamber` double(15,2) NOT NULL DEFAULT '0.00',
  `w_l_agent` double(15,2) NOT NULL DEFAULT '0.00',
  `comm_agent` double(15,2) NOT NULL DEFAULT '0.00',
  `tatal_agent` double(15,2) NOT NULL DEFAULT '0.00',
  `w_l_commny` double(15,2) NOT NULL DEFAULT '0.00',
  `comm_commny` double(15,2) NOT NULL DEFAULT '0.00',
  `tatal_commny` double(15,2) NOT NULL DEFAULT '0.00',
  `roundplay` int NOT NULL DEFAULT '0',
  `day` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gamecamptotal`
--

INSERT INTO `gamecamptotal` (`id`, `namegamecamp`, `grossComm`, `turnover`, `win`, `lose`, `commmember`, `totalmamber`, `w_l_agent`, `comm_agent`, `tatal_agent`, `w_l_commny`, `comm_commny`, `tatal_commny`, `roundplay`, `day`) VALUES
(1, 'DOGZILLA', 0.00, 80.00, 112.80, -32.80, 0.00, 145.60, -32.80, 0.00, -32.48, -32.80, 0.00, -0.32, 18, '2023-10-23'),
(2, 'DOGZILLA', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 19, '2023-10-24'),
(3, 'DOGZILLA', 0.00, 3450.00, 1505.76, 1944.24, 0.00, -438.48, 1944.24, 0.00, 1924.79, 1944.24, 0.00, 19.45, 20, '2023-10-25'),
(4, 'PGSOFT2', 0.00, 1.00, 0.40, 0.60, 0.00, -0.20, 0.60, 0.00, 0.54, 0.60, 0.00, 0.06, 3, '2023-10-25'),
(5, 'DOGZILLA', 0.00, 424.00, 771.25, -347.25, 0.00, 1118.50, -347.25, 0.00, -343.81, -347.25, 0.00, -3.50, 55, '2023-10-26'),
(6, 'SPINIX', 0.00, 0.00, 95.70, -95.70, 0.00, 191.40, -95.70, 0.00, -86.13, -95.70, 0.00, -9.57, 39, '2023-10-26'),
(7, 'EVOPLAY', 0.00, 0.00, 48.00, -48.00, 0.00, 96.00, -48.00, 0.00, -43.20, -48.00, 0.00, -4.80, 5, '2023-10-26'),
(8, 'LIVE22', 0.00, 0.00, 0.70, -0.70, 0.00, 1.40, -0.70, 0.00, -0.63, -0.70, 0.00, -0.07, 2, '2023-10-26'),
(9, 'JILI', 0.00, 698.10, 795.90, -97.80, 0.00, 893.70, -97.80, 0.00, -88.02, -97.80, 0.00, -9.78, 237, '2023-10-26'),
(10, 'MANNA', 0.00, 24.00, 0.00, 24.00, 0.00, -24.00, 24.00, 0.00, 21.60, 24.00, 0.00, 2.40, 13, '2023-10-26'),
(11, 'YGGDRASIL', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2, '2023-10-26'),
(12, 'AMEBA', 0.00, 0.00, 1.00, -1.00, 0.00, 2.00, -1.00, 0.00, -0.91, -1.00, 0.00, -0.10, 2, '2023-10-26'),
(13, 'AMBSLOT2', 0.00, 36.00, 5.66, 30.34, 0.00, -24.68, 30.34, 0.00, 27.31, 30.34, 0.00, 3.03, 11, '2023-10-26'),
(14, 'NETENT2', 0.00, 0.00, 62.50, -62.50, 0.00, 125.00, -62.50, 0.00, -56.25, -62.50, 0.00, -6.25, 9, '2023-10-26'),
(15, 'DRAGONGAMING', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 6, '2023-10-26'),
(16, 'ACE333', 0.00, 0.00, 4.00, -4.00, 0.00, 8.00, -4.00, 0.00, -3.60, -4.00, 0.00, -0.40, 3, '2023-10-26'),
(17, 'I8', 0.00, 30.00, 15.00, 15.00, 0.00, 0.00, 15.00, 0.00, 13.50, 15.00, 0.00, 1.50, 1, '2023-10-26'),
(18, 'WMSLOT', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 6, '2023-10-26'),
(19, '918KISS', 0.00, 0.00, 2.70, -2.70, 0.00, 5.40, -2.70, 0.00, -2.43, -2.70, 0.00, -0.27, 2, '2023-10-26'),
(20, 'PRAGMATIC_SLOT', 0.00, 0.00, 24.50, -24.50, 0.00, 49.00, -24.50, 0.00, -22.05, -24.50, 0.00, -2.45, 7, '2023-10-26'),
(21, 'HABANERO', 0.00, -106.50, 3.90, -110.40, 0.00, 114.30, -110.40, 0.00, -99.36, -110.40, 0.00, -11.04, 34, '2023-10-26'),
(22, 'SLOTXO', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, '2023-10-26'),
(23, 'CQ9V2', 0.00, 0.00, 216.00, -216.00, 0.00, 432.00, -216.00, 0.00, -194.40, -216.00, 0.00, -21.60, 1, '2023-10-26'),
(24, 'PGSOFT2', 0.00, 14.00, 6.05, 7.95, 0.00, -1.90, 7.95, 0.00, 7.15, 7.95, 0.00, 0.79, 20, '2023-10-26'),
(25, 'CQ9V2', 0.00, 0.00, 18357.00, -18357.00, 0.00, 36714.00, -18357.00, 0.00, -16521.30, -18357.00, 0.00, -1835.70, 21, '2023-10-27'),
(26, 'SLOTXO', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, '2023-10-27'),
(27, 'DOGZILLA', 0.00, 165.00, 259.04, -94.04, 0.00, 353.08, -94.04, 0.00, -93.10, -94.04, 0.00, -0.94, 21, '2023-10-27'),
(28, 'PGSOFT2', 0.00, 27.90, 2.40, 25.50, 0.00, -23.10, 25.50, 0.00, 22.95, 25.50, 0.00, 2.55, 4, '2023-10-27'),
(29, 'SPINIX', 0.00, 0.00, 0.60, -0.60, 0.00, 1.20, -0.60, 0.00, -0.54, -0.60, 0.00, -0.06, 2, '2023-10-27'),
(30, 'DOGZILLA', 0.00, 77.00, 32.55, 44.45, 0.00, -11.90, 44.45, 0.00, 44.00, 44.45, 0.00, 0.45, 31, '2023-10-28'),
(31, 'SLOTXO', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 3, '2023-10-28'),
(32, 'DOGZILLA', 0.00, 118.50, 164.83, -46.33, 0.00, 211.16, -46.33, 0.00, -45.88, -46.33, 0.00, -0.46, 23, '2023-10-31'),
(33, 'DOGZILLA', 0.00, 10.00, 0.00, 10.00, 0.00, -10.00, 10.00, 0.00, 9.90, 10.00, 0.00, 0.10, 4, '2023-11-01'),
(34, 'PGSOFT2', 0.00, 163.00, 54.60, 108.40, 0.00, -53.80, 108.40, 0.00, 97.56, 108.40, 0.00, 10.84, 20, '2023-11-01'),
(35, 'DOGZILLA', 0.00, 270.00, 261.53, 8.47, 0.00, 253.06, 8.47, 0.00, 8.47, 8.47, 0.00, 0.00, 27, '2023-11-02');

-- --------------------------------------------------------

--
-- Table structure for table `gameweb`
--

CREATE TABLE `gameweb` (
  `id` bigint NOT NULL,
  `imglogo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `password_img` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `namegame` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `active` enum('Y','N') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `percentagegame` double(15,2) NOT NULL DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gameweb`
--

INSERT INTO `gameweb` (`id`, `imglogo`, `password_img`, `namegame`, `active`, `percentagegame`) VALUES
(1, 'https://superapi-products.s3-ap-southeast-1.amazonaws.com/logo/pgslot.webp', 'PGSOFT2', 'PG Soft', 'N', 90.00),
(2, 'https://alexanderdevenezuela.com/wp-content/uploads/2021/02/slot-xo.png', 'SLOTXO', 'Slotxo', 'N', 90.00),
(3, 'https://joker123.center/wp-content/uploads/2021/01/cropped-joker123-center-1024px.png', 'JOKER', 'Joker123', 'N', 90.00),
(4, 'https://superapi-products.s3-ap-southeast-1.amazonaws.com/logo/askmebet.webp', 'ASKMEBET', 'Askmebet', 'N', 90.00),
(5, 'https://casinodaddy.com/wp-content/uploads/2020/04/habanero-logo.png', 'HABANERO', 'Habanero', 'N', 90.00),
(6, 'https://www.slotsreview.games/wp-content/uploads/2020/09/tabPp8TY.png', 'SPADE', 'Spade Gaming', 'N', 90.00),
(7, 'https://onlinebingo.co.uk/wp-content/uploads/2022/08/microgaming.png', 'MICRO', 'Micro Gaming', 'N', 90.00),
(8, 'https://smartcasinoguide.com/app/uploads/2021/11/SimplePlay-games-icon.png', 'SIMPLEPLAY', 'Simple Play', 'N', 90.00),
(9, 'https://malaysialistings.s3.ap-south-1.amazonaws.com/listings/images63be4cb88319b.jpg', 'LIVE22', 'Live22', 'N', 90.00),
(10, 'https://goodluckmate.com/storage/attribute_value/d3dce8f6c19589bace8a9d293a271780/c/evoplay-games-250x250.png', 'EVOPLAY', 'Evoplay', 'N', 90.00),
(11, 'https://pgslot-game.io/wp-content/uploads/2021/08/CQ9-SLOT-min-1.png', 'CQ9V2', 'CQ9', 'N', 90.00),
(12, 'https://play-lh.googleusercontent.com/7KD9UI2qGFDKCqSvVK_9k03PzApNaFxhHeAbQzCZqRvxAiqVOLVS5Jr6MXKzkcFotzUp', 'JILI', 'Jili', 'N', 90.00),
(13, 'https://superslot247.com/wp-content/uploads/2022/06/%E0%B8%84%E0%B9%88%E0%B8%B2%E0%B8%A2-mannaplay-%E0%B9%80%E0%B8%A7%E0%B9%87%E0%B8%9A-Superslot-%E0%B8%9F%E0%B8%A3%E0%B8%B5%E0%B9%80%E0%B8%84%E0%B8%A3%E0%B8%94%E0%B8%B4%E0%B8%95.png', 'MANNA', 'Mannaplay', 'N', 90.00),
(14, 'https://www.atombetx888.com/images/bfgames/Funky%20Games.png', 'FUNKY', 'Funky Games', 'N', 90.00),
(15, 'https://res.cloudinary.com/crunchbase-production/image/upload/c_lpad,f_auto,q_auto:eco,dpr_1/uj9tjvzkgifyr1nsyomj', 'YGGDRASIL', 'Yggdrasil Gaming', 'N', 90.00),
(16, 'https://apimain.fomobet88.com/images/1655903289.webp', 'UPG', 'UPG Slot', 'N', 90.00),
(17, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0jB977AuuUdyeQYZRVw25DzoOFCWZz7yMfd5GPujDIxe0SEwqngvMLMmvmLG6ZtSOC8o&usqp=CAU', 'AMEBA', 'Ameba', 'N', 90.00),
(18, 'https://fortuneox.net/wp-content/uploads/2022/12/gamecompanyamb.png', 'AMBSLOT2', 'Ambslot', 'N', 90.00),
(19, 'https://slotsmegacasino.pt/images/slots/hotline.jpg', 'NETENT2', 'Netent2', 'N', 90.00),
(20, 'https://pbs.twimg.com/profile_images/1495764482307637248/9yEFhc2D_400x400.jpg', 'REDTIGER', 'Red Tiger', 'N', 90.00),
(21, 'https://as2.ftcdn.net/v2/jpg/03/19/27/03/1000_F_319270375_1tXTAdn0eim324DADDtNJZZVBLIVYTLP.jpg', 'DRAGONGAMING', 'Dragon Gaming', 'N', 90.00),
(22, 'https://static.wixstatic.com/media/ce54f5_43d735b0df6c47cf8de3ab7ca74be105~mv2.png/v1/fill/w_269,h_267,al_c,lg_1,q_95,enc_auto/ace333.png', 'ACE333', 'Ace333', 'N', 90.00),
(23, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSokl0-jgqd5PRC_z88Q5m13kpMVH6YxTx88w&usqp=CAU', 'I8', 'I8', 'N', 90.00),
(24, 'https://is3-ssl.mzstatic.com/image/thumb/Purple111/v4/22/0a/37/220a37e4-f17f-0b02-e54e-4869308fc2fb/source/512x512bb.jpg', 'WMSLOT', 'WmSlot', 'N', 90.00),
(25, 'https://play-lh.googleusercontent.com/kyMC5UyPeJWaoju2AonX3StTnfZ5cse0MlkXheLzAdWnLeRG1u25X33Y59IuFLqnWQ', 'SPINIX', 'Spinix', 'N', 90.00),
(26, 'https://ninjaslot.co.in/wp-content/uploads/2022/11/imgninja.png', 'NINJA', 'Ninja slot', 'Y', 90.00),
(27, 'https://i1.sndcdn.com/avatars-5zP0dUayEzDDtX3G-zTczhA-t500x500.jpg', '918KISS', '918 Kiss', 'N', 90.00),
(28, 'https://cryptostec.com/wp-content/uploads/2022/05/pragmatic-play.jpeg', 'PRAGMATIC_SLOT', 'Pragmatic Play Slot', 'N', 90.00),
(29, NULL, 'DOGZILLA', 'DOGZILLA', 'Y', 100.00);

-- --------------------------------------------------------

--
-- Table structure for table `game_feespin`
--

CREATE TABLE `game_feespin` (
  `member_id` bigint DEFAULT '0',
  `game_id` bigint DEFAULT '0',
  `game_feespin` enum('true','false') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `game_feespin`
--

INSERT INTO `game_feespin` (`member_id`, `game_id`, `game_feespin`) VALUES
(1, 1, 'false'),
(6, 3, 'false'),
(6, 4, 'false'),
(5, 1, 'false'),
(6, 3, 'false'),
(5, 1, 'false'),
(6, 3, 'false'),
(6, 3, 'false'),
(6, 3, 'false'),
(6, 3, 'false'),
(6, 3, 'false'),
(6, 3, 'false'),
(6, 3, 'false'),
(6, 3, 'false'),
(5, 2, 'false'),
(3, 2, 'false'),
(3, 2, 'false'),
(3, 2, 'false'),
(3, 2, 'false'),
(5, 2, 'false'),
(3, 2, 'false'),
(5, 2, 'false'),
(3, 2, 'false'),
(5, 2, 'false'),
(5, 2, 'false'),
(3, 2, 'false'),
(5, 2, 'false'),
(5, 2, 'false'),
(5, 2, 'false'),
(5, 2, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'true'),
(3, 3, 'true'),
(3, 3, 'true'),
(3, 3, 'true'),
(3, 3, 'true'),
(3, 3, 'true'),
(3, 3, 'true'),
(3, 3, 'true'),
(3, 3, 'true'),
(3, 3, 'true'),
(3, 1, 'false'),
(3, 1, 'false'),
(3, 1, 'false'),
(3, 1, 'false'),
(3, 1, 'false'),
(3, 1, 'false'),
(3, 1, 'false'),
(3, 1, 'false'),
(3, 1, 'false'),
(3, 1, 'false'),
(3, 1, 'false'),
(7, 1, 'false'),
(3, 2, 'false'),
(3, 2, 'false'),
(3, 3, 'false'),
(7, 2, 'false'),
(7, 2, 'false'),
(7, 2, 'false'),
(7, 2, 'false'),
(7, 2, 'false'),
(7, 2, 'false'),
(7, 2, 'false'),
(7, 2, 'false'),
(7, 2, 'false'),
(7, 2, 'false'),
(7, 2, 'false'),
(7, 2, 'false'),
(7, 2, 'false'),
(7, 2, 'false'),
(7, 2, 'false'),
(7, 2, 'false'),
(7, 2, 'false'),
(7, 2, 'false'),
(7, 2, 'false'),
(7, 2, 'false'),
(7, 2, 'false'),
(7, 2, 'false'),
(7, 2, 'false'),
(9, 1, 'false'),
(9, 1, 'false'),
(9, 1, 'false'),
(9, 2, 'false'),
(9, 2, 'false'),
(9, 2, 'false'),
(9, 3, 'false'),
(9, 4, 'false'),
(9, 4, 'false'),
(9, 3, 'false'),
(9, 3, 'false'),
(9, 4, 'false'),
(9, 3, 'false'),
(9, 4, 'false'),
(9, 3, 'false'),
(9, 4, 'false'),
(9, 3, 'false'),
(9, 4, 'false'),
(9, 3, 'false'),
(9, 4, 'false'),
(9, 3, 'false'),
(9, 4, 'false'),
(9, 4, 'false'),
(9, 3, 'true'),
(9, 3, 'true'),
(9, 3, 'true'),
(9, 3, 'true'),
(9, 3, 'true'),
(9, 3, 'true'),
(9, 3, 'true'),
(9, 3, 'true'),
(9, 3, 'true'),
(9, 3, 'true'),
(2, 1, 'false'),
(2, 2, 'false'),
(2, 3, 'false'),
(2, 3, 'false'),
(2, 3, 'false'),
(2, 2, 'false'),
(4, 3, 'false'),
(4, 3, 'false'),
(4, 3, 'false'),
(4, 3, 'false'),
(4, 3, 'false'),
(4, 3, 'false'),
(4, 3, 'false'),
(4, 3, 'false'),
(4, 3, 'false'),
(4, 3, 'false'),
(4, 1, 'false'),
(4, 1, 'false'),
(5, 1, 'false'),
(5, 1, 'false'),
(5, 1, 'false'),
(5, 1, 'false'),
(5, 1, 'false'),
(5, 1, 'false'),
(5, 1, 'false'),
(5, 1, 'false'),
(5, 1, 'false'),
(5, 1, 'false'),
(5, 1, 'false'),
(5, 1, 'false'),
(5, 1, 'false'),
(5, 1, 'false');

-- --------------------------------------------------------

--
-- Table structure for table `imgpromotion`
--

CREATE TABLE `imgpromotion` (
  `id` bigint NOT NULL,
  `namepromotion` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `details` varchar(400) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `fieldname` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `originalname` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `encoding` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `mimetype` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `destination` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `filename` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `path` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `size` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `imgpromotion`
--

INSERT INTO `imgpromotion` (`id`, `namepromotion`, `details`, `fieldname`, `originalname`, `encoding`, `mimetype`, `destination`, `filename`, `path`, `size`) VALUES
(1, 'โบนัสต้อนรับสมาชิกใหม่', 'โบนัสสมาชิกใหม่รับ 100%\n- สำหรับสมาชิกใหม่เท่านั้น\n- ฝากขั้นต่ำ 100 บาท จึงจะมีสิทธิ์รับโบนัส\n- สมาชิกต้องทำเทิร์น 5 เท่า จึงจะมีสิทธิ์ถอน\n- ถอนสูงสุด 3000 บาท\n- ค่ายเกมส์ที่ร่วมรายการ PG Solf , Dogzilla เท่านั้น\n\n', 'file', '191066 (5).jpg', '7bit', 'image/jpeg', 'public/images', 'file_dateVal_1697775701115_191066 (5).jpg', 'public/images/file_dateVal_1697775701115_191066 (5).jpg', 89639);

-- --------------------------------------------------------

--
-- Table structure for table `logdaygame`
--

CREATE TABLE `logdaygame` (
  `id` bigint NOT NULL,
  `game_id` bigint DEFAULT NULL,
  `namegame` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT 'game',
  `play` int DEFAULT '0',
  `bet` float(15,2) DEFAULT '0.00',
  `win` float(15,2) DEFAULT '0.00',
  `icon` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `day` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `logdaygame`
--

INSERT INTO `logdaygame` (`id`, `game_id`, `namegame`, `play`, `bet`, `win`, `icon`, `day`) VALUES
(1, 1, 'Go Gold Planet', 11, 0.00, 0.00, '/img/thumbs/icontest3.png', '2023-10-23'),
(2, 3, 'CowBoys VS Aliens', 11, 0.00, 0.00, '/img/thumbs/icontest1.png', '2023-10-23'),
(3, 2, 'Lucky Bunny Gold', 11, 0.00, 0.00, '/img/thumbs/icontest2.png', '2023-10-23'),
(4, 3, 'CowBoys VS Aliens', 11, 0.00, 0.00, '/img/thumbs/icontest1.png', '2023-10-24'),
(5, 1, 'Go Gold Planet', 11, 0.00, 0.00, '/img/thumbs/icontest3.png', '2023-10-24'),
(6, 3, 'CowBoys VS Aliens', 11, 0.00, 0.00, '/img/thumbs/icontest1.png', '2023-11-01');

-- --------------------------------------------------------

--
-- Table structure for table `logedit`
--

CREATE TABLE `logedit` (
  `id` bigint UNSIGNED NOT NULL,
  `edittype` enum('admin','agent','member') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `idedit` bigint DEFAULT NULL,
  `idmember` bigint DEFAULT '0',
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `editbefore` varchar(300) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `editafter` varchar(300) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `created_attime` datetime DEFAULT NULL,
  `created_atdate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `logedit`
--

INSERT INTO `logedit` (`id`, `edittype`, `idedit`, `idmember`, `name`, `editbefore`, `editafter`, `created_attime`, `created_atdate`) VALUES
(1, 'agent', 2, 1, 'agent01', 'Credit ก่อนหน้า   0\n              ', 'Credit ปัจจุบัน = 1000มีการเปลี่ยนโดย agent ชื่อ agent01', '2023-10-18 15:50:39', '2023-10-18'),
(2, 'agent', 2, 1, 'agent01', 'Credit ก่อนหน้า   1000\n              ', 'Credit ปัจจุบัน = 900มีการเปลี่ยนโดย agent ชื่อ agent01', '2023-10-18 15:51:32', '2023-10-18'),
(3, 'agent', 2, 1, 'agent01', 'ชื่อจริง จิรกฤต นามสกุล จิรกฤต กลุ่มลูกค้า NewMember Renk NewMember username 0954789782 ไลน์ ', 'ชื่อจริง นาย จิรกฤต โชคพฤทธิ์กุล นามสกุล จิรกฤต กลุ่มลูกค้า NewMember Renk NewMember username 0954789782 ไลน์ แก้ไขโดย agent01', '2023-10-18 15:52:22', '2023-10-18'),
(4, 'agent', 2, 5, 'agent01', 'Credit ก่อนหน้า   0\n              ', 'Credit ปัจจุบัน = 100มีการเปลี่ยนโดย agent ชื่อ agent01', '2023-10-18 16:45:15', '2023-10-18'),
(5, 'agent', 2, 7, 'agent01', 'Credit ก่อนหน้า   0\n              ', 'Credit ปัจจุบัน = 1000มีการเปลี่ยนโดย agent ชื่อ agent01', '2023-10-19 05:51:28', '2023-10-19'),
(6, 'agent', 2, 1, 'agent01', 'Credit ก่อนหน้า   0\n              ', 'Credit ปัจจุบัน = 1000มีการเปลี่ยนโดย agent ชื่อ agent01', '2023-10-19 16:03:58', '2023-10-19'),
(7, 'agent', 2, 7, 'agent01', 'Credit ก่อนหน้า   0\n              ', 'Credit ปัจจุบัน = 1000มีการเปลี่ยนโดย agent ชื่อ agent01', '2023-10-26 18:38:17', '2023-10-26'),
(8, 'agent', 2, 9, 'agent01', 'Credit ก่อนหน้า   0\n              ', 'Credit ปัจจุบัน = 1000มีการเปลี่ยนโดย agent ชื่อ agent01', '2023-10-28 06:53:46', '2023-10-28'),
(9, 'agent', 2, 8, 'agent01', 'Credit ก่อนหน้า   0\n              ', 'Credit ปัจจุบัน = 1000มีการเปลี่ยนโดย agent ชื่อ agent01', '2023-10-28 06:54:34', '2023-10-28');

-- --------------------------------------------------------

--
-- Table structure for table `logeditadmin`
--

CREATE TABLE `logeditadmin` (
  `id` bigint UNSIGNED NOT NULL,
  `edittype` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `idedit` bigint DEFAULT NULL,
  `adminid` bigint DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `editbefore` varchar(300) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `editafter` varchar(300) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `logeditadmin`
--

INSERT INTO `logeditadmin` (`id`, `edittype`, `idedit`, `adminid`, `name`, `editbefore`, `editafter`, `created_at`) VALUES
(1, 'admin', 2, 2, 'admintest00', 'name : admintest , status : Y , contact_number : 0788751245\n                  ', 'name : admintest00 , status : Y , contact_number : 0788751245', '2023-05-15 18:47:14');

-- --------------------------------------------------------

--
-- Table structure for table `logeditagent`
--

CREATE TABLE `logeditagent` (
  `id` bigint UNSIGNED NOT NULL,
  `edittype` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `idedit` bigint DEFAULT NULL,
  `agentid` bigint DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `editbefore` varchar(300) CHARACTER SET utf32 COLLATE utf32_general_ci DEFAULT NULL,
  `editafter` varchar(300) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `logfinancerepost`
--

CREATE TABLE `logfinancerepost` (
  `id` bigint NOT NULL,
  `transaction` enum('ฝาก','ถอน') CHARACTER SET utf32 COLLATE utf32_general_ci DEFAULT NULL,
  `username` varchar(11) CHARACTER SET utf32 COLLATE utf32_general_ci DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `transaction_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `logfinancerepost`
--

INSERT INTO `logfinancerepost` (`id`, `transaction`, `username`, `quantity`, `transaction_date`) VALUES
(1, 'ฝาก', '0990825942', 15, '2023-11-01'),
(2, 'ถอน', '0990825942', 200, '2023-11-01');

-- --------------------------------------------------------

--
-- Table structure for table `logfinanceuser`
--

CREATE TABLE `logfinanceuser` (
  `id` bigint NOT NULL,
  `bill_number` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '''111111111111111''',
  `numberbill` int NOT NULL DEFAULT '0',
  `idUser` int NOT NULL,
  `agent_id` bigint NOT NULL,
  `tpyefinance` enum('ถอน','ฝาก') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `accountName` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `accountNumber` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0999999999',
  `transaction_date` date NOT NULL,
  `time` time NOT NULL,
  `quantity` int NOT NULL,
  `creditbonus` int DEFAULT '0',
  `balance_before` float(15,2) NOT NULL DEFAULT '0.00',
  `balance` float(15,2) NOT NULL,
  `status` enum('ยังไม่เรียบร้อย','ทั้งหมด','รอ','ที่ยังไม่ผูก','สำเร็จ','ไม่สำเส็จ') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'สำเร็จ',
  `bank` enum('ธนาคารไทยพาณิชย์','ธนาคารกสิกรไทย','ธนาคารกรุงเทพ','ธนาคารกรุงไทย','ธนาคารกรุงศรีอยุธยา','ธนาคารเกียรตินาคินภัทร','ธนาคารซีไอเอ็มบี ไทย','ธนาคารทหารไทยธนชาต','ธนาคารยูโอบี','ธนาคารออมสิน','ธนาคารเพื่อการเกษตรและสหกรณ์การเกษตร','ธนาคารสแตนดาร์ดชาร์เตอร์ด (ไทย)','Agent') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'ธนาคารไทยพาณิชย์',
  `imgBank` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `destinationAccount` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `destinationAccountNumber` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trans_ref` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'เพิ่มจากเว็บAgent',
  `qrcodeData` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'เพิ่มจากเว็บAgent',
  `nameimg` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'เพิ่มจากเว็บAgent'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `logfinanceuser`
--

INSERT INTO `logfinanceuser` (`id`, `bill_number`, `numberbill`, `idUser`, `agent_id`, `tpyefinance`, `accountName`, `accountNumber`, `phonenumber`, `transaction_date`, `time`, `quantity`, `creditbonus`, `balance_before`, `balance`, `status`, `bank`, `imgBank`, `destinationAccount`, `destinationAccountNumber`, `trans_ref`, `qrcodeData`, `nameimg`) VALUES
(1, 'T2023102600001', 1, 2, 2, 'ถอน', 'victest', '0123456789', '0954789782', '2023-10-26', '18:12:29', 100, 0, 1227.34, 100.00, 'ยังไม่เรียบร้อย', 'ธนาคารไทยพาณิชย์', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-scb.png', 'victest', '0123456789', 'เพิ่มจากเว็บAgent', 'เพิ่มจากเว็บAgent', 'เพิ่มจากเว็บAgent'),
(2, 'T2023102700001', 1, 2, 2, 'ถอน', 'victest', '0123456789', '0954789782', '2023-10-27', '07:50:59', 1234, 0, 1234.41, 1234.00, 'ยังไม่เรียบร้อย', 'ธนาคารไทยพาณิชย์', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-scb.png', 'victest', '0123456789', 'เพิ่มจากเว็บAgent', 'เพิ่มจากเว็บAgent', 'เพิ่มจากเว็บAgent'),
(3, 'T2023102700002', 2, 2, 2, 'ถอน', 'victest', '0123456789', '0954789782', '2023-10-27', '07:58:07', 1234, 0, 1234.41, 1234.00, 'ยังไม่เรียบร้อย', 'ธนาคารไทยพาณิชย์', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-scb.png', 'victest', '0123456789', 'เพิ่มจากเว็บAgent', 'เพิ่มจากเว็บAgent', 'เพิ่มจากเว็บAgent'),
(4, 'T2023102700003', 3, 2, 2, 'ถอน', 'victest', '0123456789', '0954789782', '2023-10-27', '07:59:01', 1234, 0, 1234.41, 1234.00, 'ยังไม่เรียบร้อย', 'ธนาคารไทยพาณิชย์', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-scb.png', 'victest', '0123456789', 'เพิ่มจากเว็บAgent', 'เพิ่มจากเว็บAgent', 'เพิ่มจากเว็บAgent'),
(5, 'T2023102700004', 4, 5, 2, 'ถอน', 'นาย พีรวัส ขวัญแก้ว', '18396488647', '0990825942', '2023-10-27', '11:13:54', 1000, 0, 18817.91, 1000.00, 'ยังไม่เรียบร้อย', 'ธนาคารไทยพาณิชย์', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-scb.png', 'นาย พีรวัส ขวัญแก้ว', '18396488647', 'เพิ่มจากเว็บAgent', 'เพิ่มจากเว็บAgent', 'เพิ่มจากเว็บAgent'),
(6, 'T2023103100001', 1, 5, 2, 'ถอน', 'นาย พีรวัส ขวัญแก้ว', '18396488647', '0990825942', '2023-10-31', '12:55:26', 50, 0, 17773.31, 50.00, 'ยังไม่เรียบร้อย', 'ธนาคารไทยพาณิชย์', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-scb.png', 'นาย พีรวัส ขวัญแก้ว', '18396488647', 'เพิ่มจากเว็บAgent', 'เพิ่มจากเว็บAgent', 'เพิ่มจากเว็บAgent'),
(7, 'T2023103100002', 2, 5, 2, 'ถอน', 'นาย พีรวัส ขวัญแก้ว', '18396488647', '0990825942', '2023-10-31', '12:58:34', 1000, 0, 17773.31, 1000.00, 'ยังไม่เรียบร้อย', 'ธนาคารไทยพาณิชย์', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-scb.png', 'นาย พีรวัส ขวัญแก้ว', '18396488647', 'เพิ่มจากเว็บAgent', 'เพิ่มจากเว็บAgent', 'เพิ่มจากเว็บAgent'),
(8, 'T2023103100003', 3, 5, 2, 'ถอน', 'นาย พีรวัส ขวัญแก้ว', '18396488647', '0990825942', '2023-10-31', '17:33:02', 500, 0, 17773.31, 500.00, 'ยังไม่เรียบร้อย', 'ธนาคารไทยพาณิชย์', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-scb.png', 'นาย พีรวัส ขวัญแก้ว', '18396488647', 'เพิ่มจากเว็บAgent', 'เพิ่มจากเว็บAgent', 'เพิ่มจากเว็บAgent'),
(9, 'T2023103100004', 4, 5, 2, 'ถอน', 'นาย พีรวัส ขวัญแก้ว', '18396488647', '0990825942', '2023-10-31', '19:53:10', 200, 0, 17773.31, 200.00, 'ยังไม่เรียบร้อย', 'ธนาคารไทยพาณิชย์', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-scb.png', 'นาย พีรวัส ขวัญแก้ว', '18396488647', 'เพิ่มจากเว็บAgent', 'เพิ่มจากเว็บAgent', 'เพิ่มจากเว็บAgent'),
(10, 'T2023103100005', 5, 5, 2, 'ถอน', 'นาย พีรวัส ขวัญแก้ว', '18396488647', '0990825942', '2023-10-31', '19:55:59', 200, 0, 17773.31, 200.00, 'ยังไม่เรียบร้อย', 'ธนาคารไทยพาณิชย์', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-scb.png', 'นาย พีรวัส ขวัญแก้ว', '18396488647', 'เพิ่มจากเว็บAgent', 'เพิ่มจากเว็บAgent', 'เพิ่มจากเว็บAgent'),
(11, 'T2023103100006', 6, 5, 2, 'ถอน', 'นาย พีรวัส ขวัญแก้ว', '18396488647', '0990825942', '2023-10-31', '20:07:19', 200, 0, 17773.31, 200.00, 'ยังไม่เรียบร้อย', 'ธนาคารไทยพาณิชย์', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-scb.png', 'นาย พีรวัส ขวัญแก้ว', '18396488647', 'เพิ่มจากเว็บAgent', 'เพิ่มจากเว็บAgent', 'เพิ่มจากเว็บAgent'),
(12, 'T2023103100007', 7, 5, 2, 'ถอน', 'นาย พีรวัส ขวัญแก้ว', '18396488647', '0990825942', '2023-10-31', '20:08:15', 200, 0, 17773.31, 200.00, 'ยังไม่เรียบร้อย', 'ธนาคารไทยพาณิชย์', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-scb.png', 'นาย พีรวัส ขวัญแก้ว', '18396488647', 'เพิ่มจากเว็บAgent', 'เพิ่มจากเว็บAgent', 'เพิ่มจากเว็บAgent'),
(13, 'T2023103100008', 8, 5, 2, 'ถอน', 'นาย พีรวัส ขวัญแก้ว', '18396488647', '0990825942', '2023-10-31', '20:13:35', 1650, 0, 17773.31, 1650.00, 'ยังไม่เรียบร้อย', 'ธนาคารไทยพาณิชย์', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-scb.png', 'นาย พีรวัส ขวัญแก้ว', '18396488647', 'เพิ่มจากเว็บAgent', 'เพิ่มจากเว็บAgent', 'เพิ่มจากเว็บAgent'),
(14, 'T2023103100009', 9, 5, 2, 'ถอน', 'นาย พีรวัส ขวัญแก้ว', '18396488647', '0990825942', '2023-10-31', '20:15:03', 450, 0, 17773.31, 450.00, 'ยังไม่เรียบร้อย', 'ธนาคารไทยพาณิชย์', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-scb.png', 'นาย พีรวัส ขวัญแก้ว', '18396488647', 'เพิ่มจากเว็บAgent', 'เพิ่มจากเว็บAgent', 'เพิ่มจากเว็บAgent'),
(15, 'T2023110100001', 1, 5, 2, 'ถอน', 'นาย พีรวัส ขวัญแก้ว', '18396488647', '0990825942', '2023-11-01', '03:31:04', 200, 0, 17773.31, 200.00, 'ยังไม่เรียบร้อย', 'ธนาคารไทยพาณิชย์', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-scb.png', 'นาย พีรวัส ขวัญแก้ว', '18396488647', 'เพิ่มจากเว็บAgent', 'เพิ่มจากเว็บAgent', 'เพิ่มจากเว็บAgent'),
(16, 'T2023110100002', 2, 2, 2, 'ถอน', 'victest', '0123456789', '0954789782', '2023-11-01', '03:47:59', 1108, 0, 1108.46, 1108.00, 'ยังไม่เรียบร้อย', 'ธนาคารไทยพาณิชย์', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-scb.png', 'victest', '0123456789', 'เพิ่มจากเว็บAgent', 'เพิ่มจากเว็บAgent', 'เพิ่มจากเว็บAgent'),
(17, 'T2023110100003', 3, 5, 2, 'ถอน', 'นาย พีรวัส ขวัญแก้ว', '18396488647', '0990825942', '2023-11-01', '03:48:24', 300, 0, 17773.31, 300.00, 'ยังไม่เรียบร้อย', 'ธนาคารไทยพาณิชย์', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-scb.png', 'นาย พีรวัส ขวัญแก้ว', '18396488647', 'เพิ่มจากเว็บAgent', 'เพิ่มจากเว็บAgent', 'เพิ่มจากเว็บAgent'),
(18, 'T2023110100004', 4, 5, 2, 'ถอน', 'นาย พีรวัส ขวัญแก้ว', '18396488647', '0990825942', '2023-11-01', '04:06:34', 300, 0, 17773.31, 300.00, 'ยังไม่เรียบร้อย', 'ธนาคารไทยพาณิชย์', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-scb.png', 'นาย พีรวัส ขวัญแก้ว', '18396488647', 'เพิ่มจากเว็บAgent', 'เพิ่มจากเว็บAgent', 'เพิ่มจากเว็บAgent'),
(29, 'T2023110100015', 15, 5, 2, 'ถอน', 'นาย พีรวัส ขวัญแก้ว', '18396488647', '0990825942', '2023-11-01', '04:16:36', 200, 0, 14473.31, 200.00, 'สำเร็จ', 'ธนาคารไทยพาณิชย์', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-scb.png', 'นาย พีรวัส ขวัญแก้ว', '18396488647', 'เพิ่มจากเว็บAgent', 'เพิ่มจากเว็บAgent', 'เพิ่มจากเว็บAgent'),
(30, 'T2023110100016', 16, 2, 2, 'ถอน', 'victest', '0123456789', '0954789782', '2023-11-01', '04:16:41', 1108, 0, 1108.46, 1108.00, 'ยังไม่เรียบร้อย', 'ธนาคารไทยพาณิชย์', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-scb.png', 'victest', '0123456789', 'เพิ่มจากเว็บAgent', 'เพิ่มจากเว็บAgent', 'เพิ่มจากเว็บAgent'),
(41, '2023110100001', 1, 5, 2, 'ฝาก', 'นาย พีรวัส ขวัญแก้ว', '8852932451', '0990825942', '2023-11-01', '09:03:47', 5, 0, 14293.31, 14298.31, 'สำเร็จ', 'ธนาคารไทยพาณิชย์', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-scb.png', 'นาย พีรวัส ขวัญแก้ว', '020042001691', '202311012ZBgIyGp12WLpbMKK', '0046000600000101030140225202311012ZBgIyGp12WLpbMKK5102TH9104F69F', 'file_dateVal_1698829426104_377236024_1023425442227654_2582362426249391222_n.jpg'),
(42, '2023110100002', 2, 5, 2, 'ฝาก', 'นาย พีรวัส ขวัญแก้ว', '8852932451', '0990825942', '2023-11-01', '09:04:04', 10, 0, 14298.31, 14308.31, 'สำเร็จ', 'ธนาคารไทยพาณิชย์', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-scb.png', 'นาย พีรวัส ขวัญแก้ว', '020042001691', '2023110116nkacHNvVFys74e8', '00460006000001010301402252023110116nkacHNvVFys74e85102TH910407DA', 'file_dateVal_1698829442903_396647224_301012646036841_6602704184365275387_n.jpg'),
(43, 'T2023110100017', 17, 2, 2, 'ถอน', 'victest', '0123456789', '0954789782', '2023-11-01', '10:02:01', 100, 0, 1108.46, 100.00, 'ยังไม่เรียบร้อย', 'ธนาคารไทยพาณิชย์', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-scb.png', 'victest', '0123456789', 'เพิ่มจากเว็บAgent', 'เพิ่มจากเว็บAgent', 'เพิ่มจากเว็บAgent'),
(44, 'T2023110100018', 18, 2, 2, 'ถอน', 'victest', '0123456789', '0954789782', '2023-11-01', '10:03:47', 100, 0, 1108.46, 100.00, 'ยังไม่เรียบร้อย', 'ธนาคารไทยพาณิชย์', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-scb.png', 'victest', '0123456789', 'เพิ่มจากเว็บAgent', 'เพิ่มจากเว็บAgent', 'เพิ่มจากเว็บAgent'),
(45, 'T2023110100019', 19, 2, 2, 'ถอน', 'victest', '0123456789', '0954789782', '2023-11-01', '10:13:16', 100, 0, 1082.46, 100.00, 'ยังไม่เรียบร้อย', 'ธนาคารไทยพาณิชย์', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-scb.png', 'victest', '0123456789', 'เพิ่มจากเว็บAgent', 'เพิ่มจากเว็บAgent', 'เพิ่มจากเว็บAgent'),
(46, 'T2023110100020', 20, 2, 2, 'ถอน', 'victest', '0123456789', '0954789782', '2023-11-01', '10:14:00', 100, 0, 1082.46, 100.00, 'ยังไม่เรียบร้อย', 'ธนาคารไทยพาณิชย์', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-scb.png', 'victest', '0123456789', 'เพิ่มจากเว็บAgent', 'เพิ่มจากเว็บAgent', 'เพิ่มจากเว็บAgent'),
(47, 'T2023110100021', 21, 2, 2, 'ถอน', 'victest', '0123456789', '0954789782', '2023-11-01', '10:15:08', 101, 0, 1082.46, 101.00, 'ยังไม่เรียบร้อย', 'ธนาคารไทยพาณิชย์', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-scb.png', 'victest', '0123456789', 'เพิ่มจากเว็บAgent', 'เพิ่มจากเว็บAgent', 'เพิ่มจากเว็บAgent'),
(48, 'T2023110100022', 22, 2, 2, 'ถอน', 'victest', '0123456789', '0954789782', '2023-11-01', '10:15:54', 102, 0, 1082.46, 102.00, 'ยังไม่เรียบร้อย', 'ธนาคารไทยพาณิชย์', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-scb.png', 'victest', '0123456789', 'เพิ่มจากเว็บAgent', 'เพิ่มจากเว็บAgent', 'เพิ่มจากเว็บAgent'),
(49, 'T2023110100023', 23, 2, 2, 'ถอน', 'victest', '0123456789', '0954789782', '2023-11-01', '10:16:37', 100, 0, 1082.46, 100.00, 'ยังไม่เรียบร้อย', 'ธนาคารไทยพาณิชย์', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-scb.png', 'victest', '0123456789', 'เพิ่มจากเว็บAgent', 'เพิ่มจากเว็บAgent', 'เพิ่มจากเว็บAgent'),
(50, 'T2023110100024', 24, 2, 2, 'ถอน', 'victest', '0123456789', '0954789782', '2023-11-01', '10:17:47', 103, 0, 1082.46, 103.00, 'ยังไม่เรียบร้อย', 'ธนาคารไทยพาณิชย์', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-scb.png', 'victest', '0123456789', 'เพิ่มจากเว็บAgent', 'เพิ่มจากเว็บAgent', 'เพิ่มจากเว็บAgent'),
(51, 'T2023110100025', 25, 2, 2, 'ถอน', 'victest', '0123456789', '0954789782', '2023-11-01', '10:20:07', 100, 0, 1082.46, 100.00, 'ยังไม่เรียบร้อย', 'ธนาคารไทยพาณิชย์', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-scb.png', 'victest', '0123456789', 'เพิ่มจากเว็บAgent', 'เพิ่มจากเว็บAgent', 'เพิ่มจากเว็บAgent'),
(52, 'T2023110100026', 26, 2, 2, 'ถอน', 'victest', '0123456789', '0954789782', '2023-11-01', '10:20:55', 100, 0, 1082.46, 100.00, 'ยังไม่เรียบร้อย', 'ธนาคารไทยพาณิชย์', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-scb.png', 'victest', '0123456789', 'เพิ่มจากเว็บAgent', 'เพิ่มจากเว็บAgent', 'เพิ่มจากเว็บAgent'),
(53, 'T2023110100027', 27, 2, 2, 'ถอน', 'victest', '0123456789', '0954789782', '2023-11-01', '10:25:47', 100, 0, 1072.46, 100.00, 'ยังไม่เรียบร้อย', 'ธนาคารไทยพาณิชย์', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-scb.png', 'victest', '0123456789', 'เพิ่มจากเว็บAgent', 'เพิ่มจากเว็บAgent', 'เพิ่มจากเว็บAgent'),
(54, 'T2023110100028', 28, 2, 2, 'ถอน', 'victest', '0123456789', '0954789782', '2023-11-01', '10:27:09', 100, 0, 1072.46, 100.00, 'ยังไม่เรียบร้อย', 'ธนาคารไทยพาณิชย์', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-scb.png', 'victest', '0123456789', 'เพิ่มจากเว็บAgent', 'เพิ่มจากเว็บAgent', 'เพิ่มจากเว็บAgent'),
(55, 'T2023110100029', 29, 2, 2, 'ถอน', 'victest', '0123456789', '0954789782', '2023-11-01', '10:28:00', 100, 0, 1072.46, 100.00, 'ยังไม่เรียบร้อย', 'ธนาคารไทยพาณิชย์', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-scb.png', 'victest', '0123456789', 'เพิ่มจากเว็บAgent', 'เพิ่มจากเว็บAgent', 'เพิ่มจากเว็บAgent'),
(56, 'T2023-11-0200001', 1, 5, 2, 'ถอน', 'นาย พีรวัส ขวัญแก้ว', '8852932451', '0990825942', '2023-11-02', '01:27:11', 200, 0, 14200.91, 200.00, 'ยังไม่เรียบร้อย', 'ธนาคารไทยพาณิชย์', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-scb.png', 'นาย พีรวัส ขวัญแก้ว', '8852932451', 'เพิ่มจากเว็บAgent', 'เพิ่มจากเว็บAgent', 'เพิ่มจากเว็บAgent'),
(57, 'T2023-11-0200002', 2, 2, 2, 'ถอน', 'victest', '0123456789', '0954789782', '2023-11-02', '01:27:47', 100, 0, 1072.46, 100.00, 'ยังไม่เรียบร้อย', 'ธนาคารไทยพาณิชย์', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-scb.png', 'victest', '0123456789', 'เพิ่มจากเว็บAgent', 'เพิ่มจากเว็บAgent', 'เพิ่มจากเว็บAgent'),
(58, 'T2023-11-0200003', 3, 5, 2, 'ถอน', 'นาย พีรวัส ขวัญแก้ว', '8852932451', '0990825942', '2023-11-02', '10:32:36', 200, 0, 14200.91, 200.00, 'ยังไม่เรียบร้อย', 'ธนาคารไทยพาณิชย์', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-scb.png', 'นาย พีรวัส ขวัญแก้ว', '8852932451', 'เพิ่มจากเว็บAgent', 'เพิ่มจากเว็บAgent', 'เพิ่มจากเว็บAgent'),
(59, 'T2023-11-0200004', 4, 5, 2, 'ถอน', 'นาย พีรวัส ขวัญแก้ว', '8852932451', '0990825942', '2023-11-02', '10:41:52', 300, 0, 14200.91, 300.00, 'ยังไม่เรียบร้อย', 'ธนาคารไทยพาณิชย์', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-scb.png', 'นาย พีรวัส ขวัญแก้ว', '8852932451', 'เพิ่มจากเว็บAgent', 'เพิ่มจากเว็บAgent', 'เพิ่มจากเว็บAgent');

-- --------------------------------------------------------

--
-- Table structure for table `loggame`
--

CREATE TABLE `loggame` (
  `id` bigint NOT NULL,
  `namegame` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT 'game',
  `play` int DEFAULT '0',
  `bet` float(15,2) DEFAULT '0.00',
  `win` float(15,2) DEFAULT '0.00',
  `icon` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `loggame`
--

INSERT INTO `loggame` (`id`, `namegame`, `play`, `bet`, `win`, `icon`) VALUES
(1, 'Go Gold Planet', 954, 5720.00, 1275.23, '/img/thumbs/icontest1.png'),
(2, 'Lucky Bunny Gold', 5508, 82809.00, 87081.12, '/img/thumbs/icontest2.png'),
(3, 'CowBoys VS Aliens', 4703, 10827.00, 4827.40, '/img/thumbs/icontest3.png');

-- --------------------------------------------------------

--
-- Table structure for table `mastergroup`
--

CREATE TABLE `mastergroup` (
  `id` bigint NOT NULL,
  `agent_id` bigint NOT NULL,
  `account_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `account_number` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `color` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '#000000',
  `password` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `minwithdrawal` double(15,2) NOT NULL DEFAULT '0.00',
  `withdrawalday` int NOT NULL DEFAULT '0',
  `nameaccoun` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `mindeposit` double(15,2) NOT NULL DEFAULT '0.00',
  `withdrawalsperday` int NOT NULL DEFAULT '0',
  `groupmaster` enum('NewMember','Bronze','Silver','Gold','Diamond') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'NewMember',
  `depositaccount` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `secondaryaccount` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `secondaryaccountII` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `secondaryaccountIII` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `imgbank` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status_delete` enum('Y','N') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `id` bigint UNSIGNED NOT NULL,
  `agent_id` bigint DEFAULT '0',
  `username_agent` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `member_code` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `credit` double(15,2) DEFAULT '0.00',
  `bet_latest` float(16,2) DEFAULT '0.00',
  `username` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `status` enum('Y','N') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y',
  `status_delete` enum('Y','N') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `created_at` date DEFAULT NULL,
  `created_attime` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `ip_address` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `browserlogin` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `customerGroup` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `userrank` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `lineid` varchar(20) CHARACTER SET utf32 COLLATE utf32_general_ci NOT NULL,
  `note` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `currency` varchar(11) CHARACTER SET utf32 COLLATE utf32_general_ci NOT NULL,
  `bank` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `accountName` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `accountNumber` varchar(13) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `phonenumber` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `lastName` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `recharge_times` int NOT NULL DEFAULT '0',
  `bonususer` int NOT NULL DEFAULT '0',
  `deposit` double(15,2) NOT NULL DEFAULT '0.00',
  `withdraw_member` double(15,2) NOT NULL DEFAULT '0.00',
  `latest_withdrawal` double(15,2) NOT NULL DEFAULT '0.00',
  `groupmember` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'NewMember',
  `turnover` double(15,2) NOT NULL DEFAULT '0.00',
  `total_top_up_amount` double(15,2) NOT NULL DEFAULT '0.00',
  `promotionuser` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `passwordpromotion` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `turnover_playuser` double(15,2) NOT NULL DEFAULT '0.00',
  `tokenplaygame` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`id`, `agent_id`, `username_agent`, `member_code`, `name`, `credit`, `bet_latest`, `username`, `password`, `status`, `status_delete`, `created_at`, `created_attime`, `updated_at`, `ip_address`, `browserlogin`, `customerGroup`, `userrank`, `lineid`, `note`, `currency`, `bank`, `accountName`, `accountNumber`, `phonenumber`, `lastName`, `recharge_times`, `bonususer`, `deposit`, `withdraw_member`, `latest_withdrawal`, `groupmember`, `turnover`, `total_top_up_amount`, `promotionuser`, `passwordpromotion`, `turnover_playuser`, `tokenplaygame`) VALUES
(1, 2, 'agent01', '2', 'kit', 0.00, 0.00, '0879914004', '8a6f2805b4515ac12058e79e66539be9', 'Y', 'N', '2023-10-19', '2023-10-19 17:46:37', '2023-10-19 17:46:37', '172.22.0.4', 'Google Chrome', NULL, 'NewMember', '', 'สมัครจากหน้าเว็บไซต์', 'บาท', 'ธนาคารกสิกรไทย', 'kit', '0102294078', '0879914004', 'kit', 0, 0, 0.00, 0.00, 0.00, 'NewMember', 0.00, 0.00, NULL, NULL, 0.00, NULL),
(2, 2, 'agent01', '2', 'victest', 1072.46, 10.00, '0954789782', '52c69e3a57331081823331c4e69d3f2e', 'Y', 'N', '2023-10-19', '2023-10-19 18:40:31', '2023-10-19 18:40:31', '192.168.160.5', 'Google Chrome', NULL, 'NewMember', '', 'สมัครจากหน้าเว็บไซต์', 'บาท', 'ธนาคารไทยพาณิชย์', 'victest', '0123456789', '0954789782', 'victest', 0, 0, 0.00, 0.00, 0.00, 'NewMember', 0.00, 0.00, NULL, NULL, 135.50, '7793c673-3d40-5d67-adb6-93c6a360ca39'),
(3, 2, 'agent01', '2', 'ปฏิภาณ อุ่นในธรรม', 0.00, 0.00, '0925711362', '19ede66f218015fd9df85ac886488926', 'Y', 'N', '2023-10-20', '2023-10-20 10:50:40', '2023-10-20 10:50:40', '192.168.224.4', 'Google Chrome', NULL, 'NewMember', '', 'สมัครจากหน้าเว็บไซต์', 'บาท', 'ธนาคารกสิกรไทย', 'ปฏิภาณ อุ่นในธรรม', '7442905791', '0925711362', 'ปฏิภาณ อุ่นในธรรม', 0, 0, 0.00, 0.00, 0.00, 'NewMember', 0.00, 0.00, NULL, NULL, 0.00, NULL),
(4, 2, 'agent01', '2', 'toon', 0.00, 0.00, '0835366936', 'e10adc3949ba59abbe56e057f20f883e', 'Y', 'N', '2023-10-23', '2023-10-23 03:45:26', '2023-10-23 03:45:26', '172.25.0.4', 'Google Chrome', NULL, 'NewMember', '', 'สมัครจากหน้าเว็บไซต์', 'บาท', 'ธนาคารไทยพาณิชย์', 'toon', '1234567890', '0835366936', 'toon', 0, 0, 0.00, 0.00, 0.00, 'NewMember', 0.00, 0.00, NULL, NULL, 0.00, NULL),
(5, 2, 'agent01', '2', 'นาย พีรวัส ขวัญแก้ว', 14228.44, 10.00, '0990825942', '1c8a0fb0f77321b2fea4124168f33eef', 'Y', 'N', '2023-10-23', '2023-10-23 08:34:56', '2023-10-23 08:34:56', '192.168.208.5', 'Google Chrome', NULL, 'NewMember', '', 'สมัครจากหน้าเว็บไซต์', 'บาท', 'ธนาคารไทยพาณิชย์', 'นาย พีรวัส ขวัญแก้ว', '8852932451', '0990825942', 'นาย พีรวัส ขวัญแก้ว', 5, 0, 0.00, 4500.00, 0.00, 'NewMember', 0.00, 35.00, NULL, NULL, 1060.50, '916ca7df-2f2d-5855-9181-93b9944647e6'),
(6, 2, 'agent01', '2', 'นิธิธร', 10319.10, 10.00, '0951789155', 'cf8c105ec5b1554187508d61aa4a325d', 'Y', 'N', '2023-10-25', '2023-10-25 10:14:27', '2023-10-25 10:14:27', '192.168.160.5', 'Google Chrome', NULL, 'NewMember', '', 'สมัครจากหน้าเว็บไซต์', 'บาท', 'ธนาคารกสิกรไทย', 'นิธิธร', '0373729485', '0951789155', 'นิธิธร', 0, 0, 0.00, 0.00, 0.00, 'NewMember', 0.00, 0.00, NULL, NULL, 738.00, 'eeee7226-70bb-5042-9a74-0b244f6bfb90'),
(7, 2, 'agent01', '2', 'แบม', 1002.85, 4.50, '0822936915', 'e10adc3949ba59abbe56e057f20f883e', 'Y', 'N', '2023-10-26', '2023-10-26 18:35:16', '2023-10-26 18:35:16', '192.168.208.5', 'Google Chrome', NULL, 'NewMember', '', 'สมัครจากหน้าเว็บไซต์', 'บาท', 'ธนาคารไทยพาณิชย์', 'แบม', '0123456789', '0822936915', 'แบม', 0, 0, 0.00, 0.00, 0.00, 'NewMember', 0.00, 0.00, NULL, NULL, 134.00, NULL),
(8, 2, 'agent01', '2', 'greenteaja', 1000.00, 0.00, '0819372939', 'e10adc3949ba59abbe56e057f20f883e', 'Y', 'N', '2023-10-27', '2023-10-27 03:58:17', '2023-10-27 03:58:17', 'null', 'null', NULL, 'NewMember', '', 'สมัครจากหน้าเว็บไซต์', 'บาท', 'ธนาคารออมสิน', 'greenteaja', '1234567890', '0819372939', 'greenteaja', 0, 0, 0.00, 0.00, 0.00, 'NewMember', 0.00, 0.00, NULL, NULL, 0.00, NULL),
(9, 2, 'agent01', '2', 'จิราภรณ์ แหขุนทด', 966.70, 5.00, '0840811863', 'b2e7106eafbafdcd5b9a29bb6ff0600d', 'Y', 'N', '2023-10-28', '2023-10-28 06:50:39', '2023-10-28 06:50:39', '172.18.0.4', 'Google Chrome', NULL, 'NewMember', '', 'สมัครจากหน้าเว็บไซต์', 'บาท', 'ธนาคารกสิกรไทย', 'จิราภรณ์ แหขุนทด', '0568925165', '0840811863', 'จิราภรณ์ แหขุนทด', 0, 0, 0.00, 0.00, 0.00, 'NewMember', 0.00, 0.00, NULL, NULL, 77.00, '323cc805-896d-5520-a520-8f89f77b75ed');

-- --------------------------------------------------------

--
-- Table structure for table `percentgame`
--

CREATE TABLE `percentgame` (
  `id` bigint NOT NULL,
  `subagent_id` bigint DEFAULT NULL,
  `gamename` varchar(30) CHARACTER SET utf32 COLLATE utf32_general_ci DEFAULT NULL,
  `img` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `hold_percentage` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '0%',
  `our_percentage` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '0%',
  `monthly_total` float(15,2) DEFAULT '0.00',
  `monthly` date DEFAULT NULL,
  `status_game` enum('Y','N') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `percentgame`
--

INSERT INTO `percentgame` (`id`, `subagent_id`, `gamename`, `img`, `hold_percentage`, `our_percentage`, `monthly_total`, `monthly`, `status_game`) VALUES
(26, 9, 'Lucky Bunny Gold', '/img/thumbs/icontest2.png', '40%', '50%', 15230.00, '2023-05-31', 'Y'),
(27, 9, 'CowBoys VS Aliens', '/img/thumbs/icontest3.png', '60%', '30%', 4230.00, '2023-05-31', 'Y'),
(28, 10, 'Go Gold Planet', '/img/thumbs/icontest1.png', '40%', '50%', 3000.00, '2023-05-31', 'Y'),
(29, 10, 'Lucky Bunny Gold', '/img/thumbs/icontest2.png', '40%', '50%', 15230.00, '2023-05-31', 'Y'),
(30, 10, 'CowBoys VS Aliens', '/img/thumbs/icontest3.png', '60%', '30%', 4230.00, '2023-05-31', 'Y'),
(31, 11, 'Go Gold Planet', '/img/thumbs/icontest1.png', '40%', '50%', 3000.00, '2023-05-31', 'Y'),
(32, 11, 'Lucky Bunny Gold', '/img/thumbs/icontest2.png', '40%', '50%', 15230.00, '2023-05-31', 'Y'),
(33, 11, 'CowBoys VS Aliens', '/img/thumbs/icontest3.png', '60%', '30%', 4230.00, '2023-05-31', 'Y'),
(34, 12, 'Go Gold Planet', '/img/thumbs/icontest1.png', '33%', '57%', 0.00, '2023-06-01', 'Y'),
(35, 12, 'Lucky Bunny Gold', '/img/thumbs/icontest2.png', '40%', '50%', 0.00, '2023-06-01', 'Y'),
(36, 12, 'CowBoys VS Aliens', '/img/thumbs/icontest3.png', '50%', '40%', 0.00, '2023-06-01', 'Y'),
(37, 14, 'Go Gold Planet', '/img/thumbs/icontest1.png', '3%', '87%', 0.00, '2023-06-01', 'Y'),
(38, 14, 'Lucky Bunny Gold', '/img/thumbs/icontest2.png', '1%', '89%', 0.00, '2023-06-01', 'Y'),
(39, 14, 'CowBoys VS Aliens', '/img/thumbs/icontest3.png', '12%', '78%', 0.00, '2023-06-01', 'Y'),
(40, 15, 'Go Gold Planet', '/img/thumbs/icontest1.png', '40%', '50%', 0.00, '2023-06-01', 'Y'),
(41, 15, 'Lucky Bunny Gold', '/img/thumbs/icontest2.png', '50%', '40%', 0.00, '2023-06-01', 'Y'),
(42, 15, 'CowBoys VS Aliens', '/img/thumbs/icontest3.png', '55%', '35%', 0.00, '2023-06-01', 'Y'),
(43, 16, 'Go Gold Planet', '/img/thumbs/icontest1.png', '36%', '54%', 0.00, '2023-06-01', 'Y'),
(44, 16, 'Lucky Bunny Gold', '/img/thumbs/icontest2.png', '43%', '47%', 0.00, '2023-06-01', 'Y'),
(45, 16, 'CowBoys VS Aliens', '/img/thumbs/icontest3.png', '22%', '68%', 0.00, '2023-06-01', 'Y'),
(46, 17, 'Go Gold Planet', '/img/thumbs/icontest1.png', '22%', '68%', 0.00, '2023-06-01', 'Y'),
(47, 17, 'Lucky Bunny Gold', '/img/thumbs/icontest2.png', '24%', '66%', 0.00, '2023-06-01', 'Y'),
(48, 17, 'CowBoys VS Aliens', '/img/thumbs/icontest3.png', '31%', '59%', 0.00, '2023-06-01', 'Y'),
(49, 18, 'Go Gold Planet', '/img/thumbs/icontest1.png', '54%', '36%', 0.00, '2023-06-01', 'Y'),
(50, 18, 'CowBoys VS Aliens', '/img/thumbs/icontest3.png', '30%', '60%', 0.00, '2023-06-01', 'Y'),
(51, 18, 'Lucky Bunny Gold', '/img/thumbs/icontest2.png', '58%', '32%', 0.00, '2023-06-01', 'Y'),
(52, 19, 'Go Gold Planet', '/img/thumbs/icontest1.png', '54%', '36%', 0.00, '2023-06-01', 'Y'),
(53, 19, 'CowBoys VS Aliens', '/img/thumbs/icontest3.png', '30%', '60%', 0.00, '2023-06-01', 'Y'),
(54, 19, 'Lucky Bunny Gold', '/img/thumbs/icontest2.png', '58%', '32%', 0.00, '2023-06-01', 'Y'),
(55, 20, 'Go Gold Planet', '/img/thumbs/icontest1.png', '54%', '36%', 0.00, '2023-06-01', 'Y'),
(56, 20, 'CowBoys VS Aliens', '/img/thumbs/icontest3.png', '30%', '60%', 0.00, '2023-06-01', 'Y'),
(57, 20, 'Lucky Bunny Gold', '/img/thumbs/icontest2.png', '58%', '32%', 0.00, '2023-06-01', 'Y'),
(58, 21, 'Go Gold Planet', '/img/thumbs/icontest1.png', '50%', '40%', 0.00, '2023-06-02', 'Y'),
(59, 21, 'Lucky Bunny Gold', '/img/thumbs/icontest2.png', '50%', '40%', 0.00, '2023-06-02', 'Y'),
(60, 21, 'CowBoys VS Aliens', '/img/thumbs/icontest3.png', '50%', '40%', 0.00, '2023-06-02', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `repostgame`
--

CREATE TABLE `repostgame` (
  `id` bigint NOT NULL,
  `iduser` bigint NOT NULL DEFAULT '0',
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `gameid` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `bet` double(15,2) NOT NULL DEFAULT '0.00',
  `win` double(15,2) NOT NULL DEFAULT '0.00',
  `balance_credit` double(15,2) NOT NULL DEFAULT '0.00',
  `get_browser` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `platform` enum('PC','Mobile') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Mobile',
  `trans_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'NO',
  `created_atdate` date NOT NULL,
  `created_attime` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `repostgame`
--

INSERT INTO `repostgame` (`id`, `iduser`, `username`, `gameid`, `bet`, `win`, `balance_credit`, `get_browser`, `platform`, `trans_id`, `created_atdate`, `created_attime`) VALUES
(1, 4, '0835366936', 'DOGZILLA', 0.00, 0.00, 0.00, 'Google Chrome', 'PC', 'NO', '2023-10-23', '03:46:51'),
(2, 4, '0835366936', 'DOGZILLA', 0.00, 0.00, 0.00, 'Google Chrome', 'PC', 'NO', '2023-10-23', '03:46:54'),
(3, 4, '0835366936', 'DOGZILLA', 0.00, 0.00, 0.00, 'Google Chrome', 'PC', 'NO', '2023-10-23', '03:46:58'),
(4, 4, '0835366936', 'DOGZILLA', 0.00, 0.00, 0.00, 'Google Chrome', 'PC', 'NO', '2023-10-23', '03:49:36'),
(5, 4, '0835366936', 'DOGZILLA', 0.00, 0.00, 0.00, 'Google Chrome', 'PC', 'NO', '2023-10-23', '03:49:39'),
(6, 4, '0835366936', 'DOGZILLA', 0.00, 0.00, 0.00, 'Google Chrome', 'PC', 'NO', '2023-10-23', '03:51:17'),
(7, 4, '0835366936', 'DOGZILLA', 0.00, 0.00, 0.00, 'Google Chrome', 'PC', 'NO', '2023-10-23', '03:51:17'),
(8, 4, '0835366936', 'DOGZILLA', 0.00, 0.00, 0.00, 'Google Chrome', 'PC', 'NO', '2023-10-23', '03:51:22'),
(9, 4, '0835366936', 'DOGZILLA', 0.00, 0.00, 0.00, 'Google Chrome', 'PC', 'NO', '2023-10-23', '03:51:22'),
(10, 4, '0835366936', 'DOGZILLA', 0.00, 0.00, 0.00, 'Google Chrome', 'PC', 'NO', '2023-10-23', '03:51:26'),
(11, 4, '0835366936', 'DOGZILLA', 0.00, 0.00, 0.00, 'Google Chrome', 'PC', 'NO', '2023-10-23', '03:51:26'),
(12, 4, '0835366936', 'DOGZILLA', 0.00, 0.00, 0.00, 'Google Chrome', 'PC', 'NO', '2023-10-23', '03:51:28'),
(13, 4, '0835366936', 'DOGZILLA', 0.00, 0.00, 0.00, 'Google Chrome', 'PC', 'NO', '2023-10-23', '03:51:28'),
(14, 4, '0835366936', 'DOGZILLA', 0.00, 0.00, 0.00, 'Google Chrome', 'PC', 'NO', '2023-10-23', '03:51:31'),
(15, 4, '0835366936', 'DOGZILLA', 0.00, 0.00, 0.00, 'Google Chrome', 'PC', 'NO', '2023-10-23', '03:51:31'),
(16, 4, '0835366936', 'DOGZILLA', 0.00, 0.00, 0.00, 'Google Chrome', 'PC', 'NO', '2023-10-23', '03:51:35'),
(17, 4, '0835366936', 'DOGZILLA', 0.00, 0.00, 0.00, 'Google Chrome', 'PC', 'NO', '2023-10-23', '03:51:35'),
(18, 5, '0990825942', 'undefined', 20.00, 56.40, 980.00, 'Google Chrome', 'PC', 'NO', '2023-10-23', '17:18:32'),
(19, 5, '0990825942', 'DOGZILLA', 20.00, 56.40, 1149.20, 'Google Chrome', 'PC', 'NO', '2023-10-23', '17:31:24'),
(20, 5, '0990825942', 'DOGZILLA', 20.00, 0.00, 1205.60, 'Google Chrome', 'PC', 'NO', '2023-10-23', '17:31:46'),
(21, 5, '0990825942', 'DOGZILLA', 20.00, 56.40, 1145.60, 'Google Chrome', 'PC', 'NO', '2023-10-23', '17:52:23'),
(22, 5, '0990825942', 'DOGZILLA', 20.00, 0.00, 1202.00, 'Google Chrome', 'PC', 'NO', '2023-10-23', '17:54:21'),
(23, 4, '0835366936', 'DOGZILLA', 0.00, 0.00, 0.00, 'Google Chrome', 'PC', 'NO', '2023-10-24', '11:10:21'),
(24, 4, '0835366936', 'DOGZILLA', 0.00, 0.00, 0.00, 'Google Chrome', 'PC', 'NO', '2023-10-24', '11:10:25'),
(25, 4, '0835366936', 'DOGZILLA', 0.00, 0.00, 0.00, 'Google Chrome', 'PC', 'NO', '2023-10-24', '11:10:29'),
(26, 4, '0835366936', 'DOGZILLA', 0.00, 0.00, 0.00, 'Google Chrome', 'PC', 'NO', '2023-10-24', '11:10:36'),
(27, 4, '0835366936', 'DOGZILLA', 0.00, 0.00, 0.00, 'Google Chrome', 'PC', 'NO', '2023-10-24', '11:10:41'),
(28, 4, '0835366936', 'DOGZILLA', 0.00, 0.00, 0.00, 'Google Chrome', 'PC', 'NO', '2023-10-24', '11:12:00'),
(29, 4, '0835366936', 'DOGZILLA', 0.00, 0.00, 0.00, 'Google Chrome', 'PC', 'NO', '2023-10-24', '11:12:06'),
(30, 4, '0835366936', 'DOGZILLA', 0.00, 0.00, 0.00, 'Google Chrome', 'PC', 'NO', '2023-10-24', '11:12:10'),
(31, 4, '0835366936', 'DOGZILLA', 0.00, 0.00, 0.00, 'Google Chrome', 'PC', 'NO', '2023-10-24', '11:12:13'),
(32, 4, '0835366936', 'DOGZILLA', 0.00, 0.00, 0.00, 'Google Chrome', 'PC', 'NO', '2023-10-24', '11:12:16'),
(33, 4, '0835366936', 'DOGZILLA', 0.00, 0.00, 0.00, 'Google Chrome', 'PC', 'NO', '2023-10-24', '12:17:04'),
(34, 4, '0835366936', 'DOGZILLA', 0.00, 0.00, 0.00, 'Google Chrome', 'PC', 'NO', '2023-10-24', '12:17:04'),
(35, 4, '0835366936', 'DOGZILLA', 0.00, 0.00, 0.00, 'Google Chrome', 'PC', 'NO', '2023-10-24', '12:17:08'),
(36, 4, '0835366936', 'DOGZILLA', 0.00, 0.00, 0.00, 'Google Chrome', 'PC', 'NO', '2023-10-24', '12:17:08'),
(37, 3, '0925711362', 'DOGZILLA', 0.00, 0.00, 0.00, 'Google Chrome', 'PC', 'NO', '2023-10-24', '13:38:31'),
(38, 3, '0925711362', 'DOGZILLA', 0.00, 0.00, 0.00, 'Google Chrome', 'PC', 'NO', '2023-10-24', '13:38:38'),
(39, 3, '0925711362', 'DOGZILLA', 0.00, 0.00, 0.00, 'Google Chrome', 'PC', 'NO', '2023-10-24', '13:39:15'),
(40, 3, '0925711362', 'DOGZILLA', 0.00, 0.00, 0.00, 'Google Chrome', 'PC', 'NO', '2023-10-24', '13:39:22'),
(41, 3, '0925711362', 'DOGZILLA', 0.00, 0.00, 0.00, 'Google Chrome', 'PC', 'NO', '2023-10-24', '13:39:25'),
(42, 6, '0951789155', 'DOGZILLA', 25.00, 125.00, 9975.00, 'Google Chrome', 'PC', 'NO', '2023-10-25', '10:23:18'),
(43, 2, '0954789782', 'DOGZILLA', 1500.00, 4.86, 998.00, 'Google Chrome', 'PC', 'NO', '2023-10-25', '10:25:42'),
(44, 6, '0951789155', 'DOGZILLA', 1200.00, 12.00, 10080.00, 'Google Chrome', 'PC', 'NO', '2023-10-25', '10:25:47'),
(45, 6, '0951789155', 'DOGZILLA', 10.00, 0.00, 10092.00, 'Google Chrome', 'PC', 'NO', '2023-10-25', '10:26:16'),
(46, 2, '0954789782', 'DOGZILLA', 2.00, 5.64, 1000.86, 'Google Chrome', 'PC', 'NO', '2023-10-25', '10:26:49'),
(47, 6, '0951789155', 'DOGZILLA', 400.00, 888.20, 10082.00, 'Google Chrome', 'PC', 'NO', '2023-10-25', '10:28:51'),
(48, 6, '0951789155', 'DOGZILLA', 200.00, 240.00, 10770.20, 'Google Chrome', 'PC', 'NO', '2023-10-25', '10:29:35'),
(49, 6, '0951789155', 'DOGZILLA', 10.00, 28.20, 10980.20, 'Google Chrome', 'PC', 'NO', '2023-10-25', '14:43:04'),
(50, 6, '0951789155', 'DOGZILLA', 10.00, 12.00, 10998.40, 'Google Chrome', 'PC', 'NO', '2023-10-25', '14:43:47'),
(51, 6, '0951789155', 'DOGZILLA', 10.00, 0.00, 11010.40, 'Google Chrome', 'PC', 'NO', '2023-10-25', '14:44:24'),
(52, 6, '0951789155', 'DOGZILLA', 5.00, 6.00, 11005.40, 'Google Chrome', 'PC', 'NO', '2023-10-25', '14:44:59'),
(53, 6, '0951789155', 'DOGZILLA', 3.00, 8.46, 11008.40, 'Google Chrome', 'PC', 'NO', '2023-10-25', '15:16:00'),
(54, 6, '0951789155', 'DOGZILLA', 10.00, 21.80, 10996.86, 'Google Chrome', 'PC', 'NO', '2023-10-25', '15:17:54'),
(55, 6, '0951789155', 'DOGZILLA', 10.00, 28.20, 11008.66, 'Google Chrome', 'PC', 'NO', '2023-10-25', '15:18:39'),
(56, 6, '0951789155', 'DOGZILLA', 10.00, 50.00, 11016.86, 'Google Chrome', 'PC', 'NO', '2023-10-25', '15:45:02'),
(57, 6, '0951789155', 'DOGZILLA', 10.00, 38.00, 11026.86, 'Google Chrome', 'PC', 'NO', '2023-10-25', '15:47:15'),
(58, 6, '0951789155', 'DOGZILLA', 10.00, 28.20, 11054.86, 'Google Chrome', 'PC', 'NO', '2023-10-25', '15:48:15'),
(59, 6, '0951789155', 'DOGZILLA', 10.00, 0.00, 11073.06, 'Google Chrome', 'PC', 'NO', '2023-10-25', '15:49:21'),
(60, 6, '0951789155', 'DOGZILLA', 10.00, 0.00, 11063.06, 'Google Chrome', 'PC', 'NO', '2023-10-25', '15:49:50'),
(61, 2, '0954789782', 'DOGZILLA', 5.00, 9.20, 1004.70, 'Apple Safari', 'PC', 'NO', '2023-10-25', '21:34:13'),
(62, 2, '0954789782', 'PGSOFT2', 1.00, 0.20, 1003.90, 'Google Chrome', 'PC', 'NO', '2023-10-25', '21:37:10'),
(63, 2, '0954789782', 'PGSOFT2', 0.00, 0.20, 1004.10, 'Google Chrome', 'PC', 'NO', '2023-10-25', '21:37:14'),
(64, 2, '0954789782', 'PGSOFT2', 0.00, 0.00, 1004.10, 'Google Chrome', 'PC', 'NO', '2023-10-25', '21:37:18'),
(65, 5, '0990825942', 'GAME', 0.00, 0.00, 1172.00, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAAMIT3ARAGAAAAAAA', '2023-10-26', '03:41:58'),
(66, 5, '0990825942', 'GAME', 0.00, 0.00, 1172.00, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAAAIAAAAA', '2023-10-26', '03:41:59'),
(67, 5, '0990825942', 'GAME', 0.00, 0.00, 1182.00, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAAIA23ARAGAAAAAAA', '2023-10-26', '03:42:03'),
(68, 5, '0990825942', 'GAME', 0.00, 0.00, 1182.00, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAAAQAAAAA', '2023-10-26', '03:42:04'),
(69, 5, '0990825942', 'GAME', 0.00, 0.00, 1192.00, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAAXJC3ARAGAAAAAAA', '2023-10-26', '03:42:09'),
(70, 5, '0990825942', 'GAME', 0.00, 0.00, 1192.00, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAAAYAAAAA', '2023-10-26', '03:42:10'),
(71, 5, '0990825942', 'GAME', 0.00, 0.00, 1202.00, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAB3JK3ARAGAAAAAAA', '2023-10-26', '03:42:15'),
(72, 5, '0990825942', 'GAME', 0.00, 0.00, 1202.00, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAABAAAAAA', '2023-10-26', '03:42:20'),
(73, 5, '0990825942', 'GAME', 0.00, 0.00, 1212.00, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAABUZW3ARAGAAAAAAA', '2023-10-26', '03:42:24'),
(74, 5, '0990825942', 'GAME', 0.00, 0.00, 1212.00, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAABIAAAAA', '2023-10-26', '03:42:24'),
(75, 5, '0990825942', 'GAME', 0.00, 0.00, 1222.00, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAABUSO3ARAGAAAAAAA', '2023-10-26', '03:42:41'),
(76, 5, '0990825942', 'GAME', 0.00, 0.00, 1222.00, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAABQAAAAA', '2023-10-26', '03:42:45'),
(77, 5, '0990825942', 'GAME', 0.00, 0.00, 1232.00, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAABZMI3ARAGAAAAAAA', '2023-10-26', '03:43:24'),
(78, 5, '0990825942', 'GAME', 0.00, 0.00, 1232.00, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAABYAAAAA', '2023-10-26', '03:43:24'),
(79, 5, '0990825942', 'GAME', 0.00, 0.00, 1252.00, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAABVQV4ARAGAAAAAAA', '2023-10-26', '04:06:49'),
(80, 5, '0990825942', 'GAME', 0.00, 0.00, 1252.00, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAACAAAAAA', '2023-10-26', '04:06:50'),
(81, 5, '0990825942', 'GAME', 0.00, 0.00, 1272.00, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAALBH4ARAGAAAAAAA', '2023-10-26', '04:07:02'),
(82, 5, '0990825942', 'GAME', 0.00, 0.00, 1272.00, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAACIAAAAA', '2023-10-26', '04:07:02'),
(83, 5, '0990825942', 'GAME', 0.00, 0.00, 1292.00, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAAABP4ARAGAAAAAAA', '2023-10-26', '04:07:07'),
(84, 5, '0990825942', 'GAME', 0.00, 0.00, 1292.00, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAACQAAAAA', '2023-10-26', '04:07:07'),
(85, 5, '0990825942', 'GAME', 0.00, 0.00, 1312.00, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAACC34ARAGAAAAAAA', '2023-10-26', '04:07:38'),
(86, 5, '0990825942', 'GAME', 0.00, 0.00, 1312.00, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAACYAAAAA', '2023-10-26', '04:07:38'),
(87, 5, '0990825942', 'GAME', 0.00, 0.00, 1322.00, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAABR5F4MRAGAAAAAAA', '2023-10-26', '04:17:33'),
(88, 5, '0990825942', 'GAME', 0.00, 0.00, 1322.00, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAADQAAAAA', '2023-10-26', '04:17:33'),
(89, 5, '0990825942', 'GAME', 0.00, 0.00, 1332.00, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAAFV24MRAGAAAAAAA', '2023-10-26', '04:17:47'),
(90, 5, '0990825942', 'GAME', 0.00, 0.00, 1332.00, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAADYAAAAA', '2023-10-26', '04:17:47'),
(91, 5, '0990825942', 'GAME', 0.00, 0.00, 1342.00, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAA42B4QRAGAAAAAAA', '2023-10-26', '04:19:19'),
(92, 5, '0990825942', 'GAME', 0.00, 0.00, 1342.00, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAAEAAAAAA', '2023-10-26', '04:19:19'),
(93, 5, '0990825942', 'GAME', 0.00, 0.00, 1332.00, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAABXGM4URAGAAAAAAA', '2023-10-26', '04:23:47'),
(94, 5, '0990825942', 'GAME', 0.00, 0.00, 1332.00, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAAEQAAAAA', '2023-10-26', '04:23:47'),
(95, 5, '0990825942', 'GAME', 0.00, 0.00, 1322.00, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAAQGX4URAGAAAAAAA', '2023-10-26', '04:23:54'),
(96, 5, '0990825942', 'GAME', 0.00, 0.00, 1322.00, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAAEYAAAAA', '2023-10-26', '04:23:54'),
(97, 5, '0990825942', 'GAME', 0.00, 0.00, 1312.00, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAAVPF4URAGAAAAAAA', '2023-10-26', '04:24:03'),
(98, 5, '0990825942', 'GAME', 0.00, 0.00, 1312.00, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAAFAAAAAA', '2023-10-26', '04:24:04'),
(99, 5, '0990825942', 'GAME', 0.00, 0.00, 1302.00, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAA3HK4URAGAAAAAAA', '2023-10-26', '04:24:07'),
(100, 5, '0990825942', 'GAME', 0.00, 0.00, 1302.00, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAAFIAAAAA', '2023-10-26', '04:24:07'),
(101, 5, '0990825942', 'GAME', 0.00, 0.00, 1292.00, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAALXP4URAGAAAAAAA', '2023-10-26', '04:24:10'),
(102, 5, '0990825942', 'GAME', 0.00, 0.00, 1292.00, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAAFQAAAAA', '2023-10-26', '04:24:13'),
(103, 5, '0990825942', 'GAME', 0.00, 0.00, 1282.00, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAAPAS4YRAGAAAAAAA', '2023-10-26', '04:24:33'),
(104, 5, '0990825942', 'GAME', 0.00, 0.00, 1282.00, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAAFYAAAAA', '2023-10-26', '04:24:38'),
(105, 5, '0990825942', 'GAME', 0.00, 0.00, 1272.00, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAABDLA4YRAGAAAAAAA', '2023-10-26', '04:25:27'),
(106, 5, '0990825942', 'GAME', 0.00, 0.00, 1272.00, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAAGAAAAAA', '2023-10-26', '04:25:31'),
(107, 5, '0990825942', 'GAME', 0.00, 0.00, 1262.00, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAA3DZ4YRAGAAAAAAA', '2023-10-26', '04:25:44'),
(108, 5, '0990825942', 'GAME', 0.00, 0.00, 1262.00, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAAGIAAAAA', '2023-10-26', '04:25:44'),
(109, 5, '0990825942', 'GAME', 0.00, 0.00, 1252.00, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAAIL54YRAGAAAAAAA', '2023-10-26', '04:25:46'),
(110, 5, '0990825942', 'GAME', 0.00, 0.00, 1252.00, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAAGQAAAAA', '2023-10-26', '04:25:47'),
(111, 5, '0990825942', 'GAME', 0.00, 0.00, 1242.00, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAAJEB4YRAGAAAAAAA', '2023-10-26', '04:25:49'),
(112, 5, '0990825942', 'GAME', 10.00, 0.00, 1252.00, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAAJMB4YRAGAAAAAAA', '2023-10-26', '04:25:49'),
(113, 5, '0990825942', 'GAME', 10.00, 0.00, 1262.00, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAAWMP4YRAGAAAAAAA', '2023-10-26', '04:25:59'),
(114, 5, '0990825942', 'GAME', 0.00, 0.00, 1262.00, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAAGYAAAAA', '2023-10-26', '04:26:00'),
(115, 5, '0990825942', 'GAME', 0.00, 0.00, 1252.00, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAA2424YRAGAAAAAAA', '2023-10-26', '04:26:07'),
(116, 5, '0990825942', 'GAME', 30.00, 0.00, 1282.00, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAA3E24YRAGAAAAAAA', '2023-10-26', '04:26:07'),
(117, 5, '0990825942', 'GAME', 0.00, 0.00, 1282.00, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAAHAAAAAA', '2023-10-26', '04:26:13'),
(118, 5, '0990825942', 'GAME', 0.00, 0.00, 1272.00, 'Google Chrome', 'PC', 'AIBQACAANHKOCJQAAAAABUU5HY3RKAAAAAAA', '2023-10-26', '04:52:07'),
(119, 5, '0990825942', 'GAME', 0.00, 0.00, 1272.00, 'Google Chrome', 'PC', 'AIBQACAANHKOCJQAAAAAAAIAAAAA', '2023-10-26', '04:52:07'),
(120, 5, '0990825942', 'GAME', 0.00, 0.00, 1262.00, 'Google Chrome', 'PC', 'AIBQACAANHKOCJQAAAAAAXVFHY3RKAAAAAAA', '2023-10-26', '04:52:12'),
(121, 5, '0990825942', 'GAME', 0.00, 0.00, 1262.00, 'Google Chrome', 'PC', 'AIBQACAANHKOCJQAAAAAAAQAAAAA', '2023-10-26', '04:52:12'),
(122, 5, '0990825942', 'GAME', 0.00, 0.00, 1252.00, 'Google Chrome', 'PC', 'AIBQACAANHKOCJQAAAAAAQNKHY3RKAAAAAAA', '2023-10-26', '04:52:15'),
(123, 5, '0990825942', 'GAME', 0.00, 0.00, 1252.00, 'Google Chrome', 'PC', 'AIBQACAANHKOCJQAAAAAAAYAAAAA', '2023-10-26', '04:52:16'),
(124, 5, '0990825942', 'GAME', 0.00, 0.00, 1242.00, 'Google Chrome', 'PC', 'AIBQACAANHKOCJQAAAAAAU5PHY3RKAAAAAAA', '2023-10-26', '04:52:19'),
(125, 5, '0990825942', 'GAME', 0.00, 0.00, 1242.00, 'Google Chrome', 'PC', 'AIBQACAANHKOCJQAAAAAABAAAAAA', '2023-10-26', '04:52:19'),
(126, 5, '0990825942', 'GAME', 0.00, 0.00, 1232.00, 'Google Chrome', 'PC', 'AIBQACAANHKOCJQAAAAABWVWHY3RKAAAAAAA', '2023-10-26', '04:52:23'),
(127, 5, '0990825942', 'GAME', 2.40, 0.00, 1234.40, 'Google Chrome', 'PC', 'AIBQACAANHKOCJQAAAAABW5WHY3RKAAAAAAA', '2023-10-26', '04:52:24'),
(128, 5, '0990825942', 'GAME', 0.00, 0.00, 1234.40, 'Google Chrome', 'PC', 'AIBQACAANHKOCJQAAAAAABIAAAAA', '2023-10-26', '04:52:24'),
(129, 5, '0990825942', 'GAME', 0.00, 0.00, 1224.40, 'Google Chrome', 'PC', 'AIBQACAANHKOCJQAAAAABGGXHY3RKAAAAAAA', '2023-10-26', '04:52:46'),
(130, 5, '0990825942', 'GAME', 10.00, 0.00, 1234.40, 'Google Chrome', 'PC', 'AIBQACAANHKOCJQAAAAABGOXHY3RKAAAAAAA', '2023-10-26', '04:52:46'),
(131, 5, '0990825942', 'GAME', 0.00, 0.00, 1234.40, 'Google Chrome', 'PC', 'AIBQACAANHKOCJQAAAAAABQAAAAA', '2023-10-26', '04:52:47'),
(132, 5, '0990825942', 'GAME', 0.00, 0.00, 734.40, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAABF4S6ARAGAAAAAAA', '2023-10-26', '04:53:31'),
(133, 5, '0990825942', 'GAME', 20.00, 0.00, 754.40, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAABGMS6ARAGAAAAAAA', '2023-10-26', '04:53:31'),
(134, 5, '0990825942', 'GAME', 4.00, 0.00, 758.40, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAAPNH6ARAGAAAAAAA', '2023-10-26', '04:53:44'),
(135, 5, '0990825942', 'GAME', 10.00, 0.00, 768.40, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAABJFP6ARAGAAAAAAA', '2023-10-26', '04:53:50'),
(136, 5, '0990825942', 'GAME', 180.00, 0.00, 948.40, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAB2WF6ARAGAAAAAAA', '2023-10-26', '04:54:03'),
(137, 5, '0990825942', 'GAME', 88.00, 0.00, 1036.40, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAABRO36ARAGAAAAAAA', '2023-10-26', '04:54:17'),
(138, 5, '0990825942', 'GAME', 150.00, 0.00, 1186.40, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAAPH46ARAGAAAAAAA', '2023-10-26', '04:54:37'),
(139, 5, '0990825942', 'GAME', 35.00, 0.00, 1221.40, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAACIP6ERAGAAAAAAA', '2023-10-26', '04:54:49'),
(140, 5, '0990825942', 'GAME', 28.00, 0.00, 1249.40, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAABRZW6ERAGAAAAAAA', '2023-10-26', '04:55:14'),
(141, 5, '0990825942', 'GAME', 84.00, 0.00, 1333.40, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAAFSI6ERAGAAAAAAA', '2023-10-26', '04:55:25'),
(142, 5, '0990825942', 'GAME', 56.00, 0.00, 1389.40, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAB5KV6ERAGAAAAAAA', '2023-10-26', '04:55:33'),
(143, 5, '0990825942', 'GAME', 0.00, 0.00, 1389.40, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAAHIAAAAA', '2023-10-26', '04:55:43'),
(144, 6, '0951789155', 'DOGZILLA', 10.00, 12.00, 11053.06, 'Google Chrome', 'PC', 'NO', '2023-10-26', '05:16:38'),
(145, 6, '0951789155', 'DOGZILLA', 10.00, 28.20, 11055.06, 'Google Chrome', 'PC', 'NO', '2023-10-26', '05:17:17'),
(146, 2, '0954789782', 'SPINIX', 0.00, 0.90, 1002.50, 'Google Chrome', 'PC', 'NO', '2023-10-26', '06:06:08'),
(147, 2, '0954789782', 'SPINIX', 0.00, 0.20, 1000.20, 'Google Chrome', 'PC', 'NO', '2023-10-26', '06:06:18'),
(148, 2, '0954789782', 'SPINIX', 0.00, 0.00, 997.70, 'Google Chrome', 'PC', 'NO', '2023-10-26', '06:06:24'),
(149, 2, '0954789782', 'SPINIX', 0.00, 0.20, 995.40, 'Google Chrome', 'PC', 'NO', '2023-10-26', '06:06:28'),
(150, 2, '0954789782', 'SPINIX', 0.00, 0.70, 993.60, 'Google Chrome', 'PC', 'NO', '2023-10-26', '06:06:33'),
(151, 2, '0954789782', 'SPINIX', 0.00, 4.30, 995.40, 'Google Chrome', 'PC', 'NO', '2023-10-26', '06:06:39'),
(152, 2, '0954789782', 'SPINIX', 0.00, 0.50, 993.40, 'Google Chrome', 'PC', 'NO', '2023-10-26', '06:07:21'),
(153, 2, '0954789782', 'SPINIX', 0.00, 0.00, 990.40, 'Google Chrome', 'PC', 'NO', '2023-10-26', '06:08:00'),
(154, 2, '0954789782', 'SPINIX', 0.00, 0.00, 987.40, 'Google Chrome', 'PC', 'NO', '2023-10-26', '06:08:05'),
(155, 2, '0954789782', 'SPINIX', 0.00, 0.00, 984.40, 'Google Chrome', 'PC', 'NO', '2023-10-26', '06:08:10'),
(156, 2, '0954789782', 'SPINIX', 0.00, 0.00, 981.40, 'Google Chrome', 'PC', 'NO', '2023-10-26', '06:08:16'),
(157, 2, '0954789782', 'SPINIX', 0.00, 56.00, 1034.40, 'Google Chrome', 'PC', 'NO', '2023-10-26', '06:08:27'),
(158, 2, '0954789782', 'SPINIX', 0.00, 4.00, 1038.40, 'Google Chrome', 'PC', 'NO', '2023-10-26', '06:08:33'),
(159, 2, '0954789782', 'SPINIX', 0.00, 0.00, 1038.40, 'Google Chrome', 'PC', 'NO', '2023-10-26', '06:08:36'),
(160, 2, '0954789782', 'SPINIX', 0.00, 0.00, 1035.40, 'Google Chrome', 'PC', 'NO', '2023-10-26', '06:08:48'),
(161, 2, '0954789782', 'SPINIX', 0.00, 0.00, 1032.40, 'Google Chrome', 'PC', 'NO', '2023-10-26', '06:08:53'),
(162, 2, '0954789782', 'SPINIX', 0.00, 2.00, 1031.40, 'Google Chrome', 'PC', 'NO', '2023-10-26', '06:09:01'),
(163, 2, '0954789782', 'SPINIX', 0.00, 8.00, 1039.40, 'Google Chrome', 'PC', 'NO', '2023-10-26', '06:09:02'),
(164, 2, '0954789782', 'SPINIX', 0.00, 0.00, 1039.40, 'Google Chrome', 'PC', 'NO', '2023-10-26', '06:09:04'),
(165, 2, '0954789782', 'SPINIX', 0.00, 0.00, 1036.90, 'Google Chrome', 'PC', 'NO', '2023-10-26', '06:09:29'),
(166, 2, '0954789782', 'SPINIX', 0.00, 0.00, 1034.40, 'Google Chrome', 'PC', 'NO', '2023-10-26', '06:09:33'),
(167, 2, '0954789782', 'SPINIX', 0.00, 0.00, 1031.90, 'Google Chrome', 'PC', 'NO', '2023-10-26', '06:09:35'),
(168, 2, '0954789782', 'SPINIX', 0.00, 2.50, 1031.90, 'Google Chrome', 'PC', 'NO', '2023-10-26', '06:09:36'),
(169, 6, '0951789155', 'DOGZILLA', 10.00, 0.00, 11073.26, 'Google Chrome', 'PC', 'NO', '2023-10-26', '06:12:15'),
(170, 6, '0951789155', 'DOGZILLA', 10.00, 50.00, 11063.26, 'Google Chrome', 'PC', 'NO', '2023-10-26', '06:21:08'),
(171, 6, '0951789155', 'DOGZILLA', 10.00, 38.00, 11093.26, 'Google Chrome', 'PC', 'NO', '2023-10-26', '06:28:11'),
(172, 6, '0951789155', 'DOGZILLA', 10.00, 12.00, 11121.26, 'Google Chrome', 'PC', 'NO', '2023-10-26', '06:28:55'),
(173, 2, '0954789782', 'SPINIX', 0.00, 0.00, 1029.40, 'Google Chrome', 'PC', 'NO', '2023-10-26', '06:34:23'),
(174, 2, '0954789782', 'SPINIX', 0.00, 2.00, 1028.90, 'Google Chrome', 'PC', 'NO', '2023-10-26', '06:34:27'),
(175, 2, '0954789782', 'SPINIX', 0.00, 0.00, 1028.90, 'Google Chrome', 'PC', 'NO', '2023-10-26', '06:34:30'),
(176, 2, '0954789782', 'SPINIX', 0.00, 0.00, 1026.40, 'Google Chrome', 'PC', 'NO', '2023-10-26', '06:34:34'),
(177, 2, '0954789782', 'SPINIX', 0.00, 0.00, 1023.90, 'Google Chrome', 'PC', 'NO', '2023-10-26', '06:34:39'),
(178, 2, '0954789782', 'SPINIX', 0.00, 0.00, 1021.40, 'Google Chrome', 'PC', 'NO', '2023-10-26', '06:34:44'),
(179, 2, '0954789782', 'SPINIX', 0.00, 0.00, 1018.90, 'Google Chrome', 'PC', 'NO', '2023-10-26', '06:34:52'),
(180, 2, '0954789782', 'SPINIX', 0.00, 0.00, 1016.40, 'Google Chrome', 'PC', 'NO', '2023-10-26', '06:34:53'),
(181, 2, '0954789782', 'SPINIX', 0.00, 0.00, 1013.90, 'Google Chrome', 'PC', 'NO', '2023-10-26', '06:34:55'),
(182, 2, '0954789782', 'SPINIX', 0.00, 0.00, 1011.40, 'Google Chrome', 'PC', 'NO', '2023-10-26', '06:34:56'),
(183, 2, '0954789782', 'SPINIX', 0.00, 0.00, 1008.90, 'Google Chrome', 'PC', 'NO', '2023-10-26', '06:34:58'),
(184, 2, '0954789782', 'SPINIX', 0.00, 0.80, 1007.20, 'Google Chrome', 'PC', 'NO', '2023-10-26', '06:35:00'),
(185, 2, '0954789782', 'SPINIX', 0.00, 0.00, 1007.20, 'Google Chrome', 'PC', 'NO', '2023-10-26', '06:35:01'),
(186, 2, '0954789782', 'SPINIX', 0.00, 10.00, 1014.70, 'Google Chrome', 'PC', 'NO', '2023-10-26', '06:35:04'),
(187, 2, '0954789782', 'SPINIX', 0.00, 3.60, 1018.30, 'Google Chrome', 'PC', 'NO', '2023-10-26', '06:35:05'),
(188, 2, '0954789782', 'SPINIX', 0.00, 0.00, 1018.30, 'Google Chrome', 'PC', 'NO', '2023-10-26', '06:35:07'),
(189, 6, '0951789155', 'DOGZILLA', 10.00, 0.00, 11103.26, 'Google Chrome', 'PC', 'NO', '2023-10-26', '07:27:16'),
(190, 6, '0951789155', 'DOGZILLA', 10.00, 0.00, 11083.26, 'Google Chrome', 'PC', 'NO', '2023-10-26', '07:29:03'),
(191, 6, '0951789155', 'DOGZILLA', 10.00, 0.00, 11063.26, 'Google Chrome', 'PC', 'NO', '2023-10-26', '07:30:35'),
(192, 6, '0951789155', 'DOGZILLA', 10.00, 0.00, 11053.26, 'Google Chrome', 'PC', 'NO', '2023-10-26', '07:32:00'),
(193, 6, '0951789155', 'DOGZILLA', 10.00, 12.00, 11043.26, 'Google Chrome', 'PC', 'NO', '2023-10-26', '08:00:40'),
(194, 6, '0951789155', 'DOGZILLA', 10.00, 28.20, 11045.26, 'Google Chrome', 'PC', 'NO', '2023-10-26', '08:01:16'),
(195, 6, '0951789155', 'DOGZILLA', 10.00, 28.20, 11063.46, 'Google Chrome', 'PC', 'NO', '2023-10-26', '08:02:34'),
(196, 6, '0951789155', 'DOGZILLA', 10.00, 50.00, 11081.66, 'Google Chrome', 'PC', 'NO', '2023-10-26', '08:03:28'),
(197, 6, '0951789155', 'DOGZILLA', 10.00, 16.20, 11101.66, 'Google Chrome', 'PC', 'NO', '2023-10-26', '08:09:44'),
(198, 6, '0951789155', 'DOGZILLA', 10.00, 21.80, 11057.86, 'Google Chrome', 'PC', 'NO', '2023-10-26', '08:12:33'),
(199, 6, '0951789155', 'DOGZILLA', 10.00, 12.00, 11039.66, 'Google Chrome', 'PC', 'NO', '2023-10-26', '08:42:27'),
(200, 6, '0951789155', 'DOGZILLA', 10.00, 16.20, 11041.66, 'Google Chrome', 'PC', 'NO', '2023-10-26', '08:43:02'),
(201, 6, '0951789155', 'DOGZILLA', 10.00, 21.80, 11027.86, 'Google Chrome', 'PC', 'NO', '2023-10-26', '08:46:02'),
(202, 6, '0951789155', 'DOGZILLA', 10.00, 12.00, 11019.66, 'Google Chrome', 'PC', 'NO', '2023-10-26', '08:48:13'),
(203, 6, '0951789155', 'DOGZILLA', 10.00, 12.00, 11021.66, 'Google Chrome', 'PC', 'NO', '2023-10-26', '08:48:55'),
(204, 6, '0951789155', 'DOGZILLA', 10.00, 12.00, 11023.66, 'Google Chrome', 'PC', 'NO', '2023-10-26', '09:04:48'),
(205, 6, '0951789155', 'DOGZILLA', 10.00, 16.20, 11025.66, 'Google Chrome', 'PC', 'NO', '2023-10-26', '09:05:37'),
(206, 6, '0951789155', 'DOGZILLA', 10.00, 21.80, 11031.86, 'Google Chrome', 'PC', 'NO', '2023-10-26', '09:17:52'),
(207, 6, '0951789155', 'DOGZILLA', 10.00, 12.00, 10973.66, 'Google Chrome', 'PC', 'NO', '2023-10-26', '09:21:40'),
(208, 6, '0951789155', 'DOGZILLA', 10.00, 12.00, 10855.66, 'Google Chrome', 'PC', 'NO', '2023-10-26', '11:05:12'),
(209, 5, '0990825942', 'EVOPLAY', 30.00, 0.00, 1339.40, 'Google Chrome', 'PC', '5330773563', '2023-10-26', '14:35:40'),
(210, 5, '0990825942', 'EVOPLAY', 30.00, 0.00, 1309.40, 'Google Chrome', 'PC', '5330773752', '2023-10-26', '14:35:46'),
(211, 5, '0990825942', 'EVOPLAY', 30.00, 0.00, 1279.40, 'Google Chrome', 'PC', '5330773874', '2023-10-26', '14:35:50'),
(212, 5, '0990825942', 'EVOPLAY', 30.00, 0.00, 1249.40, 'Google Chrome', 'PC', '5330773989', '2023-10-26', '14:35:54'),
(213, 5, '0990825942', 'EVOPLAY', 30.00, 48.00, 1267.40, 'Google Chrome', 'PC', '5330774111', '2023-10-26', '14:35:58'),
(214, 5, '0990825942', 'SIMPLEPLAY', 50.00, 0.00, 1217.40, 'Google Chrome', 'PC', '2634222', '2023-10-26', '14:55:09'),
(215, 5, '0990825942', 'SIMPLEPLAY', 0.00, 0.00, 1247.40, 'Google Chrome', 'PC', '2634223', '2023-10-26', '14:55:15'),
(216, 5, '0990825942', 'SIMPLEPLAY', 50.00, 0.00, 1197.40, 'Google Chrome', 'PC', '2634224', '2023-10-26', '14:55:16'),
(217, 5, '0990825942', 'SIMPLEPLAY', 50.00, 0.00, 1147.40, 'Google Chrome', 'PC', '2634226', '2023-10-26', '14:55:20'),
(218, 5, '0990825942', 'LIVE22', 2.50, 0.00, 1144.90, 'Google Chrome', 'PC', '2023-10-26 14:55:49', '2023-10-26', '14:55:49'),
(219, 5, '0990825942', 'LIVE22', 0.00, 0.00, 1144.90, 'Google Chrome', 'PC', '2023-10-26 14:55:50', '2023-10-26', '14:55:50'),
(220, 5, '0990825942', 'LIVE22', 2.50, 0.00, 1142.40, 'Google Chrome', 'PC', '2023-10-26 14:55:52', '2023-10-26', '14:55:53'),
(221, 5, '0990825942', 'LIVE22', 0.00, 0.00, 1142.40, 'Google Chrome', 'PC', '2023-10-26 14:55:53', '2023-10-26', '14:55:53'),
(222, 5, '0990825942', 'LIVE22', 2.50, 0.00, 1139.90, 'Google Chrome', 'PC', '2023-10-26 14:55:55', '2023-10-26', '14:55:55'),
(223, 5, '0990825942', 'LIVE22', 2.50, 0.70, 1138.10, 'Google Chrome', 'PC', '2023-10-26 14:55:58', '2023-10-26', '14:55:58'),
(224, 5, '0990825942', 'JILI', 1.60, 0.60, 1137.00, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:01:24'),
(225, 5, '0990825942', 'JILI', 2.00, 1.80, 1136.80, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:01:27'),
(226, 5, '0990825942', 'JILI', 3.80, 0.00, 1133.00, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:01:30'),
(227, 5, '0990825942', 'JILI', 3.60, 1.00, 1130.40, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:01:33'),
(228, 5, '0990825942', 'JILI', 3.40, 11.00, 1138.00, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:01:37'),
(229, 5, '0990825942', 'JILI', 3.00, 11.00, 1146.00, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:01:40'),
(230, 5, '0990825942', 'JILI', 3.80, 0.00, 1142.20, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:01:43'),
(231, 5, '0990825942', 'JILI', 3.40, 3.60, 1142.40, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:01:46'),
(232, 5, '0990825942', 'JILI', 3.60, 0.00, 1138.80, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:01:49'),
(233, 5, '0990825942', 'JILI', 3.60, 0.00, 1135.20, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:01:52'),
(234, 5, '0990825942', 'JILI', 3.40, 16.00, 1147.80, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:01:55'),
(235, 5, '0990825942', 'JILI', 3.00, 0.00, 1144.80, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:02:01'),
(236, 5, '0990825942', 'JILI', 2.80, 0.00, 1142.00, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:02:04'),
(237, 5, '0990825942', 'JILI', 4.60, 0.00, 1137.40, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:02:07'),
(238, 5, '0990825942', 'JILI', 3.20, 0.00, 1134.20, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:02:10'),
(239, 5, '0990825942', 'JILI', 3.80, 0.80, 1131.20, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:02:13'),
(240, 5, '0990825942', 'JILI', 3.60, 12.40, 1140.00, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:02:17'),
(241, 5, '0990825942', 'JILI', 3.40, 2.40, 1139.00, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:02:20'),
(242, 5, '0990825942', 'JILI', 3.60, 3.60, 1139.00, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:02:23'),
(243, 5, '0990825942', 'JILI', 3.60, 1.60, 1137.00, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:02:26'),
(244, 5, '0990825942', 'JILI', 3.40, 0.00, 1133.60, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:02:29'),
(245, 5, '0990825942', 'JILI', 3.80, 1.60, 1131.40, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:02:32'),
(246, 5, '0990825942', 'JILI', 3.60, 1.60, 1129.40, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:02:35'),
(247, 5, '0990825942', 'JILI', 3.40, 0.80, 1126.80, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:02:38'),
(248, 5, '0990825942', 'JILI', 3.40, 15.00, 1138.40, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:02:41'),
(249, 5, '0990825942', 'JILI', 3.60, 0.00, 1134.80, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:02:44'),
(250, 5, '0990825942', 'JILI', 3.40, 1.60, 1133.00, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:02:47'),
(251, 5, '0990825942', 'JILI', 3.80, 0.40, 1129.60, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:02:50'),
(252, 5, '0990825942', 'JILI', 3.60, 4.00, 1130.00, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:02:54'),
(253, 5, '0990825942', 'JILI', 3.60, 0.00, 1126.40, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:02:57'),
(254, 5, '0990825942', 'JILI', 3.20, 10.00, 1133.20, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:03:00'),
(255, 5, '0990825942', 'JILI', 3.80, 2.00, 1131.40, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:03:03'),
(256, 5, '0990825942', 'JILI', 3.00, 2.00, 1130.40, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:03:06'),
(257, 5, '0990825942', 'JILI', 2.20, 1.40, 1129.60, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:03:09'),
(258, 5, '0990825942', 'JILI', 3.40, 16.00, 1142.20, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:03:12'),
(259, 5, '0990825942', 'JILI', 3.60, 0.00, 1138.60, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:03:15'),
(260, 5, '0990825942', 'JILI', 3.60, 24.00, 1159.00, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:03:18'),
(261, 5, '0990825942', 'JILI', 3.60, 0.00, 1155.40, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:03:21'),
(262, 5, '0990825942', 'JILI', 3.60, 0.00, 1151.80, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:03:24'),
(263, 5, '0990825942', 'JILI', 3.60, 0.00, 1148.20, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:03:27'),
(264, 5, '0990825942', 'JILI', 3.60, 16.00, 1160.60, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:03:31'),
(265, 5, '0990825942', 'JILI', 3.40, 0.00, 1157.20, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:03:34'),
(266, 5, '0990825942', 'JILI', 3.20, 24.00, 1178.00, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:03:37'),
(267, 5, '0990825942', 'JILI', 3.40, 16.00, 1190.60, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:03:40'),
(268, 5, '0990825942', 'JILI', 3.60, 0.00, 1187.00, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:03:43'),
(269, 5, '0990825942', 'JILI', 3.80, 0.00, 1183.20, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:03:46'),
(270, 5, '0990825942', 'JILI', 3.60, 10.00, 1189.60, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:03:49'),
(271, 5, '0990825942', 'JILI', 3.80, 0.00, 1185.80, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:03:52'),
(272, 5, '0990825942', 'JILI', 3.60, 0.00, 1182.20, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:03:55'),
(273, 5, '0990825942', 'JILI', 3.40, 0.00, 1178.80, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:03:58'),
(274, 5, '0990825942', 'JILI', 2.40, 0.00, 1176.40, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:04:01'),
(275, 5, '0990825942', 'JILI', 0.60, 2.00, 1177.80, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:04:04'),
(276, 5, '0990825942', 'JILI', 3.40, 0.00, 1174.40, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:04:07'),
(277, 5, '0990825942', 'JILI', 3.60, 0.00, 1170.80, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:04:11'),
(278, 5, '0990825942', 'JILI', 3.20, 0.00, 1167.60, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:04:14'),
(279, 5, '0990825942', 'JILI', 3.60, 0.00, 1164.00, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:04:17'),
(280, 5, '0990825942', 'JILI', 3.20, 0.40, 1161.20, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:04:20'),
(281, 5, '0990825942', 'JILI', 3.60, 2.00, 1159.60, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:04:23'),
(282, 5, '0990825942', 'JILI', 3.40, 0.40, 1156.60, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:04:26'),
(283, 5, '0990825942', 'JILI', 3.60, 1.60, 1154.60, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:04:29'),
(284, 5, '0990825942', 'JILI', 3.20, 5.00, 1156.40, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:04:32'),
(285, 5, '0990825942', 'JILI', 3.80, 3.20, 1155.80, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:04:35'),
(286, 5, '0990825942', 'JILI', 2.60, 1.60, 1154.80, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:04:38'),
(287, 5, '0990825942', 'JILI', 3.80, 0.60, 1151.60, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:04:41'),
(288, 5, '0990825942', 'JILI', 3.20, 6.00, 1154.40, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:04:44'),
(289, 5, '0990825942', 'JILI', 3.00, 0.00, 1151.40, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:04:48'),
(290, 5, '0990825942', 'JILI', 3.40, 0.00, 1148.00, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:04:51'),
(291, 5, '0990825942', 'JILI', 3.60, 0.40, 1144.80, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:04:54'),
(292, 5, '0990825942', 'JILI', 3.60, 0.40, 1141.60, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:04:57'),
(293, 5, '0990825942', 'JILI', 3.20, 3.00, 1141.40, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:05:00'),
(294, 5, '0990825942', 'JILI', 2.00, 0.00, 1139.40, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:05:03'),
(295, 5, '0990825942', 'JILI', 0.60, 0.00, 1138.80, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:05:06'),
(296, 5, '0990825942', 'JILI', 3.60, 30.00, 1165.20, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:05:09'),
(297, 5, '0990825942', 'JILI', 3.60, 0.00, 1161.60, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:05:12'),
(298, 5, '0990825942', 'JILI', 3.60, 0.00, 1158.00, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:05:15'),
(299, 5, '0990825942', 'JILI', 3.60, 18.00, 1172.40, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:05:18'),
(300, 5, '0990825942', 'JILI', 3.40, 0.00, 1169.00, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:05:21'),
(301, 5, '0990825942', 'JILI', 3.40, 0.00, 1165.60, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:05:25'),
(302, 5, '0990825942', 'JILI', 3.40, 0.00, 1162.20, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:05:28'),
(303, 5, '0990825942', 'JILI', 3.40, 30.00, 1188.80, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:05:31'),
(304, 5, '0990825942', 'JILI', 3.00, 0.00, 1185.80, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:05:34'),
(305, 5, '0990825942', 'JILI', 3.60, 24.00, 1206.20, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:05:37'),
(306, 5, '0990825942', 'JILI', 2.60, 0.00, 1203.60, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:05:40'),
(307, 5, '0990825942', 'MANNA', 4.00, 0.00, 1204.40, 'Google Chrome', 'PC', '8ea81f04-bc5e-549f-85c1-e6b2a51d6605', '2023-10-26', '15:06:04'),
(308, 5, '0990825942', 'YGGDRASIL', 20.00, 0.00, 1184.40, 'Google Chrome', 'PC', '2310261509160200002', '2023-10-26', '15:09:17'),
(309, 5, '0990825942', 'YGGDRASIL', 20.00, 0.00, 1164.40, 'Google Chrome', 'PC', '2310261509210200001', '2023-10-26', '15:09:22'),
(310, 5, '0990825942', 'GAME', 0.00, 0.00, 1154.40, 'Google Chrome', 'PC', 'AIBQACAANHKOCJQAAAAABGA5GQ4BKAAAAAAA', '2023-10-26', '15:09:56'),
(311, 5, '0990825942', 'GAME', 0.00, 0.00, 1154.40, 'Google Chrome', 'PC', 'AIBQACAANHKOCJQAAAAAABYAAAAA', '2023-10-26', '15:09:56'),
(312, 5, '0990825942', 'GAME', 0.00, 0.00, 1144.40, 'Google Chrome', 'PC', 'AIBQACAANHKOCJQAAAAAB5JJGQ4BKAAAAAAA', '2023-10-26', '15:10:01'),
(313, 5, '0990825942', 'GAME', 0.00, 0.00, 1144.40, 'Google Chrome', 'PC', 'AIBQACAANHKOCJQAAAAAACAAAAAA', '2023-10-26', '15:10:01'),
(314, 5, '0990825942', 'GAME', 0.00, 0.00, 1134.40, 'Google Chrome', 'PC', 'AIBQACAANHKOCJQAAAAABHBTGQ4BKAAAAAAA', '2023-10-26', '15:10:05'),
(315, 5, '0990825942', 'GAME', 4.00, 0.00, 1138.40, 'Google Chrome', 'PC', 'AIBQACAANHKOCJQAAAAABHJTGQ4BKAAAAAAA', '2023-10-26', '15:10:05'),
(316, 5, '0990825942', 'GAME', 0.00, 0.00, 1138.40, 'Google Chrome', 'PC', 'AIBQACAANHKOCJQAAAAAACIAAAAA', '2023-10-26', '15:10:06'),
(317, 5, '0990825942', 'AMEBA', 0.75, 0.75, 1138.40, 'Google Chrome', 'PC', '8251999', '2023-10-26', '15:10:32'),
(318, 5, '0990825942', 'AMEBA', 0.75, 0.25, 1137.90, 'Google Chrome', 'PC', '8252000', '2023-10-26', '15:10:44'),
(319, 5, '0990825942', 'AMBSLOT2', 10.00, 0.40, 1128.30, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:11:19'),
(320, 5, '0990825942', 'AMBSLOT2', 10.00, 1.00, 1119.30, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:11:22'),
(321, 5, '0990825942', 'AMBSLOT2', 2.00, 0.00, 1117.30, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:11:30'),
(322, 5, '0990825942', 'AMBSLOT2', 2.00, 0.00, 1115.30, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:11:34'),
(323, 5, '0990825942', 'AMBSLOT2', 2.00, 0.40, 1113.70, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:11:36'),
(324, 5, '0990825942', 'AMBSLOT2', 2.00, 2.00, 1113.70, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:11:39'),
(325, 5, '0990825942', 'AMBSLOT2', 2.00, 0.00, 1111.70, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:11:42'),
(326, 5, '0990825942', 'AMBSLOT2', 2.00, 0.16, 1109.86, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:11:48'),
(327, 5, '0990825942', 'AMBSLOT2', 2.00, 0.20, 1108.06, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:11:51'),
(328, 5, '0990825942', 'NETENT2', 0.00, 0.00, 1058.06, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:12:53'),
(329, 5, '0990825942', 'NETENT2', 0.00, 0.00, 1008.06, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:12:58'),
(330, 5, '0990825942', 'NETENT2', 0.00, 0.00, 1003.06, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:13:07'),
(331, 5, '0990825942', 'NETENT2', 0.00, 0.00, 998.06, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:13:10'),
(332, 5, '0990825942', 'NETENT2', 0.00, 0.00, 993.06, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:13:14'),
(333, 5, '0990825942', 'NETENT2', 0.00, 0.00, 988.06, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:13:17'),
(334, 5, '0990825942', 'NETENT2', 0.00, 0.00, 983.06, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:13:19'),
(335, 5, '0990825942', 'NETENT2', 0.00, 0.00, 978.06, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:13:22'),
(336, 5, '0990825942', 'NETENT2', 0.00, 62.50, 1035.56, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:13:24'),
(337, 5, '0990825942', 'DRAGONGAMING', 0.00, 0.00, 1034.66, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:17:17'),
(338, 5, '0990825942', 'DRAGONGAMING', 0.00, 0.00, 1033.76, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:17:23'),
(339, 5, '0990825942', 'DRAGONGAMING', 0.00, 0.00, 1032.86, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:17:28'),
(340, 5, '0990825942', 'DRAGONGAMING', 0.00, 0.00, 1031.96, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:17:32'),
(341, 5, '0990825942', 'DRAGONGAMING', 0.00, 0.00, 1031.06, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:17:37'),
(342, 5, '0990825942', 'DRAGONGAMING', 0.00, 0.00, 1030.16, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:17:41'),
(343, 5, '0990825942', 'ACE333', 0.00, 0.00, 1020.16, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:18:35'),
(344, 5, '0990825942', 'ACE333', 0.00, 4.00, 1014.16, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:18:43'),
(345, 5, '0990825942', 'I8', 30.00, 15.00, 999.16, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:19:16'),
(346, 5, '0990825942', 'WMSLOT', 0.00, 0.00, 984.16, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:20:17'),
(347, 5, '0990825942', 'WMSLOT', 0.00, 0.00, 969.16, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:20:26'),
(348, 5, '0990825942', 'WMSLOT', 0.00, 0.00, 954.16, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:20:29'),
(349, 5, '0990825942', 'WMSLOT', 0.00, 0.00, 954.16, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:20:43'),
(350, 5, '0990825942', 'WMSLOT', 0.00, 0.00, 954.16, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:20:45'),
(351, 5, '0990825942', 'WMSLOT', 0.00, 0.00, 954.16, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:20:46'),
(352, 5, '0990825942', '918KISS', 0.00, 0.20, 953.46, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:21:19'),
(353, 5, '0990825942', '918KISS', 0.00, 2.50, 955.06, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:21:28'),
(354, 5, '0990825942', 'PRAGMATIC_SLOT', 0.00, 0.00, 945.06, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:22:14'),
(355, 5, '0990825942', 'PRAGMATIC_SLOT', 0.00, 0.00, 935.06, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:22:15'),
(356, 5, '0990825942', 'PRAGMATIC_SLOT', 0.00, 0.00, 925.06, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:22:20'),
(357, 5, '0990825942', 'PRAGMATIC_SLOT', 0.00, 0.00, 915.06, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:22:25'),
(358, 5, '0990825942', 'PRAGMATIC_SLOT', 0.00, 0.00, 905.06, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:22:30'),
(359, 5, '0990825942', 'PRAGMATIC_SLOT', 0.00, 24.50, 919.56, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:22:41'),
(360, 5, '0990825942', 'PRAGMATIC_SLOT', 0.00, 0.00, 919.56, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:22:43'),
(361, 5, '0990825942', 'S-RM01', 3.00, 0.00, 916.56, 'Google Chrome', 'PC', '20231026232402886178681', '2023-10-26', '15:24:03'),
(362, 5, '0990825942', 'S-RM01', 3.00, 0.00, 913.56, 'Google Chrome', 'PC', '20231026232405542178701', '2023-10-26', '15:24:05'),
(363, 5, '0990825942', 'S-RM01', 3.00, 0.00, 904.56, 'Google Chrome', 'PC', '20231026232413399178721', '2023-10-26', '15:24:13'),
(364, 5, '0990825942', 'S-RM01', 3.00, 0.00, 901.56, 'Google Chrome', 'PC', '20231026232416205178741', '2023-10-26', '15:24:16'),
(365, 5, '0990825942', 'HABANERO', -3.00, 0.00, 894.56, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:47:34'),
(366, 5, '0990825942', 'HABANERO', -3.00, 0.00, 894.56, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:47:39'),
(367, 5, '0990825942', 'HABANERO', -3.00, 0.00, 894.56, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:47:42'),
(368, 5, '0990825942', 'HABANERO', -3.00, 0.00, 894.56, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:47:49'),
(369, 5, '0990825942', 'HABANERO', -3.00, 0.00, 894.56, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:47:51'),
(370, 5, '0990825942', 'HABANERO', -3.00, 0.00, 894.56, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:47:54'),
(371, 5, '0990825942', 'HABANERO', -3.00, 0.00, 894.56, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:48:26'),
(372, 5, '0990825942', 'HABANERO', -3.00, 0.00, 894.56, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:48:33'),
(373, 5, '0990825942', 'HABANERO', -3.00, 0.00, 894.56, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:48:35'),
(374, 5, '0990825942', 'HABANERO', -3.00, 0.00, 894.56, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:48:38'),
(375, 5, '0990825942', 'HABANERO', -3.00, 0.00, 894.56, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:48:46'),
(376, 5, '0990825942', 'HABANERO', -3.00, 0.00, 894.56, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:48:51'),
(377, 5, '0990825942', 'HABANERO', -3.00, 0.00, 894.56, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:48:54'),
(378, 5, '0990825942', 'HABANERO', -3.00, 0.00, 894.56, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:50:03'),
(379, 5, '0990825942', 'HABANERO', -3.00, 0.00, 894.56, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:50:06'),
(380, 5, '0990825942', 'HABANERO', -3.00, 0.00, 894.56, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:50:08'),
(381, 5, '0990825942', 'HABANERO', -3.00, 0.00, 894.56, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:50:10'),
(382, 5, '0990825942', 'HABANERO', -3.00, 0.00, 894.56, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:56:30'),
(383, 5, '0990825942', 'HABANERO', -3.00, 0.00, 894.56, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:56:37'),
(384, 5, '0990825942', 'HABANERO', -3.00, 0.00, 894.56, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:57:11'),
(385, 5, '0990825942', 'HABANERO', -3.00, 0.00, 894.56, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:57:26'),
(386, 5, '0990825942', 'HABANERO', -3.00, 0.00, 894.56, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:57:29'),
(387, 5, '0990825942', 'HABANERO', -3.00, 0.00, 894.56, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:57:47'),
(388, 5, '0990825942', 'HABANERO', -3.00, 0.00, 894.56, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:57:50'),
(389, 5, '0990825942', 'HABANERO', -3.00, 0.00, 894.56, 'Google Chrome', 'PC', 'NO', '2023-10-26', '15:58:27'),
(390, 5, '0990825942', 'HABANERO', -3.00, 0.00, 897.56, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:00:49'),
(391, 5, '0990825942', 'HABANERO', -3.00, 0.00, 897.56, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:00:53'),
(392, 5, '0990825942', 'HABANERO', -3.00, 0.00, 897.56, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:00:56'),
(393, 5, '0990825942', 'HABANERO', -3.75, 0.00, 897.56, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:01:17'),
(394, 5, '0990825942', 'HABANERO', -3.75, 0.00, 897.56, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:04:46'),
(395, 5, '0990825942', 'HABANERO', -3.75, 0.00, 897.56, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:04:54'),
(396, 5, '0990825942', 'HABANERO', -3.75, 0.45, 894.26, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:18:48'),
(397, 5, '0990825942', 'HABANERO', -3.75, 0.00, 890.51, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:18:55'),
(398, 5, '0990825942', 'HABANERO', -3.75, 3.45, 890.21, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:18:59'),
(399, 5, '0990825942', 'GAME', 0.00, 0.00, 870.21, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAABZZTEASAGAAAAAAA', '2023-10-26', '16:19:42'),
(400, 5, '0990825942', 'GAME', 10.00, 0.00, 880.21, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAB2BTEASAGAAAAAAA', '2023-10-26', '16:19:42'),
(401, 5, '0990825942', 'GAME', 0.00, 0.00, 880.21, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAAHQAAAAA', '2023-10-26', '16:19:43'),
(402, 5, '0990825942', 'GAME', 0.00, 0.00, 860.21, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAABMKDEASAGAAAAAAA', '2023-10-26', '16:19:48'),
(403, 5, '0990825942', 'GAME', 0.00, 0.00, 860.21, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAAHYAAAAA', '2023-10-26', '16:19:48'),
(404, 5, '0990825942', 'GAME', 0.00, 0.00, 857.71, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAA3KVEASAGAAAAAAA', '2023-10-26', '16:19:54'),
(405, 5, '0990825942', 'GAME', 1.25, 0.00, 858.96, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAA3SVEASAGAAAAAAA', '2023-10-26', '16:19:54'),
(406, 5, '0990825942', 'GAME', 0.00, 0.00, 858.96, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAAIAAAAAA', '2023-10-26', '16:19:55'),
(407, 5, '0990825942', 'GAME', 0.00, 0.00, 856.46, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAABJ3GEASAGAAAAAAA', '2023-10-26', '16:20:00'),
(408, 5, '0990825942', 'GAME', 0.00, 0.00, 856.46, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAAIIAAAAA', '2023-10-26', '16:20:00'),
(409, 5, '0990825942', 'GAME', 0.00, 0.00, 853.96, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAAPDQEASAGAAAAAAA', '2023-10-26', '16:20:04'),
(410, 5, '0990825942', 'GAME', 0.00, 0.00, 853.96, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAAIQAAAAA', '2023-10-26', '16:20:04'),
(411, 5, '0990825942', 'GAME', 0.00, 0.00, 851.46, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAAC33EASAGAAAAAAA', '2023-10-26', '16:20:08'),
(412, 5, '0990825942', 'GAME', 1.25, 0.00, 852.71, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAAOT3EASAGAAAAAAA', '2023-10-26', '16:20:08'),
(413, 5, '0990825942', 'GAME', 0.00, 0.00, 852.71, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAAIYAAAAA', '2023-10-26', '16:20:08'),
(414, 2, '0954789782', 'SLOTXO', 2.50, 0.00, 1015.50, 'Google Chrome', 'PC', 'xeri4bo89h4mh', '2023-10-26', '16:22:58'),
(415, 2, '0954789782', 'CQ9V2', 0.00, 216.00, 1230.74, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:23:53'),
(416, 2, '0954789782', 'ACE333', 0.00, 0.00, 1228.24, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:27:25'),
(417, 5, '0990825942', 'JILI', 2.00, 0.00, 850.71, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:32:45'),
(418, 6, '0951789155', 'DOGZILLA', 10.00, 21.80, 10648.00, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:33:20'),
(419, 5, '0990825942', 'JILI', 2.00, 1.00, 849.71, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:33:22'),
(420, 2, '0954789782', 'JILI', 0.10, 0.00, 1228.14, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:33:25'),
(421, 5, '0990825942', 'JILI', 3.60, 2.00, 848.11, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:33:25'),
(422, 2, '0954789782', 'JILI', 0.90, 5.50, 1232.74, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:33:28'),
(423, 5, '0990825942', 'JILI', 3.80, 0.00, 844.31, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:33:29'),
(424, 5, '0990825942', 'JILI', 3.60, 11.00, 851.71, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:33:32'),
(425, 5, '0990825942', 'JILI', 3.00, 1.80, 850.51, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:33:35'),
(426, 5, '0990825942', 'JILI', 3.40, 4.00, 851.11, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:33:38'),
(427, 2, '0954789782', 'JILI', 1.20, 0.00, 1231.54, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:33:41'),
(428, 5, '0990825942', 'JILI', 3.60, 0.00, 847.51, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:33:41'),
(429, 2, '0954789782', 'JILI', 1.30, 0.00, 1230.24, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:33:44'),
(430, 5, '0990825942', 'JILI', 3.60, 0.00, 843.91, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:33:44');
INSERT INTO `repostgame` (`id`, `iduser`, `username`, `gameid`, `bet`, `win`, `balance_credit`, `get_browser`, `platform`, `trans_id`, `created_atdate`, `created_attime`) VALUES
(431, 2, '0954789782', 'JILI', 1.70, 0.00, 1228.54, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:33:47'),
(432, 5, '0990825942', 'JILI', 3.60, 0.00, 840.31, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:33:47'),
(433, 2, '0954789782', 'JILI', 1.00, 0.00, 1227.54, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:33:50'),
(434, 5, '0990825942', 'JILI', 3.40, 0.40, 837.31, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:33:50'),
(435, 2, '0954789782', 'JILI', 0.40, 0.00, 1227.14, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:33:54'),
(436, 5, '0990825942', 'JILI', 3.40, 11.20, 845.11, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:33:54'),
(437, 2, '0954789782', 'JILI', 1.20, 2.80, 1228.74, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:33:57'),
(438, 5, '0990825942', 'JILI', 2.40, 8.00, 850.71, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:33:57'),
(439, 2, '0954789782', 'JILI', 0.30, 0.00, 1228.44, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:34:00'),
(440, 5, '0990825942', 'JILI', 4.00, 3.60, 850.31, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:34:00'),
(441, 2, '0954789782', 'JILI', 1.80, 0.00, 1226.64, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:34:03'),
(442, 5, '0990825942', 'JILI', 3.20, 2.40, 849.51, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:34:03'),
(443, 2, '0954789782', 'JILI', 1.70, 0.00, 1224.94, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:34:06'),
(444, 5, '0990825942', 'JILI', 3.60, 9.00, 854.91, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:34:06'),
(445, 2, '0954789782', 'JILI', 1.60, 0.00, 1223.34, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:34:09'),
(446, 5, '0990825942', 'JILI', 3.60, 11.00, 862.31, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:34:09'),
(447, 5, '0990825942', 'JILI', 3.80, 1.60, 860.11, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:34:13'),
(448, 5, '0990825942', 'JILI', 3.40, 0.00, 856.71, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:34:16'),
(449, 2, '0954789782', 'JILI', 1.80, 0.00, 1221.54, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:34:19'),
(450, 5, '0990825942', 'JILI', 3.60, 2.40, 855.51, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:34:19'),
(451, 2, '0954789782', 'JILI', 1.70, 2.50, 1222.34, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:34:22'),
(452, 5, '0990825942', 'JILI', 3.60, 1.60, 853.51, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:34:22'),
(453, 5, '0990825942', 'JILI', 3.80, 1.60, 851.31, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:34:25'),
(454, 2, '0954789782', 'JILI', 0.30, 2.00, 1224.04, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:34:28'),
(455, 5, '0990825942', 'JILI', 3.40, 0.00, 847.91, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:34:28'),
(456, 5, '0990825942', 'JILI', 3.60, 3.20, 847.51, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:34:31'),
(457, 2, '0954789782', 'JILI', 0.90, 0.00, 1223.14, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:34:34'),
(458, 5, '0990825942', 'JILI', 3.80, 4.20, 847.91, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:34:34'),
(459, 2, '0954789782', 'JILI', 1.90, 0.00, 1221.24, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:34:38'),
(460, 5, '0990825942', 'JILI', 3.40, 0.60, 845.11, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:34:38'),
(461, 2, '0954789782', 'JILI', 1.80, 0.00, 1219.44, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:34:41'),
(462, 5, '0990825942', 'JILI', 3.60, 4.60, 846.11, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:34:41'),
(463, 2, '0954789782', 'JILI', 0.10, 0.00, 1219.34, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:34:44'),
(464, 5, '0990825942', 'JILI', 2.80, 0.00, 843.31, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:34:44'),
(465, 2, '0954789782', 'JILI', 1.40, 0.00, 1217.94, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:34:50'),
(466, 5, '0990825942', 'JILI', 2.80, 0.00, 840.51, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:34:50'),
(467, 2, '0954789782', 'JILI', 1.90, 8.00, 1224.04, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:34:53'),
(468, 5, '0990825942', 'JILI', 3.60, 0.00, 836.91, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:34:53'),
(469, 5, '0990825942', 'JILI', 3.40, 0.00, 833.51, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:34:56'),
(470, 2, '0954789782', 'JILI', 1.90, 0.00, 1222.14, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:34:56'),
(471, 2, '0954789782', 'JILI', 1.80, 12.00, 1232.34, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:35:00'),
(472, 5, '0990825942', 'JILI', 3.60, 24.00, 853.91, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:35:00'),
(473, 2, '0954789782', 'JILI', 1.80, 0.00, 1230.54, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:35:03'),
(474, 5, '0990825942', 'JILI', 3.60, 24.00, 874.31, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:35:03'),
(475, 2, '0954789782', 'JILI', 1.90, 0.00, 1228.64, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:35:06'),
(476, 5, '0990825942', 'JILI', 3.60, 0.00, 870.71, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:35:06'),
(477, 2, '0954789782', 'JILI', 1.90, 10.00, 1236.74, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:35:09'),
(478, 5, '0990825942', 'JILI', 3.80, 0.00, 866.91, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:35:09'),
(479, 2, '0954789782', 'JILI', 1.80, 5.00, 1239.94, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:35:12'),
(480, 5, '0990825942', 'JILI', 3.80, 0.00, 863.11, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:35:12'),
(481, 2, '0954789782', 'JILI', 1.70, 0.00, 1238.24, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:35:15'),
(482, 5, '0990825942', 'JILI', 3.80, 0.00, 859.31, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:35:15'),
(483, 2, '0954789782', 'JILI', 1.70, 0.00, 1236.54, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:35:19'),
(484, 5, '0990825942', 'JILI', 3.60, 0.00, 855.71, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:35:19'),
(485, 2, '0954789782', 'JILI', 1.80, 0.00, 1234.74, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:35:22'),
(486, 5, '0990825942', 'JILI', 3.60, 0.00, 852.11, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:35:22'),
(487, 2, '0954789782', 'JILI', 1.80, 0.00, 1232.94, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:35:25'),
(488, 5, '0990825942', 'JILI', 3.60, 0.00, 848.51, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:35:25'),
(489, 2, '0954789782', 'JILI', 1.90, 0.00, 1231.04, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:35:28'),
(490, 5, '0990825942', 'JILI', 3.60, 20.00, 864.91, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:35:28'),
(491, 2, '0954789782', 'JILI', 1.90, 0.00, 1229.14, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:35:31'),
(492, 5, '0990825942', 'JILI', 3.80, 36.00, 897.11, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:35:31'),
(493, 5, '0990825942', 'JILI', 3.60, 0.00, 893.51, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:35:34'),
(494, 2, '0954789782', 'JILI', 1.90, 0.00, 1227.24, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:35:34'),
(495, 2, '0954789782', 'JILI', 1.90, 0.00, 1225.34, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:35:38'),
(496, 5, '0990825942', 'JILI', 3.40, 16.00, 906.11, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:35:38'),
(497, 2, '0954789782', 'JILI', 1.70, 0.00, 1223.64, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:35:41'),
(498, 5, '0990825942', 'JILI', 3.40, 0.00, 902.71, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:35:41'),
(499, 2, '0954789782', 'JILI', 0.80, 10.00, 1232.84, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:35:44'),
(500, 5, '0990825942', 'JILI', 2.00, 0.00, 900.71, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:35:44'),
(501, 5, '0990825942', 'JILI', 1.80, 1.40, 900.31, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:35:47'),
(502, 5, '0990825942', 'JILI', 3.60, 4.40, 901.11, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:35:50'),
(503, 5, '0990825942', 'JILI', 3.80, 6.00, 903.31, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:35:53'),
(504, 5, '0990825942', 'JILI', 3.40, 0.80, 900.71, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:35:56'),
(505, 5, '0990825942', 'JILI', 2.20, 11.00, 909.51, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:35:59'),
(506, 5, '0990825942', 'JILI', 3.20, 0.00, 906.31, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:36:02'),
(507, 5, '0990825942', 'JILI', 3.60, 0.00, 902.71, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:36:06'),
(508, 5, '0990825942', 'JILI', 3.40, 10.00, 909.31, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:36:09'),
(509, 5, '0990825942', 'JILI', 3.40, 4.60, 910.51, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:36:12'),
(510, 5, '0990825942', 'JILI', 3.80, 0.00, 906.71, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:36:15'),
(511, 5, '0990825942', 'JILI', 3.40, 5.80, 909.11, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:36:18'),
(512, 5, '0990825942', 'JILI', 3.80, 2.00, 907.31, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:36:21'),
(513, 5, '0990825942', 'JILI', 3.40, 7.20, 911.11, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:36:24'),
(514, 5, '0990825942', 'JILI', 3.40, 3.80, 911.51, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:36:27'),
(515, 5, '0990825942', 'JILI', 3.60, 0.00, 907.91, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:36:30'),
(516, 5, '0990825942', 'JILI', 3.60, 0.00, 904.31, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:36:33'),
(517, 5, '0990825942', 'JILI', 3.40, 7.40, 908.31, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:36:36'),
(518, 5, '0990825942', 'JILI', 4.00, 0.00, 904.31, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:36:39'),
(519, 5, '0990825942', 'JILI', 3.40, 0.60, 901.51, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:36:43'),
(520, 5, '0990825942', 'JILI', 1.20, 11.00, 911.31, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:36:46'),
(521, 5, '0990825942', 'JILI', 1.00, 0.00, 910.31, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:36:49'),
(522, 5, '0990825942', 'JILI', 3.80, 0.00, 906.51, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:36:52'),
(523, 5, '0990825942', 'JILI', 3.60, 0.00, 902.91, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:36:55'),
(524, 5, '0990825942', 'JILI', 3.60, 0.00, 899.31, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:36:58'),
(525, 5, '0990825942', 'JILI', 3.60, 0.00, 895.71, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:37:01'),
(526, 5, '0990825942', 'JILI', 3.60, 0.00, 892.11, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:37:04'),
(527, 5, '0990825942', 'JILI', 3.40, 0.00, 888.71, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:37:07'),
(528, 5, '0990825942', 'JILI', 3.40, 0.00, 885.31, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:37:10'),
(529, 5, '0990825942', 'JILI', 3.60, 0.00, 881.71, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:37:13'),
(530, 5, '0990825942', 'JILI', 2.80, 0.00, 878.91, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:37:17'),
(531, 5, '0990825942', 'JILI', 3.60, 0.00, 875.31, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:37:20'),
(532, 5, '0990825942', 'JILI', 3.60, 24.00, 895.71, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:37:23'),
(533, 5, '0990825942', 'JILI', 3.60, 0.00, 892.11, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:37:26'),
(534, 5, '0990825942', 'JILI', 3.60, 0.00, 888.51, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:37:29'),
(535, 5, '0990825942', 'JILI', 3.40, 0.00, 885.11, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:37:32'),
(536, 5, '0990825942', 'JILI', 3.60, 0.00, 881.51, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:37:35'),
(537, 5, '0990825942', 'JILI', 3.40, 0.00, 878.11, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:37:38'),
(538, 5, '0990825942', 'JILI', 3.40, 12.00, 886.71, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:37:41'),
(539, 5, '0990825942', 'JILI', 3.60, 0.00, 883.11, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:37:44'),
(540, 5, '0990825942', 'JILI', 0.60, 2.40, 884.91, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:37:47'),
(541, 5, '0990825942', 'JILI', 1.20, 0.00, 883.71, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:37:50'),
(542, 5, '0990825942', 'JILI', 3.60, 0.00, 880.11, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:37:54'),
(543, 5, '0990825942', 'JILI', 3.20, 0.00, 876.91, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:37:57'),
(544, 2, '0954789782', 'GAME', 0.00, 0.00, 1231.84, 'Google Chrome', 'PC', 'AIBQAAQAAB4DUJQAAAAAAGJSFQSAGAAAAAAA', '2023-10-26', '16:37:57'),
(545, 5, '0990825942', 'JILI', 3.80, 2.00, 875.11, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:38:00'),
(546, 2, '0954789782', 'GAME', 0.00, 0.00, 1231.84, 'Google Chrome', 'PC', 'AIBQAAQAAB4DUJQAAAAAAAIAAAAA', '2023-10-26', '16:38:02'),
(547, 5, '0990825942', 'JILI', 3.40, 2.40, 874.11, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:38:03'),
(548, 5, '0990825942', 'JILI', 3.60, 2.00, 872.51, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:38:06'),
(549, 2, '0954789782', 'GAME', 0.00, 0.00, 1230.84, 'Google Chrome', 'PC', 'AIBQAAQAAB4DUJQAAAAAAHSRFQSAGAAAAAAA', '2023-10-26', '16:38:08'),
(550, 5, '0990825942', 'JILI', 3.60, 1.40, 870.31, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:38:09'),
(551, 5, '0990825942', 'JILI', 3.60, 0.00, 866.71, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:38:12'),
(552, 5, '0990825942', 'JILI', 3.20, 6.00, 869.51, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:38:15'),
(553, 2, '0954789782', 'GAME', 0.00, 0.00, 1230.84, 'Google Chrome', 'PC', 'AIBQAAQAAB4DUJQAAAAAAAQAAAAA', '2023-10-26', '16:38:18'),
(554, 5, '0990825942', 'JILI', 3.40, 0.80, 866.91, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:38:18'),
(555, 5, '0990825942', 'JILI', 3.80, 2.40, 865.51, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:38:21'),
(556, 5, '0990825942', 'JILI', 3.60, 0.80, 862.71, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:38:24'),
(557, 5, '0990825942', 'JILI', 3.60, 0.80, 859.91, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:38:27'),
(558, 5, '0990825942', 'JILI', 3.40, 0.80, 857.31, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:38:31'),
(559, 5, '0990825942', 'JILI', 3.60, 0.00, 853.71, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:38:34'),
(560, 5, '0990825942', 'JILI', 3.40, 3.00, 853.31, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:38:37'),
(561, 5, '0990825942', 'JILI', 3.00, 0.00, 850.31, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:38:40'),
(562, 5, '0990825942', 'JILI', 2.40, 0.00, 847.91, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:38:46'),
(563, 5, '0990825942', 'JILI', 3.80, 0.00, 844.11, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:38:49'),
(564, 5, '0990825942', 'JILI', 3.40, 0.00, 840.71, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:38:52'),
(565, 5, '0990825942', 'JILI', 3.40, 0.00, 837.31, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:38:55'),
(566, 5, '0990825942', 'JILI', 1.20, 37.00, 873.11, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:38:58'),
(567, 5, '0990825942', 'JILI', 1.20, 0.00, 871.91, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:39:01'),
(568, 5, '0990825942', 'JILI', 3.80, 11.00, 879.11, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:39:04'),
(569, 5, '0990825942', 'JILI', 0.40, 1.00, 879.71, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:39:10'),
(570, 5, '0990825942', 'JILI', 0.20, 0.00, 879.51, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:39:14'),
(571, 5, '0990825942', 'JILI', 0.60, 0.80, 879.71, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:39:17'),
(572, 2, '0954789782', 'AMBSLOT2', 1.00, 0.00, 1229.84, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:40:59'),
(573, 2, '0954789782', 'AMBSLOT2', 1.00, 1.50, 1230.34, 'Google Chrome', 'PC', 'NO', '2023-10-26', '16:41:02'),
(574, 2, '0954789782', 'JILI', 0.80, 0.00, 1126.54, 'Google Chrome', 'PC', 'NO', '2023-10-26', '18:17:21'),
(575, 2, '0954789782', 'JILI', 1.60, 0.00, 1124.94, 'Google Chrome', 'PC', 'NO', '2023-10-26', '18:17:30'),
(576, 2, '0954789782', 'JILI', 1.60, 0.00, 1123.34, 'Google Chrome', 'PC', 'NO', '2023-10-26', '18:17:33'),
(577, 2, '0954789782', 'JILI', 0.90, 5.50, 1127.94, 'Google Chrome', 'PC', 'NO', '2023-10-26', '18:17:36'),
(578, 2, '0954789782', 'PGSOFT2', 1.00, 0.10, 1127.04, 'Google Chrome', 'PC', 'NO', '2023-10-26', '18:19:41'),
(579, 2, '0954789782', 'PGSOFT2', 0.00, 0.00, 1127.04, 'Google Chrome', 'PC', 'NO', '2023-10-26', '18:19:45'),
(580, 2, '0954789782', 'PGSOFT2', 1.00, 0.50, 1126.54, 'Google Chrome', 'PC', 'NO', '2023-10-26', '18:19:50'),
(581, 2, '0954789782', 'PGSOFT2', 0.00, 0.00, 1126.54, 'Google Chrome', 'PC', 'NO', '2023-10-26', '18:19:53'),
(582, 2, '0954789782', 'PGSOFT2', 1.00, 0.30, 1125.84, 'Google Chrome', 'PC', 'NO', '2023-10-26', '18:19:56'),
(583, 2, '0954789782', 'PGSOFT2', 0.00, 0.00, 1125.84, 'Google Chrome', 'PC', 'NO', '2023-10-26', '18:20:00'),
(584, 2, '0954789782', 'PGSOFT2', 1.00, 0.00, 1124.84, 'Google Chrome', 'PC', 'NO', '2023-10-26', '18:20:05'),
(585, 2, '0954789782', 'PGSOFT2', 1.00, 0.00, 1123.84, 'Google Chrome', 'PC', 'NO', '2023-10-26', '18:20:09'),
(586, 2, '0954789782', 'PGSOFT2', 1.00, 0.00, 1122.84, 'Google Chrome', 'PC', 'NO', '2023-10-26', '18:20:12'),
(587, 2, '0954789782', 'PGSOFT2', 1.00, 0.25, 1122.09, 'Google Chrome', 'PC', 'NO', '2023-10-26', '18:20:15'),
(588, 2, '0954789782', 'PGSOFT2', 0.00, 0.00, 1122.09, 'Google Chrome', 'PC', 'NO', '2023-10-26', '18:20:17'),
(589, 2, '0954789782', 'PGSOFT2', 1.00, 0.00, 1121.09, 'Google Chrome', 'PC', 'NO', '2023-10-26', '18:20:28'),
(590, 2, '0954789782', 'PGSOFT2', 1.00, 0.00, 1120.09, 'Google Chrome', 'PC', 'NO', '2023-10-26', '18:20:29'),
(591, 2, '0954789782', 'PGSOFT2', 1.00, 0.00, 1119.09, 'Google Chrome', 'PC', 'NO', '2023-10-26', '18:20:37'),
(592, 2, '0954789782', 'PGSOFT2', 1.00, 0.00, 1118.09, 'Google Chrome', 'PC', 'NO', '2023-10-26', '18:20:43'),
(593, 2, '0954789782', 'PGSOFT2', 1.00, 0.00, 1117.09, 'Google Chrome', 'PC', 'NO', '2023-10-26', '18:20:45'),
(594, 2, '0954789782', 'PGSOFT2', 1.00, 0.00, 1116.09, 'Google Chrome', 'PC', 'NO', '2023-10-26', '18:20:48'),
(595, 2, '0954789782', 'PGSOFT2', 1.00, 0.90, 1115.99, 'Google Chrome', 'PC', 'NO', '2023-10-26', '18:20:50'),
(596, 2, '0954789782', 'PGSOFT2', 0.00, 4.00, 1119.99, 'Google Chrome', 'PC', 'NO', '2023-10-26', '18:20:52'),
(597, 2, '0954789782', 'PGSOFT2', 0.00, 0.00, 1119.99, 'Google Chrome', 'PC', 'NO', '2023-10-26', '18:20:56'),
(598, 6, '0951789155', 'DOGZILLA', 20.00, 88.00, 10479.80, 'Google Chrome', 'PC', 'NO', '2023-10-26', '18:38:25'),
(599, 7, '0822936915', 'DOGZILLA', 10.00, 44.00, 960.00, 'Google Chrome', 'Mobile', 'NO', '2023-10-26', '18:51:48'),
(600, 7, '0822936915', 'DOGZILLA', 10.00, 21.80, 944.00, 'Google Chrome', 'Mobile', 'NO', '2023-10-26', '18:56:40'),
(601, 7, '0822936915', 'DOGZILLA', 5.00, 0.00, 960.80, 'Google Chrome', 'Mobile', 'NO', '2023-10-26', '18:58:20'),
(602, 7, '0822936915', 'DOGZILLA', 5.00, 0.00, 955.80, 'Google Chrome', 'Mobile', 'NO', '2023-10-26', '18:59:27'),
(603, 7, '0822936915', 'DOGZILLA', 5.00, 9.00, 959.80, 'Google Chrome', 'Mobile', 'NO', '2023-10-26', '19:02:08'),
(604, 7, '0822936915', 'DOGZILLA', 4.50, 1.80, 957.10, 'Google Chrome', 'Mobile', 'NO', '2023-10-26', '19:02:40'),
(605, 7, '0822936915', 'DOGZILLA', 4.50, 49.05, 1001.65, 'Google Chrome', 'Mobile', 'NO', '2023-10-26', '19:02:47'),
(606, 7, '0822936915', 'DOGZILLA', 4.50, 3.75, 1000.90, 'Google Chrome', 'Mobile', 'NO', '2023-10-26', '19:02:54'),
(607, 7, '0822936915', 'DOGZILLA', 4.50, 0.00, 996.40, 'Google Chrome', 'Mobile', 'NO', '2023-10-26', '19:03:03'),
(608, 7, '0822936915', 'DOGZILLA', 4.50, 2.25, 994.15, 'Google Chrome', 'Mobile', 'NO', '2023-10-26', '19:03:09'),
(609, 7, '0822936915', 'DOGZILLA', 4.50, 0.00, 989.65, 'Google Chrome', 'Mobile', 'NO', '2023-10-26', '19:03:16'),
(610, 7, '0822936915', 'DOGZILLA', 4.50, 56.40, 1041.55, 'Google Chrome', 'Mobile', 'NO', '2023-10-26', '19:03:20'),
(611, 7, '0822936915', 'DOGZILLA', 4.50, 0.00, 1037.05, 'Google Chrome', 'Mobile', 'NO', '2023-10-26', '19:03:28'),
(612, 7, '0822936915', 'DOGZILLA', 4.50, 3.00, 1035.55, 'Google Chrome', 'Mobile', 'NO', '2023-10-26', '19:03:33'),
(613, 7, '0822936915', 'DOGZILLA', 4.50, 17.25, 1048.30, 'Google Chrome', 'Mobile', 'NO', '2023-10-26', '19:03:40'),
(614, 7, '0822936915', 'DOGZILLA', 4.50, 2.70, 1046.50, 'Google Chrome', 'Mobile', 'NO', '2023-10-26', '19:03:47'),
(615, 7, '0822936915', 'DOGZILLA', 4.50, 0.45, 1042.45, 'Google Chrome', 'Mobile', 'NO', '2023-10-26', '19:03:52'),
(616, 7, '0822936915', 'DOGZILLA', 4.50, 0.00, 1037.95, 'Google Chrome', 'Mobile', 'NO', '2023-10-26', '19:03:58'),
(617, 7, '0822936915', 'DOGZILLA', 4.50, 0.00, 1033.45, 'Google Chrome', 'Mobile', 'NO', '2023-10-26', '19:04:02'),
(618, 7, '0822936915', 'DOGZILLA', 4.50, 0.00, 1028.95, 'Google Chrome', 'Mobile', 'NO', '2023-10-26', '19:04:06'),
(619, 7, '0822936915', 'DOGZILLA', 4.50, 0.00, 1024.45, 'Google Chrome', 'Mobile', 'NO', '2023-10-26', '19:04:10'),
(620, 7, '0822936915', 'DOGZILLA', 4.50, 0.00, 1019.95, 'Google Chrome', 'Mobile', 'NO', '2023-10-26', '19:04:15'),
(621, 7, '0822936915', 'DOGZILLA', 4.50, 2.25, 1017.70, 'Google Chrome', 'Mobile', 'NO', '2023-10-26', '19:04:19'),
(622, 7, '0822936915', 'DOGZILLA', 4.50, 0.45, 1013.65, 'Google Chrome', 'Mobile', 'NO', '2023-10-26', '19:04:28'),
(623, 7, '0822936915', 'DOGZILLA', 4.50, 0.00, 1009.15, 'Google Chrome', 'Mobile', 'NO', '2023-10-26', '19:04:34'),
(624, 7, '0822936915', 'DOGZILLA', 4.50, 0.00, 1004.65, 'Google Chrome', 'Mobile', 'NO', '2023-10-26', '19:04:38'),
(625, 7, '0822936915', 'DOGZILLA', 4.50, 2.70, 1002.85, 'Google Chrome', 'Mobile', 'NO', '2023-10-26', '19:04:42'),
(626, 5, '0990825942', 'CQ9V2', 0.00, 4320.00, 5184.51, 'Google Chrome', 'PC', 'NO', '2023-10-27', '02:58:23'),
(627, 5, '0990825942', 'CQ9V2', 0.00, 0.00, 5169.31, 'Google Chrome', 'PC', 'NO', '2023-10-27', '02:58:29'),
(628, 5, '0990825942', 'CQ9V2', 0.00, 0.00, 5154.11, 'Google Chrome', 'PC', 'NO', '2023-10-27', '02:58:34'),
(629, 5, '0990825942', 'CQ9V2', 0.00, 0.00, 5138.91, 'Google Chrome', 'PC', 'NO', '2023-10-27', '02:58:37'),
(630, 5, '0990825942', 'CQ9V2', 0.00, 0.00, 5123.71, 'Google Chrome', 'PC', 'NO', '2023-10-27', '03:00:07'),
(631, 5, '0990825942', 'CQ9V2', 0.00, 6.00, 5114.51, 'Google Chrome', 'PC', 'NO', '2023-10-27', '03:00:14'),
(632, 5, '0990825942', 'CQ9V2', 0.00, 4320.00, 9419.31, 'Google Chrome', 'PC', 'NO', '2023-10-27', '03:18:43'),
(633, 5, '0990825942', 'CQ9V2', 0.00, 0.00, 9404.11, 'Google Chrome', 'PC', 'NO', '2023-10-27', '03:18:48'),
(634, 5, '0990825942', 'CQ9V2', 0.00, 0.00, 9388.91, 'Google Chrome', 'PC', 'NO', '2023-10-27', '03:18:51'),
(635, 5, '0990825942', 'CQ9V2', 0.00, 0.00, 9373.71, 'Google Chrome', 'PC', 'NO', '2023-10-27', '03:18:55'),
(636, 5, '0990825942', 'CQ9V2', 0.00, 0.00, 9358.51, 'Google Chrome', 'PC', 'NO', '2023-10-27', '03:18:58'),
(637, 5, '0990825942', 'CQ9V2', 0.00, 6.00, 9349.31, 'Google Chrome', 'PC', 'NO', '2023-10-27', '03:19:04'),
(638, 5, '0990825942', 'CQ9V2', 0.00, 0.00, 9334.11, 'Google Chrome', 'PC', 'NO', '2023-10-27', '03:19:08'),
(639, 5, '0990825942', 'CQ9V2', 0.00, 684.00, 9994.11, 'Google Chrome', 'PC', 'NO', '2023-10-27', '03:19:48'),
(640, 5, '0990825942', 'CQ9V2', 0.00, 7866.00, 17836.11, 'Google Chrome', 'PC', 'NO', '2023-10-27', '03:22:53'),
(641, 5, '0990825942', 'CQ9V2', 0.00, 0.00, 17812.11, 'Google Chrome', 'PC', 'NO', '2023-10-27', '03:23:04'),
(642, 5, '0990825942', 'CQ9V2', 0.00, 3.00, 17791.11, 'Google Chrome', 'PC', 'NO', '2023-10-27', '03:23:10'),
(643, 5, '0990825942', 'CQ9V2', 0.00, 12.00, 17779.11, 'Google Chrome', 'PC', 'NO', '2023-10-27', '03:23:16'),
(644, 5, '0990825942', 'CQ9V2', 0.00, 0.00, 17755.11, 'Google Chrome', 'PC', 'NO', '2023-10-27', '03:23:19'),
(645, 5, '0990825942', 'CQ9V2', 0.00, 468.00, 18199.11, 'Google Chrome', 'PC', 'NO', '2023-10-27', '03:24:47'),
(646, 5, '0990825942', 'CQ9V2', 0.00, 672.00, 18851.11, 'Google Chrome', 'PC', 'NO', '2023-10-27', '03:29:15'),
(647, 5, '0990825942', 'SLOTXO', 18.00, 0.00, 18833.11, 'Google Chrome', 'PC', 'xk1epnj77765h', '2023-10-27', '04:19:54'),
(648, 2, '0954789782', 'DOGZILLA', 1.00, 1.20, 1117.99, 'Google Chrome', 'PC', 'NO', '2023-10-27', '04:43:55'),
(649, 6, '0951789155', 'GAME', 0.00, 0.00, 10557.80, 'Google Chrome', 'PC', 'AIBQAAQAXZYO4JQAAAAAAHG4AQSQGAAAAAAA', '2023-10-27', '04:44:50'),
(650, 6, '0951789155', 'GAME', 35.00, 0.00, 10592.80, 'Google Chrome', 'PC', 'AIBQAAQAXZYO4JQAAAAAB7AJAUSQGAAAAAAA', '2023-10-27', '04:45:22'),
(651, 6, '0951789155', 'GAME', 0.00, 0.00, 10592.80, 'Google Chrome', 'PC', 'AIBQAAQAXZYO4JQAAAAAAAIAAAAA', '2023-10-27', '04:45:22'),
(652, 6, '0951789155', 'GAME', 0.00, 0.00, 10582.80, 'Google Chrome', 'PC', 'AIBQAAQAXZYO4JQAAAAAAWBRAUSQGAAAAAAA', '2023-10-27', '04:45:49'),
(653, 6, '0951789155', 'GAME', 0.00, 0.00, 10582.80, 'Google Chrome', 'PC', 'AIBQAAQAXZYO4JQAAAAAAAQAAAAA', '2023-10-27', '04:45:54'),
(654, 6, '0951789155', 'DOGZILLA', 10.00, 12.00, 10542.80, 'Google Chrome', 'PC', 'NO', '2023-10-27', '04:54:44'),
(655, 2, '0954789782', 'DOGZILLA', 10.00, 16.20, 1118.19, 'Google Chrome', 'PC', 'NO', '2023-10-27', '05:52:34'),
(656, 2, '0954789782', 'DOGZILLA', 1.00, 1.62, 1133.39, 'Google Chrome', 'PC', 'NO', '2023-10-27', '05:53:26'),
(657, 6, '0951789155', 'DOGZILLA', 10.00, 21.80, 10524.80, 'Google Chrome', 'PC', 'NO', '2023-10-27', '06:05:35'),
(658, 6, '0951789155', 'DOGZILLA', 10.00, 12.00, 10526.60, 'Google Chrome', 'PC', 'NO', '2023-10-27', '06:08:06'),
(659, 6, '0951789155', 'DOGZILLA', 10.00, 12.00, 10518.60, 'Google Chrome', 'PC', 'NO', '2023-10-27', '06:10:13'),
(660, 6, '0951789155', 'DOGZILLA', 10.00, 12.00, 10520.60, 'Google Chrome', 'PC', 'NO', '2023-10-27', '06:11:16'),
(661, 6, '0951789155', 'DOGZILLA', 10.00, 12.00, 10522.60, 'Google Chrome', 'PC', 'NO', '2023-10-27', '06:11:42'),
(662, 2, '0954789782', 'DOGZILLA', 1.00, 1.20, 1134.01, 'Google Chrome', 'PC', 'NO', '2023-10-27', '07:46:40'),
(663, 2, '0954789782', 'DOGZILLA', 1.00, 1.20, 1234.21, 'Google Chrome', 'PC', 'NO', '2023-10-27', '07:49:05'),
(664, 2, '0954789782', 'PGSOFT2', 0.90, 0.00, 1233.51, 'Google Chrome', 'PC', 'NO', '2023-10-27', '09:09:56'),
(665, 6, '0951789155', 'DOGZILLA', 10.00, 16.20, 10524.60, 'Google Chrome', 'PC', 'NO', '2023-10-27', '09:34:44'),
(666, 6, '0951789155', 'DOGZILLA', 10.00, 16.20, 10500.80, 'Google Chrome', 'PC', 'NO', '2023-10-27', '09:51:03'),
(667, 6, '0951789155', 'DOGZILLA', 10.00, 12.00, 10507.00, 'Google Chrome', 'PC', 'NO', '2023-10-27', '10:33:56'),
(668, 5, '0990825942', 'CQ9V2', 15.20, 0.00, 18817.91, 'Google Chrome', 'PC', 'rel-bet-5830674255:cq9', '2023-10-27', '10:55:07'),
(669, 2, '0954789782', 'DOGZILLA', 1.00, 1.62, 1231.51, 'Google Chrome', 'Mobile', 'NO', '2023-10-27', '11:10:43'),
(670, 6, '0951789155', 'DOGZILLA', 10.00, 21.80, 10509.00, 'Google Chrome', 'PC', 'NO', '2023-10-27', '11:14:58'),
(671, 6, '0951789155', 'DOGZILLA', 10.00, 16.20, 10510.80, 'Google Chrome', 'PC', 'NO', '2023-10-27', '11:25:57'),
(672, 6, '0951789155', 'DOGZILLA', 10.00, 21.80, 10517.00, 'Google Chrome', 'PC', 'NO', '2023-10-27', '12:05:34'),
(673, 6, '0951789155', 'DOGZILLA', 10.00, 21.80, 10508.80, 'Google Chrome', 'PC', 'NO', '2023-10-27', '12:08:17'),
(674, 6, '0951789155', 'SPINIX', 0.00, 0.60, 10520.90, 'Google Chrome', 'PC', 'NO', '2023-10-27', '12:14:44'),
(675, 6, '0951789155', 'SPINIX', 0.00, 0.00, 10520.90, 'Google Chrome', 'PC', 'NO', '2023-10-27', '12:14:50'),
(676, 6, '0951789155', 'DOGZILLA', 10.00, 12.00, 10490.90, 'Google Chrome', 'PC', 'NO', '2023-10-27', '12:19:36'),
(677, 6, '0951789155', 'DOGZILLA', 10.00, 16.20, 10492.90, 'Google Chrome', 'PC', 'NO', '2023-10-27', '12:27:38'),
(678, 5, '0990825942', 'PGSOFT2', 9.00, 0.00, 17808.91, 'Google Chrome', 'PC', 'NO', '2023-10-27', '14:22:03'),
(679, 5, '0990825942', 'PGSOFT2', 9.00, 0.00, 17799.91, 'Google Chrome', 'PC', 'NO', '2023-10-27', '14:22:05'),
(680, 5, '0990825942', 'PGSOFT2', 9.00, 2.40, 17773.31, 'Google Chrome', 'PC', 'NO', '2023-10-27', '15:58:16'),
(681, 9, '0840811863', 'DOGZILLA', 0.00, 0.00, 0.00, 'Google Chrome', 'PC', 'NO', '2023-10-28', '06:52:45'),
(682, 9, '0840811863', 'DOGZILLA', 0.00, 0.00, 0.00, 'Google Chrome', 'PC', 'NO', '2023-10-28', '06:52:49'),
(683, 9, '0840811863', 'DOGZILLA', 0.00, 0.00, 0.00, 'Google Chrome', 'PC', 'NO', '2023-10-28', '06:52:54'),
(684, 9, '0840811863', 'DOGZILLA', 0.00, 0.00, 0.00, 'Google Chrome', 'PC', 'NO', '2023-10-28', '06:53:30'),
(685, 9, '0840811863', 'DOGZILLA', 0.00, 0.00, 0.00, 'Google Chrome', 'PC', 'NO', '2023-10-28', '06:53:34'),
(686, 9, '0840811863', 'DOGZILLA', 0.00, 0.00, 0.00, 'Google Chrome', 'PC', 'NO', '2023-10-28', '06:53:38'),
(687, 9, '0840811863', 'SLOTXO', 15.00, 0.00, 985.00, 'Google Chrome', 'PC', 'xjwxytb1kyt5h', '2023-10-28', '06:56:05'),
(688, 9, '0840811863', 'SLOTXO', 15.00, 0.00, 970.00, 'Google Chrome', 'PC', 'xjwyjwurkyt5h', '2023-10-28', '06:56:16'),
(689, 9, '0840811863', 'SLOTXO', 15.00, 0.00, 955.00, 'Google Chrome', 'PC', 'xjwm67z7kyt5h', '2023-10-28', '06:56:19'),
(690, 9, '0840811863', 'DOGZILLA', 0.00, 0.00, 955.00, 'Google Chrome', 'PC', 'NO', '2023-10-28', '06:57:38'),
(691, 9, '0840811863', 'DOGZILLA', 0.00, 0.00, 955.00, 'Google Chrome', 'PC', 'NO', '2023-10-28', '06:57:38'),
(692, 9, '0840811863', 'DOGZILLA', 0.00, 0.00, 955.00, 'Google Chrome', 'PC', 'NO', '2023-10-28', '06:57:43'),
(693, 9, '0840811863', 'DOGZILLA', 0.00, 0.00, 955.00, 'Google Chrome', 'PC', 'NO', '2023-10-28', '06:57:43'),
(694, 9, '0840811863', 'DOGZILLA', 0.00, 0.00, 955.00, 'Google Chrome', 'PC', 'NO', '2023-10-28', '06:57:47'),
(695, 9, '0840811863', 'DOGZILLA', 0.00, 0.00, 955.00, 'Google Chrome', 'PC', 'NO', '2023-10-28', '06:57:47'),
(696, 9, '0840811863', 'DOGZILLA', 10.50, 0.00, 944.50, 'Google Chrome', 'PC', 'NO', '2023-10-28', '06:57:55'),
(697, 9, '0840811863', 'DOGZILLA', 10.50, 6.30, 940.30, 'Google Chrome', 'PC', 'NO', '2023-10-28', '06:57:55'),
(698, 9, '0840811863', 'DOGZILLA', 1.50, 2.40, 941.20, 'Google Chrome', 'PC', 'NO', '2023-10-28', '06:58:16'),
(699, 9, '0840811863', 'DOGZILLA', 1.50, 0.00, 939.70, 'Google Chrome', 'PC', 'NO', '2023-10-28', '06:58:16'),
(700, 9, '0840811863', 'DOGZILLA', 1.50, 6.05, 944.25, 'Google Chrome', 'PC', 'NO', '2023-10-28', '06:58:20'),
(701, 9, '0840811863', 'DOGZILLA', 1.50, 5.00, 943.20, 'Google Chrome', 'PC', 'NO', '2023-10-28', '06:58:20'),
(702, 9, '0840811863', 'DOGZILLA', 1.50, 0.00, 941.70, 'Google Chrome', 'PC', 'NO', '2023-10-28', '06:58:28'),
(703, 9, '0840811863', 'DOGZILLA', 1.50, 1.80, 942.00, 'Google Chrome', 'PC', 'NO', '2023-10-28', '06:58:28'),
(704, 9, '0840811863', 'DOGZILLA', 3.00, 0.00, 939.00, 'Google Chrome', 'PC', 'NO', '2023-10-28', '06:58:38'),
(705, 9, '0840811863', 'DOGZILLA', 3.00, 1.80, 937.80, 'Google Chrome', 'PC', 'NO', '2023-10-28', '06:58:38'),
(706, 9, '0840811863', 'DOGZILLA', 3.00, 0.00, 934.80, 'Google Chrome', 'PC', 'NO', '2023-10-28', '06:58:45'),
(707, 9, '0840811863', 'DOGZILLA', 3.00, 0.00, 934.80, 'Google Chrome', 'PC', 'NO', '2023-10-28', '06:58:45'),
(708, 9, '0840811863', 'DOGZILLA', 5.00, 0.00, 987.50, 'Google Chrome', 'PC', 'NO', '2023-10-28', '07:00:36'),
(709, 9, '0840811863', 'DOGZILLA', 5.00, 0.00, 982.50, 'Google Chrome', 'PC', 'NO', '2023-10-28', '07:01:03'),
(710, 9, '0840811863', 'DOGZILLA', 5.00, 0.00, 977.50, 'Google Chrome', 'PC', 'NO', '2023-10-28', '07:01:15'),
(711, 9, '0840811863', 'DOGZILLA', 5.00, 0.00, 972.50, 'Google Chrome', 'PC', 'NO', '2023-10-28', '07:01:40'),
(712, 9, '0840811863', 'DOGZILLA', 5.00, 0.00, 967.50, 'Google Chrome', 'PC', 'NO', '2023-10-28', '07:02:07'),
(713, 9, '0840811863', 'DOGZILLA', 5.00, 0.00, 962.50, 'Google Chrome', 'PC', 'NO', '2023-10-28', '07:02:29'),
(714, 9, '0840811863', 'DOGZILLA', 5.00, 9.20, 966.70, 'Google Chrome', 'PC', 'NO', '2023-10-28', '07:03:12'),
(715, 2, '0954789782', 'DOGZILLA', 1.50, 0.75, 1149.38, 'Google Chrome', 'PC', 'NO', '2023-10-31', '05:33:23'),
(716, 2, '0954789782', 'DOGZILLA', 3.00, 9.00, 1155.38, 'Google Chrome', 'PC', 'NO', '2023-10-31', '05:33:57'),
(717, 2, '0954789782', 'DOGZILLA', 4.50, 0.00, 1150.88, 'Google Chrome', 'PC', 'NO', '2023-10-31', '05:34:25'),
(718, 2, '0954789782', 'DOGZILLA', 4.50, 4.50, 1150.88, 'Google Chrome', 'Mobile', 'NO', '2023-10-31', '05:37:49'),
(719, 2, '0954789782', 'DOGZILLA', 1.50, 0.50, 1149.88, 'Google Chrome', 'PC', 'NO', '2023-10-31', '05:38:55'),
(720, 2, '0954789782', 'DOGZILLA', 1.50, 0.00, 1148.38, 'Google Chrome', 'Mobile', 'NO', '2023-10-31', '05:40:19'),
(721, 2, '0954789782', 'DOGZILLA', 1.00, 0.00, 1147.38, 'Google Chrome', 'PC', 'NO', '2023-10-31', '05:41:21'),
(722, 2, '0954789782', 'DOGZILLA', 1.00, 0.00, 1146.38, 'Google Chrome', 'PC', 'NO', '2023-10-31', '05:41:37'),
(723, 2, '0954789782', 'DOGZILLA', 1.00, 1.84, 1147.22, 'Google Chrome', 'PC', 'NO', '2023-10-31', '05:41:51'),
(724, 2, '0954789782', 'DOGZILLA', 5.00, 9.20, 1151.42, 'Google Chrome', 'PC', 'NO', '2023-10-31', '05:42:33'),
(725, 2, '0954789782', 'DOGZILLA', 1.00, 0.00, 1150.42, 'Google Chrome', 'PC', 'NO', '2023-10-31', '05:43:12'),
(726, 2, '0954789782', 'DOGZILLA', 1.00, 0.00, 1149.42, 'Google Chrome', 'PC', 'NO', '2023-10-31', '05:43:35'),
(727, 2, '0954789782', 'DOGZILLA', 1.00, 1.84, 1150.26, 'Google Chrome', 'PC', 'NO', '2023-10-31', '05:43:49'),
(728, 2, '0954789782', 'DOGZILLA', 1.00, 1.20, 1149.26, 'Google Chrome', 'PC', 'NO', '2023-10-31', '05:45:22'),
(729, 6, '0951789155', 'DOGZILLA', 10.00, 12.00, 10489.10, 'Google Chrome', 'PC', 'NO', '2023-10-31', '09:45:15'),
(730, 6, '0951789155', 'DOGZILLA', 10.00, 12.00, 10491.10, 'Google Chrome', 'PC', 'NO', '2023-10-31', '09:49:30'),
(731, 6, '0951789155', 'DOGZILLA', 10.00, 16.20, 10493.10, 'Google Chrome', 'PC', 'NO', '2023-10-31', '09:50:08'),
(732, 6, '0951789155', 'DOGZILLA', 10.00, 12.00, 10469.30, 'Google Chrome', 'PC', 'NO', '2023-10-31', '09:53:38'),
(733, 6, '0951789155', 'DOGZILLA', 10.00, 16.20, 10461.30, 'Google Chrome', 'PC', 'NO', '2023-10-31', '09:54:39'),
(734, 6, '0951789155', 'DOGZILLA', 10.00, 12.00, 10437.50, 'Google Chrome', 'PC', 'NO', '2023-10-31', '10:02:54'),
(735, 6, '0951789155', 'DOGZILLA', 10.00, 21.80, 10369.50, 'Google Chrome', 'PC', 'NO', '2023-10-31', '10:23:14'),
(736, 6, '0951789155', 'DOGZILLA', 10.00, 12.00, 10381.30, 'Google Chrome', 'PC', 'NO', '2023-10-31', '10:23:36'),
(737, 6, '0951789155', 'DOGZILLA', 10.00, 21.80, 10353.30, 'Google Chrome', 'PC', 'NO', '2023-10-31', '10:46:48'),
(738, 4, '0835366936', 'DOGZILLA', 0.00, 0.00, 0.00, 'Google Chrome', 'PC', 'NO', '2023-11-01', '05:30:30'),
(739, 4, '0835366936', 'DOGZILLA', 0.00, 0.00, 0.00, 'Google Chrome', 'PC', 'NO', '2023-11-01', '05:30:34'),
(740, 5, '0990825942', 'PGSOFT2', 9.00, 0.00, 14299.31, 'Google Chrome', 'PC', 'NO', '2023-11-01', '09:25:57'),
(741, 5, '0990825942', 'PGSOFT2', 9.00, 0.00, 14290.31, 'Google Chrome', 'PC', 'NO', '2023-11-01', '09:26:00'),
(742, 5, '0990825942', 'PGSOFT2', 9.00, 1.80, 14283.11, 'Google Chrome', 'PC', 'NO', '2023-11-01', '09:26:02'),
(743, 5, '0990825942', 'PGSOFT2', 9.00, 0.00, 14274.11, 'Google Chrome', 'PC', 'NO', '2023-11-01', '09:26:06'),
(744, 5, '0990825942', 'PGSOFT2', 9.00, 32.70, 14297.81, 'Google Chrome', 'PC', 'NO', '2023-11-01', '09:26:09'),
(745, 5, '0990825942', 'PGSOFT2', 9.00, 0.00, 14288.81, 'Google Chrome', 'PC', 'NO', '2023-11-01', '09:26:15'),
(746, 5, '0990825942', 'PGSOFT2', 9.00, 0.00, 14279.81, 'Google Chrome', 'PC', 'NO', '2023-11-01', '09:26:18'),
(747, 5, '0990825942', 'PGSOFT2', 0.00, 0.00, 14279.81, 'Google Chrome', 'PC', 'NO', '2023-11-01', '09:26:27'),
(748, 5, '0990825942', 'PGSOFT2', 9.00, 6.00, 14276.81, 'Google Chrome', 'PC', 'NO', '2023-11-01', '09:26:31'),
(749, 5, '0990825942', 'PGSOFT2', 9.00, 0.00, 14267.81, 'Google Chrome', 'PC', 'NO', '2023-11-01', '09:26:35'),
(750, 5, '0990825942', 'PGSOFT2', 9.00, 0.00, 14258.81, 'Google Chrome', 'PC', 'NO', '2023-11-01', '09:26:38'),
(751, 5, '0990825942', 'PGSOFT2', 9.00, 0.00, 14249.81, 'Google Chrome', 'PC', 'NO', '2023-11-01', '09:26:41'),
(752, 5, '0990825942', 'PGSOFT2', 9.00, 0.00, 14240.81, 'Google Chrome', 'PC', 'NO', '2023-11-01', '09:26:43'),
(753, 5, '0990825942', 'PGSOFT2', 9.00, 0.00, 14231.81, 'Google Chrome', 'PC', 'NO', '2023-11-01', '09:26:45'),
(754, 5, '0990825942', 'PGSOFT2', 9.00, 0.00, 14222.81, 'Google Chrome', 'PC', 'NO', '2023-11-01', '09:26:47'),
(755, 5, '0990825942', 'PGSOFT2', 9.00, 0.00, 14213.81, 'Google Chrome', 'PC', 'NO', '2023-11-01', '09:26:50'),
(756, 5, '0990825942', 'PGSOFT2', 9.00, 2.40, 14207.21, 'Google Chrome', 'PC', 'NO', '2023-11-01', '09:26:52'),
(757, 5, '0990825942', 'PGSOFT2', 9.00, 11.70, 14209.91, 'Google Chrome', 'PC', 'NO', '2023-11-01', '09:26:56'),
(758, 5, '0990825942', 'PGSOFT2', 9.00, 0.00, 14200.91, 'Google Chrome', 'PC', 'NO', '2023-11-01', '09:27:01'),
(759, 2, '0954789782', 'PGSOFT2', 1.00, 0.00, 1097.46, 'Google Chrome', 'PC', 'NO', '2023-11-01', '10:06:51'),
(760, 2, '0954789782', 'DOGZILLA', 5.00, 0.00, 1087.46, 'Google Chrome', 'PC', 'NO', '2023-11-01', '10:10:45'),
(761, 2, '0954789782', 'DOGZILLA', 5.00, 0.00, 1082.46, 'Google Chrome', 'PC', 'NO', '2023-11-01', '10:11:07'),
(762, 5, '0990825942', 'DOGZILLA', 10.00, 16.20, 14170.91, 'Google Chrome', 'PC', 'NO', '2023-11-02', '11:37:16'),
(763, 6, '0951789155', 'DOGZILLA', 10.00, 0.00, 10365.10, 'Google Chrome', 'PC', 'NO', '2023-11-02', '13:45:32'),
(764, 6, '0951789155', 'DOGZILLA', 10.00, 0.00, 10355.10, 'Google Chrome', 'PC', 'NO', '2023-11-02', '13:46:11'),
(765, 6, '0951789155', 'DOGZILLA', 10.00, 0.00, 10345.10, 'Google Chrome', 'PC', 'NO', '2023-11-02', '14:24:05'),
(766, 6, '0951789155', 'DOGZILLA', 10.00, 44.00, 10335.10, 'Google Chrome', 'PC', 'NO', '2023-11-02', '14:24:56'),
(767, 5, '0990825942', 'DOGZILLA', 10.00, 0.00, 14177.11, 'Google Chrome', 'PC', 'NO', '2023-11-02', '15:09:59'),
(768, 5, '0990825942', 'DOGZILLA', 10.00, 0.00, 14167.11, 'Google Chrome', 'PC', 'NO', '2023-11-02', '15:15:31'),
(769, 6, '0951789155', 'DOGZILLA', 10.00, 0.00, 10369.10, 'Google Chrome', 'PC', 'NO', '2023-11-02', '18:43:44'),
(770, 6, '0951789155', 'DOGZILLA', 10.00, 0.00, 10359.10, 'Google Chrome', 'PC', 'NO', '2023-11-02', '18:47:57'),
(771, 6, '0951789155', 'DOGZILLA', 10.00, 0.00, 10349.10, 'Google Chrome', 'PC', 'NO', '2023-11-02', '18:55:00'),
(772, 6, '0951789155', 'DOGZILLA', 10.00, 0.00, 10339.10, 'Google Chrome', 'PC', 'NO', '2023-11-02', '19:00:29'),
(773, 6, '0951789155', 'DOGZILLA', 10.00, 0.00, 10329.10, 'Google Chrome', 'PC', 'NO', '2023-11-02', '19:07:49'),
(774, 6, '0951789155', 'DOGZILLA', 10.00, 0.00, 10319.10, 'Google Chrome', 'PC', 'NO', '2023-11-02', '19:08:12'),
(775, 5, '0990825942', 'DOGZILLA', 10.00, 66.67, 14223.78, 'Google Chrome', 'PC', 'NO', '2023-11-02', '20:19:13'),
(776, 5, '0990825942', 'DOGZILLA', 10.00, 38.67, 14252.45, 'Google Chrome', 'PC', 'NO', '2023-11-02', '20:19:21'),
(777, 5, '0990825942', 'DOGZILLA', 10.00, 25.00, 14267.45, 'Google Chrome', 'PC', 'NO', '2023-11-02', '20:19:28'),
(778, 5, '0990825942', 'DOGZILLA', 10.00, 0.00, 14257.45, 'Google Chrome', 'PC', 'NO', '2023-11-02', '20:19:31'),
(779, 5, '0990825942', 'DOGZILLA', 10.00, 9.33, 14256.78, 'Google Chrome', 'PC', 'NO', '2023-11-02', '20:19:31'),
(780, 5, '0990825942', 'DOGZILLA', 10.00, 18.00, 14264.78, 'Google Chrome', 'PC', 'NO', '2023-11-02', '20:19:34'),
(781, 5, '0990825942', 'DOGZILLA', 10.00, 0.00, 14254.78, 'Google Chrome', 'PC', 'NO', '2023-11-02', '20:19:37'),
(782, 5, '0990825942', 'DOGZILLA', 10.00, 5.00, 14249.78, 'Google Chrome', 'PC', 'NO', '2023-11-02', '20:19:38'),
(783, 5, '0990825942', 'DOGZILLA', 10.00, 5.00, 14244.78, 'Google Chrome', 'PC', 'NO', '2023-11-02', '20:19:41'),
(784, 5, '0990825942', 'DOGZILLA', 10.00, 5.00, 14239.78, 'Google Chrome', 'PC', 'NO', '2023-11-02', '20:19:44'),
(785, 5, '0990825942', 'DOGZILLA', 10.00, 0.00, 14229.78, 'Google Chrome', 'PC', 'NO', '2023-11-02', '20:19:47'),
(786, 5, '0990825942', 'DOGZILLA', 10.00, 25.33, 14245.11, 'Google Chrome', 'PC', 'NO', '2023-11-02', '20:19:48'),
(787, 5, '0990825942', 'DOGZILLA', 10.00, 3.33, 14238.44, 'Google Chrome', 'PC', 'NO', '2023-11-02', '20:19:51'),
(788, 5, '0990825942', 'DOGZILLA', 10.00, 0.00, 14228.44, 'Google Chrome', 'PC', 'NO', '2023-11-02', '20:19:54');

-- --------------------------------------------------------

--
-- Table structure for table `subagent`
--

CREATE TABLE `subagent` (
  `id` bigint NOT NULL,
  `id_agent` bigint DEFAULT NULL,
  `ranksubAgent` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT 'Agent',
  `username` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `contact_number` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `level` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT 'VVIP',
  `bettype` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '-',
  `responsibleperson` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '-',
  `created_at` timestamp NULL DEFAULT NULL,
  `last_login_date` timestamp NULL DEFAULT NULL,
  `last_login_ip` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `status` enum('Y','N') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT 'Y',
  `creditsub` float(15,2) DEFAULT '0.00',
  `status_delete` enum('Y','N') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT 'N',
  `currencysubagent` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT 'บาท'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `subagent`
--

INSERT INTO `subagent` (`id`, `id_agent`, `ranksubAgent`, `username`, `password`, `name`, `contact_number`, `level`, `bettype`, `responsibleperson`, `created_at`, `last_login_date`, `last_login_ip`, `status`, `creditsub`, `status_delete`, `currencysubagent`) VALUES
(1, 1, 'Agent', 'subAgent01', '$2a$12$RNKvumGUJIeCnSjIssB8W.WYSWFzD7gwAXTSbRWrjE0LhLL6DoliS', 'hui007', '0990850209', 'VVIP', '-', '-', '2023-05-18 13:22:43', NULL, NULL, 'Y', 1000.00, 'N', 'บาท'),
(2, 2, 'Agent', 'subAgent02', '$2a$12$3TPuPaalyY5bFa.9TzPmYuVDwJbxlKvnbPUnHGOsXn7JrFJMCH6yu', 'hui04', '0838985628', 'VIP', '-', '-', '2023-05-19 07:57:01', NULL, NULL, 'Y', 35000.00, 'N', 'บาท'),
(3, 2, 'Agent', 'subAgent03', '$2a$12$TuAj5jOomr51yFjz6b52Fu2m4a.BxMgsmbqFqbpqlUHuU0Cu9T3X2', 'titan', '0897231865', 'VIP', '-', '-', '2023-05-19 13:09:06', NULL, NULL, 'Y', 300.00, 'N', 'บาท'),
(4, 1, 'Agent', 'SubAgentHui', '$2a$12$SDoEUude4tkzs4vCCLaIxehgU.LxAhHjHteo1M5Yo0vJNlU3DwkwG', 'NiranamHui', '0943169915', 'VVIP', '-', '-', '2023-05-24 15:02:52', NULL, NULL, 'Y', 600000.00, 'N', 'บาท'),
(5, 2, 'Reseller', 'KiritoSan', '$2a$12$qsHomIpiwmi2NB3osdqIluLKi6e0LH9bglyEstrIO87jUCZvTZkUm', 'asunayugi', '0990850246', 'VIP', '-', '-', '2023-05-24 15:08:01', NULL, NULL, 'Y', 600000.00, 'N', 'บาท'),
(6, 1, 'Agent', 'tyjghfhfghtfh', '$2a$12$1iYQAgZrDRwOLcUkFYsMsepO.U35alqGtx4FPoJ.iP1aQBRgyeM6a', 'Bodyslam', '0998542263', 'VIP', '-', '-', '2023-05-24 15:10:37', NULL, NULL, 'Y', 562222.00, 'N', 'บาท'),
(7, 1, 'Reseller', 'Ultraman', '$2a$12$G8Furw2tJGptIM8PdgoFyujOPILKL26qf0XkjccZgHLdsT.UG7YBy', 'Trigger', '0838985628', 'VVIP', '-', '-', '2023-05-24 15:13:43', NULL, NULL, 'Y', 42000.00, 'N', 'บาท'),
(8, 2, 'Agent', 'Supernova', '$2a$12$Du9EiKFnDYplQg2u07llKerficQUXGT96j19BHxAz0awGlJgaM.me', 'Kiba', '0838985624', 'Stater', '-', '-', '2023-05-24 18:52:15', NULL, NULL, 'Y', 56556.00, 'N', 'บาท'),
(9, 2, 'Agent', 'SupernovaMusic', '$2a$12$1lgDtd5ZmSySX0kpUkO1LOtK9SE9sdGVlj2MHHelXomhjzE5MO8oq', 'Kiba', '0838985624', 'Stater', '-', '-', '2023-05-24 18:54:51', NULL, NULL, 'Y', 56556.00, 'N', 'บาท'),
(10, 2, 'Agent', 'TaroUltraman', '$2a$12$GzxZIyRu56u8r4BkMH/LU.w96lcSGkNN6wXdgzA.cdqwzHoiTy1Fa', 'Taro', '0838985626', 'VIP', '-', '-', '2023-06-01 12:53:32', NULL, NULL, 'Y', 30000.00, 'N', 'บาท'),
(11, 2, 'Agent', 'TheFlash', '$2a$12$Dcs7qA2fVfl3oVS339vhpu6.XyMm3QM7Gyzlyz6aIiy/vOmTSjY9m', 'Flash', '0990850246', 'VIP', '-', '-', '2023-06-01 13:01:07', NULL, NULL, 'Y', 5000.00, 'N', 'บาท'),
(12, 2, 'Reseller', 'KingOrange', '$2a$12$zDUiBYErK8NH/.ZfmlaAO.86J1eeZl3STrCutODy2AVHN8ZcdADPW', 'King', '0998542263', 'Starter', '-', '-', '2023-06-01 13:07:08', NULL, NULL, 'Y', 60000.00, 'N', 'บาท'),
(13, 2, 'Agent', 'ghghghghg', '$2a$12$DQj9SaPKPreHpoy7yGSJL.IGfnsW2nRs.UWRqvXoNuqVZNNAP3bMi', 'kjkjkj', '0998542263', 'VVIP', '-', '-', '2023-06-01 13:14:22', NULL, NULL, 'Y', 3000.00, 'N', 'บาท'),
(14, 2, 'Agent', 'yhjhyjyjy', '$2a$12$9kh.WHVI0ugSNeokjTO7PeL9OIduEv4kpsw0h8O9fQutOUgP7Yz4S', 'huioo', '0838985626', 'Starter', '-', '-', '2023-06-01 13:14:22', NULL, NULL, 'Y', 50000.00, 'N', 'บาท'),
(15, 2, 'Agent', 'Ironmansaves', '$2a$12$2kBVKce.W1H6A/MzchX7z.dJ2iYsvHpymR1my4kx/7GTGzQSySoBe', 'ironman', '0897231865', 'VVIP', '-', '-', '2023-06-01 13:22:08', NULL, NULL, 'Y', 9999.00, 'N', 'บาท'),
(16, 2, 'Agent', 'Lomosonic', '$2a$12$td/Yd/EivI4/Htm/3rLzH.hj2HNkSFehPfNYkldZruz2WRM1Hzp66', 'Jetset', '0897231865', 'VIP', '-', '-', '2023-06-01 14:58:55', NULL, NULL, 'Y', 6000.00, 'N', 'บาท'),
(17, 2, 'Agent', 'OmenAcer', '$2a$12$Jv4YYiJq7EZ1Iyb.16MVc.9Mm6tBA4tn5mNnThPqc1Jf39A239cSG', 'Omen', '0838985626', 'VIP', '-', '-', '2023-06-01 15:03:26', NULL, NULL, 'Y', 60000.00, 'N', 'บาท'),
(18, 2, 'Agent', 'SamsungS1', '$2a$12$DBIW.vBbjMrQtNOxgY/M..hOTP90RoMbOd/atymMjL/ByX33lybrG', 'Samsung', '0990850246', 'VVIP', '-', '-', '2023-06-01 15:06:45', NULL, NULL, 'Y', 80000.00, 'N', 'บาท'),
(19, 1, 'Agent', 'RiderAamazons', '$2a$12$hKsEtGZ63GivHRDaD.pn/O2uMZCo0DXMHXHUHMkbhGzBBYlLuf1Y.', 'Aamazons', '0838985621', 'VIP', '-', '-', '2023-06-01 18:44:35', NULL, NULL, 'Y', 3000.00, 'N', 'บาท'),
(20, 1, 'Agent', 'niranam61106506', '$2a$12$RRq3/WydnJw0xL6syAaOwubhm.PHeq2TN6qSQl2epPaewvF/DZt2C', 'NiranamHui', '0990825942', 'VIP', '-', '-', '2023-06-01 18:48:31', NULL, NULL, 'Y', 100000.00, 'N', 'บาท'),
(21, 6, 'Agent', 'BladeBrave', '$2a$12$ODWJKEMS0oC.5GTXCQDEK.EPLiNe2AtONCtpsmYFK1KgH8B4ybK.q', 'Blade', '0897231865', 'VIP', '-', '-', '2023-06-01 18:57:09', NULL, NULL, 'Y', 60000.00, 'N', 'บาท');

-- --------------------------------------------------------

--
-- Table structure for table `totalamountdaily`
--

CREATE TABLE `totalamountdaily` (
  `id` bigint NOT NULL,
  `agentid` bigint NOT NULL,
  `accountName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `accountNumber` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `billmatched` double(15,2) NOT NULL,
  `complated` double(15,2) NOT NULL,
  `balance` double(15,2) NOT NULL DEFAULT '0.00',
  `bankname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `typeaction` enum('ถอน','ฝาก') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `imgbank` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `totalamountdaily`
--

INSERT INTO `totalamountdaily` (`id`, `agentid`, `accountName`, `accountNumber`, `billmatched`, `complated`, `balance`, `bankname`, `date`, `time`, `typeaction`, `imgbank`) VALUES
(1, 2, 'นาย พีรวัส ขวัญแก้ว', '020042001691', 15.00, 15.00, 15.00, 'ธนาคารออมสิน', '2023-11-01', '09:02:10', 'ฝาก', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-gsb.png');

-- --------------------------------------------------------

--
-- Table structure for table `totalturnoverrepost`
--

CREATE TABLE `totalturnoverrepost` (
  `id` bigint NOT NULL,
  `usernameuser` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `turnover` double(15,2) NOT NULL DEFAULT '0.00',
  `win` double(15,2) NOT NULL DEFAULT '0.00',
  `lose` double(15,2) NOT NULL DEFAULT '0.00',
  `roundplay` int NOT NULL DEFAULT '0',
  `ag_winlose` double(15,2) NOT NULL DEFAULT '0.00',
  `ag_comm` double(15,2) NOT NULL DEFAULT '0.00',
  `ag_total` double(15,2) NOT NULL DEFAULT '0.00',
  `comny_total` double(15,2) NOT NULL DEFAULT '0.00',
  `day` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `totalturnoverrepost`
--

INSERT INTO `totalturnoverrepost` (`id`, `usernameuser`, `turnover`, `win`, `lose`, `roundplay`, `ag_winlose`, `ag_comm`, `ag_total`, `comny_total`, `day`) VALUES
(1, '0835366936', 0.00, 0.00, 0.00, 15, 0.00, 0.00, 0.00, 0.00, '2023-10-23'),
(2, '0990825942', 80.00, 112.80, -32.80, 4, -32.80, 0.00, -32.48, -0.32, '2023-10-23'),
(3, '0835366936', 0.00, 0.00, 0.00, 14, 0.00, 0.00, 0.00, 0.00, '2023-10-24'),
(4, '0925711362', 0.00, 0.00, 0.00, 5, 0.00, 0.00, 0.00, 0.00, '2023-10-24'),
(5, '0951789155', 1943.00, 1486.06, 456.94, 17, 456.94, 0.00, 452.36, 4.58, '2023-10-25'),
(6, '0954789782', 1508.00, 20.10, 1487.90, 6, 1487.90, 0.00, 1472.97, 14.93, '2023-10-25'),
(7, '0951789155', 290.00, 554.40, -264.40, 28, -264.40, 0.00, -261.76, -2.64, '2023-10-26'),
(8, '0954789782', 74.10, 382.55, -308.45, 105, -308.45, 0.00, -277.61, -30.84, '2023-10-26'),
(9, '0990825942', 621.50, 899.06, -277.56, 296, -277.56, 0.00, -249.78, -27.76, '2023-10-26'),
(10, '0822936915', 134.00, 216.85, -82.85, 27, -82.85, 0.00, -82.02, -0.86, '2023-10-26'),
(11, '0990825942', 27.00, 18359.40, -18332.40, 25, -18332.40, 0.00, -16499.16, -1833.24, '2023-10-27'),
(12, '0954789782', 15.90, 23.04, -7.14, 7, -7.14, 0.00, -7.15, 0.01, '2023-10-27'),
(13, '0951789155', 150.00, 236.60, -86.60, 17, -86.60, 0.00, -85.68, -0.92, '2023-10-27'),
(14, '0840811863', 77.00, 32.55, 44.45, 34, 44.45, 0.00, 44.00, 0.45, '2023-10-28'),
(15, '0954789782', 28.50, 28.83, -0.33, 14, -0.33, 0.00, -0.34, 0.00, '2023-10-31'),
(16, '0951789155', 90.00, 136.00, -46.00, 9, -46.00, 0.00, -45.54, -0.46, '2023-10-31'),
(17, '0835366936', 0.00, 0.00, 0.00, 2, 0.00, 0.00, 0.00, 0.00, '2023-11-01'),
(18, '0990825942', 162.00, 54.60, 107.40, 19, 107.40, 0.00, 96.66, 10.74, '2023-11-01'),
(19, '0954789782', 11.00, 0.00, 11.00, 3, 11.00, 0.00, 10.80, 0.20, '2023-11-01'),
(20, '0990825942', 170.00, 217.53, -47.53, 17, -47.53, 0.00, -47.53, 0.00, '2023-11-02'),
(21, '0951789155', 100.00, 44.00, 56.00, 10, 56.00, 0.00, 56.00, 0.00, '2023-11-02');

-- --------------------------------------------------------

--
-- Table structure for table `turnoverrepost`
--

CREATE TABLE `turnoverrepost` (
  `id` bigint NOT NULL,
  `usernameuser` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `gamecamp` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `turnover` double(15,2) NOT NULL DEFAULT '0.00',
  `win` double(15,2) NOT NULL DEFAULT '0.00',
  `lose` double(15,2) NOT NULL DEFAULT '0.00',
  `day` date NOT NULL,
  `roundplay` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `turnoverrepost`
--

INSERT INTO `turnoverrepost` (`id`, `usernameuser`, `gamecamp`, `turnover`, `win`, `lose`, `day`, `roundplay`) VALUES
(1, '0835366936', 'DOGZILLA', 0.00, 0.00, 0.00, '2023-10-23', 15),
(2, '0990825942', 'DOGZILLA', 80.00, 112.80, -32.80, '2023-10-23', 4),
(3, '0835366936', 'DOGZILLA', 0.00, 0.00, 0.00, '2023-10-24', 14),
(4, '0925711362', 'DOGZILLA', 0.00, 0.00, 0.00, '2023-10-24', 5),
(5, '0951789155', 'DOGZILLA', 1943.00, 1486.06, 456.94, '2023-10-25', 17),
(6, '0954789782', 'DOGZILLA', 1507.00, 19.70, 1487.30, '2023-10-25', 3),
(7, '0954789782', 'PGSOFT2', 1.00, 0.40, 0.60, '2023-10-25', 3),
(8, '0951789155', 'DOGZILLA', 290.00, 554.40, -264.40, '2023-10-26', 28),
(9, '0954789782', 'SPINIX', 0.00, 95.70, -95.70, '2023-10-26', 39),
(10, '0990825942', 'EVOPLAY', 0.00, 48.00, -48.00, '2023-10-26', 5),
(11, '0990825942', 'LIVE22', 0.00, 0.70, -0.70, '2023-10-26', 2),
(12, '0990825942', 'JILI', 640.00, 732.60, -92.60, '2023-10-26', 196),
(13, '0990825942', 'MANNA', 24.00, 0.00, 24.00, '2023-10-26', 13),
(14, '0990825942', 'YGGDRASIL', 0.00, 0.00, 0.00, '2023-10-26', 2),
(15, '0990825942', 'AMEBA', 0.00, 1.00, -1.00, '2023-10-26', 2),
(16, '0990825942', 'AMBSLOT2', 34.00, 4.16, 29.84, '2023-10-26', 9),
(17, '0990825942', 'NETENT2', 0.00, 62.50, -62.50, '2023-10-26', 9),
(18, '0990825942', 'DRAGONGAMING', 0.00, 0.00, 0.00, '2023-10-26', 6),
(19, '0990825942', 'ACE333', 0.00, 4.00, -4.00, '2023-10-26', 2),
(20, '0990825942', 'I8', 30.00, 15.00, 15.00, '2023-10-26', 1),
(21, '0990825942', 'WMSLOT', 0.00, 0.00, 0.00, '2023-10-26', 6),
(22, '0990825942', '918KISS', 0.00, 2.70, -2.70, '2023-10-26', 2),
(23, '0990825942', 'PRAGMATIC_SLOT', 0.00, 24.50, -24.50, '2023-10-26', 7),
(24, '0990825942', 'HABANERO', -106.50, 3.90, -110.40, '2023-10-26', 34),
(25, '0954789782', 'SLOTXO', 0.00, 0.00, 0.00, '2023-10-26', 1),
(26, '0954789782', 'CQ9V2', 0.00, 216.00, -216.00, '2023-10-26', 1),
(27, '0954789782', 'ACE333', 0.00, 0.00, 0.00, '2023-10-26', 1),
(28, '0954789782', 'JILI', 58.10, 63.30, -5.20, '2023-10-26', 41),
(29, '0954789782', 'AMBSLOT2', 2.00, 1.50, 0.50, '2023-10-26', 2),
(30, '0954789782', 'PGSOFT2', 14.00, 6.05, 7.95, '2023-10-26', 20),
(31, '0822936915', 'DOGZILLA', 134.00, 216.85, -82.85, '2023-10-26', 27),
(32, '0990825942', 'CQ9V2', 0.00, 18357.00, -18357.00, '2023-10-27', 21),
(33, '0990825942', 'SLOTXO', 0.00, 0.00, 0.00, '2023-10-27', 1),
(34, '0954789782', 'DOGZILLA', 15.00, 23.04, -8.04, '2023-10-27', 6),
(35, '0951789155', 'DOGZILLA', 150.00, 236.00, -86.00, '2023-10-27', 15),
(36, '0954789782', 'PGSOFT2', 0.90, 0.00, 0.90, '2023-10-27', 1),
(37, '0951789155', 'SPINIX', 0.00, 0.60, -0.60, '2023-10-27', 2),
(38, '0990825942', 'PGSOFT2', 27.00, 2.40, 24.60, '2023-10-27', 3),
(39, '0840811863', 'DOGZILLA', 77.00, 32.55, 44.45, '2023-10-28', 31),
(40, '0840811863', 'SLOTXO', 0.00, 0.00, 0.00, '2023-10-28', 3),
(41, '0954789782', 'DOGZILLA', 28.50, 28.83, -0.33, '2023-10-31', 14),
(42, '0951789155', 'DOGZILLA', 90.00, 136.00, -46.00, '2023-10-31', 9),
(43, '0835366936', 'DOGZILLA', 0.00, 0.00, 0.00, '2023-11-01', 2),
(44, '0990825942', 'PGSOFT2', 162.00, 54.60, 107.40, '2023-11-01', 19),
(45, '0954789782', 'PGSOFT2', 1.00, 0.00, 1.00, '2023-11-01', 1),
(46, '0954789782', 'DOGZILLA', 10.00, 0.00, 10.00, '2023-11-01', 2),
(47, '0990825942', 'DOGZILLA', 170.00, 217.53, -47.53, '2023-11-02', 17),
(48, '0951789155', 'DOGZILLA', 100.00, 44.00, 56.00, '2023-11-02', 10);

-- --------------------------------------------------------

--
-- Table structure for table `user_play`
--

CREATE TABLE `user_play` (
  `id` bigint NOT NULL,
  `member_id` bigint DEFAULT '0',
  `game_id` bigint DEFAULT '0',
  `bet` float(16,2) DEFAULT '0.00',
  `win` float(16,2) DEFAULT '0.00',
  `tiles` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `winline` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `winstyle` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `winCount` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `credit` float(15,2) DEFAULT '0.00',
  `get_browser` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `game_Buyfeespin` enum('true','false') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT 'false',
  `game_feespin` enum('true','false') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT 'false'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `user_play`
--

INSERT INTO `user_play` (`id`, `member_id`, `game_id`, `bet`, `win`, `tiles`, `winline`, `winstyle`, `winCount`, `credit`, `get_browser`, `created_at`, `game_Buyfeespin`, `game_feespin`) VALUES
(1, 1, 1, 0.00, 0.00, '7,4,8,2,6,9,7,0,6,3,5,1,8,5,2', '', '', '0', 1000.00, NULL, '2023-10-19 16:04:35', 'false', 'false'),
(2, 1, 1, 0.00, 0.00, '5,2,8,1,0,2,1,0,7,11,0,6,4,7,5', '', '', '0', 1000.00, NULL, '2023-10-19 16:04:38', 'false', 'false'),
(3, 1, 1, 0.00, 0.00, '3,10,1,10,0,2,4,9,3,0,4,3,10,5,8', '', '', '0', 1000.00, NULL, '2023-10-19 16:04:42', 'false', 'false'),
(4, 1, 1, 9.00, 19.80, '1,5,11,0,6,5,5,4,9,0,4,8,4,5,12', '9,24,26,29', 'right3,left3,left3,right3', '4', 1010.80, NULL, '2023-10-19 16:04:53', 'false', 'false'),
(5, 1, 1, 9.00, 5.40, '5,0,1,2,8,0,7,2,5,4,3,5,4,9,5', '2', 'right3', '1', 1007.20, NULL, '2023-10-19 16:04:59', 'false', 'false'),
(6, 1, 1, 9.00, 0.00, '2,5,1,9,6,12,4,6,0,5,4,0,6,10,1', '', '', '0', 998.20, NULL, '2023-10-19 16:05:05', 'false', 'false'),
(7, 1, 1, 9.00, 0.00, '3,6,0,7,0,6,3,1,5,0,3,7,0,9,4', '', '', '0', 989.20, NULL, '2023-10-19 16:05:08', 'false', 'false'),
(8, 1, 1, 9.00, 0.00, '3,10,1,5,12,9,7,0,5,0,4,3,7,5,9', '', '', '0', 980.20, NULL, '2023-10-19 16:05:12', 'false', 'false'),
(9, 1, 1, 9.00, 0.00, '0,9,5,10,0,2,3,10,5,9,4,6,4,10,5', '', '', '0', 971.20, NULL, '2023-10-19 16:05:15', 'false', 'false'),
(10, 1, 1, 9.00, 0.00, '7,3,10,5,8,4,2,3,5,6,4,2,0,10,5', '', '', '0', 962.20, NULL, '2023-10-19 16:05:19', 'false', 'false'),
(11, 1, 1, 9.00, 0.00, '8,7,1,4,5,2,1,2,9,5,4,0,11,7,2', '', '', '0', 953.20, NULL, '2023-10-19 16:05:22', 'false', 'false'),
(12, 1, 1, 9.00, 6.90, '9,0,12,0,1,4,7,11,3,1,6,5,7,6,8', '0,15', 'right3,left3', '2', 951.10, NULL, '2023-10-19 16:05:25', 'false', 'false'),
(13, 2, 0, 5.00, 0.00, '0,1,2,3,4', '1', 'ZXFGnqiKpH2qt', '0', 995.00, NULL, '2023-10-19 16:12:32', 'false', 'false'),
(14, 4, 0, 0.00, 0.00, '3,4', '0', 'Kk7scNaFLKJdx', '0', 0.00, NULL, '2023-10-23 03:46:00', 'false', 'false'),
(15, 4, 1, 0.00, 0.00, '9,4,0,6,9,10,0,7,11,9,2,0,2,5,3', '', '', '0', 0.00, NULL, '2023-10-23 03:46:51', 'false', 'false'),
(16, 4, 1, 0.00, 0.00, '0,7,3,1,3,8,5,3,1,6,4,5,5,8,3', '', '', '0', 0.00, NULL, '2023-10-23 03:46:54', 'false', 'false'),
(17, 4, 1, 0.00, 0.00, '4,12,0,8,4,0,10,1,7,7,1,8,0,9,4', '', '', '0', 0.00, NULL, '2023-10-23 03:46:58', 'false', 'false'),
(18, 4, 1, 0.00, 0.00, '3,8,2,10,12,1,5,4,0,6,2,5,8,4,12', '', '', '0', 0.00, NULL, '2023-10-23 03:47:04', 'false', 'false'),
(19, 4, 1, 0.00, 0.00, '12,3,6,8,3,10,0,4,1,12,2,1,5,6,5', '', '', '0', 0.00, NULL, '2023-10-23 03:47:04', 'false', 'false'),
(20, 4, 1, 0.00, 0.00, '3,0,7,10,1,2,2,5,1,4,1,10,5,8,4', '', '', '0', 0.00, NULL, '2023-10-23 03:47:04', 'false', 'false'),
(21, 4, 1, 0.00, 0.00, '3,8,2,2,9,5,9,5,1,2,5,4,4,5,6', '', '', '0', 0.00, NULL, '2023-10-23 03:47:04', 'false', 'false'),
(22, 4, 1, 0.00, 0.00, '4,2,0,5,4,2,1,4,3,2,6,0,8,4,5', '', '', '0', 0.00, NULL, '2023-10-23 03:47:04', 'false', 'false'),
(23, 4, 1, 0.00, 0.00, '5,0,1,1,0,5,5,7,10,2,1,9,6,10,8', '', '', '0', 0.00, NULL, '2023-10-23 03:47:04', 'false', 'false'),
(24, 4, 1, 0.00, 0.00, '0,4,10,9,5,7,1,4,3,4,2,5,5,6,7', '', '', '0', 0.00, NULL, '2023-10-23 03:47:04', 'false', 'false'),
(25, 4, 1, 0.00, 0.00, '9,12,6,3,4,9,12,0,2,9,12,2,3,10,5', '', '', '0', 0.00, NULL, '2023-10-23 03:47:04', 'false', 'false'),
(26, 4, 1, 0.00, 0.00, '1,3,8,5,9,3,12,3,4,1,6,5,5,8,4', '', '', '0', 0.00, NULL, '2023-10-23 03:47:04', 'false', 'false'),
(27, 4, 1, 0.00, 0.00, '9,0,3,8,0,5,5,1,7,6,5,3,5,8,4', '', '', '0', 0.00, NULL, '2023-10-23 03:47:04', 'false', 'false'),
(28, 4, 3, 0.00, 0.00, '4,2,0,5,4,1,3,4,5,5,11,6,3,8,11', '', '', '0', 0.00, NULL, '2023-10-23 03:48:33', 'false', 'false'),
(29, 4, 3, 0.00, 0.00, '10,3,9,0,12,1,0,4,1,0,1,5,6,10,8', '', '', '0', 0.00, NULL, '2023-10-23 03:48:33', 'false', 'false'),
(30, 4, 3, 0.00, 0.00, '2,9,0,5,0,4,0,12,2,10,3,9,2,3,10', '', '', '0', 0.00, NULL, '2023-10-23 03:48:33', 'false', 'false'),
(31, 4, 3, 0.00, 0.00, '6,5,4,8,0,5,2,9,5,5,0,8,12,2,3', '', '', '0', 0.00, NULL, '2023-10-23 03:48:33', 'false', 'false'),
(32, 4, 3, 0.00, 0.00, '4,7,10,2,6,2,1,7,6,5,5,10,7,8,2', '', '', '0', 0.00, NULL, '2023-10-23 03:48:33', 'false', 'false'),
(33, 4, 3, 0.00, 0.00, '4,10,5,6,5,4,6,3,4,4,5,11,10,4,5', '', '', '0', 0.00, NULL, '2023-10-23 03:48:33', 'false', 'false'),
(34, 4, 3, 0.00, 0.00, '2,2,9,6,2,9,1,0,3,1,9,0,8,2,7', '', '', '0', 0.00, NULL, '2023-10-23 03:48:33', 'false', 'false'),
(35, 4, 3, 0.00, 0.00, '0,5,8,7,6,1,2,4,1,1,9,0,4,5,6', '', '', '0', 0.00, NULL, '2023-10-23 03:48:33', 'false', 'false'),
(36, 4, 3, 0.00, 0.00, '7,5,4,1,2,5,5,1,7,3,4,5,9,1,6', '', '', '0', 0.00, NULL, '2023-10-23 03:48:33', 'false', 'false'),
(37, 4, 3, 0.00, 0.00, '4,5,0,0,12,1,12,0,2,5,3,10,8,4,12', '', '', '0', 0.00, NULL, '2023-10-23 03:48:33', 'false', 'false'),
(38, 4, 2, 0.00, 0.00, '6,8,4,0,3,6,0,5,12,3,10,12,5,8,3', '', '', '0', 0.00, NULL, '2023-10-23 03:49:36', 'false', 'false'),
(39, 4, 2, 0.00, 0.00, '3,4,8,4,3,1,0,8,5,12,4,2,7,5,9', '', '', '0', 0.00, NULL, '2023-10-23 03:49:39', 'false', 'false'),
(40, 4, 2, 0.00, 0.00, '10,3,9,4,3,9,3,5,8,0,3,1,2,3,8', '11', '', '1', 0.00, NULL, '2023-10-23 03:50:33', 'false', 'false'),
(41, 4, 2, 0.00, 0.00, '7,0,4,2,0,12,1,9,6,5,11,6,6,7,5', '', '', '0', 0.00, NULL, '2023-10-23 03:50:33', 'false', 'false'),
(42, 4, 2, 0.00, 0.00, '4,0,3,10,1,2,0,11,1,9,0,3,7,5,8', '', '', '0', 0.00, NULL, '2023-10-23 03:50:33', 'false', 'false'),
(43, 4, 2, 0.00, 0.00, '5,1,12,2,9,5,0,2,1,10,4,2,2,3,8', '', '', '0', 0.00, NULL, '2023-10-23 03:50:33', 'false', 'false'),
(44, 4, 2, 0.00, 0.00, '4,2,1,9,12,8,10,7,2,6,0,1,5,6,10', '', '', '0', 0.00, NULL, '2023-10-23 03:50:33', 'false', 'false'),
(45, 4, 2, 0.00, 0.00, '8,10,7,12,1,2,4,0,5,0,4,1,6,7,5', '', '', '0', 0.00, NULL, '2023-10-23 03:50:33', 'false', 'false'),
(46, 4, 2, 0.00, 0.00, '4,2,0,11,0,1,0,12,2,9,12,2,7,5,3', '', '', '0', 0.00, NULL, '2023-10-23 03:50:33', 'false', 'false'),
(47, 4, 2, 0.00, 0.00, '5,9,2,5,4,2,5,1,9,1,3,0,5,10,4', '', '', '0', 0.00, NULL, '2023-10-23 03:50:33', 'false', 'false'),
(48, 4, 2, 0.00, 0.00, '0,4,10,12,1,8,7,6,3,1,9,0,10,8,9', '', '', '0', 0.00, NULL, '2023-10-23 03:50:33', 'false', 'false'),
(49, 4, 2, 0.00, 0.00, '0,4,0,2,6,2,12,3,4,12,2,1,10,8,9', '', '', '0', 0.00, NULL, '2023-10-23 03:50:33', 'false', 'false'),
(50, 4, 3, 0.00, 0.00, '8,5,2,0,9,1,5,10,2,2,3,1,6,0,10', '', '', '0', 0.00, NULL, '2023-10-23 03:51:17', 'false', 'false'),
(51, 4, 4, 0.00, 0.00, '5,12,4,0,7,2,9,4,6,5,1,4,8,6,11', '', '', '0', 0.00, NULL, '2023-10-23 03:51:17', 'false', 'false'),
(52, 4, 4, 0.00, 0.00, '1,5,11,5,6,4,9,3,10,6,5,0,5,2,11', '', '', '0', 0.00, NULL, '2023-10-23 03:51:22', 'false', 'false'),
(53, 4, 3, 0.00, 0.00, '7,0,5,8,4,3,5,12,8,5,4,0,12,6,2', '', '', '0', 0.00, NULL, '2023-10-23 03:51:22', 'false', 'false'),
(54, 4, 3, 0.00, 0.00, '3,4,8,11,6,0,0,7,11,5,1,6,3,5,8', '', '', '0', 0.00, NULL, '2023-10-23 03:51:26', 'false', 'false'),
(55, 4, 4, 0.00, 0.00, '5,9,0,8,3,5,10,1,7,11,9,2,9,5,11', '', '', '0', 0.00, NULL, '2023-10-23 03:51:26', 'false', 'false'),
(56, 4, 4, 0.00, 0.00, '10,4,3,6,9,10,0,1,2,5,8,0,5,8,0', '', '', '0', 0.00, NULL, '2023-10-23 03:51:28', 'false', 'false'),
(57, 4, 3, 0.00, 0.00, '6,2,5,6,12,5,10,5,1,4,5,9,6,0,10', '', '', '0', 0.00, NULL, '2023-10-23 03:51:28', 'false', 'false'),
(58, 4, 3, 0.00, 0.00, '11,8,7,2,4,5,2,5,4,4,6,2,6,0,10', '', '', '0', 0.00, NULL, '2023-10-23 03:51:31', 'false', 'false'),
(59, 4, 4, 0.00, 0.00, '1,6,3,2,8,0,4,2,5,4,2,5,6,0,10', '', '', '0', 0.00, NULL, '2023-10-23 03:51:31', 'false', 'false'),
(60, 4, 4, 0.00, 0.00, '8,4,10,2,4,7,5,1,8,5,8,0,8,5,2', '', '', '0', 0.00, NULL, '2023-10-23 03:51:35', 'false', 'false'),
(61, 4, 3, 0.00, 0.00, '7,3,10,2,1,3,3,10,6,3,1,9,6,8,5', '', '', '0', 0.00, NULL, '2023-10-23 03:51:35', 'false', 'false'),
(62, 4, 4, 0.00, 0.00, '4,0,5,5,7,3,6,8,2,1,9,0,11,2,3', '', '', '0', 0.00, NULL, '2023-10-23 03:51:41', 'false', 'false'),
(63, 4, 4, 0.00, 0.00, '5,4,2,10,1,2,5,9,10,1,4,2,2,3,8', '', '', '0', 0.00, NULL, '2023-10-23 03:51:41', 'false', 'false'),
(64, 4, 4, 0.00, 0.00, '0,3,0,0,5,4,5,12,0,5,11,6,4,5,3', '', '', '0', 0.00, NULL, '2023-10-23 03:51:41', 'false', 'false'),
(65, 4, 4, 0.00, 0.00, '8,7,5,8,3,10,5,10,7,9,6,0,10,7,8', '', '', '0', 0.00, NULL, '2023-10-23 03:51:41', 'false', 'false'),
(66, 4, 4, 0.00, 0.00, '1,12,10,6,1,2,10,2,5,12,1,6,4,5,6', '', '', '0', 0.00, NULL, '2023-10-23 03:51:41', 'false', 'false'),
(67, 4, 4, 0.00, 0.00, '8,7,5,6,1,2,5,9,8,11,2,4,7,4,5', '', '', '0', 0.00, NULL, '2023-10-23 03:51:41', 'false', 'false'),
(68, 4, 4, 0.00, 0.00, '2,7,0,12,1,8,9,8,7,4,7,5,9,10,7', '', '', '0', 0.00, NULL, '2023-10-23 03:51:41', 'false', 'false'),
(69, 4, 4, 0.00, 0.00, '0,5,4,2,0,12,8,7,5,4,1,10,5,6,7', '', '', '0', 0.00, NULL, '2023-10-23 03:51:41', 'false', 'false'),
(70, 4, 4, 0.00, 0.00, '7,10,5,9,12,8,12,3,4,2,1,4,3,10,5', '', '', '0', 0.00, NULL, '2023-10-23 03:51:41', 'false', 'false'),
(71, 4, 4, 0.00, 0.00, '4,5,0,4,10,11,7,5,4,0,8,11,9,1,6', '', '', '0', 0.00, NULL, '2023-10-23 03:51:41', 'false', 'false'),
(72, 4, 4, 0.00, 0.00, '8,1,12,9,5,0,3,6,12,5,0,1,8,4,12', '', '', '0', 0.00, NULL, '2023-10-23 03:52:10', 'false', 'false'),
(73, 4, 4, 0.00, 0.00, '5,0,1,1,0,2,1,0,12,5,6,9,1,6,7', '', '', '0', 0.00, NULL, '2023-10-23 03:52:10', 'false', 'false'),
(74, 4, 4, 0.00, 0.00, '4,7,10,10,11,0,7,5,12,0,3,1,4,5,3', '', '', '0', 0.00, NULL, '2023-10-23 03:52:10', 'false', 'false'),
(75, 4, 4, 0.00, 0.00, '0,3,1,1,2,8,1,0,3,4,2,1,6,5,11', '', '', '0', 0.00, NULL, '2023-10-23 03:52:10', 'false', 'false'),
(76, 4, 4, 0.00, 0.00, '10,6,9,3,4,0,5,2,7,5,9,4,1,7,9', '', '', '0', 0.00, NULL, '2023-10-23 03:52:10', 'false', 'false'),
(77, 4, 4, 0.00, 0.00, '8,7,5,6,9,5,4,5,12,2,1,4,11,2,3', '', '', '0', 0.00, NULL, '2023-10-23 03:52:10', 'false', 'false'),
(78, 4, 4, 0.00, 0.00, '6,5,4,4,2,3,4,1,0,7,8,6,5,8,9', '', '', '0', 0.00, NULL, '2023-10-23 03:52:10', 'false', 'false'),
(79, 4, 4, 0.00, 0.00, '5,4,2,4,9,12,1,7,6,1,0,4,0,5,8', '', '', '0', 0.00, NULL, '2023-10-23 03:52:10', 'false', 'false'),
(80, 4, 4, 0.00, 0.00, '6,4,5,1,8,0,3,0,4,3,1,5,7,5,8', '', '', '0', 0.00, NULL, '2023-10-23 03:52:10', 'false', 'false'),
(81, 4, 4, 0.00, 0.00, '10,5,8,12,8,3,0,12,2,6,0,1,11,2,3', '', '', '0', 0.00, NULL, '2023-10-23 03:52:10', 'false', 'false'),
(82, 4, 0, 20.00, 56.40, '2', '2,0,3', '5rrkRJ2JaIrxLFi', '2', 980.00, NULL, '2023-10-23 03:52:40', 'false', 'false'),
(83, 5, 6, 20.00, 0.00, '2', '3,1,0', '2gLpzNTxXyGDPZs', '2', 1165.60, NULL, '2023-10-23 17:18:32', 'false', 'false'),
(84, 5, 6, 20.00, 0.00, '0', '0', 'oKoW3s8rFNPifQV', '0', 1205.60, NULL, '2023-10-23 17:31:24', 'false', 'false'),
(85, 5, 6, 20.00, 0.00, '2', '0,1,3', 'BMAVHLUBzXPnUtK', '1', 1185.60, NULL, '2023-10-23 17:31:46', 'false', 'false'),
(86, 5, 6, 10.00, 0.00, '0', '1,3,2', 'WQzoMvNqhFPPG1K', '2', 1172.00, NULL, '2023-10-23 17:32:04', 'false', 'false'),
(87, 5, 6, 20.00, 56.40, '2', '1,0,2', 'Cqq79ng76ODDPZj', '2', 1145.60, NULL, '2023-10-23 17:47:49', 'false', 'false'),
(88, 5, 6, 20.00, 0.00, '0', '0', 'U3bQGGeMZUy3ECE', '0', 1202.00, NULL, '2023-10-23 17:52:23', 'false', 'false'),
(89, 5, 6, 20.00, 0.00, '2', '0,3', 'hzYUbAiUwzDtgpI', '4', 1182.00, NULL, '2023-10-23 17:54:21', 'false', 'false'),
(90, 5, 6, 20.00, 0.00, '3', '2,0,1', '1SaihB0ZLcsMCYQ', '3', 1369.40, NULL, '2023-10-23 17:54:37', 'false', 'false'),
(91, 4, 4, 0.00, 0.00, '7,5,1,3,5,4,1,6,8,4,5,6,3,10,5', '', '', '0', 0.00, NULL, '2023-10-24 10:58:53', 'false', 'false'),
(92, 4, 4, 0.00, 0.00, '0,3,0,2,7,6,6,8,2,5,2,1,6,5,11', '', '', '0', 0.00, NULL, '2023-10-24 10:58:54', 'false', 'false'),
(93, 4, 4, 0.00, 0.00, '3,8,2,5,3,4,0,5,8,1,3,0,11,2,3', '', '', '0', 0.00, NULL, '2023-10-24 10:58:54', 'false', 'false'),
(94, 4, 4, 0.00, 0.00, '4,2,2,10,2,6,3,4,0,2,1,4,5,11,2', '', '', '0', 0.00, NULL, '2023-10-24 10:58:54', 'false', 'false'),
(95, 4, 4, 0.00, 0.00, '6,4,2,1,2,7,1,7,5,11,2,4,6,7,4', '', '', '0', 0.00, NULL, '2023-10-24 10:58:54', 'false', 'false'),
(96, 4, 4, 0.00, 0.00, '0,3,8,0,12,1,0,2,1,9,6,0,3,8,4', '', '', '0', 0.00, NULL, '2023-10-24 10:58:54', 'false', 'false'),
(97, 4, 4, 0.00, 0.00, '4,2,1,1,0,2,10,1,4,5,5,10,4,5,6', '', '', '0', 0.00, NULL, '2023-10-24 10:58:54', 'false', 'false'),
(98, 4, 4, 0.00, 0.00, '5,0,4,9,5,0,4,5,12,1,10,3,10,7,8', '', '', '0', 0.00, NULL, '2023-10-24 10:58:54', 'false', 'false'),
(99, 4, 4, 0.00, 0.00, '3,9,12,4,0,5,6,10,0,9,6,0,10,5,6', '', '', '0', 0.00, NULL, '2023-10-24 10:58:54', 'false', 'false'),
(100, 4, 4, 0.00, 0.00, '10,3,9,3,4,9,7,6,3,10,7,8,10,7,8', '', '', '0', 0.00, NULL, '2023-10-24 10:58:54', 'false', 'false'),
(101, 4, 3, 0.00, 0.00, '3,10,1,12,2,1,1,2,9,0,4,3,11,7,5', '', '', '0', 0.00, NULL, '2023-10-24 11:10:21', 'false', 'false'),
(102, 4, 3, 0.00, 0.00, '4,10,2,3,6,5,5,10,2,7,2,5,5,11,6', '', '', '0', 0.00, NULL, '2023-10-24 11:10:25', 'false', 'false'),
(103, 4, 3, 0.00, 0.00, '3,4,8,8,0,5,0,6,5,1,5,3,11,7,2', '', '', '0', 0.00, NULL, '2023-10-24 11:10:29', 'false', 'false'),
(104, 4, 3, 0.00, 0.00, '1,5,11,4,0,10,10,5,1,3,5,1,5,4,9', '', '', '0', 0.00, NULL, '2023-10-24 11:10:36', 'false', 'false'),
(105, 4, 3, 0.00, 0.00, '4,3,2,0,3,6,0,7,11,0,3,7,7,5,9', '', '', '0', 0.00, NULL, '2023-10-24 11:10:41', 'false', 'false'),
(106, 4, 3, 0.00, 0.00, '12,3,6,4,9,12,0,2,4,4,1,10,0,5,8', '', '', '0', 0.00, NULL, '2023-10-24 11:10:46', 'false', 'false'),
(107, 4, 3, 0.00, 0.00, '3,0,5,11,0,1,6,8,2,2,1,0,11,2,3', '', '', '0', 0.00, NULL, '2023-10-24 11:10:46', 'false', 'false'),
(108, 4, 3, 0.00, 0.00, '3,8,2,12,8,3,3,4,0,2,8,2,10,7,8', '', '', '0', 0.00, NULL, '2023-10-24 11:10:46', 'false', 'false'),
(109, 4, 3, 0.00, 0.00, '2,8,10,10,1,2,3,1,7,5,0,8,11,0,5', '', '', '0', 0.00, NULL, '2023-10-24 11:10:46', 'false', 'false'),
(110, 4, 3, 0.00, 0.00, '5,0,4,6,2,9,5,8,2,5,11,6,4,12,2', '', '', '0', 0.00, NULL, '2023-10-24 11:10:46', 'false', 'false'),
(111, 4, 3, 0.00, 0.00, '4,5,0,4,2,3,5,8,2,5,0,1,9,1,6', '', '', '0', 0.00, NULL, '2023-10-24 11:10:46', 'false', 'false'),
(112, 4, 3, 0.00, 0.00, '2,9,0,9,5,7,5,12,0,9,6,0,8,2,7', '', '', '0', 0.00, NULL, '2023-10-24 11:10:46', 'false', 'false'),
(113, 4, 3, 0.00, 0.00, '9,2,8,5,7,8,4,1,0,12,1,6,8,4,12', '', '', '0', 0.00, NULL, '2023-10-24 11:10:46', 'false', 'false'),
(114, 4, 3, 0.00, 0.00, '9,0,3,0,5,6,5,2,7,2,1,4,7,5,3', '', '', '0', 0.00, NULL, '2023-10-24 11:10:46', 'false', 'false'),
(115, 4, 3, 0.00, 0.00, '9,3,0,12,8,3,0,2,4,1,5,3,6,7,4', '', '', '0', 0.00, NULL, '2023-10-24 11:10:46', 'false', 'false'),
(116, 4, 1, 0.00, 0.00, '7,0,5,10,5,11,4,5,0,12,7,1,5,6,10', '', '', '0', 0.00, NULL, '2023-10-24 11:12:00', 'false', 'false'),
(117, 4, 1, 0.00, 0.00, '5,0,1,0,6,5,6,5,3,9,4,6,11,6,0', '', '', '0', 0.00, NULL, '2023-10-24 11:12:06', 'false', 'false'),
(118, 4, 1, 0.00, 0.00, '7,4,8,2,6,9,9,4,6,1,11,9,3,4,9', '', '', '0', 0.00, NULL, '2023-10-24 11:12:10', 'false', 'false'),
(119, 4, 1, 0.00, 0.00, '8,4,10,4,5,2,4,10,1,5,1,6,4,9,5', '', '', '0', 0.00, NULL, '2023-10-24 11:12:13', 'false', 'false'),
(120, 4, 1, 0.00, 0.00, '6,3,4,1,3,8,9,4,8,0,4,3,9,3,1', '', '', '0', 0.00, NULL, '2023-10-24 11:12:16', 'false', 'false'),
(121, 4, 1, 0.00, 0.00, '3,6,4,3,4,0,5,8,2,4,5,6,5,8,9', '', '', '0', 0.00, NULL, '2023-10-24 11:12:22', 'false', 'false'),
(122, 4, 1, 0.00, 0.00, '4,0,5,5,7,8,2,3,5,10,4,2,5,9,11', '', '', '0', 0.00, NULL, '2023-10-24 11:12:22', 'false', 'false'),
(123, 4, 1, 0.00, 0.00, '6,4,5,8,5,9,2,3,5,12,2,1,3,10,5', '', '', '0', 0.00, NULL, '2023-10-24 11:12:22', 'false', 'false'),
(124, 4, 1, 0.00, 0.00, '8,10,7,8,5,0,4,5,12,2,4,5,10,4,5', '', '', '0', 0.00, NULL, '2023-10-24 11:12:22', 'false', 'false'),
(125, 4, 1, 0.00, 0.00, '12,6,4,0,12,1,2,5,9,5,0,1,2,7,5', '', '', '0', 0.00, NULL, '2023-10-24 11:12:22', 'false', 'false'),
(126, 4, 1, 0.00, 0.00, '5,1,12,7,3,5,4,0,5,6,9,3,8,9,10', '', '', '0', 0.00, NULL, '2023-10-24 11:12:22', 'false', 'false'),
(127, 4, 1, 0.00, 0.00, '8,1,10,11,0,1,2,1,6,5,6,9,3,8,11', '', '', '0', 0.00, NULL, '2023-10-24 11:12:22', 'false', 'false'),
(128, 4, 1, 0.00, 0.00, '4,0,3,4,2,3,5,7,10,12,2,1,2,3,8', '', '', '0', 0.00, NULL, '2023-10-24 11:12:22', 'false', 'false'),
(129, 4, 1, 0.00, 0.00, '8,5,9,5,7,3,0,3,4,2,5,4,5,6,7', '', '', '0', 0.00, NULL, '2023-10-24 11:12:22', 'false', 'false'),
(130, 4, 1, 0.00, 0.00, '3,1,11,9,5,0,12,0,2,0,4,1,10,4,5', '', '', '0', 0.00, NULL, '2023-10-24 11:12:22', 'false', 'false'),
(131, 4, 3, 0.00, 0.00, '8,7,9,5,0,7,12,8,2,9,0,4,8,5,2', '', '', '0', 0.00, NULL, '2023-10-24 12:17:04', 'false', 'false'),
(132, 4, 4, 0.00, 0.00, '0,5,3,0,10,5,4,7,0,11,9,2,10,1,4', '', '', '0', 0.00, NULL, '2023-10-24 12:17:04', 'false', 'false'),
(133, 4, 4, 0.00, 0.00, '5,0,1,5,10,4,0,8,5,7,10,5,5,12,6', '', '', '0', 0.00, NULL, '2023-10-24 12:17:08', 'false', 'false'),
(134, 4, 3, 0.00, 0.00, '12,4,3,3,1,10,5,0,9,8,6,4,7,5,4', '', '', '0', 0.00, NULL, '2023-10-24 12:17:08', 'false', 'false'),
(135, 3, 3, 0.00, 0.00, '2,8,7,12,5,8,4,8,1,10,7,2,11,6,0', '', '', '0', 0.00, NULL, '2023-10-24 13:38:31', 'false', 'false'),
(136, 3, 3, 0.00, 0.00, '7,3,10,11,6,0,5,3,1,0,3,7,6,8,5', '', '', '0', 0.00, NULL, '2023-10-24 13:38:38', 'false', 'false'),
(137, 3, 3, 0.00, 0.00, '7,1,0,2,1,3,10,1,7,9,4,6,2,11,7', '', '', '0', 0.00, NULL, '2023-10-24 13:39:15', 'false', 'false'),
(138, 3, 3, 0.00, 0.00, '2,0,9,10,5,11,4,6,5,3,9,0,5,12,6', '', '', '0', 0.00, NULL, '2023-10-24 13:39:22', 'false', 'false'),
(139, 3, 3, 0.00, 0.00, '3,5,9,0,6,5,7,0,2,6,2,0,0,10,5', '', '', '0', 0.00, NULL, '2023-10-24 13:39:25', 'false', 'false'),
(140, 2, 0, 1.00, 0.00, '1', '3,2,0', 'VY6zEXrui7rYKxP', '1', 999.00, NULL, '2023-10-25 10:11:43', 'false', 'false'),
(141, 5, 6, 10.00, 0.00, '3', '0', 'SCxRQkCQIwDjIUr', '7', 1162.00, NULL, '2023-10-25 10:12:36', 'false', 'false'),
(142, 5, 6, 10.00, 0.00, '3', '1,0', 'vKCd8at7FzW5cTL', '4', 17789.91, NULL, '2023-10-25 10:14:31', 'false', 'false'),
(143, 6, 0, 25.00, 125.00, '0', '2,0,3', 'HEUehmXkY4ZnPBf', '3', 9975.00, NULL, '2023-10-25 10:20:46', 'false', 'false'),
(144, 2, 6, 1.00, 4.86, '3', '2,3,1', 'Y3ymzOtr3gsDAEd', '2', 998.00, NULL, '2023-10-25 10:23:16', 'false', 'false'),
(145, 6, 6, 10.00, 0.00, '0', '1,3,2', '3nbqIGXzdYAlsMU', '2', 10090.00, NULL, '2023-10-25 10:23:18', 'false', 'false'),
(146, 6, 6, 10.00, 12.00, '3', '3,2,0', '9rB6NhSD9g3Lwpg', '1', 10080.00, NULL, '2023-10-25 10:24:08', 'false', 'false'),
(147, 2, 6, 2.00, 5.64, '3', '3,2,1', 'rH2kXlZY4vXS5lI', '2', 1000.86, NULL, '2023-10-25 10:25:42', 'false', 'false'),
(148, 6, 6, 1200.00, 0.00, '0', '0', 'IDrCz4nmAROYDOO', '0', 10092.00, NULL, '2023-10-25 10:25:47', 'false', 'false'),
(149, 6, 6, 10.00, 888.20, '3', '3,0,1', 'e0ukgLmiDMcbL0Y', '3', 10082.00, NULL, '2023-10-25 10:26:16', 'false', 'false'),
(150, 2, 6, 5.00, 0.00, '1', '0,3,2', 'iW8svoRxde1E3P8', '1', 1001.50, NULL, '2023-10-25 10:26:49', 'false', 'false'),
(151, 6, 6, 200.00, 240.00, '3', '3,0,1', 'U1JAP8SzjyljINu', '1', 10770.20, NULL, '2023-10-25 10:28:51', 'false', 'false'),
(152, 6, 6, 10.00, 0.00, '0', '3,2,1', '4PwPTGz4YUCj7l7', '1', 11000.20, NULL, '2023-10-25 10:29:35', 'false', 'false'),
(153, 2, 6, 1.00, 0.00, '0', '1,2,3', '8OoDXFIt9oiB8eI', '3', 1000.50, NULL, '2023-10-25 13:45:56', 'false', 'false'),
(154, 6, 6, 10.00, 0.00, '3', '1,2,0', 'v3bUVO5TjDUgaLN', '2', 10990.20, NULL, '2023-10-25 14:41:46', 'false', 'false'),
(155, 6, 6, 10.00, 28.20, '1', '2,3,1', 'W1rzXbm2TNotWWG', '2', 10980.20, NULL, '2023-10-25 14:42:19', 'false', 'false'),
(156, 6, 6, 10.00, 12.00, '2', '2,0,1', 'TFKKNg7Omu4Vr6A', '1', 10998.40, NULL, '2023-10-25 14:43:04', 'false', 'false'),
(157, 6, 6, 10.00, 0.00, '0', '0', 'vK2NaFHz5R9vBiC', '0', 11010.40, NULL, '2023-10-25 14:43:47', 'false', 'false'),
(158, 6, 6, 5.00, 6.00, '0', '0,3,1', 'ewnoPfe1Bk6dYYo', '1', 11005.40, NULL, '2023-10-25 14:44:24', 'false', 'false'),
(159, 6, 6, 3.00, 8.46, '0', '3,0,2', 'QIaKvzUf0S9Fc6B', '2', 11008.40, NULL, '2023-10-25 14:44:59', 'false', 'false'),
(160, 6, 6, 10.00, 0.00, '1', '3,0,2', 'Y3Rtncdr0TrHLtX', '2', 11006.86, NULL, '2023-10-25 15:16:00', 'false', 'false'),
(161, 6, 6, 10.00, 21.80, '0', '1,2,0', 'xXkSvyt1mSnXdtC', '3', 10996.86, NULL, '2023-10-25 15:16:35', 'false', 'false'),
(162, 6, 6, 10.00, 28.20, '1', '1,3,0', 'r2iWpZcVl2Gvd7z', '2', 11008.66, NULL, '2023-10-25 15:17:54', 'false', 'false'),
(163, 6, 6, 10.00, 0.00, '0', '3,2', 'jNLcAAIO1eqrb7E', '4', 11026.86, NULL, '2023-10-25 15:18:39', 'false', 'false'),
(164, 6, 6, 10.00, 50.00, '1', '0,1,2', 'FUr01tEmG3JAD6t', '3', 11016.86, NULL, '2023-10-25 15:43:53', 'false', 'false'),
(165, 6, 6, 10.00, 0.00, '1', '0,3,2', '0jwJWVXDvna04gu', '2', 11056.86, NULL, '2023-10-25 15:45:02', 'false', 'false'),
(166, 6, 6, 10.00, 0.00, '3', '1,2,0', 'YYXHvOiuODZME2g', '2', 11046.86, NULL, '2023-10-25 15:45:25', 'false', 'false'),
(167, 6, 6, 10.00, 0.00, '1', '0,3,2', '0ugvJGxTEobwvfA', '2', 11036.86, NULL, '2023-10-25 15:45:59', 'false', 'false'),
(168, 6, 6, 10.00, 38.00, '1', '0,1,3', 'xqOOxXPg6Y6xZYb', '3', 11026.86, NULL, '2023-10-25 15:46:28', 'false', 'false'),
(169, 6, 6, 10.00, 28.20, '2', '2,0,3', 'yCyOccVmUO9kH24', '2', 11054.86, NULL, '2023-10-25 15:47:15', 'false', 'false'),
(170, 6, 6, 10.00, 0.00, '3', '0,1,3', 'Fb0b4C0QZ3IImeL', '1', 11073.06, NULL, '2023-10-25 15:48:15', 'false', 'false'),
(171, 6, 6, 10.00, 0.00, '0', '1,0,3', 'W9rsugHlxdG7H9X', '1', 11063.06, NULL, '2023-10-25 15:49:21', 'false', 'false'),
(172, 6, 6, 10.00, 12.00, '3', '0,3,1', 'Lsu6npdSaOaqvh3', '1', 11053.06, NULL, '2023-10-25 15:49:50', 'false', 'false'),
(173, 2, 6, 1.00, 0.00, '1', '3,2', 'Ypt4S77ucGqu4CS', '6', 1229.34, NULL, '2023-10-25 17:23:07', 'false', 'false'),
(174, 2, 0, 5.00, 9.20, '0,1', '1', '8NYDV5T6YmnCK', '0', 1004.70, NULL, '2023-10-25 21:33:51', 'false', 'false'),
(175, 2, 0, 0.00, 0.00, '0,1,2,3,4', '0', 'R2GercPzhnRex', '0', 0.00, NULL, '2023-10-25 21:34:23', 'false', 'false'),
(176, 6, 6, 10.00, 28.20, '1', '3,1,0', 'o3qHFqyCBYFJwVz', '2', 11055.06, NULL, '2023-10-26 05:16:38', 'false', 'false'),
(177, 6, 6, 10.00, 0.00, '2', '1,0,2', 'S2exGIz9jmeLoSK', '2', 11073.26, NULL, '2023-10-26 05:17:17', 'false', 'false'),
(178, 6, 6, 10.00, 50.00, '0', '1,3,0', 'QIBO5A9BcudkvSl', '3', 11063.26, NULL, '2023-10-26 06:12:15', 'false', 'false'),
(179, 6, 6, 10.00, 0.00, '2', '1,3,0', 's4WyA9Qw4qDXXad', '1', 11103.26, NULL, '2023-10-26 06:21:08', 'false', 'false'),
(180, 6, 6, 10.00, 38.00, '1', '1,2,3', 'HcVBapCXcEeAygJ', '3', 11093.26, NULL, '2023-10-26 06:22:09', 'false', 'false'),
(181, 6, 6, 10.00, 12.00, '3', '3,1,2', 'ww0nBG2VsYJsosg', '1', 11121.26, NULL, '2023-10-26 06:28:11', 'false', 'false'),
(182, 6, 6, 10.00, 0.00, '1', '2,0', 'ojPGUYSGtX6nklw', '4', 11123.26, NULL, '2023-10-26 06:28:55', 'false', 'false'),
(183, 6, 6, 10.00, 0.00, '3', '0,1,2', 'Vf1Dbd9nh1XKdhe', '2', 11113.26, NULL, '2023-10-26 07:25:43', 'false', 'false'),
(184, 6, 6, 10.00, 0.00, '3', '0,3', 'WHJjpW9bhbFIC4x', '4', 11103.26, NULL, '2023-10-26 07:26:11', 'false', 'false'),
(185, 6, 6, 10.00, 0.00, '1', '2,3,0', 'hANjdfLLStREbQH', '1', 11093.26, NULL, '2023-10-26 07:27:16', 'false', 'false'),
(186, 6, 6, 10.00, 0.00, '2', '2,0,1', 'PSzTMLJjmBYWmrB', '1', 11083.26, NULL, '2023-10-26 07:28:38', 'false', 'false'),
(187, 6, 6, 10.00, 0.00, '1', '3,0,2', '7psamYUgQGjJZYN', '2', 11073.26, NULL, '2023-10-26 07:29:03', 'false', 'false'),
(188, 6, 6, 10.00, 0.00, '0', '0,1,3', 'DrAAJCnzy147qiJ', '1', 11063.26, NULL, '2023-10-26 07:29:50', 'false', 'false'),
(189, 6, 6, 10.00, 0.00, '3', '3,2,0', 'pi94z1EvxEkBIUN', '3', 11053.26, NULL, '2023-10-26 07:30:35', 'false', 'false'),
(190, 6, 6, 10.00, 12.00, '1', '1,0,3', 'nIfrZXiTd4yvp1E', '1', 11043.26, NULL, '2023-10-26 07:32:00', 'false', 'false'),
(191, 6, 6, 10.00, 28.20, '2', '3,2,1', 'VA3hxM4272yKlDz', '2', 11045.26, NULL, '2023-10-26 08:00:40', 'false', 'false'),
(192, 6, 6, 10.00, 28.20, '3', '1,2,3', 'GzrHKcNDou5sXD7', '2', 11063.46, NULL, '2023-10-26 08:01:16', 'false', 'false'),
(193, 6, 6, 10.00, 50.00, '0', '0,1,2', '1IqxWf9fQSPB2fT', '3', 11081.66, NULL, '2023-10-26 08:02:34', 'false', 'false'),
(194, 6, 6, 10.00, 0.00, '3', '0,1,2', 'UcGxxvSXVXGVUpa', '1', 11121.66, NULL, '2023-10-26 08:03:28', 'false', 'false'),
(195, 6, 6, 10.00, 0.00, '2', '3,1,0', 'QccSYNMktG4BAdo', '1', 11111.66, NULL, '2023-10-26 08:05:35', 'false', 'false'),
(196, 6, 6, 10.00, 16.20, '1', '1,0,3', 'xbkhwMuXjMBwi0R', '2', 11101.66, NULL, '2023-10-26 08:05:53', 'false', 'false'),
(197, 6, 6, 10.00, 0.00, '3', '2,0,1', 'Q7CCm3khq9FIXut', '1', 11107.86, NULL, '2023-10-26 08:09:44', 'false', 'false'),
(198, 6, 6, 10.00, 0.00, '0', '2,3', '3NM8cm8DtS7zO2k', '4', 11097.86, NULL, '2023-10-26 08:09:57', 'false', 'false'),
(199, 6, 6, 10.00, 0.00, '2', '1,0,3', 'IKzaKTkluZMXxdN', '1', 11087.86, NULL, '2023-10-26 08:10:42', 'false', 'false'),
(200, 6, 6, 10.00, 0.00, '3', '2,1,0', 'IamtdIDp52ogukU', '2', 11077.86, NULL, '2023-10-26 08:10:56', 'false', 'false'),
(201, 6, 6, 10.00, 0.00, '1', '2,3,0', 'M2zRD1OPq350Kde', '2', 11067.86, NULL, '2023-10-26 08:11:20', 'false', 'false'),
(202, 6, 6, 10.00, 21.80, '2', '2,1,3', 'xYKf9PuQsUw88w0', '3', 11057.86, NULL, '2023-10-26 08:11:44', 'false', 'false'),
(203, 6, 6, 10.00, 0.00, '1', '2,3,0', 'RKxrzLkPzTxk2Pz', '1', 11069.66, NULL, '2023-10-26 08:12:33', 'false', 'false'),
(204, 6, 6, 10.00, 0.00, '1', '3,2', 'tVPKXLGImxpXnx5', '5', 11059.66, NULL, '2023-10-26 08:39:33', 'false', 'false'),
(205, 6, 6, 10.00, 0.00, '1', '2,0,3', 'qxxdWRVEOdtWVfu', '2', 11049.66, NULL, '2023-10-26 08:40:42', 'false', 'false'),
(206, 6, 6, 10.00, 12.00, '0', '1,3,0', 'q4vQrBLv27O4GOK', '1', 11039.66, NULL, '2023-10-26 08:41:53', 'false', 'false'),
(207, 6, 6, 10.00, 16.20, '3', '2,0,3', 'dkiLiliIikYFknK', '2', 11041.66, NULL, '2023-10-26 08:42:27', 'false', 'false'),
(208, 6, 6, 10.00, 0.00, '0', '1,2', 'pOKhpnegXtXZHJH', '5', 11047.86, NULL, '2023-10-26 08:43:02', 'false', 'false'),
(209, 6, 6, 10.00, 0.00, '3', '2,0,1', '0F15W4CBEuzoWnT', '3', 11037.86, NULL, '2023-10-26 08:43:56', 'false', 'false'),
(210, 6, 6, 10.00, 21.80, '3', '0,1,3', 'Khgd8vrXPef4I1c', '3', 11027.86, NULL, '2023-10-26 08:45:12', 'false', 'false'),
(211, 6, 6, 10.00, 0.00, '1', '3,2,0', '7l6aB1kSySJF7wC', '2', 11039.66, NULL, '2023-10-26 08:46:02', 'false', 'false'),
(212, 6, 6, 10.00, 0.00, '1', '2,0,3', '0wStbKTzn95dqLV', '2', 11029.66, NULL, '2023-10-26 08:46:28', 'false', 'false'),
(213, 6, 6, 10.00, 12.00, '3', '3,0,2', 'jI9eemq3TcEpQVG', '1', 11019.66, NULL, '2023-10-26 08:47:44', 'false', 'false'),
(214, 6, 6, 10.00, 12.00, '1', '3,0,1', 'If7Xpl39ABDPjdS', '1', 11021.66, NULL, '2023-10-26 08:48:13', 'false', 'false'),
(215, 6, 6, 10.00, 12.00, '1', '1,0,3', 'qDFhehDnUTCrvPl', '1', 11023.66, NULL, '2023-10-26 08:48:55', 'false', 'false'),
(216, 6, 6, 10.00, 16.20, '3', '0,3,2', 'E0k7h9FXjgRHfhS', '2', 11025.66, NULL, '2023-10-26 09:04:48', 'false', 'false'),
(217, 6, 6, 10.00, 21.80, '1', '1,3,2', 'dC22vVXFW0VuQvX', '3', 11031.86, NULL, '2023-10-26 09:05:37', 'false', 'false'),
(218, 6, 6, 10.00, 0.00, '2', '0,1,3', 'GRiax6VBgh4YDl1', '1', 11043.66, NULL, '2023-10-26 09:17:52', 'false', 'false'),
(219, 6, 6, 10.00, 0.00, '3', '2,1,0', 'W21pmYCR1oX6S2b', '1', 11033.66, NULL, '2023-10-26 09:19:04', 'false', 'false'),
(220, 6, 6, 10.00, 0.00, '1', '2,3,0', 'Gybgomg6CXWlb8n', '1', 11023.66, NULL, '2023-10-26 09:19:18', 'false', 'false'),
(221, 6, 6, 10.00, 0.00, '0', '2,1,3', 'KT1td04SKv5Y3Ru', '1', 11013.66, NULL, '2023-10-26 09:19:32', 'false', 'false'),
(222, 6, 6, 10.00, 0.00, '3', '1,0,2', 'TKW90axAOLnS0EJ', '1', 11003.66, NULL, '2023-10-26 09:19:46', 'false', 'false'),
(223, 6, 6, 10.00, 0.00, '2', '0,1,3', 'XLn4vBiczGWX4cz', '1', 10993.66, NULL, '2023-10-26 09:20:01', 'false', 'false'),
(224, 6, 6, 10.00, 0.00, '2', '3,1,0', 'SMRUa7a07LOay5P', '1', 10983.66, NULL, '2023-10-26 09:20:14', 'false', 'false'),
(225, 6, 6, 10.00, 12.00, '2', '1,0,2', 'J1vnAD5RsqMoqUs', '1', 10973.66, NULL, '2023-10-26 09:20:28', 'false', 'false'),
(226, 6, 6, 10.00, 0.00, '1', '2,3,0', 'OF7yXv5I5MdSQUy', '3', 10975.66, NULL, '2023-10-26 09:21:40', 'false', 'false'),
(227, 6, 6, 10.00, 0.00, '0', '1,3', '8TCWDTKtinqaKbY', '4', 10965.66, NULL, '2023-10-26 09:42:33', 'false', 'false'),
(228, 6, 6, 10.00, 0.00, '3', '0,1,2', 'FPKH9RASHGEeVpz', '2', 10955.66, NULL, '2023-10-26 09:43:54', 'false', 'false'),
(229, 6, 6, 10.00, 0.00, '3', '0,2,1', 'jGuz1CqGsZoozWi', '3', 10945.66, NULL, '2023-10-26 09:44:31', 'false', 'false'),
(230, 6, 6, 10.00, 0.00, '1', '3,2', 'aeUYvjzh3uLKst8', '4', 10935.66, NULL, '2023-10-26 09:47:03', 'false', 'false'),
(231, 6, 6, 10.00, 0.00, '3', '1,2', 'q4uX6fdlDcu6tMr', '5', 10925.66, NULL, '2023-10-26 10:39:30', 'false', 'false'),
(232, 6, 6, 10.00, 0.00, '3', '1,0', '1KEychGaxiihV9w', '4', 10915.66, NULL, '2023-10-26 10:41:10', 'false', 'false'),
(233, 6, 6, 10.00, 0.00, '0', '2,3', '3PPTfxkQhqnrXhU', '4', 10905.66, NULL, '2023-10-26 10:43:57', 'false', 'false'),
(234, 6, 6, 10.00, 0.00, '1', '0,2,3', '8PaL8C0PV47NO2v', '1', 10895.66, NULL, '2023-10-26 10:48:15', 'false', 'false'),
(235, 6, 6, 10.00, 0.00, '3', '0,2', '03imflwi4WGR5VB', '4', 10885.66, NULL, '2023-10-26 10:52:41', 'false', 'false'),
(236, 6, 6, 10.00, 0.00, '2', '1,3,0', 'Q4bDrJjnGNdxXGy', '2', 10875.66, NULL, '2023-10-26 10:54:40', 'false', 'false'),
(237, 6, 6, 10.00, 0.00, '3', '1,2', '6wFWfm6YiEl9ttl', '4', 10865.66, NULL, '2023-10-26 10:55:21', 'false', 'false'),
(238, 6, 6, 10.00, 12.00, '3', '3,0,2', 'V78XNAGCK46RVCi', '1', 10855.66, NULL, '2023-10-26 10:59:29', 'false', 'false'),
(239, 6, 6, 10.00, 0.00, '0', '1,3,2', 'kuZW1aDntHa0iNp', '3', 10857.66, NULL, '2023-10-26 11:05:12', 'false', 'false'),
(240, 6, 6, 10.00, 0.00, '1', '2,3,0', 'HTqe9aKKzNsaXGd', '1', 10847.66, NULL, '2023-10-26 11:05:44', 'false', 'false'),
(241, 6, 6, 10.00, 0.00, '3', '0,2,1', 'RJBXpJb8bN3MBDf', '1', 10837.66, NULL, '2023-10-26 11:05:59', 'false', 'false'),
(242, 6, 6, 10.00, 0.00, '3', '1,0', 'iBBOj329rquDpx7', '6', 10827.66, NULL, '2023-10-26 14:39:02', 'false', 'false'),
(243, 6, 6, 10.00, 0.00, '3', '0,1,2', 'd4SM5J5M9yV482N', '2', 10817.66, NULL, '2023-10-26 14:40:14', 'false', 'false'),
(244, 6, 6, 10.00, 0.00, '2', '3,0', 'rw6CGHpyBzK0xCv', '5', 10807.66, NULL, '2023-10-26 14:40:43', 'false', 'false'),
(245, 6, 6, 10.00, 0.00, '1', '3,2', 'pFX46n3AD8NiJql', '5', 10797.66, NULL, '2023-10-26 14:41:36', 'false', 'false'),
(246, 6, 6, 10.00, 0.00, '1', '3', 'x4cDekO1tYcLwPn', '7', 10787.66, NULL, '2023-10-26 14:44:46', 'false', 'false'),
(247, 6, 6, 10.00, 0.00, '3', '0,2', 'jnERxh9iGHIHTgf', '4', 10777.66, NULL, '2023-10-26 14:51:13', 'false', 'false'),
(248, 6, 6, 10.00, 0.00, '1', '2,3,0', 'pTNBfM81Hmkmm65', '3', 10767.66, NULL, '2023-10-26 14:52:25', 'false', 'false'),
(249, 6, 6, 10.00, 0.00, '1', '0,3', '6ZuAzGOJIHKGMPk', '4', 10757.66, NULL, '2023-10-26 14:53:22', 'false', 'false'),
(250, 6, 6, 10.00, 0.00, '3', '0,1,2', 'iFKyGRn5uPGJBER', '1', 10748.00, NULL, '2023-10-26 14:54:16', 'false', 'false'),
(251, 6, 6, 10.00, 0.00, '1', '3,0', 'q3yhVd0KwAcBRJ7', '5', 10738.00, NULL, '2023-10-26 15:04:02', 'false', 'false'),
(252, 6, 6, 10.00, 0.00, '0', '3,1', 'kbKn6ZsJdetjQKA', '4', 10728.00, NULL, '2023-10-26 15:05:00', 'false', 'false'),
(253, 6, 6, 10.00, 0.00, '0', '1,3,2', 'CXCRh06Ltc6QltE', '1', 10718.00, NULL, '2023-10-26 15:18:54', 'false', 'false'),
(254, 6, 6, 10.00, 0.00, '3', '0,1', 'BLFbGLyUVZLHMhX', '4', 10708.00, NULL, '2023-10-26 15:19:08', 'false', 'false'),
(255, 6, 6, 10.00, 0.00, '3', '2,0,1', 'jwdi9kYazhVfijo', '3', 10698.00, NULL, '2023-10-26 16:08:19', 'false', 'false'),
(256, 6, 6, 10.00, 0.00, '3', '1,0', 'vzeGSrPJ3hgccQA', '4', 10688.00, NULL, '2023-10-26 16:08:58', 'false', 'false'),
(257, 6, 6, 10.00, 0.00, '3', '0,1,2', 'zjqJKaLLu3Rk3Le', '2', 10678.00, NULL, '2023-10-26 16:11:02', 'false', 'false'),
(258, 6, 6, 10.00, 0.00, '1', '3,0', 'oZys4FbpJ972RHt', '4', 10668.00, NULL, '2023-10-26 16:20:24', 'false', 'false'),
(259, 6, 6, 10.00, 0.00, '1', '2,3', 'wtxy8Vt2NrjLiox', '6', 10658.00, NULL, '2023-10-26 16:24:03', 'false', 'false'),
(260, 6, 6, 10.00, 21.80, '1', '1,0,2', 'JVNNgmIWMhih5wU', '3', 10648.00, NULL, '2023-10-26 16:28:29', 'false', 'false'),
(261, 6, 6, 10.00, 0.00, '3', '2,0,1', 'RnYoQEwZ3UR9xbs', '1', 10659.80, NULL, '2023-10-26 16:33:20', 'false', 'false'),
(262, 6, 6, 10.00, 0.00, '1', '3,0,2', 'kzIBHOOhG3marEq', '2', 10649.80, NULL, '2023-10-26 16:36:08', 'false', 'false'),
(263, 6, 6, 10.00, 0.00, '1', '0,3,2', 'k5nuFecOYfkOYgV', '2', 10639.80, NULL, '2023-10-26 16:36:37', 'false', 'false'),
(264, 6, 6, 10.00, 0.00, '1', '3,0,2', 'j4lAEV5kCtapidU', '2', 10629.80, NULL, '2023-10-26 16:37:01', 'false', 'false'),
(265, 6, 6, 10.00, 0.00, '1', '0,3,2', 'qoEdRSA7qIG9BWO', '2', 10619.80, NULL, '2023-10-26 16:37:24', 'false', 'false'),
(266, 6, 6, 10.00, 0.00, '3', '0,2,1', '3dwu1C0I5QA5igC', '3', 10609.80, NULL, '2023-10-26 16:37:48', 'false', 'false'),
(267, 6, 6, 10.00, 0.00, '1', '0,3', 'sVzUN4otqz9Cmle', '4', 10599.80, NULL, '2023-10-26 16:38:22', 'false', 'false'),
(268, 6, 6, 10.00, 0.00, '1', '2,3', 'Fq9WXS708RBDMwk', '4', 10589.80, NULL, '2023-10-26 16:46:19', 'false', 'false'),
(269, 6, 6, 10.00, 0.00, '1', '2,0,3', 'hxTl6vsegVAJYBv', '3', 10579.80, NULL, '2023-10-26 16:47:45', 'false', 'false'),
(270, 6, 6, 10.00, 0.00, '1', '2,3,0', 'wcwjNQ1qPp81Rua', '2', 10569.80, NULL, '2023-10-26 16:48:41', 'false', 'false'),
(271, 6, 6, 10.00, 0.00, '1', '0,2,3', 'D1NSKWKxYIAaWZm', '1', 10559.80, NULL, '2023-10-26 16:49:06', 'false', 'false'),
(272, 6, 6, 10.00, 0.00, '1', '0,3,2', 'Q0s6pViOAmzadJa', '3', 10549.80, NULL, '2023-10-26 16:49:20', 'false', 'false'),
(273, 6, 6, 10.00, 0.00, '3', '2,1,0', 'WkT3Rs3oiuW7rJo', '1', 10539.80, NULL, '2023-10-26 16:50:29', 'false', 'false'),
(274, 6, 6, 10.00, 0.00, '3', '0,1', 'OpXFlxYDdbI7NSF', '4', 10529.80, NULL, '2023-10-26 16:50:54', 'false', 'false'),
(275, 6, 6, 10.00, 0.00, '2', '0,3', '6S13mjBN37xMReP', '4', 10519.80, NULL, '2023-10-26 16:51:39', 'false', 'false'),
(276, 6, 6, 20.00, 0.00, '3', '1,2,0', 'h2WKEaQLQ8geCH2', '1', 10499.80, NULL, '2023-10-26 16:55:07', 'false', 'false'),
(277, 2, 6, 1.00, 0.00, '0', '1,3,2', 'zLjQLHiBMpeb2rI', '2', 1228.34, NULL, '2023-10-26 17:34:56', 'false', 'false'),
(278, 2, 6, 1.00, 0.00, '3', '1,2,0', 'eI9ZBKxnEw6gfmJ', '3', 1227.34, NULL, '2023-10-26 17:35:37', 'false', 'false'),
(279, 2, 6, 1.00, 0.00, '2', '1,0,3', '3z2NuYrhs7kfeai', '1', 1118.99, NULL, '2023-10-26 17:36:23', 'false', 'false'),
(280, 6, 6, 20.00, 88.00, '3', '3,0', '1u3QnMpOwOLgLrc', '4', 10479.80, NULL, '2023-10-26 18:37:21', 'false', 'false'),
(281, 6, 6, 10.00, 0.00, '1', '3,0,2', 'NUTz3rBHHlIfA5f', '2', 10572.80, NULL, '2023-10-26 18:38:25', 'false', 'false'),
(282, 7, 0, 10.00, 0.00, '1', '2,0,3', 'Zlgs9iYYbChnfG8', '2', 990.00, NULL, '2023-10-26 18:48:56', 'false', 'false'),
(283, 7, 6, 10.00, 0.00, '2', '1,3,0', '5vxDgGjNe4z0k4G', '1', 980.00, NULL, '2023-10-26 18:49:31', 'false', 'false'),
(284, 7, 6, 10.00, 0.00, '1', '0,3,2', '85baD93ru1CmESg', '2', 970.00, NULL, '2023-10-26 18:49:47', 'false', 'false'),
(285, 7, 6, 10.00, 44.00, '1', '1,3', 'F3EXgZtzBxiSFV8', '4', 960.00, NULL, '2023-10-26 18:50:14', 'false', 'false'),
(286, 7, 6, 10.00, 0.00, '0', '1,2,3', 'zYZdm2DvFo296S8', '1', 994.00, NULL, '2023-10-26 18:51:48', 'false', 'false'),
(287, 7, 6, 10.00, 0.00, '2', '1,0,3', 'nGEmJ2ibxwY1K5S', '2', 984.00, NULL, '2023-10-26 18:52:15', 'false', 'false'),
(288, 7, 6, 10.00, 0.00, '1', '3,2', 'IivRt9137jG28T6', '4', 974.00, NULL, '2023-10-26 18:52:46', 'false', 'false'),
(289, 7, 6, 10.00, 0.00, '0', '2,3,1', 'Tp79UQa4sWQ02rJ', '1', 964.00, NULL, '2023-10-26 18:54:14', 'false', 'false'),
(290, 7, 6, 10.00, 0.00, '3', '1,2,0', 'jaAuAeJTXBSfrmW', '2', 954.00, NULL, '2023-10-26 18:54:40', 'false', 'false'),
(291, 7, 6, 10.00, 21.80, '3', '3,1,2', 'XC1xNf4nVugrOnA', '3', 944.00, NULL, '2023-10-26 18:55:12', 'false', 'false'),
(292, 7, 6, 10.00, 0.00, '0', '0', 'YVfvRTw7833Ai0q', '0', 965.80, NULL, '2023-10-26 18:56:40', 'false', 'true'),
(293, 7, 0, 5.00, 0.00, '0,1,2,3,4', '2', 'P9WBZtsjxG19M', '0', 960.80, NULL, '2023-10-26 18:58:03', 'false', 'false'),
(294, 7, 0, 5.00, 0.00, '0,3,4', '0', 'TkPQ219Y50Qjg', '0', 955.80, NULL, '2023-10-26 18:58:35', 'false', 'false'),
(295, 7, 0, 0.00, 0.00, '1,2,3,4', '0', 'OzGEUFNqowEf4', '0', 0.00, NULL, '2023-10-26 18:59:39', 'false', 'false'),
(296, 7, 2, 5.00, 9.00, '6,2,5,6,12,5,0,8,5,11,0,6,7,5,4', '2,23,28', 'left3,right3,left3', '3', 959.80, NULL, '2023-10-26 19:02:08', 'false', 'false'),
(297, 7, 2, 4.50, 1.80, '4,8,0,4,2,6,3,10,6,5,0,3,5,9,3', '26', 'right3', '1', 957.10, NULL, '2023-10-26 19:02:40', 'false', 'false'),
(298, 7, 2, 4.50, 49.05, '10,1,5,3,5,9,3,9,4,5,1,11,11,7,2', '6,13,16,17,21', 'middle3,right3,middle3,right3,right4', '5', 1001.65, NULL, '2023-10-26 19:02:47', 'false', 'false'),
(299, 7, 2, 4.50, 3.75, '9,0,12,0,5,12,1,4,6,8,1,11,10,1,4', '6,11,24', 'right3,right3,right3', '3', 1000.90, NULL, '2023-10-26 19:02:54', 'false', 'false'),
(300, 7, 2, 4.50, 0.00, '3,5,9,0,5,12,12,8,2,5,1,6,5,11,6', '', '', '0', 996.40, NULL, '2023-10-26 19:03:03', 'false', 'false'),
(301, 7, 2, 4.50, 2.25, '4,10,2,10,5,11,1,4,6,6,2,0,3,8,10', '21', 'left3', '1', 994.15, NULL, '2023-10-26 19:03:09', 'false', 'false'),
(302, 7, 2, 4.50, 0.00, '6,3,4,3,8,4,7,0,6,2,1,6,8,10,4', '', '', '0', 989.65, NULL, '2023-10-26 19:03:16', 'false', 'false'),
(303, 7, 2, 4.50, 56.40, '9,0,12,3,5,9,9,4,5,4,5,9,2,5,3', '3,12,17,20,24,26', 'middle3,right4,left4,middle3,middle3,middle3', '6', 1041.55, NULL, '2023-10-26 19:03:20', 'false', 'false'),
(304, 7, 2, 4.50, 0.00, '3,4,8,4,5,9,9,3,10,0,2,1,5,4,9', '', '', '0', 1037.05, NULL, '2023-10-26 19:03:28', 'false', 'false'),
(305, 7, 2, 4.50, 3.00, '2,6,8,2,7,0,2,12,5,7,1,8,9,5,11', '1,27', 'left3,left3', '2', 1035.55, NULL, '2023-10-26 19:03:33', 'false', 'false'),
(306, 7, 2, 4.50, 17.25, '3,2,6,10,5,11,9,4,6,5,9,3,11,6,0', '2,19,28', 'left3,right3,left3', '3', 1048.30, NULL, '2023-10-26 19:03:40', 'false', 'false'),
(307, 7, 2, 4.50, 2.70, '0,9,4,1,3,2,4,5,0,5,0,3,8,5,2', '15', 'right3', '1', 1046.50, NULL, '2023-10-26 19:03:47', 'false', 'false'),
(308, 7, 2, 4.50, 0.45, '9,5,0,1,0,2,10,2,0,4,3,5,5,9,3', '20', 'left3', '1', 1042.45, NULL, '2023-10-26 19:03:52', 'false', 'false'),
(309, 7, 2, 4.50, 0.00, '7,3,10,0,2,5,1,4,6,0,2,8,1,8,6', '', '', '0', 1037.95, NULL, '2023-10-26 19:03:58', 'false', 'false'),
(310, 7, 2, 4.50, 0.00, '3,2,6,4,5,9,10,2,0,6,5,0,5,7,6', '', '', '0', 1033.45, NULL, '2023-10-26 19:04:02', 'false', 'false'),
(311, 7, 2, 4.50, 0.00, '7,4,8,5,1,3,6,5,10,4,0,2,9,5,11', '', '', '0', 1028.95, NULL, '2023-10-26 19:04:06', 'false', 'false'),
(312, 7, 2, 4.50, 0.00, '4,3,10,6,12,5,2,0,7,5,3,9,5,12,6', '', '', '0', 1024.45, NULL, '2023-10-26 19:04:10', 'false', 'false'),
(313, 7, 2, 4.50, 0.00, '6,0,9,10,5,1,6,2,12,3,5,1,9,3,1', '', '', '0', 1019.95, NULL, '2023-10-26 19:04:15', 'false', 'false'),
(314, 7, 2, 4.50, 2.25, '6,0,9,10,4,12,1,8,4,4,10,7,8,6,11', '18', 'right3', '1', 1017.70, NULL, '2023-10-26 19:04:19', 'false', 'false'),
(315, 7, 2, 4.50, 0.45, '5,9,0,0,7,2,7,0,5,1,6,5,10,1,4', '22', 'left3', '1', 1013.65, NULL, '2023-10-26 19:04:28', 'false', 'false'),
(316, 7, 2, 4.50, 0.00, '9,4,0,6,0,9,12,5,3,0,3,7,9,5,6', '', '', '0', 1009.15, NULL, '2023-10-26 19:04:34', 'false', 'false'),
(317, 7, 2, 4.50, 0.00, '5,3,4,1,3,2,5,0,1,8,6,4,7,3,5', '', '', '0', 1004.65, NULL, '2023-10-26 19:04:38', 'false', 'false'),
(318, 7, 2, 4.50, 2.70, '12,1,6,5,11,6,12,5,3,1,6,5,5,8,0', '21', 'right3', '1', 1002.85, NULL, '2023-10-26 19:04:42', 'false', 'false'),
(319, 8, 0, 0.00, 0.00, '0', '0', 'L1l7s2nwR4drgim', '0', 0.00, NULL, '2023-10-27 03:59:00', 'false', 'true'),
(320, 8, 0, 0.00, 0.00, '0,1,2,3,4', '0', 'OITgK3Rn5YxfZ', '0', 0.00, NULL, '2023-10-27 04:05:05', 'false', 'false'),
(321, 2, 6, 1.00, 1.20, '3', '1,0,3', 'sk1QpinhXD3ZeF2', '1', 1117.99, NULL, '2023-10-27 04:42:36', 'false', 'false'),
(322, 2, 6, 1.00, 16.20, '1', '2,1,0', '44RG2FA3Rnt4KD4', '2', 1118.19, NULL, '2023-10-27 04:43:55', 'false', 'false'),
(323, 6, 6, 10.00, 0.00, '0', '3,2,1', 'tBF9mp2WgJOEVLn', '1', 10562.80, NULL, '2023-10-27 04:47:49', 'false', 'false'),
(324, 6, 6, 10.00, 0.00, '2', '1', 'SSBIF0gkmYjqtco', '8', 10552.80, NULL, '2023-10-27 04:48:05', 'false', 'false'),
(325, 6, 6, 10.00, 12.00, '0', '0,1,2', 'ebsPNuznxzfaLUo', '1', 10542.80, NULL, '2023-10-27 04:53:38', 'false', 'false'),
(326, 6, 6, 10.00, 0.00, '1', '2,3,0', 'kBlcEHL7ubJrz6L', '2', 10544.80, NULL, '2023-10-27 04:54:44', 'false', 'false'),
(327, 6, 6, 10.00, 0.00, '3', '1,0,2', 'bC0nEUJbIn6vMwL', '3', 10534.80, NULL, '2023-10-27 04:59:38', 'false', 'false'),
(328, 6, 6, 10.00, 21.80, '3', '0,3,1', 'PrWUc4QbN4xHj7S', '3', 10524.80, NULL, '2023-10-27 05:12:38', 'false', 'false'),
(329, 2, 6, 1.00, 1.62, '1', '2,0,1', 'NJOs0b0tu93Fto9', '2', 1133.39, NULL, '2023-10-27 05:52:34', 'false', 'false'),
(330, 2, 6, 1.00, 1.20, '2', '0,2,3', 'w0Ip1zu7GOvu4nE', '1', 1134.01, NULL, '2023-10-27 05:53:26', 'false', 'false'),
(331, 6, 6, 10.00, 0.00, '3', '1,2,0', 'JeRcGqbxmHArRoe', '1', 10536.60, NULL, '2023-10-27 06:05:35', 'false', 'false'),
(332, 6, 6, 10.00, 12.00, '0', '2,0,3', 'g1L9F8nXpIJiRPv', '1', 10526.60, NULL, '2023-10-27 06:07:37', 'false', 'false'),
(333, 6, 6, 10.00, 0.00, '1', '2,3,0', '7ghCL9C5xwP6O23', '1', 10528.60, NULL, '2023-10-27 06:08:06', 'false', 'false'),
(334, 6, 6, 10.00, 12.00, '1', '3,1,0', 'qfotuLddhI913pQ', '1', 10518.60, NULL, '2023-10-27 06:09:47', 'false', 'false'),
(335, 6, 6, 10.00, 12.00, '3', '3,1,0', 'ZS6c8APnMYfhbos', '1', 10520.60, NULL, '2023-10-27 06:10:13', 'false', 'false'),
(336, 6, 6, 10.00, 12.00, '2', '0,3,2', 'uWHxoCag1wE0S0m', '1', 10522.60, NULL, '2023-10-27 06:11:16', 'false', 'false'),
(337, 6, 6, 10.00, 16.20, '2', '0,2,3', 'oV3CA8KdIdvDvFe', '2', 10524.60, NULL, '2023-10-27 06:11:42', 'false', 'false'),
(338, 2, 6, 1.00, 1.20, '2', '3,2,0', 'L2IgBmxcBoEpMqa', '1', 1134.21, NULL, '2023-10-27 07:46:40', 'false', 'false'),
(339, 2, 6, 1.00, 0.00, '1', '0,2', 'KaLqW5APLtbAfRY', '4', 1234.41, NULL, '2023-10-27 07:49:05', 'false', 'false'),
(340, 2, 6, 1.00, 0.00, '1', '0,3,2', 'tQL2c9Bag3zWjqy', '3', 1232.51, NULL, '2023-10-27 07:50:11', 'false', 'false'),
(341, 6, 6, 10.00, 0.00, '3', '2,0,1', 'imCtBD4IVkJep3e', '2', 10530.80, NULL, '2023-10-27 09:34:44', 'false', 'false'),
(342, 6, 6, 10.00, 0.00, '0', '1,2,3', 'dGS4XZZYmWdKgIp', '2', 10520.80, NULL, '2023-10-27 09:49:44', 'false', 'false'),
(343, 6, 6, 10.00, 0.00, '2', '0,3,1', 'Yh4jplXSMmEfEaZ', '1', 10510.80, NULL, '2023-10-27 09:50:11', 'false', 'false'),
(344, 6, 6, 10.00, 16.20, '0', '3,0,1', 'HwC2IOht2hny0dt', '2', 10500.80, NULL, '2023-10-27 09:50:24', 'false', 'false'),
(345, 6, 6, 10.00, 12.00, '0', '0,2,1', '610me0K8UNKd5es', '1', 10507.00, NULL, '2023-10-27 09:51:03', 'false', 'false'),
(346, 6, 6, 10.00, 21.80, '2', '2,3,1', 'Nj3iWzgNmqo631H', '3', 10509.00, NULL, '2023-10-27 10:33:56', 'false', 'false'),
(347, 2, 6, 1.00, 1.62, '3', '0,3,1', 'Ken2xCJLlyIYH7t', '2', 1231.51, NULL, '2023-10-27 11:10:04', 'false', 'false'),
(348, 2, 6, 1.00, 0.00, '3', '0,1,2', 'JzE6WfnrTHOMZC8', '1', 1232.13, NULL, '2023-10-27 11:10:43', 'false', 'false'),
(349, 2, 6, 1.00, 0.00, '1', '2,0,3', 'hAccsHRxa0KIjPe', '1', 1231.13, NULL, '2023-10-27 11:10:55', 'false', 'false'),
(350, 2, 6, 10.00, 0.00, '0', '1,3,2', 'CImX5k90M89JSSk', '3', 1221.13, NULL, '2023-10-27 11:11:10', 'false', 'false'),
(351, 6, 6, 10.00, 0.00, '1', '2,3,0', 'iGrvQ0Ni0JqopvB', '3', 10520.80, NULL, '2023-10-27 11:14:58', 'false', 'false'),
(352, 6, 6, 10.00, 16.20, '1', '0,1,2', 'Ko91EfQWTCBU9Xw', '2', 10510.80, NULL, '2023-10-27 11:25:05', 'false', 'false'),
(353, 6, 6, 10.00, 21.80, '1', '2,1,0', 'dsVx8XDbUyIuHdb', '3', 10517.00, NULL, '2023-10-27 11:25:57', 'false', 'false'),
(354, 6, 6, 10.00, 0.00, '3', '1,2,0', 'N4GclxAoD15ytIm', '2', 10528.80, NULL, '2023-10-27 12:05:34', 'false', 'false'),
(355, 6, 6, 10.00, 0.00, '3', '0,2,1', 'R5OY4GDxdt54jA4', '1', 10518.80, NULL, '2023-10-27 12:06:27', 'false', 'false'),
(356, 6, 6, 10.00, 21.80, '0', '3,0,1', 'iWH6RmmoYOLutMY', '3', 10508.80, NULL, '2023-10-27 12:06:43', 'false', 'false'),
(357, 6, 6, 10.00, 0.00, '1', '2,3', 'diT0ODOBBt5d6uq', '4', 10520.60, NULL, '2023-10-27 12:08:17', 'false', 'false'),
(358, 6, 6, 10.00, 0.00, '1', '3,2,0', 'tPjEejA1UwcjV5G', '1', 10510.90, NULL, '2023-10-27 12:16:49', 'false', 'false'),
(359, 6, 6, 10.00, 0.00, '0', '1,2,3', 'm7Aen1F2mM2zAIH', '1', 10500.90, NULL, '2023-10-27 12:17:28', 'false', 'false'),
(360, 6, 6, 10.00, 12.00, '2', '2,1,3', 'arX3yfQs6DBRUi1', '1', 10490.90, NULL, '2023-10-27 12:19:08', 'false', 'false'),
(361, 6, 6, 10.00, 16.20, '0', '1,0,2', '0rhbJUjg2JOkRS8', '2', 10492.90, NULL, '2023-10-27 12:19:36', 'false', 'false'),
(362, 6, 6, 10.00, 0.00, '0', '3,1,2', 'iopnTXAEaySy1dQ', '2', 10499.10, NULL, '2023-10-27 12:27:38', 'false', 'false'),
(363, 2, 6, 1.00, 0.00, '2', '3,1,0', 'X9PZ4Ta7XyKuMl1', '2', 1220.13, NULL, '2023-10-27 12:30:13', 'false', 'false'),
(364, 2, 6, 10.00, 0.00, '3', '0,2,1', 'InWnWz3bjZx1xTw', '1', 1210.13, NULL, '2023-10-27 12:31:37', 'false', 'false'),
(365, 2, 6, 10.00, 0.00, '0', '1,2', 'tI3RlAXpeGOc7lI', '4', 1200.13, NULL, '2023-10-27 12:38:16', 'false', 'false'),
(366, 2, 6, 10.00, 0.00, '1', '3,2,0', 'ySIUZrc65bYDq7c', '1', 1190.13, NULL, '2023-10-27 12:39:09', 'false', 'false'),
(367, 5, 6, 10.00, 0.00, '1', '3,0,2', 'xq9naKKywZhDmgD', '3', 17779.91, NULL, '2023-10-27 15:50:22', 'false', 'false'),
(368, 5, 6, 10.00, 0.00, '2', '3,1,0', 'QVoirEJ19T1xRrT', '1', 14190.91, NULL, '2023-10-27 15:55:59', 'false', 'false'),
(369, 5, 6, 10.00, 16.20, '1', '1,0,2', 'l9kDlbrWaSEpznN', '2', 14170.91, NULL, '2023-10-27 15:57:29', 'false', 'false'),
(370, 2, 6, 10.00, 0.00, '0', '2,3,1', '5P9EN2gpn6Mdefq', '1', 1180.13, NULL, '2023-10-27 15:58:36', 'false', 'false'),
(371, 2, 6, 10.00, 0.00, '0', '3,1,2', 'o1xgY5ZePZyjDYN', '1', 1170.13, NULL, '2023-10-27 15:58:50', 'false', 'false'),
(372, 2, 6, 10.00, 0.00, '0', '3,2', 'tfUDykaIe2CL6xj', '5', 1160.13, NULL, '2023-10-27 15:59:21', 'false', 'false'),
(373, 2, 6, 10.00, 0.00, '1', '0,2,3', 'XJ02Kz60BQu76I6', '3', 1150.13, NULL, '2023-10-27 16:00:26', 'false', 'false'),
(374, 2, 6, 1.00, 1.20, '1', '1,3,2', 'Lj799m2yDLy9Ezb', '1', 1149.26, NULL, '2023-10-27 16:57:17', 'false', 'false'),
(375, 9, 0, 0.00, 0.00, '0', '0', 'r1Q9RtVnW37oJDn', '0', 0.00, NULL, '2023-10-28 06:51:35', 'false', 'true'),
(376, 9, 1, 0.00, 0.00, '0,9,4,10,5,1,12,5,3,0,4,3,4,9,5', '', '', '0', 0.00, NULL, '2023-10-28 06:52:45', 'false', 'false'),
(377, 9, 1, 0.00, 0.00, '10,4,3,2,4,5,5,1,8,5,3,10,7,5,4', '', '', '0', 0.00, NULL, '2023-10-28 06:52:49', 'false', 'false'),
(378, 9, 1, 0.00, 0.00, '1,6,3,0,2,5,4,6,0,0,4,8,7,3,5', '', '', '0', 0.00, NULL, '2023-10-28 06:52:54', 'false', 'false'),
(379, 9, 2, 0.00, 0.00, '1,5,11,1,3,2,5,2,7,6,5,0,9,4,10', '', '', '0', 0.00, NULL, '2023-10-28 06:53:30', 'false', 'false'),
(380, 9, 2, 0.00, 0.00, '10,3,6,5,12,9,3,10,6,2,1,6,4,7,5', '', '', '0', 0.00, NULL, '2023-10-28 06:53:34', 'false', 'false'),
(381, 9, 2, 0.00, 0.00, '8,0,1,10,4,12,3,10,6,8,1,11,5,8,0', '', '', '0', 0.00, NULL, '2023-10-28 06:53:38', 'false', 'false'),
(382, 9, 3, 0.00, 0.00, '2,0,9,5,9,6,9,4,5,6,4,2,12,6,2', '', '', '0', 955.00, NULL, '2023-10-28 06:57:38', 'false', 'false'),
(383, 9, 4, 0.00, 0.00, '3,10,1,5,8,4,1,2,9,6,5,9,6,0,10', '', '', '0', 955.00, NULL, '2023-10-28 06:57:38', 'false', 'false'),
(384, 9, 4, 0.00, 0.00, '2,7,0,4,2,6,11,3,1,10,7,2,10,1,4', '', '', '0', 955.00, NULL, '2023-10-28 06:57:43', 'false', 'false'),
(385, 9, 3, 0.00, 0.00, '3,4,8,9,6,12,3,5,0,1,4,10,4,9,5', '', '', '0', 955.00, NULL, '2023-10-28 06:57:43', 'false', 'false'),
(386, 9, 3, 0.00, 0.00, '8,2,5,7,2,8,3,1,4,6,5,9,12,6,2', '', '', '0', 955.00, NULL, '2023-10-28 06:57:47', 'false', 'false'),
(387, 9, 4, 0.00, 0.00, '0,5,7,10,5,11,1,2,9,3,5,1,6,11,7', '', '', '0', 955.00, NULL, '2023-10-28 06:57:47', 'false', 'false'),
(388, 9, 3, 10.50, 0.00, '4,10,2,1,3,2,3,1,5,4,2,1,7,5,9', '', '', '0', 944.50, NULL, '2023-10-28 06:57:55', 'false', 'false'),
(389, 9, 4, 10.50, 6.30, '4,8,0,0,1,4,8,2,5,1,11,9,7,5,9', '12', 'right3', '1', 940.30, NULL, '2023-10-28 06:57:55', 'false', 'false'),
(390, 9, 3, 1.50, 2.40, '8,4,10,10,5,11,0,2,3,5,9,3,4,10,5', '2,7,13,28', 'middle3,middle3,middle3,middle3', '4', 941.20, NULL, '2023-10-28 06:58:16', 'false', 'false'),
(391, 9, 4, 1.50, 0.00, '12,0,10,9,0,1,9,4,5,8,0,2,5,4,9', '', '', '0', 939.70, NULL, '2023-10-28 06:58:16', 'false', 'false'),
(392, 9, 3, 1.50, 6.05, '2,5,1,5,11,6,0,5,12,5,0,3,7,6,8', '0,4,5,11,15,19,22,29', 'left3,middle3,middle3,middle3,left4,middle3,middle3,left3', '8', 944.25, NULL, '2023-10-28 06:58:20', 'false', 'false'),
(393, 9, 4, 1.50, 5.00, '7,3,10,2,6,9,10,1,7,1,11,0,3,8,10', '4', 'right3', '1', 943.20, NULL, '2023-10-28 06:58:20', 'false', 'false'),
(394, 9, 3, 1.50, 0.00, '0,9,5,6,5,1,10,1,7,1,8,6,5,8,0', '', '', '0', 941.70, NULL, '2023-10-28 06:58:28', 'false', 'false'),
(395, 9, 4, 1.50, 1.80, '0,1,5,2,8,0,3,1,5,10,5,4,5,11,6', '3,12', 'right3,right3', '2', 942.00, NULL, '2023-10-28 06:58:28', 'false', 'false'),
(396, 9, 3, 3.00, 0.00, '8,5,2,1,0,2,0,5,12,5,1,11,1,4,7', '', '', '0', 939.00, NULL, '2023-10-28 06:58:38', 'false', 'false'),
(397, 9, 4, 3.00, 1.80, '10,1,5,6,5,10,6,5,3,8,0,2,10,5,7', '10', 'left3', '1', 937.80, NULL, '2023-10-28 06:58:38', 'false', 'false'),
(398, 9, 4, 3.00, 0.00, '3,10,1,5,12,9,5,4,9,6,2,0,11,7,5', '', '', '0', 934.80, NULL, '2023-10-28 06:58:45', 'false', 'false'),
(399, 9, 3, 3.00, 10.80, '12,1,6,4,0,10,7,2,5,1,11,0,11,7,2', '3,9,10,11,19,29', 'right3,right3,right3,right3,right3,right3', '6', 934.80, NULL, '2023-10-28 06:58:45', 'false', 'true'),
(400, 9, 3, 3.00, 2.00, '1,0,10,1,10,0,5,1,4,4,10,7,4,9,5', '5,25', 'left3,right3', '2', 934.80, NULL, '2023-10-28 06:58:45', 'false', 'true'),
(401, 9, 3, 3.00, 3.50, '10,3,6,9,6,12,4,6,5,9,4,6,8,10,4', '4,10', 'right3,left3', '2', 934.80, NULL, '2023-10-28 06:58:45', 'false', 'true'),
(402, 9, 3, 3.00, 0.00, '12,1,6,1,3,2,5,12,8,6,2,0,6,10,1', '0', '', '0', 934.80, NULL, '2023-10-28 06:58:45', 'false', 'true'),
(403, 9, 3, 3.00, 0.00, '3,4,8,0,6,5,7,0,2,9,4,6,8,5,2', '0', '', '0', 934.80, NULL, '2023-10-28 06:58:45', 'false', 'true'),
(404, 9, 3, 3.00, 0.30, '0,5,3,8,4,0,11,3,1,1,9,4,3,5,8', '17', 'left3', '1', 934.80, NULL, '2023-10-28 06:58:45', 'false', 'true'),
(405, 9, 3, 3.00, 28.60, '7,1,0,2,4,8,5,3,8,2,5,8,11,7,5', '2,4,7,13,19,28', 'middle3,right3,middle3,right4,right3,middle3', '6', 934.80, NULL, '2023-10-28 06:58:45', 'false', 'true'),
(406, 9, 3, 3.00, 7.50, '6,3,4,2,4,5,9,4,8,6,4,5,9,3,1', '0,9,10,29', 'middle3,middle3,left4,middle3', '4', 934.80, NULL, '2023-10-28 06:58:45', 'false', 'true');
INSERT INTO `user_play` (`id`, `member_id`, `game_id`, `bet`, `win`, `tiles`, `winline`, `winstyle`, `winCount`, `credit`, `get_browser`, `created_at`, `game_Buyfeespin`, `game_feespin`) VALUES
(407, 9, 3, 3.00, 0.50, '0,1,4,1,0,2,1,2,9,0,3,7,6,11,7', '8', 'left3', '1', 934.80, NULL, '2023-10-28 06:58:45', 'false', 'true'),
(408, 9, 3, 3.00, 4.50, '2,5,9,6,4,2,0,7,11,3,5,1,8,6,11', '2,13,18,20', 'right3,left3,right3,right3', '4', 934.80, NULL, '2023-10-28 06:58:45', 'false', 'true'),
(409, 9, 0, 5.00, 0.00, '0,1,2,3,4', '3', 'ELyMbMjX80iWX', '0', 987.50, NULL, '2023-10-28 07:00:25', 'false', 'false'),
(410, 9, 0, 5.00, 0.00, '2,4', '2', 'BGigDbbx21VcE', '0', 982.50, NULL, '2023-10-28 07:00:45', 'false', 'false'),
(411, 9, 0, 5.00, 0.00, '0,1,2,3,4', '2', 'VoVwJMzqwH0pD', '0', 977.50, NULL, '2023-10-28 07:01:12', 'false', 'false'),
(412, 9, 0, 5.00, 0.00, '0,3', '3', 'bxpJB19j7vxuj', '0', 972.50, NULL, '2023-10-28 07:01:23', 'false', 'false'),
(413, 9, 0, 5.00, 0.00, '2,4', '2', 'RWIDZI1VWQUXV', '0', 967.50, NULL, '2023-10-28 07:01:48', 'false', 'false'),
(414, 9, 0, 5.00, 0.00, '1,4', '4', 'VFYkPL7z5rs1L', '0', 962.50, NULL, '2023-10-28 07:02:16', 'false', 'false'),
(415, 9, 0, 5.00, 9.20, '3,4', '3', 'H42JJi1PXib2Z', '0', 966.70, NULL, '2023-10-28 07:02:41', 'false', 'false'),
(416, 2, 1, 1.50, 0.75, '5,3,4,4,7,0,5,4,9,2,5,1,1,8,6', '22', 'left3', '1', 1149.38, NULL, '2023-10-31 05:33:23', 'false', 'false'),
(417, 2, 2, 3.00, 9.00, '3,6,0,4,7,0,1,4,7,12,7,1,5,4,9', '3,12,20', 'middle3,middle3,middle3', '3', 1155.38, NULL, '2023-10-31 05:33:57', 'false', 'false'),
(418, 2, 3, 4.50, 0.00, '3,2,6,0,6,5,2,5,4,0,6,4,7,5,9', '', '', '0', 1150.88, NULL, '2023-10-31 05:34:25', 'false', 'false'),
(419, 2, 3, 4.50, 4.50, '3,6,0,8,4,3,3,10,5,4,5,9,7,3,5', '17,20', 'left3,right3', '2', 1150.88, NULL, '2023-10-31 05:37:49', 'false', 'false'),
(420, 2, 3, 1.50, 0.50, '2,5,1,1,0,2,10,6,2,9,0,4,6,10,1', '13', 'left3', '1', 1149.88, NULL, '2023-10-31 05:38:55', 'false', 'false'),
(421, 2, 2, 1.50, 0.00, '0,12,1,6,4,2,8,4,2,3,10,12,11,7,5', '', '', '0', 1148.38, NULL, '2023-10-31 05:40:19', 'false', 'false'),
(422, 2, 0, 1.00, 0.00, '0,4', '4', 'AFj2GVrqKSDkf', '0', 1147.38, NULL, '2023-10-31 05:41:01', 'false', 'false'),
(423, 2, 0, 1.00, 0.00, '1,2', '1', 'Fvz1TdWGc8qVa', '0', 1146.38, NULL, '2023-10-31 05:41:27', 'false', 'false'),
(424, 2, 0, 1.00, 1.84, '1,2', '2', 'hCNgBqt0Hi3xQ', '0', 1147.22, NULL, '2023-10-31 05:41:42', 'false', 'false'),
(425, 2, 0, 5.00, 9.20, '1,4', '4', 'rAIZSL1JMxfHS', '0', 1151.42, NULL, '2023-10-31 05:42:19', 'false', 'false'),
(426, 2, 0, 1.00, 0.00, '0,1,2,3,4', '2', 'bEHGgaSStgeVW', '0', 1150.42, NULL, '2023-10-31 05:42:44', 'false', 'false'),
(427, 2, 0, 1.00, 0.00, '2,4', '4', 'm1l3yzyfLDR2b', '0', 1149.42, NULL, '2023-10-31 05:43:22', 'false', 'false'),
(428, 2, 0, 1.00, 1.84, '3,4', '4', '3iaO3P2LU2oUu', '0', 1150.26, NULL, '2023-10-31 05:43:42', 'false', 'false'),
(429, 2, 0, 0.00, 0.00, '0,1,2,3,4', '0', 'tU94pltseRPng', '0', 1150.26, NULL, '2023-10-31 05:43:59', 'false', 'false'),
(430, 2, 6, 1.00, 0.00, '1', '0,2,3', 'fxe3vGeXmPLUSFP', '1', 1149.46, NULL, '2023-10-31 05:45:22', 'false', 'false'),
(431, 2, 6, 1.00, 0.00, '3', '1,2', 'PYMyPRE36Tytsmh', '4', 1148.46, NULL, '2023-10-31 05:45:39', 'false', 'false'),
(432, 2, 6, 10.00, 0.00, '3', '2,1', 'lHQ7qWDokpswN1D', '6', 1138.46, NULL, '2023-10-31 05:46:36', 'false', 'false'),
(433, 6, 6, 10.00, 12.00, '0', '2,3,0', 'Rt0Yu7KLs6Cn7oc', '1', 10489.10, NULL, '2023-10-31 09:44:16', 'false', 'false'),
(434, 6, 6, 10.00, 12.00, '3', '0,3,2', 'FYJosVjPhJTeeSp', '1', 10491.10, NULL, '2023-10-31 09:45:15', 'false', 'false'),
(435, 6, 6, 10.00, 16.20, '0', '0,2,1', '9l2GJfoBE4A7umj', '2', 10493.10, NULL, '2023-10-31 09:49:30', 'false', 'false'),
(436, 6, 6, 10.00, 0.00, '3', '0,2,1', 'SzrNQ81Dh6XpX94', '2', 10499.30, NULL, '2023-10-31 09:50:08', 'false', 'false'),
(437, 6, 6, 10.00, 0.00, '1', '0,3,2', '3aUvzh9PBSqLacb', '2', 10489.30, NULL, '2023-10-31 09:50:35', 'false', 'false'),
(438, 6, 6, 10.00, 0.00, '2', '3,0,1', 'E5WeyBkd1NJHlMf', '2', 10479.30, NULL, '2023-10-31 09:52:41', 'false', 'false'),
(439, 6, 6, 10.00, 12.00, '3', '3,2,1', 'SDr2v7IoOZHI448', '1', 10469.30, NULL, '2023-10-31 09:53:11', 'false', 'false'),
(440, 6, 6, 10.00, 0.00, '3', '1,2,0', 'll6ig9qE2qu1bGc', '2', 10471.30, NULL, '2023-10-31 09:53:38', 'false', 'false'),
(441, 6, 6, 10.00, 16.20, '2', '1,2,0', 'KHIPDAtXqYp2XXW', '2', 10461.30, NULL, '2023-10-31 09:54:02', 'false', 'false'),
(442, 6, 6, 10.00, 0.00, '3', '1,2', 'zh9QDGyFFpfucoD', '4', 10467.50, NULL, '2023-10-31 09:54:39', 'false', 'false'),
(443, 6, 6, 10.00, 0.00, '2', '0,1', 'X8KIc5WQ5TMaOeZ', '4', 10457.50, NULL, '2023-10-31 09:56:50', 'false', 'false'),
(444, 6, 6, 10.00, 0.00, '1', '0,2', 'GqURPX0swzhNUYy', '5', 10447.50, NULL, '2023-10-31 09:58:36', 'false', 'false'),
(445, 6, 6, 10.00, 12.00, '0', '0,1,2', 'G34cZLuGJGKnNWw', '1', 10437.50, NULL, '2023-10-31 10:02:25', 'false', 'false'),
(446, 6, 6, 10.00, 0.00, '0', '3,2', 'HqFgrD4y8xxRiwK', '4', 10439.50, NULL, '2023-10-31 10:02:54', 'false', 'false'),
(447, 6, 6, 10.00, 0.00, '1', '0,3', 'n5gocos6m3iSBpv', '5', 10429.50, NULL, '2023-10-31 10:03:36', 'false', 'false'),
(448, 6, 6, 10.00, 0.00, '3', '2,1,0', 'VpK6c4M1gD69lz6', '3', 10419.50, NULL, '2023-10-31 10:19:11', 'false', 'false'),
(449, 6, 6, 10.00, 0.00, '1', '0,3,2', 'vAg0MW8bEfEl2Iv', '1', 10409.50, NULL, '2023-10-31 10:20:44', 'false', 'false'),
(450, 6, 6, 10.00, 0.00, '0', '2,3,1', 'PtwRfv9j9ovll4P', '1', 10399.50, NULL, '2023-10-31 10:20:57', 'false', 'false'),
(451, 6, 6, 10.00, 0.00, '0', '2,3,1', 'pc1XHlJKdTbjfsW', '2', 10389.50, NULL, '2023-10-31 10:21:11', 'false', 'false'),
(452, 6, 6, 10.00, 0.00, '3', '0,1,2', 'ZXZGD4EUfOibmF3', '3', 10379.50, NULL, '2023-10-31 10:21:50', 'false', 'false'),
(453, 6, 6, 10.00, 21.80, '3', '1,3,2', 'kt7ipWkBiSipinW', '3', 10369.50, NULL, '2023-10-31 10:22:35', 'false', 'false'),
(454, 6, 6, 10.00, 12.00, '0', '3,1,0', '30p5Max8JhuWNCw', '1', 10381.30, NULL, '2023-10-31 10:23:14', 'false', 'false'),
(455, 6, 6, 10.00, 0.00, '3', '2,1', '20qAxcrZlnFCuI4', '4', 10383.30, NULL, '2023-10-31 10:23:36', 'false', 'false'),
(456, 6, 6, 10.00, 0.00, '3', '2,0,1', 'MNJU28SQxhSiwBl', '1', 10373.30, NULL, '2023-10-31 10:24:14', 'false', 'false'),
(457, 6, 6, 10.00, 0.00, '2', '1,0,3', 'aKgOYAP8kdGDmGv', '2', 10363.30, NULL, '2023-10-31 10:41:29', 'false', 'false'),
(458, 6, 6, 10.00, 21.80, '3', '3,1,0', 'akpxdGA9BrY7OP3', '3', 10353.30, NULL, '2023-10-31 10:41:50', 'false', 'false'),
(459, 6, 6, 10.00, 0.00, '1', '0,2,3', 'zMIeINgDnLuv3Dx', '2', 10365.10, NULL, '2023-10-31 10:46:48', 'false', 'false'),
(460, 2, 6, 10.00, 0.00, '1', '2,0,3', 'xfqtsSAg5pP3iji', '2', 1128.46, NULL, '2023-10-31 11:06:28', 'false', 'false'),
(461, 2, 6, 10.00, 0.00, '2', '0,1,3', 'xy8QvlAFw80tZvk', '2', 1118.46, NULL, '2023-10-31 11:06:51', 'false', 'false'),
(462, 2, 6, 10.00, 0.00, '0', '3,2,1', 'qnfhnXtRTMeglsx', '3', 1108.46, NULL, '2023-10-31 17:50:47', 'false', 'false'),
(463, 2, 6, 10.00, 0.00, '1', '2,3,0', 'zxDwjGbVSVMHBNP', '3', 1098.46, NULL, '2023-10-31 18:20:53', 'false', 'false'),
(464, 4, 0, 0.00, 0.00, '0', '0', 'zRfoBfSHBKSdYf2', '0', 0.00, NULL, '2023-11-01 05:27:56', 'false', 'true'),
(465, 4, 0, 0.00, 0.00, '0,1,3,4', '0', 'ws2I8CnPylL6c', '0', 0.00, NULL, '2023-11-01 05:29:28', 'false', 'false'),
(466, 4, 3, 0.00, 0.00, '5,0,4,3,4,0,9,8,7,2,8,2,11,5,9', '', '', '0', 0.00, NULL, '2023-11-01 05:29:59', 'false', 'false'),
(467, 4, 3, 0.00, 0.00, '6,4,5,3,4,9,0,12,2,0,1,5,0,5,8', '', '', '0', 0.00, NULL, '2023-11-01 05:30:00', 'false', 'false'),
(468, 4, 3, 0.00, 0.00, '5,0,1,2,7,6,12,2,4,4,1,10,8,9,10', '', '', '0', 0.00, NULL, '2023-11-01 05:30:00', 'false', 'false'),
(469, 4, 3, 0.00, 0.00, '6,4,5,1,0,5,7,5,4,1,10,2,2,3,8', '', '', '0', 0.00, NULL, '2023-11-01 05:30:00', 'false', 'false'),
(470, 4, 3, 0.00, 0.00, '0,1,3,3,10,2,1,0,3,2,5,4,5,6,7', '', '', '0', 0.00, NULL, '2023-11-01 05:30:00', 'false', 'false'),
(471, 4, 3, 0.00, 0.00, '0,4,5,2,3,4,1,7,5,5,6,9,3,9,6', '', '', '0', 0.00, NULL, '2023-11-01 05:30:00', 'false', 'false'),
(472, 4, 3, 0.00, 0.00, '4,5,0,2,6,2,6,12,3,1,5,5,2,3,8', '', '', '0', 0.00, NULL, '2023-11-01 05:30:00', 'false', 'false'),
(473, 4, 3, 0.00, 0.00, '8,2,9,5,4,2,3,4,0,2,1,9,6,7,5', '', '', '0', 0.00, NULL, '2023-11-01 05:30:00', 'false', 'false'),
(474, 4, 3, 0.00, 0.00, '3,0,5,2,9,5,2,4,5,0,4,1,11,0,5', '', '', '0', 0.00, NULL, '2023-11-01 05:30:00', 'false', 'false'),
(475, 4, 3, 0.00, 0.00, '5,8,7,12,1,2,2,1,6,6,2,5,2,7,5', '', '', '0', 0.00, NULL, '2023-11-01 05:30:00', 'false', 'false'),
(476, 4, 1, 0.00, 0.00, '6,2,5,8,3,5,6,5,10,5,9,5,4,5,12', '', '', '0', 0.00, NULL, '2023-11-01 05:30:30', 'false', 'false'),
(477, 4, 1, 0.00, 0.00, '4,3,10,5,9,0,2,12,5,2,3,1,8,10,4', '', '', '0', 0.00, NULL, '2023-11-01 05:30:34', 'false', 'false'),
(478, 2, 6, 5.00, 0.00, '2', '3,1,0', '4UFP50Gj35qH46I', '3', 1092.46, NULL, '2023-11-01 10:06:56', 'false', 'false'),
(479, 2, 6, 10.00, 0.00, '3', '1,2,0', 'FZDBwUo1izPjMxt', '3', 972.46, NULL, '2023-11-01 10:08:35', 'false', 'false'),
(480, 2, 0, 5.00, 0.00, '0,1,2,3,4', '1', '5sO3PRQ9NuYNZ', '0', 1087.46, NULL, '2023-11-01 10:10:32', 'false', 'false'),
(481, 2, 0, 5.00, 0.00, '3,4', '3', '6WbpqMGo3aOwb', '0', 1082.46, NULL, '2023-11-01 10:10:51', 'false', 'false'),
(482, 2, 0, 0.00, 0.00, '0,1,2,3,4', '0', 'dSk4DMk3NJmQy', '0', 0.00, NULL, '2023-11-01 10:11:20', 'false', 'false'),
(483, 2, 6, 10.00, 0.00, '0', '0', 'uB8Y8ZH9akrzgzN', '0', 972.46, NULL, '2023-11-01 10:24:07', 'false', 'true'),
(484, 5, 6, 10.00, 0.00, '3', '0,2,1', 'Mf27QZoCDAnMCT4', '1', 14180.91, NULL, '2023-11-02 03:43:49', 'false', 'false'),
(485, 5, 6, 10.00, 0.00, '2', '1,3,0', 'NcKk7l22Rp6h0GG', '1', 14177.11, NULL, '2023-11-02 04:09:35', 'false', 'false'),
(486, 5, 6, 10.00, 0.00, '0', '1,3,2', 'FCJV8yBrynsgg4M', '3', 14167.11, NULL, '2023-11-02 04:37:16', 'false', 'false'),
(487, 6, 6, 10.00, 0.00, '2', '3,1,0', 'wnuVJLtapRPRXve', '1', 10355.10, NULL, '2023-11-02 06:45:32', 'false', 'false'),
(488, 6, 6, 10.00, 0.00, '3', '1,2,0', 'zMWsgbenTjpgC6a', '1', 10345.10, NULL, '2023-11-02 06:46:11', 'false', 'false'),
(489, 6, 6, 10.00, 44.00, '2', '0,2', 'TUEZKV8ddsSBUaz', '4', 10335.10, NULL, '2023-11-02 07:24:05', 'false', 'false'),
(490, 6, 6, 10.00, 0.00, '3', '0,1', 'XrEOJyIQsvRZbD9', '4', 10369.10, NULL, '2023-11-02 07:24:56', 'false', 'false'),
(491, 5, 6, 10.00, 0.00, '0', '0', 'VlMiYzPLWKfsleE', '0', 14177.11, NULL, '2023-11-02 08:09:59', 'false', 'true'),
(492, 5, 6, 10.00, 0.00, '0', '0', 'VRafSD9HOnzxCoI', '0', 14167.11, NULL, '2023-11-02 08:15:31', 'false', 'true'),
(493, 6, 6, 10.00, 0.00, '0', '2,3', 'qBaeMKfCGUWjJIP', '4', 10359.10, NULL, '2023-11-02 11:43:44', 'false', 'false'),
(494, 6, 6, 10.00, 0.00, '2', '1,3', 'aspYGyPnOMyAAu2', '4', 10349.10, NULL, '2023-11-02 11:47:57', 'false', 'false'),
(495, 6, 6, 10.00, 0.00, '1', '3,0', 'W0ISfr1Z4iOQJVB', '5', 10339.10, NULL, '2023-11-02 11:55:00', 'false', 'false'),
(496, 6, 6, 10.00, 0.00, '3', '0,2', 'fYUnfL9hFmZxtVE', '4', 10329.10, NULL, '2023-11-02 12:00:29', 'false', 'false'),
(497, 6, 6, 10.00, 0.00, '2', '1,3,0', 'ECHnQpnB0tXw5r0', '2', 10319.10, NULL, '2023-11-02 12:07:49', 'false', 'false'),
(498, 6, 6, 10.00, 0.00, '0', '0', 'ePdSoWrs1uZzHvf', '0', 10319.10, NULL, '2023-11-02 12:08:12', 'false', 'true'),
(499, 5, 1, 10.00, 66.67, '3,10,0,8,4,0,12,8,2,11,0,6,10,5,8', '5,15,22', 'middle3,middle3,right4', '3', 14223.78, NULL, '2023-11-02 13:19:13', 'false', 'false'),
(500, 5, 1, 10.00, 38.67, '5,1,9,5,11,6,3,10,5,4,5,9,0,10,5', '3,12,20,25', 'left4,middle3,right4,left3', '4', 14252.45, NULL, '2023-11-02 13:19:21', 'false', 'false'),
(501, 5, 1, 10.00, 25.00, '0,1,5,9,10,5,9,4,8,3,9,0,8,0,9', '4', 'right3', '1', 14267.45, NULL, '2023-11-02 13:19:28', 'false', 'false'),
(502, 5, 1, 10.00, 0.00, '0,9,5,8,4,3,6,5,3,7,1,8,0,9,4', '', '', '0', 14257.45, NULL, '2023-11-02 13:19:31', 'false', 'false'),
(503, 5, 1, 10.00, 9.33, '0,5,3,12,5,8,11,3,1,10,7,2,2,5,3', '11,17', 'left3,right3', '2', 14256.78, NULL, '2023-11-02 13:19:32', 'false', 'false'),
(504, 5, 1, 10.00, 18.00, '4,8,2,5,12,9,1,5,4,5,1,4,6,2,7', '5,15,22', 'middle3,middle3,middle3', '3', 14264.78, NULL, '2023-11-02 13:19:35', 'false', 'false'),
(505, 5, 1, 10.00, 0.00, '4,3,5,2,6,9,5,0,9,9,4,6,1,4,7', '', '', '0', 14254.78, NULL, '2023-11-02 13:19:37', 'false', 'false'),
(506, 5, 1, 10.00, 5.00, '6,8,4,8,3,5,5,4,9,4,2,1,9,5,11', '22', 'right3', '1', 14249.78, NULL, '2023-11-02 13:19:38', 'false', 'false'),
(507, 5, 1, 10.00, 5.00, '0,10,4,0,6,5,4,8,1,5,4,0,5,11,6', '11', 'right3', '1', 14244.78, NULL, '2023-11-02 13:19:41', 'false', 'false'),
(508, 5, 1, 10.00, 5.00, '5,7,4,4,5,2,1,4,7,3,7,10,6,8,5', '22', 'left3', '1', 14239.78, NULL, '2023-11-02 13:19:44', 'false', 'false'),
(509, 5, 1, 10.00, 0.00, '5,12,4,0,10,5,2,7,3,2,1,5,5,8,3', '', '', '0', 14229.78, NULL, '2023-11-02 13:19:47', 'false', 'false'),
(510, 5, 1, 10.00, 25.33, '0,12,1,12,5,8,5,3,8,1,5,10,7,3,5', '4,11,19', 'right4,middle3,middle3', '3', 14245.11, NULL, '2023-11-02 13:19:48', 'false', 'false'),
(511, 5, 1, 10.00, 3.33, '5,12,4,10,5,11,10,2,0,2,8,1,6,11,7', '15', 'right3', '1', 14238.44, NULL, '2023-11-02 13:19:51', 'false', 'false'),
(512, 5, 1, 10.00, 0.00, '6,2,5,2,4,5,1,7,0,8,1,11,9,4,10', '', '', '0', 14228.44, NULL, '2023-11-02 13:19:54', 'false', 'false');

-- --------------------------------------------------------

--
-- Table structure for table `withdraw`
--

CREATE TABLE `withdraw` (
  `id` bigint NOT NULL,
  `agent_id` bigint DEFAULT NULL,
  `bill_number` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `numberbill` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `quantity` int NOT NULL,
  `accountName` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `accountNumber` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `phonenumber` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `transaction_date` date NOT NULL,
  `time` time NOT NULL,
  `bank` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `status_withdraw` enum('success','in_progress','failed') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'in_progress',
  `status_value` enum('Y','N') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'N',
  `images` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `note` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'รอการอนุมัตื'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `withdraw`
--

INSERT INTO `withdraw` (`id`, `agent_id`, `bill_number`, `numberbill`, `quantity`, `accountName`, `accountNumber`, `phonenumber`, `transaction_date`, `time`, `bank`, `status_withdraw`, `status_value`, `images`, `note`) VALUES
(1, 2, 'T2023102600001', '1', 100, 'victest', '0123456789', '0954789782', '2023-10-26', '18:12:29', '3', 'failed', 'N', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-scb.png', 'เทสระบบ'),
(2, 2, 'T2023102700001', '1', 1234, 'victest', '0123456789', '0954789782', '2023-10-27', '07:50:59', '3', 'failed', 'N', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-scb.png', 'เทสระบบ'),
(3, 2, 'T2023102700002', '2', 1234, 'victest', '0123456789', '0954789782', '2023-10-27', '07:58:07', '3', 'failed', 'Y', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-scb.png', 'เทสๆ'),
(4, 2, 'T2023102700003', '3', 1234, 'victest', '0123456789', '0954789782', '2023-10-27', '07:59:01', '3', 'failed', 'Y', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-scb.png', 'เทสจ้า'),
(5, 2, 'T2023102700004', '4', 1000, 'นาย พีรวัส ขวัญแก้ว', '18396488647', '0990825942', '2023-10-27', '11:13:54', '3', 'failed', 'Y', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-scb.png', 'รอการอนุมัตื'),
(6, 2, 'T2023103100001', '1', 50, 'นาย พีรวัส ขวัญแก้ว', '18396488647', '0990825942', '2023-10-31', '12:55:26', '3', 'failed', 'N', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-scb.png', 'testtest'),
(7, 2, 'T2023103100002', '2', 1000, 'นาย พีรวัส ขวัญแก้ว', '18396488647', '0990825942', '2023-10-31', '12:58:34', '3', 'failed', 'Y', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-scb.png', 'ทดสอบ'),
(8, 2, 'T2023103100003', '3', 500, 'นาย พีรวัส ขวัญแก้ว', '18396488647', '0990825942', '2023-10-31', '17:33:02', '3', 'failed', 'N', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-scb.png', 'ดสแบ'),
(9, 2, 'T2023103100004', '4', 200, 'นาย พีรวัส ขวัญแก้ว', '18396488647', '0990825942', '2023-10-31', '19:53:10', '3', 'failed', 'N', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-scb.png', 'gg'),
(10, 2, 'T2023103100005', '5', 200, 'นาย พีรวัส ขวัญแก้ว', '18396488647', '0990825942', '2023-10-31', '19:55:59', '3', 'failed', 'N', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-scb.png', '55555'),
(11, 2, 'T2023103100006', '6', 200, 'นาย พีรวัส ขวัญแก้ว', '18396488647', '0990825942', '2023-10-31', '20:07:19', '3', 'failed', 'N', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-scb.png', 'ถออออน'),
(12, 2, 'T2023103100007', '7', 200, 'นาย พีรวัส ขวัญแก้ว', '18396488647', '0990825942', '2023-10-31', '20:08:15', '3', 'failed', 'N', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-scb.png', 'assdad'),
(13, 2, 'T2023103100008', '8', 1650, 'นาย พีรวัส ขวัญแก้ว', '18396488647', '0990825942', '2023-10-31', '20:13:35', '3', 'failed', 'Y', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-scb.png', '55555'),
(14, 2, 'T2023103100009', '9', 450, 'นาย พีรวัส ขวัญแก้ว', '18396488647', '0990825942', '2023-10-31', '20:15:03', '3', 'failed', 'N', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-scb.png', '5555'),
(15, 2, 'T2023110100001', '1', 200, 'นาย พีรวัส ขวัญแก้ว', '18396488647', '0990825942', '2023-11-01', '03:31:04', '3', 'failed', 'N', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-scb.png', 'ทดลอง'),
(16, 2, 'T2023110100002', '2', 1108, 'victest', '0123456789', '0954789782', '2023-11-01', '03:47:59', '3', 'failed', 'Y', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-scb.png', 'FFFFF'),
(17, 2, 'T2023110100003', '3', 300, 'นาย พีรวัส ขวัญแก้ว', '18396488647', '0990825942', '2023-11-01', '03:48:24', '3', 'failed', 'N', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-scb.png', 'fWddsdswdsd'),
(18, 2, 'T2023110100004', '4', 300, 'นาย พีรวัส ขวัญแก้ว', '18396488647', '0990825942', '2023-11-01', '04:06:34', '3', 'failed', 'N', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-scb.png', 'ทดสอบ'),
(19, 2, 'T2023110100005', '5', 3000, 'นาย พีรวัส ขวัญแก้ว', '18396488647', '0990825942', '2023-11-01', '04:07:40', '3', 'failed', 'Y', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-scb.png', 'ทดสอบบบ'),
(20, 2, 'T2023110100006', '6', 200, 'นาย พีรวัส ขวัญแก้ว', '18396488647', '0990825942', '2023-11-01', '04:08:40', '3', 'failed', 'N', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-scb.png', 'TestTest'),
(21, 2, 'T2023110100007', '7', 200, 'นาย พีรวัส ขวัญแก้ว', '18396488647', '0990825942', '2023-11-01', '04:09:29', '3', 'failed', 'N', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-scb.png', 'testtesttest'),
(22, 2, 'T2023110100008', '8', 200, 'นาย พีรวัส ขวัญแก้ว', '18396488647', '0990825942', '2023-11-01', '04:10:08', '3', 'failed', 'N', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-scb.png', 'Noooo'),
(23, 2, 'T2023110100009', '9', 200, 'นาย พีรวัส ขวัญแก้ว', '18396488647', '0990825942', '2023-11-01', '04:14:17', '3', 'failed', 'N', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-scb.png', 'FoFoFo'),
(24, 2, 'T2023110100010', '10', 200, 'นาย พีรวัส ขวัญแก้ว', '18396488647', '0990825942', '2023-11-01', '04:14:45', '3', 'failed', 'N', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-scb.png', 'KoKo'),
(25, 2, 'T2023110100011', '11', 1108, 'victest', '0123456789', '0954789782', '2023-11-01', '04:15:12', '3', 'failed', 'Y', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-scb.png', 'testttesr'),
(26, 2, 'T2023110100012', '12', 200, 'นาย พีรวัส ขวัญแก้ว', '18396488647', '0990825942', '2023-11-01', '04:15:21', '3', 'failed', 'N', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-scb.png', 'fdfdfdfd'),
(27, 2, 'T2023110100013', '13', 1108, 'victest', '0123456789', '0954789782', '2023-11-01', '04:15:53', '3', 'failed', 'Y', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-scb.png', 'hfghfghf'),
(28, 2, 'T2023110100014', '14', 200, 'นาย พีรวัส ขวัญแก้ว', '18396488647', '0990825942', '2023-11-01', '04:15:55', '3', 'failed', 'N', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-scb.png', 'gfdgdd'),
(29, 2, 'T2023110100015', '15', 200, 'นาย พีรวัส ขวัญแก้ว', '18396488647', '0990825942', '2023-11-01', '04:16:36', '3', 'success', 'N', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-scb.png', 'ข้อมูลถูกต้อง'),
(30, 2, 'T2023110100016', '16', 1108, 'victest', '0123456789', '0954789782', '2023-11-01', '04:16:41', '3', 'failed', 'Y', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-scb.png', 'der'),
(31, 2, 'T2023110100017', '17', 100, 'victest', '0123456789', '0954789782', '2023-11-01', '10:02:01', '3', 'failed', 'N', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-scb.png', 'test'),
(32, 2, 'T2023110100018', '18', 100, 'victest', '0123456789', '0954789782', '2023-11-01', '10:03:47', '3', 'failed', 'N', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-scb.png', 'dd'),
(33, 2, 'T2023110100019', '19', 100, 'victest', '0123456789', '0954789782', '2023-11-01', '10:13:16', '3', 'failed', 'N', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-scb.png', '11'),
(34, 2, 'T2023110100020', '20', 100, 'victest', '0123456789', '0954789782', '2023-11-01', '10:14:00', '3', 'failed', 'N', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-scb.png', 'ddd'),
(35, 2, 'T2023110100021', '21', 101, 'victest', '0123456789', '0954789782', '2023-11-01', '10:15:08', '3', 'failed', 'N', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-scb.png', '101'),
(36, 2, 'T2023110100022', '22', 102, 'victest', '0123456789', '0954789782', '2023-11-01', '10:15:54', '3', 'failed', 'N', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-scb.png', '1010'),
(37, 2, 'T2023110100023', '23', 100, 'victest', '0123456789', '0954789782', '2023-11-01', '10:16:37', '3', 'failed', 'N', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-scb.png', 'GG'),
(38, 2, 'T2023110100024', '24', 103, 'victest', '0123456789', '0954789782', '2023-11-01', '10:17:47', '3', 'failed', 'N', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-scb.png', '103'),
(39, 2, 'T2023110100025', '25', 100, 'victest', '0123456789', '0954789782', '2023-11-01', '10:20:07', '3', 'failed', 'N', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-scb.png', 'dfdf'),
(40, 2, 'T2023110100026', '26', 100, 'victest', '0123456789', '0954789782', '2023-11-01', '10:20:55', '3', 'failed', 'N', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-scb.png', 'ccc'),
(41, 2, 'T2023110100027', '27', 100, 'victest', '0123456789', '0954789782', '2023-11-01', '10:25:47', '3', 'failed', 'N', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-scb.png', 'dfdfdf'),
(42, 2, 'T2023110100028', '28', 100, 'victest', '0123456789', '0954789782', '2023-11-01', '10:27:09', '3', 'failed', 'N', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-scb.png', 'fff'),
(43, 2, 'T2023110100029', '29', 100, 'victest', '0123456789', '0954789782', '2023-11-01', '10:28:00', '3', 'failed', 'N', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-scb.png', 'fdfdf'),
(44, 2, 'T2023-11-0200001', '1', 200, 'นาย พีรวัส ขวัญแก้ว', '8852932451', '0990825942', '2023-11-01', '18:27:11', '3', 'failed', 'N', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-scb.png', 'TestTest'),
(45, 2, 'T2023-11-0200002', '2', 100, 'victest', '0123456789', '0954789782', '2023-11-01', '18:27:47', '3', 'failed', 'N', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-scb.png', 'ss'),
(46, 2, 'T2023-11-0200003', '3', 200, 'นาย พีรวัส ขวัญแก้ว', '8852932451', '0990825942', '2023-11-02', '03:32:36', '3', 'failed', 'N', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-scb.png', 'ทดสอบ'),
(47, 2, 'T2023-11-0200004', '4', 300, 'นาย พีรวัส ขวัญแก้ว', '8852932451', '0990825942', '2023-11-02', '03:41:52', '3', 'failed', 'N', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-scb.png', 'ทดสอบ');

-- --------------------------------------------------------

--
-- Table structure for table `withdrawalaccount`
--

CREATE TABLE `withdrawalaccount` (
  `id` bigint NOT NULL,
  `bankName` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'ธนาคารไทยพาณิชย์',
  `accountName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `accountNumber` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `balance` int NOT NULL DEFAULT '0',
  `billmatched` int NOT NULL DEFAULT '0',
  `complated` int NOT NULL DEFAULT '0',
  `algorithm` enum('Sms','Bot Bank','Bank API') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Sms',
  `activestatus` enum('เปิดใช้งาน','ปิดใช้งาน') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'เปิดใช้งาน',
  `imgbank` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nameAccount` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `groupNewMember` enum('true','false') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'false',
  `groupBronze` enum('true','false') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'false',
  `groupSilver` enum('true','false') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'false',
  `groupGold` enum('true','false') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'false',
  `groupDiamond` enum('true','false') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'false',
  `auto_withdrawal` enum('true','false') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'false',
  `savingaccount` enum('true','false') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'false',
  `use_condition` enum('true','false') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'false',
  `for_promotion` enum('true','false') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'false',
  `billingpage` enum('true','false') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'false',
  `withdraw_over` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `agent`
--
ALTER TABLE `agent`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `allgame`
--
ALTER TABLE `allgame`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banknames`
--
ALTER TABLE `banknames`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comgogoldplanet`
--
ALTER TABLE `comgogoldplanet`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `commissionsubagent`
--
ALTER TABLE `commissionsubagent`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `creditpromotion`
--
ALTER TABLE `creditpromotion`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `depositaccount`
--
ALTER TABLE `depositaccount`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `game`
--
ALTER TABLE `game`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gamecamptotal`
--
ALTER TABLE `gamecamptotal`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gameweb`
--
ALTER TABLE `gameweb`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `imgpromotion`
--
ALTER TABLE `imgpromotion`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `logdaygame`
--
ALTER TABLE `logdaygame`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `logedit`
--
ALTER TABLE `logedit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `logeditadmin`
--
ALTER TABLE `logeditadmin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `logeditagent`
--
ALTER TABLE `logeditagent`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `logfinancerepost`
--
ALTER TABLE `logfinancerepost`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `logfinanceuser`
--
ALTER TABLE `logfinanceuser`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loggame`
--
ALTER TABLE `loggame`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mastergroup`
--
ALTER TABLE `mastergroup`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `percentgame`
--
ALTER TABLE `percentgame`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `repostgame`
--
ALTER TABLE `repostgame`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subagent`
--
ALTER TABLE `subagent`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `totalamountdaily`
--
ALTER TABLE `totalamountdaily`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `totalturnoverrepost`
--
ALTER TABLE `totalturnoverrepost`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `turnoverrepost`
--
ALTER TABLE `turnoverrepost`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_play`
--
ALTER TABLE `user_play`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdraw`
--
ALTER TABLE `withdraw`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdrawalaccount`
--
ALTER TABLE `withdrawalaccount`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `agent`
--
ALTER TABLE `agent`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `allgame`
--
ALTER TABLE `allgame`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `banknames`
--
ALTER TABLE `banknames`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `comgogoldplanet`
--
ALTER TABLE `comgogoldplanet`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `commissionsubagent`
--
ALTER TABLE `commissionsubagent`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `creditpromotion`
--
ALTER TABLE `creditpromotion`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `depositaccount`
--
ALTER TABLE `depositaccount`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `game`
--
ALTER TABLE `game`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `gamecamptotal`
--
ALTER TABLE `gamecamptotal`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `gameweb`
--
ALTER TABLE `gameweb`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `imgpromotion`
--
ALTER TABLE `imgpromotion`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `logdaygame`
--
ALTER TABLE `logdaygame`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `logedit`
--
ALTER TABLE `logedit`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `logeditadmin`
--
ALTER TABLE `logeditadmin`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `logeditagent`
--
ALTER TABLE `logeditagent`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `logfinancerepost`
--
ALTER TABLE `logfinancerepost`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `logfinanceuser`
--
ALTER TABLE `logfinanceuser`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `loggame`
--
ALTER TABLE `loggame`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `mastergroup`
--
ALTER TABLE `mastergroup`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `member`
--
ALTER TABLE `member`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `percentgame`
--
ALTER TABLE `percentgame`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `repostgame`
--
ALTER TABLE `repostgame`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=789;

--
-- AUTO_INCREMENT for table `subagent`
--
ALTER TABLE `subagent`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `totalamountdaily`
--
ALTER TABLE `totalamountdaily`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `totalturnoverrepost`
--
ALTER TABLE `totalturnoverrepost`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `turnoverrepost`
--
ALTER TABLE `turnoverrepost`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `user_play`
--
ALTER TABLE `user_play`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=513;

--
-- AUTO_INCREMENT for table `withdraw`
--
ALTER TABLE `withdraw`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `withdrawalaccount`
--
ALTER TABLE `withdrawalaccount`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
