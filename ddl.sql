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

create table [Communities].[Community](
  CommunityID int IDENTITY(1,1),
  CommunityName nvarchar(50) not null, 
  GeoLocation nvarchar(30) not null,
  Radius decimal(5,2) not null
)

alter table [Communities].[Community]
  add CONSTRAINT Community_PK PRIMARY KEY (CommunityID);

create table [Posts].[Post](
  PostID int IDENTITY(1,1),
  GeoLocationID int not null,
  CommunityID int not null, 
  DatePosted DATETIME2 not null, 
  TaskTypeID int not null
);

alter table [Posts].[Post]
  add CONSTRAINT Post_PK PRIMARY KEY (PostID);

alter table [Posts].[Post]
  add CONSTRAINT CommunityID_FK FOREIGN KEY (CommunityID) REFERENCES [Communities].[Community] (CommunityID);

alter table [Posts].[Post]
  add CONSTRAINT GeoLocation_FK FOREIGN KEY (GeoLocationID) REFERENCES [Location].[GeoLocation] (GeoLocationID);


alter table [Communities].[Community] add Radius decimal(5,2) not null

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Location].[GeoLocation](
	[GeoLocationID] [int] IDENTITY(30,1) NOT NULL,
	[Latitude] [decimal](12, 9) NOT NULL,
	[Longitude] [decimal](12, 9) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [Location].[GeoLocation] ADD  CONSTRAINT [Geo_Location_PK] PRIMARY KEY CLUSTERED 
(
	[GeoLocationID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY]
GO
