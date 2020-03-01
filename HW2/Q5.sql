/*
 * CSCI 585 Homework 2 
 * Author: Yifan Chen (ethanyc216@gmail.com)
 * Feb 28th, 2020
 * Q5 in SQLite
 * Link: https://ideone.com/8cgfZU
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
-- The query will select distinct instructors and check if he can teach 'JavaScript', 'Scratch' and 'Python', a.k.a instructors will have those three rows in the table at least.
SELECT DISTINCT Instructor
FROM Instructors ins
WHERE EXISTS (SELECT * FROM Instructors ins1 WHERE ins.Instructor=ins1.Instructor AND ins1.Subject='JavaScript') AND
      EXISTS (SELECT * FROM Instructors ins2 WHERE ins.Instructor=ins2.Instructor AND ins2.Subject='Scratch') AND
      EXISTS (SELECT * FROM Instructors ins3 WHERE ins.Instructor=ins3.Instructor AND ins3.Subject='Python');
/*
-- Note: 
If you need more subjects or change the subjects, you will have to add more following pattern or change the following pattern to your subjects:
EXISTS (SELECT * FROM Instructors ins4 WHERE ins.Instructor=ins4.Instructor AND ins4.Subject='More_Subject_Name') AND
 */