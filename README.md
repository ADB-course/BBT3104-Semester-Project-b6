[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/fbNyN1as)
# BBT3104: Advanced Database Sytems Semester Project

| **Key**                                                               | Value                                                                                                                                                                              |
|---------------|---------------------------------------------------------|
| **Name of Business Chosen for the Case Study**    VIVO ENERGY                                | ? |
| **Industry**          PETROLEUM                                  | ? |
| **Group Name**   B6                                                            | ? |
| **Semester Duration**                                                 | 19<sup>th</sup> August - 25<sup>th</sup> November 2024                                                                                                                       |

# Cause-and-Effect Diagram


# Enhanced Entity Relationship Diagram (EERD)
  

# Database Schema
1.Customer
Attribute
Datatype
Constraints
Customer_ID
INT
PRIMARY KEY
Name
VARCHAR(255)
NOT NULL
Address
VARCHAR(255)


Phone Number
VARCHAR(15)


Email
VARCHAR(255


Customer_Type
ENUM('Individual', 'Corporate')
NOT NULL


2.Retail station
Attribute
Datatype
Constraints
Station_ID
INT
PRIMARY KEY
Station_Name
VARCHAR(255)
NOT NULL
Location
VARCHAR(255)







3.Product
Attribute
Datatype
Constraints
Product_ID
INT
PRIMARY KEY
Product_Name
VARCHAR(255)
NOT NULL
Price
DECIMAL(10,2)
NOT NULL


4.Order
Attribute
Datatype
Constraint
Order_ID
INT
PRIMARY KEY
Customer_ID
INT
FOREIGN KEY REFERENCES Customer(Customer_ID) ON DELETE CASCADE
Station_ID
INT
FOREIGN KEY REFERENCES Retail_Station(Station_ID) ON DELETE SET NULL
Order_Date
DATE
NOT NULL
Expected_Delivery_Date
DATE


Actual_Delivery_Date
DATE


Order_Status
ENUM('Cancelled', 'Pending Payment', 'Pending Delivery', 'Delivered')
NOT NULL

5.Order_Product(Associative Entity)

Attribute
Data type
Constraints
Order_Product_ID
INT
PRIMARY KEY
Order_ID
INT
FOREIGN KEY REFERENCES Order(Order_ID) ON DELETE CASCADE
Product_ID
INT
FOREIGN KEY REFERENCES Product(Product_ID) ON DELETE CASCADE




# System Architecture
