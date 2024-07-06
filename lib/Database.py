import psycopg2


db_conn = """
    host='localhost'
    dbname='smartbit'
    user='postgres'
    password='QAx@123'
    """


def execute(query):
    conn = psycopg2.connect(db_conn)

    cur = conn.cursor()
    cur.execute(query)
    conn.commit()
    conn.close()


def insert_account(account):
    query = f"""
        INSERT INTO accounts(name, email, cpf)
        VALUES ('{account["name"]}', '{account["email"]}', '{account["cpf"]}');
        """
    execute(query)


def delete_account_by_email(email):
    query = f"DELETE FROM public.accounts	WHERE email = '{email}';"

    execute(query)


def insert_account_duplicate_email(account_email_dup):
    query = f"""
        INSERT INTO accounts(name, email, cpf)
        VALUES ('{account_email_dup["name"]}',
        '{account_email_dup["email"]}',
        '04528847051');
        """
    execute(query)


def delete_account_by_email_dup():
    query = "DELETE FROM public.accounts	WHERE email = 'crisitiano@ig.com';"

    execute(query)


def delete_account_by_cpf(cpf):
    query = f"DELETE FROM public.accounts	WHERE cpf = '{cpf}';"

    execute(query)


def insert_account_duplicate_cpf(account_cpf_dup):
    query = f"""
        INSERT INTO accounts(name, email, cpf)
        VALUES ('{account_cpf_dup["name"]}',
        'crisitiano@ig.com',
        '{account_cpf_dup["cpf"]}');
        """
    execute(query)


def insert_membership(data):
    account = data["account"]
    plan = data["plan"]
    credit_card = data["credit_card"]["number"][-4]

    query = f"""
        BEGIN; -- Inicia uma transação

        -- Remove o registro pelo email
        DELETE FROM accounts
        WHERE email = '{account["email"]}';

        -- Insere uma nova conta e obtém o ID da conta recém-inserida
        WITH new_account AS (
            INSERT INTO accounts (name, email, cpf)
            VALUES (
                '{account["name"]}',
                '{account["email"]}',
                '{account["cpf"]}')
            RETURNING id
        )

        -- Insere um registro na tabela memberships com o ID da conta
        INSERT INTO memberships
        (account_id, plan_id, credit_card, price, status)
        SELECT id, {plan["id"]}, '{credit_card}', {plan["price"]}, true
        FROM new_account;

        COMMIT; -- Confirma a transação
        """
    execute(query)
