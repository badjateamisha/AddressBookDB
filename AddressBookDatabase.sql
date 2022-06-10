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
