-----------------------
-- Целые типы данных --
-----------------------

-- BIT [0..1]

DECLARE @Bit BIT = 0
PRINT @Bit

SET @Bit = 1
PRINT @Bit

SET @Bit = -1
PRINT @Bit

-- TINYINT [0..255]

DECLARE @TinyInt TINYINT = 0
PRINT @TinyInt

SET @TinyInt = 50
PRINT @TinyInt

SET @TinyInt = 256 -- Overflow
PRINT @TinyInt

-- SMALLINT [-32768..32767]

DECLARE @SmallInt SMALLINT = 32767
PRINT @SmallInt

SET @SmallInt = -32768
PRINT @SmallInt

SET @SmallInt = -32769 -- Overflow
PRINT @SmallInt

 -- INT [-2147483648..2147483647]
 
DECLARE @Int INT = 10
PRINT @Int

SET @Int = -10
PRINT @Int

-- BIGINT [-(2^63)..2^63-1]

DECLARE @BigInt BIGINT = 9223372036854775807
PRINT @BigInt

SET @BigInt = -9223372036854775808
PRINT @BigInt

------------------------------
-- Вещественные типы данных --
------------------------------

-- FLOAT(n) [-1.79Е+308..1.79Е+308]

DECLARE @Float FLOAT(24) = 1214782.123
PRINT @Float
							
SET @Float = 2147482435234412412.4321523598746737654
PRINT @Float

-- DECIMAL [-10^38+1..10^38-1] (NUMERIC)

DECLARE @Decimal DECIMAL(5, 3)

SET @Decimal = 1.23
PRINT @Decimal
 
SET @Decimal = 1.1236
PRINT @Decimal

-- SMALLMONEY [-214748.3648..214748.3647]

DECLARE @SmallMoney SMALLMONEY = 123.4567
PRINT @SmallMoney

SET @SmallMoney = -123.4567
PRINT @SmallMoney

-- MONEY [-2^63..2^63-1]

DECLARE @Money MONEY = 1.23456
PRINT @Money

---------------------------------------
-- Строковые (текстовые) типы данных --
---------------------------------------

-- CHAR [1..8000]

DECLARE @Char CHAR(5)= 'abcde'
PRINT @Char

SET @Char = 'abcdefg'
PRINT @Char

-- VARCHAR [..2^31]

DECLARE @VarChar VARCHAR(10) = 'abcdef'
PRINT @VarChar

-- NCHAR [1..4000]

DECLARE @NChar NCHAR(7) = 'abcdef'
PRINT @NChar

SET @NChar = '1234 abcdef'
PRINT @NChar

-- NVARCHAR [1..2^31]

DECLARE @NVarChar NVARCHAR(max) = 'Hello'
PRINT @NVarChar

--------------------------------
-- Типы данных даты и времени --
--------------------------------

-- DATETIME [01.01.1753 .. 31.12.9999]

-- CAST (expression AS data_type) - это функция преобразования типов,
-- преобразует значение expression к типу data_type.

DECLARE @DateTime DATETIME = CAST('2014-12-31 12:35:29.123' AS DATETIME)
PRINT @DateTime

SET @DateTime = CURRENT_TIMESTAMP -- Текущая дата и время
PRINT @DateTime

-- DATETIME2 [01.01.0001 .. 31.12.9999]

-- Типы данных даты и времени записывается как DateTime2(n), 
-- где n - определяет точность до 100нс ( 0<n<7 )

DECLARE @DateTime2 DATETIME2(5) = CAST('2014-12-31 12:35:29.1234567' AS DATETIME2)
PRINT @DateTime2

SET @DateTime2 = CURRENT_TIMESTAMP -- Текущая дата и время
PRINT @DateTime2


-- SMALLDATETIME [01.01.1900 .. 06.06.2079]

DECLARE @SmallDateTime SMALLDATETIME = CAST('2014-12-31 12:35:29' AS SMALLDATETIME)
PRINT @SmallDateTime

SET @SmallDateTime = CURRENT_TIMESTAMP -- Текущая дата и время
PRINT @SmallDateTime

-- DATETIMEOFFSET [01.01.0001 .. 31.12.9999]

DECLARE @DateTimeOffSet DATETIMEOFFSET(5) = CAST('2015-02-01 12:40:29.1234567 +12:15' AS DATETIMEOFFSET)
PRINT @DateTimeOffSet

SET @DateTimeOffSet = CURRENT_TIMESTAMP -- Текущая дата и время
PRINT @DateTimeOffSet

-- DATE [01.01.0001 .. 31.12.9999]

DECLARE @Date DATE = CAST('2014-12-31 12:35:29.1234567' AS DATE)
PRINT @Date

SET @Date = CURRENT_TIMESTAMP -- Текущая дата и время
PRINT @Date

-- TIME(n)

DECLARE @Time TIME(5) = CAST('2014-12-31 12:35:29.1234567' AS TIME)
PRINT @Time

SET @Time = CURRENT_TIMESTAMP
PRINT @Time


--------------------------
-- Типы двоичных данных --
--------------------------

-- BINARY(n) [1..8000 байт]

DECLARE @Binary BINARY(1) = 16
PRINT @Binary

-- VARBINARY(n/max) [1..2^31 байт]

DECLARE @VarBinary VARBINARY(max) = 2147483647
PRINT @VarBinary
