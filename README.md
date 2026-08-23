# Bank Data Analysis

Project refers to analysis of bank data **i.e. customers and transactions** with **MS SQL Server** database.

## Relevant information

The project includes the analysis of example bank data containing information about **Customers** and **Transactions**. The analysis was prepared with **MS SQL Server** database.

### Dataset origin

The dataset was **prepared/created** especially for this project and contains sample data about bank customers and transactions. It includes two tables named **Customer** and **Transactions**.

#### Table descriptions:  

#### Customer:
- **customer_id**: customer identifier (**unique**)
- **customer_type**: customer type (**standard, premium, VIP**)
- **age**: customer's age
- **income**: customer's income/earnings (**total value**)

#### Transactions
- **customer_id**: customer identifier associated with the transaction
- **transaction_type**: transaction type  (**incoming, outgoing**)
- **amount**: transaction amount
- **transaction_month**: transaction month (**1-12**)
- **transaction_year**: transaction year

## Data Insights

1. What is the number of customers, average age of customers, total income?
2. How information about **VIP** customers?
3. What is the customer type and sum of income for given type? 
4. What is the sum of incoming **VIP** customer transactions, broken down by transaction year?
5. What is the average income of a customer in their segment?
6. What is the customer rank of their income among all customers?
7. What is the total number of transactions in a given year and month along with a summary for that year?   
8. What is each customer's share of the total transaction amount?
9. How is the previous income of client?
10. What are incoming transactions from **2015** and outgoing transactions from **2016**?

### SQL skills used in this project:  

- **creating tables** and **insert data**,
- **grouping**, 
- **JOINS**,
- **aggregate functions**,
- **subqueries**,
- **window functions** etc.

## Files in this repository include:

-	script for creation of database - **create_tables.sql**
-	script for insert data - **insert_data.sql**
-	script for analysis of bank data -**analysis.sql**

## Technologies:

The project was created with:

-	SQL (**T-SQL**),
-	Microsoft SQL Server (**SQL Server Management Studio**).


