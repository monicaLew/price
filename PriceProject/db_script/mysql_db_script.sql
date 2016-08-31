DROP SCHEMA IF EXISTS `PC_TRADE`;

CREATE SCHEMA IF NOT EXISTS `PC_TRADE` CHARACTER SET `UTF8`;

USE `PC_TRADE`;

CREATE TABLE `FILE_INFO` (
`ID` integer not null primary key auto_increment,
`FILE_NAME` VARCHAR(255), 
`SIZE_KB` INTEGER(9), 
`UPLOAD_DATE` DATETIME,
`CREATED` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
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



