SELECT Clients.LastName, Clients.FirstName, SUM(Cards.BalanceOfCard)
FROM Clients JOIN Cards 
ON Cards.ClientId = Clients.Id
GROUP BY Clients.LastName, Clients.FirstName;