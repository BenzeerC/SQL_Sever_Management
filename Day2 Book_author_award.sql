create table Authour
(
 authorid int primary key,
 authorname varchar(20) not null,
 phno int not null,
 email varchar(25) not null unique,
 address varchar (20) not null,
 city varchar (20) not null
)
sp_help Authour

create table Book2
(
 bookid int primary key,
 bookname varchar(20) not null,
 authorid int not null,
 constraint fk_authour_book2 foreign key (authorid) references Authour (authorid),
 price numeric (10,2) not null
)

sp_help Book2

create table Award_Master
(
award_type_id int primary key,
award_name varchar (20) not null,
award_price int  not null
)

sp_help Award_Master

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

sp_help Award
