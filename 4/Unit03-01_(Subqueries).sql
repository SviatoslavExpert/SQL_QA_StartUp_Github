USE TrainingCenter

SELECT * FROM Course
SELECT * FROM UserGroup
SELECT * FROM Customer

-------------------------------
-- Subquery (SELECT section) --
-------------------------------

SELECT c.NameUser, 
	   c.Resident, 
	   c.Birthday, 
	   c.Gender,
	   c.Country,
	   (SELECT t.TXT
		FROM Country t
		WHERE t.K040 = c.Country
		AND t.K040 = '804') AS CountryName 
FROM Customer c


SELECT  ug.*,
        CASE [Status]
          WHEN 'A' THEN 'Активная'
          WHEN 'D' THEN 'Неактивная'
          ELSE 'Неизвестно'
        END AS [GroupStatus]
FROM    UserGroup ug


SELECT  ug.*,
        (SELECT CASE ug.Status
                  WHEN 'A' THEN 'Активная'
                  WHEN 'D' THEN 'Неактивная'
                END
         FROM   UserGroup ug2 WHERE ug.UserGroupId = ug2.UserGroupId
        ) AS [GroupStatus]
FROM    UserGroup ug


-----------------------------
-- Subquery (FROM section) --
-----------------------------

SELECT c.NameUser, 
	   c.Resident, 
	   c.Birthday, 
	   c.Gender,
	   c.Country,
	   (SELECT t.TXT
		FROM Country t
		WHERE t.K040 = c.Country) AS CountryName,
		ap.CredAcc,
		ap.Amount,
		ap.TXT
FROM Customer c, (SELECT a.Cust_Id, p.Amount, p.TXT, p.CredAcc
					FROM Account a, Payment p
				   WHERE a.Account = p.CredAcc
				     AND RIGHT(p.TXT,6) = 'обсязі') AS ap
WHERE c.Cust_Id = ap.Cust_Id


------------------------------
-- Subquery (WHERE section) --
------------------------------

SELECT  *
FROM    Course c
WHERE   c.CourseId IN (SELECT ug.CourseId FROM UserGroup ug)

SELECT  *
FROM    UserGroup ug
WHERE   ug.CourseId IN (SELECT c.CourseId FROM Course c WHERE c.Title LIKE '%s%')

SELECT c.NameUser, 
	   c.Resident, 
	   c.Birthday, 
	   c.Gender,
	   c.Country,
	   (SELECT t.TXT
		FROM Country t
		WHERE t.K040 = c.Country) AS CountryName
FROM Customer c
WHERE c.Cust_Id IN (SELECT a.Cust_Id
					FROM Account a, Payment p
				   WHERE a.Account = p.CredAcc
				     AND RIGHT(p.TXT,6) = 'обсязі')



