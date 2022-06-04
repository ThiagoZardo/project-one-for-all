SELECT Art.artista AS artista, Alb.album AS album
FROM SpotifyClone.artistas AS Art
INNER JOIN SpotifyClone.albums AS Alb ON Art.id_artista = Alb.id_artista
WHERE Art.artista = "Walter Phoenix"
ORDER BY Alb.album;