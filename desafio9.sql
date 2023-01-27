SELECT COUNT(a.user_id) AS quantidade_musicas_no_historico
FROM SpotifyClone.Playbacks_History AS a
INNER JOIN SpotifyClone.Users as b
ON a.user_id = b.user_id
WHERE b.username = 'Barbara Liskov';