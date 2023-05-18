--insert into tables

--continents
insert into Continents ([ContinentName])
    select distinct Continent
    from TempFishAndCountry;

--countries
insert into Countries ([CountryCode, CountryName, ContinentID])

--test first before inserting
select temp.CountryCode, temp.CountryName, c.ContinentID
from Continents c 
inner join TempFishAndCountry temp 
on c.ContinentName = temp.Continent;


select 
    temp.Year,
    temp.kg_per_year_per_capita,
    temp.production_in_tons,
    temp.Population,
    temp.LifeExpectancy,
    c.CountryID
    from TempFishAndCountry temp 
    join Countries c 
    on c.CountryName = temp.CountryName;