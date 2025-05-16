create database assessment;
use assessment;

-- 1. Database creation --

create table StudentInfo (
STU_ID int primary key,
STU_NAME varchar(50),
DOB date,
PHONE_NO varchar(15),
EMAIL_ID varchar(50),
ADDRESS varchar (100)
);
create table CoursesInfo (
COURSE_ID int primary key,
COURSE_NAME varchar(50),
COURSE_INSTRUCTOR_NAME varchar(50)
);
create table EnrollmentInfo (
ENROLLMENT_ID int,
STU_ID int,
COURSE_ID INT,
ENROLL_STATUS enum('Enrolled','Not Enrolled'),
foreign key(STU_ID) references StudentInfo(STU_ID),
foreign key(COURSE_ID) references CoursesInfo(COURSE_ID)
);

-- 2. Data creation --

insert into StudentInfo values (1, 'Popescu Ana', '2001-04-21', '0745821566','popescuana@gmail.com','Romania, Iasi, Strada Florilor nr 3');
insert into StudentInfo values (2, 'Rusu Ion', '2002-12-01', '0722984536','rusu_ionut@gmail.com','Romania, Brasov, Strada Ion Neculce nr 25, bloc 5, ap 2'), 
(3, 'Axinte Diana', '2001-10-15', '07654523246','dianutza@gmail.com','Romania, Husi, Strada Fantanilor nr 4'),
(4, 'Ion Ion', '2003-07-03', '0749576249','ion-ion@gmail.com','Romania, Iasi, Bulevardul Independentei bloc C2, ap 4');

insert into CoursesInfo values (1, 'Analiza Matematica','Precupanu Ioan'),
(2,'Geometrie Spatiala', 'Galatanu Maria'),
(3,'Analiza Matematica 2','Precupanu Ioan'),
(4, 'Statistica','Constantinescu Vasile');

insert into EnrollmentInfo values 
(1, 1, 1, 'Enrolled'),
(2, 1, 3, 'Not Enrolled'),
(3, 1, 4, 'Enrolled'),
(4, 2, 1, 'Enrolled'),
(5, 2, 3, 'Enrolled'),
(6, 2, 4, 'Not Enrolled'),
(7, 3, 2, 'Enrolled'),
(8, 4, 4, 'Enrolled')
;

-- 3. Retrieve the Student Information --

-- a) Retrieve student information: write a query to retrieve student details, such as student name, contact informations, and enrollment status --

select * from StudentInfo;
select * from EnrollmentInfo;

-- b) Write a query to retrieve a list of courses in which a specific student is enrolled. --

select c.course_name, e.course_id from EnrollmentInfo e join coursesinfo c on c.course_id=e.course_id where stu_id='1'and ENROLL_STATUS='Enrolled';

-- c) Write a query to retrieve course information, including course name, instructor information. --

select * from CoursesInfo;

-- d) Write a query to retrieve course information for a specific course --

select * from CoursesInfo where course_id='1';

 -- e) Write a query to retrieve course information for multiple courses. --
 
 select * from CoursesInfo where course_id in ('1','3');
 
 -- 4.Reporting and Analytics (Using joining queries) --
 
 -- a) Write a query to retrieve the number of students enrolled in each course --
 
 select course_id, count(distinct(stu_id)) 
 from EnrollmentInfo 
 where enroll_status='Enrolled' 
 group by course_id;
 
-- b) Write a query to retrieve the list of students enrolled in a specific course --

select c.course_name, s.stu_name from CoursesInfo c join EnrollmentInfo e on c.course_id = e.course_id 
join StudentInfo s on s.stu_id = e.stu_id where e.enroll_status='Enrolled' and c.course_id='4';

-- c) Write a query to retrieve the count of enrolled students for each instructor. --

select c.COURSE_INSTRUCTOR_NAME, count(distinct(e.stu_id))
from CoursesInfo c join EnrollmentInfo e on c.course_id = e.course_id 
where e.enroll_status='Enrolled'
group by 1;

-- d) Write a query to retrieve the list of students who are enrolled in multiple courses --

with CTE as (
select stu_id, count(course_id) as enrolled_courses from EnrollmentInfo
where enroll_status='Enrolled'
group by stu_id
)
select s.stu_name, CTE.enrolled_courses from StudentInfo s join CTE on s.stu_id=CTE.stu_id;


-- e) Write a query to retrieve the courses that have the highest number of enrolled students (arranging from highest to lowest) --

select c.course_name, count(e.stu_id) as enrolled_students from EnrollmentInfo e join coursesinfo c on e.course_id=c.course_id
where enroll_status='Enrolled'
group by 1
order by 2 desc;
