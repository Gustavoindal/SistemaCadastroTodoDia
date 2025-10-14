import mysql.connector

# Conexão
conexao = mysql.connector.connect(
    host="localhost",
    user="root",
    password="sua_senha",
    database="cadastro_todo_dia"
)

cursor = conexao.cursor()

# Funções CRUD
def listar_clientes():
    cursor.execute("SELECT * FROM cadastrar_clientes")
    for cliente in cursor.fetchall():
        print(cliente)

def adicionar_cliente():
    nome = input("Nome: ")
    endereco = input("Endereço: ")
    telefone = input("Telefone: ")
    email = input("Email: ")
    cpf = input("CPF: ")
    cursor.execute("""
        INSERT INTO cadastrar_clientes (Nome_Cliente, Endereço_Cliente, Telefone_Cliente, Email_Cliente, CPF_Cliente)
        VALUES (%s, %s, %s, %s, %s)
    """, (nome, endereco, telefone, email, cpf))
    conexao.commit()
    print("Cliente adicionado com sucesso!")

def atualizar_cliente():
    id_cliente = int(input("ID do cliente a atualizar: "))
    novo_nome = input("Novo nome: ")
    cursor.execute("UPDATE cadastrar_clientes SET Nome_Cliente = %s WHERE ID_Cliente = %s", (novo_nome, id_cliente))
    conexao.commit()
    print("Cliente atualizado com sucesso!")

def deletar_cliente():
    id_cliente = int(input("ID do cliente a excluir: "))
    cursor.execute("DELETE FROM cadastrar_clientes WHERE ID_Cliente = %s", (id_cliente,))
    conexao.commit()
    print("Cliente deletado com sucesso!")

# Menu principal
while True:
    print("""
    === Sistema Cadastro Todo Dia ===
    1. Listar clientes
    2. Adicionar cliente
    3. Atualizar cliente
    4. Deletar cliente
    5. Sair
    """)
    opcao = input("Escolha uma opção: ")

    if opcao == "1":
        listar_clientes()
    elif opcao == "2":
        adicionar_cliente()
    elif opcao == "3":
        atualizar_cliente()
    elif opcao == "4":
        deletar_cliente()
    elif opcao == "5":
        break
    else:
        print("Opção inválida!")

cursor.close()
conexao.close()
