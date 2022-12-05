Create TABLE Breweries_record (
    Sales_id Numeric,
	Sales_rep Varchar(255),
	Emails Varchar(255),
	Brands Varchar(255),
	Plant_cost Numeric,
	Unit_price  Numeric,
	Quantity Numeric,
	Costs Numeric,
	Profit Numeric,
	Countries Varchar(50),
	Region Varchar(255),
	Months Varchar(50),
	Years  Numeric,
	Languages Varchar(255),
	Territories Varchar(50)
);

Select * From Breweries_record

Copy breweries_record
from 'C:\Users\Dell\Downloads\Telegram Desktop\International_Breweries (1) (1).csv'Delimiter','

--Within the space of the last three years, what was the profit worth of the breweries, inclusive of the anglophone and the francophone territories?

SELECT Years, SUM(profit) AS Total_profit
FROM breweries_record
GROUP BY Years
ORDER BY SUM(profit) DESC

--Compare the total profit between these two territories in order for the territory manager, Mr. Stone made a strategic decision that will aid profit maximization in 2020.

SELECT Territories, SUM(profit) AS Territories_profit
FROM breweries_record
GROUP BY Territories
ORDER BY SUM(profit) DESC

--Country that generated the highest profit in 2019

SELECT Breweries_record.countries, SUM(profit), years AS countries_profit
FROM breweries_record
WHERE years=2019
GROUP BY Countries,years
ORDER BY SUM(profit) DESC

--Help him find the year with the highest profit.

SELECT years, SUM(profit) AS highest_profit
FROM breweries_record
GROUP BY years
ORDER BY SUM(profit) DESC

--Which month in the three years was the least profit generated?

SELECT months,years, SUM(profit) AS months_profit
FROM breweries_record
GROUP BY months,years
ORDER BY SUM(profit) ASC

--What was the minimum profit in the month of December 2018?

SELECT months, MIN(profit) AS minimum_profit
FROM breweries_record
WHERE years=2018 
GROUP BY months
ORDER BY MIN(profit) 

--Compare the profit in percentage for each of the month in 2019

SELECT months, (profit*.01) AS percent_profit
FROM breweries_record
WHERE years=2019
GROUP BY months,Profit
ORDER BY (profit*.01) DESC

--Which particular brand generated the highest profit in Senegal?

SELECT Brands, SUM(PROFIT) AS Brand_profit
FROM breweries_record
WHERE Countries = 'Senegal'
GROUP BY Brands	
ORDER BY SUM(profit) DESC

--Within the last two years, the brand manager wants to know the top three brands consumed in the francophone countries

SELECT brands, quantity, years, Territories
FROM breweries_record
WHERE Territories = 'Francophone' AND years BETWEEN 2018 AND 2019
group by brands,quantity,years, Territories
ORDER BY quantity DESC
limit 3

--Find out the top two choice of consumer brands in Ghana

SELECT brands, quantity
FROM breweries_record
where countries = 'Ghana'
GROUP BY brands,quantity
order by quantity DESC
LIMIT 2

--Find out the details of beers consumed in the past three years in the most oil rich country in West Africa.

SELECT brands,quantity
FROM breweries_record
where countries = 'Nigeria'
GROUP BY brands,quantity
order by quantity desc

--Favorites malt brand in Anglophone region between 2018 and 2019

SELECT brands,quantity
FROM breweries_record
where Brands like '%malt'
    and territories = 'anglophone'
    and years between 2018 and 2019
GROUP BY brands,quantity
order by quantity desc

--Which brands sold the highest in 2019 in Nigeria?

SELECT brands,quantity
FROM breweries_record
where countries = 'Nigeria'
GROUP BY brands,quantity
order by quantity DESC

--Favorites brand in South South region in Nigeria

SELECT brands,quantity
FROM breweries_record
where countries = 'Nigeria' and region='southsouth'
GROUP BY brands,quantity
order by quantity DESC

--Level of consumption of Budweiser in the regions in Nigeria

SELECT brands,quantity
FROM breweries_record
where countries = 'Nigeria' and brands = 'budweiser'
GROUP BY brands,quantity
order by quantity DESC

--Level of consumption of Budweiser in the regions in Nigeria in 2019

SELECT brands,quantity,region
FROM breweries_record
where countries = 'Nigeria' and years=2019
GROUP BY brands,quantity,region
order by quantity DESC

--GEO-LOCATION ANALYSIS

--Country with the highest consumption of beer.

SELECT countries, sum(quantity)
FROM breweries_record
GROUP BY countries,quantity
order by sum(quantity) DESC

--Highest sales personnel of Budweiser in Senegal

SELECT sales_rep, quantity
FROM breweries_record
WHERE brands = 'budweiser' and countries ='Senegal'
GROUP BY sales_rep,quantity
order by quantity DESC

--Country with the highest profit of the fourth quarter in 2019

SELECT countries, sum(profit)
FROM breweries_record
WHERE years = 2019 and months between 'October'  and 'December'
GROUP BY countries
order by sum(profit) DESC

