-- AND, OR, NOT
SELECT * FROM Course

SELECT *
  FROM Course
 WHERE CourseId = 100 AND
       Code = 'UX300'

SELECT *
  FROM Course
 WHERE CourseId = 100 OR
       Code = 'UX300'

SELECT *
  FROM Course
 WHERE NOT CourseId = 100

-- =, <>, !=, >, >=, !>, <, <=, !<

SELECT * FROM Course

SELECT *
  FROM Course
 WHERE CourseId = 100

SELECT *
  FROM Course
 WHERE CourseId > 100 AND
       Amount <= 5000

-- BETWEEN
SELECT * FROM Course

SELECT * FROM Course WHERE Amount BETWEEN 2500.79 AND 4000

-- ������ ������� ����, ������ ����� ���������� ���������
SELECT * FROM Course WHERE Amount >= 2500.79 AND Amount <=4000

SELECT * FROM Course WHERE Amount NOT BETWEEN 2500.79 AND 4000

SELECT * FROM Course WHERE NOT (Amount >= 2500.79 AND Amount <=4000)

--�������� � � ���������� ����������
SELECT * FROM Course WHERE [Status] NOT BETWEEN 'A' and 'C'



----------
-- LIKE --
----------


-- %, _, []
SELECT * FROM Course
SELECT * FROM Course WHERE Title LIKE '������%'
SELECT * FROM Course WHERE Title LIKE '������____'
SELECT * FROM Course WHERE Title LIKE '[�,�]%'
SELECT * FROM Course WHERE Title LIKE '[�-�]%'

-- Case Sensitivity vs Case Insensitivity (CS, CI) ���������������� � ��������
SELECT * FROM Course WHERE Title LIKE '%s%' COLLATE Cyrillic_General_CI_AS
SELECT * FROM Course WHERE Title LIKE '%S%' COLLATE Cyrillic_General_CS_AS


-- ESCAPE

--����� ������, ������� ���������� �� �������� , � ��������� ������ % (������� �������� �� ������ � ������ �����).
SELECT * FROM Customer c WHERE c.MiddleName LIKE '��������~%%' ESCAPE '~'

--����� ��� �����, � ������� ������ % (������� �������� �� ������ � ������ �����), ��������� � ����� ������� ������ ������ ������.
SELECT * FROM Customer c WHERE c.Name LIKE '���~%%' ESCAPE '~'


-- EXISTS


SELECT * FROM Course
SELECT * FROM UserGroup

-- EXISTS | NOT EXISTS
/*��������� ���������� ������ � ������� Course, � ������� ���������� ����� �� �������������� ������� ���������� � ���������� �������.
������������ ������� �������� ���� ������� ����� ����������� � �������� ������� ug.CourseId = c.CourseId. ������ �� ����� ��������� ������ ����������� ��������.
��� ���� ����� WHERE �������� ������� ��� �� ����� ��������� ����, � ������ ���������� ������ ��, ��� ������ ��������� ������.
� �� ��������� ������� ����� SELECT  �� ����� ��������� �������, ������� ����� �������� �� ������� �������.
����� ������ �������� ������� ��� ���� ������ ����� �������� IN.
*/
SELECT *
FROM   Course c
WHERE  EXISTS (SELECT *
               FROM   UserGroup ug
               --WHERE  ug.CourseId = c.CourseId
               -- AND ug.CourseId = 100
                )

--����������� ������ �������� ����� �������, ��� ���� ����� ����� ���������� � ����� ������.
SELECT * FROM Course c, UserGroup ug
WHERE  c.CourseId = ug.CourseId

-- IN | NOT IN
SELECT * FROM Course WHERE [Status] IN ('D','A')

SELECT *
FROM   Course c
WHERE  c.CourseId IN (SELECT ug.CourseId
                      FROM   UserGroup ug
                      -- WHERE ug.CourseId = 100
                      )


-- IS  NULL
--������ ������ MiddleName = IS NULL ��� MiddleName = NULL. NULL ��� ��������� ��� ������, ������� �������� ��� ���  IS NULL ��� IS NOT NULL.
SELECT *
FROM  UserData d
WHERE d.MiddleName IS NULL


-- IS NOT NULL
SELECT *
FROM  UserData d
WHERE d.MiddleName IS NOT NULL
