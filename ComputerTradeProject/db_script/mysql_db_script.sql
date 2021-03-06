DROP SCHEMA IF EXISTS `COMPUTER_TRADE`;

CREATE SCHEMA IF NOT EXISTS `COMPUTER_TRADE` CHARACTER SET `UTF8`;

USE `COMPUTER_TRADE`;

CREATE TABLE `FILE_INFO` (
`ID` integer not null primary key auto_increment,
`FILE_NAME` VARCHAR(255), 
`SIZE_KB` INTEGER(9), 
`UPLOAD_DATE` DATETIME,
-- `CREATED` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
`LAST_UPDATED` TIMESTAMP NOT NULL ON UPDATE CURRENT_TIMESTAMP
 );

CREATE TABLE `PRODUCT` (
`ID` integer not null primary key auto_increment,
`ARTICLE_CODE` INTEGER(11) NOT NULL UNIQUE, 
`ARTICLE` TEXT, 
`PRICE` INTEGER(7), 
`UPLOAD_DATE` DATETIME, 
`STATUS` VARCHAR(255) DEFAULT 'AVAILABLE'
);

CREATE TABLE `CAR` (
`ID` integer not null primary key auto_increment,
`PAGE_CODE` INTEGER(11) NOT NULL UNIQUE, 
`ARTICLE` TEXT default NULL, 
`PRICE_BYN` DOUBLE default null, 
`PRICE_EUR` INTEGER(7) default null, 
`YEAR` INTEGER(4) DEFAULT null,
`STATUS` VARCHAR(255) DEFAULT 'AVAILABLE'
);
