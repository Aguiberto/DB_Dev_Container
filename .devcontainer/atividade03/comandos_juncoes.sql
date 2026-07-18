--D1 Selecionando atributo de duas tabelas por meio do comando JOIN
SELECT
    filme_serie.nome AS nome_filme,
    categoria.categoria AS categoria_filme
FROM filme_serie
JOIN categoria ON filme_serie.id_categoria = categoria.id_categoria;


--D2 selecionando atributos de 3 tabelas diferentes
SELECT
    usuario.login AS nome_usuario,
    filme_serie.nome AS nome_filme,
    categoria.categoria AS categoria_filme
FROM usuario
JOIN assiste ON usuario.id_usuario = assiste.id_usuario
JOIN filme_serie ON assiste.id_filme = filme_serie.id_filme
JOIN categoria ON filme_serie.id_categoria = categoria.id_categoria;

--D3 mostra os filmes de filtrados por categoria
SELECT
    categoria.categoria AS nome_categoria,
    filme_serie.nome AS nome_filme
FROM categoria
LEFT JOIN filme_serie ON categoria.id_categoria = filme_serie.id_categoria


--D4 mostrando os tipos de assinatura e os seus assinantes
SELECT 
    assinatura.tipo_assinatura,
    usuario.login AS usuario_assinante
FROM assinatura
FULL OUTER JOIN usuario ON assinatura.id_assinatura = usuario.id_assinatura;
