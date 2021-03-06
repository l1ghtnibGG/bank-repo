USE [Bank]
GO
/****** Object:  Trigger [dbo].[verifCard]    Script Date: 12.01.2022 02:05:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[verifCard] ON [dbo].[CardBalance]
after UPDATE
AS 

declare @identifier int 
DECLARE @bal_kart INT
DECLARE @bal_bank INT


select @bal_kart = sum(inserted.Balance), @identifier = inserted.ClientId
			from inserted
			join CardBalance as cardb
			on inserted.ClientId = cardb.ClientId
			group by inserted.ClientId

	SELECT @bal_bank = Balance
		FROM ClientsBank 
		where ClientId = @identifier




IF @bal_bank < @bal_kart
begin
ROLLBACK TRAN
RAISERROR('Sum on bank accaunt cant be less then sum on cards', 16, 1)
end

else
begin
print'Transfer was successful';
end;

