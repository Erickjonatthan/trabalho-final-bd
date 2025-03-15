SELECT 
    m.nome AS nome_medico,
    SUM(e.valor) AS total_valor_gerado
FROM 
    Medico m
JOIN 
    Exame e ON m.CRM = e.medico_crm
GROUP BY 
    m.nome
ORDER BY 
    total_valor_gerado DESC;
