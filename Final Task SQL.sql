-- 1
select mov_title, mov_year from movie;

-- 2
select mov_year from movie where mov_title = 'American Beauty';

-- 3
select mov_title from movie where mov_year = 1999;

-- 4
select mov_title from movie where mov_year < 1998;

-- 5
select mov_title, 'Movie' from movie
union
select rev_name, 'Reviwer' from reviewer

-- 6

select * from reviewer re
inner join rating ra on re.rev_id=ra.rev_id
where rev_stars >= 7;

-- 7
select mov_title 'Movie without rating' from movie m
inner join rating ra on m.mov_id=ra.mov_id
where rev_stars is NULL OR rev_stars = 0;

-- 8
select  mov_title from movie
where mov_id in (905, 907, 917);

-- 9
release year.
select mov_id, mov_title, mov_year from movie
where mov_title like '%Boogie Nights%'
order by mov_year asc;

-- 10
select act_id from actor
where act_fname = 'Woody' and act_lname = 'Allen';


-----Subqueires 

-- 1
select * from actor
where act_id in
(select act_id from movie_cast where mov_id in (select mov_id from movie where mov_title = 'Annie Hall'));

-- 2
select dir_fname 'First Name', dir_lname 'Last Name' from director
where dir_id in (select dir_id from movie_direction where mov_id in
(select mov_id from movie where mov_title = 'Eyes Wide Shut'));

-- 3
select mov_title, mov_year mov_time, mov_dt_rel, mov_rel_country from movie
where mov_rel_country != 'UK';

-- 4
select distinct m.mov_title, m.mov_year, m.mov_dt_rel, d.dir_fname, d.dir_lname, a.act_fname, a.act_lname
from movie m, actor a, director d, reviewer r, rating ra
where m.mov_id=ra.mov_id and ra.rev_id=r.rev_id and r.rev_name is null
(select mov_id from rating where rev_id in (select rev_id from reviewer where rev_name = ' '));

-- 5
select mov_title from movie
where mov_id in (select mov_id from movie_direction where dir_id in
(select dir_id from director where dir_fname = 'Woody' and dir_lname = 'Allen'));

-- 6
select mov_year from movie m
where m.mov_id in (select mov_id from rating where rev_stars > 3)
group by mov_year

-- 7
select mov_title from movie m
where m.mov_id in (select mov_id from rating where rev_stars = 0 or rev_stars is null)
or m.mov_id not in (select mov_id from rating);

-- 8
select rev_name from reviewer
where rev_id not in (select rev_id from rating)

-- 9
select (select r.rev_name from reviewer r where r.rev_id=ra.rev_id) 'Reviewer Name',
		(select m.mov_title from movie m where m.mov_id=ra.mov_id) 'Movie Name',
		(select ra.rev_stars from reviewer r where r.rev_id=ra.rev_id) 'Review Star'
		from rating ra
where ra.mov_id not in (select mov_id from rating where rev_stars is not null or rev_stars > 0);

-- 10
select (select r.rev_name from reviewer r where r.rev_id=ra.rev_id) 'Reviewer Name',
		(select m.mov_title from movie m where m.mov_id=ra.mov_id) 'Movie Name'
		from rating ra
where ra.rev_id in (select ra.rev_id from rating ra group by ra.rev_id having COUNT(ra.mov_id) > 1);

-- 11
select m.mov_title, MAX(r.rev_stars) max_rating from movie m, rating r 
where r.rev_stars is not null and m.mov_id in (select mov_id from movie where mov_id = r.mov_id)
group by m.mov_title
order by m.mov_title;


-- 12
select r.rev_name from reviewer r
where r.rev_id in
(select rev_id from rating where mov_id = (select mov_id from movie where mov_title = 'American Beauty'));

-- 13
select mov_title from movie
where mov_id in
(select mov_id from rating where rev_id in (select rev_id from reviewer where rev_name != 'Paul Monks'));

-- 14
select (select r.rev_name from reviewer r where r.rev_id=ra.rev_id) 'Reviwer Name',
		(select m.mov_title from movie m where m.mov_id=ra.mov_id) 'Movie Title',
		(select ra.rev_stars from rating ra) 'Rating Stars'
		from rating ra
where rev_id = (select MIN(rev_stars) from rating);

-- 15 
select mov_title from movie
where mov_id in
(select mov_id from movie_direction where dir_id in
(select dir_id from director where dir_fname+' '+dir_lname = 'James Cameron'));

-- 16
select mov_title from movie
where mov_id in (select mov_id from movie_cast where act_id in
(select act_id from movie_cast group by act_id having count(mov_id) > 1));



----Joins


-- 1
select rev_name from reviewer r
inner join rating ra on r.rev_id=ra.rev_id
where ra.rev_stars is null;

-- 2
select a.act_fname, a.act_lname from actor a
inner join movie_cast mc on a.act_id=mc.act_id
inner join movie m on m.mov_id=mc.mov_id
where m.mov_title = 'Annie Hall';

-- 3
select d.dir_fname, d.dir_lname, m.mov_title from director d
inner join movie_direction md on d.dir_id=md.dir_id
inner join movie m on m.mov_id=md.mov_id
where m.mov_title = 'Eyes Wide Shut';

-- 4
select d.dir_fname, d.dir_lname, m.mov_title from director d
inner join movie_direction md on d.dir_id=md.dir_id
inner join movie_cast mc on md.mov_id=mc.mov_id
inner join movie m on m.mov_id=mc.mov_id
where mc.role='Sean Maguire'

-- 5
select a.act_fname, a.act_lname, m.mov_title, m.mov_year from actor a
inner join movie_cast mc on a.act_id=mc.act_id
inner join movie m on mc.mov_id=m.mov_id
where m.mov_year not between 1990 and 2000;

-- 6
select d.dir_fname, d.dir_lname, count(mg.gen_id) 'Number of Genres Movie' from director d
inner join movie_direction md on d.dir_id=md.dir_id
inner join movie_genres mg on md.mov_id=mg.mov_id
inner join genres g on mg.gen_id=g.gen_id
group by d.dir_fname, d.dir_lname,g.gen_title
order by d.dir_fname,d.dir_lname;

-- 7
select m.mov_title, m.mov_year, g.gen_title from movie m
inner join movie_genres mg on m.mov_id=mg.mov_id
inner join genres g on mg.gen_id=g.gen_id;

-- 8
select m.mov_year, g.gen_title, d.dir_fname+' '+d.dir_lname 'Director' from movie m
left join movie_genres mg
on m.mov_id=mg.mov_id
left join genres g
on mg.gen_id=g.gen_id
left join movie_direction md
on m.mov_id=md.mov_id
left join director d
on md.dir_id=d.dir_id;

-- 9
select m.mov_title, m.mov_year, m.mov_time, d.dir_fname, d.dir_lname from movie m
inner join movie_direction md
on m.mov_id=md.mov_id
inner join director d
on md.dir_id=d.dir_id
where m.mov_year < 1989;

-- 10
select g.gen_title, avg(m.mov_time) 'Average Time', count(m.mov_id) 'Number of movies' from genres g
inner join movie_genres mg
on g.gen_id=mg.gen_id
inner join movie m
on mg.mov_id=m.mov_id
group by g.gen_title;

-- 11
select m.mov_title, m.mov_year, d.dir_fname+' '+d.dir_lname 'Director Name',
a.act_fname+' '+a.act_lname 'Actor Name', mc.role from movie m
inner join movie_direction md
on m.mov_id=md.mov_id
inner join director d
on md.dir_id=d.dir_id
inner join movie_cast mc
on m.mov_id=mc.mov_id
inner join actor a
on mc.act_id=a.act_id
where m.mov_time = (select MIN(m.mov_time) from movie m);

-- 12
select distinct m.mov_year from movie m
inner join rating r
on m.mov_id=r.mov_id
where r.rev_stars between 3 and 4;

-- 13
select r.rev_name 'Reviwers Name', m.mov_title 'Movie Title', ra.rev_stars 'Review Stars' from reviewer r
inner join rating ra
on r.rev_id=ra.rev_id
inner join movie m
on ra.mov_id=m.mov_id
order by r.rev_name asc, m.mov_title asc, ra.rev_stars asc;

-- 14
select m.mov_title, ra.rev_stars from movie m
inner join rating ra
on m.mov_id=ra.mov_id
where ra.num_o_ratings > 0
order by m.mov_title;

-- 15
select m.mov_title, d.dir_fname+' '+d.dir_lname 'Director Name', ra.rev_stars from movie m
inner join rating ra
on m.mov_id=ra.mov_id
left join movie_direction md
on m.mov_id=md.mov_id
left join director d
on d.dir_id=md.dir_id
where ra.num_o_ratings > 0;

-- 16
select m.mov_title, a.act_fname+' '+a.act_lname, mc.role from movie m
inner join movie_cast mc
on m.mov_id=mc.mov_id
inner join actor a
on a.act_id=mc.act_id
where a.act_id = (select act_id from movie_cast group by act_id having count(mov_id) > 1);