SELECT t1.username AS usuario, IF(YEAR(MAX(t2.playback_data)) >= 2021), 'Usuário ativo', 'Usuário inativo') AS status_usuario
FROM SpotifyClone.Users AS t1
INNER JOIN SpotifyClone.Playbacks_History AS t2
ON t1.user_id = t2.user_id
GROUP BY t1.username
ORDER BY t1.username;