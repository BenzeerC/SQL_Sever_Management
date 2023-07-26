create table Authour
(
 authorid int primary key,
 authorname varchar(20) not null,
 phno int not null,
 email varchar(25) not null unique,
 address varchar (20) not null,
 city varchar (20) not null
)
----Insert
insert into Authour values(1,'Chetan Bhagat',236595,'chetan@gmail.com','Bandhara','Mumbai')
insert into Authour values(2,'V.S. Naipaul',236595,'naipaul@gmail.com','st.James','Spain')
insert into Authour values(3,'Satish Gujrat',236595,'satish@gmail.com','FGandhi road','New Delhi')
insert into Authour values(4,'Nirad Chaudhuri',236595,'nirad@gmail.com','LRoad','British')
insert into Authour values(5,'V.Naipaul',236595,'naipaul@gmail.com','james','London')
insert into Authour values(6,'Vikram Seth',236595,'vikram@gmail.com','Feroz Road','Delhi')
insert into Authour values(7,'  Anita ',236595,'anita@gmail.com','Minabazzar','Dubai')
insert into Authour values(8,'Abul Fazl',236595,'abul@gmail.com','south D','Delhi')
insert into Authour values(9,'SRadhakrishnan',236595,'ram@gmail.com','Tamil Nadu','Madaras')
insert into Authour values(10,'Anita Desai',236595,'anita@gmail.com','Minabazzar','Dubai')
select * from Authour
--------------------------------------------------------------------------------------------------------------------------------



create table Book2
(
 bookid int primary key,
 bookname varchar(20) not null,
 authorid int not null,
 constraint fk_authour_book2 foreign key (authorid) references Authour (authorid),
 price numeric (10,2) not null
)
---Insert
insert into Book2 values(1,'One Indian Girl',1,350)
insert into Book2 values(2,'An Idealistof Life',8,900)
insert into Book2 values(3,'An Equal Music ',6,580)
insert into Book2 values(4,'A Brush with Life ',3,700)
insert into Book2 values(5,'A VillagethSea l',9,1500)
------------------------------------------------------------------------------------------------------------------

create table Award_Master
(
award_type_id int primary key,
award_name varchar (20) not null,
award_price int  not null
)
----------Insert
insert into Award_Master values(101,'Nobel','50000')
insert into Award_Master values(102,'Hugo','100000')
insert into Award_Master values(103,'National','150000')
insert into Award_Master values(104,'Costa','200000')
insert into Award_Master values(105,'James','50000')


-------------------------------------------------------------------------------------------------------------------
create table Award
(
 awardid int primary key,
 award_type_id int,
 constraint fk_Award_Master_Award foreign key (award_type_id) references Award_Master (award_type_id),
 authorid int,
 constraint fk_authour_award foreign key (authorid) references Authour (authorid),
 bookid int,
 constraint fk_book2_award foreign key (bookid) references Book2 (bookid),
 awardyear int not null,
)
select * from Award
-----Insert
insert into Award values(100,101,1,1,2003)
insert into Award values(200,102,2,2,2000)
insert into Award values(300,103,3,3,2005)
insert into Award values(400,104,4,4,2003)
insert into Award values(500,105,5,5,2007)
---------------------------------------------------------------------------------------------------------------------------
select * from Authour
select * from Book2
select * from Award_Master
select * from Award

-----------------------------------------------------------------------------------------------------------------------------
--find the book name which is written by 'Chetan Bhagat'
select * from Book2 where bookname=
(
   select bookname from Book2 where authorid=(select authorid from Authour where authorname='Chetan Bhagat')
)
-----------------------------------------------------------------------------------------------------------------------------
--find the number of award for each authour

  select result.authorid,authorname,result.Award from Authour,
  (select authorid,count(awardid) as 'Award' from Award group by authorid) result
  where result.authorid=Authour.authorid
------------------------------------------------------------------------------------------------------------------------------
--find the award name for the book A Brush with Life

select * from Award_Master where award_name=
(
select award_name from Award where bookid=(select bookid from Book2 where bookname=' A Brush with Life')
)
---------------------------------------------------------------------------------------------------------------------------------
--find all authour name who got an award
SELECT  a.authorname
FROM Authour a
INNER JOIN Award aw ON a.authorid = aw.authorid;
---------------------------------------------------------------------------------------------------------------------------------
--find the year wise authour count
--select * from Authour where authorname=

select awardyear, count(authorid) as 'Authour Count'
from Award
group by awardyear
order by awardyear

------------------------------------------------------------------------------------------------------------------------------------
--find the authour name who wrote only one book
SELECT a.authorname
FROM Authour a
LEFT JOIN Book2 b ON a.authorid = b.authorid
GROUP BY a.authorname
HAVING COUNT(b.bookid) = 1;
-------------------------------------------------------------------------------------------------------------------------------------
--find the book name which has max price 
SELECT b.bookname
FROM Book2 b
JOIN (
    SELECT MAX(price) AS max_price
    FROM Book2
) max_price_table ON b.price = max_price_table.max_price;




