 INSERT INTO Banks(Id, BankName, City)
 VALUES 
 (1, N'Беларусь', N'Минск'),
 (2, N'Приор', N'Новополоцк'),
 (3, N'Беларусь', N'Новополоцк'),
 (4, N'Белъинвест', N'Полоцк')

 INSERT INTO Clients(Id, LastName, FirstName, Patronymic)
 VALUES 
 (1, N'Кругликов', N'Владислав', N'Александрович'),
 (2, N'Данелёнок', N'Виктория', N'Владимировна'),
 (3, N'Дедух', N'Пётр', N'Егорович'),
 (4, N'Белесова', N'Карина', N'Викторовна')

 INSERT INTO SocStatus(Id, Stat)
 VALUES
 (1, N'Трудоспособный'),
 (2, N'Безработный'),
 (3, N'Пенсионер')
 

 INSERT INTO ClientsBank(Id, ClientId, BankId, Balance)
 VALUES
 (1, 1, 1, 10000),
 (2, 2, 2, 1400),
 (3, 3, 3, 500),
 (4, 4, 4, 900),
 (5, 3, 4, 300);


 INSERT Cards(Id, CardsName)
 VALUES 
 (1, N'Стандарт'),
 (2, N'Плюс'),
 (3, N'Голд');

 INSERT CardBalance(Id, BankId, ClientId, CardId, Balance)
 VALUES 
 (1, 1, 1, 1, 8000),
 (2, 2, 2, 2, 1400),
 (3, 3, 3, 1, 500),
 (4, 4, 3, 3, 300),
 (5, 4, 4, 2, 900);	