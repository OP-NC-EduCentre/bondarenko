/*5.1 Для однієї з таблиць створити команду отримання кількості рядків таблиці, 
згрупованих по одній з колонок, яка також повинна бути отримана, об'єднавши її 
з командою отримання загальної кількості рядків із зазначенням слова «Разом:»
*/
SELECT Serv_name, 
    COUNT(Service_implementer) 
FROM List_Of_Services, Services
WHERE 
     List_Of_Services.Service_name = Services.Serv_id
GROUP BY Serv_name
UNION ALL
SELECT 
    'Разом:', 
    COUNT(Serv_name)
FROM Services;
/*
SERV_NAME       COUNT(SERVICE_IMPLEMENTER)
--------------- --------------------------
Haircut                                  1
Manicure                                 2
Massage                                  3
Разом:                                   5
*/