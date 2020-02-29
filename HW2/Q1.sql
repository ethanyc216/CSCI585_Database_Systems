/*
 * CSCI 585 Homework 2 
 * Author: Yifan Chen (ethanyc216@gmail.com)
 * Feb 28th, 2020
 * Q1 in SQLite
 * Link: https://ideone.com/X9vDIL
 */

-- create table
CREATE TABLE ProjectRoomBookings
(roomNum INTEGER NOT NULL,
startTime INTEGER NOT NULL,
endTime INTEGER NOT NULL,
groupName CHAR(10) NOT NULL,
PRIMARY KEY (roomNum, startTime)
CHECK (endTime>startTime));

-- create trigger
CREATE TRIGGER validate_time_before_insert_ProjectRoomBookings BEFORE INSERT ON ProjectRoomBookings
BEGIN
    SELECT CASE
    WHEN ((SELECT roomNum
        FROM ProjectRoomBookings
        WHERE roomNum = NEW.roomNum AND
        ((NEW.startTime<startTime AND NEW.endTime>startTime) OR
        (NEW.startTime>=startTime AND NEW.startTime<endTime)))
        IS NOT NULL)
    THEN RAISE (ABORT,'Invalid time duration') END;
END;

/* test
-- test
-- ok
INSERT INTO ProjectRoomBookings VALUES (1, 9, 13, 'a');
INSERT INTO ProjectRoomBookings VALUES (2, 12, 15, 'a');
-- check issue 1
INSERT INTO ProjectRoomBookings VALUES (1, 18, 12, 'a');
-- check issue 2
INSERT INTO ProjectRoomBookings VALUES (1, 12, 15, 'a');
INSERT INTO ProjectRoomBookings VALUES (2, 7, 13, 'a');
INSERT INTO ProjectRoomBookings VALUES (2, 7, 18, 'a');
-- ok
INSERT INTO ProjectRoomBookings VALUES (2, 7, 9, 'a');

-- display
.header on
.mode column
SELECT * FROM ProjectRoomBookings;
 */