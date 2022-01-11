select Clients.LastName, Clients.FirstName, Clients.Patronymic, CardBalance.Balance, Banks.BanksName
  from Clients
  left join CardBalance on CardBalance.ClientId = Clients.id
  left join Banks on Banks.id = CardBalance.BankId