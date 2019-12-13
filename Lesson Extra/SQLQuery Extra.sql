
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
select 'Ford', 'Sedan', '2016-12-01', NULL, 2, 111
go

alter table Car
add IdUser INT NOT NULL
go

alter table Car
add constraint FK_Car_IdUser_UserData_UserDataId FOREIGN KEY (IdUser) REFERENCES UserData (UserDataId)
go

update Car set IdUser = 1
where id = 2
go

select * 
from UserData u, Car c
where u.UserDataId = c.IdUser
go





