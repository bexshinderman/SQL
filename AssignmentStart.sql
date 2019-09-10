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

drop table Component

create table Component (
ComponentID int primary key identity,
ComponentName varchar(200),
ComponentDescription varchar(500),
TradePrice money,
ListPrice money,
TimeToFit varchar(50),
CategoryID int foreign key references Contact(ContactID),
SupplierID int foreign key references Supplier(SupplierID)
on update cascade
on delete cascade
);

create table Category (
CategoryID int primary key identity,
CategoryName varchar(100)
);

drop table AssemblySubcomponent

create table AssemblySubcomponent (
AssemblyID int not null,
SubcomponentID int not null,
Quantity decimal(18,4) not null
constraint DF_Assemblusub_Quantity
default 0,

constraint PK_AssemblySubcomponent
primary key (AssemblyID, SubcomponentID),

constraint CK_AssemblySubComponent_Components_Different
	check (AssemblyID != SubcomponentID),
constraint CK_AssemblySubcomponent_Qauntity
	check (Quantity >= 0),

constraint FK_AssemblyComponent_Assembly
foreign key (AssemblyID)
references Component (ComponentID),
-- on update cascade 
-- on delete no action,

constraint FK_AssemblySubcomponent_Subcomponent
foreign key (SubcomponentID)
references Component (ComponentID)
-- on update cascade
-- on delete no action

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

drop table QouteComponent
create table QouteComponent (
ComponentID int foreign key references Component(ComponentID),
QouteID int foreign key references Qoute(QouteID),
Quantity int,
TradePrice money,
ListPrice money,
TimeToFit time 
);





