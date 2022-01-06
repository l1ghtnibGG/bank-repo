SELECT Banks.BanksName, CityName.City
FROM Banks 
	JOIN
		(SELECT Cities.City, CityBank.BankId
		FROM Cities 
		JOIN CityBank ON Cities.Id = CityBank.CityId) AS CityName
	ON Banks.Id = CityName.BankId
WHERE CityName.City = N'Минск';