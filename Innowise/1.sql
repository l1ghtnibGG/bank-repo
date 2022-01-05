SELECT Banks.BankName, Banks.City, COUNT(Banks.City) as Amount
FROM Banks 
WHERE Banks.City = 'Новополоцк'
GROUP BY Banks.BankName, Banks.City;