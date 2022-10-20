/*5.1 ��� ���� � ������� �������� ������� ��������� ������� ����� �������, 
����������� �� ���� � �������, ��� ����� ������� ���� ��������, ��'������� �� 
� �������� ��������� �������� ������� ����� �� ����������� ����� ������:�
*/
SELECT Serv_name, 
    COUNT(Service_implementer) 
FROM List_Of_Services, Services
WHERE 
     List_Of_Services.Service_name = Services.Serv_id
GROUP BY Serv_name
UNION ALL
SELECT 
    '�����:', 
    COUNT(Serv_name)
FROM Services;
/*
SERV_NAME       COUNT(SERVICE_IMPLEMENTER)
--------------- --------------------------
Haircut                                  1
Manicure                                 2
Massage                                  3
�����:                                   5
*/