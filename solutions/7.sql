UPDATE albums
SET release_year = '1986'
WHERE albums.id = (SELECT id FROM albums WHERE release_year IS NULL LIMIT 1);

/*
UPDATE albums
SET release_year = 1986
WHERE release_year IS NULL;
*/