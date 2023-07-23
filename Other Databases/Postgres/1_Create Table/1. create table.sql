-- Create the actor table
-- function: CREATE TABLE
-- movies/postgres@PostgreSQL

CREATE TABLE actors (
	actor_id SERIAL PRIMARY KEY, -- SERIAL -> increase by 1
	first_name VARCHAR(150),
	last_name VARCHAR(150) NOT NULL,
	gender CHAR(1),
	date_of_birth DATE,
	add_date DATE,
	update_date DATE
);


CREATE TABLE directors (
    director_id SERIAL PRIMARY KEY,
    first_name VARCHAR(150),
    last_name VARCHAR(150),
    date_of_birth DATE,
    nationality VARCHAR(20),
    add_date DATE,
    update_date DATE
);

select * from directors;