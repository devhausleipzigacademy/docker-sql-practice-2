SELECT bands.name AS bandName
FROM bands
LEFT JOIN albums ON bands.id = albums.band_id
WHERE albums.id IS NULL;


/*
SELECT bands.name AS bandName
FROM bands
LEFT JOIN albums ON bands.id = albums.band_id
GROUP BY bands.id
HAVING COUNT(albums.id) = 0;
*/