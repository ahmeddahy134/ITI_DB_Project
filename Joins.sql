----------------- Inner Join --------------------
select * from Venue v
inner join Event e
on e.VenueId = v.VenueId ;

select * from Customer c
inner join Ticket t
on t.CustomerId = c.CustomerId;

select * from Customer c
inner join Ticket t
on t.CustomerId = c.CustomerId
where c.CustomerId  < 8 ;

----------------- Left Join --------------------
select e.EventId, e.Name as EventName, t.TicketId, t.CustomerId from Event e
left join Ticket t
on t.EventId = e.EventId ;


----------------- Right Join --------------------
select c.CustomerId , c.Name as CustomerName , t.TicketId , t.EventId from Ticket t
right join Customer c 
on t.CustomerId = c.CustomerId ;




