-- 1. Listar pacientes com seus exames e a data em que foram realizados
SELECT 
    P.CPF, 
    P.nome AS paciente_nome, 
    E.codigo AS exame_codigo, 
    E.nome AS exame_nome, 
    PE.data_exame
FROM Paciente AS P
JOIN Paciente_Exame AS PE ON P.CPF = PE.paciente_cpf
JOIN Exame AS E ON PE.exame_codigo = E.codigo;

-- 2. Listar pacientes que consultaram médicos, exibindo o motivo da consulta
SELECT 
    P.CPF, 
    P.nome AS paciente_nome,
    M.CRM, 
    M.nome AS medico_nome, 
    PM.motivo_consulta
FROM Paciente AS P
JOIN Paciente_Medico AS PM ON P.CPF = PM.paciente_cpf
JOIN Medico AS M ON PM.medico_crm = M.CRM;

-- 3. Listar exames com os técnicos responsáveis por sua realização e a data
SELECT 
    E.codigo AS exame_codigo, 
    E.nome AS exame_nome, 
    T.CPF AS tecnico_cpf, 
    T.nome AS tecnico_nome, 
    ET.data_realizacao
FROM Exame AS E
JOIN Exame_Tecnico AS ET ON E.codigo = ET.exame_codigo
JOIN Tecnico AS T ON ET.tecnico_cpf = T.CPF;

-- 4. Listar técnicos com o nome do setor onde trabalham
SELECT 
    T.CPF, 
    T.nome AS tecnico_nome, 
    S.codigo AS setor_codigo, 
    S.nome AS setor_nome
FROM Tecnico AS T
JOIN Setor AS S ON T.codigo_setor = S.codigo;

-- 5. Exibir exames com os dados do médico que os solicitou
SELECT 
    E.codigo, 
    E.nome AS exame_nome, 
    E.tipo, 
    M.CRM, 
    M.nome AS medico_nome
FROM Exame AS E
JOIN Medico AS M ON E.medico_crm = M.CRM;

-- 6. Listar as compras feitas pelos técnicos (fornecedor e dados da compra)
SELECT 
    TC.tecnico_cpf, 
    T.nome AS tecnico_nome, 
    TC.fornecedor_cnpj, 
    F.nome AS fornecedor_nome, 
    TC.data_compra, 
    TC.valor
FROM Tecnico_Compra AS TC
JOIN Tecnico AS T ON TC.tecnico_cpf = T.CPF
JOIN Fornecedor AS F ON TC.fornecedor_cnpj = F.CNPJ;

-- 7. Exibir as solicitações de materiais feitas pelos médicos aos fornecedores
SELECT 
    MF.medico_crm, 
    M.nome AS medico_nome, 
    MF.fornecedor_cnpj, 
    F.nome AS fornecedor_nome, 
    MF.data_solicitacao_material
FROM Medico_Fornecedor AS MF
JOIN Medico AS M ON MF.medico_crm = M.CRM
JOIN Fornecedor AS F ON MF.fornecedor_cnpj = F.CNPJ;

-- 8. Listar o rastreamento dos materiais usados pelos pacientes, detalhando o fornecedor
SELECT 
    PF.paciente_cpf, 
    P.nome AS paciente_nome, 
    PF.fornecedor_cnpj, 
    F.nome AS fornecedor_nome, 
    PF.data_uso_material
FROM Paciente_Fornecedor AS PF
JOIN Paciente AS P ON PF.paciente_cpf = P.CPF
JOIN Fornecedor AS F ON PF.fornecedor_cnpj = F.CNPJ;

-- 9. Listar exames do tipo "Imagem" junto com o equipamento utilizado
SELECT 
    E.codigo, 
    E.nome AS exame_nome, 
    E.tipo, 
    EI.equipamento
FROM Exame AS E
JOIN Exame_Imagem AS EI ON E.codigo = EI.codigo_exame
WHERE E.tipo = 'Imagem';

-- 10. Consulta complexa: Exibir para cada exame realizado (via Paciente_Exame) o paciente, o exame e o médico que o solicitou
SELECT 
    P.CPF AS paciente_cpf, 
    P.nome AS paciente_nome, 
    E.codigo AS exame_codigo, 
    E.nome AS exame_nome,
    M.CRM, 
    M.nome AS medico_nome, 
    PE.data_exame
FROM Paciente AS P
JOIN Paciente_Exame AS PE ON P.CPF = PE.paciente_cpf
JOIN Exame AS E ON PE.exame_codigo = E.codigo
JOIN Medico AS M ON E.medico_crm = M.CRM;


