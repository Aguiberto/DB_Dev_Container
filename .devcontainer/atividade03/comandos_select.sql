-- C1 - todos os campos de todas as tabelas
SELECT * FROM usuario;

--C2 - listando colunas de uma tabela específica que atenda uma condição simples
SELECT nome, faixa_etaria
FROM filme_serie
WHERE id_categoria = 3;

--C3 - listando o nome de filme que sejam de terror e com faixa etaria de 16+
SELECT nome
FROM filme_serie
WHERE id_categoria = 5 AND faixa_etaria = '16+';

--C4 - Conta quantos filmes/series há por categoria cujo ano seja maior ou igual a 2020
SELECT id_categoria, COUNT(*) AS total_titulos
FROM filme_serie
WHERE ano >= 2020
GROUP BY id_categoria;

--C5 - Listando login e email dos usuário usando uma condição aninhada
SELECT login, senha
FROM usuario
WHERE id_usuario IN(
    SELECT id_usuario
    FROM aparelho
    WHERE tipo_aparelho = 'Smart TV'
);