/* 1. Tabela Setor */
CREATE TABLE Setor (
    codigo INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL CHECK (nome <> '')
);

/* 2. Tabela Paciente */
CREATE TABLE Paciente (
    CPF CHAR(11) PRIMARY KEY,
    nome VARCHAR(100) NOT NULL CHECK (nome <> ''),
    endereco VARCHAR(255),
    telefone VARCHAR(15),
    data_nasc DATE
);

/* 3. Tabela Médico */
CREATE TABLE Medico (
    CRM CHAR(16) PRIMARY KEY,
    nome VARCHAR(100) NOT NULL CHECK (nome <> ''),
    especialidade VARCHAR(100),
    telefone VARCHAR(15)
);

/* 4. Tabela Técnico */
CREATE TABLE Tecnico (
    CPF CHAR(11) PRIMARY KEY,
    nome VARCHAR(100) NOT NULL CHECK (nome <> ''),
    turno_trabalho VARCHAR(50),
    codigo_setor INT,
    FOREIGN KEY (codigo_setor) REFERENCES Setor(codigo)
);

/* 5. Tabela Exame (solicitado por um Médico) */
CREATE TABLE Exame (
    codigo INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL CHECK (nome <> ''),
    tipo VARCHAR(50),
    valor DECIMAL(10,2) CHECK (valor >= 0),
    prazo_entrega DATE,
    medico_crm CHAR(16),
    FOREIGN KEY (medico_crm) REFERENCES Medico(CRM)
);

/* 6. Especialização: Exame de Imagem */
CREATE TABLE Exame_Imagem (
    codigo_exame INT PRIMARY KEY,
    equipamento VARCHAR(100),
    FOREIGN KEY (codigo_exame) REFERENCES Exame(codigo)
);

/* 7. Especialização: Exame Laboratorial */
CREATE TABLE Exame_Laboratorial (
    codigo_exame INT PRIMARY KEY,
    metodo_analise VARCHAR(100),
    FOREIGN KEY (codigo_exame) REFERENCES Exame(codigo)
);

/* 8. Relação muitos-para-muitos: Paciente - Exame 
   (armazena também a data em que o exame foi realizado pelo paciente) */
CREATE TABLE Paciente_Exame (
    paciente_cpf CHAR(11),
    exame_codigo INT,
    data_exame DATE,
    PRIMARY KEY (paciente_cpf, exame_codigo, data_exame),
    FOREIGN KEY (paciente_cpf) REFERENCES Paciente(CPF),
    FOREIGN KEY (exame_codigo) REFERENCES Exame(codigo)
);

/* 9. Relação muitos-para-muitos: Paciente - Médico 
   (para registrar as consultas com o motivo da consulta) */
CREATE TABLE Paciente_Medico (
    paciente_cpf CHAR(11),
    medico_crm CHAR(16),
    motivo_consulta VARCHAR(255),
    PRIMARY KEY (paciente_cpf, medico_crm),
    FOREIGN KEY (paciente_cpf) REFERENCES Paciente(CPF),
    FOREIGN KEY (medico_crm) REFERENCES Medico(CRM)
);

/* 10. Relação muitos-para-muitos: Exame - Técnico 
    (com data de realização do exame pelo técnico) */
CREATE TABLE Exame_Tecnico (
    exame_codigo INT,
    tecnico_cpf CHAR(11),
    data_realizacao DATE,
    PRIMARY KEY (exame_codigo, tecnico_cpf, data_realizacao),
    FOREIGN KEY (exame_codigo) REFERENCES Exame(codigo),
    FOREIGN KEY (tecnico_cpf) REFERENCES Tecnico(CPF)
);

/* 11. Tabela Fornecedor */
CREATE TABLE Fornecedor (
    CNPJ CHAR(14) PRIMARY KEY,
    nome VARCHAR(100) NOT NULL CHECK (nome <> ''),
    endereco VARCHAR(255),
    telefone VARCHAR(15)
);

/* 12. Relação muitos-para-muitos: Técnico - Fornecedor 
    (os técnicos podem comprar materiais dos fornecedores; registra data e valor da compra) */
CREATE TABLE Tecnico_Compra (
    tecnico_cpf CHAR(11),
    fornecedor_cnpj CHAR(14),
    data_compra DATE,
    valor DECIMAL(10,2) CHECK (valor >= 0),
    PRIMARY KEY (tecnico_cpf, fornecedor_cnpj, data_compra),
    FOREIGN KEY (tecnico_cpf) REFERENCES Tecnico(CPF),
    FOREIGN KEY (fornecedor_cnpj) REFERENCES Fornecedor(CNPJ)
);

/* 13. Rastreamento do uso dos materiais nos exames de cada paciente
    (relacionando paciente e fornecedor, com a data do uso do material) */
CREATE TABLE Paciente_Fornecedor (
    paciente_cpf CHAR(11),
    fornecedor_cnpj CHAR(14),
    data_uso_material DATE,
    PRIMARY KEY (paciente_cpf, fornecedor_cnpj, data_uso_material),
    FOREIGN KEY (paciente_cpf) REFERENCES Paciente(CPF),
    FOREIGN KEY (fornecedor_cnpj) REFERENCES Fornecedor(CNPJ)
);

/* 14. Os médicos podem solicitar materiais específicos para os exames 
    (relacionando médico e fornecedor, com a data da solicitação) */
CREATE TABLE Medico_Fornecedor (
    medico_crm CHAR(16),
    fornecedor_cnpj CHAR(14),
    data_solicitacao_material DATE,
    PRIMARY KEY (medico_crm, fornecedor_cnpj, data_solicitacao_material),
    FOREIGN KEY (medico_crm) REFERENCES Medico(CRM),
    FOREIGN KEY (fornecedor_cnpj) REFERENCES Fornecedor(CNPJ)
);
