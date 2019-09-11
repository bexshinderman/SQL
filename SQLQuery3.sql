Create table Contact (
ContactID integer(5) not null auto_increment,
ContactName varchar(100) not null,
ContactPhone varchar(30),
ContactFax varchar(100),
ContactMobilePhone varchar(30),
ContactEmail varchar(100),
ContactWWW varchar(200),
ContactPostalAddress varchar(500) not null,
primary key (ContactID)

);