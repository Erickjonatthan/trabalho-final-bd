---

# 📌 Trabalho 2 - Banco de Dados  

### 📍 Universidade Federal Rural de Pernambuco - UFRPE  
📚 **Disciplina:** Banco de Dados  
👨‍🏫 **Professor:** Gabriel Silva Denini  
👨‍💻 **Discentes:** Erick Jonathan Macedo dos Santos e Gladistony Silva Lins  
📅 **Data:** 07/03/2025  

---

## 📖 Descrição  

Este projeto implementa um banco de dados para um **Laboratório de Análises Clínicas**, modelando as relações entre pacientes, exames, médicos, técnicos de laboratório e fornecedores.  

---

## 🎯 Objetivo  

Desenvolver um **banco de dados relacional** que atenda às necessidades do laboratório, permitindo:  
- Cadastro e gerenciamento de pacientes, exames, médicos, técnicos e fornecedores.  
- Controle das relações entre exames e profissionais envolvidos.  
- Registro de consultas médicas e rastreamento de materiais utilizados.  
- Consultas SQL para análise e extração de informações relevantes.  

---

## 🏗 Estrutura do Projeto  

1️⃣ **Modelo ER**  
   - Diagrama Entidade-Relacionamento representando a estrutura do banco de dados.  

2️⃣ **Criação das Tabelas (SQL)**  
   - Código SQL para criar todas as tabelas do banco de dados.  

3️⃣ **Inserção de Dados (SQL)**  
   - Script para popular as tabelas com 40 registros cada, exceto a tabela de exames, que contém 80 registros.  

4️⃣ **Consultas Simples (SQL)**  
   - 10 consultas básicas sem o uso de `JOIN`.  

5️⃣ **Consultas Avançadas (SQL)**  
   - 10 consultas utilizando `JOIN` para relacionar dados entre tabelas.  

6️⃣ **Código Ajustado para MySQL**  
   - Scripts compatíveis com MySQL, incluindo criação de procedimentos armazenados para inserção automática de dados.  

---

## 🛠 Tecnologias Utilizadas  

- **Banco de Dados:** MySQL  
- **Linguagem SQL** para criação e manipulação do banco.  

---

## 📂 Estrutura de Arquivos  

```
📂 Trabalho-Banco-De-Dados  
 ├── 📄 modelo_er.png           # Diagrama Entidade-Relacionamento
 ├── 📄 consulta-extra.sql     # Script para cosulta personalizada 
 ├── 📄 criacao_tabelas.sql     # Script para criação das tabelas 
 ├── 📄 insercao_dados.sql      # Script para inserção de dados  
 ├── 📄 consultas_simples.sql   # Consultas SQL sem JOIN  
 ├── 📄 consultas_joins.sql     # Consultas SQL com JOIN  
 ├── 📄 README.md               # Documento de apresentação do projeto  
```  

---

## 🚀 Como Executar  

1️⃣ **Criar o Banco de Dados:**  
   ```sql
   CREATE DATABASE laboratorio;
   USE laboratorio;
   ```

2️⃣ **Executar o script de criação das tabelas:**  
   ```sql
   SOURCE criacao_tabelas.sql;
   ```

3️⃣ **Inserir os dados no banco:**  
   ```sql
   SOURCE insercao_dados.sql;
   ```

4️⃣ **Executar as consultas conforme necessário:**  
   ```sql
   SOURCE consultas_simples.sql;
   SOURCE consultas_joins.sql;
   ```

---

## 📌 Conclusão  

Este projeto fornece uma base sólida para gerenciamento de dados de um laboratório de análises clínicas. Ele inclui desde a modelagem até consultas complexas para análise dos dados armazenados.  

📩 **Contato:** Erick Jonathan Macedo dos Santos & Gladistony Silva Lins  

---
