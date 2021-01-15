create database myDemo;
SET FOREIGN_KEY_CHECKS=0;

use myDemo;
CREATE TABLE PERSON(
  username varchar(25) NOT NULL,
  password varchar(25) NOT NULL,
  PRIMARY KEY (username)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE MSG(
  user varchar(25) NOT NULL,
  title varchar(225) DEFAULT NULL,
  author varchar(25) DEFAULT NULL,
  ip varchar(25) DEFAULT NULL,
  content varchar(225) DEFAULT NULL,
  time time DEFAULT NULL,
  KEY user (user),
  CONSTRAINT MSG_ibfk_1 FOREIGN KEY (user) REFERENCES PERSON (username) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
