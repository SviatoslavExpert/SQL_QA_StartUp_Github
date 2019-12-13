select *
from Payment p
where p.Currency <> '980'
go


select *
from Customer c inner join Penalty p on c.Cust_id = p.Customerid
where c.CustomerLogin = 'Mazur'
and p.date = '2019-06-30'
go

select *
from Customer c, Penalty p
where c.Cust_id = p.Customerid
and c.CustomerLogin = 'Mazur'
and p.date = '2019-06-30'
go

select *
from Customer c left join Penalty p on c.Cust_id = p.Customerid
where id is null
go

select *
from Penalty p right join Customer c on c.Cust_id = p.Customerid
go

select *
from Penalty p full join Customer c on c.Cust_id = p.Customerid
go

select *
from Penalty p full join Customer c on c.Cust_id = p.Customerid
where c.CustomerLogin = 'Vypyvoha'
or c.CustomerLogin = 'Kononenko'
go

select *
from Penalty p full join Customer c on c.Cust_id = p.Customerid
where c.CustomerLogin = 'Vypyvoha'
or p.date > '2019-07-31'
go

select *
from Penalty p full join Customer c on c.Cust_id = p.Customerid
where c.CustomerLogin = 'Vypyvoha'
and p.Date not between '2019-06-30' and '2019-08-31'
go

select *
from Customer c
where c.Cust_id not in (select distinct p.Customerid from Penalty p)
and c.Country <> '804'
go

CREATE TABLE Salary (
    Id			INT IDENTITY(1,1),
    Cust_Id		INT					NOT NULL,
    [Date]		DATE				NOT NULL,
    Currency	CHAR (3)			NOT NULL,
    Amount		FLOAT				NOT NULL,
    Bonus		DECIMAL(10,2),
    CONSTRAINT PK_Salary_Id PRIMARY KEY (id),
    CONSTRAINT FK_Salary_UserDataId_Customer_Cust_Id FOREIGN KEY (Cust_Id) REFERENCES Customer (Cust_Id),
    CONSTRAINT FK_Salary_Currency_R030 FOREIGN KEY (Currency) REFERENCES Currency (R030),
	CONSTRAINT UQ_Salary_Cust_Id_Date UNIQUE (Cust_Id, [Date])
)
GO

INSERT INTO Salary
VALUES ((SELECT * FROM getCustomerId('Kononenko')), '2019-01-31', '980', 12500, 3500.65),
((SELECT * FROM getCustomerId('Kononenko')), '2019-02-28', '980', 11321.44, NULL),
((SELECT * FROM getCustomerId('Kononenko')), '2019-03-31', '980', 9800.45, NULL),
((SELECT * FROM getCustomerId('Kononenko')), '2019-04-30', '980', 9800.45, 3500.65),
((SELECT * FROM getCustomerId('Kononenko')), '2019-05-31', '980', 12101.20, 3500.65),
((SELECT * FROM getCustomerId('Kononenko')), '2019-06-30', '980', 3500.12, 3500.65),
((SELECT * FROM getCustomerId('Kononenko')), '2019-07-31', '980', 4654.11, 3500.656),
((SELECT * FROM getCustomerId('Kononenko')), '2019-08-31', '980', 9999.55, 3500.651),
((SELECT * FROM getCustomerId('Kononenko')), '2019-09-30', '980', 14123.32, 3500.65),
((SELECT * FROM getCustomerId('Kononenko')), '2019-10-31', '980', 12211.0205, 3500.65),
((SELECT * FROM getCustomerId('Kononenko')), '2019-11-30', '980', 12500, 3500.65),
((SELECT * FROM getCustomerId('Kononenko')), '2019-12-31', '980', 12500, 3500.65),

((SELECT * FROM getCustomerId('Stepanchuk')), '2019-01-31', '980', 12500, 3500.65),
((SELECT * FROM getCustomerId('Stepanchuk')), '2019-02-28', '980', 1321.44, 10200.45),
((SELECT * FROM getCustomerId('Stepanchuk')), '2019-03-31', '980', 9800.45, NULL),
((SELECT * FROM getCustomerId('Stepanchuk')), '2019-04-30', '980', 9800.45, NULL),
((SELECT * FROM getCustomerId('Stepanchuk')), '2019-05-31', '980', 520.20, 13500.11),
((SELECT * FROM getCustomerId('Stepanchuk')), '2019-06-30', '980', 3500.12, 3500.45),
((SELECT * FROM getCustomerId('Stepanchuk')), '2019-07-15', '980', 4654.11, NULL),
((SELECT * FROM getCustomerId('Stepanchuk')), '2019-07-31', '980', 4654.11, 3500.11),
((SELECT * FROM getCustomerId('Stepanchuk')), '2019-08-31', '980', 9999.55, 3500.01),
((SELECT * FROM getCustomerId('Stepanchuk')), '2019-09-30', '980', 1123.32, 13500.50),
((SELECT * FROM getCustomerId('Stepanchuk')), '2019-10-15', '980', 1200.005, 13500.6511),
((SELECT * FROM getCustomerId('Stepanchuk')), '2019-10-31', '980', 1200.005, 13500.6511),
((SELECT * FROM getCustomerId('Stepanchuk')), '2019-11-30', '980', 12500, 3500.65),
((SELECT * FROM getCustomerId('Stepanchuk')), '2019-12-31', '980', 12500, 3500.65),

((SELECT * FROM getCustomerId('Drozd')), '2019-01-01', '980', 112500, 13500.45),
((SELECT * FROM getCustomerId('Drozd')), '2019-01-31', '980', 2500, 3500.45),
((SELECT * FROM getCustomerId('Drozd')), '2019-02-28', '980', 1321.44, 10200.45),
((SELECT * FROM getCustomerId('Drozd')), '2019-03-31', '980', 19800.45, NULL),
((SELECT * FROM getCustomerId('Drozd')), '2019-04-30', '980', 800.45, 15000),
((SELECT * FROM getCustomerId('Drozd')), '2019-05-15', '980', 520.20, 13500.11),
((SELECT * FROM getCustomerId('Drozd')), '2019-05-31', '980', 520.20, 13500.11),
((SELECT * FROM getCustomerId('Drozd')), '2019-06-30', '980', 3500.12, 3500.45),
((SELECT * FROM getCustomerId('Drozd')), '2019-07-15', '980', 4654.11, NULL),
((SELECT * FROM getCustomerId('Drozd')), '2019-07-31', '980', 4654.11, 3500.11),
((SELECT * FROM getCustomerId('Drozd')), '2019-08-31', '980', 9999.55, 3500.01),
((SELECT * FROM getCustomerId('Drozd')), '2019-09-30', '980', 1123.32, 13500.50),
((SELECT * FROM getCustomerId('Drozd')), '2019-10-15', '980', 11200.44, 3500.00),
((SELECT * FROM getCustomerId('Drozd')), '2019-10-31', '980', 12100.4, 1500.123),
((SELECT * FROM getCustomerId('Drozd')), '2019-11-30', '980', 12500, 34500.65),
((SELECT * FROM getCustomerId('Drozd')), '2019-12-31', '980', 12500, 13500.65),

((SELECT * FROM getCustomerId('Ostapchuk')), '2019-01-31', '980', 12500, 3500.65),
((SELECT * FROM getCustomerId('Ostapchuk')), '2019-02-28', '980', 11321.44, NULL),
((SELECT * FROM getCustomerId('Ostapchuk')), '2019-03-31', '980', 9800.45, NULL),
((SELECT * FROM getCustomerId('Ostapchuk')), '2019-04-30', '980', 9800.45, 3500.65),
((SELECT * FROM getCustomerId('Ostapchuk')), '2019-05-31', '980', 12101.20, 3500.65),
((SELECT * FROM getCustomerId('Ostapchuk')), '2019-06-30', '980', 3500.12, 3500.65),
((SELECT * FROM getCustomerId('Ostapchuk')), '2019-07-31', '980', 4654.11, 3500.656),
((SELECT * FROM getCustomerId('Ostapchuk')), '2019-08-31', '980', 9999.55, 3500.651),
((SELECT * FROM getCustomerId('Ostapchuk')), '2019-09-30', '980', 14123.32, 3500.65),
((SELECT * FROM getCustomerId('Ostapchuk')), '2019-10-31', '980', 12211.0205, 3500.65),
((SELECT * FROM getCustomerId('Ostapchuk')), '2019-11-30', '980', 12500, 3500.65),
((SELECT * FROM getCustomerId('Ostapchuk')), '2019-12-31', '980', 12500, 3500.65),

((SELECT * FROM getCustomerId('Korch')), '2019-01-31', '980', 12500, 3500.65),
((SELECT * FROM getCustomerId('Korch')), '2019-02-28', '980', 11321.44, NULL),
((SELECT * FROM getCustomerId('Korch')), '2019-03-31', '980', 19800.45, NULL),
((SELECT * FROM getCustomerId('Korch')), '2019-04-30', '980', 800.45, 3500.65),
((SELECT * FROM getCustomerId('Korch')), '2019-05-31', '980', 12101.20, 3500.65),
((SELECT * FROM getCustomerId('Korch')), '2019-06-30', '980', 3500.12, 3500.65),
((SELECT * FROM getCustomerId('Korch')), '2019-07-31', '980', 4654.11, NULL),
((SELECT * FROM getCustomerId('Korch')), '2019-08-31', '980', 9999.55, 35100.1),
((SELECT * FROM getCustomerId('Korch')), '2019-09-30', '980', 1123.32, 13500.65),
((SELECT * FROM getCustomerId('Korch')), '2019-10-31', '980', 10.0205, 3500.65),
((SELECT * FROM getCustomerId('Korch')), '2019-11-30', '980', 500, 3500.65),
((SELECT * FROM getCustomerId('Korch')), '2019-12-31', '980', 12500, 100.65),

((SELECT * FROM getCustomerId('Mazur')), '2019-01-31', '980', 12500, 3500.65),
((SELECT * FROM getCustomerId('Mazur')), '2019-02-28', '980', 11321.44, NULL),
((SELECT * FROM getCustomerId('Mazur')), '2019-03-31', '980', 19800.45, 777),
((SELECT * FROM getCustomerId('Mazur')), '2019-04-30', '980', 1800.45, 3500.65),
((SELECT * FROM getCustomerId('Mazur')), '2019-05-31', '980', 12101.20, 3500.65),
((SELECT * FROM getCustomerId('Mazur')), '2019-06-30', '980', 3500.12, 3500.65),
((SELECT * FROM getCustomerId('Mazur')), '2019-07-15', '980', 14654.11, 14),
((SELECT * FROM getCustomerId('Mazur')), '2019-07-31', '980', 4654.11, NULL),
((SELECT * FROM getCustomerId('Mazur')), '2019-08-31', '980', 9999.55, 35100.1),
((SELECT * FROM getCustomerId('Mazur')), '2019-09-30', '980', 1123.32, 13500.65),
((SELECT * FROM getCustomerId('Mazur')), '2019-10-31', '980', 10.0205, 3500.65),
((SELECT * FROM getCustomerId('Mazur')), '2019-11-30', '980', 50500, 3500.65),
((SELECT * FROM getCustomerId('Mazur')), '2019-12-31', '980', 12500, 100.65),

((SELECT * FROM getCustomerId('Vypyvoha')), '2019-01-31', '980', 1500, 3500.75),
((SELECT * FROM getCustomerId('Vypyvoha')), '2019-02-28', '980', 11321.44, NULL),
((SELECT * FROM getCustomerId('Vypyvoha')), '2019-03-31', '980', 1800.75, 777),
((SELECT * FROM getCustomerId('Vypyvoha')), '2019-04-30', '980', 800.45, NULL),
((SELECT * FROM getCustomerId('Vypyvoha')), '2019-05-31', '980', 12101.20, NULL),
((SELECT * FROM getCustomerId('Vypyvoha')), '2019-06-30', '980', 3500.42, NULL),
((SELECT * FROM getCustomerId('Vypyvoha')), '2019-07-15', '980', 4654.11, 14),
((SELECT * FROM getCustomerId('Vypyvoha')), '2019-07-31', '980', 4654.11, NULL),
((SELECT * FROM getCustomerId('Vypyvoha')), '2019-08-31', '980', 4999.45, NULL),
((SELECT * FROM getCustomerId('Vypyvoha')), '2019-09-30', '980', 1123.37, NULL),
((SELECT * FROM getCustomerId('Vypyvoha')), '2019-10-31', '980', 10.0205, NULL),
((SELECT * FROM getCustomerId('Vypyvoha')), '2019-11-30', '980', 500, 3500.67),
((SELECT * FROM getCustomerId('Vypyvoha')), '2019-12-31', '980', 12500, 100.65),

((SELECT * FROM getCustomerId('Celsiy')), '2019-01-01', '980', 1500, 123500.75),
((SELECT * FROM getCustomerId('Celsiy')), '2019-01-31', '980', 81500, 3500.75),
((SELECT * FROM getCustomerId('Celsiy')), '2019-02-28', '980', 911321.44, NULL),
((SELECT * FROM getCustomerId('Celsiy')), '2019-03-31', '980', 11800.75, 777),
((SELECT * FROM getCustomerId('Celsiy')), '2019-04-15', '980', 800.45, 13455.11),
((SELECT * FROM getCustomerId('Celsiy')), '2019-04-30', '980', 800.45, NULL),
((SELECT * FROM getCustomerId('Celsiy')), '2019-05-31', '980', 12101.20, NULL),
((SELECT * FROM getCustomerId('Celsiy')), '2019-06-30', '980', 3500.42, 45110.01),
((SELECT * FROM getCustomerId('Celsiy')), '2019-07-15', '980', 45654.11, 14),
((SELECT * FROM getCustomerId('Celsiy')), '2019-07-31', '980', 4654.11, NULL),
((SELECT * FROM getCustomerId('Celsiy')), '2019-08-31', '980', 7999.45, NULL),
((SELECT * FROM getCustomerId('Celsiy')), '2019-09-30', '980', 1123.37, 64451.111),
((SELECT * FROM getCustomerId('Celsiy')), '2019-10-31', '980', 10.0205, NULL),
((SELECT * FROM getCustomerId('Celsiy')), '2019-11-30', '980', 44500, 3500.67),
((SELECT * FROM getCustomerId('Celsiy')), '2019-12-31', '980', 112500, 100.65)
go



select TOP 3 *
from Customer c left join Penalty p on c.Cust_id = p.Customerid
                left join Salary s on s.Cust_id = c.Cust_id
go

select *
from Customer c left join Penalty p on c.Cust_id = p.Customerid
                left join Salary s on s.Cust_id = c.Cust_id
order by c.CustomerLogin desc
go

select *
from Customer c left join Penalty p on c.Cust_id = p.Customerid
                left join Salary s on s.Cust_id = c.Cust_id
order by c.CustomerLogin desc, p.Date desc
go

select c.CustomerLogin, p.Date, isnull(p.AmountPenalty, 0), isnull(s.Amount, 0), isnull(s.Bonus, 0), 
                                isnull (s.Amount, 0) + isnull(s.Bonus * 2, 0) - isnull(p.AmountPenalty/100, 0) as sm
from Customer c left join Penalty p on c.Cust_id = p.Customerid
                left join Salary s on s.Cust_id = c.Cust_id
order by c.CustomerLogin desc, p.Date desc
go





