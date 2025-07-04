---------------- UpComing Events ----------------------
create view VmUpcomingEvents as
select 
e.EventId , e.Name as EventName , e.Category , e.StartDate_Time , e.EndDate_Time , 
v.VenueId , v.Name as VenueName , v.City , v.Capacity , 
o.OrganizerId , o.OrganizationName , o.ContactInfo
from  Event e
join Venue v on e.VenueId = v.VenueId
join EventOrganizer o on e.OrganizerId = o.OrganizerId
where e.Status = 'upcoming';


select * from VmUpcomingEvents

---------------- Customer Purchase History ----------------------
create view VmCustomerPurchaseHistory as
select 
c.CustomerId , c.Name as CustomerName , c.Email , 
t.TicketId , t.TicketType , t.Price , t.PurchaseDateTime , t.Status as TicketStatus , 
e.EventId , e.Name as EventName , e.StartDate_Time , e.EndDate_Time
from Customer c
join Ticket t on c.CustomerId = t.CustomerId
join Event e on t.EventId = e.EventId;


select * from VmCustomerPurchaseHistory


---------------- Venue Revenue Analytics ----------------------
create view VmVenueRevenueAnalytics as
select 
v.VenueId , v.Name as VenueName , v.City , 
count(t.TicketId) as TicketsSold , 
sum(t.Price) as TotalRevenue , 
v.Capacity , 
cast(count(t.TicketId) * 100.0 / nullif(v.Capacity , 0) as decimal(5,2)) as UtilizationPercentage
from Venue v
left join Event e on v.VenueId = e.VenueId
left join Ticket t on e.EventId = t.EventId
group by v.VenueId , v.Name , v.City , v.Capacity;


select * from VmVenueRevenueAnalytics


