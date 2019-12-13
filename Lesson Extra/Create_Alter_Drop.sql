select *
from UserData
go

create table Car (
	Id INT IDENTITY(1,1) NOT NULL,
	Model VARCHAR(50) NOT NULL,
	[Type] VARCHAR(50) NOT NULL,
	CreateDate Date NOT NULL,
	Complection INT,
	Color INT NOT NULL
)
go

select *
from Car 
go

insert into Car
select 'BMW', 'X5', '2016-12-01', 1, 1, (select * from getUserId('admin'))
go

alter table Car
add IdUser INT NOT NULL
go

alter table Car
add constraint FK_Car_IdUser_UserData_UserDataId FOREIGN KEY (IdUser) REFERENCES UserData (UserDataId)
go

update Car set IdUser = (select * from getUserId('smart'))
where Model = 'BMW'
go

select *
from Car 
where Model = 'BMW'

select *
from UserData u, Car c, Color l
where u.UserDataId = c.IdUser
and c.Color = l.idColor
go

create table Color (
	IdColor INT NOT NULL,
	Name VARCHAR(30) NOT NULL
	CONSTRAINT PK_Color_IdColor PRIMARY KEY (IdColor),
	CONSTRAINT UQ_Color_Name UNIQUE (Name)
)
go

insert into Color
select 1, 'Black'
union all
select 2, 'White'
union all
select 3, 'Red'
union all
select 4, 'Green'
go

select * from Car
go

alter table Car
add constraint FK_Car_Color_Color_IdColor FOREIGN KEY (Color) REFERENCES Color (IdColor)
go

alter table Car
add constraint UQ_Car_IdUser UNIQUE (idUser)
go

drop table UserData