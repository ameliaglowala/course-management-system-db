-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 02, 2026 at 09:34 PM
-- Wersja serwera: 10.4.32-MariaDB
-- Wersja PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `biuro_korepetycji`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `grafik`
--

CREATE TABLE `grafik` (
  `ID_Zajecia` int(11) NOT NULL,
  `ID_Grupy` int(11) DEFAULT NULL,
  `ID_Sali` int(11) DEFAULT NULL,
  `Dzien_Tygodnia` varchar(20) NOT NULL,
  `Godzina_Start` time NOT NULL,
  `Godzina_Koniec` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `grafik`
--

INSERT INTO `grafik` (`ID_Zajecia`, `ID_Grupy`, `ID_Sali`, `Dzien_Tygodnia`, `Godzina_Start`, `Godzina_Koniec`) VALUES
(1, 2, 1, 'Poniedziałek', '14:00:00', '16:00:00'),
(2, 3, 1, 'Poniedziałek', '16:00:00', '18:00:00'),
(3, 6, 1, 'Poniedziałek', '18:00:00', '20:00:00'),
(4, 4, 2, 'Poniedziałek', '16:00:00', '18:00:00'),
(5, 5, 3, 'Poniedziałek', '16:00:00', '18:00:00'),
(6, 7, 3, 'Poniedziałek', '18:00:00', '20:00:00'),
(7, 1, 2, 'Poniedziałek', '18:00:00', '20:00:00'),
(8, 1, 1, 'Wtorek', '17:00:00', '19:00:00'),
(9, 8, 2, 'Wtorek', '17:00:00', '19:00:00'),
(10, 3, 3, 'Wtorek', '16:00:00', '18:00:00'),
(11, 6, 3, 'Wtorek', '18:00:00', '20:00:00'),
(12, 7, 1, 'Środa', '17:00:00', '19:00:00'),
(13, 2, 2, 'Środa', '17:00:00', '19:00:00');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `grupy`
--

CREATE TABLE `grupy` (
  `ID_Grupy` int(11) NOT NULL,
  `Nazwa_Grupy` varchar(50) NOT NULL,
  `ID_Przedmiotu` int(11) DEFAULT NULL,
  `ID_Nauczyciela` int(11) DEFAULT NULL,
  `Poziom` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `grupy`
--

INSERT INTO `grupy` (`ID_Grupy`, `Nazwa_Grupy`, `ID_Przedmiotu`, `ID_Nauczyciela`, `Poziom`) VALUES
(1, 'ang_4', 2, 6, 4),
(2, 'ang_6', 2, 1, 6),
(3, 'ang_8', 2, 6, 8),
(4, 'fiz_7', 1, 3, 7),
(5, 'fiz_8', 1, 5, 8),
(6, 'mat_4', 3, 2, 4),
(7, 'mat_5', 3, 4, 5),
(8, 'mat_8', 3, 2, 8);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `korepetytorzy`
--

CREATE TABLE `korepetytorzy` (
  `ID_Nauczyciela` int(11) NOT NULL,
  `Imie` varchar(50) NOT NULL,
  `Nazwisko` varchar(50) NOT NULL,
  `ID_Przedmiotu` int(11) DEFAULT NULL,
  `Telefon` varchar(20) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Stawka_h` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `korepetytorzy`
--

INSERT INTO `korepetytorzy` (`ID_Nauczyciela`, `Imie`, `Nazwisko`, `ID_Przedmiotu`, `Telefon`, `Email`, `Stawka_h`) VALUES
(1, 'Wiesława', 'Fabiańska', 2, '500-754-214', 'wiesława.fabiańska@biuro.pl', 80.00),
(2, 'Bożena', 'Celna', 3, '500-125-859', 'bożena.celna@biuro.pl', 75.00),
(3, 'Andrzej', 'Trambel', 1, '500-381-350', 'andrzej.trambel@biuro.pl', 90.00),
(4, 'Tomasz', 'Jacel', 3, '500-328-242', 'tomasz.jacel@biuro.pl', 75.00),
(5, 'Wojciech', 'Koktajl', 1, '500-854-204', 'wojciech.koktajl@biuro.pl', 85.00),
(6, 'Bernadeta', 'Nowak', 2, '500-792-858', 'bernadeta.nowak@biuro.pl', 80.00);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `platnosci`
--

CREATE TABLE `platnosci` (
  `ID_Platnosci` int(11) NOT NULL,
  `ID_Ucznia` int(11) DEFAULT NULL,
  `Miesiac` varchar(20) DEFAULT NULL,
  `Kwota` decimal(6,2) DEFAULT NULL,
  `Status_Oplacenia` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `platnosci`
--

INSERT INTO `platnosci` (`ID_Platnosci`, `ID_Ucznia`, `Miesiac`, `Kwota`, `Status_Oplacenia`) VALUES
(1, 1, 'wrz.23', 300.00, 'Opłacone'),
(2, 2, 'wrz.23', 300.00, 'Opłacone'),
(3, 3, 'wrz.23', 350.00, 'Brak wpłaty'),
(4, 4, 'wrz.23', 400.00, 'Opłacone'),
(5, 5, 'wrz.23', 400.00, 'Brak wpłaty'),
(6, 6, 'wrz.23', 300.00, 'Opłacone'),
(7, 7, 'wrz.23', 350.00, 'Opłacone'),
(8, 8, 'wrz.23', 400.00, 'Oczekujące'),
(9, 9, 'wrz.23', 300.00, 'Opłacone'),
(10, 10, 'wrz.23', 300.00, 'Brak wpłaty'),
(11, 11, 'wrz.23', 350.00, 'Opłacone'),
(12, 12, 'wrz.23', 400.00, 'Oczekujące'),
(13, 13, 'wrz.23', 350.00, 'Opłacone'),
(14, 14, 'wrz.23', 300.00, 'Opłacone'),
(15, 15, 'wrz.23', 400.00, 'Brak wpłaty'),
(16, 16, 'wrz.23', 350.00, 'Opłacone'),
(17, 17, 'wrz.23', 300.00, 'Opłacone'),
(18, 18, 'wrz.23', 350.00, 'Opłacone'),
(19, 19, 'wrz.23', 400.00, 'Opłacone'),
(20, 20, 'wrz.23', 400.00, 'Brak wpłaty'),
(21, 21, 'wrz.23', 350.00, 'Opłacone'),
(22, 22, 'wrz.23', 350.00, 'Opłacone'),
(23, 23, 'wrz.23', 350.00, 'Oczekujące'),
(24, 24, 'wrz.23', 350.00, 'Opłacone'),
(25, 25, 'wrz.23', 300.00, 'Opłacone'),
(26, 26, 'wrz.23', 300.00, 'Opłacone'),
(27, 27, 'wrz.23', 400.00, 'Opłacone'),
(28, 28, 'wrz.23', 350.00, 'Brak wpłaty'),
(29, 29, 'wrz.23', 350.00, 'Opłacone'),
(30, 30, 'wrz.23', 300.00, 'Oczekujące'),
(31, 31, 'wrz.23', 400.00, 'Opłacone'),
(32, 32, 'wrz.23', 350.00, 'Opłacone'),
(33, 33, 'wrz.23', 350.00, 'Brak wpłaty'),
(34, 34, 'wrz.23', 300.00, 'Opłacone'),
(35, 35, 'wrz.23', 400.00, 'Opłacone'),
(36, 36, 'wrz.23', 400.00, 'Opłacone'),
(37, 37, 'wrz.23', 350.00, 'Oczekujące'),
(38, 38, 'wrz.23', 300.00, 'Opłacone'),
(39, 39, 'wrz.23', 350.00, 'Opłacone'),
(40, 40, 'wrz.23', 400.00, 'Brak wpłaty');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `przedmioty`
--

CREATE TABLE `przedmioty` (
  `ID_Przedmiotu` int(11) NOT NULL,
  `Nazwa` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `przedmioty`
--

INSERT INTO `przedmioty` (`ID_Przedmiotu`, `Nazwa`) VALUES
(1, 'fizyka'),
(2, 'język angielski'),
(3, 'matematyka');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `sale`
--

CREATE TABLE `sale` (
  `ID_Sali` int(11) NOT NULL,
  `Numer_Sali` varchar(20) NOT NULL,
  `Pojemnosc` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sale`
--

INSERT INTO `sale` (`ID_Sali`, `Numer_Sali`, `Pojemnosc`) VALUES
(1, 'Sala 1', 12),
(2, 'Sala 2', 8),
(3, 'Sala 3', 15);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `uczniowie`
--

CREATE TABLE `uczniowie` (
  `ID_Ucznia` int(11) NOT NULL,
  `Imie` varchar(50) NOT NULL,
  `Nazwisko` varchar(50) NOT NULL,
  `Klasa` int(11) NOT NULL,
  `Telefon_Rodzica` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `uczniowie`
--

INSERT INTO `uczniowie` (`ID_Ucznia`, `Imie`, `Nazwisko`, `Klasa`, `Telefon_Rodzica`) VALUES
(1, 'Amelia', 'Kowalska', 5, '600-658-189'),
(2, 'Katarzyna', 'Nowak', 4, '600-704-532'),
(3, 'Jakub', 'Wiśniewski', 6, '600-132-130'),
(4, 'Kacper', 'Bak', 7, '600-195-323'),
(5, 'Krzysztof', 'Droga', 8, '600-338-617'),
(6, 'Michał', 'Limit', 4, '600-716-127'),
(7, 'Julia', 'Popel', 6, '600-674-303'),
(8, 'Alan', 'Grabat', 8, '600-833-765'),
(9, 'Wojciech', 'Okol', 5, '600-818-658'),
(10, 'Adam', 'Jabłko', 4, '600-529-325'),
(11, 'Jakub', 'Wiśniewski', 5, '600-559-703'),
(12, 'Kacper', 'Kowalski', 7, '600-384-928'),
(13, 'Anna', 'Banan', 4, '600-990-106'),
(14, 'Bartosz', 'Popek', 5, '600-877-925'),
(15, 'Bartłomiej', 'Pila', 8, '600-263-814'),
(16, 'Marek', 'Nawrot', 6, '600-532-448'),
(17, 'Liliana', 'Piłsudska', 4, '600-384-259'),
(18, 'Marysia', 'Żeromska', 4, '600-320-881'),
(19, 'Natalia', 'Motyl', 8, '600-444-204'),
(20, 'Patryk', 'Kruk', 7, '600-194-489'),
(21, 'Klaudia', 'Prat', 6, '600-199-467'),
(22, 'Marcin', 'Karb', 6, '600-967-452'),
(23, 'Miłosz', 'Druk', 6, '600-718-370'),
(24, 'Faustyna', 'Janisiak', 4, '600-926-144'),
(25, 'Arkadiusz', 'Kowalski', 4, '600-847-570'),
(26, 'Aria', 'Kolektyw', 8, '600-649-227'),
(27, 'Nela', 'Popielawska', 8, '600-487-180'),
(28, 'Nikodem', 'Trzmiel', 8, '600-665-400'),
(29, 'Wiktoria', 'Chmiel', 4, '600-949-743'),
(30, 'Weronika', 'Młyn', 5, '600-733-982'),
(31, 'Jakun', 'Tramp', 7, '600-470-691'),
(32, 'Krzysztof', 'Kowalski', 8, '600-296-821'),
(33, 'Bartosz', 'Nowak', 8, '600-171-146'),
(34, 'Jarosław', 'Polak', 8, '600-777-333'),
(35, 'Ignacy', 'Flem', 8, '600-891-396'),
(36, 'Julia', 'Herb', 8, '600-181-975'),
(37, 'Amelia', 'Popalska', 8, '600-338-987'),
(38, 'Katarzyna', 'Młyn', 8, '600-203-489'),
(39, 'Klaudia', 'Grabat', 8, '600-384-564'),
(40, 'Faustyna', 'Chmiel', 8, '600-750-954');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `uczniowie_w_grupach`
--

CREATE TABLE `uczniowie_w_grupach` (
  `ID_Ucznia` int(11) NOT NULL,
  `ID_Grupy` int(11) NOT NULL,
  `Data_Zapisu` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `uczniowie_w_grupach`
--

INSERT INTO `uczniowie_w_grupach` (`ID_Ucznia`, `ID_Grupy`, `Data_Zapisu`) VALUES
(1, 7, '1.09.2023'),
(2, 6, '1.09.2023'),
(3, 2, '1.09.2023'),
(4, 4, '1.09.2023'),
(5, 5, '1.09.2023'),
(6, 6, '1.09.2023'),
(7, 2, '1.09.2023'),
(8, 5, '1.09.2023'),
(9, 7, '1.09.2023'),
(10, 6, '1.09.2023'),
(11, 7, '1.09.2023'),
(12, 4, '1.09.2023'),
(13, 1, '1.09.2023'),
(14, 7, '1.09.2023'),
(15, 5, '1.09.2023'),
(16, 2, '1.09.2023'),
(17, 6, '1.09.2023'),
(18, 1, '1.09.2023'),
(19, 3, '1.09.2023'),
(20, 4, '1.09.2023'),
(21, 2, '1.09.2023'),
(22, 2, '1.09.2023'),
(23, 2, '1.09.2023'),
(24, 1, '1.09.2023'),
(25, 6, '1.09.2023'),
(26, 3, '1.09.2023'),
(27, 3, '1.09.2023'),
(28, 3, '1.09.2023'),
(29, 1, '1.09.2023'),
(30, 7, '1.09.2023'),
(31, 4, '1.09.2023'),
(32, 3, '1.09.2023'),
(33, 3, '1.09.2023'),
(34, 3, '1.09.2023'),
(35, 3, '1.09.2023'),
(36, 8, '1.09.2023'),
(37, 8, '1.09.2023'),
(38, 8, '1.09.2023'),
(39, 8, '1.09.2023'),
(40, 8, '1.09.2023');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `grafik`
--
ALTER TABLE `grafik`
  ADD PRIMARY KEY (`ID_Zajecia`),
  ADD KEY `ID_Grupy` (`ID_Grupy`),
  ADD KEY `ID_Sali` (`ID_Sali`);

--
-- Indeksy dla tabeli `grupy`
--
ALTER TABLE `grupy`
  ADD PRIMARY KEY (`ID_Grupy`),
  ADD KEY `ID_Przedmiotu` (`ID_Przedmiotu`),
  ADD KEY `ID_Nauczyciela` (`ID_Nauczyciela`);

--
-- Indeksy dla tabeli `korepetytorzy`
--
ALTER TABLE `korepetytorzy`
  ADD PRIMARY KEY (`ID_Nauczyciela`),
  ADD KEY `ID_Przedmiotu` (`ID_Przedmiotu`);

--
-- Indeksy dla tabeli `platnosci`
--
ALTER TABLE `platnosci`
  ADD PRIMARY KEY (`ID_Platnosci`),
  ADD KEY `ID_Ucznia` (`ID_Ucznia`);

--
-- Indeksy dla tabeli `przedmioty`
--
ALTER TABLE `przedmioty`
  ADD PRIMARY KEY (`ID_Przedmiotu`);

--
-- Indeksy dla tabeli `sale`
--
ALTER TABLE `sale`
  ADD PRIMARY KEY (`ID_Sali`);

--
-- Indeksy dla tabeli `uczniowie`
--
ALTER TABLE `uczniowie`
  ADD PRIMARY KEY (`ID_Ucznia`);

--
-- Indeksy dla tabeli `uczniowie_w_grupach`
--
ALTER TABLE `uczniowie_w_grupach`
  ADD PRIMARY KEY (`ID_Ucznia`,`ID_Grupy`),
  ADD KEY `ID_Grupy` (`ID_Grupy`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `grafik`
--
ALTER TABLE `grafik`
  ADD CONSTRAINT `grafik_ibfk_1` FOREIGN KEY (`ID_Grupy`) REFERENCES `grupy` (`ID_Grupy`),
  ADD CONSTRAINT `grafik_ibfk_2` FOREIGN KEY (`ID_Sali`) REFERENCES `sale` (`ID_Sali`);

--
-- Constraints for table `grupy`
--
ALTER TABLE `grupy`
  ADD CONSTRAINT `grupy_ibfk_1` FOREIGN KEY (`ID_Przedmiotu`) REFERENCES `przedmioty` (`ID_Przedmiotu`),
  ADD CONSTRAINT `grupy_ibfk_2` FOREIGN KEY (`ID_Nauczyciela`) REFERENCES `korepetytorzy` (`ID_Nauczyciela`);

--
-- Constraints for table `korepetytorzy`
--
ALTER TABLE `korepetytorzy`
  ADD CONSTRAINT `korepetytorzy_ibfk_1` FOREIGN KEY (`ID_Przedmiotu`) REFERENCES `przedmioty` (`ID_Przedmiotu`);

--
-- Constraints for table `platnosci`
--
ALTER TABLE `platnosci`
  ADD CONSTRAINT `platnosci_ibfk_1` FOREIGN KEY (`ID_Ucznia`) REFERENCES `uczniowie` (`ID_Ucznia`);

--
-- Constraints for table `uczniowie_w_grupach`
--
ALTER TABLE `uczniowie_w_grupach`
  ADD CONSTRAINT `uczniowie_w_grupach_ibfk_1` FOREIGN KEY (`ID_Ucznia`) REFERENCES `uczniowie` (`ID_Ucznia`),
  ADD CONSTRAINT `uczniowie_w_grupach_ibfk_2` FOREIGN KEY (`ID_Grupy`) REFERENCES `grupy` (`ID_Grupy`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
