 INSERT INTO Banks(Id, BankName, City)
 VALUES 
 (1, N'��������', N'�����'),
 (2, N'�����', N'����������'),
 (3, N'��������', N'����������'),
 (4, N'����������', N'������')

 INSERT INTO Clients(Id, LastName, FirstName, Patronymic)
 VALUES 
 (1, N'���������', N'���������', N'�������������'),
 (2, N'��������', N'��������', N'������������'),
 (3, N'�����', N'ϸ��', N'��������'),
 (4, N'��������', N'������', N'����������')

 INSERT INTO SocStatus(Id, Stat)
 VALUES
 (1, N'��������������'),
 (2, N'�����������'),
 (3, N'���������')
 

 INSERT INTO ClientsBank(Id, ClientId, BankId, Balance)
 VALUES
 (1, 1, 1, 10000),
 (2, 2, 2, 1400),
 (3, 3, 3, 500),
 (4, 4, 4, 900),
 (5, 3, 4, 300);


 INSERT Cards(Id, CardsName)
 VALUES 
 (1, N'��������'),
 (2, N'����'),
 (3, N'����');

 INSERT CardBalance(Id, BankId, ClientId, CardId, Balance)
 VALUES 
 (1, 1, 1, 1, 8000),
 (2, 2, 2, 2, 1400),
 (3, 3, 3, 1, 500),
 (4, 4, 3, 3, 300),
 (5, 4, 4, 2, 900);	