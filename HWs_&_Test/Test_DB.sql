--ФИО


--1. Что такое SQL?
--2. В чем отличия СУБД от БД?
--3. Напишите основные типы данных.

/*
1. Что такое SQL?

SQL - Structured Query Language (структурированный язык запросов). С помощью этого языка
пишутся запросы к Базе Данных. С помощью этого языка осуществляется контроль данных в БД,
а также производятся различные манипуляции над данными в БД (select, create, insert, delete, update ....).

2. В чем отличия СУБД от БД?

СУБД - система управления Базами Данных, т.е. это система, которая позволяет 
обрабатывать данные (делать различные манипуляции с данными), которые находятся в Базе Данных.
БД - База Данных, т.е. место, где хранятся данные (хранилище данных).

3. Напишите основные типы данных.

BIT
SMALLINT
INT
BIGINT
VARCHAR
CHAR
FLOAT
DOUBLE
*/



--Выполнить скрипты. После их выполнения написать следующие запросы:
--1. Выбрать все записи из таблицы Employee, где зарплата сотрудника больше 4000.

select *
from Employee
where Salary > 4000
go

--2. Выбрать максимальную ЗП из таблицы Employee.

select max(Salary)
from Employee
go

--3. Вывести имя сотрудника, имя департамента, для сотрудников у которых нет депарматента 
--    (через правильный джоин).

select e.Name, d.DepartmentName
from Employee e
  left join Department d on e.DepartmentId = d.Id
where DepartmentId is null
go

--4. Вывести общую сумму зарплат в разрезе (т.е. поля) названия департамента и половых признаков с учетом сотрудников, 
-- у которых нет демартамента (соединение как в п.3).

select d.DepartmentName, e.Gender, sum(e.Salary)
from Employee e
  left join Department d on e.DepartmentId = d.Id
group by d.DepartmentName, e.Gender
go

--5. Вывести результат как в п.4, дополнительно добавить условие, что сумма ЗП больше 4000 
--  (необщая, а по сотруднику).

select d.DepartmentName, e.Gender, sum(e.Salary)
from Employee e
  left join Department d on e.DepartmentId = d.Id
where e.Salary > 4000
group by d.DepartmentName, e.Gender
go

--6. После создания таблицы InfoUserComputer вставить в нее 1 запись 
-- (использовать функцию getUserId ) только для пользователя 'admin'. 
--   при этом изучить CONSTRAINT'ы. Подобрать подходящие значения для ввода.


USE TrainingCenter
GO

IF NOT OBJECT_ID('Employee') IS NULL DROP TABLE Employee
GO

IF NOT OBJECT_ID('InfoUserComputer') IS NULL DROP TABLE InfoUserComputer
GO

IF NOT OBJECT_ID('Department') IS NULL DROP TABLE Department
GO




CREATE TABLE Department (
Id int primary key,
DepartmentName nvarchar(50),
Location nvarchar(50),
DepartmentHead nvarchar(50) not null)

GO

CREATE TABLE Employee (
Id int primary key,
Name nvarchar(20) not null,
Gender nvarchar(20) not null,
Salary money,
DepartmentId int, 
CONSTRAINT FK_Employee_DepartmId FOREIGN KEY (DepartmentId) references Department(id)
)
GO

--ALTER table Employee DROP constraint FK_Employee_DepartmId
--Go

insert into Department values
(1, 'IT', 'Kyiv', 'Vasiliy'),
(2, 'HR', 'Lviv', 'Anna'),
(3, 'Payments', 'Kharkiv', 'Ivan'),
(4, 'Education', 'Dnipro', 'Petro'),
(5, 'Other Deparment', 'Kyiv', 'Kate') 

GO

INSERT INTO Employee Values 
(1, 'Tom', 'Male', 4000, 1),
(2, 'Dmytro', 'Male', 4100, 3),
(3, 'Sasha', 'Male', 500, 2),
(4, 'Olena', 'Female', 1200, 4),
(5, 'Marina', 'Female', 1000, 1),
(6, 'Denis', 'Male', 5421, 5),
(7, 'Victoria', 'Female', 4030, 4),
(8, 'Sam', 'Male', 1234, Null),
(9, 'Rob', 'Male', 4444, Null)


GO


SELECT *
FROM Employee e

SELECT *
FROM Department d
GO


CREATE TABLE InfoUserComputer (
	Id INT IDENTITY (1,1),
	UserId INT NOT NULL,
	ComputerModel Varchar(15), --Названиемодели компьютера
	SerialComputer Varchar(15), --Серийный номер
	CONSTRAINT PK_InfoUser_Id PRIMARY KEY (Id),
	CONSTRAINT FK_InfoUser_UserData FOREIGN KEY (UserID) REFERENCES UserData(UserDataId),
	CONSTRAINT CK_InfoUser_ComputerModel CHECK (LEN(ComputerModel) = 4 AND ComputerModel LIKE 'A[P-U][R-W][P-Z]'),
	CONSTRAINT CK_InfoUser_SerialComputer CHECK (SerialComputer LIKE '[0-9][6-9][0-9][A-Z][0-9][2-5][0-9][0-9]')
	)
	GO

