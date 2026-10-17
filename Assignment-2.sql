/*
NOTE: DO EVERY QUERY SEPARATELY NOT AT ONCE 

1) Create a table -- feel free to name it whatever and make sure that it has at least 8-10 columns of varying data types (I would like to see at least varchar, integer, floating decimal, and date time) 


Creates a table named seals

it sets the following variables and data types

Seal_id as an integer and labled as a primary key
seal_name is a varchar datatype with a max character of 200
seal_pettable is a boolean
seal_age is an integer
seal_profession is a varchar datatype with a max character of 200
seal_visit is a DATE data type representing when the seal has visited in YYYY-MM-DD Format. 
seal_species is a varchar datatype with a max character of 200 
seal_hourly_income stores values of decimal/numeric datatype taking only up to the hundreth decimal EX: 22.99

NOTE: this form of storing numeric values is standard for currency based data. there is no such thing as 999.999$
*/

CREATE TABLE SEALS(
    SEAL_ID INT PRIMARY KEY,
    SEAL_NAME VARCHAR(200),
    SEAL_PETTABLE BOOLEAN,
    SEAL_AGE INT,
    SEAL_PROFESSION VARCHAR(200),
    SEAL_VISIT DATE,
    SEAL_SPECIES VARCHAR(200),
    SEAL_HOURLY_INCOME NUMERIC(10,2)
)


/*
    Creates a table called seals_foods
    sets Food_id to store data with an integer data type and represents the primary key in this table
    food_name is a varchar datatype with a max character of 200
    Seal_ID is an integer, a foreign key constraint is added to reference the seal_ID from the seals table.

    NOTE: BY CREATING A PK AND FK THIS CREATES A PARENT TO CHILD RELATIONSHIP BETWEEN SEALS AND SEALS_FOODS
*/

CREATE TABLE SEALS_FOODS(
    FOOD_ID INT PRIMARY KEY,
    FOOD_NAME VARCHAR(200),
    SEAL_ID INT,
    CONSTRAINT SEALS_FAVORITE_FOODS
    FOREIGN KEY (SEAL_ID) REFERENCES SEALS(SEAL_ID)
)

/*

2) Populate the data with at least 10-12 rows of information. 

    Inserts the data into the seals table with respect to what datatype is stored inside each column
    
    NOTE: TO STORE DATE VALUES, USE TO_DATE AND FOLLOW THE FORMAT BELOW, WITHOUT IT, '2026-01-01' WILL BE TAKEN AS A STRING LITERAL
*/

INSERT INTO SEALS
VALUES
(1, 'Bobimus Maximus', True, 23, 'Swimmer', TO_DATE('2026-01-01', 'YYYY-MM-DD'), 'Leopard Seal', '16.99'),
(2, 'Temmie', True, 5, 'Dancer', TO_DATE('2024-12-24', 'YYYY-MM-DD'), 'Hooded Seal', '12.99'),
(3, 'Carl Fisheater', FALSE, 15, 'Pilot', TO_DATE('2012-06-26', 'YYYY-MM-DD'), 'Ribbon Seal', '100.45'),
(4, 'Juan Fernandez', FALSE, 8, 'Teacher', TO_DATE('2005-07-12', 'YYYY-MM-DD'), 'Juan Fernandez Seal', '50.75'),
(5, 'Solid Seal', True, 40, 'Sneaking around', TO_DATE('2026-10-17', 'YYYY-MM-DD'), 'Antarctic Fur Seal', '0.99'),
(6, 'IshowSeal', FALSE, 20, 'Streamer', TO_DATE('2026-05-20', 'YYYY-MM-DD'), 'Walrus', '99.99'),
(7, 'Darth Seal', FALSE, 10, 'Evil Lord', TO_DATE('2014-11-24', 'YYYY-MM-DD'), 'Baikal Seal', '200.20'),
(8, 'Gordon Sealsy', FALSE, 48, 'Chef', TO_DATE('2022-10-19', 'YYYY-MM-DD'), 'Australian Sea Lion', '20.99'),
(9, 'SeaLionell Messi', True, 23, 'Sea Football Player', TO_DATE('2026-07-15', 'YYYY-MM-DD'), 'South American Sea Lion', '500.20'),
(10, 'Dwayne "The Seal" Sealson', True, 29, 'Actor', TO_DATE('2025-04-28', 'YYYY-MM-DD'), 'Northern Elephant Seal', '200.20'),
(11, 'Luke Seawalker', True, 15, 'Magic Seal', TO_DATE('2002-06-22', 'YYYY-MM-DD'), 'Harp Seal', '70.99'),
(12, 'Evil Seal', True, 26, 'Evil', TO_DATE('2026-01-01', 'YYYY-MM-DD'), 'Harp Seal', '99.99')



/*
   Inserts the data into the seals_foods table with respect to what datatype is stored inside each column, INCLUDING THE FK
*/
INSERT INTO SEALS_FOODS
VALUES
(1,'Sushi',1),
(2,'Fried chicken',2),
(3,'Fish',3),
(4,'Fish Pizza',4),
(5,'Eel roll sushi',5),
(6,'Fish Tacos',6),
(7,'Evil Fish',7),
(8,'Fish Wellington',8),
(9,'Fish Marienesa',9),
(10,'Pebble shaped fish',10),
(11,'Stir-fried chicken',11),
(12,'Evil fish',12)

/*
3) Update one of the columns to change the information in the column ore update a blank column.

UPDATES THE TABLE SEALS
SETS THE VALUE 'Super Evil Lord' into the seals_profession column using dot notation as an atribute of the seals table
It updates the value on row 7 by checking where the value 7 inside seal_id is. 

once it finds the seal_id, it will then replace the previous value with the new one. 
*/

UPDATE SEALS
SET SEALS.SEAL_PROFESSION = 'Super Evil Lord'
WHERE SEALS.SEAL_ID = 7

/*
4) Alter the table to add an additional column. 

   Alters the table seals by adding the column Notes and having it store values with the data type of varchar, with a max character count of 200

*/

ALTER TABLE SEALS ADD Notes Varchar(200)

/*
 5) Delete a row or row based on a criteria 


 deletes from the seals_foods table where the row contains the seal_id of 12
 NOTE: BEFORE YOU DELETE A ROW FROM A TABLE WHOS PRIMARY KEY IS A FOREIGN KEY OF A DIFFERENT TABLE, DELETING THE ROW FROM THE TABLE   THAT CONTAINS THE FK COMES FIRST.

 after removing the row that contains the foreign key, you then proceed with the table Seals where seal_id is the primary key.
*/

DELETE FROM SEALS_FOODS
WHERE SEALS_FOODS.SEAL_ID = 12;

DELETE FROM SEALS
WHERE SEALS.SEAL_ID = 12;


/*
6) Once you have completed that --- I would like you to choose one of the schemas and demonstrate the following: 

1) Perform a select statement highlighting that you can choose fields and limit the results to the top 100 rows. (Show the code - copy the data to an excel and publish) 

    Order_id, Order_date, Order_mode and order_status is selected from the orders table 
    using the where statement, it will only display the first 100 rows, 
    using order by, it will display the top 100 most recent order_date in descening order
*/

SELECT ORDER_ID, ORDER_DATE, ORDER_MODE, ORDER_STATUS FROM OE.ORDERS
WHERE ROWNUM <= 100
ORDER BY ORDER_DATE DESC


/*

2) Perform a query where you are joining the information from 2 different tables - Perform an inner join as well as an outer join to see if there is a difference. Limit the table to 100 rows and export the result into an excel and publish. 

    customer_id, customer first name and last name, customer address and phone number is selected from the customers table
    we are joining order_date and order_total from the orders table with the customers table 

    to join them, we need to write a join statement where we are joining the orders table based on the customer ID stored inside orders (FK) with the customer ID stored inside the customers table (PK)
    displays the first 100 rows using the where statement and having rownum be less than or equal to 100
*/
SELECT 
OE.CUSTOMERS.CUSTOMER_ID, 
OE.CUSTOMERS.CUST_FIRST_NAME, 
OE.CUSTOMERS.CUST_LAST_NAME, 
OE.CUSTOMERS.CUST_ADDRESS, 
OE.CUSTOMERS.PHONE_NUMBERS,
OE.ORDERS.ORDER_DATE, 
OE.ORDERS.ORDER_TOTAL 
FROM OE.CUSTOMERS
JOIN OE.ORDERS
ON OE.ORDERS.CUSTOMER_ID = OE.CUSTOMERS.CUSTOMER_ID
WHERE ROWNUM <= 100

/*
    customer_id, customer first name and last name, customer address and phone number is selected from the customers table
    we are joining order_date and order_total from the orders table with the customers table 

   for a left outer join, a left join statement is written to priortize the table in the from clause 

   displays the first 100 rows using the where statement and having rownum be less than or equal to 100

   orders the the table based on the highest number of salary (or descending order)

   NOTE: RIGHT JOIN PRIORITIZS THE TABLE AFTER THE JOIN CLAUSE
*/
SELECT
HR.EMPLOYEES.EMPLOYEE_ID,
HR.EMPLOYEES.FIRST_NAME,
HR.EMPLOYEES.LAST_NAME,
HR.DEPARTMENTS.DEPARTMENT_NAME,
HR.EMPLOYEES.EMAIL,
HR.EMPLOYEES.SALARY
FROM HR.EMPLOYEES
LEFT JOIN HR.DEPARTMENTS
ON HR.DEPARTMENTS.DEPARTMENT_ID = HR.EMPLOYEES.DEPARTMENT_ID
WHERE ROWNUM <= 100
ORDER BY HR.EMPLOYEES.SALARY DESC


/*
  FOR RIGHT JOIN

  Employee ID, First and last name, email and salary are selected from the employees table.

  we want to join department_name from the departments table into the employees table. 

  to prioritize the table after the join clause, we use a right join. 

  Right join, allows the two tables to be joined based on the department_id FK inside employees being assigned to department_id PK inside departments

  using the where statement and rownum keyword, we limit the result to the first 100 rows

  finally, order the rows by salary in ascending order (highest to lowest)

*/

SELECT
HR.EMPLOYEES.EMPLOYEE_ID,
HR.EMPLOYEES.FIRST_NAME,
HR.EMPLOYEES.LAST_NAME,
HR.DEPARTMENTS.DEPARTMENT_NAME,
HR.EMPLOYEES.EMAIL,
HR.EMPLOYEES.SALARY
FROM HR.EMPLOYEES
RIGHT JOIN HR.DEPARTMENTS
ON HR.DEPARTMENTS.DEPARTMENT_ID = HR.EMPLOYEES.DEPARTMENT_ID
WHERE ROWNUM <= 100
ORDER BY HR.EMPLOYEES.SALARY DESC

/*

/*
For Full outer join 

The respective columns for both Employees and jobs table was selected.

we are joining the jobs table with the employees table regardless of matching rows. 

We are doing a full outer join using the jobs table based on the job_id of the employees table (FK) being assigned the job_id of the jobs table (PK)

the number of rows is limited using the where statement with the rownum keyword, showing only the first 100 rows

the results are then ordered by the hire date in ascending order
*/

SELECT 
HR.EMPLOYEES.EMPLOYEE_ID,
HR.EMPLOYEES.FIRST_NAME,
HR.EMPLOYEES.LAST_NAME,
HR.EMPLOYEES.HIRE_DATE,
HR.JOBS.JOB_TITLE
FROM HR.EMPLOYEES
FULL OUTER JOIN HR.JOBS
ON HR.JOBS.JOB_ID = HR.EMPLOYEES.JOB_ID
WHERE ROWNUM <= 100
ORDER BY EMPLOYEES.HIRE_DATE ASC

/*
EXTRA PRACTICE FOR FULL OUTER JOIN 

 A FULL OUTER JOIN RETURNS ALL THE ROWS WHEN THERE IS A MATCH FROM EITHER TABLES EVEN IF THERE IS NO MATCH IT WILL STILL RETURN NULL

 IN THIS EXAMPLE:
 
 THE FOLLOWING COLUMNS ARE SELECTED FROM THE SEALS TABLE

 SEAL_NAME IS RENAMED AS NAME USING THE 'AS' Keyword
 SEAL_AGE IS RENAMED AS AGE USING THE 'AS' Keyword
 SEAL_PROFESSION IS RENAMED AS PROFESSION USING THE 'AS' Keyword
 SEAL_SPECIES IS RENAMED AS SPECIES USING THE 'AS' Keyword
 FOOD_NAME IS RENAMED AS FAVORITE_FOOD FROM THE FOODS TABLE

 WE WANT TO JOIN FOOD_NAME FROM THE FOOD TABLE INTO THE SEALS TABLE

 A FULL OUTER JOIN STATEMENT IS WRITTEN WHERE WE ARE JOINING FOODS ON SEAL_ID BEING ASSIGNED TO FOOD_ID

 NOTE: THE DIFFERENCE IS DEPENDENT ON WETHER IF THERE WERE NO MATCHING VALUES, IN THIS INSTANCE, DESPITE HAVING NO PARENT-TO-CHILD RELATIONSHIP, MATCHING VALUES DID EXIST. TO RUN THE SCRIPT, SEE THE NEXT BLOCK OF CODE
*/


SELECT 
SEALS.SEAL_NAME AS NAME,
SEALS.SEAL_AGE AS AGE,
SEALS.SEAL_PROFESSION AS PROFESSION,
SEALS.SEAL_SPECIES AS SPECIES,
FOODS.FOOD_NAME AS FAVORITE_FOOD
FROM SEALS
FULL OUTER JOIN FOODS
ON  FOODS.FOOD_ID = SEALS.SEAL_ID


/*
  Create the table foods with all of the necessary columns and data types.
*/

CREATE TABLE FOODS(
    FOOD_ID INT PRIMARY KEY, 
    Food_Name VARCHAR(200),
    Food_Type VARCHAR(50),
    Food_Price NUMERIC(10,2),
    Best_SideDish VARCHAR(200),
    Best_Restaurant VARCHAR(200),
    Can_Be_Homemade Boolean,
    Rating INT CHECK(Rating >= 0 AND Rating <= 10)
)


/*
  Insert the values into the foods table.
*/
INSERT INTO FOODS
VALUES
(1,'Pizza','Pie',10.99,'Chiken Wings','Spuntinos',True,7),
(2,'Hamburger','Sandwich',12.99,'Fries','Five Guys',True,9),
(3,'HotPot','Soup',24.99,'Spring Rolls','KPot',TRUE,10),
(4,'KBBQ','BBQ',24.99,'Chicken wings','KBBQ',True,10),
(5,'Sushi','Sea Food',15.99,'Miso Soup','Kado Sushi',True,7),
(6,'Fried Chicken','Chicken',20.99,'Fries','Jolibee',True,10),
(7,'Broccoli Pizza','Pie',5.99,'Chiken Wings','Ginos',FALSE,4),
(8,'Chicken Cheese Steak','Sandwich',10.99,'Fries','Retro CheeseSteak',FALSE,6),
(9,'Koobideh Kebab','Kebab',19.99,'Rice','Rose',FALSE,10),
(10,'Gyro','Sandwich',10.99,'Fries','Etna Greek Mediterranian Grill',FALSE,8),
(11,'Brisket','BBQ',15.99,'Coleslaw','Buc Es',True,7),
(12,'Chicken Piccata','Chicken',25.99,'Chicken','Maggianos Little Italy',True,9)


