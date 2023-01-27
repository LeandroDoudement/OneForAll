SELECT MIN(t1.plan_value) AS faturamento_minimo, MAX(t1.plan_value) AS faturamento_maximo, ROUND(AVG(t1.plan_value), 2) AS faturamento_medio, SUM(t1.plan_value) AS faturamento_total
FROM SpotifyClone.Plans AS t1
INNER JOIN SpotifyClone.Users AS t2
ON t2.plan_id = t1.plan_id;