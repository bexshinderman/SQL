CREATE TABLE [Staff].[tblStaffDetails]
 (
	[StaffID] int identity(1,1) PRIMARY KEY,
	[Firstname] nvarchar(100) NOT NULL,
	[Lastname] nvarchar(100) NOT NULL
	)
INSERT INTO Staff.tblStaffDetails(Firstname, Lastname) VALUES
('mICHAEL', 'hARRINGTON'),
('Paul', 'Simons'),
('Dave', 'Stern')

CREATE TABLE [Sales].[tblCarDetails]
(
[carID] int identity(1,1) PRIMARY KEY,
[VINNumber] nvarchar(255) NOT NULL,
[NumberOfDoors] nvarchar(10) NOT NULL

)
Insert into Sales.tblCarDetails(VINNumber, NumberOFDoors) VALUES
('00001AB', '4'),
('00007AS', '3'),
('00006AT', '3'),
('00004AY', '4'),
('00002AJ', '1')

CREATE TABLE [Maintenance].[tblBuildingMaintenance]
(
[Maintenance] int identity(1,1) PRIMARY KEY,
[BuildingID] int NOT NUll,
[Fault] nvarchar(500) NOT NULL

)

INSERT INTO Maintenance.TblBuildingMaintenance(BuildingID, Fault) VALUES
('1', 'Blown light'),
('2', 'Broken door'),
('3', 'Busted window'),
('4', 'Busted lock')

		
