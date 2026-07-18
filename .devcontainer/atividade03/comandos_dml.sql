-- B1 - Inserindo dados
INSERT INTO categoria (id_categoria, categoria) VALUES
(1,'Ação'),
(2,'Ficção Científica'),
(3,'Drama'),
(4,'Comédia'),
(5,'Terror');

-- B1 - Inserindo dados
INSERT INTO filme_serie(id_filme,id_categoria,nome,descricao, ano, faixa_etaria) VALUES
(10,5,'Stranger Things','Adolecentes resolvendo misterios',2019,'16+'),
(20,2,'Exterminador do Futuro','IA que quer destruir a humanidade',2027,'18+'),
(30,4,'Kungfusão','Melhor filme de comédia',2005,'Livre'),
(40,3,'Round 6','Série que popularizou os Coreanos', 2023,'Livre'),
(50,2,'Senhor dos aneis','Pena que acabou', 2007,'Livre');

-- B1 - Inserindo dados
INSERT INTO notificacao(id_notificacao, mensagem, data_hora) VALUES
(1,'Chega uma nova temporada da sua serie favorita','2026-05-05 15:03:37'),
(2,'Sua fatura está em atraso','2017-03-11 23:59:59'),
(3,'Novo aparelho conectado a sua conta', '2019-08-19 02:02:02'),
(4,'Agora sua conta é PlusPremium','2000-01-01 00:01:01'),
(5,'Se torne premium por mais 9,99$ por mês',' 2009-09-07 19:35:07');

-- B1 - Inserindo dados
INSERT INTO assinatura(id_assinatura, tipo_assinatura, valor,data_fatura,qtd_aparelhos) VALUES
(100,'Basico com anúncios de 1 min',10.45,'2026-07-03',2),
(200,'Básico plus (anuncios de 30s)',22.50,'2026-08-28',3),
(300,'Premium',55.99,'2026-12-30',5),
(400,'Diamond',99.87,'2027-05-01',10),
(500,'Extreme',205.12,'2071-09-09',153);

-- B1 - Inserindo dados
INSERT INTO aparelho(id_aparelho,tipo_aparelho,id_assinatura) VALUES
(100,'Smart TV',100),
(200,'SmartWatch',100),
(300,'SmartSanitario',300),
(400,'Smartphone',200),
(500,'Tablet',400);


-- B1 - Inserindo dados
INSERT INTO usuario(id_usuario, login, senha, id_assinatura) VALUES
(50, 'Djonga', '1234',500),
(60,'Zaratrusta','0110001',100),
(70,'Irmanoteu','2026718',300),
(80,'Leúzia','4321',400),
(90,'Zirineuza','10230',200);

-- B1 - Inserindo dados
INSERT INTO minha_lista(id_usuario) VALUES
(50),
(60),
(70),
(80),
(90);

-- B1 - Inserindo dados
INSERT INTO classificado_em(id_filme,id_categoria) VALUES

(10,1),
(20,2),
(30,4),
(40,3),
(50,2);

-- B1 - Inserindo dados
INSERT INTO assiste(id_usuario,id_filme) VALUES
(50,50),
(60,40),
(70,30),
(80,20),
(90,10);

-- B1 - Inserindo dados
INSERT INTO recebe(id_usuario,id_notificacao) VALUES

(60,1),
(50,2),
(70,5),
(80,3),
(90,4);

-- B1 - Inserindo dados
INSERT INTO possui_filme(id_usuario,id_filme) VALUES

(50,10),
(90,20),
(70,30),
(80,40),
(60,50);

-- B2 - Alterando a coluna valor da assinatura
-- B6 - alterando um campo usando o antigo valor
UPDATE assinatura
SET valor = valor *1.10;

-- B3 - update com uma condição simples
UPDATE assinatura
SET valor = 85.90
WHERE id_assinatura = 400;

-- B4 update com condição composta
UPDATE filme_serie
SET faixa_etaria = '12+'
WHERE id_categoria = 3 AND ano < 2010;

-- B5 - atualizando 2 campos com uma única condição
UPDATE usuario
SET login = 'djonga@mail.com', senha = '1441'
WHERE id_usuario = 50;

-- B7 - update de um campo usando uma função
UPDATE
SET tipo_assinatura = UPPER(tipo_assinatura);

-- B8 - removendo todos os registros de uma tabela
DELETE FROM assiste;

--B9 - removendo um registro com uma condição simples
DELETE FROM aparelho
WHERE id_aparelho = 3

--B10 - fazer uma remoção usando uma condição composta 
DELETE FROM aparelho
WHERE tipo_aparelho = 'Smart TV' and id_usuario = 60;

--B11 - apaga todos os filme cujo os nome foram cadastados 100% em minusculo
DELETE FROM filme_serie
WHERE nome = LOWER(nome)

