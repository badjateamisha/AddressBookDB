create Database AddressBookService;
use AddressBookService;

create table AddressBook
(
ID int Primary Key Identity (1,1),
FirstName Varchar(100),
LastName Varchar(100),
Address Varchar(100),
City Varchar(100),
State Varchar(100),
Zip int,
PhoneNumber Varchar(100),
Email_ID Varchar(100)
);

Insert into AddressBook Values ('Amisha','Jain','ABC Colony','Pimpri','Pune',500010,'9000000001','amisha@gmail.com');
Insert into AddressBook Values ('Aarvik','Kalburgi','ABC Colony','Pimpri','Pune',500010,'9000000002','aarvik@gmail.com');
Insert into AddressBook Values ('Disha','Jain','ABC Colony','Chinchwad','Pune',500010,'9000000003','disha@gmail.com');
Insert into AddressBook Values ('Sagar','Kalburgi','ABC Colony','Chinchwad','Pune',500010,'9000000004','sagar@gmail.com');
Select * from AddressBook;

update AddressBook set Address='XYZ Colony' where FirstName='Disha';
update AddressBook set Address='XYZ Colony' where FirstName='Sagar';

Insert into AddressBook Values ('Vibha','Jain','ABC Colony','Wakad','Pune',500010,'9000000005','vibha@gmail.com');

Delete From AddressBook where FirstName = 'Sagar';

Select * from AddressBook where City ='Pimpri' or State ='Pune';
Select * from AddressBook where City ='Wakad';

select count(City) from AddressBook;
select count(State) from AddressBook;

Select * from AddressBook order by FirstName ASC;
Select * from AddressBook order by FirstName DESC;
Select * from AddressBook where City = 'Pimpri' order by LastName ASC;
Select * from AddressBook where City = 'Wakad' order by LastName ASC;

Alter table AddressBook add ContactType varchar(100);
update AddressBook set ContactType='Friend' where LastName='Kalburgi';
update AddressBook set ContactType='Family' where LastName='Jain';
Select * from AddressBook;

select Count(ContactType) from AddressBook;

Insert into AddressBook Values ('Sagar','Kalburgi','ABC Colony','Chinchwad','Pune',500010,'9000000004','sagar@gmail.com','Family');
Insert into AddressBook Values('Sagar','Kalburgi','ABC Colony','Chinchwad','Pune',500010,'9000000004','sagar@gmail.com','Friend');
Select * from AddressBook;

Create table Address_Book1(AddressBookId Int Identity(1,1) Primary Key,
						  AddressBookName varchar(100));

Create table PersonDetail1(   PersonId Int Identity(1,1) Primary Key,
							 AddressBookId Int Foreign Key References Address_Book1(AddressBookId),
							 FirstName varchar(50),
							 LastName varchar(50),
							 Address varchar(100),
							 City varchar(50),
							 State varchar(50),
							 Zip int,
							 PhoneNumber bigint,
							 Email_ID varchar(50)    );

CREATE table PersonTypes1(	 PersonTypeId Int Identity(1,1) Primary Key,
							 PersonType varchar(50), );


CREATE table PersonsDetail_Type1(PersonId Int Foreign Key References PersonDetail1(PersonId),
								PersonTypeId Int Foreign Key References PersonTypes1(PersonTypeId)  );


CREATE table Employee_Department1(PersonId Int Foreign Key References PersonDetail1(PersonId),
								EmployeeID Int  ,
								DepartmentID int,);

				
select *from Address_Book1;
select *from PersonDetail1;
select *from PersonTypes1;
select *from PersonsDetail_Type1;
select *from Employee_Department1;


-------------Inserting values into Address_Book1 table---------------------------------
INSERT INTO Address_Book1(AddressBookName) Values('Home'),('School'),('College'),('Office');

select *from Address_Book1;


------------Insert values in PersonDetail1 table-------------
Insert INTO PersonDetail1 VALUES(1,'shahid','kapoor','Abc colony','Mumbai',' MH',520001,1234567890,'shahid@gmail.com'),
								(2,'Mira','Rajput','XYZ colony','Mumbai','MH',520002,1234567891,'mira@gmail.com'),
								(3,'Misha','Kapoor','ABC Colony','Mumbai','MH',520003,1234567892,'misha@gamil.com'),
								(4,'Sasha','Kalburgi','Pimpri','Pune','MH',520007,1234567893,'sasha@gmail.com');
select *from PersonDetail1;


---------Inserting values into persontype1 table--------------
INSERT INTO PersonTypes1(PersonType) VALUES('Family'),('SchoolFriend'),('Friend'),('Profession');

select *from PersonTypes1;

-----------Insert values in PersonsDetail_Type1 table-------------
INSERT INTO PersonsDetail_Type1(PersonId,PersonTypeId) VALUES(1,4),(2,3),(3,1),(4,2);
select *from PersonsDetail_Type1;

-----------Insert values in Employee_Department1 table-------------
INSERT INTO Employee_Department1 VALUES(1,123,818),(2,456,19112),(3,789,4512),(4,244,161815)
select *from Employee_Department1;


-----------UC13-Ensuring All retrieve queries from UC6 to UC10 with new table---------
-----------UC6-Retrieve Person belonging to city Or State-------------- -----------
SELECT addressbook.AddressBookId,addressbook.AddressBookName,persondetail.PersonId,persondetail.FirstName,persondetail.LastName,persondetail.Address,persondetail.City,persondetail.State,persondetail.Zip,
persondetail.PhoneNumber,persondetail.Email_ID,persontype.PersonType,persontype.PersonTypeId FROM
Address_Book1 AS addressbook 
INNER JOIN PersonDetail1 AS persondetail ON addressbook.AddressBookId = persondetail.AddressBookId AND (persondetail.City='Pune' OR persondetail.State='MH')
INNER JOIN PersonsDetail_Type1 as persontypedetail On persontypedetail.PersonId = persondetail.PersonId
INNER JOIN PersonTypes1 AS persontype ON persontype.PersonTypeId = persontypedetail.PersonTypeId;

----------UC7-understand Size of AddressBook by city and state---------
Select Count(*) As Count,State from PersonDetail1 Group By State;
Select Count(*) As Count,City from PersonDetail1 Group By City;

select Count(city) from PersonDetail1
select * from PersonDetail1

----------------UC8-Retrieve entries sorted alphabetically by person name---------------
SELECT addressbook.AddressBookId,addressbook.AddressBookName,persondetail.PersonId,persondetail.FirstName,persondetail.LastName,persondetail.Address,persondetail.City,persondetail.State,persondetail.Zip,
persondetail.PhoneNumber,persondetail.Email_Id,pt.PersonType,pt.PersonTypeId FROM
Address_Book1 AS addressbook 
INNER JOIN PersonDetail1 AS persondetail ON addressbook.AddressBookId = persondetail.AddressBookId 
INNER JOIN PersonsDetail_Type1 as ptm On ptm.PersonId = persondetail.PersonId
INNER JOIN PersonTypes1 AS pt ON pt.PersonTypeId = ptm.PersonTypeId Order By FirstName;

---------------UC_9Retreive Number Of Persons Records Based On Person Types---------------
Select Count(a.PersonTypeId) As PersonCount,b.PersonType From 
PersonsDetail_Type1 As a 
INNER JOIN PersonTypes1 AS b ON b.PersonTypeId = a.PersonTypeId
INNER JOIN PersonDetail1 AS c ON c.PersonId = a.PersonId Group By a.PersonTypeId,b.PersonType;

---------------UC_10_Retreive Number Of Persons Records Based On AddressBook Names----------
Select Count(a.AddressBookId) As AddressBookCount,a.AddressBookName From 
Address_Book1 As a 
INNER JOIN PersonDetail1 AS pd ON pd.AddressBookId = a.AddressBookId Group By a.AddressBookName,pd.AddressBookId;
						