SELECT artista AS artista,
A.album AS album,
COUNT(S.id_artista) AS seguidores
FROM SpotifyClone.artistas AS Art
INNER JOIN SpotifyClone.albums AS A ON Art.id_artista = A.id_artista
INNER JOIN SpotifyClone.seguidores AS S ON S.id_artista = Art.id_artista
GROUP BY artista, album
ORDER BY seguidores DESC, artista, album;