CREATE SCHEMA IF NOT EXISTS CC00770xBlog DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ;

USE CC00770xBlog;
CREATE TABLE IF NOT EXISTS USERS (
username VARCHAR(100) NOT NULL,
userpassword VARCHAR(100) NOT NULL,
PRIMARY KEY (username))
COLLATE='utf8_bin'
ENGINE=InnoDB;

USE CC00770xBlog;
CREATE TABLE IF NOT EXISTS POSTS (
id INT NOT NULL AUTO_INCREMENT,
title VARCHAR(255) NOT NULL,
descript VARCHAR(255) NOT NULL,
content MEDIUMTEXT NOT NULL,
publictime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
author VARCHAR(255) NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY (author) REFERENCES USERS(username))
COLLATE='utf8_bin'
ENGINE=InnoDB;

ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '1234'
