/*
 Navicat Premium Data Transfer

 Source Server         : Fadaa Databases
 Source Server Type    : MySQL
 Source Server Version : 101110 (10.11.10-MariaDB-log)
 Source Host           : localhost:3306
 Source Schema         : task

 Target Server Type    : MySQL
 Target Server Version : 101110 (10.11.10-MariaDB-log)
 File Encoding         : 65001

 Date: 07/09/2025 23:04:15
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cache
-- ----------------------------
DROP TABLE IF EXISTS `cache`;
CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of cache
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for cache_locks
-- ----------------------------
DROP TABLE IF EXISTS `cache_locks`;
CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of cache_locks
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for job_batches
-- ----------------------------
DROP TABLE IF EXISTS `job_batches`;
CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of job_batches
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for jobs
-- ----------------------------
DROP TABLE IF EXISTS `jobs`;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of jobs
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
BEGIN;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (6, '0001_01_01_000000_create_users_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (7, '0001_01_01_000001_create_cache_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (8, '0001_01_01_000002_create_jobs_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (9, '2025_09_06_172207_create_personal_access_tokens_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (10, '2025_09_06_172506_create_tasks_table', 1);
COMMIT;

-- ----------------------------
-- Table structure for password_reset_tokens
-- ----------------------------
DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of password_reset_tokens
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for personal_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` text NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  KEY `personal_access_tokens_expires_at_index` (`expires_at`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of personal_access_tokens
-- ----------------------------
BEGIN;
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (1, 'App\\Models\\User', 4, 'api', 'af9fe984575661cd36fa58d97b3e232ee99748cecd172d0d6dfe3f0f071861ab', '[\"*\"]', '2025-09-07 19:47:25', NULL, '2025-09-07 19:40:24', '2025-09-07 19:47:25');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (2, 'App\\Models\\User', 4, 'api', 'fbc14848de8465aaff1c99e6a1139e151708dbbc8740b8cb4659ba9248398013', '[\"*\"]', NULL, NULL, '2025-09-07 19:49:04', '2025-09-07 19:49:04');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (3, 'App\\Models\\User', 4, 'api', 'b5dcc89511aa4019398844373a8714a2586ffb3556c5ca65f2f7c6d001a05864', '[\"*\"]', '2025-09-07 19:50:58', NULL, '2025-09-07 19:50:23', '2025-09-07 19:50:58');
COMMIT;

-- ----------------------------
-- Table structure for sessions
-- ----------------------------
DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of sessions
-- ----------------------------
BEGIN;
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES ('5xiMUeUVhaolRpWX8skiyHq5LhD1ZY8mNVznrLEc', NULL, '52.16.245.145', 'Mozilla/5.0 (X11; Linux x86_64; rv:83.0) Gecko/20100101 Firefox/83.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidGs3VXZyNUd6NHNEM0l4MkxoUHpjbzA4Qk1YZ1g0TUlWUlBCNFhPaSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHBzOi8vdGFzay5mYWRhYS1tYXJrZXRpbmcuY29tIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1757274093);
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES ('aqBSdhbHZvn0KhgoezWRlzzcoyVy2pNKC6JEZwYP', NULL, '196.137.202.34', 'PostmanRuntime/7.45.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVVBkUEtva0hldFVqdUJQQzVHUnJkbEc2SXZFM2R6OVdHc05IMFJRViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHBzOi8vdGFzay5mYWRhYS1tYXJrZXRpbmcuY29tL2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1757274590);
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES ('BmwDi0JnCD2dBn1qA4YiFT1gHMUn7dhRFubrkvbv', 4, '196.137.202.34', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiSXhxbHpEN2hoQUhzUThldHhiV0lzUkh3bWlwVTlucmk2R1Q0aXUwdSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHBzOi8vdGFzay5mYWRhYS1tYXJrZXRpbmcuY29tIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6NDt9', 1757274816);
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES ('DW2R8HJCUA7HkYffJIn9b3NObVGvgkAipSeyoOoI', NULL, '104.164.126.10', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVkYxbGZPUWJ0RGlSNUFkVXRYOXc3WkRtZWViS282WHVJN1loRk1NbyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHBzOi8vdGFzay5mYWRhYS1tYXJrZXRpbmcuY29tIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1757274799);
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES ('frh3la61KLc49ErAxupEZOd3uCQCpCOMnvHs4CuP', NULL, '52.16.245.145', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiemg4M2FVemdlRTdmNUNnNFlibVJYZnpudnNidFdxSVpobjIyanNJRyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHBzOi8vdGFzay5mYWRhYS1tYXJrZXRpbmcuY29tIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1757274094);
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES ('L0iJSUfZ78XzGQcnsS5UIgr8E8JkQ7orfAmIhfpd', NULL, '34.170.36.71', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoid1luSjZ1RnZqeUJBQ0xGMUsyaU1CMWtDV1NsQVRhdGJJZUJBZE1WTCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly90YXNrLmZhZGFhLW1hcmtldGluZy5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1757274294);
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES ('MNeuGFePDVqd4k5vF8WpqiaPZqtvGhVFJWDWMfYE', NULL, '104.164.126.10', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWUpIR2pnQ0xtS3BLZnNVOUhBUDZwZ0RXWDJIYlNRcGtOTG05MTlPZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHBzOi8vdGFzay5mYWRhYS1tYXJrZXRpbmcuY29tIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1757274835);
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES ('PdTC5lfWSgDIrCJWSxOLa8oXBa1kpXwDzKjdtfas', NULL, '104.164.126.176', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNU9oUGtsYUZrbHRTTmUxWTQ5aWhCZFBJSVdOWGVETURJYkdxaEdtTCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHBzOi8vdGFzay5mYWRhYS1tYXJrZXRpbmcuY29tIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1757274442);
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES ('PG0jIMKMOWza2B7WzurNBFC5CvXjKiYQvrfJx2sF', NULL, '103.196.9.241', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNHA4bUFkVFprcHpwR1pld0dGWDNvdHN2WFlXV0dLbVhrYm9Bb3BOZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHBzOi8vdGFzay5mYWRhYS1tYXJrZXRpbmcuY29tIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1757274786);
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES ('QrvPL6BFBOSlSAn5rkMMaQFx6TpCbnw4cf463ufk', NULL, '52.16.245.145', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.152 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiN2JjR0J4MUlmTEV6YmtuazY3RkQ2VUZpREx3bk9QMHRFOTloZTNONCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHBzOi8vdGFzay5mYWRhYS1tYXJrZXRpbmcuY29tIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1757274094);
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES ('qViNT7kNWE4LgGd7v2crErBR6w4nVyKjyJkmedaE', NULL, '104.164.126.126', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOXNrNHMwU1czQ2NUaVljNGlUQ3g3M053MVRvWEZpb0VDUGJGZnp0QiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHBzOi8vdGFzay5mYWRhYS1tYXJrZXRpbmcuY29tIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1757274442);
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES ('YknVQ7IG3in8tbLfgGJg98DeOL8BsaNcsVxE3Qce', NULL, '103.4.250.101', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRTBTWjJmVTNkaUxQZHFFVjhhb0hSZnEwR25TSE9Hclh1cTNoT0xCTSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHBzOi8vdGFzay5mYWRhYS1tYXJrZXRpbmcuY29tIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1757274467);
COMMIT;

-- ----------------------------
-- Table structure for tasks
-- ----------------------------
DROP TABLE IF EXISTS `tasks`;
CREATE TABLE `tasks` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `column` enum('todo','in_progress','done') NOT NULL DEFAULT 'todo',
  `due_date` date DEFAULT NULL,
  `priority` tinyint(3) unsigned NOT NULL DEFAULT 3,
  `meta` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`meta`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tasks_user_id_foreign` (`user_id`),
  CONSTRAINT `tasks_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tasks
-- ----------------------------
BEGIN;
INSERT INTO `tasks` (`id`, `user_id`, `title`, `description`, `column`, `due_date`, `priority`, `meta`, `created_at`, `updated_at`) VALUES (1, 1, 'Modi quae delectus veritatis aliquam.', 'Quas molestias at possimus enim culpa sit. Voluptatem quibusdam molestias quidem facilis suscipit aliquam. Maxime est illo quam quis voluptas totam.', 'done', NULL, 3, '{\"labels\":[\"feature\",\"bug\"]}', '2025-09-07 19:31:25', '2025-09-07 19:31:25');
INSERT INTO `tasks` (`id`, `user_id`, `title`, `description`, `column`, `due_date`, `priority`, `meta`, `created_at`, `updated_at`) VALUES (2, 1, 'Ipsam non qui.', 'Voluptatem rerum iure ut excepturi nihil consequatur. Placeat expedita minima autem ut minus aut. Voluptas ut illo sit maiores perferendis. Ipsa adipisci voluptas doloremque inventore molestiae debitis quo. Odio saepe dolor est et porro aut.', 'done', '2025-09-25', 4, '{\"labels\":[\"bug\",\"feature\"]}', '2025-09-07 19:31:25', '2025-09-07 19:31:25');
INSERT INTO `tasks` (`id`, `user_id`, `title`, `description`, `column`, `due_date`, `priority`, `meta`, `created_at`, `updated_at`) VALUES (3, 1, 'Id assumenda id quod quo molestias.', NULL, 'in_progress', NULL, 3, '{\"labels\":[\"bug\"]}', '2025-09-07 19:31:25', '2025-09-07 19:31:25');
INSERT INTO `tasks` (`id`, `user_id`, `title`, `description`, `column`, `due_date`, `priority`, `meta`, `created_at`, `updated_at`) VALUES (4, 1, 'Inventore dolor est dicta saepe libero.', 'Dolor nisi voluptate et nobis. Temporibus facilis est dolorem illo saepe corporis. Voluptate et et nostrum voluptate voluptatibus cumque.', 'in_progress', NULL, 5, '{\"labels\":[\"urgent\"]}', '2025-09-07 19:31:25', '2025-09-07 19:31:25');
INSERT INTO `tasks` (`id`, `user_id`, `title`, `description`, `column`, `due_date`, `priority`, `meta`, `created_at`, `updated_at`) VALUES (5, 1, 'Impedit unde molestiae repudiandae.', NULL, 'todo', NULL, 3, '{\"labels\":[]}', '2025-09-07 19:31:25', '2025-09-07 19:31:25');
INSERT INTO `tasks` (`id`, `user_id`, `title`, `description`, `column`, `due_date`, `priority`, `meta`, `created_at`, `updated_at`) VALUES (6, 1, 'Nemo aperiam voluptatem nobis.', NULL, 'in_progress', '2025-09-26', 3, '{\"labels\":[]}', '2025-09-07 19:31:25', '2025-09-07 19:31:25');
INSERT INTO `tasks` (`id`, `user_id`, `title`, `description`, `column`, `due_date`, `priority`, `meta`, `created_at`, `updated_at`) VALUES (7, 1, 'Qui iusto nisi reiciendis recusandae sunt.', 'Animi asperiores facilis et quos porro. Maxime repellat aliquam ducimus vel. Est asperiores earum ab illum ut dolorem.', 'done', '2025-09-15', 2, '{\"labels\":[\"feature\"]}', '2025-09-07 19:31:25', '2025-09-07 19:31:25');
INSERT INTO `tasks` (`id`, `user_id`, `title`, `description`, `column`, `due_date`, `priority`, `meta`, `created_at`, `updated_at`) VALUES (8, 1, 'Magnam expedita reprehenderit.', 'Aut sed natus eius impedit veritatis. Sint ut corrupti dicta. Dicta nostrum illum fugiat dignissimos id. Quis libero voluptatem rerum saepe fugiat minus.', 'done', NULL, 1, '{\"labels\":[\"bug\"]}', '2025-09-07 19:31:25', '2025-09-07 19:31:25');
INSERT INTO `tasks` (`id`, `user_id`, `title`, `description`, `column`, `due_date`, `priority`, `meta`, `created_at`, `updated_at`) VALUES (9, 1, 'Et maiores fugit molestias sunt.', 'Delectus harum fuga aspernatur eius. Facere provident ullam id. Quia aut id sint voluptatum perferendis laboriosam dolorem. Aut rerum porro ullam inventore perferendis inventore id qui.', 'done', NULL, 3, '{\"labels\":[\"bug\"]}', '2025-09-07 19:31:25', '2025-09-07 19:31:25');
INSERT INTO `tasks` (`id`, `user_id`, `title`, `description`, `column`, `due_date`, `priority`, `meta`, `created_at`, `updated_at`) VALUES (10, 1, 'Cumque doloribus magni id totam illum.', 'Autem explicabo esse et nihil et nulla vero. Reprehenderit et a dolorem omnis illum. Voluptas porro quia cupiditate. Dolor velit beatae velit deserunt earum vel tempora modi. Sed repellendus nesciunt vitae minima.', 'in_progress', NULL, 3, '{\"labels\":[\"bug\"]}', '2025-09-07 19:31:25', '2025-09-07 19:31:25');
INSERT INTO `tasks` (`id`, `user_id`, `title`, `description`, `column`, `due_date`, `priority`, `meta`, `created_at`, `updated_at`) VALUES (11, 1, 'Veritatis magnam sunt beatae eum sed.', 'Odit quia tempore dolorem quaerat recusandae velit molestias veniam. Voluptas et rerum rerum tenetur facere exercitationem itaque. Corrupti tempore ut voluptas deleniti porro eaque magni. Est unde cupiditate porro nobis sunt quisquam laboriosam.', 'todo', NULL, 5, '{\"labels\":[]}', '2025-09-07 19:31:25', '2025-09-07 19:31:25');
INSERT INTO `tasks` (`id`, `user_id`, `title`, `description`, `column`, `due_date`, `priority`, `meta`, `created_at`, `updated_at`) VALUES (12, 1, 'Possimus asperiores nobis expedita et.', 'Est perspiciatis deleniti iure omnis doloremque. Possimus totam laborum inventore ullam voluptatum suscipit dolores. Consequatur voluptate est et et. Quae alias aut possimus architecto mollitia quia.', 'in_progress', NULL, 5, '{\"labels\":[\"feature\"]}', '2025-09-07 19:31:25', '2025-09-07 19:31:25');
INSERT INTO `tasks` (`id`, `user_id`, `title`, `description`, `column`, `due_date`, `priority`, `meta`, `created_at`, `updated_at`) VALUES (13, 1, 'Amet totam tenetur accusamus.', 'Ipsum blanditiis repellat qui molestiae molestiae. Consequatur aut velit alias perspiciatis odio. Molestias cumque perspiciatis nulla dolores nesciunt accusantium non. Iste tempora quis nihil enim iste.', 'in_progress', NULL, 5, '{\"labels\":[\"urgent\"]}', '2025-09-07 19:31:25', '2025-09-07 19:31:25');
INSERT INTO `tasks` (`id`, `user_id`, `title`, `description`, `column`, `due_date`, `priority`, `meta`, `created_at`, `updated_at`) VALUES (14, 1, 'Quisquam possimus consequatur tempore.', NULL, 'done', '2025-09-15', 3, '{\"labels\":[\"bug\",\"urgent\"]}', '2025-09-07 19:31:25', '2025-09-07 19:31:25');
INSERT INTO `tasks` (`id`, `user_id`, `title`, `description`, `column`, `due_date`, `priority`, `meta`, `created_at`, `updated_at`) VALUES (15, 1, 'Sit ab sunt.', NULL, 'in_progress', '2025-10-07', 3, '{\"labels\":[]}', '2025-09-07 19:31:25', '2025-09-07 19:31:25');
INSERT INTO `tasks` (`id`, `user_id`, `title`, `description`, `column`, `due_date`, `priority`, `meta`, `created_at`, `updated_at`) VALUES (16, 2, 'Consequatur reiciendis laudantium est.', NULL, 'todo', NULL, 1, '{\"labels\":[]}', '2025-09-07 19:31:25', '2025-09-07 19:31:25');
INSERT INTO `tasks` (`id`, `user_id`, `title`, `description`, `column`, `due_date`, `priority`, `meta`, `created_at`, `updated_at`) VALUES (17, 2, 'Amet et et et quaerat.', NULL, 'todo', '2025-09-15', 2, '{\"labels\":[\"feature\"]}', '2025-09-07 19:31:25', '2025-09-07 19:31:25');
INSERT INTO `tasks` (`id`, `user_id`, `title`, `description`, `column`, `due_date`, `priority`, `meta`, `created_at`, `updated_at`) VALUES (18, 2, 'Molestiae omnis perspiciatis sequi laborum.', NULL, 'todo', '2025-10-05', 5, '{\"labels\":[\"feature\"]}', '2025-09-07 19:31:25', '2025-09-07 19:31:25');
INSERT INTO `tasks` (`id`, `user_id`, `title`, `description`, `column`, `due_date`, `priority`, `meta`, `created_at`, `updated_at`) VALUES (19, 2, 'Non fugiat aut magni eos enim.', NULL, 'in_progress', '2025-09-28', 1, '{\"labels\":[\"urgent\"]}', '2025-09-07 19:31:25', '2025-09-07 19:31:25');
INSERT INTO `tasks` (`id`, `user_id`, `title`, `description`, `column`, `due_date`, `priority`, `meta`, `created_at`, `updated_at`) VALUES (20, 2, 'Adipisci omnis eum totam.', NULL, 'done', '2025-09-26', 4, '{\"labels\":[]}', '2025-09-07 19:31:25', '2025-09-07 19:31:25');
INSERT INTO `tasks` (`id`, `user_id`, `title`, `description`, `column`, `due_date`, `priority`, `meta`, `created_at`, `updated_at`) VALUES (21, 2, 'Officiis incidunt fugiat voluptatum.', NULL, 'todo', '2025-09-20', 3, '{\"labels\":[\"feature\"]}', '2025-09-07 19:31:25', '2025-09-07 19:31:25');
INSERT INTO `tasks` (`id`, `user_id`, `title`, `description`, `column`, `due_date`, `priority`, `meta`, `created_at`, `updated_at`) VALUES (22, 2, 'Eum amet praesentium error.', NULL, 'in_progress', NULL, 3, '{\"labels\":[]}', '2025-09-07 19:31:25', '2025-09-07 19:31:25');
INSERT INTO `tasks` (`id`, `user_id`, `title`, `description`, `column`, `due_date`, `priority`, `meta`, `created_at`, `updated_at`) VALUES (23, 2, 'Rerum aut atque sequi.', 'Voluptas facilis explicabo modi corrupti et. Veniam voluptatem nemo sequi. Non eius architecto libero officiis.', 'in_progress', '2025-09-19', 2, '{\"labels\":[]}', '2025-09-07 19:31:25', '2025-09-07 19:31:25');
INSERT INTO `tasks` (`id`, `user_id`, `title`, `description`, `column`, `due_date`, `priority`, `meta`, `created_at`, `updated_at`) VALUES (24, 2, 'Quia illo omnis aut sequi et.', NULL, 'todo', NULL, 5, '{\"labels\":[]}', '2025-09-07 19:31:25', '2025-09-07 19:31:25');
INSERT INTO `tasks` (`id`, `user_id`, `title`, `description`, `column`, `due_date`, `priority`, `meta`, `created_at`, `updated_at`) VALUES (25, 2, 'Cum et quasi voluptatem.', 'Aut veniam eius sed culpa velit qui. Velit eum nisi assumenda magni consectetur blanditiis. Ullam qui alias officiis et.', 'todo', NULL, 2, '{\"labels\":[\"bug\"]}', '2025-09-07 19:31:25', '2025-09-07 19:31:25');
INSERT INTO `tasks` (`id`, `user_id`, `title`, `description`, `column`, `due_date`, `priority`, `meta`, `created_at`, `updated_at`) VALUES (26, 2, 'Necessitatibus quam ut consequatur temporibus.', 'Praesentium vel est hic ipsum. Iure nostrum non enim harum autem nihil. Officia corrupti doloremque et et ea. Enim consequatur est sunt at et. Consequuntur est atque qui.', 'in_progress', NULL, 3, '{\"labels\":[\"feature\"]}', '2025-09-07 19:31:25', '2025-09-07 19:31:25');
INSERT INTO `tasks` (`id`, `user_id`, `title`, `description`, `column`, `due_date`, `priority`, `meta`, `created_at`, `updated_at`) VALUES (27, 2, 'Dolorem voluptas eos et.', NULL, 'done', '2025-09-28', 3, '{\"labels\":[]}', '2025-09-07 19:31:25', '2025-09-07 19:31:25');
INSERT INTO `tasks` (`id`, `user_id`, `title`, `description`, `column`, `due_date`, `priority`, `meta`, `created_at`, `updated_at`) VALUES (28, 2, 'Maxime quia et voluptatem.', NULL, 'todo', NULL, 2, '{\"labels\":[]}', '2025-09-07 19:31:25', '2025-09-07 19:31:25');
INSERT INTO `tasks` (`id`, `user_id`, `title`, `description`, `column`, `due_date`, `priority`, `meta`, `created_at`, `updated_at`) VALUES (29, 2, 'Odio sequi odit labore ab beatae.', NULL, 'done', NULL, 1, '{\"labels\":[\"bug\",\"urgent\"]}', '2025-09-07 19:31:25', '2025-09-07 19:31:25');
INSERT INTO `tasks` (`id`, `user_id`, `title`, `description`, `column`, `due_date`, `priority`, `meta`, `created_at`, `updated_at`) VALUES (30, 2, 'Eos accusantium quaerat similique similique ut.', 'Quae amet commodi recusandae aut qui ea doloremque. Sed sequi ut ad molestiae est aut omnis.', 'in_progress', '2025-09-12', 5, '{\"labels\":[]}', '2025-09-07 19:31:25', '2025-09-07 19:31:25');
INSERT INTO `tasks` (`id`, `user_id`, `title`, `description`, `column`, `due_date`, `priority`, `meta`, `created_at`, `updated_at`) VALUES (31, 3, 'Consequatur molestiae in consequuntur nisi officiis.', NULL, 'todo', NULL, 3, '{\"labels\":[\"feature\",\"bug\"]}', '2025-09-07 19:31:25', '2025-09-07 19:31:25');
INSERT INTO `tasks` (`id`, `user_id`, `title`, `description`, `column`, `due_date`, `priority`, `meta`, `created_at`, `updated_at`) VALUES (32, 3, 'Et sint aspernatur error et.', 'Autem eum molestias ut iure. Qui ipsam veritatis maiores temporibus. Nesciunt qui quas laboriosam qui nobis error fugiat.', 'in_progress', NULL, 3, '{\"labels\":[\"feature\"]}', '2025-09-07 19:31:25', '2025-09-07 19:31:25');
INSERT INTO `tasks` (`id`, `user_id`, `title`, `description`, `column`, `due_date`, `priority`, `meta`, `created_at`, `updated_at`) VALUES (33, 3, 'Et numquam adipisci ut.', 'Quo reiciendis ut omnis perferendis necessitatibus molestiae. Quisquam id voluptas voluptatem. Impedit laboriosam sit hic est. Nostrum voluptatem vel ut unde dolores.', 'done', NULL, 2, '{\"labels\":[]}', '2025-09-07 19:31:25', '2025-09-07 19:31:25');
INSERT INTO `tasks` (`id`, `user_id`, `title`, `description`, `column`, `due_date`, `priority`, `meta`, `created_at`, `updated_at`) VALUES (34, 3, 'Optio iusto suscipit qui asperiores.', 'Dolorem ex quaerat sit. Eum minima possimus corporis quis sit eius repudiandae. Nemo dignissimos sit iure amet et facere.', 'in_progress', '2025-09-25', 4, '{\"labels\":[\"urgent\"]}', '2025-09-07 19:31:25', '2025-09-07 19:31:25');
INSERT INTO `tasks` (`id`, `user_id`, `title`, `description`, `column`, `due_date`, `priority`, `meta`, `created_at`, `updated_at`) VALUES (35, 3, 'Repudiandae iste ab eaque.', NULL, 'in_progress', '2025-09-26', 4, '{\"labels\":[]}', '2025-09-07 19:31:25', '2025-09-07 19:31:25');
INSERT INTO `tasks` (`id`, `user_id`, `title`, `description`, `column`, `due_date`, `priority`, `meta`, `created_at`, `updated_at`) VALUES (36, 3, 'Ut repudiandae quia voluptatum sapiente non.', NULL, 'in_progress', '2025-09-11', 3, '{\"labels\":[]}', '2025-09-07 19:31:25', '2025-09-07 19:31:25');
INSERT INTO `tasks` (`id`, `user_id`, `title`, `description`, `column`, `due_date`, `priority`, `meta`, `created_at`, `updated_at`) VALUES (37, 3, 'Fuga sit inventore.', 'Quas autem eum ea expedita distinctio vel. Quidem odio quo sequi asperiores corporis. Error sed quis suscipit.', 'todo', '2025-09-15', 5, '{\"labels\":[\"urgent\"]}', '2025-09-07 19:31:25', '2025-09-07 19:31:25');
INSERT INTO `tasks` (`id`, `user_id`, `title`, `description`, `column`, `due_date`, `priority`, `meta`, `created_at`, `updated_at`) VALUES (38, 3, 'Vel quasi iure non rerum.', NULL, 'todo', '2025-09-16', 1, '{\"labels\":[\"urgent\"]}', '2025-09-07 19:31:25', '2025-09-07 19:31:25');
INSERT INTO `tasks` (`id`, `user_id`, `title`, `description`, `column`, `due_date`, `priority`, `meta`, `created_at`, `updated_at`) VALUES (39, 3, 'Est id rerum eveniet aut.', 'Aut iure qui necessitatibus fugit doloribus molestias. Totam cum odio in. Placeat eos quia voluptas optio eum porro aliquam amet. Pariatur non quas dolore praesentium deleniti aperiam vero.', 'in_progress', NULL, 5, '{\"labels\":[\"feature\",\"bug\"]}', '2025-09-07 19:31:25', '2025-09-07 19:31:25');
INSERT INTO `tasks` (`id`, `user_id`, `title`, `description`, `column`, `due_date`, `priority`, `meta`, `created_at`, `updated_at`) VALUES (40, 3, 'Deleniti fugiat aspernatur quos.', NULL, 'in_progress', NULL, 4, '{\"labels\":[\"bug\"]}', '2025-09-07 19:31:25', '2025-09-07 19:31:25');
INSERT INTO `tasks` (`id`, `user_id`, `title`, `description`, `column`, `due_date`, `priority`, `meta`, `created_at`, `updated_at`) VALUES (41, 3, 'Sed rem unde voluptas qui.', NULL, 'done', NULL, 1, '{\"labels\":[]}', '2025-09-07 19:31:25', '2025-09-07 19:31:25');
INSERT INTO `tasks` (`id`, `user_id`, `title`, `description`, `column`, `due_date`, `priority`, `meta`, `created_at`, `updated_at`) VALUES (42, 3, 'Ipsam officia qui.', 'Impedit minus sunt sint ut sed ut saepe. Magnam soluta nulla necessitatibus.', 'todo', '2025-09-19', 3, '{\"labels\":[]}', '2025-09-07 19:31:25', '2025-09-07 19:31:25');
INSERT INTO `tasks` (`id`, `user_id`, `title`, `description`, `column`, `due_date`, `priority`, `meta`, `created_at`, `updated_at`) VALUES (43, 3, 'Deserunt asperiores nisi sapiente eum.', 'Omnis perferendis corrupti quia excepturi iusto. Sed fuga ut odio odio labore qui. Maxime quia nostrum ea.', 'done', NULL, 3, '{\"labels\":[\"urgent\"]}', '2025-09-07 19:31:25', '2025-09-07 19:31:25');
INSERT INTO `tasks` (`id`, `user_id`, `title`, `description`, `column`, `due_date`, `priority`, `meta`, `created_at`, `updated_at`) VALUES (44, 3, 'Pariatur similique laborum aliquam.', NULL, 'done', '2025-09-28', 4, '{\"labels\":[\"feature\"]}', '2025-09-07 19:31:25', '2025-09-07 19:31:25');
INSERT INTO `tasks` (`id`, `user_id`, `title`, `description`, `column`, `due_date`, `priority`, `meta`, `created_at`, `updated_at`) VALUES (45, 3, 'Quae velit natus excepturi voluptatem nemo.', NULL, 'todo', '2025-09-10', 3, '{\"labels\":[]}', '2025-09-07 19:31:25', '2025-09-07 19:31:25');
INSERT INTO `tasks` (`id`, `user_id`, `title`, `description`, `column`, `due_date`, `priority`, `meta`, `created_at`, `updated_at`) VALUES (46, 4, 'Repellendus impedit asperiores quo.', 'Magnam non est earum beatae error id. Eius rerum neque impedit qui. Consequatur rem consectetur dolor rerum. Nisi quaerat excepturi omnis repudiandae aut ipsum illo nam.', 'in_progress', '2025-09-18', 4, '{\"labels\":[\"bug\"]}', '2025-09-07 19:31:25', '2025-09-07 19:31:25');
INSERT INTO `tasks` (`id`, `user_id`, `title`, `description`, `column`, `due_date`, `priority`, `meta`, `created_at`, `updated_at`) VALUES (47, 4, 'Nostrum sed assumenda tenetur.', NULL, 'todo', NULL, 4, '{\"labels\":[]}', '2025-09-07 19:31:25', '2025-09-07 19:31:25');
INSERT INTO `tasks` (`id`, `user_id`, `title`, `description`, `column`, `due_date`, `priority`, `meta`, `created_at`, `updated_at`) VALUES (48, 4, 'Similique eum rem error harum.', 'Rerum deserunt et sed ducimus ab. Saepe consequuntur velit et perspiciatis ratione ad laborum. Perspiciatis et quisquam qui animi quia autem. Delectus aliquid omnis aliquam distinctio dolores non tempore.', 'done', NULL, 5, '{\"labels\":[\"bug\"]}', '2025-09-07 19:31:25', '2025-09-07 19:31:25');
INSERT INTO `tasks` (`id`, `user_id`, `title`, `description`, `column`, `due_date`, `priority`, `meta`, `created_at`, `updated_at`) VALUES (49, 4, 'Praesentium commodi quia et perspiciatis id.', NULL, 'done', '2025-09-19', 4, '{\"labels\":[\"bug\"]}', '2025-09-07 19:31:25', '2025-09-07 19:31:25');
INSERT INTO `tasks` (`id`, `user_id`, `title`, `description`, `column`, `due_date`, `priority`, `meta`, `created_at`, `updated_at`) VALUES (50, 4, 'Laboriosam autem id beatae fugit consequatur.', 'Aut hic exercitationem quis qui voluptates. Aliquid porro perspiciatis in provident et. Corrupti architecto voluptatum aliquam vel. In qui enim totam est eius nisi.', 'done', '2025-09-19', 1, '{\"labels\":[\"urgent\",\"bug\"]}', '2025-09-07 19:31:25', '2025-09-07 19:31:25');
INSERT INTO `tasks` (`id`, `user_id`, `title`, `description`, `column`, `due_date`, `priority`, `meta`, `created_at`, `updated_at`) VALUES (51, 4, 'Dolor voluptatem consequuntur placeat molestiae.', NULL, 'in_progress', '2025-09-19', 4, '{\"labels\":[]}', '2025-09-07 19:31:25', '2025-09-07 19:31:25');
INSERT INTO `tasks` (`id`, `user_id`, `title`, `description`, `column`, `due_date`, `priority`, `meta`, `created_at`, `updated_at`) VALUES (52, 4, 'Rerum enim voluptatem dolorem facere.', NULL, 'in_progress', NULL, 2, '{\"labels\":[]}', '2025-09-07 19:31:25', '2025-09-07 19:31:25');
INSERT INTO `tasks` (`id`, `user_id`, `title`, `description`, `column`, `due_date`, `priority`, `meta`, `created_at`, `updated_at`) VALUES (53, 4, 'Et minima libero quia officiis est.', 'Amet mollitia ullam aliquid dolorem voluptatibus reprehenderit sit voluptatem. Et sed aspernatur illum natus. Iusto dolor consequatur ea tempora molestiae ut sapiente. Molestiae eaque dolorum quos architecto sit omnis similique.', 'done', NULL, 4, '{\"labels\":[]}', '2025-09-07 19:31:25', '2025-09-07 19:31:25');
INSERT INTO `tasks` (`id`, `user_id`, `title`, `description`, `column`, `due_date`, `priority`, `meta`, `created_at`, `updated_at`) VALUES (54, 4, 'Totam aperiam repellendus natus.', NULL, 'todo', NULL, 5, '{\"labels\":[\"bug\",\"urgent\"]}', '2025-09-07 19:31:25', '2025-09-07 19:31:25');
INSERT INTO `tasks` (`id`, `user_id`, `title`, `description`, `column`, `due_date`, `priority`, `meta`, `created_at`, `updated_at`) VALUES (55, 4, 'Voluptas ut id quo.', NULL, 'in_progress', NULL, 2, '{\"labels\":[\"bug\",\"urgent\"]}', '2025-09-07 19:31:25', '2025-09-07 19:31:25');
INSERT INTO `tasks` (`id`, `user_id`, `title`, `description`, `column`, `due_date`, `priority`, `meta`, `created_at`, `updated_at`) VALUES (56, 4, 'Ex tempora ab qui dolores.', 'Excepturi ab non aperiam vero odio. Sunt illum repellendus esse tempora nulla aspernatur et. Ipsam expedita neque explicabo. Non velit soluta excepturi nam ab reiciendis distinctio.', 'todo', NULL, 4, '{\"labels\":[]}', '2025-09-07 19:31:25', '2025-09-07 19:31:25');
INSERT INTO `tasks` (`id`, `user_id`, `title`, `description`, `column`, `due_date`, `priority`, `meta`, `created_at`, `updated_at`) VALUES (57, 4, 'Iusto esse dicta quam quidem.', 'Similique magnam molestiae ut omnis harum ipsa architecto. Velit accusamus quia distinctio nihil aut.', 'in_progress', NULL, 3, '{\"labels\":[\"bug\"]}', '2025-09-07 19:31:25', '2025-09-07 19:31:25');
INSERT INTO `tasks` (`id`, `user_id`, `title`, `description`, `column`, `due_date`, `priority`, `meta`, `created_at`, `updated_at`) VALUES (58, 4, 'Quis est consequatur voluptas quo.', 'Quidem et fugiat ratione sit ut non esse. Debitis adipisci quas neque quod sit nemo culpa et. Rerum et ut sunt soluta sit id.', 'todo', '2025-09-26', 5, '{\"labels\":[\"feature\",\"bug\"]}', '2025-09-07 19:31:25', '2025-09-07 19:31:25');
INSERT INTO `tasks` (`id`, `user_id`, `title`, `description`, `column`, `due_date`, `priority`, `meta`, `created_at`, `updated_at`) VALUES (59, 4, 'Incidunt aut adipisci quaerat est.', NULL, 'todo', NULL, 1, '{\"labels\":[\"feature\",\"urgent\"]}', '2025-09-07 19:31:25', '2025-09-07 19:31:25');
INSERT INTO `tasks` (`id`, `user_id`, `title`, `description`, `column`, `due_date`, `priority`, `meta`, `created_at`, `updated_at`) VALUES (60, 4, 'Quibusdam et ratione quidem hic dolores.', 'Aut aliquid est harum alias. Iusto dolorum culpa quod sint dicta sit excepturi inventore. Enim ratione minima tempora deserunt est nesciunt. Sunt nemo quibusdam voluptas nostrum veritatis fugit commodi.', 'in_progress', NULL, 5, '{\"labels\":[\"feature\"]}', '2025-09-07 19:31:25', '2025-09-07 19:31:25');
INSERT INTO `tasks` (`id`, `user_id`, `title`, `description`, `column`, `due_date`, `priority`, `meta`, `created_at`, `updated_at`) VALUES (61, 4, 'hello', 'welcome', 'in_progress', NULL, 2, NULL, '2025-09-07 19:45:08', '2025-09-07 19:45:08');
INSERT INTO `tasks` (`id`, `user_id`, `title`, `description`, `column`, `due_date`, `priority`, `meta`, `created_at`, `updated_at`) VALUES (62, 4, 'test task create', NULL, 'in_progress', NULL, 2, NULL, '2025-09-07 19:50:58', '2025-09-07 19:50:58');
COMMIT;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES (1, 'Prof. Chelsey Runte II', 'matteo.herman@example.net', '2025-09-07 19:31:24', '$2y$12$QOGq7KEJtidqTzTgez4APeOU.2609BcL8kgg4Auf34UA1vRZHjrFe', '7Ul473V4Vq', '2025-09-07 19:31:24', '2025-09-07 19:31:24');
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES (2, 'Miss Bianka Ryan PhD', 'wilton.franecki@example.net', '2025-09-07 19:31:24', '$2y$12$QOGq7KEJtidqTzTgez4APeOU.2609BcL8kgg4Auf34UA1vRZHjrFe', 'WrT6zWFZyk', '2025-09-07 19:31:24', '2025-09-07 19:31:24');
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES (3, 'Torey Vandervort', 'hthompson@example.com', '2025-09-07 19:31:24', '$2y$12$QOGq7KEJtidqTzTgez4APeOU.2609BcL8kgg4Auf34UA1vRZHjrFe', 'obN7zUZmsW', '2025-09-07 19:31:24', '2025-09-07 19:31:24');
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES (4, 'Demo User', 'demo@example.com', '2025-09-07 19:31:25', '$2y$12$pjaBg9rIq7vz0xDCJGUL1ekUGKD23PP.wR0HoYiV./yBviRoofWwS', 'APqlwWD7nC', '2025-09-07 19:31:25', '2025-09-07 19:31:25');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
