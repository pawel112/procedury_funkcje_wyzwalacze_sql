/*
Zadanie 4 - Przygotuj funkcję, która sprawdzi czy podane konto jest zablokowane
*/

/*
przygotowanie bazy danych do wykonania ćwiczenia
*/

CREATE DATABASE IF NOT EXISTS adminPanel;
USE adminPanel;
DROP TABLE IF EXISTS Autoryzacja;
CREATE TABLE IF NOT EXISTS Autoryzacja(
	idUzytkownika INT PRIMARY KEY AUTO_INCREMENT,
	login VARCHAR(50) NOT NULL,
	password VARCHAR(64) NOT NULL,
	liczbaNieudanychProb SMALLINT,
	czasOstatniegoLogowania TIMESTAMP,
	kontoZablokowane BOOLEAN
);

INSERT INTO Autoryzacja SELECT NULL, "jkowalski", SHA2('pies', 256), 4, NULL, TRUE;
INSERT INTO Autoryzacja SELECT NULL, "mnowak", SHA2('kot', 256), 1, NULL, FALSE;
INSERT INTO Autoryzacja SELECT NULL, "kzablocki", SHA2('ptak', 256), 5, NULL, TRUE;
INSERT INTO Autoryzacja SELECT NULL, "lhostman", SHA2('ryba', 256), 1, NULL, FALSE;


/* Rozwiązanie */
delimiter //

CREATE FUNCTION `Zadanie6`(`login_n` VARCHAR(50))
RETURNS BOOLEAN
BEGIN
DECLARE `czyKontoZablokowane` BOOLEAN;
SELECT `kontoZablokowane` INTO `czyKontoZablokowane` FROM `Autoryzacja` WHERE `login`=`login_n`;
RETURN `czyKontoZablokowane`;
END//