---Create table book
create table Book
(
   Bookid int primary key,
   Bookname varchar (25) not null,
   Authouname varchar (20) not null,
   Price numeric (10,2) not null
)

sp_help Book
---------------Foreign key--------------------------------------
create table Dept
(
depid int primary key,
depname varchar (20)
)

create table Emp
(
empid int primary key,
ename varchar (20) not null,
depid int,
constraint fk_dept_emp foreign key (depid) references Dept(depid)
)

----with alter command
alter table Emp add constraint fk_dept_emp foreign key (depid) references Dept(depid)


sp_help Emp


---OR
create table Emp
(
empid int primary key,
ename varchar (20) not null,
depid int foreign key (depid) references Dept(depid)
--constraint fk_dept_emp foreign key (depid) references Dept(depid)
)