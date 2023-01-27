SELECT  DISTINCT a.artist_name AS artista, c.album_name AS album, COUNT(b.artist_id) as seguidores
FROM SpotifyClone.Artists AS a
INNER JOIN SpotifyClone.Followed_Artists as b
ON b.artist_id = a.artist_id
INNER JOIN SpotifyClone.Albuns AS c
ON c.artist_id = b.artist_id
GROUP BY c.album_name, b.artist_id
ORDER BY COUNT(b.artist_id) DESC, a.artist_name, c.album_name;