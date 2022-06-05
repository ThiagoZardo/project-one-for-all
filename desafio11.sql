SELECT musica AS nome_musica,
REPLACE (
	REPLACE(
		REPLACE(
			REPLACE(
				REPLACE(
					musica,
                    'Streets', 'Code Review'),
                    'Her Own', 'Trybe'),
                    'Inner Fire', 'Project'),
                    'Silly', 'Nice'),
                    'Circus', 'Pull Request') AS novo_nome
FROM SpotifyClone.musicas
WHERE musica LIKE '%Own' || musica LIKE '%Silly' || musica LIKE '%Circus' || musica LIKE '%fire' || musica LIKE '%Streets'
ORDER BY musica;
