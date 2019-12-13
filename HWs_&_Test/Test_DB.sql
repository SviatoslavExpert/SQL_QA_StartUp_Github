--���


--1. ��� ����� SQL?
--2. � ��� ������� ���� �� ��?
--3. �������� �������� ���� ������.

/*
1. ��� ����� SQL?

SQL - Structured Query Language (����������������� ���� ��������). � ������� ����� �����
������� ������� � ���� ������. � ������� ����� ����� �������������� �������� ������ � ��,
� ����� ������������ ��������� ����������� ��� ������� � �� (select, create, insert, delete, update ....).

2. � ��� ������� ���� �� ��?

���� - ������� ���������� ������ ������, �.�. ��� �������, ������� ��������� 
������������ ������ (������ ��������� ����������� � �������), ������� ��������� � ���� ������.
�� - ���� ������, �.�. �����, ��� �������� ������ (��������� ������).

3. �������� �������� ���� ������.

BIT
SMALLINT
INT
BIGINT
VARCHAR
CHAR
FLOAT
DOUBLE
*/



--��������� �������. ����� �� ���������� �������� ��������� �������:
--1. ������� ��� ������ �� ������� Employee, ��� �������� ���������� ������ 4000.

select *
from Employee
where Salary > 4000
go

--2. ������� ������������ �� �� ������� Employee.

select max(Salary)
from Employee
go

--3. ������� ��� ����������, ��� ������������, ��� ����������� � ������� ��� ������������ 
--    (����� ���������� �����).

select e.Name, d.DepartmentName
from Employee e
  left join Department d on e.DepartmentId = d.Id
where DepartmentId is null
go

--4. ������� ����� ����� ������� � ������� (�.�. ����) �������� ������������ � ������� ��������� � ������ �����������, 
-- � ������� ��� ������������ (���������� ��� � �.3).

select d.DepartmentName, e.Gender, sum(e.Salary)
from Employee e
  left join Department d on e.DepartmentId = d.Id
group by d.DepartmentName, e.Gender
go

--5. ������� ��������� ��� � �.4, ������������� �������� �������, ��� ����� �� ������ 4000 
--  (�������, � �� ����������).

select d.DepartmentName, e.Gender, sum(e.Salary)
from Employee e
  left join Department d on e.DepartmentId = d.Id
where e.Salary > 4000
group by d.DepartmentName, e.Gender
go

--6. ����� �������� ������� InfoUserComputer �������� � ��� 1 ������ 
-- (������������ ������� getUserId ) ������ ��� ������������ 'admin'. 
--   ��� ���� ������� CONSTRAINT'�. ��������� ���������� �������� ��� �����.


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
	ComputerModel Varchar(15), --�������������� ����������
	SerialComputer Varchar(15), --�������� �����
	CONSTRAINT PK_InfoUser_Id PRIMARY KEY (Id),
	CONSTRAINT FK_InfoUser_UserData FOREIGN KEY (UserID) REFERENCES UserData(UserDataId),
	CONSTRAINT CK_InfoUser_ComputerModel CHECK (LEN(ComputerModel) = 4 AND ComputerModel LIKE 'A[P-U][R-W][P-Z]'),
	CONSTRAINT CK_InfoUser_SerialComputer CHECK (SerialComputer LIKE '[0-9][6-9][0-9][A-Z][0-9][2-5][0-9][0-9]')
	)
	GO

