select Banks.BanksName, Cities.City
from Banks
left join CityBank on Banks.Id = CityBank.BankId
left join Cities on CityBank.CityId = Cities.Id
where Cities.City = N'Минск';