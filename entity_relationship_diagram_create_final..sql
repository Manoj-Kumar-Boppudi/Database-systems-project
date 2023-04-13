-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2023-04-12 22:55:37.066

-- tables
-- Table: Customer
CREATE TABLE Customer (
    Customer_ID int  NOT NULL,
    Name varchar(255)  NOT NULL,
    Resident_Address  varchar(255)  NOT NULL,
    Mobile_number varchar(20)  NOT NULL,
    Email_address varchar(100)  NOT NULL,
    CONSTRAINT Customer_pk PRIMARY KEY (Customer_ID)
);

-- Table: Delivery
CREATE TABLE Delivery (
    Delivery_ID int  NOT NULL,
    Delivery_Status varchar(20)  NOT NULL,
    Delivery_Address varchar(255)  NOT NULL,
    Delivery_Date datetime  NOT NULL,
    Order_ID int  NOT NULL,
    Employee_ID int  NOT NULL,
    CONSTRAINT Delivery_pk PRIMARY KEY (Delivery_ID)
);

-- Table: Employee
CREATE TABLE Employee (
    Employee_ID int  NOT NULL,
    Name varchar(255)  NOT NULL,
    Address varchar(255)  NOT NULL,
    Mobile_number varchar(20)  NOT NULL,
    Email_address varchar(50)  NOT NULL,
    Designation varchar(50)  NOT NULL,
    CONSTRAINT Employee_pk PRIMARY KEY (Employee_ID)
);

-- Table: Inventory
CREATE TABLE Inventory (
    Inventory_ID int  NOT NULL,
    Quantity int  NOT NULL,
    Recorder_Level int  NOT NULL,
    Product_ID int  NOT NULL,
    Warehouse_ID int  NOT NULL,
    CONSTRAINT Inventory_pk PRIMARY KEY (Inventory_ID)
);

-- Table: Order_Item
CREATE TABLE Order_Item (
    Order_Item_ID int  NOT NULL,
    Quantity int  NOT NULL,
    Total_price float(10,2)  NOT NULL,
    Order_ID int  NOT NULL,
    Product_ID int  NOT NULL,
    CONSTRAINT Order_Item_pk PRIMARY KEY (Order_Item_ID)
);

-- Table: Product
CREATE TABLE Product (
    Product_ID int  NOT NULL,
    Name varchar(255)  NOT NULL,
    Description varchar(255)  NOT NULL,
    Unit_Price float(8,2)  NOT NULL,
    CONSTRAINT Product_pk PRIMARY KEY (Product_ID)
);

-- Table: Warehouse
CREATE TABLE Warehouse (
    Warehouse_ID int  NOT NULL,
    Name varchar(255)  NOT NULL,
    Address varchar(255)  NOT NULL,
    Phone varchar(20)  NOT NULL,
    Employee_ID int  NOT NULL,
    CONSTRAINT Warehouse_pk PRIMARY KEY (Warehouse_ID)
);

-- Table: _Order
CREATE TABLE _Order (
    Order_ID int  NOT NULL,
    Order_Date datetime  NOT NULL,
    Order_Total int  NOT NULL,
    Order_status varchar(50)  NOT NULL,
    Delivery_Address varchar(255)  NOT NULL,
    Customer_ID int  NOT NULL,
    CONSTRAINT _Order_pk PRIMARY KEY (Order_ID)
);

-- foreign keys
-- Reference: Delivery_Employee (table: Delivery)
ALTER TABLE Delivery ADD CONSTRAINT Delivery_Employee FOREIGN KEY Delivery_Employee (Employee_ID)
    REFERENCES Employee (Employee_ID);

-- Reference: Delivery_Order (table: Delivery)
ALTER TABLE Delivery ADD CONSTRAINT Delivery_Order FOREIGN KEY Delivery_Order (Order_ID)
    REFERENCES _Order (Order_ID);

-- Reference: Inventory_Product (table: Inventory)
ALTER TABLE Inventory ADD CONSTRAINT Inventory_Product FOREIGN KEY Inventory_Product (Product_ID)
    REFERENCES Product (Product_ID);

-- Reference: Inventory_Warehouse (table: Inventory)
ALTER TABLE Inventory ADD CONSTRAINT Inventory_Warehouse FOREIGN KEY Inventory_Warehouse (Warehouse_ID)
    REFERENCES Warehouse (Warehouse_ID);

-- Reference: Order_Customer (table: _Order)
ALTER TABLE _Order ADD CONSTRAINT Order_Customer FOREIGN KEY Order_Customer (Customer_ID)
    REFERENCES Customer (Customer_ID);

-- Reference: Order_Item_Order (table: Order_Item)
ALTER TABLE Order_Item ADD CONSTRAINT Order_Item_Order FOREIGN KEY Order_Item_Order (Order_ID)
    REFERENCES _Order (Order_ID);

-- Reference: Order_Item_Product (table: Order_Item)
ALTER TABLE Order_Item ADD CONSTRAINT Order_Item_Product FOREIGN KEY Order_Item_Product (Product_ID)
    REFERENCES Product (Product_ID);

-- Reference: Warehouse_Employee (table: Warehouse)
ALTER TABLE Warehouse ADD CONSTRAINT Warehouse_Employee FOREIGN KEY Warehouse_Employee (Employee_ID)
    REFERENCES Employee (Employee_ID);

-- End of file.

