-- TASK 2

/* Q1. 
1. Write an SQL query to insert a new student into the "Students" table with the following details:
a. First Name: John
b. Last Name: Doe
c. Date of Birth: 1995-08-15
d. Email: john.doe@example.com
e. Phone Number: 1234567890
*/
Insert into students values(109,"John","Doe","1995-08-15","john.doe@example.com",1234567890);

/* 
2. Write an SQL query to enroll a student in a course. Choose an existing student and course and 
insert a record into the "Enrollments" table with the enrollment date.
*/
insert into Enrollments values(010019,106,12,"2024-09-19");

/* 
3. Update the email address of a specific teacher in the "Teacher" table. Choose any teacher and 
modify their email address.
*/
update Teacher set email = "prabhatsir@gmail.com" where teacher_id = 1001;

/*
4. Write an SQL query to delete a specific enrollment record from the "Enrollments" table. Select 
an enrollment record based on the student and course
*/
DELETE from Enrollments where enrollment_id = 10017 and course_id = 11;

/*
5. Update the "Courses" table to assign a specific teacher to a course. Choose any course and 
teacher from the respective tables.
*/
UPDATE Courses SET teacher_id = 10 WHERE course_id = 5;


/*
6. Delete a specific student from the "Students" table and remove all their enrollment records 
from the "Enrollments" table. Be sure to maintain referential integrity
*/
Delete from Students Where student_id = 104;

/*
7. Update the payment amount for a specific payment record in the "Payments" table. Choose any 
payment record and modify the payment amount.
*/
update payments set amount = 2525 where payment_id = 123123;
