USE [Innowise]
GO
/****** Object:  StoredProcedure [dbo].[AddMoney]    Script Date: 19.12.2021 14:51:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[AddMoney]
AS
BEGIN
SET NOCOUNT ON
 
SELECT Клиенты.Фамилия, Клиенты.Имя, Банки.[Название банка], Банки.[Баланс аккаунта] + 10   
FROM  Банки JOIN Клиенты ON Клиенты.id = Банки.Id
WHERE Клиенты.[Соц статус] = 'Трудоспособный'
 
END