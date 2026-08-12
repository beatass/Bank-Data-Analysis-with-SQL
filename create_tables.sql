-------------------------------- Bank Data Analysis -----------------------------------

/* CREATE TABLES */

CREATE TABLE Customer
(customer_id int,
customer_type varchar(50),
age  int,
income int
)


CREATE TABLE Transactions
(customer_id int,
transaction_type varchar(50),
amount int,
transaction_month int,
transaction_year int)
