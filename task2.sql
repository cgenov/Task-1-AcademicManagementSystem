CREATE TABLE  student_table (
Student_id INT,
Stu_name VARCHAR(50), 
Department VARCHAR(20), 
email_id VARCHAR(50),
Phone_no VARCHAR(15), 
Address VARCHAR(50),
Date_of_birth DATE, 
Gender VARCHAR(20), 
Major VARCHAR(20), 
GPA NUMERIC,
Grade VARCHAR(1) CHECK (Grade IN ('A','B','C','D','E','F'))
);


INSERT INTO student_table (Student_id, Stu_name, Department, email_id, Phone_no, Address, Date_of_birth, Gender, Major, GPA, Grade)
VALUES
	(1,'Ion Popescu','Matematica','ion_popsescu@gmail.com','0740123456','Strada Rasaritului nr 12 Bucuresti','1999-05-22','M','Statistica',7.3,'B'),
	(2,'Maria Dumitras','Economie','dmaria@gmail.com','0751234567','Strada Macilor nr 5 Arad','1999-08-15','F','Finante',8.8,'A'),
	(3,'Florin Andrei','Fizica','andre-andrei@hotmail.com','0762345678','Bulevardul Al.I Cuza nr 8 bloc C Iasi','1999-11-08','M','Optica',8.1,'A'),
	(4,'Ana-Maria Ionele','Matematica','annisoara123@gmail.com','0773456789','Strada Bacovia nr 3, bloc 24, ap.7, Bucuresti','1998-01-26','F','Analiza matematica',7.8,'B'),
	(5,'Larisa Matei','Matematica','little_flower01@gmail.com','0784567890','Strada Postelor bloc Z ap 4 Piatra Neamt','1998-05-01','F','Statistica',8.3,'A'),
	(6,'Alexandru Popa','Informatica','alex.popa@gmail.com','0795678901','Strada Libertatii nr 15 Cluj','1999-03-18','M','Programare',9.1,'A'),
	(7,'Elena Dragomir','Chimie','elena.d@yahoo.com','0706789012','Strada Victoriei nr 7 Brasov','1998-07-30','F','Chimie organica',7.5,'B'),
	(8,'Mihai Rusu','Fizica','mihai.rusu@gmail.com','0717890123','Bulevardul Unirii nr 10 Timisoara','1999-09-12','M','Mecanica',8.5,'A'),
	(9,'Diana Stoica','Economie','diana.stoica@gmail.com','0728901234','Strada Pacii nr 22 Constanta','1998-12-05','F','Marketing',7.9,'B'),
	(10,'Radu Muresan','Informatica','radu.m@hotmail.com','0739012345','Strada Avram Iancu nr 3 Oradea','1999-02-28','M','Baze de date',8.9,'A');


SELECT* FROM student_table
ORDER BY GRADE DESC;

SELECT* FROM student_table
WHERE GENDER='M';

UPDATE student_table
SET GPA=4.8, Grade='C'
WHERE Student_id=7;

SELECT* FROM student_table
WHERE GPA<5.0;

UPDATE student_table
SET email_id='ion_popescu@gmail.com', Grade='C'
WHERE Student_id=1;

SELECT* FROM student_table;

SELECT 
Stu_name, 
Date_of_birth,
DATE_PART('year', AGE(CURRENT_DATE, Date_of_birth)) AS age
FROM student_table
WHERE  Grade='B';

SELECT 
	Department, 
	Gender,
	ROUND(AVG(GPA),2) AS average_GPA
FROM student_table
GROUP BY 1, 2;

ALTER TABLE student_table
RENAME TO student_info;

SELECT 
Stu_name, 
GPA
FROM student_info
ORDER BY GPA DESC
LIMIT 1;