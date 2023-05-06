create database IceRink
go
use IceRink
go
SET DATEFORMAT DMY
go

create table PriceList								/*�������*/
(
PriceID int identity (1,1) primary key,
Name varchar (40) not null,				/*����� �������*/
Cost money,				/*������� �������*/
);

create table Subdivision			/*ϳ������ ���������*/		
(
SubID int identity (1,1) primary key,		
KindOfActivity varchar (40) not null,		/*��� ��������*/
Salary money,				/*��������*/
);

create table Staff								/*��������*/
(
StaffID int identity (1,1) primary key,
Name varchar (20) not null,			/*��'�*/
Surname varchar (20) not null,      /*�������*/
PhoneNumber varchar (20) not null,		/*����� ��������*/
KindOfActivity int foreign key references Subdivision(SubID),		/*��� �������� �� ��������*/
);

create table SessionsDetails			/*����� ������*/
(
SessionDID int identity (1,1) primary key,
Cost money,				/*������� ������*/
KindOfSession varchar (30) not null,        /*��� ������*/
);

create table Sessions			/*������*/
(
SessionID int identity (1,1) primary key,
Data date not null,				/*���� ���������� ������*/
Time time not null,			/*��� ������*/
KindOfSession int foreign key references SessionsDetails(SessionDiD),	/*��� ������ �� ����*/
);

create table Equipment				/*����������*/
(
EquipmentID int identity (1,1) primary key,
Name varchar (50) not null,				/*����� ����������*/
Quantity int not null,			/*ʳ������ ���������� ������ ����*/
Cost money,					/*������� �������*/
Responsible int foreign key references Staff(StaffID),			/*³����������� �� ����������*/
);

create table Receipt		/*���*/
(
ReceiptID int identity (1,1) primary key,
Number int not null,				/*����� ����*/
Information int foreign key references Sessions(SessionID),		/*���������� � ������*/
);

create table ReceiptDetails		/*����� ����*/
(	
ReceiptDID int identity (1,1) primary key,
Number int foreign key references Receipt(ReceiptID),		/*������� ���������� ����*/
PriceList int foreign key references PriceList(PriceID),		/*�������*/
Equipment int foreign key references Equipment(EquipmentID),	/*����������*/
Instructor int foreign key references Staff(StaffID),		/*����������, ���� ��� �������*/
);


Insert into PriceList(Name,Cost)
	values('������ �������',80);
Insert into PriceList(Name,Cost)
	values('������ ������',90);
Insert into PriceList(Name,Cost)
	values('������ ������',70);
Insert into PriceList(Name,Cost)
	values('������ ��������� ��� �������',100);
Insert into PriceList(Name,Cost)
	values('������ ������� �����',250);
Insert into PriceList(Name,Cost)
	values('���������� � ������������ (�����)',250);
Insert into PriceList(Name,Cost)
	values('���������� � ������������ (����)',400);
Insert into PriceList(Name,Cost)
	values('����������� �������',90);



Insert into Subdivision(KindOfActivity,Salary)
	values('���� ������ ��� ������� �����',9000);
Insert into Subdivision(KindOfActivity,Salary)
	values('������������(��)',7500);
Insert into Subdivision(KindOfActivity,Salary)
	values('������',9000);
Insert into Subdivision(KindOfActivity,Salary)
	values('��������������',9000);
Insert into Subdivision(KindOfActivity,Salary)
	values('������',12000);
Insert into Subdivision(KindOfActivity,Salary)
	values('��������',15000);


Insert into Staff(Surname,Name,PhoneNumber,KindOfActivity)
	values('�������','�����','+380956724373',1);
Insert into Staff(Surname,Name,PhoneNumber,KindOfActivity)
	values('�������','������','+380503443365',2);
Insert into Staff(Surname,Name,PhoneNumber,KindOfActivity)
	values('�����','���������','+380687435795',1);
Insert into Staff(Surname,Name,PhoneNumber,KindOfActivity)
	values('ͳ�������','����','+380688035124',2);
Insert into Staff(Surname,Name,PhoneNumber,KindOfActivity)
	values('������','�����','+380508734573',4);
Insert into Staff(Surname,Name,PhoneNumber,KindOfActivity)
	values('��������','����������','+380607444483',5);
Insert into Staff(Surname,Name,PhoneNumber,KindOfActivity)
	values('��������','������','+380687300378',5);
Insert into Staff(Surname,Name,PhoneNumber,KindOfActivity)
	values('�������','����������','+380951580675',5);
Insert into Staff(Surname,Name,PhoneNumber,KindOfActivity)
	values('���������','����','+380506778036',3);
Insert into Staff(Surname,Name,PhoneNumber,KindOfActivity)
	values('�����','�����','+380956254836',6);



Insert into SessionsDetails(KindOfSession, Cost)
	values('������ �������',80);
Insert into SessionsDetails(KindOfSession, Cost)
	values('��������',50);
Insert into SessionsDetails(KindOfSession, Cost)
	values('����������� ��������',150);
Insert into SessionsDetails(KindOfSession, Cost)
	values('����������',250);
Insert into SessionsDetails(KindOfSession, Cost)
	values('������������ �������',400);

	

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
	values('�������',100,80,4);
Insert into Equipment(Name,Quantity,Cost,Responsible)
	values('������',50,70,4);
Insert into Equipment(Name,Quantity,Cost,Responsible)
	values('�����',80,90,4);
Insert into Equipment(Name,Quantity,Cost,Responsible)
	values('������� �����',50,250,4);
Insert into Equipment(Name,Quantity,Cost,Responsible)
	values('�������� ��� �������',60,100,4);



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
Select pl.Name as '����� �������', cast (pl.Cost as varchar)as '������� �������'	/*���������� � �������� ������� ���� ������, �� ��������� �� ������.*/
	from PriceList pl
end

Create proc p_staff
as
begin
Select sf.Name as '����� �����������', sf.Surname as '�������', sf.PhoneNumber as '����� ��������', sub.KindOfActivity as '��� ��������', cast(sub.Salary as varchar)as '��������'
	from Staff sf																	
		inner join Subdivision sub on sf.KindOfActivity = sub.SubID					/*���������� � �������� ����� �� ������������.*/
end

Create proc p_sea
as
begin
Select ss.Time as '���', ssd.KindOfSession as '��� ������'
	from Sessions ss																/*���������� � �������� ������ �� �������� ����.*/
		inner join SessionsDetails ssd on ss.KindOfSession = ssd.SessionDID
			where ss.Data = '15.12.2021'
end

Create proc p_equip
as
begin
Select eq.Name as '�����', eq.Quantity as 'ʳ������', cast(eq.Cost as varchar)as 'ֳ��', sf.Name as '³�����������', sf.Surname as '������� �������������'
	from Equipment eq
		inner join Staff sf on eq.Responsible = sf.StaffID
end

Create proc p_receipt
as
begin
Select rc.Number as '����� ����', pl.Name as '����� �������',cast(pl.Cost as varchar)as 'ֳ�� �������', eq.Name as '����� ����������',cast(eq.Cost as varchar)as 'ֳ�� ����������', sf.Name as '����� �����������', sf.Surname as '������� �����������',ss.Data as '���� ������', ss.Time as '��� ������', ssd.KindOfSession as '��� ������', cast(ssd.Cost as varchar)as 'ֳ�� ������'
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
Select ss.Data as '����' , ss.Time as '���', ssd.KindOfSession as '��� ������'
	from Sessions ss
	inner join SessionsDetails ssd on ss.KindOfSession = ssd.SessionDID
Where ss.Data = isnull(@date, ss.Data) and ssd.KindOfSession =isnull(@kind, ssd.KindOfSession)
End


Create proc p_equipment
@name varchar (30) = null
As
Begin
Select eq.Name as '����� ����������', COUNT(rcd.Equipment) as '�i���i��� ������������� ����������'
	from ReceiptDetails rcd
	inner join Receipt rc on rcd.Number = rc.ReceiptID
	inner join Equipment eq on rcd.Equipment = eq.EquipmentID
	inner join Sessions ss on rc.Information = ss.SessionID
	Where eq.Name = isnull(@name, eq.Name)
Group by eq.Name
End



