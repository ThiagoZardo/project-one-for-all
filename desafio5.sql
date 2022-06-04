SELECT M.musica AS cancao,
COUNT(H.data_reproducao) AS reproducoes
FROM SpotifyClone.musicas AS M
INNER JOIN SpotifyClone.historico AS H ON M.id_musica = H.id_musica
GROUP BY M.musica
ORDER BY reproducoes DESC, cancao LIMIT 2;