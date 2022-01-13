USE [Bank]
GO
/****** Object:  Trigger [dbo].[verifCard]    Script Date: 12.01.2022 02:05:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[verifCard] ON [dbo].[CardBalance]
INSTEAD OF UPDATE
AS 

DECLARE @bal_kart INT
DECLARE @bal_bank INT

	SELECT @bal_kart = CardBalance.Balance
		FROM CardBalance 


	SELECT @bal_bank = ClientsBank.Balance
		FROM ClientsBank


IF @bal_bank < @bal_kart
BEGIN 
ROLLBACK TRAN
RAISERROR('Сумма на счёте не может быть меньше чем суммы на картах', 16, 1)
END


