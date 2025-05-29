create database netflix_db;
use netflix_db;
show tables;

select * from netflix;

-- common genre count
select genres, count(*) as count
from netflix
group by 1
order by 2 desc
limit 3;

select genres, count(*) as count
from netflix
where type = "SHOW"
group by 1
order by 2 desc
limit 10;

select genres, count(*) as count
from netflix
where type = "MOVIE"
group by 1
order by 2 desc
limit 10;


-- Top movies
select title, type, imdb_score
from netflix
where imdb_score >= 8.0
order by 3 desc
limit 10;

select title, type, imdb_score
from netflix
where type = "MOVIE" and imdb_score >= 8.0
order by 3 desc
limit 10;

select title, type, imdb_score
from netflix
where type = "SHOW" and imdb_score >= 8.0
order by 3 desc
limit 10;


-- Bottome Movies
select title, type, imdb_score
from netflix
where imdb_score is not null
order by 3 
limit 10;

select title, type, imdb_score
from netflix
where type = "MOVIE" and imdb_score is not null
order by 3 
limit 10;

select title, type, imdb_score
from netflix
where type = "SHOW" and imdb_score is not null
order by 3 
limit 10;


-- Movie count by decade
select concat(floor(release_year / 10) * 10, 's') AS decade,
	count(*)  movies_shows_count
from netflix
where release_year >= 1940
group by concat(floor(release_year / 10) * 10, 's')
order by decade;


-- Average score of IMDB and TMDB by age certificate
select distinct age_certification, 
round(avg(imdb_score),2) avg_imdb_score,
round(avg(tmdb_score),2) avg_tmdb_score
from netflix
group by age_certification
order by avg_imdb_score desc;


-- Certification Count
select age_certification, count(*)  certification_count
from netflix
group by age_certification
order by certification_count desc;

select age_certification, count(*) certification_count
from netflix
where type = 'SHOW'
group by age_certification
order by certification_count desc;

select age_certification, count(*) certification_count
from netflix
where type = 'MOVIE'
group by age_certification
order by certification_count desc;