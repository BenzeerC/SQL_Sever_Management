create table FBUsers
(
  userid int primary key,
  username varchar (20) not null,
  email varchar (25) not null,
  phoneno int not null,
  totalposts int,
)

create table Post 
(
 postid int primary key,
 userid int,
 constraint fk_fbusers_post foreign key (userid) references FBUsers (userid)

)
