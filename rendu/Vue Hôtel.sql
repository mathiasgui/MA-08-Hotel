--Vue Hôtel.SQL
-- Date: Janvier 2021
-- Author: Mathias Guignard & Yoann Bonzon
-- Goal: Create view in DB

-- utiliser la base de donnée Hôtel
Use Hôtel
GO
-- création d'une vue contenant le nombre d'entrée par table
CREATE VIEW V_Hôtel AS SELECT * FROM 
(SELECT COUNT(*) AS "Invoice" FROM Invoice) as Invoice,
(SELECT COUNT(*) AS "Clients" FROM Clients) as Clients,
(SELECT COUNT(*) AS "Reservation" FROM Reservations) as Reservation,
(SELECT COUNT(*) AS "Collaborators" FROM Collaborators) as Collaborators,
(SELECT COUNT(*) AS "Hotels" FROM Hotels) as Hotels,
(SELECT COUNT(*) AS "Rooms" FROM Rooms) as Rooms,
(SELECT COUNT(*) AS "Services" FROM Services) as Services,
(SELECT COUNT(*) AS "Collaborators_clean_Rooms" FROM Collaborators_clean_Rooms) as Collaborators_clean_Rooms,
(SELECT COUNT(*) AS "Collaborators_has_Clients" FROM Collaborators_has_Clients) as Collaborators_has_Clients,
(SELECT COUNT(*) AS "Invoice_has_Services" FROM Invoice_has_Services) as Invoice_has_Services;