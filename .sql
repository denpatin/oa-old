CREATE DATABASE IF NOT EXISTS `oa` CHARACTER SET utf8 COLLATE utf8_general_ci;

USE `oa`;

CREATE TABLE IF NOT EXISTS `author` (
   `authorID` TINYINT UNSIGNED AUTO_INCREMENT,
   `authorName` VARCHAR(50) NOT NULL,
   PRIMARY KEY (`authorID`)
) CHARACTER SET=UTF8;

CREATE TABLE IF NOT EXISTS `city` (
    `cityID` TINYINT UNSIGNED AUTO_INCREMENT,
    `cityName` VARCHAR(30),
	PRIMARY KEY (`cityID`)
) CHARACTER SET=UTF8;

CREATE TABLE IF NOT EXISTS `event` (
    `eventID` INT UNSIGNED AUTO_INCREMENT,
    `eventTitle` VARCHAR(100) NOT NULL,
    `eventOccurs` DATETIME,
    `eventCityID` TINYINT UNSIGNED,
    `eventPlace` VARCHAR(200),
    `eventDescBold` TEXT,
    `eventDescMain` MEDIUMTEXT,
    `eventRegNum` MEDIUMINT UNSIGNED,
    PRIMARY KEY (`eventID`),
    FOREIGN KEY (`eventCityID`) REFERENCES `city`(`cityID`)
) CHARACTER SET=UTF8;

CREATE TABLE IF NOT EXISTS `go` (
    `goID` INT AUTO_INCREMENT,
    `goEventID` INT UNSIGNED,
    `goAuthorID` TINYINT UNSIGNED,
    PRIMARY KEY (`goID`),
    FOREIGN KEY (`goEventID`) REFERENCES `event`(`eventID`),
    FOREIGN KEY (`goAuthorID`) REFERENCES `author`(`authorID`)
) CHARACTER SET=UTF8;

INSERT INTO `city`(`cityName`) VALUES ('Москва');
INSERT INTO `city`(`cityName`) VALUES ('Дзержинск');
INSERT INTO `city`(`cityName`) VALUES ('Санкт-Петербург');
INSERT INTO `author`(`authorName`) VALUES ('Алексей Чернореченский');
INSERT INTO `author`(`authorName`) VALUES ('Дмитрий Курылёв');
INSERT INTO `author`(`authorName`) VALUES ('Даша Демичева');
INSERT INTO `author`(`authorName`) VALUES ('Артём Филатоф');
INSERT INTO `author`(`authorName`) VALUES ('Антон Макаренков');