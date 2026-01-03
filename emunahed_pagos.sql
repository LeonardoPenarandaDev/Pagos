-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 03-01-2026 a las 17:05:34
-- Versión del servidor: 8.0.41-cll-lve
-- Versión de PHP: 8.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `emunahed_pagos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `courses`
--

CREATE TABLE `courses` (
  `id` int NOT NULL,
  `course` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `level` varchar(150) NOT NULL,
  `total_amount` float NOT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `courses`
--

INSERT INTO `courses` (`id`, `course`, `description`, `level`, `total_amount`, `date_created`) VALUES
(3, '0. Pre-Jardin', 'TOTAL MENSUALIDADES', '1', 1533600, '2024-02-18 21:23:48'),
(4, '0. Jardin', 'TOTAL MANSUALIDADES', '1', 1533600, '2024-02-18 21:24:29'),
(5, '0. Transicion', 'TOTAL MENSUALIDADES', '2', 1533600, '2024-02-18 21:25:19'),
(6, '1. Primero', 'TOTAL MENSULAIDADES', '2', 1533600, '2024-02-18 21:26:27'),
(7, '2. Segundo', 'TOTAL MENSUALIDADES', '2', 1533600, '2024-02-18 21:27:10'),
(8, '3. Tercero', 'TOTAL MENSUALIDADES', '3', 1533600, '2024-02-18 21:27:55'),
(9, '4. Cuarto', 'TOTAL MESUALIDADES', '4', 1533600, '2024-02-18 21:28:35'),
(11, '5. Quinto', 'TOTAL MENSUALIDADES', '5', 1533600, '2024-02-18 21:38:56'),
(12, '6. Sexto', 'TOTAL MENSUALIDADES', '6', 1651600, '2024-02-18 21:41:59'),
(13, '7. Septimo', 'TOTAL MENSUALIDADES', '7', 1651600, '2024-02-18 21:42:42'),
(14, '8. Octavo', 'TOTAL MENSUALIDADES', '8', 1651600, '2024-02-18 21:43:27'),
(15, '9. Noveno', 'TOTAL MENSUALIDADES', '9', 1651600, '2024-02-18 21:44:05'),
(16, 'Decimo', 'TOTAL MENSUALIDADES', '10', 1651600, '2024-02-18 21:44:47'),
(17, 'Once', 'TOTAL MENSUALIDADES', '11', 1651600, '2024-02-18 21:46:08'),
(18, 'CICLO 3 ', 'BTO POR CICLOS ', '1', 1085000, '2025-01-22 18:41:24'),
(19, 'CICLO 4', 'BTO POR CICLOS', '2', 1085000, '2025-01-22 18:42:19'),
(20, 'CICLO 5', 'BTO POR CICLOS', '3', 585000, '2025-01-22 18:43:16'),
(21, 'CICLO 6', 'BTO POR CICLOS', '4', 585000, '2025-01-22 18:43:55');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fees`
--

CREATE TABLE `fees` (
  `id` int NOT NULL,
  `course_id` int NOT NULL,
  `description` varchar(200) NOT NULL,
  `amount` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `fees`
--

INSERT INTO `fees` (`id`, `course_id`, `description`, `amount`) VALUES
(45, 18, 'matricula', 85000),
(46, 18, 'Mensualidades', 1000000),
(47, 19, 'MATRICULA', 85000),
(48, 19, 'MENSUALIDADES', 1000000),
(49, 20, 'MATRICULA', 85000),
(50, 20, 'MENSUALIDAD', 500000),
(51, 21, 'MATRICULA', 85000),
(52, 21, 'MENSUALIDADES', 500000),
(53, 4, 'MATRICULA', 237600),
(54, 4, 'MENSUALIDAD', 1296000),
(55, 3, 'MATRICULA', 237600),
(56, 3, 'MENSUALIDAD', 1296000),
(57, 5, 'MATRICULA', 237600),
(58, 5, 'MENSUALIDAD', 1296000),
(59, 6, 'MATRICULA', 237600),
(60, 6, 'MENSUALIDAD', 1296000),
(61, 7, 'MATRICULA', 237600),
(62, 7, 'MENSUALIDAD', 1296000),
(63, 8, 'MATRICULA', 237600),
(65, 9, 'MATRICULA', 237600),
(66, 9, 'MENSUALIDAD', 1296000),
(67, 11, 'MATRICULA', 237600),
(68, 11, 'MENSUALIDAD', 1296000),
(69, 12, 'MATRICULA', 247600),
(72, 13, 'MENSUALIDAD ', 1404000),
(74, 14, 'MATRICULA', 247600),
(75, 14, 'MENSUALIDAD', 1404000),
(76, 15, 'MATRICULA', 247600),
(77, 15, 'MENSUALIDAD', 1404000),
(78, 13, 'MATRICULA', 247600),
(79, 16, 'MATRICULA', 247600),
(80, 16, 'MENSUALIDAD', 1404000),
(81, 17, 'MATRICULA', 247600),
(82, 17, 'MENSUALIDAD', 1404000),
(83, 12, 'MENSUALIDAD', 1404000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `payments`
--

CREATE TABLE `payments` (
  `id` int NOT NULL,
  `ef_id` int NOT NULL,
  `amount` float NOT NULL,
  `remarks` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `payments`
--

INSERT INTO `payments` (`id`, `ef_id`, `amount`, `remarks`, `date_created`) VALUES
(859, 196, 237600, 'MATRICULA 16-12-2024', '2025-01-30 16:39:00'),
(862, 190, 237600, 'MATRICULA 14-01-2025', '2025-01-30 16:40:46'),
(863, 197, 237600, 'MATRICULA 27-01-2025', '2025-01-30 16:42:00'),
(864, 198, 237600, 'MATRICULA 23-01-2025', '2025-01-30 16:43:40'),
(865, 194, 237600, 'MATRICULA 25-01-2025', '2025-02-04 15:44:24'),
(866, 188, 237600, 'MATRICULA 15-01-2025', '2025-02-04 15:47:41'),
(867, 188, 129600, 'MENSUALIDAD MES DE FEBRERO', '2025-02-04 15:48:20'),
(868, 206, 237600, 'MATRICULA 15-01-2025', '2025-02-04 15:52:13'),
(869, 206, 129600, 'MENSUALIDAD MES DE FEBRERO 15-01', '2025-02-04 15:52:57'),
(870, 182, 237600, 'MATRICULA 8-01-2025', '2025-02-04 16:16:47'),
(871, 197, 129600, 'MENSUALIDAD DE FEBRERO 05-01-2025', '2025-02-05 09:26:25'),
(872, 207, 247600, 'MATRICULA', '2025-02-05 09:31:22'),
(873, 207, 140400, 'MENSUALIDAD DE FEBRERO 04-02-2025', '2025-02-05 09:32:23'),
(874, 208, 247600, 'MATRICULA', '2025-02-05 10:05:41'),
(875, 208, 140400, 'MENSUALIDAD DE FEBRERO 05-02-2025', '2025-02-05 10:06:23'),
(876, 209, 247600, 'MATRICULA', '2025-02-05 10:15:59'),
(877, 209, 140400, 'MENSUALIDAD FEBRERO 05-02-2025', '2025-02-05 10:16:42'),
(878, 210, 247600, 'MATRICULA', '2025-02-05 10:18:16'),
(879, 210, 140400, 'MENSUALIDAD FEBRERO 05-02-2025', '2025-02-05 10:18:54'),
(880, 211, 220000, 'MATRICULA', '2025-02-05 10:38:54'),
(881, 211, 129600, 'MENSUALIDAD DE FEBRERO O4-02-2025', '2025-02-05 10:30:49'),
(882, 212, 220000, 'MATRICULA', '2025-02-05 10:38:36'),
(883, 212, 129600, 'MENSUALIDAD FEBRERO 04-02-2025', '2025-02-05 10:34:03'),
(884, 213, 220000, 'MATRICULA', '2025-02-05 10:37:26'),
(885, 213, 140400, 'MENSUALIDAD FEBRERO 04-02-2025', '2025-02-05 10:38:12'),
(886, 215, 237600, 'MATRICULA', '2025-02-05 14:38:54'),
(887, 214, 237600, 'MATRICULA', '2025-02-05 14:39:34'),
(888, 216, 237600, 'MATRICULA', '2025-02-05 14:41:36'),
(889, 184, 237600, 'MATRICULA', '2025-02-05 14:42:25'),
(890, 191, 237600, 'MATRICULA', '2025-02-05 14:44:17'),
(891, 192, 237600, 'MATRICULA', '2025-02-05 14:45:35'),
(892, 183, 237600, 'MATRICULA', '2025-02-05 14:46:11'),
(893, 193, 237600, 'MATRICULA', '2025-02-05 14:46:59'),
(894, 185, 237600, 'MATRICULA', '2025-02-05 14:47:44'),
(895, 186, 237600, 'MATRICULA', '2025-02-05 14:48:43'),
(896, 217, 237600, 'MATRICULA', '2025-02-05 14:52:23'),
(897, 218, 237600, 'MATRICULA', '2025-02-05 14:55:55'),
(899, 201, 237600, 'MATRICULA', '2025-02-05 15:04:33'),
(900, 219, 237600, 'MATRICULA', '2025-02-05 15:08:02'),
(901, 220, 237600, 'MATRICULA', '2025-02-05 15:10:11'),
(902, 220, 129600, 'MENSUALIDAD DE FEBRERO 03-02-2025', '2025-02-05 15:11:08'),
(903, 221, 237600, 'MANTRICULA', '2025-02-05 15:13:40'),
(904, 202, 237600, 'MATRICULA', '2025-02-05 15:25:46'),
(905, 224, 247600, 'MATRICULA', '2025-02-05 15:38:13'),
(906, 224, 140400, 'MENSUALIDAD FEBRERO 04-02-2025', '2025-02-05 15:39:01'),
(907, 185, 129600, 'MENSUALIDAD DE FEBRERO 05-02-2025', '2025-02-05 15:42:44'),
(908, 225, 247600, 'MATRICULA', '2025-02-05 15:57:42'),
(909, 225, 140400, 'MENSUALIDAD DE FEBRERO 05-02-2025', '2025-02-05 15:58:30'),
(910, 226, 247600, 'MATRICULA', '2025-02-06 07:15:47'),
(911, 226, 140400, 'MENSUALIDAD FEBRERO 06-02-2025', '2025-02-06 07:17:15'),
(912, 183, 129600, 'MENSUALIDAD FEBRERO 06-02', '2025-02-12 08:48:09'),
(913, 184, 648000, 'MENSUALIDAD DE FEBRERO a junio', '2025-07-07 10:30:21'),
(914, 227, 327600, 'MATRICULA', '2025-02-12 09:08:41'),
(915, 227, 129600, 'MENSUALIDAD DE FEBRERO 8-2', '2025-02-12 09:09:23'),
(916, 228, 237600, 'MATRICULA', '2025-02-12 09:10:55'),
(917, 229, 237600, 'MATRICULA', '2025-02-12 09:11:48'),
(918, 230, 237600, 'MATRICULA', '2025-02-12 09:12:33'),
(919, 231, 237600, 'MATRICULA', '2025-02-12 09:13:03'),
(920, 232, 237600, 'MATRICULA', '2025-02-12 09:13:35'),
(921, 231, 129600, 'MENSUALIDAD DE FEBRERO 07-02', '2025-02-12 09:14:33'),
(922, 233, 237600, 'MATRICULA', '2025-02-12 09:15:08'),
(923, 233, 129600, 'MENSUALIDAD FEBRERO 11-02', '2025-02-12 09:15:59'),
(924, 238, 247600, 'MATRICULA', '2025-02-12 10:23:11'),
(925, 238, 140400, 'MENSUALIDAD  DE FEBRERO 15-01', '2025-02-12 10:24:23'),
(926, 234, 247600, 'MATRICULA', '2025-02-12 10:31:54'),
(927, 235, 247600, 'MATRICULA', '2025-02-12 10:37:52'),
(928, 236, 247600, 'MATRICULA', '2025-02-17 17:12:21'),
(929, 236, 140400, 'MENSUALIDAD DE FEBRERO 03-01', '2025-02-17 17:13:20'),
(930, 237, 247600, 'MATRICULA', '2025-02-17 17:14:18'),
(931, 237, 140400, 'MENSUALIDADFEBRERO 06-02', '2025-02-17 17:15:18'),
(932, 239, 247600, 'MATRICULA', '2025-02-17 17:16:24'),
(933, 241, 247600, 'MATRICULA', '2025-02-17 17:17:34'),
(934, 241, 140400, 'MENSUALIDAD FEBRERO 07-02', '2025-02-17 17:18:23'),
(935, 242, 247600, 'MATRICULA', '2025-02-17 17:19:21'),
(936, 242, 140400, 'MENSUALIDAD FEBRERO 11-02', '2025-02-17 17:20:44'),
(937, 216, 648000, 'MENSUALIDADES DESDE FEBRERO HASTA JUNIO', '2025-07-07 09:19:33'),
(938, 248, 237600, 'matricula', '2025-07-07 09:52:17'),
(939, 248, 518400, 'pagos de mensualidad desde marzo hasta junio', '2025-07-07 09:53:50'),
(941, 211, 518400, 'mensualidad de febrero a mayo alumno retirado', '2025-07-07 10:25:48'),
(942, 215, 388800, 'mesualidad de febrero a abril', '2025-07-07 10:16:42'),
(943, 214, 260000, 'mensualidad', '2025-07-07 10:25:00'),
(944, 187, 237600, 'matricula', '2025-07-07 10:47:51'),
(945, 187, 518400, 'mensualidades desde febrero hasta mayo', '2025-07-07 10:51:58'),
(946, 191, 6484000, 'mensualidades desde febrero hasta junio', '2025-07-07 10:55:35'),
(947, 192, 648000, 'mensualidades desde febrero hasta junio', '2025-07-07 18:45:44'),
(948, 183, 648000, 'mensualidades desde febrero hasta junio', '2025-07-07 18:53:21'),
(949, 193, 388800, 'mensualidades desde febrero hasta abril retirado del colegio', '2025-07-07 18:58:18'),
(950, 185, 648000, 'mensualidades desde febrero hasta julio', '2025-07-07 19:07:28'),
(951, 186, 259200, 'mensualidades desde febrero y marzo', '2025-07-07 19:17:31'),
(952, 189, 518400, 'MENSUALIDADES DESDE FEBRERO HASTA MAYO', '2025-07-07 19:34:19'),
(954, 194, 518400, 'MENSUALIDADES DESDE FEBRERO HASTA MAYO', '2025-07-07 19:41:17'),
(955, 188, 518400, 'MENSUALIDADES DESDE FEBRERO HASTA MAYO', '2025-07-07 19:45:16'),
(956, 217, 648000, 'MENSUALIDADES DESDE FEBRERO HASTA JULIO', '2025-07-07 19:48:50'),
(957, 212, 388300, 'mensualidad marzo,abril, mayo', '2025-07-08 09:53:48'),
(958, 251, 240000, 'mensualidad', '2025-07-08 10:10:33'),
(959, 252, 150000, 'matricula', '2025-07-08 10:17:59'),
(960, 253, 200000, 'matricula', '2025-07-08 10:23:58'),
(961, 253, 259200, '', '2025-07-08 10:25:05'),
(962, 254, 237600, 'matriculas', '2025-07-08 10:36:32'),
(963, 254, 129600, 'mensualidad mayo', '2025-07-08 10:47:26'),
(964, 196, 648000, 'mensualidades desde febrero hasta junio', '2025-07-08 10:52:31'),
(965, 190, 648000, 'mensualidades desde febrero hasta junio', '2025-07-08 10:55:39'),
(966, 197, 777600, 'mensualidades desde febrero hasta julio', '2025-07-08 10:58:41'),
(967, 255, 220000, 'matricula', '2025-07-08 11:14:07'),
(968, 255, 388800, 'mensualidades desde febrero hasta abril', '2025-07-08 11:16:26'),
(969, 198, 390000, 'mensualidades desde febrero marzo abril', '2025-07-08 11:20:44'),
(970, 218, 646400, 'mensualidades desde febrero hasta junio', '2025-07-08 11:23:23'),
(971, 256, 150000, 'abono a matricula', '2025-07-08 11:32:50'),
(974, 257, 648000, 'mensualidades desde febrero hasta junio', '2025-07-08 15:15:21'),
(975, 259, 648000, 'mensualidades desde febrero hasta junio', '2025-07-08 15:46:47'),
(977, 199, 648000, 'febrero a junio', '2025-07-08 16:00:22'),
(978, 202, 648000, 'febrero a junio', '2025-07-08 16:02:12'),
(979, 260, 220000, 'matricula', '2025-07-08 16:08:04'),
(980, 260, 388600, 'febrero marzo abril', '2025-07-08 16:09:56'),
(981, 204, 237600, 'matricula', '2025-07-08 16:16:01'),
(982, 204, 777600, 'mensualidades desde febrero hasta julio', '2025-07-08 16:17:38'),
(983, 205, 237600, 'matricula', '2025-07-08 16:20:31'),
(984, 206, 649200, 'mensualidades desde marzo hasta julio', '2025-07-08 16:26:25'),
(985, 222, 778000, 'mensualidades desde febrero hasta julio', '2025-07-08 16:29:07'),
(986, 223, 220000, 'matricula', '2025-07-08 16:30:57'),
(987, 223, 388800, 'mensualidades desde febrero  marzo abril', '2025-07-08 16:32:22'),
(988, 228, 648000, 'mensualidades desde febrero hasta junio', '2025-07-08 16:37:19'),
(989, 229, 648000, 'desde febrero a junio', '2025-07-08 16:39:37'),
(990, 230, 648000, 'desde febrero a junio', '2025-07-08 16:48:00'),
(991, 231, 518400, 'desde marzo a junio', '2025-07-08 16:49:55'),
(992, 232, 648000, 'de febrero a junio', '2025-07-08 16:51:44'),
(993, 233, 648800, 'desde marzo a junio', '2025-07-08 16:54:34'),
(994, 261, 237600, 'matricula entro en abril', '2025-07-08 16:59:57'),
(995, 261, 389600, 'abril mayo junio', '2025-07-08 17:01:14'),
(996, 262, 237600, 'matricula', '2025-07-08 17:05:11'),
(997, 234, 842400, '', '2025-07-08 18:12:25'),
(998, 235, 842400, 'desde febrero a julio', '2025-07-08 18:20:28'),
(999, 207, 280800, 'marzo y abril', '2025-07-08 18:23:44'),
(1000, 236, 702000, '', '2025-07-08 18:33:17'),
(1001, 237, 702000, 'de mayo a julio', '2025-07-08 18:35:09'),
(1002, 238, 561600, 'de marzo a junio', '2025-07-08 18:51:33'),
(1003, 239, 702000, 'febrero a junio', '2025-07-08 18:54:27'),
(1004, 208, 561600, 'marzo a junio', '2025-07-08 18:57:01'),
(1005, 240, 421000, 'debe matricula pago febrero marzo abril', '2025-07-08 18:59:04'),
(1006, 241, 561600, 'marzo a junio', '2025-07-08 19:01:03'),
(1007, 242, 561600, 'de marzo a junio', '2025-07-08 19:03:01'),
(1008, 243, 250000, 'matricula le quedan 2.400', '2025-07-08 19:05:37'),
(1009, 243, 561600, 'rectificar mayo de febrero a junio pendiente mayo', '2025-07-08 19:07:04'),
(1010, 244, 702000, 'desde febrero a junio rectificar matricula', '2025-07-08 19:17:34'),
(1011, 245, 237600, 'matricula', '2025-07-08 19:19:05'),
(1012, 245, 842400, 'desde febrero a julio', '2025-07-08 19:20:37'),
(1013, 246, 150000, 'abono a matricula', '2025-07-08 19:23:08'),
(1014, 246, 702000, 'desde febrero a junio', '2025-07-08 19:24:58'),
(1015, 247, 247600, 'matricula', '2025-07-08 19:27:05'),
(1016, 247, 140400, 'febrero', '2025-07-08 19:28:04'),
(1017, 263, 247600, 'matricula', '2025-07-08 19:33:23'),
(1018, 263, 702000, 'mensualidad desde febrero a junio', '2025-07-08 19:35:01'),
(1019, 264, 247600, 'matricula', '2025-07-14 18:37:43'),
(1020, 264, 140400, 'mensualidad julio', '2025-07-14 18:38:39'),
(1021, 265, 247600, 'matricula', '2025-07-14 18:44:24'),
(1022, 265, 561600, 'mensualidad desde febrero hasta mayo', '2025-07-14 18:46:46'),
(1023, 266, 247600, 'matricula', '2025-07-14 18:51:24'),
(1024, 266, 842400, 'mensualidades desde febrero hasta julio', '2025-07-14 18:53:00'),
(1025, 267, 237600, 'matricula', '2025-07-14 19:15:17'),
(1026, 267, 280800, 'mes de febrero y marzo', '2025-07-14 19:16:15'),
(1027, 269, 220000, 'matricula', '2025-07-14 19:19:31'),
(1028, 269, 702000, 'mensuallidad desde febrero hasta junio', '2025-07-14 19:20:42'),
(1029, 271, 237600, 'matricula', '2025-07-14 19:29:27'),
(1030, 271, 702000, 'mensualidades desde febrero hasta junio', '2025-07-14 19:32:05'),
(1031, 272, 237600, 'matricula', '2025-07-14 19:39:38'),
(1032, 272, 842400, 'mensualidades desde febrero hasta julio', '2025-07-14 19:44:21'),
(1033, 273, 247600, 'matricula', '2025-07-15 08:37:28'),
(1034, 273, 842400, '', '2025-07-15 08:39:25'),
(1035, 274, 247600, 'matricula', '2025-07-15 09:02:32'),
(1036, 274, 842400, 'mensualidades de febrero a julio', '2025-07-15 09:03:57'),
(1037, 275, 247600, 'matricula', '2025-07-15 09:08:47'),
(1038, 275, 702000, 'mensualidad desde febrero hasta junio', '2025-07-15 09:29:31'),
(1039, 276, 247600, 'matricula', '2025-07-15 09:37:09'),
(1040, 276, 702000, 'mensualidades desde febrero hasta junio', '2025-07-15 09:40:12'),
(1041, 277, 247600, 'matricula', '2025-07-15 09:43:53'),
(1042, 277, 842400, 'mensualidades desde febrero hasta julio', '2025-07-15 09:45:17'),
(1043, 278, 247600, 'matricula', '2025-07-15 09:48:13'),
(1044, 278, 842400, 'mensualidades desde febrero hasta julio', '2025-07-15 09:49:20'),
(1045, 279, 247600, 'matricula', '2025-07-15 10:29:57'),
(1046, 280, 247600, '247600', '2025-07-15 10:39:41'),
(1047, 280, 702000, 'mensualidades desde febrero hasta junio', '2025-07-15 10:41:23'),
(1048, 281, 247600, 'matricula', '2025-07-15 10:50:36'),
(1049, 281, 554400, 'mensualidades desde febrero hasta mayo', '2025-07-15 10:55:14'),
(1050, 282, 230000, 'matricula', '2025-07-15 11:00:32'),
(1051, 282, 561600, 'mensualidades de febrero a mayo', '2025-07-15 10:59:43'),
(1052, 283, 150000, 'matricula', '2025-07-15 11:12:04'),
(1053, 284, 220000, 'matricula', '2025-07-15 11:14:52'),
(1054, 284, 140400, 'mensualidad febrero', '2025-07-15 11:15:44'),
(1055, 285, 247600, 'matricula', '2025-07-15 11:18:32'),
(1056, 285, 842400, 'mensualidades de febrero a julio', '2025-07-15 11:19:39'),
(1057, 286, 247600, 'matricula', '2025-07-16 09:29:59'),
(1058, 286, 702000, 'mensualidades desde febrero hasta junio', '2025-07-16 09:40:56'),
(1059, 226, 702000, 'mensualidades de febrero a julio', '2025-07-16 09:46:37'),
(1060, 287, 561600, 'mensualidad de febrero  a mayo', '2025-07-16 11:13:26'),
(1061, 288, 247600, 'matricula', '2025-07-16 17:15:10'),
(1062, 288, 702000, 'mensualidad de febrero a junio', '2025-07-16 17:16:41'),
(1063, 289, 247600, 'matricula', '2025-07-16 17:28:12'),
(1064, 289, 842400, 'mensualidades de febrero a julio', '2025-07-16 17:29:10'),
(1065, 290, 237600, 'matricula', '2025-07-16 17:37:15'),
(1066, 290, 702000, 'mensualidades de febrero a junio', '2025-07-16 17:38:33'),
(1067, 291, 237600, 'matricula', '2025-07-16 17:44:13'),
(1068, 291, 982900, 'mensualidad de febrero a julio', '2025-07-16 17:49:02'),
(1069, 292, 247600, 'matricula', '2025-07-16 17:54:03'),
(1070, 292, 702000, 'mensualidades de febrero a junio', '2025-07-16 17:55:10'),
(1071, 293, 247600, 'matricula', '2025-07-16 18:00:31'),
(1072, 293, 348800, 'mensualidad de febrero marzo y $60.000 de abril', '2025-07-16 18:03:25'),
(1073, 294, 247600, 'matricula', '2025-07-16 18:08:24'),
(1074, 294, 660600, 'mensualidades de febrero a junio', '2025-07-16 18:13:51'),
(1075, 295, 247600, 'matricula', '2025-07-16 18:16:39'),
(1076, 295, 550200, 'mensualidad de febrero a mayo', '2025-07-16 18:18:32'),
(1077, 296, 347600, 'matricula', '2025-07-17 10:46:12'),
(1078, 296, 347600, 'matricula', '2025-07-17 10:46:12'),
(1079, 296, 140400, 'mes de julio', '2025-07-17 10:47:37'),
(1080, 297, 247600, 'matricula', '2025-07-17 10:57:11'),
(1081, 297, 247600, 'matricula', '2025-07-17 10:57:11'),
(1082, 297, 842400, 'mensualidades desde febrero a julio', '2025-07-17 10:59:57'),
(1083, 298, 237600, 'matricula', '2025-07-17 11:19:58'),
(1084, 299, 247600, 'matricula', '2025-07-17 11:28:02'),
(1085, 299, 842400, 'mensualidades de febrero a julio', '2025-07-17 11:33:07'),
(1086, 300, 247600, 'matricula', '2025-07-18 11:03:37'),
(1087, 300, 702000, 'mensualidades desde febrero hasta junio', '2025-07-18 11:06:00'),
(1088, 301, 247600, 'matricula', '2025-07-18 11:19:22'),
(1089, 301, 842400, 'mensualidad de febrero a julio', '2025-07-18 11:20:25'),
(1090, 302, 247600, 'matricula', '2025-07-18 11:29:38'),
(1091, 302, 421400, 'mensualidades de febrero a abril', '2025-07-18 11:30:31'),
(1092, 303, 247600, 'matricula', '2025-07-21 10:38:28'),
(1093, 303, 701000, 'mensualidades de febrero a junio', '2025-07-21 10:58:50'),
(1094, 304, 247600, 'matricula', '2025-07-21 11:12:25'),
(1095, 304, 561500, 'mensualidad de febrero a mayo', '2025-07-21 11:14:10'),
(1096, 305, 247600, 'matricula', '2025-07-21 11:21:04'),
(1097, 305, 702000, 'mensualidades de febrero a junio', '2025-07-21 11:22:45'),
(1098, 306, 247600, 'matricula', '2025-07-21 11:26:27'),
(1099, 306, 421400, 'mes de febrero marzo abril', '2025-07-21 11:27:26'),
(1100, 209, 561600, 'mensualidad de febrero a junio', '2025-07-21 11:34:01'),
(1101, 307, 220000, 'matricula', '2025-07-22 07:48:20'),
(1102, 307, 702000, 'mensualidades de febrero a junio', '2025-07-22 07:50:57'),
(1103, 210, 561600, 'mensualidades de marzo a junio', '2025-07-22 07:57:14'),
(1104, 308, 220000, 'matricula', '2025-07-22 08:02:41'),
(1105, 308, 561600, 'mensualidades de febrero a mayo', '2025-07-22 08:03:37'),
(1106, 309, 247600, 'matricula', '2025-07-22 08:05:42'),
(1107, 309, 702000, 'mensualidades de febrero a junio', '2025-07-22 08:06:32'),
(1108, 310, 247600, 'matricula', '2025-07-22 08:09:14'),
(1109, 310, 421400, 'mensualidades de febrero  a abril', '2025-07-22 08:10:57'),
(1110, 311, 247600, 'matricula', '2025-07-22 08:13:10'),
(1111, 311, 842400, 'mensualidades de febrero a julio', '2025-07-22 08:14:18'),
(1112, 312, 220000, 'matricula', '2025-07-22 18:26:31'),
(1114, 312, 561600, 'mensualidades de febrero a mayo', '2025-07-22 18:29:23'),
(1115, 313, 247600, 'matricula', '2025-07-22 18:34:00'),
(1116, 313, 702000, 'mensualidades de febrero a junio', '2025-07-22 18:44:59'),
(1117, 314, 247600, 'matricula', '2025-07-22 18:51:42'),
(1118, 314, 561600, 'mensualidades de febrero a mayo', '2025-07-22 18:53:20'),
(1119, 315, 247600, 'matricula', '2025-07-22 19:00:38'),
(1120, 315, 561600, 'mensualidad', '2025-07-22 19:05:39'),
(1121, 316, 247600, 'matricula', '2025-07-22 19:11:26'),
(1122, 316, 621800, 'mensualidades desde febrero a junio', '2025-07-22 19:15:38'),
(1123, 262, 777600, 'mensualidades desde marzo a junio', '2025-07-22 19:23:17'),
(1124, 259, 0, '', '2025-07-22 19:26:10'),
(1125, 317, 237600, 'matricula', '2025-07-22 19:31:08'),
(1126, 317, 519200, 'mensualidades de febrero a mayo', '2025-07-22 19:32:36'),
(1127, 220, 648000, 'mensualidades desde marzo a junio', '2025-07-22 19:38:31'),
(1128, 221, 300000, 'mensualidades desde febrero marzo y abono a abril', '2025-07-22 19:43:52'),
(1129, 318, 247600, 'matricula', '2025-07-23 19:13:11'),
(1130, 318, 842400, 'mensualidades de febrero a julio', '2025-07-23 19:15:35'),
(1131, 319, 247600, 'matricula', '2025-07-23 19:18:20'),
(1132, 319, 842400, 'mensualidades de febrero a julio', '2025-07-23 19:19:17'),
(1133, 320, 247600, 'matricula', '2025-07-23 19:21:48'),
(1134, 320, 247600, 'matricula', '2025-07-23 19:21:48'),
(1135, 320, 702000, 'mensualidades desde febrero a junio', '2025-07-23 19:22:42'),
(1136, 321, 220000, 'matricula', '2025-07-23 19:25:54'),
(1137, 321, 837000, 'mensualidades de febrero a julio', '2025-07-23 19:27:25'),
(1138, 322, 247600, 'matricula', '2025-07-23 19:30:46'),
(1139, 322, 421200, 'mensualidades de febrero a abril', '2025-07-23 19:33:26'),
(1140, 323, 247600, 'matricula', '2025-07-23 19:37:26'),
(1141, 323, 561600, 'mensualidades de febrero a mayo', '2025-07-23 19:38:47'),
(1142, 324, 247600, 'matricula', '2025-07-23 19:41:40'),
(1143, 324, 280800, 'mensualidad de febrero y marzo', '2025-07-23 19:42:35'),
(1144, 325, 247600, 'matricula', '2025-07-23 19:45:04'),
(1145, 325, 702000, 'mensualidades de febrero a junio', '2025-07-23 19:46:01'),
(1146, 327, 247600, 'matricula', '2025-07-24 18:30:05'),
(1147, 328, 247600, 'matricula', '2025-07-24 18:34:33'),
(1148, 328, 561600, 'mensualidades desde febrero hasta mayo', '2025-07-24 18:36:11'),
(1149, 329, 247600, 'matricula', '2025-07-24 19:53:50'),
(1150, 329, 842400, 'mensualidades de febrero a julio', '2025-07-24 19:59:18'),
(1151, 330, 247600, 'matricula', '2025-07-24 20:04:19'),
(1152, 330, 702000, 'mensualidades desde febrero a junio', '2025-07-24 20:06:17'),
(1153, 331, 247600, 'matricula', '2025-07-24 20:12:54'),
(1154, 331, 280800, 'mensualidades de febrero y marzo', '2025-07-24 20:13:55'),
(1155, 332, 247600, 'matricula', '2025-07-24 20:21:47'),
(1156, 332, 702000, 'mensualidades de febrero a junio', '2025-07-24 20:24:12'),
(1157, 333, 247600, 'mensualidades desde febrero hasta junio', '2025-07-24 20:29:50'),
(1158, 333, 702000, 'mensualidades de febrero a junio', '2025-07-24 20:31:04'),
(1159, 334, 100000, 'matricula', '2025-07-24 20:34:14'),
(1160, 334, 160000, 'mensualidades', '2025-07-24 20:35:17'),
(1161, 335, 247600, 'matricula', '2025-07-24 20:40:49'),
(1162, 335, 561600, 'mensualidades de febrero a abril', '2025-07-24 20:42:28'),
(1163, 336, 247600, 'matricula', '2025-07-24 20:49:55'),
(1164, 336, 280800, 'mensualidades de junio y julio', '2025-07-24 20:50:41'),
(1165, 337, 247600, 'matricula', '2025-07-24 21:01:01'),
(1166, 337, 520000, 'mensualidades de febrero a  mayo', '2025-07-24 21:02:38'),
(1167, 325, 0, '', '2025-07-24 21:08:56'),
(1168, 338, 247600, 'matricula', '2025-07-24 21:15:39'),
(1169, 338, 842400, 'mensualidades de febrero a julio', '2025-07-24 21:16:36'),
(1170, 339, 247600, 'matricula', '2025-07-24 21:20:21'),
(1171, 339, 842400, 'mensualidades de febrero a julio', '2025-07-24 21:21:25'),
(1172, 340, 247600, 'matricula', '2025-07-24 21:24:19'),
(1173, 340, 702000, 'mensualidades de febrero a junio', '2025-07-24 21:25:05'),
(1174, 224, 702000, 'mensualidades de  marzo a julio', '2025-07-24 21:30:24'),
(1175, 341, 247600, 'matricula', '2025-07-24 21:32:55'),
(1176, 341, 702000, 'mensualidades de febrero a junio', '2025-07-24 21:34:09'),
(1177, 342, 220000, 'matricula', '2025-07-24 21:36:40'),
(1178, 342, 561600, 'mensualidades de febrero a mayo', '2025-07-24 21:37:44'),
(1179, 343, 247600, 'matricula', '2025-07-24 21:39:54'),
(1180, 343, 702000, 'mensualidades de febrero a junio', '2025-07-24 21:41:05'),
(1181, 344, 247600, '842400', '2025-07-24 21:43:36'),
(1182, 345, 247600, 'matricula', '2025-07-24 21:45:43'),
(1183, 345, 280800, 'mensualidades de febrero y marzo', '2025-07-24 21:46:30'),
(1184, 346, 247600, 'matricula', '2025-07-24 21:52:56'),
(1185, 346, 702000, 'mensualidades de febrero a junio', '2025-07-24 21:53:55'),
(1186, 347, 247600, 'matricula', '2025-07-24 21:56:03'),
(1187, 347, 561600, 'mensualidades de mayo a agosto', '2025-07-24 21:57:23'),
(1188, 348, 247600, 'matricula', '2025-07-24 21:59:24'),
(1189, 348, 140400, 'julio', '2025-07-24 22:00:03'),
(1190, 349, 237600, 'matricula', '2025-07-29 09:55:05'),
(1191, 349, 518400, 'mensualidades de marzo a junio', '2025-07-29 09:57:06'),
(1192, 282, 280800, 'mensualidad junio y julio', '2025-09-22 09:58:08');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `student`
--

CREATE TABLE `student` (
  `id` int NOT NULL,
  `id_no` varchar(100) NOT NULL,
  `name` text NOT NULL,
  `contact` varchar(100) NOT NULL,
  `address` text NOT NULL,
  `email` varchar(200) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `student`
--

INSERT INTO `student` (`id`, `id_no`, `name`, `contact`, `address`, `email`, `date_created`) VALUES
(180, '1094227737', 'PEREZ RANGEL ADRIAN DAVID', 'falta', 'falta', 'falta', '2025-01-23 08:08:29'),
(181, '1030047097', 'ANGEL JOSUE PEÑA VALERRAMA', 'falta', 'falta', 'falta', '2025-01-27 10:39:09'),
(182, '1094227131', 'ISMETH SOFIA BACCA FIGUEROA', 'falta', 'falta', 'falta', '2025-01-27 10:41:17'),
(183, '109267047', 'LEANDRO CALEB RORIGUEZ VERA', 'falta', 'falta', 'falta', '2025-01-27 10:44:09'),
(184, '1094226941', 'NESTOR RAUL LUNA CASTILLO', 'falta', 'falta', 'falta', '2025-01-27 10:46:05'),
(185, '1094227293', 'ROGERS MATHIAS OLARTE CARDENAS', 'falta', 'falta', 'falta', '2025-01-27 10:50:42'),
(186, '1093610236', 'ANGELA SAMARA CASTAÑO SOTO', 'falta', 'falta', 'falta', '2025-01-27 10:52:36'),
(187, '1093804187', 'KYARY NAYELY CEPEDA CARDENAS', 'falta', 'falta', 'falta', '2025-01-27 10:55:14'),
(188, '1093311334', 'DANIEL SANTIAGO MOGOLLON DIAZ', 'falta', 'falta', 'falta', '2025-01-27 10:57:24'),
(189, '1094642341', 'MORANTES RUBIO LAURA SHALOME', 'falta', 'falta', 'falta', '2025-01-30 15:50:55'),
(190, '1092030547', 'SERRANO GUERRA SHALMA GUADALUPE', 'falta', 'falta', 'falta', '2025-01-30 15:52:06'),
(191, '1030047024', 'GONZALES CONTRERAS CESAR MATIAS', 'falta', 'falta', 'falta', '2025-01-30 15:53:21'),
(192, '1093311518', 'CUADROS WESLEE SEBASTIAN', 'falta', 'falta', 'falta', '2025-01-30 16:01:26'),
(194, '1094431517', 'SUESCUN VEGAS ISAAC MATIAS', 'falta', 'falta', 'falta', '2025-01-30 16:05:23'),
(195, '175852494-4', 'REFUNJOL GUANIPA CARLOS EDUARDO', 'falta', 'falta', 'falta', '2025-01-30 16:07:31'),
(196, '1094225663', 'MOLINA CALDERON MATHIAS ', 'falta', 'falta', 'falta', '2025-01-30 16:08:44'),
(197, '1093435635', 'MENDOZA BAUTISTA JUAN ESTEBAN', 'falta', 'falta', 'falta', '2025-01-30 16:14:05'),
(198, '163367566', 'OVIEDO NARVAEZ ISABELLA', 'falta', 'falta', 'falta', '2025-01-30 16:16:16'),
(199, '1091997330', 'GEREDA PARADA ISABELLA', 'falta', 'falta', 'falta', '2025-01-30 16:17:29'),
(200, '1094224576', 'MONSALVE ROA ZAITH MATHIAS', 'falta', 'falta', 'falta', '2025-01-30 16:19:58'),
(201, '1094224796', 'CAMACHO GELVIZ BRIANNA ISABELLA', 'falta', 'falta', 'falta', '2025-01-30 16:21:51'),
(202, '1010237687', 'RINCON TRISTANCHO JUAN SEBASTIAN', 'falta', 'falta', 'falta', '2025-01-30 16:23:16'),
(203, '1094224386', 'QUESADA FERNANDEZ GERONIMO', 'falta', 'falta', 'falta', '2025-01-30 16:24:31'),
(204, '1093606706', 'CASTAÑO SOTO ZHAIRA SALOME', 'falta', 'falta', 'falta', '2025-01-30 16:27:22'),
(205, '1232391229', 'TORRES DUARTE MAYERLI ERIANY', 'falta', 'falta', 'falta', '2025-02-05 09:30:17'),
(206, '1094223547', 'DIAZ JAIMES MAXIMILIANO', 'falta', 'falta', 'falta', '2025-02-05 10:04:54'),
(207, '1092946143', 'FERNANDEZ SOTO ZHARIKC DANIELA', 'falta', 'falta', 'falta', '2025-02-05 10:15:14'),
(208, '1092949095', 'FERNANDEZ SOTO YIRETH VALERIA', 'falta', 'falta', 'falta', '2025-02-05 10:17:20'),
(209, '1027543919', 'PRIETO DAZA  LIAM GERONIMO', '3184018259', 'CLL 15 #7B-87', 'falta', '2025-02-05 10:28:33'),
(210, '1027540332', 'PRIETO DAZA ETHAN SAMUEL', 'falta', 'falta', 'falta', '2025-02-05 10:31:43'),
(211, '1031142387', 'ROBLES DAZA JULIAN CAMILO', 'falta', 'falta', 'falta', '2025-02-05 10:36:10'),
(212, '1092029099', 'ACEVEDO GUERRERO AXEL', 'falta', 'falta', 'falta', '2025-02-05 14:29:41'),
(213, '1094227488', 'SOTO CALDERON SAMUEL DAVID', 'falta', 'falta', 'falta', '2025-02-05 14:33:03'),
(214, '1094227906', 'MARIAMS JULIETA VELAZCO SUAREZ', 'falta', 'falta', 'falta', '2025-02-05 14:40:38'),
(215, '1094226314', 'AVENDAÑO VALERO NICOLLE VALERIA', 'falta', 'falta', 'falta', '2025-02-05 14:51:28'),
(216, '1093608440', 'GOMEZ LOZADA SHADYA  ANTONELLA', 'falta', 'falta', 'falta', '2025-02-05 14:54:31'),
(217, '1083039780', 'JUAN JOSE FERRO MARTINEZ', 'falta', 'falta', 'falta', '2025-02-05 15:05:49'),
(218, '1092959996', 'NOVA PEÑALOZA HEILLEN SALOME', 'falta', 'falta', 'falta', '2025-02-05 15:08:53'),
(220, '1094224244', 'URBANO BONILLA JHOSUE MATHIAS', 'falta', 'falta', 'falta', '2025-02-05 15:12:31'),
(221, '1092001910', 'JURE ORDOÑES DAILY SALOME', 'falta', 'falta', 'falta', '2025-02-05 15:30:42'),
(222, '1091994960', 'BERMUDES SANCHEZ MILAN JEAN DANIEL', 'falta', 'falta', 'falta', '2025-02-05 15:32:28'),
(223, '1091972522', 'PABON AREVALO SANTIAGO', 'falta', 'falta', 'falta', '2025-02-05 15:34:58'),
(224, '1093599795', 'JAIMES BLANCO IVAN ANDRES', 'falta', 'falta', 'falta', '2025-02-05 15:55:51'),
(225, '1093601135', 'PEREZ MEDINA ZAMIR A ZHARITH', 'falta', 'falta', 'falta', '2025-02-06 07:12:54'),
(226, '1094061463', 'BAYONA VALENCIA DULCE FERNANDA', 'falta', 'falta', 'falta', '2025-02-12 08:55:43'),
(227, '1030041396', 'LUNA SILVA MATIAS', 'falta', 'falta', 'falta', '2025-02-12 08:56:48'),
(228, '1094224025', 'AVELDAÑO VALERO YAIR', 'falta', 'falta', 'falta', '2025-02-12 08:57:35'),
(229, '1092956727', 'DIAZ PEREZ JUAN JOSE', 'falta', 'falta', 'falta', '2025-02-12 08:58:16'),
(230, '1094224172', 'CONTRERAS LEAL JESUS DAVID', 'falta', 'falta', 'falta', '2025-02-12 08:58:58'),
(231, '1093605879', 'VESGA RODRIGUEZ JOHA ABDIEL', 'falta', 'falta', 'falta', '2025-02-12 08:59:39'),
(232, '1094224191', 'DUARTE PEREZ SHAYLEN SOFIA', 'falta', 'falta', 'falta', '2025-02-12 09:00:40'),
(233, '1094059686', 'SANGUINO LIZCANO BRAYAN ESTIVEN', 'falta', 'falta', 'falta', '2025-02-12 09:25:08'),
(234, '1092956462', 'BOADA SUAREZ IKER SANTIAGO', 'falta', 'falta', 'falta', '2025-02-12 09:25:54'),
(235, '1030139270', 'MENESES MURILLO MARISELA', 'falta', 'falta', 'falta', '2025-02-12 09:26:50'),
(236, '1094223695', 'PINTO URIBE MAILY CAMILA', 'falta', 'falta', 'falta', '2025-02-12 09:27:18'),
(237, '1077238855', 'DIAZ MOLINA DYLAN SANTIAGO', 'falta', 'falta', 'falta', '2025-02-12 09:27:50'),
(238, '1093762016', 'PORTILLA SARMIENTO ASHLIN GABRIELA', 'falta', 'falta', 'falta', '2025-02-12 09:39:22'),
(239, '1094059305', 'ROBLES GALVIZ JHOSTIN SANTIAGO', 'falta', 'falta', 'falta', '2025-02-12 09:39:55'),
(240, '1093779858', 'MEDINA PADILLA DIANA SOFIA', 'falta', 'falta', 'falta', '2025-02-12 09:40:28'),
(241, '1093771037', 'FERREIRA DURAN ISABEL SOFIA', 'falta', 'falta', 'falta', '2025-02-12 09:41:03'),
(242, '1093783946', 'JARAMILLO RUEDA PAULA VALERIA', 'falta', 'falta', 'falta', '2025-02-12 09:41:38'),
(243, '1092952650', 'MUNAR BARBOSA HANNAH ISABELLA', 'falta', 'falta', 'falta', '2025-02-12 09:42:03'),
(244, '1093778745', 'SOLER ANGARITA LOPE ANDRETTI', 'falta', 'falta', 'falta', '2025-02-12 09:42:41'),
(245, '1094222929', 'GALVIS SARMIENTO LICETH VALENTINA', 'falta', 'falta', 'falta', '2025-02-12 10:15:57'),
(246, '1092542470', 'CELY MARTINES EMELY SOPHIA', 'falta', 'falta', 'falta', '2025-02-12 10:16:26'),
(247, '1092030013', 'LIAM JOSUE MENDOZA CHAUSTRE', '3184468839', 'av 5 a#17 a 15 tierra linda', '', '2025-07-07 09:49:31'),
(248, '1092019133', 'MICHEL ARLETH ANTOLINES MARTINEZ', 'falta', 'falta', 'falta', '2025-07-08 10:03:06'),
(249, '1092020026', 'CONTRERAS RODRIGUEZ ALISSON ESTEFANNY', 'falta', 'falta', 'falta', '2025-07-08 10:14:09'),
(250, '1048464808', 'ARROYO GARCIA LAINER DAVID', 'falta', 'falta', 'falta', '2025-07-08 10:20:30'),
(251, '1094226195', ' HERNANDEZ SILVA EMILIANO', 'falta', 'falta', 'falta', '2025-07-08 10:30:55'),
(252, '1092019801', 'BERMUDES SANCHEZ MIA ISABELLA', 'falta', 'falta', 'falta', '2025-07-08 11:08:40'),
(253, '1094225215', 'RODRIGUEZ DIDIER FERNANDO', 'falta', 'falta', 'falta', '2025-07-08 11:30:27'),
(254, '1094225118', 'CONTRERAS MARQUEZ JOSE THOMAS', 'falta', 'falta', 'falta', '2025-07-08 15:56:54'),
(255, '1094224798', 'CAMACHO GELVIZ BRIANNA ISABELLA', 'falta', 'falta', 'falta', '2025-07-08 16:04:42'),
(256, '1094224316', 'DAVID SANTIAGO MONTAÑEZ BARAJAS', 'falta', 'falta', 'falta', '2025-07-08 16:56:23'),
(257, '1115737915', 'RAMIREZ CARDENAS RONNIBER SANTIAGO', 'falta', 'falta', 'falta', '2025-07-08 19:30:10'),
(258, '1094223599', 'SILVA ACEVEDO LYNDAH JULIANA', 'falta', 'falta', 'falta', '2025-07-08 19:38:10'),
(259, '1030060737', 'SUAREZ CORTES MARIA JOSE', 'falta', 'falta', 'falta', '2025-07-14 18:42:41'),
(260, '1091364383', 'CABRALES SECO JORGE ISAAC', 'falta', 'falta', 'falta', '2025-07-14 18:49:21'),
(261, '1093600865', 'URREGO VALERO WISNNY CAMILA', 'falta', 'falta', 'falta', '2025-07-14 18:58:22'),
(262, '1094222250', 'PICON BERNATE BELLY GABRIELA', 'falta', 'falta', 'falta', '2025-07-14 19:18:02'),
(263, '1093775906', 'MONSALVE ROA AISHA GABRIELA', 'falta', 'falta', 'falta', '2025-07-14 19:26:39'),
(264, '1092952770', 'LIZARAZO CARVAJAL LAURA SOFIA', 'falta', 'falta', 'falta', '2025-07-14 19:35:34'),
(265, '1049660900', 'MEJIA CORREA STIVEN JOSUE', 'falta', 'falta', 'falta', '2025-07-15 08:30:10'),
(266, '1093766926', 'MUÑOS MISSE JUAN DIEGO', 'falta', 'falta', 'falta', '2025-07-15 08:58:16'),
(267, '1094222456', 'QUESADA CRISTOFER DAMIAN', 'falta', 'falta', 'falta', '2025-07-15 09:06:42'),
(268, '1093763600', 'MEDINA PADILLA MARIA FERNANDA', 'falta', 'falta', 'falta', '2025-07-15 09:31:31'),
(269, '1093772198', 'DUARTE ACEVEDO DILAN JOSUE', 'falta', 'falta', 'falta', '2025-07-15 09:41:50'),
(270, '1094059634', 'BAYONA VALENCIA ALAM SMITH', 'falta', 'falta', 'falta', '2025-07-15 09:46:44'),
(271, '1093601793', 'GUEVARA RAMOS KEVIN JOSUE', 'falta', 'falta', 'falta', '2025-07-15 10:28:09'),
(272, '1090180622', 'ALGARRA PARADA JHEREMI ENRIQUE', 'falta', 'falta', 'falta', '2025-07-15 10:31:13'),
(273, '1093305278', 'PABON CAICEDO HOWEN THOMAS', 'falta', 'falta', 'falta', '2025-07-15 10:47:32'),
(274, '1146538087', 'CABALLERO TORRES LIA SALOME', 'falta', 'falta', 'falta', '2025-07-15 10:56:08'),
(275, '1093303926', 'FLOREZ RODRIGUEZ JANDRY YANDREI', 'falta', 'falta', 'falta', '2025-07-15 11:06:53'),
(276, '4423516', 'PERILLA QUINTERO ANA YOXANA ', 'falta', 'falta', 'falta', '2025-07-15 11:13:00'),
(277, '1094222332', 'CAMACHO JAIMES KEVIN ANDREY', 'falta', 'falta', 'falta', '2025-07-15 11:17:18'),
(279, '1092951416', 'PITTA LAGUADO ALISON VALERIA', 'falta', 'falta', 'falta', '2025-07-16 09:28:09'),
(280, '1093773317', 'MORA CARDENAS SERGIO ALEJANDRO', 'falta', 'falta', 'falta', '2025-07-16 09:57:14'),
(281, '1093601430', 'MOGOLLON YEPES JUAN JOSE', 'falta', 'falta', 'falta', '2025-07-16 17:12:52'),
(283, '1092949369', 'ESPINEL BASTOS MARIANA', 'falta', 'falta', 'falta', '2025-07-16 17:22:53'),
(284, '1094056594', 'RODRIGUEZ CHONA JUSSIEL PAOLA', 'falta', 'falta', 'falta', '2025-07-16 17:34:11'),
(285, '1094223111', 'MENDOZA RAMIREZ MARIA PAULA', 'falta', 'falta', 'falta', '2025-07-16 17:39:42'),
(286, '6356221PPT', 'VASQUEZ MORENO YEANMARCO JESUS', 'falta', 'falta', 'falta', '2025-07-16 17:50:55'),
(287, '5964302', 'RANGEL GOMEZ ANYI YENIRTH ', 'falta', 'falta', 'falta', '2025-07-16 17:56:25'),
(288, '1093770803', 'CASTRO RINCON JUAN ESTEBAN', 'falta', 'falta', 'falta', '2025-07-16 18:04:42'),
(289, '1090529946', 'FLOREZ VELASCO SEBASTIAN ARMANDO', 'falta', 'falta', 'falta', '2025-07-16 18:15:09'),
(290, '1094059953', 'IBARRA PEREZ SHARYT SALOME', 'falta', 'falta', 'falta', '2025-07-17 10:43:06'),
(291, '1092537062', 'AMAYA DIAS ERIC SANTIAGO', 'falta', 'falta', 'falta', '2025-07-17 10:51:14'),
(292, '1093301542', 'BOADA SUAREZ GUSTAVO', 'falta', 'falta', 'falta', '2025-07-17 11:08:09'),
(293, '1127051456', 'JIMENEZ HERNANDEZ KARLA NATHALY', 'falta', 'falta', 'falta', '2025-07-17 11:25:03'),
(294, '1093603209', 'ZAMBRANO MORA SARA NICOL', 'falta', 'falta', 'falta', '2025-07-18 10:56:43'),
(295, '1091977973', 'OBREGOZO PABON ISABELLA', 'falta', 'falta', 'falta', '2025-07-18 11:09:24'),
(296, '1076658934', 'RINCON TRISTANCHO FELKIN SANTIAGO', 'falta', 'falta', 'falta', '2025-07-18 11:17:34'),
(297, '1093765936', 'MEDINA OMAÑA SCARLETT', 'falta', 'falta', 'falta', '2025-07-18 11:28:08'),
(298, '1093301013', 'AMAYA PIÑEROS YISNEY TATIANA', 'falta', 'falta', 'falta', '2025-07-21 10:33:46'),
(299, '1093766639', 'ALBARRACIN MOROS GISEL VALENTINA', 'falta', 'falta', 'falta', '2025-07-21 11:09:21'),
(300, '1091363817', 'RICO CONTRERAS LUIS FABIAN', 'falta', 'falta', 'falta', '2025-07-21 11:19:35'),
(301, '1091978097', 'ALVAREZ PEÑA CHELSEA MARIANA', 'falta', 'falta', 'falta', '2025-07-21 11:23:54'),
(302, '1029401532', 'VESCANCE DURAN DANNA CAROLINA																									', 'falta', 'falta', 'falta', '2025-07-22 07:59:37'),
(303, '1094056116', 'HOYOS CORNEJO VALERYE ', 'falta', 'falta', 'falta', '2025-07-22 08:04:27'),
(304, '1093759771', 'BRISEÑO FUENTES LINDA VALENTINA', 'falta', 'falta', 'falta', '2025-07-22 08:07:14'),
(305, '1091982478', 'RODRIGUEZ FERNANDEZ MARIA JOSE', 'falta', 'falta', 'falta', '2025-07-22 08:11:53'),
(306, '1093758198', 'CANTOR RAMIREZ NIKOL NATALIA', 'falta', 'falta', 'falta', '2025-07-22 18:32:07'),
(307, '1091364869', 'MEDINA GARZON NATALY VANESSA', 'falta', 'falta', 'falta', '2025-07-22 18:55:29'),
(308, '1093756559', 'ORTIZ TREJOS JUAN SEBASTIAN', 'falta', 'falta', 'falta', '2025-07-22 19:06:57'),
(309, '1063367566', 'OVIEDO NARVAEZ ISABELLA', 'falta', 'falta', 'falta', '2025-07-22 19:24:38'),
(310, '1090430062', 'SARMIENTO FAJARDO ALVARO ANDRES', 'falta', 'falta', 'falta', '2025-07-23 19:11:01'),
(311, '1093598276', 'LLANES SANTOS OSCAR DAVID', 'falta', 'falta', 'falta', '2025-07-23 19:20:17'),
(312, '1093755066', 'CAMACHO GELVIZ JAVIER MAURICIO', 'falta', 'falta', 'falta', '2025-07-23 19:23:47'),
(313, '1093754006', 'JAIMES PEÑA GABRIEL ALEJANDRO', 'falta', 'falta', 'falta', '2025-07-23 19:28:42'),
(314, '1093302071', 'GOMEZ FLORES ADRIAN FELIPE', 'falta', 'falta', 'falta', '2025-07-23 19:35:29'),
(315, '1092946536', 'PAEZ RANGEL KAREN JULIETH', 'falta', 'falta', 'falta', '2025-07-23 19:40:21'),
(316, '1097107684', 'WALKER GONZALEZ JOSEPH', 'falta', 'falta', 'falta', '2025-07-23 19:43:37'),
(317, '1094222210', 'WALKER GONZALEZ JOSEPH', 'falta', 'falta', 'falta', '2025-07-23 19:47:24'),
(318, '1146335127', 'TERAN NEIRA MATIAS', 'falta', 'falta', 'falta', '2025-07-23 19:51:45'),
(319, '1097785176', 'CASTILLO CASERES LUCIANA', 'falta', 'falta', 'falta', '2025-07-24 18:28:44'),
(320, '1092537754', 'CONTRERAS TARAZONA CARLOS IVAN', 'falta', 'falta', 'falta', '2025-07-24 18:30:57'),
(321, '1092536005', 'MESA MARQUEZ GABRIELA NICOL', 'falta', 'falta', 'falta', '2025-07-24 18:37:05'),
(322, '1091908419', 'DONADO NIÑO NIKOL SOLEIMI', 'falta', 'falta', 'falta', '2025-07-24 20:01:28'),
(323, '33080192', 'BITRIAGO PAEZ VICTOR MANUEL', 'falta', 'falta', 'falta', '2025-07-24 20:07:28'),
(324, '1093767026', 'RIVERA PARRA BRAYAN STIVEN', 'falta', 'falta', 'falta', '2025-07-24 20:14:54'),
(325, '1094052471', 'VARGAS CASTILLO SHELEN', 'falta', 'falta', 'falta', '2025-07-24 20:26:41'),
(326, '1092531243', 'ALBA FLORES JUAN DAVID', 'falta', 'falta', 'falta', '2025-07-24 20:32:32'),
(327, '1092948184', 'VALERY NATALIA RAMIREZ VILLALBA', 'falta', 'falta', 'falta', '2025-07-24 20:37:06'),
(328, '1092947256', 'ORTEGA BENAVIDES SARA NICOLLE', 'falta', 'falta', 'falta', '2025-07-24 20:48:28'),
(329, '1092551481', 'WALKER GONZALES AL MICHAEL', 'falta', 'falta', 'falta', '2025-07-24 21:07:59'),
(330, '1094266841', 'BARON GUTIERREZ GABRIELA', 'falta', 'falta', 'falta', '2025-07-24 21:10:43'),
(331, '1094052417', 'GAONA LOPEZ JUAN DANIEL', 'falta', 'falta', 'falta', '2025-07-24 21:17:40'),
(332, '1093433291', 'GELVEZ CACUA BRAYAN ANTONIO', 'falta', 'falta', 'falta', '2025-07-24 21:23:01'),
(333, '1093756462', 'FERNANDEZ GALVIS JESUS DAVID', 'falta', 'falta', 'falta', '2025-07-24 21:31:54'),
(334, '1091358150', 'CABALLERO TORRES WALKER YESID', 'falta', 'falta', 'falta', '2025-07-24 21:35:02'),
(335, '1092942101', 'SUAREZ SERRANO JUAN ESTEBAN', 'falta', 'falta', 'falta', '2025-07-24 21:38:39'),
(336, '1090430275', 'PERALTA GALVAN LINDA LICETH', 'falta', 'falta', 'falta', '2025-07-24 21:42:00'),
(337, '1094052282', 'CARREÑO YEPES ANDRES FELIPE', 'falta', 'falta', 'falta', '2025-07-24 21:44:27'),
(338, '1093741929', 'ARIZA MALDONADO LUISA ALEJANDRA', 'falta', 'falta', 'falta', '2025-07-24 21:51:47'),
(339, '1092945475', 'RAMIREZ JAIMES JHON SNEYDER', 'falta', 'falta', 'falta', '2025-07-24 21:54:39'),
(340, '1094447273', 'PRADA RUEDAS VALERIE', 'falta', 'falta', 'falta', '2025-07-24 21:58:10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `student_ef_list`
--

CREATE TABLE `student_ef_list` (
  `id` int NOT NULL,
  `student_id` int NOT NULL,
  `ef_no` varchar(200) NOT NULL,
  `course_id` int NOT NULL,
  `total_fee` float NOT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `student_ef_list`
--

INSERT INTO `student_ef_list` (`id`, `student_id`, `ef_no`, `course_id`, `total_fee`, `date_created`) VALUES
(182, 180, '01', 4, 1420000, '2025-01-23 08:08:51'),
(183, 181, '2', 5, 1533600, '2025-01-27 10:39:34'),
(184, 182, '03', 5, 1533600, '2025-01-27 10:41:41'),
(185, 183, '04', 5, 1533600, '2025-01-27 10:44:31'),
(186, 184, '05', 5, 1533600, '2025-01-27 10:46:32'),
(187, 185, '06', 5, 1533600, '2025-01-27 10:51:08'),
(188, 186, '07', 6, 1533600, '2025-01-27 10:53:05'),
(189, 187, '08', 6, 1533600, '2025-01-27 10:55:43'),
(190, 188, '09', 7, 1533600, '2025-01-27 10:57:51'),
(191, 189, '10', 5, 1533600, '2025-01-30 15:51:18'),
(192, 190, '11', 5, 1533600, '2025-01-30 15:52:43'),
(193, 191, '12', 5, 1533600, '2025-01-30 15:53:42'),
(194, 192, '13', 6, 1533600, '2025-01-30 16:01:46'),
(195, 193, '14', 7, 1533600, '2025-01-30 16:03:20'),
(196, 194, '15', 7, 1533600, '2025-01-30 16:05:55'),
(197, 195, '16', 7, 1533600, '2025-01-30 16:07:55'),
(198, 196, '17', 7, 1533600, '2025-01-30 16:09:27'),
(201, 199, '20', 8, 1533600, '2025-01-30 16:17:56'),
(202, 200, '21', 9, 1533600, '2025-01-30 16:21:23'),
(203, 201, '22', 9, 1533600, '2025-01-30 16:22:24'),
(204, 202, '23', 9, 1533600, '2025-01-30 16:23:47'),
(205, 203, '24', 9, 1533600, '2025-01-30 16:24:59'),
(206, 204, '25', 9, 1533600, '2025-01-30 16:31:56'),
(207, 205, '26', 12, 1651600, '2025-02-05 09:30:39'),
(208, 206, '28', 12, 1651600, '2025-02-05 10:05:12'),
(209, 207, '29', 15, 1651600, '2025-02-05 10:15:33'),
(210, 208, '30', 15, 1651600, '2025-02-05 10:17:49'),
(211, 209, '31', 4, 1533600, '2025-02-05 10:29:06'),
(212, 210, '32', 6, 1533600, '2025-02-05 10:32:17'),
(213, 211, '33', 15, 1651600, '2025-02-05 10:36:39'),
(214, 212, '34', 4, 1533600, '2025-02-05 14:30:17'),
(215, 213, '35', 4, 1533600, '2025-02-05 14:36:45'),
(216, 214, '36', 3, 1533600, '2025-02-05 14:41:10'),
(217, 215, '37', 6, 1533600, '2025-02-05 14:51:59'),
(218, 216, '38', 7, 1533600, '2025-02-05 14:54:57'),
(219, 217, '39', 8, 1533600, '2025-02-05 15:06:43'),
(220, 218, '40', 8, 1533600, '2025-02-05 15:09:35'),
(221, 220, '41', 8, 1533600, '2025-02-05 15:12:56'),
(222, 221, '42', 9, 1533600, '2025-02-05 15:31:21'),
(223, 222, '43', 9, 1533600, '2025-02-05 15:33:04'),
(224, 223, '44', 17, 1651600, '2025-02-05 15:37:45'),
(225, 224, '45', 16, 1651600, '2025-02-05 15:57:02'),
(226, 225, '46', 14, 1651600, '2025-02-06 07:14:28'),
(227, 226, '47', 11, 1533600, '2025-02-12 09:01:55'),
(228, 227, '48', 11, 1533600, '2025-02-12 09:02:40'),
(229, 228, '49', 11, 1533600, '2025-02-12 09:03:09'),
(230, 229, '50', 11, 1533600, '2025-02-12 09:06:59'),
(231, 230, '51', 11, 1533600, '2025-02-12 09:07:22'),
(232, 231, '52', 11, 1533600, '2025-02-12 09:07:41'),
(233, 232, '53', 11, 1533600, '2025-02-12 09:08:13'),
(234, 233, '54', 12, 1651600, '2025-02-12 10:09:49'),
(235, 234, '55', 12, 1651600, '2025-02-12 10:10:08'),
(236, 235, '56', 12, 1651600, '2025-02-12 10:10:29'),
(237, 236, '57', 12, 1651600, '2025-02-12 10:10:54'),
(238, 237, '58 ', 12, 1651600, '2025-02-12 10:11:22'),
(239, 238, '59', 12, 1651600, '2025-02-12 10:11:47'),
(240, 239, '60', 12, 1651600, '2025-02-12 10:12:10'),
(241, 240, '61', 12, 1651600, '2025-02-12 10:12:48'),
(242, 241, '62 ', 12, 1651600, '2025-02-12 10:13:17'),
(243, 242, '63', 12, 1651600, '2025-02-12 10:13:39'),
(244, 243, '64', 12, 1651600, '2025-02-12 10:14:05'),
(245, 244, '65', 12, 1651600, '2025-02-12 10:14:41'),
(246, 245, '66', 12, 1651600, '2025-02-12 10:17:02'),
(247, 246, '67', 12, 1651600, '2025-02-12 10:17:38'),
(249, 181, '1030047097', 5, 1533600, '2025-07-07 18:51:12'),
(250, 0, '1092019801', 5, 1533600, '2025-07-07 19:31:17'),
(251, 248, '170325', 6, 1533600, '2025-07-08 10:04:41'),
(252, 249, '1092020026', 6, 1533600, '2025-07-08 10:16:28'),
(253, 250, '180325', 6, 1533600, '2025-07-08 10:22:53'),
(254, 251, '6195', 6, 1533600, '2025-07-08 10:35:24'),
(255, 252, '9801', 5, 1533600, '2025-07-08 11:10:23'),
(256, 253, '5215', 7, 1533600, '2025-07-08 11:31:42'),
(259, 198, '7566', 8, 1533600, '2025-07-08 15:43:43'),
(260, 255, '4798', 9, 1533600, '2025-07-08 16:05:24'),
(261, 256, '4316', 11, 1533600, '2025-07-08 16:58:14'),
(262, 197, '5635', 8, 1533600, '2025-07-08 17:04:33'),
(263, 257, '7915', 12, 1651600, '2025-07-08 19:32:14'),
(264, 258, '3599', 12, 1651600, '2025-07-14 18:36:29'),
(265, 259, '0737', 13, 1651600, '2025-07-14 18:43:40'),
(266, 260, '4383', 13, 1651600, '2025-07-14 18:50:09'),
(267, 261, '0865', 13, 1651600, '2025-07-14 18:59:22'),
(268, 261, '08659', 13, 1651600, '2025-07-14 19:13:20'),
(269, 262, '2250', 13, 1651600, '2025-07-14 19:18:45'),
(270, 0, '5906', 0, 0, '2025-07-14 19:27:05'),
(271, 263, '59065', 13, 1651600, '2025-07-14 19:28:02'),
(272, 264, '2770', 13, 1651600, '2025-07-14 19:38:27'),
(273, 265, '60900', 13, 1651600, '2025-07-15 08:36:03'),
(274, 266, '6926', 13, 1651600, '2025-07-15 08:59:10'),
(275, 267, '2456', 13, 1651600, '2025-07-15 09:08:02'),
(276, 268, '3600', 13, 1651600, '2025-07-15 09:32:12'),
(277, 269, '2198', 13, 1651600, '2025-07-15 09:42:41'),
(278, 270, '9634', 13, 1651600, '2025-07-15 09:47:32'),
(279, 271, '1793', 13, 1651600, '2025-07-15 10:29:17'),
(280, 272, '', 13, 1651600, '2025-07-15 10:38:56'),
(281, 273, '5278', 13, 1651600, '2025-07-15 10:48:15'),
(282, 274, '8087', 13, 1651600, '2025-07-15 10:56:45'),
(283, 275, '3926', 13, 1651600, '2025-07-15 11:07:26'),
(284, 276, '3516', 13, 1651600, '2025-07-15 11:13:51'),
(285, 277, '2332', 14, 1651600, '2025-07-15 11:17:55'),
(286, 279, '1416', 14, 1651600, '2025-07-16 09:29:02'),
(287, 280, '3317', 14, 1651600, '2025-07-16 09:58:32'),
(288, 281, '1430', 14, 1651600, '2025-07-16 17:13:41'),
(289, 283, '9369', 14, 1651600, '2025-07-16 17:27:37'),
(290, 284, '6594', 14, 1651600, '2025-07-16 17:35:28'),
(291, 285, '3111', 14, 1651600, '2025-07-16 17:43:07'),
(292, 286, '6221', 14, 1651600, '2025-07-16 17:51:56'),
(293, 287, '4302', 14, 1651600, '2025-07-16 17:57:12'),
(294, 288, '0803', 14, 1651600, '2025-07-16 18:07:43'),
(295, 289, '9946', 14, 1651600, '2025-07-16 18:15:53'),
(296, 290, '9953', 13, 1651600, '2025-07-17 10:44:36'),
(297, 291, '7062', 15, 1651600, '2025-07-17 10:52:30'),
(298, 292, '1542', 14, 1651600, '2025-07-17 11:18:45'),
(299, 293, '1456', 14, 1651600, '2025-07-17 11:27:07'),
(300, 294, '3209', 14, 1651600, '2025-07-18 10:58:50'),
(301, 296, '8934', 15, 1651600, '2025-07-18 11:18:45'),
(302, 297, '5936', 15, 1651600, '2025-07-18 11:28:48'),
(303, 298, '1013', 15, 1651600, '2025-07-21 10:37:03'),
(304, 299, '6639', 15, 1651600, '2025-07-21 11:10:56'),
(305, 300, '3817', 14, 1651600, '2025-07-21 11:20:14'),
(306, 301, '8097', 15, 1651600, '2025-07-21 11:24:45'),
(307, 207, '6143', 15, 1651600, '2025-07-21 11:32:30'),
(308, 302, '1532', 15, 1651600, '2025-07-22 08:02:01'),
(309, 303, '6116', 15, 1651600, '2025-07-22 08:05:02'),
(310, 304, '9771', 15, 1651600, '2025-07-22 08:07:53'),
(311, 305, '2478', 15, 1651600, '2025-07-22 08:12:32'),
(312, 211, '2387', 15, 1651600, '2025-07-22 18:23:52'),
(313, 306, '8198', 15, 1651600, '2025-07-22 18:33:21'),
(314, 295, '7973', 15, 1651600, '2025-07-22 18:50:50'),
(315, 307, '4869', 14, 1651600, '2025-07-22 18:56:51'),
(316, 308, '6559', 14, 1651600, '2025-07-22 19:08:14'),
(317, 217, '9780', 8, 1533600, '2025-07-22 19:28:15'),
(318, 310, '0062', 16, 1651600, '2025-07-23 19:11:49'),
(319, 224, '9795', 16, 1651600, '2025-07-23 19:17:36'),
(320, 311, '8276', 16, 1651600, '2025-07-23 19:21:03'),
(321, 312, '5066', 16, 1651600, '2025-07-23 19:25:08'),
(322, 313, '4006', 16, 1651600, '2025-07-23 19:29:33'),
(323, 314, '2071', 16, 1651600, '2025-07-23 19:36:16'),
(324, 315, '6536', 16, 1651600, '2025-07-23 19:40:59'),
(325, 316, '7684', 16, 1651600, '2025-07-23 19:44:20'),
(326, 0, '5127', 16, 1651600, '2025-07-23 19:52:12'),
(327, 319, '5176', 16, 1651600, '2025-07-24 18:29:24'),
(328, 320, '7754', 16, 1651600, '2025-07-24 18:31:40'),
(329, 321, '6005', 16, 1651600, '2025-07-24 19:51:53'),
(330, 322, '8419', 16, 1651600, '2025-07-24 20:02:22'),
(331, 323, '0192', 16, 1651600, '2025-07-24 20:10:20'),
(332, 324, '7026', 16, 1651600, '2025-07-24 20:17:39'),
(333, 325, '2471', 16, 1651600, '2025-07-24 20:28:29'),
(334, 326, '1243', 16, 1651600, '2025-07-24 20:33:20'),
(335, 327, '8184', 16, 1651600, '2025-07-24 20:39:15'),
(336, 328, '7256', 16, 1651600, '2025-07-24 20:49:26'),
(337, 318, '1234', 16, 1651600, '2025-07-24 20:59:20'),
(338, 330, '6841', 16, 1651600, '2025-07-24 21:11:36'),
(339, 331, '2417', 17, 1651600, '2025-07-24 21:19:35'),
(340, 332, '3291', 17, 1651600, '2025-07-24 21:23:36'),
(341, 333, '6462', 17, 1651600, '2025-07-24 21:32:27'),
(342, 334, '8150', 17, 1651600, '2025-07-24 21:35:40'),
(343, 335, '2101', 17, 1651600, '2025-07-24 21:39:24'),
(344, 336, '0275', 17, 1651600, '2025-07-24 21:42:33'),
(345, 337, '2282', 17, 1651600, '2025-07-24 21:45:17'),
(346, 338, '1929', 17, 1651600, '2025-07-24 21:52:29'),
(347, 339, '5475', 17, 1651600, '2025-07-24 21:55:28'),
(348, 340, '7273', 17, 1651600, '2025-07-24 21:58:50'),
(349, 247, '0013', 3, 1533600, '2025-07-29 09:54:23');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `system_settings`
--

CREATE TABLE `system_settings` (
  `id` int NOT NULL,
  `name` text NOT NULL,
  `email` varchar(200) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `cover_img` text NOT NULL,
  `about_content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `name` text NOT NULL,
  `username` varchar(200) NOT NULL,
  `password` text NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '3' COMMENT '1=Admin,2=Staff'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`, `type`) VALUES
(1, 'Leonardo Peñaranda', 'administrador', '4b67deeb9aba04a5b54632ad19934f26', 1),
(2, 'susana', 'susi', '071f5117de51985927ad02a07bb9f78f', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `fees`
--
ALTER TABLE `fees`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `student_ef_list`
--
ALTER TABLE `student_ef_list`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `system_settings`
--
ALTER TABLE `system_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `fees`
--
ALTER TABLE `fees`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT de la tabla `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1193;

--
-- AUTO_INCREMENT de la tabla `student`
--
ALTER TABLE `student`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=341;

--
-- AUTO_INCREMENT de la tabla `student_ef_list`
--
ALTER TABLE `student_ef_list`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=350;

--
-- AUTO_INCREMENT de la tabla `system_settings`
--
ALTER TABLE `system_settings`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
