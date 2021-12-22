SELECT Cards.ClientId, (Banks.Balance - SUM(Cards.BalanceOfCard)) as Differents
FROM Banks JOIN Cards ON Banks.Id = Cards.ClientId
WHERE (Banks.Balance - Cards.BalanceOfCard) != 0
GROUP BY Cards.ClientId, Banks.Balance; 