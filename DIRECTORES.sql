CREATE DATABASE DIRECTORES;
USE DIRECTORES;

create table offices(
    office_id int primary key,
    office_capacity int
);

create table bosses(
    boss_dni int primary key,
    boss_name varchar(100),
    boos_last_name varchar(100)
);

create table directors(
    director_dni int primary key,
    director_name varchar(100),
    director_last_name varchar(100),
    office_id int,
    boss_dni int,
    foreign key(office_id) references offices(office_id),
    foreign key(boss_dni) references bosses(boss_dni)
);


--llena TABLAS
INSERT INTO offices(office_id, office_capacity) 
VALUES (567, 6), (123, 8), (456, 20), (789, 12);



INSERT INTO bosses(boss_dni, boss_name, boos_last_name)
VALUES (12345678, 'Juan', 'Perez'), (87654321, 'Maria', 'Gomez'), (13579246, 'Pedro', 'Lopez'), (24681357, 'Ana', 'Martinez');

INSERT INTO directors(director_dni, director_name, director_last_name, office_id, boss_dni)
VALUES (345345, 'Jimena', 'Hernandez', 567, 12345678), (876741, 'Roberto', 'Candila', 123, 87654321), (130046, 'Pedro', 'Mendía', 456, 13579246), (000357, 'Ana', 'Campos', 789, 24681357);

