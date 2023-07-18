------Authour
create table Author
(
authorid int primary key,
authorname varchar(20) not null,
city varchar (15),
country varchar (15)
)

sp_help Author
------Category

create table Category
(
  categoryid int primary key,
  description varchar (20)
)
sp_help Category

------Book
create table Book1
(
bookid int primary key,
tilte varchar (20),
authorid int,
constraint fk_authou_book foreign key (authorid) references Author(authorid),
categoryid int,
constraint fk_category_book foreign key (categoryid) references Category (categoryid),
year date,
price numeric(10,2),
publisher varchar(20),
rating int
)
alter table Book1 drop column year
alter table book1 add bookpublisheryear int
sp_help Book1

-------Oredr_Details
create table Order_Details
(
orderno int,
bookid int,
constraint fk_book_order foreign key (bookid) references book (bookid),

)


alter table Order_Details add qty int

sp_help Order_Details
