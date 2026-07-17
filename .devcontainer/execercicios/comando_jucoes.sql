
-- Mostrar o nome, email e crm dos médicos
SELECT 
    Pessoa.nome,
    Pessoa.email,
    Medico.crm
FROM Medico
JOIN Pessoa ON Medico.pessoa_id = Pessoa.id

-- Mostra o nome, email e senha dos pacientes
SELECT 
    Pessoa.nome,
    Pessoa.email,
    Paciente.senha
FROM Paciente
JOIN Pessoa ON Paciente.pessoa_id = Pessoa.id

-- Listar crm de um médico e a descrição de sua especialidade
SELECT
    Medico.crm,
    Especialidade.descricao
FROM Medico
JOIN Especialidade ON Medico.especialidade_id = Especialidade.id

-- Lista o crm de todos os cardiologistas
SELECT
    Medico.crm
FROM Medico 
JOIN Especialidade ON Medico.especialidade_id = Especialidade.id
WHERE Especialidade.descricao = 'Cardiologia';

-- Mostra nome, cpf e senha de todos os médicos que estão cadastrados como paciente
SELECT
    Pessoa.nome,
    Pessoa.cpf,
    Paciente.senha
FROM Medico
JOIN Pessoa ON Paciente.pessoa_id = Pessoa.id
JOIN Pessoa ON Medico.pessoa_id = Pessoa.id

-- Mostra o nome e a quantidade de consultas do médico
SELECT
    Pessoa.nome AS medico_nome,
    COUNT(Agendamento.id_agendamento) AS quantidade_consultas
FROM Agendamento
JOIN Medico ON Agendamento.medico_id = Agendamento.id 
JOIN Pessoa ON Medico.pessoa_id = Pessoa.id
GROUP BY Pessoa.id, Pessoa.nome

-- Lista cada especialidade e a quantidade de médico associado a ela
SELECT
    Especialidade.descricao AS nome_especialidade
    COUNT(Medico.id) AS quantidade
FROM Especialidade
JOIN Medico ON Especialidade.medico_id = Medico.id
GROUP BY Especidade.id, Especialidade.descricao;

-- todos os agendamentos mostrando data/hora, preço, paciente, medico e crm
SELECT
    PessoaPaciente.nome AS nome_paciente,
    PessoaPaciente.email AS email_paciente,
    Agendamento.data_hora,
    Agendamento.valor,
    PessoaMedico.nome AS nome_medico,
    Medico,crm
FROM Agendamento
JOIN Paciente ON Agendamento.pessoa_id = Paciente.id
JOIN Pessoa AS PessoaPaciente ON Paciente.pessoa_id = PessoaPaciente.id

JOIN Medico ON Agendamento.medico_id = Medico.id
JOIN Pessoa AS PessoaMedico ON Medico.pessoa_id = PessoaMedico.id;


-- Mostra a data e hora da consulta de todos os cardiologistas
SELECT
    Agendamento.data_hora
    Especialidade.descricao AS especialidade,
    PessoaMedico.nome AS nome_medico
FROM Agendamento
JOIN Medico ON Agendamento.medico_id = Medico.id
JOIN Pessoa AS PessoaMedico ON Especialidade.medico_id = Medico.id
WHERE Especialidade.descricao = 'Cardiologista';

SELECT
    Pessoa.nome AS nome_medico,
    Medico.crm,
    COUNT(AVG(Agendamento.valor)) AS media_valor_consultas
FROM Agendamento
JOIN Medico ON Agendamento.medico_id = Medico.id
JOIN Pessoa AS PessoaMedico ON Medico.pessoa_id = Medico.id
WHERE Agendamento.data_hora >= '2026-12-01 00:00:00'
  AND Agendamento.data_hora >= '2026-12-31 23:59:59'
GROUP BY Medico.id, Pessoa.nome, Medico.crm;





