/*
 * CSCI 585 Homework 2 
 * Author: Yifan Chen (ethanyc216@gmail.com)
 * Feb 28th, 2020
 * Q5 in SQLite
 * Link: https://ideone.com/alMkUL
 */

-- create table
CREATE TABLE Instructors
(Instructor CHAR(10) NOT NULL,
Subject CHAR(10) NOT NULL,
PRIMARY KEY (Instructor, Subject));
-- inset data
INSERT INTO Instructors VALUES ('Aleph', 'Scratch');
INSERT INTO Instructors VALUES ('Aleph', 'Java');
INSERT INTO Instructors VALUES ('Aleph', 'Processing');
INSERT INTO Instructors VALUES ('Bit', 'Python');
INSERT INTO Instructors VALUES ('Bit', 'JavaScript');
INSERT INTO Instructors VALUES ('Bit', 'Java');
INSERT INTO Instructors VALUES ('CRC', 'Python');
INSERT INTO Instructors VALUES ('CRC', 'JavaScript');
INSERT INTO Instructors VALUES ('Dat', 'Scratch');
INSERT INTO Instructors VALUES ('Dat', 'Python');
INSERT INTO Instructors VALUES ('Dat', 'JavaScript');
INSERT INTO Instructors VALUES ('Emscr', 'Scratch');
INSERT INTO Instructors VALUES ('Emscr', 'Processing');
INSERT INTO Instructors VALUES ('Emscr', 'JavaScript');
INSERT INTO Instructors VALUES ('Emscr', 'Python');
-- display
.header on
.mode column
-- query
-- The query will count how many languages instructors can teach in the range of ('JavaScript', 'Scratch', 'Python'). And then only show instructors who can teach 3 languages. (Note here, becase there are no repeated rows in TABLE Instructors.) 
SELECT Instructor
FROM (SELECT DISTINCT Instructor, count(ins1.Subject) AS Num
	  FROM Instructors ins1
	  WHERE ins1.Subject IN ('JavaScript', 'Scratch', 'Python')
	  GROUP BY ins1.Instructor)
WHERE NUM=3;