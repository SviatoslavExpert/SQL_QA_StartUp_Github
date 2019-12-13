USE TrainingCenter
GO

--  ======================================================

--    HOMEWORK

--  ======================================================

--  1. ������� ����� ������� ���� � ������� Course.


insert into Course
select 500, 'P500', '������ Java', '��������� ����� Java', 5700.00, 'A'
go

select *
from Course
where Code = 'P500'
go


/*  

    2. ������� �������� �������������� ����� (�.1.) � ������� CourseContent (3 ������). 
       �������������� ��������������� �������, ���������� ��� �� ������� ������ ��������� ���������� ������.
       ������������� ����������� �������� ���������� CourseContent  ��� ������ "Course_CourseContent_������.docx".   

*/


insert into CourseContent
select 500, 1, 1, '1', 'UN', '�������� � ��������� ����� Java', '������� ����������'
union all
select 500, 2, 1, 'A', 'CH', '���� ������ � Java', '������� ���� ������'
union all
select 500, 3, 1, 'B', 'CH', '�������� ���������', 'if, if else'
go

select *
from CourseContent cc, Course c
where cc.CourseId = c.CourseId
and c.Code = 'P500'
go


/*
   3. ������� ����� ������� ������ � ������� UserGroup 
   (���������������� ����� ������ Course � UserGroup. 
   ����������� ������ 2-Create_Tables.sql � ��������� �� ��� �������� ������).
*/


insert into UserGroup
select 500, '������ �5. ������ ������� ���. ����� 12.10.2019', '2019-12-12  11:25:09.977 AM', '2019-07-05  10:25:07.955 AM', 'A'
go

select *
from UserGroup
where Name = '������ �5. ������ ������� ���. ����� 12.10.2019'
go


--  4. �������� 2 ����� ������������ � ������� UserData �� �������� 'D'.


select *
from UserData
go

insert into UserData
select 'miketyson', '1ghf57dkt', '�����', '����������', '����������', '2019-12-01  10:34:09 AM', '2019-12-7  11:45:09 AM', 'D'
union
select 'spiderman', '9fgh5lk7', '���������', '���������', '��������', '2019-10-09  10:34:09.799 AM', '2019-11-10  11:45:09.977 AM', 'D'
go

select *
from UserData
where UserName in ('miketyson','spiderman')
go


--  5. �������� ��� 2 ������������ � ������� UserData � ������ ���������� ��������.


insert into UserData
select 'superstar', 'password01', '����', '��������', '����������', '2019-10-02  10:34:09.977 AM', '2019-11-03  11:45:09.955 AM', 'A'
union
select 'sniper', 'password99dfg', '������', '����������', '���������', '2019-12-12  11:25:09.977 AM', '2019-07-05  10:25:07.955 AM', 'A'
go

select *
from UserData
where UserName in ('superstar','sniper')
go


/* 6. ������� ����� 4-� ����� ������������� � ������� (����� ������ � ������ UserGroup � UserData ����� ������� UserGroupLink). 

    ��� ����������� �������������� ������������, ������������ ��������� ������������ ������� getUserId.
    ������ �� ������������� ���� � ������� 3 - Insert_Tables.sql ��� ������� � ������� "[UserRoleLink] inserts".
    �������, ��� ������������� ��������, ��� �� �������� ������� ����������� ������������� ������������, ������� � ��� � � ���� ����� ����������.
*/


insert into UserGroupLink (UserGroupId, UserDataId)
SELECT (SELECT UserGroupId from UserGroup where Name = '������ �5. ������ ������� ���. ����� 12.10.2019'),
         (SELECT * FROM getUserId ('miketyson'))
UNION ALL
SELECT (SELECT UserGroupId from UserGroup where Name = '������ �5. ������ ������� ���. ����� 12.10.2019'),
         (SELECT * FROM getUserId ('spiderman'))
UNION ALL
SELECT (SELECT UserGroupId from UserGroup where Name = '������ �5. ������ ������� ���. ����� 12.10.2019'),
         (SELECT * FROM getUserId ('superstar'))
UNION ALL
SELECT (SELECT UserGroupId from UserGroup where Name = '������ �5. ������ ������� ���. ����� 12.10.2019'),
         (SELECT * FROM getUserId ('sniper'))
go

select *
from UserGroupLink
WHERE UserGroupId = (SELECT UserGroupId from UserGroup where Name = '������ �5. ������ ������� ���. ����� 12.10.2019')
go



/*  7. �������� ������ �� '��������' ��� ����� ������������� ������������� � ������� ������ 'D', 
    � ����� ���������� ���� ��������� ������ ����� ������� CURRENT_TIMESTAMP, 
	������� ������������ �� ����� (� ���� UpdateDate).
*/

update UserData set [Status] = 'A'
where UserName = 'miketyson'
go

update UserData set UpdateDate = CURRENT_TIMESTAMP
where UserName = 'miketyson' 
go

update UserData set [Status] = 'A'
where UserName = 'spiderman'
go

update UserData set UpdateDate = CURRENT_TIMESTAMP
where UserName = 'spiderman' 
go

select *
from UserData
go 


/*
  8. ������� ���� ������������� �� ����� ������ � ������ �����, 
  ������������ �� ����� ������������ (FirstName). 
  
  ������� ������ ��� �������: UserName, FirstName, MiddleName, LastName, [Name] as GroupName 
  (������� � ������� UserGroup), Title (������� Course).

  ������ �������� SELECT � ������ FROM �������� ����� �������� 4 ������� 
  (UserData, UserGroupLink, UserGroup, Course), 
  ����� � ������� WHERE � AND ���������� ������� ��� ������� �� ���������� ��������������� ������.

  ��� �� �������� �������������� ������� ���������� (AND) �� �������������� ����� ������, 
  ��� �� ������� ������ ����� 4-� ��������� �� ����� ������.
  ����������, ��� �������������� ������� � ����� ����� �������: ORDER BY FirstName.

*/

select u.UserName, u.FirstName, u.MiddleName, u.LastName, [Name] as GroupName, c.Title
from UserData u, UserGroupLink l, UserGroup g, Course c
where u.UserDataId = l.UserDataId and l.UserGroupId = g.UserGroupId 
                                  and g.CourseId = c.CourseId
								  and g.Name = '������ �5. ������ ������� ���. ����� 12.10.2019'
ORDER BY u.FirstName
go 


/*
9. ������� ����� ������������� � ��, ��������� ������ � ��������� ����� � ����. 
����� ����� ��������� ������ �  �������� �������. 
������ ��� ������������ ������� �� ���������, ������ ��� �� ����� ������ � ������������� �������.
���������� �������� �� UserName � ������� UserData. 
��� ���� ��������� � �������� ������ ��� ������������, �������� �� �������� � ������� 
WHERE UserName  = '����� ������������' ��� ����� IN ('','','') ������ �������� ������� 
�������������. ��� �� ����� ������������ �������, �� ���� ����������.
*/


delete 
from UserGroupLink
where UserGroupId = (select UserGroupId from UserGroup where CourseId = 500)
go

select *
from UserGroupLink
where UserGroupId = (select UserGroupId from UserGroup where CourseId = 500)
go

-----------------------------

delete
from UserGroup
where CourseId = 500
go

select *
from UserGroup
where CourseId = 500
go

delete 
from CourseContent
where CourseId = 500
go

select *
from CourseContent
where CourseId = 500
go

delete 
from Course
where Code = 'P500'
go

select *
from Course
go

delete 
from UserData
where UserName in ('miketyson','spiderman', 'superstar', 'sniper')
go

select *
from UserData
go





/*
================================================================================
   
�������� ��������� ��������.
��� ������ �������� �������� SELECT � ��������.

================================================================================
*/

-- 1. ����� ��������� � ������� Payment, ��� ����� (Amount)  ������ ����� 26024.92.

select *
from Payment
where amount >= 26024.92
go

-- 2. ����� ��������� � ������� Payment, ��� ���������� ������� (TXT) ����� ����� '�������' 
--     � ����� �������� ������, � ������ (Currency) ���������� ����� ���� '978', '980'.

select *
from Payment
where TXT like '%�������%' 
          and Currency IN ('978','980')  
go


-- 3. ����� ��������� � ������� Payment, ��� ���� ��������� ����� 2010-02-11 � 2011-05-22, 
--    � ������ ���������� �� ����� 980.

select * 
from Payment
where Data_doc between '2010-02-11' and '2011-05-22' 
               and Currency != '980'
go


-- 4. ����� ��������� � ������� Payment, ��� ����� ����� (DebAcc) ����� �����  
--    ����� ����� '260070001','260088791','260006443'.


select * 
from Payment
where DebAcc IN ('260070001','260088791', '260006443') 
go

/*
  5. ����� ��������� � ������� Payment, ��� ����� ����� (DebAcc) ����� �����  
����� ����� '260070001','260088791','260006443'. ��� ���� ������� ����� ��������� Amount 
���������� �� 3 � �� ���� ����� ������ 1000.
*/

select Amount * 3 - 1000
from Payment
where DebAcc IN ('260070001','260088791', '260006443') 
go


/*
6. ������� ����� � ������� Account, ��� (������ (Status) ����� 'O' 
   � ���� �������� OpenDate ����� 2016-01-21) ��� ���� �������� CloseDate ������� �� NULL. 
   ����� �������� �������� �� ������ � �������.
*/

select * 
from Account
where ([Status] = 'O' and OpenDate = '2016-01-21')
                     or CloseDate is not NULL
go


--  7. ������� ����� � ������� Account, ��� ������ (Status) ����� 'O' 
--     � (���� �������� OpenDate ����� 2016-01-21 ��� ���� �������� CloseDate ������� �� NULL). 
--     ����� �������� �������� �� ������ � �������.

select * 
from Account
where [Status] = 'O' and (OpenDate = '2016-01-21'
                     or CloseDate is not NULL)
go


--  8. ������� ������������� � ������� Customer � Salary, � ������� �� '1977-09-26', 
--     ������� ����� � ���� �� ����� '2019-03-31' � '2019-09-30'.

select *
from Customer c, Salary s
where c.Cust_Id = s.Cust_Id
and c.Birthday = '1977-09-26'
and s.Bonus is not null 
and s.Date between '2019-03-31' and '2019-09-30'
go 


/*
9. ������� ���������� � ������������� � ��� ������ � ������ Customer � Account, ���:
	- ������� �����������
	- ���� ���������� �� 2650
	������ ����� �������
	- ������� �����������
	- ��� ������ 980.
���������: ����� ��������� ������������ UNION ��� UNION ALL, 
�� ��� �� ��������� ������ �� ������������� (������������� � ���� ���������� ����������)
���� ��� ������ �����: 
CustomerLogin, NameUser, Resident, Country, Gender, Account, Currency, [Status], OpenDate
������������� �� ���� �������� ����� � �������� �������.
*/

select c.CustomerLogin, c.NameUser, c.Resident , c.Country, c.Gender, a.Account, a.Currency, a.[Status] st, a.OpenDate
from Customer c, Account a
where c.Cust_Id = a.Cust_Id
and c.Resident = 'N' and a.Account like '2650%'
UNION
select c.CustomerLogin, c.NameUser, c.Resident , c.Country, c.Gender, a.Account, a.Currency, a.[Status] st, a.OpenDate
from Customer c, Account a
where c.Cust_Id = a.Cust_Id
and c.Resident = 'N' and a.Currency = '980'
ORDER BY a.OpenDate desc
go

select *
from Customer
go

select *
from Account
go



-- 10. ������� ��� ��������, � ������� ���� ����� �� �� ��� ������� � ��� ���� 
--  ��� ������ �� ���� �����������, � ������ ������� ������.

select *
from Customer c
left join Salary s
on c.Cust_Id = s.Cust_Id
left join Penalty p
on s.Cust_Id = p.CustomerId
where s.Amount is not null and s.Bonus is null 
      and p.AmountPenalty is null
      and c.Status = 'O' 
go


/*
    11. ������ ��� "����������".
����� �������, ���������� ������� ������� ����� �������� ����� "�����".
� ���� �������� ���������� ���� �� ������ DebAcc.
�����, ����� � ������� ������ Account ������ �� �������-��������� �� ���������� ������.
�� �������������� ��������� ����� � �������  Account  ������� ���������� � ������� Customer ���� NameUser.

*/

select NameUser
from Customer c
where c.Cust_Id in (select Cust_Id from Account where Account in 
				    (select DebAcc from Payment where TXT like '%�����%'))				
go
