 INSERT INTO Banks(BanksName)
 VALUES 
 (N'Беларусь'),
 (N'Приор'),
 (N'БПС'),
 (N'Белъинвест')

 INSERT INTO Cities(City)
 VALUES
 (N'Минск'),
 (N'Новополоцк'),
 (N'Полоцк')


 INSERT INTO CityBank(BankId, CityId)
 VALUES
 (1, 1),
 (2, 2),
 (3, 1),
 (4, 3)

 INSERT INTO Clients(LastName, FirstName, Patronymic, SocialStatId)
 VALUES 
 (N'Кругликов', N'Владислав', N'Александрович', 1),
 (N'Данелёнок', N'Виктория', N'Владимировна', 1),
 (N'Дедух', N'Пётр', N'Егорович', 3),
 (N'Белесова', N'Карина', N'Викторовна', 2)

 INSERT INTO SocStatus(Stat)
 VALUES
 (N'Трудоспособный'),
 (N'Безработный'),
 (N'Пенсионер')
 

 INSERT INTO ClientsBank(ClientId, BankId, Balance)
 VALUES
 (1, 1, 10000),
 (2, 2, 1400),
 (3, 3, 500),
 (4, 4, 900),
 (3, 4, 300);


 INSERT Cards(CardsName)
 VALUES 
 (N'Стандарт'),
 (N'Плюс'),
 (N'Голд');

 INSERT CardBalance(BankId, ClientId, CardId, Balance)
 VALUES 
 (1, 1, 1, 8000),
 (2, 2, 2, 1400),
 (3, 3, 1, 500),
 (4, 3, 3, 300),
 (4, 4, 2, 900);	