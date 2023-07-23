-- movies will have directors
CREATE TABLE movies(
    movie_id SERIAL PRIMARY KEY,
    movie_name VARCHAR(100) NOT NULL,
    movie_length INT,
    movie_lang VARCHAR(20),
    age_certificate VARCHAR(10),
    release_date DATE,
    director_id INT REFERENCES directors(director_id)
);

-- Creating a movies_revenues table

CREATE TABLE movies_revenues (
	revenue_id SERIAL PRIMARY KEY,
	movie_id INT REFERENCES movies(movie_id),
	revenues_domestic NUMERIC(10,2),
	revenues_international NUMERIC(10,2)
);