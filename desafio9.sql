SELECT COUNT(musica) AS quantidade_musicas_no_historico
FROM SpotifyClone.musicas AS M
INNER JOIN SpotifyClone.historico AS H ON H.id_musica = M.id_musica
INNER JOIN SpotifyClone.usuarios AS U ON U.id_usuario = H.id_usuario
WHERE usuario = "Bill";