SELECT Banks.NameOfBank, Banks.City, COUNT(Banks.City)
FROM Banks 
WHERE Banks.City = '����������'
GROUP BY Banks.NameOfBank, Banks.City;