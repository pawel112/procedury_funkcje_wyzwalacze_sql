/*
Zadanie 6 - Przygotuj procedurę, która zliczy książki z wybranej kategorii.
*/

/*
przygotowanie bazy danych do wykonania ćwiczenia
*/

CREATE DATABASE IF NOT EXISTS mojaKsiegarnia;
USE mojaKsiegarnia;

CREATE TABLE Ksiazka (
  id_ksiazki int(11) NOT NULL,
  tytul varchar(255) NOT NULL,
  cena decimal(19,4) DEFAULT NULL,
  kategoria varchar(100) DEFAULT NULL
);

INSERT INTO Ksiazka values 
(NULL, "MySQL. Vademecum profesjonalisty. Wydanie V", 119.20, "informatyka"), 
(NULL, "Zapytania w SQL. Przyjazny przewodnik", 79.20, "informatyka"), 
(NULL, "PHP i MySQL. Rozmówki", 23.94, "informatyka");

/* Rozwiązanie */
delimiter //

CREATE PROCEDURE `Zadanie4`(IN `kategoria_n` VARCHAR(100))
BEGIN
SELECT count(`kategoria`) FROM `Ksiazka` WHERE `kategoria`=`kategoria_n`;
END//