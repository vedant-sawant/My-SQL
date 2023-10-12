/*
    Title: Create Database, Create Table- Use Commands like DESC, SELECT.
    Topic: MYSQL Introduction
    Input: orga Database
    Author: Vedant Sawant
    Date: 08/10/2023
 */
 
 
-- See previously created databases ...
SHOW Databases;

-- Create New Database ...
CREATE DATABASE orga;

-- Setting Current Database
USE orga;

-- See tables in the database
SHOW tables;

-- Creating a Table
CREATE TABLE emp(emp_id INT PRIMARY KEY,
				  fname varchar(20) NOT NULL,
				  lname varchar(20) NOT NULL,
                  dept varchar(20) DEFAULT 'intern',
                  jdate DATE,
                  salary double CHECK (salary > 100),
                  status varchar(1) DEFAULT 0);

-- See table scehma / structure
DESC emp;

-- One way of inserting value in table [mention the column in which you want to add data]
INSERT INTO emp (emp_id,fname,lname,dept,jdate,salary,status) VALUES (1,'vedant','sawant','CS','2023-08-19',30000,1);

INSERT INTO emp (emp_id,fname,lname,dept,jdate,salary,status) VALUES (3,'yash','gaikwad','IT','2023-08-19',35000,0),
																     (2,'sohan','bachhav','Mech','2023-08-20',10000,0);
																	
-- other way of inserting value in table
INSERT INTO emp VALUES(5,'vishal','patil','CS','2023-09-12',25000,0);

-- Insert Few Columns 
INSERT INTO emp (emp_id,fname,lname) VALUES(6,'shreyash','bandi');

-- See Table Data
SELECT * FROM emp;

-- Can make dual
SELECT 44+55;
SELECT now();
SELECT lcase('VeDANT');
                   
                        