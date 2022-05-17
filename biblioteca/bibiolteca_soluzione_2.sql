
DROP DATABASE IF EXISTS biblioteca_con_id;
CREATE DATABASE biblioteca_con_id;
USE biblioteca_con_id;

CREATE TABLE `utenti` (
	`id` int AUTO_INCREMENT NOT NULL,
	`nome` varchar(50) NOT NULL,
	`cognome` varchar(50) NOT NULL,
	`codicefiscale` varchar(20) NOT NULL,
	`datanascita` date NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `autori` (
	`id` int AUTO_INCREMENT NOT NULL,
	`nome` varchar(30) NOT NULL,
	`cognome` varchar(30) NOT NULL,
	`nazione` varchar(30) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `libri` (
	`id` int AUTO_INCREMENT NOT NULL,
	`isbn` varchar(50) NOT NULL,
	`titolo` varchar(20) NOT NULL,
	`autore` int not null,
	PRIMARY KEY (`id`)
);

CREATE TABLE `prenotazioni` (
	`id` int AUTO_INCREMENT NOT NULL,
 	`utente` int NOT NULL,
	`libro` int NOT NULL,
	`datainizio` timestamp DEFAULT current_timestamp(),
	`datafine` timestamp NULL DEFAULT NULL,
	PRIMARY KEY (`id`)
);

ALTER TABLE `prenotazioni`
	ADD CONSTRAINT `prenotazione_utente`
	FOREIGN KEY (`utente`)
	REFERENCES `utenti`(`id`)
	ON DELETE RESTRICT
	ON UPDATE RESTRICT;

ALTER TABLE `prenotazioni`
	ADD CONSTRAINT `prenotazione_libro`
	FOREIGN KEY (`libro`)
	REFERENCES `libri`(`id`)
	ON DELETE RESTRICT
	ON UPDATE RESTRICT;

ALTER TABLE `libri` 
	ADD CONSTRAINT `libro_autore`
	FOREIGN KEY (`autore`)
	REFERENCES `autori`(`id`)
	ON DELETE RESTRICT 
	ON UPDATE RESTRICT;

INSERT INTO `autori` (`nome`, `cognome`, `nazione`) 
	VALUES ('Giovanni', 'Pascoli', 'Italia');
INSERT INTO `autori` (`nome`, `cognome`, `nazione`) 
	VALUES ('Ugo', 'Foscolo', 'Italia');
INSERT INTO `autori` (`nome`, `cognome`, `nazione`) 
	VALUES ('William', 'Shakespeare', 'Inghilterra');
INSERT INTO `autori` (`nome`, `cognome`, `nazione`) 
	VALUES ('Thomas', 'Mann', 'Germania');
INSERT INTO `autori` (`nome`, `cognome`, `nazione`) 
	VALUES ('Charles', 'Bukowski', 'Stati Uniti');

INSERT INTO `libri` (`isbn`, `titolo`,  `autore`) 
	VALUES ('1111111', 'Il fanciullino', 1);
INSERT INTO `libri` (`isbn`, `titolo`,  `autore`) 
	VALUES ('2222222', 'Trieste', 2);
INSERT INTO `libri` (`isbn`, `titolo`,  `autore`) 
	VALUES ('3333333', 'Amleto', 3);
INSERT INTO `libri` (`isbn`, `titolo`,  `autore`) 
	VALUES ('4444444', 'Otello', 3);
INSERT INTO `libri` (`isbn`, `titolo`,  `autore`) 
	VALUES ('5555555', 'Le Odi', 2);
INSERT INTO `libri` (`isbn`, `titolo`,  `autore`) 
	VALUES ('6666666', 'La Tempesta', 3);
INSERT INTO `libri` (`isbn`, `titolo`,  `autore`) 
	VALUES ('7777777', 'Compagno di sbronza', 5);

INSERT INTO `utenti` (`nome`, `cognome`, `codicefiscale`, `datanascita`) 
	VALUES ('Alberto', 'Costa', 'cstffdr837cn', '1993-04-08');
INSERT INTO `utenti` (`nome`, `cognome`, `codicefiscale`, `datanascita`) 
	VALUES ('Giulio', 'Verdi', 'gvgvgvgv33', '1985-09-09');
INSERT INTO `utenti` (`nome`, `cognome`, `codicefiscale`, `datanascita`) 
	VALUES ('Maria', 'Rossi', 'mrmrmrmr44', '1999-04-13');
INSERT INTO `utenti` (`nome`, `cognome`, `codicefiscale`, `datanascita`) 
	VALUES ('Giorgio', 'Neri', 'gngngngn55', '2005-03-30');

INSERT INTO `prenotazioni` (`utente`, `libro`, `datainizio`, `datafine`) 
	VALUES (1, 1, '2019-03-12', '2019-04-10');
INSERT INTO `prenotazioni` (`utente`, `libro`, `datainizio`, `datafine`) 
	VALUES (2, 2, '2019-04-01', '2019-05-21');
INSERT INTO `prenotazioni` (`utente`, `libro`, `datainizio`, `datafine`) 
	VALUES (3, 4, '2019-04-22', NULL);
INSERT INTO `prenotazioni` (`utente`, `libro`, `datainizio`, `datafine`) 
	VALUES (2, 2, '2020-12-10', '2021-01-15');
INSERT INTO `prenotazioni` (`utente`, `libro`, `datainizio`, `datafine`) 
	VALUES (3, 1, '2021-03-10', NULL);
INSERT INTO `prenotazioni` (`utente`, `libro`, `datainizio`, `datafine`) 
	VALUES (3, 4, '2022-04-08', '2022-05-01');
INSERT INTO `prenotazioni` (`utente`, `libro`, `datainizio`, `datafine`) 
	VALUES (3, 4, '2022-05-08', NULL);












