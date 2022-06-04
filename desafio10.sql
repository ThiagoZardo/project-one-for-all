SELECT M.musica AS nome, COUNT(musica) AS reproducoes
FROM SpotifyClone.musicas AS M
INNER JOIN SpotifyClone.historico AS H ON H.id_musica = M.id_musica
INNER JOIN SpotifyClone.usuarios AS U ON U.id_usuario = H.id_usuario
INNER JOIN SpotifyClone.planos AS P ON U.id_plano = P.id_plano
WHERE U.id_plano = 1 || U.id_plano = 3
GROUP BY M.musica
ORDER BY M.musica;

