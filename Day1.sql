create table Employee    ------query to create table
(           
Empid int,
Empname varchar (25),
Salary numeric(18,2) 
)

---Schema

sp_help Employee  -------Structure of table

alter table Employee add qualification varchar(10)  -------add ---> add for add new column

alter table Employee alter column qualification varchar(15)   --------Modify data tye or size

alter table Employee drop column qualification --------Drop/delete the column from table

sp_rename 'Employee.Salary', 'Empsalary'-----------Rename the column in SQL server

--create table Student
--(
--  id int not null,
--  studentname varchar(20) not null,
--  email varchar (40) not null,
--  contactnumber int not null,
--  alternetmobile int
--)

-------for existing column we want to apply not null

alter table Employee alter column Empname varchar (25) not null

alter table Employee alter column Empsalary numeric(18,2) not null

alter table Employee alter column Empid int not null

------unique

alter table Employee add email varchar (40) not null unique

---Or

alter table Employee add constraint un_emp unique(Empid)

alter table Employee add constraint un_emp2 unique(email)

--------drop
alter table Employee drop constraint un_emp 
--------------------Primary key--------------------------------

create table Student1
(
  id int primary key,
  studentname varchar(20) not null,
  email varchar (40) not null,
  
  contactnumber int not null,
  alternetmobile int unique
)

-----add primary key in existing table
alter table Employee add constraint pk_emp primary key(Empid)

--------drop primary key
alter table Employee drop constraint pk_emp

----------------To add column primary key
alter table Employee add id int primary key