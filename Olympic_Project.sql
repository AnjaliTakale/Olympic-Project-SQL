create database prj;
use prj;

-- this is used show the path of this file
show variables like "secure_file_priv";

create table olympics1
(
ID int,
Name varchar(500),
Sex varchar(10),
Age int,
Height int,
Weight int,
Team varchar(500),
NOC varchar(500),
Games varchar (500),
Year int,
Season varchar(500),
City varchar(200),
Sport varchar(300),
Event varchar(800),
Medal varchar(200)
);

load data infile "C:/ProgramData/MySQL/MySQL Server 9.0/Uploads/Athletes_Transformed.csv"
into table olympics1
fields terminated by ','
enclosed by '"'
lines terminated by '\r\n'
ignore 1 rows;

select * from olympics1;

-- SQL PROJECT

-- 1. Show how many medal counts present for entire data
select Medal,count(Medal) as Medal_count
from olympics1
where Medal <>'NoMedal'
group by Medal;

-- 2. Show count of unique sports present in Olympics
select count(distinct(sport))
from olympics1;

-- 3. Show how many different medals won by team India
select medal,count(medal)from olympics1
where team='india'
group by medal;

-- 4. Show event wise medals won by India show from highest to lowest medals won in order
select event,medal,count(event) as countevent
from olympics1
where team='india' 
group by event,medal
order by countevent desc;

-- 5. Show event wise medals won by India in order of year
select event,medal,year from olympics1
where team='india'
group by event,medal,year
order by year;

-- 6. show country who won maximum medals.
select noc,count(medal) as countmedal,max(medal) as maxmedal
from olympics1
where medal<>'nomedal'
group by noc,medal
order by maxmedal,countmedal desc;

-- 7.show top 10 countries who won gold
select noc from olympics1
where medal='gold'
group by noc
limit 10;

--  8. show in which year did United states won most gold medal
select count(medal) as countmedal,year from olympics1
where noc='usa' and medal='gold'
group by year,medal
order by countmedal desc;

-- 9. In which sports United States has most medals.
select sport,count(medal) as countmedal from olympics 
where noc='usa'
group by sport;

-- 10. Find top three players who won most medals along with their sports and country
select name,noc,sport,max(medal) as maxmedal
from olympics1
where medal<>'nomedal'
group by name,noc,sport
order by maxmedal desc
limit 3;

-- 11. Find player with most gold medals in cycling along with his country.
select name,noc
from olympics1
where medal='gold' and sport='cycling'
group by name,noc;

-- 12.Find player with most medals (Gold+Silver+Bronze) in Basketball also show his country.
select name,noc,medal
from olympics1
where medal<>'nomedal' and sport='basketball'
group by name,noc,medal;

-- 13. Find out the count of different medals of the top basketball player Teresa Edwards
select Medal,count(Medal) as Medal_count
from olympics1
where sport='basketball' and name='teresa edwards'
group by Medal;

-- 14. Find out medals won by male,female each year , Export this data and plot graph in excel
select sex,medal,year
from olympics1
where medal<>'nomedal' 
group by sex,medal,year;