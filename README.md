# Avaliação Módulo 3 — Banco de Dados e Controle de Versão
Protótipo do projeto "Monitoramento inteligente da coleta de lixo urbano em São Carlos – SP".

## 🗃️ Modelagem e Banco de Dados

### 🔸 Entidades
- **bairros**
- **pontos_coleta**
- **ocorrencias**
- **rotas**
- **rota_pontos** (tabela associativa)

### 🔸 Relacionamentos
- 1:N — bairros → pontos_coleta  
- 1:N — pontos_coleta → ocorrencias  
- N:N — rotas ↔ pontos_coleta (via rota_pontos)

### 🔸 Implementação em MySQL
- Scripts DDL para criação das tabelas  
- Scripts DML para inserções, alterações, remoções e consultas  
- Consultas SQL de apoio à gestão

---

## 🔧 Tecnologias Utilizadas

### Banco de Dados
- **MySQL 8+**

### Versionamento
- **Git**
- **GitHub**
- Estrutura organizada por pastas

---

## 📂 Estrutura do Repositório

```
/
│
│── db/
│   ├── ddl/
│   │   ├── create_tables_mysql.sql
│   ├── dml/
│   │   ├── insert_data.sql
│   └── queries/
│       └── useful_queries.sql
│
│── docs/
│   └── der_coleta_lixo.png
│
└── README.md
````

---

## 🔹 Banco de Dados MySQL

1. Crie o banco:

   ```sql
   CREATE DATABASE coleta_sao_carlos;
   USE coleta_sao_carlos;
   ```
2. Execute o arquivo DDL:

   ```bash
   mysql -u root -p coleta_sao_carlos < db/ddl/create_tables.sql
   ```
3. Insira dados de exemplo:

   ```bash
   mysql -u root -p coleta_sao_carlos < db/dml/insert_examples.sql
   ```

---

## 👨‍💻 Autor

- **Matheus Nunes Rodrigues Cruz**
- Curso: Tecnologia da Informação – UFMS
- Ano/Semestre: 2025/2

---

## 📜 Licença

Projeto acadêmico — uso educacional.