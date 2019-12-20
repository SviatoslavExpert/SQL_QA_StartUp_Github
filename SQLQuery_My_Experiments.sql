USE TrainingCenter
GO

IF NOT OBJECT_ID('Departments') IS NULL DROP TABLE Departments
GO


--  =====================================================

--  Section 1:  create, insert, select *

--  =====================================================

--  Creating table Departments

CREATE TABLE Departments (
    DeptName      VARCHAR(15)     NOT NULL,
    EmployeeId    INT             NOT NULL
)
go

-- Inserting into table Departments

INSERT INTO Departments (DeptName, EmployeeId)
VALUES ('Sales', 1000)

INSERT INTO Departments (DeptName, EmployeeId)
VALUES ('HR', 1002)

INSERT INTO Departments (DeptName, EmployeeId)
VALUES ('Accounting', 1003)

INSERT INTO Departments (DeptName, EmployeeId)
VALUES ('Operations', 1004)
go

--  Showing everything from table Departments

select *
from Departments
go

--  Creating table Employees

CREATE TABLE Employees (
    EmployeeId    INT             NOT NULL,
    EmployeeName  VARCHAR(20)     NOT NULL,
	HireDate      DATETIME        NOT NULL 
)
go

-- Inserting values into table Employees

INSERT INTO Employees (EmployeeId, EmployeeName, HireDate)
VALUES (1000, 'John Smith', '2017-10-11')

INSERT INTO Employees (EmployeeId, EmployeeName, HireDate)
VALUES (1001, 'Fred White', '2018-09-07')

INSERT INTO Employees (EmployeeId, EmployeeName, HireDate)
VALUES (1002, 'Jane Scott', '2019-05-01')

INSERT INTO Employees (EmployeeId, EmployeeName, HireDate)
VALUES (1003, 'Samuel Williams', '2019-05-01')
go

--  Showing everything from table Employees

select *
from Employees
go

--  Creating table Bonuses

CREATE TABLE Bonuses (
    EmployeeName  VARCHAR(20)     NOT NULL,
	Amount        INT                     ,
	BonusDate     DATE            NOT NULL 
)
go


--  Inserting values into table Bonuses

INSERT INTO Bonuses (EmployeeName, Amount, BonusDate)
VALUES ('John Smith', 5000, '2018-11-09')

INSERT INTO Bonuses (EmployeeName, Amount, BonusDate)
VALUES ('Fred White', 7000, '2019-09-11')

INSERT INTO Bonuses (EmployeeName, Amount, BonusDate)
VALUES ('Jane Scott', null, '2019-09-01')

INSERT INTO Bonuses (EmployeeName, Amount, BonusDate)
VALUES ('Samuel Williams', 3000, '2019-12-05')
go

----  Showing everything from table Bonuses

select *
from Bonuses
go



--  ===========================================

--  Section 2:  select column_name, aliases, contraint where

--  ===========================================


--  Show  DeptName from table Departments

select DeptName
from Departments
go

--  Show  EmployeeName from table Employees

select EmployeeName
from Employees
go

--  Show EmployeeName, Amount, BonusDate from table Bonuses

select b.EmployeeName, b.Amount, b.BonusDate
from Bonuses b
go

--  Show  EmployeeName, Amount, BonusDate from Bonuses
--  where Amount = 5000

select b.EmployeeName, b.Amount, b.BonusDate
from Bonuses b
where b.Amount = 5000
go

--  Show  EmployeeName, HireDate from table Employees
--  where EmployeeId = 1001

select e.EmployeeName, e.HireDate
from Employees e
where e.EmployeeId = 1001
go


--  ===========================================

--  Section 3:  predicates, 

--  ===========================================



select b.EmployeeName, b.Amount, b.BonusDate
from Bonuses b
where b.Amount <= 5000
go

select b.EmployeeName, b.Amount, b.BonusDate
from Bonuses b
where b.Amount > 5000
go

select b.EmployeeName, b.Amount, b.BonusDate
from Bonuses b
where b.Amount is null
go

select b.EmployeeName, b.Amount, b.BonusDate
from Bonuses b
where b.Amount is not null
go






















select d.DeptName, e.EmployeeName
from Departments d, Employees e
where d.EmployeeId = e.EmployeeId
go


select *
from Employees
where EmployeeId in (1000, 1002)
go

select *
from Employees e
where e.EmployeeId <= 1002
and e.HireDate <= '2018-09-07'
go

select d.DeptName, d.EmployeeId, e.EmployeeId, e.EmployeeName, e.HireDate
from Departments d, Employees e 
where d.EmployeeId = e.EmployeeId
and d.DeptName != '1004'
and e.EmployeeName like '%J%'
go

-- Вывести работников с таблицы Employees, для которых нет записей 
-- в таблице Departments

select *
from Employees e
where e.EmployeeId not in (select d.EmployeeId 
                           from Departments d)
go


--5. Вывести клиентов с таблциы Customer и Penalty, которые родились раньше даты 1985-04-14 
-- (не включительно) или у них не было штрафа.
--Данные отсортировать по CustomerLogin в возрастающием порядке, 
-- а штрафы по дате в обратном порядке.

select * 
from Customer c
left join Penalty p
on c.Cust_Id = p.CustomerId
where c.Birthday < '1985-04-14'
or p.Id is null
order by c.CustomerLogin, p.Date desc
go



--  ===========================================

select d.DeptName, e.EmployeeName
from Departments d
  left join Employees e
on d.EmployeeId = e.EmployeeId
go

select *
from Departments d
  left join Employees e
on d.EmployeeId = e.EmployeeId
go

select d.DeptName, e.EmployeeName
from Departments d
  right join Employees e
on d.EmployeeId = e.EmployeeId
go

select *
from Departments d
  right join Employees e
on d.EmployeeId = e.EmployeeId
go

select d.DeptName, e.EmployeeName
from Departments d
  inner join Employees e
on d.EmployeeId = e.EmployeeId
go

select *
from Departments d
  inner join Employees e
on d.EmployeeId = e.EmployeeId
go

select d.DeptName, e.EmployeeName
from Departments d
  full outer join Employees e
on d.EmployeeId = e.EmployeeId
go

select *
from Departments d
  full outer join Employees e
on d.EmployeeId = e.EmployeeId
go

