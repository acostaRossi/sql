

DROP DATABASE IF EXISTS biblioteca_2;
CREATE DATABASE biblioteca_2;
USE biblioteca_2;

CREATE TABLE `utenti` (
	`nome` varchar(50) NOT NULL,
	`cognome` varchar(50) NOT NULL,
	`codicefiscale` varchar(20) NOT NULL,
	`datanascita` date NOT NULL,
	PRIMARY KEY (`codicefiscale`)
);

CREATE TABLE `autori` (
	`nome` varchar(30) NOT NULL,
	`cognome` varchar(30) NOT NULL,
	`nazione` varchar(30) NOT NULL,
	PRIMARY KEY (`nome`, `cognome`, `nazione`),
	INDEX(`nome`),
	INDEX (`cognome`),
	INDEX (`nazione`)
);

CREATE TABLE `libri` (
	`isbn` varchar(50) NOT NULL,
	`titolo` varchar(20) NOT NULL,
	`autore_nome` varchar(30) NOT NULL,
	`autore_cognome` varchar(30) NOT NULL,
	`autore_nazione` varchar(30) NOT NULL,
	PRIMARY KEY (`isbn`)
);

CREATE TABLE `prenotazioni` (
 	`utente` varchar(50) NOT NULL,
	`libro` varchar(50) NOT NULL,
	`datainizio` timestamp DEFAULT current_timestamp(),
	`datafine` timestamp NULL DEFAULT NULL,
	PRIMARY KEY (`utente`, `libro`, `datainizio`)
);

ALTER TABLE `prenotazioni`
	ADD CONSTRAINT `prenotazione_utente`
	FOREIGN KEY (`utente`)
	REFERENCES `utenti`(`codicefiscale`)
	ON DELETE RESTRICT
	ON UPDATE RESTRICT;

ALTER TABLE `prenotazioni`
	ADD CONSTRAINT `prenotazione_libro`
	FOREIGN KEY (`libro`)
	REFERENCES `libri`(`isbn`)
	ON DELETE RESTRICT
	ON UPDATE RESTRICT;

ALTER TABLE `libri` 
	ADD CONSTRAINT `libro_autore`
	FOREIGN KEY (`autore_cognome`, `autore_nome`, `autore_nazione`)
	REFERENCES `autori`(`cognome`, `nome`, `nazione`)
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

INSERT INTO `libri` (`isbn`, `titolo`,  `autore_nome`, `autore_cognome`, `autore_nazione`) 
	VALUES ('1111111', 'Il fanciullino', 'Giovanni', 'Pascoli', 'Italia');
INSERT INTO `libri` (`isbn`, `titolo`,  `autore_nome`, `autore_cognome`, `autore_nazione`) 
	VALUES ('2222222', 'Trieste', 'Ugo', 'Foscolo', 'Italia');
INSERT INTO `libri` (`isbn`, `titolo`,  `autore_nome`, `autore_cognome`, `autore_nazione`) 
	VALUES ('3333333', 'Amleto', 'William', 'Shakespeare', 'Inghilterra');
INSERT INTO `libri` (`isbn`, `titolo`,  `autore_nome`, `autore_cognome`, `autore_nazione`) 
	VALUES ('4444444', 'Otello', 'William', 'Shakespeare', 'Inghilterra');
INSERT INTO `libri` (`isbn`, `titolo`,  `autore_nome`, `autore_cognome`, `autore_nazione`) 
	VALUES ('5555555', 'Le Odi', 'Ugo', 'Foscolo', 'Italia');
INSERT INTO `libri` (`isbn`, `titolo`,  `autore_nome`, `autore_cognome`, `autore_nazione`) 
	VALUES ('6666666', 'La Tempesta', 'William', 'Shakespeare', 'Inghilterra');
INSERT INTO `libri` (`isbn`, `titolo`,  `autore_nome`, `autore_cognome`, `autore_nazione`) 
	VALUES ('7777777', 'Compagno di sbronza', 'Charles', 'Bukowski', 'Stati Uniti');

INSERT INTO `utenti` (`nome`, `cognome`, `codicefiscale`, `datanascita`) 
	VALUES ('Alberto', 'Costa', 'cstffdr837cn', '1993-04-08');
INSERT INTO `utenti` (`nome`, `cognome`, `codicefiscale`, `datanascita`) 
	VALUES ('Giulio', 'Verdi', 'gvgvgvgv33', '1985-09-09');
INSERT INTO `utenti` (`nome`, `cognome`, `codicefiscale`, `datanascita`) 
	VALUES ('Maria', 'Rossi', 'mrmrmrmr44', '1999-04-13');
INSERT INTO `utenti` (`nome`, `cognome`, `codicefiscale`, `datanascita`) 
	VALUES ('Giorgio', 'Neri', 'gngngngn55', '2005-03-30');

INSERT INTO `prenotazioni` (`utente`, `libro`, `datainizio`, `datafine`) 
	VALUES ('cstffdr837cn', '1111111', '2019-03-12', '2019-04-10');
INSERT INTO `prenotazioni` (`utente`, `libro`, `datainizio`, `datafine`) 
	VALUES ('gvgvgvgv33', '2222222', '2019-04-01', '2019-05-21');
INSERT INTO `prenotazioni` (`utente`, `libro`, `datainizio`, `datafine`) 
	VALUES ('mrmrmrmr44', '4444444', '2019-04-22', NULL);
INSERT INTO `prenotazioni` (`utente`, `libro`, `datainizio`, `datafine`) 
	VALUES ('gvgvgvgv33', '2222222', '2020-12-10', '2021-01-15');
INSERT INTO `prenotazioni` (`utente`, `libro`, `datainizio`, `datafine`) 
	VALUES ('mrmrmrmr44', '1111111', '2021-03-10', NULL);
INSERT INTO `prenotazioni` (`utente`, `libro`, `datainizio`, `datafine`) 
	VALUES ('mrmrmrmr44', '4444444', '2022-04-08', '2022-05-01');
INSERT INTO `prenotazioni` (`utente`, `libro`, `datainizio`, `datafine`) 
	VALUES ('mrmrmrmr44', '4444444', '2022-05-08', NULL);












