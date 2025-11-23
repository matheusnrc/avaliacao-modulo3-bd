CREATE DATABASE coleta_sao_carlos;
USE coleta_sao_carlos;

-- 1. Criação das tabelas

CREATE TABLE bairros (
  bairro_id SERIAL PRIMARY KEY,
  nome VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE pontos_coleta (
  ponto_id SERIAL PRIMARY KEY,
  nome VARCHAR(200) NOT NULL,
  bairro_id INTEGER NOT NULL REFERENCES bairros(bairro_id) ON DELETE RESTRICT,
  tipo_residuo VARCHAR(50) NOT NULL,
  dia_semana VARCHAR(20) NOT NULL,
  horario TIME NOT NULL,
  status VARCHAR(20) NOT NULL CHECK (status IN ('Ativo','Inativo'))
);

CREATE TABLE ocorrencias (
  ocorrencia_id SERIAL PRIMARY KEY,
  ponto_id INTEGER NOT NULL REFERENCES pontos_coleta(ponto_id) ON DELETE CASCADE,
  tipo VARCHAR(100) NOT NULL,
  descricao TEXT NOT NULL,
  contato VARCHAR(150),
  data_registro TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  status VARCHAR(30) NOT NULL DEFAULT 'Aberta'
);

CREATE TABLE rotas (
  rota_id SERIAL PRIMARY KEY,
  nome VARCHAR(150) NOT NULL,
  descricao TEXT
);

CREATE TABLE rota_pontos (
  rota_id INTEGER NOT NULL REFERENCES rotas(rota_id) ON DELETE CASCADE,
  ponto_id INTEGER NOT NULL REFERENCES pontos_coleta(ponto_id) ON DELETE CASCADE,
  ordem INTEGER NOT NULL,
  PRIMARY KEY (rota_id, ponto_id)
);