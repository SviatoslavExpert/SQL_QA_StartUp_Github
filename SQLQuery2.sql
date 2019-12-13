Use master
GO

IF EXISTS (SELECT * 
           FROM master.. sysdatabases
		   WHERE name = 'TrainingCenter')
BEGIN
  DROP DATABASE TrainingCenter
  PRINT 'Database Training Center is dropped'
END
GO

CREATE DATABASE TrainingCenter ON (
  NAME = N'tc_data',
  FILENAME = N'C:\MSSQL\Data\tc_data.mdf',
  SIZE = 10,
  -- MAXSIZE = 100MB,
  FILEGROWTH = 10%)
LOG ON(
  NAME = N'tc_log',
  FILENAME = N'C:\MSSQL\Log\tc_log.ldf',
  SIZE = 20,
  -- MAXSIZE = 200MB,
  FILEGROWTH = 20%)
COLLATE Cyrillic_General_CI_AS
GO

PRINT 'Database Training Center is created'
GO


/*
    "Пользователи" (участники учебного центра)
*/

IF NOT OBJECT_ID('UserData') IS NULL DROP TABLE UserData
GO

CREATE TABLE UserD (
    UserDataId        INT IDENTITY(1, 1)  NOT NULL,
    UserName          SYSNAME             NOT NULL, --тип данных, ограниченный 128 символами Unicode и не может быть NULL = nvarchar(128) NOT NULL. Используется для хранения имен объектов.
    [Password]        NVARCHAR(255),
    FirstName         NVARCHAR(20)        NOT NULL,
    MiddleName        NVARCHAR(20),
    LastName          NVARCHAR(20)        NOT NULL,
    CreateDate        DATETIME   default CURRENT_TIMESTAMP         NOT NULL,
    UpdateDate        DATETIME   default CURRENT_TIMESTAMP         NOT NULL,
    [Status]          CHAR(1)             NOT NULL
    CONSTRAINT PK_UserData_UserD PRIMARY KEY (UserDataId),
    CONSTRAINT UQ_UserData_UserName UNIQUE (UserName),
    CONSTRAINT CK_UserData_Status CHECK ([Status] IN ('A', 'D')), -- A = Active, D = Disabled
    CONSTRAINT CK_UserData_LastName CHECK (LEN(LastName) > 1)
)
GO

SELECT *
  FROM UserD
GO

-- UserData inserts

DECLARE @CurrentDate DATETIME
SELECT @CurrentDate = CURRENT_TIMESTAMP

INSERT INTO UserD (UserName, Password, FirstName, MiddleName, LastName, CreateDate, UpdateDate, [Status])
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
GO



