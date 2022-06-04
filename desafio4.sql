SELECT U.usuario AS usuario,
IF (MAX(H.data_reproducao) >= "2021-01-01 00:00:01", "Usuário ativo", "Usuário inativo") AS condicao_usuario
FROM SpotifyClone.usuarios AS U
INNER JOIN SpotifyClone.historico AS H ON H.id_usuario = U.id_usuario
GROUP BY U.usuario
ORDER BY U.usuario;