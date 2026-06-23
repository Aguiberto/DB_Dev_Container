CREATE schema clinica;   

CREATE TABLE  IF NOT EXISTS clinica.Pessoa(
    cpf char (11) primary key,  
    email varchar(50) not null,
    nome varchar (50) not null,
    dt_nasc date not null,
    endereco varchar(300) not null,
    telefone varchar(15) null
);

CREATE TABLE IF NOT EXISTS clinica.Paciente(
    cpf_pessoa char(11) not null primary key,
    senha varchar(20),
    plano_saude boolean, 
    constraint cpf_pessoa_fk foreign key(cpf_pessoa) 
            references clinica.Pessoa(cpf)
);

CREATE TABLE IF NOT EXISTS clinica.Medico(
    cpf_med char (11) primary key,
    crm varchar(10),
    constraint cpf_med_fk foreign key(cpf_med) 
            references clinica.Pessoa(cpf)
);

CREATE TABLE IF NOT EXISTS clinica.Especialidade(
    id int primary key,
    descricao varchar(300) not null
);

CREATE TABLE IF NOT EXISTS clinica.MedicoEspecialidade(
    cpf_medico char (11),
    id_especialidade int,
    constraint pk_medico_especialidade primary key(cpf_medico,id_especialidade),
    constraint cpf_med_fk foreign key(cpf_medico)         
            references clinica.Medico(cpf_med),
    constraint id_especialidade_fk foreign key(id_especialidade)
            references clinica.Especialidade(id)
);

CREATE TABLE IF NOT EXISTS clinica.Agendamento(
    cpf_paciente char(11),
    cpf_medico char(11),
    dh_consulta timestamp,
    dh_agendamento timestamp default current_timestamp,
    valor_consulta float not null default 0.0,
    constraint pk_agendamento primary key(cpf_paciente,cpf_medico,dh_consulta),
    constraint cpf_paciente_pk foreign key(cpf_paciente)
            references clinica.Paciente(cpf_pessoa),
    constraint cpf_medico_fk foreign key(cpf_medico)
            references clinica.Medico(cpf_med)
);

