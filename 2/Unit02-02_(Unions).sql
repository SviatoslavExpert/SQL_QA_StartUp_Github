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

-- UNION
SELECT * FROM TableA
UNION
SELECT * FROM TableB

-- UNION ALL
SELECT * FROM TableA
UNION ALL
SELECT * FROM TableB

-- EXCEPT
SELECT * FROM TableA
EXCEPT
SELECT * FROM TableB

-- INTERSECT
SELECT * FROM TableA
INTERSECT
SELECT * FROM TableB

