import mysql.connector #helps connecting to the database
from mysql.connector import Error #helps in creating exceptions

try:
    connection = mysql.connector.connect(host='localhost', database='online_product_purchase_and_delivery_management_system', user='root', password='tarak123#') #establishes connection to the database.
    sql_select_Query = ("""SELECT c.Name as Customer_Name, c.Mobile_number, p.Product_ID,o.Order_ID, p.Name as Product_Name, o.Order_Total
                            FROM customer c
                            INNER JOIN _order o ON c.Customer_ID = o.Customer_ID
                            INNER JOIN order_item oi ON o.Order_ID = oi.Order_ID
                            INNER JOIN product p ON oi.Product_ID = p.Product_ID;""") #creating a query to pull the data.
    cursor = connection.cursor()
    cursor.execute(sql_select_Query) #executes the given query.
    records = cursor.fetchall()
    with open("C:\\Users\\btv99\\Downloads\\report.txt", "a") as f: #opening a text document to write the queried data.
        print("\n       TITLE : CUSTOMER ORDER REPORT\n", file =f) #prints title in file
        for row in records:
            print("Customer_Name = ", row[0], file = f )    #writes the first column value in the queried table with name Customer_Name
            print("Mobile_Number = ", row[1], file = f)     #writes the second column value in the queried table with name Mobile_Number
            print("Product_ID = ", row[2], file = f)        #writes the third column value in the queried table with name Product_ID
            print("Order_ID = ", row[3], file = f)          #writes the fourth column value in the queried table with name Order_ID
            print("Product_Name = ", row[4], file = f)      #writes the fifth column value in the queried table with name Product_Name
            print("Order_Total = ", row[5],file = f)        #writes the sixth column value in the queried table with name Order_Total
            print("\n", file = f)
        f.close()
except Error as e:
    print("Error reading data from MySQL table", e) #exception message if any error arises.
finally:
    if connection.is_connected():
        connection.close()
        cursor.close()
        print("MySQL connection is closed")
f=open("C:\\Users\\btv99\\Downloads\\report.txt")   #opoens the created file.
print(f.read()) #prints the data entered into to file in the output terminal.
f.close()