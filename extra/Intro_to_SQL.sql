
-- INTRODUCTION TO SQL

-----------------------------------------------------------

-- Full view of a table from a CSV

SELECT * FROM  madrid_houses ;

-----------------------------------------------------------

-- Create new tables

CREATE TABLE Students
(
 StudentID nvarchar(50) NOT NULL PRIMARY KEY, -- primary key column
 Name char (50) NOT NULL,
 Country nvarchar(50) NOT NULL,
 City nvarchar(50) NOT NULL,
 Email nvarchar (50) NOT NULL,
 Phone nvarchar (50) NOT NULL
);

CREATE TABLE Teachers
(
 TeacherID nvarchar (50) NOT NULL PRIMARY KEY, -- primary key column
 Name nvarchar (50) NOT NULL,
 Studies nvarchar(50) NOT NULL,
 Email nvarchar(50) NOT NULL
);

CREATE TABLE Examns
(
 ExamId nvarchar (50) NOT NULL PRIMARY KEY, -- primary key column
 Grade DECIMAL(5,2) NOT NULL,
 Subject nvarchar (50) NOT NULL,
 StudentID nvarchar (50) NOT NULL,
 TeacherID  nvarchar (50) NOT NULL
);

-- PRIMARY KEY:
-- The PRIMARY KEY statement is associated with columns that are unique identifiers.
-- If the PRIMARY KEY statement is attached to a column, it prevents repeating values in that column.
-- These types of columns are essential in databases since they will allow joining tables through different operations that will be seen later.

-- NOT NULL and NULL:
-- If the NOT NULL statement is associated with a column, it prevents this column from having null values.
-- If the NULL statement is associated with a column, it allows this column to have null values.

-----------------------------------------------------------

-- Insert rows in a table

INSERT INTO Students
VALUES
 ( 'S1', 'Orlando', 'Australia', '', '' , '917755028'),
 ( 'S2', 'Keith', 'India', '', 'keith0@adventure-works.com', ''),
 ( 'S3', 'Donna', 'Germany', 'Berlin', 'donna0@adventure-works.com', '915547890'),
 ( 'S4', 'Janet', 'United States', 'California',  'janet1@adventure-works.com', ''),
 ( 'S5', 'Fabio', 'España', 'Madrid', 'fabio10@gmail.com', ''),
 ( 'S6', 'Juan', 'España', 'Sevilla', '' , '915869028'),
 ( 'S7', 'Lucia', 'España', '', 'LuciaPerez@hotmail.com', ''),
 ( 'S8', 'Pedro', 'Italia', 'Roma', 'Pedro99@gmail.com', '910007890'),
 ( 'S9', 'Sergio', 'United States', 'New York',  'sergio_as@gmail.com', ''),
 ( 'S10', 'Grecia', 'Peru', 'Lima', 'Grecia89@gmail.com', ''),
 ( 'S11', 'Ismael', 'España', 'Madrid', 'Isma98@gmail.com', '912234543'),
 ( 'S12', 'Luis', 'España', 'Murcia', 'Luismiguel123@gmail.com', ''),
 ( 'S13', 'Pedro', 'Argentina', 'Buenos Aires', 'Pedro120@gmail.com', '') ;

INSERT INTO Teachers
VALUES
 ( 'T1', 'Juan', 'Matemáticas', 'JuanPerez@colegio.es'),
 ( 'T2', 'Sonia', 'Física', 'SoniDiaz@colegio.es'),
 ( 'T3', 'Lucia', 'Lengua', 'LuciaPerez@colegio.es'),
 ( 'T4', 'Marcos', 'Biología', 'MarcosSanz@colegio.es'),
 ( 'T5', 'Carlos', 'Educación Física', 'CarlosFernandez@colegio.es'),
 ( 'T6', 'Daniel', 'Geografía', 'DanielOrtiz@colegio.es'),
 ( 'T7', 'Garazi', 'Inglés', 'GaraziGarcia@colegio.es') ;

 
 INSERT INTO Examns
VALUES
 ( 'E1', 6.7, 'Matemáticas', 'S2', 'T1'),
 ( 'E2', 8, 'Física', 'S4', 'T2'),
 ( 'E3', 4.25, 'Matemáticas', 'S1', 'T1'),
 ( 'E4', 6.5, 'Inglés', 'S7', 'T7'),
 ( 'E5', 7, 'Lengua', 'S9', 'T3') ;
 
-----------------------------------------------------------

-- View the new tables

SELECT * FROM Students 

SELECT * FROM Teachers 

SELECT * FROM Examns 

-----------------------------------------------------------

-- Checking primary key restriction:

INSERT INTO Teachers
VALUES
 ('T1' , 'Juan', 'Filosofía', 'JuanDiaz@colegio.es') ;

-----------------------------------------------------------

-- Checking not null restriction:

INSERT INTO Teachers
VALUES
 ( 'T8', NULL, 'Filosofía', 'JuanDiaz@colegio.es') ;


-----------------------------------------------------------

-- Number of rows

SELECT count(*) FROM madrid_houses ;

-----------------------------------------------------------

-- Head of a table

SELECT * FROM madrid_houses LIMIT 5 ;

---- In Oracle: SELECT * FROM madrid_houses WHERE rownum <= 5;

-----------------------------------------------------------

-- Select columns from a table

SELECT n_rooms, n_bathrooms, buy_price, sq_mt_built  
FROM madrid_houses ;

-----------------------------------------------------------

-- Assign an alias to a column

SELECT buy_price AS price FROM madrid_houses ;

-----------------------------------------------------------

-- Filtering rows by conditions

SELECT * FROM madrid_houses WHERE buy_price <= 200000;

SELECT buy_price, sq_mt_built, n_bathrooms, n_rooms FROM madrid_houses WHERE n_bathrooms > 3;

SELECT * FROM madrid_houses WHERE n_bathrooms > 3 AND n_rooms > 5;

SELECT * FROM madrid_houses WHERE n_bathrooms > 3 OR sq_mt_built < 120;

SELECT * FROM madrid_houses WHERE n_bathrooms = 3 ;

SELECT * FROM madrid_houses WHERE n_bathrooms != 3 ;

SELECT * FROM madrid_houses WHERE n_rooms in (2, 4) ;

SELECT * FROM madrid_houses WHERE n_rooms not in (2, 4) ;

SELECT * FROM madrid_houses WHERE n_rooms is NOT NULL ;

SELECT * FROM Students WHERE Name = 'Pedro' ;

SELECT * FROM Students WHERE Name != 'Pedro' ;

SELECT * FROM Students WHERE Name in ('Fabio', 'Pedro') ;

--- Filtering rows from Students table 
--- where Name column contains the string ‘io’ :

SELECT * FROM Students WHERE Name like '%io%' ;

--- Filtering rows from Students table 
--- where Name column starts by the string ‘o’ :

SELECT * FROM Students WHERE Name like 'o%' ; 

--- Filtering rows from Alumnos table 
--- where Nombre column ends by the string ‘o’ :

SELECT * FROM Students WHERE Name like '%o' ; 

--- Filtering rows from Alumnos table 
--- where Nombre column contains ‘ab’ and ends by ‘o’ :

SELECT * FROM Students WHERE Name like '%ab%o' ; 

--- Filtering rows from Alumnos table 
--- where Nombre column starts with ‘F’ 
--- followed by 4 characters :

SELECT * FROM Students WHERE Name like '%F____' ; 

--- Filtering rows from Alumnos table 
--- where Nombre column starts with ‘F’ 
--- followed by 2 characters :

SELECT * FROM Students WHERE Name like '%F__' ; 


-----------------------------------------------------------

-- Number of rows that meets some condition

SELECT count(*) FROM madrid_houses 
WHERE buy_price <= 200000;

SELECT count(*) FROM madrid_houses 
WHERE n_bathrooms > 3 OR sq_mt_built < 120 ;

SELECT count(*) FROM madrid_houses 
WHERE n_rooms = 10;


-----------------------------------------------------------

-- Creating a new table based on a query

CREATE TABLE Students_2 (
    Name TEXT,
    Email TEXT
);

INSERT INTO Students_2 (Name, Email)
SELECT Name, Email
FROM Students;

SELECT * FROM Students_2;

-----------------------------------------------------------

-- Delete rows from a table:

CREATE TABLE Students_2 (
    Name TEXT,
    Email TEXT,
    Country TEXT
);

INSERT INTO Students_2 (Name, Email)
SELECT Name, Email, Country
FROM Students;

DELETE from Students_2;

SELECT * FROM Students_2;

-----------------------------------------------------------

-- Delete rows from a table that meet a condition:

INSERT INTO Students_2 (Name, Email)
SELECT Name, Email, Country
FROM Students;

DELETE FROM Students_2 WHERE Name = 'Fabio';

SELECT * FROM Students_2;


INSERT INTO Students_2 (Name, Email)
SELECT Name, Email, Country
FROM Students;

DELETE FROM Students_2 WHERE Name in ('Fabio','Grecia', 'Orlando', 'Pedro');

SELECT * FROM Students_2;

-----------------------------------------------------------

-- Delete columns from a table

--- In Oracle: ALTER TABLE Students_2 DROP COLUMN Name;

--- In SQLite: it seems that there is non query. 
--- We can do it by buttons.

-----------------------------------------------------------

-- Remove a table from de database:

DROP TABLE Students_2 ;

-----------------------------------------------------------

-- Update columns from a table

--- We can update a column for specific rows that meet a condition as follows :

UPDATE Students set Name = 'Messi' WHERE StudentID = 'S2';

SELECT * FROM Students ; 

--- We can update all the values in a column as follows :

UPDATE Students_2 SET Name = 'Messi' ; 

SELECT * FROM Students_2 ;

-----------------------------------------------------------

-- Define a single column

SELECT price_per_sq_mt = buy_price/sq_mt_built  
FROM madrid_houses ;

-----------------------------------------------------------

-- Define a new column for a table based in others

ALTER TABLE madrid_houses ADD COLUMN price_per_sq_mt REAL ;

UPDATE madrid_houses
SET price_per_sq_mt = buy_price/sq_mt_built ;

SELECT * FROM madrid_houses ; 

-----------------------------------------------------------

-- Concatenate strings from different columns


ALTER TABLE Students ADD COLUMN Country_City TEXT ;

UPDATE Students
SET Country_City =  Country || '-' || City ;

SELECT * FROM Students ; 


-----------------------------------------------------------

-- Sorting a table by columns

--- In ascending order

SELECT * FROM Examns ORDER BY Grade ASC ;

--- In descending order

SELECT * FROM Examns ORDER BY Grade DESC ;

-----------------------------------------------------------

-- Minimum 

SELECT Min(buy_price) FROM madrid_houses ;

-- Maximum

SELECT Max(buy_price) FROM madrid_houses ;

-- Average

SELECT Avg(buy_price) FROM madrid_houses ;

-- Variance

--- Not define in SQLite.

-- Standard deviation

SELECT Stdev(buy_price) FROM madrid_houses ;

-- Quantiles

--- Not define in SQLite.


-----------------------------------------------------------

-- Group by

--- We can group a table by the values ??in a column and then calculate a metric based on those groups.


SELECT has_parking, AVG(buy_price), MIN(buy_price), MAX(buy_price), Stdev(buy_price)
FROM madrid_houses  
GROUP BY has_parking ;

SELECT energy_certificate, AVG(buy_price), MIN(buy_price), MAX(buy_price), Stdev(buy_price)
FROM madrid_houses  
GROUP BY energy_certificate ;

-----------------------------------------------------------

-- Absolute frequency table using Group by

SELECT n_rooms , COUNT(n_rooms) AS Abs_freq
FROM madrid_houses 
GROUP BY n_rooms ;

-----------------------------------------------------------

-- Relative frequency table using Group by

SELECT n_rooms, COUNT(n_rooms) * 1.0 / (SELECT COUNT(*) FROM madrid_houses) AS Relative_freq
FROM madrid_houses
GROUP BY n_rooms;

--- * 1.0 is used to ensure that the division result is a 
--- floating-point number rather than integer division, which would truncate the decimal part.

-----------------------------------------------------------

-- Having

--- We can use Having filter rows after applying Group By.

SELECT Name, COUNT(Name) as Count_name
FROM Students 
GROUP BY Name
HAVING COUNT(Name) > 1

SELECT Name, COUNT(Name) as Count_name
FROM Students 
GROUP BY Name
HAVING COUNT(Name) = 1

SELECT energy_certificate, AVG(buy_price), MIN(buy_price), MAX(buy_price), Stdev(buy_price)
FROM madrid_houses  
GROUP BY energy_certificate 
HAVING AVG(buy_price) > 600000;

SELECT energy_certificate, AVG(buy_price), MIN(buy_price), MAX(buy_price), Stdev(buy_price)
FROM madrid_houses  
GROUP BY energy_certificate 
HAVING AVG(buy_price) < 600000;

SELECT energy_certificate, AVG(buy_price), MIN(buy_price), MAX(buy_price), Stdev(buy_price)
FROM madrid_houses  
GROUP BY energy_certificate 
HAVING AVG(buy_price) > 600000 AND MIN(buy_price) > 65000;

-----------------------------------------------------------

-- INNER JOIN

--- The inner join operation applied to two data frames DF1 and  DF2
---  produces another data frame consisting of the union of the rows of
--- DF1 and DF2 that share the same value in the link column (share the same linking value).

SELECT s.Name, e.Subject , e.Grade
FROM Students s 
JOIN Examns e  
ON s.StudentID = e.StudentID ;

SELECT t.Name, t.email , e.Subject
FROM Teachers t  
JOIN Examns e  
ON t.TeacherID = e.TeacherID ;


-----------------------------------------------------------

-- OUTER JOIN

--- The outer join operation applied to two data frames DF1 and DF2
--- produces the same data frame of inner join, but adding the rows from
--- DF1 that don’t share linking value with any row from DF2
--- and the rows from DF2 that don’t share linking value with any row form DF1.

SELECT t.Name, e.Subject, t.Studies, t.Email, e.StudentID, e.Grade
FROM Teachers t 
FULL OUTER JOIN Examns e  
ON t.TeacherID = e.TeacherID ;

SELECT t.Name, e.Subject, t.Studies, t.Email, e.StudentID, e.Grade
FROM Examns e 
FULL OUTER JOIN Teachers t   
ON t.TeacherID = e.TeacherID ;

SELECT DISTINCT t.Name, e.Subject, t.Studies, t.Email
FROM Teachers t
FULL OUTER JOIN Examns e 
ON t.TeacherID = e.TeacherID ;

-----------------------------------------------------------

-- RIGHT JOIN

--- The right join operation applied to two data frames DF1 and DF2
--- produces another data frame consisting of the rows of DF1 and DF2
--- that share link value, and the rest rows of DF2.

SELECT t.Name, e.Subject, t.Studies, t.Email 
FROM Teachers t 
RIGHT JOIN Examns e  
ON t.TeacherID = e.TeacherID ;

SELECT DISTINCT t.Name, e.Subject, t.Studies, t.Email
FROM Teachers t   
RIGHT JOIN Examns e  
ON t.TeacherID = e.TeacherID ;

SELECT t.Name, e.Subject, t.Studies, t.Email 
FROM Examns e 
RIGHT JOIN Teachers t  
ON t.TeacherID = e.TeacherID ;

SELECT s.Name, e.Subject, e.Grade, s.Email
FROM Students s 
RIGHT JOIN Examns e    
ON s.StudentID = e.StudentID ;

SELECT s.Name, e.Subject, e.Grade, s.Email
FROM  Examns e 
RIGHT JOIN Students s    
ON s.StudentID = e.StudentID ;

-----------------------------------------------------------

-- LEFT JOIN

--- The left join operation applied to two data frames DF1 and DF2
--- produces another data frame consisting of the rows of DF1 and DF2
--- that share link value, and the rest rows of DF1.

SELECT s.Name, e.Subject, e.Grade, s.Email, s.StudentID
FROM Students s 
LEFT JOIN Examns e 
ON s.StudentID = e.StudentID ;

SELECT s.Name, e.Subject, e.Grade, s.Email, s.StudentID
FROM Examns e 
LEFT JOIN Students s  
ON s.StudentID = e.StudentID ;

SELECT t.Name, e.Subject , t.Studies, t.Email
FROM Teachers t   
LEFT JOIN Examns e  
ON t.TeacherID = e.TeacherID ;

SELECT DISTINCT t.Name, e.Subject , t.Studies, t.Email
FROM Teachers t
LEFT JOIN Examns e 
ON t.TeacherID = e.TeacherID ;

SELECT t.Name, e.Subject , t.Studies, t.Email
FROM Examns e   
LEFT JOIN Teachers t   
ON t.TeacherID = e.TeacherID ;

-----------------------------------------------------------

-- Concatenate tables by rows

--- We can concatenate tables by rows using UNION as follows:

SELECT Name, Email, StudentID as ID FROM Students 
UNION
SELECT Name, Email, TeacherID as ID FROM Teachers ;

-----------------------------------------------------------

-- Concatenate tables by columns

--- We can concatenate tables by rows using JOIN as follows:

--- First we have to add a common column in both tables. We will call that column ID, which will be shared by both tables.

--- The ID values will be the sequence 1,2,3,…,len(table), where len(table) is the number of rows of the table.

--- In Students table we can do that as follows:
ALTER TABLE Students
ADD COLUMN ID INTEGER;

UPDATE Students
SET ID = (SELECT COUNT(*) FROM Students t WHERE t.rowid <= Students.rowid) - 1;

SELECT * FROM Students;

--- We make the same in Teachers table:
ALTER TABLE Teachers 
ADD COLUMN ID INTEGER;

UPDATE Teachers
SET ID = (SELECT COUNT(*) FROM Teachers t WHERE t.rowid <= Teachers.rowid) - 1;

SELECT * FROM Teachers;

-- Final Step: OUTER JOIN

SELECT s.Name, s.Email, s.Country , t.Name, t.Email, t.Studies
FROM Students s  
FULL OUTER JOIN Teachers t   
ON s.ID = t.ID ;








