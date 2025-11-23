-- Inserir bairros
INSERT INTO bairros (nome) VALUES ('Vila Prado'), ('Centro'), ('Cidade Aracy');

-- Inserir pontos de coleta
INSERT INTO pontos_coleta (nome, bairro_id, tipo_residuo, dia_semana, horario, status)
VALUES
('Ponto 01 - R. A', 1, 'Reciclável', 'Segunda-feira', '07:30', 'Ativo'),
('Ponto 02 - Av. B', 2, 'Doméstico', 'Terça-feira', '08:00', 'Ativo'),
('Ponto 03 - Praça C', 1, 'Orgânico', 'Sexta-feira', '06:30', 'Inativo');

-- Inserir ocorrência (associada ao ponto_id = 1)
INSERT INTO ocorrencias (ponto_id, tipo, descricao, contato)
VALUES (1, 'Lixo acumulado', 'Acúmulo de sacos em frente ao ponto há 3 dias', 'morador@exemplo.com');

-- Criar rota e associar pontos
INSERT INTO rotas (nome, descricao) VALUES ('Rota A - Norte', 'Rota matinal norte');
INSERT INTO rota_pontos (rota_id, ponto_id, ordem) VALUES (1, 1, 1), (1, 3, 2);

-- UPDATE exemplo: marcar ocorrência como resolvida
UPDATE ocorrencias SET status = 'Resolvida' WHERE ocorrencia_id = 1;

-- DELETE exemplo: remover um ponto (irá remover ocorrências associadas por cascade)
DELETE FROM pontos_coleta WHERE ponto_id = 3;
