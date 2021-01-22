-- CreateDatabase Hôtel.SQL
-- Date: Janvier 2021
-- Author: Mathias Guignard & Yoann Bonzon
-- Goal: Creates a Hotel DB

-- drop database if exists
USE master ;
drop database if EXISTS Hôtel
 -- Create the Database
USE master ;  
GO  
CREATE DATABASE Hôtel  
ON   
( NAME = Hôtel,  
    FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Hôtel.mdf',  
    SIZE = 10,  
    MAXSIZE = 50,  
    FILEGROWTH = 5 )  
LOG ON  
( NAME = Hôtel_log,  
    FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Hôtel.ldf',  
    SIZE = 5MB,  
    MAXSIZE = 25MB,  
    FILEGROWTH = 5MB ) ;  
GO  
use Hôtel;
-- First delete the database if it exists
drop table if EXISTS Collaborators

-- Tables
CREATE TABLE Collaborators (
  id INT NOT NULL identity(1,1)  PRIMARY KEY ,
  "Name" VARCHAR(45) NOT NULL,
  FirstName VARCHAR(45) NOT NULL,
  PhoneNumber int NOT NULL UNIQUE,
  AVS int NOT NULL UNIQUE,
  )
  use Hôtel;
drop table if EXISTS Invoice
CREATE TABLE Invoice (
  id INT NOT NULL identity(1,1)  PRIMARY KEY ,
  Number int NOT NULL UNIQUE,
  Amount int NOT NULL,
  )
  use Hôtel;
drop table if EXISTS Reservations
CREATE TABLE Reservations (
  id INT NOT NULL identity(1,1)  PRIMARY KEY ,
  Number int NOT NULL UNIQUE,
  Checkin date  NOT NULL,
  checkout date NOT NULL,
  Numberofpeople int NOT NULL,
  Clients_id int ,	-- FK
  Clients_invoice_id int ,	-- FK
  Services_id int	-- FK

  )
  use Hôtel;
drop table if EXISTS Clients
CREATE TABLE Clients (
  id INT NOT NULL identity(1,1)  PRIMARY KEY ,
  "Name" VARCHAR(45) NOT NULL,
  Firstname VARCHAR(45) NOT NULL,
  Phone Varchar(60) NOT NULL UNIQUE,
  Email VARCHAR(100) NOT NULL UNIQUE,
  Adress VARCHAR(100)NULL,
  Invoice_id  INT NOT NULL, --FK

  )
  use Hôtel;
drop table if EXISTS Hotels
CREATE TABLE Hotels (
  id INT NOT NULL identity(1,1)  PRIMARY KEY ,
  "Name" VARCHAR(45) NOT NULL,
  Rooms INT NOT NULL,
  Stars INT NULL,
  Adress VARCHAR(100) NOT NULL,
  PhoneNumber Varchar(60) NOT NULL,
  )
  use Hôtel;
drop table if EXISTS Rooms
CREATE TABLE Rooms (
  id INT NOT NULL identity(1,1)  PRIMARY KEY ,
  Number int NOT NULL UNIQUE,
  "Floor" int NOT NULL,
  NumberOfBeds int NOT NULL,
  Hotels_id int NOT NULL,
  Reservations_id int NOT NULL
  )
  use Hôtel;
drop table if EXISTS "Services"
CREATE TABLE "Services" (
  id INT NOT NULL identity(1,1)  PRIMARY KEY ,
  "Description" VARCHAR(450) NOT NULL UNIQUE,
  Price int NOT NULL,
  Category VARCHAR(500) NULL,
  )

    use Hôtel;
drop table if EXISTS "Collaborators_has_Clients"
CREATE TABLE "Collaborators_has_Clients" (
  id INT NOT NULL identity(1,1)  PRIMARY KEY ,
    collaborators_id int ,	-- FK
	  clients_id int,	-- FK
	  Clients_Invoice_id int	-- FK
  )

      use Hôtel;
drop table if EXISTS "Collaborators_clean_Rooms"
CREATE TABLE "Collaborators_clean_Rooms" (
  id INT NOT NULL identity(1,1)  PRIMARY KEY ,
  collaborators_id int ,	-- FK
	  Rooms_id int , -- FK
	  reservations_id int-- FK
	  )	
  
	
      use Hôtel;
drop table if EXISTS "Invoice_has_Services"
CREATE TABLE "Invoice_has_Services" (
  id INT NOT NULL identity(1,1)  PRIMARY KEY ,
  Invoice_id int ,	-- FK
  Services_id int	-- FK
  )


   -- Contraintes référentielles
    USE Hôtel;

	
ALTER TABLE collaborators_has_clients WITH CHECK ADD  CONSTRAINT FK_Hôtel_Clients FOREIGN KEY(Collaborators_id)
REFERENCES Collaborators(id)

ALTER TABLE collaborators_has_clients WITH CHECK ADD  CONSTRAINT FK_Hôtel_Collaborators FOREIGN KEY(clients_id)
REFERENCES clients(id)

ALTER TABLE Clients WITH CHECK ADD  CONSTRAINT FK_Hôtel_invoice FOREIGN KEY(invoice_id)
REFERENCES Invoice(id)
alter table clients with check add constraint uniq unique (Invoice_id)
ALTER TABLE Reservations WITH CHECK ADD  CONSTRAINT FK_Hôtel_Clients1 FOREIGN KEY(clients_id)
REFERENCES clients(id)


ALTER TABLE Rooms WITH CHECK ADD  CONSTRAINT FK_Hôtel_Hotels FOREIGN KEY(Hotels_id)
REFERENCES Hotels(id)

ALTER TABLE Rooms WITH CHECK ADD  CONSTRAINT FK_hôtel_reservations FOREIGN KEY(Reservations_id)
REFERENCES Reservations(id)


ALTER TABLE Collaborators_clean_Rooms WITH CHECK ADD  CONSTRAINT FK_hôtel_collaborators1 FOREIGN KEY(Collaborators_id)
REFERENCES Collaborators(id)

ALTER TABLE Collaborators_clean_Rooms WITH CHECK ADD  CONSTRAINT FK_Hôtel_Collaborators2 FOREIGN KEY(Reservations_id)
REFERENCES Reservations(id)


ALTER TABLE Invoice_has_Services WITH CHECK ADD  CONSTRAINT FK_Hôtel_Invoice1 FOREIGN KEY(Invoice_id)
REFERENCES Invoice(id)

ALTER TABLE Invoice_has_services WITH CHECK ADD  CONSTRAINT FK_Hôtel_Services FOREIGN KEY(Services_id)
REFERENCES Services(id)

ALTER TABLE collaborators_has_clients WITH CHECK ADD  CONSTRAINT FK_Hôtels_Clients2 FOREIGN KEY(clients_invoice_id)
REFERENCES clients(Invoice_id)
ALTER TABLE Reservations WITH CHECK ADD  CONSTRAINT FK_Hôtel_clients4 FOREIGN KEY(clients_invoice_id)
REFERENCES clients(Invoice_id)
