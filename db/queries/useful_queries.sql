-- 1. Listar todos os pontos com informações do bairro
SELECT p.ponto_id, p.nome, b.nome AS bairro, p.tipo_residuo, p.dia_semana, p.horario, p.status
FROM pontos_coleta p
JOIN bairros b ON p.bairro_id = b.bairro_id
ORDER BY b.nome, p.horario;

-- 2. Buscar ocorrências recentes (últimos 30 dias)
SELECT o.ocorrencia_id, o.tipo, o.descricao, o.contato, o.data_registro, o.status,
       p.nome AS ponto, b.nome AS bairro
FROM ocorrencias o
JOIN pontos_coleta p ON o.ponto_id = p.ponto_id
JOIN bairros b ON p.bairro_id = b.bairro_id
WHERE o.data_registro >= now() - interval '30 days'
ORDER BY o.data_registro DESC;

-- 3. Pontos ativos por bairro (contagem)
SELECT b.nome AS bairro, COUNT(*) FILTER (WHERE p.status = 'Ativo') AS pontos_ativos
FROM bairros b
LEFT JOIN pontos_coleta p ON b.bairro_id = p.bairro_id
GROUP BY b.nome
ORDER BY pontos_ativos DESC;

-- 4. Gerar "rota simulada" por bairro e dia (ordenada por horário)
SELECT p.ponto_id, p.nome, b.nome AS bairro, p.horario
FROM pontos_coleta p
JOIN bairros b ON p.bairro_id = b.bairro_id
WHERE p.status = 'Ativo' AND b.nome ILIKE '%Vila Prado%' AND p.dia_semana = 'Segunda-feira'
ORDER BY p.horario;

-- 5. Consultar pontos sem ocorrências (para priorizar inclusão)
SELECT p.ponto_id, p.nome, b.nome AS bairro
FROM pontos_coleta p
JOIN bairros b ON p.bairro_id = b.bairro_id
LEFT JOIN ocorrencias o ON p.ponto_id = o.ponto_id
WHERE o.ocorrencia_id IS NULL;
