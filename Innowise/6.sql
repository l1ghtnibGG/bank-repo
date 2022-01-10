SELECT Clients.LastName, Clients.FirstName, SUM(CardBalance.Balance) AS CardsBalance
FROM Clients 
	JOIN CardBalance ON CardBalance.ClientId = Clients.Id
GROUP BY Clients.LastName, Clients.FirstName;