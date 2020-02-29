/*
 * CSCI 585 Homework 2 
 * Author: Yifan Chen (ethanyc216@gmail.com)
 * Feb 28th, 2020
 * Q2 in SQLite
 * Link: https://ideone.com/XzIJhy
 */

-- create table
CREATE TABLE Enrollment
(SID INTEGER NOT NULL,
ClassName CHAR(10) NOT NULL,
Grade CHAR(1) NOT NULL,
PRIMARY KEY (SID, ClassName));
-- inset data
INSERT INTO Enrollment VALUES (123, 'Processing', 'A');
INSERT INTO Enrollment VALUES (123, 'Python', 'B');
INSERT INTO Enrollment VALUES (123, 'Scratch', 'B');
INSERT INTO Enrollment VALUES (662, 'Java', 'B');
INSERT INTO Enrollment VALUES (662, 'Python', 'A');
INSERT INTO Enrollment VALUES (662, 'JavaScript', 'A');
INSERT INTO Enrollment VALUES (662, 'Scratch', 'B');
INSERT INTO Enrollment VALUES (345, 'Scratch', 'A');
INSERT INTO Enrollment VALUES (345, 'JavaScript', 'B');
INSERT INTO Enrollment VALUES (345, 'Python', 'A');
INSERT INTO Enrollment VALUES (555, 'Python', 'B');
INSERT INTO Enrollment VALUES (555, 'JavaScript', 'B');
-- display
.header on
.mode column
-- query
-- The query will group the rows by ClassName and count the student number based on SID and sort in decreasing order.
SELECT ClassName, count(DISTINCT SID) AS Total
FROM Enrollment
GROUP BY ClassName
ORDER BY Total DESC, ClassName DESC;