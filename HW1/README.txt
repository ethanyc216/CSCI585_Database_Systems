##############################
##        Yifan Chen        ##
##        USC CS 585        ##
##        Homework 1        ##
##        02.07.2020        ##
##############################


##################################
##        Included Files        ##
##################################
	
	README.txt
	Homework1.jpg


############################################################
##        Clarified Problem Statement & Assumption        ##
############################################################

	1. Each student will sign up for at least one class and one project. (According to: students will sign up for a mix of coding classes, and projects.)
	2. Some classes or projects might have no student signed up. (Assumption, not specified by the problem.)
	3. Each faculty will teach at least one class and oversees at least one project. (According to: instructors (faculty) would teach a variety of coding classes throughout the day, and also oversee projects when they are not teaching.)
	4. Each class has at least one textbook. (According to: each instructor could potentially use a different text for the same class.)
	5. An instructor might specify a textbook for more than one class. (From the problem statement.)
	6. An instructor might specify different textbooks for different classes. But at most one textbook can be specified by a faculty for a certain class. (Assumption, not specified by the problem.)
	7. One class has at least one instructor. (According to: a class would have multiple instructors.)
	8. Students who signed up for same projects can form a group. (According to: a group typically containing 4 students who all sign up for a common project.)
	9. Assuming one item is only sold at a certain vendor.(Assumption, not specified by the problem.)
	10. A vendor sells multiple items. (According to: there is expected to be multiple orders placed with multiple vendors, to procure all the items.)
	11. Only student can borrow books from the library. (Assumption, not specified by the problem if others like faculties can borrow books.)
	12. The reated score for instructors, courses, and projects will be integer in the range of 1 to 5, including 1 and 5. (According to: at the end of the curriculum, students will be required to rate their instructors, courses, and projects, using a single score for each (one to five stars).)
	13. Only one coding language will be taught in a class. (Making assumption according to: coding would be taught using Scratch, Processing, Python, Java and JavaScript.)
	14. The project can only be in one type. (Making assumption according to: each project would be based on a microcontroller - Arduino, Raspberry Pi, BeagleBoard or micro:bit.)
	15. Each project much be overseen by a faculty. (Assumption, not specified by the problem.)
	16. A vendor sells at least one item, otherwise won't be in the table. And they have at least one order. (Assumption, not specified by the problem.)
	17. A student must gives a score to classs and projects they took and faculties who taught them.
	18. Other things specified in the homework.


######################################
##        Entity & Attribute        ##
######################################

STUDENT
	Storing the information of all students. Has STUDENT_ID attribute as its PK. It has FEE attribe to record how much they pay for the entire curriculum. It has LAST_NAME attribe and FIRST_NAME attribe to store their last name and first name.

CLASS
	Storing the information of all classes. Can be uniquely identified by composite of CLASS_ID attribute, FACULTY_ID attribute, a foreign key, and STUDENT_ID attribute, also a foreign key, as its PK. It has LANGUAGE attribe, referring to the language used in the class with a domain of Scratch, Processing, Python, Java and JavaScript. It has ROOM_ID attribute, a foreign key, as where the class will be held. Has CLASS_NAME attribute referring to the name of the class, START_TIME attribute referring to the start time of the class and END_TIME attribute referring to the end time of the class.

PROJECT
	Storing the information of all projects. Can be uniquely identified by composite of PROJECT_ID attribute, FACULTY_ID attribute, a foreign key, and STUDENT_ID attribute, also a foreign key, as its PK. It has PROJECT_TYPE attribe, referring to the type of the project with a domain of Arduino, Raspberry Pi, BeagleBoard and micro:bit. It has ROOM_ID attribute, a foreign key, as where the project will be held. Has PROJECT_NAME attribute referring to the name of the project, START_TIME attribute referring to the start time of the project and END_TIME attribute referring to the end time of the project.

ROOM
	Storing the information of all rooms. Has ROOM_ID attribute as its PK. It has LOCATION attribe referring to the location of the room.

FACULTY
	Storing the information of all falculties. Has FACULTY_ID attribute as its PK. It has LAST_NAME attribe and FIRST_NAME attribe to store their last name and first name. It also has TEACH_HOURS attribe and SUPERVISE_HOURS attribe to keep record of how many hours they worked, which could be used for calculating their salaries. 

TEXTBOOK
	Storing the information of all textbooks that are specified by a certain faculty for a certain class. Can be uniquely identified by composite of TEXTBOOK_ID attribute, CLASS_ID attribute, a foreign key, and FACULTY_ID attribute, also a foreign key, as its PK. It has BOOK_NAME attribe to store the name of the textbook. It also has AUTHOR attribe to store the authors of the textbook. (Here, we store multiple authors as a string, it could contains several authors.)

PROJECT_GROUP
	Storing the information of all project groups. Can be uniquely identified by composite of PROJECT_ID attribute, FACULTY_ID attribute, a foreign key, and STUDENT_ID attribute, also a foreign key, as its PK. It has TABLE_NUM attribe to store which table is assigned to them. It has BOX_ID attribe, also a foreign key, to store which plastic storage box was assigned to them.

BOX_INFO
	Storing the information of all items required for the project in project boexes. Can be uniquely identified by composite of BOX_ID attribute and ITEM_ID attribute, a foreign key, as its PK. One box might contains multiple items.

VENDOR
	Storing the information of all vendors. Can be uniquely identified by composite of VENDOR_ID attribute and ITEM_ID attribute, a foreign key, as its PK. Has VENDOR_NAME attribute referring to the name of the vendor and VENDOR_EMAIL attribute referring to the email of the vendor. May contains other information, since it's not specified in the statement, this is just some examples.

ORDER_INFO
	Storing the information of all orders. Can be uniquely identified by composite of ORDER_ID attribute and ITEM_ID attribute, a foreign key, as its PK.

ITEM
	Storing the information of all items. Has ITEM_ID attribute as its PK. Has ITEM_NAME attribute referring to the name of the item and ITEM_PRICE attribute referring to the price of the item. May contains other information, since it's not specified in the statement, this is just some examples.

CLASS_SCORE
	Storing the information of student rated scores of the class. Can be uniquely identified by composite of CLASS_ID attribute, a foreign key, FACULTY_ID attribute, also a foreign key, and STUDENT_ID attribute, also a foreign key, as its PK. Has CLASS_SCORE attribute referring to the score (integer in the range of 1 to 5, including 1 and 5) that a student gives to a class.

FACULTY_SCORE
	Storing the information of student rated scores of the faculty. Can be uniquely identified by composite of STUDENT_ID attribute, a foreign key, and FACULTY_ID attribute, also a foreign key, as its PK. Has FACULTY_SCORE attribute referring to the score (integer in the range of 1 to 5, including 1 and 5) that a student gives to a faculty.

PROJECT_SCORE
	Storing the information of student rated scores of the project. Can be uniquely identified by composite of PROJECT_ID attribute, FACULTY_ID attribute, a foreign key, and STUDENT_ID attribute, also a foreign key, as its PK. Has PROJECT_SCORE attribute referring to the score (integer in the range of 1 to 5, including 1 and 5) that a student gives to a project.

LIBRARY_RECORD
	Storing the information of all library records.  Can be uniquely identified by composite of STUDENT_ID attribute, a foreign key, and RECORD_COUNT attribute, an ascending number starting from 0, as its PK. Has BOOK_ID attribute, also a foreign key, referring to the ID of the book checked out and a CHECKOUT_TIME attribute referring to the time student checked out the book. When student returned the book, the record will be deleted and the RECORD_COUNT will not be recycled.

BOOK
	Storing the information of all books in the library. Has BOOK_ID attribute as its PK. It has BOOK_TYPE attribute referring to what the type of the book. Has BOOK_PRICE attribute referring to the price of the book and BOOK_STATUS attribute referring to the status of the book. If it's borrowed by a student, it will be "0"; otherwise will be "1". If BOOK_STATUS is "1", the STUDENT_ID attribute, also a foreign key, will be null; otherwise, will be the STUDENT_ID of which student borrowed it. May contains other information, since it's not specified in the statement, this is just some examples.


################################
##        Relationship        ##
################################

Binary relationship
--- 1:1
 	One CLASS is scheduled at one ROOM.
	One PROJECT is scheduled at one ROOM.
	One BOOK has zero or one LIBRARY_RECORD.
	One ORDER_INFO contains one ITEM.
	One BOX_INFO has one ITEM.

--- 1:M
	One PROJECT has zero or many PROJECT_GROUP.
	One STUDENT has zero or many (up to 4) LIBRARY_RECORD.
	One FACULTY has zero or many FACULTY_SCORE.
	One STUDENT gives one or many FACULTY_SCORE.
	One PROJECT has zero or many PROJECT_SCORE.
	One STUDENT gives one or many PROJECT_SCORE.
	One CLASS has zero or many CLASS_SCORE.
	One STUDENT gives one or many CLASS_SCORE.
	One VENDOR sells one or many ITEM.
	One PROJECT_GROUP has one or many BOX_INFO.
	One VENDOR has one or many ORDER_INFO.

--- M:N
	Zero or many STUDENT can sign up for one or many CLASS.
	Zero or many STUDENT can sign up for one or many PROJECT.
	One or many FACULTY can teach one or many CLASS.
 	One or many FACULTY can oversee one or many PROJECT.
	One or many STUDENT can form one or many PROJECT_GROUP.

Ternary relationship
	One or many FACULTY can specify one TEXTBOOK for one or many CLASS.


####################################
##        Design Decisions        ##
####################################

	Design decisions were made based on the assumptions above and all the entities are created based on the abstract concepts. 
	Most of the time a strong relationship was used in this ER diagram, because most of entities appeared based on others existence. 
