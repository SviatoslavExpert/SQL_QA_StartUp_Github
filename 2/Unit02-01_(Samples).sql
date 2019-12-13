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

-- Аналог запроса выше, только через логические операторы
SELECT * FROM Course WHERE Amount >= 2500.79 AND Amount <=4000

SELECT * FROM Course WHERE Amount NOT BETWEEN 2500.79 AND 4000

SELECT * FROM Course WHERE NOT (Amount >= 2500.79 AND Amount <=4000)

--Работает и с текстовыми значениями
SELECT * FROM Course WHERE [Status] NOT BETWEEN 'A' and 'C'



----------
-- LIKE --
----------


-- %, _, []
SELECT * FROM Course
SELECT * FROM Course WHERE Title LIKE 'Основы%'
SELECT * FROM Course WHERE Title LIKE 'Основы____'
SELECT * FROM Course WHERE Title LIKE '[О,Т]%'
SELECT * FROM Course WHERE Title LIKE '[А-О]%'

-- Case Sensitivity vs Case Insensitivity (CS, CI) чувствительность к регистру
SELECT * FROM Course WHERE Title LIKE '%s%' COLLATE Cyrillic_General_CI_AS
SELECT * FROM Course WHERE Title LIKE '%S%' COLLATE Cyrillic_General_CS_AS


-- ESCAPE

--Найти строку, которая начинается на Отчество , а следующий символ % (который является не маской в данном случа).
SELECT * FROM Customer c WHERE c.MiddleName LIKE 'Отчество~%%' ESCAPE '~'

--Найти все строк, в которых символ % (который является не маской в данном случа), находится в любой позиции текста данной ячейки.
SELECT * FROM Customer c WHERE c.Name LIKE 'Имя~%%' ESCAPE '~'


-- EXISTS


SELECT * FROM Course
SELECT * FROM UserGroup

-- EXISTS | NOT EXISTS
/*Выведется информация только с таблицы Course, в которой существуют такие же идентификаторы которые передаются с вложенного запроса.
Особенностью данного варианта есть наличие связи внутреннего и внешнего запроса ug.CourseId = c.CourseId. Именно эт связь позволяет искать совпадающие значения.
При этом после WHERE внешнего запроса уже не нужно указывать поле, в котром необходимо искать то, что вернет вложенный запрос.
А во вложенном запросе после SELECT  не нужно указывать колонку, которая будет искаться во внешнем запросе.
Такой запрос работает быстрее чем если искать через оператор IN.
*/
SELECT *
FROM   Course c
WHERE  EXISTS (SELECT *
               FROM   UserGroup ug
               --WHERE  ug.CourseId = c.CourseId
               -- AND ug.CourseId = 100
                )

--Аналогичный пример линейной связи табилиц, при этом будет видна информация с обеих таблиц.
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
--Нельзя писать MiddleName = IS NULL или MiddleName = NULL. NULL это отдельный тип данных, который работает или как  IS NULL или IS NOT NULL.
SELECT *
FROM  UserData d
WHERE d.MiddleName IS NULL


-- IS NOT NULL
SELECT *
FROM  UserData d
WHERE d.MiddleName IS NOT NULL
