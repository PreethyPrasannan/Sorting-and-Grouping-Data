-- CREATING DATABASE
create database COUNTRYPERSONS_DATA;
USE COUNTRYPERSONS_DATA;

-- CREATING COUNTRY TABLE
create table Country (
ID int primary key,
Country_name varchar(100),
Population bigint,
Area float
);

-- INSERTING VALUES TO COUNTRY TABLE
insert into Country (ID, Country_name, Population, Area)
values
(101, 'India', 1419316933, 3287263),
(102, 'China', 1407181209, 9596960),
(103, 'USA', 342034432, 9833517),
(104, 'Indonesia', 283587097, 1904569),
(105, 'Nigeria', 242794751, 1267000),
(106, 'Brazil', 221359387, 8515767),
(107, 'Bangladesh', 170183916, 1475345),
(108, 'Russia', 140134279, 17098246),
(109, 'Pakistan', 257047044, 907132),
(110, 'Mexico', 131741347, 1964375);

select * from Country;

-- CREATING TABLE PERSONS
create table Persons( 
ID int primary key,
Fname varchar(50),
Lname varchar(50),
population bigint,
Rating decimal(2,1),
Country_Id int,
Country_name varchar(100),
foreign key (Country_Id) references Country(ID)
);

-- INSERTING VALUES TO PERSONS TABLE
insert into Persons(ID, Fname, Lname, Population, Rating, Country_Id, Country_name)
values
(101, 'Smriti', 'Mandhana', 1419316933, 5, 101, 'India'),
(102, 'Devon', 'Convey', 1407181209, 4, 102, 'China'),
(103, 'Joe', 'Buttler', 342034432, 3, 103, 'USA'),
(104, 'Cristi', 'Lane', 283587097, 5, 104, 'Indonesia'),
(105, 'Niel', 'Jim', 242794751, 4, 105, 'Nigeria'),
(106, 'Jessy', 'Johanson', 221359387, 3, 106, 'Brazil'),
(107, 'Muhamadullah', 'Saiq', 170183916, 5, 107, 'Bangladesh'),
(108, 'Volga', 'Petrova', 140134279, 2, 108, 'Russia'),
(109, 'Babar', 'Azam', 257047044, 5, 109, 'Pakistan'),
(110, 'Maria', 'Martin', 131741347, 4, 110, 'Mexico');

select * from Persons;

#1. PRINT FIRST 3 CHARACTERS OF COUNTRY_NAME FROM THE COUNTRY TABLE
select LEFT(Country_name,3) as Countryprefix from Country;

#2. CONCATENATE FIRST NAME AND LAST NAME FROM PERSONS TABLE
select concat(Fname,' ',Lname) as Full_Name from persons;

#3. COUNTING THE UNIQUE COUNTRY NAMES FROM PERSONS TABLE
select count(distinct Country_name) as Unique_countries from Persons;

#4. MAXIMUM POPULATION FROM THE COUNTRY TABLE
select max(Population) as Max_population from Country;

#5. MINIMUM POPULATION FROM PERSONS TABLE
select min(population) as Minimum_population from persons;

#6. ADDING 2 VALUES TO PERSONS TABLE WITH NULL Lname
insert into Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name)
values
(11, 'Lucas', NULL, 50000000, 3, 1, 'USA'),
(12, 'Sophia', NULL, 70000000, 4, 2, 'Canada');

-- COUNT LNAME FROM PERSON TABLE
select count(Lname) as Lname_count from persons;

#7. TOTAL NUMBER OF ROWS IN PERSONS TABLE
select count(*) as Total_Rows from persons;

#8. POPULATION OF FIRST 3 ROWS IN COUNTRY TABLE
select Population from Country limit 3;

#9. 3 RANDOM ROWS OF COUNTRY TABLE
select * from Country order by rand() limit 3;

#10. PERSONS ORDERED BY THEIRRATING IN DESCENDING ORDER
SELECT * FROM PERSONS order by rating desc;

#11. TOTAL POPULATION FOR EACH COUNTRY IN PERSONS TABLE
SELECT Country_name, sum(population) as Total_Population from persons
group by Country_name;

#12. COUNTRIES WITH TOTTAL POPULATION GREATER THAN 50000
select Country_name,sum(population) as Total_Population from persons
group by Country_name having sum(Population) > 50000;

#13. TOTAL NUMBER OF PERSONS AND AVERAGE RATE OF EACH COUNTY,ONLY FOR COUNTRIES WITH MORE THAN 2 PERSONS
select Country_name, count(*) as Total_persons, avg(Rating) as avg_rating
from persons
group by Country_name having count(*)>2
order by avg_rating asc;