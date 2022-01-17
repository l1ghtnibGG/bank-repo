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

declare @identifier int 
DECLARE @bal_kart INT
DECLARE @bal_bank INT


select @bal_kart = inserted.Balance, @identifier = inserted.ClientId
			from inserted
			join CardBalance as cardb
			on inserted.ClientId = cardb.ClientId


	SELECT @bal_bank = Balance
		FROM ClientsBank 
		where ClientId = @identifier



IF @bal_bank < @bal_kart
BEGIN 
ROLLBACK TRAN
RAISERROR('Сумма на счёте не может быть меньше чем суммы на картах', 16, 1)
END


