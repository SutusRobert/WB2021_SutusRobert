-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: localhost
-- Létrehozás ideje: 2025. Már 10. 06:29
-- Kiszolgáló verziója: 8.0.39
-- PHP verzió: 8.2.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `turak`
--
CREATE DATABASE IF NOT EXISTS `turak` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_hungarian_ci;
USE `turak`;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `kategoria`
--

CREATE TABLE `kategoria` (
  `id` int NOT NULL,
  `nev` varchar(50) COLLATE utf8mb4_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `kategoria`
--

INSERT INTO `kategoria` (`id`, `nev`) VALUES
(1, 'Tracking túra'),
(2, 'Teljesítmény túra'),
(3, 'Jelvényszerző túra'),
(4, 'Kerékpártúra'),
(5, 'Evezős túra'),
(6, 'Magashegyi expadíció');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `turak`
--

CREATE TABLE `turak` (
  `id` int NOT NULL,
  `leiras` varchar(255) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `tav` int NOT NULL,
  `emelkedes` int NOT NULL,
  `lejtes` int NOT NULL,
  `kategoria` int NOT NULL,
  `vezeto` int NOT NULL,
  `aktiv` tinyint(1) NOT NULL,
  `indulas` date NOT NULL,
  `erkezes` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `turak`
--

INSERT INTO `turak` (`id`, `leiras`, `tav`, `emelkedes`, `lejtes`, `kategoria`, `vezeto`, `aktiv`, `indulas`, `erkezes`) VALUES
(1, 'Ez a túra tökéletes választás, ha szereted a természetet és a kihívásokat.', 31, 122, 391, 4, 7, 1, '2025-06-20', '2025-06-20'),
(2, 'Hódíts meg lenyűgöző csúcsokat és tapasztald meg a hegyek varázsát!', 106, 88, 261, 2, 10, 0, '2025-02-02', '2025-02-08'),
(3, 'Csodálatos panoráma és friss hegyi levegő vár ezen a kihívásokkal teli úton.', 18, 420, 127, 1, 15, 0, '2025-01-29', '2025-02-01'),
(4, 'Ez a túra garantáltan felejthetetlen élményeket nyújt minden természetkedvelő számára.', 196, 327, 391, 4, 4, 0, '2025-05-20', '2025-05-23'),
(5, 'Egy különleges kaland vár, ahol hegyek, völgyek és patakok szegélyezik az utad.', 144, 429, 244, 3, 9, 1, '2025-03-14', '2025-03-23'),
(6, 'Barangolj a mesés erdei ösvényeken és élvezd a természet nyugalmát!', 198, 147, 280, 1, 3, 0, '2025-03-26', '2025-03-31'),
(7, 'Barangolj a mesés erdei ösvényeken és élvezd a természet nyugalmát!', 45, 402, 284, 3, 2, 1, '2025-02-04', '2025-02-12'),
(8, 'Tölts el egy aktív napot a szabadban, és élvezd a változatos terep adottságait.', 64, 120, 126, 4, 13, 0, '2025-09-10', '2025-09-13'),
(9, 'Hódíts meg lenyűgöző csúcsokat és tapasztald meg a hegyek varázsát!', 146, 31, 240, 1, 12, 0, '2025-08-05', '2025-08-13'),
(10, 'Hódíts meg lenyűgöző csúcsokat és tapasztald meg a hegyek varázsát!', 143, 470, 54, 2, 14, 0, '2025-09-24', '2025-09-28'),
(11, 'Egy különleges kaland vár, ahol hegyek, völgyek és patakok szegélyezik az utad.', 105, 257, 20, 3, 6, 0, '2025-07-23', '2025-07-31'),
(12, 'Lendülj evezőre, és fedezd fel a folyók és tavak páratlan szépségét!', 130, 67, 456, 4, 2, 1, '2025-06-20', '2025-06-26'),
(13, 'Csodálatos panoráma és friss hegyi levegő vár ezen a kihívásokkal teli úton.', 60, 417, 430, 1, 12, 1, '2025-12-23', '2025-12-30'),
(14, 'Hódíts meg lenyűgöző csúcsokat és tapasztald meg a hegyek varázsát!', 99, 347, 2, 6, 15, 1, '2025-04-21', '2025-04-22'),
(15, 'Ez a túra tökéletes választás, ha szereted a természetet és a kihívásokat.', 155, 54, 164, 2, 1, 0, '2025-11-16', '2025-11-19'),
(16, 'Csodálatos panoráma és friss hegyi levegő vár ezen a kihívásokkal teli úton.', 178, 428, 476, 6, 10, 1, '2025-06-05', '2025-06-13'),
(17, 'Barangolj a mesés erdei ösvényeken és élvezd a természet nyugalmát!', 146, 460, 476, 3, 3, 1, '2025-04-12', '2025-04-22'),
(18, 'Ez a túra tökéletes választás, ha szereted a természetet és a kihívásokat.', 150, 128, 7, 6, 7, 1, '2025-07-16', '2025-07-24'),
(19, 'Ez a túra tökéletes választás, ha szereted a természetet és a kihívásokat.', 72, 270, 439, 4, 15, 1, '2025-03-13', '2025-03-21'),
(20, 'Hódíts meg lenyűgöző csúcsokat és tapasztald meg a hegyek varázsát!', 37, 162, 283, 3, 5, 1, '2025-10-24', '2025-11-03'),
(21, 'Lendülj evezőre, és fedezd fel a folyók és tavak páratlan szépségét!', 42, 53, 260, 5, 6, 0, '2025-07-24', '2025-08-01'),
(22, 'Lendülj evezőre, és fedezd fel a folyók és tavak páratlan szépségét!', 96, 21, 109, 1, 4, 1, '2025-01-17', '2025-01-18'),
(23, 'Hódíts meg lenyűgöző csúcsokat és tapasztald meg a hegyek varázsát!', 162, 67, 437, 6, 9, 1, '2025-10-18', '2025-10-23'),
(24, 'Hódíts meg lenyűgöző csúcsokat és tapasztald meg a hegyek varázsát!', 6, 215, 393, 4, 13, 1, '2025-09-14', '2025-09-18'),
(25, 'Barangolj a mesés erdei ösvényeken és élvezd a természet nyugalmát!', 77, 490, 52, 3, 7, 0, '2025-04-10', '2025-04-14'),
(26, 'Lendülj evezőre, és fedezd fel a folyók és tavak páratlan szépségét!', 114, 426, 342, 6, 9, 0, '2025-06-30', '2025-07-07'),
(27, 'Lendülj evezőre, és fedezd fel a folyók és tavak páratlan szépségét!', 95, 228, 22, 5, 14, 0, '2025-06-08', '2025-06-10'),
(28, 'Ez a túra garantáltan felejthetetlen élményeket nyújt minden természetkedvelő számára.', 123, 316, 171, 5, 13, 0, '2025-10-31', '2025-11-05'),
(29, 'Hódíts meg lenyűgöző csúcsokat és tapasztald meg a hegyek varázsát!', 104, 493, 214, 4, 1, 1, '2025-08-09', '2025-08-14'),
(30, 'Ez a túra garantáltan felejthetetlen élményeket nyújt minden természetkedvelő számára.', 77, 179, 125, 2, 2, 0, '2025-10-31', '2025-11-09'),
(31, 'Fedezd fel a vadregényes hegyvidéket egy izgalmas túra során!', 198, 291, 152, 4, 15, 0, '2025-03-06', '2025-03-15'),
(32, 'Fedezd fel a vadregényes hegyvidéket egy izgalmas túra során!', 118, 293, 406, 2, 7, 1, '2025-11-22', '2025-12-01'),
(33, 'Egy különleges kaland vár, ahol hegyek, völgyek és patakok szegélyezik az utad.', 40, 362, 177, 5, 2, 0, '2025-03-10', '2025-03-19'),
(34, 'Tekerj végig csodás tájakon, és fedezd fel a vidék rejtett kincseit!', 141, 158, 72, 6, 2, 0, '2025-11-30', '2025-12-08'),
(35, 'Ez a túra tökéletes választás, ha szereted a természetet és a kihívásokat.', 151, 341, 408, 2, 15, 1, '2025-02-14', '2025-02-20'),
(36, 'Tölts el egy aktív napot a szabadban, és élvezd a változatos terep adottságait.', 165, 293, 113, 3, 2, 1, '2025-06-11', '2025-06-21'),
(37, 'Fedezd fel a vadregényes hegyvidéket egy izgalmas túra során!', 89, 156, 36, 6, 1, 0, '2025-06-30', '2025-07-10'),
(38, 'Ez a túra tökéletes választás, ha szereted a természetet és a kihívásokat.', 90, 311, 475, 2, 7, 0, '2025-02-15', '2025-02-25'),
(39, 'Barangolj a mesés erdei ösvényeken és élvezd a természet nyugalmát!', 49, 384, 380, 6, 5, 0, '2025-03-22', '2025-03-28'),
(40, 'Ez a túra tökéletes választás, ha szereted a természetet és a kihívásokat.', 139, 214, 357, 2, 1, 0, '2025-04-13', '2025-04-20'),
(41, 'Tekerj végig csodás tájakon, és fedezd fel a vidék rejtett kincseit!', 123, 405, 138, 4, 6, 0, '2025-07-20', '2025-07-27'),
(42, 'Tölts el egy aktív napot a szabadban, és élvezd a változatos terep adottságait.', 49, 51, 388, 3, 15, 1, '2025-11-14', '2025-11-19'),
(43, 'Tekerj végig csodás tájakon, és fedezd fel a vidék rejtett kincseit!', 143, 372, 173, 2, 14, 1, '2025-12-10', '2025-12-11'),
(44, 'Tekerj végig csodás tájakon, és fedezd fel a vidék rejtett kincseit!', 82, 456, 67, 6, 6, 1, '2025-05-18', '2025-05-28'),
(45, 'Fedezd fel a vadregényes hegyvidéket egy izgalmas túra során!', 14, 485, 360, 4, 5, 1, '2025-07-28', '2025-07-30'),
(46, 'Ez a túra tökéletes választás, ha szereted a természetet és a kihívásokat.', 41, 108, 424, 1, 14, 0, '2025-08-06', '2025-08-12'),
(47, 'Fedezd fel a vadregényes hegyvidéket egy izgalmas túra során!', 152, 285, 170, 6, 9, 0, '2025-07-26', '2025-08-02'),
(48, 'Fedezd fel a vadregényes hegyvidéket egy izgalmas túra során!', 10, 36, 0, 5, 12, 0, '2025-06-13', '2025-06-17'),
(49, 'Egy különleges kaland vár, ahol hegyek, völgyek és patakok szegélyezik az utad.', 163, 435, 456, 5, 4, 0, '2025-01-10', '2025-01-11'),
(50, 'Tekerj végig csodás tájakon, és fedezd fel a vidék rejtett kincseit!', 114, 420, 120, 6, 2, 0, '2025-04-28', '2025-04-29'),
(51, 'Ez a túra garantáltan felejthetetlen élményeket nyújt minden természetkedvelő számára.', 70, 241, 86, 4, 8, 0, '2025-09-22', '2025-09-25'),
(52, 'Egy különleges kaland vár, ahol hegyek, völgyek és patakok szegélyezik az utad.', 50, 489, 26, 2, 3, 0, '2025-10-12', '2025-10-22'),
(53, 'Fedezd fel a vadregényes hegyvidéket egy izgalmas túra során!', 118, 233, 147, 1, 2, 1, '2025-04-16', '2025-04-18'),
(54, 'Lendülj evezőre, és fedezd fel a folyók és tavak páratlan szépségét!', 172, 499, 260, 6, 6, 0, '2025-08-09', '2025-08-17'),
(55, 'Ez a túra garantáltan felejthetetlen élményeket nyújt minden természetkedvelő számára.', 124, 360, 476, 4, 14, 0, '2025-03-10', '2025-03-20'),
(56, 'Fedezd fel a vadregényes hegyvidéket egy izgalmas túra során!', 181, 337, 188, 5, 9, 0, '2025-09-22', '2025-09-29'),
(57, 'Ez a túra garantáltan felejthetetlen élményeket nyújt minden természetkedvelő számára.', 166, 397, 3, 6, 3, 1, '2025-04-14', '2025-04-17'),
(58, 'Ez a túra garantáltan felejthetetlen élményeket nyújt minden természetkedvelő számára.', 95, 368, 337, 4, 13, 0, '2025-10-26', '2025-11-01'),
(59, 'Tekerj végig csodás tájakon, és fedezd fel a vidék rejtett kincseit!', 98, 272, 128, 3, 12, 0, '2025-10-16', '2025-10-24'),
(60, 'Hódíts meg lenyűgöző csúcsokat és tapasztald meg a hegyek varázsát!', 140, 371, 226, 4, 15, 0, '2025-02-11', '2025-02-14'),
(61, 'Csodálatos panoráma és friss hegyi levegő vár ezen a kihívásokkal teli úton.', 145, 336, 462, 3, 7, 1, '2025-01-25', '2025-02-01'),
(62, 'Csodálatos panoráma és friss hegyi levegő vár ezen a kihívásokkal teli úton.', 28, 41, 306, 1, 15, 0, '2025-07-06', '2025-07-10'),
(63, 'Tölts el egy aktív napot a szabadban, és élvezd a változatos terep adottságait.', 68, 479, 52, 3, 9, 0, '2025-04-10', '2025-04-12'),
(64, 'Tölts el egy aktív napot a szabadban, és élvezd a változatos terep adottságait.', 16, 495, 494, 3, 2, 1, '2025-09-26', '2025-10-03'),
(65, 'Ez a túra garantáltan felejthetetlen élményeket nyújt minden természetkedvelő számára.', 75, 211, 182, 2, 12, 0, '2025-09-07', '2025-09-08'),
(66, 'Barangolj a mesés erdei ösvényeken és élvezd a természet nyugalmát!', 168, 309, 480, 3, 3, 0, '2025-08-19', '2025-08-27'),
(67, 'Ez a túra tökéletes választás, ha szereted a természetet és a kihívásokat.', 198, 109, 328, 4, 7, 0, '2025-02-18', '2025-02-19'),
(68, 'Tekerj végig csodás tájakon, és fedezd fel a vidék rejtett kincseit!', 198, 171, 437, 6, 2, 0, '2025-12-12', '2025-12-16'),
(69, 'Ez a túra garantáltan felejthetetlen élményeket nyújt minden természetkedvelő számára.', 39, 39, 318, 3, 1, 0, '2025-07-31', '2025-08-03'),
(70, 'Tekerj végig csodás tájakon, és fedezd fel a vidék rejtett kincseit!', 112, 184, 68, 2, 6, 0, '2025-12-24', '2025-12-31');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `vezeto`
--

CREATE TABLE `vezeto` (
  `id` int NOT NULL,
  `nev` varchar(50) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `tel` varchar(20) COLLATE utf8mb4_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `vezeto`
--

INSERT INTO `vezeto` (`id`, `nev`, `tel`) VALUES
(1, 'Kiss Péter', '+36 30 5157 8546'),
(2, 'Balogh Ágnes', '+36 30 7210 6118'),
(3, 'Mészáros Katalin', '+36 30 6689 7886'),
(4, 'Tóth Gergely', '+36 30 4486 1559'),
(5, 'Farkas Dávid', '+36 30 7640 6636'),
(6, 'Nagy Zoltán', '+36 30 6563 7706'),
(7, 'Takács József', '+36 30 5326 1396'),
(8, 'Papp Sándor', '+36 30 4224 8459'),
(9, 'Horváth Anna', '+36 30 8054 2038'),
(10, 'Molnár Tamás', '+36 30 3944 8226'),
(11, 'Szalai István', '+36 30 6475 5622'),
(12, 'Varga Balázs', '+36 30 2876 2683'),
(13, 'Juhász András', '+36 30 7168 2290'),
(14, 'Kovács Eszter', '+36 30 1596 6008'),
(15, 'Szabó László', '+36 30 3265 2685');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `kategoria`
--
ALTER TABLE `kategoria`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `turak`
--
ALTER TABLE `turak`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `vezeto`
--
ALTER TABLE `vezeto`
  ADD PRIMARY KEY (`id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `kategoria`
--
ALTER TABLE `kategoria`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT a táblához `turak`
--
ALTER TABLE `turak`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT a táblához `vezeto`
--
ALTER TABLE `vezeto`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
