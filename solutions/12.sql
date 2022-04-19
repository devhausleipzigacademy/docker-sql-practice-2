SELECT
  bands.name AS band,
  COUNT(songs.id) AS numberOfSongs
FROM bands
JOIN albums ON bands.id = albums.band_id
JOIN songs ON albums.id = songs.album_id
GROUP BY bands.id