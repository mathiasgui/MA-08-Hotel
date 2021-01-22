--Vue SELECT Hôtel.SQL
-- Date: Janvier 2021
-- Author: Mathias Guignard & Yoann Bonzon
-- Goal: Make SELECT in DB

-- utiliser la base de donnée Hôtel
Use Hôtel
GO

--utilisation des SELECT
Select * FROM V_Hôtel;
Select * FROM Invoice;
Select * FROM Clients;
Select * FROM Reservations;
Select * FROM Collaborators;
Select * FROM Hotels;
Select * FROM Rooms;
Select * FROM Services;
Select * FROM Collaborators_clean_Rooms;
Select * FROM Collaborators_has_Clients;