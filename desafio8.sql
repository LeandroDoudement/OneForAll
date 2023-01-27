SELECT a.artist_name AS artista, b.album_name AS album
FROM SpotifyClone.Artists AS a
INNER JOIN SpotifyClone.Albuns AS b
ON a.artist_id = b.artist_id
WHERE a.artist_name = 'Elis Regina'
ORDER BY b.album_name;