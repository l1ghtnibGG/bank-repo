SELECT Clients.LastName, Clients.FirstName, Clients.Patronymic, Cards.BalanceOfCard, Cards.NameOfBank
FROM Cards JOIN Clients 
ON Clients.id = Cards.ClientId;