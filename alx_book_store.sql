import mysql.connector


connection = mysql.connector.connect(
    host='localhost',     
    user='root',   
    password='937224@chachi' 
)


cursor = connection.cursor()


cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store;")
cursor.execute("USE alx_book_store;")


cursor.execute("""
    CREATE TABLE IF NOT EXISTS Authors (
        author_id INT AUTO_INCREMENT PRIMARY KEY,
        author_name VARCHAR(215) NOT NULL
    );
""")


cursor.execute("""
    CREATE TABLE IF NOT EXISTS Books (
        book_id INT AUTO_INCREMENT PRIMARY KEY,
        title VARCHAR(130) NOT NULL,
        author_id INT,
        price DOUBLE NOT NULL,
        publication_date DATE,
        FOREIGN KEY (author_id) REFERENCES Authors(author_id) ON DELETE SET NULL
    );
""")


cursor.execute("""
    CREATE TABLE IF NOT EXISTS Customers (
        customer_id INT AUTO_INCREMENT PRIMARY KEY,
        customer_name VARCHAR(215) NOT NULL,
        email VARCHAR(215) NOT NULL UNIQUE,
        address TEXT NOT NULL
    );
""")


cursor.execute("""
    CREATE TABLE IF NOT EXISTS Orders (
        order_id INT AUTO_INCREMENT PRIMARY KEY,
        customer_id INT,
        order_date DATE NOT NULL,
        FOREIGN KEY (customer_id) REFERENCES Customers(customer_id) ON DELETE CASCADE
    );
""")


cursor.execute("""
    CREATE TABLE IF NOT EXISTS Order_Details (
        orderdetailid INT AUTO_INCREMENT PRIMARY KEY,
        order_id INT,
        book_id INT,
        quantity DOUBLE NOT NULL,
        FOREIGN KEY (order_id) REFERENCES Orders(order_id) ON DELETE CASCADE,
        FOREIGN KEY (book_id) REFERENCES Books(book_id) ON DELETE CASCADE
    );
""")


connection.commit()
cursor.close()
connection.close()

print("Database and tables created successfully!")