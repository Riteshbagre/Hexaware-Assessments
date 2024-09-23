-- TASK 4

/*
1. Write an SQL query to calculate the average number of students enrolled in each course. Use 
aggregate functions and subqueries to achieve this
*/
select * from students;
select * from courses;
select * from enrollments;
select * from teacher;
select * from payments;


select course_id , avg(student_count) as avg_students_per_course
from (
    select course_id, COUNT(student_id) AS student_count
    from Enrollments 
    group by course_id
) as subquery
group by course_id;

/*
2. Identify the student(s) who made the highest payment. Use a subquery to find the maximum 
payment amount and then retrieve the student(s) associated with that amount
*/
Select student_id , amount 
from payments
where amount = (select max(amount) from payments);

/*
3. Retrieve a list of courses with the highest number of enrollments. Use subqueries to find the 
course(s) with the maximum enrollment count
*/

SELECT course_id, enrollment_count
FROM (
    SELECT course_id, COUNT(student_id) AS enrollment_count
    FROM Enrollments
    GROUP BY course_id
) AS subquery
WHERE enrollment_count = (SELECT MAX(enrollment_count)
                          FROM (SELECT COUNT(student_id) AS enrollment_count
                                FROM Enrollments
                                GROUP BY course_id) AS temp);

/*
4. Calculate the total payments made to courses taught by each teacher. Use subqueries to sum 
payments for each teacher's courses.
*/

Select teacher_id , sum(amount) as total_payments
from payments p 
where p.student_id IN (
	select e.student_id
    from enrollments e
    where e.course_id IN (select course_id from courses where teacher_id = e.course_id)
)
group by teacher_id;

/*
5. Identify students who are enrolled in all available courses. Use subqueries to compare a 
student's enrollments with the total number of courses.
*/

SELECT student_id
FROM Enrollments
GROUP BY student_id
HAVING COUNT(course_id) = (SELECT COUNT(course_id) FROM Courses);

/*
6. Retrieve the names of teachers who have not been assigned to any courses. Use subqueries to 
find teachers with no course assignments
*/

select teacher_id , concat(first_name , " " ,last_name) as full_name 
from teacher where teacher_id NOT IN
(select teacher_id from courses);

/*
7. Calculate the average age of all students. Use subqueries to calculate the age of each student 
based on their date of birth.
*/

select avg(datediff(curdate(),date_of_birth)/365) as avg_age from students;

/*
8. Identify courses with no enrollments. Use subqueries to find courses without enrollment 
records.
*/
Select course_name
from Courses
where course_id NOT IN (SELECT DISTINCT course_id FROM Enrollments);

/*
9. Calculate the total payments made by each student for each course they are enrolled in. Use 
subqueries and aggregate functions to sum payments.
*/
SELECT e.student_id, e.course_id, SUM(p.amount) AS total_payment
FROM Enrollments e
INNER JOIN Payments p ON e.student_id = p.student_id
GROUP BY e.student_id, e.course_id;

/*
10. Identify students who have made more than one payment. Use subqueries and aggregate 
functions to count payments per student and filter for those with counts greater than one.
*/
select student_id, count(payment_id) as payment_count
from Payments
group by student_id
having count(payment_id) > 1;

/*
11. Write an SQL query to calculate the total payments made by each student. Join the "Students" 
table with the "Payments" table and use GROUP BY to calculate the sum of payments for each 
student
*/
select s.first_name, s.last_name, sum(p.amount) as total_payments
from Students s
inner join Payments p ON s.student_id = p.student_id
group by s.student_id;

/*
12. Retrieve a list of course names along with the count of students enrolled in each course. Use 
JOIN operations between the "Courses" table and the "Enrollments" table and GROUP BY to 
count enrollments.
*/

select c.course_name, count(e.student_id) as student_count
from Courses c
left join Enrollments e on c.course_id = e.course_id
group by c.course_name;

/*
13. Calculate the average payment amount made by students. Use JOIN operations between the 
"Students" table and the "Payments" table and GROUP BY to calculate the average.
*/
select s.student_id, avg(p.amount) as avg_payment
from Students s
inner join Payments p on s.student_id = p.student_id
group by s.student_id;