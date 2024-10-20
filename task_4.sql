import mysql.connector
from mysql.connector import errorcode

def get_books_table_description(database_name):
    try:
        # Establishing the connection
        conn = mysql.connector.connect(
            host='localhost',  
            user='root',  
            password='937224@chachi',  
            database='alx_book_store'
        )
        
        cursor = conn.cursor()

        # Query to get the table description
        query = """
        SELECT 
            COLUMN_NAME, 
            DATA_TYPE, 
            CHARACTER_MAXIMUM_LENGTH, 
            IS_NULLABLE, 
            COLUMN_DEFAULT 
        FROM 
            information_schema.columns 
        WHERE 
            TABLE_SCHEMA = %s 
            AND TABLE_NAME = 'Books';
        """

        cursor.execute(query, (database_name,))
        results = cursor.fetchall()

        # Print the results
        print(f"Description of the 'books' table in '{database_name}':")
        print(f"{'COLUMN NAME':<30} {'DATA TYPE':<20} {'MAX LENGTH':<15} {'IS NULLABLE':<15} {'DEFAULT':<15}")
        print("-" * 100)
        for row in results:
            print(f"{row[0]:<30} {row[1]:<20} {row[2]:<15} {row[3]:<15} {row[4]:<15}")

    except mysql.connector.Error as err:
        if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
            print("Something is wrong with your user name or password")
        elif err.errno == errorcode.ER_BAD_DB_ERROR:
            print("Database does not exist")
        else:
            print(err)
    except Exception as e:
        print(f"An error occurred: {e}")
    finally:
        # Closing the cursor and connection
        if cursor:
            cursor.close()
        if conn:
            conn.close()

if __name__ == "__main__":
    database_name = 'alx_book_store'  # Replace with your database name
    get_books_table_description(database_name)
