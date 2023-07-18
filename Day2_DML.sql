-----DML-----
drop table Employee
create table Employee
(
  id int primary key,
  name varchar (20) not null,
  email varchar (30) unique,
  age int check(age>=18),
  country varchar (20) default 'India'
)


-----------------Insert Records
insert into Employee values(1,'Arsh','arsh@gmail.com',21,'India')
insert into Employee values(2,'Hiyansh','Hiyansh@gmail.com',23,'India')
insert into Employee values(3,'Advik','Advik@gmail.com',20,'India')
insert into Employee values(4,'Arohi','Arohi@gmail.com',25,'India')
insert into Employee values(5,'Arvika','Arvika@gmail.com',28,'India')
insert into Employee values(6,'Ishani','Ishani@gmail.com',29,'India')
insert into Employee values(7,'Ishanvi','Ishanvi@gmail.com',24,'India')
insert into Employee values(8,'Hazel','Hazel@gmail.com',22,'India')
insert into Employee values(9,'Inaya','Inaya@gmail.com',25,'India')
insert into Employee (id,name,email,age)values(10,'Mihit','Mihit@gmail.com',22)--Or insert syntex

-----------DQL Select-------------
select *from Employee

---------Update Records
update Employee set country ='UAE' where id=1
--Or
update Employee set email='arsh30@gmail.com' ,age=25,country='UAE' where id=1

----------------------Delete Record
delete  from Employee where id in(7,8,9)

delete from Employee where age>25





