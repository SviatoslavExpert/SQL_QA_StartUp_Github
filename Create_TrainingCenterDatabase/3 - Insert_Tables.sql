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
VALUES (100, 'SQ100', '������ SQL', '�������� � ���� ������ � SQL. ���� ��� ����������', 3045.50, 'A')

INSERT INTO Course (CourseId, Code, Title, [Description], Amount,[Status])
VALUES (200, 'NT200', '������ ������������ ����� (Networks)', '������� �������� ���������� ������������ �����. ���� �������� ��������� ������������ ������������ �����', 3999.89, 'A')

INSERT INTO Course (CourseId, Code, Title, [Description], Amount,[Status])
VALUES (300, 'UX300', '������ Unix', '������ ������ � ������������� ��������� Unix', 2500.79, 'D')

INSERT INTO Course (CourseId, Code, Title, [Description], Amount,[Status])
VALUES (400, 'TS400', '������������ ������������ ����������� (QA Testing)', '�������� �������� ������������ ������������ ����������� �� ���������, ����������� ������������ � �������� ������ � �������� ��������', 5501.99, 'D')

INSERT INTO Course (CourseId, Code, Title, [Description], Amount,[Status])
VALUES (401, 'TS401', '������������������ ������������ (Selenium + Python)', '������������� �������� ������������. �������� � ����������� �����������', 5000, 'D')

GO

-- CourseContent inserts

INSERT INTO CourseContent (CourseId, CourseContentId, ParentId, Code, ContentType, Title, [Description])
VALUES (100, 1, 1, '1', 'UN', '�������� � ��������� �����', '')

INSERT INTO CourseContent (CourseId, CourseContentId, ParentId, Code, ContentType, Title, [Description])
VALUES (100, 2, 1, 'A', 'CH', '�������� � �������������� ������� � ���� �� � ���', '')

INSERT INTO CourseContent (CourseId, CourseContentId, ParentId, Code, ContentType, Title, [Description])
VALUES (100, 3, 1, 'B', 'CH', '�������� � ������ ��. ���� ��', '')

INSERT INTO CourseContent (CourseId, CourseContentId, ParentId, Code, ContentType, Title, [Description])
VALUES (100, 4, 1, 'C', 'CH', '�������� ������� � �������. ������� ��. ����������� ���������', '')

INSERT INTO CourseContent (CourseId, CourseContentId, ParentId, Code, ContentType, Title, [Description])
VALUES (100, 5, 1, 'D', 'CH', 'Structured Query Language � �������� ������ ���������������� ��� ������', '')

INSERT INTO CourseContent (CourseId, CourseContentId, ParentId, Code, ContentType, Title, [Description])
VALUES (100, 6, 1, 'E', 'CH', '�������� � T-SQL. ���� ������', '')

INSERT INTO CourseContent (CourseId, CourseContentId, ParentId, Code, ContentType, Title, [Description])
VALUES (100, 7, 1, 'F', 'CH', '���������� �� ������ SQL Server Management Studio (SSMS)', '')

INSERT INTO CourseContent (CourseId, CourseContentId, ParentId, Code, ContentType, Title, [Description])
VALUES (100, 8, 1, 'G', 'CH', '���������� � ������� ����� ������ �����', '')

INSERT INTO CourseContent (CourseId, CourseContentId, ParentId, Code, ContentType, Title, [Description])
VALUES (100, 9, 9, '2', 'UN', '������� � ����������� ������', '')

INSERT INTO CourseContent (CourseId, CourseContentId, ParentId, Code, ContentType, Title, [Description])
VALUES (100, 10, 9, 'A', 'CH', 'Data Modification Language (DML) ��� ����� T-SQL', '')

INSERT INTO CourseContent (CourseId, CourseContentId, ParentId, Code, ContentType, Title, [Description])
VALUES (100, 11, 9, 'B', 'CH', '�������� ������� DML', '')

INSERT INTO CourseContent (CourseId, CourseContentId, ParentId, Code, ContentType, Title, [Description])
VALUES (100, 12, 11, 'I', 'CH', '����� ��������� ��������� ������� SELECT', '')

INSERT INTO CourseContent (CourseId, CourseContentId, ParentId, Code, ContentType, Title, [Description])
VALUES (100, 13, 11, 'II', 'CH', '�������� ������� �� ������� ������', '')

INSERT INTO CourseContent (CourseId, CourseContentId, ParentId, Code, ContentType, Title, [Description])
VALUES (100, 14, 11, 'III', 'CH', '����������� ������ � ������� ��������� UPDATE', '')

INSERT INTO CourseContent (CourseId, CourseContentId, ParentId, Code, ContentType, Title, [Description])
VALUES (100, 15, 11, 'IV', 'CH', '�������� � ���������� ����� ������ � ������� ���������� DELETE � INSERT', '')

GO

-- UserData inserts

INSERT INTO UserRole (UserRoleId, Code, Name, [Description])
VALUES (1, 'RES', 'Reserved', '')

INSERT INTO UserRole (UserRoleId, Code, Name, [Description])
VALUES (2, 'ADM', '�������������', '')

INSERT INTO UserRole (UserRoleId, Code, Name, [Description])
VALUES (3, 'INS', '�������������', '�������������/���������� ������')

INSERT INTO UserRole (UserRoleId, Code, Name, [Description])
VALUES (4, 'STD', '�������', '�������� ������')

GO

-- UserRole inserts

DECLARE @CurrentDate DATETIME
SELECT @CurrentDate = CURRENT_TIMESTAMP

INSERT INTO UserData (UserName, Password, FirstName, MiddleName, LastName, CreateDate, UpdateDate, [Status])
SELECT  'admin', '9fbf0de4', '�������', '�����������', '�������', '20131001 17:44', '20140102 14:05', 'A'
UNION ALL
SELECT  'smart', 'cb055ed7', '������', '������������', '����������', '20140101 17:44', '20140102 14:05', 'D'
UNION ALL
SELECT  'shaman', '4df20a20', '���������', '�����������', '�������', '20141212 12:12', '20141212 15:01', 'A'
UNION ALL
SELECT  'test', '', '����', NULL, '��������', @CurrentDate, @CurrentDate, 'A'
UNION ALL
SELECT  'isidor', 'c7a63824', '����', '��������', '��������', @CurrentDate, @CurrentDate, 'A'
UNION ALL
SELECT  'elza', '417e314d', '�����', '��������', '��������', @CurrentDate, @CurrentDate, 'D'
UNION ALL
SELECT  'vpupkin', '48ffb373', '�������', '����������', '������', @CurrentDate, @CurrentDate, 'A'
UNION ALL
SELECT  'akrasov', 'b151c83c', '����', '����������', '����������', @CurrentDate, @CurrentDate, 'D'
GO

-- UserRoleLink inserts

INSERT INTO UserRoleLink (UserDataId, UserRoleId)
SELECT (SELECT * FROM getUserId ('admin')), (select * from getRoleId ('ADM')) -- ������� ������� � ������� 2 ������� (getUserId � getRoleId).
UNION ALL
SELECT (SELECT * FROM getUserId ('shaman')), 2 -- ������� ������� � ������� 1 ������� (getUserId � ������������� ����).
UNION ALL
SELECT (SELECT * FROM getUserId ('test')), 2 -- ������� ������� � ������� 1 ������� (getUserId � ������������� ����).
UNION ALL
SELECT UserDataId, 3  
FROM UserData WHERE UserName IN ('smart', 'shaman') -- ������� ������� ��� �������, ������ �� �������, ��� ��� ��� ���������.
UNION ALL
SELECT UserDataId, 4  
FROM UserData WHERE UserName IN ('smart','shaman','test','isidor','elza','vpupkin','akrasov') -- ������� ������� ��� �������, ������ �� �������, ��� ��� ��� ���������.
GO

-- UserGroup inserts

INSERT INTO UserGroup (CourseId, Name, CreateDate, UpdateDate, [Status])
SELECT 100, '������ �1. ������ ��������� ���. ����� 09.12.2014', '20141209 12:05:34', '20141210 16:40:12', 'A'
UNION ALL
SELECT 100, '������ �2. ������ ������� ���. ����� 09.12.2014', '20141209 12:05:34', '20141210 16:40:12', 'A'
UNION ALL
SELECT 200, '������ �3. ������ ��������� ���. ����� 10.11.2015', '20151110 09:00:00', '20141210 09:00:00', 'D'
UNION ALL
SELECT 300, '������ �4. ������ ������� ���. ����� 11.12.2016', '20161211 09:30:44', '20141211 09:35:00', 'D'
GO

-- UserGroupLink inserts

INSERT INTO UserGroupLink (UserGroupId, UserDataId)
SELECT (SELECT UserGroupId FROM UserGroup WHERE Name = '������ �1. ������ ��������� ���. ����� 09.12.2014'), UserDataId
  FROM UserData 
  WHERE UserName in ('admin','smart','shaman','test','isidor')
UNION ALL
SELECT (SELECT UserGroupId FROM UserGroup WHERE Name = '������ �2. ������ ������� ���. ����� 09.12.2014'), UserDataId
  FROM UserData 
  WHERE UserName in ('shaman','test','isidor')
UNION ALL
SELECT (SELECT UserGroupId FROM UserGroup WHERE Name = '������ �3. ������ ��������� ���. ����� 10.11.2015'), UserDataId
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