--------------------- Sorting Events by Date ------------------------------
select EventId, Name as EventName, StartDate_Time, EndDate_Time
from Event
order by StartDate_Time desc;

--------------------- Sorting Tickets by Price ----------------------------
select TicketId, TicketType, Price, EventId, CustomerId
from Ticket
order by Price desc;

--------------------- Sorting Events by Popularity ----------------------------
select e.EventId, e.Name as EventName, count(t.TicketId) as TicketsSold
from Event e
left join Ticket t on e.EventId = t.EventId
group by e.EventId, e.Name
order by TicketsSold desc;

------------------- Sort By TicketType Then Price ---------------------------------
select TicketId, TicketType, Price, EventId
from Ticket
order by TicketType asc, Price asc;

------------------- Sorting Venues By City Then Capacity --------------------------
select VenueId, Name as VenueName, City, Capacity
from Venue
order by City asc, Capacity desc;

