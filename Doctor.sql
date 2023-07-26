--------------------------------------Doctor-----------------------------------------------------------
create table Doctor
(
 doctorid int primary key,
 fname varchar (20),
 lname varchar (20),
 specialty varchar (20)
)
-------------Insert-------------------------------------------------------------------------------------
insert into Doctor values(1,'Saisht','Aute','Family Physicians')
insert into Doctor values(2,'Rahul','Patil','Hematologists')
insert into Doctor values(3,'Anil','Dewkar','Family Physicians')
insert into Doctor values(4,'Minakshi','Kankal','Neurologists ')
insert into Doctor values(5,'Anil','Patil',' Osteopaths')

----------------------------------------------Admission--------------------------------------------------
create table Admission
(
  patientid int constraint fk_patient_admission foreign key (patientid) references Patientsdetails (patientid),
  admission_date varchar(20),
  dischargedate varchar (20),
  daignosis varchar (20),
  doctorid int constraint fk_doctor_admission foreign key (doctorid) references Doctor (doctorid),

)
--drop table Admission
--------------------------------------------------Insert----------------------------------------------------------------
insert into Admission values(1,'2023/07/11','2023/07/15','Anxiety',4)
insert into Admission values(2,'2023/07/02','2023/07/06','Common cold',1)
insert into Admission values(3,'2023/07/11','2023/07/15','Dental abscess',5)
insert into Admission values(4,'2023/07/11','2023/07/15','Hearing loss',3)
insert into Admission values(5,'2023/07/11','2023/07/15','Anxiety',4)
insert into Admission values(6,'2023/07/11','2023/07/15','Common cold',1)
insert into Admission values(7,'2023/07/11','2023/07/15','Itching',2)
insert into Admission values(8,'2023/07/11','2023/07/15','Hearing loss',3)
insert into Admission values(9,'2023/07/11','2023/07/15','Dental abscess',5)
insert into Admission values(10,'2023/07/11','2023/07/15','Common cold',1)



------------------------------------------------Province_name----------------------------------------------------------
create table Province_Name1
(
 Province_id int primary key,
 Provincename varchar (20)
)
-------------------------------------------------Insert----------------------------------------------------------------
insert into Province_Name1 values(1,'Newlife hospital')
insert into Province_Name1 values(2,'Care & Cure Hospital')
insert into Province_Name1 values(3,'Health Hospital')
insert into Province_Name1 values(4,'HealthStreet')
insert into Province_Name1 values(5,'True life care')
--insert into Province_name values(1,'Newlife hospital')

-------------------------------------------------Patients-------------------------------------------------------------
Create table Patientsdetails
(
   patientid int primary key,
   fname varchar (20),
   lname varchar (20),
   gender varchar (20),
   dob varchar (20),
   city varchar (20),
   Province_id int constraint fk_patients_province1 foreign key (Province_id) references Province_Name1 (Province_id),
   allergies varchar (25),
   hight varchar(10),
   weight varchar(10)
)
---------------------------------------------------------------------------------------------------------------------------------
---Insert
insert into Patientsdetails values (1,'Seema','Bhosale','F','1985/06/11','Pune',1,'Penicillin','5"2feet','65kg' )
insert into Patientsdetails values (2,'Sunil','Mane','M','1986/05/15','Pune',2,'Morphine','5"5feet','75kg' )
insert into Patientsdetails values (3,'Nityam','D','M','1996/12/11','Pune',1,'Penicillin','5"4feet','55kg' )
insert into Patientsdetails values (4,'Aishwarya','Sone','F','1985/06/11','Mumbai',2,'Penicillin','5"2feet','65kg' )
insert into Patientsdetails values (5,'Chetan','Bhosale','M','1988/15/05','Pune',1,'Cow’s milk','5"2feet','56kg' )
insert into Patientsdetails values (6,'Chitra','Patil','F','1986/15/03','Pune',3,'Penicillin','5feet','75kg' )
insert into Patientsdetails values (7,'Ravi','Bhosale','M','1985/06/11','Pune',1,'Penicillin','5"9feet','55kg' )
insert into Patientsdetails values (8,'Sonal','Gawli','F','1954/05/13','Pune',4,'Dust mites','5"5feet','65kg' )
insert into Patientsdetails values (9,'Sunil','Bhosale','M','2020/15/21','Pune',1,'Penicillin','5"1feet','75kg' )
insert into Patientsdetails values (10,'Rama','Bhosale','F','2020/05/23','Pune',5,'Morphine','5"2feet','56kg' )
insert into Patientsdetails values (11,'Raghav','Mane','M','2021/26/16','Pune',1,'Penicillin','5"2feet','65kg' )
insert into Patientsdetails values (12,'Ayan','Sing','M','2000/08/29','Pune',2,'Penicillin','5"2feet','60kg' )
insert into Patientsdetails values (13,'Zeean','Bhosale','M','2001/07/11','Pune',1,'Morphine','5"2feet','75kg' )
insert into Patientsdetails values (14,'Priti','Kale','F','2008/11/30','Pune',5,'Penicillin','5"2feet','60kg' )
insert into Patientsdetails values (15,'Priya','Patil','F','1985/06/11','Pune',1,'Cockroaches','5"2feet','65kg' )
insert into Patientsdetails values (16,'Sakshi','Patil','F','1985/06/11','Pune',1,'null','5"2feet','65kg' )
insert into Patientsdetails values (17,'Rutvik','Pawar','M','1985/06/11','Pune',1,'null','5"2feet','56kg' )


-----------------------------------------------------------------------------------------------------------------------------------------------------------------
select * from Patientsdetails
select * from Admission
select * from Doctor
select * from Province_Name1
------------------------------------------------------------------------------------------------------------------------------------------------------------------
--1.Show the first name, last name and gender of patients who’s gender is ‘M’

   select fname,lname,gender from Patientsdetails where gender='M'
------------------------------------------------------------------------------------------------------------------------------------------------------------------
--2. Show the first name & last name of patients who does not have any allergies
  
     select fname ,lname from Patientsdetails where allergies='null'
------------------------------------------------------------------------------------------------------------------------------------------------------------------
--3. Show the patients details that start with letter ‘C’
  
     select * from Patientsdetails where fname like 'C%'
------------------------------------------------------------------------------------------------------------------------------------------------------------------
--4. Show the patients details that height range 5'1 to 5'9
 
   select * from Patientsdetails where hight between '5"1feet' and '5"9feet'
------------------------------------------------------------------------------------------------------------------------------------------------------------------
--5. Update the patient table for the allergies column. Replace ‘NKA’ where allergies is null

  update Patientsdetails set allergies='NKA' where allergies='null'
------------------------------------------------------------------------------------------------------------------------------------------------------------------
--6. Show how many patients have birth year is 2020/05/23
    
	select * from Patientsdetails where dob ='2020/05/23'
------------------------------------------------------------------------------------------------------------------------------------------------------------------
--7.Show the patients details who have greatest height
	
	select max(hight) from Patientsdetails
------------------------------------------------------------------------------------------------------------------------------------------------------------------
--8. Show the total amount of male patients and the total amount of female patients in the patients table.

     select gender , COUNT(*) as 'Gender'from Patientsdetails
	 group by gender
------------------------------------------------------------------------------------------------------------------------------------------------------------------
--9.Show first and last name, allergies from patients which have allergies to either 'Penicillin' or 'Morphine'. 
--  Show results ordered ascending by allergies then by first_name then by 

   select fname,lname,allergies from Patientsdetails where allergies='Penicillin' or allergies ='Morphine'
   order by fname,lname 
------------------------------------------------------------------------------------------------------------------------------------------------------------------
--10.Show first_name, last_name, and the total number of admissions attended for each doctor.
--Every admission has been attended by a doctor.
 
 select d.fname, d.lname, COUNT(p.patientid) as admissions_Total
 from Admission p,Doctor d
 where
 p.doctorid=d.doctorid
 group by d.fname,d.lname
------------------------------------------------------------------------------------------------------------------------------------------------------------------
--11.For every admission, display the patient's full name, their admission diagnosis, and their doctor's full name who diagnosed their problem.
   
   select p.fname  as 'Patientname' ,a.daignosis,d.fname as 'Doctorname'
   from Patientsdetails p --,Doctor d
   inner join Admission a on p.patientid=a.patientid
   inner join Doctor d on d.doctorid=a.doctorid
   where daignosis is not null
 
























