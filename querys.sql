
USE directores;



-- 1. Show the ID, name and surname of all directors.
select director_dni, director_name, director_last_name from directors;

-- 2. Show the data of the directors who do not have bosses.
select * from directors where boss_dni is null;

-- 3. Show the name and surname of each director, together with the capacity of the office in which it is located.
select directors.director_name, directors.director_last_name, directors.office_id, offices.office_capacity from directors, offices
where directors.office_id = offices.office_id;

-- 4. Show the number of directors in each office.
select office_id, count(*) as directors_in_office
from directors
group by office_id;

-- 5. Show data for directors whose bosses have no bosses.
select * from directors
where boss_dni in
(select director_dni from directors where boss_dni is null);

-- 6. Show the names and surnames of the directors together with those of their boss.
select directors.director_name, directors.director_last_name, bosses.boss_name, bosses.boos_last_name
from directors
inner join bosses on directors.boss_dni = bosses.boss_dni;

-- 7. Show the number of offices that are overused.
select office_id from offices
where office_capacity <(
    select count(*)
    from directors
    where directors.office_id = offices.office_id
);

-- 8. Add a new director named Paco P�rez, DNI 28301700, without a boss, and located in office 124.
insert into directors(director_dni, director_name, director_last_name, office_id) values(28301700, 'Paco', 'P�rez', 123);

-- 9. Assign a new boss with DNI 74568521 to all employees named P�rez.

INSERT INTO bosses(boss_dni, boss_name, boos_last_name) VALUES (74568521, 'christian', 'can');
UPDATE directors SET boss_dni = 74568521 WHERE director_last_name = 'P�rez';
SELECT * FROM directors;

-- 10. Fire all directors, except those without a boss.
delete from directors where boss_dni is not null;
SELECT * FROM directors;


