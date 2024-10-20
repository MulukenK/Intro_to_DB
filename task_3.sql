import mysql.connector
from mysql.connector import errorcode

def list_tables():
    try:
        
        conn = mysql.connector.connect(
            host='localhost',  
            user='root',  
            password='937224@chachi',  
            database='alx_book_store'
        )
        
      
        
        cursor = conn.cursor()

        cursor.execute("USE alx_book_store;")
        cursor.execute("SHOW TABLES")
  
        tables = cursor.fetchall()

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
        
        if cursor:
            cursor.close()
        if conn:
            conn.close()

if __name__ == "__main__":
    list_tables()