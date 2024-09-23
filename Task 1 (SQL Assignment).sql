-- TASK 1

create database SIS;
use SIS;

create table Students (
	Student_id int primary key,
    first_name varchar(10),
    last_name varchar(10),
    date_of_birth date,
    email varchar(30),
    phone_number bigint
);
desc Students;

insert into Students Values (101,"Ritesh","Bagre",'2002-05-24',"riteshbagre72@gmail.com",7247297186);
insert into Students Values (102,"Aman","kufu",'2002-07-07',"aman@gmail.com",78451236696);
insert into Students Values (103,"Kamal","deo",'2002-01-22',"kamali@gmail.com",2365984741);
insert into Students Values (104,"Ishan","sharma",'2002-06-14',"ishanimi@gmail.com",8956322154);
insert into Students Values (105,"Rama","Bagre",'2002-09-14',"ramahbagre72@gmail.com",7237297186);
insert into Students Values (106,"kanha","kufu",'2002-02-07',"kahna@gmail.com",78451232696);
insert into Students Values (107,"Kriti","deo",'2002-01-02',"kriti@gmail.com",2365184741);
insert into Students Values (108,"Hari","sharma",'2002-04-04',"haripotter@gmail.com",8956322754);
select * from students;

create table Courses (
	course_id int primary key,
    course_name varchar(10),
    credits int,
    teacher_id int,
    foreign key (teacher_id) references Teacher(teacher_id)
);

insert into Courses Values (11,"Maths",10,1001);
insert into Courses Values (12,"English",10,1002);
insert into Courses Values (13,"Science",10,1003);
insert into Courses Values (14,"Socail",10,1004);
insert into Courses Values (15,"Hindi",10,1005);
insert into Courses Values (16,"Eco",10,1006);

select * from courses;

create table Teacher (
	teacher_id int primary key,
    first_name varchar(10),
    last_name varchar(10),
    email varchar(30)
);

insert into Teacher values(1001,"Prabhat","Sharma","prabhatsharama@gmail.com");
insert into Teacher values(1002,"Rishi","Sharma","rishisharama@gmail.com");
insert into Teacher values(1003,"Mahendra","kapur","mahendrakapur@gmail.com");
insert into Teacher values(1004,"Brajesh","Sharma","brajeshsharama@gmail.com");
insert into Teacher values(1005,"Bhargaw","das","Bhadas@gmail.com");
insert into Teacher values(1006,"Hemant","Sharma","Hemantsharama@gmail.com");
insert into Teacher values(1007,"Kevin","Maharaj","kevinM@gmail.com");
insert into Teacher values(1008,"mayank","Sharma","Maysharama@gmail.com");

select * from Teacher;

create table Enrollments (
	enrollment_id int primary key,
    student_id int,
    course_id int,
    enrollment_date date,
    foreign key (student_id) references Students(student_id),
    foreign key (course_id) references Courses(course_id)
    
);

insert into Enrollments value(010011,101,11,"2024-09-19");
insert into Enrollments value(010012,103,16,"2024-09-11");
insert into Enrollments value(010013,102,15,"2024-09-15");
insert into Enrollments value(010014,105,13,"2024-09-14");
insert into Enrollments value(010015,104,14,"2024-09-18");
insert into Enrollments value(010016,106,12,"2024-09-16");
insert into Enrollments value(010017,102,11,"2024-09-14");

select * from Enrollments;

create table Payments (
	payment_id int primary key,
    student_id int,
    amount int,
    payment_date date,
    foreign key (student_id) references Students(student_id)
);

insert into payments values(123123,101,2500,"2024-09-19");
insert into payments values(124124,103,2100,"2024-09-11");
insert into payments values(125125,102,2400,"2024-09-15");
insert into payments values(126126,105,2800,"2024-09-14");
insert into payments values(127127,104,2900,"2024-09-18");
insert into payments values(128128,106,2000,"2024-09-16");
insert into payments values(129129,102,2500,"2024-09-14");

select * from payments;
show tables;