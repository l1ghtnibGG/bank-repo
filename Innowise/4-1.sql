SELECT Clients.Status, COUNT(*) AS Amount
FROM Cards JOIN Clients 
ON Cards.ClientId = Clients.Id
GROUP BY Clients.Status;