select c.LastName, c.FirstName, c.Patronymic,
  b.BanksName, (SUM(cb.Balance) - SUM(cardb.Balance)) as different
from Clients as c
left join ClientsBank as cb on cb.ClientId = c.Id
left join Banks as b on b.Id = cb.BankId
left join CardBalance as cardb on cardb.ClientId = c.Id and cardb.BankId = b.Id
group by c.LastName, c.FirstName, c.Patronymic, b.BanksName having (SUM(cb.Balance) - SUM(cardb.Balance)) <> 0


