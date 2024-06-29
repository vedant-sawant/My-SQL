CREATE DATABASE college;

USE college;

CREATE TABLE student(stud_id INT PRIMARY KEY,
					f_name VARCHAR(20) NOT NULL,
                    l_name VARCHAR(20),
                    GPA FLOAT,
                    Enrollment TIMESTAMP,
                    major VARCHAR(20)
                    );

DESC student;

CREATE TABLE program(
						student_ref_id INT,
                        prog_name VARCHAR(20),
                        prog_date DATETIME,
                        FOREIGN KEY (student_ref_id) REFERENCES student(stud_id)
                        );
DROP TABLE program;
DESC program;

CREATE TABLE scholarship(
							student_ref_id INT,
                            scholarship_amount INT DEFAULT 0,
                            scholarship_date DATETIME,
                            FOREIGN KEY (student_ref_id) REFERENCES student(stud_id)
						);
                        
DESC scholarship;

INSERT INTO student(stud_id,f_name,l_name,GPA,Enrollment,major) VALUES 
				    (201,'Shivansh','Mahajan',8.79,'2021-09-01 09:30:00','Computer Science');
                    
INSERT INTO student(stud_id,f_name,l_name,GPA,Enrollment,major) VALUES 
				    (202,'Umesh','Sharma',8.44,'2021-09-01 08:30:00','Mathematics'),
                    (203,'Rakesh','Kumar',5.60,'2021-09-01 10:00:00','Biology');
                    
SELECT * FROM student;

INSERT INTO student(stud_id,f_name,l_name,GPA,Enrollment,major) VALUES 
				    (204, 'Radha', 'Sharma', 9.20, '2021-09-01 12:45:00', 'Chemistry'),
					(205, 'Kush', 'Kumar', 7.85, '2021-09-01 08:30:00', 'Physics'),
					(206, 'Prem', 'Chopra', 9.56, '2021-09-01 09:24:00', 'History'),
					(207, 'Pankaj', 'Vats', 9.78, '2021-09-01 02:30:00', 'English'),
					(208, 'Navleen', 'Kaur', 7.00, '2021-09-01 06:30:00', 'Mathematics');
                    
drop table scholarship;

INSERT INTO Scholarship (STUDENT_REF_ID, SCHOLARSHIP_AMOUNT, SCHOLARSHIP_DATE) VALUES
(201, 5000, '2021-10-15 00:00:00'),
(202, 4500, '2022-08-18 00:00:00'),
(203, 3000, '2022-01-25 00:00:00'),
(201, 4000, '2021-10-15 00:00:00');

INSERT INTO Program (student_ref_id, prog_name, prog_date) VALUES
(201, 'Computer Science', '2021-09-01 00:00:00'),
(202, 'Mathematics', '2021-09-01 00:00:00'),
(208, 'Mathematics', '2021-09-01 00:00:00'),
(205, 'Physics', '2021-09-01 00:00:00'),
(204, 'Chemistry', '2021-09-01 00:00:00'),
(207, 'Psychology', '2021-09-01 00:00:00'),
(206, 'History', '2021-09-01 00:00:00'),
(203, 'Biology', '2021-09-01 00:00:00');

SELECT * FROM student;
SELECT * FROM scholarship;
SELECT * FROM program;

-- Write a SQL query to fetch “FIRST_NAME” from the Student table in upper case and use ALIAS name as STUDENT_NAME.
SELECT * FROM student;
SELECT LOWER(f_name) AS Student_name FROM student;

-- 2. Write a SQL query to fetch unique values of MAJOR Subjects from Student table.
SELECT DISTINCT major FROM student;

-- 3. Write a SQL query to print the first 3 characters of FIRST_NAME from Student table.
SELECT SUBSTRING(f_name,1,5) FROM STudent;

-- 4. Write a SQL query to find the position of alphabet (‘a’) int the first name column ‘Shivansh’ from Student table.
SELECT INSTR(f_name,'a') FROM student WHERE stud_id=201;

-- 5. Write a SQL query that fetches the unique values of MAJOR Subjects from Student table and print its length.
SELECT DISTINCT(major),LENGTH(major) FROM student;

-- 6. Write a SQL query to print FIRST_NAME from the Student table after replacing ‘a’ with ‘A’.
SELECT REPLACE(f_name,'a','A') FROM student;

-- CONCAT 
-- 7. Write a SQL query to print the FIRST_NAME and LAST_NAME from Student table into single column COMPLETE_NAME.
SELECT CONCAT(f_name,' ',l_name) FROM student;

-- 8. Write a SQL query to print all Student details from Student table order by FIRST_NAME Ascending and MAJOR Subject descending .
SELECT * FROM student
ORDER BY f_name ASC, major DESC;

-- 9. Write a SQL query to print details of the Students with the FIRST_NAME as ‘Prem’ and ‘Shivansh’ from Student table.
SELECT * FROM student WHERE f_name='Prem' OR f_name='Shivansh';

-- 11. Write a SQL query to print details of the Students whose FIRST_NAME ends with ‘a’.
SELECT * FROM student WHERE f_name LIKE "%a";

-- 12. Write an SQL query to print details of the Students whose FIRST_NAME ends with ‘a’ and contains six alphabets.
SELECT * FROM student WHERE f_name LIKE "____a";

-- 13. Write an SQL query to print details of the Students whose GPA lies between 9.00 and 9.99.
SELECT * FROM student WHERE GPA BETWEEN 9.00 AND 9.99; 

-- 14. Write an SQL query to fetch the count of Students having Major Subject ‘Computer Science’.
SELECT major,COUNT(f_name) FROM student WHERE major='Computer Science';
SELECT * FROM scholarship;
SELECT student_ref_id,COUNT(scholarship_amount) FROM scholarship GROUP BY student_ref_id ORDER BY COUNT(scholarship_amount) DESC;

SELECT * FROM program;
SELECT prog_name,COUNT(student_ref_id) FROM program GROUP BY prog_name ORDER BY COUNT(student_ref_id) DESC LIMIT 1;

SELECT * FROM STUDENT;
SELECT GPA,COUNT(GPA) FROM student GROUP BY GPA HAVING GPA BETWEEN 7.00 AND 7.99;

SELECT major,AVG(GPA) FROM student GROUP BY major;





-- 15. Write an SQL query to fetch Students full names with GPA >= 8.5 and <= 9.5.
SELECT concat(f_name,' ',l_name) FROM student WHERE GPA BETWEEN 8.5 AND 9.5;

-- 16. Write an SQL query to fetch the no. of Students for each MAJOR subject in the descending order.
SELECT major,COUNT(major) FROM student GROUP BY major ORDER BY COUNT(major) DESC;

-- 17. Display the details of students who have received scholarships, including their names, scholarship amounts, and scholarship dates.
SELECT * FROM SCHOLARSHIP;
SELECT student.f_name,
	   scholarship.scholarship_amount,
       scholarship.scholarship_date
FROM student
INNER JOIN scholarship
ON student.stud_id=scholarship.student_ref_id;


-- 18. Write an SQL query to show only odd rows from Student table.
SELECT * FROM student WHERE stud_id %2 !=0;

-- 20. List all students and their scholarship amounts if they have received any. If a student has not received a scholarship, display NULL for the scholarship details.
SELECT * FROM scholarship;
SELECT student.f_name,
	   student.l_name,
       scholarship.scholarship_amount,
       scholarship.student_ref_id
FROM student
LEFT JOIN scholarship
ON student.stud_id=scholarship.student_ref_id;

-- 21. Write an SQL query to show the top n (say 5) records of Student table order by descending GPA.
SELECT * FROM student ORDER BY stud_id DESC LIMIT 5;

-- 22. Write an SQL query to determine the nth (say n=5) highest GPA from a table.

SELECT * FROM STUDENT ORDER BY GPA DESC LIMIT 4,1; -- Go to 4th row and display next 1 row

-- 23. Write an SQL query to determine the 5th highest GPA without using LIMIT keyword.

-- 24. Write an SQL query to fetch the list of Students with the same GPA.
-- SELECT * FROM student WHERE 


-- 24. Write an SQL query to fetch the list of Students with the same GPA.
SELECT * FROM student s1, student s2

;
-- 26. Write an SQL query to show one row twice in results from a table.
SELECT * FROM student
UNION ALL
SELECT * FROM student;

-- 

                    