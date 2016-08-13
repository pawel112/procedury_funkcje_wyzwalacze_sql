/*
Zadanie 3 - Przygotuj funkcję, która usunie z bazy konta nie używane przez 30 dni
*/

/*
przygotowanie bazy danych do wykonania ćwiczenia
*/

CREATE DATABASE IF NOT EXISTS userManage;
USE userManage;

DROP TABLE IF EXISTS Autoryzacja;

CREATE TABLE IF NOT EXISTS Autoryzacja(
	idUzytkownika INT PRIMARY KEY AUTO_INCREMENT,
	login VARCHAR(50) NOT NULL,
	password VARCHAR(64) NOT NULL,
	liczbaNieudanychProb SMALLINT,
	czasOstatniegoLogowania DATE,
	kontoZablokowane BOOLEAN
);

INSERT INTO Autoryzacja SELECT NULL, "jkowalski", SHA2('pies', 256), 4, '2016-03-01', TRUE;
INSERT INTO Autoryzacja SELECT NULL, "mnowak", SHA2('kot', 256), 1, '2015-03-01', FALSE;
INSERT INTO Autoryzacja SELECT NULL, "kzablocki", SHA2('ptak', 256), 5, '2016-02-27', TRUE;
INSERT INTO Autoryzacja SELECT NULL, "lhostman", SHA2('ryba', 256), 1, '2016-02-24', FALSE;


/* Rozwiązanie */
delimiter //

CREATE FUNCTION `Zadanie8`()
RETURNS BOOLEAN
BEGIN
DELETE FROM `Autoryzacja` WHERE TIMESTAMPDIFF(DAY,`czasOstatniegoLogowania`, CURDATE()) > 30;
RETURN TRUE;
END//