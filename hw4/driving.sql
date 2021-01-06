-- Part 2 A
DROP TABLE IF EXISTS Drives;
DROP TABLE IF EXISTS Truck;
DROP TABLE IF EXISTS Car;
DROP TABLE IF EXISTS ProfessionalDriver;
DROP TABLE IF EXISTS NonProfessionalDriver;
DROP TABLE IF EXISTS Driver;
DROP TABLE IF EXISTS Vehicle;
DROP TABLE IF EXISTS Person;
DROP TABLE IF EXISTS InsuranceCo;




CREATE TABLE InsuranceCo (
    name varchar(128) PRIMARY KEY,
    phone varchar(15)
);


CREATE TABLE Person (
    ssn int PRIMARY KEY,
    name varchar(128)
);

CREATE TABLE Vehicle (
    licensePlate varchar(20) PRIMARY KEY,
    maxLiability int,
    year int,
    insuranceName varchar(128) REFERENCES InsuranceCo,
    ownerSsn int REFERENCES Person   
);



CREATE TABLE Driver (
    ssn int PRIMARY KEY REFERENCES Person,
    driverID int,
);

CREATE TABLE NonProfessionalDriver (
    ssn int PRIMARY KEY REFERENCES Driver,
);

CREATE TABLE ProfessionalDriver (
    ssn int PRIMARY KEY REFERENCES Driver,
    medicalHistory varchar(256)
);

CREATE TABLE Car (
     licensePlate varchar(20) PRIMARY KEY REFERENCES Vehicle,
     make varchar(128)
);

CREATE TABLE Drives (
    dssn int REFERENCES NonProfessionalDriver,
    licensePlate varchar(20) REFERENCES Car,
    PRIMARY KEY (dssn, licensePlate)
);

CREATE TABLE Truck (
     licensePlate varchar(20) PRIMARY KEY REFERENCES Vehicle,
     capacity int,
     dssn int REFERENCES NonProfessionalDriver
);

--Part b
/*
Insures is a one to many raltions, I repesented it by having a insuranceName atributes in vehicle 
thats refers to InsuranceCo, since one car can only has one liability value, this part of te relation 
is made one of vehicle's attribute
*/

--Part C
/*
Drives is many to many, hence a separate table is needed while operate is ,many to one.,
it is represented by dssn in  Truck, having a foreign key to NonProfessionalDriver
*/
