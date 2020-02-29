/*
 * CSCI 585 Homework 2 
 * Author: Yifan Chen (ethanyc216@gmail.com)
 * Feb 28th, 2020
 * Q4 in SQLite
 * Link: https://ideone.com/j7ej5G
 */

-- create table
CREATE TABLE DB
(Name CHAR(10) NOT NULL,
Address CHAR(1) NOT NULL,
ID INTEGER NOT NULL,
SameFam INTEGER,
PRIMARY KEY (ID));
-- inset data
INSERT INTO DB (Name, Address, ID) VALUES ('Alice', 'A', 10);
INSERT INTO DB (Name, Address, ID) VALUES ('Bob', 'B', 15);
INSERT INTO DB (Name, Address, ID) VALUES ('Carmen', 'C', 22);
INSERT INTO DB VALUES ('Diego', 'A', 9, 10);
INSERT INTO DB VALUES ('Ella', 'B', 3, 15);
INSERT INTO DB (Name, Address, ID) VALUES ('Farkhad', 'D', 11);
-- query
-- The query will delete the rows with SameFam is NULL if we can find another row's SameFam is the same as that row's ID.
DELETE FROM DB
WHERE SameFam IS NULL AND
      EXISTS (SELECT ID
              FROM DB db2
              WHERE db2.SameFam=DB.ID);
-- display
.header on
.mode column
SELECT * FROM DB;