CREATE DATABASE IF NOT EXISTS cadastro_todo_dia;
USE cadastro_todo_dia;

-- Tabela de Clientes
CREATE TABLE cadastrar_clientes (
  ID_Cliente INT PRIMARY KEY NOT NULL,
  Nome_Cliente VARCHAR(100) NOT NULL,
  Endereço_Cliente VARCHAR(100) NOT NULL,
  Telefone_Cliente VARCHAR(100) NOT NULL,
  Email_Cliente VARCHAR(100) NOT NULL,
  CPF_Cliente VARCHAR(100) NOT NULL
);

-- Tabela de Produtos
CREATE TABLE cadastrar_produtos (
  ID_Produto INT PRIMARY KEY NOT NULL,
  Nome_Produto VARCHAR(100) NOT NULL,
  Tipo_de_Produto VARCHAR(100) NOT NULL,
  Estoque_Produto INT NOT NULL,
  Preco_Custo DECIMAL(10,2),
  Valor_Unitario DECIMAL(10,2),
  Margem_Lucro DECIMAL(5,2)
);

-- Tabela de Fornecedores
CREATE TABLE cadastro_de_fornecedores (
  ID_Fornecedor INT PRIMARY KEY NOT NULL,
  Nome_Fornecedor VARCHAR(100) NOT NULL,
  Email_Fornecedor VARCHAR(100) NOT NULL,
  Telefone_Fornecedor VARCHAR(100) NOT NULL,
  Endereco_Fornecedor VARCHAR(100) NOT NULL,
  Rua_Fornecedor VARCHAR(100) NOT NULL,
  Bairro_Fornecedor VARCHAR(100) NOT NULL,
  Estado_Fornecedor VARCHAR(100) NOT NULL,
  CEP_Fornecedor VARCHAR(8) NOT NULL,
  CNPJ_Fornecedor VARCHAR(14) NOT NULL,
  Historico_de_fornecimento VARCHAR(100) NOT NULL,
  Ramo_de_atuação VARCHAR(100) NOT NULL
);

-- Tabela de Caixa
CREATE TABLE caixa (
  ID_Caixa INT PRIMARY KEY NOT NULL,
  Cliente INT NOT NULL,
  Produto INT NOT NULL,
  Forma_de_pagamento VARCHAR(100) NOT NULL,
  Quantidade_Vendida INT NOT NULL,
  Valor_Unitario DECIMAL(10,2),
  Valor_Final DECIMAL(10,2),
  FOREIGN KEY (Cliente) REFERENCES cadastrar_clientes (ID_Cliente) ON DELETE CASCADE,
  FOREIGN KEY (Produto) REFERENCES cadastrar_produtos (ID_Produto) ON DELETE CASCADE -- Usei o cascade para deixar o DELETE mais prático com as FKS
);

-- Tabela de relação entre Produto e Fornecedor
CREATE TABLE produto_fornecedor (
  ID_Fornecedor INT NOT NULL,
  ID_Produto INT NOT NULL,
  PRIMARY KEY (ID_Fornecedor, ID_Produto),
  FOREIGN KEY (ID_Fornecedor) REFERENCES cadastro_de_fornecedores (ID_Fornecedor) ON DELETE CASCADE,
  FOREIGN KEY (ID_Produto) REFERENCES cadastrar_produtos (ID_Produto) ON DELETE CASCADE -- Usei o cascade para deixar o DELETE mais prático com as FKS
);

-- Tabela de Usuários do Sistema
CREATE TABLE usuarios (
	Usuario_ID INT PRIMARY KEY NOT NULL,
    Login VARCHAR(100),
    Senha VARCHAR(100),
	Perfil VARCHAR(100)
);

USE cadastro_todo_dia;

-- TABELA: CADASTRAR_CLIENTES

INSERT INTO cadastrar_clientes (ID_Cliente, Nome_Cliente, Endereço_Cliente, Telefone_Cliente, Email_Cliente, CPF_Cliente) 
VALUES
(1, 'Carlos Silva', 'Rua das Flores, 123', '48999112233', 'carlos.silva@email.com', '12345678900'),
(2, 'Ana Souza', 'Av. Brasil, 456', '48988114455', 'ana.souza@email.com', '98765432100'),
(3, 'João Pereirra', 'Rua Central, 789', '48997778866', 'joao.pereirra@email.com', '11122233344'), -- nome com erro proposital
(4, 'Mariana Costa', 'Rua Verde, 99', '48999887766', 'mariana.costa@email.com', '55566677788'),
(5, 'Pedro Almeido', 'Rua das Laranjeiras, 10', '48991122334', 'pedro.almeido@email.com', '99988877766'); -- sobrenome com erro

-- TABELA: CADASTRAR_PRODUTOS

INSERT INTO cadastrar_produtos (ID_Produto, Nome_Produto, Tipo_de_Produto, Estoque_Produto, Preco_Custo, Valor_Unitario, Margem_Lucro) 
VALUES
(1, 'Sabão Líquido', 'Limpeza', 100, 8.50, 12.90, 25.0),
(2, 'Arroz Branco 5kg', 'Alimentos', 50, 18.00, 25.00, 30.0),
(3, 'Café Tradicional', 'Alimentos', 75, 10.00, 13.50, 20.0),
(4, 'Detergentee', 'Limpeza', 40, 3.00, 6.00, 50.0), -- erro proposital no nome
(5, 'Feijão Preto 1kg', 'Alimentos', 0, 7.50, 9.90, 15.0); 

-- TABELA: CADASTRO_DE_FORNECEDORES

INSERT INTO cadastro_de_fornecedores (ID_Fornecedor, Nome_Fornecedor, Email_Fornecedor, Telefone_Fornecedor, Endereco_Fornecedor, Rua_Fornecedor, Bairro_Fornecedor, Estado_Fornecedor, CEP_Fornecedor, CNPJ_Fornecedor, Historico_de_fornecimento, Ramo_de_atuação) 
VALUES
(1, 'LimpaTudo LTDA', 'contato@limpatudo.com', '48999887755', 'Rua A, 10', 'Rua A', 'Centro', 'SC', '88990000', '12345678000101', '5 anos de parceria', 'Limpeza'),
(2, 'AlimBrasil', 'contato@alimbra.com', '48988776655', 'Rua B, 20', 'Rua B', 'Comercial', 'SC', '88990001', '98765432000199', '2 anos de parceria', 'Alimentos'),
(3, 'Café&Companhia', 'vendas@cafecomp.com', '48977665544', 'Rua C, 30', 'Rua C', 'Centro', 'RS', '90000000', '11223344000155', 'Fornece café', 'Alimentos'),
(4, 'Higienar Brasil', 'higienar@email', '48966778899', 'Rua D, 40', 'Rua D', 'Industrial', 'PR', '80000000', '44556677000188', 'Email incorreto', 'Limpeza'), -- erro proposital no email
(5, 'Distribuidora Sul', 'contato@distsul.com', '48955667788', 'Rua E, 50', 'Rua E', 'Centro', 'SC', '88990002', '77889966000177', 'Novo fornecedor', 'Diversos');

-- TABELA: PRODUTO_FORNECEDOR

INSERT INTO produto_fornecedor (ID_Fornecedor, ID_Produto) 
VALUES
(1, 1),
(1, 4),
(2, 2),
(3, 3),
(5, 5);

-- TABELA: USUÁRIOS

INSERT INTO usuarios (Usuario_ID, Login, Senha, Perfil) 
VALUES
(1, 'admin', 'senha123', 'gerente'),
(2, 'caixa1', '1234', 'caixa'),
(3, 'caixa2', 'abcd', 'caixa'),
(4, 'joaoadm', 'senha', 'gerente'),
(5, 'testeuser', '0000', 'caiax'); -- erro proposital no perfil

-- TABELA: CAIXA

INSERT INTO caixa (ID_Caixa, Cliente, Produto, Forma_de_pagamento, Quantidade_Vendida, Valor_Unitario, Valor_Final) 
VALUES
(1, 1, 1, 'Crédito', 2, 12.90, 25.80),
(2, 2, 3, 'Dinheiro', 1, 13.50, 13.50),
(3, 3, 2, 'Débito', 3, 25.00, 75.00),
(4, 4, 4, 'Pix', 5, 6.00, 30.00),
(5, 5, 5, 'Crédito', 2, 9.90, 19.80);

USE cadastro_todo_dia;

-- Tabela cadastrar_clientes

SELECT * FROM cadastrar_clientes; -- Select geral
SELECT Nome_Cliente, Telefone_Cliente FROM cadastrar_clientes WHERE ID_cliente = 2; -- Select especifico

UPDATE cadastrar_clientes SET Nome_Cliente = 'João Pereira' WHERE ID_Cliente = 3; -- Corrigindo nomes errados
UPDATE cadastrar_clientes SET Nome_Cliente = 'Pedro Almeida' WHERE ID_Cliente = 5; -- Corrigindo nomes errados

DELETE FROM cadastrar_clientes WHERE ID_Cliente = 1; -- Usando DELETE

-- Tabela cadastrar_produtos

SELECT * FROM cadastrar_produtos; -- Select Geral
SELECT Nome_Produto, Valor_Unitario FROM cadastrar_produtos WHERE ID_Produto = 2; -- Select especifico

UPDATE cadastrar_produtos SET Nome_Produto = 'Sabonete Lavanda' WHERE ID_Produto = 1; -- Corrigindo nomes errados

DELETE FROM cadastrar_produtos WHERE ID_Produto = 4; -- Usando Delete

-- Tabela cadastro_de_fornecedores

SELECT * FROM cadastro_de_fornecedores; -- Select geral
SELECT Nome_Fornecedor, Telefone_Fornecedor FROM cadastro_de_fornecedores WHERE ID_Fornecedor = 2; -- Select especifico

UPDATE cadastro_de_fornecedores SET Nome_Fornecedor = 'Fornecedora Norte' WHERE ID_Fornecedor = 3; -- Corrigindo nomes errados

DELETE FROM cadastro_de_fornecedores WHERE ID_Fornecedor = 5; -- Usando Delete

-- Tabela caixa

SELECT * FROM caixa; -- Select geral
SELECT ID_Caixa, Valor_Final FROM caixa WHERE Cliente = 2; -- Select especifico

UPDATE caixa SET Forma_de_pagamento = 'Pix' WHERE ID_Caixa = 2; -- Corrigindo nomes errados

DELETE FROM caixa WHERE ID_Caixa = 1; -- Usando Delete

-- Tabela produto_fornecedor

SELECT * FROM produto_fornecedor; -- Select geral
SELECT * FROM produto_fornecedor WHERE ID_Fornecedor = 2; -- Select especifico

UPDATE produto_fornecedor SET ID_Produto = 1 WHERE ID_Fornecedor = 3; -- Corrigindo erros

DELETE FROM produto_fornecedor WHERE ID_Fornecedor = 1; -- Usando Delete

-- Tabela Usuarios

SELECT * FROM usuarios; -- Select geral
SELECT Login, Perfil FROM usuarios WHERE Usuario_ID = 3; -- Select especifico

UPDATE usuarios SET Senha = 'novaSenha123' WHERE Usuario_ID = 3; -- Atualizando senhas

DELETE FROM usuarios WHERE Usuario_ID = 5; -- Usando delete

DELIMITER //

CREATE TRIGGER Atualiza_Estoque -- Atualiza o estoque a cada produto vendido
AFTER INSERT ON caixa
FOR EACH ROW
BEGIN
    UPDATE cadastrar_produtos
    SET Estoque_Produto = Estoque_Produto - NEW.Quantidade_Vendida
    WHERE ID_Produto = NEW.Produto;
END //

DELIMITER ;