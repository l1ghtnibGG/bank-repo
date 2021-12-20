SELECT Tab1.[Соц статус], Tab2.Кол
FROM (SELECT Клиенты.id, Клиенты.[Соц статус] FROM Клиенты GROUP BY Клиенты.[Соц статус], Клиенты.id) AS Tab1
JOIN (SELECT Карточки.idКлиента, COUNT(Карточки.[Название карты]) AS Кол FROM Карточки GROUP BY Карточки.idКлиента) AS Tab2
ON Tab2.idКлиента = Tab1.id;
