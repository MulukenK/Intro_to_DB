import mysql.connector

conn = mysql.connector.connect(
    host='localhost',
    user='root',
    password='937224@chachi',
    database='alx_book_store'
)

cursor1 = conn.cursor()


insert_query = """
INSERT INTO customer (customer_id, customer_name, email, address)
VALUES (1, 'Cole Baidoo', 'cbaidoo@sandtech.com', '123 Happiness Ave.');
"""


cursor1.execute(insert_query)


conn.commit()

print("Customer inserted successfully.")


cursor1.close()
conn.close()