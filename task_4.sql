import mysql.connector


host = 'localhost'  
password = '937224@chachi' 
database_name = 'alx_book_store' 


conn = mysql.connector.connect(
    host=host,
    user=user,
    password=password,
    database=database_name
)

cursor = conn.cursor()


query = """
SELECT 
    COLUMN_NAME, 
    COLUMN_TYPE, 
    IS_NULLABLE, 
    COLUMN_DEFAULT 
FROM 
    INFORMATION_SCHEMA.COLUMNS 
WHERE 
    TABLE_SCHEMA = 'alx_book_store' 
    AND TABLE_NAME = 'Books';
"""

cursor.execute(query, (database_name,))

results = cursor.fetchall()


print(f"Description of the 'Books' table in '{database_name}':")
print(f"{'COLUMN NAME':<30} {'COLUMN TYPE':<20} {'IS NULLABLE':<15} {'DEFAULT':<15}")
print("-" * 100)
for row in results:
    print(f"{row[0]:<30} {row[1]:<20} {row[2]:<15} {row[3]:<15}")


cursor.close()
conn.close()
