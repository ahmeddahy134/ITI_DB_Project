-- SQL Practice Queries with Answers for Event_Ticketing_System

--------------------Technical Requirements
use Event_Ticketing_System;

--===Basic SELECT with WHERE
--Retrieve all upcoming events hosted in venue with ID 3
select * 
from Event e 
where e.VenueId = 3;

--Retrieve all events with ticket prices above 1000
select * 
from Event e 
where e.EventId in (select t.EventId from Ticket t where t.Price > 1000);

--Retrieve events scheduled after '2025-10-01'
select *
from Event e
where e.StartDate_Time > '2025-10-01';

--Find events with status = 'upcoming' and venue in 'Cairo'
select * 
from Event e
where e.Status = 'upcoming' and
e.VenueId in (select v.VenueId from Venue v where v.City = 'Cairo');

--Get customers from 'Sohag' or 'Cairo'
select *
from Customer c
where c.Address like '%Sohag%' or c.Address like  '%Zagazig%';

--Retrieve phone numbers for customers born before 1990
select cp.CustomerId , cp.phoneNumber
from Customer_PhoneNumber cp
where cp.CustomerId in (select c.CustomerId from Customer c where c.DateOfBirth < '1990-1-1');

--===Advanced Filtering
--Retrieve events between '2025-10-01' and '2025-12-01'
select * 
from Event e 
where e.StartDate_Time between '2025-10-01' and '2025-12-01';

--Retrieve events where category IN ('concert', 'sports')
select *
from Event e
where e.Category in ('concert', 'sports');

--Search for events with name containing 'auto'
select * 
from Event e
where e.Name like '%auto%';

--Retrieve tickets priced between 500 and 1000
select *
from Ticket t
where t.Price between 500 and 1000;

--Retrieve organizers with specialization IN ('technology', 'sports')
select DISTINCT o.*
from EventOrganizer o
JOIN Event e on o.OrganizerId = e.OrganizerId
where e.Category in ('Sports','concert');

--Retrieve customers whose names start with 'Ahmed'
select *
from Customer c
where c.Name like 'Ahmed%';

--===Aggregation Functions
--Count total tickets sold per event
select t.EventId , count(t.TicketId) as total_tickets
from Ticket t
group by t.EventId;

--Get average ticket price per event
select t.EventId , avg(t.Price) as average_ticket_price
from Ticket t
group by t.EventId;

--Get total revenue per event
select e.EventId , COUNT(e.VenueId) as total_revenue
from Event e
group by e.EventId;

--Get min and max ticket price for each ticket type
select t.TicketType , min(t.Price) as min_ticket_price , max(t.Price) as max_ticket_price
from Ticket t
group by t.TicketType;

--Count number of phone numbers per customer
select cp.CustomerId , count(cp.phoneNumber) as number_of_phone_numbers
from Customer_PhoneNumber cp
group by cp.CustomerId;

--Count number of events per venue
select e.VenueId , count(e.EventId) as number_of_events
from Event e
group by e.VenueId;

--===GROUP BY with HAVING
--List events where the total revenue from ticket sales exceeds 10,000 EGP
select e.eventid, e.name as event_name, sum(t.price) as total_revenue
from event e
join ticket t on e.eventid = t.eventid
group by e.eventid, e.name
having sum(t.price) > 10000;

--Show ticket types that have an average price above 900 
select t.TicketType , avg(t.Price) as average_price
from Ticket t
group by t.TicketType
having avg(t.Price) > 900;

--Count total number of tickets sold per event category
select e.category, count(*) as total_tickets_sold
from ticket t
join event e on t.eventid = e.eventid
group by e.category
order by total_tickets_sold desc;

--Calculate total revenue generated per venue
select v.venueid, v.name as venue_name, sum(t.price) as total_revenue
from ticket t
join event e on t.eventid = e.eventid
join venue v on e.venueid = v.venueid
group by v.venueid, v.name
order by total_revenue desc;

--Venues hosting > 2 events
select v.venueid, v.name as venue_name, count(*) as events_hosted
from event e
join venue v on e.venueid = v.venueid
group by v.venueid, v.name
having count(*) > 2
order by events_hosted desc;

--===Set Operations
--UNION current events with archived_events table
select * 
from event e
where e.status = 'ongoing'
union
select * 
from event e
where e.status = 'completed';

--INTERSECT customers who attended both concert and sports events
select distinct t.customerid, c.name, c.email
from ticket t
join Event e on t.EventId = e.EventId
join customer c on t.customerid = c.customerid
where e.category = 'concert'
intersect
select distinct t.customerid, c.name, c.email
from ticket t
join Event e on t.EventId = e.EventId
join customer c on t.customerid = c.customerid
where e.category = 'sports'
order by customerid;

--EXCEPT events that still have tickets vs. sold-out events
select e.eventid, e.name, e.venueid
from event e
except
select e.eventid, e.name, e.venueid
from event e
join ticket t on e.eventid = t.eventid
where t.status = 'active'
order by eventid;

--===Subqueries
--Events with above-average ticket sales
select *
from Event e
where (select avg(t.Price) from Ticket t where t.EventId = e.EventId ) >
(select avg(t2.Price) from Ticket t2);

-- Show event name, ticket price, and max ticket price
select e.Name , t.Price , (select max(t.Price) from Ticket t) as max_ticket_price
from Event e
join ticket t on e.eventid = t.eventid
group by e.Name , t.Price;

-- Average ticket price by event category
select category_stats.category, category_stats.avg_price
from (
    select 
        e.category,
        avg(t.price) as avg_price
    from 
        ticket t
    join 
        Event e on t.eventid = e.eventid
    group by 
        e.category
) as category_stats
where category_stats.avg_price > 500
order by category_stats.avg_price desc;

--===Indexes
-- Index on event_name, category, event_date 
create index INDEX_EVENT on Event(StartDate_Time, VenueId);
-- Index on customer_id, event_id 
create index INDEX_Customer_Event on Ticket(CustomerId, EventId);
-- Index on purchase_date, ticket_price 
create index INDEX_Ticket on Ticket(PurchaseDateTime,Price);
-- Index on venue_id, event_date 
create index INDEX_Event_Date on Event(VenueId,StartDate_Time);
