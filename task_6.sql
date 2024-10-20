import mysql.connector

conn = mysql.connector.connect(
    host='localhost',
    user='root',
    password='937224@chachi',
    database='alx_book_store'
)

cursor1 = conn.cursor()


insert_query = """
INSERT INTO customer (customer_id, customer_name, email, address) VALUES
(2, 'Blessing Malik', 'bmalik@sandtech.com', '124 Happiness Ave.'),
(3, 'Obed Ehoneah', 'eobed@sandtech.com', '125 Happiness Ave.'),
(4, 'Nehemial Kamolu', 'nkamolu@sandtech.com', '126 Happiness Ave.');
"""


cursor1.execute(insert_query)


conn.commit()

print("Customer inserted successfully.")


cursor1.close()
conn.close()