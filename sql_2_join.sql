# SQL Join exercise
#
#
# 1: Get the cities with a name starting with ping sorted by their population with the least populated cities first
-- select * from city
-- where Name like "ping%"
-- order by population asc
#
# 2: Get the cities with a name starting with ran sorted by their population with the most populated cities first
-- select * from city
-- where name like "ran%"
-- order by population desc
#
# 3: Count all cities
-- select count(*) from city
#
# 4: Get the average population of all cities
-- select avg(population) from city
#
# 5: Get the biggest population found in any of the cities
-- select max(population) from city
#
# 6: Get the smallest population found in any of the cities
-- select min(population) from city
#
# 7: Sum the population of all cities with a population below 10000
-- select sum(population) from city
-- where population < 10000
#
# 8: Count the cities with the countrycodes MOZ and VNM
-- select count(*) from city
-- where CountryCode in ("MOZ", "VNM")
#
# 9: Get individual count of cities for the countrycodes MOZ and VNM
-- select count(*) from city
-- where CountryCode in ("MOZ", "VNM")
-- group by CountryCode
#
# 10: Get average population of cities in MOZ and VNM
-- select avg(Population) from city
-- where CountryCode in ("MOZ", "VNM")
-- group by CountryCode
#
# 11: Get the countrycodes with more than 200 cities
-- select distinct countrycode, count(city.name) as number_of_cities from city
-- join country
-- on CountryCode = country.Code
-- group by CountryCode
-- having number_of_cities > 200
#
# 12: Get the countrycodes with more than 200 cities ordered by city count
-- select distinct countrycode, count(city.name) as number_of_cities from city
-- join country
-- on CountryCode = country.Code
-- group by CountryCode
-- having number_of_cities > 200
-- order by number_of_cities
#
# 13: What language(s) is spoken in the city with a population between 400 and 500 ?
-- select language from countrylanguage
-- join city
-- on countrylanguage.countryCode = city.CountryCode
-- where population between 400 and 500
-- group by Language
#
# 14: What are the name(s) of the cities with a population between 500 and 600 people and the language(s) spoken in them
-- select name, language from city
-- join countrylanguage
-- on countrylanguage.CountryCode = city.CountryCode
-- where Population between 500 and 600
#
# 15: What names of the cities are in the same country as the city with a population of 122199 (including the that city itself)
-- select name from city
-- where countrycode = (select countrycode from city 
-- 						where population = 122199)

# 16: What names of the cities are in the same country as the city with a population of 122199 (excluding the that city itself)
-- select name from city
-- where countrycode = (select countrycode from city 
--  						where population = 122199) and population != 122199
#
# 17: What are the city names in the country where Luanda is capital?
-- select name from city
-- where countrycode = (select distinct code from country
-- 		join city
-- 		on city.countrycode = country.code
-- 		where capital = (select id from city where name = "Luanda"))

# 18: What are the names of the capital cities in countries in the same region as the city named Yaren
-- select city.name from city
-- join country 
-- on city.countrycode = country.code
-- 		where city.id in (select capital from country
-- 				where region = (select distinct region from country
-- 					join city
-- 					on city.countrycode = country.code
-- 					where city.Name = "Yaren"))

# 19: What unique languages are spoken in the countries in the same region as the city named Riga
select distinct language from countrylanguage
join country
on country.Code = countrylanguage.CountryCode
where region = (select distinct region from country
				join city
				on city.countrycode = country.code
					where country.code = (select
							countryCode from city
							where name = "Riga")
                            )

#
# 20: Get the name of the most populous city
-- select name, population from city
-- 	where population = (select max(population) from city) 

