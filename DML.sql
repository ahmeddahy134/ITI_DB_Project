use Event_Ticketing_System 
----------- Insert Customer ------------
INSERT INTO Customer (CustomerId, Name, Email, Address, DateOfBirth)
VALUES 
(1, 'Ahmed Omar', 'ahmed.omar1@gmail.com', 'Cairo, Egypt', '1990-01-15'),
(2, 'Mohamed Ashraf', 'mohamed.ashraf2@gmail.com', 'sohag, Egypt', '1992-03-22'),
(3, 'Ahmed Hossam', 'ahmed.hossam3@gmail.com', 'sohag, Egypt', '1988-07-10'),
(4, 'Halem Medhat', 'halem.medhat4@gmail.com', 'Tanta, Egypt', '1995-09-18'),
(5, 'Youssef Ashraf', 'youssef.ashraf5@gmail.com', 'Mansoura, Egypt', '1991-12-05'),
(6, 'Mohamed Ali', 'mohamed.ali6@gmail.com', 'Zagazig, Egypt', '1993-05-09'),
(7, 'Ziad Mahran', 'ziad.mahran7@gmail.com', 'Cairo, Egypt', '1994-06-30'),
(8, 'Ahmed Adel', 'ahmed.adel8@gmail.com', 'Fayoum, Egypt', '1990-11-14'),
(9, 'Ahmed Elbolok', 'ahmed.elbolok9@gmail.com', 'Aswan, Egypt', '1989-08-25'),
(10, 'Ammar Yasser', 'ammar.yasser10@gmail.com', 'Luxor, Egypt', '1996-01-05'),
(11, 'Ziad Osman', 'ziad.osman11@gmail.com', 'Ismailia, Egypt', '1992-10-10'),
(12, 'Diaa Omar', 'diaa.omar12@gmail.com', 'Suez, Egypt', '1993-02-28'),
(13, 'Mohamed Sherif', 'mohamed.sherif13@gmail.com', 'Port Said, Egypt', '1987-04-17'),
(14, 'Youssef El Sherif', 'youssef.elsherif19@gmail.com', 'Qena, Egypt', '1996-08-08'),
(15, 'Ali Mohamed Ali', 'Ali.Mohamed15@gmail.com', 'Cairo, Egypt', '1988-09-19'),
(16, 'Youssef Mohamed', 'youssef.mohamed16@gmail.com', 'Beni Suef, Egypt', '1991-07-23'),
(17, 'Yassen Mohamed', 'yassen.mohamed17@gmail.com', 'Minya, Egypt', '1990-03-30'),
(18, 'Ahmed Dahy', 'ahmed.dahy18@gmail.com', 'Assiut, Egypt', '1994-05-11'),
(19, 'Ahmed Hashem', 'ahmed.hashem20@gmail.com', 'Sohag, Egypt', '1992-12-20'),
(20, 'Asmaa Galal', 'asmaa.galal14@gmail.com', 'Damietta, Egypt', '1995-06-01');

----------- Insert Customer_PhoneNumber ------------

INSERT INTO Customer_PhoneNumber (CustomerId, PhoneNumber)
VALUES
(1, '01000000001'),
(1, '01213141516'),
(2, '01100000002'),
(3, '01200000003'),
(4, '01500000004'),
(5, '01000000005'),
(6, '01100000006'),
(7, '01200000007'),
(8, '01500000008'),
(9, '01000000009'),
(10, '01100000010'), 
(11, '01200000011'),
(12, '01500000012'),
(13, '01000000013'),
(14, '01100000014'),
(15, '01200000015'), 
(16, '01500000016'),
(17, '01000000017'),
(18, '01100000018'), 
(19, '01200000019'), 
(20, '01500000020');

---------------- Insert Organizer ----------------------
insert into EventOrganizer (OrganizerId, OrganizationName, ContactInfo)
values
(1, 'Mercedes Egypt', 'contact@mercedes.eg'),
(2, 'Magic Tours', 'info@magictours.com'),
(3, 'Pizza Hut Egypt', 'marketing@pizzahut.eg'),
(4, 'X-Advert Agency', 'hello@xadvert.com'),
(5, 'ManCity Club Events', 'ManCity@events.com'),
(6, 'Cairo Opera House', 'info@opera.eg'),
(7, ' Khaldon Egypt', 'marketing@Khaldon.eg'),
(8, 'TechLink Expo', 'events@techlink.com'),
(9, 'Dream Park Events', 'contact@dreampark.com'),
(10, 'Al-Ahly Club Events', 'alahly@events.com');

------------------- Insert Area -------------------
insert into EventOrganizer_Area (OrganizerId, SpecializationArea)
values
(1, 'automotive'),         
(2, 'travel'),             
(3, 'food'),               
(5, 'sports'),             
(6, 'theater'),            
(8, 'technology');

------------------- Insert Venue -------------------

insert into venue (venueid, name, address, city, capacity, facilitytype)
values
(1, 'cairo international stadium', 'nasr city, cairo', 'cairo', 75000, 'outdoor'),
(2, 'opera house main hall', 'zamalek, cairo', 'cairo', 1200, 'indoor'),
(3, 'tech valley arena', 'smart village, 6th october', 'giza', 5000, 'hybrid'),
(4, 'hurghada convention center', 'village road, hurghada', 'hurghada', 3000, 'indoor'),
(5, 'borg el arab stadium', 'borg el arab, alexandria', 'alexandria', 80000, 'outdoor');

------------------- Insert Event -------------------

insert into event (EventId, Name, Description, Category, StartDate_Time, EndDate_Time, Status, VenueId, OrganizerId)
values 
(6, 'tech summit 2025', 'latest tech innovations and startups', 'conference', '2025-10-05 10:00:00', '2025-10-05 17:00:00', 'upcoming', 1, 8),
(7, 'amr diab live', 'concert by amr diab in cairo stadium', 'concert', '2025-09-15 19:00:00', '2025-09-15 22:30:00', 'upcoming', 1, 7),
(10, 'international auto expo', 'largest car exhibition in the middle east', 'conference', '2025-11-01 10:00:00', '2025-11-01 18:00:00', 'upcoming', 1, 1),
(11, 'electro music fest', 'a full day of live edm and dj sets', 'concert', '2025-11-15 16:00:00', '2025-11-15 23:00:00', 'upcoming', 1, 8),
(12, 'Cairo Food Festival', 'Taste cuisines from around the world', 'other', '2025-08-10 12:00:00', '2025-08-10 22:00:00', 'upcoming', 3, 3),
(13, 'Startup Launch Day', '10 Egyptian startups showcase their MVPs', 'conference', '2025-09-20 10:00:00', '2025-09-20 16:00:00', 'upcoming', 3, 8),
(14, 'Summer Theatre Gala', 'A night of classic Egyptian theatre', 'theater', '2025-08-25 19:30:00', '2025-08-25 22:00:00', 'upcoming', 2, 6),
(15, 'Egypt Sports Day', 'Various sports competitions and fan activities', 'sports', '2025-10-01 09:00:00', '2025-10-01 18:00:00', 'upcoming', 1, 5),
(16, 'Luxury Auto Night', 'Showcase of top-tier cars in Egypt', 'conference', '2025-12-05 18:00:00', '2025-12-05 22:00:00', 'upcoming', 1, 1),
(17, 'Anime & Comic Con Egypt', 'Cosplay, anime screenings, and panels', 'other', '2025-11-10 10:00:00', '2025-11-10 20:00:00', 'upcoming', 3, 7),
(18, 'Zamalek vs Ahly Match', 'Top Egyptian Premier League showdown', 'sports', '2025-10-15 19:00:00', '2025-10-15 21:00:00', 'upcoming', 1, 5),
(19, 'Red Sea Jazz Festival', 'Live jazz bands on the coast', 'concert', '2025-09-01 18:00:00', '2025-09-01 23:00:00', 'upcoming', 4, 9),
(20, 'Green Future Expo', 'Exhibition of sustainable and green tech', 'conference', '2025-12-01 09:00:00', '2025-12-01 17:00:00', 'upcoming', 3, 8),
(21, 'Opera Classics Night', 'Performances of classic operas', 'theater', '2025-09-28 20:00:00', '2025-09-28 22:00:00', 'upcoming', 2, 6);
insert into event (EventId, Name, Description, Category, StartDate_Time, EndDate_Time, Status, VenueId, OrganizerId)
values 
(23, 'Tech Week Egypt', 'Ongoing technology conference', 'conference', '2025-03-15 09:00:00', '2025-03-20 18:00:00', 'ongoing', 3, 8),
(24, 'Spring Music Festival', 'Daily concerts in various venues', 'concert', '2025-04-01 18:00:00', '2025-04-15 23:00:00', 'ongoing', 1, 7),
(25, '2024 Pyramids Marathon', 'Annual running event around the pyramids', 'sports', '2024-03-10 06:00:00', '2024-03-10 12:00:00', 'completed', 1, 5),
(26, 'Winter Film Festival', 'Showcase of Egyptian cinema', 'other', '2024-12-01 12:00:00', '2024-12-10 22:00:00', 'completed', 2, 6),
(27, 'AI Conference 2024', 'Artificial intelligence summit', 'conference', '2024-11-15 09:00:00', '2024-11-17 17:00:00', 'completed', 3, 8),
(28, 'National Day Concert', 'Celebration of Egyptian culture', 'concert', '2024-07-23 20:00:00', '2024-07-23 23:30:00', 'completed', 1, 7),
(30, 'Blockchain Summit', 'Event cancelled by organizers', 'conference', '2025-06-10 09:00:00', '2025-06-12 17:00:00', 'cancelled', 3, 8);
------------------- Insert Ticket -------------------
insert into Ticket (TicketId, Section, Row, SeatNumber, TicketType, Price, PurchaseDateTime, Status, EventId, CustomerId) values
(1, 'A', '1', 1, 'VIP', 1000, '2025-07-01 14:00:00', 'active', 6, 1),
(2, 'A', '1', 2, 'VIP', 1000, '2025-07-01 14:02:00', 'active', 6, 2),
(3, 'A', '1', 3, 'VIP', 1000, '2025-07-01 14:04:00', 'active', 6, 3),
(4, 'B', '2', 1, 'regular', 500, '2025-07-01 14:10:00', 'active', 6, 4),
(5, 'B', '2', 2, 'regular', 500, '2025-07-01 14:12:00', 'active', 6, 5),
(6, 'B', '2', 3, 'student', 250, '2025-07-01 14:13:00', 'active', 6, 6),
(7, 'VIP', 'A', 10, 'VIP', 1500, '2025-07-01 15:00:00', 'active', 7, 7),
(8, 'VIP', 'A', 11, 'VIP', 1500, '2025-07-01 15:01:00', 'active', 7, 8),
(9, 'C', '3', 5, 'regular', 750, '2025-07-01 15:05:00', 'active', 7, 9),
(10, 'C', '3', 6, 'student', 400, '2025-07-01 15:06:00', 'active', 7, 10),
(11, 'D', '1', 7, 'senior', 200, '2025-07-01 15:10:00', 'active', 7, 11),
(12, 'D', '1', 8, 'regular', 750, '2025-07-01 15:12:00', 'active', 7, 12),
(13, 'E', '5', 15, 'VIP', 1200, '2025-07-01 16:00:00', 'active', 10, 13),
(14, 'E', '5', 16, 'regular', 600, '2025-07-01 16:01:00', 'active', 10, 14),
(16, 'F', '6', 18, 'regular', 600, '2025-07-01 16:10:00', 'active', 10, 16),
(17, 'F', '6', 19, 'VIP', 1200, '2025-07-01 16:12:00', 'active', 10, 17),
(19, 'G', '1', 21, 'regular', 700, '2025-07-01 17:00:00', 'active', 11, 1),
(20, 'G', '1', 22, 'student', 350, '2025-07-01 17:02:00', 'active', 11, 2),
(21, 'G', '1', 23, 'VIP', 1300, '2025-07-01 17:04:00', 'active', 11, 3),
(22, 'H', '2', 24, 'regular', 700, '2025-07-01 17:06:00', 'active', 11, 4),
(23, 'H', '2', 25, 'VIP', 1300, '2025-07-01 17:08:00', 'active', 11, 5),
(24, 'I', '3', 26, 'student', 350, '2025-07-01 17:10:00', 'active', 11, 6),
(25, 'I', '3', 27, 'senior', 300, '2025-07-01 17:12:00', 'active', 11, 7),
(26, 'J', '4', 28, 'regular', 700, '2025-07-01 17:14:00', 'active', 11, 8),
(27, 'J', '4', 29, 'student', 350, '2025-07-01 17:16:00', 'active', 11, 9),
(28, 'K', '5', 30, 'VIP', 1300, '2025-07-01 17:18:00', 'active', 11, 10),
(29, 'K', '5', 31, 'VIP', 1300, '2025-07-01 17:20:00', 'active', 11, 11),
(30, 'K', '5', 32, 'VIP', 1300, '2025-07-01 17:22:00', 'active', 11, 12);


----------- Update Customer -------------
update Customer 
set Address = 'Sohag,Egypt'
where CustomerId = 1 ;

update Customer 
set Name = 'Ahmed Ezz'
where CustomerId = 15 ;

update Customer 
set Email = 'Ahmed.Ezz15@gmail.com'
where CustomerId = 15 ;

update Customer 
set Address = 'Tokyo'
where Name = 'Ziad Mahran' ;

update Customer 
set DateOfBirth = '2004-07-18'
where CustomerId = 1 ;

----------- Update Customer_PhoneNumber ------------
update Customer_PhoneNumber 
set phoneNumber = '78965745333'
where phoneNumber = '01200000019' ;

update Customer_PhoneNumber 
set phoneNumber = '012131415167'
where phoneNumber = '01100000010' ;

---------------- Update Organizer ----------------------
update EventOrganizer
set ContactInfo = 'contact@pizzahut.com.eg'
where OrganizerId = 3;

update EventOrganizer
set OrganizationName = 'TechLink Company'
where OrganizationName = 'TechLink Expo';

update EventOrganizer
set ContactInfo = 'support@mercedes-eg.com'
where OrganizationName = 'Mercedes Egypt';


------------------- Update Area -------------------
update eventorganizer_area
set SpecializationArea = 'luxury-cars'
where organizerid = 1 ;

update Eventorganizer_area
set SpecializationArea = 'tech-expo'
where Specializationarea = 'technology';

update eventorganizer_area
set Specializationarea = 'tourism'
where Specializationarea = 'travel';

------------------- Update Venue -------------------

update Venue
set Capacity = 80000
where VenueId = 3;

update Venue
set FacilityType = 'hybrid'
where name = 'opera house main hall';

update Venue
set Facilitytype = 'hybrid'
where City = 'hurghada';


------------------- Update Event -------------------

update Event
set Status = 'completed'
where EventId = 7;

update Event
set EndDate_Time = '2025-10-05 18:00:00'
where Name = 'tech summit 2025';

------------------- update Ticket -------------------

update Ticket 
set TicketType = 'regular' 
where TicketId = 1;

update Ticket 
set TicketType = 'vip' 
where TicketId = 4;

update Ticket 
set Price = 900 
where TicketId = 2;

update Ticket 
set Price = 300 
where TicketId = 6;

update Ticket 
set Status = 'cancelled' 
where TicketId = 7;

update Ticket 
set Status = 'used' 
where TicketId = 10;

update Ticket 
set SeatNumber = 99 
where TicketId = 3;

update Ticket 
set Section = 'z', Row = '9', SeatNumber = 50 
where TicketId = 13;

update Ticket 
set PurchaseDateTime = '2025-07-02 10:00:00' 
where TicketId = 5;

update Ticket 
set Row = 'G' 
where TicketId = 9;

						 ------------------------------------------------------------------------------------------------------------------------

----------- Delete Customer_PhoneNumber ------------
delete from Customer_PhoneNumber 
where phoneNumber = '01200000015' ;

delete from Customer_PhoneNumber 
where phoneNumber = '78965745333' ;

------------- Delete Customer ----------------- 
delete from Customer 
where CustomerId = 15;

delete from Customer 
where Name = 'Ahmed Hashem';


---------------- Delete Organizer ----------------------
delete from EventOrganizer 
where OrganizationName = 'Dream Park Events' ;

delete from EventOrganizer
where ContactInfo = 'alahly@events.com' ;

delete from EventOrganizer
where OrganizerId = 4 ;

------------------- Delete Area -------------------
delete from eventorganizer_area
where SpecializationArea = 'food';

delete from eventorganizer_area
where OrganizerId = 6;

delete from eventorganizer_area
where SpecializationArea = 'sports';

------------------- Delete Venue -------------------
delete from Venue
where Name = 'borg el arab stadium';
------------------- Delete Event----------------
delete from Ticket where EventId IN (
  select EventId from Event where Name = 'international auto expo' OR EventId = 11
);

delete from Event where Name = 'international auto expo';
delete from Event where EventId = 11;

------------------- Delete Ticket -------------------
delete from Ticket where TicketId = 3;
delete from Ticket where TicketId = 7;
delete from Ticket where SeatNumber = 16;






