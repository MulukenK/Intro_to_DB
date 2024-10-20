import mysql.connector
from mysql.connector import errorcode

def list_tables():
    try:
        # Establishing the connection
        conn = mysql.connector.connect(
            host='localhost',  
            user='root',  
            password='937224@chachi',  
            database='alx_book_store'
        )
        
        cursor = conn.cursor()

        # Execute a query to retrieve table names
        cursor.execute("SELECT table_name FROM information_schema.tables WHERE table_schema = 'alx_book_store'")
        
        # Fetch all results
        tables = cursor.fetchall()

        # Print the table names
        print("Tables in 'alx_book_store':")
        for table in tables:
            print(table[0])

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
    list_tables()
