/*
 * CSCI 585 Homework 2 
 * Author: Yifan Chen (ethanyc216@gmail.com)
 * Feb 28th, 2020
 * Q5 in SQLite
 * Link: https://ideone.com/iGf8me
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
-- The query will select instructors who can teach 'JavaScript', 'Scratch' and 'Python' individually. Now we have three sets, and then do the intersect on those three sets. Now we have our final answer for the query.
SELECT Instructor
FROM Instructors
WHERE Subject='JavaScript'
INTERSECT
SELECT Instructor
FROM Instructors
WHERE Subject='Scratch'
INTERSECT
SELECT Instructor
FROM Instructors
WHERE Subject='Python';
/*
-- Note: 
If you need more subjects or change the subjects, you will have to add more following pattern or change the following pattern to your subjects:
INTERSECT
SELECT Instructor
FROM Instructors
WHERE Subject='More_Subject_Name'
 */