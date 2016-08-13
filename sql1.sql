/*
Zadanie 1 - Przygotuj wyzwalacz, który zablokuje konto użytkownika, gdy liczba nieudanych prób logowania przekroczy 3.
*/

/*
przygotowanie bazy danych do wykonania ćwiczenia
*/

CREATE DATABASE IF NOT EXISTS mojaAplikacja;
USE mojaAplikacja;
CREATE TABLE IF NOT EXISTS Autoryzacja(
	idUzytkownika INT PRIMARY KEY AUTO_INCREMENT,
	login VARCHAR(50) NOT NULL,
	password VARCHAR(64) NOT NULL,
	liczbaNieudanychProb SMALLINT,
	czasOstatniegoLogowania TIMESTAMP,
	kontoZablokowane BOOLEAN
);

INSERT INTO Autoryzacja SELECT NULL, "jkowalski", SHA2('pies', 256), 1, NULL, FALSE;
INSERT INTO Autoryzacja SELECT NULL, "mnowak", SHA2('kot', 256), 1, NULL, FALSE;
INSERT INTO Autoryzacja SELECT NULL, "kzablocki", SHA2('ptak', 256), 1, NULL, FALSE;
INSERT INTO Autoryzacja SELECT NULL, "lhostman", SHA2('ryba', 256), 1, NULL, FALSE;


/* Rozwiązanie */
delimiter //

CREATE TRIGGER Zadanie1 BEFORE UPDATE ON Autoryzacja
FOR EACH ROW
IF NEW.`liczbaNieudanychProb` > 3 THEN
SET NEW.`kontoZablokowane` = 1;
END IF;//


