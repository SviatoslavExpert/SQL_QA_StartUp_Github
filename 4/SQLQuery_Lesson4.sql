



select c.NameUser, c.Resident, c.Country, (select t.TXT
                                           from Country t
										   where t.K040 = c.Country),
                  q.Data_doc, q.DebAcc, q.CredAcc, q.Currency, q.Amount, q.txt, q.Status
from Customer c, (select p.Data_doc, p.DebAcc, p.CredAcc, p.Currency, p.Amount, p.txt, a.Status, a.Cust_Id
					from Payment p, Account a
					where p.DebAcc = a.Account 
					and p.TXT like '%обсязі%') q
where c.Cust_Id = q.Cust_Id
go


select *
from Customer c
where c.Cust_Id in (select a.Cust_Id
                    from Account a
					where a.Account like '%2650')
go

select a.Cust_Id
from Account a
go







select c.NameUser, c.Resident, c.Country,
        case
		    when c.Resident = 'R' then 'Резидент'
			else 'Нерезидент'
		end as rez
from Customer c
go

select *
from Country t
go


select *
from Payment p, Account a
where p.DebAcc = a.Account 
and p.TXT like '%обсязі%'
go 

select p.Data_doc, p.DebAcc, p.CredAcc, p.Currency, p.Amount, p.txt, a.Status
from Payment p, Account a
where p.DebAcc = a.Account 
and p.TXT like '%обсязі%'
go 

select p.Data_doc, p.Currency, count(*)
from Payment p
group by p.Data_doc, p.Currency
order by p.Data_doc desc
go



select p.Data_doc, p.Currency, count(*)
from Payment p
group by p.Data_doc, p.Currency
order by count(*) desc
go


--  считает количество строк
select count(*)
from Payment
go


select count(*), count(7), count(a.CloseDate)
from Account a
go
--  *  и  7  -  считает количество строк

--  когда указываем поле, считает вариации в поле кроме null

select p.Data_doc, p.Currency, count(*)
from Payment p
where p.Data_doc > '2011-05-22'
group by p.Data_doc, p.Currency
having count(*) > 30
--order by count(*) desc
go

--  having , group by - для агрегированных данных

select p.Data_doc, p.Currency, min(p.Amount) as mn, max(p.Amount) as mx, count(*), sum(p.amount), avg(p.amount)
from Payment p
group by p.Data_doc, p.Currency
having min(p.amount) > 2000
go

select p.Currency, count(*)
from Payment p
where p.Data_doc > '2011-05-22'
group by p.Currency
having count(*) > 100
go


select p.txt, len(p.txt)
from Payment p
go


select p.txt, len(p.txt)
from Payment p
where len(p.txt) > 45
go

select p.txt, RIGHT(p.txt, 6)
from Payment p
where RIGHT(p.txt, 6) = 'обсязі'
go













