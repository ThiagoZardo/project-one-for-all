SELECT U.usuario AS usuario,
COUNT(*) AS qtde_musicas_ouvidas,
ROUND(SUM(M.duracao / 60), 2) AS total_minutos
FROM SpotifyClone.usuarios AS U
INNER JOIN SpotifyClone.historico AS H ON U.id_usuario = H.id_usuario
INNER JOIN SpotifyClone.musicas AS M ON M.id_musica = H.id_musica
GROUP BY U.usuario;