-- Creating a movies_revenues table

CREATE TABLE movies_revenues (
	revenue_id SERIAL PRIMARY KEY,
	movie_id INT REFERENCES movies(movie_id),
	revenues_domestic NUMERIC(10,2),
	revenues_international NUMERIC(10,2)
);