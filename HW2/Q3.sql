/*
 * CSCI 585 Homework 2 
 * Author: Yifan Chen (ethanyc216@gmail.com)
 * Feb 28th, 2020
 * Q3 in SQLite
 * Link: https://ideone.com/zwWd21
 */

-- create table
CREATE TABLE Projects
(PID CHAR(10) NOT NULL,
Step INTEGER NOT NULL,
Status CHAR(1) NOT NULL,
PRIMARY KEY (PID, Step));
-- inset data
INSERT INTO Projects VALUES ('P100', 0, 'C');
INSERT INTO Projects VALUES ('P100', 1, 'W');
INSERT INTO Projects VALUES ('P100', 2, 'W');
INSERT INTO Projects VALUES ('P201', 0, 'C');
INSERT INTO Projects VALUES ('P201', 1, 'C');
INSERT INTO Projects VALUES ('P333', 0, 'W');
INSERT INTO Projects VALUES ('P333', 1, 'W');
INSERT INTO Projects VALUES ('P333', 2, 'W');
INSERT INTO Projects VALUES ('P333', 3, 'W');
-- display
.header on
.mode column
-- query
-- The query will select all PID with with step 0 is in status 'C', and then check if there is any other steps exist for this PID and their status should not be 'C'.
SELECT DISTINCT PID
FROM Projects p1
WHERE (p1.Step=0 AND
	   p1.Status='C' AND
       (SELECT PID
        FROM Projects p2
        WHERE p1.PID=p2.PID AND p2.Step!=0 AND p2.Status='C') IS NULL);