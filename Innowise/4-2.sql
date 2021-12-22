SELECT Tab1.Status, Tab2.Кол
FROM (SELECT Clients.Id, Clients.Status FROM Clients GROUP BY Clients.Status, Clients.id) AS Tab1
JOIN (SELECT Cards.ClientId, COUNT(Cards.NameOfCard) AS Кол FROM Cards GROUP BY Cards.ClientId) AS Tab2
ON Tab2.ClientId = Tab1.id;
