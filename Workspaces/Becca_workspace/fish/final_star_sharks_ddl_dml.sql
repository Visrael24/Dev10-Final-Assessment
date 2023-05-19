
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

--insert into tables

--continents
insert into Continents ([ContinentName])
    select distinct continent
    from TempFishAndCountry;
go


--countries
insert into Countries (CountryCode, CountryName, ContinentID)
    select distinct temp.Code, temp.Entity, c.ContinentID
    from Continents c 
    inner join TempFishAndCountry temp 
    on c.ContinentName = temp.continent;
go


--CountryAndFishFacts

insert into CountryAndFishFacts (Year, FishConsumedkg, FishProducedtons, Population, LifeExpectancy, CountryID)
    select 
        temp.Year,
        temp.kg_per_yr_per_capita,
        temp.Production_in_tons,
        temp.Population_historical_estimates,
        temp.Life_Expectancy_years,
        c.CountryID
        from TempFishAndCountry temp 
        join Countries c 
        on c.CountryName = temp.Entity;
go
