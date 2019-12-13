USE TrainingCenter
GO

IF NOT OBJECT_ID('UserGroupLink') IS NULL DROP TABLE UserGroupLink
GO

IF NOT OBJECT_ID('UserGroup') IS NULL DROP TABLE UserGroup
GO

IF NOT OBJECT_ID('UserRoleLink') IS NULL DROP TABLE UserRoleLink
GO

IF NOT OBJECT_ID('UserData') IS NULL DROP TABLE UserData
GO

IF NOT OBJECT_ID('UserRole') IS NULL DROP TABLE UserRole
GO

IF NOT OBJECT_ID('CourseContent') IS NULL DROP TABLE CourseContent
GO

IF NOT OBJECT_ID('Course') IS NULL DROP TABLE Course
GO

IF NOT OBJECT_ID('getUserId') IS NULL DROP FUNCTION getUserId
GO

IF NOT OBJECT_ID('getRoleId') IS NULL DROP FUNCTION getRoleId
GO

IF NOT OBJECT_ID('UpdSumCourse') IS NULL DROP PROCEDURE UpdSumCourse
GO

IF NOT OBJECT_ID('InsertUserData') IS NULL DROP PROCEDURE InsertUserData
GO


/*
    "Учебный курс"
*/

CREATE TABLE Course (
    CourseId      INT             NOT NULL,
    Code          VARCHAR(8)      NOT NULL,
    Title         NVARCHAR(100)   NOT NULL,
    [Description] NVARCHAR(4000),
    Amount        MONEY,
    [Status]      CHAR(1)         NOT NULL
    CONSTRAINT PK_Course_CourseId PRIMARY KEY (CourseId),
    CONSTRAINT UQ_Course_Code UNIQUE (Code),
    CONSTRAINT UQ_Course_Title UNIQUE (Title),
    CONSTRAINT CK_Course_Status CHECK (Status IN ('A', 'D', 'S')) -- A = Active, D = Disabled, S = Suspended
)
GO

/*
    "Программа курса" (содержание)
*/

CREATE TABLE CourseContent (
    CourseId          INT             NOT NULL,
    CourseContentId   INT             NOT NULL, -- IDENTITY(1, 1)
    ParentId          INT             NOT NULL,
    Code              VARCHAR(10),
    ContentType       CHAR(2),
    Title             NVARCHAR(100)   NOT NULL,
    [Description]     NVARCHAR(2000),
    CONSTRAINT PK_CourseContent_CourseId_CourseContentId PRIMARY KEY (CourseId, CourseContentId),
    CONSTRAINT FK_CourseContent_Course FOREIGN KEY (CourseId) REFERENCES Course (CourseId),
    CONSTRAINT FK_CourseContent_CourseId_ParentId FOREIGN KEY (CourseId, ParentId) REFERENCES CourseContent (CourseId, CourseContentId),
    CONSTRAINT CK_CourseContent_ContentType CHECK (ContentType IN ('UN', 'CH', 'EX', 'HW')) -- UN = Unit, CH = Chapter, EX = Exercise, HW = Homework
)
GO


/*
    "Пользователи" (участники учебного центра)
*/

CREATE TABLE UserData (
    UserDataId        INT IDENTITY(1, 1)  NOT NULL,
    UserName          SYSNAME             NOT NULL, --тип данных, ограниченный 128 символами Unicode и не может быть NULL = nvarchar(128) NOT NULL. Используется для хранения имен объектов.
    [Password]        NVARCHAR(255),
    FirstName         NVARCHAR(20)        NOT NULL,
    MiddleName        NVARCHAR(20),
    LastName          NVARCHAR(20)        NOT NULL,
    CreateDate        DATETIME   default CURRENT_TIMESTAMP         NOT NULL,
    UpdateDate        DATETIME   default CURRENT_TIMESTAMP         NOT NULL,
    [Status]          CHAR(1)             NOT NULL
    CONSTRAINT PK_UserData_UserDataId PRIMARY KEY (UserDataId),
    CONSTRAINT UQ_UserData_UserName UNIQUE (UserName),
    CONSTRAINT CK_UserData_Status CHECK ([Status] IN ('A', 'D')), -- A = Active, D = Disabled
    CONSTRAINT CK_UserData_LastName CHECK (LEN(LastName) > 1)
)
GO

/*
    "Роли пользователей"
*/

CREATE TABLE UserRole (
    UserRoleId      INT             NOT NULL,
    Code            VARCHAR(3)      NOT NULL,
    Name            NVARCHAR(20),
    [Description]   NVARCHAR(50)
    CONSTRAINT PK_UserRole_UserRoleId PRIMARY KEY (UserRoleId),
	CONSTRAINT UQ_UserRole_Code UNIQUE (Code),
	CONSTRAINT UQ_UserRole_Name UNIQUE (Name)
)
GO

/*
    Сопоставление "Пользователи - Роли" (развязочная таблица)
*/

CREATE TABLE UserRoleLink (
    UserDataId        INT NOT NULL,
    UserRoleId        INT NOT NULL
    CONSTRAINT PK_UserRoleLink_UserDataId_UserRoleId PRIMARY KEY (UserDataId, UserRoleId),
    CONSTRAINT FK_UserRoleLink_UserData FOREIGN KEY (UserDataId) REFERENCES UserData (UserDataId),
    CONSTRAINT FK_UserRoleLink_UserRole FOREIGN KEY (UserRoleId) REFERENCES UserRole (UserRoleId)
)
GO

/*
    "Группы пользователей"
*/

CREATE TABLE UserGroup (
    UserGroupId       INT IDENTITY(1, 1)  NOT NULL,
    CourseId          INT                 NOT NULL,
    Name              NVARCHAR(50)        NOT NULL,
    CreateDate        DATETIME            NOT NULL,
    UpdateDate        DATETIME            NOT NULL,
    [Status]          CHAR(1)             NOT NULL
    CONSTRAINT PK_UserGroup_UserGroupId PRIMARY KEY (UserGroupId),
    CONSTRAINT FK_UserGroup_Course FOREIGN KEY (CourseId) REFERENCES Course (CourseId),
    CONSTRAINT CK_UserGroup_Status CHECK ([Status] IN ('A', 'D', 'C')), -- A = Active, D = Disabled, C = Closed
	CONSTRAINT UQ_UserGroup_Name UNIQUE (Name)
)
GO

/*
    Сопоставление "Пользователи - Группы пользователей" (развязочная таблица)
*/

CREATE TABLE UserGroupLink (
    UserGroupId       INT NOT NULL,
    UserDataId        INT NOT NULL
    CONSTRAINT PK_UserGroupLink_UserGroupId_UserDataId PRIMARY KEY (UserGroupId, UserDataId),
    CONSTRAINT FK_UserGroupLink_UserGroup FOREIGN KEY (UserGroupId) REFERENCES UserGroup (UserGroupId),
    CONSTRAINT FK_UserGroupLink_UserData FOREIGN KEY (UserDataId) REFERENCES UserData (UserDataId)
)
GO



----------------------------------Функции и процедуры----------------------------------------

/*
Функция возвращает идентификатор пользователя по передаваемом в функцию значению @UserName
*/

CREATE FUNCTION getUserId (@UserName SYSNAME)
RETURNS TABLE
	AS RETURN (SELECT u.UserDataId
				FROM UserData u
				WHERE u.UserName = @UserName)
GO


/*
Функция возвращает идентификатор роли по передаваемом в функцию значению @Code
*/

CREATE FUNCTION dbo.getRoleId (@Code VARCHAR(3))
RETURNS TABLE
	AS RETURN (SELECT r.UserRoleId
				FROM UserRole r
				WHERE r.Code = @Code )
GO


/*
Процедура выполняет обновление суммы по коду курса
*/

CREATE PROCEDURE UpdSumCourse (@Code VARCHAR(8), @Amount money)
	AS UPDATE Course
	SET Amount = @Amount
	WHERE Code = @Code;
GO


CREATE PROCEDURE InsertUserData (@UserName SYSNAME, @Password NVARCHAR(255), @FirstName NVARCHAR(20), @MiddleName NVARCHAR(20), @LastName NVARCHAR(20), @CreateDate DATETIME, @UpdateDate DATETIME, @Status CHAR(1))
	AS INSERT INTO UserData 
	values (@UserName, @Password, @FirstName, @MiddleName, @LastName, @CreateDate, @UpdateDate, @Status)    
GO

--execute InsertUserData 'Tester', '43rrw', 'Test', 'Petrovich', 'qqqqqq', '2019-01-01', '2018-02-02', 'A'; 