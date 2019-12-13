
select u.UserName, u.FirstName, u.CreateDate, u.[Status], u.UserName + u.FirstName as qwerty
from UserData as u
go

select * 
from UserData
go

select *
from UserData as u, UserGroupLink l, UserGroup p
where u.UserDataId = l.UserDataId
and l.UserGroupId = p.UserGroupId
go
