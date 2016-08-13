/*
Zadanie 5 - Przygotuj procedurę, która określi przedział cenowy książki w zależności od jej ceny.
*/

/*
przygotowanie bazy danych do wykonania ćwiczenia
*/

CREATE DATABASE IF NOT EXISTS mojaKsiegarnia;
USE mojaKsiegarnia;

CREATE TABLE Ksiazka (
  id_ksiazki int primary key auto_increment NOT NULL,
  tytul varchar(255) NOT NULL,
  cena decimal(8,2) DEFAULT NULL,
  kategoria varchar(100) DEFAULT NULL
);

INSERT INTO Ksiazka values 
(NULL, "MySQL. Vademecum profesjonalisty. Wydanie V", 119.20, "informatyka"), 
(NULL, "Zapytania w SQL. Przyjazny przewodnik", 79.20, "informatyka"), 
(NULL, "PHP i MySQL. Rozmówki", 23.94, "informatyka");

/* Rozwiązanie */
delimiter //

CREATE PROCEDURE `Zadanie5`(IN `cena_n` INT, IN `przedzial` INT)
BEGIN
SELECT FLOOR((`cena_n`+`przedzial`)/`przedzial`)*`przedzial`, FLOOR(((`cena_n`-`przedzial`)/`przedzial`)+1)*`przedzial`;
END//
