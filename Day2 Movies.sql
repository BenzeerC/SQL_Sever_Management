create table Movies
(
  movieid int primary key,
  moviename varchar (15) not null,
  releseyear int not null,
  boxofficecollection int not null
)

sp_help Movies

create table Roles
( 
  rollid int primary key,
  rollname varchar (20) not null
)

sp_help Roles

create table Celebrity
(
  celebrityid int primary key,
  celebrityname varchar (15) not null,
  birthdate int not null,
  phno int not null,
  email varchar (20) not null 
)
sp_help Celebrity

create table BollywoodData
(
  bollywooddataid int primary key,
  celebrityid int,
  constraint fk_celebrity_bollywood foreign key (celebrityid) references Celebrity (celebrityid),
  movieid int,
  constraint fk_movies_bollywood foreign key (movieid)  references Movies (movieid),
  rollid int,
  constraint fk_roles_bollywood foreign key (rollid) references Roles (rollid)
)

sp_help BollywoodData