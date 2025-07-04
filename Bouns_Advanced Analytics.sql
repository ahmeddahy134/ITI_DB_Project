use Event_Ticketing_System
--==========Advanced Analytics
--Segment customers based on the total number of tickets purchased
select top 5 c.Name , SUM(t.TicketId) as totalTickets
from Customer c
join Ticket t on c.CustomerId = t.CustomerId
group by c.CustomerId, c.Name
order by totalTickets desc;

--Find the number of tickets sold per month to identify seasonal trends
select month(t.PurchaseDateTime) as Month , SUM(t.TicketId) as totalTickets
from Ticket t
group by month(t.PurchaseDateTime);

--Identify customers who frequently attend concerts and purchase more than 2 tickets per event
select c.CustomerId , c.Name , SUM(t.TicketId) as totalTickets
from Customer c
join Ticket t on c.CustomerId = t.CustomerId
group by c.CustomerId ,c.Name
having SUM(t.TicketId) > 2;

--Predict events likely to sell out soon based on current ticket sales vs. total seat
select e.EventId, e.Name, count(t.TicketId) as totalTickets
from Event e
join Ticket t on e.EventId = t.EventId
join Venue v on e.VenueId = v.VenueId
where e.Status = 'upcoming'
group by e.EventId, e.Name, v.Capacity
having count(t.TicketId) >= 4;

