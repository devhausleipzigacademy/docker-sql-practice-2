
/* This assumes all bands have a unique name */
SELECT DISTINCT bands.name AS bandName
FROM bands
JOIN albums ON bands.id = albums.band_id;

/* If bands do not have a unique name then use this query */
/* 
  SELECT bands.name AS bandName
  FROM bands
  JOIN albums ON bands.id = albums.band_id
  GROUP BY bands.id
  HAVING COUNT(albums.id) > 0;
*/