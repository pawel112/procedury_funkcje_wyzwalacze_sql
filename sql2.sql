/*
Zadanie 2 - Przygotuj wyzwalacz, który uniemożliwi wstawienie rekordu jeżeli wiek użytkownika nie przekracza 18 lat.
*/

/*
przygotowanie bazy danych do wykonania ćwiczenia
*/

CREATE DATABASE IF NOT EXISTS rejestracjaUzytkownika;
USE rejestracjaUzytkownika;

CREATE TABLE IF NOT EXISTS Uzytkownik(
	idUzytkownika INT PRIMARY KEY AUTO_INCREMENT,
	nazwisko VARCHAR(50) NOT NULL,
	imie VARCHAR(64) NOT NULL,
	dataUrodzenia Date
);


/* Rozwiązanie */
delimiter //

CREATE TRIGGER Zadanie2 AFTER INSERT ON Uzytkownik
FOR EACH ROW
IF TIMESTAMPDIFF(YEAR, NEW.`dataUrodzenia`, CURDATE()) < 18 THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Blad: osoba nie jest pelnoletnia.';
END IF;//