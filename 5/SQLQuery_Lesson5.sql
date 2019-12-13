
--  Lesson # 5  12-12-19

select c.NameUser, count(*)
from Customer c, Account a
where c.Cust_Id = a.Cust_Id
group by c.NameUser
go

select Year(u.CreateDate)
from UserData u
go

select YEAR(u.CreateDate), MONTH(u.CreateDate), COUNT(*)
from UserData u
group by YEAR(u.CreateDate), MONTH(u.CreateDate)
go

select c.NameUser, MONTH(s.Date), SUM(isnull(s.Amount, 0) + isnull(s.Bonus, 0)) - SUM(cast(p.AmountPenalty as float) / 100), MONTH(p.Date)
from Customer c 
  left join Salary s on c.Cust_Id = s.Cust_Id
  left join Penalty p on c.Cust_Id = p.CustomerId
where MONTH(s.Date) = MONTH(P.DATE)
group by c.NameUser, MONTH(s.Date), MONTH(p.Date)
go






