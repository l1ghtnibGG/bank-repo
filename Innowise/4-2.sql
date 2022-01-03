SELECT SocStatus.SocialStatus, Amount.amount
FROM (SELECT Clients.Id, Clients.SocialStatus FROM Clients GROUP BY Clients.SocialStatus, Clients.id) AS SocStatus
	JOIN (SELECT Cards.ClientId, COUNT(Cards.NameOfCard) AS amount FROM Cards GROUP BY Cards.ClientId) AS Amount
ON Amount.ClientId = SocStatus.id;
