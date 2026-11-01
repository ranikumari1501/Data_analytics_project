use ips;
create table student(
Roll_no INT primary key,
first_name varchar (50),
mobile_no double
);
INSERT INTO student (Roll_no , first_name , mobile_no)
values 
(101 , "RANI" , 8863952877 ),
(102 , "nikita" , 9876543218 ),
(103 , "Ram" , 3456789183 ),
(104 , "Syam" , 5678904321 ),
(105 , "Gautam" , 9087654321 );
 ALTER TABLE student Add  course varchar(10);
select * from student;
update student set course=BCA ;
drop database ips;
