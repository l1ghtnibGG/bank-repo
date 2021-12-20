CREATE TRIGGER verification ON Банки
FOR INSERT, UPDATE
AS 
DECLARE @bal_kart INT
DECLARE @bal_bank INT
SELECT @bal_kart = SUM(Карточки.Баланс)
FROM Клиенты JOIN Карточки ON Карточки.idКлиента = Клиенты.id
GROUP BY Клиенты.Фамилия, Клиенты.Имя
SELECT @bal_bank = Банки.[Баланс аккаунта]
FROM Банки
IF @bal_bank < @bal_kart
BEGIN 
ROLLBACK TRAN
RAISERROR('Сумма на счёте не может быть меньше чем суммы на картах', 16, 1)
END


