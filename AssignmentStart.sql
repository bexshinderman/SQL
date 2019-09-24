--EXECUTED 1



Create table Contact (
ContactID int identity not null,
ContactName varchar (100) not null,
ContactPhone varchar (30) not null,
ContactFax varchar (100),
ContactMobilePhone varchar (30),
ContactEmail varchar (100),
ContactWWW varchar (200),
ContactPostalAddress varchar (500) not null,

constraint PK_Contact
primary key (ContactID)



);

--drop table Contact;

--drop table Supplier;
--executed 2nd
Create table Supplier (
SupplierID int,
SupplierGST int not null,

constraint PK_Supplier
primary key (SupplierID),

constraint FK_Supplier
foreign key (SupplierID) references Contact (ContactID)
on delete no action
on update cascade
 
 );


create table Category --3rd
(
CategoryID int identity(2000,20),
CategoryName varchar(100) not null,

constraint PK_Category
primary key (CategoryID)
); --exists

--drop table Component executed 4th

create table Component (
ComponentID int identity(1,1) not null,
ComponentName varchar(200) not null,
ComponentDescription varchar(500) not null,
TradePrice money not null,
ListPrice money not null,
TimeToFit decimal(20,4) not null,
CategoryID int ,
SupplierID int,

constraint PK_Component
primary key(ComponentID),

constraint FK_component_CategoryID
foreign key (CategoryID) references Category (CategoryID)
on delete cascade
on update cascade,

constraint FK_component_SupplierID
foreign key (SupplierID) references Supplier (SupplierID)
on delete no action
on update cascade
);

--drop table Category;



--drop table AssemblySubcomponent

create table AssemblySubcomponent (
AssemblyID int not null,
SubcomponentID int  not null,
Quantity decimal(18,4) not null

constraint DF_Assemblysub_Quantity
default 0,

constraint primarykey_AssemblySubcomponent
primary key (AssemblyID, SubcomponentID),

constraint AssemblySubComponent_Components_Different
	check (AssemblyID != SubcomponentID),
constraint AssemblySubcomponent_greaterthan0
	check (Quantity >= 0),

constraint FK_AssemblyComponent_Assembly
foreign key (AssemblyID)
references Component (ComponentID),
--on update cascade 
--on delete no action

constraint FK_AssemblySubcomponent_Subcomponent
foreign key (SubcomponentID)
references Component (ComponentID)
--on update cascade
--on delete no action

); --requires component table

--drop table Customer;
create table Customer (
CustomerID int not null

constraint PK_Customer
primary key(CustomerID),

constraint FK_CustomerID
foreign key (CustomerID) references Contact (ContactID)
on delete cascade
on update cascade

); --requires Qoute table 
--drop table Qoute;

create table Qoute (
QouteID int identity not null,
QouteDescription varchar(500) not null,
QouteDate date not null,
QoutePrice money,
QouteCompiler varchar(100) not null,
CustomerID int not null,

constraint PK_Qoute
primary key (QouteID),

constraint FK_Qoute
foreign key (CustomerID) references Customer (CustomerID)
on delete no action
on update cascade 

); --requires Customer table

--drop table QouteComponent
create table QouteComponent (
ComponentID int not null,
QouteID int not null ,
Quantity int not null,
TradePrice money not null,
ListPrice money not null,
TimeToFit decimal not null,

constraint PK_QouteComponent
primary key (ComponentID, QouteID),

constraint FK_QouteComponent_ComponentID
foreign key (ComponentID) references Component (ComponentID),
--on delete no action
--on update cascade

constraint FK_QouteComponent_QouteID
foreign key (QouteID) references Qoute (QouteID)
--on delete cascade
--on update cascade
); --requires component
--drop table QouteComponent




