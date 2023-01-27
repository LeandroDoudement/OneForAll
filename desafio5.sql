SELECT t1.song_name AS cancao, COUNT(t2.user_id) AS reproducoes 
FROM SpotifyClone.Songs AS t1
INNER JOIN SpotifyClone.Playbacks_History AS t2
ON t1.song_id = t2.song_id
GROUP BY t1.song_name
ORDER BY COUNT(user_id) DESC, song_name
LIMIT 2;