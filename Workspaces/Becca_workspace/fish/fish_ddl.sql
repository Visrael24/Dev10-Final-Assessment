--fish_data database

use master;
go

drop database if exists fish_data;
Go
create database fish_data;
go
use fish_data;
go

--create denormalized table
--import csv into denormalized table


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

drop table if exists CountryAndFishFacts;
go

create table CountryAndFishFacts (
    FishFactID int primary key identity(1,1),
    Year int not null,
    FishConsumedkg float not null,
    FishProducedtons int not null,
    Population int not null,
    LifeExpectancy float null,
    CountryID int not null
    constraint fk_CountryAndFishFacts_CountryID
        foreign key (CountryID)
        references Countries(CountryID)
    constraint uq_CountryAndFishFacts_Year_FishConsumedkg_FishProducedtons_LifeExpectancy_CountryID
        unique (Year, FishConsumedkg, FishProducedtons, LifeExpectancy, CountryID)
);
go

