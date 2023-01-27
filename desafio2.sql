SELECT COUNT(t1.song_id) AS cancoes, COUNT(t2.artist_id) AS artistas, COUNT(t3.album_id) AS albuns
FROM SpotifyClone.Songs AS t1
LEFT JOIN SpotifyClone.Artists AS t2
ON t1.song_id = t2.artist_id
LEFT JOIN SpotifyClone.Albuns AS t3
ON t1.song_id = t3.album_id;