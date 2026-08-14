-------------------------------- Bank Data Analysis -----------------------------------

-- Data Analysis using SQL


-- 1. What is the number of customers, average age of customers and total income?

SELECT COUNT(customer_id) AS customer_count, 
       AVG(age) AS avg_age, 
	   SUM(income) AS avg_income
FROM Customer

-- 2. Show information about VIP customers? 
SELECT *
FROM Customer
WHERE customer_type = 'VIP'

-- 3. What is the customer type and sum of income for given type where the customer is less than 40 years old (or equal to 40).

SELECT customer_type, SUM(income) AS avg_income
FROM Customer
GROUP BY customer_type
HAVING AVG(age) <= 40 
ORDER BY SUM(income)

-- 4. What is the sum of incoming VIP customer transactions, broken down by transaction year?

SELECT SUM(amount) AS SumTransactions, transaction_year
FROM Transactions tra
JOIN Customer cu
    ON tra.customer_id = cu.customer_id
WHERE transaction_type = 'incoming' AND customer_type = 'VIP'
GROUP BY transaction_year
ORDER BY SumTransactions DESC

-- 5. What is the average income of a customer in their segment (customer type)?
-- Solution with OVER(PARTITION ) procedure
	
SELECT a.customer_id, customer_type, avg_income
FROM
	(SELECT customer_id, customer_type,  AVG(income)  OVER(PARTITION BY  customer_type) as avg_income
	 FROM Customer) a
ORDER BY a.customer_id

-- 6. What is the customer rank of their income among all customers?

SELECT customer_id, income, RANK() OVER( ORDER BY income) AS rank
FROM Customer
ORDER BY customer_id

-- 7. What is the total number of transactions in a given year and month, along with a summary for that year?	
-- Solution with rollup() function.

SELECT transaction_year, transaction_month, SUM(amount) AS TransactionsSum
FROM Transactions
GROUP BY ROLLUP (transaction_year, transaction_month)

-- 8. What is each customer's share of the total transaction amount?

WITH part AS( 
	SELECT customer_id, 
	    SUM(amount) OVER(PARTITION BY customer_id) AS cust_amount,
	    SUM(amount) OVER() AS total
	FROM Transactions
)
SELECT customer_id, cust_amount/total AS cust_part
FROM part

-- 9. For each customer find the previous income that is closest to but less than the customer's income value.

SELECT c1.customer_id, c1.income,  tab.income as income_bis
FROM Customer c1
OUTER APPLY (
	SELECT TOP 1 c2.income
	FROM Customer c2
	WHERE c2.income < c1.income
	ORDER BY c2.income DESC
) tab
ORDER BY c1.customer_id

-- 10. What are incoming transactions from 2015 and outgoing transactions from 2016?

SELECT customer_id, transaction_type, amount, transaction_year
FROM Transactions
WHERE (transaction_type = 'incoming' AND transaction_year = 2015)
   OR (transaction_type = 'outgoing' AND transaction_year = 2016)
ORDER BY transaction_year

/* 11. Display customer_id and additional column named "services" filled out according to the following pattern:
- For VIP customers – individual
- For customers with an income of at least 5000 – individual
- For Premium customers aged >=40 – phone
- In other cases – Standard.

Solution with CASE STATEMENT.
 */

SELECT customer_id,
CASE
    WHEN customer_type = 'VIP' THEN 'Individual'
	WHEN income >= 5000 THEN 'Individual'
    WHEN age >= 40 AND customer_type = 'Premium' THEN 'Phone'
	ELSE 'Standard'
END AS services
FROM Customer


-- Data cleaning/preparation

-- 1. Changing the sign of outgoing transactions to negative.

UPDATE Transactions
SET amount = -ABS(amount)
WHERE transaction_type = 'outgoing' 

-- 2. Adding a column 'Name' of character type with size 255 to the 'customer' table.

ALTER TABLE Customer
ADD customer_name varchar(255)
