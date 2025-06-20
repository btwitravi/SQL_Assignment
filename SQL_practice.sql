create database Practice2;

use  Practice2;
-- Creating Student Table
CREATE TABLE student (
    student_id INT PRIMARY KEY,
    First_Name VARCHAR(30),
    last_Name VARCHAR(30),
    Enrollment_date DATE
);

insert into student values(201, "Shivansh", "Mahajan", 8.79,"2021-09-01", "Computer Science"),
(202,"Umesh", "Sharma", 8.44, "2021-09-01","Mathematics"),
(203, "Rakesh", "Kumar", 5.60, "2021-09-01", "Biology"),
(204, "Radha", "Sharma", 9.20, "2021-09-01","Chemistry"),
(205,"Kush", "Kumar", 7.85,"2021-09-01", "Physics"),
(206, "Prem", "Chopra", 9.56, "2021-09-01", "History"),
(207, "Pankaj", "Vats", 9.78, "2021-09-01", "English"),
(208, "Navleen", "Kaur", 7.00, "2021-09-01","Mathematics");

select*from Student;

-- creating Progam table
CREATE TABLE Program (
    student_ref_id INT,
    program_name TEXT,
    program_star_time DATE,
    FOREIGN KEY (student_ref_id)
        REFERENCES Student (Student_id)
);

insert into Program values(201, "Computer Science", "2021-09-01"),
(202, "Mathematics", "2021-09-01"),
(208, "Mathematics", "2021-09-01"),
(205,"Physics","2021-09-01"),
(204, "Chemistry", "2021-09-01"),
(207, "Psychology", "2021-09-01"),
(206,"History", "2021-09-01"),
(207, "Biologyy", "2021-09-01");

select*from program;

-- Creatinng Table Scholarship
CREATE TABLE Scholarship (
    student_ref_id INT,
    scholarship_amt INT,
    Scholarship_date DATE,
    foreign key (student_ref_id) references Student(Student_id)
);

insert into Scholarship value (201, 5000, "2021-10-15"),
(202,4500,"2022-08-18"),
(203,3000,"2022-01-25"),
(204,4000, "2021-10-15");

select*from Scholarship;

/*1. Write a SQL query to fetch "FIRST_NAME" from 
the Student table in upper case and use ALIAS name as STUDENT_NAME*/
SELECT 
    UPPER(First_Name) AS Student_Name
FROM
    Student;

/*2. Write a SQL query to fetch unique values of MAJOR Subjects from Student table*/
select distinct major from Student;

/*3. Write a SQL query to print the first 3 characters of FIRST_NAME from Student table.*/
SELECT 
    LEFT(First_Name, 3)
FROM
    STudent;

/*4. Write a SQL query to find the position of alphabet ('a') int the first name
 column 'Shivansh' from Student table.*/
SELECT 
    INSTR(LOWER(First_Name), 'a')
FROM
    Student
WHERE
    First_Name = 'Shivansh';
    
/*5. Write a SQL query that fetches the unique values of MAJOR Subjects 
from Student table and print its length.    */
SELECT DISTINCT
    major, LENGTH(major)
FROM
    student;

/*6. Write a SQL query to print FIRST_NAME from the Student table after replacing 'a' with 'A'.*/
SELECT 
    REPLACE(First_Name, 'a', 'A')
FROM
    Student;
    
/*7. Write a SQL query to print the FIRST_NAME and LAST_NAME 
from Student table into single column COMPLETE_NAME.    */
SELECT 
    CONCAT(First_Name, ' ', Last_Name) AS COMPLETE_NAME
FROM
    Student;
    
/*8. Write a SQL query to print all Student details from Student table order by FIRST_NAME
 Ascending and MAJOR Subject descending . */
SELECT 
    *
FROM
    Student
ORDER BY First_Name ASC , major DESC;

/*9. Write a SQL query to print details of the Students with the FIRST_NAME as
 'Prem' and 'Shivansh' from Student table*/
SELECT 
    *
FROM
    student
WHERE
    First_Name IN ('Prem' , 'Shivansh');
    
/*10. Write a SQL query to print details of the Students excluding FIRST_NAME as 
'Prem' and 'Shivansh' from Student table   */
SELECT 
    *
FROM
    student
WHERE
    First_Name not IN ('Prem' , 'Shivansh');
    
/*11. Write a SQL query to print details of the Students whose FIRST_NAME ends with 'a'.*/
SELECT 
    *
FROM
    Student
WHERE
    First_Name LIKE '%a';
    
/*12. Write an SQL query to print details of 
the Students whose FIRST_NAME ends with ‘a’ and contains five alphabets. */
SELECT 
    *
FROM
    student
WHERE
    first_Name LIKE '____a';

/*13. Write an SQL query to print details of the Students whose GPA lies between 9.00 and 9.99.*/
SELECT 
    *
FROM
    Student
WHERE
    GPA BETWEEN 9.00 AND 9.99;

/*14. Write an SQL query to fetch the count of Students having Major Subject ‘Computer Science’.*/
SELECT 
    major, COUNT(*) AS Total_count
FROM
    student
WHERE
    major = 'Computer Science';  
    
-- 15. Write an SQL query to fetch Students full names with GPA >= 8.5 and <= 9.5.   
SELECT 
    *
FROM
    Student
WHERE
    Gpa BETWEEN 8.5 AND 9.5;

/*16. Write an SQL query to fetch the no. of Students for 
each MAJOR subject in the descending order. */
SELECT 
    Major, COUNT(major)
FROM
    Student
GROUP BY Major
ORDER BY COUNT(major) DESC;

/*17. Display the details of students who have received scholarships, 
including their names, scholarship amounts, and scholarship dates.*/
SELECT 
    CONCAT(a.first_name, " ",a.last_name) AS Name,
    b.Scholarship_amt,
    b.Scholarship_date
FROM
    Student AS a
        INNER JOIN
    scholarship AS b ON a.student_id = b.student_ref_id;
   
/*18. Write an SQL query to show only odd rows from Student table.*/
SELECT 
    *
FROM
    Student
WHERE
    Student_id % 2 != 0;

-- 19. Write an SQL query to show only even rows from Student table
SELECT 
    *
FROM
    Student
WHERE
    Student_id % 2 = 0;
    
 /*20. List all students and their scholarship amounts if they have received any.
 If a student has not received a scholarship, display NULL for the scholarship details */
SELECT 
    concat(First_Name, " ",Last_Name) As Student_Name, Scholarship_amt, Scholarship_date
FROM
    Student AS a
        LEFT JOIN
    Scholarship AS b ON a.student_id = b.Student_ref_id;
    
/*21. Write an SQL query to show the top n (say 5) records of Student table order by descending GPA*/
SELECT 
    *
FROM
    Student
ORDER BY GPA DESC
LIMIT 5;

/*22. Write an SQL query to determine the nth (say n=5) highest GPA from a table.*/
SELECT 
    *
FROM
    Student
LIMIT 4 , 1;

/*23. Write an SQL query to determine the 5th highest GPA without using LIMIT keyword.*/
SELECT
     *
FROM
    student AS a
WHERE
    (SELECT 
            COUNT(DISTINCT GPa)
        FROM
            Student AS b
        WHERE
            b.gpa > a.gpa) = 4;
            
/*24. Write an SQL query to fetch the list of Students with the same GPA.*/
SELECT 
    *
FROM
    Student AS a,
    student AS b
WHERE
    a.gpa = b.gpa
        AND a.student_id != b.student_id;            
        
/*25. Write an SQL query to show the second highest GPA from a Student table using sub-query.*/
SELECT 
    MAX(GPA)
FROM
    Student
WHERE
    GPA < (SELECT 
            MAX(GPA)
        FROM
            STUDENT);  
            
 /*26. Write an SQL query to show one row twice in results from a table.*/
SELECT 
    *
FROM
    Student 
UNION ALL SELECT 
    *
FROM
    Student
ORDER BY Student_ID;

/*27. Write an SQL query to list STUDENT_ID who does not get Scholarship.*/
SELECT 
    STudent_Id
FROM
    Student
WHERE
    Student_Id NOT IN (SELECT 
            STudent_ref_id
        FROM
            Scholarship);  
 
/*28. Write an SQL query to fetch the MAJOR subject that have less than 4 people in it.*/
SELECT 
    Major, COUNT(major) AS Major_Count
FROM
    Student
GROUP BY Major
HAVING COUNT(major) < 4;

/*29. Write an SQL query to show the last record from a table.*/
SELECT 
    *
FROM
    student
WHERE
    student_id = (SELECT 
            MAX(student_id)
        FROM
            Student);
            
/*30 Write an SQL query to fetch the first row of a table.*/
SELECT 
    *
FROM
    Student
ORDER BY Student_id ASC
LIMIT 1;

/*31. Write an SQL query to fetch the last five records from a table.*/
SELECT 
    *
FROM
    (SELECT 
        *
    FROM
        Student
    ORDER BY Student_id DESC
    LIMIT 5) AS Subquery
ORDER BY Student_id;
          
/*32  Write an SQL query to fetch three max GPA from a table using co-related subquery.*/
SELECT DISTINCT
    GPA
FROM
    Student AS a
WHERE
    3 >= (SELECT 
            COUNT(DISTINCT GPa)
        FROM
            Student AS b
        WHERE
            a.GPA <= b.GPA)
ORDER BY a.GPA DESC;

/*33. Write an SQL query to fetch three min GPA from a table using Correlated subquery.*/ 
 SELECT DISTINCT
    GPA
FROM
    Student AS a
WHERE
    3 >= (SELECT 
            COUNT(DISTINCT GPa)
        FROM
            Student AS b
        WHERE
            a.GPA >= b.GPA)
ORDER BY a.GPA;

/*34  Write an SQL query to fetch MAJOR subjects along with the max GPA in each of these MAJOR subjects.*/
SELECT 
    Major, MAX(GPA)
FROM
    Student
GROUP BY MAjor;

/*35 Write an SQL query to fetch the names of Students who has highest GPA*/
SELECT 
    First_Name, GPA
FROM
    Student
WHERE
    GPA = (SELECT 
            MAX(GPA)
        FROM
            Student);

/*36 Write an SQL query to show the current date and time.*/
select curdate() as "Date";
select now() as "Date&time";

/*37  Write an SQL query to update the GPA of all
 the students in 'Computer Science' MAJOR subject to 7.5.*/
 update student set GPA = 7.5 where major = "Computer Science";
 
