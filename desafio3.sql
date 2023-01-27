SELECT
    t1.username AS usuario,
    COUNT(t2.song_id) AS qt_de_musicas_ouvidas,
    SUM(ROUND(t3.duration_seconds / 60, 2)) AS total_minutos
FROM SpotifyClone.Users AS t1
    INNER JOIN SpotifyClone.Playbacks_History AS t2
      ON t1.user_id = t2.user_id
    INNER JOIN SpotifyClone.Songs AS t3
      ON t3.song_id = t2.song_id
GROUP BY t1.username
ORDER BY t1.username;