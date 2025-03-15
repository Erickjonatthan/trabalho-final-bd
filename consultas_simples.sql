-- 1. Listar todos os pacientes
SELECT *
FROM Paciente;

-- 2. Buscar pacientes nascidos depois de 1980-01-01
SELECT CPF, nome, data_nasc
FROM Paciente
WHERE data_nasc > '1980-01-01';

-- 3. Listar médicos cuja especialidade seja "Cardiologista"
SELECT CRM, nome, especialidade, telefone
FROM Medico
WHERE especialidade = 'Cardiologista';

-- 4. Exibir exames do tipo "Imagem" mostrando código, nome e valor
SELECT codigo, nome, valor
FROM Exame
WHERE tipo = 'Imagem';

-- 5. Selecionar exames com valor maior que 60
SELECT codigo, nome, valor
FROM Exame
WHERE valor > 60;

-- 6. Listar técnicos que trabalham no turno "Manhã"
SELECT CPF, nome, turno_trabalho
FROM Tecnico
WHERE turno_trabalho = 'Manhã';

-- 7. Exibir os detalhes dos exames laboratoriais registrados (método de análise)
SELECT codigo_exame, metodo_analise
FROM Exame_Laboratorial;

-- 8. Buscar fornecedores cujo telefone termina com '10'
SELECT CNPJ, nome, telefone
FROM Fornecedor
WHERE telefone LIKE '%10';

-- 9. Consultar os registros de exames realizados por pacientes em uma data específica (ex.: 2023-03-05)
SELECT paciente_cpf, exame_codigo, data_exame
FROM Paciente_Exame
WHERE data_exame = '2023-03-05';

-- 10. Listar compras de técnicos com valor inferior a 150
SELECT tecnico_cpf, fornecedor_cnpj, data_compra, valor
FROM Tecnico_Compra
WHERE valor < 150;
