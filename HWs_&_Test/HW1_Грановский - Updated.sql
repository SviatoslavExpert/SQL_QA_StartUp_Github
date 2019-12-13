USE TrainingCenter
GO

--  ======================================================

--    HOMEWORK

--  ======================================================

--  1. Создать новый учебный курс в таблице Course.


insert into Course
select 500, 'P500', 'Основы Java', 'Синтаксис языка Java', 5700.00, 'A'
go

select *
from Course
where Code = 'P500'
go


/*  

    2. Создать описание новосозданного курса (п.1.) в таблице CourseContent (3 записи). 
       Предварительно проанализируйте таблицы, посмотрите как на текущих данных выполнено наполнение таблиц.
       Дополнительно предоставяю описание заполнения CourseContent  как пример "Course_CourseContent_пример.docx".   

*/


insert into CourseContent
select 500, 1, 1, '1', 'UN', 'Введение в программу курса Java', 'Базовая информация'
union all
select 500, 2, 1, 'A', 'CH', 'Типы данных в Java', 'Базовые типы данных'
union all
select 500, 3, 1, 'B', 'CH', 'Условные операторы', 'if, if else'
go

select *
from CourseContent cc, Course c
where cc.CourseId = c.CourseId
and c.Code = 'P500'
go


/*
   3. Создать новую учебную группу в таблице UserGroup 
   (проанализировать связи таблиц Course и UserGroup. 
   Используйте скрипт 2-Create_Tables.sql и диаграмму БД для изучения связей).
*/


insert into UserGroup
select 500, 'Группа №5. Группа буднего дня. Старт 12.10.2019', '2019-12-12  11:25:09.977 AM', '2019-07-05  10:25:07.955 AM', 'A'
go

select *
from UserGroup
where Name = 'Группа №5. Группа буднего дня. Старт 12.10.2019'
go


--  4. Добавить 2 новых пользователя в таблицу UserData со статусом 'D'.


select *
from UserData
go

insert into UserData
select 'miketyson', '1ghf57dkt', 'Макар', 'Иполитович', 'Голопупкин', '2019-12-01  10:34:09 AM', '2019-12-7  11:45:09 AM', 'D'
union
select 'spiderman', '9fgh5lk7', 'Кристофор', 'Устимович', 'Перчиков', '2019-10-09  10:34:09.799 AM', '2019-11-10  11:45:09.977 AM', 'D'
go

select *
from UserData
where UserName in ('miketyson','spiderman')
go


--  5. Добавить еще 2 пользователя в таблицу UserData с другим допустимым статусом.


insert into UserData
select 'superstar', 'password01', 'Джон', 'Маркович', 'Спайдерман', '2019-10-02  10:34:09.977 AM', '2019-11-03  11:45:09.955 AM', 'A'
union
select 'sniper', 'password99dfg', 'Степан', 'Васильевич', 'Бирюзенко', '2019-12-12  11:25:09.977 AM', '2019-07-05  10:25:07.955 AM', 'A'
go

select *
from UserData
where UserName in ('superstar','sniper')
go


/* 6. Связать своих 4-х новых пользователей с группой (связь данных с таблиц UserGroup и UserData через таблицу UserGroupLink). 

    Для определения идентификатора пользователя, постарайтесь научиться использовать функцию getUserId.
    Пример ее использования есть в скрипте 3 - Insert_Tables.sql при вставке в таблицу "[UserRoleLink] inserts".
    Функция, это универсальный механизм, вам не придется вручную прописывать идентификатор пользователя, который у вас и у меня может отличаться.
*/


insert into UserGroupLink (UserGroupId, UserDataId)
SELECT (SELECT UserGroupId from UserGroup where Name = 'Группа №5. Группа буднего дня. Старт 12.10.2019'),
         (SELECT * FROM getUserId ('miketyson'))
UNION ALL
SELECT (SELECT UserGroupId from UserGroup where Name = 'Группа №5. Группа буднего дня. Старт 12.10.2019'),
         (SELECT * FROM getUserId ('spiderman'))
UNION ALL
SELECT (SELECT UserGroupId from UserGroup where Name = 'Группа №5. Группа буднего дня. Старт 12.10.2019'),
         (SELECT * FROM getUserId ('superstar'))
UNION ALL
SELECT (SELECT UserGroupId from UserGroup where Name = 'Группа №5. Группа буднего дня. Старт 12.10.2019'),
         (SELECT * FROM getUserId ('sniper'))
go

select *
from UserGroupLink
WHERE UserGroupId = (SELECT UserGroupId from UserGroup where Name = 'Группа №5. Группа буднего дня. Старт 12.10.2019')
go



/*  7. Изменить статус на 'активный' для своих новосозданных пользователей у которых статус 'D', 
    а также установить дату изменения строки через функцию CURRENT_TIMESTAMP, 
	которой пользовались на уроке (в поле UpdateDate).
*/

update UserData set [Status] = 'A'
where UserName = 'miketyson'
go

update UserData set UpdateDate = CURRENT_TIMESTAMP
where UserName = 'miketyson' 
go

update UserData set [Status] = 'A'
where UserName = 'spiderman'
go

update UserData set UpdateDate = CURRENT_TIMESTAMP
where UserName = 'spiderman' 
go

select *
from UserData
go 


/*
  8. Выбрать всех пользователей из СВОЕЙ ГРУППЫ и своего КУРСА, 
  отсортировав по имени пользователя (FirstName). 
  
  Вывести только эти колонки: UserName, FirstName, MiddleName, LastName, [Name] as GroupName 
  (колонка с таблицы UserGroup), Title (таблица Course).

  Ожидаю получить SELECT в секции FROM которого будет написано 4 таблицы 
  (UserData, UserGroupLink, UserGroup, Course), 
  далее в условии WHERE и AND необходимо связать эти таблицы по корректным идентификаторам таблиц.

  Так же написать дополнительное условие фильтрации (AND) по идентификатору новой группы, 
  что бы вывести только своих 4-х студентов со своей группы.
  Сортировка, это дополнительное условие в самом конце выборки: ORDER BY FirstName.

*/

select u.UserName, u.FirstName, u.MiddleName, u.LastName, [Name] as GroupName, c.Title
from UserData u, UserGroupLink l, UserGroup g, Course c
where u.UserDataId = l.UserDataId and l.UserGroupId = g.UserGroupId 
                                  and g.CourseId = c.CourseId
								  and g.Name = 'Группа №5. Группа буднего дня. Старт 12.10.2019'
ORDER BY u.FirstName
go 


/*
9. Удалить своих пользователей с БД, созданную группу и описатели курса и курс. 
Нужно будет проделать работу в  обратном порядке. 
Просто так пользователя удалить не получится, потому что он будет связан с новосозданной группой.
Выполняйте удаление по UserName с таблицы UserData. 
Это поле уникально и удалится только тот пользователь, которого вы напишете в условии 
WHERE UserName  = 'логин пользователя' или через IN ('','','') указав перечень логинов 
пользователей. Так же можно использовать функцию, на ваше усмотрение.
*/


delete 
from UserGroupLink
where UserGroupId = (select UserGroupId from UserGroup where CourseId = 500)
go

select *
from UserGroupLink
where UserGroupId = (select UserGroupId from UserGroup where CourseId = 500)
go

-----------------------------

delete
from UserGroup
where CourseId = 500
go

select *
from UserGroup
where CourseId = 500
go

delete 
from CourseContent
where CourseId = 500
go

select *
from CourseContent
where CourseId = 500
go

delete 
from Course
where Code = 'P500'
go

select *
from Course
go

delete 
from UserData
where UserName in ('miketyson','spiderman', 'superstar', 'sniper')
go

select *
from UserData
go





/*
================================================================================
   
Практика написания запросов.
Под каждым заданием написать SELECT с условием.

================================================================================
*/

-- 1. Найти документы в таблице Payment, где сумма (Amount)  больше равна 26024.92.

select *
from Payment
where amount >= 26024.92
go

-- 2. Найти документы в таблице Payment, где назначение платежа (TXT) имеет слово 'рахунок' 
--     в любом сегменте строки, И валюта (Currency) документов может быть '978', '980'.

select *
from Payment
where TXT like '%рахунок%' 
          and Currency IN ('978','980')  
go


-- 3. Найти документы в таблице Payment, где дата документа между 2010-02-11 и 2011-05-22, 
--    и валюта документов НЕ равна 980.

select * 
from Payment
where Data_doc between '2010-02-11' and '2011-05-22' 
               and Currency != '980'
go


-- 4. Найти документы в таблице Payment, где Дебет счета (DebAcc) может иметь  
--    такие счета '260070001','260088791','260006443'.


select * 
from Payment
where DebAcc IN ('260070001','260088791', '260006443') 
go

/*
  5. Найти документы в таблице Payment, где Дебет счета (DebAcc) может иметь  
такие счета '260070001','260088791','260006443'. При этом вывести сумму документа Amount 
умноженную на 3 и от этой суммы отнять 1000.
*/

select Amount * 3 - 1000
from Payment
where DebAcc IN ('260070001','260088791', '260006443') 
go


/*
6. Вывести счета с таблицы Account, где (Статус (Status) равен 'O' 
   И дата открытия OpenDate равна 2016-01-21) ИЛИ дата закрытия CloseDate явяется НЕ NULL. 
   Здесь обратите внимание на скобки в условии.
*/

select * 
from Account
where ([Status] = 'O' and OpenDate = '2016-01-21')
                     or CloseDate is not NULL
go


--  7. Вывести счета с таблицы Account, где Статус (Status) равен 'O' 
--     И (дата открытия OpenDate равна 2016-01-21 ИЛИ дата закрытия CloseDate явяется НЕ NULL). 
--     Здесь обратите внимание на скобки в условии.

select * 
from Account
where [Status] = 'O' and (OpenDate = '2016-01-21'
                     or CloseDate is not NULL)
go


--  8. Вывести пользователей с таблицы Customer и Salary, у которых ДР '1977-09-26', 
--     получал Бонус и дата ЗП между '2019-03-31' и '2019-09-30'.

select *
from Customer c, Salary s
where c.Cust_Id = s.Cust_Id
and c.Birthday = '1977-09-26'
and s.Bonus is not null 
and s.Date between '2019-03-31' and '2019-09-30'
go 


/*
9. Вывести информацию о пользователях и его счетах с таблиц Customer и Account, где:
	- Клиенты нерезиденты
	- Счет начинается на 2650
	вторая часть выборки
	- Клиенты нерезиденты
	- Код валюты 980.
Подсказка: между запросами использовать UNION или UNION ALL, 
но что бы выводимые строки не дублировались (попрактикуйте с этим оператором соединения)
Поля для вывода такие: 
CustomerLogin, NameUser, Resident, Country, Gender, Account, Currency, [Status], OpenDate
Отсортировать по дате открытия счета в обратном порядке.
*/

select c.CustomerLogin, c.NameUser, c.Resident , c.Country, c.Gender, a.Account, a.Currency, a.[Status] st, a.OpenDate
from Customer c, Account a
where c.Cust_Id = a.Cust_Id
and c.Resident = 'N' and a.Account like '2650%'
UNION
select c.CustomerLogin, c.NameUser, c.Resident , c.Country, c.Gender, a.Account, a.Currency, a.[Status] st, a.OpenDate
from Customer c, Account a
where c.Cust_Id = a.Cust_Id
and c.Resident = 'N' and a.Currency = '980'
ORDER BY a.OpenDate desc
go

select *
from Customer
go

select *
from Account
go



-- 10. Выбрать тех клиентов, у которых была сумма ЗП но без бонусов и при этом 
--  они ниразу не были оштрафованы, и статус клиента Открыт.

select *
from Customer c
left join Salary s
on c.Cust_Id = s.Cust_Id
left join Penalty p
on s.Cust_Id = p.CustomerId
where s.Amount is not null and s.Bonus is null 
      and p.AmountPenalty is null
      and c.Status = 'O' 
go


/*
    11. Задача про "Алкоголика".
Найти платежи, назначение платежа которых имеет фрагмент слова "алког".
В этих платежах отобразить счет по дебету DebAcc.
Далее, найти в таблице счетов Account ссылку на клиента-владельца по отобранным счетам.
По идентификатору владельца счета в таблице  Account  вывести информацию с таблицы Customer поле NameUser.

*/

select NameUser
from Customer c
where c.Cust_Id in (select Cust_Id from Account where Account in 
				    (select DebAcc from Payment where TXT like '%алког%'))				
go
