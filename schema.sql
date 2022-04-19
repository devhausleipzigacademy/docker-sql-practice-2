CREATE TABLE bands (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);

CREATE TABLE albums (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  release_year INT,
  band_id INT NOT NULL REFERENCES bands(id)
);