-- TASK 3
/*
1. Write an SQL query to calculate the total payments made by a specific student. You will need to 
join the "Payments" table with the "Students" table based on the student's ID.
*/

Select s.student_id , s.first_name , sum(p.amount) as total_payments 
from Students s
join Payments p ON s.student_id = p.student_id
where s.student_id = 103;	

/*
2. Write an SQL query to retrieve a list of courses along with the count of students enrolled in each 
course. Use a JOIN operation between the "Courses" table and the "Enrollments" table
*/

Select c.course_id ,c.course_name , count(e.student_id) as student_count
from courses c 
join enrollments e on  c.course_id = e.course_id
group by course_id,course_name;

/*
3. Write an SQL query to find the names of students who have not enrolled in any course. Use a 
LEFT JOIN between the "Students" table and the "Enrollments" table to identify students 
without enrollments
*/

Select s.student_id , concat(s.first_name , " " , s.last_name) as full_Name 
from Students s 
left join enrollments e on s.student_id = e.student_id
where e.course_id is null;

/*
4. Write an SQL query to retrieve the first name, last name of students, and the names of the 
courses they are enrolled in. Use JOIN operations between the "Students" table and the 
"Enrollments" and "Courses" tables.
*/
Select s.first_name , s.last_name , c.course_name
from students s 
join enrollments e on s.student_id = e.student_id
join courses c on e.course_id = c.course_id;

/*
5. Create a query to list the names of teachers and the courses they are assigned to. Join the 
"Teacher" table with the "Courses" table
*/

Select concat(t.first_name ," ",t.last_name ) as full_name , c.course_name
from teacher t 
join courses c on t.teacher_id = c.teacher_id ;

/*
6. Retrieve a list of students and their enrollment dates for a specific course. You'll need to join the 
"Students" table with the "Enrollments" and "Courses" tables
*/
Select s.student_id , concat(s.first_name , " " , s.last_name) as full_name , e.enrollment_date , c.course_name
from students s 
join enrollments e on s.student_id = e.student_id
join courses c on e.course_id = c.course_id
where c.course_id = 11;

/*
7. Find the names of students who have not made any payments. Use a LEFT JOIN between the 
"Students" table and the "Payments" table and filter for students with NULL payment records.
*/
Select  concat(s.first_name , " " , s.last_name) as full_name , p.amount
from students s 
left join payments p on s.student_id = p.student_id
where p.amount is null;

/*
8. Write a query to identify courses that have no enrollments. You'll need to use a LEFT JOIN 
between the "Courses" table and the "Enrollments" table and filter for courses with NULL 
enrollment records
*/

Select c.course_name , c.course_id
from courses c 
left join enrollments e on c.course_id = e.course_id
where e.student_id is null;

/*
9. Identify students who are enrolled in more than one course. Use a self-join on the "Enrollments" 
table to find students with multiple enrollment records.
*/

Select e.student_id , concat(s.first_name , " " , s.last_name) as full_name ,count(e.course_id) as course_count 
from enrollments e
join students s on e.student_id = s.student_id
group by e.student_id , full_name 
having count(e.course_id)>1;

/*
10. Find teachers who are not assigned to any courses. Use a LEFT JOIN between the "Teacher" 
table and the "Courses" table and filter for teachers with NULL course assignments.
*/

Select t.teacher_id , concat(t.first_name ," ",t.last_name ) as full_name , c.course_name 
from teacher t
left join courses c  on t.teacher_id = c.teacher_id
where c.course_id is null;