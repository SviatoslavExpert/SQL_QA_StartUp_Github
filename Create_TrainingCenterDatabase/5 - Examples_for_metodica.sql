USE TrainingCenter
GO


IF NOT OBJECT_ID('Phone') IS NULL DROP TABLE Phone
GO

IF NOT OBJECT_ID('Adress') IS NULL DROP TABLE Adress
GO

IF NOT OBJECT_ID('Client') IS NULL DROP TABLE Client
GO

IF NOT OBJECT_ID('CountryEx') IS NULL DROP TABLE CountryEx
GO


CREATE TABLE Client (
	ClientId INT IDENTITY(1,1),
	ClientName VARCHAR(150) NOT NULL,
	Country CHAR(3) NOT NULL
CONSTRAINT PK_ID PRIMARY KEY (ClientId)
)
GO

CREATE TABLE Phone (
	ClientId INT NOT NULL,
	PhoneNumber VARCHAR(150) NOT NULL
CONSTRAINT FK_PhoneId FOREIGN KEY (ClientId) REFERENCES Client (ClientId),
CONSTRAINT UQ_PhoneId UNIQUE (ClientId)
)
GO

CREATE TABLE Adress (
	ClientId INT NOT NULL,
	Adress VARCHAR(150) NOT NULL
--CONSTRAINT FK_AdressId FOREIGN KEY (ClientId) REFERENCES Client (ClientId),
CONSTRAINT UQ_AdressId UNIQUE (ClientId)
)
GO

CREATE TABLE [CountryEx] (
	[A3] CHAR(3) NOT NULL,
	[K040] CHAR(3) NOT NULL,
	[TXT] CHAR(35) NOT NULL
	CONSTRAINT PK_CountryEx PRIMARY KEY ([K040]) 
)
GO

ALTER TABLE Client
ADD CONSTRAINT FK_Client_Country FOREIGN KEY ([Country]) REFERENCES CountryEx ([K040])
GO

--��������� ������� �����
insert into CountryEx (a3, K040, TXT)
 Values     ('AUT', '040', '�����i�');
insert into CountryEx (a3, K040, TXT)
 Values     ('BEL', '056', '�����i�');
insert into CountryEx (a3, K040, TXT)
 Values     ('GRC', '300', '����i�');
insert into CountryEx (a3, K040, TXT)
 Values     ('ISR', '376', 'I�����');
insert into CountryEx (a3, K040, TXT)
 Values     ('CMR', '120', '�������');
insert into CountryEx (a3, K040, TXT)
 Values     ('RUS', '643', '���i����� �������i�');
insert into CountryEx (a3, K040, TXT)
 Values     ('ROU', '642', '�����i�');
insert into CountryEx (a3, K040, TXT)
 Values     ('UKR', '804', '������');
GO


INSERT INTO Client
VALUES ('��� �������','804'),
('�� "���� �������"','804'),
('���������� ����� ��������','642'),
('SP "Limited"','300'),
('������ ������� ��������','376'),
('������� ���� ��������','643')
GO

INSERT INTO Phone (ClientId, PhoneNumber)
VALUES (1, +380931112233),
(3, +380977778899),
(4, +380665554433)
GO

INSERT INTO Adress (ClientId, Adress)
SELECT 1, '����, ��������� 6�'
UNION ALL
SELECT 2, '�������, ������������ 1'
UNION ALL
SELECT 3, '����, �������� ������ 65'
UNION ALL
SELECT 9, '��������������, �������� ������� 5'
UNION ALL
SELECT 10, '�������, �������� 12'


SELECT *--TrainingCenter.DBO.Client.ClientName, TrainingCenter.DBO.Client.Country 
FROM Client 
GO
SELECT * FROM Phone
GO
SELECT * 
FROM Adress
GO

-------------------------------------------------
--������� ����������� ���������� INNER JOIN
SELECT *
FROM Client c 
INNER JOIN Adress a ON c.ClientId = a.ClientId
INNER JOIN Phone p ON c.ClientId = p.ClientId

GO

--������ ����������� ���������� ��� ������������� INNER JOIN
SELECT *
FROM Client c, Phone p, Adress a
WHERE c.ClientId = p.ClientId
AND c.ClientId = a.ClientId
GO



-------------------------------------------------
--������� ���������� LEFT JOIN
SELECT *
FROM Client c 
LEFT JOIN Phone p ON c.ClientId = p.ClientId
LEFT JOIN Adress a ON c.ClientId = a.ClientId
GO

--������� ���������� LEFT JOIN, ������� ������� Phone � Adress �������
SELECT *
FROM Client c 
LEFT JOIN Adress a ON c.ClientId = a.ClientId
LEFT JOIN Phone p ON c.ClientId = p.ClientId
GO

-------------------------------------------------
--������� ���������� RIGHT JOIN
SELECT *
FROM Client c 
RIGHT JOIN Phone p ON c.ClientId = p.ClientId
RIGHT JOIN Adress a ON c.ClientId = a.ClientId
GO


--������� ���������� RIGHT JOIN, ������� ������� Phone � Adress �������
SELECT *
FROM Client c 
RIGHT JOIN Adress a ON c.ClientId = a.ClientId
RIGHT JOIN Phone p ON c.ClientId = p.ClientId
GO

-------------------------------------------------
--������� ���������� FULL JOIN
SELECT *
FROM Client c 
FULL JOIN Adress a ON c.ClientId = a.ClientId
FULL JOIN Phone p ON c.ClientId = p.ClientId
GO
-------------------------------------------------


select ClientId
from Adress
go
