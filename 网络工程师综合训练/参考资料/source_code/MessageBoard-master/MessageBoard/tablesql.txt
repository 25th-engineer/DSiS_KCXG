用户信息表pinfo
create table pinfo (id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
username varchar(30) NOT NULL,
password varchar(10) NOT NULL,
name varchar(30) NOT NULL,
regtime TIMESTAMP
);


消息表message
creat table message (id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
receiver varchar(30) NOT NULL,
sender varchar(30) NOT NULL,
content varchar(200) NOT NULL,
sendtime TIMESTAMP
);
