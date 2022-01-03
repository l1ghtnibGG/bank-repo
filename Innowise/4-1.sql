SELECT Clients.SocialStatus, COUNT(*) AS Amount
FROM Cards 
	JOIN Clients ON Cards.ClientId = Clients.Id
GROUP BY Clients.SocialStatus;