select clientBalance.LastName, clientBalance.FirstName, clientBalance.Patronymic, 
Banks.BanksName, (SUM(clientBalance.Balance) - SUM(CardBalance.Balance)) as different
  from (select Clients.LastName, Clients.FirstName, Clients.Patronymic, ClientsBank.Balance, Clients.Id
	from Clients join ClientsBank on ClientsBank.ClientId = Clients.Id) as clientBalance

  right join CardBalance on CardBalance.ClientId = clientBalance.id
  right join Banks on Banks.id = CardBalance.BankId
  group by clientBalance.LastName, clientBalance.FirstName, clientBalance.Patronymic, Banks.BanksName