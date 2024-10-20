import mysql.connector
from mysql.connector import errorcode

def create_tables():
    try:
       
        conn = mysql.connector.connect(
            host='localhost',  
            user='root', 
            password='937224@chachi', 
            database='alx_book_store'
        )
        
        cursor = conn.cursor()

        
        create_authors_table = """
        CREATE TABLE IF NOT EXISTS Authors (
            author_id INT AUTO_INCREMENT PRIMARY KEY,
            author_name VARCHAR(215) NOT NULL
        )
        """

        create_books_table = """
        CREATE TABLE IF NOT EXISTS Books (
            book_id INT AUTO_INCREMENT PRIMARY KEY,
            title VARCHAR(130) NOT NULL,
            author_id INT,
            price DOUBLE,
            publication_date DATE,
            FOREIGN KEY (author_id) REFERENCES authors(author_id)
        )
        """

        create_customers_table = """
        CREATE TABLE IF NOT EXISTS Customers (
            customer_id INT AUTO_INCREMENT PRIMARY KEY,
            customer_name VARCHAR(215) NOT NULL,
            email VARCHAR(215) NOT NULL UNIQUE,
            address TEXT
        )
        """

        create_orders_table = """
        CREATE TABLE IF NOT EXISTS Orders (
            order_id INT AUTO_INCREMENT PRIMARY KEY,
            customer_id INT,
            order_date DATE,
            FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
        )
        """

        create_order_details_table = """
        CREATE TABLE IF NOT EXISTS Order_Details (
            orderdetailid INT AUTO_INCREMENT PRIMARY KEY,
            order_id INT,
            book_id INT,
            quantity DOUBLE NOT NULL,
            FOREIGN KEY (order_id) REFERENCES Orders(order_id),
            FOREIGN KEY (book_id) REFERENCES Books(book_id)
        )
        """

       
        cursor.execute(create_authors_table)
        cursor.execute(create_books_table)
        cursor.execute(create_customers_table)
        cursor.execute(create_orders_table)
        cursor.execute(create_order_details_table)

        print("Tables created successfully!")

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
    create_tables()
