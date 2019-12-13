USE TrainingCenter

-------------------
-- Sample tables --
-------------------

IF OBJECT_ID('TableA') IS NOT NULL DROP TABLE TableA
IF OBJECT_ID('TableB') IS NOT NULL DROP TABLE TableB

CREATE TABLE TableA (
    Id  INT
)

CREATE TABLE TableB (
    Id  INT
)

INSERT INTO TableA (Id) VALUES (1), (2), (3)
INSERT INTO TableB (Id) VALUES (2), (3), (4)

SELECT * FROM TableA
SELECT * FROM TableB


-- Cartesian product (декартово произведение)
SELECT ta.Id AS a_Id, tb.Id AS b_Id
FROM  TableA ta, TableB tb




-- CROSS JOIN
SELECT ta.Id AS a_Id, tb.Id AS b_Id
FROM  TableA ta CROSS JOIN TableB tb


-- Cartesian product + Equal predicate
SELECT ta.Id AS a_Id, tb.Id AS b_Id
FROM   TableA ta, TableB tb
WHERE  ta.Id = tb.Id


-- INNER JOIN | JOIN
SELECT ta.Id AS a_Id, tb.Id AS b_Id
FROM   TableA ta
       INNER JOIN TableB tb ON ta.Id = tb.Id


-- LEFT JOIN | LEFT JOIN
SELECT ta.Id AS a_Id, tb.Id AS b_Id
FROM   TableA ta LEFT JOIN TableB tb ON ta.Id = tb.Id

SELECT tb.Id AS a_Id, ta.Id AS b_Id
FROM   TableB tb
       LEFT JOIN TableA ta ON ta.Id = tb.Id


-- RIGHT JOIN | RIGHT JOIN
SELECT ta.Id AS a_Id, tb.Id AS b_Id
FROM   TableA ta
       RIGHT JOIN TableB tb ON ta.Id = tb.Id

SELECT tb.Id AS b_Id, ta.Id AS a_Id
FROM   TableB tb
       RIGHT JOIN TableA ta ON ta.Id = tb.Id


-- FULL JOIN | FULL JOIN
SELECT ta.Id AS a_Id, tb.Id AS b_Id
FROM   TableA ta
       FULL JOIN TableB tb ON ta.Id = tb.Id

SELECT tb.Id AS a_Id, ta.Id AS b_Id
FROM   TableB tb
       FULL JOIN TableA ta ON ta.Id = tb.Id




---------------------------
-- TrainingCenter tables --
---------------------------

-- Cartesian product

SELECT * FROM Course
SELECT * FROM UserGroup

SELECT c.CourseId, c.Title,
       ug.UserGroupId, ug.CourseId, ug.Name
FROM   Course c, UserGroup ug


-- CROSS JOIN
SELECT c.CourseId, c.Title,
       ug.UserGroupId, ug.CourseId, ug.Name
FROM   Course c CROSS JOIN UserGroup ug


-- Cartesian product + Equal predicate
SELECT c.CourseId, c.Title,
       ug.UserGroupId, ug.CourseId, ug.Name
FROM   Course c, UserGroup ug
WHERE  c.CourseId = ug.CourseId


-- INNER JOIN | JOIN
SELECT  c.CourseId, c.Title,
        ug.UserGroupId, ug.CourseId, ug.Name
FROM    Course c
        INNER JOIN UserGroup ug ON c.CourseId = ug.CourseId


-- LEFT OUTER JOIN | LEFT JOIN
SELECT  c.CourseId, c.Title,
        ug.UserGroupId, ug.CourseId, ug.Name
FROM    UserGroup ug
        LEFT OUTER JOIN Course c ON ug.CourseId = c.CourseId

SELECT  c.CourseId, c.Title,
        ug.UserGroupId, ug.CourseId, ug.Name
FROM    Course c
        LEFT OUTER JOIN UserGroup ug ON c.CourseId = ug.CourseId


-- RIGHT OUTER JOIN | RIGHT JOIN
SELECT  c.CourseId, c.Title,
        ug.UserGroupId, ug.CourseId, ug.Name
FROM    Course c
        RIGHT OUTER JOIN UserGroup ug ON c.CourseId = ug.CourseId

SELECT  c.CourseId, c.Title,
        ug.UserGroupId, ug.CourseId, ug.Name
FROM    UserGroup ug
        RIGHT OUTER JOIN Course c ON ug.CourseId = c.CourseId


-- FULL OUTER JOIN | FULL JOIN
SELECT  c.CourseId, c.Title,
        ug.UserGroupId, ug.CourseId, ug.Name
FROM    Course c 
        FULL JOIN UserGroup ug ON ug.CourseId = c.CourseId

SELECT  c.CourseId, c.Title,
        ug.UserGroupId, ug.CourseId, ug.Name
FROM    UserGroup ug
        FULL JOIN Course c ON ug.CourseId = c.CourseId
        
