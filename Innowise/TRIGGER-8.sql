USE [Bank]
GO
/****** Object:  Trigger [dbo].[verification]    Script Date: 17.01.2022 08:02:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create TRIGGER [dbo].[verification] ON [dbo].[ClientsBank]
after UPDATE
AS 

declare @identifier int 
DECLARE @bal_kart INT
DECLARE @bal_bank INT


select @bal_bank = inserted.Balance, @identifier = inserted.ClientId
			from inserted
			join ClientsBank as cb
			on inserted.ClientId = cb.ClientId


	SELECT @bal_kart = sum(Balance)
		FROM CardBalance 
		where ClientId = @identifier
		group by ClientId



IF @bal_bank < @bal_kart
begin
ROLLBACK TRAN
RAISERROR('Сумма на счёте не может быть меньше чем суммы на картах', 16, 1)
end

else
begin
print'Перевод прошел успешно';
end



