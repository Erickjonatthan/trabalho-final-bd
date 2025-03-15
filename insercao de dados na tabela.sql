-- Inserção de Dados de Teste - Script MySQL
-- 40 linhas para cada tabela, com exceção de Exame, que terá 80

-- 1. Inserindo 40 linhas na tabela Setor
DELIMITER //
CREATE PROCEDURE InsereSetor()
BEGIN
    DECLARE i INT DEFAULT 1;
    WHILE i <= 40 DO
        INSERT INTO Setor (codigo, nome)
        VALUES (i, CONCAT('Setor ', i));
        SET i = i + 1;
    END WHILE;
END //
DELIMITER ;
CALL InsereSetor();

-- 2. Inserindo 40 linhas na tabela Paciente
DELIMITER //
CREATE PROCEDURE InserePaciente()
BEGIN
    DECLARE i INT DEFAULT 1;
    WHILE i <= 40 DO
        INSERT INTO Paciente (CPF, nome, endereco, telefone, data_nasc)
        VALUES (
            LPAD(i, 11, '0'), 
            CONCAT('Paciente ', i),
            CONCAT('Endereco ', i),
            CONCAT('Telefone ', i),
            DATE_ADD('1980-01-01', INTERVAL i-1 DAY)
        );
        SET i = i + 1;
    END WHILE;
END //
DELIMITER ;
CALL InserePaciente();

DELIMITER //
CREATE PROCEDURE InsereMedico()
BEGIN
    DECLARE i INT DEFAULT 1;
    WHILE i <= 40 DO
        INSERT INTO Medico (CRM, nome, especialidade, telefone)
        VALUES (
            CONCAT('CRM', LPAD(i, 4, '0')),
            CONCAT('Medico ', i),
            CASE 
                WHEN i % 3 = 1 THEN 'Clinico Geral'
                WHEN i % 3 = 2 THEN 'Cardiologista'
                ELSE 'Ortopedista'
            END,
            CONCAT('Telefone ', i)
        );
        SET i = i + 1;
    END WHILE;
END //
DELIMITER ;
CALL InsereMedico();

-- 4. Inserindo 40 linhas na tabela Tecnico
DELIMITER //
CREATE PROCEDURE InsereTecnico()
BEGIN
    DECLARE i INT DEFAULT 1;
    WHILE i <= 40 DO
        INSERT INTO Tecnico (CPF, nome, turno_trabalho, codigo_setor)
        VALUES (
            CONCAT('33333333', LPAD(i, 3, '0')),
            CONCAT('Tecnico ', i),
            CASE 
                WHEN i % 3 = 1 THEN 'Manhã'
                WHEN i % 3 = 2 THEN 'Tarde'
                ELSE 'Noite'
            END,
            i
        );
        SET i = i + 1;
    END WHILE;
END //
DELIMITER ;
CALL InsereTecnico();

-- 5. Inserindo 80 linhas na tabela Exame
DELIMITER //
CREATE PROCEDURE InsereExame()
BEGIN
    DECLARE i INT DEFAULT 1;
    WHILE i <= 80 DO
        INSERT INTO Exame (codigo, nome, tipo, valor, prazo_entrega, medico_crm)
        VALUES (
            i,
            CONCAT('Exame ', i),
            CASE 
                WHEN i <= 40 THEN 'Imagem' 
                ELSE 'Laboratorial' 
            END,
            50.00 + (i * 1.25),
            DATE_ADD('2023-01-01', INTERVAL i-1 DAY),
            CONCAT('CRM', LPAD((i - 1) % 40 + 1, 4, '0'))
        );
        SET i = i + 1;
    END WHILE;
END //
DELIMITER ;
CALL InsereExame();

-- 6. Inserindo 40 linhas na tabela Exame_Imagem
DELIMITER //
CREATE PROCEDURE InsereExameImagem()
BEGIN
    DECLARE i INT DEFAULT 1;
    WHILE i <= 40 DO
        INSERT INTO Exame_Imagem (codigo_exame, equipamento)
        VALUES (
            i,
            CONCAT('Equipamento ', i)
        );
        SET i = i + 1;
    END WHILE;
END //
DELIMITER ;
CALL InsereExameImagem();

-- 7. Inserindo 40 linhas na tabela Exame_Laboratorial
DELIMITER //
CREATE PROCEDURE InsereExameLaboratorial()
BEGIN
    DECLARE i INT DEFAULT 1;
    WHILE i <= 40 DO
        INSERT INTO Exame_Laboratorial (codigo_exame, metodo_analise)
        VALUES (
            i + 40,
            CONCAT('Metodo ', i)
        );
        SET i = i + 1;
    END WHILE;
END //
DELIMITER ;
CALL InsereExameLaboratorial();

-- 8. Inserindo 40 linhas na tabela Paciente_Exame
DELIMITER //
CREATE PROCEDURE InserePacienteExame()
BEGIN
    DECLARE i INT DEFAULT 1;
    WHILE i <= 40 DO
        INSERT INTO Paciente_Exame (paciente_cpf, exame_codigo, data_exame)
        VALUES (
            LPAD(i, 11, '0'),
            i,
            DATE_ADD('2023-03-01', INTERVAL i-1 DAY)
        );
        SET i = i + 1;
    END WHILE;
END //
DELIMITER ;
CALL InserePacienteExame();

-- 9. Inserindo 40 linhas na tabela Paciente_Medico
DELIMITER //
CREATE PROCEDURE InserePacienteMedico()
BEGIN
    DECLARE i INT DEFAULT 1;
    WHILE i <= 40 DO
        INSERT INTO Paciente_Medico (paciente_cpf, medico_crm, motivo_consulta)
        VALUES (
            LPAD(i, 11, '0'),
            CONCAT('CRM', LPAD(i, 4, '0')),
            CONCAT('Consulta motivo ', i)
        );
        SET i = i + 1;
    END WHILE;
END //
DELIMITER ;
CALL InserePacienteMedico();

-- 10. Inserindo 40 linhas na tabela Exame_Tecnico
DELIMITER //
CREATE PROCEDURE InsereExameTecnico()
BEGIN
    DECLARE i INT DEFAULT 1;
    WHILE i <= 40 DO
        INSERT INTO Exame_Tecnico (exame_codigo, tecnico_cpf, data_realizacao)
        VALUES (
            i,
            CONCAT('33333333', LPAD(i, 3, '0')),
            DATE_ADD('2023-04-01', INTERVAL i-1 DAY)
        );
        SET i = i + 1;
    END WHILE;
END //
DELIMITER ;
CALL InsereExameTecnico();

-- 11. Inserindo 40 linhas na tabela Fornecedor
DELIMITER //
CREATE PROCEDURE InsereFornecedor()
BEGIN
    DECLARE i INT DEFAULT 1;
    WHILE i <= 40 DO
        INSERT INTO Fornecedor (CNPJ, nome, endereco, telefone)
        VALUES (
            LPAD(i, 14, '0'),
            CONCAT('Fornecedor ', i),
            CONCAT('Endereco F ', i),
            CONCAT('Telefone F ', i)
        );
        SET i = i + 1;
    END WHILE;
END //
DELIMITER ;
CALL InsereFornecedor();

-- 12. Inserindo 40 linhas na tabela Tecnico_Compra
DELIMITER //
CREATE PROCEDURE InsereTecnicoCompra()
BEGIN
    DECLARE i INT DEFAULT 1;
    WHILE i <= 40 DO
        INSERT INTO Tecnico_Compra (tecnico_cpf, fornecedor_cnpj, data_compra, valor)
        VALUES (
            CONCAT('33333333', LPAD(i, 3, '0')),
            LPAD(i, 14, '0'),
            DATE_ADD('2023-05-01', INTERVAL i-1 DAY),
            100.00 + (i * 5)
        );
        SET i = i + 1;
    END WHILE;
END //
DELIMITER ;
CALL InsereTecnicoCompra();

-- 13. Inserindo 40 linhas na tabela Paciente_Fornecedor
DELIMITER //
CREATE PROCEDURE InserePacienteFornecedor()
BEGIN
    DECLARE i INT DEFAULT 1;
    WHILE i <= 40 DO
        INSERT INTO Paciente_Fornecedor (paciente_cpf, fornecedor_cnpj, data_uso_material)
        VALUES (
            LPAD(i, 11, '0'),
            LPAD(i, 14, '0'),
            DATE_ADD('2023-06-01', INTERVAL i-1 DAY)
        );
        SET i = i + 1;
    END WHILE;
END //
DELIMITER ;
CALL InserePacienteFornecedor();

-- 14. Inserindo 40 linhas na tabela Medico_Fornecedor
DELIMITER //
CREATE PROCEDURE InsereMedicoFornecedor()
BEGIN
    DECLARE i INT DEFAULT 1;
    WHILE i <= 40 DO
        INSERT INTO Medico_Fornecedor (medico_crm, fornecedor_cnpj, data_solicitacao_material)
        VALUES (
            CONCAT('CRM', LPAD(i, 4, '0')),
            LPAD(i, 14, '0'),
            DATE_ADD('2023-07-01', INTERVAL i-1 DAY)
        );
        SET i = i + 1;
    END WHILE;
END //
DELIMITER ;
CALL InsereMedicoFornecedor();
