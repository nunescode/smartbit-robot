import psycopg2
import os
from dotenv import load_dotenv

load_dotenv()

db_conn = {
    "host": os.getenv("DB_HOST"),
    "port": os.getenv("DB_PORT"),
    "dbname": os.getenv("DB_NAME"),
    "user": os.getenv("DB_USER"),
    "password": os.getenv("DB_PASS"),
}

print(db_conn) 

def execute(query):
    conn = None
    try:
        conn = psycopg2.connect(**db_conn)
        cur = conn.cursor()
        cur.execute(query)
        conn.commit()
        cur.close()
    except Exception as e:
        print(f"Erro ao executar a query: {query}")
        print(f"Detalhes do erro: {e}")
    finally:
        if conn:
            conn.close()


def insert_membership(data):

    account=data["account"]
    plan=data["plan"]
    credit_card=data["credit_card"]["number"][-4]

    query = f"""
    BEGIN; -- Inicia uma transação

    -- Remove o registro pelo email
    DELETE FROM accounts
    WHERE email = '{account["email"]}';

    -- Insere uma nova conta e obtém o ID da conta recém-inserida
    WITH new_account AS (
    INSERT INTO accounts (name, email, cpf)
    VALUES ('{account["name"]}', '{account["email"]}', '{account["cpf"]}')
    RETURNING id
    )

    -- Insere um registro na tabela memberships com o ID da conta
    INSERT INTO memberships (account_id, plan_id, credit_card, price, status)
    SELECT id, {plan["id"]}, '{credit_card}', {plan["price"]}, true
    FROM new_account;

    COMMIT; -- Confirma a transação
    """
    execute(query)


def insert_account(account):
    query = f"""
        INSERT INTO accounts (name, email, cpf) 
        VALUES ('{account["name"]}', '{account["email"]}', '{account["cpf"]}');
    """
    execute(query)


def delete_account_by_email(email):
    query = f"DELETE FROM accounts WHERE email = '{email}';"
    try:
        execute(query)
        print(f"Conta com email '{email}' deletada com sucesso.")
    except Exception as e:
        print(f"Erro ao deletar conta com email '{email}': {e}")
