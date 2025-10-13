import mysql.connector

# 1. Conexão com o banco
conexao = mysql.connector.connect(
    host="localhost",
    user="root",
    password="sua_senha",
    database="cadastro_todo_dia"
)

cursor = conexao.cursor()

# 2. SELECT simples
cursor.execute("SELECT * FROM cadastrar_clientes")
clientes = cursor.fetchall()

print("=== Lista de Clientes ===")
for cliente in clientes:
    print(cliente)

# 3. INSERT (exemplo de cadastro)
comando = """
INSERT INTO cadastrar_clientes 
(ID_Cliente, Nome_Cliente, Endereço_Cliente, Telefone_Cliente, Email_Cliente, CPF_Cliente)
VALUES (10, 'Laura Pinto', 'Rua Nova, 15', '48999119900', 'laura@email.com', '44433322211')
"""
cursor.execute(comando)
conexao.commit()  # Confirma a inserção

print("Cliente adicionado com sucesso!")

# 4. Fechar conexão
cursor.close()
conexao.close()
