use Event_Ticketing_System;
--Customer Table
create table Customer(
CustomerId int PRIMARY KEY,
Name varchar(50) not null ,
Email varchar(100) not null unique,
Address varchar(100) not null,
DateOfBirth date,
RegistrationDate DATETIME default CURRENT_TIMESTAMP
)
--Customer_PhoneNumber Table
create table Customer_PhoneNumber(
CustomerId int ,
phoneNumber varchar(50),
PRIMARY KEY (CustomerId, PhoneNumber),
FOREIGN KEY (CustomerId) References Customer(CustomerId)
)
-- EventOrganizer Table
create table EventOrganizer(
OrganizerId int PRIMARY KEY,
OrganizationName varchar(100) not null,
ContactInfo varchar(50) not null
)
--EventOrganizer_Area Table
create table EventOrganizer_Area(
OrganizerId int,
SpecializationArea varchar(100),
PRIMARY KEY(OrganizerId, SpecializationArea),
FOREIGN KEY (OrganizerId) references EventOrganizer(OrganizerId)
)
--Venue Table
create table Venue(
VenueId int PRIMARY KEY,
Name varchar(50) not null ,
Address varchar(100) not null,
City varchar(50) not null,
Capacity int not null,
FacilityType varchar(50) check (FacilityType IN ('indoor', 'outdoor', 'hybrid')) NOT NULL
)
--Event Table
create table Event(
EventId int PRIMARY KEY,
Name varchar(50) not null,
Description varchar(100) ,
Category varchar(20) check (Category IN ('concert', 'theater', 'sports', 'conference', 'other')) NOT NULL,
StartDate_Time datetime,
EndDate_Time datetime,
Status varchar(20) check (Status IN ('upcoming', 'ongoing', 'completed', 'cancelled')) DEFAULT 'upcoming',
VenueId int ,
OrganizerId int,
FOREIGN KEY (VenueId) references Venue(VenueId),
FOREIGN KEY (OrganizerId) references EventOrganizer(OrganizerId)
)
--Ticket Table
create table Ticket(
TicketId int PRIMARY KEY,
Section varchar(50) not null,
Row varchar(50) not null,
SeatNumber int not null,
TicketType varchar(50) check (TicketType IN ('VIP', 'regular', 'student', 'senior')) DEFAULT 'regular',
Price float not null,
PurchaseDateTime datetime not null,
Status varchar(50) check (Status IN ('active', 'used', 'refunded', 'cancelled')) DEFAULT 'active',
EventId int,
CustomerId int,
FOREIGN KEY (EventId) references Event(EventId),
FOREIGN KEY (CustomerId) references Customer(CustomerId)
)