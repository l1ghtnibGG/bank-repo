SELECT Tab1.[��� ������], Tab2.���
FROM (SELECT �������.id, �������.[��� ������] FROM ������� GROUP BY �������.[��� ������], �������.id) AS Tab1
JOIN (SELECT ��������.id�������, COUNT(��������.[�������� �����]) AS ��� FROM �������� GROUP BY ��������.id�������) AS Tab2
ON Tab2.id������� = Tab1.id;
