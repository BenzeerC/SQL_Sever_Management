------------------------------------------------EmployeeInfo-------------------------------------------------------
create table EmployeeInfo
(
  empid int primary key,
  empfname varchar (20),
  emplname varchar (20),
  department varchar(20),
  project varchar (15),
  address varchar(15),
  dob varchar (20),
  gender varchar(15)
)
--------------------------------------------Insert--------------------------------------------------------
insert into EmployeeInfo values(1,'Rohit','Gupta','Admin','p1','Delhi','02/12/1979','Male')
insert into EmployeeInfo values(2,'Rahul','Mahajan','Admin','p2','Mumbai','10/10/186','Male')
insert into EmployeeInfo values(3,'Sonai','Banarji','HR','p3','Pune','05/06/1983','Female')
insert into EmployeeInfo values(4,'Rohit','Gupta','HR','p4','Chennai','28/11/1983','Female')
insert into EmployeeInfo values(5,'Rohit','Gupta','HR','p5','Delhi','06/04/1991','Female')


-------------------------------Employee Position Table---------------------------------------------
create table EmployeePosition
(
  empid int constraint fk_employee_position foreign key (empid) references EmployeeInfo (empid),
  empPosition varchar (20),
  dateofjoining varchar (25),
  salary numeric (10,2)
)
------------------------------------------------Insert----------------------------------------------------------
insert into EmployeePosition values(1,'Executive','01/04/2020',75000)
insert into EmployeePosition values(2,'Manager','03/04/2020',500000)
insert into EmployeePosition values(3,'Manager','02/04/2020',150000)
insert into EmployeePosition values(4,'Officer','02/04/2020',90000)
insert into EmployeePosition values(5,'Manager','03/04/2020',3000000)
------------------------------------------------------------------------------------------------------------------------------------------------------
--1.Create a query to generate the first records from the EmployeeInfo table.

   select top 1 *from EmployeeInfo
   ------------------------------------------------------------------------------------------------------------------------------------------------------
--2. Create a query to generate the last records from the EmployeeInfo table.
     
	  select top 1 *from EmployeeInfo
      order by empid desc
------------------------------------------------------------------------------------------------------------------------------------------------------

--3. Create a query to fetch the third-highest salary from the EmpPosition table.
  
    select salary from EmployeePosition
	order by salary desc
	offset 2 rows fetch next 1 row only
------------------------------------------------------------------------------------------------------------------------------------------------------

--4. Write a query to find duplicate records from a table.
    select empid,empfname,emplname,department,address,project,gender
	from EmployeeInfo
	group by empid,empfname,emplname,department,address,project,gender
	having count (*) > 1
------------------------------------------------------------------------------------------------------------------------------------------------------
--5. Create an SQL query to fetch EmpPostion and the total salary paid for each employee position.

     select empPosition , sum(salary) as 'Total salary'
	 from EmployeePosition
	 group by empPosition
------------------------------------------------------------------------------------------------------------------------------------------------------

--6. Create a query to obtain display employees having salaries equal to or greater than 150000.

     select * from EmployeePosition where salary >= 150000
------------------------------------------------------------------------------------------------------------------------------------------------------


--7. Create a query to fetch the list of employees of the same department

     select e3.empid,e3.empfname,e3.emplname,e3.department
	 from EmployeeInfo e3
	 join EmployeeInfo e2 on e3.department=e2.department
	 where e2.empid <> e3.empid
	 order by e3.department, e3.empid
------------------------------------------------------------------------------------------------------------------------------------------------------






