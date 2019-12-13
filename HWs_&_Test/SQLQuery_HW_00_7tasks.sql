
-- HW-00

-- Homework Ex.#1
--1. Вывести записи с таблицы UserLog, для которых ActionCode 
-- может иметь значения '201', '401', '524'.

select *
from UserLog l
where l.ActionCode in ('201', '401', '524')

-- Homework Ex.#2
-- 2. Вывести пользователей с таблицы Customer, 
-- которые родились до даты 1978-05-15 (включительно) и страна 804.

select *
from Customer c
where c.Birthday <= '1978-05-15'
and c.Country = '804'
go

-- Homework Ex.#3a
--3. Найти пользователей с таблицы Customer и UserLog, 
-- у которых код страны не равен 804 и ActionCode начинается на 2. 
-- Вывести а эран следующие поля: 
-- CustomerLogin, NameUser, Country, Resident, DateTime, ActionCode, ActionDescription
-- Обязательно использовать алиасы

select c.CustomerLogin, c.NameUser, c.Country, c.Resident, l.DateTime, l.ActionCode, l.ActionDescription
from Customer c, UserLog l 
where c.Cust_Id = l.IdCust
and c.Country != '804'
and l.ActionCode like '2%'
go

-- Homework Ex.#4
--4. Вывести пользователей с таблицы Customer, для которых нет записей 
--   о логировании в таблице UserLog

select *
from Customer c
where c.Cust_Id not in (select l.IdCust 
                        from UserLog l)
go


-- Homework Ex.#5
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


--6. Вывести список групп, которые связаны с курсами 
-- (данные искать в  таблицах UserGroup и Course, проанализировать связь между ними и связать).
-- Вывести на экран Name, CourseId, Code, Title, Description

select g.Name, c.CourseId, c.Code, c.Title, c.Description
from UserGroup g, Course c
where g.CourseId = c.CourseId
go


--7. Вывести только те записи о людях, которые имеют роль 'Студент'. 
-- Проанализировать таблицы UserData, UserRoleLink, UserRole и связи между ними.
-- Выборка будет состоять из связи 3-х таблиц и одного условия по роли.
-- На экран вывести колонки UserName, LastName, FirstName, MiddleName, Name

select u.UserName, u.LastName, u.FirstName, u.MiddleName, r.Name
from UserData u, UserRoleLink l, UserRole r
where u.UserDataId = l.UserDataId
and l.UserRoleId = r.UserRoleId
and r.Name = 'Студент'
go


