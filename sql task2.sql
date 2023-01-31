create database CodeAcademy

create table Department
(
Id int identity primary key,
Name nvarchar(100) NOT NULL Check (Len(Name)>2)
)

create table Employees
(
Id int identity primary key,
FullName nvarchar(100) NOT NULL Check (Len(FullName)>3),
Salary decimal(18,2) Check(Salary>0),
Email nvarchar(100) UNIQUE Not null,
DepartmentId int Not Null foreign key references Department(Id)
)


create database ContactHome

create table Brands
(
Id int identity primary key,
Name nvarchar(100) NOT NULL 
)

create table NoteBooks
(
Id int identity primary key,
Name nvarchar(100) NOT NULL ,
Price decimal(18,2),
BrandId int foreign key references Brands(Id)
)

create table Phones
(
Id int identity primary key,
Name nvarchar(100) NOT NULL ,
Price decimal(18,2),
BrandId int foreign key references Brands(Id)
)

insert into Brands 
Values
('Samsung'),
('Acer'),
('MSI'),
('IPhone')

insert into NoteBooks 
Values
('Samsung Galaxy Book Ion',2849.99,1),
('Acer Aspire A315',1679.99,2),
('MSI Katana GF66',4099.99,3),
('MSI 14 A10M-1029US',2279.99,3),
('Acer Extensa Ex215',999.99,2)

insert into Phones 
Values
('iPhone 14 Plus',2599.99,4),
('iPhone SE 3 (2022)',1249.99,4),
('iPhone 11 ',1199.99,4),
('Samsung Galaxy A04e',249.99,1),
('Samsung Galaxy Z Flip4 ',2249.99,1)

select (NoteBooks.Name+' '+Brands.Name) as BrandName ,NoteBooks.Price from NoteBooks Left  join Brands on NoteBooks.BrandId=Brands.Id

select (Phones.Name+' '+Brands.Name) as BrandName ,Phones.Price from Phones Left  join Brands on Phones.BrandId=Brands.Id

select * from NoteBooks where  NoteBooks.BrandId in (select Id from Brands where Brands.Name Like '%m%')

select * from NoteBooks where  (NoteBooks.Price between 2000 and 5000) or NoteBooks.Price>5000

select * from Phones where  (Phones.Price between 1000 and 1500) or Phones.Price>1500

select Name,(select COUNT(NoteBooks.Id)from NoteBooks where NoteBooks.BrandId=Brands.Id)from Brands 

select Name,(select COUNT(Phones.Id)from Phones where Phones.BrandId=Brands.Id) as [count] from Brands 

select Name,Phones.BrandId from Phones union select Name,NoteBooks.BrandId from NoteBooks

select Name,Phones.BrandId,Phones.Price,Phones.id from Phones union select Name,NoteBooks.BrandId,NoteBooks.Price,NoteBooks.id from NoteBooks

select Name,Phones.BrandId,Phones.Price,Phones.id from Phones where Phones.Price>1000 union select Name,NoteBooks.BrandId,NoteBooks.Price,NoteBooks.id from NoteBooks where NoteBooks.Price>1000

select Name as BrandName,(select COUNT(Phones.Id)from Phones where Phones.BrandId=Brands.Id) as [ProfuctCount],(select SUm(Phones.Price)from Phones where Phones.BrandId=Brands.Id) as [TotalPrice] from Brands 

select Name as BrandName,(select COUNT(NoteBooks.Id)from NoteBooks where NoteBooks.BrandId=Brands.Id) as [ProductCount],(select Sum(NoteBooks.Price)from NoteBooks where NoteBooks.BrandId=Brands.Id)as [TotalPrice]from Brands 