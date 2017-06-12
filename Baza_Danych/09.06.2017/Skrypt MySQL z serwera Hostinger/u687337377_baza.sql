
-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Czas wygenerowania: 09 Cze 2017, 14:54
-- Wersja serwera: 10.1.24-MariaDB
-- Wersja PHP: 5.2.17

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Baza danych: `u687337377_baza`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `GEOGRAFICZNE`
--

CREATE TABLE IF NOT EXISTS `GEOGRAFICZNE` (
  `ID_Geograficzne` int(11) NOT NULL AUTO_INCREMENT,
  `Szerokosc` int(11) NOT NULL,
  `Wysokosc` int(11) NOT NULL,
  PRIMARY KEY (`ID_Geograficzne`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `KOMENTARZ`
--

CREATE TABLE IF NOT EXISTS `KOMENTARZ` (
  `ID_Komentarza` int(11) NOT NULL AUTO_INCREMENT,
  `Opis` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID_Komentarza`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `KONTO`
--

CREATE TABLE IF NOT EXISTS `KONTO` (
  `ID_Konta` int(11) NOT NULL AUTO_INCREMENT,
  `E-mail` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Login` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `Haslo` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID_Konta`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `LOKALIZACJA`
--

CREATE TABLE IF NOT EXISTS `LOKALIZACJA` (
  `ID_Lokalizacji` int(11) NOT NULL AUTO_INCREMENT,
  `Miasto` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID_Lokalizacji`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `OCENA`
--

CREATE TABLE IF NOT EXISTS `OCENA` (
  `ID_Oceny` int(11) NOT NULL AUTO_INCREMENT,
  `Wartosc` int(11) NOT NULL,
  PRIMARY KEY (`ID_Oceny`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `OPIS`
--

CREATE TABLE IF NOT EXISTS `OPIS` (
  `ID_Opisu` int(11) NOT NULL AUTO_INCREMENT,
  `Tekst` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID_Opisu`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `POST`
--

CREATE TABLE IF NOT EXISTS `POST` (
  `ID_Posta` int(11) NOT NULL AUTO_INCREMENT,
  `ID_lokalizacji` int(11) NOT NULL,
  `ID_geograficznego` int(11) NOT NULL,
  `ID_zdjecia` int(11) NOT NULL,
  `ID_komentarza` int(11) NOT NULL,
  `ID_oceny` int(11) NOT NULL,
  `ID_opisu` int(11) NOT NULL,
  `ID_uzytkownika` int(11) NOT NULL,
  PRIMARY KEY (`ID_Posta`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ZDJECIA`
--

CREATE TABLE IF NOT EXISTS `ZDJECIA` (
  `ID_Zdjecia` int(11) NOT NULL AUTO_INCREMENT,
  `Nazwa` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `Foto` longblob NOT NULL,
  PRIMARY KEY (`ID_Zdjecia`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
