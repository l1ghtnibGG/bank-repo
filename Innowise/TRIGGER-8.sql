USE [Innowise]
GO
/****** Object:  Trigger [dbo].[verification]    Script Date: 22.12.2021 04:08:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER TRIGGER [dbo].[verification] ON [dbo].[Banks]
FOR INSERT, UPDATE
AS 
DECLARE @bal_kart INT
DECLARE @bal_bank INT


SELECT @bal_kart = SUM(Cards.BalanceOfCard)
FROM Clients JOIN Cards ON Cards.ClientId = Clients.Id
GROUP BY Clients.LastName, Clients.FirstName

SELECT @bal_bank = Banks.Balance
FROM Banks


IF @bal_bank < @bal_kart
BEGIN 
ROLLBACK TRAN
RAISERROR('—умма на счЄте не может быть меньше чем суммы на картах', 16, 1)
END


