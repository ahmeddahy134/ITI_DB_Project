USE Event_Ticketing_System;
GO
-- تأكد من وجود العمود Available_Seats
ALTER TABLE Venue ADD Available_Seats INT DEFAULT 0;
GO
GO

-- Trigger لتحديث عدد المقاعد المتاحة بعد شراء التذاكر
CREATE TRIGGER trgUpdateAvailableSeats
ON Ticket
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE V
    SET V.Available_Seats = ISNULL(V.Available_Seats, 0) - TicketCount.TicketsBought
    FROM Venue V
    JOIN Event E ON V.VenueId = E.VenueId
    JOIN (
        SELECT EventId, COUNT(*) AS TicketsBought
        FROM INSERTED
        GROUP BY EventId
    ) AS TicketCount
    ON E.EventId = TicketCount.EventId;
END;
GO

-- Trigger لحساب الإيرادات بعد شراء التذاكر
CREATE TRIGGER trgCalculateRevenue
ON Ticket
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    MERGE Revenue AS target
    USING (
        SELECT EventId, SUM(Price) AS SumPrice
        FROM INSERTED
        GROUP BY EventId
    ) AS source
    ON target.EventId = source.EventId
    WHEN MATCHED THEN
        UPDATE SET TotalRevenue = ISNULL(target.TotalRevenue, 0) + source.SumPrice
    WHEN NOT MATCHED THEN
        INSERT (EventId, TotalRevenue)
        VALUES (source.EventId, source.SumPrice);
END;
GO
