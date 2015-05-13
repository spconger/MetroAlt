Use master
Go
if exists
    (Select name from sys.databases where name='MetroAlt')
Begin
Drop Database MetroAlt
End
Go
Create Database MetroAlt
Go
Use MetroAlt
Go
Create Table PayRate
(
	Payratekey int identity (1,1) primary key,
	PayRateHourly decimal(4,2) not null
)
GO

Create table Employee
(
	EmployeeKey int identity(1,1) primary key,
	EmployeeLastName nvarchar(255) not null,
	EmployeeFirstName nvarchar(255),
	EmployeeAddress nvarchar(255) not null,
	EmployeeCity nvarchar(255) not null,
	EmployeeZipCode nchar(5) not null,
	EmployeePhone nchar(10),
	EmployeeEmail nvarchar(255) not null,
	EmployeeHireDate Date not null,
	PayRateKey int foreign key references Payrate(PayrateKey)
)
Go
Create table Position
(
   PositionKey int identity (1,1) primary key,
   PositionName Nvarchar(255) not null,
   PositionDescription Nvarchar(255)
)

Go


Create table EmployeePosition
(
    EmployeeKey int not null foreign Key references Employee(EmployeeKey),
	PositionKey int not null foreign key references Position(PositionKey),
	Constraint EmployeePosition_PK primary key(EmployeeKey, PositionKey),
	EmployeePositionDateAssigned Date not null
)

Go

Create table BusBarn
(
   BusBarnKey int identity(1,1) primary key,
   BusBarnAddress nvarchar(255) not null,
   BusBarnCity nvarchar (255) not null,
   BusBarnZipCode nchar(5) not null,
   BusBarnPhone nchar(10) not null
)

Go

Create table Bustype
(
	BusTypeKey int identity(1,1) primary Key,
	BusTypeDescription nvarchar (255),
	BusTypeCapacity int,
	BusTypePurchasePrice Decimal(10,2),
	BusTypeEstimatedMPG decimal(4,2)
)

Create table Bus
(
    BusKey int identity (1,1) primary key,
	BusTypekey int foreign key references BusType(BusTypeKey),
	BusBarnKey int foreign key references BusBarn(BusBarnKey),
	BusPurchaseDate Date 
	
)

Go
Create table BusRoute
(
    BusRouteKey int identity(1,1) primary Key
)

go

Create table BusStop
(
    BusStopKey int identity (1,1) primary key,
	BusStopAddress Nvarchar(255) not null,
	BusStopCity Nvarchar(255) not null,
	BusStopZipcode Nchar(5) not null
)

Go

Create table BusRouteStopSchedule
(
   BusRouteStopKey int identity(1,1) primary Key,
	BusRouteKey int foreign key references BusRoute(BusRouteKey),
	BusStopKey int foreign key references BusStop(BusStopKey),
	BusRouteStopTime Time not null
)

Create Table BusDriverShift
(
	BusDriverShiftKey int identity(1,1) primary key,
	BusDriverShiftName nvarchar(255),
	BusDriverShiftStartTime time not null,
	BusDriverShiftStopTime time not null

)

Go

Create Table BusScheduleAssignment
(
    BusScheduleAssignmentKey int identity(1,1) primary key,
	BusDriverShiftKey int foreign key references BusDriverShift(BusDriverShiftKey),
	EmployeeKey int foreign Key references Employee (EmployeeKey),
	BusRouteKey int Foreign Key references BusRoute(BusRouteKey),
	BusScheduleAssignmentDate date not null
)

Go

Create Table Ridership
(
    RidershipKey int identity (1,1) primary key,
	BusScheduleAssigmentKey int foreign key references BusScheduleAssignment(BusScheduleAssignmentKey),
	Riders int
)



