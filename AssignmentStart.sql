Create table Contact (
ContactID int primary key identity(1,1),
ContactName varchar (100) not null,
ContactPhone varchar (30),
ContactFax varchar (100),
ContactMobilePhone varchar (30),
ContactEmail varchar (100),
ContactWWW varchar (200),
ContactPostalAddress varchar (500) not null

);

Create table Supplier (
SupplierID int primary key identity,
SupplierGST int );

create table Component (
ComponentID int primary key identity,
ComponentName varchar(200),
ComponentDescription varchar(500),
TradePrice money,
ListPrice money,
TimeToFit varchar(50),
CategoryID int foreign key references Contact(ContactID),
SupplierID int foreign key references Supplier(SupplierID)
);

create table Category (
CategoryID int primary key identity,
CategoryName varchar(100)
);

create table AssemblySubcomponent (
AssemblyID int primary key identity not null,
SubcomponentID int not null,
Quantity int not null
);

create table Customer (
CustomerID int primary key identity not null );

create table Qoute (
QouteID int primary key identity,
QouteDescription varchar(500),
QouteDate date,
QoutePrice money not null,
QouteCompiler varchar(100),
CustomerID int foreign key references Customer(CustomerID)
);

create table QouteComponent (
ComponentID int foreign key references Component(ComponentID),
QouteID int foreign key references Qoute(QouteID),
Quantity int,
TradePrice money,
ListPrice money,
TimeToFit time 
);





