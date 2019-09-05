create database BeMyNeighbor
go

create schema Users
go

create schema Posts
go

create schema Communities
go

create schema Tasks
go

create schema Evaluation
go

create schema [Location]
go

create table [Location].[Address](

    AddressID int not null IDENTITY(300,1),
    StreetName NVARCHAR(50) not null,
    City NVARCHAR(25) not null,
    StateProvince NVARCHAR (20) not null,
    Zipcode int not null
);

alter table [Location].[Address]
    add CONSTRAINT Address_PK PRIMARY KEY (AddressID);


create table [Users].[User](
    UserID int not null IDENTITY (1,1),
    CommunityID int not null,
    Firstname nvarchar(25) not null,
    Lastname nvarchar(25) not null,
    Username nvarchar (25) not null,
    HashedPassword nvarchar(max) not null,
    SeedPassword nvarchar(max) not null,
    VerifiedUser bit not null,
    NubmerOfPoints int not null,
    Email nvarchar(50) not null unique,
    AddressID int not null
);

alter table [Users].[User]
    add CONSTRAINT User_PK PRIMARY KEY (UserID);

alter table [Users].[User]
    add CONSTRAINT User_Address_FK FOREIGN KEY (AddressID) REFERENCES [Location].[Address] (AddressID);   
