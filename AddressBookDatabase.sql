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

Create table Address_Book(AddressBookId Int Identity(1,1) Primary Key,
						  AddressBookName varchar(100));
Create table PersonDetail(   PersonId Int Identity(1,1) Primary Key,
							 AddressBookId Int Foreign Key References Address_Book(AddressBookId),
							 FirstName varchar(50),
							 LastName varchar(50),
							 Address varchar(100),
							 City varchar(50),
							 State varchar(50),
							 Zip int,
							 PhoneNumber bigint,
							 Email_ID varchar(50)    );

CREATE table PersonTypes(	 PersonTypeId Int Identity(1,1) Primary Key,
							 PersonType varchar(50), );

CREATE table PersonsDetail_Type(PersonId Int Foreign Key References PersonDetail(PersonId),
								PersonTypeId Int Foreign Key References PersonTypes(PersonTypeId)  );

CREATE table Employee_Department(PersonId Int Foreign Key References PersonDetail(PersonId),
								EmployeeID Int  ,
								DepartmentID int,);
				
select *from Address_Book;
select *from PersonDetail;
select *from PersonTypes;
select *from PersonsDetail_Type;
select *from Employee_Department;