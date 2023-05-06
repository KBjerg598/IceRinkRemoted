create database IceRink
go
use IceRink
go
SET DATEFORMAT DMY
go

create table PriceList								/*Послуги*/
(
PriceID int identity (1,1) primary key,
Name varchar (40) not null,				/*Назва послуги*/
Cost money,				/*Вартість послуги*/
);

create table Subdivision			/*Підрозділ персоналу*/		
(
SubID int identity (1,1) primary key,		
KindOfActivity varchar (40) not null,		/*Вид діяльності*/
Salary money,				/*Зарплата*/
);

create table Staff								/*Персонал*/
(
StaffID int identity (1,1) primary key,
Name varchar (20) not null,			/*Ім'я*/
Surname varchar (20) not null,      /*Прізвище*/
PhoneNumber varchar (20) not null,		/*Номер телефону*/
KindOfActivity int foreign key references Subdivision(SubID),		/*Вид діяльності та зарплата*/
);

create table SessionsDetails			/*Деталі сеансу*/
(
SessionDID int identity (1,1) primary key,
Cost money,				/*Вартість сеансу*/
KindOfSession varchar (30) not null,        /*Вид сеансу*/
);

create table Sessions			/*Сеанси*/
(
SessionID int identity (1,1) primary key,
Data date not null,				/*Дата проведення сеансу*/
Time time not null,			/*Час сеансу*/
KindOfSession int foreign key references SessionsDetails(SessionDiD),	/*Вид сеансу та ціна*/
);

create table Equipment				/*Обладнання*/
(
EquipmentID int identity (1,1) primary key,
Name varchar (50) not null,				/*Назва екіпірування*/
Quantity int not null,			/*Кількість обладнання даного виду*/
Cost money,					/*Вартість прокату*/
Responsible int foreign key references Staff(StaffID),			/*Відповідальний за обладнання*/
);

create table Receipt		/*Чек*/
(
ReceiptID int identity (1,1) primary key,
Number int not null,				/*Номер чека*/
Information int foreign key references Sessions(SessionID),		/*Інформація з сеансу*/
);

create table ReceiptDetails		/*Деталі чеку*/
(	
ReceiptDID int identity (1,1) primary key,
Number int foreign key references Receipt(ReceiptID),		/*Основна інформація чеку*/
PriceList int foreign key references PriceList(PriceID),		/*Послуга*/
Equipment int foreign key references Equipment(EquipmentID),	/*Обладнання*/
Instructor int foreign key references Staff(StaffID),		/*Інструктор, якщо був обраний*/
);


Insert into PriceList(Name,Cost)
	values('Прокат ковзанів',80);
Insert into PriceList(Name,Cost)
	values('Прокат шолома',90);
Insert into PriceList(Name,Cost)
	values('Прокат ключки',70);
Insert into PriceList(Name,Cost)
	values('Прокат тренажера для катання',100);
Insert into PriceList(Name,Cost)
	values('Прокат хокейної форми',250);
Insert into PriceList(Name,Cost)
	values('Тренування з інструктором (Група)',250);
Insert into PriceList(Name,Cost)
	values('Тренування з інструктором (Один)',400);
Insert into PriceList(Name,Cost)
	values('Заточування ковзанів',90);



Insert into Subdivision(KindOfActivity,Salary)
	values('Водій машини для заливки льоду',9000);
Insert into Subdivision(KindOfActivity,Salary)
	values('Прибиральник(ця)',7500);
Insert into Subdivision(KindOfActivity,Salary)
	values('Кассир',9000);
Insert into Subdivision(KindOfActivity,Salary)
	values('Інвентаризатор',9000);
Insert into Subdivision(KindOfActivity,Salary)
	values('Тренер',12000);
Insert into Subdivision(KindOfActivity,Salary)
	values('Менеджер',15000);


Insert into Staff(Surname,Name,PhoneNumber,KindOfActivity)
	values('Антонов','Сергій','+380956724373',1);
Insert into Staff(Surname,Name,PhoneNumber,KindOfActivity)
	values('Смірнова','Наталія','+380503443365',2);
Insert into Staff(Surname,Name,PhoneNumber,KindOfActivity)
	values('Мухін','Володимир','+380687435795',1);
Insert into Staff(Surname,Name,PhoneNumber,KindOfActivity)
	values('Ніконенко','Олег','+380688035124',2);
Insert into Staff(Surname,Name,PhoneNumber,KindOfActivity)
	values('Коваль','Андрій','+380508734573',4);
Insert into Staff(Surname,Name,PhoneNumber,KindOfActivity)
	values('Яковенко','Олександра','+380607444483',5);
Insert into Staff(Surname,Name,PhoneNumber,KindOfActivity)
	values('Шевченко','Богдан','+380687300378',5);
Insert into Staff(Surname,Name,PhoneNumber,KindOfActivity)
	values('Хоменко','Владислава','+380951580675',5);
Insert into Staff(Surname,Name,PhoneNumber,KindOfActivity)
	values('Степанова','Марія','+380506778036',3);
Insert into Staff(Surname,Name,PhoneNumber,KindOfActivity)
	values('Клімов','Данил','+380956254836',6);



Insert into SessionsDetails(KindOfSession, Cost)
	values('Масове катання',80);
Insert into SessionsDetails(KindOfSession, Cost)
	values('Змагання',50);
Insert into SessionsDetails(KindOfSession, Cost)
	values('Розважальна програма',150);
Insert into SessionsDetails(KindOfSession, Cost)
	values('Тренування',250);
Insert into SessionsDetails(KindOfSession, Cost)
	values('Індивідуальне заняття',400);

	

Insert into Sessions(Data,Time,KindOfSession)
	values('12.12.2021','12:00:00',1);
Insert into Sessions(Data,Time,KindOfSession)
	values('13.12.2021','14:30:00',4);
Insert into Sessions(Data,Time,KindOfSession)
	values('14.12.2021','10:30:00',2);
Insert into Sessions(Data,Time,KindOfSession)
	values('15.12.2021','16:45:00',3);
Insert into Sessions(Data,Time,KindOfSession)
	values('16.12.2021','15:00:00',5);
Insert into Sessions(Data,Time,KindOfSession)
	values('17.12.2021','18:00:00',5);
Insert into Sessions(Data,Time,KindOfSession)
	values('18.12.2021','17:20:00',1);
Insert into Sessions(Data,Time,KindOfSession)
	values('19.12.2002','13:30:00',1);
Insert into Sessions(Data,Time,KindOfSession)
	values('20.12.2021','14:00:00',2);
Insert into Sessions(Data,Time,KindOfSession)
	values('21.12.2021','20:00:00',4);
Insert into Sessions(Data,Time,KindOfSession)
	values('12.12.2021','15:00:00',1);
Insert into Sessions(Data,Time,KindOfSession)
	values('13.12.2021','11:30:00',4);
Insert into Sessions(Data,Time,KindOfSession)
	values('14.12.2021','13:30:00',2);
Insert into Sessions(Data,Time,KindOfSession)
	values('15.12.2021','18:45:00',3);
Insert into Sessions(Data,Time,KindOfSession)
	values('16.12.2021','17:00:00',5);
Insert into Sessions(Data,Time,KindOfSession)
	values('17.12.2021','20:00:00',5);
Insert into Sessions(Data,Time,KindOfSession)
	values('18.12.2021','19:20:00',1);
Insert into Sessions(Data,Time,KindOfSession)
	values('19.12.2002','16:30:00',1);
Insert into Sessions(Data,Time,KindOfSession)
	values('20.12.2021','17:00:00',2);
Insert into Sessions(Data,Time,KindOfSession)
	values('21.12.2021','13:00:00',4);
Insert into Sessions(Data,Time,KindOfSession)
	values('15.12.2021','15:45:00',1);
Insert into Sessions(Data,Time,KindOfSession)
	values('15.12.2021','13:45:00',4);
Insert into Sessions(Data,Time,KindOfSession)
	values('15.12.2021','10:45:00',5);
Insert into Sessions(Data,Time,KindOfSession)
	values('15.12.2021','12:45:00',3);
Insert into Sessions(Data,Time,KindOfSession)
	values('12.12.2021','09:00:00',3);
Insert into Sessions(Data,Time,KindOfSession)
	values('13.12.2021','10:30:00',3);
Insert into Sessions(Data,Time,KindOfSession)
	values('14.12.2021','12:30:00',3);


Insert into Equipment(Name,Quantity,Cost,Responsible)
	values('Ковзани',100,80,4);
Insert into Equipment(Name,Quantity,Cost,Responsible)
	values('Ключка',50,70,4);
Insert into Equipment(Name,Quantity,Cost,Responsible)
	values('Шолом',80,90,4);
Insert into Equipment(Name,Quantity,Cost,Responsible)
	values('Хокейна форма',50,250,4);
Insert into Equipment(Name,Quantity,Cost,Responsible)
	values('Тренажер для катання',60,100,4);



Insert into Receipt(Number,Information)
	values(103,1);
Insert into Receipt(Number,Information)
	values(56,2);
Insert into Receipt(Number,Information)
	values(34,3);
Insert into Receipt(Number,Information)
	values(93,4);
Insert into Receipt(Number,Information)
	values(47,5);
Insert into Receipt(Number,Information)
	values(84,6);
Insert into Receipt(Number,Information)
	values(49,7);
Insert into Receipt(Number,Information)
	values(36,8);
Insert into Receipt(Number,Information)
	values(127,9);
Insert into Receipt(Number,Information)
	values(83,10);



Insert into ReceiptDetails(Number,PriceList,Equipment,Instructor)
	values(1,1,5,6);
Insert into ReceiptDetails(Number,PriceList,Equipment,Instructor)
	values(2,6,1,8);
Insert into ReceiptDetails(Number,PriceList,Equipment,Instructor)
	values(3,3,2,8);
Insert into ReceiptDetails(Number,PriceList,Equipment,Instructor)
	values(4,4,4,7);
Insert into ReceiptDetails(Number,PriceList,Equipment,Instructor)
	values(5,7,1,8);
Insert into ReceiptDetails(Number,PriceList,Equipment,Instructor)
	values(6,7,1,6);
Insert into ReceiptDetails(Number,PriceList,Equipment,Instructor)
	values(7,2,3,8);
Insert into ReceiptDetails(Number,PriceList,Equipment,Instructor)
	values(8,1,1,7);
Insert into ReceiptDetails(Number,PriceList,Equipment,Instructor)
	values(9,5,4,7);
Insert into ReceiptDetails(Number,PriceList,Equipment,Instructor)
	values(10,6,4,6);


Create proc p_posl
as
begin
Select pl.Name as 'Назва послуги', cast (pl.Cost as varchar)as 'Вартість послуги'	/*Формування і перегляд переліку типів послуг, що надаються на каткові.*/
	from PriceList pl
end

Create proc p_staff
as
begin
Select sf.Name as 'Імена співробітників', sf.Surname as 'Прізвище', sf.PhoneNumber as 'Номер телефону', sub.KindOfActivity as 'Вид діяльності', cast(sub.Salary as varchar)as 'Зарплата'
	from Staff sf																	
		inner join Subdivision sub on sf.KindOfActivity = sub.SubID					/*Формування і перегляд даних по співробітниках.*/
end

Create proc p_sea
as
begin
Select ss.Time as 'Час', ssd.KindOfSession as 'Вид сеансу'
	from Sessions ss																/*Формування і перегляд сеансів на поточний день.*/
		inner join SessionsDetails ssd on ss.KindOfSession = ssd.SessionDID
			where ss.Data = '15.12.2021'
end

Create proc p_equip
as
begin
Select eq.Name as 'Назва', eq.Quantity as 'Кількість', cast(eq.Cost as varchar)as 'Ціна', sf.Name as 'Відповідальний', sf.Surname as 'Прізвище відповідального'
	from Equipment eq
		inner join Staff sf on eq.Responsible = sf.StaffID
end

Create proc p_receipt
as
begin
Select rc.Number as 'Номер чеку', pl.Name as 'Назва послуги',cast(pl.Cost as varchar)as 'Ціна послуги', eq.Name as 'Назва обладнання',cast(eq.Cost as varchar)as 'Ціна обладнання', sf.Name as 'Імена інструкторів', sf.Surname as 'Прізвища інструкторів',ss.Data as 'Дата сеансу', ss.Time as 'Час сеансу', ssd.KindOfSession as 'Вид сеансу', cast(ssd.Cost as varchar)as 'Ціна сеансу'
	from ReceiptDetails rcd
		inner join Receipt rc on rcd.Number = rc.ReceiptID
		inner join PriceList pl on rcd.PriceList = pl.PriceID
		inner join Equipment eq on rcd.Equipment = eq.EquipmentID
		inner join Staff sf on rcd.Instructor = sf.StaffID
		inner join Sessions ss on rc.Information = ss.SessionID
		inner join SessionsDetails ssd on ss.KindOfSession = ssd.SessionDID
end

Create proc p_seans
@date date = null,
@kind varchar (30) = null
As
Begin
Select ss.Data as 'Дата' , ss.Time as 'Час', ssd.KindOfSession as 'Вид сеансу'
	from Sessions ss
	inner join SessionsDetails ssd on ss.KindOfSession = ssd.SessionDID
Where ss.Data = isnull(@date, ss.Data) and ssd.KindOfSession =isnull(@kind, ssd.KindOfSession)
End


Create proc p_equipment
@name varchar (30) = null
As
Begin
Select eq.Name as 'Назва обладнання', COUNT(rcd.Equipment) as 'Кiлькiсть використаного обладнання'
	from ReceiptDetails rcd
	inner join Receipt rc on rcd.Number = rc.ReceiptID
	inner join Equipment eq on rcd.Equipment = eq.EquipmentID
	inner join Sessions ss on rc.Information = ss.SessionID
	Where eq.Name = isnull(@name, eq.Name)
Group by eq.Name
End



