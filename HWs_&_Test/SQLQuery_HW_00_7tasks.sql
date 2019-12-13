
-- HW-00

-- Homework Ex.#1
--1. ������� ������ � ������� UserLog, ��� ������� ActionCode 
-- ����� ����� �������� '201', '401', '524'.

select *
from UserLog l
where l.ActionCode in ('201', '401', '524')

-- Homework Ex.#2
-- 2. ������� ������������� � ������� Customer, 
-- ������� �������� �� ���� 1978-05-15 (������������) � ������ 804.

select *
from Customer c
where c.Birthday <= '1978-05-15'
and c.Country = '804'
go

-- Homework Ex.#3a
--3. ����� ������������� � ������� Customer � UserLog, 
-- � ������� ��� ������ �� ����� 804 � ActionCode ���������� �� 2. 
-- ������� � ���� ��������� ����: 
-- CustomerLogin, NameUser, Country, Resident, DateTime, ActionCode, ActionDescription
-- ����������� ������������ ������

select c.CustomerLogin, c.NameUser, c.Country, c.Resident, l.DateTime, l.ActionCode, l.ActionDescription
from Customer c, UserLog l 
where c.Cust_Id = l.IdCust
and c.Country != '804'
and l.ActionCode like '2%'
go

-- Homework Ex.#4
--4. ������� ������������� � ������� Customer, ��� ������� ��� ������� 
--   � ����������� � ������� UserLog

select *
from Customer c
where c.Cust_Id not in (select l.IdCust 
                        from UserLog l)
go


-- Homework Ex.#5
--5. ������� �������� � ������� Customer � Penalty, ������� �������� ������ ���� 1985-04-14 
-- (�� ������������) ��� � ��� �� ���� ������.
--������ ������������� �� CustomerLogin � ������������� �������, 
-- � ������ �� ���� � �������� �������.

select * 
from Customer c
left join Penalty p
on c.Cust_Id = p.CustomerId
where c.Birthday < '1985-04-14'
or p.Id is null
order by c.CustomerLogin, p.Date desc
go


--6. ������� ������ �����, ������� ������� � ������� 
-- (������ ������ �  �������� UserGroup � Course, ���������������� ����� ����� ���� � �������).
-- ������� �� ����� Name, CourseId, Code, Title, Description

select g.Name, c.CourseId, c.Code, c.Title, c.Description
from UserGroup g, Course c
where g.CourseId = c.CourseId
go


--7. ������� ������ �� ������ � �����, ������� ����� ���� '�������'. 
-- ���������������� ������� UserData, UserRoleLink, UserRole � ����� ����� ����.
-- ������� ����� �������� �� ����� 3-� ������ � ������ ������� �� ����.
-- �� ����� ������� ������� UserName, LastName, FirstName, MiddleName, Name

select u.UserName, u.LastName, u.FirstName, u.MiddleName, r.Name
from UserData u, UserRoleLink l, UserRole r
where u.UserDataId = l.UserDataId
and l.UserRoleId = r.UserRoleId
and r.Name = '�������'
go


