--insert into tables

--continents
insert into Continents ([ContinentName])
    select distinct continent
    from TempFishAndCountry;


--countries
insert into Countries (CountryCode, CountryName, ContinentID)
    select distinct temp.Code, temp.Entity, c.ContinentID
    from Continents c 
    inner join TempFishAndCountry temp 
    on c.ContinentName = temp.continent;


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
