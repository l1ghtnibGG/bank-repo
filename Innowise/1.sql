SELECT Banks.BankName, Banks.City, COUNT(Banks.City) as Amount
FROM Banks 
WHERE Banks.City = N'Новополоцк'
GROUP BY Banks.BankName, Banks.City;