import mysql.connector
from mysql.connector import errorcode

def get_books_table_description(database_name):
    try:
       
        conn = mysql.connector.connect(
            host='localhost',  
            user='root',  
            password='937224@chachi',  
            database='alx_book_store'
        )
        
        
        cursor = conn.cursor()

        # Use the database
        cursor.execute(f"USE {alx_book_store}")

        # Query to get the column details of the 'Books' table
        cursor.execute("SHOW COLUMNS FROM Books")
        
        results = cursor.fetchall()

        # Print the results
        print(f"Description of the 'Books' table in '{alx_book_store}':")
        print(f"{'FIELD':<30} {'TYPE':<20} {'NULL':<15} {'KEY':<15} {'DEFAULT':<15} {'EXTRA':<15}")
        print("-" * 100)
        for row in results:
            print(f"{row[0]:<30} {row[1]:<20} {row[2]:<15} {row[3]:<15} {row[4]:<15} {row[5]:<15}")

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
    database_name = 'alx_book_store'  
    get_books_table_description(database_name)
