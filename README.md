Sistema de Cadastro Todo Dia
Projeto desenvolvido para praticar banco de dados MySQL, integração com Python e uso completo do CRUD (Create, Read, Update, Delete).

Objetivo do Projeto
Criar um sistema que simule o gerenciamento de uma loja, com cadastro de:

•	Clientes
•	Produtos
•	Fornecedores
•	Vendas (Caixa)
•	Usuários do sistema

O foco do projeto foi aprender:

•	Criação de banco de dados e tabelas relacionais
•	Uso de chaves primárias e estrangeiras
•	Inserção, consulta, atualização e exclusão de dados
•	Criação de triggers para automação (ex: atualização automática de estoque)
•	Integração entre Python e MySQL

Estrutura do Projeto
Banco de Dados
•	O banco foi criado em MySQL, contendo as seguintes tabelas:
•	cadastrar_clientes
•	cadastrar_produtos
•	cadastro_de_fornecedores
•	caixa
•	produto_fornecedor
•	usuarios

Inclui também:
•	Chaves estrangeiras para relacionar dados entre tabelas
•	Trigger automática para atualizar o estoque após cada venda

Funcionalidades Principais (CRUD)

Ação	Descrição
CREATE	Inserção de dados nas tabelas (INSERT INTO)
READ	Consulta geral ou específica (SELECT com WHERE)
UPDATE	Correção de registros incorretos (UPDATE)
DELETE	Remoção de registros por ID (DELETE)
TRIGGER	Atualiza automaticamente o estoque após uma venda

Integração com Python
A integração foi feita usando a biblioteca mysql.connector.
Para instalar, digite no terminal:
pip install mysql-connector-python

Como rodar o projeto

1. Instale a biblioteca do MySQL para Python:
pip install mysql-connector-python

2. Abra o projeto no PyCharm.

3. Certifique-se de que o MySQL está rodando e importe o arquivo do banco de dados (.sql) pelo MySQL Workbench.

4. Execute o script Python.

Aprendizados
Durante o desenvolvimento, aprendi a:
•	Modelar um banco de dados completo com relacionamentos
•	Aplicar o CRUD em SQL
•	Criar triggers automatizadas
•	Conectar o Python ao MySQL para manipulação de dados reais
•	Organizar e documentar um projeto completo para GitHub

Tecnologias Utilizadas
•	MySQL 8
•	Python 3
•	MySQL Workbench
•	PyCharm
•	
Autor
Gustavo Indalêncio da Silva
Estudante de Desenvolvimento de Sistemas – SENAC
Outubro de 2025


