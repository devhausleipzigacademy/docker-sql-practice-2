SELECT
  albums.name AS album,
  albums.release_year AS releaseYear,
  MAX(songs.length) AS duration
FROM albums
JOIN songs ON albums.id = songs.album_id
GROUP BY albums.id;