SELECT
  albums.name as Name,
  albums.release_year as releaseYear,
  SUM(songs.length) as duration
FROM albums
JOIN songs on albums.id = songs.album_id
GROUP BY albums.id
ORDER BY duration DESC
LIMIT 1;