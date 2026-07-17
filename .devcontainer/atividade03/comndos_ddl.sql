CREATE TABLE categoria(
    id_categoria INT PRIMARY KEY,
    categoria VARCHAR(50) NOT NULL
);

CREATE TABLE filme_serie(
    id_filme INT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    descricao TEXT,
    ano INT,
    faixa_etaria varchar(10)
);

CREATE TABLE notificacao(
    id_notificacao INT PRIMARY KEY,
    mensagem TEXT NOT NULL,
    data_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE assinatura(
    id_assinatura INT PRIMARY KEY,
    tipo_assinatura VARCHAR(50) NOT NULL,
    valor DECIMAL(5,2) NOT NULL,
    data_fatura DATE,
    qtd_aparelhos INT
);

CREATE TABLE aparelho(
    id_aparelho INT PRIMARY KEY,
    tipo_aparelho VARCHAR(20) NOT NULL,
    id_assinatura INT,
    FOREIGN KEY(id_assinatura) REFERENCES assinatura(id_assinatura)
);

CREATE TABLE usuario(
    id_usuario INT PRIMARY KEY,
    login VARCHAR(20) NOT NULL,
    senha VARCHAR(20) NOT NULL,
    id_assinatura INT,
    FOREIGN KEY (id_assinatura) REFERENCES assinatura(id_assinatura)
);

CREATE TABLE minha_lista(
    id_usuario INT PRIMARY KEY,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

CREATE TABLE classificado_em(
    id_filme INT,
    id_categoria INT,
    FOREIGN KEY (id_filme) REFERENCES filme_serie(id_filme),
    FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria),
    PRIMARY KEY(id_filme, id_categoria)
);

CREATE TABLE assiste(
    id_usuario INT,
    id_filme INT,
    FOREIGN KEY( id_usuario) REFERENCES usuario(id_usuario),
    FOREIGN KEY( id_filme) REFERENCES filme_serie(id_filme),
    PRIMARY KEY(id_usuario, id_filme)
);
CREATE TABLE recebe(
    id_usuario INT,
    id_notificacao INT,
    FOREIGN KEY (id_usuario), REFERENCES usuario(id_usuario),
    FOREIGN KEY (id_notificacao), REFERENCES notificacao(id_notificacao),
    PRIMARY KEY(id_usuario, id_notificacao)

);
CREATE TABLE possui_filme(
    id_filme INT,
    id_usuario int,
    FOREIGN KEY (id_usuario), REFERENCES minha_lista(id_usuario),
    FOREIGN KEY (id_filme), REFERENCES filme_serie(id_filme),
    PRIMARY KEY(id_filme, id_usuario)
);
