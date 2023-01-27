SELECT a.song_name AS nome, COUNT(b.user_id) AS reproducoes
FROM SpotifyClone.Songs AS a
INNER JOIN SpotifyClone.Playbacks_History AS b 
ON b.song_id = a.song_id
INNER JOIN SpotifyClone.Users AS c
ON b.user_id = c.user_id
WHERE c.plan_id = 1 OR c.plan_id = 4
GROUP BY a.song_name
ORDER BY a.song_name;