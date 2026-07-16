
-- Seleciona todos os dados da tabela pessoa;
SELECT * FROM Pessoa

-- Seleciona as colunas mencionadas da tabela Pessoa
SELECT nome, e-mail, data_de_nascimento 
FROM Pessoa;

-- Pula as duas primeiras pessoas e pega 6 registos( do 3º ao 8º)
SELECT nome,e-mail, data_de_nascimento
FROM Pessoa
ORDER BY nome
LIMIT 6, OFFSET 2;

-- Para saber a idade é necessário calcular atraves do comando AGE (Postgres)
-- Guardar a data de nascimento é mais vantajoso, assim a idade fica sendo atualizada
SELECT nome, e-mail, AGE(data_de_nascimento) AS idade 
FROM Pessoa

-- Uso da função count() para contar o total de agendamentos
SELECT COUNT(*) AS total_agendamentos
FROM Agendamento

-- Seleciona data e hora da consulta
-- pega o valor da consulta e calcula 95% do total e mostra arredondando para 2 casa decimais
-- atribui o apelido de valor_com_desconto
SELECT data_hora_consulta, 
'R$' || ROUND(valor_consulta * 0.95,2) AS valor_com_desconto
FROM Agendamento

-- Aqui é feito o JOIN de duas tabelas
-- A coluna pessoa_id da tabela Paciente aponta para id na tabela pessoa
SELECT
    Pessoa.nome,
    Pessoa.cpf,
    Pessoa.email,
FROM Paciente
JOIN Pessoa ON Paciente.pessoa_id = Pessoa.id
WHERE Paciente.plano_saude IS NULL;

-- De todos os registra da tabela Agendamento
-- Pega os que o mes da coluna data_hora_consulta foi 7
-- e que o ano de data_hora_consulta foi 2026
SELECT * FROM Agendamento
WHERE EXTRACT(MOTH FROM data_hora_consulta) = 7
    AND EXTRACT(YEAR FROM data_hora_consulta) = 2026;

-- Das pessoas que são pacientes, seleciona aqueles cujo o telefone é NULL
SELECT 
    Pessoa.cpf, 
    Pessoa.nome, Pessoa.email
FROM Paciente
JOIN Pessoa ON Paciente.pessoa_id = Pessoa.id
WHERE telefone IS NULL;

-- ::date pega apenas o dia, mês e ano
--  between é usado para fazer uma busca em uma faixa de valores
SELECT data_hora_consulta::date AS data_hora_consulta
FROM Agendamento
WHERE valor_consulta BETWEEN 50 AND 100

-- Filtra os paciente que moram em Natal
-- Informa o cpf, nome e email desses pacientes
SELECT
    Pessoa.cpf,
    Pessoa.nome,
    Pessoa.email,
FROM Paciente
JOIN Pessoa ON Paciente.pessoa_id = Pessoa.id
WHERE Pessoa.endereco ILKE '%Natal%';

-- Filtra os dados selecionados
-- ordena pela data de nascimento de forma ascendente
SELECT
    Pessoa.nome,
    Pessoa.cpf,
    Pessoa.email,
    Pessoa.data_de_nascimento,
FROM Paciente
JOIN Pessoa ON Paciente.pessoa_id = Pessoa.id
ORDER BY data_de_nascimento ASC;

-- Faz uma busca pelos pacientes que não tem plano de saúde
SELECT COUNT(*) AS total_pacientes_sem_planos
FROM Paciente
WHERE plano_de_saude IS NULL;

-- Pega o menor e o maior valor das consultas
SELECT
    MIN(valor_consulta) AS menor_valor,
    MAX(valor_consulta) AS maior_valor,
FROM Agendamento;

-- Valor média das consulta do mes de dezembro
SELECT
    ROUND(AVG(valor_consulta),2) AS media_valor_dezembro
FROM Agendamento
WHERE EXTRACT(MONTH FROM data_hora_consulta) = 12;


SELECT
    Pessoa.nome,
    Pessoa.email,
FROM Agendamento
JOIN Paciente ON Agendamento.paciente_id = Paciente.id
JOIN Pessoa ON Paciente.pessoa_id = Pessoa.id
WHERE EXTRACT(DAY FROM Agendamento.data_hora_consulta) = EXTRACT(DAY FROM Pessoa.data_de_nascimento)
        AND EXTRACT(MONTH FROM Agendamento.data_hora_consulta) = EXTRACT(MONTH FROM Pessoa.data_de_nascimento);

-- Mostra nome, cpf e email dos medicos e suas especialidades
SELECT
    Pessoa.nome,
    Pessoa.email,
    Pessoa.cpf,
    Especialidade.nome AS especialidade
FROM Medico
JOIN Pessoa ON Medico.pessoa_id = Pessoa.id
JOIN Especialidade ON Medico.especialidade_id = Especialidade.id

SELECT
    Pessoas.nome AS nome_medico,
    COUNT(Agendamento.id) AS quantidade_consultas
FROM Agendamento
JOIN Medico ON Agendamento.medico_id = Medico.id_especialidade
JOIN Pessoa ON Medico.pessoa_id = Pessoa.id
GROUP BY Pessoa.id, Pessoa.nome
ORDER BY quantidade_consultas DESC;











