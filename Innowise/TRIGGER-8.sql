CREATE TRIGGER verification ON �����
FOR INSERT, UPDATE
AS 
DECLARE @bal_kart INT
DECLARE @bal_bank INT
SELECT @bal_kart = SUM(��������.������)
FROM ������� JOIN �������� ON ��������.id������� = �������.id
GROUP BY �������.�������, �������.���
SELECT @bal_bank = �����.[������ ��������]
FROM �����
IF @bal_bank < @bal_kart
BEGIN 
ROLLBACK TRAN
RAISERROR('����� �� ����� �� ����� ���� ������ ��� ����� �� ������', 16, 1)
END


