create database credit
create table username(
	id varchar(10),
	username nvarchar(20),
	pass nvarchar(30),
)
create table Item(
	id int Identity(1,1) primary key,
	Ma varchar(10),
	Ten nvarchar(30),
	soluong int,
	gia money
)

create table Agent(
	id int Identity(1,1) primary key,
	agentId varchar(10),
	agentName nvarchar(30),
	address nvarchar(30),
)

create table Orders(
	id int Identity(1,1) primary key,
	orderId varchar(10),
	orderDate datetime not null default CURRENT_TIMESTAMP,
	agentID varchar(10),
)

create table order_Detail(
	id_detail int Identity(1,1) primary key,
	id varchar(10),
	orderId varchar(10),
	itemId varchar(10),
	quantity int,
	unitAmount int
)

insert into username values('user','Tu','user')

insert into Item values('I0001','Samsung S22',1,19490)
insert into Item values('I0002','Samsung S22+',1,21990)
insert into Item values('I0003','Samsung S22 Ultra',1,25490)
insert into Item values('I0004','Iphone 14 128GB',1,21190)
insert into Item values('I0005','Iphone 14 Plus 512GB',1,23000)
insert into Item values('I0006','Iphone 14 Pro 128GB',1,23090)
insert into Item values('I0007','Iphone 14 Pro Max 1TB',1,29990)
insert into Item values('I0008','Ipad Pro M1 1TB',1,25000)
insert into Item values('I0009','Ipad Pro M2 1TB',1,28000)
insert into Item values('I0010','Ipad Air 5 Wifi 256GB',1,15000)
insert into Item values('I0011','Ipad Mini 6 Wifi 64GB',1,13000)
insert into Item values('I0012','Ipad Mini 6 4G 128GB',1,15000)
insert into Item values('I0013','Samsung Tab S7 256GB',1,13000)
insert into Item values('I0014','Macbook Pro M2 16GB 1TB',1,45000)
insert into Item values('I0015','Macbook Air M2 16GB 512GB',1,35000)

insert into Agent values('A0001','Luong Viet An','Ha Tinh')
insert into Agent values('A0002','Nguyen Khanh Duy','Dong Thap')
insert into Agent values('A0003','Nguyen Hoang Anh Tu','TP Ho Chi Minh')
insert into Agent values('A0004','Chi Dung','Tien Giang')
insert into Agent values('A0005','Ngoc Chau','Tay Ninh')
insert into Agent values('A0006','Thuy Tien','Dong Thap')
insert into Agent values('A0007','Do Ha','Thanh Hoa')
insert into Agent values('A0008','Nguyen Le Ngoc Thao','TP Ho Chi Minh')
insert into Agent values('A0009','Minh Kha','Soc Trang')
insert into Agent values('A0010','Quoc Dat','Khanh Hoa')
insert into Agent values('A0011','Mai Phuong','Dong Nai')
insert into Agent values('A0012','Thanh Tam','TP Ho Chi Minh')
insert into Agent values('A0013','Tien Dung','Da Nang')
insert into Agent values('A0014','Thanh Nhan','Can Tho')
insert into Agent values('A0015','Kim Duyen','Can Tho')

insert into Orders values('OD0001','1/12/2023','A0002')
insert into Orders values('OD0002','2/23/2023','A0002')
insert into Orders values('OD0003','3/25/2023','A0002')
insert into Orders values('OD0004','5/2/2023','A0005')
insert into Orders values('OD0005','7/29/2023','A0006')
insert into Orders values('OD0006','9/4/2023','A0007')
insert into Orders values('OD0007','2/6/2023','A0007')
insert into Orders values('OD0008','4/7/2023','A0007')
insert into Orders values('OD0009','6/12/2023','A0002')
insert into Orders values('OD0010','12/17/2023','A0010')
insert into Orders values('OD0011','10/23/2023','A0011')
insert into Orders values('OD0012','9/3/2023','A0011')
insert into Orders values('OD0013','10/11/2023','A0012')
insert into Orders values('OD0014','12/11/2023','A0013')
insert into Orders values('OD0015','11/12/2023','A0013')

insert into order_Detail values('DETAIL0001','OD0001','I0001',100,100)
insert into order_Detail values('DETAIL0002','OD0001','I0002',100,100)
insert into order_Detail values('DETAIL0003','OD0001','I0002',100,100)
insert into order_Detail values('DETAIL0004','OD0001','I0002',100,100)
insert into order_Detail values('DETAIL0005','OD0002','I0003',100,100)
insert into order_Detail values('DETAIL0006','OD0003','I0002',100,100)
insert into order_Detail values('DETAIL0007','OD0003','I0005',100,100)
insert into order_Detail values('DETAIL0008','OD0004','I0002',100,100)
insert into order_Detail values('DETAIL0009','OD0006','I0010',100,100)
insert into order_Detail values('DETAIL0010','OD0010','I0010',100,100)
insert into order_Detail values('DETAIL0011','OD0010','I0010',100,100)
insert into order_Detail values('DETAIL0012','OD0011','I0012',100,100)
insert into order_Detail values('DETAIL0013','OD0012','I0013',100,100)
insert into order_Detail values('DETAIL0014','OD0014','I0014',100,100)
insert into order_Detail values('DETAIL0015','OD0015','I0015',100,100)

select * from Item

select * from Agent

select * from Orders

select * from order_Detail

select count(*) from Item

select distinct agentName from Agent where agentId in (

select agentId from Orders where orderID in (

select order_Detail.orderId from order_Detail, Item where Item.Ma = order_Detail.itemId

	)
)

select top 3 * from order_Detail ORDER BY itemId DESC


select * from Item where Ma in (

SELECT  top 3 itemId
FROM order_Detail
GROUP BY itemId
HAVING COUNT(itemId) > 0
ORDER BY COUNT(itemId) desc
)
select * from Agent where agentId in (SELECT  top 3 agentId FROM Orders GROUP BY agentId HAVING COUNT(agentId) > 1 ORDER BY COUNT(agentId) desc)


select * from Item

