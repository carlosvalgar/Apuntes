/* CREATE DATABASE mer_aulas;
*/ 
CREATE TABLE Students (
DNI VARCHAR(8) PRIMARY KEY,
FirstName VARCHAR(20),
LastName VARCHAR (20),
Course VARCHAR (20),
Studies VARCHAR (20));

CREATE TABLE Computers (
Hostname VARCHAR(20) PRIMARY KEY,
MAC INT,
IP INT,
CPU INT,
Memory INT);

CREATE TABLE Classrooms (
Name VARCHAR (20) PRIMARY KEY,
Capacity INT,
Size INT,
Projector VARCHAR(20),
AirConditioner VARCHAR(20),
ComputersHostname VARCHAR(20),
CONSTRAINT fk_Computers
FOREIGN KEY (ComputersHostname)
REFERENCES Computers(Hostname));

CREATE TABLE StudentComputers (
StudentDNI VARCHAR(8),
ComputersHostname VARCHAR(20),
CONSTRAINT fk_Computers2
FOREIGN KEY (ComputersHostname)
REFERENCES Computers(Hostname),
CONSTRAINT fk_Stundent
FOREIGN KEY (StudentDNI)
REFERENCES Students(DNI));