CREATE schema clinica;   

CREATE TABLE clinica.Pessoa(
    constraint cfp char (11) primary key,  
    e-mail varchar(50) not null,
    nome varchar (50) not null,
    dt_nasc date not null,
    endereco varchar(300) not null,
    telefone varchar(15) null,
);

CREATE TABLE clinica.Paciente(
    cpf_pessoa int not null primary key,
    senha varchar(20),
    plano_saude boolean, 
    constraint cpf_pessoa_fk foreign key(cpf_pessoa) references clinica.Pessoa(cpf),
);

CREATE TABLE clinica.Medico(
    cpf_med char (11) primary key,
    crm varchar(10),
    constraint cpf_med_fk foreign key(cpf_med) references clinica.Pessoa(cpf),
);

CREATE TABLE clinica.Especialidade(
    id,
    descricao varchar(300),
    
);

CREATE TABLE clinica.MedicoEspecialidade(

);

CREATE TABLE clinica.Agendamento(
    dh_consulta timestamp,
    dh_agendamento timestamp,
    valor_consulta float,
);

