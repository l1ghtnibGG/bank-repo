SELECT Banks.BankName, Banks.City, COUNT(Banks.City) as Amount
FROM Banks 
WHERE Banks.City = '����������'
GROUP BY Banks.BankName, Banks.City;