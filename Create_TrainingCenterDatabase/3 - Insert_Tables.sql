USE TrainingCenter
GO

--SET NOCOUNT ON

DELETE FROM UserGroupLink
GO

DELETE FROM UserRoleLink
GO

DELETE FROM UserData
GO

DELETE FROM UserGroup
GO

DELETE FROM UserRole
GO

DELETE FROM CourseContent
GO

DELETE FROM Course
GO

-- Course inserts

INSERT INTO Course (CourseId, Code, Title, [Description], Amount, [Status])
VALUES (100, 'SQ100', 'Основы SQL', 'Введение в базы данных и SQL. Курс для начинающих', 3045.50, 'A')

INSERT INTO Course (CourseId, Code, Title, [Description], Amount,[Status])
VALUES (200, 'NT200', 'Основы компьютерных сетей (Networks)', 'Базовые принципы построения компьютерных сетей. Курс расширен изучением тестирования компьютерных сетей', 3999.89, 'A')

INSERT INTO Course (CourseId, Code, Title, [Description], Amount,[Status])
VALUES (300, 'UX300', 'Основы Unix', 'Основы работы с операционными системами Unix', 2500.79, 'D')

INSERT INTO Course (CourseId, Code, Title, [Description], Amount,[Status])
VALUES (400, 'TS400', 'Тестирование программного обеспечения (QA Testing)', 'Изучение процесса тестирования программного обеспечения по программе, максимально приближенной к условиям работы в реальных проектах', 5501.99, 'D')

INSERT INTO Course (CourseId, Code, Title, [Description], Amount,[Status])
VALUES (401, 'TS401', 'Автоматизированное тестирование (Selenium + Python)', 'Автоматизация процесса тестирования. Принципы и современные инструменты', 5000, 'D')

GO

-- CourseContent inserts

INSERT INTO CourseContent (CourseId, CourseContentId, ParentId, Code, ContentType, Title, [Description])
VALUES (100, 1, 1, '1', 'UN', 'Введение в программу курса', '')

INSERT INTO CourseContent (CourseId, CourseContentId, ParentId, Code, ContentType, Title, [Description])
VALUES (100, 2, 1, 'A', 'CH', 'Введение в информационные системы и роль БД в них', '')

INSERT INTO CourseContent (CourseId, CourseContentId, ParentId, Code, ContentType, Title, [Description])
VALUES (100, 3, 1, 'B', 'CH', 'Введение в теорию БД. Виды БД', '')

INSERT INTO CourseContent (CourseId, CourseContentId, ParentId, Code, ContentType, Title, [Description])
VALUES (100, 4, 1, 'C', 'CH', 'Основные понятия и термины. Объекты БД. Определение отношения', '')

INSERT INTO CourseContent (CourseId, CourseContentId, ParentId, Code, ContentType, Title, [Description])
VALUES (100, 5, 1, 'D', 'CH', 'Structured Query Language – стандарт языков программирования баз данных', '')

INSERT INTO CourseContent (CourseId, CourseContentId, ParentId, Code, ContentType, Title, [Description])
VALUES (100, 6, 1, 'E', 'CH', 'Введение в T-SQL. Типы данных', '')

INSERT INTO CourseContent (CourseId, CourseContentId, ParentId, Code, ContentType, Title, [Description])
VALUES (100, 7, 1, 'F', 'CH', 'Знакомство со средой SQL Server Management Studio (SSMS)', '')

INSERT INTO CourseContent (CourseId, CourseContentId, ParentId, Code, ContentType, Title, [Description])
VALUES (100, 8, 1, 'G', 'CH', 'Знакомство с учебной базой данных курса', '')

INSERT INTO CourseContent (CourseId, CourseContentId, ParentId, Code, ContentType, Title, [Description])
VALUES (100, 9, 9, '2', 'UN', 'Выборка и модификация данных', '')

INSERT INTO CourseContent (CourseId, CourseContentId, ParentId, Code, ContentType, Title, [Description])
VALUES (100, 10, 9, 'A', 'CH', 'Data Modification Language (DML) как часть T-SQL', '')

INSERT INTO CourseContent (CourseId, CourseContentId, ParentId, Code, ContentType, Title, [Description])
VALUES (100, 11, 9, 'B', 'CH', 'Основные команды DML', '')

INSERT INTO CourseContent (CourseId, CourseContentId, ParentId, Code, ContentType, Title, [Description])
VALUES (100, 12, 11, 'I', 'CH', 'Общая структура оператора выборки SELECT', '')

INSERT INTO CourseContent (CourseId, CourseContentId, ParentId, Code, ContentType, Title, [Description])
VALUES (100, 13, 11, 'II', 'CH', 'Создание запроса на выборку данных', '')

INSERT INTO CourseContent (CourseId, CourseContentId, ParentId, Code, ContentType, Title, [Description])
VALUES (100, 14, 11, 'III', 'CH', 'Модификация данных с помощью оператора UPDATE', '')

INSERT INTO CourseContent (CourseId, CourseContentId, ParentId, Code, ContentType, Title, [Description])
VALUES (100, 15, 11, 'IV', 'CH', 'Удаление и добавление новых данных с помощью операторов DELETE и INSERT', '')

GO

-- UserData inserts

INSERT INTO UserRole (UserRoleId, Code, Name, [Description])
VALUES (1, 'RES', 'Reserved', '')

INSERT INTO UserRole (UserRoleId, Code, Name, [Description])
VALUES (2, 'ADM', 'Администратор', '')

INSERT INTO UserRole (UserRoleId, Code, Name, [Description])
VALUES (3, 'INS', 'Преподаватель', 'Преподаватель/инструктор курсов')

INSERT INTO UserRole (UserRoleId, Code, Name, [Description])
VALUES (4, 'STD', 'Студент', 'Учащийся курсов')

GO

-- UserRole inserts

DECLARE @CurrentDate DATETIME
SELECT @CurrentDate = CURRENT_TIMESTAMP

INSERT INTO UserData (UserName, Password, FirstName, MiddleName, LastName, CreateDate, UpdateDate, [Status])
SELECT  'admin', '9fbf0de4', 'Николай', 'Григорьевич', 'Админин', '20131001 17:44', '20140102 14:05', 'A'
UNION ALL
SELECT  'smart', 'cb055ed7', 'Сергей', 'Владимирович', 'Мартыненко', '20140101 17:44', '20140102 14:05', 'D'
UNION ALL
SELECT  'shaman', '4df20a20', 'Александр', 'Анатольевич', 'Шаменко', '20141212 12:12', '20141212 15:01', 'A'
UNION ALL
SELECT  'test', '', 'Тест', NULL, 'Тестовый', @CurrentDate, @CurrentDate, 'A'
UNION ALL
SELECT  'isidor', 'c7a63824', 'Иван', 'Петрович', 'Сидорчук', @CurrentDate, @CurrentDate, 'A'
UNION ALL
SELECT  'elza', '417e314d', 'Елена', 'Павловна', 'Захарчук', @CurrentDate, @CurrentDate, 'D'
UNION ALL
SELECT  'vpupkin', '48ffb373', 'Василий', 'Васильевич', 'Пупкин', @CurrentDate, @CurrentDate, 'A'
UNION ALL
SELECT  'akrasov', 'b151c83c', 'Анна', 'Леонидовна', 'Красовская', @CurrentDate, @CurrentDate, 'D'
GO

-- UserRoleLink inserts

INSERT INTO UserRoleLink (UserDataId, UserRoleId)
SELECT (SELECT * FROM getUserId ('admin')), (select * from getRoleId ('ADM')) -- Вариант вставки с помощью 2 функций (getUserId и getRoleId).
UNION ALL
SELECT (SELECT * FROM getUserId ('shaman')), 2 -- Вариант вставки с помощью 1 функции (getUserId и идентификатор роли).
UNION ALL
SELECT (SELECT * FROM getUserId ('test')), 2 -- Вариант вставки с помощью 1 функции (getUserId и идентификатор роли).
UNION ALL
SELECT UserDataId, 3  
FROM UserData WHERE UserName IN ('smart', 'shaman') -- Вариант вставки без функций, только по логинам, так как они уникальны.
UNION ALL
SELECT UserDataId, 4  
FROM UserData WHERE UserName IN ('smart','shaman','test','isidor','elza','vpupkin','akrasov') -- Вариант вставки без функций, только по логинам, так как они уникальны.
GO

-- UserGroup inserts

INSERT INTO UserGroup (CourseId, Name, CreateDate, UpdateDate, [Status])
SELECT 100, 'Группа №1. Группа выходного дня. Старт 09.12.2014', '20141209 12:05:34', '20141210 16:40:12', 'A'
UNION ALL
SELECT 100, 'Группа №2. Группа буднего дня. Старт 09.12.2014', '20141209 12:05:34', '20141210 16:40:12', 'A'
UNION ALL
SELECT 200, 'Группа №3. Группа выходного дня. Старт 10.11.2015', '20151110 09:00:00', '20141210 09:00:00', 'D'
UNION ALL
SELECT 300, 'Группа №4. Группа буднего дня. Старт 11.12.2016', '20161211 09:30:44', '20141211 09:35:00', 'D'
GO

-- UserGroupLink inserts

INSERT INTO UserGroupLink (UserGroupId, UserDataId)
SELECT (SELECT UserGroupId FROM UserGroup WHERE Name = 'Группа №1. Группа выходного дня. Старт 09.12.2014'), UserDataId
  FROM UserData 
  WHERE UserName in ('admin','smart','shaman','test','isidor')
UNION ALL
SELECT (SELECT UserGroupId FROM UserGroup WHERE Name = 'Группа №2. Группа буднего дня. Старт 09.12.2014'), UserDataId
  FROM UserData 
  WHERE UserName in ('shaman','test','isidor')
UNION ALL
SELECT (SELECT UserGroupId FROM UserGroup WHERE Name = 'Группа №3. Группа выходного дня. Старт 10.11.2015'), UserDataId
  FROM UserData 
  WHERE UserName in ('shaman','test','isidor','elza','vpupkin','akrasov')
GO

---------------------------------------------------------------------------------------
SELECT * FROM Course
SELECT * FROM CourseContent
SELECT * FROM UserRole
SELECT * FROM UserRoleLink
SELECT * FROM UserData
SELECT * FROM UserGroup
SELECT * FROM UserGroupLink