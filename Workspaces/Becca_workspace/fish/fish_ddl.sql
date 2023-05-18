--testing sql code

use master;
go

drop database if exists Fish;
Go
create database Fish;
go
use Fish;
go

--create denormalized table

drop table TempFishAndCountry;

--create tables

create table Continents (
    ContinentID int primary key identity(1,1),
    ContinentName varchar(50) not null
    constraint uq_Continents_ContinentName
        unique (ContinentName)
);
go 

create table Countries (
    CountryID int primary key identity(1,1),
    CountryCode varchar(3) not null,
    CountryName varchar(75) not null,
    ContinentID int not null
    constraint fk_Countries_ContinentID
        foreign key (ContinentID)
        references Continents(ContinentID),
    constraint uq_Countries_CountryName
        unique (CountryName)
);
go 

create table CountryAndFishFacts (
    FishFactID int primary key identity(1,1),
    Year int not null,
    FishConsumedkg decimal (7,4) not null,
    FishProducedtons int not null,
    Population int not null,
    LifeExpectancy decimal (4,2),
    CountryID int not null
    constraint fk_CountryAndFishFacts_CountryID
        foreign key (CountryID)
        references Countries(CountryID)
    constraint uq_CountryAndFishFacts_Year_FishConsumedkg_FishProducedtons_LifeExpectancy_CountryID
        unique (Year, FishConsumedkg, FishProducedtons, LifeExpectancy, CountryID)
);
go