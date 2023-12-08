SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

CREATE TABLE `admin` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `datetime_lastlogin` datetime DEFAULT NULL,
  `get_browser` longtext DEFAULT NULL,
  `status` enum('Y','N') NOT NULL DEFAULT 'Y',
  `status_delete` enum('Y','N') NOT NULL DEFAULT 'N',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `agent` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `website_name` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` enum('Y','N') NOT NULL DEFAULT 'Y',
  `status_delete` enum('Y','N') NOT NULL DEFAULT 'N',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `member` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `agent_id` bigint(20) DEFAULT 0,
  `user_code` varchar(25) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `balance` float(15,2) DEFAULT 0.00,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` enum('Y','N') NOT NULL DEFAULT 'Y',
  `status_delete` enum('Y','N') NOT NULL DEFAULT 'N',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `member` (`id`, `agent_id`, `user_code`, `name`, `balance`, `username`, `password`, `status`, `status_delete`, `created_at`, `updated_at`) VALUES
(1, NULL, 'member001', 'member001', 0.00, 'member001', '123', 'Y', 'N', '2023-04-01 01:56:00', '2023-04-01 01:56:00'),
(2, NULL, 'member002', 'member002', 0.00, 'member001', '123', 'Y', 'N', '2023-04-01 01:56:00', '2023-04-01 01:56:00');

CREATE TABLE `user_play` (
  `id` bigint(1) NOT NULL,
  `member_id` bigint(20) DEFAULT 0,
  `game_id` bigint(20) DEFAULT 0,
  `bet` float(16,2) DEFAULT 0.00,
  `win` float(16,2) DEFAULT 0.00,
  `tiles` longtext DEFAULT NULL,
  `winline` int(11) DEFAULT 0,
  `get_browser` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `user_play` (`id`, `member_id`, `game_id`, `bet`, `win`, `tiles`, `winline`, `get_browser`, `created_at`) VALUES
(1, 1, 1, 10.00, 10.00, 'index1,index2', 1, NULL, '2023-04-09 22:44:01'),
(2, 1, 1, 10.00, 10.00, 'index1,index2', 1, NULL, '2023-04-09 22:44:45'),
(3, 1, 1, 10.00, 10.00, 'index1,index2', 1, NULL, '2023-04-09 22:45:16');

ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `agent`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `member`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `user_play`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `admin`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `agent`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `member`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `user_play`
  MODIFY `id` bigint(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;
