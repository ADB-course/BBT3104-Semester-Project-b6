[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/fbNyN1as)
# BBT3104: Advanced Database Sytems Semester Project

| **Key**                                                               | Value                                                                                                                                                                              |
|---------------|---------------------------------------------------------|
| **Name of Business Chosen for the Case Study**                                   |  VIVO ENERGY |
| **Industry**          PETROLEUM                                  | PETROLEUM |
| **Group Name**   B6                                                            | B6 |
| **Semester Duration**                                                 | 19<sup>th</sup> August - 25<sup>th</sup> November 2024                                                                                                                       |

# Cause-and-Effect Diagram

<img width="443" alt="image" src="https://github.com/user-attachments/assets/4096f764-722b-4a79-a9c8-4452cfdd7c33">


# Enhanced Entity Relationship Diagram (EERD)

  <img width="517" alt="image" src="https://github.com/user-attachments/assets/d0725415-1c0c-4689-8010-d70da7e73acf">


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
Proposed Architecture
We recommend using an N-Tier Client-Server Architecture for scalability, security, and performance. Below is the architecture:
Layers and Responsibilities
Client Layer:
End-user devices (laptops, desktops, or mobile devices) running web browsers or applications for interacting with the system.
Web Server Layer:
Hosts the web application, processes user requests, and forwards them to the application server.
Application Server Layer:
Contains business logic and APIs for interacting with the database.
Database Server Layer:
Stores, retrieves, and manages the database.

<img width="206" alt="image" src="https://github.com/user-attachments/assets/44aa69b8-974d-4350-b370-f6f019771ae1">

Justification of the Proposed Architecture
Scalability:
The N-tier design supports adding more users or functionality without overhauling the system. For example, new APIs or servers can be integrated seamlessly.
Security:
The database is isolated from the client layer, minimizing the risk of unauthorized access.
Performance:
Dividing responsibilities across layers ensures efficient processing. The web server handles UI, the application server manages business logic, and the database server focuses solely on data storage and queries.
Flexibility:
This architecture allows integration with other systems (e.g., APIs) and supports various client devices.
Cost Efficiency:
While the initial setup cost is significant, the modularity reduces long-term maintenance and upgrade expenses.
